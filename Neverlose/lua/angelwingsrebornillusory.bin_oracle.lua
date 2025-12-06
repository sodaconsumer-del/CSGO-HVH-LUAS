local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
if not _IS_MARKET or not function()

end then
    local _ = require("neverlose/inspect");
end;
local v3 = "\226\128\138";
local function v7(v4, v5)
    for v6 = 1, #v4 do
        if v4[v6] == v5 then
            return v6;
        end;
    end;
    return nil;
end;
local function v10(...)
    local v8 = "";
    for v9 = 1, select("#", ...) do
        v8 = v8 .. select(v9, ...);
    end;
    return v8;
end;
local function v12(v11)
    return math.floor(v11 + 0.5);
end;
local v13 = {};
local v14 = common.get_username();
v13.name = "angelwings";
v13.user = v14;
v13.build = "illusory";
v14 = nil;
v14 = {
    lerp = function(v15, v16, v17)
        return v15 + v17 * (v16 - v15);
    end, 
    closest_ray_point = function(v18, v19, v20, v21)
        local v22 = v20 - v18;
        local v23 = v19 - v18;
        local v24 = v23.x * v23.x + v23.y * v23.y;
        local v25 = (v22.x * v23.x + v22.y * v23.y) / v24;
        if v21 then
            if v25 <= 0 then
                return v18;
            elseif v25 >= 1 then
                return v19;
            end;
        end;
        return v18 + v25 * v23;
    end
};
local v26 = nil;
v26 = {
    antiaim = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
            }, 
            yaw_modifier = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
            }, 
            body_yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            freestanding = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            extended_angles = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
            }
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    ragebot = {
        main = {
            peek_assist = {
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
                {
                    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style")
                }, 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
            }, 
            hide_shots = {
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
            }, 
            double_tap = {
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
            }
        }, 
        selection = {
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
        }
    }
};
local v27 = nil;
v27 = {};
local v28 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ");
local v29 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ");
local v30 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", v28, v28, v28, v28));
local v31 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", v28, v28));
local v32 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", v28, v28, v28, v28, v29, v29);
do
    local l_v28_0, l_v29_0, l_v30_0, l_v31_0, l_v32_0 = v28, v29, v30, v31, v32;
    v27.box = function(v38, v39, v40, v41, v42, v43, v44, v45, v46)
        -- upvalues: l_v28_0 (ref), l_v30_0 (ref)
        v38 = l_v28_0(v38:unpack());
        v39 = l_v28_0(v39:unpack());
        v40 = l_v28_0(v40:unpack());
        v41 = l_v28_0(v41:unpack());
        l_v30_0(v38, v39, v40, v41, v42, v43, v44, v45, v46);
    end;
    v27.line = function(v47, v48, v49, v50, v51)
        -- upvalues: l_v28_0 (ref), l_v31_0 (ref)
        v47 = l_v28_0(v47:unpack());
        v48 = l_v28_0(v48:unpack());
        l_v31_0(v47, v48, v49.r, v49.g, v49.b, v49.a, v50, v51);
    end;
    v27.box_new = function(v52, v53, v54, v55, v56, v57, v58)
        -- upvalues: l_v28_0 (ref), l_v29_0 (ref), l_v32_0 (ref)
        v52 = l_v28_0(v52:unpack());
        v53 = l_v28_0(v53:unpack());
        v54 = l_v28_0(v54:unpack());
        v55 = l_v28_0(v55:unpack());
        v56 = l_v29_0(v56:unpack());
        v57 = l_v29_0(v57:unpack());
        l_v32_0(v52, v53, v54, v55, v56, v57, v58);
    end;
end;
v28 = nil;
v28 = {};
v29 = {};
v29.__index = v29;
v29.new = function(v59)
    return setmetatable({
        count = 0, 
        list = {}
    }, v59);
end;
v29.__len = function(v60)
    return v60.count;
end;
v29.__call = function(v61, v62, v63)
    if v63 == false then
        return v61:unset(v62);
    else
        return v61:set(v62);
    end;
end;
v29.unset = function(v64, v65)
    -- upvalues: v7 (ref)
    local v66 = v7(v64.list, v65);
    if v66 ~= nil then
        v64.count = v64.count - 1;
        table.remove(v64.list, v66);
    end;
    return v64;
end;
v29.set = function(v67, v68, v69)
    -- upvalues: v7 (ref)
    if v69 == false then
        return v67:unset(v68);
    else
        if not v7(v67.list, v68) then
            v67.count = v67.count + 1;
            table.insert(v67.list, v68);
        end;
        return v67;
    end;
end;
v29.fire = function(v70, ...)
    local l_list_0 = v70.list;
    for v72 = 1, #l_list_0 do
        l_list_0[v72](...);
    end;
    return v70;
end;
v30 = {};
do
    local l_v29_1, l_v30_1 = v29, v30;
    v31 = function(v75, v76)
        -- upvalues: l_v29_1 (ref)
        local v77 = rawget(v75, v76);
        if v77 == nil then
            v77 = l_v29_1:new();
            rawset(v75, v76, v77);
        end;
        return v77;
    end;
    do
        local l_v31_1 = v31;
        l_v30_1.new = function(_)
            -- upvalues: l_v31_1 (ref)
            return setmetatable({}, {
                __index = l_v31_1
            });
        end;
    end;
    v28.new = function(_)
        -- upvalues: l_v30_1 (ref)
        return l_v30_1:new();
    end;
end;
v29 = nil;
v29 = {};
v30 = bit.lshift(1, 0);
v31 = {};
v31.__index = v31;
v31.__newindex = function(v81, v82, v83)
    v81[0][v82] = v83;
end;
do
    local l_v30_2, l_v31_2 = v30, v31;
    l_v31_2.__index = function(v86, v87)
        -- upvalues: l_v31_2 (ref), l_v30_2 (ref)
        local v88 = rawget(l_v31_2, v87);
        if v88 ~= nil then
            return v88;
        else
            local v89 = rawget(v86, v87);
            if v89 ~= nil then
                return v89;
            else
                local v90 = v86[0][v87];
                if v90 == nil then
                    return nil;
                elseif type(v90) == "function" then
                    local function v94(...)
                        -- upvalues: v86 (ref), l_v30_2 (ref), v90 (ref)
                        local v91 = {};
                        local v92 = select("#", ...);
                        for v93 = 1, v92 do
                            v91[v93] = select(v93, ...);
                        end;
                        if bit.band(v86.flags, l_v30_2) ~= 0 then
                            v86:fire_callbacks(v91, v92);
                        end;
                        if v91[1] == v86 then
                            v91[1] = v86[0];
                        end;
                        return v90(unpack(v91, 1, v92));
                    end;
                    rawset(v86, v87, v94);
                    return v94;
                else
                    return v90;
                end;
            end;
        end;
    end;
    l_v31_2.new = function(v95, v96)
        -- upvalues: l_v30_2 (ref)
        local v97 = {
            flags = 0, 
            [0] = v96, 
            callbacks = {}
        };
        v97.flags = bit.bor(v97.flags, l_v30_2);
        return setmetatable(v97, v95);
    end;
    l_v31_2.fire_callbacks = function(v98, ...)
        local v99 = rawget(v98, "callbacks");
        for v100 = 1, #v99 do
            v99[v100](...);
        end;
        return v98;
    end;
    l_v31_2.get_flag = function(v101, v102)
        return bit.band(v101.flags, v102) ~= 0;
    end;
    l_v31_2.set_flag = function(v103, v104, v105)
        if v105 then
            v103.flags = bit.bor(v103.flags, v104);
        else
            v103.flags = bit.band(v103.flags, bit.bnot(v104));
        end;
        return v103;
    end;
    l_v31_2.set_callback = function(v106, v107)
        -- upvalues: v7 (ref)
        local v108 = rawget(v106, "callbacks");
        if v7(v108, v107) == nil then
            table.insert(v108, v107);
        end;
        return v106;
    end;
    l_v31_2.unset_callback = function(v109, v110)
        -- upvalues: v7 (ref)
        local v111 = rawget(v109, "callbacks");
        local v112 = v7(v111, v110);
        if v112 ~= nil then
            table.remove(v111, v112);
        end;
        return v109;
    end;
    v29.group_flags = {
        callbacks = l_v30_2
    };
    v29.cast = function(v113)
        -- upvalues: l_v31_2 (ref)
        return l_v31_2:new(v113);
    end;
    v29.create = function(...)
        -- upvalues: l_v31_2 (ref)
        return l_v31_2:new(ui.create(...));
    end;
end;
v30 = nil;
v30 = {};
v31 = "ui\\beepclear.wav";
v32 = "resource\\warning.wav";
local l_play_0 = cvar.play;
local function v119(v115, v116)
    -- upvalues: v13 (ref)
    local v117 = " \194\183 ";
    local v118 = string.format("\a%s[%s]\aDEFAULT", v115:to_hex(), v13.name);
    print_raw(v118 .. v117 .. v116);
end;
do
    local l_v31_3, l_v32_1, l_l_play_0_0, l_v119_0 = v31, v32, l_play_0, v119;
    v30.log = function(v124)
        -- upvalues: l_v119_0 (ref)
        l_v119_0(color(255, 255, 255, 200), v124);
    end;
    v30.success = function(v125)
        -- upvalues: l_v119_0 (ref), l_l_play_0_0 (ref), l_v31_3 (ref)
        l_v119_0(color(250, 137, 250, 255), v125);
        l_l_play_0_0:call(l_v31_3);
    end;
    v30.error = function(v126)
        -- upvalues: l_v119_0 (ref), l_l_play_0_0 (ref), l_v32_1 (ref)
        l_v119_0(color(250, 0, 50, 255), v126);
        l_l_play_0_0:call(l_v32_1);
    end;
end;
v31 = nil;
v31 = {};
v32 = {};
do
    local l_v32_2 = v32;
    v31.get = function()
        -- upvalues: l_v32_2 (ref)
        return l_v32_2;
    end;
    v31.add = function(v128, v129, v130)
        -- upvalues: l_v32_2 (ref)
        l_v32_2[v128] = {
            [1] = v129, 
            [2] = v130
        };
    end;
end;
v32 = nil;
v32 = {};
l_play_0 = function(v131, v132, v133, v134)
    return v133 * v131 / v134 + v132;
end;
v119 = function()
    return globals.frametime;
end;
local function v141(v135, v136, v137, v138, v139)
    if v138 <= 0 then
        return v137;
    elseif v139 <= v138 then
        return v137;
    else
        v136 = v135(v138, v136, v137 - v136, v139);
        if type(v136) == "number" then
            if math.abs(v137 - v136) < 0.001 then
                return v137;
            else
                local v140 = v136 % 1;
                if v140 < 0.001 then
                    return math.floor(v136);
                elseif v140 > 0.999 then
                    return math.ceil(v136);
                end;
            end;
        end;
        return v136;
    end;
end;
do
    local l_l_play_0_1, l_v119_1, l_v141_0 = l_play_0, v119, v141;
    v32.interp = function(v145, v146, v147, v148)
        -- upvalues: l_l_play_0_1 (ref), l_v141_0 (ref), l_v119_1 (ref)
        if not v148 then
            v148 = l_l_play_0_1;
        end;
        if type(v146) == "boolean" then
            v146 = v146 and 1 or 0;
        end;
        return l_v141_0(v148, v145, v146, l_v119_1(), v147);
    end;
end;
l_play_0 = nil;
v119 = _G.render;
v141 = math.floor;
local v149 = color(0, 0, 0, 0);
local v150 = 1;
local v151 = "s";
do
    local l_v119_2, l_v149_0, l_v150_0 = v119, v149, v150;
    local function v156(v155)
        -- upvalues: l_v150_0 (ref)
        if l_v150_0 == 1 then
            return v155;
        else
            return v155 * l_v150_0;
        end;
    end;
    local v157 = 1;
    local v158 = {};
    local l_alpha_modulate_0 = color().alpha_modulate;
    local function v162(v160, v161)
        -- upvalues: v157 (ref), l_v149_0 (ref), l_alpha_modulate_0 (ref)
        if v157 == 1 then
            return v160;
        elseif not v161 and v157 == 0 then
            return l_v149_0;
        else
            return l_alpha_modulate_0(v160, v157, true);
        end;
    end;
    l_play_0 = setmetatable({
        cheap = false, 
        dpi = l_v119_2.get_scale(2), 
        push_alpha = function(v163)
            -- upvalues: v158 (ref), v157 (ref)
            local v164 = #v158;
            if v164 > 255 then
                error("alpha stack exceeded 255 objects, report to developers");
            end;
            v158[v164 + 1] = v163;
            v157 = v157 * v158[v164 + 1] * (v158[v164] or 1);
        end, 
        pop_alpha = function()
            -- upvalues: v158 (ref), v157 (ref)
            local v165 = #v158;
            local l_v158_0 = v158;
            local l_v165_0 = v165;
            local v168 = nil;
            v165 = v165 - 1;
            l_v158_0[l_v165_0] = v168;
            v157 = v165 == 0 and 1 or v158[v165] * (v158[v165 - 1] or 1);
        end, 
        get_alpha = function(v169)
            -- upvalues: v158 (ref), v157 (ref)
            if v169 then
                return v158[v169];
            else
                return v157, #v158;
            end;
        end, 
        screen_size = function(v170)
            -- upvalues: l_v119_2 (ref), l_v150_0 (ref)
            return l_v119_2.screen_size() / (v170 and 1 or l_v150_0);
        end, 
        measure_text = function(v171, ...)
            -- upvalues: l_v119_2 (ref), l_v150_0 (ref)
            return l_v119_2.measure_text(v171, ...) / l_v150_0;
        end, 
        load_font = function(v172, v173, v174)
            -- upvalues: l_v119_2 (ref)
            return l_v119_2.load_font(v172, v173, v174 or "");
        end, 
        text = function(v175, v176, v177, v178, ...)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref), l_play_0 (ref)
            l_v119_2.text(v175, v156(v176), v162(v177), v178, ...);
            if measure == true then
                return l_play_0.measure_text(v175, v178, ...);
            else
                return;
            end;
        end, 
        blur = function(v179, v180, v181, v182, v183)
            -- upvalues: l_play_0 (ref), v156 (ref), v157 (ref), l_v119_2 (ref)
            if l_play_0.cheap then
                return;
            else
                if type(v183) == "table" then
                    for v184 = 1, 4 do
                        v183[v184] = v156(v183[v184] or 0);
                    end;
                else
                    v183 = v156(v183 or 0);
                end;
                local v185 = (v182 or 1) * v157;
                v181 = v156(v181 or 2);
                v182 = v185;
                if v182 > 0 and v181 > 0 then
                    l_v119_2.blur(v156(v179), v156(v180), v181, v182, v183);
                end;
                return;
            end;
        end, 
        shadow = function(v186, v187, v188, v189, v190, v191)
            -- upvalues: l_play_0 (ref), l_v119_2 (ref), v156 (ref), v162 (ref)
            if l_play_0.cheap then
                return;
            else
                l_v119_2.shadow(v156(v186), v156(v187), v162(v188), v156(v189 or 16), v156(v190 or 0), v156(v191 or 0));
                return;
            end;
        end, 
        line = function(v192, v193, v194)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref)
            l_v119_2.line(v156(v192), v156(v193), v162(v194));
        end, 
        rect = function(v195, v196, v197, v198, v199)
            -- upvalues: v156 (ref), l_v119_2 (ref), v162 (ref)
            if type(v198) == "table" then
                for v200 = 1, 4 do
                    v198[v200] = v156(v198[v200] or 0);
                end;
            else
                v198 = v156(v198 or 0);
            end;
            l_v119_2.rect(v156(v195), v156(v196), v162(v197), v198, v199 or false);
        end, 
        rect_outline = function(v201, v202, v203, v204, v205, v206)
            -- upvalues: v156 (ref), l_v119_2 (ref), v162 (ref)
            if type(v205) == "table" then
                for v207 = 1, 4 do
                    v205[v207] = v156(v205[v207] or 0);
                end;
            else
                v205 = v156(v205 or 0);
            end;
            l_v119_2.rect_outline(v156(v201), v156(v202), v162(v203), v156(v204 or 0), v205, v206 or false);
        end, 
        gradient = function(v208, v209, v210, v211, v212, v213, v214)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref)
            local v215 = v212 or v210;
            if not v213 then
                v213 = v211;
            end;
            l_v119_2.gradient(v156(v208), v156(v209), v162(v210, true), v162(v211, true), v162(v215, true), v162(v213, true), v214 or 0);
        end, 
        circle = function(v216, v217, v218, v219, v220)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref)
            l_v119_2.circle(v156(v216), v162(v217), v156(v218), v219 or 0, v220 or 1);
        end, 
        circle_outline = function(v221, v222, v223, v224, v225, v226)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref)
            l_v119_2.circle_outline(v156(v221), v162(v222), v156(v223), v224 or 0, v225 or 1, v156(v226 or 1));
        end, 
        circle_3d = function(v227, v228, v229, v230, v231)
            -- upvalues: l_v119_2 (ref), v162 (ref)
            l_v119_2.circle_3d(v227, v162(v228), v229, v230 or 0, v231 or 1, false);
        end, 
        circle_3d_outline = function(v232, v233, v234, v235, v236, v237)
            -- upvalues: l_v119_2 (ref), v162 (ref), v156 (ref)
            l_v119_2.circle_3d_outline(v232, v162(v233), v234, v235 or 0, v236 or 1, v156(v237 or 1));
        end, 
        circle_3d_gradient = function(v238, v239, v240, v241, v242, v243, v244)
            -- upvalues: l_v119_2 (ref), v162 (ref), v156 (ref)
            l_v119_2.circle_3d_gradient(v238, v162(v239), v162(v240), v241, v242 or 0, v243 or 1, v156(v244 or 1));
        end, 
        texture = function(v245, v246, v247, v248, v249, v250)
            -- upvalues: l_v119_2 (ref), v156 (ref), v162 (ref)
            if not v245 then
                return;
            else
                if not v248 then
                    v248 = color();
                end;
                l_v119_2.texture(v245, v156(v246), v156(v247 or vector(v245.width, v245.height)), v162(v248), v249 or "", v250 or 0);
                return;
            end;
        end, 
        push_clip_rect = function(v251, v252, v253)
            -- upvalues: l_v119_2 (ref), v156 (ref)
            l_v119_2.push_clip_rect(v156(v251), v156(v252), v253 or false);
        end
    }, {
        __index = l_v119_2
    });
end;
v119 = nil;
v141 = {};
v149 = nil;
v150 = color(255, 255, 255, 255);
v151 = function(v254, v255, v256)
    return v254.x >= v255.x and v254.x <= v256.x and v254.y >= v255.y and v254.y <= v256.y;
end;
local v257 = v29.create("##DRAG");
v257:visibility(false);
local v258 = l_play_0.screen_size();
do
    local l_v149_1, l_v150_1, l_v151_0, l_v257_0, l_v258_0 = v149, v150, v151, v257, v258;
    v119 = {
        data = v141, 
        in_bounds = l_v151_0, 
        new = function(v264, v265)
            -- upvalues: v119 (ref), l_v257_0 (ref), l_v258_0 (ref), v12 (ref)
            if type(v265) ~= "table" then
                v265 = {};
            end;
            v119[v264.id] = {
                x = l_v257_0:slider(v264.id .. "::x", 0, 10000, v264.pos.x / l_v258_0.x * 10000), 
                y = l_v257_0:slider(v264.id .. "::y", 0, 10000, v264.pos.y / l_v258_0.y * 10000)
            };
            v119[v264.id].x:set_callback(function(v266)
                -- upvalues: v264 (ref), v12 (ref), l_v258_0 (ref)
                v264.pos.x = v12(v266:get() * 1.0E-4 * l_v258_0.x);
            end, true);
            v119[v264.id].y:set_callback(function(v267)
                -- upvalues: v264 (ref), v12 (ref), l_v258_0 (ref)
                v264.pos.y = v12(v267:get() * 1.0E-4 * l_v258_0.y);
            end, true);
            v264.__drag = {
                active = false, 
                locked = false, 
                point = vector(), 
                progress = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0
                }, 
                border = v265.border or {
                    [1] = vector(), 
                    [2] = oscreen
                }, 
                rulers = v265.rulers or {}, 
                on_release = v265.on_release, 
                on_held = v265.on_held, 
                on_active = v265.on_active, 
                config = v119[v264.id]
            };
            events.mouse_input:set(function()
                -- upvalues: v264 (ref)
                if ui.get_alpha() > 0 and (v264.__drag.hovered or v264.__drag.active) then
                    return false;
                else
                    return;
                end;
            end);
            events.dpi_change:set(function(_, _, _)
                -- upvalues: v119 (ref), v264 (ref)
                v119[v264.id].x:set(v119[v264.id].x.value);
                v119[v264.id].y:set(v119[v264.id].y.value);
            end);
        end, 
        process = function(v271)
            -- upvalues: l_play_0 (ref), l_v151_0 (ref), l_v149_1 (ref), v32 (ref), l_v150_1 (ref), l_v258_0 (ref)
            local l___drag_0 = v271.__drag;
            if l___drag_0.locked or ui.get_alpha() == 0 then
                return;
            else
                local v273 = ui.get_mouse_position() / l_play_0.dpi;
                local v274 = ui.get_position();
                local v275 = ui.get_size();
                local v276 = ui.get_alpha() > 0 and common.is_button_down(1);
                local v277 = l_v151_0(v273, v271.pos, v271.pos + v271.size) and not l_v151_0(v273, v274 / l_play_0.dpi, (v274 + v275) / l_play_0.dpi);
                if v276 and l___drag_0.ready == nil then
                    local l_v277_0 = v277;
                    local v279 = v271.pos - v273;
                    l___drag_0.init = v271.pos:clone();
                    l___drag_0.point = v279;
                    l___drag_0.ready = l_v277_0;
                end;
                if v276 and l___drag_0.ready then
                    if l_v149_1 == nil and l___drag_0.on_held then
                        l___drag_0.on_held(v271, l___drag_0);
                    end;
                    l_v149_1 = l___drag_0.ready and l_v149_1 == nil and v271.id or l_v149_1;
                    l___drag_0.active = l_v149_1 == v271.id;
                elseif not v276 then
                    if l___drag_0.active and l___drag_0.on_release then
                        l___drag_0.on_release(v271, l___drag_0);
                    end;
                    l___drag_0.active = false;
                    local v280 = nil;
                    local v281 = nil;
                    local v282 = nil;
                    local v283 = nil;
                    l_v149_1 = nil;
                    l___drag_0.aligning = v283;
                    l___drag_0.init = v282;
                    l___drag_0.point = v281;
                    l___drag_0.ready = v280;
                end;
                local v284 = v271.pos * l_play_0.dpi;
                local v285 = v271.size * l_play_0.dpi;
                l___drag_0.hovered = v277 or l___drag_0.active;
                local v286 = {};
                local v287 = v284 + v285 * 0.5;
                local v288 = l___drag_0.point and (l___drag_0.point + v273) * l_play_0.dpi or v284;
                l___drag_0.progress[1] = v32.interp(l___drag_0.progress[1], l___drag_0.active, 0.1);
                l___drag_0.progress[2] = v32.interp(l___drag_0.progress[2], l___drag_0.active or l___drag_0.hovered, 0.1);
                local v289 = l___drag_0.progress[1];
                local v290 = l___drag_0.progress[2];
                l_play_0.push_alpha(ui.get_alpha());
                l_play_0.rect(v271.pos - 4, v271.pos + v271.size + 4, l_v150_1:alpha_modulate(0.1 * (v290 * 0.65 + 0.35), true), 6);
                l_play_0.rect_outline(v271.pos - 5, v271.pos + v271.size + 5, l_v150_1:alpha_modulate(0.3 * v289, true), 1, 7);
                l_play_0.push_alpha(v289);
                if v289 > 0 and not common.is_button_down(162) then
                    local v291 = (v288 + v285 * 0.5) / l_play_0.dpi;
                    for _, v293 in ipairs(l___drag_0.rulers) do
                        v293[4] = v293[4] or {
                            [1] = 0
                        };
                        local v294 = v293[2] / l_play_0.dpi;
                        local v295 = math.abs(v293[1] and v291.x - v294.x or v291.y - v294.y) < 10 * l_play_0.dpi;
                        local l_v294_0 = v294;
                        local v297 = v293[1] and vector(v294.x + 1, v293[3] / l_play_0.dpi) or vector(v293[3] / l_play_0.dpi, v294.y + 1);
                        local v298 = v293[1] and 1 or 2;
                        if not v286[v298] then
                            v286[v298] = v295 and (v293[1] and v294.x - v271.size.x * 0.5 or v294.y - v271.size.y * 0.5) or nil;
                        end;
                        local v299 = math.abs(v293[1] and v287.x - v294.x or v287.y - v294.y);
                        l___drag_0.progress[4] = v32.interp(l___drag_0.progress[4], v295 or v299 < 10 * l_play_0.dpi, 0.1);
                        local v300 = l___drag_0.progress[4] * 0.35 + 0.1;
                        l_play_0.rect(l_v294_0, v297, l_v150_1:alpha_modulate(v300, true));
                    end;
                    if l___drag_0.border[3] then
                        local v301 = utilities.in_bounds(v271.pos, l___drag_0.border[1], l___drag_0.border[2] - v271.size * 0.5 - 1);
                        l___drag_0.progress[3] = v32.interp(l___drag_0.progress[3], not v301, 0.1);
                        local v302 = l___drag_0.progress[3];
                        l_play_0.rect_outline(l___drag_0.border[1] / l_play_0.dpi, l___drag_0.border[2] / l_play_0.dpi, l_v150_1:alpha_modulate(v302 * 0.75 + 0.25, true), 1, 4);
                    end;
                end;
                l_play_0.pop_alpha();
                l_play_0.pop_alpha();
                if l___drag_0.active then
                    local v303 = v288 / l_play_0.dpi;
                    if common.is_button_down(160) then
                        local v304 = l___drag_0.init:to(v303);
                        local v305 = math.abs(v304.y);
                        local v306 = math.abs(v304.x);
                        if l___drag_0.aligning == nil then
                            if v305 > 0.9 then
                                l___drag_0.aligning = 0;
                            elseif v306 > 0.9 then
                                l___drag_0.aligning = 1;
                            end;
                        end;
                        if l___drag_0.aligning == 0 then
                            v303.x = l___drag_0.init.x;
                            l_play_0.rect(vector(v303.x + v271.size.x * 0.5, 0), vector(v303.x + v271.size.x * 0.5 + 1, l_v258_0.y), color(255, 64));
                        elseif l___drag_0.aligning == 1 then
                            v303.y = l___drag_0.init.y;
                            l_play_0.rect(vector(0, v303.y + v271.size.y * 0.5), vector(l_v258_0.x, v303.y + v271.size.y * 0.5 + 1), color(255, 64));
                        end;
                    end;
                    local v307 = v286[1] or v303.x;
                    v303.y = v286[2] or v303.y;
                    v303.x = v307;
                    v307 = (l___drag_0.border[1] - v285 * 0.5) / l_play_0.dpi;
                    local v308 = (l___drag_0.border[2] - v285 * 0.5) / l_play_0.dpi;
                    v271:set_position(math.clamp(v303.x, v307.x, math.min(v308.x, l_v258_0.x - v271.size.x)), (math.clamp(v303.y, v307.y, math.min(v308.y, l_v258_0.y - v271.size.y))));
                    if l___drag_0.on_active then
                        l___drag_0.on_active(v271, l___drag_0, v303);
                    end;
                end;
                return;
            end;
        end
    };
end;
v141 = nil;
v149 = nil;
do
    local l_v149_2 = v149;
    l_v149_2 = {
        update = function(_)
            return 1;
        end, 
        paint = function(_, _, _)

        end, 
        set_position = function(v314, v315, v316)
            -- upvalues: l_play_0 (ref)
            local v317 = nil;
            local v318 = nil;
            if type(v315) == "userdata" then
                local l_x_0 = v315.x;
                v318 = v315.y;
                v317 = l_x_0;
            else
                local l_v315_0 = v315;
                v318 = v316;
                v317 = l_v315_0;
            end;
            local v321 = l_play_0.screen_size();
            if v314.__drag then
                if v317 then
                    v314.__drag.config.x:set(v317 / v321.x * 10000);
                end;
                if v318 then
                    v314.__drag.config.y:set(v318 / v321.y * 10000);
                end;
            else
                local l_pos_0 = v314.pos;
                local l_pos_1 = v314.pos;
                local v324;
                if not v317 then
                    v324 = v314.pos.x;
                else
                    v324 = v317;
                end;
                local v325;
                if not v318 then
                    v325 = v314.pos.y;
                else
                    v325 = v318;
                end;
                l_pos_1.y = v325;
                l_pos_0.x = v324;
            end;
        end, 
        get_drag_position = function(v326)
            -- upvalues: l_play_0 (ref)
            local v327 = v326.__drag and v326.__drag.config;
            if not v327 then
                return v326.pos;
            else
                local v328 = l_play_0.screen_size();
                local v329 = v327.x:get();
                local v330 = v327.y:get();
                return vector(v329 * 1.0E-4 * v328.x, v330 * 1.0E-4 * v328.y);
            end;
        end, 
        get_drag_size = function(v331)
            return v331.size:clone();
        end, 
        __call = function(v332)
            -- upvalues: l_play_0 (ref), v119 (ref), l_v149_2 (ref)
            local l___list_0 = v332.__list;
            local l___drag_1 = v332.__drag;
            if l___list_0 then
                local v335 = l___list_0.collect();
                l___list_0.active = 0;
                l___list_0.items = v335;
                for v336 = 1, #l___list_0.items do
                    if l___list_0.items[v336].active then
                        l___list_0.active = l___list_0.active + 1;
                    end;
                end;
            end;
            v332.alpha = v332:update();
            l_play_0.push_alpha(v332.alpha);
            if v332.alpha > 0 then
                if l___drag_1 then
                    v119.process(v332);
                end;
                if l___list_0 then
                    l_v149_2.traverse(v332);
                end;
                v332:paint(v332.pos, v332.pos + v332.size);
            end;
            l_play_0.pop_alpha();
        end, 
        enlist = function(v337, v338, v339, v340)
            v337.__list = {
                longest = 0, 
                active = 0, 
                items = {}, 
                progress = setmetatable({}, {
                    __mode = "k"
                }), 
                minwidth = v337.size.x, 
                collect = v338, 
                paint = v339, 
                rev = v340
            };
        end, 
        traverse = function(v341)
            -- upvalues: l_play_0 (ref)
            local l___list_1 = v341.__list;
            local v343 = 0;
            local v344 = vector();
            local v345 = 0;
            l___list_1.longest = 0;
            l___list_1.active = v345;
            for v346 = 1, #l___list_1.items do
                local v347 = l___list_1.items[v346];
                local v348 = v347.name or v346;
                l___list_1.progress[v348] = l___list_1.progress[v348] or {
                    [1] = 0
                };
                local v349 = anima.condition(l___list_1.progress[v348], v347.active, 6, {
                    [1] = {
                        [1] = 1, 
                        [2] = 3
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                });
                if v349 > 0 then
                    l_play_0.push_alpha(v349);
                    v344 = l___list_1.paint(v341, v347, v343, v349);
                    l_play_0.pop_alpha();
                    local v350 = l___list_1.active + 1;
                    v343 = v343 + v344.y * v349;
                    l___list_1.active = v350;
                    l___list_1.longest = math.max(l___list_1.longest, v344.x);
                end;
            end;
            v341.size.x = anima.lerp(v341.size.x, math.max(l___list_1.longest, l___list_1.minwidth), 10, 0.5);
        end, 
        lock = function(v351, v352)
            if not v351.__drag then
                return;
            else
                v351.__drag.locked = v352 and true or false;
                return;
            end;
        end
    };
    l_v149_2.__index = l_v149_2;
    v141 = {
        new = function(v353, v354, v355, v356)
            -- upvalues: v119 (ref), l_v149_2 (ref)
            local v357 = {
                alpha = 1, 
                id = v353, 
                pos = v354, 
                size = v355, 
                progress = {
                    [1] = 0
                }
            };
            if v356 then
                v119.new(v357, type(v356) == "table" and v356 or nil);
            end;
            return setmetatable(v357, l_v149_2);
        end
    };
end;
v149 = nil;
v149 = {};
v150 = function(v358)
    local v359 = {};
    local v360 = 0;
    for v361 in string.gmatch(v358, ".[\128-\191]*") do
        v360 = v360 + 1;
        v359[v360] = v361;
    end;
    return v359, v360;
end;
do
    local l_v150_2 = v150;
    v149.gradient = function(v363, v364, v365, v366)
        -- upvalues: l_v150_2 (ref)
        local v367 = {};
        local v368, v369 = l_v150_2(v363);
        local v370 = 1 / (v369 - 1);
        local v371 = v366.r - v365.r;
        local v372 = v366.g - v365.g;
        local v373 = v366.b - v365.b;
        local v374 = v366.a - v365.a;
        for v375 = 1, v369 do
            local v376 = v368[v375];
            local v377 = v364 % 2;
            if v377 > 1 then
                v377 = 2 - v377;
            end;
            local v378 = v365.r + v377 * v371;
            local v379 = v365.g + v377 * v372;
            local v380 = v365.b + v377 * v373;
            local v381 = v365.a + v377 * v374;
            local v382 = string.format("%02x%02x%02x%02x", v378, v379, v380, v381);
            table.insert(v367, "\a");
            table.insert(v367, v382);
            table.insert(v367, v376);
            v364 = v364 + v370;
        end;
        return table.concat(v367);
    end;
end;
v150 = nil;
v150 = {
    recorder = {}
};
v151 = nil;
v151 = {
    aimtools = {
        [1] = "Pistols", 
        [2] = "AutoSnipers", 
        [3] = "AWP", 
        [4] = "SSG-08", 
        [5] = "Desert Eagle", 
        [6] = "R8 Revolver"
    }, 
    states = {
        [0] = "Shared", 
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Slow motion", 
        [4] = "Crouching", 
        [5] = "Move & Crouching", 
        [6] = "Air", 
        [7] = "Air & Crouching", 
        [8] = "On use", 
        [9] = "Fakelag", 
        [10] = "Freestanding", 
        [11] = "Safe Head", 
        [12] = "Manual Yaw"
    }
};
v257 = nil;
v257 = {};
v258 = ".\\" .. v13.name;
local function v384(v383)
    return type(v383.type) == "string" and type(v383.link) == "string" and type(v383.width) == "number" and type(v383.height) == "number";
end;
do
    local l_v258_1, l_v384_0 = v258, v384;
    local function v393(v387)
        -- upvalues: l_v384_0 (ref), l_v258_1 (ref), v257 (ref), l_play_0 (ref)
        return function(v388)
            -- upvalues: l_v384_0 (ref), l_v258_1 (ref), v387 (ref), v257 (ref), l_play_0 (ref)
            if not l_v384_0(v388) then
                return false;
            else
                files.create_folder(l_v258_1);
                local v389 = string.format("%s/%s.%s", l_v258_1, v387, v388.type);
                local v390 = files.read(v389, true);
                if v390 ~= nil then
                    v257[v387] = l_play_0.load_image(v390, vector(v388.width, v388.height));
                else
                    network.get(v388.link, {}, function(v391)
                        -- upvalues: v257 (ref), v387 (ref), l_play_0 (ref), v388 (ref), v389 (ref)
                        if v391 == nil then
                            return;
                        else
                            local l_v391_0 = v391;
                            v257[v387] = l_play_0.load_image(l_v391_0, vector(v388.width, v388.height));
                            files.write(v389, l_v391_0, true);
                            return;
                        end;
                    end);
                end;
                return true;
            end;
        end;
    end;
    v393("eva_small")({
        width = 35, 
        link = "https://cdn.hysteria.one/angelwings/angelwings_eva_img.png", 
        height = 35, 
        type = "png"
    });
    v393("billy")({
        width = 131, 
        link = "https://cdn.hysteria.one/angelwings/billy.png", 
        height = 185, 
        type = "png"
    });
    v393("tulen")({
        width = 401, 
        link = "https://cdn.hysteria.one/angelwings/tulen.png", 
        height = 401, 
        type = "png"
    });
end;
v258 = nil;
v258 = {};
local v394 = ({
    debug = -1, 
    illusory = 0, 
    exclusive = 1, 
    live = 2
})[v13.build:lower()];
local v395 = {};
local function v398(v396, v397)
    v396:set(unpack(v397));
    v396:disabled(true);
end;
do
    local l_v394_0, l_v395_0, l_v398_0 = v394, v395, v398;
    local function v404()
        -- upvalues: l_v395_0 (ref), l_v398_0 (ref)
        for v402 = 1, #l_v395_0 do
            local v403 = l_v395_0[v402];
            l_v398_0(v403.item, v403.value);
        end;
    end;
    v258.is_locked = function(v405)
        -- upvalues: l_v394_0 (ref)
        if l_v394_0 == -1 then
            return false;
        elseif v405 == -1 then
            return true;
        else
            return v405 <= l_v394_0;
        end;
    end;
    v258.push = function(v406, v407, ...)
        -- upvalues: v258 (ref), l_v395_0 (ref), l_v398_0 (ref)
        if not v258.is_locked(v406) then
            return v407;
        else
            local v408 = {
                ...
            };
            if select("#", ...) == 0 then
                v408 = {
                    [1] = false
                };
            end;
            table.insert(l_v395_0, {
                item = v407, 
                value = v408
            });
            v407:set_callback(function(v409)
                -- upvalues: l_v398_0 (ref), v408 (ref)
                l_v398_0(v409, v408);
            end, true);
            return v407;
        end;
    end;
    v258.update = function()
        -- upvalues: v404 (ref)
        v404();
    end;
    local function v411(v410)
        -- upvalues: v404 (ref)
        if v410 == "pre_save" then
            v404();
        end;
    end;
    utils.execute_after(0, v404);
    events.config_state(v411);
end;
v384 = nil;
v384 = {};
v394 = 1;
v395 = 2;
v398 = function(v412)
    return (string.gsub(v412, "${(.-)}", "\a{Link Active}%1\aDEFAULT"));
end;
local function v414(v413)
    -- upvalues: v3 (ref)
    return string.rep(v3, v413);
end;
local function v418(v415, v416)
    -- upvalues: v3 (ref)
    local v417 = string.rep(v3, v416);
    return v417 .. v415 .. v417;
end;
do
    local l_v398_1, l_v414_0 = v398, v414;
    local function v426(v421, v422, v423, v424, v425)
        -- upvalues: l_v414_0 (ref)
        return l_v414_0(v424) .. "\a" .. v421 .. ui.get_icon(v422) .. l_v414_0(v425) .. "\aDEFAULT" .. v423;
    end;
    local function v431(v427, v428, v429, v430)
        -- upvalues: v426 (ref)
        return v426("{Link Active}", v427, v428, v429, v430);
    end;
    local function v438(v432, v433, v434, v435)
        -- upvalues: l_v414_0 (ref)
        local v436 = l_v414_0(v435);
        local v437 = l_v414_0(3);
        return v436 .. "\a" .. v432 .. ui.get_icon(v433) .. v437 .. "\aDEFAULT" .. v434 .. v436;
    end;
    local function v442(v439, v440, v441)
        -- upvalues: v438 (ref)
        return v438("{Link Active}", v439, v440, v441);
    end;
    local function v447(v443, v444, v445)
        -- upvalues: l_v414_0 (ref)
        local v446 = l_v414_0(v445);
        return v446 .. "\a" .. v443 .. ui.get_icon(v444) .. v446;
    end;
    local function v450(v448, v449)
        -- upvalues: v447 (ref)
        return v447("{Link Active}", v448, v449);
    end;
    local function v458(v451, v452)
        local v453 = v451:get();
        if #v453 == 0 then
            if v452 == nil then
                local v454 = v451:type();
                local v455 = v451:list();
                if v454 == "selectable" then
                    v452 = v455;
                elseif v454 == "listable" then
                    v452 = {};
                    for v456 = 1, #v455 do
                        v452[v456] = v456;
                    end;
                end;
            end;
            v453 = v452;
            v451:set(v452);
        end;
        v451:set_callback(function()
            -- upvalues: v451 (ref), v453 (ref)
            local v457 = v451:get();
            if #v457 > 0 then
                v453 = v457;
            else
                v451:set(v453);
            end;
        end);
    end;
    local v459 = {
        category = v29.create("~", "##CATEGORY", v394), 
        info = v29.create("~", "##INFO", v394), 
        antiaim = {
            main = v29.create("~", "##AA_MAIN", v394), 
            state = v29.create("~", "##AA_STATE", v395), 
            recorder = v29.create("~", "##AA_RECORDER", v395), 
            settings = v29.create("~", "##AA_SETTINGS", v395), 
            presets = v29.create("~", "##AA_PRESETS", v395)
        }, 
        ragebot = v29.create("~", "##RAGEBOT", v395), 
        visuals = v29.create("~", "##VISUALS", v395), 
        misc = v29.create("~", "##MISC", v395)
    };
    local _ = nil;
    local function v466()
        -- upvalues: v149 (ref), v13 (ref)
        local v461 = ui.get_style();
        local v462 = color(40, 40, 40, 255);
        local v463 = v461["Link Active"];
        local v464 = -globals.realtime * 0.8;
        local v465 = v149.gradient(v13.name, v464, v463, v462);
        ui.sidebar(v465, "sparkles");
    end;
    events.render(v466);
    v466 = nil;
    v466 = v459.category:list("##CATEGORY", {
        [1] = "Anti-Aim", 
        [2] = "Ragebot", 
        [3] = "Visuals", 
        [4] = "Misc"
    });
    v384.category = v466;
    local v467 = {};
    local v468 = string.lower(v13.build);
    v467.welcome_text = v459.info:label(v431("user", l_v398_1(string.format("Welcome back, ${%s}", v13.user)), 1, 7));
    v467.welcome_text = v459.info:label(v431("code-branch", l_v398_1(string.format("Your build is ${%s}", v468)), 1, 7));
    v384.info = v467;
    v384.links = {
        label = v459.info:label(v10("\a{Link Active}", "Links")), 
        discord = v459.info:button(v450("discord", 10), nil, true), 
        youtube = v459.info:button(v450("youtube", 10), nil, true), 
        config = v459.info:button(v450("file", 10), nil, true)
    };
    v384.configs = {
        label = v459.info:label(v10("\a{Link Active}", "Config")), 
        export = v459.info:button(v442("copy", "Export", 7), nil, true), 
        import = v459.info:button(v442("paste", "Import", 7), nil, true), 
        default = v459.info:button(v418("Load Default Config", 34), nil, true)
    };
    local v469 = {};
    local l_main_0 = v459.antiaim.main;
    local l_state_0 = v459.antiaim.state;
    local l_settings_0 = v459.antiaim.settings;
    local l_presets_0 = v459.antiaim.presets;
    local l_recorder_0 = v459.antiaim.recorder;
    v31.add("##ANTIAIM_MAIN", l_main_0, "AA");
    v31.add("##ANTIAIM_STATE", l_state_0, "AA");
    v31.add("##ANTIAIM_SETTINGS", l_settings_0, "AA");
    v469.enabled = l_main_0:switch("Enabled");
    v469.mode = l_main_0:list("##MODE", {
        [1] = "Main", 
        [2] = "Settings", 
        [3] = "Presets"
    });
    local v475 = {};
    local v476 = {
        unpack(v151.states, 0)
    };
    local v477 = {};
    v475.state = l_state_0:combo("State", v476);
    local v478 = nil;
    local function v480(v479)
        -- upvalues: v459 (ref)
        v459.info:visibility(v479);
    end;
    do
        local l_l_settings_0_0, l_l_presets_0_0, l_l_recorder_0_0, l_v475_0 = l_settings_0, l_presets_0, l_recorder_0, v475;
        do
            local l_v476_0, l_v477_0 = v476, v477;
            local function v498(v487)
                -- upvalues: l_v475_0 (ref), l_v476_0 (ref), l_v477_0 (ref), l_l_recorder_0_0 (ref)
                local v488 = l_v475_0.state:get();
                l_v475_0.state:visibility(v487);
                local v489 = false;
                for v490 = 1, #l_v476_0 do
                    local v491 = l_v476_0[v490];
                    local v492 = l_v475_0[v491];
                    local v493 = l_v477_0[v491];
                    local v494 = v487 and v491 == v488;
                    if v492 ~= nil and v492.enabled ~= nil then
                        v492.enabled:visibility(v494);
                        if v494 then
                            v494 = v492.enabled:get();
                        end;
                    end;
                    if v492.bomb_e_fix ~= nil then
                        v492.bomb_e_fix:visibility(v494);
                    end;
                    local v495 = v492.mode:get();
                    v492.mode:visibility(v494);
                    local v496 = v495 == "Builder";
                    local v497 = v495 == "Recorder";
                    if v493 ~= nil then
                        if v493.angles ~= nil then
                            v493.angles:visibility(v496 and v494);
                        end;
                        if v493.defensive ~= nil then
                            v493.defensive:visibility(v496 and v494);
                        end;
                        if v493.recorder ~= nil then
                            v493.recorder:visibility(v497 and v494);
                        end;
                    end;
                    if v497 and v494 then
                        v489 = true;
                    end;
                end;
                l_l_recorder_0_0:visibility(v489);
            end;
            local function v500(v499)
                -- upvalues: l_l_presets_0_0 (ref)
                l_l_presets_0_0:visibility(v499);
            end;
            local function v502(v501)
                -- upvalues: l_l_settings_0_0 (ref)
                l_l_settings_0_0:visibility(v501);
            end;
            do
                local l_v480_0, l_v498_0, l_v500_0, l_v502_0 = v480, v498, v500, v502;
                local function v513(v507)
                    -- upvalues: v469 (ref), l_v480_0 (ref), l_v498_0 (ref), l_v502_0 (ref), l_v500_0 (ref)
                    local v508 = v469.mode:get();
                    local v509 = v469.enabled:get();
                    local v510 = v508 == 1;
                    local v511 = v508 == 2;
                    local v512 = v508 == 3;
                    v469.enabled:visibility(v507);
                    v469.mode:visibility(v507 and v509);
                    l_v480_0(not v507 or not v509);
                    l_v498_0(v507 and v509 and v510);
                    l_v502_0(v507 and v509 and v511);
                    l_v500_0(v507 and v509 and v512);
                end;
                v478 = function()
                    -- upvalues: v466 (ref), v513 (ref)
                    local v514 = v466:get();
                    v513(v514 == 1);
                end;
            end;
            v480 = function(v515, v516, v517)
                -- upvalues: l_v398_1 (ref)
                local v518 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter", 
                    [5] = "Custom Ways", 
                    [6] = "Spin", 
                    [7] = "Random"
                };
                local v519 = {
                    [1] = "Off", 
                    [2] = "Left", 
                    [3] = "Right", 
                    [4] = "Jitter", 
                    [5] = "Random"
                };
                local v520 = {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Forward", 
                    [4] = "Forward-Left", 
                    [5] = "Forward-Right", 
                    [6] = "Backward", 
                    [7] = "Backward-Left", 
                    [8] = "Backward-Right"
                };
                local function v522(v521)
                    return v521 > 0 and v521 .. "%" or "Off";
                end;
                local function v524(v523)
                    return v523 > 1 and v523 .. "t" or "Off";
                end;
                local function v526(v525)
                    return v525 > 0 and v525 .. "t" or "Off";
                end;
                if v515 == "Move & Crouching" then
                    v517.direction = v516:combo(l_v398_1("Direction"), {
                        "General", 
                        unpack(v520)
                    });
                end;
                v517.yaw_offset = v516:slider("Offset", -90, 90, 0, nil, "\194\176");
                v517.add_yaw = v516:switch("Add Yaw");
                v517.yaw_left = v516:slider(l_v398_1("${~}   Left##YAW"), -90, 90, 0, nil, "\194\176");
                v517.yaw_right = v516:slider(l_v398_1("${~}   Right##YAW"), -90, 90, 0, nil, "\194\176");
                if v515 == "Move & Crouching" then
                    for v527 = 1, #v520 do
                        local v528 = v520[v527];
                        v517[v528] = {
                            enabled = v516:switch(l_v398_1("${~}   Enabled##YAW_") .. v528), 
                            yaw_offset = v516:slider(l_v398_1("${~}   Offset##YAW_") .. v528, -90, 90, 0, nil, "\194\176"), 
                            yaw_left = v516:slider(l_v398_1("${~}   Left##YAW_") .. v528, -90, 90, 0, nil, "\194\176"), 
                            yaw_right = v516:slider(l_v398_1("${~}   Right##YAW_") .. v528, -90, 90, 0, nil, "\194\176")
                        };
                    end;
                end;
                local v529 = nil;
                local function v540()
                    -- upvalues: v517 (ref), v520 (ref)
                    local v530 = v517.add_yaw:get();
                    local v531 = "General";
                    if v517.direction ~= nil then
                        v531 = v517.direction:get();
                    end;
                    local v532 = v531 == "General";
                    v517.yaw_offset:visibility(v532);
                    v517.yaw_left:visibility(v532 and v530);
                    v517.yaw_right:visibility(v532 and v530);
                    for v533 = 1, #v520 do
                        local v534 = v520[v533];
                        local v535 = v517[v534];
                        if v535 ~= nil then
                            local v536 = v531 == v534;
                            v535.enabled:visibility(v536);
                            if not v535.enabled:get() then
                                v536 = false;
                            end;
                            v535.yaw_offset:visibility(v536);
                            local l_yaw_left_0 = v535.yaw_left;
                            local l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            local v539;
                            if v536 then
                                v539 = v530;
                            else
                                v539 = v536;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v539);
                            l_yaw_left_0 = v535.yaw_right;
                            l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            if v536 then
                                v539 = v530;
                            else
                                v539 = v536;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v539);
                        end;
                    end;
                end;
                v517.add_yaw:set_callback(v540);
                if v517.direction ~= nil then
                    v517.direction:set_callback(v540);
                    for v541 = 1, #v520 do
                        local v542 = v517[v520[v541]];
                        if v542 ~= nil then
                            v542.enabled:set_callback(v540);
                        end;
                    end;
                end;
                v540();
                v517.yaw_jitter = v516:combo("Jitter", v518);
                v517.jitter_offset = v516:slider(l_v398_1("${~}   Degree"), -90, 90, 0, nil, "\194\176");
                v517.way = {
                    v516:slider(l_v398_1("${~}   Way 1"), -90, 90, 0, nil, "\194\176"), 
                    v516:slider(l_v398_1("${~}   Way 2"), -90, 90, 0, nil, "\194\176"), 
                    v516:slider(l_v398_1("${~}   Way 3"), -90, 90, 0, nil, "\194\176")
                };
                v517.yaw_jitter:set_callback(function(v543)
                    -- upvalues: v517 (ref)
                    local v544 = v543:get();
                    local v545 = v544 == "Off";
                    local v546 = not v545 and v544 ~= "Custom Ways";
                    local v547 = not v545 and v544 == "Custom Ways";
                    v517.jitter_offset:visibility(v546);
                    for v548 = 1, #v517.way do
                        v517.way[v548]:visibility(v547);
                    end;
                end, true);
                v517.body_yaw = v516:combo("Body Yaw", v519);
                v529 = v517.body_yaw:create();
                v517.avoid_overlap = v529:switch("Avoid overlap");
                v517.freestanding_body_yaw = v529:combo("Freestanding", {
                    [1] = "Off", 
                    [2] = "Peek Fake", 
                    [3] = "Peek Real"
                });
                v517.left_limit = v516:slider(l_v398_1("${~}   Left##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v517.right_limit = v516:slider(l_v398_1("${~}   Right##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v517.body_yaw:set_callback(function(v549)
                    -- upvalues: v517 (ref)
                    local v550 = v549:get();
                    local v551 = v550 == "Left";
                    local v552 = v550 == "Right";
                    local v553 = v550 == "Jitter";
                    local v554 = v550 == "Random";
                    v517.left_limit:visibility(v551 or v553 or v554);
                    v517.right_limit:visibility(v552 or v553 or v554);
                end, true);
                v517.random = v516:slider("Randomization", 0, 100, 0, nil, v522);
                v517.delay = v516:slider("Delay", 1, 14, 1, nil, v524);
                v517.random_delay = v517.delay:create():slider("Random ticks", 0, 14, 0, nil, v526);
                return v517;
            end;
            v498 = function(_, v556, v557)
                -- upvalues: l_v398_1 (ref)
                local v558 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Jitter", 
                    [4] = "Spin", 
                    [5] = "Random"
                };
                local v559 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Spin", 
                    [4] = "Random", 
                    [5] = "Left/Right"
                };
                local v560 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter"
                };
                local function v562(v561)
                    return v561 > 1 and v561 .. "t" or "Off";
                end;
                local function v564(v563)
                    return v563 > 0 and v563 .. "t" or "Off";
                end;
                v557.force_break_lc = v556:switch("Force Break LC");
                local v565 = v557.force_break_lc:create();
                v557.tickbase = v565:combo("Tickbase", {
                    [1] = "Default", 
                    [2] = "Ticks", 
                    [3] = "Random"
                });
                v557.tickbase_ticks = v565:slider("Ticks", 2, 22, 15, nil, "t");
                v557.tickbase_min = v565:slider("Min. Ticks", 2, 22, 15, nil, "t");
                v557.tickbase_max = v565:slider("Max. Ticks", 2, 22, 15, nil, "t");
                local v566 = nil;
                local function v571(v567)
                    -- upvalues: v557 (ref)
                    local v568 = v567:get();
                    local v569 = v568 == "Ticks";
                    local v570 = v568 == "Random";
                    v557.tickbase_ticks:visibility(v569);
                    v557.tickbase_min:visibility(v570);
                    v557.tickbase_max:visibility(v570);
                end;
                v557.tickbase:set_callback(v571, true);
                v557.enabled = v556:switch("Defensive AA");
                v557.pitch = v556:combo("Pitch", v558);
                v557.pitch_offset_1 = v556:slider(l_v398_1("${~}   Angle 1##PITCH"), -89, 89, 0, nil, "\194\176");
                v557.pitch_offset_2 = v556:slider(l_v398_1("${~}   Angle 2##PITCH"), -89, 89, 0, nil, "\194\176");
                v557.pitch_speed = v556:slider(l_v398_1("${~}   Speed##PITCH"), -50, 50, 20, 0.1);
                v557.yaw = v556:combo("Yaw", v559);
                v557.yaw_left = v556:slider(l_v398_1("${~}   Yaw Left##YAW"), -180, 180, 0, nil, "\194\176");
                v557.yaw_right = v556:slider(l_v398_1("${~}   Yaw Right##YAW"), -180, 180, 0, nil, "\194\176");
                v557.yaw_offset = v556:slider(l_v398_1("${~}   Yaw Offset##YAW"), 0, 360, 0, nil, "\194\176");
                v557.yaw_speed = v556:slider(l_v398_1("${~}   Yaw Speed##YAW"), -50, 50, 20, 0.1);
                v557.yaw_modifier = v556:combo(l_v398_1("${~}   Modifier##MOD"), v560);
                v557.modifier_offset = v556:slider(l_v398_1("${~}   Degree##MOD"), -180, 180, 0, nil, "\194\176");
                v557.delay = v556:slider(l_v398_1("${~}   Delay##MOD"), 1, 14, 1, nil, v562);
                v557.random_delay = v557.delay:create():slider("Random ticks", 0, 14, 0, nil, v564);
                v557.force_target_yaw = v556:switch("Force Target Yaw");
                v565 = nil;
                v566 = function(v572)
                    -- upvalues: v557 (ref)
                    local v573 = v572:get();
                    local v574 = v573 == "Static";
                    local v575 = v573 == "Jitter";
                    local v576 = v573 == "Random";
                    local v577 = v573 == "Spin";
                    v557.pitch_offset_1:visibility(v575 or v576 or v577 or v574);
                    v557.pitch_offset_2:visibility(v575 or v576 or v577);
                    v557.pitch_speed:visibility(v577);
                end;
                v571 = function(v578)
                    -- upvalues: v557 (ref)
                    local v579 = v578:get() ~= "Off";
                    v557.modifier_offset:visibility(v579);
                    v557.delay:visibility(v579);
                end;
                do
                    local l_v566_0, l_v571_0 = v566, v571;
                    local function v587(v582)
                        -- upvalues: v557 (ref), l_v571_0 (ref)
                        local v583 = v582:get();
                        local v584 = v583 == "Off";
                        local v585 = v583 == "Spin";
                        local v586 = v583 == "Left/Right";
                        v557.yaw_left:visibility(v586);
                        v557.yaw_right:visibility(v586);
                        v557.yaw_offset:visibility(not v584 and not v586);
                        v557.yaw_speed:visibility(v585);
                        v557.yaw_modifier:visibility(not v584);
                        if not v584 then
                            v557.yaw_modifier:set_callback(l_v571_0, true);
                        else
                            v557.yaw_modifier:unset_callback(l_v571_0);
                        end;
                        if v584 then
                            v557.modifier_offset:visibility(false);
                            v557.delay:visibility(false);
                        end;
                    end;
                    local function v590(v588)
                        -- upvalues: v557 (ref), l_v566_0 (ref), v587 (ref), l_v571_0 (ref)
                        local v589 = v588:get();
                        if not v589 then
                            v557.pitch_offset_1:visibility(false);
                            v557.pitch_offset_2:visibility(false);
                            v557.pitch_speed:visibility(false);
                            v557.yaw_left:visibility(false);
                            v557.yaw_right:visibility(false);
                            v557.yaw_offset:visibility(false);
                            v557.yaw_speed:visibility(false);
                            v557.yaw_modifier:visibility(false);
                            v557.modifier_offset:visibility(false);
                            v557.delay:visibility(false);
                        end;
                        if v589 then
                            v557.pitch:set_callback(l_v566_0, true);
                            v557.yaw:set_callback(v587, true);
                        else
                            v557.pitch:unset_callback(l_v566_0);
                            v557.yaw:unset_callback(v587);
                            v557.yaw_modifier:unset_callback(l_v571_0);
                        end;
                        v557.pitch:visibility(v589);
                        v557.yaw:visibility(v589);
                        v557.force_target_yaw:visibility(v589);
                    end;
                    v557.enabled:set_callback(v590, true);
                end;
                v557.flick_enabled = v556:switch("Defensive Flick");
                v557.flick_mode = v556:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Silent"
                });
                v557.flick_pitch = v556:slider("Pitch", -89, 89, 0);
                v557.flick_yaw = v556:slider("Yaw", 0, 180, 120);
                v557.flick_yaw_random = v557.flick_yaw:create():slider("Yaw Random", 0, 180, 0);
                v557.flick_limit = v556:slider("Limit", 0, 60, 60);
                v557.flick_speed = v556:slider("Speed", 2, 10, 7);
                v557.flick_speed_random = v557.flick_speed:create():slider("Speed Random", 0, 8, 0);
                v565 = nil;
                v566 = function(v591)
                    -- upvalues: v557 (ref)
                    local v592 = v591:get();
                    v557.flick_mode:visibility(v592);
                    v557.flick_pitch:visibility(v592);
                    v557.flick_yaw:visibility(v592);
                    v557.flick_limit:visibility(v592);
                    v557.flick_speed:visibility(v592);
                end;
                v557.flick_enabled:set_callback(v566, true);
                return v557;
            end;
            v500 = function(_, v594, v595)
                v595.record = v594:value("record", "[]");
                v595.inverse_inverter = v594:switch("Inverse Inverter");
                return v595;
            end;
            for v596 = 1, #l_v476_0 do
                local v597 = l_v476_0[v596];
                local v598 = string.format("##ANGLES_%s", v597);
                local v599 = string.format("##DEFENSIVE_%s", v597);
                local v600 = string.format("##RECORDER_%s", v597);
                local v601 = v29.create("~", v598, v395);
                local v602 = v29.create("~", v599, v395);
                local v603 = v29.create("~", v600, v395);
                do
                    local l_v597_0 = v597;
                    local function v609(v605)
                        -- upvalues: l_v597_0 (ref)
                        local v606 = string.format("##%s", l_v597_0);
                        local _, v608 = string.find(v605[2], "##");
                        if v608 ~= nil then
                            v606 = v606 .. string.sub(v605[2], v608 + 1);
                        end;
                        v605[2] = v605[2] .. v606;
                    end;
                    local v610 = {};
                    l_state_0:set_callback(v609);
                    v601:set_callback(v609);
                    v602:set_callback(v609);
                    v603:set_callback(v609);
                    v610.mode = l_state_0:combo("Mode", {
                        [1] = "Builder", 
                        [2] = "Recorder"
                    });
                    v610.mode:set_callback(v478);
                    if l_v597_0 ~= "Shared" then
                        l_state_0:set_flag(v29.group_flags.callbacks, false);
                        v610.enabled = l_state_0:switch(string.format("\a{Link Active}Allow %s", l_v597_0:lower()));
                        l_state_0:set_flag(v29.group_flags.callbacks, true);
                        v610.enabled:set_callback(v478);
                    end;
                    if l_v597_0 == "On use" then
                        v610.bomb_e_fix = l_state_0:switch("Bomb E Fix");
                    end;
                    v610.angles = v480(l_v597_0, v601, {});
                    if l_v597_0 ~= "Fakelag" then
                        v610.defensive = v498(l_v597_0, v602, {});
                    end;
                    v610.recorder = v500(l_v597_0, v603, {});
                    l_state_0:unset_callback(v609);
                    v601:unset_callback(v609);
                    v602:unset_callback(v609);
                    v603:unset_callback(v609);
                    l_v475_0[l_v597_0] = v610;
                    l_v477_0[l_v597_0] = {
                        angles = v601, 
                        defensive = v602, 
                        recorder = v603
                    };
                    v31.add(v598, v601, "AA");
                    v31.add(v599, v602, "AA");
                    v31.add(v600, v603, "AA");
                end;
            end;
            v502 = nil;
            v466:set_callback(v478);
            v469.enabled:set_callback(v478);
            v469.mode:set_callback(v478);
            l_v475_0.state:set_callback(v478);
            v478();
            v469.builder = l_v475_0;
        end;
        v469.recorder = {
            sequence_list = l_l_recorder_0_0:list("##SEQUENCE_LIST", {}), 
            set_start_button = l_l_recorder_0_0:button(v418("Set Start", 52), nil, true), 
            set_end_button = l_l_recorder_0_0:button(v418("Set End", 53), nil, true), 
            save_button = l_l_recorder_0_0:button(v418("Save", 57), nil, true), 
            import_button = l_l_recorder_0_0:button(v418("Import", 53), nil, true)
        };
        v469.presets = {
            list = l_l_presets_0_0:list("##PRESET_LIST", {
                [1] = "Empty"
            }), 
            name = l_l_presets_0_0:input("##PRESET_NAME", ""), 
            load = l_l_presets_0_0:button(v418("\a{Link Active}Load", 12), nil, true), 
            save = l_l_presets_0_0:button(v418("Save", 12), nil, true), 
            delete = l_l_presets_0_0:button(v418("\aCD6060FFDelete", 8), nil, true), 
            import = l_l_presets_0_0:button(v418("Import", 19), nil, true), 
            export = l_l_presets_0_0:button(v418("Export", 20), nil, true)
        };
        v478 = {};
        v480 = {
            enabled = l_l_settings_0_0:switch("Anti-Bruteforce")
        };
        local v611 = v480.enabled:create();
        v480.refresh_modifier = v611:combo("Refresh Modifier", {
            [1] = "Off", 
            [2] = "Adaptive", 
            [3] = "Increase", 
            [4] = "Decrease"
        });
        v480.refresh_offset = v611:switch("Refresh Offset");
        v480.enforce_delay = v611:switch("Enforce Delay Period");
        v480.duration = v611:slider("Duration", 0, 100, 0, 0.1, function(v612)
            return v612 == 0 and "Inf." or v612 * 0.1 .. "s";
        end);
        v258.push(2, v480.enabled);
        v478.antibrute = v480;
        v611 = {};
        local v613 = {
            [1] = "With Knife", 
            [2] = "With Taser"
        };
        if not v258.is_locked(1) then
            table.insert(v613, "Above Enemy");
            table.insert(v613, "Far from Enemy");
        end;
        v611.select = l_l_settings_0_0:selectable("Safe Head", v613);
        v258.push(2, v611.select, {});
        v478.safe_head = v611;
        v613 = {
            select = l_l_settings_0_0:combo("Manual Yaw", {
                [1] = "Off", 
                [2] = "Left", 
                [3] = "Right", 
                [4] = "Backward", 
                [5] = "Forward"
            })
        };
        local v614 = v613.select:create();
        v613.disable_yaw_modifiers = v614:switch("Disable Yaw Modifiers");
        v613.body_freestanding = v614:switch("Body Freestanding");
        v478.manual_yaw = v613;
        v614 = {
            enabled = l_l_settings_0_0:switch("Freestanding")
        };
        local v615 = v614.enabled:create();
        v614.disablers = v615:selectable("Disablers", {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slow motion", 
            [4] = "Crouching", 
            [5] = "Air"
        });
        v614.disable_yaw_modifiers = v615:switch("Disable Yaw Modifiers");
        v614.body_freestanding = v615:switch("Body Freestanding");
        v478.freestanding = v614;
        v478.edge_yaw = {
            enabled = l_l_settings_0_0:switch("Edge Yaw")
        };
        v478.invert_flick = {
            enabled = l_l_settings_0_0:switch("Invert Flick")
        };
        local v616 = {
            value = l_l_settings_0_0:slider("Roll", -45, 45, 0, nil, "\194\176")
        };
        local v617 = v616.value:create();
        v616.change_on_fakelag = v617:switch("Change on Fakelag");
        v616.fakelag_value = v617:slider("Fakelag Roll", -45, 45, 0, nil, "\194\176");
        local _ = nil;
        do
            local l_v616_0 = v616;
            local function v621(v620)
                -- upvalues: l_v616_0 (ref)
                l_v616_0.fakelag_value:visibility(v620:get());
            end;
            l_v616_0.change_on_fakelag:set_callback(v621, true);
            v258.push(2, l_v616_0.value, 0);
            v478.roll = l_v616_0;
            v469.settings = v478;
        end;
        v384.antiaim = v469;
    end;
    l_main_0 = {};
    l_state_0 = v459.ragebot;
    v31.add("##RAGEBOT", l_state_0, "AA");
    l_settings_0 = {};
    l_presets_0 = {
        [1] = "Higher than you", 
        [2] = "Lower than you", 
        [3] = "Lethal", 
        [4] = "After X misses", 
        [5] = "HP lower than X"
    };
    l_settings_0.enabled = l_state_0:switch("Aimtools");
    l_recorder_0 = v29.cast(l_settings_0.enabled:create());
    l_settings_0.flag = l_recorder_0:switch("Draw Flags");
    l_settings_0.weapon = l_recorder_0:combo("Weapon", v151.aimtools);
    v475 = nil;
    v476 = function(v622, v623)
        v622.conditions:visibility(v623);
        v622.max_misses:visibility(v623 and v622.conditions:get("After X misses"));
        v622.lower_hp:visibility(v623 and v622.conditions:get("HP lower than X"));
    end;
    do
        local l_l_state_0_0, l_l_settings_0_1, l_l_presets_0_1, l_l_recorder_0_1 = l_state_0, l_settings_0, l_presets_0, l_recorder_0;
        do
            local l_l_l_presets_0_1_0 = l_l_presets_0_1;
            v477 = function(v629, v630)
                -- upvalues: l_l_l_presets_0_1_0 (ref)
                local v631 = v629.conditions:get();
                v629.conditions:visibility(v630);
                for v632 = 1, #l_l_l_presets_0_1_0 do
                    local v633 = l_l_l_presets_0_1_0[v632];
                    local v634 = v629[v633];
                    if v634 ~= nil then
                        local v635 = v630 and v631 == v633;
                        v634.enabled:visibility(v635);
                        if not v634.enabled:get() then
                            v635 = false;
                        end;
                        if v634.max_misses ~= nil then
                            v634.max_misses:visibility(v635);
                        end;
                        if v634.lower_hp ~= nil then
                            v634.lower_hp:visibility(v635);
                        end;
                        if v634.value ~= nil then
                            v634.value:visibility(v635);
                        end;
                    end;
                end;
            end;
            do
                local l_v476_1, l_v477_1, l_v478_0, l_v480_1 = v476, v477, v478, v480;
                l_v478_0 = function(v640, v641)
                    -- upvalues: l_v476_1 (ref), l_v477_1 (ref)
                    l_v476_1(v640.prefer_body, v641);
                    l_v476_1(v640.force_safe, v641);
                    l_v477_1(v640.hit_chance, v641);
                    l_v477_1(v640.multipoints, v641);
                end;
                l_v480_1 = function(v642, v643)
                    -- upvalues: l_l_settings_0_1 (ref), l_v478_0 (ref)
                    local v644 = v643:get();
                    for v645 = 1, #v642 do
                        local v646 = v642[v645];
                        local v647 = l_l_settings_0_1[v646];
                        local v648 = v646 == v644;
                        l_v478_0(v647, v648);
                    end;
                end;
                v475 = function()
                    -- upvalues: l_v480_1 (ref), v151 (ref), l_l_settings_0_1 (ref)
                    l_v480_1(v151.aimtools, l_l_settings_0_1.weapon);
                end;
            end;
            do
                local l_l_l_recorder_0_1_0, l_v475_1, l_v476_2, l_v477_2 = l_l_recorder_0_1, v475, v476, v477;
                l_v476_2 = function(v653)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_l_presets_0_1_0 (ref), l_v475_1 (ref)
                    local v654 = {};
                    local function v656(v655)
                        -- upvalues: v653 (ref)
                        v655[2] = v655[2] .. string.format("##%s", v653);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v656);
                    v654.conditions = l_l_l_recorder_0_1_0:selectable(v653, l_l_l_presets_0_1_0);
                    v654.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                    v654.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                    v654.conditions:set_callback(l_v475_1);
                    l_l_l_recorder_0_1_0:unset_callback(v656);
                    return v654;
                end;
                l_v477_2 = function(v657, v658, v659, v660)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_l_presets_0_1_0 (ref), l_v475_1 (ref)
                    local v661 = {};
                    local function v663(v662)
                        -- upvalues: v657 (ref)
                        v662[2] = v662[2] .. string.format("##%s", v657);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v663);
                    v661.conditions = l_l_l_recorder_0_1_0:combo(v657, l_l_l_presets_0_1_0);
                    for v664 = 1, #l_l_l_presets_0_1_0 do
                        local v665 = l_l_l_presets_0_1_0[v664];
                        do
                            local l_v665_0 = v665;
                            local function v668(v667)
                                -- upvalues: l_v665_0 (ref)
                                v667[2] = v667[2] .. string.format("##%s", l_v665_0);
                            end;
                            l_l_l_recorder_0_1_0:set_callback(v668);
                            local v669 = {
                                enabled = l_l_l_recorder_0_1_0:switch("\tEnabled")
                            };
                            if l_v665_0 == "After X misses" then
                                v669.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                            end;
                            if l_v665_0 == "HP lower than X" then
                                v669.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                            end;
                            v669.value = l_l_l_recorder_0_1_0:slider("\tValue", v658, v659, v660);
                            l_l_l_recorder_0_1_0:unset_callback(v668);
                            v669.enabled:set_callback(l_v475_1);
                            v661[l_v665_0] = v669;
                        end;
                    end;
                    l_l_l_recorder_0_1_0:unset_callback(v663);
                    v661.conditions:set_callback(l_v475_1);
                    return v661;
                end;
                v478 = function(_, v671)
                    -- upvalues: l_v476_2 (ref), l_v477_2 (ref)
                    v671.prefer_body = l_v476_2("Prefer Body Aim");
                    v671.force_safe = l_v476_2("Force Safe Point");
                    v671.hit_chance = l_v477_2("Hit Chance", 0, 100, 50);
                    v671.multipoints = l_v477_2("Multipoints", 0, 100, 50);
                    return v671;
                end;
                for v672 = 1, #v151.aimtools do
                    local v673 = v151.aimtools[v672];
                    do
                        local l_v673_0 = v673;
                        local function v679(v675)
                            -- upvalues: l_v673_0 (ref)
                            local v676 = string.format("##%s", l_v673_0);
                            local _, v678 = string.find(v675[2], "##");
                            if v678 ~= nil then
                                v676 = v676 .. string.sub(v675[2], v678 + 1);
                            end;
                            v675[2] = v675[2] .. v676;
                        end;
                        l_l_l_recorder_0_1_0:set_callback(v679);
                        l_l_settings_0_1[l_v673_0] = v478(l_v673_0, {});
                        l_l_l_recorder_0_1_0:unset_callback(v679);
                    end;
                end;
                v258.push(1, l_l_settings_0_1.enabled);
                l_l_settings_0_1.weapon:set_callback(l_v475_1, true);
            end;
            l_main_0.aimtools = l_l_settings_0_1;
        end;
        l_l_presets_0_1 = {
            enabled = l_l_state_0_0:switch("AI Peek")
        };
        l_l_recorder_0_1 = l_l_presets_0_1.enabled:create();
        l_l_presets_0_1.simulation = l_l_recorder_0_1:slider("Simulation", 25, 35, 28, 0.01, "s");
        l_l_presets_0_1.rate_limit = l_l_recorder_0_1:slider("Rate Limit", 0, 30, 2, 0.01, "s");
        l_l_presets_0_1.hit_chance = l_l_recorder_0_1:slider("Hit Chance", 0, 100, 35, nil, function(v680)
            return v680 == 0 and "Def." or v680 .. "%";
        end);
        l_l_presets_0_1.unsafety = l_l_recorder_0_1:switch("Unsafety", false);
        l_l_presets_0_1.dev_mode = l_l_recorder_0_1:switch("Dev Mode", false);
        l_l_presets_0_1.range = l_l_recorder_0_1:slider("Range", 15, 25, 20, nil, "t");
        l_l_presets_0_1.retreat = l_l_recorder_0_1:slider("Retreat", 15, 30, 25, nil, "u");
        l_l_presets_0_1.weapons = l_l_recorder_0_1:selectable("Weapons", {
            [1] = "SSG-08", 
            [2] = "Pistols", 
            [3] = "Deagle"
        });
        l_l_presets_0_1.hitboxes = l_l_recorder_0_1:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Arms", 
            [5] = "Legs"
        });
        l_l_presets_0_1.color = l_l_recorder_0_1:color_picker("Color", color(200, 0, 0, 255));
        v458(l_l_presets_0_1.weapons);
        v458(l_l_presets_0_1.hitboxes);
        v258.push(1, l_l_presets_0_1.enabled);
        v475 = nil;
        v476 = function(v681)
            -- upvalues: l_l_presets_0_1 (ref)
            local v682 = v681:get();
            l_l_presets_0_1.range:visibility(v682);
            l_l_presets_0_1.retreat:visibility(v682);
        end;
        l_l_presets_0_1.dev_mode:set_callback(v476, true);
        l_main_0.ai_peek = l_l_presets_0_1;
        l_l_recorder_0_1 = {
            enabled = l_l_state_0_0:switch("Logs")
        };
        v475 = l_l_recorder_0_1.enabled:create();
        l_l_recorder_0_1.output = v475:selectable("Output", {
            [1] = "Events", 
            [2] = "Render", 
            [3] = "Console"
        });
        l_l_recorder_0_1.hit_color = v475:color_picker("Hit Color", color(163, 211, 80, 255));
        l_l_recorder_0_1.miss_color = v475:color_picker("Miss Color", color(240, 191, 86, 255));
        l_l_recorder_0_1.background_color = v475:color_picker("Background Color", color(22, 22, 22, 255));
        l_l_recorder_0_1.logo = v475:combo("Logo", {
            [1] = "Off", 
            [2] = "!", 
            [3] = "Icon", 
            [4] = "Text"
        });
        l_l_recorder_0_1.glow = v475:slider("Glow", 0, 150, 100, nil, "%");
        l_l_recorder_0_1.offset = v475:slider("Offset", 1, 144, 60, 5, "px");
        l_l_recorder_0_1.duration = v475:slider("Duration", 1, 8, 5, nil, "s.");
        v476 = nil;
        v477 = function(v683)
            -- upvalues: l_l_recorder_0_1 (ref)
            local v684 = v683:get("Render");
            l_l_recorder_0_1.background_color:visibility(v684);
            l_l_recorder_0_1.logo:visibility(v684);
            l_l_recorder_0_1.glow:visibility(v684);
            l_l_recorder_0_1.offset:visibility(v684);
            l_l_recorder_0_1.duration:visibility(v684);
        end;
        l_l_recorder_0_1.output:set_callback(v477, true);
        l_main_0.logs = l_l_recorder_0_1;
        v475 = {
            enabled = l_l_state_0_0:switch("Dormant Aimbot")
        };
        v476 = v475.enabled:create();
        v475.hitboxes = v476:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Legs"
        });
        v475.alpha_modifier = v476:slider("Alpha Modifier", 0, 90, 80, nil, "%");
        v475.minimum_damage = v476:slider("Minimum Damage", 0, 130, 0, nil, function(v685)
            if v685 == 0 then
                return "Def.";
            elseif v685 > 100 then
                return "+" .. v685 - 100;
            else
                return;
            end;
        end);
        v458(v475.hitboxes);
        v258.push(1, v475.enabled);
        l_main_0.dormant_aimbot = v475;
        v476 = nil;
        v466:set_callback(function(v686)
            -- upvalues: l_l_state_0_0 (ref)
            local v687 = v686:get() == 2;
            l_l_state_0_0:visibility(v687);
        end, true);
        v384.ragebot = l_main_0;
    end;
    l_state_0 = {};
    l_settings_0 = v459.visuals;
    v31.add("##VISUALS", l_settings_0, "VISUALS");
    l_presets_0 = {};
    l_recorder_0 = {
        [1] = "5:4", 
        [2] = "4:3", 
        [3] = "16:9", 
        [4] = "16:10"
    };
    v475 = {
        ["4:3"] = 133, 
        ["5:4"] = 125, 
        ["16:10"] = 160, 
        ["16:9"] = 177
    };
    v476 = {};
    for v688 = 1, #l_recorder_0 do
        local v689 = l_recorder_0[v688];
        v476[v475[v689]] = v689;
    end;
    l_presets_0.enabled = l_settings_0:switch("Aspect Ratio");
    v477 = l_presets_0.enabled:create();
    do
        local l_l_settings_0_2, l_l_presets_0_2, l_v475_2, l_v476_3, l_v477_3, l_v478_1 = l_settings_0, l_presets_0, v475, v476, v477, v478;
        do
            local l_l_v476_3_0 = l_v476_3;
            l_l_presets_0_2.value = l_v477_3:slider("##VALUE", 1, 200, 177, 0.01, function(v697)
                -- upvalues: l_l_v476_3_0 (ref)
                return l_l_v476_3_0[v697] or nil;
            end);
            for v698 = 1, #l_recorder_0 do
                local v699 = l_recorder_0[v698];
                local v700 = l_v475_2[v699];
                do
                    local l_v700_0 = v700;
                    local function v702()
                        -- upvalues: l_l_presets_0_2 (ref), l_v700_0 (ref)
                        l_l_presets_0_2.value:set(l_v700_0);
                    end;
                    l_v477_3:button(v418(v699, (math.ceil(#v699 * 1.34))), v702, true);
                end;
            end;
            l_state_0.aspect_ratio = l_l_presets_0_2;
        end;
        l_recorder_0 = {
            enabled = l_l_settings_0_2:switch("Viewmodel")
        };
        l_v475_2 = l_recorder_0.enabled:create();
        l_recorder_0.fov = l_v475_2:slider("FOV", 2000, 17000, 6800, 0.01);
        l_recorder_0.offset_x = l_v475_2:slider("X", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_y = l_v475_2:slider("Y", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_z = l_v475_2:slider("Z", -2000, 2000, 0, 0.01);
        l_recorder_0.opposite_knife_hand = l_v475_2:switch("Opposite Knife Hand");
        l_state_0.viewmodel = l_recorder_0;
        l_v475_2 = {
            enabled = l_l_settings_0_2:switch("Indicators")
        };
        l_v476_3 = l_v475_2.enabled:create();
        l_v475_2.style = l_v476_3:list("Style", {
            [1] = "Stars", 
            [2] = "Pixel"
        });
        l_v475_2.offset = l_v476_3:slider("Offset", 0, 200, 32, nil, "px");
        l_v475_2.accent_color = l_v476_3:color_picker("Accent", color(172, 167, 209, 255));
        l_v475_2.secondary_color = l_v476_3:color_picker("Secondary", color(255, 255, 255, 255));
        l_state_0.indicators = l_v475_2;
        l_v476_3 = {
            enabled = l_l_settings_0_2:switch("Solus UI")
        };
        l_v477_3 = l_v476_3.enabled:create();
        l_v476_3.color = l_v477_3:color_picker("Color", color(172, 167, 209, 50));
        l_v476_3.select = l_v477_3:listable("##SELECT", {
            [1] = "Watermark", 
            [2] = "Spectators", 
            [3] = "Hotkey List", 
            [4] = "Anti-aimbot indication", 
            [5] = "Frequency update information"
        });
        l_v476_3.only_key_state = l_v477_3:switch("Only Key State", false);
        v458(l_v476_3.select);
        l_v478_1 = nil;
        v480 = function(v703)
            -- upvalues: l_v476_3 (ref)
            l_v476_3.only_key_state:visibility(v703:get("Hotkey List"));
        end;
        l_v476_3.select:set_callback(v480, true);
        l_state_0.solus_ui = l_v476_3;
        l_v477_3 = {
            enabled = l_l_settings_0_2:switch("Watermark")
        };
        l_v478_1 = l_v477_3.enabled:create();
        l_v477_3.style = l_v478_1:listable("Style", {
            [1] = "Branded", 
            [2] = "Corner"
        });
        l_v477_3.color = l_v478_1:color_picker("Color", color(172, 167, 209, 255));
        v458(l_v477_3.style, {
            [1] = "Branded"
        });
        l_state_0.watermark = l_v477_3;
        l_v478_1 = {
            enabled = l_l_settings_0_2:switch("Manual Arrows")
        };
        v480 = l_v478_1.enabled:create();
        l_v478_1.style = v480:list("Style", {
            [1] = "Invictus", 
            [2] = "Teamskeet", 
            [3] = "Modern", 
            [4] = "Ambani"
        });
        l_v478_1.animate_scope = v480:switch("Animate Scope", true);
        l_v478_1.dynamic_mode = v480:switch("Dynamic Mode", true);
        l_v478_1.offset = v480:slider("Offset", 5, 150, 40, nil, "px");
        l_v478_1.accent_color = v480:color_picker("Accent", color(172, 167, 209, 255));
        l_v478_1.secondary_color = v480:color_picker("Secondary", color(255, 255, 255, 255));
        local v704 = nil;
        local function v707(v705)
            -- upvalues: l_v478_1 (ref)
            local v706 = v705:get();
            l_v478_1.animate_scope:visibility(v706 == 3);
            l_v478_1.dynamic_mode:visibility(v706 == 1 or v706 == 4);
        end;
        l_v478_1.style:set_callback(v707, true);
        l_state_0.manual_arrows = l_v478_1;
        v480 = {
            enabled = l_l_settings_0_2:switch("Custom Scope")
        };
        v704 = v480.enabled:create();
        v480.offset = v704:slider("Offset", 0, 500, 10, nil, "px");
        v480.position = v704:slider("Position", 0, 500, 105, nil, "px");
        v480.thickness = v704:slider("Thickness", 1, 10, 1, nil, "px");
        v480.accent_color = v704:color_picker("Accent", color(255, 255, 255, 255));
        v480.secondary_color = v704:color_picker("Secondary", color(255, 255, 255, 0));
        v480.extra_options = v704:selectable("Extra Options", {
            [1] = "Rotate Angle", 
            [2] = "Dynamic Offset"
        });
        v480.exclude_lines = v704:selectable("Exclude Lines", {
            [1] = "Left", 
            [2] = "Top", 
            [3] = "Right", 
            [4] = "Bottom"
        });
        l_state_0.custom_scope = v480;
        v704 = {
            enabled = l_l_settings_0_2:switch("Damage Indicator")
        };
        v707 = v704.enabled:create();
        v704.if_override = v707:switch("If override");
        v704.font = v707:combo("Font", {
            [1] = "Default", 
            [2] = "Alternative"
        });
        v704.offset = v707:slider("Offset", 2, 8, 2, nil, "px");
        v704.active_color = v707:color_picker("Active Color", color(172, 167, 209, 255));
        v704.inactive_color = v707:color_picker("Inactive Color", color(255, 255, 255, 100));
        local v708 = nil;
        local function v710(v709)
            -- upvalues: v704 (ref)
            v704.inactive_color:visibility(not v709:get());
        end;
        v704.if_override:set_callback(v710, true);
        l_state_0.damage_indicator = v704;
        v707 = {
            enabled = l_l_settings_0_2:switch("Break LC Indicator")
        };
        v258.push(1, v707.enabled);
        l_state_0.break_lc_indicator = v707;
        v708 = {
            enabled = l_l_settings_0_2:switch("Velocity Warning")
        };
        v710 = v708.enabled:create();
        v708.color_accent = v710:color_picker("Accent Color", color(255, 255, 255, 200));
        v708.color_secondary = v710:color_picker("Secondary Color", color(150, 150, 150, 255));
        l_state_0.velocity_warning = v708;
        v710 = {
            enabled = l_l_settings_0_2:switch("Gamesense Indicators")
        };
        local v711 = v710.enabled:create();
        v710.spectator_list = v711:switch("Spectator List", true);
        v710.feature_list = v711:listable("Indicators", {
            [1] = "Hit/Miss", 
            [2] = "Dormant Aimbot", 
            [3] = "Damage Override", 
            [4] = "Hitchance Override", 
            [5] = "Lag Compensation", 
            [6] = "Hitbox Override", 
            [7] = "Fake Latency", 
            [8] = "Fake Angles", 
            [9] = "Fake Duck", 
            [10] = "Body Aim", 
            [11] = "Safe Points", 
            [12] = "Freestanding", 
            [13] = "Bomb Info", 
            [14] = "Hide Shots", 
            [15] = "Double Tap"
        });
        v458(v710.feature_list, {
            [1] = "Damage Override", 
            [2] = "Fake Latency", 
            [3] = "Fake Duck", 
            [4] = "Body Aim", 
            [5] = "Safe Points", 
            [6] = "Freestanding", 
            [7] = "Bomb Info", 
            [8] = "Hide Shots", 
            [9] = "Double Tap"
        });
        l_state_0.gamesense_indicators = v710;
        v711 = {
            enabled = l_l_settings_0_2:switch("Grenade Radius")
        };
        local v712 = v711.enabled:create();
        v711.molotov = v712:switch("Molotov", true);
        v711.molotov_color = v711.molotov:color_picker(color(245, 90, 90, 255));
        v711.smoke = v712:switch("Smoke", true);
        v711.smoke_color = v711.smoke:color_picker(color(130, 130, 255, 255));
        v258.push(1, v711.enabled);
        local v713 = nil;
        local function v715(v714)
            -- upvalues: v711 (ref)
            if not v714:get() and not v711.smoke:get() then
                v711.smoke:set(true);
            end;
        end;
        local function v717(v716)
            -- upvalues: v711 (ref)
            if not v716:get() and not v711.molotov:get() then
                v711.molotov:set(true);
            end;
        end;
        v711.molotov:set_callback(v715);
        v711.smoke:set_callback(v717);
        l_state_0.grenade_radius = v711;
        v712 = {
            label = l_l_settings_0_2:label("Static Watermark")
        };
        v713 = v712.label:create();
        v712.style = v713:list("Style", {
            [1] = "Classic", 
            [2] = "Modern"
        });
        v712.position = v713:combo("Position", {
            [1] = "Bottom", 
            [2] = "Left", 
            [3] = "Right"
        });
        v712.remove_spaces = v713:switch("Remove Spaces");
        v712.color = v713:color_picker("Color", color(142, 165, 229, 255));
        v713 = nil;
        v715 = function()
            -- upvalues: l_v477_3 (ref), l_v475_2 (ref), l_v476_3 (ref), v712 (ref)
            local v718 = l_v477_3.enabled:get() or l_v475_2.enabled:get();
            local v719 = l_v476_3.enabled:get() and l_v476_3.select:get("Watermark");
            v712.label:disabled(v718 or v719);
        end;
        l_v477_3.enabled:set_callback(v715);
        l_v475_2.enabled:set_callback(v715);
        l_v476_3.enabled:set_callback(v715);
        l_v476_3.select:set_callback(v715);
        v715();
        l_state_0.static_watermark = v712;
        v713 = nil;
        v466:set_callback(function(v720)
            -- upvalues: l_l_settings_0_2 (ref)
            local v721 = v720:get() == 3;
            l_l_settings_0_2:visibility(v721);
        end, true);
        v384.visuals = l_state_0;
    end;
    l_settings_0 = {};
    l_presets_0 = v459.misc;
    v31.add("##MISC", l_presets_0, "MISC");
    l_settings_0.clantag = {
        enabled = l_presets_0:switch("Clantag")
    };
    l_settings_0.trashtalk = {
        enabled = l_presets_0:switch("Trashtalk")
    };
    v476 = {
        enabled = l_presets_0:switch("Fast Ladder")
    };
    v258.push(2, v476.enabled);
    l_settings_0.fast_ladder = v476;
    v477 = {
        enabled = l_presets_0:switch("Edge Stop")
    };
    v258.push(1, v477.enabled);
    l_settings_0.edge_stop = v477;
    v478 = {
        enabled = l_presets_0:switch("Collision Air Duck")
    };
    v258.push(1, v478.enabled);
    l_settings_0.collision_air_duck = v478;
    v480 = {
        enabled = l_presets_0:switch("No Fall Damage")
    };
    v258.push(2, v480.enabled);
    l_settings_0.no_fall_damage = v480;
    local v722 = {
        enabled = l_presets_0:switch("Super Toss")
    };
    v258.push(2, v722.enabled);
    l_settings_0.super_toss = v722;
    local v723 = {
        enabled = l_presets_0:switch("Grenade Release")
    };
    v723.damage = v723.enabled:create():slider("Damage", 1, 50, 35, nil, "hp");
    v258.push(2, v723.enabled);
    l_settings_0.grenade_release = v723;
    local v724 = {
        enabled = l_presets_0:switch("Fps Optimize")
    };
    local v725 = v724.enabled:create();
    v724.always_on = v725:switch("Always on");
    v724.detections = v725:selectable("Detections", {
        [1] = "Peeking", 
        [2] = "Hit Flag"
    });
    v724.select = v725:selectable("Optimizations", {
        [1] = "Fog", 
        [2] = "Blood", 
        [3] = "Bloom", 
        [4] = "Decals", 
        [5] = "Shadows", 
        [6] = "Sprites", 
        [7] = "Particles", 
        [8] = "Ropes", 
        [9] = "Dynamic lights", 
        [10] = "Map details", 
        [11] = "Weapon effects", 
        [12] = "Teammates"
    });
    v458(v724.detections);
    v458(v724.select, {
        [1] = "Blood", 
        [2] = "Decals", 
        [3] = "Sprites", 
        [4] = "Ropes", 
        [5] = "Dynamic lights", 
        [6] = "Weapon effects"
    });
    local v726 = nil;
    do
        local l_l_presets_0_3, l_v724_0, l_v726_0 = l_presets_0, v724, v726;
        local function v731(v730)
            -- upvalues: l_v724_0 (ref)
            l_v724_0.detections:visibility(not v730:get());
        end;
        l_v724_0.always_on:set_callback(v731, true);
        l_settings_0.fps_optimize = l_v724_0;
        v725 = {
            enabled = l_l_presets_0_3:switch("Ping Unlocker")
        };
        v725.value = v725.enabled:create():slider("Latency", 0, 200, 0, nil, "ms");
        v258.push(2, v725.enabled);
        l_settings_0.ping_unlocker = v725;
        l_v726_0 = {
            enabled = l_l_presets_0_3:switch("Animation Breaker")
        };
        v731 = l_v726_0.enabled:create();
        l_v726_0.air_legs = v731:combo("Air Legs", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Haram"
        });
        l_v726_0.ground_legs = v731:combo("Ground Legs", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Allah", 
            [5] = "Kangaroo"
        });
        l_v726_0.legs_offset_1 = v731:slider("Offset 1", 0, 100, 100);
        l_v726_0.legs_offset_2 = v731:slider("Offset 2", 0, 100, 100);
        l_v726_0.body_lean = v731:slider("Body Lean", -1, 100, -1, nil, function(v732)
            return v732 == -1 and "Off" or v732 .. "%";
        end);
        l_v726_0.pitch_on_land = v731:switch("Pitch on Land", true);
        v258.push(2, l_v726_0.enabled);
        local v733 = nil;
        local function v736(v734)
            -- upvalues: l_v726_0 (ref)
            local v735 = v734:get() == "Jitter";
            l_v726_0.legs_offset_1:visibility(v735);
            l_v726_0.legs_offset_2:visibility(v735);
        end;
        l_v726_0.ground_legs:set_callback(v736, true);
        l_settings_0.animation_breaker = l_v726_0;
        v731 = {
            label = l_l_presets_0_3:label("Fake Duck")
        };
        v731.options = v731.label:create():selectable("Options", {
            [1] = "Unlock Speed", 
            [2] = "On Freezetime"
        });
        v258.push(2, v731.label);
        v258.push(2, v731.options, {});
        l_settings_0.fake_duck = v731;
        v733 = {
            label = l_l_presets_0_3:label("Nickname Generator")
        };
        v736 = v733.label:create();
        v733.input = v736:input("##INPUT");
        v733.set_button = v736:button(v418("Set", 11), nil, false);
        v733.generate_button = v736:button(v418("Generate", 5), nil, true);
        v733.reset_button = v736:button(v418("Reset", 8), nil, true);
        l_settings_0.nickname_generator = v733;
        v736 = nil;
        v466:set_callback(function(v737)
            -- upvalues: l_l_presets_0_3 (ref)
            local v738 = v737:get() == 4;
            l_l_presets_0_3:visibility(v738);
        end, true);
        v384.misc = l_settings_0;
    end;
    l_presets_0 = nil;
    l_recorder_0 = ui.get_icon("sparkles");
    l_presets_0 = v29.create("~", "##COPYRIGHT", v395):label(v10("\a{Link Active}", l_recorder_0, l_v414_0(4), v13.name, "\aDEFAULT", " \226\128\148 2025"));
end;
v394 = nil;
v394 = {};
v395 = 0;
v398 = 0;
v394.is_onground = false;
v394.is_moving = false;
v394.is_crouched = false;
v394.is_peeking = false;
v394.is_vulnerable = false;
v394.velocity2d = 0;
v394.duck_amount = 0;
v394.team_num = 0;
v394.sent_packets = 0;
v394.forwardmove = 0;
v394.sidemove = 0;
v414 = function(v739, v740, v741)
    return v739 + v740 * (v741 * globals.tickinterval);
end;
do
    local l_v395_1, l_v398_2, l_v414_1, l_v418_0 = v395, v398, v414, v418;
    l_v418_0 = function(v746)
        -- upvalues: l_v414_1 (ref)
        local v747 = false;
        local v748 = false;
        local l_m_vecVelocity_0 = v746.m_vecVelocity;
        local v750 = v746:get_eye_position();
        local v751 = l_v414_1(v750, l_m_vecVelocity_0, 14);
        local v752 = entity.get_players(true);
        local v753 = entity.get_threat(true);
        for v754 = 1, #v752 do
            local v755 = v752[v754];
            if v755:is_alive() then
                if v755 == v753 then
                    v748 = true;
                else
                    local v756 = v755:get_hitbox_position(0);
                    local v757 = l_v414_1(v756, l_m_vecVelocity_0, 4);
                    local v758 = utils.trace_bullet(v746, v751, v757);
                    if v758 ~= nil and v758 > 0 then
                        v747 = true;
                        break;
                    end;
                end;
            end;
        end;
        return v747, v748;
    end;
    local function v763(v759)
        -- upvalues: l_v418_0 (ref), l_v395_1 (ref), v394 (ref)
        local v760 = entity.get_local_player();
        if v760 == nil then
            return;
        else
            local v761, v762 = l_v418_0(v760);
            l_v395_1 = v760.m_fFlags;
            v394.velocity2d = v760.m_vecVelocity:length2d();
            v394.is_peeking = v761;
            v394.is_vulnerable = v762;
            if v759.choked_commands == 0 then
                v394.duck_amount = v760.m_flDuckAmount;
                v394.sent_packets = v394.sent_packets + 1;
            end;
            v394.is_moving = v394.velocity2d > 3.63;
            v394.is_crouched = v394.duck_amount > 0;
            v394.team_num = v760.m_iTeamNum;
            v394.forwardmove = v759.forwardmove;
            v394.sidemove = v759.sidemove;
            return;
        end;
    end;
    local function v766(_)
        -- upvalues: l_v398_2 (ref), v394 (ref), l_v395_1 (ref)
        local v765 = entity.get_local_player();
        if v765 == nil then
            return;
        else
            l_v398_2 = v765.m_fFlags;
            v394.is_onground = bit.band(l_v395_1, 1) == 1 and bit.band(l_v398_2, 1) == 1;
            return;
        end;
    end;
    events.createmove(v763);
    events.createmove_run(v766);
end;
v395 = nil;
v395 = {};
v398 = nil;
v414 = 0;
v395.max_defensive_ticks = 0;
v395.defensive_ticks = 0;
v395.teleport_units_sqr = 0;
do
    local l_v398_3, l_v414_2, l_v418_1 = v398, v414, v418;
    l_v418_1 = function(v770)
        -- upvalues: l_v414_2 (ref), v395 (ref)
        local l_m_nTickBase_0 = v770.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_v414_2) > 64 then
            l_v414_2 = 0;
        end;
        local v772 = 0;
        if l_v414_2 < l_m_nTickBase_0 then
            l_v414_2 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v414_2 then
            v772 = math.min(14, math.max(0, l_v414_2 - l_m_nTickBase_0 - 1));
        end;
        if v772 > 0 then
            if v395.max_defensive_ticks == 0 then
                v395.max_defensive_ticks = v772;
            end;
            v395.defensive_ticks = v772;
        else
            v395.defensive_ticks = 0;
            v395.max_defensive_ticks = 0;
        end;
    end;
    local function v775(v773, v774)
        -- upvalues: v395 (ref)
        v395.teleport_units_sqr = (v774 - v773):lengthsqr();
    end;
    local function v780(v776)
        -- upvalues: l_v398_3 (ref), v775 (ref)
        local v777 = v776:get_simulation_time();
        if v777 == nil then
            return;
        else
            local l_m_vecOrigin_0 = v776.m_vecOrigin;
            if l_v398_3 ~= nil then
                local v779 = to_ticks(v777.current - v777.old);
                if v779 < 0 or v779 > 0 and v779 <= 64 then
                    v775(l_v398_3, l_m_vecOrigin_0);
                end;
            end;
            l_v398_3 = l_m_vecOrigin_0;
            return;
        end;
    end;
    local function v782()
        -- upvalues: l_v418_1 (ref)
        local v781 = entity.get_local_player();
        if v781 == nil then
            return;
        else
            l_v418_1(v781);
            return;
        end;
    end;
    local function v784()
        -- upvalues: v780 (ref)
        local v783 = entity.get_local_player();
        if v783 == nil then
            return;
        else
            v780(v783);
            return;
        end;
    end;
    events.createmove(v782);
    events.net_update_start(v784);
end;
v398 = nil;
v398 = {};
v414 = nil;
v418 = function()
    -- upvalues: v394 (ref), v26 (ref)
    if v394.is_onground then
        if v26.antiaim.misc.slow_walk:get() then
            return "Slow motion";
        elseif not v394.is_moving then
            if v394.is_crouched then
                return "Crouching";
            else
                return "Standing";
            end;
        elseif v394.is_crouched then
            return "Move & Crouching";
        else
            return "Running";
        end;
    else
        return v394.is_crouched and "Air & Crouching" or "Air";
    end;
end;
do
    local l_v414_3, l_v418_2 = v414, v418;
    local function v787()
        -- upvalues: l_v414_3 (ref), l_v418_2 (ref)
        l_v414_3 = l_v418_2();
    end;
    v398.get = function()
        -- upvalues: l_v414_3 (ref)
        return l_v414_3;
    end;
    events.createmove(v787);
end;
v414 = nil;
v414 = {};
v418 = v28:new();
local v788 = {};
local function v792(v789)
    local l_tickcount_0 = globals.tickcount;
    local v791 = v789:get_eye_position();
    return {
        tick = l_tickcount_0, 
        player = v789, 
        eye_pos = v791, 
        impacts = {}
    };
end;
do
    local l_v418_3, l_v788_0, l_v792_0 = v418, v788, v792;
    local function v798(v796)
        -- upvalues: l_v788_0 (ref), l_v792_0 (ref)
        local v797 = entity.get(v796.userid, true);
        if v797 == nil then
            return;
        else
            table.insert(l_v788_0, l_v792_0(v797));
            return;
        end;
    end;
    local function v804(v799)
        -- upvalues: l_v788_0 (ref)
        local v800 = entity.get(v799.userid, true);
        local v801 = entity.get(v799.attacker, true);
        if v800 == nil or v801 == nil then
            return;
        else
            for v802 = #l_v788_0, 1, -1 do
                local v803 = l_v788_0[v802];
                if v803.player == v801 then
                    v803.victim = v800;
                    v803.damage = v799.dmg_health;
                    v803.hitgroup = v799.hitgroup;
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v810(v805)
        -- upvalues: l_v788_0 (ref)
        local v806 = entity.get(v805.userid, true);
        if v806 == nil then
            return;
        else
            for v807 = #l_v788_0, 1, -1 do
                local v808 = l_v788_0[v807];
                if v808.player == v806 then
                    local v809 = vector(v805.x, v805.y, v805.z);
                    table.insert(v808.impacts, v809);
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v822()
        -- upvalues: l_v788_0 (ref), l_v418_3 (ref), v14 (ref)
        local v811 = entity.get_local_player();
        if v811 == nil then
            return;
        else
            local v812 = nil;
            if v811:is_alive() then
                v812 = v811:get_hitbox_position(0);
            end;
            for v813 = 1, #l_v788_0 do
                local v814 = l_v788_0[v813];
                local v815 = #v814.impacts;
                if v815 ~= 0 then
                    local l_eye_pos_0 = v814.eye_pos;
                    local v817 = v814.impacts[v815];
                    l_v418_3.player_shot:fire({
                        tick = v814.tick, 
                        player = v814.player, 
                        victim = v814.victim, 
                        eye_pos = l_eye_pos_0, 
                        end_pos = v817, 
                        damage = v814.damage, 
                        hitgroup = v814.hitgroup
                    });
                    if v812 ~= nil and v814.player:is_enemy() then
                        local v818 = v14.closest_ray_point(l_eye_pos_0, v817, v812, true);
                        local v819 = v812.distsqr(v812, v818);
                        if v819 <= 6400 then
                            local v820 = math.sqrt(v819);
                            l_v418_3.enemy_shot:fire({
                                tick = v814.tick, 
                                distance = v820, 
                                player = v814.player, 
                                victim = v814.victim, 
                                eye_pos = l_eye_pos_0, 
                                end_pos = v817, 
                                damage = v814.damage, 
                                hitgroup = v814.hitgroup
                            });
                        end;
                    end;
                end;
            end;
            for v821 = 1, #l_v788_0 do
                l_v788_0[v821] = nil;
            end;
            return;
        end;
    end;
    v414.get_event_bus = function()
        -- upvalues: l_v418_3 (ref)
        return l_v418_3;
    end;
    events.weapon_fire(v798);
    events.player_hurt(v804);
    events.bullet_impact(v810);
    events.net_update_start(v822);
end;
v418 = nil;
v418 = {};
v788 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/=";
v792 = ".\\" .. v13.name;
local v823 = v792 .. "\\db.dat";
local v824 = {};
do
    local l_v788_1, l_v792_1, l_v823_0, l_v824_0 = v788, v792, v823, v824;
    local function v829()
        -- upvalues: l_v823_0 (ref)
        return files.read(l_v823_0);
    end;
    local function v832(v830, v831)
        -- upvalues: l_v823_0 (ref)
        if v831 == nil then
            v831 = false;
        end;
        return files.write(l_v823_0, v830, v831);
    end;
    local function v838(v833)
        -- upvalues: l_base64_0 (ref), l_v788_1 (ref)
        local l_status_0, l_result_0 = pcall(json.stringify, v833);
        if not l_status_0 then
            return false, l_result_0;
        else
            local l_status_1, l_result_1 = pcall(l_base64_0.encode, l_result_0, l_v788_1);
            l_result_0 = l_result_1;
            if not l_status_1 then
                return false, l_result_0;
            else
                return true, l_result_0;
            end;
        end;
    end;
    local function v844(v839)
        -- upvalues: l_base64_0 (ref), l_v788_1 (ref)
        local l_status_2, l_result_2 = pcall(l_base64_0.decode, v839, l_v788_1);
        if not l_status_2 then
            return false, l_result_2;
        else
            local l_status_3, l_result_3 = pcall(json.parse, l_result_2);
            l_result_2 = l_result_3;
            if not l_status_3 then
                return false, l_result_2;
            else
                return true, l_result_2;
            end;
        end;
    end;
    local function v848(v845)
        -- upvalues: l_v792_1 (ref), v838 (ref), v30 (ref), v832 (ref)
        files.create_folder(l_v792_1);
        local v846, v847 = v838(v845);
        if not v846 then
            v30.error("Unable to encode data");
            return false;
        elseif not v832(v847) then
            v30.error("Unable to write db");
            return false;
        else
            return true;
        end;
    end;
    local function v852()
        -- upvalues: l_v792_1 (ref), v829 (ref), v848 (ref), v30 (ref), v844 (ref)
        files.create_folder(l_v792_1);
        local v849 = v829();
        if v849 == nil then
            if not v848({}) then
                v30.log("Unable to create db");
            end;
            return {};
        else
            local v850, v851 = v844(v849);
            if not v850 then
                v30.error("Unable to decode db");
                v30.log("Trying to flush db");
                if not v848({}) then
                    v30.error("Unable to flush db");
                end;
                return {};
            else
                return v851;
            end;
        end;
    end;
    local v858 = {
        __index = function(_, v854)
            -- upvalues: l_v824_0 (ref)
            return l_v824_0[v854];
        end, 
        __newindex = function(_, v856, v857)
            -- upvalues: l_v824_0 (ref), v848 (ref)
            l_v824_0[v856] = v857;
            v848(l_v824_0);
        end
    };
    l_v824_0 = v852();
    setmetatable(v418, v858);
end;
v788 = nil;
v788 = {};
v792 = {};
do
    local l_v792_2 = v792;
    v823 = function()
        -- upvalues: l_v792_2 (ref)
        local v860 = ui.get_binds();
        for v861 in pairs(l_v792_2) do
            l_v792_2[v861] = nil;
        end;
        for v862 = 1, #v860 do
            local v863 = v860[v862];
            l_v792_2[v863.reference:id()] = v863;
        end;
    end;
    v788.get = function(v864)
        -- upvalues: l_v792_2 (ref)
        if v864 == nil then
            return nil;
        else
            return l_v792_2[v864:id()];
        end;
    end;
    events.render(v823);
end;
v792 = nil;
v823 = v384.links;
v824 = nil;
local function v865()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BtbuapEw4e");
end;
local function v866()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://youtube.com/channel/UCT78kJfwruisG8w4u8LOEkQ");
end;
local function v867()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=5QrOCS");
end;
v823.discord:set_callback(v865);
v823.youtube:set_callback(v866);
v823.config:set_callback(v867);
v823 = nil;
v823 = {};
v824 = v384.configs;
v865 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v866 = "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoeQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBosRpsUCfjfIG9foE7BrUnzsfngov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBr8YgoR0zsfHSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQ4eldBs92zaf7gr9YgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBa92BaM2BHldzIG9fofYgr80zaBYBeldzoElBP7ASVf2BaMYBsMlBsm9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoBrBaBngrfCgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHgobYgs9lgag9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfrzsfnzaMlBsv9fowxSVfCgr9nzsyrgrN9foD2ht29foylgoblgoBngHldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMngoy1BaBHSVfjqHldgaMHBaU1BoEHBeldzIG9foBHBrUCgrfnBoZ9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBof1Brf1go9CBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrBsBCBsM0Bap9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofngo8HBoBnBrZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgsBYgoMCzak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlgrB1goRnzsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHBr81BoEYza39fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzoEASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzsECBrfrgsy1SVfjqHldBo9Ygob1Br9lSVfjBokQhS7ASVfHBryrBo91gre9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofCgabCBaUCgsZ9fowxSVfCgr9nzsyrgrN9foDCBaUYht29fofHgrRrgsM7zak9fowxSVfCgr9nzsyrgrN9foDrht29foB1Brb1BsB1grZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fo8HgrfYzaBCBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsB0grR1BaRnSVfjcIZAcV29foB2goU2BrM7zZldz50HcilASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfngsbHBaBYzsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYgafngobHBag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtURkeUbQRfoDdqHldBsMlgo91BobrBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEnBo9YgaUlga39fowxSVfCgr9nzsyrgrN9foDCht29foE1zsMlgaE0gom9fowxSVfCgr9nzsyrgrN9foDrgS7ASVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrRlBa80BrN9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsfnzaRYgaE0SVfjqHldBo9Ygob1Br9lSVfjBreQ4eldBo81BrRrBoMCzeldzIG9fofYgr80zaBYBeldzofHht29fof0grbngaElgoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgafHgrRCgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoflgsUYzsm9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDYhSHQ4eldBoM1zsBCzsf2BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBoM1zsE7goRCgpldzIG9fofYgr80zaBYBeldzoElBP7ASVfCBay0Brf0BoMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBablBoBlgr8rSVfjqHldBo9Ygob1Br9lSVfjgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBngo90zs9lBpldzIG9fofYgr80zaBYBeldzoZQ4eldBrU7BsUHBsflzZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB2Br9CgsRlBsf0zablgaUASVf2gr9ngrO9foDl4oyCgrUHBsMHBaf1BsRCga9ASVf2gr9nzak9foDl4o8rzsf2gs9lgr9YzabrBakQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7zs9lBoR1goN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1lza8CgrUHBsf2Bsf2gaMngd29foEYgr8YgpldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9nzak9foDl4oM1gofYgaR2BoE2BoE7Ba8nhZHQht29foflzsMHBsRlBs39foDlhS7ASVf0goU1BoErgrO9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBr9CgsU0BsEngoE2gaylgC29foEYgr8YgpldzoM6grU0BaE0gofCzaMCgrB7gV29foEYgr81gHldzoM6zsU2Bs9ngsBrgob0BaBHgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfCzaR1gsfCBsB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoEHht29fofYgoBrgaE7Brm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoMHzab7goy1SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0gry1zsfnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBs8lzabYBoO9fowxSVfCgr9nzsyrgrN9foDlht29foElgay0grR1Brk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2Ba9Cgry7grR7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsE2BoECzaflgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE2BrflBrUlgrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BsRCgs87gr9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Bs9nBrRlBr97SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsflBab2goECBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECgoRlzsRrgr39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BoyCBob1BsbYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsf0goUrBoR2gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foErBs92BoU1BZldzIG9fofYgr80zaBYBeldzoylht29foErBo8ngrMrgrv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrUlzaM7goblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU2BafCgaBrBpldzIG9fofYgr80zaBYBeldzoylht29foE7Bry7grMHBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaUngr9lzaylSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsU7zaE0gsElBeldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoU1zsMYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBrf1BsU2gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBngaMHBoyrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsUlgs9CgrbYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsR1Ba81gay0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goE2BrfHzsRCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs82BoE1BaMlBpldzIG9fofYgr80zaBYBeldzovQ4eldBs8CBsRYzabrBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEngrM1gsBHBrk9fowxSVfCgr9nzsyrgrN9foDlht29foEngryYBsy1gsN9fowxSVfCgr9nzsyrgrN9foDlht29foEnzsElgsE7gov9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2gob1gaMYga8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs9lBa8YgayCBHldzIG9fofYgr80zaBYBeldzoRlht29foEYBsB0Bofnzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2grEHBr9HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs9rzsbrzaE2BpldzIG9fofYgr80zaBYBeldzoRlht29foEYgaBrgaRCgoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaf2BrRYzsU2SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsyCzsfCgoyrBpldzIG9fofYgr80zaBYBeldzoRlht29foE1gaE7Brf2zsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU0BayYgryCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaU0Br91Bay7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyHBo9nBa8lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1gofHzaf2gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsyngoy0gabCgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1zaUHzsM2Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zabnBrRrBobnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsb2BaU1gr82geldzIG9fofYgr80zaBYBeldzoRlht29foE0BsyrgrUrgo39fowxSVfCgr9nzsyrgrN9foDlht29foE0Bo9ngoM7Bo39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2zs92grUHBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsbYzs8HzsBrgHldzIG9fofYgr80zaBYBeldzovQ4eldBsb1goElBr80BHldzIG9fofYgr80zaBYBeldzoRlht29foflBafCgrM2zsg9fowxSVfCgr9nzsyrgrN9foDCht29foflBobrzsbYBrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaUrgsB7BaR7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7grf2BoUnBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgo81zsR1ga39fowxSVfCgr9nzsyrgrN9foDCht29fof2BaB0BrU1gr39fowxSVfCgr9nzsyrgrN9foDlht29fof2BaUYBsUnBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsE1zaU1zsBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEngrfHzab7zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEYgoy0Bs81zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoE0BaMlgaUCgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCBsBCBofCBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoBHBrE1gab7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBoB0gaM0grMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBof1BrMlBoB0gpldzIG9fofYgr80zaBYBeldzoRlht29fofCzs91goUHgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBrUngoyHgrZ9fowxSVfCgr9nzsyrgrN9foDCht29fofrgsUlgsE0Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgaMlBobCBZldzIG9fofYgr80zaBYBeldzoylht29fof7gof7BsbnBs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgab7goU0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsR0zayHzs80SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBo8lBaf7go90zeldzIG9fofYgr80zaBYBeldzovQ4eldBo8lBrB1BsbHgZldzIG9fofYgr80zaBYBeldzoRlht29fofnBsUYBayngZldzIG9fofYgr80zaBYBeldzoRlht29fofnBrE7zsUnzag9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgo8lzs82zaBHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrf1zaR7grE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9rgsBnBsf0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7BoUCgrfCzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1gsMYBo9Hzap9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCza87za82zsMYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYBab7grRrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYgsE2gay1gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1zsy1Bof2zae9fowxSVfCgr9nzsyrgrN9foDCht29fof0BaEYzabrgav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsEngoflzsbCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsE1gaR0BsN9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsfngaMngofHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobrBr87gsR0gpldzIG9fofYgr80zaBYBeldzovQ4eldBobrgo9YBayHBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof0gsUCBsMYgr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBaR0zaMCBo39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBayCgr8CgryYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrElBob2gaMrzZldzIG9fofYgr80zaBYBeldzoRlht29foB2BaR7gsBCzsZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bs91grbrzse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsfHBrElBrRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsUYBrM2zs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrE7zsfYBaB7geldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBaR2goflgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBoU1BsUHBpldzIG9fofYgr80zaBYBeldzoRlht29foB2goEYzaElgrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrBs9rBrM2BsE7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsyCzaRngabYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfrgs8lgrU0gpldzIG9fofYgr80zaBYBeldzoRlht29foBCgaylga8ngrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBo87BrRnBaErSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoylzsfnBrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrf0Bay0goBlBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaRlgo8HBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrfCBoEHBsE1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrB7grU2BsRnzZldzIG9fofYgr80zaBYBeldzoRlht29foBrgoMHga91Bsp9fowxSVfCgr9nzsyrgrN9foDCht29foBrgoR1zaEYgag9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaMlBs8Cgs81SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUrBrBYzsU1zZldzIG9fofYgr80zaBYBeldzoylht29foB7Bry7gsbngsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaU7gaf0gofYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gsbnzsM0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUHBsEnzsEYBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB7goflBrUCzaO9fowxSVfCgr9nzsyrgrN9foDCht29foB7zaU2BoyCBrg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgayngr9lBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYBaBnBay0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYgoE2zsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHzafHgsyrgok9fowxSVfCgr9nzsyrgrN9foDCht29foBHza9rBsfCgHldzIG9fofYgr80zaBYBeldzoRlht29foBnBa9Hza91grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoECgsBlgo8rSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgoEYBs91zsfrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr87gsyrBobrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8nBafCgsElBHldzIG9fofYgr80zaBYBeldzoNQ4eldBr8YzaR7BoflgZldzIG9fofYgr80zaBYBeldzovQ4eldBr81BrR2goflgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBaE1BoECgsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgrEHzsRHgs9rSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9ngry0BsMYgpldzIG9fofYgr80zaBYBeldzovQ4eldBr91zaB1BobnBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYzsBCgsy0zZldzIG9fofYgr80zaBYBeldzoNQ4eldBry7gry7gry2BHldzIG9fofYgr80zaBYBeldzoRlht29foB1gay7go80zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrza8rzaBrBrMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzabCBaR0goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrblBaBlgrf1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrblgoB7BaRCBpldzIG9fofYgr80zaBYBeldzoylht29foB0BsU1BofHgpldzIG9fofYgr80zaBYBeldzoylht29foB0Bo9ngo9ngrZ9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzs9HBo9HBoBrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzsy0Bs9YBayYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMlgrBrza8ngeldzIG9fofYgr80zaBYBeldzoRlht29foUlBsf7Baf1zaZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaR7za9rBeldzIG9fofYgr80zaBYBeldzoylht29foUlzsM7Ba92gr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BsB0Ba92za9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsRHBrfHBobYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaEYBrBlza91geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2za9lBoUCgsp9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoEYgoylzsR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaf1zsRHBrBCBHldzIG9fofYgr80zaBYBeldzoylht29foUCzabngs8lSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaB2BoM7gsB2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU7za92gsECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaUHBrB1zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU1zaMrzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga97zaRnzaMHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7zsfrzs8Hzak9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHBaUYzsUrgsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBsE0go81BrO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBrUnza9YBoN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBrRYBaRrzav9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsB2Bs9ngaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsyYBoR1BrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBsBrgsy0gop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBoR7gaBlBok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBrElgsU2grk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngafrBsyHBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngs80gsEngsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfnzaBCBsfHzsm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfnzaRrBoBnzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo81zsfCBa9HgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9lBa9Hgrb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CzsBHzsUCgeldzIG9fofYgr80zaBYBeldzoNQ4eldgr82BablzsBCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgry0zsb1Bab0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza8HBrECzsyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza9CgoyYBrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BrE0grU7BrO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0ga9YgaRYgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0gsB0zsy2gav9fowxSVfCgr9nzsyrgrN9foDCht29fobHgoyrgrfCgpldzIG9fofYgr80zaBYBeldzoRlht29fobYBabYBsR7geldzIG9fofYgr80zaBYBeldzoRlht29fob1zsUYBsBlBeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgtmRgWRbmeRpQNXSfdzdvxSVf2zay1BrRlzaB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCzs9Yza80geldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7ew9dM5fEgCcYZoXip6OCfjfIG9foE0Baf7BsM0BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgry7gaflzsElSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhUYvKkFgDXF0IfoDdqHldBrb1zaR7BsR2gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foR0zaU2BsE0BpldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7O3XnZA8F9dzdvxSVfCBsR2BrMngs82SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfnBo8YBsMnBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7OCOFZrkie6Oip6OCfjfIG9foflgryCBay0gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsU0BrU7BsbnSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhsFe6kFeAfep3kCfjfIG9foB7BofCzsy0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR7grB1Bay1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7HKk5RyvdNa95QH8n3wc59dzdvxSVf2BsbngoRHgrf2SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBoEHgsM0go8nBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7Q6fPZrOtfjfIG9foEnBrR2zaE7Bo39fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVf2grB2goR7BoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRIZ6c5p6OCfjfIG9foECgsRnBrbCBog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr8YBaMrgrfrSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhRne5OtNfOFebfoDdqHldBo91za8HgrE7gHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBnzsB7zsU2Bsp9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsXieCOFUdzdvxSVf2grynzsB0goU0SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBsy1BrU2BoUnBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHgAcY9ycFQ7XFQ6foDdqHldBsfHBrblBsE1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBlgrB1gsf0Bsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQskie6Oip6OCfjfIG9fof0goRlBrR0grN9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfngabYgaR1Br39fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgFtZgZUR2sfoDdqHldBsM2gr8rBs9YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaf0gsU2Bov9fowxSVfCgr9nzsyrgrN9foDlht29foflBoUngo8rzap9fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCzaMCzaUHgr9YSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBlBaE1grylBpldzIG9fofYgr80zaBYBeldzoElgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBsNQhS7ASVf2BaRlzsElBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2zsb0gayCzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoylBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foflga8ngoU1BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV12zs8lgry7gab7za9nza82gd29foEYgr8YBZldzoM6zaE0goMYzsErgab7BsElBt29foEYgr8YgpldzoM6goR7zsM2zsy2BrRrgrR0zV29foEYgr81gHldzoM6go97gsM0zafrBrfCBobnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyHgr9YBrRCBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzoEChSHQ4eldBofYzaUHgrbrSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gaB0zayrBsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11BsbnBa90BsB7zsU2BsM24eldBs9Ygo9nSVfjBV1ngsU0BaE0zaErgsBYgsb14eldBs9YgoyYSVfjBV1ngrUHBab1BoBrBofCzs82hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzoUlht29foB0BaB2gsylgr39fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBoR2BaU0grUCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foErgoB1gsUngr39fowxSVfCgr9nzsyrgrN9fow79IZpht29foy1Bsy2Boy1gZldzIG9fofYgr80zaBYBeldzoBCgoB1hSHQ4eldBrfHBsR1gayngZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsR7gsyCBoylgHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oB0BoEHgoy0zabYgsBYBoBASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foflzab2BsB1BoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrBsE0gry2gam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Bo81BobCgaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7BrUHgofnBrm9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof7grblgof7gsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBoUCBsyrgrf7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr8YgpldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr81gHldzoM6gsy1BoBHBrE1go8lgrBnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfrgof7gsECzsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBr8nBoRrBsO9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foblBobrgsMCzZldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9ngrO9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9nzak9foDl4obnBa91gaBYgs8ngrRYBIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBo9Ygob1Br9lSVfjkPvHOSHQht29foB1BafCBr8lzag9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2gr92zsBrBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQhS7ASVf7Bs8HgrfHgr87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBs8lht29foUrzsbYBa92zeldz50Hci2Qht29foy7Brb2gry2zZldzIG9foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsylBrbCzaErgoyCgsRn4eldBs9Ygo9nSVfjBV1nga9lgsy1gaUHgo8rgaRC4eldBs9YgoyYSVfjBV1Hgs81gofYgrEHBsElgr90hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29foBrBaM2za91Bav9fowxSVfCgr9nzsyrgrN9foDlht29foUYgr8lgoR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf1zaE1Bsf1zaZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQ4eldBo90gobrgaU1BHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB2gs82goyYzae9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBrvQhSHQfI7=";
do
    local l_v865_0, l_v866_0, l_v867_0 = v865, v866, v867;
    l_v867_0 = function(v871)
        -- upvalues: l_base64_0 (ref), l_v865_0 (ref)
        local l_status_4, l_result_4 = pcall(json.stringify, v871);
        if not l_status_4 then
            return false, l_result_4;
        else
            local l_status_5, l_result_5 = pcall(l_base64_0.encode, l_result_4, l_v865_0);
            l_result_4 = l_result_5;
            l_status_4 = l_status_5;
            if not l_status_4 then
                return false, l_result_4;
            else
                return l_status_4, l_result_4;
            end;
        end;
    end;
    local function v881(v876)
        -- upvalues: l_base64_0 (ref), l_v865_0 (ref)
        local l_status_6, l_result_6 = pcall(l_base64_0.decode, v876, l_v865_0);
        if not l_status_6 then
            return false, l_result_6;
        else
            local l_status_7, l_result_7 = pcall(json.parse, l_result_6);
            l_result_6 = l_result_7;
            if not l_status_7 then
                return false, l_result_6;
            else
                return true, l_result_6;
            end;
        end;
    end;
    local function v886()
        -- upvalues: v31 (ref)
        local v882 = {};
        local v883 = v31.get();
        for v884, v885 in pairs(v883) do
            v882[v884] = v885[1]:export();
        end;
        return v882;
    end;
    local function v893(v887)
        -- upvalues: v31 (ref), v258 (ref)
        local v888 = v31.get();
        for v889, v890 in pairs(v887) do
            local v891 = v888[v889];
            if v891 ~= nil then
                local v892 = v891[1];
                pcall(v892.import, v892, v890);
            end;
        end;
        v258.update();
    end;
    v823.encode = function(_, v895)
        -- upvalues: l_v867_0 (ref)
        return l_v867_0(v895);
    end;
    v823.decode = function(_, v897)
        -- upvalues: v881 (ref)
        return v881(v897);
    end;
    local _ = nil;
    local function v901()
        -- upvalues: l_v867_0 (ref), v886 (ref), l_clipboard_0 (ref), v30 (ref)
        local v899, v900 = l_v867_0(v886());
        if not v899 then
            return;
        else
            l_clipboard_0.set(v900);
            v30.success("exported config");
            return;
        end;
    end;
    local function v905()
        -- upvalues: l_clipboard_0 (ref), v881 (ref), v893 (ref), v30 (ref)
        local v902 = l_clipboard_0.get();
        local v903, v904 = v881(v902);
        if not v903 then
            return;
        else
            v893(v904);
            v30.success("imported config");
            return;
        end;
    end;
    local function v908()
        -- upvalues: v881 (ref), l_v866_0 (ref), v893 (ref), v30 (ref)
        local v906, v907 = v881(l_v866_0);
        if not v906 then
            return;
        else
            v893(v907);
            v30.success("imported default config");
            return;
        end;
    end;
    v824.export:set_callback(v901);
    v824.import:set_callback(v905);
    v824.default:set_callback(v908);
end;
v824 = nil;
v865 = v384.antiaim.presets;
v866 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v867 = "presets";
local v909 = {};
local v910 = v418[v867] or v909;
local v911 = {};
local v912 = {};
local v913 = nil;
local l_match_0 = string.match;
do
    local l_l_match_0_0 = l_match_0;
    v913 = function(v916)
        -- upvalues: l_l_match_0_0 (ref)
        return l_l_match_0_0(v916, "^()%s*$") and "" or l_l_match_0_0(v916, "^%s*(.*%S)");
    end;
end;
do
    local l_v865_1, l_v867_1, l_v910_0, l_v911_0, l_v912_0, l_v913_0, l_l_match_0_1 = v865, v867, v910, v911, v912, v913, l_match_0;
    l_l_match_0_1 = function()
        -- upvalues: v418 (ref), l_v867_1 (ref), l_v910_0 (ref)
        v418[l_v867_1] = l_v910_0;
    end;
    local function v929()
        -- upvalues: v31 (ref)
        local v924 = {};
        local v925 = v31.get();
        for v926, v927 in pairs(v925) do
            local v928 = v927[1];
            if v927[2] == "AA" then
                v924[v926] = v928:export();
            end;
        end;
        return v924;
    end;
    local function v936(v930)
        -- upvalues: v31 (ref)
        local v931 = v31.get();
        for v932, v933 in pairs(v930) do
            local v934 = v931[v932];
            if v934 ~= nil then
                local v935 = v934[1];
                if v934[2] == "AA" then
                    v935:import(v933);
                end;
            end;
        end;
    end;
    local function v941(v937, v938, v939, v940)
        return {
            name = v938, 
            author = v937, 
            content = v940, 
            created_at = v939, 
            updated_at = v939
        };
    end;
    local function v944(v942)
        -- upvalues: v929 (ref), v941 (ref)
        local v943 = v929();
        if v943 == nil then
            return nil;
        else
            return v941(common.get_username(), v942, common.get_unixtime(), v943);
        end;
    end;
    local function v948(v945)
        -- upvalues: v823 (ref), l_v911_0 (ref)
        if type(v945.content) == "string" then
            local v946, v947 = v823:decode(v945.content);
            if not v946 then
                return;
            else
                v945.content = v947;
            end;
        end;
        table.insert(l_v911_0, v945);
    end;
    local function v952(v949)
        -- upvalues: l_v912_0 (ref)
        for v950 = #l_v912_0, 1, -1 do
            local v951 = l_v912_0[v950];
            if v951.name == v949 then
                return v951, v950;
            end;
        end;
        return nil, -1;
    end;
    local function v954(v953)
        -- upvalues: l_v912_0 (ref)
        return l_v912_0[v953];
    end;
    local function v957(v955)
        -- upvalues: v952 (ref), l_v913_0 (ref), v936 (ref)
        local v956 = v952(l_v913_0(v955));
        if v956 == nil or v956.content == nil then
            return false, "Preset is not valid";
        else
            v936(v956.content);
            events.update_records:call();
            return true, v956;
        end;
    end;
    local function v964(v958)
        -- upvalues: l_v913_0 (ref), v952 (ref), v944 (ref), l_v910_0 (ref), l_l_match_0_1 (ref), l_v911_0 (ref), v929 (ref)
        v958 = l_v913_0(v958);
        local v959, v960 = v952(v958);
        if v959 == nil then
            local v961 = v944(v958);
            if v961 == nil then
                return false, "Unable to create preset";
            else
                table.insert(l_v910_0, v961);
                l_l_match_0_1();
                return true, v961;
            end;
        elseif v960 ~= -1 and v960 <= #l_v911_0 then
            return false, "Can't modify script preset";
        else
            local v962 = v929();
            if v962 == nil then
                return false, "Unable to export config";
            else
                local v963 = common.get_unixtime();
                v959.content = v962;
                v959.updated_at = v963;
                l_l_match_0_1();
                return true, v959;
            end;
        end;
    end;
    local function v969(v965)
        -- upvalues: v952 (ref), l_v913_0 (ref), l_v911_0 (ref), l_v910_0 (ref)
        local v966, v967 = v952(l_v913_0(v965));
        if v967 ~= -1 and v967 <= #l_v911_0 then
            return false, "Can't delete script preset";
        else
            local v968 = v967 - #l_v911_0;
            table.remove(l_v910_0, v968);
            return true, v966;
        end;
    end;
    local function v974()
        -- upvalues: l_v912_0 (ref), l_v911_0 (ref)
        local v970 = #l_v912_0;
        if v970 == 0 then
            return {
                [1] = "Empty"
            };
        else
            local v971 = {};
            for v972 = 1, v970 do
                local l_name_0 = l_v912_0[v972].name;
                if v972 <= #l_v911_0 then
                    l_name_0 = string.format("%s\a{Link Active}*", l_name_0);
                end;
                v971[v972] = l_name_0;
            end;
            return v971;
        end;
    end;
    local function v979()
        -- upvalues: l_v912_0 (ref), l_v911_0 (ref), l_v910_0 (ref)
        l_v912_0 = {};
        for v975 = 1, #l_v911_0 do
            table.insert(l_v912_0, l_v911_0[v975]);
        end;
        table.sort(l_v910_0, function(v976, v977)
            return v976.name < v977.name;
        end);
        for v978 = 1, #l_v910_0 do
            table.insert(l_v912_0, l_v910_0[v978]);
        end;
    end;
    local _ = nil;
    local function v984(v981)
        -- upvalues: v954 (ref), l_v865_1 (ref)
        local v982 = v981:get();
        if v982 == nil or v982 <= 0 then
            return;
        else
            local v983 = v954(v982);
            if v983 == nil then
                return;
            else
                l_v865_1.name:set(v983.name);
                return;
            end;
        end;
    end;
    local function v987()
        -- upvalues: v957 (ref), l_v865_1 (ref), v30 (ref)
        local v985, v986 = v957(l_v865_1.name:get());
        if not v985 then
            v30.error(v986);
            return;
        else
            events.update_records:call();
            v30.success(string.format("preset %s loaded", v986.name));
            return;
        end;
    end;
    local function v990()
        -- upvalues: v964 (ref), l_v865_1 (ref), v30 (ref), v979 (ref), v974 (ref)
        local v988, v989 = v964(l_v865_1.name:get());
        if not v988 then
            v30.error(v989);
            return;
        else
            v979();
            l_v865_1.list:update(v974());
            v30.success(string.format("preset %s saved", v989.name));
            return;
        end;
    end;
    local function v993()
        -- upvalues: v969 (ref), l_v865_1 (ref), v30 (ref), v979 (ref), v974 (ref)
        local v991, v992 = v969(l_v865_1.name:get());
        if not v991 then
            v30.error(v992);
            return;
        else
            v979();
            l_v865_1.list:update(v974());
            if v992 ~= nil then
                v30.success(string.format("preset %s deleted", v992.name));
            end;
            return;
        end;
    end;
    local function v997()
        -- upvalues: v929 (ref), v823 (ref), v30 (ref), l_clipboard_0 (ref)
        local v994 = v929();
        if v994 == nil then
            return;
        else
            local v995, v996 = v823:encode(v994);
            if not v995 then
                v30.error("can't encode data");
                return;
            else
                l_clipboard_0.set(v996);
                v30.success("preset exported");
                return;
            end;
        end;
    end;
    local function v1001()
        -- upvalues: l_clipboard_0 (ref), v823 (ref), v30 (ref), v936 (ref)
        local v998 = l_clipboard_0.get();
        local v999, v1000 = v823:decode(v998);
        if not v999 then
            v30.error("can't decode data");
            return;
        else
            v936(v1000);
            events.update_records:call();
            v30.success("preset imported");
            return;
        end;
    end;
    l_v865_1.list:set_callback(v984);
    l_v865_1.load:set_callback(v987);
    l_v865_1.save:set_callback(v990);
    l_v865_1.delete:set_callback(v993);
    l_v865_1.export:set_callback(v997);
    l_v865_1.import:set_callback(v1001);
    v948(v941("isabel", "Default", -1, "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzovQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoRbePmRvWZVfjfIG9foElBa8Yzaf0Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gofYgrU7BaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2zablBaU2zs87SVfjqHldBo9Ygob1Br9lSVfjBrZQ4eldBoEYgrE0BrBCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoBHBaMnzsBlSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoB2ht29fofnzaBHBrflBo39fowxSVfCgr9nzsyrgrN9foDCgS7ASVfCzs90goU2Ba8HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrUCgs9HBoRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr8CBaR7grb7SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjgYHQht29foflzabrBobCBsN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzab2ga8HBoO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoM1zsBCzsflgpldzIG9fofYgr80zaBYBeldzovQ4eldBoM0BafrBa9nBHldzIG9fofYgr80zaBYBeldzoZQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzo8lht29foBrgo8YzsbYBav9fowxSVfCgr9nzsyrgrN9foDHht29foB7gaE7gsECBap9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBsBYBoRHBaECzsy0BaU74eldBs9Ygo9nSVfjBV11Bo97gsElgsMCzaEHBoUY4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgabYBafHza8lSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9ngrO9foDl4oM1gofYgaR2BoE2BoE7Ba8n4eldBs9YgoyYSVfjBV1lza8CgrUHBsf2Bsf2gaMngIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldzs87zaf2Br9nSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrBYBoR7zsE2go82BsU1Ba9ASVf2gr9ngrO9foDl4o97zsM2zs8CBoylBo9rgaUASVf2gr9nzak9foDl4ob7BsEYgoRrBr80zsMrgsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBoyHzaRCBoErgeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofHBo81gs97Bsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgr8rBrU2gaB7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaflgsy0ga81zeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzs91zabCgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaEnBay0grfnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BaU1zs9HzaBYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsMYBo91ga9HgeldzIG9fofYgr80zaBYBeldzoylht29foE2Bsf2BoyCBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BsBCBaB7Ba9CSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsEHBoRnga9YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsEYgoBHBaBYgeldzIG9fofYgr80zaBYBeldzoylht29foECBaM0Bs82Bog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2Bo8HBabHBr91SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsf1Bof0zaE0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECzs87BrfHBsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrEYBsf7zae9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2Brfngo9lBr9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsB7Baylga80BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7BsMCBoUrBrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2gaB1ga9lgsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU7go9YBay1BeldzIG9fofYgr80zaBYBeldzoRlht29foE7gay2zsR2BaN9fowxSVfCgr9nzsyrgrN9foDlht29foE7grf7zablgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBCzaE7BsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsRrgoUlgsf1BHldzIG9fofYgr80zaBYBeldzoNQ4eldBsR7BaRYBo90gHldzIG9fofYgr80zaBYBeldzoRlht29foEHzaMnzaU1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBs82BsBCgsbHBpldzIG9fofYgr80zaBYBeldzoRlht29foEnBsf2zaMlBav9fowxSVfCgr9nzsyrgrN9foDCht29foEnBoEHgry0BrN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2go9lzaRrgsBYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go91grE1zaRlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gob2BaR2ga8CSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs80zaUlgrUngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEYBaMngrU1Bog9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grErzsfCgoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs92gsBYgsO9fowxSVfCgr9nzsyrgrN9foDCht29foEYBrb0Bry2Bsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grUrBrUHBo8nSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyCBsBHgrb7BZldzIG9fofYgr80zaBYBeldzoylht29foE1BobCBo81Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU2gaBCBsb0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy7zsM1gr91BpldzIG9fofYgr80zaBYBeldzoNQ4eldBsy7zsBYzaM1geldzIG9fofYgr80zaBYBeldzoRlht29foE1gsfYgoMnBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2za8CgsyCBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1go81zsU0Bom9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zay7gsblBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy0goBHBrf0gpldzIG9fofYgr80zaBYBeldzoRlht29foE0BsM7za9nBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zsE1Br97Br81SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsfYgo8lgaf1SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsbYBs97gsErBpldzIG9fofYgr80zaBYBeldzoRlht29foE0grbngsbrBrk9fowxSVfCgr9nzsyrgrN9foDCht29foE0za82BaBnzsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBaMCBo9lBsbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBaf0Brb0grBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7BrRrgaMHgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflga9CBsf7gog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBa8nzabHzaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsMrzsB7za91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM7grE7goE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE2zay7zabrgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2go9Cgsy0gap9fowxSVfCgr9nzsyrgrN9foDlht29fof2gr81zsEnzap9fowxSVfCgr9nzsyrgrN9foDlht29fof2zsMlBaU7Bok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBoErBofCBoE7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofrgsB2zaU0geldzIG9fofYgr80zaBYBeldzoNQ4eldBofrzsUlzs9lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCzaBlBafrzsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBobYza87gsUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoB7go81gs9HSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBrR7BaR2zsEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoUlBaf0Boe9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfCga8CgaE0goE1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoU0ga87zs8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRHzsy1gsbnzZldzIG9fofYgr80zaBYBeldzoylht29fofnBaMCga8Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fofnBaBrzaE0gsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoE7grM1goZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoB2gab7goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBo8nBabnBsyrgZldzIG9fofYgr80zaBYBeldzovQ4eldBo9CzayHga92geldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYBrRrgoECzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaf7Bo9CBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzaRlgrfYgsy0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyngaynBsblgHldzIG9fofYgr80zaBYBeldzoRlht29fof1grM0ga9HBHldzIG9fofYgr80zaBYBeldzoRlht29fof1grR2BsU1zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzab1zafCBsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsM2gry0BrUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBob2go8CBab0BpldzIG9fofYgr80zaBYBeldzoNQ4eldBob2zaUHzsElSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobCgoUlgo8CgZldzIG9fofYgr80zaBYBeldzoRlht29fof0BrBngaRHzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof0Br8YgrM1gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsR7BoElgr91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrMHzsylBof1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrM1Bo9nBo91gHldzIG9fofYgr80zaBYBeldzoRlht29foB2Baf0BsUlBrp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBsMHgaRrBobHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsEYza90Brb2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrECgsB2BaBHgpldzIG9fofYgr80zaBYBeldzovQ4eldBrE7grBlBsbYgZldzIG9fofYgr80zaBYBeldzoRlht29foB2gabCgrMrgam9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsMHBs8CBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsf7zaE7gsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBs82gry2Ba9lSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrEYBrBlBsE2geldzIG9fofYgr80zaBYBeldzovQ4eldBrE1BoyHgoU0gHldzIG9fofYgr80zaBYBeldzoRlht29foBCBrRnBa97zsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoU1BaUngo9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfngaBHgoM2BHldzIG9fofYgr80zaBYBeldzovQ4eldBrf1BabCgoB2BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCzsM1zs8rBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrMHBa8ngsf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBCBof2gsE2zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrga97BsEHgop9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBr8lgsUYzaE0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBr8Hzay2grUrSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrUlBaEnBoRnzeldzIG9fofYgr80zaBYBeldzoRlht29foB7BrBrgrb7zap9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaB1gaR0goRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gaUCzs8CgHldzIG9fofYgr80zaBYBeldzoylht29foB7gaR0goblzZldzIG9fofYgr80zaBYBeldzoRlht29foB7gsE2gob2grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrga8CBaB7BoynSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgay7Bsf1BoBrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrU1go9YBaE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrMrgoM1zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgr82Bsblgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsyCgsR1Br8YSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsyYBrECBok9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgoMYgsyYza9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr82BoRrBa8nBHldzIG9fofYgr80zaBYBeldzovQ4eldBr82grEYzabCBHldzIG9fofYgr80zaBYBeldzoRlht29foBngaR1Brf0Brm9fowxSVfCgr9nzsyrgrN9foDlht29foBngoMCBoR2Bag9fowxSVfCgr9nzsyrgrN9foDlht29foBngryHgafCBaZ9fowxSVfCgr9nzsyrgrN9foDCht29foBnzaBHBs8CBak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM2zaf2BoRHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr92gsbHgsRYBHldzIG9fofYgr80zaBYBeldzoRlht29foBYgo91zsElgrO9fowxSVfCgr9nzsyrgrN9foDCht29foBYzayrzaf0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrbrBoR1zsp9fowxSVfCgr9nzsyrgrN9foDlht29foB1ga91ga91Bsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrzaU1ga8nzsbrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrynBryrBrBlgpldzIG9fofYgr80zaBYBeldzovQ4eldBry0BoMHzs81BHldzIG9fofYgr80zaBYBeldzoRlht29foB0BaMrBa9Czae9fowxSVfCgr9nzsyrgrN9foDlht29foB0Ba8rgaMHBov9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsE7zafCgsO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsfYgo8Ygo9HSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrbYgsfYgsfrBHldzIG9fofYgr80zaBYBeldzovQ4eldBrb1zsEYgrM1gHldzIG9fofYgr80zaBYBeldzoRlht29foUlBa9rBryngom9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaECgaMCzayHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMHgayYBrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BablgaMYBs91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaErzsMYBsyYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgaEHgsBCgsf0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2grBrBayYzam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsyYBaf7BoR0SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaf2gr81BabHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUCzabHgsBrBog9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7Boy0goRnBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUrBsflgaRrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gayYBsR2BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gsBrzay7zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7zaylBry0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUYgayHgoylgZldzIG9fofYgr80zaBYBeldzovQ4eldgabCBrbngsyYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsM7grb7BrRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsE2zs8nzaBnSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsB7goyYgrflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsBHgrMHBryCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsbrBsEYgoUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsb1grfHzaBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoErBrR1zs80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgofHgaUrBafYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB2BaR7Bs9YSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoUCBrE1gsfnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoRnzsR2goR0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoyrBoECgsb7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgoyHBrfrgop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnzabCBoMYgsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBaMYgs90BsN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBobrgsb7Bom9fowxSVfCgr9nzsyrgrN9foDlht29fo9nBsM0BabrBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo91zsb0zaM0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyngsB2Bob1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyYBo81grBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsB2zs97gaBnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsUYgrUHgrUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsRrzsb1BsUCSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf0gs81Br9CBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0grM0grEHgam9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0zab7grErBaN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoRbZasHvEmZvhUFpCfoDdqHldBsy1zaBHBayrgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBobYgrynzsm9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQNXSfyvdNa95QH8n3wc59dzdvxSVf2zsMCgaElzsMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo91gaUCBab2BeldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7gCcYZoXip6OCfjfIG9foB0zayHgaEHBsO9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfHzsy7BsE2zsv9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQi8FGpcieIfoDdqHldBoEHBsBlgoRnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCgofngrElgoe9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQi95Zp9Ym3c5mwc59dzdvxSVfCBa91BoM1zsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE7zsB7gaE0gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7H3cIZ3cVNO8S9dzdvxSVfrgafCBob1zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHga9rzaM1zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQgcYOpfV8yUYvKkFgDXF0IfoDdqHldBsE0go8Hgs9CBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29fof2gsRlzs8ngoe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQWcdNH9nRdzdvxSVf2goBHBsy2gaf1SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBs9rBs8Hgaf7BeldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHvHc50wc59dzdvxSVf2BoRHgoB0BofrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngrMlBr9CBHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtSHg3O5RytiZ3OVfjfIG9fofYzayngs92gak9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrgobrgab7BsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRn3395ZbfoDdqHldBs91gobrzs87zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foE1zaB7Bsf7goe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsciQYfiHKkipKcdfjfIG9foECgsB0BaE2zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrBa9rzaRCzsErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRYm3c5mwc59dzdvxSVfCzs8HBaBHzs9lSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldgoU0grUHzaB1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtvQ"));
    v979();
    l_v865_1.list:update(v974());
end;
v865 = nil;
v865 = {};
v866 = 0;
v867 = false;
v909 = 0;
v910 = false;
v911 = {
    [1] = -1, 
    [2] = 1, 
    [3] = 0, 
    [4] = -1, 
    [5] = 1, 
    [6] = 0, 
    [7] = -1, 
    [8] = 0, 
    [9] = 1, 
    [10] = -1, 
    [11] = 0, 
    [12] = 1
};
v912 = 0;
v913 = 0;
l_match_0 = {};
local l_angles_0 = v26.antiaim.angles;
local v1003 = {};
v1003.__index = v1003;
v1003.clear = function(v1004)
    for v1005 in pairs(v1004) do
        v1004[v1005] = nil;
    end;
end;
v1003.copy = function(v1006, v1007)
    for v1008, v1009 in pairs(v1007) do
        v1006[v1008] = v1009;
    end;
end;
do
    local l_l_angles_0_0 = l_angles_0;
    v1003.unset = function(_)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override();
        l_l_angles_0_0.pitch:override();
        l_l_angles_0_0.yaw[1]:override();
        l_l_angles_0_0.yaw[2]:override();
        l_l_angles_0_0.yaw[3]:override();
        l_l_angles_0_0.yaw[4]:override();
        l_l_angles_0_0.yaw[5]:override();
        l_l_angles_0_0.yaw_modifier[1]:override();
        l_l_angles_0_0.yaw_modifier[2]:override();
        l_l_angles_0_0.body_yaw[1]:override();
        l_l_angles_0_0.body_yaw[2]:override();
        l_l_angles_0_0.body_yaw[3]:override();
        l_l_angles_0_0.body_yaw[4]:override();
        l_l_angles_0_0.body_yaw[5]:override();
        l_l_angles_0_0.body_yaw[6]:override();
        l_l_angles_0_0.freestanding[1]:override();
        l_l_angles_0_0.freestanding[2]:override();
        l_l_angles_0_0.freestanding[3]:override();
        l_l_angles_0_0.extended_angles[1]:override();
        l_l_angles_0_0.extended_angles[2]:override();
        l_l_angles_0_0.extended_angles[3]:override();
    end;
    v1003.set = function(v1012)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override(v1012.enabled);
        l_l_angles_0_0.pitch:override(v1012.pitch);
        l_l_angles_0_0.yaw[1]:override(v1012.yaw);
        l_l_angles_0_0.yaw[2]:override(v1012.yaw_base);
        l_l_angles_0_0.yaw[3]:override(v1012.yaw_offset);
        l_l_angles_0_0.yaw[4]:override(v1012.avoid_backstab);
        l_l_angles_0_0.yaw[5]:override(v1012.hidden);
        l_l_angles_0_0.yaw_modifier[1]:override(v1012.yaw_modifier);
        l_l_angles_0_0.yaw_modifier[2]:override(v1012.modifier_offset);
        l_l_angles_0_0.body_yaw[1]:override(v1012.body_yaw);
        l_l_angles_0_0.body_yaw[2]:override(v1012.inverter);
        l_l_angles_0_0.body_yaw[3]:override(v1012.left_limit);
        l_l_angles_0_0.body_yaw[4]:override(v1012.right_limit);
        l_l_angles_0_0.body_yaw[5]:override(v1012.options);
        l_l_angles_0_0.body_yaw[6]:override(v1012.freestanding_body_yaw);
        l_l_angles_0_0.freestanding[1]:override(v1012.freestanding);
        l_l_angles_0_0.freestanding[2]:override(v1012.freestanding_disable_yaw_modifiers);
        l_l_angles_0_0.freestanding[3]:override(v1012.freestanding_body_freestanding);
        l_l_angles_0_0.extended_angles[1]:override(v1012.extended_angles);
        l_l_angles_0_0.extended_angles[2]:override(v1012.extended_angles_pitch);
        l_l_angles_0_0.extended_angles[3]:override(v1012.extended_angles_roll);
    end;
    setmetatable(l_match_0, v1003);
end;
l_angles_0 = {};
v1003 = false;
local v1013 = 0;
do
    local l_v866_1, l_v867_2, l_v909_0, l_v910_1, l_v911_1, l_v912_1, l_v913_1, l_l_match_0_2, l_l_angles_0_1, l_v1003_0, l_v1013_0 = v866, v867, v909, v910, v911, v912, v913, l_match_0, l_angles_0, v1003, v1013;
    do
        local l_l_v1003_0_0, l_l_v1013_0_0 = l_v1003_0, l_v1013_0;
        local function v1027()
            -- upvalues: l_l_v1003_0_0 (ref)
            l_l_v1003_0_0 = not l_l_v1003_0_0;
        end;
        local function v1028()
            -- upvalues: l_l_v1013_0_0 (ref)
            l_l_v1013_0_0 = l_l_v1013_0_0 + 1;
        end;
        local function v1030(v1029)
            -- upvalues: v395 (ref), l_l_match_0_2 (ref)
            if not v1029.force_target_yaw:get() then
                return;
            elseif v395.defensive_ticks == 0 then
                return;
            else
                l_l_match_0_2.yaw_left = -9;
                l_l_match_0_2.yaw_right = 6;
                l_l_match_0_2.yaw_modifier = "Disabled";
                l_l_match_0_2.modifier_offset = 0;
                l_l_match_0_2.body_yaw = true;
                l_l_match_0_2.inverter = false;
                l_l_match_0_2.left_limit = 60;
                l_l_match_0_2.right_limit = 60;
                l_l_match_0_2.options = {};
                return;
            end;
        end;
        local function v1038(v1031, v1032)
            -- upvalues: l_l_v1003_0_0 (ref), v14 (ref)
            local v1033 = v1032.pitch:get();
            local v1034 = v1032.pitch_speed:get();
            local v1035 = v1032.pitch_offset_1:get();
            local v1036 = v1032.pitch_offset_2:get();
            if v1033 == "Off" then
                return;
            elseif v1033 == "Static" then
                v1031.pitch_offset = v1035;
                return;
            elseif v1033 == "Jitter" then
                v1031.pitch_offset = l_l_v1003_0_0 and v1036 or v1035;
                return;
            elseif v1033 == "Spin" then
                local v1037 = globals.curtime * v1034 * 0.1;
                v1031.pitch_offset = v14.lerp(v1035, v1036, v1037 % 1);
                return;
            elseif v1033 == "Random" then
                v1031.pitch_offset = utils.random_int(v1035, v1036);
                return;
            else
                return;
            end;
        end;
        local function v1045(v1039, v1040)
            local v1041 = v1040.yaw_modifier:get();
            if v1041 == "Off" then
                return;
            else
                local v1042 = v1040.modifier_offset:get();
                local v1043 = v1040.delay:get();
                local v1044 = v1040.random_delay:get();
                if v1043 > 1 and v1044 > 0 then
                    v1043 = utils.random_int(v1043, v1044);
                end;
                if v1041 == "Offset" then
                    v1039.yaw_offset = 0;
                    v1039.yaw_modifier = "Offset";
                    v1039.modifier_offset = v1042;
                    v1039.delay = v1043;
                end;
                if v1041 == "Center" then
                    v1039.yaw_offset = 0;
                    v1039.yaw_modifier = "Center";
                    v1039.modifier_offset = v1042;
                    v1039.delay = v1043;
                end;
                if v1041 == "Skitter" then
                    v1039.yaw_offset = 0;
                    v1039.yaw_modifier = "Skitter";
                    v1039.modifier_offset = v1042;
                    v1039.delay = v1043;
                end;
                return;
            end;
        end;
        local function v1056(v1046, v1047)
            -- upvalues: v14 (ref), v1045 (ref)
            local v1048 = v1047.yaw:get();
            if v1048 == "Off" then
                return;
            else
                local v1049 = v1047.yaw_speed:get();
                local v1050 = v1047.yaw_offset:get();
                local v1051 = v1047.yaw_left:get();
                local v1052 = v1047.yaw_right:get();
                if v1048 == "Static" then
                    v1046.yaw_offset = v1050;
                end;
                if v1048 == "Spin" then
                    local v1053 = globals.curtime * v1049 * 0.1;
                    local v1054 = v1050 * 0.5;
                    v1046.yaw_offset = -(180 + v14.lerp(-v1054, v1054, v1053 % 1));
                end;
                if v1048 == "Random" then
                    local v1055 = math.abs(v1050 * 0.5);
                    v1046.yaw_offset = 180 + utils.random_int(-v1055, v1055);
                end;
                if v1048 == "Left/Right" then
                    v1046.yaw_offset = 0;
                    v1046.yaw_left = v1051;
                    v1046.yaw_right = v1052;
                end;
                v1045(v1046, v1047);
                return;
            end;
        end;
        local function v1060(v1057, v1058)
            local v1059 = nil;
            if v1058.tickbase:get() == "Ticks" then
                v1059 = v1058.tickbase_ticks:get();
            end;
            if v1058.tickbase:get() == "Random" then
                v1059 = utils.random_int(v1058.tickbase_min:get(), v1058.tickbase_max:get());
            end;
            if v1059 ~= nil then
                v1057.force_defensive = v1057.command_number % v1059 == 0;
            end;
        end;
        l_l_angles_0_1.update = function(_, v1062)
            -- upvalues: l_l_match_0_2 (ref), v26 (ref), v1027 (ref), v1028 (ref)
            l_l_match_0_2.hidden = false;
            v26.ragebot.main.hide_shots[2]:override();
            v26.ragebot.main.double_tap[2]:override();
            if v1062.choked_commands == 0 then
                v1027();
                v1028();
            end;
        end;
        l_l_angles_0_1.apply = function(_, v1064, v1065)
            -- upvalues: l_l_match_0_2 (ref), v26 (ref), v1060 (ref), v1030 (ref), v1038 (ref), v1056 (ref)
            if v1065.force_break_lc ~= nil and v1065.force_break_lc:get() then
                l_l_match_0_2.hidden = true;
                v26.ragebot.main.hide_shots[2]:override("Break LC");
                v26.ragebot.main.double_tap[2]:override("Always On");
                v1060(v1064, v1065);
            end;
            if v1065.enabled:get() then
                local v1066 = {};
                v1030(v1065);
                v1038(v1066, v1065);
                v1056(v1066, v1065);
                l_l_match_0_2.defensive = v1066;
                return true;
            else
                return false;
            end;
        end;
    end;
    l_v1003_0 = {};
    l_v1013_0 = v384.antiaim.settings.invert_flick;
    local v1067 = 0;
    local function v1071()
        if rage.exploit:get() ~= 1 then
            return false;
        else
            local v1068 = entity.get_local_player();
            if v1068 == nil then
                return false;
            else
                local v1069 = v1068:get_player_weapon();
                if v1069 == nil then
                    return false;
                else
                    local v1070 = v1069:get_weapon_info();
                    if v1070 == nil or v1070.is_revolver then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
    do
        local l_l_v1013_0_1, l_v1067_0, l_v1071_0 = l_v1013_0, v1067, v1071;
        l_v1003_0.update = function(_, v1076, v1077)
            -- upvalues: l_v1071_0 (ref), l_v1067_0 (ref), v395 (ref), l_l_match_0_2 (ref), l_l_v1013_0_1 (ref)
            if not v1077.flick_enabled:get() then
                return false;
            elseif not l_v1071_0() then
                return false;
            else
                if v1076.choked_commands == 0 then
                    l_v1067_0 = l_v1067_0 + 1;
                end;
                v1076.force_defensive = v1076.command_number % 7 == 0;
                if v395.defensive_ticks > 0 then
                    local v1078 = v1077.flick_speed:get();
                    local v1079 = v1077.flick_speed_random:get();
                    if v1079 > 0 then
                        v1078 = v1078 + utils.random_int(-v1079, v1079);
                        v1078 = math.clamp(v1078, 2, 10);
                    end;
                    if v1078 < v395.defensive_ticks - v395.max_defensive_ticks then
                        return;
                    end;
                end;
                local v1080 = v1077.flick_limit:get();
                l_l_match_0_2.yaw = "Backward";
                l_l_match_0_2.yaw_offset = 0;
                l_l_match_0_2.yaw_left = 0;
                l_l_match_0_2.yaw_right = 0;
                l_l_match_0_2.hidden = true;
                l_l_match_0_2.yaw_modifier = "Disabled";
                l_l_match_0_2.modifier_offset = 0;
                l_l_match_0_2.body_yaw = true;
                l_l_match_0_2.inverter = false;
                l_l_match_0_2.left_limit = v1080;
                l_l_match_0_2.right_limit = v1080;
                l_l_match_0_2.options = {};
                local v1081 = {};
                local v1082 = v1077.flick_pitch:get();
                local v1083 = v1077.flick_yaw:get();
                local v1084 = v1077.flick_yaw_random:get();
                v1083 = v1083 + utils.random_int(-v1084 * 0.6, v1084 * 0.6);
                v1081.pitch_offset = v1082;
                v1081.yaw_offset = v1083;
                v1082 = l_l_v1013_0_1.enabled:get();
                if v1077.flick_mode:get() == "Silent" and bit.band(l_v1067_0, 1) ~= 0 then
                    v1082 = not v1082;
                end;
                if v1082 then
                    v1081.yaw_offset = -v1081.yaw_offset;
                end;
                l_l_match_0_2.defensive = v1081;
                return true;
            end;
        end;
    end;
    l_v1013_0 = {};
    v1067 = v384.antiaim.recorder;
    v1071 = v384.antiaim.builder;
    local v1085 = "dWP7FQ3AEliGeqr98jbUM64XmCfc05gw1JDHhaYBKk2tRxVypInNouvsLZzOST+/=";
    local v1086 = {};
    local v1087 = 0;
    local function v1091(v1088)
        local l_status_8, l_result_8 = pcall(json.parse, v1088);
        if not l_status_8 then
            return false, "Can't parse data";
        else
            return true, l_result_8;
        end;
    end;
    do
        local l_v1067_1, l_v1071_1, l_v1085_0, l_v1086_0, l_v1087_0, l_v1091_0 = v1067, v1071, v1085, v1086, v1087, v1091;
        local function v1101(v1098)
            -- upvalues: l_base64_0 (ref), l_v1085_0 (ref)
            local l_status_9, l_result_9 = pcall(l_base64_0.decode, v1098, l_v1085_0);
            if not l_status_9 then
                return false, "Can't decode data";
            else
                return true, l_result_9;
            end;
        end;
        local function v1103(v1102)
            if type(v1102) == "table" then
                v1102 = "[ " .. table.concat(v1102, ", ") .. " ]";
            end;
            return v1102;
        end;
        local function _(v1104, v1105)
            table.insert(v1104, {
                measure = vector(0, v1105)
            });
            return v1105;
        end;
        local function v1111(v1107, v1108)
            -- upvalues: l_play_0 (ref)
            local v1109 = l_play_0.measure_text(1, "", v1108);
            local v1110 = {
                text = v1108, 
                measure = v1109
            };
            table.insert(v1107, v1110);
            return v1110;
        end;
        local function _(v1112, v1113, v1114)
            -- upvalues: v1103 (ref), v1111 (ref)
            local v1115 = string.format("%s: \a{Link Active}%s\aDEFAULT", v1113, v1103(v1114));
            return v1111(v1112, v1115);
        end;
        local function v1120(v1117, v1118, v1119)
            -- upvalues: v3 (ref)
            if v1117 == v1118 and v1117 == v1119 then
                return ui.get_icon("arrow-right") .. v3:rep(3);
            elseif v1117 == v1118 then
                return ui.get_icon("arrow-down") .. v3:rep(4);
            elseif v1117 == v1119 then
                return ui.get_icon("arrow-up") .. v3:rep(4);
            elseif v1118 < v1117 and v1117 < v1119 then
                return v3:rep(2) .. ui.get_icon("pipe") .. v3:rep(6);
            else
                return v3:rep(9);
            end;
        end;
        local function v1128(v1121)
            -- upvalues: v10 (ref), v1120 (ref)
            if v1121 == nil then
                return {};
            else
                local l_data_0 = v1121.data;
                local l_sequence_start_0 = v1121.sequence_start;
                local l_sequence_end_0 = v1121.sequence_end;
                if l_data_0 == nil then
                    return {};
                else
                    local v1125 = {};
                    for v1126 = 1, #l_data_0 do
                        local v1127 = l_data_0[v1126];
                        v1125[v1126] = v10(v1120(v1126, l_sequence_start_0, l_sequence_end_0), "\a{Link Active}", v1126, "\aDEFAULT", ":", " ", "Yaw: ", "\a{Link Active}", v1127[4], "\aDEFAULT", " ", "Modifier: ", "\a{Link Active}", v1127[8], "\aDEFAULT");
                    end;
                    return v1125;
                end;
            end;
        end;
        local function v1129()
            -- upvalues: l_v1071_1 (ref)
            return l_v1071_1.state:get();
        end;
        local function v1131(v1130)
            -- upvalues: l_v1071_1 (ref)
            return l_v1071_1[v1130];
        end;
        local function v1136(v1132, v1133)
            local l_status_10, l_result_10 = pcall(json.stringify, v1133);
            if not l_status_10 then
                return false;
            else
                v1132 = v1132.recorder;
                if v1132 == nil then
                    return false;
                else
                    v1132.record:set(l_result_10);
                    return true;
                end;
            end;
        end;
        local function v1140(v1137, v1138, v1139)
            v1137.pitch = v1138[1];
            v1137.yaw = v1138[2];
            v1137.yaw_base = v1138[3];
            v1137.yaw_offset = v1138[4];
            v1137.hidden = v1138[6];
            v1137.yaw_modifier = v1138[7];
            v1137.modifier_offset = v1138[8];
            v1137.body_yaw = v1138[9];
            v1137.inverter = v1138[10];
            v1137.left_limit = v1138[11];
            v1137.right_limit = v1138[12];
            v1137.options = v1138[13];
            v1137.freestanding_body_yaw = v1138[14];
            v1137.delay = nil;
            if v1139 then
                v1137.inverter = not v1137.inverter;
            end;
        end;
        local function v1142()
            -- upvalues: v1128 (ref), v150 (ref), l_v1067_1 (ref)
            local v1141 = v1128(v150.recorder);
            l_v1067_1.sequence_list:update(v1141);
        end;
        local function v1144(v1143)
            -- upvalues: l_v1067_1 (ref)
            l_v1067_1.sequence_list:visibility(v1143);
            l_v1067_1.set_start_button:visibility(v1143);
            l_v1067_1.set_end_button:visibility(v1143);
            l_v1067_1.save_button:visibility(v1143);
            l_v1067_1.import_button:visibility(not v1143);
        end;
        local function v1151()
            -- upvalues: v151 (ref), v1131 (ref), l_v1086_0 (ref)
            for v1145 = 0, #v151.states do
                local v1146 = v151.states[v1145];
                local v1147 = v1131(v1146);
                if v1147 ~= nil then
                    v1147 = v1147.recorder;
                    if v1147 ~= nil then
                        local v1148 = v1147.record:get();
                        local l_status_11, l_result_11 = pcall(json.parse, v1148);
                        if l_status_11 then
                            l_v1086_0[v1146] = l_result_11;
                        end;
                    end;
                end;
            end;
        end;
        l_v1013_0.update = function(_, v1153)
            -- upvalues: v1131 (ref), v150 (ref), l_v1067_1 (ref), v1140 (ref), l_l_match_0_2 (ref), l_v1086_0 (ref), l_v1087_0 (ref)
            local v1154 = v1131(v1153);
            if v1154 == nil then
                return;
            else
                v1154 = v1154.recorder;
                if v1154 == nil then
                    return;
                else
                    local l_data_1 = v150.recorder.data;
                    local l_capture_0 = v150.recorder.capture;
                    if l_data_1 ~= nil and l_capture_0 ~= nil then
                        local v1157 = l_v1067_1.sequence_list:get();
                        if v1157 == nil then
                            return false;
                        else
                            local v1158 = l_data_1[v1157];
                            if v1158 == nil then
                                return false;
                            else
                                local v1159 = v1154.inverse_inverter:get();
                                v1140(l_l_match_0_2, v1158, v1159);
                                return true;
                            end;
                        end;
                    else
                        local v1160 = l_v1086_0[v1153];
                        if v1160 == nil then
                            return false;
                        else
                            local v1161 = #v1160;
                            if globals.choked_commands == 0 then
                                if v1161 <= l_v1087_0 then
                                    l_v1087_0 = 0;
                                end;
                                l_v1087_0 = l_v1087_0 + 1;
                            end;
                            local v1162 = v1160[l_v1087_0];
                            if v1162 == nil then
                                return false;
                            else
                                local v1163 = v1154.inverse_inverter:get();
                                v1140(l_l_match_0_2, v1162, v1163);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1164()
            -- upvalues: v1151 (ref)
            v1151();
        end;
        local _ = nil;
        local function v1167()
            -- upvalues: v150 (ref), l_v1067_1 (ref), v1142 (ref)
            if v150.recorder.capture == nil then
                return;
            else
                local v1166 = l_v1067_1.sequence_list:get();
                if v150.recorder.sequence_end < v1166 then
                    v150.recorder.sequence_end = #v150.recorder.data;
                end;
                v150.recorder.sequence_start = v1166;
                v1142();
                return;
            end;
        end;
        local function v1169()
            -- upvalues: v150 (ref), l_v1067_1 (ref), v1142 (ref)
            if v150.recorder.capture == nil then
                return;
            else
                local v1168 = l_v1067_1.sequence_list:get();
                if v1168 < v150.recorder.sequence_start then
                    v150.recorder.sequence_start = 1;
                end;
                v150.recorder.sequence_end = v1168;
                v1142();
                return;
            end;
        end;
        local function v1175()
            -- upvalues: v1129 (ref), v1131 (ref), v150 (ref), v1136 (ref), v1142 (ref), v1144 (ref), v1151 (ref)
            local v1170 = v1129();
            if v1170 == nil then
                return;
            else
                local v1171 = v1131(v1170);
                if v1171 == nil then
                    return;
                else
                    local l_data_2 = v150.recorder.data;
                    if l_data_2 == nil then
                        return;
                    else
                        local v1173 = {};
                        for v1174 = v150.recorder.sequence_start, v150.recorder.sequence_end do
                            table.insert(v1173, l_data_2[v1174]);
                        end;
                        v1136(v1171, v1173);
                        v150.recorder.data = nil;
                        v150.recorder.capture = nil;
                        v150.recorder.sequence_start = nil;
                        v150.recorder.sequence_end = nil;
                        v1142();
                        v1144(false);
                        v1151();
                        return;
                    end;
                end;
            end;
        end;
        local function v1182()
            -- upvalues: v1129 (ref), v1131 (ref), l_clipboard_0 (ref), v1101 (ref), l_v1091_0 (ref), v150 (ref), v1144 (ref), v1142 (ref)
            local v1176 = v1129();
            if v1176 == nil then
                return;
            elseif v1131(v1176) == nil then
                return;
            else
                local v1177 = l_clipboard_0.get();
                if v1177 == nil then
                    return nil;
                else
                    local v1178, v1179 = v1101(v1177);
                    if not v1178 or v1179 == nil then
                        return;
                    else
                        local v1180, v1181 = l_v1091_0(v1179);
                        v1179 = v1181;
                        if not v1180 or v1179 == nil then
                            return;
                        else
                            v1180 = #v1179;
                            v150.recorder.data = v1179;
                            v150.recorder.capture = v1176;
                            v150.recorder.sequence_start = 1;
                            v150.recorder.sequence_end = v1180;
                            v1144(true);
                            v1142();
                            return;
                        end;
                    end;
                end;
            end;
        end;
        l_v1067_1.set_start_button:set_callback(v1167);
        l_v1067_1.set_end_button:set_callback(v1169);
        l_v1067_1.save_button:set_callback(v1175);
        l_v1067_1.import_button:set_callback(v1182);
        events.update_records(v1164);
        v1144(false);
        v1151();
    end;
    v1067 = {};
    v1071 = v384.antiaim.builder;
    v1085 = nil;
    v1086 = function(v1183)
        local v1184 = {};
        if v1183.x > 0 then
            table.insert(v1184, "Forward");
        end;
        if v1183.x < 0 then
            table.insert(v1184, "Backward");
        end;
        if v1183.y > 0 then
            table.insert(v1184, "Right");
        end;
        if v1183.y < 0 then
            table.insert(v1184, "Left");
        end;
        return table.concat(v1184, "-");
    end;
    do
        local l_v1071_2, l_v1085_1, l_v1086_1, l_v1087_1, l_v1091_1 = v1071, v1085, v1086, v1087, v1091;
        l_v1087_1 = function(v1190)
            -- upvalues: l_v1086_1 (ref), v394 (ref), l_l_match_0_2 (ref)
            local l_angles_1 = v1190.angles;
            local v1192 = l_angles_1.yaw_offset:get();
            local v1193 = nil;
            local v1194 = nil;
            local v1195 = l_angles_1.random:get();
            local v1196 = l_angles_1.add_yaw:get();
            if v1196 then
                v1193 = l_angles_1.yaw_left:get();
                v1194 = l_angles_1.yaw_right:get();
            end;
            if l_angles_1.direction ~= nil then
                local v1197 = l_angles_1[l_v1086_1(vector(v394.forwardmove, v394.sidemove))];
                if v1197 ~= nil and v1197.enabled:get() then
                    v1192 = v1197.yaw_offset:get();
                    if v1196 then
                        v1193 = v1197.yaw_left:get();
                        v1194 = v1197.yaw_right:get();
                    end;
                end;
            end;
            if v1195 > 0 and v1193 ~= nil and v1194 ~= nil then
                local v1198 = v1195 * 0.01;
                local v1199 = utils.random_float(-v1198 * 0.6, v1198 * 0.6);
                v1193 = v1193 + v1193 * v1199;
                v1194 = v1194 + v1194 * v1199;
            end;
            l_l_match_0_2.yaw = "Backward";
            l_l_match_0_2.yaw_offset = v1192;
            l_l_match_0_2.yaw_left = v1193;
            l_l_match_0_2.yaw_right = v1194;
        end;
        l_v1091_1 = function(v1200)
            -- upvalues: l_l_match_0_2 (ref)
            local l_angles_2 = v1200.angles;
            local v1202 = l_angles_2.yaw_jitter:get();
            local v1203 = l_angles_2.jitter_offset:get();
            if v1202 == "Off" then
                l_l_match_0_2.yaw_modifier = "Disabled";
                l_l_match_0_2.modifier_offset = nil;
                return;
            else
                local v1204 = l_angles_2.random:get();
                if v1204 > 0 then
                    local v1205 = v1204 * 0.01;
                    v1203 = v1203 + v1203 * utils.random_float(-v1205 * 0.6, v1205 * 0.6);
                end;
                l_l_match_0_2.yaw_modifier = v1202;
                l_l_match_0_2.modifier_offset = v1203;
                if l_angles_2.way ~= nil then
                    l_l_match_0_2.way = {};
                    for v1206 = 1, #l_angles_2.way do
                        l_l_match_0_2.way[v1206] = l_angles_2.way[v1206]:get();
                    end;
                end;
                return;
            end;
        end;
        local function v1215(v1207)
            -- upvalues: l_l_match_0_2 (ref)
            local l_angles_3 = v1207.angles;
            local v1209 = l_angles_3.body_yaw:get();
            local v1210 = l_angles_3.left_limit:get();
            local v1211 = l_angles_3.right_limit:get();
            local v1212 = v1209 ~= "Off";
            if v1212 then
                l_l_match_0_2.options = {};
                l_l_match_0_2.left_limit = v1210;
                l_l_match_0_2.right_limit = v1211;
                if v1209 == "Left" then
                    l_l_match_0_2.inverter = true;
                    l_l_match_0_2.right_limit = v1210;
                end;
                if v1209 == "Right" then
                    l_l_match_0_2.inverter = false;
                    l_l_match_0_2.left_limit = v1211;
                end;
                if v1209 == "Jitter" then
                    table.insert(l_l_match_0_2.options, "Jitter");
                end;
                if v1209 == "Random" then
                    table.insert(l_l_match_0_2.options, "Jitter");
                    table.insert(l_l_match_0_2.options, "Randomize Jitter");
                end;
                if l_angles_3.avoid_overlap:get() then
                    table.insert(l_l_match_0_2.options, "Avoid Overlap");
                end;
                l_l_match_0_2.freestanding_body_yaw = l_angles_3.freestanding_body_yaw:get();
            end;
            local v1213 = l_angles_3.delay:get();
            local v1214 = l_angles_3.random_delay:get();
            if v1213 ~= nil and v1213 > 1 then
                if v1214 ~= nil and v1214 > 0 then
                    v1213 = utils.random_int(v1213, v1214);
                end;
                l_l_match_0_2.delay = v1213;
            end;
            l_l_match_0_2.body_yaw = v1212;
        end;
        v1067.get = function(_, v1217)
            -- upvalues: l_v1071_2 (ref)
            return l_v1071_2[v1217];
        end;
        v1067.is_active_ex = function(_, v1219)
            return v1219.enabled == nil or v1219.enabled:get();
        end;
        v1067.is_active = function(v1220, v1221)
            -- upvalues: v1067 (ref)
            local v1222 = v1220:get(v1221);
            if v1222 == nil then
                return false;
            else
                return v1067:is_active_ex(v1222);
            end;
        end;
        v1067.get_old_items = function(_)
            -- upvalues: l_v1085_1 (ref)
            return l_v1085_1;
        end;
        v1067.apply_ex = function(_, v1225)
            -- upvalues: l_l_match_0_2 (ref), l_v1087_1 (ref), l_v1091_1 (ref), v1215 (ref), l_v1085_1 (ref)
            if v1225 == nil then
                return false;
            else
                if v1225.angles ~= nil then
                    l_l_match_0_2.enabled = true;
                    l_l_match_0_2.pitch = "Down";
                    l_l_match_0_2.yaw_base = "At Target";
                    l_v1087_1(v1225);
                    l_v1091_1(v1225);
                    v1215(v1225);
                end;
                l_v1085_1 = v1225;
                return true;
            end;
        end;
        v1067.apply = function(v1226, v1227)
            -- upvalues: l_v1013_0 (ref)
            local v1228 = v1226:get(v1227);
            if v1228 == nil then
                return nil;
            elseif not v1226:is_active_ex(v1228) then
                return nil;
            else
                local v1229 = v1228.mode:get();
                if v1229 == "Builder" then
                    v1226:apply_ex(v1228);
                end;
                if v1229 == "Recorder" then
                    l_v1013_0:update(v1227);
                end;
                return v1228;
            end;
        end;
        v1067.update = function(v1230, _)
            -- upvalues: v398 (ref)
            if rage.exploit:get() ~= 1 then
                local v1232 = v1230:apply("Fakelag");
                if v1232 ~= nil then
                    return v1232;
                end;
            end;
            local v1233 = v1230:apply((v398.get()));
            if v1233 ~= nil then
                return v1233;
            else
                return v1230:apply("Shared");
            end;
        end;
        v865.builder = v1067;
    end;
    v1071 = {};
    v1085 = v384.antiaim.settings.antibrute;
    v1086 = nil;
    v1087 = nil;
    v1091 = nil;
    local v1234 = nil;
    local v1235 = v414.get_event_bus();
    do
        local l_v1085_2, l_v1086_2, l_v1087_2, l_v1091_2, l_v1234_0, l_v1235_0 = v1085, v1086, v1087, v1091, v1234, v1235;
        local function v1242()
            -- upvalues: l_v1085_2 (ref)
            if l_v1085_2.refresh_offset:get() then
                return math.random(-7, 13);
            else
                return nil;
            end;
        end;
        local function v1244()
            -- upvalues: l_v1085_2 (ref)
            local v1243 = l_v1085_2.refresh_modifier:get();
            if v1243 == "increase" then
                return math.random(0, 5);
            elseif v1243 == "decrease" then
                return math.random(-5, 0);
            elseif v1243 == "adaptive" then
                return math.random(-3, 5);
            else
                return nil;
            end;
        end;
        local function v1245()
            -- upvalues: l_v1086_2 (ref), l_v1087_2 (ref), l_v1091_2 (ref), l_v1234_0 (ref)
            l_v1086_2 = nil;
            l_v1087_2 = nil;
            l_v1091_2 = nil;
            l_v1234_0 = nil;
        end;
        v1071.update = function(_, _)
            -- upvalues: l_v1085_2 (ref), l_v1086_2 (ref), v1245 (ref), l_v1087_2 (ref), l_l_match_0_2 (ref), l_v1091_2 (ref), l_v1234_0 (ref)
            if not l_v1085_2.enabled:get() then
                return false;
            elseif l_v1086_2 ~= nil and globals.curtime > l_v1086_2 then
                v1245();
                return false;
            else
                if l_v1087_2 ~= nil then
                    l_l_match_0_2.delay = l_v1087_2;
                end;
                if l_v1091_2 ~= nil and l_l_match_0_2.yaw_offset ~= nil then
                    l_l_match_0_2.yaw_offset = l_l_match_0_2.yaw_offset + l_v1091_2;
                end;
                if l_v1234_0 ~= nil and l_l_match_0_2.modifier_offset ~= nil then
                    l_l_match_0_2.modifier_offset = l_l_match_0_2.modifier_offset + l_v1234_0;
                end;
                return true;
            end;
        end;
        local function v1249()
            -- upvalues: l_v1085_2 (ref), l_v1086_2 (ref), l_v1087_2 (ref), l_v1091_2 (ref), v1242 (ref), l_v1234_0 (ref), v1244 (ref)
            local v1248 = l_v1085_2.duration:get();
            if v1248 ~= 0 then
                l_v1086_2 = globals.curtime + v1248 * 0.1;
            end;
            if l_v1085_2.enforce_delay:get() then
                l_v1087_2 = math.random(1, 5);
            end;
            l_v1091_2 = v1242();
            l_v1234_0 = v1244();
        end;
        local _ = nil;
        local function v1253(v1251)
            -- upvalues: v1245 (ref), l_v1235_0 (ref), v1249 (ref)
            local v1252 = v1251:get();
            if not v1252 then
                v1245();
            end;
            l_v1235_0.enemy_shot:set(v1249, v1252);
        end;
        do
            local l_v1253_0 = v1253;
            local function v1257(v1255)
                -- upvalues: v1245 (ref), l_v1235_0 (ref), v1249 (ref), l_v1085_2 (ref), l_v1253_0 (ref)
                local v1256 = v1255:get();
                if not v1256 then
                    v1245();
                    l_v1235_0.enemy_shot:set(v1249, false);
                end;
                if v1256 then
                    l_v1085_2.enabled:set_callback(l_v1253_0, true);
                else
                    l_v1085_2.enabled:unset_callback(l_v1253_0);
                end;
            end;
            v384.antiaim.enabled:set_callback(v1257, true);
        end;
    end;
    v1085 = {};
    v1086 = v384.antiaim.settings.roll;
    do
        local l_v1086_3, l_v1087_3 = v1086, v1087;
        l_v1087_3 = function()
            -- upvalues: l_v1086_3 (ref)
            if l_v1086_3.change_on_fakelag:get() and rage.exploit:get() ~= 1 then
                return l_v1086_3.fakelag_value:get();
            else
                return l_v1086_3.value:get();
            end;
        end;
        v1085.update = function(_, v1261)
            -- upvalues: l_v1087_3 (ref)
            local v1262 = l_v1087_3();
            if v1262 == nil or v1262 == 0 then
                return;
            else
                v1261.view_angles.z = v1262;
                return;
            end;
        end;
    end;
    v1086 = {};
    v1087 = false;
    do
        local l_v1087_4, l_v1091_3 = v1087, v1091;
        l_v1091_3 = function(v1265, v1266)
            -- upvalues: l_play_0 (ref), l_v1087_4 (ref)
            local v1267 = entity.get_local_player();
            if v1267 == nil then
                return false;
            else
                local v1268 = v1267:get_player_weapon();
                if v1268 == nil then
                    return false;
                else
                    local l_m_iTeamNum_0 = v1267.m_iTeamNum;
                    local v1270 = v1267:get_origin();
                    local v1271 = v1268:get_weapon_index() == 49;
                    if v1267.m_bIsDefusing or v1267.m_bIsGrabbingHostage then
                        return false;
                    elseif v1267.m_bInBombZone and (not v1266.bomb_e_fix:get() or v1271) then
                        return false;
                    else
                        if l_m_iTeamNum_0 == 3 and v1265.view_angles.x > 15 then
                            local v1272 = entity.get_entities("CPlantedC4");
                            for v1273 = 1, #v1272 do
                                if (v1272[v1273]:get_origin() - v1270):lengthsqr() < 3844 then
                                    return false;
                                end;
                            end;
                        end;
                        local v1274 = l_play_0.camera_angles();
                        local v1275 = vector():angles(v1274);
                        local v1276 = v1267:get_eye_position();
                        local v1277 = v1276 + v1275 * 128;
                        local v1278 = utils.trace_line(v1276, v1277, v1267, 4294967295, 0);
                        if v1278.fraction ~= 1 then
                            local l_entity_0 = v1278.entity;
                            if l_entity_0 == nil then
                                return true;
                            else
                                local v1280 = l_entity_0:get_classname();
                                if v1280 == "CWorld" then
                                    return true;
                                elseif v1280 == "CFuncBrush" then
                                    return true;
                                elseif v1280 == "CCSPlayer" then
                                    return true;
                                elseif v1280 == "CHostage" and v1276:distsqr((l_entity_0:get_origin())) < 7056 then
                                    return false;
                                elseif not l_v1087_4 then
                                    l_v1087_4 = true;
                                    return false;
                                end;
                            end;
                        end;
                        return true;
                    end;
                end;
            end;
        end;
        v1086.update = function(_, v1282)
            -- upvalues: l_v1087_4 (ref), v1067 (ref), l_v1091_3 (ref), l_l_angles_0_1 (ref), l_v1003_0 (ref), l_l_match_0_2 (ref)
            if not v1282.in_use then
                l_v1087_4 = false;
                return false;
            else
                local v1283 = v1067:get("On use");
                if v1283 == nil then
                    return false;
                elseif not v1067:is_active_ex(v1283) then
                    return false;
                elseif not l_v1091_3(v1282, v1283) then
                    return false;
                else
                    v1282.in_use = false;
                    v1067:apply_ex(v1283);
                    if v1283 ~= nil and v1283.defensive ~= nil then
                        l_l_angles_0_1:apply(v1282, v1283.defensive);
                        l_v1003_0:update(v1282, v1283.defensive);
                    end;
                    if l_l_match_0_2.yaw_offset ~= nil then
                        l_l_match_0_2.yaw_offset = l_l_match_0_2.yaw_offset + 180;
                    end;
                    l_l_match_0_2.pitch = "Disabled";
                    l_l_match_0_2.yaw_base = "Local View";
                    l_l_match_0_2.freestanding = false;
                    return true;
                end;
            end;
        end;
    end;
    v1087 = {};
    v1091 = v384.antiaim.settings.manual_yaw;
    v1234 = {
        Backward = 0, 
        Forward = 180, 
        Right = 90, 
        Left = -90
    };
    do
        local l_v1091_4, l_v1234_1, l_v1235_1 = v1091, v1234, v1235;
        l_v1235_1 = function()
            -- upvalues: l_v1234_1 (ref), l_v1091_4 (ref)
            return l_v1234_1[l_v1091_4.select:get()];
        end;
        v1087.update = function(_, v1288)
            -- upvalues: l_v1235_1 (ref), l_l_match_0_2 (ref), l_v1091_4 (ref), v1067 (ref), l_v1003_0 (ref), l_l_angles_0_1 (ref)
            local v1289 = l_v1235_1();
            if v1289 == nil then
                return false;
            else
                local v1290 = l_l_match_0_2.yaw_offset or 0;
                l_l_match_0_2.enabled = true;
                l_l_match_0_2.yaw_offset = v1290 + v1289;
                l_l_match_0_2.freestanding = false;
                if l_v1091_4.disable_yaw_modifiers:get() then
                    l_l_match_0_2.yaw_offset = v1290 + v1289;
                    l_l_match_0_2.yaw_left = 0;
                    l_l_match_0_2.yaw_right = 0;
                    l_l_match_0_2.yaw_modifier = "Disabled";
                    l_l_match_0_2.modifier_offset = 0;
                end;
                if l_v1091_4.body_freestanding:get() then
                    l_l_match_0_2.body_yaw = true;
                    l_l_match_0_2.left_limit = 60;
                    l_l_match_0_2.right_limit = 60;
                    l_l_match_0_2.options = {};
                    l_l_match_0_2.freestanding_body_yaw = "Peek Fake";
                end;
                local v1291 = v1067:apply("Manual Yaw");
                if v1291 ~= nil then
                    l_l_match_0_2.yaw_offset = l_l_match_0_2.yaw_offset + v1289;
                    if v1291.defensive ~= nil and (l_v1003_0:update(v1288, v1291.defensive) or l_l_angles_0_1:apply(v1288, v1291.defensive)) then
                        local l_yaw_offset_0 = l_l_match_0_2.defensive.yaw_offset;
                        if l_yaw_offset_0 ~= nil then
                            l_l_match_0_2.defensive.yaw_offset = l_yaw_offset_0 + v1289;
                        end;
                    end;
                end;
                l_l_match_0_2.yaw_base = "Local View";
                return true;
            end;
        end;
    end;
    v1091 = {};
    v1234 = v384.antiaim.settings.freestanding;
    v1235 = function()
        -- upvalues: v394 (ref), v26 (ref)
        if not v394.is_onground then
            return "Air";
        elseif v394.is_crouched then
            return "Crouching";
        elseif v394.is_moving then
            if v26.antiaim.misc.slow_walk:get() then
                return "Slow motion";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1234_2, l_v1235_2 = v1234, v1235;
        local function v1295()
            -- upvalues: l_v1234_2 (ref), l_v1235_2 (ref)
            return l_v1234_2.disablers:get(l_v1235_2());
        end;
        local function v1296()
            -- upvalues: l_v1234_2 (ref), v1295 (ref)
            return l_v1234_2.enabled:get() and not v1295();
        end;
        local function v1299()
            local v1297 = rage.antiaim:get_target(false);
            local v1298 = rage.antiaim:get_target(true);
            if v1297 == nil or v1298 == nil then
                return nil;
            else
                return v1298 - v1297;
            end;
        end;
        local function v1304(v1300)
            -- upvalues: v1299 (ref), v1067 (ref), l_l_match_0_2 (ref), l_v1234_2 (ref), l_v1003_0 (ref), l_l_angles_0_1 (ref)
            local v1301 = v1299();
            if v1301 == nil then
                return;
            else
                local v1302 = v1067:apply("Freestanding");
                if v1302 == nil then
                    l_l_match_0_2.freestanding = true;
                    l_l_match_0_2.freestanding_disable_yaw_modifiers = l_v1234_2.disable_yaw_modifiers:get();
                    l_l_match_0_2.freestanding_body_freestanding = l_v1234_2.body_freestanding:get();
                    return;
                else
                    l_l_match_0_2.yaw_offset = l_l_match_0_2.yaw_offset + v1301;
                    if v1302.defensive ~= nil and (l_v1003_0:update(v1300, v1302.defensive) or l_l_angles_0_1:apply(v1300, v1302.defensive)) then
                        local l_yaw_offset_1 = l_l_match_0_2.defensive.yaw_offset;
                        if l_yaw_offset_1 ~= nil then
                            l_l_match_0_2.defensive.yaw_offset = l_yaw_offset_1 + v1301;
                        end;
                    end;
                    l_l_match_0_2.freestanding = false;
                    return;
                end;
            end;
        end;
        v1091.update = function(_, v1306)
            -- upvalues: v1296 (ref), l_l_match_0_2 (ref), v1304 (ref)
            if not v1296() then
                l_l_match_0_2.freestanding = false;
                return false;
            else
                v1304(v1306);
                return true;
            end;
        end;
    end;
    v1234 = {};
    v1235 = v384.antiaim.settings.edge_yaw;
    local function v1321(v1307)
        local v1308 = entity.get_local_player();
        if v1308 == nil then
            return nil;
        else
            local v1309 = v1308:get_eye_position();
            if v1309 == nil then
                return nil;
            else
                local v1310 = 1;
                local v1311 = nil;
                local v1312 = {};
                for v1313 = -180, 179, 45 do
                    local v1314 = v1309 + vector():angles(vector(0, v1313, 0)) * 24;
                    local v1315 = utils.trace_line(v1309, v1314, v1308);
                    if v1315.fraction < v1310 and (v1315.entity == nil or not v1315.entity:is_player()) then
                        local l_fraction_0 = v1315.fraction;
                        v1311 = v1313;
                        v1310 = l_fraction_0;
                    end;
                end;
                if v1311 == nil then
                    return nil;
                else
                    for v1317 = v1311 - 30, v1311 + 30, 10 do
                        local v1318 = v1309 + vector():angles(vector(0, v1317, 0)) * 24;
                        local v1319 = utils.trace_line(v1309, v1318, v1308, nil, 1);
                        if v1319.fraction < 1 then
                            v1312[#v1312 + 1] = v1317;
                            if v1319.fraction < v1310 then
                                local l_fraction_1 = v1319.fraction;
                                v1311 = v1317;
                                v1310 = l_fraction_1;
                            end;
                        end;
                    end;
                    return math.normalize_yaw(v1311 * 2 - v1307.move_yaw);
                end;
            end;
        end;
    end;
    do
        local l_v1235_3, l_v1321_0 = v1235, v1321;
        v1234.update = function(_, v1325)
            -- upvalues: l_v1235_3 (ref), l_v1321_0 (ref), l_l_match_0_2 (ref)
            if not l_v1235_3.enabled:get() then
                return false;
            else
                local v1326 = l_v1321_0(v1325);
                if v1326 == nil then
                    return false;
                else
                    l_l_match_0_2.yaw_offset = (l_l_match_0_2.yaw_offset or 0) + v1326;
                    return true;
                end;
            end;
        end;
    end;
    v1235 = {};
    v1321 = v384.antiaim.settings.safe_head;
    local v1327 = 0;
    local v1328 = 1440000;
    local function v1330(v1329)
        return v1329:get_weapon_index() == 31;
    end;
    do
        local l_v1321_1, l_v1327_0, l_v1328_0, l_v1330_0 = v1321, v1327, v1328, v1330;
        local function v1337(v1335)
            -- upvalues: l_v1330_0 (ref), l_v1327_0 (ref)
            if l_v1330_0(v1335) then
                return false;
            else
                local v1336 = v1335:get_weapon_info();
                if v1336 == nil then
                    return false;
                else
                    return v1336.weapon_type == l_v1327_0;
                end;
            end;
        end;
        local function v1348()
            -- upvalues: v1337 (ref), l_v1330_0 (ref), v394 (ref), l_v1321_1 (ref), l_v1328_0 (ref)
            local v1338 = entity.get_local_player();
            if v1338 == nil then
                return nil;
            else
                local v1339 = v1338:get_player_weapon();
                if v1339 == nil then
                    return nil;
                else
                    local v1340 = entity.get_threat();
                    if v1340 == nil then
                        return nil;
                    else
                        local v1341 = v1337(v1339);
                        local v1342 = l_v1330_0(v1339);
                        local v1343 = not v394.is_onground;
                        local l_is_moving_0 = v394.is_moving;
                        local l_is_crouched_0 = v394.is_crouched;
                        local v1346 = v1338:get_origin() - v1340:get_origin();
                        local v1347 = v1346:lengthsqr();
                        if v1341 and v1343 and l_is_crouched_0 and l_v1321_1.select:get("With Knife") then
                            return "With Knife";
                        elseif v1342 and v1343 and l_is_crouched_0 and l_v1321_1.select:get("With Taser") then
                            return "With Taser";
                        elseif v1346.z > 50 and (not l_is_moving_0 or l_is_crouched_0) and l_v1321_1.select:get("Above Enemy") then
                            return "Above Enemy";
                        elseif l_v1328_0 < v1347 and not l_is_moving_0 and l_is_crouched_0 and l_v1321_1.select:get("Far from Enemy") then
                            return "Far from Enemy";
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
        local function v1352(v1349, _)
            -- upvalues: v1067 (ref), l_l_angles_0_1 (ref), l_v1003_0 (ref), l_l_match_0_2 (ref)
            local v1351 = v1067:apply("Safe Head");
            if v1351 ~= nil then
                if v1349 ~= nil and v1351.defensive ~= nil then
                    l_l_angles_0_1:apply(v1349, v1351.defensive);
                    l_v1003_0:update(v1349, v1351.defensive);
                end;
                return true;
            else
                l_l_match_0_2.pitch = "Down";
                l_l_match_0_2.yaw_base = "At Target";
                l_l_match_0_2.yaw = "Backward";
                l_l_match_0_2.yaw_offset = 10;
                l_l_match_0_2.yaw_left = 0;
                l_l_match_0_2.yaw_right = 0;
                l_l_match_0_2.yaw_modifier = "Off";
                l_l_match_0_2.modifier_offset = 0;
                l_l_match_0_2.body_yaw = true;
                l_l_match_0_2.left_limit = 0;
                l_l_match_0_2.right_limit = 0;
                l_l_match_0_2.freestanding_body_yaw = "Off";
                return;
            end;
        end;
        v1235.update = function(_, v1354)
            -- upvalues: v1348 (ref), v1352 (ref)
            local v1355 = v1348();
            if v1355 == nil then
                return false;
            else
                v1352(v1354, v1355);
                return true;
            end;
        end;
    end;
    v1321 = function()
        -- upvalues: l_l_match_0_2 (ref), l_v912_1 (ref), v7 (ref), l_v866_1 (ref), l_v867_2 (ref)
        if rage.exploit:get() == 1 then
            local v1356 = math.max(1, l_l_match_0_2.delay or 1);
            l_v912_1 = l_v912_1 + 1;
            if l_v912_1 < v1356 then
                return;
            end;
        end;
        local v1357 = true;
        if l_l_match_0_2.options ~= nil and v7(l_l_match_0_2.options, "Randomize Jitter") ~= nil then
            v1357 = utils.random_int(0, 1) == 0;
        end;
        l_v866_1 = l_v866_1 + 1;
        if v1357 then
            l_v867_2 = not l_v867_2;
        end;
        l_v912_1 = 0;
    end;
    v1327 = function()
        -- upvalues: l_l_match_0_2 (ref), l_v913_1 (ref), l_v909_0 (ref), l_v910_1 (ref)
        local l_defensive_0 = l_l_match_0_2.defensive;
        local v1359 = 1;
        if l_defensive_0 ~= nil and l_defensive_0.delay ~= nil then
            v1359 = math.max(1, l_defensive_0.delay);
        end;
        l_v913_1 = l_v913_1 + 1;
        if l_v913_1 < v1359 then
            return;
        else
            l_v909_0 = l_v909_0 + 1;
            l_v910_1 = not l_v910_1;
            l_v913_1 = 0;
            return;
        end;
    end;
    v1328 = function()
        -- upvalues: l_l_match_0_2 (ref), l_v910_1 (ref), l_v909_0 (ref), l_v911_1 (ref)
        local l_defensive_1 = l_l_match_0_2.defensive;
        if l_defensive_1 == nil then
            return;
        else
            if l_defensive_1.pitch_offset ~= nil then
                rage.antiaim:override_hidden_pitch(l_defensive_1.pitch_offset);
            end;
            if l_defensive_1.yaw_offset ~= nil then
                local l_yaw_offset_2 = l_defensive_1.yaw_offset;
                if l_l_match_0_2.yaw_offset ~= nil then
                    l_yaw_offset_2 = l_yaw_offset_2 - l_l_match_0_2.yaw_offset;
                end;
                if l_defensive_1.yaw_left ~= nil and l_v910_1 == true then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_left;
                end;
                if l_defensive_1.yaw_right ~= nil and l_v910_1 == false then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_right;
                end;
                if l_defensive_1.yaw_modifier == "Offset" then
                    local l_modifier_offset_0 = l_defensive_1.modifier_offset;
                    if not l_v910_1 then
                        l_modifier_offset_0 = 0;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + l_modifier_offset_0;
                end;
                if l_defensive_1.yaw_modifier == "Center" then
                    local v1363 = l_defensive_1.modifier_offset * 0.5;
                    if not l_v910_1 then
                        v1363 = -v1363;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + v1363;
                end;
                if l_defensive_1.yaw_modifier == "Skitter" then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.modifier_offset * l_v911_1[l_v909_0 % #l_v911_1 + 1];
                end;
                rage.antiaim:override_hidden_yaw_offset(-l_yaw_offset_2);
            end;
            return;
        end;
    end;
    v1330 = function()
        -- upvalues: l_l_match_0_2 (ref)
        if l_l_match_0_2.yaw_left ~= nil and l_l_match_0_2.yaw_right ~= nil then
            local v1364 = l_l_match_0_2.yaw_offset or 0;
            if l_l_match_0_2.inverter == true then
                l_l_match_0_2.yaw_offset = v1364 + l_l_match_0_2.yaw_left;
            end;
            if l_l_match_0_2.inverter == false then
                l_l_match_0_2.yaw_offset = v1364 + l_l_match_0_2.yaw_right;
            end;
            return;
        else
            return;
        end;
    end;
    local function v1380()
        -- upvalues: l_l_match_0_2 (ref), l_v867_2 (ref), l_v866_1 (ref), l_v911_1 (ref), v14 (ref)
        if l_l_match_0_2.yaw_modifier == "Offset" then
            local v1365 = l_l_match_0_2.yaw_offset or 0;
            local l_modifier_offset_1 = l_l_match_0_2.modifier_offset;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1365 + (l_v867_2 and l_modifier_offset_1 or 0);
            return;
        elseif l_l_match_0_2.yaw_modifier == "Center" then
            local v1367 = l_l_match_0_2.yaw_offset or 0;
            local l_modifier_offset_2 = l_l_match_0_2.modifier_offset;
            if not l_v867_2 then
                l_modifier_offset_2 = -l_modifier_offset_2;
            end;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1367 + l_modifier_offset_2 / 2;
            return;
        elseif l_l_match_0_2.yaw_modifier == "Skitter" then
            local v1369 = l_v911_1[l_v866_1 % #l_v911_1 + 1];
            local v1370 = l_l_match_0_2.yaw_offset or 0;
            local l_modifier_offset_3 = l_l_match_0_2.modifier_offset;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1370 + l_modifier_offset_3 * v1369;
            return;
        elseif l_l_match_0_2.yaw_modifier == "Custom Ways" then
            local v1372 = l_l_match_0_2.yaw_offset or 0;
            local v1373 = 0;
            if l_l_match_0_2.way ~= nil then
                local v1374 = l_l_match_0_2.way[l_v866_1 % 3 + 1];
                if v1374 ~= nil then
                    v1373 = v1374;
                end;
            end;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1372 + v1373;
            return;
        elseif l_l_match_0_2.yaw_modifier == "Spin" then
            local v1375 = globals.curtime * 3;
            local v1376 = l_l_match_0_2.yaw_offset or 0;
            local l_modifier_offset_4 = l_l_match_0_2.modifier_offset;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1376 + v14.lerp(-l_modifier_offset_4, l_modifier_offset_4, v1375 % 1);
            return;
        elseif l_l_match_0_2.yaw_modifier == "Random" then
            local v1378 = l_l_match_0_2.yaw_offset or 0;
            local l_modifier_offset_5 = l_l_match_0_2.modifier_offset;
            l_l_match_0_2.yaw_modifier = "Off";
            l_l_match_0_2.modifier_offset = 0;
            l_l_match_0_2.yaw_offset = v1378 + utils.random_int(-l_modifier_offset_5, l_modifier_offset_5);
            return;
        else
            return;
        end;
    end;
    local function v1385()
        -- upvalues: l_l_match_0_2 (ref), l_v867_2 (ref)
        if l_l_match_0_2.options == nil then
            return;
        else
            local v1381 = false;
            local v1382 = {};
            for v1383 = 1, #l_l_match_0_2.options do
                local v1384 = l_l_match_0_2.options[v1383];
                if v1384 == "Jitter" then
                    v1381 = true;
                elseif v1384 ~= "Randomize Jitter" then
                    table.insert(v1382, v1384);
                end;
            end;
            if v1381 then
                l_l_match_0_2.inverter = l_v867_2;
            end;
            l_l_match_0_2.options = v1382;
            return;
        end;
    end;
    local function v1388(v1386)
        -- upvalues: l_l_angles_0_1 (ref), v1067 (ref), v1071 (ref), v1086 (ref), v1085 (ref), v1087 (ref), v1091 (ref), v1235 (ref), v1234 (ref), l_v1003_0 (ref)
        l_l_angles_0_1:update(v1386);
        local v1387 = v1067:update();
        v1071:update(v1386);
        if v1086:update(v1386) then
            return;
        else
            v1085:update(v1386);
            if v1087:update(v1386) then
                return;
            elseif v1091:update(v1386) then
                return;
            elseif v1235:update(v1386) then
                return;
            elseif v1234:update(v1386) then
                return;
            else
                if v1387 ~= nil and v1387.defensive ~= nil then
                    l_l_angles_0_1:apply(v1386, v1387.defensive);
                    l_v1003_0:update(v1386, v1387.defensive);
                end;
                return;
            end;
        end;
    end;
    local function v1390(v1389)
        -- upvalues: v1321 (ref), v1327 (ref), v1385 (ref), v1380 (ref), v1330 (ref), v1328 (ref)
        rage.antiaim:override_hidden_yaw_offset(0);
        if v1389.choked_commands == 0 then
            v1321();
            v1327();
        end;
        v1385();
        v1380();
        v1330();
        v1328();
    end;
    local function v1391()
        -- upvalues: l_l_match_0_2 (ref)
        l_l_match_0_2:unset();
    end;
    local function v1393(v1392)
        -- upvalues: l_l_match_0_2 (ref), v1388 (ref), v1390 (ref)
        l_l_match_0_2:clear();
        l_l_match_0_2:unset();
        v1388(v1392);
        v1390(v1392);
        l_l_match_0_2:set();
    end;
    local _ = nil;
    local l_antiaim_0 = v384.antiaim;
    local function v1398(v1396)
        -- upvalues: l_l_match_0_2 (ref), v26 (ref), v1391 (ref), v1393 (ref)
        local v1397 = v1396:get();
        if not v1397 then
            l_l_match_0_2:unset();
            v26.ragebot.main.hide_shots[2]:override();
            v26.ragebot.main.double_tap[2]:override();
        end;
        events.shutdown(v1391, v1397);
        events.createmove(v1393, v1397);
    end;
    l_antiaim_0.enabled:set_callback(v1398, true);
end;
v866 = nil;
v867 = nil;
v909 = v384.ragebot.aimtools;
v910 = 0;
v911 = 1;
v912 = 2;
v913 = 3;
l_match_0 = 4;
l_angles_0 = 5;
v1003 = 6;
v1013 = 7;
local v1399 = 10;
local v1400 = 1;
local v1401 = 5;
local l_aimtools_0 = v151.aimtools;
local v1403 = {};
local v1404 = {};
do
    local l_v909_1, l_v911_2, l_v913_2, l_v1003_1, l_v1013_1, l_v1400_0, l_v1401_0, l_l_aimtools_0_0, l_v1403_0, l_v1404_0 = v909, v911, v913, v1003, v1013, v1400, v1401, l_aimtools_0, v1403, v1404;
    local function v1416(v1415)
        -- upvalues: l_v1404_0 (ref)
        l_v1404_0[v1415] = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1415, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1415, "Multipoint", "Body Scale"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1415, "Hit Chance"), 
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1415, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1415, "Safe Points")
        };
    end;
    for v1417 = 1, #l_l_aimtools_0_0 do
        v1416(l_l_aimtools_0_0[v1417]);
    end;
    v1416 = function(v1418)
        -- upvalues: l_v1400_0 (ref), l_v1401_0 (ref)
        local v1419 = v1418:get_weapon_info();
        if v1419 == nil then
            return nil;
        else
            local l_weapon_type_0 = v1419.weapon_type;
            local v1421 = v1418:get_weapon_index();
            if l_weapon_type_0 == l_v1400_0 then
                if v1421 == 1 then
                    return "Desert Eagle";
                elseif v1421 == 64 then
                    return "R8 Revolver";
                else
                    return "Pistols";
                end;
            elseif l_weapon_type_0 == l_v1401_0 then
                if v1421 == 9 then
                    return "AWP";
                elseif v1421 == 40 then
                    return "SSG-08";
                else
                    return "AutoSnipers";
                end;
            else
                return nil;
            end;
        end;
    end;
    local function v1423(v1422)
        -- upvalues: l_v911_2 (ref), l_v913_2 (ref), l_v1003_1 (ref), l_v1013_1 (ref)
        if v1422 == l_v911_2 then
            return 4;
        elseif v1422 == l_v913_2 then
            return 1.25;
        elseif v1422 == l_v1003_1 then
            return 0.75;
        elseif v1422 == l_v1013_1 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1428(v1424, v1425, v1426, v1427)
        -- upvalues: v1423 (ref), l_v911_2 (ref)
        v1425 = v1425 * v1423(v1426);
        if v1424.m_ArmorValue > 0 then
            if v1426 == l_v911_2 then
                if v1424.m_bHasHelmet then
                    v1425 = v1425 * (v1427 * 0.5);
                end;
            else
                v1425 = v1425 * (v1427 * 0.5);
            end;
        end;
        return v1425;
    end;
    local function v1440(v1429, v1430, v1431, v1432, v1433)
        -- upvalues: v1428 (ref)
        local v1434 = v1430 - v1429;
        local l_damage_0 = v1433.damage;
        local l_armor_ratio_0 = v1433.armor_ratio;
        local l_range_0 = v1433.range;
        local l_range_modifier_0 = v1433.range_modifier;
        local v1439 = math.min(l_range_0, v1434:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v1439 * 0.002);
        return (v1428(v1431, l_damage_0, v1432, l_armor_ratio_0));
    end;
    local function v1445(v1441, v1442)
        local v1443 = v1441:get_origin();
        local v1444 = v1442:get_origin();
        return v1443.z - v1444.z > 53;
    end;
    local function v1449(v1446, v1447)
        local v1448 = v1446:get_origin();
        return v1447:get_origin().z - v1448.z > 53;
    end;
    local function v1455(v1450, v1451, v1452, v1453, v1454)
        -- upvalues: v1440 (ref)
        return v1440(v1450, v1451, v1452, v1453, v1454) >= v1452.m_iHealth;
    end;
    local function v1458()
        -- upvalues: l_l_aimtools_0_0 (ref), l_v1404_0 (ref)
        for v1456 = 1, #l_l_aimtools_0_0 do
            local v1457 = l_v1404_0[l_l_aimtools_0_0[v1456]];
            v1457.head_scale:override();
            v1457.body_scale:override();
            v1457.hit_chance:override();
            v1457.body_aim:override();
            v1457.safe_points:override();
        end;
    end;
    local function v1459()
        return {
            force_safe = false, 
            misses = 0, 
            prefer_body = false
        };
    end;
    local function v1461(v1460)
        -- upvalues: l_v1403_0 (ref)
        return l_v1403_0[v1460];
    end;
    local function v1464(v1462)
        -- upvalues: v1461 (ref), v1459 (ref), l_v1403_0 (ref)
        local v1463 = v1461(v1462);
        if v1463 == nil then
            v1463 = v1459();
            l_v1403_0[v1462] = v1463;
        end;
        return v1463;
    end;
    local function v1466(v1465)
        -- upvalues: l_v1403_0 (ref)
        l_v1403_0[v1465] = nil;
    end;
    local function v1468()
        -- upvalues: l_v1403_0 (ref), v1466 (ref)
        for v1467 in pairs(l_v1403_0) do
            v1466(v1467);
        end;
    end;
    local function v1479(v1469, v1470, v1471, v1472, v1473, v1474)
        -- upvalues: v1445 (ref), v1449 (ref), v1455 (ref)
        local v1475 = v1469:get_eye_position();
        local v1476 = v1471:get_hitbox_position(5);
        local v1477 = v1470:get_weapon_info();
        local v1478 = v1474.body_aim:get() ~= "Force" and (v1473.conditions:get("Higher than you") and v1445(v1471, v1469) or v1473.conditions:get("Lower than you") and v1449(v1471, v1469) or v1473.conditions:get("Lethal") and v1455(v1475, v1476, v1471, 3, v1477) or v1473.conditions:get("After X misses") and not (v1472.misses <= v1473.max_misses:get()) or v1473.conditions:get("HP lower than X") and v1471.m_iHealth < v1473.lower_hp:get());
        v1474.body_aim:override(v1478 and "Prefer" or nil);
        v1472.prefer_body = v1478;
    end;
    local function v1490(v1480, v1481, v1482, v1483, v1484, v1485)
        -- upvalues: v1445 (ref), v1449 (ref), v1455 (ref)
        local v1486 = v1480:get_eye_position();
        local v1487 = v1482:get_hitbox_position(5);
        local v1488 = v1481:get_weapon_info();
        local v1489 = v1484.conditions:get("Higher than you") and v1445(v1482, v1480) or v1484.conditions:get("Lower than you") and v1449(v1482, v1480) or v1484.conditions:get("Lethal") and v1455(v1486, v1487, v1482, 3, v1488) or v1484.conditions:get("After X misses") and v1483.misses > v1484.max_misses:get() or v1484.conditions:get("HP lower than X") and v1482.m_iHealth < v1484.lower_hp:get();
        v1485.safe_points:override(v1489 and "Force" or nil);
        v1483.force_safe = v1489;
    end;
    local function v1501(v1491, v1492, v1493, v1494, v1495, v1496)
        -- upvalues: v1445 (ref), v1449 (ref), v1455 (ref)
        local v1497 = v1491:get_eye_position();
        local v1498 = v1493:get_hitbox_position(5);
        local v1499 = v1492:get_weapon_info();
        local v1500 = v1495["Higher than you"].enabled:get() and v1445(v1493, v1491) and v1495["Higher than you"].value:get() or v1495["Lower than you"].enabled:get() and v1449(v1493, v1491) and v1495["Lower than you"].value:get() or v1495.Lethal.enabled:get() and v1455(v1497, v1498, v1493, 3, v1499) and v1495.Lethal.value:get() or v1495["After X misses"].enabled:get() and v1494.misses > v1495["After X misses"].max_misses:get() and v1495["After X misses"].value:get() or v1495["HP lower than X"].enabled:get() and v1493.m_iHealth < v1495["HP lower than X"].lower_hp:get() and v1495["HP lower than X"].value:get() or nil;
        v1496.hit_chance:override(v1500);
        v1494.hit_chance = v1500;
    end;
    local function v1512(v1502, v1503, v1504, v1505, v1506, v1507)
        -- upvalues: v1445 (ref), v1449 (ref), v1455 (ref)
        local v1508 = v1502:get_eye_position();
        local v1509 = v1504:get_hitbox_position(5);
        local v1510 = v1503:get_weapon_info();
        local v1511 = v1506["Higher than you"].enabled:get() and v1445(v1504, v1502) and v1506["Higher than you"].value:get() or v1506["Lower than you"].enabled:get() and v1449(v1504, v1502) and v1506["Lower than you"].value:get() or v1506.Lethal.enabled:get() and v1455(v1508, v1509, v1504, 3, v1510) and v1506.Lethal.value:get() or v1506["After X misses"].enabled:get() and v1505.misses > v1506["After X misses"].max_misses:get() and v1506["After X misses"].value:get() or v1506["HP lower than X"].enabled:get() and v1504.m_iHealth < v1506["HP lower than X"].lower_hp:get() and v1506["HP lower than X"].value:get() or nil;
        v1507.head_scale:override(v1511);
        v1507.body_scale:override(v1511);
        v1505.multipoints = v1511;
    end;
    local function v1520(v1513, v1514, v1515)
        -- upvalues: v1416 (ref), l_v909_1 (ref), l_v1404_0 (ref), v1464 (ref), v1479 (ref), v1490 (ref), v1501 (ref), v1512 (ref), v1458 (ref)
        local v1516 = v1416(v1515);
        local v1517 = l_v909_1[v1516];
        local v1518 = l_v1404_0[v1516];
        if v1514 ~= nil and v1517 ~= nil and v1518 ~= nil then
            local v1519 = v1464(v1514:get_index());
            v1479(v1513, v1515, v1514, v1519, v1517.prefer_body, v1518);
            v1490(v1513, v1515, v1514, v1519, v1517.force_safe, v1518);
            v1501(v1513, v1515, v1514, v1519, v1517.hit_chance, v1518);
            v1512(v1513, v1515, v1514, v1519, v1517.multipoints, v1518);
        else
            v1458();
        end;
    end;
    local function v1521()
        -- upvalues: v1458 (ref)
        v1458();
    end;
    local function v1524()
        -- upvalues: v1520 (ref)
        local v1522 = entity.get_local_player();
        if v1522 == nil then
            return;
        else
            local v1523 = v1522:get_player_weapon();
            if v1523 == nil then
                return;
            else
                v1520(v1522, entity.get_threat(), v1523);
                return;
            end;
        end;
    end;
    local function v1536()
        -- upvalues: v1416 (ref), v1461 (ref), l_play_0 (ref)
        local v1525 = entity.get_local_player();
        if v1525 == nil or not v1525:is_alive() then
            return;
        else
            local v1526 = v1525:get_player_weapon();
            if v1526 == nil then
                return;
            else
                local v1527 = entity.get_threat();
                local v1528 = v1416(v1526);
                if v1527 == nil or v1528 == nil then
                    return;
                else
                    local v1529 = v1461(v1527:get_index());
                    if v1529 == nil then
                        return;
                    else
                        local v1530 = {};
                        if v1529.prefer_body then
                            table.insert(v1530, "BODY");
                        end;
                        if v1529.force_safe then
                            table.insert(v1530, "SAFE");
                        end;
                        if v1529.multipoints ~= nil then
                            table.insert(v1530, v1529.multipoints);
                        end;
                        if v1529.hit_chance ~= nil then
                            table.insert(v1530, v1529.hit_chance .. "%");
                        end;
                        if #v1530 == 0 then
                            return;
                        else
                            local v1531 = v1527:get_bbox();
                            if v1531 == nil then
                                return;
                            else
                                local l_pos1_0 = v1531.pos1;
                                local l_pos2_0 = v1531.pos2;
                                local l_alpha_0 = v1531.alpha;
                                if l_pos1_0 == nil or l_pos2_0 == nil or l_alpha_0 == nil then
                                    return;
                                else
                                    local v1535 = vector((v1531.pos1.x + v1531.pos2.x) * 0.5, v1531.pos1.y - 20);
                                    l_play_0.text(1, v1535, color(255, 255, 255, 200 * l_alpha_0), "c", table.concat(v1530, " + "));
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1541(v1537)
        -- upvalues: v1464 (ref)
        local l_state_1 = v1537.state;
        local l_target_0 = v1537.target;
        if l_state_1 == nil or l_target_0 == nil then
            return;
        else
            local v1540 = v1464(l_target_0:get_index());
            v1540.misses = v1540.misses + 1;
            return;
        end;
    end;
    local function v1545(v1542)
        -- upvalues: v1466 (ref)
        local v1543 = entity.get_local_player();
        local v1544 = entity.get(v1542.userid, true);
        if v1543 ~= entity.get(v1542.attacker, true) or v1543 == v1544 then
            return;
        else
            v1466(v1544:get_index());
            return;
        end;
    end;
    local function v1548(v1546)
        -- upvalues: v1466 (ref)
        local v1547 = entity.get(v1546.userid, true);
        if v1547 == nil then
            return;
        else
            v1466(v1547:get_index());
            return;
        end;
    end;
    local _ = nil;
    local function v1551(v1550)
        -- upvalues: v1536 (ref)
        events.render(v1536, v1550:get());
    end;
    do
        local l_v1551_0 = v1551;
        local function v1555(v1553)
            -- upvalues: v1458 (ref), v1468 (ref), l_v909_1 (ref), l_v1551_0 (ref), v1521 (ref), v1524 (ref), v1541 (ref), v1545 (ref), v1548 (ref)
            local v1554 = v1553:get();
            if not v1554 then
                v1458();
                v1468();
            end;
            if v1554 then
                l_v909_1.flag:set_callback(l_v1551_0, true);
            else
                l_v909_1.flag:unset_callback(l_v1551_0);
            end;
            events.shutdown(v1521, v1554);
            events.createmove(v1524, v1554);
            events.aim_ack(v1541, v1554);
            events.player_death(v1545, v1554);
            events.player_spawn(v1548, v1554);
        end;
        l_v909_1.enabled:set_callback(v1555, true);
    end;
end;
v909 = nil;
v910 = v384.ragebot.ai_peek;
v911 = bit.lshift(1, 0);
v912 = 0;
v913 = 1;
l_match_0 = 2;
l_angles_0 = 3;
v1003 = 4;
v1013 = 5;
v1399 = 6;
v1400 = 7;
v1401 = 10;
l_aimtools_0 = 0;
v1403 = 1;
v1404 = 2;
local v1556 = 3;
local v1557 = 4;
local v1558 = 5;
local v1559 = 6;
local v1560 = 7;
local v1561 = 8;
local v1562 = 9;
local v1563 = 10;
local v1564 = 11;
local v1565 = 12;
local v1566 = 13;
local v1567 = 14;
local v1568 = 15;
local v1569 = 16;
local v1570 = 17;
local v1571 = 18;
local v1572 = {
    [l_aimtools_0] = v913, 
    [v1558] = l_match_0, 
    [v1556] = l_angles_0, 
    [v1561] = v1399, 
    [v1560] = v1400, 
    [v1565] = v1399, 
    [v1564] = v1400, 
    [v1570] = v1003, 
    [v1568] = v1013
};
local v1573 = nil;
local v1574 = 0;
local v1575 = nil;
local v1576 = {};
local function v1578(v1577)
    return {
        selection = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1577, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1577, "Multipoint", "Body Scale"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", v1577, "Min. Damage"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1577, "Hit Chance")
        }, 
        safety = {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1577, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1577, "Safe Points"), 
            ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", v1577, "Ensure Hitbox Safety")
        }
    };
end;
v1576["SSG-08"] = v1578("SSG-08");
v1576.Deagle = v1578("Desert Eagle");
v1576.Pistols = v1578("Pistols");
do
    local l_v910_2, l_v911_3, l_v912_2, l_v913_3, l_l_angles_0_2, l_v1399_0, l_v1400_1, l_l_aimtools_0_1, l_v1556_0, l_v1558_0, l_v1560_0, l_v1561_0, l_v1562_0, l_v1563_0, l_v1568_0, l_v1570_0, l_v1572_0, l_v1573_0, l_v1574_0, l_v1575_0, l_v1576_0, l_v1578_0 = v910, v911, v912, v913, l_angles_0, v1399, v1400, l_aimtools_0, v1556, v1558, v1560, v1561, v1562, v1563, v1568, v1570, v1572, v1573, v1574, v1575, v1576, v1578;
    l_v1578_0 = function()
        -- upvalues: l_v1573_0 (ref), l_v1574_0 (ref), l_v1575_0 (ref)
        l_v1573_0 = nil;
        l_v1574_0 = 0;
        l_v1575_0 = nil;
    end;
    local function v1603()
        -- upvalues: v26 (ref), l_v1576_0 (ref)
        v26.ragebot.main.double_tap[1]:override();
        v26.ragebot.main.peek_assist[4]:override();
        for _, v1602 in pairs(l_v1576_0) do
            v1602.selection.head_scale:override();
            v1602.selection.body_scale:override();
            v1602.selection.hit_chance:override();
            v1602.safety.body_aim:override();
            v1602.safety.safe_points:override();
            v1602.safety.ensure_hitbox_safety:override();
        end;
    end;
    local function v1608()
        -- upvalues: l_v910_2 (ref), v26 (ref), l_v1576_0 (ref)
        local v1604 = l_v910_2.hit_chance:get();
        local v1605 = l_v910_2.unsafety:get();
        v26.ragebot.main.peek_assist[4]:override("On Shot");
        for _, v1607 in pairs(l_v1576_0) do
            v1607.selection.head_scale:override(100);
            v1607.selection.body_scale:override(100);
            if v1604 ~= -1 then
                v1607.selection.hit_chance:override(v1604);
            end;
            if v1605 then
                v1607.safety.body_aim:override("Default");
                v1607.safety.safe_points:override("Default");
                v1607.safety.ensure_hitbox_safety:override({});
            end;
        end;
    end;
    local function v1610(v1609)
        -- upvalues: l_v913_3 (ref), l_l_angles_0_2 (ref), l_v1399_0 (ref), l_v1400_1 (ref)
        if v1609 == l_v913_3 then
            return 4;
        elseif v1609 == l_l_angles_0_2 then
            return 1.25;
        elseif v1609 == l_v1399_0 then
            return 0.75;
        elseif v1609 == l_v1400_1 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1615(v1611, v1612, v1613, v1614)
        -- upvalues: v1610 (ref), l_v913_3 (ref)
        v1612 = v1612 * v1610(v1613);
        if v1611.m_ArmorValue > 0 then
            if v1613 == l_v913_3 then
                if v1611.m_bHasHelmet then
                    v1612 = v1612 * (v1614 * 0.5);
                end;
            else
                v1612 = v1612 * (v1614 * 0.5);
            end;
        end;
        return v1612;
    end;
    local function v1627(v1616, v1617, v1618, v1619, v1620)
        -- upvalues: v1615 (ref)
        local v1621 = v1617 - v1616;
        local l_damage_1 = v1620.damage;
        local l_armor_ratio_1 = v1620.armor_ratio;
        local l_range_1 = v1620.range;
        local l_range_modifier_1 = v1620.range_modifier;
        local v1626 = math.min(l_range_1, v1621:length());
        l_damage_1 = l_damage_1 * math.pow(l_range_modifier_1, v1626 * 0.002);
        return (v1615(v1618, l_damage_1, v1619, l_armor_ratio_1));
    end;
    local function v1628()
        -- upvalues: l_v910_2 (ref)
        return l_v910_2.simulation:get() * 0.01;
    end;
    local function v1629()
        -- upvalues: l_v910_2 (ref)
        return l_v910_2.rate_limit:get() * 0.01;
    end;
    local function v1630()
        -- upvalues: v26 (ref)
        return v26.ragebot.selection.min_damage:get();
    end;
    local function v1631()
        -- upvalues: l_v910_2 (ref)
        return l_v910_2.dev_mode:get() and l_v910_2.range:get() or 20;
    end;
    local function v1632()
        -- upvalues: l_v910_2 (ref)
        return l_v910_2.dev_mode:get() and l_v910_2.retreat:get() or 25;
    end;
    local function v1634()
        -- upvalues: l_v910_2 (ref), l_l_aimtools_0_1 (ref), l_v1558_0 (ref), l_v1556_0 (ref), l_v1570_0 (ref), l_v1568_0 (ref), l_v1561_0 (ref), l_v1560_0 (ref), l_v1563_0 (ref), l_v1562_0 (ref)
        local v1633 = {};
        if l_v910_2.hitboxes:get("Head") then
            table.insert(v1633, l_l_aimtools_0_1);
        end;
        if l_v910_2.hitboxes:get("Chest") then
            table.insert(v1633, l_v1558_0);
        end;
        if l_v910_2.hitboxes:get("Stomach") then
            table.insert(v1633, l_v1556_0);
        end;
        if l_v910_2.hitboxes:get("Arms") then
            table.insert(v1633, l_v1570_0);
            table.insert(v1633, l_v1568_0);
        end;
        if l_v910_2.hitboxes:get("Legs") then
            table.insert(v1633, l_v1561_0);
            table.insert(v1633, l_v1560_0);
            table.insert(v1633, l_v1563_0);
            table.insert(v1633, l_v1562_0);
        end;
        return v1633;
    end;
    local function v1636(v1635)
        -- upvalues: l_v1572_0 (ref), l_v912_2 (ref)
        return l_v1572_0[v1635] or l_v912_2;
    end;
    local function v1638(v1637)
        return v1637[0];
    end;
    local function v1643(v1639, v1640)
        local v1641 = v1639:get_weapon_index();
        local l_weapon_type_1 = v1640.weapon_type;
        if v1641 == 1 then
            return "Deagle";
        elseif v1641 == 64 then
            return "Revolver";
        elseif v1641 == 40 then
            return "SSG-08";
        elseif l_weapon_type_1 == 1 then
            return "Pistols";
        else
            return nil;
        end;
    end;
    local function v1660(v1644, v1645, v1646, v1647, v1648)
        -- upvalues: v1636 (ref), v1627 (ref)
        local v1649 = {};
        local v1650 = v1645:get_eye_position();
        local v1651 = v1646:get_weapon_info();
        local l_m_iHealth_0 = v1647.m_iHealth;
        for v1653 = 1, #v1644 do
            local v1654 = v1644[v1653];
            local v1655 = v1636(v1654);
            local v1656 = v1647:get_hitbox_position(v1654);
            local v1657 = v1627(v1650, v1656, v1647, v1655, v1651);
            local v1658 = v1657 < v1648;
            local v1659 = v1657 < l_m_iHealth_0;
            if not v1658 or not v1659 then
                table.insert(v1649, {
                    index = v1653, 
                    pos = v1656
                });
            end;
        end;
        return v1649;
    end;
    local function v1664(v1661)
        -- upvalues: v1638 (ref)
        if v1661 == nil then
            return false;
        else
            local l_status_12, l_result_12 = pcall(v1638, v1661);
            if not l_status_12 or l_result_12 == nil then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v1666(v1665)
        -- upvalues: v1664 (ref)
        return v1664(v1665.target);
    end;
    local function v1668(v1667)
        return not v1667.in_forward and not v1667.in_back and not v1667.in_moveleft and not v1667.in_moveright;
    end;
    local function v1670(v1669)
        -- upvalues: l_v910_2 (ref)
        return l_v910_2.weapons:get(v1669);
    end;
    local function v1674(v1671, v1672, v1673)
        if v1671 == nil or v1672 == nil then
            return false;
        elseif v1673.max_clip1 == 0 or v1672.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v1671.m_flNextAttack then
            return false;
        elseif globals.curtime < v1672.m_flNextPrimaryAttack then
            return false;
        else
            return true;
        end;
    end;
    local function v1675()
        return true;
    end;
    local function v1678(v1676, v1677)
        return {
            ctx = v1676, 
            target = v1677, 
            simtime = 0, 
            retreat = -1, 
            teleport = 0
        };
    end;
    local function v1680(v1679)
        return v1679:simulate_movement(nil, vector(), 1);
    end;
    local function v1687(v1681, v1682, v1683)
        local v1685, v1686 = utils.trace_bullet(v1681, v1682, v1683, function(v1684)
            -- upvalues: v1681 (ref)
            return v1684 ~= v1681 and v1684:is_enemy();
        end);
        return v1685, v1686;
    end;
    local function v1700(v1688, v1689, v1690, v1691, v1692)
        -- upvalues: v1687 (ref)
        local l_m_iHealth_1 = v1689.m_iHealth;
        for v1694 = 1, #v1691 do
            local v1695 = v1691[v1694];
            local v1696, _ = v1687(v1688, v1690, v1695.pos);
            local v1698 = v1692 <= v1696;
            local v1699 = l_m_iHealth_1 <= v1696;
            if v1698 or v1699 then
                return true;
            end;
        end;
        return false;
    end;
    local function v1707(v1701, v1702, v1703, v1704, v1705)
        -- upvalues: v1700 (ref)
        local v1706 = v1701.origin + vector(0, 0, v1701.view_offset);
        return v1701, v1700(v1702, v1703, v1706, v1704, v1705);
    end;
    local function v1717(v1708, v1709, v1710, v1711, v1712, v1713, v1714)
        -- upvalues: l_v911_3 (ref), v1707 (ref)
        v1708.view_angles.y = v1712;
        v1711:think(1);
        if bit.band(v1711.flags, l_v911_3) == 0 then
            return nil, false;
        else
            local _, v1716 = v1707(v1711, v1709, v1710, v1713, v1714);
            if v1716 then
                v1711:think(1);
            end;
            return v1711, v1716;
        end;
    end;
    local function v1752(v1718, v1719, v1720)
        -- upvalues: v1675 (ref), v1629 (ref), v1630 (ref), v1634 (ref), l_v1573_0 (ref), v1666 (ref), v1660 (ref), v1707 (ref), l_v1574_0 (ref), v1668 (ref), l_v911_3 (ref), v1700 (ref), v1680 (ref), v1631 (ref), v1717 (ref), v1678 (ref)
        if not v1675() then
            return false;
        else
            local l_frametime_0 = globals.frametime;
            local v1722 = v1629();
            local v1723 = v1630();
            local v1724 = v1634();
            if l_v1573_0 ~= nil and v1666(l_v1573_0) then
                local l_ctx_0 = l_v1573_0.ctx;
                local l_target_1 = l_v1573_0.target;
                local l_m_iHealth_2 = l_target_1.m_iHealth;
                if v1723 >= 100 then
                    v1723 = v1723 + l_m_iHealth_2 - 100;
                end;
                local v1728 = v1660(v1724, v1719, v1720, l_target_1, v1723);
                local _, v1730 = v1707(l_ctx_0, v1719, l_target_1, v1728, v1723);
                if v1730 then
                    l_v1573_0.simtime = 0;
                end;
                l_v1573_0.simtime = l_v1573_0.simtime + l_frametime_0;
                return true;
            else
                if v1722 > 0 then
                    if l_v1574_0 > 0 then
                        l_v1574_0 = l_v1574_0 - l_frametime_0;
                        return false;
                    else
                        l_v1574_0 = v1722;
                    end;
                end;
                if not v1668(v1718) then
                    return false;
                else
                    local l_m_fFlags_0 = v1719.m_fFlags;
                    if bit.band(l_m_fFlags_0, l_v911_3) == 0 then
                        return false;
                    elseif v1719.m_vecVelocity:length2dsqr() > 6400 then
                        return false;
                    else
                        local v1732 = entity.get_threat();
                        if v1732 == nil or v1732:is_dormant() then
                            return false;
                        else
                            local l_m_iHealth_3 = v1732.m_iHealth;
                            if v1723 >= 100 then
                                v1723 = v1723 + l_m_iHealth_3 - 100;
                            end;
                            local v1734 = v1660(v1724, v1719, v1720, v1732, v1723);
                            if v1700(v1719, v1732, v1719:get_eye_position(), v1734, v1723) then
                                return false;
                            else
                                local v1735 = nil;
                                local v1736 = nil;
                                local v1737 = v1719:get_origin();
                                local v1738 = (v1732:get_origin() - v1737):angles().y + 180;
                                v1735 = v1738 - 90;
                                v1736 = v1738 + 90;
                                v1737 = v1718.view_angles:clone();
                                local l_forwardmove_0 = v1718.forwardmove;
                                local l_sidemove_0 = v1718.sidemove;
                                local l_in_duck_0 = v1718.in_duck;
                                v1738 = v1718.in_jump;
                                local l_in_speed_0 = v1718.in_speed;
                                v1718.forwardmove = 450;
                                v1718.sidemove = 0;
                                v1718.in_duck = false;
                                v1718.in_jump = false;
                                v1718.in_speed = false;
                                local v1743 = v1680(v1719);
                                local v1744 = v1680(v1719);
                                local v1745 = 0;
                                local v1746 = 0;
                                for v1747 = 1, v1631() do
                                    if v1745 ~= -1 then
                                        v1745 = v1747;
                                        local v1748, v1749 = v1717(v1718, v1719, v1732, v1743, v1735, v1734, v1723);
                                        if v1748 == nil then
                                            v1745 = -1;
                                        end;
                                        if v1749 then
                                            l_v1573_0 = v1678(v1748, v1732);
                                            break;
                                        end;
                                    end;
                                    if v1746 ~= -1 then
                                        v1746 = v1747;
                                        local v1750, v1751 = v1717(v1718, v1719, v1732, v1744, v1736, v1734, v1723);
                                        if v1750 == nil then
                                            v1746 = -1;
                                        end;
                                        if v1751 then
                                            l_v1573_0 = v1678(v1750, v1732);
                                            break;
                                        end;
                                    end;
                                end;
                                v1718.view_angles.y = v1737.y;
                                v1718.forwardmove = l_forwardmove_0;
                                v1718.sidemove = l_sidemove_0;
                                v1718.in_duck = l_in_duck_0;
                                v1718.in_jump = v1738;
                                v1718.in_speed = l_in_speed_0;
                                return l_v1573_0 ~= nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1760(v1753, v1754, v1755)
        local v1756 = v1755 - v1754:get_origin();
        local v1757 = v1756:length2dsqr();
        if v1757 < 25 then
            local l_m_vecVelocity_1 = v1754.m_vecVelocity;
            local v1759 = l_m_vecVelocity_1:length();
            v1753.move_yaw = l_m_vecVelocity_1:angles().y;
            v1753.forwardmove = -v1759;
            v1753.sidemove = 0;
            return true, v1757;
        else
            v1753.move_yaw = v1756:angles().y;
            v1753.forwardmove = 450;
            v1753.sidemove = 0;
            return false, v1757;
        end;
    end;
    local function v1762(v1761)
        v1761.in_duck = false;
        v1761.in_jump = false;
        v1761.in_speed = false;
        v1761.in_forward = true;
        v1761.in_back = false;
        v1761.in_moveleft = false;
        v1761.in_moveright = false;
    end;
    local function v1782(v1763, v1764, v1765, v1766)
        -- upvalues: v1674 (ref), v1752 (ref), l_v1573_0 (ref), v1628 (ref), l_v1575_0 (ref), v1632 (ref), v1760 (ref), l_v910_2 (ref), v1762 (ref), v1608 (ref), v27 (ref), l_v1578_0 (ref), v26 (ref), v1603 (ref)
        local v1767 = v1674(v1764, v1765, v1766);
        local v1768 = v1752(v1763, v1764, v1765);
        if l_v1573_0 == nil then
            return;
        else
            if v1628() < l_v1573_0.simtime then
                v1768 = false;
            end;
            if v1766.weapon_type == 5 and not v1764.m_bIsScoped then
                v1768 = false;
            end;
            if l_v1573_0.retreat <= 0 and v1768 then
                local l_ctx_1 = l_v1573_0.ctx;
                if l_v1575_0 == nil then
                    local v1770 = v1764:get_origin();
                    local v1771 = l_ctx_1.origin - v1770;
                    v1771:normalize();
                    local v1772 = l_ctx_1.origin - v1771 * v1632();
                    l_v1575_0 = utils.trace_hull(v1770, v1772, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, v1764, 33636363, 0).end_pos;
                end;
                local v1773, _ = v1760(v1763, v1764, l_ctx_1.origin);
                local v1775 = l_v910_2.color:get();
                v1762(v1763);
                v1608();
                l_v1573_0.retreat = 0;
                if v1773 then
                    l_v1573_0.retreat = 1;
                end;
                v27.box_new(l_ctx_1.origin, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, vector(), color(0, 0, 0, 0), v1775, globals.tickinterval * 2);
                return;
            elseif not v1767 then
                l_v1578_0();
                return;
            elseif l_v1573_0.ctx == nil or l_v1573_0.retreat == -1 then
                return;
            else
                l_v1573_0.retreat = l_v1573_0.retreat + 1;
                local v1776, _ = v1760(v1763, v1764, l_v1575_0);
                local v1778 = v1764:get_origin();
                local l_m_vecVelocity_2 = v1764.m_vecVelocity;
                local v1780 = (l_v1575_0 - v1778):angles() - l_m_vecVelocity_2:angles();
                local v1781 = l_m_vecVelocity_2:length2dsqr();
                v1762(v1763);
                v1608();
                if v1781 > 1600 and math.abs(v1780.y) < 20 then
                    rage.exploit:force_teleport();
                    v26.ragebot.main.double_tap[1]:override(false);
                end;
                if v1767 and v1776 then
                    l_v1578_0();
                    v1603();
                end;
                return;
            end;
        end;
    end;
    local function v1788(v1783)
        -- upvalues: v26 (ref), l_v1578_0 (ref), v1603 (ref), v1643 (ref), v1670 (ref), v1782 (ref)
        if not v26.ragebot.main.peek_assist[1]:get() then
            l_v1578_0();
            v1603();
            return;
        else
            local v1784 = entity.get_local_player();
            if v1784 == nil then
                return;
            else
                local v1785 = v1784:get_player_weapon();
                if v1785 == nil then
                    return;
                else
                    local v1786 = v1785:get_weapon_info();
                    if v1786 == nil then
                        return;
                    else
                        local v1787 = v1643(v1785, v1786);
                        if not v1670(v1787) then
                            l_v1578_0();
                            v1603();
                            return;
                        else
                            v1782(v1783, v1784, v1785, v1786);
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1789()
        -- upvalues: l_v1573_0 (ref), l_v1578_0 (ref)
        if l_v1573_0 == nil then
            return nil;
        else
            l_v1578_0();
            return;
        end;
    end;
    local _ = nil;
    local function v1793(v1791)
        -- upvalues: l_v1578_0 (ref), v1603 (ref), v1789 (ref), v1788 (ref)
        local v1792 = v1791:get();
        if not v1792 then
            l_v1578_0();
            v1603();
        end;
        events.aim_fire(v1789, v1792);
        events.createmove(v1788, v1792);
    end;
    l_v910_2.enabled:set_callback(v1793, true);
end;
v910 = nil;
v911 = v384.ragebot.logs;
v912 = string.upper(v13.name:sub(1, 1));
v913 = string.lower(v13.name);
l_match_0 = 7;
l_angles_0 = 5;
v1003 = l_match_0;
v1013 = {};
v1399 = {
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
v1400 = {
    smokegrenade = "harmed", 
    incgrenade = "harmed", 
    hegrenade = "naded", 
    flashbang = "harmed", 
    inferno = "burned", 
    decoy = "decoyed", 
    knife = "knifed", 
    c4 = "bombed", 
    molotov = "harmed"
};
do
    local l_v911_4, l_v912_3, l_v913_4, l_l_match_0_3, l_l_angles_0_3, l_v1003_2, l_v1013_2, l_v1399_1, l_v1400_2, l_v1401_1, l_l_aimtools_0_2, l_v1403_1, l_v1404_1, l_v1556_1, l_v1557_0, l_v1558_1, l_v1559_0, l_v1560_1, l_v1561_1, l_v1562_1, l_v1563_1 = v911, v912, v913, l_match_0, l_angles_0, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563;
    l_v1401_1 = function(v1815)
        -- upvalues: l_v911_4 (ref)
        if not l_v911_4.output:get("Events") then
            return;
        else
            print_dev(v1815);
            return;
        end;
    end;
    l_l_aimtools_0_2 = function(v1816, v1817)
        -- upvalues: l_v911_4 (ref), l_v1013_2 (ref)
        if not l_v911_4.output:get("Render") then
            return;
        else
            local v1818 = l_v911_4.duration:get();
            local v1819 = #l_v1013_2 + 1;
            l_v1013_2[v1819] = {
                alpha = 0, 
                text = v1817, 
                color = v1816, 
                time = v1818
            };
            return v1819;
        end;
    end;
    l_v1403_1 = function(v1820)
        -- upvalues: l_v911_4 (ref)
        if not l_v911_4.output:get("Console") then
            return;
        else
            print_raw(v1820);
            return;
        end;
    end;
    l_v1404_1 = function(v1821, v1822, v1823)
        local v1824 = string.gsub(v1821, "${(.-)}", string.format("\a%s%%1\a%s", v1822, v1823));
        if v1824:sub(1, 1) ~= "\a" then
            v1824 = "\a" .. v1823 .. v1824;
        end;
        return v1824;
    end;
    l_v1556_1 = function()
        -- upvalues: l_v1013_2 (ref)
        for v1825 = 1, #l_v1013_2 do
            l_v1013_2[v1825] = nil;
        end;
    end;
    l_v1557_0 = function(v1826)
        -- upvalues: l_v912_3 (ref), l_v913_4 (ref)
        if v1826 == "Off" then
            return nil;
        elseif v1826 == "Icon" then
            return l_v912_3;
        elseif v1826 == "Text" then
            return l_v913_4;
        else
            return v1826;
        end;
    end;
    l_v1558_1 = function(v1827, v1828, v1829, v1830, v1831)
        -- upvalues: l_play_0 (ref), v12 (ref)
        local v1832 = 4;
        if v1830 > 0 then
            local v1833 = math.map(v1830, 0, 1.5, 0, 115, true);
            local v1834 = v1829:clone();
            v1834.a = v1833 * v1831;
            l_play_0.shadow(v1827, v1828, v1834, v12(8 * v1830), 0, v1832);
        end;
        local v1835 = v1829:clone();
        v1835.a = v1835.a * v1831;
        l_play_0.rect(v1827, v1828, v1835, v1832);
    end;
    l_v1559_0 = function()
        -- upvalues: l_v911_4 (ref), l_v1013_2 (ref), l_play_0 (ref), l_v1557_0 (ref), v32 (ref), l_l_match_0_3 (ref), l_l_angles_0_3 (ref), l_v1003_2 (ref), l_v1558_1 (ref), v12 (ref)
        local v1836 = l_v911_4.background_color:get();
        local l_frametime_1 = globals.frametime;
        local v1838 = #l_v1013_2;
        local v1839 = l_play_0.screen_size() / 2;
        v1839.y = v1839.y + l_v911_4.offset:get() * 5;
        local v1840 = l_v911_4.logo:get();
        local v1841 = v1840 == "!";
        local v1842 = l_v1557_0(v1840);
        local v1843 = 4;
        local v1844 = "";
        local v1845 = l_play_0.measure_text(v1843, v1844, v1842);
        for v1846 = v1838, 1, -1 do
            local v1847 = l_v1013_2[v1846];
            local v1848 = v1847.time > 0 and v1838 - v1846 < 6;
            v1847.alpha = v32.interp(v1847.alpha, v1848, 0.075);
            if not v1848 then
                if v1847.alpha <= 0 then
                    table.remove(l_v1013_2, v1846);
                end;
            else
                v1847.time = v1847.time - l_frametime_1;
            end;
        end;
        local v1849 = 1;
        local v1850 = "";
        local v1851 = l_v911_4.glow:get() * 0.01;
        for v1852 = 1, #l_v1013_2 do
            local v1853 = l_v1013_2[v1852];
            local l_color_0 = v1853.color;
            local l_text_0 = v1853.text;
            local l_alpha_1 = v1853.alpha;
            if not v1841 then
                l_text_0 = l_text_0 .. " !";
            end;
            local v1857 = l_play_0.measure_text(v1849, v1850, l_text_0);
            local v1858 = v1857 + vector(l_l_match_0_3, l_l_angles_0_3) * 2;
            if v1842 ~= nil then
                v1858.x = v1858.x + v1845.x + l_v1003_2;
            end;
            local v1859 = v1839 - v1858 / 2;
            local v1860 = v1859 + vector(l_l_match_0_3, l_l_angles_0_3);
            local v1861 = vector(v1860.x, v1859.y + (v1858.y - v1845.y) / 2);
            l_v1558_1(v1859, v1859 + v1858, v1836, v1851, l_alpha_1);
            if v1842 ~= nil then
                local v1862 = l_color_0:clone();
                v1862.a = v1862.a * l_alpha_1;
                l_play_0.text(v1843, v1861, v1862, v1844, v1842);
                v1860.x = v1860.x + v1845.x + l_v1003_2;
            end;
            v1860.y = v1859.y + (v1858.y - v1857.y) / 2;
            local v1863 = color(255, 255, 255, 255 * l_alpha_1);
            l_play_0.text(v1849, v1860, v1863, v1850, l_text_0);
            v1839.y = v1839.y - v12((v1858.y + 5) * l_alpha_1);
        end;
    end;
    l_v1560_1 = function(v1864)
        -- upvalues: l_v911_4 (ref), l_v1399_1 (ref), l_v1404_1 (ref), l_v1401_1 (ref), l_v1403_1 (ref), l_l_aimtools_0_2 (ref)
        local l_target_2 = v1864.target;
        if l_target_2 == nil then
            return;
        else
            local v1866 = l_v911_4.hit_color:get();
            local v1867 = l_target_2:get_name();
            local l_m_iHealth_4 = l_target_2.m_iHealth;
            local l_backtrack_0 = v1864.backtrack;
            local l_hitchance_0 = v1864.hitchance;
            local v1871 = v1864.damage or 0;
            local v1872 = v1864.wanted_damage or 0;
            local v1873 = l_v1399_1[v1864.hitgroup] or "?";
            local v1874 = l_v1399_1[v1864.wanted_hitgroup] or "?";
            local v1875 = v1872 - v1871 > 10;
            local v1876 = v1874 ~= v1873;
            local v1877 = nil;
            v1877 = string.format("hit ${%s}'s ${%s} for ${%d} dmg", v1867, v1873, v1871);
            local v1878 = nil;
            local v1879 = {};
            table.insert(v1879, string.format("hit: ${%s}", v1867));
            if v1876 then
                table.insert(v1879, string.format("hb: ${%s}/%s", v1873, v1874));
            else
                table.insert(v1879, string.format("hb: ${%s}", v1873));
            end;
            if v1875 then
                table.insert(v1879, string.format("dmg: ${%d}/%d", v1871, v1872));
            else
                table.insert(v1879, string.format("dmg: ${%d}", v1871));
            end;
            table.insert(v1879, string.format("bt: ${%d}", l_backtrack_0));
            table.insert(v1879, string.format("hc: ${%d%%}", l_hitchance_0));
            if l_m_iHealth_4 <= 0 then
                table.insert(v1879, "rph: ${0} (dead)");
            else
                table.insert(v1879, string.format("rph: ${%d}", l_m_iHealth_4));
            end;
            v1878 = table.concat(v1879, "  ");
            v1877 = l_v1404_1(v1877, v1866:to_hex(), "c8c8c8ff");
            v1878 = l_v1404_1(v1878, v1866:to_hex(), "c8c8c8ff");
            l_v1401_1(v1878);
            l_v1403_1(v1878);
            l_l_aimtools_0_2(v1866, v1877);
            return;
        end;
    end;
    l_v1561_1 = function(v1880)
        -- upvalues: l_v911_4 (ref), l_v1399_1 (ref), l_v1404_1 (ref), l_v1401_1 (ref), l_v1403_1 (ref), l_l_aimtools_0_2 (ref)
        local l_target_3 = v1880.target;
        if l_target_3 == nil then
            return;
        else
            local v1882 = l_v911_4.miss_color:get();
            local v1883 = l_target_3:get_name();
            local l_state_2 = v1880.state;
            local l_hitchance_1 = v1880.hitchance;
            local l_backtrack_1 = v1880.backtrack;
            local v1887 = v1880.wanted_damage or 0;
            local v1888 = l_v1399_1[v1880.wanted_hitgroup] or "?";
            local v1889 = nil;
            v1889 = string.format("missed ${%s}'s ${%s} due to ${%s}", v1883, v1888, l_state_2);
            local v1890 = nil;
            local v1891 = {};
            table.insert(v1891, string.format("missed: ${%s}", v1883));
            table.insert(v1891, string.format("hb: ${%s}", v1888));
            table.insert(v1891, string.format("due: ${%s}", l_state_2));
            table.insert(v1891, string.format("dmg: ${%d}", v1887));
            table.insert(v1891, string.format("bt: ${%d}", l_backtrack_1));
            table.insert(v1891, string.format("hc: ${%d%%}", l_hitchance_1));
            v1890 = table.concat(v1891, "  ");
            v1889 = l_v1404_1(v1889, v1882:to_hex(), "c8c8c8ff");
            v1890 = l_v1404_1(v1890, v1882:to_hex(), "c8c8c8ff");
            l_v1401_1(v1890);
            l_v1403_1(v1890);
            l_l_aimtools_0_2(v1882, v1889);
            return;
        end;
    end;
    l_v1562_1 = function(v1892)
        -- upvalues: l_v1560_1 (ref), l_v1561_1 (ref)
        if v1892.state == nil then
            l_v1560_1(v1892);
        else
            l_v1561_1(v1892);
        end;
    end;
    l_v1563_1 = function(v1893)
        -- upvalues: l_v1400_2 (ref), l_v911_4 (ref), l_v1404_1 (ref), l_v1401_1 (ref), l_v1403_1 (ref), l_l_aimtools_0_2 (ref)
        local v1894 = entity.get_local_player();
        local v1895 = entity.get(v1893.userid, true);
        if entity.get(v1893.attacker, true) ~= v1894 or v1895 == v1894 then
            return;
        else
            local l_weapon_0 = v1893.weapon;
            local v1897 = l_v1400_2[l_weapon_0];
            if v1897 == nil then
                return;
            else
                local v1898 = l_v911_4.hit_color:get();
                local v1899 = v1895:get_name();
                local l_m_iHealth_5 = v1895.m_iHealth;
                local l_dmg_health_0 = v1893.dmg_health;
                local v1902 = nil;
                v1902 = string.format("%s ${%s} for ${%d} dmg", v1897, v1899, l_dmg_health_0);
                local v1903 = nil;
                local v1904 = {};
                table.insert(v1904, string.format("harmed: ${%s}", v1899));
                table.insert(v1904, string.format("dmg: ${%d}", l_dmg_health_0));
                if l_m_iHealth_5 <= 0 then
                    table.insert(v1904, "rph: ${0} (dead)");
                else
                    table.insert(v1904, string.format("rph: ${%d}", l_m_iHealth_5));
                end;
                table.insert(v1904, string.format("wep: ${%s}", l_weapon_0));
                v1903 = table.concat(v1904, "  ");
                v1902 = l_v1404_1(v1902, v1898:to_hex(), "c8c8c8ff");
                v1903 = l_v1404_1(v1903, v1898:to_hex(), "c8c8c8ff");
                l_v1401_1(v1903);
                l_v1403_1(v1903);
                l_l_aimtools_0_2(v1898, v1902);
                return;
            end;
        end;
    end;
    v1564 = nil;
    v1565 = function(v1905)
        -- upvalues: l_v1556_1 (ref), l_v1559_0 (ref)
        local v1906 = v1905:get("Render");
        if not v1906 then
            l_v1556_1();
        end;
        events.render(l_v1559_0, v1906);
    end;
    do
        local l_v1565_0 = v1565;
        v1566 = function(v1908)
            -- upvalues: l_v1556_1 (ref), l_v1559_0 (ref), l_v911_4 (ref), l_v1565_0 (ref), l_v1562_1 (ref), l_v1563_1 (ref)
            local v1909 = v1908:get();
            if not v1909 then
                l_v1556_1();
            end;
            if not v1909 then
                events.render(l_v1559_0, false);
            end;
            if v1909 then
                l_v911_4.output:set_callback(l_v1565_0, true);
            else
                l_v911_4.output:unset_callback(l_v1565_0);
            end;
            events.aim_ack(l_v1562_1, v1909);
            events.player_hurt(l_v1563_1, v1909);
        end;
        l_v911_4.enabled:set_callback(v1566, true);
    end;
end;
v911 = nil;
v912 = v384.ragebot.dormant_aimbot;
v913 = true;
l_match_0 = 5;
l_angles_0 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1003 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v1013 = nil;
v1399 = nil;
v1400 = nil;
v1401 = nil;
l_aimtools_0 = nil;
v1403 = false;
v1404 = false;
v1556 = 1;
v1557 = 0;
v1558 = {
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
v1559 = {
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
v1560 = function(v1910, v1911)
    for v1912 = 1, #v1910 do
        if v1910[v1912] == v1911 then
            return true;
        end;
    end;
    return false;
end;
v1561 = function(v1913)
    return v1913 >= 1 and v1913 <= 6;
end;
v1562 = function()
    local v1914 = {};
    local v1915 = entity.get_player_resource();
    for v1916 = 1, globals.max_players do
        local v1917 = entity.get(v1916);
        if v1917 ~= nil and v1915.m_bConnected[v1916] and v1917:is_enemy() and v1917:is_dormant() then
            table.insert(v1914, v1917);
        end;
    end;
    return v1914;
end;
v1563 = function(v1918, v1919, v1920)
    local v1921 = v1918:to(v1919):angles();
    local v1922 = math.rad(v1921.y + 90);
    local v1923 = vector(math.cos(v1922), math.sin(v1922), 0) * v1920;
    return {
        [1] = {
            text = "Middle", 
            vec = v1919
        }, 
        [2] = {
            text = "Left", 
            vec = v1919 + v1923
        }, 
        [3] = {
            text = "Right", 
            vec = v1919 - v1923
        }
    };
end;
v1564 = function(v1924, v1925, v1926, v1927)
    local v1928, v1929 = utils.trace_bullet(v1924, v1925, v1926, v1927);
    if v1929 ~= nil then
        local l_entity_1 = v1929.entity;
        if l_entity_1 == nil then
            return 0, v1929;
        elseif l_entity_1:is_player() and not l_entity_1:is_enemy() then
            return 0, v1929;
        end;
    end;
    return v1928, v1929;
end;
do
    local l_v912_4, l_v913_5, l_l_match_0_4, l_l_angles_0_4, l_v1003_3, l_v1013_3, l_v1399_2, l_v1400_3, l_v1401_2, l_l_aimtools_0_3, l_v1403_2, l_v1404_2, l_v1556_2, l_v1557_1, l_v1558_2, l_v1559_1, l_v1560_2, l_v1561_2, l_v1562_2, l_v1563_2, l_v1564_0, l_v1565_1, l_v1566_0, l_v1567_0, l_v1568_1 = v912, v913, l_match_0, l_angles_0, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563, v1564, v1565, v1566, v1567, v1568;
    l_v1565_1 = function(v1956)
        -- upvalues: l_l_angles_0_4 (ref), l_v1557_1 (ref), l_v1561_2 (ref), l_v1562_2 (ref), l_v912_4 (ref), l_v1556_2 (ref), l_v1003_3 (ref), l_v1559_1 (ref), l_v1560_2 (ref), l_v1563_2 (ref), l_v1564_0 (ref), l_v1013_3 (ref), l_v1400_3 (ref), l_v1401_2 (ref), l_v1399_2 (ref), l_l_aimtools_0_3 (ref), l_v913_5 (ref), l_l_match_0_4 (ref), l_v1404_2 (ref)
        l_l_angles_0_4:override(false);
        local v1957 = entity.get_local_player();
        if v1957 == nil then
            return;
        else
            local v1958 = v1957:get_player_weapon();
            if v1958 == nil then
                return;
            else
                local v1959 = v1958:get_weapon_info();
                if v1959 == nil then
                    return;
                else
                    local v1960 = v1958:get_inaccuracy();
                    if v1960 == nil then
                        return;
                    else
                        local l_tickcount_1 = globals.tickcount;
                        local v1962 = v1957:get_eye_position();
                        local l_current_0 = v1957:get_simulation_time().current;
                        local v1964 = bit.band(v1957.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_1 < l_v1557_1 then
                            return;
                        elseif v1956.in_jump and not v1964 then
                            return;
                        else
                            local l_weapon_type_2 = v1959.weapon_type;
                            if not l_v1561_2(l_weapon_type_2) or v1958.m_iClip1 <= 0 then
                                return false;
                            else
                                local v1966 = l_v1562_2();
                                local v1967 = l_v912_4.hitboxes:get();
                                if l_tickcount_1 % #v1966 ~= 0 then
                                    l_v1556_2 = l_v1556_2 + 1;
                                else
                                    l_v1556_2 = 1;
                                end;
                                local v1968 = v1966[l_v1556_2];
                                if v1968 == nil then
                                    return;
                                else
                                    local v1969 = v1968:get_bbox();
                                    local v1970 = v1968:get_origin();
                                    local l_m_flDuckAmount_0 = v1968.m_flDuckAmount;
                                    local v1972 = l_v912_4.alpha_modifier:get();
                                    local v1973 = l_v912_4.minimum_damage:get();
                                    if v1973 == 0 then
                                        v1973 = l_v1003_3:get();
                                    end;
                                    if v1973 >= 100 then
                                        v1973 = v1973 - 100 + v1968.m_iHealth;
                                    end;
                                    local v1974 = {};
                                    for v1975 = 1, #l_v1559_1 do
                                        local v1976 = l_v1559_1[v1975];
                                        local l_vec_0 = v1976.vec;
                                        local l_scale_0 = v1976.scale;
                                        local l_hitbox_0 = v1976.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #v1967 ~= 0 then
                                            if l_v1560_2(v1967, l_hitbox_0) then
                                                table.insert(v1974, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v1974, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v1959.is_revolver and not (v1958.m_flNextPrimaryAttack >= l_current_0) or math.max(v1957.m_flNextAttack, v1958.m_flNextPrimaryAttack, v1958.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v1980 = nil;
                                        local v1981 = nil;
                                        if math.floor(v1969.alpha * 100) + 5 <= v1972 then
                                            return;
                                        else
                                            for v1982 = 1, #v1974 do
                                                local v1983 = v1974[v1982];
                                                local v1984 = l_v1563_2(v1962, v1970 + v1983.vec, v1983.scale);
                                                for v1985 = 1, #v1984 do
                                                    local v1986 = v1984[v1985];
                                                    local l_vec_1 = v1986.vec;
                                                    local v1989, v1990 = l_v1564_0(v1957, v1962, l_vec_1, function(v1988)
                                                        -- upvalues: v1968 (ref)
                                                        return v1988 == v1968;
                                                    end);
                                                    if (v1990 == nil or not v1990:is_visible()) and v1989 ~= 0 and v1973 < v1989 then
                                                        v1980 = l_vec_1;
                                                        v1981 = v1989;
                                                        l_v1013_3 = v1968;
                                                        l_v1400_3 = v1983.hitbox;
                                                        l_v1401_2 = v1989;
                                                        l_v1399_2 = v1986.text;
                                                        l_l_aimtools_0_3 = v1969.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v1980 and v1981 then
                                                    break;
                                                end;
                                            end;
                                            if not v1980 or not v1981 then
                                                return;
                                            else
                                                local v1991 = v1962:to(v1980):angles();
                                                v1956.block_movement = 1;
                                                if l_v913_5 then
                                                    local v1992 = not v1956.in_jump and v1964;
                                                    local v1993 = v1957.m_bIsScoped or v1957.m_bResumeZoom;
                                                    local v1994 = v1959.weapon_type == l_l_match_0_4;
                                                    if not v1993 and v1994 and v1992 then
                                                        v1956.in_attack2 = true;
                                                    end;
                                                end;
                                                if v1960 < 0.01 then
                                                    v1956.view_angles = v1991;
                                                    v1956.in_attack = true;
                                                    l_v1404_2 = true;
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
    l_v1566_0 = function(v1995)
        -- upvalues: l_v1404_2 (ref), l_v1403_2 (ref), l_v1013_3 (ref), l_v1400_3 (ref), l_v1401_2 (ref), l_v1399_2 (ref), l_l_aimtools_0_3 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v1995 (ref), l_v1404_2 (ref), l_v1403_2 (ref), l_v1013_3 (ref), l_v1400_3 (ref), l_v1401_2 (ref), l_v1399_2 (ref), l_l_aimtools_0_3 (ref)
            if entity.get(v1995.userid, true) == entity.get_local_player() then
                if l_v1404_2 and not l_v1403_2 then
                    events.dormant_miss:call({
                        userid = l_v1013_3, 
                        aim_hitbox = l_v1400_3, 
                        aim_damage = l_v1401_2, 
                        aim_point = l_v1399_2, 
                        accuracy = l_l_aimtools_0_3
                    });
                end;
                l_v1403_2 = false;
                l_v1404_2 = false;
                l_v1013_3 = nil;
                l_v1400_3 = nil;
                l_v1401_2 = nil;
                l_v1399_2 = nil;
                l_l_aimtools_0_3 = nil;
            end;
        end);
    end;
    l_v1567_0 = function(v1996)
        -- upvalues: l_v1404_2 (ref), l_v1403_2 (ref), l_v1558_2 (ref), l_v1399_2 (ref), l_v1400_3 (ref), l_v1401_2 (ref)
        local v1997 = entity.get_local_player();
        local v1998 = entity.get(v1996.userid, true);
        local v1999 = entity.get(v1996.attacker, true);
        if v1998 == nil or v1999 ~= v1997 then
            return;
        else
            local v2000 = v1998:get_bbox();
            if v2000 == nil then
                return;
            else
                if v1998:is_dormant() and l_v1404_2 == true then
                    l_v1403_2 = true;
                    events.dormant_hit:call({
                        userid = v1998, 
                        attacker = v1999, 
                        health = v1996.health, 
                        armor = v1996.armor, 
                        weapon = v1996.weapon, 
                        dmg_health = v1996.dmg_health, 
                        dmg_armor = v1996.dmg_armor, 
                        hitgroup = v1996.hitgroup, 
                        accuracy = v2000.alpha, 
                        hitbox = l_v1558_2[v1996.hitgroup], 
                        aim_point = l_v1399_2, 
                        aim_hitbox = l_v1400_3, 
                        aim_damage = l_v1401_2
                    });
                end;
                return;
            end;
        end;
    end;
    l_v1568_1 = function()
        -- upvalues: l_l_angles_0_4 (ref)
        l_l_angles_0_4:override();
    end;
    v1569 = nil;
    v1570 = function(v2001)
        -- upvalues: l_l_angles_0_4 (ref), l_v1568_1 (ref), l_v1565_1 (ref), l_v1566_0 (ref), l_v1567_0 (ref)
        local v2002 = v2001:get();
        if not v2002 then
            l_l_angles_0_4:override();
        end;
        events.shutdown(l_v1568_1, v2002);
        events.createmove(l_v1565_1, v2002);
        events.weapon_fire(l_v1566_0, v2002);
        events.player_hurt(l_v1567_0, v2002);
    end;
    l_v912_4.enabled:set_callback(v1570, true);
end;
v867 = nil;
v909 = nil;
v910 = v384.visuals.aspect_ratio;
v911 = cvar.r_aspectratio;
do
    local l_v910_3, l_v911_5, l_v912_5, l_v913_6, l_l_match_0_5 = v910, v911, v912, v913, l_match_0;
    l_v912_5 = function()
        -- upvalues: l_v911_5 (ref)
        l_v911_5:float(tonumber(l_v911_5:string()), true);
    end;
    l_v913_6 = function(v2008)
        -- upvalues: l_v911_5 (ref)
        l_v911_5:float(v2008, true);
    end;
    l_l_match_0_5 = function()
        -- upvalues: l_v912_5 (ref)
        l_v912_5();
    end;
    l_angles_0 = nil;
    v1003 = function(v2009)
        -- upvalues: l_v913_6 (ref)
        l_v913_6(v2009:get() * 0.01);
    end;
    do
        local l_v1003_4 = v1003;
        v1013 = function(v2011)
            -- upvalues: l_v912_5 (ref), l_v910_3 (ref), l_v1003_4 (ref), l_l_match_0_5 (ref)
            local v2012 = v2011:get();
            if not v2012 then
                l_v912_5();
            end;
            if v2012 then
                l_v910_3.value:set_callback(l_v1003_4, true);
            else
                l_v910_3.value:unset_callback(l_v1003_4);
            end;
            events.shutdown(l_l_match_0_5, v2012);
        end;
        l_v910_3.enabled:set_callback(v1013, true);
    end;
end;
v910 = nil;
v911 = v384.visuals.viewmodel;
v912 = 0;
v913 = cvar.cl_righthand;
l_match_0 = cvar.viewmodel_fov;
l_angles_0 = cvar.viewmodel_offset_x;
v1003 = cvar.viewmodel_offset_y;
v1013 = cvar.viewmodel_offset_z;
v1399 = nil;
v1400 = function(v2013)
    return tonumber(v2013:string());
end;
do
    local l_v911_6, l_v912_6, l_v913_7, l_l_match_0_6, l_l_angles_0_5, l_v1003_5, l_v1013_4, l_v1399_3, l_v1400_4, l_v1401_3, l_l_aimtools_0_4, l_v1403_3, l_v1404_3, l_v1556_3 = v911, v912, v913, l_match_0, l_angles_0, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556;
    l_v1401_3 = function(v2028)
        -- upvalues: l_v913_7 (ref)
        if l_v913_7:string() == "1" then
            l_v913_7:int(v2028 and 0 or 1, true);
        else
            l_v913_7:int(v2028 and 1 or 0, true);
        end;
    end;
    l_l_aimtools_0_4 = function()
        -- upvalues: l_l_match_0_6 (ref), l_v1400_4 (ref), l_l_angles_0_5 (ref), l_v1003_5 (ref), l_v1013_4 (ref), l_v913_7 (ref)
        l_l_match_0_6:float(l_v1400_4(l_l_match_0_6), false);
        l_l_angles_0_5:float(l_v1400_4(l_l_angles_0_5), false);
        l_v1003_5:float(l_v1400_4(l_v1003_5), false);
        l_v1013_4:float(l_v1400_4(l_v1013_4), false);
        l_v913_7:int(l_v913_7:string() == "1" and 1 or 0, false);
    end;
    l_v1403_3 = function()
        -- upvalues: l_l_aimtools_0_4 (ref)
        l_l_aimtools_0_4();
    end;
    l_v1404_3 = function()
        -- upvalues: l_v1399_3 (ref), l_v912_6 (ref), l_v1401_3 (ref)
        local v2029 = entity.get_local_player();
        if v2029 == nil then
            return;
        else
            local v2030 = v2029:get_player_weapon();
            if v2030 == nil then
                return;
            else
                local v2031 = v2030:get_weapon_index();
                if l_v1399_3 ~= v2031 then
                    l_v1399_3 = v2031;
                    local v2032 = v2030:get_weapon_info();
                    if v2032 == nil then
                        return;
                    else
                        local v2033 = v2032.weapon_type == l_v912_6;
                        l_v1401_3(v2033);
                    end;
                end;
                return;
            end;
        end;
    end;
    l_v1556_3 = function(v2034)
        -- upvalues: l_l_aimtools_0_4 (ref), l_v1404_3 (ref), l_v1403_3 (ref)
        if not v2034 then
            l_l_aimtools_0_4();
        end;
        if not v2034 then
            events.pre_render(l_v1404_3, v2034);
        end;
        events.shutdown(l_v1403_3, v2034);
    end;
    v1557 = nil;
    v1558 = function(v2035)
        -- upvalues: l_l_match_0_6 (ref)
        l_l_match_0_6:float(v2035:get() * 0.01, true);
    end;
    v1559 = function(v2036)
        -- upvalues: l_l_angles_0_5 (ref)
        l_l_angles_0_5:float(v2036:get() * 0.01, true);
    end;
    v1560 = function(v2037)
        -- upvalues: l_v1003_5 (ref)
        l_v1003_5:float(v2037:get() * 0.01, true);
    end;
    v1561 = function(v2038)
        -- upvalues: l_v1013_4 (ref)
        l_v1013_4:float(v2038:get() * 0.01, true);
    end;
    v1562 = function(v2039)
        -- upvalues: l_v913_7 (ref), l_v1399_3 (ref), l_v1404_3 (ref)
        local v2040 = v2039:get();
        if not v2040 then
            l_v913_7:int(l_v913_7:string() == "1" and 1 or 0, false);
        else
            l_v1399_3 = nil;
        end;
        events.pre_render(l_v1404_3, v2040);
    end;
    do
        local l_v1558_3, l_v1559_2, l_v1560_3, l_v1561_3, l_v1562_3 = v1558, v1559, v1560, v1561, v1562;
        v1563 = function(v2046)
            -- upvalues: l_v911_6 (ref), l_v1558_3 (ref), l_v1559_2 (ref), l_v1560_3 (ref), l_v1561_3 (ref), l_v1562_3 (ref), l_v1556_3 (ref)
            local v2047 = v2046:get();
            if v2047 then
                l_v911_6.fov:set_callback(l_v1558_3, true);
                l_v911_6.offset_x:set_callback(l_v1559_2, true);
                l_v911_6.offset_y:set_callback(l_v1560_3, true);
                l_v911_6.offset_z:set_callback(l_v1561_3, true);
                l_v911_6.opposite_knife_hand:set_callback(l_v1562_3, true);
            else
                l_v911_6.fov:unset_callback(l_v1558_3);
                l_v911_6.offset_x:unset_callback(l_v1559_2);
                l_v911_6.offset_y:unset_callback(l_v1560_3);
                l_v911_6.offset_z:unset_callback(l_v1561_3);
                l_v911_6.opposite_knife_hand:unset_callback(l_v1562_3);
            end;
            l_v1556_3(v2047);
        end;
        l_v911_6.enabled:set_callback(v1563, true);
    end;
end;
v911 = nil;
v912 = v384.visuals.indicators;
v913 = {};
l_match_0 = {
    [1] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 10, 
        [4] = 0.5
    }, 
    [2] = {
        [1] = "\226\139\134", 
        [2] = -3, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [3] = {
        [1] = "\226\152\133", 
        [2] = -1, 
        [3] = 8, 
        [4] = 0.4
    }, 
    [4] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 6, 
        [4] = 0.7
    }, 
    [5] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 2, 
        [4] = 0.3
    }, 
    [6] = {
        [1] = "\226\152\133", 
        [2] = 1, 
        [3] = 7, 
        [4] = 0.6
    }, 
    [7] = {
        [1] = "\226\139\134", 
        [2] = 0, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [8] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 8, 
        [4] = 0.7
    }, 
    [9] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 7, 
        [4] = 0.2
    }
};
l_angles_0 = 0;
v1003 = 0;
v1013 = 0;
v1399 = 0;
v1400 = 0;
v1401 = function()
    -- upvalues: v394 (ref), v26 (ref)
    if not v394.is_onground then
        if v394.is_crouched then
            return "airc";
        else
            return "air";
        end;
    elseif v394.is_crouched then
        if v394.is_moving then
            return "sneak";
        else
            return "crouch";
        end;
    elseif v394.is_moving then
        if v26.antiaim.misc.slow_walk:get() then
            return "walk";
        else
            return "run";
        end;
    else
        return "stand";
    end;
end;
do
    local l_v912_7, l_v913_8, l_l_match_0_7, l_l_angles_0_6 = v912, v913, l_match_0, l_angles_0;
    do
        local l_l_l_match_0_7_0, l_l_l_angles_0_6_0, l_v1003_6, l_v1013_5, l_v1399_4, l_v1400_5, l_v1401_4, l_l_aimtools_0_5, l_v1403_4, l_v1404_4, l_v1556_4, l_v1557_2, l_v1558_4, l_v1559_3, l_v1560_4 = l_l_match_0_7, l_l_angles_0_6, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560;
        l_l_aimtools_0_5 = function(v2067, v2068)
            -- upvalues: l_l_l_match_0_7_0 (ref), l_play_0 (ref), v12 (ref), l_v1003_6 (ref)
            local l_realtime_0 = globals.realtime;
            local v2070 = {};
            local v2071 = #l_l_l_match_0_7_0;
            local v2072 = 0;
            local v2073 = 0;
            for v2074 = 1, v2071 do
                local v2075 = l_l_l_match_0_7_0[v2074];
                local v2076 = l_play_0.measure_text(1, "", v2075[1]);
                v2072 = v2072 + (v2076.x + v2075[2]);
                v2073 = math.max(v2073, v2076.y + v2075[3]);
                v2070[v2074] = v2076;
            end;
            local v2077 = v2067:clone();
            v2077.x = v12(v2077.x - v2072 * 0.5 * (1 - l_v1003_6));
            for v2078 = 1, v2071 do
                local v2079 = l_l_l_match_0_7_0[v2078];
                local v2080 = v2070[v2078];
                local v2081 = v2079[1];
                local v2082 = v2079[2];
                local v2083 = v2079[3];
                local v2084 = v2079[4];
                local v2085 = (math.sin(l_realtime_0 * v2084) * 0.5 + 0.5) * 0.7 + 0.3;
                local v2086 = v2068:clone();
                local v2087 = v2077:clone();
                v2087.x = v2087.x + v2082;
                v2087.y = v2087.y + v2083;
                v2086.a = v2086.a * v2085;
                l_play_0.text(1, v2087, v2086, "", v2081);
                v2077.x = v2077.x + (v2080.x + v2082);
            end;
            v2067.y = v2067.y + v2073 * 0.66;
        end;
        l_v1403_4 = function(v2088, v2089, v2090)
            -- upvalues: v13 (ref), l_play_0 (ref), v149 (ref), v12 (ref), l_v1003_6 (ref)
            local v2091 = 4;
            local l_name_1 = v13.name;
            local v2093 = "";
            local v2094 = l_play_0.measure_text(v2091, v2093, l_name_1);
            local v2095 = -globals.realtime * 1.25;
            l_name_1 = v149.gradient(l_name_1, v2095, v2089, v2090);
            local v2096 = v2088:clone();
            v2096.x = v12(v2096.x - v2094.x * 0.5 * (1 - l_v1003_6));
            l_play_0.text(v2091, v2096, v2089, v2093, l_name_1);
            v2088.y = v2088.y + v2094.y;
        end;
        l_v1404_4 = function(v2097, v2098, v2099)
            -- upvalues: l_v1401_4 (ref), l_play_0 (ref), v12 (ref), l_v1003_6 (ref)
            local v2100 = 1;
            local v2101 = l_v1401_4();
            local v2102 = "";
            local v2103 = l_play_0.measure_text(v2100, v2102, v2101);
            local v2104 = v2098:clone();
            local v2105 = v2097:clone();
            v2104.a = v2104.a * v2099;
            v2105.x = v12(v2105.x - v2103.x * 0.5 * (1 - l_v1003_6));
            l_play_0.text(v2100, v2105, v2104, v2102, v2101);
            v2097.y = v2097.y + v12(v2103.y);
        end;
        l_v1556_4 = function(v2106, v2107, v2108)
            -- upvalues: l_play_0 (ref), v12 (ref), l_v1003_6 (ref)
            local v2109 = 1;
            local v2110 = "dt";
            local v2111 = "";
            local v2112 = l_play_0.measure_text(v2109, v2111, v2110);
            local v2113 = v2107:clone();
            local v2114 = v2106:clone();
            local v2115 = rage.exploit:get();
            v2113 = v2113:lerp(color(255, 0, 50, 255), 1 - v2115 * v2115);
            v2113.a = v2113.a * v2108;
            v2114.x = v12(v2114.x - v2112.x * 0.5 * (1 - l_v1003_6));
            l_play_0.text(v2109, v2114, v2113, v2111, v2110);
            v2106.y = v2106.y + v12(v2112.y * v2108);
        end;
        l_v1557_2 = function(v2116, v2117, v2118)
            -- upvalues: l_play_0 (ref), v12 (ref), l_v1003_6 (ref)
            local v2119 = 1;
            local v2120 = "dmg";
            local v2121 = "";
            local v2122 = l_play_0.measure_text(v2119, v2121, v2120);
            local v2123 = v2117:clone();
            local v2124 = v2116:clone();
            v2123.a = v2123.a * v2118;
            v2124.x = v12(v2124.x - v2122.x * 0.5 * (1 - l_v1003_6));
            l_play_0.text(v2119, v2124, v2123, v2121, v2120);
            v2116.y = v2116.y + v12(v2122.y * v2118);
        end;
        l_v1558_4 = function(v2125, v2126, v2127)
            -- upvalues: l_play_0 (ref), v12 (ref), l_v1003_6 (ref)
            local v2128 = 1;
            local v2129 = "osaa";
            local v2130 = "";
            local v2131 = l_play_0.measure_text(v2128, v2130, v2129);
            local v2132 = v2126:clone();
            local v2133 = v2125:clone();
            v2132.a = v2132.a * v2127;
            v2133.x = v12(v2133.x - v2131.x * 0.5 * (1 - l_v1003_6));
            l_play_0.text(v2128, v2133, v2132, v2130, v2129);
            v2125.y = v2125.y + v12(v2131.y * v2127);
        end;
        l_v1559_3 = function(v2134)
            -- upvalues: v788 (ref), v26 (ref), l_l_l_angles_0_6_0 (ref), v32 (ref), l_v1003_6 (ref), l_v1013_5 (ref), l_v1399_4 (ref), l_v1400_5 (ref)
            local v2135 = v2134:is_alive();
            local l_m_bIsScoped_0 = v2134.m_bIsScoped;
            local v2137 = v788.get(v26.ragebot.selection.min_damage);
            local v2138 = v2137 ~= nil and (v2137.active or false);
            local v2139 = v26.ragebot.main.double_tap[1]:get();
            local v2140 = v26.ragebot.main.hide_shots[1]:get();
            l_l_l_angles_0_6_0 = v32.interp(l_l_l_angles_0_6_0, v2135, 0.05);
            l_v1003_6 = v32.interp(l_v1003_6, l_m_bIsScoped_0, 0.05);
            l_v1013_5 = v32.interp(l_v1013_5, v2139, 0.05);
            l_v1399_4 = v32.interp(l_v1399_4, v2138, 0.05);
            l_v1400_5 = v32.interp(l_v1400_5, v2140, 0.05);
        end;
        l_v1560_4 = function()
            -- upvalues: l_play_0 (ref), l_v912_7 (ref), v12 (ref), l_v1003_6 (ref), l_l_l_angles_0_6_0 (ref), l_l_aimtools_0_5 (ref), l_v1403_4 (ref), l_v1404_4 (ref), l_v1556_4 (ref), l_v1013_5 (ref), l_v1557_2 (ref), l_v1399_4 (ref), l_v1558_4 (ref), l_v1400_5 (ref)
            local v2141 = l_play_0.screen_size() * 0.5;
            local v2142 = l_v912_7.accent_color:get();
            local v2143 = l_v912_7.secondary_color:get();
            v2141.x = v2141.x + v12(10 * l_v1003_6);
            v2141.y = v2141.y + l_v912_7.offset:get();
            v2142.a = v2142.a * l_l_l_angles_0_6_0;
            v2143.a = v2143.a * l_l_l_angles_0_6_0;
            l_l_aimtools_0_5(v2141, v2142);
            l_v1403_4(v2141, v2142, v2143);
            l_v1404_4(v2141, color(255, 255, 255, 200), l_l_l_angles_0_6_0);
            l_v1556_4(v2141, color(255, 255, 255, 200), l_v1013_5 * l_l_l_angles_0_6_0);
            l_v1557_2(v2141, color(255, 255, 255, 200), l_v1399_4 * l_l_l_angles_0_6_0);
            l_v1558_4(v2141, color(255, 255, 255, 200 * (1 - l_v1013_5 * 0.5)), l_v1400_5 * l_l_l_angles_0_6_0);
        end;
        l_v913_8.on_render = function()
            -- upvalues: l_v1559_3 (ref), l_l_l_angles_0_6_0 (ref), l_v1560_4 (ref)
            local v2144 = entity.get_local_player();
            if v2144 == nil then
                return;
            else
                l_v1559_3(v2144);
                if l_l_l_angles_0_6_0 > 0 then
                    l_v1560_4();
                end;
                return;
            end;
        end;
    end;
    l_l_match_0_7 = {};
    l_l_angles_0_6 = "";
    v1003 = 0;
    v1013 = 0;
    v1399 = 0;
    v1400 = 0;
    v1401 = 0;
    l_aimtools_0 = 0;
    v1403 = function(v2145)
        local v2146 = v2145:get_player_weapon();
        if v2146 == nil then
            return false;
        else
            local v2147 = v2146:get_weapon_info();
            if v2147 == nil then
                return false;
            elseif v2147.type ~= 9 then
                return false;
            else
                return true;
            end;
        end;
    end;
    v1404 = function(v2148, v2149)
        -- upvalues: v14 (ref)
        local v2150 = globals.realtime * 3;
        local v2151 = math.abs(math.sin(v2150));
        return v14.lerp(v2148, v2149, v2151);
    end;
    v1556 = function()
        -- upvalues: v394 (ref), v26 (ref)
        if not v394.is_onground then
            return "-AIR-";
        elseif v394.is_crouched then
            return "-CROUCH-";
        elseif v394.is_moving then
            if v26.antiaim.misc.slow_walk:get() then
                return "-WALKING-";
            else
                return "-MOVING-";
            end;
        else
            return "-STANDING-";
        end;
    end;
    do
        local l_l_l_angles_0_6_1, l_v1003_7, l_v1013_6, l_v1399_5, l_v1400_6, l_v1401_5, l_l_aimtools_0_6, l_v1403_5, l_v1404_5, l_v1556_5, l_v1557_3, l_v1558_5, l_v1559_4, l_v1560_5, l_v1561_4, l_v1562_4, l_v1563_3, l_v1564_1 = l_l_angles_0_6, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563, v1564;
        l_v1557_3 = function()
            -- upvalues: v26 (ref), l_l_l_angles_0_6_1 (ref)
            if v26.ragebot.main.double_tap[1]:get() then
                l_l_l_angles_0_6_1 = "DT";
            elseif v26.ragebot.main.hide_shots[1]:get() then
                l_l_l_angles_0_6_1 = "HIDE";
            end;
            return l_l_l_angles_0_6_1, color(255, 255, 255, 255);
        end;
        l_v1558_5 = function(v2170)
            -- upvalues: v395 (ref)
            if v2170 == 0 then
                return "WAITING", color(255, 64, 64, 255);
            elseif v2170 == 1 then
                if v395.defensive_ticks > 0 then
                    return "ACTIVE", color(120, 255, 255, 255);
                else
                    return "READY", color(192, 255, 109, 255);
                end;
            else
                return "CHARGING", color(255, 64, 64, 255):lerp(color(192, 255, 109, 255), v2170);
            end;
        end;
        l_v1559_4 = function(v2171)
            -- upvalues: l_v1403_5 (ref), v788 (ref), v26 (ref), l_v1003_7 (ref), v32 (ref), l_v1013_6 (ref), l_v1400_6 (ref), l_v1401_5 (ref), l_l_aimtools_0_6 (ref)
            local v2172 = v2171:is_alive();
            local l_m_bIsScoped_1 = v2171.m_bIsScoped;
            local v2174 = l_v1403_5(v2171);
            local v2175 = v788.get(v26.ragebot.selection.min_damage);
            local v2176 = v2175 ~= nil and (v2175.active or false);
            local v2177 = v26.ragebot.main.double_tap[1]:get();
            local v2178 = v26.ragebot.main.hide_shots[1]:get();
            local v2179 = 0;
            if v2172 then
                v2179 = v2174 and 0.5 or 1;
            end;
            l_v1003_7 = v32.interp(l_v1003_7, v2179, 0.05);
            l_v1013_6 = v32.interp(l_v1013_6, l_m_bIsScoped_1, 0.05);
            l_v1400_6 = v32.interp(l_v1400_6, v2177, 0.03);
            l_v1401_5 = v32.interp(l_v1401_5, v2176, 0.03);
            l_l_aimtools_0_6 = v32.interp(l_l_aimtools_0_6, v2178, 0.03);
        end;
        l_v1560_5 = function(v2180, v2181, v2182, v2183)
            -- upvalues: l_play_0 (ref), l_v1404_5 (ref), l_v1013_6 (ref)
            local v2184 = 2;
            local v2185 = "";
            local v2186 = "ANGELIC";
            local v2187 = "YAW";
            local v2188 = l_play_0.measure_text(v2184, v2185, v2186);
            local v2189 = l_play_0.measure_text(v2184, v2185, v2187);
            local v2190 = v2188.x + v2189.x;
            local v2191 = math.max(v2188.y, v2189.y);
            local v2192 = v2180:clone();
            local v2193 = v2190 * 0.5;
            local v2194 = l_v1404_5(0.25, 1);
            local v2195 = v2181:clone();
            local v2196 = v2182:clone();
            v2195.a = v2195.a * v2183;
            v2196.a = v2196.a * v2183;
            v2195.a = v2195.a * v2194;
            v2192.x = v2192.x - v2193 * (1 - l_v1013_6) + 1;
            l_play_0.text(v2184, v2192, v2196, v2185, v2186);
            v2192.x = v2192.x + v2188.x;
            l_play_0.text(v2184, v2192, v2195, v2185, v2187);
            v2180.y = v2180.y + (v2191 - 3);
        end;
        l_v1561_4 = function(v2197, _, v2199)
            -- upvalues: l_v1556_5 (ref), l_play_0 (ref), l_v1399_5 (ref), v32 (ref), l_v1013_6 (ref)
            local v2200 = 2;
            local v2201 = "";
            local v2202 = l_v1556_5();
            local v2203 = l_play_0.measure_text(v2200, v2201, v2202);
            local l_x_1 = v2203.x;
            local l_y_0 = v2203.y;
            if l_v1399_5 < l_x_1 then
                l_v1399_5 = v32.interp(l_v1399_5, l_x_1, 0.05);
            else
                l_v1399_5 = l_x_1;
            end;
            local v2206 = v2197:clone();
            local v2207 = l_v1399_5 * 0.5;
            v2206.x = v2206.x - v2207 * (1 - l_v1013_6) + 1;
            local v2208 = color(255, 255, 255, 255);
            v2208.a = v2208.a * v2199;
            l_play_0.push_clip_rect(v2206, v2206 + vector(l_v1399_5, l_y_0));
            l_play_0.text(v2200, v2206, v2208, v2201, v2202);
            l_play_0.pop_clip_rect();
            v2197.y = v2197.y + (l_y_0 - 3);
        end;
        l_v1562_4 = function(v2209, v2210, v2211)
            -- upvalues: l_v1557_3 (ref), l_v1558_5 (ref), l_play_0 (ref), l_v1013_6 (ref)
            local v2212 = 2;
            local v2213 = "";
            local v2214 = rage.exploit:get();
            local v2215, v2216 = l_v1557_3();
            local v2217, v2218 = l_v1558_5(v2214);
            local v2219 = string.format("\a%s%s \a%s%s", v2216:to_hex(), v2215, v2218:to_hex(), v2217);
            local v2220 = l_play_0.measure_text(v2212, v2213, v2219);
            local l_x_2 = v2220.x;
            local l_y_1 = v2220.y;
            local v2223 = v2209:clone();
            local v2224 = l_x_2 * 0.5;
            v2223.x = v2223.x - v2224 * v2210 * (1 - l_v1013_6) + 1;
            local v2225 = color(255, 255, 255, 255);
            v2225.a = v2225.a * v2211 * v2210;
            local v2226 = v2225:clone();
            v2226.a = v2226.a * 0.5;
            l_play_0.push_clip_rect(v2223, v2223 + vector(l_x_2 * v2210, l_y_1));
            l_play_0.text(v2212, v2223, v2226, v2213, v2219);
            l_play_0.pop_clip_rect();
            l_play_0.push_clip_rect(v2223, v2223 + vector(l_x_2 * v2210 * v2214, l_y_1));
            l_play_0.text(v2212, v2223, v2225, v2213, v2219);
            l_play_0.pop_clip_rect();
            v2209.y = v2209.y + (l_y_1 - 3) * v2210;
        end;
        l_v1563_3 = function(v2227, v2228, v2229)
            -- upvalues: l_play_0 (ref), l_v1013_6 (ref)
            local v2230 = 2;
            local v2231 = "";
            local v2232 = "DMG";
            local v2233 = l_play_0.measure_text(v2230, v2231, v2232);
            local l_x_3 = v2233.x;
            local l_y_2 = v2233.y;
            local v2236 = v2227:clone();
            local v2237 = l_x_3 * 0.5;
            v2236.x = v2236.x - v2237 * v2228 * (1 - l_v1013_6) + 1;
            local v2238 = color(255, 255, 255, 255);
            v2238.a = v2238.a * v2229 * v2228;
            l_play_0.push_clip_rect(v2236, v2236 + vector(l_x_3 * v2228, l_y_2));
            l_play_0.text(v2230, v2236, v2238, v2231, v2232);
            l_play_0.pop_clip_rect();
            v2227.y = v2227.y + (l_y_2 - 3) * v2228;
        end;
        l_v1564_1 = function()
            -- upvalues: l_play_0 (ref), l_v912_7 (ref), l_v1400_6 (ref), l_l_aimtools_0_6 (ref), v12 (ref), l_v1013_6 (ref), l_v1560_5 (ref), l_v1003_7 (ref), l_v1561_4 (ref), l_v1562_4 (ref), l_v1563_3 (ref), l_v1401_5 (ref)
            local v2239 = l_play_0.screen_size() * 0.5;
            local v2240 = l_v912_7.accent_color:get();
            local v2241 = l_v912_7.secondary_color:get();
            local v2242 = math.max(l_v1400_6, l_l_aimtools_0_6);
            v2239.x = v2239.x + v12(10 * l_v1013_6);
            v2239.y = v2239.y + l_v912_7.offset:get();
            l_v1560_5(v2239, v2240, v2241, l_v1003_7);
            l_v1561_4(v2239, color(255, 255, 255, 255), l_v1003_7);
            l_v1562_4(v2239, v2242, l_v1003_7);
            l_v1563_3(v2239, l_v1401_5, l_v1003_7);
        end;
        l_l_match_0_7.on_render = function()
            -- upvalues: l_v1559_4 (ref), l_v1003_7 (ref), l_v1564_1 (ref)
            local v2243 = entity.get_local_player();
            if v2243 == nil then
                return;
            else
                l_v1559_4(v2243);
                if l_v1003_7 > 0 then
                    l_v1564_1();
                end;
                return;
            end;
        end;
    end;
    l_l_angles_0_6 = function(v2244)
        -- upvalues: l_v913_8 (ref), l_l_match_0_7 (ref)
        local v2245 = v2244 == 1;
        local v2246 = v2244 == 2;
        events.render(l_v913_8.on_render, v2245);
        events.render(l_l_match_0_7.on_render, v2246);
    end;
    v1003 = nil;
    v1013 = function(v2247)
        -- upvalues: l_l_angles_0_6 (ref)
        l_l_angles_0_6(v2247:get());
    end;
    do
        local l_v1013_7 = v1013;
        v1399 = function(v2249)
            -- upvalues: l_l_angles_0_6 (ref), l_v912_7 (ref), l_v1013_7 (ref)
            local v2250 = v2249:get();
            if not v2250 then
                l_l_angles_0_6(nil);
            end;
            if v2250 then
                l_v912_7.style:set_callback(l_v1013_7, true);
            else
                l_v912_7.style:unset_callback(l_v1013_7);
            end;
        end;
        l_v912_7.enabled:set_callback(v1399, true);
    end;
end;
v912 = nil;
v913 = v384.visuals.solus_ui;
l_match_0 = 5;
l_angles_0 = 1;
v1003 = function(v2251, v2252)
    local v2253 = {};
    for v2254 = 1, v2252 do
        v2253[v2254] = v2251;
    end;
    return v2253;
end;
v1013 = function(v2255, v2256, v2257)
    if v2257 or v2255[#v2255] ~= v2256 then
        table.insert(v2255, v2256);
        table.remove(v2255, 1);
    end;
end;
v1399 = function(v2258)
    local v2259 = 0;
    local v2260 = 0;
    for _, v2262 in pairs(v2258) do
        v2260 = v2260 + v2262;
        v2259 = v2259 + 1;
    end;
    return v2260 / v2259;
end;
v1400 = function()
    -- upvalues: l_play_0 (ref)
    return {
        draw = function(_, v2264, v2265, v2266, v2267, v2268, v2269)
            -- upvalues: l_play_0 (ref)
            local l_v2265_0 = v2265;
            local l_clr_1_0 = v2268.clr_1;
            v2265 = 0;
            v2266 = v2266 - l_v2265_0;
            v2268.h = v2268.h - v2268.thickness;
            if v2269 then
                l_play_0.rect_outline(vector(v2268.x, v2268.y), vector(v2268.x + v2268.w - 1, v2268.y + v2268.h - 1 + v2268.thickness), l_clr_1_0);
            end;
            if v2265 == v2266 then
                l_play_0.line(vector(v2268.x, v2268.y + v2268.h), vector(v2268.x + v2268.w, v2268.y + v2268.h), l_clr_1_0);
                return;
            else
                local v2272 = v2268.w / (v2267 - 1);
                local v2273 = v2266 - v2265;
                for v2274 = 1, v2267 - 1 do
                    local v2275 = vector((v2264[v2274] - l_v2265_0) / v2273, (v2264[v2274 + 1] - l_v2265_0) / v2273);
                    local v2276 = {
                        vector(v2268.x + v2272 * (v2274 - 1), v2268.y + v2268.h - v2268.h * v2275.x), 
                        vector(v2268.x + v2272 * v2274, v2268.y + v2268.h - v2268.h * v2275.y)
                    };
                    for v2277 = 1, v2268.thickness do
                        l_play_0.line(vector(v2276[1].x, v2276[1].y + v2277 - 1), vector(v2276[2].x, v2276[2].y + v2277 - 1), l_clr_1_0);
                    end;
                end;
                return;
            end;
        end, 
        draw_histogram = function(_, v2279, v2280, v2281, v2282, v2283, v2284)
            -- upvalues: l_play_0 (ref)
            local l_v2280_0 = v2280;
            v2280 = 0;
            v2281 = v2281 - l_v2280_0;
            if v2284 then
                l_play_0.rect_outline(vector(v2283.x, v2283.y), vector(v2283.x + v2283.w - 1, v2283.y + v2283.h - 1), color(255, 255, 255, 255));
            end;
            local v2286 = v2283.w / (v2282 - 1);
            local v2287 = v2281 - v2280;
            for v2288 = 1, v2282 - 1 do
                local v2289 = vector((v2279[v2288] - l_v2280_0) / v2287, (v2279[v2288 + 1] - l_v2280_0) / v2287);
                local v2290 = {
                    [1] = vector(math.floor(v2283.x + v2286 * (v2288 - 1)), math.floor(v2283.y + v2283.h - v2283.h * v2289.x)), 
                    [2] = vector(math.floor(v2283.x + v2286 * v2288), math.floor(v2283.y + v2283.h)), 
                    isZero = math.floor(v2283.y + v2283.h) == math.floor(v2283.y + v2283.h - v2283.h * v2289.x)
                };
                if v2283.draw_bar == "fill" then
                    l_play_0.rect(v2290[1], v2290[2], v2283.clr_1);
                elseif v2283.draw_bar == "gradient_fadeout" then
                    local v2291 = v2283.clr_1:clone();
                    local v2292 = v2283.clr_1:clone();
                    v2292.a = 0;
                    l_play_0.gradient(v2290[1], v2290[2], v2291, v2291, v2292, v2292);
                elseif v2283.draw_bar == "gradient_fadein" then
                    local v2293 = v2283.clr_1:clone();
                    local v2294 = v2283.clr_1:clone();
                    v2294.a = 0;
                    l_play_0.gradient(v2290[1], v2290[2], v2294, v2294, v2293, v2293);
                end;
                if v2283.draw_peeks and not v2290.isZero then
                    l_play_0.line(v2290[1], v2290[2], v2283.clr_2);
                end;
            end;
        end
    };
end;
v1401 = function(v2295, v2296, v2297, v2298, v2299, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.rect(vector(v2295, v2296), vector(v2295 + v2297, v2296 + v2298), v2299, ...);
end;
l_aimtools_0 = function(v2300, v2301, v2302, v2303, v2304, v2305, v2306, ...)
    -- upvalues: l_play_0 (ref)
    local v2307 = nil;
    local v2308 = nil;
    local v2309 = nil;
    local v2310 = nil;
    if v2306 then
        local l_v2304_0 = v2304;
        v2309 = v2304;
        v2307 = l_v2304_0;
        l_v2304_0 = v2305;
        v2310 = v2305;
        v2308 = l_v2304_0;
    else
        local l_v2304_1 = v2304;
        v2308 = v2304;
        v2307 = l_v2304_1;
        l_v2304_1 = v2305;
        v2310 = v2305;
        v2309 = l_v2304_1;
    end;
    l_play_0.gradient(vector(v2300, v2301), vector(v2300 + v2302, v2301 + v2303), v2307, v2308, v2309, v2310, ...);
end;
do
    local l_v913_9, l_l_match_0_8, l_l_angles_0_7, l_v1013_8, l_v1399_6, l_v1401_6, l_l_aimtools_0_7, l_v1403_6, l_v1404_6, l_v1556_6, l_v1557_4, l_v1558_6, l_v1559_5 = v913, l_match_0, l_angles_0, v1013, v1399, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559;
    l_v1403_6 = function(v2326, v2327, v2328, v2329)
        -- upvalues: l_play_0 (ref), l_l_match_0_8 (ref), l_v1401_6 (ref), l_l_angles_0_7 (ref), l_l_aimtools_0_7 (ref)
        local l_x_4 = v2326.x;
        local l_y_3 = v2326.y;
        local v2332 = v2327.x - v2326.x;
        local v2333 = v2327.y - v2326.y;
        local v2334 = v2328:alpha_modulate(255 * v2329);
        local v2335 = v2328:alpha_modulate(50 * v2329);
        l_play_0.blur(v2326, v2327, 0.5, v2329, l_l_match_0_8);
        l_play_0.rect(v2326, v2327, color(17, 17, 17, v2328.a * v2329), l_l_match_0_8);
        l_v1401_6(l_x_4 + l_l_match_0_8, l_y_3, v2332 - l_l_match_0_8 * 2, l_l_angles_0_7, v2334);
        l_v1401_6(l_x_4 + l_l_match_0_8, l_y_3 + v2333 - l_l_angles_0_7, v2332 - l_l_match_0_8 * 2, l_l_angles_0_7, v2335);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_8, l_y_3 + l_l_match_0_8), v2334, l_l_match_0_8 + 0.5, 180, 0.25, l_l_angles_0_7);
        l_play_0.circle_outline(vector(l_x_4 + v2332 - l_l_match_0_8, l_y_3 + l_l_match_0_8), v2334, l_l_match_0_8 + 0.5, 270, 0.25, l_l_angles_0_7);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_8, l_y_3 + v2333 - l_l_match_0_8), v2335, l_l_match_0_8 + 0.5, 90, 0.25, l_l_angles_0_7);
        l_play_0.circle_outline(vector(l_x_4 + v2332 - l_l_match_0_8, l_y_3 + v2333 - l_l_match_0_8), v2335, l_l_match_0_8 + 0.5, 0, 0.25, l_l_angles_0_7);
        l_l_aimtools_0_7(l_x_4, l_y_3 + l_l_match_0_8, l_l_angles_0_7, v2333 - l_l_match_0_8 * 2, v2334, v2335, false);
        l_l_aimtools_0_7(l_x_4 + v2332 - l_l_angles_0_7, l_y_3 + l_l_match_0_8, l_l_angles_0_7, v2333 - l_l_match_0_8 * 2, v2334, v2335, false);
    end;
    l_v1404_6 = {};
    l_v1556_6 = 0;
    l_v1557_4 = function()
        -- upvalues: l_v913_9 (ref)
        return l_v913_9.enabled:get() and l_v913_9.select:get("Watermark");
    end;
    do
        local l_l_v1556_6_0, l_l_v1557_4_0 = l_v1556_6, l_v1557_4;
        l_v1404_6.draw = function(v2338)
            -- upvalues: l_l_v1556_6_0 (ref), v32 (ref), l_l_v1557_4_0 (ref), l_play_0 (ref), l_v1403_6 (ref), l_v913_9 (ref)
            local v2339 = v2338:clone();
            l_l_v1556_6_0 = v32.interp(l_l_v1556_6_0, l_l_v1557_4_0(), 0.05);
            if l_l_v1556_6_0 <= 0 then
                return;
            else
                local v2340 = {};
                local v2341 = utils.net_channel();
                local v2342 = common.get_system_time();
                table.insert(v2340, "angelwings");
                table.insert(v2340, common.get_username());
                if v2341 ~= nil then
                    table.insert(v2340, string.format("delay: %dms", v2341.latency[1] * 1000));
                end;
                if v2342 ~= nil then
                    table.insert(v2340, string.format("%02d:%02d:%02d", v2342.hours, v2342.minutes, v2342.seconds));
                end;
                v2341 = 1;
                v2342 = "";
                local v2343 = table.concat(v2340, " | ");
                local v2344 = l_play_0.measure_text(v2341, v2342, v2343);
                local v2345 = color(255, 255, 255, 255);
                local v2346 = v2344 + vector(10, 8);
                v2339.x = v2339.x - v2346.x;
                v2345.a = v2345.a * l_l_v1556_6_0;
                l_v1403_6(v2339, v2339 + v2346, l_v913_9.color:get(), l_l_v1556_6_0);
                l_play_0.text(v2341, v2339 + vector(5, 4), v2345, v2342, v2343);
                v2338.y = v2338.y + (v2346.y + 10) * l_l_v1556_6_0;
                return;
            end;
        end;
    end;
    l_v1556_6 = {};
    l_v1557_4 = {};
    l_v1558_6 = 0;
    l_v1559_5 = nil;
    v1560 = nil;
    v1561 = vector(400, 340);
    v1562 = vector(120, 20);
    v1563 = l_play_0.screen_size();
    v1560 = v141.new("spectators", v1561, v1562, {
        border = {
            vector(0, 0), 
            v1563:clone()
        }
    });
    do
        local l_l_v1557_4_1, l_l_v1558_6_0, l_l_v1559_5_0, l_v1560_6, l_v1561_5, l_v1562_5, l_v1563_4 = l_v1557_4, l_v1558_6, l_v1559_5, v1560, v1561, v1562, v1563;
        l_v1560_6.update = function()
            -- upvalues: l_l_v1558_6_0 (ref)
            return l_l_v1558_6_0;
        end;
        l_v1561_5 = function()
            -- upvalues: l_v913_9 (ref)
            return l_v913_9.enabled:get() and l_v913_9.select:get("Spectators");
        end;
        l_v1562_5 = function(v2354)
            local l_m_iObserverMode_0 = v2354.m_iObserverMode;
            if l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5 then
                local l_m_hObserverTarget_0 = v2354.m_hObserverTarget;
                if l_m_hObserverTarget_0 ~= nil then
                    return l_m_hObserverTarget_0:get_spectators();
                end;
            end;
            return v2354:get_spectators();
        end;
        l_v1563_4 = function(v2357, v2358)
            -- upvalues: l_v1562_5 (ref), l_l_v1557_4_1 (ref), l_play_0 (ref), v32 (ref)
            local v2359 = entity.get_local_player();
            local v2360 = {};
            local v2361 = false;
            local v2362 = 0;
            if v2359 ~= nil then
                local v2363 = l_v1562_5(v2359) or {};
                for _, v2365 in pairs(v2363) do
                    local v2366 = v2365:get_index();
                    local v2367 = v2365:get_name();
                    local v2368 = v2365:get_steam_avatar();
                    v2361 = true;
                    v2360[v2366] = v2365;
                    l_l_v1557_4_1[v2366] = l_l_v1557_4_1[v2366] or {
                        name_height = 0, 
                        alpha = 0, 
                        name_width = 0, 
                        name = v2367, 
                        avatar = v2368
                    };
                    local v2369 = l_l_v1557_4_1[v2366];
                    local v2370 = l_play_0.measure_text(v2357, v2358, v2367);
                    v2369.name = v2367;
                    v2369.name_width = v2370.x;
                    v2369.name_height = v2370.y;
                end;
            end;
            for v2371, v2372 in pairs(l_l_v1557_4_1) do
                local v2373 = v2360[v2371] ~= nil;
                v2372.alpha = v32.interp(v2372.alpha, v2373, 0.05);
                if v2372.alpha <= 0.01 then
                    l_l_v1557_4_1[v2371] = nil;
                elseif (v2372.alpha > 0 or v2373) and v2362 < v2372.name_width then
                    v2362 = v2372.name_width;
                end;
            end;
            return l_l_v1557_4_1, v2361, v2362;
        end;
        l_v1556_6.draw = function()
            -- upvalues: l_v1563_4 (ref), l_v1561_5 (ref), l_l_v1558_6_0 (ref), v32 (ref), l_v1560_6 (ref), l_l_v1559_5_0 (ref), l_v1403_6 (ref), l_v913_9 (ref), l_play_0 (ref), v12 (ref)
            local v2374 = 1;
            local v2375 = "c";
            local v2376 = "spectators";
            local v2377, v2378, v2379 = l_v1563_4(v2374, v2375);
            local v2380 = l_v1561_5() and (v2378 or ui.get_alpha() > 0);
            l_l_v1558_6_0 = v32.interp(l_l_v1558_6_0, v2380, 0.05);
            if l_l_v1558_6_0 <= 0 then
                return;
            else
                local v2381 = l_v1560_6:get_drag_position():clone();
                local v2382 = math.max(66, v2379);
                local v2383 = vector(75 + v2382, 20);
                if l_l_v1559_5_0 == nil then
                    l_l_v1559_5_0 = v2383.x;
                end;
                l_l_v1559_5_0 = v32.interp(l_l_v1559_5_0, v2383.x, 0.033);
                v2383.x = math.floor(l_l_v1559_5_0);
                l_v1403_6(v2381, v2381 + v2383, l_v913_9.color:get(), l_l_v1558_6_0);
                l_play_0.text(v2374, v2381 + v2383 / 2 - vector(0, 1), color(255, 255 * l_l_v1558_6_0), v2375, v2376);
                local v2384 = 0;
                v2381.y = v2381.y + 3;
                for _, v2386 in pairs(v2377) do
                    local l_name_2 = v2386.name;
                    local l_avatar_0 = v2386.avatar;
                    local v2389 = color(255, 255, 255, 255);
                    local v2390 = l_l_v1558_6_0 * v2386.alpha;
                    v2389.a = v2389.a * v2390;
                    local v2391 = vector(v2386.name_height, v2386.name_height);
                    local v2392 = vector(v2381.x + 5, v2381.y + v2383.y);
                    local v2393 = vector(v2381.x + v2383.x - 5 - v2391.x, v2381.y + v2383.y);
                    l_play_0.text(v2374, v2392, v2389, "", l_name_2);
                    if l_avatar_0 ~= nil then
                        l_play_0.texture(l_avatar_0, v2393, v2391, v2389);
                    end;
                    v2384 = math.max(v2384, v2390);
                    v2383.y = v2383.y + v12(15 * v2390);
                end;
                v2383.y = v2383.y + v12(3 * v2384);
                l_v1560_6.size = v2383;
                l_v1560_6();
                return;
            end;
        end;
    end;
    l_v1557_4 = {};
    l_v1558_6 = {};
    l_v1559_5 = 0;
    v1560 = nil;
    v1561 = nil;
    v1562 = vector(400, 200);
    v1563 = vector(120, 20);
    v1564 = l_play_0.screen_size();
    v1561 = v141.new("hotkey_list", v1562, v1563, {
        border = {
            vector(0, 0), 
            v1564:clone()
        }
    });
    do
        local l_l_v1558_6_1, l_l_v1559_5_1, l_v1560_7, l_v1561_6, l_v1562_6, l_v1563_5, l_v1564_2, l_v1565_2 = l_v1558_6, l_v1559_5, v1560, v1561, v1562, v1563, v1564, v1565;
        l_v1561_6.update = function()
            -- upvalues: l_l_v1559_5_1 (ref)
            return l_l_v1559_5_1;
        end;
        l_v1562_6 = function()
            -- upvalues: l_v913_9 (ref)
            return l_v913_9.enabled:get() and l_v913_9.select:get("Hotkey List");
        end;
        l_v1563_5 = function(v2402, v2403)
            if next(v2403) == nil then
                v2403 = v2402:get();
                if next(v2403) == nil then
                    v2403 = v2402:list();
                end;
            end;
            local v2404 = {};
            for v2405 = 1, #v2403 do
                v2404[#v2404 + 1] = v2403[v2405]:sub(1, 1);
            end;
            return table.concat(v2404, ", ");
        end;
        l_v1564_2 = function(v2406, v2407, v2408)
            -- upvalues: l_v913_9 (ref), l_v1563_5 (ref)
            if type(v2408) == "boolean" or l_v913_9.only_key_state:get() then
                if v2407 == 1 then
                    return "Holding";
                elseif v2407 == 2 then
                    return "Toggled";
                else
                    return "Enabled";
                end;
            elseif type(v2408) == "table" then
                return l_v1563_5(v2406, v2408);
            else
                return tostring(v2408);
            end;
        end;
        l_v1565_2 = function(v2409, v2410)
            -- upvalues: l_v1564_2 (ref), l_l_v1558_6_1 (ref), l_play_0 (ref), v32 (ref)
            local v2411 = {};
            local v2412 = false;
            local v2413 = 0;
            local v2414 = 0;
            for _, v2416 in pairs(ui.get_binds()) do
                local v2417 = v2416.reference:id();
                local v2418 = string.format("[%s]", string.lower(l_v1564_2(v2416.reference, v2416.mode, v2416.value)));
                local l_name_3 = v2416.name;
                if v2416.active then
                    v2412 = true;
                    v2411[v2417] = v2416;
                end;
                l_l_v1558_6_1[v2417] = l_l_v1558_6_1[v2417] or {
                    value_width = 0, 
                    alpha = 0, 
                    height = 0, 
                    name_width = 0, 
                    name = l_name_3, 
                    mode = v2416.mode, 
                    value = v2416.value, 
                    reference = v2416.reference
                };
                local v2420 = l_l_v1558_6_1[v2417];
                local v2421 = l_play_0.measure_text(v2409, v2410, l_name_3);
                local v2422 = l_play_0.measure_text(v2409, v2410, v2418);
                v2420.name = l_name_3;
                v2420.value = v2418;
                v2420.mode = v2416.mode;
                v2420.reference = v2416.reference;
                v2420.height = math.max(v2421.y, v2422.y);
                v2420.name_width = v2421.x;
                v2420.value_width = v2422.x;
            end;
            for v2423, v2424 in pairs(l_l_v1558_6_1) do
                local v2425 = v2411[v2423] ~= nil;
                v2424.alpha = v32.interp(v2424.alpha, v2425, 0.05);
                if v2424.alpha <= 0.01 then
                    l_l_v1558_6_1[v2423] = nil;
                elseif v2424.alpha > 0 or v2425 then
                    if v2413 < v2424.name_width then
                        v2413 = v2424.name_width;
                    end;
                    if v2414 < v2424.value_width then
                        v2414 = v2424.value_width;
                    end;
                end;
            end;
            return l_l_v1558_6_1, v2412, v2413, v2414;
        end;
        l_v1557_4.draw = function()
            -- upvalues: l_v1565_2 (ref), l_v1562_6 (ref), l_l_v1559_5_1 (ref), v32 (ref), l_v1561_6 (ref), l_v1560_7 (ref), l_v1403_6 (ref), l_v913_9 (ref), l_play_0 (ref), v12 (ref)
            local v2426 = 1;
            local v2427 = "c";
            local v2428 = "keybinds";
            local v2429, v2430, v2431 = l_v1565_2(v2426, v2427);
            local v2432 = l_v1562_6() and (v2430 or ui.get_alpha() > 0);
            l_l_v1559_5_1 = v32.interp(l_l_v1559_5_1, v2432, 0.033);
            if l_l_v1559_5_1 <= 0 then
                return;
            else
                local v2433 = l_v1561_6:get_drag_position():clone();
                local v2434 = math.max(66, v2431);
                local v2435 = vector(75 + v2434, 20);
                if l_v1560_7 == nil then
                    l_v1560_7 = v2435.x;
                end;
                l_v1560_7 = v32.interp(l_v1560_7, v2435.x, 0.035);
                v2435.x = math.floor(l_v1560_7);
                l_v1403_6(v2433, v2433 + v2435, l_v913_9.color:get(), l_l_v1559_5_1);
                l_play_0.text(v2426, v2433 + v2435 / 2 - vector(0, 1), color(255, 255 * l_l_v1559_5_1), v2427, v2428);
                local v2436 = 0;
                v2433.y = v2433.y + 3;
                for _, v2438 in pairs(v2429) do
                    local l_v2438_0 = v2438;
                    local l_name_4 = l_v2438_0.name;
                    local l_value_0 = l_v2438_0.value;
                    local v2442 = color(255, 255, 255, 255);
                    local v2443 = l_v2438_0.alpha * l_l_v1559_5_1;
                    v2442.a = v2442.a * v2443;
                    local v2444 = vector(v2433.x + 5, v2433.y + v2435.y);
                    local v2445 = vector(v2433.x + v2435.x - 5, v2433.y + v2435.y);
                    l_play_0.text(v2426, v2444, v2442, "", l_name_4);
                    l_play_0.text(v2426, v2445, v2442, "r", l_value_0);
                    v2436 = math.max(v2436, l_v2438_0.alpha);
                    v2435.y = v2435.y + v12(15 * l_v2438_0.alpha);
                end;
                v2435.y = v2435.y + v12(3 * v2436);
                l_v1561_6.size = v2435;
                l_v1561_6();
                return;
            end;
        end;
    end;
    l_v1558_6 = {};
    l_v1559_5 = 0;
    v1560 = 0;
    v1561 = 0;
    v1562 = v1003(0, 2);
    v1563 = v1003(0, 3);
    v1564 = 0;
    v1565 = 0;
    v1566 = 0;
    v1567 = 0;
    v1568 = 0;
    v1569 = 0;
    v1570 = vector();
    v1571 = false;
    v1572 = false;
    v1573 = function()
        -- upvalues: l_v913_9 (ref)
        return l_v913_9.enabled:get() and l_v913_9.select:get("Anti-aimbot indication");
    end;
    v1574 = function()
        local v2446 = rage.antiaim:get_max_desync();
        local v2447 = rage.antiaim:get_rotation(false);
        local v2448 = rage.antiaim:get_rotation(true);
        local v2449 = math.normalize_yaw(v2448 - v2447);
        return math.clamp(v2449, -v2446, v2446);
    end;
    do
        local l_l_v1559_5_2, l_v1560_8, l_v1561_7, l_v1562_7, l_v1563_6, l_v1564_3, l_v1565_3, l_v1566_1, l_v1567_1, l_v1568_2, l_v1569_0, l_v1570_1, l_v1571_0, l_v1572_1, l_v1573_1, l_v1574_1, l_v1575_1, l_v1576_1 = l_v1559_5, v1560, v1561, v1562, v1563, v1564, v1565, v1566, v1567, v1568, v1569, v1570, v1571, v1572, v1573, v1574, v1575, v1576;
        l_v1575_1 = function()
            -- upvalues: l_v1567_1 (ref)
            local l_l_v1567_1_0 = l_v1567_1;
            if tonumber(l_l_v1567_1_0) < 10 then
                l_l_v1567_1_0 = "  " .. l_l_v1567_1_0;
            end;
            return string.format("FL: %s", l_l_v1567_1_0);
        end;
        l_v1576_1 = function()
            -- upvalues: l_v1571_0 (ref), l_v1561_7 (ref), v32 (ref), l_v1560_8 (ref), l_v1572_1 (ref)
            if l_v1571_0 then
                l_v1561_7 = v32.interp(l_v1561_7, false, 0.05);
                local v2469 = l_v1561_7 <= 0.01;
                l_v1560_8 = v32.interp(l_v1560_8, v2469, 0.05);
                return;
            elseif l_v1572_1 then
                l_v1560_8 = v32.interp(l_v1560_8, false, 0.05);
                local v2470 = l_v1560_8 <= 0.01;
                l_v1561_7 = v32.interp(l_v1561_7, v2470, 0.05);
                return;
            else
                l_v1560_8 = v32.interp(l_v1560_8, false, 0.05);
                l_v1561_7 = v32.interp(l_v1561_7, false, 0.05);
                return;
            end;
        end;
        v1578 = function(v2471)
            -- upvalues: l_v1570_1 (ref), l_v1569_0 (ref), l_v1013_8 (ref), l_v1563_6 (ref), l_v1562_7 (ref), l_v1574_1 (ref), l_v1567_1 (ref), l_v1568_2 (ref), l_v1571_0 (ref), l_v1572_1 (ref), l_v1399_6 (ref)
            local v2472 = entity.get_local_player();
            if v2472 == nil then
                return;
            else
                if v2471.choked_commands == 0 then
                    local l_m_vecOrigin_1 = v2472.m_vecOrigin;
                    if l_v1570_1 ~= nil then
                        l_v1569_0 = (l_m_vecOrigin_1 - l_v1570_1):length2dsqr();
                        l_v1013_8(l_v1563_6, l_v1569_0, true);
                    end;
                    l_v1013_8(l_v1562_7, math.abs(l_v1574_1()), true);
                    l_v1567_1 = l_v1568_2;
                    l_v1570_1 = l_m_vecOrigin_1;
                end;
                l_v1571_0 = rage.exploit:get() == 1;
                l_v1572_1 = l_v1399_6(l_v1563_6) > 3200;
                l_v1568_2 = v2471.choked_commands;
                return;
            end;
        end;
        l_v1558_6.draw = function(v2474)
            -- upvalues: l_v1573_1 (ref), l_l_v1559_5_2 (ref), v32 (ref), l_v1576_1 (ref), l_v913_9 (ref), l_v1575_1 (ref), l_v1399_6 (ref), l_v1563_6 (ref), l_v1569_0 (ref), l_v1565_3 (ref), l_v1566_1 (ref), l_v1564_3 (ref), l_v1572_1 (ref), l_play_0 (ref), l_v1560_8 (ref), l_v1561_7 (ref), l_v1403_6 (ref), l_v1562_7 (ref)
            local v2475 = v2474:clone();
            local v2476 = entity.get_local_player();
            local v2477 = l_v1573_1() and v2476 ~= nil and v2476:is_alive();
            l_l_v1559_5_2 = v32.interp(l_l_v1559_5_2, v2477, 0.05);
            l_v1576_1();
            if l_l_v1559_5_2 <= 0 then
                return;
            else
                local v2478 = 1;
                local v2479 = "";
                local v2480 = l_v913_9.color:get();
                local v2481 = l_v1575_1();
                local v2482 = globals.frametime * 3.75;
                local v2483 = 1200 + math.max(0, l_v1399_6(l_v1563_6) - 3800);
                local v2484 = math.abs(math.min(l_v1569_0 - 3800, v2483) / v2483 * 100);
                if l_v1565_3 ~= v2484 and l_v1566_1 < globals.realtime then
                    l_v1566_1 = globals.realtime + 0.005;
                    l_v1565_3 = l_v1565_3 + (v2484 < l_v1565_3 and -1 or 1);
                end;
                l_v1564_3 = l_v1564_3 + (l_v1572_1 and v2482 or -v2482);
                l_v1564_3 = l_v1564_3 > 1 and 1 or l_v1564_3;
                l_v1564_3 = l_v1564_3 < 0 and 0 or l_v1564_3;
                local v2485 = " | SHIFTING";
                local v2486 = l_play_0.measure_text(v2478, v2479, v2485);
                local v2487 = " | dst: " .. string.rep(" ", 10);
                local v2488 = l_play_0.measure_text(v2478, v2479, v2487);
                local v2489 = l_play_0.measure_text(v2478, v2479, v2481);
                local v2490 = color(255, 255, 255, 255);
                local v2491 = vector(v2489.x + 8, 17);
                v2491.x = v2491.x + v2486.x * l_v1560_8;
                v2491.x = v2491.x + v2488.x * l_v1561_7;
                v2475.x = v2475.x - v2491.x;
                v2490.a = v2490.a * l_l_v1559_5_2;
                local v2492 = vector(v2475.x + 4, v2475.y + 2);
                l_v1403_6(v2475, v2475 + v2491, l_v913_9.color:get(), l_l_v1559_5_2);
                l_play_0.text(v2478, v2492, v2490, v2479, v2481);
                v2492.x = v2492.x + v2489.x;
                if l_v1560_8 > 0 then
                    local v2493 = v2490:clone();
                    v2493.a = v2493.a * math.map(l_v1560_8, 0.9, 1, 0, 1);
                    l_play_0.text(v2478, v2492, v2493, v2479, v2485);
                end;
                if l_v1561_7 > 0 then
                    local v2494 = v2490:clone();
                    local v2495 = math.map(l_v1561_7, 0.9, 1, 0, 1);
                    v2494.a = v2494.a * v2495;
                    local v2496 = l_play_0.measure_text(v2478, v2479, " | dst: ");
                    local v2497 = vector(v2492.x + v2496.x + 2, v2492.y + 4);
                    local v2498 = v2497 + vector(math.min(100, l_v1565_3) / 100 * 24, 5);
                    local v2499 = v2480:clone();
                    local v2500 = v2480:clone();
                    v2499.a = 220 * l_v1564_3 * v2495 * l_l_v1559_5_2;
                    v2500.a = 25 * l_v1564_3 * v2495 * l_l_v1559_5_2;
                    l_play_0.text(v2478, v2492, v2494, v2479, v2487);
                    l_play_0.gradient(v2497, v2498, v2499, v2500, v2499, v2500);
                end;
                local v2501 = string.format("FAKE (%.1f\194\176)", l_v1399_6(l_v1562_7));
                local v2502 = l_play_0.measure_text(v2478, v2479, v2501);
                local v2503 = vector(v2502.x + 8, 18);
                v2475.x = v2475.x - v2503.x - 4;
                l_v1403_6(v2475, v2475 + v2503, l_v913_9.color:get(), l_l_v1559_5_2);
                l_play_0.text(v2478, v2475 + vector(4, 2), v2490, v2479, v2501);
                v2474.y = v2474.y + (v2503.y + 10) * l_l_v1559_5_2;
                return;
            end;
        end;
        events.createmove(v1578);
    end;
    l_v1559_5 = {};
    v1560 = v1400();
    v1561 = function(v2504)
        if v2504 < 1 then
            return ("%.2f"):format(v2504);
        elseif v2504 < 10 then
            return ("%.1f"):format(v2504);
        else
            return ("%d"):format(v2504);
        end;
    end;
    pcall(ffi.cdef, "                bool EnumDisplaySettingsA(\n                    unsigned int  lpszDeviceName,\n                    unsigned long iModeNum,\n                    void*         lpDevMode\n                );\n            ");
    v1563 = ffi.typeof("                struct {\n                    char pad_0[120];\n                    unsigned long dmDisplayFrequency;\n                    char pad_1[32];\n                }\n            ")();
    ffi.C.EnumDisplaySettingsA(0, -1, v1563);
    v1564 = 0;
    v1565 = common.get_timestamp();
    v1566 = v1003(0, 90);
    v1567 = v1003(0, 30);
    v1568 = 0;
    v1569 = 0;
    v1570 = function()
        -- upvalues: l_v913_9 (ref)
        return l_v913_9.enabled:get() and l_v913_9.select:get("Frequency update information");
    end;
    do
        local l_v1560_9, l_v1561_8, l_v1563_7, l_v1564_4, l_v1565_4, l_v1566_2, l_v1567_2, l_v1568_3, l_v1569_1, l_v1570_2, l_v1571_1 = v1560, v1561, v1563, v1564, v1565, v1566, v1567, v1568, v1569, v1570, v1571;
        l_v1571_1 = function()
            -- upvalues: l_v1568_3 (ref), l_v1013_8 (ref), l_v1567_2 (ref), l_v1569_1 (ref)
            l_v1568_3 = 0.9 * l_v1568_3 + 0.09999999999999998 * globals.absoluteframetime;
            l_v1013_8(l_v1567_2, math.abs(l_v1569_1 - 1 / l_v1568_3), true);
            l_v1569_1 = 1 / l_v1568_3;
        end;
        v1572 = function()
            -- upvalues: l_v1565_4 (ref)
            l_v1565_4 = common.get_timestamp();
        end;
        v1573 = function()
            -- upvalues: l_v1565_4 (ref), l_v1013_8 (ref), l_v1566_2 (ref)
            local v2516 = common.get_timestamp() - l_v1565_4;
            l_v1013_8(l_v1566_2, v2516);
        end;
        l_v1559_5.draw = function(v2517)
            -- upvalues: l_v1571_1 (ref), l_v1570_2 (ref), l_v1564_4 (ref), v32 (ref), l_v913_9 (ref), l_v1399_6 (ref), l_v1566_2 (ref), l_v1563_7 (ref), l_v1561_8 (ref), l_play_0 (ref), l_v1403_6 (ref), l_v1567_2 (ref), l_v1560_9 (ref)
            l_v1571_1();
            local v2518 = v2517:clone();
            local v2519 = l_v1570_2();
            l_v1564_4 = v32.interp(l_v1564_4, v2519, 0.05);
            if l_v1564_4 <= 0 then
                return;
            else
                local v2520 = 1;
                local v2521 = "";
                local v2522 = l_v913_9.color:get();
                local v2523 = l_v1399_6(l_v1566_2);
                local v2524 = tonumber(l_v1563_7.dmDisplayFrequency);
                local v2525 = string.format("%sms / %dhz", l_v1561_8(v2523), v2524);
                local v2526 = l_play_0.measure_text(v2520, v2521, v2525);
                local v2527 = color(255, 255, 255, 255);
                local v2528 = vector(v2526.x + 8, 18);
                v2518.x = v2518.x - v2528.x;
                v2527.a = v2527.a * l_v1564_4;
                l_v1403_6(v2518, v2518 + v2528, l_v913_9.color:get(), l_v1564_4);
                l_play_0.text(v2520, vector(v2518.x + 4, v2518.y + 2), v2527, v2521, v2525);
                local v2529 = "IO | ";
                local v2530 = l_play_0.measure_text(v2520, v2521, v2529);
                local v2531 = v2529 .. "       ";
                local v2532 = l_play_0.measure_text(v2520, v2521, v2531);
                local v2533 = v2530.x + 4;
                local v2534 = vector(v2532.x + 8, 18);
                local v2535 = {
                    [1] = nil, 
                    [2] = 1, 
                    [3] = 3, 
                    [4] = nil, 
                    [5] = 0, 
                    [1] = v2523, 
                    [4] = l_v1399_6(l_v1567_2) / 4
                };
                local _ = math.min(unpack(v2535));
                local v2537 = math.max(unpack(v2535));
                v2518.x = v2518.x - v2534.x;
                local v2538 = vector(v2518.x - 4, v2518.y);
                l_v1403_6(v2538, v2538 + v2534, l_v913_9.color:get(), l_v1564_4);
                l_play_0.text(v2520, v2518 + vector(0, 2), v2527, v2521, v2531);
                l_v1560_9:draw_histogram(v2535, 0, v2537, #v2535, {
                    draw_peeks = false, 
                    draw_bar = "gradient_fadein", 
                    thickness = 1, 
                    x = v2518.x - 4 + v2533, 
                    y = v2518.y + 4, 
                    w = v2534.x - v2533 - 4, 
                    h = v2534.y - 8, 
                    clr_1 = v2522:alpha_modulate(255 * l_v1564_4), 
                    clr_2 = color(0, 127, 255, 255 * l_v1564_4)
                }, false);
                return;
            end;
        end;
        events.pre_render(v1572);
        events.post_render(v1573);
    end;
    v1560 = function()
        -- upvalues: l_play_0 (ref), l_v1404_6 (ref), l_v1556_6 (ref), l_v1557_4 (ref), l_v1558_6 (ref), l_v1559_5 (ref)
        local v2539 = l_play_0.screen_size();
        local v2540 = vector(v2539.x - 10, 10);
        l_v1404_6.draw(v2540);
        l_v1556_6.draw();
        l_v1557_4.draw();
        l_v1558_6.draw(v2540);
        l_v1559_5.draw(v2540);
    end;
    events.render(v1560);
end;
v913 = nil;
l_match_0 = v384.visuals.watermark;
l_angles_0 = {};
v1003 = string.format("%s\a%%s.PINK", string.upper(v13.name));
v1013 = string.format("VICTIM - %s [\a%%s%s\a%%s]", string.upper(v13.user), string.upper(v13.build));
do
    local l_l_match_0_9, l_l_angles_0_8, l_v1003_8, l_v1013_9 = l_match_0, l_angles_0, v1003, v1013;
    do
        local l_l_v1003_8_0, l_l_v1013_9_0 = l_v1003_8, l_v1013_9;
        l_l_angles_0_8.on_render = function()
            -- upvalues: l_l_match_0_9 (ref), l_play_0 (ref), l_l_v1003_8_0 (ref), l_l_v1013_9_0 (ref), v257 (ref)
            local v2547 = l_l_match_0_9.color:get():alpha_modulate(255);
            local v2548 = color();
            local v2549 = v2547:to_hex();
            local v2550 = v2548:to_hex();
            local v2551 = l_play_0.screen_size();
            local v2552 = 2;
            local v2553 = "";
            local v2554 = {
                string.format(l_l_v1003_8_0, v2549), 
                string.format(l_l_v1013_9_0, v2549, v2550)
            };
            local v2555 = vector(8, v2551.y / 2);
            if v257.eva_small ~= nil then
                local v2556 = vector(35, 35);
                local v2557 = color(255, 255, 255);
                l_play_0.texture(v257.eva_small, v2555, v2556, v2557, "f");
                v2555.x = v2555.x + v2556.x - 4;
                v2555.y = v2555.y + v2556.y + 1;
            end;
            local v2558 = l_play_0.measure_text(v2552, v2553, v2554[1]);
            local v2559 = l_play_0.measure_text(v2552, v2553, v2554[2]);
            v2558.y = v2558.y - 2;
            v2559.y = v2559.y - 2;
            v2555.y = v2555.y - v2559.y;
            l_play_0.text(v2552, v2555, v2548, v2553, v2554[2]);
            v2555.y = v2555.y - (v2558.y - 2);
            l_play_0.text(v2552, v2555, v2548, v2553, v2554[1]);
        end;
    end;
    l_v1003_8 = {};
    l_v1013_9 = 1;
    v1399 = 3;
    v1400 = 3;
    v1401 = 34;
    l_aimtools_0 = 5;
    v1403 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)");
    v1404 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)");
    v1556 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)");
    v1557 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)");
    v1558 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)");
    v1559 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)");
    v1561 = v1404(v1403(l_v1013_9), l_v1013_9, "SteamFriends015");
    v1562 = v1556(l_v1013_9, "SteamUtils009");
    v1563 = string.format("\a%%s%s\a%%s.pink", string.lower(v13.name));
    v1564 = string.format("build: \a%%s%s", string.lower(v13.build));
    v1565 = string.format("user: \a%%s%s", v13.user);
    do
        local l_v1399_7, l_v1400_7, l_v1401_7, l_l_aimtools_0_8, l_v1557_5, l_v1558_7, l_v1559_6, l_v1561_9, l_v1562_8, l_v1563_8, l_v1564_5, l_v1565_5, l_v1568_4 = v1399, v1400, v1401, l_aimtools_0, v1557, v1558, v1559, v1561, v1562, v1563, v1564, v1565, v1568;
        l_v1568_4 = (function(v2573)
            -- upvalues: l_v1557_5 (ref), l_v1561_9 (ref), l_v1558_7 (ref), l_v1562_8 (ref), l_v1559_6 (ref), l_play_0 (ref)
            local v2574 = l_v1557_5(l_v1561_9, v2573);
            if v2574 <= 0 then
                return nil;
            else
                local v2575 = ffi.new("unsigned int[?]", 1);
                local v2576 = ffi.new("unsigned int[?]", 1);
                if not l_v1558_7(l_v1562_8, v2574, v2575, v2576) then
                    return nil;
                else
                    local v2577 = v2575[0] * v2576[0] * 4;
                    local v2578 = ffi.new("unsigned char[?]", v2577);
                    if not l_v1559_6(l_v1562_8, v2574, v2578, v2577) then
                        return nil;
                    else
                        local v2579 = ffi.string(v2578, v2577);
                        local v2580 = vector(v2575[0], v2576[0]);
                        return l_play_0.load_image_rgba(v2579, v2580), v2580;
                    end;
                end;
            end;
        end)((function()
            local l_MyPersonaAPI_0 = panorama.MyPersonaAPI;
            if l_MyPersonaAPI_0 == nil then
                return 0ULL;
            else
                local v2582 = l_MyPersonaAPI_0.GetXuid();
                return 76500000000000000ULL + tonumber(v2582:sub(4, -1));
            end;
        end)());
        l_v1003_8.on_render = function()
            -- upvalues: l_v1568_4 (ref), l_l_match_0_9 (ref), l_play_0 (ref), l_v1563_8 (ref), l_v1564_5 (ref), l_v1565_5 (ref), l_v1399_7 (ref), l_v1400_7 (ref), l_v1401_7 (ref), l_l_aimtools_0_8 (ref)
            if l_v1568_4 == nil then
                return;
            else
                local v2583 = l_l_match_0_9.color:get():alpha_modulate(255);
                local v2584 = color();
                local v2585 = v2583:to_hex();
                local v2586 = v2584:to_hex();
                local v2587 = l_play_0.screen_size();
                local v2588 = vector(v2587.x, 0);
                local v2589 = 4;
                local v2590 = "";
                local v2591 = string.format(l_v1563_8, v2585, v2586);
                local v2592 = 1;
                local v2593 = "";
                local v2594 = string.format(l_v1564_5, v2585);
                local v2595 = 1;
                local v2596 = "";
                local v2597 = string.format(l_v1565_5, v2585);
                local v2598 = l_play_0.measure_text(v2589, v2590, v2591);
                local v2599 = l_play_0.measure_text(v2592, v2593, v2594);
                local v2600 = l_play_0.measure_text(v2595, v2596, v2597);
                local v2601 = vector(l_v1399_7, l_v1400_7) * 2 + vector(math.max(v2598.x, v2599.x, v2600.x) + l_v1401_7 + l_l_aimtools_0_8, math.max(v2598.y + v2599.y + v2600.y, l_v1401_7));
                local v2602 = v2601 + vector(10, 0);
                local v2603 = v2588 + vector(-(l_v1399_7 + l_v1401_7), (v2601.y - l_v1401_7) / 2);
                local v2604 = v2588 + vector(-v2602.x, 0);
                l_play_0.gradient(v2604, v2604 + v2602, v2583:alpha_modulate(0), v2583:alpha_modulate(220), v2583:alpha_modulate(0), v2583:alpha_modulate(220));
                l_play_0.texture(l_v1568_4, v2603, vector(l_v1401_7, l_v1401_7), color(), "f");
                local v2605 = v2588 + vector(-v2601.x + l_v1399_7, l_v1400_7);
                l_play_0.text(v2589, v2605, v2584, v2590, v2591);
                v2605.y = v2605.y + v2598.y;
                l_play_0.text(v2592, v2605, v2584, v2593, v2594);
                v2605.y = v2605.y + v2599.y;
                l_play_0.text(v2595, v2605, v2584, v2596, v2597);
                v2605.y = v2605.y + v2600.y;
                return;
            end;
        end;
    end;
    l_v1013_9 = function(v2606)
        -- upvalues: l_l_angles_0_8 (ref), l_v1003_8 (ref)
        if v2606 == nil then
            v2606 = {};
        end;
        events.render(l_l_angles_0_8.on_render, v2606.branded == true);
        events.render(l_v1003_8.on_render, v2606.corner == true);
    end;
    v1399 = nil;
    v1400 = function(v2607)
        -- upvalues: l_v1013_9 (ref)
        l_v1013_9({
            branded = v2607:get("Branded"), 
            corner = v2607:get("Corner")
        });
    end;
    do
        local l_v1400_8 = v1400;
        v1401 = function(v2609)
            -- upvalues: l_v1013_9 (ref), l_l_match_0_9 (ref), l_v1400_8 (ref)
            local v2610 = v2609:get();
            if not v2610 then
                l_v1013_9(nil);
            end;
            if v2610 then
                l_l_match_0_9.style:set_callback(l_v1400_8, true);
            else
                l_l_match_0_9.style:unset_callback(l_v1400_8);
            end;
        end;
        l_l_match_0_9.enabled:set_callback(v1401, true);
    end;
end;
l_match_0 = nil;
l_angles_0 = v384.visuals.manual_arrows;
v1003 = v384.antiaim.settings.manual_yaw;
v1013 = l_play_0.load_font("C:\\Windows\\Fonts\\verdana.ttf", vector(16, 16.5, 0), "a");
v1399 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1400 = 0;
v1401 = 0;
l_aimtools_0 = function(v2611, v2612, v2613)
    return v2611 + v2612 * vector():angles(vector(0, v2613, 0));
end;
do
    local l_l_angles_0_9, l_v1003_9, l_v1013_10, l_v1399_8, l_v1400_9, l_v1401_8, l_l_aimtools_0_9, l_v1403_7, l_v1404_7, l_v1556_7, l_v1557_6 = l_angles_0, v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557;
    l_v1403_7 = function()
        -- upvalues: l_l_angles_0_9 (ref), l_play_0 (ref), l_l_aimtools_0_9 (ref)
        if not l_l_angles_0_9.dynamic_mode:get() then
            return 0;
        else
            local v2625 = l_l_angles_0_9.style:get();
            if v2625 ~= 1 and v2625 ~= 4 then
                return 0;
            else
                local v2626 = entity.get_local_player();
                local v2627 = entity.get_threat();
                if v2626 == nil or v2627 == nil then
                    return 0;
                else
                    local v2628 = l_play_0.camera_angles();
                    local l_m_angEyeAngles_0 = v2627.m_angEyeAngles;
                    local v2630 = v2626:get_origin();
                    local v2631 = v2627:get_origin();
                    local v2632 = l_l_aimtools_0_9(v2630, 50, v2628.y + 110);
                    local v2633 = l_l_aimtools_0_9(v2630, 30, v2628.y + 60);
                    local v2634 = l_l_aimtools_0_9(v2630, 50, v2628.y - 110);
                    local v2635 = l_l_aimtools_0_9(v2630, 30, v2628.y - 60);
                    local v2636 = l_l_aimtools_0_9(v2631, 40, l_m_angEyeAngles_0.y + 115);
                    local v2637 = l_l_aimtools_0_9(v2631, 20, l_m_angEyeAngles_0.y + 35);
                    local v2638 = l_l_aimtools_0_9(v2631, 40, l_m_angEyeAngles_0.y - 115);
                    local v2639 = l_l_aimtools_0_9(v2631, 20, l_m_angEyeAngles_0.y - 35);
                    local v2640 = utils.trace_bullet(v2627, vector(v2636.x, v2636.y, v2636.z + 70), v2632);
                    local v2641 = utils.trace_bullet(v2627, vector(v2637.x, v2637.y, v2637.z + 30), v2633);
                    local v2642 = utils.trace_bullet(v2627, vector(v2638.x, v2638.y, v2638.z + 70), v2634);
                    local v2643 = utils.trace_bullet(v2627, vector(v2639.x, v2639.y, v2639.z + 30), v2635);
                    local v2644 = 0;
                    if v2640 == 0 then
                        if v2643 > 0 then
                            v2644 = 2;
                        elseif v2642 > 0 then
                            v2644 = 1;
                        end;
                    end;
                    if v2642 == 0 then
                        if v2641 > 0 then
                            v2644 = -2;
                        elseif v2640 > 0 then
                            v2644 = -1;
                        end;
                    end;
                    return v2644;
                end;
            end;
        end;
    end;
    l_v1404_7 = function()
        -- upvalues: l_v1003_9 (ref)
        return l_v1003_9.select:get();
    end;
    l_v1556_7 = function()
        -- upvalues: l_v1401_8 (ref), l_v1403_7 (ref)
        l_v1401_8 = l_v1403_7();
    end;
    l_v1557_6 = function()
        -- upvalues: l_l_angles_0_9 (ref), l_v1404_7 (ref), l_v1401_8 (ref), l_play_0 (ref), l_v1400_9 (ref), v32 (ref), l_v1399_8 (ref), v12 (ref), l_v1013_10 (ref)
        local v2645 = entity.get_local_player();
        if v2645 == nil or not v2645:is_alive() then
            return;
        else
            local v2646 = l_l_angles_0_9.style:get();
            local v2647 = l_l_angles_0_9.offset:get();
            local v2648 = l_l_angles_0_9.accent_color:get();
            local v2649 = l_l_angles_0_9.secondary_color:get();
            local v2650 = l_v1404_7();
            local v2651 = rage.antiaim:inverter();
            local v2652 = v2650 == "Left" or l_v1401_8 < 0;
            local v2653 = v2650 == "Right" or l_v1401_8 > 0;
            local l_m_bIsScoped_2 = v2645.m_bIsScoped;
            local v2655 = l_play_0.screen_size();
            local v2656, v2657 = vector(v2655.x / 2, v2655.y / 2):unpack();
            local v2658 = v2650 ~= nil and v2650 ~= "Off";
            l_v1400_9 = v32.interp(l_v1400_9, l_m_bIsScoped_2 and l_l_angles_0_9.animate_scope:get(), 0.05);
            if v2658 or l_v1401_8 ~= 0 then
                if v2646 == 1 then
                    local l_l_v1399_8_0 = l_v1399_8;
                    local v2660 = "+";
                    local v2661 = l_v1401_8 == -2 and "<<" or "<";
                    local v2662 = l_v1401_8 == 2 and ">>" or ">";
                    local v2663 = l_play_0.measure_text(l_l_v1399_8_0, v2660, v2661);
                    local v2664 = l_play_0.measure_text(l_l_v1399_8_0, v2660, v2662);
                    local v2665 = v2652 and v2648 or v2649;
                    local v2666 = v2653 and v2648 or v2649;
                    local v2667 = vector(v2656 - v2647, v2657 + 1 - v2663.y * 0.5);
                    local v2668 = vector(v2656 + v2647, v2657 + 1 - v2664.y * 0.5);
                    v2667.x = v2667.x - v2663.x;
                    l_play_0.text(l_l_v1399_8_0, v2667, v2665, v2660, v2661);
                    l_play_0.text(l_l_v1399_8_0, v2668, v2666, v2660, v2662);
                end;
                if v2646 == 3 then
                    local l_l_v1399_8_1 = l_v1399_8;
                    local v2670 = "+";
                    local v2671 = "\239\132\132";
                    local v2672 = "\239\132\133";
                    local v2673 = l_play_0.measure_text(l_l_v1399_8_1, v2670, v2671);
                    local v2674 = l_play_0.measure_text(l_l_v1399_8_1, v2670, v2672);
                    local v2675 = v2652 and v2648 or v2649;
                    local v2676 = v2653 and v2648 or v2649;
                    local v2677 = v12(20 * l_v1400_9);
                    local v2678 = v12(20 * l_v1400_9);
                    v2675.a = v2675.a - v2675.a * (0.4 * l_v1400_9);
                    v2676.a = v2676.a - v2676.a * (0.4 * l_v1400_9);
                    local v2679 = vector(v2656 - v2647 - v2677, v2657 - v2673.y * 0.4);
                    local v2680 = vector(v2656 + v2647 + v2678, v2657 - v2674.y * 0.4);
                    v2679.x = v2679.x - v2673.x;
                    l_play_0.text(l_l_v1399_8_1, v2679, v2675, v2670, v2671);
                    l_play_0.text(l_l_v1399_8_1, v2680, v2676, v2670, v2672);
                end;
                if v2646 == 4 then
                    local l_l_v1013_10_0 = l_v1013_10;
                    local v2682 = "";
                    local v2683 = l_v1401_8 == -2 and "\226\157\174\226\157\174" or "\226\157\174";
                    local v2684 = l_v1401_8 == 2 and "\226\157\175\226\157\175" or "\226\157\175";
                    local v2685 = l_play_0.measure_text(l_l_v1013_10_0, v2682, v2683);
                    local v2686 = l_play_0.measure_text(l_l_v1013_10_0, v2682, v2684);
                    local v2687 = v2652 and v2648 or v2649;
                    local v2688 = v2653 and v2648 or v2649;
                    local v2689 = vector(v2656 - v2647, v2657 - v2685.y * 0.5);
                    local v2690 = vector(v2656 + v2647, v2657 - v2686.y * 0.5);
                    v2689.x = v2689.x - v2685.x;
                    l_play_0.text(l_l_v1013_10_0, v2689, v2687, v2682, v2683);
                    l_play_0.text(l_l_v1013_10_0, v2690, v2688, v2682, v2684);
                end;
            end;
            if v2646 == 2 then
                local v2691 = 2;
                local v2692 = 13;
                local v2693 = 9;
                local v2694 = color(35, 35, 35, 150);
                local v2695 = v2652 and v2648 or v2694;
                local v2696 = v2653 and v2648 or v2694;
                local v2697 = v2651 == true and v2649 or v2694;
                local v2698 = v2651 == false and v2649 or v2694;
                local v2699 = v2656 - v2647 - v2692;
                local v2700 = v2656 + v2647 + v2692;
                local v2701 = vector(v2699 + v2691 + 2, v2657 - v2693);
                local v2702 = vector(v2700 - v2691 - 2, v2657 - v2693);
                local v2703 = vector(-v2691, v2693 * 2);
                local v2704 = vector(v2691, v2693 * 2);
                l_play_0.poly(v2695, vector(v2699 + 1 - v2692, v2657), vector(v2699 + 1, v2657 - v2693), vector(v2699 + 1, v2657 + v2693));
                l_play_0.poly(v2696, vector(v2700 + v2692, v2657), vector(v2700, v2657 - v2693), vector(v2700, v2657 + v2693));
                l_play_0.rect(v2701, v2701 + v2703, v2697);
                l_play_0.rect(v2702, v2702 + v2704, v2698);
            end;
            return;
        end;
    end;
    v1558 = nil;
    v1559 = function(v2705)
        -- upvalues: l_v1557_6 (ref), l_v1556_7 (ref)
        local v2706 = v2705:get();
        events.render(l_v1557_6, v2706);
        events.createmove(l_v1556_7, v2706);
    end;
    l_l_angles_0_9.enabled:set_callback(v1559, true);
end;
l_angles_0 = nil;
v1003 = v384.visuals.custom_scope;
v1013 = 9.25925925925926E-4;
v1399 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v1400 = 0;
do
    local l_v1003_10, l_v1013_11, l_v1399_9, l_v1400_10, l_v1401_9, l_l_aimtools_0_10, l_v1403_8 = v1003, v1013, v1399, v1400, v1401, l_aimtools_0, v1403;
    l_v1401_9 = function()
        -- upvalues: l_v1400_10 (ref), v32 (ref), l_play_0 (ref), l_v1003_10 (ref), l_v1013_11 (ref), v12 (ref)
        local v2714 = entity.get_local_player();
        if v2714 == nil or not v2714:is_alive() then
            return;
        else
            local v2715 = v2714:get_player_weapon();
            if v2715 == nil then
                return;
            else
                l_v1400_10 = v32.interp(l_v1400_10, v2714.m_bIsScoped, 0.05);
                if l_v1400_10 == 0 then
                    return;
                else
                    local v2716 = l_play_0.screen_size();
                    local v2717 = v2716 * 0.5;
                    local v2718 = l_v1003_10.accent_color:get();
                    local v2719 = l_v1003_10.secondary_color:get();
                    local v2720 = l_v1003_10.offset:get() * v2716.y * l_v1013_11;
                    local v2721 = l_v1003_10.position:get() * v2716.y * l_v1013_11;
                    local v2722 = l_v1003_10.thickness:get();
                    local v2723 = l_v1003_10.extra_options:get("Rotate Angle");
                    if l_v1003_10.extra_options:get("Dynamic Offset") then
                        local v2724 = v2715:get_spread();
                        local v2725 = (v2715:get_inaccuracy() + v2724) * 360;
                        v2720 = v2720 + v2725;
                        v2721 = v2721 + v2725;
                    end;
                    v2720 = v12(v2720);
                    v2721 = v12(v2721);
                    v2718.a = v2718.a * l_v1400_10;
                    v2719.a = v2719.a * l_v1400_10;
                    if v2723 then
                        l_play_0.push_rotation(45);
                    end;
                    if not l_v1003_10.exclude_lines:get("Top") then
                        local v2726 = vector(v2717.x + 0.5 - v2722 * 0.5, v2717.y - v2720 + 1);
                        local v2727 = vector(v2717.x + 0.5 + v2722 * 0.5, v2717.y - v2721 + 1);
                        l_play_0.gradient(v2726, v2727, v2718, v2718, v2719, v2719);
                    end;
                    if not l_v1003_10.exclude_lines:get("Bottom") then
                        local v2728 = vector(v2717.x + 0.5 - v2722 * 0.5, v2717.y + v2720);
                        local v2729 = vector(v2717.x + 0.5 + v2722 * 0.5, v2717.y + v2721);
                        l_play_0.gradient(v2728, v2729, v2718, v2718, v2719, v2719);
                    end;
                    if not l_v1003_10.exclude_lines:get("Left") then
                        local v2730 = vector(v2717.x - v2720 + 1, v2717.y + 0.5 - v2722 * 0.5);
                        local v2731 = vector(v2717.x - v2721 + 1, v2717.y + 0.5 + v2722 * 0.5);
                        l_play_0.gradient(v2730, v2731, v2718, v2719, v2718, v2719);
                    end;
                    if not l_v1003_10.exclude_lines:get("Right") then
                        local v2732 = vector(v2717.x + v2720, v2717.y + 0.5 - v2722 * 0.5);
                        local v2733 = vector(v2717.x + v2721, v2717.y + 0.5 + v2722 * 0.5);
                        l_play_0.gradient(v2732, v2733, v2718, v2719, v2718, v2719);
                    end;
                    if v2723 then
                        l_play_0.pop_rotation();
                    end;
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_10 = function()
        -- upvalues: l_v1399_9 (ref)
        l_v1399_9:override();
    end;
    l_v1403_8 = function(v2734)
        -- upvalues: l_v1399_9 (ref), l_v1401_9 (ref), l_l_aimtools_0_10 (ref)
        if not v2734 then
            l_v1399_9:override();
        end;
        events.render(l_v1401_9, v2734);
        events.shutdown(l_l_aimtools_0_10, v2734);
    end;
    v1404 = nil;
    v1556 = function(v2735)
        -- upvalues: l_v1399_9 (ref), l_v1403_8 (ref)
        local v2736 = v2735:get();
        if v2736 then
            l_v1399_9:override("Remove All");
        end;
        l_v1403_8(v2736);
    end;
    l_v1003_10.enabled:set_callback(v1556, true);
end;
v1003 = nil;
v1013 = v384.visuals.damage_indicator;
v1399 = {
    Default = 1, 
    Alternative = 2
};
v1400 = function()
    -- upvalues: v26 (ref)
    local v2737 = v26.ragebot.selection.min_damage:get();
    if v2737 == 0 then
        return "A";
    elseif v2737 > 100 then
        return string.format("+%d", v2737 - 100);
    else
        return v2737;
    end;
end;
do
    local l_v1013_12, l_v1399_10, l_v1400_11, l_v1401_10, l_l_aimtools_0_11 = v1013, v1399, v1400, v1401, l_aimtools_0;
    l_v1401_10 = function()
        -- upvalues: v788 (ref), v26 (ref), l_v1013_12 (ref), l_play_0 (ref), l_v1399_10 (ref), l_v1400_11 (ref)
        local v2743 = entity.get_local_player();
        if v2743 == nil or not v2743:is_alive() then
            return;
        else
            local v2744 = v788.get(v26.ragebot.selection.min_damage);
            if (v2744 == nil or not v2744.active) and l_v1013_12.if_override:get() then
                return;
            else
                local v2745 = v2744 ~= nil and v2744.active and l_v1013_12.active_color:get() or l_v1013_12.inactive_color:get();
                local v2746 = (l_play_0.screen_size() / 2):clone();
                local v2747 = l_v1399_10[l_v1013_12.font:get()];
                if v2747 == nil then
                    return;
                else
                    local v2748 = l_v1013_12.offset:get();
                    local v2749 = "";
                    local v2750 = l_v1400_11();
                    local v2751 = l_play_0.measure_text(v2747, v2749, v2750);
                    v2746.x = v2746.x + v2748 + 2;
                    v2746.y = v2746.y - v2748;
                    v2746.y = v2746.y - v2751.y;
                    l_play_0.text(v2747, v2746, v2745, v2749, v2750);
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_11 = function(v2752)
        -- upvalues: l_v1401_10 (ref)
        events.render(l_v1401_10, v2752);
    end;
    v1403 = nil;
    v1404 = function(v2753)
        -- upvalues: l_l_aimtools_0_11 (ref)
        l_l_aimtools_0_11(v2753:get());
    end;
    l_v1013_12.enabled:set_callback(v1404, true);
end;
v1013 = nil;
v1399 = v384.visuals.break_lc_indicator;
v1400 = l_play_0.load_font("Calibri", 11, "ad");
v1401 = 0;
l_aimtools_0 = 0;
v1403 = "lc status";
v1404 = color();
v1556 = 0;
v1557 = 0;
v1558 = 0;
v1559 = false;
v1560 = nil;
v1561 = l_play_0.screen_size();
v1562 = vector(60, 30);
v1563 = vector((v1561.x - v1562.x) / 2, v1561.y * 0.3475);
v1560 = v141.new("lc_indicator", v1563, v1562, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1561.x / 2, 0), 
            [3] = v1561.y
        }
    }, 
    border = {
        vector(v1561.x * 0.5, 0), 
        vector(v1561.x * 0.5, v1561.y)
    }
});
v1561 = function()
    -- upvalues: v384 (ref), v394 (ref), v865 (ref)
    if not v384.antiaim.enabled:get() then
        return not v394.is_onground;
    else
        local v2754 = entity.get_local_player();
        if v2754 == nil then
            return;
        else
            local v2755 = v2754:get_player_weapon();
            if v2755 == nil then
                return;
            else
                local v2756 = v2755:get_weapon_info();
                if v2756 == nil then
                    return;
                else
                    local l_weapon_type_3 = v2756.weapon_type;
                    local v2758 = v2755:get_weapon_index();
                    local v2759 = l_weapon_type_3 == 9;
                    local v2760 = v2758 == 64;
                    if v2759 or v2760 then
                        return false;
                    else
                        local v2761 = v865.builder:get_old_items();
                        if v2761 == nil then
                            return false;
                        else
                            local l_defensive_2 = v2761.defensive;
                            if l_defensive_2 == nil then
                                return false;
                            else
                                return l_defensive_2.force_break_lc:get();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v1562 = function(v2763)
    if v2763 <= 0 then
        return "failed", color(255, 64, 64);
    elseif v2763 <= 3 then
        return "bad", color(255, 175, 104);
    elseif v2763 <= 6 then
        return "ok", color(255, 255, 255);
    elseif v2763 <= 9 then
        return "good", color(205, 236, 142);
    elseif v2763 <= 11 then
        return "nice", color(122, 241, 182);
    elseif v2763 <= 12 then
        return "ideal lc", color(101, 213, 255);
    else
        return "angel lc", color(207, 145, 255);
    end;
end;
do
    local l_v1400_12, l_v1401_11, l_l_aimtools_0_12, l_v1403_9, l_v1404_8, l_v1556_8, l_v1557_7, l_v1558_8, l_v1559_7, l_v1560_10, l_v1561_10, l_v1562_9, l_v1563_9, l_v1564_6, l_v1565_6 = v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563, v1564, v1565;
    l_v1563_9 = function()
        -- upvalues: l_v1560_10 (ref), l_l_aimtools_0_12 (ref), l_v1403_9 (ref), l_v1556_8 (ref), l_v1404_8 (ref), l_v1401_11 (ref), l_play_0 (ref), l_v1400_12 (ref)
        local v2779 = l_v1560_10:get_drag_position() + l_v1560_10:get_drag_size() / 2;
        local v2780 = ui.get_alpha();
        if v2780 > 0 then
            l_l_aimtools_0_12 = 1;
        end;
        if l_l_aimtools_0_12 <= 0 then
            return;
        else
            local v2781 = "";
            local l_l_v1403_9_0 = l_v1403_9;
            local v2783 = l_v1556_8 .. "t";
            local v2784 = l_v1404_8:clone();
            local v2785 = color(255, 255, 255, 128);
            if l_v1401_11 == 0 and v2780 > 0 then
                l_l_v1403_9_0 = "lc status";
                v2784 = color();
            end;
            v2785.a = v2785.a * l_l_aimtools_0_12;
            v2784.a = v2784.a * l_l_aimtools_0_12;
            local v2786 = l_play_0.measure_text(l_v1400_12, v2781, l_l_v1403_9_0);
            local v2787 = l_play_0.measure_text(l_v1400_12, v2781, v2783);
            v2779.y = v2779.y - (v2786.y + v2787.y + 1) / 2;
            local v2788 = v2779 + vector(-v2786.x * 0.5, 0);
            local v2789 = v2779 + vector(-v2787.x * 0.5, 0);
            v2789.y = v2789.y + (v2786.y + 1);
            l_play_0.text(l_v1400_12, v2788, v2784, v2781, l_l_v1403_9_0);
            l_play_0.text(l_v1400_12, v2789, v2785, v2781, v2783);
            l_v1401_11 = math.max(0, l_v1401_11 - globals.frametime);
            if l_v1401_11 == 0 then
                l_l_aimtools_0_12 = math.max(0, l_l_aimtools_0_12 - globals.frametime * 8);
            end;
            l_v1560_10();
            return;
        end;
    end;
    l_v1564_6 = function()
        -- upvalues: l_v1557_7 (ref), l_v1559_7 (ref), l_v1561_10 (ref), l_v1558_8 (ref), l_v1562_9 (ref), l_v1401_11 (ref), l_l_aimtools_0_12 (ref), l_v1404_8 (ref), l_v1403_9 (ref), l_v1556_8 (ref), v395 (ref)
        local v2790 = rage.exploit:get();
        local v2791 = v2790 - l_v1557_7;
        if v2791 > 0 then
            l_v1559_7 = true;
        end;
        if l_v1559_7 and v2791 < 0 then
            l_v1559_7 = false;
            if l_v1561_10() or l_v1558_8 > 0 then
                local v2792, v2793 = l_v1562_9(l_v1558_8);
                l_v1401_11 = 0.66;
                l_l_aimtools_0_12 = 1;
                l_v1404_8 = v2793;
                l_v1403_9 = v2792;
                l_v1556_8 = l_v1558_8;
            end;
        end;
        l_v1557_7 = v2790;
        l_v1558_8 = v395.defensive_ticks;
    end;
    l_v1565_6 = function(v2794)
        -- upvalues: l_v1563_9 (ref), l_v1564_6 (ref)
        events.render(l_v1563_9, v2794);
        events.createmove(l_v1564_6, v2794);
    end;
    v1566 = nil;
    v1567 = function(v2795)
        -- upvalues: l_v1565_6 (ref)
        l_v1565_6(v2795:get());
    end;
    v1399.enabled:set_callback(v1567, true);
end;
v1399 = nil;
v1400 = v384.visuals.velocity_warning;
v1401 = 0;
l_aimtools_0 = nil;
v1403 = l_play_0.screen_size();
v1404 = vector(130, 12);
v1556 = vector((v1403.x - v1404.x) / 2, v1403.y * 0.285);
l_aimtools_0 = v141.new("velocity_warning", v1556, v1404, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1403.x / 2, 0), 
            [3] = v1403.y
        }
    }, 
    border = {
        vector(v1403.x * 0.5, 0), 
        vector(v1403.x * 0.5, v1403.y)
    }
});
do
    local l_v1400_13, l_v1401_12, l_l_aimtools_0_13, l_v1403_10, l_v1404_9 = v1400, v1401, l_aimtools_0, v1403, v1404;
    l_v1403_10 = function()
        -- upvalues: l_l_aimtools_0_13 (ref), l_v1400_13 (ref), l_v1401_12 (ref), v32 (ref), v149 (ref), l_play_0 (ref)
        local v2801 = entity.get_local_player();
        if v2801 == nil then
            return;
        else
            local v2802 = l_l_aimtools_0_13:get_drag_position():clone();
            local v2803 = l_l_aimtools_0_13:get_drag_size();
            local v2804 = -globals.realtime;
            local v2805 = v2801:is_alive();
            local v2806 = ui.get_alpha() > 0;
            local v2807 = l_v1400_13.color_accent:get();
            local v2808 = l_v1400_13.color_secondary:get();
            local l_m_flVelocityModifier_0 = v2801.m_flVelocityModifier;
            if not v2805 then
                l_m_flVelocityModifier_0 = 1;
            end;
            local v2810 = v2806 or v2805 and l_m_flVelocityModifier_0 < 1;
            l_v1401_12 = v32.interp(l_v1401_12, v2810, 0.05);
            if l_v1401_12 > 0 then
                v2807.a = v2807.a * l_v1401_12;
                v2808.a = v2808.a * l_v1401_12;
                local v2811 = v149.gradient(string.format("%d%%", l_m_flVelocityModifier_0 * 100), v2804, v2807, v2808);
                local v2812 = 1;
                local v2813 = "";
                local v2814 = string.format("velocity inflicted ~ %s", v2811);
                local v2815 = l_play_0.measure_text(v2812, v2813, v2814);
                v2802.x = v2802.x + (v2803.x - v2815.x) / 2 + 1;
                l_play_0.text(v2812, v2802, v2807, v2813, v2814);
            end;
            l_l_aimtools_0_13();
            return;
        end;
    end;
    l_v1404_9 = function(v2816)
        -- upvalues: l_v1403_10 (ref)
        events.render(l_v1403_10, v2816);
    end;
    v1556 = nil;
    v1557 = function(v2817)
        -- upvalues: l_v1404_9 (ref)
        l_v1404_9(v2817:get());
    end;
    l_v1400_13.enabled:set_callback(v1557, true);
end;
v1400 = nil;
v1401 = v384.visuals.grenade_radius;
l_aimtools_0 = cvar.mp_friendlyfire;
v1403 = {};
v1404 = {};
do
    local l_v1401_13, l_l_aimtools_0_14, l_v1403_11, l_v1404_10, l_v1556_9, l_v1557_8, l_v1558_9, l_v1559_8, l_v1560_11 = v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560;
    l_v1556_9 = function(v2827)
        -- upvalues: l_l_aimtools_0_14 (ref)
        if l_l_aimtools_0_14:int() == 1 then
            return false;
        else
            local v2828 = entity.get_local_player();
            local l_m_hOwnerEntity_0 = v2827.m_hOwnerEntity;
            if l_m_hOwnerEntity_0 == nil or not l_m_hOwnerEntity_0:is_player() then
                return false;
            elseif v2828 == l_m_hOwnerEntity_0 or l_m_hOwnerEntity_0:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
    end;
    l_v1557_8 = function(v2830)
        for v2831 in pairs(v2830) do
            v2830[v2831] = nil;
        end;
    end;
    l_v1558_9 = function()
        -- upvalues: l_v1403_11 (ref)
        local v2832 = entity.get_entities("CSmokeGrenadeProjectile");
        local v2833 = {};
        for v2834 = 1, #v2832 do
            local v2835 = v2832[v2834];
            if v2835.m_bDidSmokeEffect then
                local v2836 = v2835:get_index();
                if l_v1403_11[v2836] == nil then
                    local v2837 = v2835:get_origin();
                    l_v1403_11[v2836] = {
                        radius = 125, 
                        alpha = 0, 
                        index = v2836, 
                        origin = v2837
                    };
                end;
                v2833[v2836] = true;
            end;
        end;
        for v2838 in pairs(l_v1403_11) do
            if v2833[v2838] == nil then
                l_v1403_11[v2838] = nil;
            end;
        end;
    end;
    l_v1559_8 = function()
        -- upvalues: l_v1404_10 (ref), l_v1556_9 (ref)
        local v2839 = entity.get_entities("CInferno");
        local v2840 = {};
        for v2841 = 1, #v2839 do
            local v2842 = v2839[v2841];
            local l_m_fireCount_0 = v2842.m_fireCount;
            if l_m_fireCount_0 ~= 0 then
                local v2844 = v2842:get_index();
                if l_v1404_10[v2844] == nil then
                    local v2845 = v2842:get_origin();
                    local v2846 = l_v1556_9(v2842);
                    l_v1404_10[v2844] = {
                        radius = 0, 
                        alpha = 0, 
                        fire_count = 0, 
                        index = v2844, 
                        origin = v2845, 
                        friendly = v2846
                    };
                end;
                local v2847 = l_v1404_10[v2844];
                if v2847.fire_count < l_m_fireCount_0 then
                    v2847.fire_count = l_m_fireCount_0;
                    local v2848 = 0;
                    local v2849 = nil;
                    local v2850 = nil;
                    local v2851 = {};
                    local v2852 = 0;
                    local _ = v2842:get_origin();
                    for v2854 = 0, l_m_fireCount_0 - 1 do
                        if v2842.m_bFireIsBurning[v2854] then
                            local v2855 = vector(v2842.m_fireXDelta[v2854], v2842.m_fireYDelta[v2854], v2842.m_fireZDelta[v2854]);
                            v2852 = v2852 + 1;
                            v2851[v2852] = v2855;
                        end;
                    end;
                    for v2856 = 1, v2852 do
                        for v2857 = 1, v2852 do
                            local v2858 = v2851[v2856];
                            local v2859 = v2851[v2857];
                            local v2860 = (v2859 - v2858):lengthsqr();
                            if v2848 < v2860 then
                                v2848 = v2860;
                                v2849 = v2858;
                                v2850 = v2859;
                            end;
                        end;
                    end;
                    if v2849 ~= nil and v2850 ~= nil then
                        v2847.radius = math.sqrt(v2848) / 2 + 40;
                    end;
                end;
                v2840[v2844] = true;
            end;
        end;
        for v2861 in pairs(l_v1404_10) do
            if v2840[v2861] == nil then
                l_v1404_10[v2861] = nil;
            end;
        end;
    end;
    l_v1560_11 = function()
        -- upvalues: l_v1401_13 (ref), l_v1403_11 (ref), l_play_0 (ref), l_v1404_10 (ref)
        local l_frametime_2 = globals.frametime;
        local v2863 = l_v1401_13.smoke_color:get();
        local v2864 = l_v1401_13.molotov_color:get();
        for _, v2866 in pairs(l_v1403_11) do
            v2866.alpha = math.min(v2866.alpha + l_frametime_2 * 4, 1);
            local v2867 = v2866.radius * v2866.alpha;
            l_play_0.circle_3d_outline(v2866.origin, v2863, v2867, 0, 1, 1);
        end;
        for _, v2869 in pairs(l_v1404_10) do
            v2869.alpha = math.min(v2869.alpha + l_frametime_2 * 4, 1);
            local v2870 = v2869.radius * v2869.alpha;
            l_play_0.circle_3d_outline(v2869.origin, v2864, v2870, 0, 1, 1);
            local v2871 = l_play_0.world_to_screen(v2869.origin);
            if v2871 ~= nil then
                if v2869.teammate then
                    l_play_0.text(1, v2871, color(149, 184, 6, 255), "c", "\226\156\148");
                else
                    l_play_0.text(1, v2871, color(230, 21, 21, 255), "c", "\226\157\140");
                end;
            end;
        end;
    end;
    v1561 = nil;
    v1562 = function(v2872)
        -- upvalues: l_v1557_8 (ref), l_v1403_11 (ref), l_v1558_9 (ref)
        local v2873 = v2872:get();
        if not v2873 then
            l_v1557_8(l_v1403_11);
        end;
        events.net_update_start(l_v1558_9, v2873);
    end;
    v1563 = function(v2874)
        -- upvalues: l_v1557_8 (ref), l_v1404_10 (ref), l_v1559_8 (ref)
        local v2875 = v2874:get();
        if not v2875 then
            l_v1557_8(l_v1404_10);
        end;
        events.net_update_start(l_v1559_8, v2875);
    end;
    do
        local l_v1562_10, l_v1563_10 = v1562, v1563;
        v1564 = function(v2878)
            -- upvalues: l_v1557_8 (ref), l_v1403_11 (ref), l_v1404_10 (ref), l_v1558_9 (ref), l_v1559_8 (ref), l_v1401_13 (ref), l_v1562_10 (ref), l_v1563_10 (ref), l_v1560_11 (ref)
            local v2879 = v2878:get();
            if not v2879 then
                l_v1557_8(l_v1403_11);
                l_v1557_8(l_v1404_10);
                events.net_update_start(l_v1558_9, false);
                events.net_update_start(l_v1559_8, false);
            end;
            if v2879 then
                l_v1401_13.smoke:set_callback(l_v1562_10, true);
                l_v1401_13.molotov:set_callback(l_v1563_10, true);
            else
                l_v1401_13.smoke:unset_callback(l_v1562_10);
                l_v1401_13.molotov:unset_callback(l_v1563_10);
            end;
            events.render(l_v1560_11, v2879);
        end;
        l_v1401_13.enabled:set_callback(v1564, true);
    end;
end;
v1401 = nil;
l_aimtools_0 = v384.visuals.gamesense_indicators;
v1403 = 380;
v1404 = 8;
v1556 = 24;
v1557 = 4;
v1558 = 3;
v1559 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1560 = {};
v1560.__index = v1560;
v1560.new = function(v2880, v2881, v2882)
    return setmetatable({
        id = v2881, 
        size = v2882
    }, v2880);
end;
v1560.draw = function(v2883, v2884, v2885, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.texture(v2883.id, v2884, v2883.size, v2885, ...);
end;
v1562 = {
    bomb_c4 = v1560:new(({
        bomb_c4 = l_play_0.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
    }).bomb_c4, vector(32, 29))
};
v1563 = {};
v1564 = 100;
v1565 = 0;
v1566 = 0;
v1567 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1568 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1569 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1570 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v1571 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
v1572 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v1573 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v1574 = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes");
v1575 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v1576 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v1578 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
local l_feature_list_0 = l_aimtools_0.feature_list;
local function v2889(v2887)
    local v2888 = v2887:get_override();
    if v2888 ~= nil then
        return v2888;
    else
        return v2887:get();
    end;
end;
local function v2892(v2890)
    -- upvalues: v788 (ref)
    local v2891 = v788.get(v2890);
    return v2891 ~= nil and v2891.active;
end;
do
    local l_l_aimtools_0_15, l_v1403_12, l_v1404_11, l_v1556_10, l_v1557_9, l_v1558_10, l_v1559_9, l_v1562_11, l_v1563_11, l_v1564_7, l_v1565_7, l_v1566_3, l_v1567_3, l_v1568_5, l_v1569_2, l_v1570_3, l_v1571_2, l_v1572_2, l_v1573_2, l_v1574_2, l_v1575_2, l_v1576_2, l_v1578_1, l_l_feature_list_0_0, l_v2889_0, l_v2892_0 = l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1562, v1563, v1564, v1565, v1566, v1567, v1568, v1569, v1570, v1571, v1572, v1573, v1574, v1575, v1576, v1578, l_feature_list_0, v2889, v2892;
    local function v2920()
        -- upvalues: l_v1563_11 (ref)
        for v2919 = 1, #l_v1563_11 do
            l_v1563_11[v2919] = nil;
        end;
    end;
    local function v2925(v2921)
        -- upvalues: l_play_0 (ref), l_v1559_9 (ref), l_v1557_9 (ref), l_v1563_11 (ref), l_v1403_12 (ref), l_v1404_11 (ref)
        local v2922 = l_play_0.measure_text(l_v1559_9, nil, v2921.text);
        local v2923 = l_play_0.screen_size();
        v2922.y = v2922.y + l_v1557_9 * 2;
        local v2924 = next(l_v1563_11) == nil and v2923.y - (v2923.y - l_v1403_12) / 2 or l_v1563_11[#l_v1563_11].offset - l_v1404_11 - v2922.y;
        v2921.offset = v2924;
        v2921.text_size = v2922;
        table.insert(l_v1563_11, v2921);
        return v2924;
    end;
    local function v2928(v2926, v2927, ...)
        -- upvalues: v2925 (ref)
        v2927 = table.concat({
            v2927, 
            ...
        });
        return v2925({
            text = v2927, 
            color = v2926
        });
    end;
    local function v2934(v2929, v2930)
        local v2931 = 0.5;
        local v2932 = 0.5;
        if v2930 > 0 then
            local v2933 = v2929 * v2931;
            if v2930 < (v2929 - v2933) * v2932 then
                v2933 = v2929 - v2930 * (1 / v2932);
            end;
            v2929 = v2933;
        end;
        return v2929;
    end;
    local function v2943(v2935, v2936)
        -- upvalues: v2934 (ref)
        local v2937 = 1;
        local v2938 = 500;
        local v2939 = v2938 * 3.5;
        local v2940 = (v2936:get_origin() - v2935:get_eye_position()):length();
        local v2941 = v2939 / 3;
        local v2942 = v2938 * math.exp(-v2940 * v2940 / (2 * v2941 * v2941)) * v2937;
        return v2934(v2942, v2935.m_ArmorValue);
    end;
    local function v2972(_)
        -- upvalues: l_v2892_0 (ref), l_v1572_2 (ref), l_v1573_2 (ref), l_v1574_2 (ref), l_v1578_1 (ref), l_v2889_0 (ref), l_v1575_2 (ref), l_v1576_2 (ref), v384 (ref), l_v1570_3 (ref), l_v1571_2 (ref), l_v1568_5 (ref), l_v1569_2 (ref), l_v1567_3 (ref), l_l_feature_list_0_0 (ref), v2928 (ref), v394 (ref), v395 (ref), l_v1564_7 (ref)
        local v2945 = l_v2892_0(l_v1572_2);
        local v2946 = l_v2892_0(l_v1573_2);
        local v2947 = l_v2892_0(l_v1574_2);
        local v2948 = l_v1578_1:get() > 0;
        local v2949 = l_v2889_0(l_v1575_2);
        local v2950 = l_v2889_0(l_v1576_2) or v384.antiaim.settings.freestanding.enabled:get();
        local v2951 = l_v2889_0(l_v1570_3) == "Force";
        local v2952 = l_v2889_0(l_v1571_2) == "Force";
        local v2953 = l_v2889_0(l_v1568_5) and not v2949;
        local v2954 = l_v2889_0(l_v1569_2) and not v2949 and not v2953;
        local v2955 = l_v2889_0(l_v1567_3);
        if v2948 and l_l_feature_list_0_0:get("Fake Latency") then
            local v2956 = utils.net_channel();
            if v2956 ~= nil then
                local v2957 = nil;
                local v2958 = l_v2889_0(l_v1578_1);
                local v2959 = math.clamp(v2956.latency[0] + v2956.latency[1], 0.001, 0.2);
                local v2960 = math.clamp(v2958 * 0.001 + v2956.avg_latency[1], 0.001, 0.2);
                local v2961 = math.clamp(v2959 / v2960, 0, 1);
                if v2961 < 0.5 then
                    v2957 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v2961 * 2);
                else
                    v2957 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v2961 - 0.5) * 2);
                end;
                v2928(v2957, "PING");
            end;
        end;
        if v2954 and l_l_feature_list_0_0:get("Hide Shots") then
            v2928(color(255, 255, 255, 200), "OSAA");
        end;
        if v2953 and l_l_feature_list_0_0:get("Double Tap") then
            local v2962 = color(255, 0, 50, 255);
            if rage.exploit:get() == 1 then
                v2962 = color(255, 255, 255, 200);
            end;
            v2928(v2962, "DT");
        end;
        if v2955 and l_l_feature_list_0_0:get("Dormant Aimbot") then
            v2928(color(255, 255, 255, 200), "DA");
        end;
        if v2949 and l_l_feature_list_0_0:get("Fake Duck") then
            v2928(color(255, 255, 255, 200), "DUCK");
        end;
        if v2952 and l_l_feature_list_0_0:get("Safe Points") then
            v2928(color(255, 255, 255, 200), "SAFE");
        end;
        if v2951 and l_l_feature_list_0_0:get("Body Aim") then
            v2928(color(255, 255, 255, 200), "BODY");
        end;
        if v2945 and l_l_feature_list_0_0:get("Damage Override") then
            v2928(color(255, 255, 255, 200), "MD");
        end;
        if v2946 and l_l_feature_list_0_0:get("Hitchance Override") then
            v2928(color(255, 255, 255, 200), "HITCHANCE OVR");
        end;
        if v2947 and l_l_feature_list_0_0:get("Hitbox Override") then
            v2928(color(255, 255, 255, 200), "HITBOX OVR");
        end;
        if v2950 and l_l_feature_list_0_0:get("Freestanding") then
            v2928(color(255, 255, 255, 200), "FS");
        end;
        if not v394.is_onground and l_l_feature_list_0_0:get("Lag Compensation") then
            local v2963 = 255;
            local v2964 = 0;
            local v2965 = 50;
            local v2966 = 255;
            if v395.defensive_ticks > 0 or v395.teleport_units_sqr > 4096 then
                local v2967 = 255;
                local v2968 = 255;
                local v2969 = 255;
                v2966 = 200;
                v2965 = v2969;
                v2964 = v2968;
                v2963 = v2967;
            end;
            v2928(color(v2963, v2964, v2965, v2966), "LC");
        end;
        if l_l_feature_list_0_0:get("Fake Angles") then
            local v2970 = rage.antiaim:get_max_desync();
            local v2971 = color(196, 15, 15):lerp(color(132, 196, 20), v2970 / 58);
            v2928(v2971, "FAKE");
        end;
        if l_l_feature_list_0_0:get("Hit/Miss") then
            v2928(color(255, 255, 255, 200), l_v1564_7 .. "%");
        end;
    end;
    local function v2982(v2973, v2974)
        -- upvalues: v2925 (ref), l_v1562_11 (ref)
        local v2975 = v2974:get_player_weapon();
        if v2975 == nil then
            return;
        elseif not v2975.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v2975.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v2977 = v2974:get_origin();
                local l_m_bombsiteCenterA_0 = v2973.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v2973.m_bombsiteCenterB;
                local v2980 = v2977:distsqr(l_m_bombsiteCenterA_0) < v2977:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v2981 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v2925({
                    text = v2980, 
                    color = color(252, 243, 105, 255), 
                    progress = 1 - v2981, 
                    draw_cmd = l_v1562_11.bomb_c4
                });
                return;
            end;
        end;
    end;
    local function v2997(v2983, v2984)
        -- upvalues: l_play_0 (ref), v2925 (ref), l_v1562_11 (ref), v2943 (ref), v2928 (ref)
        local l_m_bBombDefused_0 = v2984.m_bBombDefused;
        if not v2984.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local l_m_flC4Blow_0 = v2984.m_flC4Blow;
            local v2988 = l_m_flC4Blow_0 - l_curtime_0;
            if v2988 > 0 then
                if v2984.m_hBombDefuser ~= nil then
                    local v2989 = l_play_0.screen_size();
                    local l_m_flDefuseCountDown_0 = v2984.m_flDefuseCountDown;
                    local v2991 = (l_m_flDefuseCountDown_0 - l_curtime_0) / 10;
                    local v2992 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v2993 = (v2989.y - 2) * (1 - v2991);
                    l_play_0.rect(vector(0, 0), vector(20, v2989.y), color(0, 0, 0, 115));
                    l_play_0.rect(vector(1, 1 + v2993), vector(19, v2989.y - 1), v2992);
                end;
                local v2994 = string.format("%s - %.1fs", v2984.m_nBombSite == 1 and "B" or "A", v2988);
                v2925({
                    text = v2994, 
                    color = color(255, 255, 255, 200), 
                    draw_cmd = l_v1562_11.bomb_c4
                });
            end;
            local l_m_iHealth_6 = v2983.m_iHealth;
            local v2996 = v2943(v2983, v2984);
            v2996 = math.floor(v2996);
            if l_m_iHealth_6 <= v2996 then
                v2928(color(255, 0, 50, 255), "FATAL");
            elseif v2996 > 0 then
                v2928(color(252, 243, 105, 255), string.format("-%d HP", v2996));
            end;
            return;
        end;
    end;
    local function v3005(v2998)
        -- upvalues: v2982 (ref), v2997 (ref)
        local v2999 = entity.get_game_rules();
        if v2999 == nil then
            return;
        else
            local v3000 = entity.get_player_resource();
            if v3000 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v2999.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v3000.m_iPlayerC4;
                if l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v3003 = entity.get(l_m_iPlayerC4_0);
                    if v3003 ~= nil then
                        v2982(v3000, v3003);
                    end;
                end;
                if l_m_bBombPlanted_0 then
                    local v3004 = entity.get_entities("CPlantedC4")[1];
                    if v3004 ~= nil then
                        v2997(v2998, v3004);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v3007()
        -- upvalues: v2972 (ref), l_l_feature_list_0_0 (ref), v3005 (ref)
        local v3006 = entity.get_local_player();
        if v3006 == nil then
            return;
        else
            if v3006:is_alive() then
                v2972(v3006);
            end;
            if l_l_feature_list_0_0:get("Bomb Info") then
                v3005(v3006);
            end;
            return;
        end;
    end;
    local function v3013(v3008, v3009)
        -- upvalues: l_play_0 (ref)
        local v3010 = (v3008 + v3009) / 2;
        local v3011 = color(0, 0, 0, 0);
        local v3012 = color(0, 0, 0, 50);
        l_play_0.gradient(v3008, vector(v3010.x, v3009.y), v3011, v3012, v3011, v3012);
        l_play_0.gradient(v3009, vector(v3010.x, v3008.y), v3011, v3012, v3011, v3012);
    end;
    local function v3020(v3014, v3015, v3016, v3017, v3018, v3019)
        -- upvalues: l_play_0 (ref)
        l_play_0.circle_outline(v3014, color(0, 0, 0, 255), v3016, v3017, 1, v3019);
        l_play_0.circle_outline(v3014, v3015, v3016 - 1, v3017, v3018, v3019 - 2);
    end;
    local function v3034()
        -- upvalues: l_v1563_11 (ref), l_v1558_10 (ref), l_v1556_10 (ref), l_v1557_9 (ref), v3013 (ref), l_play_0 (ref), l_v1559_9 (ref), v3020 (ref)
        for v3021 = 1, #l_v1563_11 do
            local v3022 = l_v1563_11[v3021];
            if v3022.color ~= nil then
                local v3023 = vector(l_v1558_10, v3022.offset);
                local v3024 = v3023 + vector(l_v1556_10, l_v1557_9);
                local v3025 = v3022.text_size + vector(50);
                local l_color_1 = v3022.color;
                local l_draw_cmd_0 = v3022.draw_cmd;
                local l_progress_0 = v3022.progress;
                v3024.y = v3024.y + 2;
                if l_draw_cmd_0 ~= nil then
                    v3025.x = v3025.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_progress_0 ~= nil then
                    v3025.x = v3025.x + 30;
                end;
                v3013(v3023, v3023 + v3025);
                if l_draw_cmd_0 ~= nil then
                    local v3029 = v3023:clone();
                    v3029.x = v3029.x + l_v1556_10;
                    v3029.y = v3029.y + (v3025.y - l_draw_cmd_0.size.y) / 2;
                    l_draw_cmd_0:draw(v3029, l_color_1, "f");
                    v3024.x = v3024.x + l_draw_cmd_0.size.x + 5;
                end;
                l_play_0.text(l_v1559_9, v3024 + 1, color(0, 0, 0, 128), "", v3022.text);
                l_play_0.text(l_v1559_9, v3024, l_color_1, "", v3022.text);
                v3024.x = v3024.x + v3022.text_size.x;
                if l_progress_0 ~= nil then
                    local v3030 = v3024.x + 10 / 2 + 12;
                    local v3031 = v3023.y + v3025.y / 2;
                    local v3032 = vector(v3030, v3031);
                    local v3033 = color(255, 255, 255, 200);
                    v3020(v3032, v3033, 10, 0, l_progress_0, 5);
                end;
            end;
        end;
    end;
    local function v3042()
        -- upvalues: l_play_0 (ref)
        local v3035 = entity.get_local_player();
        if v3035 == nil then
            return;
        else
            local v3036 = v3035:get_spectators();
            if v3036 == nil then
                return;
            else
                local v3037 = l_play_0.screen_size();
                local v3038 = vector(v3037.x - 10, 5);
                for v3039 = 1, #v3036 do
                    local v3040 = v3036[v3039]:get_name();
                    local v3041 = color(255, 255, 255, 200);
                    l_play_0.text(1, v3038, v3041, "r", v3040);
                    v3038.y = v3038.y + 18;
                end;
                return;
            end;
        end;
    end;
    local function v3043()
        -- upvalues: v3007 (ref), v3034 (ref), v2920 (ref)
        if globals.is_in_game then
            v3007();
            v3034();
        end;
        v2920();
    end;
    local function v3045(v3044)
        -- upvalues: l_v1566_3 (ref), l_v1565_7 (ref), l_v1564_7 (ref)
        if v3044.state == "death" or not (v3044.state ~= "player death") or v3044.state == "unregistered shot" then
            return;
        else
            l_v1566_3 = l_v1566_3 + 1;
            if v3044.state == nil then
                l_v1565_7 = l_v1565_7 + 1;
            end;
            l_v1564_7 = math.floor(l_v1565_7 / math.max(1, l_v1566_3) * 100);
            return;
        end;
    end;
    local function v3047(v3046)
        -- upvalues: v3043 (ref), v3045 (ref)
        events.render(v3043, v3046);
        events.aim_ack(v3045, v3046);
    end;
    local _ = nil;
    local function v3050(v3049)
        -- upvalues: v3042 (ref)
        events.render(v3042, v3049:get());
    end;
    do
        local l_v3050_0 = v3050;
        local function v3054(v3052)
            -- upvalues: v3042 (ref), l_l_aimtools_0_15 (ref), l_v3050_0 (ref), v3047 (ref)
            local v3053 = v3052:get();
            if not v3053 then
                events.render(v3042, false);
            end;
            if v3053 then
                l_l_aimtools_0_15.spectator_list:set_callback(l_v3050_0, true);
            else
                l_l_aimtools_0_15.spectator_list:unset_callback(l_v3050_0);
            end;
            v3047(v3053);
        end;
        l_l_aimtools_0_15.enabled:set_callback(v3054, true);
    end;
end;
l_aimtools_0 = nil;
v1403 = v384.visuals.static_watermark;
v1404 = v384.visuals.watermark;
v1556 = v384.visuals.indicators;
v1557 = v384.visuals.solus_ui;
v1558 = {};
v1559 = 0;
do
    local l_v1559_10, l_v1560_12, l_v1561_11 = v1559, v1560, v1561;
    l_v1560_12 = function()
        -- upvalues: l_v1559_10 (ref)
        if l_v1559_10 <= 0 then
            return;
        else
            local v3058 = globals.frametime * 1.66;
            l_v1559_10 = math.max(0, l_v1559_10 - v3058);
            return;
        end;
    end;
    l_v1561_11 = function()
        -- upvalues: l_play_0 (ref), v13 (ref), l_v1559_10 (ref)
        local v3059 = l_play_0.screen_size();
        local v3060 = vector(v3059.x * 0.5, v3059.y - 18);
        local v3061 = 4;
        local v3062 = "";
        local l_name_5 = v13.name;
        local v3064 = l_play_0.measure_text(v3061, v3062, l_name_5);
        local v3065 = color(255, 255, 255, 255);
        v3060.x = v3060.x - v3064.x * 0.5;
        v3060.y = v3060.y - v3064.y;
        l_play_0.text(v3061, v3060, v3065, v3062, l_name_5);
        if l_v1559_10 > 0 then
            local v3066 = "";
            local v3067 = 5;
            local v3068 = "\194\168\203\156\226\128\157*\194\176\226\128\162";
            local v3069 = "\226\128\162\194\176*\226\128\157\203\156\194\168";
            local v3070 = l_play_0.measure_text(v3061, v3066, v3068);
            local v3071 = vector(v3060.x - v3070.x - v3067, v3060.y);
            local v3072 = vector(v3060.x + v3064.x + v3067, v3060.y);
            local v3073 = v3065:clone();
            v3073.a = v3073.a * l_v1559_10;
            l_play_0.text(v3061, v3071, v3073, v3066, v3068);
            l_play_0.text(v3061, v3072, v3073, v3066, v3069);
        end;
    end;
    v1558.on_render = function()
        -- upvalues: l_v1560_12 (ref), l_v1561_11 (ref)
        l_v1560_12();
        l_v1561_11();
    end;
    v1558.on_player_death = function(v3074)
        -- upvalues: l_v1559_10 (ref)
        local v3075 = entity.get_local_player();
        local v3076 = entity.get(v3074.userid, true);
        if entity.get(v3074.attacker, true) ~= v3075 or v3076 == v3075 then
            return;
        else
            l_v1559_10 = 1;
            return;
        end;
    end;
end;
v1559 = {};
v1560 = 4;
v1561 = function(v3077, v3078)
    return v3077:gsub(".", "%1" .. v3078, #v3077 - 1);
end;
do
    local l_v1403_13, l_v1404_12, l_v1556_11, l_v1557_10, l_v1558_11, l_v1559_11, l_v1560_13 = v1403, v1404, v1556, v1557, v1558, v1559, v1560;
    do
        local l_l_v1560_13_0, l_v1561_12, l_v1562_12, l_v1563_12 = l_v1560_13, v1561, v1562, v1563;
        l_v1562_12 = function()
            -- upvalues: l_v1403_13 (ref), l_v1561_12 (ref), v149 (ref)
            local v3090 = "";
            local v3091 = "ANGEL";
            local v3092 = "WINGS";
            if not l_v1403_13.remove_spaces:get() then
                v3090 = " ";
                v3091 = l_v1561_12(v3091, v3090);
                v3092 = l_v1561_12(v3092, v3090);
            end;
            return v3091 .. v3090 .. v149.gradient(v3092, -globals.realtime, color(255, 255, 255, 255), color(55, 55, 55, 255));
        end;
        l_v1563_12 = function()
            -- upvalues: v13 (ref)
            return string.format("[%s]", v13.build:upper());
        end;
        l_v1559_11.on_render = function()
            -- upvalues: l_play_0 (ref), l_v1403_13 (ref), l_v1562_12 (ref), l_v1563_12 (ref), l_l_v1560_13_0 (ref)
            local v3093 = 1;
            local v3094 = "";
            local v3095 = l_play_0.screen_size();
            local v3096 = l_v1403_13.color:get();
            local v3097 = l_v1403_13.position:get();
            local v3098 = l_v1562_12();
            local v3099 = l_v1563_12();
            local v3100 = l_play_0.measure_text(v3093, v3094, v3098);
            local v3101 = l_play_0.measure_text(v3093, v3094, v3099);
            if v3097 == "Bottom" then
                local v3102 = vector(v3095.x * 0.5, v3095.y - 14);
                local v3103 = v3102 - vector(v3100.x * 0.5, v3100.y);
                v3102.y = v3102.y - v3100.y;
                v3102.y = v3102.y - l_l_v1560_13_0;
                local v3104 = v3102 - vector(v3101.x * 0.5, v3101.y);
                l_play_0.text(v3093, v3103, v3096, v3094, v3098);
                l_play_0.text(v3093, v3104, color(200, 69, 69), v3094, v3099);
                return;
            else
                local v3105 = vector(20, v3095.y * 0.5);
                local v3106 = v3100.x + v3101.x + l_l_v1560_13_0;
                local v3107 = math.max(v3100.y, v3101.y);
                if v3097 == "Right" then
                    v3105.x = v3095.x - v3105.x;
                    v3105.x = v3105.x - v3106 + 1;
                end;
                v3105.y = v3105.y - v3107 * 0.5;
                local v3108 = v3105:clone();
                local v3109 = v3105:clone();
                v3109.x = v3109.x + v3100.x;
                v3109.x = v3109.x + l_l_v1560_13_0;
                l_play_0.text(v3093, v3108, v3096, v3094, v3098);
                l_play_0.text(v3093, v3109, color(200, 69, 69), v3094, v3099);
                return;
            end;
        end;
    end;
    l_v1560_13 = function(v3110)
        -- upvalues: l_v1558_11 (ref), l_v1559_11 (ref)
        local v3111 = v3110 == 1;
        local v3112 = v3110 == 2;
        events.render(l_v1558_11.on_render, v3111);
        events.render(l_v1559_11.on_render, v3112);
        events.player_death(l_v1558_11.on_player_death, v3111);
    end;
    v1561 = nil;
    v1562 = function(v3113)
        -- upvalues: l_v1403_13 (ref), l_v1560_13 (ref)
        local v3114 = v3113:get();
        local v3115 = v3114 == 2;
        l_v1403_13.remove_spaces:visibility(v3115);
        l_v1403_13.position:visibility(v3115);
        l_v1403_13.color:visibility(v3115);
        l_v1560_13(v3114);
    end;
    do
        local l_v1562_13 = v1562;
        v1563 = function()
            -- upvalues: l_v1404_12 (ref), l_v1556_11 (ref), l_v1557_10 (ref), l_v1560_13 (ref), l_v1403_13 (ref), l_v1562_13 (ref)
            local v3117 = l_v1404_12.enabled:get() or l_v1556_11.enabled:get();
            local v3118 = l_v1557_10.enabled:get() and l_v1557_10.select:get("Watermark");
            local v3119 = v3117 or v3118;
            if v3119 then
                l_v1560_13(nil);
            end;
            if not v3119 then
                l_v1403_13.style:set_callback(l_v1562_13, true);
            else
                l_v1403_13.style:unset_callback(l_v1562_13);
            end;
        end;
        l_v1556_11.enabled:set_callback(v1563);
        l_v1404_12.enabled:set_callback(v1563);
        l_v1557_10.enabled:set_callback(v1563);
        l_v1557_10.select:set_callback(v1563);
        v1563();
    end;
end;
v909 = nil;
v910 = nil;
v911 = v384.misc.clantag;
v912 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
v913 = 0;
l_match_0 = {
    [1] = "", 
    [2] = "a", 
    [3] = "an", 
    [4] = "ang", 
    [5] = "ange", 
    [6] = "angel", 
    [7] = "angelw", 
    [8] = "angelwi", 
    [9] = "angelwin", 
    [10] = "angelwing", 
    [11] = "angelwings", 
    [12] = "angelwings", 
    [13] = "angelwings", 
    [14] = "angelwings", 
    [15] = "angelwings", 
    [16] = "angelwings", 
    [17] = "angelwings", 
    [18] = "angelwings", 
    [19] = "angelwings", 
    [20] = "angelwings", 
    [21] = "angelwings", 
    [22] = "angelwings", 
    [23] = "angelwings", 
    [24] = "ngelwings", 
    [25] = "gelwings", 
    [26] = "elwings", 
    [27] = "lwings", 
    [28] = "wings", 
    [29] = "ings", 
    [30] = "ngs", 
    [31] = "gs", 
    [32] = "s", 
    [33] = ""
};
l_angles_0 = function()
    -- upvalues: v12 (ref)
    return v12(globals.curtime * 4);
end;
do
    local l_v912_8, l_v913_10, l_l_match_0_10, l_l_angles_0_10, l_v1003_11 = v912, v913, l_match_0, l_angles_0, v1003;
    l_v1003_11 = function()
        -- upvalues: l_l_angles_0_10 (ref), l_l_match_0_10 (ref), l_v913_10 (ref)
        if not globals.is_in_game then
            return;
        else
            local v3125 = l_l_angles_0_10() % #l_l_match_0_10 + 1;
            if l_v913_10 ~= v3125 then
                l_v913_10 = v3125;
                common.set_clan_tag(l_l_match_0_10[v3125] or "");
            end;
            return;
        end;
    end;
    v1013 = nil;
    v1399 = function(v3126)
        -- upvalues: l_v912_8 (ref), l_v1003_11 (ref)
        local v3127 = v3126:get();
        if not v3127 then
            common.set_clan_tag("");
        end;
        local l_l_v912_8_0 = l_v912_8;
        local l_l_l_v912_8_0_0 = l_l_v912_8_0;
        l_l_v912_8_0 = l_l_v912_8_0.override;
        if v3127 then

        end;
        l_l_v912_8_0(l_l_l_v912_8_0_0, nil);
        events.net_update_end(l_v1003_11, v3127);
    end;
    v911.enabled:set_callback(v1399, true);
end;
v911 = nil;
v912 = v384.misc.trashtalk;
v913 = 0;
l_match_0 = {};
l_angles_0 = "https://cdn.hysteria.one/angelwings/trashtalk.txt";
do
    local l_v913_11, l_l_match_0_11, l_l_angles_0_11 = v913, l_match_0, l_angles_0;
    v1003 = function(v3133)
        -- upvalues: l_l_match_0_11 (ref)
        if not v3133 or string.find(v3133, "404") then
            return;
        else
            local v3134 = 0;
            for v3135 in string.gmatch(v3133, "(.-)\n") do
                v3134 = v3134 + 1;
                l_l_match_0_11[v3134] = v3135;
            end;
            return;
        end;
    end;
    network.get(l_l_angles_0_11, nil, v1003);
    l_l_angles_0_11 = function(v3136)
        -- upvalues: l_l_match_0_11 (ref), l_v913_11 (ref)
        local v3137 = entity.get_local_player();
        local v3138 = entity.get(v3136.userid, true);
        if entity.get(v3136.attacker, true) ~= v3137 or v3138 == v3137 then
            return;
        else
            local v3139 = #l_l_match_0_11;
            local v3140 = math.random(1, v3139);
            if v3140 == l_v913_11 then
                v3140 = v3140 + 1;
                if v3140 == v3139 then
                    v3140 = 1;
                end;
            end;
            utils.console_exec("say " .. l_l_match_0_11[v3140]);
            l_v913_11 = v3140;
            return;
        end;
    end;
    v1003 = nil;
    v1013 = function(v3141)
        -- upvalues: l_l_angles_0_11 (ref)
        events.player_death(l_l_angles_0_11, v3141:get());
    end;
    v912.enabled:set_callback(v1013, true);
end;
v912 = nil;
v913 = v384.misc.fast_ladder;
l_match_0 = 9;
do
    local l_l_match_0_12, l_l_angles_0_12 = l_match_0, l_angles_0;
    l_l_angles_0_12 = function(v3144)
        -- upvalues: l_l_match_0_12 (ref), l_play_0 (ref), v12 (ref)
        local v3145 = entity.get_local_player();
        if v3145 == nil then
            return;
        elseif v3145.m_MoveType ~= l_l_match_0_12 then
            return;
        else
            local v3146 = l_play_0.camera_angles();
            v3144.view_angles.y = v12(v3144.view_angles.y);
            v3144.view_angles.z = 0;
            if v3144.forwardmove > 0 and v3146.x < 45 then
                v3144.view_angles.x = 89;
                v3144.in_moveright = 1;
                v3144.in_moveleft = 0;
                v3144.in_forward = 0;
                v3144.in_back = 1;
                if v3144.sidemove == 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 90;
                end;
                if v3144.sidemove < 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 150;
                end;
                if v3144.sidemove > 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 30;
                end;
            elseif v3144.forwardmove < 0 then
                v3144.view_angles.x = 89;
                v3144.in_moveleft = 1;
                v3144.in_moveright = 0;
                v3144.in_forward = 1;
                v3144.in_back = 0;
                if v3144.sidemove == 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 90;
                end;
                if v3144.sidemove > 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 150;
                end;
                if v3144.sidemove < 0 then
                    v3144.view_angles.y = v3144.view_angles.y + 30;
                end;
            end;
            return;
        end;
    end;
    v1003 = nil;
    v1013 = function(v3147)
        -- upvalues: l_l_angles_0_12 (ref)
        events.createmove(l_l_angles_0_12, v3147:get());
    end;
    v913.enabled:set_callback(v1013, true);
end;
v913 = nil;
l_match_0 = v384.misc.edge_stop;
l_angles_0 = function(v3148)
    local v3149 = entity.get_local_player();
    if v3149 == nil then
        return;
    else
        local v3150 = v3149:simulate_movement();
        v3150:think(5);
        if v3150.velocity.z < 0 then
            v3148.block_movement = 2;
        end;
        return;
    end;
end;
v1003 = nil;
do
    local l_l_angles_0_13 = l_angles_0;
    v1013 = function(v3152)
        -- upvalues: l_l_angles_0_13 (ref)
        events.createmove(l_l_angles_0_13, v3152:get());
    end;
    l_match_0.enabled:set_callback(v1013, true);
end;
l_match_0 = nil;
l_angles_0 = v384.misc.collision_air_duck;
v1003 = function(v3153)
    local v3154 = entity.get_local_player();
    if v3154 == nil then
        return;
    else
        local l_m_fFlags_1 = v3154.m_fFlags;
        if bit.band(l_m_fFlags_1, 1) ~= 0 then
            return;
        elseif v3153.in_duck then
            return;
        else
            local v3156 = false;
            local v3157 = v3154:simulate_movement();
            v3153.in_duck = true;
            v3157:think(1);
            v3156 = bit.band(v3157.flags, 1) == 0 and v3157.did_hit_collision;
            v3157 = false;
            local v3158 = v3154:simulate_movement();
            v3153.in_duck = false;
            v3158:think(1);
            v3157 = bit.band(v3158.flags, 1) == 0 and v3158.did_hit_collision;
            if not v3156 and v3157 then
                v3153.in_duck = true;
            end;
            return;
        end;
    end;
end;
v1013 = nil;
do
    local l_v1003_12 = v1003;
    v1399 = function(v3160)
        -- upvalues: l_v1003_12 (ref)
        events.createmove(l_v1003_12, v3160:get());
    end;
    l_angles_0.enabled:set_callback(v1399, true);
end;
l_angles_0 = nil;
v1003 = v384.misc.no_fall_damage;
v1013 = false;
v1399 = function(v3161, v3162)
    local v3163 = v3161:get_origin();
    for v3164 = 0, math.pi * 2, math.pi * 2 / 8 do
        local v3165 = math.sin(v3164);
        local v3166 = math.cos(v3164);
        local v3167 = v3163 + vector(10 * v3166, 10 * v3165, 0);
        local v3168 = v3167 - vector(0, 0, v3162);
        if utils.trace_line(v3167, v3168, v3161).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v1013_13, l_v1399_11, l_v1400_14 = v1013, v1399, v1400;
    l_v1400_14 = function(v3172)
        -- upvalues: l_v1013_13 (ref), l_v1399_11 (ref)
        local v3173 = entity.get_local_player();
        if v3173 == nil then
            return;
        else
            if v3173.m_vecVelocity.z >= -500 then
                l_v1013_13 = false;
            elseif l_v1399_11(v3173, 15) then
                l_v1013_13 = false;
            elseif l_v1399_11(v3173, 75) then
                l_v1013_13 = true;
            end;
            if v3173.m_vecVelocity.z < -500 then
                v3172.in_duck = l_v1013_13;
            end;
            return;
        end;
    end;
    v1401 = nil;
    l_aimtools_0 = function(v3174)
        -- upvalues: l_v1400_14 (ref)
        events.createmove(l_v1400_14, v3174:get());
    end;
    v1003.enabled:set_callback(l_aimtools_0, true);
end;
v1003 = nil;
v1013 = v384.misc.super_toss;
v1399 = 0.3;
v1400 = function(v3175, v3176, v3177)
    if math.abs(v3175.x) > math.abs(v3175.y) then
        local v3178 = v3175.y / v3175.x;
        local v3179 = 1 + v3178 * v3178;
        local v3180 = -2 * v3176.x - 2 * v3178 * v3176.y;
        local v3181 = v3176:length2dsqr() - v3177 * v3177;
        local v3182 = v3180 * v3180 - 4 * v3179 * v3181;
        if v3182 < 0 then
            return v3176 + (v3175 * v3176:dot(v3175) - v3176):normalized() * v3177;
        elseif v3182 < 0.001 then
            local v3183 = -v3180 / (2 * v3179);
            local v3184 = v3178 * v3183;
            return vector(v3183, v3184);
        else
            local v3185 = math.sqrt(v3182);
            local v3186 = (-v3180 + v3185) / (2 * v3179);
            local v3187 = v3178 * v3186;
            local v3188 = vector(v3186, v3187);
            v3186 = (-v3180 - v3185) / (2 * v3179);
            v3187 = v3178 * v3186;
            local v3189 = vector(v3186, v3187);
            if v3175:dot(v3188) > v3175:dot(v3189) then
                return v3188;
            else
                return v3189;
            end;
        end;
    else
        local v3190 = v3175.x / v3175.y;
        local v3191 = 1 + v3190 * v3190;
        local v3192 = -2 * v3176.y - 2 * v3190 * v3176.x;
        local v3193 = v3176:length2dsqr() - v3177 * v3177;
        local v3194 = v3192 * v3192 - 4 * v3191 * v3193;
        if v3194 < 0 then
            return v3176 + (v3175 * v3176:dot(v3175) - v3176):normalized() * v3177;
        elseif v3194 < 0.001 then
            local v3195 = -v3192 / (2 * v3191);
            local v3196 = v3190 * v3195;
            return vector(v3196, v3195);
        else
            local v3197 = math.sqrt(v3194);
            local v3198 = (-v3192 + v3197) / (2 * v3191);
            local v3199 = v3190 * v3198;
            local v3200 = vector(v3199, v3198);
            v3198 = (-v3192 - v3197) / (2 * v3191);
            v3199 = v3190 * v3198;
            local v3201 = vector(v3199, v3198);
            if v3175:dot(v3200) > v3175:dot(v3201) then
                return v3200;
            else
                return v3201;
            end;
        end;
    end;
end;
do
    local l_v1399_12, l_v1400_15, l_v1401_14, l_l_aimtools_0_16, l_v1403_14, l_v1404_13 = v1399, v1400, v1401, l_aimtools_0, v1403, v1404;
    l_v1401_14 = function(v3208, v3209, v3210, v3211)
        -- upvalues: v14 (ref), l_v1399_12 (ref), l_v1400_15 (ref)
        local v3212 = vector():angles(v3208);
        local v3213 = vector():angles(v3208.x - (90 - math.abs(v3208.x)) * 10 / 90, v3208.y);
        local v3214 = v3213:dot(v3212) / v3212:length();
        local v3215 = math.clamp(v3210 * 0.9, 15, 750);
        local v3216 = math.clamp(v3211, 0, 1);
        v3215 = v3215 * v14.lerp(l_v1399_12, 1, v3216);
        v3208.y = (l_v1400_15(v3213, v3209 * 1.25, v3215 * v3214) - v3209 * 1.25):angles().y;
        v3208.x = math.clamp(v3208.x + math.clamp(v3209.z * 0.1, -20, 20), -89, 89);
    end;
    l_l_aimtools_0_16 = function(v3217, v3218)
        local v3219 = math.rad(v3218);
        local v3220 = math.cos(v3219);
        local v3221 = math.sin(v3219);
        local v3222 = v3220 * v3217.forwardmove + v3221 * v3217.sidemove;
        local v3223 = v3221 * v3217.forwardmove + v3220 * v3217.sidemove;
        v3217.forwardmove = v3222;
        v3217.sidemove = v3223;
    end;
    l_v1403_14 = function(v3224)
        -- upvalues: l_play_0 (ref), l_v1401_14 (ref), l_l_aimtools_0_16 (ref)
        local v3225 = entity.get_local_player();
        if v3225 == nil then
            return;
        else
            local v3226 = v3225:get_player_weapon();
            if v3226 == nil then
                return;
            else
                local v3227 = v3226:get_weapon_info();
                if v3227 == nil or v3227.weapon_type ~= 9 then
                    return;
                elseif v3226.m_fThrowTime == 0 then
                    return;
                else
                    if v3226.m_fThrowTime > 0 and not v3226.m_bPinPulled then
                        v3224.in_speed = true;
                    end;
                    if v3225.m_nTickBase * globals.tickinterval < v3226.m_fThrowTime and rage.exploit:get() ~= 1 then
                        return;
                    else
                        local l_view_angles_0 = v3224.view_angles;
                        local l_y_4 = l_view_angles_0.y;
                        local v3230 = l_play_0.camera_angles();
                        if v3230.x ~= l_view_angles_0.x or v3230.y ~= l_view_angles_0.y then
                            return;
                        else
                            l_v1401_14(l_view_angles_0, v3225.m_vecVelocity, v3227.throw_velocity, v3226.m_flThrowStrength);
                            l_l_aimtools_0_16(v3224, math.normalize_yaw(l_y_4 - l_view_angles_0.y));
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    l_v1404_13 = function(v3231)
        -- upvalues: l_v1401_14 (ref)
        local v3232 = entity.get_local_player();
        if v3232 == nil then
            return;
        else
            local v3233 = v3232:get_player_weapon();
            if v3233 == nil then
                return;
            else
                local v3234 = v3233:get_weapon_info();
                if v3234 ~= nil and v3234.weapon_type == 9 then
                    l_v1401_14(v3231.angles, v3231.velocity, v3234.throw_velocity, v3233.m_flThrowStrength);
                end;
                return;
            end;
        end;
    end;
    v1556 = nil;
    v1557 = function(v3235)
        -- upvalues: l_v1403_14 (ref), l_v1404_13 (ref)
        local v3236 = v3235:get();
        events.createmove(l_v1403_14, v3236);
        events.grenade_override_view(l_v1404_13, v3236);
    end;
    v1013.enabled:set_callback(v1557, true);
end;
v1013 = nil;
v1399 = v384.misc.grenade_release;
v1400 = nil;
do
    local l_v1399_13, l_v1400_16, l_v1401_15, l_l_aimtools_0_17, l_v1403_15 = v1399, v1400, v1401, l_aimtools_0, v1403;
    l_v1401_15 = function(v3242, v3243)
        -- upvalues: l_v1399_13 (ref)
        if v3242 == nil or v3243 == nil then
            return false;
        elseif v3242:get_weapon_index() == 45 then
            return v3243 > 0;
        else
            return l_v1399_13.damage:get() <= v3243;
        end;
    end;
    l_l_aimtools_0_17 = function(v3244)
        -- upvalues: l_v1401_15 (ref), l_v1400_16 (ref)
        local v3245 = entity.get_local_player();
        if v3245 == nil then
            return;
        else
            local v3246 = v3245:get_player_weapon();
            if v3246 == nil then
                return;
            elseif not v3246.m_bPinPulled then
                return;
            elseif v3246.m_flThrowStrength <= 0 then
                return;
            else
                if l_v1401_15(v3246, l_v1400_16) then
                    v3244.in_attack = false;
                    v3244.in_attack2 = false;
                end;
                l_v1400_16 = nil;
                return;
            end;
        end;
    end;
    l_v1403_15 = function(v3247)
        -- upvalues: l_v1400_16 (ref)
        l_v1400_16 = v3247.damage;
    end;
    v1404 = nil;
    v1556 = function(v3248)
        -- upvalues: l_l_aimtools_0_17 (ref), l_v1403_15 (ref)
        local v3249 = v3248:get();
        events.createmove(l_l_aimtools_0_17, v3249);
        events.grenade_prediction(l_v1403_15, v3249);
    end;
    l_v1399_13.enabled:set_callback(v1556, true);
end;
v1399 = nil;
v1400 = v384.misc.fps_optimize;
v1401 = false;
l_aimtools_0 = {};
v1403 = function(v3250)
    assert(type(v3250) == "table", "cmds must be a table");
    assert(type(v3250.set) == "function", "set must be a function");
    assert(type(v3250.unset) == "function", "unset must be a function");
    return {
        set = v3250.set, 
        unset = v3250.unset
    };
end;
do
    local l_v1403_16 = v1403;
    v1404 = function(v3252, v3253)
        -- upvalues: l_v1403_16 (ref)
        assert(type(v3252) == "userdata", "convar must be a userdata");
        assert(type(v3253) == "number", "value must be a number");
        local v3254 = nil;
        local l_v3253_0 = v3253;
        local function v3256()
            -- upvalues: v3254 (ref), v3252 (ref), l_v3253_0 (ref)
            if v3254 == nil then
                v3254 = v3252:int();
                v3252:int(l_v3253_0);
            end;
        end;
        local function v3257()
            -- upvalues: v3254 (ref), v3252 (ref)
            if v3254 ~= nil then
                v3252:int(v3254);
                v3254 = nil;
            end;
        end;
        return l_v1403_16({
            set = v3256, 
            unset = v3257
        });
    end;
    v1556 = function(v3258)
        -- upvalues: l_v1403_16 (ref)
        assert(type(v3258) == "function", "fn must be a function");
        local v3259 = {};
        v3258(v3259);
        return l_v1403_16(v3259);
    end;
    l_aimtools_0.Fog = {
        v1404(cvar.fog_enable, 0), 
        v1404(cvar.fog_enable_water_fog, 0)
    };
    l_aimtools_0.Blood = {
        v1404(cvar.violence_hblood, 0)
    };
    l_aimtools_0.Bloom = {
        v1404(cvar.mat_disable_bloom, 1)
    };
    l_aimtools_0.Decals = {
        v1404(cvar.r_drawdecals, 0)
    };
    l_aimtools_0.Shadows = {
        v1404(cvar.r_shadows, 0), 
        v1404(cvar.cl_csm_static_prop_shadows, 0), 
        v1404(cvar.cl_csm_shadows, 0), 
        v1404(cvar.cl_csm_world_shadows, 0), 
        v1404(cvar.cl_foot_contact_shadows, 0), 
        v1404(cvar.cl_csm_viewmodel_shadows, 0), 
        v1404(cvar.cl_csm_rope_shadows, 0), 
        v1404(cvar.cl_csm_sprite_shadows, 0), 
        v1404(cvar.cl_csm_translucent_shadows, 0), 
        v1404(cvar.cl_csm_entity_shadows, 0), 
        v1404(cvar.cl_csm_world_shadows_in_viewmodelcascade, 0)
    };
    l_aimtools_0.Sprites = {
        v1404(cvar.r_drawsprites, 0)
    };
    l_aimtools_0.Particles = {
        v1404(cvar.r_drawparticles, 0)
    };
    l_aimtools_0.Ropes = {
        v1404(cvar.r_drawropes, 0)
    };
    l_aimtools_0["Dynamic lights"] = {
        v1404(cvar.mat_disable_fancy_blending, 1)
    };
    l_aimtools_0["Map details"] = {
        v1404(cvar.func_break_max_pieces, 0), 
        v1404(cvar.props_break_max_pieces, 0)
    };
    l_aimtools_0["Weapon effects"] = {
        v1404(cvar.muzzleflash_light, 0), 
        v1404(cvar.r_drawtracers_firstperson, 0)
    };
    l_aimtools_0.Teammates = {
        v1556(function(v3260)
            local function v3265(v3261)
                local v3262 = entity.get_local_player();
                if v3262 == nil then
                    return;
                else
                    local v3263 = v3262:is_alive();
                    entity.get_players(false, true, function(v3264)
                        -- upvalues: v3262 (ref), v3261 (ref), v3263 (ref)
                        if v3264 ~= v3262 and not v3264:is_enemy() then
                            if v3261 or not v3263 then
                                v3264.m_nRenderMode = 0;
                            else
                                v3264.m_nRenderMode = 10;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
            local function v3266()
                -- upvalues: v3265 (ref)
                v3265(true);
            end;
            local function v3267()
                -- upvalues: v3265 (ref)
                v3265(false);
            end;
            local function v3268()
                -- upvalues: v3265 (ref), v3266 (ref), v3267 (ref)
                v3265(false);
                events.shutdown(v3266, true);
                events.net_update_end(v3267, true);
            end;
            local function v3269()
                -- upvalues: v3265 (ref), v3266 (ref), v3267 (ref)
                v3265(true);
                events.shutdown(v3266, false);
                events.net_update_end(v3267, false);
            end;
            v3260.set = v3268;
            v3260.unset = v3269;
        end)
    };
end;
do
    local l_v1400_17, l_v1401_16, l_l_aimtools_0_18, l_v1403_17, l_v1404_14, l_v1556_12, l_v1557_11, l_v1558_12 = v1400, v1401, l_aimtools_0, v1403, v1404, v1556, v1557, v1558;
    l_v1403_17 = function()
        -- upvalues: l_v1400_17 (ref), v394 (ref)
        if l_v1400_17.always_on:get() then
            return true;
        elseif v394.is_peeking and l_v1400_17.detections:get("Peeking") then
            return true;
        elseif v394.is_vulnerable and l_v1400_17.detections:get("Hit Flag") then
            return true;
        else
            return false;
        end;
    end;
    l_v1404_14 = function()
        -- upvalues: l_v1401_16 (ref), l_l_aimtools_0_18 (ref)
        if not l_v1401_16 then
            return;
        else
            for _, v3279 in pairs(l_l_aimtools_0_18) do
                for v3280 = 1, #v3279 do
                    v3279[v3280]:unset();
                end;
            end;
            l_v1401_16 = false;
            return;
        end;
    end;
    l_v1556_12 = function()
        -- upvalues: l_v1401_16 (ref), l_v1400_17 (ref), l_l_aimtools_0_18 (ref)
        if l_v1401_16 then
            return;
        else
            local v3281 = l_v1400_17.select:get();
            for v3282 = 1, #v3281 do
                local v3283 = l_l_aimtools_0_18[v3281[v3282]];
                for v3284 = 1, #v3283 do
                    v3283[v3284]:set();
                end;
            end;
            l_v1401_16 = true;
            return;
        end;
    end;
    l_v1557_11 = function()
        -- upvalues: l_v1404_14 (ref)
        l_v1404_14();
    end;
    l_v1558_12 = function()
        -- upvalues: l_v1403_17 (ref), l_v1404_14 (ref), l_v1556_12 (ref)
        if not l_v1403_17() then
            return l_v1404_14();
        else
            l_v1556_12();
            return;
        end;
    end;
    v1559 = nil;
    v1560 = function(_)
        -- upvalues: l_v1404_14 (ref), l_v1556_12 (ref)
        l_v1404_14();
        l_v1556_12();
    end;
    do
        local l_v1560_14 = v1560;
        v1561 = function(v3287)
            -- upvalues: l_v1400_17 (ref), l_v1560_14 (ref), l_v1404_14 (ref), l_v1557_11 (ref), l_v1558_12 (ref)
            local v3288 = v3287:get();
            if v3288 then
                l_v1400_17.select:set_callback(l_v1560_14, true);
            else
                l_v1400_17.select:unset_callback(l_v1560_14);
            end;
            if not v3288 then
                l_v1404_14();
            end;
            events.shutdown(l_v1557_11, v3288);
            events.net_update_end(l_v1558_12, v3288);
        end;
        l_v1400_17.enabled:set_callback(v1561, true);
    end;
end;
v1400 = nil;
v1401 = v384.misc.ping_unlocker;
l_aimtools_0 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v1403 = cvar.sv_maxunlag;
do
    local l_v1401_17, l_l_aimtools_0_19, l_v1403_18, l_v1404_15, l_v1556_13, l_v1557_12 = v1401, l_aimtools_0, v1403, v1404, v1556, v1557;
    l_v1404_15 = function()
        -- upvalues: l_l_aimtools_0_19 (ref), l_v1403_18 (ref)
        l_l_aimtools_0_19:override();
        l_l_aimtools_0_19:disabled(false);
        l_v1403_18:float(tonumber(l_v1403_18:string()), true);
    end;
    l_v1556_13 = function(v3295)
        -- upvalues: l_l_aimtools_0_19 (ref), l_v1403_18 (ref)
        l_l_aimtools_0_19:override(v3295);
        l_l_aimtools_0_19:disabled(true);
        l_v1403_18:float(0.4, true);
    end;
    l_v1557_12 = function()
        -- upvalues: l_v1404_15 (ref)
        l_v1404_15();
    end;
    v1558 = nil;
    v1559 = function(v3296)
        -- upvalues: l_v1556_13 (ref)
        l_v1556_13(v3296:get());
    end;
    do
        local l_v1559_12 = v1559;
        v1560 = function(v3298)
            -- upvalues: l_v1404_15 (ref), l_v1401_17 (ref), l_v1559_12 (ref), l_v1557_12 (ref)
            local v3299 = v3298:get();
            if not v3299 then
                l_v1404_15();
            end;
            if v3299 then
                l_v1401_17.value:set_callback(l_v1559_12, true);
            else
                l_v1401_17.value:unset_callback(l_v1559_12);
            end;
            events.shutdown(l_v1557_12, v3299);
        end;
        l_v1401_17.enabled:set_callback(v1560, true);
    end;
end;
v1401 = nil;
l_aimtools_0 = v384.misc.animation_breaker;
v1403 = 2;
v1404 = 6;
v1556 = 12;
v1557 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v1558 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
do
    local l_l_aimtools_0_20, l_v1403_19, l_v1404_16, l_v1556_14, l_v1557_13, l_v1558_13, l_v1559_13, l_v1560_15, l_v1561_13, l_v1562_14, l_v1563_13, l_v1564_8 = l_aimtools_0, v1403, v1404, v1556, v1557, v1558, v1559, v1560, v1561, v1562, v1563, v1564;
    l_v1559_13 = function(v3312)
        -- upvalues: l_v1558_13 (ref)
        return ffi.cast(l_v1558_13, ffi.cast("uintptr_t", v3312[0]) + 10640)[0];
    end;
    l_v1560_15 = function(v3313)
        -- upvalues: v394 (ref), l_l_aimtools_0_20 (ref), l_v1557_13 (ref)
        if v394.is_onground then
            local v3314 = l_l_aimtools_0_20.ground_legs:get();
            if v3314 == "Static" then
                l_v1557_13:override("Sliding");
                v3313.m_flPoseParameter[0] = 0;
                return;
            elseif v3314 == "Jitter" then
                local l_tickcount_2 = globals.tickcount;
                local v3316 = l_l_aimtools_0_20.legs_offset_1:get();
                local v3317 = l_l_aimtools_0_20.legs_offset_2:get();
                local v3318 = 1 / (l_tickcount_2 % 8 >= 4 and 200 or 400);
                local v3319 = l_tickcount_2 % 4 >= 2 and v3316 or v3317;
                l_v1557_13:override("Sliding");
                v3313.m_flPoseParameter[0] = v3319 * v3318;
                return;
            elseif v3314 == "Allah" then
                l_v1557_13:override("Walking");
                v3313.m_flPoseParameter[7] = 0;
                return;
            elseif v3314 == "Kangaroo" then
                v3313.m_flPoseParameter[3] = math.random();
                v3313.m_flPoseParameter[6] = math.random();
                v3313.m_flPoseParameter[7] = math.random();
            end;
        end;
        l_v1557_13:override();
    end;
    l_v1561_13 = function(v3320, v3321)
        -- upvalues: l_l_aimtools_0_20 (ref), v394 (ref), l_v1404_16 (ref)
        local v3322 = l_l_aimtools_0_20.air_legs:get();
        if v3322 == "Disabled" then
            return;
        elseif v394.is_onground then
            return;
        elseif v3322 == "Static" then
            v3320.m_flPoseParameter[6] = 1;
            return;
        elseif v3322 == "kangaroo" then
            v3320.m_flPoseParameter[3] = math.random();
            v3320.m_flPoseParameter[6] = math.random();
            v3320.m_flPoseParameter[7] = math.random();
            return;
        elseif v3322 == "Haram" then
            if not v394.is_moving then
                return;
            else
                local v3323 = v3321[l_v1404_16];
                if v3323 == nil then
                    return;
                else
                    v3323.m_flWeight = 1;
                    return;
                end;
            end;
        else
            return;
        end;
    end;
    l_v1562_14 = function(v3324)
        -- upvalues: l_l_aimtools_0_20 (ref), l_v1556_14 (ref)
        local v3325 = l_l_aimtools_0_20.body_lean:get();
        if v3325 == -1 then
            return;
        else
            local v3326 = v3324[l_v1556_14];
            if v3326 == nil then
                return;
            else
                v3326.m_flWeight = v3325 * 0.1;
                return;
            end;
        end;
    end;
    l_v1563_13 = function(v3327, v3328)
        -- upvalues: l_l_aimtools_0_20 (ref), v394 (ref)
        if not l_l_aimtools_0_20.pitch_on_land:get() then
            return;
        elseif not v394.is_onground then
            return;
        elseif not v3328.landing then
            return;
        else
            v3327.m_flPoseParameter[12] = 0.5;
            return;
        end;
    end;
    l_v1564_8 = function(v3329)
        -- upvalues: l_v1559_13 (ref), l_v1403_19 (ref), l_v1560_15 (ref), l_v1561_13 (ref), l_v1563_13 (ref), l_v1562_14 (ref)
        local v3330 = entity.get_local_player();
        if v3330 == nil or v3329 ~= v3330 then
            return;
        else
            local v3331 = v3329:get_anim_state();
            if v3331 == nil then
                return;
            else
                local v3332 = l_v1559_13(v3329);
                if v3332 == nil then
                    return;
                else
                    if v3330.m_MoveType == l_v1403_19 then
                        l_v1560_15(v3330);
                        l_v1561_13(v3330, v3332);
                        l_v1563_13(v3330, v3331);
                    end;
                    l_v1562_14(v3332);
                    return;
                end;
            end;
        end;
    end;
    v1565 = nil;
    v1566 = function(v3333)
        -- upvalues: l_v1557_13 (ref), l_v1564_8 (ref)
        local v3334 = v3333:get();
        if not v3334 then
            l_v1557_13:override();
        end;
        events.post_update_clientside_animation(l_v1564_8, v3334);
    end;
    l_l_aimtools_0_20.enabled:set_callback(v1566, true);
end;
l_aimtools_0 = nil;
v1403 = v384.misc.fake_duck;
v1404 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1556 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1557 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v1558 = {};
v1559 = 0;
do
    local l_v1404_17, l_v1556_15, l_v1557_14, l_v1558_14, l_v1559_14 = v1404, v1556, v1557, v1558, v1559;
    do
        local l_l_v1559_14_0, l_v1560_16, l_v1561_14, l_v1562_15, l_v1563_14, l_v1564_9 = l_v1559_14, v1560, v1561, v1562, v1563, v1564;
        l_v1560_16 = function()
            -- upvalues: l_l_v1559_14_0 (ref)
            if l_l_v1559_14_0 >= 14 then
                l_l_v1559_14_0 = 0;
            end;
            l_l_v1559_14_0 = l_l_v1559_14_0 + 1;
        end;
        l_v1561_14 = function()
            -- upvalues: l_v1404_17 (ref), l_v1556_15 (ref)
            l_v1404_17:override();
            l_v1556_15:override();
        end;
        l_v1562_15 = function()
            -- upvalues: l_v1561_14 (ref)
            l_v1561_14();
        end;
        l_v1563_14 = function(v3346)
            -- upvalues: l_v1557_14 (ref)
            if not l_v1557_14:get() then
                return;
            else
                local v3347 = entity.get_local_player();
                if v3347 == nil then
                    return;
                else
                    local v3348 = entity.get_game_rules();
                    if v3348 == nil or not v3348.m_bFreezePeriod then
                        return;
                    else
                        v3346.camera.z = v3347:get_origin().z + 64;
                        return;
                    end;
                end;
            end;
        end;
        l_v1564_9 = function(v3349)
            -- upvalues: l_v1557_14 (ref), l_v1561_14 (ref), l_v1560_16 (ref), l_l_v1559_14_0 (ref), l_v1404_17 (ref), l_v1556_15 (ref)
            if not l_v1557_14:get() then
                return l_v1561_14();
            else
                local v3350 = entity.get_game_rules();
                if v3350 == nil or not v3350.m_bFreezePeriod then
                    return;
                else
                    l_v1560_16();
                    v3349.in_duck = l_l_v1559_14_0 > 7;
                    v3349.send_packet = l_l_v1559_14_0 == 14;
                    l_v1404_17:override(false);
                    l_v1556_15:override(false);
                    return;
                end;
            end;
        end;
        l_v1558_14.update = function(v3351)
            -- upvalues: l_v1562_15 (ref), l_v1564_9 (ref), l_v1563_14 (ref)
            local v3352 = v3351:get("On Freezetime");
            events.shutdown(l_v1562_15, v3352);
            events.createmove(l_v1564_9, v3352);
            events.override_view(l_v1563_14, v3352);
        end;
    end;
    l_v1559_14 = {};
    v1560 = function(v3353)
        -- upvalues: l_v1557_14 (ref)
        if not l_v1557_14:get() then
            return;
        else
            local v3354 = vector(v3353.forwardmove, v3353.sidemove);
            if v3354:length2dsqr() < 25 then
                return;
            else
                v3354:normalize();
                v3353.forwardmove = v3354.x * 150;
                v3353.sidemove = v3354.y * 150;
                return;
            end;
        end;
    end;
    do
        local l_v1560_17 = v1560;
        l_v1559_14.update = function(v3356)
            -- upvalues: l_v1560_17 (ref)
            events.createmove_run(l_v1560_17, v3356:get("Unlock Speed"));
        end;
    end;
    v1560 = nil;
    v1561 = function(v3357)
        -- upvalues: l_v1558_14 (ref), l_v1559_14 (ref)
        l_v1558_14.update(v3357);
        l_v1559_14.update(v3357);
    end;
    v1403.options:set_callback(v1561, true);
end;
v1403 = nil;
v1404 = v384.misc.nickname_generator;
v1556 = cvar.name;
v1557 = nil;
v1558 = {
    [1] = "\208\177\208\187\209\143 \208\189\208\190\209\128\208\188\208\176\208\187\209\140\208\189\208\190 \208\189\208\176\208\178\208\176\209\133\209\131 \208\186\209\131\208\191\208\184\208\187", 
    [2] = "\209\143 \208\178\208\181\208\185\208\191 \208\186\209\131\208\191\208\184\208\187", 
    [3] = "\209\135\208\180? \208\186\208\180?", 
    [4] = "\209\143\208\186\209\131\208\177\208\190\208\178\209\135\208\184567", 
    [5] = "\208\177\208\187\208\181\208\186 \208\176\208\189\208\179\208\181\208\187 \209\131\208\177\208\184\208\178\209\136\208\186\208\17611", 
    [6] = "\209\130\208\176\209\128\208\176\208\186\208\176\208\189 \208\180\208\184\208\189\208\184\209\129", 
    [7] = "\208\182\209\131\208\187\209\140\208\178\208\181\209\128\208\184\208\186", 
    [8] = "\209\143\209\128\208\190\209\129\209\130\208\189\209\139\208\185 \208\188\208\184\208\189\208\181\209\128\208\187\209\140\208\189\209\139\208\185 \209\135\208\181\209\135\208\181\208\189\208\181\209\134 \208\186\208\176\208\182\209\141\209\131\208\176\208\187", 
    [9] = "\209\129\208\189\208\181\208\179\208\190\208\178\208\190\208\185 \208\176\208\178\208\191\208\186\208\184\208\189\208\179\209\131\208\187\209\143", 
    [10] = "mr \208\179\208\181\208\185\208\188\208\181\209\128300", 
    [11] = "\209\133\209\129\208\176\209\142 \208\178\208\178 \209\129 \208\191\208\181\209\128\208\178\208\190\208\185 \208\191\209\131", 
    [12] = "\208\186\209\131\208\180\208\176 \208\178 \209\133\209\131\208\185", 
    [13] = "hasbik style KZ", 
    [14] = "60G AJlTaUcKuX 7oP", 
    [15] = "4\208\181 \208\178 Xy\209\1437y", 
    [16] = "\209\133\209\129\208\176\209\142 \208\180\208\176\208\182\208\181 \208\189\208\176 \209\130\208\190\208\1874\208\186\208\181", 
    [17] = "OnlyBaim gang$", 
    [18] = "\208\177\209\139\208\187 \208\178\209\139\208\181\208\177\208\176\208\189 \208\186\208\184\208\183\208\176\209\128\209\131\209\133\208\178\209\133", 
    [19] = "9PoCtHblU KUnKoG", 
    [20] = "TTu3\208\180oH\209\142x", 
    [21] = "CTaPa\209\143 Ho OTTacHeH\209\140Ka\209\143", 
    [22] = "\209\143 \208\178\209\139\208\181\208\183\208\182\208\176\209\142 \208\189\208\190\209\129\208\190\208\191\209\139\209\128\208\186\208\184", 
    [23] = "\226\156\170FasTIK\226\156\170", 
    [24] = "\208\130\206\163\198\138O\197\129\226\136\134G\226\136\134", 
    [25] = "\239\184\187\227\131\135\226\149\144\228\184\128 \226\152\173 sniper", 
    [26] = "\208\147\209\131\208\161\208\181\208\153\208\189 \208\168\208\190\208\163", 
    [27] = "o\208\159 \208\175 \208\186\208\160\209\131\208\162\208\190\208\153 \208\144 \209\130\208\171 \208\165\209\131\208\153", 
    [28] = "\209\133\209\131\209\143\209\130\208\190\209\128\209\131\208\177\208\184\208\178\208\176\209\130\208\190\209\1286731", 
    [29] = "\226\153\149\239\189\129\239\189\146\239\189\148\239\189\133\239\189\141 \239\188\145\239\188\149\239\188\148", 
    [30] = "\209\129\209\128\208\181\208\179\208\176 \208\188\208\190\208\177\208\184\208\187\208\186\208\184\208\189", 
    [31] = "\208\188\208\176\209\130\208\178\208\181\208\185 \208\186\209\128\208\176\208\177\208\190\208\178", 
    [32] = "\208\186\208\190\208\185\209\132\208\190\208\178\208\176\209\143 \208\186\209\128\208\184\208\178\208\181\209\130\208\186\208\176 \208\181\208\177\208\187\208\176\208\189\208\184\209\137\208\181", 
    [33] = "\226\156\167*:\239\189\165\239\190\159\226\156\167 \240\157\144\133\240\157\144\148\240\157\144\130\240\157\144\138 \240\157\144\152\240\157\144\142\240\157\144\148 \226\156\167*:\239\189\165\239\190\159\226\156\167", 
    [34] = "SPASIBO ZA SKEET", 
    [35] = "\240\157\144\141\240\157\144\154\240\157\144\128\240\157\144\162\240\157\144\171\240\157\144\140\240\157\144\154\240\157\144\177", 
    [36] = "\208\177\209\131\208\185\208\189\209\139\208\185 \209\129\208\187\208\176\208\178\208\184\208\186 \208\179\208\176\208\183\208\190\208\187\208\184\209\128", 
    [37] = "\208\187\209\145\208\178\208\176 \209\130\208\176\209\128\208\176\208\186\208\176\208\189-56", 
    [38] = "yKpoTuTeJlb_6a6yweK", 
    [39] = "anatoly fakeyaw", 
    [40] = "\208\146\208\176\208\187\208\181\208\189\209\130\208\184\208\189", 
    [41] = "\208\161\209\131\208\191\208\181\209\128 \208\161\208\189\208\176\208\185\208\191\208\181\209\128228", 
    [42] = "\208\151\208\176\208\186\208\176\208\183\208\176\209\130\209\140 \208\191\208\181\208\180\208\190\209\132u\208\187\208\176", 
    [43] = "\208\160\208\176\208\188\208\183\208\176\208\189 \208\154\208\176\208\180\209\139\209\128\208\190\208\178", 
    [44] = "\208\191\209\128\208\190\208\178\208\181\209\128\208\186\208\176 \208\189\208\176 \209\135\208\184\209\130\209\139", 
    [45] = "main nick sanyaKiller228", 
    [46] = "\208\145\208\190\209\128\208\184\209\129 \208\150\208\184\208\178\208\190\209\130\208\189\208\190\208\181", 
    [47] = "bmw top", 
    [48] = "\208\148\208\184\208\188\208\176[RUS]2005", 
    [49] = "\208\184\209\129\208\187\208\176\208\188 \208\188\208\176\208\179\208\190\208\188\208\181\208\180\208\190\208\178", 
    [50] = "\208\162\208\152\208\156\208\144\208\162\208\152\208\165\208\146\208\165", 
    [51] = "eldoradohvh", 
    [52] = "\208\177\209\131\208\187\209\140\209\130\208\176\208\183\208\176\209\128", 
    [53] = "\209\143 \208\181\208\177\208\187\208\176\208\189 \208\177\208\184\208\179\208\184\209\130\208\184", 
    [54] = "pavlo.matvei98", 
    [55] = "www.CSGOSETTINGS.ru 111", 
    [56] = "\208\188\208\176\208\188\208\186\208\176\208\181\208\1772009", 
    [57] = "\209\132\209\131\208\179\208\176\209\129 \209\130\208\184\208\188\208\190\209\133\208\176", 
    [58] = "VLAD_\208\159\208\163\208\161\208\162\208\158\208\153", 
    [59] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 (Not Cheater)", 
    [60] = "\208\158\208\191\208\144$\208\189\208\171\208\185 \208\188\208\176\209\129\209\130\208\181\209\128 \208\186\208\187\208\176\209\130\209\135\208\181\208\185 \208\187\208\181\209\133\208\176 \208\181\208\177\208\176\209\130\209\140", 
    [61] = "KirillMachine", 
    [62] = "THIS IS OMLEEEEEEET (\226\151\163\226\151\162)", 
    [63] = "soldier (\209\129\208\190\208\187\208\180\208\176\209\130)", 
    [64] = "-----= S.E.N.A.T.O.R =-----", 
    [65] = "*-\208\154\209\128Y\209\135E_\208\145\208\190\208\179\208\176_u_\208\166\208\176\208\160\209\143-*", 
    [66] = "\225\180\155\202\156\225\180\135\202\153\225\180\135s\225\180\155", 
    [67] = "\226\153\165\194\167\226\130\173\195\174\226\132\146\200\180\226\138\149\225\151\169\225\153\161\199\158\226\132\153\226\132\176\226\132\156\226\130\179\240\159\142\134", 
    [68] = "GloBal~BaNaN", 
    [69] = "Fucking.Ba[nn]Y...", 
    [70] = "d[oo]dLeZzzz...", 
    [71] = "VIP Sex Energy VIP", 
    [72] = "\240\159\165\145\240\157\149\146\240\157\149\167\240\157\149\146\240\157\149\148\240\157\149\146\240\157\149\149\240\157\149\160\240\159\165\145", 
    [73] = "\228\185\130...\240\157\148\161.\240\157\148\166.\240\157\148\168.\240\157\148\166.y...\228\185\130", 
    [74] = "\226\149\145\226\152\190 \196\166 \206\158 \226\136\128 \229\141\131 \206\163 \229\176\186\226\149\145", 
    [75] = "\229\189\161[\225\180\133\225\180\135\225\180\128\225\180\133 \225\180\139\201\170\202\159\202\159\225\180\135\202\128]\229\189\161", 
    [76] = "\202\128\225\180\135\225\180\152 \201\170\201\180s\225\180\128\201\180\225\180\135 \225\180\161\201\170\225\180\155\202\156 \225\180\128\225\180\161\225\180\152", 
    [77] = "\208\161\208\191\209\131\208\180\208\184 \208\156\209\131\208\189", 
    [78] = "\225\151\171\225\131\162\226\130\166\226\132\139\226\132\177\199\190\226\132\156", 
    [79] = "\226\152\162\196\142\226\130\179\195\145\199\164\196\146\226\132\159\226\152\162", 
    [80] = "\196\162\197\151\196\133\197\134\196\143_\226\130\165\196\133\239\174\144\197\167\206\190\197\151", 
    [81] = "F@$$$TiK...", 
    [82] = "...::::K[RAM]m[ER]::::...", 
    [83] = "\208\190\208\191\208\181\209\128 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [84] = "\208\148\208\158\208\157\208\144\208\162 \208\161 PAYPAL", 
    [85] = "shelzi228", 
    [86] = "\209\132\208\176\209\128\209\136", 
    [87] = "\209\130\208\176\208\189\209\134\209\131\209\142 \208\187\208\181\208\183\208\179\208\184\208\189\208\186\209\131", 
    [88] = "OPER\209\131\208\191\208\190\208\187\208\189\208\190\208\188\208\190\209\135\208\181\208\189\208\189\209\139\208\185", 
    [89] = "2 \208\190\209\133\208\187\208\176\208\182\208\180\208\181\208\189\208\189\209\139\209\133 \209\143\208\185\209\134\208\176", 
    [90] = "\208\188\208\176\208\183\208\184\208\186 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [91] = "Ballin' Maut", 
    [92] = "Balin`Shprot", 
    [93] = "MILLIONAR Balin", 
    [94] = "\208\154\208\160\208\144\208\168 \208\162\208\149\208\161\208\162 \208\156\208\144\208\160\208\154 2", 
    [95] = "\226\128\139HVH RACING", 
    [96] = "\208\186\208\187\209\131\208\177\208\189\208\184\209\135\208\189\208\190-\208\178\208\184\209\136\208\189\208\181\208\178\209\139\208\185 \209\129\208\187\208\190\208\189\209\143\209\128\208\176", 
    [97] = "\209\143\208\177\208\187\208\190\209\135\208\189\209\139\208\185 \208\179\208\184\208\191\208\190\208\191\208\190\209\130\208\176\208\188", 
    [98] = "\208\186\209\128\208\190\208\187 \209\128\208\182\208\176\209\135\208\189\209\139\208\185 \208\176\208\177\209\128\208\184\208\186\208\190\209\129\208\190\208\178\209\139\208\185", 
    [99] = "\208\144\208\179\209\128\208\181\209\129\209\129\208\184\208\178\208\189\209\139\208\185 \208\186\208\176\209\128\208\177\209\142\209\128\208\176\209\130\208\190\209\128", 
    [100] = "tw1x^zz1^aced1v1", 
    [101] = "s1mple", 
    [102] = "\234\167\129\226\132\179a\226\178\166\226\177\148\201\170\226\132\163a\225\186\149\226\177\148\201\170\226\156\158\234\167\130", 
    [103] = "\226\128\162\225\180\174\225\180\172\225\180\176\202\153\225\180\143\202\143\227\131\132", 
    [104] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\147\240\157\150\148\240\157\150\147\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [105] = "\226\136\134\226\153\163\239\184\143JOKER\226\153\165\239\184\143\226\136\134", 
    [106] = "SpraY", 
    [107] = "\234\167\129\224\188\186\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\234\167\130", 
    [108] = "\226\158\162 I\225\180\141\225\180\141\225\180\143\202\128\225\180\155\225\180\128\202\159", 
    [109] = "\226\149\190\226\148\129\226\149\164\227\131\135\226\149\166\239\184\187 \226\130\179\226\130\173-\226\157\185\226\157\188 \240\157\147\176\240\157\147\184\240\157\147\173", 
    [110] = "\239\184\187\227\131\135\226\149\144\228\184\128GOD_SK", 
    [111] = "\240\159\133\188*\240\159\133\176\239\184\143*\240\159\134\133*\240\159\133\180*\240\159\134\129*\240\159\133\184*\240\159\133\178*\240\159\133\186", 
    [112] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187\225\180\179\225\181\146\225\181\136", 
    [113] = "\234\167\129\226\156\170\226\153\149BOT\226\153\149\226\156\170\234\167\130", 
    [114] = "\240\159\148\165\240\157\147\150\240\157\147\161\240\157\147\144\240\157\147\162\240\157\147\164\240\159\148\165", 
    [115] = "T\195\152XIC", 
    [116] = "\240\157\149\181\240\157\150\134\240\157\148\179\240\157\150\142\240\157\150\142 \226\156\170", 
    [117] = "\240\159\133\180\240\159\134\137\240\159\134\137 \240\159\133\189\240\159\133\190\239\184\143\240\159\133\190\239\184\143\240\159\133\177\239\184\143\240\159\134\130", 
    [118] = "\234\167\129\224\188\186J\204\189\205\147o\204\189\205\147s\204\189\205\147I\204\189\205\147\224\188\187\234\167\130", 
    [119] = "\226\153\161 AWP \226\128\147 senpai \226\151\149\226\128\191\226\151\149 [\227\131\132]", 
    [120] = "\227\131\133 [OnI-ChaN] FreSH[x]\226\152\170\239\184\143", 
    [121] = "\234\167\129\225\180\179\225\181\146\225\181\136Slayer\234\167\130", 
    [122] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187", 
    [123] = "\226\156\170\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\239\184\187\227\131\135\226\149\144\228\184\128", 
    [124] = ".S!ckBoY^", 
    [125] = "\240\157\149\190\240\157\150\153\240\157\150\154\240\157\150\151\240\157\150\146\240\157\149\189\240\157\150\138\240\157\150\135\240\157\150\138\240\157\150\145\240\157\150\145", 
    [126] = "\226\153\165\239\184\143\240\157\147\154\240\157\147\174\240\157\147\157\240\157\147\157\240\157\148\130\240\157\147\162\226\153\165\239\184\143", 
    [127] = "Snax", 
    [128] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\181\240\157\147\174\240\157\147\176\240\157\147\174\240\157\147\183\240\157\147\173\203\161\225\181\146\225\181\155\225\181\137 \202\184\225\181\146\225\181\152\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [129] = "\226\153\149\209\149\208\189\209\148 \194\162\206\177\226\132\147\226\132\147 \208\188\209\148 \208\189\206\177\194\162", 
    [130] = "\226\156\170AnARcHY_", 
    [131] = "bl1tz", 
    [132] = "Carry Potter", 
    [133] = "\226\156\170TaCt1CaL", 
    [134] = "vk.com/vampire", 
    [135] = "\225\151\176E\225\151\176E \225\148\149E\225\145\142\225\148\149E", 
    [136] = "\226\128\157*\194\176\226\128\162.\226\152\133..Angel_Of_The_Night..\226\152\133.\226\128\162\194\176*\226\128\157\203\156", 
    [137] = "\195\177\198\164\195\188\206\178\194\163\207\175 \206\168\208\189\211\185\198\164\209\140 \207\175\194\163\225\131\156\209\143 \194\163\225\131\156\194\163\207\175 j\194\163\194\167\201\165\194\167", 
    [138] = "\196\153\206\178\195\163\197\130 \200\155\195\189\195\164 \226\136\154 \197\153\195\184\197\163", 
    [139] = "\229\191\141\227\129\179 1 \208\163\208\159\208\144\208\155 \227\129\179\229\191\141", 
    [140] = "MaJIeHkuu_Ho_OnacHekuu", 
    [141] = "\226\128\162\219\169\219\158\219\169[\204\178\204\133\208\159\204\178\204\133\208\190\204\178\204\133\208\155\204\178\204\133\208\174\204\178\204\133\208\177\204\178\204\133\208\144\204\178\204\133\208\161(\217\191)\204\178\204\133\208\167\204\178\204\133\208\184\204\133\208\162\204\178\204\178\208\144\208\154\204\178\204\133]\219\169\219\158\219\169\226\128\162", 
    [142] = "Y\208\177\208\152u\208\166\208\176_\208\154\209\128\208\152\208\191\208\149r\208\158\208\178", 
    [143] = "\208\162\208\181\208\191\208\181\209\128\209\140 \209\143 - \208\174\209\130\209\131\208\177\208\181\209\128 \208\158\208\188\208\187\208\181\209\130 (\226\151\163\226\151\162)", 
    [144] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128 PUTIN", 
    [145] = "VAAAAAAAC \208\178 \209\135\208\176\209\130!!! (\227\129\165 \226\151\149\226\128\191\226\151\149 )", 
    [146] = "\227\129\165 \228\187\142\233\151\169\228\187\142\233\149\191\228\184\171 \228\187\168\228\186\148\233\151\169\228\186\186", 
    [147] = "+Yeb@shu_v_k@shu+", 
    [148] = "\194\163\225\131\156\195\191 \207\175\209\143", 
    [149] = "AHHAHAHHAHAHH LIFEHACK \226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143", 
    [150] = "\208\159\209\131\208\155\208\184_\208\158\209\130_\208\145\208\176\208\145\209\131\208\155\208\184", 
    [151] = "\208\159\208\176\208\160\208\181\208\157\209\140 \208\145\208\181\208\151 \209\129\208\162\209\128\208\144\209\133\208\144", 
    [152] = "\208\157.\208\149.\208\161.\208\158.\208\154.\208\160.\208\163.\208\168.\208\152.\208\156.\208\171.\208\153", 
    [153] = "KpyToI_4elOBeK", 
    [154] = "^^Stell^^::.[Pro_Game_Xom9k]", 
    [155] = "3Jlou_\208\151AdrOT", 
    [156] = "\195\177\195\188\209\171\194\164\198\164 \195\177\195\188\198\186\209\171\195\165 \207\175\195\191\198\186 \201\177\194\164\208\189\194\164\200\185\209\143", 
    [157] = "\209\143 \196\183\194\164\208\189\201\165\195\165\206\187 \207\175\206\178\194\164\194\163\195\188 \201\177\195\165\201\177\196\183\194\163 \206\178 \198\164\194\164\207\175", 
    [158] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128", 
    [159] = "\208\186\208\190\208\188\209\129\208\190\208\188\208\190\208\187\209\140\209\129\208\186\208\184\208\185 \209\134\209\139\208\179\208\176\208\189", 
    [160] = "\208\189\208\190\209\129\208\176\209\130\209\139\208\185 \208\189\208\190\209\129 \209\128\208\176\208\185\208\183\208\181\208\189\208\176", 
    [161] = "\208\176\209\136\208\186\209\131\208\180\208\184\209\136\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\131\209\133\208\176", 
    [162] = "pepper roni (\208\191\208\184\209\134\209\134\208\176) \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\129\208\188\208\181\209\130\208\176\208\189\209\139", 
    [163] = "METAN HVH", 
    [164] = "\208\168\208\146\208\149\208\148\208\161\208\154\208\152\208\153 \208\161\208\162\208\158\208\155 \208\147\208\160\208\152\208\147\208\158\208\160\208\152\208\175 \208\155\208\149\208\159\208\161\208\144", 
    [165] = "\208\144\208\144\208\144\208\144\208\144 \208\154\208\171\208\151\208\155\208\144\208\160 \208\154\208\163\208\162\208\144\208\154 \208\145\208\144\208\161 \208\144\208\168\208\144\208\155\208\144\208\156\208\144\208\157\208\144\208\144\208\144 \208\145\208\152\208\155\208\175\208\175\208\175 \208\173\208\163\208\163\208\163", 
    [166] = "Z V", 
    [167] = "\208\161\208\155\208\171\208\168\208\163 ZOV", 
    [168] = "\208\162\208\174\208\164\208\175\208\175\208\175\208\154 (\208\159\208\144\208\162\208\160\208\152\208\154)", 
    [169] = "GuGu_Zha_IIIagu", 
    [170] = "GyGaBait", 
    [171] = "ebaWu_V_KaWu (Z)", 
    [172] = "\208\156\208\144\208\156\208\152\208\157\208\158 \208\159\208\160\208\158\208\162\208\152\208\146\208\158\208\160\208\149\208\167\208\152\208\149", 
    [173] = "Nell\209\143\209\135\208\186\208\176 UwU", 
    [174] = "\208\164\208\184\208\187\209\140\208\188 \194\171\208\163\208\187\209\139\208\177\208\186\208\176\194\187", 
    [175] = "\208\154\208\190\209\130\208\187\208\181\209\130\208\190\209\129\209\139 \208\184\208\183 z\209\139\209\128\208\176", 
    [176] = "\208\154\208\176\208\186\208\176\208\190 \208\177\208\190\208\177\208\181\209\128", 
    [177] = "\208\164\208\176\208\187\209\140\209\136\208\184\208\178\208\176\209\143 \209\131\209\130\208\186\208\176", 
    [178] = "\208\160\209\139\209\129\208\186\208\176\208\189\208\184\208\181 \208\189\208\184\208\182\208\189\208\181\208\185 \209\135\208\176\209\129\209\130\208\184 \209\130\208\181\208\187\208\176", 
    [179] = "\208\179\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183", 
    [180] = "\209\130\209\131\208\176\208\187\208\181\209\130\208\189\209\139\208\185 \209\131\209\130\209\142\208\179", 
    [181] = "\208\147\208\176\208\183\208\190\208\178\208\176\208\189\208\184\209\143 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131", 
    [182] = "\209\129\208\191\208\184\209\128\208\176\208\187\209\140 \208\188\208\176\208\189\209\139", 
    [183] = "\208\159\208\190\208\180\208\186\208\190\208\178\208\176 \209\129\209\128\208\176\208\186\208\190\209\130\208\176\208\189\208\176", 
    [184] = "\208\148\209\131\208\191\208\187\208\190 \209\133\208\190\208\188\209\143\208\186\208\176", 
    [185] = "\208\145\208\181\208\187\209\140\209\135\208\184\208\185 \208\176\209\131\208\187", 
    [186] = "\208\175\208\151\208\171\208\154 \208\162\208\149\208\155\208\144", 
    [187] = "\209\130\209\142\208\187\209\140\208\191\208\176\208\189\208\190\208\178\209\139\208\181 \208\179\208\190\209\128\209\139 \209\128\208\176\208\180\208\190\209\129\209\130\208\184", 
    [188] = "\208\161\209\139\209\128 \208\177\209\139\208\177 \209\128\209\139\209\128", 
    [189] = "\208\168\208\184\208\188\208\191\208\176\208\189Z\208\181 (\208\190\208\177\208\184\208\180\208\186\208\176)", 
    [190] = "\208\155\208\190\208\182\208\189\209\139\208\181 \208\190\209\130\209\129\209\130\208\176\208\178\208\176\208\189\208\184\209\143", 
    [191] = "\208\146\208\177\208\184\208\178 / \208\178\209\139\208\177\208\184\208\178 \208\183\209\131\208\177\208\190\208\178 \208\179.\208\163\209\128\209\142\208\191\208\184\208\189\209\129\208\186", 
    [192] = "\208\147\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183\209\131\208\185 \208\189\208\176\209\133", 
    [193] = "\208\151\208\181\208\189\208\184\209\134\208\176 \208\190\208\186\208\190", 
    [194] = "Zorix(csgo)", 
    [195] = "\208\159\208\184\208\180\208\181\209\128 \208\191\208\176\208\185\208\180\208\181\209\128", 
    [196] = "\208\151\209\131\208\177\209\139 \208\188\209\131\208\180\209\128\208\190\209\129\209\130\208\184", 
    [197] = "\208\169\208\181\208\186\208\190\209\130\208\189\208\190\208\181 \209\130\208\181\209\128\208\181\208\177\208\190\208\189\209\140\208\186\208\176\208\189\209\140\208\181", 
    [198] = "ZELTR1X", 
    [199] = "ZOLDY1337", 
    [200] = "K1neXj.", 
    [201] = "Evolvex", 
    [202] = "ANGELS HVH", 
    [203] = "\208\168\208\181\209\129\209\130\208\176\209\143 \208\191\209\143\209\130\208\186\208\176", 
    [204] = "\208\156\208\190\208\183\208\190\208\187\208\184\209\129\209\130\209\139\208\185 \209\136\208\176\208\187\208\190\208\191\208\176\208\185", 
    [205] = "\209\130\209\142\209\128\208\181\208\188\209\129\208\186\208\184\208\185 \209\131\208\183\209\131\209\128\208\191\208\176\209\130\208\190\209\128", 
    [206] = "\208\161\209\130\208\190\209\143\208\186 \208\191\209\139\209\133\209\130\209\131\208\189", 
    [207] = "\208\157\208\176\209\130\208\190\208\191\209\130\209\139\209\136\208\184", 
    [208] = "\208\157\208\176\208\177\209\128\208\176\208\187 \208\180\208\190\208\187\208\179\208\190\208\178", 
    [209] = "\208\151\208\176\208\177\208\184\208\178 \208\186\208\176\208\187\209\140\209\143\208\189\208\190\208\178", 
    [210] = "\208\162\209\131\209\128\208\189\208\184\209\135\208\186\208\190\208\178\208\176\209\143 \208\183\208\176\208\177\208\184\208\178\208\186\208\176", 
    [211] = "\208\162\209\128\208\181\208\189\208\184\209\128\208\190\208\178\208\186\208\176 \208\191\208\190\208\180 \208\180\208\190\208\182\208\180\208\181\208\188", 
    [212] = "\208\148\209\128\208\190\209\135\209\131 \209\129\209\130\208\190\209\143", 
    [213] = "\208\153\208\190\208\182\208\184\208\186 \208\182\209\131\209\133\208\187\209\139\208\185", 
    [214] = "\208\149\209\133\208\184\208\180\208\189\208\176\209\143 \209\133\208\176\209\128\209\143", 
    [215] = "\208\154\208\176\208\185\209\132\208\181\209\134\208\186\208\184\208\185 \208\186\209\131\208\188\208\176\209\128\209\135\208\184\208\186", 
    [216] = "\208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [217] = "SANCHEZJ X FIPP", 
    [218] = "\208\147\208\149\208\158\208\160\208\147\208\152\208\153 \208\164\208\144\208\156\208\163\208\162\208\152\208\155\208\158\208\146", 
    [219] = "\208\144\208\151\208\144\208\151\208\144\208\151\208\144\208\151\208\144 \208\144\208\151\208\155\208\144\208\147\208\158\208\160", 
    [220] = "\208\160\208\181\208\177\208\181\208\189\208\190\208\186 \208\191\208\190\208\180\208\186\208\184\208\180\209\139\209\136\209\140", 
    [221] = "\208\148\208\149\208\162\208\152 \208\146 \208\159\208\158\208\148\208\146\208\144\208\155\208\149", 
    [222] = "\208\161\208\162\208\152\208\146\208\144\208\165\208\144", 
    [223] = "\208\164\209\128\208\190\209\129\209\130 \209\129\208\189\208\181\208\185\208\186 \208\184 \208\191\208\176\209\128\208\189\208\184\209\136\208\176", 
    [224] = "\208\162\208\152\208\156\208\158\208\164\208\149\208\153 \208\152 \208\149\208\147\208\158 \208\148\208\160\208\163\208\147 \208\159\208\172\208\175\208\157\208\171\208\153 \208\149\208\147\208\158\208\160", 
    [225] = "\208\151\208\176\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189\208\189\209\139\208\185 \209\129\208\186\208\176\208\185\208\191", 
    [226] = "\208\148\208\158\208\154\208\162\208\158\208\160 \208\145\208\160\208\144\208\163\208\157? \209\129\208\187\209\131\209\136\208\176\209\142.", 
    [227] = "\208\144\208\160\208\158\208\156\208\144\208\162 \208\151\208\152\208\160\208\144\208\159\208\162\208\158\208\160\208\161\208\144 \208\161\208\161\208\171\208\162 \208\146 \208\160\208\144\208\154\208\158\208\146\208\152\208\157\208\163", 
    [228] = "\208\161\208\154\208\144\208\144\208\144\208\153", 
    [229] = "\208\148\208\190\208\186\209\130\208\190\209\128 \208\177\208\176\208\177\209\131\208\189", 
    [230] = "\208\189\208\184\209\130\209\128\208\176\209\130 \209\132\208\176\208\177\209\131\209\128\208\184\209\130\208\176", 
    [231] = "\209\135\208\181\209\128\208\189\208\190\208\179\208\190\208\187\208\190\208\178\208\186\208\176))", 
    [232] = "\208\161\209\129\209\139\208\186\208\176\208\189\209\140\208\181 \208\178 \209\130\208\176\208\183\208\184\208\186", 
    [233] = "\208\187\208\184\208\186\209\130\208\190\209\132\208\176\209\130 \208\189\208\176\209\130\209\128\208\184\209\143", 
    [234] = "\208\156\209\139\209\130\209\140\208\181 \208\178 \208\177\208\184\208\180\208\190\208\189\208\181", 
    [235] = "\208\189\208\184\208\191\208\190\209\128\209\130\208\176\208\188 \208\178 \209\128\208\176\208\186\208\190\208\178\208\184\208\189\208\181", 
    [236] = "\208\178\209\139\208\179\209\131\208\187\208\184\208\178\208\176\209\130\209\140 \208\186\208\190\208\187\208\177\208\176\209\129\209\131 \208\178\208\188\208\181\209\129\209\130\208\190 \209\129\208\190\208\177\208\176\208\186\208\184 \208\189\208\176 \208\177\208\176\208\187\208\186\208\190\208\189\208\181", 
    [237] = "\208\147\208\184\208\191\208\191\208\190\208\191\208\190\209\130\208\176\208\188 \209\129\209\139\209\128\208\189\209\139\208\185", 
    [238] = "\208\183\209\131\208\191\208\184\209\132\208\176\208\187\209\140\208\189\209\139\208\185 \208\189\208\176\208\183\208\176\208\187\209\140\208\189\209\139\208\185 \209\129\208\191\209\128\208\181\208\185 \208\180\208\187\209\143 \208\189\208\190\208\179\209\130\208\181\208\185", 
    [239] = "\208\159\208\184\208\180\208\190\209\128\209\129\208\186\208\184\208\181 \209\129\209\139\209\128\208\189\208\184\208\186\208\184", 
    [240] = "\208\179\208\190\208\179\208\184 \208\189\208\176 \209\131\209\128\208\190\208\179\208\184", 
    [241] = "GoGiMan777", 
    [242] = "\208\154\208\176\209\128\208\176\208\188\208\181\208\187\209\140\208\189\209\139\208\181 \208\189\208\190\208\179\208\190\209\130\208\190\209\135\208\186\208\184", 
    [243] = "\208\180\208\181\209\128\208\181\208\178\209\143\208\189\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\208\186\208\190", 
    [244] = "\208\176\209\128\208\177\209\131\208\183\208\189\209\139\208\181 \209\129\208\187\208\176\208\189\209\134\209\139", 
    [245] = "hey? MACARENAA", 
    [246] = "\209\130\209\128\208\184\209\134\208\181\209\128\208\176\208\191\209\130\208\190\209\128\209\129", 
    [247] = "\208\165\208\190\209\128\208\190\209\136\208\176\209\143 \208\190\208\180\208\181\208\182\208\180\208\176", 
    [248] = "LXNER \209\128\208\181\208\191\208\184\209\128", 
    [249] = "\208\156\208\190\208\180\208\189\209\139\208\185 \208\191\209\128\208\184\208\179\208\190\208\178\208\190\209\128", 
    [250] = "\209\129\209\130\209\131\208\180\208\181\208\189\209\130", 
    [251] = "\208\160\208\181\208\187\208\184\208\183 sqwore", 
    [252] = "\209\133\208\176\208\185\208\191\208\181\209\128\208\191\208\190\208\191 \209\129\208\176\208\188\208\176\209\128\208\176", 
    [253] = "18\208\180\208\178\208\176\208\180\209\134\208\181\209\130\208\184\208\189", 
    [254] = "\208\166\208\184\209\130\209\128\209\131\209\129 \208\190\209\130 \208\183\209\131\208\180\208\176", 
    [255] = "\208\166\208\184\209\130\209\128\208\184\208\189\208\190\208\178\209\139\208\185 \208\186\208\176\209\136\208\181\208\187\209\140", 
    [256] = "\208\162\208\176\208\189\208\180\209\131\208\188 \208\178\208\181\209\128\208\180\208\181 \209\132\208\190\209\128\209\130\208\181", 
    [257] = "\208\162\208\144\208\145\208\163\208\157 \208\147\208\158\208\161\208\162\208\149\208\153", 
    [258] = "\208\158\208\155\208\149\208\147 \208\162\208\152\208\157\208\172\208\154\208\158\208\164\208\164", 
    [259] = "SAILOR MOON \208\160\208\158\208\145\208\149\208\160\208\162 \208\161 \208\144\208\160\208\145\208\163\208\151\208\158\208\156", 
    [260] = "\208\154\208\158\208\151\208\144\208\165\208\161\208\162\208\144\208\157 \208\171\208\171\208\171\208\171\208\171\208\144\208\144\208\144\208\144\208\144\208\144\208\144", 
    [261] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 \209\129\208\191\208\184\209\128\208\184\208\180\208\190\208\189\208\190\208\178", 
    [262] = "\208\146\208\176\209\133\208\184\208\180 \208\177\208\176\208\177\208\181\208\178", 
    [263] = "\208\161\209\131\209\128\208\184\208\186\208\176\209\130\208\189\209\139\208\185 \209\130\209\131\209\136\208\186\208\176\208\189\209\135\208\184\208\186", 
    [264] = "\208\144\208\183\208\184\208\183 \209\136\208\176\208\178\208\181\209\128\209\136\209\143\208\189", 
    [265] = "\208\178\208\184\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [266] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\187\209\139\209\129\209\139\208\188 \208\188\209\131\208\182\208\184\208\186\208\190\208\188", 
    [267] = "\208\180\208\181\208\189\209\140\208\179\208\184 \208\184 \208\191\208\176\209\133\209\131\209\135\208\184\208\181 \208\189\208\190\208\179\208\184", 
    [268] = "\208\154\208\176\209\128\208\176\209\129\209\140 \209\129\208\190 \209\129\209\130\209\128\208\176\208\183\208\176\208\188\208\184", 
    [269] = "\208\160\208\171\208\145\208\144 \208\156\208\158\208\149\208\153 \208\156\208\149\208\167\208\162\208\152", 
    [270] = "\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\151\208\172", 
    [271] = "\208\162\209\131\208\189\208\181\209\134 \208\190\209\130 \209\133\208\176\208\187\208\184\208\186\208\184", 
    [272] = "\208\154\208\176\208\188\208\177\208\176\208\187\208\176 \208\178 \208\178\208\176\208\189\208\189\208\181", 
    [273] = "\208\186\208\176\208\187\209\140\209\143\208\189\208\184\208\183\208\176\209\134\208\184\209\143 \208\191\209\128\208\190\209\136\208\187\208\176 \209\131\209\129\208\191\208\181\209\136\208\189\208\190\240\159\140\185", 
    [274] = "\209\136\208\184\209\136\208\186\208\176 \208\178 \208\188\209\139\209\136\208\186\208\181", 
    [275] = "\208\159\208\187\208\190\209\130\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\209\135\208\186\208\190", 
    [276] = "\208\187\208\190\208\191\208\176\209\129\209\130\208\184 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189\208\176", 
    [277] = "\208\154\209\131\208\188\208\176\209\128\208\189\208\176\209\143 \209\129\208\181\209\129\209\129\208\184\209\143", 
    [278] = "\208\186\208\187\208\176\208\178\208\184\208\176\209\130\209\131\209\128\208\176 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\130\208\184\208\186\208\176", 
    [279] = "\208\159\209\128\208\190\208\177\208\184\209\128\208\186\208\176 \208\177\208\184\208\190\208\187\208\190\208\179\208\184\209\135\208\186\208\184", 
    [280] = "\208\183\208\181\208\187\208\181\208\189\208\190\208\181 \208\189\208\181\208\177\208\190 \208\178 \208\183\208\176\208\186\208\176\209\130\208\181", 
    [281] = "\209\130\208\181\208\188\208\189\208\190\208\181 \208\190\208\183\208\176\209\128\208\181\208\189\208\184\208\181 \209\130\208\181\208\191\208\187\208\176", 
    [282] = "\208\191\208\181\208\189\209\143\209\137\208\181\208\181 \209\129\209\135\208\176\209\129\209\130\209\140\208\181", 
    [283] = "\209\129\208\190 \209\129\208\186\208\184\209\130\209\131\208\187\209\140\208\186\208\190\208\185 \208\178 \208\188\208\188\209\131\208\187\209\142", 
    [284] = "\208\177\208\190\208\179\208\176\209\130\209\139\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\186\208\184\209\128\208\186\208\190\209\128\208\190\208\178\208\176", 
    [285] = "\208\152\208\179\209\128\208\176\209\142 \208\186\208\176\208\186 fifty", 
    [286] = "\208\186\208\190\209\128\208\190\208\178\208\176 \209\128\208\184\208\188\208\183\208\176\208\186\209\129\208\176", 
    [287] = "\208\160\208\176\208\188\208\190\208\189\209\139 \208\190\209\130 \209\129\208\181\209\128\208\181\208\179\208\184", 
    [288] = "\208\191\209\131\209\130\208\184\208\187\209\140\209\132\208\176\209\130 \208\179\209\131\208\187\209\140\208\183\208\176\208\189\209\130\208\184\209\143 (\208\191\209\128\208\184\208\178\208\181\209\130)", 
    [289] = "\209\128\208\176\209\132\209\139 \208\190\209\130 Raffaello", 
    [290] = "\208\186\209\128\208\176\209\129\208\189\208\176\209\143 \208\188\208\176\209\136\208\184\208\189\208\176 \209\129 \208\180\208\181\209\128\208\181\208\178\208\190\208\188 \208\190\209\130 \208\191\208\184\209\130\208\190\208\187\209\140\208\180\209\139", 
    [291] = "\208\159\209\128\208\184\208\186\208\190\208\187\209\140\208\189\209\139\208\185 \208\191\209\131\208\180\208\184\208\189\208\179 \208\190\209\130 \208\191\208\190\208\189\209\135\208\184\208\186\208\176", 
    [292] = "\208\186\208\190\208\182\208\176\208\189\208\176\209\143 \209\129\209\130\208\181\208\189\208\176", 
    [293] = "\208\191\208\190\208\180\209\129\209\130\208\190\208\187\209\140\208\189\209\139\208\181 \208\191\208\190\208\187\209\131\208\191\208\190\208\186\208\181\209\128\209\139", 
    [294] = "\208\176\208\188\209\129\209\130\208\181\209\128\208\180\208\176\208\188 \208\179\208\184\208\187\209\140\208\179\208\190\208\189\208\176", 
    [295] = "\208\151\208\178\208\190\208\189\208\190\208\186 \208\189\208\176 \209\131\209\128\208\190\208\186", 
    [296] = "\208\162\208\176\208\177\209\131\209\128\208\181\209\130 \208\190\209\135\208\186\208\184 \209\131\209\129\209\139", 
    [297] = "\208\167\208\184\209\130\208\176\209\142 \209\128\208\181\208\191\209\135\208\176\208\179\209\131", 
    [298] = "\208\167\208\152\208\159\208\161\208\152 \208\158\208\162 \208\160\208\149\208\157\208\149\208\147\208\144\208\162\208\144 \208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\158\208\147\208\158", 
    [299] = "\208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\152\208\153 MALIK163ONMYNECK", 
    [300] = "\208\157\208\158\208\146\208\171\208\153 \208\160\208\149\208\159\208\152\208\160", 
    [301] = "\208\146\208\163\208\156\208\159\208\152\208\160", 
    [302] = "\208\189\208\190\209\129\208\176\209\130\208\190\208\181 \209\131\208\181\208\177\208\184\209\137\208\181", 
    [303] = "\209\136\208\181\209\129\209\130\208\190\208\181 \209\135\209\131\208\178\209\129\209\130\208\178\208\190", 
    [304] = "\208\182\208\190\208\191\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\184\208\186\209\130", 
    [305] = "\208\167\208\152\208\162\208\149\208\160\208\171 \208\152\208\156\208\149\208\174\208\162 6 \208\167\208\163\208\146\208\162\208\161\208\146\208\158", 
    [306] = "\208\162\208\160\208\149\208\162\208\152\208\153 \208\147\208\155\208\144\208\151 \208\157\208\144 \208\159\208\160\208\144\208\146\208\158\208\153 \208\169\208\149\208\154\208\149", 
    [307] = "\208\159\208\158\208\148\208\145\208\158\208\160\208\158\208\148\208\158\208\154 \208\146 \208\160\208\144\208\151\208\146\208\144\208\155 \208\161 \208\157\208\158\208\161\208\158\208\160\208\158\208\147\208\158\208\156", 
    [308] = "\208\147\208\157\208\152\208\155\208\158\208\153 \208\163\208\162\208\174\208\147", 
    [309] = "\208\159\208\172\208\175\208\157\208\144\208\175 \208\148\208\171\208\157\208\175", 
    [310] = "\208\145\208\149\208\168\208\149\208\157\208\171\208\153 \208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [311] = "\208\159\209\140\209\143\208\189\209\139\208\185 \208\191\209\139\208\187\208\181\209\129\208\190\209\129", 
    [312] = "UWU GANG", 
    [313] = "\208\153\208\190\208\177\208\189\209\131\209\130\208\184\208\185 \208\181\208\182\208\184\208\186", 
    [314] = "\208\149\208\182\208\184\208\186 \208\178 \209\130\209\131\208\188\208\176\208\189\208\181", 
    [315] = "\208\156\208\176\208\189\209\131\208\187 \208\178 \208\183\208\190\208\190\208\191\208\176\209\128\208\186\208\181", 
    [316] = "\209\130\208\181\208\188\208\189\209\139\208\185 \208\178\208\176\208\187\208\181\209\130", 
    [317] = "\208\189\209\142\209\133\208\189\209\131\208\187 \208\191\208\190\208\180\208\188\209\139\209\133\208\176\209\128\208\184\208\186", 
    [318] = "\209\131\209\136\208\176\209\129\209\130\208\190 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\177\209\128\208\190\208\178\208\184", 
    [319] = "\208\191\208\190\209\133\208\190\208\182\209\131 \208\189\208\176 \209\143\208\189\208\180\208\181\208\186\209\129 \208\177\209\128\208\176\209\131\208\183\208\181\209\128", 
    [320] = "\208\161\208\187\208\190\208\189 \208\189\208\176 \208\186\209\128\208\190\208\186\208\190\208\180\208\184\208\187\208\181", 
    [321] = "\208\184\208\189\208\180\209\142\208\186 \208\178 \208\188\208\176\209\129\208\187\208\181", 
    [322] = "\208\177\209\131\209\128\208\180\209\142\208\186 \209\129 \208\191\209\128\208\184\208\186\208\190\208\187\208\190\208\188", 
    [323] = "\208\186\208\184\208\181\208\178\209\129\208\186\208\176\209\143 \208\186\208\190\209\130\208\187\208\181\209\130\208\176", 
    [324] = "\209\136\208\184\208\187\208\190 \208\189\208\176 \208\188\209\139\208\187\208\190", 
    [325] = "\208\145\208\176\208\177\209\131 \208\189\208\176 \208\186\208\176\208\188\208\181\208\189\209\140", 
    [326] = "\209\134\209\131\208\186\208\181\209\128\208\177\208\181\209\128\208\179 \208\191\208\176\208\189\208\183\208\181\209\128\209\132\208\176\209\131\209\129\209\130 1337", 
    [327] = "\208\183\208\176\208\191\208\190\209\128\208\190\208\182\209\140\208\181 9000", 
    [328] = "\208\156\208\190\209\129\208\186\208\178\208\184\209\135 65", 
    [329] = "\209\143 \209\135\209\130\208\190 \208\191\208\190\209\133\208\190\208\182 \208\189\208\176 \208\176\208\177\208\190\208\189\208\181\208\189\209\130\208\176", 
    [330] = "\208\161\208\181\209\128\208\181\208\179\208\176 \208\180\209\131\209\128\208\189\209\139\208\185", 
    [331] = "\208\184\208\178\208\176\208\189 \208\189\208\176\208\178\208\184", 
    [332] = "\208\158\209\130\208\178\208\181\209\130 \208\189\208\176 \209\130\208\190\208\188 \208\186\208\190\208\189\209\134\208\181", 
    [333] = "\208\161\208\178\208\181\209\130 \208\178 \208\189\208\176\209\135\208\176\208\187\208\181 \208\181\208\187\208\186\208\184", 
    [334] = "\209\129\208\181\209\128\208\179\208\181\208\185 \209\132\208\176\208\186\208\181\208\187", 
    [335] = "\209\133\209\131\208\185\208\191\208\176\209\129\209\130\209\128\208\184\208\191\209\129", 
    [336] = "\209\133\209\131\208\185\208\191\208\176\209\135\208\184\208\191\209\129", 
    [337] = "\208\165\209\131\208\185\208\191\208\176\209\129\208\190\208\187\209\140", 
    [338] = "\208\165\209\131\208\185\208\191\208\176\208\177\209\131\209\128\208\179\208\181\209\128", 
    [339] = "\208\160\208\184\209\129 \209\129 \208\186\208\176\209\129\209\139\208\188\208\176\208\186\208\190\208\188", 
    [340] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \208\188\208\190\209\130\209\139\208\179\208\176", 
    [341] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \209\130\208\176\208\186\209\139\209\136", 
    [342] = "\209\135\208\184\209\132\208\184\209\128\208\190\208\186 \209\129 \208\179\208\190\209\128\209\143\209\137\208\184\208\188 \208\186\208\190\209\130\208\190\208\188", 
    [343] = "\208\158\208\189\208\176 \209\129 \208\154\208\176\208\183\208\176\209\133\209\129\209\130\208\176\208\189\208\176", 
    [344] = "\208\157\208\176\209\129\208\178\208\176\208\185 \208\189\208\181 \208\186\208\184\208\180\208\176\208\181\208\188 \209\141\209\130\208\190 \209\133\208\176\209\128\208\176\208\188 \209\133\208\176\209\128\208\176\208\188", 
    [345] = "\209\131\209\129\208\176\209\130\208\190\208\181 \208\191\208\190\208\183\208\190\209\128\208\184\209\137\208\181", 
    [346] = "\208\163\209\130\209\128\208\181\208\189\208\189\208\184\208\185 \208\189\208\176\208\188\208\176\208\183 \208\191\208\190\208\180 \208\186\208\176\208\189\209\131\208\189 \208\189\208\190\208\178\208\190\208\179\208\190 \208\179\208\190\208\180\208\176", 
    [347] = "\208\188\209\139 \208\189\208\181 \208\180\208\181\208\187\208\176\208\181\208\188 \209\130\209\128\208\176\208\191 \208\188\209\139 \208\180\208\181\208\187\208\176\208\181\208\188 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\189\208\190\208\179\209\130\208\184", 
    [348] = "\209\131\208\183\208\177\208\181\208\186 \209\128\209\131\209\129\209\129\208\186\208\184\208\185", 
    [349] = "\208\157\208\176 \208\189\208\190\209\129\209\131 \208\179\208\181\209\128\208\190\208\184\208\189", 
    [350] = "\208\151\208\176\208\178\208\184\209\129\208\184\208\188\209\139\208\185 \209\129\208\176\208\188\208\190\208\178\208\176\209\128", 
    [351] = "\209\129\208\184\208\189\208\184\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\191\208\190\208\186\208\190\209\128\208\184\208\187\208\184 \208\189\208\181\208\177\208\190", 
    [352] = "ZV \209\136\208\188\208\176\208\187\209\140 \208\178 \208\191\208\187\208\181\209\135\208\181", 
    [353] = "\208\148\208\181\209\132\208\181\208\186\209\130\208\189\209\139\208\185 \208\191\208\181\209\128\209\132\208\190\209\128\208\176\209\130\208\190\209\128", 
    [354] = "\209\129\208\176\208\188\208\190\208\178\209\139\209\128\208\176\208\182\208\176\209\142\209\137\208\184\208\185 \208\189\208\184\208\186\209\129\208\178\208\176\209\128", 
    [355] = "\208\189\208\176\209\129\209\130\208\190\209\143\209\137\208\184\208\185 \208\191\209\131\208\177\208\181\209\128\209\130\208\176\208\189\209\130", 
    [356] = "Gloria damn", 
    [357] = "\208\176\208\189\209\130\208\190\208\187\208\190\208\179\208\184\209\143 \208\176\208\189\209\130\208\190\208\189\208\176", 
    [358] = "gloria fuck", 
    [359] = "cocki \209\143\208\186\208\184", 
    [360] = "\208\186\208\184\209\130\208\176\208\185\209\129\208\186\208\184\208\185 \209\128\208\181\208\191", 
    [361] = "\209\134\209\131\209\132\208\176\208\189\208\183\209\142 \209\132\208\176\208\188\208\181\209\128\208\179\208\181 (\209\133\208\178\209\133)", 
    [362] = "\208\186\209\131\209\130\208\176\208\187\208\177\209\139\208\186 \209\136\209\131\209\128\208\176\208\177\208\183\208\184\208\186", 
    [363] = "\209\130\209\131\208\191\208\190\208\185 \209\131\209\128\208\190\208\180", 
    [364] = "\209\129\209\131\208\188\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \208\178\208\184\209\130\208\176\208\187\209\140\208\186\208\184", 
    [365] = "\209\135\208\181\209\128\208\181\208\191\208\176 \208\178 \208\176\209\132\208\179\208\176\208\189\208\184\209\129\209\130\208\176\208\189\208\181 \208\191\209\140\209\142\209\130 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189", 
    [366] = "\208\191\208\184\209\130\209\140 \208\181\208\180\209\131 \208\181\209\129\209\130\209\140 \208\178\208\190\208\180\209\131", 
    [367] = "\208\182\208\181\208\187\209\130\208\190\208\178\208\190\208\187\208\190\209\129\209\139\208\185 \208\191\208\176\209\129\208\191\208\190\209\128\209\130", 
    [368] = "\208\191\208\184\208\183\208\180\208\181\209\134 \208\188\208\181\208\189\209\143 \209\128\208\176\209\129\208\191\208\181\209\128\208\187\208\190 \208\189\208\176\209\133\209\131\208\185 \209\135\208\181\208\187", 
    [369] = "\208\151\208\176\208\187\208\190\208\179 \209\131\209\129\208\191\208\181\209\133\208\190\208\178", 
    [370] = "\208\160\209\139\208\177\208\176 \208\178 \208\186\208\187\209\143\209\128\208\181", 
    [371] = "\208\147\209\128\208\190\208\188\208\190\209\132\208\190\208\189", 
    [372] = "\208\168\209\131\208\177\208\176 \208\191\208\190\208\180 \209\129\208\181\208\187\208\181\208\180\208\186\208\190\208\185", 
    [373] = "\208\156\208\176\208\189\209\131\208\176\208\187 \208\191\208\190 \208\188\208\176\208\189\209\131\208\187\208\176\208\188", 
    [374] = "\208\157\208\152\208\154\208\158\208\147\208\148\208\144 \208\157\208\149 \208\159\208\160\208\158\208\152\208\147\208\160\208\171\208\146\208\144\208\162\208\172", 
    [375] = "\208\159\209\143\209\130\209\140\208\180\208\181\209\129\209\143\209\130", 
    [376] = "\209\129\208\181\208\188\209\140\209\129\208\190\209\130 \208\180\208\181\209\129\209\143\209\130\209\140", 
    [377] = "\208\179\209\128\209\143\208\188 \208\176\209\128\208\177\209\131\209\129\208\176", 
    [378] = "\208\178\208\181\209\129 \209\133\208\176\209\135\208\176", 
    [379] = "1\209\133\208\177\208\181\209\130", 
    [380] = "yamete kudasai ^^", 
    [381] = "\208\159\209\128\208\184\208\181\209\133\208\176\208\187\208\176 \209\135\208\184\209\133\209\131\208\176\209\133\209\131\208\176", 
    [382] = "\209\135\208\184\209\133\208\189\209\131\208\187 \208\177\208\181\208\183 \209\129\208\187\208\181\208\183", 
    [383] = "\208\176\208\187\209\140\208\191\208\181\208\189\208\184\209\129\209\130 \208\178 \208\191\208\181\209\129\208\186\208\181", 
    [384] = "\208\145\208\176\208\189\208\176\208\189\208\190\208\178\209\139\208\185 \209\128\208\176\208\185", 
    [385] = "\208\150\208\181\208\187\209\130\208\190\208\186 \208\189\208\176 \209\135\208\184\208\187\208\184\208\191\208\184\208\183\208\180\209\128\208\184\208\186\208\181", 
    [386] = "\208\147\208\190\208\178\208\190\209\128\209\143\209\137\208\184\208\185 \208\191\208\190\209\128\209\130\209\129\208\184\208\179\208\176\209\128", 
    [387] = "\208\159\208\181\209\128\208\181\208\178\208\181\209\128\208\189\209\131\209\130\208\176\209\143 \208\186\208\176\208\189\208\176\209\128\208\181\208\185\208\186\208\176", 
    [388] = "\208\182\208\181\209\129\209\130\208\186\208\184\208\185 \208\186\208\184\208\189\208\190\209\130\208\181\208\176\209\130\209\128", 
    [389] = "\208\151\208\184\208\188\208\189\208\181\208\181 \208\187\208\181\209\130\208\190", 
    [390] = "\209\130\209\128\208\181\209\130\208\184\208\185 \208\191\208\190\208\180\208\177\208\190\209\128\208\190\208\180\208\190\208\186", 
    [391] = "\208\155\209\140\209\142 \208\187\208\184\208\188\208\190\208\189\208\176\208\180 \208\188\208\184\208\188\208\190 \209\128\209\130\208\176", 
    [392] = "\208\159\208\181\209\128\208\181\208\183\208\176\209\128\209\143\208\182\208\176\209\142 \208\186\208\181\209\132\208\184\209\128", 
    [393] = "\208\186\208\176\209\136\208\187\209\143\209\142 \209\133\209\141\209\136\208\181\208\188", 
    [394] = "\208\156\208\190\208\187\208\190\208\186\208\190 2 \208\187\208\184\209\130\209\128\208\176", 
    [395] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\186\208\176\208\191\209\131\209\129\209\130\208\190\208\185 \208\180\208\176 \208\181\209\137\208\181 \208\184 \209\129 \208\191\208\181\209\135\208\181\208\189\209\140\208\181\208\188", 
    [396] = "\208\180\208\176 \208\184 \208\178 \208\191\209\128\208\184\208\186\209\131\209\129\208\186\209\131 cock\208\176 \208\186\208\190\208\187\208\176", 
    [397] = "\208\165\208\184\209\130\209\128\209\139\208\185 \208\186\209\129\208\184\208\188\208\184", 
    [398] = "\208\157\208\190\208\178\208\190\208\188\208\190\208\180\208\189\209\139\208\185 vertu", 
    [399] = "\208\184\208\189\209\130\208\181\209\128\208\189\208\181\209\130 \208\186\208\176\208\177\208\181\208\187\209\140", 
    [400] = "\208\162\208\181\208\187\208\181\209\132\208\190\208\189\208\189\209\139\208\185 \209\136\208\189\209\131\209\128", 
    [401] = "\209\136\208\189\209\131\209\128 \208\180\208\187\209\143 \208\177\209\128\208\184\209\130\209\140\209\143", 
    [402] = "\208\145\208\176\209\128\208\176\208\177\208\176\209\136\208\186\208\176 \208\177\208\181\208\183 \208\186\208\176\209\130\209\131\209\136\208\181\208\186", 
    [403] = "\208\156\208\190\208\186\209\128\208\190\208\181 \208\177\208\181\208\187\209\140\208\181", 
    [404] = "\209\143\208\185\209\134\208\190 \209\129\208\190 \209\129\209\130\209\128\208\184\208\191\209\129\208\190\208\188 \208\178 \209\131\209\133\208\181", 
    [405] = "\208\188\208\190\208\184 \208\188\209\139\209\129\208\187\208\181 \208\189\208\176 \208\188\209\139\208\187\208\181 \208\190\208\189\208\184 so low", 
    [406] = "\208\146 \208\167\208\149\208\160\208\157\208\158\208\156 \208\161\208\159\208\152\208\161\208\154\208\149", 
    [407] = "\209\130\208\184\208\186\208\184 \209\130\208\190\208\186\208\184 \208\190\209\130 \208\177\209\131\209\128\208\188\208\176\208\187\208\180\209\139", 
    [408] = "\209\131\209\136\208\176\209\129\209\130\209\139\208\185 \209\136\208\190\208\186\208\190\208\187\208\176\208\180", 
    [409] = "\208\188\209\139\209\136\208\186\208\176 \208\187\208\190\208\179\208\184YECH", 
    [410] = "MinYEAT", 
    [411] = "\208\156\208\152\208\157\208\172\208\149\208\162", 
    [412] = "\208\147\208\176\209\128\208\184\208\186 \208\180\208\190 \209\135\208\181\208\187\209\142\209\129\209\130\208\184", 
    [413] = "\208\158\208\177\208\184\208\180\209\135\208\181\208\178\209\139\208\185 \209\136\208\186\208\190\208\187\209\140\208\189\208\184\208\186", 
    [414] = "\208\159\208\144\208\145\208\144\208\154\208\144 \208\163\208\155\208\171\208\145\208\144\208\154\208\144", 
    [415] = "\208\163\208\165-\208\162\208\171-\208\150-\208\153\208\158!", 
    [416] = "\208\149\209\130\208\184\208\182\208\184 \208\191\208\176\209\129\209\129\208\176\209\130\208\184\208\182\208\184", 
    [417] = "\208\168\208\184\208\187\208\190 \208\178 \209\128\209\139\208\187\208\190", 
    [418] = "\208\155\208\176\208\185\209\132 \208\178 \208\186\208\176\208\185\209\132", 
    [419] = "\208\154\208\144\208\153\208\164 \208\155\208\144\208\153\208\164", 
    [420] = "Zahar bobr", 
    [421] = "\208\146\208\181\209\128\208\176 \208\178 \208\183\208\176\208\188\208\176\209\143", 
    [422] = "15 \208\179\208\190\208\180 \209\141\209\130\208\190 \208\178\208\176\208\182\208\189\208\190", 
    [423] = "\208\154\208\190\208\187\209\143 \209\133\208\181\208\185\209\130\208\181\209\128", 
    [424] = "\208\191\208\184\209\129\209\142\208\189\208\184\209\129\209\130\209\139\208\185 \209\132\208\176\208\186\209\131\208\187\209\140\209\130\208\181\209\130", 
    [425] = "\208\178\209\129\208\181\208\188 \209\129\208\191\208\176\209\130\209\140", 
    [426] = "\208\178\208\181\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [427] = "\208\188\209\143\209\129\208\189\208\190\208\185 \208\188\208\181\208\180\208\178\208\181\208\180", 
    [428] = "first day with neverlose.cc", 
    [429] = "https://vk.com/avtopodborkazahstan", 
    [430] = "\208\163\209\129\208\191\208\181\209\136\208\189\209\139\208\185 \208\176\208\178\209\130\208\190\208\188\208\190\208\177\208\184\208\187\208\184\209\129\209\130", 
    [431] = "\208\176\208\178\209\130\208\190\208\191\208\190\208\180\208\177\208\190\209\128 KZ", 
    [432] = "\208\145\208\176\208\183\208\190\208\178\208\176\209\143 \208\184 \208\191\208\190\208\187\208\189\208\176\209\143", 
    [433] = "\208\188\208\176\208\185 \208\176\208\187\208\188\208\176\208\185\208\180\209\139!", 
    [434] = "\208\144\209\129\209\130\209\139 \209\130\208\176\208\183\208\176, \209\129\209\130\208\176\208\186\208\176\208\189\208\180\208\176\209\128\209\139 \209\129\208\176\209\131"
};
do
    local l_v1404_18, l_v1556_16, l_v1557_15, l_v1558_15, l_v1559_15, l_v1560_18 = v1404, v1556, v1557, v1558, v1559, v1560;
    l_v1559_15 = function()
        -- upvalues: l_v1557_15 (ref)
        if l_v1557_15 == nil then
            return;
        else
            common.set_name(l_v1557_15);
            l_v1557_15 = nil;
            return;
        end;
    end;
    l_v1560_18 = function()
        -- upvalues: l_v1559_15 (ref)
        l_v1559_15();
    end;
    v1561 = nil;
    v1562 = function()
        -- upvalues: l_v1557_15 (ref), l_v1556_16 (ref), l_v1404_18 (ref), l_v1560_18 (ref)
        if l_v1557_15 == nil then
            l_v1557_15 = l_v1556_16:string();
        end;
        common.set_name(l_v1404_18.input:get());
        events.shutdown(l_v1560_18, true);
    end;
    v1563 = function()
        -- upvalues: l_v1559_15 (ref), l_v1560_18 (ref)
        l_v1559_15();
        events.shutdown(l_v1560_18, false);
    end;
    v1564 = function()
        -- upvalues: l_v1558_15 (ref), l_v1404_18 (ref)
        local v3364 = l_v1558_15[math.random(1, #l_v1558_15)];
        l_v1404_18.input:set(v3364);
    end;
    l_v1404_18.set_button:set_callback(v1562);
    l_v1404_18.reset_button:set_callback(v1563);
    l_v1404_18.generate_button:set_callback(v1564);
end;
v910 = nil;
v911 = {
    [1] = "crash", 
    [2] = "flush", 
    [3] = "buildmodelforworld", 
    [4] = "envmap", 
    [5] = "demos", 
    [6] = "+mat_texture_list", 
    [7] = "cc_random", 
    [8] = "kdtree_test", 
    [9] = "spincycle", 
    [10] = "-mat_texture_list", 
    [11] = "ai_test_los", 
    [12] = "cl_soundscape_printdebuginfo"
};
for v3365 = 1, #v911 do
    v1003 = v911[v3365];
    do
        local l_v3365_0 = v3365;
        cvar[v1003]:set_callback(function()
            -- upvalues: l_v3365_0 (ref)
            print("\aFF4040FFerror CV" .. l_v3365_0);
            return false;
        end);
    end;
end;