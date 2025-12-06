local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/mtools");
local _ = require("neverlose/anti_aim");
local l_gradient_0 = require("neverlose/gradient");
local l_base64_0 = require("neverlose/base64");
local l_smoothy_0 = require("neverlose/smoothy");
local l_clipboard_0 = require("neverlose/clipboard");
local l_bomb_0 = require("neverlose/bomb");
local _ = require("neverlose/surface");
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local v11 = {
    antiaim = {
        angels = {
            enable = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
                hidden = "Hidden", 
                base = "Base", 
                offset = "Offset", 
                avoid_backstab = "Avoid Backstab"
            }), 
            yaw_modifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            body_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
                inverter = "Inverter", 
                freestanding = "Freestanding", 
                options = "Options", 
                right_limit = "Right Limit", 
                left_limit = "Left Limit"
            }), 
            freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
                disable_yaw_modifiers = "Disable Yaw Modifiers", 
                body_freestanding = "Body Freestanding"
            }), 
            extended_angels = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", {
                extended_pitch = "Extended Pitch", 
                extended_roll = "Extended Roll"
            }), 
            fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
        }, 
        fakelag = {
            enabled = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
            limit = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
            variability = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
        }, 
        misc = {
            fakeduck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slowwalk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            legmovement = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
            fake_latency = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency")
        }
    }, 
    ragebot = {
        enable = ui.find("Aimbot", "Ragebot", "Main", "Enabled"), 
        override_resolver = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Override Resolver"), 
        double_tap = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
            options = "Lag Options"
        }), 
        osaa = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", {
            options = "Options"
        }), 
        enable = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", {
            da = "Dormant Aimbot"
        }), 
        dormant_aimbot = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        minimum_damage = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        headscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
        bodyscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"), 
        air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }, 
    world = {
        override_zoom = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", {
            scope_overlay = "Scope Overlay"
        })
    }
};
smooth = function(v12, v13, v14)
    return v12 + (v13 - v12) * v14;
end;
math.max_smooth_low_fps = 2.2222222222222223;
math.smooth = function(v15, v16, v17)
    if v15 == v16 then
        return v16;
    else
        local v18 = globals.frametime * 170;
        v17 = v17 * math.min(v18, math.max_smooth_low_fps);
        local v19 = v15 + (v16 - v15) * globals.frametime * v17;
        if math.abs(v19 - v16) < 0.01 then
            return v16;
        else
            return v19;
        end;
    end;
end;
local v20 = {
    base_speed = 0.095, 
    _list = {}
};
v20.new = function(v21, v22, v23, v24)
    -- upvalues: v20 (ref)
    if not v23 then
        v23 = v20.base_speed;
    end;
    if v20._list[v21] == nil then
        v20._list[v21] = v24 and v24 or 0;
    end;
    v20._list[v21] = math.smooth(v20._list[v21], v22, v23);
    return v20._list[v21];
end;
local v25 = {};
local v26 = false;
local v30 = (function()
    ffi.cdef("            typedef struct {\n                long long QuadPart;\n            } LARGE_INTEGER;\n            int QueryPerformanceCounter(LARGE_INTEGER* lpPerformanceCount);\n            int QueryPerformanceFrequency(LARGE_INTEGER* lpFrequency);\n            uint64_t GetTickCount64(void);\n        ");
    local v27 = ffi.new("LARGE_INTEGER");
    local v28 = ffi.new("LARGE_INTEGER");
    if ffi.C.QueryPerformanceFrequency(v27) == 1 then
        local v29 = tonumber(v27.QuadPart);
        return function()
            -- upvalues: v28 (ref), v29 (ref)
            if ffi.C.QueryPerformanceCounter(v28) == 1 then
                return tonumber(v28.QuadPart) / v29;
            else
                return ffi.C.GetTickCount64() / 1000;
            end;
        end;
    else
        return function()
            return ffi.C.GetTickCount64() / 1000;
        end;
    end;
end)();
local v31 = {
    map = {}, 
    performance = {}, 
    setup = {}
};
do
    local l_v30_0, l_v31_0 = v30, v31;
    local v40 = {
        set = function(v34, v35)
            -- upvalues: l_v31_0 (ref)
            if not l_v31_0.setup[v34.name] then
                l_v31_0.setup[v34.name] = {};
            end;
            if not v34.handlers[v35] then
                table.insert(l_v31_0.setup[v34.name], v35);
                v34.handlers[v35] = v35;
                return true;
            else
                return false;
            end;
        end, 
        unset = function(v36, v37)
            if v36.handlers[v37] then
                v36.handlers[v37] = nil;
                return true;
            else
                return false;
            end;
        end, 
        call = function(v38, ...)
            local v39 = events[v38.name];
            if v39 then
                v39:call(...);
            end;
        end
    };
    local function v47(v41, v42)
        -- upvalues: l_v31_0 (ref), l_v30_0 (ref)
        if type(v41) == "string" then
            events[v41](function(...)
                -- upvalues: l_v31_0 (ref), v41 (ref), v42 (ref), l_v30_0 (ref)
                l_v31_0.performance[v41] = {};
                xpcall(function(...)
                    -- upvalues: v42 (ref), l_v30_0 (ref), l_v31_0 (ref), v41 (ref)
                    for _, v44 in pairs(v42) do
                        local v45 = l_v30_0();
                        v44(...);
                        l_v31_0.performance[v41][v44] = (l_v30_0() - v45) * 1000;
                    end;
                end, function(v46)
                    -- upvalues: v41 (ref)
                    print(string.format("[%s] Error: %s", v41, v46));
                end, ...);
            end);
        end;
    end;
    v25 = events;
    if v26 then
        v25 = setmetatable({}, {
            __index = function(_, v49)
                -- upvalues: l_v31_0 (ref), v40 (ref), v47 (ref)
                local v50 = l_v31_0.map[v49];
                if not v50 then
                    print(string.format("Registering new event: %s", v49));
                    v50 = setmetatable({
                        handlers = {}, 
                        name = v49
                    }, {
                        __index = v40, 
                        __call = function(v51, v52, v53)
                            if v53 == nil then
                                v53 = true;
                            end;
                            v51[v53 and "set" or "unset"](v51, v52);
                        end
                    });
                    l_v31_0.map[v49] = v50;
                    v47(v49, v50.handlers);
                end;
                return v50;
            end
        });
        local v54 = 3;
        local v55 = 16;
        do
            local l_v54_0, l_v55_0 = v54, v55;
            events.render(function()
                -- upvalues: l_v31_0 (ref), l_v54_0 (ref), l_v55_0 (ref)
                local v58 = render.screen_size();
                local v59 = vector(5, v58.y * 0.25);
                for v60, v61 in pairs(l_v31_0.performance) do
                    render.text(l_v54_0, v59, color(255, 255, 255), nil, v60);
                    v59.y = v59.y + l_v55_0;
                    local l_ipairs_0 = ipairs;
                    local v63 = l_v31_0.setup[v60] or {};
                    for v64, v65 in l_ipairs_0(v63) do
                        local v66 = v61[v65] or 0;
                        local v67 = string.format("  [%d]: %.3fms", v64, v66);
                        local v68 = v66 > 1 and color(255, 100, 100) or color(255, 255, 255);
                        render.text(l_v54_0, v59, v68, nil, v67);
                        v59.y = v59.y + l_v55_0;
                    end;
                    v59.y = v59.y + 8;
                end;
            end);
        end;
    end;
end;
v30 = function(v69)
    return tonumber(v69:string());
end;
v31 = {
    colors = {
        accent = color("#BCEAE9FF")
    }, 
    _lua = {
        build = "Nightly", 
        version = "1.1", 
        update = "09.03.2025", 
        name = "Laura", 
        username = common.get_username()
    }
};
cvar.clear:call();
print_raw("                                                        \226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\n                                                        \226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\n                                                        \226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\n                                                        \226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\n                                                        \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\n                                                        \226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\n");
print_raw("                                                              ----------------------------");
print_raw(" ");
print_raw("                                                              Welcome back, " .. v31._lua.username .. "!");
print_raw("                                                              Curent build: " .. v31._lua.build .. ".");
print_raw(" ");
print_raw("                                                              ----------------------------");
smooth = function(v70, v71, v72)
    return v70 + (v71 - v70) * v72;
end;
math.max_smooth_low_fps = 2.2222222222222223;
math.smooth = function(v73, v74, v75)
    if v73 == v74 then
        return v74;
    else
        local v76 = globals.frametime * 170;
        v75 = v75 * math.min(v76, math.max_smooth_low_fps);
        local v77 = v73 + (v74 - v73) * globals.frametime * v75;
        if math.abs(v77 - v74) < 0.01 then
            return v74;
        else
            return v77;
        end;
    end;
end;
local v78 = {
    base_speed = 0.095, 
    _list = {}
};
v78.new = function(v79, v80, v81, v82)
    -- upvalues: v78 (ref)
    if not v81 then
        v81 = v78.base_speed;
    end;
    if v78._list[v79] == nil then
        v78._list[v79] = v82 and v82 or 0;
    end;
    v78._list[v79] = math.smooth(v78._list[v79], v80, v81);
    return v78._list[v79];
end;
l_pui_0.colors.accent = v31.colors.accent;
local v83 = {
    _inuilist = {}, 
    refs = {}, 
    main = {}, 
    antiaim = {}, 
    other = {}, 
    refs = {
        main = {
            conditions = {
                [1] = "Shared", 
                [2] = "Standing", 
                [3] = "Running", 
                [4] = "Slow Walking", 
                [5] = "Crouching", 
                [6] = "Crouch + Moving", 
                [7] = "Aerobic", 
                [8] = "Aerobic + Crouching", 
                [9] = "Auto Regulation"
            }, 
            force_defensive = {
                [1] = "Standing", 
                [2] = "Running", 
                [3] = "Slow Walking", 
                [4] = "Crouching", 
                [5] = "Crouch Moving", 
                [6] = "Aerobic", 
                [7] = "Aerobic + Crouching", 
                [8] = "Auto Regulation"
            }
        }
    }
};
configs_database = db.Lauraluaconfigs or {};
configs_database.config_list = configs_database.config_list or {
    [1] = "Default \aFFFFFF3C~ Santy"
};
configs_database.ui_list = configs_database.ui_list or {
    [1] = "Default \aFFFFFF3C~ Santy"
};
configs_database.config_list[1] = "Lauralua_W3siaW5wdXQiOiIiLCJsaXN0Ijo0LjAsInNlbGVjdG9yIjoxLjAsInNpZGViYXJjb21ibyI6IkRlZmF1bHQifSx7ImFuZ2VscyI6eyJzZWxlY3RvciI6IkF1dG8gUmVndWxhdGlvbiJ9LCJhbnRpYnJ1dGVmb3JjZSI6ZmFsc2UsImV4dHJhIjp7ImF2b2lkYmFja3N0YWIiOnRydWUsImZvcmNlZGVmIjp0cnVlLCJzYWZlaGVhZCI6ZmFsc2UsIndhcm11cGFhIjp0cnVlLCJ+Zm9yY2VkZWYiOnsiY29uZGl0aW9ucyI6WzIuMCw0LjAsNi4wLDcuMCwifiJdfSwifnNhZmVoZWFkIjp7InNlbGVjdGFibGUiOlsifiJdfX0sImhvdGtleXMiOnsiZmxpY2tfZXhwbG9pdCI6ZmFsc2UsImZyZWVzdGFuZCI6ZmFsc2UsImxhZ19leHBsb2l0IjpmYWxzZSwibWFudWFscyI6eyJtb2QiOiJkaXNhYmxlZCJ9LCJ+ZmxpY2tfZXhwbG9pdCI6eyJpbnZlcnRlZCI6ZmFsc2UsInBpdGNoIjo0NS4wfSwifmZyZWVzdGFuZCI6eyJtb2QiOlsyLjAsIn4iXX0sIn5sYWdfZXhwbG9pdCI6eyJ0aWNrcyI6MTYuMH19LCJtYXN0ZXJzd2l0Y2giOnRydWUsInNlbGVjdG9yIjoxLjAsInNlbGVjdG9yMiI6MS4wLCJzZWxlY3RvcjMiOjEuMH0seyJTaWRlSW5kaWNhdG9ycyI6ZmFsc2UsImFjY2VudF9jb2xvciI6IiNCQ0VBRTlGRiIsImFpbWJvdF9oZWxwZXIiOmZhbHNlLCJhaW1ib3RfbG9ncyI6dHJ1ZSwiYWlwZWVrYm90Ijp7ImJpbmRidXR0b24iOmZhbHNlLCJkb3RfYW1vdW50IjozLjAsImRvdF9vZmZzZXQiOjguMCwiZG90X3NwYW4iOjUuMH0sImFzcGVjdHJhdGlvIjp0cnVlLCJjbGFudGFnIjpmYWxzZSwiY3Zhcm9wdGltaXphdGlvbiI6dHJ1ZSwiZGFtYWdlX2luZGljYXRvciI6dHJ1ZSwiZGVjcmVhc2Vob2xkYWltdGlja3MiOmZhbHNlLCJkb3JtYW50X2FpbWJvdCI6ZmFsc2UsImVkZ2Vfc3RvcCI6ZmFsc2UsImZha2VsYXRlbmN5IjowLjAsImZhc3RsYWRkZXIiOnRydWUsImZvdl9hbmltYXRpb25zIjp0cnVlLCJoaXRjaGFuY2VfaW5kaWNhdG9yIjpmYWxzZSwiaGl0bWFya2VyIjpmYWxzZSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOnRydWUsIm5hZGVfdGhyb3dfZml4IjpmYWxzZSwibm9mYWxsZGFtYWdlIjp0cnVlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzZWxlY3RvciI6Mi4wLCJzZWxlY3RvcjEiOjEuMCwic3VwZXJfdG9zcyI6dHJ1ZSwidHJhc2h0YWxrIjpmYWxzZSwidmlld21vZGVsIjp0cnVlLCJ3YXRlcm1hcmtzdHlsZV9sYWJlbCI6eyJ3YXRlcm1hcmtzdHlsZSI6IkxhdXJhIn0sIndpZGdldHMiOnsidHlwZSI6WyJ+Il19LCJ+U2lkZUluZGljYXRvcnMiOnsiKnRhcmdldF9zZWxlY3QiOiIjOTZCRDEyRkYiLCJzdHlsZSI6IkdyYWRpZW50IiwidGFyZ2V0X3NlbGVjdCI6ZmFsc2UsInRleHRfc3R5bGUiOiJXaXRoIEljb25zIn0sIn5haW1ib3RfbG9ncyI6eyIqaGl0c3dpdGNoIjoiI0JDRUFFOUZGIiwiKm1pc3Nzd2l0Y2giOiIjRkY0NDQ0RkYiLCIqcHVyY2hhc2UiOiIjNURERTVERkYiLCJoaXRzd2l0Y2giOnRydWUsImxvZ2xpc3QiOlsxLjAsMi4wLCJ+Il0sIm1pc3Nzd2l0Y2giOnRydWUsInB1cmNoYXNlIjp0cnVlfSwifmFzcGVjdHJhdGlvIjp7ImFtb3VudCI6MTIxLjB9LCJ+ZG9ybWFudF9haW1ib3QiOnsiYXV0b19zY29wZSI6ZmFsc2UsImRhbWFnZSI6OC4wLCJoaXRib3hlcyI6WyJIZWFkIiwiQ2hlc3QiLCJTdG9tYWNoIiwiTGVncyIsIn4iXSwiaGl0Y2hhbmNlIjo2OC4wfSwifmhpdG1hcmtlciI6eyJjb2xvciI6IiM1M0E4OEJGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJyZW1vdmVfbGluZSI6WyJ+Il0sInNjb3BlX2NvbG9yIjoiIzdCN0I3QkZGIiwic2NvcGVfZ2FwIjo3LjAsInNjb3BlX3NpemUiOjEzMC4wLCJzY29wZV9zdHlsZSI6InJldmVyc2VkIn0sIn52aWV3bW9kZWwiOnsiZm92Ijo2MDAuMCwieCI6MTAuMCwieSI6NDAuMCwieiI6LTEwLjB9fSxbeyJib2R5X3lhdyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwiZW5hYmxlIjpmYWxzZSwib3NhYSI6ZmFsc2UsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRpc2FibGVkIiwicGl0Y2hfdmFsdWUiOjAuMCwieWF3IjoiZGlzYWJsZWQiLCJ5YXdfYmFzZSI6MS4wLCJ5YXdfZGVsYXlfZW5hYmxlIjoxLjAsInlhd19sZWZ0X3ZhbHVlIjozLjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yYW5kb21pemF0aW9uIjowLjAsInlhd19yaWdodF92YWx1ZSI6OC4wLCJ5YXdfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3ZhbHVlIjo2MC4wLCJib2R5X3lhd192YWx1ZTIiOjYwLjB9fSx7ImJvZHlfeWF3IjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJlbmFibGUiOmZhbHNlLCJvc2FhIjpmYWxzZSwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF92YWx1ZSI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19iYXNlIjoyLjAsInlhd19kZWxheV9lbmFibGUiOjUuMCwieWF3X2xlZnRfdmFsdWUiOi0zNC4wLCJ5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl92YWx1ZSI6MC4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MC4wLCJ5YXdfcmlnaHRfdmFsdWUiOjQxLjAsInlhd192YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfdmFsdWUiOjYwLjAsImJvZHlfeWF3X3ZhbHVlMiI6NjAuMH19LHsiYm9keV95YXciOlsiSml0dGVyIiwifiJdLCJib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImVuYWJsZSI6ZmFsc2UsIm9zYWEiOmZhbHNlLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX3ZhbHVlIjowLjAsInlhdyI6ImRpc2FibGVkIiwieWF3X2Jhc2UiOjIuMCwieWF3X2RlbGF5X2VuYWJsZSI6My4wLCJ5YXdfbGVmdF92YWx1ZSI6LTI0LjAsInlhd19tb2RpZmllciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX3ZhbHVlIjowLjAsInlhd19yYW5kb21pemF0aW9uIjowLjAsInlhd19yaWdodF92YWx1ZSI6NDIuMCwieWF3X3ZhbHVlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd192YWx1ZSI6NjAuMCwiYm9keV95YXdfdmFsdWUyIjo2MC4wfX0seyJib2R5X3lhdyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjAuMCwiZW5hYmxlIjpmYWxzZSwib3NhYSI6ZmFsc2UsIm92ZXJyaWRlIjp0cnVlLCJwaXRjaCI6ImRpc2FibGVkIiwicGl0Y2hfdmFsdWUiOjAuMCwieWF3IjoiZGlzYWJsZWQiLCJ5YXdfYmFzZSI6Mi4wLCJ5YXdfZGVsYXlfZW5hYmxlIjoxLjAsInlhd19sZWZ0X3ZhbHVlIjo1LjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl92YWx1ZSI6NzIuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X3JpZ2h0X3ZhbHVlIjowLjAsInlhd192YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfdmFsdWUiOjYwLjAsImJvZHlfeWF3X3ZhbHVlMiI6NjAuMH19LHsiYm9keV95YXciOlsiSml0dGVyIiwifiJdLCJib2R5X3lhd19yYW5kb21pemF0aW9uIjowLjAsImVuYWJsZSI6ZmFsc2UsIm9zYWEiOmZhbHNlLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX3ZhbHVlIjowLjAsInlhdyI6ImRpc2FibGVkIiwieWF3X2Jhc2UiOjIuMCwieWF3X2RlbGF5X2VuYWJsZSI6NC4wLCJ5YXdfbGVmdF92YWx1ZSI6LTIzLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl92YWx1ZSI6LTUuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X3JpZ2h0X3ZhbHVlIjo0MS4wLCJ5YXdfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3ZhbHVlIjo2MC4wLCJib2R5X3lhd192YWx1ZTIiOjYwLjB9fSx7ImJvZHlfeWF3IjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9taXphdGlvbiI6NC4wLCJlbmFibGUiOmZhbHNlLCJvc2FhIjpmYWxzZSwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF92YWx1ZSI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19iYXNlIjoyLjAsInlhd19kZWxheV9lbmFibGUiOjQuMCwieWF3X2xlZnRfdmFsdWUiOi0xOC4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfdmFsdWUiOjEuMCwieWF3X3JhbmRvbWl6YXRpb24iOjQuMCwieWF3X3JpZ2h0X3ZhbHVlIjozMy4wLCJ5YXdfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3ZhbHVlIjo2MC4wLCJib2R5X3lhd192YWx1ZTIiOjYwLjB9fSx7ImJvZHlfeWF3IjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJlbmFibGUiOmZhbHNlLCJvc2FhIjpmYWxzZSwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF92YWx1ZSI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19iYXNlIjoyLjAsInlhd19kZWxheV9lbmFibGUiOjQuMCwieWF3X2xlZnRfdmFsdWUiOi0xMy4wLCJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdfbW9kaWZpZXJfdmFsdWUiOi03LjAsInlhd19yYW5kb21pemF0aW9uIjowLjAsInlhd19yaWdodF92YWx1ZSI6MjguMCwieWF3X3ZhbHVlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd192YWx1ZSI6NjAuMCwiYm9keV95YXdfdmFsdWUyIjo2MC4wfX0seyJib2R5X3lhdyI6WyJKaXR0ZXIiLCJ+Il0sImJvZHlfeWF3X3JhbmRvbWl6YXRpb24iOjEyLjAsImVuYWJsZSI6ZmFsc2UsIm9zYWEiOmZhbHNlLCJvdmVycmlkZSI6dHJ1ZSwicGl0Y2giOiJkaXNhYmxlZCIsInBpdGNoX3ZhbHVlIjowLjAsInlhdyI6ImRpc2FibGVkIiwieWF3X2Jhc2UiOjIuMCwieWF3X2RlbGF5X2VuYWJsZSI6NC4wLCJ5YXdfbGVmdF92YWx1ZSI6LTIzLjAsInlhd19tb2RpZmllciI6IkNlbnRlciIsInlhd19tb2RpZmllcl92YWx1ZSI6Ny4wLCJ5YXdfcmFuZG9taXphdGlvbiI6MTIuMCwieWF3X3JpZ2h0X3ZhbHVlIjozNy4wLCJ5YXdfdmFsdWUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X3ZhbHVlIjo2MC4wLCJib2R5X3lhd192YWx1ZTIiOjYwLjB9fSx7ImJvZHlfeWF3IjpbIkppdHRlciIsIn4iXSwiYm9keV95YXdfcmFuZG9taXphdGlvbiI6MC4wLCJlbmFibGUiOmZhbHNlLCJvc2FhIjpmYWxzZSwib3ZlcnJpZGUiOnRydWUsInBpdGNoIjoiZGlzYWJsZWQiLCJwaXRjaF92YWx1ZSI6MC4wLCJ5YXciOiJkaXNhYmxlZCIsInlhd19iYXNlIjoyLjAsInlhd19kZWxheV9lbmFibGUiOjEuMCwieWF3X2xlZnRfdmFsdWUiOjAuMCwieWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfdmFsdWUiOjAuMCwieWF3X3JhbmRvbWl6YXRpb24iOjAuMCwieWF3X3JpZ2h0X3ZhbHVlIjowLjAsInlhd192YWx1ZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfdmFsdWUiOjQzLjAsImJvZHlfeWF3X3ZhbHVlMiI6NDMuMH19XV0=";
v83._inuilist = {
    main = {
        localinfo = l_pui_0.create("\v\f<circle-user>", "\v\226\128\162\r  self info", 1), 
        selector_tab = l_pui_0.create("\v\f<circle-user>", "\n\n", 2), 
        socials = l_pui_0.create("\v\f<circle-user>", "\v\226\128\162\r  links", 2), 
        sidebar = l_pui_0.create("\v\f<circle-user>", "\v\226\128\162\r  sidebar settings", 2), 
        config_list = l_pui_0.create("\v\f<circle-user>", "\n\n\n\n\n\n", 1), 
        config_buttons = l_pui_0.create("\v\f<circle-user>", "\v\226\128\162\r  Config System", 1), 
        config_buttons_up = l_pui_0.create("\v\f<circle-user>", "\n\n\n\n\n\n\n\n", 1)
    }, 
    antiaim = {
        selector_right = l_pui_0.create("\v\f<user-shield>", "\n\n\n\n", 2), 
        switch = l_pui_0.create("\v\f<user-shield>", "", 2), 
        selector_left = l_pui_0.create("\v\f<user-shield>", "\n\n", 1), 
        selector_left_down = l_pui_0.create("\v\f<user-shield>", "\n\n\n\n\n\n", 1), 
        builder = {
            state = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  state", 1), 
            defensive_help = l_pui_0.create("\v\f<user-shield>", "\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
            under_state = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  anti bruteforce", 1), 
            yaw = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  Yaw", 2), 
            yaw_modifier = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  Yaw Modifier", 2), 
            body_yaw = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  Desync", 2)
        }, 
        extra = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  Extra", 1), 
        hotkeys = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  hotkeys", 2), 
        defensive_aa = l_pui_0.create("\v\f<user-shield>", "\v\226\128\162\r  defensive", 2), 
        defensive_aa_osaa = l_pui_0.create("\v\f<user-shield>", "\n\n\n\n\n\n\n\n", 2)
    }, 
    other = {
        selector_left = l_pui_0.create("\v\f<user-gear>", "\n\n", 1), 
        selector_right = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n", 2), 
        left_up2 = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
        left_up = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n", 1), 
        right_up = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
        left_down = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
        right_down = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
        left_down2 = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
        right_down2 = l_pui_0.create("\v\f<user-gear>", "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2)
    }
};
v83.main = {
    selector = v83._inuilist.main.selector_tab:list("", "\v\f<house>\r    Home Page"), 
    user_name = v83._inuilist.main.localinfo:label("\v\f<user>\r    User"), 
    user_name_button = v83._inuilist.main.localinfo:button(" " .. v31._lua.username .. " ", nil, true, "Your username in neverlose"), 
    lua_version = v83._inuilist.main.localinfo:label("\v\f<circle-nodes>\r    Version"), 
    lua_version_button = v83._inuilist.main.localinfo:button(" " .. v31._lua.version .. " ", nil, true, "Version of lua"), 
    Themes = v83._inuilist.main.socials:label("Themes"), 
    Themes_button_dark = v83._inuilist.main.socials:button("\aBCEAE9FF\f<moon>\r  Laura", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=vU4AZzui901W0pHw-VXvQvwD4hU");
    end, true), 
    sidebarlabel = v83._inuilist.main.sidebar:label("                  \v\f<chart-bar>\r  Sidebar Customizate"), 
    sidebarcombo = v83._inuilist.main.sidebar:combo("", "Default", "Default + Build", "Laura Modern"), 
    configs = v83._inuilist.main.socials:label("Configs"), 
    configs_button = v83._inuilist.main.socials:button("\aCCBAEAFF\f<square-list>\r  Santy's", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=yKas85");
    end, true, "Best setts for all weapons! \n\n\aFF3C3CFF( recomended )"), 
    Other = v83._inuilist.main.socials:label("Other"), 
    Other_button = v83._inuilist.main.socials:button("\a797FA3FF\f<discord>\r", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/pe7SZNJGCa");
    end, true, "\aDEFAULTThis discord server will help you access other users' settings and user role. Open a ticket and be with us! \n\n\aFF3C3CFF( recomended join )"), 
    youtube_button = v83._inuilist.main.socials:button("\aFF3C3CFF\f<youtube>\r", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@santymeaw2");
    end, true, "YouTube channel of lua creator, recomended subscribe! \n\n\aFF3C3CFF( Videos with lua )"), 
    list = v83._inuilist.main.config_buttons:list("", configs_database.ui_list), 
    input = v83._inuilist.main.config_buttons_up:input("\v\f<pen-to-square>\r  Name"), 
    load = v83._inuilist.main.config_buttons:button("            \f<arrow-down>            ", nil, false, "load configuration"), 
    export = v83._inuilist.main.config_buttons:button("     \f<arrow-up-from-bracket>     ", nil, true, "export configuration"), 
    save = v83._inuilist.main.config_buttons:button("     \f<floppy-disk>     ", nil, true, "save configuration"), 
    delete = v83._inuilist.main.config_buttons:button("     \f<trash>     ", nil, true, "delete configuration"), 
    create = v83._inuilist.main.config_buttons_up:button("               \f<plus-large>  New                 ", nil, true, "create configuration"), 
    import = v83._inuilist.main.config_buttons_up:button("     \f<arrow-down-to-bracket>  Import        ", nil, true, "import configuration")
};
v83.antiaim = {
    masterswitch = v83._inuilist.antiaim.switch:switch(" \v\f<star-christmas>\aDEFAULT   Anti-aim"), 
    selector = v83._inuilist.antiaim.selector_left:list("", "\v\f<gear>\r   Settings", "\v\f<sliders-simple>\r   Builder"), 
    selector2 = v83._inuilist.antiaim.selector_right:list("", "\v\f<shield>\r    Anti-Aim Page"), 
    selector3 = v83._inuilist.antiaim.selector_left_down:list("", "\v\f<shield>\r   Anti Aim", "\v\f<square-dashed>\r    Defensive"), 
    extra = {
        avoidbackstab = v83._inuilist.antiaim.extra:switch("\v\f<knife-kitchen>\aDEFAULT  Avoid Backstab"), 
        safehead = v83._inuilist.antiaim.extra:combo("\v\f<helmet-safety>\aDEFAULT  Safe Head", "Disabled", "Air+Crouch Knife & Zeus"), 
        forcedef = v83._inuilist.antiaim.extra:switch("\v\f<shield>\aDEFAULT   Force Defensive", false, function(v84)
            -- upvalues: v83 (ref)
            return {
                conditions = v84:listable("", v83.refs.main.force_defensive)
            };
        end), 
        warmupaa = v83._inuilist.antiaim.extra:switch("\v\f<signal-stream-slash>\aDEFAULT  Warmup AA")
    }, 
    hotkeys = {
        freestand = v83._inuilist.antiaim.hotkeys:switch("\v\f<arrows-retweet>\aDEFAULT    Auto Regulation", false, function(v85)
            return {
                mod = v85:listable("\n", {
                    [1] = "disable yaw mod", 
                    [2] = "body freestand"
                })
            };
        end), 
        manuals = v83._inuilist.antiaim.hotkeys:combo("\v\f<arrows-left-right-to-line>\aDEFAULT    Manuals", "Disabled", "Left", "Right", "Forward"), 
        flick_exploit = v83._inuilist.antiaim.hotkeys:switch("\v\f<shuffle>\r     Flick Exploit", false, function(v86)
            return {
                pitch = v86:slider("Pitch", -89, 89, 45, "\194\176"), 
                inverted = v86:combo("Inverted", "Default", "Switched", "Random")
            };
        end), 
        lag_exploit = v83._inuilist.antiaim.hotkeys:switch(" \v\f<person-circle-exclamation>\r    Lag Exploit", false, function(v87)
            return {
                ticks = v87:slider("Ticks", 1, 32, 16, 1, "t")
            };
        end)
    }, 
    angels = {
        selector = v83._inuilist.antiaim.builder.state:combo("\v\f<list-dropdown>\aDEFAULT   State", v83.refs.main.conditions)
    }, 
    defensive_help = v83._inuilist.antiaim.builder.defensive_help:label("\v\f<triangle-exclamation>\r  \n\nNeed enable \vForce Defensive\r in Settings tab."), 
    antibruteforce = v83._inuilist.antiaim.builder.under_state:switch("\v\f<file-shield>\r   Custom Anti Bruteforce")
};
v83.other = {
    selector = v83._inuilist.other.selector_left:list("", "\v\f<camera>\r    Visuals", "\v\f<tire-pressure-warning>\r    Other"), 
    selector1 = v83._inuilist.other.selector_right:list("", "\v\f<wand-magic-sparkles>\r    Tools Page"), 
    fakelatency = v83._inuilist.other.left_up:slider("\v\f<wifi>\r   \aDEFAULTPing Unlocker", 0, 200, 0, 1, "ms"), 
    accent_color = v83._inuilist.other.left_up2:color_picker("\v\f<paint-roller>\r   Accent Color", l_pui_0.colors.accent), 
    watermarkstyle_label = v83._inuilist.other.left_down2:label("\v\f<display>\r   Watermark", false, function(v88)
        return {
            watermarkstyle = v88:combo("\v\f<pen-swirl>\r   Style", "Classic", "Laura", "Laura Mini", "Laura Skinny", "Laura Modern", "Laura Icon"), 
            color = v88:color_picker("\v\f<palette>\r   Color", color(188, 234, 233, 255))
        };
    end), 
    dormant_aimbot = v83._inuilist.other.left_up:switch("\v\f<eye-slash>\r  \aDEFAULTDormant Aimbot", false, function(v89)
        return {
            hitboxes = v89:selectable("hitboxes", {
                [1] = "Head", 
                [2] = "Chest", 
                [3] = "Stomach", 
                [4] = "Legs"
            }), 
            hitchance = v89:slider("hitchance", 50, 85, 60, nil, "%"), 
            damage = v89:slider("damage", -1, 130, -1, nil, function(v90)
                if v90 == -1 then
                    return "AI";
                elseif v90 > 100 then
                    return "+" .. v90 - 100;
                else
                    return nil;
                end;
            end), 
            auto_scope = v89:switch("auto scope")
        };
    end), 
    aimbot_logs = v83._inuilist.other.left_up:switch("\v\f<reel>\r    \aDEFAULTInformation Logs", false, function(v91)
        return {
            loglist = v91:listable("\n", "Console", "Screen", "Render"), 
            hitswitch = v91:switch("\v\f<person-circle-exclamation>\r  Hit", false, {
                color(188, 234, 233, 255)
            }), 
            missswitch = v91:switch("\v\f<person-circle-question>\r  Miss", false, {
                color(255, 68, 68)
            }), 
            purchase = v91:switch("\v\f<cart-shopping-fast>\r  Purchase", false, {
                color(93, 222, 93, 255)
            })
        };
    end), 
    decreaseholdaimticks = v83._inuilist.other.left_up:switch("\v\f<person-burst>\r  Decrease Hold Aim Ticks"), 
    edge_stop = v83._inuilist.other.left_up:switch("\v\f<arrow-down-up-lock>\r  Edge Stop"), 
    random_fakelag = v83._inuilist.other.left_up:switch("\v\f<rectangles-mixed>\r   Broke Fakelag"), 
    predictiv = v83._inuilist.other.left_up:switch("\v\f<dice-d8>\r    Fast Shot"), 
    jump_scout = v83._inuilist.other.left_up:switch("\v\f<person-ski-jumping>\r    Jump Scout"), 
    aimbot_helper = v83._inuilist.other.left_up:combo("\v\f<microchip-ai>\r    Aimbot Helper", "Disabled", "Default", "Random"), 
    aspectratio = v83._inuilist.other.left_down:switch("\v\f<camera-viewfinder>\r   \aDEFAULTAspect Ratio", false, function(v92)
        return {
            amount = v92:slider("Amount", 0, 200, 0, 0.01)
        };
    end), 
    scope_overlay = v83._inuilist.other.right_up:switch("\v\f<telescope>\r  \aDEFAULTScope Overlay", false, function(v93)
        return {
            scope_style = v93:combo("select style", {
                [1] = "default", 
                [2] = "reversed"
            }), 
            remove_line = v93:selectable("exclude line", {
                [1] = "left", 
                [2] = "right", 
                [3] = "up", 
                [4] = "down"
            }), 
            scope_gap = v93:slider("scope gap", 0, 500, 7), 
            scope_size = v93:slider("scope size", 0, 1000, 105), 
            scope_color = v93:color_picker("scope color", color(255, 255, 255))
        };
    end), 
    fov_animations = v83._inuilist.other.right_up:switch("\v\f<gif>\r   Smooth Zoom animations"), 
    viewmodel = v83._inuilist.other.left_down:switch("\v\f<mountain-sun>\r  \aDEFAULTViewmodel Changer", false, function(v94)
        return {
            fov = v94:slider("FOV", 0, 1000, 600, 0.1), 
            x = v94:slider("x", -100, 100, 10, 0.1), 
            y = v94:slider("y", -100, 100, 10, 0.1), 
            z = v94:slider("z", -100, 100, -10, 0.1)
        };
    end), 
    clantag = v83._inuilist.other.left_down:combo("\v\f<table-tree>\r    Clantag", "Disabled", "Laura", "HVHWARRIOR"), 
    hitmarker = v83._inuilist.other.left_up:switch("\v\f<highlighter>\r   \aDEFAULTKibit Marker", false, function(v95)
        return {
            color = v95:color_picker("color", color(83, 168, 139, 255))
        };
    end), 
    damage_indicator = v83._inuilist.other.right_down:switch("\v\f<rectangle-ad>\r   Damage Indicator", false, function(v96)
        return {
            font = v96:combo("Font", "Default", "Bold", "Small")
        };
    end), 
    hitchance_indicator = v83._inuilist.other.right_down:switch("\v\f<crosshairs-simple>\r    Hitchance Indicator", false, function(v97)
        return {
            font = v97:combo("Font", "Default", "Bold", "Small")
        };
    end), 
    SideIndicators = v83._inuilist.other.right_down:switch("\v\f<memo-pad>\r     Side Indicators", false, function(v98)
        return {
            style = v98:combo("", "Gradient", "Laura"), 
            text_style = v98:combo("", "With Icons", "Without Icons"), 
            target_select = v98:switch("\v\f<user-check>\r   Target Indicator", false, {
                color(150, 189, 18, 255)
            })
        };
    end), 
    net_graph = v83._inuilist.other.right_down2:switch("\v\f<square-poll-vertical>\r   Net Graphic", false, function(v99)
        return {
            select = v99:listable("", "Framerate", "Connection", "Server Response"), 
            font = v99:combo("Font", "Default", "Console", "Bold", "Small"), 
            color = v99:color_picker("Color", color(212, 180, 134, 255))
        };
    end), 
    trashtalk = v83._inuilist.other.left_down:switch("\v\f<trash>\r     \aDEFAULTTrashtalk"), 
    cvaroptimization = v83._inuilist.other.left_down:switch("\v\f<chart-line-up>\r     \aDEFAULTOptimize CVars"), 
    keep_model_transparency = v83._inuilist.other.right_up:switch("\v\f<face-dotted>\r    Keep Model Transparency", false), 
    nofalldamage = v83._inuilist.other.right_down:switch(" \v\f<person-falling>\r    \aDEFAULTNo Fall Damage"), 
    fastladder = v83._inuilist.other.right_down:switch("\v\f<water-ladder>\r    \aDEFAULTFast Ladder"), 
    nade_throw_fix = v83._inuilist.other.right_down:switch("\v\f<bomb>\r    Nade Throw Fix", false), 
    super_toss = v83._inuilist.other.right_down:switch("\v\f<bullseye-arrow>\r    Super Toss", false), 
    aipeekbot = v83._inuilist.other.right_down2:label("\v\f<user-robot>\aDEFAULT    Ai Peek Bot", function(v100)
        return {
            bindbutton = v100:switch("Enable \v[bind]\r", false, "\a[yellow]\f<triangle-exclamation>\aDEFAULT  This function need good pc, please not use if you have bad pc, its maybe down your fps to so lower values"), 
            dot_offset = v100:slider("Distance", 0, 20, 8), 
            dot_span = v100:slider("Accuracy", 0, 35, 5), 
            dot_amount = v100:slider("Points amount", 0, 10, 3)
        };
    end)
};
v83.antiaim.antibruteforce:disabled(true);
v83.antiaim.selector:depend(v83.antiaim.masterswitch);
v83.antiaim.selector:set(1);
local _ = nil;
local function v102()
    -- upvalues: v83 (ref)
    selector_settings = {
        [1] = nil, 
        [2] = 1, 
        [1] = v83.antiaim.selector
    };
    selector_builder = {
        [1] = nil, 
        [2] = 2, 
        [1] = v83.antiaim.selector
    };
    v83.antiaim.masterswitch:depend(selector_settings);
    v83.antiaim.extra.safehead:depend(selector_settings);
    v83.antiaim.extra.avoidbackstab:depend(selector_settings);
    v83.antiaim.extra.forcedef:depend(selector_settings);
    v83.antiaim.extra.warmupaa:depend(selector_settings);
    v83.antiaim.hotkeys.freestand:depend(selector_settings);
    v83.antiaim.hotkeys.manuals:depend(selector_settings);
    v83.antiaim.antibruteforce:depend(selector_settings);
    v83.antiaim.hotkeys.lag_exploit:depend(selector_settings);
    v83.antiaim.hotkeys.flick_exploit:depend(selector_settings);
    v83.antiaim.angels.selector:depend(selector_builder);
    v83.antiaim.selector3:depend(selector_builder);
    v83.antiaim.defensive_help:depend(selector_builder);
end;
v102();
do
    local l_v102_0 = v102;
    v83.antiaim.selector:set_callback(function(_, _)
        -- upvalues: l_v102_0 (ref)
        l_v102_0();
    end);
end;
v83.other.selector:set(2);
v102 = nil;
local function v106()
    -- upvalues: v83 (ref)
    selector_visuals = {
        [1] = nil, 
        [2] = 1, 
        [1] = v83.other.selector
    };
    selector_other = {
        [1] = nil, 
        [2] = 2, 
        [1] = v83.other.selector
    };
    v83.other.damage_indicator:depend(selector_visuals);
    v83.other.hitchance_indicator:depend(selector_visuals);
    v83.other.SideIndicators:depend(selector_visuals);
    v83.other.keep_model_transparency:depend(selector_visuals);
    v83.other.hitmarker:depend(selector_visuals);
    v83.other.scope_overlay:depend(selector_visuals);
    v83.other.viewmodel:depend(selector_visuals);
    v83.other.aspectratio:depend(selector_visuals);
    v83.other.fov_animations:depend(selector_visuals);
    v83.other.net_graph:depend(selector_visuals);
    v83.other.accent_color:depend(selector_visuals);
    v83.other.watermarkstyle_label:depend(selector_visuals);
    v83.other.super_toss:depend(selector_other);
    v83.other.aimbot_logs:depend(selector_other);
    v83.other.dormant_aimbot:depend(selector_other);
    v83.other.fakelatency:depend(selector_other);
    v83.other.trashtalk:depend(selector_other);
    v83.other.nofalldamage:depend(selector_other);
    v83.other.fastladder:depend(selector_other);
    v83.other.nade_throw_fix:depend(selector_other);
    v83.other.clantag:depend(selector_other);
    v83.other.decreaseholdaimticks:depend(selector_other);
    v83.other.edge_stop:depend(selector_other);
    v83.other.aimbot_helper:depend(selector_other);
    v83.other.aipeekbot:depend(selector_other);
    v83.other.cvaroptimization:depend(selector_other);
    v83.other.random_fakelag:depend(selector_other);
    v83.other.predictiv:depend(selector_other);
    v83.other.jump_scout:depend(selector_other);
end;
v106();
do
    local l_v106_0 = v106;
    v83.other.selector:set_callback(function(_, _)
        -- upvalues: l_v106_0 (ref)
        l_v106_0();
    end);
end;
v106 = nil;
local function v110()
    -- upvalues: v83 (ref)
    selector_antiaim = {
        [1] = nil, 
        [2] = 1, 
        [1] = v83.antiaim.selector3
    };
    selector_defensive = {
        [1] = nil, 
        [2] = 2, 
        [1] = v83.antiaim.selector3
    };
    v83.antiaim.defensive_help:depend(selector_defensive);
end;
v110();
do
    local l_v110_0 = v110;
    v83.antiaim.selector3:set_callback(function(_, _)
        -- upvalues: l_v110_0 (ref)
        l_v110_0();
    end);
end;
v110 = nil;
builder_aa = {};
v83.antiaim.extra.avoidbackstab:depend(v83.antiaim.masterswitch);
if v31._lua.build == "Live" then
    v83.antiaim.extra.safehead:depend(v83.antiaim.masterswitch);
    v83.antiaim.extra.safehead:disabled(true);
else
    v83.antiaim.extra.safehead:depend(v83.antiaim.masterswitch);
    v83.antiaim.extra.safehead:disabled(false);
end;
v83.antiaim.extra.forcedef:depend(v83.antiaim.masterswitch);
v83.antiaim.angels.selector:depend(v83.antiaim.masterswitch);
v83.antiaim.hotkeys.freestand:depend(v83.antiaim.masterswitch);
v83.antiaim.hotkeys.manuals:depend(v83.antiaim.masterswitch);
v83.antiaim.antibruteforce:depend(v83.antiaim.masterswitch);
v83.antiaim.extra.warmupaa:depend(v83.antiaim.masterswitch);
v83.antiaim.hotkeys.lag_exploit:depend(v83.antiaim.masterswitch);
v83.antiaim.hotkeys.flick_exploit:depend(v83.antiaim.masterswitch);
for v114, _ in ipairs(v83.refs.main.conditions) do
    builder_aa[v114] = {};
    builder_aa[v114].override = v83._inuilist.antiaim.builder.state:switch("\v\f<user-check>\aDEFAULT  Override"):depend(v83.antiaim.masterswitch, selector_antiaim, {
        [1] = v83.antiaim.angels.selector, 
        [2] = v83.refs.main.conditions[v114]
    }, {
        [1] = v83.antiaim.angels.selector, 
        [2] = function()
            -- upvalues: v83 (ref)
            return v83.refs.main.conditions ~= "shared";
        end
    }, selector_builder, selector_antiaim);
    do
        local l_v114_0 = v114;
        builder_aa[l_v114_0].yaw_base = v83._inuilist.antiaim.builder.yaw:list("", "Local View", "At Target"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_left_value = v83._inuilist.antiaim.builder.yaw:slider("\v\f<left-long>\r   Add Left", -90, 90, 0, 1, "\194\176"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_right_value = v83._inuilist.antiaim.builder.yaw:slider("\v\f<right-long>\r   Add Right", -90, 90, 0, 1, "\194\176"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_modifier = v83._inuilist.antiaim.builder.yaw_modifier:combo("\v\f<arrows-spin>\r   Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_modifier_value = v83._inuilist.antiaim.builder.yaw_modifier:slider("\v\f<arrow-up-wide-short>\r  Degree", -90, 90, 0, 1, "\194\176"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, {
            [1] = nil, 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way", 
            [1] = builder_aa[l_v114_0].yaw_modifier
        }, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_randomization = v83._inuilist.antiaim.builder.yaw_modifier:slider("\v\f<arrow-trend-down>\r  Randomize", 0, 100, 0, 1, "%"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, {
            [1] = nil, 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way", 
            [1] = builder_aa[l_v114_0].yaw_modifier
        }, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].body_yaw = v83._inuilist.antiaim.builder.body_yaw:selectable("\v\f<spinner>\r   Desync", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }, false, function(v117)
            -- upvalues: l_v114_0 (ref), v83 (ref)
            return {
                body_yaw_value2 = v117:slider("\v\f<arrow-up-wide-short>\r  Max. Value", 0, 60, 60, 1, "\194\176"):depend(builder_aa[l_v114_0].override, {
                    [1] = v83.antiaim.masterswitch, 
                    [2] = function()
                        -- upvalues: l_v114_0 (ref)
                        if l_v114_0 == 1 then
                            return true;
                        else
                            return builder_aa[l_v114_0].override:get();
                        end;
                    end
                }, {
                    [1] = v83.antiaim.angels.selector, 
                    [2] = v83.refs.main.conditions[l_v114_0]
                }, v83.antiaim.masterswitch, selector_antiaim, selector_builder), 
                body_yaw_value = v117:slider("\v\f<arrow-down-short-wide>\r  Min. Value", 0, 60, 60, 1, "\194\176"):depend(builder_aa[l_v114_0].override, {
                    [1] = v83.antiaim.masterswitch, 
                    [2] = function()
                        -- upvalues: l_v114_0 (ref)
                        if l_v114_0 == 1 then
                            return true;
                        else
                            return builder_aa[l_v114_0].override:get();
                        end;
                    end
                }, {
                    [1] = v83.antiaim.angels.selector, 
                    [2] = v83.refs.main.conditions[l_v114_0]
                }, v83.antiaim.masterswitch, selector_antiaim, selector_builder)
            };
        end):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].yaw_delay_enable = v83._inuilist.antiaim.builder.body_yaw:slider("\v\f<brackets-curly>\r  Delay Ticks", 1, 10, 0, 1, "t"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].body_yaw_randomization = v83._inuilist.antiaim.builder.body_yaw:slider("\v\f<arrow-trend-up>\r  Random", 0, 100, 0, 1, "%"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_antiaim, selector_builder);
        builder_aa[l_v114_0].enable = v83._inuilist.antiaim.builder.state:switch("\v\f<toggle-on>\r  Enable Hidden"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, v83.antiaim.masterswitch, selector_builder, selector_defensive);
        builder_aa[l_v114_0].osaa = v83._inuilist.antiaim.defensive_aa_osaa:switch("\v\f<user-shield>\r  With Hide Shots"):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, builder_aa[l_v114_0].enable, v83.antiaim.masterswitch, selector_builder, selector_defensive);
        builder_aa[l_v114_0].pitch = v83._inuilist.antiaim.defensive_aa:combo("\v\f<wand-magic-sparkles>\r   Pitch", {
            [1] = "disabled", 
            [2] = "custom", 
            [3] = "up", 
            [4] = "down", 
            [5] = "zero", 
            [6] = "random", 
            [7] = "progressive"
        }):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, builder_aa[l_v114_0].enable, v83.antiaim.masterswitch, selector_builder, selector_defensive);
        builder_aa[l_v114_0].pitch_value = v83._inuilist.antiaim.defensive_aa:slider("\v\f<chart-simple>\r     Value", -89, 89, 0):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, builder_aa[l_v114_0].enable, {
            [1] = nil, 
            [2] = "custom", 
            [3] = "random", 
            [4] = "progressive", 
            [1] = builder_aa[l_v114_0].pitch
        }, v83.antiaim.masterswitch, selector_builder, selector_defensive);
        builder_aa[l_v114_0].yaw = v83._inuilist.antiaim.defensive_aa:combo("\v\f<up-down-left-right>\r    Yaw", {
            [1] = "disabled", 
            [2] = "custom", 
            [3] = "jitter", 
            [4] = "opposite", 
            [5] = "spin", 
            [6] = "random"
        }):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, builder_aa[l_v114_0].enable, v83.antiaim.masterswitch, selector_builder, selector_defensive);
        builder_aa[l_v114_0].yaw_value = v83._inuilist.antiaim.defensive_aa:slider("\v\f<chart-simple>\r     Value", -180, 180, 0):depend(builder_aa[l_v114_0].override, {
            [1] = v83.antiaim.masterswitch, 
            [2] = function()
                -- upvalues: l_v114_0 (ref)
                if l_v114_0 == 1 then
                    return true;
                else
                    return builder_aa[l_v114_0].override:get();
                end;
            end
        }, {
            [1] = v83.antiaim.angels.selector, 
            [2] = v83.refs.main.conditions[l_v114_0]
        }, builder_aa[l_v114_0].enable, {
            [1] = nil, 
            [2] = "custom", 
            [1] = builder_aa[l_v114_0].yaw
        }, v83.antiaim.masterswitch, selector_builder, selector_defensive);
    end;
end;
local function v126()
    -- upvalues: v83 (ref), v11 (ref)
    local v118 = entity.get_local_player();
    if not v118 then
        return "not connected";
    else
        local v119 = bit.band(v118.m_fFlags, 1) == 1;
        local v120 = bit.band(v118.m_fFlags, 1) == 0;
        local v121 = v118.m_flDuckAmount > 0.7;
        local l_x_1 = v118.m_vecVelocity.x;
        local l_y_1 = v118.m_vecVelocity.y;
        local _ = v118.m_vecVelocity.z;
        local v125 = math.sqrt(l_x_1 ^ 2 + l_y_1 ^ 2) > 5;
        if v120 and v121 then
            return v83.refs.main.conditions[8];
        elseif v83.antiaim.hotkeys.freestand:get() then
            return v83.refs.main.conditions[9];
        elseif v11.antiaim.misc.fakeduck:get() then
            return v83.refs.main.conditions[10];
        elseif v121 and v125 then
            return v83.refs.main.conditions[6];
        elseif v120 then
            return v83.refs.main.conditions[7];
        elseif v121 then
            return v83.refs.main.conditions[5];
        elseif v119 and v11.antiaim.misc.slowwalk:get() and v125 then
            return v83.refs.main.conditions[4];
        elseif v119 and not v125 then
            return v83.refs.main.conditions[2];
        elseif v119 and v125 then
            return v83.refs.main.conditions[3];
        else
            return;
        end;
    end;
end;
do
    local l_v126_0 = v126;
    local function v128()
        -- upvalues: l_v126_0 (ref), v83 (ref)
        if builder_aa[2].override:get() and l_v126_0() == v83.refs.main.conditions[2] then
            return 2;
        elseif builder_aa[3].override:get() and l_v126_0() == v83.refs.main.conditions[3] then
            return 3;
        elseif builder_aa[4].override:get() and l_v126_0() == v83.refs.main.conditions[4] then
            return 4;
        elseif builder_aa[5].override:get() and l_v126_0() == v83.refs.main.conditions[5] then
            return 5;
        elseif builder_aa[6].override:get() and l_v126_0() == v83.refs.main.conditions[6] then
            return 6;
        elseif builder_aa[7].override:get() and l_v126_0() == v83.refs.main.conditions[7] then
            return 7;
        elseif builder_aa[8].override:get() and l_v126_0() == v83.refs.main.conditions[8] then
            return 8;
        elseif builder_aa[9].override:get() and l_v126_0() == v83.refs.main.conditions[9] then
            return 9;
        else
            return 1;
        end;
    end;
    local function v134(v129, v130, v131, v132, v133)
        if v129:get() then
            v130:override(true);
        else
            v130:override(false);
        end;
        if v131:get("disable yaw mod") then
            v132:override(true);
        else
            v132:override(false);
        end;
        if v131:get("body freestand") then
            v133:override(true);
        else
            v133:override(false);
        end;
    end;
    local function v137(_, v136)
        -- upvalues: v83 (ref)
        if v83.antiaim.hotkeys.manuals:get() == "Left" then
            v136:override(-90);
        end;
        if v83.antiaim.hotkeys.manuals:get() == "Right" then
            v136:override(90);
        end;
        if v83.antiaim.hotkeys.manuals:get() == "Forward" then
            v136:override(180);
        end;
    end;
    local _ = function(_, v139)
        -- upvalues: v83 (ref), v11 (ref)
        if not v83.antiaim.extra.safehead:get() == "Air+Crouch Knife & Zeus" then
            return;
        else
            if v139 == 8 and v83.main.extra.safehead:get() == "Air+Crouch Knife & Zeus" and entity.get_local_player():get_player_weapon(false):get_weapon_info().weapon_type == 0 then
                v11.antiaim.angels.yaw.hidden:set(false);
                v11.antiaim.angels.yaw.offset:override(0);
                v11.antiaim.angels.body_yaw.options:override({});
                v11.antiaim.angels.body_yaw.inverter:override(true);
            end;
            return;
        end;
    end;
    local function v145(v141, v142)
        local v143 = v141 - v141 * v142 / 100;
        local v144 = v141 + v141 * v142 / 100;
        return math.random(v143, v144);
    end;
    is_inverted = false;
    ticks = 0;
    switch = false;
    yaw_amount = 0;
    local function v153(v146, v147)
        -- upvalues: v83 (ref), v11 (ref), v145 (ref), v134 (ref), v137 (ref)
        if not v83.antiaim.masterswitch:get() then
            return;
        else
            if v146.choked_commands == 0 then
                v11.antiaim.angels.enable:override(true);
                v11.antiaim.angels.pitch:override("down");
                v11.antiaim.angels.yaw:override("backward");
                v11.antiaim.angels.yaw_modifier:override(builder_aa[v147].yaw_modifier:get());
                local v148 = builder_aa[v147].yaw_modifier_value:get();
                local v149 = builder_aa[v147].yaw_randomization:get() / 100;
                local l_v148_0 = v148;
                if v149 > 0 and builder_aa[v147].yaw_modifier:get() ~= "disabled" then
                    l_v148_0 = v148 + utils.random_int(-90 * v149, 90 * v149);
                    l_v148_0 = math.clamp(l_v148_0, -180, 180);
                end;
                v11.antiaim.angels.yaw_modifier_offset:set(l_v148_0);
                local v151 = v145(builder_aa[v147].yaw_modifier_value:get(), v149);
                if builder_aa[v147].yaw_modifier:get() == "Center" then
                    yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() + v151 / 2 or builder_aa[v147].yaw_left_value:get() - v151 / 2;
                elseif builder_aa[v147].yaw_modifier:get() == "Offset" then
                    yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() or builder_aa[v147].yaw_right_value:get() - v151 / 2;
                elseif builder_aa[v147].yaw_modifier:get() == "Random" then
                    yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() + v151 / 2 or builder_aa[v147].yaw_left_value:get() - v151 / 2;
                elseif builder_aa[v147].yaw_modifier:get() == "3-Way" then
                    local v152 = globals.tickcount % 3;
                    if v152 == 0 then
                        yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() + v151 / 2 or builder_aa[v147].yaw_left_value:get();
                    elseif v152 == 1 then
                        yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() or builder_aa[v147].yaw_right_value:get();
                    else
                        yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() or builder_aa[v147].yaw_right_value:get() - v151 / 2;
                    end;
                else
                    yaw_amount = rage.antiaim:inverter() and builder_aa[v147].yaw_left_value:get() or builder_aa[v147].yaw_right_value:get();
                end;
                v11.antiaim.angels.body_yaw:override(true);
                is_inverted = not rage.antiaim:inverter();
                if builder_aa[v147].yaw_delay_enable:get() and builder_aa[v147].yaw_delay_enable:get() > 1 then
                    ticks = ticks + 1.5;
                    if ticks > builder_aa[v147].yaw_delay_enable:get() then
                        ticks = 0;
                        switch = not switch;
                    end;
                    is_inverted = switch;
                end;
                if builder_aa[v147].yaw_delay_enable:get() then
                    if builder_aa[v147].yaw_delay_enable:get() > 1 then
                        v11.antiaim.angels.body_yaw.inverter:override(is_inverted);
                        v11.antiaim.angels.body_yaw.options:override("");
                    else
                        v11.antiaim.angels.body_yaw.inverter:override();
                        v11.antiaim.angels.body_yaw.options:override(builder_aa[v147].body_yaw:get());
                    end;
                else
                    v11.antiaim.angels.body_yaw.options:override(builder_aa[v147].body_yaw:get());
                end;
                v11.antiaim.angels.body_yaw.left_limit:override(builder_aa[v147].body_yaw_randomization:get() > 0 and utils.random_int(builder_aa[v147].body_yaw.body_yaw_value:get() - builder_aa[v147].body_yaw_randomization:get() / 100 * builder_aa[v147].body_yaw.body_yaw_value:get(), builder_aa[v147].body_yaw.body_yaw_value:get()) or builder_aa[v147].body_yaw.body_yaw_value:get());
                v11.antiaim.angels.body_yaw.right_limit:override(builder_aa[v147].body_yaw_randomization:get() > 0 and utils.random_int(builder_aa[v147].body_yaw.body_yaw_value2:get() - builder_aa[v147].body_yaw_randomization:get() / 100 * builder_aa[v147].body_yaw.body_yaw_value2:get(), builder_aa[v147].body_yaw.body_yaw_value2:get()) or builder_aa[v147].body_yaw.body_yaw_value2:get());
                v11.antiaim.angels.body_yaw.freestanding:override("Off");
                yaw_add = is_inverted and builder_aa[v147].yaw_left_value:get() or builder_aa[v147].yaw_right_value:get();
                if builder_aa[v147].yaw_delay_enable:get() > 1 then
                    if is_inverted then
                        yaw_add = yaw_add + l_v148_0 * 0.5;
                    else
                        yaw_add = yaw_add - l_v148_0 * 0.5;
                    end;
                    v11.antiaim.angels.yaw_modifier:override("Disabled");
                    v11.antiaim.angels.yaw_modifier_offset:override(builder_aa[v147].yaw_modifier_value:get());
                end;
                v11.antiaim.angels.yaw.offset:override(yaw_add);
            end;
            if v147 == 8 and v83.antiaim.hotkeys.lag_exploit:get() then
                if globals.tickcount % v83.antiaim.hotkeys.lag_exploit.ticks:get() == 0 then
                    rage.exploit:force_teleport();
                else
                    rage.exploit:force_charge();
                end;
            elseif v147 == 7 and v83.antiaim.hotkeys.lag_exploit:get() then
                if globals.tickcount % v83.antiaim.hotkeys.lag_exploit.ticks:get() == 0 then
                    rage.exploit:force_teleport();
                else
                    rage.exploit:force_charge();
                end;
            end;
            v134(v83.antiaim.hotkeys.freestand, v11.antiaim.angels.freestanding, v83.antiaim.hotkeys.freestand.mod, v11.antiaim.angels.freestanding.disable_yaw_modifiers, v11.antiaim.angels.freestanding.body_freestanding);
            v137(v83.antiaim.hotkeys.manuals.mod, v11.antiaim.angels.yaw.offset);
            v11.antiaim.angels.yaw.avoid_backstab:override(v83.antiaim.extra.avoidbackstab:get());
            return;
        end;
    end;
    local function v155(v154)
        -- upvalues: v83 (ref), v11 (ref)
        if v83.antiaim.extra.forcedef:get(v154 - 1) then
            v11.ragebot.double_tap.options:override("Always On");
        else
            v11.ragebot.double_tap.options:override("On Peek");
        end;
    end;
    local function v158(_, v157)
        -- upvalues: v11 (ref)
        if builder_aa[v157].enable:get() then
            v11.antiaim.angels.yaw.hidden:override(true);
        else
            v11.antiaim.angels.yaw.hidden:override(false);
        end;
        if builder_aa[v157].osaa:get() then
            v11.ragebot.osaa.options:override("Break LC");
        else
            v11.ragebot.osaa.options:override("favor fire rate");
        end;
        if builder_aa[v157].pitch:get() == "disabled" then
            rage.antiaim:override_hidden_pitch(89);
        elseif builder_aa[v157].pitch:get() == "custom" then
            rage.antiaim:override_hidden_pitch(builder_aa[v157].pitch_value:get());
        elseif builder_aa[v157].pitch:get() == "up" then
            rage.antiaim:override_hidden_pitch(-89);
        elseif builder_aa[v157].pitch:get() == "down" then
            rage.antiaim:override_hidden_pitch(89);
        elseif builder_aa[v157].pitch:get() == "zero" then
            rage.antiaim:override_hidden_pitch(0);
        elseif builder_aa[v157].pitch:get() == "random" then
            rage.antiaim:override_hidden_pitch(utils.random_int(-builder_aa[v157].pitch_value:get(), builder_aa[v157].pitch_value:get()));
        elseif builder_aa[v157].pitch:get() == "progressive" then
            rage.antiaim:override_hidden_pitch((globals.curtime * 7 % 2 - 1) * builder_aa[v157].pitch_value:get());
        end;
        if builder_aa[v157].yaw:get() == "disabled" then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif builder_aa[v157].yaw:get() == "custom" then
            rage.antiaim:override_hidden_yaw_offset(builder_aa[v157].yaw_value:get());
        elseif builder_aa[v157].yaw:get() == "jitter" then
            v11.antiaim.angels.body_yaw.options:override("Jitter");
            rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and -90 or 90);
        elseif builder_aa[v157].yaw:get() == "opposite" then
            rage.antiaim:override_hidden_yaw_offset(180);
        elseif builder_aa[v157].yaw:get() == "spin" then
            rage.antiaim:override_hidden_yaw_offset(globals.curtime * 840 % 360);
        elseif builder_aa[v157].yaw:get() == "random" then
            rage.antiaim:override_hidden_yaw_offset(utils.random_int(-builder_aa[v157].yaw_value:get(), builder_aa[v157].yaw_value:get()));
        end;
    end;
    local function v159()
        antiaim_build = builder_aa;
        return antiaim_build;
    end;
    local function v161(_)
        -- upvalues: v128 (ref), v11 (ref)
        if builder_aa[v128()].yaw_base:get() == 1 then
            v11.antiaim.angels.yaw.base:override("Local View");
        end;
        if builder_aa[v128()].yaw_base:get() == 2 then
            v11.antiaim.angels.yaw.base:override("At Target");
        end;
    end;
    local function v163(v162)
        -- upvalues: v83 (ref), v11 (ref)
        if not v83.antiaim.extra.safehead:get() == "Air+Crouch Knife & Zeus" then
            return;
        else
            if v83.antiaim.extra.safehead:get() == "Air+Crouch Knife & Zeus" then
                if entity.get_local_player():get_player_weapon() == nil then
                    return;
                elseif entity.get_local_player():get_player_weapon():get_classname() == "CKnife" and v162 == 8 then
                    v11.antiaim.angels.yaw.hidden:override(true);
                    v11.antiaim.angels.yaw.offset:override(1);
                    v11.antiaim.angels.yaw.base:override("At Target");
                    v11.antiaim.angels.yaw_modifier:override("Random");
                    v11.antiaim.angels.yaw_modifier_offset:override(5);
                    v11.antiaim.angels.body_yaw.inverter:override(true);
                    v11.antiaim.angels.body_yaw.freestanding:override("off");
                    v11.antiaim.angels.body_yaw.options:override("Avoid Overlap");
                    v11.antiaim.angels.body_yaw.left_limit:override(12);
                    v11.antiaim.angels.body_yaw.right_limit:override(54);
                end;
            end;
            return;
        end;
    end;
    local function v165()
        -- upvalues: v83 (ref), v11 (ref)
        if not v83.antiaim.extra.warmupaa:get() then
            return;
        else
            local v164 = entity.get_game_rules();
            if v164 == nil or not v164.m_bWarmupPeriod then
                return;
            else
                v11.antiaim.angels.pitch:override("Disabled");
                v11.antiaim.angels.yaw:override("Disabled");
                v11.antiaim.angels.yaw.offset:override(0);
                v11.antiaim.angels.body_yaw:override(false);
                v11.antiaim.angels.body_yaw.options:override({});
                v11.antiaim.angels.body_yaw.inverter:override(false);
                v11.antiaim.angels.yaw.hidden:override(false);
                v11.antiaim.angels.yaw_modifier:override("Disabled");
                v11.antiaim.angels.yaw_modifier_offset:override(0);
                return;
            end;
        end;
    end;
    local function v167(v166)
        -- upvalues: v83 (ref), v11 (ref)
        if v83.antiaim.hotkeys.flick_exploit:get() then
            if rage.exploit:get() < 1 then
                return;
            elseif v11.ragebot.slow_walk:get() then
                rage.antiaim:inverter(false);
                v11.antiaim.angels.yaw.offset:override(5);
                v11.antiaim.angels.yaw_modifier:override("Random");
                v11.antiaim.angels.yaw_modifier_offset:override(5);
                v11.antiaim.angels.body_yaw:override(true);
                v11.antiaim.angels.body_yaw.options:override("");
                v11.antiaim.angels.body_yaw.left_limit:override(54);
                v11.antiaim.angels.body_yaw.right_limit:override(54);
                v11.antiaim.angels.freestanding:override(false);
                v11.antiaim.angels.yaw.hidden:override(true);
                rage.antiaim:override_hidden_pitch(v83.antiaim.hotkeys.flick_exploit.pitch:get());
                if v83.antiaim.hotkeys.flick_exploit.inverted:get() == "Default" then
                    rage.antiaim:override_hidden_yaw_offset(90);
                    rage.antiaim:override_hidden_yaw_offset(-90);
                elseif v83.antiaim.hotkeys.flick_exploit.inverted:get() == "Switched" then
                    rage.antiaim:override_hidden_yaw_offset(-70, 90);
                    rage.antiaim:override_hidden_yaw_offset(70, -90);
                    v11.antiaim.angels.body_yaw.inverter:override(true);
                elseif v83.antiaim.hotkeys.flick_exploit.inverted:get() == "Random" then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-70, 90));
                    rage.antiaim:override_hidden_yaw_offset(math.random(70, -90));
                end;
                v166.force_defensive = v166.command_number % 7 == 0;
                v11.ragebot.lag_options:override("Always On");
                v11.ragebot.hide_shots_options:override("Break LC");
            end;
        end;
    end;
    events.createmove:set(function(v168)
        -- upvalues: v128 (ref), v153 (ref), v155 (ref), v158 (ref), v163 (ref), v159 (ref), v165 (ref), v161 (ref), v167 (ref)
        local v169 = v128();
        v153(v168, v169);
        v155(v169);
        v158(v168, v169);
        v163(v169);
        v159();
        v165();
        v161(v168, v169);
        v167(v168);
    end);
end;
v126 = render.load_font("Verdana", 16, "ad");
local v170 = render.load_font("Calibri", 24, "bad");
local v171 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000d\000\000\000\\\b\003\000\000\000\175\021\224\166\000\000\000\001sRGB\001\217\201,\127\000\000\000\tpHYs\000\000\v\019\000\000\v\019\001\000\154\156\024\000\000\002\223PLTE\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255v\153it\000\000\000\245tRNS\000\001C\147X\006Z\251\255\253\150\004\213\249\002\014\227\024\022\234+\027\2396)sr\030\242?uk \235\2442!\246G/\231\2267^\183\015#\248Q\b\179\154}\247c\000pz\193%n-\224b\252\194(v\174\136\v\201]~\250\233'\\\223\0181\132\216\140\207\151:\138\003\172\218\028l.B\143{\161K\149\016\202\019U=\0263\nNi\130\187A\199\128\135\145\158\166\170\134\127_&\220\254I\232\023\195F\137\146\186,\192\184\163\159\168\175\177\181\188\212|\243\157$\r\142[\005\217\209\153\241\204\203\155O\020\206\197\205\0250\245\a\222\021\164\029\017\229\131*\160q\214\208\198\185\169mR5\221\f\228d\237\191\196\141w\133\139\144\238\230\165x\236\t`\031\129\171\156\1528aJ\1784L\219\167\210E9S\176\240\189\148M\180DT>\162\"Yj\225\215\173@H;\190et4r\001\212\000\000\anIDATx\156\237\154\249[\212F\024\199\179\"2+\139\138X\208B\229\016T(B\017p\017\017\016\149\"(V,\136\020\005\228\180\028\197 `E\188Q\001\161\136\136\162\162xq\021\021\v\136x\v\021T\020\207\nx\182\181\213Z\219\218\235\015hf&\187\155\132\221%\134\165\207\211>\190\191d\231\155\247}?9f\146w&K\016\002L4@k\160\182\144\1927\177A:@<\184\159\025\186\018\000\128\222\144\254\133\f\029FA\128~\255B\134\027@\200\136\254\133\188c\b!F\154K8r\212\187=\014\217\216\004B\222\227\168\162\145\163M\205\0041\244\205\001\176\024\195\017-\173 d,G\0297\030\000k\027!\144\247a:\219\tl\209\206\030\170\031\176E\135\137Pt\020\002\177\019\195P'\142\232\f\197I,M\234\162\003\197\201B \132+\f\021\179o\203\020=(\186\177\180\169\227\161\230n&\b\226\225\t\131\167905/\164MgJ\1863\160\004f\nb\016\222\031\162h\031\1666\002I\179\024\138\212\195\023J~\179\133A\1369(\163\255\\\134\244\017\146\2301\020\203\000$\205\023\252\168\249\024\197\a2\226\131\144\178@!\004/DJ\200'B\025D(\186\003\022\139\020\202b\1482L!\140E\002\b\023\204\144\221\149\b\133\178\004\t\145\242v\020\246\136\142\017\014!\198\196B\139S\bK\145\240\169\188\029\159\144\232\150\228\248Yr\031\024o\237\127cR\227P\219e\131D\178f\130\169\155\019I\146)\203#\177\005\166\166\165\243\180\136@\024\160\181\226s\151\149\025l\134\254tw\170W\219{\225\150\003i\0154a\171\024}|\200\148\249\1712\145\186\026\vnb\1410\168'\181\183\140a\182`\r\173\025\172\197\202:\r1\128\243z\156\208{\131\191L\178ZBc\253\213\005\190\145\133\162|\027\205\229B\214&\217\185\025\240\203\016\176yKv\142\194\"\178\211r\211\023n\205\155\152\191%\235\139\002\236\178\r\229\147Gx\146Q\242\155T\200\aa\161\246m\020\139\157R\152\016\207\237E\f\015^}\203z\a\015H1\003\226\183s\023\211\131W\231*\217\1654;\027\162%\135\024jq\ne>\f \017)\201\205\133\004\162\006\245\138\2032\210\229x\240\130\236V\199\144A\246\160\198\222\210\213\\\004O\200>>\144\253\168Qv@\137\a/\200A>\144\237\170=xA\014\241\129\164\246\017\018\r=c\226\014\031\017\137\202+f\014%*\195K\141\2275\r)\128\158\185\133:U\213\195\253\128\213rbR\166x\141bBACr\250\b\145H)\207/\0010\1699z\f\150u\199\169\159\181\\\200\137\190B\2248\177\252*+\214Adc\016\184\150\152\189\160\196g\130\166!uj\139\\\rA\002\130\255\005H\136\218E\014\026\130\v\217\241\195\170J\n\234\2475\184\158\156\145\222\184g\222\169\166\211KE\252 g\028x@\178U\028\180\161\027?\136\251Y\030\1444UWf\149J\1369\170y\246\226\198\185(\030\144tU\016\019U\144\204\243(D\130[\023\212.\164\244\006\137V\005\1858\129\t\017_\202kn\025\205\176\150\201\219f\145I_\167l\184\220\220\186\209\150\003\017[\180]q/\145H\014\187\230_m\189f\218\020\163\002\210nD\\/R@xY#\130\028\245V\210\221\149\a\180JE\2257\004A\148\154\204\197j\243\172\184\142\202\168Q\168QeF\148_\024\203\128\024\238'o\230\154P\221\172\153$\179\157\169n\1775)\233\150\0145J\195H\242\182/_H\189\017~\141\215\192\134\175\135\148\184\003\2382 \247\224>\018\1282\184\r\003zA\212F\186\005\180u\192\246I\236\147\219\027\164t(nI\191\129\173\251\193Dg;X\196\128\160\197\173.\000:\241\214\031\213\189\129\160\027=\t\"\177\207\131^ z\176\160\220q\249\161D\210N\181*:\b\221\019xiN\006\129gE<\002\000M>\031\211\213\203m\176\170\018n\181\248A\242\168\031\218\247\233\132\153\205T\030g6\228\017tm\002\224\t\220.\161\235\176[t\209\151\141}\210z\129\192K~O\214\005\252k\b\"\021\176!\167j)s\002 \220L\191\186\166\017T\148\r\175^Zt\b\152\aA\157\158\024\\\237\005r\154\186\027\r2\200dj\134\225*\145H\236\168\189y\018\019\021\029\182\167\225\a\228\001eo\005\180\127\0285;\170\163}\205\217\207\169\193\188!\248Q\223\176\220X\005\004\206_\002i\223\167\236\2537\145\168S%\t\248\150\218zvKJ,\160` \169k\1636\206%\146\238\n:\016\215]V\160\221\173Gy\142\246\195\005\178\140v\236\219\016K\027\236\213F\177\223!\1779FZi3\r\000\199\179\196\245\228n\000\190\175\021\233\006\237\005\190\231\227\137\029\207\218p ^\127\132\135\240\195]e\144h\216%\203\031Z\177N\031\222\248\131\244o8\248\136\213\000\160:(\020\248\161Zt\006\176F\195+\021\251\224\021\029<\169\n\235\232\t\017\255\b\127\206\029\240<6\150\005\145\202z\215c\184?\025\128\169p\251\002\004\160\154z?=N\232\219\134\215\166\134\225FHS0\023\002\206X\210M\017\251Ld\144\197p_\023=^d\1311\130\030\249?a\159\021(A\183,<\253\165\148\003\001u\003\241\027\214L9\164\v\238\243\001\224g\184}\005\174\160\213\194<p\f\245Dz\020\135\163\004\151\229\243\195\170\004.\004\000\251\137\197$\025\246\vPj\005\023)+\001\224\215\173\2179\233\212\173\v\137\200y\144o\b|/A\221\016\251\188\194\t-\159\202\186\027(\158\203\133\244\213<\159\208\025w%\148f\210Z>=\r\180\214\020d\141\151\252\234T'\214\209SQzy\239t\183\250X\222\214\200,e\143\\\195\a/\251@0\213\189O\185\197\021\021\021\133\006~U\191\217\177F\006a\214\178\207\1760W>k\030\017\219\023kJ~\253\250\197\166\145Jf\138\218\157q\241=\213\183\246_1o\023\146$\157|\024\139\253/Ih\191+\132?\160\v9]mU\174\222\018\209w$\2413\133\242\002\245\221\249\n\2259\238\205\166\194!\165(\193no\133b\131\148\020\133\160\189\f)\209jg1\234l\016\138\247e~\186,GR\018C\233D\175*O7n0O\187\142\015\210\145\185\022\213\243s\211\144\227H\170W\182x\195\195n\160;r\193\146\169y\161\167_\vS\138\169G\020\015a\144?Q\240$)S\203@e\188\v\203\2399\002\175\019\244W\128\181\232Dl\217k\005Eh\2212\145\165iG@\205\190K\bd%\f=W\203\022\241\183_\206\165\233@\175\140@!\1442\0249\135#v\160\242n'G\253\139\186`:\161B \186\145V\134N\220\133\149\0264\241\230|`&\028\254\014(\189\167\185\191g\028A%\227z\141\229Sj\213~\016\162\193\127\022(3\252G\f\203\222\029\251b\186p\150\225\171v\209[\003VLA\166\2453\131\136iM\191\147\209\187\155\220\254\001Q\1440+D^\186l\000\000\000\000IEND\174B`\130", vector(32, 27));
local function v179(v172, v173, v174, v175)
    -- upvalues: v170 (ref), l_y_0 (ref), v83 (ref)
    local v176 = render.measure_text(v170, "bad", v172);
    local v177 = 28;
    local v178 = l_y_0 - 350;
    if v83.other.SideIndicators.style:get() == "Laura" then
        if v175 then
            render.blur(vector(19, v178 - 350 - v174 + 350), vector(32 + render.measure_text(v170, "bad", v172).x, v178 - 345 - v174 + 28 + 350), 1.5, 0.9, 10);
            render.rect_outline(vector(18, v178 - 350 - v174 + 350), vector(33 + render.measure_text(v170, "bad", v172).x, v178 - 345 - v174 + 28 + 350), color(34, 34, 34, 55), 0.9, 10);
            render.text(v170, vector(26, v178 - 343 - v174 + 350), color(0, 0, 0, 150), "bad", v172);
            render.text(v170, vector(25, v178 - 344 - v174 + 350), v173, "bad", v172);
        else
            render.blur(vector(19, v178 - 350 - v174 + 350), vector(32 + render.measure_text(v170, "bad", v172).x, v178 - 345 - v174 + 28 + 350), 1.5, 0.9, 10);
            render.rect_outline(vector(18, v178 - 350 - v174 + 350), vector(33 + render.measure_text(v170, "bad", v172).x, v178 - 345 - v174 + 28 + 350), color(34, 34, 34, 55), 0.9, 10);
            render.text(v170, vector(25, v178 - 344 - v174 + 350), v173, "bad", v172);
        end;
    end;
    if v83.other.SideIndicators.style:get() == "Gradient" then
        if v175 then
            render.gradient(vector(5, v178 + 3 - v174), vector(v177 + (v175.width + v176.x) / 2 + 3, v178 + 37 - v174), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
            render.gradient(vector(v177 + (v175.width + v176.x) / 2 + 3, v178 + 3 - v174), vector(v177 + v176.x + v175.width + 29, v178 + 37 - v174), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
            render.texture(v175, vector(v177, v178 + 6 - v174), v173);
            render.text(v170, vector(v177 + v175.width + 6, v178 + 10 - v174), v173, "bad", v172);
        else
            render.gradient(vector(5, v178 + 3 - v174), vector(v177 + v176.x / 2, v178 + 37 - v174), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
            render.gradient(vector(v177 + v176.x / 2, v178 + 3 - v174), vector(v177 + v176.x + 23, v178 + 37 - v174), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
            render.text(v170, vector(v177, v178 + 4 - v174 + 5), v173, "bad", v172);
        end;
    end;
end;
get_bind = function(v180)
    local v181 = false;
    local v182 = 0;
    local v183 = ui.get_binds();
    for v184 = 1, #v183 do
        if v183[v184].name == v180 and v183[v184].active then
            v181 = true;
            v182 = v183[v184].value;
        end;
    end;
    return {
        [1] = v181, 
        [2] = v182
    };
end;
events.render:set(function()
    -- upvalues: v83 (ref), l_y_0 (ref), v11 (ref), v179 (ref), l_bomb_0 (ref), v170 (ref), v171 (ref)
    if v83.other.SideIndicators:get() then
        local v185 = entity.get_local_player();
        if v185 == nil or not v185:is_alive() then
            return;
        else
            local v186 = v185:get_player_weapon();
            if not v186 or v186 == nil then
                return;
            else
                local function v198(v187, v188)
                    local l_x_2 = v187.x;
                    local l_y_2 = v187.y;
                    local l_z_1 = v187.z;
                    local l_x_3 = v188.x;
                    local l_y_3 = v188.y;
                    local l_z_2 = v188.z;
                    local v195 = l_x_2 - l_x_3;
                    local v196 = l_y_2 - l_y_3;
                    local v197 = l_z_1 - l_z_2;
                    return math.sqrt(v195 * v195 + v196 * v196 + v197 * v197);
                end;
                local v199 = 0;
                local v200 = 41;
                local _ = 28;
                local v202 = l_y_0 - 350;
                if v83.other.SideIndicators.text_style:get() == "With Icons" then
                    if v83.other.SideIndicators.target_select:get() then
                        local v203 = v83.other.SideIndicators.target_select.color:get():to_hex();
                        if not entity.get_local_player() then
                            return;
                        else
                            local _ = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
                            if entity.get_threat() == nil then
                                target_name = "none";
                            else
                                target_name = entity.get_threat():get_name();
                            end;
                            if v11.ragebot.enable:get() then
                                v179("\a" .. v203 .. "" .. ui.get_icon("user") .. "  Target: " .. target_name .. "", color(150, 189, 18, 255), v199);
                                v199 = v199 + v200;
                            end;
                        end;
                    end;
                    if v11.antiaim.misc.fake_latency:get() > 0 or v83.other.fakelatency:get() > 1 then
                        v179(ui.get_icon("link") .. "  PING", color(150, 189, 18, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.double_tap:get() then
                        v179(ui.get_icon("objects-align-center-horizontal") .. "  DT", rage.exploit:get() == 1 and color(215, 215, 215, 255) or color(255, 0, 0, 255), v199);
                        v199 = v199 + v200;
                    elseif v11.ragebot.osaa:get() and not v11.ragebot.double_tap:get() then
                        v179(ui.get_icon("user-shield") .. "  OSAA", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.antiaim.angels.freestanding:get() or v83.antiaim.hotkeys.freestand:get() then
                        v179(ui.get_icon("arrows-retweet") .. "  FS", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.body_aim:get() == "Force" then
                        v179(ui.get_icon("vest-patches") .. "  BODY", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if get_bind("Min. Damage")[1] then
                        v179(ui.get_icon("droplet") .. "  MD", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if get_bind("Hit Chance")[1] then
                        v179(ui.get_icon("crosshairs-simple") .. "  HC", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.antiaim.angels.fake_duck:get() then
                        v179(ui.get_icon("duck") .. "  DUCK", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    local v205 = #entity.get_players(true, false) ~= #entity.get_players(true, true);
                    if v11.ragebot.dormant_aimbot:get() or v83.other.dormant_aimbot:get() then
                        if v205 then
                            v179(ui.get_icon("eye") .. "  DA", color(215, 215, 215, 255), v199);
                        else
                            v179(ui.get_icon("eye") .. "  DA", color(255, 0, 0, 255), v199);
                        end;
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.safe_points:get() == "Force" then
                        v179(ui.get_icon("bullseye-pointer") .. "  SAFE", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    local v206 = entity.get_entities("CPlantedC4")[1];
                    if v206 ~= nil then
                        local v207 = (v206.m_flC4Blow - globals.curtime) * 10 / 10;
                        local l_m_bBombDefused_0 = v206.m_bBombDefused;
                        if math.floor(v207) >= -1 and not l_m_bBombDefused_0 then
                            local v209 = v206.m_hBombDefuser ~= 4294967295;
                            local l_m_flDefuseLength_0 = v206.m_flDefuseLength;
                            local v211 = v209 and math.floor((v206.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1;
                            if v211 > 0 and not abort_defuse then
                                local v212 = v211 < math.floor(v207) and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                                local v213 = (v202 - 50) / l_m_flDefuseLength_0 * v211;
                                render.rect(vector(0, 0), vector(16, v202), color(25, 25, 25, 160));
                                render.rect(vector(0, v202 - v213), vector(16, v202), v212);
                            end;
                            local v214 = v206.m_nBombSite == 0 and "A" or "B";
                            local l_m_iHealth_0 = v185.m_iHealth;
                            local l_m_ArmorValue_0 = v185.m_ArmorValue;
                            local v217 = false;
                            local v218 = v198(v206.m_vecOrigin, v185.m_vecOrigin);
                            local v219 = 450.7;
                            local v220 = (v218 - 75.68) / 789.2;
                            local v221 = v219 * math.exp(-v220 * v220);
                            if l_m_ArmorValue_0 > 0 then
                                local v222 = v221 * 0.5;
                                local v223 = (v221 - v222) * 0.5;
                                if l_m_ArmorValue_0 < v223 then
                                    l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                                    v222 = v221 - v223;
                                end;
                                v221 = v222;
                            end;
                            local v224 = math.ceil(v221);
                            v217 = l_m_iHealth_0 <= v224;
                            if v207 > 0.01 then
                                v179(ui.get_icon("land-mine-on") .. "  " .. v214 .. " - " .. string.format("%.1f", v207 >= 0 and v207 or 0) .. "s", color(215, 215, 215, 255), v199);
                                v199 = v199 + v200;
                                if v217 then
                                    v179(ui.get_icon("circle-exclamation") .. "  FATAL", color(255, 0, 0, 255), v199);
                                    v199 = v199 + v200;
                                elseif v221 > 0.5 then
                                    v179(ui.get_icon("monitor-waveform") .. "  -" .. v224 .. " HP", color(255, 240, 100, 255), v199);
                                    v199 = v199 + v200;
                                end;
                            end;
                        end;
                    end;
                    if l_bomb_0.state == false then
                        v179(ui.get_icon("land-mine-on") .. " " .. l_bomb_0.site, color(255, 240, 100, 255), v199);
                        ts = render.measure_text(v170, "bad", l_bomb_0.site) + vector(20, 0);
                        v199 = v199 + v200;
                    end;
                else
                    if v83.other.SideIndicators.target_select:get() then
                        local v225 = v83.other.SideIndicators.target_select.color:get():to_hex();
                        if not entity.get_local_player() then
                            return;
                        else
                            local _ = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
                            if entity.get_threat() == nil then
                                target_name = "none";
                            else
                                target_name = entity.get_threat():get_name();
                            end;
                            if v11.ragebot.enable:get() then
                                v179("\a" .. v225 .. "Target: " .. target_name .. "", color(150, 189, 18, 255), v199);
                                v199 = v199 + v200;
                            end;
                        end;
                    end;
                    if v11.antiaim.misc.fake_latency:get() > 0 or v83.other.fakelatency:get() > 1 then
                        v179("PING", color(150, 189, 18, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.double_tap:get() then
                        v179("DT", rage.exploit:get() == 1 and color(215, 215, 215, 255) or color(255, 0, 0, 255), v199);
                        v199 = v199 + v200;
                    elseif v11.ragebot.osaa:get() and not v11.ragebot.double_tap:get() then
                        v179("OSAA", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.antiaim.angels.freestanding:get() or v83.antiaim.hotkeys.freestand:get() then
                        v179("FS", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.body_aim:get() == "Force" then
                        v179("BODY", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if get_bind("Min. Damage")[1] then
                        v179("MD", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if get_bind("Hit Chance")[1] then
                        v179("HC", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    if v11.antiaim.angels.fake_duck:get() then
                        v179("DUCK", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    local v227 = #entity.get_players(true, false) ~= #entity.get_players(true, true);
                    if v11.ragebot.dormant_aimbot:get() or v83.other.dormant_aimbot:get() then
                        if v227 then
                            v179("DA", color(215, 215, 215, 255), v199);
                        else
                            v179("DA", color(255, 0, 0, 255), v199);
                        end;
                        v199 = v199 + v200;
                    end;
                    if v11.ragebot.safe_points:get() == "Force" then
                        v179("SAFE", color(215, 215, 215, 255), v199);
                        v199 = v199 + v200;
                    end;
                    local v228 = entity.get_entities("CPlantedC4")[1];
                    if v228 ~= nil then
                        local v229 = (v228.m_flC4Blow - globals.curtime) * 10 / 10;
                        local l_m_bBombDefused_1 = v228.m_bBombDefused;
                        if math.floor(v229) >= -1 and not l_m_bBombDefused_1 then
                            local v231 = v228.m_hBombDefuser ~= 4294967295;
                            local l_m_flDefuseLength_1 = v228.m_flDefuseLength;
                            local v233 = v231 and math.floor((v228.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1;
                            if v233 > 0 and not abort_defuse then
                                local v234 = v233 < math.floor(v229) and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                                local v235 = (v202 - 50) / l_m_flDefuseLength_1 * v233;
                                render.rect(vector(0, 0), vector(16, v202), color(25, 25, 25, 160));
                                render.rect(vector(0, v202 - v235), vector(16, v202), v234);
                            end;
                            local v236 = v228.m_nBombSite == 0 and "A" or "B";
                            local l_m_iHealth_1 = v185.m_iHealth;
                            local l_m_ArmorValue_1 = v185.m_ArmorValue;
                            local v239 = false;
                            local v240 = v198(v228.m_vecOrigin, v185.m_vecOrigin);
                            local v241 = 450.7;
                            local v242 = (v240 - 75.68) / 789.2;
                            local v243 = v241 * math.exp(-v242 * v242);
                            if l_m_ArmorValue_1 > 0 then
                                local v244 = v243 * 0.5;
                                local v245 = (v243 - v244) * 0.5;
                                if l_m_ArmorValue_1 < v245 then
                                    l_m_ArmorValue_1 = l_m_ArmorValue_1 * 2;
                                    v244 = v243 - v245;
                                end;
                                v243 = v244;
                            end;
                            local v246 = math.ceil(v243);
                            v239 = l_m_iHealth_1 <= v246;
                            if v229 > 0.01 then
                                v179("" .. v236 .. " - " .. string.format("%.1f", v229 >= 0 and v229 or 0) .. "s", color(215, 215, 215, 255), v199, v171);
                                v199 = v199 + v200;
                                if v239 then
                                    v179("FATAL", color(255, 0, 0, 255), v199);
                                    v199 = v199 + v200;
                                elseif v243 > 0.5 then
                                    v179("-" .. v246 .. " HP", color(255, 240, 100, 255), v199);
                                    v199 = v199 + v200;
                                end;
                            end;
                        end;
                    end;
                    if l_bomb_0.state == false then
                        v179("" .. l_bomb_0.site, color(255, 240, 100, 255), v199, v171);
                        ts = render.measure_text(v170, "bad", l_bomb_0.site) + vector(20, 0);
                        v199 = v199 + v200;
                    end;
                end;
            end;
        end;
    end;
end);
v83.other.decreaseholdaimticks:set_callback(function(v247)
    cvar.sv_maxusrcmdprocessticks_holdaim:int(v247:get() and 0 or 1);
end);
local _ = nil;
local v249 = {};
local v250 = ffi.typeof("        struct {\n            float  m_flLayerAnimtime;\n            float  m_flLayerFadeOuttime;\n\n            // dispatch flags\n            void  *m_pDispatchedStudioHdr;\n            int    m_nDispatchedSrc;\n            int    m_nDispatchedDst;\n\n            int    m_nOrder;\n            int    m_nSequence;\n            float  m_flPrevCycle;\n            float  m_flWeight;\n            float  m_flWeightLauraRate;\n\n            // used for automatic crossfades between sequence changes;\n            float  m_flPlaybackRate;\n            float  m_flCycle;\n            int    m_pOwner;\n            int    m_nInvalidatePhysicsBits;\n        } **\n    ");
animations_enable = v83._inuilist.other.right_down:switch("\v\f<street-view>\r    Animations", false, function(v251, v252)
    return {
        moveleanforce = v251:slider("move lean force", 0, 100, 100, nil, "%"):depend(v252), 
        moveleanonground = v251:switch("on ground force"):depend(v252)
    };
end):depend(v83.antiaim.masterswitch, selector_other);
v249.gear = animations_enable:create();
v249.type_inair = v249.gear:selectable("In Air", {
    [1] = "static"
}):depend(animations_enable);
v249.type_onground = v249.gear:selectable("On Ground", {
    [1] = "static in crouch", 
    [2] = "static in slow-walk", 
    [3] = "jitter"
}):depend(animations_enable);
v249.type_addons = v249.gear:listable("Addons", {
    [1] = "landing pitch", 
    [2] = "earthquake", 
    [3] = "kangaroo"
}):depend(animations_enable);
do
    local l_v249_0, l_v250_0 = v249, v250;
    local function v256(v255)
        -- upvalues: l_v250_0 (ref)
        return ffi.cast(l_v250_0, ffi.cast("uintptr_t", v255[0]) + 10640)[0];
    end;
    local function v259(v257)
        local v258 = globals.tickcount / 10;
        return (0.5 + 0.5 * math.sin(v258 * v257)) * 100;
    end;
    local function v262(v260, _)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_inair:get("static") then
            return;
        else
            v260.m_flPoseParameter[6] = 1;
            return;
        end;
    end;
    local function v265(v263, _)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_onground:get("static in crouch") then
            return;
        else
            v263.m_flPoseParameter[8] = 0;
            return;
        end;
    end;
    local function v268(v266, _)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_onground:get("static in slow-walk") then
            return;
        elseif not ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
            return;
        else
            v266.m_flPoseParameter[9] = 0;
            return;
        end;
    end;
    local function v271(v269, _)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_onground:get("jitter") then
            return;
        else
            v269.m_flPoseParameter[0] = utils.random_float(0.08, 1);
            if utils.random_int(0, 1) == 1 then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            else
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Default");
            end;
            return;
        end;
    end;
    local function v276(v272, v273)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_addons:get("move lean") then
            return;
        elseif v272.is_onground and not animations_enable.moveleanonground:get() then
            return;
        else
            local l_m_flWeight_0 = v273[12].m_flWeight;
            local v275 = animations_enable.moveleanforce:get();
            v273[12].m_flWeight = math.clamp(l_m_flWeight_0 + l_m_flWeight_0 * v275, 0, 1);
            return;
        end;
    end;
    local function v279(v277, v278)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_addons:get("landing pitch") then
            return;
        else
            if v278.landing then
                v277.m_flPoseParameter[12] = 0.5;
            end;
            return;
        end;
    end;
    local function v282(v280, v281)
        -- upvalues: l_v249_0 (ref), v259 (ref)
        if not l_v249_0.type_addons:get("earthquake") then
            return;
        elseif v280.is_onground and l_v249_0.type_onground:get("skeet leg fucker") then
            return;
        else
            if globals.tickcount % 10 > 1 then
                v281[12].m_flWeight = v259(7) / 100;
            end;
            return;
        end;
    end;
    local function v284(v283)
        -- upvalues: l_v249_0 (ref)
        if not l_v249_0.type_addons:get("kangaroo") then
            return;
        elseif v283.is_onground and l_v249_0.type_onground:get("skeet leg fucker") then
            return;
        else
            v283.m_flPoseParameter[3] = math.random(0, 10) / 10;
            v283.m_flPoseParameter[6] = math.random(0, 10) / 10;
            v283.m_flPoseParameter[7] = math.random(0, 10) / 10;
            if l_v249_0.type_inair:get("static leg in air") then
                v283.m_flPoseParameter[6] = 1;
            end;
            return;
        end;
    end;
    local function v288(v285)
        -- upvalues: v256 (ref), v271 (ref), v279 (ref), v265 (ref), v268 (ref), v262 (ref), v284 (ref), v276 (ref), v282 (ref)
        if entity.get_local_player() ~= v285 then
            return;
        else
            local v286 = v285:get_anim_state();
            if v286 == nil then
                return;
            else
                local v287 = v256(v285);
                if v287 == nil then
                    return;
                else
                    v271(v285, v287);
                    v279(v285, v286);
                    v265(v285, v287);
                    v268(v285, v287);
                    v262(v285, v287);
                    v284(v285);
                    v276(v285, v287);
                    v282(v285, v287);
                    return;
                end;
            end;
        end;
    end;
    local function v289()
        ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override();
    end;
    local function v291(v290)
        -- upvalues: v289 (ref), v288 (ref)
        events.shutdown(v289, v290);
        events.post_update_clientside_animation(v288, v290);
    end;
    animations_enable:set_callback(function(v292)
        -- upvalues: v289 (ref), v291 (ref)
        local v293 = v292:get();
        if not v293 then
            v289();
        end;
        v291(v293);
    end, true);
end;
v249 = nil;
v250 = ui.get_position();
local v294 = {};
local v295 = {};
local v296 = render.load_font("Calibri", 10, "bad");
local v297 = render.load_font("Calibri", 35, "bad");
local v298 = render.load_font("Calibri", 20, "bad");
do
    local l_v294_0, l_v295_0, l_v297_0, l_v298_0 = v294, v295, v297, v298;
    local function v333()
        -- upvalues: v83 (ref), l_x_0 (ref), v31 (ref), l_gradient_0 (ref), l_y_0 (ref), l_v298_0 (ref), l_v297_0 (ref)
        local v303 = v83.other.watermarkstyle_label.color:get();
        if entity.get_local_player() == nil then
            return;
        elseif common.get_username() == nil then
            return;
        else
            local v304 = utils.net_channel();
            if v304 == nil then
                return;
            else
                local v305 = v304.avg_latency[1] * 1000;
                local _ = v83.other.watermarkstyle_label.color:get();
                local v307 = common.get_username();
                local _ = render.measure_text(2, nil, v307:upper());
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Classic" then
                    local v309 = common.get_system_time();
                    local v310 = string.format("%02d:%02d:%02d", v309.hours, v309.minutes, v309.seconds);
                    local v311 = "Laura | " .. common.get_username() .. " | ping: " .. math.floor(v305) .. "ms | time: " .. v310 .. "";
                    render.rect(vector(l_x_0 - 15 - render.measure_text(1, nil, v311).x, 8), vector(l_x_0 - 7, 10), color(v83.other.watermarkstyle_label.color:get().r, v83.other.watermarkstyle_label.color:get().g, v83.other.watermarkstyle_label.color:get().b, 150), 0);
                    render.rect(vector(l_x_0 - 15 - render.measure_text(1, nil, v311).x, 10), vector(l_x_0 - 7, 30), color(10, 10, 10, 105), 0);
                    render.text(1, vector(l_x_0 - render.measure_text(1, nil, v311).x - 10, 13), color(255, 255, 255, 255), nil, v311);
                end;
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Laura Mini" then
                    local _ = v83.other.watermarkstyle_label.color:get();
                    local v313 = common.get_system_time();
                    local v314 = string.format("%02d:%02d:%02d", v313.hours, v313.minutes, v313.seconds);
                    local v315 = " user ~ " .. common.get_username() .. "  |  ping ~ " .. math.floor(v305) .. "ms  |  time ~ " .. v314 .. " ";
                    local v316 = " build ~ " .. v31._lua.build .. "  |  version ~ " .. v31._lua.version .. "";
                    render.text(1, vector(l_x_0 - render.measure_text(1, nil, v315).x - 10, 13), color(255, 255, 255, 255), nil, v315);
                    render.text(1, vector(l_x_0 - render.measure_text(1, nil, v315).x + 122, 30), color(255, 255, 255, 255), nil, v316);
                end;
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Laura" then
                    if not globals.is_in_game or not entity.get_local_player() then
                        return;
                    else
                        local v317 = entity.get_local_player();
                        local _ = v317:get_steam_avatar();
                        local v319 = v317:get_name();
                        v319 = string.sub(v319, 1, 10);
                        if string.len(v319) >= 10 then
                            v319 = v319 .. "...";
                        end;
                        local v320 = l_gradient_0.text_animate(ui.get_icon("moon") .. " L A U R A", -2, {
                            v303, 
                            color(40)
                        });
                        render.text(4, vector(l_x_0 / 2, l_y_0 / 1.02), color(175, 175, 175), "", v320:get_animated_text());
                        v320:animate();
                    end;
                end;
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Laura Skinny" then
                    if not globals.is_in_game or not entity.get_local_player() then
                        return;
                    else
                        local v321 = entity.get_local_player();
                        local _ = v321:get_steam_avatar();
                        local v323 = v321:get_name();
                        v323 = string.sub(v323, 1, 10);
                        if string.len(v323) >= 10 then
                            v323 = v323 .. "...";
                        end;
                        local v324 = l_gradient_0.text_animate("L A U R A", -2, {
                            v303, 
                            color(40)
                        });
                        render.text(1, vector(l_x_0 / 2, l_y_0 / 1.02), color(175, 175, 175), "", v324:get_animated_text());
                        v324:animate();
                    end;
                end;
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Laura Modern" then
                    if not globals.is_in_game or not entity.get_local_player() then
                        return;
                    else
                        local v325 = entity.get_local_player();
                        local _ = v325:get_steam_avatar();
                        local v327 = v325:get_name();
                        v327 = string.sub(v327, 1, 10);
                        if string.len(v327) >= 10 then
                            v327 = v327 .. "...";
                        end;
                        local v328 = l_gradient_0.text_animate("\226\128\186  \240\159\133\187\240\159\134\129  \226\128\185", -2, {
                            v303, 
                            color(40)
                        });
                        render.text(l_v298_0, vector(l_x_0 / 2, l_y_0 / 1.03), color(175, 175, 175), "", v328:get_animated_text());
                        v328:animate();
                    end;
                end;
                if v83.other.watermarkstyle_label.watermarkstyle:get() == "Laura Icon" then
                    if not globals.is_in_game or not entity.get_local_player() then
                        return;
                    else
                        local v329 = entity.get_local_player();
                        local _ = v329:get_steam_avatar();
                        local v331 = v329:get_name();
                        v331 = string.sub(v331, 1, 10);
                        if string.len(v331) >= 10 then
                            v331 = v331 .. "...";
                        end;
                        local v332 = l_gradient_0.text_animate(ui.get_icon("moon") .. "", -2, {
                            v303, 
                            color(40)
                        });
                        render.text(l_v297_0, vector(l_x_0 / 2, l_y_0 / 1.04), color(175, 175, 175), "", v332:get_animated_text());
                        v332:animate();
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v340()
        -- upvalues: v83 (ref), l_pui_0 (ref), v31 (ref), l_gradient_0 (ref)
        if v83.main.sidebarcombo:get() == "Default" then
            local _ = l_pui_0.sidebar("\vLaura", "moon");
        end;
        if v83.main.sidebarcombo:get() == "Default + Build" then
            local _ = l_pui_0.sidebar("\vLaura | " .. v31._lua.build .. "", "moon");
        end;
        if v83.main.sidebarcombo:get() == "Laura Modern" then
            local v336 = v83.other.watermarkstyle_label.color:get();
            local _ = v83.other.watermarkstyle_label.color:get():to_hex();
            local v338 = l_gradient_0.text_animate("\226\128\186  \240\159\133\187\240\159\134\129  \226\128\185", 1, {
                v336, 
                color(40)
            });
            local v339 = l_gradient_0.text_animate(ui.get_icon("moon"), 2, {
                v336, 
                color(40)
            });
            ui.sidebar(v338:get_animated_text(), v339:get_animated_text());
            v338:animate();
            v339:get_animated_text();
        end;
    end;
    local function v342()
        -- upvalues: v83 (ref), v78 (ref)
        if entity.get_local_player() == nil then
            return;
        else
            if v83.other.aspectratio:get() then
                local v341 = v78.new("aspect_ratio_value", v83.other.aspectratio.amount:get() / 100, 5);
                cvar.r_aspectratio:float(v341);
            else
                cvar.r_aspectratio:float(0);
            end;
            return;
        end;
    end;
    local function v347()
        -- upvalues: v78 (ref), v83 (ref), v30 (ref)
        local v343 = v78.new("viewmodel_fov_value", v83.other.viewmodel:get() and v83.other.viewmodel.fov:get() / 10 or v30(cvar.viewmodel_fov), 5);
        local v344 = v78.new("viewmodel_x_value", v83.other.viewmodel:get() and v83.other.viewmodel.x:get() / 10 or v30(cvar.viewmodel_offset_x), 5);
        local v345 = v78.new("viewmodel_y_value", v83.other.viewmodel:get() and v83.other.viewmodel.y:get() / 10 or v30(cvar.viewmodel_offset_y), 5);
        local v346 = v78.new("viewmodel_z_value", v83.other.viewmodel:get() and v83.other.viewmodel.z:get() / 10 or v30(cvar.viewmodel_offset_z), 5);
        cvar.viewmodel_fov:float(v343, true);
        cvar.viewmodel_offset_x:float(v344, true);
        cvar.viewmodel_offset_y:float(v345, true);
        cvar.viewmodel_offset_z:float(v346, true);
    end;
    l_v294_0.anim_num = 0;
    l_v294_0.smooth = function(v348, v349, v350)
        return v348 + (v349 - v348) * v350;
    end;
    l_v294_0.setup = function()
        -- upvalues: v83 (ref), v11 (ref), l_v294_0 (ref)
        if not v83.other.scope_overlay:get() then
            return;
        else
            v11.world.override_zoom.scope_overlay:override("remove all");
            local_player = entity.get_local_player();
            if not local_player or not local_player:is_alive() or not local_player.m_bIsScoped then
                l_v294_0.anim_num = l_v294_0.smooth(l_v294_0.anim_num, 0, 15 * globals.frametime);
            else
                l_v294_0.anim_num = l_v294_0.smooth(l_v294_0.anim_num, 1, 15 * globals.frametime);
            end;
            l_v294_0.offset = v83.other.scope_overlay.scope_gap:get() * l_v294_0.anim_num;
            l_v294_0.length = v83.other.scope_overlay.scope_size:get() * l_v294_0.anim_num;
            l_v294_0.col_1 = v83.other.scope_overlay.scope_color:get();
            l_v294_0.width = 1;
            l_v294_0.col_1.a = l_v294_0.col_1.a * l_v294_0.anim_num;
            l_v294_0.start_x = render.screen_size().x / 2;
            l_v294_0.start_y = render.screen_size().y / 2;
            if v83.other.scope_overlay.scope_style:get() == "default" then
                render.gradient(vector(l_v294_0.start_x - l_v294_0.offset, l_v294_0.start_y), vector(l_v294_0.start_x - l_v294_0.offset - l_v294_0.length, l_v294_0.start_y + l_v294_0.width), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("left") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("left") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0));
                render.gradient(vector(l_v294_0.start_x + l_v294_0.offset, l_v294_0.start_y), vector(l_v294_0.start_x + l_v294_0.offset + l_v294_0.length, l_v294_0.start_y + l_v294_0.width), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("right") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("right") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0));
                render.gradient(vector(l_v294_0.start_x, l_v294_0.start_y + l_v294_0.offset), vector(l_v294_0.start_x + l_v294_0.width, l_v294_0.start_y + l_v294_0.offset + l_v294_0.length), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("down") and 0 or l_v294_0.col_1.a), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("down") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(255, 255, 255, 0));
                render.gradient(vector(l_v294_0.start_x, l_v294_0.start_y - l_v294_0.offset), vector(l_v294_0.start_x + l_v294_0.width, l_v294_0.start_y - l_v294_0.offset - l_v294_0.length), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("up") and 0 or l_v294_0.col_1.a), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("up") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(255, 255, 255, 0));
            else
                render.gradient(vector(l_v294_0.start_x - l_v294_0.offset, l_v294_0.start_y), vector(l_v294_0.start_x - l_v294_0.offset - l_v294_0.length, l_v294_0.start_y + l_v294_0.width), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("left") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("left") and 0 or l_v294_0.col_1.a));
                render.gradient(vector(l_v294_0.start_x + l_v294_0.offset, l_v294_0.start_y), vector(l_v294_0.start_x + l_v294_0.offset + l_v294_0.length, l_v294_0.start_y + l_v294_0.width), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("right") and 0 or l_v294_0.col_1.a), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("right") and 0 or l_v294_0.col_1.a));
                render.gradient(vector(l_v294_0.start_x, l_v294_0.start_y + l_v294_0.offset), vector(l_v294_0.start_x + l_v294_0.width, l_v294_0.start_y + l_v294_0.offset + l_v294_0.length), color(255, 255, 255, 0), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("down") and 0 or l_v294_0.col_1.a), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("down") and 0 or l_v294_0.col_1.a));
                render.gradient(vector(l_v294_0.start_x, l_v294_0.start_y - l_v294_0.offset), vector(l_v294_0.start_x + l_v294_0.width, l_v294_0.start_y - l_v294_0.offset - l_v294_0.length), color(255, 255, 255, 0), color(255, 255, 255, 0), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("up") and 0 or l_v294_0.col_1.a), color(l_v294_0.col_1.r, l_v294_0.col_1.g, l_v294_0.col_1.b, v83.other.scope_overlay.remove_line:get("up") and 0 or l_v294_0.col_1.a));
            end;
            return;
        end;
    end;
    l_v295_0.fade_time = 0.5;
    l_v295_0.wait_time = 1;
    l_v295_0.shots = {};
    l_v295_0.render = function()
        -- upvalues: v83 (ref), l_v295_0 (ref)
        if not v83.other.hitmarker:get() then
            return;
        else
            for v351, v352 in pairs(l_v295_0.shots) do
                if v352.FadeTime <= 0 then
                    l_v295_0.shots[v351] = nil;
                else
                    v352.WaitTime = v352.WaitTime - globals.frametime;
                    if v352.WaitTime <= 0 then
                        v352.FadeTime = v352.FadeTime - 1 / l_v295_0.fade_time * globals.frametime;
                    end;
                    if v352.Position.x ~= nil and v352.Position.y ~= nil and v352.Position.z ~= nil and v352.Reason == nil then
                        local v353 = render.world_to_screen(vector(v352.Position.x, v352.Position.y, v352.Position.z));
                        if v353 ~= nil then
                            local l_x_4 = v353.x;
                            local l_y_4 = v353.y;
                            local v356 = render.screen_size();
                            local v357, v358, v359, v360 = v83.other.hitmarker.color:get():unpack();
                            render.rect(vector(l_x_4 - 1 / v356.x * v356.x, l_y_4 - 5 / v356.y * v356.y), vector(l_x_4 + 1 / v356.x * v356.x, l_y_4 + 5 / v356.y * v356.y), color(v357, v358, v359, v360 * v352.FadeTime), 0, true);
                            render.rect(vector(l_x_4 - 5 / v356.x * v356.x, l_y_4 - 1 / v356.y * v356.y), vector(l_x_4 + 5 / v356.x * v356.x, l_y_4 + 1 / v356.y * v356.y), color(v357, v358, v359, v360 * v352.FadeTime), 0, true);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    l_v295_0.aim_ack = function(v361)
        -- upvalues: l_v295_0 (ref)
        l_v295_0.shots[v361.id] = {
            FadeTime = 1, 
            Position = v361.aim, 
            WaitTime = l_v295_0.wait_time, 
            Reason = v361.state
        };
    end;
    l_v295_0.refresh_shots = function()
        -- upvalues: l_v295_0 (ref)
        l_v295_0.shots = {};
    end;
    local v365 = {
        time_to_ticks = function(v362)
            return math.floor(v362 / globals.tickinterval + 0.5);
        end, 
        vars = {
            clantag_cache = "", 
            set_clantag = function(v363, v364)
                if v364 ~= v363.clantag_cache then
                    common.set_clan_tag(v364);
                    v363.clantag_cache = v364;
                end;
            end
        }
    };
    v365.animation = function(v366, v367)
        -- upvalues: v365 (ref)
        local v368 = "               " .. v366 .. "                      ";
        local v369 = utils.net_channel();
        if v369 == nil then
            return;
        else
            local v370 = (globals.tickcount + v365.time_to_ticks(v369.latency[0] + 0.321)) / v365.time_to_ticks(0.3);
            v370 = v367[math.floor(v370 % #v367) + 1] + 1;
            return v368:sub(v370, v370 + 15);
        end;
    end;
    v365.clan_tag_prev = "";
    v365.executer = function()
        -- upvalues: v83 (ref), v365 (ref)
        if not entity.get_local_player() then
            return;
        else
            if v83.other.clantag:get() == "Disabled" then
                local v371 = v365.animation("", {
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
                    [12] = 11, 
                    [13] = 11, 
                    [14] = 11, 
                    [15] = 11, 
                    [16] = 11, 
                    [17] = 11, 
                    [18] = 11, 
                    [19] = 12, 
                    [20] = 13, 
                    [21] = 14, 
                    [22] = 15, 
                    [23] = 16, 
                    [24] = 17, 
                    [25] = 18, 
                    [26] = 19, 
                    [27] = 20, 
                    [28] = 21, 
                    [29] = 22, 
                    [30] = 23
                });
                local v372 = entity.get_game_rules();
                if v372.m_gamePhase == 5 or v372.m_timeUntilNextPhaseStarts ~= 0 then
                    v365.vars:set_clantag(v365.animation("", {
                        [1] = 11
                    }));
                end;
                if v371 ~= v365.clan_tag_prev then
                    v365.vars:set_clantag(v371);
                end;
                v365.clan_tag_prev = v371;
            end;
            if v83.other.clantag:get() == "Laura" then
                local v373 = v365.animation("Laura", {
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
                    [12] = 11, 
                    [13] = 11, 
                    [14] = 11, 
                    [15] = 11, 
                    [16] = 11, 
                    [17] = 11, 
                    [18] = 11, 
                    [19] = 12, 
                    [20] = 13, 
                    [21] = 14, 
                    [22] = 15, 
                    [23] = 16, 
                    [24] = 17, 
                    [25] = 18, 
                    [26] = 19, 
                    [27] = 20, 
                    [28] = 21, 
                    [29] = 22, 
                    [30] = 23
                });
                local v374 = entity.get_game_rules();
                if v374.m_gamePhase == 5 or v374.m_timeUntilNextPhaseStarts ~= 0 then
                    v365.vars:set_clantag(v365.animation("Laura", {
                        [1] = 11
                    }));
                end;
                if v373 ~= v365.clan_tag_prev then
                    v365.vars:set_clantag(v373);
                end;
                v365.clan_tag_prev = v373;
            end;
            if v83.other.clantag:get() == "HVHWARRIOR" then
                local v375 = v365.animation("HVHWARRIOR`", {
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
                    [12] = 11, 
                    [13] = 11, 
                    [14] = 11, 
                    [15] = 11, 
                    [16] = 11, 
                    [17] = 11, 
                    [18] = 11, 
                    [19] = 12, 
                    [20] = 13, 
                    [21] = 14, 
                    [22] = 15, 
                    [23] = 16, 
                    [24] = 17, 
                    [25] = 18, 
                    [26] = 19, 
                    [27] = 20, 
                    [28] = 21, 
                    [29] = 22, 
                    [30] = 23
                });
                local v376 = entity.get_game_rules();
                if v376.m_gamePhase == 5 or v376.m_timeUntilNextPhaseStarts ~= 0 then
                    v365.vars:set_clantag(v365.animation("HVHWARRIOR`", {
                        [1] = 11
                    }));
                end;
                if v375 ~= v365.clan_tag_prev then
                    v365.vars:set_clantag(v375);
                end;
                v365.clan_tag_prev = v375;
            end;
            return;
        end;
    end;
    local function v377()
        -- upvalues: v83 (ref), l_x_0 (ref), l_y_0 (ref), v11 (ref)
        if not globals.is_in_game or not entity.get_local_player() then
            return;
        else
            if v83.other.damage_indicator:get() then
                if v83.other.damage_indicator.font:get() == "Default" then
                    render.text(1, vector(l_x_0 / 2 + 3, l_y_0 / 2 - 15), color(255), nil, v11.ragebot.minimum_damage:get());
                end;
                if v83.other.damage_indicator.font:get() == "Bold" then
                    render.text(4, vector(l_x_0 / 2 + 3, l_y_0 / 2 - 15), color(255), nil, v11.ragebot.minimum_damage:get());
                end;
                if v83.other.damage_indicator.font:get() == "Small" then
                    render.text(2, vector(l_x_0 / 2 + 3, l_y_0 / 2 - 15), color(255), nil, v11.ragebot.minimum_damage:get());
                end;
            end;
            return;
        end;
    end;
    local function v378()
        -- upvalues: v83 (ref), l_x_0 (ref), l_y_0 (ref), v11 (ref)
        if not globals.is_in_game or not entity.get_local_player() then
            return;
        else
            if v83.other.hitchance_indicator:get() then
                if v83.other.hitchance_indicator.font:get() == "Default" then
                    render.text(1, vector(l_x_0 / 2.045, l_y_0 / 2), color(255), nil, v11.ragebot.hitchance:get(), "%");
                end;
                if v83.other.hitchance_indicator.font:get() == "Bold" then
                    render.text(4, vector(l_x_0 / 2.045, l_y_0 / 2), color(255), nil, v11.ragebot.hitchance:get(), "%");
                end;
                if v83.other.hitchance_indicator.font:get() == "Small" then
                    render.text(2, vector(l_x_0 / 2.045, l_y_0 / 2), color(255), nil, v11.ragebot.hitchance:get(), "%");
                end;
            end;
            return;
        end;
    end;
    v83.other.clantag:set_callback(function(v379)
        if not v379:get() then
            common.set_clan_tag("\000");
        end;
    end);
    events.pre_render:set(v365.executer);
    events.aim_ack:set(l_v295_0.aim_ack);
    events.round_start:set(function()
        -- upvalues: l_v295_0 (ref)
        l_v295_0.refresh_shots();
    end);
    events.player_spawned:set(function(_)
        -- upvalues: l_v295_0 (ref)
        l_v295_0.refresh_shots();
    end);
    events.render:set(function()
        -- upvalues: v333 (ref), v340 (ref), v342 (ref), v347 (ref), v377 (ref), v378 (ref), l_v295_0 (ref), l_v294_0 (ref)
        v333();
        v340();
        v342();
        v347();
        v377();
        v378();
        l_v295_0.render();
        l_v294_0.setup();
    end);
end;
v250 = nil;
v83.other.SideIndicators.target_select:depend(v83.other.SideIndicators);
v83.other.SideIndicators.style:depend(v83.other.SideIndicators);
v83.other.SideIndicators.text_style:depend(v83.other.SideIndicators);
v83.other.scope_overlay.scope_style:depend(v83.other.scope_overlay);
v83.other.scope_overlay.remove_line:depend(v83.other.scope_overlay);
v83.other.scope_overlay.scope_gap:depend(v83.other.scope_overlay);
v83.other.scope_overlay.scope_size:depend(v83.other.scope_overlay);
v83.other.scope_overlay.scope_color:depend(v83.other.scope_overlay);
v83.other.viewmodel.fov:depend(v83.other.viewmodel);
v83.other.viewmodel.x:depend(v83.other.viewmodel);
v83.other.viewmodel.y:depend(v83.other.viewmodel);
v83.other.viewmodel.z:depend(v83.other.viewmodel);
v83.other.aspectratio.amount:depend(v83.other.aspectratio);
v83.other.hitmarker.color:depend(v83.other.hitmarker);
v83.other.net_graph.select:depend(v83.other.net_graph);
v83.other.net_graph.font:depend(v83.other.net_graph);
v83.other.net_graph.color:depend(v83.other.net_graph);
v83.other.hitchance_indicator.font:depend(v83.other.hitchance_indicator);
v83.other.damage_indicator.font:depend(v83.other.damage_indicator);
v294 = function(_)
    -- upvalues: v83 (ref), v11 (ref)
    local v382 = entity.get_local_player();
    if v382 == nil then
        return;
    else
        local v383 = math.sqrt(v382.m_vecVelocity.x * v382.m_vecVelocity.x + v382.m_vecVelocity.y * v382.m_vecVelocity.y);
        if v83.other.jump_scout:get() and v383 < 2 then
            v11.ragebot.air_strafe:override(false);
        end;
        if not v83.other.jump_scout:get() then
            v11.ragebot.air_strafe:override();
        end;
        return;
    end;
end;
v295 = nil;
v296 = {};
do
    local l_v296_0, l_v297_1, l_v298_1 = v296, v297, v298;
    l_v297_1 = function(v387)
        -- upvalues: l_v296_0 (ref)
        local v388 = {
            player = v387, 
            last_simtime = 0, 
            origin = v387:get_origin(), 
            breaking_lc = false, 
            defensive_active_until = 0, 
            defensive = false
        };
        v388.update = function()
            -- upvalues: v387 (ref), v388 (ref)
            local v389 = to_ticks(v387.m_flSimulationTime);
            local v390 = v387:get_origin();
            local v391 = v389 - v388.last_simtime;
            if v391 < 0 then
                v388.defensive_active_until = globals.tickcount + math.abs(v391);
            else
                v388.breaking_lc = (v388.origin - v390):length2dsqr() > 4096;
                v388.origin = v390;
            end;
            v388.last_simtime = v389;
            v388.defensive = v388.defensive_active_until > globals.tickcount;
        end;
        l_v296_0[v387] = v388;
        return v388;
    end;
    l_v298_1 = {
        [1] = 0, 
        [2] = 0.33566926072059, 
        [3] = 0.90550823109139, 
        [4] = 1.7094571925458, 
        [5] = 2.7475758645732, 
        [6] = 4.0198045277169, 
        [7] = 5.5243356897069, 
        [8] = 7.2423273783409, 
        [9] = 9.1564213090631, 
        [10] = 11.250673856852, 
        [11] = 13.510480438002, 
        [12] = 15.922361837797, 
        [13] = 18.473989413581, 
        [14] = 21.153990043142, 
        [15] = 23.951936812474, 
        [16] = 26.858254779359, 
        [17] = 29.864120158319, 
        [18] = 32.961441695549, 
        [19] = 36.142785057665, 
        [20] = 39.401338315411, 
        [21] = 42.730817707458, 
        [22] = 46.125502156263, 
        [23] = 49.580063421207, 
        [24] = 53.08964170921, 
        [25] = 56.649735547569, 
        [26] = 60.256252190999, 
        [27] = 63.905432011078, 
        [28] = 67.59383918326, 
        [29] = 71.318242246617, 
        [30] = 75.075708340563, 
        [31] = 78.863628408227, 
        [32] = 82.67942790961, 
        [33] = 86.520915828495, 
        [34] = 90.385926351936, 
        [35] = 94.272651987509, 
        [36] = 98.17890171902, 
        [37] = 102.08515145053, 
        [38] = 105.99140118205, 
        [39] = 109.89765091356, 
        [40] = 113.80390064508, 
        [41] = 117.7101503766, 
        [42] = 121.61640010812, 
        [43] = 125.52264983965, 
        [44] = 129.42889957117, 
        [45] = 133.3351493027, 
        [46] = 137.24139903422, 
        [47] = 141.14764876575, 
        [48] = 145.05389849727, 
        [49] = 148.9601482288, 
        [50] = 152.86639796033, 
        [51] = 156.77264769186, 
        [52] = 160.67889742339, 
        [53] = 164.58514715492, 
        [54] = 168.49139688645, 
        [55] = 172.39764661798, 
        [56] = 176.30389634951, 
        [57] = 180.21014608104, 
        [58] = 184.11639581258, 
        [59] = 188.02264554411, 
        [60] = 191.92889527564, 
        [61] = 195.83514500718, 
        [62] = 199.74139473871, 
        [63] = 203.64764447024, 
        [64] = 207.55389420178
    };
    local function v396(v392, v393, v394)
        -- upvalues: l_v298_1 (ref)
        local v395 = v393 / 250;
        return v392 * v395 <= l_v298_1[v394] * v395;
    end;
    local v397 = {};
    local v398 = {
        peeking_points = {}
    };
    local function v401(v399, v400)
        -- upvalues: v397 (ref)
        if type(v399) ~= "table" then
            v399 = {
                [1] = v399
            };
        end;
        v397[v400:get_name()] = v399;
    end;
    local function v403(v402)
        -- upvalues: v398 (ref)
        v398.peeking_points = v402;
    end;
    local v404 = {
        limbs = 4, 
        chest = 3, 
        stomach = 2, 
        head = 1
    };
    local v405 = {
        [1] = {
            [1] = 0
        }, 
        [2] = {
            [1] = 2, 
            [2] = 3, 
            [3] = 4
        }, 
        [3] = {
            [1] = 5, 
            [2] = 6
        }, 
        [4] = {
            [1] = 13, 
            [2] = 14, 
            [3] = 15, 
            [4] = 16, 
            [5] = 17, 
            [6] = 18, 
            [7] = 7, 
            [8] = 8, 
            [9] = 9, 
            [10] = 10, 
            [11] = 11, 
            [12] = 1
        }
    };
    local v406 = {
        last_seen = 0, 
        found_position_dist = 1, 
        autopeek_position = vector(0, 0, 0), 
        found_position = vector(0, 0, 0)
    };
    local v407 = nil;
    local function v408()
        -- upvalues: v406 (ref)
        v406.last_seen = 0;
        v406.found_position = vector(0, 0, 0);
    end;
    local function v417()
        -- upvalues: v407 (ref)
        local v409 = render.screen_size() / 2;
        local l_huge_0 = math.huge;
        local v411 = nil;
        local v412 = entity.get_players(true);
        for v413 = 1, #v412 do
            local v414 = v412[v413];
            if v414 ~= nil and v414:is_alive() and not v414:is_dormant() then
                local v415 = v414:get_origin():to_screen();
                if v415 ~= nil and v415.x ~= nil and v415.y ~= nil then
                    local v416 = (v415 - v409):length();
                    if v416 < l_huge_0 then
                        l_huge_0 = v416;
                        v411 = v414;
                    end;
                end;
            end;
        end;
        v407 = v411;
    end;
    local function v433(v418, v419, v420)
        local v421 = v418:get_origin();
        local v422 = entity.get_local_player();
        local l_y_5 = (v421 - v422:get_origin()):angles().y;
        local v424 = 5;
        local v425 = {};
        for v426 = -1, 1, 2 do
            local v427 = l_y_5 + 90 * v426;
            local v428 = math.rad(v427);
            local v429 = math.cos(v428);
            local v430 = math.sin(v428);
            local v431 = v419 + vector(v429 * v424, v430 * v424, 0);
            local v432 = v419 + (v419 - v431) * (1 - utils.trace_line(v431, v419, v422).fraction) * v420;
            table.insert(v425, v432);
        end;
        return v425;
    end;
    local function v441(v434, v435, v436)
        -- upvalues: v433 (ref)
        local v437 = entity.get_local_player();
        local v438 = v433(v434, v435, v436);
        local v439 = v435 + vector(0, 0, -5);
        local v440 = v435 + (v435 - v439) * (1 - utils.trace_line(v439, v435, v437).fraction) * v436;
        table.insert(v438, v440);
        return v438;
    end;
    local function v467(v442)
        -- upvalues: v405 (ref), v404 (ref), v441 (ref), v433 (ref)
        local v443 = {};
        local v444 = {};
        local v445 = true;
        local v446 = {
            limbs = 3, 
            chest = true, 
            stomach = true, 
            head = true
        };
        local v447 = {
            limbs = false, 
            head = v445, 
            chest = v445, 
            stomach = v445
        };
        local v448 = {
            limbs = 0, 
            chest = 0.6, 
            stomach = 0.65, 
            head = 0.8
        };
        if v446.head then
            local v449 = v405[v404.head];
            for v450 = 1, #v449 do
                local v451 = v442:get_hitbox_position(v449[v450]);
                if not v447.head then
                    table.insert(v443, v451);
                    table.insert(v444, "head");
                else
                    local v452 = v441(v442, v451, v448.head);
                    for v453 = 1, #v452 do
                        table.insert(v443, v452[v453]);
                        table.insert(v444, "head");
                    end;
                end;
            end;
        end;
        if v446.chest then
            local v454 = v405[v404.chest];
            for v455 = 1, #v454 do
                local v456 = v442:get_hitbox_position(v454[v455]);
                if not v447.chest then
                    table.insert(v443, v456);
                    table.insert(v444, "chest");
                else
                    local v457 = v433(v442, v456, v448.chest);
                    for v458 = 1, #v457 do
                        table.insert(v443, v457[v458]);
                        table.insert(v444, "chest");
                    end;
                end;
            end;
        end;
        if v446.stomach then
            local v459 = v405[v404.stomach];
            for v460 = 1, #v459 do
                local v461 = v442:get_hitbox_position(v459[v460]);
                if not v447.stomach then
                    table.insert(v443, v461);
                    table.insert(v444, "stomach");
                else
                    local v462 = v433(v442, v461, v448.stomach);
                    for v463 = 1, #v462 do
                        table.insert(v443, v462[v463]);
                        table.insert(v444, "stomach");
                    end;
                end;
            end;
        end;
        if v446.limbs then
            local v464 = v405[v404.limbs];
            for v465 = 1, #v464 do
                local v466 = v442:get_hitbox_position(v464[v465]);
                table.insert(v443, v466);
                table.insert(v444, "limb");
            end;
        end;
        return {
            [1] = v443, 
            [2] = v444
        };
    end;
    local function v485(v468)
        -- upvalues: v83 (ref)
        local v469 = v468:get_origin();
        local v470 = v468:get_eye_position();
        local l_y_6 = render.camera_angles().y;
        local v472 = v470.z - v469.z;
        local v473 = v83.other.aipeekbot.dot_offset:get();
        local v474 = v83.other.aipeekbot.dot_amount:get();
        local v475 = v83.other.aipeekbot.dot_span:get() / v474;
        local v476 = {};
        for v477 = -1, 1, 2 do
            local v478 = l_y_6 + 90 * v477;
            local v479 = vector(math.cos(math.rad(v478)), math.sin(math.rad(v478)), 0);
            for v480 = 1, v474 do
                local v481 = v470 + v479 * (v475 * v480) + v479 * v473;
                local v482 = utils.trace_line(v481, v481 + vector(0, 0, -200), v468);
                if v482.fraction < 1 then
                    local v483 = v482.end_pos + vector(0, 0, v472);
                    if v483.z - v469.z > 40 then
                        v480 = v474;
                    end;
                    v481 = v483;
                end;
                v482 = utils.trace_line(v470, v481, entity.get_players());
                if v482.fraction == 1 then
                    table.insert(v476, v481);
                else
                    local v484 = v470 + (v479 * (v475 * v480) + v479 * v473) * v482.fraction - v479 * 19;
                    v484.z = v481.z;
                    table.insert(v476, v484);
                    break;
                end;
            end;
        end;
        return v476;
    end;
    local function v504(v486, v487, v488, v489, _)
        -- upvalues: v406 (ref)
        local v491 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
        local _ = color("FFABBC"):to_hex();
        local _ = color("ABB3FF"):to_hex();
        if v491 > 100 then
            v491 = v488.m_iHealth + (v491 - 100);
        end;
        for v494 = 1, #v489 do
            local v495 = v489[1][v494];
            local v496, v497 = utils.trace_bullet(v486, v487, v495, v486);
            local l_entity_0 = v497.entity;
            if l_entity_0 ~= nil then
                local _ = l_entity_0:get_name();
                local l_m_iHealth_2 = l_entity_0.m_iHealth;
                local v501 = v496 - v491;
                if v501 > 0 then
                    v501 = "\a00FF00FF+" .. v501;
                else
                    v501 = "\aFF0000FF" .. v501;
                end;
                if l_entity_0 and l_entity_0 == v488 then
                    local l_v491_0 = v491;
                    if v491 > 100 then
                        l_v491_0 = l_m_iHealth_2 + (v491 - 100);
                    end;
                    if l_m_iHealth_2 <= v496 or l_v491_0 < v496 then
                        v406.found_position = v487;
                        v406.found_position_dist = (v406.autopeek_position - v406.found_position):length2d();
                        return true, v487, l_entity_0;
                    end;
                elseif l_entity_0 ~= nil and l_entity_0:is_alive() then
                    local l_v491_1 = v491;
                    if v491 > 100 then
                        l_v491_1 = l_m_iHealth_2 + (v491 - 100);
                    end;
                    if l_m_iHealth_2 <= v496 or l_v491_1 < v496 then
                        v406.found_position = v487;
                        return true, v487, l_entity_0;
                    end;
                end;
            end;
        end;
        return false;
    end;
    local function v514(v505, v506, v507, v508)
        -- upvalues: v398 (ref), v504 (ref)
        for v509 = 1, #v506 do
            local v510 = v506[v509];
            v398.found_point = v509;
            local v511, v512, v513 = v504(v505, v510, v507, v508, true);
            if v511 then
                return true, v512, v513;
            end;
        end;
        v398.found_point = nil;
        return false, nil, nil;
    end;
    local function v524(v515, v516)
        local v517 = v515.m_flVelocityModifier < 0.9;
        local v518 = v516.in_moveleft == 1 or not (v516.in_moveright ~= 1) or not (v516.in_back ~= 1) or not (v516.in_forward ~= 1) or v516.in_jump == 1;
        local v519 = entity.get_local_player():get_player_weapon();
        local v520 = false;
        if v519 then
            local v521 = v519.m_bInReload == 1;
            local v522 = v519.m_flNextPrimaryAttack < globals.curtime;
            if not v521 and v522 then
                v520 = true;
            end;
        end;
        local l_v520_0 = v520;
        return not (not not v517 or v518) and v520 and true or not not l_v520_0;
    end;
    local function v533(v525, v526, v527, v528)
        local v529 = v527:dist(v528) + 5;
        v528 = v527 + (v528 - v527):normalized() * (v529 + 5);
        if v525.forwardmove == 0 and v525.sidemove == 0 and not v525.in_forward and not v525.in_back and not v525.in_moveleft and not v525.in_moveright and v529 >= 0.5 then
            local l_y_7 = (v528 + (v528 - v527):normalized() * 10 - v527):angles().y;
            if l_y_7 == nil then
                return;
            else
                v525.move_yaw = l_y_7;
                v525.in_speed = 0;
                local v531 = 0;
                v525.in_moveright = 0;
                v525.in_moveleft = v531;
                v525.sidemove = 0;
                if v529 > 8 then
                    v525.forwardmove = 900000;
                else
                    v531 = math.min(450, math.max(1.1 + v526.m_flDuckAmount * 10, v529 * 9));
                    local v532 = v526.m_vecAbsVelocity:length2d();
                    if math.min(250, v531) + 15 <= v532 then
                        v525.forwardmove = 0;
                        v525.in_forward = 0;
                    else
                        v525.forwardmove = math.max(6, math.min(250, v531) <= v532 and v531 * 0.9 or v531);
                        v525.in_forward = 1;
                    end;
                end;
            end;
        end;
    end;
    local function v537(v534)
        -- upvalues: v406 (ref), v533 (ref)
        local v535 = entity.get_local_player();
        local v536 = v535:get_eye_position();
        v406.found_position.z = v536.z;
        v533(v534, v535, v536, v406.found_position);
    end;
    local function v541(v538)
        -- upvalues: v533 (ref), v406 (ref)
        local v539 = entity.get_local_player();
        local v540 = v539:get_eye_position();
        v533(v538, v539, v540, v406.autopeek_position);
    end;
    local v542 = {
        step = 0, 
        visual_step = 0, 
        state = "disabled"
    };
    local function v544(v543)
        -- upvalues: v542 (ref)
        v542.state = v543;
    end;
    local v545 = {
        DT_NOT_CHARGED = 8, 
        NO_ENEMIES = 7, 
        WAITING_FOR_SHOT = 6, 
        RETREATING = 5, 
        PEEKING = 4, 
        CHECKING_HITPOINTS = 3, 
        SEARCHING_HITPOINTS = 2, 
        FINDING_TARGET = 1, 
        IDLE = 0
    };
    local _ = {
        [v545.IDLE] = "idle", 
        [v545.FINDING_TARGET] = "finding target", 
        [v545.SEARCHING_HITPOINTS] = "searching hitpoints", 
        [v545.CHECKING_HITPOINTS] = "checking hitpoints", 
        [v545.PEEKING] = "peeking", 
        [v545.RETREATING] = "retreating", 
        [v545.WAITING_FOR_SHOT] = "waiting for shot", 
        [v545.NO_ENEMIES] = "no enemies", 
        [v545.DT_NOT_CHARGED] = "dt not charged"
    };
    local v547 = {
        CHECKING_HITPOINTS = 3, 
        SEARCHING_HITPOINTS = 2, 
        FINDING_TARGET = 1, 
        IDLE = 0, 
        RETREATING = 5, 
        PEEKING = 4
    };
    local function v549(v548)
        -- upvalues: v542 (ref)
        v542.step = v548;
    end;
    local function v551(v550)
        -- upvalues: v542 (ref)
        v542.visual_step = v550;
    end;
    local v552 = {};
    local function v572(v553)
        -- upvalues: v83 (ref), v406 (ref), v552 (ref), v485 (ref), v408 (ref), v544 (ref), v549 (ref), v547 (ref), v551 (ref), v545 (ref), v403 (ref), v396 (ref), v524 (ref), v504 (ref), v467 (ref), v537 (ref), v541 (ref), v407 (ref), l_v296_0 (ref), l_v297_1 (ref), v401 (ref), v514 (ref)
        local v554 = entity.get_local_player();
        if not v554 then
            return;
        else
            local l_m_vecOrigin_0 = v554.m_vecOrigin;
            local v556 = v83.other.aipeekbot.bindbutton:get();
            ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):override(v556);
            if not v556 then
                v406.autopeek_position = l_m_vecOrigin_0;
                v552 = v485(v554);
                v408();
                v544("disabled");
                v549(v547.IDLE);
                v551(v545.IDLE);
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):override();
                return;
            else
                v403(v552);
                v544("idle");
                local v557 = (v406.autopeek_position - v406.found_position):length2d();
                local v558 = v396(v557, 250, 24);
                local v559 = v524(v554, v553);
                local v560 = v406.last_peek_pos ~= nil and v406.last_peek_ent ~= nil and v406.last_peek_ent:is_player() and v406.last_peek_ent:is_alive() and v504(v554, v406.last_peek_pos, v406.last_peek_ent, v467(v406.last_peek_ent));
                if (v406.last_seen + 24 >= globals.tickcount or v560) and v558 and v559 then
                    v537(v553);
                    v544("peeking");
                    v549(v547.PEEKING);
                    v551(v545.PEEKING);
                    return;
                elseif (v406.autopeek_position - l_m_vecOrigin_0):length2d() > 5 then
                    v541(v553);
                    v544("retreating");
                    v549(v547.RETREATING);
                    v551(v545.RETREATING);
                    return;
                elseif not v559 then
                    v549(v547.IDLE);
                    v551(v545.WAITING_FOR_SHOT);
                    return;
                else
                    local v561 = entity.get_players(true) or {
                        [1] = v407
                    };
                    if #v561 == 0 or v561[1] == nil then
                        v408();
                        v544("idle");
                        v549(v547.IDLE);
                        v551(v545.NO_ENEMIES);
                        return;
                    else
                        if v559 then
                            v549(v547.FINDING_TARGET);
                            v551(v545.FINDING_TARGET);
                        end;
                        for v562 = 1, #v561 do
                            local v563 = v561[v562];
                            if v563 and v563:is_alive() and not v563:is_dormant() then
                                local v564 = l_v296_0[v563];
                                if v564 == nil then
                                    v564 = l_v297_1(v563);
                                end;
                                v564.update();
                                local l_breaking_lc_0 = v564.breaking_lc;
                                local l_defensive_0 = v564.defensive;
                                local v567 = not l_breaking_lc_0 and not l_defensive_0;
                                local v568 = v467(v563);
                                v401(v568[1], v563);
                                v549(v547.SEARCHING_HITPOINTS);
                                v551(v545.SEARCHING_HITPOINTS);
                                if not v567 then
                                    v549(v547.CHECKING_HITPOINTS);
                                    v551(v545.CHECKING_HITPOINTS);
                                else
                                    local v569, v570, v571 = v514(v554, v552, v563, v568);
                                    if v569 then
                                        v406.last_seen = globals.tickcount;
                                        v406.last_peek_pos = v570;
                                        v406.last_peek_ent = v571;
                                        break;
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    events.createmove:set(v572);
    events.aim_fire:set(function()
        -- upvalues: v406 (ref)
        v406.last_seen = 0;
    end);
    local _ = 400;
    local _ = 400;
    local v575 = {
        last_pressed = 0, 
        animation_time = 0.2, 
        last_state = false
    };
    local function v578(v576)
        local v577 = 1.70158;
        return (v577 + 1) * v576 * v576 * v576 - v577 * v576 * v576;
    end;
    local function v581(v579, v580)
        render.circle(v579, color(255, 255, 255, 255), 5, 0, 1);
        if v580 then
            render.circle_outline(v579, color(0, 255, 0, 255), 6, 0, 1, 2);
        end;
    end;
    local function v589()
        -- upvalues: v83 (ref), v575 (ref), v578 (ref), v398 (ref), v581 (ref)
        local v582 = v83.other.aipeekbot.bindbutton:get();
        if v582 ~= v575.last_state then
            v575.last_pressed = globals.curtime;
            v575.last_state = v582;
        end;
        local v583 = globals.curtime - v575.last_pressed;
        v583 = math.min(v583, v575.animation_time);
        local v584 = v578(v583 / v575.animation_time);
        if not v582 then
            v584 = 1 - v584;
        end;
        if not v582 and v584 <= 0.1 then
            return;
        else
            local l_peeking_points_0 = v398.peeking_points;
            for v586 = 1, #l_peeking_points_0 do
                local v587 = l_peeking_points_0[v586];
                local v588 = render.world_to_screen(v587);
                if v588 ~= nil and v588.x ~= nil and v588.y ~= nil then
                    v581(v588, v398.found_point == v586);
                end;
            end;
            return;
        end;
    end;
    events.render:set(function()
        -- upvalues: v589 (ref), v83 (ref), v417 (ref)
        v589();
        if v83.other.aipeekbot.bindbutton:get() then
            v417();
        end;
    end);
    local function v591()
        -- upvalues: v552 (ref), v485 (ref), v403 (ref)
        local v590 = entity.get_local_player();
        if not v590 then
            return;
        else
            v552 = v485(v590);
            v403(v552);
            return;
        end;
    end;
    v83.other.aipeekbot.dot_amount:set_callback(v591);
    v83.other.aipeekbot.dot_offset:set_callback(v591);
    v83.other.aipeekbot.dot_span:set_callback(v591);
end;
v296 = {};
v297 = {};
v83.other.fakelatency:set_callback(function(v592)
    if not v592:get() then
        return;
    else
        local l_sv_maxunlag_0 = cvar.sv_maxunlag;
        if v592:get() then
            l_sv_maxunlag_0:float(0.4, true);
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v592:get());
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
        else
            l_sv_maxunlag_0:float(0.2, true);
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(0);
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
        end;
        return;
    end;
end);
v298 = function()
    -- upvalues: v83 (ref), v11 (ref)
    if v83.other.random_fakelag:get() then
        v11.antiaim.fakelag.limit:override(math.random(1, 14));
        v11.antiaim.fakelag.variability:override(math.random(1, 100));
    else
        v11.antiaim.fakelag.limit:override();
        v11.antiaim.fakelag.variability:override();
    end;
    if v11.antiaim.angels.fake_duck:get() then
        v11.antiaim.fakelag.limit:override();
        v11.antiaim.fakelag.variability:override();
    end;
end;
local function v594()
    -- upvalues: v83 (ref), v11 (ref)
    if v83.other.aimbot_helper:get() == "Disabled" then
        v11.ragebot.override_resolver:override();
    end;
    if v83.other.aimbot_helper:get() == "Default" then
        v11.ragebot.override_resolver:override(true);
    end;
    if v83.other.aimbot_helper:get() == "Random" then
        v11.ragebot.override_resolver:override(math.random(0, 1) == 1);
    end;
end;
local function v595()
    -- upvalues: v83 (ref), v11 (ref)
    if v83.other.predictiv:get() then
        v11.ragebot.body_aim:override("Default");
        v11.ragebot.safe_points:override("Default");
        v11.ragebot.hitchance:override(math.random(35, 50));
        v11.ragebot.override_resolver:override(true);
        v11.ragebot.headscale:override(0);
        v11.ragebot.bodyscale:override(0);
    else
        v11.ragebot.body_aim:override();
        v11.ragebot.safe_points:override();
        v11.ragebot.hitchance:override();
        v11.ragebot.override_resolver:override();
        v11.ragebot.headscale:override();
        v11.ragebot.bodyscale:override();
    end;
end;
do
    local l_v294_1, l_v296_1, l_v297_2, l_v298_2, l_v594_0, l_v595_0 = v294, v296, v297, v298, v594, v595;
    events.createmove:set(function(v602)
        -- upvalues: l_v298_2 (ref), l_v595_0 (ref), l_v594_0 (ref), l_v294_1 (ref)
        l_v298_2();
        l_v595_0();
        l_v594_0();
        l_v294_1(v602);
    end);
    local function v604(v603)
        -- upvalues: v83 (ref)
        if not v83.other.fastladder:get() then
            return;
        else
            if entity.get_local_player().m_MoveType == 9 then
                if v603.forwardmove > 0 and render.camera_angles().x < 45 then
                    v603.view_angles.x = 89;
                    v603.in_moveright = 1;
                    v603.in_moveleft = 0;
                    v603.in_forward = 0;
                    v603.in_back = 1;
                    if v603.sidemove == 0 then
                        v603.view_angles.y = v603.view_angles.y + 90;
                    end;
                    if v603.sidemove < 0 then
                        v603.view_angles.y = v603.view_angles.y + 150;
                    end;
                    if v603.sidemove > 0 then
                        v603.view_angles.y = v603.view_angles.y + 30;
                    end;
                end;
                if v603.forwardmove < 0 then
                    v603.view_angles.x = 89;
                    v603.in_moveleft = 1;
                    v603.in_moveright = 0;
                    v603.in_forward = 1;
                    v603.in_back = 0;
                    if v603.sidemove == 0 then
                        v603.view_angles.y = v603.view_angles.y + 90;
                    end;
                    if v603.sidemove > 0 then
                        v603.view_angles.y = v603.view_angles.y + 150;
                    end;
                    if v603.sidemove < 0 then
                        v603.view_angles.y = v603.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function _()
        -- upvalues: v83 (ref)
        if not v83.other.cvaroptimization:get() then
            return;
        else
            if v83.other.cvaroptimization:get() then
                cvar.r_3dsky:int(0);
                cvar.fog_enable:int(0);
                cvar.fog_enable_water_fog:int(0);
                cvar.r_shadows:int(0);
                cvar.cl_csm_static_prop_shadows:int(0);
                cvar.cl_csm_shadows:int(0);
                cvar.cl_csm_world_shadows:int(0);
                cvar.cl_foot_contact_shadows:int(0);
                cvar.cl_csm_viewmodel_shadows:int(0);
                cvar.cl_csm_rope_shadows:int(0);
                cvar.cl_csm_sprite_shadows:int(0);
                cvar.cl_csm_translucent_shadows:int(0);
                cvar.cl_csm_entity_shadows:int(0);
                cvar.cl_csm_world_shadows_in_viewmodelcascade:int(0);
                cvar.violence_hblood:int(0);
                cvar.r_drawdecals:int(0);
                cvar.r_drawropes:int(0);
                cvar.r_drawsprites:int(0);
                cvar.mat_disable_bloom:int(0);
                cvar.r_dynamic:int(0);
                cvar.r_eyegloss:int(0);
                cvar.r_eyes:int(0);
                cvar.r_drawtracers_firstperson:int(0);
                cvar.r_dynamiclighting:int(0);
            end;
            return;
        end;
    end;
    l_v296_1.trace = function(v606, v607)
        local v608 = v606:get_origin();
        for v609 = 0, math.pi * 2, math.pi * 2 / 8 do
            local v610 = math.sin(v609);
            local v611 = math.cos(v609);
            local v612 = v608.x + v611 * 10;
            local v613 = v608.y + v610 * 10;
            local v614 = vector(v612, v613, v608.z);
            local v615 = v614:clone();
            v615.z = v615.z - v607;
            if utils.trace_line(v614, v615, v606).fraction ~= 1 then
                return true;
            end;
        end;
        return false;
    end;
    l_v296_1.setup = function(v616)
        -- upvalues: v83 (ref), l_v296_1 (ref)
        if not v83.other.nofalldamage:get() then
            return;
        else
            local v617 = entity.get_local_player();
            if v617 == nil then
                return;
            elseif v617.m_vecVelocity.z >= -500 then
                nfldstate = false;
                return;
            else
                if l_v296_1.trace(v617, 15) then
                    nfldstate = false;
                elseif l_v296_1.trace(v617, 75) then
                    nfldstate = true;
                end;
                v616.in_duck = nfldstate;
                return;
            end;
        end;
    end;
    l_v297_2.texts = {
        [1] = "\208\186\209\130\208\190 \209\130\208\178\208\190\208\185 \209\143\208\183\209\139\208\186 \208\186\209\128\208\190\208\188\208\181 \208\191\208\184\208\180\208\190\209\128\208\176", 
        [2] = "\209\129\208\188\208\190\209\130\209\128\208\184 \209\137\208\176\209\129 \208\190\208\191\208\191\208\190\208\189\208\181\208\189\209\130 \208\178\208\190\209\129\209\129\209\130\208\176\208\189\208\181\209\130 \208\178\208\190 \208\178\209\129\208\181\209\133 \208\178\209\128\208\181\208\188\208\181\208\189\208\176\209\133 \208\184 \209\129\208\186\208\176\208\182\208\181\209\130 \209\129 \209\133\209\131\208\181\208\188 \208\178 \208\182\208\190\208\191\208\181", 
        [3] = "\209\135\209\130\208\190 \208\178 \209\133\209\131\208\185 \209\131 \208\188\208\181\208\189\209\143 \209\128\208\190\209\130 \209\130\208\178\208\190\208\185", 
        [4] = "\209\128\208\176\209\129\209\129\208\186\208\176\208\182\208\184 \208\186\208\176\208\186 \209\130\208\181\208\177\209\143 \209\143 \208\178\209\139\208\181\208\177\208\176\208\187 \209\130\208\176\208\191\208\190\208\188", 
        [5] = "\208\191\209\128\208\190\208\181\208\177\209\139\208\178\208\176\208\181\209\136\209\140 \208\188\208\176\208\191\209\131 \209\129\208\187\208\190\208\178\208\190\208\188 \208\186\208\176\208\186\208\184\208\188", 
        [6] = "\208\186\209\130\208\190 \208\178 \209\130\209\143 \209\133\208\176\209\128\208\186\208\176\208\187? \209\131 \208\188\208\181\208\189\209\143 \208\188\208\181\208\182\208\180\209\131 \208\189\208\190\208\179 \209\130\209\128\208\184\208\177\209\131\208\189\209\139, \208\176 \209\130\209\139 \208\190\209\128\208\176\209\130\208\190\209\128, \208\191\209\128\208\190\208\180\208\190\208\187\208\182\208\176\208\185. \209\130\208\178\208\190\208\185 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189 \209\141\209\130\208\190 \208\188\208\190\208\185 \209\133\209\131\208\185", 
        [7] = "\209\129\208\181\208\179\208\190\208\180\208\189\209\143 \208\183\208\176\209\132\208\181\208\185\208\187\208\184\209\136\209\129\209\143 \209\131 \209\130\208\181\208\177\209\143 \208\188\208\176\209\130\209\140 \209\136\208\187\209\142\209\133\208\176 \209\131 \208\178\209\129\208\181\209\133 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140, \209\135\208\181 \208\188\208\176\208\188\208\181?", 
        [8] = "\208\182\208\190\208\191\209\131 \209\130\208\178\208\190\209\142 \209\129 \209\133\209\131\209\143 \209\129\208\189\208\184\208\188\208\176\208\187 \209\136\208\190 \208\189\208\176 \208\187\208\184\209\134\208\181 \209\131 \209\130\208\181\208\177\209\143?", 
        [9] = "\208\167\209\130\208\190 \209\130\208\181\208\177\209\143 \209\130\209\128\208\176\209\133\208\176\208\181\209\130 \208\167\209\130\208\190 \208\178\208\181\208\189\208\190\208\183\208\189\208\190\208\188\209\131 \209\128\209\131\209\129\208\184\208\186\209\131 \208\178 \208\180\208\184\208\186\208\176\209\135\208\184\208\189\209\131 \208\186\209\130\208\190 \209\130\209\128\208\190\208\179\208\176\208\181\209\130 \209\130\208\181\208\177\209\143?"
    };
    l_v297_2.delay = 1.2;
    l_v297_2.say = function(v618, v619)
        return utils.execute_after(v618, function()
            -- upvalues: v619 (ref)
            utils.console_exec("say " .. v619);
        end);
    end;
    l_v297_2.player_death = function(v620)
        -- upvalues: v83 (ref), l_v297_2 (ref)
        if not v83.other.trashtalk:get() then
            return;
        else
            local v621 = entity.get_local_player();
            local v622 = entity.get(v620.userid, true);
            local v623 = entity.get(v620.attacker, true);
            if v622 ~= v623 and v623 == v621 then
                local v624 = l_v297_2.texts[math.random(1, #l_v297_2.texts)];
                l_v297_2.say(l_v297_2.delay, v624);
            end;
            return;
        end;
    end;
    events.player_death:set(l_v297_2.player_death);
    events.createmove:set(function(v625)
        -- upvalues: v604 (ref), l_v296_1 (ref), v83 (ref), v11 (ref)
        v604(v625);
        l_v296_1.setup(v625);
        local v626 = entity.get_local_player();
        if v626 == nil or not v626:is_alive() then
            return;
        else
            local v627 = v626:get_player_weapon();
            if not v627 or v627 == nil then
                return;
            else
                local v628 = v627:get_weapon_info();
                if not v628 or v628 == nil then
                    return;
                else
                    local _ = v628.weapon_type == 9;
                    if not v83.other.nade_throw_fix:get() then
                        return;
                    else
                        local v630 = entity.get_local_player();
                        if v630 == nil or not v630:is_alive() then
                            return;
                        else
                            local v631 = v630:get_player_weapon();
                            if not v631 or v631 == nil then
                                return;
                            else
                                local v632 = v631:get_weapon_info();
                                if not v632 or v632 == nil then
                                    return;
                                else
                                    if v632.weapon_type == 9 then
                                        v11.ragebot.weapon_actions:override("");
                                    else
                                        v11.ragebot.weapon_actions:override();
                                    end;
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);
end;
v294 = nil;
v295 = 5;
v296 = nil;
v297 = nil;
v298 = nil;
v594 = nil;
v595 = nil;
local v633 = false;
local v634 = false;
local v635 = 1;
local v636 = 0;
local v637 = {
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
local v638 = {
    [1] = {
        hitbox = "Stomach", 
        scale = 5, 
        vec = vector(0, 0, 40)
    }, 
    [2] = {
        hitbox = "Chest", 
        scale = 6, 
        vec = vector(0, 0, 50)
    }, 
    [3] = {
        hitbox = "Head", 
        scale = 3, 
        vec = vector(0, 0, 58)
    }, 
    [4] = {
        hitbox = "Legs", 
        scale = 4, 
        vec = vector(0, 0, 20)
    }
};
local function v642(v639, v640)
    for v641 = 1, #v639 do
        if v639[v641] == v640 then
            return true;
        end;
    end;
    return false;
end;
local function v644(v643)
    return v643 >= 1 and v643 <= 6;
end;
local function v649()
    local v645 = {};
    local v646 = entity.get_player_resource();
    for v647 = 1, globals.max_players do
        local v648 = entity.get(v647);
        if v648 ~= nil and v646.m_bConnected[v647] and v648:is_enemy() and v648:is_dormant() then
            table.insert(v645, v648);
        end;
    end;
    return v645;
end;
local function v656(v650, v651, v652)
    local v653 = v650:to(v651):angles();
    local v654 = math.rad(v653.y + 90);
    local v655 = vector(math.cos(v654), math.sin(v654), 0) * v652;
    return {
        [1] = {
            text = "Middle", 
            vec = v651
        }, 
        [2] = {
            text = "Left", 
            vec = v651 + v655
        }, 
        [3] = {
            text = "Right", 
            vec = v651 - v655
        }
    };
end;
local function v664(v657, v658, v659, v660)
    local v661, v662 = utils.trace_bullet(v657, v658, v659, v660);
    if v662 ~= nil then
        local l_entity_1 = v662.entity;
        if l_entity_1 == nil then
            return 0, v662;
        elseif l_entity_1:is_player() and not l_entity_1:is_enemy() then
            return 0, v662;
        end;
    end;
    return v661, v662;
end;
do
    local l_v295_1, l_v296_2, l_v297_3, l_v298_3, l_v594_1, l_v595_1, l_v633_0, l_v634_0, l_v635_0, l_v636_0, l_v637_0, l_v638_0, l_v642_0, l_v644_0, l_v649_0, l_v656_0, l_v664_0 = v295, v296, v297, v298, v594, v595, v633, v634, v635, v636, v637, v638, v642, v644, v649, v656, v664;
    local function v721(v682)
        -- upvalues: v11 (ref), l_v636_0 (ref), l_v644_0 (ref), l_v649_0 (ref), v83 (ref), l_v635_0 (ref), l_v638_0 (ref), l_v642_0 (ref), l_v656_0 (ref), l_v664_0 (ref), l_v296_2 (ref), l_v298_3 (ref), l_v594_1 (ref), l_v297_3 (ref), l_v595_1 (ref), l_v295_1 (ref), l_v634_0 (ref)
        v11.ragebot.enable.da:override(false);
        local v683 = entity.get_local_player();
        if v683 == nil then
            return;
        else
            local v684 = v683:get_player_weapon();
            if v684 == nil then
                return;
            else
                local v685 = v684:get_weapon_info();
                if v685 == nil then
                    return;
                else
                    local v686 = v684:get_inaccuracy();
                    if v686 == nil then
                        return;
                    else
                        local l_tickcount_0 = globals.tickcount;
                        local v688 = v683:get_eye_position();
                        local l_current_0 = v683:get_simulation_time().current;
                        local v690 = bit.band(v683.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_0 < l_v636_0 then
                            return;
                        elseif v682.in_jump and not v690 then
                            return;
                        else
                            local l_weapon_type_0 = v685.weapon_type;
                            if not l_v644_0(l_weapon_type_0) or v684.m_iClip1 <= 0 then
                                return false;
                            else
                                local v692 = l_v649_0();
                                local v693 = v83.other.dormant_aimbot.hitboxes:get();
                                if l_tickcount_0 % #v692 ~= 0 then
                                    l_v635_0 = l_v635_0 + 1;
                                else
                                    l_v635_0 = 1;
                                end;
                                local v694 = v692[l_v635_0];
                                if v694 == nil then
                                    return;
                                else
                                    local v695 = v694:get_bbox();
                                    local v696 = v694:get_origin();
                                    local l_m_flDuckAmount_0 = v694.m_flDuckAmount;
                                    local v698 = v83.other.dormant_aimbot.hitchance:get();
                                    local v699 = v83.other.dormant_aimbot.damage:get();
                                    if v699 == -1 then
                                        v699 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
                                    end;
                                    if v699 > 100 then
                                        v699 = v699 - 100 + v694.m_iHealth;
                                    end;
                                    local v700 = {};
                                    for v701 = 1, #l_v638_0 do
                                        local v702 = l_v638_0[v701];
                                        local l_vec_0 = v702.vec;
                                        local l_scale_0 = v702.scale;
                                        local l_hitbox_0 = v702.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #v693 ~= 0 then
                                            if l_v642_0(v693, l_hitbox_0) then
                                                table.insert(v700, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v700, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v685.is_revolver and not (v684.m_flNextPrimaryAttack >= l_current_0) or math.max(v683.m_flNextAttack, v684.m_flNextPrimaryAttack, v684.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v706 = nil;
                                        local v707 = nil;
                                        if math.floor(v695.alpha * 100) + 5 <= v698 then
                                            return;
                                        else
                                            for v708 = 1, #v700 do
                                                local v709 = v700[v708];
                                                local v710 = l_v656_0(v688, v696 + v709.vec, v709.scale);
                                                for v711 = 1, #v710 do
                                                    local v712 = v710[v711];
                                                    local l_vec_1 = v712.vec;
                                                    local v715, v716 = l_v664_0(v683, v688, l_vec_1, function(v714)
                                                        -- upvalues: v694 (ref)
                                                        return v714 == v694;
                                                    end);
                                                    if (v716 == nil or not v716:is_visible()) and v715 ~= 0 and v699 < v715 then
                                                        v706 = l_vec_1;
                                                        v707 = v715;
                                                        l_v296_2 = v694;
                                                        l_v298_3 = v709.hitbox;
                                                        l_v594_1 = v715;
                                                        l_v297_3 = v712.text;
                                                        l_v595_1 = v695.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v706 and v707 then
                                                    break;
                                                end;
                                            end;
                                            if not v706 or not v707 then
                                                return;
                                            else
                                                local v717 = v688:to(v706):angles();
                                                v682.block_movement = 1;
                                                if v83.other.dormant_aimbot.auto_scope:get() then
                                                    local v718 = not v682.in_jump and v690;
                                                    local v719 = v683.m_bIsScoped or v683.m_bResumeZoom;
                                                    local v720 = v685.weapon_type == l_v295_1;
                                                    if not v719 and v720 and v718 then
                                                        v682.in_attack2 = true;
                                                    end;
                                                end;
                                                if v686 < 0.01 then
                                                    v682.view_angles = v717;
                                                    v682.in_attack = true;
                                                    l_v634_0 = true;
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
    local function v723(v722)
        -- upvalues: l_v634_0 (ref), l_v633_0 (ref), l_v296_2 (ref), l_v298_3 (ref), l_v594_1 (ref), l_v297_3 (ref), l_v595_1 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v722 (ref), l_v634_0 (ref), l_v633_0 (ref), l_v296_2 (ref), l_v298_3 (ref), l_v594_1 (ref), l_v297_3 (ref), l_v595_1 (ref)
            if entity.get(v722.userid, true) == entity.get_local_player() then
                if l_v634_0 and not l_v633_0 then
                    events.dormant_miss:call({
                        userid = l_v296_2, 
                        aim_hitbox = l_v298_3, 
                        aim_damage = l_v594_1, 
                        aim_point = l_v297_3, 
                        accuracy = l_v595_1
                    });
                end;
                l_v633_0 = false;
                l_v634_0 = false;
                l_v296_2 = nil;
                l_v298_3 = nil;
                l_v594_1 = nil;
                l_v297_3 = nil;
                l_v595_1 = nil;
            end;
        end);
    end;
    local function v729(v724)
        -- upvalues: l_v634_0 (ref), l_v633_0 (ref), l_v637_0 (ref), l_v297_3 (ref), l_v298_3 (ref), l_v594_1 (ref)
        local v725 = entity.get_local_player();
        local v726 = entity.get(v724.userid, true);
        local v727 = entity.get(v724.attacker, true);
        if v726 == nil or v727 ~= v725 then
            return;
        else
            local v728 = v726:get_bbox();
            if v728 == nil then
                return;
            else
                if v726:is_dormant() and l_v634_0 == true then
                    l_v633_0 = true;
                    events.dormant_hit:call({
                        userid = v726, 
                        attacker = v727, 
                        health = v724.health, 
                        armor = v724.armor, 
                        weapon = v724.weapon, 
                        dmg_health = v724.dmg_health, 
                        dmg_armor = v724.dmg_armor, 
                        hitgroup = v724.hitgroup, 
                        accuracy = v728.alpha, 
                        hitbox = l_v637_0[v724.hitgroup], 
                        aim_point = l_v297_3, 
                        aim_hitbox = l_v298_3, 
                        aim_damage = l_v594_1
                    });
                end;
                return;
            end;
        end;
    end;
    local function v730()
        -- upvalues: v11 (ref)
        v11.ragebot.enable.da:override();
    end;
    v83.other.dormant_aimbot:set_callback(function(v731)
        -- upvalues: v11 (ref), v730 (ref), v721 (ref), v723 (ref), v729 (ref)
        local v732 = v731:get();
        if not v732 then
            v11.ragebot.enable.da:override();
        end;
        events.shutdown(v730, v732);
        events.createmove(v721, v732);
        events.weapon_fire(v723, v732);
        events.player_hurt(v729, v732);
    end, true);
    local v733 = {
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
    smooth = function(v734, v735, v736)
        return v734 + (v735 - v734) * v736;
    end;
    local v737 = {
        notifications = {}, 
        session_info = {
            deaths = 0, 
            headshots = 0, 
            misses = 0, 
            hits = 0, 
            kills = 0
        }
    };
    local function v740(v738, v739)
        -- upvalues: v737 (ref)
        if v738 == "" then
            return;
        else
            table.insert(v737.notifications, {
                alpha = 0, 
                timer = 0, 
                string = v738, 
                color = v739
            });
            return;
        end;
    end;
    local function v741()
        return globals.frametime * 8;
    end;
    local function v748()
        -- upvalues: v737 (ref), v741 (ref)
        local l_x_5 = render.screen_size().x;
        local l_y_8 = render.screen_size().y;
        local v744 = 0;
        for v745, v746 in ipairs(v737.notifications) do
            local v747 = {
                Centered = {
                    background = {
                        starting = vector(l_x_5 / 2 - 8 - render.measure_text(1, nil, v746.string).x / 2, l_y_8 / 2 + 90 + v744), 
                        ending = vector(l_x_5 / 2 + render.measure_text(1, nil, v746.string).x + 7 - render.measure_text(1, nil, v746.string).x / 2, l_y_8 / 2 + 110 + v744)
                    }, 
                    text = {
                        position = vector(l_x_5 / 2 - render.measure_text(1, nil, v746.string).x / 2, l_y_8 / 2 + 93 + v744)
                    }
                }
            };
            v746.timer = v746.timer + 0.19 * render.measure_text(1, nil, v746.string).x * 0.0115 * v741() * 10;
            if math.max(0, render.measure_text(1, nil, v746.string).x + 1 - v746.timer) > 0 then
                v746.alpha = smooth(v746.alpha, 1, v741());
            end;
            render.shadow(v747.Centered.background.starting + 10, v747.Centered.background.ending - 10, color(255, 255, 255, v746.alpha * 130), 25, 0, 0);
            render.text(1, v747.Centered.text.position, color(255, 255, 255, v746.alpha * 255), nil, v746.string);
            if math.max(0, (render.measure_text(1, nil, v746.string) + 1 - v746.timer).x) == 0 or #v737.notifications > 5 then
                v746.alpha = smooth(v746.alpha, 0, v741() * 2);
            end;
            if v746.alpha < 0.01 or #v737.notifications > 5 then
                table.remove(v737.notifications, v745);
            end;
            v744 = math.floor(v744 + 25 * v746.alpha);
        end;
    end;
    local function v763(v749, _)
        -- upvalues: v83 (ref), v733 (ref), v740 (ref)
        if not v83.other.aimbot_logs:get() then
            return;
        else
            local v751 = v83.other.aimbot_logs.missswitch.color:get():to_hex();
            local v752 = v83.other.aimbot_logs.hitswitch.color:get():to_hex();
            local _ = entity.get_local_player();
            local v754 = entity.get(v749.target);
            local l_damage_0 = v749.damage;
            local l_wanted_damage_0 = v749.wanted_damage;
            local v757 = v733[v749.wanted_hitgroup];
            local l_hitchance_0 = v749.hitchance;
            local l_state_0 = v749.state;
            local l_backtrack_0 = v749.backtrack;
            if not v754 then
                return;
            elseif v754 == nil then
                return;
            else
                local _ = v754.m_iHealth;
                local v762 = v733[v749.hitgroup];
                if v83.other.aimbot_logs.hitswitch:get("\v\f<person-circle-exclamation>\r  hit") and l_state_0 == nil then
                    if not globals.is_connected and not globals.is_in_game then
                        return false;
                    else
                        if v83.other.aimbot_logs.loglist:get("Console") then
                            print_raw("                                 \a" .. v752 .. "Laura\aDEFAULT \194\183 Hit " .. v754:get_name() .. " in " .. v762 .. "(" .. v757 .. ")" .. " for " .. l_damage_0 .. "(" .. l_wanted_damage_0 .. ")" .. " damage" .. " [ hitchance: " .. l_hitchance_0 .. " | backtrack " .. l_backtrack_0 .. " ]");
                        end;
                        if v83.other.aimbot_logs.loglist:get("Screen") then
                            print_dev("\a" .. v752 .. "Laura\aDEFAULT \194\183 Hit " .. v754:get_name() .. " in " .. v762 .. "(" .. v757 .. ")" .. " for " .. l_damage_0 .. "(" .. l_wanted_damage_0 .. ")" .. " damage" .. " [ hitchance: " .. l_hitchance_0 .. " | backtrack " .. l_backtrack_0 .. " ]");
                        end;
                        if v83.other.aimbot_logs.loglist:get("Render") then
                            v740("\a" .. v752 .. ui.get_icon("check") .. "\aDEFAULT Hit \a" .. v752 .. v754:get_name() .. "'s\aDEFAULT in the \a" .. v752 .. v762 .. "\aDEFAULT for \a" .. v752 .. l_damage_0 .. "\aDEFAULT dmg", false);
                        end;
                    end;
                end;
                if v83.other.aimbot_logs.missswitch:get("\v\f<person-circle-question>\r  miss") and l_state_0 ~= nil then
                    if v83.other.aimbot_logs.loglist:get("Console") then
                        print_raw("                                 \a" .. v751 .. "Laura\aDEFAULT \194\183 Missed shot due to " .. v757 .. " at " .. v754:get_name() .. " in the " .. l_state_0 .. " for " .. l_wanted_damage_0 .. " damage" .. " [ hitchance: " .. l_hitchance_0 .. " | backtrack " .. l_backtrack_0 .. " ]");
                    end;
                    if v83.other.aimbot_logs.loglist:get("Screen") then
                        print_dev("\a" .. v751 .. "Laura\aDEFAULT \194\183 Missed shot due to " .. v757 .. " at " .. v754:get_name() .. " in the " .. l_state_0 .. " for " .. l_wanted_damage_0 .. " damage" .. " [ hitchance: " .. l_hitchance_0 .. " | backtrack " .. l_backtrack_0 .. " ]");
                    end;
                    if v83.other.aimbot_logs.loglist:get("Render") then
                        v740("\a" .. v751 .. ui.get_icon("xmark") .. "\aDEFAULT Missed \a" .. v751 .. v754:get_name() .. "\aDEFAULT due to \a" .. v751 .. l_state_0 .. "\aDEFAULT in the \a" .. v751 .. v757, false);
                    end;
                end;
                return;
            end;
        end;
    end;
    v740("\a61CBC8FF" .. ui.get_icon("hands-clapping") .. "\aDEFAULT  Welcome back, \a61CBC8FF" .. v31._lua.username .. "\aDEFAULT!");
    events.aim_ack:set(function(v764)
        -- upvalues: v763 (ref)
        v763(v764);
    end);
    events.render:set(function()
        -- upvalues: v748 (ref)
        v748();
    end);
    local function v770(v765)
        -- upvalues: v83 (ref)
        local v766 = v83.other.aimbot_logs.purchase.color:get():to_hex();
        local v767 = entity.get(v765.userid, true);
        if v767 == nil or not v767:is_enemy() then
            return;
        else
            local l_weapon_0 = v765.weapon;
            if l_weapon_0 == "weapon_unknown" then
                return;
            else
                local v769 = v767:get_name();
                if v83.other.aimbot_logs.purchase:get("\v\f<cart-shopping-fast>\r  Purchase") then
                    if v83.other.aimbot_logs.loglist:get("Console") then
                        print_raw("                                 \a" .. v766 .. "Laura\aDEFAULT \194\183 " .. v769 .. " bought " .. l_weapon_0 .. "");
                    end;
                    if v83.other.aimbot_logs.loglist:get("Screen") then
                        print_dev("\a" .. v766 .. "Laura\aDEFAULT \194\183 " .. v769 .. " bought " .. l_weapon_0 .. "");
                    end;
                end;
                return;
            end;
        end;
    end;
    smoothy_fov = nil;
    local function v772(v771)
        -- upvalues: v83 (ref), l_smoothy_0 (ref)
        if not v83.other.fov_animations:get() then
            return;
        else
            if smoothy_fov == nil then
                smoothy_fov = l_smoothy_0.new(v771.fov);
            end;
            v771.fov = smoothy_fov:update(0.05, v771.fov);
            return;
        end;
    end;
    events.item_purchase:set(v770);
    events.override_view:set(v772);
end;
v295 = nil;
v296 = function(v773, v774, v775, v776)
    v773.x = v773.x - 10 + math.abs(v773.x) / 9;
    local v777 = vector():angles(v773);
    local v778 = v776 * 1.25;
    local v779 = math.clamp(v774 * 0.9, 15, 750);
    local v780 = math.clamp(v775, 0, 1);
    v779 = v779 * smooth(0.3, 1, v780);
    local l_v777_0 = v777;
    for _ = 1, 8 do
        l_v777_0 = (v777 * (l_v777_0 * v779 + v778):length() - v778) / v779;
        l_v777_0:normalize();
    end;
    local v783 = l_v777_0.angles(l_v777_0);
    if v783.x > -10 then
        v783.x = 0.9 * v783.x + 9;
    else
        v783.x = 1.125 * v783.x + 11.25;
    end;
    return v783;
end;
do
    local l_v296_3 = v296;
    v25.createmove(function(v785)
        -- upvalues: v83 (ref), l_v296_3 (ref)
        if not v83.other.super_toss:get() then
            return;
        else
            local v786 = entity.get_local_player();
            if not v786 then
                return;
            else
                local v787 = v786:get_player_weapon();
                if not v787 then
                    return;
                else
                    local v788 = v787:get_weapon_info();
                    if not v788 or v788.weapon_type ~= 9 or v787.m_fThrowTime < globals.curtime or not v785.jitter_move then
                        return;
                    else
                        local v789 = v786:simulate_movement();
                        v789:think();
                        v785.view_angles = l_v296_3(v785.view_angles, v788.throw_velocity, v787.m_flThrowStrength, v789.velocity);
                        return;
                    end;
                end;
            end;
        end;
    end);
    v25.grenade_override_view(function(v790)
        -- upvalues: v83 (ref), l_v296_3 (ref)
        if not v83.other.super_toss:get() then
            return;
        else
            local v791 = entity.get_local_player();
            if not v791 then
                return;
            else
                local v792 = v791:get_player_weapon();
                if not v792 then
                    return;
                else
                    local v793 = v792:get_weapon_info();
                    if not v793 then
                        return;
                    else
                        v790.angles = l_v296_3(v790.angles, v793.throw_velocity, v792.m_flThrowStrength, v790.velocity);
                        return;
                    end;
                end;
            end;
        end;
    end);
end;
v296 = nil;
v296 = function(v794)
    -- upvalues: v83 (ref)
    local v795 = entity.get_local_player();
    if v795 == nil then
        return;
    elseif not v83.other.edge_stop:get() then
        return;
    else
        sim = v795:simulate_movement((v795:get_origin()));
        sim:think(5);
        if sim.velocity.z < 0 then
            v794.block_movement = 2;
        end;
        return;
    end;
end;
events.createmove:set(function(v796)
    -- upvalues: v296 (ref)
    v296(v796);
end);
v297 = function()
    -- upvalues: v83 (ref)
    local v797 = entity.get_local_player();
    if v797 == nil or not v797:is_alive() then
        return;
    elseif v83.other.keep_model_transparency:get() then
        return (not not v797.m_bIsScoped or v797.m_bResumeZoom) and 59 or 255;
    else
        return;
    end;
end;
events.localplayer_transparency:set(v297);
v83.antiaim.extra.avoidbackstab:tooltip("Automatically deploys your model so that your opponent cannot stab you in 1 hit.");
v83.antiaim.extra.safehead:tooltip("Changes the position of the head while flying with the knife.");
v83.antiaim.extra.forcedef:tooltip("Automatically makes your fakelag disappear at a certain character position.");
v83.antiaim.hotkeys.freestand:tooltip("Automatically rotates the character's body based on the opponent's position to avoid hs.");
v83.antiaim.hotkeys.manuals:tooltip("Allows you to independently rotate the character model at your discretion.");
animations_enable:tooltip("Changes the animation of your character.");
v83.other.hitchance_indicator:tooltip("You will see an inscription on your screen that shows your minimum hitchance.");
v83.other.damage_indicator:tooltip("You will see an inscription on your screen that shows your minimum damage.");
v83.other.hitmarker:tooltip("After the shot draws a cross showing the place where you hit the opponent.");
v83.other.clantag:tooltip("Includes a caption with the name of our lua in tab.");
v83.other.viewmodel:tooltip("Allows you to change the location of your hands.");
v83.other.scope_overlay:tooltip("Allows you to make a versatile scope for you.");
v83.other.aspectratio:tooltip("Allows you to stretch your resolution to your desired width.");
v83.other.aimbot_logs:tooltip("Gives information about your encounter with the enemy.");
v83.other.dormant_aimbot:tooltip("Helps the cheat to fire even if the wh on the opponent is absent.");
v83.other.fakelatency:tooltip("Makes your ping much higher, which allows for a higher chance of backtracking.");
v83.other.keep_model_transparency:tooltip("Leaves your model transparent even after a shot, but until you exit the scope.");
v83.other.nofalldamage:tooltip("Tries to minimize the resulting damage from the fall.");
v83.other.fastladder:tooltip("Makes your stair climbing much faster.");
v83.other.nade_throw_fix:tooltip("Automatically turns off the quick switch feature so that your grenades are thrown without delay.\n\n             \aFF3C3CFF( Can break supertoss )");
v83.other.super_toss:tooltip("Makes your grenades fly with less dispersion.");
v83.other.SideIndicators:tooltip("Creates indicators on the left side of the screen, they help you navigate the buttons used.");
v83.other.trashtalk:tooltip("Sends messages in chat, these messages provoke the opponent.");
v83.other.decreaseholdaimticks:tooltip("Makes Reducing the hold time of the scope.");
v83.other.edge_stop:tooltip("Automatically stops you at the extreme point so you don't fall off the object.");
v83.other.fov_animations:tooltip("Makes the aiming animation smooth.");
v83.antiaim.extra.warmupaa:tooltip("Disables your anti-aims during warmup.");
v83.antiaim.hotkeys.lag_exploit:tooltip("Automatically pushes back dt to make opponents missal into your fakelag.");
v83.other.aimbot_helper:tooltip("Improves your aimbot's thinking, allowing you to make fewer blunders.");
v83.other.cvaroptimization:tooltip("Increases the level of fps in the game.");
v83.other.random_fakelag:tooltip("Broke your fakelag, do more miss to you.");
v83.other.predictiv:tooltip("Do your shots more fast and do predict of cheat better.");
v83.other.net_graph:disabled(true);
v298 = l_pui_0.setup({
    [1] = v83.main, 
    [2] = v83.antiaim, 
    [3] = v83.other, 
    [4] = builder_aa
}, true);
v594 = {
    backup = 1
};
v83.main.create:set_callback(function()
    -- upvalues: v83 (ref), v298 (ref), l_base64_0 (ref)
    c_input = v83.main.input:get();
    if c_input == "" then
        print_raw("Failed to create config: empty config name");
        utils.console_exec("play resource\\warning.wav");
        return;
    else
        for _, v799 in pairs(configs_database.ui_list) do
            if c_input == v799 then
                print_raw("Failed to create config: config with this name already exists", true);
                utils.console_exec("play resource\\warning.wav");
                return;
            end;
        end;
        local v800 = v298:save();
        local v801 = "Lauralua_" .. l_base64_0.encode(json.stringify(v800));
        table.insert(configs_database.ui_list, c_input);
        table.insert(configs_database.config_list, v801);
        v83.main.input:set("");
        db.Lauraluaconfigs = configs_database;
        v83.main.list:update(configs_database.ui_list);
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end);
v83.main.save:set_callback(function()
    -- upvalues: v83 (ref), v594 (ref), v298 (ref), l_base64_0 (ref)
    if v83.main.list:get() == 1 then
        print_raw("Failed to save config: you cant change default config");
        utils.console_exec("play resource\\warning.wav");
        return;
    else
        v594.backup = v83.main.list:get();
        local v802 = v298:save();
        local v803 = "Lauralua_" .. l_base64_0.encode(json.stringify(v802));
        for v804, _ in pairs(configs_database.config_list) do
            if v804 == v83.main.list:get() then
                configs_database.config_list[v804] = v803;
            end;
        end;
        db.Lauraluaconfigs = configs_database;
        v83.main.list:update(configs_database.ui_list);
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end);
v83.main.load:set_callback(function()
    -- upvalues: v594 (ref), v83 (ref), l_base64_0 (ref), v298 (ref)
    v594.backup = v83.main.list:get();
    selected_config = configs_database.config_list[v83.main.list:get()]:gsub("Lauralua_", "");
    local v806 = json.parse(l_base64_0.decode(selected_config));
    v298:load(v806);
    v83.main.list:set(v594.backup);
    v83.main.input:set("");
    v83.main.list:update(configs_database.ui_list);
    cvar.play:call("ambient\\tones\\elev1");
end);
v83.main.delete:set_callback(function()
    -- upvalues: v83 (ref)
    if v83.main.list:get() == 1 then
        print_raw("Failed to delete config: you cant delete default config");
        utils.console_exec("play resource\\warning.wav");
        return;
    else
        for v807, _ in pairs(configs_database.config_list) do
            if v807 == v83.main.list:get() then
                table.remove(configs_database.config_list, v807);
                table.remove(configs_database.ui_list, v807);
            end;
        end;
        db.Lauraluaconfigs = configs_database;
        v83.main.list:update(configs_database.ui_list);
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end);
v83.main.export:set_callback(function()
    -- upvalues: l_clipboard_0 (ref), v298 (ref)
    l_clipboard_0.set(json.stringify(v298:save()));
    cvar.play:call("ambient\\tones\\elev1");
end);
v83.main.import:set_callback(function()
    -- upvalues: v298 (ref), l_clipboard_0 (ref)
    v298:load(json.parse(l_clipboard_0.get()));
    cvar.play:call("ambient\\tones\\elev1");
end);