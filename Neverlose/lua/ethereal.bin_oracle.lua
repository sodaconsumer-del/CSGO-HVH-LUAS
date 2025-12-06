local l_system_0 = require("neverlose/drag_system");
local l_gradient_0 = require("neverlose/gradient");
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/base64");
ffi.cdef("    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n\n    typedef struct {\n        float x;\n        float y;\n        float z;\n    } vector_t;\n\n    typedef void(__fastcall*FX_ElectricSparkFn)(const vector_t*,int,int,const vector_t*);\n");
local function _(v4, v5, v6)
    local v7 = ffi.cast("void***", v4);
    local v8 = ffi.typeof(v5);
    return function(...)
        -- upvalues: v8 (ref), v7 (ref), v6 (ref)
        return ffi.cast(v8, v7[0][v6])(v7, ...);
    end;
end;
local function _(v10, v11)
    local v12 = ffi.typeof(v10);
    return function(v13, ...)
        -- upvalues: v12 (ref), v11 (ref)
        local v14 = ffi.cast("void***", v13);
        return ffi.cast(v12, v14[0][v11])(v14, ...);
    end;
end;
urlmon = ffi.load("UrlMon");
wininet = ffi.load("WinInet");
local function _(v16, v17)
    wininet.DeleteUrlCacheEntryA(v16);
    urlmon.URLDownloadToFileA(nil, v16, v17, 0, 0);
end;
local v19 = db.comettech_lua or {
    configs = {}
};
local v20 = ffi.typeof("char[?]");
local v21 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)");
local v22 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)");
local v23 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)");
local v27 = {
    get = function()
        -- upvalues: v21 (ref), v20 (ref), v23 (ref)
        local v24 = v21();
        if v24 > 0 then
            local v25 = v20(v24);
            v23(0, v25, v24);
            return ffi.string(v25, v24 - 1);
        else
            return nil;
        end;
    end, 
    set = function(...)
        -- upvalues: v22 (ref)
        local v26 = tostring(table.concat({
            ...
        }));
        v22(v26, string.len(v26));
    end
};
local v40 = {
    encrypt = function(v28)
        local v29 = "";
        local v30 = string.len("Comet202400000000");
        for v31 = 1, string.len(v28) do
            local v32 = string.sub(v28, v31, v31);
            local v33 = string.sub("Comet202400000000", v31 % v30 + 1, v31 % v30 + 1);
            v29 = v29 .. string.char((string.byte(v32) + string.byte(v33) - 64) % 95 + 32);
        end;
        return v29;
    end, 
    decrypt = function(v34)
        local v35 = "";
        local v36 = string.len("Comet202400000000");
        for v37 = 1, string.len(v34) do
            local v38 = string.sub(v34, v37, v37);
            local v39 = string.sub("Comet202400000000", v37 % v36 + 1, v37 % v36 + 1);
            v35 = v35 .. string.char((string.byte(v38) - string.byte(v39) + 95) % 95 + 32);
        end;
        return v35;
    end
};
local v41 = {
    user = {
        ping = 0, 
        name = common.get_username(), 
        date = common.get_date("%d.%m.%Y"), 
        time = common.get_system_time().hours .. ":" .. common.get_system_time().minutes
    }, 
    lua = {
        version = "1.0", 
        build = "Stable"
    }, 
    client = {
        hittable = {}
    }
};
utils.execute_after(0.01, function()
    -- upvalues: l_pui_0 (ref), v41 (ref), v40 (ref), v19 (ref), v27 (ref), l_system_0 (ref), l_gradient_0 (ref)
    local v42 = {
        names = {
            [1] = "Shared", 
            [2] = "Standing", 
            [3] = "Running", 
            [4] = "Crouching", 
            [5] = "Slow Walking", 
            [6] = "Jumping", 
            [7] = "Jumping in Crouch"
        }, 
        sn = {
            [1] = "SH", 
            [2] = "S", 
            [3] = "R", 
            [4] = "C", 
            [5] = "SW", 
            [6] = "J", 
            [7] = "J+C"
        }
    };
    local v43 = {
        home = {
            groups = {
                main = l_pui_0.create("\v\f<house>", "  Ethereal", 1), 
                configs = l_pui_0.create("\v\f<house>", "  Configs", 1), 
                user = l_pui_0.create("\v\f<house>", "  User", 2), 
                links = l_pui_0.create("\v\f<house>", " \n ", 2)
            }
        }, 
        antiaim = {
            groups = {
                main = l_pui_0.create("\v\f<person-rays>", "  Main", 1), 
                type_antiaims = l_pui_0.create("\v\f<person-rays>", "", 1), 
                features_main = l_pui_0.create("\v\f<person-rays>", "  Features", 2), 
                features_customize = l_pui_0.create("\v\f<person-rays>", "  Configuration", 1), 
                conditions = l_pui_0.create("\v\f<person-rays>", "  Conditions", 2), 
                builder = l_pui_0.create("\v\f<person-rays>", "  Builder", 2), 
                antibrute = l_pui_0.create("\v\f<person-rays>", "  Anti-Bruteforce", 1)
            }, 
            builder = {}, 
            antibrute = {}
        }, 
        misc = {
            groups = {
                select = l_pui_0.create("\v\f<shapes>", " ", 1), 
                ragebot = l_pui_0.create("\v\f<shapes>", "  Main", 2), 
                movement = l_pui_0.create("\v\f<shapes>", "  Movement", 2), 
                client = l_pui_0.create("\v\f<shapes>", "  Client", 2), 
                interface = l_pui_0.create("\v\f<shapes>", "  Interface", 2), 
                local_view = l_pui_0.create("\v\f<shapes>", "  Local view", 2), 
                indicators = l_pui_0.create("\v\f<shapes>", " Indicators", 1), 
                world = l_pui_0.create("\v\f<shapes>", "  World", 1), 
                signature_comet_tech = l_pui_0.create("\v\f<shapes>", "", 1)
            }
        }
    };
    l_pui_0.translate("The further away from 13 ticks, the more unsafe the teleport becomes.", {
        cn = "\232\183\157\231\166\187 13 ticks \232\182\138\232\191\156\239\188\140\228\188\160\233\128\129\229\176\177\232\182\138\228\184\141\229\174\137\229\133\168\227\128\130", 
        ru = "\208\167\208\181\208\188 \208\180\208\176\208\187\209\140\209\136\208\181 \208\190\209\130 13 \209\130\208\184\208\186\208\190\208\178, \209\130\208\181\208\188 \208\177\208\190\208\187\208\181\208\181 \208\189\208\181\208\177\208\181\208\183\208\190\208\191\208\176\209\129\208\189\209\139\208\188 \209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\129\209\143 \209\130\208\181\208\187\208\181\208\191\208\190\209\128\209\130."
    });
    l_pui_0.translate("The damage at which the teleport will be triggered.", {
        cn = "\232\167\166\229\143\145\228\188\160\233\128\129\231\154\132\228\188\164\229\174\179\229\128\188\227\128\130", 
        ru = "\208\163\209\128\208\190\208\189 \208\191\209\128\208\184 \208\186\208\190\209\130\208\190\209\128\208\190\208\188 \208\177\209\131\208\180\208\181\209\130 \209\129\209\128\208\176\208\177\208\176\209\130\209\139\208\178\208\176\209\130\209\140 \209\130\208\181\208\187\208\181\208\191\208\190\209\128\209\130."
    });
    l_pui_0.translate("Yaw type becomes static.", {
        cn = "\229\129\143\232\136\170\231\177\187\229\158\139\229\143\152\228\184\186\233\157\153\230\128\129\227\128\130", 
        ru = "\208\162\208\184\208\191 yaw \209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\129\209\143 \209\129\209\130\208\176\209\130\208\184\209\135\208\189\209\139\208\188."
    });
    local v46 = {
        home = {
            main = v43.home.groups.main:label(" \n     \v\f<terminal>    \r" .. v41.user.name .. " \n     \v\f<code-commit>    \rVersion   ~   " .. v41.lua.version .. "\n "), 
            user = v43.home.groups.user:label(" \n     Welcome back, " .. v41.user.name .. "!  ^_^ \n     Date ~ " .. v41.user.date .. ". \n\n     Have a good experience with my script!\n "), 
            animation_on_load = v43.home.groups.user:switch("     \rAnimation on Load", true), 
            label = v43.home.groups.links:label("     Discord Server"), 
            discord = v43.home.groups.links:button("  \v\239\142\146  \rEthereal", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/zSANHqjKAt");
            end), 
            label = v43.home.groups.links:label("     Youtube"), 
            youtube = v43.home.groups.links:button("  \v\239\133\167  \rjstokyo_", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@jstokyo_");
            end), 
            label = v43.home.groups.links:label("     Config"), 
            config = v43.home.groups.links:button("  \240\159\146\150 Undying heart", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=GfBpsu");
            end), 
            label = v43.home.groups.links:label("     Themes"), 
            bliss = v43.home.groups.links:button(" \226\156\168 Bliss", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=Xej9HXlBzF3BaG3a-hiKCpeMZFB");
            end), 
            misty_city = v43.home.groups.links:button(" \240\159\143\153\239\184\143 Misty city", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=Qn8Gq01Tcwerv6UU-h4-rPzEBa2");
            end)
        }, 
        antiaim = {
            tab = v43.antiaim.groups.main:list("", {
                [1] = "\v\f<user-gear>   \rCustomize", 
                [2] = "\v\f<wand-magic-sparkles>   \rFeatures"
            }), 
            type = v43.antiaim.groups.type_antiaims:list("", {
                [1] = "\v\f<shield-slash>    \rNone", 
                [2] = "\v\f<trowel-bricks>    \rBuilder", 
                [3] = "\v\f<universal-access>    \rAnti-Bruteforce"
            }), 
            tweaks = v43.antiaim.groups.features_main:selectable("\v\f<wrench>    \rTweaks", {
                [1] = "Disable AA on Warmup", 
                [2] = "Better Hide Shots", 
                [3] = "Zero Pitch on Peek", 
                [4] = "Leg Breaker"
            }, "\aB8A844FF\f<triangle-exclamation> WARNING: If you think that after turning on Better Hide Shots cheat began to shoot unstable, then turn it off!"), 
            safehead = v43.antiaim.groups.features_main:selectable("\v\f<plane-circle-check>    \rSafe Head", {
                [1] = "In Crouching", 
                [2] = "With Knife In J+C"
            }), 
            manuals = v43.antiaim.groups.features_main:combo("\v\f<up-down-left-right>    \rManuals", {
                [1] = "None", 
                [2] = "Backward", 
                [3] = "Right", 
                [4] = "Left", 
                [5] = "Forward"
            }), 
            freestanding = v43.antiaim.groups.features_main:switch("\v\f<arrows-turn-to-dots>    \rFreestanding", false, function(v44)
                return {
                    yaw_static = v44:switch("Static Yaw", false, "Yaw type becomes static."), 
                    disable_yaw_modif = v44:switch("Disable Yaw Modifer"), 
                    freestanding_by = v44:switch("Body Freestanding")
                }, nil;
            end), 
            enable_customize = v43.antiaim.groups.features_customize:switch("\v\f<sidebar>    \rConfiguration customizer", false, "You can FULLY personalize the customizer settings.\n\n\aB8A844FF\f<triangle-exclamation> WARNING: If you do not know what you are doing, please do not touch these settings as you may break the customizer."), 
            type_transition = v43.antiaim.groups.features_customize:list("\v\f<cloud-fog>    \rTransition", {
                [1] = "\v\f<wave-square>   \rInstant", 
                [2] = "\v\f<wave-sine>   \rSmoothed"
            }, function(v45)
                return {
                    predictive = v45:switch("\v\f<wave-triangle>    \rPredictive", false, "Predicts the next condition, based on the keys pressed on the keyboard.\n\n\aB8A844FF\f<triangle-exclamation> WARNING: A feature with a small chance but may not correctly predict your next condition."), 
                    pr_ticks = v45:slider("\v\f<timer>    \rTicks predict", 1, 20, 5, 1, "t")
                };
            end), 
            delay_antiaims = v43.antiaim.groups.features_customize:slider("\v\f<hourglass-clock>    \rDelay", 0, 200, 0, 0.01, "s"), 
            randomization_antiaims = v43.antiaim.groups.features_customize:slider("\v\f<rotate>    \rRandomization", 0, 100, 0, 1, "%")
        }
    };
    v46.antiaim.antibrute = {
        reset = v43.antiaim.groups.antibrute:listable("\v\f<shuffle>    \rReset Factors", {
            [1] = "New Round Starts", 
            [2] = "After X sec. idle"
        }), 
        time_count = v43.antiaim.groups.antibrute:slider("\v\f<timeline>    \rTime Count", 1, 20, 10, 1, "s"), 
        cur_phase = v43.antiaim.groups.conditions:combo("\v\f<arrow-up-1-9>    \rPhase", {
            [1] = "Phase 1"
        }), 
        phase = v43.antiaim.groups.antibrute:slider("\v\f<sliders>    \rPhases", 2, 10, 2)
    };
    v46.antiaim.conditions = v43.antiaim.groups.conditions:combo("\v\f<globe>    \rSelect", {
        [1] = "Shared", 
        [2] = "Standing", 
        [3] = "Running", 
        [4] = "Crouching", 
        [5] = "Slow Walking", 
        [6] = "Jumping", 
        [7] = "Jumping in Crouch"
    });
    v46.misc = {
        select = v43.misc.groups.select:list("", {
            [1] = "\v\f<crosshairs-simple>   \rRagebot", 
            [2] = "\v\f<brush>   \rVisuals", 
            [3] = "\v\f<stars>   \rMisc"
        }), 
        signature_comet_tech = v43.misc.groups.signature_comet_tech:label(" \v\f<star-shooting>    \rethereal  \226\128\148  2025"), 
        ethereal_aim = v43.misc.groups.ragebot:switch("\v\f<sparkles>    \rEthereal.Aim", false, "Enchance your aimbot with auto solutions of any problems with aim.", function(v47)
            return {
                force_baim = v47:listable("Force Body Aim", {
                    [1] = "Lethal", 
                    [2] = "Defensive"
                }), 
                defensive_aimbot = v47:switch("Defensive Aimbot", false, "")
            }, true;
        end), 
        aimbotlogs = v43.misc.groups.ragebot:switch("\v\f<list-check>    \rAimbot Logs", false, function(v48)
            return {
                color_hit = v48:color_picker("Hit color", color(0, 255, 0, 255)), 
                color_miss = v48:color_picker("Miss color", color(255, 0, 0, 255))
            }, true;
        end), 
        idealtick = v43.misc.groups.ragebot:switch("\v\f<transporter-3>   \rIdeal Tick", false, "Reduces the chance of backshooting when auto-peeking\n\n\aB8A844FF\f<triangle-exclamation> WARNING: If you think that after enabling this function cheat began to shoot unstable, then turn it off!", function(v49)
            return {
                prevent_os = v49:switch("\v\f<eye-low-vision>   \rPrevent One-Shot", false, "Change fake lag limit to reduce the chance of backshooting")
            }, true;
        end), 
        better_defensive = v43.misc.groups.ragebot:switch("\v\f<user-shield>    \rBetter Defensive", false, function(v50)
            return {
                peek = v50:combo("On Peek", {
                    [1] = "Default", 
                    [2] = "Anti-Backtrack", 
                    [3] = "Anti-Predict"
                }), 
                addons = v50:listable("", {
                    [1] = "On Land", 
                    [2] = "On Reload Weapon"
                })
            }, true;
        end), 
        auto_teleport = v43.misc.groups.ragebot:switch("\v\f<person-shelter>    \rAuto Teleport", false, function(v51)
            return {
                type_teleport = v51:combo("Type Telport", {
                    [1] = "Basic", 
                    [2] = "Discharge Exploit"
                }), 
                options = v51:listable("Options", {
                    [1] = "Teleport when Defensive AA", 
                    [2] = "Only in air"
                }), 
                pt = v51:slider("Predict Ticks", 0, 20, 13, 1, "t", "How many ticks will predict the local player for early teleport. "), 
                dmg = v51:slider("Damage Detect", 1, 130, 30, 1, "", "The damage at which the teleport will be triggered.")
            }, true;
        end), 
        nade_throw_fix = v43.misc.groups.ragebot:switch("\v\f<volleyball>    \rNade Throw Fix"), 
        fast_ladder = v43.misc.groups.movement:switch("\v\f<water-ladder>    \rFast Ladder"), 
        super_toss = v43.misc.groups.movement:switch("\v\f<bomb>    \rSuper Toss"), 
        nfd = v43.misc.groups.movement:switch("\v\f<person-falling>    \rNo Fall Damage"), 
        clantag = v43.misc.groups.client:switch("\v\f<user-check>    \rClantag"), 
        trashtalk = v43.misc.groups.client:switch("\v\f<skull>    \rTrashtalk", false, function(v52)
            return {
                events = v52:selectable("Events", {
                    [1] = "On Death", 
                    [2] = "On Kill"
                })
            }, true;
        end), 
        unmute = v43.misc.groups.client:switch("\v\f<microphone-lines>    \rUnmute Slience Players"), 
        pingunlocker = v43.misc.groups.client:switch("\v\f<signal>    \rPing Unlocker", false, function(v53)
            return {
                value_pu = v53:slider("Value", 0, 375, 0)
            }, true;
        end), 
        interface_clr = v43.misc.groups.interface:color_picker("\v\f<fill-drip>    \rInterface Color"), 
        windows = v43.misc.groups.interface:listable("\v\f<window-restore>    \rWindows", {
            [1] = "Watermark", 
            [2] = "Keybinds", 
            [3] = "Spectators"
        }), 
        indicators = v43.misc.groups.indicators:switch("\v\f<address-card>    \rCrosschair Indicators"), 
        damage_indicator = v43.misc.groups.indicators:switch("\v\f<crosshairs>    \rDamage Indicator"), 
        velocity_warning = v43.misc.groups.indicators:switch("\v\f<triangle-exclamation>    \rVelocity Warning"), 
        grenade_radius = v43.misc.groups.world:switch("\v\f<chart-radar>    \rGrenade Radius", false, function(v54)
            return {
                type_radius = v54:combo("Type Radius", {
                    [1] = "Outline", 
                    [2] = "Gradient"
                }), 
                type_render = v54:combo("Type Render", {
                    [1] = "Default", 
                    [2] = "Glow"
                }), 
                smoke_radius = v54:switch("Smoke", false, color(255, 255, 255)), 
                molotov_radius = v54:switch("Molotov", false, color(255, 255, 255)), 
                molotov_separetly = v54:switch("Render the fire separately"), 
                animate = v54:switch("Animate")
            }, true;
        end), 
        nofications_on_screen = v43.misc.groups.interface:switch("\v\f<bars>    \rNofications On Screen"), 
        spark_on_shot = v43.misc.groups.world:switch("\v\f<sparkles>    \rSpark on Shot", false, function(v55)
            return {
                color = v55:color_picker("Color", color(255, 0, 0)), 
                quantity = v55:slider("Quantity", 1, 10, 3), 
                length = v55:slider("Length", 1, 10, 3)
            }, true;
        end), 
        console_color = v43.misc.groups.interface:switch("\v\f<window>    \rVGUI Color", false, function(v56)
            return {
                color = v56:color_picker("Color")
            }, true;
        end), 
        custom_scope = v43.misc.groups.interface:switch("\v\f<crosshairs>    \rCustom Scope", false, function(v57)
            return {
                remover = v57:combo("Scope Overlay", {
                    [1] = "Default", 
                    [2] = "Clean Lenses", 
                    [3] = "Remove Overlay", 
                    [4] = "Remove All"
                }), 
                style = v57:combo("Gradient", {
                    [1] = "Inside", 
                    [2] = "From Within"
                }), 
                color = v57:color_picker("Color", color(255, 255, 255, 255)), 
                thickness = v57:slider("Thickness", 1, 10, 70), 
                width = v57:slider("Width", 1, 500, 70), 
                offset = v57:slider("Offset", 0, 100, 10)
            }, true;
        end), 
        aspect_ratio = v43.misc.groups.local_view:switch("\v\f<desktop>    \rAspect Ratio", false, function(v58)
            return {
                value_ar = v58:slider("Value", 0, 200, 0, 0.01)
            }, true;
        end), 
        viewmodel = v43.misc.groups.local_view:switch("\v\f<eye>    \rView Model", false, function(v59)
            return {
                fov = v59:slider("FOV", -100, 100, 68), 
                x = v59:slider("X", -150, 150, 25, 0.1), 
                y = v59:slider("Y", -150, 150, 0, 0.1), 
                z = v59:slider("Z", -150, 150, -15, 0.1)
            }, true;
        end), 
        keep_transperency_model = v43.misc.groups.local_view:switch("\v\f<transporter>    \rKeep Model Transperency"), 
        not_vis = {
            binds_x = v43.misc.groups.interface:slider("X binds", 0, render.screen_size().x, 250), 
            binds_y = v43.misc.groups.interface:slider("Y binds", 0, render.screen_size().y, 250), 
            spec_x = v43.misc.groups.interface:slider("X spec", 0, render.screen_size().x, 250), 
            spec_y = v43.misc.groups.interface:slider("Y spec", 0, render.screen_size().y, 250), 
            vel_x = v43.misc.groups.interface:slider("X vel", 0, render.screen_size().x, 250), 
            vel_y = v43.misc.groups.interface:slider("Y vel", 0, render.screen_size().y, 250), 
            logs_x = v43.misc.groups.interface:slider("X logs", 0, render.screen_size().x, 250), 
            logs_y = v43.misc.groups.interface:slider("Y logs", 0, render.screen_size().y, 250)
        }
    };
    v46.antiaim.builder = {};
    v46.antiaim.antibrute_aa = {};
    local v60 = {
        nothing = v43.home.groups.configs:label("\nYou don't have configurations yet. Create your first one!\n"), 
        configs = v43.home.groups.configs:list("\n", {}), 
        name_config = v43.home.groups.configs:input("     Config Name")
    };
    v60.load = v43.home.groups.configs:button("   \239\129\162  Load   ", function()
        -- upvalues: v60 (ref), v40 (ref), v19 (ref), l_pui_0 (ref)
        if #v60.configs:list() == 0 then
            return;
        else
            local l_status_0, l_result_0 = pcall(function()
                -- upvalues: v40 (ref), v19 (ref), v60 (ref)
                return json.parse(v40.decrypt(v19.configs[v60.configs:list()[v60.configs:get()]]));
            end);
            if not l_status_0 then
                common.add_notify("ethereal", "Error on load config.");
                return;
            else
                l_pui_0.load(l_result_0);
                common.add_notify("ethereal", "Config was loaded!");
                return;
            end;
        end;
    end);
    v60.create = v43.home.groups.configs:button("   \239\131\190  Create   ", function()
        -- upvalues: v60 (ref), v19 (ref), v40 (ref), l_pui_0 (ref)
        if v60.name_config:get() == "" then
            return;
        else
            v19.configs[v60.name_config:get()] = v40.encrypt(json.stringify(l_pui_0.save()));
            local v63 = {};
            for v64, v65 in pairs(v19.configs) do
                if v65 ~= nil then
                    table.insert(v63, v64);
                end;
            end;
            v60.configs:update(v63);
            common.add_notify("ethereal", "Config was created!");
            return;
        end;
    end);
    v60.save = v43.home.groups.configs:button("  \239\131\135  ", function()
        -- upvalues: v60 (ref), v19 (ref), v40 (ref), l_pui_0 (ref)
        if #v60.configs:list() == 0 then
            return;
        else
            v19.configs[v60.configs:list()[v60.configs:get()]] = v40.encrypt(json.stringify(l_pui_0.save()));
            local v66 = {};
            for v67, v68 in pairs(v19.configs) do
                if v68 ~= nil then
                    table.insert(v66, v67);
                end;
            end;
            v60.configs:update(v66);
            common.add_notify("ethereal", "Config was saved!");
            return;
        end;
    end);
    v60.delete = v43.home.groups.configs:button("  \239\135\184  ", function()
        -- upvalues: v60 (ref), v19 (ref)
        if #v60.configs:list() == 0 then
            return;
        else
            v19.configs[v60.configs:list()[v60.configs:get()]] = nil;
            local v69 = {};
            for v70, v71 in pairs(v19.configs) do
                if v71 ~= nil then
                    table.insert(v69, v70);
                end;
            end;
            v60.configs:update(v69);
            common.add_notify("ethereal", "Config was deleted!");
            return;
        end;
    end);
    v60.import = v43.home.groups.configs:button("  \239\149\175  Import  ", function()
        -- upvalues: v40 (ref), v27 (ref), l_pui_0 (ref)
        local l_status_1, l_result_1 = pcall(function()
            -- upvalues: v40 (ref), v27 (ref)
            return json.parse(v40.decrypt(v27.get()));
        end);
        if not l_status_1 then
            common.add_notify("ethereal", "Error on export config.");
            return;
        else
            l_pui_0.load(l_result_1);
            common.add_notify("ethereal", "Config was imported!");
            return;
        end;
    end);
    v60.export = v43.home.groups.configs:button("  \239\149\174  Export  ", function()
        -- upvalues: v27 (ref), v40 (ref), l_pui_0 (ref)
        v27.set(v40.encrypt(json.stringify(l_pui_0.save())));
        common.add_notify("ethereal", "Config was exported!");
    end);
    local v74 = {};
    for v75, v76 in pairs(v19.configs) do
        if v76 ~= nil then
            table.insert(v74, v75);
        end;
    end;
    v60.configs:update(v74);
    for v77, v78 in pairs(v42.names) do
        local _ = v42.sn[v77];
        v46.antiaim.builder[v78] = {
            override = v43.antiaim.groups.builder:switch("Override " .. v78), 
            base_yaw = v43.antiaim.groups.builder:combo("\238\130\140   Yaw Type", {
                [1] = "Static", 
                [2] = "L&R", 
                [3] = "Delayed", 
                [4] = "Switcher", 
                [5] = "Layered"
            }, function(v80)
                return {
                    sync_with_desync = v80:switch("\239\141\163  Sync with desync")
                };
            end), 
            offset = v43.antiaim.groups.builder:slider("\239\132\131   Offset", -180, 180, 0, 1, "\194\176"), 
            left_offset = v43.antiaim.groups.builder:slider("\239\132\128   Left Offset", -180, 180, 0, 1, "\194\176"), 
            right_offset = v43.antiaim.groups.builder:slider("\239\132\129   Right Offset", -180, 180, 0, 1, "\194\176"), 
            delay_offset = v43.antiaim.groups.builder:slider("\238\138\158   Delay", 2, 20, 4, 1, "t"), 
            yaw_modifer = v43.antiaim.groups.builder:combo("\238\138\165   Yaw Modifer", {
                [1] = "Disabled", 
                [2] = "Offset", 
                [3] = "Random", 
                [4] = "Center", 
                [5] = "3-Way", 
                [6] = "5-Way"
            }), 
            yaw_modifer_offset = v43.antiaim.groups.builder:slider("Jitter Offset", -180, 180, 0, 1, "\194\176"), 
            body_yaw = v43.antiaim.groups.builder:switch("\238\137\148   Body Yaw", false, function(v81)
                return {
                    desync_inv = v81:switch("Inverter"), 
                    desync_left = v81:slider("Desync Left", 0, 60, 0, 1, "\194\176"), 
                    desync_right = v81:slider("Desync Right", 0, 60, 0, 1, "\194\176"), 
                    options = v81:selectable("Options", {
                        [1] = "Avoid Overlap", 
                        [2] = "Jitter", 
                        [3] = "Randomize Jitter", 
                        [4] = "Anti Bruteforce"
                    }), 
                    freestanding = v81:combo("Freestading", {
                        [1] = "Off", 
                        [2] = "Peek Fake", 
                        [3] = "Peek Real"
                    })
                }, true;
            end), 
            defensive_enable = v43.antiaim.groups.builder:switch("\238\136\188   Defensive AA", false, function(v82)
                return {
                    force_defensive = v82:switch("Force Defensive"), 
                    def_type = v82:combo("Anti-Aim's Type", {
                        [1] = "Always", 
                        [2] = "Delayed", 
                        [3] = "Flick"
                    }), 
                    def_delay = v82:slider("Delay ", 2, 20, 2, 1, "t"), 
                    def_pitch_type = v82:combo("Pitch", {
                        [1] = "Random", 
                        [2] = "Zero", 
                        [3] = "Down", 
                        [4] = "Up", 
                        [5] = "Jitter", 
                        [6] = "Custom"
                    }), 
                    def_pitch_offset = v82:slider("Pitch Jitter", -89, 89, 0, 1, "\194\176"), 
                    def_yaw_type = v82:combo("Yaw Modifer", {
                        [1] = "Random", 
                        [2] = "Side Ways", 
                        [3] = "X-Ways [AUTO]", 
                        [4] = "Jitter", 
                        [5] = "Spin"
                    }), 
                    def_yaw_ways = v82:slider("Ways ", 3, 20, 3), 
                    def_yaw_offset_left = v82:slider("Left Offset", -180, 180, 0, 1, "\194\176"), 
                    def_yaw_offset_right = v82:slider("Right Offset", -180, 180, 0, 1, "\194\176")
                }, true;
            end)
        };
    end;
    for v83 = 1, 10 do
        v46.antiaim.antibrute_aa["Phase " .. v83] = {};
        for v84, v85 in pairs(v42.names) do
            local _ = v42.sn[v84];
            v46.antiaim.antibrute_aa["Phase " .. v83][v85] = {
                override = v43.antiaim.groups.builder:switch("Override " .. v85), 
                base_yaw = v43.antiaim.groups.builder:combo("\238\130\140   Yaw Type", {
                    [1] = "Static", 
                    [2] = "L&R", 
                    [3] = "Delayed", 
                    [4] = "Switcher", 
                    [5] = "Layered"
                }, function(v87)
                    return {
                        sync_with_desync = v87:switch("\239\141\163  Sync with desync")
                    };
                end), 
                offset = v43.antiaim.groups.builder:slider("\239\132\131   Offset", -180, 180, 0, 1, "\194\176"), 
                left_offset = v43.antiaim.groups.builder:slider("\239\132\128   Left Offset", -180, 180, 0, 1, "\194\176"), 
                right_offset = v43.antiaim.groups.builder:slider("\239\132\129   Right Offset", -180, 180, 0, 1, "\194\176"), 
                delay_offset = v43.antiaim.groups.builder:slider("\238\138\158   Delay", 2, 20, 4, 1, "t"), 
                yaw_modifer = v43.antiaim.groups.builder:combo("\238\138\165   Yaw Modifer", {
                    [1] = "Disabled", 
                    [2] = "Offset", 
                    [3] = "Random", 
                    [4] = "Center", 
                    [5] = "3-Way", 
                    [6] = "5-Way"
                }), 
                yaw_modifer_offset = v43.antiaim.groups.builder:slider("Jitter Offset", -180, 180, 0, 1, "\194\176"), 
                body_yaw = v43.antiaim.groups.builder:switch("\238\137\148   Body Yaw", false, function(v88)
                    return {
                        desync_inv = v88:switch("Inverter"), 
                        desync_left = v88:slider("Desync Left", 0, 60, 0, 1, "\194\176"), 
                        desync_right = v88:slider("Desync Right", 0, 60, 0, 1, "\194\176"), 
                        options = v88:selectable("Options", {
                            [1] = "Avoid Overlap", 
                            [2] = "Jitter", 
                            [3] = "Randomize Jitter", 
                            [4] = "Anti Bruteforce"
                        }), 
                        freestanding = v88:combo("Freestading", {
                            [1] = "Off", 
                            [2] = "Peek Fake", 
                            [3] = "Peek Real"
                        })
                    }, true;
                end), 
                defensive_enable = v43.antiaim.groups.builder:switch("\238\136\188   Defensive AA", false, function(v89)
                    return {
                        force_defensive = v89:switch("Force Defensive"), 
                        def_type = v89:combo("Anti-Aim's Type", {
                            [1] = "Always", 
                            [2] = "Delayed", 
                            [3] = "Flick"
                        }), 
                        def_delay = v89:slider("Delay ", 2, 20, 2, 1, "t"), 
                        def_pitch_type = v89:combo("Pitch", {
                            [1] = "Random", 
                            [2] = "Zero", 
                            [3] = "Down", 
                            [4] = "Up", 
                            [5] = "Jitter", 
                            [6] = "Custom"
                        }), 
                        def_pitch_offset = v89:slider("Pitch Jitter", -89, 89, 0, 1, "\194\176"), 
                        def_yaw_type = v89:combo("Yaw Modifer", {
                            [1] = "Random", 
                            [2] = "Side Ways", 
                            [3] = "X-Ways [AUTO]", 
                            [4] = "Jitter", 
                            [5] = "Spin"
                        }), 
                        def_yaw_ways = v89:slider("Ways ", 3, 20, 3), 
                        def_yaw_offset_left = v89:slider("Left Offset", -180, 180, 0, 1, "\194\176"), 
                        def_yaw_offset_right = v89:slider("Right Offset", -180, 180, 0, 1, "\194\176")
                    }, true;
                end)
            };
        end;
    end;
    l_pui_0.setup(v46);
    local v90 = {
        ragebot = {
            def_type = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
            dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            hs_type = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            min_dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
            baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
            hc = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
            heads = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
            bodys = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"), 
            sp = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
        }, 
        antiaim = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
            yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            mod_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            invert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
            left_des = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            right_des = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            by_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            by_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            dym_free = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
            bf_free = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
            baseyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
            fl_lim = ui.find("Aimbot", "Anti Aim", "Fake lag", "Limit"), 
            fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
        }, 
        visuals = {
            so = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
            sc = ui.find("Visuals", "World", "Ambient", "Skybox Changer")
        }, 
        misc = {
            wa = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
            fl = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
            as = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
            sa = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist")
        }
    };
    local v91 = {
        antiaim = {
            peek = false, 
            count_stay = 0, 
            stay_pitch = true, 
            time_to_reset = 0, 
            last_swap = 0, 
            will_switch = 0, 
            peek_time = 0, 
            manuals_over = false, 
            safe_head = false, 
            switch = false, 
            cur_phase = 1, 
            unpredictable = {
                cur_tick = 8, 
                last_swap = 0, 
                will_swap = 0
            }, 
            leg_was = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):get(), 
            layered = {
                can_swap = true, 
                cur_value = 7, 
                prev_value = 2
            }, 
            customizer = {
                will_update = 0, 
                transition = {
                    will_upd = 0, 
                    prev_cond = 0, 
                    data_cond = {}
                }
            }
        }, 
        ragebot = {
            teleport = false, 
            ticks_tp = 0, 
            groundtick = 0, 
            forced_idt = false, 
            was_teleport = false, 
            idealtick = {
                fake_lag_was = 50, 
                tp_tick = 0, 
                teleported = false
            }, 
            dt_was = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get(), 
            da = {
                hboxes = {
                    left_foot = 11, 
                    right_calf = 10, 
                    left_calf = 9, 
                    right_thigh = 8, 
                    left_thigh = 7, 
                    upper_chest = 6, 
                    chest = 5, 
                    lower_chest = 4, 
                    stomach = 3, 
                    pelvis = 2, 
                    neck = 1, 
                    head = 0, 
                    right_forearm = 18, 
                    right_upper_arm = 17, 
                    left_forearm = 16, 
                    left_upper_arm = 15, 
                    right_hand = 14, 
                    left_hand = 13, 
                    right_foot = 12
                }, 
                scan_hboxes = {
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
                is_reachable = {}
            }
        }, 
        defensive = {
            yaw_will_switch = 0, 
            pitch_will_switch = 0, 
            way = 1, 
            pitch_switch = true, 
            yaw_switch = false, 
            pitch_goal = 0, 
            yaw_goal = 0, 
            ways = {}
        }, 
        misc = {
            last_clantag = " ", 
            used_fl = 1, 
            is_grenade = false, 
            curtag = 1, 
            tagswap = 0, 
            throw_nade = false, 
            clantag = {
                [1] = "_", 
                [2] = "", 
                [3] = "_", 
                [4] = "", 
                [5] = "9", 
                [6] = "e", 
                [7] = "e7", 
                [8] = "et", 
                [9] = "et4", 
                [10] = "eth", 
                [11] = "eth9", 
                [12] = "ethe", 
                [13] = "ethe6", 
                [14] = "ether", 
                [15] = "ether9", 
                [16] = "ethere", 
                [17] = "ethere8", 
                [18] = "etherea", 
                [19] = "etherea1", 
                [20] = "ethereal", 
                [21] = "ethereal_", 
                [22] = "ethereal", 
                [23] = "ethereal_", 
                [24] = "ethereal", 
                [25] = "ethereal", 
                [26] = "etherea1", 
                [27] = "ethere8", 
                [28] = "ether9", 
                [29] = "ethe6", 
                [30] = "eth9", 
                [31] = "et4", 
                [32] = "e7", 
                [33] = "9", 
                [34] = "", 
                [35] = "", 
                [36] = ""
            }, 
            last_angles = vector(0, 0, 0), 
            target_angles = vector(0, 0, 0), 
            trashtalk = {
                on_death = {
                    [1] = "u can't win me. u can be weak, dog.", 
                    [2] = "blades in my hands... I want revenge...", 
                    [3] = "only a human can kill monster...", 
                    [4] = "eat my heart", 
                    [5] = "save my mind", 
                    [6] = "lua trash? nah, u lucky monster. die."
                }, 
                on_kill = {
                    [1] = "where are enemies?", 
                    [2] = "1", 
                    [3] = "walkbot kicked", 
                    [4] = "why you missed? xD", 
                    [5] = "..,,``1``,,..", 
                    [6] = "1, poor kid", 
                    [7] = "knives killed u", 
                    [8] = "blessed by ethereal", 
                    [9] = "buy ethereal - be better", 
                    [10] = "What? What am I using? Ethereal", 
                    [11] = "droped by ethereal"
                }
            }, 
            super_toss = {
                vel_gw = vector(), 
                angles_gw = vector(), 
                last_vel_gw = vector()
            }
        }, 
        visuals = {
            nofications = {
                max_size_x = 0, 
                mxa_size_y = 0
            }
        }, 
        ffi_vars = {
            set_clantag = ffi.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15")), 
            fx_electric_spark = ffi.cast("FX_ElectricSparkFn", utils.opcode_scan("client.dll", "55 8B EC 83 EC 3C 53 8B D9 89 55 FC 8B 0D ?? ?? ?? ?? 56 57")), 
            QAngle = ffi.new("vector_t"), 
            vec3 = ffi.new("vector_t")
        }, 
        fonts = {
            rounded_bold = render.load_font("Arial", 11, "ab"), 
            rounded = render.load_font("Arial", 13, "a"), 
            main_font = render.load_font("Arial", 11, nil), 
            icons = render.load_font("Arial", 23, "a")
        }, 
        render = {
            builder = false, 
            antibrute = false, 
            last_damage = 1, 
            logs = {}, 
            keybinds = {
                width = 0
            }
        }, 
        animation = {
            time_count = 0, 
            alpha = 0, 
            start_time = true, 
            start = true, 
            font_logo = render.load_font("Arial", 150, "a")
        }, 
        materials = {}
    };
    v91.ffi_vars.QAngle.x = 0;
    v91.ffi_vars.QAngle.y = 0;
    v91.ffi_vars.QAngle.z = 0;
    v91.materials.spark_material = materials.get("effects/spark", true);
    v91.materials.vgui = materials.get_materials("vgui");
    local v92 = nil;
    local v93 = 0;
    local v170 = {
        get_condition = function(v94)
            -- upvalues: v91 (ref), v90 (ref), v46 (ref), v92 (ref), v93 (ref)
            if not v91.cmd then
                return;
            else
                local v95 = entity.get_local_player();
                if not v95 then
                    return v94 and "" or nil;
                elseif not v95:is_alive() then
                    return v94 and "" or nil;
                else
                    local v96 = v95.m_vecVelocity:length2d() > 5;
                    local v97 = v91.cmd.in_jump or bit.band(v95.m_fFlags, 1) == 0;
                    local v98 = v95.m_flDuckAmount > 0.1;
                    local v99 = v91.cmd.in_speed or v90.antiaim.slowwalk:get();
                    if v46.antiaim.enable_customize:get() and v46.antiaim.type_transition.predictive:get() then
                        local v100 = v95:simulate_movement();
                        v100:think(v46.antiaim.type_transition.pr_ticks:get());
                        v97 = v100.velocity.z > 10 or v100.velocity.z < -10;
                        v96 = v100.velocity:length2d() > 5;
                        v98 = v100.duck_amount > 0.1;
                    end;
                    local v101 = not v96;
                    local l_v96_0 = v96;
                    local v103;
                    if v97 then
                        v103 = not v98;
                    else
                        v103 = v97;
                    end;
                    local v104;
                    if v97 then
                        v104 = v98;
                    else
                        v104 = v97;
                    end;
                    if v92 ~= nil and not v97 then
                        v93 = v93 < 128 and v93 + 1 or -5;
                        if v93 < 0 then
                            v93 = 0;
                            v92 = nil;
                        else
                            local v105;
                            if v92 == "A+C" then
                                v105 = v94 and "air crouch" or "Jumping in Crouch";
                            else
                                v105 = v94 and "in air" or "Jumping";
                            end;
                            return v105;
                        end;
                    end;
                    if v104 then
                        v92 = "A+C";
                        return v94 and "air crouch" or "Jumping in Crouch";
                    elseif v103 then
                        v92 = "A";
                        return v94 and "in air" or "Jumping";
                    elseif v98 then
                        return v94 and "crouch" or "Crouching";
                    elseif v99 then
                        return v94 and "slow walk" or "Slow Walking";
                    elseif l_v96_0 then
                        return v94 and "run" or "Running";
                    elseif v101 then
                        return v94 and "stand" or "Standing";
                    else
                        return v94 and "shared" or "Shared";
                    end;
                end;
            end;
        end, 
        can_hit = function(v106, v107, v108, v109, v110)
            if not v106 then
                return false;
            elseif not v106:is_alive() or v106:is_dormant() then
                return false;
            else
                local v111 = {
                    head = {
                        [1] = 0, 
                        [2] = 1
                    }, 
                    chest = {
                        [1] = 4, 
                        [2] = 5, 
                        [3] = 6
                    }, 
                    stomach = {
                        [1] = 2, 
                        [2] = 3
                    }, 
                    arms = {
                        [1] = 13, 
                        [2] = 14, 
                        [3] = 15, 
                        [4] = 16, 
                        [5] = 17, 
                        [6] = 18
                    }, 
                    legs = {
                        [1] = 7, 
                        [2] = 8, 
                        [3] = 9, 
                        [4] = 10
                    }, 
                    feets = {
                        [1] = 11, 
                        [2] = 12
                    }
                };
                if v109 == "all" then
                    for v112 = 1, 6 do
                        local v113 = v111[({
                            [1] = "head", 
                            [2] = "chest", 
                            [3] = "stomach", 
                            [4] = "arms", 
                            [5] = "legs", 
                            [6] = "feets"
                        })[v112]];
                        for v114 = 1, #v113 do
                            local v115, _ = utils.trace_bullet(v106, v108, v107:get_hitbox_position(v113[v114]));
                            if v110 <= v115 then
                                return true;
                            end;
                        end;
                    end;
                else
                    for v117 = 1, #v109 do
                        local v118 = v111[v109[v117]];
                        for v119 = 1, #v118 do
                            local v120, _ = utils.trace_bullet(v106, v108, v107:get_hitbox_position(v118[v119]));
                            if v110 <= v120 then
                                return true;
                            end;
                        end;
                    end;
                end;
                return false;
            end;
        end, 
        lerp = function(v122, v123, v124)
            return v122 * (1 - v124) + v123 * v124;
        end, 
        round = function(v125, v126)
            return math.floor(v125 * 10 ^ (v126 or 0)) / 10 ^ (v126 or 0);
        end, 
        clamp = function(v127, v128, v129)
            return math.min(math.max(v127, v128), v129);
        end, 
        set_clantag = function(v130)
            -- upvalues: v91 (ref)
            if v130 == v91.misc.last_clantag then
                return;
            else
                v91.ffi_vars.set_clantag(v130, v130);
                v91.misc.last_clantag = v130;
                return;
            end;
        end, 
        findItem = function(v131, v132)
            for v133, v134 in ipairs(v131) do
                if v134 == v132 then
                    return v133;
                end;
            end;
            return false;
        end, 
        window_create = function(v135, v136, v137, v138, v139, v140, v141, v142)
            -- upvalues: v91 (ref), v41 (ref)
            if not v141 then
                local v143 = 10 + render.measure_text(v91.fonts.rounded, "a", v140).y;
                v139 = v139 < 1 and math.max(0, v139 - 0.5) or 1;
                render.shadow(vector(v135 + v137 / 30, v136 + v143 / 3 - 1), vector(v135 + v137 - v137 / 15, v136 + v143 / 3 + 1), color(v138.r, v138.g, v138.b, v139 * 255), 100, 10);
                render.rect(vector(v135 - 2, v136), vector(v135 + v137 + 2, v136 + v143), color(v138.r, v138.g, v138.b, math.abs(v139 == 0 and 0 or v139 - 0.1) * 255), 5);
                render.rect(vector(v135, v136), vector(v135 + v137, v136 + v143), color(20, v139 * 255), 5);
                render.text(v91.fonts.rounded, vector(v135 + v137 / 2, v136 + v143 / 2), color(255, v139 * 255), "c", v140);
            elseif not globals.is_in_game then
                return;
            else
                local v144 = 20 + render.measure_text(v91.fonts.rounded, "a", v140).y;
                local v145 = 55 + render.measure_text(v91.fonts.rounded, "a", v41.user.name).x;
                if not v142 then
                    v142 = {};
                end;
                local v146 = v135 - (#v142 == 0 and v145 or #v142 == 1 and v145 + 30 + render.measure_text(v91.fonts.rounded, "a", v142[1]).x or v135 + v145 + 60 + render.measure_text(v91.fonts.rounded, "a", v142[1]).x + render.measure_text(v91.fonts.rounded, "a", v142[2]).x) / 12;
                render.blur(vector(v146 + v137 - v137 / 5, v136 + v144 / 3 / 2 / 2), vector(v146 + v137 + v145, v136 + v144 / 3 * 2 + v144 / 3), 3, 255, 5);
                render.texture(entity.get_local_player():get_steam_avatar(), vector(v146 + v137 + 12, v136 + v144 / 2 - 10), vector(20, 20), color(255), nil, 20);
                render.text(v91.fonts.rounded, vector(v146 + v137 + 37, v136 + v144 / 2 - 7.5), color(255), nil, v41.user.name);
                if #v142 ~= 0 then
                    local v147 = v146 + v137 + v145;
                    for v148 = 1, #v142 do
                        local v149 = 30 + render.measure_text(v91.fonts.rounded, "a", v142[v148]).x;
                        render.blur(vector(v147 + v149, v136 + v144 / 3 / 2 / 2), vector(v147, v136 + v144 / 3 * 2 + v144 / 3), 3, 255, 5);
                        render.text(v91.fonts.rounded, vector(v147 + 15, v136 + v144 / 2 - 7.5), color(255), nil, v142[v148]);
                        render.shadow(vector(v147 - 2, v136 + v144 / 3), vector(v147, v136 + v144 - v144 / 3), v138, 20, 0, 10);
                        render.rect(vector(v147 - 1, v136 + v144 / 3), vector(v147 + 1, v136 + v144 - v144 / 3), v138, 1);
                        v147 = v147 + v149;
                    end;
                end;
                render.shadow(vector(v146, v136 + 1), vector(v146 + 5, v136 + v144 - 1), v138, 30, 0, 10);
                render.rect(vector(v146 - 3, v136), vector(v146 + 20, v136 + v144), v138, 10);
                render.rect(vector(v146, v136), vector(v146 + v137, v136 + v144), color(20), 10);
                render.text(v91.fonts.rounded, vector(v146 + v137 / 2, v136 + v144 / 2), color(255), "c", v140);
            end;
        end, 
        get_max_size_text = function(v150, v151, v152)
            local v153 = 0;
            for _, v155 in pairs(v150) do
                local v156 = v152 == "x" and render.measure_text(v151, "a", v155.text).x or render.measure_text(v151, "a", v155.text).y;
                if v153 < v156 then
                    v153 = v156;
                end;
            end;
            return v153;
        end, 
        animations = {
            speed = 6.2, 
            multiplier = 0, 
            stored_values = {}, 
            active_this_frame = {}, 
            prev_realtime = globals.realtime, 
            realtime = globals.realtime, 
            clamp = function(v157, v158, v159)
                return v159 < v157 and v159 or v157 < v158 and v158 or v157;
            end, 
            new_frame = function(v160)
                v160.prev_realtime = v160.realtime;
                v160.realtime = globals.realtime;
                v160.multiplier = (v160.realtime - v160.prev_realtime) * v160.speed;
                for v161, _ in pairs(v160.stored_values) do
                    if v160.active_this_frame[v161] == nil then
                        v160.stored_values[v161] = nil;
                    end;
                end;
                v160.active_this_frame = {};
            end, 
            animate = function(v163, v164, v165, v166, v167)
                if not v166 then
                    v166 = 1;
                end;
                if not v167 then
                    v167 = 0;
                end;
                if not v165 then
                    v165 = false;
                end;
                local v168 = v163.multiplier * (v165 and -1 or 1);
                local v169 = v163.clamp(v163.stored_values[v164] and v163.stored_values[v164] or v167, v167, v166);
                v169 = v163.clamp(v169 + v168, v167, v166);
                v163.stored_values[v164] = v169;
                v163.active_this_frame[v164] = true;
                return v169;
            end
        }
    };
    v170.condition_changed = function()
        -- upvalues: v91 (ref), v170 (ref)
        if globals.tickcount >= v91.antiaim.customizer.transition.will_upd then
            if #v91.antiaim.customizer.transition.data_cond > 20 then
                local v171 = #v91.antiaim.customizer.transition.data_cond == 0 and 0 or 1;
                for v172 = v171, #v91.antiaim.customizer.transition.data_cond do
                    if v172 + 1 < #v91.antiaim.customizer.transition.data_cond then
                        v91.antiaim.customizer.transition.data_cond[v172] = v91.antiaim.customizer.transition.data_cond[v172 + 1];
                    elseif v172 + 1 == #v91.antiaim.customizer.transition.data_cond then
                        v91.antiaim.customizer.transition.data_cond[v172] = v170.get_condition(true);
                    else
                        v91.antiaim.customizer.transition.data_cond[v172] = nil;
                    end;
                end;
            else
                v91.antiaim.customizer.transition.data_cond[#v91.antiaim.customizer.transition.data_cond + 1] = v170.get_condition(true);
            end;
            v91.antiaim.customizer.transition.will_upd = globals.tickcount + 1;
        end;
        return v170.get_condition(true) ~= v91.antiaim.customizer.transition.prev_cond;
    end;
    v170.logs_render = l_system_0.register({
        [1] = v46.misc.not_vis.logs_x, 
        [2] = v46.misc.not_vis.logs_y
    }, vector(227, 120), "Logs", function(v173)
        -- upvalues: v46 (ref), v91 (ref), v170 (ref)
        local v174 = {
            [1] = {
                text = "Missed shot at jstokyo_ in head", 
                color = v46.misc.aimbotlogs.color_miss:get()
            }, 
            [2] = {
                text = "Hit noname in head for 101 dmg", 
                color = v46.misc.aimbotlogs.color_hit:get()
            }, 
            [3] = {
                text = "Hit walkbot in chest for 15 dmg", 
                color = v46.misc.aimbotlogs.color_hit:get()
            }
        };
        local v175 = 3;
        local _ = render.screen_size() * 0.5;
        if ui.get_alpha() < 0.3 then
            if not globals.is_connected then
                return;
            else
                local v177 = #v91.render.logs;
                if v177 > 10 then
                    for v178 = 0, v177 - 10 do
                        if not v91.render.logs[v178] then
                            return;
                        else
                            if v91.render.logs[v178].text then
                                v91.render.logs[v178].text = string.gsub(v91.render.logs[v178].text, "\n", function()
                                    return " ";
                                end);
                            end;
                            v170.animations.stored_values[v178 .. " log"] = v170.animations.stored_values[v178 + 1 .. " log"];
                            v91.render.logs[v178] = v178 ~= v177 and v91.render.logs[v178 + 1] or nil;
                            if v178 ~= v177 then
                                v170.animations.stored_values[v178 + 1 .. " log"] = nil;
                                v91.render.logs[v178 + 1] = nil;
                            end;
                        end;
                    end;
                end;
                local l_x_0 = v173.position.x;
                v91.visuals.nofications.max_size_x = 163;
                v91.visuals.nofications.max_size_y = #v91.render.logs * 40;
                for v180 = 0, #v91.render.logs do
                    if v180 ~= 0 and v91.render.logs[v180] ~= nil then
                        local v181 = v170.animations:animate(v180 .. " log", v91.render.logs[v180].time <= globals.curtime);
                        local v182 = render.measure_text(v91.fonts.rounded, "a", v91.render.logs[v180].text);
                        render.blur(vector(l_x_0 + v91.visuals.nofications.max_size_x / 2 - v182.x / 1.8 + 40, v173.position.y + v175 * v181 + 3), vector(l_x_0 + v91.visuals.nofications.max_size_x / 2 + v182.x / 1.6 + 40, v173.position.y + v175 * v181 + v182.y * 1.4 + 10), 10, 255, 5);
                        render.text(v91.fonts.rounded, vector(l_x_0 + v91.visuals.nofications.max_size_x / 2 + v182.x / 2 - v182.x / 1.9 + 40 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").x, v173.position.y + v175 * v181 + v182.y * 0.7 + 6), color(255, 255 * v181), "c", v91.render.logs[v180].text);
                        local v183 = l_x_0 + 3 + (v91.visuals.nofications.max_size_x - v182.x) / 2;
                        local v184 = v173.position.y + v175 * v181;
                        local v185 = 25 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").x;
                        local v186 = 20 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").y;
                        render.shadow(vector(v183, v184 + 1), vector(v183 + 5, v184 + v186 - 1), v91.render.logs[v180].color:alpha_modulate(v181 * 255), 30, 0, 5);
                        render.rect(vector(v183 - 3, v184), vector(v183 + 20, v184 + v186), v91.render.logs[v180].color:alpha_modulate(v181 * 255), 5);
                        render.rect(vector(v183, v184), vector(v183 + v185, v184 + v186), color(20, 255 * v181), 5);
                        render.text(v91.fonts.rounded, vector(v183 + v185 / 2, v184 + v186 / 2), v91.render.logs[v180].color:alpha_modulate(v181 * 255), "c", "\238\128\131");
                        if v181 > 0 then
                            local v187 = v175 + 40;
                            if v187 then
                                v175 = v187;
                            end;
                        end;
                        if v181 <= 0 then
                            if v177 > 1 then
                                for v188 = v180, v177 do
                                    v170.animations.stored_values[v188 .. " log"] = v170.animations.stored_values[v188 + 1 .. " log"];
                                    v91.render.logs[v188] = v188 ~= v177 and v91.render.logs[v188 + 1] or nil;
                                    if v188 ~= v177 then
                                        v170.animations.stored_values[v188 + 1 .. " log"] = nil;
                                        v91.render.logs[v188 + 1] = nil;
                                    end;
                                end;
                            else
                                v91.render.logs[v180] = nil;
                            end;
                        end;
                    end;
                end;
            end;
        else
            v91.visuals.nofications.max_size_x = v170.get_max_size_text(v174, v91.fonts.rounded, "x");
            v91.visuals.nofications.max_size_y = #v174 * 40;
            local v189 = ui.get_mouse_position();
            local v190 = color(255, 255 * v170.animations:animate("logs render rect mouse", not common.is_button_down(1) and not common.is_button_down(4), 1, 0.25) * v170.animations:animate("logs render rect", v189.x <= v173.position.x or not (v189.x < v173.position.x + 227) or not (v189.y > v173.position.y) or v189.y >= v173.position.y + 120));
            render.rect_outline(vector(v173.position.x, v173.position.y), vector(227 + v173.position.x, v91.visuals.nofications.max_size_y + v173.position.y), v190);
            render.text(v91.fonts.rounded, vector(v173.position.x, v91.visuals.nofications.max_size_y + v173.position.y), v190, nil, "LBM - Drag and drop\nMBM - Drag to center of screen");
            if common.is_button_down(4) and v190.a > 0.25 then
                v173.position.x = v170.lerp(v173.position.x, render.screen_size().x / 2 - 113, 0.5);
                v46.misc.not_vis.logs_x:set(v173.position.x);
            end;
            for v191 = 1, #v174 do
                local v192 = ui.get_alpha();
                local v193 = render.measure_text(v91.fonts.rounded, "a", v174[v191].text);
                render.blur(vector(v173.position.x + v91.visuals.nofications.max_size_x / 2 - v193.x / 1.8 + 40, v173.position.y + v175 * v192 + 3), vector(v173.position.x + v91.visuals.nofications.max_size_x / 1.8 + v193.x / 1.8 + 40, v173.position.y + v175 * v192 + v193.y * 1.4 + 10), 10, 255, 5);
                render.text(v91.fonts.rounded, vector(v173.position.x + v91.visuals.nofications.max_size_x / 2 + v193.x / 2 - v193.x / 1.9 + 40 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").x, v173.position.y + v175 * v192 + v193.y * 0.7 + 6), color(255, 255 * v192), "c", v174[v191].text);
                local v194 = v173.position.x + 3 + (v91.visuals.nofications.max_size_x - v193.x) / 2;
                local v195 = v173.position.y + v175 * v192;
                local v196 = 25 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").x;
                local v197 = 20 + render.measure_text(v91.fonts.rounded, "a", "\238\128\131").y;
                render.shadow(vector(v194, v195 + 1), vector(v194 + 5, v195 + v197 - 1), v174[v191].color:alpha_modulate(v192 * 255), 30, 0, 5);
                render.rect(vector(v194 - 3, v195), vector(v194 + 20, v195 + v197), v174[v191].color:alpha_modulate(v192 * 255), 5);
                render.rect(vector(v194, v195), vector(v194 + v196, v195 + v197), color(20, 255 * v192), 5);
                render.text(v91.fonts.rounded, vector(v194 + v196 / 2, v195 + v197 / 2), v174[v191].color:alpha_modulate(v192 * 255), "c", "\238\128\131");
                if v192 > 0 then
                    local v198 = v175 + 40;
                    if v198 then
                        v175 = v198;
                    end;
                end;
            end;
        end;
    end);
    v170.update_hittable = function()
        -- upvalues: v170 (ref), v41 (ref)
        local v199 = entity.get_local_player();
        if not v199 then
            return;
        elseif not v199:is_alive() then
            return;
        else
            entity.get_players(true, false, function(v200)
                -- upvalues: v170 (ref), v199 (ref), v41 (ref)
                if v200 and v200:is_alive() and not v200:is_dormant() then
                    if v170.can_hit(v199, v200, v199:get_eye_position(), {
                        [1] = "head", 
                        [2] = "stomach", 
                        [3] = "arms", 
                        [4] = "feets"
                    }, 1) then
                        table.insert(v41.client.hittable, v200);
                    else
                        local v201 = v170.findItem(v41.client.hittable, v200);
                        if v201 then
                            table.remove(v41.client.hittable, v201);
                        end;
                    end;
                end;
            end);
            return;
        end;
    end;
    v170.super_toss = {};
    v170.super_toss.ray_circle_intersection = function(v202, v203, v204)
        if math.abs(v202.x) > math.abs(v202.y) then
            local v205 = v202.y / v202.x;
            local v206 = 1 + v205 * v205;
            local v207 = -2 * v203.x - 2 * v205 * v203.y;
            local v208 = v203:length2dsqr() - v204 * v204;
            local v209 = v207 * v207 - 4 * v206 * v208;
            if v209 < 0 then
                return v203 + (v202 * v203:dot(v202) - v203):normalized() * v204;
            elseif v209 < 0.001 then
                local v210 = -v207 / (2 * v206);
                local v211 = v205 * v210;
                return vector(v210, v211);
            else
                local v212 = math.sqrt(v209);
                local v213 = (-v207 + v212) / (2 * v206);
                local v214 = v205 * v213;
                local v215 = vector(v213, v214);
                v213 = (-v207 - v212) / (2 * v206);
                v214 = v205 * v213;
                local v216 = vector(v213, v214);
                if v202:dot(v215) > v202:dot(v216) then
                    return v215;
                else
                    return v216;
                end;
            end;
        else
            local v217 = v202.x / v202.y;
            local v218 = 1 + v217 * v217;
            local v219 = -2 * v203.y - 2 * v217 * v203.x;
            local v220 = v203:length2dsqr() - v204 * v204;
            local v221 = v219 * v219 - 4 * v218 * v220;
            if v221 < 0 then
                return v203 + (v202 * v203:dot(v202) - v203):normalized() * v204;
            elseif v221 < 0.001 then
                local v222 = -v219 / (2 * v218);
                local v223 = v217 * v222;
                return vector(v223, v222);
            else
                local v224 = math.sqrt(v221);
                local v225 = (-v219 + v224) / (2 * v218);
                local v226 = v217 * v225;
                local v227 = vector(v226, v225);
                v225 = (-v219 - v224) / (2 * v218);
                v226 = v217 * v225;
                local v228 = vector(v226, v225);
                if v202:dot(v227) > v202:dot(v228) then
                    return v227;
                else
                    return v228;
                end;
            end;
        end;
    end;
    v170.super_toss.calculate_throw_yaw = function(v229, v230, v231, v232)
        -- upvalues: v170 (ref)
        local v233 = v229:clone();
        v233.z = 0;
        v233:normalize();
        local v234 = v233:dot(v229) / v229:length();
        local v235 = 1.399;
        return (v170.super_toss.ray_circle_intersection(v233, v230 * v235, v170.clamp(v231 * 0.9, 15, 750) * (v170.clamp(v232, 0, 1) * 0.7 + 0.3) * v234) - v230 * v235):angles().y;
    end;
    v170.super_toss.calculate_throw_pitch = function(v236, v237, v238, v239, v240)
        -- upvalues: v170 (ref)
        local v241 = v170.clamp(v239 * 0.9, 15, 750) * (v170.clamp(v240, 0, 1) * 0.7 + 0.3);
        local v242 = v238 * 1.25 + v236 * v241;
        local v243 = vector(v238.x, v238.y, -v237) * 1.25 + v236 * v241;
        local v244 = v242:angles();
        local v245 = v243:angles().x - v244.x;
        return v170.clamp(v245 * (math.sin(math.rad(v245)) + 1), -89, 89);
    end;
    local v469 = {
        antiaim = {
            builder = function(v246)
                -- upvalues: v46 (ref), v91 (ref), v90 (ref), v170 (ref)
                if v46.antiaim.type:get() == 1 then
                    return;
                elseif not globals.is_connected and v46.antiaim.enable_customize:get() and v46.antiaim.type_transition:get() == 2 then
                    v91.antiaim.customizer.transition.data_cond = {};
                    return;
                else
                    local v247 = entity.get_local_player();
                    if not v247 then
                        return;
                    elseif not v247:is_alive() then
                        return;
                    else
                        v90.antiaim.enabled:set(not entity.get_game_rules().m_bWarmupPeriod or not v46.antiaim.tweaks:get(1));
                        if v91.antiaim.manuals_over or v91.antiaim.safe_head or entity.get_game_rules().m_bWarmupPeriod and v46.antiaim.tweaks:get(1) then
                            return;
                        else
                            local v248 = v170.get_condition(false);
                            local v249 = v46.antiaim.type:get() == 2 and (not v46.antiaim.builder[v248].override:get() and v46.antiaim.builder.Shared or v46.antiaim.builder[v248]) or not v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase][v248].override:get() and v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase].Shared or v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase][v248];
                            v90.antiaim.freestanding:set(v46.antiaim.freestanding:get());
                            v90.antiaim.dym_free:set(v46.antiaim.freestanding.disable_yaw_modif:get());
                            v90.antiaim.bf_free:set(v46.antiaim.freestanding.freestanding_by:get());
                            v90.antiaim.yaw:override("Backward");
                            v90.antiaim.bodyyaw:override(v249.body_yaw:get());
                            v90.antiaim.invert:override(v249.body_yaw.desync_inv:get());
                            v90.antiaim.by_options:override(v249.body_yaw.options:get());
                            v90.antiaim.by_freestanding:override(v249.body_yaw.freestanding:get());
                            if v46.antiaim.enable_customize:get() and v46.antiaim.delay_antiaims:get() ~= 0 then
                                if v91.antiaim.customizer.will_update > globals.curtime then
                                    return;
                                else
                                    v91.antiaim.customizer.will_update = globals.curtime + v46.antiaim.delay_antiaims:get();
                                end;
                            end;
                            local function v254(v250, v251, v252, v253)
                                -- upvalues: v46 (ref)
                                return v46.antiaim.randomization_antiaims:get() ~= 0 and math.max(math.min(math.floor(v250 + v251 * math.random(-1, 1) * (v46.antiaim.randomization_antiaims:get() / 100)), v252), v253) or v250;
                            end;
                            local function v260(v255, v256, v257, v258, v259)
                                -- upvalues: v46 (ref), v170 (ref), v254 (ref)
                                return v46.antiaim.enable_customize:get() and (v46.antiaim.type_transition:get() == 2 and v170.condition_changed() and math.floor(v170.lerp(v259 ~= nil and v259 or 0, v254(v255, v256, v257, v258), 0.3)) or v254(v255, v256, v257, v258)) or v255;
                            end;
                            v90.antiaim.left_des:override(v260(v249.body_yaw.desync_left:get(), 10, 60, 0, v90.antiaim.left_des:get_override()));
                            v90.antiaim.right_des:override(v260(v249.body_yaw.desync_right:get(), 10, 60, 0, v90.antiaim.right_des:get_override()));
                            local v261 = v249.defensive_enable:get() and not v91.misc.is_grenade and (v90.ragebot.dt:get() or v90.ragebot.hs:get()) and rage.exploit:get() == 1 and v247:get_player_weapon(false):get_weapon_info().weapon_type ~= 0;
                            if v249.defensive_enable.def_type:get() == "Flick" and v261 then
                                v261 = globals.tickcount % v249.defensive_enable.def_delay:get() == 0 or globals.tickcount % v249.defensive_enable.def_delay:get() == math.floor(v249.defensive_enable.def_delay:get() / 2);
                            end;
                            if v261 and v249.defensive_enable.force_defensive:get() then
                                v246.force_defensive = true;
                                v90.ragebot.def_type:override("Always On");
                                v90.ragebot.hs_type:override("Break LC");
                            else
                                v246.force_defensive = false;
                                v90.ragebot.def_type:override(v91.misc.is_grenade and "Disabled" or nil);
                                v90.ragebot.hs_type:override(v91.misc.is_grenade and "Favor Fake Lag" or nil);
                            end;
                            v90.antiaim.hidden:set(v261);
                            if v261 then
                                local v262 = false;
                                local v263 = false;
                                if v249.defensive_enable.def_type:get() == "Delayed" then
                                    v262 = globals.tickcount % v249.defensive_enable.def_delay:get() == 0;
                                    v263 = globals.tickcount % v249.defensive_enable.def_delay:get() == 0;
                                else
                                    v262 = globals.tickcount % 2 == 0;
                                    v263 = globals.tickcount % 2 == 0;
                                end;
                                if v262 then
                                    if v249.defensive_enable.def_yaw_type:get() == "X-Ways [AUTO]" then
                                        v91.defensive.way = v249.defensive_enable.def_type:get() == "Delayed" and v91.defensive.way + 1 or globals.tickcount % 2 == 0 and v91.defensive.way + 1 or v91.defensive.way;
                                        if v91.defensive.way > v249.defensive_enable.def_yaw_ways:get() then
                                            v91.defensive.way = 1;
                                        end;
                                    else
                                        v91.defensive.yaw_switch = not v91.defensive.yaw_switch;
                                    end;
                                    if v249.defensive_enable.def_yaw_type:get() == "Random" then
                                        v91.defensive.yaw_goal = utils.random_int(-180, 180);
                                    elseif v249.defensive_enable.def_yaw_type:get() == "Side Ways" then
                                        v91.defensive.yaw_goal = v91.defensive.yaw_switch and -90 or 90;
                                    elseif v249.defensive_enable.def_yaw_type:get() == "X-Ways [AUTO]" then
                                        for v264 = 1, v249.defensive_enable.def_yaw_ways:get() do
                                            if v264 > 1 then
                                                v91.defensive.ways[v264] = (180 - 180 % v249.defensive_enable.def_yaw_ways:get()) / v249.defensive_enable.def_yaw_ways:get() * v264;
                                                if v91.defensive.ways[v264] > 180 then
                                                    repeat
                                                        v91.defensive.ways[v264] = v91.defensive.ways[v264] - 180;
                                                    until v91.defensive.ways[v264] > 180;
                                                elseif v91.defensive.ways[v264] < -180 then
                                                    repeat
                                                        v91.defensive.ways[v264] = v91.defensive.ways[v264] + 180;
                                                    until v91.defensive.ways[v264] < -180;
                                                end;
                                            else
                                                v91.defensive.ways[v264] = (180 - 180 % v249.defensive_enable.def_yaw_ways:get()) / v249.defensive_enable.def_yaw_ways:get();
                                            end;
                                        end;
                                        v91.defensive.yaw_goal = globals.tickcount % 3 == 1 and (utils.random_int(1, 2) == 1 and v91.defensive.ways[v91.defensive.way] * -1 or v91.defensive.ways[v91.defensive.way]) or utils.random_int(1, 2) == 2 and v91.defensive.ways[v91.defensive.way] * -1 or v91.defensive.ways[v91.defensive.way];
                                    elseif v249.defensive_enable.def_yaw_type:get() == "Jitter" then
                                        v91.defensive.yaw_goal = v91.defensive.yaw_switch and v249.defensive_enable.def_yaw_offset_left:get() or v249.defensive_enable.def_yaw_offset_right:get();
                                    elseif v249.defensive_enable.def_yaw_type:get() == "Spin" then
                                        v91.defensive.yaw_goal = v91.defensive.yaw_goal + 10;
                                    end;
                                end;
                                if v263 then
                                    v91.defensive.pitch_switch = not v91.defensive.pitch_switch;
                                    if v249.defensive_enable.def_pitch_type:get() == "Random" then
                                        v91.defensive.pitch_goal = utils.random_int(-89, 89);
                                    elseif v249.defensive_enable.def_pitch_type:get() == "Jitter" then
                                        v91.defensive.pitch_goal = v91.defensive.pitch_switch and v249.defensive_enable.def_pitch_offset:get() or v249.defensive_enable.def_pitch_offset:get() * -1;
                                    end;
                                end;
                                if v249.defensive_enable.def_pitch_type:get() == "Up" then
                                    v91.defensive.pitch_goal = -89;
                                elseif v249.defensive_enable.def_pitch_type:get() == "Down" then
                                    v91.defensive.pitch_goal = 89;
                                elseif v249.defensive_enable.def_pitch_type:get() == "Zero" then
                                    v91.defensive.pitch_goal = 0;
                                elseif v249.defensive_enable.def_pitch_type:get() == "Custom" then
                                    v91.defensive.pitch_goal = v249.defensive_enable.def_pitch_offset:get();
                                end;
                                rage.antiaim:override_hidden_pitch(v91.defensive.pitch_goal);
                                rage.antiaim:override_hidden_yaw_offset(math.min(math.max(v91.defensive.yaw_goal - 180), 180));
                                v90.antiaim.offset:override(0);
                                v90.antiaim.yaw_mod:override("Disabled");
                            else
                                if v46.antiaim.freestanding:get() and v46.antiaim.freestanding.yaw_static:get() and not rage.antiaim:get_target(true) then
                                    v90.antiaim.offset:override(0);
                                else
                                    local v265 = v249.base_yaw:get();
                                    if v265 ~= "Static" then
                                        if v265 == "Delayed" then
                                            if globals.tickcount % v249.delay_offset:get() == 0 then
                                                if v249.base_yaw.sync_with_desync:get() then
                                                    v91.antiaim.switch = rage.antiaim:inverter();
                                                else
                                                    v91.antiaim.switch = not v91.antiaim.switch;
                                                end;
                                            end;
                                        elseif v265 == "L&R" then
                                            if v249.base_yaw.sync_with_desync:get() then
                                                v91.antiaim.switch = rage.antiaim:inverter();
                                            else
                                                v91.antiaim.switch = not v91.antiaim.switch;
                                            end;
                                        elseif v265 == "Switcher" then
                                            if v246.tickcount % v91.antiaim.unpredictable.cur_tick == 0 then
                                                if v249.base_yaw.sync_with_desync:get() then
                                                    v91.antiaim.switch = rage.antiaim:inverter();
                                                else
                                                    v91.antiaim.switch = not v91.antiaim.switch;
                                                end;
                                                v91.antiaim.unpredictable.will_swap = v246.tickcount + v91.antiaim.unpredictable.cur_tick;
                                                v91.antiaim.unpredictable.last_swap = v246.tickcount;
                                            end;
                                        elseif v265 == "Layered" then
                                            local function v269(v266, v267, v268)
                                                if v267 == 0 and v266 == 0 then
                                                    return not v268;
                                                else
                                                    return v268;
                                                end;
                                            end;
                                            if not v91.antiaim.layered.can_swap then
                                                if globals.tickcount % v91.antiaim.layered.cur_value == globals.tickcount % v91.antiaim.layered.prev_value and globals.tickcount % v91.antiaim.layered.prev_value ~= 0 then
                                                    if v249.base_yaw.sync_with_desync:get() then
                                                        v91.antiaim.switch = rage.antiaim:inverter();
                                                    else
                                                        v91.antiaim.switch = not v91.antiaim.switch;
                                                    end;
                                                else
                                                    v91.antiaim.switch = v269(globals.tickcount % v91.antiaim.layered.cur_value, globals.tickcount % v91.antiaim.layered.prev_value, v91.antiaim.switch);
                                                end;
                                                v91.antiaim.layered.prev_value = v91.antiaim.layered.cur_value;
                                                v91.antiaim.layered.can_swap = true;
                                            else
                                                v91.antiaim.layered.cur_value = math.random(2, 10);
                                                v91.antiaim.layered.can_swap = false;
                                            end;
                                        end;
                                        v90.antiaim.offset:override(v260(not v91.antiaim.switch and v249.left_offset:get() or v249.right_offset:get(), 20, 180, -180, v90.antiaim.offset:get_override()));
                                    else
                                        v90.antiaim.offset:override(v249.offset:get());
                                    end;
                                end;
                                v90.antiaim.yaw_mod:override(v249.yaw_modifer:get());
                                v90.antiaim.mod_offset:override(v260(v249.yaw_modifer_offset:get(), 20, 180, -180, v90.antiaim.mod_offset:get_override()));
                            end;
                            return;
                        end;
                    end;
                end;
            end, 
            tweaks = function(v270)
                -- upvalues: v46 (ref), v90 (ref), v41 (ref), v91 (ref)
                local v271 = entity.get_local_player();
                if not v271 then
                    return;
                elseif not v271:is_alive() then
                    return;
                else
                    if v46.antiaim.tweaks:get(2) and v90.ragebot.hs:get() and rage.exploit:get() ~= 1 then
                        rage.exploit:force_charge();
                    end;
                    if v46.antiaim.tweaks:get(4) then
                        v90.antiaim.legs:set(v90.antiaim.legs:list()[utils.random_int(1, 3)]);
                    end;
                    if v46.antiaim.tweaks:get(3) then
                        if #entity.get_players(true) == 0 then
                            return;
                        elseif #v41.client.hittable == 0 then
                            return;
                        elseif v90.ragebot.peek:get() and rage.exploit:get() == 1 then
                            v90.antiaim.hidden:override(true);
                            rage.antiaim:override_hidden_pitch(0);
                            if v270.tickcount >= v91.antiaim.count_stay then
                                v91.antiaim.stay_pitch = false;
                            end;
                        else
                            v90.antiaim.hidden:override(nil);
                        end;
                    end;
                    return;
                end;
            end, 
            safe_head = function()
                -- upvalues: v46 (ref), v91 (ref), v170 (ref), v90 (ref)
                if not v46.antiaim.safehead:get(1) and not v46.antiaim.safehead:get(2) then
                    v91.antiaim.safe_head = false;
                    return;
                else
                    local v272 = entity.get_local_player();
                    if not v272 then
                        return;
                    elseif not v272:is_alive() then
                        return;
                    else
                        local v273 = v170.get_condition(false);
                        local v274 = not v46.antiaim.builder[v273].override:get() and v46.antiaim.builder.Shared or v46.antiaim.builder[v273];
                        v91.antiaim.safe_head = v170.get_condition(false) == "Jumping in Crouch" and v272:get_player_weapon(false):get_weapon_info().weapon_type == 0 and v46.antiaim.safehead:get(2);
                        if v46.antiaim.safehead:get(1) and not v91.antiaim.safe_head and v170.get_condition(false) == "Crouching" then
                            local v275 = 10000000;
                            local v276 = entity.get_players(true, false);
                            for _, v278 in pairs(v276) do
                                if v278:is_alive() and v278:is_visible() then
                                    if v278:get_origin():dist(v272:get_origin()) < v275 then
                                        v275 = v278:get_origin():dist(v272:get_origin());
                                        v91.antiaim.safe_head = v278:get_origin():dist(v272:get_origin()) >= 200 and (not v274.defensive_enable:get() or v91.misc.is_grenade and true or not v90.ragebot.dt:get() and not v90.ragebot.hs:get() or not (rage.exploit:get() ~= 0) or v272:get_player_weapon(false):get_weapon_info().weapon_type == 0);
                                    end;
                                    if v91.antiaim.safe_head then
                                        break;
                                    end;
                                end;
                            end;
                        end;
                        if v91.antiaim.safe_head then
                            v90.antiaim.offset:override(0);
                            v90.antiaim.yaw_mod:override("Disabled");
                            v90.antiaim.bodyyaw:override(false);
                            v90.antiaim.hidden:override(false);
                        end;
                        return;
                    end;
                end;
            end, 
            manuals_over = function()
                -- upvalues: v91 (ref), v46 (ref), v90 (ref)
                v91.antiaim.manuals_over = false;
                local v279 = entity.get_local_player();
                if not v279 then
                    return;
                elseif not v279:is_alive() then
                    return;
                else
                    v91.antiaim.manuals_over = v46.antiaim.manuals:get() ~= "None" and not v91.antiaim.safe_head;
                    v90.antiaim.baseyaw:set(v91.antiaim.manuals_over and "Local View" or "At Target");
                    if v91.antiaim.manuals_over then
                        v90.antiaim.yaw_mod:override("Disabled");
                        if v46.antiaim.manuals:get() == "Backward" then
                            v90.antiaim.offset:override(0);
                        elseif v46.antiaim.manuals:get() == "Right" then
                            v90.antiaim.offset:override(90);
                        elseif v46.antiaim.manuals:get() == "Left" then
                            v90.antiaim.offset:override(-90);
                        elseif v46.antiaim.manuals:get() == "Forward" then
                            v90.antiaim.offset:override(180);
                        end;
                    end;
                    return;
                end;
            end
        }, 
        ragebot = {
            ethereal_aim = function()
                -- upvalues: v46 (ref), v90 (ref), v170 (ref)
                if not v46.misc.ethereal_aim:get() then
                    v90.ragebot.baim:override();
                    v90.ragebot.hc:override();
                    v90.ragebot.heads:override();
                    v90.ragebot.bodys:override();
                    return;
                else
                    local v280 = entity.get_local_player();
                    if not v280 then
                        v90.ragebot.baim:override();
                        v90.ragebot.hc:override();
                        v90.ragebot.heads:override();
                        v90.ragebot.bodys:override();
                        return;
                    elseif not v280:is_alive() then
                        return;
                    elseif not v280:get_player_weapon() then
                        return;
                    elseif not v280:get_player_weapon():get_weapon_info() then
                        return;
                    else
                        local l_huge_0 = math.huge;
                        local v282 = nil;
                        for _, v284 in ipairs(entity.get_players(true)) do
                            if not v284:is_alive() then
                                return;
                            elseif v284:get_hitbox_position(1):dist_to_ray(render.camera_position(), vector():angles(render.camera_angles())) < l_huge_0 then
                                l_huge_0 = v284:get_hitbox_position(1):dist_to_ray(render.camera_position(), vector():angles(render.camera_angles()));
                                v282 = v284;
                            end;
                        end;
                        if not v282 then
                            return;
                        elseif not v282.is_alive(v282) then
                            return;
                        else
                            local v285 = 1000 / v170.clamp(v280:get_origin():dist(v282.get_origin(v282)), 1, 2000);
                            local v286 = math.abs(v282.get_simulation_time(v282).current - v282.get_simulation_time(v282).old) >= 0.28;
                            local l_m_ArmorValue_0 = v280.m_ArmorValue;
                            local v288 = v90.ragebot.min_dmg:get() == 0 and 72 or v90.ragebot.min_dmg:get();
                            local v289 = v282.m_iHealth <= (l_m_ArmorValue_0 > 0 and v288 - math.min(v288 * (1 - v280:get_player_weapon():get_weapon_info().armor_ratio * 0.5), 2 * l_m_ArmorValue_0) or v288) and v46.misc.ethereal_aim.force_baim:get(1);
                            local v290 = v286 and v46.misc.ethereal_aim.force_baim:get(2);
                            local v291 = v286 and v46.misc.ethereal_aim.defensive_aimbot:get();
                            v90.ragebot.baim:override((not not v289 or v290) and "Force" or nil);
                            v90.ragebot.hc:override(v291 and v170.clamp(math.floor(math.abs(v90.ragebot.hc:get() - 5 * v285)), 0, 100) or nil);
                            v90.ragebot.heads:override(v291 and v170.clamp(math.floor(v90.ragebot.heads:get() / (7 * v285)), 0, 100) or nil);
                            v90.ragebot.bodys:override(v291 and v170.clamp(math.floor(v90.ragebot.bodys:get() / (9 * v285)), 0, 100) or nil);
                            return;
                        end;
                    end;
                end;
            end, 
            idealtick = function()
                -- upvalues: v46 (ref), v90 (ref), v91 (ref)
                if v46.misc.idealtick:get() and v90.ragebot.peek:get() and v90.ragebot.dt:get() and not v90.antiaim.fd:get() then
                    if v46.misc.idealtick.prevent_os:get() then
                        local v292 = utils.net_channel().avg_latency[0] * 1000;
                        v90.antiaim.fl_lim:override(v292 >= 60 and 8 or v292 <= 30 and 1 or 4);
                    end;
                    if v91.ragebot.idealtick.teleported then
                        if v91.ragebot.idealtick.tp_tick == 3 then
                            v91.ragebot.idealtick.tp_tick = globals.tickcount % 2;
                        end;
                        v91.ragebot.idealtick.teleported = globals.tickcount % 2 ~= v91.ragebot.idealtick.tp_tick;
                        cvar.sv_maxusrcmdprocessticks:int(23);
                    else
                        cvar.sv_maxusrcmdprocessticks:int(16);
                        v91.ragebot.idealtick.tp_tick = 3;
                    end;
                else
                    v90.antiaim.fl_lim:override();
                    cvar.sv_maxusrcmdprocessticks:int(16);
                end;
            end, 
            better_defensive = function(v293)
                -- upvalues: v46 (ref), v90 (ref), v91 (ref), v170 (ref)
                if not v46.misc.better_defensive:get() or not v90.ragebot.dt:get() then
                    return;
                else
                    local v294 = entity.get_local_player();
                    if not v294 then
                        return;
                    elseif not v294:is_alive() then
                        return;
                    else
                        local v295 = entity.get_threat();
                        if not v295 then
                            return;
                        elseif not v295:is_alive() then
                            return;
                        else
                            local v296 = false;
                            if v90.ragebot.peek:get() then
                                if v46.misc.better_defensive.peek:get() == "Anti-Predict" then
                                    v91.antiaim.peek = false;
                                    local v297 = v294:simulate_movement();
                                    v297:think(v170.round(10 * (230 / v294.m_vecVelocity:length2d()), 0));
                                    if v170.can_hit(v294, v295, vector(v297.origin.x, v297.origin.y, v297.origin.z + v297.view_offset), {
                                        [1] = "head", 
                                        [2] = "stomach", 
                                        [3] = "legs", 
                                        [4] = "feets"
                                    }, v90.ragebot.min_dmg:get()) then
                                        v293.force_defensive = true;
                                        v296 = true;
                                    end;
                                elseif v46.misc.better_defensive.peek:get() == "Anti-Backtrack" then
                                    if v91.antiaim.peek then
                                        if not v170.can_hit(v294, v295, v294:get_eye_position(), {
                                            [1] = "head", 
                                            [2] = "stomach", 
                                            [3] = "legs", 
                                            [4] = "feets"
                                        }, v90.ragebot.min_dmg:get()) then
                                            v293.force_defensive = true;
                                            if globals.tickcount > v91.antiaim.peek_time then
                                                v91.antiaim.peek = false;
                                            end;
                                        else
                                            v91.antiaim.peek_time = globals.tickcount + 10;
                                        end;
                                    elseif v170.can_hit(v294, v295, v294:get_eye_position(), {
                                        [1] = "head", 
                                        [2] = "stomach", 
                                        [3] = "legs", 
                                        [4] = "feets"
                                    }, v90.ragebot.min_dmg:get()) then
                                        v91.antiaim.peek = true;
                                    end;
                                end;
                            end;
                            if not v296 and not v91.antiaim.peek then
                                if v46.misc.better_defensive.addons:get(1) then
                                    local v298 = v170.get_condition(false) ~= "Jumping in Crouch" and v170.get_condition(false) ~= "Jumping";
                                    v91.ragebot.groundtick = v298 and v91.ragebot.groundtick + 1 or 0;
                                    if v91.ragebot.groundtick >= 2 and v91.ragebot.groundtick <= 4 then
                                        v293.force_defensive = true;
                                    end;
                                end;
                                if v46.misc.better_defensive.addons:get(1) then
                                    local v299 = v294:get_player_weapon(false);
                                    if not v299 then
                                        return;
                                    elseif v299:get_weapon_reload() ~= -1 then
                                        v293.force_defensive = true;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end, 
            auto_teleport = function(v300)
                -- upvalues: v46 (ref), v90 (ref), v170 (ref), v91 (ref)
                if not v46.misc.auto_teleport:get() then
                    return;
                elseif not v90.ragebot.dt:get() and not v90.ragebot.hs:get() or v90.ragebot.peek:get() then
                    return;
                else
                    local v301 = entity.get_local_player();
                    if v301 == nil then
                        return;
                    elseif not v301:is_alive() then
                        return;
                    elseif not v301:get_player_weapon(false) then
                        return;
                    elseif not v301:get_player_weapon(false):get_weapon_info() then
                        return;
                    elseif v301:get_player_weapon(false):get_weapon_info().weapon_type == 0 then
                        return;
                    elseif v46.misc.auto_teleport.options:get(2) and v170.get_condition(false) ~= "Jumping in Crouch" and v170.get_condition(false) ~= "Jumping" then
                        return;
                    else
                        if v46.misc.auto_teleport.options:get(1) then
                            if v91.misc.is_grenade then
                                return;
                            end;
                        elseif v91.misc.is_grenade or aa_elm.defensive_enable:get() then
                            return;
                        end;
                        local v302 = v46.antiaim.type:get() == 2 and (not v46.antiaim.builder[v170.get_condition(false)].override:get() and v46.antiaim.builder.Shared or v46.antiaim.builder[v170.get_condition(false)]) or not v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase][v170.get_condition(false)].override:get() and v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase].Shared or v46.antiaim.antibrute_aa["Phase " .. v91.antiaim.cur_phase][v170.get_condition(false)];
                        local v303 = entity.get_players(true, false);
                        for _, v305 in pairs(v303) do
                            if not v305 then
                                return;
                            elseif not v305:is_alive() or v305:is_dormant() then
                                return;
                            else
                                v91.ragebot.teleport = entity.get_threat(true);
                                if not v91.ragebot.teleport then
                                    v91.ragebot.teleport = v170.can_hit(v301, v305, v301:get_eye_position(), {
                                        [1] = "head", 
                                        [2] = "stomach", 
                                        [3] = "legs", 
                                        [4] = "feets"
                                    }, v46.misc.auto_teleport.dmg:get()) and entity.get_local_player().m_flVelocityModifier == 1 and v301.m_vecVelocity.z < 0;
                                    if not v91.ragebot.teleport and v46.misc.auto_teleport.pt:get() ~= 0 then
                                        local v306 = v301:simulate_movement();
                                        v306:think(v46.misc.auto_teleport.pt:get());
                                        local v307 = v305:simulate_movement();
                                        v307:think(v46.misc.auto_teleport.pt:get());
                                        v91.ragebot.teleport = (not not v170.can_hit(v301, v305, vector(v306.origin.x, v306.origin.y, v306.origin.z + v306.view_offset), {
                                            [1] = "head", 
                                            [2] = "stomach", 
                                            [3] = "legs", 
                                            [4] = "feets"
                                        }, v46.misc.auto_teleport.dmg:get()) or v170.can_hit(v305, v301, vector(v307.origin.x, v307.origin.y, v307.origin.z + v307.view_offset), {
                                            [1] = "head", 
                                            [2] = "stomach", 
                                            [3] = "legs", 
                                            [4] = "feets"
                                        }, v46.misc.auto_teleport.dmg:get())) and v306.velocity_modifier == 1 and v306.velocity.z < 0 and v306.original_max_speed <= v306.max_speed;
                                    end;
                                end;
                            end;
                        end;
                        if not v91.ragebot.was_teleport and v91.ragebot.teleport then
                            if v90.ragebot.dt:get() and (not v302.defensive_enable:get() or not v302.defensive_enable.force_defensive:get()) then
                                v300.force_defensive = true;
                            end;
                            if v46.misc.auto_teleport.type_teleport:get() == "Basic" then
                                rage.exploit:force_teleport();
                                v91.ragebot.was_teleport = true;
                            else
                                if v90.ragebot.dt:get() then
                                    v90.ragebot.dt:set(false);
                                end;
                                if v90.ragebot.hs:get() and (v90.ragebot.hs_type:get() == "Break LC" or v90.ragebot.hs_type:get_override() == "Break LC") then
                                    v90.ragebot.hs:set(false);
                                end;
                                v91.ragebot.was_teleport = true;
                            end;
                        elseif v91.ragebot.was_teleport and not v91.ragebot.teleport then
                            v91.ragebot.was_teleport = false;
                        end;
                        return;
                    end;
                end;
            end, 
            nade_throw_fix = function()
                -- upvalues: v91 (ref), v46 (ref)
                v91.misc.is_grenade = false;
                if not v46.misc.nade_throw_fix:get() then
                    return;
                else
                    local v308 = entity.get_local_player();
                    if not v308 then
                        return;
                    elseif not v308:is_alive() then
                        return;
                    elseif not v308:get_player_weapon(false) then
                        return;
                    elseif not v308:get_player_weapon(false):get_weapon_info(false) then
                        return;
                    else
                        v91.misc.is_grenade = v308:get_player_weapon(false):get_weapon_info().weapon_type == 9;
                        if v91.misc.is_grenade then
                            v91.misc.is_grenade = v308:get_player_weapon(false).m_bPinPulled or v308:get_player_weapon(false).m_fThrowTime >= globals.curtime - to_time(globals.clock_offset);
                        end;
                        return;
                    end;
                end;
            end, 
            aimbot_logs = function(v309)
                -- upvalues: v46 (ref), v91 (ref)
                if not v46.misc.aimbotlogs:get() then
                    return;
                else
                    local v310 = {
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
                    local l_target_0 = v309.target;
                    local l_damage_0 = v309.damage;
                    local l_hitchance_0 = v309.hitchance;
                    local l_hitgroup_0 = v309.hitgroup;
                    local l_backtrack_0 = v309.backtrack;
                    local l_wanted_damage_0 = v309.wanted_damage;
                    local l_wanted_hitgroup_0 = v309.wanted_hitgroup;
                    local l_state_0 = v309.state;
                    if l_state_0 == nil then
                        print_raw(("\a%s[ethereal]\aFFFFFFFF Hit %s in the %s(%s) for %d(%d) damage [bt: %d] [hc: %d]"):format(v46.misc.aimbotlogs.color_hit:get():to_hex(), l_target_0:get_name(), v310[l_hitgroup_0], v310[l_wanted_hitgroup_0], l_damage_0, l_wanted_damage_0, l_backtrack_0, l_hitchance_0));
                        common.add_event(("\a%s[ethereal]\aFFFFFFFF Hit %s in the %s(%s) for %d(%d) damage [bt: %d] [hc: %d]"):format(v46.misc.aimbotlogs.color_hit:get():to_hex(), l_target_0:get_name(), v310[l_hitgroup_0], v310[l_wanted_hitgroup_0], l_damage_0, l_wanted_damage_0, l_backtrack_0, l_hitchance_0));
                        v91.render.logs[#v91.render.logs + 1] = {
                            text = "Hit " .. (string.len(l_target_0:get_name()) > 11 and string.sub(l_target_0:get_name(), 0, 11) .. "..." or l_target_0:get_name()) .. " in " .. v310[l_hitgroup_0] .. " for " .. l_damage_0 .. " hp", 
                            time = globals.curtime + 5, 
                            color = v46.misc.aimbotlogs.color_hit:get()
                        };
                    else
                        print_raw(("\a%s[ethereal]\aFFFFFFFF Missed shot at %s due to %s in the %s [bt: %s] [hc: %s]"):format(v46.misc.aimbotlogs.color_miss:get():to_hex(), l_target_0:get_name(), l_state_0, v310[l_wanted_hitgroup_0], l_backtrack_0, l_hitchance_0));
                        common.add_event(("\a%s[ethereal]\aFFFFFFFF Missed shot at %s due to %s in the %s [bt: %s] [hc: %s]"):format(v46.misc.aimbotlogs.color_miss:get():to_hex(), l_target_0:get_name(), l_state_0, v310[l_wanted_hitgroup_0], l_backtrack_0, l_hitchance_0));
                        v91.render.logs[#v91.render.logs + 1] = {
                            text = "Missed shot at " .. (string.len(l_target_0:get_name()) > 11 and string.sub(l_target_0:get_name(), 0, 11) .. "..." or l_target_0:get_name()) .. " in " .. v310[l_wanted_hitgroup_0], 
                            time = globals.curtime + 5, 
                            color = v46.misc.aimbotlogs.color_miss:get()
                        };
                    end;
                    return;
                end;
            end
        }, 
        misc = {
            clantag = function()
                -- upvalues: v46 (ref), v91 (ref), v170 (ref)
                if not v46.misc.clantag:get() then
                    return;
                elseif not entity.get_local_player() then
                    return;
                else
                    if globals.curtime > v91.misc.tagswap then
                        v91.misc.curtag = v91.misc.curtag + 1;
                        v91.misc.tagswap = globals.curtime + 0.45;
                        if v91.misc.curtag > #v91.misc.clantag then
                            v91.misc.curtag = 1;
                        end;
                    end;
                    v170.set_clantag(v91.misc.clantag[v91.misc.curtag]);
                    return;
                end;
            end, 
            unmute = function()
                -- upvalues: v46 (ref)
                if not v46.misc.unmute:get() then
                    return;
                else
                    entity.get_players(false, true, function(v319)
                        local v320 = panorama.MatchStatsAPI.GetPlayerXuid(v319:get_index());
                        if panorama.GameStateAPI.IsSelectedPlayerMuted(v320) then
                            panorama.GameStateAPI.ToggleMute(v320);
                        end;
                    end);
                    return;
                end;
            end, 
            fast_ladder = function(v321)
                -- upvalues: v46 (ref)
                if not v46.misc.fast_ladder:get() then
                    return;
                else
                    local v322 = entity.get_local_player();
                    if not v322 then
                        return;
                    elseif not v322:is_alive() then
                        return;
                    else
                        local v323 = render.camera_angles();
                        if v322.m_MoveType ~= 9 then
                            return;
                        else
                            if common.is_button_down(87) or common.is_button_down(83) then
                                v321.view_angles.x = 89;
                                v321.view_angles.y = v321.view_angles.y + 89;
                                v321.in_forward = v321.forwardmove < 0 and 1 or v323.x < 0 and v321.in_forward or 0;
                                v321.in_back = v321.forwardmove < 0 and 0 or v323.x < 0 and v321.in_back or 1;
                                v321.in_moveright = common.is_button_down(83) and 0 or 1;
                                v321.in_moveleft = common.is_button_down(87) and 0 or 1;
                                v321.move_yaw = common.is_button_down(87) and (v321.sidemove == 0 and v321.move_yaw + 90 or v321.sidemove < 0 and v321.move_yaw + 150 or v321.move_yaw + 30) or v321.sidemove == 0 and v321.move_yaw - 90 or v321.sidemove < 0 and v321.move_yaw - 150 or v321.move_yaw - 30;
                            end;
                            return;
                        end;
                    end;
                end;
            end, 
            pingunlocker = function()
                -- upvalues: v46 (ref), v90 (ref)
                cvar.sv_maxunlag:float(v46.misc.pingunlocker:get() and 0.75 or 0.2);
                if v46.misc.pingunlocker:get() then
                    v90.misc.fl:set(v46.misc.pingunlocker.value_pu:get());
                end;
            end, 
            nfd = function(v324)
                -- upvalues: v46 (ref)
                if not v46.misc.nfd:get() then
                    return;
                else
                    local v325 = entity.get_local_player();
                    if not v325 then
                        return;
                    elseif not v325:is_alive() then
                        return;
                    else
                        local v326 = entity.get_local_player();
                        local _ = v326:get_origin();
                        local function v333(v328)
                            local l_x_1 = entity.get_local_player():get_origin().x;
                            local l_y_0 = entity.get_local_player():get_origin().y;
                            local l_z_0 = entity.get_local_player():get_origin().z;
                            for v332 = 0, math.pi * 2, math.pi * 2 / 8 do
                                if utils.trace_line(vector(10 * math.cos(v332) + l_x_1, 10 * math.sin(v332) + l_y_0, l_z_0), vector(10 * math.cos(v332) + l_x_1, 10 * math.sin(v332) + l_y_0, l_z_0 - v328), self).fraction ~= 1 then
                                    return true;
                                end;
                            end;
                            return false;
                        end;
                        if v326.m_vecVelocity.z <= -500 then
                            local v334 = v333(75);
                            if v333(15) then
                                v324.in_duck = 0;
                            elseif v334 then
                                v324.in_duck = 1;
                            end;
                        end;
                        return;
                    end;
                end;
            end, 
            trashtalk = function(v335)
                -- upvalues: v46 (ref), v91 (ref)
                if not v46.misc.trashtalk:get() then
                    return;
                else
                    local v336 = entity.get_local_player();
                    if not v336 then
                        return;
                    elseif entity.get(v335.userid, true) == v336 and entity.get(v335.attacker, true) == v336 then
                        return;
                    else
                        if entity.get(v335.userid, true) == v336 and v46.misc.trashtalk.events:get(1) then
                            utils.console_exec("say " .. v91.misc.trashtalk.on_death[math.random(1, #v91.misc.trashtalk.on_death)]);
                        end;
                        if entity.get(v335.attacker, true) == v336 and v46.misc.trashtalk.events:get(2) then
                            utils.console_exec("say " .. v91.misc.trashtalk.on_kill[math.random(1, #v91.misc.trashtalk.on_kill)]);
                        end;
                        return;
                    end;
                end;
            end, 
            super_toss = {
                compensate_prediction = function(v337)
                    -- upvalues: v91 (ref), v170 (ref)
                    local v338 = entity.get_local_player();
                    if not v338 then
                        return;
                    else
                        local v339 = v338:get_player_weapon();
                        if not v339 then
                            return;
                        else
                            local v340 = v339:get_weapon_info();
                            if not v340 then
                                return;
                            else
                                local l_velocity_0 = v337.velocity;
                                v91.misc.super_toss.vel_gw = l_velocity_0;
                                local v342 = v337.angles:clone();
                                v91.misc.super_toss.angles_gw = v342;
                                local v343 = vector():angles(v342);
                                local v344 = v170.clamp(v339.m_flThrowStrength, 0, 1);
                                local v345 = v343 * (v170.clamp(v340.throw_velocity * 0.9, 15, 750) * (v344 * 0.7 + 0.3));
                                local _ = l_velocity_0 * 1.25 + v345;
                                v342.y = v170.super_toss.calculate_throw_yaw(v343, l_velocity_0, v340.throw_velocity, v344);
                                v342.x = v342.x + v170.super_toss.calculate_throw_pitch(v343, 0, l_velocity_0, v340.throw_velocity, v344) * 0.5;
                                v337.angles = v342;
                                return;
                            end;
                        end;
                    end;
                end, 
                compensate_throwable = function(v347, v348)
                    -- upvalues: v170 (ref), v91 (ref)
                    if render.camera_angles() ~= v347.view_angles:clone() then
                        return;
                    else
                        local v349 = v348:get_player_weapon();
                        if not v349 then
                            return;
                        else
                            local v350 = v349:get_weapon_info();
                            if not v350 or v350.weapon_type ~= 9 then
                                return;
                            elseif v349.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                                return;
                            else
                                local v351 = vector():angles(v347.view_angles);
                                local v352 = v170.clamp(v349.m_flThrowStrength, 0, 1);
                                local v353 = v351 * (v170.clamp(v350.throw_velocity * 0.9, 15, 750) * (v352 * 0.7 + 0.3));
                                local _ = v91.misc.super_toss.vel_gw * 1.25 + v353;
                                v347.view_angles.y = v170.super_toss.calculate_throw_yaw(v351, v91.misc.super_toss.vel_gw, v350.throw_velocity, v352);
                                v347.view_angles.x = v347.view_angles.x + v170.super_toss.calculate_throw_pitch(v351, 0, v91.misc.super_toss.vel_gw, v350.throw_velocity, v352) * 0.5;
                                return;
                            end;
                        end;
                    end;
                end
            }
        }, 
        visuals = {
            indicators = function()
                -- upvalues: v46 (ref), v170 (ref), l_gradient_0 (ref), v91 (ref)
                if not v46.misc.indicators:get() then
                    return;
                else
                    local v355 = entity.get_local_player();
                    if not v355 then
                        return;
                    elseif not v355:is_alive() then
                        return;
                    else
                        local v356 = v170.animations:animate("Indic X", not v355.m_bIsScoped);
                        local v357 = render.screen_size() * 0.5;
                        local v358 = l_gradient_0.text_animate("ethereal", -3, {
                            v46.misc.interface_clr:get(), 
                            color(255, 255, 255, 255)
                        });
                        render.shadow(vector(v357.x - render.measure_text(v91.fonts.rounded_bold, nil, "ethereal").x / 2 + 40 * v356, v357.y + 32 - render.measure_text(v91.fonts.rounded_bold, nil, "ethereal").y / 4), vector(v357.x + render.measure_text(v91.fonts.rounded_bold, nil, "ethereal").x / 2 + v356, v357.y + 32 - render.measure_text(v91.fonts.rounded_bold, nil, "ethereal").y / 4), v46.misc.interface_clr:get(), 25, 0, 0);
                        render.text(v91.fonts.rounded_bold, vector(v357.x + 40 * v356, v357.y + 30), v46.misc.interface_clr:get(), "c", v358:get_animated_text());
                        v358:animate();
                        render.text(v91.fonts.main_font, vector(v357.x + 20 * v356 - render.measure_text(v91.fonts.main_font, nil, v170.get_condition(true)).x / 2 * (1 - v356), v357.y + 30 + render.measure_text(v91.fonts.rounded, nil, "ethereal").y / 2), v46.misc.interface_clr:get(), nil, v170.get_condition(true));
                        local v359 = ui.get_binds();
                        local v360 = {
                            [1] = "Double Tap", 
                            [2] = "Hide Shots", 
                            [3] = "Min. Damage", 
                            [4] = "Hit Chance", 
                            [5] = "Body Aim"
                        };
                        local v361 = 30 + render.measure_text(v91.fonts.rounded, nil, "ethereal").y / 2 + render.measure_text(v91.fonts.main_font, nil, v170.get_condition(true)).y;
                        for v362 = 1, #v359 do
                            if v170.findItem(v360, v359[v362].name) then
                                local v363 = v170.animations:animate(v359[v362].name, not v359[v362].active);
                                local l_name_0 = v359[v362].name;
                                if l_name_0 == "Double Tap" then
                                    l_name_0 = "dt";
                                end;
                                if l_name_0 == "Hide Shots" then
                                    l_name_0 = "on shot";
                                end;
                                if l_name_0 == "Min. Damage" then
                                    l_name_0 = "min. dmg";
                                end;
                                if l_name_0 == "Hit Chance" then
                                    l_name_0 = "over. hc";
                                end;
                                if l_name_0 == "Body Aim" then
                                    l_name_0 = "baim";
                                end;
                                render.text(v91.fonts.main_font, vector(v357.x + 20 * v356 - render.measure_text(v91.fonts.main_font, nil, l_name_0).x / 2 * (1 - v356), v357.y + v361 / v363), color(v46.misc.interface_clr:get().r, v46.misc.interface_clr:get().g, v46.misc.interface_clr:get().b, math.floor(tonumber(v363 * 255))), nil, l_name_0);
                                v361 = v361 + 10;
                            end;
                        end;
                        return;
                    end;
                end;
            end, 
            watermark = function()
                -- upvalues: v46 (ref), v41 (ref), v170 (ref), v91 (ref)
                if not v46.misc.windows:get(1) then
                    return;
                else
                    local v365 = render.screen_size();
                    local v366 = common.get_system_time().hours < 10 and "0" .. tostring(common.get_system_time().hours) or tostring(common.get_system_time().hours);
                    local v367 = common.get_system_time().minutes < 10 and "0" .. tostring(common.get_system_time().minutes) or tostring(common.get_system_time().minutes);
                    v41.user.time = v366 .. ":" .. v367;
                    local v368 = entity.get_local_player();
                    local l_user_0 = v41.user;
                    local v370;
                    if not globals.is_connected or not v368 then
                        v370 = 0;
                    else
                        v370 = tostring(v170.round((utils.net_channel().avg_latency[0] + utils.net_channel().avg_latency[1]) / 2 * 1000, 0));
                    end;
                    l_user_0.ping = v370;
                    l_user_0 = v365.x - render.measure_text(v91.fonts.rounded, nil, text).x - 75;
                    v370 = 25;
                    local v371 = render.measure_text(v91.fonts.rounded, nil, "ethereal  \238\128\182").x + 30;
                    v170.window_create(l_user_0 - v371 - 10, v370, v371, v46.misc.interface_clr:get(), 1, "ethe\a" .. v46.misc.interface_clr:get():to_hex() .. "real  \238\128\182", true, {
                        [1] = v41.user.time, 
                        [2] = v41.user.ping .. " ms"
                    });
                    return;
                end;
            end, 
            keybinds = l_system_0.register({
                [1] = v46.misc.not_vis.binds_x, 
                [2] = v46.misc.not_vis.binds_y
            }, vector(200, 25), "Keybinds", function(v372)
                -- upvalues: v91 (ref), v170 (ref), v46 (ref)
                local v373 = ui.get_binds();
                local v374 = -18;
                local v375 = 28;
                local v376 = false;
                for v377 = 1, #v373 do
                    local l_name_1 = v373[v377].name;
                    local v379 = render.measure_text(v91.fonts.rounded, nil, l_name_1).x - render.measure_text(v91.fonts.rounded, nil, l_name_1).x / 20;
                    if v373[v377].active then
                        v376 = true;
                        if v375 < v379 and v379 then
                            v375 = v379;
                        end;
                    end;
                end;
                local v380 = v170.animations:animate("alphastate KEYBINS", not v376 and ui.get_alpha() <= 0.3);
                v91.render.keybinds.width = v170.lerp(v91.render.keybinds.width, 100 + v375, 0.1);
                local l_width_0 = v91.render.keybinds.width;
                local l_x_2 = v372.position.x;
                local l_y_1 = v372.position.y;
                local v384 = v46.misc.interface_clr:get();
                local v385 = color(v384.r, v384.g, v384.b, math.floor(tonumber(v380 * 255)));
                local l_l_x_2_0 = l_x_2;
                local l_l_width_0_0 = l_width_0;
                local v388 = l_x_2 + l_width_0 / 9;
                l_width_0 = l_width_0 - l_width_0 / 5;
                l_x_2 = v388;
                for v389 = 1, #v373 do
                    local v390 = v170.animations:animate(v373[v389].name .. "key", not v373[v389].active);
                    local v391 = v373[v389].mode == 1 and "hold" or v373[v389].mode == 2 and "toggled" or "[?]";
                    v374 = v374 + 30 * v390;
                    local l_name_2 = v373[v389].name;
                    render.blur(vector(l_x_2 - 8, l_y_1 + 14 + v374), vector(l_x_2 + 8 + l_width_0, l_y_1 + 39 + v374), 10, v390, 5);
                    render.text(v91.fonts.rounded, vector(l_x_2 + 2, l_y_1 + 18 + v374), color(255, 255, 255, v390 * 255), nil, l_name_2);
                    render.text(v91.fonts.rounded, vector(l_x_2 - 2 + l_width_0 - render.measure_text(v91.fonts.main_font, nil, v391).x, l_y_1 + 18 + v374), color(255, 255, 255, v390 * 255), nil, "\aB9B9B9FF" .. v391);
                end;
                v170.window_create(l_l_x_2_0, l_y_1, l_l_width_0_0, v385, v380, " \a" .. v46.misc.interface_clr:get():to_hex() .. "\239\159\170 \aFFFFFFFF Hotkeys ");
            end), 
            spectators = l_system_0.register({
                [1] = v46.misc.not_vis.spec_x, 
                [2] = v46.misc.not_vis.spec_y
            }, vector(120, 60), "Spectators", function(v393)
                -- upvalues: v46 (ref), v91 (ref), v170 (ref)
                local v394 = v46.misc.interface_clr:get();
                local v395 = color(v394.r, v394.g, v394.b);
                local v396 = 120;
                local l_x_3 = v393.position.x;
                local l_y_2 = v393.position.y;
                local v399 = entity.get_local_player();
                local v400 = {};
                if v399 == nil then
                    v400 = nil;
                else
                    v400 = v399:get_spectators();
                    if v399.m_hObserverTarget and (v399.m_iObserverMode == 4 or v399.m_iObserverMode == 5) then
                        v399 = v399.m_hObserverTarget;
                    end;
                end;
                if v400 or ui.get_alpha() > 0.3 then
                    local l_l_x_3_0 = l_x_3;
                    local l_l_y_2_0 = l_y_2;
                    local v403 = l_x_3 + v396 / 9;
                    l_y_2 = l_y_2 + 7;
                    l_x_3 = v403;
                    if v400 then
                        for v404, v405 in pairs(v400) do
                            local v406 = v405:get_name();
                            local _ = render.measure_text(v91.fonts.rounded, "", v406).x;
                            name_sub = string.len(v406) > 11 and string.sub(v406, 0, 11) .. "..." or v406;
                            local v408 = v405:get_steam_avatar();
                            if not v405:is_bot() or v405:is_player() then
                                render.blur(vector(l_x_3 - 1, l_y_2 + 3 + v404 * 20), vector(l_x_3 + 100, l_y_2 + 20 + v404 * 20), 10, 255, 5);
                                render.text(v91.fonts.rounded, vector(l_x_3 + 20, l_y_2 + 5 + v404 * 20), color(), "u", name_sub);
                                if v408 then
                                    render.texture(v408, vector(l_x_3 + 1, l_y_2 + 5 + v404 * 20), vector(15, 15), color(), "f", 20);
                                end;
                            end;
                        end;
                    end;
                    v403 = l_l_x_3_0;
                    l_y_2 = l_l_y_2_0;
                    l_x_3 = v403;
                    v403 = false;
                    if v400 then
                        v403 = #v400 > 0 or not (v399.m_iObserverMode ~= 4) or not (v399.m_iObserverMode ~= 5) or ui.get_alpha() > 0.3;
                    else
                        v403 = ui.get_alpha() > 0.3;
                    end;
                    local v409 = v170.animations:animate("alphastate SPEC", not v403);
                    v170.window_create(l_x_3, l_y_2, v396, v395, v409, " \a" .. v46.misc.interface_clr:get():to_hex() .. "\239\148\176 \aFFFFFFFF Spectators ");
                end;
            end), 
            velocity_warning = l_system_0.register({
                [1] = v46.misc.not_vis.vel_x, 
                [2] = v46.misc.not_vis.vel_y
            }, vector(136, 43), "Velocity Warning", function(v410)
                -- upvalues: v170 (ref), v91 (ref), v46 (ref)
                local v411 = entity.get_local_player();
                local v412 = 0;
                if v411 then
                    if v411:is_alive() then
                        v412 = v170.animations:animate("Velocity", entity.get_local_player().m_flVelocityModifier == 1 and ui.get_alpha() <= 0.3);
                    else
                        v412 = v170.animations:animate("Velocity", ui.get_alpha() <= 0.3);
                    end;
                else
                    v412 = v170.animations:animate("Velocity", ui.get_alpha() <= 0.3);
                end;
                if ui.get_alpha() > 0.3 then
                    local v413 = ui.get_mouse_position();
                    local v414 = color(255, 255 * v170.animations:animate("velocity render rect mouse", not common.is_button_down(1) and not common.is_button_down(4), 1, 0.25) * v170.animations:animate("velocity render rect", v413.x <= v410.position.x or not (v413.x < v410.position.x + 136) or not (v413.y > v410.position.y) or v413.y >= v410.position.y + 43));
                    render.rect_outline(vector(v410.position.x - 1, v410.position.y - 1), vector(136 + v410.position.x + 1, 43 + v410.position.y + 1), v414);
                    render.text(v91.fonts.rounded, vector(v410.position.x, 43 + v410.position.y), v414, nil, "LBM - Drag and drop\nMBM - Drag to center of screen");
                    if common.is_button_down(4) and v414.a > 0.25 then
                        v410.position.x = v170.lerp(v410.position.x, render.screen_size().x / 2 - 68, 0.5);
                        v46.misc.not_vis.vel_x:set(v410.position.x);
                    end;
                    local v415 = "\238\144\151";
                    local v416 = "Velocity ~ 100%";
                    local v417 = 20 + render.measure_text(v91.fonts.icons, nil, v415).y;
                    local v418 = 30 + render.measure_text(v91.fonts.icons, nil, v415).x + render.measure_text(v91.fonts.main_font, nil, v416).x;
                    local l_x_5 = v410.position.x;
                    local l_y_3 = v410.position.y;
                    local v421 = v418 / 1.1;
                    render.blur(vector(l_x_5 + 2, l_y_3 + v417 / 10), vector(l_x_5 + 10 + v418, l_y_3 + v417 - v417 / 10), 10, 255 * v412, 5);
                    render.shadow(vector(l_x_5, l_y_3), vector(l_x_5 + 5, l_y_3 + v417), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 20, 0, 5);
                    render.rect(vector(l_x_5, l_y_3), vector(l_x_5 + v418 / 3, l_y_3 + v417), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 5);
                    render.rect(vector(l_x_5 + 2, l_y_3), vector(l_x_5 + 2 + v418 / 3, l_y_3 + v417), color(20, 255 * v412), 5);
                    render.text(v91.fonts.icons, vector(l_x_5 + 2 + v418 / 3 / 2, l_y_3 + v417 / 2), color(255, 255 * v412), "c", v415);
                    render.text(v91.fonts.main_font, vector(l_x_5 + 7 + v418 / 3, l_y_3 + v417 / 4.5), color(255, 255 * v412), nil, v416);
                    render.shadow(vector(l_x_5 + 9 + v418 / 3, l_y_3 + v417 / 4.5 + v417 / 2.5), vector(l_x_5 + 9 + v421, l_y_3 + v417 / 4.5 + v417 / 2.5 + 3), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 10, 0, 5);
                    render.rect(vector(l_x_5 + 9 + v418 / 3, l_y_3 + v417 / 4.5 + v417 / 2.5), vector(l_x_5 + 9 + v421, l_y_3 + v417 / 4.5 + v417 / 2.5 + 3), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 5);
                elseif not v411 then
                    return;
                elseif not v411:is_alive() then
                    return;
                else
                    local v422 = "\238\144\151";
                    local v423 = "Velocity ~ " .. math.max(math.floor(entity.get_local_player().m_flVelocityModifier * 100), 1) .. "%";
                    local v424 = 20 + render.measure_text(v91.fonts.icons, nil, v422).y;
                    local v425 = 30 + render.measure_text(v91.fonts.icons, nil, v422).x + render.measure_text(v91.fonts.main_font, nil, v423).x;
                    local l_x_6 = v410.position.x;
                    local l_y_4 = v410.position.y;
                    local v428 = math.max(v425 / 2 * entity.get_local_player().m_flVelocityModifier, 1);
                    render.blur(vector(l_x_6 + 2, l_y_4 + v424 / 10), vector(l_x_6 + 10 + v425, l_y_4 + v424 - v424 / 10), 10, 255 * v412, 5);
                    render.shadow(vector(l_x_6, l_y_4), vector(l_x_6 + 5, l_y_4 + v424), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 20, 0, 5);
                    render.rect(vector(l_x_6, l_y_4), vector(l_x_6 + v425 / 3, l_y_4 + v424), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 5);
                    render.rect(vector(l_x_6 + 2, l_y_4), vector(l_x_6 + 2 + v425 / 3, l_y_4 + v424), color(20, 255 * v412), 5);
                    render.text(v91.fonts.icons, vector(l_x_6 + 2 + v425 / 3 / 2, l_y_4 + v424 / 2), color(255, 255 * v412), "c", v422);
                    render.text(v91.fonts.main_font, vector(l_x_6 + 7 + v425 / 3, l_y_4 + v424 / 4.5), color(255, 255 * v412), nil, v423);
                    render.shadow(vector(l_x_6 + 9 + v425 / 3, l_y_4 + v424 / 4.5 + v424 / 2.5), vector(l_x_6 + 9 + v425 / 3 + v428, l_y_4 + v424 / 4.5 + v424 / 2.5 + 3), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 10, 0, 5);
                    render.rect(vector(l_x_6 + 9 + v425 / 3, l_y_4 + v424 / 4.5 + v424 / 2.5), vector(l_x_6 + 9 + v425 / 3 + v428, l_y_4 + v424 / 4.5 + v424 / 2.5 + 3), v46.misc.interface_clr:get():alpha_modulate(255 * v412), 5);
                end;
            end), 
            custom_scope = function()
                -- upvalues: v46 (ref), v90 (ref)
                if not v46.misc.custom_scope:get() then
                    return;
                else
                    local v429 = entity.get_local_player();
                    if not v429 then
                        return;
                    elseif not v429:is_alive() then
                        return;
                    elseif not v429.m_bIsScoped then
                        return;
                    else
                        v90.visuals.so:set(v46.misc.custom_scope.remover:get());
                        local v430 = render.screen_size() * 0.5;
                        if v46.misc.custom_scope.style:get() == "Inside" then
                            render.gradient(vector(v430.x - v46.misc.custom_scope.thickness:get() / 2, v430.y - v46.misc.custom_scope.offset:get()), vector(v430.x + v46.misc.custom_scope.thickness:get() / 2, v430.y - v46.misc.custom_scope.offset:get() - v46.misc.custom_scope.width:get()), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get():alpha_modulate(0));
                            render.gradient(vector(v430.x - v46.misc.custom_scope.thickness:get() / 2, v430.y + v46.misc.custom_scope.offset:get()), vector(v430.x + v46.misc.custom_scope.thickness:get() / 2, v430.y + v46.misc.custom_scope.offset:get() + v46.misc.custom_scope.width:get()), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get():alpha_modulate(0));
                            render.gradient(vector(v430.x + v46.misc.custom_scope.offset:get(), v430.y - v46.misc.custom_scope.thickness:get() / 2), vector(v430.x + v46.misc.custom_scope.offset:get() + v46.misc.custom_scope.width:get(), v430.y + v46.misc.custom_scope.thickness:get() / 2), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0));
                            render.gradient(vector(v430.x - v46.misc.custom_scope.offset:get(), v430.y - v46.misc.custom_scope.thickness:get() / 2), vector(v430.x - v46.misc.custom_scope.offset:get() - v46.misc.custom_scope.width:get(), v430.y + v46.misc.custom_scope.thickness:get() / 2), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0));
                        else
                            render.gradient(vector(v430.x - v46.misc.custom_scope.thickness:get() / 2, v430.y - v46.misc.custom_scope.offset:get()), vector(v430.x + v46.misc.custom_scope.thickness:get() / 2, v430.y - v46.misc.custom_scope.offset:get() - v46.misc.custom_scope.width:get()), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get());
                            render.gradient(vector(v430.x - v46.misc.custom_scope.thickness:get() / 2, v430.y + v46.misc.custom_scope.offset:get()), vector(v430.x + v46.misc.custom_scope.thickness:get() / 2, v430.y + v46.misc.custom_scope.offset:get() + v46.misc.custom_scope.width:get()), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get());
                            render.gradient(vector(v430.x + v46.misc.custom_scope.offset:get(), v430.y - v46.misc.custom_scope.thickness:get() / 2), vector(v430.x + v46.misc.custom_scope.offset:get() + v46.misc.custom_scope.width:get(), v430.y + v46.misc.custom_scope.thickness:get() / 2), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get());
                            render.gradient(vector(v430.x - v46.misc.custom_scope.offset:get(), v430.y - v46.misc.custom_scope.thickness:get() / 2), vector(v430.x - v46.misc.custom_scope.offset:get() - v46.misc.custom_scope.width:get(), v430.y + v46.misc.custom_scope.thickness:get() / 2), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get(), v46.misc.custom_scope.color:get():alpha_modulate(0), v46.misc.custom_scope.color:get());
                        end;
                        return;
                    end;
                end;
            end, 
            aspect_ratio = function()
                -- upvalues: v46 (ref), v170 (ref)
                if not v46.misc.aspect_ratio:get() then
                    return;
                elseif not entity.get_local_player() then
                    return;
                else
                    cvar.r_aspectratio:float(v170.lerp(v170.round(cvar.r_aspectratio:float(), 2), v46.misc.aspect_ratio.value_ar:get() / 100, 0.1));
                    if v46.misc.aspect_ratio.value_ar:get() == 0 then
                        cvar.r_aspectratio:float(0);
                    end;
                    return;
                end;
            end, 
            viewmodel = function()
                -- upvalues: v46 (ref), v170 (ref)
                if not v46.misc.viewmodel:get() then
                    return;
                else
                    local v431 = entity.get_local_player();
                    if not v431 then
                        return;
                    elseif not v431:is_alive() then
                        return;
                    else
                        cvar.viewmodel_fov:int(v170.lerp(cvar.viewmodel_fov:int(), v46.misc.viewmodel.fov:get(), 0.1), true);
                        cvar.viewmodel_offset_x:float(v170.lerp(cvar.viewmodel_offset_x:float(), v46.misc.viewmodel.x:get() / 10, 0.1), true);
                        cvar.viewmodel_offset_y:float(v170.lerp(cvar.viewmodel_offset_y:float(), v46.misc.viewmodel.y:get() / 10, 0.1), true);
                        cvar.viewmodel_offset_z:float(v170.lerp(cvar.viewmodel_offset_z:float(), v46.misc.viewmodel.z:get() / 10, 0.1), true);
                        return;
                    end;
                end;
            end, 
            damage_indicator = function()
                -- upvalues: v46 (ref), v91 (ref), v90 (ref)
                if not v46.misc.damage_indicator:get() then
                    return;
                else
                    local v432 = entity.get_local_player();
                    if not v432 then
                        return;
                    elseif not v432:is_alive() then
                        return;
                    else
                        local v433 = render.screen_size() * 0.5;
                        render.text(v91.fonts.main_font, vector(v433.x + 20, v433.y - 20), color(255, 255, 255), "c", v90.ragebot.min_dmg:get() == 0 and "auto" or v90.ragebot.min_dmg:get() > 100 and "+" .. tostring(v90.ragebot.min_dmg:get() - 100) or v90.ragebot.min_dmg:get());
                        return;
                    end;
                end;
            end, 
            spark_on_shot = function(v434)
                -- upvalues: v46 (ref), v91 (ref)
                if not v46.misc.spark_on_shot:get() then
                    return;
                elseif not globals.is_connected then
                    return;
                elseif not v91.ffi_vars.vec3.x or not v91.ffi_vars.vec3.y or not v91.ffi_vars.vec3.z then
                    return;
                else
                    v91.ffi_vars.vec3.x = v434.x;
                    v91.ffi_vars.vec3.y = v434.y;
                    v91.ffi_vars.vec3.z = v434.z;
                    v91.materials.spark_material:alpha_modulate(255);
                    v91.materials.spark_material:color_modulate(v46.misc.spark_on_shot.color.value);
                    v91.ffi_vars.fx_electric_spark(v91.ffi_vars.vec3, v46.misc.spark_on_shot.quantity:get(), v46.misc.spark_on_shot.length:get(), v91.ffi_vars.QAngle);
                    return;
                end;
            end, 
            smoke_render = function()
                -- upvalues: v46 (ref), v170 (ref)
                if not v46.misc.grenade_radius:get() or not v46.misc.grenade_radius.smoke_radius:get() then
                    return;
                elseif not globals.is_connected then
                    return;
                else
                    local v435 = entity.get_entities("CSmokeGrenadeProjectile");
                    local v436 = {};
                    local v437 = {};
                    for v438 = 1, #v435 do
                        local v439 = v435[v438];
                        if not v439 then
                            v436[v438] = 1;
                            v437[v438] = 15;
                        else
                            v437[v438] = 18.046875 - globals.tickinterval * (globals.tickcount - v439.m_nSmokeEffectTickBegin);
                            v437[v438] = v437[v438] < 0 and 0 or v437[v438];
                            if v439.m_bDidSmokeEffect and v439:get_origin():dist(entity.get_local_player():get_origin()) <= 5000 then
                                v436[v438] = v46.misc.grenade_radius.animate:get() and v170.animations:animate(v438 .. " smoke alpha", v437[v438] > 17.946875 or v437[v438] < 0.1) or 1;
                                local v440 = v436[v438] * 125;
                                if v46.misc.grenade_radius.type_radius:get() == "Outline" then
                                    if v46.misc.grenade_radius.type_render:get() == "Default" then
                                        render.circle_3d_outline(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(v46.misc.grenade_radius.smoke_radius.color.value.a * v436[v438]), v440, 90, 1);
                                    else
                                        render.circle_3d_outline(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(v46.misc.grenade_radius.smoke_radius.color.value.a * v436[v438]), v440, 90, 1);
                                        for v441 = 1, 5 do
                                            render.circle_3d_outline(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(50 * v436[v438] - 9 * v441), v440, 90, 1, v441);
                                        end;
                                    end;
                                elseif v46.misc.grenade_radius.type_render:get() == "Default" then
                                    render.circle_3d_gradient(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(v46.misc.grenade_radius.smoke_radius.color.value.a * v436[v438]), color(0, 0, 0, 0), v440, 90, 1);
                                else
                                    render.circle_3d_gradient(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(v46.misc.grenade_radius.smoke_radius.color.value.a * v436[v438]), color(0, 0, 0, 0), v440, 90, 1);
                                    for v442 = 1, 5 do
                                        render.circle_3d_outline(v439:get_origin(), v46.misc.grenade_radius.smoke_radius.color.value:alpha_modulate(50 * v436[v438] - 9 * v442), v440, 90, 1, v442);
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end, 
            molotov_render = function()
                -- upvalues: v46 (ref), v170 (ref)
                if not v46.misc.grenade_radius:get() or not v46.misc.grenade_radius.molotov_radius:get() then
                    return;
                elseif not globals.is_connected then
                    return;
                else
                    local v443 = entity.get_entities("CInferno");
                    local v444 = {};
                    for v445 = 1, #v443 do
                        v444[v445] = v444[v445] or {};
                        local v446 = v443[v445];
                        local v447 = 7 - globals.tickinterval * (globals.tickcount - v446.m_nFireEffectTickBegin);
                        local v448 = v446:get_origin();
                        local v449 = {};
                        local v450 = 0;
                        for v451 = 1, 64 do
                            if v446.m_bFireIsBurning[v451] then
                                if not v46.misc.grenade_radius.molotov_separetly:get() then
                                    v444[v445][v451] = v46.misc.grenade_radius.animate:get() and v170.animations:animate(v445 .. v451 .. " cells molotov alpha", v447 > 6.9 or v447 < 0.1) or 1;
                                else
                                    v444[v445][v451] = v46.misc.grenade_radius.animate:get() and v170.animations:animate(v445 .. v451 .. " cells molotov alpha", v447 < 0.1) or 1;
                                end;
                                table.insert(v449, vector(v446.m_fireXDelta[v451], v446.m_fireYDelta[v451], v446.m_fireZDelta[v451]));
                            end;
                        end;
                        table.insert(v449, vector(v448.x / 1000, v448.y / 1000, v448.z / 1000));
                        if not v46.misc.grenade_radius.molotov_separetly:get() then
                            local v452 = nil;
                            local v453 = nil;
                            for v454 = 1, #v449 do
                                for v455 = 1, #v449 do
                                    local v456 = v449[v454]:dist(v449[v455]);
                                    if v450 < v456 then
                                        v450 = v456;
                                        v452 = v449[v454];
                                        v453 = v449[v455];
                                    end;
                                end;
                            end;
                            if v452 and v453 and v444[v445] and not #v444[v445] ~= 0 and v450 and v444[v445][1] and v444[v445][#v444[v445] - 1] then
                                local v457 = (v450 / 2 + 20 + (#v444[v445] + v444[v445][#v444[v445] - 1])) * (#v444[v445] + v444[v445][#v444[v445] - 1]) / (#v444[v445] + 1);
                                local v458 = v448 + v452.lerp(v452, v453, 0.5) * (#v444[v445] + v444[v445][#v444[v445]]) / (#v444[v445] + 1);
                                if v46.misc.grenade_radius.type_radius:get() == "Outline" then
                                    if v46.misc.grenade_radius.type_render:get() == "Default" then
                                        render.circle_3d_outline(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][1]), v457, 90, 1);
                                    else
                                        render.circle_3d_outline(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][1]), v457, 90, 1);
                                        for v459 = 1, 5 do
                                            render.circle_3d_outline(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(50 * v444[v445][1] - 9 * v459), v457, 90, 1, v459);
                                        end;
                                    end;
                                elseif v46.misc.grenade_radius.type_render:get() == "Default" then
                                    render.circle_3d_gradient(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][1]), color(0, 0, 0, 0), v457, 90, 1);
                                else
                                    render.circle_3d_gradient(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][1]), color(0, 0, 0, 0), v457, 90, 1);
                                    for v460 = 1, 5 do
                                        render.circle_3d_outline(v458, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(50 * v444[v445][1] - 9 * v460), v457, 90, 1, v460);
                                    end;
                                end;
                            end;
                        else
                            for v461 = 1, #v449 do
                                local v462 = vector(v449[v461].x + v448.x, v449[v461].y + v448.y, v449[v461].z + v448.z);
                                if v444[v445] and v444[v445][v461] then
                                    local v463 = 65 * v444[v445][v461];
                                    if v46.misc.grenade_radius.type_radius:get() == "Outline" then
                                        if v46.misc.grenade_radius.type_render:get() == "Default" then
                                            render.circle_3d_outline(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][v461]), v463, 90, 1);
                                        else
                                            render.circle_3d_outline(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.aalpha[v445][v461]), v463, 90, 1);
                                            for v464 = 1, 5 do
                                                render.circle_3d_outline(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(50 * v444[v445][v461] - 9 * v464), v463, 90, 1, v464);
                                            end;
                                        end;
                                    elseif v46.misc.grenade_radius.type_render:get() == "Default" then
                                        render.circle_3d_gradient(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][v461]), color(0, 0, 0, 0), v463, 90, 1);
                                    else
                                        render.circle_3d_gradient(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(v46.misc.grenade_radius.molotov_radius.color.value.a * v444[v445][v461]), color(0, 0, 0, 0), v463, 90, 1);
                                        for v465 = 1, 5 do
                                            render.circle_3d_outline(v462, v46.misc.grenade_radius.molotov_radius.color.value:alpha_modulate(50 * v444[v445][v461] - 9 * v465), v463, 90, 1, v465);
                                        end;
                                    end;
                                else
                                    break;
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end, 
            console_color = function()
                -- upvalues: v91 (ref), v170 (ref), v46 (ref)
                for v466 = 1, #v91.materials.vgui do
                    if v170.findItem({
                        [1] = "vgui_white", 
                        [2] = "vgui/hud/800corner1", 
                        [3] = "vgui/hud/800corner2", 
                        [4] = "vgui/hud/800corner3", 
                        [5] = "vgui/hud/800corner4"
                    }, v91.materials.vgui[v466]:get_name()) then
                        local v467 = v91.materials.vgui[v466];
                        if not v46.misc.console_color:get() then
                            v467:reset();
                            return;
                        elseif v467:is_valid() then
                            if not v46.misc.console_color.color.value then
                                v467:reset();
                            else
                                v467:color_modulate(v46.misc.console_color.color.value);
                                v467:alpha_modulate(v46.misc.console_color.color.value.a / 255);
                            end;
                        end;
                    end;
                end;
            end, 
            kmt = function(v468)
                -- upvalues: v46 (ref)
                if not v46.misc.keep_transperency_model:get() then
                    return;
                else
                    v468 = 255;
                    return;
                end;
            end
        }
    };
    events.round_start:set(function(_)
        -- upvalues: v469 (ref)
        v469.misc.unmute();
    end);
    local v471 = 1;
    local v472 = 0;
    local v473 = color(math.max(ui.get_style("Link Active").r - 120, 0), math.max(ui.get_style("Link Active").g - 120, 0), math.max(ui.get_style("Link Active").b - 120, 0));
    events.render:set(function(_)
        -- upvalues: l_gradient_0 (ref), v473 (ref), v471 (ref), v472 (ref), v170 (ref), v46 (ref), v469 (ref), v60 (ref)
        utils.random_seed(globals.tickcount);
        if ui.get_alpha() > 0.3 then
            local v475 = l_gradient_0.text_animate("ethereal", 1.5, {
                [1] = ui.get_style("Link Active"), 
                [2] = v473
            });
            if v471 == 1 then
                v472 = math.min((v475:get_current_position() ~= nil and v475:get_current_position() or 1) * 2, 1);
                if v472 == 1 then
                    v471 = 2;
                end;
            else
                v472 = math.max((1 - (v475:get_current_position() ~= nil and v475:get_current_position() or 1)) * 2, 0);
                if v472 == 0 then
                    v471 = 1;
                end;
            end;
            v475:animate();
            do
                local l_v475_0 = v475;
                local l_status_2, l_result_2 = pcall(function()
                    -- upvalues: l_v475_0 (ref), l_gradient_0 (ref), v473 (ref), v472 (ref)
                    ui.sidebar(l_v475_0:get_animated_text() ~= nil and l_v475_0:get_animated_text() or "ethereal", "\a" .. (l_gradient_0.linear({
                        [1] = ui.get_style("Link Active"), 
                        [2] = v473
                    }, v472):to_hex() ~= nil and l_gradient_0.linear({
                        [1] = ui.get_style("Link Active"), 
                        [2] = v473
                    }, v472):to_hex() or "ffffff") .. "\238\128\182");
                end);
                data = l_result_2;
                suc = l_status_2;
            end;
        end;
        v170.animations:new_frame();
        if v46.misc.nofications_on_screen:get() then
            v170.logs_render:update();
        end;
        if v46.misc.not_vis ~= nil then
            v46.misc.not_vis.binds_x:visibility(false);
            v46.misc.not_vis.binds_y:visibility(false);
            v46.misc.not_vis.spec_x:visibility(false);
            v46.misc.not_vis.spec_y:visibility(false);
            v46.misc.not_vis.vel_x:visibility(false);
            v46.misc.not_vis.vel_y:visibility(false);
            v46.misc.not_vis.logs_x:visibility(false);
            v46.misc.not_vis.logs_y:visibility(false);
        end;
        v469.visuals.aspect_ratio();
        v469.visuals.viewmodel();
        v469.visuals.watermark();
        v469.visuals.indicators();
        v469.visuals.damage_indicator();
        v469.visuals.custom_scope();
        v469.visuals.smoke_render();
        v469.visuals.molotov_render();
        v469.visuals.console_color();
        if v46.misc.velocity_warning:get() then
            v469.visuals.velocity_warning:update();
        end;
        if v46.misc.windows:get(2) then
            v469.visuals.keybinds:update();
        end;
        if v46.misc.windows:get(3) then
            v469.visuals.spectators:update();
        end;
        v60.nothing:visibility(#v60.configs:list() == 0);
        v60.configs:visibility(#v60.configs:list() ~= 0);
    end);
    events.render:set(function(_)
        -- upvalues: v46 (ref), v91 (ref)
        local v480 = entity.get_local_player();
        if not v480 then
            return;
        elseif not v480:is_alive() then
            return;
        else
            if v46.antiaim.antibrute.reset:get(2) and v46.antiaim.type:get() == 3 and globals.curtime > v91.antiaim.time_to_reset then
                v91.antiaim.time_to_reset = globals.curtime + v46.antiaim.antibrute.time_count:get();
                v91.antiaim.cur_phase = 1;
                print_raw("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF Anti-Bruteforce was \a" .. v46.misc.interface_clr:get():to_hex() .. "reset\aFFFFFFFF due to time ran out.");
                common.add_event("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF Anti-Bruteforce was \a" .. v46.misc.interface_clr:get():to_hex() .. "reset\aFFFFFFFF due to time ran out.");
                v91.render.logs[#v91.render.logs + 1] = {
                    text = "AB was reset due to time ran out.", 
                    time = globals.curtime + 5, 
                    color = v46.misc.interface_clr:get()
                };
            end;
            return;
        end;
    end);
    events.createmove:set(function(v481)
        -- upvalues: v91 (ref), v170 (ref), v469 (ref)
        v91.cmd = v481;
        v170.update_hittable();
        v469.ragebot.ethereal_aim();
        v469.ragebot.idealtick();
        v469.ragebot.better_defensive(v481);
        v469.ragebot.auto_teleport(v481);
        v469.antiaim.builder(v481);
        v469.antiaim.tweaks(v481);
        v469.antiaim.safe_head();
        v469.antiaim.manuals_over();
        v469.ragebot.nade_throw_fix();
        v469.misc.clantag();
        v469.misc.pingunlocker();
        v469.misc.fast_ladder(v481);
        v469.misc.nfd(v481);
    end);
    events.round_start:set(function(_)
        -- upvalues: v46 (ref), v91 (ref)
        if not v46.antiaim.antibrute.reset:get(1) or v46.antiaim.type:get() ~= 3 then
            return;
        elseif not entity.get_local_player() then
            return;
        elseif entity.get_game_rules().m_bWarmupPeriod and v46.antiaim.tweaks:get(1) then
            return;
        else
            v91.antiaim.cur_phase = 1;
            print_raw("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF Anti-Bruteforce was \a" .. v46.misc.interface_clr:get():to_hex() .. "reset\aFFFFFFFF due to round start.");
            common.add_event("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF Anti-Bruteforce was \a" .. v46.misc.interface_clr:get():to_hex() .. "reset\aFFFFFFFF due to round start.");
            v91.render.logs[#v91.render.logs + 1] = {
                text = "AB was reset due to round start.", 
                time = globals.curtime + 5, 
                color = v46.misc.interface_clr:get()
            };
            return;
        end;
    end);
    events.render:set(function(_)
        -- upvalues: v46 (ref), v42 (ref), v91 (ref)
        if ui.get_alpha() < 0.3 then
            return;
        else
            v46.antiaim.enable_customize:visibility(v46.antiaim.tab:get() == 2);
            v46.antiaim.type_transition:visibility(v46.antiaim.tab:get() == 2 and v46.antiaim.enable_customize:get());
            v46.antiaim.type_transition.pr_ticks:visibility(v46.antiaim.type_transition.predictive:get());
            v46.antiaim.delay_antiaims:visibility(v46.antiaim.tab:get() == 2 and v46.antiaim.enable_customize:get());
            v46.antiaim.randomization_antiaims:visibility(v46.antiaim.tab:get() == 2 and v46.antiaim.enable_customize:get());
            v46.antiaim.tweaks:visibility(v46.antiaim.tab:get() == 2);
            v46.antiaim.safehead:visibility(v46.antiaim.tab:get() == 2);
            v46.antiaim.manuals:visibility(v46.antiaim.tab:get() == 2);
            v46.antiaim.freestanding:visibility(v46.antiaim.tab:get() == 2);
            v46.antiaim.type:visibility(v46.antiaim.tab:get() == 1);
            v46.antiaim.conditions:visibility(v46.antiaim.type:get() ~= 1 and v46.antiaim.tab:get() == 1);
            local v484 = v46.antiaim.type:get() == 1 and v46.antiaim.tab:get() == 1 and "None" or v46.antiaim.conditions:get();
            local l_builder_0 = v46.antiaim.builder;
            v46.antiaim.antibrute.reset:visibility(v46.antiaim.type:get() == 3 and v46.antiaim.tab:get() == 1);
            v46.antiaim.antibrute.time_count:visibility(v46.antiaim.type:get() == 3 and v46.antiaim.antibrute.reset:get(2) and v46.antiaim.tab:get() == 1);
            v46.antiaim.antibrute.cur_phase:visibility(v46.antiaim.type:get() == 3 and v46.antiaim.tab:get() == 1);
            v46.antiaim.antibrute.phase:visibility(v46.antiaim.type:get() == 3 and v46.antiaim.tab:get() == 1);
            if #v46.antiaim.antibrute.cur_phase:list() ~= v46.antiaim.antibrute.phase:get() then
                local v486 = {};
                for v487 = 1, v46.antiaim.antibrute.phase:get() do
                    v486[v487] = "Phase " .. v487;
                end;
                v46.antiaim.antibrute.cur_phase:update(v486);
            end;
            local v488 = v46.antiaim.type:get();
            for v489 = 1, 10 do
                if v488 == 3 and v46.antiaim.tab:get() == 1 then
                    local v490 = v46.antiaim.antibrute.cur_phase:get();
                    local v491 = v46.antiaim.antibrute_aa["Phase " .. v489];
                    for _, v493 in pairs(v42.names) do
                        local v494 = v484 == v493 and "Phase " .. v489 == v490;
                        local v495 = v491[v493].override:get();
                        if v493 == "Shared" then
                            v495 = true;
                        end;
                        v491[v493].override:visibility(v494 and v493 ~= "Shared");
                        v491[v493].base_yaw:visibility(v494 and v495);
                        v491[v493].base_yaw.sync_with_desync:visibility(v491[v493].base_yaw:get() ~= "Static");
                        local l_offset_0 = v491[v493].offset;
                        local l_l_offset_0_0 = l_offset_0;
                        l_offset_0 = l_offset_0.visibility;
                        local v498;
                        if v494 then
                            if v495 then
                                v498 = v491[v493].base_yaw:get() == "Static";
                            else
                                v498 = v495;
                            end;
                        else
                            v498 = v494;
                        end;
                        l_offset_0(l_l_offset_0_0, v498);
                        l_offset_0 = v491[v493].left_offset;
                        l_l_offset_0_0 = l_offset_0;
                        l_offset_0 = l_offset_0.visibility;
                        if v494 then
                            if v495 then
                                v498 = v491[v493].base_yaw:get() ~= "Static";
                            else
                                v498 = v495;
                            end;
                        else
                            v498 = v494;
                        end;
                        l_offset_0(l_l_offset_0_0, v498);
                        l_offset_0 = v491[v493].right_offset;
                        l_l_offset_0_0 = l_offset_0;
                        l_offset_0 = l_offset_0.visibility;
                        if v494 then
                            if v495 then
                                v498 = v491[v493].base_yaw:get() ~= "Static";
                            else
                                v498 = v495;
                            end;
                        else
                            v498 = v494;
                        end;
                        l_offset_0(l_l_offset_0_0, v498);
                        l_offset_0 = v491[v493].delay_offset;
                        l_l_offset_0_0 = l_offset_0;
                        l_offset_0 = l_offset_0.visibility;
                        if v494 then
                            if v495 then
                                v498 = v491[v493].base_yaw:get() == "Delayed";
                            else
                                v498 = v495;
                            end;
                        else
                            v498 = v494;
                        end;
                        l_offset_0(l_l_offset_0_0, v498);
                        v491[v493].yaw_modifer:visibility(v494 and v495);
                        l_offset_0 = v491[v493].yaw_modifer_offset;
                        l_l_offset_0_0 = l_offset_0;
                        l_offset_0 = l_offset_0.visibility;
                        if v494 then
                            if v495 then
                                v498 = v491[v493].yaw_modifer:get() ~= "Disabled";
                            else
                                v498 = v495;
                            end;
                        else
                            v498 = v494;
                        end;
                        l_offset_0(l_l_offset_0_0, v498);
                        v491[v493].body_yaw:visibility(v494 and v495);
                        v491[v493].defensive_enable:visibility(v494 and v495);
                        v491[v493].defensive_enable.def_delay:visibility(v491[v493].defensive_enable.def_type:get() ~= "Always");
                        v491[v493].defensive_enable.def_pitch_offset:visibility(v491[v493].defensive_enable.def_pitch_type:get() == "Jitter" or v491[v493].defensive_enable.def_pitch_type:get() == "Custom");
                        v491[v493].defensive_enable.def_yaw_ways:visibility(v491[v493].defensive_enable.def_yaw_type:get() == "X-Ways [AUTO]");
                        v491[v493].defensive_enable.def_yaw_offset_left:visibility(v491[v493].defensive_enable.def_yaw_type:get() == "Jitter");
                        v491[v493].defensive_enable.def_yaw_offset_right:visibility(v491[v493].defensive_enable.def_yaw_type:get() == "Jitter");
                    end;
                    v91.render.antibrute = false;
                elseif not v91.render.antibrute then
                    local v499 = v46.antiaim.antibrute_aa["Phase " .. v489];
                    for _, v501 in pairs(v42.names) do
                        v499[v501].override:visibility(false);
                        v499[v501].base_yaw:visibility(false);
                        v499[v501].offset:visibility(false);
                        v499[v501].left_offset:visibility(false);
                        v499[v501].right_offset:visibility(false);
                        v499[v501].delay_offset:visibility(false);
                        v499[v501].yaw_modifer:visibility(false);
                        v499[v501].yaw_modifer_offset:visibility(false);
                        v499[v501].body_yaw:visibility(false);
                        v499[v501].defensive_enable:visibility(false);
                    end;
                    if v489 == 10 then
                        v91.render.antibrute = true;
                    end;
                end;
            end;
            if v488 == 2 and v46.antiaim.tab:get() == 1 then
                for _, v503 in pairs(v42.names) do
                    local v504 = l_builder_0[v503];
                    local v505 = v484 == v503;
                    local v506 = v503 == "Shared" or v504.override:get();
                    local v507 = v504.base_yaw:get();
                    local v508 = v504.defensive_enable.def_type:get();
                    local v509 = v504.defensive_enable.def_pitch_type:get();
                    local v510 = v504.defensive_enable.def_yaw_type:get();
                    v504.override:visibility(v505 and v503 ~= "Shared");
                    v504.base_yaw:visibility(v505 and v506);
                    v504.base_yaw.sync_with_desync:visibility(v507 ~= "Static");
                    v504.offset:visibility(v505 and v506 and v507 == "Static");
                    v504.left_offset:visibility(v505 and v506 and v507 ~= "Static");
                    v504.right_offset:visibility(v505 and v506 and v507 ~= "Static");
                    v504.delay_offset:visibility(v505 and v506 and v507 == "Delayed");
                    v504.yaw_modifer:visibility(v505 and v506);
                    v504.yaw_modifer_offset:visibility(v505 and v506 and v504.yaw_modifer:get() ~= "Disabled");
                    v504.body_yaw:visibility(v505 and v506);
                    v504.defensive_enable:visibility(v505 and v506);
                    v504.defensive_enable.def_delay:visibility(v508 ~= "Always");
                    v504.defensive_enable.def_pitch_offset:visibility(v509 == "Jitter" or v509 == "Custom");
                    v504.defensive_enable.def_yaw_ways:visibility(v510 == "X-Ways [AUTO]");
                    v504.defensive_enable.def_yaw_offset_left:visibility(v510 == "Jitter");
                    v504.defensive_enable.def_yaw_offset_right:visibility(v510 == "Jitter");
                end;
                v91.render.builder = false;
            elseif not v91.render.builder then
                for _, v512 in pairs(v42.names) do
                    local v513 = l_builder_0[v512];
                    v513.override:visibility(false);
                    v513.base_yaw:visibility(false);
                    v513.offset:visibility(false);
                    v513.left_offset:visibility(false);
                    v513.right_offset:visibility(false);
                    v513.delay_offset:visibility(false);
                    v513.yaw_modifer:visibility(false);
                    v513.yaw_modifer_offset:visibility(false);
                    v513.body_yaw:visibility(false);
                    v513.defensive_enable:visibility(false);
                end;
                v91.render.builder = true;
            end;
            return;
        end;
    end);
    events.render:set(function()
        -- upvalues: v46 (ref)
        local l_misc_0 = v46.misc;
        local v515 = l_misc_0.select:get();
        l_misc_0.ethereal_aim:visibility(v515 == 1);
        l_misc_0.idealtick:visibility(v515 == 1);
        l_misc_0.aimbotlogs:visibility(v515 == 1);
        l_misc_0.better_defensive:visibility(v515 == 1);
        l_misc_0.auto_teleport:visibility(v515 == 1);
        l_misc_0.nade_throw_fix:visibility(v515 == 1);
        l_misc_0.interface_clr:visibility(v515 == 2);
        l_misc_0.windows:visibility(v515 == 2);
        l_misc_0.nofications_on_screen:visibility(v515 == 2);
        l_misc_0.console_color:visibility(v515 == 2);
        l_misc_0.custom_scope:visibility(v515 == 2);
        l_misc_0.indicators:visibility(v515 == 2);
        l_misc_0.damage_indicator:visibility(v515 == 2);
        l_misc_0.velocity_warning:visibility(v515 == 2);
        l_misc_0.grenade_radius:visibility(v515 == 2);
        l_misc_0.spark_on_shot:visibility(v515 == 2);
        l_misc_0.aspect_ratio:visibility(v515 == 2);
        l_misc_0.viewmodel:visibility(v515 == 2);
        l_misc_0.keep_transperency_model:visibility(v515 == 2);
        l_misc_0.fast_ladder:visibility(v515 == 3);
        l_misc_0.super_toss:visibility(v515 == 3);
        l_misc_0.nfd:visibility(v515 == 3);
        l_misc_0.clantag:visibility(v515 == 3);
        l_misc_0.trashtalk:visibility(v515 == 3);
        l_misc_0.unmute:visibility(v515 == 3);
        l_misc_0.pingunlocker:visibility(v515 == 3);
    end);
    events.bullet_impact:set(function(v516)
        -- upvalues: v469 (ref), v46 (ref), v91 (ref), v170 (ref)
        v469.visuals.spark_on_shot(v516);
        local v517 = entity.get_local_player();
        if not v517 then
            return;
        elseif not v517:is_alive() then
            return;
        elseif entity.get_game_rules().m_bWarmupPeriod and v46.antiaim.tweaks:get(1) then
            return;
        elseif not entity.get(v516.userid, true) then
            return;
        elseif not entity.get(v516.userid, true):is_enemy() then
            return;
        else
            local v518 = v517:get_hitbox_position(1);
            if v518:dist((v518:closest_ray_point(entity.get(v516.userid, true):get_eye_position(), vector(v516.x, v516.y, v516.z)))) > 70 or v91.antiaim.last_swap + 0.05 > globals.curtime or not v170.can_hit(entity.get(v516.userid, true), v517, entity.get(v516.userid, true):get_eye_position(), "all", 1) then
                return;
            else
                v91.antiaim.unpredictable.cur_tick = utils.random_int(1, 2) == 1 and math.floor(globals.curtime - v91.antiaim.unpredictable.last_swap + (v91.antiaim.unpredictable.will_swap - globals.curtime)) or math.floor(globals.curtime - v91.antiaim.unpredictable.last_swap - (v91.antiaim.unpredictable.will_swap - globals.curtime));
                if v91.antiaim.unpredictable.cur_tick < 3 or v91.antiaim.unpredictable.cur_tick > 10 then
                    v91.antiaim.unpredictable.cur_tick = math.random(3, 10);
                end;
                v91.antiaim.last_swap = globals.curtime;
                if v46.antiaim.type:get() ~= 3 then
                    return;
                else
                    v91.antiaim.cur_phase = v91.antiaim.cur_phase + 1;
                    if v91.antiaim.cur_phase > v46.antiaim.antibrute.phase:get() then
                        v91.antiaim.cur_phase = 1;
                    end;
                    if v46.antiaim.antibrute.reset:get(2) then
                        v91.antiaim.time_to_reset = globals.curtime + v46.antiaim.antibrute.time_count:get();
                    end;
                    local v519 = string.len(entity.get(v516.userid, true):get_name()) > 11 and string.sub(entity.get(v516.userid, true):get_name(), 0, 11) .. "..." or entity.get(v516.userid, true):get_name();
                    print_raw("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF AB Phase was \a" .. v46.misc.interface_clr:get():to_hex() .. "changed\aFFFFFFFF due to " .. v519 .. " shoot at you. Current phase ~ \a" .. v46.misc.interface_clr:get():to_hex() .. v91.antiaim.cur_phase);
                    common.add_event("\a" .. v46.misc.interface_clr:get():to_hex() .. "[ethereal]\aFFFFFFFF AB Phase was \a" .. v46.misc.interface_clr:get():to_hex() .. "changed\aFFFFFFFF due to " .. v519 .. " shoot at you. Current phase ~ \a" .. v46.misc.interface_clr:get():to_hex() .. v91.antiaim.cur_phase);
                    v91.render.logs[#v91.render.logs + 1] = {
                        text = "Evaded shot by " .. v519, 
                        time = globals.curtime + 5, 
                        color = v46.misc.interface_clr:get()
                    };
                    return;
                end;
            end;
        end;
    end);
    events.aim_ack:set(function(v520)
        -- upvalues: v469 (ref), v46 (ref), v90 (ref), v170 (ref), v91 (ref)
        v469.ragebot.aimbot_logs(v520);
        if v46.misc.idealtick:get() and v90.ragebot.peek:get() and v90.ragebot.dt:get() then
            local v521 = false;
            local v522 = entity.get_local_player();
            local l_m_vecVelocity_0 = v522.m_vecVelocity;
            local v524 = v522:simulate_movement();
            v524:think(math.floor(5 * (l_m_vecVelocity_0:length2d() / 60)));
            if v520.target:is_alive() then
                v521 = v170.can_hit(v522, v520.target, vector(v524.origin.x, v524.origin.y, v524.origin.z + v524.view_offset), "all", 1);
            end;
            if v521 then
                rage.exploit:force_teleport();
                rage.exploit:force_charge();
                v91.ragebot.idealtick.teleported = true;
            end;
        end;
    end);
    events.shutdown:set(function()
        -- upvalues: v90 (ref), v91 (ref), v170 (ref), v19 (ref)
        cvar.sv_maxunlag:float(0.75);
        v90.antiaim.legs:set(v91.antiaim.leg_was);
        v91.materials.spark_material:reset();
        for v525 = 1, #v91.materials.vgui do
            if v170.findItem({
                [1] = "vgui_white", 
                [2] = "vgui/hud/800corner1", 
                [3] = "vgui/hud/800corner2", 
                [4] = "vgui/hud/800corner3", 
                [5] = "vgui/hud/800corner4"
            }, v91.materials.vgui[v525]:get_name()) then
                v91.materials.vgui[v525]:reset();
            end;
        end;
        db.comettech_lua = v19;
    end);
    events.player_death:set(function(v526)
        -- upvalues: v469 (ref)
        v469.misc.trashtalk(v526);
    end);
    events.createmove:set(function(v527)
        -- upvalues: v46 (ref), v91 (ref), v469 (ref)
        if not v46.misc.super_toss:get() then
            return;
        else
            local v528 = entity.get_local_player();
            if not v528 then
                return;
            elseif not v528:is_alive() then
                return;
            else
                local v529 = v528:simulate_movement();
                v529:think(1);
                v91.misc.super_toss.local_velocity = v529.velocity;
                v91.misc.super_toss.last_local_velocity = v528.m_vecVelocity;
                v469.misc.super_toss.compensate_throwable(v527, v528);
                return;
            end;
        end;
    end);
    events.grenade_override_view:set(function(v530)
        -- upvalues: v46 (ref), v469 (ref)
        if not v46.misc.super_toss:get() then
            return;
        else
            v469.misc.super_toss.compensate_prediction(v530);
            return;
        end;
    end);
    if v91.animation.start_time then
        v91.animation.time_count = v46.home.animation_on_load:get() and globals.curtime or 0;
        v91.animation.start_time = false;
    end;
    events.localplayer_transparency:set(function(v531)
        -- upvalues: v469 (ref)
        v469.visuals.kmt(v531);
    end);
    events.render:set(function()
        -- upvalues: v91 (ref), v46 (ref), v170 (ref), v473 (ref)
        if v91.animation.start and v46.home.animation_on_load:get() then
            local v532 = globals.curtime - v91.animation.time_count;
            v91.animation.alpha = v170.animations:animate("Logo", v532 < 0.2 or v532 > 3);
            local v533 = render.screen_size() * 0.5;
            render.blur(vector(0, 0), render.screen_size(), 1, 100 * v91.animation.alpha);
            render.rect(vector(-10, -10), vector(render.screen_size().x + 10, render.screen_size().y + 10), color(0, 100 * v91.animation.alpha));
            render.text(v91.animation.font_logo, v533, ui.get_style("Link Active"):lerp(v473, 1 - v91.animation.alpha):alpha_modulate(255 * v91.animation.alpha), "c", ui.get_icon("star-shooting"));
            if v532 >= 3.1 then
                v91.animation.start = false;
            end;
        end;
    end);
    common.add_notify("~ ethereal loaded ~", "ethereal loaded, enjoy the game!");
end);