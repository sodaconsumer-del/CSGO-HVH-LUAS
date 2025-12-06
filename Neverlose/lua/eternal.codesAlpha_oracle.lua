local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local v2 = "\226\128\138";
local function v4(v3)
    return math.floor(v3 + 0.5);
end;
local function v7(...)
    local v5 = "";
    for v6 = 1, select("#", ...) do
        v5 = v5 .. select(v6, ...);
    end;
    return v5;
end;
local v8 = nil;
v8 = {
    cheat = "nl", 
    user = common.get_username(), 
    name = "Eternal", 
    build = "Alpha"
};
local v9 = nil;
v9 = {
    teams = {
        [1] = "Terrorist", 
        [2] = "Counter-Terrorist"
    }, 
    states = {
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Walking", 
        [4] = "Crouching", 
        [5] = "Sneaking", 
        [6] = "In Air", 
        [7] = "Air Crouch"
    }
};
local v10 = nil;
v10 = {};
local v11 = {};
do
    local l_v11_0 = v11;
    v10.get = function(v13)
        -- upvalues: l_v11_0 (ref)
        local v14 = l_v11_0[v13];
        if v14 == nil then
            v14 = ui.get_icon(v13);
            l_v11_0[v13] = v14;
        end;
        return v14;
    end;
end;
v11 = nil;
v11 = {};
local v15 = "ui\\beepclear.wav";
local v16 = "resource\\warning.wav";
local l_play_0 = cvar.play;
local v18 = "\aC0CAFFFF" .. string.lower(v8.name) .. "\aC8C8C8FF" .. " \194\183 ";
do
    local l_v15_0, l_v16_0, l_l_play_0_0, l_v18_0 = v15, v16, l_play_0, v18;
    v11.success = function(v23)
        -- upvalues: l_v18_0 (ref), l_l_play_0_0 (ref), l_v15_0 (ref)
        v23 = l_v18_0 .. "\a9AFF9AFF" .. v23;
        print_raw(v23);
        print_dev(v23);
        l_l_play_0_0:call(l_v15_0);
    end;
    v11.error = function(v24)
        -- upvalues: l_v18_0 (ref), l_l_play_0_0 (ref), l_v16_0 (ref)
        v24 = l_v18_0 .. "\aFF0032FF" .. v24;
        print_raw(v24);
        print_dev(v24);
        l_l_play_0_0:call(l_v16_0);
    end;
end;
v15 = nil;
v15 = {};
v16 = function(v25, v26, v27, v28)
    return v27 * v25 / v28 + v26;
end;
l_play_0 = function()
    return globals.frametime;
end;
v18 = function(v29, v30, v31, v32, v33)
    if v32 <= 0 then
        return v31;
    elseif v33 <= v32 then
        return v31;
    else
        v30 = v29(v32, v30, v31 - v30, v33);
        if type(v30) == "number" then
            if math.abs(v31 - v30) < 0.001 then
                return v31;
            else
                local v34 = v30 % 1;
                if v34 < 0.001 then
                    return math.floor(v30);
                elseif v34 > 0.999 then
                    return math.ceil(v30);
                end;
            end;
        end;
        return v30;
    end;
end;
do
    local l_v16_1, l_l_play_0_1, l_v18_1 = v16, l_play_0, v18;
    v15.interp = function(v38, v39, v40, v41)
        -- upvalues: l_v16_1 (ref), l_v18_1 (ref), l_l_play_0_1 (ref)
        if not v41 then
            v41 = l_v16_1;
        end;
        if type(v39) == "boolean" then
            v39 = v39 and 1 or 0;
        end;
        return l_v18_1(v41, v38, v39, l_l_play_0_1(), v40);
    end;
end;
v16 = nil;
v16 = {};
l_play_0 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ");
v18 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ");
local v42 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", l_play_0, l_play_0));
local v43 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", l_play_0, l_play_0, l_play_0, l_play_0, v18, v18);
do
    local l_l_play_0_2, l_v18_2, l_v42_0, l_v43_0 = l_play_0, v18, v42, v43;
    v16.line = function(v48, v49, v50, v51, v52)
        -- upvalues: l_l_play_0_2 (ref), l_v42_0 (ref)
        v48 = l_l_play_0_2(v48:unpack());
        v49 = l_l_play_0_2(v49:unpack());
        l_v42_0(v48, v49, v50.r, v50.g, v50.b, v50.a, v51, v52);
    end;
    v16.box_new = function(v53, v54, v55, v56, v57, v58, v59)
        -- upvalues: l_l_play_0_2 (ref), l_v18_2 (ref), l_v43_0 (ref)
        v53 = l_l_play_0_2(v53:unpack());
        v54 = l_l_play_0_2(v54:unpack());
        v55 = l_l_play_0_2(v55:unpack());
        v56 = l_l_play_0_2(v56:unpack());
        v57 = l_v18_2(v57:unpack());
        v58 = l_v18_2(v58:unpack());
        l_v43_0(v53, v54, v55, v56, v57, v58, v59);
    end;
end;
l_play_0 = nil;
l_play_0 = {};
v18 = string.format("%s::%s::", string.lower(v8.name), string.lower(v8.cheat));
v42 = {};
v43 = nil;
do
    local l_v18_3, l_v42_1, l_v43_1 = v18, v42, v43;
    l_play_0.bind = function(v63)
        -- upvalues: l_v43_1 (ref)
        l_v43_1 = v63;
    end;
    l_play_0.push = function(v64, v65, v66)
        -- upvalues: l_v42_1 (ref)
        if l_v42_1[v64] == nil then
            l_v42_1[v64] = {};
        end;
        l_v42_1[v64][v65] = v66;
        return v66;
    end;
    l_play_0.encode = function(v67)
        -- upvalues: l_base64_0 (ref), l_v18_3 (ref)
        local l_status_0, l_result_0 = pcall(json.stringify, v67);
        v67 = l_result_0;
        success = l_status_0;
        if not success then
            return false, "Invalid JSON";
        else
            l_status_0, l_result_0 = pcall(l_base64_0.encode, v67);
            v67 = l_result_0;
            success = l_status_0;
            if not success then
                return false, "Invalid BASE64";
            else
                v67 = string.gsub(v67, "[%+%/%=]", {
                    ["="] = "_", 
                    ["/"] = "g2634", 
                    ["+"] = "g2134"
                });
                return true, l_v18_3 .. v67;
            end;
        end;
    end;
    l_play_0.decode = function(v70)
        -- upvalues: v8 (ref), l_base64_0 (ref)
        local v71, v72, v73 = string.match(v70, "^(%w+)::(%w+)::(.+)$");
        v70 = v73;
        cheat = v72;
        name = v71;
        if name ~= string.lower(v8.name) then
            return false, "Preset not supported!";
        elseif cheat ~= string.lower(v8.cheat) then
            return false, "Preset for another cheat!";
        else
            v70 = string.gsub(v70, "[%g2134%g2634%_]", {
                g2634 = "/", 
                g2134 = "+", 
                _ = "="
            });
            v71, v72 = pcall(l_base64_0.decode, v70);
            v70 = v72;
            success = v71;
            if not success then
                return false, "Invalid BASE64";
            else
                v71, v72 = pcall(json.parse, v70);
                v70 = v72;
                success = v71;
                if not success then
                    return false, "Invalid JSON";
                else
                    return true, v70;
                end;
            end;
        end;
    end;
    l_play_0.import = function(v74)
        -- upvalues: l_v43_1 (ref), l_v42_1 (ref)
        if v74 == nil then
            return false, "Preset is empty!";
        elseif type(v74) ~= "table" then
            return false, "Preset is not valid!";
        else
            local v75 = 0;
            for v76, v77 in pairs(v74) do
                if l_v43_1 == nil or l_v43_1:get(v76) then
                    local v78 = l_v42_1[v76];
                    if v78 ~= nil then
                        for v79, v80 in pairs(v77) do
                            local v81 = v78[v79];
                            if v81 ~= nil then
                                if v81:type() == "color_picker" then
                                    v80 = color(v80);
                                end;
                                pcall(v81.set, v81, v80);
                            end;
                        end;
                        v75 = v75 + 1;
                    end;
                end;
            end;
            return true, v75;
        end;
    end;
    l_play_0.export = function()
        -- upvalues: l_v42_1 (ref)
        local v82 = {};
        for v83, v84 in pairs(l_v42_1) do
            local v85 = {};
            for v86, v87 in pairs(v84) do
                local v88 = v87:get();
                if v87:type() == "color_picker" then
                    v88 = v88:to_hex();
                end;
                v85[v86] = v88;
            end;
            v82[v83] = v85;
        end;
        return v82;
    end;
end;
v18 = nil;
v18 = {
    rage = {
        main = {
            dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
            hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            peek_assist = {
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
            }
        }, 
        selection = {
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
            multipoint_scale = {
                ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
                ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale")
            }
        }, 
        safety = {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
        }
    }, 
    antiaim = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
            yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
            left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            freestanding_body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
            body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
            extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
            extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
            extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
        }, 
        fake_lag = {
            enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
            limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
            variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    visuals = {
        world = {
            main = {
                scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
            }
        }
    }, 
    misc = {
        main = {
            in_game = {
                clan_tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
            }, 
            other = {
                windows = ui.find("Miscellaneous", "Main", "Other", "Windows"), 
                log_events = ui.find("Miscellaneous", "Main", "Other", "Log Events"), 
                fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
            }
        }
    }
};
v42 = nil;
v42 = {};
v43 = function(v89)
    -- upvalues: v2 (ref)
    return string.rep(v2, v89);
end;
local function v93(v90, v91)
    -- upvalues: v2 (ref)
    local v92 = string.rep(v2, v91);
    return v92 .. v90 .. v92;
end;
local function v96(v94, v95)
    if string.find(v94, "##") == nil then
        v94 = v94 .. "##";
    end;
    return v94 .. v95;
end;
local function v98(v97)
    -- upvalues: v7 (ref), v10 (ref)
    return v7("\a{Small Text}", v10.get(v97), "\aDEFAULT");
end;
do
    local l_v43_2, l_v96_0 = v43, v96;
    local function v103(v101, v102)
        -- upvalues: v7 (ref), l_v43_2 (ref)
        return v7(l_v43_2(1), v102 or "\a{Small Text}", "\226\128\162", "\aDEFAULT", l_v43_2(5), v101);
    end;
    local function v110(v104)
        local v105 = v104:get();
        local v106 = v104:list();
        local v107 = v104:type();
        local v108 = {};
        if #v105 == 0 then
            if v107 == "selectable" then
                v108 = v106;
            elseif v107 == "listable" then
                for v109 = 1, #v106 do
                    v108[v109] = v106[v109];
                end;
            end;
            v104:set(v108);
        end;
    end;
    local function v112(v111)
        return function()
            -- upvalues: v111 (ref)
            panorama.SteamOverlayAPI.OpenExternalBrowserURL(v111);
        end;
    end;
    local v113 = {};
    local v114 = v10.get("house");
    local v115 = {
        profile = ui.create(v114, "##profile", 1), 
        storage = ui.create(v114, "##storage", 2), 
        presets = ui.create(v114, "##presets", 2), 
        description = ui.create(v114, "##description", 2)
    };
    v113.profile = {
        build_label = v115.profile:label(v7(l_v43_2(1), v98("signature"), l_v43_2(7), v8.name)), 
        build_button = v115.profile:button(v93(v8.build, 2), nil, true), 
        discord_label = v115.profile:label(v7(l_v43_2(1), v98("discord"), l_v43_2(7), "Discord")), 
        discord_link_button = v115.profile:button(v93(v10.get("link"), 2), v112("https://discord.gg/Xe3CGQDu5d"), true)
    };
    local v116 = {
        categories = v115.storage:selectable(v103("Categories"), {
            [1] = "Anti-Aim", 
            [2] = "Aimbot", 
            [3] = "Visuals", 
            [4] = "Miscellaneous"
        })
    };
    v110(v116.categories);
    local v117 = {};
    local v118 = string.lower(v8.name) .. "#data";
    local v119 = db[v118] or {};
    local v120 = {};
    local v121 = {};
    do
        local l_v117_0 = v117;
        do
            local l_v118_0, l_v119_0, l_v120_0, l_v121_0 = v118, v119, v120, v121;
            local function v131(v127, v128, v129)
                -- upvalues: l_v121_0 (ref)
                local v130 = {
                    name = v127, 
                    data = v129, 
                    desc = v128
                };
                table.insert(l_v121_0, v130);
            end;
            v131("Defensive", v7("\a{Link Active}", v10.get("circle-info"), "\aDEFAULT", "  This configuration uses defensive & slow jitter anti-aim, designed specifically for community servers."), "eternal::nl::eyJBaW1ib3QiOnsiYWlfcGVlay5jb2xvciI6IkZGRkZGRkZGIiwiYWlfcGVlay5kb3RzIjo0LjAsImFpX3BlZWsuZW5hYmxlZCI6ZmFsc2UsImFpX3BlZWsuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkFybXMiLCJMZWdzIiwiRmVldCJdLCJhaV9wZWVrLnJhZGl1cyI6MzIuMCwiYWlfcGVlay53ZWFwb25zIjpbIlNTRyAwOCIsIlI4IFJldm9sdmVyIiwiRGVzZXJ0IEVhZ2xlIiwiUGlzdG9sIiwiUmlmbGUiLCJTaG90Z3VuIl0sImRvcm1hbnRfYWltYm90LmFjY3VyYWN5Ijo2MC4wLCJkb3JtYW50X2FpbWJvdC5lbmFibGVkIjpmYWxzZSwiZG9ybWFudF9haW1ib3QuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiXSwiZG9ybWFudF9haW1ib3QubWluX2RhbWFnZSI6MTAuMCwiZmFrZV9sYXRlbmN5LmVuYWJsZWQiOmZhbHNlLCJsb2dfZXZlbnRzLmNvbG9yX2hpdCI6IkQ4OTg2MEZGIiwibG9nX2V2ZW50cy5jb2xvcl9taXNzIjoiODY5NEM0RkYiLCJsb2dfZXZlbnRzLmVuYWJsZWQiOnRydWUsImxvZ19ldmVudHMub3V0cHV0IjpbIkNvbnNvbGUiLCJEZWJ1ZyIsIk5vdGlmeSJdLCJtYXh1c3JjbWRwcm9jZXNzdGlja3MuZW5hYmxlZCI6ZmFsc2UsIm1heHVzcmNtZHByb2Nlc3N0aWNrcy50aWNrcyI6MTYuMH0sIkFudGktQWltIjp7IkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9lbmFibGVkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6LTQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3IjoiU3BpbiIsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjM2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjUwLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpsZWZ0X2xpbWl0Ijo1OC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOm1vZGlmaWVyX29mZnNldCI6LTQ2LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6cmlnaHRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfbGVmdCI6LTMxLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfcmlnaHQiOjM3LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZW5hYmxlZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2giOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOi00NS4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6bGVmdF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOm1vZGlmaWVyX29mZnNldCI6LTM1LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpyaWdodF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfbGVmdCI6LTMxLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfcmlnaHQiOjQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfZW5hYmxlZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNDUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXciOiJTd2l0Y2giLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd18xIjotOTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfMiI6OTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWxheV8xIjoxLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWxheV8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpsZWZ0X2xpbWl0Ijo1OC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6bW9kaWZpZXJfb2Zmc2V0IjotNDcuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnJpZ2h0X2xpbWl0Ijo1OC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnlhd19sZWZ0IjotMjYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnlhd19yaWdodCI6MzkuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjIuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY2hva2VfMiI6Ni4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9waXRjaCI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOi00NS4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzEiOi05MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfMiI6OTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6NTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWxheV8xIjoxLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmxlZnRfbGltaXQiOjYwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6bW9kaWZpZXJfb2Zmc2V0IjotNTIuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpyaWdodF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfYWRkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOnlhd19sZWZ0IjotMzIuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOnlhd19yaWdodCI6MzcuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlbGF5XzEiOjEuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpsZWZ0X2xpbWl0Ijo2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzptb2RpZmllcl9vZmZzZXQiOi0zNS4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpyaWdodF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X2xlZnQiOi0yNy4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X3JpZ2h0IjozMy4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWxheV8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmxlZnRfbGltaXQiOjMwLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOm1vZGlmaWVyX29mZnNldCI6LTQ2LjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnJpZ2h0X2xpbWl0IjozMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfYWRkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfbGVmdCI6LTMwLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfcmlnaHQiOjM0LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWxheV8xIjoxLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmxlZnRfbGltaXQiOjYwLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6bW9kaWZpZXJfb2Zmc2V0IjotNS4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X2xlZnQiOi0zOC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X3JpZ2h0Ijo0Mi4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9lbmFibGVkIjp0cnVlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjp0cnVlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNDUuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXciOiJTcGluIiwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3X29mZnNldCI6MzYwLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjUwLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlbGF5XzEiOjEuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpyaWdodF9saW1pdCI6NTguMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2xlZnQiOi0zMS4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X3JpZ2h0IjozNy4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZW5hYmxlZCI6dHJ1ZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjp0cnVlLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaCI6IkppdHRlciIsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOi00NS4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF8yIjo0NS4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlbGF5XzEiOjEuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6bGVmdF9saW1pdCI6NjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzptb2RpZmllcl9vZmZzZXQiOi0zNS4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19hZGQiOnRydWUsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X2xlZnQiOi0zMS4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X3JpZ2h0Ijo0NS4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfZW5hYmxlZCI6dHJ1ZSwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjp0cnVlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi00NS4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd18xIjotOTAuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OkluIEFpcjpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOm1vZGlmaWVyX29mZnNldCI6LTQ3LjAsIlRlcnJvcmlzdDpJbiBBaXI6cmlnaHRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpJbiBBaXI6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkluIEFpcjp5YXdfbGVmdCI6LTI2LjAsIlRlcnJvcmlzdDpJbiBBaXI6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJUZXJyb3Jpc3Q6SW4gQWlyOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkluIEFpcjp5YXdfcmlnaHQiOjM5LjAsIlRlcnJvcmlzdDpSdW5uaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjIuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjYuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6dHJ1ZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoIjoiSml0dGVyIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOi00NS4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOnRydWUsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXciOiJTd2l0Y2giLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzEiOi05MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6NTAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmxlZnRfbGltaXQiOjYwLjAsIlRlcnJvcmlzdDpSdW5uaW5nOm1vZGlmaWVyX29mZnNldCI6LTUyLjAsIlRlcnJvcmlzdDpSdW5uaW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfbGVmdCI6LTMyLjAsIlRlcnJvcmlzdDpSdW5uaW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OlJ1bm5pbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfcmlnaHQiOjM3LjAsIlRlcnJvcmlzdDpTbmVha2luZzpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8xIjoxLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpTbmVha2luZzpsZWZ0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiVGVycm9yaXN0OlNuZWFraW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19sZWZ0IjotMjcuMCwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19yaWdodCI6MzMuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzEiOjEuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmxlZnRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6cmlnaHRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X2xlZnQiOi0zMC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X3JpZ2h0IjozNC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmxlZnRfbGltaXQiOjYwLjAsIlRlcnJvcmlzdDpXYWxraW5nOm1vZGlmaWVyX29mZnNldCI6LTUuMCwiVGVycm9yaXN0OldhbGtpbmc6cmlnaHRfbGltaXQiOjYwLjAsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19hZGQiOnRydWUsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19sZWZ0IjotMzguMCwiVGVycm9yaXN0OldhbGtpbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJUZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19yaWdodCI6NDIuMCwiYXZvaWRfYmFja3N0YWIuZW5hYmxlZCI6dHJ1ZSwiZmxpY2tfZXhwbG9pdC5jb25kaXRpb25zIjpbXSwiZmxpY2tfZXhwbG9pdC5lbmFibGVkIjpmYWxzZSwiZnJlZXN0YW5kaW5nLmRpc2FibGVycyI6WyJJbiBBaXIiLCJBaXIgQ3JvdWNoIl0sImZyZWVzdGFuZGluZy5lbmFibGVkIjpmYWxzZSwiZnJlZXN0YW5kaW5nLnN0YXRpYyI6ZmFsc2UsIm1hbnVhbF95YXcuZGlyZWN0aW9uIjoiRGlzYWJsZWQiLCJtYW51YWxfeWF3LmRpc2FibGVycyI6W10sIm1hbnVhbF95YXcuc3RhdGljIjpmYWxzZSwibW9kaWZ5X29uX3dhcm11cC5lbmFibGVkIjpmYWxzZSwib25fdXNlLmVuYWJsZWQiOnRydWUsInNhZmVfaGVhZC5jb25kaXRpb25zIjpbIlN0YW5kaW5nIiwiQ3JvdWNoIiwiQWlyIENyb3VjaCIsIkFpciBLbmlmZSIsIkFpciBUYXNlciIsIkRpc3RhbmNlIl0sInNhZmVfaGVhZC5lbmFibGVkIjp0cnVlfSwiTWlzY2VsbGFuZW91cyI6eyJhdm9pZF9jb2xsaXNpb25zLmVuYWJsZWQiOmZhbHNlLCJjbGFudGFnLmVuYWJsZWQiOmZhbHNlLCJjb2xsaXNpb25fYWlyX2R1Y2suZW5hYmxlZCI6ZmFsc2UsImVkZ2Vfc3RvcC5lbmFibGVkIjpmYWxzZSwiZmFzdF9sYWRkZXIuZW5hYmxlZCI6dHJ1ZSwibm9fZmFsbF9kYW1hZ2UuZW5hYmxlZCI6dHJ1ZSwic3VwZXJfdG9zcy5lbmFibGVkIjp0cnVlLCJ0cmFzaHRhbGsuZGVsYXkiOjMwLjAsInRyYXNodGFsay5lbmFibGVkIjpmYWxzZSwidW5sb2NrX2ZkX3NwZWVkLmVuYWJsZWQiOnRydWV9LCJWaXN1YWxzIjp7ImFuaW1hdGlvbnMuZWFydGhxdWFrZSI6ZmFsc2UsImFuaW1hdGlvbnMuZW5hYmxlZCI6ZmFsc2UsImFuaW1hdGlvbnMuaW5fYWlyIjoiRGlzYWJsZWQiLCJhbmltYXRpb25zLm1vdmVfbGVhbiI6MC4wLCJhbmltYXRpb25zLm9uX2dyb3VuZCI6IkRpc2FibGVkIiwiYW5pbWF0aW9ucy5waXRjaF9vbl9sYW5kIjpmYWxzZSwiYW5pbWF0aW9ucy5zbGlkaW5nX2Nyb3VjaCI6ZmFsc2UsImFuaW1hdGlvbnMuc2xpZGluZ19zbG93d2FsayI6ZmFsc2UsImFzcGVjdF9yYXRpby5lbmFibGVkIjpmYWxzZSwiYXNwZWN0X3JhdGlvLnByb3BvcnRpb24iOjAuMCwiY29uc29sZV9jb2xvci5jb2xvciI6IjgwODA4MDlFIiwiY29uc29sZV9jb2xvci5lbmFibGVkIjp0cnVlLCJjcm9zc2hhaXJfaW5kaWNhdG9ycy5jb2xvciI6IkZGQjc0RkZGIiwiY3Jvc3NoYWlyX2luZGljYXRvcnMuZW5hYmxlZCI6dHJ1ZSwiY3Jvc3NoYWlyX2luZGljYXRvcnMub2Zmc2V0Ijo0MC4wLCJkYW1hZ2VfaW5kaWNhdG9yLmNvbG9yIjoiRkZGRkZGRkYiLCJkYW1hZ2VfaW5kaWNhdG9yLmVuYWJsZWQiOnRydWUsImRhbWFnZV9pbmRpY2F0b3IuZm9udCI6IlNtYWxsIiwiaGl0X21hcmtlci5jb2xvciI6IjAwMDAwMEZGIiwiaGl0X21hcmtlci5lbmFibGVkIjp0cnVlLCJoaXRfbWFya2VyLnNpemUiOjQuMCwiaGl0X21hcmtlci50aGlja25lc3MiOjIuMCwia2VlcF90cmFuc3BhcmVuY3kuZW5hYmxlZCI6dHJ1ZSwibGFnX2NvbXBfYm94LmNvbG9yIjoiMkY3NURERkYiLCJsYWdfY29tcF9ib3guZW5hYmxlZCI6dHJ1ZSwibWFudWFsX2Fycm93cy5jb2xvciI6IkZGRkZGRkZGIiwibWFudWFsX2Fycm93cy5lbmFibGVkIjp0cnVlLCJtYW51YWxfYXJyb3dzLm9mZnNldCI6NDAuMCwibmFkZV9yYWRpdXMuZW5hYmxlZCI6dHJ1ZSwibmFkZV9yYWRpdXMubW9sb3RvdiI6dHJ1ZSwibmFkZV9yYWRpdXMubW9sb3Rvdl9jb2xvciI6IkQ4OTg2MEZGIiwibmFkZV9yYWRpdXMuc21va2UiOnRydWUsIm5hZGVfcmFkaXVzLnNtb2tlX2NvbG9yIjoiODY5NEM0RkYiLCJyZW1vdmVfZm9vdHN0ZXBzX3NoYWRvdy5lbmFibGVkIjp0cnVlLCJzY29wZV9vdmVybGF5LmFkZGl0aW9ucyI6W10sInNjb3BlX292ZXJsYXkuY29sb3IiOiJGRkZGRkY5RSIsInNjb3BlX292ZXJsYXkuZW5hYmxlZCI6dHJ1ZSwic2NvcGVfb3ZlcmxheS5leGNsdWRlX2xpbmVzIjpbXSwic2NvcGVfb3ZlcmxheS5nYXAiOjAuMCwic2NvcGVfb3ZlcmxheS5zaXplIjo1NS4wLCJza2VldF9pbmRpY2F0b3JzLmVuYWJsZWQiOnRydWUsInNrZWV0X2luZGljYXRvcnMuaXRlbXMiOlsxLjAsMi4wLDMuMCw0LjAsNS4wLDYuMCw3LjAsOC4wLDkuMCwxMC4wLDExLjBdLCJ2ZWxvY2l0eV93YXJuaW5nLmNvbG9yIjoiRkZCNzRGRkYiLCJ2ZWxvY2l0eV93YXJuaW5nLmVuYWJsZWQiOnRydWUsInZlbG9jaXR5X3dhcm5pbmcub2Zmc2V0IjoxNjAuMCwidmlld21vZGVsLmVuYWJsZWQiOmZhbHNlLCJ2aWV3bW9kZWwuZm92Ijo2ODAuMCwidmlld21vZGVsLm9mZnNldF94IjoyNS4wLCJ2aWV3bW9kZWwub2Zmc2V0X3kiOjAuMCwidmlld21vZGVsLm9mZnNldF96IjotMTUuMH19");
            v131("Desync", v7("\a{Link Active}", v10.get("circle-info"), "\aDEFAULT", "  This configuration is based on the default NeverLose anti-aim, with no exploit or tickrate tweaks."), "eternal::nl::eyJBaW1ib3QiOnsiYWlfcGVlay5jb2xvciI6IkZGRkZGRkZGIiwiYWlfcGVlay5kb3RzIjo0LjAsImFpX3BlZWsuZW5hYmxlZCI6ZmFsc2UsImFpX3BlZWsuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkFybXMiLCJMZWdzIiwiRmVldCJdLCJhaV9wZWVrLnJhZGl1cyI6MzIuMCwiYWlfcGVlay53ZWFwb25zIjpbIlNTRyAwOCIsIlI4IFJldm9sdmVyIiwiRGVzZXJ0IEVhZ2xlIiwiUGlzdG9sIiwiUmlmbGUiLCJTaG90Z3VuIl0sImRvcm1hbnRfYWltYm90LmFjY3VyYWN5Ijo2MC4wLCJkb3JtYW50X2FpbWJvdC5lbmFibGVkIjpmYWxzZSwiZG9ybWFudF9haW1ib3QuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiXSwiZG9ybWFudF9haW1ib3QubWluX2RhbWFnZSI6MTAuMCwiZmFrZV9sYXRlbmN5LmVuYWJsZWQiOmZhbHNlLCJsb2dfZXZlbnRzLmNvbG9yX2hpdCI6IkMzQ0FGRkZGIiwibG9nX2V2ZW50cy5jb2xvcl9taXNzIjoiRkY5MjkyRkYiLCJsb2dfZXZlbnRzLmVuYWJsZWQiOnRydWUsImxvZ19ldmVudHMub3V0cHV0IjpbIkNvbnNvbGUiLCJEZWJ1ZyIsIk5vdGlmeSJdLCJtYXh1c3JjbWRwcm9jZXNzdGlja3MuZW5hYmxlZCI6ZmFsc2UsIm1heHVzcmNtZHByb2Nlc3N0aWNrcy50aWNrcyI6MTYuMH0sIkFudGktQWltIjp7IkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWxheV8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmxlZnRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6bW9kaWZpZXJfb2Zmc2V0IjotNDYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpyaWdodF9saW1pdCI6NTguMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfYWRkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19sZWZ0IjotOC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19tb2RpZmllciI6IkNlbnRlciIsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19yaWdodCI6MTQuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlbGF5XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmxlZnRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzptb2RpZmllcl9vZmZzZXQiOi0zNS4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6cmlnaHRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfYWRkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X2xlZnQiOi0xMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X21vZGlmaWVyIjoiQ2VudGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19yaWdodCI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlbGF5XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmxlZnRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjptb2RpZmllcl9vZmZzZXQiOi00Ny4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6cmlnaHRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfYWRkIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6eWF3X2xlZnQiOi0zLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6eWF3X3JpZ2h0IjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVsYXlfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpsZWZ0X2xpbWl0IjozNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOm1vZGlmaWVyX29mZnNldCI6LTUyLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6cmlnaHRfbGltaXQiOjM2LjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfbGVmdCI6LTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfcmlnaHQiOjExLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6bGVmdF9saW1pdCI6NTguMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6cmlnaHRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19sZWZ0IjotMTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X21vZGlmaWVyIjoiQ2VudGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzp5YXdfcmlnaHQiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWxheV8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6bGVmdF9saW1pdCI6MzAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6bW9kaWZpZXJfb2Zmc2V0IjotNDYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6cmlnaHRfbGltaXQiOjMwLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnlhd19sZWZ0IjotNy4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnlhd19yaWdodCI6MTEuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlbGF5XzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWxheV8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6bGVmdF9saW1pdCI6NDUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzptb2RpZmllcl9vZmZzZXQiOi01LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6cmlnaHRfbGltaXQiOjQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfbGVmdCI6LTIzLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X21vZGlmaWVyIjoiU3BpbiIsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOnlhd19yaWdodCI6NDcuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6Ym9keV95YXciOiJKaXR0ZXIiLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlbGF5XzEiOjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMiI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpyaWdodF9saW1pdCI6NTguMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2xlZnQiOi04LjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19tb2RpZmllciI6IkNlbnRlciIsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X3JpZ2h0IjoxNC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVsYXlfMSI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOm1vZGlmaWVyX29mZnNldCI6LTM1LjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6cmlnaHRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfbGVmdCI6LTEwLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X21vZGlmaWVyIjoiQ2VudGVyIiwiVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X3JpZ2h0IjoxNi4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd18yIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVsYXlfMSI6MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OkluIEFpcjpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOm1vZGlmaWVyX29mZnNldCI6LTQ3LjAsIlRlcnJvcmlzdDpJbiBBaXI6cmlnaHRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpJbiBBaXI6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkluIEFpcjp5YXdfbGVmdCI6LTMuMCwiVGVycm9yaXN0OkluIEFpcjp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJUZXJyb3Jpc3Q6SW4gQWlyOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkluIEFpcjp5YXdfcmlnaHQiOjE2LjAsIlRlcnJvcmlzdDpSdW5uaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWxheV8xIjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6bGVmdF9saW1pdCI6MzYuMCwiVGVycm9yaXN0OlJ1bm5pbmc6bW9kaWZpZXJfb2Zmc2V0IjotNTIuMCwiVGVycm9yaXN0OlJ1bm5pbmc6cmlnaHRfbGltaXQiOjM2LjAsIlRlcnJvcmlzdDpSdW5uaW5nOnlhd19hZGQiOnRydWUsIlRlcnJvcmlzdDpSdW5uaW5nOnlhd19sZWZ0IjotNi4wLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOnlhd19yaWdodCI6MTEuMCwiVGVycm9yaXN0OlNuZWFraW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlbGF5XzEiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmxlZnRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpTbmVha2luZzptb2RpZmllcl9vZmZzZXQiOi0zNS4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6cmlnaHRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpTbmVha2luZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X2xlZnQiOi0xMC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X21vZGlmaWVyIjoiQ2VudGVyIiwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19yaWdodCI6MTYuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzEiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmxlZnRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6cmlnaHRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X2xlZnQiOi03LjAsIlRlcnJvcmlzdDpTdGFuZGluZzp5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X3JpZ2h0IjoxMS4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd18yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVsYXlfMSI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmxlZnRfbGltaXQiOjQ1LjAsIlRlcnJvcmlzdDpXYWxraW5nOm1vZGlmaWVyX29mZnNldCI6LTUuMCwiVGVycm9yaXN0OldhbGtpbmc6cmlnaHRfbGltaXQiOjQ1LjAsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19hZGQiOnRydWUsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19sZWZ0IjotMjMuMCwiVGVycm9yaXN0OldhbGtpbmc6eWF3X21vZGlmaWVyIjoiU3BpbiIsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OldhbGtpbmc6eWF3X3JpZ2h0Ijo0Ny4wLCJhdm9pZF9iYWNrc3RhYi5lbmFibGVkIjp0cnVlLCJmbGlja19leHBsb2l0LmNvbmRpdGlvbnMiOltdLCJmbGlja19leHBsb2l0LmVuYWJsZWQiOmZhbHNlLCJmcmVlc3RhbmRpbmcuZGlzYWJsZXJzIjpbIkluIEFpciIsIkFpciBDcm91Y2giXSwiZnJlZXN0YW5kaW5nLmVuYWJsZWQiOmZhbHNlLCJmcmVlc3RhbmRpbmcuc3RhdGljIjpmYWxzZSwibWFudWFsX3lhdy5kaXJlY3Rpb24iOiJEaXNhYmxlZCIsIm1hbnVhbF95YXcuZGlzYWJsZXJzIjpbXSwibWFudWFsX3lhdy5zdGF0aWMiOmZhbHNlLCJtb2RpZnlfb25fd2FybXVwLmVuYWJsZWQiOnRydWUsIm9uX3VzZS5lbmFibGVkIjp0cnVlLCJzYWZlX2hlYWQuY29uZGl0aW9ucyI6WyJTdGFuZGluZyIsIkNyb3VjaCIsIkFpciBDcm91Y2giLCJBaXIgS25pZmUiLCJBaXIgVGFzZXIiLCJEaXN0YW5jZSJdLCJzYWZlX2hlYWQuZW5hYmxlZCI6dHJ1ZX0sIk1pc2NlbGxhbmVvdXMiOnsiYXZvaWRfY29sbGlzaW9ucy5lbmFibGVkIjpmYWxzZSwiY2xhbnRhZy5lbmFibGVkIjpmYWxzZSwiY29sbGlzaW9uX2Fpcl9kdWNrLmVuYWJsZWQiOmZhbHNlLCJlZGdlX3N0b3AuZW5hYmxlZCI6ZmFsc2UsImZhc3RfbGFkZGVyLmVuYWJsZWQiOnRydWUsIm5vX2ZhbGxfZGFtYWdlLmVuYWJsZWQiOnRydWUsInN1cGVyX3Rvc3MuZW5hYmxlZCI6dHJ1ZSwidHJhc2h0YWxrLmRlbGF5IjozMC4wLCJ0cmFzaHRhbGsuZW5hYmxlZCI6ZmFsc2UsInVubG9ja19mZF9zcGVlZC5lbmFibGVkIjp0cnVlfSwiVmlzdWFscyI6eyJhbmltYXRpb25zLmVhcnRocXVha2UiOmZhbHNlLCJhbmltYXRpb25zLmVuYWJsZWQiOmZhbHNlLCJhbmltYXRpb25zLmluX2FpciI6IkRpc2FibGVkIiwiYW5pbWF0aW9ucy5tb3ZlX2xlYW4iOjAuMCwiYW5pbWF0aW9ucy5vbl9ncm91bmQiOiJEaXNhYmxlZCIsImFuaW1hdGlvbnMucGl0Y2hfb25fbGFuZCI6ZmFsc2UsImFuaW1hdGlvbnMuc2xpZGluZ19jcm91Y2giOmZhbHNlLCJhbmltYXRpb25zLnNsaWRpbmdfc2xvd3dhbGsiOmZhbHNlLCJhc3BlY3RfcmF0aW8uZW5hYmxlZCI6ZmFsc2UsImFzcGVjdF9yYXRpby5wcm9wb3J0aW9uIjowLjAsImNvbnNvbGVfY29sb3IuY29sb3IiOiI4MDgwODA5RSIsImNvbnNvbGVfY29sb3IuZW5hYmxlZCI6dHJ1ZSwiY3Jvc3NoYWlyX2luZGljYXRvcnMuY29sb3IiOiJGRkI3NEZGRiIsImNyb3NzaGFpcl9pbmRpY2F0b3JzLmVuYWJsZWQiOnRydWUsImNyb3NzaGFpcl9pbmRpY2F0b3JzLm9mZnNldCI6NDAuMCwiZGFtYWdlX2luZGljYXRvci5jb2xvciI6IkZGRkZGRkZGIiwiZGFtYWdlX2luZGljYXRvci5lbmFibGVkIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yLmZvbnQiOiJTbWFsbCIsImhpdF9tYXJrZXIuY29sb3IiOiIwMDAwMDBGRiIsImhpdF9tYXJrZXIuZW5hYmxlZCI6dHJ1ZSwiaGl0X21hcmtlci5zaXplIjo0LjAsImhpdF9tYXJrZXIudGhpY2tuZXNzIjoyLjAsImtlZXBfdHJhbnNwYXJlbmN5LmVuYWJsZWQiOnRydWUsImxhZ19jb21wX2JveC5jb2xvciI6IjJGNzVEREZGIiwibGFnX2NvbXBfYm94LmVuYWJsZWQiOnRydWUsIm1hbnVhbF9hcnJvd3MuY29sb3IiOiJGRkZGRkZGRiIsIm1hbnVhbF9hcnJvd3MuZW5hYmxlZCI6dHJ1ZSwibWFudWFsX2Fycm93cy5vZmZzZXQiOjQwLjAsIm5hZGVfcmFkaXVzLmVuYWJsZWQiOnRydWUsIm5hZGVfcmFkaXVzLm1vbG90b3YiOnRydWUsIm5hZGVfcmFkaXVzLm1vbG90b3ZfY29sb3IiOiJEODk4NjBGRiIsIm5hZGVfcmFkaXVzLnNtb2tlIjp0cnVlLCJuYWRlX3JhZGl1cy5zbW9rZV9jb2xvciI6Ijg2OTRDNEZGIiwicmVtb3ZlX2Zvb3RzdGVwc19zaGFkb3cuZW5hYmxlZCI6dHJ1ZSwic2NvcGVfb3ZlcmxheS5hZGRpdGlvbnMiOltdLCJzY29wZV9vdmVybGF5LmNvbG9yIjoiRkZGRkZGOUUiLCJzY29wZV9vdmVybGF5LmVuYWJsZWQiOnRydWUsInNjb3BlX292ZXJsYXkuZXhjbHVkZV9saW5lcyI6W10sInNjb3BlX292ZXJsYXkuZ2FwIjowLjAsInNjb3BlX292ZXJsYXkuc2l6ZSI6NTUuMCwic2tlZXRfaW5kaWNhdG9ycy5lbmFibGVkIjp0cnVlLCJza2VldF9pbmRpY2F0b3JzLml0ZW1zIjpbMS4wLDIuMCwzLjAsNC4wLDUuMCw2LjAsNy4wLDguMCw5LjAsMTAuMCwxMS4wXSwidmVsb2NpdHlfd2FybmluZy5jb2xvciI6IkZGQjc0RkZGIiwidmVsb2NpdHlfd2FybmluZy5lbmFibGVkIjp0cnVlLCJ2ZWxvY2l0eV93YXJuaW5nLm9mZnNldCI6MTYwLjAsInZpZXdtb2RlbC5lbmFibGVkIjpmYWxzZSwidmlld21vZGVsLmZvdiI6NjgwLjAsInZpZXdtb2RlbC5vZmZzZXRfeCI6MjUuMCwidmlld21vZGVsLm9mZnNldF95IjowLjAsInZpZXdtb2RlbC5vZmZzZXRfeiI6LTE1LjB9fQ__");
            v131("Delay", v7("\a{Link Active}", v10.get("circle-info"), "\aDEFAULT", "  This configuration is based on slow jitter & tickrate tweaks, with no exploit usage."), "eternal::nl::eyJBaW1ib3QiOnsiYWlfcGVlay5jb2xvciI6IkZGRkZGRkZGIiwiYWlfcGVlay5kb3RzIjo0LjAsImFpX3BlZWsuZW5hYmxlZCI6ZmFsc2UsImFpX3BlZWsuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkFybXMiLCJMZWdzIiwiRmVldCJdLCJhaV9wZWVrLnJhZGl1cyI6MzIuMCwiYWlfcGVlay53ZWFwb25zIjpbIlNTRyAwOCIsIlI4IFJldm9sdmVyIiwiRGVzZXJ0IEVhZ2xlIiwiUGlzdG9sIiwiUmlmbGUiLCJTaG90Z3VuIl0sImRvcm1hbnRfYWltYm90LmFjY3VyYWN5Ijo2MC4wLCJkb3JtYW50X2FpbWJvdC5lbmFibGVkIjpmYWxzZSwiZG9ybWFudF9haW1ib3QuaGl0Ym94ZXMiOlsiSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiXSwiZG9ybWFudF9haW1ib3QubWluX2RhbWFnZSI6MTAuMCwiZmFrZV9sYXRlbmN5LmVuYWJsZWQiOmZhbHNlLCJsb2dfZXZlbnRzLmNvbG9yX2hpdCI6IjgwOUJDRUZGIiwibG9nX2V2ZW50cy5jb2xvcl9taXNzIjoiQzQ4Njg2RkYiLCJsb2dfZXZlbnRzLmVuYWJsZWQiOnRydWUsImxvZ19ldmVudHMub3V0cHV0IjpbIkNvbnNvbGUiLCJEZWJ1ZyIsIk5vdGlmeSJdLCJtYXh1c3JjbWRwcm9jZXNzdGlja3MuZW5hYmxlZCI6ZmFsc2UsIm1heHVzcmNtZHByb2Nlc3N0aWNrcy50aWNrcyI6MTYuMH0sIkFudGktQWltIjp7IkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6Ym9keV95YXciOiJSYW5kb21pemUgSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6LTQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3IjoiU3BpbiIsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjM2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjUwLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlbGF5XzIiOjMuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDpsZWZ0X2xpbWl0Ijo1OC4wLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOm1vZGlmaWVyX29mZnNldCI6LTQ2LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6cmlnaHRfbGltaXQiOjU4LjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfbGVmdCI6LTMxLjAsIkNvdW50ZXItVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJDb3VudGVyLVRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfcmlnaHQiOjM3LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpib2R5X3lhdyI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaCI6IkppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfMSI6LTQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6NDUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWxheV8xIjoxLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpkZWxheV8yIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkNyb3VjaGluZzpsZWZ0X2xpbWl0Ijo2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19sZWZ0IjotMzEuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19yaWdodCI6NDUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6LTQ1LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfMSI6LTkwLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpJbiBBaXI6bGVmdF9saW1pdCI6NTguMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOm1vZGlmaWVyX29mZnNldCI6LTQ3LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjpyaWdodF9saW1pdCI6NTguMCwiQ291bnRlci1UZXJyb3Jpc3Q6SW4gQWlyOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfbGVmdCI6LTI2LjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OkluIEFpcjp5YXdfcmlnaHQiOjM5LjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoyLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2giOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjotNDUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjp0cnVlLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd18xIjotOTAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjUwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6ZGVsYXlfMSI6MS4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOmRlbGF5XzIiOjIuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzpsZWZ0X2xpbWl0Ijo2MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOm1vZGlmaWVyX29mZnNldCI6LTU4LjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6cmlnaHRfbGltaXQiOjYwLjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfbGVmdCI6LTI2LjAsIkNvdW50ZXItVGVycm9yaXN0OlJ1bm5pbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJDb3VudGVyLVRlcnJvcmlzdDpSdW5uaW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6UnVubmluZzp5YXdfcmlnaHQiOjM1LjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8xIjoxLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOmRlbGF5XzIiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6bGVmdF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6cmlnaHRfbGltaXQiOjYwLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19hZGQiOnRydWUsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19sZWZ0IjotMjcuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJDb3VudGVyLVRlcnJvcmlzdDpTbmVha2luZzp5YXdfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlNuZWFraW5nOnlhd19yaWdodCI6MzMuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6Ym9keV95YXciOiJKaXR0ZXIiLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzEiOjEuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVsYXlfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpsZWZ0X2xpbWl0IjozMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzpyaWdodF9saW1pdCI6MzAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X2xlZnQiOi0zMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpTdGFuZGluZzp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIkNvdW50ZXItVGVycm9yaXN0OlN0YW5kaW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X3JpZ2h0IjozNC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmJvZHlfeWF3IjoiUmFuZG9taXplIEppdHRlciIsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfMSI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3X3NwZWVkIjoyMC4wLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOmRlbGF5XzEiOjEuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzpkZWxheV8yIjoyLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6bGVmdF9saW1pdCI6NjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzptb2RpZmllcl9vZmZzZXQiOi01LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6cmlnaHRfbGltaXQiOjYwLjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X2FkZCI6dHJ1ZSwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfbGVmdCI6LTI1LjAsIkNvdW50ZXItVGVycm9yaXN0OldhbGtpbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJDb3VudGVyLVRlcnJvcmlzdDpXYWxraW5nOnlhd19vZmZzZXQiOjAuMCwiQ291bnRlci1UZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfcmlnaHQiOjM1LjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmJvZHlfeWF3IjoiUmFuZG9taXplIEppdHRlciIsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfY2hva2VfMiI6MTYuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX2ZvcmNlX2RlZmVuc2l2ZSI6ZmFsc2UsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF8yIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi00NS4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfcmFuZG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd18yIjowLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjozNjAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVmZW5zaXZlX3lhd19zcGVlZCI6NTAuMCwiVGVycm9yaXN0OkFpciBDcm91Y2g6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDpkZWxheV8yIjozLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOmxlZnRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOm1vZGlmaWVyX29mZnNldCI6LTQ2LjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOnJpZ2h0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfbGVmdCI6LTMxLjAsIlRlcnJvcmlzdDpBaXIgQ3JvdWNoOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OkFpciBDcm91Y2g6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6QWlyIENyb3VjaDp5YXdfcmlnaHQiOjM3LjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6Ym9keV95YXciOiJKaXR0ZXIiLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2giOiJKaXR0ZXIiLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjotNDUuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6NDUuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpkZWxheV8xIjoxLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6ZGVsYXlfMiI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOmxlZnRfbGltaXQiOjYwLjAsIlRlcnJvcmlzdDpDcm91Y2hpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiVGVycm9yaXN0OkNyb3VjaGluZzpyaWdodF9saW1pdCI6NjAuMCwiVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19sZWZ0IjotMzEuMCwiVGVycm9yaXN0OkNyb3VjaGluZzp5YXdfbW9kaWZpZXIiOiJEaXNhYmxlZCIsIlRlcnJvcmlzdDpDcm91Y2hpbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6Q3JvdWNoaW5nOnlhd19yaWdodCI6NDUuMCwiVGVycm9yaXN0OkluIEFpcjpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2Nob2tlXzEiOjE2LjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3BpdGNoXzEiOjAuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi00NS4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd18xIjotOTAuMCwiVGVycm9yaXN0OkluIEFpcjpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpJbiBBaXI6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6SW4gQWlyOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OkluIEFpcjpsZWZ0X2xpbWl0Ijo1OC4wLCJUZXJyb3Jpc3Q6SW4gQWlyOm1vZGlmaWVyX29mZnNldCI6LTQ3LjAsIlRlcnJvcmlzdDpJbiBBaXI6cmlnaHRfbGltaXQiOjU4LjAsIlRlcnJvcmlzdDpJbiBBaXI6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OkluIEFpcjp5YXdfbGVmdCI6LTI2LjAsIlRlcnJvcmlzdDpJbiBBaXI6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJUZXJyb3Jpc3Q6SW4gQWlyOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OkluIEFpcjp5YXdfcmlnaHQiOjM5LjAsIlRlcnJvcmlzdDpSdW5uaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzEiOjIuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjYuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6dHJ1ZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX2VuYWJsZWQiOmZhbHNlLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoIjoiSml0dGVyIiwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3BpdGNoXzEiOi00NS4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOnRydWUsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV9yYW5kb21pemF0aW9uIjowLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXciOiJTd2l0Y2giLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzEiOi05MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWZlbnNpdmVfeWF3XzIiOjkwLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6NTAuMCwiVGVycm9yaXN0OlJ1bm5pbmc6ZGVsYXlfMSI6MS4wLCJUZXJyb3Jpc3Q6UnVubmluZzpkZWxheV8yIjoyLjAsIlRlcnJvcmlzdDpSdW5uaW5nOmxlZnRfbGltaXQiOjYwLjAsIlRlcnJvcmlzdDpSdW5uaW5nOm1vZGlmaWVyX29mZnNldCI6LTU4LjAsIlRlcnJvcmlzdDpSdW5uaW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfbGVmdCI6LTI2LjAsIlRlcnJvcmlzdDpSdW5uaW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OlJ1bm5pbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6UnVubmluZzp5YXdfcmlnaHQiOjM1LjAsIlRlcnJvcmlzdDpTbmVha2luZzpib2R5X3lhdyI6IkppdHRlciIsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9jaG9rZV8yIjoxNi4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX2N1c3RvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfZm9yY2VfZGVmZW5zaXZlIjpmYWxzZSwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3BpdGNoXzIiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3JhbmRvbWl6YXRpb24iOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6U25lYWtpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWZlbnNpdmVfeWF3XzIiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfb2Zmc2V0IjoxODAuMCwiVGVycm9yaXN0OlNuZWFraW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8xIjoxLjAsIlRlcnJvcmlzdDpTbmVha2luZzpkZWxheV8yIjowLjAsIlRlcnJvcmlzdDpTbmVha2luZzpsZWZ0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6bW9kaWZpZXJfb2Zmc2V0IjotMzUuMCwiVGVycm9yaXN0OlNuZWFraW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6U25lYWtpbmc6eWF3X2FkZCI6dHJ1ZSwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19sZWZ0IjotMjcuMCwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19vZmZzZXQiOjAuMCwiVGVycm9yaXN0OlNuZWFraW5nOnlhd19yaWdodCI6MzMuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmJvZHlfeWF3IjoiSml0dGVyIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9jaG9rZV8xIjoxNi4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfY3VzdG9tX2Nob2tlIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9lbmFibGVkIjpmYWxzZSwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV9waXRjaF8xIjowLjAsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3JhbmRvbV9jaG9rZSI6ZmFsc2UsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhdyI6IlN0YXRpYyIsIlRlcnJvcmlzdDpTdGFuZGluZzpkZWZlbnNpdmVfeWF3XzEiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19vZmZzZXQiOjE4MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6ZGVmZW5zaXZlX3lhd19zcGVlZCI6MjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzEiOjEuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmRlbGF5XzIiOjAuMCwiVGVycm9yaXN0OlN0YW5kaW5nOmxlZnRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzptb2RpZmllcl9vZmZzZXQiOi00Ni4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6cmlnaHRfbGltaXQiOjMwLjAsIlRlcnJvcmlzdDpTdGFuZGluZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X2xlZnQiOi0zMC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X21vZGlmaWVyIjoiRGlzYWJsZWQiLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6U3RhbmRpbmc6eWF3X3JpZ2h0IjozNC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpib2R5X3lhdyI6IlJhbmRvbWl6ZSBKaXR0ZXIiLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfY2hva2VfMSI6MTYuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX2Nob2tlXzIiOjE2LjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9jdXN0b21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfZW5hYmxlZCI6ZmFsc2UsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9mb3JjZV9kZWZlbnNpdmUiOmZhbHNlLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2giOiJTdGF0aWMiLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfMSI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfMiI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV9yYW5kb21fY2hva2UiOmZhbHNlLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfcmFuZG9taXphdGlvbiI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3IjoiU3RhdGljIiwiVGVycm9yaXN0OldhbGtpbmc6ZGVmZW5zaXZlX3lhd18xIjowLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfMiI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpkZWZlbnNpdmVfeWF3X29mZnNldCI6MTgwLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlZmVuc2l2ZV95YXdfc3BlZWQiOjIwLjAsIlRlcnJvcmlzdDpXYWxraW5nOmRlbGF5XzEiOjEuMCwiVGVycm9yaXN0OldhbGtpbmc6ZGVsYXlfMiI6Mi4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzpsZWZ0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzptb2RpZmllcl9vZmZzZXQiOi01LjAsIlRlcnJvcmlzdDpXYWxraW5nOnJpZ2h0X2xpbWl0Ijo2MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfYWRkIjp0cnVlLCJUZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfbGVmdCI6LTI1LjAsIlRlcnJvcmlzdDpXYWxraW5nOnlhd19tb2RpZmllciI6IkRpc2FibGVkIiwiVGVycm9yaXN0OldhbGtpbmc6eWF3X29mZnNldCI6MC4wLCJUZXJyb3Jpc3Q6V2Fsa2luZzp5YXdfcmlnaHQiOjM1LjAsImF2b2lkX2JhY2tzdGFiLmVuYWJsZWQiOnRydWUsImZsaWNrX2V4cGxvaXQuY29uZGl0aW9ucyI6W10sImZsaWNrX2V4cGxvaXQuZW5hYmxlZCI6ZmFsc2UsImZyZWVzdGFuZGluZy5kaXNhYmxlcnMiOlsiSW4gQWlyIiwiQWlyIENyb3VjaCJdLCJmcmVlc3RhbmRpbmcuZW5hYmxlZCI6ZmFsc2UsImZyZWVzdGFuZGluZy5zdGF0aWMiOmZhbHNlLCJtYW51YWxfeWF3LmRpcmVjdGlvbiI6IkRpc2FibGVkIiwibWFudWFsX3lhdy5kaXNhYmxlcnMiOltdLCJtYW51YWxfeWF3LnN0YXRpYyI6ZmFsc2UsIm1vZGlmeV9vbl93YXJtdXAuZW5hYmxlZCI6ZmFsc2UsIm9uX3VzZS5lbmFibGVkIjp0cnVlLCJzYWZlX2hlYWQuY29uZGl0aW9ucyI6WyJBaXIgS25pZmUiLCJEaXN0YW5jZSJdLCJzYWZlX2hlYWQuZW5hYmxlZCI6dHJ1ZX0sIk1pc2NlbGxhbmVvdXMiOnsiYXZvaWRfY29sbGlzaW9ucy5lbmFibGVkIjpmYWxzZSwiY2xhbnRhZy5lbmFibGVkIjp0cnVlLCJjb2xsaXNpb25fYWlyX2R1Y2suZW5hYmxlZCI6ZmFsc2UsImVkZ2Vfc3RvcC5lbmFibGVkIjpmYWxzZSwiZmFzdF9sYWRkZXIuZW5hYmxlZCI6dHJ1ZSwibm9fZmFsbF9kYW1hZ2UuZW5hYmxlZCI6dHJ1ZSwic3VwZXJfdG9zcy5lbmFibGVkIjp0cnVlLCJ0cmFzaHRhbGsuZGVsYXkiOjMwLjAsInRyYXNodGFsay5lbmFibGVkIjpmYWxzZSwidW5sb2NrX2ZkX3NwZWVkLmVuYWJsZWQiOnRydWV9LCJWaXN1YWxzIjp7ImFuaW1hdGlvbnMuZWFydGhxdWFrZSI6ZmFsc2UsImFuaW1hdGlvbnMuZW5hYmxlZCI6dHJ1ZSwiYW5pbWF0aW9ucy5pbl9haXIiOiJEaXNhYmxlZCIsImFuaW1hdGlvbnMubW92ZV9sZWFuIjoxMDAuMCwiYW5pbWF0aW9ucy5vbl9ncm91bmQiOiJEaXNhYmxlZCIsImFuaW1hdGlvbnMucGl0Y2hfb25fbGFuZCI6ZmFsc2UsImFuaW1hdGlvbnMuc2xpZGluZ19jcm91Y2giOmZhbHNlLCJhbmltYXRpb25zLnNsaWRpbmdfc2xvd3dhbGsiOmZhbHNlLCJhc3BlY3RfcmF0aW8uZW5hYmxlZCI6ZmFsc2UsImFzcGVjdF9yYXRpby5wcm9wb3J0aW9uIjowLjAsImNvbnNvbGVfY29sb3IuY29sb3IiOiI4MDgwODA5RSIsImNvbnNvbGVfY29sb3IuZW5hYmxlZCI6dHJ1ZSwiY3Jvc3NoYWlyX2luZGljYXRvcnMuY29sb3IiOiI4MDlCQ0VGRiIsImNyb3NzaGFpcl9pbmRpY2F0b3JzLmVuYWJsZWQiOnRydWUsImNyb3NzaGFpcl9pbmRpY2F0b3JzLm9mZnNldCI6NDAuMCwiZGFtYWdlX2luZGljYXRvci5jb2xvciI6IkZGRkZGRkZGIiwiZGFtYWdlX2luZGljYXRvci5lbmFibGVkIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yLmZvbnQiOiJTbWFsbCIsImhpdF9tYXJrZXIuY29sb3IiOiIwMDAwMDBGRiIsImhpdF9tYXJrZXIuZW5hYmxlZCI6dHJ1ZSwiaGl0X21hcmtlci5zaXplIjo0LjAsImhpdF9tYXJrZXIudGhpY2tuZXNzIjoyLjAsImtlZXBfdHJhbnNwYXJlbmN5LmVuYWJsZWQiOnRydWUsImxhZ19jb21wX2JveC5jb2xvciI6IjJGNzVEREZGIiwibGFnX2NvbXBfYm94LmVuYWJsZWQiOnRydWUsIm1hbnVhbF9hcnJvd3MuY29sb3IiOiJGRkZGRkZGRiIsIm1hbnVhbF9hcnJvd3MuZW5hYmxlZCI6dHJ1ZSwibWFudWFsX2Fycm93cy5vZmZzZXQiOjQwLjAsIm5hZGVfcmFkaXVzLmVuYWJsZWQiOnRydWUsIm5hZGVfcmFkaXVzLm1vbG90b3YiOnRydWUsIm5hZGVfcmFkaXVzLm1vbG90b3ZfY29sb3IiOiJEODYwNjBGRiIsIm5hZGVfcmFkaXVzLnNtb2tlIjp0cnVlLCJuYWRlX3JhZGl1cy5zbW9rZV9jb2xvciI6Ijg2OTRDNEZGIiwicmVtb3ZlX2Zvb3RzdGVwc19zaGFkb3cuZW5hYmxlZCI6dHJ1ZSwic2NvcGVfb3ZlcmxheS5hZGRpdGlvbnMiOltdLCJzY29wZV9vdmVybGF5LmNvbG9yIjoiRkZGRkZGOUUiLCJzY29wZV9vdmVybGF5LmVuYWJsZWQiOnRydWUsInNjb3BlX292ZXJsYXkuZXhjbHVkZV9saW5lcyI6W10sInNjb3BlX292ZXJsYXkuZ2FwIjowLjAsInNjb3BlX292ZXJsYXkuc2l6ZSI6NTUuMCwic2tlZXRfaW5kaWNhdG9ycy5lbmFibGVkIjp0cnVlLCJza2VldF9pbmRpY2F0b3JzLml0ZW1zIjpbMS4wLDIuMCwzLjAsNC4wLDUuMCw2LjAsNy4wLDguMCw5LjAsMTAuMCwxMS4wXSwidmVsb2NpdHlfd2FybmluZy5jb2xvciI6IjgwOUJDRUZGIiwidmVsb2NpdHlfd2FybmluZy5lbmFibGVkIjp0cnVlLCJ2ZWxvY2l0eV93YXJuaW5nLm9mZnNldCI6MTYwLjAsInZpZXdtb2RlbC5lbmFibGVkIjpmYWxzZSwidmlld21vZGVsLmZvdiI6NjgwLjAsInZpZXdtb2RlbC5vZmZzZXRfeCI6MjUuMCwidmlld21vZGVsLm9mZnNldF95IjowLjAsInZpZXdtb2RlbC5vZmZzZXRfeiI6LTE1LjB9fQ__");
            v131 = function(v132)
                -- upvalues: l_v120_0 (ref)
                for v133 = #l_v120_0, 1, -1 do
                    local v134 = l_v120_0[v133];
                    if v134.name == v132 then
                        return v134, v133;
                    end;
                end;
                return nil, -1;
            end;
            local function v139()
                -- upvalues: l_v120_0 (ref), l_v121_0 (ref)
                local v135 = {};
                for v136, v137 in pairs(l_v120_0) do
                    local l_name_0 = v137.name;
                    if l_v121_0[v136] then
                        l_name_0 = string.format("* %s", l_name_0);
                    end;
                    table.insert(v135, l_name_0);
                end;
                if #v135 == 0 then
                    return {
                        [1] = "\aFFFFFF40Empty presets list..."
                    };
                else
                    return v135;
                end;
            end;
            local function v141(v140)
                -- upvalues: l_v120_0 (ref)
                return l_v120_0[v140];
            end;
            local function v146()
                -- upvalues: l_v120_0 (ref), l_v121_0 (ref), l_v119_0 (ref), l_v117_0 (ref), v139 (ref)
                l_v120_0 = {};
                for _, v143 in pairs(l_v121_0) do
                    table.insert(l_v120_0, v143);
                end;
                for _, v145 in pairs(l_v119_0) do
                    table.insert(l_v120_0, v145);
                end;
                l_v117_0.list:update(v139());
            end;
            local function v152()
                -- upvalues: l_v117_0 (ref), v131 (ref), v11 (ref), l_play_0 (ref)
                local v147 = l_v117_0.name:get();
                if v147 == "" then
                    return;
                else
                    local v148, _ = v131(v147);
                    if v148 == nil or v148.data == nil then
                        v11.error("Preset data is invalid!");
                        return;
                    else
                        local v150, v151 = l_play_0.decode(v148.data);
                        data = v151;
                        success = v150;
                        if not success or data == nil then
                            v11.error(data);
                            return;
                        else
                            v150, v151 = l_play_0.import(data);
                            data = v151;
                            success = v150;
                            if not success then
                                v11.error(data);
                                return;
                            else
                                v11.success(string.format("%d groups successfully loaded!", data));
                                return;
                            end;
                        end;
                    end;
                end;
            end;
            local function v157()
                -- upvalues: l_v117_0 (ref), l_play_0 (ref), v11 (ref), v131 (ref), l_v119_0 (ref), l_v121_0 (ref), l_v118_0 (ref), v146 (ref)
                local v153 = l_v117_0.name:get();
                if v153 == "" then
                    return;
                else
                    local v154, v155 = l_play_0.encode(l_play_0.export());
                    data = v155;
                    success = v154;
                    if not success then
                        v11.error(data);
                        return;
                    else
                        v154 = {
                            name = v153, 
                            data = data
                        };
                        local v156;
                        v155, v156 = v131(v153);
                        if v155 == nil then
                            v155 = v154;
                            table.insert(l_v119_0, v154);
                        end;
                        if v156 ~= -1 and v156 <= #l_v121_0 then
                            v11.error("Can't modify built-in preset!");
                            return;
                        else
                            v155.data = data;
                            db[l_v118_0] = l_v119_0;
                            v146();
                            v11.success("Preset successfully saved!");
                            return;
                        end;
                    end;
                end;
            end;
            local function v161()
                -- upvalues: l_v117_0 (ref), v131 (ref), v11 (ref), l_v121_0 (ref), l_v119_0 (ref), l_v118_0 (ref), v146 (ref)
                local v158 = l_v117_0.name:get();
                if v158 == "" then
                    return;
                else
                    local v159, v160 = v131(v158);
                    if v159 == nil then
                        v11.error("Preset not selected!");
                        return;
                    elseif v160 ~= -1 and v160 <= #l_v121_0 then
                        v11.error("Can't delete built-in preset!");
                        return;
                    else
                        table.remove(l_v119_0, v160 - #l_v121_0);
                        db[l_v118_0] = l_v119_0;
                        v146();
                        v11.success("Preset successfully deleted!");
                        return;
                    end;
                end;
            end;
            local function v166()
                -- upvalues: l_play_0 (ref), l_clipboard_0 (ref), v11 (ref)
                local v162, v163 = l_play_0.decode(l_clipboard_0.get());
                if not v162 then
                    v11.error(v163);
                    return;
                else
                    local v164, v165 = l_play_0.import(v163);
                    v163 = v165;
                    if not v164 then
                        v11.error(v163);
                        return;
                    else
                        v11.success(string.format("%d groups successfully imported!", v163));
                        return;
                    end;
                end;
            end;
            local function v169()
                -- upvalues: l_play_0 (ref), v11 (ref), l_clipboard_0 (ref)
                local v167, v168 = l_play_0.encode(l_play_0.export());
                if not v167 then
                    v11.error(v168);
                    return;
                else
                    l_clipboard_0.set(v168);
                    v11.success("Preset successfully exported!");
                    return;
                end;
            end;
            l_v117_0.description = v115.description:label("##ss");
            l_v117_0.name = v115.presets:input("Preset Name");
            l_v117_0.load_button = v115.presets:button(v93(v10.get("check"), 5), v152, false);
            l_v117_0.save_button = v115.presets:button(v93(v98("floppy-disk"), 7), v157, true);
            l_v117_0.delete_button = v115.presets:button(v93(v7("\aFF5050FF", v10.get("trash-can")), 7), v161, true);
            l_v117_0.export_button = v115.presets:button(v93(v10.get("up-from-bracket"), 7), v169, true);
            l_v117_0.import_button = v115.presets:button(v93(v10.get("down-to-bracket"), 7), v166, true);
            l_v117_0.list = v115.presets:list("##main.list", {});
            l_v117_0.list:set_callback(function(v170)
                -- upvalues: v141 (ref), l_v117_0 (ref)
                local v171 = v170:get();
                if v171 == nil or v171 <= 0 then
                    return;
                else
                    local v172 = v141(v171);
                    if v172 == nil then
                        return;
                    else
                        print(v172.desc);
                        if v172.desc == nil then
                            l_v117_0.description:visibility(false);
                            l_v117_0.description:name("");
                        else
                            l_v117_0.description:visibility(true);
                            l_v117_0.description:name(v172.desc);
                        end;
                        l_v117_0.name:set(v172.name);
                        return;
                    end;
                end;
            end, true);
            v146();
            v116.main = l_v117_0;
        end;
        l_play_0.bind(v116.categories);
        v113.presets = v116;
    end;
    v42.home = v113;
    v114 = {};
    v115 = v10.get("shield");
    local v173 = {
        tweaks = ui.create(v115, "##tweaks", 1), 
        angles = ui.create(v115, "##angles", 2), 
        hotkeys = ui.create(v115, "##hotkeys", 1), 
        builder = ui.create(v115, "##builder", 2), 
        defensive = ui.create(v115, "##defenive", 2)
    };
    v116 = {
        avoid_backstab = {
            enabled = l_play_0.push("Anti-Aim", "avoid_backstab.enabled", v173.tweaks:switch(v7(l_v43_2(2), v98("knife-kitchen"), l_v43_2(7), "Avoid Backstab")))
        }, 
        on_use = {
            enabled = l_play_0.push("Anti-Aim", "on_use.enabled", v173.tweaks:switch(v7(l_v43_2(2), v98("user-helmet-safety"), l_v43_2(9), "On Use")))
        }, 
        modify_on_warmup = {
            enabled = l_play_0.push("Anti-Aim", "modify_on_warmup.enabled", v173.tweaks:switch(v7(l_v43_2(2), v98("shuffle"), l_v43_2(8), "Modify on Warmup")))
        }
    };
    v120 = {
        enabled = l_play_0.push("Anti-Aim", "flick_exploit.enabled", v173.tweaks:switch(v7(l_v43_2(2), v98("wand-magic-sparkles"), l_v43_2(7), "Flick Exploit")))
    };
    v121 = v120.enabled:create();
    v120.conditions = l_play_0.push("Anti-Aim", "flick_exploit.conditions", v121:selectable("Conditions", {
        [1] = "Standing", 
        [2] = "Walking", 
        [3] = "Crouching", 
        [4] = "Sneaking"
    }));
    v116.flick_exploit = v120;
    v121 = {
        enabled = l_play_0.push("Anti-Aim", "safe_head.enabled", v173.tweaks:switch(v7(l_v43_2(2), v98("face-head-bandage"), l_v43_2(7), "Safe Head")))
    };
    local v174 = v121.enabled:create();
    v121.conditions = l_play_0.push("Anti-Aim", "safe_head.conditions", v174:selectable("Conditions", {
        [1] = "Standing", 
        [2] = "Crouch", 
        [3] = "Air Crouch", 
        [4] = "Air Knife", 
        [5] = "Air Taser", 
        [6] = "Distance"
    }));
    v116.safe_head = v121;
    v114.tweaks = v116;
    v117 = {};
    v118 = {
        enabled = l_play_0.push("Anti-Aim", "freestanding.enabled", v173.hotkeys:switch("Freestanding"))
    };
    v119 = v118.enabled:create();
    v118.static = l_play_0.push("Anti-Aim", "freestanding.static", v119:switch("Static Freestanding"));
    v118.disablers = l_play_0.push("Anti-Aim", "freestanding.disablers", v119:selectable("Disablers", {
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Walking", 
        [4] = "Crouching", 
        [5] = "Sneaking", 
        [6] = "In Air", 
        [7] = "Air Crouch"
    }));
    v117.freestanding = v118;
    v119 = {
        direction = l_play_0.push("Anti-Aim", "manual_yaw.direction", v173.hotkeys:combo("Manual Yaw", {
            [1] = "Disabled", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Backward", 
            [5] = "Forward"
        }))
    };
    v120 = v119.direction:create();
    v119.static = l_play_0.push("Anti-Aim", "manual_yaw.static", v120:switch("Static Manual Yaw"));
    v119.disablers = l_play_0.push("Anti-Aim", "manual_yaw.disablers", v120:selectable("Disablers", {
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Walking", 
        [4] = "Crouching", 
        [5] = "Sneaking", 
        [6] = "In Air", 
        [7] = "Air Crouch"
    }));
    v117.manual_yaw = v119;
    v114.hotkeys = v117;
    v118 = function()
        -- upvalues: v114 (ref), v9 (ref)
        local v175 = v114.builder.state:get();
        local v176 = v114.builder.team:get();
        for v177 = 1, #v9.teams do
            local v178 = v9.teams[v177];
            local v179 = v178 == v176;
            for v180 = 1, #v9.states do
                local v181 = v9.states[v180];
                local v182 = v181 == v175;
                local v183 = v179 and v182;
                local l_angles_0 = v114.builder[v178][v181].angles;
                l_angles_0.yaw_offset:visibility(v183);
                l_angles_0.yaw_add:visibility(v183);
                l_angles_0.yaw_modifier:visibility(v183);
                l_angles_0.body_yaw:visibility(v183);
                local l_defensive_0 = v114.builder[v178][v181].defensive;
                l_defensive_0.force_defensive:visibility(v183);
                l_defensive_0.enabled:visibility(v183);
                if not l_defensive_0.enabled:get() then
                    v183 = false;
                end;
                l_defensive_0.pitch:visibility(v183);
                l_defensive_0.yaw:visibility(v183);
            end;
        end;
    end;
    do
        local l_v173_0, l_v118_1, l_v121_1 = v173, v118, v121;
        v119 = function(v189, v190)
            -- upvalues: l_play_0 (ref), l_v173_0 (ref), l_v96_0 (ref), v103 (ref), l_v118_1 (ref)
            local v191 = {};
            local function v193(v192)
                -- upvalues: v189 (ref), v190 (ref)
                return v189 .. ":" .. v190 .. ":defensive_" .. v192;
            end;
            v191.force_defensive = l_play_0.push("Anti-Aim", v193("force_defensive"), l_v173_0.defensive:switch(l_v96_0(v103("Force Defensive"), v193("force_defensive"))));
            local v194 = v191.force_defensive:create();
            v191.custom_choke = l_play_0.push("Anti-Aim", v193("custom_choke"), v194:switch("Custom Choke"));
            v191.random_choke = l_play_0.push("Anti-Aim", v193("random_choke"), v194:switch("Randomize Choke"));
            v191.choke_1 = l_play_0.push("Anti-Aim", v193("choke_1"), v194:slider("Choke", 1, 22, 16, nil, "t"));
            v191.choke_2 = l_play_0.push("Anti-Aim", v193("choke_2"), v194:slider("2nd Choke", 1, 22, 16, nil, "t"));
            local v195 = nil;
            local function v197()
                -- upvalues: v191 (ref)
                local v196 = v191.force_defensive:get();
                v191.custom_choke:visibility(v196);
                if not v191.custom_choke:get() then
                    v196 = false;
                end;
                v191.random_choke:visibility(v196);
                v191.choke_1:visibility(v196);
                if not v191.random_choke:get() then
                    v196 = false;
                end;
                v191.choke_2:visibility(v196);
            end;
            v191.force_defensive:set_callback(v197);
            v191.custom_choke:set_callback(v197);
            v191.random_choke:set_callback(v197);
            v197();
            v191.enabled = l_play_0.push("Anti-Aim", v193("enabled"), l_v173_0.defensive:switch(l_v96_0(v103("Hidden", "\a{Link Active}"), v193("enabled")))):set_callback(l_v118_1);
            v191.pitch = l_play_0.push("Anti-Aim", v193("pitch"), l_v173_0.defensive:combo(l_v96_0(v103("Pitch"), v193("pitch")), {
                [1] = "Static", 
                [2] = "Jitter", 
                [3] = "Random", 
                [4] = "Spin", 
                [5] = "Sway"
            }));
            v195 = v191.pitch:create();
            v191.pitch_offset = l_play_0.push("Anti-Aim", v193("pitch_offset"), v195:slider("Offset", -89, 89, 0, 1, "\194\176"));
            v191.pitch_1 = l_play_0.push("Anti-Aim", v193("pitch_1"), v195:slider("From", -89, 89, 0, 1, "\194\176"));
            v191.pitch_2 = l_play_0.push("Anti-Aim", v193("pitch_2"), v195:slider("To", -89, 89, 0, 1, "\194\176"));
            v197 = nil;
            local function v199()
                -- upvalues: v191 (ref)
                local v198 = v191.pitch:get();
                v191.pitch_offset:visibility(v198 == "Static");
                v191.pitch_1:visibility(v198 ~= "Static");
                v191.pitch_2:visibility(v198 ~= "Static");
            end;
            v191.pitch:set_callback(v199, true);
            v191.yaw = l_play_0.push("Anti-Aim", v193("yaw"), l_v173_0.defensive:combo(l_v96_0(v103("Yaw"), v193("yaw")), {
                [1] = "Static", 
                [2] = "Switch", 
                [3] = "Random", 
                [4] = "Spin", 
                [5] = "Sway"
            }));
            v197 = v191.yaw:create();
            v191.yaw_offset = l_play_0.push("Anti-Aim", v193("yaw_offset"), v197:slider("Offset", 0, 360, 180, 1, "\194\176"));
            v191.yaw_1 = l_play_0.push("Anti-Aim", v193("yaw_1"), v197:slider("From", -180, 180, 0, 1, "\194\176"));
            v191.yaw_2 = l_play_0.push("Anti-Aim", v193("yaw_2"), v197:slider("To", -180, 180, 0, 1, "\194\176"));
            v191.randomization = l_play_0.push("Anti-Aim", v193("randomization"), v197:slider("Randomization", 0, 20, 0, 1, "t"));
            v191.yaw_speed = l_play_0.push("Anti-Aim", v193("yaw_speed"), v197:slider("Speed", -50, 50, 20, 0.1));
            v199 = nil;
            local function v201()
                -- upvalues: v191 (ref)
                local v200 = v191.yaw:get();
                v191.yaw_offset:visibility(v200 == "Static" or not (v200 ~= "Spin") or v200 == "Sway");
                v191.yaw_1:visibility(v200 == "Switch" or v200 == "Random");
                v191.yaw_2:visibility(v200 == "Switch" or v200 == "Random");
                v191.randomization:visibility(v200 == "Switch");
                v191.yaw_speed:visibility(v200 == "Spin" or v200 == "Sway");
            end;
            v191.yaw:set_callback(v201, true);
            return v191;
        end;
        v120 = function(v202, v203)
            -- upvalues: l_play_0 (ref), l_v173_0 (ref), l_v96_0 (ref), v103 (ref)
            local v204 = {};
            local function v206(v205)
                -- upvalues: v202 (ref), v203 (ref)
                return v202 .. ":" .. v203 .. ":" .. v205;
            end;
            v204.yaw_offset = l_play_0.push("Anti-Aim", v206("yaw_offset"), l_v173_0.builder:slider(l_v96_0(v103("Yaw Offset"), v206("yaw_offset")), -180, 180, 0, nil, "\194\176"));
            v204.yaw_add = l_play_0.push("Anti-Aim", v206("yaw_add"), l_v173_0.builder:switch(l_v96_0(v103("Yaw Add"), v206("yaw_add"))));
            local v207 = v204.yaw_add:create();
            v204.yaw_left = l_play_0.push("Anti-Aim", v206("yaw_left"), v207:slider("Left Offset", -180, 180, 0, nil, "\194\176"));
            v204.yaw_right = l_play_0.push("Anti-Aim", v206("yaw_right"), v207:slider("Right Offset", -180, 180, 0, nil, "\194\176"));
            local function v209()
                -- upvalues: v204 (ref)
                local v208 = v204.yaw_add:get();
                v204.yaw_left:visibility(v208);
                v204.yaw_right:visibility(v208);
            end;
            v204.yaw_add:set_callback(v209, true);
            v204.yaw_modifier = l_play_0.push("Anti-Aim", v206("yaw_modifier"), l_v173_0.builder:combo(l_v96_0(v103("Yaw Modifier"), v206("yaw_modifier")), {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "Spin", 
                [6] = "3-Way", 
                [7] = "5-Way"
            }));
            v209 = v204.yaw_modifier:create();
            v204.modifier_offset = l_play_0.push("Anti-Aim", v206("modifier_offset"), v209:slider("Offset", -180, 180, 0, nil, "\194\176"));
            local function v211()
                -- upvalues: v204 (ref)
                local v210 = v204.yaw_modifier:get();
                v204.modifier_offset:visibility(v210 ~= "Disabled");
            end;
            v204.yaw_modifier:set_callback(v211, true);
            v204.body_yaw = l_play_0.push("Anti-Aim", v206("body_yaw"), l_v173_0.builder:combo(l_v96_0(v103("Body Yaw"), v206("body_yaw")), {
                [1] = "Disabled", 
                [2] = "Left", 
                [3] = "Right", 
                [4] = "Jitter", 
                [5] = "Randomize Jitter"
            }));
            v211 = v204.body_yaw:create();
            v204.left_limit = l_play_0.push("Anti-Aim", v206("left_limit"), v211:slider("Left Limit", 0, 60, 60, nil, "\194\176"));
            v204.right_limit = l_play_0.push("Anti-Aim", v206("right_limit"), v211:slider("Right Limit", 0, 60, 60, nil, "\194\176"));
            v204.delay_1 = l_play_0.push("Anti-Aim", v206("delay_1"), v211:slider("Delay", 0, 16, 0, nil, "t"));
            v204.delay_2 = l_play_0.push("Anti-Aim", v206("delay_2"), v211:slider("2nd Delay", 0, 16, 0, nil, "t"));
            local function v213()
                -- upvalues: v204 (ref)
                local v212 = v204.body_yaw:get();
                v204.left_limit:visibility(v212 ~= "Disabled");
                v204.right_limit:visibility(v212 ~= "Disabled");
                v204.delay_1:visibility(v212 == "Jitter" or v212 == "Randomize Jitter");
                v204.delay_2:visibility(v212 == "Randomize Jitter");
            end;
            v204.body_yaw:set_callback(v213, true);
            return v204;
        end;
        l_v121_1 = {
            team = l_v173_0.angles:combo(v103("Team", "\a{Link Active}"), v9.teams):set_callback(l_v118_1), 
            state = l_v173_0.angles:combo(v103("State", "\a{Link Active}"), v9.states):set_callback(l_v118_1)
        };
        for v214 = 1, #v9.teams do
            local v215 = v9.teams[v214];
            local v216 = {};
            for v217 = 1, #v9.states do
                local v218 = v9.states[v217];
                v216[v218] = {};
                v216[v218].angles = v120(v215, v218);
                v216[v218].defensive = v119(v215, v218);
            end;
            l_v121_1[v215] = v216;
        end;
        v174 = function(v219)
            local v220 = {};
            for v221, v222 in pairs(v219) do
                local v223 = v219[v221];
                if v223 ~= nil then
                    v220[v221] = {};
                    for v224, _ in pairs(v222) do
                        local v226 = v223[v224];
                        if v226 ~= nil then
                            v220[v221][v224] = v226:get();
                        end;
                    end;
                end;
            end;
            return v220;
        end;
        local function v235(v227, v228)
            for v229, v230 in pairs(v227) do
                for v231, _ in pairs(v230) do
                    local v233 = v227[v229][v231];
                    local v234 = v228[v229][v231];
                    if v233 ~= nil and v234 ~= nil then
                        v233:set(v234);
                    end;
                end;
            end;
        end;
        do
            local l_v174_0, l_v235_0 = v174, v235;
            local function v244()
                -- upvalues: l_v121_1 (ref), l_v174_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref), v11 (ref)
                local v238 = l_v121_1.team:get();
                local v239 = l_v121_1.state:get();
                local v240 = l_v121_1[v238][v239];
                if v240 == nil then
                    return;
                else
                    local v241 = l_v174_0(v240);
                    local l_status_1, l_result_1 = pcall(json.stringify, v241);
                    v241 = l_result_1;
                    success = l_status_1;
                    if not success then
                        return;
                    else
                        l_status_1, l_result_1 = pcall(l_base64_0.encode, v241);
                        v241 = l_result_1;
                        success = l_status_1;
                        if not success then
                            return;
                        else
                            l_clipboard_0.set(v241);
                            v11.success("State successfully exported!");
                            return;
                        end;
                    end;
                end;
            end;
            local function v248()
                -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_v121_1 (ref), l_v235_0 (ref), v11 (ref)
                local l_status_2, l_result_2 = pcall(l_clipboard_0.get);
                data = l_result_2;
                success = l_status_2;
                if not success then
                    print("failed 1");
                    return;
                else
                    l_status_2, l_result_2 = pcall(l_base64_0.decode, data);
                    data = l_result_2;
                    success = l_status_2;
                    if not success then
                        print("failed 2");
                        return;
                    else
                        l_status_2, l_result_2 = pcall(json.parse, data);
                        data = l_result_2;
                        success = l_status_2;
                        if not success then
                            print("failed 3");
                            return;
                        else
                            l_status_2 = l_v121_1.team:get();
                            l_result_2 = l_v121_1.state:get();
                            local v247 = l_v121_1[l_status_2][l_result_2];
                            if v247 == nil then
                                print("failed 4");
                                return;
                            else
                                l_v235_0(v247, data);
                                v11.success("State successfully imported!");
                                return;
                            end;
                        end;
                    end;
                end;
            end;
            local function v254()
                -- upvalues: l_v121_1 (ref), l_v174_0 (ref), l_v235_0 (ref), v11 (ref)
                local v249 = l_v121_1.team:get();
                local v250 = l_v121_1.state:get();
                local v251 = l_v121_1[v249][v250];
                if v251 == nil then
                    return;
                else
                    local v252 = l_v174_0(v251);
                    local v253 = l_v121_1[v249 == "Counter-Terrorist" and "Terrorist" or "Counter-Terrorist"][v250];
                    if v253 == nil then
                        return;
                    else
                        l_v235_0(v253, v252);
                        v11.success("State successfully transfered to opposite team!");
                        return;
                    end;
                end;
            end;
            local v255 = l_v121_1.state:create();
            v255:button(v93(v7(v98("arrow-up-from-bracket"), l_v43_2(3), "Copy"), 5), v244, true);
            v255:button(v93(v7(v98("arrow-down-to-bracket"), l_v43_2(3), "Paste"), 5), v248, true);
            v255:button(v93(v7(v98("send-backward"), l_v43_2(3), "Send to another team"), 3), v254, true);
            v114.builder = l_v121_1;
        end;
        l_v118_1();
        v42.antiaim = v114;
    end;
    v115 = {};
    v173 = v10.get("send-backward");
    v116 = {
        category = ui.create(v173, "##category", 1), 
        aimbot = ui.create(v173, "##aimbot", 2), 
        interface = ui.create(v173, "##interface", 2), 
        visuals = ui.create(v173, "##visuals", 1), 
        misc = ui.create(v173, "##misc", 2), 
        movement = ui.create(v173, "##movement", 2), 
        shared = ui.create(v173, "##shared", 1)
    };
    v115.category = v116.category:list("##category", {
        v103("Aimbot"), 
        v103("Visuals"), 
        v103("Misc")
    });
    do
        local l_v116_0, l_v117_1, l_v118_2 = v116, v117, v118;
        l_v117_1 = function(v259)
            -- upvalues: l_v116_0 (ref)
            local v260 = v259:get();
            l_v116_0.aimbot:visibility(v260 == 1);
            l_v116_0.interface:visibility(v260 == 2);
            l_v116_0.visuals:visibility(v260 == 2);
            l_v116_0.misc:visibility(v260 == 2);
            l_v116_0.movement:visibility(v260 == 3);
            l_v116_0.shared:visibility(v260 == 3);
        end;
        l_v118_2 = function(v261)
            local v262 = v261:get();
            local v263 = v261:list();
            local v264 = {};
            for v265 = 1, #v263 do
                local v266 = v263[v265];
                if v262 == v265 then
                    v264[v265] = v266:gsub("\a{Small Text}", "\a{Link Active}");
                else
                    v264[v265] = v266:gsub("\a{Link Active}", "\a{Small Text}");
                end;
            end;
            v261:update(v264);
        end;
        v119 = function(v267)
            -- upvalues: l_v117_1 (ref), l_v118_2 (ref)
            l_v117_1(v267);
            l_v118_2(v267);
        end;
        v115.category:set_callback(v119, true);
        v120 = {};
        if v8.build ~= "Live" then
            v121 = {
                enabled = l_play_0.push("Aimbot", "dormant_aimbot.enabled", l_v116_0.aimbot:switch(v7(l_v43_2(2), v98("person-rays"), l_v43_2(7), "Dormant Aimbot")))
            };
            v174 = v121.enabled:create();
            v121.hitboxes = l_play_0.push("Aimbot", "dormant_aimbot.hitboxes", v174:selectable("Hitboxes", {
                [1] = "Head", 
                [2] = "Chest", 
                [3] = "Stomach", 
                [4] = "Legs"
            }));
            v110(v121.hitboxes);
            v121.accuracy = l_play_0.push("Aimbot", "dormant_aimbot.accuracy", v174:slider("Accuracy", 1, 100, 60, nil, "%"));
            v121.min_damage = l_play_0.push("Aimbot", "dormant_aimbot.min_damage", v174:slider("Min. damage", 0, 130, 10, nil, function(v268)
                if v268 == 0 then
                    return "Auto";
                elseif v268 > 100 then
                    return "+" .. v268;
                else
                    return v268;
                end;
            end));
            v120.dormant_aimbot = v121;
        end;
        if v8.build == "Alpha" then
            v121 = {
                enabled = l_play_0.push("Aimbot", "ai_peek.enabled", l_v116_0.aimbot:switch(v7(l_v43_2(2), v98("microchip-ai"), l_v43_2(7), "AI Peek")))
            };
            v174 = v121.enabled:create();
            v121.hitboxes = l_play_0.push("Aimbot", "ai_peek.hitboxes", v174:selectable("Hitboxes", {
                [1] = "Head", 
                [2] = "Chest", 
                [3] = "Stomach", 
                [4] = "Arms", 
                [5] = "Legs", 
                [6] = "Feet"
            }));
            v110(v121.hitboxes);
            v121.weapons = l_play_0.push("Aimbot", "ai_peek.weapons", v174:selectable("Weapons", {
                [1] = "SSG 08", 
                [2] = "R8 Revolver", 
                [3] = "Desert Eagle", 
                [4] = "Pistol", 
                [5] = "Rifle", 
                [6] = "Shotgun"
            }));
            v110(v121.weapons);
            v121.dots = l_play_0.push("Aimbot", "ai_peek.dots", v174:slider("Dots", 1, 10, 4));
            v121.radius = l_play_0.push("Aimbot", "ai_peek.radius", v174:slider("Radius", 32, 64, 32));
            v121.color = l_play_0.push("Aimbot", "ai_peek.color", v174:color_picker("Color"));
            v120.ai_peek = v121;
        end;
        v121 = {
            enabled = l_play_0.push("Aimbot", "log_events.enabled", l_v116_0.aimbot:switch(v7(l_v43_2(2), v98("pen-field"), l_v43_2(5), "Log Events")))
        };
        v174 = v121.enabled:create();
        v121.output = l_play_0.push("Aimbot", "log_events.output", v174:selectable("Output", {
            [1] = "Console", 
            [2] = "Debug", 
            [3] = "Notify"
        }));
        v121.color_hit = l_play_0.push("Aimbot", "log_events.color_hit", v174:color_picker("Hit Color", color(195, 202, 255, 255)));
        v121.color_miss = l_play_0.push("Aimbot", "log_events.color_miss", v174:color_picker("Miss Color", color(255, 146, 146, 255)));
        local v269 = nil;
        do
            local l_v121_2 = v121;
            local function v272()
                -- upvalues: l_v121_2 (ref)
                local v271 = l_v121_2.enabled:get();
                l_v121_2.output:visibility(v271);
                if #l_v121_2.output:get() == 0 then
                    v271 = false;
                end;
                l_v121_2.color_hit:visibility(v271);
                l_v121_2.color_miss:visibility(v271);
            end;
            l_v121_2.output:set_callback(v272);
            l_v121_2.enabled:set_callback(v272);
            v272();
            v120.log_events = l_v121_2;
            v174 = {
                enabled = l_play_0.push("Aimbot", "maxusrcmdprocessticks.enabled", l_v116_0.aimbot:switch(v7(l_v43_2(1), " ", v98("code-compare"), l_v43_2(7), "Max User Process Ticks")))
            };
            v269 = v174.enabled:create();
            v174.ticks = l_play_0.push("Aimbot", "maxusrcmdprocessticks.ticks", v269:slider("Value", 8, 32, 16, nil, function(v273)
                if v273 == 16 then
                    return "Default";
                else
                    return v273 .. "t";
                end;
            end));
            v272 = nil;
            do
                local l_v269_0 = v269;
                local function v276(v275)
                    -- upvalues: l_v269_0 (ref)
                    l_v269_0:visibility(v275:get());
                end;
                v174.enabled:set_callback(v276, true);
                v120.maxusrcmdprocessticks = v174;
            end;
            v120.fake_latency = {
                enabled = l_play_0.push("Aimbot", "fake_latency.enabled", l_v116_0.aimbot:switch(v7(l_v43_2(2), " ", v98("satellite-dish"), l_v43_2(6), "Unlock Fake Latency")))
            };
            v115.aimbot = v120;
        end;
        v121 = {};
        v174 = {
            enabled = l_play_0.push("Visuals", "crosshair_indicators.enabled", l_v116_0.interface:switch(v7(l_v43_2(2), v98("crosshairs"), l_v43_2(7), "Crosshair Indicators")))
        };
        v269 = v174.enabled:create();
        v174.offset = l_play_0.push("Visuals", "crosshair_indicators.offset", v269:slider("Offset", 0, 200, 40, nil, "px"));
        v174.color = l_play_0.push("Visuals", "crosshair_indicators.color", v269:color_picker("Color", color(192, 202, 255, 255)));
        local v277 = nil;
        do
            local l_v269_1 = v269;
            local function v280(v279)
                -- upvalues: l_v269_1 (ref)
                l_v269_1:visibility(v279:get());
            end;
            v174.enabled:set_callback(v280, true);
            v121.crosshair_indicators = v174;
        end;
        v269 = {
            enabled = l_play_0.push("Visuals", "manual_arrows.enabled", l_v116_0.interface:switch(v7(l_v43_2(2), v98("location-arrow"), l_v43_2(8), "Manual Arrows")))
        };
        v277 = v269.enabled:create();
        v269.offset = l_play_0.push("Visuals", "manual_arrows.offset", v277:slider("Offset", 0, 200, 40, nil, "px"));
        v269.color = l_play_0.push("Visuals", "manual_arrows.color", v277:color_picker("Color", color(255, 255, 255, 255)));
        local v281 = nil;
        do
            local l_v277_0 = v277;
            local function v284(v283)
                -- upvalues: l_v277_0 (ref)
                l_v277_0:visibility(v283:get());
            end;
            v269.enabled:set_callback(v284, true);
            v121.manual_arrows = v269;
        end;
        v277 = {
            enabled = l_play_0.push("Visuals", "damage_indicator.enabled", l_v116_0.interface:switch(v7(l_v43_2(2), v98("hundred-points"), l_v43_2(7), "Damage Indicator")))
        };
        v281 = v277.enabled:create();
        v277.font = l_play_0.push("Visuals", "damage_indicator.font", v281:combo("Font", {
            [1] = "Small", 
            [2] = "Pixel", 
            [3] = "Bold"
        }));
        v277.color = l_play_0.push("Visuals", "damage_indicator.color", v281:color_picker("Color", color(255, 255, 255, 255)));
        local v285 = nil;
        do
            local l_v281_0 = v281;
            local function v288(v287)
                -- upvalues: l_v281_0 (ref)
                l_v281_0:visibility(v287:get());
            end;
            v277.enabled:set_callback(v288, true);
            v121.damage_indicator = v277;
        end;
        v281 = {
            enabled = l_play_0.push("Visuals", "velocity_warning.enabled", l_v116_0.interface:switch(v7(l_v43_2(1), " ", v98("chart-line"), l_v43_2(5), " ", "Velocity Warning")))
        };
        v285 = v281.enabled:create();
        local v289 = render.screen_size();
        v281.offset = l_play_0.push("Visuals", "velocity_warning.offset", v285:slider("Offset", 0, v289.y * 0.5, 160));
        v281.color = l_play_0.push("Visuals", "velocity_warning.color", v285:color_picker("Color", color(192, 202, 255, 255)));
        local v290 = nil;
        do
            local l_v285_0 = v285;
            local function v293(v292)
                -- upvalues: l_v285_0 (ref)
                l_v285_0:visibility(v292:get());
            end;
            v281.enabled:set_callback(v293, true);
            v121.velocity_warning = v281;
        end;
        v285 = {
            enabled = l_play_0.push("Visuals", "skeet_indicators.enabled", l_v116_0.interface:switch(v7(l_v43_2(3), v98("scanner-touchscreen"), l_v43_2(6), "Skeet Indicators")))
        };
        v289 = v285.enabled:create();
        v285.items = l_play_0.push("Visuals", "skeet_indicators.items", v289:listable("##skeet_indicators.items", {
            [1] = "PING", 
            [2] = "DT", 
            [3] = "OSAA", 
            [4] = "DUCK", 
            [5] = "DA", 
            [6] = "SAFE", 
            [7] = "BODY", 
            [8] = "MD", 
            [9] = "HC", 
            [10] = "FS", 
            [11] = "Bomb Information"
        }));
        v110(v285.items);
        v290 = nil;
        do
            local l_v289_0 = v289;
            local function v296(v295)
                -- upvalues: l_v289_0 (ref)
                l_v289_0:visibility(v295:get());
            end;
            v285.enabled:set_callback(v296, true);
            v121.skeet_indicators = v285;
        end;
        v289 = {
            enabled = l_play_0.push("Visuals", "animations.enabled", l_v116_0.visuals:switch(v7(l_v43_2(3), v98("layer-group"), l_v43_2(8), "Animations")))
        };
        v290 = v289.enabled:create();
        local v297 = {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Walking", 
            [4] = "Jitter", 
            [5] = "Kangaroo"
        };
        v289.on_ground = l_play_0.push("Visuals", "animations.on_ground", v290:combo("On Ground", v297));
        v289.in_air = l_play_0.push("Visuals", "animations.in_air", v290:combo("In Air", v297));
        v289.pitch_on_land = l_play_0.push("Visuals", "animations.pitch_on_land", v290:switch("0 Pitch on Land"));
        v289.sliding_slowwalk = l_play_0.push("Visuals", "animations.sliding_slowwalk", v290:switch("Sliding Slow Walk"));
        v289.sliding_crouch = l_play_0.push("Visuals", "animations.sliding_crouch", v290:switch("Sliding Crouch"));
        v289.earthquake = l_play_0.push("Visuals", "animations.earthquake", v290:switch("Earthquake"));
        v289.move_lean = l_play_0.push("Visuals", "animations.move_lean", v290:slider("Move Lean", 0, 100, 0, nil, "%"));
        v297 = nil;
        do
            local l_v290_0 = v290;
            local function v300(v299)
                -- upvalues: l_v290_0 (ref)
                l_v290_0:visibility(v299:get());
            end;
            v289.enabled:set_callback(v300, true);
            v121.animations = v289;
        end;
        v290 = {
            enabled = l_play_0.push("Visuals", "hit_marker.enabled", l_v116_0.visuals:switch(v7(l_v43_2(2), " ", v98("xmark-large"), l_v43_2(7), " ", "Hit Marker")))
        };
        v297 = v290.enabled:create();
        v290.size = l_play_0.push("Visuals", "hit_marker.size", v297:slider("Size", 2, 5, 4, nil, "px"));
        v290.thickness = l_play_0.push("Visuals", "hit_marker.thickness", v297:slider("Thickness", 1, 5, 2, nil, "px"));
        v290.color = l_play_0.push("Visuals", "hit_marker.color", v297:color_picker("Color", color(0, 255, 255, 255)));
        local v301 = nil;
        do
            local l_v297_0 = v297;
            local function v304(v303)
                -- upvalues: l_v297_0 (ref)
                l_v297_0:visibility(v303:get());
            end;
            v290.enabled:set_callback(v304, true);
            v121.hit_marker = v290;
        end;
        v297 = {
            enabled = l_play_0.push("Visuals", "scope_overlay.enabled", l_v116_0.visuals:switch(v7(l_v43_2(3), v98("crosshairs-simple"), l_v43_2(8), "Scope Overlay")))
        };
        v301 = v297.enabled:create();
        v297.additions = l_play_0.push("Visuals", "scope_overlay.additions", v301:selectable("Additions", {
            [1] = "Inverted", 
            [2] = "Rotated", 
            [3] = "Spread Dependency"
        }));
        v297.exclude_lines = l_play_0.push("Visuals", "scope_overlay.exclude_lines", v301:selectable("Exclude Lines", {
            [1] = "Left", 
            [2] = "Right", 
            [3] = "Top", 
            [4] = "Bottom"
        }));
        v297.size = l_play_0.push("Visuals", "scope_overlay.size", v301:slider("Size", 0, 300, 50, nil, "px"));
        v297.gap = l_play_0.push("Visuals", "scope_overlay.gap", v301:slider("Gap", 0, 300, 5, nil, "px"));
        v297.color = l_play_0.push("Visuals", "scope_overlay.color", v301:color_picker("Color", color(255, 255, 255, 255)));
        local v305 = nil;
        do
            local l_v301_0 = v301;
            local function v308(v307)
                -- upvalues: l_v301_0 (ref)
                l_v301_0:visibility(v307:get());
            end;
            v297.enabled:set_callback(v308, true);
            v121.scope_overlay = v297;
        end;
        v301 = {
            enabled = l_play_0.push("Visuals", "nade_radius.enabled", l_v116_0.visuals:switch(v7(l_v43_2(2), " ", v98("fire"), l_v43_2(7), " ", "Nade Radius")))
        };
        v305 = v301.enabled:create();
        v301.molotov = l_play_0.push("Visuals", "nade_radius.molotov", v305:switch("Molotov"));
        v301.molotov_color = l_play_0.push("Visuals", "nade_radius.molotov_color", v301.molotov:color_picker(color(255, 63, 63, 255)));
        v301.smoke = l_play_0.push("Visuals", "nade_radius.smoke", v305:switch("Smoke"));
        v301.smoke_color = l_play_0.push("Visuals", "nade_radius.smoke_color", v301.smoke:color_picker(color(61, 147, 250, 255)));
        local v309 = nil;
        do
            local l_v305_0 = v305;
            local function v312(v311)
                -- upvalues: l_v305_0 (ref)
                l_v305_0:visibility(v311:get());
            end;
            v301.enabled:set_callback(v312, true);
            v121.nade_radius = v301;
        end;
        v305 = {
            enabled = l_play_0.push("Visuals", "lag_comp_box.enabled", l_v116_0.visuals:switch(v7(l_v43_2(2), " ", v98("box"), l_v43_2(7), " ", "Lag Comp Box")))
        };
        v309 = v305.enabled:create();
        v305.color = l_play_0.push("Visuals", "lag_comp_box.color", v309:color_picker("Color", color(47, 117, 221, 255)));
        local v313 = nil;
        do
            local l_v309_0 = v309;
            local function v316(v315)
                -- upvalues: l_v309_0 (ref)
                l_v309_0:visibility(v315:get());
            end;
            v305.enabled:set_callback(v316, true);
            v121.lag_comp_box = v305;
        end;
        v309 = {
            enabled = l_play_0.push("Visuals", "console_color.enabled", l_v116_0.visuals:switch(v7(l_v43_2(3), v98("rectangle-terminal"), l_v43_2(8), "Console Color")))
        };
        v309.color = l_play_0.push("Visuals", "console_color.color", v309.enabled:color_picker(color(128, 128, 128, 255)));
        v313 = nil;
        do
            local l_v309_1, l_v313_0 = v309, v313;
            local function v320(v319)
                -- upvalues: l_v309_1 (ref)
                l_v309_1.color:visibility(v319:get());
            end;
            l_v309_1.enabled:set_callback(v320, true);
            v121.console_color = l_v309_1;
            l_v313_0 = {
                enabled = l_play_0.push("Visuals", "aspect_ratio.enabled", l_v116_0.misc:switch(v7(l_v43_2(2), v98("tv"), l_v43_2(7), "Aspect Ratio")))
            };
            v320 = l_v313_0.enabled:create();
            local v321 = {
                [1] = "5:4", 
                [2] = "4:3", 
                [3] = "3:2", 
                [4] = "16:10", 
                [5] = "16:9"
            };
            local v322 = {
                ["4:3"] = 133, 
                ["5:4"] = 125, 
                ["16:9"] = 177, 
                ["16:10"] = 160, 
                ["3:2"] = 150
            };
            local v323 = {};
            for v324 = 1, #v321 do
                local v325 = v321[v324];
                v323[v322[v325]] = v325;
            end;
            do
                local l_v323_0 = v323;
                local function v328(v327)
                    -- upvalues: l_v323_0 (ref)
                    if v327 == 0 then
                        return "Off";
                    else
                        return l_v323_0[v327];
                    end;
                end;
                l_v313_0.proportion = l_play_0.push("Visuals", "aspect_ratio.proportion", v320:slider("Aspect Ratio", 0, 200, 0, 0.01, v328));
                for v329 = 1, #v321 do
                    local v330 = v321[v329];
                    local v331 = v322[v330];
                    do
                        local l_v331_0 = v331;
                        local function v333()
                            -- upvalues: l_v313_0 (ref), l_v331_0 (ref)
                            l_v313_0.proportion:set(l_v331_0);
                        end;
                        v320:button(v93(v330, 3), v333, true);
                    end;
                end;
            end;
            v321 = nil;
            do
                local l_v320_0 = v320;
                v322 = function(v335)
                    -- upvalues: l_v320_0 (ref)
                    l_v320_0:visibility(v335:get());
                end;
                l_v313_0.enabled:set_callback(v322, true);
                v121.aspect_ratio = l_v313_0;
            end;
            v320 = {
                enabled = l_play_0.push("Visuals", "viewmodel.enabled", l_v116_0.misc:switch(v7(l_v43_2(3), v98("hand"), l_v43_2(8), "Viewmodel")))
            };
            v321 = v320.enabled:create();
            v320.fov = l_play_0.push("Visuals", "viewmodel.fov", v321:slider("Field of View", 0, 1000, 680, 0.1, "\194\176"));
            v320.offset_x = l_play_0.push("Visuals", "viewmodel.offset_x", v321:slider("Offset X", -100, 100, 25, 0.1, "\194\176"));
            v320.offset_y = l_play_0.push("Visuals", "viewmodel.offset_y", v321:slider("Offset Y", -100, 100, 0, 0.1, "\194\176"));
            v320.offset_z = l_play_0.push("Visuals", "viewmodel.offset_z", v321:slider("Offset Z", -100, 100, -15, 0.1, "\194\176"));
            v321:button("Reset", function()
                -- upvalues: v320 (ref)
                v320.fov:reset();
                v320.offset_x:reset();
                v320.offset_y:reset();
                v320.offset_z:reset();
            end, true);
            v322 = nil;
            do
                local l_v321_0 = v321;
                v323 = function(v337)
                    -- upvalues: l_v321_0 (ref)
                    l_v321_0:visibility(v337:get());
                end;
                v320.enabled:set_callback(v323, true);
                v121.viewmodel = v320;
            end;
            v121.keep_transparency = {
                enabled = l_play_0.push("Visuals", "keep_transparency.enabled", l_v116_0.misc:switch(v7(l_v43_2(2), " ", v98("transporter-2"), l_v43_2(6), " ", "Keep Transparency")))
            };
            v121.remove_footsteps_shadow = {
                enabled = l_play_0.push("Visuals", "remove_footsteps_shadow.enabled", l_v116_0.misc:switch(v7(l_v43_2(3), v98("shoe-prints"), l_v43_2(6), "Remove Footsteps Shadow")))
            };
            v115.visuals = v121;
        end;
        v174 = {
            avoid_collisions = {
                enabled = l_play_0.push("Miscellaneous", "avoid_collisions.enabled", l_v116_0.movement:switch(v7(l_v43_2(4), v98("person-rays"), l_v43_2(7), "Avoid Collisions")))
            }, 
            collision_air_duck = {
                enabled = l_play_0.push("Miscellaneous", "collision_air_duck.enabled", l_v116_0.movement:switch(v7(l_v43_2(4), v98("person-walking-dashed-line-arrow-right"), l_v43_2(5), "Collision Air Duck")))
            }, 
            fast_ladder = {
                enabled = l_play_0.push("Miscellaneous", "fast_ladder.enabled", l_v116_0.movement:switch(v7(l_v43_2(3), v98("water-ladder"), l_v43_2(7), "Fast Ladder")))
            }, 
            super_toss = {
                enabled = l_play_0.push("Miscellaneous", "super_toss.enabled", l_v116_0.movement:switch(v7(l_v43_2(4), v98("bomb"), l_v43_2(7), "Super Toss")))
            }, 
            edge_stop = {
                enabled = l_play_0.push("Miscellaneous", "edge_stop.enabled", l_v116_0.movement:switch(v7(l_v43_2(3), v98("person-falling-burst"), l_v43_2(6), "Edge Stop")))
            }, 
            no_fall_damage = {
                enabled = l_play_0.push("Miscellaneous", "no_fall_damage.enabled", l_v116_0.movement:switch(v7(l_v43_2(2), v98("person-arrow-up-from-line"), l_v43_2(7), "No Fall Damage")))
            }, 
            unlock_fd_speed = {
                enabled = l_play_0.push("Miscellaneous", "unlock_fd_speed.enabled", l_v116_0.movement:switch(v7(l_v43_2(3), v98("duck"), l_v43_2(8), "Unlock FD Speed")))
            }
        };
        v301 = {
            enabled = l_play_0.push("Miscellaneous", "trashtalk.enabled", l_v116_0.shared:switch(v7(l_v43_2(4), v98("trash-can"), l_v43_2(8), "Trashtalk")))
        };
        v305 = v301.enabled:create();
        v301.delay = l_play_0.push("Miscellaneous", "trashtalk.delay", v305:slider("Delay", 0, 50, 30, 0.1, "s"));
        v309 = nil;
        do
            local l_v305_1 = v305;
            v313 = function(v339)
                -- upvalues: l_v305_1 (ref)
                l_v305_1:visibility(v339:get());
            end;
            v301.enabled:set_callback(v313, true);
            v174.trashtalk = v301;
        end;
        v174.clantag = {
            enabled = l_play_0.push("Miscellaneous", "clantag.enabled", l_v116_0.shared:switch(v7(l_v43_2(3), v98("tags"), l_v43_2(8), "Clantag")))
        };
        v115.misc = v174;
        v42.other = v115;
    end;
end;
v43 = nil;
v43 = {
    is_moving = false, 
    is_onground = false, 
    is_crouched = false, 
    sent_packets = 0, 
    duck_amount = 0, 
    velocity2d_sqr = 0, 
    side = -1, 
    desync_delta = 0
};
v93 = function(v340)
    -- upvalues: v43 (ref)
    local v341 = entity.get_local_player();
    if v341 == nil then
        return;
    else
        local l_m_fFlags_0 = v341.m_fFlags;
        local l_m_vecVelocity_0 = v341.m_vecVelocity;
        local l_m_flDuckAmount_0 = v341.m_flDuckAmount;
        local v345 = bit.band(l_m_fFlags_0, 1) ~= 0;
        local v346 = math.abs(v341.m_flPoseParameter[11] * 2 - 1);
        local v347 = l_m_vecVelocity_0:length2dsqr();
        v43.is_moving = v347 > 25;
        v43.is_onground = v345;
        if v340.choked_commands == 0 then
            v43.sent_packets = v43.sent_packets + 1;
            v43.is_crouched = l_m_flDuckAmount_0 > 0.5;
            v43.duck_amount = l_m_flDuckAmount_0;
            v43.desync_delta = v346;
        end;
        v43.velocity2d_sqr = v347;
        if v340.sidemove ~= 0 then
            v43.side = v340.sidemove < 0 and -1 or 1;
        end;
        return;
    end;
end;
events.createmove(v93);
v93 = nil;
v93 = {};
v96 = {};
v98 = 0;
do
    local l_v96_1, l_v98_0 = v96, v98;
    local function v351(v350)
        -- upvalues: l_v98_0 (ref), l_v96_1 (ref)
        l_v98_0 = l_v98_0 + 1;
        l_v96_1[l_v98_0] = v350;
    end;
    local function v353()
        -- upvalues: l_v98_0 (ref), l_v96_1 (ref)
        for v352 = 1, l_v98_0 do
            l_v96_1[v352] = nil;
        end;
        l_v98_0 = 0;
    end;
    local function v354()
        -- upvalues: v43 (ref), v351 (ref), v18 (ref)
        if not v43.is_onground then
            return;
        elseif v43.is_moving then
            v351("Running");
            if v43.is_crouched then
                return;
            else
                if v18.antiaim.misc.slow_walk:get() then
                    v351("Walking");
                end;
                return;
            end;
        else
            v351("Standing");
            return;
        end;
    end;
    local function v355()
        -- upvalues: v43 (ref), v351 (ref)
        if not v43.is_crouched then
            return;
        else
            v351("Crouching");
            if v43.is_moving then
                v351("Sneaking");
            end;
            return;
        end;
    end;
    local function v356()
        -- upvalues: v43 (ref), v351 (ref)
        if v43.is_onground then
            return;
        else
            v351("In Air");
            if v43.is_crouched then
                v351("Air Crouch");
            end;
            return;
        end;
    end;
    v93.get = function()
        -- upvalues: l_v96_1 (ref)
        return l_v96_1[#l_v96_1];
    end;
    local function v357()
        -- upvalues: v353 (ref), v354 (ref), v355 (ref), v356 (ref)
        v353();
        v354();
        v355();
        v356();
    end;
    events.createmove(v357);
end;
v96 = nil;
v96 = {
    get = function()
        local v358 = entity.get_local_player();
        if v358 == nil then
            return;
        else
            local l_m_iTeamNum_0 = v358.m_iTeamNum;
            if l_m_iTeamNum_0 == 2 then
                return "Terrorist";
            elseif l_m_iTeamNum_0 == 3 then
                return "Counter-Terrorist";
            else
                return;
            end;
        end;
    end
};
v98 = nil;
v98 = {};
local function v370(v360, v361, v362)
    local v363 = "";
    local v364 = #v360 - 1;
    local v365 = (v362.r - v361.r) / v364;
    local v366 = (v362.g - v361.g) / v364;
    local v367 = (v362.b - v361.b) / v364;
    local v368 = (v362.a - v361.a) / v364;
    for v369 = 1, v364 + 1 do
        v363 = v363 .. "\a" .. v361:to_hex() .. v360:sub(v369, v369);
        v361.r = v361.r + v365;
        v361.g = v361.g + v366;
        v361.b = v361.b + v367;
        v361.a = v361.a + v368;
    end;
    return v363;
end;
local function v374()
    local v371 = {};
    local v372 = "abcdefghijklmnopqrstuvwxyz0123456789@#$&*+-/=?_";
    local v373 = nil;
    repeat
        v373 = math.random(1, #v372);
    until not v371[v373];
    v371[v373] = true;
    return v372:sub(v373, v373);
end;
do
    local l_v370_0, l_v374_0 = v370, v374;
    v98.matrix = function(v377, v378, v379)
        -- upvalues: l_v374_0 (ref), l_v370_0 (ref)
        v378 = v378:clone();
        v379 = v379:clone();
        local _ = "";
        local v381 = math.abs(globals.realtime * 0.4 % 2 - 1) * (#v377 + 1);
        v381 = math.max(0, math.min(v381, #v377));
        local v382 = "";
        for _ = 1, #v377 do
            v382 = v382 .. l_v374_0();
        end;
        return v377:sub(1, v381) .. l_v370_0(v382.sub(v382, v381 + 1), v378, v379);
    end;
end;
v370 = nil;
v374 = nil;
v374 = {};
local v384 = 0;
local v385 = false;
local v386 = false;
local v387 = 0;
local v388 = {};
local l_angles_1 = v18.antiaim.angles;
local function v391(v390)
    v390:override(nil);
end;
local function v393(v392, ...)
    if ... == nil then
        return;
    else
        v392:override(...);
        return;
    end;
end;
local v394 = {};
v394.__index = v394;
v394.clear = function(v395)
    for v396 in pairs(v395) do
        v395[v396] = nil;
    end;
end;
v394.copy = function(v397, v398)
    for v399, v400 in pairs(v398) do
        v397[v399] = v400;
    end;
end;
do
    local l_l_angles_1_0, l_v391_0, l_v393_0 = l_angles_1, v391, v393;
    v394.unset = function(_)
        -- upvalues: l_v391_0 (ref), l_l_angles_1_0 (ref)
        l_v391_0(l_l_angles_1_0.extended_roll);
        l_v391_0(l_l_angles_1_0.extended_pitch);
        l_v391_0(l_l_angles_1_0.extended_angles);
        l_v391_0(l_l_angles_1_0.body_freestanding);
        l_v391_0(l_l_angles_1_0.disable_yaw_modifiers);
        l_v391_0(l_l_angles_1_0.freestanding);
        l_v391_0(l_l_angles_1_0.freestanding_body_yaw);
        l_v391_0(l_l_angles_1_0.options);
        l_v391_0(l_l_angles_1_0.right_limit);
        l_v391_0(l_l_angles_1_0.left_limit);
        l_v391_0(l_l_angles_1_0.inverter);
        l_v391_0(l_l_angles_1_0.body_yaw);
        l_v391_0(l_l_angles_1_0.modifier_offset);
        l_v391_0(l_l_angles_1_0.yaw_modifier);
        l_v391_0(l_l_angles_1_0.hidden);
        l_v391_0(l_l_angles_1_0.avoid_backstab);
        l_v391_0(l_l_angles_1_0.yaw_offset);
        l_v391_0(l_l_angles_1_0.yaw_base);
        l_v391_0(l_l_angles_1_0.yaw);
        l_v391_0(l_l_angles_1_0.pitch);
        l_v391_0(l_l_angles_1_0.enabled);
    end;
    v394.set = function(v405)
        -- upvalues: l_v393_0 (ref), l_l_angles_1_0 (ref)
        if v405.yaw_offset ~= nil then
            v405.yaw_offset = math.normalize_yaw(v405.yaw_offset);
        end;
        if v405.modifier_offset ~= nil then
            v405.modifier_offset = math.normalize_yaw(v405.modifier_offset);
        end;
        if v405.left_limit ~= nil then
            v405.left_limit = math.clamp(v405.left_limit, 0, 60);
        end;
        if v405.right_limit ~= nil then
            v405.right_limit = math.clamp(v405.right_limit, 0, 60);
        end;
        if v405.extended_pitch ~= nil then
            v405.extended_pitch = math.normalize_yaw(v405.extended_pitch);
        end;
        if v405.extended_roll ~= nil then
            v405.extended_roll = math.clamp(v405.extended_roll, -90, 90);
        end;
        l_v393_0(l_l_angles_1_0.enabled, v405.enabled);
        l_v393_0(l_l_angles_1_0.pitch, v405.pitch);
        l_v393_0(l_l_angles_1_0.yaw, v405.yaw);
        l_v393_0(l_l_angles_1_0.yaw_base, v405.yaw_base);
        l_v393_0(l_l_angles_1_0.yaw_offset, v405.yaw_offset);
        l_v393_0(l_l_angles_1_0.avoid_backstab, v405.avoid_backstab);
        l_v393_0(l_l_angles_1_0.hidden, v405.hidden);
        l_v393_0(l_l_angles_1_0.yaw_modifier, v405.yaw_modifier);
        l_v393_0(l_l_angles_1_0.modifier_offset, v405.modifier_offset);
        l_v393_0(l_l_angles_1_0.body_yaw, v405.body_yaw);
        l_v393_0(l_l_angles_1_0.inverter, v405.inverter);
        l_v393_0(l_l_angles_1_0.left_limit, v405.left_limit);
        l_v393_0(l_l_angles_1_0.right_limit, v405.right_limit);
        l_v393_0(l_l_angles_1_0.options, v405.options);
        l_v393_0(l_l_angles_1_0.freestanding_body_yaw, v405.freestanding_body_yaw);
        l_v393_0(l_l_angles_1_0.freestanding, v405.freestanding);
        l_v393_0(l_l_angles_1_0.disable_yaw_modifiers, v405.disable_yaw_modifiers);
        l_v393_0(l_l_angles_1_0.body_freestanding, v405.body_freestanding);
        l_v393_0(l_l_angles_1_0.extended_angles, v405.extended_angles);
        l_v393_0(l_l_angles_1_0.extended_pitch, v405.extended_pitch);
        l_v393_0(l_l_angles_1_0.extended_roll, v405.extended_roll);
    end;
    setmetatable(v388, v394);
    v374.buffer = v388;
end;
l_angles_1 = {};
v391 = false;
v393 = false;
v394 = function(v406, v407, v408)
    return v406 + v408 * (v407 - v406);
end;
do
    local l_v384_0, l_v385_0, l_v386_0, l_v387_0, l_v388_0, l_l_angles_1_1, l_v391_1, l_v393_1, l_v394_0 = v384, v385, v386, v387, v388, l_angles_1, v391, v393, v394;
    do
        local l_l_v391_1_0, l_l_v394_0_0 = l_v391_1, l_v394_0;
        local function v420()
            -- upvalues: l_l_v391_1_0 (ref)
            l_l_v391_1_0 = not l_l_v391_1_0;
        end;
        local function v429(_, v422)
            -- upvalues: l_v388_0 (ref), l_l_v391_1_0 (ref), l_l_v394_0_0 (ref)
            local v423 = v422.pitch:get();
            local v424 = v422.pitch_offset:get();
            local v425 = v422.pitch_1:get();
            local v426 = v422.pitch_2:get();
            l_v388_0.pitch = "Down";
            if v423 == "Static" then
                return v424;
            elseif v423 == "Jitter" then
                return l_l_v391_1_0 and v425 or v426;
            elseif v423 == "Random" then
                return (utils.random_int(v425, v426));
            elseif v423 == "Spin" then
                local v427 = globals.curtime * 1.5;
                return (l_l_v394_0_0(v425, v426, v427 % 1));
            elseif v423 == "Sway" then
                local v428 = globals.curtime * 5;
                return (l_l_v394_0_0(v425, v426, math.sin(v428) % 1));
            else
                return 0;
            end;
        end;
        local function v445(_, v431)
            -- upvalues: l_v388_0 (ref), l_v385_0 (ref), l_l_v394_0_0 (ref)
            local v432 = v431.yaw:get();
            local v433 = v431.yaw_offset:get();
            local v434 = v431.yaw_1:get();
            local v435 = v431.yaw_2:get();
            local _ = v431.randomization:get();
            local v437 = v431.yaw_speed:get();
            l_v388_0.yaw = "Backward";
            l_v388_0.yaw_base = "At Target";
            l_v388_0.yaw_offset = 0;
            l_v388_0.hidden = true;
            l_v388_0.yaw_add = false;
            l_v388_0.yaw_left = 0;
            l_v388_0.yaw_right = 0;
            l_v388_0.yaw_modifier = "Disabled";
            l_v388_0.modifier_offset = 0;
            l_v388_0.inverter = false;
            l_v388_0.left_limit = 60;
            l_v388_0.right_limit = 60;
            l_v388_0.options = {};
            l_v388_0.freestanding_body_yaw = "Off";
            if v432 == "Static" then
                l_v388_0.body_yaw = "Left";
                return v433;
            elseif v432 == "Switch" then
                return l_v385_0 and v434 or v435;
            elseif v432 == "Random" then
                local v438 = utils.random_int(v434, v435);
                l_v388_0.body_yaw = "Left";
                return v438;
            elseif v432 == "Spin" then
                local v439 = globals.curtime * v437 * 0.1;
                local v440 = v433 * 0.5;
                local v441 = l_l_v394_0_0(-v440, v440, v439 % 1);
                l_v388_0.body_yaw = "Left";
                return v441;
            elseif v432 == "Sway" then
                local v442 = globals.curtime * v437 * 0.1;
                local v443 = v433 * 0.5;
                local v444 = l_l_v394_0_0(-v443, v443, math.sin(v442) % 1);
                l_v388_0.body_yaw = "Left";
                return v444;
            else
                return 0;
            end;
        end;
        local function v447(v446)
            if v446.random_choke:get() then
                return utils.random_int(v446.choke_1:get(), v446.choke_2:get());
            else
                return v446.choke_1:get();
            end;
        end;
        local function v450(v448, v449)
            -- upvalues: v18 (ref), v447 (ref)
            v18.rage.main.double_tap_lag_options:override();
            v18.rage.main.hide_shots_options:override();
            if v449.force_defensive == nil or not v449.force_defensive:get() then
                return;
            elseif v449.custom_choke:get() then
                v448.force_defensive = v448.command_number % v447(v449) == 0;
                return;
            else
                v448.force_defensive = v448.command_number % 16 == 0;
                v18.rage.main.double_tap_lag_options:override("Always on");
                v18.rage.main.hide_shots_options:override("Break LC");
                return;
            end;
        end;
        l_l_angles_1_1.update = function(_, v452)
            -- upvalues: v420 (ref)
            if v452.choked_commands == 0 then
                v420();
            end;
        end;
        l_l_angles_1_1.apply = function(_, v454, v455)
            -- upvalues: v450 (ref), v18 (ref), v429 (ref), v445 (ref)
            v450(v454, v455);
            local v456 = rage.exploit:get() == 1;
            local v457 = v18.antiaim.misc.fake_duck:get();
            if not v456 or v457 then
                return false;
            elseif not v455.enabled:get() then
                return false;
            else
                local v458 = v429(v454, v455);
                local v459 = v445(v454, v455);
                rage.antiaim:override_hidden_pitch(v458);
                rage.antiaim:override_hidden_yaw_offset(v459);
                return true;
            end;
        end;
    end;
    l_v391_1 = {};
    l_v393_1 = v42.antiaim.builder;
    l_v394_0 = function(_)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.pitch = "Down";
    end;
    local function v462(v461)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.yaw = "Backward";
        l_v388_0.yaw_base = "At Target";
        l_v388_0.yaw_offset = v461.yaw_offset:get();
        l_v388_0.yaw_add = v461.yaw_add:get();
        l_v388_0.yaw_left = v461.yaw_left:get();
        l_v388_0.yaw_right = v461.yaw_right:get();
    end;
    local function v464(v463)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.yaw_modifier = v463.yaw_modifier:get();
        l_v388_0.modifier_offset = v463.modifier_offset:get();
    end;
    local function v466(v465)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.body_yaw = v465.body_yaw:get();
        l_v388_0.inverter = false;
        l_v388_0.left_limit = v465.left_limit:get();
        l_v388_0.right_limit = v465.right_limit:get();
        l_v388_0.options = {};
        l_v388_0.freestanding_body_yaw = "Off";
        l_v388_0.delay_1 = v465.delay_1:get();
        l_v388_0.delay_2 = v465.delay_2:get();
    end;
    local function v468(_)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.freestanding = false;
    end;
    local function v470(_)
        -- upvalues: l_v388_0 (ref)
        l_v388_0.extended_angles = false;
        l_v388_0.extended_pitch = 0;
        l_v388_0.extended_roll = 0;
    end;
    do
        local l_l_v393_1_0, l_l_v394_0_1, l_v462_0, l_v464_0, l_v466_0, l_v468_0, l_v470_0 = l_v393_1, l_v394_0, v462, v464, v466, v468, v470;
        l_v391_1.get = function(_, v479, v480)
            -- upvalues: l_l_v393_1_0 (ref)
            return l_l_v393_1_0[v479][v480];
        end;
        l_v391_1.is_active_ex = function(_, v482)
            if v482.angles == nil then
                return false;
            else
                return true;
            end;
        end;
        l_v391_1.is_active = function(v483, v484, v485)
            local v486 = v483:get(v484, v485);
            if v486 == nil then
                return false;
            else
                return v483:is_active_ex(v486);
            end;
        end;
        l_v391_1.apply_ex = function(_, v488)
            -- upvalues: l_l_v394_0_1 (ref), l_v462_0 (ref), l_v464_0 (ref), l_v466_0 (ref), l_v468_0 (ref), l_v470_0 (ref)
            if v488 == nil then
                return false;
            else
                local l_angles_2 = v488.angles;
                if l_angles_2 == nil then
                    return false;
                else
                    l_l_v394_0_1(l_angles_2);
                    l_v462_0(l_angles_2);
                    l_v464_0(l_angles_2);
                    l_v466_0(l_angles_2);
                    l_v468_0(l_angles_2);
                    l_v470_0(l_angles_2);
                    return true;
                end;
            end;
        end;
        l_v391_1.apply = function(v490, v491, v492)
            local v493 = v490:get(v491, v492);
            if v493 == nil then
                return false, nil;
            elseif not v490:is_active_ex(v493) then
                return false, v493;
            else
                v490:apply_ex(v493);
                return true, v493;
            end;
        end;
        l_v391_1.update = function(v494)
            -- upvalues: v93 (ref), v96 (ref)
            local v495 = v93.get();
            local v496 = v96.get();
            if v495 == nil or v496 == nil then
                return false, nil;
            else
                local _, v498 = v494:apply(v496, v495);
                return true, v498;
            end;
        end;
    end;
    l_v393_1 = {};
    l_v394_0 = v42.antiaim.tweaks.avoid_backstab;
    do
        local l_l_v394_0_2 = l_v394_0;
        l_v393_1.update = function(_)
            -- upvalues: l_v388_0 (ref), l_l_v394_0_2 (ref)
            l_v388_0.avoid_backstab = l_l_v394_0_2.enabled:get();
        end;
    end;
    l_v394_0 = {};
    v462 = v42.antiaim.tweaks.on_use;
    v464 = false;
    do
        local l_v462_1, l_v464_1, l_v466_1 = v462, v464, v466;
        l_v466_1 = function(v504)
            -- upvalues: l_v462_1 (ref), l_v464_1 (ref)
            if not l_v462_1.enabled:get() then
                return false;
            else
                local v505 = entity.get_local_player();
                if v505 == nil then
                    return false;
                else
                    local v506 = v505:get_player_weapon();
                    if v506 == nil then
                        return false;
                    else
                        local v507 = v506:get_weapon_info();
                        if v507 == nil then
                            return false;
                        else
                            local l_m_iTeamNum_1 = v505.m_iTeamNum;
                            local v509 = v505:get_origin();
                            local v510 = v507.idx == 49;
                            local l_m_bIsDefusing_0 = v505.m_bIsDefusing;
                            local l_m_bIsGrabbingHostage_0 = v505.m_bIsGrabbingHostage;
                            local l_m_bInBombZone_0 = v505.m_bInBombZone;
                            if l_m_bIsDefusing_0 or l_m_bIsGrabbingHostage_0 then
                                return false;
                            elseif l_m_bInBombZone_0 and v510 then
                                return false;
                            else
                                if l_m_iTeamNum_1 == 3 and v504.view_angles.x > 25 then
                                    local v514 = entity.get_entities("CPlantedC4");
                                    for v515 = 1, #v514 do
                                        if (v514[v515]:get_origin() - v509):lengthsqr() < 3844 then
                                            return false;
                                        end;
                                    end;
                                end;
                                local v516 = render.camera_angles();
                                local v517 = vector():angles(v516);
                                local v518 = v505:get_eye_position();
                                local v519 = v518 + v517 * 128;
                                local v520 = utils.trace_line(v518, v519, v505);
                                if v520.fraction ~= 1 then
                                    local v521 = v520.entity:get_classname();
                                    if v521 == "CWorld" then
                                        return true;
                                    elseif v521 == "CFuncBrush" then
                                        return true;
                                    elseif v521 == "CCSPlayer" then
                                        return true;
                                    elseif v521 == "CHostage" and v518:distsqr((ent:get_origin())) < 7056 then
                                        return false;
                                    elseif not l_v464_1 then
                                        l_v464_1 = true;
                                        return false;
                                    end;
                                end;
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        l_v394_0.update = function(_, v523)
            -- upvalues: l_v464_1 (ref), l_v466_1 (ref), l_v388_0 (ref)
            if v523.in_use == false then
                l_v464_1 = false;
                return false;
            elseif not l_v466_1(v523) then
                return false;
            else
                l_v388_0.pitch = "Disabled";
                l_v388_0.yaw_base = "Local view";
                l_v388_0.yaw_offset = l_v388_0.yaw_offset + 180;
                l_v388_0.freestanding = false;
                v523.in_use = false;
                return true;
            end;
        end;
    end;
    v462 = {};
    v464 = v42.antiaim.tweaks.modify_on_warmup;
    v466 = function()
        local v524 = entity.get_game_rules();
        if v524 == nil then
            return false;
        else
            return v524.m_bWarmupPeriod;
        end;
    end;
    do
        local l_v464_2, l_v466_2, l_v468_1 = v464, v466, v468;
        l_v468_1 = function()
            -- upvalues: l_v464_2 (ref), l_v466_2 (ref)
            if not l_v464_2.enabled:get() then
                return false;
            else
                return l_v466_2();
            end;
        end;
        v462.update = function(_)
            -- upvalues: l_v468_1 (ref), l_v388_0 (ref)
            if not l_v468_1() then
                return false;
            else
                l_v388_0.enabled = true;
                l_v388_0.pitch = "Disabled";
                l_v388_0.yaw = "Backward";
                l_v388_0.yaw_base = "At Target";
                l_v388_0.yaw_offset = globals.tickcount * 8;
                l_v388_0.yaw_add = false;
                l_v388_0.yaw_left = 0;
                l_v388_0.yaw_right = 0;
                l_v388_0.yaw_modifier = "Disabled";
                l_v388_0.modifier_offset = 0;
                l_v388_0.body_yaw = "Disabled";
                l_v388_0.inverter = false;
                l_v388_0.left_limit = 0;
                l_v388_0.right_limit = 0;
                l_v388_0.options = {};
                l_v388_0.freestanding_body_yaw = "Off";
                l_v388_0.delay_1 = 0;
                l_v388_0.delay_2 = 0;
                l_v388_0.freestanding = false;
                return true;
            end;
        end;
    end;
    v464 = {};
    v466 = v42.antiaim.tweaks.flick_exploit;
    do
        local l_v466_3, l_v468_2 = v466, v468;
        l_v468_2 = function()
            -- upvalues: l_v466_3 (ref), v93 (ref)
            if not l_v466_3.enabled:get() then
                return false;
            else
                local v531 = entity.get_local_player();
                if v531 == nil then
                    return false;
                else
                    local v532 = v531:get_player_weapon();
                    if v532 == nil then
                        return false;
                    else
                        local v533 = v532:get_weapon_info();
                        if v533 == nil or v533.is_revolver then
                            return false;
                        elseif not (rage.exploit:get() == 1) then
                            return false;
                        else
                            local v534 = v93.get();
                            if v534 == nil then
                                return false;
                            else
                                return l_v466_3.conditions:get(v534);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v464.update = function(_, v536)
            -- upvalues: l_v468_2 (ref), l_v388_0 (ref)
            if not l_v468_2() then
                return false;
            else
                l_v388_0.enabled = true;
                l_v388_0.pitch = "Down";
                l_v388_0.yaw = "Backward";
                l_v388_0.yaw_base = "At Target";
                l_v388_0.yaw_offset = 0;
                l_v388_0.hidden = true;
                l_v388_0.yaw_add = false;
                l_v388_0.yaw_left = 0;
                l_v388_0.yaw_right = 0;
                l_v388_0.yaw_modifier = "Disabled";
                l_v388_0.modifier_offset = 0;
                l_v388_0.body_yaw = "Left";
                l_v388_0.inverter = false;
                l_v388_0.left_limit = 60;
                l_v388_0.right_limit = 60;
                l_v388_0.options = {};
                l_v388_0.freestanding_body_yaw = "Off";
                l_v388_0.delay_1 = 0;
                l_v388_0.delay_2 = 0;
                l_v388_0.freestanding = false;
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                v536.force_defensive = v536.command_number % 7 == 0;
                return true;
            end;
        end;
    end;
    v466 = {};
    v468 = v42.antiaim.tweaks.safe_head;
    v470 = 1000000;
    do
        local l_v468_3, l_v470_1 = v468, v470;
        local function v549(v539, v540)
            -- upvalues: v43 (ref), l_v470_1 (ref)
            local v541 = v539:get_player_weapon();
            if v541 == nil then
                return nil;
            else
                local v542 = v541:get_classname();
                local v543 = v542 == "CKnife";
                local v544 = v542 == "CWeaponTaser";
                local v545 = v539:get_origin();
                local v546 = v540:get_origin() - v545;
                local v547 = -v546.z;
                local v548 = v546:length2dsqr();
                if v43.is_onground then
                    if (not v43.is_moving or v43.is_crouched) and v547 >= 10 and l_v470_1 < v548 then
                        return "Distance";
                    else
                        if v43.is_crouched then
                            if v547 >= 48 then
                                return "Crouching";
                            end;
                        elseif not v43.is_moving and v547 >= 24 then
                            return "Standing";
                        end;
                        return nil;
                    end;
                else
                    if v43.is_crouched then
                        if v544 and v547 > -20 and v548 < 250000 then
                            return "Air Taser";
                        elseif v543 and v547 > -100 then
                            return "Air Knife";
                        elseif v547 > 130 then
                            return "Air Crouch";
                        end;
                    end;
                    return nil;
                end;
            end;
        end;
        local function v553()
            -- upvalues: l_v468_3 (ref), v549 (ref)
            if not l_v468_3.enabled:get() then
                return false;
            else
                local v550 = entity.get_local_player();
                if v550 == nil then
                    return false;
                else
                    local v551 = entity.get_threat();
                    if v551 == nil then
                        return false;
                    else
                        local v552 = v549(v550, v551);
                        if v552 == nil then
                            return false;
                        else
                            return l_v468_3.conditions:get(v552);
                        end;
                    end;
                end;
            end;
        end;
        v466.update = function(_)
            -- upvalues: v553 (ref), l_v388_0 (ref)
            if not v553() then
                return false;
            else
                l_v388_0.enabled = true;
                l_v388_0.pitch = "Down";
                l_v388_0.yaw = "Backward";
                l_v388_0.yaw_base = "At Target";
                l_v388_0.yaw_offset = 0;
                l_v388_0.yaw_add = false;
                l_v388_0.yaw_left = 0;
                l_v388_0.yaw_right = 0;
                l_v388_0.yaw_modifier = "Disabled";
                l_v388_0.modifier_offset = 0;
                l_v388_0.body_yaw = "Disabled";
                l_v388_0.inverter = false;
                l_v388_0.left_limit = 0;
                l_v388_0.right_limit = 0;
                l_v388_0.options = {};
                l_v388_0.freestanding_body_yaw = "Off";
                l_v388_0.delay_1 = 0;
                l_v388_0.delay_2 = 0;
                l_v388_0.freestanding = false;
                return true;
            end;
        end;
    end;
    v468 = {};
    v470 = v42.antiaim.hotkeys.freestanding;
    do
        local l_v470_2 = v470;
        local function v556()
            -- upvalues: l_v470_2 (ref)
            return l_v470_2.static:get();
        end;
        local function v558()
            -- upvalues: v93 (ref), l_v470_2 (ref)
            local v557 = v93.get();
            if v557 == nil then
                return false;
            else
                return l_v470_2.disablers:get(v557);
            end;
        end;
        v468.update = function(_)
            -- upvalues: l_v470_2 (ref), v558 (ref), v556 (ref), l_v388_0 (ref)
            if not l_v470_2.enabled:get() then
                return false;
            elseif v558() then
                return false;
            else
                if v556() then
                    l_v388_0.yaw_offset = 0;
                    l_v388_0.yaw_add = false;
                    l_v388_0.yaw_modifier = "Disabled";
                    l_v388_0.body_yaw = "Left";
                end;
                l_v388_0.yaw_base = "Local View";
                l_v388_0.freestanding = true;
                return true;
            end;
        end;
    end;
    v470 = {};
    local l_manual_yaw_0 = v42.antiaim.hotkeys.manual_yaw;
    local v561 = {
        Backward = 0, 
        Right = 90, 
        Left = -90, 
        Forward = 180
    };
    do
        local l_l_manual_yaw_0_0, l_v561_0 = l_manual_yaw_0, v561;
        local function v564()
            -- upvalues: l_l_manual_yaw_0_0 (ref)
            return l_l_manual_yaw_0_0.static:get();
        end;
        local function v566()
            -- upvalues: v93 (ref), l_l_manual_yaw_0_0 (ref)
            local v565 = v93.get();
            if v565 == nil then
                return false;
            else
                return l_l_manual_yaw_0_0.disablers:get(v565);
            end;
        end;
        v470.update = function(_)
            -- upvalues: l_v561_0 (ref), l_l_manual_yaw_0_0 (ref), v566 (ref), v564 (ref), l_v388_0 (ref)
            local v568 = l_v561_0[l_l_manual_yaw_0_0.direction:get()];
            if not v568 then
                return false;
            elseif v566() then
                return false;
            else
                if v564() then
                    l_v388_0.yaw_offset = 0;
                    l_v388_0.yaw_add = false;
                    l_v388_0.yaw_modifier = "Disabled";
                    l_v388_0.body_yaw = "Left";
                end;
                l_v388_0.yaw_base = "Local View";
                l_v388_0.yaw_offset = l_v388_0.yaw_offset + v568;
                return true;
            end;
        end;
    end;
    l_manual_yaw_0 = function()
        -- upvalues: l_v385_0 (ref), l_v388_0 (ref), l_v387_0 (ref), l_v386_0 (ref), l_v384_0 (ref)
        if rage.exploit:get() == 0 then
            l_v385_0 = not l_v385_0;
            return;
        else
            if l_v388_0.body_yaw == "Jitter" then
                l_v387_0 = l_v388_0.delay_1;
            end;
            if l_v388_0.body_yaw == "Randomize Jitter" and l_v386_0 then
                l_v387_0 = utils.random_int(l_v388_0.delay_1, l_v388_0.delay_2);
                l_v386_0 = false;
            end;
            l_v384_0 = l_v384_0 + 1;
            if l_v387_0 < l_v384_0 then
                l_v385_0 = not l_v385_0;
                l_v384_0 = 0;
                l_v386_0 = true;
            end;
            return;
        end;
    end;
    v561 = function(v569)
        -- upvalues: l_v391_1 (ref), l_l_angles_1_1 (ref), v462 (ref), l_v394_0 (ref), l_v393_1 (ref), v470 (ref), v468 (ref), v466 (ref), v464 (ref)
        local v570, v571 = l_v391_1:update();
        l_l_angles_1_1:update(v569);
        if v462:update() then
            return;
        elseif l_v394_0:update(v569) then
            return;
        elseif l_v393_1:update() then
            return;
        elseif v470:update() then
            return;
        elseif v468:update() then
            return;
        elseif v466:update() then
            return;
        elseif v464:update(v569) then
            return;
        else
            if v570 and v571 ~= nil and v571.defensive ~= nil then
                l_l_angles_1_1:apply(v569, v571.defensive);
            end;
            return;
        end;
    end;
    local function v573()
        -- upvalues: l_v388_0 (ref), l_v385_0 (ref)
        if not l_v388_0.yaw_add then
            return;
        else
            local v572 = l_v385_0 and l_v388_0.yaw_left or l_v388_0.yaw_right;
            l_v388_0.yaw_offset = l_v388_0.yaw_offset + v572;
            return;
        end;
    end;
    local function v574()

    end;
    local function v575()
        -- upvalues: l_v388_0 (ref), l_v385_0 (ref)
        if l_v388_0.body_yaw == "Disabled" then
            l_v388_0.body_yaw = false;
            return;
        elseif l_v388_0.body_yaw == "Left" then
            l_v388_0.body_yaw = true;
            rage.antiaim:inverter(false);
            return;
        elseif l_v388_0.body_yaw == "Right" then
            l_v388_0.body_yaw = true;
            rage.antiaim:inverter(true);
            return;
        elseif l_v388_0.body_yaw == "Jitter" or l_v388_0.body_yaw == "Randomize Jitter" then
            l_v388_0.body_yaw = true;
            rage.antiaim:inverter(l_v385_0);
            return;
        else
            return;
        end;
    end;
    local function v577(v576)
        -- upvalues: l_manual_yaw_0 (ref), v575 (ref), v574 (ref), v573 (ref)
        if v576.choked_commands == 0 then
            l_manual_yaw_0();
        end;
        v575();
        v574();
        v573();
    end;
    local function v578()
        -- upvalues: l_v388_0 (ref)
        l_v388_0:clear();
        l_v388_0:unset();
    end;
    local function v580(v579)
        -- upvalues: l_v388_0 (ref), v561 (ref), v577 (ref)
        l_v388_0:clear();
        l_v388_0:unset();
        v561(v579);
        v577(v579);
        l_v388_0:set();
    end;
    local _ = nil;
    events.shutdown(v578);
    events.createmove(v580);
end;
v384 = nil;
if v8.build ~= "Live" then
    v385 = nil;
    v386 = v42.other.aimbot.dormant_aimbot;
    v387 = function(v582)
        return v582.weapon_type >= 1 and v582.weapon_type <= 6;
    end;
    v388 = function(v583, v584, v585)
        if v585.max_clip1 == 0 or v584.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v583.m_flNextAttack then
            return false;
        elseif globals.curtime < v584.m_flNextPrimaryAttack then
            return false;
        else
            return true;
        end;
    end;
    l_angles_1 = function(v586, v587)
        if v587.weapon_type == 5 then
            return v586.m_bIsScoped or v586.m_bResumeZoom;
        else
            return true;
        end;
    end;
    v391 = function(v588, v589, v590, v591)
        local v592, v593 = utils.trace_bullet(v588, v589, v590, v591);
        if v593 ~= nil then
            local l_entity_0 = v593.entity;
            if l_entity_0 == nil then
                return 0, v593;
            elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
                return 0, v593;
            end;
        end;
        return v592, v593;
    end;
    do
        local l_v386_1, l_v387_1, l_v388_1, l_l_angles_1_2, l_v391_2, l_v393_2, l_v394_1 = v386, v387, v388, l_angles_1, v391, v393, v394;
        l_v393_2 = function()
            -- upvalues: l_v386_1 (ref)
            local v602 = {};
            if l_v386_1.hitboxes:get("Head") then
                local v603 = {
                    position = vector(0, 0, 58), 
                    hitbox = "Head"
                };
                table.insert(v602, v603);
            end;
            if l_v386_1.hitboxes:get("Chest") then
                local v604 = {
                    position = vector(0, 0, 50), 
                    hitbox = "Chest"
                };
                table.insert(v602, v604);
            end;
            if l_v386_1.hitboxes:get("Stomach") then
                local v605 = {
                    position = vector(0, 0, 40), 
                    hitbox = "Stomach"
                };
                table.insert(v602, v605);
            end;
            if l_v386_1.hitboxes:get("Legs") then
                local v606 = {
                    position = vector(0, 0, 20), 
                    hitbox = "Legs"
                };
                table.insert(v602, v606);
            end;
            return v602;
        end;
        l_v394_1 = function()
            local v607 = {};
            local v608 = entity.get_player_resource();
            for v609 = 1, globals.max_players do
                local v610 = entity.get(v609);
                if v610 ~= nil and v608.m_bConnected[v609] and v610:is_enemy() and v610:is_dormant() and v610:is_alive() and v610:get_network_state() ~= 5 then
                    table.insert(v607, v610);
                end;
            end;
            return v607;
        end;
        local function v636(v611)
            -- upvalues: v43 (ref), l_v387_1 (ref), l_v388_1 (ref), l_v393_2 (ref), l_v386_1 (ref), l_v394_1 (ref), l_v391_2 (ref), l_l_angles_1_2 (ref)
            local v612 = entity.get_local_player();
            if v612 == nil then
                return;
            else
                local v613 = v612:get_player_weapon();
                if v613 == nil then
                    return;
                else
                    local v614 = v613:get_weapon_info();
                    if v614 == nil then
                        return;
                    else
                        local v615 = v613:get_inaccuracy();
                        if v615 == nil then
                            return;
                        elseif v611.in_jump or not v43.is_onground then
                            return;
                        else
                            local v616 = v612:get_eye_position();
                            if not l_v387_1(v614) then
                                return;
                            elseif not l_v388_1(v612, v613, v614) then
                                return;
                            else
                                local v617 = l_v393_2();
                                if #v617 == 0 then
                                    return;
                                else
                                    local v618 = l_v386_1.accuracy:get();
                                    local v619 = l_v386_1.min_damage:get();
                                    local v620 = nil;
                                    local v621 = l_v394_1();
                                    if #v621 == 0 then
                                        return;
                                    else
                                        for v622 = 1, #v621 do
                                            local v623 = v621[v622];
                                            if v623 ~= nil then
                                                local v624 = v623:get_bbox();
                                                if v624 ~= nil then
                                                    local l_alpha_0 = v624.alpha;
                                                    if l_alpha_0 ~= 0 and math.floor(l_alpha_0 * 100) + 5 > v618 then
                                                        local l_m_vecOrigin_0 = v623.m_vecOrigin;
                                                        local l_m_flDuckAmount_1 = v623.m_flDuckAmount;
                                                        for v628 = 1, #v617 do
                                                            local v629 = v617[v628];
                                                            local l_position_0 = v629.position;
                                                            local l_hitbox_0 = v629.hitbox;
                                                            l_position_0 = l_position_0 + l_m_vecOrigin_0;
                                                            if l_hitbox_0 == "Head" then
                                                                l_position_0 = l_position_0 - vector(0, 0, 10 * l_m_flDuckAmount_1);
                                                            end;
                                                            if l_hitbox_0 == "Chest" then
                                                                l_position_0 = l_position_0 - vector(0, 0, 4 * l_m_flDuckAmount_1);
                                                            end;
                                                            local v633, v634 = l_v391_2(v612, v616, l_position_0, function(v632)
                                                                return v632 == target;
                                                            end);
                                                            if l_hitbox_0 == "Head" then
                                                                v633 = v633 * 4;
                                                            end;
                                                            if (v634 == nil or not v634:is_visible()) and v633 ~= 0 and v619 <= v633 then
                                                                v620 = l_position_0;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        if not v620 then
                                            return;
                                        else
                                            local v635 = v616:to(v620):angles();
                                            if not l_l_angles_1_2(v612, v614) then
                                                v611.in_attack2 = true;
                                            end;
                                            v611.block_movement = 1;
                                            if v615 < 0.01 then
                                                v611.view_angles = v635;
                                                v611.in_attack = true;
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
        local _ = nil;
        local function v640(v638)
            -- upvalues: v636 (ref)
            local v639 = v638:get();
            events.createmove(v636, v639);
        end;
        l_v386_1.enabled:set_callback(v640, true);
    end;
end;
if v8.build == "Alpha" then
    v385 = nil;
    v386 = v42.other.aimbot.ai_peek;
    v387 = {
        point = nil, 
        retreat = -1, 
        retreat_point = nil
    };
    v388 = 1;
    l_angles_1 = 40;
    v391 = 64;
    v393 = 0;
    v394 = 1;
    local v641 = 2;
    local v642 = 3;
    local v643 = 4;
    local v644 = 5;
    local v645 = 6;
    local v646 = 7;
    local _ = 10;
    local v648 = 0;
    local _ = 1;
    local _ = 2;
    local v651 = 3;
    local _ = 4;
    local v653 = 5;
    local _ = 6;
    local v655 = 7;
    local v656 = 8;
    local v657 = 9;
    local v658 = 10;
    local v659 = 11;
    local v660 = 12;
    local _ = 13;
    local _ = 14;
    local v663 = 15;
    local _ = 16;
    local v665 = 17;
    local _ = 18;
    local v667 = {
        [v648] = v394, 
        [v653] = v641, 
        [v651] = v642, 
        [v656] = v645, 
        [v655] = v646, 
        [v660] = v645, 
        [v659] = v646, 
        [v665] = v643, 
        [v663] = v644
    };
    do
        local l_v386_2, l_v387_2, l_v388_2, l_l_angles_1_3, l_v391_3, l_v393_3, l_v394_2, l_v642_0, l_v645_0, l_v646_0, l_v648_0, l_v651_0, l_v653_0, l_v655_0, l_v656_0, l_v657_0, l_v658_0, l_v663_0, l_v665_0, l_v667_0 = v386, v387, v388, l_angles_1, v391, v393, v394, v642, v645, v646, v648, v651, v653, v655, v656, v657, v658, v663, v665, v667;
        local function v689(v688)
            -- upvalues: l_v667_0 (ref), l_v393_3 (ref)
            return l_v667_0[v688] or l_v393_3;
        end;
        local function v691()
            -- upvalues: l_v386_2 (ref), l_v648_0 (ref), l_v653_0 (ref), l_v651_0 (ref), l_v665_0 (ref), l_v663_0 (ref), l_v656_0 (ref), l_v655_0 (ref), l_v658_0 (ref), l_v657_0 (ref)
            local v690 = {};
            if l_v386_2.hitboxes:get("Head") then
                table.insert(v690, l_v648_0);
            end;
            if l_v386_2.hitboxes:get("Chest") then
                table.insert(v690, l_v653_0);
            end;
            if l_v386_2.hitboxes:get("Stomach") then
                table.insert(v690, l_v651_0);
            end;
            if l_v386_2.hitboxes:get("Arms") then
                table.insert(v690, l_v665_0);
                table.insert(v690, l_v663_0);
            end;
            if l_v386_2.hitboxes:get("Legs") then
                table.insert(v690, l_v656_0);
                table.insert(v690, l_v655_0);
                table.insert(v690, l_v658_0);
                table.insert(v690, l_v657_0);
            end;
            return v690;
        end;
        local function v693(v692)
            -- upvalues: l_v394_2 (ref), l_v642_0 (ref), l_v645_0 (ref), l_v646_0 (ref)
            if v692 == l_v394_2 then
                return 4;
            elseif v692 == l_v642_0 then
                return 1.25;
            elseif v692 == l_v645_0 then
                return 0.75;
            elseif v692 == l_v646_0 then
                return 0.75;
            else
                return 1;
            end;
        end;
        local function v700(v694, v695, v696, v697)
            -- upvalues: v693 (ref), l_v394_2 (ref)
            v695 = v695 * v693(v696);
            local l_m_ArmorValue_0 = v694.m_ArmorValue;
            local l_m_bHasHelmet_0 = v694.m_bHasHelmet;
            if l_m_ArmorValue_0 > 0 then
                if v696 == l_v394_2 then
                    if l_m_bHasHelmet_0 ~= 0 then
                        v695 = v695 * (v697 * 0.5);
                    end;
                else
                    v695 = v695 * (v697 * 0.5);
                end;
            end;
            return v695;
        end;
        local function v712(v701, v702, v703, v704, v705)
            -- upvalues: v700 (ref)
            local v706 = v702 - v701;
            local l_damage_0 = v705.damage;
            local l_armor_ratio_0 = v705.armor_ratio;
            local l_range_0 = v705.range;
            local l_range_modifier_0 = v705.range_modifier;
            local v711 = math.min(l_range_0, v706:length());
            l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v711 * 0.002);
            return (v700(v703, l_damage_0, v704, l_armor_ratio_0));
        end;
        local function v728(v713, v714, v715, v716, v717)
            -- upvalues: v689 (ref), v712 (ref)
            local v718 = {};
            local v719 = v714:get_eye_position();
            local l_m_iHealth_0 = v716.m_iHealth;
            for v721 = 1, #v713 do
                local v722 = v713[v721];
                local v723 = v689(v722);
                local v724 = v716:get_hitbox_position(v722);
                local v725 = v712(v719, v724, v716, v723, v715);
                local v726 = v725 < v717;
                local v727 = v725 < l_m_iHealth_0;
                if not v726 or not v727 then
                    table.insert(v718, {
                        index = v721, 
                        pos = v724
                    });
                end;
            end;
            return v718;
        end;
        local function v733(v729, v730)
            -- upvalues: l_l_angles_1_3 (ref), l_v391_3 (ref), l_v388_2 (ref)
            local v731 = v729:get_weapon_index();
            local l_weapon_type_0 = v730.weapon_type;
            if l_weapon_type_0 == 5 and v731 == l_l_angles_1_3 then
                return "SSG 08";
            elseif l_weapon_type_0 == 1 then
                if v731 == l_v391_3 then
                    return "R8 Revolver";
                elseif v731 == l_v388_2 then
                    return "Desert Eagle";
                else
                    return "Pistol";
                end;
            elseif l_weapon_type_0 == 3 then
                return "Rifle";
            elseif l_weapon_type_0 == 4 then
                return "Shotgun";
            else
                return nil;
            end;
        end;
        local function v737(v734, v735, v736)
            if v736.max_clip1 == 0 or v735.m_iClip1 == 0 then
                return false;
            elseif globals.curtime < v734.m_flNextAttack then
                return false;
            elseif globals.curtime < v735.m_flNextPrimaryAttack then
                return false;
            else
                return true;
            end;
        end;
        local function v740(v738, v739)
            if v739.weapon_type_int == 5 then
                return v738.m_bIsScoped == 1;
            else
                return true;
            end;
        end;
        local function v741()
            -- upvalues: v18 (ref)
            v18.rage.main.double_tap:override();
        end;
        local function v743(v742)
            return not v742.in_forward and not v742.in_back and not v742.in_moveleft and not v742.in_moveright;
        end;
        local function v745(v744)
            v744.in_duck = false;
            v744.in_jump = false;
            v744.in_speed = false;
            v744.in_forward = false;
            v744.in_back = false;
            v744.in_moveleft = false;
            v744.in_moveright = false;
        end;
        local function v753(v746, v747, v748, v749)
            local v750, v751 = utils.trace_bullet(v746, v747, v748, v749);
            if v751 ~= nil then
                local l_entity_1 = v751.entity;
                if l_entity_1 == nil then
                    return 0, v751;
                elseif l_entity_1:is_player() and not l_entity_1:is_enemy() then
                    return 0, v751;
                end;
            end;
            return v750, v751;
        end;
        local function v760(v754, v755, v756)
            local v757 = v756 - v755.m_vecOrigin;
            if v757:length2dsqr() < 25 then
                local l_m_vecVelocity_1 = v755.m_vecVelocity;
                local v759 = l_m_vecVelocity_1:length();
                v754.move_yaw = l_m_vecVelocity_1:angles().y;
                v754.forwardmove = -v759;
                v754.sidemove = 0;
                return true;
            else
                v754.move_yaw = v757:angles().y;
                v754.forwardmove = 450;
                v754.sidemove = 0;
                return false;
            end;
        end;
        local function v764(v761, v762, v763)
            return v761 + vector():angles(0, v762, 0) * v763;
        end;
        local function v770(v765, v766, v767, v768)
            -- upvalues: v764 (ref)
            local v769 = v764(v766, v767, v768);
            return utils.trace_line(v766, v769, v765).end_pos;
        end;
        local function v785(v771, v772, v773, v774, v775, v776, v777, v778)
            -- upvalues: v770 (ref), v753 (ref)
            local v779 = v770(v771, v774, v775, v776);
            for v780 = 1, #v777 do
                local l_pos_0 = v777[v780].pos;
                local v783, _ = v753(v771, v779, l_pos_0, function(v782)
                    -- upvalues: v772 (ref)
                    return v782 == v772;
                end);
                if v778 <= v783 then
                    return v779 - vector(0, 0, v774.z - v773.z), true;
                end;
            end;
            return nil, false;
        end;
        local function v810(v786, v787, _, v789)
            -- upvalues: v743 (ref), v691 (ref), v18 (ref), v728 (ref), l_v386_2 (ref), v785 (ref), l_v387_2 (ref)
            if not v743(v786) then
                return;
            else
                local l_m_fFlags_1 = v787.m_fFlags;
                if bit.band(l_m_fFlags_1, 1) == 0 then
                    return;
                else
                    local v791 = entity.get_threat();
                    if v791 == nil or not v791:is_alive() or v791:is_dormant() or v791:get_network_state() == 5 then
                        return;
                    else
                        local l_m_vecOrigin_1 = v787.m_vecOrigin;
                        local l_m_vecOrigin_2 = v791.m_vecOrigin;
                        local v794 = v787:get_eye_position();
                        local v795 = v691();
                        local v796 = v18.rage.selection.min_damage:get();
                        local v797 = v728(v795, v787, v789, v791, v796);
                        local v798 = nil;
                        local v799 = nil;
                        local v800 = (l_m_vecOrigin_2 - l_m_vecOrigin_1):angles().y + 180;
                        v798 = v800 - 90;
                        v799 = v800 + 90;
                        local v801 = 0;
                        local v802 = 0;
                        v800 = l_v386_2.dots:get();
                        local v803 = l_v386_2.radius:get() / v800;
                        for v804 = 1, v800 do
                            local v805 = v803 * v804;
                            if v801 ~= -1 then
                                v801 = v804;
                                local v806, v807 = v785(v787, v791, l_m_vecOrigin_1, v794, v798, v805, v797, v796);
                                if v807 then
                                    l_v387_2.point = v806;
                                    break;
                                end;
                            end;
                            if v802 ~= -1 then
                                v802 = v804;
                                local v808, v809 = v785(v787, v791, l_m_vecOrigin_1, v794, v799, v805, v797, v796);
                                if v809 then
                                    l_v387_2.point = v808;
                                    break;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
        local function v823(v811, v812, v813, v814)
            -- upvalues: l_v387_2 (ref), v737 (ref), v740 (ref), v810 (ref), l_v386_2 (ref), v760 (ref), v745 (ref), v16 (ref), v18 (ref), v741 (ref)
            if l_v387_2.retreat_point == nil then
                l_v387_2.retreat_point = v812.m_vecOrigin;
            end;
            local v815 = v737(v812, v813, v814);
            local v816 = v740(v812, v814);
            v810(v811, v812, v813, v814);
            local l_m_vecMins_0 = v812.m_vecMins;
            local l_m_vecMaxs_0 = v812.m_vecMaxs;
            local v819 = l_v386_2.color:get();
            local v820 = color(0, 0, 0, 0);
            if l_v387_2.retreat <= 0 and v815 and v816 and l_v387_2.point then
                local v821 = v760(v811, v812, l_v387_2.point);
                v745(v811);
                l_v387_2.retreat = 0;
                if v821 then
                    l_v387_2.retreat = 1;
                end;
                v16.box_new(l_v387_2.point, l_m_vecMins_0, l_m_vecMaxs_0, vector(), v820, v819, globals.tickinterval * 2);
                return;
            elseif l_v387_2.retreat == -1 then
                return;
            else
                local v822 = v760(v811, v812, l_v387_2.retreat_point);
                v745(v811);
                l_v387_2.retreat = l_v387_2.retreat + 1;
                if l_v387_2.retreat >= 3 then
                    v18.rage.main.double_tap:override(false);
                end;
                if v815 and v822 then
                    l_v387_2.point = nil;
                    l_v387_2.retreat = -1;
                    l_v387_2.retreat_point = nil;
                    v741();
                end;
                return;
            end;
        end;
        local function v827(v824, v825)
            -- upvalues: v733 (ref), l_v386_2 (ref)
            local v826 = v733(v824, v825);
            if v826 == nil then
                return;
            else
                return l_v386_2.weapons:get(v826);
            end;
        end;
        local function v832(v828)
            -- upvalues: v741 (ref), v827 (ref), v823 (ref)
            v741();
            local v829 = entity.get_local_player();
            if v829 == nil or not v829:is_alive() then
                return;
            else
                local v830 = v829:get_player_weapon();
                if v830 == nil then
                    return;
                else
                    local v831 = v830:get_weapon_info();
                    if v831 == nil then
                        return;
                    elseif not v827(v830, v831) then
                        return;
                    else
                        v823(v828, v829, v830, v831);
                        return;
                    end;
                end;
            end;
        end;
        local function v833()
            -- upvalues: l_v387_2 (ref), v741 (ref)
            l_v387_2.retreat = 1;
            v741();
        end;
        local function v834()
            -- upvalues: v741 (ref)
            v741();
        end;
        local _ = nil;
        local function v838(v836)
            -- upvalues: l_v387_2 (ref), v741 (ref), v834 (ref), v833 (ref), v832 (ref)
            local v837 = v836:get();
            if not v837 then
                l_v387_2.point = nil;
                l_v387_2.retreat = -1;
                l_v387_2.retreat_point = nil;
                v741();
            end;
            events.shutdown(v834, v837);
            events.aim_fire(v833, v837);
            events.createmove(v832, v837);
        end;
        l_v386_2.enabled:set_callback(v838, true);
    end;
end;
v385 = nil;
v386 = v42.other.aimbot.log_events;
v387 = 6;
v388 = 24;
l_angles_1 = {};
do
    local l_v386_3, l_v387_3, l_v388_3, l_l_angles_1_4, l_v391_4, l_v393_4, l_v394_3 = v386, v387, v388, l_angles_1, v391, v393, v394;
    l_v391_4 = function()
        -- upvalues: l_l_angles_1_4 (ref)
        l_l_angles_1_4 = {};
    end;
    l_v393_4 = function(v846, v847)
        -- upvalues: l_v386_3 (ref), l_l_angles_1_4 (ref)
        if not l_v386_3.output:get("Notify") then
            return;
        else
            local v848 = {
                text = v847, 
                color = v846, 
                time = 5, 
                alpha = 0
            };
            table.insert(l_l_angles_1_4, 1, v848);
            return;
        end;
    end;
    l_v394_3 = function()
        -- upvalues: l_l_angles_1_4 (ref), v15 (ref), v8 (ref), v4 (ref), l_v388_3 (ref), l_v387_3 (ref)
        local l_frametime_0 = globals.frametime;
        local v850 = #l_l_angles_1_4;
        for v851 = v850, 1, -1 do
            local v852 = l_l_angles_1_4[v851];
            local v853 = v852.time > 0 and v850 - v851 < 5;
            v852.alpha = v15.interp(v852.alpha, v853, 0.05);
            if v853 then
                v852.time = v852.time - l_frametime_0;
            elseif v852.alpha <= 0 then
                table.remove(l_l_angles_1_4, v850);
            end;
        end;
        local v854 = render.screen_size() * 0.5;
        v854.y = v854.y * 1.7;
        local v855 = string.lower(v8.name);
        local _ = render.measure_text(4, nil, v855);
        for v857 = 1, #l_l_angles_1_4 do
            local v858 = l_l_angles_1_4[v857];
            local v859, v860, v861, _ = v858.color:unpack();
            local l_text_0 = v858.text;
            local l_alpha_1 = v858.alpha;
            local v865 = v4(#l_text_0 * l_alpha_1);
            l_text_0 = string.sub(l_text_0, 1, v865);
            v865 = render.measure_text(1, nil, l_text_0);
            local v866 = v854 - v865 * 0.5;
            local v867 = v866 + vector(0, v865.y * 0.5);
            local v868 = vector(v865.x, 0);
            render.shadow(v867, v867 + v868, color(v859, v860, v861, 128 * l_alpha_1), l_v388_3, 0, 0);
            render.text(1, v866, color(200, 200, 200, 255 * l_alpha_1), nil, l_text_0);
            v854.y = v854.y + v4((v865.y + l_v387_3) * l_alpha_1);
        end;
    end;
    local v869 = {
        [0] = "generic", 
        [1] = "head", 
        [2] = "chest", 
        [3] = "stomach", 
        [4] = "left arm", 
        [5] = "right arm", 
        [6] = "left leg", 
        [7] = "right leg", 
        [8] = "neck", 
        [9] = nil, 
        [10] = "gear"
    };
    local v870 = {
        flashbang = "Harmed", 
        knife = "Knifed", 
        c4 = "Bombed", 
        smokegrenade = "Harmed", 
        incgrenade = "Harmed", 
        hegrenade = "Naded", 
        molotov = "Harmed", 
        inferno = "Burned", 
        decoy = "Decoyed"
    };
    local function v874(v871, v872)
        v872 = v872:to_hex();
        return (v871:gsub("%${(.-)}", function(v873)
            -- upvalues: v872 (ref)
            return string.format("\a%s%s\aC8C8C8FF", v872, v873);
        end));
    end;
    local function v877(v875, v876)
        -- upvalues: v8 (ref)
        return "\a" .. v876:to_hex() .. string.lower(v8.name) .. "\aC8C8C8FF" .. " \194\183 " .. v875;
    end;
    local function v880(v878, v879)
        -- upvalues: l_v386_3 (ref), v877 (ref)
        if not l_v386_3.output:get("Debug") then
            return;
        else
            print_dev(v877(v879, v878));
            return;
        end;
    end;
    local function v883(v881, v882)
        -- upvalues: l_v386_3 (ref), v877 (ref)
        if not l_v386_3.output:get("Console") then
            return;
        else
            print_raw(v877(v882, v881));
            return;
        end;
    end;
    local function v885(v884)
        -- upvalues: v869 (ref)
        return v869[v884] or "?";
    end;
    local function v901(v886)
        -- upvalues: v885 (ref), l_v386_3 (ref), v874 (ref), l_v393_4 (ref), v880 (ref), v883 (ref)
        local l_target_0 = v886.target;
        if l_target_0 == nil then
            return;
        else
            local v888 = "Hit";
            if not v886.target:is_alive() then
                v888 = "Killed";
            end;
            local v889 = l_target_0:get_name();
            local v890 = v885(v886.hitgroup);
            local v891 = v885(v886.wanted_hitgroup);
            local l_damage_1 = v886.damage;
            local l_wanted_damage_0 = v886.wanted_damage;
            local l_hitchance_0 = v886.hitchance;
            local l_backtrack_0 = v886.backtrack;
            local v896 = l_v386_3.color_hit:get();
            local v897 = nil;
            v897 = string.format("%s ${%s} in ${%s} for ${%s} damage", v888, v889, v890, l_damage_1);
            v897 = v874(v897, v896);
            local v898 = nil;
            if v890 ~= v891 then
                v890 = string.format("%s(%s)", v890, v891);
            end;
            if l_damage_1 ~= l_wanted_damage_0 then
                l_damage_1 = string.format("%s(%d)", l_damage_1, l_wanted_damage_0);
            end;
            local v899 = {};
            local v900 = " \194\183 ";
            table.insert(v899, string.format("hc: ${%d%%}", l_hitchance_0));
            table.insert(v899, string.format("bt: ${%dt}", l_backtrack_0));
            v899 = table.concat(v899, v900);
            v898 = string.format("%s ${%s} in ${%s} for ${%s} damage (%s)", v888, v889, v890, l_damage_1, v899);
            v898 = v874(v898, v896);
            l_v393_4(v896, v897);
            v880(v896, v898);
            v883(v896, v898);
            return;
        end;
    end;
    local function v914(v902)
        -- upvalues: v885 (ref), l_v386_3 (ref), v874 (ref), l_v393_4 (ref), v880 (ref), v883 (ref)
        local l_target_1 = v902.target;
        if l_target_1 == nil then
            return;
        else
            local v904 = l_target_1:get_name();
            local v905 = v885(v902.wanted_hitgroup);
            local l_state_0 = v902.state;
            local l_hitchance_1 = v902.hitchance;
            local l_backtrack_1 = v902.backtrack;
            local v909 = l_v386_3.color_miss:get();
            local v910 = nil;
            v910 = string.format("Missed ${%s}'s ${%s} due to ${%s}", v904, v905, l_state_0);
            v910 = v874(v910, v909);
            local v911 = nil;
            local v912 = {};
            local v913 = " \194\183 ";
            table.insert(v912, string.format("hc: ${%d%%}", l_hitchance_1));
            table.insert(v912, string.format("bt: ${%dt}", l_backtrack_1));
            v912 = table.concat(v912, v913);
            v911 = string.format("Missed ${%s}'s ${%s} due to ${%s} (%s)", v904, v905, l_state_0, v912);
            v911 = v874(v911, v909);
            l_v393_4(v909, v910);
            v880(v909, v911);
            v883(v909, v911);
            return;
        end;
    end;
    local function v916(v915)
        -- upvalues: v901 (ref), v914 (ref)
        if v915.state == nil then
            v901(v915);
        else
            v914(v915);
        end;
    end;
    local function v925(v917)
        -- upvalues: v870 (ref), l_v386_3 (ref), v874 (ref), l_v393_4 (ref), v880 (ref), v883 (ref)
        local v918 = entity.get_local_player();
        local v919 = entity.get(v917.userid, true);
        if entity.get(v917.attacker, true) ~= v918 or v919 == v918 then
            return;
        else
            local v920 = v870[v917.weapon];
            if v920 == nil then
                return;
            else
                local v921 = v919:get_name();
                local l_dmg_health_0 = v917.dmg_health;
                local v923 = l_v386_3.color_hit:get();
                local v924 = string.format("%s ${%s} for ${%d} damage", v920, v921, l_dmg_health_0);
                v924 = v874(v924, v923);
                l_v393_4(v923, v924);
                v880(v923, v924);
                v883(v923, v924);
                return;
            end;
        end;
    end;
    local _ = nil;
    local function v928(v927)
        -- upvalues: l_v391_4 (ref)
        if not v927:get("Notify") then
            l_v391_4();
        end;
    end;
    do
        local l_v928_0 = v928;
        local function v932(v930)
            -- upvalues: l_v386_3 (ref), l_v928_0 (ref), l_v391_4 (ref), v925 (ref), v916 (ref), l_v394_3 (ref)
            local v931 = v930:get();
            if v931 then
                l_v386_3.output:set_callback(l_v928_0);
            else
                l_v386_3.output:unset_callback(l_v928_0);
            end;
            if not v931 then
                l_v391_4();
            end;
            events.player_hurt(v925, v931);
            events.aim_ack(v916, v931);
            events.render(l_v394_3, v931);
        end;
        l_v386_3.enabled:set_callback(v932, true);
    end;
end;
v386 = nil;
v387 = v42.other.aimbot.maxusrcmdprocessticks;
v388 = cvar.sv_maxusrcmdprocessticks;
do
    local l_v387_4, l_v388_4, l_l_angles_1_5, l_v391_5, l_v393_5 = v387, v388, l_angles_1, v391, v393;
    l_l_angles_1_5 = function()
        -- upvalues: l_v388_4 (ref)
        l_v388_4:int(tonumber(l_v388_4:string()), true);
    end;
    l_v391_5 = function()
        -- upvalues: l_v388_4 (ref), l_v387_4 (ref)
        l_v388_4:int(l_v387_4.ticks:get(), true);
    end;
    l_v393_5 = function()
        -- upvalues: l_l_angles_1_5 (ref)
        l_l_angles_1_5();
    end;
    v394 = nil;
    local function v939(_)
        -- upvalues: l_v391_5 (ref)
        l_v391_5();
    end;
    do
        local l_v939_0 = v939;
        local function v943(v941)
            -- upvalues: l_v387_4 (ref), l_v939_0 (ref), l_v391_5 (ref), l_l_angles_1_5 (ref), l_v393_5 (ref)
            local v942 = v941:get();
            if v942 then
                l_v387_4.ticks:set_callback(l_v939_0);
                l_v391_5();
            else
                l_v387_4.ticks:unset_callback(l_v939_0);
                l_l_angles_1_5();
            end;
            events.shutdown(l_v393_5, v942);
        end;
        l_v387_4.enabled:set_callback(v943, true);
    end;
end;
v387 = nil;
v388 = v42.other.aimbot.fake_latency;
l_angles_1 = cvar.sv_maxunlag;
do
    local l_l_angles_1_6, l_v391_6, l_v393_6, l_v394_4 = l_angles_1, v391, v393, v394;
    l_v391_6 = function()
        -- upvalues: l_l_angles_1_6 (ref)
        l_l_angles_1_6:float(tonumber(l_l_angles_1_6:string()), true);
    end;
    l_v393_6 = function()
        -- upvalues: l_l_angles_1_6 (ref)
        l_l_angles_1_6:float(0.4, true);
    end;
    l_v394_4 = function()
        -- upvalues: l_v391_6 (ref)
        l_v391_6();
    end;
    local _ = nil;
    local function v951(v949)
        -- upvalues: l_v393_6 (ref), l_v391_6 (ref), l_v394_4 (ref)
        local v950 = v949:get();
        if v950 then
            l_v393_6();
        else
            l_v391_6();
        end;
        events.shutdown(l_v394_4, v950);
    end;
    v388.enabled:set_callback(v951, true);
end;
v385 = nil;
v386 = nil;
v387 = v42.other.visuals.crosshair_indicators;
do
    local l_v387_5 = v387;
    v388 = function()
        -- upvalues: l_v387_5 (ref), v8 (ref)
        local v953 = render.screen_size();
        local v954 = vector(v953.x * 0.5, v953.y - 8);
        local v955 = l_v387_5.color:get();
        v955.a = 255;
        local v956 = 1;
        local v957 = string.lower(v8.name);
        local v958 = render.measure_text(v956, nil, v957);
        v954.x = v954.x - v958.x * 0.5;
        v954.y = v954.y - v958.y;
        render.text(v956, v954, v955, nil, v957);
    end;
    l_angles_1 = nil;
    events.render(v388);
end;
v387 = nil;
v388 = v42.other.visuals.crosshair_indicators;
l_angles_1 = 10;
v391 = 0;
v393 = 0;
v394 = 0;
local v959 = 0;
local v960 = 0;
local v961 = 0;
local v962 = 0;
local v963 = 0;
local function v969()
    -- upvalues: v18 (ref)
    local v964 = ui.get_binds(true);
    for v965 = 1, #v964 do
        local v966 = v964[v965];
        local l_value_0 = v966.value;
        local l_reference_0 = v966.reference;
        if l_reference_0:get() == l_value_0 and l_reference_0:id() == v18.rage.selection.min_damage:id() then
            return true;
        end;
    end;
    return false;
end;
local function v975()
    -- upvalues: v18 (ref)
    local v970 = ui.get_binds(true);
    for v971 = 1, #v970 do
        local v972 = v970[v971];
        local l_value_1 = v972.value;
        local l_reference_1 = v972.reference;
        if l_reference_1:get() == l_value_1 and l_reference_1:id() == v18.rage.selection.hit_chance:id() then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v388_5, l_l_angles_1_7, l_v391_7, l_v959_0, l_v960_0, l_v961_0, l_v962_0, l_v963_0, l_v969_0, l_v975_0 = v388, l_angles_1, v391, v959, v960, v961, v962, v963, v969, v975;
    local function v993(v986, v987, v988)
        -- upvalues: v8 (ref), v98 (ref), v4 (ref), l_l_angles_1_7 (ref)
        local v989 = string.upper(v8.name);
        local v990 = 2;
        v989 = v98.matrix(v989, v987, v988);
        v989 = string.upper(v989);
        local v991 = render.measure_text(v990, nil, v989);
        local v992 = v986:clone();
        v992.x = v992.x - v4(v991.x * 0.5);
        render.text(v990, v992, v987, nil, v989);
        v986.y = v986.y + l_l_angles_1_7;
    end;
    local function v1001(v994, v995, v996)
        -- upvalues: v4 (ref), l_l_angles_1_7 (ref)
        local v997 = "DMG";
        local v998 = 2;
        local v999 = render.measure_text(v998, nil, v997);
        local v1000 = v994:clone();
        v1000.x = v1000.x - v4(v999.x * 0.5);
        v995.a = v995.a * v996;
        render.text(v998, v1000, v995, nil, v997);
        v994.y = v994.y + v4(l_l_angles_1_7 * v996);
    end;
    local function v1009(v1002, v1003, v1004)
        -- upvalues: v4 (ref), l_l_angles_1_7 (ref)
        local v1005 = "HC";
        local v1006 = 2;
        local v1007 = render.measure_text(v1006, nil, v1005);
        local v1008 = v1002:clone();
        v1008.x = v1008.x - v4(v1007.x * 0.5);
        v1003.a = v1003.a * v1004;
        render.text(v1006, v1008, v1003, nil, v1005);
        v1002.y = v1002.y + v4(l_l_angles_1_7 * v1004);
    end;
    local function v1017(v1010, v1011, v1012)
        -- upvalues: v4 (ref), l_l_angles_1_7 (ref)
        local v1013 = "DT";
        local v1014 = 2;
        local v1015 = render.measure_text(v1014, nil, v1013);
        local v1016 = v1010:clone();
        v1016.x = v1016.x - v4(v1015.x * 0.5);
        v1011 = color(255, 0, 0, 255):lerp(v1011, rage.exploit:get());
        v1011.a = v1011.a * v1012;
        render.text(v1014, v1016, v1011, nil, v1013);
        v1010.y = v1010.y + v4(l_l_angles_1_7 * v1012);
    end;
    local function v1025(v1018, v1019, v1020)
        -- upvalues: v4 (ref), l_l_angles_1_7 (ref)
        local v1021 = "OS";
        local v1022 = 2;
        local v1023 = render.measure_text(v1022, nil, v1021);
        local v1024 = v1018:clone();
        v1024.x = v1024.x - v4(v1023.x * 0.5);
        v1019.a = v1019.a * v1020;
        render.text(v1022, v1024, v1019, nil, v1021);
        v1018.y = v1018.y + v4(l_l_angles_1_7 * v1020);
    end;
    local function v1033(v1026, v1027, v1028)
        -- upvalues: v4 (ref), l_l_angles_1_7 (ref)
        local v1029 = "FS";
        local v1030 = 2;
        local v1031 = render.measure_text(v1030, nil, v1029);
        local v1032 = v1026:clone();
        v1032.x = v1032.x - v4(v1031.x * 0.5);
        v1027.a = v1027.a * v1028;
        render.text(v1030, v1032, v1027, nil, v1029);
        v1026.y = v1026.y + v4(l_l_angles_1_7 * v1028);
    end;
    local function v1036(v1034)
        -- upvalues: l_v391_7 (ref), v15 (ref), l_v959_0 (ref), l_v969_0 (ref), l_v960_0 (ref), l_v975_0 (ref), l_v961_0 (ref), v18 (ref), l_v962_0 (ref), l_v963_0 (ref), v42 (ref)
        local l_m_bIsScoped_0 = v1034.m_bIsScoped;
        l_v391_7 = v15.interp(l_v391_7, l_m_bIsScoped_0, 0.05);
        l_v959_0 = v15.interp(l_v959_0, l_v969_0(), 0.04);
        l_v960_0 = v15.interp(l_v960_0, l_v975_0(), 0.04);
        l_v961_0 = v15.interp(l_v961_0, v18.rage.main.double_tap:get(), 0.04);
        l_v962_0 = v15.interp(l_v962_0, v18.rage.main.hide_shots:get(), 0.04);
        l_v963_0 = v15.interp(l_v963_0, v42.antiaim.hotkeys.freestanding.enabled:get(), 0.04);
    end;
    local function v1039()
        -- upvalues: v4 (ref), l_v391_7 (ref), l_v388_5 (ref), v993 (ref), v1001 (ref), l_v959_0 (ref), v1009 (ref), l_v960_0 (ref), v1017 (ref), l_v961_0 (ref), v1025 (ref), l_v962_0 (ref), v1033 (ref), l_v963_0 (ref)
        local v1037 = render.screen_size() * 0.5;
        v1037.x = v1037.x + v4(l_v391_7 * 32);
        v1037.y = v1037.y + l_v388_5.offset:get();
        local v1038 = l_v388_5.color:get();
        v993(v1037, v1038, color(75, 75, 75, 255));
        v1001(v1037, color(255, 255, 255, 255), l_v959_0);
        v1009(v1037, color(255, 255, 255, 255), l_v960_0);
        v1017(v1037, color(255, 255, 255, 255), l_v961_0);
        v1025(v1037, color(255, 255, 255, 255), (1 - l_v961_0) * l_v962_0);
        v1033(v1037, color(255, 255, 255, 255), l_v963_0);
    end;
    local function v1041()
        -- upvalues: v1036 (ref), v1039 (ref)
        local v1040 = entity.get_local_player();
        if v1040 == nil or not v1040:is_alive() then
            return;
        else
            v1036(v1040);
            v1039();
            return;
        end;
    end;
    local _ = nil;
    local function v1044(v1043)
        -- upvalues: v1041 (ref)
        events.render(v1041, v1043:get());
    end;
    l_v388_5.enabled:set_callback(v1044, true);
end;
v388 = nil;
l_angles_1 = v42.other.visuals.manual_arrows;
v391 = render.load_font("Verdana", 16, "a");
do
    local l_l_angles_1_8, l_v391_8, l_v393_7 = l_angles_1, v391, v393;
    l_v393_7 = function()
        -- upvalues: v42 (ref), l_l_angles_1_8 (ref), l_v391_8 (ref)
        local v1048 = entity.get_local_player();
        if v1048 == nil or not v1048:is_alive() then
            return;
        else
            local v1049 = render.screen_size() * 0.5;
            local v1050 = v42.antiaim.hotkeys.manual_yaw.direction:get();
            local v1051 = l_l_angles_1_8.offset:get();
            local v1052 = l_l_angles_1_8.color:get();
            if v1050 == "Left" then
                local v1053 = "\226\157\174";
                local l_l_v391_8_0 = l_v391_8;
                local v1055 = render.measure_text(l_l_v391_8_0, "s", v1053);
                local v1056 = vector(v1049.x - v1055.x - v1051 + 1, v1049.y - v1055.y * 0.5 - 1);
                render.text(l_l_v391_8_0, v1056, v1052, "s", v1053);
            end;
            if v1050 == "Right" then
                local v1057 = "\226\157\175";
                local l_l_v391_8_1 = l_v391_8;
                local v1059 = render.measure_text(l_l_v391_8_1, "s", v1057);
                local v1060 = vector(v1049.x + v1051, v1049.y - v1059.y * 0.5 - 1);
                render.text(l_l_v391_8_1, v1060, v1052, "s", v1057);
            end;
            return;
        end;
    end;
    v394 = nil;
    v959 = function(v1061)
        -- upvalues: l_v393_7 (ref)
        events.render(l_v393_7, v1061:get());
    end;
    l_l_angles_1_8.enabled:set_callback(v959, true);
end;
l_angles_1 = nil;
v391 = v42.other.visuals.damage_indicator;
v393 = 4;
v394 = 4;
v959 = {
    Pixel = 2, 
    Small = 1, 
    Bold = 4
};
v960 = v18.rage.selection.min_damage;
do
    local l_v391_9, l_v393_8, l_v394_5, l_v959_1, l_v960_1, l_v961_1, l_v962_1 = v391, v393, v394, v959, v960, v961, v962;
    l_v961_1 = function()
        -- upvalues: l_v960_1 (ref)
        local v1069 = ui.get_binds(true);
        for v1070 = 1, #v1069 do
            local v1071 = v1069[v1070];
            local l_value_2 = v1071.value;
            local l_reference_2 = v1071.reference;
            if l_reference_2:get() == l_value_2 and l_reference_2:id() == l_v960_1:id() then
                return true;
            end;
        end;
        return false;
    end;
    l_v962_1 = function()
        -- upvalues: l_v961_1 (ref), l_v960_1 (ref), l_v391_9 (ref), l_v959_1 (ref), l_v393_8 (ref), l_v394_5 (ref)
        local v1074 = entity.get_local_player();
        if v1074 == nil or not v1074:is_alive() then
            return;
        elseif not l_v961_1() then
            return;
        else
            local v1075 = render.screen_size() * 0.5;
            local v1076 = l_v960_1:get();
            local v1077 = l_v391_9.font:get();
            local v1078 = l_v391_9.color:get();
            local v1079 = tostring(v1076);
            local v1080 = l_v959_1[v1077];
            local v1081 = render.measure_text(v1080, nil, v1079);
            local v1082 = vector(v1075.x + l_v393_8, v1075.y - v1081.y - l_v394_5);
            render.text(v1080, v1082, v1078, nil, v1079);
            return;
        end;
    end;
    v963 = nil;
    v969 = function(v1083)
        -- upvalues: l_v962_1 (ref)
        events.render(l_v962_1, v1083:get());
    end;
    l_v391_9.enabled:set_callback(v969, true);
end;
v391 = nil;
v393 = v42.other.visuals.hit_marker;
v394 = {};
do
    local l_v393_9, l_v394_6, l_v959_2, l_v960_2, l_v961_2 = v393, v394, v959, v960, v961;
    l_v959_2 = function()
        -- upvalues: l_v394_6 (ref)
        l_v394_6 = {};
    end;
    l_v960_2 = function(v1089)
        -- upvalues: l_v394_6 (ref)
        local v1090 = {
            position = v1089.aim, 
            time = 3
        };
        table.insert(l_v394_6, v1090);
    end;
    l_v961_2 = function()
        -- upvalues: l_v394_6 (ref), l_v393_9 (ref)
        local v1091 = entity.get_local_player();
        if v1091 == nil or not v1091:is_alive() then
            return;
        else
            local l_frametime_1 = globals.frametime;
            local v1093 = #l_v394_6;
            for v1094 = v1093, 1, -1 do
                local v1095 = l_v394_6[v1094];
                if v1095.time > 0 then
                    v1095.time = v1095.time - l_frametime_1;
                else
                    table.remove(l_v394_6, v1093);
                end;
            end;
            local v1096 = l_v393_9.thickness:get() * 0.5;
            local v1097 = l_v393_9.size:get() + v1096;
            local v1098 = l_v393_9.color:get();
            for v1099 = 1, #l_v394_6 do
                local v1100 = l_v394_6[v1099];
                local v1101 = render.world_to_screen(v1100.position);
                if v1101 ~= nil then
                    local v1102 = math.clamp(v1100.time, 0, 1);
                    local v1103 = v1098:clone();
                    local v1104 = v1101 - vector(v1096, v1097);
                    local v1105 = v1101 + vector(v1096, v1097);
                    local v1106 = v1101 - vector(v1097, v1096);
                    local v1107 = v1101 + vector(v1097, v1096);
                    v1103.a = v1103.a * v1102;
                    render.rect(v1104, v1105, v1103);
                    render.rect(v1106, v1107, v1103);
                end;
            end;
            return;
        end;
    end;
    v962 = nil;
    v963 = function(v1108)
        -- upvalues: l_v959_2 (ref), l_v961_2 (ref), l_v960_2 (ref)
        local v1109 = v1108:get();
        if not v1109 then
            l_v959_2();
        end;
        events.render(l_v961_2, v1109);
        events.aim_ack(l_v960_2, v1109);
    end;
    l_v393_9.enabled:set_callback(v963, true);
end;
v393 = nil;
v394 = v42.other.visuals.velocity_warning;
v959 = 160;
v960 = 4;
v961 = 0;
do
    local l_v394_7, l_v959_3, l_v960_3, l_v961_3, l_v962_2 = v394, v959, v960, v961, v962;
    l_v962_2 = function()
        -- upvalues: l_v961_3 (ref), v15 (ref), l_v394_7 (ref), l_v959_3 (ref), l_v960_3 (ref)
        local v1115 = entity.get_local_player();
        if v1115 == nil or not v1115:is_alive() then
            return;
        else
            local l_m_flVelocityModifier_0 = v1115.m_flVelocityModifier;
            l_v961_3 = v15.interp(l_v961_3, l_m_flVelocityModifier_0 ~= 1 or ui.get_alpha() > 0.5, 0.05);
            if l_v961_3 <= 0 then
                return;
            else
                local v1117 = render.screen_size();
                local v1118 = vector(v1117.x * 0.5, l_v394_7.offset:get());
                local v1119 = l_v394_7.color:get();
                local v1120 = color(255, 255, 255, 255);
                local v1121 = color(0, 0, 0, 255);
                v1119.a = v1119.a * l_v961_3;
                v1120.a = v1120.a * l_v961_3;
                v1121.a = v1121.a * l_v961_3;
                local v1122 = string.format("Max velocity reduced by %s%%", math.floor(l_m_flVelocityModifier_0 * 100));
                local v1123 = 1;
                local v1124 = render.measure_text(v1123, nil, v1122);
                local v1125 = vector(v1118.x - v1124.x * 0.5, v1118.y);
                render.text(v1123, v1125, v1120, nil, v1122);
                v1118.y = v1118.y + 16;
                local v1126 = vector(v1118.x - l_v959_3 * 0.5, v1118.y);
                local v1127 = vector(v1118.x + l_v959_3 * 0.5, v1118.y + l_v960_3);
                render.shadow(v1126, v1127, v1119, 32, 0, 4);
                render.rect(v1126, v1127, v1121, 4);
                v1126 = v1126 + 1;
                v1127 = v1127 - 1;
                v1127.x = v1127.x - (l_v959_3 - l_v959_3 * l_m_flVelocityModifier_0);
                render.rect(v1126, v1127, v1119, 4);
                return;
            end;
        end;
    end;
    v963 = nil;
    v969 = function(v1128)
        -- upvalues: l_v962_2 (ref)
        events.render(l_v962_2, v1128:get());
    end;
    l_v394_7.enabled:set_callback(v969, true);
end;
v394 = nil;
v959 = v42.other.visuals.skeet_indicators;
v960 = vector(24, 22, 0);
v961 = render.load_font("Calibri", v960, "ab");
v962 = 520;
v963 = 8;
v969 = 24;
v975 = 4;
local v1129 = 3;
local v1130 = vector(30, 30);
local v1131 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", v1130);
local v1132 = color(0, 0, 0, 50);
local v1133 = color(0, 0, 0, 0);
local function v1136(v1134)
    local v1135 = v1134:get_override();
    if v1135 ~= nil then
        return v1135;
    else
        return v1134:get();
    end;
end;
local function v1143(v1137)
    local v1138 = ui.get_binds(true);
    for v1139 = 1, #v1138 do
        local v1140 = v1138[v1139];
        local l_value_3 = v1140.value;
        local l_reference_3 = v1140.reference;
        if l_reference_3:get() == l_value_3 and l_reference_3:id() == v1137:id() then
            return true;
        end;
    end;
    return false;
end;
local function v1149(v1144, v1145)
    local v1146 = 0.5;
    local v1147 = 0.5;
    if v1145 > 0 then
        local v1148 = v1144 * v1146;
        if v1145 < (v1144 - v1148) * v1147 then
            v1148 = v1144 - v1145 * (1 / v1147);
        end;
        v1144 = v1148;
    end;
    return v1144;
end;
do
    local l_v959_4, l_v961_4, l_v962_3, l_v963_1, l_v969_1, l_v975_1, l_v1129_0, l_v1130_0, l_v1131_0, l_v1132_0, l_v1133_0, l_v1136_0, l_v1143_0, l_v1149_0 = v959, v961, v962, v963, v969, v975, v1129, v1130, v1131, v1132, v1133, v1136, v1143, v1149;
    local function v1172(v1164, v1165)
        -- upvalues: l_v1149_0 (ref)
        local v1166 = 1;
        local v1167 = 500;
        local v1168 = v1167 * 3.5;
        local v1169 = (v1165:get_origin() - v1164:get_origin()):length();
        local v1170 = v1168 / 3;
        local v1171 = v1167 * math.exp(-v1169 * v1169 / (2 * v1170 * v1170)) * v1166;
        return l_v1149_0(v1171, v1164.m_ArmorValue);
    end;
    local function v1185(v1173, v1174, v1175, v1176, v1177)
        -- upvalues: l_v969_1 (ref), l_v975_1 (ref), l_v961_4 (ref), l_v1130_0 (ref), l_v1133_0 (ref), l_v1132_0 (ref), v4 (ref), l_v963_1 (ref)
        local v1178 = v1173 + vector(l_v969_1, l_v975_1);
        local v1179 = render.measure_text(l_v961_4, nil, v1175);
        local l_v1179_0 = v1179;
        l_v1179_0.y = l_v1179_0.y + l_v975_1 * 2;
        l_v1179_0 = l_v1179_0 + vector(50, 2);
        v1178.y = v1178.y + 3;
        if v1176 then
            l_v1179_0.x = l_v1179_0.x + 30;
        end;
        if v1177 then
            l_v1179_0.x = l_v1179_0.x + l_v1130_0.x + 2;
        end;
        local l_v1173_0 = v1173;
        local v1182 = v1173 + l_v1179_0;
        local v1183 = (l_v1173_0 + v1182) * 0.5;
        render.gradient(l_v1173_0, vector(v1183.x, v1182.y), l_v1133_0, l_v1132_0, l_v1133_0, l_v1132_0);
        render.gradient(v1182, vector(v1183.x, l_v1173_0.y), l_v1133_0, l_v1132_0, l_v1133_0, l_v1132_0);
        if v1177 then
            l_v1173_0 = v1173:clone();
            l_v1173_0.x = l_v1173_0.x + l_v969_1;
            l_v1173_0.y = l_v1173_0.y + (l_v1179_0.y - l_v1130_0.y) * 0.5;
            render.texture(v1177, l_v1173_0, l_v1130_0, v1174, "f");
            v1178.x = v1178.x + l_v1130_0.x + 6;
        end;
        render.text(l_v961_4, v1178 + 1, color(0, 0, 0, 128), nil, v1175);
        render.text(l_v961_4, v1178, v1174, nil, v1175);
        v1178.x = v1178.x + v1179.x;
        if v1176 then
            l_v1173_0 = 10;
            v1182 = 5;
            v1183 = color(255, 255, 255, 200);
            local v1184 = vector(v1178.x + l_v1173_0 * 0.5 + 12, v1173.y + l_v1179_0.y * 0.5);
            render.circle_outline(v1184, color(0, 0, 0, 255), l_v1173_0, 0, 1, v1182);
            render.circle_outline(v1184, v1183, l_v1173_0 - 1, 0, v1176, v1182 - 2);
        end;
        v1173.y = v1173.y - v4(l_v1179_0.y + l_v963_1);
    end;
    local function v1196(v1186, v1187, v1188)
        -- upvalues: v1185 (ref), l_v1131_0 (ref)
        local v1189 = v1187:get_player_weapon();
        if v1189 == nil then
            return;
        elseif not v1189.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v1189.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v1191 = v1187:get_origin();
                local l_m_bombsiteCenterA_0 = v1188.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v1188.m_bombsiteCenterB;
                local v1194 = v1191:distsqr(l_m_bombsiteCenterA_0) < v1191:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v1195 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v1185(v1186, color(252, 243, 105, 255), v1194, 1 - v1195, l_v1131_0);
                return;
            end;
        end;
    end;
    local function v1212(v1197, v1198, v1199)
        -- upvalues: v1185 (ref), l_v1131_0 (ref), v1172 (ref)
        local l_m_bBombDefused_0 = v1199.m_bBombDefused;
        if not v1199.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local l_m_flC4Blow_0 = v1199.m_flC4Blow;
            local v1203 = l_m_flC4Blow_0 - l_curtime_0;
            if v1203 > 0 then
                if v1199.m_hBombDefuser ~= nil then
                    local v1204 = render.screen_size();
                    local l_m_flDefuseCountDown_0 = v1199.m_flDefuseCountDown;
                    local v1206 = (l_m_flDefuseCountDown_0 - l_curtime_0) / 10;
                    local v1207 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v1208 = (v1204.y - 2) * v1206;
                    render.rect(vector(0, 0), vector(20, v1204.y), color(0, 0, 0, 115));
                    render.rect(vector(1, 1 + v1208), vector(19, v1204.y - 1), v1207);
                end;
                local v1209 = string.format("%s - %.1fs", v1199.m_nBombSite == 1 and "B" or "A", v1203);
                v1185(v1197, color(255, 255, 255, 200), v1209, nil, l_v1131_0);
            end;
            local l_m_iHealth_1 = v1198.m_iHealth;
            local v1211 = v1172(v1198, v1199);
            v1211 = math.floor(v1211);
            if l_m_iHealth_1 <= v1211 then
                v1185(v1197, color(255, 0, 50, 255), "FATAL");
            elseif v1211 > 0 then
                v1185(v1197, color(252, 243, 105, 255), string.format("-%d HP", v1211));
            end;
            return;
        end;
    end;
    local function v1221(v1213, v1214)
        -- upvalues: v1196 (ref), v1212 (ref)
        local v1215 = entity.get_game_rules();
        if v1215 == nil then
            return;
        else
            local v1216 = entity.get_player_resource();
            if v1216 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v1215.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v1216.m_iPlayerC4;
                if l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v1219 = entity.get(l_m_iPlayerC4_0);
                    if v1219 ~= nil then
                        v1196(v1213, v1219, v1216);
                    end;
                end;
                if l_m_bBombPlanted_0 then
                    local v1220 = entity.get_entities("CPlantedC4")[1];
                    if v1220 ~= nil then
                        v1212(v1213, v1214, v1220);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v1233()
        -- upvalues: l_v1129_0 (ref), l_v962_3 (ref), l_v959_4 (ref), l_v1136_0 (ref), v18 (ref), v1185 (ref), v42 (ref), l_v1143_0 (ref), v1221 (ref)
        local v1222 = entity.get_local_player();
        if v1222 == nil then
            return;
        else
            local v1223 = render.screen_size();
            local v1224 = vector(l_v1129_0, v1223.y - (v1223.y - l_v962_3) * 0.5);
            if v1222:is_alive() then
                if l_v959_4.items:get("PING") then
                    local v1225 = l_v1136_0(v18.misc.main.other.fake_latency);
                    if v1225 > 0 then
                        local v1226 = utils.net_channel();
                        if v1226 ~= nil then
                            local v1227 = nil;
                            local v1228 = math.clamp(v1226.latency[0] + v1226.latency[1], 0.001, 0.2);
                            local v1229 = math.clamp(v1225 * 0.001 + v1226.avg_latency[1], 0.001, 0.2);
                            local v1230 = math.clamp(v1228 / v1229, 0, 1);
                            if v1230 < 0.5 then
                                v1227 = color(200, 200, 200, 255):lerp(color(213, 197, 84, 255), v1230 * 2);
                            else
                                v1227 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v1230 - 0.5) * 2);
                            end;
                            if v1227 ~= nil then
                                v1185(v1224, v1227, "PING");
                            end;
                        end;
                    end;
                end;
                if l_v959_4.items:get("DT") and l_v1136_0(v18.rage.main.double_tap) and not l_v1136_0(v18.antiaim.misc.fake_duck) then
                    local v1231 = color(255, 0, 50, 255);
                    if rage.exploit:get() == 1 then
                        v1231 = color(255, 255, 255, 200);
                    end;
                    v1185(v1224, v1231, "DT");
                end;
                if l_v959_4.items:get("OSAA") and l_v1136_0(v18.rage.main.hide_shots) and not l_v1136_0(v18.rage.main.double_tap) and not l_v1136_0(v18.antiaim.misc.fake_duck) then
                    v1185(v1224, color(255, 255, 255, 200), "OSAA");
                end;
                if l_v959_4.items:get("DUCK") and l_v1136_0(v18.antiaim.misc.fake_duck) then
                    v1185(v1224, color(255, 255, 255, 200), "DUCK");
                end;
                if l_v959_4.items:get("DA") and (l_v1136_0(v18.rage.main.dormant_aimbot) or v42.other.aimbot.dormant_aimbot.enabled:get()) then
                    local v1232 = color(255, 0, 50, 255);
                    if #entity.get_players(true, false) == 0 then
                        v1232 = color(255, 255, 255, 200);
                    end;
                    v1185(v1224, v1232, "DA");
                end;
                if l_v959_4.items:get("SAFE") and l_v1136_0(v18.rage.safety.safe_points) == "Force" then
                    v1185(v1224, color(255, 255, 255, 200), "SAFE");
                end;
                if l_v959_4.items:get("BODY") and l_v1136_0(v18.rage.safety.body_aim) == "Force" then
                    v1185(v1224, color(255, 255, 255, 200), "BODY");
                end;
                if l_v959_4.items:get("MD") and l_v1143_0(v18.rage.selection.min_damage) then
                    v1185(v1224, color(255, 255, 255, 200), "MD");
                end;
                if l_v959_4.items:get("HC") and l_v1143_0(v18.rage.selection.hit_chance) then
                    v1185(v1224, color(255, 255, 255, 200), "HC");
                end;
                if l_v959_4.items:get("FS") and l_v1136_0(v18.antiaim.angles.freestanding) then
                    v1185(v1224, color(255, 255, 255, 200), "FS");
                end;
            end;
            if l_v959_4.items:get("Bomb Information") then
                v1221(v1224, v1222);
            end;
            return;
        end;
    end;
    local _ = nil;
    local function v1236(v1235)
        -- upvalues: v1233 (ref)
        events.render(v1233, v1235:get());
    end;
    l_v959_4.enabled:set_callback(v1236, true);
end;
v959 = nil;
v960 = v42.other.visuals.scope_overlay;
v961 = 0;
do
    local l_v960_4, l_v961_5, l_v962_4 = v960, v961, v962;
    l_v962_4 = function()
        -- upvalues: l_v961_5 (ref), v15 (ref), v18 (ref), l_v960_4 (ref)
        local v1240 = entity.get_local_player();
        if v1240 == nil or not v1240:is_alive() then
            return;
        else
            local v1241 = v1240:get_player_weapon();
            if v1241 == nil then
                return;
            else
                l_v961_5 = v15.interp(l_v961_5, v1240.m_bIsScoped, 0.05);
                if l_v961_5 <= 0 then
                    return;
                else
                    v18.visuals.world.main.scope_overlay:override("Remove All");
                    local v1242 = render.screen_size() * 0.5;
                    local v1243 = l_v960_4.additions:get("Inverted");
                    local v1244 = l_v960_4.additions:get("Rotated");
                    local v1245 = l_v960_4.additions:get("Spread Dependency");
                    local v1246 = l_v960_4.size:get() * l_v961_5;
                    local v1247 = l_v960_4.gap:get();
                    local v1248 = l_v960_4.color:get();
                    local v1249 = v1241:get_inaccuracy();
                    if v1245 then
                        v1247 = v1247 + v1249 * 100;
                    end;
                    local v1250 = v1248:clone();
                    local v1251 = v1248:clone();
                    v1250.a = v1243 and v1250.a * l_v961_5 or 0;
                    v1251.a = v1243 and 0 or v1251.a * l_v961_5;
                    if v1244 then
                        render.push_rotation(45);
                    end;
                    if not l_v960_4.exclude_lines:get("Top") then
                        local v1252 = vector(v1242.x, v1242.y - (v1246 + v1247));
                        local v1253 = vector(v1252.x + 1, v1242.y - v1247);
                        render.gradient(v1252, v1253, v1250, v1250, v1251, v1251);
                    end;
                    if not l_v960_4.exclude_lines:get("Bottom") then
                        local v1254 = vector(v1242.x, v1242.y + v1246 + v1247);
                        local v1255 = vector(v1254.x + 1, v1242.y + v1247);
                        render.gradient(v1254, v1255, v1250, v1250, v1251, v1251);
                    end;
                    if not l_v960_4.exclude_lines:get("Left") then
                        local v1256 = vector(v1242.x - (v1246 + v1247), v1242.y);
                        local v1257 = vector(v1242.x - v1247, v1242.y + 1);
                        render.gradient(v1256, v1257, v1250, v1251, v1250, v1251);
                    end;
                    if not l_v960_4.exclude_lines:get("Right") then
                        local v1258 = vector(v1242.x + v1246 + v1247, v1242.y);
                        local v1259 = vector(v1242.x + v1247, v1242.y + 1);
                        render.gradient(v1258, v1259, v1250, v1251, v1250, v1251);
                    end;
                    if v1244 then
                        render.pop_rotation();
                    end;
                    return;
                end;
            end;
        end;
    end;
    v963 = nil;
    v969 = function(v1260)
        -- upvalues: v18 (ref), l_v962_4 (ref)
        local v1261 = v1260:get();
        if not v1261 then
            v18.visuals.world.main.scope_overlay:override();
        end;
        events.render(l_v962_4, v1261);
    end;
    l_v960_4.enabled:set_callback(v969, true);
end;
v960 = nil;
v961 = v42.other.visuals.aspect_ratio;
v962 = cvar.r_aspectratio;
do
    local l_v961_6, l_v962_5, l_v963_2, l_v969_2, l_v975_2 = v961, v962, v963, v969, v975;
    l_v963_2 = function()
        -- upvalues: l_v962_5 (ref)
        l_v962_5:float(tonumber(l_v962_5:string()), true);
    end;
    l_v969_2 = function()
        -- upvalues: l_v962_5 (ref), l_v961_6 (ref)
        l_v962_5:float(l_v961_6.proportion:get() * 0.01, true);
    end;
    l_v975_2 = function()
        -- upvalues: l_v963_2 (ref)
        l_v963_2();
    end;
    v1129 = nil;
    v1130 = function(v1267)
        -- upvalues: l_v961_6 (ref), l_v969_2 (ref), l_v963_2 (ref), l_v975_2 (ref)
        local v1268 = v1267:get();
        if v1268 then
            l_v961_6.proportion:set_callback(l_v969_2);
            l_v969_2();
        else
            l_v961_6.proportion:unset_callback(l_v969_2);
            l_v963_2();
        end;
        events.shutdown(l_v975_2, v1268);
    end;
    l_v961_6.enabled:set_callback(v1130, true);
end;
v961 = nil;
v962 = v42.other.visuals.viewmodel;
v963 = cvar.viewmodel_fov;
v969 = cvar.viewmodel_offset_x;
v975 = cvar.viewmodel_offset_y;
v1129 = cvar.viewmodel_offset_z;
do
    local l_v962_6, l_v963_3, l_v969_3, l_v975_3, l_v1129_1, l_v1130_1, l_v1131_1, l_v1132_1 = v962, v963, v969, v975, v1129, v1130, v1131, v1132;
    l_v1130_1 = function()
        -- upvalues: l_v963_3 (ref), l_v969_3 (ref), l_v975_3 (ref), l_v1129_1 (ref)
        l_v963_3:float(tonumber(l_v963_3:string()), true);
        l_v969_3:float(tonumber(l_v969_3:string()), true);
        l_v975_3:float(tonumber(l_v975_3:string()), true);
        l_v1129_1:float(tonumber(l_v1129_1:string()), true);
    end;
    l_v1131_1 = function()
        -- upvalues: l_v963_3 (ref), l_v962_6 (ref), l_v969_3 (ref), l_v975_3 (ref), l_v1129_1 (ref)
        l_v963_3:float(l_v962_6.fov:get() * 0.1, true);
        l_v969_3:float(l_v962_6.offset_x:get() * 0.1, true);
        l_v975_3:float(l_v962_6.offset_y:get() * 0.1, true);
        l_v1129_1:float(l_v962_6.offset_z:get() * 0.1, true);
    end;
    l_v1132_1 = function()
        -- upvalues: l_v1130_1 (ref)
        l_v1130_1();
    end;
    v1133 = nil;
    v1136 = function(v1277)
        -- upvalues: l_v962_6 (ref), l_v1131_1 (ref), l_v1130_1 (ref), l_v1132_1 (ref)
        local v1278 = v1277:get();
        if v1278 then
            l_v962_6.fov:set_callback(l_v1131_1);
            l_v962_6.offset_x:set_callback(l_v1131_1);
            l_v962_6.offset_y:set_callback(l_v1131_1);
            l_v962_6.offset_z:set_callback(l_v1131_1);
            l_v1131_1();
        else
            l_v962_6.fov:unset_callback(l_v1131_1);
            l_v962_6.offset_x:unset_callback(l_v1131_1);
            l_v962_6.offset_y:unset_callback(l_v1131_1);
            l_v962_6.offset_z:unset_callback(l_v1131_1);
            l_v1130_1();
        end;
        events.shutdown(l_v1132_1, v1278);
    end;
    l_v962_6.enabled:set_callback(v1136, true);
end;
v962 = nil;
v963 = v42.other.visuals.animations;
v969 = ffi.typeof("                struct {\n                    float  m_flLayerAnimtime;\n                    float  m_flLayerFadeOuttime;\n        \n                    // dispatch flags\n                    void  *m_pDispatchedStudioHdr;\n                    int    m_nDispatchedSrc;\n                    int    m_nDispatchedDst;\n        \n                    int    m_nOrder;\n                    int    m_nSequence;\n                    float  m_flPrevCycle;\n                    float  m_flWeight;\n                    float  m_flWeightDeltaRate;\n        \n                    // used for automatic crossfades between sequence changes;\n                    float  m_flPlaybackRate;\n                    float  m_flCycle;\n                    int    m_pOwner;\n                    int    m_nInvalidatePhysicsBits;\n                } **\n            ");
do
    local l_v963_4, l_v969_4, l_v975_4, l_v1129_2, l_v1130_2, l_v1131_2, l_v1132_2, l_v1133_1, l_v1136_1, l_v1143_1, l_v1149_1 = v963, v969, v975, v1129, v1130, v1131, v1132, v1133, v1136, v1143, v1149;
    l_v975_4 = function(v1290)
        -- upvalues: l_v969_4 (ref)
        return ffi.cast(l_v969_4, ffi.cast("uintptr_t", v1290[0]) + 10640)[0];
    end;
    l_v1129_2 = 6;
    l_v1130_2 = 12;
    l_v1131_2 = function(v1291)
        -- upvalues: l_v963_4 (ref), v18 (ref)
        local v1292 = l_v963_4.on_ground:get();
        if v1292 == "Static" then
            v1291.m_flPoseParameter[0] = 1;
            v18.antiaim.misc.leg_movement:override("Sliding");
            return;
        elseif v1292 == "Jitter" then
            if globals.tickcount % 4 > 1 then
                v1291.m_flPoseParameter[0] = 1;
                v1291.m_flPoseParameter[1] = 1;
            end;
            v18.antiaim.misc.leg_movement:override("Sliding");
            return;
        elseif v1292 == "Walking" then
            v1291.m_flPoseParameter[7] = 0;
            v18.antiaim.misc.leg_movement:override("Walking");
            return;
        elseif v1292 == "Kangaroo" then
            v1291.m_flPoseParameter[0] = utils.random_float(0, 1);
            v18.antiaim.misc.leg_movement:override("Sliding");
            return;
        else
            v18.antiaim.misc.leg_movement:override();
            return;
        end;
    end;
    l_v1132_2 = function(v1293)
        -- upvalues: l_v963_4 (ref), l_v975_4 (ref), l_v1129_2 (ref)
        local v1294 = l_v963_4.in_air:get();
        if v1294 == "Static" then
            v1293.m_flPoseParameter[6] = 1;
            return;
        elseif v1294 == "Jitter" then
            v1293.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and 1 or 0;
            return;
        elseif v1294 == "Walking" then
            local v1295 = l_v975_4(v1293);
            if v1295 == nil then
                return;
            else
                local v1296 = v1295[l_v1129_2];
                if v1296 == nil then
                    return;
                else
                    v1296.m_flWeight = 1;
                    return;
                end;
            end;
        elseif v1294 == "Kangaroo" then
            v1293.m_flPoseParameter[6] = utils.random_float(0.1, 1);
            return;
        else
            return;
        end;
    end;
    l_v1133_1 = function(v1297)
        -- upvalues: l_v963_4 (ref)
        if not l_v963_4.pitch_on_land:get() then
            return;
        else
            local v1298 = v1297:get_anim_state();
            if v1298 == nil or not v1298.landing then
                return;
            else
                v1297.m_flPoseParameter[12] = 0.5;
                return;
            end;
        end;
    end;
    l_v1136_1 = function(v1299)
        -- upvalues: l_v963_4 (ref)
        if not l_v963_4.sliding_slowwalk:get() then
            return;
        else
            v1299.m_flPoseParameter[9] = 0;
            return;
        end;
    end;
    l_v1143_1 = function(v1300)
        -- upvalues: l_v963_4 (ref)
        if not l_v963_4.sliding_crouch:get() then
            return;
        else
            v1300.m_flPoseParameter[8] = 0;
            return;
        end;
    end;
    l_v1149_1 = function(v1301)
        -- upvalues: l_v975_4 (ref), l_v1130_2 (ref), l_v963_4 (ref)
        local v1302 = l_v975_4(v1301);
        if v1302 == nil then
            return;
        else
            local v1303 = v1302[l_v1130_2];
            if v1303 == nil then
                return;
            elseif l_v963_4.earthquake:get() then
                v1303.m_flWeight = utils.random_float(0, 1);
                return;
            else
                local v1304 = l_v963_4.move_lean:get();
                if v1304 == -1 then
                    return;
                else
                    v1303.m_flWeight = v1304 * 0.01;
                    return;
                end;
            end;
        end;
    end;
    local function v1307(v1305)
        -- upvalues: l_v1131_2 (ref), l_v1132_2 (ref), l_v1133_1 (ref), l_v1136_1 (ref), l_v1143_1 (ref), l_v1149_1 (ref)
        local v1306 = entity.get_local_player();
        if v1305 ~= v1306 then
            return;
        else
            l_v1131_2(v1306);
            l_v1132_2(v1306);
            l_v1133_1(v1306);
            l_v1136_1(v1306);
            l_v1143_1(v1306);
            l_v1149_1(v1306);
            return;
        end;
    end;
    local _ = nil;
    local function v1311(v1309)
        -- upvalues: v18 (ref), v1307 (ref)
        local v1310 = v1309:get();
        if not v1310 then
            v18.antiaim.misc.leg_movement:override();
        end;
        events.post_update_clientside_animation(v1307, v1310);
    end;
    l_v963_4.enabled:set_callback(v1311, true);
end;
v963 = nil;
v969 = v42.other.visuals.nade_radius;
do
    local l_v969_5, l_v975_5 = v969, v975;
    l_v975_5 = function()
        -- upvalues: l_v969_5 (ref)
        if entity.get_local_player() == nil then
            return;
        else
            local v1314 = l_v969_5.molotov_color:get();
            local v1315 = l_v969_5.smoke_color:get();
            if l_v969_5.molotov:get() then
                entity.get_entities("CInferno", nil, function(v1316)
                    -- upvalues: v1314 (ref)
                    local v1317 = v1316:get_origin();
                    local v1318 = v1316:get_bbox();
                    local v1319 = v1314:clone();
                    v1319.a = v1319.a * v1318.alpha;
                    render.circle_3d_outline(v1317, v1319, 125, 0, 1, 1.5);
                end);
            end;
            if l_v969_5.smoke:get() then
                entity.get_entities("CSmokeGrenadeProjectile", nil, function(v1320)
                    -- upvalues: v1315 (ref)
                    if not v1320.m_bDidSmokeEffect then
                        return;
                    else
                        local v1321 = v1320:get_origin();
                        local v1322 = v1320:get_bbox();
                        local v1323 = v1315:clone();
                        v1323.a = v1323.a * v1322.alpha;
                        render.circle_3d_outline(v1321, v1323, 125, 0, 1, 1.5);
                        return;
                    end;
                end);
            end;
            return;
        end;
    end;
    v1129 = nil;
    v1130 = function(v1324)
        -- upvalues: l_v975_5 (ref)
        events.render(l_v975_5, v1324:get());
    end;
    l_v969_5.enabled:set_callback(v1130, true);
end;
v969 = nil;
v975 = v42.other.visuals.lag_comp_box;
v1129 = {};
v1130 = {};
v1131 = function(v1325, v1326, v1327)
    return v1325 + v1326 * (globals.tickinterval * v1327);
end;
do
    local l_v975_6, l_v1129_3, l_v1130_3, l_v1131_3, l_v1132_3 = v975, v1129, v1130, v1131, v1132;
    l_v1132_3 = function()
        -- upvalues: l_v975_6 (ref), l_v1129_3 (ref), l_v1130_3 (ref), l_v1131_3 (ref), v16 (ref)
        if entity.get_local_player() == nil then
            return;
        else
            local v1333 = l_v975_6.color:get();
            local v1334 = color(0, 0, 0, 0);
            entity.get_players(true, false, function(v1335)
                -- upvalues: l_v1129_3 (ref), l_v1130_3 (ref), l_v1131_3 (ref), v16 (ref), v1334 (ref), v1333 (ref)
                local v1336 = v1335:get_index();
                if not v1335:is_enemy() or not v1335:is_alive() or v1335:is_dormant() or v1335:get_network_state() == 5 then
                    l_v1129_3[v1336] = nil;
                    l_v1130_3[v1336] = nil;
                else
                    local l_m_vecOrigin_3 = v1335.m_vecOrigin;
                    local l_m_vecVelocity_2 = v1335.m_vecVelocity;
                    local l_m_vecMins_1 = v1335.m_vecMins;
                    local l_m_vecMaxs_1 = v1335.m_vecMaxs;
                    if l_v1130_3[v1336] then
                        local v1341 = v1335:get_simulation_time();
                        local v1342 = v1341.current - v1341.old;
                        if v1342 < 0 or v1342 > 0 and v1342 <= 64 then
                            local v1343 = l_m_vecOrigin_3:distsqr(l_v1130_3[v1336].m_vecOrigin);
                            l_v1129_3[v1336] = {
                                predicted_origin = l_v1131_3(l_m_vecOrigin_3, l_m_vecVelocity_2, v1342), 
                                is_lagcomp = v1343 > 4096
                            };
                        end;
                    end;
                    if l_v1129_3[v1336] and l_v1129_3[v1336].is_lagcomp then
                        local l_predicted_origin_0 = l_v1129_3[v1336].predicted_origin;
                        v16.box_new(l_predicted_origin_0, l_m_vecMins_1, l_m_vecMaxs_1, vector(), v1334, v1333, globals.tickinterval * 2);
                    end;
                    l_v1130_3[v1336] = {
                        m_vecOrigin = l_m_vecOrigin_3
                    };
                end;
            end);
            return;
        end;
    end;
    v1133 = nil;
    v1136 = function(v1345)
        -- upvalues: l_v1132_3 (ref)
        events.net_update_end(l_v1132_3, v1345:get());
    end;
    l_v975_6.enabled:set_callback(v1136, true);
end;
v975 = nil;
v1129 = v42.other.visuals.console_color;
v1130 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)");
v1131 = {
    [1] = materials.get_materials("vgui_white")[1], 
    [2] = materials.get_materials("vgui/hud/800corner1")[1], 
    [3] = materials.get_materials("vgui/hud/800corner2")[1], 
    [4] = materials.get_materials("vgui/hud/800corner3")[1], 
    [5] = materials.get_materials("vgui/hud/800corner4")[1]
};
do
    local l_v1129_4, l_v1130_4, l_v1131_4, l_v1132_4, l_v1133_2, l_v1136_2, l_v1143_2 = v1129, v1130, v1131, v1132, v1133, v1136, v1143;
    l_v1132_4 = function()
        -- upvalues: l_v1131_4 (ref)
        for v1353 = 1, #l_v1131_4 do
            l_v1131_4[v1353]:reset();
        end;
    end;
    l_v1133_2 = function(v1354)
        -- upvalues: l_v1131_4 (ref)
        local v1355 = v1354.a / 255;
        for v1356 = 1, #l_v1131_4 do
            local v1357 = l_v1131_4[v1356];
            v1357:alpha_modulate(v1355);
            v1357:color_modulate(v1354);
        end;
    end;
    l_v1136_2 = function()
        -- upvalues: l_v1130_4 (ref), l_v1133_2 (ref), l_v1129_4 (ref)
        if not l_v1130_4() then
            l_v1133_2(color(255, 255, 255, 255));
        else
            l_v1133_2(l_v1129_4.color:get());
        end;
    end;
    l_v1143_2 = function()
        -- upvalues: l_v1132_4 (ref)
        l_v1132_4();
    end;
    v1149 = nil;
    local function v1360(v1358)
        -- upvalues: l_v1132_4 (ref), l_v1143_2 (ref), l_v1136_2 (ref)
        local v1359 = v1358:get();
        if not v1359 then
            l_v1132_4();
        end;
        events.shutdown(l_v1143_2, v1359);
        events.pre_render(l_v1136_2, v1359);
    end;
    l_v1129_4.enabled:set_callback(v1360, true);
end;
v1129 = nil;
v1130 = v42.other.visuals.keep_transparency;
v1131 = function(_)
    local v1362 = entity.get_local_player();
    if v1362 == nil then
        return;
    else
        local l_m_bIsScoped_1 = v1362.m_bIsScoped;
        local l_m_bResumeZoom_0 = v1362.m_bResumeZoom;
        if not l_m_bIsScoped_1 and not l_m_bResumeZoom_0 then
            return;
        else
            return 59;
        end;
    end;
end;
v1132 = nil;
do
    local l_v1131_5 = v1131;
    v1133 = function(v1366)
        -- upvalues: l_v1131_5 (ref)
        events.localplayer_transparency(l_v1131_5, v1366:get());
    end;
    v1130.enabled:set_callback(v1133, true);
end;
v1130 = nil;
v1131 = v42.other.visuals.remove_footsteps_shadow;
v1132 = cvar.cl_foot_contact_shadows;
do
    local l_v1132_5, l_v1133_3, l_v1136_3, l_v1143_3 = v1132, v1133, v1136, v1143;
    l_v1133_3 = function()
        -- upvalues: l_v1132_5 (ref)
        l_v1132_5:int(0, true);
    end;
    l_v1136_3 = function()
        -- upvalues: l_v1132_5 (ref)
        l_v1132_5:int(tonumber(l_v1132_5:string()), true);
    end;
    l_v1143_3 = function()
        -- upvalues: l_v1136_3 (ref)
        l_v1136_3();
    end;
    v1149 = nil;
    local function v1373(v1371)
        -- upvalues: l_v1133_3 (ref), l_v1136_3 (ref), l_v1143_3 (ref)
        local v1372 = v1371:get();
        if v1372 then
            l_v1133_3();
        else
            l_v1136_3();
        end;
        events.shutdown(l_v1143_3, v1372);
    end;
    v1131.enabled:set_callback(v1373, true);
end;
v386 = nil;
v387 = nil;
v388 = v42.other.misc.avoid_collisions;
l_angles_1 = function(v1374)
    local v1375 = entity.get_local_player();
    if v1375 == nil then
        return;
    else
        local l_m_fFlags_2 = v1375.m_fFlags;
        if bit.band(l_m_fFlags_2, 1) == 1 then
            return;
        elseif v1374.in_duck or v1374.in_speed then
            return;
        else
            local v1377 = render.camera_angles();
            local l_m_vecOrigin_4 = v1375.m_vecOrigin;
            local l_m_vecVelocity_3 = v1375.m_vecVelocity;
            l_m_vecVelocity_3.z = 0;
            local l_m_vecMins_2 = v1375.m_vecMins;
            local l_m_vecMaxs_2 = v1375.m_vecMaxs;
            local v1382 = vector():angles(0, v1377.y);
            local v1383 = v1382:vectors();
            local v1384 = vector(v1382.x * v1374.forwardmove + v1383.x * v1374.sidemove, v1382.y * v1374.forwardmove + v1383.y * v1374.sidemove);
            v1384:normalize();
            local v1385 = l_m_vecOrigin_4 + v1384 * 8;
            local v1386 = utils.trace_hull(l_m_vecOrigin_4, v1385, l_m_vecMins_2, l_m_vecMaxs_2, entity.get_players(), 33636363, 0);
            if v1386.entity == nil or not v1386:did_hit_world() or bit.band(v1386.contents, 536870912) ~= 0 then
                return;
            else
                local v1387 = l_m_vecVelocity_3:normalized();
                if v1387:dot(v1384) <= 0 then
                    return;
                else
                    local l_normal_0 = v1386.plane.normal;
                    if math.abs(l_normal_0.z) >= 0.1 then
                        return;
                    else
                        if v1387:dot(l_normal_0) < -0.85 then
                            v1387 = v1384;
                        end;
                        local v1389 = l_normal_0:vectors();
                        if v1389:dot(v1387) < 0 then
                            v1389 = v1389 * -1;
                        end;
                        v1374.move_yaw = math.deg(math.atan2(v1389.y, v1389.x));
                        v1374.forwardmove = 450;
                        v1374.sidemove = 0;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v391 = nil;
do
    local l_l_angles_1_9 = l_angles_1;
    v393 = function(v1391)
        -- upvalues: l_l_angles_1_9 (ref)
        events.createmove(l_l_angles_1_9, v1391:get());
    end;
    v388.enabled:set_callback(v393, true);
end;
v388 = nil;
l_angles_1 = v42.other.misc.collision_air_duck;
v391 = function(v1392, v1393)
    if v1393.m_MoveType == 9 or v1393.m_MoveType == 8 then
        return false;
    elseif v1392.in_duck then
        return false;
    elseif bit.band(v1393.m_fFlags, bit.lshift(1, 0)) ~= 0 then
        return false;
    else
        return true;
    end;
end;
do
    local l_v391_10, l_v393_10 = v391, v393;
    l_v393_10 = function(v1396)
        -- upvalues: l_v391_10 (ref)
        local v1397 = entity.get_local_player();
        if v1397 == nil then
            return;
        elseif not l_v391_10(v1396, v1397) then
            return;
        else
            local v1398 = v1397:simulate_movement();
            v1398:think(1);
            v1396.in_duck = true;
            local v1399 = bit.band(v1398.flags, bit.lshift(1, 0)) == 0 and v1398.did_hit_collision;
            v1398:think(1);
            v1396.in_duck = false;
            local v1400 = bit.band(v1398.flags, bit.lshift(1, 0)) == 0 and v1398.did_hit_collision;
            if not v1399 and v1400 then
                v1396.in_duck = true;
            end;
            return;
        end;
    end;
    v394 = nil;
    v959 = function(v1401)
        -- upvalues: l_v393_10 (ref)
        events.createmove(l_v393_10, v1401:get());
    end;
    l_angles_1.enabled:set_callback(v959, true);
end;
l_angles_1 = nil;
v391 = v42.other.misc.fast_ladder;
v393 = 9;
v394 = function(v1402)
    local l_x_0 = render.camera_angles().x;
    if v1402.forwardmove > 0 and l_x_0 < 45 then
        v1402.view_angles.x = 89;
        v1402.in_moveright = 1;
        v1402.in_moveleft = 0;
        v1402.in_forward = 0;
        v1402.in_back = 1;
        if v1402.sidemove == 0 then
            v1402.view_angles.y = v1402.view_angles.y + 90;
        end;
        if v1402.sidemove < 0 then
            v1402.view_angles.y = v1402.view_angles.y + 150;
        end;
        if v1402.sidemove > 0 then
            v1402.view_angles.y = v1402.view_angles.y + 30;
        end;
    end;
    if v1402.forwardmove < 0 then
        v1402.view_angles.x = 89;
        v1402.in_moveleft = 1;
        v1402.in_moveright = 0;
        v1402.in_forward = 1;
        v1402.in_back = 0;
        if v1402.sidemove == 0 then
            v1402.view_angles.y = v1402.view_angles.y + 90;
        end;
        if v1402.sidemove > 0 then
            v1402.view_angles.y = v1402.view_angles.y + 150;
        end;
        if v1402.sidemove < 0 then
            v1402.view_angles.y = v1402.view_angles.y + 30;
        end;
    end;
end;
do
    local l_v393_11, l_v394_8, l_v959_5 = v393, v394, v959;
    l_v959_5 = function(v1407)
        -- upvalues: l_v393_11 (ref), l_v394_8 (ref)
        local v1408 = entity.get_local_player();
        if v1408 == nil then
            return;
        elseif v1408.m_MoveType ~= l_v393_11 then
            return;
        else
            l_v394_8(v1407);
            return;
        end;
    end;
    v960 = nil;
    v961 = function(v1409)
        -- upvalues: l_v959_5 (ref)
        events.createmove(l_v959_5, v1409:get());
    end;
    v391.enabled:set_callback(v961, true);
end;
v391 = nil;
v393 = v42.other.misc.edge_stop;
v394 = function(v1410)
    local v1411 = entity.get_local_player();
    if v1411 == nil then
        return;
    else
        local v1412 = v1411:simulate_movement();
        v1412:think(5);
        if v1412.velocity.z < 0 then
            v1410.block_movement = 2;
        end;
        return;
    end;
end;
v959 = nil;
do
    local l_v394_9 = v394;
    v960 = function(v1414)
        -- upvalues: l_v394_9 (ref)
        events.createmove(l_v394_9, v1414:get());
    end;
    v393.enabled:set_callback(v960, true);
end;
v393 = nil;
v394 = v42.other.misc.no_fall_damage;
v959 = false;
v960 = math.pi * 2;
v961 = v960 / 8;
do
    local l_v959_6, l_v960_5, l_v961_7, l_v962_7, l_v963_5 = v959, v960, v961, v962, v963;
    l_v962_7 = function(v1420, v1421)
        -- upvalues: l_v960_5 (ref), l_v961_7 (ref)
        local v1422 = v1420:get_origin();
        for v1423 = 0, l_v960_5, l_v961_7 do
            local v1424 = math.sin(v1423);
            local v1425 = math.cos(v1423);
            local v1426 = v1422.x + v1425 * 10;
            local v1427 = v1422.y + v1424 * 10;
            local v1428 = vector(v1426, v1427, v1422.z);
            local v1429 = v1428:clone();
            v1429.z = v1429.z - v1421;
            if utils.trace_line(v1428, v1429, v1420).fraction ~= 1 then
                return true;
            end;
        end;
        return false;
    end;
    l_v963_5 = function(v1430)
        -- upvalues: l_v959_6 (ref), l_v962_7 (ref)
        local v1431 = entity.get_local_player();
        if v1431 == nil then
            return;
        elseif v1431.m_vecVelocity.z >= -500 then
            l_v959_6 = false;
            return;
        else
            if l_v962_7(v1431, 15) then
                l_v959_6 = false;
            elseif l_v962_7(v1431, 75) then
                l_v959_6 = true;
            end;
            v1430.in_duck = l_v959_6;
            return;
        end;
    end;
    v969 = nil;
    v975 = function(v1432)
        -- upvalues: l_v963_5 (ref)
        events.createmove(l_v963_5, v1432:get());
    end;
    v394.enabled:set_callback(v975, true);
end;
v394 = nil;
v959 = v42.other.misc.unlock_fd_speed;
v960 = 5;
do
    local l_v960_6, l_v961_8 = v960, v961;
    l_v961_8 = function(v1435)
        -- upvalues: v18 (ref), l_v960_6 (ref)
        if not v18.antiaim.misc.fake_duck:get() then
            return;
        elseif entity.get_local_player() == nil then
            return;
        else
            local l_forwardmove_0 = v1435.forwardmove;
            local l_sidemove_0 = v1435.sidemove;
            if math.abs(l_forwardmove_0) > l_v960_6 or math.abs(l_sidemove_0) > l_v960_6 then
                local v1438 = 450 / (l_forwardmove_0 * l_forwardmove_0 + l_sidemove_0 * l_sidemove_0) ^ 0.5;
                v1435.forwardmove = l_forwardmove_0 * v1438;
                v1435.sidemove = l_sidemove_0 * v1438;
            end;
            return;
        end;
    end;
    v962 = nil;
    v963 = function(v1439)
        -- upvalues: l_v961_8 (ref)
        events.createmove_run(l_v961_8, v1439:get());
    end;
    v959.enabled:set_callback(v963, true);
end;
v959 = nil;
v960 = v42.other.misc.super_toss;
v961 = 0.3;
v962 = function(v1440, v1441, v1442)
    return v1440 + v1442 * (v1441 - v1440);
end;
do
    local l_v961_9, l_v962_8, l_v963_6, l_v969_6, l_v975_7 = v961, v962, v963, v969, v975;
    l_v963_6 = function(v1448, v1449, v1450, v1451)
        -- upvalues: l_v962_8 (ref), l_v961_9 (ref)
        v1448.x = v1448.x - 10 + math.abs(v1448.x) / 9;
        local v1452 = vector():angles(v1448);
        local v1453 = v1451 * 1.25;
        local v1454 = math.clamp(v1449 * 0.9, 15, 750);
        local v1455 = math.clamp(v1450, 0, 1);
        v1454 = v1454 * l_v962_8(l_v961_9, 1, v1455);
        local l_v1452_0 = v1452;
        for _ = 1, 8 do
            l_v1452_0 = (v1452 * (l_v1452_0 * v1454 + v1453):length() - v1453) / v1454;
            l_v1452_0:normalize();
        end;
        local v1458 = l_v1452_0.angles(l_v1452_0);
        if v1458.x > -10 then
            v1458.x = 0.9 * v1458.x + 9;
        else
            v1458.x = 1.125 * v1458.x + 11.25;
        end;
        return v1458;
    end;
    l_v969_6 = function(v1459)
        -- upvalues: l_v963_6 (ref)
        local v1460 = entity.get_local_player();
        if v1460 == nil then
            return;
        else
            local v1461 = v1460:get_player_weapon();
            if v1461 == nil then
                return;
            else
                local v1462 = v1461:get_weapon_info();
                if v1462 == nil then
                    return;
                else
                    v1459.angles = l_v963_6(v1459.angles, v1462.throw_velocity, v1461.m_flThrowStrength, v1459.velocity);
                    return;
                end;
            end;
        end;
    end;
    l_v975_7 = function(v1463)
        -- upvalues: l_v963_6 (ref)
        if v1463.jitter_move ~= true then
            return;
        else
            local v1464 = entity.get_local_player();
            if v1464 == nil then
                return;
            else
                local v1465 = v1464:get_player_weapon();
                if v1465 == nil then
                    return;
                else
                    local v1466 = v1465:get_weapon_info();
                    if v1466 == nil or v1466.weapon_type ~= 9 then
                        return;
                    elseif v1465.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                        return;
                    else
                        v1463.in_speed = true;
                        local v1467 = v1464:simulate_movement();
                        v1467:think();
                        v1463.view_angles = l_v963_6(v1463.view_angles, v1466.throw_velocity, v1465.m_flThrowStrength, v1467.velocity);
                        return;
                    end;
                end;
            end;
        end;
    end;
    v1129 = nil;
    v1130 = function(v1468)
        -- upvalues: l_v975_7 (ref), l_v969_6 (ref)
        local v1469 = v1468:get();
        events.createmove(l_v975_7, v1469);
        events.grenade_override_view(l_v969_6, v1469);
    end;
    v960.enabled:set_callback(v1130, true);
end;
v960 = nil;
v961 = v42.other.misc.trashtalk;
v962 = {
    [1] = "@target buy eternal.codes to get better", 
    [2] = "@target, maybe if you used eternal.codes, you wouldn't be dying so often.", 
    [3] = "@target, eternal.codes could save you from being such an easy target.", 
    [4] = "@target, without eternal.codes, no wonder you're always the first to die.", 
    [5] = "@target, you might actually survive a match if you tried eternal.codes.", 
    [6] = "@target, eternal.codes might be the only thing that can save you from your noob status.", 
    [7] = "@target, eternal.codes could help you stop being the team's dead weight.", 
    [8] = "@target, maybe eternal.codes will teach you how to play properly.", 
    [9] = "@target, if you had eternal.codes, you wouldn't be dying like a beginner.", 
    [10] = "@target, eternal.codes could finally give you a fighting chance.", 
    [11] = "@target, eternal.codes might prevent you from embarrassing yourself in-game.", 
    [12] = "@target, try eternal.codes and stop being the team's liability.", 
    [13] = "@target, maybe eternal.codes will help you get a kill for once.", 
    [14] = "@target, eternal.codes could be the answer to your constant deaths.", 
    [15] = "@target, use eternal.codes and see if you can survive longer than two minutes.", 
    [16] = "@target, eternal.codes might turn you from cannon fodder to a real player.", 
    [17] = "@target, without eternal.codes, you're just an easy kill.", 
    [18] = "@target, eternal.codes could help you stop being the laughing stock of the game.", 
    [19] = "@target, maybe eternal.codes can teach you how not to die every round.", 
    [20] = "@target, if you had eternal.codes, you might actually contribute to the team.", 
    [21] = "@target, eternal.codes could make you less of a burden on your teammates."
};
do
    local l_v961_10, l_v962_9, l_v963_7 = v961, v962, v963;
    l_v963_7 = function(v1473)
        -- upvalues: l_v961_10 (ref), l_v962_9 (ref)
        local v1474 = entity.get_local_player();
        local v1475 = entity.get(v1473.userid, true);
        local v1476 = entity.get(v1473.attacker, true);
        if v1474 == v1475 or v1474 ~= v1476 then
            return;
        else
            local v1477 = l_v961_10.delay:get() * 0.1;
            local v1478 = l_v962_9[utils.random_int(1, #l_v962_9)]:gsub("@target", v1475:get_name());
            utils.execute_after(v1477, function()
                -- upvalues: v1478 (ref)
                utils.console_exec("say " .. v1478);
            end);
            return;
        end;
    end;
    v969 = nil;
    v975 = function(v1479)
        -- upvalues: l_v963_7 (ref)
        events.player_death(l_v963_7, v1479:get());
    end;
    l_v961_10.enabled:set_callback(v975, true);
end;
v961 = nil;
v962 = v42.other.misc.clantag;
v963 = {
    [1] = "", 
    [2] = "e", 
    [3] = "et", 
    [4] = "ete", 
    [5] = "eter", 
    [6] = "etern", 
    [7] = "eterna", 
    [8] = "eternal", 
    [9] = "eternal.", 
    [10] = "eternal.c", 
    [11] = "eternal.co", 
    [12] = "eternal.cod", 
    [13] = "eternal.code", 
    [14] = "eternal.codes", 
    [15] = "eternal.codes", 
    [16] = "eternal.codes", 
    [17] = "eternal.codes", 
    [18] = "eternal.codes", 
    [19] = "eternal.codes", 
    [20] = "ternal.codes", 
    [21] = "ernal.codes", 
    [22] = "rnal.codes", 
    [23] = "nal.codes", 
    [24] = "al.codes", 
    [25] = "l.codes", 
    [26] = ".codes", 
    [27] = "codes", 
    [28] = "odes", 
    [29] = "des", 
    [30] = "des", 
    [31] = "es", 
    [32] = "s", 
    [33] = ""
};
v969 = cvar.cl_clanid;
v975 = nil;
do
    local l_v963_8, l_v969_7, l_v975_8, l_v1129_5, l_v1130_5, l_v1131_6 = v963, v969, v975, v1129, v1130, v1131;
    l_v1129_5 = function(v1486)
        -- upvalues: l_v975_8 (ref)
        if v1486 ~= l_v975_8 then
            common.set_clan_tag(v1486 or "");
            l_v975_8 = v1486;
        end;
    end;
    l_v1130_5 = function(_)
        -- upvalues: l_v963_8 (ref), l_v1129_5 (ref)
        local v1488 = utils.net_channel();
        if v1488 == nil then
            return;
        else
            local l_tickcount_0 = globals.tickcount;
            local v1490 = to_ticks(v1488.latency[0]);
            local v1491 = math.floor((l_tickcount_0 + v1490) * 0.0625) % #l_v963_8 + 1;
            l_v1129_5(l_v963_8[v1491]);
            return;
        end;
    end;
    l_v1131_6 = function()
        -- upvalues: l_v1129_5 (ref), l_v969_7 (ref)
        l_v1129_5("");
        l_v969_7:call(l_v969_7:string());
    end;
    v1132 = nil;
    v1133 = function(v1492)
        -- upvalues: l_v1129_5 (ref), l_v969_7 (ref), l_v1131_6 (ref), l_v1130_5 (ref)
        local v1493 = v1492:get();
        if not v1493 then
            l_v1129_5("");
            l_v969_7:call(l_v969_7:string());
        end;
        events.shutdown(l_v1131_6, v1493);
        events.net_update_end(l_v1130_5, v1493);
    end;
    v962.enabled:set_callback(v1133, true);
end;
v374 = nil;
ui.sidebar(v8.name, "hourglass");