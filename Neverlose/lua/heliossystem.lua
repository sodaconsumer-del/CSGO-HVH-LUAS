{\rtf1}lua_name = "helios.system";
branch = "stable";
version = "\209\133\209\131\208\185";
user_name = common.get_username();
local v0 = {
    [1] = "shared", 
    [2] = "standing", 
    [3] = "moving", 
    [4] = "walking", 
    [5] = "crouching", 
    [6] = "sneaking", 
    [7] = "aerobic", 
    [8] = "aerobic+", 
    [9] = "fake lag"
};
local v1 = {
    [1] = "ct", 
    [2] = "t"
};
local v2 = {
    pui = require("neverlose/pui"), 
    gradient = require("neverlose/gradient"), 
    base64 = require("neverlose/base64"), 
    clipboard = require("neverlose/clipboard"), 
    ffi = require("ffi"), 
    smoothy = require("neverlose/smoothy"), 
    csgo_weapons = require("neverlose/csgo_weapons")
};
local function v4(v3)
    return tonumber(v3:string());
end;
math.lerp = function(v5, v6, v7, v8)
    if not v8 then
        v8 = 0.01;
    end;
    v7 = v7 ^ 1.2;
    local v9 = v5 + (v6 - v5) * v7;
    if math.abs(v9 - v6) < v8 then
        return v6;
    else
        return v9;
    end;
end;
local v10 = {
    base_speed = 0.095, 
    _list = {}
};
v10.new = function(v11, v12, v13, v14, v15)
    -- upvalues: v10 (ref)
    if not v13 then
        v13 = v10.base_speed;
    end;
    if v10._list[v11] == nil then
        v10._list[v11] = v14 and v14 or 0;
    end;
    v10._list[v11] = math.lerp(v10._list[v11], v12, v13, v15);
    return v10._list[v11];
end;
files.create_folder("nl\\helios");
local v16 = {
    n = {
        [1] = "default"
    }, 
    cfg = {
        [1] = ""
    }
};
if files.read("nl/helios/configs.cfg") == nil then
    files.write("nl/helios/configs.cfg", json.stringify(v16));
end;
local v17 = json.parse(files.read("nl/helios/configs.cfg"));
ffi.cdef("    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local v18 = ffi.load("UrlMon");
local v19 = ffi.load("WinInet");
local _ = ffi.load("Winmm");
local _ = {
    download_file = function(v21, v22)
        -- upvalues: v19 (ref), v18 (ref)
        v19.DeleteUrlCacheEntryA(v21);
        v18.URLDownloadToFileA(nil, v21, v22, 0, 0);
    end
};
verdana = render.load_font("Verdana", 10, "ad");
verdanaBIG = render.load_font("Verdana", 17, "ad");
local _ = ffi.typeof("uintptr_t**");
local v25 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local v26 = nil;
local v27 = {
    rage = {
        hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hs_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        backtrack = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"), 
        dt_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        dt_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
        quick_switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"), 
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
    aa = {
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
        fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
    }, 
    miscAa = {
        fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        auto_strafer = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }, 
    visuals = {
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        nl_souls = ui.find("Miscellaneous", "Main", "Other", "Windows"), 
        thirdperson_distance = ui.find("Visuals", "World", "Main", "Force Thirdperson", "Distance"), 
        thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
    }, 
    misc = {
        weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
    }
};
local v28 = {
    main = v2.pui.create("\f<house>", "\r", 1), 
    links = v2.pui.create("\f<house>", "\n\n", 1), 
    info = v2.pui.create("\f<house>", "\v", 1), 
    cfgSystem = v2.pui.create("\f<house>", "\n", 2), 
    aaConds = v2.pui.create("\f<shield>", "\n\n", 2), 
    aaMain = v2.pui.create("\f<shield>", "\n\n\n", 1), 
    aa_condition_select = v2.pui.create("\f<shield>", "\vcurrent state", 1), 
    aa_builder = v2.pui.create("\f<shield>", "\v", 2), 
    aa_yaw = v2.pui.create("\f<shield>", "\v\v", 2), 
    aa_body_yaw = v2.pui.create("\f<shield>", "\v\v\v", 2), 
    defensive_builder = v2.pui.create("\f<shield>", "\n", 1), 
    defensive_builder2 = v2.pui.create("\f<shield>", "\n\n\n\n\n\n", 1), 
    aa_to_team = v2.pui.create("\f<shield>", "\a", 2), 
    misc_chooser = v2.pui.create("\f<person-through-window>", "\n\n\n\n", 1), 
    misc_rage = v2.pui.create("\f<person-through-window>", "\r", 2), 
    misc_main = v2.pui.create("\f<person-through-window>", "\n", 2), 
    misc_visual = v2.pui.create("\f<person-through-window>", "\v", 2), 
    misc_widgets = v2.pui.create("\f<person-through-window>", "\v\v\v", 1), 
    misc_other = v2.pui.create("\f<person-through-window>", "\n\n", 1)
};
local function v30()
    -- upvalues: v2 (ref)
    local v29 = v2.gradient.text_animate("helios.system", -2, {
        color(37, 37, 37), 
        ui.get_style("Link Active")
    });
    v29:animate();
    ui.sidebar(v29:get_animated_text(), "cross");
end;
local v31 = nil;
v2.pui.colors.white = color(255, 255, 255);
v2.pui.colors.gs = color(186, 252, 3);
local v50 = {
    info = {
        user = v28.main:label("\f<circle-user>  user"), 
        username = v28.main:button("\v" .. user_name .. "", false, true), 
        version = v28.main:label("\f<code-branch>  build"), 
        build_version = v28.main:button("\v" .. branch .. "", false, true), 
        youtube = v28.links:button("                 \v\f<youtube>                  ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@finnlegend");
        end, true), 
        ds = v28.links:button("                 \v\f<discord>                  ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/gfWjxtcDKg");
        end, true), 
        thx = v28.info:button("    thx for using \vearly access \rof the script!    ", false, true), 
        heart = v28.info:button("                                         \v\f<heart>                                         ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@vezdehod2115");
        end, true)
    }, 
    main_aa = {
        select_team = v28.aaConds:list("", v1), 
        select_state = v28.aaConds:combo("\n", v0), 
        yaw_base = v28.aaMain:combo("\v\f<line-height>  \ryaw base", {
            [1] = "local view", 
            [2] = "at target", 
            [3] = "left", 
            [4] = "right", 
            [5] = "forward"
        }, function(v32)
            return {
                staticManual = v32:switch("static on manual")
            };
        end), 
        safe_head = v28.aaMain:switch("safe head", false, function(v33)
            return {
                select = v33:selectable("\n", {
                    [1] = "on knife", 
                    [2] = "on taser"
                })
            };
        end), 
        flick_exploit = v28.aaMain:label("defensive fake flick", function(v34)
            return {
                enable = v34:switch("enable"), 
                flick_mode = v34:combo("\n", {
                    [1] = "anti-skeet", 
                    [2] = "anti-neverlose"
                })
            };
        end), 
        tweaks = v28.aaMain:selectable("tweaks", {
            [1] = "anti-backstab", 
            [2] = "random aa on warmup", 
            [3] = "spin aa on round end"
        }), 
        animbreaker = v28.aaMain:label("animation breakers", function(v35)
            return {
                select = v35:selectable("\n", "in air", "on ground", "additions"), 
                select_in_air = v35:combo("in air", "static", "kangaroo", "moonwalk"), 
                select_on_ground = v35:combo("on ground", "static", "kangaroo", "moonwalk"), 
                additions = v35:selectable("additions", "0 pitch on land", "earthquake", "lean"), 
                lean_amount = v35:slider("lean amount", 0, 100, 0, 1, "%")
            };
        end), 
        freestanding = v28.aaMain:switch("\v\f<block-brick>  \rfreestanding", false, function(v36)
            return {
                select = v36:combo("\n", {
                    [1] = "static", 
                    [2] = "jitter"
                }), 
                disable_on_manual = v36:switch("disable on manual")
            };
        end)
    }, 
    misc_chooser = v28.misc_chooser:list("\n", {
        [1] = "misc", 
        [2] = "visuals"
    }), 
    misc_rage = {
        rage = v28.misc_other:label("\v\f<eye-evil>  rage"), 
        fake_latency_unlock = v28.misc_other:switch("       \rfake latency unlock"), 
        dormant_aimbot = v28.misc_other:label("       \rdormant aimbot", function(v37)
            return {
                enable = v37:switch("\v\f<gun>  \rdormant aimbot"), 
                hitchance = v37:slider("hitchance", 30, 85, 55, nil, "%"), 
                hitboxes = v37:selectable("hitboxes", {
                    [1] = "head", 
                    [2] = "chest", 
                    [3] = "stomach", 
                    [4] = "legs"
                }), 
                auto_scope = v37:switch("auto scope")
            };
        end), 
        auto_osaa = v28.misc_other:switch("       \rauto hide shots", false, function(v38)
            return {
                conds = v38:selectable("conditions", {
                    [1] = "standing", 
                    [2] = "crouching", 
                    [3] = "sneaking", 
                    [4] = "slow walking"
                }), 
                weapons = v38:selectable("weapons", {
                    [1] = "scout", 
                    [2] = "auto", 
                    [3] = "awp", 
                    [4] = "pistols", 
                    [5] = "deagle"
                })
            };
        end)
    }, 
    misc_main = {
        movement_helpers = v28.misc_main:label("\v\f<wheelchair-move>  movement helpers"), 
        fast_ladder = v28.misc_main:switch("      \rfast ladder", false, function(v39)
            return {
                fast_ladder_select = v39:selectable("\n", {
                    [1] = "ascending", 
                    [2] = "descending"
                })
            };
        end), 
        no_fall_damage = v28.misc_main:switch("      \rno fall damage"), 
        fake_duck_speed = v28.misc_main:switch("      \runlock fd speed"), 
        jumpscout = v28.misc_main:switch("      \rjumpscout fix"), 
        grenade_helpers = v28.misc_main:label("\v\f<bomb>  grenade helpers"), 
        super_toss = v28.misc_main:switch("      \rsuper toss"), 
        throw_fix = v28.misc_main:switch("      \rthrow fix"), 
        nade_drop = v28.misc_main:switch("      \rdrop grenades", false, function(v40)
            return {
                drop = v40:hotkey("\n"), 
                grenades = v40:selectable("\n", {
                    [1] = "he", 
                    [2] = "smoke", 
                    [3] = "molotov"
                })
            };
        end)
    }, 
    misc_other = {
        other = v28.misc_other:label("\v\f<skull>  other"), 
        accent_color = v28.misc_other:color_picker("      \raccent color", color(255, 97, 97)), 
        event_logs = v28.misc_other:switch("      \revent logs", false, function(v41)
            return {
                select = v41:selectable("\n", "aimbot", "purchase"), 
                hit_color = v41:color_picker("hit", color("FFFFFFFF")), 
                miss_color = v41:color_picker("miss", color("FFFFFFFF"))
            };
        end), 
        cvar_optimize = v28.misc_other:switch("      \rcvar optimize"), 
        trashtalk = v28.misc_other:switch("      \rtrashtalk"), 
        clantag = v28.misc_other:switch("      \rclantag")
    }, 
    misc_visual = {
        visuals = v28.misc_visual:label("\v\f<eye>  visuals"), 
        custom_scope = v28.misc_visual:switch("      \rcustom scope", false, function(v42)
            return {
                color = v42:color_picker("color"), 
                size = v42:slider("size", 0, 500, 200), 
                gap = v42:slider("gap", 0, 500, 10), 
                exclude = v42:selectable("exclude", {
                    [1] = "top", 
                    [2] = "bottom", 
                    [3] = "left", 
                    [4] = "right"
                })
            };
        end), 
        aspect_ratio = v28.misc_visual:switch("      \raspect ratio", false, function(v43)
            -- upvalues: v31 (ref)
            v31 = {
                value = v43:slider("\n", 0, 200, 0, 0.01)
            };
            return v31;
        end), 
        viewmodel_changer = v28.misc_visual:switch("      \rviewmodel changer", false, function(v44)
            return {
                fov = v44:slider("\n", 0, 100, 68, 1, " fov"), 
                offset_x = v44:slider("\n\n", -20, 20, 2.5, 1, " x"), 
                offset_y = v44:slider("\n\n\n", -20, 20, 0, 1, " y"), 
                offset_z = v44:slider("\n\n\n\n", -20, 20, -1.5, 1, " z")
            };
        end), 
        crosshair_ind = v28.misc_visual:switch("      \rcrosshair indicators", false, function(v45)
            return {
                additions = v45:selectable("additions", {
                    [1] = "glow", 
                    [2] = "gradient"
                }), 
                color1 = v45:color_picker("\vmain \rcolor", color(188, 51, 51)), 
                color2 = v45:color_picker("\vsecond \rcolor", color(37, 37, 37)), 
                color3 = v45:color_picker("\vkeybinds \rcolor", color(255, 255, 255))
            };
        end), 
        damage_indicator = v28.misc_visual:switch("      \rdamage indicator", false, function(v46)
            return {
                color = v46:color_picker("color"), 
                animation = v46:switch("animate")
            };
        end), 
        grenade_radius = v28.misc_visual:switch("      \rgrenade radius", false, function(v47)
            return {
                mode = v47:selectable("\n", {
                    [1] = "smoke", 
                    [2] = "molotov"
                }), 
                smoke_color = v47:color_picker("smoke color", color("A8CCFFFF")), 
                molotov_color = v47:color_picker("molotov color", color("FF8A8AFF"))
            };
        end), 
        lc_box = v28.misc_visual:switch("      \rlagcomp box")
    }, 
    misc_widgets = {
        widgets = v28.misc_widgets:label("\v\f<tag>  widgets"), 
        watermark = v28.misc_widgets:label("      watermark", function(v48)
            return {
                style = v48:combo("style", {
                    [1] = "default", 
                    [2] = "branded"
                }), 
                position = v48:combo("position", {
                    [1] = "bottom", 
                    [2] = "left", 
                    [3] = "right"
                }), 
                firstcol = v48:color_picker("first color", color("FFFFFFFF")), 
                secondcol = v48:color_picker("second color", color("FFFFFFFF"))
            };
        end), 
        notify = v28.misc_widgets:switch("      \rnotify", false, function(v49)
            return {
                hit_color = v49:color_picker("hit", color(15, 255, 15)), 
                miss_color = v49:color_picker("miss", color(255, 0, 0))
            };
        end)
    }
};
local function v58()
    -- upvalues: v50 (ref), v2 (ref)
    local v51 = v50.misc_chooser:get() == 1;
    local v52 = v50.misc_chooser:get() == 2;
    v2.pui.traverse(v50.misc_rage, function(v53)
        -- upvalues: v51 (ref)
        v53:visibility(v51);
    end);
    v2.pui.traverse(v50.misc_main, function(v54)
        -- upvalues: v51 (ref)
        v54:visibility(v51);
    end);
    v2.pui.traverse(v50.misc_other, function(v55)
        -- upvalues: v51 (ref)
        v55:visibility(v51);
    end);
    v2.pui.traverse(v50.misc_visual, function(v56)
        -- upvalues: v52 (ref)
        v56:visibility(v52);
    end);
    v2.pui.traverse(v50.misc_widgets, function(v57)
        -- upvalues: v52 (ref)
        v57:visibility(v52);
    end);
end;
v50.main_aa.safe_head.select:depend(v50.main_aa.safe_head);
v50.main_aa.animbreaker.select_in_air:depend({
    [1] = nil, 
    [2] = "in air", 
    [1] = v50.main_aa.animbreaker.select
});
v50.main_aa.animbreaker.select_on_ground:depend({
    [1] = nil, 
    [2] = "on ground", 
    [1] = v50.main_aa.animbreaker.select
});
v50.main_aa.animbreaker.additions:depend({
    [1] = nil, 
    [2] = "additions", 
    [1] = v50.main_aa.animbreaker.select
});
v50.main_aa.animbreaker.lean_amount:depend({
    [1] = nil, 
    [2] = "additions", 
    [1] = v50.main_aa.animbreaker.select
});
v50.main_aa.animbreaker.lean_amount:depend({
    [1] = nil, 
    [2] = "lean", 
    [1] = v50.main_aa.animbreaker.additions
});
v50.misc_other.event_logs.select:depend(v50.misc_rage.event_logs);
v50.misc_other.event_logs.hit_color:depend(v50.misc_rage.event_logs);
v50.misc_other.event_logs.miss_color:depend(v50.misc_rage.event_logs);
v50.misc_rage.auto_osaa.conds:depend(v50.misc_rage.auto_osaa);
v50.misc_rage.auto_osaa.weapons:depend(v50.misc_rage.auto_osaa);
v50.misc_visual.custom_scope.size:depend(v50.misc_visual.custom_scope);
v50.misc_visual.custom_scope.gap:depend(v50.misc_visual.custom_scope);
v50.misc_visual.custom_scope.exclude:depend(v50.misc_visual.custom_scope);
v50.misc_visual.custom_scope.color:depend(v50.misc_visual.custom_scope);
v50.misc_widgets.watermark.position:depend({
    [1] = nil, 
    [2] = "default", 
    [1] = v50.misc_widgets.watermark.style
});
v50.misc_widgets.notify.hit_color:depend(v50.misc_widgets.notify);
v50.misc_widgets.notify.miss_color:depend(v50.misc_widgets.notify);
v50.misc_other.event_logs.select:depend(v50.misc_other.event_logs);
v50.misc_other.event_logs.hit_color:depend(v50.misc_other.event_logs);
v50.misc_other.event_logs.miss_color:depend(v50.misc_other.event_logs);
v50.misc_other.event_logs.hit_color:depend({
    [1] = nil, 
    [2] = "aimbot", 
    [1] = v50.misc_other.event_logs.select
});
v50.misc_other.event_logs.miss_color:depend({
    [1] = nil, 
    [2] = "aimbot", 
    [1] = v50.misc_other.event_logs.select
});
v31.value:depend(v50.misc_visual.aspect_ratio);
v50.misc_visual.viewmodel_changer.fov:depend(v50.misc_visual.viewmodel_changer);
v50.misc_visual.viewmodel_changer.offset_x:depend(v50.misc_visual.viewmodel_changer);
v50.misc_visual.viewmodel_changer.offset_y:depend(v50.misc_visual.viewmodel_changer);
v50.misc_visual.viewmodel_changer.offset_z:depend(v50.misc_visual.viewmodel_changer);
v50.misc_visual.crosshair_ind.additions:depend(v50.misc_visual.crosshair_ind);
v50.misc_visual.crosshair_ind.color1:depend(v50.misc_visual.crosshair_ind);
v50.misc_visual.crosshair_ind.color2:depend(v50.misc_visual.crosshair_ind, {
    [1] = nil, 
    [2] = "gradient", 
    [1] = v50.misc_visual.crosshair_ind.additions
});
v50.misc_visual.crosshair_ind.color3:depend(v50.misc_visual.crosshair_ind);
v50.misc_visual.damage_indicator.color:depend(v50.misc_visual.damage_indicator);
v50.misc_visual.damage_indicator.animation:depend(v50.misc_visual.damage_indicator);
v50.misc_visual.grenade_radius.mode:depend(v50.misc_visual.grenade_radius);
v50.misc_visual.grenade_radius.smoke_color:depend(v50.misc_visual.grenade_radius, {
    [1] = nil, 
    [2] = "smoke", 
    [1] = v50.misc_visual.grenade_radius.mode
});
v50.misc_visual.grenade_radius.molotov_color:depend(v50.misc_visual.grenade_radius, {
    [1] = nil, 
    [2] = "molotov", 
    [1] = v50.misc_visual.grenade_radius.mode
});
v50.misc_main.nade_drop.drop:depend(v50.misc_main.nade_drop);
v50.misc_main.nade_drop.grenades:depend(v50.misc_main.nade_drop);
v50.misc_main.fast_ladder.fast_ladder_select:depend(v50.misc_main.fast_ladder);
local v59 = {};
for v60 = 1, #v0 do
    v59[v60] = {};
    for v61 = 1, #v1 do
        v59[v60][v61] = {};
        v59[v60][v61].enable = v28.aa_builder:switch("enable \v" .. v0[v60]);
        v59[v60][v61].pitch = v28.aa_builder:combo("pitch", {
            [1] = "disabled", 
            [2] = "down", 
            [3] = "fake down", 
            [4] = "fake up"
        });
        v59[v60][v61].yaw = v28.aa_yaw:combo("yaw", {
            [1] = "disabled", 
            [2] = "static", 
            [3] = "left ~ right", 
            [4] = "delayed"
        }, false, function(v62)
            return {
                delay_ticks = v62:slider("delay ticks", 1, 20, 1, 1, "t"), 
                yaw_randomization = v62:slider("randomization", 0, 100, 0, 1, "%")
            };
        end);
        v59[v60][v61].static_yaw = v28.aa_yaw:slider("\v\f<left-right>  \ryaw value", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].left_yaw = v28.aa_yaw:slider("\v\f<left>  \rleft", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].right_yaw = v28.aa_yaw:slider("\v\f<right>  \rright", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].yaw_modifier = v28.aa_yaw:combo("yaw modifier", {
            [1] = "disabled", 
            [2] = "center", 
            [3] = "offset", 
            [4] = "random", 
            [5] = "spin", 
            [6] = "3-way", 
            [7] = "5-way"
        });
        v59[v60][v61].yaw_modifier_offset = v28.aa_yaw:slider("offset", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].body_yaw = v28.aa_body_yaw:switch("\v\f<left-right>  \rbody yaw", false, function(v63)
            return {
                body_yaw_jitter = v63:switch("jitter")
            };
        end);
        v59[v60][v61].left_limit = v28.aa_body_yaw:slider("\v\f<left>  \rleft limit", 1, 60, 60, 1, "\194\176");
        v59[v60][v61].right_limit = v28.aa_body_yaw:slider("\v\f<right>  \rright limit", 1, 60, 60, 1, "\194\176");
        v59[v60][v61].force_defensive = v28.defensive_builder:listable("force defensive", {
            [1] = "double tap", 
            [2] = "hide-shots"
        });
        v59[v60][v61].defensive_pitch = v28.defensive_builder2:combo("pitch", {
            [1] = "disabled", 
            [2] = "down", 
            [3] = "up", 
            [4] = "half up", 
            [5] = "half down", 
            [6] = "random", 
            [7] = "spin", 
            [8] = "jitter", 
            [9] = "custom"
        });
        v59[v60][v61].spin_pitch = v28.defensive_builder2:slider("\v\f<circle-notch>  \rspin", 1, 89, 1, 1, "\194\176");
        v59[v60][v61].spin_pitch_speed = v28.defensive_builder2:slider("speed", 1, 10, 0, 1, "v");
        v59[v60][v61].pitch_jitter_1 = v28.defensive_builder2:slider("lower", -89, 89, 0, 1, "\194\176");
        v59[v60][v61].pitch_jitter_2 = v28.defensive_builder2:slider("upper", -89, 89, 0, 1, "\194\176");
        v59[v60][v61].custom_pitch = v28.defensive_builder2:slider("custom", -89, 89, 0, 1, "\194\176");
        v59[v60][v61].defensive_yaw = v28.defensive_builder2:combo("yaw", {
            [1] = "disabled", 
            [2] = "forward", 
            [3] = "sideways", 
            [4] = "random", 
            [5] = "spin", 
            [6] = "jitter", 
            [7] = "custom"
        });
        v59[v60][v61].spin_yaw = v28.defensive_builder2:slider("\v\f<circle-notch>  \rspin", 1, 180, 1, 1, "\194\176");
        v59[v60][v61].spin_yaw_speed = v28.defensive_builder2:slider("spin speed", 1, 10, 0, 1, "v");
        v59[v60][v61].yaw_jitter_1 = v28.defensive_builder2:slider("\v\f<left>  \rleft", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].yaw_jitter_2 = v28.defensive_builder2:slider("\v\f<right>  \rright", -180, 180, 0, 1, "\194\176");
        v59[v60][v61].custom_yaw = v28.defensive_builder2:slider("custom", -180, 180, 0, 1, "\194\176");
    end;
end;
for v64 = 1, #v0 do
    do
        local l_v64_0 = v64;
        for v66 = 1, #v1 do
            local v67 = {
                [1] = v50.main_aa.select_state, 
                [2] = v0[l_v64_0]
            };
            local v68 = {
                [1] = v50.main_aa.select_team, 
                [2] = v66
            };
            do
                local l_v66_0 = v66;
                local v70 = {
                    [1] = v59[l_v64_0][l_v66_0].enable, 
                    [2] = function()
                        -- upvalues: l_v64_0 (ref), v59 (ref), l_v66_0 (ref)
                        if l_v64_0 == 1 then
                            return true;
                        else
                            return v59[l_v64_0][l_v66_0].enable:get();
                        end;
                    end
                };
                local v71 = {
                    [1] = v59[l_v64_0][l_v66_0].enable, 
                    [2] = function()
                        -- upvalues: l_v64_0 (ref)
                        return l_v64_0 ~= 1;
                    end
                };
                local v72 = {
                    [1] = v59[l_v64_0][l_v66_0].yaw, 
                    [2] = function()
                        -- upvalues: v59 (ref), l_v64_0 (ref), l_v66_0 (ref)
                        if v59[l_v64_0][l_v66_0].yaw:get() == "disabled" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                local v73 = {
                    [1] = v59[l_v64_0][l_v66_0].yaw_modifier, 
                    [2] = function()
                        -- upvalues: v59 (ref), l_v64_0 (ref), l_v66_0 (ref)
                        if v59[l_v64_0][l_v66_0].yaw_modifier:get() == "disabled" then
                            return false;
                        else
                            return true;
                        end;
                    end
                };
                v59[l_v64_0][l_v66_0].enable:depend(v67, v68, v71);
                v59[l_v64_0][l_v66_0].pitch:depend(v67, v68, v70);
                v59[l_v64_0][l_v66_0].yaw:depend(v67, v68, v70);
                v59[l_v64_0][l_v66_0].static_yaw:depend(v67, v68, v70, v72, {
                    [1] = nil, 
                    [2] = "static", 
                    [1] = v59[l_v64_0][l_v66_0].yaw
                });
                v59[l_v64_0][l_v66_0].left_yaw:depend(v67, v68, v70, v72, {
                    [1] = nil, 
                    [2] = "left ~ right", 
                    [3] = "delayed", 
                    [1] = v59[l_v64_0][l_v66_0].yaw
                });
                v59[l_v64_0][l_v66_0].right_yaw:depend(v67, v68, v70, v72, {
                    [1] = nil, 
                    [2] = "left ~ right", 
                    [3] = "delayed", 
                    [1] = v59[l_v64_0][l_v66_0].yaw
                });
                v59[l_v64_0][l_v66_0].yaw.yaw_randomization:depend(v67, v68, v70, v72, {
                    [1] = nil, 
                    [2] = "left ~ right", 
                    [3] = "delayed", 
                    [1] = v59[l_v64_0][l_v66_0].yaw
                });
                v59[l_v64_0][l_v66_0].yaw.delay_ticks:depend(v67, v68, v70, v72, {
                    [1] = nil, 
                    [2] = "delayed", 
                    [1] = v59[l_v64_0][l_v66_0].yaw
                });
                v59[l_v64_0][l_v66_0].yaw_modifier:depend(v67, v68, v70);
                v59[l_v64_0][l_v66_0].yaw_modifier_offset:depend(v67, v68, v70, v73);
                v59[l_v64_0][l_v66_0].body_yaw:depend(v67, v68, v70);
                v59[l_v64_0][l_v66_0].body_yaw.body_yaw_jitter:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].body_yaw
                });
                v59[l_v64_0][l_v66_0].left_limit:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].body_yaw
                });
                v59[l_v64_0][l_v66_0].right_limit:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].body_yaw
                });
                v59[l_v64_0][l_v66_0].force_defensive:depend(v67, v68, v70);
                v59[l_v64_0][l_v66_0].defensive_pitch:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].spin_pitch:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "spin", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_pitch
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].spin_pitch_speed:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "spin", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_pitch
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].pitch_jitter_1:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "jitter", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_pitch
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].pitch_jitter_2:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "jitter", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_pitch
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].custom_pitch:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "custom", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_pitch
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].defensive_yaw:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].spin_yaw:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "spin", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_yaw
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].spin_yaw_speed:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "spin", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_yaw
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].yaw_jitter_1:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "jitter", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_yaw
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].yaw_jitter_2:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "jitter", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_yaw
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                v59[l_v64_0][l_v66_0].custom_yaw:depend(v67, v68, v70, {
                    [1] = nil, 
                    [2] = "custom", 
                    [1] = v59[l_v64_0][l_v66_0].defensive_yaw
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v59[l_v64_0][l_v66_0].force_defensive
                });
                if l_v64_0 == 9 then
                    v59[l_v64_0][l_v66_0].force_defensive:disabled(true);
                    v59[l_v64_0][l_v66_0].defensive_pitch:disabled(true);
                    v59[l_v64_0][l_v66_0].defensive_yaw:disabled(true);
                end;
            end;
        end;
    end;
end;
local function v77(v74)
    -- upvalues: v0 (ref)
    for v75, v76 in ipairs(v0) do
        if v76 == v74 then
            return v75;
        end;
    end;
end;
local v80 = v28.aa_to_team:button("                                 send to t                                  ", function()
    -- upvalues: v77 (ref), v50 (ref), v1 (ref), v59 (ref)
    local v78 = v77(v50.main_aa.select_state:get());
    for _ = 1, #v1 do
        v59[v78][2].enable:set(v59[v78][1].enable:get());
        v59[v78][2].pitch:set(v59[v78][1].pitch:get());
        v59[v78][2].yaw:set(v59[v78][1].yaw:get());
        v59[v78][2].static_yaw:set(v59[v78][1].static_yaw:get());
        v59[v78][2].left_yaw:set(v59[v78][1].left_yaw:get());
        v59[v78][2].right_yaw:set(v59[v78][1].right_yaw:get());
        v59[v78][2].yaw.yaw_randomization:set(v59[v78][1].yaw.yaw_randomization:get());
        v59[v78][2].yaw.delay_ticks:set(v59[v78][1].yaw.delay_ticks:get());
        v59[v78][2].yaw_modifier:set(v59[v78][1].yaw_modifier:get());
        v59[v78][2].yaw_modifier_offset:set(v59[v78][1].yaw_modifier_offset:get());
        v59[v78][2].body_yaw:set(v59[v78][1].body_yaw:get());
        v59[v78][2].body_yaw.body_yaw_jitter:set(v59[v78][1].body_yaw.body_yaw_jitter:get());
        v59[v78][2].left_limit:set(v59[v78][1].left_limit:get());
        v59[v78][2].right_limit:set(v59[v78][1].right_limit:get());
        v59[v78][2].force_defensive:set(v59[v78][1].force_defensive:get());
        v59[v78][2].defensive_pitch:set(v59[v78][1].defensive_pitch:get());
        v59[v78][2].spin_pitch:set(v59[v78][1].spin_pitch:get());
        v59[v78][2].spin_pitch_speed:set(v59[v78][1].spin_pitch_speed:get());
        v59[v78][2].pitch_jitter_1:set(v59[v78][1].pitch_jitter_1:get());
        v59[v78][2].pitch_jitter_2:set(v59[v78][1].pitch_jitter_2:get());
        v59[v78][2].custom_pitch:set(v59[v78][1].custom_pitch:get());
        v59[v78][2].defensive_yaw:set(v59[v78][1].defensive_yaw:get());
        v59[v78][2].spin_yaw:set(v59[v78][1].spin_yaw:get());
        v59[v78][2].spin_yaw_speed:set(v59[v78][1].spin_yaw_speed:get());
        v59[v78][2].yaw_jitter_1:set(v59[v78][1].yaw_jitter_1:get());
        v59[v78][2].yaw_jitter_2:set(v59[v78][1].yaw_jitter_2:get());
        v59[v78][2].custom_yaw:set(v59[v78][1].custom_yaw:get());
        cvar.play:call("ambient\\tones\\elev1");
    end;
end, true);
local v83 = v28.aa_to_team:button("                               send to \209\129t                                 ", function()
    -- upvalues: v77 (ref), v50 (ref), v1 (ref), v59 (ref)
    local v81 = v77(v50.main_aa.select_state:get());
    for _ = 1, #v1 do
        v59[v81][1].enable:set(v59[v81][2].enable:get());
        v59[v81][1].pitch:set(v59[v81][2].pitch:get());
        v59[v81][1].yaw:set(v59[v81][2].yaw:get());
        v59[v81][1].static_yaw:set(v59[v81][2].static_yaw:get());
        v59[v81][1].left_yaw:set(v59[v81][2].left_yaw:get());
        v59[v81][1].right_yaw:set(v59[v81][2].right_yaw:get());
        v59[v81][1].yaw.yaw_randomization:set(v59[v81][2].yaw.yaw_randomization:get());
        v59[v81][1].yaw.delay_ticks:set(v59[v81][2].yaw.delay_ticks:get());
        v59[v81][1].yaw_modifier:set(v59[v81][2].yaw_modifier:get());
        v59[v81][1].yaw_modifier_offset:set(v59[v81][2].yaw_modifier_offset:get());
        v59[v81][1].body_yaw:set(v59[v81][2].body_yaw:get());
        v59[v81][1].body_yaw.body_yaw_jitter:set(v59[v81][2].body_yaw.body_yaw_jitter:get());
        v59[v81][1].left_limit:set(v59[v81][2].left_limit:get());
        v59[v81][1].right_limit:set(v59[v81][2].right_limit:get());
        v59[v81][1].force_defensive:set(v59[v81][2].force_defensive:get());
        v59[v81][1].defensive_pitch:set(v59[v81][2].defensive_pitch:get());
        v59[v81][1].spin_pitch:set(v59[v81][2].spin_pitch:get());
        v59[v81][1].spin_pitch_speed:set(v59[v81][2].spin_pitch_speed:get());
        v59[v81][1].pitch_jitter_1:set(v59[v81][2].pitch_jitter_1:get());
        v59[v81][1].pitch_jitter_2:set(v59[v81][2].pitch_jitter_2:get());
        v59[v81][1].custom_pitch:set(v59[v81][2].custom_pitch:get());
        v59[v81][1].defensive_yaw:set(v59[v81][2].defensive_yaw:get());
        v59[v81][1].spin_yaw:set(v59[v81][2].spin_yaw:get());
        v59[v81][1].spin_yaw_speed:set(v59[v81][2].spin_yaw_speed:get());
        v59[v81][1].yaw_jitter_1:set(v59[v81][2].yaw_jitter_1:get());
        v59[v81][1].yaw_jitter_2:set(v59[v81][2].yaw_jitter_2:get());
        v59[v81][1].custom_yaw:set(v59[v81][2].custom_yaw:get());
        cvar.play:call("ambient\\tones\\elev1");
    end;
end, true);
local function v84()
    -- upvalues: v83 (ref), v50 (ref), v80 (ref)
    v83:visibility(v50.main_aa.select_team:get() == 2);
    v80:visibility(v50.main_aa.select_team:get() == 1);
end;
local function v89(v85, v86)
    local v87 = v85 - v85 * v86 / 100;
    local v88 = v85 + v85 * v86 / 100;
    return utils.random_int(v87, v88);
end;
id = 1;
tm = 1;
local v90 = 1;
end_time = 0;
ground_ticks = v90;
delayed = false;
in_air = function()
    if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
        ground_ticks = ground_ticks + 1;
    else
        ground_ticks = 0;
        end_time = globals.curtime + 1;
    end;
    return ground_ticks > 1 and end_time > globals.curtime;
end;
player_state = function(_)
    -- upvalues: v27 (ref)
    in_air();
    on_ground = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0;
    jump = end_time > globals.curtime + 0.9;
    slowwalk_key = v27.miscAa.slow_walk:get();
    crouch = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 1)) ~= 0 or v27.miscAa.fake_duck:get();
    local l_x_0 = entity.get_local_player().m_vecVelocity.x;
    local l_y_0 = entity.get_local_player().m_vecVelocity.y;
    vz = entity.get_local_player().m_vecVelocity.z;
    vy = l_y_0;
    vx = l_x_0;
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
v90 = function()
    -- upvalues: v26 (ref), v25 (ref), v50 (ref), v27 (ref)
    local v94 = entity.get_local_player();
    if not v94 or v94 == nil then
        return;
    elseif v94:get_index() == nil then
        return;
    else
        in_air();
        v26 = v25(v94:get_index());
        local v95 = v94:get_anim_state();
        if not v95 or v95 == nil then
            return;
        else
            move = math.sqrt(v94.m_vecVelocity.x ^ 2 + v94.m_vecVelocity.y ^ 2) > 5;
            jump = end_time > globals.curtime + 0.9;
            on_ground = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0;
            if v50.main_aa.animbreaker.select:get("on ground") then
                if v50.main_aa.animbreaker.select_on_ground:get() == "static" then
                    v94.m_flPoseParameter[0] = 1;
                    v27.miscAa.legs_movement:override("Sliding");
                end;
                if v50.main_aa.animbreaker.select_on_ground:get() == "kangaroo" then
                    v94.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and 25 or 50 / (globals.tickcount % 8 >= 4 and 100 or 200);
                    v27.miscAa.legs_movement:override("Sliding");
                end;
                if v50.main_aa.animbreaker.select_on_ground:get() == "moonwalk" and move and not jump then
                    v94.m_flPoseParameter[7] = 1;
                    v27.miscAa.legs_movement:override("Walking");
                end;
            end;
            if v50.main_aa.animbreaker.select:get("in air") then
                if v50.main_aa.animbreaker.select_in_air:get() == "static" then
                    v94.m_flPoseParameter[6] = 1;
                end;
                if v50.main_aa.animbreaker.select_in_air:get() == "kangaroo" then
                    v94.m_flPoseParameter[6] = globals.tickcount % 4 >= 2 and 25 or 50 / (globals.tickcount % 8 >= 4 and 200 or 400);
                end;
                if v50.main_aa.animbreaker.select_in_air:get() == "moonwalk" and jump and move then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][6].m_flWeight = 1;
                end;
            end;
            if v50.main_aa.animbreaker.select:get("additions") then
                if v50.main_aa.animbreaker.additions:get("0 pitch on land") and not jump and v95.landing then
                    v94.m_flPoseParameter[12] = 0.5;
                end;
                if v50.main_aa.animbreaker.additions:get("earthquake") and not move then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][12].m_flWeight = utils.random_float(0.1, 1);
                end;
                if v50.main_aa.animbreaker.additions:get("lean") and not v50.main_aa.animbreaker.additions:get("earthquake") then
                    if v50.main_aa.animbreaker.select_in_air:get() == "kangaroo" then
                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][12].m_flWeight = v50.main_aa.animbreaker.lean_amount:get() / 100;
                    else
                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][12].m_flWeight = v50.main_aa.animbreaker.lean_amount:get() / 100;
                        v94.m_flPoseParameter[6] = v50.main_aa.animbreaker.lean_amount:get() / 1000000;
                    end;
                end;
                if v50.main_aa.animbreaker.additions:get("lean") and v50.main_aa.animbreaker.additions:get("earthquake") and move then
                    if v50.main_aa.animbreaker.select_in_air:get() == "kangaroo" then
                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][12].m_flWeight = v50.main_aa.animbreaker.lean_amount:get() / 100;
                    else
                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v26) + 10640)[0][12].m_flWeight = v50.main_aa.animbreaker.lean_amount:get() / 100;
                        v94.m_flPoseParameter[6] = v50.main_aa.animbreaker.lean_amount:get() / 1000000;
                    end;
                end;
            end;
            return;
        end;
    end;
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
local v97 = 0;
local v98 = 0;
local function v103(_)
    -- upvalues: v97 (ref), v98 (ref)
    local l_tickcount_0 = globals.tickcount;
    local v101 = to_ticks(entity.get_local_player().m_flSimulationTime);
    local v102 = v101 - v97;
    if v102 < 0 then
        v98 = l_tickcount_0 + math.abs(v102);
    end;
    v97 = v101;
    return l_tickcount_0 < v98;
end;
local v104 = false;
events.round_end:set(function(_)
    -- upvalues: v104 (ref)
    v104 = true;
end);
events.round_start:set(function(_)
    -- upvalues: v104 (ref)
    v104 = false;
end);
local v107 = false;
local function v113(v108)
    -- upvalues: v59 (ref), v27 (ref), v89 (ref), v50 (ref), v103 (ref), v107 (ref), v104 (ref)
    local v109 = entity.get_local_player();
    if not v109 then
        return;
    else
        switch = v109.m_flPoseParameter[11] * 120 - 60 > 0;
        if v59[2][1].enable:get() and player_state(v108) == "Standing" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 2;
            tm = 1;
        elseif v59[3][1].enable:get() and player_state(v108) == "Moving" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 3;
            tm = 1;
        elseif v59[4][1].enable:get() and player_state(v108) == "Walking" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 4;
            tm = 1;
        elseif v59[5][1].enable:get() and player_state(v108) == "Crouching" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 5;
            tm = 1;
        elseif v59[6][1].enable:get() and player_state(v108) == "Sneaking" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 6;
            tm = 1;
        elseif v59[7][1].enable:get() and player_state(v108) == "Aerobic" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 7;
            tm = 1;
        elseif v59[8][1].enable:get() and player_state(v108) == "Aerobic+" and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() > 0 then
            id = 8;
            tm = 1;
        elseif v59[9][1].enable:get() and player_team(v108) == "Counter-Terrorist" and rage.exploit:get() <= 0 then
            id = 9;
            tm = 1;
        elseif v59[2][2].enable:get() and player_state(v108) == "Standing" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 2;
            tm = 2;
        elseif v59[3][2].enable:get() and player_state(v108) == "Moving" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 3;
            tm = 2;
        elseif v59[4][2].enable:get() and player_state(v108) == "Walking" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 4;
            tm = 2;
        elseif v59[5][2].enable:get() and player_state(v108) == "Crouching" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 5;
            tm = 2;
        elseif v59[6][2].enable:get() and player_state(v108) == "Sneaking" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 6;
            tm = 2;
        elseif v59[7][2].enable:get() and player_state(v108) == "Aerobic" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 7;
            tm = 2;
        elseif v59[8][2].enable:get() and player_state(v108) == "Aerobic+" and player_team(v108) == "Terrorist" and rage.exploit:get() > 0 then
            id = 8;
            tm = 2;
        elseif v59[9][2].enable:get() and player_team(v108) == "Terrorist" and rage.exploit:get() <= 0 then
            id = 9;
            tm = 1;
        else
            id = 1;
            if player_team(v108) == "Terrorist" then
                tm = 2;
            else
                tm = 1;
            end;
        end;
        v27.aa.enable:override(v59[id][tm].enable:get());
        v27.aa.pitch:override(v59[id][tm].pitch:get());
        v27.aa.enable:disabled(v59[id][tm].enable:get());
        v27.aa.pitch:disabled(v59[id][tm].enable:get());
        v27.aa.yaw:disabled(v59[id][tm].enable:get());
        v27.aa.yaw_modifier:disabled(v59[id][tm].enable:get());
        v27.aa.body_yaw:disabled(v59[id][tm].enable:get());
        v27.aa.freestanding:disabled(v59[id][tm].enable:get());
        v27.aa.yaw:override("Backward");
        v27.aa.yaw_offset:set(0);
        v27.aa.modifier_offset:set(0);
        if v59[id][tm].yaw:get() == "static" then
            v27.aa.yaw_offset:override(v59[id][tm].static_yaw:get());
        end;
        if v59[id][tm].yaw:get() == "left ~ right" then
            v27.aa.yaw_offset:override(switch and v89(v59[id][tm].left_yaw:get(), v59[id][tm].yaw.yaw_randomization:get()) or v89(v59[id][tm].right_yaw:get(), v59[id][tm].yaw.yaw_randomization:get()));
        end;
        if v59[id][tm].yaw:get() == "delayed" then
            v27.aa.yaw_offset:override(switch and v89(v59[id][tm].left_yaw:get(), v59[id][tm].yaw.yaw_randomization:get()) or v89(v59[id][tm].right_yaw:get(), v59[id][tm].yaw.yaw_randomization:get()));
            rage.antiaim:inverter(delayed);
        end;
        v27.aa.yaw_modifier:override(v59[id][tm].yaw_modifier:get());
        v27.aa.modifier_offset:override(v59[id][tm].yaw_modifier_offset:get());
        if v59[id][tm].body_yaw:get() then
            v27.aa.body_yaw:override(true);
            if v59[id][tm].body_yaw.body_yaw_jitter:get() then
                v27.aa.options:override("Jitter");
                v27.aa.left_limit:override(v59[id][tm].left_limit:get());
                v27.aa.right_limit:override(v59[id][tm].right_limit:get());
            else
                v27.aa.options:override("");
                v27.aa.left_limit:override(v59[id][tm].left_limit:get());
                v27.aa.right_limit:override(v59[id][tm].right_limit:get());
            end;
        else
            v27.aa.body_yaw:override(false);
            v27.aa.options:override("");
            v27.aa.left_limit:override(0);
            v27.aa.right_limit:override(0);
        end;
        if v59[id][tm].force_defensive:get(1) then
            v27.aa.hidden:override(true);
            v27.rage.dt_options:override("Always On");
        else
            v27.aa.hidden:override(true);
            v27.rage.dt_options:override("On Peek");
        end;
        if v59[id][tm].force_defensive:get(2) then
            v27.aa.hidden:override(true);
            v27.rage.hs_options:override("Break LC");
        else
            v27.aa.hidden:override(true);
            v27.rage.hs_options:override("Favor Fire Rate");
        end;
        if v59[id][tm].defensive_pitch:get() == "random" then
            rage.antiaim:override_hidden_pitch(utils.random_int(-89, 89));
        elseif v59[id][tm].defensive_pitch:get() == "down" then
            rage.antiaim:override_hidden_pitch(89);
        elseif v59[id][tm].defensive_pitch:get() == "up" then
            rage.antiaim:override_hidden_pitch(-89);
        elseif v59[id][tm].defensive_pitch:get() == "half up" then
            rage.antiaim:override_hidden_pitch(-45);
        elseif v59[id][tm].defensive_pitch:get() == "half down" then
            rage.antiaim:override_hidden_pitch(45);
        elseif v59[id][tm].defensive_pitch:get() == "spin" then
            rage.antiaim:override_hidden_pitch(-math.fmod(globals.curtime * (v59[id][tm].spin_pitch_speed:get() * 360), v59[id][tm].spin_pitch:get() * 2) + v59[id][tm].spin_pitch:get());
        elseif v59[id][tm].defensive_pitch:get() == "jitter" then
            if globals.tickcount % 4 > 1 then
                rage.antiaim:override_hidden_pitch(v59[id][tm].pitch_jitter_1:get());
            else
                rage.antiaim:override_hidden_pitch(v59[id][tm].pitch_jitter_2:get());
            end;
        elseif v59[id][tm].defensive_pitch:get() == "custom" then
            rage.antiaim:override_hidden_pitch(v59[id][tm].custom_pitch:get());
        end;
        if v59[id][tm].defensive_yaw:get() == "forward" then
            rage.antiaim:override_hidden_yaw_offset(math.random(-160, -180));
        elseif v59[id][tm].defensive_yaw:get() == "random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
        elseif v59[id][tm].defensive_yaw:get() == "spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (v59[id][tm].spin_yaw_speed:get() * 360), v59[id][tm].spin_yaw:get() * 2) + v59[id][tm].spin_yaw:get());
        elseif v59[id][tm].defensive_yaw:get() == "jitter" then
            rage.antiaim:override_hidden_yaw_offset(switch and v59[id][tm].yaw_jitter_2:get() or v59[id][tm].yaw_jitter_1:get());
        elseif v59[id][tm].defensive_yaw:get() == "sideways" then
            if globals.tickcount % 4 > 1 then
                rage.antiaim:override_hidden_yaw_offset(-90);
            else
                rage.antiaim:override_hidden_yaw_offset(90);
            end;
        elseif v59[id][tm].defensive_yaw:get() == "custom" then
            rage.antiaim:override_hidden_yaw_offset(v59[id][tm].custom_yaw:get());
        else
            rage.antiaim:override_hidden_yaw_offset(v27.aa.yaw_offset:get());
        end;
        local v110 = v50.main_aa.yaw_base:get();
        if v110 == "local view" then
            v27.aa.yaw_base:override("Local View");
        elseif v110 == "at target" then
            v27.aa.yaw_base:override("At Target");
        elseif v110 == "left" then
            v27.aa.yaw_base:override("Local View");
            v27.aa.yaw_offset:override(-90);
        elseif v110 == "right" then
            v27.aa.yaw_base:override("Local View");
            v27.aa.yaw_offset:override(90);
        elseif v110 == "forward" then
            v27.aa.yaw_base:override("Local View");
            v27.aa.yaw_offset:override(180);
        end;
        v27.aa.freestanding:override(v50.main_aa.freestanding:get());
        if v110 == "left" or v110 == "right" or v110 == "forward" then
            if v50.main_aa.freestanding.disable_on_manual:get() then
                v27.aa.freestanding:override(false);
            else
                v27.aa.freestanding:override(v50.main_aa.freestanding:get());
            end;
            if v50.main_aa.yaw_base.staticManual:get() then
                v27.aa.yaw_modifier:override("Disabled");
                v27.aa.options:override("");
                v27.aa.hidden:override(false);
            end;
        end;
        if v50.main_aa.freestanding.select:get() == "static" and v27.aa.freestanding:get_override() then
            v27.aa.yaw_modifier:override("Disabled");
            v27.aa.options:override("");
            v27.aa.hidden:override(false);
            v27.aa.freestanding_modifier:override(false);
            v27.aa.freestanding_body:override(true);
        elseif v50.main_aa.freestanding.select:get() == "jitter" and v27.aa.freestanding:get_override() then
            v27.aa.yaw_modifier:override("Disabled");
            v27.aa.options:override("Jitter");
            v27.aa.hidden:override(false);
            v27.aa.freestanding_modifier:override(false);
            v27.aa.freestanding_body:override(false);
        end;
        if v50.main_aa.safe_head:get() then
            local v111 = v109:get_player_weapon();
            if v111 == nil then
                return;
            else
                local v112 = v111:get_classname();
                if v112 == nil then
                    return;
                else
                    if v50.main_aa.safe_head.select:get("on knife") and string.match(v112, "Knife") and player_state(v108) == "Aerobic+" then
                        v27.aa.yaw_offset:override(0);
                        v27.aa.yaw_modifier:override("Disabled");
                        v27.aa.options:override("");
                        v27.aa.left_limit:override(0);
                        v27.aa.right_limit:override(0);
                        v27.aa.hidden:override(false);
                    end;
                    if v50.main_aa.safe_head.select:get("on taser") and string.match(v112, "Taser") and player_state(v108) == "Aerobic+" then
                        v27.aa.yaw_offset:override(0);
                        v27.aa.yaw_modifier:override("Disabled");
                        v27.aa.options:override("");
                        v27.aa.left_limit:override(0);
                        v27.aa.right_limit:override(0);
                        v27.aa.hidden:override(false);
                    end;
                end;
            end;
        end;
        v27.aa.avoid_backstab:override(v50.main_aa.tweaks:get("anti-backstab"));
        if v50.main_aa.tweaks:get("random aa on warmup") and entity.get_game_rules().m_bWarmupPeriod then
            v27.aa.yaw_offset:override(utils.random_int(-30, 30));
            v27.aa.yaw_modifier:override("3-Way");
            v27.aa.options:override("Jitter");
            v27.aa.left_limit:override(60);
            v27.aa.right_limit:override(60);
            v27.aa.modifier_offset:override(utils.random_int(-180, 180));
        end;
        if v50.main_aa.flick_exploit.enable:get() and player_state(v108) == "Walking" then
            if rage.exploit:get() < 1 then
                return;
            else
                if v50.main_aa.flick_exploit.flick_mode:get() == "anti-skeet" then
                    if globals.tickcount % 4 == 0 and v103(v109) then
                        v107 = not v107;
                    end;
                elseif v50.main_aa.flick_exploit.flick_mode:get() == "anti-neverlose" and globals.tickcount % 2 == 0 and v103(v109) then
                    v107 = not v107;
                end;
                v27.aa.yaw_modifier:override("");
                v27.aa.yaw_offset:override(5);
                rage.antiaim:inverter(v107);
                v27.aa.yaw_modifier:override("Disabled");
                v27.aa.body_yaw:override(true);
                v27.aa.options:override("");
                v27.aa.left_limit:override(48);
                v27.aa.right_limit:override(48);
                v108.force_defensive = v108.command_number % 3 == 0;
                v27.rage.dt_options:override("Always On");
                v27.rage.hs_options:override("Break LC");
                v27.aa.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                if v50.main_aa.flick_exploit.flick_mode:get() == "anti-skeet" then
                    rage.antiaim:override_hidden_yaw_offset(v107 and -90 or -44);
                elseif v50.main_aa.flick_exploit.flick_mode:get() == "anti-neverlose" then
                    rage.antiaim:override_hidden_yaw_offset(v107 and 80 or 61);
                end;
            end;
        end;
        if v50.main_aa.tweaks:get("spin aa on round end") and v104 then
            v27.aa.yaw_offset:override(globals.curtime * 5 * 360 % 360);
            v27.aa.pitch:override("Disabled");
            v27.aa.body_yaw:override(false);
            v27.aa.yaw_modifier:override("Disabled");
            v27.aa.modifier_offset:override(0);
            v27.aa.hidden:override(false);
            v27.rage.dt_options:override("On Peek");
        end;
        return;
    end;
end;
local v114 = 1;
local _ = 2;
local _ = 3;
local v117 = 5;
local function v122(v118)
    -- upvalues: v114 (ref), v117 (ref)
    local v119 = v118:get_weapon_info();
    if v119 == nil then
        return false;
    else
        local l_weapon_type_0 = v119.weapon_type;
        local v121 = v118:get_weapon_index();
        if l_weapon_type_0 == v114 then
            if v121 == 1 then
                return "deagle";
            else
                return "pistols";
            end;
        elseif l_weapon_type_0 == v117 then
            if v121 == 40 then
                return "scout";
            elseif v121 == 9 then
                return "awp";
            else
                return "auto";
            end;
        else
            return false;
        end;
    end;
end;
local function v128(v123)
    -- upvalues: v50 (ref), v122 (ref), v27 (ref)
    local v124 = entity.get_local_player();
    if not v124 or not v124:is_alive() then
        return;
    elseif not v50.misc_rage.auto_osaa:get() then
        return;
    else
        local v125 = v124:get_player_weapon();
        if not v125 then
            return;
        else
            local v126 = v122(v125);
            if not v126 then
                return;
            elseif not v50.misc_rage.auto_osaa.weapons:get(v126) then
                return;
            else
                local v127 = player_state(v123);
                if v50.misc_rage.auto_osaa.conds:get("standing") and v127 == "Standing" then
                    v27.rage.hide_shots:override(true);
                    v27.rage.double_tap:override(false);
                elseif v50.misc_rage.auto_osaa.conds:get("crouching") and v127 == "Crouching" then
                    v27.rage.hide_shots:override(true);
                    v27.rage.double_tap:override(false);
                elseif v50.misc_rage.auto_osaa.conds:get("sneaking") and v127 == "Sneaking" then
                    v27.rage.hide_shots:override(true);
                    v27.rage.double_tap:override(false);
                elseif v50.misc_rage.auto_osaa.conds:get("slow walking") and v127 == "Walking" then
                    v27.rage.hide_shots:override(true);
                    v27.rage.double_tap:override(false);
                else
                    v27.rage.hide_shots:override();
                    v27.rage.double_tap:override();
                end;
                return;
            end;
        end;
    end;
end;
local function v129()
    -- upvalues: v50 (ref), v4 (ref)
    if v50.misc_rage.fake_latency_unlock:get() then
        cvar.sv_maxunlag:float(0.4, true);
    else
        cvar.sv_maxunlag:float(v4(cvar.sv_maxunlag), true);
    end;
end;
local v130 = {};
local v131 = 5;
local v132 = nil;
local v133 = nil;
local v134 = nil;
local v135 = nil;
local v136 = nil;
local v137 = false;
local v138 = false;
local v139 = 1;
local v140 = 0;
local v141 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "chest", 
    [5] = "chest", 
    [6] = "legs", 
    [7] = "legs", 
    [8] = "head", 
    [9] = nil, 
    [10] = "gear"
};
local v142 = {
    [1] = {
        hitbox = "stomach", 
        scale = 5, 
        vec = vector(0, 0, 40)
    }, 
    [2] = {
        hitbox = "chest", 
        scale = 6, 
        vec = vector(0, 0, 50)
    }, 
    [3] = {
        hitbox = "head", 
        scale = 3, 
        vec = vector(0, 0, 58)
    }, 
    [4] = {
        hitbox = "legs", 
        scale = 4, 
        vec = vector(0, 0, 20)
    }
};
local function v146(v143, v144)
    for v145 = 1, #v143 do
        if v143[v145] == v144 then
            return true;
        end;
    end;
    return false;
end;
local function v148(v147)
    return v147 >= 1 and v147 <= 6;
end;
local function v153()
    local v149 = {};
    local v150 = entity.get_player_resource();
    for v151 = 1, globals.max_players do
        local v152 = entity.get(v151);
        if v152 ~= nil and v150.m_bConnected[v151] and v152:is_enemy() and v152:is_dormant() then
            table.insert(v149, v152);
        end;
    end;
    return v149;
end;
local function v160(v154, v155, v156)
    local v157 = v154:to(v155):angles();
    local v158 = math.rad(v157.y + 90);
    local v159 = vector(math.cos(v158), math.sin(v158), 0) * v156;
    return {
        [1] = {
            text = "Middle", 
            vec = v155
        }, 
        [2] = {
            text = "Left", 
            vec = v155 + v159
        }, 
        [3] = {
            text = "Right", 
            vec = v155 - v159
        }
    };
end;
local function v168(v161, v162, v163, v164)
    local v165, v166 = utils.trace_bullet(v161, v162, v163, v164);
    if v166 ~= nil then
        local l_entity_0 = v166.entity;
        if l_entity_0 == nil then
            return 0, v166;
        elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
            return 0, v166;
        end;
    end;
    return v165, v166;
end;
do
    local l_v131_0, l_v132_0, l_v133_0, l_v134_0, l_v135_0, l_v136_0, l_v137_0, l_v138_0, l_v139_0, l_v140_0, l_v141_0, l_v142_0, l_v146_0, l_v148_0, l_v153_0, l_v160_0, l_v168_0 = v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v146, v148, v153, v160, v168;
    v130.on_createmove = function(v186)
        -- upvalues: v50 (ref), v27 (ref), l_v140_0 (ref), l_v148_0 (ref), l_v153_0 (ref), l_v139_0 (ref), l_v142_0 (ref), l_v146_0 (ref), l_v160_0 (ref), l_v168_0 (ref), l_v132_0 (ref), l_v134_0 (ref), l_v135_0 (ref), l_v133_0 (ref), l_v136_0 (ref), l_v131_0 (ref), l_v138_0 (ref)
        if not v50.misc_rage.dormant_aimbot.enable:get() then
            return v27.rage.da:override();
        else
            v27.rage.da:override(false);
            local v187 = entity.get_local_player();
            if v187 == nil then
                return;
            else
                local v188 = v187:get_player_weapon();
                if v188 == nil then
                    return;
                else
                    local v189 = v188:get_weapon_info();
                    if v189 == nil then
                        return;
                    else
                        local v190 = v188:get_inaccuracy();
                        if v190 == nil then
                            return;
                        else
                            local l_tickcount_1 = globals.tickcount;
                            local v192 = v187:get_eye_position();
                            local l_current_0 = v187:get_simulation_time().current;
                            local v194 = bit.band(v187.m_fFlags, bit.lshift(1, 0)) ~= 0;
                            if l_tickcount_1 < l_v140_0 then
                                return;
                            elseif v186.in_jump and not v194 then
                                return;
                            else
                                local l_weapon_type_1 = v189.weapon_type;
                                if not l_v148_0(l_weapon_type_1) or v188.m_iClip1 <= 0 then
                                    return false;
                                else
                                    local v196 = l_v153_0();
                                    local v197 = v50.misc_rage.dormant_aimbot.hitboxes:get();
                                    if l_tickcount_1 % #v196 ~= 0 then
                                        l_v139_0 = l_v139_0 + 1;
                                    else
                                        l_v139_0 = 1;
                                    end;
                                    local v198 = v196[l_v139_0];
                                    if v198 == nil then
                                        return;
                                    else
                                        local v199 = v198:get_bbox();
                                        local v200 = v198:get_origin();
                                        local l_m_flDuckAmount_0 = v198.m_flDuckAmount;
                                        local v202 = v50.misc_rage.dormant_aimbot.hitchance:get();
                                        local v203 = v27.rage.min_damage:get();
                                        if v203 > 100 then
                                            v203 = v203 - 100 + v198.m_iHealth;
                                        end;
                                        local v204 = {};
                                        for v205 = 1, #l_v142_0 do
                                            local v206 = l_v142_0[v205];
                                            local l_vec_0 = v206.vec;
                                            local l_scale_0 = v206.scale;
                                            local l_hitbox_0 = v206.hitbox;
                                            if l_hitbox_0 == "head" then
                                                l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                            end;
                                            if l_hitbox_0 == "chest" then
                                                l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                            end;
                                            if #v197 ~= 0 then
                                                if l_v146_0(v197, l_hitbox_0) then
                                                    table.insert(v204, {
                                                        vec = l_vec_0, 
                                                        scale = l_scale_0, 
                                                        hitbox = l_hitbox_0
                                                    });
                                                end;
                                            else
                                                table.insert(v204, 1, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        end;
                                        if not (v189.is_revolver and not (v188.m_flNextPrimaryAttack >= l_current_0) or math.max(v187.m_flNextAttack, v188.m_flNextPrimaryAttack, v188.m_flNextSecondaryAttack) < l_current_0) then
                                            return;
                                        else
                                            local v210 = nil;
                                            local v211 = nil;
                                            if math.floor(v199.alpha * 100) + 5 <= v202 then
                                                return;
                                            else
                                                for v212 = 1, #v204 do
                                                    local v213 = v204[v212];
                                                    local v214 = l_v160_0(v192, v200 + v213.vec, v213.scale);
                                                    for v215 = 1, #v214 do
                                                        local v216 = v214[v215];
                                                        local l_vec_1 = v216.vec;
                                                        local v219, v220 = l_v168_0(v187, v192, l_vec_1, function(v218)
                                                            -- upvalues: v198 (ref)
                                                            return v218 == v198;
                                                        end);
                                                        if (v220 == nil or not v220:is_visible()) and v219 ~= 0 and v203 < v219 then
                                                            v210 = l_vec_1;
                                                            v211 = v219;
                                                            l_v132_0 = v198;
                                                            l_v134_0 = v213.hitbox;
                                                            l_v135_0 = v219;
                                                            l_v133_0 = v216.text;
                                                            l_v136_0 = v199.alpha;
                                                            break;
                                                        end;
                                                    end;
                                                    if v210 and v211 then
                                                        break;
                                                    end;
                                                end;
                                                if not v210 or not v211 then
                                                    return;
                                                else
                                                    local v221 = v192:to(v210):angles();
                                                    v186.block_movement = 1;
                                                    if v50.misc_rage.dormant_aimbot.auto_scope:get() then
                                                        local v222 = not v186.in_jump and v194;
                                                        local v223 = v187.m_bIsScoped or v187.m_bResumeZoom;
                                                        local v224 = v189.weapon_type == l_v131_0;
                                                        if not v223 and v224 and v222 then
                                                            v186.in_attack2 = true;
                                                        end;
                                                    end;
                                                    if v190 < 0.01 then
                                                        v186.view_angles = v221;
                                                        v186.in_attack = true;
                                                        l_v138_0 = true;
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
    end;
    v130.on_weapon_fire = function(v225)
        -- upvalues: v50 (ref), v27 (ref), l_v138_0 (ref), l_v137_0 (ref), l_v132_0 (ref), l_v134_0 (ref), l_v135_0 (ref), l_v133_0 (ref), l_v136_0 (ref)
        if not v50.misc_rage.dormant_aimbot.enable:get() then
            return v27.rage.da:override();
        else
            utils.execute_after(0.03, function()
                -- upvalues: v225 (ref), l_v138_0 (ref), l_v137_0 (ref), l_v132_0 (ref), l_v134_0 (ref), l_v135_0 (ref), l_v133_0 (ref), l_v136_0 (ref)
                if entity.get(v225.userid, true) == entity.get_local_player() then
                    if l_v138_0 and not l_v137_0 then
                        events.dormant_miss:call({
                            userid = l_v132_0, 
                            aim_hitbox = l_v134_0, 
                            aim_damage = l_v135_0, 
                            aim_point = l_v133_0, 
                            accuracy = l_v136_0
                        });
                    end;
                    l_v137_0 = false;
                    l_v138_0 = false;
                    l_v132_0 = nil;
                    l_v134_0 = nil;
                    l_v135_0 = nil;
                    l_v133_0 = nil;
                    l_v136_0 = nil;
                end;
            end);
            return;
        end;
    end;
    v130.on_player_hurt = function(v226)
        -- upvalues: v50 (ref), v27 (ref), l_v138_0 (ref), l_v137_0 (ref), l_v141_0 (ref), l_v133_0 (ref), l_v134_0 (ref), l_v135_0 (ref)
        if not v50.misc_rage.dormant_aimbot.enable:get() then
            return v27.rage.da:override();
        else
            local v227 = entity.get_local_player();
            local v228 = entity.get(v226.userid, true);
            local v229 = entity.get(v226.attacker, true);
            if v228 == nil or v229 ~= v227 then
                return;
            else
                local v230 = v228:get_bbox();
                if v230 == nil then
                    return;
                else
                    if v228:is_dormant() and l_v138_0 == true then
                        l_v137_0 = true;
                        events.dormant_hit:call({
                            userid = v228, 
                            attacker = v229, 
                            health = v226.health, 
                            armor = v226.armor, 
                            weapon = v226.weapon, 
                            dmg_health = v226.dmg_health, 
                            dmg_armor = v226.dmg_armor, 
                            hitgroup = v226.hitgroup, 
                            accuracy = v230.alpha, 
                            hitbox = l_v141_0[v226.hitgroup], 
                            aim_point = l_v133_0, 
                            aim_hitbox = l_v134_0, 
                            aim_damage = l_v135_0
                        });
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v131 = {};
v132 = function()
    -- upvalues: v131 (ref)
    local v231 = 0;
    local v232 = render.screen_size();
    for v233 = #v131, 1, -1 do
        local v234 = v131[v233];
        if v234.time + 3 > globals.realtime then
            v234.alpha = math.lerp(v234.alpha, 255, 0.1);
        else
            v234.alpha = math.lerp(v234.alpha, 0, 0.1);
        end;
        v234.offset = v234.offset or 25;
        v234.offset = math.lerp(v234.offset, 0, 0.2);
        if v234.alpha < 1 or #v131 > 4 then
            table.remove(v131, v233);
        end;
    end;
    for _, v236 in ipairs(v131) do
        local v237 = tostring(v236.text);
        local l_color_0 = v236.color;
        local l_x_1 = render.measure_text(verdanaBIG, "", v236.icon or "\226\155\167").x;
        local l_x_2 = render.measure_text(1, "", v237).x;
        local v241 = l_x_1 * 2 + l_x_2 + 16;
        local v242 = v241 / 2;
        local v243 = v232.y / 1.15 - v231 + v236.offset;
        local v244 = v232.x / 2 - v242;
        render.rect(vector(v244 - 10, v243 - 6), vector(v244 + v241 + 5, v243 + 17), color(24, 24, 24, v236.alpha), 10);
        render.shadow(vector(v244 - 10, v243 - 6), vector(v244 + v241 + 5, v243 + 17), color(l_color_0.r, l_color_0.g, l_color_0.b, v236.alpha * 0.8), 50, 0, 10);
        if v236.icon then
            render.text(verdanaBIG, vector(v232.x / 2 - v242 + 2, v243 - 4), color(l_color_0.r, l_color_0.g, l_color_0.b, v236.alpha), nil, v236.icon);
        end;
        render.text(1, vector(v244 + l_x_1 + 7, v243 - 1), color(255, 255, 255, v236.alpha), nil, v237);
        if v236.icon then
            render.text(verdanaBIG, vector(v244 + l_x_1 + 4 + l_x_2 + 7, v243 - 4), color(l_color_0.r, l_color_0.g, l_color_0.b, v236.alpha), nil, v236.icon);
        end;
        v231 = v231 + 35 * v236.alpha / 255;
    end;
end;
v133 = function(v245, v246)
    -- upvalues: v131 (ref)
    local v247 = "";
    for _, v249 in ipairs(v245) do
        if type(v249) == "table" then
            local v250 = v249[1];
            if v249[2] and v246 then
                v247 = v247 .. "\a" .. v246:to_hex();
            else
                v247 = v247 .. "\aDEFAULT";
            end;
            v247 = v247 .. v250;
        end;
    end;
    table.insert(v131, 1, {
        alpha = 0, 
        icon = "\226\155\167", 
        text = v247, 
        time = globals.realtime, 
        color = v246 or color(255, 255, 255)
    });
end;
v134 = {
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
v135 = function(v251)
    -- upvalues: v50 (ref), v134 (ref)
    if not v50.misc_other.event_logs:get("aimbot") then
        return;
    else
        local v252 = entity.get(v251.target);
        if not v252 then
            return;
        else
            local l_damage_0 = v251.damage;
            local l_wanted_damage_0 = v251.wanted_damage;
            local v255 = v134[v251.hitgroup];
            local v256 = v134[v251.wanted_hitgroup];
            local l_hitchance_0 = v251.hitchance;
            local l_state_0 = v251.state;
            local l_backtrack_0 = v251.backtrack;
            local l_m_iHealth_0 = v252.m_iHealth;
            local v261 = string.lower(v252:get_name());
            local l_spread_0 = v251.spread;
            local v263 = string.format("%.1f\194\176", tonumber(l_spread_0) or 0);
            local v264 = v50.misc_other.event_logs.hit_color:get():to_hex();
            local v265 = v50.misc_other.event_logs.miss_color:get():to_hex();
            if l_state_0 == "backtrack failure" then
                l_state_0 = "lagcomp failure";
            end;
            if l_state_0 == nil then
                if v50.misc_other.event_logs.select:get("aimbot") then
                    local v266 = string.format("\aDEFAULT[\a%shelios\aDEFAULT] \a%sregistered\aDEFAULT shot in %s's %s for \a%s%d(%d)\aDEFAULT damage ( remaining: \a%s%d\aDEFAULT | aimed: \a%s%s\aDEFAULT | history: \a%s%s\aDEFAULT | spread: \a%s%s\aDEFAULT )", v264, v264, v261, v255, v264, l_damage_0, l_wanted_damage_0, v264, l_m_iHealth_0, v264, v256, v264, l_backtrack_0, v264, v263);
                    print_dev(v266);
                    print_raw(v266);
                end;
            elseif v50.misc_other.event_logs.select:get("aimbot") then
                local v267 = string.format("\aDEFAULT[\a%shelios\aDEFAULT] \a%smissed\aDEFAULT shot at %s's %s due to \a%s%s\aDEFAULT ( hitchance: \a%s%s\aDEFAULT | damage: \a%s%s\aDEFAULT | history: \a%s%s\aDEFAULT | spread: \a%s%s\aDEFAULT )", v265, v265, v261, v256, v265, l_state_0, v265, l_hitchance_0, v265, l_wanted_damage_0, v265, l_backtrack_0, v265, v263);
                print_dev(v267);
                print_raw(v267);
            end;
            return;
        end;
    end;
end;
v136 = function(v268)
    -- upvalues: v50 (ref), v134 (ref), v133 (ref)
    if not v50.misc_widgets.notify:get() then
        return;
    else
        local v269 = entity.get(v268.target);
        if not v269 then
            return;
        else
            local l_damage_1 = v268.damage;
            local _ = v268.wanted_damage;
            local v272 = v134[v268.hitgroup];
            local v273 = v134[v268.wanted_hitgroup];
            local _ = v268.hitchance;
            local l_state_1 = v268.state;
            local _ = v268.backtrack;
            local _ = v269.m_iHealth;
            local v278 = string.lower(v269:get_name());
            local l_spread_1 = v268.spread;
            local _ = string.format("%.1f\194\176", tonumber(l_spread_1) or 0);
            local _ = v50.misc_other.event_logs.hit_color:get():to_hex();
            local _ = v50.misc_other.event_logs.miss_color:get():to_hex();
            if l_state_1 == "backtrack failure" then
                l_state_1 = "lagcomp failure";
            end;
            if l_state_1 == nil then
                if v50.misc_widgets.notify:get() then
                    v133({
                        [1] = {
                            [1] = "hit "
                        }, 
                        [2] = {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v278
                        }, 
                        [3] = {
                            [1] = "'s "
                        }, 
                        [4] = {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v272
                        }, 
                        [5] = {
                            [1] = " for "
                        }, 
                        [6] = {
                            [1] = nil, 
                            [2] = true, 
                            [1] = l_damage_1 .. " "
                        }, 
                        [7] = {
                            [1] = "damage"
                        }
                    }, v50.misc_widgets.notify.hit_color:get());
                end;
            elseif v50.misc_widgets.notify:get() then
                v133({
                    [1] = {
                        [1] = "missed "
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = true, 
                        [1] = v278
                    }, 
                    [3] = {
                        [1] = "'s "
                    }, 
                    [4] = {
                        [1] = nil, 
                        [2] = true, 
                        [1] = v273 .. " "
                    }, 
                    [5] = {
                        [1] = "due to "
                    }, 
                    [6] = {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_state_1
                    }
                }, v50.misc_widgets.notify.miss_color:get());
            end;
            return;
        end;
    end;
end;
v137 = function(v283)
    -- upvalues: v50 (ref)
    if not v50.misc_other.event_logs:get("aimbot") then
        return;
    else
        local v284 = {
            hegrenade = "naded", 
            knife = "knifed", 
            inferno = "burned"
        };
        local v285 = entity.get_local_player();
        local v286 = entity.get(v283.userid, true);
        local v287 = entity.get(v283.attacker, true);
        local _ = entity.get(v283.target);
        if v285 == v286 or v285 ~= v287 then
            return;
        else
            local _ = v285:get_player_weapon();
            local v290 = v284[v283.weapon];
            if v290 == nil then
                return;
            else
                local v291 = v286:get_name();
                local v292 = string.lower(v291);
                local _ = v283.health;
                local _ = v283.dmg_health;
                local v295 = v50.misc_other.event_logs.hit_color:get():to_hex();
                if v285 == v287 then
                    local v296 = string.format("\aDEFAULT[\a%shelios\aDEFAULT] \a%s%s\aDEFAULT \aDEFAULT%s\aDEFAULT for \a%s%d\aDEFAULT damage ( \a%s%d\aDEFAULT health remaining )", v295, v295, v290, v292, v295, v283.dmg_health, v295, v283.health);
                    print_dev(v296);
                    print_raw(v296);
                end;
                return;
            end;
        end;
    end;
end;
v138 = function(v297)
    -- upvalues: v50 (ref), v133 (ref)
    if not v50.misc_widgets.notify:get() then
        return;
    else
        local v298 = {
            hegrenade = "naded", 
            knife = "knifed", 
            inferno = "burned"
        };
        local v299 = entity.get_local_player();
        local v300 = entity.get(v297.userid, true);
        local v301 = entity.get(v297.attacker, true);
        local _ = entity.get(v297.target);
        if v299 == v300 or v299 ~= v301 then
            return;
        else
            local _ = v299:get_player_weapon();
            local v304 = v298[v297.weapon];
            if v304 == nil then
                return;
            else
                local v305 = v300:get_name();
                local v306 = string.lower(v305);
                local _ = v297.health;
                local _ = v297.dmg_health;
                if v299 == v301 and v50.misc_widgets.notify:get() then
                    v133({
                        [1] = {
                            [1] = v304 .. " "
                        }, 
                        [2] = {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v306
                        }, 
                        [3] = {
                            [1] = " for "
                        }, 
                        [4] = {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v297.dmg_health .. " "
                        }, 
                        [5] = {
                            [1] = "damage"
                        }
                    }, v50.misc_widgets.notify.hit_color:get());
                end;
                return;
            end;
        end;
    end;
end;
v139 = function(v309)
    -- upvalues: v50 (ref)
    if not v50.misc_other.event_logs:get("purchase") then
        return;
    else
        local v310 = entity.get(v309.userid, true);
        if v310 == nil or not v310:is_enemy() then
            return;
        else
            local l_weapon_0 = v309.weapon;
            if l_weapon_0 == "weapon_unknown" then
                return;
            else
                local v312 = v310:get_name();
                local v313 = v50.misc_other.accent_color:get():to_hex();
                local v314 = string.format("\aDEFAULT[\a%shelios\aDEFAULT] \a%s%s\aDEFAULT bought \a%s%s", v313, v313, v312, v313, l_weapon_0);
                print_dev(v314);
                print_raw(v314);
                return;
            end;
        end;
    end;
end;
v140 = nil;
v141 = 9.25925925925926E-4;
v142 = v2.smoothy.new(0);
v146 = 0;
v148 = 0;
v153 = color();
v160 = false;
v168 = false;
local v315 = false;
local v316 = false;
local function v318(v317)
    -- upvalues: v27 (ref)
    v27.visuals.scope_overlay:override(v317 and "Remove All" or nil);
end;
do
    local l_v141_1, l_v142_1, l_v146_1, l_v148_1, l_v153_1, l_v160_1, l_v168_1, l_v315_0, l_v316_0, l_v318_0 = v141, v142, v146, v148, v153, v160, v168, v315, v316, v318;
    local function v329()
        -- upvalues: l_v318_0 (ref)
        l_v318_0(false);
    end;
    local function v348()
        -- upvalues: l_v142_1 (ref), l_v148_1 (ref), l_v141_1 (ref), l_v146_1 (ref), l_v153_1 (ref), l_v315_0 (ref), l_v316_0 (ref), l_v160_1 (ref), l_v168_1 (ref)
        local v330 = entity.get_local_player();
        if v330 == nil or not v330:is_alive() then
            return;
        else
            local l_m_bIsScoped_0 = v330.m_bIsScoped;
            local v332 = l_v142_1(0.05, l_m_bIsScoped_0);
            if v332 == 0 then
                return;
            else
                local v333 = render.screen_size();
                local v334 = v333 * 0.5;
                local v335 = l_v148_1 * v333.y * l_v141_1;
                local v336 = l_v146_1 * v333.y * l_v141_1;
                v335 = math.floor(v335);
                v336 = math.floor(v336);
                local v337 = v336 - v335;
                local v338 = l_v153_1:clone();
                local v339 = l_v153_1:clone();
                v338.a = v338.a * v332;
                v339.a = 0;
                if not l_v315_0 then
                    local v340 = vector(v334.x, v334.y - v335 + 1);
                    local v341 = vector(v340.x + 1, v334.y - v336);
                    render.gradient(v340, v341, v338, v338, v339, v339);
                end;
                if not l_v316_0 then
                    local v342 = vector(v334.x, v334.y + v335);
                    local v343 = vector(v342.x + 1, v334.y + v336);
                    render.gradient(v342, v343, v338, v338, v339, v339);
                end;
                if not l_v160_1 then
                    local v344 = vector(v334.x - v335 + 1, v334.y);
                    local v345 = vector(v344.x - v337, v334.y + 1);
                    render.gradient(v344, v345, v338, v339, v338, v339);
                end;
                if not l_v168_1 then
                    local v346 = vector(v334.x + v335, v334.y);
                    local v347 = vector(v346.x + v337, v334.y + 1);
                    render.gradient(v346, v347, v338, v339, v338, v339);
                end;
                return;
            end;
        end;
    end;
    v50.misc_visual.custom_scope.size:set_callback(function(v349)
        -- upvalues: l_v146_1 (ref)
        l_v146_1 = v349:get();
    end, true);
    v50.misc_visual.custom_scope.gap:set_callback(function(v350)
        -- upvalues: l_v148_1 (ref)
        l_v148_1 = v350:get();
    end, true);
    v50.misc_visual.custom_scope.color:set_callback(function(v351)
        -- upvalues: l_v153_1 (ref)
        l_v153_1 = v351:get();
    end, true);
    v50.misc_visual.custom_scope.exclude:set_callback(function(v352)
        -- upvalues: l_v160_1 (ref), l_v168_1 (ref), l_v315_0 (ref), l_v316_0 (ref)
        l_v160_1 = v352:get("Left");
        l_v168_1 = v352:get("Right");
        l_v315_0 = v352:get("Top");
        l_v316_0 = v352:get("Bottom");
    end, true);
    v50.misc_visual.custom_scope:set_callback(function(v353)
        -- upvalues: l_v318_0 (ref), v348 (ref), v329 (ref)
        local v354 = v353:get();
        l_v318_0(v354);
        events.render(v348, v354);
        events.shutdown(v329, v354);
    end, true);
end;
v141 = {
    update = function()
        -- upvalues: v50 (ref), v4 (ref), v10 (ref)
        if not v50.misc_visual.viewmodel_changer:get() then
            cvar.viewmodel_fov:int(v4(cvar.viewmodel_fov), true);
            cvar.viewmodel_offset_x:float(v4(cvar.viewmodel_offset_x), true);
            cvar.viewmodel_offset_y:float(v4(cvar.viewmodel_offset_y), true);
            cvar.viewmodel_offset_z:float(v4(cvar.viewmodel_offset_z), true);
            return;
        elseif not entity.get_local_player() then
            return;
        else
            viewmodel_fov_interpolated = v10.new("viewmodel_fov_interpolated", v50.misc_visual.viewmodel_changer.fov:get(), 0.06);
            viewmodel_x_interpolated = v10.new("viewmodel_x_interpolated", v50.misc_visual.viewmodel_changer.offset_x:get(), 0.06);
            viewmodel_y_interpolated = v10.new("viewmodel_y_interpolated", v50.misc_visual.viewmodel_changer.offset_y:get(), 0.06);
            viewmodel_z_interpolated = v10.new("viewmodel_z_interpolated", v50.misc_visual.viewmodel_changer.offset_z:get(), 0.06);
            cvar.viewmodel_fov:int(viewmodel_fov_interpolated, true);
            cvar.viewmodel_offset_x:float(viewmodel_x_interpolated, true);
            cvar.viewmodel_offset_y:float(viewmodel_y_interpolated, true);
            cvar.viewmodel_offset_z:float(viewmodel_z_interpolated, true);
            return;
        end;
    end
};
v142 = {
    update = function()
        -- upvalues: v50 (ref), v31 (ref), v10 (ref)
        if v50.misc_visual.aspect_ratio:get() then
            local v355 = v31.value:get() / 100;
            local v356 = v10.new("aspect_ratio_interpolated", v355, 0.09);
            cvar.r_aspectratio:float(v356);
        else
            cvar.r_aspectratio:int(0, true);
        end;
    end
};
v146 = function()
    -- upvalues: v50 (ref), v10 (ref), v2 (ref), v27 (ref)
    if not v50.misc_visual.crosshair_ind:get() then
        return;
    else
        local v357 = render.screen_size();
        local v358 = v357.x / 2;
        local v359 = v357.y / 2;
        local v360 = entity.get_local_player();
        if not v360 or not v360:is_alive() then
            return;
        else
            local l_m_bIsScoped_1 = v360.m_bIsScoped;
            local v362 = v50.misc_visual.crosshair_ind.color1:get();
            local v363 = v50.misc_visual.crosshair_ind.color2:get();
            local v364 = v50.misc_visual.crosshair_ind.color3:get();
            local v365 = 10;
            local v366 = l_m_bIsScoped_1 and v358 + 50 or v358;
            local v367 = v10.new("scope_anim_x", v366);
            local v368 = vector(v367, v359);
            local v369 = color(v362.r, v362.g, v362.b, 255);
            local v370 = color(v363.r, v363.g, v363.b, 255);
            local v371 = v2.gradient.text_animate("\226\155\167helios.system\226\155\167", -1, {
                [1] = v369, 
                [2] = v370
            });
            v371:animate();
            local v372 = v2.gradient.text_animate("\226\155\167\194\176\239\189\161\226\139\134\224\188\186\226\153\177\224\188\187\226\139\134\239\189\161\194\176\226\155\167", -1, {
                [1] = v369, 
                [2] = v370
            });
            v372:animate();
            if v50.misc_visual.crosshair_ind.additions:get("glow") then
                render.shadow(vector(v368.x - 21, v359 + 20), vector(v368.x + 20, v359 + 20), v362, 30, 0, 0);
            end;
            if not v50.misc_visual.crosshair_ind.additions:get("gradient") then
                render.text(5, vector(v368.x, v359 + 10), v362, "c", "\226\155\167\194\176\239\189\161\226\139\134\224\188\186\226\153\177\224\188\187\226\139\134\239\189\161\194\176\226\155\167");
                render.text(5, vector(v368.x, v359 + 20), v362, "c", "\226\155\167helios.system\226\155\167");
            else
                render.text(5, vector(v368.x, v359 + 10), color(), "c", v372:get_animated_text());
                render.text(5, vector(v368.x, v359 + 20), color(), "c", v371:get_animated_text());
            end;
            render.text(5, vector(v368.x, v359 + 20 + v365), color(255, 255, 255, 255), "c", " \226\153\177 " .. string.lower(player_state(cmd)) .. "\226\153\177");
            v365 = v365 + 10;
            if v27.rage.double_tap:get() then
                render.text(5, vector(v368.x, v359 + 20 + v365), color(v364.r, rage.exploit:get() * v364.g, rage.exploit:get() * v364.b, 255), "c", "\226\153\177dt\226\153\177");
                v365 = v365 + 10;
            end;
            if v27.rage.hide_shots:get() then
                render.text(5, vector(v368.x, v359 + 20 + v365), color(v364.r, rage.exploit:get() * v364.g, rage.exploit:get() * v364.b, 255), "c", "\226\153\177osaa\226\153\177");
                v365 = v365 + 10;
            end;
            if v27.rage.da:get() or v50.misc_rage.dormant_aimbot.enable:get() then
                render.text(5, vector(v368.x, v359 + 20 + v365), v364, "c", "\226\153\177da\226\153\177");
                v365 = v365 + 10;
            end;
            if v27.rage.force_body:get() == "Force" then
                render.text(5, vector(v368.x, v359 + 20 + v365), v364, "c", "\226\153\177baim\226\153\177");
                v365 = v365 + 10;
            end;
            if v27.rage.safe_point:get() == "Force" then
                render.text(5, vector(v368.x, v359 + 20 + v365), v364, "c", "\226\153\177sp\226\153\177");
                v365 = v365 + 10;
            end;
            if v27.rage.peek_assist:get() then
                render.text(5, vector(v368.x, v359 + 20 + v365), v364, "c", "\226\153\177peek\226\153\177");
                v365 = v365 + 10;
            end;
            return;
        end;
    end;
end;
v148 = function(v373, v374)
    -- upvalues: v50 (ref)
    local v375 = render.screen_size();
    local v376 = v50.misc_widgets.watermark.position:get();
    local v377 = 0;
    local v378 = 0;
    if v376 == "bottom" then
        v377 = (v375.x - v373) / 2;
        v378 = v375.y - v374 - 5;
    elseif v376 == "left" then
        v377 = 10;
        v378 = v375.y / 2;
    elseif v376 == "right" then
        v377 = v375.x - v373 - 5;
        v378 = v375.y / 2;
    end;
    return vector(v377, v378);
end;
v153 = function()
    -- upvalues: v50 (ref), v2 (ref), v148 (ref)
    if not globals.is_connected or not globals.is_in_game then
        return;
    else
        if v50.misc_widgets.watermark.style:get() == "default" then
            local v379 = "H E L I O S";
            local v380 = v2.gradient.text_animate(v379, -1.5, {
                v50.misc_widgets.watermark.firstcol:get(), 
                v50.misc_widgets.watermark.secondcol:get()
            });
            v380:animate();
            local v381 = render.measure_text(1, nil, v379);
            local v382 = v148(v381.x, v381.y);
            render.text(1, v382 - vector(1, 0), color(0, 0, 0), nil, v379);
            render.text(1, v382 - vector(0, 1), color(0, 0, 0), nil, v379);
            render.text(1, v382, color(255, 255, 255), nil, v380:get_animated_text());
        else
            local v383 = entity.get_local_player();
            if not v383 then
                return;
            else
                local v384 = v383:get_steam_avatar();
                local l_x_3 = render.screen_size().x;
                local l_y_1 = render.screen_size().y;
                local v387 = render.measure_text(verdana, "ad", "", string.lower(user_name), " | ", string.lower(branch));
                render.gradient(vector(l_x_3 / 2 - l_x_3 / 2.01, l_y_1 / 2), vector(l_x_3 / 2 - l_x_3 / 2.01 + 150, l_y_1 / 2 + 30), v50.misc_widgets.watermark.firstcol:get(), color(0, 0, 0, 0), v50.misc_widgets.watermark.secondcol:get(), color(0, 0, 0, 0));
                render.text(verdana, vector(l_x_3 / 2 - l_x_3 / 2 + 15, l_y_1 / 2 + 4), color(255, 255, 255, 255), "", "helios.system");
                render.text(verdana, vector(l_x_3 / 2 - l_x_3 / 2 + 15, l_y_1 / 2 + 16), color(255, 255, 255, 255), "", string.lower(user_name), " | ", string.lower(branch));
                if v387.x > 104 then
                    render.texture(v384, vector(l_x_3 / 128 + v387.x, l_y_1 / 2 + 2), vector(26, 26), 25);
                else
                    render.texture(v384, vector(l_x_3 / 2 - l_x_3 / 2.01 + 105, l_y_1 / 2 + 2), vector(26, 26), 25);
                end;
            end;
        end;
        return;
    end;
end;
v160 = {
    lookup = {}
};
v160.update = function()
    -- upvalues: v160 (ref)
    local v388 = ui.get_binds();
    for v389 in pairs(v160.lookup) do
        v160.lookup[v389] = nil;
    end;
    for v390 = 1, #v388 do
        local v391 = v388[v390];
        local v392 = v391.reference:id();
        v160.lookup[v392] = v391;
    end;
end;
v160.get = function(v393)
    -- upvalues: v160 (ref)
    if v393 == nil then
        return nil;
    else
        return v160.lookup[v393:id()];
    end;
end;
v168 = {};
v315 = 2;
v316 = 4;
do
    local l_v315_1, l_v316_1 = v315, v316;
    v168.render = function()
        -- upvalues: v50 (ref), v160 (ref), v27 (ref), v10 (ref), l_v315_1 (ref), l_v316_1 (ref)
        if not v50.misc_visual.damage_indicator:get() then
            return;
        else
            local v396 = entity.get_local_player();
            if not v396 or not v396:is_alive() then
                return;
            else
                local v397 = v50.misc_visual.damage_indicator.color:get();
                local v398 = v160.get(v27.rage.min_damage);
                if v398 == nil or not v398.active then
                    v397.a = v397.a * 0.5;
                end;
                local v399 = (render.screen_size() / 2):clone();
                local v400 = v27.rage.min_damage:get();
                local v401 = v10.new("damage_interpolated", v400, 0.15, nil, 0.5);
                if not v50.misc_visual.damage_indicator.animation:get() then
                    v401 = v400;
                end;
                local v402 = (function()
                    -- upvalues: v401 (ref)
                    if v401 == 0 then
                        return "auto";
                    elseif v401 > 100 then
                        return "+" .. tostring(math.floor(v401 - 100));
                    else
                        return tostring(math.floor(v401));
                    end;
                end)();
                local v403 = "";
                local v404 = render.measure_text(l_v315_1, v403, v402);
                v399.x = v399.x + l_v316_1 + 2;
                v399.y = v399.y - l_v316_1 - v404.y;
                render.text(l_v315_1, v399, v397, v403, v402);
                return;
            end;
        end;
    end;
end;
v315 = {
    get = function()
        local v405 = entity.get_local_player();
        if v405 == nil then
            return;
        else
            local v406 = entity.get_entities("CSmokeGrenadeProjectile");
            local v407 = entity.get_entities("CInferno");
            local v408 = cvar.mp_friendlyfire:int() == 0;
            local v409 = {};
            local v410 = {};
            local l_tickcount_2 = globals.tickcount;
            local l_tickinterval_0 = globals.tickinterval;
            if v406 ~= nil then
                for v413, v414 in pairs(v406) do
                    if v409[v413] == nil then
                        v409[v413] = {};
                        v409[v413].position = vector(0, 0, 0);
                        v409[v413].alpha = 0;
                        v409[v413].draw = false;
                    end;
                    v409[v413].position = v414:get_origin();
                    v409[v413].alpha = v414:get_bbox().alpha * 255;
                    if v414.m_bDidSmokeEffect and v414:get_bbox().alpha > 0 then
                        v409[v413].draw = true;
                    end;
                end;
            end;
            if v407 ~= nil then
                for v415, v416 in pairs(v407) do
                    if v410[v415] == nil then
                        v410[v415] = {};
                        v410[v415].position = vector(0, 0, 0);
                        v410[v415].alpha = 0;
                        v410[v415].draw = false;
                        v410[v415].teammate = false;
                    end;
                    local v417 = (7.125 - l_tickinterval_0 * (l_tickcount_2 - v416.m_nFireEffectTickBegin)) / 7.125;
                    v410[v415].position = v416:get_origin();
                    v410[v415].alpha = v417 * 255;
                    local l_m_hOwnerEntity_0 = v416.m_hOwnerEntity;
                    if l_m_hOwnerEntity_0 ~= nil and v408 and l_m_hOwnerEntity_0 ~= v405 and not l_m_hOwnerEntity_0:is_enemy() then
                        v410[v415].teammate = true;
                    end;
                    local v419 = {};
                    local v420 = 100;
                    for v421 = 1, 64 do
                        if v416.m_bFireIsBurning[v421] then
                            table.insert(v419, {
                                [1] = v416.m_fireXDelta[v421], 
                                [2] = v416.m_fireYDelta[v421], 
                                [3] = v416.m_fireZDelta[v421]
                            });
                        end;
                    end;
                    for v422 = 1, #v419 do
                        local v423 = v419[v422];
                        local v424, v425, _ = unpack(v423);
                        for v427 = 1, #v419 do
                            local v428 = v419[v427];
                            local v429 = vector(v424, v425):dist(vector(v428[1], v428[2]));
                            if v420 < v429 then
                                v420 = v429;
                            end;
                        end;
                    end;
                    if v417 > 0 then
                        v410[v415].draw = true;
                        v410[v415].radius = v420 / 2 + 40;
                    end;
                end;
            end;
            return {
                smoke = v409, 
                molotov = v410
            };
        end;
    end
};
v315.render = function()
    -- upvalues: v50 (ref), v315 (ref), v10 (ref)
    if entity.get_local_player() == nil then
        return;
    elseif not v50.misc_visual.grenade_radius:get() then
        return;
    else
        local v430 = v315.get();
        if v430 == nil then
            return;
        else
            local v431 = v50.misc_visual.grenade_radius.molotov_color:get();
            local v432 = v50.misc_visual.grenade_radius.smoke_color:get();
            local _ = v431.a / 255;
            if v50.misc_visual.grenade_radius.mode:get("molotov") then
                for v434 = 1, #v430.molotov do
                    local v435 = v430.molotov[v434];
                    local v436 = {
                        [v434] = v10.new("molotov_radius" .. v434, v435.draw and v435.radius or 0, 0.095)
                    };
                    if v435.draw then
                        render.circle_3d_outline(v435.position, v431, v436[v434], 0, 1, 1.5);
                    end;
                end;
            end;
            if v50.misc_visual.grenade_radius.mode:get("smoke") then
                for v437 = 1, #v430.smoke do
                    local v438 = v430.smoke[v437];
                    local v439 = {
                        [v437] = v10.new("smoke_radius" .. v437, v438.draw and 135 or 0, 0.095)
                    };
                    if v438.draw then
                        render.circle_3d_outline(v438.position, v432, v439[v437], 0, 1, 1.5);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v316 = {};
v318 = cvar.sv_gravity;
local l_sv_jump_impulse_0 = cvar.sv_jump_impulse;
local v441 = {};
local v442 = {};
local v443 = {};
local function v451(v444)
    local l_m_iObserverMode_0 = v444.m_iObserverMode;
    if l_m_iObserverMode_0 == 0 or l_m_iObserverMode_0 == 1 or l_m_iObserverMode_0 == 2 or l_m_iObserverMode_0 == 6 then
        return entity.get_players(true, true);
    else
        local v446 = {};
        if l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5 then
            local v447 = entity.get_player(false, true);
            local l_m_iTeamNum_0 = v444.m_hObserverTarget.m_iTeamNum;
            for v449 = 1, #v447 do
                local v450 = v447[v449];
                if v450 ~= v444 and v450.m_iTeamNum ~= l_m_iTeamNum_0 then
                    table.insert(v446, v450);
                end;
            end;
        end;
        return v446;
    end;
end;
do
    local l_v318_1, l_l_sv_jump_impulse_0_0, l_v441_0, l_v442_0, l_v443_0, l_v451_0 = v318, l_sv_jump_impulse_0, v441, v442, v443, v451;
    local function v469(v458, v459, v460)
        -- upvalues: l_v318_1 (ref), l_l_sv_jump_impulse_0_0 (ref)
        local l_tickinterval_1 = globals.tickinterval;
        local v462 = l_v318_1:float() * l_tickinterval_1;
        local v463 = l_l_sv_jump_impulse_0_0:float() * l_tickinterval_1;
        local l_v459_0 = v459;
        local l_v459_1 = v459;
        local l_m_vecVelocity_0 = v458.m_vecVelocity;
        local v467 = l_m_vecVelocity_0.z > 0 and -v462 or v463;
        for _ = 1, v460 do
            l_v459_1 = l_v459_0;
            l_v459_0 = vector(l_v459_0.x + l_m_vecVelocity_0.x * l_tickinterval_1, l_v459_0.y + l_m_vecVelocity_0.y * l_tickinterval_1, l_v459_0.z + (l_m_vecVelocity_0.z + v467) * l_tickinterval_1);
            if utils.trace_line(l_v459_1, l_v459_0).fraction <= 0.99 then
                return l_v459_1;
            end;
        end;
        return l_v459_0;
    end;
    v316.net_update_end = function()
        -- upvalues: v50 (ref), l_v441_0 (ref), l_v442_0 (ref), l_v443_0 (ref), v469 (ref)
        if not v50.misc_visual.lc_box:get() then
            return;
        elseif not entity.get_local_player() then
            return;
        else
            local v470 = entity.get_players(true, true);
            for v471 = 1, #v470 do
                local v472 = v470[v471];
                local v473 = v472:get_index();
                local v474 = l_v441_0[v473];
                if v472:is_dormant() or not v472:is_alive() then
                    l_v441_0[v473] = nil;
                    l_v442_0[v473] = nil;
                    l_v443_0[v473] = nil;
                else
                    local v475 = v472:get_origin();
                    local v476 = to_ticks(v472:get_simulation_time().current);
                    if v474 ~= nil then
                        local v477 = v476 - v474.tick;
                        if v477 < 0 or v477 > 0 and v477 <= 64 then
                            local v478 = (v475 - v474.origin):length2dsqr();
                            local v479 = v469(v472, v475, v477 - 1);
                            if v477 < 0 then
                                l_v443_0[v473] = 1;
                            end;
                            l_v442_0[v473] = {
                                tick = v477 - 1, 
                                origin = v475, 
                                predicted_origin = v479, 
                                tickbase = v477 < 0, 
                                lagcomp = v478 > 4096
                            };
                        end;
                    end;
                    if l_v443_0[v473] == nil then
                        l_v443_0[v473] = 0;
                    end;
                    l_v441_0[v473] = {
                        tick = v476, 
                        origin = v475
                    };
                end;
            end;
            return;
        end;
    end;
    v316.render = function()
        -- upvalues: v50 (ref), l_v451_0 (ref), l_v442_0 (ref), l_v443_0 (ref)
        if not v50.misc_visual.lc_box:get() then
            return;
        else
            local v480 = entity.get_local_player();
            if not v480 or not v480:is_alive() then
                return;
            else
                local v481 = color(47, 117, 221, 255);
                local v482 = color(255, 45, 45, 255);
                if #l_v451_0(v480) == 0 then
                    return;
                else
                    for v483, v484 in pairs(l_v442_0) do
                        local v485 = entity.get(v483);
                        if v485 and v485:is_alive() and v485:is_enemy() and l_v442_0 ~= nil then
                            if v484.lagcomp then
                                local l_predicted_origin_0 = v484.predicted_origin;
                                local v487 = l_predicted_origin_0 + v485.m_vecMins;
                                local v488 = l_predicted_origin_0 + v485.m_vecMaxs;
                                local v489 = {
                                    vector(v487.x, v487.y, v487.z), 
                                    vector(v487.x, v488.y, v487.z), 
                                    vector(v488.x, v488.y, v487.z), 
                                    vector(v488.x, v487.y, v487.z), 
                                    vector(v487.x, v487.y, v488.z), 
                                    vector(v487.x, v488.y, v488.z), 
                                    vector(v488.x, v488.y, v488.z), 
                                    vector(v488.x, v487.y, v488.z)
                                };
                                local v490 = {
                                    [1] = {
                                        [1] = 0, 
                                        [2] = 1
                                    }, 
                                    [2] = {
                                        [1] = 1, 
                                        [2] = 2
                                    }, 
                                    [3] = {
                                        [1] = 2, 
                                        [2] = 3
                                    }, 
                                    [4] = {
                                        [1] = 3, 
                                        [2] = 0
                                    }, 
                                    [5] = {
                                        [1] = 5, 
                                        [2] = 6
                                    }, 
                                    [6] = {
                                        [1] = 6, 
                                        [2] = 7
                                    }, 
                                    [7] = {
                                        [1] = 1, 
                                        [2] = 4
                                    }, 
                                    [8] = {
                                        [1] = 4, 
                                        [2] = 8
                                    }, 
                                    [9] = {
                                        [1] = 0, 
                                        [2] = 4
                                    }, 
                                    [10] = {
                                        [1] = 1, 
                                        [2] = 5
                                    }, 
                                    [11] = {
                                        [1] = 2, 
                                        [2] = 6
                                    }, 
                                    [12] = {
                                        [1] = 3, 
                                        [2] = 7
                                    }, 
                                    [13] = {
                                        [1] = 5, 
                                        [2] = 8
                                    }, 
                                    [14] = {
                                        [1] = 7, 
                                        [2] = 8
                                    }, 
                                    [15] = {
                                        [1] = 3, 
                                        [2] = 4
                                    }
                                };
                                for v491 = 1, #v490 do
                                    if v491 == 1 then
                                        local v492 = v485:get_origin();
                                        local v493 = render.world_to_screen(v487);
                                        local v494 = render.world_to_screen(v492);
                                        if v494 ~= nil and v493 ~= nil then
                                            render.line(v493, v494, v481);
                                        end;
                                    end;
                                    local v495 = v489[v490[v491][1]];
                                    local v496 = v489[v490[v491][2]];
                                    if v495 ~= nil and v496 ~= nil then
                                        local v497 = render.world_to_screen(v495);
                                        local v498 = render.world_to_screen(v496);
                                        if v497 ~= nil and v498 ~= nil then
                                            render.line(v497, v498, v481);
                                        end;
                                    end;
                                end;
                            end;
                            local v499 = {
                                [0] = "", 
                                [1] = "LAG COMP BREAKER", 
                                [2] = "SHIFTING TICKBASE"
                            };
                            local v500 = v485:get_bbox();
                            local v501 = 0;
                            if l_v443_0[v483] > 0 then
                                l_v443_0[v483] = l_v443_0[v483] - globals.frametime * 2;
                                l_v443_0[v483] = l_v443_0[v483] < 0 and 0 or l_v443_0[v483];
                                v501 = l_v443_0[v483];
                            end;
                            local v502 = v484.tickbase or l_v443_0[v483] and l_v443_0[v483] > 0;
                            local l_lagcomp_0 = v484.lagcomp;
                            if not v502 or v484.lagcomp then
                                v501 = v500.alpha;
                            end;
                            if v500 and v500.pos1 and v500.pos2 and v500.alpha > 0 then
                                local v504 = v485:get_name();
                                local v505 = v500.pos2.x - v500.pos1.x;
                                local v506 = vector(v500.pos1.x + v505 / 2, v500.pos1.y - 18);
                                if v504 == "" then
                                    v506.y = v506.y - 8;
                                end;
                                v482.a = v482.a * v501;
                                render.text(1, v506, v482, "c", v499[v502 and 2 or l_lagcomp_0 and 1 or 0]);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v318 = false;
l_sv_jump_impulse_0 = {};
v441 = function()
    -- upvalues: v50 (ref)
    local v507 = entity.get_local_player();
    if not v507 or not v507:is_alive() or not v50.misc_main.fast_ladder:get() or v507.m_MoveType ~= 9 then
        return false;
    else
        local v508 = v507:get_player_weapon();
        if not v508 or v508.m_fThrowTime and v508.m_fThrowTime > 0 then
            return false;
        else
            return true;
        end;
    end;
end;
do
    local l_v441_1 = v441;
    l_sv_jump_impulse_0.update = function(v510)
        -- upvalues: l_v441_1 (ref), v50 (ref), v318 (ref)
        if not l_v441_1() then
            return;
        else
            local _ = entity.get_local_player();
            if v510.forwardmove > 0 and v50.misc_main.fast_ladder.fast_ladder_select:get(1) then
                if v510.view_angles.x < 45 then
                    v510.view_angles.x = 89;
                    v318 = true;
                    v510.in_moveright = 1;
                    v510.in_moveleft = 0;
                    v510.in_forward = 0;
                    v510.in_back = 1;
                    if v510.sidemove == 0 then
                        v510.view_angles.y = v510.view_angles.y + 90;
                    end;
                    if v510.sidemove < 0 then
                        v510.view_angles.y = v510.view_angles.y + 150;
                    end;
                    if v510.sidemove > 0 then
                        v510.view_angles.y = v510.view_angles.y + 30;
                    end;
                end;
            elseif v510.forwardmove < 0 and v50.misc_main.fast_ladder.fast_ladder_select:get(2) then
                v510.view_angles.x = 89;
                v318 = true;
                v510.in_moveleft = 1;
                v510.in_moveright = 0;
                v510.in_forward = 1;
                v510.in_back = 0;
                if v510.sidemove == 0 then
                    v510.view_angles.y = v510.view_angles.y + 90;
                end;
                if v510.sidemove > 0 then
                    v510.view_angles.y = v510.view_angles.y + 150;
                end;
                if v510.sidemove < 0 then
                    v510.view_angles.y = v510.view_angles.y + 30;
                end;
            else
                v318 = false;
            end;
            return;
        end;
    end;
end;
v441 = {};
v442 = false;
v443 = math.pi * 2;
v451 = v443 / 8;
do
    local l_v442_1, l_v443_1, l_v451_1 = v442, v443, v451;
    local function v525(v515, v516)
        -- upvalues: l_v443_1 (ref), l_v451_1 (ref)
        local v517 = v515:get_origin();
        for v518 = 0, l_v443_1, l_v451_1 do
            local v519 = math.sin(v518);
            local v520 = math.cos(v518);
            local v521 = v517.x + v520 * 10;
            local v522 = v517.y + v519 * 10;
            local v523 = vector(v521, v522, v517.z);
            local v524 = v523:clone();
            v524.z = v524.z - v516;
            if utils.trace_line(v523, v524, v515).fraction ~= 1 then
                return true;
            end;
        end;
        return false;
    end;
    v441.on_createmove = function(v526)
        -- upvalues: v50 (ref), l_v442_1 (ref), v525 (ref)
        if not v50.misc_main.no_fall_damage:get() then
            return false;
        else
            local v527 = entity.get_local_player();
            if v527 == nil then
                return;
            elseif v527.m_vecVelocity.z >= -500 then
                l_v442_1 = false;
                return;
            else
                if v525(v527, 15) then
                    l_v442_1 = false;
                elseif v525(v527, 75) then
                    l_v442_1 = true;
                end;
                v526.in_duck = l_v442_1;
                return;
            end;
        end;
    end;
end;
v442 = function(v528)
    -- upvalues: v50 (ref), v27 (ref)
    if not v50.misc_main.fake_duck_speed:get() then
        return;
    elseif not v27.miscAa.fake_duck:get() then
        return;
    else
        local v529 = entity.get_local_player();
        if not v529 or not v529:is_alive() then
            return;
        else
            local v530 = 5;
            local l_forwardmove_0 = v528.forwardmove;
            local l_sidemove_0 = v528.sidemove;
            if v530 < math.abs(l_forwardmove_0) or v530 < math.abs(l_sidemove_0) then
                local v533 = 150 / (l_forwardmove_0 * l_forwardmove_0 + l_sidemove_0 * l_sidemove_0) ^ 0.5;
                v528.forwardmove = l_forwardmove_0 * v533;
                v528.sidemove = l_sidemove_0 * v533;
            end;
            return;
        end;
    end;
end;
v443 = nil;
v451 = 0.3;
local function v537(v534, v535, v536)
    return v534 + v536 * (v535 - v534);
end;
do
    local l_v451_2, l_v537_0 = v451, v537;
    local function v551(v540, v541, v542, v543)
        -- upvalues: l_v537_0 (ref), l_v451_2 (ref)
        v540.x = v540.x - 10 + math.abs(v540.x) / 9;
        local v544 = vector():angles(v540);
        local v545 = v543 * 1.25;
        local v546 = math.clamp(v541 * 0.9, 15, 750);
        local v547 = math.clamp(v542, 0, 1);
        v546 = v546 * l_v537_0(l_v451_2, 1, v547);
        local l_v544_0 = v544;
        for _ = 1, 8 do
            l_v544_0 = (v544 * (l_v544_0 * v546 + v545):length() - v545) / v546;
            l_v544_0:normalize();
        end;
        local v550 = l_v544_0.angles(l_v544_0);
        if v550.x > -10 then
            v550.x = 0.9 * v550.x + 9;
        else
            v550.x = 1.125 * v550.x + 11.25;
        end;
        return v550;
    end;
    on_grenade_override_view = function(v552)
        -- upvalues: v50 (ref), v551 (ref)
        if not v50.misc_main.super_toss:get() then
            return false;
        else
            local v553 = entity.get_local_player():get_player_weapon();
            if v553 == nil then
                return;
            else
                local v554 = v553:get_weapon_info();
                if v554 == nil then
                    return;
                else
                    v552.angles = v551(v552.angles, v554.throw_velocity, v553.m_flThrowStrength, v552.velocity);
                    return;
                end;
            end;
        end;
    end;
    local _ = vector();
    local _ = vector();
    super_toss_on_cm = function(v557)
        -- upvalues: v50 (ref), v551 (ref)
        if not v50.misc_main.super_toss:get() then
            return false;
        elseif v557.jitter_move ~= true then
            return;
        else
            local v558 = entity.get_local_player();
            local v559 = v558:get_player_weapon();
            if v559 == nil then
                return;
            else
                local v560 = v559:get_weapon_info();
                if v560 == nil or v560.weapon_type ~= 9 then
                    return;
                elseif v559.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                    return;
                else
                    v557.in_speed = true;
                    local v561 = v558:simulate_movement();
                    v561:think();
                    v557.view_angles = v551(v557.view_angles, v560.throw_velocity, v559.m_flThrowStrength, v561.velocity);
                    return;
                end;
            end;
        end;
    end;
end;
v451 = {
    semi_fix_lol = function(_)
        -- upvalues: v50 (ref), v27 (ref)
        local v563 = entity.get_local_player();
        if v563 == nil or not v563:is_alive() then
            return;
        else
            local v564 = v563:get_player_weapon();
            if v564 == nil then
                return;
            else
                local v565 = v564:get_weapon_info();
                if v565 == nil then
                    return;
                else
                    local l_weapon_type_2 = v565.weapon_type;
                    if v564 == nil then
                        return;
                    else
                        if v50.misc_main.throw_fix:get() then
                            if l_weapon_type_2 == 9 then
                                v27.misc.weapon_actions:override("");
                            else
                                v27.misc.weapon_actions:override();
                            end;
                        else
                            v27.misc.weapon_actions:override();
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    quickswitch = function(v567)
        -- upvalues: v50 (ref)
        if not v50.misc_main.throw_fix:get() then
            return;
        else
            local v568 = entity.get_local_player();
            if v568 == nil or not v568:is_alive() then
                return;
            else
                local v569 = entity.get(v567.userid, true);
                if not v569 then
                    return;
                elseif v569 ~= v568 then
                    return;
                else
                    utils.execute_after(globals.tickinterval, utils.console_exec, "slot3; slot2; slot1");
                    return;
                end;
            end;
        end;
    end
};
v537 = {};
local l_enable_0 = v27.aa.enable;
local l_nade_drop_0 = v50.misc_main.nade_drop;
local v572 = {};
local v573 = false;
local v574 = nil;
do
    local l_l_enable_0_0, l_l_nade_drop_0_0, l_v572_0, l_v573_0, l_v574_0 = l_enable_0, l_nade_drop_0, v572, v573, v574;
    local function v581(v580)
        -- upvalues: l_l_nade_drop_0_0 (ref)
        if not l_l_nade_drop_0_0:get() then
            return false;
        elseif v580 == "weapon_hegrenade" then
            return l_l_nade_drop_0_0.grenades:get("he");
        elseif v580 == "weapon_smokegrenade" then
            return l_l_nade_drop_0_0.grenades:get("smoke");
        elseif v580 == "weapon_incgrenade" or v580 == "weapon_molotov" then
            return l_l_nade_drop_0_0.grenades:get("molotov");
        else
            return false;
        end;
    end;
    local function v584(v582)
        -- upvalues: v581 (ref)
        local v583 = v582:get_weapon_info();
        if not v583 or v583.weapon_type ~= 9 then
            return false;
        elseif not v581(v583.console_name) then
            return false;
        else
            return true;
        end;
    end;
    local function v586()
        -- upvalues: l_v572_0 (ref)
        for v585 = 1, #l_v572_0 do
            l_v572_0[v585] = nil;
        end;
    end;
    local function v591(v587)
        -- upvalues: v584 (ref), l_v572_0 (ref)
        local v588 = v587:get_player_weapon(true);
        for v589 = 1, #v588 do
            local v590 = v588[v589];
            if v584(v590) then
                table.insert(l_v572_0, v590);
            end;
        end;
    end;
    v537.on_createmove = function(v592)
        -- upvalues: l_l_nade_drop_0_0 (ref), l_v574_0 (ref), l_v573_0 (ref), v586 (ref), v591 (ref), l_v572_0 (ref), l_l_enable_0_0 (ref)
        if not l_l_nade_drop_0_0:get() then
            return;
        else
            local v593 = entity.get_local_player();
            if not v593 then
                return;
            elseif not v593:get_player_weapon() then
                return;
            else
                local v594 = utils.net_channel();
                if not v594 then
                    return;
                else
                    local v595 = l_l_nade_drop_0_0.drop:get();
                    if l_v574_0 ~= v595 then
                        l_v574_0 = v595;
                        if v595 and not l_v573_0 then
                            v586();
                            v591(v593);
                            l_v573_0 = next(l_v572_0) ~= nil;
                        end;
                    end;
                    local v596 = v594.latency[1] + to_time(4);
                    for v597 = 1, #l_v572_0 do
                        local v598 = l_v572_0[v597];
                        do
                            if v598 ~= nil then
                                local v599 = v598:get_weapon_info();
                                if v599 ~= nil then
                                    local v600 = v597 == #l_v572_0;
                                    utils.execute_after(v596 * v597, function()
                                        -- upvalues: v599 (ref), v600 (ref), l_v573_0 (ref)
                                        utils.console_exec(string.format("use %s; drop", v599.console_name));
                                        if v600 then
                                            utils.execute_after(0.1, function()
                                                -- upvalues: l_v573_0 (ref)
                                                l_v573_0 = false;
                                            end);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                    end;
                    v586();
                    if l_v573_0 then
                        v592.no_choke = true;
                        v592.send_packet = true;
                        l_l_enable_0_0:override(false);
                    else
                        l_l_enable_0_0:override();
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
l_enable_0 = {
    on_cm = function()
        -- upvalues: v50 (ref), v27 (ref), v2 (ref)
        if not v50.misc_main.jumpscout:get() then
            return;
        elseif not v27.miscAa.auto_strafer:get() then
            return;
        else
            local v601 = entity.get_local_player();
            local v602 = v601:get_player_weapon();
            if v602 == nil then
                return;
            elseif v602:get_weapon_info() == nil then
                return;
            else
                local v603 = math.sqrt(v601.m_vecVelocity.x ^ 2 + v601.m_vecVelocity.y ^ 2);
                v27.miscAa.auto_strafer:override(v603 >= 15 and not (v2.csgo_weapons(v601:get_player_weapon()).name ~= "SSG 08") or v2.csgo_weapons(v601:get_player_weapon()).name ~= "SSG 08");
                return;
            end;
        end;
    end, 
    shutdown = function()
        -- upvalues: v50 (ref), v27 (ref)
        if not v50.misc_main.jumpscout:get() and v27.miscAa.auto_strafer:get() then
            v27.miscAa.auto_strafer:override();
        end;
    end
};
l_nade_drop_0 = {
    [1] = "\226\130\180\201\132\226\130\181\226\130\173 \226\130\165\201\142 \196\144\197\130\226\130\181\226\130\173", 
    [2] = "\240\157\149\153\240\157\149\150\240\157\149\157\240\157\149\154\240\157\149\160\240\157\149\164.\240\157\149\164\240\157\149\170\240\157\149\164\240\157\149\165\240\157\149\150\240\157\149\158", 
    [3] = "1 \240\157\148\163\240\157\148\178\240\157\148\160\240\157\148\168\240\157\148\166\240\157\148\171\240\157\148\164 \240\157\148\159\240\157\148\166\240\157\148\177\240\157\148\160\240\157\148\165", 
    [4] = "\240\157\148\177\240\157\148\162\240\157\148\159\240\157\148\182\240\157\148\158 \240\157\148\172\240\157\148\159\240\157\148\172\240\157\148\176\240\157\148\176\240\157\148\158\240\157\148\169\240\157\148\166", 
    [5] = "\240\157\148\177\240\157\148\175\240\157\148\158\240\157\148\182\240\157\148\171\240\157\148\166 \240\157\148\178\240\157\148\183\240\157\148\165\240\157\148\162 \240\157\148\165\240\157\148\162\240\157\148\169\240\157\148\166\240\157\148\172\240\157\148\176 \240\157\148\176\240\157\148\182\240\157\148\176\240\157\148\177\240\157\148\162\240\157\148\170", 
    [6] = "\239\189\136\239\189\133\239\189\140\239\189\137\239\189\143\239\189\147 \239\189\147\239\189\143\239\189\140\239\189\143", 
    [7] = "\227\128\142H\227\128\143\227\128\142E\227\128\143\227\128\142L\227\128\143\227\128\142I\227\128\143\227\128\142O\227\128\143\227\128\142S\227\128\143", 
    [8] = "\240\157\150\153\240\157\150\158 \240\157\150\146\240\157\150\147\240\157\150\138 \240\157\150\147\240\157\150\138 \240\157\150\155\240\157\150\151\240\157\150\134\240\157\150\140", 
    [9] = "\240\157\150\149\240\157\150\148\240\157\150\136\240\157\150\141\240\157\150\138\240\157\150\146\240\157\150\154 \240\157\150\153\240\157\150\138\240\157\150\135\240\157\150\158\240\157\150\134 \240\157\150\138\240\157\150\135\240\157\150\154?", 
    [10] = "\207\130\209\146\209\148 \224\185\146\224\184\132t\209\148 \215\169 \209\146\224\184\162\215\165 \215\167\224\185\128\224\185\148\224\184\173\208\179\224\184\132\224\184\163", 
    [11] = "\240\157\148\166 \240\157\148\160\240\157\148\165\240\157\148\162 \240\157\148\177\240\157\148\162 \240\157\148\170\240\157\148\158\240\157\148\177 \240\157\148\171\240\157\148\158 \240\157\148\162\240\157\148\177\240\157\148\172", 
    [12] = "\240\157\148\161\240\157\148\178 \240\157\148\159\240\157\148\166\240\157\148\176\240\157\148\177 \240\157\148\162\240\157\148\166\240\157\148\171 \240\157\148\137\240\157\148\175\240\157\148\162\240\157\148\178\240\157\148\171\240\157\148\161 \240\157\148\164\240\157\148\162\240\157\148\176\240\157\148\177\240\157\148\172\240\157\148\175\240\157\148\159\240\157\148\162\240\157\148\171", 
    [13] = "\209\146\209\148l\224\185\128\224\184\173\224\184\163.\224\184\163\215\165\224\184\163t\209\148\224\185\147 \224\185\146\209\148t\224\184\132", 
    [14] = "\240\157\144\154\240\157\144\165\240\157\144\165 \240\157\144\172\240\157\144\156\240\157\144\171\240\157\144\162\240\157\144\169\240\157\144\173\240\157\144\172 \240\157\144\172\240\157\144\161\240\157\144\162\240\157\144\173", 
    [15] = "\240\157\149\168\240\157\149\168\240\157\149\168.\240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\165\240\157\149\166\240\157\149\147\240\157\149\150.\240\157\149\148\240\157\149\160\240\157\149\158/@\240\157\149\151\240\157\149\154\240\157\149\159\240\157\149\159\240\157\149\157\240\157\149\150\240\157\149\152\240\157\149\150\240\157\149\159\240\157\149\149", 
    [16] = "\240\157\149\168\240\157\149\168\240\157\149\168.\240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\165\240\157\149\166\240\157\149\147\240\157\149\150.\240\157\149\148\240\157\149\160\240\157\149\158/@\240\157\149\167\240\157\149\150\240\157\149\171\240\157\149\149\240\157\149\150\240\157\149\153\240\157\149\160\240\157\149\149\240\157\159\154\240\157\159\153\240\157\159\153\240\157\159\157", 
    [17] = "\240\157\149\168\240\157\149\168\240\157\149\168.\240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\165\240\157\149\166\240\157\149\147\240\157\149\150.\240\157\149\148\240\157\149\160\240\157\149\158/@\240\157\149\138\240\157\149\146\240\157\149\151\240\157\159\153\240\157\149\169", 
    [18] = "\240\157\149\163\240\157\149\166.\240\157\149\159\240\157\149\150\240\157\149\167\240\157\149\150\240\157\149\163\240\157\149\157\240\157\149\160\240\157\149\164\240\157\149\150.\240\157\149\148\240\157\149\148/\240\157\149\158\240\157\149\146\240\157\149\163\240\157\149\156\240\157\149\150\240\157\149\165/\240\157\149\154\240\157\149\165\240\157\149\150\240\157\149\158?\240\157\149\154\240\157\149\149=\240\157\149\160\240\157\149\147\240\157\159\154\240\157\149\132\240\157\148\189\240\157\159\152", 
    [19] = "\239\189\132\239\189\137\239\189\147\239\189\131\239\189\143\239\189\146\239\189\132.\239\189\135\239\189\135/\239\189\133\239\189\149\239\189\131\239\189\150\239\188\161\239\188\146\239\189\151\239\188\180", 
    [20] = "\240\159\133\167\240\159\133\144\240\159\133\167\240\159\133\144\240\159\133\167\240\159\133\144", 
    [21] = "\239\189\136\239\189\133\239\189\140\239\189\137\239\189\143\239\189\147 $ \239\188\149 \239\188\144 \239\188\144", 
    [22] = "\201\142\195\152\201\132 \226\130\180\226\177\160\195\152\226\130\169 \197\130\196\144\197\130\195\152\226\130\174", 
    [23] = "\240\157\149\174\240\157\150\154\240\157\150\146\240\157\150\149\240\157\150\134\240\157\150\151\240\157\150\134 \240\157\150\145 \240\157\150\137\240\157\150\138\240\157\150\143\240\157\150\134 \240\157\150\141\240\157\150\138\240\157\150\145\240\157\150\142\240\157\150\148\240\157\150\152", 
    [24] = "\240\157\150\143\240\157\150\134 \240\157\150\153\240\157\150\156\240\157\150\148\240\157\150\143\196\133 \240\157\150\146\240\157\150\134\240\157\150\146\196\153 \240\157\150\149\240\157\150\142\240\157\150\138\240\157\150\151\240\157\150\137\240\157\150\148\240\157\150\145\196\153", 
    [25] = "\240\157\149\164\240\157\149\161\240\157\149\146\240\157\149\149\240\157\149\146\240\157\149\164\240\157\149\171 \240\157\149\164\240\157\149\156\240\157\149\166\240\157\149\163\240\157\149\168\240\157\149\170\240\157\149\164\240\157\149\170\240\157\149\159\240\157\149\166", 
    [26] = "\240\157\146\185\240\157\147\138 \240\157\147\136\240\157\147\137\240\157\146\190\240\157\147\131\240\157\147\128\240\157\145\146\240\157\147\131\240\157\146\185\240\157\145\146\240\157\147\135 \240\157\146\170\240\157\146\183\240\157\146\185\240\157\146\182\240\157\146\184\240\157\146\189\240\157\147\129\240\157\147\184\240\157\147\136\240\157\145\146\240\157\147\135", 
    [27] = "\240\157\149\166\200\153\240\157\149\160\240\157\149\163", 
    [28] = "\239\188\175 \239\189\147\196\131-\200\155\239\189\137 \239\189\148\239\189\129\239\189\137 \239\189\141\195\162\239\189\137\239\189\142\239\189\137\239\189\140\239\189\133, \239\189\131\196\131\200\155\239\189\133\239\189\140\239\189\149\200\153\239\189\149\239\189\140\239\189\133.", 
    [29] = "\240\157\150\133\240\157\150\134\240\157\150\135\240\157\150\142\240\157\150\143\196\153 \240\157\150\136\240\157\150\142\196\153, \240\157\150\137\240\157\150\159\240\157\150\142\240\157\150\156\240\157\150\144\240\157\150\148."
};
v572 = function(v604)
    -- upvalues: v50 (ref), l_nade_drop_0 (ref)
    if not v50.misc_other.trashtalk:get() then
        return;
    else
        local v605 = entity.get_local_player();
        local v606 = entity.get(v604.userid, true);
        local v607 = entity.get(v604.attacker, true);
        if v605 ~= v606 and v605 == v607 then
            utils.console_exec("say " .. l_nade_drop_0[math.random(1, #l_nade_drop_0)] .. "");
        end;
        return;
    end;
end;
v573 = false;
v574 = function()
    -- upvalues: v50 (ref), v573 (ref), v133 (ref)
    local v608 = v50.misc_other.cvar_optimize:get();
    if v608 and not v573 then
        v573 = true;
        local v609 = v50.misc_other.accent_color:get():to_hex();
        local v610 = string.format("\aDEFAULT[\a%shelios\aDEFAULT] cvars has been optimized!", v609);
        print_dev(v610);
        print_raw(v610);
        v133({
            [1] = {
                [1] = "cvars has been optimized!"
            }
        }, v50.misc_other.accent_color:get());
        cvar.cl_disable_ragdolls:int(1, true);
        cvar.dsp_slow_cpu:int(1, true);
        cvar.mat_disable_bloom:int(1, true);
        cvar.muzzleflash_light:int(0, true);
        cvar.r_eyemove:int(0, true);
        cvar.r_eyegloss:int(0, true);
    elseif not v608 and v573 then
        v573 = false;
    end;
end;
local v614 = {
    time_to_ticks = function(v611)
        return math.floor(v611 / globals.tickinterval + 0.5);
    end, 
    vars = {
        clantag_cache = "", 
        set_clantag = function(v612, v613)
            if v613 ~= v612.clantag_cache then
                common.set_clan_tag(v613);
                v612.clantag_cache = v613;
            end;
        end
    }
};
v614.animation = function(v615, v616)
    -- upvalues: v614 (ref)
    local v617 = "               " .. v615 .. "                      ";
    local v618 = utils.net_channel();
    if not v618 then
        return;
    else
        local v619 = globals.tickcount + v614.time_to_ticks(v618.latency[0] + 0.1488);
        local v620 = v616[math.floor(v619 / v614.time_to_ticks(0.3)) % #v616 + 1] + 1;
        return v617:sub(v620, v620 + 15);
    end;
end;
v614.clan_tag_prev = "";
v614.executer = function()
    -- upvalues: v50 (ref), v614 (ref)
    if not entity.get_local_player() then
        return;
    elseif not v50.misc_other.clantag:get() then
        return;
    else
        local v621 = nil;
        local v622 = entity.get_game_rules();
        if v622 and (v622.m_gamePhase == 11 or v622.m_timeUntilNextPhaseStarts ~= 0) then
            v621 = v614.animation("H E L I O S", {
                [1] = 15
            });
        else
            v621 = v614.animation("H E L I O S", {
                [1] = 0, 
                [2] = 2, 
                [3] = 3, 
                [4] = 4, 
                [5] = 5, 
                [6] = 6, 
                [7] = 7, 
                [8] = 8, 
                [9] = 9, 
                [10] = 10, 
                [11] = 11, 
                [12] = 12, 
                [13] = 13, 
                [14] = 14, 
                [15] = 14, 
                [16] = 15, 
                [17] = 16, 
                [18] = 17, 
                [19] = 18, 
                [20] = 19, 
                [21] = 20, 
                [22] = 21, 
                [23] = 22, 
                [24] = 23, 
                [25] = 24, 
                [26] = 25
            });
        end;
        if v621 and v621 ~= v614.clan_tag_prev then
            v614.vars:set_clantag(v621);
            v614.clan_tag_prev = v621;
        end;
        return;
    end;
end;
v50.misc_other.clantag:set_callback(function(v623)
    if not v623:get() then
        common.set_clan_tag("\000");
    end;
end);
events.pre_render:set(v614.executer);
cfg_list = v28.cfgSystem:list("", v17.n);
cfg_name = v28.cfgSystem:input(" \v\f<square-list>  \rname", "");
create_cfg = v28.cfgSystem:button(" \v\f<square-plus>  \rcreate ", function()
    create_cfg();
end, true);
load_cfg = v28.cfgSystem:button(" \v\f<toggle-on>  \rload ", function()
    load_cfg();
end, true);
save_cfg = v28.cfgSystem:button(" \v\f<floppy-disk>  \rsave ", function()
    save_cfg();
end, true);
delete_cfg = v28.cfgSystem:button(" \v\f<trash>  \rdelete ", function()
    remove_cfg();
end, true);
cfg_import = v28.cfgSystem:button(" \v\f<file-import>  \rimport  ", function()
    import_cfg();
end, true);
cfg_export = v28.cfgSystem:button(" \v\f<file-export>  \rexport  ", function()
    export_cfg();
end, true);
v2.pui.setup({
    [1] = v50.main_aa, 
    [2] = v59, 
    [3] = v50.misc_rage, 
    [4] = v50.misc_visual, 
    [5] = v50.misc_main, 
    [6] = v50.misc_other, 
    [7] = v50.misc_widgets, 
    [8] = v50.info
});
local function v627(v624, v625)
    for v626 = 1, #v624 do
        if v624[v626] == v625 then
            return true;
        end;
    end;
    return false;
end;
export_cfg = function()
    -- upvalues: v2 (ref), v17 (ref)
    cvar.play:call("ui\\counter_beep");
    local _ = common.get_date("%m.%d.%Y %H:%M");
    local v629 = v2.base64.encode(json.stringify(v2.pui.save()));
    local _ = common.get_username();
    if v17.n[cfg_list:get()] ~= "" then
        name = v17.n[cfg_list:get()];
    else
        name = "-";
    end;
    local v631 = {
        n = name, 
        cfg = v629
    };
    v2.clipboard.set(json.stringify(v631));
end;
import_cfg = function()
    -- upvalues: v2 (ref), v17 (ref)
    local v632 = json.parse(v2.clipboard.get());
    cvar.play:call("ui\\counter_beep");
    table.insert(v17.n, v632.n);
    table.insert(v17.cfg, v632.cfg);
    cfg_list:update(v17.n);
    files.write("nl/helios/configs.cfg", json.stringify(v17));
end;
load_cfg = function()
    -- upvalues: v17 (ref), v2 (ref)
    cvar.play:call("ui\\counter_beep");
    local v633 = cfg_list:get();
    local v634 = v633 == 1 and "W3siYW5pbWJyZWFrZXIiOnsiYWRkaXRpb25zIjpbImVhcnRocXVha2UiLCJsZWFuIiwifiJdLCJsZWFuX2Ftb3VudCI6MTAwLjAsInNlbGVjdCI6WyJpbiBhaXIiLCJvbiBncm91bmQiLCJhZGRpdGlvbnMiLCJ+Il0sInNlbGVjdF9pbl9haXIiOiJzdGF0aWMiLCJzZWxlY3Rfb25fZ3JvdW5kIjoia2FuZ2Fyb28ifSwiZmxpY2tfZXhwbG9pdCI6eyJlbmFibGUiOnRydWUsImZsaWNrX21vZGUiOiJhbnRpLXNrZWV0In0sImZyZWVzdGFuZGluZyI6ZmFsc2UsInNhZmVfaGVhZCI6dHJ1ZSwic2VsZWN0X3N0YXRlIjoiYWVyb2JpYysiLCJzZWxlY3RfdGVhbSI6Mi4wLCJ0d2Vha3MiOlsiYW50aS1iYWNrc3RhYiIsInJhbmRvbSBhYSBvbiB3YXJtdXAiLCJzcGluIGFhIG9uIHJvdW5kIGVuZCIsIn4iXSwieWF3X2Jhc2UiOnsic2VsZWN0IjoiYXQgdGFyZ2V0Iiwic3RhdGljTWFudWFsIjp0cnVlfSwifmZyZWVzdGFuZGluZyI6eyJzZWxlY3QiOlsiZGlzYWJsZSB5YXcgbW9kaWZpZXJzIiwiZnJlZXN0YW5kIGJvZHkgeWF3IiwiZGlzYWJsZSBvbiBtYW51YWwiLCJ+Il19LCJ+c2FmZV9oZWFkIjp7InNlbGVjdCI6WyJvbiBrbmlmZSIsIm9uIHRhc2VyIiwifiJdfX0sW1t7ImJvZHlfeWF3Ijp0cnVlLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJkaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJkaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwibGVmdF9saW1pdCI6NjAuMCwibGVmdF95YXciOi0yOS4wLCJwaXRjaCI6ImRvd24iLCJwaXRjaF9qaXR0ZXJfMSI6MC4wLCJwaXRjaF9qaXR0ZXJfMiI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfeWF3IjoyOS4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5fcGl0Y2hfc3BlZWQiOjEuMCwic3Bpbl95YXciOjEuMCwic3Bpbl95YXdfc3BlZWQiOjEuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdfaml0dGVyXzEiOjAuMCwieWF3X2ppdHRlcl8yIjowLjAsInlhd19tb2RpZmllciI6ImNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOi01OC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjp0cnVlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsImxlZnRfeWF3IjotMjkuMCwicGl0Y2giOiJkb3duIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MjkuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxLjAsInNwaW5feWF3X3NwZWVkIjoxLjAsInN0YXRpY195YXciOjAuMCwieWF3Ijoic3RhdGljIiwieWF3X2ppdHRlcl8xIjowLjAsInlhd19qaXR0ZXJfMiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJjZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotNTguMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2ppdHRlciI6dHJ1ZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsImxlZnRfeWF3IjowLjAsInBpdGNoIjoiZG93biIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxLjAsInNwaW5feWF3X3NwZWVkIjoxLjAsInN0YXRpY195YXciOjAuMCwieWF3Ijoic3RhdGljIiwieWF3X2ppdHRlcl8xIjowLjAsInlhd19qaXR0ZXJfMiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJjZW50ZXIiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotNTQuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2ppdHRlciI6dHJ1ZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19LHsiYm9keV95YXciOnRydWUsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZmVuc2l2ZV9waXRjaCI6ImRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6ImRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6MC4wLCJwaXRjaCI6ImRvd24iLCJwaXRjaF9qaXR0ZXJfMSI6MC4wLCJwaXRjaF9qaXR0ZXJfMiI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6InN0YXRpYyIsInlhd19qaXR0ZXJfMSI6MC4wLCJ5YXdfaml0dGVyXzIiOjAuMCwieWF3X21vZGlmaWVyIjoiY2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTU0LjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19qaXR0ZXIiOnRydWV9LCJ+eWF3Ijp7ImRlbGF5X3RpY2tzIjoxLjAsInlhd19yYW5kb21pemF0aW9uIjowLjB9fV0sW3siYm9keV95YXciOnRydWUsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZmVuc2l2ZV9waXRjaCI6ImRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6ImRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6MC4wLCJwaXRjaCI6ImRvd24iLCJwaXRjaF9qaXR0ZXJfMSI6MC4wLCJwaXRjaF9qaXR0ZXJfMiI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6InN0YXRpYyIsInlhd19qaXR0ZXJfMSI6MC4wLCJ5YXdfaml0dGVyXzIiOjAuMCwieWF3X21vZGlmaWVyIjoiY2VudGVyIiwieWF3X21vZGlmaWVyX29mZnNldCI6LTU4LjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19qaXR0ZXIiOnRydWV9LCJ+eWF3Ijp7ImRlbGF5X3RpY2tzIjoxLjAsInlhd19yYW5kb21pemF0aW9uIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJkaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJkaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwibGVmdF9saW1pdCI6NjAuMCwibGVmdF95YXciOjAuMCwicGl0Y2giOiJkb3duIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5fcGl0Y2hfc3BlZWQiOjEuMCwic3Bpbl95YXciOjEuMCwic3Bpbl95YXdfc3BlZWQiOjEuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdfaml0dGVyXzEiOjAuMCwieWF3X2ppdHRlcl8yIjowLjAsInlhd19tb2RpZmllciI6ImNlbnRlciIsInlhd19tb2RpZmllcl9vZmZzZXQiOi01OC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjp0cnVlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX1dLFt7ImJvZHlfeWF3IjpmYWxzZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOmZhbHNlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6MC4wLCJwaXRjaCI6ImRpc2FibGVkIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5fcGl0Y2hfc3BlZWQiOjEuMCwic3Bpbl95YXciOjEuMCwic3Bpbl95YXdfc3BlZWQiOjEuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfMSI6MC4wLCJ5YXdfaml0dGVyXzIiOjAuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19qaXR0ZXIiOmZhbHNlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX0seyJib2R5X3lhdyI6ZmFsc2UsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZmVuc2l2ZV9waXRjaCI6ImRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6ImRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwibGVmdF9saW1pdCI6NjAuMCwibGVmdF95YXciOjAuMCwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxLjAsInNwaW5feWF3X3NwZWVkIjoxLjAsInN0YXRpY195YXciOjAuMCwieWF3IjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyXzEiOjAuMCwieWF3X2ppdHRlcl8yIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjpmYWxzZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19XSxbeyJib2R5X3lhdyI6ZmFsc2UsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZmVuc2l2ZV9waXRjaCI6ImRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6ImRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwibGVmdF9saW1pdCI6NjAuMCwibGVmdF95YXciOjAuMCwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxLjAsInNwaW5feWF3X3NwZWVkIjoxLjAsInN0YXRpY195YXciOjAuMCwieWF3IjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyXzEiOjAuMCwieWF3X2ppdHRlcl8yIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjpmYWxzZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19LHsiYm9keV95YXciOmZhbHNlLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJkaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJkaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsImxlZnRfeWF3IjowLjAsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF9qaXR0ZXJfMSI6MC4wLCJwaXRjaF9qaXR0ZXJfMiI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl8xIjowLjAsInlhd19qaXR0ZXJfMiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhd19tb2RpZmllcl9vZmZzZXQiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2ppdHRlciI6ZmFsc2V9LCJ+eWF3Ijp7ImRlbGF5X3RpY2tzIjoxLjAsInlhd19yYW5kb21pemF0aW9uIjowLjB9fV0sW3siYm9keV95YXciOmZhbHNlLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJkaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJkaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsImxlZnRfeWF3IjowLjAsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF9qaXR0ZXJfMSI6MC4wLCJwaXRjaF9qaXR0ZXJfMiI6MC4wLCJyaWdodF9saW1pdCI6NjAuMCwicmlnaHRfeWF3IjowLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl8xIjowLjAsInlhd19qaXR0ZXJfMiI6MC4wLCJ5YXdfbW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhd19tb2RpZmllcl9vZmZzZXQiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2ppdHRlciI6ZmFsc2V9LCJ+eWF3Ijp7ImRlbGF5X3RpY2tzIjoxLjAsInlhd19yYW5kb21pemF0aW9uIjowLjB9fSx7ImJvZHlfeWF3IjpmYWxzZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOmZhbHNlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6MC4wLCJwaXRjaCI6ImRpc2FibGVkIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5fcGl0Y2hfc3BlZWQiOjEuMCwic3Bpbl95YXciOjEuMCwic3Bpbl95YXdfc3BlZWQiOjEuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfMSI6MC4wLCJ5YXdfaml0dGVyXzIiOjAuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19qaXR0ZXIiOmZhbHNlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX1dLFt7ImJvZHlfeWF3Ijp0cnVlLCJjdXN0b21fcGl0Y2giOjAuMCwiY3VzdG9tX3lhdyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJkaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJkaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbMS4wLCJ+Il0sImxlZnRfbGltaXQiOjYwLjAsImxlZnRfeWF3IjotMzAuMCwicGl0Y2giOiJkb3duIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MzAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxODAuMCwic3Bpbl95YXdfc3BlZWQiOjQuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJzdGF0aWMiLCJ5YXdfaml0dGVyXzEiOjEuMCwieWF3X2ppdHRlcl8yIjotNC4wLCJ5YXdfbW9kaWZpZXIiOiJkaXNhYmxlZCIsInlhd19tb2RpZmllcl9vZmZzZXQiOi01OC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjp0cnVlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WzEuMCwifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6LTMwLjAsInBpdGNoIjoiZG93biIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjMwLjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MTgwLjAsInNwaW5feWF3X3NwZWVkIjo0LjAsInN0YXRpY195YXciOjAuMCwieWF3Ijoic3RhdGljIiwieWF3X2ppdHRlcl8xIjoxLjAsInlhd19qaXR0ZXJfMiI6LTQuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjotNTguMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2ppdHRlciI6dHJ1ZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19XSxbeyJib2R5X3lhdyI6dHJ1ZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WzEuMCwifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6LTI0LjAsInBpdGNoIjoiZG93biIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjM2LjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6ImxlZnQgfiByaWdodCIsInlhd19qaXR0ZXJfMSI6NS4wLCJ5YXdfaml0dGVyXzIiOi03LjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjp0cnVlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WzEuMCwifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6LTI0LjAsInBpdGNoIjoiZG93biIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjM2LjAsInNwaW5fcGl0Y2giOjEuMCwic3Bpbl9waXRjaF9zcGVlZCI6MS4wLCJzcGluX3lhdyI6MS4wLCJzcGluX3lhd19zcGVlZCI6MS4wLCJzdGF0aWNfeWF3IjowLjAsInlhdyI6ImxlZnQgfiByaWdodCIsInlhd19qaXR0ZXJfMSI6NS4wLCJ5YXdfaml0dGVyXzIiOi03LjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjp0cnVlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX1dLFt7ImJvZHlfeWF3IjpmYWxzZSwiY3VzdG9tX3BpdGNoIjowLjAsImN1c3RvbV95YXciOjAuMCwiZGVmZW5zaXZlX3BpdGNoIjoiZGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiZGlzYWJsZWQiLCJlbmFibGUiOmZhbHNlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJsZWZ0X3lhdyI6MC4wLCJwaXRjaCI6ImRpc2FibGVkIiwicGl0Y2hfaml0dGVyXzEiOjAuMCwicGl0Y2hfaml0dGVyXzIiOjAuMCwicmlnaHRfbGltaXQiOjYwLjAsInJpZ2h0X3lhdyI6MC4wLCJzcGluX3BpdGNoIjoxLjAsInNwaW5fcGl0Y2hfc3BlZWQiOjEuMCwic3Bpbl95YXciOjEuMCwic3Bpbl95YXdfc3BlZWQiOjEuMCwic3RhdGljX3lhdyI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfMSI6MC4wLCJ5YXdfaml0dGVyXzIiOjAuMCwieWF3X21vZGlmaWVyIjoiZGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfb2Zmc2V0IjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19qaXR0ZXIiOmZhbHNlfSwifnlhdyI6eyJkZWxheV90aWNrcyI6MS4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wfX0seyJib2R5X3lhdyI6ZmFsc2UsImN1c3RvbV9waXRjaCI6MC4wLCJjdXN0b21feWF3IjowLjAsImRlZmVuc2l2ZV9waXRjaCI6ImRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6ImRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwibGVmdF9saW1pdCI6NjAuMCwibGVmdF95YXciOjAuMCwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX2ppdHRlcl8xIjowLjAsInBpdGNoX2ppdHRlcl8yIjowLjAsInJpZ2h0X2xpbWl0Ijo2MC4wLCJyaWdodF95YXciOjAuMCwic3Bpbl9waXRjaCI6MS4wLCJzcGluX3BpdGNoX3NwZWVkIjoxLjAsInNwaW5feWF3IjoxLjAsInNwaW5feWF3X3NwZWVkIjoxLjAsInN0YXRpY195YXciOjAuMCwieWF3IjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyXzEiOjAuMCwieWF3X2ppdHRlcl8yIjowLjAsInlhd19tb2RpZmllciI6ImRpc2FibGVkIiwieWF3X21vZGlmaWVyX29mZnNldCI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfaml0dGVyIjpmYWxzZX0sIn55YXciOnsiZGVsYXlfdGlja3MiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMH19XV0seyJhdXRvX29zYWEiOmZhbHNlLCJkb3JtYW50X2FpbWJvdCI6eyJhdXRvX3Njb3BlIjp0cnVlLCJlbmFibGUiOmZhbHNlLCJoaXRib3hlcyI6WyJoZWFkIiwiY2hlc3QiLCJzdG9tYWNoIiwibGVncyIsIn4iXSwiaGl0Y2hhbmNlIjo4MC4wfSwiZmFrZV9sYXRlbmN5X3VubG9jayI6dHJ1ZSwifmF1dG9fb3NhYSI6eyJjb25kcyI6WyJjcm91Y2hpbmciLCJzbmVha2luZyIsIn4iXSwid2VhcG9ucyI6WyJzY291dCIsIn4iXX19LHsiYXNwZWN0X3JhdGlvIjp0cnVlLCJjcm9zc2hhaXJfaW5kIjpmYWxzZSwiY3VzdG9tX3Njb3BlIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yIjp0cnVlLCJncmVuYWRlX3JhZGl1cyI6dHJ1ZSwibGNfYm94IjpmYWxzZSwibm90aWZ5Ijp0cnVlLCJ2aWV3bW9kZWxfY2hhbmdlciI6dHJ1ZSwid2F0ZXJtYXJrIjp7ImZpcnN0Y29sIjoiI0ZGNTY1NkZGIiwicG9zaXRpb24iOiJib3R0b20iLCJzZWNvbmRjb2wiOiIjRkY1NjU2RkYiLCJzdHlsZSI6ImRlZmF1bHQifSwifmFzcGVjdF9yYXRpbyI6eyJ2YWx1ZSI6MTMzLjB9LCJ+Y3Jvc3NoYWlyX2luZCI6eyJhZGRpdGlvbnMiOlsiZ2xvdyIsImdyYWRpZW50IiwifiJdLCJjb2xvcjEiOiIjQkMzMzMzRkYiLCJjb2xvcjIiOiIjMjUyNTI1RkYiLCJjb2xvcjMiOiIjRkZGRkZGRkYifSwifmN1c3RvbV9zY29wZSI6eyJjb2xvciI6IiNBQUFBQUFGRiIsImV4Y2x1ZGUiOlsifiJdLCJnYXAiOjUuMCwic2l6ZSI6MjA5LjB9LCJ+ZGFtYWdlX2luZGljYXRvciI6eyJhbmltYXRpb24iOmZhbHNlLCJjb2xvciI6IiNGRkZGRkZGRiJ9LCJ+Z3JlbmFkZV9yYWRpdXMiOnsibW9kZSI6WyJzbW9rZSIsIm1vbG90b3YiLCJ+Il0sIm1vbG90b3ZfY29sb3IiOiIjRkY4QThBRkYiLCJzbW9rZV9jb2xvciI6IiNBOENCRkZGRiJ9LCJ+bm90aWZ5Ijp7ImhpdF9jb2xvciI6IiM4ODg4ODhGRiIsIm1pc3NfY29sb3IiOiIjQkMzMzMzRkYifSwifnZpZXdtb2RlbF9jaGFuZ2VyIjp7ImZvdiI6NzAuMCwib2Zmc2V0X3giOjIuMCwib2Zmc2V0X3kiOi0yLjAsIm9mZnNldF96Ijo0LjB9fSx7ImZha2VfZHVja19zcGVlZCI6ZmFsc2UsImZhc3RfbGFkZGVyIjp0cnVlLCJqdW1wc2NvdXQiOnRydWUsIm5hZGVfZHJvcCI6dHJ1ZSwibm9fZmFsbF9kYW1hZ2UiOnRydWUsInN1cGVyX3Rvc3MiOnRydWUsInRocm93X2ZpeCI6dHJ1ZSwifmZhc3RfbGFkZGVyIjp7ImZhc3RfbGFkZGVyX3NlbGVjdCI6WyJhc2NlbmRpbmciLCJkZXNjZW5kaW5nIiwifiJdfSwifm5hZGVfZHJvcCI6eyJkcm9wIjo3Mi4wLCJncmVuYWRlcyI6WyJoZSIsIm1vbG90b3YiLCJ+Il19fSx7ImFjY2VudF9jb2xvciI6IiNGRjYxNjFGRiIsImNsYW50YWciOmZhbHNlLCJjdmFyX29wdGltaXplIjp0cnVlLCJldmVudF9sb2dzIjp0cnVlLCJ0cmFzaHRhbGsiOmZhbHNlLCJ+ZXZlbnRfbG9ncyI6eyJoaXRfY29sb3IiOiIjRkY2MTYxRkYiLCJtaXNzX2NvbG9yIjoiI0ZGNjE2MUZGIiwic2VsZWN0IjpbImFpbWJvdCIsInB1cmNoYXNlIiwifiJdfX1d" or v17.cfg[v633];
    v2.pui.load(json.parse(v2.base64.decode(v634)));
    local v635 = {};
    for v636, v637 in ipairs(v17.n) do
        if v636 == v633 then
            table.insert(v635, "\a{Link Active}\194\176\239\189\161\226\139\134 \aDEFAULT" .. v637);
        else
            table.insert(v635, v637);
        end;
    end;
    cfg_list:update(v635);
end;
save_cfg = function()
    -- upvalues: v17 (ref), v2 (ref)
    cvar.play:call("ui\\counter_beep");
    v17.cfg[cfg_list:get()] = v2.base64.encode(json.stringify(v2.pui.save()));
    files.write("nl/helios/configs.cfg", json.stringify(v17));
end;
create_cfg = function()
    -- upvalues: v2 (ref), v627 (ref), v17 (ref)
    cvar.play:call("ui\\counter_beep");
    local _ = common.get_date("%m.%d.%Y %H:%M");
    local v639 = v2.base64.encode(json.stringify(v2.pui.save()));
    local v640 = cfg_name:get();
    if v640 ~= "" and not v627(v17.n, v640) then
        table.insert(v17.n, v640);
        table.insert(v17.cfg, v639);
        files.write("nl/helios/configs.cfg", json.stringify(v17));
    end;
    cfg_list:update(v17.n);
end;
remove_cfg = function()
    -- upvalues: v17 (ref)
    cvar.play:call("ui\\counter_beep");
    if cfg_list:get() ~= 1 then
        table.remove(v17.n, cfg_list:get());
        table.remove(v17.cfg, cfg_list:get());
        files.write("nl/helios/configs.cfg", json.stringify(v17));
        cfg_list:update(v17.n);
    end;
end;
events.createmove:set(function(v641)
    -- upvalues: v80 (ref), v83 (ref), v130 (ref), v113 (ref), l_sv_jump_impulse_0 (ref), v441 (ref), v451 (ref), l_enable_0 (ref), v537 (ref)
    v80();
    v83();
    if not entity.get_local_player() then
        return;
    else
        v130.on_createmove(v641);
        v113(v641);
        l_sv_jump_impulse_0.update(v641);
        v441.on_createmove(v641);
        super_toss_on_cm(v641);
        v451.semi_fix_lol(v641);
        l_enable_0.on_cm();
        l_enable_0.shutdown();
        v537.on_createmove(v641);
        return;
    end;
end);
events.createmove_run:set(function(v642)
    -- upvalues: v442 (ref)
    v442(v642);
end);
events.aim_ack:set(function(v643)
    -- upvalues: v135 (ref), v136 (ref)
    v135(v643);
    v136(v643);
end);
events.player_hurt:set(function(v644)
    -- upvalues: v137 (ref), v138 (ref)
    v137(v644);
    v138(v644);
end);
events.item_purchase:set(function(v645)
    -- upvalues: v139 (ref)
    v139(v645);
end);
events.grenade_override_view:set(function(v646)
    on_grenade_override_view(v646);
end);
events.render:set(function()
    -- upvalues: v58 (ref), v160 (ref), v30 (ref), v142 (ref), v153 (ref), v132 (ref), v146 (ref), v84 (ref), v141 (ref), v129 (ref), v316 (ref), v315 (ref), v128 (ref), v168 (ref), v574 (ref)
    v58();
    v160.update();
    v30();
    v142.update();
    v153();
    v132();
    v146();
    v84();
    v141.update();
    v129();
    v316.render();
    v315.render();
    v128(cmd);
    v168.render();
    v574();
end);
events.net_update_end:set(function()
    -- upvalues: v316 (ref)
    v316.net_update_end();
end);
events.player_hurt:set(function(v647)
    -- upvalues: v130 (ref)
    v130.on_player_hurt(v647);
end);
events.weapon_fire:set(function(v648)
    -- upvalues: v130 (ref)
    v130.on_weapon_fire(v648);
end);
events.post_update_clientside_animation:set(function()
    -- upvalues: v90 (ref)
    v90();
end);
events.player_death:set(function(v649)
    -- upvalues: v572 (ref)
    v572(v649);
end);
events.grenade_thrown:set(function(v650)
    -- upvalues: v451 (ref)
    v451.quickswitch(v650);
end);
events.shutdown:set(function()
    -- upvalues: v4 (ref), v27 (ref)
    cvar.viewmodel_fov:int(v4(cvar.viewmodel_fov), true);
    cvar.viewmodel_offset_x:float(v4(cvar.viewmodel_offset_x), true);
    cvar.viewmodel_offset_y:float(v4(cvar.viewmodel_offset_y), true);
    cvar.viewmodel_offset_z:float(v4(cvar.viewmodel_offset_z), true);
    v27.miscAa.auto_strafer:override();
    v27.rage.da:override();
    v27.rage.quick_switch:override();
    common.set_clan_tag("\000");
end);