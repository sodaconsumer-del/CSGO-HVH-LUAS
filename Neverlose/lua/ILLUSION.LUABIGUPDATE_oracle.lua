local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_system_0 = require("neverlose/drag_system");
local l_clipboard_0 = require("neverlose/clipboard");
local _ = require("neverlose/file");
local l_gradient_0 = require("neverlose/gradient");
local l_animations_0 = require("neverlose/animations");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/easing");
local _ = require("neverlose/vmt_hook");
theme_color = function()
    return "\a{Link Active}";
end;
local v10 = {
    fake_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    autopeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_mod_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    free_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    yaw_mod_free = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    yaw_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    min_dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    aaos = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hidden_cvars = ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"), 
    air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    scope_type = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    fl_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    dtlim = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    logs = ui.find("Miscellaneous", "Main", "Other", "Log Events"), 
    yaw_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab")
};
local v11 = render.load_font("Calibri", vector(22, 23.5, 1), "adb");
local _ = "\a{Link Active}";
local _ = "\a{Link}";
local v14 = {
    conditions = {
        [1] = "Global", 
        [2] = "Standing", 
        [3] = "Moving", 
        [4] = "Slow-walking", 
        [5] = "Jumping", 
        [6] = "Jump-crouching", 
        [7] = "Crouching", 
        [8] = "Warmup"
    }, 
    conditions_non_g = {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Slow-walking", 
        [4] = "Jumping", 
        [5] = "Jump-crouching", 
        [6] = "Crouching", 
        [7] = "Warmup"
    }
};
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n");
local v15 = false;
local v16 = false;
local v17 = "";
local v18 = {};
local v19 = l_smoothy_0.new(v18);
local v20 = 0;
local v21 = 0;
local v22 = 1;
local v23 = {};
local v24 = {};
local function v27(v25, v26)
    return function(...)
        -- upvalues: v25 (ref), v26 (ref)
        return v25(v26, ...);
    end;
end;
v24.math_breathe = function(v28, v29)
    return math.abs(math.sin(globals.realtime * (v29 or 1) % math.pi + (v28 or 0)));
end;
v24.typing_text = function(v30, v31)
    local v32 = 0;
    length = #v30:gsub("[\128-\191]", "");
    num = v32;
    result = "";
    for v33 in v30:gmatch(".[\128-\191]*") do
        num = num + 1;
        factor = num / length;
        result = string.format("%s\a%s%s", result, v31(num, length, v33, factor):to_hex(), v33);
    end;
    return result;
end;
v24.gradient_text = function(v34, v35, v36)
    -- upvalues: v24 (ref)
    return v24.typing_text(v34, function(_, _, _, v40)
        -- upvalues: v35 (ref), v36 (ref)
        return v35:lerp(v36, v40);
    end);
end;
v24.gradient = function(v41, v42, v43, v44)
    -- upvalues: v24 (ref)
    return v24.typing_text(v41, function(_, _, _, v48)
        -- upvalues: v24 (ref), v44 (ref), v42 (ref), v43 (ref)
        interpolation = v24.math_breathe(v48, v44);
        return v42:lerp(v43, interpolation);
    end);
end;
v24.static_gradient = function(v49, v50, v51)
    -- upvalues: v24 (ref)
    return v24.gradient_text(v49, v50, v51);
end;
local v52 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
local v53 = v27(ffi.cast("get_client_entity_t", v52[0][3]), v52);
local v54 = ffi.cast(ffi.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"));
local v55 = ffi.cast(ffi.typeof("bool(__thiscall*)(void*)"), v54[0][11]);
local v56 = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
local function v65(v57, v58, v59, v60, v61, ...)
    -- upvalues: v18 (ref), v19 (ref), l_smoothy_0 (ref)
    local _ = table.concat({
        ...
    });
    if v18[v57] == nil then
        v18[v57] = 0;
        v19 = l_smoothy_0.new(v18);
    end;
    local v63 = v19(0.1, {
        [v57] = render.measure_text(v59, nil, ...)
    })[v57];
    local v64 = render.measure_text(v59, nil, ...);
    render.push_clip_rect(vector(v58.x - v64.x, v58.y - v63.y / 2), vector(v58.x + v63.x / 2, v58.y + v63.y / 2), true);
    render.text(v59, vector(v58.x - v63.x / 2, v58.y - v63.y / 2), v60, v61, ...);
    render.pop_clip_rect();
end;
local function _(v66, v67, v68, v69, v70, v71)
    return render.rect(vector(v66, v67), vector(v66 + v68, v67 + v69), v70, v71);
end;
local function v75(v73, v74)
    return function(...)
        -- upvalues: v73 (ref), v74 (ref)
        return v73(v74, ...);
    end;
end;
pcall(function()
    ffi.cdef("        bool DeleteFileA(\n            const char* lpFileName\n        );\n    ");
end);
pcall(function()
    ffi.cdef(" \n    #pragma pack(push)\n    #pragma pack(1)\n        struct WIN32_FIND_DATAA {\n            uint32_t dwFileAttributes;\n            uint64_t ftCreationTime;\n            uint64_t ftLastAccessTime;\n            uint64_t ftLastWriteTime;\n            struct {\n                union {\n                    uint64_t packed;\n                    struct {\n                        uint32_t high;\n                        uint32_t low;\n                    };\n                };\n            } nFileSize;\n            uint32_t dwReserved[2];\n            char cFileName[260];\n            char cAlternateFileName[14];\n        };\n    #pragma pack(pop)\n        void* FindFirstFileA(const char* pattern, struct WIN32_FIND_DATAA* fd);\n        bool FindNextFileA(void* ff, struct WIN32_FIND_DATAA* fd);\n        bool FindClose(void* ff);\n    ");
end);
local v76 = ffi.typeof("struct WIN32_FIND_DATAA");
local v77 = ffi.cast("void*", -1);
getNames = function(v78)
    -- upvalues: v76 (ref), v77 (ref)
    local v79 = {};
    local v80 = ffi.new(v76);
    local v81 = ffi.C.FindFirstFileA(v78, v80);
    if v81 ~= v77 then
        repeat
            table.insert(v79, "" .. ffi.string(v80.cFileName));
        until not ffi.C.FindNextFileA(v81, v80);
        ffi.C.FindClose(ffi.gc(v81, nil));
    end;
    return v79;
end;
local v82 = {};
for v83 in string.gmatch(common.get_game_directory(), "[^\\]+") do
    table.insert(v82, v83);
end;
local v84 = v82[1] .. "/" .. v82[2];
if v82[3] == "steam" then
    v84 = v84 .. "/" .. v82[3];
end;
file_exists = function(v85, v86)
    return ffi.cast("bool (__thiscall*)(void*, const char*, const char*)", ffi.cast(ffi.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"))[0][10])(ffi.cast(ffi.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")), v85, v86);
end;
local v87 = ffi.load("UrlMon");
local v88 = ffi.load("WinInet");
Download = function(v89, v90)
    -- upvalues: v88 (ref), v87 (ref)
    v88.DeleteUrlCacheEntryA(v89);
    v87.URLDownloadToFileA(nil, v89, v90, 0, 0);
end;
CreateDir = function(v91)
    ffi.C.CreateDirectoryA(v91, NULL);
end;
if not file_exists("nl\\Illusion") then
    CreateDir("nl\\Illusion");
end;
if not file_exists("nl\\Illusion\\configs") then
    CreateDir("nl\\Illusion\\configs");
end;
local _ = ffi.typeof("uintptr_t**");
local function _(v93, v94)
    return function(...)
        -- upvalues: v93 (ref), v94 (ref)
        return v93(v94, ...);
    end;
end;
local v96 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("engine.dll", "IEngineSoundClient003"));
local v97 = v75(ffi.cast("void*(__thiscall*)(void*, const char*, float, int, int, float)", v96[0][12]), v96);
local _ = nil;
local v99 = {
    info = {
        info = l_pui_0.create("\239\128\149 Home", " "), 
        icon = l_pui_0.create("\239\128\149 Home", "  ", 2), 
        links = l_pui_0.create("\239\128\149 Home", "LINKS", 1), 
        general = l_pui_0.create("\239\128\149 Home", "   ", 1), 
        configs = l_pui_0.create("\239\128\149 Home", "CONFIGS", 1)
    }, 
    other = {
        other = l_pui_0.create("\239\130\133 General", "\f<bomb> \rSELECTION"), 
        rage = l_pui_0.create("\239\130\133 General", "\239\129\155 \rRAGE"), 
        visuals = l_pui_0.create("\239\130\133 General", "\239\150\169 \rINDICATE"), 
        visuals_1 = l_pui_0.create("\239\130\133 General", "\239\129\174 \rVIEW"), 
        visuals_2 = l_pui_0.create("\239\130\133 General", "\239\132\155 \rIN-GAME"), 
        additionals = l_pui_0.create("\239\130\133 General", "\239\130\173 \rADDITIONALS"), 
        movement = l_pui_0.create("\239\130\133 General", "\239\130\173 \rMOVEMENT", 1), 
        main = l_pui_0.create("\239\130\133 General", "\f<shield> \rANTI-AIM"), 
        settings = l_pui_0.create("\239\130\133 General", "\f<user> \rBUILDER"), 
        misc = l_pui_0.create("\239\130\133 General", "\f<list> \rMISC"), 
        defensive = l_pui_0.create("\239\130\133 General", "\f<xing> \rDEFENSIVE")
    }
};
local v100 = common.get_username();
local v101 = "LIVE";
local v102 = "live";
local v103 = "14.08.2023";
local v104 = {};
local _ = {};
local v106 = cvar.viewmodel_fov:int();
local v107 = cvar.viewmodel_offset_x:float();
local v108 = cvar.viewmodel_offset_y:float();
local v109 = cvar.viewmodel_offset_z:float();
local v110 = cvar.cl_righthand:int();
local v131 = {
    other = {
        conds = v99.other.other:list("", theme_color() .. "\239\129\155  \rRage", theme_color() .. "\239\161\173  \rVisuals", theme_color() .. "\239\130\173 \rAdditionals"), 
        shot_logs = v99.other.rage:switch("\239\131\139 Event Logger", false, function(v111)
            return {
                select_log = v111:selectable("Select log", {
                    [1] = "Upper-left", 
                    [2] = "Under crosshair"
                }), 
                purchases = v111:switch("Purchase logs", true), 
                background_log = v111:switch("Background", false), 
                hit_color = v111:color_picker("Hit color", color(186, 235, 50, 255)), 
                miss_color = v111:color_picker("Miss color", color(255, 125, 0, 255))
            };
        end), 
        defensive_air = v99.other.rage:switch("\239\157\182  Force Defensive in Air", false), 
        r8_helper = v99.other.rage:switch("\238\144\156   R8 Helper", false), 
        automatic_dt_release = v99.other.rage:switch("\238\139\138 Automatic DT Release", false, function(v112)
            return {
                weapons = v112:selectable("Weapons", "Pistols", "Auto Snipers", "AWP", "SSG-08", "Heavy Pistols", "Knife/Taser")
            };
        end), 
        custom_hc = v99.other.rage:switch("\239\158\175   Custom Hitchance", false, function(v113)
            return {
                hc_cond = v113:selectable("Condition", {
                    [1] = "Air", 
                    [2] = "No scope"
                }), 
                hc_air = v113:slider("\a{Link Active}\239\185\165 \rAir", 0, 100, 55), 
                hc_ns = v113:slider("\a{Link Active}\239\185\165 \rNo scope", 0, 100, 55)
            };
        end), 
        crosshair_indicators = v99.other.visuals:switch("\239\129\155 Crosshair Indicators", false, function(v114)
            return {
                indicator_color = v114:color_picker("Indicator color", color(255, 255, 255)), 
                build_color = v114:color_picker("Build color", color(215, 163, 111)), 
                glow_px = v114:slider("\a{Link Active}\239\185\165 \rGlow offset", 0, 100, 40, nil, function(v115)
                    return v115 .. "px";
                end)
            };
        end), 
        manual_arrows = v99.other.visuals:switch("\239\141\164 Manual Arrows", false, function(v116)
            return {
                style = v116:combo("Style", {
                    [1] = "Teamskeet", 
                    [2] = "Ideal Yaw"
                }), 
                desync_color = v116:color_picker("Desync color", color(67, 161, 255)), 
                manual_color = v116:color_picker("Manual color", color(182, 247, 66, 255)), 
                accent_color = v116:color_picker("Accent color", color(255, 255, 255, 255)), 
                reverse = v116:switch("Reverse"), 
                dynamic = v116:slider("\a{Link Active}\239\185\165 \rDynamic", 0, 20, 0, nil, "%")
            };
        end), 
        damage_indicator = v99.other.visuals_1:switch("\238\144\156  Damage Indicator", false, function(v117)
            return {
                damage_font = v117:combo("Damage font", "Small", "Default"), 
                dmg_indx = v117:slider("x", 0, render.screen_size().x, 965), 
                dmg_indy = v117:slider("y", 0, render.screen_size().y, 525)
            };
        end), 
        solus_ui = v99.other.visuals:switch("\239\162\144 Widgets", false, function(v118)
            return {
                solus_widgets_s = v118:selectable("Widgets", {
                    [1] = "Watermark", 
                    [2] = "Keybinds", 
                    [3] = "Spectator list"
                }), 
                custom_name = v118:input("Username"), 
                accent_col = v118:color_picker("Widgets color", color(255, 255, 255)), 
                pos_x_s = v118:slider("posx", 0, render.screen_size().x, 150), 
                pos_y_s = v118:slider("posy", 0, render.screen_size().y, 150), 
                pos_x1_s = v118:slider("posx1", 0, render.screen_size().x, 250), 
                pos_y1_s = v118:slider("posy1", 0, render.screen_size().y, 250)
            };
        end), 
        gs_indicators = v99.other.visuals:switch("\238\135\137 \aFFFFFFFFGame\aAFFF0BFFSense", false, function(v119)
            return {
                sindicators2 = v119:selectable("Select", {
                    [1] = "Double tap", 
                    [2] = "Dormant aimbot", 
                    [3] = "Minimum damage", 
                    [4] = "Ping spike", 
                    [5] = "Fake duck", 
                    [6] = "Freestanding", 
                    [7] = "Spectator list", 
                    [8] = "Aimbot stats", 
                    [9] = "Bomb info", 
                    [10] = "Body aim", 
                    [11] = "Hide shots"
                }, 0)
            };
        end), 
        unmute = v99.other.additionals:switch("\239\139\162 Mute/Unmute Players", false, function(v120)
            return {
                combo = v120:combo("Selection", {
                    [1] = "Mute", 
                    [2] = "Unmute"
                }), 
                enemy_only = v120:switch("Enemy Only")
            };
        end), 
        better_scope = v99.other.visuals_2:switch("\238\128\190 Better scope overlay", false, function(v121)
            return {
                pos = v121:slider("\a{Link Active}\239\185\165 \rPos", 0, 500, 15), 
                offset = v121:slider("\a{Link Active}\239\185\165 \rOffset", 0, 750, 35), 
                adjustments = v121:selectable("Options", {
                    [1] = "Invert", 
                    [2] = "Animations", 
                    [3] = "Glow"
                }), 
                color = v121:color_picker("Accent Color", color(255, 255, 255, 255)), 
                glow = v121:slider("\a{Link Active}\239\185\165 \rGlow strength", 0, 100, 0, 1, function(v122)
                    if v122 > 0 then
                        return v122 .. "%";
                    else
                        return "Off";
                    end;
                end), 
                enable_color = v121:switch("Custom glow color"), 
                glow_color = v121:color_picker("Glow color", ui.get_style("Link Active"))
            };
        end), 
        viewmodel = v99.other.visuals_1:switch("\238\129\157 Viewmodel Changer", false, function(v123)
            -- upvalues: v107 (ref), v108 (ref), v109 (ref), v106 (ref)
            return {
                x = v123:slider("\a{Link Active}\239\185\165 \rX Offset", -300, 300, v107, 0.1, "\194\176"), 
                y = v123:slider("\a{Link Active}\239\185\165 \rY Offset", -300, 300, v108, 0.1, "\194\176"), 
                z = v123:slider("\a{Link Active}\239\185\165 \rZ Offset", -300, 300, v109, 0.1, "\194\176"), 
                fov = v123:slider("\a{Link Active}\239\185\165 \rFOV Amount", 1, 180, v106, 1, "\194\176"), 
                reset_val = v123:button("Reset")
            };
        end), 
        viewmodel_aspectratio_slider = v99.other.visuals_1:switch("\239\142\144  Aspect Ratio", false, nil, function(v124)
            return {
                amount = v124:slider("\a{Link Active}\239\185\165 \rValue", 0, 200, 0, 0.01, function(v125)
                    if v125 == 133 then
                        return "4:3";
                    elseif v125 == 0 then
                        return "Off";
                    elseif v125 == 150 then
                        return "3:2";
                    elseif v125 == 177 then
                        return "16:9";
                    elseif v125 == 160 then
                        return "16:10";
                    else
                        return v125 .. "%";
                    end;
                end), 
                aaa16_9 = v124:button("16:9", function()
                    ar_changer(16, 9);
                end, true), 
                aaa16_10 = v124:button("16:10", function()
                    ar_changer(16, 10);
                end, true), 
                aaa16_3_2 = v124:button("3:2", function()
                    ar_changer(3, 2);
                end, true), 
                aaa16_4_3 = v124:button("4:3", function()
                    ar_changer(4, 3);
                end, true)
            };
        end), 
        trashtalk = v99.other.additionals:switch("\238\141\168 Trashtalk", false, nil, function(v126)
            return {
                delay_slider = v126:slider("\a{Link Active}\239\185\165 \rDelay time", 0, 15), 
                deathsay = v126:switch("Enable deathsay", false)
            };
        end), 
        clantag = v99.other.additionals:switch("\239\128\171   Clantag Spammer", false), 
        kibit_marker = v99.other.visuals_2:switch("\239\128\141    Kibit Marker", false), 
        custom_console_color = v99.other.visuals_2:switch("\238\140\170   Custom Console Color", false, function(v127)
            return {
                console_color = v127:color_picker("Color", color(255, 255, 255, 255))
            };
        end), 
        lagcomp = v99.other.additionals:switch("\239\147\143   Lagcomp debug box"), 
        fast_ladderr = v99.other.movement:switch("\239\151\133  Fast Ladder Move", false), 
        no_fall = v99.other.movement:switch("\238\149\135 No Fall Damage", false), 
        avoid_collisions = v99.other.movement:switch("\239\154\154  Avoid collisions", false, "", function(v128)
            return {
                distance = v128:slider("Distance", 15, 30, 20)
            };
        end), 
        cond = v99.other.settings:combo("Player Settings", v14.conditions), 
        builder = {}, 
        yaw_base = v99.other.misc:combo("\238\130\160    Manual Yaw", {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Left", 
            [4] = "Right", 
            [5] = "Forward", 
            [6] = "Freestanding"
        }, function(v129)
            return {
                static_yaw = v129:switch("Static Yaw Modifiers"), 
                disable_yaw_modifieres = v129:switch("Disable Yaw Modifiers"), 
                body_freestanding = v129:switch("Body Freestanding")
            };
        end), 
        tweaks = v99.other.misc:listable("", {
            [1] = "\239\135\162   Bombsite E Fix", 
            [2] = "\239\155\181  Safe Knife", 
            [3] = "\239\147\154  AA on Use"
        }), 
        anim_breakers = v99.other.misc:switch("\ab7a257FFAnim. breakers", false, "", function(v130)
            return {
                body_lean = v130:slider("\a{Link Active}\239\185\165 \rBody lean", 0, 100, 0, nil, "%"), 
                legs = v130:combo("Legs", {
                    [1] = "Disabled", 
                    [2] = "Forward", 
                    [3] = "Moonwalk"
                }), 
                airleg = v130:combo("Legs in air", {
                    [1] = "Disabled", 
                    [2] = "Static"
                }), 
                pitch = v130:switch("Pitch on land", false)
            };
        end)
    }, 
    info = {
        conds = v99.info.info:list("", theme_color() .. "\f<user>  \rInformations " .. theme_color() .. "-  Active", theme_color() .. "\f<coins>  \rRecommendations " .. theme_color() .. "-  Active", theme_color() .. "\f<file>  \rConfigurations " .. theme_color() .. "-  Active"), 
        user = v99.info.general:label("\a{Link Active}\239\128\135      \aFFFFFFFFUsername: \a{Link Active}" .. v100), 
        last_update_date = v99.info.general:label("\a{Link Active}\239\128\151     \aFFFFFFFFLast Update: \a{Link Active}" .. v103), 
        currenly_build = v99.info.general:label("\a{Link Active}\238\137\146     \aFFFFFFFFCurrent Build: \a{Link Active}" .. v102), 
        beta_version = v99.info.links:button("\a{Link Active}\239\135\162\r illusion beta", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
        end, true, true), 
        youtube = v99.info.links:button("\a{Link Active}\239\133\167\r Youtube", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/channel/UCWsxymKdRySzHX1hUAz2e8Q");
        end, true, true), 
        discord = v99.info.links:button("\a{Link Active}\239\142\146\r Discord", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/eUxpBh8AWJ");
        end, true, true), 
        issues_text = v99.info.links:label("If you have any issues, please create a ticket on our discord server."), 
        configs = v99.info.configs:list("", {
            [1] = "You have no configs..."
        }), 
        name = v99.info.configs:input("Name:", ""), 
        create = v99.info.configs:button("\a{Link Active}\239\140\153\r                                Create                                \a{Link Active}\239\140\153", function()
            -- upvalues: v104 (ref)
            v104:create();
        end, true), 
        delete = v99.info.configs:button("\aFF4444FF\239\135\184", function()
            -- upvalues: v104 (ref)
            v104:delete();
        end, true), 
        load = v99.info.configs:button("\a{Link Active}\239\128\153\r  Load Config", function()
            -- upvalues: v104 (ref)
            v104:load();
        end, true), 
        save = v99.info.configs:button("\a{Link Active}\239\131\135\r  Save Config", function()
            -- upvalues: v104 (ref)
            v104:save();
        end, true), 
        default = v99.info.configs:button("\a{Link}\239\140\150", true, true), 
        export = v99.info.configs:button("\a{Link Active}\239\131\133\r    Export    Config", true, true), 
        import = v99.info.configs:button("\a{Link Active}\239\149\175\r  Import     Config", true, true)
    }
};
image_loaded = render.load_image(network.get("https://media.discordapp.net/attachments/1081862676457725962/1081864361074774086/illusion_logo.png"), vector(250, 250));
menu_icon = v99.info.icon:texture(image_loaded, vector(250, 250), color(255), "f");
for v132 = 1, #v14.conditions do
    v131.other.builder[v132] = {
        enabled = v99.other.settings:switch("\a{Link Active}\239\185\165 \rOverride " .. v14.conditions[v132]), 
        pitch = v99.other.settings:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Up", 
            [4] = "Fake Down"
        }), 
        yaw_base = v99.other.settings:combo("Yaw Stance", {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static"
        }, 0, function(v133)
            return {
                yaw = v133:combo("Desync Type", "180", "180 L&R", "Delayed", "Sway"), 
                yaw_offset = v133:slider("\a{Link Active}\239\185\165 \rOffset", -180, 180, 0, nil, "\194\176"), 
                yaw_add_left = v133:slider("\a{Link Active}\239\185\165 \rLeft Offset", -180, 180, 0, nil, "\194\176"), 
                yaw_add_right = v133:slider("\a{Link Active}\239\185\165 \rRight Offset", -180, 180, 0, nil, "\194\176"), 
                yaw_delay = v133:slider("\a{Link Active}\239\185\165 \rDelay", 1, 50, 1, nil, "%"), 
                yaw_speed = v133:slider("\a{Link Active}\239\185\165 \rSpeed", 1, 100, 1, nil, "%")
            };
        end), 
        defensive_switch = v99.other.settings:switch("\aFFB48AFF\239\185\165 Defensive AntiAim", false, 0, function(v134)
            return {
                pitch = v134:combo("Pitch", {
                    [1] = "Disabled", 
                    [2] = "Down", 
                    [3] = "Up", 
                    [4] = "Semi Up", 
                    [5] = "Semi Down", 
                    [6] = "Random"
                }), 
                yaw_mod = v134:combo("Yaw", {
                    [1] = "Disabled", 
                    [2] = "Random", 
                    [3] = "Sideways"
                })
            };
        end), 
        yaw_mod = v99.other.settings:combo("Modify Jitter", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way", 
            [8] = "X-Way"
        }, 0, function(v135)
            return {
                modifier_degree = v135:slider("\a{Link Active}\239\185\165 \rOffset", -180, 180, 0), 
                ways = v135:combo("Ways", "3-Way", "5-Way"), 
                first_degree = v135:slider("\a{Link Active}\239\185\165 \r1st Degree", -180, 180, 0), 
                second_degree = v135:slider("\a{Link Active}\239\185\165 \r2nd Degree", -180, 180, 0), 
                third_degree = v135:slider("\a{Link Active}\239\185\165 \r3rd Degree", -180, 180, 0), 
                fourth_degree = v135:slider("\a{Link Active}\239\185\165 \r4th Degree", -180, 180, 0), 
                fifth_degree = v135:slider("\a{Link Active}\239\185\165 \r5th Degree", -180, 180, 0)
            };
        end), 
        body_yaw = v99.other.settings:switch("Body Yaw", false, 0, function(v136)
            return {
                inverter = v136:switch("Inverter", false), 
                left_limit = v136:slider("\a{Link Active}\239\185\165 \rLeft limit", 0, 60, 58, ""), 
                right_limit = v136:slider("\a{Link Active}\239\185\165 \rRight limit", 0, 60, 58, ""), 
                fake_options = v136:selectable("Options", {
                    [1] = "Avoid Overlap", 
                    [2] = "Jitter", 
                    [3] = "Randomize jitter"
                }, 0, "")
            };
        end)
    };
end;
math_breathe = function(v137, v138)
    return math.abs(math.sin(globals.realtime * (v138 or 1) % math.pi + (v137 or 0)));
end;
ar_changer = function(v139, v140)
    -- upvalues: v131 (ref)
    v131.other.viewmodel_aspectratio_slider.amount:set(math.floor(v139 / v140 * 100));
end;
typing_text = function(v141, v142)
    local v143 = 0;
    length = #v141:gsub("[\128-\191]", "");
    num = v143;
    result = "";
    for v144 in v141:gmatch(".[\128-\191]*") do
        num = num + 1;
        factor = num / length;
        result = string.format("%s\a%s%s", result, v142(num, length, v144, factor):to_hex(), v144);
    end;
    return result;
end;
gradient1 = function(v145, v146, v147, v148)
    return typing_text(v145, function(_, _, _, v152)
        -- upvalues: v148 (ref), v146 (ref), v147 (ref)
        interpolation = math_breathe(v152, v148);
        return v146:lerp(v147, interpolation);
    end);
end;
menu_gradient = function()
    -- upvalues: l_pui_0 (ref), v102 (ref)
    local v153 = l_pui_0.get_style("Link Active");
    l_pui_0.sidebar(gradient1("Illusion " .. v102, color(v153.r * 1.5, v153.g * 2, v153.b * 1.5), color(v153.r, v153.g, v153.b), 2), gradient1("\238\141\170", color(v153.r * 1.5, v153.g * 2, v153.b * 1.5), color(v153.r, v153.g, v153.b), -2));
end;
events.render:set(menu_gradient);
local _ = {
    Warmup = 8, 
    Crouching = 7, 
    ["Jump-crouching"] = 6, 
    Jumping = 5, 
    ["Slow-walking"] = 4, 
    Moving = 3, 
    Standing = 2, 
    Global = 1
};
for v155 = 1, #v14.conditions do
    local v156 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v131.other.conds
    };
    local _ = {
        [1] = nil, 
        [2] = 1, 
        [1] = v131.other.conds
    };
    local v158 = {
        [1] = v131.other.cond, 
        [2] = v14.conditions[v155]
    };
    local l_yaw_mod_0 = v131.other.builder[v155].yaw_mod;
    local l_yaw_base_0 = v131.other.builder[v155].yaw_base;
    local l_body_yaw_0 = v131.other.builder[v155].body_yaw;
    local l_defensive_switch_0 = v131.other.builder[v155].defensive_switch;
    local l_enabled_0 = v131.other.builder[v155].enabled;
    do
        local l_v155_0 = v155;
        do
            local l_l_yaw_mod_0_0, l_l_yaw_base_0_0, l_l_enabled_0_0 = l_yaw_mod_0, l_yaw_base_0, l_enabled_0;
            local v168 = {
                [1] = l_l_enabled_0_0, 
                [2] = function()
                    -- upvalues: l_v155_0 (ref), l_l_enabled_0_0 (ref)
                    if l_v155_0 == 1 then
                        return true;
                    else
                        return l_l_enabled_0_0:get();
                    end;
                end
            };
            v131.other.builder[l_v155_0].enabled:depend(v156, v158, {
                [1] = v131.other.cond, 
                [2] = function()
                    -- upvalues: l_v155_0 (ref)
                    return l_v155_0 ~= 1;
                end
            });
            v131.other.builder[l_v155_0].pitch:depend(v156, v158, v168);
            l_l_yaw_mod_0_0:depend(v156, v158, v168);
            l_l_yaw_base_0_0:depend(v156, v158, v168);
            l_body_yaw_0:depend(v156, v158, v168);
            l_defensive_switch_0:depend(v156, v158, v168);
            l_l_yaw_mod_0_0.modifier_degree:depend(v156, v158, {
                [1] = l_l_yaw_mod_0_0, 
                [2] = function()
                    -- upvalues: l_l_yaw_mod_0_0 (ref)
                    if l_l_yaw_mod_0_0:get() == "Disabled" then
                        return false;
                    elseif l_l_yaw_mod_0_0:get() == "X-Way" then
                        return false;
                    else
                        return true;
                    end;
                end
            }, v168);
            l_l_yaw_base_0_0.yaw_add_left:depend(v156, v158, v168, {
                [1] = l_l_yaw_base_0_0.yaw, 
                [2] = function()
                    -- upvalues: l_l_yaw_base_0_0 (ref)
                    if l_l_yaw_base_0_0.yaw:get() == "180 L&R" or l_l_yaw_base_0_0.yaw:get() == "Sway" then
                        return true;
                    else
                        return false;
                    end;
                end
            });
            l_l_yaw_base_0_0.yaw_add_right:depend(v156, v158, v168, {
                [1] = l_l_yaw_base_0_0.yaw, 
                [2] = function()
                    -- upvalues: l_l_yaw_base_0_0 (ref)
                    if l_l_yaw_base_0_0.yaw:get() == "180 L&R" or l_l_yaw_base_0_0.yaw:get() == "Sway" or l_l_yaw_base_0_0.yaw:get() == "Delayed" then
                        return true;
                    else
                        return false;
                    end;
                end
            });
            l_l_yaw_base_0_0.yaw_speed:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = "Sway", 
                [1] = l_l_yaw_base_0_0.yaw
            });
            l_l_yaw_base_0_0.yaw_offset:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = "180", 
                [1] = l_l_yaw_base_0_0.yaw
            });
            l_l_yaw_base_0_0.yaw_delay:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = "Delayed", 
                [1] = l_l_yaw_base_0_0.yaw
            });
            l_l_yaw_mod_0_0.ways:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, v168);
            l_l_yaw_mod_0_0.first_degree:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, v168);
            l_l_yaw_mod_0_0.second_degree:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, v168);
            l_l_yaw_mod_0_0.third_degree:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, v168);
            l_l_yaw_mod_0_0.fourth_degree:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, {
                [1] = nil, 
                [2] = "5-Way", 
                [1] = l_l_yaw_mod_0_0.ways
            }, v168);
            l_l_yaw_mod_0_0.fifth_degree:depend(v156, v158, {
                [1] = nil, 
                [2] = "X-Way", 
                [1] = l_l_yaw_mod_0_0
            }, {
                [1] = nil, 
                [2] = "5-Way", 
                [1] = l_l_yaw_mod_0_0.ways
            }, v168);
            l_body_yaw_0.inverter:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_body_yaw_0
            });
            l_body_yaw_0.fake_options:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_body_yaw_0
            });
            l_body_yaw_0.left_limit:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_body_yaw_0
            });
            l_body_yaw_0.right_limit:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_body_yaw_0
            });
            l_defensive_switch_0.pitch:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_defensive_switch_0
            });
            l_defensive_switch_0.yaw_mod:depend(v156, v158, v168, {
                [1] = nil, 
                [2] = true, 
                [1] = l_defensive_switch_0
            });
        end;
    end;
end;
v131.info.export:set_callback(function()
    -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v97 (ref), v23 (ref), v22 (ref)
    local l_status_0, _ = pcall(function()
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v169 = l_pui_0.save();
        local v170 = l_base64_0.encode(json.stringify(v169));
        l_clipboard_0.set(v170);
    end);
    if l_status_0 == false then
        common.add_notify("Illusion", "Failed to export config: json error");
        v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
        return;
    else
        v97("common/warning.wav", 0.5, 100, 0, 0);
        v23[#v23 + 1] = {
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = theme_color() .. "\239\149\174 \aDEFAULTExported config to " .. theme_color() .. "clipboard", 
            [2] = globals.tickcount + 300
        };
        v22 = v22 == 999 and 1 or v22 + 1;
        return;
    end;
end);
v131.info.import:set_callback(function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_pui_0 (ref), v97 (ref), v23 (ref), v22 (ref)
    local l_status_1, _ = pcall(function()
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_pui_0 (ref)
        local v173 = l_clipboard_0.get();
        local v174 = json.parse(l_base64_0.decode(v173));
        l_pui_0.load(v174);
    end);
    if l_status_1 == false then
        common.add_notify("Illusion", "Failed to import config: unable to decode base64");
        v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
        return;
    else
        v97("common/warning.wav", 0.5, 100, 0, 0);
        v23[#v23 + 1] = {
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = theme_color() .. "\239\149\175 \aDEFAULTImported config from " .. theme_color() .. "clipboard", 
            [2] = globals.tickcount + 300
        };
        v22 = v22 == 999 and 1 or v22 + 1;
        return;
    end;
end);
v131.info.default:set_callback(function()
    -- upvalues: l_base64_0 (ref), l_pui_0 (ref), v97 (ref), v23 (ref), v22 (ref)
    local l_status_2, _ = pcall(function()
        -- upvalues: l_base64_0 (ref), l_pui_0 (ref)
        local v177 = json.parse(l_base64_0.decode("W3siYWFfb25fdXNlIjpmYWxzZSwiYW5pbV9icmVha2VycyI6eyJfUyI6dHJ1ZSwiYWlybGVnIjoiRGlzYWJsZWQiLCJib2R5X2xlYW4iOjEwMC4wLCJsZWdzIjoiRGlzYWJsZWQiLCJwaXRjaCI6ZmFsc2V9LCJhdXRvbWF0aWNfZHRfcmVsZWFzZSI6eyJfUyI6ZmFsc2UsIndlYXBvbnMiOlsifiJdfSwiYXZvaWRfY29sbGlzaW9ucyI6eyJfUyI6ZmFsc2UsImRpc3RhbmNlIjoyMC4wfSwiYmV0dGVyX3Njb3BlIjp7Il9TIjp0cnVlLCJhZGp1c3RtZW50cyI6WyJJbnZlcnQiLCJBbmltYXRpb25zIiwiR2xvdyIsIn4iXSwiY29sb3IiOiIjRkZGRkZGRkYiLCJlbmFibGVfY29sb3IiOmZhbHNlLCJnbG93Ijo0MC4wLCJnbG93X2NvbG9yIjoiIzk5QkNGRkM0Iiwib2Zmc2V0IjozNS4wLCJwb3MiOjE1LjB9LCJidWlsZGVyIjpbeyJib2R5X3lhdyI6eyJfUyI6ZmFsc2UsImZha2Vfb3B0aW9ucyI6WyJ+Il0sImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTguMCwicmlnaHRfbGltaXQiOjU4LjB9LCJkZWZlbnNpdmVfc3dpdGNoIjp7Il9TIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhd19tb2QiOiJEaXNhYmxlZCJ9LCJlbmFibGVkIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhd19iYXNlIjp7Il9TIjoiRGlzYWJsZWQiLCJ5YXciOiIxODAiLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfZGVsYXkiOjEuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfc3BlZWQiOjEuMH0sInlhd19tb2QiOnsiX1MiOiJEaXNhYmxlZCIsImZpZnRoX2RlZ3JlZSI6MC4wLCJmaXJzdF9kZWdyZWUiOjAuMCwiZm91cnRoX2RlZ3JlZSI6MC4wLCJtb2RpZmllcl9kZWdyZWUiOjAuMCwic2Vjb25kX2RlZ3JlZSI6MC4wLCJ0aGlyZF9kZWdyZWUiOjAuMCwid2F5cyI6IjMtV2F5In19LHsiYm9keV95YXciOnsiX1MiOnRydWUsImZha2Vfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXQiOjYwLjB9LCJkZWZlbnNpdmVfc3dpdGNoIjp7Il9TIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhd19tb2QiOiJEaXNhYmxlZCJ9LCJlbmFibGVkIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXdfYmFzZSI6eyJfUyI6IkJhY2t3YXJkIiwieWF3IjoiMTgwIEwmUiIsInlhd19hZGRfbGVmdCI6LTUuMCwieWF3X2FkZF9yaWdodCI6MTIuMCwieWF3X2RlbGF5IjoxLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3NwZWVkIjoxLjB9LCJ5YXdfbW9kIjp7Il9TIjoiQ2VudGVyIiwiZmlmdGhfZGVncmVlIjowLjAsImZpcnN0X2RlZ3JlZSI6MC4wLCJmb3VydGhfZGVncmVlIjowLjAsIm1vZGlmaWVyX2RlZ3JlZSI6LTU1LjAsInNlY29uZF9kZWdyZWUiOjAuMCwidGhpcmRfZGVncmVlIjowLjAsIndheXMiOiIzLVdheSJ9fSx7ImJvZHlfeWF3Ijp7Il9TIjp0cnVlLCJmYWtlX29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU4LjAsInJpZ2h0X2xpbWl0Ijo1OC4wfSwiZGVmZW5zaXZlX3N3aXRjaCI6eyJfUyI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXdfbW9kIjoiRGlzYWJsZWQifSwiZW5hYmxlZCI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3X2Jhc2UiOnsiX1MiOiJCYWNrd2FyZCIsInlhdyI6IjE4MCBMJlIiLCJ5YXdfYWRkX2xlZnQiOi00LjAsInlhd19hZGRfcmlnaHQiOjkuMCwieWF3X2RlbGF5IjoxLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3NwZWVkIjoxLjB9LCJ5YXdfbW9kIjp7Il9TIjoiQ2VudGVyIiwiZmlmdGhfZGVncmVlIjowLjAsImZpcnN0X2RlZ3JlZSI6MC4wLCJmb3VydGhfZGVncmVlIjowLjAsIm1vZGlmaWVyX2RlZ3JlZSI6LTY5LjAsInNlY29uZF9kZWdyZWUiOjAuMCwidGhpcmRfZGVncmVlIjowLjAsIndheXMiOiIzLVdheSJ9fSx7ImJvZHlfeWF3Ijp7Il9TIjp0cnVlLCJmYWtlX29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU4LjAsInJpZ2h0X2xpbWl0Ijo1OC4wfSwiZGVmZW5zaXZlX3N3aXRjaCI6eyJfUyI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXdfbW9kIjoiRGlzYWJsZWQifSwiZW5hYmxlZCI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3X2Jhc2UiOnsiX1MiOiJCYWNrd2FyZCIsInlhdyI6IjE4MCBMJlIiLCJ5YXdfYWRkX2xlZnQiOi0yOC4wLCJ5YXdfYWRkX3JpZ2h0Ijo0OS4wLCJ5YXdfZGVsYXkiOjEuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfc3BlZWQiOjEuMH0sInlhd19tb2QiOnsiX1MiOiJEaXNhYmxlZCIsImZpZnRoX2RlZ3JlZSI6MC4wLCJmaXJzdF9kZWdyZWUiOjAuMCwiZm91cnRoX2RlZ3JlZSI6MC4wLCJtb2RpZmllcl9kZWdyZWUiOjAuMCwic2Vjb25kX2RlZ3JlZSI6MC4wLCJ0aGlyZF9kZWdyZWUiOjAuMCwid2F5cyI6IjMtV2F5In19LHsiYm9keV95YXciOnsiX1MiOnRydWUsImZha2Vfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTguMCwicmlnaHRfbGltaXQiOjU4LjB9LCJkZWZlbnNpdmVfc3dpdGNoIjp7Il9TIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhd19tb2QiOiJEaXNhYmxlZCJ9LCJlbmFibGVkIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXdfYmFzZSI6eyJfUyI6IkJhY2t3YXJkIiwieWF3IjoiMTgwIEwmUiIsInlhd19hZGRfbGVmdCI6LTI0LjAsInlhd19hZGRfcmlnaHQiOjEwLjAsInlhd19kZWxheSI6MS4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19zcGVlZCI6MS4wfSwieWF3X21vZCI6eyJfUyI6IkRpc2FibGVkIiwiZmlmdGhfZGVncmVlIjowLjAsImZpcnN0X2RlZ3JlZSI6MC4wLCJmb3VydGhfZGVncmVlIjowLjAsIm1vZGlmaWVyX2RlZ3JlZSI6MC4wLCJzZWNvbmRfZGVncmVlIjowLjAsInRoaXJkX2RlZ3JlZSI6MC4wLCJ3YXlzIjoiMy1XYXkifX0seyJib2R5X3lhdyI6eyJfUyI6dHJ1ZSwiZmFrZV9vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1OC4wLCJyaWdodF9saW1pdCI6NTguMH0sImRlZmVuc2l2ZV9zd2l0Y2giOnsiX1MiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3X21vZCI6IkRpc2FibGVkIn0sImVuYWJsZWQiOnRydWUsInBpdGNoIjoiRG93biIsInlhd19iYXNlIjp7Il9TIjoiQmFja3dhcmQiLCJ5YXciOiIxODAgTCZSIiwieWF3X2FkZF9sZWZ0IjotMTkuMCwieWF3X2FkZF9yaWdodCI6NDQuMCwieWF3X2RlbGF5IjoxLjAsInlhd19vZmZzZXQiOjAuMCwieWF3X3NwZWVkIjoxLjB9LCJ5YXdfbW9kIjp7Il9TIjoiRGlzYWJsZWQiLCJmaWZ0aF9kZWdyZWUiOjAuMCwiZmlyc3RfZGVncmVlIjowLjAsImZvdXJ0aF9kZWdyZWUiOjAuMCwibW9kaWZpZXJfZGVncmVlIjowLjAsInNlY29uZF9kZWdyZWUiOjAuMCwidGhpcmRfZGVncmVlIjowLjAsIndheXMiOiIzLVdheSJ9fSx7ImJvZHlfeWF3Ijp7Il9TIjp0cnVlLCJmYWtlX29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU4LjAsInJpZ2h0X2xpbWl0Ijo1OC4wfSwiZGVmZW5zaXZlX3N3aXRjaCI6eyJfUyI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXdfbW9kIjoiRGlzYWJsZWQifSwiZW5hYmxlZCI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3X2Jhc2UiOnsiX1MiOiJCYWNrd2FyZCIsInlhdyI6IjE4MCBMJlIiLCJ5YXdfYWRkX2xlZnQiOi0yNi4wLCJ5YXdfYWRkX3JpZ2h0Ijo0NS4wLCJ5YXdfZGVsYXkiOjEuMCwieWF3X29mZnNldCI6MC4wLCJ5YXdfc3BlZWQiOjEuMH0sInlhd19tb2QiOnsiX1MiOiJEaXNhYmxlZCIsImZpZnRoX2RlZ3JlZSI6MC4wLCJmaXJzdF9kZWdyZWUiOjAuMCwiZm91cnRoX2RlZ3JlZSI6MC4wLCJtb2RpZmllcl9kZWdyZWUiOjAuMCwic2Vjb25kX2RlZ3JlZSI6MC4wLCJ0aGlyZF9kZWdyZWUiOjAuMCwid2F5cyI6IjMtV2F5In19LHsiYm9keV95YXciOnsiX1MiOnRydWUsImZha2Vfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTguMCwicmlnaHRfbGltaXQiOjU4LjB9LCJkZWZlbnNpdmVfc3dpdGNoIjp7Il9TIjpmYWxzZSwicGl0Y2giOiJEaXNhYmxlZCIsInlhd19tb2QiOiJEaXNhYmxlZCJ9LCJlbmFibGVkIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXdfYmFzZSI6eyJfUyI6IkJhY2t3YXJkIiwieWF3IjoiMTgwIEwmUiIsInlhd19hZGRfbGVmdCI6LTQ4LjAsInlhd19hZGRfcmlnaHQiOjQyLjAsInlhd19kZWxheSI6MS4wLCJ5YXdfb2Zmc2V0IjowLjAsInlhd19zcGVlZCI6MS4wfSwieWF3X21vZCI6eyJfUyI6IkRpc2FibGVkIiwiZmlmdGhfZGVncmVlIjowLjAsImZpcnN0X2RlZ3JlZSI6MC4wLCJmb3VydGhfZGVncmVlIjowLjAsIm1vZGlmaWVyX2RlZ3JlZSI6MC4wLCJzZWNvbmRfZGVncmVlIjowLjAsInRoaXJkX2RlZ3JlZSI6MC4wLCJ3YXlzIjoiMy1XYXkifX1dLCJjbGFudGFnIjpmYWxzZSwiY29uZCI6Ildhcm11cCIsImNvbmRzIjoxLjAsImNyb3NzaGFpcl9pbmRpY2F0b3JzIjp7Il9TIjp0cnVlLCJidWlsZF9jb2xvciI6IiNEN0EzNkZGRiIsImdsb3dfcHgiOjQwLjAsImluZGljYXRvcl9jb2xvciI6IiNGRkZGRkZGRiJ9LCJjdXN0b21fY29uc29sZV9jb2xvciI6eyJfUyI6ZmFsc2UsImNvbnNvbGVfY29sb3IiOiIjRkZGRkZGRkYifSwiY3VzdG9tX2hjIjp7Il9TIjpmYWxzZSwiaGNfYWlyIjo1NS4wLCJoY19jb25kIjpbIn4iXSwiaGNfbnMiOjU1LjB9LCJkYW1hZ2VfaW5kaWNhdG9yIjp7Il9TIjpmYWxzZSwiZGFtYWdlX2ZvbnQiOiJTbWFsbCIsImRtZ19pbmR4Ijo5NjUuMCwiZG1nX2luZHkiOjUyNS4wfSwiZGVmZW5zaXZlX2FpciI6ZmFsc2UsImVfZml4IjpmYWxzZSwiZmFzdF9sYWRkZXJyIjp0cnVlLCJnc19pbmRpY2F0b3JzIjp7Il9TIjpmYWxzZSwic2luZGljYXRvcnMyIjpbIn4iXX0sImtpYml0X21hcmtlciI6ZmFsc2UsImxhZ2NvbXAiOmZhbHNlLCJtYW51YWxfYXJyb3dzIjp7Il9TIjpmYWxzZSwiYWNjZW50X2NvbG9yIjoiI0ZGRkZGRkZGIiwiZGVzeW5jX2NvbG9yIjoiIzQzQTFGRkZGIiwiZHluYW1pYyI6My4wLCJtYW51YWxfY29sb3IiOiIjQjZGNzQyRkYiLCJyZXZlcnNlIjp0cnVlLCJzdHlsZSI6IlRlYW1za2VldCJ9LCJub19mYWxsIjp0cnVlLCJyOF9oZWxwZXIiOmZhbHNlLCJzYWZlX2tuaWZlIjpmYWxzZSwic2hvdF9sb2dzIjp7Il9TIjp0cnVlLCJiYWNrZ3JvdW5kX2xvZyI6ZmFsc2UsImhpdF9jb2xvciI6IiNCQUVCMzJGRiIsIm1pc3NfY29sb3IiOiIjRkY3RDAwRkYiLCJwdXJjaGFzZXMiOnRydWUsInNlbGVjdF9sb2ciOlsiVXBwZXItbGVmdCIsIlVuZGVyIGNyb3NzaGFpciIsIn4iXX0sInNvbHVzX3VpIjp7Il9TIjp0cnVlLCJhY2NlbnRfY29sIjoiI0ZGRkZGRkZGIiwiY3VzdG9tX25hbWUiOiIiLCJwb3NfeDFfcyI6MjUwLjAsInBvc194X3MiOjE1MC4wLCJwb3NfeTFfcyI6MjUwLjAsInBvc195X3MiOjE1MC4wLCJzb2x1c193aWRnZXRzX3MiOlsifiJdfSwidHJhc2h0YWxrIjp7Il9TIjpmYWxzZSwiZGVhdGhzYXkiOmZhbHNlLCJkZWxheV9zbGlkZXIiOjAuMH0sInVubXV0ZSI6eyJfUyI6dHJ1ZSwiY29tYm8iOiJVbm11dGUiLCJlbmVteV9vbmx5IjpmYWxzZX0sInZpZXdtb2RlbCI6eyJfUyI6ZmFsc2UsImZvdiI6NjguMCwieCI6Mi4wLCJ5IjowLjAsInoiOi0xLjB9LCJ2aWV3bW9kZWxfYXNwZWN0cmF0aW9fc2xpZGVyIjp7Il9TIjp0cnVlLCJhbW91bnQiOjE2Mi4wfSwieWF3X2Jhc2UiOnsiX1MiOiJEaXNhYmxlZCIsImJvZHlfZnJlZXN0YW5kaW5nIjpmYWxzZSwiZGlzYWJsZV95YXdfbW9kaWZpZXJlcyI6ZmFsc2V9fV0="));
        l_pui_0.load(v177);
    end);
    if l_status_2 == false then
        common.add_notify("Illusion", "Failed to load config: unable to decode base64");
        v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
        return;
    else
        v97("common/warning.wav", 0.5, 100, 0, 0);
        v23[#v23 + 1] = {
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = theme_color() .. "\239\128\140 \aDEFAULTLoaded " .. theme_color() .. "default \aDEFAULTconfig", 
            [2] = globals.tickcount + 300
        };
        v22 = v22 == 999 and 1 or v22 + 1;
        return;
    end;
end);
v104 = {
    create = function(v180)
        -- upvalues: v131 (ref), v97 (ref), l_pui_0 (ref), l_base64_0 (ref), v23 (ref), v22 (ref)
        local v181 = v131.info.name:get();
        if string.len(v181) < 1 then
            common.add_notify("Illusion", "Failed to save config: write a name config!");
            v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
        else
            local v182 = l_pui_0.save();
            files.write("nl\\Illusion\\configs\\" .. v181 .. ".cfg", l_base64_0.encode(json.stringify(v182)));
            v180:reload();
            v23[#v23 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = theme_color() .. "\239\140\153 \aDEFAULTConfig successfully " .. theme_color() .. "created", 
                [2] = globals.tickcount + 300
            };
            v22 = v22 == 999 and 1 or v22 + 1;
        end;
    end, 
    save = function(_, v184)
        -- upvalues: v131 (ref), v97 (ref), l_pui_0 (ref), l_base64_0 (ref), v23 (ref)
        pcall(function()
            -- upvalues: v131 (ref), v97 (ref), l_pui_0 (ref), l_base64_0 (ref), v23 (ref), v184 (ref)
            if v131.info.configs:list()[v131.info.configs:get()] == "" or v131.info.configs:list()[v131.info.configs:get()] == "\aFFFFFF48You have no configs..." then
                common.add_notify("Illusion", "Failed to save config: config must exist!");
                v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
            else
                local v185 = l_pui_0.save();
                local v186 = l_base64_0.encode(json.stringify(v185));
                files.write("nl\\Illusion\\configs\\" .. v131.info.configs:list()[v131.info.configs:get()] .. ".cfg", v186);
                v23[#v23 + 1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = theme_color() .. "\239\131\135 \aDEFAULTConfig successfully " .. theme_color() .. "saved", 
                    [2] = globals.tickcount + 300
                };
                v184 = v184 == 999 and 1 or v184 + 1;
            end;
        end);
    end, 
    load = function(v187, v188)
        -- upvalues: v131 (ref), v97 (ref), l_base64_0 (ref), l_pui_0 (ref), v23 (ref)
        pcall(function()
            -- upvalues: v131 (ref), v97 (ref), l_base64_0 (ref), v187 (ref), l_pui_0 (ref), v23 (ref), v188 (ref)
            if v131.info.configs:list()[v131.info.configs:get()] == "" or v131.info.configs:list()[v131.info.configs:get()] == "\aFFFFFF48You have no configs..." then
                common.add_notify("Illusion", "Failed to load config: config must exist!");
                v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
            else
                local v189 = files.read("nl\\Illusion\\configs\\" .. v131.info.configs:list()[v131.info.configs:get()] .. ".cfg");
                if v189 == nil then
                    return;
                else
                    local v190 = l_base64_0.decode(v189);
                    local v191 = json.parse(v190);
                    v187:reload();
                    l_pui_0.load(v191);
                    v23[#v23 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = theme_color() .. "\239\128\153 \aDEFAULTConfig " .. theme_color() .. "" .. v131.info.configs:list()[v131.info.configs:get()] .. " \aDEFAULTsuccessfully " .. theme_color() .. "loaded", 
                        [2] = globals.tickcount + 300
                    };
                    v188 = v188 == 999 and 1 or v188 + 1;
                end;
            end;
        end);
    end, 
    delete = function(v192, v193)
        -- upvalues: v131 (ref), v97 (ref), v84 (ref), v23 (ref)
        pcall(function()
            -- upvalues: v131 (ref), v97 (ref), v84 (ref), v192 (ref), v23 (ref), v193 (ref)
            if v131.info.configs:list()[v131.info.configs:get()] == "" or v131.info.configs:list()[v131.info.configs:get()] == "\aFFFFFF48You have no configs..." then
                common.add_notify("Illusion", "Failed to delete: config must exist!");
                v97("buttons/combine_button3.wav", 0.5, 100, 0, 0);
            else
                ffi.C.DeleteFileA("" .. v84 .. "\\steamapps\\common\\Counter-Strike Global Offensive\\nl\\Illusion\\configs\\" .. v131.info.configs:list()[v131.info.configs:get()] .. ".cfg");
                v192:reload();
                v23[#v23 + 1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = theme_color() .. "\239\135\184 \aDEFAULTConfig successfully " .. theme_color() .. "deleted", 
                    [2] = globals.tickcount + 300
                };
                v193 = v193 == 999 and 1 or v193 + 1;
            end;
        end);
    end, 
    reload = function(_, _)
        -- upvalues: v84 (ref), v131 (ref)
        local v196 = {};
        local v197 = getNames("" .. v84 .. "\\steamapps\\common\\Counter-Strike Global Offensive\\nl\\Illusion\\configs\\*");
        for _, v199 in pairs(v197) do
            if "" .. v199 ~= "." and "" .. v199 ~= ".." and string.find("" .. v199, ".cfg") then
                local v200 = string.gsub(v199, ".cfg", "");
                local v201 = true;
                for v202 = 1, #v196 do
                    if v196[v202] == v200 then
                        v201 = false;
                    end;
                end;
                if v201 then
                    table.insert(v196, v200);
                end;
            end;
        end;
        if #v196 <= 0 then
            v131.info.configs:update({
                [1] = "\aFFFFFF48You have no configs..."
            });
            return;
        else
            v131.info.configs:update(v196);
            return;
        end;
    end
};
v104:reload();
v131.other.cond:depend({
    [1] = v131.other.conds, 
    [2] = function()
        -- upvalues: v131 (ref)
        if v131.other.conds:get() == 1 then
            return true;
        else
            return false;
        end;
    end
});
v99.other.misc:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v131.other.conds
});
v131.info.user:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v131.info.conds
});
v131.info.currenly_build:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v131.info.conds
});
v131.info.last_update_date:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v131.info.conds
});
v131.info.beta_version:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.info.conds
});
v131.info.youtube:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.info.conds
});
v131.info.discord:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.info.conds
});
v131.info.issues_text:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.info.conds
});
v131.info.configs:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.name:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.create:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.save:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.load:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.delete:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.export:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.import:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.info.default:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.info.conds
});
v131.other.anim_breakers.body_lean:depend(v131.other.anim_breakers);
v131.other.anim_breakers.legs:depend(v131.other.anim_breakers);
v131.other.anim_breakers.airleg:depend(v131.other.anim_breakers);
v131.other.anim_breakers.pitch:depend(v131.other.anim_breakers);
v131.other.shot_logs:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.other.conds
});
v131.other.defensive_air:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.other.conds
});
v131.other.r8_helper:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.other.conds
});
v131.other.automatic_dt_release:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.other.conds
});
v131.other.custom_hc:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v131.other.conds
});
v131.other.crosshair_indicators:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.manual_arrows:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.manual_arrows.style:depend(v131.other.manual_arrows);
v131.other.manual_arrows.desync_color:depend(v131.other.manual_arrows, {
    [1] = nil, 
    [2] = "Teamskeet", 
    [1] = v131.other.manual_arrows.style
});
v131.other.manual_arrows.manual_color:depend(v131.other.manual_arrows, {
    [1] = nil, 
    [2] = "Teamskeet", 
    [1] = v131.other.manual_arrows.style
});
v131.other.manual_arrows.accent_color:depend(v131.other.manual_arrows, {
    [1] = nil, 
    [2] = "Ideal Yaw", 
    [1] = v131.other.manual_arrows.style
});
v131.other.manual_arrows.reverse:depend(v131.other.manual_arrows);
v131.other.manual_arrows.dynamic:depend(v131.other.manual_arrows);
v131.other.gs_indicators:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.damage_indicator:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.solus_ui:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.unmute:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.unmute.combo:depend(v131.other.unmute);
v131.other.unmute.enemy_only:depend(v131.other.unmute);
v131.other.better_scope:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.viewmodel:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.viewmodel_aspectratio_slider:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.viewmodel_aspectratio_slider.amount:depend(v131.other.viewmodel_aspectratio_slider);
v131.other.viewmodel_aspectratio_slider.aaa16_9:depend(v131.other.viewmodel_aspectratio_slider);
v131.other.viewmodel_aspectratio_slider.aaa16_10:depend(v131.other.viewmodel_aspectratio_slider);
v131.other.viewmodel_aspectratio_slider.aaa16_3_2:depend(v131.other.viewmodel_aspectratio_slider);
v131.other.viewmodel_aspectratio_slider.aaa16_4_3:depend(v131.other.viewmodel_aspectratio_slider);
v131.other.trashtalk:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.trashtalk.deathsay:depend(v131.other.trashtalk);
v131.other.trashtalk.delay_slider:depend(v131.other.trashtalk);
v131.other.clantag:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.kibit_marker:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.custom_console_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v131.other.conds
});
v131.other.better_scope.pos:depend(v131.other.better_scope);
v131.other.better_scope.offset:depend(v131.other.better_scope);
v131.other.better_scope.adjustments:depend(v131.other.better_scope);
v131.other.better_scope.color:depend(v131.other.better_scope);
v131.other.better_scope.glow:depend(v131.other.better_scope, {
    [1] = v131.other.better_scope.adjustments, 
    [2] = function()
        -- upvalues: v131 (ref)
        return v131.other.better_scope.adjustments:get("Glow");
    end
});
v131.other.better_scope.enable_color:depend(v131.other.better_scope, {
    [1] = v131.other.better_scope.adjustments, 
    [2] = function()
        -- upvalues: v131 (ref)
        return v131.other.better_scope.adjustments:get("Glow");
    end
}, {
    [1] = v131.other.better_scope.glow, 
    [2] = function()
        -- upvalues: v131 (ref)
        return v131.other.better_scope.glow:get() > 0;
    end
});
v131.other.better_scope.glow_color:depend(v131.other.better_scope, {
    [1] = v131.other.better_scope.adjustments, 
    [2] = function()
        -- upvalues: v131 (ref)
        return v131.other.better_scope.adjustments:get("Glow");
    end
}, {
    [1] = v131.other.better_scope.glow, 
    [2] = function()
        -- upvalues: v131 (ref)
        return v131.other.better_scope.glow:get() > 0;
    end
}, v131.other.better_scope.enable_color);
v131.other.avoid_collisions.distance:depend(v131.other.avoid_collisions);
v131.other.lagcomp:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.avoid_collisions:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.no_fall:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.fast_ladderr:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v131.other.conds
});
v131.other.shot_logs.select_log:depend(v131.other.shot_logs);
v131.other.shot_logs.purchases:depend(v131.other.shot_logs);
v131.other.shot_logs.background_log:depend(v131.other.shot_logs, {
    [1] = nil, 
    [2] = "Under crosshair", 
    [1] = v131.other.shot_logs.select_log
});
v131.other.shot_logs.hit_color:depend(v131.other.shot_logs, {
    [1] = nil, 
    [2] = "Under crosshair", 
    [1] = v131.other.shot_logs.select_log
});
v131.other.shot_logs.miss_color:depend(v131.other.shot_logs, {
    [1] = nil, 
    [2] = "Under crosshair", 
    [1] = v131.other.shot_logs.select_log
});
v131.other.automatic_dt_release.weapons:depend(v131.other.automatic_dt_release);
v131.other.custom_hc.hc_cond:depend(v131.other.custom_hc);
v131.other.custom_hc.hc_air:depend(v131.other.custom_hc, {
    [1] = nil, 
    [2] = "Air", 
    [1] = v131.other.custom_hc.hc_cond
});
v131.other.custom_hc.hc_ns:depend(v131.other.custom_hc, {
    [1] = nil, 
    [2] = "No scope", 
    [1] = v131.other.custom_hc.hc_cond
});
v131.other.crosshair_indicators.indicator_color:depend(v131.other.crosshair_indicators);
v131.other.crosshair_indicators.build_color:depend(v131.other.crosshair_indicators);
v131.other.crosshair_indicators.glow_px:depend(v131.other.crosshair_indicators);
v131.other.gs_indicators.sindicators2:depend(v131.other.gs_indicators);
v131.other.solus_ui.solus_widgets_s:depend(v131.other.solus_ui);
v131.other.solus_ui.custom_name:depend(v131.other.solus_ui, {
    [1] = nil, 
    [2] = "Watermark", 
    [1] = v131.other.solus_ui.solus_widgets_s
});
v131.other.solus_ui.accent_col:depend(v131.other.solus_ui);
v131.other.viewmodel.fov:depend(v131.other.viewmodel);
v131.other.viewmodel.x:depend(v131.other.viewmodel);
v131.other.viewmodel.y:depend(v131.other.viewmodel);
v131.other.viewmodel.z:depend(v131.other.viewmodel);
v131.other.viewmodel.reset_val:depend(v131.other.viewmodel);
v131.other.custom_console_color.console_color:depend(v131.other.custom_console_color);
v131.other.yaw_base.body_freestanding:depend({
    [1] = nil, 
    [2] = "Freestanding", 
    [1] = v131.other.yaw_base
});
v131.other.yaw_base.disable_yaw_modifieres:depend({
    [1] = nil, 
    [2] = "Freestanding", 
    [1] = v131.other.yaw_base
});
local v203 = {
    jit_yaw = 0, 
    prev_simulation_time = 0, 
    in_bombzone = false, 
    jitter_move = false, 
    jit_add = 0, 
    jitter = false, 
    set_lby = false, 
    yaw_add = 0, 
    defensive = {}, 
    fix_tp = rage.exploit:get()
};
local v204 = {
    scope = {
        scope = 0, 
        second_alpha = 0, 
        first_alpha = 0, 
        scoped = false
    }
};
local function v206(v205)
    return math.floor(0.5 + v205 / globals.tickinterval);
end;
local function v209(v207)
    local l_m_fFlags_0 = v207.m_fFlags;
    if bit.band(l_m_fFlags_0, 4) == 4 then
        return true;
    else
        return false;
    end;
end;
local function v212(v210)
    local l_m_fFlags_1 = v210.m_fFlags;
    if bit.band(l_m_fFlags_1, 1) == 0 then
        return true;
    else
        return false;
    end;
end;
sim_diff = function()
    -- upvalues: v206 (ref), v203 (ref)
    local v213 = v206(entity.get_local_player().m_flSimulationTime);
    local v214 = v213 - v203.prev_simulation_time;
    v203.prev_simulation_time = v213;
    diff_sim = v214;
    return diff_sim;
end;
local v215 = 1;
enter_bombzone = function(v216)
    -- upvalues: v203 (ref)
    if entity.get(v216.userid, true) == entity.get_local_player() and v216.hasbomb then
        v203.in_bombzone = true;
    end;
end;
exit_bombzone = function(v217)
    -- upvalues: v203 (ref)
    if entity.get(v217.userid, true) == entity.get_local_player() then
        v203.in_bombzone = false;
    end;
end;
fix_bomb_site_e = function(v218)
    -- upvalues: v203 (ref)
    local v219 = render.camera_angles();
    local v220 = render.camera_position();
    local v221 = vector():angles(v219);
    local v222 = entity.get_entities();
    local l_huge_0 = math.huge;
    local l_huge_1 = math.huge;
    local v225 = entity.get_local_player();
    if v225 ~= nil then
        for v226 = 1, #v222 do
            if v222[v226]:get_classname() == "CPropDoorRotating" or v222[v226]:is_weapon() and v222[v226]:get_weapon_owner() ~= entity.get_local_player() and v222[v226]:is_visible() then
                if v222[v226]:get_classname() == "CPropDoorRotating" then
                    ent_pos = vector(v222[v226]:get_origin().x, v222[v226]:get_origin().y, v222[v226]:get_origin().z + 50);
                else
                    ent_pos = v222[v226]:get_origin();
                end;
                local v227 = v225:get_origin();
                local v228 = ent_pos:dist_to_ray(v220, v221);
                if v228 < l_huge_0 then
                    l_huge_1 = v227:dist(ent_pos);
                    l_huge_0 = v228;
                end;
            end;
        end;
        if (v203.in_bombzone or l_huge_0 > 45 or l_huge_1 > 105) and v225.m_iTeamNum == 2 then
            v218.in_use = false;
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function v231(v229, v230)
    if not v230 then
        v230 = 1;
    end;
    v229 = ffi.cast(ffi.typeof("void***"), v229);
    return ffi.cast("c_animlayers**", ffi.cast("char*", v229) + 10640)[0][v230];
end;
events.post_update_client_side_animation:set(function()
    -- upvalues: v131 (ref), v231 (ref), v53 (ref)
    if entity.get_local_player() == nil then
        return;
    elseif not entity.get_local_player():is_alive() then
        return;
    else
        local v232 = v131.other.anim_breakers.body_lean:get() / 100;
        if v131.other.anim_breakers:get() then
            if v131.other.anim_breakers.airleg:get() ~= "Disabled" then
                entity.get_local_player().m_flPoseParameter[6] = 1;
            end;
            if v131.other.anim_breakers.legs:get() ~= "Disabled" then
                entity.get_local_player().m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 1;
                ctx.refs.legmovement:set("Sliding");
            end;
            if ctx.menu.elements.antiaims.anim_breakers:get("Increase Move Lean") then
                v231(v53(entity.get_local_player():get_index()), 12).m_flWeight = v232;
            end;
        end;
        return;
    end;
end);
get_velocity = function(v233)
    if v233 == nil then
        return;
    else
        return (v233.m_vecVelocity:length());
    end;
end;
local v234 = 0;
events.bomb_beginplant:set(function(v235)
    -- upvalues: v131 (ref), v15 (ref), v234 (ref), v17 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v15 = true;
        v234 = globals.curtime;
        local v236 = entity_get_player_resource();
        if not v236 then
            return;
        else
            local v237 = entity.get(v235.site);
            if not v237 then
                return;
            else
                local l_m_bombsiteCenterA_0 = v236.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v236.m_bombsiteCenterB;
                local v240 = v237.m_vecMins:lerp(v237.m_vecMaxs, 0.5);
                v17 = v240:distsqr(l_m_bombsiteCenterA_0) < v240:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
            end;
        end;
    end;
end);
events.bomb_abortplant:set(function()
    -- upvalues: v131 (ref), v15 (ref), v234 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v15 = false;
        fill = 0;
        v234 = 0;
    end;
end);
events.bomb_planted:set(function(_)
    -- upvalues: v131 (ref), v15 (ref), v16 (ref), v234 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v15 = false;
        v16 = true;
        fill = 0;
        v234 = 0;
    end;
end);
events.bomb_exploded:set(function()
    -- upvalues: v131 (ref), v16 (ref), v234 (ref), v15 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v16 = false;
        fill = 0;
        v234 = 0;
        v15 = false;
    end;
end);
events.round_start:set(function()
    -- upvalues: v131 (ref), v16 (ref), v234 (ref), v15 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v16 = false;
        fill = 0;
        v234 = 0;
        v15 = false;
    end;
end);
events.bomb_defused:set(function()
    -- upvalues: v131 (ref), v16 (ref), v234 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        v16 = false;
        fill = 0;
        v234 = 0;
    end;
end);
fnaychance = 0;
local function v246(v242, v243, v244)
    local l_v242_0 = v242;
    if l_v242_0 < v243 and v243 then
        l_v242_0 = v243;
    end;
    if v244 < l_v242_0 and v244 then
        l_v242_0 = v244;
    end;
    return l_v242_0;
end;
local v247 = l_smoothy_0.new(v10.min_dmg:get());
local v254 = l_system_0.register({
    [1] = v131.other.damage_indicator.dmg_indx, 
    [2] = v131.other.damage_indicator.dmg_indy
}, vector(20, 15), "Test1", function(v248)
    -- upvalues: l_animations_0 (ref), v131 (ref), v247 (ref), v10 (ref)
    if entity.get_local_player() == nil then
        return;
    elseif entity.get_local_player():is_alive() == false then
        return;
    else
        local v249 = is_bounded(v248.position.x, v248.position.y, v248.position.x + 160, v248.position.y + 60) and common.is_button_down(1);
        local v250 = l_animations_0.new("dragging_alpha", dragging_alpha);
        local l_v250_0 = v250;
        v250 = v250.update;
        local l_LERP_0 = l_animations_0.types.LERP;
        local v253;
        if ui.get_alpha() > 0.1 then
            v253 = v249 and 100 or 0;
        else
            v253 = 0;
        end;
        v250 = v250(l_v250_0, l_LERP_0, v253);
        if v131.other.damage_indicator:get() and ui.get_alpha() > 0.3 then
            render.rect_outline(vector(v248.position.x, v248.position.y), vector(v248.position.x + v248.size.x, v248.position.y + v248.size.y), color(255, 255, 255, 150 - v250), 0, 5);
        end;
        v131.other.damage_indicator.damage_font:visibility(v131.other.damage_indicator:get());
        l_v250_0 = v247(0.05, v10.min_dmg:get(), easing_fn);
        if v131.other.damage_indicator:get() and {
            [1] = ui.get_alpha() > 0.3 or entity.get_local_player():is_alive()
        } then
            render.text(v131.other.damage_indicator.damage_font:get() == "Small" and 2 or 1, vector(v248.position.x + 11, v248.position.y + 7), color(255, 255, 255, 255 - v250), "c", v247.value / v10.min_dmg:get() < 1 and math.ceil(v247.value) or math.floor(v247.value));
        end;
        return;
    end;
end);
events.mouse_input:set(function()
    if ui.get_alpha() > 0.3 then
        return false;
    else
        return;
    end;
end);
events.aim_ack:set(function(v255)
    -- upvalues: v131 (ref), v20 (ref), v21 (ref)
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Aimbot stats") then
        if v255.state == "unregistered shot" then
            return;
        elseif v255.state == "death" then
            return;
        elseif v255.state == "player death" then
            return;
        elseif v255.state == nil then
            v20 = v20 + 1;
        else
            v21 = v21 + 1;
        end;
    end;
end);
verdanaar = render.load_font("verdana", 15, "abd");
local v256 = 2;
local _ = 0;
asdsadas = function(v258)
    -- upvalues: v256 (ref)
    if v258.in_moveright == true then
        v256 = 1;
    elseif v258.in_moveleft == true then
        v256 = 2;
    end;
end;
local v260 = {
    is_nade = function(v259)
        return v259 == 48 or not (v259 ~= 47) or not (v259 ~= 43) or not (v259 ~= 45) or not (v259 ~= 44) or v259 == 46;
    end
};
events.render:set(function(_)
    -- upvalues: v131 (ref), v260 (ref), l_animations_0 (ref), v256 (ref), v10 (ref), v246 (ref), l_gradient_0 (ref), v101 (ref), v65 (ref), v11 (ref), v15 (ref), v234 (ref), v17 (ref), v16 (ref), v20 (ref), v21 (ref), v254 (ref)
    if v131.other.conds:get() == 1 then
        v131.other.conds:update(theme_color() .. "\239\139\177  \aDEFAULTAnti-Aims Settings" .. theme_color() .. "  -  Active", theme_color() .. "\239\129\155  \aDEFAULTRagebot Settings", theme_color() .. "\239\161\173  \aDEFAULTVisuals Effects", theme_color() .. "\239\130\173 \aDEFAULTAdditional's Functions");
    elseif v131.other.conds:get() == 2 then
        v131.other.conds:update(theme_color() .. "\239\139\177  \aDEFAULTAnti-Aims Settings", theme_color() .. "\239\129\155  \aDEFAULTRagebot Settings" .. theme_color() .. "  -  Active", theme_color() .. "\239\161\173  \aDEFAULTVisuals Effects", theme_color() .. "\239\130\173 \aDEFAULTAdditional's Functions");
    elseif v131.other.conds:get() == 3 then
        v131.other.conds:update(theme_color() .. "\239\139\177  \aDEFAULTAnti-Aims Settings", theme_color() .. "\239\129\155  \aDEFAULTRagebot Settings", theme_color() .. "\239\161\173  \aDEFAULTVisuals Effects" .. theme_color() .. "  -  Active", theme_color() .. "\239\130\173 \aDEFAULTAdditional's Functions");
    elseif v131.other.conds:get() == 4 then
        v131.other.conds:update(theme_color() .. "\239\139\177  \aDEFAULTAnti-Aims Settings", theme_color() .. "\239\129\155  \aDEFAULTRagebot Settings", theme_color() .. "\239\161\173  \aDEFAULTVisuals Effects", theme_color() .. "\239\130\173 \aDEFAULTAdditional's Functions" .. theme_color() .. "  -  Active");
    end;
    if v131.info.conds:get() == 1 then
        v131.info.conds:update(theme_color() .. "\239\128\135  \aDEFAULTInformations" .. theme_color() .. "  -  Active", theme_color() .. "\239\148\158  \aDEFAULTRecommendations", theme_color() .. "\239\133\155  \aDEFAULTConfigurations");
    elseif v131.info.conds:get() == 2 then
        v131.info.conds:update(theme_color() .. "\239\128\135  \aDEFAULTInformations", theme_color() .. "\239\148\158  \aDEFAULTRecommendations" .. theme_color() .. "  -  Active", theme_color() .. "\239\133\155  \aDEFAULTConfigurations");
    elseif v131.info.conds:get() == 3 then
        v131.info.conds:update(theme_color() .. "\239\128\135  \aDEFAULTInformations", theme_color() .. "\239\148\158  \aDEFAULTRecommendations", theme_color() .. "\239\133\155  \aDEFAULTConfigurations" .. theme_color() .. "  -  Active");
    end;
    local l_x_0 = render.screen_size().x;
    local l_y_0 = render.screen_size().y;
    if v131.other.crosshair_indicators:get() then
        if entity.get_local_player() == nil then
            return;
        elseif entity.get_local_player():is_alive() == false then
            return;
        else
            local v267 = (function(v264)
                local v265 = v264["m_vecVelocity[0]"];
                local v266 = v264["m_vecVelocity[1]"];
                return (math.sqrt(v265 * v265 + v266 * v266));
            end)(entity.get_local_player());
            local v268 = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) == 0 or common.is_button_down(32);
            local v269 = entity.get_local_player().m_flDuckAmount > 0.8 or common.is_button_down(162);
            local v270 = false;
            if v268 and not v269 or v268 and v269 then
                aa_state = "- AIR -";
            elseif not v268 and not common.is_button_down(32) and v269 or ui.find("aimbot", "anti aim", "misc", "fake duck"):get() then
                aa_state = "- CROUCH -";
            elseif (not v269 or ui.find("aimbot", "anti aim", "misc", "fake duck"):get()) and not v268 and not ui.find("aimbot", "anti aim", "misc", "slow walk"):get() and v267 > 4 then
                aa_state = "- WALKING -";
            elseif ui.find("aimbot", "anti aim", "misc", "slow walk"):get() then
                aa_state = "- SLOWWALK -";
            elseif v267 < 5 and (not v269 or ui.find("aimbot", "anti aim", "misc", "fake duck"):get()) and not v268 then
                aa_state = "- STANDING -";
            end;
            local v271 = ui.get_binds();
            for _, v273 in pairs(v271) do
                if v273.active and v273.name == "Min. Damage" then
                    v270 = true;
                end;
            end;
            local _ = globals.frametime * 16;
            local v275 = entity.get_local_player():get_player_weapon(false);
            if v275 == nil then
                return;
            else
                local v276 = v275:get_weapon_index();
                if v276 == nil then
                    return;
                else
                    local v277 = v260.is_nade(v276);
                    local v278 = l_animations_0.new("animation_scope", nil);
                    local v279 = l_animations_0.new("animation_scope_1", nil);
                    local v280 = l_x_0 / 2;
                    if v256 == 1 then
                        v280 = v278:update(l_animations_0.types.LERP, entity.get_local_player().m_bIsScoped and l_x_0 / 2 - 65 or l_x_0 / 2);
                    elseif v256 == 2 then
                        v280 = v278:update(l_animations_0.types.LERP, entity.get_local_player().m_bIsScoped and l_x_0 / 2 + 65 or l_x_0 / 2);
                    end;
                    local v281 = v279:update(l_animations_0.types.LERP, entity.get_local_player().m_bIsScoped and 175 or 0);
                    local v282 = l_animations_0.new("animation_nade", nil):update(l_animations_0.types.LERP, v277 and 175 or 0);
                    local v283 = l_animations_0.new("animation_dt", nil):update(l_animations_0.types.LERP, v10.dt:get() and 255 or 0);
                    local v284 = l_animations_0.new("animation_hs", nil):update(l_animations_0.types.LERP, v10.aaos:get() and 255 or 0);
                    local _ = l_animations_0.new("animation_dmg", nil):update(l_animations_0.types.LERP, v270 == true and 255 or 0);
                    alpha_cl = v246(math.floor(math.sin(globals.realtime * 5) * 126.5 + 127.5) or 255, 35, 255 - v281 - v282);
                    render.shadow(vector(v280 - 20, l_y_0 / 2 + 20), vector(v280 + 20, l_y_0 / 2 + 20), v131.other.crosshair_indicators.indicator_color:get(), v131.other.crosshair_indicators.glow_px:get(), 0, 0);
                    indicator_text = l_gradient_0.text_animate(v101, -0.7, {
                        color(v131.other.crosshair_indicators.build_color:get().r, v131.other.crosshair_indicators.build_color:get().g, v131.other.crosshair_indicators.build_color:get().b, alpha_cl), 
                        color(v131.other.crosshair_indicators.build_color:get().r, v131.other.crosshair_indicators.build_color:get().g, v131.other.crosshair_indicators.build_color:get().b, alpha_cl)
                    });
                    indicator_textz = l_gradient_0.text_animate("WAITING", -0.7, {
                        color(255, 255, 255, 255 - v281 - v282), 
                        color(255, 114, 114, 255)
                    });
                    render.text(2, vector(v280, l_y_0 / 2 + 20), color(v131.other.crosshair_indicators.indicator_color:get().r, v131.other.crosshair_indicators.indicator_color:get().g, v131.other.crosshair_indicators.indicator_color:get().b, 255 - v281 - v282), "c", "ILLUSION  " .. indicator_text:get_animated_text());
                    v65("aa_ind", vector(v280, l_y_0 / 2 + 30), 2, color(255, 255, 255, 255 - v281 - v282), nil, aa_state);
                    if v10.dt:get() and not ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() then
                        v65("dt_ind", vector(v280, l_y_0 / 2 + 40), 2, color(255, 255, 255, v283 - v281 - v282), nil, rage.exploit:get() == 1 and "DT  " .. "\aC0FF91FFREADY" or "DT  " .. indicator_textz:get_animated_text());
                    elseif v10.dt:get() and ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() then
                        v65("dt_ind", vector(v280, l_y_0 / 2 + 40), 2, color(255, 255, 255, v283 - v281 - v282), nil, rage.exploit:get() == 1 and "IDEALTICK  " .. "\aC0FF91FFREADY" or "IDEALTICK  " .. indicator_textz:get_animated_text());
                    elseif v10.aaos:get() and not v10.dt:get() then
                        v65("dt_ind", vector(v280, l_y_0 / 2 + 40), 2, color(255, 255, 255, v284 - v281 - v282), nil, rage.exploit:get() == 1 and "HIDE  " .. "\aC0FF91FFREADY" or "HIDE  " .. indicator_textz:get_animated_text());
                    end;
                    v65("dmg_ind", vector(v280, (not not v10.dt:get() or v10.aaos:get()) and l_y_0 / 2 + 50 or l_y_0 / 2 + 40), 2, color(255, 255, 255, (v270 == true and 255 or 0) - v281 - v282), nil, v270 == true and "DMG" or " ");
                    indicator_textz:animate();
                end;
            end;
        end;
    end;
    local v286 = -50;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Double tap") and v10.dt:get() then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "DT").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(27, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 60 + render.measure_text(v11, nil, "DT").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50), nil, "DT");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Hide shots") and v10.aaos:get() and not v10.dt:get() then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "OSAA").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(41, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 41 + render.measure_text(v11, nil, "OSAA").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, "OSAA");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Bomb info") then
        if v15 == true then
            local v287 = 3.125 - (3.125 + v234 - globals.curtime);
            if v287 > 3.125 then
                v287 = 3.125;
            end;
            render.circle_outline(vector(l_x_0 / 140 + 138, l_y_0 / 1.7 - v286 + 12), color(0, 0, 0, 255), 10, 1, 10, 5);
            render.circle_outline(vector(l_x_0 / 140 + 138, l_y_0 / 1.7 - v286 + 12), color(213, 213, 214, 255), 9, 1, v287 / 3, 3);
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, v17 .. " - Planting").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(72, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 60 + render.measure_text(v11, nil, v17 .. " - Planting").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(230, 228, 128), nil, v17 .. " - Planting");
            v286 = v286 - 35;
        end;
        if v16 == true then
            entity.get_entities("CPlantedC4", true, function(v288)
                -- upvalues: l_x_0 (ref), l_y_0 (ref), v286 (ref), v11 (ref)
                local v289 = v288.m_flC4Blow - globals.curtime;
                local v290 = v288.m_nBombSite == 0 and "A" or "B";
                if v289 >= 0 then
                    if entity.get_local_player() ~= nil and entity.get_local_player():is_alive() then
                        local l_m_iHealth_0 = entity.get_local_player().m_iHealth;
                        local l_m_ArmorValue_0 = entity.get_local_player().m_ArmorValue;
                        local v293 = v288:get_origin():dist2d((entity.get_local_player():get_origin()));
                        local _ = false;
                        local v295 = 450.7;
                        local v296 = (v293 - 75.68) / 789.2;
                        local v297 = v295 * math.exp(-v296 * v296);
                        if l_m_ArmorValue_0 > 0 then
                            local v298 = v297 * 0.5;
                            local v299 = (v297 - v298) * 0.5;
                            if l_m_ArmorValue_0 < v299 then
                                l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                                v298 = v297 - v299;
                            end;
                            v297 = v298;
                        end;
                        dmg = math.ceil(v297);
                        if l_m_iHealth_0 <= dmg then
                            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(43, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
                            render.gradient(vector(l_x_0 / 60 + 11, l_y_0 / 1.7 - v286 - 5), vector(80, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
                            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(255, 0, 0), nil, "FATAL");
                            v286 = v286 - 35;
                        elseif v297 > 0.5 then
                            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(43, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
                            render.gradient(vector(l_x_0 / 60 + 11, l_y_0 / 1.7 - v286 - 5), vector(80, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
                            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(230, 228, 128), nil, "-" .. dmg .. " HP");
                            v286 = v286 - 35;
                        end;
                    end;
                    render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(43, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
                    render.gradient(vector(l_x_0 / 60 + 11, l_y_0 / 1.7 - v286 - 5), vector(80, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
                    render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, v290 .. " - " .. string.format("%.1fs", v289));
                    v286 = v286 - 35;
                end;
            end);
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Fake duck") and ui.find("aimbot", "anti aim", "misc", "fake duck"):get() then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "DUCK").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(41, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 41 + render.measure_text(v11, nil, "DUCK").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, "DUCK");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Ping spike") and v10.ping_spike:get() > 0 then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "PING").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(38, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 45 + render.measure_text(v11, nil, "PING").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(163, 194, 43), nil, "PING");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Freestanding") and v10.freestanding:get() then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "FS").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(24, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 65 + render.measure_text(v11, nil, "FS").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, "FS");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Dormant aimbot") and v10.dormant:get() then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            for _, v301 in ipairs(entity.get_players(true)) do
                if v301 == nil then
                    fnayf = false;
                end;
                if v301 ~= nil and v301:is_enemy() and v301:is_dormant() then
                    fnayf = true;
                else
                    fnayf = false;
                end;
            end;
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "DA").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(28, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 58 + render.measure_text(v11, nil, "DA").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), fnayf == true and color(142, 194, 43) or color(255, 0, 50), nil, "DA");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Minimum damage") then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(25, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(25, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 65 + render.measure_text(v11, nil, v10.min_dmg:get()).x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, v10.min_dmg:get());
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Body aim") and v10.body_aim:get() == "Force" then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(9 + render.measure_text(v11, nil, "BODY").x / 2 + 4, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(41, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 41 + render.measure_text(v11, nil, "BODY").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, "BODY");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Aimbot stats") then
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            chance = math.ceil(v20 / (v21 + v20) * 100);
            if v20 == 0 and v21 == 0 then
                fnaychance = 0;
            else
                fnaychance = chance;
            end;
            render.gradient(vector(l_x_0 / 140, l_y_0 / 1.7 - v286 - 5), vector(25, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38));
            render.gradient(vector(25, l_y_0 / 1.7 - v286 - 5), vector(l_x_0 / 65 + render.measure_text(v11, nil, v20 .. " / " .. v21 .. " (" .. fnaychance .. "%) ").x / 2 + 10, l_y_0 / 1.7 - v286 + 24), color(0, 0, 0, 38), color(0, 0, 0, 0), color(0, 0, 0, 38), color(0, 0, 0, 0));
            render.text(v11, vector(l_x_0 / 140 + 4, l_y_0 / 1.7 - v286), color(200, 199, 197), nil, v20 .. " / " .. v21 .. " (" .. fnaychance .. "%) ");
            v286 = v286 - 35;
        end;
    end;
    if v131.other.gs_indicators:get() and v131.other.gs_indicators.sindicators2:get("Spectator list") then
        local v302 = entity.get_local_player();
        if v302 == nil then
            return;
        else
            if v302.m_hObserverTarget and (v302.m_iObserverMode == 4 or v302.m_iObserverMode == 5) then
                v302 = v302.m_hObserverTarget;
            end;
            local v303 = v302.get_spectators(v302);
            if v303 == nil then
                return;
            else
                for v304, v305 in ipairs(v303) do
                    local l_x_1 = render.screen_size().x;
                    local _ = render.screen_size().y;
                    local v308 = v305:get_name();
                    local l_x_2 = render.measure_text(1, "", v308).x;
                    if not v305:is_bot() or v305:is_player() then
                        render.text(1, vector(l_x_1 - l_x_2 - 7, -10 + v304 * 16), color(), "u", v308);
                    end;
                end;
            end;
        end;
    end;
    if v131.other.manual_arrows:get() then
        local v310 = 0;
        local v311 = render.screen_size().x / 2;
        local v312 = render.screen_size().y / 2;
        local v313 = l_animations_0.new("animation_scope_2", nil):update(l_animations_0.types.LERP, entity.get_local_player().m_bIsScoped and v312 - 27 or v312);
        local v314 = entity.get_local_player();
        local v315 = v131.other.manual_arrows.desync_color:get();
        local v316 = v131.other.manual_arrows.manual_color:get();
        local v317 = v131.other.manual_arrows.reverse:get();
        if v131.other.manual_arrows.dynamic:get() > 0 and v314 ~= nil then
            v310 = v317 and -54 + get_velocity(v314) / 60 * v131.other.manual_arrows.dynamic:get() or 45 + get_velocity(v314) / 60 * v131.other.manual_arrows.dynamic:get();
        else
            v310 = v317 and -54 or 45;
        end;
        local v318 = v131.other.manual_arrows.accent_color:get();
        if v131.other.manual_arrows.style:get() == "Teamskeet" then
            render.poly(color(0, 0, 0, 100), vector(v311 + v310 + 1, v312 - 8), vector(v311 + v310 + 12, v312), vector(v311 + v310 + 1, v312 + 8));
            render.rect(vector(v311 + v310 - 2, v312 - 8), vector(v311 + v310, v312 + 8), color(0, 0, 0, 100));
            render.poly(color(0, 0, 0, 100), vector(v311 - v310, v312 - 8), vector(v311 - v310 - 11, v312), vector(v311 - v310, v312 + 8));
            render.rect(vector(v311 - v310 + 1, v312 - 8), vector(v311 - v310 + 3, v312 + 8), color(0, 0, 0, 100));
            if rage.antiaim:inverter() then
                render.rect(vector(v311 - v310 + 1, v312 - 8), vector(v311 - v310 + 3, v312 + 8), v315);
            else
                render.rect(vector(v311 + v310 - 2, v312 - 8), vector(v311 + v310, v312 + 8), v315);
            end;
            if v317 then
                if v131.other.yaw_base:get() == "Right" then
                    render.poly(v316, vector(v311 - v310, v312 - 8), vector(v311 - v310 - 11, v312), vector(v311 - v310, v312 + 8));
                elseif v131.other.yaw_base:get() == "Left" then
                    render.poly(v316, vector(v311 + v310 + 1, v312 - 8), vector(v311 + v310 + 12, v312), vector(v311 + v310 + 1, v312 + 8));
                end;
            elseif v131.other.yaw_base:get() == "Left" then
                render.poly(v316, vector(v311 - v310, v312 - 8), vector(v311 - v310 - 11, v312), vector(v311 - v310, v312 + 8));
            elseif v131.other.yaw_base:get() == "Right" then
                render.poly(v316, vector(v311 + v310 + 1, v312 - 8), vector(v311 + v310 + 12, v312), vector(v311 + v310 + 1, v312 + 8));
            end;
        else
            render.text(verdanaar, vector(v311 + v310, v313), color(100, 100, 100, 200), "c", ">");
            render.text(verdanaar, vector(v311 - v310 + 2, v313), color(100, 100, 100, 200), "c", "<");
            if v317 then
                if v131.other.yaw_base:get() == "Right" then
                    render.text(verdanaar, vector(v311 - v310 + 2, v313), v318, "c", "<");
                elseif v131.other.yaw_base:get() == "Left" then
                    render.text(verdanaar, vector(v311 + v310, v313), v318, "c", ">");
                end;
            elseif v131.other.yaw_base:get() == "Left" then
                render.text(verdanaar, vector(v311 - v310 + 2, v313), v318, "c", "<");
            elseif v131.other.yaw_base:get() == "Right" then
                render.text(verdanaar, vector(v311 + v310, v313), v318, "c", ">");
            end;
        end;
    end;
    v254:update();
end);
local _ = render.screen_size().x;
local _ = render.screen_size().y;
local _ = 0;
local _ = 1;
local _ = 0;
local _ = 0;
local _ = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
local _ = 0;
lerp = function(v328, v329, v330)
    return v329 * (1 - v328) + v330 * v328;
end;
v131.other.damage_indicator.dmg_indy:visibility(false);
v131.other.damage_indicator.dmg_indx:visibility(false);
v131.other.solus_ui.pos_x_s:visibility(false);
v131.other.solus_ui.pos_y_s:visibility(false);
v131.other.solus_ui.pos_x1_s:visibility(false);
v131.other.solus_ui.pos_y1_s:visibility(false);
window = function(v331, v332, v333, v334, v335, v336)
    -- upvalues: v131 (ref)
    local v337 = render.measure_text(1, "", v335);
    local l_r_0 = v131.other.solus_ui.accent_col:get().r;
    local l_g_0 = v131.other.solus_ui.accent_col:get().g;
    local l_b_0 = v131.other.solus_ui.accent_col:get().b;
    local l_r_1 = v131.other.solus_ui.accent_col:get().r;
    local l_g_1 = v131.other.solus_ui.accent_col:get().g;
    local l_b_1 = v131.other.solus_ui.accent_col:get().b;
    if v131.other.solus_ui:get() then
        render.rect_outline(vector(v331 - 1, v332), vector(v331 + v333 + 4, v332 + v334 + 1), color(l_r_0, l_g_0, l_b_0, v336 / 5), 1, 4);
        render.rect(vector(v331 + 3, v332), vector(v331 + v333, v332 + 1), color(l_r_1, l_g_1, l_b_1, v336), 4);
        render.rect(vector(v331, v332 + 1), vector(v331 + v333 + 3, v332 + 16), color(0, 0, 0, v336 / 4), 4);
        render.circle_outline(vector(v331 + 3, v332 + 3), color(l_r_1, l_g_1, l_b_1, v336), 4, 190, 0.33, 1);
        render.circle_outline(vector(v331 + v333, v332 + 3), color(l_r_1, l_g_1, l_b_1, v336), 4, 260, 0.3, 1);
        render.gradient(vector(v331 - 1, v332 + 2), vector(v331, v332 + v334 - 4), color(l_r_1, l_g_1, l_b_1, v336), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, v336 / 2), color(l_r_1, l_g_1, l_b_1, 0));
        render.gradient(vector(v331 + v333 + 3, v332 + 2), vector(v331 + v333 + 4, v332 + v334 - 4), color(l_r_1, l_g_1, l_b_1, v336), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, v336 / 2), color(l_r_1, l_g_1, l_b_1, 0));
        render.text(1, vector(v331 + 1 + v333 / 2 + 1 - v337.x / 2, v332 + v334 / 2 - v337.y / 2), color(255, 255, 255, v336), "", v335);
    end;
end;
local l_x_4 = render.screen_size().x;
local l_y_3 = render.screen_size().y;
local v346 = 0;
local v347 = 1;
local _ = 0;
local v349 = 0;
local v350 = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
local v352 = 0;
events.render:set(function()
    -- upvalues: v131 (ref), v102 (ref), l_x_4 (ref)
    if v131.other.solus_ui:get() and v131.other.solus_ui.solus_widgets_s:get("Watermark") then
        if not globals.is_in_game then
            latency_text = "";
        elseif math.floor(utils.net_channel().latency[1] * 1000) < 0.1 then
            latency_text = " \194\183 \239\143\133 local";
        else
            latency_text = " \194\183 \239\143\133 " .. math.floor(utils.net_channel().latency[1] * 1000) .. "ms";
        end;
        if v131.other.solus_ui.custom_name:get() == "" then
            custom_fnay = common.get_username();
        else
            custom_fnay = v131.other.solus_ui.custom_name:get();
        end;
        local v353 = "\239\134\140 Illusion [" .. v102 .. "] \194\183 \239\128\135 " .. custom_fnay .. latency_text .. " " .. common.get_date("\194\183 \239\128\151 %H:%M");
        local l_x_5 = render.measure_text(1, "", v353).x;
        window(l_x_4 - l_x_5 - 19, 10, l_x_5 + 4, 16, v353, 255);
    end;
end);
is_bounded = function(v355, v356, v357, v358)
    local v359 = ui.get_mouse_position();
    return v355 <= v359.x and v359.x <= v357 and v356 <= v359.y and v359.y <= v358;
end;
local v375 = l_system_0.register({
    [1] = v131.other.solus_ui.pos_x_s, 
    [2] = v131.other.solus_ui.pos_y_s
}, vector(120, 60), "Test", function(v360)
    -- upvalues: v131 (ref), v350 (ref), v349 (ref), v347 (ref), v346 (ref)
    if v131.other.solus_ui:get() and v131.other.solus_ui.solus_widgets_s:get("Keybinds") then
        local v361 = 0;
        local v362 = globals.frametime * 16;
        local v363 = 0;
        local _ = 66;
        local v365 = {};
        local v366 = ui.get_binds();
        for v367 = 1, #v366 do
            local v368 = v366[v367];
            local v369 = v366[v367].mode == 1 and "holding" or v366[v367].mode == 2 and "toggled" or "[?]";
            local l_value_0 = v366[v367].value;
            local l_name_0 = v366[v367].name;
            if l_name_0 == "Peek Assist" then
                l_name_0 = "Quick peek";
            end;
            if l_name_0 == "Edge Jump" then
                l_name_0 = "Jump at edge";
            end;
            if l_name_0 == "Hide Shots" then
                l_name_0 = "Hide shots";
            end;
            if l_name_0 == "Min. Damage" then
                l_name_0 = "Minimum damage";
            end;
            if l_name_0 == "Fake Latency" then
                l_name_0 = "Ping spike";
            end;
            if l_name_0 == "Fake Duck" then
                l_name_0 = "Fake duck";
            end;
            if l_name_0 == "Safe Points" then
                l_name_0 = "Safe point";
            end;
            if l_name_0 == "Body Aim" then
                l_name_0 = "Body aim";
            end;
            if l_name_0 == "Double Tap" then
                l_name_0 = "Double tap";
            end;
            if l_name_0 == "Yaw Base" then
                l_name_0 = "Manual override";
            end;
            if l_name_0 == "Slow Walk" then
                l_name_0 = "Slow motion";
            end;
            if l_name_0 == "Dormant Aimbot" then
                l_name_0 = "Dormant aimbot";
            end;
            local v372 = render.measure_text(1, "", v369);
            local v373 = render.measure_text(1, "", l_name_0);
            if v350[v368.name] == nil then
                v350[v368.name] = {
                    alpha_k = 0
                };
            end;
            v350[v368.name].alpha_k = lerp(v362, v350[v368.name].alpha_k, v368.active and 255 or 0);
            render.text(1, vector(v360.position.x + 3, v360.position.y + 23 + v363), color(255, v350[v368.name].alpha_k), "", l_name_0);
            if l_name_0 == "Minimum damage" or l_name_0 == "Ping spike" then
                render.text(1, vector(v360.position.x + (v349 - v372.x) - render.measure_text(1, nil, l_value_0).x + 28, v360.position.y + 23 + v363), color(255, v350[v368.name].alpha_k), "", "[" .. l_value_0 .. "]");
            else
                render.text(1, vector(v360.position.x + (v349 - v372.x - 8), v360.position.y + 23 + v363), color(255, v350[v368.name].alpha_k), "", "[" .. v369 .. "]");
            end;
            v363 = v363 + 16 * v350[v368.name].alpha_k / 255;
            local v374 = v372.x + v373.x + 18;
            if v374 > 119 and v361 < v374 then
                v361 = v374;
            end;
            if v366.active then
                table.insert(v365, v366);
            end;
        end;
        v347 = lerp(v362, v347, (not (ui.get_alpha() <= 0) or v363 > 0) and 1 or 0);
        v349 = lerp(v362, v349, math.max(v361, 119));
        if ui.get_alpha() > 0 or v363 > 6 then
            v346 = lerp(v362, v346, math.max(ui.get_alpha() * 255, v363 > 1 and 255 or 0));
        elseif v363 < 15.99 and ui.get_alpha() == 0 then
            v346 = lerp(v362, v346, 0);
        end;
        if ui.get_alpha() or #v365 > 0 then
            window(v360.position.x, v360.position.y, v349, 16, "keybinds", v346);
        end;
    end;
end);
local v385 = l_system_0.register({
    [1] = v131.other.solus_ui.pos_x1_s, 
    [2] = v131.other.solus_ui.pos_y1_s
}, vector(120, 60), "Test2", function(v376)
    -- upvalues: v131 (ref), v352 (ref)
    if v131.other.solus_ui:get() and v131.other.solus_ui.solus_widgets_s:get("Spectator list") then
        local v377 = globals.frametime * 16;
        if ui.get_alpha() > 0 then
            v352 = lerp(v377, v352, math.max(ui.get_alpha() * 255, 0 > 1 and 255 or 0));
        elseif ui.get_alpha() == 0 then
            v352 = lerp(v377, v352, 0);
        end;
        window(v376.position.x, v376.position.y, 120, 16, "spectators", v352);
        local v378 = entity.get_local_player();
        if v378 == nil then
            return;
        else
            if v378.m_hObserverTarget and (v378.m_iObserverMode == 4 or v378.m_iObserverMode == 5) then
                v378 = v378.m_hObserverTarget;
            end;
            local v379 = v378.get_spectators(v378);
            if v379 == nil then
                return;
            else
                for v380, v381 in ipairs(v379) do
                    local v382 = v381:get_name();
                    local _ = render.measure_text(1, "", v382).x;
                    name_sub = string.len(v382) > 17 and string.sub(v382, 0, 17) .. "..." or v382;
                    local v384 = v381:get_steam_avatar();
                    if v384 == nil or v384.width <= 5 then
                        return;
                    elseif not v381:is_bot() or v381:is_player() then
                        render.text(1, vector(v376.position.x + 17, v376.position.y + 10 + v380 * 16), color(), "u", name_sub);
                        render.texture(v384, vector(v376.position.x + 1, v376.position.y + 10 + v380 * 16), vector(12, 12), color(), "f", 0);
                    end;
                end;
                if #v378.get_spectators(v378) > 0 or v378.m_iObserverMode == 4 or v378.m_iObserverMode == 5 then
                    window(v376.position.x, v376.position.y, 120, 16, "spectators", 255);
                end;
            end;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v375 (ref), v385 (ref)
    v375:update();
    v385:update();
end);
local v386 = {
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
events.item_purchase:set(function(v387)
    -- upvalues: v131 (ref)
    if v131.other.shot_logs:get() and v131.other.shot_logs.purchases:get() then
        local v388 = entity.get(v387.userid, true);
        local l_weapon_0 = v387.weapon;
        if v388 == nil then
            return;
        elseif l_weapon_0 == "weapon_unknown" then
            return;
        elseif not v388:is_enemy() then
            return;
        else
            print_raw(("\a{Link Active}[neverlose]\aD5D5D5FF %s bought \aACFF86%s"):format(v388:get_name(), l_weapon_0));
            print_dev(("%s bought %s"):format(v388:get_name(), l_weapon_0));
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v131 (ref), v10 (ref)
    if v131.other.shot_logs:get() then
        v10.logs:override("");
    else
        v10.logs:override();
    end;
end);
events.aim_ack:set(function(v390)
    -- upvalues: v131 (ref), v386 (ref)
    if v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Upper-left") then
        local _ = entity.get_local_player();
        local v392 = entity.get(v390.target);
        local l_state_0 = v390.state;
        local l_state_1 = v390.state;
        if not v392 then
            return;
        elseif v392 == nil then
            return;
        else
            local l_m_iHealth_1 = v392.m_iHealth;
            if entity.get_local_player() == nil then
                return;
            elseif entity.get_local_player():get_player_weapon() == nil then
                return;
            else
                local v396 = entity.get_local_player():get_player_weapon():get_weapon_index() == 31;
                if l_state_1 == "spread" then
                    l_state_1 = "\aFEEA7Dspread";
                end;
                if l_state_1 == "prediction error" then
                    l_state_1 = "\aFEEA7Dpred. error";
                end;
                if l_state_1 == "correction" then
                    l_state_1 = "\aFF5959resolver";
                end;
                if l_state_1 == "misprediction" then
                    l_state_1 = "\aFEEA7Dmisprediction";
                end;
                if l_state_1 == "lagcomp failure" then
                    l_state_1 = "\aFF5959lagcomp failure";
                end;
                if l_state_0 == "correction" then
                    l_state_0 = "resolver";
                end;
                if v396 then
                    if l_state_0 == nil then
                        print_dev("\238\130\183 zeused " .. v392:get_name() .. " for " .. v390.damage .. " damage (" .. l_m_iHealth_1 .. " health remaining)");
                        print_raw("\a{Link Active}[neverlose] \aD5D5D5FFZeused " .. v392:get_name() .. " for " .. v390.damage .. " damage (" .. l_m_iHealth_1 .. " health remaining)");
                    else
                        print_dev(("Missed shot in %s in the %s due to " .. l_state_0 .. ""):format(v392:get_name(), v386[v390.wanted_hitgroup]));
                        print_raw(("\a{Link Active}[neverlose] \aD5D5D5FFMissed shot in %s in the %s due to " .. l_state_1 .. "\aD5D5D5 [hc: " .. string.format("%.f", v390.hitchance) .. " | damage: " .. string.format("%.f", v390.wanted_damage) .. "]"):format(v392:get_name(), v386[v390.wanted_hitgroup]));
                    end;
                end;
                if not v396 then
                    if l_state_0 == nil then
                        print_dev(("hit " .. string.lower(v392:get_name()) .. " in %s for %d damage (" .. l_m_iHealth_1 .. " hp)"):format(v386[v390.hitgroup], v390.damage));
                        print_raw(("\a{Link Active}[neverlose] \aD5D5D5FFHit " .. v392:get_name() .. " in the %s for %d(" .. string.format("%.f", v390.wanted_damage) .. ") damage (" .. l_m_iHealth_1 .. " health remaining) [aimed: " .. v386[v390.wanted_hitgroup] .. " | bt: %s]"):format(v386[v390.hitgroup], v390.damage, v390.backtrack));
                    else
                        print_dev(("miss " .. string.lower(v392:get_name()) .. " in %s due to " .. l_state_0 .. ""):format(v386[v390.wanted_hitgroup]));
                        print_raw(("\a{Link Active}[neverlose] \aD5D5D5FFMissed shot in %s's %s due to " .. l_state_1 .. "\aD5D5D5 [hc: " .. string.format("%.f", v390.hitchance) .. " | damage: " .. string.format("%.f", v390.wanted_damage) .. "]"):format(v392:get_name(), v386[v390.wanted_hitgroup]));
                    end;
                end;
            end;
        end;
    end;
end);
events.player_hurt:set(function(v397)
    -- upvalues: v131 (ref)
    if v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Upper-left") then
        local v398 = entity.get_local_player();
        local v399 = entity.get(v397.attacker, true);
        local l_weapon_1 = v397.weapon;
        local v401 = "Hit";
        if l_weapon_1 == "hegrenade" then
            v401 = "Naded";
            hit_icon = "\239\135\162";
        end;
        if l_weapon_1 == "inferno" then
            v401 = "Burned";
            hit_icon = "\239\159\164";
        end;
        if l_weapon_1 == "knife" then
            v401 = "Knifed";
            hit_icon = "\239\155\181";
        end;
        if (l_weapon_1 == "hegrenade" or l_weapon_1 == "inferno" or l_weapon_1 == "knife") and v398 == v399 then
            local v402 = entity.get(v397.userid, true);
            print_raw(("\a{Link Active}[neverlose] \aD5D5D5FF" .. v401 .. " %s for %d damage (%d health remaining)"):format(v402:get_name(), v397.dmg_health, v397.health));
            print_dev(("" .. hit_icon .. " " .. string.lower(v401) .. " " .. string.lower(v402:get_name()) .. " for %d damage (%d hp)"):format(v397.dmg_health, v397.health));
        end;
    end;
end);
events.player_hurt:set(function(v403)
    -- upvalues: v131 (ref), v386 (ref), v23 (ref), v22 (ref)
    if v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Under crosshair") and entity.get_local_player() == entity.get(v403.attacker, true) then
        local v404 = entity.get(v403.userid, true);
        local v405 = v131.other.shot_logs.hit_color:get():to_hex();
        local _ = v131.other.shot_logs.miss_color:get():to_hex();
        local v407 = v386[v403.hitgroup];
        local l_weapon_2 = v403.weapon;
        if l_weapon_2 == "inferno" then
            return;
        else
            if v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Under crosshair") and not v131.other.shot_logs.select_log:get("Upper-left") then
                print_raw(("\a{Link Active}[neverlose] \aD5D5D5FFHit %s in the " .. v407 .. " for %d damage (%d hp remaining)"):format(v404:get_name(), v403.dmg_health, v403.health));
            end;
            local v409 = "Hit";
            hit_icon = "\239\129\155";
            if l_weapon_2 == "hegrenade" then
                v409 = "Naded";
                hit_icon = "\239\135\162";
            end;
            if l_weapon_2 == "inferno" then
                v409 = "Burned";
                hit_icon = "\239\159\164";
            end;
            if l_weapon_2 == "knife" then
                v409 = "Knifed";
                hit_icon = "\239\155\181";
            end;
            if v403.health < 1 then
                v23[#v23 + 1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = "\a" .. v405 .. "" .. hit_icon .. " \aFFFFFFC8Killed \a" .. v405 .. "" .. v404:get_name() .. " \aFFFFFFC8in the \a" .. v405 .. "" .. v407 .. " \aFFFFFFC8for \a" .. v405 .. "" .. v403.dmg_health .. " \aFFFFFFC8damage (\a" .. v405 .. "died\aFFFFFFC8)", 
                    [2] = globals.tickcount + 300
                };
            else
                v23[#v23 + 1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = "\a" .. v405 .. "" .. hit_icon .. " \aFFFFFFC8" .. v409 .. " \a" .. v405 .. "" .. v404:get_name() .. " \aFFFFFFC8in the \a" .. v405 .. "" .. v407 .. " \aFFFFFFC8for \a" .. v405 .. "" .. v403.dmg_health .. " \aFFFFFFC8damage (\a" .. v405 .. "" .. v403.health .. " \aFFFFFFC8hp remaining)", 
                    [2] = globals.tickcount + 300
                };
            end;
            v22 = v22 == 999 and 1 or v22 + 1;
        end;
    end;
end);
events.aim_ack:set(function(v410)
    -- upvalues: v131 (ref), v386 (ref), v23 (ref), v22 (ref)
    if v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Under crosshair") then
        player_name = v410.target:get_name();
        hitgroup = v386[v410.hitgroup];
        wanted_hitgroup = v386[v410.wanted_hitgroup];
        miss_color = v131.other.shot_logs.miss_color:get():to_hex();
        local l_state_2 = v410.state;
        if l_state_2 == "correction" then
            l_state_2 = "resolver";
        end;
        if l_state_2 == "prediction error" then
            l_state_2 = "pred. error";
        end;
        if l_state_2 ~= nil and v131.other.shot_logs:get() and v131.other.shot_logs.select_log:get("Under crosshair") and not v131.other.shot_logs.select_log:get("Upper-left") then
            print_raw(("\a{Link Active}[neverlose] \aD5D5D5FFMissed shot in %s in the %s due to %s"):format(player_name, wanted_hitgroup, l_state_2));
        end;
        if l_state_2 ~= nil then
            v23[#v23 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = "\a" .. miss_color .. "\239\128\141 \aFFFFFFC8Missed shot in \a" .. miss_color .. "" .. player_name .. "'s \aFFFFFFC8" .. wanted_hitgroup .. " \aFFFFFFC8due to \a" .. miss_color .. "" .. l_state_2 .. " ", 
                [2] = globals.tickcount + 300
            };
        end;
        v22 = v22 == 999 and 1 or v22 + 1;
    end;
end);
events.render:set(function()
    -- upvalues: v23 (ref), l_animations_0 (ref), v131 (ref)
    if #v23 > 0 then
        if globals.tickcount >= v23[1][2] then
            if v23[1][3] > 0 then
                v23[1][3] = v23[1][3] - 20;
            elseif v23[1][3] <= 0 then
                table.remove(v23, 1);
            end;
        end;
        if #v23 > 6 then
            table.remove(v23, 1);
        end;
        if globals.is_connected == false then
            table.remove(v23, #v23);
        end;
        for v412 = 1, #v23 do
            text_size = render.measure_text(1, nil, v23[v412][1]).x;
            if v23[v412][3] < 255 then
                v23[v412][3] = v23[v412][3] + 10;
            end;
            local v413 = 255;
            local v414 = 255;
            local v415 = 255;
            local v416 = 255;
            if v23[v412][4] == "Hit" then
                local v417 = 186;
                local v418 = 235;
                local v419 = 50;
                v416 = 255;
                v415 = v419;
                v414 = v418;
                v413 = v417;
            elseif v23[v412][4] == "Miss" then
                if v23[v412][5] == "spread" then
                    local v420 = 255;
                    local v421 = 125;
                    local v422 = 0;
                    v416 = 255;
                    v415 = v422;
                    v414 = v421;
                    v413 = v420;
                elseif v23[v412][5] == "correction" or v23[v412][5] == "backtrack failure" or v23[v412][5] == "damage rejection" then
                    local v423 = 255;
                    local v424 = 0;
                    local v425 = 0;
                    v416 = 255;
                    v415 = v425;
                    v414 = v424;
                    v413 = v423;
                elseif v23[v412][5] == "prediction error" or v23[v412][5] == "misprediction" then
                    local v426 = 255;
                    local v427 = 120;
                    local v428 = 120;
                    v416 = 255;
                    v415 = v428;
                    v414 = v427;
                    v413 = v426;
                else
                    local v429 = 0;
                    local v430 = 120;
                    local v431 = 255;
                    v416 = 255;
                    v415 = v431;
                    v414 = v430;
                    v413 = v429;
                end;
            elseif v23[v412][4] == "Notify" then
                local v432 = 0;
                local v433 = 163;
                local v434 = 255;
                v416 = 255;
                v415 = v434;
                v414 = v433;
                v413 = v432;
            end;
            if l_animations_0.new("shadow_alpha", shadow_alpha):update(l_animations_0.types.LERP, v131.other.shot_logs.background_log:get() and 255 or 0) > 0 then
                render.shadow(vector(render.screen_size().x / 2 - text_size / 2 + 5, render.screen_size().y / 1.29 - v23[v412][3] / 45 + 15 * v412 + 10), vector(render.screen_size().x / 2 - text_size / 2 + text_size - 5, render.screen_size().y / 1.29 - v23[v412][3] / 45 + 15 * v412 + 10), color(v413, v414, v415, v23[v412][3]), 30, 0, 0);
            end;
            render.text(1, vector(render.screen_size().x / 2 - text_size / 2, render.screen_size().y / 1.3 - v23[v412][3] / 45 + 15 * v412 + 10), color(255, 255, 255, v23[v412][3]), nil, v23[v412][1]);
        end;
    end;
end);
local v435 = {};
local v436 = {};
on_die = function()
    -- upvalues: v435 (ref), v436 (ref)
    v435 = {};
    v436 = {};
end;
events.player_death:set(on_die);
extrapolate_pos = function(v437, v438, v439, v440, v441)
    for _ = 1, v440 do
        v437 = v437 + v441.m_vecVelocity.x * 0.015625;
        v438 = v438 + v441.m_vecVelocity.y * 0.015625;
        v439 = v439 + v441.m_vecVelocity.z * 0.015625;
    end;
    return vector(v437, v438, v439);
end;
Angle_Vector = function(v443, v444)
    local v445 = nil;
    local v446 = nil;
    local v447 = nil;
    local v448 = nil;
    v445 = math.sin(math.rad(v443));
    v446 = math.sin(math.rad(v444));
    v447 = math.cos(math.rad(v443));
    v448 = math.cos(math.rad(v444));
    return vector(v447 * v448, v447 * v446, -v445);
end;
ragebot = function(v449)
    -- upvalues: v131 (ref)
    local v450 = entity.get_local_player();
    if v131.other.avoid_collisions:get() then
        local v451 = v131.other.avoid_collisions.distance:get();
        local l_y_4 = render.camera_angles().y;
        local l_m_vecOrigin_0 = v450.m_vecOrigin;
        local l_huge_2 = math.huge;
        local l_huge_3 = math.huge;
        for v456 = 1, 180 do
            local l_x_7 = Angle_Vector(0, l_y_4 + v456 - 90).x;
            local l_y_5 = Angle_Vector(0, l_y_4 + v456 - 90).y;
            local _ = Angle_Vector(0, l_y_4).z;
            local v460 = l_m_vecOrigin_0.x + l_x_7 * 70;
            local v461 = l_m_vecOrigin_0.y + l_y_5 * 70;
            local v462 = l_m_vecOrigin_0.z + 60;
            local v463 = utils.trace_line(l_m_vecOrigin_0, vector(v460, v461, v462), nil, nil, 1);
            if l_m_vecOrigin_0:dist(v463.end_pos) < l_huge_2 then
                l_huge_2 = l_m_vecOrigin_0:dist(v463.end_pos);
                l_huge_3 = v456;
            end;
        end;
        if l_huge_2 < 25 + v451 and v449.in_jump and not v449.in_moveright and not v449.in_moveleft and not v449.in_back then
            forward_velo = math.abs(get_velocity(v450) * math.cos(math.rad(l_huge_3)));
            if math.abs(l_huge_3 - 90) < 40 then
                side_velo = get_velocity(v450) * math.sin(math.rad(l_huge_3)) * (25 + v451 - l_huge_2) / 15;
            else
                side_velo = get_velocity(v450) * math.sin(math.rad(l_huge_3));
            end;
            v449.forwardmove = forward_velo;
            if l_huge_3 >= 90 then
                v449.sidemove = side_velo;
            else
                v449.sidemove = side_velo * -1;
            end;
        end;
    end;
end;
damage_trace = function(v464)
    -- upvalues: l_x_4 (ref), l_y_3 (ref)
    local v465 = entity.get_local_player();
    local l_x_8 = v465:get_origin().x;
    local l_y_6 = v465:get_origin().y;
    z = v465:get_origin().z;
    l_y_3 = l_y_6;
    l_x_4 = l_x_8;
    for v468 = 0, math.pi * 2, math.pi * 2 / 8 do
        if utils.trace_line(vector(10 * math.cos(v468) + l_x_4, 10 * math.sin(v468) + l_y_3, z), vector(10 * math.cos(v468) + l_x_4, 10 * math.sin(v468) + l_y_3, z - v464), self).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
local v469 = false;
damage_setup = function()
    -- upvalues: v131 (ref), v469 (ref)
    if not v131.other.no_fall:get() then
        return;
    else
        local v470 = entity.get_local_player();
        if v470 == nil then
            return;
        else
            if v470.m_vecVelocity.z >= -500 then
                v469 = false;
            elseif damage_trace(15) then
                v469 = false;
            elseif damage_trace(75) then
                v469 = true;
            end;
            return;
        end;
    end;
end;
events.createmove:set(damage_setup);
damage_duck = function(v471)
    -- upvalues: v131 (ref), v469 (ref)
    if not v131.other.no_fall:get() then
        return;
    else
        local v472 = entity.get_local_player();
        if v472 == nil then
            return;
        else
            if v472.m_vecVelocity.z < -500 then
                if v469 then
                    v471.in_duck = 1;
                else
                    v471.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
events.createmove:set(damage_duck);
unmute_players = function()
    -- upvalues: v131 (ref)
    if not v131.other.unmute:get() then
        return;
    else
        local v473 = v131.other.unmute.enemy_only:get();
        entity.get_players(v473, true, function(v474)
            -- upvalues: v131 (ref)
            local v475 = panorama.MatchStatsAPI.GetPlayerXuid(v474:get_index());
            local v476 = panorama.FriendsListAPI.IsSelectedPlayerMuted(v475);
            if v131.other.unmute.combo:get() == "Mute" and not v476 then
                panorama.FriendsListAPI.ToggleMute(v475);
            elseif v131.other.unmute.combo:get() == "Unmute" and v476 then
                panorama.FriendsListAPI.ToggleMute(v475);
            end;
        end);
        return;
    end;
end;
v131.other.unmute:set_callback(function()
    -- upvalues: v131 (ref)
    if v131.other.unmute:get() then
        unmute_players();
    end;
end);
v131.other.unmute:set_callback(function()
    -- upvalues: v131 (ref)
    if not v131.other.unmute:get() then
        entity.get_players(false, true, function(v477)
            local v478 = panorama.MatchStatsAPI.GetPlayerXuid(v477:get_index());
            panorama.FriendsListAPI.ToggleMute(v478);
        end);
    end;
end);
v131.other.unmute.combo:set_callback(function()
    -- upvalues: v131 (ref)
    if v131.other.unmute:get() then
        unmute_players();
    end;
end);
lagcomp = function()
    -- upvalues: v131 (ref), v435 (ref), v436 (ref)
    if v131.other.lagcomp:get() then
        local v479 = entity.get_players();
        local v480 = entity.get_local_player();
        if v480 == nil or v480.m_iHealth <= 0 then
            return;
        else
            if #v435 ~= #v479 then
                v436 = {};
            end;
            for _, v482 in ipairs(v479) do
                if v482 ~= nil and v482.m_iTeamNum ~= v480.m_iTeamNum and not v482:is_dormant() then
                    if v435.ents == nil or v482.m_iHealth <= 0 then
                        v435.ents = {};
                    end;
                    if v482 ~= nil then
                        table.insert(v435.ents, v482.m_flSimulationTime);
                        if #v435.ents > 38 then
                            table.remove(v435.ents, 1);
                        end;
                        if v435.ents ~= nil then
                            local v483 = 1;
                            for v484 = 1, 38 do
                                if v435.ents[#v435.ents] == v435.ents[#v435.ents - v484] then
                                    v483 = v484;
                                end;
                            end;
                            if v435.ents[#v435.ents] ~= v435.ents[#v435.ents - 24] then
                                v483 = 1;
                            end;
                            if v483 >= 24 then
                                table.insert(v436, {
                                    [1] = v482, 
                                    [2] = globals.realtime
                                });
                            end;
                        end;
                    end;
                end;
            end;
            for v485 = 1, #v436 do
                if v436[v485] ~= nil and v436[v485][1] ~= nil and v436[v485][2] ~= nil then
                    local l_m_vecOrigin_1 = v436[v485][1].m_vecOrigin;
                    if globals.realtime - v436[v485][2] <= 0.21875 then
                        render.line(render.world_to_screen(l_m_vecOrigin_1), render.world_to_screen(extrapolate_pos(l_m_vecOrigin_1.x - 15, l_m_vecOrigin_1.y - 15, l_m_vecOrigin_1.z, 14, v436[v485][1])), color(47, 117, 221, 255));
                        local v487 = extrapolate_pos(l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z, 14, v436[v485][1]);
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z)), render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z)), render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z)), render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z)), render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z + 70)), render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z + 70)), render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z + 70)), render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z + 70)), render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z)), render.world_to_screen(vector(v487.x - 15, v487.y - 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z)), render.world_to_screen(vector(v487.x - 15, v487.y + 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z)), render.world_to_screen(vector(v487.x + 15, v487.y - 15, v487.z + 70)), color(47, 117, 221, 255));
                        render.line(render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z)), render.world_to_screen(vector(v487.x + 15, v487.y + 15, v487.z + 70)), color(47, 117, 221, 255));
                    end;
                end;
            end;
        end;
    else
        v435 = {};
        v436 = {};
    end;
end;
setup_viewmodel = function()
    -- upvalues: v131 (ref)
    if v131.other.viewmodel:get() then
        cvar.viewmodel_offset_x:int(v131.other.viewmodel.x:get() / 10, true);
        cvar.viewmodel_offset_y:float(v131.other.viewmodel.y:get() / 10, true);
        cvar.viewmodel_offset_z:float(v131.other.viewmodel.z:get() / 10, true);
        cvar.viewmodel_fov:float(v131.other.viewmodel.fov:get(), true);
    end;
end;
events.render:set(setup_viewmodel);
reset_viewmodel = function()
    -- upvalues: v107 (ref), v108 (ref), v109 (ref), v106 (ref), v110 (ref)
    cvar.viewmodel_offset_x:int(v107);
    cvar.viewmodel_offset_y:float(v108);
    cvar.viewmodel_offset_z:float(v109);
    cvar.viewmodel_fov:float(v106);
    cvar.cl_righthand:int(v110);
end;
v131.other.viewmodel.reset_val:set_callback(function()
    -- upvalues: v131 (ref), v107 (ref), v108 (ref), v109 (ref), v106 (ref)
    v131.other.viewmodel.x:set(v107);
    v131.other.viewmodel.y:set(v108);
    v131.other.viewmodel.z:set(v109);
    v131.other.viewmodel.fov:set(v106);
end);
v131.other.viewmodel:set_callback(function()
    -- upvalues: v131 (ref)
    if not v131.other.viewmodel:get() then
        reset_viewmodel();
    end;
end);
events.render:set(function(_)
    -- upvalues: v131 (ref), v55 (ref), v54 (ref), v56 (ref)
    lagcomp();
    if v131.other.viewmodel_aspectratio_slider:get() then
        if ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"):override(false) then
            ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"):override(true);
        end;
        if cvar.r_aspectratio:float() ~= v131.other.viewmodel_aspectratio_slider.amount:get() / 100 then
            cvar.r_aspectratio:float(v131.other.viewmodel_aspectratio_slider.amount:get() / 100);
        end;
    else
        cvar.r_aspectratio:float(0);
    end;
    if v131.other.custom_console_color:get() then
        local l_get_materials_0 = materials.get_materials;
        local v490 = v131.other.custom_console_color.console_color:get();
        if not v55(v54) then
            v490 = color();
        end;
        do
            local l_v490_0 = v490;
            for v492 = 1, #v56 do
                l_get_materials_0(v56[v492], false, function(v493)
                    -- upvalues: l_v490_0 (ref)
                    v493:alpha_modulate(l_v490_0.a / 255);
                    v493:color_modulate(l_v490_0);
                end);
            end;
        end;
    end;
end);
createmoving = function(v494)
    ragebot(v494);
end;
events.createmove:set(createmoving);
v131.other.custom_console_color:set_callback(function()
    -- upvalues: v131 (ref), v56 (ref)
    if not v131.other.custom_console_color.console_color:get() then
        local l_get_materials_1 = materials.get_materials;
        local v496 = color(255, 255, 255, 255);
        do
            local l_v496_0 = v496;
            for v498 = 1, #v56 do
                l_get_materials_1(v56[v498], false, function(v499)
                    -- upvalues: l_v496_0 (ref)
                    v499:alpha_modulate(l_v496_0.a / 255);
                    v499:color_modulate(l_v496_0);
                end);
            end;
        end;
    end;
end);
local function v501(v500)
    return math.floor(v500 * 100) / 100;
end;
local function v509(v502, v503, v504, v505, v506, v507)
    -- upvalues: v501 (ref)
    if v507 == nil or v507 == false then
        adding = 0;
    else
        adding = 5;
    end;
    local v508 = 144 / (1 / globals.frametime);
    if v506 == nil or v506 == true then
        if v505 == nil then
            v505 = 0.2;
        end;
        if v502 then
            if v503 ~= v504 then
                v503 = v503 + (v504 + adding - v503) * v505 * v508;
            else
                v503 = v504;
            end;
        elseif v503 > 0 then
            v503 = v503 - v503 * v505 * v508;
        else
            v503 = 0;
        end;
    else
        v503 = v502 and v504 or 0;
    end;
    return v501(v503);
end;
local function v518()
    -- upvalues: v204 (ref), v509 (ref), v131 (ref), v10 (ref)
    local v510 = entity.get_local_player();
    if (v510 == nil or v510.m_iHealth <= 0) and ui.get_alpha() == 0 then
        return;
    else
        if v510 ~= nil and v510.m_iHealth > 0 then
            v204.scope.scoped = v510.m_bIsScoped;
        else
            v204.scope.scoped = false;
        end;
        v204.scope.scope = v509(v131.other.better_scope:get() and v204.scope.scoped, v204.scope.scope, 255, 0.12, v131.other.better_scope.adjustments:get("Animations"));
        if v204.scope.scope > 0 then
            local l_better_scope_0 = v131.other.better_scope;
            local v512 = l_better_scope_0.pos:get();
            local v513 = l_better_scope_0.offset:get();
            local v514 = l_better_scope_0.color:get();
            local v515 = render.screen_size();
            local v516 = l_better_scope_0.glow:get();
            local v517 = l_better_scope_0.glow_color:get();
            v204.scope.first_alpha = v509(l_better_scope_0.adjustments:get("Invert"), v204.scope.first_alpha, 255, 0.04, nil, true);
            v204.scope.second_alpha = v509(not l_better_scope_0.adjustments:get("Invert"), v204.scope.second_alpha, 255, 0.04, nil, true);
            first_color = color(v514.r, v514.g, v514.b, v514.a * v204.scope.scope / 255 * v204.scope.first_alpha / 255);
            second_color = color(v514.r, v514.g, v514.b, v514.a * v204.scope.scope / 255 * v204.scope.second_alpha / 255);
            if l_better_scope_0.adjustments:get("Glow") then
                if l_better_scope_0.enable_color:get() then
                    g_color = color(v517.r, v517.g, v517.b, v516 * 2.55 * v204.scope.scope / 255);
                else
                    g_color = color(v514.r, v514.g, v514.b, v516 * 2.55 * v204.scope.scope / 255);
                end;
                render.shadow(vector(v515.x / 2 + v512 * v204.scope.scope / 255, v515.y / 2), vector(v515.x / 2 + v512 + v513 * v204.scope.scope / 255, v515.y / 2), g_color, nil, nil, 0);
                render.shadow(vector(v515.x / 2 - v513 * v204.scope.scope / 255 - v512 + 2, v515.y / 2), vector(v515.x / 2 - v512 * v204.scope.scope / 255 + 2, v515.y / 2), g_color, nil, nil, 0);
                render.shadow(vector(v515.x / 2, v515.y / 2 - v513 * v204.scope.scope / 255 - v512 + 2), vector(v515.x / 2, v515.y / 2 - v512 * v204.scope.scope / 255 + 2), g_color, nil, nil, 0);
                render.shadow(vector(v515.x / 2, v515.y / 2 + v512 * v204.scope.scope / 255), vector(v515.x / 2, v515.y / 2 + v513 * v204.scope.scope / 255 + v512), g_color, nil, nil, 0);
            end;
            render.gradient(vector(v515.x / 2 + v512 * v204.scope.scope / 255, v515.y / 2), vector(v515.x / 2 + v512 + v513 * v204.scope.scope / 255, v515.y / 2 + 1), second_color, first_color, second_color, first_color);
            render.gradient(vector(v515.x / 2 - v512 * v204.scope.scope / 255 + 2, v515.y / 2), vector(v515.x / 2 - v513 * v204.scope.scope / 255 - v512 + 2, v515.y / 2 + 1), second_color, first_color, second_color, first_color);
            render.gradient(vector(v515.x / 2, v515.y / 2 - v512 * v204.scope.scope / 255 + 2), vector(v515.x / 2 + 1, v515.y / 2 - v513 * v204.scope.scope / 255 - v512 + 2), second_color, second_color, first_color, first_color);
            render.gradient(vector(v515.x / 2, v515.y / 2 + v512 * v204.scope.scope / 255), vector(v515.x / 2 + 1, v515.y / 2 + v513 * v204.scope.scope / 255 + v512), second_color, second_color, first_color, first_color);
        end;
        if v131.other.better_scope:get() then
            if v10.scope_type:get_override() ~= "Remove All" then
                v10.scope_type:override("Remove All");
            end;
        elseif v10.scope_type:get_override() ~= v10.scope_type:get() then
            v10.scope_type:override(v10.scope_type:get());
        end;
        return;
    end;
end;
kibit_data = {};
local function v520(v519)
    -- upvalues: v131 (ref)
    if v131.other.kibit_marker:get() and entity.get_local_player() ~= nil and entity.get_local_player():is_alive() and v519.state == nil then
        table.insert(kibit_data, {
            [1] = v519.aim, 
            [2] = globals.realtime + 3
        });
    end;
end;
local function v523()
    -- upvalues: v131 (ref)
    if v131.other.kibit_marker:get() and entity.get_local_player() ~= nil and entity.get_local_player():is_alive() then
        for _, v522 in pairs(kibit_data) do
            if globals.realtime > v522[2] then
                table.remove(kibit_data, 1);
            end;
            if v522[1]:to_screen() ~= nil then
                render.rect(vector(v522[1]:to_screen().x - 1, v522[1]:to_screen().y - 6), vector(v522[1]:to_screen().x + 1, v522[1]:to_screen().y + 6), color(34, 214, 132, 255));
                render.rect(vector(v522[1]:to_screen().x - 6, v522[1]:to_screen().y - 1), vector(v522[1]:to_screen().x + 6, v522[1]:to_screen().y + 1), color(108, 182, 203, 255));
            end;
        end;
    end;
end;
events.aim_ack:set(v520);
events.render:set(v523);
events.render:set(v518);
events.round_prestart:set(function()
    kibit_data = {};
end);
local v527 = esp.enemy:new_text("R8 Helper", "DMG+", function(v524)
    local v525 = entity.get_local_player();
    local v526 = v525:get_origin():dist((v524:get_origin()));
    if not v525 then
        return;
    elseif v525:is_alive() and v525:get_player_weapon():get_weapon_index() == 64 and v524.m_ArmorValue == 0 and v526 < 585 then
        return "DMG+";
    else
        return;
    end;
end);
v131.other.r8_helper:set_callback(function()
    -- upvalues: v131 (ref), v527 (ref)
    if v131.other.r8_helper:get() then
        v527:set(true);
    end;
    if not v131.other.r8_helper:get() then
        v527:set(false);
    end;
end);
defensive_air = function(v528)
    -- upvalues: v131 (ref)
    asdsadas(v528);
    if v131.other.defensive_air:get() then
        local v529 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
        local _ = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit");
        if entity.get_local_player() == nil then
            return;
        else
            if not v528.in_jump then
                v529:override();
            end;
            if v131.other.defensive_air:get() and v528.in_jump then
                v529:override("Always On");
            end;
        end;
    end;
end;
events.createmove:set(defensive_air);
destroy_lc = function()
    -- upvalues: v131 (ref)
    local v531 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
    if not v131.other.defensive_air:get() then
        v531:override();
    end;
end;
v131.other.defensive_air:set_callback(destroy_lc);
hitchanceoverride = function(v532)
    -- upvalues: v131 (ref)
    local v533 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
    if not v131.other.custom_hc:get() then
        return;
    else
        local v534 = entity.get_local_player();
        if not v534 then
            return;
        else
            local v535 = v534:get_player_weapon();
            if v535 == nil then
                return;
            else
                local v536 = v535:get_weapon_index() == 38 or not (v535:get_weapon_index() ~= 11) or not (v535:get_weapon_index() ~= 9) or v535:get_weapon_index() == 40;
                if v131.other.custom_hc.hc_cond:get("No scope") and not v534.m_bIsScoped and v536 then
                    v533:override(v131.other.custom_hc.hc_ns:get());
                end;
                if v131.other.custom_hc.hc_cond:get("Air") and v532.in_jump and v536 then
                    v533:override(v131.other.custom_hc.hc_air:get());
                end;
                if (not v131.other.custom_hc.hc_cond:get("No scope") or v532.in_jump or v534.m_bIsScoped or not v536) and (not v131.other.custom_hc.hc_cond:get("Air") or not v532.in_jump or not v536) then
                    v533:override();
                end;
                return;
            end;
        end;
    end;
end;
events.createmove:set(hitchanceoverride);
events.createmove:set(function()
    -- upvalues: v10 (ref), v131 (ref)
    local v537 = entity.get_local_player();
    if v537 == nil then
        return;
    elseif v537:get_player_weapon() == nil then
        return;
    elseif v10.aaos:get() then
        return;
    else
        local v538 = v537:get_player_weapon():get_weapon_index();
        local v539 = v538 == 2 or not (v538 ~= 3) or not (v538 ~= 4) or not (v538 ~= 30) or not (v538 ~= 32) or not (v538 ~= 36) or not (v538 ~= 61) or v538 == 63;
        local v540 = v538 == 11 or v538 == 38;
        local v541 = v538 == 9;
        local v542 = v538 == 40;
        local v543 = v538 == 1 or v538 == 64;
        local v544 = v537:get_player_weapon():get_classname() == "CKnife" or v538 == 31;
        local v545 = entity.get_players(true, false);
        for v546, v547 in pairs({
            [1] = v539, 
            [2] = v540, 
            [3] = v541, 
            [4] = v542, 
            [5] = v543, 
            [6] = v544, 
            [7] = not v539 and not v540 and not v541 and not v542 and not v543 and not v544
        }) do
            if v131.other.automatic_dt_release:get() and v131.other.automatic_dt_release.weapons:get(v546) and v547 and bit.band(v537.m_fFlags, bit.lshift(1, 0)) == 0 then
                for v548 = 1, #v545 do
                    if v545[v548]:is_alive() and v545[v548]:is_visible(v545[v548]:get_origin()) then
                        rage.exploit:force_teleport();
                    end;
                end;
            end;
        end;
        return;
    end;
end);
local v549 = 0;
local function v551(v550)
    -- upvalues: v549 (ref)
    v549 = v549 + 1;
    if v549 > #v550 then
        v549 = 1;
    end;
    return v550[v549];
end;
local v552 = {
    [1] = "\209\133\209\131\208\181\208\178\208\190 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
    [2] = "\208\151\208\189\208\176\208\181\209\136\209\140 \208\191\208\190\209\135\208\181\208\188\209\131 \208\189\208\181 \209\131\208\177\208\184\208\187? \208\159\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \209\130\209\139 \208\187\208\190\209\133 \208\177\208\181\208\183 Morphius.nl", 
    [3] = "\209\135\208\181\209\130 \209\130\209\139 \209\130\208\190\208\187\209\140\208\186\208\190 \209\135\209\130\208\190 \208\177\209\139\208\187 \208\190\208\177\208\190\209\129\209\129\208\176\208\189 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [4] = "1. \208\156\208\176\208\188\208\176\209\136\209\131 \209\130\208\178\208\190\209\142 \208\189\208\176 \209\133\209\131\209\142 \208\178\208\181\209\128\209\130\208\181\208\187.", 
    [5] = "l2p bot", 
    [6] = "No one has ever sucked me as good as you.", 
    [7] = "sleep", 
    [8] = "1. Wiu Wiu))", 
    [9] = "\208\190\208\177\208\190\209\129\209\129\208\176\208\189", 
    [10] = "\208\165\208\190\209\135\208\181\209\136\209\140 \209\135\209\130\208\190\208\177\209\139 \208\189\208\181 \209\131\208\177\208\184\208\178\208\176\208\187\208\184 \209\129 \208\191\208\181\209\128\208\178\208\190\208\185 \208\191\209\131\208\187\208\184 \208\178 \208\179\208\190\208\187\208\190\208\178\209\131 - Morphius.lua", 
    [11] = "\208\180\208\181\208\187\208\176\208\185 \208\188\208\189\208\181 \208\188\208\184\208\189\208\181\209\130", 
    [12] = "\208\189\208\184\209\133\209\131\209\143 \209\143 \209\130\209\143 \208\186\209\128\208\176\209\129\208\184\208\178\208\190 \208\190\208\177\208\190\209\129\209\129\208\176\208\187", 
    [13] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\183\208\176 \209\137\208\181\208\186\209\131 \208\178\208\183\209\143\208\187", 
    [14] = "\208\187\208\181\208\179\208\186\208\190 \209\129\208\190\209\135\208\189\209\143\209\128\208\184\208\186", 
    [15] = "\208\184\208\183\208\184 \208\188\209\131\209\129\208\190\209\128\208\184\208\187\208\176 \208\181\208\177\208\176\208\189\208\189\208\176\209\143", 
    [16] = "\208\177\208\181\208\180\208\176\208\187\208\176\208\182\208\186\208\176", 
    [17] = "\240\159\133\157\240\159\133\158\240\159\133\161\240\159\133\156 \240\159\133\163\240\159\133\168 \240\159\133\159\240\159\133\144\240\159\133\159\240\159\133\148 \240\159\133\151\240\159\133\164\240\159\133\168 \240\159\133\155\240\159\133\152\240\159\133\156\240\159\133\158\240\159\133\157\240\159\133\152\240\159\133\162\240\159\133\151.", 
    [18] = "1 \208\188\209\131\209\129\208\190\209\128 \208\184\208\183\208\184", 
    [19] = "\209\130\209\131\208\191\208\190\208\185 \208\187\208\190\209\133 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187", 
    [20] = "\208\163\208\146\208\158\208\155\208\149\208\157", 
    [21] = "\208\183\208\176\208\186\209\128\209\139\209\130", 
    [22] = "\240\157\149\186\240\157\150\156\240\157\150\147\240\157\150\138\240\157\150\137 \240\157\150\135\240\157\150\158 \240\157\149\184\240\157\150\148\240\157\150\151\240\157\150\149\240\157\150\141\240\157\150\142\240\157\150\154\240\157\150\152.\240\157\149\174\240\157\150\148\240\157\150\151\240\157\150\149\240\157\150\148\240\157\150\151\240\157\150\134\240\157\150\153\240\157\150\142\240\157\150\148\240\157\150\147", 
    [23] = "\208\190 \208\189\208\184\209\133\209\131\209\143, \208\183\208\180\208\190\209\128\208\190\208\178\208\190, \209\141\209\130\208\190 \209\143 \208\144\208\189\208\180\209\128\208\181\208\185, \208\191\208\190\208\188\208\189\208\184\209\136\209\140 \208\188\208\181\208\189\209\143?", 
    [24] = "\209\130\208\190\208\187\208\186\208\176\208\185 \208\191\208\190\208\187", 
    [25] = "\208\178\209\139\208\177\209\128\208\184\209\130", 
    [26] = "\209\136\208\176\209\128\208\184\209\136\209\140 \208\183\208\176 \209\129\208\191\208\181\209\134 \208\190\208\191\208\181\209\128\208\176\209\134\208\184\209\142?", 
    [27] = "\209\130\209\139 \208\184\208\183 \209\128\208\181\208\180\208\176\208\189\208\176?", 
    [28] = "by egor4ikhvhboss", 
    [29] = "\208\183\208\176\208\186\209\128\209\139\209\130 \208\191\208\190\209\130\208\189\209\143\208\178\208\186\208\176", 
    [30] = "\209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\184\208\181 \209\129\208\176\208\186\208\189\209\134\208\184\208\184 \208\178\208\178\208\181\208\180\209\131\209\130, \209\135\209\130\208\190\208\177\209\139 \209\130\208\176\208\186\208\184\208\181 \208\189\208\181 \209\129\208\191\208\176\208\178\208\189\208\184\208\187\208\184\209\129\209\140", 
    [31] = "R1natik#8982 \208\189\208\176\208\191\208\184\209\136\208\184 \208\181\209\129\208\187\208\184 \208\189\209\131\208\182\208\181\208\189 \208\191\208\181\208\189\208\189\209\139\208\185 \208\186\208\190\208\189\209\132\208\184\208\179 \208\189\208\176 \208\1784 \208\184\208\187\208\184 \208\189\208\181\208\178\209\128", 
    [32] = "\208\191\209\128\208\184\208\178\208\181\209\130, \208\188\208\190\208\187\208\190\208\180\208\181\208\189\209\140\208\186\208\176\209\143?", 
    [33] = "\209\129\209\130\208\181\209\128\208\191\208\184\209\136\209\140?", 
    [34] = "\208\161\208\189\208\190\208\178\208\176 \209\130\209\139 \208\188\208\189\208\181 \208\178 \208\189\208\190\208\179\208\184 \208\191\208\176\208\180\208\176\208\181\209\136\209\140...", 
    [35] = "\240\157\153\135\240\157\153\154\240\157\153\156\240\157\153\160\240\157\153\164 \240\157\153\153\240\157\153\161\240\157\153\174\240\157\153\150 \240\157\153\139\240\157\153\164\240\157\153\167\240\157\153\163\240\157\153\131\240\157\153\171\240\157\153\131 \240\157\153\139\240\157\153\167\240\157\153\164\240\157\153\155\240\157\153\158 \226\153\165"
};
local v553 = {
    [1] = "\208\181\208\177\208\176\208\189\209\139\208\185 \209\129\209\139\208\189 \209\136\208\187\209\142\209\133\208\184 \208\186\208\176\208\186 \209\130\209\139 \208\191\208\184\208\186\208\176\208\181\209\136\209\140", 
    [2] = "\208\188\208\181\208\189\209\143 \209\131\208\181\208\177\208\184\209\137\208\181 \209\131\208\177\208\184\208\187\208\190", 
    [3] = "\209\128\208\176\208\183 \208\178 \208\182\208\184\208\183\208\189\208\184 \208\188\208\190\208\182\208\181\209\130 \208\191\208\190\208\178\208\181\209\129\209\130\208\184", 
    [4] = "\209\129\209\139\208\189 \208\181\208\177\208\176\208\189\208\190\208\185 \208\182\208\184\209\128\208\189\208\190\208\185 \208\182\208\176\208\177\209\139", 
    [5] = "GLhf.exe Activated", 
    [6] = "\208\163 \209\130\208\181\208\177\209\143 \208\177\208\181\209\136\208\181\208\189\209\129\209\130\208\178\208\190 \208\189\208\176\209\135\208\184\208\189\208\176\208\181\209\130\209\129\209\143?", 
    [7] = "\208\190\208\185 \208\184\208\180\208\184 \208\189\208\176 \209\133\209\131\208\185", 
    [8] = "\208\161 \209\130\208\176\208\186\208\190\208\185 \208\184\208\179\209\128\208\190\208\185 \208\187\209\131\209\135\209\136\208\181 \208\191\208\190\208\178\208\181\209\129\208\184\209\130\209\140\209\129\209\143", 
    [9] = "\209\131\208\181\208\177\208\184\209\137\208\181 \209\131\209\135\208\184\209\129\209\140 \208\184\208\179\209\128\208\176\209\130\209\140", 
    [10] = "\208\144\208\189\208\184\208\188\208\181\209\136\208\189\208\184\208\186\208\184, \208\191\208\190\209\136\208\187\208\184 \208\178\208\190\208\189 \208\190\209\130\209\129\209\142\208\180\208\176", 
    [11] = "\208\161\208\163\208\154\208\144 \208\129\208\145\208\144\208\157\208\171\208\149 \208\155\208\144\208\147\208\152!!! \208\157\208\144 \208\155\208\144\208\147\208\149 \208\163\208\145\208\152\208\155 \208\159\208\152\208\148\208\160\208\152\208\155\208\144!!", 
    [12] = "\208\161\208\163\208\154\208\144 \208\175 \208\162\208\149\208\145\208\175 \208\146 \208\160\208\158\208\162 \208\158\208\146\208\157\208\152\208\155", 
    [13] = "\208\154\208\160\208\171\208\161\208\171 \208\161\208\163\208\154\208\144 \208\146\208\159\208\175\208\162\208\149\208\160\208\158\208\156!", 
    [14] = "\208\149\208\145\208\144 \208\163 \208\156\208\149\208\157\208\175 \208\146 \208\162\208\152\208\156\208\149 \208\157\208\163\208\145\208\171 \208\175 \208\155\208\152\208\146\208\144\208\174", 
    [15] = "\208\189\209\131 \208\179\208\180\208\181 \209\130\208\184\208\188\208\188\208\181\208\185\209\130\209\139", 
    [16] = "\209\142\208\184\208\180 \208\190\208\191\209\128\208\190\208\186\208\184\208\189\209\140", 
    [17] = "\208\149\209\129\208\187\208\184 \208\177\209\139 \208\189\208\181 AcidTech, \209\143 \208\177\209\139 \209\130\208\181\208\177\209\143 \208\178\209\139\208\181\208\177\208\176\208\187.", 
    [18] = "\208\157\209\131 \208\186\208\176\208\186 \208\190\208\177\209\139\209\135\208\189\208\190, \209\129 \208\179\208\188\208\190\208\188 \208\177\208\181\208\179\208\176\208\181\209\130 \208\191\208\184\208\180\208\190\209\128\209\142\208\179\208\176.", 
    [19] = "Lucky, that's all.", 
    [20] = "Son of a bad whore, kill yourself."
};
events.player_death:set(function(v554)
    -- upvalues: v131 (ref), v551 (ref), v552 (ref), v553 (ref)
    local v555 = entity.get_local_player();
    local v556 = entity.get(v554.userid, true);
    local v557 = entity.get(v554.attacker, true);
    if v131.other.trashtalk:get() then
        if v557 == v555 and v556 ~= v555 then
            utils.execute_after(v131.other.trashtalk:get() and v131.other.trashtalk.delay_slider:get() or 0, function()
                -- upvalues: v131 (ref), v551 (ref), v552 (ref)
                if globals.realtime % v131.other.trashtalk.delay_slider:get() then
                    utils.console_exec("say " .. v551(v552));
                end;
            end);
        end;
        if v131.other.trashtalk.deathsay:get() and v557 ~= v555 and v556 == v555 then
            utils.execute_after(v131.other.trashtalk:get() and v131.other.trashtalk.delay_slider:get() or 0, function()
                -- upvalues: v131 (ref), v551 (ref), v553 (ref)
                if globals.realtime % v131.other.trashtalk.delay_slider:get() then
                    utils.console_exec("say " .. v551(v553));
                end;
            end);
        end;
    end;
end);
local v558 = {};
local v559 = {};
is_standing = function()
    -- upvalues: v212 (ref)
    local v560 = entity.get_local_player();
    if v560 ~= nil and v560.m_iHealth > 0 then
        local v561 = ui.find("aimbot", "anti aim", "misc", "fake duck"):get();
        local v562 = ui.find("aimbot", "anti aim", "misc", "slow walk"):get();
        return get_velocity(v560) < 3 and not v562 and not v212(v560) and not crouch and not v561;
    else
        return;
    end;
end;
cond_trig = function()
    -- upvalues: v209 (ref), v212 (ref), v14 (ref)
    local v563 = 1;
    local v564 = "";
    local v565 = entity.get_local_player();
    if v565 ~= nil and v565.m_iHealth > 0 then
        local v566 = ui.find("aimbot", "anti aim", "misc", "fake duck"):get();
        local v567 = ui.find("aimbot", "anti aim", "misc", "slow walk"):get();
        local _ = ui.find("aimbot", "ragebot", "main", "double tap"):get();
        local _ = ui.find("aimbot", "ragebot", "main", "hide shots"):get();
        local v570 = v209(v565);
        local v571 = get_velocity(v565) < 3 and not v567 and not v212(v565) and not v570 and not v566;
        local v572 = get_velocity(v565) >= 3 and not v567 and not v212(v565) and not v570 and not v566;
        local v573 = v212(v565) and not v567 and not v570;
        local v574 = v212(v565) and v570 and not v567;
        local v575 = (not not v570 or v566) and not v567 and not v573 and not v574;
        local l_m_bWarmupPeriod_0 = entity.get_game_rules().m_bWarmupPeriod;
        local v577 = {
            [1] = v571, 
            [2] = v572, 
            [3] = v567, 
            [4] = v573, 
            [5] = v574, 
            [6] = v575, 
            [7] = l_m_bWarmupPeriod_0
        };
        for v578 = 1, #v577 do
            if v577[v578] then
                v563 = v578 + 1;
                v564 = v14.conditions_non_g[v578];
            end;
        end;
    end;
    return {
        [1] = v563, 
        [2] = v564
    };
end;
c_safe_knife = function(v579)
    local v580 = {
        [1] = 59, 
        [2] = 42, 
        [3] = 500, 
        [4] = 503, 
        [5] = 505, 
        [6] = 506, 
        [7] = 507, 
        [8] = 508, 
        [9] = 509, 
        [10] = 512, 
        [11] = 514, 
        [12] = 515, 
        [13] = 516, 
        [14] = 517, 
        [15] = 518, 
        [16] = 519, 
        [17] = 520, 
        [18] = 521, 
        [19] = 522, 
        [20] = 523
    };
    local _ = false;
    for v582 = 1, #v580 do
        if v580[v582] and v580[v582] == v579 then
            return true;
        end;
    end;
    return false;
end;
safe_knife = function(v583)
    -- upvalues: v131 (ref), v212 (ref)
    local v584 = entity.get_local_player();
    if v131.other.tweaks:get("\239\155\181  Safe Knife") then
        if v212(v584) then
            if c_safe_knife(v583) == true then
                return true;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
calc_angle = function(v585, v586)
    local v587 = vector(v586.x - v585.x, v586.y - v585.y, v586.z - v585.z);
    return (vector(math.atan2(-v587.z, v587:length2d()) * 180 / math.pi, math.atan2(v587.y, v587.x) * 180 / math.pi, 0));
end;
aim_ack_no_chole = function(v588)
    -- upvalues: v558 (ref), v559 (ref)
    table.insert(v558, globals.realtime);
    table.insert(v559, {
        alpha = 0, 
        vec = v588.aim, 
        t = globals.realtime
    });
end;
get_target = function()
    local _ = render.screen_size() * 0.5;
    local v590 = entity.get_local_player();
    if not v590 or not v590:is_alive() then
        return;
    else
        local v591 = render.camera_position();
        local v592 = vector(0, render.camera_angles().y);
        local v593 = vector():angles(v592);
        local l_huge_4 = math.huge;
        local v595 = nil;
        for _, v597 in ipairs(entity.get_players(true, true)) do
            if v597 ~= nil and v597.m_iHealth > 0 then
                local v598 = v597:get_hitbox_position(1):dist_to_ray(v591, v593);
                if v598 < l_huge_4 then
                    l_huge_4 = v598;
                    v595 = v597;
                end;
            end;
        end;
        if not v595 then
            return;
        else
            return v595;
        end;
    end;
end;
local v599 = {
    enabled = false, 
    start_time = globals.realtime
};
v599.handle = function(v600)
    -- upvalues: v599 (ref), v131 (ref)
    v599.enabled = false;
    if not v131.other.tweaks:get("\239\147\154  AA on Use") then
        return;
    elseif not v600.in_use then
        v599.start_time = globals.realtime;
        return;
    else
        local v601 = entity.get_local_player();
        if v601 == nil then
            return;
        else
            local v602 = v601:get_origin();
            local v603 = entity.get_entities("CPlantedC4");
            local v604 = 999;
            if #v603 > 0 then
                v604 = v602:dist((v603[1]:get_origin()));
            end;
            local v605 = entity.get_entities("CHostage");
            local v606 = 999;
            if #v605 > 0 then
                local v607 = {
                    v605[1]:get_origin(), 
                    v605[2]:get_origin()
                };
                v606 = math.min(v602:dist(v607[1]), v602:dist(v607[2]));
            end;
            if v606 < 65 and v601.m_iTeamNum ~= 2 then
                return;
            elseif v604 < 65 and v601.m_iTeamNum ~= 2 then
                return;
            elseif v600.in_use and globals.realtime - v599.start_time < 0.02 then
                return;
            else
                v600.in_use = false;
                v599.enabled = true;
                return;
            end;
        end;
    end;
end;
local v608 = false;
local v609 = 0;
yaw_base_degree = function()
    -- upvalues: v131 (ref), v10 (ref), v608 (ref), v609 (ref), v599 (ref)
    if v131.other.yaw_base:get() == "Freestanding" then
        v10.freestanding:override(true);
        v10.yaw_mod_free:override(v131.other.yaw_base.disable_yaw_modifieres:get());
        v10.free_body:override(v131.other.yaw_base.body_freestanding:get());
        yaw = 0;
        v608 = true;
    elseif v131.other.yaw_base:get() == "Disabled" then
        v10.base:override("At Target");
        yaw = 0;
        v608 = false;
        v10.freestanding:override(false);
        v609 = 0;
    elseif v131.other.yaw_base:get() == "Backward" then
        v10.base:override("Local View");
        yaw = 0;
        v608 = true;
        v10.freestanding:override(false);
        v609 = 0;
    elseif v131.other.yaw_base:get() == "Left" then
        v10.base:override("Local View");
        yaw = -90;
        v608 = true;
        v10.freestanding:override(false);
        v609 = 0;
    elseif v131.other.yaw_base:get() == "Right" then
        v10.base:override("Local View");
        yaw = 90;
        v608 = true;
        v10.freestanding:override(false);
        v609 = 0;
    elseif v131.other.yaw_base:get() == "Forward" then
        v10.base:override("Local View");
        yaw = 180;
        v608 = true;
        v10.freestanding:override(false);
        v609 = 0;
    elseif v599.enabled then
        v10.base:override("Local View");
        yaw = 0;
        v608 = true;
        v10.freestanding:override(false);
    else
        v10.base:override("Local View");
        yaw = 0;
        v10.freestanding:override(false);
    end;
    return yaw;
end;
fast_ladder = function(v610)
    -- upvalues: v131 (ref)
    if v131.other.fast_ladderr:get() then
        local v611 = entity.get_local_player();
        local l_x_9 = render.camera_angles().x;
        local _ = render.camera_angles().y;
        if v611.m_MoveType == 9 then
            v610.view_angles.y = math.floor(v610.view_angles.y + 0.5);
            v610.roll = 0;
            if v610.forwardmove > 0 and l_x_9 < 45 then
                v610.view_angles.x = 89;
                v610.in_moveright = 1;
                v610.in_moveleft = 0;
                v610.in_forward = 0;
                v610.in_back = 1;
                if v610.sidemove == 0 then
                    v610.view_angles.y = v610.view_angles.y + 90;
                end;
                if v610.sidemove < 0 then
                    v610.view_angles.y = v610.view_angles.y + 150;
                end;
                if v610.sidemove > 0 then
                    v610.view_angles.y = v610.view_angles.y + 30;
                end;
            end;
            if v610.forwardmove < 0 then
                v610.view_angles.x = 89;
                v610.in_moveleft = 1;
                v610.in_moveright = 0;
                v610.in_forward = 1;
                v610.in_back = 0;
                if v610.sidemove == 0 then
                    v610.view_angles.y = v610.view_angles.y + 90;
                end;
                if v610.sidemove > 0 then
                    v610.view_angles.y = v610.view_angles.y + 150;
                end;
                if v610.sidemove < 0 then
                    v610.view_angles.y = v610.view_angles.y + 30;
                end;
            end;
        end;
    end;
end;
anti_aim = function(v614)
    -- upvalues: v10 (ref), v215 (ref), v131 (ref), v203 (ref), v599 (ref), v608 (ref)
    v10.yaw_backstab:override(true);
    local v615 = entity.get_local_player();
    local v616 = get_velocity(v615) < 3;
    local v617 = v615:get_player_weapon();
    if v617 ~= nil then
        lw_index = v617:get_weapon_index();
    end;
    if lw_index ~= nil and lw_index == 64 then
        v10.dtlim:override(2);
    else
        v10.dtlim:override(v10.dtlim:get());
    end;
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Static");
    fast_ladder(v614);
    v215 = v131.other.builder[cond_trig()[1]].enabled:get() and cond_trig()[1] or 1;
    if v131.other.builder[v215].defensive_switch:get() then
        v10.lag_options:override("Always On");
    else
        v10.lag_options:override(v10.lag_options:get());
    end;
    if globals.choked_commands == 0 then
        v203.jitter = not v203.jitter;
        inverted = entity.get_local_player().m_flPoseParameter[11] * 120 - 60 > 0;
    elseif inverted == nil then
        inverted = false;
    else
        inverted = inverted;
    end;
    v10.yaw_hidden:override(true);
    if sim_diff() < -0.13 and v10.dt:get() then
        table.insert(v203.defensive, globals.realtime);
    end;
    if v131.other.tweaks:get("\239\135\162   Bombsite E Fix") and fix_bomb_site_e(v614) and common.is_button_down(69) and v615.m_iTeamNum == 2 then
        v10.pitch:set("Disabled");
        v10.yaw_mod_degree:set(0);
        v10.yaw_mod:set("Disabled");
        v10.offset:override(180);
        v10.left_limit:set(0);
        v10.right_limit:set(0);
        v10.fake_options:set("");
        v203.jit_yaw = 0;
        v203.yaw_add = 0;
    elseif v599.enabled then
        v10.pitch:set("Disabled");
        v10.body_yaw:set(true);
        v10.hidden:set(false);
        v10.yaw_mod_degree:set(0);
        v10.yaw_mod:set("Disabled");
        v10.offset:override(180);
        v10.left_limit:set(60);
        v10.right_limit:set(60);
        v10.fake_options:set("");
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
        v203.jit_yaw = 0;
        v203.yaw_add = 0;
    elseif safe_knife(lw_index) then
        v10.pitch:set("Down");
        v10.body_yaw:set(true);
        v10.hidden:set(false);
        v10.yaw_mod_degree:set(0);
        v10.yaw_mod:set("Disabled");
        v10.offset:override(12);
        v10.left_limit:set(30);
        v10.right_limit:set(30);
        v10.fake_options:set("");
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
        v203.jit_yaw = 0;
        v203.yaw_add = 0;
    else
        tab = v131.other.builder[v215];
        tab2 = v131.other.builder[v215].yaw_base;
        tab3 = v131.other.builder[v215].body_yaw;
        if v131.other.builder[v215].yaw_base:get() == "Backward" then
            if tab.yaw_mod:get() == "X-Way" then
                v10.yaw:set("Static");
            else
                v10.yaw:set(v131.other.builder[v215].yaw_base:get());
            end;
        else
            v10.yaw:set(v131.other.builder[v215].yaw_base:get());
        end;
        v10.body_yaw:set(v131.other.builder[v215].body_yaw:get());
        v10.left_limit:set(tab3.left_limit:get());
        v10.right_limit:set(tab3.right_limit:get());
        v10.inverter:set(tab3.inverter:get());
        v10.hidden:set(false);
        v10.fake_options:set(tab3.fake_options:get());
        if tick == nil then
            tick = 0;
        end;
        if v131.other.yaw_base.static_yaw:get() then
            if v131.other.builder[v215].yaw_base.yaw:get() == "180 L&R" then
                v10.offset:override(v608 and yaw_base_degree() or inverted and tab2.yaw_add_left:get() or tab2.yaw_add_right:get());
                v203.yaw_add = v608 and yaw_base_degree() or inverted and tab2.yaw_add_left:get() or tab2.yaw_add_right:get();
            elseif v131.other.builder[v215].yaw_base.yaw:get() == "180" then
                v10.offset:override(v608 and yaw_base_degree() or inverted and tab2.yaw_offset:get() or tab2.yaw_offset:get());
                v203.yaw_add = v608 and yaw_base_degree() or inverted and tab2.yaw_offset:get() or tab2.yaw_offset:get();
            elseif v131.other.builder[v215].yaw_base.yaw:get() == "Sway" then
                tick = tick + 1;
                if sway_yaw == nil then
                    sway_yaw = tab2.yaw_add_left:get();
                end;
                v10.offset:override(v608 and yaw_base_degree() or sway_yaw);
                if sway_yaw_back == true then
                    sway_yaw = sway_yaw - tab2.yaw_speed:get() / 10;
                else
                    sway_yaw = sway_yaw + tab2.yaw_speed:get() / 10;
                end;
                if sway_yaw >= tab2.yaw_add_right:get() then
                    sway_yaw_back = true;
                elseif sway_yaw <= tab2.yaw_add_left:get() then
                    sway_yaw_back = false;
                end;
            elseif v131.other.builder[v215].yaw_base.yaw:get() == "Delayed" then
                tick = tick + 1;
                if tick >= tab2.yaw_delay:get() then
                    tick = 0;
                    if flick == nil then
                        flick = true;
                        v10.offset:override(v608 and yaw_base_degree() or tab2.yaw_add_left:get());
                    else
                        flick = nil;
                        v10.offset:override(v608 and yaw_base_degree() or tab2.yaw_add_right:get());
                    end;
                end;
            end;
        elseif v131.other.builder[v215].yaw_base.yaw:get() == "180 L&R" then
            v10.offset:override(inverted and tab2.yaw_add_left:get() + yaw_base_degree() or tab2.yaw_add_right:get() + yaw_base_degree());
            v203.yaw_add = inverted and tab2.yaw_add_left:get() + yaw_base_degree() or tab2.yaw_add_right:get() + yaw_base_degree();
        elseif v131.other.builder[v215].yaw_base.yaw:get() == "180" then
            v10.offset:override(inverted and tab2.yaw_offset:get() + yaw_base_degree() or tab2.yaw_offset:get() + yaw_base_degree());
            v203.yaw_add = inverted and tab2.yaw_offset:get() + yaw_base_degree() or tab2.yaw_offset:get() + yaw_base_degree();
        elseif v131.other.builder[v215].yaw_base.yaw:get() == "Sway" then
            tick = tick + 1;
            if sway_yaw == nil then
                sway_yaw = tab2.yaw_add_left:get();
            end;
            v10.offset:override(sway_yaw + yaw_base_degree());
            if sway_yaw_back == true then
                sway_yaw = sway_yaw - tab2.yaw_speed:get() / 10;
            else
                sway_yaw = sway_yaw + tab2.yaw_speed:get() / 10;
            end;
            if sway_yaw >= tab2.yaw_add_right:get() then
                sway_yaw_back = true;
            elseif sway_yaw <= tab2.yaw_add_left:get() then
                sway_yaw_back = false;
            end;
        elseif v131.other.builder[v215].yaw_base.yaw:get() == "Delayed" then
            tick = tick + 1;
            if tick >= tab2.yaw_delay:get() then
                tick = 0;
                if flick == nil then
                    flick = true;
                    v10.offset:override(tab2.yaw_add_left:get() + yaw_base_degree());
                else
                    flick = nil;
                    v10.offset:override(tab2.yaw_add_right:get() + yaw_base_degree());
                end;
            end;
        end;
        v10.pitch:set(tab.pitch:get());
        if tab.yaw_mod:get() == "X-Way" then
            v10.yaw_mod:set("Disabled");
            v10.yaw_mod_degree:set(0);
            if tab.yaw_mod.ways:get() == "3-Way" then
                if globals.tickcount % 3 == 2 then
                    v203.jit_yaw = tab.yaw_mod.first_degree:get();
                elseif globals.tickcount % 3 == 1 then
                    v203.jit_yaw = tab.yaw_mod.second_degree:get();
                elseif globals.tickcount % 3 == 0 then
                    v203.jit_yaw = tab.yaw_mod.third_degree:get();
                end;
            elseif tab.yaw_mod.ways:get() == "5-Way" then
                if globals.tickcount % 5 == 4 then
                    v203.jit_yaw = tab.yaw_mod.first_degree:get();
                elseif globals.tickcount % 5 == 3 then
                    v203.jit_yaw = tab.yaw_mod.second_degree:get();
                elseif globals.tickcount % 5 == 2 then
                    v203.jit_yaw = tab.yaw_mod.third_degree:get();
                elseif globals.tickcount % 5 == 1 then
                    v203.jit_yaw = tab.yaw_mod.fourth_degree:get();
                elseif globals.tickcount % 5 == 0 then
                    v203.jit_yaw = tab.yaw_mod.fifth_degree:get();
                end;
            end;
        else
            v10.yaw_mod:override(tab.yaw_mod:get());
            v10.yaw_mod_degree:set(tab.yaw_mod.modifier_degree:get());
        end;
    end;
    if tab.yaw_mod:get() == "X-Way" then
        if safe_knife(lw_index) then
            orig_desync = 0;
            desync_value = 0;
            multipl = 1;
        else
            orig_desync = rage.antiaim:inverter() and v10.right_limit:get() or v10.left_limit:get();
            desync_value = rage.antiaim:inverter() and v10.right_limit:get() / 2 + 30 or v10.left_limit:get() / 2 + 30;
            multipl = rage.antiaim:inverter() and v10.right_limit:get() / 60 or v10.left_limit:get() / 60;
        end;
        model_add = render.camera_angles().y;
        if v131.other.tweaks:get("\239\135\162   Bombsite E Fix") and fix_bomb_site_e(v614) and common.is_button_down(69) and v615.m_iTeamNum == 2 then
            v10.offset:override(model_add);
        else
            if v616 and not v614.in_moveleft and not v614.in_moveright and not v614.in_forward and not v614.in_back and not v614.in_left and not v614.in_right and not ui.find("aimbot", "anti aim", "misc", "fake duck"):get() then
                v614.sidemove = v203.jitter_move and 1.1 or -1.1;
                v203.jitter_move = not v203.jitter_move;
            end;
            if v131.other.builder[v215].body_yaw.fake_options:get("Jitter") and v131.other.builder[v215].body_yaw:get() then
                if not v614.send_packet then
                    v10.offset:override(math.normalize_yaw(v203.jit_yaw + yaw_base_degree() + v203.yaw_add + orig_desync * 2 * side));
                else
                    v10.offset:override(math.normalize_yaw(v203.jit_yaw + yaw_base_degree() + v203.yaw_add));
                end;
            elseif v616 then
                if not v614.send_packet then
                    v203.set_lby = not v203.set_lby;
                else
                    v10.offset:override(math.normalize_yaw(v203.jit_yaw + yaw_base_degree() + v203.yaw_add));
                end;
            elseif not v614.send_packet then
                v203.set_lby = not v203.set_lby;
            else
                v10.offset:override(math.normalize_yaw(v203.jit_yaw + yaw_base_degree() + v203.yaw_add));
            end;
        end;
    end;
end;
handle_hidden = function(v618)
    -- upvalues: v131 (ref), v215 (ref), v10 (ref)
    if v131.other.builder[v215].defensive_switch:get() and v10.dt:get() then
        v10.yaw_hidden:override(true);
        local l_defensive_switch_1 = v131.other.builder[v215].defensive_switch;
        if l_defensive_switch_1.pitch:get() == "Disabled" then
            rage.antiaim:override_hidden_pitch(0);
        elseif l_defensive_switch_1.pitch:get() == "Down" then
            rage.antiaim:override_hidden_pitch(89);
        elseif l_defensive_switch_1.pitch:get() == "Up" then
            rage.antiaim:override_hidden_pitch(-89);
        elseif l_defensive_switch_1.pitch:get() == "Random" then
            local v620 = globals.tickcount % 5;
            if v620 == 0 then
                rage.antiaim:override_hidden_pitch(-89);
            elseif v620 == 1 then
                rage.antiaim:override_hidden_pitch(-89);
            elseif v620 == 2 then
                rage.antiaim:override_hidden_pitch(0);
            elseif v620 == 3 then
                rage.antiaim:override_hidden_pitch(89);
            elseif v620 == 4 then
                rage.antiaim:override_hidden_pitch(89);
            end;
        elseif l_defensive_switch_1.pitch:get() == "Semi Down" then
            rage.antiaim:override_hidden_pitch(45);
        elseif l_defensive_switch_1.pitch:get() == "Semi Up" then
            rage.antiaim:override_hidden_pitch(-30);
        end;
        if l_defensive_switch_1.yaw_mod:get() == "Disabled" then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif l_defensive_switch_1.yaw_mod:get() == "Random" then
            v10.offset:override(math.random(0, math.abs(358)) - math.abs(358) / 2);
        else
            local v621 = v618.tickcount % 3;
            if v621 == 0 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-100, -90));
            elseif v621 == 1 then
                rage.antiaim:override_hidden_yaw_offset(180);
            elseif v621 == 2 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 100));
            end;
        end;
    else
        v10.yaw_hidden:override();
    end;
end;
local v622 = {
    _last_clantag = nil, 
    _set_clantag = ffi.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15"))
};
local function v624(v623)
    -- upvalues: v622 (ref)
    if v623 == v622._last_clantag then
        return;
    else
        v622._set_clantag(v623, v623);
        v622._last_clantag = v623;
        return;
    end;
end;
local function v629(v625)
    local v626 = {
        [1] = " "
    };
    for v627 = 1, #v625 do
        table.insert(v626, v625:sub(1, v627));
    end;
    for v628 = #v626 - 1, 1, -1 do
        table.insert(v626, v626[v628]);
    end;
    return v626;
end;
v622.clantag = function()
    -- upvalues: v131 (ref), v624 (ref), v629 (ref)
    if not v131.other.clantag:get() then
        v624(" ", " ");
        return;
    elseif not globals.is_connected then
        return;
    else
        tag = v629("Illusion.lua    ");
        local v630 = utils.net_channel();
        if v630 == nil then
            return;
        else
            local v631 = v630.avg_latency[0] / globals.client_tick;
            local v632 = globals.tickcount + v631;
            local v633 = math.floor(math.fmod(v632 / 30, #tag + 1) + 1);
            v624(tag[v633]);
            return;
        end;
    end;
end;
events.render:set(v622.clantag);
events.shutdown:set(function()
    -- upvalues: v624 (ref), v10 (ref)
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    scope:override();
    v624(" ", " ");
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    cvar.r_aspectratio:float(0);
    v10.logs:override();
    hc = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
    hc:override();
end);
events.shutdown:set(function()
    -- upvalues: v56 (ref)
    local l_get_materials_2 = materials.get_materials;
    local v635 = color(255, 255, 255, 255);
    for v636 = 1, #v56 do
        l_get_materials_2(v56[v636], false, function(v637)
            -- upvalues: v635 (ref)
            v637:alpha_modulate(v635.a / 255);
            v637:color_modulate(v635);
        end);
    end;
end);
createmoving = function(v638)
    -- upvalues: v599 (ref)
    anti_aim(v638);
    v599.handle(v638);
    handle_hidden(v638);
end;
events.aim_ack:set(aim_ack_no_chole);
events.createmove:set(createmoving);
l_pui_0.setup({
    [1] = v131.other
});