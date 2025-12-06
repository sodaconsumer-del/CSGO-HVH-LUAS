ffi.cdef("  \n    typedef struct {\n        float realtime, absoluteframetime, absoluteframestarttimedstdev;\n        float curtime, frametime, interval_per_tick, interpolation_amount;\n        int framecount, maxclients, tickcount, simticksthisframe, network_protocol;\n        int timestamp_networking_base, timestamp_randomize_window;\n        void *save_data;\n        bool client, remote_client;\n    } c_global_vars_base;\n    \n    typedef void* (__thiscall* get_client_entity_t)(void*, int);\n    \n    typedef struct {\n        char pad_0000[20];\n        int m_nOrder, m_nSequence;\n        float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate;\n        float m_flPlaybackRate, m_flCycle;\n        void *m_pOwner;\n        char pad_0038[4];\n    } animlayer;\n");
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/base64");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/clipboard");
local l_weapons_0 = require("neverlose/csgo_weapons");
local l_defensive_0 = require("neverlose/get_defensive");
local v6 = {};
local v7 = {
    builder = {}
};
local v8 = {};
local v9 = {};
local v10 = {
    [1] = "Shared", 
    [2] = "Stand", 
    [3] = "Walk", 
    [4] = "Move", 
    [5] = "Duck", 
    [6] = "Duck-move", 
    [7] = "Air", 
    [8] = "Air-move", 
    [9] = "Air-duck", 
    [10] = "Air-duck-move"
};
local v11 = {
    [1] = "Stand", 
    [2] = "Walk", 
    [3] = "Move", 
    [4] = "Duck", 
    [5] = "Duck-move", 
    [6] = "Air", 
    [7] = "Air-move", 
    [8] = "Air-duck", 
    [9] = "Air-duck-move"
};
local _ = ui.get_style("Link Active");
local _ = render.screen_size() / 2;
v6 = {
    rage = {
        enabled = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", {
            silent_aim = "Silent Aim", 
            override_resolver = "Override Resolver", 
            dormant_aimbot = "Dormant Aimbot", 
            extended_backtrack = "Extended Backtrack"
        }), 
        peek_assist = l_pui_0.find("Aimbot", "Ragebot", "Main", "Peek Assist", {
            auto_stop = "Auto Stop", 
            retreat_mode = "Retreat Mode", 
            style = "Style", 
            max_distance = "Max Distance"
        }), 
        hitboxes = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
        multipoint = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Multipoint", {
            body_scale = "Body Scale", 
            head_scale = "Head Scale"
        }), 
        min_damage = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage", {
            delay_shotik = "Delay Shot"
        }), 
        hit_chance = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Hit Chance", {
            double_tap = "Double Tap"
        }), 
        penetrate_walls = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Penetrate Walls"), 
        body_aim = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Body Aim", {
            disablers = "Disablers", 
            force_on_peek = "Force on Peek"
        }), 
        safe_points = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Safe points"), 
        ensure_hitbox_safety = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"), 
        hide_shots = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
            options = "Options"
        }), 
        double_tap = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
            lag_options = "Lag Options", 
            immediate_teleport = "Immediate Teleport", 
            fake_lag_limit = "Fake Lag Limit", 
            quick_switch = "Quick-Switch"
        }), 
        auto_stop = l_pui_0.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", {
            options = "Options", 
            double_tap = "Double Tap"
        })
    }, 
    aa = {
        tab4ik = l_pui_0.find("Aimbot", "Anti aim"), 
        fl_enabled = l_pui_0.find("Aimbot", "Anti Aim", "Fake lag", "Enabled"), 
        leg_movement = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        angles = {
            enabled = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
                base = "Base", 
                avoid_backstab = "Avoid Backstab", 
                offset = "Offset", 
                hidden = "Hidden"
            }), 
            yaw_modifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
                offset = "Offset"
            }), 
            body_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
                right_limit = "Right Limit", 
                options = "Options", 
                left_limit = "Left Limit", 
                inverter = "Inverter", 
                freestanding = "Freestanding"
            }), 
            freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
                body_freestanding = "Body Freestanding", 
                disable_yaw_modifiers = "Disable Yaw Modifiers"
            }), 
            extended_angles = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", {
                extended_roll = "Extended Roll", 
                extended_pitch = "Extended Pitch"
            })
        }, 
        fake_lag = {
            limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
            variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
        }, 
        misc = {
            fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake duck"), 
            slow_walk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow walk")
        }
    }, 
    visual = {
        fov = l_pui_0.find("Visuals", "World", "Main", "Field of View"), 
        override_zoom = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", {
            force_second_zoom = "Force Second Zoom", 
            instant_scope = "Instant Scope", 
            scope_overlay = "Scope Overlay", 
            force_viewmodel = "Force Viewmodel"
        }), 
        thirdperson = l_pui_0.find("Visuals", "World", "Main", "Force Thirdperson", {
            force_in_spectators = "Force in spectators", 
            ignore_props = "Ignore props", 
            distance = "Distance"
        })
    }, 
    misc = {
        fake_latency = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        air_strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe", {
            wasd_strafe = "WASD Strafe", 
            circle_strafe = "Circle Strafe", 
            smoothing = "Smoothing"
        }), 
        edge_jump = l_pui_0.find("Miscellaneous", "Main", "Movement", "Edge Jump")
    }
};
local v14 = 0;
local v15 = {};
local v16 = 0;
math.lerp = function(v17, v18, v19)
    return v17 + (v18 - v17) * v19;
end;
math.spin = function(v20, v21, v22)
    local v23 = globals.tickcount * v22;
    local v24 = v21 - v20;
    if v24 == 0 then
        return v20;
    elseif v24 > 0 then
        return v20 + math.fmod(v23, v24);
    else
        return v20 + math.fmod(-v23, -v24);
    end;
end;
table.update = function(v25, v26, v27)
    if v26 then
        table.insert(v25, v27);
    else
        for v28, v29 in ipairs(v25) do
            if v29 == v27 then
                table.remove(v25, v28);
                break;
            end;
        end;
    end;
end;
v8.get_anim_layer = function(v30, v31)
    local v32 = ffi.cast(ffi.typeof("void***"), v30[0]);
    return ffi.cast("animlayer**", ffi.cast("char*", v32) + 10640)[0][v31];
end;
do
    local l_v14_0, l_v15_0, l_v16_0 = v14, v15, v16;
    v8.get_defensive_ticks = function(v36)
        -- upvalues: l_v16_0 (ref)
        local l_m_nTickBase_0 = v36.m_nTickBase;
        local v38 = 0;
        if math.abs(l_m_nTickBase_0 - l_v16_0) > 64 then
            l_v16_0 = 0;
        end;
        if l_v16_0 < l_m_nTickBase_0 then
            l_v16_0 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v16_0 then
            v38 = math.min(14, math.max(0, l_v16_0 - l_m_nTickBase_0 - 1));
        end;
        return v38;
    end;
    v8.gradient_text = function(v39, v40, v41, v42)
        if not v39 or v39 == "" then
            return "";
        else
            local v43 = {};
            local v44 = string.len(v39) > 1 and 1 / (string.len(v39) - 1) or 1;
            for v45 in v39:gmatch(".[\128-\191]*") do
                local v46 = v40 % 2;
                if v46 > 1 then
                    local v47 = 2 - v46;
                    if v47 then
                        v46 = v47;
                    end;
                end;
                local v48 = v41.r + (v42.r - v41.r) * v46;
                local v49 = v41.g + (v42.g - v41.g) * v46;
                local v50 = v41.b + (v42.b - v41.b) * v46;
                local v51 = v41.a + (v42.a - v41.a) * v46;
                v43[#v43 + 1] = "\a" .. color(v48, v49, v50, v51):to_hex() .. v45;
                v40 = v40 + v44;
            end;
            return table.concat(v43);
        end;
    end;
    v8.animated_sidebar = function()
        -- upvalues: v8 (ref)
        local v52 = ui.get_style("Link Active");
        local v53 = globals.realtime * 0.75;
        return (v8.gradient_text("Juicy beta", v53, v52:alpha_modulate(255), v52:alpha_modulate(50)));
    end;
    v8.reset_all = function(v54)
        -- upvalues: v8 (ref)
        for _, v56 in pairs(v54) do
            if type(v56) == "table" then
                v8.reset_all(v56);
            elseif type(v56) == "userdata" and v56.override ~= nil then
                v56:override(nil);
            end;
        end;
    end;
    v8.depend_aa = function(v57, v58)
        -- upvalues: v6 (ref)
        for _, v60 in pairs(v6.aa.angles) do
            v60:visibility(v57);
        end;
        for _, v62 in pairs(v6.aa.fake_lag) do
            v62:visibility(v58);
        end;
        for _, v64 in pairs(v6.aa.misc) do
            v64:visibility(v58);
        end;
    end;
    v8.is_lethal = function(v65, v66)
        -- upvalues: l_weapons_0 (ref)
        if not v65 then
            return;
        elseif not v66 then
            return;
        else
            local v67 = v65:get_player_weapon();
            if not v67 then
                return;
            else
                local v68 = l_weapons_0(v67);
                if not v68 then
                    return;
                else
                    local v69 = v65:get_origin();
                    if not v69 then
                        return;
                    else
                        local v70 = v66:get_origin();
                        if not v70 then
                            return;
                        else
                            local v71 = v69:dist(v70);
                            local l_m_iHealth_0 = v66.m_iHealth;
                            local v73 = v68.damage * math.pow(v68.range_modifier, v71 * 0.002) * 1.25;
                            local l_m_ArmorValue_0 = v66.m_ArmorValue;
                            local v75 = v73 * (v68.armor_ratio * 0.5);
                            if l_m_ArmorValue_0 < v73 - v73 * (v68.armor_ratio * 0.5) * 0.5 then
                                v75 = v73 - l_m_ArmorValue_0 / 0.5;
                            end;
                            return l_m_iHealth_0 <= v75;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v8.get_player_position = function()
        -- upvalues: l_v14_0 (ref), v6 (ref)
        local v76 = entity.get_local_player();
        local l_m_vecVelocity_0 = v76.m_vecVelocity;
        local v78 = bit.band(v76.m_fFlags, bit.lshift(1, 1)) == bit.lshift(1, 1);
        local v79 = math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2) > 5;
        local v80;
        if v76.m_hGroundEntity == nil or common.is_button_down(8) then
            if l_v14_0 > 0 then
                v80 = 0;
                goto label0 --[[  true, true  ]];
            else
                v80 = l_v14_0 - 1;
                if v80 then
                    goto label0;
                end;
            end;
        end;
        v80 = l_v14_0 < 0 and 0 or l_v14_0 + 1;
        ::label0::;
        l_v14_0 = v80;
        if l_v14_0 < 5 then
            if v78 then
                v80 = v79 and "Air-duck-move" or "Air-duck";
            else
                v80 = v79 and "Air-move" or "Air";
            end;
            return v80;
        else
            if v78 then
                v80 = v79 and "Duck-move" or "Duck";
            else
                v80 = v6.aa.misc.slow_walk:get() and v79 and "Walk" or v79 and "Move" or "Stand";
            end;
            return v80;
        end;
    end;
    v8.switch_system = function(v81, v82)
        -- upvalues: l_v15_0 (ref)
        local v83 = v81:id();
        local v84 = l_v15_0[v83];
        if not v84 then
            l_v15_0[v83] = {
                tickcount_switch = false, 
                tickcount_last = globals.tickcount
            };
            return;
        else
            local l_tickcount_0 = globals.tickcount;
            local v86 = v84.tickcount_last or l_tickcount_0;
            if l_tickcount_0 < v86 then
                v84.tickcount_last = l_tickcount_0;
            elseif v86 + (v81:get() == -1 and (globals.tickcount % 64 > 50 and math.random(1, 7) or math.random(1, 64)) or v81:get()) < l_tickcount_0 and v82.choked_commands == 0 then
                v84.tickcount_switch = not v84.tickcount_switch;
                v84.tickcount_last = l_tickcount_0;
            end;
            return v84.tickcount_switch;
        end;
    end;
    v8.get_freestand_angle = function()
        local v87 = entity.get_local_player();
        local v88 = 1;
        local v89 = 0;
        local v90 = 0;
        local v91 = 0;
        local v92 = v87:get_eye_position();
        local v93 = render.camera_angles();
        local v94 = {
            left = 0, 
            right = 0
        };
        if v91 ~= 0 and globals.curtime - v90 > 5 then
            v89 = 0;
            v90 = 0;
            v91 = 0;
        end;
        for v95 = v93.y - 120, v93.y + 120, 30 do
            if v95 ~= v93.y then
                local v96 = math.rad(v95);
                local v97 = v92.x + 256 * math.cos(v96);
                local v98 = v92.y + 256 * math.sin(v96);
                local l_z_0 = v92.z;
                local l_fraction_0 = utils.trace_line(v92, vector(v97, v98, l_z_0)).fraction;
                local v101 = v95 < v93.y and "left" or "right";
                v94[v101] = v94[v101] + l_fraction_0;
            end;
        end;
        v88 = v94.left < v94.right and -90 or 90;
        if v88 == v89 then
            return;
        else
            v89 = v88;
            if v91 ~= 0 then
                v88 = v91;
            end;
            return v88;
        end;
    end;
    val = function(v102, v103)
        return "\a{Link Active}" .. v102 .. "\aDEFAULT: " .. v103;
    end;
end;
cvar.r_aspectratio:float(1.7777777777777777, true);
cvar.zoom_sensitivity_ratio_mouse:float(0, true);
v6.aa.fl_enabled:override(true);
v6.aa.fl_enabled:visibility(false);
v6.aa.leg_movement:override(nil);
v6.aa.leg_movement:visibility(false);
v9 = l_pui_0.create("\208\180\208\182\209\131\209\129\208\181", {
    [1] = {
        [1] = "selector", 
        [2] = "##juicy", 
        [3] = 1
    }, 
    [2] = {
        [1] = "general_sidebar", 
        [2] = "sidebar", 
        [3] = 1
    }, 
    [3] = {
        [1] = "general_summary", 
        [2] = "summary", 
        [3] = 2
    }, 
    [4] = {
        [1] = "aimbot_other", 
        [2] = "other", 
        [3] = 1
    }, 
    [5] = {
        [1] = "aimbot_accuracy", 
        [2] = "accuracy", 
        [3] = 2
    }, 
    [6] = {
        [1] = "aimbot_logic", 
        [2] = "logic", 
        [3] = 2
    }, 
    [7] = {
        [1] = "anti_aimbot_yaw_override", 
        [2] = "yaw override", 
        [3] = 1
    }, 
    [8] = {
        [1] = "anti_aimbot_exploits", 
        [2] = "exploits", 
        [3] = 1
    }, 
    [9] = {
        [1] = "anti_aimbot_angles", 
        [2] = "builder", 
        [3] = 2
    }, 
    [10] = {
        [1] = "visuals_effects", 
        [2] = "effects", 
        [3] = 1
    }, 
    [11] = {
        [1] = "visuals_regulation", 
        [2] = "regulation", 
        [3] = 2
    }, 
    [12] = {
        [1] = "visuals_interface", 
        [2] = "interface", 
        [3] = 2
    }, 
    [13] = {
        [1] = "addition_warmup", 
        [2] = "warmup helper", 
        [3] = 1
    }, 
    [14] = {
        [1] = "addition_movement", 
        [2] = "movement", 
        [3] = 2
    }
});
v7.juicy = v9.selector:label("\209\133\209\131\209\142\209\129\208\181");
v7.discord = v9.selector:button("\a6879B8FF\f<discord>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/gzEurYMb56");
end, true);
v7.telegram = v9.selector:button("\a8A9CFFFF\f<telegram>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/juicy_lua");
end, true);
v7.youtube = v9.selector:button("\aB10000FF\f<youtube>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@hersty");
end, true);
v7.groups = v9.selector:list("##List", {
    [1] = "\v\f<house-night>\r   General", 
    [2] = " \v\f<rectangle-history>\r   Anti aim", 
    [3] = "\v\f<sun-haze>\r   Addition"
});
v7.addition_groups = v9.selector:list("##Addition list", {
    [1] = " \v\f<boxing-glove>\r    Aimbot", 
    [2] = " \v\f<chart-line>\r    Visuals", 
    [3] = " \v\f<bread-slice>\r    Other"
});
v7.addition_groups:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v7.groups
});
events.render:set(function()
    -- upvalues: v7 (ref), v8 (ref)
    if ui.get_alpha() ~= 1 then
        return;
    else
        v7.juicy:name(v8.animated_sidebar());
        v7.anti_aimbot_tooltip:name("                     Try to win " .. v8.gradient_text("Juicy beta", globals.realtime * 0.75, ui.get_style("Link Active"):alpha_modulate(255), ui.get_style("Link Active"):alpha_modulate(50)));
        return;
    end;
end);
v14 = v9.anti_aimbot_yaw_override;
manual_yaw = 0;
v7.angles_hider = v14:selectable("\v\f<eye-slash>\r   Angles hider", {
    [1] = "On warmup", 
    [2] = "No enemies"
}, function(v104)
    return {
        method = v104:list("##Method", {
            [1] = "Juicy", 
            [2] = "Static"
        })
    }, true;
end);
v7.manuals = v14:combo("\v\f<arrows-up-down-left-right>\r    Direction", {
    [1] = "Disabled", 
    [2] = "Forward", 
    [3] = "Left", 
    [4] = "Right"
}, function(v105, _)
    return {
        options = v105:listable("##Direction options", {
            [1] = "Disable at-targets"
        })
    };
end);
v7.freestanding = v14:switch("\v\f<arrows-repeat>\r    Freestanding", false);
v15 = function()
    -- upvalues: v7 (ref)
    local v107 = v7.manuals:get();
    if v107 == "Forward" then
        manual_yaw = 180;
    elseif v107 == "Left" then
        manual_yaw = -90;
    elseif v107 == "Right" then
        manual_yaw = 90;
    else
        manual_yaw = 0;
    end;
end;
v7.manuals:set_callback(v15, true);
v7.angles_hider:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.manuals:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.manuals.options:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = "Disabled", 
    [3] = true, 
    [1] = v7.manuals
});
v7.freestanding:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v14 = v9.anti_aimbot_exploits;
v7.force_lag = v14:selectable("\v\f<bolt>\r     Force lag", v11, function(v108)
    return {
        allow_with_hideshots = v108:switch("Allow with hideshots")
    }, true;
end);
v7.lag_switch = v14:combo("\v\f<bolt-auto>\r    Lag switch", {
    [1] = "Disabled", 
    [2] = "Offensive", 
    [3] = "Defensive"
});
v7.fake_flick = v14:combo("\v\f<shuffle>\r    Fake flick", {
    [1] = "Disabled", 
    [2] = "Defensive"
});
v7.force_lag:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.lag_switch:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.fake_flick:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.better_defensive = v9.aimbot_other:switch("\v\f<person-from-portal>\r    Better defensive");
v7.better_defensive:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v7.addition_groups
});
v14 = v9.anti_aimbot_angles;
v15 = v6.aa.angles;
v16 = {
    hidden_yaw = 0, 
    hidden_pitch = 0, 
    yaw = 0
};
local v109 = {
    yaw = 0
};
local v110 = {
    base = {}, 
    hidden = {}
};
v7.anti_aimbot_preset = v14:combo("\v\f<bookmark>\r    Preset", {
    [1] = "Experimental", 
    [2] = "Custom"
});
v7.anti_aimbot_tooltip = v14:label("\208\144\208\144\208\144\208\144\208\144 \208\159\208\152\208\161\208\172\208\154\208\144");
v7.anti_aimbot_tooltip2 = v14:label("Just send your preset to the discord chat, and the winner will be selected in the next update!");
v7.anti_aimbot_position = v14:combo("\v\f<person-running>\r    Position", v10);
v7.anti_aimbot_preset:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
});
v7.anti_aimbot_tooltip:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = "Experimental", 
    [1] = v7.anti_aimbot_preset
});
v7.anti_aimbot_tooltip2:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = "Experimental", 
    [1] = v7.anti_aimbot_preset
});
v7.anti_aimbot_position:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = "Custom", 
    [1] = v7.anti_aimbot_preset
});
do
    local l_v15_1, l_v16_1, l_v109_0, l_v110_0 = v15, v16, v109, v110;
    for v115, v116 in pairs(v10) do
        local v117 = {};
        do
            local l_v115_0, l_v116_0 = v115, v116;
            local function v121(v120)
                -- upvalues: l_v115_0 (ref)
                return v120 .. "##" .. l_v115_0;
            end;
            v117.override_state = v14:switch("Override " .. l_v116_0:lower(), l_v116_0 == "Shared");
            v117.pitch = v14:combo(v121("Pitch"), {
                [1] = "Down", 
                [2] = "Viewangles"
            });
            do
                local l_v117_0, l_v121_0 = v117, v121;
                l_v117_0.yaw = v14:combo(l_v121_0("Yaw"), {
                    [1] = "Offset", 
                    [2] = "Switch"
                }, function(v124)
                    -- upvalues: l_v121_0 (ref)
                    return {
                        offset = v124:slider(l_v121_0("##Offset yaw"), -180, 180, 0, 1, function(v125)
                            return val("O", v125 .. "\194\176");
                        end), 
                        left = v124:slider(l_v121_0("##Left yaw"), -180, 180, 0, 1, function(v126)
                            return val("L", v126 .. "\194\176");
                        end), 
                        right = v124:slider(l_v121_0("##Right yaw"), -180, 180, 0, 1, function(v127)
                            return val("R", v127);
                        end), 
                        delay = v124:slider(l_v121_0("Delay##Yaw"), -1, 16, 0, 1, function(v128)
                            if v128 == -1 then
                                return "Random";
                            elseif v128 == 0 then
                                return "Off";
                            else
                                return val("T", v128);
                            end;
                        end), 
                        modifier = v124:combo(l_v121_0("Modifier##Yaw"), {
                            [1] = "Off", 
                            [2] = "Random", 
                            [3] = "Break"
                        }), 
                        modifier_offset = v124:slider(l_v121_0("##Modifier offset"), -180, 180, 0, 1, function(v129)
                            return val("O", v129 .. "\194\176");
                        end)
                    };
                end);
                l_v117_0.desync = v14:combo(l_v121_0("Desync"), {
                    [1] = "Offset", 
                    [2] = "Switch"
                }, function(v130)
                    -- upvalues: l_v121_0 (ref)
                    return {
                        offset = v130:slider(l_v121_0("##Offset desync"), -60, 60, 0, 1, function(v131)
                            return val("O", v131 .. "\194\176");
                        end), 
                        left = v130:slider(l_v121_0("##Left desync"), -60, 60, 0, 1, function(v132)
                            return val("L", v132 .. "\194\176");
                        end), 
                        right = v130:slider(l_v121_0("##Right desync"), -60, 60, 0, 1, function(v133)
                            return val("R", v133 .. "\194\176");
                        end), 
                        options = v130:listable(l_v121_0("##Options desync"), {
                            [1] = "Avoid overlap", 
                            [2] = "Anti bruteforce", 
                            [3] = "Freestanding"
                        }), 
                        freestanding = v130:combo(l_v121_0("Freestanding side##Desync"), {
                            [1] = "Fake", 
                            [2] = "Real"
                        })
                    };
                end);
                if l_v116_0 ~= "Shared" then
                    l_v117_0.hidden = v14:switch(l_v121_0("Hidden"));
                    l_v117_0.hidden_pitch = v14:combo(l_v121_0("Pitch##Hidden"), {
                        [1] = "Offset", 
                        [2] = "Switch", 
                        [3] = "Random", 
                        [4] = "Spin"
                    }, function(v134)
                        -- upvalues: l_v121_0 (ref)
                        return {
                            offset = v134:slider(l_v121_0("##Offset hidden pitch"), -89, 89, 0, 1, function(v135)
                                return val("O", v135 .. "\194\176");
                            end), 
                            start = v134:slider(l_v121_0("##Start hidden pitch"), -89, 89, 0, 1, function(v136)
                                return val("S", v136 .. "\194\176");
                            end), 
                            finish = v134:slider(l_v121_0("##Finish hidden pitch"), -89, 89, 0, 1, function(v137)
                                return val("F", v137);
                            end), 
                            speed = v134:slider(l_v121_0("##Speed hidden pitch"), 5, 100, 0, 1, function(v138)
                                return val("V", v138 .. "%");
                            end), 
                            delay = v134:slider(l_v121_0("Delay##Hidden pitch"), -1, 16, 0, 1, function(v139)
                                if v139 == -1 then
                                    return "Random";
                                elseif v139 == 0 then
                                    return "Off";
                                else
                                    return val("T", v139);
                                end;
                            end)
                        };
                    end);
                    l_v117_0.hidden_yaw = v14:combo(l_v121_0("Yaw##Hidden"), {
                        [1] = "Offset", 
                        [2] = "Switch", 
                        [3] = "Random", 
                        [4] = "Spin"
                    }, function(v140)
                        -- upvalues: l_v121_0 (ref)
                        return {
                            offset = v140:slider(l_v121_0("##Offset hidden yaw"), -180, 180, 0, 1, function(v141)
                                return val("O", v141 .. "\194\176");
                            end), 
                            left = v140:slider(l_v121_0("##Left hidden yaw"), -180, 180, 0, 1, function(v142)
                                return val("L", v142 .. "\194\176");
                            end), 
                            right = v140:slider(l_v121_0("##Right hidden yaw"), -180, 180, 0, 1, function(v143)
                                return val("R", v143 .. "\194\176");
                            end), 
                            speed = v140:slider(l_v121_0("##Speed hidden yaw"), 5, 100, 0, 1, function(v144)
                                return val("V", v144 .. "%");
                            end), 
                            delay = v140:slider(l_v121_0("Delay##Hidden yaw"), -1, 16, 0, 1, function(v145)
                                if v145 == -1 then
                                    return "Random";
                                elseif v145 == 0 then
                                    return "Off";
                                else
                                    return val("T", v145 .. "\194\176");
                                end;
                            end)
                        };
                    end);
                    l_v117_0.hidden_desync = v14:combo(l_v121_0("Desync##Hidden"), {
                        [1] = "Offset", 
                        [2] = "Switch"
                    }, function(v146)
                        -- upvalues: l_v121_0 (ref)
                        return {
                            offset = v146:slider(l_v121_0("##Offset hidden desync"), -60, 60, 0, 1, function(v147)
                                return val("O", v147 .. "\194\176");
                            end), 
                            left = v146:slider(l_v121_0("##Left hidden desync"), -60, 60, 0, 1, function(v148)
                                return val("L", v148 .. "\194\176");
                            end), 
                            right = v146:slider(l_v121_0("##Right hidden desync"), -60, 60, 0, 1, function(v149)
                                return val("R", v149 .. "\194\176");
                            end), 
                            options = v146:listable(l_v121_0("##Options hidden desync"), {
                                [1] = "Avoid overlap", 
                                [2] = "Anti bruteforce", 
                                [3] = "Freestanding"
                            }), 
                            freestanding = v146:combo(l_v121_0("Freestanding side##Hidden desync"), {
                                [1] = "Fake", 
                                [2] = "Real"
                            })
                        };
                    end);
                end;
                local v150 = {
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v7.groups
                };
                local v151 = {
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = v7.anti_aimbot_preset
                };
                local v152 = {
                    [1] = v7.anti_aimbot_position, 
                    [2] = l_v116_0
                };
                local v154 = {
                    [1] = l_v117_0.override_state, 
                    [2] = function(v153)
                        -- upvalues: l_v116_0 (ref)
                        return l_v116_0 == "Shared" or v153:get();
                    end
                };
                l_v117_0.override_state:depend(v150, v151, {
                    [1] = v7.anti_aimbot_position, 
                    [2] = function(v155)
                        -- upvalues: l_v116_0 (ref)
                        return v155:get() == l_v116_0 and v155:get() ~= "Shared";
                    end
                });
                l_v117_0.pitch:depend(v150, v151, v152, v154);
                l_v117_0.yaw:depend(v150, v151, v152, v154);
                l_v117_0.yaw.offset:depend({
                    [1] = nil, 
                    [2] = "Offset", 
                    [1] = l_v117_0.yaw
                });
                l_v117_0.yaw.left:depend({
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_v117_0.yaw
                });
                l_v117_0.yaw.right:depend({
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_v117_0.yaw
                });
                l_v117_0.yaw.delay:depend({
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_v117_0.yaw
                });
                l_v117_0.yaw.modifier_offset:depend({
                    [1] = nil, 
                    [2] = "Off", 
                    [3] = true, 
                    [1] = l_v117_0.yaw.modifier
                });
                l_v117_0.desync:depend(v150, v151, v152, v154);
                l_v117_0.desync.offset:depend({
                    [1] = nil, 
                    [2] = "Offset", 
                    [1] = l_v117_0.desync
                });
                l_v117_0.desync.left:depend({
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_v117_0.desync
                });
                l_v117_0.desync.right:depend({
                    [1] = nil, 
                    [2] = "Switch", 
                    [1] = l_v117_0.desync
                });
                l_v117_0.desync.freestanding:depend({
                    [1] = nil, 
                    [2] = 3, 
                    [1] = l_v117_0.desync.options
                });
                if l_v116_0 ~= "Shared" then
                    local l_hidden_0 = l_v117_0.hidden;
                    l_v117_0.hidden:depend(v150, v151, v152, v154);
                    l_v117_0.hidden_pitch:depend(v150, v151, v152, v154, l_hidden_0);
                    l_v117_0.hidden_pitch.offset:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [1] = l_v117_0.hidden_pitch
                    });
                    l_v117_0.hidden_pitch.start:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_pitch
                    });
                    l_v117_0.hidden_pitch.finish:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_pitch
                    });
                    l_v117_0.hidden_pitch.speed:depend({
                        [1] = nil, 
                        [2] = "Spin", 
                        [1] = l_v117_0.hidden_pitch
                    });
                    l_v117_0.hidden_pitch.delay:depend({
                        [1] = nil, 
                        [2] = "Switch", 
                        [1] = l_v117_0.hidden_pitch
                    });
                    l_v117_0.hidden_yaw:depend(v150, v151, v152, v154, l_hidden_0);
                    l_v117_0.hidden_yaw.offset:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [1] = l_v117_0.hidden_yaw
                    });
                    l_v117_0.hidden_yaw.left:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_yaw
                    });
                    l_v117_0.hidden_yaw.right:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_yaw
                    });
                    l_v117_0.hidden_yaw.speed:depend({
                        [1] = nil, 
                        [2] = "Spin", 
                        [1] = l_v117_0.hidden_yaw
                    });
                    l_v117_0.hidden_yaw.delay:depend({
                        [1] = nil, 
                        [2] = "Switch", 
                        [1] = l_v117_0.hidden_yaw
                    });
                    l_v117_0.hidden_desync:depend(v150, v151, v152, v154, l_hidden_0);
                    l_v117_0.hidden_desync.offset:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [1] = l_v117_0.hidden_desync
                    });
                    l_v117_0.hidden_desync.left:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_desync
                    });
                    l_v117_0.hidden_desync.right:depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = true, 
                        [1] = l_v117_0.hidden_desync
                    });
                    l_v117_0.hidden_desync.freestanding:depend({
                        [1] = nil, 
                        [2] = 3, 
                        [1] = l_v117_0.hidden_desync.options
                    });
                end;
                local function v157()
                    -- upvalues: l_v110_0 (ref), l_v117_0 (ref), l_v116_0 (ref)
                    table.update(l_v110_0.base, l_v117_0.desync.options:get("Avoid Overlap"), "Avoid Overlap");
                    table.update(l_v110_0.base, l_v117_0.desync.options:get("Anti Bruteforce"), "Anti Bruteforce");
                    table.update(l_v110_0.base, l_v117_0.desync:get() == "Switch" and l_v117_0.yaw:get() ~= "Switch", "Jitter");
                    if l_v116_0 == "Shared" then
                        return;
                    else
                        table.update(l_v110_0.hidden, l_v117_0.hidden_desync.options:get("Avoid Overlap"), "Avoid Overlap");
                        table.update(l_v110_0.hidden, l_v117_0.hidden_desync.options:get("Anti Bruteforce"), "Anti Bruteforce");
                        table.update(l_v110_0.hidden, l_v117_0.hidden_desync:get() == "Switch" and l_v117_0.hidden_yaw:get() ~= "Switch", "Jitter");
                        return;
                    end;
                end;
                l_v117_0.yaw:set_callback(v157, true);
                l_v117_0.desync:set_callback(v157, true);
                l_v117_0.desync.options:set_callback(v157, true);
                if l_v116_0 ~= "Shared" then
                    l_v117_0.hidden_yaw:set_callback(v157, true);
                    l_v117_0.hidden_desync:set_callback(v157, true);
                    l_v117_0.hidden_desync.options:set_callback(v157, true);
                end;
                v7.builder[l_v116_0] = l_v117_0;
            end;
        end;
    end;
    local function v170(v158, _)
        -- upvalues: v7 (ref), v6 (ref)
        local v160 = entity.get_threat(true);
        local v161 = rage.antiaim:get_target(true);
        local l_velocity_0 = entity.get_local_player():get_anim_state().velocity;
        local l_v158_0 = v158;
        local v164 = v160 and v160 or false;
        local v165 = v161 and v161 or false;
        local v166 = math.sqrt(l_velocity_0.x ^ 2 + l_velocity_0.y ^ 2) > 5 and (v164 or v165) or v7.force_lag:get(l_v158_0);
        v6.rage.double_tap.lag_options:override(v166 and "Always On" or "Disabled");
        local l_options_0 = v6.rage.hide_shots.options;
        local l_l_options_0_0 = l_options_0;
        l_options_0 = l_options_0.override;
        local v169;
        if v7.force_lag.allow_with_hideshots:get() then
            v169 = v166 and "Break LC" or "Favor Fire Rate";
        else
            v169 = "Favor Fire Rate";
        end;
        l_options_0(l_l_options_0_0, v169);
    end;
    local function v171()
        -- upvalues: v6 (ref), l_v15_1 (ref), v7 (ref)
        cvar.sv_maxusrcmdprocessticks:int(16, true);
        v6.rage.enabled:override(nil);
        l_v15_1.enabled:override(true);
        l_v15_1.yaw:override("Backward");
        l_v15_1.yaw.base:override(v7.manuals.options:get(1) and manual_yaw ~= 0 and "Local View" or "At Target");
        l_v15_1.yaw.avoid_backstab:override(true);
        l_v15_1.yaw_modifier:override("Disabled");
        l_v15_1.yaw.hidden:override(false);
        l_v15_1.body_yaw:override(true);
        l_v15_1.freestanding:override(v7.freestanding:get() and manual_yaw == 0);
        l_v15_1.freestanding.body_freestanding:override(false);
    end;
    local function v194(v172)
        -- upvalues: v8 (ref), v7 (ref), v6 (ref), l_v15_1 (ref), v170 (ref), v171 (ref), l_defensive_0 (ref), l_v16_1 (ref), l_v109_0 (ref), l_v110_0 (ref)
        local l_m_bWarmupPeriod_0 = entity.get_game_rules().m_bWarmupPeriod;
        local v174 = v8.get_player_position();
        local v175 = entity.get_local_player();
        local v176 = v8.get_defensive_ticks(v175);
        local v177 = v8.get_freestand_angle();
        if v7.fake_flick:get() == "Defensive" then
            v6.rage.double_tap.lag_options:override("Always On");
            v6.rage.hide_shots.options:override("Break LC");
            l_v15_1.yaw:override("Backward");
            l_v15_1.yaw.base:override("At Target");
            l_v15_1.yaw.offset:override(0);
            l_v15_1.yaw.hidden:override(true);
            l_v15_1.yaw.avoid_backstab:override(false);
            l_v15_1.freestanding:override(false);
            l_v15_1.body_yaw:override(true);
            local l_inverter_0 = l_v15_1.body_yaw.inverter;
            local l_l_inverter_0_0 = l_inverter_0;
            l_inverter_0 = l_inverter_0.override;
            local v180;
            if not v177 or v177 ~= 1 then
                v180 = false;
            else
                v180 = true;
            end;
            l_inverter_0(l_l_inverter_0_0, v180);
            l_v15_1.body_yaw.right_limit:override(60);
            l_v15_1.body_yaw.left_limit:override(60);
            l_v15_1.body_yaw.options:override({
                [1] = "Avoid overlap"
            });
            l_v15_1.body_yaw.freestanding:override("Off");
            rage.antiaim:override_hidden_yaw_offset(fs_side and fs_side * -1 or -90);
            v172.force_defensive = globals.tickcount % 10 == 0;
            return;
        else
            v170(v174, v172);
            v171();
            if v7.angles_hider:get(1) and l_m_bWarmupPeriod_0 or v7.angles_hider:get(2) and not entity.get_threat() then
                l_v15_1.pitch:override(v7.angles_hider.method:get() == 1 and "Disabled" or "Down");
                l_v15_1.yaw:override("Backward");
                l_v15_1.yaw.offset:override(manual_yaw ~= 0 and manual_yaw or v7.angles_hider.method:get() == 1 and math.normalize_yaw(globals.tickcount / 16 * 360 % 360) or 0);
                l_v15_1.yaw.avoid_backstab:override(true);
                l_v15_1.body_yaw:override(true);
                l_v15_1.body_yaw.inverter:override(true);
                l_v15_1.body_yaw.left_limit:override(60);
                l_v15_1.body_yaw.right_limit:override(60);
                l_v15_1.body_yaw.options:override({
                    [1] = "Avoid Overlap", 
                    [2] = "Anti Bruteforce"
                });
                l_v15_1.body_yaw.freestanding:override("Peek Fake");
                return;
            else
                if v174:find("Air") and globals.tickcount % 64 >= 10 and not v175:get_anim_state().landing then
                    if v7.lag_switch:get() == "Defensive" then
                        l_v15_1.body_yaw:override(false);
                        if v176 < 3 then
                            v6.rage.enabled:override(false);
                            cvar.sv_maxusrcmdprocessticks:int(19, true);
                            v6.aa.fl_enabled:override(true);
                            v6.aa.fake_lag.limit:override(17);
                            v6.aa.fake_lag.variability:override(0);
                            rage.exploit:force_teleport();
                        else
                            rage.exploit:force_charge();
                            v6.aa.fake_lag.limit:override(nil);
                            v6.aa.fake_lag.variability:override(nil);
                            v6.rage.double_tap.lag_options:override("Always On");
                            v172.force_defensive = true;
                        end;
                        return;
                    elseif v7.lag_switch:get() == "Offensive" then
                        l_v15_1.body_yaw:override(false);
                        if globals.tickcount % 4 == 0 then
                            v6.rage.enabled:override(false);
                            cvar.sv_maxusrcmdprocessticks:int(19, true);
                            v6.aa.fl_enabled:override(true);
                            v6.aa.fake_lag.limit:override(17);
                            v6.aa.fake_lag.variability:override(0);
                            rage.exploit:force_teleport();
                        else
                            rage.exploit:force_charge();
                            v6.aa.fake_lag.limit:override(nil);
                            v6.aa.fake_lag.variability:override(nil);
                            v6.rage.double_tap.lag_options:override("Always On");
                        end;
                        return;
                    end;
                end;
                local v181 = v7.builder[v174].override_state:get() and v174 or "Shared";
                local v182 = v7.builder[v181];
                local v183 = rage.antiaim:get_target(true);
                if v181 ~= "Shared" and v182.hidden:get() and manual_yaw == 0 and not v183 and l_defensive_0() then
                    l_v15_1.yaw.hidden:override(true);
                    l_v15_1.yaw.offset:override(0);
                    local v184 = 0;
                    local v185 = 0;
                    if v182.hidden_pitch:get() == "Offset" then
                        v184 = v182.hidden_pitch.offset:get() * -1;
                    elseif v182.hidden_pitch:get() == "Switch" then
                        l_v16_1.hidden_pitch = v8.switch_system(v182.hidden_pitch.delay, v172);
                        v184 = l_v16_1.hidden_pitch and v182.hidden_pitch.start:get() or v182.hidden_pitch.finish:get();
                    elseif v182.hidden_pitch:get() == "Random" then
                        v184 = math.random(v182.hidden_pitch.start:get(), v182.hidden_pitch.finish:get());
                    elseif v182.hidden_pitch:get() == "Spin" then
                        v184 = math.spin(v182.hidden_pitch.start:get(), v182.hidden_pitch.finish:get(), v182.hidden_pitch.speed:get() / 5);
                    end;
                    l_v16_1.hidden_yaw = v8.switch_system(v182.hidden_yaw.delay, v172);
                    if v182.hidden_yaw:get() == "Offset" then
                        v185 = v182.hidden_yaw.offset:get() * -1;
                    elseif v182.hidden_yaw:get() == "Switch" then
                        v185 = math.normalize_yaw(l_v16_1.hidden_yaw and v182.hidden_yaw.left:get() or v182.hidden_yaw.right:get());
                    elseif v182.hidden_yaw:get() == "Random" then
                        v185 = math.random(v182.hidden_yaw.left:get(), v182.hidden_yaw.right:get());
                    elseif v182.hidden_yaw:get() == "Spin" then
                        v185 = math.normalize_yaw(math.spin(v182.hidden_yaw.left:get(), v182.hidden_yaw.right:get(), v182.hidden_yaw.speed:get() / 5) + 180) * -1;
                    end;
                    local v186 = v182.hidden_desync:get() == "Switch";
                    l_v15_1.body_yaw.left_limit:override(v182.hidden_desync.left:get());
                    l_v15_1.body_yaw.right_limit:override(v186 and v182.hidden_desync.right:get() * -1 or v182.hidden_desync.offset:get());
                    local l_inverter_1 = l_v15_1.body_yaw.inverter;
                    local l_l_inverter_1_0 = l_inverter_1;
                    l_inverter_1 = l_inverter_1.override;
                    local v189;
                    if v186 and manual_yaw == 0 then
                        v189 = l_v16_1.hidden_yaw;
                        if v189 then
                            goto label1;
                        end;
                    end;
                    v189 = false;
                    ::label1::;
                    l_inverter_1(l_l_inverter_1_0, v189);
                    rage.antiaim:override_hidden_pitch(v184);
                    rage.antiaim:override_hidden_yaw_offset(v185);
                    return;
                elseif v7.freestanding:get() and v183 or manual_yaw ~= 0 then
                    l_v15_1.pitch:override("Down");
                    l_v15_1.body_yaw.left_limit:override(60);
                    l_v15_1.body_yaw.right_limit:override(60);
                    l_v15_1.body_yaw.inverter:override(false);
                    l_v15_1.body_yaw.options:override({});
                    l_v15_1.yaw.offset:override(manual_yaw ~= 0 and manual_yaw or v183 and v177 or 0);
                    return;
                else
                    l_v16_1.yaw = v8.switch_system(v182.yaw.delay, v172);
                    l_v109_0.yaw = v182.yaw.modifier:get() == "Random" and math.random(-v182.yaw.modifier_offset:get(), v182.yaw.modifier_offset:get()) or 0;
                    l_v15_1.pitch:override(v182.pitch:get() == "Down" and "Down" or "Disabled");
                    local _ = v182.desync:get() == "Switch";
                    if v182.yaw:get() == "Offset" then
                        if v182.desync:get() == "Switch" then
                            l_v15_1.body_yaw.left_limit:override(v182.desync.left:get());
                            l_v15_1.body_yaw.right_limit:override(v182.desync.right:get() * -1);
                        else
                            l_v15_1.body_yaw.left_limit:override(v182.desync.offset:get());
                            l_v15_1.body_yaw.right_limit:override(v182.desync.offset:get());
                        end;
                        l_v15_1.body_yaw.inverter:override(false);
                        l_v15_1.body_yaw.options:override(l_v110_0.base);
                        l_v15_1.yaw.offset:override(math.normalize_yaw(v182.yaw.offset:get() + l_v109_0.yaw));
                    else
                        if v182.desync:get() == "Switch" then
                            l_v15_1.body_yaw.left_limit:override(v182.desync.left:get());
                            l_v15_1.body_yaw.right_limit:override(v182.desync.right:get() * -1);
                            l_v15_1.body_yaw.inverter:override(l_v16_1.yaw);
                        else
                            l_v15_1.body_yaw.left_limit:override(v182.desync.offset:get());
                            l_v15_1.body_yaw.right_limit:override(v182.desync.offset:get());
                            l_v15_1.body_yaw.inverter:override(false);
                        end;
                        l_v15_1.body_yaw.options:override(l_v110_0.base);
                        l_v15_1.yaw.offset:override(v182.yaw.modifier:get() == "Break" and globals.choked_commands == 0 and v182.yaw.modifier_offset:get() or math.normalize_yaw((l_v16_1.yaw and v182.yaw.left:get() or v182.yaw.right:get()) + l_v109_0.yaw));
                    end;
                    local l_freestanding_0 = l_v15_1.body_yaw.freestanding;
                    local l_l_freestanding_0_0 = l_freestanding_0;
                    l_freestanding_0 = l_freestanding_0.override;
                    local v193;
                    if v182.desync.options:get(3) then
                        v193 = v182.desync.freestanding:get(3) == "Fake" and "Peek Fake" or "Peek Real";
                    else
                        v193 = "Off";
                    end;
                    l_freestanding_0(l_l_freestanding_0_0, v193);
                    return;
                end;
            end;
        end;
    end;
    events.createmove(v194, true);
end;
v14 = v9.visuals_regulation;
v15 = function(v195, v196)
    v195.amount:set(v196);
end;
do
    local l_v15_2, l_v16_2, l_v109_1 = v15, v16, v109;
    v7.aspectratio = v14:switch("\v\f<tv>\r   Aspectratio", false, function(v200, v201)
        -- upvalues: l_v15_2 (ref)
        return {
            amount = v200:slider("##Aspectratio amount", 1000, 2500, 1778, 1, function(v202)
                return val("W", v202 / 1000);
            end), 
            v21_9 = v200:button("21:9", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 2333.3333333333335);
            end, true), 
            v16_9 = v200:button("16:9", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 1777.7777777777776);
            end, true), 
            v16_10 = v200:button("16:10", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 1600);
            end, true), 
            v3_2 = v200:button(" 3:2 ", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 1500);
            end, true), 
            v4_3 = v200:button(" 4:3 ", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 1333.3333333333333);
            end, true), 
            v5_4 = v200:button(" 5:4 ", function()
                -- upvalues: l_v15_2 (ref), v201 (ref)
                l_v15_2(v201, 1250);
            end, true)
        }, true;
    end);
    l_v16_2 = l_smoothy_0.new(v7.aspectratio.amount:get() / 1000);
    l_v109_1 = function()
        -- upvalues: l_v16_2 (ref), v7 (ref)
        local v203 = l_v16_2:update(0.25, v7.aspectratio:get() and v7.aspectratio.amount:get() / 1000 or 1.778);
        cvar.r_aspectratio:float(v203, true);
    end;
    v110 = function()
        -- upvalues: l_v109_1 (ref)
        events.render(l_v109_1, true);
        utils.execute_after(10, function()
            -- upvalues: l_v109_1 (ref)
            events.render(l_v109_1, false);
        end);
    end;
    v7.aspectratio:set_callback(v110, true);
    v7.aspectratio.amount:set_callback(v110, true);
    events.shutdown(function()
        cvar.r_aspectratio:float(1.778, true);
    end, true);
    v7.aspectratio:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v7.addition_groups
    });
end;
v14 = v9.visuals_regulation;
v15 = function(v204, v205, v206, v207, v208)
    v208.fov:set(v204);
    v208.x:set(v205);
    v208.y:set(v206);
    v208.z:set(v207);
end;
do
    local l_v15_3, l_v16_3, l_v109_2, l_v110_1 = v15, v16, v109, v110;
    v7.viewmodel = v14:switch("\v\f<hands>\r    Viewmodel", false, function(v213, v214)
        -- upvalues: l_v15_3 (ref)
        return {
            fov = v213:slider("##Viewmodel fov", 0, 136, 68, 1, function(v215)
                return val("FOV", v215);
            end), 
            x = v213:slider("##Viewmodel x", -5000, 5000, 250, 1, function(v216)
                return val("X", v216 / 100);
            end), 
            y = v213:slider("##Viewmodel y", -5000, 5000, 0, 1, function(v217)
                return val("Y", v217 / 100);
            end), 
            z = v213:slider("##Viewmodel z", -5000, 5000, -150, 1, function(v218)
                return val("Z", v218 / 100);
            end), 
            default = v213:button("Default", function()
                -- upvalues: l_v15_3 (ref), v214 (ref)
                l_v15_3(68, 250, 0, -150, v214);
            end, true), 
            herstyle = v213:button("herstyle", function()
                -- upvalues: l_v15_3 (ref), v214 (ref)
                l_v15_3(68, 400, 400, -400, v214);
            end, true), 
            quecy = v213:button("quecy", function()
                -- upvalues: l_v15_3 (ref), v214 (ref)
                l_v15_3(68, -180, -900, -100, v214);
            end, true)
        }, true;
    end);
    l_v16_3 = l_smoothy_0.new(v7.viewmodel.fov:get());
    l_v109_2 = l_smoothy_0.new(v7.viewmodel.x:get() / 100);
    l_v110_1 = l_smoothy_0.new(v7.viewmodel.y:get() / 100);
    local v219 = l_smoothy_0.new(v7.viewmodel.z:get() / 100);
    local function v224()
        -- upvalues: l_v16_3 (ref), v7 (ref), l_v109_2 (ref), l_v110_1 (ref), v219 (ref)
        local v220 = l_v16_3:update(0.25, v7.viewmodel:get() and v7.viewmodel.fov:get() or 68);
        local v221 = l_v109_2:update(0.25, v7.viewmodel:get() and v7.viewmodel.x:get() / 100 or 2.5);
        local v222 = l_v110_1:update(0.25, v7.viewmodel:get() and v7.viewmodel.y:get() / 100 or 0);
        local v223 = v219:update(0.25, v7.viewmodel:get() and v7.viewmodel.z:get() / 100 or -1.5);
        cvar.viewmodel_fov:float(v220, true);
        cvar.viewmodel_offset_x:float(v221, true);
        cvar.viewmodel_offset_y:float(v222, true);
        cvar.viewmodel_offset_z:float(v223, true);
    end;
    local function v225()
        -- upvalues: v224 (ref)
        events.render(v224, true);
        utils.execute_after(10, function()
            -- upvalues: v224 (ref)
            events.render(v224, false);
        end);
    end;
    v7.viewmodel:set_callback(v225, true);
    v7.viewmodel.fov:set_callback(v225, true);
    v7.viewmodel.x:set_callback(v225, true);
    v7.viewmodel.y:set_callback(v225, true);
    v7.viewmodel.z:set_callback(v225, true);
    events.shutdown(function()
        cvar.viewmodel_fov:float(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end, true);
    v7.viewmodel:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v7.addition_groups
    });
end;
v7.interpolate = v9.visuals_regulation:switch("\v\f<eye>\r    Interpolate", false, function(v226)
    return {
        options = v226:listable("##   Zoom options", {
            [1] = "\v\f<golang>\r  Counter Strike", 
            [2] = " \v\f<magnifying-glass>\r   Zoom", 
            [3] = "  \v\f<person>\r   Transparency", 
            [4] = " \v\f<arrow-up-z-a>\r   Thirdperson", 
            [5] = " \v\f<camera>\r   Camera", 
            [6] = " \v\f<rabbit-running>\r  Local animations"
        }), 
        camera_speed = v226:slider("Camera", 5, 100, 50, 1, function(v227)
            return val("V", v227 .. "%");
        end), 
        local_animations_speed = v226:slider("Local animations", 5, 100, 50, 1, function(v228)
            return val("V", v228 .. "%");
        end), 
        keep_model_transparency = v226:switch("Keep model transparency")
    }, true;
end);
v7.interpolate:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v7.addition_groups
});
v7.interpolate.keep_model_transparency:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v7.interpolate.options
});
v7.interpolate.camera_speed:depend({
    [1] = nil, 
    [2] = 5, 
    [1] = v7.interpolate.options
});
v7.interpolate.local_animations_speed:depend({
    [1] = nil, 
    [2] = 6, 
    [1] = v7.interpolate.options
});
v15 = utils.opcode_scan("client.dll", "A1 ? ? ? ? F3 0F 10 40 ? 0F 5A C0 F2 0F 11 04", 1) or error("globalvars pattern is outdated");
v16 = ffi.cast("c_global_vars_base**", ffi.cast("char*", v15))[0] or error("globalvars is invalid");
do
    local l_v16_4, l_v109_3 = v16, v109;
    l_v109_3 = function()
        -- upvalues: l_v16_4 (ref)
        if not l_v16_4 then
            return;
        else
            l_v16_4.interpolation_amount = 0.5;
            return;
        end;
    end;
    v110 = function()
        -- upvalues: l_v109_3 (ref), v7 (ref)
        events.createmove(l_v109_3, v7.interpolate:get() and v7.interpolate.options:get(1));
    end;
    v7.interpolate:set_callback(v110, true);
    v7.interpolate.options:set_callback(v110, true);
end;
v15 = v6.visual;
v16 = l_smoothy_0.new(v15.fov:get());
do
    local l_v15_4, l_v16_5, l_v109_4 = v15, v16, v109;
    l_v109_4 = function(v234)
        -- upvalues: l_v16_5 (ref), l_v15_4 (ref)
        local v235 = entity.get_local_player();
        v234.fov = l_v16_5:update(0.1, v235.m_bIsScoped and l_v15_4.fov:get() - l_v15_4.override_zoom:get() or l_v15_4.fov:get());
    end;
    v110 = function()
        -- upvalues: l_v109_4 (ref), v7 (ref)
        events.override_view(l_v109_4, v7.interpolate:get() and v7.interpolate.options:get(2));
    end;
    v7.interpolate:set_callback(v110, true);
    v7.interpolate.options:set_callback(v110, true);
end;
v15 = 0;
do
    local l_v15_5, l_v16_6 = v15, v16;
    l_v16_6 = function()
        -- upvalues: l_v15_5 (ref), v7 (ref)
        local v238 = entity.get_local_player();
        local v239 = v238:get_player_weapon();
        if not v239 then
            return;
        else
            local v240 = v239:get_classname();
            if not v240 then
                return;
            else
                local l_m_zoomLevel_0 = v239.m_zoomLevel;
                l_v15_5 = math.lerp(l_v15_5, (not (not (v7.interpolate.keep_model_transparency:get() and l_m_zoomLevel_0) or l_m_zoomLevel_0 == 0) or v238.m_bIsScoped or v240:find("Grenade")) and 59 or 255, 0.15);
                return l_v15_5;
            end;
        end;
    end;
    v109 = function()
        -- upvalues: l_v16_6 (ref), v7 (ref)
        events.localplayer_transparency(l_v16_6, v7.interpolate:get() and v7.interpolate.options:get(3));
    end;
    v7.interpolate:set_callback(v109, true);
    v7.interpolate.options:set_callback(v109, true);
end;
v15 = v6.visual;
v16 = l_smoothy_0.new(v15.fov:get());
do
    local l_v15_6, l_v16_7, l_v109_5 = v15, v16, v109;
    l_v109_5 = function()
        -- upvalues: l_v16_7 (ref), l_v15_6 (ref)
        local v245 = l_v16_7:update(0.25, common.is_in_thirdperson() and l_v15_6.thirdperson.distance:get() or 30);
        l_v15_6.thirdperson.distance:override(v245);
    end;
    v110 = function()
        -- upvalues: l_v109_5 (ref), v7 (ref), l_v15_6 (ref)
        events.render(l_v109_5, v7.interpolate.options:get(4));
        utils.execute_after(10, function()
            -- upvalues: l_v109_5 (ref), l_v15_6 (ref)
            events.render(l_v109_5, false);
            l_v15_6.thirdperson.distance:override(nil);
        end);
    end;
    v7.interpolate:set_callback(v110, true);
    v7.interpolate.options:set_callback(v110, true);
    l_v15_6.thirdperson:set_callback(v110, true);
end;
v15 = render.camera_position();
do
    local l_v15_7, l_v16_8 = v15, v16;
    l_v16_8 = function(v248)
        -- upvalues: l_v15_7 (ref), v7 (ref)
        if l_v15_7 == nil then
            l_v15_7 = render.camera_position();
        end;
        local v249 = render.camera_position();
        local v250 = vector(l_v15_7.x, l_v15_7.y, l_v15_7.z):lerp(v249, v7.interpolate.camera_speed:get() / 100);
        if common.is_in_thirdperson() then
            v248.camera = v250;
        end;
        l_v15_7 = v250;
    end;
    v109 = function()
        -- upvalues: l_v16_8 (ref), v7 (ref)
        events.override_view(l_v16_8, v7.interpolate:get() and v7.interpolate.options:get(5));
    end;
    v7.interpolate:set_callback(v109, true);
    v7.interpolate.options:set_callback(v109, true);
end;
v15 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
v16 = {
    [0] = 0, 
    [1] = 0, 
    [2] = 0, 
    [3] = 0, 
    [4] = nil, 
    [5] = nil, 
    [6] = 0, 
    [7] = 0, 
    [8] = nil, 
    [9] = 0, 
    [10] = 0, 
    [11] = nil, 
    [12] = 0, 
    [13] = 0, 
    [14] = nil, 
    [15] = 0
};
v109 = {
    [0] = 0, 
    [1] = 0, 
    [2] = 0, 
    [3] = 0, 
    [4] = nil, 
    [5] = nil, 
    [6] = 0, 
    [7] = 0, 
    [8] = nil, 
    [9] = 0, 
    [10] = 0, 
    [11] = nil, 
    [12] = 0, 
    [13] = 0, 
    [14] = nil, 
    [15] = 0
};
do
    local l_v16_9, l_v109_6, l_v110_2 = v16, v109, v110;
    l_v110_2 = function()
        -- upvalues: v7 (ref), l_v16_9 (ref), v8 (ref), l_v109_6 (ref)
        local v254 = entity.get_local_player();
        local v255 = v7.interpolate.local_animations_speed:get() / 100;
        for v256, v257 in pairs(l_v16_9) do
            local v258 = v8.get_anim_layer(v254, v256);
            local l_m_flWeight_0 = v258.m_flWeight;
            if v257 == 0 then
                l_v16_9[v256] = l_m_flWeight_0;
            else
                local v260 = math.lerp(v257, l_m_flWeight_0, v255);
                v258.m_flWeight = v260;
                l_v16_9[v256] = v260;
            end;
        end;
        for v261, v262 in pairs(l_v109_6) do
            local v263 = v254.m_flPoseParameter[v261];
            if v262 == 0 then
                l_v109_6[v261] = v263;
            else
                local v264 = math.lerp(v262, v263, v255);
                v254.m_flPoseParameter[v261] = v264;
                l_v109_6[v261] = v264;
            end;
        end;
    end;
    local function v265()
        -- upvalues: l_v110_2 (ref), v7 (ref)
        events.post_update_clientside_animation(l_v110_2, v7.interpolate:get() and v7.interpolate.options:get(6));
    end;
    v7.interpolate:set_callback(v265, true);
    v7.interpolate.options:set_callback(v265, true);
end;
v7.thanos_snap = v9.visuals_regulation:switch(" \v\f<person>\r     Thanos snap", false);
v15 = function()
    -- upvalues: v7 (ref)
    cvar.cl_ragdoll_physics_enable:int(v7.thanos_snap:get() and 0 or 1, true);
end;
v7.thanos_snap:set_callback(v15, true);
v7.thanos_snap:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v7.groups
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v7.addition_groups
});
v14 = v9.aimbot_accuracy;
v15 = v6.rage;
v7.force_shot = v14:switch("\v\f<hundred-points>\r    Force shot", false, function(v266)
    return {
        options = v266:listable("##   Force shoot options", {
            [1] = "\v\f<person-circle-plus>\r    Max multipoints"
        })
    }, true;
end);
v16 = {
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Arms", 
    [5] = "Legs", 
    [6] = "Feet"
};
do
    local l_v15_8, l_v16_10 = v15, v16;
    force_shot_work = function(v269)
        -- upvalues: v7 (ref), l_v15_8 (ref), l_v16_10 (ref)
        local v270 = v269 and v269 or v7.force_shot:get();
        local v271 = v7.force_shot.options:get(1) and 100 or nil;
        local l_delay_shotik_0 = l_v15_8.min_damage.delay_shotik;
        local l_l_delay_shotik_0_0 = l_delay_shotik_0;
        l_delay_shotik_0 = l_delay_shotik_0.override;
        if v270 then

        end;
        l_delay_shotik_0(l_l_delay_shotik_0_0, not v270 and nil);
        l_v15_8.enabled.extended_backtrack:override(v270 and true or nil);
        l_v15_8.hitboxes:override(v270 and l_v16_10 or nil);
        l_v15_8.multipoint:override(v270 and l_v16_10 or nil);
        l_v15_8.multipoint.head_scale:override(v270 and v271 or nil);
        l_v15_8.multipoint.body_scale:override(v270 and v271 or nil);
        l_v15_8.penetrate_walls:override(v270 and true or nil);
        l_v15_8.body_aim:override(v270 and "Default" or nil);
        l_v15_8.body_aim.disablers:override(v270 and {} or nil);
        l_delay_shotik_0 = l_v15_8.body_aim.force_on_peek;
        l_l_delay_shotik_0_0 = l_delay_shotik_0;
        l_delay_shotik_0 = l_delay_shotik_0.override;
        if v270 then

        end;
        l_delay_shotik_0(l_l_delay_shotik_0_0, not v270 and nil);
        l_v15_8.safe_points:override(v270 and "Default" or nil);
        l_v15_8.ensure_hitbox_safety:override(v270 and {} or nil);
    end;
    v7.force_shot:set_callback(force_shot_work, true);
    v7.force_shot.options:set_callback(force_shot_work, true);
    v7.force_shot:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v7.addition_groups
    });
end;
v14 = v9.aimbot_logic;
v15 = v6.rage;
v7.ideal_peek = v14:switch("\v\f<jedi>\r    Ideal peek", false, function(v274)
    return {
        options = v274:listable("##Ideal peek options", {
            [1] = "\v\f<hundred-points>\r    Force shot"
        })
    }, true;
end);
do
    local l_v15_9 = v15;
    v16 = function()
        -- upvalues: v7 (ref), l_v15_9 (ref)
        local v276 = v7.ideal_peek:get() and l_v15_9.peek_assist:get();
        local v277 = v7.ideal_peek.options:get(1);
        v7.force_shot:override(v276 and v277);
        force_shot_work(v276 and v277);
        l_v15_9.auto_stop:override(v276 and true or nil);
        l_v15_9.auto_stop.options:override(v276 and {
            [1] = "Early", 
            [2] = "In Air"
        } or nil);
        l_v15_9.auto_stop.double_tap:override(v276 and {} or nil);
    end;
    l_v15_9.peek_assist:set_callback(v16, true);
    v7.ideal_peek:set_callback(v16, true);
    v7.ideal_peek.options:set_callback(v16, true);
    v7.ideal_peek:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v7.addition_groups
    });
end;
v7.adaptive_silent = v9.aimbot_other:switch("\v\f<face-meh-blank>\r    Adaptive silent", false);
v15 = function(_)
    -- upvalues: v6 (ref)
    local v279 = entity.get_local_player():get_player_weapon().m_flNextPrimaryAttack + 0.1 <= globals.curtime;
    v6.rage.enabled.silent_aim:override(v279);
end;
do
    local l_v15_10 = v15;
    v16 = function(v281)
        -- upvalues: l_v15_10 (ref), v6 (ref)
        events.createmove(l_v15_10, v281:get());
        v6.rage.enabled.silent_aim:override(nil);
    end;
    v7.adaptive_silent:set_callback(v16, true);
    v7.adaptive_silent:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v7.addition_groups
    });
end;
v14 = v9.aimbot_accuracy;
v15 = {
    [1] = "AWP", 
    [2] = "Auto", 
    [3] = "SSG-08", 
    [4] = "Deagle", 
    [5] = "Revolver", 
    [6] = "Pistols"
};
v16 = v6.rage;
do
    local l_v15_11, l_v16_11, l_v109_7 = v15, v16, v109;
    v7.hitchance = v14:switch(" \v\f<dice-six>\r    Hitchance", false, function(v285, _)
        -- upvalues: l_v15_11 (ref)
        local v287 = {
            weapons = v285:combo("##Current weapon hitchance", l_v15_11), 
            in_air = {}, 
            on_land = {}, 
            no_scope = {}
        };
        for _, v289 in pairs(l_v15_11) do
            v287.in_air[v289] = v285:slider(" \v\f<plane>\r   In air##" .. v289, 0, 100, 50, 1, function(v290)
                return val("HC", v290);
            end);
            v287.on_land[v289] = v285:slider(" \v\f<plane-arrival>\r   On land##" .. v289, 0, 100, 50, 1, function(v291)
                return val("HC", v291);
            end);
            if v289:find("Auto") then
                v287.no_scope[v289] = v285:slider(" \v\f<location-crosshairs-slash>\r   No scope##" .. v289, 0, 100, 50, 1, function(v292)
                    return val("HC", v292);
                end);
                v287.no_scope[v289]:depend({
                    [1] = v287.weapons, 
                    [2] = v289
                });
            end;
            for _, v294 in pairs({
                [1] = v287.in_air[v289], 
                [2] = v287.on_land[v289]
            }) do
                v294:depend({
                    [1] = v287.weapons, 
                    [2] = v289
                });
            end;
        end;
        return v287, true;
    end);
    v7.hitchance:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v7.addition_groups
    });
    v7.hitchance.weapons:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v7.addition_groups
    }, v7.hitchance);
    l_v109_7 = function()
        -- upvalues: v8 (ref), v7 (ref), l_v16_11 (ref)
        local v295 = entity.get_local_player();
        if not v295 then
            return;
        else
            local v296 = v295:get_player_weapon();
            if not v296 then
                return;
            else
                local v297 = v296:get_classname();
                local l_m_bIsScoped_0 = v295.m_bIsScoped;
                local v299 = v295:get_anim_state();
                local v300 = v299.landing and not v299.landed_on_ground_this_frame;
                local v301 = v8.get_player_position();
                local v302 = nil;
                local v303 = false;
                v302 = v297:find("AWP") and "AWP" or v297:find("SSG08") and "SSG-08" or (v297:find("SCAR20") or v297:find("G3SG1")) and "Auto" or v297:find("DEagle") and "Deagle" or v297:find("Revolver") and "Revolver" or (v297:find("Tec9") or v297:find("Glock") or v297:find("Elite") or v297:find("P250") or v297:find("HKP2000") or v297:find("P250") or v297:find("FiveSeven")) and "Pistols" or nil;
                for _, v305 in pairs(ui.get_binds()) do
                    if v305.active and v305.name == "Hit Chance" then
                        v303 = true;
                    end;
                end;
                if v302 and not v303 and v7.hitchance:get() then
                    if v301:find("Air") then
                        l_v16_11.hit_chance:override(v7.hitchance.in_air[v302]:get());
                    elseif v300 then
                        l_v16_11.hit_chance:override(v7.hitchance.on_land[v302]:get());
                    elseif not l_m_bIsScoped_0 then
                        l_v16_11.hit_chance:override(v7.hitchance.no_scope[v302] and v7.hitchance.no_scope[v302]:get());
                    else
                        l_v16_11.hit_chance:override(nil);
                    end;
                else
                    l_v16_11.hit_chance:override(nil);
                end;
                return;
            end;
        end;
    end;
    v110 = function()
        -- upvalues: l_v109_7 (ref)
        events.createmove:set(l_v109_7, true);
    end;
    v7.hitchance:set_callback(v110, true);
end;
v7.no_strafe_jump = v9.addition_movement:switch("\v\f<person-ski-jumping>\r    No strafe jump", false);
v15 = function()
    -- upvalues: v6 (ref)
    local l_velocity_1 = entity.get_local_player():get_anim_state().velocity;
    l_velocity_1 = math.sqrt(l_velocity_1.x ^ 2 + l_velocity_1.y ^ 2);
    v6.misc.air_strafe:override(l_velocity_1 > 4);
end;
do
    local l_v15_12 = v15;
    v16 = function(v308)
        -- upvalues: l_v15_12 (ref), v6 (ref)
        events.createmove(l_v15_12, v308:get());
        v6.misc.air_strafe:override(nil);
    end;
    v7.no_strafe_jump:set_callback(v16, true);
    v7.no_strafe_jump:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v7.addition_groups
    });
end;
v7.no_fall_damage = v9.addition_movement:switch("\v\f<face-head-bandage>\r    No fall damage", false);
v15 = function(v309)
    local v310 = entity.get_local_player();
    if v310.m_vecVelocity.z <= -500 then
        local v311 = v310:get_origin();
        local v312 = utils.trace_line(v311, v311 - vector(0, 0, 50));
        if utils.trace_line(v311, v311 - vector(0, 0, 15)).fraction ~= 1 then
            v309.in_duck = 0;
        elseif v312.fraction ~= 1 then
            v309.in_duck = 1;
        end;
    end;
end;
do
    local l_v15_13 = v15;
    v16 = function(_)
        -- upvalues: l_v15_13 (ref), v7 (ref)
        events.createmove(l_v15_13, v7.no_fall_damage:get());
    end;
    v7.no_fall_damage:set_callback(v16, true);
    v7.no_fall_damage:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v7.addition_groups
    });
end;
v7.fast_ladder = v9.addition_movement:switch("\v\f<water-ladder>\r    Fast ladder climbing", false);
v15 = function(v315)
    local v316 = entity.get_local_player();
    if v316.m_MoveType ~= 9 then
        return;
    else
        local v317 = v316:get_player_weapon();
        if v317:get_weapon_info().weapon_type == 9 then
            return;
        elseif v317.m_fThrowTime == 0 then
            return;
        else
            local l_m_vecLadderNormal_0 = v316.m_vecLadderNormal;
            if l_m_vecLadderNormal_0:lengthsqr() == 0 then
                return;
            else
                local v319 = render.camera_angles();
                local v320 = l_m_vecLadderNormal_0:angles();
                local v321 = v320.y - v319.y + 180;
                local v322 = v320.x - v319.x;
                v321 = math.normalize_yaw(v321);
                v322 = math.clamp(v322, -89, 89);
                local v323 = math.abs(v321);
                local v324 = 89;
                local v325 = -90;
                local v326 = v322 < -45;
                local v327 = v321 > 0;
                local v328 = v315.sidemove > 0;
                local v329 = v315.forwardmove > 0;
                if v323 > 70 and v323 < 135 then
                    if v315.forwardmove ~= 0 or v315.sidemove == 0 then
                        return;
                    else
                        if not v327 then
                            v325 = -v325;
                        end;
                        if v327 then
                            v328 = not v328;
                        end;
                        v315.in_back = v328 and 1 or 0;
                        v315.in_forward = v328 and 0 or 1;
                        if v327 then
                            v328 = not v328;
                        end;
                        v315.in_moveleft = v328 and 1 or 0;
                        v315.in_moveright = v328 and 0 or 1;
                        v315.view_angles.x = v324;
                        v315.view_angles.y = math.normalize_yaw(v320.y + v325);
                        return;
                    end;
                elseif v315.sidemove ~= 0 or v315.forwardmove == 0 then
                    return;
                else
                    if not v327 then
                        v325 = -v325;
                    end;
                    if not v326 then
                        v329 = not v329;
                    end;
                    v315.in_back = v329 and 0 or 1;
                    v315.in_forward = v329 and 1 or 0;
                    if not v327 then
                        v329 = not v329;
                    end;
                    v315.in_moveleft = v329 and 1 or 0;
                    v315.in_moveright = v329 and 0 or 1;
                    v315.view_angles.x = v324;
                    v315.view_angles.y = math.normalize_yaw(v320.y + v325);
                    return;
                end;
            end;
        end;
    end;
end;
do
    local l_v15_14 = v15;
    v16 = function(_)
        -- upvalues: l_v15_14 (ref), v7 (ref)
        events.createmove(l_v15_14, v7.fast_ladder:get());
    end;
    v7.fast_ladder:set_callback(v16, true);
    v7.fast_ladder:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v7.addition_groups
    });
end;
v7.stop_at_edges = v9.addition_movement:switch("\v\f<edge>\r    Stop at edges", false);
v15 = function(v332)
    -- upvalues: v6 (ref)
    if not v332.in_jump and not v6.misc.edge_jump:get() then
        local v333 = entity.get_local_player():simulate_movement();
        v333:think(4);
        if v333.velocity.z ~= 0 then
            v332.block_movement = 2;
        end;
    end;
end;
do
    local l_v15_15 = v15;
    v16 = function(_)
        -- upvalues: l_v15_15 (ref), v7 (ref)
        events.createmove(l_v15_15, v7.stop_at_edges:get());
    end;
    v7.stop_at_edges:set_callback(v16, true);
    v7.stop_at_edges:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v7.addition_groups
    });
end;
v7.disable_warmup_helper = v9.addition_warmup:switch("\v\f<hand-holding-medical>\r   Disable auto setup");
v15 = function()
    if utils.net_channel():get_server_info().address ~= "loopback" then
        return;
    else
        utils.console_exec("            sv_cheats 1; sv_lan 1; mp_humanteam any; jointeam 2; sv_infinite_ammo 1; sv_airaccelerate 100; sv_regeneration_force_on 1; mp_teamname_1 Weak dogs; mp_teamname_2 Juicy; \n             mp_maxmoney 60000; mp_afterroundmoney 60000; mp_startmoney 60000; cash_player_bomb_defused 60000; cash_player_bomb_planted 60000; cash_player_damage_hostage 60000;\n              cash_player_get_killed 60000; cash_player_interact_with_hostage 60000; cash_player_killed_enemy_default 60000; cash_player_killed_enemy_factor 60000\n               cash_player_killed_hostage 60000; cash_player_killed_teammate 60000; cash_player_rescued_hostage 60000; cash_player_respawn_amount 60000; cash_team_bonus_shorthanded 60000\n                cash_team_elimination_bomb_map 60000; cash_team_elimination_hostage_map_ct 60000; cash_team_elimination_hostage_map_t 60000; cash_team_hostage_alive 60000; cash_team_hostage_interaction 60000; cash_team_loser_bonus 60000\n                cash_team_loser_bonus_consecutive_rounds 60000; cash_team_planted_bomb_but_defused 60000; cash_team_rescued_hostage 60000; cash_team_survive_guardian_wave 60000; cash_team_terrorist_win_bomb 60000\n               cash_team_win_by_defusing_bomb 60000; cash_team_win_by_hostage_rescue 60000; cash_team_win_by_time_running_out_bomb 60000; cash_team_win_by_time_running_out_hostage 60000; cash_team_winner_bonus_consecutive_rounds 60000\n              mp_warmup_end; mp_warmup_pausetimer 1; bot_stop 1; bot_kick; bot_add; bot_add\n             mp_roundtime_defuse 60; mp_freezetime 0; mp_maxrounds 999; mp_buy_anywhere 1; mp_buytime 999999; mp_ignore_round_win_conditions 1; mp_freezetime 0; mp_roundrestartdelay 0;\n            mp_respawn_on_death_ct 1; mp_respawn_on_death_t 1; mp_anyone_can_pickup_c4 1; mp_death_drop_c4 1; mp_halftime 0; mp_timelimit 0; mp_restartgame 1; give item_defuserclear\n        ");
        utils.execute_after(2, function()
            local l_shortname_0 = common.get_map_data().shortname;
            if l_shortname_0 == "de_mirage" then
                utils.console_exec("                    setpos -1229.026367 -2284.192871 -130.028854;\n                    setang 6.395836 144.268875 0.000000\n                ");
            elseif l_shortname_0 == "cs_office" then
                utils.console_exec("                    setpos -786.637207 -1400.604492 -245.717194;\n                    setang 13.187860 -134.684067 0.000000\n                ");
            end;
            utils.execute_after(0.5, function()
                utils.console_exec("                    give weapon_ssg08;\n                     give weapon_deagle;\n                      give weapon_smokegrenade;\n                      give weapon_hegrenade;\n                     give weapon_molotov;\n                    give weapon_taser\n                ");
            end);
        end);
        return;
    end;
end;
events.level_init(v15, true);
do
    local l_v15_16 = v15;
    v7.disable_warmup_helper:set_callback(function(v338)
        -- upvalues: l_v15_16 (ref)
        events.level_init(l_v15_16, not v338:get());
    end);
    v7.disable_warmup_helper:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v7.groups
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v7.addition_groups
    });
end;
v14 = v9.general_summary;
v7.user = v14:label("\v\f<user-secret>    \r" .. common.get_username());
v7.build = v14:label("\v\f<code-branch>    \rBeta \v2.37");
v7.user:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v7.groups
});
v7.build:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v7.groups
});
v14 = v9.general_sidebar;
do
    local l_v15_17 = v15;
    l_v15_17 = function(v340, v341)
        -- upvalues: l_pui_0 (ref), l_v15_17 (ref)
        if v340 == 1 then
            l_pui_0.sidebar(" ", "  ");
            for v342 = 1, 26 do
                do
                    local l_v342_0 = v342;
                    utils.execute_after(0.2 * l_v342_0, function()
                        -- upvalues: l_pui_0 (ref), l_v342_0 (ref)
                        l_pui_0.sidebar(string.rep(" ", l_v342_0) .. "\v\f<plane-departure>" .. string.rep(" ", 26 - l_v342_0) .. "\r\f<buildings>", " ");
                    end);
                end;
            end;
            utils.execute_after(5.4, function()
                -- upvalues: l_pui_0 (ref), l_v15_17 (ref), v341 (ref)
                l_pui_0.sidebar("                                \aEB3B00FF\f<burst>", " ");
                utils.execute_after(1.5, function()
                    -- upvalues: l_v15_17 (ref), v341 (ref)
                    l_v15_17(2, v341);
                end);
            end);
        elseif v340 == 2 then
            for v344 = 0, 24 do
                do
                    local l_v344_0 = v344;
                    utils.execute_after(0.2 * l_v344_0, function()
                        -- upvalues: l_v344_0 (ref), l_pui_0 (ref)
                        local v346 = string.rep(" ", l_v344_0);
                        if l_v344_0 < 21 then
                            l_pui_0.sidebar(v346 .. "\aA5B0FFC8\f<drone>   \aFFA5DDC8\f<pig>", " ");
                        elseif l_v344_0 < 24 then
                            l_pui_0.sidebar(v346 .. "\aA5B0FFC8\f<drone>" .. string.rep(" ", 3 - (l_v344_0 - 20)) .. "\aFFA5DDC8\f<pig>", " ");
                        else
                            l_pui_0.sidebar(v346 .. "      \aFF0000FF\f<skull>", " ");
                        end;
                    end);
                end;
            end;
            utils.execute_after(5.4, function()
                -- upvalues: l_v15_17 (ref), v341 (ref)
                l_v15_17(1, v341);
            end);
        end;
    end;
    l_v15_17(1, l_v15_17);
end;