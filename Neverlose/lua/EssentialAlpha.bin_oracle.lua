local l_pui_0 = require("neverlose/pui");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
ffi.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    typedef void* HCURSOR;\n    HCURSOR SetCursor(HCURSOR hCursor);\n    int SetCursorPos(int x, int y);\n");
local v3 = {
    last_updated = "07/27/2025", 
    version = "Alpha", 
    debug = false, 
    user = common.get_username()
};
v3.debug = v3.user == "baladeiros";
local v4 = {
    rage = {
        hit_chance = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        double_tap = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        double_tap_options = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        hide_shots = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hide_shots_options = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        min_damage = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        auto_stop_options = l_pui_0.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"), 
        safe_points = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Safe Points")
    }, 
    angles = {
        enabled = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yaw_base = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        yaw_modifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        yaw_modifier_offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        avoid_backstab = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        body_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        body_yaw_inverter = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        body_yaw_left_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        body_yaw_right_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        body_yaw_options = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        body_yaw_freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
    }, 
    misc = {
        freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        freestanding_body = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
        fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slow_walk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        leg_movement = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        fake_latency = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency")
    }, 
    movement = {
        air_strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }, 
    visuals = {
        scope_overlay = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
    }
};
local v53 = new_class():struct("utility")({
    gradient_anim = function(v5, v6, v7, v8)
        local v9 = globals.realtime / 2 % 1.2 * 2 - 1.2;
        local v10 = #v8;
        local v11 = {};
        for v12 = 1, v10 do
            local v13 = v8:sub(v12, v12);
            local v14 = v12 / v10;
            local l_r_0 = v5.r;
            local l_g_0 = v5.g;
            local l_b_0 = v5.b;
            local v18 = v14 - v9;
            if v18 >= 0 and v18 <= 1.4 then
                if v18 > 0.7 then
                    v18 = 1.4 - v18;
                end;
                local v19 = v18 / 0.8;
                l_r_0 = l_r_0 + (v6.r - l_r_0) * v19;
                l_g_0 = l_g_0 + (v6.g - l_g_0) * v19;
                l_b_0 = l_b_0 + (v6.b - l_b_0) * v19;
            end;
            v11[v12] = ("\a%02x%02x%02x%02x%s"):format(l_r_0, l_g_0, l_b_0, v7, v13);
        end;
        return table.concat(v11);
    end, 
    normalize_yaw = function(v20)
        return math.floor((v20 + 180) % 360 - 179.5);
    end, 
    crop_text = function(v21, v22)
        local v23 = "";
        local v24 = #v22;
        local v25 = v21 * (v24 / 100);
        local v26 = math.floor(v24 - v25 + 0.5);
        for v27 = 1, v24 do
            if v26 / 2 < v27 and v27 <= #v22 - v26 / 2 then
                v23 = v23 .. v22:sub(v27, v27);
            end;
        end;
        return v23;
    end, 
    tables = {
        get_position = function(v28, v29)
            local v30 = 0;
            for v31, _ in pairs(v28) do
                if v31 == v29 then
                    return v30;
                else
                    v30 = v30 + 1;
                end;
            end;
        end, 
        contains = function(v33, v34)
            for _, v36 in ipairs(v33) do
                if v36 == v34 then
                    return true;
                end;
            end;
            return false;
        end, 
        remove = function(v37, v38)
            for v39, v40 in ipairs(v37) do
                if v40 == v38 then
                    table.remove(v37, v39);
                end;
            end;
        end
    }, 
    debug_function_time = function(v41, v42, v43, ...)
        local v44 = {
            ...
        };
        local v45 = common.get_timestamp();
        pcall(v42, unpack(v44));
        local v46 = common.get_timestamp() - v45;
        local v47 = v43[v41];
        if not v47 then
            v43[v41] = v46;
            return;
        else
            if v47 < v46 then
                v43[v41] = v46;
                print(string.format("\aFF0000FFFunction %s overtook its previous highest process time. It took %.6f ms to process.", v41, v46));
            elseif v46 > 5 then
                v43[v41] = v46;
                print(string.format("\aFF4C4CFFFunction %s took longer than expected. It took %.6f ms to process.", v41, v46));
            end;
            return;
        end;
    end, 
    overrides = {}, 
    override = function(v48, v49, v50)
        table.insert(v48.overrides, v49);
        v49:override(v50);
    end, 
    check_overrides = function(v51)
        local _ = #v51.overrides;
        while #v51.overrides > 0 do
            if v51.overrides[1] then
                v51.overrides[1]:override();
            end;
            table.remove(v51.overrides, 1);
        end;
    end
}):struct("data")({
    airstrafe = false, 
    notification = {
        fade_out = 2, 
        hold = 1, 
        fade_in = 2, 
        hit_color = color(100, 255, 100), 
        miss_color = color(255, 100, 100)
    }
}):struct("antiaim")({
    static = false, 
    eye_yaw = 0, 
    antiaim_number = 0, 
    cancel_next_e = false, 
    in_ladder = 0, 
    yaw_offset = 0, 
    [1] = manual_override, 
    mouse_override = {
        active = false, 
        state = false
    }, 
    defensive_data = {}, 
    last_yaw_modifier_side = {
        [0] = 0, 
        [1] = 0
    }, 
    spin_value = {
        [0] = 0, 
        [1] = 0
    }, 
    yaw_modifier_offset = {
        [0] = 0, 
        [1] = 0
    }, 
    yaw_modifier_side = {
        [0] = 1, 
        [1] = 1
    }, 
    yaw_modifier_variance = {
        [0] = 0, 
        [1] = 0
    }, 
    builder = {}, 
    defensive = {}, 
    states = {
        full = {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Walking", 
            [4] = "Air", 
            [5] = "Air + Crouch", 
            [6] = "Fake Duck", 
            [7] = "Crouching", 
            [8] = "Crouch + Walk", 
            [9] = "Slow Walk", 
            [10] = "Safe Head"
        }, 
        menu = {}, 
        minimal = {
            [1] = "Global", 
            [2] = "Stand", 
            [3] = "Walk", 
            [4] = "Air", 
            [5] = "Air Crouch", 
            [6] = "Fake Duck", 
            [7] = "Crouch", 
            [8] = "Crouch Walk", 
            [9] = "Slow", 
            [10] = "Safe"
        }
    }
});
E_STATES = {
    SAFE = 10, 
    SLOW = 9, 
    CROUCHWALK = 8, 
    CROUCH = 7, 
    FAKEDUCK = 6, 
    AIRCROUCH = 5, 
    AIR = 4, 
    WALK = 3, 
    STAND = 2, 
    GLOBAL = 1
};
l_pui_0.accent = ui.get_style("Link Active"):to_hex();
local v54 = l_pui_0.create("\v\f<house-chimney>", {
    [1] = {
        [1] = "info", 
        [2] = "Information", 
        [3] = 1
    }, 
    [2] = {
        [1] = "presets", 
        [2] = "Presets", 
        [3] = 1
    }, 
    [3] = {
        [1] = "config", 
        [2] = "Configurations", 
        [3] = 2
    }
});
local v55 = l_pui_0.create("\v\f<shield-slash>", {
    [1] = {
        [1] = "tab", 
        [2] = "Tabs", 
        [3] = 1
    }, 
    [2] = {
        [1] = "rage", 
        [2] = "Ragebot Extensions", 
        [3] = 1
    }, 
    [3] = {
        [1] = "selector", 
        [2] = "Anti-aim builder", 
        [3] = 2
    }, 
    [4] = {
        [1] = "builder", 
        [2] = "", 
        [3] = 2
    }, 
    [5] = {
        [1] = "defensive", 
        [2] = "\n", 
        [3] = 2
    }, 
    [6] = {
        [1] = "tweaks", 
        [2] = "Anti-aim Tweaks", 
        [3] = 1
    }, 
    [7] = {
        [1] = "manuals", 
        [2] = "Manuals", 
        [3] = 1
    }, 
    [8] = {
        [1] = "animations", 
        [2] = "Animations", 
        [3] = 1
    }
});
local v56 = l_pui_0.create("\v\f<sparkles>", {
    [1] = {
        [1] = "tab", 
        [2] = "Tabs", 
        [3] = 1
    }, 
    [2] = {
        [1] = "misc", 
        [2] = "Miscellaneous", 
        [3] = 2
    }, 
    [3] = {
        [1] = "misc_other", 
        [2] = "\n\n", 
        [3] = 1
    }, 
    [4] = {
        [1] = "misc_other_other", 
        [2] = "\n\n\n", 
        [3] = 2
    }, 
    [5] = {
        [1] = "visuals", 
        [2] = "Visuals", 
        [3] = 2
    }, 
    [6] = {
        [1] = "visuals_other", 
        [2] = "\n\n\n\n", 
        [3] = 1
    }, 
    [7] = {
        [1] = "statistics", 
        [2] = "Statistics", 
        [3] = 2
    }
});
local v125 = {
    home = {
        welcome = v54.info:label("Welcome back, " .. common.get_username() .. "!"), 
        version = v54.info:label("Version: " .. v3.version), 
        updated = v54.info:label("Updated: " .. v3.last_updated), 
        preset_list = v54.presets:list("", {
            [1] = "\v\f<bolt>\r    Meta", 
            [2] = "\v\f<swords>\r   Aggressive", 
            [3] = "\v\f<fence>\r   Passive", 
            [4] = "\v\f<ghost>\r    Static"
        }), 
        description_meta = v54.presets:label("This preset is meant to match the current anti-aim \vmeta\r."), 
        description_aggressive = v54.presets:label("This preset is meant for a more \vaggressive\r play, which means this is the ideal preset for players that are \vconstantly keeping their enemies under pressure\r."), 
        description_passive = v54.presets:label("This preset is meant for a more \vpassive\r play, which means this is the ideal preset for players that are \vconstantly kept under pressure\r."), 
        description_static = v54.presets:label("This preset is meant to \vbait\r your enemies into thinking they can hit your head while it's \vhidden behind your body\r."), 
        load_preset = v54.presets:button("Load Preset", function()

        end, true), 
        configs = v54.config:list("", "Default"), 
        config_name = v54.config:input(""), 
        config_tabs = v54.config:selectable("", "Anti-aim", "Miscellaneous", "Visuals"), 
        save_and_load = v54.config:label("Manage Configs"), 
        save = v54.config:button("   \v\f<floppy-disk>" .. "   ", function()

        end, true), 
        load = v54.config:button("   \v\f<download>" .. "   ", function()

        end, true), 
        delete = v54.config:button("   \v\f<trash>" .. "   ", function()

        end, true), 
        import_and_export = v54.config:label("Import & Export"), 
        import = v54.config:button("  \v\f<file-import>" .. "   ", function()

        end, true), 
        export = v54.config:button("   \v\f<file-export>" .. "  ", function()

        end, true)
    }, 
    main = {
        tab = v55.tab:list("", {
            [1] = "\v\f<caret-right>\r    Ragebot Extensions", 
            [2] = "\v\f<caret-right>\r    Anti-aim Tweaks", 
            [3] = "\v\f<caret-right>\r    Animations"
        })
    }, 
    rage = {
        prediction_helper = v55.rage:switch("\v\f<burst>\r    Prediction Helper", false, function(v57)
            return {
                accuracy = v57:slider("Minimum Accuracy", 0, 100, 100, 1, function(v58)
                    return v58 .. "%";
                end), 
                warning = v57:label("\aCCB966FF\f<circle-exclamation>  Warning: Values lower than 93% may cause misses when jump scouting. Using in air hitchance override is recommended when using those values.")
            };
        end), 
        doubletap_fix = v55.rage:switch("\v\f<check-double>\r    \226\128\134Double Tap Fix"), 
        dynamic_hideshots = v55.rage:switch("\v\f<crosshairs>\r    Dynamic Hide Shots"), 
        override_hitchance = v55.rage:switch("\v\f<code-compare>\r    Override Hit Chance", false, function(v59)
            local v60 = {
                [1] = "No Scope", 
                [2] = "In Air"
            };
            local v61 = {
                [1] = "Scout", 
                [2] = "AWP", 
                [3] = "Auto", 
                [4] = "Revolver"
            };
            local v62 = {};
            for _, v64 in ipairs(v61) do
                table.insert(v62, "\v\f<caret-right>\r    " .. v64);
            end;
            local v65 = {
                condition = v59:list("", "\v\f<crosshairs>\r   No Scope", "\v\f<dove>\r   In Air")
            };
            local v66 = 1;
            for _, v68 in ipairs(v60) do
                v65[v68 .. " Weapon"] = v59:list("", v62);
                v65[v68 .. " Weapon"]:depend({
                    [1] = v65.condition, 
                    [2] = v66
                });
                for v69, v70 in ipairs(v61) do
                    if v69 > 3 and v68 == "No Scope" then
                        v65[v68 .. " " .. v70 .. " Hit Chance"] = v59:label("This weapon doesn't have a scope.");
                    else
                        v65[v68 .. " " .. v70 .. " Hit Chance"] = v59:slider("[\v" .. string.upper(string.sub(v68, 1, 1)) .. "\r] " .. "[\v" .. string.upper(string.sub(v70, 1, 2)) .. "\r]" .. " Hit Chance", -1, 100, -1, 1, function(v71)
                            return v71 == -1 and "Off" or v71 .. "%";
                        end);
                    end;
                    v65[v68 .. " " .. v70 .. " Hit Chance"]:depend({
                        [1] = v65.condition, 
                        [2] = v66
                    }, {
                        [1] = v65[v68 .. " Weapon"], 
                        [2] = v69
                    });
                end;
                v66 = v66 + 1;
            end;
            return v65;
        end)
    }, 
    antiaim = {
        conditions = v55.selector:combo("\v\f<caret-right>\r    Conditions", v53.antiaim.states.full), 
        builder = v55.selector:combo("\v\f<caret-right>\r    Builder", {
            [1] = "Anti-aim", 
            [2] = "Defensive"
        })
    }, 
    antiaim_tweaks = {
        lag_switch = v55.tweaks:switch("\v\f<transporter-1>\r   \226\128\134Lag Switch", false, function(v72)
            local v74 = {
                activation = v72:selectable("Activation", "In Air", "Exposed"), 
                mode = v72:combo("Mode", "Instant", "Defensive", "Tick Based"), 
                ticks = v72:slider("Ticks", 13, 20, 14, 1, function(v73)
                    return v73 == 14 and "Default" or v73 .. "t";
                end)
            };
            v74.ticks:depend({
                [1] = nil, 
                [2] = "Tick Based", 
                [1] = v74.mode
            });
            return v74;
        end), 
        safe_head = v55.tweaks:switch("\v\f<crosshairs>\r   \226\128\134Safe Head", false, function(v75, _)
            local v77 = {
                mode = v75:combo("Mode", {
                    [1] = "Height", 
                    [2] = "Trace", 
                    [3] = "Always On"
                }), 
                multipoint = v75:slider("Multipoint", 0, 100, 100)
            };
            v77.multipoint:depend({
                [1] = nil, 
                [2] = "Trace", 
                [3] = "Always On", 
                [1] = v77.mode
            });
            return v77, true;
        end, "\vHeight\r: Hides your head if you're above your enemy.\n\vTrace\r: Hides your head if a trace from your enemy's eye can't hit your head.\n\vExposure\r: Hides your head if \vTrace\r conditions are met or if you are behind a wall.\n\vMultipoint\r: The offset added to your head's position in the trace. Higher values mean less frequent but safer activations.\n\n\vNOTE\r: Modes that depend on traces don't use prediction, so you can still get backtracked on specific cases."), 
        avoid_backstab = v55.tweaks:switch("\v\f<knife-kitchen>\r   Avoid Backstab"), 
        trash_antiaim = v55.tweaks:label("\v\f<trash-list>\r  \226\128\134Trash Anti-aim", false, function(v78)
            return {
                condition = v78:selectable("Condition", "Warmup", "No Enemies"), 
                speed = v78:slider("Speed", 0, 100, 50, 1, function(v79)
                    return v79 .. "%";
                end)
            };
        end), 
        freestanding = v55.manuals:switch("\v\f<street-view>\r    Freestanding", false, function(v80)
            return {
                options = v80:selectable("Options", {
                    [1] = "Disable Yaw Modifiers", 
                    [2] = "Body Freestanding", 
                    [3] = "Disable Defensive"
                }), 
                disablers = v80:selectable("Disablers", {
                    [1] = "Global", 
                    [2] = "Standing", 
                    [3] = "Walking", 
                    [4] = "Air", 
                    [5] = "Air + Crouch", 
                    [6] = "Fake Duck", 
                    [7] = "Crouching", 
                    [8] = "Crouch + Walk", 
                    [9] = "Slow Walk"
                })
            };
        end), 
        manuals = v55.manuals:combo("\v\f<arrow-right-arrow-left>\r    Manual Side", {
            [1] = "None", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Forward"
        }, function(v81)
            return {
                options = v81:selectable("Options", {
                    [1] = "Disable Yaw Modifiers", 
                    [2] = "Disable Defensive"
                }), 
                mode = v81:combo("Mode", "At Target", "Local View")
            };
        end), 
        mouse_override = v55.manuals:switch(" \v\f<arrow-pointer>\r    \226\128\134Mouse Override", false, function(v82)
            return {
                options = v82:selectable("Options", {
                    [1] = "Disable Yaw Modifiers", 
                    [2] = "Disable Defensive"
                }), 
                mode = v82:combo("Mode", "At Target", "Local View"), 
                deadzone = v82:slider("Deadzone", 0, 150, 20), 
                limit = v82:slider("Limit", 0, 1000, 180), 
                col = v82:color_picker("Color", {
                    Simple = {
                        color(0, 255, 0)
                    }, 
                    Double = {
                        color(255, 0, 0), 
                        color(0, 255, 0)
                    }
                })
            };
        end)
    }, 
    animations = {
        shake_walk = v55.animations:switch("\v\f<temperature-snow>\r   Shake Walk"), 
        body_lean = v55.animations:switch("\v\f<person-snowboarding>\r    Body Lean", false, function(v83)
            return {
                amount = v83:slider("Amount", 0, 100, 50, 1, function(v84)
                    return v84 .. "%";
                end)
            };
        end), 
        pitch_zero = v55.animations:switch("\226\128\134\v\f<island-tropical>\r    Landing Pitch", false, function(v85)
            return {
                time = v85:slider("Time", 1, 100, 3, 0.1, function(v86)
                    return v86 / 10 .. "s";
                end)
            };
        end), 
        freeze_legs = v55.animations:switch(" \v\f<person-seat>\r    Freeze Legs", false, function(v87)
            return {
                conditions = v87:listable("", "Crouching", "Walking", "Running"), 
                spammer = v87:slider("Spammer", 0, 64, 0, 1, function(v88)
                    return v88 == 0 and "Off" or v88 .. "t";
                end)
            };
        end), 
        animation_breaker = v55.animations:switch("\v\f<backward>\r    Animation Breaker", false, function(v89)
            return {
                conditions = v89:listable("", "Stand When Crouching", "Crouch When Standing"), 
                midget_mode = v89:switch("Midget Mode")
            };
        end), 
        falling_animation = v55.animations:combo("\v\f<person-falling>\r    \226\128\134Falling Animation", "Default", "Static", "Moonwalk"), 
        leg_movement = v55.animations:combo("\v\f<boot-heeled>\r    Leg Movement", "Default", "Sliding", "Reverse Sliding", "Moonwalk", "Walking", "Jittering", "Reverse Jittering")
    }, 
    misc_tab = {
        tab = v56.tab:list("", {
            [1] = "\v\f<caret-right>\r    Miscellaneous", 
            [2] = "\v\f<caret-right>\r    Visuals", 
            [3] = "\v\f<caret-right>\r    Statistics"
        })
    }, 
    misc = {
        aspect_ratio = v56.misc:switch("\v\f<desktop>\r    Override Aspect Ratio", false, function(v90)
            return {
                val = v90:slider("Value", 0, 300, 0, 0.01, function(v91)
                    return v91 == 0 and "Off";
                end)
            };
        end), 
        viewmodel = v56.misc:switch("\v\f<gun>\r    Override Viewmodel", false, function(v92)
            return {
                fov = v92:slider("FOV", 0, 120, 68), 
                x = v92:slider("Offset X", -500, 500, 0, 0.1), 
                y = v92:slider("Offset Y", -500, 500, 0, 0.1), 
                z = v92:slider("Offset Z", -500, 500, 0, 0.1)
            };
        end), 
        camera = v56.misc:switch("\v\f<camera>\r    \226\128\134Override Camera", false, function(v93)
            return {
                x = v93:slider("Offset X", -500, 500, 0), 
                y = v93:slider("Offset Y", -500, 500, 0), 
                z = v93:slider("Offset Z", -500, 500, 0)
            };
        end), 
        bombsite_fix = v56.misc_other:switch("\v\f<bug>\r    \226\128\134Bombsite E Fix"), 
        no_fall_damage = v56.misc_other:switch(" \v\f<person-falling>\r    \226\128\134No Fall Damage"), 
        grenade_fix = v56.misc_other:switch("\v\f<bomb>\r    \226\128\134Grenade Fix", false, function(v94)
            local v95 = {
                experimental = v94:switch("Experimental")
            };
            v95.experimental:tooltip("Warning: This \vcould\r fuck up the grenade helper.");
            return v95;
        end), 
        unmute = v56.misc_other:switch("\v\f<volume-xmark>\r    Mute/Unmute Players", false, function(v96)
            return {
                mode = v96:combo("Action", {
                    [1] = "Mute", 
                    [2] = "Unmute"
                })
            };
        end), 
        fast_ladder = v56.misc_other_other:switch("\v\f<water-ladder>\r    Fast Ladder", false, function(v97)
            return {
                priority = v97:combo("Priority", {
                    [1] = "Precision", 
                    [2] = "Speed"
                })
            };
        end), 
        jumpshot = v56.misc_other_other:switch("\v\f<angel>\r   \226\128\134Jumpshot Helper", false, function(v98)
            return {
                dynamic_airstrafe = v98:switch("Dynamic Air Strafe"), 
                adaptative_airstop = v98:selectable("Adaptative Air Stop", {
                    [1] = "Dormant Check", 
                    [2] = "Distance Check"
                })
            };
        end, "This could interfere with your helper's playback. It's recommended to add your helper hotkey to turn this feature off."), 
        ping_spike = v56.misc_other_other:switch("\v\f<wifi-slash>\r   \226\128\134Fake Latency", false, function(v99)
            return {
                val = v99:slider("Value", 0, 1000, 200, 1, "ms")
            };
        end), 
        vertical_ai_peek = v56.misc_other_other:switch("\v\f<paper-plane>\r     Vertical AI Peek"), 
        fakeduck_utils = v56.misc_other_other:label("\v\f<lock-open>\r    Unlock Fake Duck", function(v100)
            return {
                unlock_speed = v100:switch("\v\f<gauge-simple-max>\r     Unlock Speed"), 
                freezetime = v100:switch("\v\f<wind>\r     Unlock Freezetime")
            };
        end)
    }, 
    visuals = {
        crosshair = v56.visuals:switch("\v\f<crosshairs>\r    \226\128\134Crosshair Indicators", false, function(v101)
            local v102 = {
                components = v101:list("", {
                    [1] = "\v\f<address-card>\r    Watermark", 
                    [2] = "\v\f<list>\r     State", 
                    [3] = "\v\f<code>\r    Exploit"
                })
            };
            local v103 = {
                watermark = {
                    enabled = v101:switch("\v\f<address-card>\r    Enabled", false, {
                        Double = {
                            ui.get_style("Link Active"), 
                            color(50, 50, 50)
                        }, 
                        Simple = {
                            color(255, 255, 255)
                        }
                    }), 
                    version = v101:switch("\v\f<address-card>\r    Show Version", false, {
                        Simple = {
                            color(255, 255, 255)
                        }, 
                        Double = {
                            ui.get_style("Link Active"), 
                            color(50, 50, 50)
                        }
                    }), 
                    font = v101:combo("\v\f<address-card>\r    Font", {
                        [1] = "Default", 
                        [2] = "Small", 
                        [3] = "Bold"
                    }), 
                    case = v101:combo("\v\f<address-card>\r    Case", {
                        [1] = "Upper", 
                        [2] = "Lower"
                    })
                }, 
                state = {
                    enabled = v101:switch("\v\f<list>\r     Enabled", false, {
                        Simple = {
                            color(255, 255, 255)
                        }, 
                        Double = {
                            ui.get_style("Link Active"), 
                            color(50, 50, 50)
                        }
                    }), 
                    detail = v101:combo("\v\f<list>\r     Detail", {
                        [1] = "None", 
                        [2] = "Dashes", 
                        [3] = "Tildes"
                    }), 
                    font = v101:combo("\v\f<list>\r     Font", {
                        [1] = "Default", 
                        [2] = "Small", 
                        [3] = "Bold"
                    }), 
                    case = v101:combo("\v\f<list>\r     Case", {
                        [1] = "Upper", 
                        [2] = "Lower"
                    })
                }, 
                exploit = {
                    enabled = v101:switch("\v\f<code>\r    Enabled"), 
                    mode = v101:combo("\v\f<code>\r    Mode", {
                        [1] = "Simple", 
                        [2] = "Detailed"
                    })
                }
            };
            for v104, v105 in pairs(v103) do
                for v106, v107 in pairs(v105) do
                    v102[v104 .. "_" .. v106] = v107;
                end;
            end;
            v102.watermark_enabled:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v102.components
            });
            v102.watermark_version:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v102.components
            });
            v102.watermark_font:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v102.components
            });
            v102.watermark_case:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v102.components
            });
            v102.state_enabled:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v102.components
            });
            v102.state_detail:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v102.components
            });
            v102.state_font:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v102.components
            });
            v102.state_case:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v102.components
            });
            v102.exploit_enabled:depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v102.components
            });
            v102.exploit_mode:depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v102.components
            });
            return v102;
        end), 
        watermark = v56.visuals:switch("\v\f<address-card>\r    Watermark", false, function(v108)
            return {
                color = v108:color_picker("Color", ui.get_style("Link Active")), 
                position = v108:combo("Position", {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Center"
                })
            };
        end), 
        min_damage = v56.visuals:switch("\v\f<hundred-points>\r    \226\128\134Minimum Damage", false, function(v109)
            return {
                override_only = v109:switch("Override Only"), 
                font = v109:combo("Font", {
                    [1] = "Default", 
                    [2] = "Small", 
                    [3] = "Bold"
                }), 
                offset = v109:slider("Offset", 0, 100, 0, 1, function(v110)
                    return v110 .. "px";
                end)
            };
        end), 
        manual_arrows = v56.visuals:switch("\v\f<arrows-left-right>\r    \226\128\134Manual Arrows", false, function(v111)
            return {
                style = v111:combo("Style", "Clean", "Modern", "Cozy"), 
                color = v111:color_picker("Color", ui.get_style("Link Active")), 
                spacing = v111:slider("Spacing", 0, 600, 50), 
                show_scoped = v111:switch("Show When Scoped", false), 
                show_disabled = v111:switch("Show When Disabled", true)
            };
        end), 
        aimbot_logs = v56.visuals:switch("\v\f<location-crosshairs-slash>\r   \226\128\134Aimbot Logs", false, function(v112)
            local v113 = {
                components = v112:list("", {
                    [1] = "\v\f<list>\r    General", 
                    [2] = "\v\f<rectangle-terminal>\r    Console", 
                    [3] = "\v\f<border-top-left>\r     Top Left", 
                    [4] = "\v\f<tv>\r   Screen"
                })
            };
            local v117 = {
                general = {
                    log_mode = v112:combo("\v\f<tv>\r   Log Mode", "Extended", "Simple"), 
                    color_mode = v112:combo("\v\f<tv>\r   Color Mode", "Dynamic", "Static"), 
                    color = v112:color_picker("\v\f<tv>\r   Color", color(255, 255, 255))
                }, 
                console = {
                    enabled = v112:switch("\v\f<rectangle-terminal>\r    Enabled"), 
                    color = v112:color_picker("\v\f<rectangle-terminal>\r    Color", ui.get_style("Link Active"))
                }, 
                top_left = {
                    enabled = v112:switch("\v\f<border-top-left>\r     Enabled"), 
                    watermark = v112:switch("\v\f<border-top-left>\r     Show Watermark")
                }, 
                screen = {
                    enabled = v112:switch("\v\f<tv>\r   Enabled"), 
                    style = v112:combo("\v\f<tv>\r   Style", "Neverlose", "Clean", "Shadowed"), 
                    shadow_mode = v112:combo("\v\f<tv>\r   Shadow Mode", "Dynamic", "Static"), 
                    shadow_color = v112:color_picker("\v\f<tv>\r   Shadow Color", ui.get_style("Link Active")), 
                    direction = v112:combo("\v\f<tv>\r   Direction", {
                        [1] = "Ascending", 
                        [2] = "Descending"
                    }, "Descending"), 
                    offset = v112:slider("\v\f<tv>\r   Offset", 0, 1000, 600), 
                    fade_in = v112:slider("\v\f<tv>\r   Fade In", 1, 100, 20, 0.1, function(v114)
                        return v114 / 10 .. "s";
                    end), 
                    hold = v112:slider("\v\f<tv>\r   Hold", 1, 100, 5, 0.1, function(v115)
                        return v115 / 10 .. "s";
                    end), 
                    fade_out = v112:slider("\v\f<tv>\r   Fade Out", 1, 100, 20, 0.1, function(v116)
                        return v116 / 10 .. "s";
                    end)
                }
            };
            for v118, v119 in pairs(v117) do
                for v120, v121 in pairs(v119) do
                    v113[v118 .. "_" .. v120] = v121;
                end;
            end;
            v113.general_log_mode:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v113.components
            });
            v113.general_color_mode:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v113.components
            });
            v113.general_color:depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v113.components
            }, {
                [1] = nil, 
                [2] = "Static", 
                [1] = v113.general_color_mode
            });
            v113.console_enabled:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v113.components
            });
            v113.console_color:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v113.components
            });
            v113.top_left_enabled:depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v113.components
            });
            v113.top_left_watermark:depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v113.components
            });
            v113.screen_enabled:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_style:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_shadow_mode:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            }, {
                [1] = nil, 
                [2] = "Shadowed", 
                [1] = v113.screen_style
            });
            v113.screen_shadow_color:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            }, {
                [1] = nil, 
                [2] = "Shadowed", 
                [1] = v113.screen_style
            }, {
                [1] = nil, 
                [2] = "Static", 
                [1] = v113.screen_shadow_mode
            });
            v113.screen_direction:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_offset:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_fade_in:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_hold:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            v113.screen_fade_out:depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v113.components
            });
            return v113;
        end), 
        kbit_hitmarker = v56.visuals_other:switch(" \226\128\134\v\f<plus>\r   \226\128\134\226\128\134\226\128\134Hit Marker", false, function(v122)
            return {
                color = v122:color_picker("Color"), 
                duration = v122:slider("Duration", 1, 20, 3, 1, "s"), 
                size = v122:slider("Size", 1, 20, 5, 1, "px"), 
                thickness = v122:slider("Thickness", 1, 20, 1, 1, "px")
            };
        end), 
        scope_overlay = v56.visuals_other:switch("\v\f<eye>\r    Scope Overlay", false, function(v123)
            return {
                mode = v123:combo("Mode", "+", "X"), 
                spacing = v123:slider("Spacing", 0, 500, 50), 
                length = v123:slider("Length", 0, render.screen_size().y / 2, 200), 
                thickness = v123:slider("Thickness", 0, 100, 0), 
                aspect_ratio = v123:switch("Mantain Aspect Ratio"), 
                col = v123:color_picker("Color", {
                    Simple = {
                        color(255, 255, 255)
                    }, 
                    Double = {
                        color(255, 255, 255), 
                        color(255, 255, 255, 0)
                    }
                })
            };
        end), 
        defensive_indicator = v56.visuals_other:switch("\v\f<shield-halved>\r    \226\128\134Defensive Indicator", false, function(v124)
            return {
                color = v124:color_picker("Color")
            };
        end), 
        velocity = v56.visuals_other:switch(" \v\f<wheelchair>\r   \226\128\134Slowdown Indicator", false, color(248, 157, 8))
    }, 
    statistics = {
        statistics_label = v56.statistics:label("  \v\f<info>\r     \226\128\134\226\128\134Match Statistics"), 
        kdr_label = v56.statistics:label(" \v\f<skull-crossbones>\r     Kill/Death Ratio (\v0\r/\v0\r)"), 
        kdr_button = v56.statistics:button("\v0%", function()

        end, true), 
        miss_ratio_label = v56.statistics:label("\v\f<location-crosshairs-slash>\r   \226\128\134\226\128\134Hit/Miss Ratio (\v0\r/\v0\r)"), 
        miss_ratio_button = v56.statistics:button("\v0%", function()

        end, true)
    }
};
local v167 = new_class():struct("configs")({
    last_clicked = 1, 
    configs = {}, 
    package = {}, 
    update_list = function(v126)
        -- upvalues: v125 (ref)
        local v127 = {
            [1] = "Default"
        };
        for v128, _ in pairs(v126.configs) do
            table.insert(v127, v128);
        end;
        v125.home.configs:update(v127);
    end, 
    setup = function(v130)
        -- upvalues: l_pui_0 (ref), v125 (ref), v53 (ref)
        v130.package = l_pui_0.setup({
            [1] = {
                [1] = v125.rage, 
                [2] = v53.antiaim.builder, 
                [3] = v53.antiaim.defensive, 
                [4] = v125.antiaim_tweaks, 
                [5] = v125.animations
            }, 
            [2] = {
                [1] = v125.misc
            }, 
            [3] = {
                [1] = v125.visuals
            }
        }, true);
        local l_status_0, l_result_0 = pcall(json.parse, db.essential);
        if l_status_0 then
            v130.configs = l_result_0;
            v130:update_list();
        end;
        v125.home.configs:set_callback(function(v133)
            -- upvalues: v130 (ref), v125 (ref)
            if v133:get() == 1 and v130.last_clicked ~= 1 then
                v125.home.config_name:set("");
                v130.last_clicked = 1;
                return;
            else
                local v134 = v130:get_current_config();
                if v125.home.config_name:get() ~= v134 then
                    v125.home.config_name:set(v134 == nil and v125.home.config_name:get() or v134);
                end;
                v130.last_clicked = v133:get();
                return;
            end;
        end);
        v125.home.config_name:set_callback(function(v135)
            -- upvalues: v53 (ref), v130 (ref), v125 (ref)
            local v136 = v135:get();
            local v137 = false;
            local v138 = v53.utility.tables.get_position(v130.configs, v136);
            if v138 ~= nil then
                v125.home.save:name("   \v\f<floppy-disk>   ");
                v125.home.save:tooltip("Save");
                v125.home.configs:set(v138 + 2);
            else
                if v136 == nil or v136:match("^%s*$") ~= nil or string.lower(v136) == "default" then
                    v137 = true;
                else
                    v125.home.save:name("   \v\f<plus>   ");
                    v125.home.save:tooltip("Create");
                end;
                v125.home.configs:set(1);
            end;
            v125.home.save:disabled(v137);
            v125.home.delete:disabled(v137);
        end);
        v125.home.save:set_callback(function()
            -- upvalues: v130 (ref)
            v130:save();
        end);
        v125.home.save:tooltip("Save");
        v125.home.load:set_callback(function()
            -- upvalues: v130 (ref)
            v130:load();
        end);
        v125.home.load:tooltip("Load");
        v125.home.delete:set_callback(function()
            -- upvalues: v130 (ref)
            v130:delete();
        end);
        v125.home.delete:tooltip("Delete");
        v125.home.import:set_callback(function()
            -- upvalues: v130 (ref)
            v130:import();
        end);
        v125.home.import:tooltip("Import");
        v125.home.export:set_callback(function()
            -- upvalues: v130 (ref)
            v130:export();
        end);
        v125.home.export:tooltip("Export");
    end, 
    get_config_tabs = function()
        -- upvalues: v53 (ref), v125 (ref)
        local v139 = {};
        if v53.utility.tables.contains(v125.home.config_tabs:get(), "Anti-aim") then
            table.insert(v139, {
                [1] = 1
            });
        end;
        if v53.utility.tables.contains(v125.home.config_tabs:get(), "Miscellaneous") then
            table.insert(v139, {
                [1] = 2
            });
        end;
        if v53.utility.tables.contains(v125.home.config_tabs:get(), "Visuals") then
            table.insert(v139, {
                [1] = 3
            });
        end;
        return table.unpack(v139);
    end, 
    get_current_config = function(v140)
        -- upvalues: v125 (ref)
        local v141 = {};
        local v142 = 0;
        for v143, _ in pairs(v140.configs) do
            v141[v142] = v143;
            v142 = v142 + 1;
        end;
        return v142 ~= 0 and v141[v125.home.configs:get() - 2] or nil;
    end, 
    save = function(v145)
        -- upvalues: v125 (ref)
        local v146 = v125.home.config_name:get();
        if v146 == nil or v146:match("^%s*$") ~= nil then
            common.add_notify("Error", "You can't save a config with an empty name.");
            return;
        else
            v145.configs[v146] = v145:export_current();
            v145:update_list();
            db.essential = json.stringify(v145.configs);
            local v147 = v125.home.save:tooltip();
            if v147 == "Save" then
                common.add_notify("Saved", "You saved the config " .. v146 .. ".");
            elseif v147 == "Create" then
                common.add_notify("Created", "You created the config " .. v146 .. ".");
            end;
            return;
        end;
    end, 
    load = function(v148)
        -- upvalues: v125 (ref)
        if v125.home.configs:get() == 1 then
            if v148:import_input("W1t7ImRvdWJsZXRhcF9maXgiOnRydWUsImR5bmFtaWNfaGlkZXNob3RzIjp0cnVlLCJvdmVycmlkZV9oaXRjaGFuY2UiOnRydWUsInByZWRpY3Rpb25faGVscGVyIjp0cnVlLCJ+b3ZlcnJpZGVfaGl0Y2hhbmNlIjp7IkluIEFpciBBV1AgSGl0Y2hhbmNlIjotMS4wLCJJbiBBaXIgQXV0byBIaXRjaGFuY2UiOi0xLjAsIkluIEFpciBSZXZvbHZlciBIaXRjaGFuY2UiOi0xLjAsIkluIEFpciBTY291dCBIaXRjaGFuY2UiOi0xLjAsIkluIEFpciBXZWFwb24iOjEuMCwiTm8gU2NvcGUgQVdQIEhpdGNoYW5jZSI6LTEuMCwiTm8gU2NvcGUgQXV0byBIaXRjaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFNjb3V0IEhpdGNoYW5jZSI6LTEuMCwiTm8gU2NvcGUgV2VhcG9uIjoxLjAsImNvbmRpdGlvbiI6MS4wfSwifnByZWRpY3Rpb25faGVscGVyIjp7ImFjY3VyYWN5IjoxMDAuMH19LFt7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo4LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjM4LjAsInNwZWVkIjoxLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdLCJyaWdodF9saW1pdCI6NTMuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxOS4wLCJzcGVlZCI6My4wLCJ2YXJpYW5jZSI6Ny4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1My4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjQ4LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjkuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzIuMCwic3BlZWQiOjUuMCwidmFyaWFuY2UiOjE1LjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjQ3LjAsIm9wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU2LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjkuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjMuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NDguMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1NC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxOS4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozMi4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MTIuMH19LHsiYm9keV95YXciOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiTG9jYWwgVmlldyIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU5LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTUuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MTcuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MTkuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ny4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMS4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoyMi4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6NDUuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTYuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1MS4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo5LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjM4LjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjozMC4wfX0seyJib2R5X3lhdyI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19XSxbeyJlbmFibGUiOnRydWUsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IlVwIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6LTQ1LjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MTgwLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOnRydWUsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkN1c3RvbSIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxODAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX1dLHsiYWlyX2xhZyI6ZmFsc2UsImF2b2lkX2JhY2tzdGFiIjp0cnVlLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJtYW51YWxzIjoiTm9uZSIsIm1vdXNlX292ZXJyaWRlIjpmYWxzZSwic2FmZV9oZWFkIjp0cnVlLCJ+YWlyX2xhZyI6eyJtb2RlIjoiSW5zdGFudCIsInRpY2tzIjoxNC4wfSwifmZyZWVzdGFuZGluZyI6eyJib2R5X2ZyZWVzdGFuZGluZyI6dHJ1ZSwiZGlzYWJsZV95YXdfbW9kaWZpZXJzIjp0cnVlfSwifm1hbnVhbHMiOnsic3RhdGljIjpmYWxzZX0sIn5tb3VzZV9vdmVycmlkZSI6eyJjb2wiOlsiRG91YmxlIiwiI0ZGMDAwMEZGIiwiIzAwRkYwMEZGIiwifiJdLCJkZWFkem9uZSI6MTgwLjB9LCJ+c2FmZV9oZWFkIjp7Im1vZGUiOiJIZWlnaHQiLCJtdWx0aXBvaW50Ijo3NS4wfX0seyJhbmltYXRpb25fYnJlYWtlciI6ZmFsc2UsImZyZWV6ZV9sZWdzIjpmYWxzZSwibGVnX21vdmVtZW50IjoiUmV2ZXJzZSBTbGlkaW5nIiwibW92ZV9sZWFuIjp0cnVlLCJwaXRjaF96ZXJvIjpmYWxzZSwic3RhdGljX2xlZ3MiOmZhbHNlLCJ+YW5pbWF0aW9uX2JyZWFrZXIiOnsiY29uZGl0aW9ucyI6WzEuMCwyLjAsIn4iXSwibWlkZ2V0X21vZGUiOnRydWV9LCJ+ZnJlZXplX2xlZ3MiOnsiY29uZGl0aW9ucyI6WyJ+Il19LCJ+bW92ZV9sZWFuIjp7ImFtb3VudCI6NTAuMH0sIn5waXRjaF96ZXJvIjp7InRpbWUiOjMuMH19XSxbeyJhc3BlY3RfcmF0aW8iOmZhbHNlLCJib21ic2l0ZV9maXgiOnRydWUsImNhbWVyYSI6ZmFsc2UsImZhc3RfbGFkZGVyIjp0cnVlLCJncmVuYWRlX2ZpeCI6dHJ1ZSwibm9fZmFsbF9kYW1hZ2UiOnRydWUsInN1cGVyX3Rvc3MiOmZhbHNlLCJ1bm11dGUiOnRydWUsInZpZXdtb2RlbCI6ZmFsc2UsIn5hc3BlY3RfcmF0aW8iOnsidmFsIjowLjB9LCJ+Y2FtZXJhIjp7IngiOjAuMCwieSI6MC4wLCJ6IjowLjB9LCJ+c3VwZXJfdG9zcyI6eyJoZWxwZXJfYmluZCI6MC4wfSwifnVubXV0ZSI6eyJtb2RlIjoiVW5tdXRlIn0sIn52aWV3bW9kZWwiOnsiZm92Ijo2OC4wLCJ4IjowLjAsInkiOjAuMCwieiI6MC4wfX1dLFt7Iip2ZWxvY2l0eSI6IiNGODlEMDhGRiIsImFpbWJvdF9sb2dzIjp0cnVlLCJpbmRpY2F0b3JzIjp0cnVlLCJtYW51YWxfYXJyb3dzIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwidmVsb2NpdHkiOnRydWUsIn5haW1ib3RfbG9ncyI6eyJjb21wb25lbnRzIjozLjAsImNvbnNvbGVfZW5hYmxlZCI6dHJ1ZSwic2NyZWVuX2NvbG9yIjoiI0NCQjlFOUZGIiwic2NyZWVuX2R1cmF0aW9uIjo0MC4wLCJzY3JlZW5fZW5hYmxlZCI6dHJ1ZSwic2NyZWVuX3N0eWxlIjoiTmV2ZXJsb3NlIiwidG9wX2xlZnRfY29sb3IiOiIjQzdGRjAwRkYiLCJ0b3BfbGVmdF9lbmFibGVkIjp0cnVlfSwifmluZGljYXRvcnMiOnsiY29tcG9uZW50cyI6MS4wLCJjcm9zc2hhaXJfY29sb3IiOiIjQ0JCOUU5RkYiLCJjcm9zc2hhaXJfZW5hYmxlZCI6dHJ1ZSwibWluX2RhbWFnZV9lbmFibGVkIjp0cnVlLCJ3YXRlcm1hcmtfY29sb3IiOiIjREVEN0UwRkYiLCJ3YXRlcm1hcmtfZW5hYmxlZCI6dHJ1ZSwid2F0ZXJtYXJrX3Bvc2l0aW9uIjoiTGVmdCJ9LCJ+bWFudWFsX2Fycm93cyI6eyJjb2xvciI6IiNDQkI5RTlGRiIsInNob3dfZGlzYWJsZWQiOnRydWUsInNob3dfc2NvcGVkIjpmYWxzZSwic3BhY2luZyI6NTAuMCwic3R5bGUiOiJDb3p5In0sIn5zY29wZV9vdmVybGF5Ijp7ImFzcGVjdF9yYXRpbyI6ZmFsc2UsImNvbCI6WyJEb3VibGUiLCIjRkZGRkZGQjAiLCIjRkZGRkZGMDAiLCJ+Il0sImxlbmd0aCI6MjAwLjAsInNwYWNpbmciOjI1LjAsInRoaWNrbmVzcyI6MC4wfX1dXQ==") then
                common.add_notify("Loaded", "You loaded the default config.");
            else
                common.add_notify("Error", "The default config is outdated. Please contact the script admins.");
            end;
            return;
        else
            local v149 = v148:get_current_config();
            if v148:import_input(v148.configs[v149]) then
                common.add_notify("Loaded", "You loaded the config " .. v149 .. ".");
            else
                common.add_notify("Error", "There was an error trying to load your config.");
            end;
            return;
        end;
    end, 
    delete = function(v150)
        -- upvalues: v125 (ref)
        if v125.home.configs:get() == 1 then
            common.add_notify("Error", "You can't delete the default config.");
            return;
        else
            local v151 = v150:get_current_config();
            v150.configs[v151] = nil;
            v150:update_list();
            v125.home.config_name:set("");
            db.essential = json.stringify(v150.configs);
            common.add_notify("Deleted", "You deleted the config " .. v151 .. ".");
            return;
        end;
    end, 
    import_input = function(v152, v153, v154)
        -- upvalues: l_base64_0 (ref)
        local l_status_1, l_result_1 = pcall(l_base64_0.decode, v153);
        if l_status_1 then
            local l_status_2, l_result_2 = pcall(json.parse, l_result_1);
            l_result_1 = l_result_2;
            l_status_1 = l_status_2;
        end;
        if l_status_1 then
            v152.package:load(l_result_1, v154 and v154 or v152:get_config_tabs());
        end;
        return l_status_1;
    end, 
    export_current = function(v159)
        -- upvalues: l_base64_0 (ref)
        local v160 = v159.package:save(v159:get_config_tabs());
        return l_base64_0.encode(json.stringify(v160));
    end, 
    import = function(v161)
        -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref)
        local l_status_3, l_result_3 = pcall(l_base64_0.decode, l_clipboard_0.get());
        if l_status_3 then
            local l_status_4, l_result_4 = pcall(json.parse, l_result_3);
            l_result_3 = l_result_4;
            l_status_3 = l_status_4;
        end;
        if l_status_3 then
            v161.package:load(l_result_3, v161:get_config_tabs());
            common.add_notify("Imported", "Config imported from clipboard.");
        else
            common.add_notify("Error", "Clipboard does not contain a config.");
        end;
    end, 
    export = function(v166)
        -- upvalues: l_clipboard_0 (ref)
        l_clipboard_0.set(v166:export_current());
        common.add_notify("Exported", "Config exported to clipboard.");
    end
});
v125.home.description_meta:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v125.home.preset_list
});
v125.home.description_aggressive:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v125.home.preset_list
});
v125.home.description_passive:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v125.home.preset_list
});
v125.home.description_static:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v125.home.preset_list
});
v125.home.load_preset:set_callback(function()
    -- upvalues: v125 (ref), v167 (ref), l_pui_0 (ref)
    local v168 = v125.home.preset_list:get();
    if v168 == 1 then
        v167.configs:import_input("W1t7ImRvdWJsZXRhcF9maXgiOnRydWUsImR5bmFtaWNfaGlkZXNob3RzIjp0cnVlLCJvdmVycmlkZV9oaXRjaGFuY2UiOnRydWUsInByZWRpY3Rpb25faGVscGVyIjpmYWxzZSwifm92ZXJyaWRlX2hpdGNoYW5jZSI6eyJJbiBBaXIgQVdQIEhpdCBDaGFuY2UiOi0xLjAsIkluIEFpciBBdXRvIEhpdCBDaGFuY2UiOi0xLjAsIkluIEFpciBSZXZvbHZlciBIaXQgQ2hhbmNlIjoyOC4wLCJJbiBBaXIgU2NvdXQgSGl0IENoYW5jZSI6NTAuMCwiSW4gQWlyIFdlYXBvbiI6MS4wLCJObyBTY29wZSBBV1AgSGl0IENoYW5jZSI6LTEuMCwiTm8gU2NvcGUgQXV0byBIaXQgQ2hhbmNlIjotMS4wLCJObyBTY29wZSBTY291dCBIaXQgQ2hhbmNlIjo2MC4wLCJObyBTY29wZSBXZWFwb24iOjEuMCwiY29uZGl0aW9uIjoxLjB9LCJ+cHJlZGljdGlvbl9oZWxwZXIiOnsiYWNjdXJhY3kiOjEwMC4wfX0sW3siYm9keV95YXciOnRydWUsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjYwLjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjguMCwicmlnaHRfb2Zmc2V0IjowLjAsInN3YXlfYW1vdW50IjowLjAsInN3YXlfc3BlZWQiOjUwLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzIuMCwib2Zmc2V0X21heCI6MC4wLCJvZmZzZXRfbWluIjowLjAsIm9mZnNldF9tb2RlIjoiQ29uc3RhbnQiLCJvcHRpb25zIjozLjAsInNwZWVkIjozLjAsInNwZWVkX21heCI6MS4wLCJzcGVlZF9taW4iOjEuMCwic3BlZWRfbW9kZSI6IkNvbnN0YW50IiwidmFyaWFuY2UiOjAuMCwidmFyaWFuY2VfbWF4IjowLjAsInZhcmlhbmNlX21pbiI6MC4wLCJ2YXJpYW5jZV9tb2RlIjoiQ29uc3RhbnQifX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTMuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6Ny4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9hbW91bnQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozNS4wLCJvZmZzZXRfbWF4IjowLjAsIm9mZnNldF9taW4iOjAuMCwib2Zmc2V0X21vZGUiOiJDb25zdGFudCIsIm9wdGlvbnMiOjEuMCwic3BlZWQiOjMuMCwic3BlZWRfbWF4IjoxLjAsInNwZWVkX21pbiI6MS4wLCJzcGVlZF9tb2RlIjoiQ29uc3RhbnQiLCJ2YXJpYW5jZSI6MC4wLCJ2YXJpYW5jZV9tYXgiOjAuMCwidmFyaWFuY2VfbWluIjowLjAsInZhcmlhbmNlX21vZGUiOiJDb25zdGFudCJ9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IlN3YXkiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1My4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjQ4LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjYuMCwicmlnaHRfb2Zmc2V0IjowLjAsInN3YXlfYW1vdW50Ijo1LjAsInN3YXlfc3BlZWQiOjkwLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzMuMCwib2Zmc2V0X21heCI6MC4wLCJvZmZzZXRfbWluIjowLjAsIm9mZnNldF9tb2RlIjoiQ29uc3RhbnQiLCJvcHRpb25zIjoxLjAsInNwZWVkIjozLjAsInNwZWVkX21heCI6NS4wLCJzcGVlZF9taW4iOjEuMCwic3BlZWRfbW9kZSI6IkNvbnN0YW50IiwidmFyaWFuY2UiOjAuMCwidmFyaWFuY2VfbWF4IjowLjAsInZhcmlhbmNlX21pbiI6MC4wLCJ2YXJpYW5jZV9tb2RlIjoiQ29uc3RhbnQifX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJTd2F5IiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NDcuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ni4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo3LjAsInJpZ2h0X29mZnNldCI6MC4wLCJzd2F5X2Ftb3VudCI6NC4wLCJzd2F5X3NwZWVkIjo4NS4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjI3LjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6My4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjQuMCwic3BlZWRfbWluIjoyLjAsInNwZWVkX21vZGUiOiJSYW5nZWQiLCJ2YXJpYW5jZSI6MC4wLCJ2YXJpYW5jZV9tYXgiOjAuMCwidmFyaWFuY2VfbWluIjowLjAsInZhcmlhbmNlX21vZGUiOiJDb25zdGFudCJ9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IlN3YXkiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo0OC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU0LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjEyLjAsInJpZ2h0X29mZnNldCI6MC4wLCJzd2F5X2Ftb3VudCI6NC4wLCJzd2F5X3NwZWVkIjo4NS4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjM2LjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6My4wLCJzcGVlZF9tYXgiOjUuMCwic3BlZWRfbWluIjozLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiYm9keV95YXciOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiTG9jYWwgVmlldyIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9hbW91bnQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1OS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU1LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjguMCwicmlnaHRfb2Zmc2V0IjowLjAsInN3YXlfYW1vdW50IjowLjAsInN3YXlfc3BlZWQiOjUwLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzAuMCwib2Zmc2V0X21heCI6MC4wLCJvZmZzZXRfbWluIjowLjAsIm9mZnNldF9tb2RlIjoiQ29uc3RhbnQiLCJvcHRpb25zIjozLjAsInNwZWVkIjozLjAsInNwZWVkX21heCI6Ny4wLCJzcGVlZF9taW4iOjIuMCwic3BlZWRfbW9kZSI6IlJhbmdlZCIsInZhcmlhbmNlIjozOS4wLCJ2YXJpYW5jZV9tYXgiOjAuMCwidmFyaWFuY2VfbWluIjowLjAsInZhcmlhbmNlX21vZGUiOiJDb25zdGFudCJ9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IlN3YXkiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1Mi4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU3LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjEyLjAsInJpZ2h0X29mZnNldCI6MC4wLCJzd2F5X2Ftb3VudCI6NC4wLCJzd2F5X3NwZWVkIjo5MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjMwLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6My4wLCJzcGVlZCI6My4wLCJzcGVlZF9tYXgiOjYuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjYwLjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjguMCwicmlnaHRfb2Zmc2V0IjowLjAsInN3YXlfYW1vdW50IjowLjAsInN3YXlfc3BlZWQiOjUwLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzcuMCwib2Zmc2V0X21heCI6MC4wLCJvZmZzZXRfbWluIjowLjAsIm9mZnNldF9tb2RlIjoiQ29uc3RhbnQiLCJvcHRpb25zIjozLjAsInNwZWVkIjozLjAsInNwZWVkX21heCI6MS4wLCJzcGVlZF9taW4iOjEuMCwic3BlZWRfbW9kZSI6IkNvbnN0YW50IiwidmFyaWFuY2UiOjAuMCwidmFyaWFuY2VfbWF4IjowLjAsInZhcmlhbmNlX21pbiI6MC4wLCJ2YXJpYW5jZV9tb2RlIjoiQ29uc3RhbnQifX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9hbW91bnQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxMy4wLCJvZmZzZXRfbWF4IjowLjAsIm9mZnNldF9taW4iOjAuMCwib2Zmc2V0X21vZGUiOiJDb25zdGFudCIsIm9wdGlvbnMiOjMuMCwic3BlZWQiOjMuMCwic3BlZWRfbWF4IjoxLjAsInNwZWVkX21pbiI6MS4wLCJzcGVlZF9tb2RlIjoiQ29uc3RhbnQiLCJ2YXJpYW5jZSI6MC4wLCJ2YXJpYW5jZV9tYXgiOjAuMCwidmFyaWFuY2VfbWluIjowLjAsInZhcmlhbmNlX21vZGUiOiJDb25zdGFudCJ9fV0sW3siZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMCwic3dheV9zcGVlZCI6NTAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsIm9mZnNldF9tYXgiOjAuMCwib2Zmc2V0X21pbiI6MC4wLCJvZmZzZXRfbW9kZSI6IkNvbnN0YW50Iiwib3B0aW9ucyI6MS4wLCJzcGVlZCI6Mi4wLCJzcGVlZF9tYXgiOjEuMCwic3BlZWRfbWluIjoxLjAsInNwZWVkX21vZGUiOiJDb25zdGFudCIsInZhcmlhbmNlIjowLjAsInZhcmlhbmNlX21heCI6MC4wLCJ2YXJpYW5jZV9taW4iOjAuMCwidmFyaWFuY2VfbW9kZSI6IkNvbnN0YW50In19XSx7ImF2b2lkX2JhY2tzdGFiIjp0cnVlLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJsYWdfc3dpdGNoIjpmYWxzZSwibWFudWFscyI6Ik5vbmUiLCJtb3VzZV9vdmVycmlkZSI6ZmFsc2UsInNhZmVfaGVhZCI6dHJ1ZSwidHJhc2hfYW50aWFpbSI6eyJjb25kaXRpb24iOlsiTm8gRW5lbWllcyIsIn4iXSwic3BlZWQiOjE1LjB9LCJ+ZnJlZXN0YW5kaW5nIjp7ImRpc2FibGVycyI6WyJBaXIiLCJBaXIgKyBDcm91Y2giLCJ+Il0sIm9wdGlvbnMiOlsifiJdfSwifmxhZ19zd2l0Y2giOnsiYWN0aXZhdGlvbiI6WyJ+Il0sIm1vZGUiOiJJbnN0YW50IiwidGlja3MiOjE0LjB9LCJ+bWFudWFscyI6eyJtb2RlIjoiTG9jYWwgVmlldyIsIm9wdGlvbnMiOlsifiJdfSwifm1vdXNlX292ZXJyaWRlIjp7ImNvbCI6WyJEb3VibGUiLCIjRkYwMDAwRkYiLCIjMDBGRjAwRkYiLCJ+Il0sImRlYWR6b25lIjoyMC4wLCJsaW1pdCI6MTgwLjAsIm1vZGUiOiJMb2NhbCBWaWV3Iiwib3B0aW9ucyI6WyJ+Il19LCJ+c2FmZV9oZWFkIjp7Im1vZGUiOiJUcmFjZSIsIm11bHRpcG9pbnQiOjg1LjB9fSx7ImFuaW1hdGlvbl9icmVha2VyIjpmYWxzZSwiYm9keV9sZWFuIjp0cnVlLCJmYWxsaW5nX2FuaW1hdGlvbiI6IkRlZmF1bHQiLCJmcmVlemVfbGVncyI6ZmFsc2UsImxlZ19tb3ZlbWVudCI6IkppdHRlcmluZyIsInBpdGNoX3plcm8iOmZhbHNlLCJzaGFrZV93YWxrIjpmYWxzZSwifmFuaW1hdGlvbl9icmVha2VyIjp7ImNvbmRpdGlvbnMiOlsxLjAsMi4wLCJ+Il0sIm1pZGdldF9tb2RlIjp0cnVlfSwifmJvZHlfbGVhbiI6eyJhbW91bnQiOjEwMC4wfSwifmZyZWV6ZV9sZWdzIjp7ImNvbmRpdGlvbnMiOlsifiJdLCJzcGFtbWVyIjowLjB9LCJ+cGl0Y2hfemVybyI6eyJ0aW1lIjozLjB9fV1d", {
            [1] = 1
        });
        common.add_notify("Loaded", l_pui_0.string("Loaded \vMeta\r preset."));
    elseif v168 == 2 then
        v167.configs:import_input("W1t7ImRvdWJsZXRhcF9maXgiOnRydWUsImR5bmFtaWNfaGlkZXNob3RzIjp0cnVlLCJvdmVycmlkZV9oaXRjaGFuY2UiOnRydWUsInByZWRpY3Rpb25faGVscGVyIjp0cnVlLCJ+b3ZlcnJpZGVfaGl0Y2hhbmNlIjp7IkluIEFpciBBV1AgSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIEF1dG8gSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIFJldm9sdmVyIEhpdCBDaGFuY2UiOjI4LjAsIkluIEFpciBTY291dCBIaXQgQ2hhbmNlIjo1MC4wLCJJbiBBaXIgV2VhcG9uIjoxLjAsIk5vIFNjb3BlIEFXUCBIaXQgQ2hhbmNlIjotMS4wLCJObyBTY29wZSBBdXRvIEhpdCBDaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFNjb3V0IEhpdCBDaGFuY2UiOjYwLjAsIk5vIFNjb3BlIFdlYXBvbiI6MS4wLCJjb25kaXRpb24iOjEuMH0sIn5wcmVkaWN0aW9uX2hlbHBlciI6eyJhY2N1cmFjeSI6MTAwLjB9fSxbeyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6OC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozMi4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTMuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6Ny4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozMi4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjUzLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NDguMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6Ni4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozOC4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo0Ny4wLCJvcHRpb25zIjpbIkF2b2lkIE92ZXJsYXAiLCJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ni4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo5LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjMwLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjozLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NDguMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1NC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMS4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozNi4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRfbGltaXQiOjYwLjB9LCJ+eWF3Ijp7ImJhc2UiOiJMb2NhbCBWaWV3IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1OS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU1LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjE3LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjE5LjAsInNwZWVkIjoxLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ny4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoyNC4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1Ni4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjUxLjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjkuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzguMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjMwLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjEzLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fV0sW3siZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fV0seyJhdm9pZF9iYWNrc3RhYiI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwibGFnX3N3aXRjaCI6ZmFsc2UsIm1hbnVhbHMiOiJOb25lIiwibW91c2Vfb3ZlcnJpZGUiOmZhbHNlLCJzYWZlX2hlYWQiOnRydWUsIn5mcmVlc3RhbmRpbmciOnsib3B0aW9ucyI6WyJ+Il19LCJ+bGFnX3N3aXRjaCI6eyJhY3RpdmF0aW9uIjpbIn4iXSwibW9kZSI6Ikluc3RhbnQiLCJ0aWNrcyI6MTQuMH0sIn5tYW51YWxzIjp7Im9wdGlvbnMiOlsifiJdfSwifm1vdXNlX292ZXJyaWRlIjp7ImNvbCI6WyJEb3VibGUiLCIjRkYwMDAwRkYiLCIjMDBGRjAwRkYiLCJ+Il0sImRlYWR6b25lIjoyMC4wLCJsaW1pdCI6MTgwLjAsIm1vZGUiOiJMb2NhbCBWaWV3Iiwib3B0aW9ucyI6WyJ+Il19LCJ+c2FmZV9oZWFkIjp7Im1vZGUiOiJIZWlnaHQiLCJtdWx0aXBvaW50Ijo3NS4wfX0seyJhbmltYXRpb25fYnJlYWtlciI6ZmFsc2UsImZhbGxpbmdfYW5pbWF0aW9uIjoiRGVmYXVsdCIsImZyZWV6ZV9sZWdzIjpmYWxzZSwibGVnX21vdmVtZW50IjoiUmV2ZXJzZSBTbGlkaW5nIiwibW92ZV9sZWFuIjp0cnVlLCJwaXRjaF96ZXJvIjpmYWxzZSwic2hha2Vfd2FsayI6ZmFsc2UsIn5hbmltYXRpb25fYnJlYWtlciI6eyJjb25kaXRpb25zIjpbMS4wLDIuMCwifiJdLCJtaWRnZXRfbW9kZSI6dHJ1ZX0sIn5mcmVlemVfbGVncyI6eyJjb25kaXRpb25zIjpbIn4iXSwic3BhbW1lciI6MC4wfSwifm1vdmVfbGVhbiI6eyJhbW91bnQiOjEwMC4wfSwifnBpdGNoX3plcm8iOnsidGltZSI6My4wfX1dXQ==", {
            [1] = 1
        });
        common.add_notify("Loaded", l_pui_0.string("Loaded \vAggressive\r preset."));
    elseif v168 == 3 then
        v167.configs:import_input("W1t7ImRvdWJsZXRhcF9maXgiOnRydWUsImR5bmFtaWNfaGlkZXNob3RzIjp0cnVlLCJvdmVycmlkZV9oaXRjaGFuY2UiOnRydWUsInByZWRpY3Rpb25faGVscGVyIjp0cnVlLCJ+b3ZlcnJpZGVfaGl0Y2hhbmNlIjp7IkluIEFpciBBV1AgSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIEF1dG8gSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIFJldm9sdmVyIEhpdCBDaGFuY2UiOjI4LjAsIkluIEFpciBTY291dCBIaXQgQ2hhbmNlIjo1MC4wLCJJbiBBaXIgV2VhcG9uIjoxLjAsIk5vIFNjb3BlIEFXUCBIaXQgQ2hhbmNlIjotMS4wLCJObyBTY29wZSBBdXRvIEhpdCBDaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFNjb3V0IEhpdCBDaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFdlYXBvbiI6MS4wLCJjb25kaXRpb24iOjEuMH0sIn5wcmVkaWN0aW9uX2hlbHBlciI6eyJhY2N1cmFjeSI6MTAwLjB9fSxbeyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6OC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozMi4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTMuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6Ny4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozNS4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjUzLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NDguMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6OC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozOC4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo0Ny4wLCJvcHRpb25zIjpbIkF2b2lkIE92ZXJsYXAiLCJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ni4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo5LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjE5LjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjozLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NDguMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1NC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMS4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0Ijo0Ni4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRfbGltaXQiOjYwLjB9LCJ+eWF3Ijp7ImJhc2UiOiJMb2NhbCBWaWV3IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1OS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjU1LjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjE3LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjE5LjAsInNwZWVkIjoxLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOnRydWUsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ny4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxOS4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6OC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0Ijo0MC4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxMy4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX1dLFt7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkN1c3RvbSIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOi00MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6LTc1LjAsIm9mZnNldCI6MTgwLjAsInJpZ2h0X29mZnNldCI6NzUuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJDdXN0b20iLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6IlNwaW4iLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjozMC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOnRydWUsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkN1c3RvbSIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOi00MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6LTEyNS4wLCJvZmZzZXQiOjE4MC4wLCJyaWdodF9vZmZzZXQiOjEyNS4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjp0cnVlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJDdXN0b20iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjotNDAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOi03NS4wLCJvZmZzZXQiOjE4MC4wLCJyaWdodF9vZmZzZXQiOjc1LjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOnRydWUsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjotODAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6ODAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX1dLHsiYXZvaWRfYmFja3N0YWIiOnRydWUsImZyZWVzdGFuZGluZyI6ZmFsc2UsImxhZ19zd2l0Y2giOmZhbHNlLCJtYW51YWxzIjoiTm9uZSIsIm1vdXNlX292ZXJyaWRlIjpmYWxzZSwic2FmZV9oZWFkIjp0cnVlLCJ+ZnJlZXN0YW5kaW5nIjp7Im9wdGlvbnMiOlsifiJdfSwifmxhZ19zd2l0Y2giOnsiYWN0aXZhdGlvbiI6WyJ+Il0sIm1vZGUiOiJJbnN0YW50IiwidGlja3MiOjE0LjB9LCJ+bWFudWFscyI6eyJvcHRpb25zIjpbIn4iXX0sIn5tb3VzZV9vdmVycmlkZSI6eyJjb2wiOlsiRG91YmxlIiwiI0ZGMDAwMEZGIiwiIzAwRkYwMEZGIiwifiJdLCJkZWFkem9uZSI6MjAuMCwibGltaXQiOjE4MC4wLCJtb2RlIjoiQXQgVGFyZ2V0Iiwib3B0aW9ucyI6WyJ+Il19LCJ+c2FmZV9oZWFkIjp7Im1vZGUiOiJIZWlnaHQiLCJtdWx0aXBvaW50Ijo3NS4wfX0seyJhbmltYXRpb25fYnJlYWtlciI6ZmFsc2UsImZhbGxpbmdfYW5pbWF0aW9uIjoiRGVmYXVsdCIsImZyZWV6ZV9sZWdzIjpmYWxzZSwibGVnX21vdmVtZW50IjoiTW9vbndhbGsiLCJtb3ZlX2xlYW4iOnRydWUsInBpdGNoX3plcm8iOmZhbHNlLCJzaGFrZV93YWxrIjpmYWxzZSwifmFuaW1hdGlvbl9icmVha2VyIjp7ImNvbmRpdGlvbnMiOlsxLjAsMi4wLCJ+Il0sIm1pZGdldF9tb2RlIjp0cnVlfSwifmZyZWV6ZV9sZWdzIjp7ImNvbmRpdGlvbnMiOlsifiJdLCJzcGFtbWVyIjowLjB9LCJ+bW92ZV9sZWFuIjp7ImFtb3VudCI6MTAwLjB9LCJ+cGl0Y2hfemVybyI6eyJ0aW1lIjozLjB9fV1d", {
            [1] = 1
        });
        common.add_notify("Loaded", l_pui_0.string("Loaded \vPassive\r preset."));
    elseif v168 == 4 then
        v167.configs:import_input("W1t7ImRvdWJsZXRhcF9maXgiOnRydWUsImR5bmFtaWNfaGlkZXNob3RzIjp0cnVlLCJvdmVycmlkZV9oaXRjaGFuY2UiOnRydWUsInByZWRpY3Rpb25faGVscGVyIjp0cnVlLCJ+b3ZlcnJpZGVfaGl0Y2hhbmNlIjp7IkluIEFpciBBV1AgSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIEF1dG8gSGl0IENoYW5jZSI6LTEuMCwiSW4gQWlyIFJldm9sdmVyIEhpdCBDaGFuY2UiOjI4LjAsIkluIEFpciBTY291dCBIaXQgQ2hhbmNlIjo1MC4wLCJJbiBBaXIgV2VhcG9uIjoxLjAsIk5vIFNjb3BlIEFXUCBIaXQgQ2hhbmNlIjotMS4wLCJObyBTY29wZSBBdXRvIEhpdCBDaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFNjb3V0IEhpdCBDaGFuY2UiOi0xLjAsIk5vIFNjb3BlIFdlYXBvbiI6MS4wLCJjb25kaXRpb24iOjEuMH0sIn5wcmVkaWN0aW9uX2hlbHBlciI6eyJhY2N1cmFjeSI6MTAwLjB9fSxbeyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjp0cnVlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6OC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxMy4wLCJzcGVlZCI6MS4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo1Ni4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjUzLjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjcuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzUuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6IlBlZWsgRmFrZSIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTMuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo0OC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo4LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjM4LjAsInNwZWVkIjoxLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo0Ny4wLCJvcHRpb25zIjpbIkF2b2lkIE92ZXJsYXAiLCJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ni4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0Ijo5LjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjE5LjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjozLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjQ4LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTQuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MTEuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6NDYuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiTG9jYWwgVmlldyIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImJvZHlfeWF3Ijp0cnVlLCJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6IkNlbnRlciIsIn5ib2R5X3lhdyI6eyJmcmVlc3RhbmRpbmciOiJPZmYiLCJpbnZlcnRlciI6ZmFsc2UsImxlZnRfbGltaXQiOjU5LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodF9saW1pdCI6NTUuMH0sIn55YXciOnsiYmFzZSI6IkF0IFRhcmdldCIsImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MTcuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MTkuMCwic3BlZWQiOjEuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo1Ny4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjoxMC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjoxOS4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJib2R5X3lhdyI6dHJ1ZSwiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ+Ym9keV95YXciOnsiZnJlZXN0YW5kaW5nIjoiT2ZmIiwiaW52ZXJ0ZXIiOmZhbHNlLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRfbGltaXQiOjYwLjB9LCJ+eWF3Ijp7ImJhc2UiOiJBdCBUYXJnZXQiLCJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjguMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6NDAuMCwic3BlZWQiOjEuMCwidmFyaWFuY2UiOjAuMH19LHsiYm9keV95YXciOnRydWUsImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwifmJvZHlfeWF3Ijp7ImZyZWVzdGFuZGluZyI6Ik9mZiIsImludmVydGVyIjpmYWxzZSwibGVmdF9saW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wfSwifnlhdyI6eyJiYXNlIjoiQXQgVGFyZ2V0IiwibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjEzLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fV0sW3siZW5hYmxlIjp0cnVlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJDdXN0b20iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjotNDAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOi05MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0Ijo5MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjE4MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiQ3VzdG9tIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJTcGluIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MzAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiQ3VzdG9tIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6LTQwLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjotMTI1LjAsIm9mZnNldCI6MTgwLjAsInJpZ2h0X29mZnNldCI6MTI1LjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJDdXN0b20iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjotNDAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOi03NS4wLCJvZmZzZXQiOjE4MC4wLCJyaWdodF9vZmZzZXQiOjc1LjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19LHsiZW5hYmxlIjpmYWxzZSwibW9kZSI6IkFsd2F5cyBPbiIsInBpdGNoIjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllciI6Ik5vbmUiLCJ+cGl0Y2giOnsidmFsIjowLjB9LCJ+eWF3Ijp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn55YXdfbW9kaWZpZXIiOnsib2Zmc2V0IjowLjAsInNwZWVkIjoyLjAsInZhcmlhbmNlIjowLjB9fSx7ImVuYWJsZSI6ZmFsc2UsIm1vZGUiOiJBbHdheXMgT24iLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3IjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHRfb2Zmc2V0IjowLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEb3duIiwieWF3IjoiQmFja3dhcmQiLCJ5YXdfbW9kaWZpZXIiOiJOb25lIiwifnBpdGNoIjp7InZhbCI6MC4wfSwifnlhdyI6eyJsZWZ0X29mZnNldCI6LTgwLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjgwLjB9LCJ+eWF3X21vZGlmaWVyIjp7Im9mZnNldCI6MC4wLCJzcGVlZCI6Mi4wLCJ2YXJpYW5jZSI6MC4wfX0seyJlbmFibGUiOmZhbHNlLCJtb2RlIjoiQWx3YXlzIE9uIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhdyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyIjoiTm9uZSIsIn5waXRjaCI6eyJ2YWwiOjAuMH0sIn55YXciOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifnlhd19tb2RpZmllciI6eyJvZmZzZXQiOjAuMCwic3BlZWQiOjIuMCwidmFyaWFuY2UiOjAuMH19XSx7ImF2b2lkX2JhY2tzdGFiIjp0cnVlLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJsYWdfc3dpdGNoIjpmYWxzZSwibWFudWFscyI6Ik5vbmUiLCJtb3VzZV9vdmVycmlkZSI6ZmFsc2UsInNhZmVfaGVhZCI6dHJ1ZSwifmZyZWVzdGFuZGluZyI6eyJvcHRpb25zIjpbIn4iXX0sIn5sYWdfc3dpdGNoIjp7ImFjdGl2YXRpb24iOlsifiJdLCJtb2RlIjoiSW5zdGFudCIsInRpY2tzIjoxNC4wfSwifm1hbnVhbHMiOnsib3B0aW9ucyI6WyJ+Il19LCJ+bW91c2Vfb3ZlcnJpZGUiOnsiY29sIjpbIkRvdWJsZSIsIiNGRjAwMDBGRiIsIiMwMEZGMDBGRiIsIn4iXSwiZGVhZHpvbmUiOjIwLjAsImxpbWl0IjoxODAuMCwibW9kZSI6IkF0IFRhcmdldCIsIm9wdGlvbnMiOlsifiJdfSwifnNhZmVfaGVhZCI6eyJtb2RlIjoiSGVpZ2h0IiwibXVsdGlwb2ludCI6NzUuMH19LHsiYW5pbWF0aW9uX2JyZWFrZXIiOmZhbHNlLCJmYWxsaW5nX2FuaW1hdGlvbiI6IkRlZmF1bHQiLCJmcmVlemVfbGVncyI6ZmFsc2UsImxlZ19tb3ZlbWVudCI6Ik1vb253YWxrIiwibW92ZV9sZWFuIjp0cnVlLCJwaXRjaF96ZXJvIjpmYWxzZSwic2hha2Vfd2FsayI6ZmFsc2UsIn5hbmltYXRpb25fYnJlYWtlciI6eyJjb25kaXRpb25zIjpbMS4wLDIuMCwifiJdLCJtaWRnZXRfbW9kZSI6dHJ1ZX0sIn5mcmVlemVfbGVncyI6eyJjb25kaXRpb25zIjpbIn4iXSwic3BhbW1lciI6MC4wfSwifm1vdmVfbGVhbiI6eyJhbW91bnQiOjEwMC4wfSwifnBpdGNoX3plcm8iOnsidGltZSI6My4wfX1dXQ==", {
            [1] = 1
        });
        common.add_notify("Loaded", l_pui_0.string("Loaded \vStatic\r preset."));
    end;
end);
v55.rage:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v125.main.tab
});
v55.tweaks:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v125.main.tab
});
v55.manuals:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v125.main.tab
});
v55.animations:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v125.main.tab
});
v125.antiaim_tweaks.mouse_override:set_callback(function(v169)
    -- upvalues: v53 (ref)
    if v169:get() and ui.get_alpha() == 0 then
        local v170 = render.screen_size() / 2;
        v53.antiaim.mouse_override.position = v170;
        v53.antiaim.mouse_override.state = v169:get();
        ffi.C.SetCursorPos(v170.x, v170.y);
    end;
end);
v125.rage.prediction_helper:tooltip("Lower Cases your \vHit Chance\r if your inaccuracy is low enough to try predicting players.\nThis can also make the ragebot shoot faster.\n\nBe aware that prediction is not the only factor affected by hitchance and you may miss more shots due to \vspread\r enabling this feature.");
v125.rage.doubletap_fix:tooltip("Enable this if the cheat isn't discharging the Double Tap exploit when you shoot.\n\nBe aware that this will enable \vBody Yaw\r, so if you have a reason to disable it you may not want to enable this.");
v125.rage.dynamic_hideshots:tooltip("Adapts the options for \vHide Shots\r to match the optimal settings for your current conditions.");
v125.rage.override_hitchance:tooltip("This is prioritized over \vPrediction Helper\r.");
for v171 = 1, #v53.antiaim.states.full do
    v53.antiaim.builder[v171] = {};
    local v172 = v53.antiaim.states.full[v171];
    local v173 = "\v" .. v172 .. " \a808080FF~ \r";
    local _ = "\v\f<user-shield>";
    v53.antiaim.builder[v171].label = v55.builder:label(v173 .. " Builder");
    v53.antiaim.builder[v171].label:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    });
    v53.antiaim.builder[v171].enable = v55.builder:switch("\v\f<user-shield>  \rEnable");
    v53.antiaim.builder[v171].enable:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    });
    v53.antiaim.builder[v171].pitch = v55.builder:combo("\226\128\134\v\f<arrow-up-arrow-down>   \226\128\134\rPitch", "Disabled", "Down", "Fake Up", "Fake Down");
    v53.antiaim.builder[v171].pitch:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.builder[v171].enable
    });
    v53.antiaim.builder[v171].yaw = v55.builder:combo("\v\f<arrow-right-arrow-left>   \226\128\134\rYaw", {
        [1] = "Disabled", 
        [2] = "Backward", 
        [3] = "Sway"
    }, false, function(v175, v176)
        local v178 = {
            base = v175:combo("Base", "Local View", "At Target"), 
            offset = v175:slider("Base Offset", -180, 180, 0), 
            left_offset = v175:slider("Left Offset", -180, 180, 0), 
            right_offset = v175:slider("Right Offset", -180, 180, 0), 
            sway_amount = v175:slider("Sway Amount", -180, 180, 0), 
            sway_speed = v175:slider("Sway Speed", 0, 100, 50, 1, function(v177)
                return v177 .. "%";
            end)
        };
        v178.sway_amount:depend({
            [1] = nil, 
            [2] = "Sway", 
            [1] = v176
        });
        return v178;
    end);
    v53.antiaim.builder[v171].yaw:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.builder[v171].enable
    });
    v53.antiaim.builder[v171].yaw.sway_speed:depend({
        [1] = nil, 
        [2] = "Sway", 
        [1] = v53.antiaim.builder[v171].yaw
    });
    v53.antiaim.builder[v171].yaw_modifier = v55.builder:combo("\v\f<arrows-rotate>   \226\128\134\rYaw Modifier", {
        [1] = "None", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Sway", 
        [5] = "Random", 
        [6] = "Spin", 
        [7] = "3-Way", 
        [8] = "5-Way"
    }, false, function(v179)
        local v183 = {
            [1] = {
                max = 180, 
                default = 0, 
                key = "offset", 
                name = "Offset", 
                min = -180, 
                index = 1, 
                format = function(v180)
                    return v180 .. "\194\176";
                end
            }, 
            [2] = {
                max = 100, 
                default = 0, 
                key = "variance", 
                name = "Variance", 
                min = 0, 
                index = 2, 
                format = function(v181)
                    return v181 .. "%";
                end
            }, 
            [3] = {
                max = 32, 
                default = 1, 
                key = "speed", 
                name = "Speed", 
                min = 1, 
                index = 3, 
                format = function(v182)
                    return v182 == 1 and "NL" or v182 .. "t";
                end
            }
        };
        local v184 = {};
        for _, v186 in pairs(v183) do
            v184[v186.index] = v186.name;
        end;
        local v187 = {
            options = v179:list("", v184)
        };
        for _, v189 in pairs(v183) do
            local l_key_0 = v189.key;
            v187[l_key_0 .. "_mode"] = v179:combo(v189.name .. " Mode", {
                [1] = "Constant", 
                [2] = "Ranged"
            });
            v187[l_key_0 .. "_mode"]:depend({
                [1] = v187.options, 
                [2] = v189.index
            });
            v187[l_key_0] = v179:slider(v189.name, v189.min, v189.max, v189.default, 1, v189.format);
            v187[l_key_0]:depend({
                [1] = v187.options, 
                [2] = v189.index
            }, {
                [1] = nil, 
                [2] = "Constant", 
                [1] = v187[l_key_0 .. "_mode"]
            });
            v187[l_key_0 .. "_min"] = v179:slider("Min. " .. v189.name, v189.min, v189.max, v189.default, 1, v189.format);
            v187[l_key_0 .. "_min"]:depend({
                [1] = v187.options, 
                [2] = v189.index
            }, {
                [1] = nil, 
                [2] = "Ranged", 
                [1] = v187[l_key_0 .. "_mode"]
            });
            v187[l_key_0 .. "_max"] = v179:slider("Max. " .. v189.name, v189.min, v189.max, v189.default, 1, v189.format);
            v187[l_key_0 .. "_max"]:depend({
                [1] = v187.options, 
                [2] = v189.index
            }, {
                [1] = nil, 
                [2] = "Ranged", 
                [1] = v187[l_key_0 .. "_mode"]
            });
        end;
        return v187;
    end);
    v53.antiaim.builder[v171].yaw_modifier:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.builder[v171].enable
    });
    v53.antiaim.builder[v171].body_yaw = v55.builder:switch("\v\f<arrow-up-short-wide>  \226\128\134\226\128\134\rBody Yaw", false, function(v191)
        return {
            inverter = v191:switch("Inverter"), 
            left_limit = v191:slider("Left Limit", 0, 60, 60), 
            right_limit = v191:slider("Right Limit", 0, 60, 60), 
            options = v191:selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"), 
            freestanding = v191:combo("Freestanding", "Off", "Peek Fake", "Peek Real")
        };
    end);
    v53.antiaim.builder[v171].body_yaw:depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.builder[v171].enable
    });
    v55.builder:label("Manage Current Builder"):depend({
        [1] = nil, 
        [2] = "Anti-aim", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v172
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.builder[v171].enable
    });
    do
        local l_v171_0 = v171;
        v53.antiaim.builder[l_v171_0].import = v55.builder:button("  \v\f<file-import>" .. "   ", function()
            -- upvalues: l_pui_0 (ref), v53 (ref), l_v171_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
            local v193 = l_pui_0.setup(v53.antiaim.builder[l_v171_0], true);
            local l_status_5, l_result_5 = pcall(l_base64_0.decode, l_clipboard_0.get());
            if l_status_5 then
                local l_status_6, l_result_6 = pcall(json.parse, l_result_5);
                l_result_5 = l_result_6;
                l_status_5 = l_status_6;
            end;
            if l_status_5 then
                v193:load(l_result_5);
                common.add_notify("Imported", "Builder imported from clipboard.");
            else
                common.add_notify("Error", "Clipboard does not contain a builder.");
            end;
        end, true);
        v53.antiaim.builder[l_v171_0].import:tooltip("Import");
        v53.antiaim.builder[l_v171_0].import:depend({
            [1] = nil, 
            [2] = "Anti-aim", 
            [1] = v125.antiaim.builder
        }, {
            [1] = v125.antiaim.conditions, 
            [2] = v172
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v53.antiaim.builder[l_v171_0].enable
        });
        v53.antiaim.builder[l_v171_0].export = v55.builder:button("   \v\f<file-export>" .. "  ", function()
            -- upvalues: l_pui_0 (ref), v53 (ref), l_v171_0 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
            local v198 = l_pui_0.setup(v53.antiaim.builder[l_v171_0], true);
            l_clipboard_0.set(l_base64_0.encode(json.stringify(v198:save())));
            common.add_notify("Exported", "Builder exported to clipboard.");
        end, true);
        v53.antiaim.builder[l_v171_0].export:tooltip("Export");
        v53.antiaim.builder[l_v171_0].export:depend({
            [1] = nil, 
            [2] = "Anti-aim", 
            [1] = v125.antiaim.builder
        }, {
            [1] = v125.antiaim.conditions, 
            [2] = v172
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v53.antiaim.builder[l_v171_0].enable
        });
    end;
end;
for v199 = 1, #v53.antiaim.states.full do
    v53.antiaim.defensive[v199] = {};
    local v200 = v53.antiaim.states.full[v199];
    local v201 = "\v" .. v200 .. " \a808080FF~ \r";
    local v202 = "\v\f<shield-quartered>";
    v53.antiaim.defensive[v199].label = v55.defensive:label(v201 .. " Defensive Builder");
    v53.antiaim.defensive[v199].label:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    });
    v53.antiaim.defensive[v199].enable = v55.defensive:switch(v202 .. "  \rEnable");
    v53.antiaim.defensive[v199].enable:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    });
    v53.antiaim.defensive[v199].mode = v55.defensive:combo(v202 .. "  \rMode", {
        [1] = "Always On", 
        [2] = "On Peek"
    });
    v53.antiaim.defensive[v199].mode:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.defensive[v199].enable
    });
    v53.antiaim.defensive[v199].pitch = v55.defensive:combo(v202 .. "  \rPitch", {
        [1] = "Disabled", 
        [2] = "Up", 
        [3] = "Down", 
        [4] = "Random", 
        [5] = "Custom"
    }, false, function(v203)
        return {
            val = v203:slider("Custom Pitch", -89, 89, 0)
        };
    end);
    v53.antiaim.defensive[v199].pitch:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.defensive[v199].enable
    });
    v53.antiaim.defensive[v199].pitch.val:depend({
        [1] = nil, 
        [2] = "Custom", 
        [1] = v53.antiaim.defensive[v199].pitch
    });
    v53.antiaim.defensive[v199].yaw = v55.defensive:combo(v202 .. "  \rYaw", {
        [1] = "Disabled", 
        [2] = "Backward", 
        [3] = "Sway"
    }, false, function(v204)
        return {
            offset = v204:slider("Base Offset", -180, 180, 0), 
            left_offset = v204:slider("Left Offset", -180, 180, 0), 
            right_offset = v204:slider("Right Offset", -180, 180, 0), 
            sway_speed = v204:slider("Sway Speed", 10, 100, 50, 1, function(v205)
                return v205 .. "%";
            end)
        };
    end);
    v53.antiaim.defensive[v199].yaw:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.defensive[v199].enable
    });
    v53.antiaim.defensive[v199].yaw.sway_speed:depend({
        [1] = nil, 
        [2] = "Sway", 
        [1] = v53.antiaim.defensive[v199].yaw
    });
    v53.antiaim.defensive[v199].yaw_modifier = v55.defensive:combo(v202 .. "  \rYaw Modifier", {
        [1] = "None", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Sway", 
        [5] = "Random", 
        [6] = "Spin", 
        [7] = "3-Way", 
        [8] = "5-Way"
    }, false, function(v206)
        local v210 = {
            [1] = {
                max = 180, 
                default = 0, 
                key = "offset", 
                name = "Offset", 
                min = -180, 
                index = 1, 
                format = function(v207)
                    return v207 .. "\194\176";
                end
            }, 
            [2] = {
                max = 100, 
                default = 0, 
                key = "variance", 
                name = "Variance", 
                min = 0, 
                index = 2, 
                format = function(v208)
                    return v208 .. "%";
                end
            }, 
            [3] = {
                max = 32, 
                default = 1, 
                key = "speed", 
                name = "Speed", 
                min = 1, 
                index = 3, 
                format = function(v209)
                    return v209 == 1 and "NL" or v209 .. "t";
                end
            }
        };
        local v211 = {};
        for _, v213 in pairs(v210) do
            v211[v213.index] = v213.name;
        end;
        local v214 = {
            options = v206:list("", v211)
        };
        for _, v216 in pairs(v210) do
            local l_key_1 = v216.key;
            v214[l_key_1 .. "_mode"] = v206:combo(v216.name .. " Mode", {
                [1] = "Constant", 
                [2] = "Ranged"
            });
            v214[l_key_1 .. "_mode"]:depend({
                [1] = v214.options, 
                [2] = v216.index
            });
            v214[l_key_1] = v206:slider(v216.name, v216.min, v216.max, v216.default, 1, v216.format);
            v214[l_key_1]:depend({
                [1] = v214.options, 
                [2] = v216.index
            }, {
                [1] = nil, 
                [2] = "Constant", 
                [1] = v214[l_key_1 .. "_mode"]
            });
            v214[l_key_1 .. "_min"] = v206:slider("Min. " .. v216.name, v216.min, v216.max, v216.default, 1, v216.format);
            v214[l_key_1 .. "_min"]:depend({
                [1] = v214.options, 
                [2] = v216.index
            }, {
                [1] = nil, 
                [2] = "Ranged", 
                [1] = v214[l_key_1 .. "_mode"]
            });
            v214[l_key_1 .. "_max"] = v206:slider("Max. " .. v216.name, v216.min, v216.max, v216.default, 1, v216.format);
            v214[l_key_1 .. "_max"]:depend({
                [1] = v214.options, 
                [2] = v216.index
            }, {
                [1] = nil, 
                [2] = "Ranged", 
                [1] = v214[l_key_1 .. "_mode"]
            });
        end;
        return v214;
    end);
    v53.antiaim.defensive[v199].yaw_modifier:depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.defensive[v199].enable
    });
    v55.defensive:label("Manage Current Builder"):depend({
        [1] = nil, 
        [2] = "Defensive", 
        [1] = v125.antiaim.builder
    }, {
        [1] = v125.antiaim.conditions, 
        [2] = v200
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v53.antiaim.defensive[v199].enable
    });
    do
        local l_v199_0 = v199;
        v53.antiaim.defensive[l_v199_0].import = v55.defensive:button("  \v\f<file-import>" .. "   ", function()
            -- upvalues: l_pui_0 (ref), v53 (ref), l_v199_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
            local v219 = l_pui_0.setup(v53.antiaim.defensive[l_v199_0], true);
            local l_status_7, l_result_7 = pcall(l_base64_0.decode, l_clipboard_0.get());
            if l_status_7 then
                local l_status_8, l_result_8 = pcall(json.parse, l_result_7);
                l_result_7 = l_result_8;
                l_status_7 = l_status_8;
            end;
            if l_status_7 then
                v219:load(l_result_7);
                common.add_notify("Imported", "Builder imported from clipboard.");
            else
                common.add_notify("Error", "Clipboard does not contain a builder.");
            end;
        end, true);
        v53.antiaim.defensive[l_v199_0].import:tooltip("Import");
        v53.antiaim.defensive[l_v199_0].import:depend({
            [1] = nil, 
            [2] = "Defensive", 
            [1] = v125.antiaim.builder
        }, {
            [1] = v125.antiaim.conditions, 
            [2] = v200
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v53.antiaim.defensive[l_v199_0].enable
        });
        v53.antiaim.defensive[l_v199_0].export = v55.defensive:button("   \v\f<file-export>" .. "  ", function()
            -- upvalues: l_pui_0 (ref), v53 (ref), l_v199_0 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
            local v224 = l_pui_0.setup(v53.antiaim.defensive[l_v199_0], true);
            l_clipboard_0.set(l_base64_0.encode(json.stringify(v224:save())));
            common.add_notify("Exported", "Builder exported to clipboard.");
        end, true);
        v53.antiaim.defensive[l_v199_0].export:tooltip("Export");
        v53.antiaim.defensive[l_v199_0].export:depend({
            [1] = nil, 
            [2] = "Defensive", 
            [1] = v125.antiaim.builder
        }, {
            [1] = v125.antiaim.conditions, 
            [2] = v200
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v53.antiaim.defensive[l_v199_0].enable
        });
    end;
end;
local v225 = nil;
local v365 = new_class():struct("menu")({
    handle_overrides = function(_)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref)
        if v125.visuals.scope_overlay:get() then
            v53.utility:override(v4.visuals.scope_overlay, "Remove All");
        end;
    end
}):struct("rage")({
    doubletap_fix = function(_, v228)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref)
        if not v125.rage.doubletap_fix:get() then
            return;
        else
            local v229 = entity.get_local_player();
            local v230 = entity.get(v228.userid, true);
            if v229 and v230 and v229:get_index() == v230:get_index() then
                v53.antiaim.cancel_next_e = true;
                v53.utility:override(v4.angles.enabled, true);
                v53.utility:override(v4.angles.body_yaw, true);
            end;
            return;
        end;
    end, 
    dynamic_hideshots = function(v231)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref)
        if v125.rage.dynamic_hideshots:get() then
            if v231.antiaim.ground_tick > 2 then
                v53.utility:override(v4.rage.hide_shots_options, "Favor Fire Rate");
            else
                v53.utility:override(v4.rage.hide_shots_options, "Break LC");
            end;
        end;
    end, 
    weapons = {
        ["SSG 08"] = "Scout", 
        ["R8 Revolver"] = "Revolver", 
        ["SCAR-20"] = "Auto", 
        G3SG1 = "Auto", 
        AWP = "AWP"
    }, 
    menu_weapons = {
        ["SSG 08"] = "SSG-08", 
        ["R8 Revolver"] = "R8 Revolver", 
        ["SCAR-20"] = "AutoSnipers", 
        G3SG1 = "AutoSnipers", 
        AWP = "AWP"
    }, 
    override_hitchance = function(v232)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref)
        local v233 = entity.get_local_player();
        if not v233 or not v233:is_alive() then
            return;
        else
            local v234 = v233:get_player_weapon();
            if not v234 then
                return;
            else
                if v125.rage.prediction_helper:get() and v234:get_inaccuracy() < 0.001 * (101 - v125.rage.prediction_helper.accuracy:get()) then
                    v53.utility:override(v4.rage.hit_chance, 250 * v234:get_inaccuracy());
                end;
                if v125.rage.override_hitchance:get() then
                    local v235 = v234:get_name();
                    if v232.weapons[v235] then
                        local l_m_bIsScoped_0 = v233.m_bIsScoped;
                        local v237 = v232.antiaim.ground_tick < 2;
                        local v238 = v125.rage.override_hitchance["No Scope " .. v232.weapons[v235] .. " Hit Chance"];
                        local v239 = v125.rage.override_hitchance["In Air " .. v232.weapons[v235] .. " Hit Chance"];
                        if not l_m_bIsScoped_0 and v238:type() == "slider" and v238:get() ~= -1 then
                            v53.utility:override(v4.rage.hit_chance, v238:get());
                        end;
                        if v237 and v239:get() ~= -1 then
                            v53.utility:override(v4.rage.hit_chance, v239:get());
                        end;
                    end;
                end;
                return;
            end;
        end;
    end
}):struct("antiaim")({
    ground_tick = 1, 
    pitch_zero_end = 0, 
    max_tickbase = 0, 
    raw_state = E_STATES.STAND, 
    current_state = E_STATES.STAND, 
    get_state = function(v240, _)
        -- upvalues: v4 (ref)
        local v242 = entity.get_local_player();
        if not v242 or not v242:is_alive() then
            return;
        else
            local l_m_fFlags_0 = v242.m_fFlags;
            v240.ground_tick = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) ~= 0 and v240.ground_tick + 1 or 0;
            local v244 = v242.m_vecVelocity:length2d();
            local v245 = bit.band(l_m_fFlags_0, 4) == 4;
            local v246 = v4.misc.fake_duck:get();
            local v247 = v4.misc.slow_walk:get();
            if v240.ground_tick < 2 then
                v240.current_state = v245 and E_STATES.AIRCROUCH or E_STATES.AIR;
                v240.raw_state = v240.current_state;
            elseif v246 then
                v240.current_state = E_STATES.FAKEDUCK;
                v240.raw_state = v240.current_state;
            elseif v245 then
                v240.current_state = v244 <= 3 and E_STATES.CROUCH or E_STATES.CROUCHWALK;
                v240.raw_state = v240.current_state;
            elseif v244 <= 3 then
                v240.current_state = E_STATES.STAND;
                v240.raw_state = v240.current_state;
            elseif v247 then
                v240.current_state = E_STATES.SLOW;
                v240.raw_state = v240.current_state;
            else
                v240.current_state = E_STATES.WALK;
                v240.raw_state = v240.current_state;
            end;
            return v240.current_state;
        end;
    end, 
    can_shoot = function(_)
        local v249 = entity.get_local_player();
        if not v249 or not v249:is_alive() then
            return;
        else
            local v250 = v249:get_player_weapon();
            if not v250 then
                return false;
            else
                return math.max(v250.m_flNextPrimaryAttack, v249.m_flNextAttack) - globals.tickinterval - globals.curtime < 0;
            end;
        end;
    end, 
    can_modify_viewangles = function(v251, v252)
        local v253 = entity.get_local_player();
        if not v253 or not v253:is_alive() then
            return;
        else
            local v254 = v253:get_player_weapon();
            if not v254 then
                return false;
            else
                local v255 = v254:get_classname();
                if v252.in_use then
                    return false;
                else
                    if string.find(v255, "Grenade") or v255 == "CFlashbang" then
                        if v254.m_fThrowTime > 0 then
                            return false;
                        end;
                    elseif v252.in_attack and v251:can_shoot() then
                        return false;
                    end;
                    return true;
                end;
            end;
        end;
    end, 
    get_defensive_ticks = function(v256)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v256.max_tickbase) > 64 then
            v256.max_tickbase = 0;
        end;
        local v258 = 0;
        if v256.max_tickbase < l_m_nTickBase_0 then
            v256.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v256.max_tickbase then
            v258 = math.min(14, math.max(0, v256.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        return v258;
    end, 
    [1] = is_safe, 
    get_safe_head = function(v259)
        -- upvalues: v125 (ref)
        if not v125.antiaim_tweaks.safe_head:get() then
            v259.is_safe = false;
            return v259.is_safe;
        else
            local v260 = entity.get_local_player();
            if not v260 or not v260:is_alive() then
                v259.is_safe = false;
                return v259.is_safe;
            else
                local v261 = entity.get_threat(false);
                if not v261 then
                    v259.is_safe = false;
                    return v259.is_safe;
                elseif v259:get_defensive_ticks() > 0 then
                    return v259.is_safe;
                else
                    local v262 = v260:get_player_weapon();
                    if not v262 then
                        return v259.is_safe;
                    elseif v125.antiaim_tweaks.safe_head.mode:get() == "Height" then
                        if v259.raw_state == E_STATES.AIR or v259.raw_state == E_STATES.AIRCROUCH or v259.raw_state == E_STATES.STAND then
                            local v263 = v262:get_classname();
                            if not v263 then
                                return v259.is_safe;
                            else
                                v259.is_safe = v260:get_origin().z - v261:get_origin().z > (v263 == "CKnife" and v259.raw_state == E_STATES.AIRCROUCH and -70 or 90);
                            end;
                        else
                            v259.is_safe = false;
                        end;
                        return v259.is_safe;
                    else
                        local v264 = v260:get_anim_state();
                        local v265 = v261:get_eye_position();
                        local v266 = v260:get_hitbox_position(0);
                        local v267 = v125.antiaim_tweaks.safe_head.multipoint:get() / 100;
                        v266.z = v266.z + 3.8 * v267;
                        if v125.antiaim_tweaks.safe_head.mode:get() == "Height" then
                            local v268 = vector((v265 - v266):angles().x * -1, v264.eye_yaw);
                            v265 = v266 + vector():angles(v268) * -25;
                        end;
                        local _, v270 = utils.trace_bullet(v261, v265, v266);
                        if not v270 then
                            v259.is_safe = false;
                        elseif not v270.entity or v270.entity:get_index() ~= v260:get_index() then
                            v259.is_safe = true;
                        else
                            v259.is_safe = v270.hitgroup ~= 1;
                        end;
                        return v259.is_safe;
                    end;
                end;
            end;
        end;
    end, 
    get_modifier_option = function(_, v272, v273)
        if v272.yaw_modifier[v273 .. "_mode"]:get() == "Constant" then
            return v272.yaw_modifier[v273]:get();
        else
            local v274 = math.min(v272.yaw_modifier[v273 .. "_min"]:get(), v272.yaw_modifier[v273 .. "_max"]:get());
            local v275 = math.max(v272.yaw_modifier[v273 .. "_min"]:get(), v272.yaw_modifier[v273 .. "_max"]:get());
            return math.random(v274, v275);
        end;
    end, 
    get_modifier_offset = function(v276, v277, v278)
        -- upvalues: v53 (ref)
        local v279 = v277.yaw_modifier:get();
        local v280 = v276:get_modifier_option(v277, "offset");
        local v281 = v276:get_modifier_option(v277, "variance");
        v281 = math.random(-v281, v281);
        local v282 = v53.antiaim.yaw_modifier_side[v278];
        local v283 = v53.antiaim.yaw_modifier_variance[v278];
        local v284 = v280 + v280 * (v283 / 100) / 2;
        if v53.antiaim.last_yaw_modifier_side[v278] ~= v282 then
            v53.antiaim.yaw_modifier_variance[v278] = v281;
        end;
        if v279 == "Center" or v279 == "Random" then
            if v279 == "Random" then
                v284 = math.random(-v284, v284);
            end;
            v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 * v282);
        elseif v279 == "Offset" then
            v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 * (v282 == 1 and 1 or 0));
        elseif v279 == "Sway" then
            local v285 = v276:get_modifier_option(v277, "speed");
            v53.antiaim.yaw_modifier_offset[v278] = math.sin(2 * math.pi * (math.abs(v285 - 20) + 1) * (v53.antiaim.antiaim_number / 100)) * v280;
        elseif v279 == "Spin" then
            v53.antiaim.yaw_modifier_offset[v278] = v53.antiaim.spin_value[v278];
            v53.antiaim.spin_value[v278] = v53.utility.normalize_yaw(v53.antiaim.spin_value[v278] + (v280 * (v280 / 180) + v280 * (v283 / 100)));
        elseif v279 == "3-Way" then
            local v286 = v276:get_modifier_option(v277, "speed") + 1;
            local v287 = v53.antiaim.antiaim_number % v286 + 1;
            if v286 / 3 * 2 < v287 then
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284);
            elseif v287 <= v286 / 3 * 2 and v286 / 3 < v287 then
                v53.antiaim.yaw_modifier_offset[v278] = 0;
            else
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 * -1);
            end;
        elseif v279 == "5-Way" then
            local v288 = v276:get_modifier_option(v277, "speed") + 3;
            local v289 = v53.antiaim.antiaim_number % v288 + 1;
            if v288 / 5 * 4 < v289 then
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284);
            elseif v289 <= v288 / 5 * 4 and v288 / 5 * 3 < v289 then
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 / 2);
            elseif v289 <= v288 / 5 * 3 and v288 / 5 * 2 < v289 then
                v53.antiaim.yaw_modifier_offset[v278] = 0;
            elseif v289 <= v288 / 5 * 2 and v288 / 5 < v289 then
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 / 2 * -1);
            else
                v53.antiaim.yaw_modifier_offset[v278] = v53.utility.normalize_yaw(v284 * -1);
            end;
        else
            v53.antiaim.yaw_modifier_offset[v278] = 0;
        end;
        v53.antiaim.last_yaw_modifier_side[v278] = v282;
    end, 
    handle_body_yaw = function(v290, v291)
        -- upvalues: v53 (ref), v4 (ref), v125 (ref)
        local v292 = v290:get_modifier_option(v291, "speed");
        v53.antiaim.yaw_modifier_side[0] = v53.antiaim.antiaim_number % v292 == 0 and -v53.antiaim.yaw_modifier_side[0] or v53.antiaim.yaw_modifier_side[0];
        if v291.body_yaw.inverter:get() then
            v53.antiaim.yaw_modifier_side[0] = -v53.antiaim.yaw_modifier_side[0];
        end;
        if v4.rage.double_tap:get() and v125.rage.doubletap_fix:get() and not v291.body_yaw:get() then
            v4.angles.body_yaw:override(true);
            v4.angles.body_yaw_left_limit:override(0);
            v4.angles.body_yaw_right_limit:override(0);
        else
            v4.angles.body_yaw:override(v291.body_yaw:get());
            v4.angles.body_yaw_inverter:override(v291.body_yaw.inverter:get());
            v4.angles.body_yaw_left_limit:override(v291.body_yaw.left_limit:get());
            v4.angles.body_yaw_right_limit:override(v291.body_yaw.right_limit:get());
        end;
        local v293 = {};
        for _, v295 in pairs(v291.body_yaw.options:get()) do
            if v295 == "Jitter" then
                if v53.utility.tables.contains(v291.body_yaw.options:get(), "Randomize Jitter") then
                    v53.antiaim.yaw_modifier_side[0] = v53.antiaim.yaw_modifier_side[0] * (math.random(1, 2) == 1 and 1 or -1);
                end;
                v4.angles.body_yaw_inverter:override(v53.antiaim.yaw_modifier_side[0] == -1);
            else
                table.insert(v293, v295);
            end;
        end;
        v4.angles.body_yaw_options:override(v293);
        v4.angles.body_yaw_freestanding:override(v291.body_yaw.freestanding:get());
    end, 
    handle_antiaim = function(v296, v297)
        -- upvalues: v53 (ref), v3 (ref), v4 (ref), v125 (ref)
        local l_current_state_0 = v296.current_state;
        local v299 = v53.antiaim.builder[l_current_state_0].enable:get() and v53.antiaim.builder[l_current_state_0] or v53.antiaim.builder[1];
        if not v3.debug then
            for _, v301 in pairs(v4.angles) do
                v301:disabled(true);
            end;
        end;
        if v299.enable:get() then
            v4.angles.enabled:override(true);
            v4.angles.pitch:override(v299.pitch:get());
            v4.angles.yaw:override(v299.yaw:get());
            v4.angles.yaw_base:override(v299.yaw.base:get());
            v4.angles.yaw_modifier:override("Disabled");
            v4.angles.yaw_modifier_offset:override(0);
            if v297.choked_commands == 0 then
                v296:handle_body_yaw(v299);
                v296:get_modifier_offset(v299, 0);
                local v302 = v53.antiaim.yaw_modifier_side[0] == 1 and v299.yaw.right_offset:get() or v299.yaw.left_offset:get();
                local v303 = nil;
                if v299.yaw:get() == "Sway" and v299.yaw.sway_speed:get() > 0 then
                    local v304 = v299.yaw.sway_amount:get();
                    local v305 = 100 / v299.yaw.sway_speed:get();
                    local l_tickcount_0 = globals.tickcount;
                    v303 = v299.yaw.offset:get() + v304 * math.cos(l_tickcount_0 / v305);
                else
                    v303 = v299.yaw.offset:get();
                end;
                if v125.antiaim_tweaks.freestanding:get() and v53.utility.tables.contains(v125.antiaim_tweaks.freestanding.options:get(), "Disable Yaw Modifiers") then
                    v303 = v303 + 0;
                else
                    v303 = v303 + v302 + v53.antiaim.yaw_modifier_offset[0];
                end;
                v53.antiaim.yaw_offset = v303;
                v4.angles.yaw_offset:override(v303);
            end;
        else
            if not v3.debug then
                for _, v308 in pairs(v4.angles) do
                    v308:disabled(false);
                end;
            end;
            v4.angles.pitch:override();
            v4.angles.yaw:override();
            v4.angles.yaw_base:override();
            v4.angles.yaw_offset:override();
            v4.angles.yaw_modifier:override();
            v4.angles.yaw_modifier_offset:override();
            if v4.rage.double_tap:get() and v125.rage.doubletap_fix:get() and not v4.angles.body_yaw:get() then
                v4.angles.body_yaw:override(true);
                v4.angles.body_yaw_left_limit:override(0);
                v4.angles.body_yaw_right_limit:override(0);
            else
                v4.angles.body_yaw:override();
                v4.angles.body_yaw_left_limit:override();
                v4.angles.body_yaw_right_limit:override();
            end;
            v4.angles.body_yaw_inverter:override();
            v4.angles.body_yaw_options:override();
            v4.angles.body_yaw_freestanding:override();
        end;
    end, 
    handle_defensive_pitch = function(_, v310)
        -- upvalues: v53 (ref)
        if v310.pitch:get() == "Up" then
            v53.antiaim.defensive_data.pitch = -89;
        elseif v310.pitch:get() == "Down" then
            v53.antiaim.defensive_data.pitch = 89;
        elseif v310.pitch:get() == "Random" then
            v53.antiaim.defensive_data.pitch = math.random(-89, 89);
        elseif v310.pitch:get() == "Custom" then
            v53.antiaim.defensive_data.pitch = v310.pitch.val:get();
        else
            v53.antiaim.defensive_data.pitch = nil;
        end;
        if v310.pitch:get() ~= "Disabled" then
            rage.antiaim:override_hidden_pitch(v53.antiaim.defensive_data.pitch);
        end;
    end, 
    handle_defensive_yaw_offset = function(v311, v312)
        -- upvalues: v53 (ref)
        local v313 = v311:get_modifier_option(v312, "speed");
        v53.antiaim.yaw_modifier_side[1] = v53.antiaim.antiaim_number % v313 > v313 / 2 - 1 and 1 or -1;
        v311:get_modifier_offset(v312, 1);
        local v314 = v53.antiaim.yaw_modifier_side[1] == 1 and v312.yaw.right_offset:get() or v312.yaw.left_offset:get();
        local v315 = nil;
        if v312.yaw:get() == "Sway" then
            local v316 = v312.yaw.offset:get();
            local v317 = 2 * math.pi * (v312.yaw.sway_speed:get() / 1000);
            local l_tickcount_1 = globals.tickcount;
            v315 = v316 * math.cos(v317 * l_tickcount_1) + v314 + v53.antiaim.yaw_modifier_offset[1];
        else
            v315 = v312.yaw.offset:get() + v314 + v53.antiaim.yaw_modifier_offset[1];
        end;
        v53.antiaim.defensive_data.yaw = v315;
        rage.antiaim:override_hidden_yaw_offset(v315);
    end, 
    handle_defensive = function(v319)
        -- upvalues: v53 (ref), v4 (ref)
        local v320 = v53.antiaim.defensive[v319.current_state].enable:get() and v53.antiaim.defensive[v319.current_state] or v53.antiaim.defensive[1];
        if v320.enable:get() and not v53.antiaim.defensive_data.disabled then
            rage.exploit:allow_defensive(true);
            v4.rage.double_tap_options:override(v320.mode:get());
            v4.angles.hidden:override(true);
            v319:handle_defensive_pitch(v320);
            v319:handle_defensive_yaw_offset(v320);
        else
            v53.antiaim.defensive_data.yaw = nil;
            v53.antiaim.defensive_data.pitch = nil;
            v4.rage.double_tap_options:override();
            v4.angles.hidden:override(false);
        end;
    end, 
    handle_manuals = function(v321)
        -- upvalues: v125 (ref), v4 (ref), v53 (ref)
        local v322 = v125.antiaim_tweaks.manuals:get();
        if v322 ~= "None" then
            v4.angles.yaw_base:override("Local View");
            local l_yaw_offset_0 = v53.antiaim.yaw_offset;
            if v322 == "Left" then
                l_yaw_offset_0 = v53.utility.normalize_yaw(-90);
            elseif v322 == "Right" then
                l_yaw_offset_0 = v53.utility.normalize_yaw(90);
            elseif v322 == "Forward" then
                l_yaw_offset_0 = v53.utility.normalize_yaw(180);
            end;
            local v324 = v125.antiaim_tweaks.manuals.mode:get();
            v4.angles.yaw_base:override(v324);
            v4.angles.yaw_offset:override(l_yaw_offset_0);
            if v53.utility.tables.contains(v125.antiaim_tweaks.manuals.options:get(), "Disable Defensive") then
                v4.angles.hidden:override(false);
            end;
            if v53.utility.tables.contains(v125.antiaim_tweaks.manuals.options:get(), "Disable Yaw Modifiers") then
                v4.angles.yaw_modifier:override("Disabled");
                v4.angles.yaw_modifier_offset:override(0);
                v4.angles.body_yaw:override(true);
                v4.angles.body_yaw_left_limit:override(0);
                v4.angles.body_yaw_right_limit:override(0);
            end;
        end;
        if v53.antiaim.manual_override ~= nil then
            local l_manual_override_0 = v53.antiaim.manual_override;
            local v326 = v125.antiaim_tweaks.mouse_override.mode:get();
            v4.angles.yaw_base:override(v326);
            v4.angles.yaw_offset:override(v53.utility.normalize_yaw(l_manual_override_0));
            if v53.utility.tables.contains(v125.antiaim_tweaks.mouse_override.options:get(), "Disable Defensive") then
                v4.angles.hidden:override(false);
            end;
            if v53.utility.tables.contains(v125.antiaim_tweaks.mouse_override.options:get(), "Disable Yaw Modifiers") then
                v4.angles.yaw_modifier:override("Disabled");
                v4.angles.yaw_modifier_offset:override(0);
                v4.angles.body_yaw:override(true);
                v4.angles.body_yaw_left_limit:override(0);
                v4.angles.body_yaw_right_limit:override(0);
            end;
        end;
        local v327 = false;
        if v125.antiaim_tweaks.freestanding:get() then
            local v328 = v125.antiaim_tweaks.manuals:get() == "None" and not v53.antiaim.manual_override;
            local v329 = v53.utility.tables.contains(v125.antiaim_tweaks.freestanding.disablers:get(), v53.antiaim.states.full[v321.raw_state]);
            v327 = v328 and not v329;
            if v53.utility.tables.contains(v125.antiaim_tweaks.freestanding.options:get(), "Disable Defensive") then
                v4.angles.hidden:override(false);
            end;
            if v53.utility.tables.contains(v125.antiaim_tweaks.freestanding.options:get(), "Disable Yaw Modifiers") then
                v4.angles.yaw_modifier:override("Disabled");
                v4.angles.yaw_modifier_offset:override(0);
                v4.angles.body_yaw:override(true);
                v4.angles.body_yaw_left_limit:override(0);
                v4.angles.body_yaw_right_limit:override(0);
            end;
        end;
        v4.misc.freestanding:override(v327);
        v4.misc.freestanding_body:override(v53.utility.tables.contains(v125.antiaim_tweaks.manuals.options:get(), "Body Freestanding"));
    end, 
    handle_trash_antiaim = function(_, v331)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref)
        local v332 = false;
        local v333 = v125.antiaim_tweaks.trash_antiaim.speed:get() / 3;
        if v53.utility.tables.contains(v125.antiaim_tweaks.trash_antiaim.condition:get(), "Warmup") and entity.get_game_rules().m_bWarmupPeriod then
            v332 = true;
        end;
        if v53.utility.tables.contains(v125.antiaim_tweaks.trash_antiaim.condition:get(), "No Enemies") then
            local v334 = false;
            do
                local l_v334_0 = v334;
                entity.get_players(true, true, function(v336)
                    -- upvalues: l_v334_0 (ref)
                    if v336:is_alive() then
                        l_v334_0 = true;
                    end;
                end);
                if not l_v334_0 then
                    v332 = true;
                end;
            end;
        end;
        if v332 and v333 > 0 then
            v4.angles.pitch:override("Disabled");
            v4.angles.yaw:override("Backward");
            v4.angles.yaw_base:override("Local View");
            v4.angles.yaw_offset:override(v331.command_number % (360 / v333) * v333);
            v4.angles.yaw_modifier:override("Disabled");
            v4.angles.yaw_modifier_offset:override(0);
            v4.angles.body_yaw:override(true);
            v4.angles.body_yaw_left_limit:override(0);
            v4.angles.body_yaw_right_limit:override(0);
        end;
    end, 
    round_prestart = function(_, _)
        -- upvalues: v53 (ref)
        v53.antiaim.in_ladder = 0;
    end, 
    createmove = function(v339, v340)
        -- upvalues: v53 (ref), v4 (ref), v125 (ref), v225 (ref)
        v53.utility:check_overrides();
        local v341 = entity.get_local_player();
        if not v341 then
            return;
        else
            local v342 = v341:get_anim_state();
            v53.antiaim.static = false;
            v339:get_safe_head();
            v339:get_state();
            if v339.is_safe then
                if v53.antiaim.builder[10].enable:get() then
                    v339.current_state = E_STATES.SAFE;
                else
                    v53.antiaim.static = true;
                end;
            end;
            if v53.antiaim.static == true then
                v4.angles.pitch:override("Down");
                v4.angles.yaw:override("Backward");
                v4.angles.yaw_base:override("At Target");
                v4.angles.yaw_offset:override(0);
                v4.angles.yaw_modifier:override("Disabled");
                v4.angles.yaw_modifier_offset:override(0);
                v4.angles.body_yaw:override(true);
                v4.angles.body_yaw_left_limit:override(0);
                v4.angles.body_yaw_right_limit:override(0);
            else
                v339:handle_antiaim(v340);
            end;
            v339:handle_defensive();
            v339:handle_manuals();
            v339:handle_trash_antiaim(v340);
            if v340.choked_commands == 0 then
                if v342 then
                    v53.antiaim.eye_yaw = v342.eye_yaw;
                end;
                v53.antiaim.antiaim_number = v53.antiaim.antiaim_number + 1;
            end;
            v4.angles.avoid_backstab:override(v125.antiaim_tweaks.avoid_backstab:get());
            v225.miscellaneous:jumpshot_helper(v340);
            v225.miscellaneous:vertical_ai_peek(v340);
            v225.miscellaneous:fakeduck_freezetime(v340);
            if v125.misc.bombsite_fix:get() then
                v225.miscellaneous:bombsite_fix(v340);
            end;
            if v125.misc.no_fall_damage:get() then
                v225.miscellaneous:no_fall_damage(v340);
            end;
            if v125.misc.grenade_fix:get() then
                v225.miscellaneous:grenade_fix(v340);
            end;
            if v125.misc.fast_ladder:get() then
                v225.miscellaneous:fast_ladder(v340);
            end;
            if v53.antiaim.cancel_next_e then
                v53.antiaim.cancel_next_e = false;
                v340.in_use = false;
            end;
            return;
        end;
    end, 
    createmove_run = function(v343, v344)
        -- upvalues: v225 (ref), v125 (ref), v53 (ref)
        local v345 = entity.get_local_player();
        v343.menu:handle_overrides();
        v343.rage:dynamic_hideshots();
        v343.rage:override_hitchance();
        v225.miscellaneous:fakeduck_speed(v344);
        if v125.antiaim_tweaks.lag_switch:get() then
            v343.antiaim:lag_switch();
        end;
        if v125.misc.unmute:get() then
            v225.miscellaneous:mute_unmute();
        end;
        if v345.m_MoveType == 9 then
            v53.antiaim.in_ladder = to_ticks(globals.curtime) + 2;
        end;
    end, 
    mouse_input = function(_, v347)
        -- upvalues: v125 (ref), v53 (ref)
        local v348 = entity.get_local_player();
        if not v348 or not v348:is_alive() then
            return;
        else
            if v125.antiaim_tweaks.mouse_override:get() then
                local v349 = render.screen_size() / 2;
                local l_pos_0 = v347.pos;
                v53.antiaim.mouse_override.position = l_pos_0;
                if v349:dist(l_pos_0) < v125.antiaim_tweaks.mouse_override.deadzone:get() then
                    v53.antiaim.manual_override = nil;
                    v53.antiaim.mouse_override.active = false;
                else
                    v53.antiaim.manual_override = math.deg(math.atan2(l_pos_0.x - v349.x, l_pos_0.y - v349.y));
                    v53.antiaim.mouse_override.active = true;
                end;
                if ui.get_alpha() == 0 then
                    ffi.C.SetCursor(nil);
                end;
            end;
            return not v125.antiaim_tweaks.mouse_override:get();
        end;
    end, 
    lag_switch = function(v351)
        -- upvalues: v125 (ref), v53 (ref)
        local v352 = v125.antiaim_tweaks.lag_switch.activation:get();
        local v353 = v125.antiaim_tweaks.lag_switch.mode:get();
        local _ = entity.get_local_player();
        if v53.utility.tables.contains(v352, "In Air") and v351.ground_tick > 15 then
            return;
        else
            if v53.utility.tables.contains(v352, "Exposed") then
                local v355 = entity.get_threat(true);
                if v355 == nil then
                    return;
                else
                    local v356 = v355:get_player_weapon();
                    if not v356 then
                        return;
                    elseif string.find(v356:get_name(), "Knife") then
                        return;
                    end;
                end;
            end;
            if v353 == "Instant" then
                rage.exploit:force_teleport();
            elseif v353 == "Defensive" then
                if v351:get_defensive_ticks() > 0 then
                    rage.exploit:force_teleport();
                end;
            elseif globals.tickcount % v125.antiaim_tweaks.lag_switch.ticks:get() == 0 then
                rage.exploit:force_teleport();
            end;
            rage.exploit:allow_defensive(true);
            rage.exploit:allow_charge(true);
            rage.exploit:force_charge();
            return;
        end;
    end, 
    reset = function(v357)
        -- upvalues: v53 (ref)
        v53.antiaim.antiaim_number = 0;
        v53.antiaim.manual_override = nil;
        v53.antiaim.mouse_override.active = false;
        v53.antiaim.eye_yaw = 0;
        v357.pitch_zero_end = 0;
    end, 
    animations = function(v358, _)
        -- upvalues: v125 (ref), v4 (ref), v53 (ref)
        local v360 = entity.get_local_player();
        local l_m_flPoseParameter_0 = v360.m_flPoseParameter;
        local v362 = ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v360[0]) + 10640);
        local v363 = v360:get_anim_state();
        if not v363 then
            return;
        else
            if v358.ground_tick > 2 then
                if string.find(v125.animations.leg_movement:get(), "Reverse") then
                    v4.misc.leg_movement:override("Sliding");
                    l_m_flPoseParameter_0[0] = 0;
                end;
                if v125.animations.leg_movement:get() == "Jittering" or v125.animations.leg_movement:get() == "Reverse Jittering" then
                    if globals.commandack % 3 == 0 then
                        v4.misc.leg_movement:override("Sliding");
                    else
                        v4.misc.leg_movement:override("Walking");
                    end;
                elseif v125.animations.leg_movement:get() == "Moonwalk" then
                    v4.misc.leg_movement:override("Walking");
                    l_m_flPoseParameter_0[6] = 1;
                    l_m_flPoseParameter_0[7] = 1;
                else
                    v4.misc.leg_movement:override(v125.animations.leg_movement:get());
                end;
            end;
            if v125.animations.body_lean:get() and v358.ground_tick > 2 then
                v362[0][12].m_flWeight = v125.animations.body_lean.amount:get() / 100;
            end;
            if v358.ground_tick < 2 then
                if v125.animations.falling_animation:get() == "Static" then
                    l_m_flPoseParameter_0[6] = 1;
                elseif v125.animations.falling_animation:get() == "Moonwalk" then
                    v362[0][6].m_flWeight = 1;
                    l_m_flPoseParameter_0[6] = 1;
                    l_m_flPoseParameter_0[7] = 1;
                end;
            end;
            if v125.animations.shake_walk:get() then
                v362[0][12].m_flWeight = utils.random_float(0, 1);
            end;
            if v125.animations.pitch_zero:get() then
                if v358.pitch_zero_end < globals.curtime and v363.landing and v358.ground_tick > 5 then
                    v358.pitch_zero_end = globals.curtime + v125.animations.pitch_zero.time:get() / 10;
                end;
                if v358.pitch_zero_end and v358.pitch_zero_end > globals.curtime then
                    l_m_flPoseParameter_0[12] = 0.5;
                end;
            end;
            if v125.animations.freeze_legs:get() then
                local v364 = v125.animations.freeze_legs.spammer:get();
                if v364 == 0 or globals.tickcount % v364 == 0 then
                    if v53.utility.tables.contains(v125.animations.freeze_legs.conditions:get(), 1) then
                        l_m_flPoseParameter_0[8] = 0;
                    end;
                    if v53.utility.tables.contains(v125.animations.freeze_legs.conditions:get(), 2) then
                        l_m_flPoseParameter_0[9] = 0;
                    end;
                    if v53.utility.tables.contains(v125.animations.freeze_legs.conditions:get(), 3) then
                        l_m_flPoseParameter_0[10] = 0;
                    end;
                end;
            end;
            if v125.animations.animation_breaker:get() then
                if v53.utility.tables.contains(v125.animations.animation_breaker.conditions:get(), 1) and (v358.current_state == E_STATES.CROUCH or v358.current_state == E_STATES.CROUCHWALK) then
                    if not v125.animations.animation_breaker.midget_mode:get() then
                        l_m_flPoseParameter_0[13] = 1;
                        l_m_flPoseParameter_0[14] = 1;
                    end;
                    l_m_flPoseParameter_0[16] = 0;
                    l_m_flPoseParameter_0[17] = 0;
                end;
                if v53.utility.tables.contains(v125.animations.animation_breaker.conditions:get(), 2) and v358.current_state == E_STATES.STAND then
                    l_m_flPoseParameter_0[16] = 1;
                    l_m_flPoseParameter_0[17] = 1;
                end;
            end;
            return;
        end;
    end
});
v125.visuals.aimbot_logs.general_color_mode:tooltip(string.format("Dynamic: Display important information in \a%sGreen\r if the shot was a hit, and in \a%sRed\r if the shot was a miss.\n\nStatic: Display all information in a clean gray color.", v53.data.notification.hit_color:to_hex(), v53.data.notification.miss_color:to_hex()));
v125.visuals.scope_overlay.col:tooltip("Pro tip: Use the \vDouble\r color mode to make a gradient");
v125.misc.fast_ladder:tooltip("This feature is currently in \vbeta\r and will be improved in the future.");
v125.misc.no_fall_damage:tooltip("This feature is currently in \vbeta\r and will be improved in the future.");
v125.misc.grenade_fix:tooltip("Attempts to fix grenades being thrown off path. Avoid enabling this feature if you aren't having this issue.");
v56.misc:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v125.misc_tab.tab
});
v56.misc_other:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v125.misc_tab.tab
});
v56.misc_other_other:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v125.misc_tab.tab
});
v56.visuals:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v125.misc_tab.tab
});
v56.visuals_other:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v125.misc_tab.tab
});
v56.statistics:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v125.misc_tab.tab
});
v225 = new_class():struct("miscellaneous")({
    r_aspectratio = cvar.r_aspectratio, 
    viewmodel_fov = cvar.viewmodel_fov, 
    viewmodel_offset_x = cvar.viewmodel_offset_x, 
    viewmodel_offset_y = cvar.viewmodel_offset_y, 
    viewmodel_offset_z = cvar.viewmodel_offset_z, 
    sv_maxunlag = cvar.sv_maxunlag, 
    original_viewmodel_fov = cvar.viewmodel_fov:int(), 
    original_viewmodel_offset_x = cvar.viewmodel_offset_x:float(), 
    original_viewmodel_offset_y = cvar.viewmodel_offset_y:float(), 
    original_viewmodel_offset_z = cvar.viewmodel_offset_z:float(), 
    update_aspect_ratio = function(v366)
        -- upvalues: v125 (ref)
        if not v125.misc.aspect_ratio:get() then
            local v367 = render.screen_size();
            v366.r_aspectratio:float(v367.x / v367.y);
        else
            v366.r_aspectratio:float(v125.misc.aspect_ratio.val:get() / 100);
        end;
    end, 
    update_viewmodel = function(v368)
        -- upvalues: v125 (ref)
        local l_viewmodel_0 = v125.misc.viewmodel;
        local v370 = l_viewmodel_0.fov:get();
        local v371 = l_viewmodel_0.x:get() / 10;
        local v372 = l_viewmodel_0.y:get() / 10;
        local v373 = l_viewmodel_0.z:get() / 10;
        if not v125.misc.viewmodel:get() then
            v368.viewmodel_fov:int(v368.original_viewmodel_fov, true);
            v368.viewmodel_offset_x:float(v368.original_viewmodel_offset_x, true);
            v368.viewmodel_offset_y:float(v368.original_viewmodel_offset_y, true);
            v368.viewmodel_offset_z:float(v368.original_viewmodel_offset_z, true);
        else
            v368.viewmodel_fov:int(v370, true);
            v368.viewmodel_offset_x:float(v371, true);
            v368.viewmodel_offset_y:float(v372, true);
            v368.viewmodel_offset_z:float(v373, true);
        end;
    end, 
    override_view = function(_, v375)
        -- upvalues: v125 (ref)
        local l_camera_0 = v125.misc.camera;
        if l_camera_0:get() then
            v375.camera.x = v375.camera.x + l_camera_0.x:get();
            v375.camera.y = v375.camera.y + l_camera_0.y:get();
            v375.camera.z = v375.camera.z + l_camera_0.z:get();
        end;
    end, 
    bombsite_fix = function(_, v378)
        -- upvalues: v53 (ref), v4 (ref)
        local v379 = entity.get_local_player();
        if v379.m_bInBombZone == true and v379.m_iTeamNum == 2 then
            v53.utility:override(v4.angles.enabled, not v378.in_use);
            v378.in_use = false;
        end;
    end, 
    fast_ladder = function(_, v381)
        -- upvalues: v365 (ref), v53 (ref), v125 (ref)
        if not v365.antiaim:can_modify_viewangles(v381) then
            return;
        else
            local v382 = entity.get_local_player();
            local v383 = 360 * v382.m_flPoseParameter[4];
            local l_eye_yaw_0 = v53.antiaim.eye_yaw;
            local v385 = render.camera_angles().y - l_eye_yaw_0;
            local v386 = v53.utility.normalize_yaw(v383 + v385) + 180;
            local v387 = v386 > 90 and v386 < 270;
            local l_m_vecVelocity_0 = v382.m_vecVelocity;
            if v53.antiaim.in_ladder > to_ticks(globals.curtime) and (v381.in_forward or v381.in_back or v381.in_moveleft or v381.in_moveright or math.abs(l_m_vecVelocity_0.z) > 0) and (v381.in_forward or v381.in_back) then
                local v389 = v125.misc.fast_ladder.priority:get();
                if v389 == "Precision" then
                    v381.view_angles.x = 45;
                    v381.view_angles.y = render.camera_angles().y + 180;
                    if v381.forwardmove > 0 then
                        v381.in_back = true;
                        v381.in_forward = false;
                    elseif v381.forwardmove < 0 then
                        v381.in_back = false;
                        v381.in_forward = true;
                    end;
                    if v381.sidemove > 0 then
                        v381.in_moveleft = true;
                        v381.in_moveright = false;
                    elseif v381.sidemove < 0 then
                        v381.in_moveleft = false;
                        v381.in_moveright = true;
                    end;
                elseif v389 == "Speed" then
                    v381.view_angles.x = 89;
                    v381.view_angles.y = render.camera_angles().y + (v387 and 90 or -90);
                    if v381.forwardmove > 0 then
                        v381.in_back = not v387;
                        v381.in_forward = v387;
                        v381.in_moveleft = not v387;
                        v381.in_moveright = v387;
                    elseif v381.forwardmove < 0 then
                        v381.in_back = v387;
                        v381.in_forward = not v387;
                        v381.in_moveleft = v387;
                        v381.in_moveright = not v387;
                    end;
                end;
            end;
            return;
        end;
    end, 
    jumpshot_helper = function(_, v391)
        -- upvalues: v125 (ref), v365 (ref), v53 (ref), v4 (ref)
        if not v125.misc.jumpshot:get() then
            return;
        else
            local v392 = v391.in_forward or v391.in_back or v391.in_moveleft or v391.in_moveright;
            if v365.antiaim.ground_tick < 2 then
                if v392 and v53.data.airstrafe == false then
                    v53.data.airstrafe = true;
                end;
            else
                v53.data.airstrafe = false;
            end;
            if v125.misc.jumpshot.dynamic_airstrafe:get() then
                v53.utility:override(v4.movement.air_strafe, v53.data.airstrafe);
            end;
            local v393 = entity.get_threat(false);
            if v53.utility.tables.contains(v125.misc.jumpshot.adaptative_airstop:get(), "Distance Check") and v393 and v393:get_origin():dist2d(entity.get_local_player():get_origin()) > 800 then
                local v394 = v4.rage.auto_stop_options:get();
                v53.utility.tables.remove(v394, "In Air");
                v53.utility:override(v4.rage.auto_stop_options, v394);
            end;
            if v53.utility.tables.contains(v125.misc.jumpshot.adaptative_airstop:get(), "Dormant Check") and (not v393 or not v393.m_bSpotted or v393:get_network_state() ~= 0) then
                local v395 = v4.rage.auto_stop_options:get();
                v53.utility.tables.remove(v395, "In Air");
                v53.utility:override(v4.rage.auto_stop_options, v395);
            end;
            return;
        end;
    end, 
    no_fall_damage = function(_, v397)
        local v398 = entity.get_local_player();
        if v398 == nil then
            return;
        else
            local v399 = v398:get_origin();
            if v398.m_vecVelocity.z <= -570 then
                if utils.trace_line(vector(v399.x, v399.y, v399.z), vector(v399.x, v399.y, v399.z - 15)).fraction ~= 1 then
                    v397.in_duck = 0;
                elseif utils.trace_line(vector(v399.x, v399.y, v399.z), vector(v399.x, v399.y, v399.z - 50)).fraction ~= 1 then
                    v397.in_duck = 1;
                end;
            end;
            return;
        end;
    end, 
    grenade_fix = function(_, v401)
        -- upvalues: v4 (ref), v125 (ref)
        local v402 = entity.get_local_player();
        if not v402 or not v402:is_alive() then
            return;
        else
            local v403 = v402:get_player_weapon();
            if not v4.rage.double_tap:get() or rage.exploit:get() <= 0 then
                return;
            elseif v403 == nil then
                return;
            else
                local v404 = v403:get_classname();
                if (string.find(v404, "Grenade") or v404 == "CFlashbang") and v403.m_fThrowTime > 0 then
                    v4.angles.enabled:override(false);
                    if v125.misc.grenade_fix.experimental:get() then
                        v401.view_angles = render.camera_angles();
                    end;
                    v401.send_packet = true;
                    v401.no_choke = true;
                    rage.exploit:allow_charge(false);
                    rage.exploit:allow_defensive(false);
                end;
                return;
            end;
        end;
    end, 
    friendlist_api = panorama.FriendsListAPI, 
    mute_unmute = function(v405)
        -- upvalues: v125 (ref)
        local v406 = v125.misc.unmute.mode:get();
        entity.get_players(false, true, function(v407)
            -- upvalues: v405 (ref), v406 (ref)
            local v408 = v407:get_player_info();
            local v409 = v405.friendlist_api.IsSelectedPlayerMuted(v408.steamid64);
            if v406 == "Unmute" and v409 then
                v405.friendlist_api.ToggleMute(v408.steamid64);
            elseif v406 == "Mute" and not v409 then
                v405.friendlist_api.ToggleMute(v408.steamid64);
            end;
        end);
    end, 
    ping_spike = function(v410)
        -- upvalues: v125 (ref), v4 (ref)
        if v125.misc.ping_spike:get() then
            v410.sv_maxunlag:float(v125.misc.ping_spike.val:get() / 1000 * 2);
            v4.misc.fake_latency:override(v125.misc.ping_spike.val:get());
        else
            v410.sv_maxunlag:float(0.2);
            v4.misc.fake_latency:override();
        end;
    end, 
    fakeduck_speed = function(_, v412)
        -- upvalues: v4 (ref), v125 (ref)
        if not v4.misc.fake_duck:get() then
            return;
        else
            if v125.misc.fakeduck_utils.unlock_speed:get() then
                local l_forwardmove_0 = v412.forwardmove;
                local l_sidemove_0 = v412.sidemove;
                if math.abs(l_forwardmove_0) > 5 or math.abs(l_sidemove_0) > 5 then
                    local v415 = 450 / math.sqrt(l_forwardmove_0 ^ 2 + l_sidemove_0 ^ 2);
                    v412.forwardmove = l_forwardmove_0 * v415;
                    v412.sidemove = l_sidemove_0 * v415;
                end;
            end;
            return;
        end;
    end, 
    fakeduck_freezetime = function(_, v417)
        -- upvalues: v4 (ref), v125 (ref)
        if not v4.misc.fake_duck:get() then
            return;
        else
            if v125.misc.fakeduck_utils.freezetime:get() and entity.get_game_rules().m_bFreezePeriod then
                v417.in_duck = true;
            end;
            return;
        end;
    end, 
    [1] = force_teleport, 
    vertical_ai_peek = function(v418, v419)
        -- upvalues: v125 (ref), v365 (ref), v4 (ref)
        if v418.force_teleport and v418.force_teleport <= globals.tickcount then
            rage.exploit:allow_charge(true);
            v418.force_teleport = nil;
        end;
        if not v125.misc.vertical_ai_peek:get() then
            return;
        else
            local v420 = entity.get_local_player();
            if v420.m_vecVelocity:length() > 10 then
                return;
            elseif not v365.antiaim:can_shoot() then
                return;
            elseif not v420.m_bIsScoped then
                return;
            elseif v420:get_player_weapon():get_classname() ~= "CWeaponSSG08" then
                return;
            else
                local v421 = v4.rage.min_damage:get();
                local v422 = v420:get_eye_position();
                v422.z = v422.z + 54.65;
                local v423 = false;
                entity.get_players(true, false, function(v424)
                    -- upvalues: v423 (ref), v420 (ref), v422 (ref), v421 (ref)
                    if v424 and not v423 then
                        for v425 = 1, 6 do
                            if not v423 then
                                local v426 = v424:get_hitbox_position(v425);
                                local v427, v428 = utils.trace_bullet(v420, v422, v426);
                                if v428 and v428.did_hit and v428.entity:get_index() == v424:get_index() and (v421 <= v427 or v424.m_iHealth <= v427) then
                                    v423 = true;
                                end;
                            end;
                        end;
                    end;
                end);
                if v423 then
                    v419.in_jump = true;
                    rage.exploit:force_teleport();
                    rage.exploit:allow_charge(false);
                    v418.force_teleport = globals.tickcount + 16;
                end;
                return;
            end;
        end;
    end
}):struct("visuals")({
    hitgroup_names = {
        [1] = "generic", 
        [2] = "head", 
        [3] = "chest", 
        [4] = "stomach", 
        [5] = "left arm", 
        [6] = "right arm", 
        [7] = "left leg", 
        [8] = "right leg", 
        [9] = "neck", 
        [10] = "?", 
        [11] = "gear"
    }, 
    notifications = {}, 
    hitmarkers = {}, 
    screen = render.screen_size(), 
    screen_center = render.screen_size() / 2, 
    easings = {
        ease_in_quint = function(v429)
            return math.clamp(v429 ^ 5, 0, 1);
        end, 
        ease_out_quint = function(v430)
            return math.clamp(1 - (1 - v430) ^ 5, 0, 1);
        end
    }, 
    icon_font = render.load_font("Arial", 16, "a"), 
    placeholder_font = render.load_font("Arial", 40, "a"), 
    hit_logs = {
        offset = vector(0, 150), 
        format_colors = function(_, v432, v433)
            -- upvalues: v125 (ref)
            local v434 = v125.visuals.aimbot_logs.general_color:get();
            local v435 = v125.visuals.aimbot_logs.general_color_mode:get() == "Dynamic" and string.format("\a%s", v433:to_hex()) or string.format("\a%s", v434:to_hex());
            local v436 = v125.visuals.aimbot_logs.general_color_mode:get() == "Dynamic" and string.format("\a%s", color(150, 160, 165):to_hex()) or "\r";
            return v432:gsub("<color>", v435):gsub("<extra>", v436);
        end, 
        Neverlose = {
            spacing = 28, 
            rounding = 6, 
            border = vector(7, 4), 
            apply_text = function(_, v438, _, _)
                -- upvalues: l_pui_0 (ref)
                return l_pui_0.string("\v" .. "\f<scroll> \r" .. v438);
            end, 
            draw = function(v441, v442, v443, v444, v445, v446, _, v448)
                -- upvalues: l_pui_0 (ref)
                local v449 = ui.get_style("Window Title");
                local v450 = v449:alpha_modulate(v445);
                local v451 = ui.get_style("Shadows"):clone();
                v451.a = v451.a * (v445 / 255);
                local v452 = vector(v443.x - v448.y - v442.border.y * 2 - 5, v443.y);
                local v453 = vector(v452.x + v448.y + v442.border.y * 2, v444.y);
                local v454 = v445 / 255;
                local v455 = (255 - v449.a) / 255 * v454;
                render.shadow(v452, v453, v451, 30, 0, v442.rounding);
                render.rect(v452, v453, v450, v442.rounding, true);
                render.blur(v452, v453 + vector(1, 1), v454, v455, v442.rounding);
                render.text(v441.icon_font, vector(v452.x - (v452.x - v453.x) / 2, v446), color(255, 255, 255), "c", l_pui_0.string("\v\f<crosshairs>"));
                render.shadow(v443, v444, v451, 30, 0, v442.rounding);
                render.rect(v443, v444, v450, v442.rounding, true);
                render.blur(v443, v444 + vector(1, 1), v454, v455, v442.rounding);
            end
        }, 
        Clean = {
            spacing = 45, 
            rounding = 18, 
            border = vector(11, 8), 
            apply_text = function(_, v457, _, _)
                -- upvalues: l_pui_0 (ref)
                return l_pui_0.string(v457);
            end, 
            draw = function(_, v461, v462, v463, v464, _, _, _)
                render.blur(v462 - vector(5, 5), v463 + vector(5, 5), 3, v464 / 255, v461.rounding);
                render.rect(v462 - vector(5, 5), v463 + vector(5, 5), color(20, 20, 20, 100 * (v464 / 255)), v461.rounding, true);
            end
        }, 
        Shadowed = {
            spacing = 38, 
            rounding = 12, 
            border = vector(11, 7), 
            apply_text = function(_, v469, v470, v471)
                -- upvalues: v125 (ref), l_pui_0 (ref)
                if v125.visuals.aimbot_logs.screen_shadow_mode:get() == "Dynamic" then
                    v471 = v471:alpha_modulate(v470);
                else
                    v471 = v125.visuals.aimbot_logs.screen_shadow_color:get():alpha_modulate(v470);
                end;
                return l_pui_0.string("\a" .. v471.to_hex(v471) .. "\f<crosshairs> \r" .. v469);
            end, 
            draw = function(_, v473, v474, v475, v476, _, v478, _)
                -- upvalues: v125 (ref)
                local v480 = nil;
                if v125.visuals.aimbot_logs.screen_shadow_mode:get() == "Dynamic" then
                    v480 = v478:alpha_modulate(v476);
                else
                    v480 = v125.visuals.aimbot_logs.screen_shadow_color:get():alpha_modulate(v476);
                end;
                render.shadow(v474, v475, v480, 45, 0, v473.rounding);
                render.rect(v474, v475, color(30, 30, 30, v476), v473.rounding, true);
            end
        }
    }, 
    E_ANIM_STAGE = {
        FADE_OUT = 3, 
        HOLD = 2, 
        FADE_IN = 1
    }, 
    reset = function(v481)
        v481.notifications = {};
        v481.hitmarkers = {};
    end, 
    aim_fire = function(v482, v483)
        -- upvalues: v125 (ref)
        if not v125.visuals.kbit_hitmarker:get() then
            return;
        else
            v482.hitmarkers[globals.tickcount] = {
                tick = globals.tickcount, 
                time = globals.curtime, 
                position = v483.aim
            };
            return;
        end;
    end, 
    aim_ack = function(v484, v485)
        -- upvalues: v125 (ref), v53 (ref), v4 (ref), l_pui_0 (ref)
        if not v125.visuals.aimbot_logs:get() then
            return;
        else
            local function v492(v486, v487, v488, v489, v490)
                -- upvalues: v484 (ref), v53 (ref)
                local v491 = v489 == nil and string.format("Hit <color>%s\r's <color>%s\r for <color>%s\r", v488, v486, v487) or string.format("Missed <color>%s\r's <color>%s\r due to <color>%s\r", v488, v486, v489);
                return {
                    position = 1, 
                    stage = v484.E_ANIM_STAGE.FADE_IN, 
                    stage_time = globals.curtime, 
                    time = globals.curtime, 
                    text = v491, 
                    data = v490, 
                    color = v489 == nil and v53.data.notification.hit_color or v53.data.notification.miss_color
                };
            end;
            local v493 = v485.target:get_name();
            local v494 = nil;
            local v495 = nil;
            local v496 = nil;
            if v485.state == nil then
                v494 = v484.hitgroup_names[v485.hitgroup + 1] .. (v485.hitgroup ~= v485.wanted_hitgroup and "(" .. v484.hitgroup_names[v485.wanted_hitgroup + 1] .. ")" or "");
                v495 = v485.damage .. (v485.damage ~= v485.wanted_damage and "(" .. v485.wanted_damage .. ")" or "");
                v496 = string.format("<extra>(bt(\206\148): <color>%st<extra> | hc: <color>%s%%<extra> | sp: <color>%s<extra>)\r", v485.backtrack, v485.hitchance, string.lower(v4.rage.safe_points:get()));
            else
                v496 = string.format("<extra>(dmg: <color>%s<extra> | bt(\206\148): <color>%s<extra> | hc: <color>%s%%<extra> | sp: <color>%s<extra>)\r", v485.wanted_damage, v485.backtrack, v485.hitchance, string.lower(v4.rage.safe_points:get()));
                v494 = v484.hitgroup_names[v485.wanted_hitgroup + 1];
            end;
            local v497 = v492(v494, not v495 and "" or v495, v493, v485.state, v496);
            if v125.visuals.aimbot_logs.screen_enabled:get() then
                table.insert(v484.notifications, 1, v497);
            end;
            local v498 = "\a" .. v125.visuals.aimbot_logs.console_color:get():to_hex() .. "essential \a" .. color(150, 150, 150):to_hex() .. "~ \r";
            local v499 = v484.hit_logs:format_colors(v125.visuals.aimbot_logs.general_log_mode:get() == "Simple" and v497.text or string.format("%s %s", v497.text, v497.data), v497.color);
            if v125.visuals.aimbot_logs.console_enabled:get() then
                print_raw(l_pui_0.string(v498 .. v499));
            end;
            if v125.visuals.aimbot_logs.top_left_enabled:get() then
                if v125.visuals.aimbot_logs.top_left_watermark:get() then
                    print_dev(l_pui_0.string(v498 .. v499));
                else
                    print_dev(l_pui_0.string(v499));
                end;
            end;
            return;
        end;
    end, 
    player_hurt = function(_, v501)
        -- upvalues: v125 (ref), v53 (ref), l_pui_0 (ref)
        local v502 = entity.get_local_player();
        if not v502 then
            return;
        else
            local v503 = entity.get(v501.attacker, true);
            if not v503 then
                return;
            elseif v502:get_index() ~= v503:get_index() then
                return;
            else
                local v504 = entity.get(v501.userid, true);
                if not v504 then
                    return;
                else
                    local l_weapon_0 = v501.weapon;
                    local v506 = l_weapon_0 == "hegrenade" and "Naded" or l_weapon_0 == "inferno" and "Burned" or l_weapon_0 == "knife" and "Knifed" or nil;
                    if not v506 then
                        return;
                    else
                        local v507 = v125.visuals.aimbot_logs.general_color:get();
                        local v508 = state == nil and v53.data.notification.hit_color or v53.data.notification.miss_color;
                        local v509 = v125.visuals.aimbot_logs.general_color_mode:get() == "Dynamic" and string.format("\a%s", color(120, 130, 135):to_hex()) or string.format("\a%s", v507:to_hex());
                        local v510 = v125.visuals.aimbot_logs.general_color_mode:get() == "Dynamic" and string.format("\a%s", v508:to_hex()) or "\r";
                        local v511 = string.format("%s %s%s\r for %s%s\r %s(%s health remaining)\r", v506, v510, v504:get_name(), v510, v501.dmg_health, v509, v501.health);
                        if v125.visuals.aimbot_logs.console_enabled:get() then
                            print_raw(l_pui_0.string("\a" .. v125.visuals.aimbot_logs.console_color:get():to_hex() .. "essential \a" .. color(150, 150, 150):to_hex() .. "~ \r" .. v511));
                        end;
                        if v125.visuals.aimbot_logs.top_left_enabled:get() then
                            if v125.visuals.aimbot_logs.top_left_watermark:get() then
                                print_dev(l_pui_0.string("\a" .. v125.visuals.aimbot_logs.console_color:get():to_hex() .. "essential \a" .. color(150, 150, 150):to_hex() .. "~ \r" .. v511));
                            else
                                print_dev(l_pui_0.string(v511));
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    lerp = function(_, v513, v514, v515)
        local v516 = v514 < v513 and v513 or v514;
        local v517 = v513 < v514 and v513 or v514;
        local v518 = v513 + (v514 - v513) * v515;
        if v516 < v518 then
            return v516;
        elseif v518 < v517 then
            return v517;
        else
            return v518;
        end;
    end, 
    anims = {
        slowdown_frac = 0, 
        charging_frac = 0, 
        active_frac = 0, 
        ideal_frac = 0, 
        hide_frac = 0, 
        dt_frac = 0, 
        scoped_frac = 0, 
        defensive_frac = 0
    }, 
    handle_easings = function(v519)
        -- upvalues: v4 (ref)
        local v520 = v4.rage.double_tap:get();
        local v521 = v4.rage.hide_shots:get();
        local v522 = v520 and v521;
        local v523 = rage.exploit:get();
        if v520 and not v522 then
            v519.anims.dt_frac = math.clamp(v519.anims.dt_frac + globals.frametime / 0.001, 0, 100);
        else
            v519.anims.dt_frac = math.clamp(v519.anims.dt_frac - globals.frametime / 0.001, 0, 100);
        end;
        if v521 and not v522 then
            v519.anims.hide_frac = math.clamp(v519.anims.hide_frac + globals.frametime / 0.001, 0, 100);
        else
            v519.anims.hide_frac = math.clamp(v519.anims.hide_frac - globals.frametime / 0.001, 0, 100);
        end;
        if v522 then
            v519.anims.ideal_frac = math.clamp(v519.anims.ideal_frac + globals.frametime / 0.001, 0, 100);
        else
            v519.anims.ideal_frac = math.clamp(v519.anims.ideal_frac - globals.frametime / 0.001, 0, 100);
        end;
        if (v520 or v521) and v523 == 1 then
            v519.anims.active_frac = math.clamp(v519.anims.active_frac + globals.frametime / 0.001, 0, 100);
        else
            v519.anims.active_frac = math.clamp(v519.anims.active_frac - globals.frametime / 0.001, 0, 100);
        end;
        if (v520 or v521) and v523 < 1 then
            v519.anims.charging_frac = math.clamp(v519.anims.charging_frac + globals.frametime / 0.001, 0, 100);
        else
            v519.anims.charging_frac = math.clamp(v519.anims.charging_frac - globals.frametime / 0.001, 0, 100);
        end;
    end, 
    draw_indicator = function(v524, v525, v526, v527, v528, v529, v530)
        -- upvalues: v53 (ref)
        local v531 = v528 == "Default" and 1 or v528 == "Small" and 2 or 4;
        if v529 == "Upper" then
            v530 = v530:upper();
        else
            v530 = v530:lower();
        end;
        if v526 then
            local v532, v533 = v527:get();
            if v532 == "Simple" then
                v533 = {
                    [1] = v533, 
                    [2] = v533
                };
            end;
            v530 = v53.utility.gradient_anim(v533[1], v533[2], 255, v530);
        end;
        local l_x_0 = render.measure_text(v531, "", v530).x;
        local v535 = vector(v524.screen_center.x + (l_x_0 / 2 + 15) * (v524.anims.scoped_frac / 100), v525);
        render.text(v531, v535, color(255, 255, 255, 255), "c", v530);
    end, 
    indicators = function(v536)
        -- upvalues: v125 (ref), v53 (ref), v3 (ref), v365 (ref)
        if not v125.visuals.crosshair:get() then
            return;
        else
            v536:handle_easings();
            local v537 = 15 * (v536.anims.scoped_frac / 100);
            local v538 = v536.screen_center.y + 20;
            if v125.visuals.crosshair.watermark_enabled:get() then
                local v539, v540 = v125.visuals.crosshair.watermark_enabled.color:get();
                if v539 == "Simple" then
                    v540 = {
                        [1] = v540, 
                        [2] = v540
                    };
                end;
                local v541 = v53.utility.gradient_anim(v540[1], v540[2], 255, "essential");
                if v125.visuals.crosshair.watermark_version:get() then
                    local v542, v543 = v125.visuals.crosshair.watermark_version.color:get();
                    v540 = v543;
                    if v542 == "Simple" then
                        v540 = {
                            [1] = v540, 
                            [2] = v540
                        };
                    end;
                    v541 = v541 .. " " .. v53.utility.gradient_anim(v540[1], v540[2], 255, v3.version);
                end;
                v536:draw_indicator(v538, false, nil, v125.visuals.crosshair.watermark_font:get(), v125.visuals.crosshair.watermark_case:get(), v541);
                v538 = v538 + 10;
            end;
            if v125.visuals.crosshair.state_enabled:get() then
                local v544 = nil;
                if v125.visuals.crosshair.state_detail:get() == "None" then
                    v544 = v53.antiaim.states.minimal[v365.antiaim.current_state];
                elseif v125.visuals.crosshair.state_detail:get() == "Dashes" then
                    v544 = "-" .. v53.antiaim.states.minimal[v365.antiaim.current_state] .. "-";
                elseif v125.visuals.crosshair.state_detail:get() == "Tildes" then
                    v544 = "~" .. v53.antiaim.states.minimal[v365.antiaim.current_state] .. "~";
                end;
                v536:draw_indicator(v538, true, v125.visuals.crosshair.state_enabled.color, v125.visuals.crosshair.state_font:get(), v125.visuals.crosshair.state_case:get(), v544);
                v538 = v538 + 10;
            end;
            if v125.visuals.crosshair.exploit_enabled:get() then
                if v125.visuals.crosshair.exploit_mode:get() == "Simple" then
                    local v545 = rage.exploit:get();
                    local l_x_1 = render.measure_text(2, "", "DT").x;
                    render.text(2, vector(v536.screen_center.x + (l_x_1 / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255 * v545, 255 * v545, 255 * (v536.anims.dt_frac / 100)), "c", "DT");
                    local l_x_2 = render.measure_text(2, "", "HS").x;
                    render.text(2, vector(v536.screen_center.x + (l_x_2 / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255 * v545, 255 * v545, 255 * (v536.anims.hide_frac / 100)), "c", "HS");
                    local l_x_3 = render.measure_text(2, "", "IDEAL").x;
                    render.text(2, vector(v536.screen_center.x + (l_x_3 / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255 * v545, 255 * v545, 255 * (v536.anims.ideal_frac / 100)), "c", "IDEAL");
                elseif v125.visuals.crosshair.exploit_mode:get() == "Detailed" then
                    local v549 = "\a" .. color(127, 255, 127):to_hex() .. v53.utility.crop_text(v536.anims.active_frac, "READY");
                    local v550 = math.floor(render.measure_text(2, "", v53.utility.crop_text(v536.anims.active_frac, "READY")):length() + 0.5);
                    local v551 = v53.utility.gradient_anim(color(255, 127, 127), color(100, 100, 100), 255, v53.utility.crop_text(v536.anims.charging_frac, "CHARGING"));
                    local v552 = math.floor(render.measure_text(2, "", v53.utility.crop_text(v536.anims.charging_frac, "CHARGING")):length() + 0.5);
                    local v553 = math.max(v550 / 2, v552 / 2);
                    local v554 = math.floor(render.measure_text(2, "", v53.utility.crop_text(v536.anims.dt_frac, "DT ")):length() + 0.5) - 2;
                    render.text(2, vector(v536.screen_center.x - v553 + 2 + ((v554 + v553 * 2 - 7) / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255, 255, 255), "c", v53.utility.crop_text(v536.anims.dt_frac, "DT "));
                    local v555 = math.floor(render.measure_text(2, "", v53.utility.crop_text(v536.anims.hide_frac, "HIDE  ")):length() + 0.5);
                    render.text(2, vector(v536.screen_center.x - v553 + 3 + ((v555 + v553 * 2 - 8) / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255, 255, 255), "c", v53.utility.crop_text(v536.anims.hide_frac, "HIDE  "));
                    local v556 = math.floor(render.measure_text(2, "", v53.utility.crop_text(v536.anims.ideal_frac, "IDEAL TICK  ")):length() + 0.5);
                    render.text(2, vector(v536.screen_center.x - v553 + 3 + ((v556 + v553 * 2 - 8) / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255, 255, 255), "c", v53.utility.crop_text(v536.anims.ideal_frac, "IDEAL TICK  "));
                    local v557 = math.max(v554 / 2, v555 / 2, v556 / 2);
                    render.text(2, vector(v536.screen_center.x + v557 - 2 + ((v552 + v557 * 2 - 6) / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255, 255, 255), "c", v551);
                    render.text(2, vector(v536.screen_center.x + v557 - 2 + ((v550 + v557 * 2 - 6) / 2 + v537) * (v536.anims.scoped_frac / 100), v538), color(255, 255, 255, 255), "c", v549);
                end;
            end;
            return;
        end;
    end, 
    watermark = function(v558)
        -- upvalues: v125 (ref), v53 (ref), v3 (ref)
        if v125.visuals.watermark:get() then
            local v559 = v125.visuals.watermark.color:get();
            local v560 = v53.utility.gradient_anim(v559, color(150, 150, 150), 255, "E S S E N T I A L") .. " \a" .. color(255, 125, 125):to_hex() .. "[" .. string.upper(v3.version) .. "]";
            local v561 = v125.visuals.watermark.position:get();
            if v561 == "Left" then
                render.text(1, vector(15, v558.screen_center.y), color(255, 255, 255), "", v560);
            elseif v561 == "Right" then
                local v562 = render.measure_text(1, "", v560);
                render.text(1, vector(v558.screen.x - v562.x - 15, v558.screen_center.y), color(255, 255, 255), "", v560);
            elseif v561 == "Center" then
                render.text(1, vector(v558.screen_center.x, v558.screen.y - 15), color(255, 255, 255), "c", v560);
            end;
        end;
    end, 
    min_damage = function(v563)
        -- upvalues: v125 (ref), v4 (ref)
        if v125.visuals.min_damage:get() then
            local v564 = false;
            if v125.visuals.min_damage.override_only:get() then
                for _, v566 in pairs(ui.get_binds()) do
                    if v566.reference:id() == v4.rage.min_damage:id() and v566.active then
                        v564 = true;
                    end;
                end;
            else
                v564 = true;
            end;
            if not v564 then
                return;
            else
                local v567 = v125.visuals.min_damage.font:get();
                local v568 = v125.visuals.min_damage.offset:get();
                local v569 = v4.rage.min_damage:get();
                if v569 == 0 then
                    v569 = "AUTO";
                elseif v569 > 100 then
                    local v570 = "+" .. v569 - 100;
                    if v570 then
                        v569 = v570;
                    end;
                end;
                render.text(v567 == "Default" and 1 or v567 == "Small" and 2 or 4, vector(v563.screen_center.x + v568, v563.screen_center.y - v568 - 9), color(255, 255, 255, 255), "", v569);
            end;
        end;
    end, 
    manual_arrows = function(v571)
        -- upvalues: v125 (ref)
        if not v125.visuals.manual_arrows:get() then
            return;
        else
            local v572 = v125.visuals.manual_arrows.style:get();
            local v573 = v125.visuals.manual_arrows.spacing:get();
            local v574 = v125.visuals.manual_arrows.color:get();
            local v575 = v125.visuals.manual_arrows.show_scoped:get();
            local l_scoped_frac_0 = v571.anims.scoped_frac;
            local v577 = v575 and 1 or math.abs(l_scoped_frac_0 - 100) / 100;
            v574 = color(v574.r, v574.g, v574.b, v574.a * v577);
            local v578 = v125.antiaim_tweaks.manuals:get();
            local v579 = v578 == "Left" and (v572 == "Modern" and color(150, 150, 150, 175 * v577) or v574) or color(40, 40, 40, 175 * v577);
            local v580 = v578 == "Right" and (v572 == "Modern" and color(150, 150, 150, 175 * v577) or v574) or color(40, 40, 40, 175 * v577);
            local v581 = vector(v571.screen_center.x - v573, v571.screen_center.y);
            local v582 = vector(v571.screen_center.x + v573, v571.screen_center.y);
            if v578 == "Left" or v125.visuals.manual_arrows.show_disabled:get() then
                render.poly(v579, vector(v581.x, v581.y - 11), vector(v581.x, v581.y + 11), vector(v581.x - 15, v581.y));
                if v572 ~= "Clean" then
                    render.rect(vector(v581.x + 3, v581.y - 11), vector(v581.x + 6, v581.y + 11), v574);
                end;
            end;
            if v578 == "Right" or v125.visuals.manual_arrows.show_disabled:get() then
                render.poly(v580, vector(v582.x, v582.y - 11), vector(v582.x, v582.y + 11), vector(v582.x + 15, v582.y));
                if v572 ~= "Clean" then
                    render.rect(vector(v582.x - 6, v582.y - 11), vector(v582.x - 3, v582.y + 11), v574);
                end;
            end;
            return;
        end;
    end, 
    handle_hitmarkers = function(v583)
        -- upvalues: v125 (ref)
        local v584 = v125.visuals.kbit_hitmarker.color:get():clone();
        local v585 = v125.visuals.kbit_hitmarker.size:get();
        local v586 = v125.visuals.kbit_hitmarker.thickness:get();
        local v587 = v125.visuals.kbit_hitmarker.duration:get();
        for v588, v589 in pairs(v583.hitmarkers) do
            local v590 = v589.time + v587;
            if globals.curtime < v590 and math.abs(v590 - globals.curtime) < 25 then
                local v591 = render.world_to_screen(v589.position);
                if v591 then
                    local v592 = v591 - vector(v586, v585);
                    local v593 = v591 + vector(v586, v585);
                    local v594 = v591 - vector(v585, v586);
                    local v595 = v591 + vector(v585, v586);
                    render.rect(v592, v593, v584);
                    render.rect(v594, v595, v584);
                end;
            else
                v583.hitmarkers[v588] = nil;
            end;
        end;
    end, 
    handle_notifications = function(v596)
        -- upvalues: v125 (ref)
        local v597 = v596.hit_logs[v125.visuals.aimbot_logs.screen_style:get()];
        local v598 = v125.visuals.aimbot_logs.screen_direction:get();
        local l_spacing_0 = v597.spacing;
        local l_border_0 = v597.border;
        local l_offset_0 = v596.hit_logs.offset;
        local v602 = #v596.notifications;
        local v603 = v125.visuals.aimbot_logs.screen_fade_in:get() / 10;
        local v604 = v125.visuals.aimbot_logs.screen_hold:get() / 10;
        local v605 = v125.visuals.aimbot_logs.screen_fade_out:get() / 10;
        for v606 = 1, v602 do
            local v607 = v596.notifications[v606];
            if v607 then
                local v608 = globals.curtime - v607.stage_time;
                local v609 = 0;
                local l_y_0 = v596.screen_center.y;
                if v607.position < v606 then
                    v607.position = math.clamp(v607.position + globals.frametime / 0.2 ^ (v606 - v607.position), 0, v606);
                end;
                if math.abs(v607.time - globals.curtime) > 15 then
                    table.remove(v596.notifications, v606);
                    v606 = v606 - 1;
                else
                    local v611 = v598 == "Ascending" and v596.screen_center.y + v125.visuals.aimbot_logs.screen_offset:get() - v607.position * l_spacing_0 or v596.screen_center.y + v125.visuals.aimbot_logs.screen_offset:get() + v607.position * l_spacing_0;
                    if v607.stage == v596.E_ANIM_STAGE.FADE_IN then
                        local v612 = v596.easings.ease_out_quint(v608 / v603);
                        v609 = 255 * v612;
                        l_y_0 = math.ceil(v598 == "Ascending" and v611 - l_offset_0.y * v612 or v611 + l_offset_0.y * v612);
                        if v603 < v608 then
                            v607.stage = v596.E_ANIM_STAGE.HOLD;
                            v607.stage_time = globals.curtime;
                        end;
                    elseif v607.stage == v596.E_ANIM_STAGE.HOLD then
                        v609 = 255;
                        l_y_0 = math.ceil(v598 == "Ascending" and v611 - l_offset_0.y or v611 + l_offset_0.y);
                        if v604 < v608 or v606 > 6 then
                            v607.stage = v596.E_ANIM_STAGE.FADE_OUT;
                            v607.stage_time = globals.curtime;
                        end;
                    elseif v607.stage == v596.E_ANIM_STAGE.FADE_OUT then
                        local v613 = v596.easings.ease_in_quint(v608 / v605);
                        v609 = 255 * (1 - v613);
                        l_y_0 = math.ceil(v598 == "Ascending" and v611 - 300 * v613 - l_offset_0.y or 300 * v613 + v611 + l_offset_0.y);
                        if v605 < v608 then
                            table.remove(v596.notifications, v606);
                            v606 = v606 - 1;
                            return;
                        end;
                    end;
                    local v614 = v597:apply_text(v596.hit_logs:format_colors(v607.text, v607.color), v609, v607.color);
                    local v615 = render.measure_text(1, "", v614);
                    local v616 = vector(l_offset_0.x + v596.screen_center.x - v615.x / 2 - l_border_0.x, l_y_0 - v615.y / 2 - l_border_0.y);
                    local v617 = vector(l_offset_0.x + v596.screen_center.x + v615.x / 2 + l_border_0.x, l_y_0 + v615.y / 2 + l_border_0.y);
                    v597.draw(v596, v597, v616, v617, v609, l_y_0, v607.color, v615);
                    render.text(1, vector(l_offset_0.x + v596.screen_center.x, l_y_0 - 1), color(255, 255, 255, v609), "c", v614);
                end;
            end;
        end;
    end, 
    scope_overlay = function(v618)
        -- upvalues: v125 (ref)
        if entity.get_local_player().m_bIsScoped then
            if v618.anims.scoped_frac < 100 then
                v618.anims.scoped_frac = math.clamp(v618.anims.scoped_frac + globals.frametime / 0.0015, 0, 100);
            end;
        elseif v618.anims.scoped_frac > 0 then
            v618.anims.scoped_frac = math.clamp(v618.anims.scoped_frac - globals.frametime / 0.0015, 0, 100);
        end;
        if not v125.visuals.scope_overlay:get() or v618.anims.scoped_frac <= 0 then
            return;
        else
            local v619 = v125.visuals.scope_overlay.mode:get();
            local v620 = v125.visuals.scope_overlay.spacing:get();
            local v621 = v125.visuals.scope_overlay.length:get();
            local v622 = v125.visuals.scope_overlay.thickness:get();
            local v623 = v125.visuals.scope_overlay.aspect_ratio:get();
            local v624, v625 = v125.visuals.scope_overlay.col:get();
            if v624 == "Simple" then
                v625 = {
                    [1] = v625, 
                    [2] = v625
                };
            end;
            local v626 = v623 and v621 * (v618.screen.x / v618.screen.y) * (v618.anims.scoped_frac / 100) or v621 * (v618.anims.scoped_frac / 100);
            local v627 = vector(v620, 0);
            local v628 = vector(v620 + v626, 0);
            local v629 = vector(0, v622);
            local v630 = v621 * (v618.anims.scoped_frac / 100);
            local v631 = vector(0, v620);
            local v632 = vector(0, v620 + v630);
            local v633 = vector(v622, 0);
            if v619 == "X" then
                render.push_rotation(45);
            end;
            render.gradient(v618.screen_center + v627 - v629, v618.screen_center + v628 + v629 + vector(0, 1), v625[1], v625[2], v625[1], v625[2], 0);
            render.gradient(v618.screen_center - v627 - v629, v618.screen_center - v628 + v629 + vector(0, 1), v625[1], v625[2], v625[1], v625[2], 0);
            render.gradient(v618.screen_center + v631 - v633, v618.screen_center + v632 + v633 + vector(1, 0), v625[1], v625[1], v625[2], v625[2], 0);
            render.gradient(v618.screen_center - v631 - v633, v618.screen_center - v632 + v633 + vector(1, 0), v625[1], v625[1], v625[2], v625[2], 0);
            if v619 == "X" then
                render.pop_rotation();
            end;
            return;
        end;
    end, 
    defensive_indicator = function(v634)
        -- upvalues: v125 (ref), v365 (ref)
        if not v125.visuals.defensive_indicator:get() then
            return;
        else
            local v635 = v365.antiaim:get_defensive_ticks();
            local v636 = v635 / 14;
            if v635 > 0 then
                v634.anims.defensive_frac = math.clamp(v634.anims.ideal_frac + globals.frametime / 0.002, 0, 100);
            else
                v634.anims.defensive_frac = math.clamp(v634.anims.ideal_frac - globals.frametime / 0.002, 0, 100);
            end;
            local v637 = v125.visuals.defensive_indicator.color:get():clone();
            v637.a = v637.a * v634.anims.defensive_frac;
            local v638 = 2;
            local v639 = 3;
            local v640 = v634.screen_center + vector(-60, -304);
            local v641 = v634.screen_center + vector(60, -296);
            render.shadow(v640, v641, color(v637.r, v637.g, v637.b, v637.a * 0.35), 30, 0, v639 * 2);
            render.rect(v640, v641, color(20, 20, 20, v637.a), v639, true);
            render.text(1, v634.screen_center + vector(0, -314), v637, "c", "Defensive");
            render.rect(v640 + vector(v638, v638), vector(v640.x + (v641.x - v640.x) * v636 - v638, v641.y - v638), v637, v639, true);
            return;
        end;
    end, 
    slowdown_indicator = function(v642)
        -- upvalues: v125 (ref), l_pui_0 (ref)
        if not v125.visuals.velocity:get() then
            return;
        else
            local v643 = 100 - math.floor(100 * entity.get_local_player().m_flVelocityModifier);
            if v643 > 0 then
                if v642.anims.slowdown_frac < 100 then
                    v642.anims.slowdown_frac = math.clamp(v642.anims.slowdown_frac + globals.frametime / 0.001, 0, 100);
                end;
            elseif v642.anims.slowdown_frac > 0 then
                v642.anims.slowdown_frac = math.clamp(v642.anims.slowdown_frac - globals.frametime / 0.001, 0, 100);
            end;
            if v642.anims.slowdown_frac <= 0 then
                return;
            else
                local v644 = 200 * (v642.anims.slowdown_frac / 100);
                local v645 = v642.screen_center + vector(28, -145) - vector(60, 8);
                local v646 = v642.screen_center + vector(28, -145) + vector(61, 8);
                render.rect(v645, v646, color(20, 20, 20, v644), 3, true);
                if v643 > 5 then
                    render.gradient(v645 + vector(2, 2), vector(v645.x + (v646.x - v645.x) * (v643 / 100), v646.y) + vector(-2, -2), color(255, 40, 40, v644), color(255, 255, 40, v644), color(255, 40, 40, v644), color(255, 255, 40, v644), 3);
                end;
                render.text(4, v642.screen_center + vector(28, -166), color(255, 255, 255, v644), "c", string.format("Slowed down: %d%%", v643));
                local v647 = v125.visuals.velocity.color:get():clone();
                v647.a = v647.a * (v644 / 200);
                render.poly(v647, v642.screen_center + vector(-84, -136), v642.screen_center + vector(-64, -167), v642.screen_center + vector(-44, -135));
                render.text(v642.placeholder_font, v642.screen_center + vector(-64, -150), color(20, 20, 20, v644), "c", l_pui_0.string("\f<triangle-person-digging>"));
                return;
            end;
        end;
    end, 
    mouse_override_indicator = function(v648)
        -- upvalues: v125 (ref), v53 (ref)
        if not v125.antiaim_tweaks.mouse_override:get() and not v53.antiaim.mouse_override.active then
            return;
        else
            local l_active_0 = v53.antiaim.mouse_override.active;
            local v650 = v53.antiaim.mouse_override.position and v53.antiaim.mouse_override.position or v648.screen_center;
            local v651 = v650:dist(v648.screen_center);
            local v652 = v125.antiaim_tweaks.mouse_override.limit:get();
            if v652 < v651 then
                local v653 = math.atan2(v650.y - v648.screen_center.y, v650.x - v648.screen_center.x);
                v650 = vector(v648.screen_center.x + v652 * math.cos(v653), v648.screen_center.y + v652 * math.sin(v653));
                if v125.antiaim_tweaks.mouse_override:get() and ui.get_alpha() == 0 then
                    ffi.C.SetCursorPos(v650.x, v650.y);
                end;
            end;
            local v654, v655 = v125.antiaim_tweaks.mouse_override.col:get();
            if v654 == "Simple" then
                v655 = {
                    [1] = v655, 
                    [2] = v655
                };
            end;
            local v656 = {
                color(v655[1].r, v655[1].g, v655[1].b, v655[1].a * 0.7843137254901961), 
                color(v655[1].r, v655[1].g, v655[1].b, 0)
            };
            local v657 = {
                color(v655[2].r, v655[2].g, v655[2].b, v655[2].a * 0.7843137254901961), 
                color(v655[2].r, v655[2].g, v655[2].b, 0)
            };
            render.circle_gradient(v650, l_active_0 and v657[2] or v656[2], l_active_0 and v657[1] or v656[1], 14, 0, 1);
            return;
        end;
    end, 
    render = function(v658)
        -- upvalues: v53 (ref), v125 (ref), v3 (ref)
        local v659 = ui.get_style("Link Active");
        ui.sidebar(v53.utility.gradient_anim(v659, color(0, 0, 0), 255, "Essential"), "code");
        v125.home.welcome:name("\v\f<hand-wave>\r    Welcome back, " .. v53.utility.gradient_anim(v659, color(0, 0, 0), 255, common.get_username()) .. "\r!");
        v125.home.version:name("\v\f<code-branch>\r     Version: " .. v53.utility.gradient_anim(v659, color(0, 0, 0), 255, v3.version));
        v125.home.updated:name("\v\f<calendar>\r     Updated: " .. v53.utility.gradient_anim(v659, color(0, 0, 0), 255, v3.last_updated));
        if not entity.get_local_player() then
            return;
        else
            if entity.get_local_player():is_alive() then
                v658:indicators();
                v658:watermark();
                v658:min_damage();
                v658:manual_arrows();
                v658:handle_hitmarkers();
                v658:scope_overlay();
                v658:defensive_indicator();
                v658:slowdown_indicator();
                v658:mouse_override_indicator();
            end;
            v658:handle_notifications();
            return;
        end;
    end
}):struct("statistics")({
    misses = 0, 
    hits = 0, 
    deaths = 0, 
    kills = 0, 
    player_death = function(v660, v661)
        local v662 = entity.get_local_player();
        local v663 = entity.get(v661.userid, true);
        local v664 = entity.get(v661.attacker, true);
        if not v662 or not v663 then
            return;
        else
            if v662:get_index() == v663:get_index() then
                v660.deaths = v660.deaths + 1;
                v660:update();
            elseif v664 and v662:get_index() == v664:get_index() then
                v660.kills = v660.kills + 1;
                v660:update();
            end;
            return;
        end;
    end, 
    aim_ack = function(v665, v666)
        if v666.state == nil then
            v665.hits = v665.hits + 1;
            v665:update();
        else
            v665.misses = v665.misses + 1;
            v665:update();
        end;
    end, 
    update = function(v667)
        -- upvalues: v125 (ref)
        local v668 = v667.kills == 0 and v667.deaths == 0 and 0 or math.ceil(v667.kills / (v667.kills + v667.deaths) * 100);
        v125.statistics.kdr_label:name(" \v\f<skull-crossbones>\r     Kill/Death Ratio (\v" .. v667.kills .. "\r/\v" .. v667.deaths .. "\r)");
        v125.statistics.kdr_button:name("\v" .. v668 .. "%");
        local v669 = v667.hits == 0 and v667.hits == 0 and 0 or math.ceil(v667.hits / (v667.hits + v667.misses) * 100);
        v125.statistics.miss_ratio_label:name("\v\f<location-crosshairs-slash>\r   \226\128\134\226\128\134Hit/Miss Ratio (\v" .. v667.hits .. "\r/\v" .. v667.misses .. "\r)");
        v125.statistics.miss_ratio_button:name("\v" .. v669 .. "%");
    end, 
    reset = function(v670)
        v670.kills = 0;
        v670.deaths = 0;
        v670.hits = 0;
        v670.misses = 0;
        v670:update();
    end
});
v125.misc.ping_spike:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:ping_spike();
end);
v125.misc.ping_spike.val:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:ping_spike();
end);
v167.configs:setup();
v125.misc.aspect_ratio:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_aspect_ratio();
end);
v125.misc.aspect_ratio.val:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_aspect_ratio();
end);
v225.miscellaneous:update_aspect_ratio();
v125.misc.viewmodel:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_viewmodel();
end);
v125.misc.viewmodel.fov:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_viewmodel();
end);
v125.misc.viewmodel.x:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_viewmodel();
end);
v125.misc.viewmodel.y:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_viewmodel();
end);
v125.misc.viewmodel.z:set_callback(function()
    -- upvalues: v225 (ref)
    v225.miscellaneous:update_viewmodel();
end);
v225.miscellaneous:update_viewmodel();
events.createmove(function(v671)
    -- upvalues: v365 (ref)
    v365.antiaim:createmove(v671);
end);
events.createmove_run(function(v672)
    -- upvalues: v365 (ref)
    v365.antiaim:createmove_run(v672);
end);
events.voice_message(function(_)

end);
events.weapon_fire(function(v674)
    -- upvalues: v365 (ref)
    v365.rage:doubletap_fix(v674);
end);
events.round_prestart(function(v675)
    -- upvalues: v365 (ref)
    v365.antiaim:reset();
    v365.antiaim:round_prestart(v675);
end);
events.post_update_clientside_animation(function(v676)
    -- upvalues: v365 (ref)
    v365.antiaim:animations(v676);
end);
events.mouse_input(function(v677)
    -- upvalues: v365 (ref)
    return v365.antiaim:mouse_input(v677);
end);
events.aim_fire(function(v678)
    -- upvalues: v225 (ref)
    v225.visuals:aim_fire(v678);
end);
events.aim_ack(function(v679)
    -- upvalues: v225 (ref)
    v225.visuals:aim_ack(v679);
    v225.statistics:aim_ack(v679);
end);
events.player_death(function(v680)
    -- upvalues: v225 (ref)
    v225.statistics:player_death(v680);
end);
events.player_hurt(function(v681)
    -- upvalues: v225 (ref)
    v225.visuals:player_hurt(v681);
end);
events.override_view(function(v682)
    -- upvalues: v225 (ref)
    v225.miscellaneous:override_view(v682);
end);
events.render(function()
    -- upvalues: v225 (ref)
    v225.visuals:render();
end);
events.cs_game_disconnected(function()
    -- upvalues: v365 (ref), v225 (ref)
    v365.antiaim:reset();
    v225.visuals:reset();
    v225.statistics:reset();
end);
events.cs_match_end_restart(function()
    -- upvalues: v225 (ref)
    v225.statistics:reset();
end);
events.shutdown(function()
    -- upvalues: v4 (ref)
    for _, v684 in ipairs(v4) do
        for _, v686 in pairs(v684) do
            v686:override();
        end;
    end;
end);