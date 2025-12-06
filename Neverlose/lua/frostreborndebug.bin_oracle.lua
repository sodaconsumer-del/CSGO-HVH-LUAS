local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/inspect");
local v4 = "\226\128\138";
local v5 = nil;
local l_dev_break_after_count_0 = cvar.dev_break_after_count;
do
    local l_l_dev_break_after_count_0_0 = l_dev_break_after_count_0;
    local function v8()
        -- upvalues: l_l_dev_break_after_count_0_0 (ref)
        return l_l_dev_break_after_count_0_0:int() ~= 0;
    end;
    v5 = function(v9)
        -- upvalues: v8 (ref)
        if not v8() then
            return;
        else
            print(v9);
            return;
        end;
    end;
end;
l_dev_break_after_count_0 = function(v10, v11)
    for v12 = 1, #v10 do
        if v10[v12] == v11 then
            return v12;
        end;
    end;
    return nil;
end;
local function v15(...)
    local v13 = "";
    for v14 = 1, select("#", ...) do
        v13 = v13 .. select(v14, ...);
    end;
    return v13;
end;
local function v17(v16)
    return math.floor(v16 + 0.5);
end;
local function v21(v18, v19)
    return function(...)
        -- upvalues: v19 (ref), v18 (ref)
        local v20 = table.pack(pcall(v19, ...));
        if not v20[1] then
            print_raw(string.format("\aff4040ff[\"%s\"] failed: %s", v18, v20[2]));
            return nil;
        else
            return table.unpack(v20, 2, v20.n);
        end;
    end;
end;
v5("begin_script");
local v22 = {};
local v23 = common.get_username();
v22.name = "Frost";
v22.user = v23;
v22.build = "Debug";
v5("begin_trial");
v23 = {};
local v24 = "frost trial";
local v25 = nil;
do
    local l_v24_0, l_v25_0 = v24, v25;
    local function v31()
        -- upvalues: l_v25_0 (ref), l_v24_0 (ref)
        if l_v25_0 == nil then
            return nil;
        else
            local v28 = common.get_unixtime();
            local v29 = db[l_v24_0] or {
                first_startup = v28
            };
            local v30 = v28 - v29.first_startup;
            db["frost trial"] = v29;
            if l_v25_0 < v30 then
                error("Trial expired");
            end;
            return l_v25_0 - v30;
        end;
    end;
    v23.process = function()
        -- upvalues: v31 (ref)
        return v31();
    end;
    v23.time = v31();
end;
v5("begin_aux");
v24 = nil;
v24 = {};
v25 = 0.083333336;
v24.lerp = function(v32, v33, v34)
    return v32 + v34 * (v33 - v32);
end;
do
    local l_v25_1 = v25;
    v24.to_foot = function(v36)
        -- upvalues: l_v25_1 (ref)
        return v36 * l_v25_1;
    end;
    v24.closest_ray_point = function(v37, v38, v39, v40)
        local v41 = v39 - v37;
        local v42 = v38 - v37;
        local v43 = v42.x * v42.x + v42.y * v42.y;
        local v44 = (v41.x * v42.x + v41.y * v42.y) / v43;
        if v40 then
            if v44 <= 0 then
                return v37;
            elseif v44 >= 1 then
                return v38;
            end;
        end;
        return v37 + v44 * v42;
    end;
end;
v5("begin_software");
v25 = nil;
v25 = {
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
v5("begin_debug_overlay");
local v45 = nil;
v45 = {};
local v46 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ");
local v47 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ");
local v48 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", v46, v46, v46, v46));
local v49 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", v46, v46));
local v50 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", v46, v46, v46, v46, v47, v47);
do
    local l_v46_0, l_v47_0, l_v48_0, l_v49_0, l_v50_0 = v46, v47, v48, v49, v50;
    v45.box = function(v56, v57, v58, v59, v60, v61, v62, v63, v64)
        -- upvalues: l_v46_0 (ref), l_v48_0 (ref)
        v56 = l_v46_0(v56:unpack());
        v57 = l_v46_0(v57:unpack());
        v58 = l_v46_0(v58:unpack());
        v59 = l_v46_0(v59:unpack());
        l_v48_0(v56, v57, v58, v59, v60, v61, v62, v63, v64);
    end;
    v45.line = function(v65, v66, v67, v68, v69)
        -- upvalues: l_v46_0 (ref), l_v49_0 (ref)
        v65 = l_v46_0(v65:unpack());
        v66 = l_v46_0(v66:unpack());
        l_v49_0(v65, v66, v67.r, v67.g, v67.b, v67.a, v68, v69);
    end;
    v45.box_new = function(v70, v71, v72, v73, v74, v75, v76)
        -- upvalues: l_v46_0 (ref), l_v47_0 (ref), l_v50_0 (ref)
        v70 = l_v46_0(v70:unpack());
        v71 = l_v46_0(v71:unpack());
        v72 = l_v46_0(v72:unpack());
        v73 = l_v46_0(v73:unpack());
        v74 = l_v47_0(v74:unpack());
        v75 = l_v47_0(v75:unpack());
        l_v50_0(v70, v71, v72, v73, v74, v75, v76);
    end;
end;
v5("begin_event_system");
v46 = nil;
v46 = {};
v47 = {};
v47.__index = v47;
v47.new = function(v77)
    return setmetatable({
        count = 0, 
        list = {}
    }, v77);
end;
v47.__len = function(v78)
    return v78.count;
end;
v47.__call = function(v79, v80, v81)
    if v81 == false then
        return v79:unset(v80);
    else
        return v79:set(v80);
    end;
end;
v47.unset = function(v82, v83)
    -- upvalues: l_dev_break_after_count_0 (ref)
    local v84 = l_dev_break_after_count_0(v82.list, v83);
    if v84 ~= nil then
        v82.count = v82.count - 1;
        table.remove(v82.list, v84);
    end;
    return v82;
end;
v47.set = function(v85, v86, v87)
    -- upvalues: l_dev_break_after_count_0 (ref)
    if v87 == false then
        return v85:unset(v86);
    else
        if not l_dev_break_after_count_0(v85.list, v86) then
            v85.count = v85.count + 1;
            table.insert(v85.list, v86);
        end;
        return v85;
    end;
end;
v47.fire = function(v88, ...)
    local l_list_0 = v88.list;
    for v90 = 1, #l_list_0 do
        l_list_0[v90](...);
    end;
    return v88;
end;
v48 = {};
do
    local l_v47_1, l_v48_1 = v47, v48;
    v49 = function(v93, v94)
        -- upvalues: l_v47_1 (ref)
        local v95 = rawget(v93, v94);
        if v95 == nil then
            v95 = l_v47_1:new();
            rawset(v93, v94, v95);
        end;
        return v95;
    end;
    do
        local l_v49_1 = v49;
        l_v48_1.new = function(_)
            -- upvalues: l_v49_1 (ref)
            return setmetatable({}, {
                __index = l_v49_1
            });
        end;
    end;
    v46.new = function(_)
        -- upvalues: l_v48_1 (ref)
        return l_v48_1:new();
    end;
end;
v5("begin_menu");
v47 = nil;
v47 = {};
v48 = bit.lshift(1, 0);
v49 = {};
v49.__index = v49;
v49.__newindex = function(v99, v100, v101)
    v99[0][v100] = v101;
end;
do
    local l_v48_2, l_v49_2 = v48, v49;
    l_v49_2.__index = function(v104, v105)
        -- upvalues: l_v49_2 (ref), l_v48_2 (ref)
        local v106 = rawget(l_v49_2, v105);
        if v106 ~= nil then
            return v106;
        else
            local v107 = rawget(v104, v105);
            if v107 ~= nil then
                return v107;
            else
                local v108 = v104[0][v105];
                if v108 == nil then
                    return nil;
                elseif type(v108) == "function" then
                    local function v112(...)
                        -- upvalues: v104 (ref), l_v48_2 (ref), v108 (ref)
                        local v109 = {};
                        local v110 = select("#", ...);
                        for v111 = 1, v110 do
                            v109[v111] = select(v111, ...);
                        end;
                        if bit.band(v104.flags, l_v48_2) ~= 0 then
                            v104:fire_callbacks(v109, v110);
                        end;
                        if v109[1] == v104 then
                            v109[1] = v104[0];
                        end;
                        return v108(unpack(v109, 1, v110));
                    end;
                    rawset(v104, v105, v112);
                    return v112;
                else
                    return v108;
                end;
            end;
        end;
    end;
    l_v49_2.new = function(v113, v114)
        -- upvalues: l_v48_2 (ref)
        local v115 = {
            flags = 0, 
            [0] = v114, 
            callbacks = {}
        };
        v115.flags = bit.bor(v115.flags, l_v48_2);
        return setmetatable(v115, v113);
    end;
    l_v49_2.fire_callbacks = function(v116, ...)
        local v117 = rawget(v116, "callbacks");
        for v118 = 1, #v117 do
            v117[v118](...);
        end;
        return v116;
    end;
    l_v49_2.get_flag = function(v119, v120)
        return bit.band(v119.flags, v120) ~= 0;
    end;
    l_v49_2.set_flag = function(v121, v122, v123)
        if v123 then
            v121.flags = bit.bor(v121.flags, v122);
        else
            v121.flags = bit.band(v121.flags, bit.bnot(v122));
        end;
        return v121;
    end;
    l_v49_2.set_callback = function(v124, v125)
        -- upvalues: l_dev_break_after_count_0 (ref)
        local v126 = rawget(v124, "callbacks");
        if l_dev_break_after_count_0(v126, v125) == nil then
            table.insert(v126, v125);
        end;
        return v124;
    end;
    l_v49_2.unset_callback = function(v127, v128)
        -- upvalues: l_dev_break_after_count_0 (ref)
        local v129 = rawget(v127, "callbacks");
        local v130 = l_dev_break_after_count_0(v129, v128);
        if v130 ~= nil then
            table.remove(v129, v130);
        end;
        return v127;
    end;
    v47.group_flags = {
        callbacks = l_v48_2
    };
    v47.cast = function(v131)
        -- upvalues: l_v49_2 (ref)
        return l_v49_2:new(v131);
    end;
    v47.create = function(...)
        -- upvalues: l_v49_2 (ref)
        return l_v49_2:new(ui.create(...));
    end;
end;
v5("begin_logging_system");
v48 = nil;
v48 = {};
v49 = "ui\\beepclear.wav";
v50 = "resource\\warning.wav";
local l_play_0 = cvar.play;
local function v137(v133, v134)
    -- upvalues: v22 (ref)
    local v135 = " ";
    local v136 = string.format("\a%s[%s]\aDEFAULT", v133:to_hex(), v22.name:lower());
    print_raw(v136 .. v135 .. v134);
end;
do
    local l_v49_3, l_v50_1, l_l_play_0_0, l_v137_0 = v49, v50, l_play_0, v137;
    v48.log = function(v142)
        -- upvalues: l_v137_0 (ref)
        l_v137_0(color(255, 255, 255, 200), v142);
    end;
    v48.success = function(v143)
        -- upvalues: l_v137_0 (ref), l_l_play_0_0 (ref), l_v49_3 (ref)
        l_v137_0(color(100, 175, 255), v143);
        l_l_play_0_0:call(l_v49_3);
    end;
    v48.error = function(v144)
        -- upvalues: l_v137_0 (ref), l_l_play_0_0 (ref), l_v50_1 (ref)
        l_v137_0(color(250, 50, 50, 255), v144);
        l_l_play_0_0:call(l_v50_1);
    end;
end;
v5("begin_windows");
v49 = nil;
v49 = {};
v50 = ui.create("##WINDOWS");
v50:visibility(false);
l_play_0 = {};
v137 = {};
local v145 = vector();
local v146 = vector();
local v147 = false;
local v148 = false;
local v149 = 0;
local v150 = vector();
local v151 = vector();
local v152 = nil;
local v153 = nil;
do
    local l_v50_2, l_l_play_0_1, l_v137_1, l_v145_0, l_v146_0, l_v147_0, l_v148_0, l_v149_0, l_v150_0, l_v151_0, l_v152_0, l_v153_0 = v50, l_play_0, v137, v145, v146, v147, v148, v149, v150, v151, v152, v153;
    local v182 = {
        new = function(v166, v167)
            -- upvalues: l_v50_2 (ref), l_l_play_0_1 (ref), l_v137_1 (ref)
            local v168 = {
                name = v167, 
                pos = vector(), 
                size = vector(), 
                anchor = vector(0, 0), 
                updated = false, 
                dragging = false, 
                item_x = l_v50_2:value(string.format("%s_x", v167), ""), 
                item_y = l_v50_2:value(string.format("%s_y", v167), "")
            };
            l_l_play_0_1[v167] = v168;
            l_v137_1[#l_v137_1 + 1] = v168;
            return setmetatable(v168, v166);
        end, 
        set_pos = function(v169, v170)
            local v171 = render.screen_size();
            if v171.x == 0 and v171.y == 0 then
                return;
            else
                local v172 = v170:clone();
                v172.x = math.clamp(v172.x, 0, v171.x - v169.size.x);
                v172.y = math.clamp(v172.y, 0, v171.y - v169.size.y);
                v169.pos = v172;
                return;
            end;
        end, 
        set_size = function(v173, v174)
            local v175 = render.screen_size();
            if v175.x == 0 and v175.y == 0 then
                return;
            else
                local v176 = v174 - v173.size;
                v173.size = v174;
                v173:set_pos(v173.pos - v176 * v173.anchor);
                return;
            end;
        end, 
        set_anchor = function(v177, v178)
            v177.anchor = v178;
        end, 
        is_hovering = function(v179)
            return v179.hovering;
        end, 
        is_dragging = function(v180)
            return v180.dragging;
        end, 
        update = function(v181)
            v181.updated = true;
        end
    };
    v182.__index = v182;
    local function v186(v183, v184, v185)
        return v183.x >= v184.x and v183.y >= v184.y and v183.x <= v185.x and v183.y <= v185.y;
    end;
    local function v191()
        -- upvalues: l_v145_0 (ref), l_v150_0 (ref), l_v146_0 (ref), l_v147_0 (ref), l_v148_0 (ref), l_v149_0 (ref), l_v151_0 (ref)
        local v187 = ui.get_mouse_position();
        local v188 = common.is_button_down(1);
        local l_frametime_0 = globals.frametime;
        l_v145_0 = v187:clone();
        l_v150_0 = l_v145_0 - l_v146_0;
        l_v146_0 = l_v145_0;
        l_v147_0 = v188;
        l_v148_0 = v188 and l_v149_0 < 0;
        local v190;
        if v188 then
            if l_v149_0 < 0 then
                v190 = 0;
                goto label0 --[[  true, true  ]];
            else
                v190 = l_v149_0 + l_frametime_0;
                if v190 then
                    goto label0;
                end;
            end;
        end;
        v190 = -1;
        ::label0::;
        l_v149_0 = v190;
        if l_v148_0 then
            l_v151_0 = l_v145_0;
        end;
    end;
    local function _()
        -- upvalues: l_v137_1 (ref)
        for v192 = 1, #l_v137_1 do
            local v193 = l_v137_1[v192];
            local l_pos_0 = v193.pos;
            local l_size_0 = v193.size;
            render.rect_outline(l_pos_0, l_pos_0 + l_size_0, color(0, 0, 0, 100));
        end;
    end;
    local function v202()
        -- upvalues: l_v137_1 (ref), v186 (ref), l_v145_0 (ref), l_v152_0 (ref)
        local v197 = nil;
        if ui.get_alpha() > 0 then
            for v198 = 1, #l_v137_1 do
                local v199 = l_v137_1[v198];
                local l_pos_1 = v199.pos;
                local l_size_1 = v199.size;
                if v199.updated and v186(l_v145_0, l_pos_1, l_pos_1 + l_size_1) then
                    v197 = v199;
                end;
            end;
        end;
        l_v152_0 = v197;
    end;
    local function v205()
        -- upvalues: l_v147_0 (ref), l_v148_0 (ref), l_v152_0 (ref), l_v137_1 (ref), l_v153_0 (ref)
        if l_v147_0 then
            if l_v148_0 and l_v152_0 ~= nil then
                for v203 = 1, #l_v137_1 do
                    local v204 = l_v137_1[v203];
                    if v204 == l_v152_0 then
                        table.remove(l_v137_1, v203);
                        table.insert(l_v137_1, v204);
                        break;
                    end;
                end;
                l_v153_0 = l_v152_0;
                return;
            else
                return;
            end;
        else
            l_v153_0 = nil;
            return;
        end;
    end;
    local function v208()
        -- upvalues: l_v137_1 (ref)
        for v206 = 1, #l_v137_1 do
            local v207 = l_v137_1[v206];
            v207.updated = false;
            v207.hovering = false;
            v207.dragging = false;
        end;
    end;
    local function v209()
        -- upvalues: l_v152_0 (ref)
        if l_v152_0 == nil then
            return;
        else
            l_v152_0.hovering = true;
            return;
        end;
    end;
    local function v211()
        -- upvalues: l_v153_0 (ref), l_v150_0 (ref)
        if l_v153_0 == nil then
            return;
        else
            local v210 = l_v153_0.pos + l_v150_0;
            l_v153_0:set_pos(v210);
            l_v153_0.dragging = true;
            return;
        end;
    end;
    local function v217()
        -- upvalues: l_v137_1 (ref)
        local v212 = render.screen_size();
        for v213 = 1, #l_v137_1 do
            local v214 = l_v137_1[v213];
            local v215 = v214.pos.x / v212.x;
            local v216 = v214.pos.y / v212.y;
            v214.item_x:set(tostring(v215));
            v214.item_y:set(tostring(v216));
        end;
    end;
    local function v223()
        -- upvalues: l_v137_1 (ref)
        local v218 = render.screen_size();
        for v219 = 1, #l_v137_1 do
            local v220 = l_v137_1[v219];
            local v221 = tonumber(v220.item_x:get());
            local v222 = tonumber(v220.item_y:get());
            if v221 ~= nil and v222 ~= nil then
                v220:set_pos(v218 * vector(v221, v222));
            end;
        end;
    end;
    local function v224()
        -- upvalues: v191 (ref), v202 (ref), v205 (ref), v208 (ref), v209 (ref), v211 (ref)
        v191();
        v202();
        v205();
        v208();
        v209();
        v211();
    end;
    local function v226(v225)
        -- upvalues: l_v152_0 (ref), l_v153_0 (ref)
        if l_v152_0 ~= nil or l_v153_0 ~= nil then
            v225.in_attack = 0;
            v225.in_attack2 = 0;
        end;
    end;
    local function v228(v227)
        -- upvalues: v217 (ref), v223 (ref)
        if v227 == "pre_save" then
            v217();
        end;
        if v227 == "post_load" then
            v223();
        end;
    end;
    v49.new = function(v229, v230, v231)
        -- upvalues: l_l_play_0_1 (ref), v182 (ref)
        local v232 = l_l_play_0_1[v229] or v182:new(v229);
        v232:set_pos(render.screen_size() * vector(v230, v231));
        return v232;
    end;
    v49.save_settings = function()
        -- upvalues: v217 (ref)
        v217();
    end;
    v49.load_settings = function()
        -- upvalues: v223 (ref)
        v223();
    end;
    v224 = v21("windows.on_render", v224);
    v226 = v21("windows.on_createmove", v226);
    v228 = v21("windows.on_config_state", v228);
    events.render(v224);
    events.createmove(v226);
    events.config_state(v228);
    utils.execute_after(0, function()
        -- upvalues: v223 (ref)
        v223();
    end);
end;
v5("begin_config_system");
v50 = nil;
v50 = {};
l_play_0 = {};
do
    local l_l_play_0_2 = l_play_0;
    v50.get = function()
        -- upvalues: l_l_play_0_2 (ref)
        return l_l_play_0_2;
    end;
    v50.add = function(v234, v235, v236)
        -- upvalues: l_l_play_0_2 (ref)
        l_l_play_0_2[v234] = {
            [1] = v235, 
            [2] = v236
        };
    end;
end;
v5("begin_motion");
l_play_0 = nil;
l_play_0 = {};
v137 = function(v237, v238, v239, v240)
    return v239 * v237 / v240 + v238;
end;
v145 = function()
    return globals.frametime;
end;
v146 = function(v241, v242, v243, v244, v245)
    if v244 <= 0 then
        return v243;
    elseif v245 <= v244 then
        return v243;
    else
        v242 = v241(v244, v242, v243 - v242, v245);
        if type(v242) == "number" then
            if math.abs(v243 - v242) < 0.001 then
                return v243;
            else
                local v246 = v242 % 1;
                if v246 < 0.001 then
                    return math.floor(v242);
                elseif v246 > 0.999 then
                    return math.ceil(v242);
                end;
            end;
        end;
        return v242;
    end;
end;
do
    local l_v137_2, l_v145_1, l_v146_1 = v137, v145, v146;
    l_play_0.interp = function(v250, v251, v252, v253)
        -- upvalues: l_v137_2 (ref), l_v146_1 (ref), l_v145_1 (ref)
        if not v253 then
            v253 = l_v137_2;
        end;
        if type(v251) == "boolean" then
            v251 = v251 and 1 or 0;
        end;
        return l_v146_1(v253, v250, v251, l_v145_1(), v252);
    end;
end;
v5("begin_render");
v137 = nil;
v145 = _G.render;
v146 = math.floor;
v147 = color(0, 0, 0, 0);
v148 = 1;
v149 = "s";
do
    local l_v145_2, l_v147_1, l_v148_1, l_v150_1, l_v151_1, l_v152_1, l_v153_1 = v145, v147, v148, v150, v151, v152, v153;
    l_v150_1 = function(v261)
        -- upvalues: l_v148_1 (ref)
        if l_v148_1 == 1 then
            return v261;
        else
            return v261 * l_v148_1;
        end;
    end;
    l_v151_1 = 1;
    l_v152_1 = {};
    l_v153_1 = color().alpha_modulate;
    local function v264(v262, v263)
        -- upvalues: l_v151_1 (ref), l_v147_1 (ref), l_v153_1 (ref)
        if l_v151_1 == 1 then
            return v262;
        elseif not v263 and l_v151_1 == 0 then
            return l_v147_1;
        else
            return l_v153_1(v262, l_v151_1, true);
        end;
    end;
    v137 = setmetatable({
        cheap = false, 
        dpi = l_v145_2.get_scale(2), 
        push_alpha = function(v265)
            -- upvalues: l_v152_1 (ref), l_v151_1 (ref)
            local v266 = #l_v152_1;
            if v266 > 255 then
                error("alpha stack exceeded 255 objects, report to developers");
            end;
            l_v152_1[v266 + 1] = v265;
            l_v151_1 = l_v151_1 * l_v152_1[v266 + 1] * (l_v152_1[v266] or 1);
        end, 
        pop_alpha = function()
            -- upvalues: l_v152_1 (ref), l_v151_1 (ref)
            local v267 = #l_v152_1;
            local l_l_v152_1_0 = l_v152_1;
            local l_v267_0 = v267;
            local v270 = nil;
            v267 = v267 - 1;
            l_l_v152_1_0[l_v267_0] = v270;
            l_v151_1 = v267 == 0 and 1 or l_v152_1[v267] * (l_v152_1[v267 - 1] or 1);
        end, 
        get_alpha = function(v271)
            -- upvalues: l_v152_1 (ref), l_v151_1 (ref)
            if v271 then
                return l_v152_1[v271];
            else
                return l_v151_1, #l_v152_1;
            end;
        end, 
        screen_size = function(v272)
            -- upvalues: l_v145_2 (ref), l_v148_1 (ref)
            return l_v145_2.screen_size() / (v272 and 1 or l_v148_1);
        end, 
        measure_text = function(v273, ...)
            -- upvalues: l_v145_2 (ref), l_v148_1 (ref)
            return l_v145_2.measure_text(v273, ...) / l_v148_1;
        end, 
        load_font = function(v274, v275, v276)
            -- upvalues: l_v145_2 (ref)
            return l_v145_2.load_font(v274, v275, v276 or "");
        end, 
        text = function(v277, v278, v279, v280, ...)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref), v137 (ref)
            l_v145_2.text(v277, l_v150_1(v278), v264(v279), v280, ...);
            if measure == true then
                return v137.measure_text(v277, v280, ...);
            else
                return;
            end;
        end, 
        blur = function(v281, v282, v283, v284, v285)
            -- upvalues: v137 (ref), l_v150_1 (ref), l_v151_1 (ref), l_v145_2 (ref)
            if v137.cheap then
                return;
            else
                if type(v285) == "table" then
                    for v286 = 1, 4 do
                        v285[v286] = l_v150_1(v285[v286] or 0);
                    end;
                else
                    v285 = l_v150_1(v285 or 0);
                end;
                local v287 = (v284 or 1) * l_v151_1;
                v283 = l_v150_1(v283 or 2);
                v284 = v287;
                if v284 > 0 and v283 > 0 then
                    l_v145_2.blur(l_v150_1(v281), l_v150_1(v282), v283, v284, v285);
                end;
                return;
            end;
        end, 
        shadow = function(v288, v289, v290, v291, v292, v293)
            -- upvalues: v137 (ref), l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            if v137.cheap then
                return;
            else
                l_v145_2.shadow(l_v150_1(v288), l_v150_1(v289), v264(v290), l_v150_1(v291 or 16), l_v150_1(v292 or 0), l_v150_1(v293 or 0));
                return;
            end;
        end, 
        line = function(v294, v295, v296)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            l_v145_2.line(l_v150_1(v294), l_v150_1(v295), v264(v296));
        end, 
        rect = function(v297, v298, v299, v300, v301)
            -- upvalues: l_v150_1 (ref), l_v145_2 (ref), v264 (ref)
            if type(v300) == "table" then
                for v302 = 1, 4 do
                    v300[v302] = l_v150_1(v300[v302] or 0);
                end;
            else
                v300 = l_v150_1(v300 or 0);
            end;
            l_v145_2.rect(l_v150_1(v297), l_v150_1(v298), v264(v299), v300, v301 or false);
        end, 
        rect_outline = function(v303, v304, v305, v306, v307, v308)
            -- upvalues: l_v150_1 (ref), l_v145_2 (ref), v264 (ref)
            if type(v307) == "table" then
                for v309 = 1, 4 do
                    v307[v309] = l_v150_1(v307[v309] or 0);
                end;
            else
                v307 = l_v150_1(v307 or 0);
            end;
            l_v145_2.rect_outline(l_v150_1(v303), l_v150_1(v304), v264(v305), l_v150_1(v306 or 0), v307, v308 or false);
        end, 
        gradient = function(v310, v311, v312, v313, v314, v315, v316)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            local v317 = v314 or v312;
            if not v315 then
                v315 = v313;
            end;
            l_v145_2.gradient(l_v150_1(v310), l_v150_1(v311), v264(v312, true), v264(v313, true), v264(v317, true), v264(v315, true), v316 or 0);
        end, 
        circle = function(v318, v319, v320, v321, v322)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            l_v145_2.circle(l_v150_1(v318), v264(v319), l_v150_1(v320), v321 or 0, v322 or 1);
        end, 
        circle_outline = function(v323, v324, v325, v326, v327, v328)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            l_v145_2.circle_outline(l_v150_1(v323), v264(v324), l_v150_1(v325), v326 or 0, v327 or 1, l_v150_1(v328 or 1));
        end, 
        circle_3d = function(v329, v330, v331, v332, v333)
            -- upvalues: l_v145_2 (ref), v264 (ref)
            l_v145_2.circle_3d(v329, v264(v330), v331, v332 or 0, v333 or 1, false);
        end, 
        circle_3d_outline = function(v334, v335, v336, v337, v338, v339)
            -- upvalues: l_v145_2 (ref), v264 (ref), l_v150_1 (ref)
            l_v145_2.circle_3d_outline(v334, v264(v335), v336, v337 or 0, v338 or 1, l_v150_1(v339 or 1));
        end, 
        circle_3d_gradient = function(v340, v341, v342, v343, v344, v345, v346)
            -- upvalues: l_v145_2 (ref), v264 (ref), l_v150_1 (ref)
            l_v145_2.circle_3d_gradient(v340, v264(v341), v264(v342), v343, v344 or 0, v345 or 1, l_v150_1(v346 or 1));
        end, 
        texture = function(v347, v348, v349, v350, v351, v352)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref), v264 (ref)
            if not v347 then
                return;
            else
                if not v350 then
                    v350 = color();
                end;
                l_v145_2.texture(v347, l_v150_1(v348), l_v150_1(v349 or vector(v347.width, v347.height)), v264(v350), v351 or "", v352 or 0);
                return;
            end;
        end, 
        push_clip_rect = function(v353, v354, v355)
            -- upvalues: l_v145_2 (ref), l_v150_1 (ref)
            l_v145_2.push_clip_rect(l_v150_1(v353), l_v150_1(v354), v355 or false);
        end
    }, {
        __index = l_v145_2
    });
end;
v5("begin_drag");
v145 = nil;
v146 = {};
v147 = nil;
v148 = color(255, 255, 255, 255);
v149 = function(v356, v357, v358)
    return v356.x >= v357.x and v356.x <= v358.x and v356.y >= v357.y and v356.y <= v358.y;
end;
v150 = v47.create("##DRAG");
v150:visibility(false);
v151 = v137.screen_size();
do
    local l_v147_2, l_v148_2, l_v149_1, l_v150_2, l_v151_2 = v147, v148, v149, v150, v151;
    v145 = {
        data = v146, 
        in_bounds = l_v149_1, 
        new = function(v364, v365)
            -- upvalues: v145 (ref), l_v150_2 (ref), l_v151_2 (ref), v17 (ref)
            if type(v365) ~= "table" then
                v365 = {};
            end;
            v145[v364.id] = {
                x = l_v150_2:slider(v364.id .. "::x", 0, 10000, v364.pos.x / l_v151_2.x * 10000), 
                y = l_v150_2:slider(v364.id .. "::y", 0, 10000, v364.pos.y / l_v151_2.y * 10000)
            };
            v145[v364.id].x:set_callback(function(v366)
                -- upvalues: v364 (ref), v17 (ref), l_v151_2 (ref)
                v364.pos.x = v17(v366:get() * 1.0E-4 * l_v151_2.x);
            end, true);
            v145[v364.id].y:set_callback(function(v367)
                -- upvalues: v364 (ref), v17 (ref), l_v151_2 (ref)
                v364.pos.y = v17(v367:get() * 1.0E-4 * l_v151_2.y);
            end, true);
            v364.__drag = {
                active = false, 
                locked = false, 
                point = vector(), 
                progress = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0
                }, 
                border = v365.border or {
                    [1] = vector(), 
                    [2] = oscreen
                }, 
                rulers = v365.rulers or {}, 
                on_release = v365.on_release, 
                on_held = v365.on_held, 
                on_active = v365.on_active, 
                config = v145[v364.id]
            };
            events.mouse_input:set(function()
                -- upvalues: v364 (ref)
                if ui.get_alpha() > 0 and (v364.__drag.hovered or v364.__drag.active) then
                    return false;
                else
                    return;
                end;
            end);
            events.dpi_change:set(function(_, _, _)
                -- upvalues: v145 (ref), v364 (ref)
                v145[v364.id].x:set(v145[v364.id].x.value);
                v145[v364.id].y:set(v145[v364.id].y.value);
            end);
        end, 
        process = function(v371)
            -- upvalues: v137 (ref), l_v149_1 (ref), l_v147_2 (ref), l_play_0 (ref), l_v148_2 (ref), l_v151_2 (ref)
            local l___drag_0 = v371.__drag;
            if l___drag_0.locked or ui.get_alpha() == 0 then
                return;
            else
                local v373 = ui.get_mouse_position() / v137.dpi;
                local v374 = ui.get_position();
                local v375 = ui.get_size();
                local v376 = ui.get_alpha() > 0 and common.is_button_down(1);
                local v377 = l_v149_1(v373, v371.pos, v371.pos + v371.size) and not l_v149_1(v373, v374 / v137.dpi, (v374 + v375) / v137.dpi);
                if v376 and l___drag_0.ready == nil then
                    local l_v377_0 = v377;
                    local v379 = v371.pos - v373;
                    l___drag_0.init = v371.pos:clone();
                    l___drag_0.point = v379;
                    l___drag_0.ready = l_v377_0;
                end;
                if v376 and l___drag_0.ready then
                    if l_v147_2 == nil and l___drag_0.on_held then
                        l___drag_0.on_held(v371, l___drag_0);
                    end;
                    l_v147_2 = l___drag_0.ready and l_v147_2 == nil and v371.id or l_v147_2;
                    l___drag_0.active = l_v147_2 == v371.id;
                elseif not v376 then
                    if l___drag_0.active and l___drag_0.on_release then
                        l___drag_0.on_release(v371, l___drag_0);
                    end;
                    l___drag_0.active = false;
                    local v380 = nil;
                    local v381 = nil;
                    local v382 = nil;
                    local v383 = nil;
                    l_v147_2 = nil;
                    l___drag_0.aligning = v383;
                    l___drag_0.init = v382;
                    l___drag_0.point = v381;
                    l___drag_0.ready = v380;
                end;
                local v384 = v371.pos * v137.dpi;
                local v385 = v371.size * v137.dpi;
                l___drag_0.hovered = v377 or l___drag_0.active;
                local v386 = {};
                local v387 = v384 + v385 * 0.5;
                local v388 = l___drag_0.point and (l___drag_0.point + v373) * v137.dpi or v384;
                l___drag_0.progress[1] = l_play_0.interp(l___drag_0.progress[1], l___drag_0.active, 0.1);
                l___drag_0.progress[2] = l_play_0.interp(l___drag_0.progress[2], l___drag_0.active or l___drag_0.hovered, 0.1);
                local v389 = l___drag_0.progress[1];
                local v390 = l___drag_0.progress[2];
                v137.push_alpha(ui.get_alpha());
                local _ = nil;
                local v392 = v371.pos - 4;
                local v393 = v371.pos + v371.size + 4;
                local v394 = l_v148_2:alpha_modulate(0.1 * (v390 * 0.65 + 0.35), true);
                v137.rect_outline(v392, v393, v394, 1, 4);
                v137.push_alpha(v389);
                if v389 > 0 and not common.is_button_down(162) then
                    v392 = (v388 + v385 * 0.5) / v137.dpi;
                    for _, v396 in ipairs(l___drag_0.rulers) do
                        v396[4] = v396[4] or {
                            [1] = 0
                        };
                        local v397 = v396[2] / v137.dpi;
                        local v398 = math.abs(v396[1] and v392.x - v397.x or v392.y - v397.y) < 10 * v137.dpi;
                        local l_v397_0 = v397;
                        local v400 = v396[1] and vector(v397.x + 1, v396[3] / v137.dpi) or vector(v396[3] / v137.dpi, v397.y + 1);
                        local v401 = v396[1] and 1 or 2;
                        if not v386[v401] then
                            v386[v401] = v398 and (v396[1] and v397.x - v371.size.x * 0.5 or v397.y - v371.size.y * 0.5) or nil;
                        end;
                        local v402 = math.abs(v396[1] and v387.x - v397.x or v387.y - v397.y);
                        l___drag_0.progress[4] = l_play_0.interp(l___drag_0.progress[4], v398 or v402 < 10 * v137.dpi, 0.1);
                        local v403 = l___drag_0.progress[4] * 0.1 + 0.05;
                        v137.rect(l_v397_0, v400, l_v148_2:alpha_modulate(v403, true));
                    end;
                    if l___drag_0.border[3] then
                        v393 = utilities.in_bounds(v371.pos, l___drag_0.border[1], l___drag_0.border[2] - v371.size * 0.5 - 1);
                        l___drag_0.progress[3] = l_play_0.interp(l___drag_0.progress[3], not v393, 0.1);
                        v394 = l___drag_0.progress[3];
                        v137.rect_outline(l___drag_0.border[1] / v137.dpi, l___drag_0.border[2] / v137.dpi, l_v148_2:alpha_modulate(v394 * 0.75 + 0.25, true), 1, 4);
                    end;
                end;
                v137.pop_alpha();
                v137.pop_alpha();
                if l___drag_0.active then
                    v392 = v388 / v137.dpi;
                    if common.is_button_down(160) then
                        v393 = l___drag_0.init:to(v392);
                        v394 = math.abs(v393.y);
                        local v404 = math.abs(v393.x);
                        if l___drag_0.aligning == nil then
                            if v394 > 0.9 then
                                l___drag_0.aligning = 0;
                            elseif v404 > 0.9 then
                                l___drag_0.aligning = 1;
                            end;
                        end;
                        if l___drag_0.aligning == 0 then
                            v392.x = l___drag_0.init.x;
                            v137.rect(vector(v392.x + v371.size.x * 0.5, 0), vector(v392.x + v371.size.x * 0.5 + 1, l_v151_2.y), color(255, 64));
                        elseif l___drag_0.aligning == 1 then
                            v392.y = l___drag_0.init.y;
                            v137.rect(vector(0, v392.y + v371.size.y * 0.5), vector(l_v151_2.x, v392.y + v371.size.y * 0.5 + 1), color(255, 64));
                        end;
                    end;
                    v393 = v386[1] or v392.x;
                    v392.y = v386[2] or v392.y;
                    v392.x = v393;
                    v393 = (l___drag_0.border[1] - v385 * 0.5) / v137.dpi;
                    v394 = (l___drag_0.border[2] - v385 * 0.5) / v137.dpi;
                    v371:set_position(math.clamp(v392.x, v393.x, math.min(v394.x, l_v151_2.x - v371.size.x)), (math.clamp(v392.y, v393.y, math.min(v394.y, l_v151_2.y - v371.size.y))));
                    if l___drag_0.on_active then
                        l___drag_0.on_active(v371, l___drag_0, v392);
                    end;
                end;
                return;
            end;
        end
    };
end;
v5("begin_widget");
v146 = nil;
v147 = v137.screen_size();
do
    local l_v147_3, l_v148_3, l_v149_2 = v147, v148, v149;
    l_v148_3 = function()
        -- upvalues: v137 (ref), l_v147_3 (ref)
        local v408 = v137.screen_size();
        if v408.x == 0 and v408.y == 0 then
            return l_v147_3;
        else
            if l_v147_3.x == 0 and l_v147_3.y == 0 then
                l_v147_3 = v408:clone();
            end;
            return v408;
        end;
    end;
    l_v149_2 = nil;
    l_v149_2 = {
        update = function(_)
            return 1;
        end, 
        paint = function(_, _, _)

        end, 
        set_position = function(v413, v414, v415)
            -- upvalues: l_v148_3 (ref)
            local v416 = nil;
            local v417 = nil;
            if type(v414) == "userdata" then
                local l_x_0 = v414.x;
                v417 = v414.y;
                v416 = l_x_0;
            else
                local l_v414_0 = v414;
                v417 = v415;
                v416 = l_v414_0;
            end;
            local v420 = l_v148_3();
            if v420.x == 0 and v420.y == 0 then
                return;
            else
                if v413.__drag then
                    if v416 then
                        v413.__drag.config.x:set(v416 / v420.x * 10000);
                    end;
                    if v417 then
                        v413.__drag.config.y:set(v417 / v420.y * 10000);
                    end;
                else
                    local l_pos_2 = v413.pos;
                    local l_pos_3 = v413.pos;
                    local v423;
                    if not v416 then
                        v423 = v413.pos.x;
                    else
                        v423 = v416;
                    end;
                    local v424;
                    if not v417 then
                        v424 = v413.pos.y;
                    else
                        v424 = v417;
                    end;
                    l_pos_3.y = v424;
                    l_pos_2.x = v423;
                end;
                return;
            end;
        end, 
        get_drag_position = function(v425)
            -- upvalues: l_v148_3 (ref)
            local v426 = v425.__drag and v425.__drag.config;
            if not v426 then
                return v425.pos;
            else
                local v427 = l_v148_3();
                if v427.x == 0 and v427.y == 0 then
                    return v425.pos;
                else
                    local v428 = v426.x:get();
                    local v429 = v426.y:get();
                    return vector(v428 * 1.0E-4 * v427.x, v429 * 1.0E-4 * v427.y);
                end;
            end;
        end, 
        get_drag_size = function(v430)
            return v430.size:clone();
        end, 
        __call = function(v431)
            -- upvalues: v137 (ref), v145 (ref), l_v149_2 (ref)
            local l___list_0 = v431.__list;
            local l___drag_1 = v431.__drag;
            if l___list_0 then
                local v434 = l___list_0.collect();
                l___list_0.active = 0;
                l___list_0.items = v434;
                for v435 = 1, #l___list_0.items do
                    if l___list_0.items[v435].active then
                        l___list_0.active = l___list_0.active + 1;
                    end;
                end;
            end;
            v431:sanitize_pos();
            v431.alpha = v431:update();
            v137.push_alpha(v431.alpha);
            if v431.alpha > 0 then
                if l___drag_1 then
                    v145.process(v431);
                end;
                if l___list_0 then
                    l_v149_2.traverse(v431);
                end;
                v431:paint(v431.pos, v431.pos + v431.size);
            end;
            v137.pop_alpha();
        end, 
        sanitize_pos = function(v436)
            -- upvalues: l_v148_3 (ref)
            local v437 = l_v148_3();
            if v437.x == 0 and v437.y == 0 then
                return;
            else
                local l___drag_2 = v436.__drag;
                local v439 = l___drag_2.border[1] - v436.size * 0.5;
                local v440 = l___drag_2.border[2] - v436.size * 0.5;
                local l_x_1 = v436.pos.x;
                local l_y_0 = v436.pos.y;
                v436.pos.x = math.clamp(v436.pos.x, v439.x, math.min(v440.x, v437.x - v436.size.x));
                v436.pos.y = math.clamp(v436.pos.y, v439.y, math.min(v440.y, v437.y - v436.size.y));
                if l_x_1 ~= v436.pos.x or l_y_0 ~= v436.pos.y then
                    v436:set_position(v436.pos.x, v436.pos.y);
                end;
                return;
            end;
        end, 
        enlist = function(v443, v444, v445, v446)
            v443.__list = {
                longest = 0, 
                active = 0, 
                items = {}, 
                progress = setmetatable({}, {
                    __mode = "k"
                }), 
                minwidth = v443.size.x, 
                collect = v444, 
                paint = v445, 
                rev = v446
            };
        end, 
        traverse = function(v447)
            -- upvalues: v137 (ref)
            local l___list_1 = v447.__list;
            local v449 = 0;
            local v450 = vector();
            local v451 = 0;
            l___list_1.longest = 0;
            l___list_1.active = v451;
            for v452 = 1, #l___list_1.items do
                local v453 = l___list_1.items[v452];
                local v454 = v453.name or v452;
                l___list_1.progress[v454] = l___list_1.progress[v454] or {
                    [1] = 0
                };
                local v455 = anima.condition(l___list_1.progress[v454], v453.active, 6, {
                    [1] = {
                        [1] = 1, 
                        [2] = 3
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                });
                if v455 > 0 then
                    v137.push_alpha(v455);
                    v450 = l___list_1.paint(v447, v453, v449, v455);
                    v137.pop_alpha();
                    local v456 = l___list_1.active + 1;
                    v449 = v449 + v450.y * v455;
                    l___list_1.active = v456;
                    l___list_1.longest = math.max(l___list_1.longest, v450.x);
                end;
            end;
            v447.size.x = anima.lerp(v447.size.x, math.max(l___list_1.longest, l___list_1.minwidth), 10, 0.5);
        end, 
        lock = function(v457, v458)
            if not v457.__drag then
                return;
            else
                v457.__drag.locked = v458 and true or false;
                return;
            end;
        end
    };
    l_v149_2.__index = l_v149_2;
    v146 = {
        new = function(v459, v460, v461, v462)
            -- upvalues: v145 (ref), l_v149_2 (ref)
            local v463 = {
                alpha = 1, 
                id = v459, 
                pos = v460, 
                size = v461, 
                progress = {
                    [1] = 0
                }
            };
            if v462 then
                v145.new(v463, type(v462) == "table" and v462 or nil);
            end;
            return setmetatable(v463, l_v149_2);
        end
    };
end;
v5("begin_text_anims");
v147 = nil;
v147 = {};
v148 = function(v464)
    local v465 = {};
    local v466 = 0;
    for v467 in string.gmatch(v464, ".[\128-\191]*") do
        v466 = v466 + 1;
        v465[v466] = v467;
    end;
    return v465, v466;
end;
do
    local l_v148_4 = v148;
    v147.gradient = function(v469, v470, v471, v472, v473)
        -- upvalues: l_v148_4 (ref)
        local v474 = {};
        local v475, v476 = l_v148_4(v469);
        local v477 = 1 / (v476 - 1);
        local v478 = v472.r - v471.r;
        local v479 = v472.g - v471.g;
        local v480 = v472.b - v471.b;
        local v481 = v472.a - v471.a;
        for v482 = 1, v476 do
            local v483 = v475[v482];
            local v484 = v470 % 2;
            if v484 > 1 then
                v484 = 2 - v484;
            end;
            local v485 = v471.r + v484 * v478;
            local v486 = v471.g + v484 * v479;
            local v487 = v471.b + v484 * v480;
            local v488 = v471.a + v484 * v481;
            local v489 = string.format("%02x%02x%02x%02x", v485, v486, v487, v488);
            table.insert(v474, "\a");
            table.insert(v474, v489);
            table.insert(v474, v483);
            v470 = v470 + v477 * (v473 or 1);
        end;
        return table.concat(v474);
    end;
end;
v5("begin_session");
v148 = nil;
v148 = {
    force_lethal = {
        updated_this_tick = false, 
        updated_division = false
    }, 
    hitchance = {
        updated_this_tick = false
    }
};
v5("begin_const");
v149 = nil;
v149 = {
    teams = {
        [1] = "T", 
        [2] = "CT"
    }, 
    states = {
        [0] = "Default", 
        [1] = "Standing", 
        [2] = "Slowwalking", 
        [3] = "Running", 
        [4] = "Ducking", 
        [5] = "Sneaking", 
        [6] = "In Air", 
        [7] = "In Air & Duck", 
        [8] = "Freestanding", 
        [9] = "On Peek"
    }
};
v5("begin_locker_system");
v150 = nil;
v150 = {};
v152 = ({
    Secret = 0, 
    Live = 1, 
    Debug = -1
})[v22.build];
v153 = {};
local function v492(v490, v491)
    v490:set(unpack(v491));
    v490:disabled(true);
end;
do
    local l_v152_2, l_v153_2, l_v492_0 = v152, v153, v492;
    local function v498()
        -- upvalues: l_v153_2 (ref), l_v492_0 (ref)
        for v496 = 1, #l_v153_2 do
            local v497 = l_v153_2[v496];
            l_v492_0(v497.item, v497.value);
        end;
    end;
    v150.is_locked = function(v499)
        -- upvalues: l_v152_2 (ref)
        if l_v152_2 == -1 then
            return false;
        elseif v499 == -1 then
            return true;
        else
            return v499 <= l_v152_2;
        end;
    end;
    v150.push = function(v500, v501, ...)
        -- upvalues: v150 (ref), l_v153_2 (ref), l_v492_0 (ref)
        if not v150.is_locked(v500) then
            return v501;
        else
            local v502 = {
                ...
            };
            if select("#", ...) == 0 then
                v502 = {
                    [1] = false
                };
            end;
            table.insert(l_v153_2, {
                item = v501, 
                value = v502
            });
            v501:set_callback(function(v503)
                -- upvalues: l_v492_0 (ref), v502 (ref)
                l_v492_0(v503, v502);
            end, true);
            return v501;
        end;
    end;
    local v505 = v21("locker_system.on_config_state", function(v504)
        -- upvalues: v498 (ref)
        if v504 == "pre_save" then
            v498();
        end;
    end);
    utils.execute_after(0, v498);
    events.config_state(v505);
end;
v5("begin_resource");
v151 = nil;
v151 = {};
v152 = 1;
v153 = 2;
v492 = v15("\a", "{Link Active}", ui.get_icon("house"));
local v506 = v15("\a", "{Link Active}", ui.get_icon("shield"));
local v507 = v15("\a", "{Link Active}", ui.get_icon("grid-2"));
local function v509(v508)
    -- upvalues: v4 (ref)
    return string.rep(v4, v508);
end;
local function v513(v510, v511)
    -- upvalues: v4 (ref)
    local v512 = string.rep(v4, v511);
    return v512 .. v510 .. v512;
end;
do
    local l_v509_0 = v509;
    local function v520(v515, v516, v517, v518, v519)
        -- upvalues: l_v509_0 (ref)
        return l_v509_0(v518) .. "\a" .. v515 .. v516 .. l_v509_0(v519) .. "\aDEFAULT" .. v517;
    end;
    local function v525(v521, v522, v523, v524)
        -- upvalues: v520 (ref)
        return v520("{Link Active}", v521, v522, v523, v524);
    end;
    local function v531(v526, v527, v528, v529, v530)
        -- upvalues: v520 (ref)
        return v520(v526, ui.get_icon(v527), v528, v529, v530);
    end;
    local function v536(v532, v533, v534, v535)
        -- upvalues: v531 (ref)
        return v531("{Link Active}", v532, v533, v534, v535);
    end;
    local function v543(v537, v538, v539, v540)
        -- upvalues: l_v509_0 (ref)
        local v541 = l_v509_0(v540);
        local v542 = l_v509_0(3);
        return v541 .. "\a" .. v537 .. ui.get_icon(v538) .. v542 .. "\aDEFAULT" .. v539 .. v541;
    end;
    local function v547(v544, v545, v546)
        -- upvalues: v543 (ref)
        return v543("{Link Active}", v544, v545, v546);
    end;
    local function v553(v548, v549, v550)
        -- upvalues: l_v509_0 (ref)
        local v551 = ui.get_icon(v549);
        local v552 = l_v509_0(v550);
        return v552 .. "\a" .. v548 .. v551 .. v552;
    end;
    local function v556(v554, v555)
        -- upvalues: v553 (ref)
        return v553("{Link Active}", v554, v555);
    end;
    local function v564(v557, v558)
        local v559 = v557:get();
        if #v559 == 0 then
            if v558 == nil then
                local v560 = v557:type();
                local v561 = v557:list();
                if v560 == "selectable" then
                    v558 = v561;
                elseif v560 == "listable" then
                    v558 = {};
                    for v562 = 1, #v561 do
                        v558[v562] = v562;
                    end;
                end;
            end;
            v559 = v558;
            v557:set(v558);
        end;
        v557:set_callback(function()
            -- upvalues: v557 (ref), v559 (ref)
            local v563 = v557:get();
            if #v563 > 0 then
                v559 = v563;
            else
                v557:set(v559);
            end;
        end);
    end;
    local v565 = {
        home = {
            location = v47.create(v492, "\a{Link Active}Location", v152), 
            profile = v47.create(v492, "\a{Link Active}Profile", v153), 
            activity = v47.create(v492, "\a{Link Active}Activity", v153), 
            config = v47.create(v492, "\a{Link Active}Be kind for everyone", v153)
        }, 
        antiaim = {
            selector = v47.create(v506, "##AA_SELECTOR", v153), 
            settings = v47.create(v506, "##AA_SETTINGS", v153), 
            builder = v47.create(v506, "##AA_BUILDER", v153), 
            state = v47.create(v506, "##AA_STATE", v153), 
            send = v47.create(v506, "##AA_SEND", v153), 
            settings_extra = v47.create(v506, "##AA_SETTINGS_EXTRA", v152)
        }, 
        features = {
            category = v47.create(v507, "##CATEGORY", v152), 
            visuals = v47.create(v507, "##VISUALS", v152), 
            render = v47.create(v507, "##RENDER", v153), 
            extra = v47.create(v507, "##EXTRA", v152), 
            ragebot = v47.create(v507, "##RAGEBOT", v153), 
            misc = v47.create(v507, "##MISC", v153), 
            movement = v47.create(v507, "##MOVEMENT", v152)
        }
    };
    local _ = nil;
    local v572 = v21("sidebar.on_render", function()
        -- upvalues: v22 (ref), v147 (ref)
        local v567 = ui.get_style();
        local v568 = v567["Link Active"];
        local v569 = v567["Disabled Text"];
        local v570 = string.format("%s\226\128\138", v22.name);
        local v571 = v147.gradient(v570, -globals.realtime, v568, v569);
        ui.sidebar(v571, "snowflake");
    end);
    events.render(v572);
    v572 = nil;
    local function v580(v573, v574, v575, v576, v577, v578)
        -- upvalues: l_v509_0 (ref)
        local v579 = "\a" .. v573:to_hex();
        if v578 then
            v579 = v579 .. "\194\187" .. l_v509_0(5);
        end;
        return (v579 .. l_v509_0(v576) .. ui.get_icon(v574)) .. l_v509_0(v577) .. v575;
    end;
    do
        local l_v580_0 = v580;
        local function v590(v582)
            -- upvalues: l_v580_0 (ref)
            local v583 = {};
            local v584 = {
                [1] = {
                    [1] = "user", 
                    [2] = "Profile", 
                    [3] = 1, 
                    [4] = 7
                }, 
                [2] = {
                    [1] = "chart-line", 
                    [2] = "Activity", 
                    [3] = 1, 
                    [4] = 6
                }, 
                [3] = {
                    [1] = "floppy-disks", 
                    [2] = "Local configs", 
                    [3] = 1, 
                    [4] = 6
                }
            };
            local v585 = ui.get_style("Link Active");
            for v586 = 1, #v584 do
                local v587 = v584[v586];
                local v588 = v586 == v582;
                local l_v585_0 = v585;
                if not v588 then
                    l_v585_0 = l_v585_0:clone();
                    l_v585_0.a = l_v585_0.a * 0.5;
                end;
                table.insert(v583, l_v580_0(l_v585_0, v587[1], v587[2], v587[3], v587[4], v588));
            end;
            return v583;
        end;
        v572 = v565.home.location:list("##LOCATION", {});
        local _ = nil;
        v572:set_callback(function(v592)
            -- upvalues: v565 (ref), v572 (ref), v590 (ref)
            local v593 = v592:get();
            v565.home.profile:visibility(v593 == 1);
            v565.home.activity:visibility(v593 == 2);
            v565.home.config:visibility(v593 == 3);
            v572:update(v590(v593));
        end, true);
    end;
    v580 = {};
    local l_profile_0 = v565.home.profile;
    v580.username = l_profile_0:label(v536("user", common.get_username(), 1, 8));
    v580.last_update = l_profile_0:label(v536("clock", "25 March 2025", 1, 7));
    v580.scripts = l_profile_0:label(v536("link", "Scripts", 0, 6));
    if v22.build ~= "Live" then
        v580.live_button = l_profile_0:button("Live", nil, true);
    end;
    if v22.build ~= "Secret" then
        v580.secret_button = l_profile_0:button("Secret", nil, true);
    end;
    if v22.build ~= "Debug" then
        v580.debug_button = l_profile_0:button("Debug", nil, true);
    end;
    v151.profile = v580;
    l_profile_0 = {};
    local l_activity_0 = v565.home.activity;
    if v23.time == nil then
        l_profile_0.session_time_label = l_activity_0:label(v536("clock", "Time Played", 1, 6));
        l_profile_0.session_time_button = l_activity_0:button("\a{Link Active}0s##SESSION_TIME", nil, true);
    else
        l_profile_0.time_left_label = l_activity_0:label(v536("clock", "Time Left", 1, 6));
        l_profile_0.time_left_button = l_activity_0:button("\a{Link Active}0s##TIME_LEFT", nil, true);
    end;
    l_profile_0.killes_label = l_activity_0:label(v536("skull-crossbones", "Enemies killed", 2, 6));
    l_profile_0.killes_button = l_activity_0:button("\a{Link Active}0##KILLS", nil, true);
    l_profile_0.misses_label = l_activity_0:label(v536("split", "Local Misses", 1, 6));
    l_profile_0.misses_button = l_activity_0:button("\a{Link Active}0##MISSES", nil, true);
    v151.activity = l_profile_0;
    l_activity_0 = {};
    local l_config_0 = v565.home.config;
    local function v602()
        -- upvalues: v22 (ref), v147 (ref), l_v509_0 (ref)
        local v597 = ui.get_style();
        local v598 = v597["Link Active"];
        local v599 = v597["Disabled Text"];
        local v600 = string.format("\194\169 2025 %s.lua", string.lower(v22.name));
        local v601 = v147.gradient(v600, -globals.realtime * 0.5, v598, v599);
        return l_v509_0(40) .. v601;
    end;
    l_activity_0.label = l_config_0:label(v602());
    l_activity_0.list = l_config_0:list("##PRESET_LIST", {
        [1] = "Empty"
    });
    l_activity_0.name = l_config_0:input("##PRESET_NAME", "");
    l_activity_0.load = l_config_0:button(v556("download", 7), nil, true);
    l_activity_0.save = l_config_0:button(v556("floppy-disk", 7), nil, true);
    l_activity_0.delete = l_config_0:button(v553("CD3030FF", "trash", 6), nil, true);
    l_activity_0.export = l_config_0:button(v553("DEFAULT", "copy", 6), nil, true);
    l_activity_0.import = l_config_0:button(v553("DEFAULT", "paste", 6), nil, true);
    l_activity_0.load:tooltip("Loads selected preset");
    l_activity_0.save:tooltip("Creates/Saves current settings to preset");
    l_activity_0.delete:tooltip("Deletes selected preset");
    l_activity_0.import:tooltip("Imports preset from clipboard");
    l_activity_0.export:tooltip("Exports preset to clipboard");
    do
        local l_v602_0 = v602;
        local v604 = v21("presets.on_render", function()
            -- upvalues: l_activity_0 (ref), l_v602_0 (ref)
            if ui.get_alpha() == 0 then
                return;
            else
                l_activity_0.label:name(l_v602_0());
                return;
            end;
        end);
        events.render(v604);
        v151.presets = l_activity_0;
    end;
    l_config_0 = {};
    v602 = v565.antiaim.selector;
    local l_state_0 = v565.antiaim.state;
    local l_send_0 = v565.antiaim.send;
    local l_settings_0 = v565.antiaim.settings;
    local l_settings_extra_0 = v565.antiaim.settings_extra;
    local l_builder_0 = v565.antiaim.builder;
    v50.add("##ANTIAIM_STATE", l_state_0, "AA");
    v50.add("##ANTIAIM_SETTINGS", l_settings_0, "AA");
    v50.add("##ANTIAIM_SETTINGS_EXTRA", l_settings_extra_0, "AA");
    local v610 = {
        list = v602:list("##LIST", {
            v536("bars-staggered", "Setup", 1, 8), 
            v536("slider", "Builder", 1, 8)
        })
    };
    local v611 = {};
    local v612 = {};
    local v613 = {
        unpack(v149.states, 0)
    };
    do
        local l_l_state_0_0, l_l_send_0_0, l_l_settings_0_0, l_l_settings_extra_0_0, l_v610_0, l_v611_0 = l_state_0, l_send_0, l_settings_0, l_settings_extra_0, v610, v611;
        do
            local l_v612_0, l_v613_0 = v612, v613;
            local function v622(v623)
                -- upvalues: v622 (ref)
                if v623 == nil then
                    return;
                else
                    local v624 = {};
                    for v625, v626 in pairs(v623) do
                        if type(v626) == "userdata" then
                            local v627 = v626:type();
                            if v627 ~= "label" and v627 ~= "button" then
                                local v628 = {
                                    pcall(v626.get, v626)
                                };
                                if v628[1] then
                                    v624[v625] = {
                                        unpack(v628, 2)
                                    };
                                end;
                            else
                                goto label1;
                            end;
                        end;
                        if type(v626) == "table" then
                            v624[v625] = v622(v626);
                        end;
                        ::label1::;
                    end;
                    return v624;
                end;
            end;
            local function v629(v630, v631)
                -- upvalues: v629 (ref)
                if v630 == nil or v631 == nil then
                    return;
                else
                    for v632, v633 in pairs(v631) do
                        local v634 = v630[v632];
                        if v634 ~= nil and type(v633) == "table" then
                            if type(v634) == "userdata" then
                                pcall(v634.set, v634, unpack(v633));
                            end;
                            if type(v634) == "table" then
                                v629(v634, v633);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            local _ = nil;
            local function v640(v636, v637, v638)
                -- upvalues: l_v509_0 (ref)
                local v639 = "\a" .. v636:to_hex();
                if v638 then
                    v639 = v639 .. "\194\187" .. l_v509_0(5);
                end;
                return v639 .. v637;
            end;
            do
                local l_v640_0 = v640;
                local function v650(v642)
                    -- upvalues: l_v640_0 (ref)
                    local v643 = {};
                    local v644 = {
                        [1] = "Terrorists", 
                        [2] = "Counter-Terrorists"
                    };
                    local v645 = ui.get_style("Link Active");
                    for v646 = 1, #v644 do
                        local v647 = v644[v646];
                        local v648 = v646 == v642;
                        local l_v645_0 = v645;
                        if not v648 then
                            l_v645_0 = l_v645_0:clone();
                            l_v645_0.a = l_v645_0.a * 0.5;
                        end;
                        table.insert(v643, l_v640_0(l_v645_0, v647, v648));
                    end;
                    return v643;
                end;
                l_v611_0.team = l_builder_0:list("##TEAM", v650(0));
                local _ = nil;
                local function v653(v652)
                    -- upvalues: v650 (ref)
                    v652:update(v650(v652:get()));
                end;
                l_v611_0.team:set_callback(v653, true);
            end;
            v640 = nil;
            local function v667(v654)
                -- upvalues: l_v611_0 (ref), v149 (ref), l_v612_0 (ref), l_v613_0 (ref)
                local v655 = l_v611_0.team:get() == 1 and "T" or "CT";
                l_v611_0.team:visibility(v654);
                for v656 = 1, #v149.teams do
                    local v657 = v149.teams[v656];
                    local l_v654_0 = v654;
                    if v655 ~= v657 then
                        l_v654_0 = false;
                    end;
                    local v659 = l_v611_0[v657];
                    local v660 = l_v612_0[v657];
                    local v661 = v659.state:get();
                    v659.state:visibility(l_v654_0);
                    for v662 = 1, #l_v613_0 do
                        local v663 = l_v613_0[v662];
                        local v664 = v659[v663];
                        local v665 = v660[v663];
                        local v666 = v661 == v663 and l_v654_0;
                        if v665 ~= nil then
                            if v665.root ~= nil then
                                v665.root:visibility(v666);
                                if v664 ~= nil and v664.enabled ~= nil then
                                    v664.enabled:visibility(v666);
                                    if v666 then
                                        v666 = v664.enabled:get();
                                    end;
                                end;
                            end;
                            if v665.angles ~= nil then
                                v665.angles:visibility(v666);
                            end;
                            if v665.defensive ~= nil then
                                v665.defensive:visibility(v666);
                            end;
                            if v665.antibrute ~= nil then
                                v665.antibrute:visibility(v666);
                            end;
                        end;
                    end;
                end;
            end;
            do
                local l_v667_0 = v667;
                v640 = function()
                    -- upvalues: l_v610_0 (ref), l_v667_0 (ref), l_l_state_0_0 (ref), l_l_send_0_0 (ref), l_l_settings_0_0 (ref), l_l_settings_extra_0_0 (ref)
                    local v669 = l_v610_0.list:get();
                    local v670 = v669 == 1;
                    local v671 = v669 == 2;
                    l_v667_0(v671);
                    l_l_state_0_0:visibility(v671);
                    l_l_send_0_0:visibility(v671);
                    l_l_settings_0_0:visibility(v670);
                    l_l_settings_extra_0_0:visibility(v670);
                end;
            end;
            v667 = function(v672, v673)
                -- upvalues: v150 (ref), v536 (ref), v525 (ref), v547 (ref)
                local v674 = {
                    [1] = "1-Way", 
                    [2] = "2-Way"
                };
                local v675 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter", 
                    [5] = "Spin", 
                    [6] = "Random", 
                    [7] = "3-Way", 
                    [8] = "5-Way"
                };
                local v676 = {
                    [1] = "Default", 
                    [2] = "Random"
                };
                if not v150.is_locked(-1) then
                    table.insert(v675, "Frost");
                    table.insert(v675, "Frostbomber");
                end;
                if not v150.is_locked(1) then
                    table.insert(v676, "Custom");
                end;
                v673.yaw = v672:combo(v536("arrow-down-short-wide", "Yaw", 1, 5), v674);
                local v677 = v673.yaw:create();
                v673.yaw_method = v677:combo(v536("bars-progress", "Method", 1, 6), {
                    [1] = "Default", 
                    [2] = "Wave", 
                    [3] = "Shake"
                });
                v673.yaw_frequency = v677:slider(v536("wave-sine", "Frequency", 0, 5), 0, 60, 0, nil);
                v673.yaw_amplitude = v677:slider(v536("wave-triangle", "Amplitude", 0, 5), 0, 30, 0, nil);
                v673.yaw_min = v677:slider(v536("chevrons-left", "Min. Yaw", 1, 7), 0, 100, 0, nil);
                v673.yaw_max = v677:slider(v536("chevrons-right", "Max. Yaw", 1, 7), 0, 100, 0, nil);
                v673.yaw_scale = v677:slider(v536("expand", "Scale", 1, 7), 0, 100, 0, nil);
                v673.yaw_offset = v672:slider(v536("arrows-rotate", "Offset", 1, 6), -180, 180, 0, nil, "\194\176");
                v673.yaw_left = v677:slider(v536("arrow-left", "Yaw Left", 1, 7), -180, 180, 0, nil, "\194\176");
                v673.yaw_left_randomize = v677:switch(v525("\226\128\162", "Left Random", 3, 8));
                v673.yaw_left_random = v677:slider("##YAW_LEFT_RANDOM", -180, 180, 0, nil, "\194\176");
                v673.yaw_right = v677:slider(v536("arrow-right", "Yaw Right", 1, 7), -180, 180, 0, nil, "\194\176");
                v673.yaw_right_randomize = v677:switch(v525("\226\128\162", "Right Random", 3, 8));
                v673.yaw_right_random = v677:slider("##YAW_RIGHT_RANDOM", -180, 180, 0, nil, "\194\176");
                v673.delay = v677:switch(v525("\226\164\183", "Delay", 2, 6));
                v673.delay_mode = v677:combo(v536("rotate-right", "Mode", 1, 6), v676);
                v673.delay_random = v677:slider(v536("shuffle", "Random", 1, 6), 0, 100, 0, nil, "%");
                v673.delay_timing = v677:slider(v536("clock", "Timing", 1, 6), 2, 22, 2, nil, "t");
                v673.delay_min_timing = v677:slider(v536("clock", "Min. Timing", 1, 6), 1, 22, 2, nil, "t");
                v673.delay_max_timing = v677:slider(v536("clock", "Max. Timing", 1, 6), 1, 22, 2, nil, "t");
                v673.delay_sliders = v677:slider(v536("shoe-prints", "Sliders", 0, 5), 2, 8, 2, nil);
                for v678 = 1, 8 do
                    v673["delay_" .. v678] = v677:slider(v536("stairs", string.format("Slider: %d", v678), 0, 6), 1, 22, 2, nil, "t");
                end;
                v673.delay_button = v677:button(v547("arrow-turn-down-right", "Delay", 46), nil, true);
                v673.back_button = v677:button(v547("arrow-turn-down-left", "Back", 47), nil, true);
                local v679 = nil;
                local function v683(v680)
                    -- upvalues: v673 (ref)
                    local v681 = tonumber(v680:get());
                    if v681 == nil then
                        return;
                    else
                        for v682 = 1, 8 do
                            v673["delay_" .. v682]:visibility(v682 <= v681);
                        end;
                        return;
                    end;
                end;
                do
                    local l_v677_0 = v677;
                    do
                        local l_v683_0 = v683;
                        local function v691(v686)
                            -- upvalues: v673 (ref), l_v683_0 (ref)
                            local v687 = v686 == "Default";
                            local v688 = v686 == "Random";
                            local v689 = v686 == "Custom";
                            v673.delay_random:visibility(not v688);
                            v673.delay_timing:visibility(v687);
                            v673.delay_min_timing:visibility(v688);
                            v673.delay_max_timing:visibility(v688);
                            v673.delay_sliders:visibility(v689);
                            if v689 then
                                v673.delay_sliders:set_callback(l_v683_0, true);
                            else
                                v673.delay_sliders:unset_callback(l_v683_0);
                            end;
                            if not v689 then
                                for v690 = 1, 8 do
                                    v673["delay_" .. v690]:visibility(false);
                                end;
                            end;
                        end;
                        local function v696(v692)
                            -- upvalues: v673 (ref)
                            local v693 = v692:get();
                            local v694 = v693 == "Wave";
                            local v695 = v693 == "Shake";
                            v673.yaw_frequency:visibility(v694);
                            v673.yaw_amplitude:visibility(v694);
                            v673.yaw_min:visibility(v695);
                            v673.yaw_max:visibility(v695);
                            v673.yaw_scale:visibility(v695);
                        end;
                        local function v698(v697)
                            -- upvalues: v673 (ref)
                            v673.yaw_left_random:visibility(v697:get());
                        end;
                        local function v700(v699)
                            -- upvalues: v673 (ref)
                            v673.yaw_right_random:visibility(v699:get());
                        end;
                        local function v702(v701)
                            -- upvalues: v691 (ref)
                            v691(v701:get());
                        end;
                        local function v706(v703)
                            -- upvalues: v673 (ref), v702 (ref)
                            local v704 = v703:get();
                            v673.delay_mode:visibility(v704);
                            if not v704 then
                                v673.delay_random:visibility(false);
                                v673.delay_timing:visibility(false);
                                v673.delay_min_timing:visibility(false);
                                v673.delay_max_timing:visibility(false);
                                v673.delay_sliders:visibility(false);
                                for v705 = 1, 8 do
                                    v673["delay_" .. v705]:visibility(false);
                                end;
                            end;
                            if v704 then
                                v673.delay_mode:set_callback(v702, true);
                            else
                                v673.delay_mode:unset_callback(v702);
                            end;
                        end;
                        local function v707()
                            -- upvalues: v673 (ref), v696 (ref), v698 (ref), v700 (ref), v706 (ref)
                            v673.yaw_method:visibility(false);
                            v673.yaw_method:unset_callback(v696);
                            v673.yaw_frequency:visibility(false);
                            v673.yaw_amplitude:visibility(false);
                            v673.yaw_min:visibility(false);
                            v673.yaw_max:visibility(false);
                            v673.yaw_scale:visibility(false);
                            v673.yaw_left:visibility(false);
                            v673.yaw_left_randomize:visibility(false);
                            v673.yaw_left_random:visibility(false);
                            v673.yaw_left_randomize:unset_callback(v698);
                            v673.yaw_right:visibility(false);
                            v673.yaw_right_randomize:visibility(false);
                            v673.yaw_right_random:visibility(false);
                            v673.yaw_right_randomize:unset_callback(v700);
                            v673.delay:visibility(true);
                            v673.delay:set_callback(v706, true);
                            v673.delay_button:visibility(false);
                            v673.back_button:visibility(true);
                        end;
                        local function v709()
                            -- upvalues: v673 (ref), v696 (ref), v698 (ref), v700 (ref), v706 (ref), v702 (ref), l_v683_0 (ref)
                            v673.yaw_method:visibility(true);
                            v673.yaw_method:set_callback(v696, true);
                            v673.yaw_left:visibility(true);
                            v673.yaw_left_randomize:visibility(true);
                            v673.yaw_left_randomize:set_callback(v698, true);
                            v673.yaw_right:visibility(true);
                            v673.yaw_right_randomize:visibility(true);
                            v673.yaw_right_randomize:set_callback(v700, true);
                            v673.delay:visibility(false);
                            v673.delay:unset_callback(v706);
                            v673.delay_mode:visibility(false);
                            v673.delay_mode:unset_callback(v702);
                            v673.delay_random:visibility(false);
                            v673.delay_timing:visibility(false);
                            v673.delay_min_timing:visibility(false);
                            v673.delay_max_timing:visibility(false);
                            v673.delay_sliders:visibility(false);
                            v673.delay_sliders:unset_callback(l_v683_0);
                            for v708 = 1, 8 do
                                v673["delay_" .. v708]:visibility(false);
                            end;
                            v673.delay_button:visibility(true);
                            v673.back_button:visibility(false);
                        end;
                        local function v711(v710)
                            -- upvalues: l_v677_0 (ref)
                            l_v677_0:visibility(v710:get() == "2-Way");
                        end;
                        v673.yaw:set_callback(v711, true);
                        v673.delay_button:set_callback(v707, true);
                        v673.back_button:set_callback(v709, true);
                    end;
                end;
                v673.yaw_modifier = v672:combo(v536("arrow-down-left-and-arrow-up-right-to-center", "Modifier", 1, 6), v675);
                v677 = v673.yaw_modifier:create();
                v679 = nil;
                v679 = {
                    [1] = "Default", 
                    [2] = "Random"
                };
                if not v150.is_locked(1) then
                    table.insert(v679, "Custom");
                end;
                v673.modifier_switcher = v677:combo(v536("gear", "Switcher", 1, 6), {
                    [1] = "Default", 
                    [2] = "Ticks", 
                    [3] = "Random"
                });
                v673.modifier_ticks_value = v677:slider("##SWITCHER_VALUE", 3, 16, 0, nil, "t");
                v673.modifier_random_value = v677:slider("##SWITCHER_VALUE", 4, 16, 0, nil, "t");
                v673.modifier_mode = v677:combo(v536("rotate-right", "Mode", 1, 6), v679);
                v673.modifier_offset = v677:slider(v536("arrows-rotate", "Offset", 1, 6), -180, 180, 0, nil, "\194\176");
                v673.modifier_random = v677:slider(v536("shuffle", "Random", 1, 6), 0, 100, 0, nil, "%");
                v673.modifier_min_offset = v677:slider(v536("arrows-rotate", "Min. Offset", 1, 6), -180, 180, 0, nil, "\194\176");
                v673.modifier_max_offset = v677:slider(v536("arrows-rotate", "Max. Offset", 1, 6), -180, 180, 0, nil, "\194\176");
                v673.modifier_sliders = v677:slider(v536("shoe-prints", "Sliders", 0, 5), 2, 8, 2, nil);
                for v712 = 1, 8 do
                    v673["modifier_offset_" .. v712] = v677:slider(v536("stairs", string.format("Slider: %d", v712), 0, 6), -180, 180, 0, nil, "\194\176");
                end;
                v683 = nil;
                local function v716(v713)
                    -- upvalues: v673 (ref)
                    local v714 = tonumber(v713:get());
                    if v714 == nil then
                        return;
                    else
                        for v715 = 1, 8 do
                            v673["modifier_offset_" .. v715]:visibility(v715 <= v714);
                        end;
                        return;
                    end;
                end;
                local function v719(v717)
                    -- upvalues: v673 (ref)
                    local v718 = v717:get();
                    v673.modifier_ticks_value:visibility(v718 == "Ticks");
                    v673.modifier_random_value:visibility(v718 == "Random");
                end;
                do
                    local l_v716_0 = v716;
                    local function v727(v721)
                        -- upvalues: v673 (ref), l_v716_0 (ref)
                        local v722 = v721:get();
                        local v723 = v722 == "Default";
                        local v724 = v722 == "Random";
                        local v725 = v722 == "Custom";
                        v673.modifier_offset:visibility(v723);
                        v673.modifier_random:visibility(v723 or v725);
                        v673.modifier_min_offset:visibility(v724);
                        v673.modifier_max_offset:visibility(v724);
                        v673.modifier_sliders:visibility(v725);
                        if v725 then
                            v673.modifier_sliders:set_callback(l_v716_0, true);
                        else
                            v673.modifier_sliders:unset_callback(l_v716_0);
                        end;
                        if not v725 then
                            for v726 = 1, 8 do
                                v673["modifier_offset_" .. v726]:visibility(false);
                            end;
                        end;
                    end;
                    local function v733(v728)
                        -- upvalues: v673 (ref), v727 (ref), l_v716_0 (ref)
                        local v729 = v728:get() == "Frostbomber";
                        local v730 = not v729;
                        v673.modifier_mode:visibility(v730);
                        if v730 then
                            v673.modifier_mode:set_callback(v727, true);
                        else
                            v673.modifier_mode:unset_callback(v727);
                        end;
                        if not v730 then
                            local l_v729_0 = v729;
                            v673.modifier_offset:visibility(not l_v729_0);
                            v673.modifier_random:visibility(false);
                            v673.modifier_min_offset:visibility(l_v729_0);
                            v673.modifier_max_offset:visibility(l_v729_0);
                            v673.modifier_sliders:visibility(false);
                            v673.modifier_sliders:unset_callback(l_v716_0);
                            for v732 = 1, 8 do
                                v673["modifier_offset_" .. v732]:visibility(false);
                            end;
                        end;
                    end;
                    v673.modifier_switcher:set_callback(v719, true);
                    v673.yaw_modifier:set_callback(v733, true);
                end;
                v673.body_yaw = v672:switch(v536("rotate", "Body Yaw", 1, 6));
                v677 = v673.body_yaw:create();
                v673.body_yaw_jitter = v677:switch(v536("dice-d6", "Jitter", 1, 6));
                v673.body_yaw_type = v677:combo(v525("\226\164\183", "Type", 2, 6), {
                    [1] = "Default", 
                    [2] = "Ticks", 
                    [3] = "Random"
                });
                v673.body_yaw_ticks_value = v677:slider("##SWITCHER_VALUE", 3, 16, 0, nil, "t");
                v673.body_yaw_random_value = v677:slider("##SWITCHER_VALUE", 4, 16, 0, nil, "t");
                v673.body_yaw_invert_chance = v677:slider(v536("dice-d6", "Invert Chance", 1, 6), 1, 100, 100, nil, "%");
                v673.body_yaw_freestanding = v677:combo(v536("arrows-retweet", "Freestanding", 0, 4), {
                    [1] = "Off", 
                    [2] = "Default", 
                    [3] = "Reversed"
                });
                v673.body_yaw_limit_type = v677:combo(v525("\226\164\183", "Limit Type", 2, 6), {
                    [1] = "Default", 
                    [2] = "Random", 
                    [3] = "Ticks"
                });
                v673.body_yaw_timing = v677:slider(v536("clock", "Timing", 1, 6), 2, 22, 2, nil, "t");
                v673.body_yaw_limit_left_value = v677:slider(v525("\226\128\162", "Left Limit", 3, 8), 0, 60, 60, nil, "\194\176");
                v673.body_yaw_limit_right_value = v677:slider(v525("\226\128\162", "Right Limit", 3, 8), 0, 60, 60, nil, "\194\176");
                v673.body_yaw_limit_min_value = v677:slider(v525("\226\128\162", "Min. Limit", 3, 8), 0, 60, 60, nil, "\194\176");
                v673.body_yaw_limit_max_value = v677:slider(v525("\226\128\162", "Max. Limit", 3, 8), 0, 60, 60, nil, "\194\176");
                v673.body_yaw_other_button = v677:button(v547("arrow-turn-down-right", "Other", 45), nil, true);
                v673.body_yaw_back_button = v677:button(v547("arrow-turn-down-left", "Back", 47), nil, true);
                v679 = nil;
                v683 = function(v734)
                    -- upvalues: v673 (ref)
                    v673.body_yaw_ticks_value:visibility(v734:get() == "Ticks");
                    v673.body_yaw_random_value:visibility(v734:get() == "Random");
                end;
                v716 = function(v735)
                    -- upvalues: v673 (ref)
                    local v736 = v735:get();
                    local v737 = v736 == "Default";
                    local v738 = v736 == "Random";
                    local v739 = v736 == "Ticks";
                    v673.body_yaw_timing:visibility(v739);
                    v673.body_yaw_limit_left_value:visibility(v737);
                    v673.body_yaw_limit_right_value:visibility(v737);
                    v673.body_yaw_limit_min_value:visibility(v738 or v739);
                    v673.body_yaw_limit_max_value:visibility(v738 or v739);
                end;
                do
                    local l_v683_1, l_v716_1 = v683, v716;
                    v719 = function()
                        -- upvalues: v673 (ref), l_v683_1 (ref), l_v716_1 (ref)
                        v673.body_yaw_jitter:visibility(false);
                        v673.body_yaw_type:visibility(false);
                        v673.body_yaw_type:unset_callback(l_v683_1);
                        v673.body_yaw_ticks_value:visibility(false);
                        v673.body_yaw_random_value:visibility(false);
                        v673.body_yaw_invert_chance:visibility(true);
                        v673.body_yaw_freestanding:visibility(true);
                        v673.body_yaw_limit_type:visibility(true);
                        v673.body_yaw_limit_type:set_callback(l_v716_1, true);
                        v673.body_yaw_other_button:visibility(false);
                        v673.body_yaw_back_button:visibility(true);
                    end;
                    local function v742()
                        -- upvalues: v673 (ref), l_v683_1 (ref), l_v716_1 (ref)
                        v673.body_yaw_jitter:visibility(true);
                        v673.body_yaw_type:visibility(true);
                        v673.body_yaw_type:set_callback(l_v683_1, true);
                        v673.body_yaw_invert_chance:visibility(false);
                        v673.body_yaw_freestanding:visibility(false);
                        v673.body_yaw_limit_type:visibility(false);
                        v673.body_yaw_limit_type:unset_callback(l_v716_1);
                        v673.body_yaw_timing:visibility(false);
                        v673.body_yaw_limit_left_value:visibility(false);
                        v673.body_yaw_limit_right_value:visibility(false);
                        v673.body_yaw_limit_min_value:visibility(false);
                        v673.body_yaw_limit_max_value:visibility(false);
                        v673.body_yaw_other_button:visibility(true);
                        v673.body_yaw_back_button:visibility(false);
                    end;
                    v673.body_yaw_type:set_callback(l_v683_1, true);
                    v673.body_yaw_other_button:set_callback(v719, true);
                    v673.body_yaw_back_button:set_callback(v742, true);
                end;
                return v673;
            end;
            local function v804(v743, v744)
                -- upvalues: v525 (ref), v150 (ref), v536 (ref), v547 (ref), v564 (ref)
                local v745 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Jitter", 
                    [4] = "Spin", 
                    [5] = "Random", 
                    [6] = "Static Random"
                };
                local v746 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Spin", 
                    [4] = "Random", 
                    [5] = "Left/Right", 
                    [6] = "Static Random"
                };
                local v747 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter"
                };
                v744.force_defensive = v743:switch(v525("\226\128\162", "Tickbase", 3, 8));
                local v748 = v744.force_defensive:create();
                local v749 = nil;
                v749 = {
                    [1] = "Default", 
                    [2] = "Random"
                };
                if not v150.is_locked(1) then
                    table.insert(v749, "Custom");
                end;
                v744.custom_defensive_ticks = v748:switch(v536("shield", "Custom Defensive Ticks", 0, 7));
                v744.defensive_ticks_mode = v748:combo(v525("\226\128\162", "Mode", 1, 6), v749);
                v744.defensive_ticks = v748:slider(v547("arrow-turn-down-right", "Ticks", 10, 7), 2, 22, 15, nil, "t");
                v744.min_defensive_ticks = v748:slider(v547("arrow-turn-down-right", "Min. Ticks", 10, 7), 2, 22, 15, nil, "t");
                v744.max_defensive_ticks = v748:slider(v547("arrow-turn-down-right", "Max. Ticks", 10, 7), 2, 22, 15, nil, "t");
                v744.defensive_ticks_sliders = v748:slider(v536("shoe-prints", "Sliders", 0, 5), 2, 8, 2, nil);
                for v750 = 1, 8 do
                    v744["defensive_ticks_" .. v750] = v748:slider(v536("stairs", string.format("Slider: %d", v750), 0, 6), 2, 22, 15, nil, "t");
                end;
                v150.push(-1, v744.custom_defensive_ticks);
                local v751 = nil;
                local function v755(v752)
                    -- upvalues: v744 (ref)
                    local v753 = tonumber(v752:get());
                    if v753 == nil then
                        return;
                    else
                        for v754 = 1, 8 do
                            v744["defensive_ticks_" .. v754]:visibility(v754 <= v753);
                        end;
                        return;
                    end;
                end;
                do
                    local l_v755_0 = v755;
                    local function v763(v757)
                        -- upvalues: v744 (ref), l_v755_0 (ref)
                        local v758 = v757:get();
                        local v759 = v758 == "Default";
                        local v760 = v758 == "Random";
                        local v761 = v758 == "Custom";
                        v744.defensive_ticks:visibility(v759);
                        v744.min_defensive_ticks:visibility(v760);
                        v744.max_defensive_ticks:visibility(v760);
                        v744.defensive_ticks_sliders:visibility(v761);
                        if v761 then
                            v744.defensive_ticks_sliders:set_callback(l_v755_0, true);
                        else
                            v744.defensive_ticks_sliders:unset_callback(l_v755_0);
                        end;
                        if not v761 then
                            for v762 = 1, 8 do
                                v744["defensive_ticks_" .. v762]:visibility(false);
                            end;
                        end;
                    end;
                    local function v767(v764)
                        -- upvalues: v744 (ref), v763 (ref), l_v755_0 (ref)
                        local v765 = v764:get();
                        if not v765 then
                            v744.defensive_ticks:visibility(false);
                            v744.min_defensive_ticks:visibility(false);
                            v744.max_defensive_ticks:visibility(false);
                            v744.defensive_ticks_sliders:visibility(false);
                            for v766 = 1, 8 do
                                v744["defensive_ticks_" .. v766]:visibility(false);
                            end;
                            v744.defensive_ticks_mode:unset_callback(v763);
                            v744.defensive_ticks_sliders:unset_callback(l_v755_0);
                        end;
                        if v765 then
                            v744.defensive_ticks_mode:set_callback(v763, true);
                        end;
                        v744.defensive_ticks_mode:visibility(v765);
                    end;
                    v744.custom_defensive_ticks:set_callback(v767, true);
                end;
                v744.enabled = v743:switch(v536("circle-bolt", "Defensive AA", 1, 7));
                v744.exploits = v744.enabled:create():selectable(v536("bolt", "Exploits", 1, 7), {
                    [1] = "Double Tap", 
                    [2] = "Hide Shots"
                });
                v744.pitch = v743:combo(v536("compass-drafting", "Pitch", 1, 7), v745);
                v749 = v744.pitch:create();
                v744.pitch_offset = v749:slider(v536("arrows-rotate", "Offset", 1, 5), -89, 89, 0, nil, "\194\176");
                v744.pitch_offset_1 = v749:slider(v536("arrow-left", "Angle from", 1, 7), -89, 89, 0, nil, "\194\176");
                v744.pitch_offset_2 = v749:slider(v536("arrow-right", "Angle to", 1, 7), -89, 89, 0, nil, "\194\176");
                v744.pitch_speed = v749:slider(v536("rabbit", "Speed", 1, 6), -50, 50, 20, 0.1);
                v744.yaw = v743:combo(v536("arrow-down-short-wide", "Yaw", 1, 6), v746);
                v749 = v744.yaw:create();
                v744.yaw_offset = v749:slider(v536("arrows-rotate", "Offset", 1, 5), -180, 180, 0, nil, "\194\176");
                v744.yaw_left = v749:slider(v536("arrow-left", "Yaw Left", 1, 7), -180, 180, 0, nil, "\194\176");
                v744.yaw_right = v749:slider(v536("arrow-right", "Yaw Right", 1, 7), -180, 180, 0, nil, "\194\176");
                v744.yaw_speed = v749:slider(v536("rabbit", "Speed", 1, 6), -50, 50, 20, 0.1);
                v744.yaw_modifier = v743:combo(v536("arrow-down-left-and-arrow-up-right-to-center", "Modifier", 1, 7), v747);
                v744.modifier_offset = v744.yaw_modifier:create():slider(v536("arrows-rotate", "Offset", 1, 5), -180, 180, 0, nil, "\194\176");
                v744.delay = v743:switch(v536("timeline", "Delay", 1, 5));
                v749 = v744.delay:create();
                v751 = nil;
                v751 = {
                    [1] = "Default", 
                    [2] = "Random"
                };
                if not v150.is_locked(1) then
                    table.insert(v751, "Custom");
                end;
                v744.delay_mode = v749:combo(v536("rotate-right", "Mode", 1, 7), v751);
                v744.delay_timing = v749:slider(v536("clock", "Timing", 1, 7), 2, 22, 2, nil, "t");
                v744.delay_min_timing = v749:slider(v536("clock", "Min. Timing", 1, 7), 1, 22, 2, nil, "t");
                v744.delay_max_timing = v749:slider(v536("clock", "Max. Timing", 1, 7), 1, 22, 2, nil, "t");
                v744.delay_sliders = v749:slider(v536("shoe-prints", "Sliders", 0, 5), 2, 8, 2, nil);
                for v768 = 1, 8 do
                    v744["delay_" .. v768] = v749:slider(v536("stairs", string.format("Slider: %d", v768), 0, 6), 1, 22, 2, nil, "t");
                end;
                v755 = nil;
                local function v772(v769)
                    -- upvalues: v744 (ref)
                    local v770 = tonumber(v769:get());
                    if v770 == nil then
                        return;
                    else
                        for v771 = 1, 8 do
                            v744["delay_" .. v771]:visibility(v771 <= v770);
                        end;
                        return;
                    end;
                end;
                do
                    local l_v772_0 = v772;
                    local function v780(v774)
                        -- upvalues: v744 (ref), l_v772_0 (ref)
                        local v775 = v774:get();
                        local v776 = v775 == "Default";
                        local v777 = v775 == "Random";
                        local v778 = v775 == "Custom";
                        v744.delay_timing:visibility(v776);
                        v744.delay_min_timing:visibility(v777);
                        v744.delay_max_timing:visibility(v777);
                        v744.delay_sliders:visibility(v778);
                        if v778 then
                            v744.delay_sliders:set_callback(l_v772_0, true);
                        else
                            v744.delay_sliders:unset_callback(l_v772_0);
                        end;
                        if not v778 then
                            for v779 = 1, 8 do
                                v744["delay_" .. v779]:visibility(false);
                            end;
                        end;
                    end;
                    v744.delay_mode:set_callback(v780, true);
                end;
                v564(v744.exploits);
                v749 = nil;
                v751 = function(v781)
                    -- upvalues: v744 (ref)
                    local v782 = v781:get();
                    local v783 = v782 == "Static";
                    local v784 = v782 == "Jitter";
                    local v785 = v782 == "Random";
                    local v786 = v782 == "Spin";
                    local v787 = v782 == "Static Random";
                    v744.pitch_offset:visibility(v783);
                    v744.pitch_offset_1:visibility(v784 or v785 or v786 or v787);
                    v744.pitch_offset_2:visibility(v784 or v785 or v786 or v787);
                    v744.pitch_speed:visibility(v786);
                end;
                v755 = function(v788)
                    -- upvalues: v744 (ref)
                    local v789 = v788:get() ~= "Off";
                    v744.modifier_offset:visibility(v789);
                    v744.delay:visibility(v789);
                end;
                do
                    local l_v751_0, l_v755_1, l_v772_1 = v751, v755, v772;
                    l_v772_1 = function(v793)
                        -- upvalues: v744 (ref), l_v755_1 (ref)
                        local v794 = v793:get();
                        local v795 = v794 == "Off";
                        local v796 = v794 == "Static";
                        local v797 = v794 == "Random";
                        local v798 = v794 == "Spin";
                        local v799 = v794 == "Left/Right";
                        local v800 = v794 == "Static Random";
                        v744.yaw_left:visibility(v799 or v800);
                        v744.yaw_right:visibility(v799 or v800);
                        v744.yaw_offset:visibility(v796 or v797 or v798);
                        v744.yaw_speed:visibility(v798);
                        v744.yaw_modifier:visibility(not v795);
                        if not v795 then
                            v744.yaw_modifier:set_callback(l_v755_1, true);
                        else
                            v744.yaw_modifier:unset_callback(l_v755_1);
                        end;
                        if v795 then
                            v744.modifier_offset:visibility(false);
                            v744.delay:visibility(false);
                        end;
                    end;
                    local function v803(v801)
                        -- upvalues: v744 (ref), l_v751_0 (ref), l_v772_1 (ref), l_v755_1 (ref)
                        local v802 = v801:get();
                        if not v802 then
                            v744.pitch_offset_1:visibility(false);
                            v744.pitch_offset_2:visibility(false);
                            v744.pitch_speed:visibility(false);
                            v744.yaw_left:visibility(false);
                            v744.yaw_right:visibility(false);
                            v744.yaw_offset:visibility(false);
                            v744.yaw_speed:visibility(false);
                            v744.yaw_modifier:visibility(false);
                            v744.modifier_offset:visibility(false);
                            v744.delay:visibility(false);
                        end;
                        if v802 then
                            v744.pitch:set_callback(l_v751_0, true);
                            v744.yaw:set_callback(l_v772_1, true);
                        else
                            v744.pitch:unset_callback(l_v751_0);
                            v744.yaw:unset_callback(l_v772_1);
                            v744.yaw_modifier:unset_callback(l_v755_1);
                        end;
                        v744.pitch:visibility(v802);
                        v744.yaw:visibility(v802);
                    end;
                    v744.enabled:set_callback(v803, true);
                end;
                return v744;
            end;
            local function v814(v805, v806)
                -- upvalues: v536 (ref), v150 (ref)
                v806.enabled = v805:switch(v536("share-all", "Defensive Flick", 1, 6));
                local v807 = v806.enabled:create();
                v806.speed_mode = v807:combo(v536("rabbit", "Speed", 1, 5), {
                    [1] = "Default", 
                    [2] = "Random"
                });
                v806.speed_default = v807:slider("##DEFAULT", 2, 10, 7);
                v806.speed_min = v807:slider(v536("clock", "Min. Speed", 1, 5), 2, 10, 7);
                v806.speed_max = v807:slider(v536("clock", "Max. Speed", 1, 5), 2, 10, 7);
                v806.pitch = v807:slider(v536("arrows-rotate", "Pitch", 1, 5), -89, 89, 0, nil, "\194\176");
                v806.yaw = v807:slider(v536("arrows-rotate", "Yaw", 1, 5), -180, 180, 90, nil, "\194\176");
                v806.limit = v807:slider(v536("arrow-left", "Limit", 1, 6), 0, 60, 60, nil, "\194\176");
                v806.inverter = v807:switch(v536("toggle-on", "Inverter", 1, 5));
                v806.jitter = v807:switch(v536("sliders-simple", "Jitter", 1, 6));
                local _ = nil;
                local function v813(v809)
                    -- upvalues: v806 (ref)
                    local v810 = v809:get();
                    local v811 = v810 == "Default";
                    local v812 = v810 == "Random";
                    v806.speed_default:visibility(v811);
                    v806.speed_min:visibility(v812);
                    v806.speed_max:visibility(v812);
                end;
                v806.speed_mode:set_callback(v813, true);
                v150.push(1, v806.enabled);
                return v806;
            end;
            local function v819(v815, v816)
                -- upvalues: v536 (ref)
                v816.enabled = v815:switch(v536("dice-d6", "Anti Bruteforce", 2, 7));
                local v817 = v816.enabled:create();
                v816.refresh_modifier = v817:combo(v536("arrows-spin", "Modifier", 2, 7), {
                    [1] = "Off", 
                    [2] = "Meta", 
                    [3] = "Increase", 
                    [4] = "Decrease"
                });
                v816.refresh_offset = v817:switch(v536("arrows-repeat", "Offset", 2, 7));
                v816.enforce_delay = v817:switch(v536("right-left", "Change Delay", 2, 7));
                v816.duration = v817:slider(v536("clock", "Duration", 2, 7), 9, 200, 9, 0.1, function(v818)
                    return v818 == 9 and "Inf." or v818 * 0.1 .. "s";
                end);
                return v816;
            end;
            for v820 = 1, #v149.teams do
                local v821 = v149.teams[v820];
                local v822 = {};
                l_v611_0[v821] = v822;
                l_v612_0[v821] = {};
                v822.state = l_l_state_0_0:combo(v536("person-walking-arrow-loop-left", "State", 0, 5), l_v613_0);
                do
                    local l_v821_0 = v821;
                    for v824 = 1, #l_v613_0 do
                        local v825 = l_v613_0[v824];
                        local v826 = string.format("##ROOT_%s_%s", l_v821_0, v825);
                        local v827 = string.format("##ANGLES_%s_%s", l_v821_0, v825);
                        local v828 = string.format("##DEFENSIVE_%s_%s", l_v821_0, v825);
                        local v829 = string.format("##ANTIBRUTE_%s_%s", l_v821_0, v825);
                        local v830 = v47.create(v506, v826, v152);
                        local v831 = v47.create(v506, v827, v152);
                        local v832 = v47.create(v506, v828, v152);
                        local v833 = v47.create(v506, v829, v152);
                        do
                            local l_v825_0 = v825;
                            local function v839(v835)
                                -- upvalues: l_v821_0 (ref), l_v825_0 (ref)
                                local v836 = string.format("##%s_%s", l_v821_0, l_v825_0);
                                local _, v838 = string.find(v835[2], "##");
                                if v838 ~= nil then
                                    v836 = v836 .. string.sub(v835[2], v838 + 1);
                                end;
                                v835[2] = v835[2] .. v836;
                            end;
                            local v840 = {};
                            l_l_state_0_0:set_callback(v839);
                            v830:set_callback(v839);
                            v831:set_callback(v839);
                            v832:set_callback(v839);
                            v833:set_callback(v839);
                            if l_v825_0 ~= "Default" then
                                l_l_state_0_0:set_flag(v47.group_flags.callbacks, false);
                                v840.enabled = l_l_state_0_0:switch(string.format(v536("arrow-turn-down-right", "Override %s", 0, 6), l_v825_0:lower()));
                                l_l_state_0_0:set_flag(v47.group_flags.callbacks, true);
                                v840.enabled:set_callback(v640);
                            end;
                            if l_v825_0 ~= "On Peek" then
                                v840.angles = v667(v831, {});
                            end;
                            v840.defensive = v804(v832, {});
                            if l_v825_0 ~= "On Peek" and l_v825_0 ~= "Freestanding" then
                                v840.flick = v814(v832, {});
                                v840.antibrute = v819(v833, {});
                            end;
                            l_l_state_0_0:unset_callback(v839);
                            v830:unset_callback(v839);
                            v831:unset_callback(v839);
                            v832:unset_callback(v839);
                            v833:unset_callback(v839);
                            l_v611_0[l_v821_0][l_v825_0] = v840;
                            l_v612_0[l_v821_0][l_v825_0] = {
                                root = v830, 
                                angles = v831, 
                                defensive = v832, 
                                antibrute = v833
                            };
                            v50.add(v826, v830, "AA");
                            v50.add(v827, v831, "AA");
                            v50.add(v828, v832, "AA");
                            v50.add(v829, v833, "AA");
                        end;
                    end;
                    local _ = nil;
                    local function v844(v842)
                        -- upvalues: l_v611_0 (ref), l_v821_0 (ref), v640 (ref)
                        if (l_v611_0.team:get() == 1 and "T" or "CT") ~= l_v821_0 then
                            return;
                        else
                            local v843 = l_v611_0[l_v821_0 == "CT" and "T" or "CT"];
                            if v843 ~= nil then
                                v843.state:set(v842:get());
                            end;
                            v640();
                            return;
                        end;
                    end;
                    v822.state:set_callback(v844);
                end;
            end;
            local _ = nil;
            local function v853()
                -- upvalues: l_v611_0 (ref), v629 (ref), v622 (ref), v48 (ref)
                local v846 = l_v611_0.team:get() == 1 and "T" or "CT";
                local v847 = v846 == "CT" and "T" or "CT";
                local v848 = l_v611_0[v846];
                local v849 = l_v611_0[v847];
                if v848 == nil or v849 == nil then
                    return;
                else
                    local v850 = v848.state:get();
                    local v851 = v848[v850];
                    local v852 = v849[v850];
                    if v851 == nil or v852 == nil then
                        return;
                    else
                        if v851.enabled ~= nil and v852.enabled ~= nil then
                            v852.enabled:set(v851.enabled:get());
                        end;
                        v629(v852.angles, v622(v851.angles));
                        v629(v852.defensive, v622(v851.defensive));
                        if v851.flick ~= nil and v852.flick ~= nil then
                            v629(v852.flick, v622(v851.flick));
                        end;
                        if v851.antibrute ~= nil and v852.antibrute ~= nil then
                            v629(v852.antibrute, v622(v851.antibrute));
                        end;
                        v48.success(string.format("Settings sent to %s team", v847));
                        return;
                    end;
                end;
            end;
            l_l_send_0_0:button(v547("arrow-up-right-from-square", "Send To Another Team", 25), v853, true);
            v853 = nil;
            l_v611_0.team:set_callback(v640);
            l_v610_0.list:set_callback(v640);
            v640();
            l_config_0.builder = l_v611_0;
        end;
        v612 = {
            avoid_backstab = {
                enabled = l_l_settings_extra_0_0:switch(v536("sword", "Avoid Backstab", 1, 6), true)
            }
        };
        local v854 = {
            select = l_l_settings_extra_0_0:combo(v536("arrows-repeat", "Manual Yaw", 1, 6), {
                [1] = "Off", 
                [2] = "Left", 
                [3] = "Right", 
                [4] = "Backward", 
                [5] = "Forward"
            })
        };
        local v855 = v854.select:create();
        v854.disable_yaw_modifiers = v855:switch(v536("align-slash", "Disable Yaw Modifiers", 1, 4));
        v854.body_freestanding = v855:switch(v536("arrows-retweet", "Body Freestanding", 1, 4));
        v612.manual_yaw = v854;
        v855 = {
            enabled = l_l_settings_extra_0_0:switch(v536("arrows-turn-to-dots", "Freestanding", 1, 7))
        };
        local v856 = v855.enabled:create();
        v855.disablers = v856:selectable(v536("power-off", "Disablers", 2, 5), {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slowwalking", 
            [4] = "Ducking", 
            [5] = "In Air", 
            [6] = "In Air & Duck"
        });
        v855.disable_yaw_modifiers = v856:switch(v536("align-slash", "Disable Yaw Modifiers", 1, 4));
        v855.body_freestanding = v856:switch(v536("arrows-retweet", "Body Freestanding", 1, 4));
        v612.freestanding = v855;
        v856 = {
            enabled = l_l_settings_extra_0_0:switch(v536("ruler", "Edge Yaw", 1, 6))
        };
        v856.only_on_fake_duck = v856.enabled:create():switch(v536("duck", "Only on Fake Duck", 1, 6));
        v612.edge_yaw = v856;
        local v857 = {
            enabled = l_l_settings_extra_0_0:switch(v536("power-off", "Disablers", 1, 6))
        };
        v857.select = v857.enabled:create():listable("##SELECT", {
            [1] = "Warmup", 
            [2] = "No Enemies"
        });
        v564(v857.select);
        v612.disablers = v857;
        local v858 = {
            enabled = l_l_settings_extra_0_0:switch(v536("wind", "Air Lag", 1, 6))
        };
        v858.ticks = v858.enabled:create():slider(v536("clock", "Ticks", 1, 7), 1, 8, 4, nil, "t");
        v150.push(1, v858.enabled);
        v612.air_lag = v858;
        local v859 = {
            enabled = l_l_settings_0_0:switch(v536("layer-group", "Animations", 1, 6))
        };
        local v860 = v859.enabled:create();
        v859.air_legs = v860:combo(v536("person-ski-lift", "Air Legs", 1, 6), {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Walking"
        });
        v859.ground_legs = v860:combo(v536("person-walking", "Ground Legs", 2, 8), {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Walking", 
            [5] = "Earthquake"
        });
        v859.legs_offset_1 = v860:slider(v536("arrows-up-down-left-right", "Offset 1", 1, 7), 0, 100, 100, nil, function(v861)
            return v861 == 0 and "Off" or v861 * 0.01 .. "x";
        end);
        v859.legs_offset_2 = v860:slider(v536("arrows-up-down-left-right", "Offset 2", 1, 7), 0, 100, 100, nil, function(v862)
            return v862 == 0 and "Off" or v862 * 0.01 .. "x";
        end);
        v859.body_lean = v860:slider(v536("lines-leaning", "Body Lean", 1, 9), -1, 100, -1, nil, function(v863)
            return v863 == -1 and "Off" or v863 * 0.01 .. "x";
        end);
        v859.pitch_on_land = v860:switch(v536("person-arrow-down-to-line", "Pitch on Land", 0, 7), true);
        local v864 = nil;
        do
            local l_v859_0, l_v860_0 = v859, v860;
            local function v869(v867)
                -- upvalues: l_v859_0 (ref)
                local v868 = v867:get();
                l_v859_0.legs_offset_1:visibility(v868 == "Jitter");
                l_v859_0.legs_offset_2:visibility(v868 == "Jitter");
            end;
            l_v859_0.ground_legs:set_callback(v869, true);
            v612.animations = l_v859_0;
            l_v860_0 = {
                enabled = l_l_settings_0_0:switch(v536("arrows-minimize", "Safe Head", 1, 6))
            };
            v864 = l_v860_0.enabled:create();
            l_v860_0.select = v864:selectable(v536("head-side", "Conditions", 1, 6), {
                [1] = "Air Crouch Knife", 
                [2] = "Air Crouch Taser", 
                [3] = "Height Advantage", 
                [4] = "Crouch"
            });
            l_v860_0.target_height = v864:slider(v536("line-height", "Height", 1, 6), 0, 200, 0, nil, "u");
            l_v860_0.e_spam_while_safe_head = v864:switch(v536("hand", "E Spam While Safe Head", 1, 7));
            v869 = nil;
            local function v872(v870)
                -- upvalues: l_v860_0 (ref)
                local v871 = v870:get("Air Crouch Knife") or v870:get("Air Crouch Taser");
                l_v860_0.target_height:visibility(v871);
            end;
            l_v860_0.select:set_callback(v872, true);
            v564(l_v860_0.select);
            v612.safe_head = l_v860_0;
            v864 = {
                enabled = l_l_settings_0_0:switch(v536("transporter-1", "Auto Teleport", 1, 6))
            };
            v869 = v864.enabled:create();
            v864.select = v869:selectable(v536("person-running", "Conditions", 1, 7), {
                [1] = "In Air", 
                [2] = "In Air & Duck"
            });
            v864.weapons = v869:selectable(v536("gun", "Weapons", 1, 6), {
                [1] = "Auto Snipers", 
                [2] = "AWP", 
                [3] = "Scout", 
                [4] = "Desert Eagle", 
                [5] = "Pistols", 
                [6] = "SMG", 
                [7] = "Rifles"
            });
            v864.select:set({
                [1] = "In Air", 
                [2] = "In Air & Duck"
            });
            v864.weapons:set({
                [1] = "AWP", 
                [2] = "Scout", 
                [3] = "Pistols"
            });
            v612.auto_teleport = v864;
            l_config_0.settings = v612;
        end;
        v151.antiaim = l_config_0;
    end;
    v602 = nil;
    v602 = v565.features.category:list("##CATEGORY", {
        v536("crosshairs", "Ragebot", 2, 7), 
        v536("paintbrush", "Visuals", 1, 7), 
        v536("gears", "Misc", 1, 6)
    });
    l_state_0 = nil;
    v602:set_callback(function(v873)
        -- upvalues: v565 (ref)
        local v874 = v873:get();
        local v875 = v874 == 1;
        local v876 = v874 == 2;
        local v877 = v874 == 3;
        v565.features.extra:visibility(v875);
        v565.features.ragebot:visibility(v875);
        v565.features.visuals:visibility(v876);
        v565.features.render:visibility(v876);
        v565.features.misc:visibility(v877);
        v565.features.movement:visibility(v877);
    end, true);
    v151.category = v602;
    l_state_0 = {};
    l_send_0 = v565.features.ragebot;
    l_settings_0 = v565.features.extra;
    v50.add("##RAGEBOT", l_send_0, "AA");
    v50.add("##EXTRA", l_settings_0, "AA");
    l_settings_extra_0 = {
        enabled = l_send_0:switch(v536("robot", "Smart Peek", 1, 5))
    };
    l_builder_0 = l_settings_extra_0.enabled:create();
    l_settings_extra_0.simulation = l_builder_0:slider(v536("clock", "Simulation", 1, 7), 25, 35, 28, 0.01, "s");
    l_settings_extra_0.rate_limit = l_builder_0:slider(v536("wave-pulse", "Rate Limit", 0, 6), 0, 30, 2, 0.01, "s");
    l_settings_extra_0.hit_chance = l_builder_0:slider(v536("dice", "Hit Chance", 0, 6), 0, 100, 35, nil, function(v878)
        return v878 == 0 and "Def." or v878 .. "%";
    end);
    l_settings_extra_0.unsafety = l_builder_0:switch(v536("shield-slash", "Unsafety", 0, 6));
    l_settings_extra_0.dev_mode = l_builder_0:switch(v536("code", "Dev Mode", 0, 6));
    l_settings_extra_0.range = l_builder_0:slider(v536("forward", "Range", 1, 7), 15, 25, 20, nil, "t");
    l_settings_extra_0.retreat = l_builder_0:slider(v536("backward", "Retreat", 1, 7), 15, 30, 25, nil, "u");
    l_settings_extra_0.weapons = l_builder_0:selectable(v536("gun", "Weapons", 1, 6), {
        [1] = "SSG-08", 
        [2] = "Pistols", 
        [3] = "Deagle"
    });
    l_settings_extra_0.hitboxes = l_builder_0:selectable(v536("bullseye", "Hitboxes", 1, 7), {
        [1] = "Head", 
        [2] = "Chest", 
        [3] = "Stomach", 
        [4] = "Arms", 
        [5] = "Legs"
    });
    l_settings_extra_0.color = l_builder_0:color_picker(v536("palette", "Color", 1, 7), color(200, 0, 0, 255));
    v564(l_settings_extra_0.weapons);
    v564(l_settings_extra_0.hitboxes);
    l_settings_extra_0.enabled:tooltip("\194\183 Automatically peeks enemy using algorithms.");
    l_settings_extra_0.simulation:tooltip("\194\183 Duration of the Peek, adjust it, if \a{Link Active}\"Smart Peek\"\aDEFAULT fails with timings.");
    l_settings_extra_0.rate_limit:tooltip("\194\183 Delay between hitscan, can be increased if you have poor performance.");
    l_settings_extra_0.hit_chance:tooltip("\194\183 Overrides ragebot hitchance, while peeking.");
    l_settings_extra_0.unsafety:tooltip("\194\183 Disables \a{Link Active}\"Force Body\"\aDEFAULT, " .. "\a{Link Active}\"Safe Points'\aDEFAULT, " .. "\a{Link Active}\"Ensure Hitbox Safety\"\aDEFAULT " .. "and Sets \a{Link Active}\"Point Scale\"\aDEFAULT to 100");
    v610 = nil;
    do
        local l_l_settings_extra_0_1, l_v610_1, l_v611_1, l_v612_1, l_v613_1 = l_settings_extra_0, v610, v611, v612, v613;
        l_v611_1 = function(v884)
            -- upvalues: l_l_settings_extra_0_1 (ref)
            local v885 = v884:get();
            l_l_settings_extra_0_1.range:visibility(v885);
            l_l_settings_extra_0_1.retreat:visibility(v885);
        end;
        l_l_settings_extra_0_1.dev_mode:set_callback(l_v611_1, true);
        v150.push(1, l_l_settings_extra_0_1.enabled);
        l_state_0.smart_peek = l_l_settings_extra_0_1;
        l_builder_0 = {
            enabled = l_send_0:switch(v536("transporter-1", "Dormant Aimbot", 2, 6))
        };
        l_v610_1 = l_builder_0.enabled:create();
        l_builder_0.hitboxes = l_v610_1:listable(v536("bullseye", "Hitboxes", 1, 7), {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Legs"
        });
        l_builder_0.alpha_modifier = l_v610_1:slider(v536("eye", "Alpha Modifier", 1, 6), 1, 100, 70, nil, "%");
        l_builder_0.minimum_damage = l_v610_1:slider(v536("arrow-down-9-1", "Min. Damage", 1, 6), 0, 130, 0, nil, function(v886)
            if v886 == 0 then
                return "Def.";
            elseif v886 > 100 then
                return "+" .. v886 - 100;
            else
                return;
            end;
        end);
        v564(l_builder_0.hitboxes);
        v150.push(-1, l_builder_0.enabled);
        l_state_0.dormant_aimbot = l_builder_0;
        l_v610_1 = {
            enabled = l_send_0:switch(v536("calendar-lines-pen", "Aimbot Logs", 1, 6))
        };
        l_v611_1 = l_v610_1.enabled:create();
        l_v610_1.default_colors = l_v611_1:color_picker(v536("palette", "Colors##DEFAULT", 1, 7), {
            Hit = {
                color(127, 180, 95, 255)
            }, 
            Miss = {
                color(132, 163, 209, 255)
            }
        });
        l_v610_1.output = l_v611_1:selectable(v536("list-ul", "Output", 1, 7), {
            [1] = "Console", 
            [2] = "Events", 
            [3] = "Render"
        });
        l_v610_1.custom_prefix = l_v611_1:input(v536("font", "Prefix", 1, 8), "");
        l_v610_1.print_commands = l_v611_1:button(v547("code", "Print Commands", 27), function()
            -- upvalues: v48 (ref)
            v48.log("Ragebot logs commands:\n");
            v48.log("pr= \226\128\148 Replace prefix with custom 'word'");
            v48.log("hit= \226\128\148 Replace hit with custom 'word'");
            v48.log("prbr=() \226\128\148 Set round brackets for prefix");
            v48.log("backtrack= \226\128\148 Replace backtrack with custom 'word'");
            v48.log("hitchance= \226\128\148 Replace hitchance with custom 'word'");
            v48.log("limiter= \226\128\148 Replace limiter with custom character");
            v48.log("rc \226\128\148 Remove color");
            v48.log("rprc \226\128\148 Remove prefix color");
            v48.log("rp \226\128\148 Remove prefix");
            v48.log("rb \226\128\148 Remove brackets");
            v48.log("rm \226\128\148 Remove mismatch");
            v48.log("rch \226\128\148 Remove hitchance color");
            v48.log("rhc \226\128\148 Remove hitchance");
            v48.log("rbt \226\128\148 Remove backtrack");
            v48.log("btms \226\128\148 Show backtrack in milliseconds");
            v48.log("sps \226\128\148 Separate spread in individual brackets");
            v48.log("spr \226\128\148 Always show spread (events)\n");
            v48.log("Example: pr=\"Frost\" rc");
        end, true);
        l_v610_1.offset_y = l_v611_1:slider(v536("arrows-up-down-left-right", "Offset", 1, 7), 0, 100, 80, nil, "%");
        l_v610_1.customize = l_v611_1:switch(v536("gear", "Customize", 1, 7));
        l_v610_1.radius = l_v611_1:combo(v536("circle", "Radius", 1, 7), {
            [1] = "Smooth", 
            [2] = "Semi-circle"
        });
        l_v610_1.padding = l_v611_1:slider(v536("ruler", "Padding", 1, 7), 4, 10, 6, nil, "px");
        l_v610_1.render_colors = l_v611_1:color_picker(v536("palette", "Colors##RENDER", 1, 7), {
            Hit = {
                color(168, 201, 228, 255)
            }, 
            Miss = {
                color(227, 168, 168, 255)
            }
        });
        l_v612_1 = nil;
        l_v613_1 = function(v887)
            -- upvalues: l_v610_1 (ref)
            local v888 = v887:get();
            l_v610_1.radius:visibility(v888);
            l_v610_1.padding:visibility(v888);
            l_v610_1.render_colors:visibility(v888);
        end;
        do
            local l_l_v613_1_0 = l_v613_1;
            local function v894(v890)
                -- upvalues: l_v610_1 (ref), l_l_v613_1_0 (ref)
                local v891 = v890:get("Console");
                local v892 = v890:get("Events");
                local v893 = v890:get("Render");
                l_v610_1.offset_y:visibility(v893);
                l_v610_1.customize:visibility(v893);
                l_v610_1.custom_prefix:visibility(v891 or v892);
                if v893 then
                    l_v610_1.customize:set_callback(l_l_v613_1_0, true);
                else
                    l_v610_1.customize:unset_callback(l_l_v613_1_0);
                end;
                if not v893 or not l_v610_1.customize:get() then
                    l_v610_1.radius:visibility(false);
                    l_v610_1.padding:visibility(false);
                    l_v610_1.render_colors:visibility(false);
                end;
            end;
            utils.execute_after(0, function()
                -- upvalues: l_v610_1 (ref), v894 (ref)
                l_v610_1.output:set_callback(v894, true);
            end);
        end;
        v564(l_v610_1.output);
        l_state_0.aimbot_logs = l_v610_1;
        l_v611_1 = {};
        l_v612_1 = {
            [1] = "Auto Snipers", 
            [2] = "AWP", 
            [3] = "Scout", 
            [4] = "Desert Eagle", 
            [5] = "Pistols", 
            [6] = "SMG", 
            [7] = "Rifles"
        };
        l_v613_1 = {
            [1] = "Standing", 
            [2] = "Slowwalking", 
            [3] = "Running", 
            [4] = "Ducking", 
            [5] = "Sneaking", 
            [6] = "In Air", 
            [7] = "In Air & Duck"
        };
        l_v611_1.enabled = l_send_0:switch(v536("eye-slash", "Auto Hide Shots", 0, 5), true);
        local v895 = l_v611_1.enabled:create();
        l_v611_1.weapons = v895:combo(v536("gun", "Weapons", 0, 6), l_v612_1);
        for v896 = 1, #l_v612_1 do
            local v897 = l_v612_1[v896];
            l_v611_1[v897] = {
                states = v895:selectable(v536("person-walking-arrow-loop-left", "States##" .. v897, 0, 5), l_v613_1)
            };
        end;
        local v898 = nil;
        do
            local l_l_v612_1_0 = l_v612_1;
            local function v905(v900)
                -- upvalues: l_l_v612_1_0 (ref), l_v611_1 (ref)
                local v901 = v900:get();
                for v902 = 1, #l_l_v612_1_0 do
                    local v903 = l_l_v612_1_0[v902];
                    local v904 = l_v611_1[v903];
                    if v904 ~= nil and v904.states ~= nil then
                        v904.states:visibility(v901 == v903);
                    end;
                end;
            end;
            l_v611_1.weapons:set_callback(v905, true);
            l_state_0.auto_hide_shots = l_v611_1;
        end;
        l_v612_1 = {};
        l_v613_1 = {
            [1] = "Auto", 
            [2] = "Deagle"
        };
        l_v612_1.enabled = l_send_0:switch(v536("head-side", "Force Lethal", 1, 7));
        v895 = l_v612_1.enabled:create();
        l_v612_1.weapons = v895:selectable("Weapons", l_v613_1);
        l_v612_1.mode = v895:combo("Mode", {
            [1] = "Default", 
            [2] = "Damage = HP/2"
        });
        for v906 = 1, #l_v613_1 do
            local v907 = l_v613_1[v906];
            l_v612_1[v907] = {
                hitchance = v895:slider(v907 .. " Hitchance", -1, 100, -1, nil, function(v908)
                    return v908 == -1 and "Off" or v908 .. "%";
                end)
            };
        end;
        v564(l_v612_1.weapons);
        v150.push(-1, l_v612_1.enabled);
        v898 = nil;
        do
            local l_l_v613_1_1 = l_v613_1;
            local function v913(_)
                -- upvalues: l_l_v613_1_1 (ref), l_v612_1 (ref)
                for v911 = 1, #l_l_v613_1_1 do
                    local v912 = l_l_v613_1_1[v911];
                    l_v612_1[v912].hitchance:visibility(l_v612_1.weapons:get(v912));
                end;
            end;
            l_v612_1.weapons:set_callback(v913, true);
            l_state_0.force_lethal = l_v612_1;
        end;
        l_v613_1 = {};
        v895 = {
            [1] = "AWP", 
            [2] = "SSG-08", 
            [3] = "AutoSnipers", 
            [4] = "Desert Eagle", 
            [5] = "R8 Revolver"
        };
        v898 = nil;
        local function v916(v914, v915)
            v914.enabled:visibility(v915);
            if not v914.enabled:get() then
                v915 = false;
            end;
            v914.value:visibility(v915);
        end;
        local function v919(v917, v918)
            v917.enabled:visibility(v918);
            if not v917.enabled:get() then
                v918 = false;
            end;
            v917.value:visibility(v918);
            v917.distance:visibility(v918);
        end;
        do
            local l_v895_0, l_v898_0, l_v916_0, l_v919_0 = v895, v898, v916, v919;
            do
                local l_l_v916_0_0, l_l_v919_0_0 = l_v916_0, l_v919_0;
                l_v898_0 = function()
                    -- upvalues: l_v613_1 (ref), l_v895_0 (ref), l_l_v916_0_0 (ref), l_l_v919_0_0 (ref)
                    local v926 = l_v613_1.weapon:get();
                    for v927 = 1, #l_v895_0 do
                        local v928 = l_v895_0[v927];
                        local v929 = v926 == v928;
                        local v930 = l_v613_1[v928];
                        if v930 ~= nil then
                            if v930["In Air"] ~= nil then
                                l_l_v916_0_0(v930["In Air"], v929);
                            end;
                            if v930["No Scope"] ~= nil then
                                l_l_v919_0_0(v930["No Scope"], v929);
                            end;
                        end;
                    end;
                end;
            end;
            l_v916_0 = function(v931)
                -- upvalues: v536 (ref), l_v898_0 (ref)
                local v932 = {};
                local function v934(v933)
                    v933[2] = v933[2] .. "##IN_AIR";
                end;
                v931:set_callback(v934);
                v932.enabled = v931:switch(v536("plane", "In Air", 1, 6));
                v932.value = v931:slider(v536("bullseye-arrow", "Value", 1, 7), 0, 100, 50, nil, "%");
                v932.enabled:set_callback(l_v898_0);
                v931:unset_callback(v934);
                return v932;
            end;
            l_v919_0 = function(v935)
                -- upvalues: v536 (ref), l_v898_0 (ref)
                local v936 = {};
                local function v938(v937)
                    v937[2] = v937[2] .. "##NO_SCOPE";
                end;
                v935:set_callback(v938);
                v936.enabled = v935:switch(v536("crosshairs", "No Scope", 1, 7));
                v936.value = v935:slider(v536("bullseye-arrow", "Value", 1, 7), 0, 100, 50, nil, "%");
                v936.distance = v935:slider(v536("ruler", "Distance", 1, 6), 30, 1001, 325, 0.1, function(v939)
                    if v939 == 1001 then
                        return "Inf.";
                    else
                        return string.format("%.1fft", v939 * 0.1);
                    end;
                end);
                v936.enabled:set_callback(l_v898_0);
                v935:unset_callback(v938);
                return v936;
            end;
            local function v949(v940, v941)
                -- upvalues: l_v916_0 (ref), l_v919_0 (ref)
                local v942 = {};
                local function v947(v943)
                    -- upvalues: v941 (ref)
                    local v944 = string.format("##%s", v941);
                    local _, v946 = string.find(v943[2], "##");
                    if v946 ~= nil then
                        v944 = v944 .. string.sub(v943[2], v946 + 1);
                    end;
                    v943[2] = v943[2] .. v944;
                end;
                v940:set_callback(v947);
                local v948 = v941 == "AWP" or not (v941 ~= "SSG-08") or v941 == "AutoSnipers";
                v942["In Air"] = l_v916_0(v940);
                if v948 then
                    v942["No Scope"] = l_v919_0(v940);
                end;
                v940:unset_callback(v947);
                return v942;
            end;
            l_v613_1.enabled = l_settings_0:switch(v536("dice", "Hitchance Modifier", 1, 5));
            local v950 = v47.cast(l_v613_1.enabled:create());
            l_v613_1.weapon = v950:combo(v536("gun", "Weapon", 1, 5), l_v895_0);
            for v951 = 1, #l_v895_0 do
                local v952 = l_v895_0[v951];
                l_v613_1[v952] = v949(v950, v952);
            end;
            local _ = nil;
            l_v613_1.weapon:set_callback(l_v898_0, true);
            l_v613_1.list = l_v895_0;
            l_state_0.hitchance_modifier = l_v613_1;
        end;
        v151.ragebot = l_state_0;
    end;
    l_send_0 = {};
    l_settings_0 = v565.features.visuals;
    l_settings_extra_0 = v565.features.render;
    v50.add("##VISUALS", l_settings_0, "VISUALS");
    v50.add("##RENDER", l_settings_extra_0, "RENDER");
    l_builder_0 = {
        label = l_settings_extra_0:label(v536("address-card", "Watermark", 0, 7))
    };
    v610 = l_builder_0.label:create();
    l_builder_0.style = v610:combo(v536("pencil", "Style", 1, 7), {
        [1] = "Default", 
        [2] = "New", 
        [3] = "Custom"
    });
    l_builder_0.radius = v610:combo(v536("circle", "Radius", 1, 7), {
        [1] = "Smooth", 
        [2] = "Semi-circle"
    });
    l_builder_0.display = v610:selectable(v536("display", "Display", 1, 7), {
        [1] = "User", 
        [2] = "FPS", 
        [3] = "Time"
    });
    l_builder_0.padding = v610:slider(v536("ruler", "Padding", 1, 7), 5, 10, 5, nil, "px");
    l_builder_0.color = v610:color_picker(v536("palette", "Color", 1, 7), {
        Single = {
            color(120, 200, 255, 255)
        }, 
        Gradient = {
            color(120, 200, 255, 255), 
            color(255, 255, 255, 255)
        }
    });
    l_builder_0.speed = v610:slider(v536("rabbit", "Speed", 1, 7), 1, 100, 16);
    l_builder_0.position = v610:combo(v536("arrows-up-down-left-right", "Position", 1, 7), {
        [1] = "Left", 
        [2] = "Right", 
        [3] = "Bottom", 
        [4] = "Custom"
    });
    l_builder_0.font = v610:combo(v536("font", "Font", 1, 7), {
        [1] = "Default", 
        [2] = "Pixel", 
        [3] = "Console", 
        [4] = "Bold"
    });
    l_builder_0.animation = v610:combo(v536("diagram-venn", "Animation", 0, 6), {
        [1] = "None", 
        [2] = "Encoded"
    });
    l_builder_0.text = v610:input(v536("text", "Text", 1, 7), "");
    l_builder_0.print_commands = v610:button(v547("code", "Print Commands", 4), function()
        -- upvalues: v48 (ref)
        v48.log("Commands:\n");
        v48.log("pre_icon=\"tree\" \226\128\148 Icon before prefix");
        v48.log("post_icon=\"tree\" \226\128\148 Icon after postfix");
        v48.log("pre=\"Frost.\" \226\128\148 Prefix text");
        v48.log("main=\"lua\" \226\128\148 Main text");
        v48.log("post=\"Text\" \226\128\148 Postfix text");
        v48.log("nobr \226\128\148 Remove brackets");
        v48.log("nomn \226\128\148 Remove main");
        v48.log("nopr \226\128\148 Remove postfix\n");
        v48.log("Example: pre_icon=\"snowflake\" pre=\"Frost.\" main=\"lua\" nopr");
    end, true);
    l_builder_0.custom_colors = {
        Pre = v610:color_picker(v536("palette", "Pre Color", 1, 7), {
            Single = {
                color(150, 200, 60, 255)
            }, 
            Gradient = {
                color(150, 200, 60, 255), 
                color(37, 100, 30, 255)
            }
        }), 
        Main = v610:color_picker(v536("palette", "Main Color", 1, 7), {
            Single = {
                color(255, 255, 255, 255)
            }, 
            Gradient = {
                color(255, 255, 255, 255), 
                color(128, 128, 128, 255)
            }
        }), 
        Post = v610:color_picker(v536("palette", "Post Color", 1, 7), {
            Single = {
                color(235, 97, 97, 255)
            }, 
            Gradient = {
                color(235, 97, 97, 255), 
                color(117, 48, 48, 255)
            }
        })
    };
    l_builder_0.colors_button = v610:button(v547("palette", "Colors", 4), nil, true);
    l_builder_0.back_button = v610:button(v547("arrow-turn-down-right", "Back", 47), nil, true);
    l_builder_0.custom_colors.Pre:visibility(false);
    l_builder_0.custom_colors.Main:visibility(false);
    l_builder_0.custom_colors.Post:visibility(false);
    l_builder_0.custom_colors.Main:set("Gradient");
    v610 = nil;
    do
        local l_l_builder_0_0, l_v610_2, l_v611_2 = l_builder_0, v610, v611;
        l_v611_2 = function(v957)
            -- upvalues: l_l_builder_0_0 (ref)
            l_l_builder_0_0.speed:visibility(v957:get() == "Gradient");
        end;
        do
            local l_l_v611_2_0, l_v612_2 = l_v611_2, v612;
            l_v612_2 = function(v960)
                -- upvalues: l_l_builder_0_0 (ref), l_l_v611_2_0 (ref)
                local v961 = v960 == "Default";
                local v962 = v960 == "New";
                local v963 = v960 == "Custom";
                local l_v962_0 = v962;
                local l_v962_1 = v962;
                local l_v962_2 = v962;
                local v967 = not v963;
                if v967 and v961 then
                    l_l_builder_0_0.color:set_callback(l_l_v611_2_0, true);
                else
                    l_l_builder_0_0.color:unset_callback(l_l_v611_2_0);
                end;
                l_l_builder_0_0.radius:visibility(l_v962_0);
                l_l_builder_0_0.display:visibility(l_v962_1);
                l_l_builder_0_0.padding:visibility(l_v962_2);
                l_l_builder_0_0.color:visibility(v967);
                l_l_builder_0_0.position:visibility(v963);
                l_l_builder_0_0.font:visibility(v963);
                l_l_builder_0_0.animation:visibility(v963);
                l_l_builder_0_0.text:visibility(v963);
                l_l_builder_0_0.print_commands:visibility(v963);
                l_l_builder_0_0.colors_button:visibility(v963);
            end;
            v613 = function()
                -- upvalues: l_l_builder_0_0 (ref)
                l_l_builder_0_0.style:visibility(false);
                l_l_builder_0_0.speed:visibility(false);
                l_l_builder_0_0.color:visibility(false);
                l_l_builder_0_0.position:visibility(false);
                l_l_builder_0_0.font:visibility(false);
                l_l_builder_0_0.animation:visibility(false);
                l_l_builder_0_0.text:visibility(false);
                l_l_builder_0_0.print_commands:visibility(false);
                l_l_builder_0_0.custom_colors.Pre:visibility(true);
                l_l_builder_0_0.custom_colors.Main:visibility(true);
                l_l_builder_0_0.custom_colors.Post:visibility(true);
                l_l_builder_0_0.colors_button:visibility(false);
                l_l_builder_0_0.back_button:visibility(true);
            end;
            local function v968()
                -- upvalues: l_l_builder_0_0 (ref), l_v612_2 (ref)
                l_l_builder_0_0.style:visibility(true);
                l_v612_2(l_l_builder_0_0.style:get());
                l_l_builder_0_0.custom_colors.Pre:visibility(false);
                l_l_builder_0_0.custom_colors.Main:visibility(false);
                l_l_builder_0_0.custom_colors.Post:visibility(false);
                l_l_builder_0_0.colors_button:visibility(true);
                l_l_builder_0_0.back_button:visibility(false);
            end;
            local function v970(v969)
                -- upvalues: l_v612_2 (ref)
                l_v612_2(v969:get());
            end;
            l_l_builder_0_0.colors_button:set_callback(v613, true);
            l_l_builder_0_0.back_button:set_callback(v968, true);
            l_l_builder_0_0.style:set_callback(v970, true);
        end;
        l_send_0.watermark = l_l_builder_0_0;
        l_v610_2 = {
            enabled = l_settings_extra_0:switch(v536("tag", "Clantag", 2, 7))
        };
        l_v611_2 = l_v610_2.enabled:create();
        l_v610_2.mode = l_v611_2:combo("Mode", {
            [1] = "Frost", 
            [2] = "Custom"
        });
        l_v610_2.style = l_v611_2:combo("##STYLE", {
            [1] = "Animated", 
            [2] = "Static"
        });
        l_v610_2.input = l_v611_2:input("##INPUT", "");
        v612 = nil;
        v613 = function(v971)
            -- upvalues: l_v610_2 (ref)
            local v972 = v971:get() == "Custom";
            l_v610_2.style:visibility(v972);
            l_v610_2.input:visibility(v972);
        end;
        do
            local l_v613_2 = v613;
            utils.execute_after(0, function()
                -- upvalues: l_v610_2 (ref), l_v613_2 (ref)
                l_v610_2.mode:set_callback(l_v613_2, true);
            end);
        end;
        l_send_0.clantag = l_v610_2;
        l_v611_2 = {
            enabled = l_settings_extra_0:switch(v536("sparkles", "Screen Indicator", 0, 8))
        };
        v612 = l_v611_2.enabled:create();
        l_v611_2.color = v612:color_picker(v536("palette", "Color", 1, 7), {
            Accent = {
                color(120, 200, 255, 255)
            }, 
            Secondary = {
                color(255, 255, 255, 255)
            }
        });
        l_v611_2.style = v612:combo(v536("pencil", "Style", 1, 7), {
            [1] = "Alternative", 
            [2] = "New", 
            [3] = "Modern"
        });
        l_v611_2.padding = v612:slider(v536("ruler", "Padding", 1, 7), 0, 10, 4, nil, "px");
        l_v611_2.offset = v612:slider(v536("arrows-up-down-left-right", "Offset", 1, 7), 5, 55, 24, nil, "px");
        l_v611_2.animation = v612:switch(v536("diagram-venn", "Animation", 0, 6));
        v613 = nil;
        local function v976(v974)
            -- upvalues: l_v611_2 (ref)
            local v975 = v974:get();
            l_v611_2.padding:visibility(v975 == "New");
        end;
        do
            local l_v976_0 = v976;
            utils.execute_after(0, function()
                -- upvalues: l_v611_2 (ref), l_v976_0 (ref)
                l_v611_2.style:set_callback(l_v976_0, true);
            end);
        end;
        l_send_0.screen_indicators = l_v611_2;
        v612 = {
            enabled = l_settings_extra_0:switch(v536("left-right", "Manual Arrows", 0, 8))
        };
        v613 = v612.enabled:create();
        v612.color = v613:color_picker(v536("palette", "Color", 1, 7), {
            Active = {
                color(170, 160, 180, 255)
            }, 
            Inactive = {
                color(0, 0, 0, 0)
            }
        });
        v612.style = v613:combo(v536("pencil", "Style", 1, 7), {
            [1] = "Classic", 
            [2] = "Modern", 
            [3] = "Triangle"
        });
        v612.animation = v613:switch(v536("diagram-venn", "Animation", 0, 6));
        l_send_0.manual_arrows = v612;
        v613 = {
            enabled = l_settings_extra_0:switch(v536("list-ol", "Damage Indicator", 0, 7))
        };
        v976 = v613.enabled:create();
        v613.color = v976:color_picker(v536("palette", "Color", 1, 7), color(255, 255, 255, 255));
        v613.font = v976:combo(v536("font", "Font", 2, 7), {
            [1] = "Default", 
            [2] = "Pixel", 
            [3] = "Bold"
        });
        v613.when_active = v976:switch(v536("heat", "When Active", 2, 7));
        v613.animation = v976:switch(v536("diagram-venn", "Animation", 0, 6));
        l_send_0.damage_indicator = v613;
        v976 = {
            enabled = l_settings_extra_0:switch(v536("percent", "Hitchance Indicator", 2, 8))
        };
        local v978 = v976.enabled:create();
        v976.color = v978:color_picker(v536("palette", "Color", 1, 7), color(255, 255, 255, 255));
        v976.font = v978:combo(v536("font", "Font", 2, 7), {
            [1] = "Default", 
            [2] = "Pixel", 
            [3] = "Bold"
        });
        v976.animation = v978:switch(v536("diagram-venn", "Animation", 0, 6));
        l_send_0.hitchance_indicator = v976;
        v978 = {
            enabled = l_settings_extra_0:switch(v536("triangle-exclamation", "Velocity Warning", 1, 6))
        };
        v978.color = v978.enabled:create():color_picker(v536("palette", "Color", 1, 7), color(120, 200, 255, 255));
        l_send_0.velocity_warning = v978;
        local v979 = {
            enabled = l_settings_0:switch(v536("crosshairs", "Custom Scope", 1, 7))
        };
        local v980 = v979.enabled:create();
        v979.color = v980:color_picker(v536("palette", "Color", 1, 7), {
            Main = {
                color(255, 255, 255, 255)
            }, 
            Edge = {
                color(255, 255, 255, 0)
            }
        });
        v979.offset = v980:slider(v536("arrows-up-down-left-right", "Offset", 1, 7), 0, 500, 10, nil, "px");
        v979.position = v980:slider(v536("arrows-minimize", "Position", 1, 7), 0, 500, 105, nil, "px");
        v979.thickness = v980:slider(v536("ruler", "Thickness", 1, 7), 1, 10, 1, nil, "px");
        v979.style = v980:combo(v536("pencil", "Style", 1, 7), {
            [1] = "Default", 
            [2] = "Rotated"
        });
        l_send_0.custom_scope = v979;
        v980 = {};
        local v981 = {
            [1] = "5:4", 
            [2] = "4:3", 
            [3] = "16:9", 
            [4] = "16:10"
        };
        local v982 = {
            ["16:9"] = 177, 
            ["4:3"] = 133, 
            ["5:4"] = 125, 
            ["16:10"] = 160
        };
        local v983 = {};
        for v984 = 1, #v981 do
            local v985 = v981[v984];
            v983[v982[v985]] = v985;
        end;
        v980.enabled = l_settings_0:switch(v536("up-right-and-down-left-from-center", "Aspect Ratio", 1, 7));
        local v986 = v980.enabled:create();
        do
            local l_v983_0 = v983;
            v980.value = v986:slider("##VALUE", 1, 200, 177, 0.01, function(v988)
                -- upvalues: l_v983_0 (ref)
                return l_v983_0[v988] or nil;
            end);
            for v989 = 1, #v981 do
                local v990 = v981[v989];
                local v991 = v982[v990];
                do
                    local l_v991_0 = v991;
                    local function v993()
                        -- upvalues: v980 (ref), l_v991_0 (ref)
                        v980.value:set(l_v991_0);
                    end;
                    v986:button(v513(v990, (math.ceil(#v990 * 1.34))), v993, true);
                end;
            end;
            l_send_0.aspect_ratio = v980;
        end;
        v981 = {
            enabled = l_settings_0:switch(v536("hand", "Viewmodel", 1, 7))
        };
        v982 = v981.enabled:create();
        v981.fov = v982:slider("FOV", 2000, 17000, 6800, 0.01);
        v981.offset_x = v982:slider("X", -2000, 2000, 0, 0.01);
        v981.offset_y = v982:slider("Y", -2000, 2000, 0, 0.01);
        v981.offset_z = v982:slider("Z", -2000, 2000, 0, 0.01);
        v981.opposite_knife_hand = v982:switch("Opposite Knife Hand");
        l_send_0.viewmodel = v981;
        v982 = {
            enabled = l_settings_0:switch(v536("circle", "Grenade Radius", 1, 7))
        };
        v983 = v982.enabled:create();
        v982.molotov = v983:switch(v536("fire", "Molotov", 1, 7), true);
        v982.molotov_color = v982.molotov:color_picker(color(245, 90, 90, 255));
        v982.smoke = v983:switch(v536("smoke", "Smoke", 0, 5), true);
        v982.smoke_color = v982.smoke:color_picker(color(130, 130, 255, 255));
        v986 = nil;
        local function v995(v994)
            -- upvalues: v982 (ref)
            if not v994:get() and not v982.smoke:get() then
                v982.smoke:set(true);
            end;
        end;
        local function v997(v996)
            -- upvalues: v982 (ref)
            if not v996:get() and not v982.molotov:get() then
                v982.molotov:set(true);
            end;
        end;
        v982.molotov:set_callback(v995);
        v982.smoke:set_callback(v997);
        l_send_0.grenade_radius = v982;
        v983 = {
            enabled = l_settings_0:switch(v536("dollar-sign", "500$ Indicators", 2, 9))
        };
        v986 = v983.enabled:create();
        v995 = {
            [1] = "Old"
        };
        if not v150.is_locked(-1) then
            table.insert(v995, "New");
        end;
        v983.style = v986:combo(v536("pencil", "Style", 1, 7), v995);
        v983.list = v986:listable("##LIST", {
            [1] = "Fake Duck", 
            [2] = "Double Tap", 
            [3] = "Hide Shots", 
            [4] = "Min. Damage", 
            [5] = "Force Body Aim", 
            [6] = "Force Safe Point", 
            [7] = "Fake Latency", 
            [8] = "Freestanding", 
            [9] = "Dormant Aimbot", 
            [10] = "Bomb Information", 
            [11] = "Hit/Miss Ratio"
        });
        v564(v983.list);
        l_send_0.skeet_indicators = v983;
        v986 = {
            enabled = l_settings_extra_0:switch(v536("bullseye", "Hit Markers", 1, 6))
        };
        v995 = v47.cast(v986.enabled:create());
        do
            local l_v995_0 = v995;
            v997 = function()
                -- upvalues: l_v995_0 (ref), v536 (ref)
                local v999 = {};
                local function v1001(v1000)
                    v1000[2] = v1000[2] .. "##KIBIT";
                end;
                l_v995_0:set_callback(v1001);
                v999.enabled = l_v995_0:switch(v536("toggle-on", "Enabled", 1, 6));
                v999.color = l_v995_0:color_picker(v536("palette", "Color", 1, 7), {
                    Vertical = {
                        color(0, 255, 0, 255)
                    }, 
                    Horizontal = {
                        color(0, 255, 255, 255)
                    }
                });
                v999.size = l_v995_0:slider(v536("arrows-up-down", "Size", 3, 9), 2, 6, 4, nil, "px");
                v999.thickness = l_v995_0:slider(v536("arrows-left-right", "Thickness", 1, 7), 1, 3, 2, nil, "px");
                l_v995_0:unset_callback(v1001);
                return v999;
            end;
            local function v1005()
                -- upvalues: l_v995_0 (ref), v536 (ref)
                local v1002 = {};
                local function v1004(v1003)
                    v1003[2] = v1003[2] .. "##SCREEN";
                end;
                l_v995_0:set_callback(v1004);
                v1002.enabled = l_v995_0:switch(v536("toggle-on", "Enabled", 1, 6));
                v1002.color = l_v995_0:color_picker(v536("palette", "Color", 1, 7), color(255, 255, 255, 255));
                l_v995_0:unset_callback(v1004);
                return v1002;
            end;
            local function v1009()
                -- upvalues: l_v995_0 (ref), v536 (ref)
                local v1006 = {};
                local function v1008(v1007)
                    v1007[2] = v1007[2] .. "##WORLD";
                end;
                l_v995_0:set_callback(v1008);
                v1006.enabled = l_v995_0:switch(v536("toggle-on", "Enabled", 1, 6));
                v1006.color = l_v995_0:color_picker(v536("palette", "Color", 1, 7), color(120, 200, 255, 255));
                v1006.add_glow = l_v995_0:switch(v536("keyboard-brightness", "Add Glow", 0, 6), true);
                l_v995_0:unset_callback(v1008);
                return v1006;
            end;
            v986.type = l_v995_0:list("##TYPE", {
                v536("plus-large", "Kibit", 1, 7), 
                v536("display", "Screen", 1, 6), 
                v536("earth-americas", "World", 1, 7)
            });
            v986.kibit = v997();
            v986.screen = v1005();
            v986.world = v1009();
            local _ = nil;
            local function v1022(v1011)
                -- upvalues: v986 (ref)
                local v1012 = v1011:get();
                local v1013 = v1012 == 1;
                local v1014 = v1012 == 2;
                local v1015 = v1012 == 3;
                for _, v1017 in pairs(v986.kibit) do
                    v1017:visibility(v1013);
                end;
                for _, v1019 in pairs(v986.screen) do
                    v1019:visibility(v1014);
                end;
                for _, v1021 in pairs(v986.world) do
                    v1021:visibility(v1015);
                end;
            end;
            v986.type:set_callback(v1022, true);
            l_send_0.hit_markers = v986;
        end;
        v151.visuals = l_send_0;
    end;
    l_settings_0 = {};
    l_settings_extra_0 = v565.features.misc;
    l_builder_0 = v565.features.movement;
    v50.add("##MISC", l_settings_extra_0, "MISC");
    v50.add("##MOVEMENT", l_builder_0, "MISC");
    v610 = {
        label = l_settings_extra_0:label(v536("signature", "Nickname Generator", 1, 5))
    };
    v611 = v610.label:create();
    v610.input = v611:input("##INPUT");
    v610.set_button = v611:button(v513("Set", 11), nil, false);
    v610.generate_button = v611:button(v513("Generate", 5), nil, true);
    v610.reset_button = v611:button(v513("Reset", 8), nil, true);
    l_settings_0.nickname_generator = v610;
    v611 = {
        label = l_settings_extra_0:label(v536("volume-high", "Unmute/Mute Silenced", 1, 5))
    };
    v611.mode = v611.label:create():list("##MODE", {
        [1] = "Disabled", 
        [2] = "Enemies", 
        [3] = "Teammates", 
        [4] = "Everyone"
    });
    v150.push(-1, v611.mode, 1);
    l_settings_0.unmute_mute_silenced = v611;
    v612 = {
        label = l_settings_extra_0:label(v536("duck", "Fake Duck", 2, 6))
    };
    v612.select = v612.label:create():listable("\a{Link Active}Options", {
        v536("duck", "Unlock Fake Duck Speed", 2, 6), 
        v536("wind-warning", "Freezetime Fake Duck", 1, 5)
    });
    l_settings_0.fake_duck = v612;
    v613 = {
        enabled = l_settings_extra_0:switch(v536("person-burst", "Air Duck Collision", 1, 5))
    };
    v150.push(1, v613.enabled);
    l_settings_0.air_duck_collision = v613;
    local v1023 = {
        enabled = l_settings_extra_0:switch(v536("signal-stream", "Ping Spike", 1, 6))
    };
    v1023.value = v1023.enabled:create():slider(v536("signal", "Latency", 0, 6), 0, 200, 0, nil, "ms");
    v150.push(1, v1023.enabled);
    l_settings_0.ping_spike = v1023;
    local v1024 = {
        enabled = l_settings_extra_0:switch(v536("frame", "FPS Optimize", 2, 7))
    };
    local v1025 = v1024.enabled:create();
    v1024.always_on = v1025:switch(v536("check", "Always On", 1, 7), false);
    v1024.detections = v1025:selectable(v536("eye", "Detections", 0, 6), {
        [1] = "Peeking", 
        [2] = "Hit Flag"
    });
    v1024.select = v1025:selectable(v536("filter", "Optimizations", 1, 6), {
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
        [11] = "Weapon effects"
    });
    local v1026 = nil;
    do
        local l_v1024_0, l_v1025_0 = v1024, v1025;
        local function v1030(v1029)
            -- upvalues: l_v1024_0 (ref)
            l_v1024_0.detections:visibility(not v1029:get());
        end;
        l_v1024_0.always_on:set_callback(v1030, true);
        v564(l_v1024_0.detections);
        v564(l_v1024_0.select, {
            [1] = "Blood", 
            [2] = "Decals", 
            [3] = "Sprites", 
            [4] = "Ropes", 
            [5] = "Dynamic lights", 
            [6] = "Weapon effects"
        });
        l_settings_0.fps_optimize = l_v1024_0;
        l_v1025_0 = {
            label = l_builder_0:label(v536("bomb", "Grenades", 1, 5))
        };
        v1026 = l_v1025_0.label:create();
        l_v1025_0.select = v1026:listable("\a{Link Active}Options", {
            v536("hands-holding-circle", "Super Toss", 1, 5), 
            v536("bomb", "Grenade Release", 2, 6), 
            v536("hand-holding", "Drop Nades", 1, 6)
        });
        l_v1025_0.drop_nades_select = v1026:listable("\a{Link Active}Select Drop Nades", {
            v536("fire", "Molotov", 2, 7), 
            v536("smoke", "Smoke", 1, 5), 
            v536("explosion", "Nade", 1, 7)
        });
        l_v1025_0.drop_nades_bind = v1026:hotkey("Hotkey");
        l_v1025_0.release_damage = v1026:slider("Amount", 1, 50, 50, nil, "hp");
        v150.push(1, l_v1025_0.label);
        v150.push(1, l_v1025_0.select, {});
        v564(l_v1025_0.drop_nades_select);
        v1030 = nil;
        local function v1032(v1031)
            -- upvalues: l_v1025_0 (ref)
            l_v1025_0.release_damage:visibility(v1031:get(2));
            l_v1025_0.drop_nades_bind:visibility(v1031:get(3));
            l_v1025_0.drop_nades_select:visibility(v1031:get(3));
        end;
        l_v1025_0.select:set_callback(v1032, true);
        l_settings_0.grenades = l_v1025_0;
        l_settings_0.no_fall_damage = {
            enabled = l_builder_0:switch(v536("person-falling", "No Fall Damage", 2, 7))
        };
        l_settings_0.fast_ladder = {
            enabled = l_builder_0:switch(v536("water-ladder", "Fast Ladder", 1, 6))
        };
        v151.misc = l_settings_0;
    end;
end;
v5("begin_localplayer");
v152 = nil;
v152 = {};
v153 = 0;
v492 = 0;
v152.is_onground = false;
v152.is_moving = false;
v152.is_crouched = false;
v152.is_peeking = false;
v152.is_vulnerable = false;
v152.velocity2d = 0;
v152.duck_amount = 0;
v152.team_num = 0;
v152.sent_packets = 0;
v506 = function(v1033, v1034, v1035)
    return v1033 + v1034 * (v1035 * globals.tickinterval);
end;
do
    local l_v153_3, l_v492_1, l_v506_0, l_v507_0 = v153, v492, v506, v507;
    l_v507_0 = function(v1040)
        -- upvalues: l_v506_0 (ref)
        local v1041 = false;
        local v1042 = false;
        local l_m_vecVelocity_0 = v1040.m_vecVelocity;
        local v1044 = v1040:get_eye_position();
        local v1045 = l_v506_0(v1044, l_m_vecVelocity_0, 14);
        local v1046 = entity.get_players(true);
        local v1047 = entity.get_threat(true);
        for v1048 = 1, #v1046 do
            local v1049 = v1046[v1048];
            if v1049:is_alive() then
                if v1049 == v1047 then
                    v1042 = true;
                else
                    local v1050 = v1049:get_hitbox_position(0);
                    local v1051 = l_v506_0(v1050, l_m_vecVelocity_0, 4);
                    local v1052 = utils.trace_bullet(v1040, v1045, v1051);
                    if v1052 ~= nil and v1052 > 0 then
                        v1041 = true;
                        break;
                    end;
                end;
            end;
        end;
        return v1041, v1042;
    end;
    v509 = function(v1053)
        -- upvalues: l_v507_0 (ref), l_v153_3 (ref), v152 (ref)
        local v1054 = entity.get_local_player();
        if v1054 == nil then
            return;
        else
            local v1055, v1056 = l_v507_0(v1054);
            l_v153_3 = v1054.m_fFlags;
            v152.velocity2d = v1054.m_vecVelocity:length2d();
            v152.is_peeking = v1055;
            v152.is_vulnerable = v1056;
            if v1053.choked_commands == 0 then
                v152.duck_amount = v1054.m_flDuckAmount;
                v152.sent_packets = v152.sent_packets + 1;
            end;
            v152.is_moving = v152.velocity2d > 3.63;
            v152.is_crouched = v152.duck_amount > 0;
            v152.team_num = v1054.m_iTeamNum;
            return;
        end;
    end;
    v513 = function(_)
        -- upvalues: l_v492_1 (ref), v152 (ref), l_v153_3 (ref)
        local v1058 = entity.get_local_player();
        if v1058 == nil then
            return;
        else
            l_v492_1 = v1058.m_fFlags;
            v152.is_onground = bit.band(l_v153_3, 1) == 1 and bit.band(l_v492_1, 1) == 1;
            return;
        end;
    end;
    v509 = v21("localplayer.on_createmove", v509);
    v513 = v21("localplayer.on_createmove_run", v513);
    events.createmove(v509);
    events.createmove_run(v513);
end;
v5("begin_exploit");
v153 = nil;
v153 = {};
v492 = nil;
v506 = 0;
v153.max_defensive_ticks = 0;
v153.defensive_ticks = 0;
v153.teleport_units_sqr = 0;
do
    local l_v492_2, l_v506_1, l_v507_1, l_v509_1, l_v513_0 = v492, v506, v507, v509, v513;
    l_v507_1 = function(v1064)
        -- upvalues: l_v506_1 (ref), v153 (ref)
        local l_m_nTickBase_0 = v1064.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_v506_1) > 64 then
            l_v506_1 = 0;
        end;
        local v1066 = 0;
        if l_v506_1 < l_m_nTickBase_0 then
            l_v506_1 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v506_1 then
            v1066 = math.min(14, math.max(0, l_v506_1 - l_m_nTickBase_0 - 1));
        end;
        if v1066 > 0 then
            if v153.max_defensive_ticks == 0 then
                v153.max_defensive_ticks = v1066;
            end;
            v153.defensive_ticks = v1066;
        else
            v153.defensive_ticks = 0;
            v153.max_defensive_ticks = 0;
        end;
    end;
    l_v509_1 = function(v1067, v1068)
        -- upvalues: v153 (ref)
        v153.teleport_units_sqr = (v1068 - v1067):lengthsqr();
    end;
    l_v513_0 = function(v1069)
        -- upvalues: l_v492_2 (ref), l_v509_1 (ref)
        local v1070 = v1069:get_simulation_time();
        if v1070 == nil then
            return;
        else
            local l_m_vecOrigin_0 = v1069.m_vecOrigin;
            if l_v492_2 ~= nil then
                local v1072 = to_ticks(v1070.current - v1070.old);
                if v1072 < 0 or v1072 > 0 and v1072 <= 64 then
                    l_v509_1(l_v492_2, l_m_vecOrigin_0);
                end;
            end;
            l_v492_2 = l_m_vecOrigin_0;
            return;
        end;
    end;
    local function v1074()
        -- upvalues: l_v507_1 (ref)
        local v1073 = entity.get_local_player();
        if v1073 == nil then
            return;
        else
            l_v507_1(v1073);
            return;
        end;
    end;
    local function v1076()
        -- upvalues: l_v513_0 (ref)
        local v1075 = entity.get_local_player();
        if v1075 == nil then
            return;
        else
            l_v513_0(v1075);
            return;
        end;
    end;
    v1074 = v21("exploit.on_createmove", v1074);
    v1076 = v21("exploit.on_net_update_start", v1076);
    events.createmove(v1074);
    events.net_update_start(v1076);
end;
v5("begin_statement");
v492 = nil;
v492 = {};
v506 = nil;
v507 = function()
    -- upvalues: v152 (ref), v25 (ref)
    if v152.is_onground then
        if v25.antiaim.misc.slow_walk:get() then
            return "Slowwalking";
        elseif v152.is_crouched then
            if v152.is_moving then
                return "Sneaking";
            else
                return "Ducking";
            end;
        elseif not v152.is_moving then
            return "Standing";
        else
            return "Running";
        end;
    elseif v152.is_crouched then
        return "In Air & Duck";
    else
        return "In Air";
    end;
end;
do
    local l_v506_2, l_v507_2 = v506, v507;
    v509 = function()
        -- upvalues: l_v506_2 (ref), l_v507_2 (ref)
        l_v506_2 = l_v507_2();
    end;
    v492.get = function()
        -- upvalues: l_v506_2 (ref)
        return l_v506_2;
    end;
    v509 = v21("statement.on_createmove", v509);
    events.createmove(v509);
end;
v5("begin_shot_system");
v506 = nil;
v506 = {};
v507 = v46:new();
v509 = {};
v513 = function(v1079)
    local l_tickcount_0 = globals.tickcount;
    local v1081 = v1079:get_eye_position();
    return {
        tick = l_tickcount_0, 
        player = v1079, 
        eye_pos = v1081, 
        impacts = {}
    };
end;
do
    local l_v507_3, l_v509_2, l_v513_1 = v507, v509, v513;
    local function v1087(v1085)
        -- upvalues: l_v509_2 (ref), l_v513_1 (ref)
        local v1086 = entity.get(v1085.userid, true);
        if v1086 == nil then
            return;
        else
            table.insert(l_v509_2, l_v513_1(v1086));
            return;
        end;
    end;
    local function v1093(v1088)
        -- upvalues: l_v509_2 (ref)
        local v1089 = entity.get(v1088.userid, true);
        local v1090 = entity.get(v1088.attacker, true);
        if v1089 == nil or v1090 == nil then
            return;
        else
            for v1091 = #l_v509_2, 1, -1 do
                local v1092 = l_v509_2[v1091];
                if v1092.player == v1090 then
                    v1092.victim = v1089;
                    v1092.damage = v1088.dmg_health;
                    v1092.hitgroup = v1088.hitgroup;
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v1099(v1094)
        -- upvalues: l_v509_2 (ref)
        local v1095 = entity.get(v1094.userid, true);
        if v1095 == nil then
            return;
        else
            for v1096 = #l_v509_2, 1, -1 do
                local v1097 = l_v509_2[v1096];
                if v1097.player == v1095 then
                    local v1098 = vector(v1094.x, v1094.y, v1094.z);
                    table.insert(v1097.impacts, v1098);
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v1111()
        -- upvalues: l_v509_2 (ref), l_v507_3 (ref), v24 (ref)
        local v1100 = entity.get_local_player();
        if v1100 == nil then
            return;
        else
            local v1101 = nil;
            if v1100:is_alive() then
                v1101 = v1100:get_hitbox_position(0);
            end;
            for v1102 = 1, #l_v509_2 do
                local v1103 = l_v509_2[v1102];
                if v1103.player ~= nil then
                    local v1104 = #v1103.impacts;
                    if v1104 ~= 0 then
                        local l_eye_pos_0 = v1103.eye_pos;
                        local v1106 = v1103.impacts[v1104];
                        if l_eye_pos_0 ~= nil and v1106 ~= nil then
                            l_v507_3.player_shot:fire({
                                tick = v1103.tick, 
                                player = v1103.player, 
                                victim = v1103.victim, 
                                eye_pos = l_eye_pos_0, 
                                end_pos = v1106, 
                                damage = v1103.damage, 
                                hitgroup = v1103.hitgroup
                            });
                            if v1101 ~= nil and v1103.player:is_enemy() then
                                local v1107 = v24.closest_ray_point(l_eye_pos_0, v1106, v1101, true);
                                local v1108 = v1101.distsqr(v1101, v1107);
                                if v1108 <= 6400 then
                                    local v1109 = math.sqrt(v1108);
                                    l_v507_3.enemy_shot:fire({
                                        tick = v1103.tick, 
                                        distance = v1109, 
                                        player = v1103.player, 
                                        victim = v1103.victim, 
                                        eye_pos = l_eye_pos_0, 
                                        end_pos = v1106, 
                                        damage = v1103.damage, 
                                        hitgroup = v1103.hitgroup
                                    });
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            for v1110 = 1, #l_v509_2 do
                l_v509_2[v1110] = nil;
            end;
            return;
        end;
    end;
    v506.get_event_bus = function()
        -- upvalues: l_v507_3 (ref)
        return l_v507_3;
    end;
    v1087 = v21("shot_system.on_weapon_fire", v1087);
    v1093 = v21("shot_system.on_player_hurt", v1093);
    v1099 = v21("shot_system.on_bullet_impact", v1099);
    v1111 = v21("shot_system.on_net_update_start", v1111);
    events.weapon_fire(v1087);
    events.player_hurt(v1093);
    events.bullet_impact(v1099);
    events.net_update_start(v1111);
end;
v5("begin_localdb");
v507 = nil;
v507 = {};
v509 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/=";
v513 = ".\\" .. v22.name;
local v1112 = v513 .. "\\db.dat";
local v1113 = {};
do
    local l_v509_3, l_v513_2, l_v1112_0, l_v1113_0 = v509, v513, v1112, v1113;
    local function v1118()
        -- upvalues: l_v1112_0 (ref)
        return files.read(l_v1112_0);
    end;
    local function v1121(v1119, v1120)
        -- upvalues: l_v1112_0 (ref)
        if v1120 == nil then
            v1120 = false;
        end;
        return files.write(l_v1112_0, v1119, v1120);
    end;
    local function v1127(v1122)
        -- upvalues: l_base64_0 (ref), l_v509_3 (ref)
        local l_status_0, l_result_0 = pcall(json.stringify, v1122);
        if not l_status_0 then
            return false, l_result_0;
        else
            local l_status_1, l_result_1 = pcall(l_base64_0.encode, l_result_0, l_v509_3);
            l_result_0 = l_result_1;
            if not l_status_1 then
                return false, l_result_0;
            else
                return true, l_result_0;
            end;
        end;
    end;
    local function v1133(v1128)
        -- upvalues: l_base64_0 (ref), l_v509_3 (ref)
        local l_status_2, l_result_2 = pcall(l_base64_0.decode, v1128, l_v509_3);
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
    local function v1137(v1134)
        -- upvalues: l_v513_2 (ref), v1127 (ref), v48 (ref), v1121 (ref)
        files.create_folder(l_v513_2);
        local v1135, v1136 = v1127(v1134);
        if not v1135 then
            v48.error("Unable to encode data");
            return false;
        elseif not v1121(v1136) then
            v48.error("Unable to write db");
            return false;
        else
            return true;
        end;
    end;
    local function v1141()
        -- upvalues: l_v513_2 (ref), v1118 (ref), v1137 (ref), v48 (ref), v1133 (ref)
        files.create_folder(l_v513_2);
        local v1138 = v1118();
        if v1138 == nil then
            if not v1137({}) then
                v48.log("Unable to create db");
            end;
            return {};
        else
            local v1139, v1140 = v1133(v1138);
            if not v1139 then
                v48.error("Unable to decode db");
                v48.log("Trying to flush db");
                if not v1137({}) then
                    v48.error("Unable to flush db");
                end;
                return {};
            else
                return v1140;
            end;
        end;
    end;
    local v1147 = {
        __index = function(_, v1143)
            -- upvalues: l_v1113_0 (ref)
            return l_v1113_0[v1143];
        end, 
        __newindex = function(_, v1145, v1146)
            -- upvalues: l_v1113_0 (ref), v1137 (ref)
            l_v1113_0[v1145] = v1146;
            v1137(l_v1113_0);
        end
    };
    l_v1113_0 = v1141();
    setmetatable(v507, v1147);
end;
v5("begin_binds_ctx");
v509 = nil;
v509 = {};
v513 = {};
do
    local l_v513_3 = v513;
    v1112 = function()
        -- upvalues: l_v513_3 (ref)
        local v1149 = ui.get_binds();
        for v1150 in pairs(l_v513_3) do
            l_v513_3[v1150] = nil;
        end;
        for v1151 = 1, #v1149 do
            local v1152 = v1149[v1151];
            l_v513_3[v1152.reference:id()] = v1152;
        end;
    end;
    v509.get = function(v1153)
        -- upvalues: l_v513_3 (ref)
        if v1153 == nil then
            return nil;
        else
            return l_v513_3[v1153:id()];
        end;
    end;
    v1112 = v21("binds_ctx.on_render", v1112);
    events.render(v1112);
end;
v5("begin_configs");
v513 = nil;
v513 = {};
v1112 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
do
    local l_v1112_1, l_v1113_1 = v1112, v1113;
    l_v1113_1 = function(v1156)
        -- upvalues: l_base64_0 (ref), l_v1112_1 (ref)
        local l_status_4, l_result_4 = pcall(json.stringify, v1156);
        if not l_status_4 then
            return false, l_result_4;
        else
            local l_status_5, l_result_5 = pcall(l_base64_0.encode, l_result_4, l_v1112_1);
            l_result_4 = l_result_5;
            l_status_4 = l_status_5;
            if not l_status_4 then
                return false, l_result_4;
            else
                return l_status_4, l_result_4;
            end;
        end;
    end;
    local function v1166(v1161)
        -- upvalues: l_base64_0 (ref), l_v1112_1 (ref)
        local l_status_6, l_result_6 = pcall(l_base64_0.decode, v1161, l_v1112_1);
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
    v513.encode = function(_, v1168)
        -- upvalues: l_v1113_1 (ref)
        return l_v1113_1(v1168);
    end;
    v513.decode = function(_, v1170)
        -- upvalues: v1166 (ref)
        return v1166(v1170);
    end;
end;
v5("begin_profile");
v1112 = nil;
v1113 = v151.profile;
local v1171 = v1113.debug_button or v1113.secret_button;
local v1172 = v1171:name();
local function v1177(v1173, v1174)
    -- upvalues: v147 (ref)
    local v1175 = ui.get_style()["Link Active"];
    local v1176 = v1175:clone();
    v1176.a = v1176.a * 0.5;
    v1173:name(v147.gradient(v1174, globals.realtime, v1175, v1176));
end;
do
    local l_v1171_0, l_v1172_0, l_v1177_0 = v1171, v1172, v1177;
    local v1181 = v21("configs.on_render", function()
        -- upvalues: l_v1177_0 (ref), l_v1171_0 (ref), l_v1172_0 (ref)
        l_v1177_0(l_v1171_0, l_v1172_0);
    end);
    events.render(v1181);
end;
v5("begin_activity");
v1113 = nil;
v1171 = v151.activity;
v1172 = "activity";
v1177 = {
    misses = 0, 
    killes = 0, 
    loads = 0
};
local v1182 = v507[v1172] or v1177;
local v1183 = 0;
local function v1189(v1184)
    local v1185 = {};
    local v1186 = math.floor(v1184 / 3600);
    local v1187 = math.floor(v1184 % 3600 / 60);
    local v1188 = v1184 % 60;
    if v1186 > 0 then
        table.insert(v1185, string.format("%dh", v1186));
    end;
    if v1187 > 0 then
        table.insert(v1185, string.format("%dm", v1187));
    end;
    table.insert(v1185, string.format("%ds", v1188));
    return table.concat(v1185, " ");
end;
do
    local l_v1171_1, l_v1172_1, l_v1182_0, l_v1183_0, l_v1189_0 = v1171, v1172, v1182, v1183, v1189;
    local function v1198(v1195)
        -- upvalues: l_v1189_0 (ref), l_v1171_1 (ref)
        local v1196 = l_v1189_0(v1195);
        local v1197 = string.format("\a{Link Active}%s##SESSION_TIME", v1196);
        l_v1171_1.session_time_button:name(v1197);
    end;
    local function v1202(v1199)
        -- upvalues: l_v1189_0 (ref), l_v1171_1 (ref)
        local v1200 = l_v1189_0(v1199);
        local v1201 = string.format("\a{Link Active}%s##TIME_LEFT", v1200);
        l_v1171_1.time_left_button:name(v1201);
    end;
    local function v1205(v1203)
        -- upvalues: l_v1171_1 (ref)
        local v1204 = string.format("\a{Link Active}%s##KILLES", v1203);
        l_v1171_1.killes_button:name(v1204);
    end;
    local function v1208(v1206)
        -- upvalues: l_v1171_1 (ref)
        local v1207 = string.format("\a{Link Active}%s##MISSES", v1206);
        l_v1171_1.misses_button:name(v1207);
    end;
    local function v1209()
        -- upvalues: v507 (ref), l_v1172_1 (ref), l_v1182_0 (ref)
        v507[l_v1172_1] = l_v1182_0;
    end;
    local function v1210()
        -- upvalues: v23 (ref), v1202 (ref), v1198 (ref), l_v1183_0 (ref), v1210 (ref)
        if v23.time ~= nil then
            v1202(v23.process());
        else
            v1198(l_v1183_0);
            l_v1183_0 = l_v1183_0 + 1;
        end;
        utils.execute_after(1, v1210);
    end;
    local function v1212(v1211)
        -- upvalues: l_v1182_0 (ref), v1208 (ref), v1209 (ref)
        if v1211.distance > 32 then
            return;
        else
            l_v1182_0.misses = l_v1182_0.misses + 1;
            v1208(l_v1182_0.misses);
            v1209();
            return;
        end;
    end;
    local function v1217(v1213)
        -- upvalues: l_v1182_0 (ref), v1205 (ref), v1209 (ref)
        local v1214 = entity.get_local_player();
        local v1215 = entity.get(v1213.userid, true);
        local v1216 = entity.get(v1213.attacker, true);
        if v1214 == v1215 or v1214 ~= v1216 then
            return;
        else
            l_v1182_0.killes = l_v1182_0.killes + 1;
            v1205(l_v1182_0.killes);
            v1209();
            return;
        end;
    end;
    local function v1218()
        -- upvalues: v1205 (ref), l_v1182_0 (ref), v1208 (ref), v1209 (ref)
        v1205(l_v1182_0.killes);
        v1208(l_v1182_0.misses);
        v1209();
    end;
    v506.get_event_bus().enemy_shot:set(v1212);
    v1217 = v21("activity.on_player_death", v1217);
    events.player_death(v1217);
    v1210();
    v1218();
end;
v5("begin_presets");
v1171 = nil;
v1172 = v151.presets;
v1177 = "presets";
v1182 = {};
v1183 = v507[v1177] or v1182;
v1189 = {};
local v1219 = {};
local v1220 = nil;
local l_match_0 = string.match;
do
    local l_l_match_0_0 = l_match_0;
    v1220 = function(v1223)
        -- upvalues: l_l_match_0_0 (ref)
        return l_l_match_0_0(v1223, "^()%s*$") and "" or l_l_match_0_0(v1223, "^%s*(.*%S)");
    end;
end;
do
    local l_v1172_2, l_v1177_1, l_v1183_1, l_v1189_1, l_v1219_0, l_v1220_0, l_l_match_0_1 = v1172, v1177, v1183, v1189, v1219, v1220, l_match_0;
    l_l_match_0_1 = function()
        -- upvalues: v507 (ref), l_v1177_1 (ref), l_v1183_1 (ref)
        v507[l_v1177_1] = l_v1183_1;
    end;
    local function v1235()
        -- upvalues: v50 (ref)
        local v1231 = {};
        local v1232 = v50.get();
        for v1233, v1234 in pairs(v1232) do
            v1231[v1233] = v1234[1]:export();
        end;
        return v1231;
    end;
    local function v1241(v1236)
        -- upvalues: v50 (ref)
        local v1237 = v50.get();
        for v1238, v1239 in pairs(v1236) do
            local v1240 = v1237[v1238];
            if v1240 ~= nil then
                v1240[1]:import(v1239);
            end;
        end;
    end;
    local function v1246(v1242, v1243, v1244, v1245)
        return {
            name = v1243, 
            author = v1242, 
            content = v1245, 
            created_at = v1244, 
            updated_at = v1244
        };
    end;
    local function v1249(v1247)
        -- upvalues: v1235 (ref), v1246 (ref)
        local v1248 = v1235();
        if v1248 == nil then
            return nil;
        else
            return v1246(common.get_username(), v1247, common.get_unixtime(), v1248);
        end;
    end;
    local function v1253(v1250)
        -- upvalues: v513 (ref), l_v1189_1 (ref)
        if type(v1250.content) == "string" then
            local v1251, v1252 = v513:decode(v1250.content);
            if not v1251 then
                return;
            else
                v1250.content = v1252;
            end;
        end;
        table.insert(l_v1189_1, v1250);
    end;
    local function v1257(v1254)
        -- upvalues: l_v1219_0 (ref)
        for v1255 = #l_v1219_0, 1, -1 do
            local v1256 = l_v1219_0[v1255];
            if v1256.name == v1254 then
                return v1256, v1255;
            end;
        end;
        return nil, -1;
    end;
    local function v1259(v1258)
        -- upvalues: l_v1219_0 (ref)
        return l_v1219_0[v1258];
    end;
    local function v1262(v1260)
        -- upvalues: v1257 (ref), l_v1220_0 (ref), v1241 (ref)
        local v1261 = v1257(l_v1220_0(v1260));
        if v1261 == nil or v1261.content == nil then
            return false, "Preset is not valid";
        else
            v1241(v1261.content);
            events.update_records:call();
            return true, v1261;
        end;
    end;
    local function v1269(v1263)
        -- upvalues: l_v1220_0 (ref), v1257 (ref), v1249 (ref), l_v1183_1 (ref), l_l_match_0_1 (ref), l_v1189_1 (ref), v1235 (ref)
        v1263 = l_v1220_0(v1263);
        if v1263 == "" then
            return false, "Preset name is empty";
        else
            local v1264, v1265 = v1257(v1263);
            if v1264 == nil then
                local v1266 = v1249(v1263);
                if v1266 == nil then
                    return false, "Unable to create preset";
                else
                    table.insert(l_v1183_1, v1266);
                    l_l_match_0_1();
                    return true, v1266;
                end;
            elseif v1265 ~= -1 and v1265 <= #l_v1189_1 then
                return false, "Can't modify script preset";
            else
                local v1267 = v1235();
                if v1267 == nil then
                    return false, "Unable to export config";
                else
                    local v1268 = common.get_unixtime();
                    v1264.content = v1267;
                    v1264.updated_at = v1268;
                    l_l_match_0_1();
                    return true, v1264;
                end;
            end;
        end;
    end;
    local function v1274(v1270)
        -- upvalues: v1257 (ref), l_v1220_0 (ref), l_v1189_1 (ref), l_v1183_1 (ref), l_l_match_0_1 (ref)
        local v1271, v1272 = v1257(l_v1220_0(v1270));
        if v1272 ~= -1 and v1272 <= #l_v1189_1 then
            return false, "Can't delete script preset";
        else
            local v1273 = v1272 - #l_v1189_1;
            table.remove(l_v1183_1, v1273);
            l_l_match_0_1();
            return true, v1271;
        end;
    end;
    local function v1279()
        -- upvalues: l_v1219_0 (ref), l_v1189_1 (ref)
        local v1275 = #l_v1219_0;
        if v1275 == 0 then
            return {
                [1] = "Empty"
            };
        else
            local v1276 = {};
            for v1277 = 1, v1275 do
                local l_name_0 = l_v1219_0[v1277].name;
                if v1277 <= #l_v1189_1 then
                    l_name_0 = string.format("%s\a{Disabled Text}  ~  pinned", l_name_0);
                end;
                v1276[v1277] = l_name_0;
            end;
            return v1276;
        end;
    end;
    local function v1284()
        -- upvalues: l_v1219_0 (ref), l_v1189_1 (ref), l_v1183_1 (ref)
        l_v1219_0 = {};
        for v1280 = 1, #l_v1189_1 do
            table.insert(l_v1219_0, l_v1189_1[v1280]);
        end;
        table.sort(l_v1183_1, function(v1281, v1282)
            return v1281.name < v1282.name;
        end);
        for v1283 = 1, #l_v1183_1 do
            table.insert(l_v1219_0, l_v1183_1[v1283]);
        end;
    end;
    local _ = nil;
    local function v1289(v1286)
        -- upvalues: v1259 (ref), l_v1172_2 (ref)
        local v1287 = v1286:get();
        if v1287 == nil or v1287 <= 0 then
            return;
        else
            local v1288 = v1259(v1287);
            if v1288 == nil then
                return;
            else
                l_v1172_2.name:set(v1288.name);
                return;
            end;
        end;
    end;
    local function v1292()
        -- upvalues: v1262 (ref), l_v1172_2 (ref), v48 (ref)
        local v1290, v1291 = v1262(l_v1172_2.name:get());
        if not v1290 then
            v48.error(v1291);
            return;
        else
            events.update_records:call();
            v48.success(string.format("preset %s loaded", v1291.name));
            return;
        end;
    end;
    local function v1295()
        -- upvalues: v1269 (ref), l_v1172_2 (ref), v48 (ref), v1284 (ref), v1279 (ref)
        local v1293, v1294 = v1269(l_v1172_2.name:get());
        if not v1293 then
            v48.error(v1294);
            return;
        else
            v1284();
            l_v1172_2.list:update(v1279());
            v48.success(string.format("preset %s saved", v1294.name));
            return;
        end;
    end;
    local function v1298()
        -- upvalues: v1274 (ref), l_v1172_2 (ref), v48 (ref), v1284 (ref), v1279 (ref)
        local v1296, v1297 = v1274(l_v1172_2.name:get());
        if not v1296 then
            v48.error(v1297);
            return;
        else
            v1284();
            l_v1172_2.list:update(v1279());
            if v1297 ~= nil then
                v48.success(string.format("preset %s deleted", v1297.name));
            end;
            return;
        end;
    end;
    local function v1302()
        -- upvalues: v1235 (ref), v513 (ref), v48 (ref), l_clipboard_0 (ref)
        local v1299 = v1235();
        if v1299 == nil then
            return;
        else
            local v1300, v1301 = v513:encode(v1299);
            if not v1300 then
                v48.error("can't encode data");
                return;
            else
                l_clipboard_0.set(string.format("%s_", v1301));
                v48.success("preset exported");
                return;
            end;
        end;
    end;
    local function v1306()
        -- upvalues: l_clipboard_0 (ref), v513 (ref), v48 (ref), v1241 (ref)
        local v1303 = string.match(l_clipboard_0.get(), "(.-)_");
        if v1303 == nil then
            return;
        else
            local v1304, v1305 = v513:decode(v1303);
            if not v1304 then
                v48.error("can't decode data");
                return;
            else
                v1241(v1305);
                events.update_records:call();
                v48.success("preset imported");
                return;
            end;
        end;
    end;
    l_v1172_2.list:set_callback(v1289);
    l_v1172_2.load:set_callback(v1292);
    l_v1172_2.save:set_callback(v1295);
    l_v1172_2.delete:set_callback(v1298);
    l_v1172_2.export:set_callback(v1302);
    l_v1172_2.import:set_callback(v1306);
    v1253(v1246("density", "Snappy", -1, "qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8rzafYzaRrgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbY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gob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrB1Br8lBaR1BpldzIG9fofYgr80zaBYBeldzoNQ4eldgaEngrM7za9nzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhmIvpOSg78F0bXF0IfoDdqHldBoBCBoUrBsU1gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobHgrBCgrRYzZldzIG9fofYgr80zaBYBeldzoNQ4eldBr91gsElBrRngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBryHgoE7Bo97BZldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQvcdNNXSfdzdvxSVfCzsfrBrEnzsBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoOQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoOQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBlza87gsfYBok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD2ht29foEn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zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgamQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoEHht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoEHht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDnht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRlgoyHBry2BpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD2gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsS7gRS7Q6feNpOFAdzdv6kF2AfdldfCgNsbkBmZghUHmhRIZ6c5p6OCfjfIG9foElza8HgsU0Bae9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoEYgsMnza97BZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzogQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoB7ht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBomQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrzS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fof7goynBsN9fowxSVfCgr9nzsyrgrN9foDlht29fo91gsb2go90gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzogQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgS7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBCBo9CzsEHBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foBrBsECgr91gok9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrUYgaBrgaU7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQskie6Oip6OCfjfIG9fofCgaUYzayHgop9fowxSVfCgr9nzsyrgrN9foDlht29fofrBoyYgrU0Bre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoR0zabYzaM7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoU2ht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBomQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQRS7mpO5eHcPUdzdvxSVfrBaEYBsfYBsR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsylBo8CzsRlSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr8Hza9nzsRrBHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgoR2grbCBag9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQRS7mH8nGwc59dzdvxSVfrgoUlBayCBaB1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjBrNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1BaBCBs91BrN9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sB7ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBoZQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDCht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgaf1Bs9CgaU2BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf0BrEngo91gHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHmhmIvpOSg78F0bXF0IfoDdqHldBsB1gr90gob1geldzIG9fofYgr80zaBYBeldzoNQ4eldBoUrgo90BablSVfjqHldBo9Ygob1Br9lSVfjgV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4skQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72zP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9HgsR0BaRrzZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaElBs92za92gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhtF1yUFpCfoDdqHldBsB7BsBYgsfCBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzoeQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoBHht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBopQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrgP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Y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fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBlBaM2BsRCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB1Bo91zsECBsk9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZld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gr80zaBYBeldzomQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoB0ht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldzsMlgsbCgaU2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoElht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzd72gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfj4sE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGBskQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQRSHgAcYkY8F2TXF0IfoDdqHldBs9lgoE1Bo9lgeldzIG9fofYgr80zaBYBeldzoNQ4eldBofngoEnga8YSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobYBrM2gr9lgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldza8nzaylBrRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQsc5Z3Xnp6OCfjfIG9foflBs92gsyngrN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaMnBa81gsO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElBsf7gabnBZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Bsy0grR1zaM2SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhRYm3c5mwc59dzdvxSVf2BaB7goRHgrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE1BsMrzsflSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjgapQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGgS7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE2za97BoMCgZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBoMYBoRHza8HSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaeQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CgP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfrht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foEYgry1ga81zam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gaUnBaU7gsEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gayHBs9lgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoR7zsMlBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9YBsbrgsEYgHldzIG9fofYgr80zaBYBeldzoElBP7ASVfCgr92zsBHBs91SVfjqHldBo9Ygob1Br9lSVfjBsMlht29fof1zaE7BoblBom9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfHBoy2gob7zaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2zsM2BaMnBsRHSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgPHQht29fo92zsbYBoMHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofrzaEYBaR0grp9fowxSVfCgr9nzsyrgrN9foDrht29foBrgryYzs9Ygo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7grR0gs9lBaN9fowxSVfCgr9nzsyrgrN9foDCBaNQhSHQfdldfCgNspmvURpgSHgeZemvsbksS7Z8ZevNfoDdqHldBsUHzsU1gry2gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzafHBaErBo92SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrR0BoM0zaR0BeldzIG9fofYgr80zaBYBeldzo3QhS7ASVfrgaflBrR2go9YSVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBt29foE0BrU0gobYgeldzo8Y4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOS7AqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1BpldzoMASVf2zsf1Bof0goe9foDC4eldBsbrgabnzs97SVfjzsMASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsRnzsy1zaBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BoUlgoEYBaE7SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDH4eldBoM0BaR2gsM2zeldzoEASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9nBafnBsfCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBofHBa92zsMngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUlBaR2BrMngag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRCga9lBoBrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof1BoblgrRlgsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BrfngsM2grU0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaM0BsR1BrEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2grUrBaRrzablSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gr8lBrMnBr9nSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2za9nBsBnzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsyCBrRrgaRHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoB0Bs8nBsfHBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoR2Ba8nBs87BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoy1zsbngrBHgpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrM1BsR1gabrzZldzIG9fofYgr80zaBYBeldzokQ4eldBrE1gobrgaBYgeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrBCgsRYBoRCgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaBHgsM1gaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgsyrBaMrzae9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgrf0gobnBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUCgobrBrf2Bov9fowxSVfCgr9nzsyrgrN9fow79IZpht29foyHBo80Brb7zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy1zaflBaEHBeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzsUCBry2Bs9HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzs80zsRCgsM1SVfjqHldBo9Ygob1Br9lSVfjkPvH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zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7membZzR7pFmZQaZeQEOFO3kF27foDdqHldBsElBay7goECgeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrRlBrfCgrblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCgoR0gob2goRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzsBlBrylBrR2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBrU0gofCgoN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7BaEngrBCBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foB7goM7gsy2gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhmPZoXnp6OCfjfIG9foEYBoB1BaElBam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobYBrfYgr8YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBrf1Bo87goRrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrRHBrBrgsfrBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaMCga8CzaE2gHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldgaM1BrU2BrMrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobHgrb2grE7BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7OCOFZrkie6Oip6OCfjfIG9fof2gaf2gaB7zs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fofHgoR1gsfCzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof1BsbnBrbHgak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foB7gof2BayCzap9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngab7gaEHzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9nzs8lBr9CSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfoDdqHldBs9rzaRrgoE0gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoErzsU0grb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBr9HBaMYBoErSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMC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go80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BobCBrM0zsb0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhsn1yRiZpXCfjfIG9fofCgsfrgaBlBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo80Ba8ngrBnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsUlBsU7BaBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7BoU0gsECzab1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfnzs8HBo92zaO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9HgsB2BoElBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQtkF06XF0IfoDdqHldBs9CBoMrBoR0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2za92grRCga87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoBYgoBnBrf1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za92Bsf0zsm9fowx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qHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgr82gsMHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgry1gafYgrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go92goBYzs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRn0p8FGwc59dzdvxSVfCBrynBaMrBrN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfj4sy0hSHQ4eldBoRYBsRrgrf0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoblgoBnBr81BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoEHBY7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7Bsblgr9HBsy7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7Boy1gaylBo90SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU1zsE7zsf7gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgsR2Bob1goECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRSHg78F0bXF0IfoDdqHldBsR1zsMrgaBnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBsbCBrynBa97geldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrflzafYBof7zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrBlgsbYgrB7BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgsR2Ba87goblSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaM2goErgoMYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza8rgr8Czs9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmiZ58SZAkVfjfIG9foE2grblgsB2geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsyrBoB7goU2zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoUnzay2grUrgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoR7BrRCgrRCzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBa9YgoMlBsk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgofCzsBnBag9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0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SVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVf2gsM1za9YgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf2goRHgsB0BoflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb0gr87BrbCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foD7ht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoBnBsMCBaUHzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gs9rgaM2gsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9YzsbCgrEnzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foE2zs97zaMCBHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foECBab7gaElBam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zaU0BrE2gap9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgoM1goB0zsBrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCza8CgafYBsb1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foBHBaU1zsR0gaN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDCBIHQht29foB1Ba9YBrE1Bap9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQWcdNUOFZTfoDdqHldBs9lgr9CgoRHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBofHBoR0gaBlgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7Bof2go9ngog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlgsynBrynzae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BrBrgayYgrm9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoRYBsUYgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQtkF06XF0IfoDdqHldBs8Hga80gsR2zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsy7gaRHBafCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE0zsRnBrfngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgob2Br8nBov9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlBaRnBa9ngaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlzaMrBs9YBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoM7BsEngsE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQsciQYkneAXnp6OCfjfIG9foElzaErBofHgZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf2zsb7gsR7zs8nSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnBa8YBaB7zsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDGzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobngry1zab2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBryrBo92gof2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foRHgaUCBsBCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgs9ngs8YBs8nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHld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gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za87gafHBom9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRSHg78F0bXF0IfoDdqHldBsflgaB0BaB1BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs8Ygs81BrfnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBs9rgaUnzaE1gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BaB0BrbHza39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngob1BoB7gsv9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgof7BrBCzafCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf0BrBYBaEnzaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4Vfof7Z8ZevNfoDdqHldBob0BsE7zaynBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElgaMYBr87zae9fowxSVfCgr9nzsyrgrN9foD2BaM2ht29foElgobrgoR1BrZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grBHBaU1grN9fowxSVfCgr9nzsyrgrN9foDrBoZQ4eldBs9HzaM7BoM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE0Bs8Ygsylgs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoR1BrbYzsbnSVfjqHldBo9Ygob1Br9lSVfjBrfHht29fofrBrBCgsfHBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof7BafHBsR2grm9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfCgrR1BsfCBsyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobnBaU1zaM0zeldzIG9fofYgr80zaBYBeldzoRlht29fof0zsR2goE2zak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsE7goBrBoE2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoErgoRHBrU2SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfCBr9rgsyHgHldzIG9fofYgr80zaBYBeldzoRlht29foBCgsMYzsB0za39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgs9HBa9CBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBryngsBYzaM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foRlBaElBsE0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR1zsMYBrB1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CBrE0go82geldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBosRpsUCfjfIG9foE7grM0gaUYgov9fowxSVf7BaRlgayCBsRlSVfjqHldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1BafYgsRrgre9fowxSVf7BaRlgayCBsRlSVfjqHldBsRrzs9HzaMHgpldz50HcilASVfrBs87BsBlgap9fow6kF2A4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpld78WmykVl784UKGVHfgV/74xUGQV+78aU6giv74Z9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfrBsb7goUCgrk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfngofHBaEngrg9fowxSVfCgr9nzsyrgrN9foD2zsyrht29foyYzsM2Bsy0BeldzIG9fofYgr80zaBYBeldzogQ4eldzsfnBaE0zak9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBrUCBob0gaEHBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsUnBsRYgrU7SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo82Bs9ngaBlBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblgsE1Bo90SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYzV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9lgs8HBs80zZldzIG9fofYgr80zaBYBeldzoblhSHQhtfAfdBosRQFmRHespUdzdvxSVf2gryYBsE2BrbHSVfjqHldgaMHBaU1BoEHBeldzIG9foElza9rgrfrgr39fowxSVfCgr9nzsyrgrN9foDYht29fof1BabCgafrgoe9fowxSVfCgr9nzsyrgrN9foDCgS7ASVfrBayHgrBlgaRYSVfjqHldBo9Ygob1Br9lSVfjgrvQ4eldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof7BrM7Bsy1Bag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB7BrMngaUCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQfdldfCgtURkeUbQRfoDdqHldBsMnBr92Br91BpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgsRCBsB0zs39fowxSVfCgr9nzsyrgrN9foDrzS7ASVfCBoy1BoRnBoE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHBsyHBsBYBZldzIG9fofYgr80zaBYBeldzoeQ4eldBoBngaRngsRrBeldzIG9fofYgr80zaBYBeldzokQ4eldBo91goM0Br90gHldzIG9fofYgr80zaBYBeldzof1ht29fof1gaMrza87BaZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgr90goRlzab2SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldgaRrgo8HBsE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsM2BsBCBoECSVfjqHldBo9Ygob1Br9lSVfjBreQhS7ASVf2zsb7zaRrBaE1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaBngs9rza97SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBsUHgrRHBr97BpldzIG9fofYgr80zaBYBeldzovQ4eldBof7grblBsEHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7Br87BsfnBeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7Br8nBaRCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrE1BsErzsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsM0zaErBoy0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoMYgsb1zs8CSVfjqHldBo9Ygob1Br9lSVfjBomQhS7ASVfCgrbngoyCBaBCSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BsElBa8rBsf0SVfjcIZAcV29foE7BsyYzaB7Bsv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBsbrgaR1zsynSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4obCgsU0BafnBaECgaflgoRASVf2gr9ngrO9foDl4o97gsM0zaMHgaUlzsMCgrEASVf2gr9nzak9foDl4o9CgsU0Baf2BoU7BaU0BakQSS7ASVfCBay0BrR0BaM0SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4obCgsU0BafnBaECgaflgoRASVf2gr9ngrO9foDl4o97gaf7BaEnga9Hgo9YgabASVf2gr9nzak9foDl4o9CgsU0BaEHBoyrgsy7gIHkhS7ASVfCBablgsEHBaE1SVfjBSHQ4eldBsyngafrzafYzZldzIG9fofYgr80zaBYBeldzogQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsR0zsE0BryHSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsR2zs87zs97gaMrBry24eldBs9Ygo9nSVfjBV1nzs9Czs92gsR1gs9lza8C4eldBs9YgoyYSVfjBV1HgryHgsU0BoyrBafYgoU0hZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BayCzs80gafYBsM1gr8H4eldBs9Ygo9nSVfjBV1ngoBrgrU2BoR0gs97zabASVf2gr9nzak9foDl4o8lgoyHBrUCgsRlBo9YgreQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7gsU2ga8ngsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINC8IfDJtNl9oH9SeldOnp6OnZC9nZ69nR6OIvp8FG0Se29fdMyXip7WZ29SVvfXSm9Seldfimpcie0WZ29SVvbOF23qZ29SVfyfivCWtywfPNC8IfQJVby95m7fPvofiv38nG795eoXrH9SeldOiZA8Sp9Seldfi3wkigD8F0oOsH9SeldXig9SeldfPvl95g9fI7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfrgryYBsMHBsy2SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYgV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrB1gaEnBo8YzeldzIG9fofYgr80zaBYBeldzoOQ4eldgaf2BrU2zaRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldzsM2BsBCBoECSVfjqHldBo9Ygob1Br9lSVfjBsZQhS7ASVfrzsRHgsyCgov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsfrgrBHBrbYSVfjqHldBo9Ygob1Br9lSVfj4seQ4eldBsRrBaf2grElSVfjqHldBo9Ygob1Br9lSVfj4seQ4eldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoeQ4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4VfofHvesbmeRdfjfIG9fofHBo80zsU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBaU7BrRHzaf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zaf0gob7BrBlgobCBob2BC29foEYgr8YgpldzoM6go82go9HgrR2BoM0BoR04eldBs9YgoyYSVfjBV1nBr9ngoblBo81gsEngsmQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBrE0zsB7BsEnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCgrbYgsRlBaEYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9lgsy1BoBYBaUYBsbHgaBASVf2gr9ngrO9foDl4o8CgrUHBsMlBoR0grylzayASVf2gr9nzak9foDl4o8ngo8ngo81goRrgay1BsOQSS7ASVfrgoEHgr9YBrBnSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foDl4oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBngrbHgsUrzam9fowxSVf7BaRlgayCBsRlSVfjqHldBsBYgry1goE1SVfjcIZAcV29foE7Ba80goEYgaZ9fowxSVfCgr9nzsyrgrN9foDlht29foEHgabCgaRCzZldz50HcilASVf2go9nBsR1BoUrSVfjqHldBo9Ygob1Br9lSVfjSVvl95RQSe29f50HcFvp9oe9Seldfi0KcF1yc5Ql9pldht29foEngr87gaRngrN9fowxSVfCgr9nzsyrgrN9foDCht29foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDCht29fofCBsMHgsf0gHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oy7grMHzay0BofHBaMnBt29foEYgr8YBZldzoM6grbCBsRnzsB7grB1BsR0Bd29foEYgr8YgpldzoM6gofrgsf0gaB7BoM7BsM2gd29foEYgr81gHldzoM6goRlzsylgaECzs8lBaRCgSHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rzaMrzsf2zsBYzsUCgsMH4eldBs9Ygo9nSVfjBV1rzaMrzsf2zsBYzsUCgsMH4eldBs9YgoyYSVfjBV10BoEHgoynzsEYBrM7zsbrht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oE1zafrgsB2Bo9lBafYBs8ASVf2gr9ngrO9foDl4oE1zafrgsB2Bo9lBafYBs8ASVf2gr9nzak9foDl4oUHzayCBrRnBs8nzaB0gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCgsylgsMYBo87SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zaMrzsf2goB0zsE0Boy24eldBs9Ygo9nSVfjBV1nBa91gaB2goMnBobCgrfH4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4of1gofYgaRCBoR7BobHBrRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyCgrECBsy2Beldz50HcilASVfrBrUrgoMnBsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YzsMrzsf0zsU1zaMngr8r4eldBs9Ygo9nSVfjBV1YzsMrzsf0zsU1zaMngr8r4eldBs9YgoyYSVfjBV1YzsMrzsf0zsU1zaMngr8rhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4of1gofYgaRCBoR7BobHBrRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoM6BrylBoM1BrUrBo8YgaUlzV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gr87gabYBoylBsflzaU0gd29foEYgr8YgpldzoM6zaflzs8lgrMlgsE2zsBCgV29foEYgr81gHldzoM6go9lBrb2gab0zsbnBsyHBYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1HzaBrBrBrBsB7goR2Bsy74eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRrBrBrBrBnBsE7zayrgafASVf2gr9ngrO9foDl4oRrBrBrBrBnBsE7zayrgafASVf2gr9nzak9foDl4oRrBrBrBrBnBsE7zayrgavQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBYBay7gsy0zav9fowxSVfCgr9nzsyrgrN9foD2ht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9foDlht29foUCBsErgrMnzaO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldzsfnBo80ga91SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBa8lzsBCgrm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBay0Br8HBaB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfrgryHzayrgo9nSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCzaM1grMlgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaUlBaM0Bs8rSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2gsUngaflgsy0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBo9HBs8CgaRCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foECgs8HBr9HBrZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoM6BPHkht29foBrgafHgr9ngrp9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoM6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBof1zs8Cgo8rBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4o91gaB2Br90grbHBa97ga8ASVf2gr9nzak9foDl4oUYBaR1zafngoy7zsR2gr3QSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgablgo8CBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr9CgaR7grf2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB2gs8HgrblBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBrM2Boflzag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BoB2ga92zsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Brf0goMrBok9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldgrb0zsy0gse9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2zafYgr9Ygsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9CzsfHgr87BrfCBoylzayASVf2gr9ngrO9foDl4o9CzsfHgr87BrfCBoylzayASVf2gr9nzak9foDl4o9CzsfHgr87BrfCBoylza3QSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHzs91gsBrzsN9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fob1BsR7BoBnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDCht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzomQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9fofYzs80BrU7zag9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6za9Ygrf0BoBYBa90goflgV29foEYgr8YgpldzoM6goR2BrRlgaB1gsb7zaE1Bt29foEYgr81gHldzoM6goBnBoRYzaynzayngsbngYHkht29foB2gs82goyYzae9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjgSHQhS7d4VfofHvWsHmhUHmhmiZ58SZAkVfjf50Hcild4VfofHvWsHmhUHmhmPZoXnp6OCfjf50Hcild4VfofHvWsHmhUHmhmIvpOSg78F0bXF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQvcdNNXSfdzdv6kF2AfdldfCgts7QRS7gRS7p6fEew9dM5fEmH8nAdzdv6kF2AfdldfCgts7QRS7gRS7Q6feNpOFAdzdv6kF2AfdldfCgts7QRS7gRSHvHc50wc59dzdv6kF2AfdldfCgts7QRS7gRSHgAcYkY8F2TXF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQsc5Z3Xnp6OCfjf50Hcild4VfofHvWsHmhUHmhRYm3c5mwc59dzdv6kF2AfdldfCgts7QRSHmhmiZ58SZAkVfjf50Hcild4VfofHvWsHmhZeQEkFgTXF0IfoDdcIZAcVfAfdBoRbQWZeQRS7OCOFZrkie6Oip6OCfjf50Hcild4VfofHvWsHmhZeQvcdNNXSfdzdv6kF2AfdldfCgts7QRSHmhtF1yUFpCfV8ymPZoXCfjf50Hcild4VfofHvWsHmhZeQWcdNUOFZTfoDdcIZAcVfAfdBoRbQWZeQRSHvHc50wc59dzdv6kF2AfdldfCgts7QRSHmhRn2KkYk3ciGwc59dzdv6kF2AfdldfCgts7QRSHmhRn0p8FGwc59dzdv6kF2AfdldfCgts7QRSHmhRYm3c5mwc59dzdv6kF2AfdldfCgFtZgZUR2sfoDdqHldBsB1Ba9nBayCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foB2grMrzsEYzag9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rgsf0gaE2zaRCBrR0gr9C4eldBs9Ygo9nSVfjBV1rgsf0gaE2zaRCBrR0gr9C4eldBs9YgoyYSVfjBV10goMYzaUrgrRngo9HgrvQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofYgr80zaBYBeldzImCkFZQ4eldBrRYBryCgrErgHldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4oRlzsylBrbHBa91goR0Ba8ASVf2gr9nzak9foDl4oRlzsylBrbHBa91goR0BaOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofYgr80zaBYBeldzImCkFZQhS7ASVf2gaBCBaEHBsBCSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2Ba8Yzay2BsMrSVfjcIZAcV29fof7goU2zaMCBak9fow6kF2A4eldBrU7BoU2BaRnSVfjcIZAcV29foBYzayYgaUYgrO9fowxSVfCgr9nzsyrgrN9foD2BoZQ4eldgaB0zs9lgrE1SVfjcIZAcPHQ4eldBsRYgrMlgaEYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEHga82BsRYzag9fowxSVfCgr9nzsyrgrN9foDCBaUYht29foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaflgsyYgo9rBeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsyYgrRYgs8HgHldzIG9fofYgr80zaBYBeldzoNQ4eldBoErBoUngsbngHldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foflzablgoRngs39fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoM6gsy7BrErgrRlBo8YBaf1zV29foEYgr8YgpldzoM6gsy7BrErgrRlBo8YBaf1zV29foEYgr81gHldzoM6gsy7BrErgrRlBo8YBaf1zPHkht29foflzabrgab0gov9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9Ygo9nSVfjBV1HBoyrzaUCgoyCzaB1gaUASVf2gr9nzak9foDl4oRCzaB1gafnzaf1Bry7gPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrU2Ba9lzs8nzeldzIG9fofYgr80zaBYBeldzoE0BY7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD1hSHQ4eldgo81gsf1BsylSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gr9ngoe9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBs9Ygo8CSVfjqHldBo9Ygob1Br9lSVfj4sElBP7ASVf2gr9ngog9fowxSVfCgr9nzsyrgrN9foDCBaNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoRlBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQhS7dhU==_"));
    v1253(v1246("density", "Snappy2", -1, "qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8rzafYzaRrgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQaZeQEkFgTXF0IfoDdqHldBsfnBsfrBrU2gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUnht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CzS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVf2grfYBsbHgrk9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrB1Br8lBaR1BpldzIG9fofYgr80zaBYBeldzoNQ4eldgaEngrM7za9nzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoE0ht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhmIvpOSg78F0bXF0IfoDdqHldBoBCBoUrBsU1gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobHgrBCgrRYzZldzIG9fofYgr80zaBYBeldzoNQ4eldBr91gsElBrRngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBryHgoE7Bo97BZldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQvcdNNXSfdzdvxSVfCzsfrBrEnzsBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoOQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoOQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBlza87gsfYBok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD2ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBsmQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoB7ht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foD2ht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVfrgs87zsR0BrElSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr8YBsBnzab1BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRS7p6fEew9dM5fEmH8nAdzdvxSVfCzaR2BsUngsyYSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGzP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCBS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoZQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfHht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUCht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgsMnzaRrzaECSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzobHht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzokQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzokQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQWcdNUOFZTfoDdcIZAcVfAfdBoUR0PsEZsS7gRSHvHc50wc59dzdvxSVf2BayngsR7zsM2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgsZQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgsZQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzokQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2grRlgoyYgae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDrht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBokQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrzS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fof7goynBsN9fowxSVfCgr9nzsyrgrN9foDlht29fo91gsb2go90gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD2BP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzogQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUCht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzogQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBCBo9CzsEHBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foBrBsECgr91gok9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDnht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrUYgaBrgaU7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQaZeQskie6Oip6OCfjfIG9fofCgaUYzayHgop9fowxSVfCgr9nzsyrgrN9foDlht29fofrBoyYgrU0Bre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoR0zabYzaM7SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfrht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0PsEZsSHmhmiZ58SZAkVfjfIG9foBlBs92Bo92gs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB2zaMCgof0gsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgoR1gr80gsBrSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngsEYzsflBHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHmhmPZoXnp6OCfjfIG9foBngaMlzaflBr39fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDHzP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBrM7BofHBrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrylBrf2gryrBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUnht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CzS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfj4sfHht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBskQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoE7ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsvQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoRlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhS7ASVf7Boy2grf7gaErSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzd72gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBspQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobrBs8ngryYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghZeQi95Zp9Ym3c5mwc59dzdvxSVf2BryYgrbnzsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaBngrblzsN9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGgY7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfj4sE1ht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrRHgsblgsB0SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BsM2grE1grEHSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfdzdvxSVf2BrU2Br9HBoflSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrpQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sE7ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDGBoOQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDrht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDrgP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBof7grU1gsB1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzoR1ht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzoR1ht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDHzP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzoR1ht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD1ht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDnht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foDnht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgs92goR1za8HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1BrRCgrBrBog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoElht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfyvdNEkFgTfoDdqHldBoBngsf2zsErgHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzogQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoElht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoZQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBI7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7A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zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsSHmhRn2KkYk3ciGwc59dzdvxSVf2grMnBsyCgrM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBo8nBs87gok9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoOQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCzs9rBaEYgrMnSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfj4sE1BP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBsylht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go81zaMrgsZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQRSHg6OFeTXF0IfoDdqHldBoM2grEHza8YBeldzIG9fofYgr80zaBYBeldzoNQ4eldBoylBa8lgoyHgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzoOQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfj4sEnht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsM2BoU7zs82SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2zabYgsy1Bae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDrht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBspQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CgS7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoUHht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldzImCkFZQhSHQfdldfCgNsbkBmZghZeQskie6Oip6OCfjfIG9foElBrUngsRYBrm9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bsy2BaB0BoN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd7Hht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsE1grUCBafHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgs3Q4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzoR1ht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCBa9CgsR1goZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBogQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhR7ZRZEpzmHBdzdvxSVf2gr91zaUnzay7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsU7goM7gaR2gpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1gsEYBaU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBo8HgablBaB1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgrE0BrR2grk9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBo9YBsbrgsEYzeldzIG9fofYgr80zaBYBeldzoElBP7ASVfCzay2gaf0Baf7SVfjqHldBo9Ygob1Br9lSVfjBsMlhSHQ4eldgsf1Bs80gaylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsblBsMlgoEHgZldzIG9fofYgr80zaBYBeldzogQ4eldBoBngaRngsRrBeldzIG9fofYgr80zaBYBeldzomQhS7ASVfYBsb0grflgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBry2grMHzs90SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBr91grbYgr81SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga9HzsRYBaMlSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRHQeFemtUtfjfIG9foE7gsb7za91BsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrgoE1ga82Bog9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBoyCgsM2BrfYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBHzsflzsyHzsN9fowxSVfCgr9nzsyrgrN9foD1hSHQ4eldBrUCBaBHBs8YgHldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foDngC29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzobl4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCBoRlgrE0Ba8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaMlgsErBa87BHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgob1zayrgZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgaf7Ba82grM2geldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgt29foflzsMHBsRlBs39foD24eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgoMCgoECBog9fowxSVfCgr9nzsyrgrN9foDlht29fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfHBoUYBafrBrg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzaf0Ba9HBaRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNspmvURpgSHgRUZmefoDdqHldBsBCgoRlBs97zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBsUlzsEHzaB2gHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs97BrMHBry0BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9nBaBlgoBYgpldzIG9fofYgr80zaBYBeldzokQ4eldBsyYgoErgoy7BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoE1BoBHBrUHgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrzsEngoECgsg9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofHBsMngoEngaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1zab0go9rgsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlzaEHzaU0Brp9fowxSVfCgr9nzsyrgrN9foDYht29foB2za80BrUrgrm9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBrBoRHgrfHBoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBryrgsRlzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BaR1BrMlBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7Ba9Czs80goMYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7Bo80BrBCBsfCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf1gsfnzsB0ga39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1zayCBaM2gsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29fob7BoB1BsEYgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fobnzsbHBoRlzeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRvtZZmeS7gRS7mpO5eH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SVfCgr9nzsyrgrN9foD0ht29foE1zsB1Bsb7Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrM2BaRHgaBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgEmROespgvZbZhUHmhmiZ58SZAkVfjfIG9foE2BaM1ga82Bom9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoBHBaBCBo90BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBo8Hzs80Bs8HBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBobrBaB1BaBHBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafY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Br9lSVfjBYHQht29foBHgsBrBrRCBre9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlBoUnBoy2Bsk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlzaB7BsBlBrg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf0gs90Bs92gaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQi95Zp9Ym3c5mwc59dzdvxSVfCBsUCBsUrgab1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgs8HzaRCBoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzaE0goB0gsUYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrga8CBsM1Boy0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgoU0gaU2gs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfYgobnBaBYBpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7p6fEew9dfjfIG9foEYBryHBr82zsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCBI7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fof2Brb7zs90geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoBYgsMlgrf2BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof7BabHBab2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCgaU0grEYBrMnSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVfrBo81gayrBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzomQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfHgoy0gof1Brp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfV8ymPZoXCfjfIG9fof2BoBYga87BsO9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgobCBs90zsb7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo9rBob2BsRHzZldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzofChSHQ4eldBrMlgofYzsRHBHldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrBof2BoB7gaMlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7BsBngs8lgoU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaf0BoBlzsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7Q6feNpOFAdzdvxSVfCBoRCBrUrBaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsMngo9rgop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrb7BaE7gaMrgZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgaf7zsR2Boy0zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldgobngsfYBsynSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfYgsRrBsf2Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRIZ6c5p6OCfjfIG9foEYBoflBrfHzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyYBs9HBoUngeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo8rgr8rgoBCzeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzayYBsECzsb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7Bsbngay2zaRYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfngaB7zs82gaZ9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9lBof1BsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQsciQYkneAXnp6OCfjfIG9fofrzsfnBrB0grN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fofHBab0gaU1Brm9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrBHzaU2grE0gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzd71zS7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr9rzaU1gsk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyr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zaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foE0BoB1goMYgam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foBCBayCgrfCga39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foBrBaR0gr9rgag9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrRHBsMnga80BeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrylBs82Br8lgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrynBr9nBobYBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRS7mpO5eHcPUdzdvxSVf2Bs90BaRrBsm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foE1Brfrga87Bs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fof7goy1Bs97BrO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgaBHBo9HBop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrMYgr8lBaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr8CBobrgoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfngofYgrBlgov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBSHQhS7d4Vfof7membZzR7pFmZQRS7mH8nGwc59dzdvxSVf2BoyHgrfYzsUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoUHgsBlBsf0zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrM0Bs9YBoB2gpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEngoU1BoUlzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsyHBoU1gayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfYgaM1goM2zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fobrBa92gay0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmIvpOSg78F0bXF0IfoDdqHldBsM7Baf2BoM1BZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb2grB0grE0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCBaB7Br9YBoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCBrE7BsUYBaB1SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1gaB0BoR0grp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfYgaUCzayHgZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfoDdqHldBsMnBs9YzsEHzZldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBY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ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQhS7d4Vfof7membZzR7pFmZQRS7p6fEew9dM5fEmH8nAdzdvxSVf2BsbYgaylBog9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD1zS7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2BoM0gaU2BaM7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsy7zsB2BsU0SVfjqHldBo9Ygob1Br9lSVfjgV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgapQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoElht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBo8lza8rzsbrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBoynBoUCgrE0zeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfrgsM7zabHzsUlSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBovQhS7ASVfrzaMYgrB2zaM0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhsn1yRiZpXCfjfIG9foEYBa9YBo8Hgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fofCgsfHzsUrBak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgafCBs8Ygo8rSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7BaR1goB1goy2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BsBrBrU1gr97SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8HgrE7grRHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQhtfAfdBomEZimR0stZOeSHmhRIZ6c5p6OCfjfIG9foEngsUnzsRHBs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foE1gaUHgsMCBoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zsbHgoBCgoO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBr80BsBngofCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7BaMHgoMYgoUlSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BaylBrEYgrBrSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8lgaE2goR2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQhtfAfdBomEZimR0stZOeSHmhRn2KkYk3ciGwc59dzdvxSVf2Bay2BrfCgsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBsb0gaRHgabngpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoMngrMrgabYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfj4sy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0go91zay0Bse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29foB1BrfYBs8CBse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgsU7BoErBo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foRYgoRngrEngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhRn0p8FGwc59dzdvxSVf2goMnzaBHgrR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf2zsEnBoM7gof2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCBsynzabrBrE0SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzd71zSHQht29fofngsy2za8CBaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foD2gsgQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBo92gobYBsECBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBHgrBHzsM0BpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzayngaUCgsf7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQskie6Oip6OCfjfIG9foECBaUrzsMrzag9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrRnzaBCgop9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foEYBrU7goy2zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzsMrzsB0gsy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgo80zafrgaRCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8CgaBrBoyCBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldzsBrgrM2goyHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhSHQfdldfCgeFemtUtfjfIG9fof0zsE2gay1goe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaUlgrBngay2SVfjqHldBo9Ygob1Br9lSVfjBsMlBS7ASVf2Ba80Br8HzaBHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs9rgsM7za9lSVfjqHldBo9Ygob1Br9lSVfjBrfHht29foEYgsylgaflzaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsEngrR1BaR1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofHzaB0grb0gpldzIG9fofYgr80zaBYBeldzoBCgS7ASVfCBrBrBoRCgsMYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgaMCgsEHBs97SVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBo9HzaECBoE1BHldzIG9fofYgr80zaBYBeldzoRlht29fof0goM7zaylzs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsbHBs82BsyYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrE2ga8rBrf2BZldzIG9fofYgr80zaBYBeldzovQ4eldBrf2Br8HgsB7BZldzIG9fofYgr80zaBYBeldzoRlht29foBCBoBYBrR1gsk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoRlgrbrzsy1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrRYgsMYBoE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB1goRrgrylzaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBaM2BaE2zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHzablgrBrzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBoB2zs8nBsm9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7HvR7BdzdvxSVf2ga9lzsU7gr8CSVfjqHldgaMHBaU1BoEHBeldzIG9fobCBoMCBoyCBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMCgrRHBr92SVfjqHldgaMHBaU1BoEHBeldzIG9foEHBrbYgsylgsO9fow6kF2A4eldBrEngaErBaU0SVfjcIZAcV29foBYgrBYzsbrgsZ9fowxSVfCgr9nzsyrgrN9fow9fGia78PUAgiV74xUGtaUKQV+74hUKGiM74omdkVHSVvQ4eldgoB7BrBYBrflSVfjcIZAcPHQ4eldBrE0ga87Bo9YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldgo8CgsM2go9rSVfjqHldBo9Ygob1Br9lSVfjBsb1BY7ASVf1grblBsE1zsN9fowxSVfCgr9nzsyrgrN9foDrht29fobCgoM2zsyYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7Bof0zsU2gsv9fowxSVf7BaRlgayCBsRlSVfjqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoNQhS7ASVfnBsEYgoUrBav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BaR2zafYzZldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgryASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYBaRngsEnzsp9fowxSVfCgr9nzsyrgrN9foD0BPHQhS7d4Vfof7HWZbZgmR0RfoDdqHldBs91grE2BsB0gZldzIG9foUlgsM7zaf2gsN9fowxSVf2BayYBr9CBr91SVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCzaM0BoUCBr82SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBrM1gs9rBaUHgHldzIG9fofYgr80zaBYBeldzo9Cht29fobCBoMCBoyCBpldzIG9fofYgr80zaBYBeldzogQhS7ASVfCgaBlgaE1zaMrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgaBlgoU7BpldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoRbePmRvWZVfjfIG9foElgoBYBsBYzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2grRHBoErzsb1SVfjqHldBo9Ygob1Br9lSVfjBrpQ4eldBof1zafHgof2BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsE1gsErgre9fowxSVfCgr9nzsyrgrN9foD2ht29fofrgoUHgoRHBrN9fowxSVfCgr9nzsyrgrN9foDYht29fofYza8lzsBYzsk9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfCzaUlBryngaMHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBr9Yzs8HBay0BZldzIG9fofYgr80zaBYBeldzofHht29foUHBr8ngsE2geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblBsErBof2BpldzIG9fofYgr80zaBYBeldzoB2hSHQ4eldBsb0gayHBrM2zeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsMrgoRYBryYgeldzIG9fofYgr80zaBYBeldzofHht29foE7gs9HgsBYgav9fowxSVfCgr9nzsyrgrN9foDCht29fofCga90BaE2gsg9fowxSVfCgr9nzsyrgrN9foDlht29fofrgaBngaECgoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgaBngoMHBog9fowxSVfCgr9nzsyrgrN9foDlht29foB2zaE2BrbCzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaElzsy2Brf1zZldzIG9fofYgr80zaBYBeldzoNQ4eldgaflgrR0zabnBpldzIG9fofYgr80zaBYBeldzof7hSHQ4eldBo90go81BoMrBpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsE2BaMnBrECzZldz50HcilASVf2gaE1gryrgaECSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BoR7zsMCgoM2BoUCBa8H4eldBs9Ygo9nSVfjBV1YgaRlzsylgsU7BablBo924eldBs9YgoyYSVfjBV1YBoR7zsMCBsf7gaM7zsMYhZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10BoR7zsMCgoM2BoUCBa8H4eldBs9Ygo9nSVfjBV1YgaUCgaM2goUYgs8YgrU04eldBs9YgoyYSVfjBV1YBoR7zsM2gsf1BrR1gaOQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foE1goUCBryCgrp9fowxSVfCgr9nzsyrgrN9foDrht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzogQ4eldBobHzsb2zsB1gZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2zsB7gsy0zaO9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zabHBsbngabYgaUlBrB1Bt29foEYgr8YgpldzoM6gobYBobYBsRHzaRYBaynBd29foEYgr81gHldzoM6gs91gsR7zsf1BrMCgr87zSHkht29foflzabrgsblBap9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zsM1BobnzsUCgrElza9ngt29foEYgr8YgpldzoM6go8rBr97BsfHzsRYgay04eldBs9YgoyYSVfjBV1nBa81gsB7BoRHBafYgr92hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgaR7BsUngoRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINCWZ29SVvoXip68Z29SVfytip7WZ29SVvDXSm9Seldfimpcie0WZ29SVvbOF23qZ29SVfyfivCWtywfPNC8IfQJVby95m7fPvofiv38nG795eoXrH9SeldOiZA8Sp9Seldfi3wkigD8F0oOsH9SeldXig9SeldSVvQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjBsMlhSHQ4eldBr91grElgsE1BZldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjO5eA9nRASVf2zsf1Bof0goe9fow79IZp4eldBsbrgabnzs97SVfjgrUASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQSt29fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBrzaU2gofngr39fowxSVfCgr9nzsyrgrN9foDnht29foUCBsB7BsyHgHldzIG9fofYgr80zaBYBeldzoylht29foblBsErBof2BpldzIG9fofYgr80zaBYBeldzoEHhSHQ4eldBrbHgsR1Bo8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsRCBr9rgsB0gHldzIG9fofYgr80zaBYBeldzd72ht29foEHBrMCBs92BeldzIG9fofYgr80zaBYBeldzd72ht29foflzabrgoRlBrm9fowxSVfCgr9nzsyrgrN9foD2ht29foRCzaB7gafCgpldzIG9fofYgr80zaBYBeldzogQhSHQfdldfCgtmR0EmZfdzdvxSVfCgsfnzsb7Bs92SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoE1Bo9Ygr9HgHldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrM7gaBHgsyCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oyCzs80gaBrBa80Bof0BsBASVf2gr9ngrO9foDl4o8nBs8Ygs9HBsflzsfHzt29foEYgr81gHldzoM6goBYgo80BafnzaR2goR7hZHQht29foflzsMHBsRlBs39foDlhSHQht29foB2zsbrgaE2goN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBo90grRHBaM2gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YBaR1zafrgrM7grE0gsUr4eldBs9Ygo9nSVfjBV1nBo97gsElBafHzs91Bay14eldBs9YgoyYSVfjBV1ngo8ngo8nza8HBrU1zaEnhZHQ4eldBr82gs9YgrBrgpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgo90gsR7Bry7SVfjqHldgaMHBaU1BoEHBeldzIG9foErgr91za82zeldz50HcilASVf2gaMnzs82grUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsU0BoUHBop9fow6kF2A4eldBs8YgoEHzaf7BHldzIG9fofYgr80zaBYBeldzpld9PvpWZ29SVv6kFHdOSf2Se29fdN6cnH6fi0K9Pv9fI7ASVf2go9ngaUHgo9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBoElgsRCzsk9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV11ga9lgsy1zsfCgsMlgoEASVf2gr9ngre9foDl4o90BoEHgobrga9rzaEHzsfASVf2gr9ngrO9foDl4o8CBrRCzsUrgaflgaElBs8ASVf2gr9nzak9foDl4o8HBab1BaU2BobnBaMHBoZQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr8YgpldzoM6BrylBrbCBsbrgrb7BoRlgt29foEYgr81gHldzoM6zsf2gs81gob2grBlgab0BY7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV12zayCBrRrBsfYBaMCgrEn4eldBs9Ygo9nSVfjBV12zayCBrRrBsfYBaMCgrEn4eldBs9YgoyYSVfjBV17gsy1BoBHgoEngoyrzsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzo3Q4eldBoR1BaRlgrfngeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oylBrbCBs8rzsb2zsf1Bt29foEYgr8YgpldzoM6goMYzaUrBs8lgof0Bo9Cgt29foEYgr81gHldzoM6goB0BoEHgrMYgr91zsBlgYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1Cza8CgrUHBofHgaf0gsBH4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fof1Bo92BoE1BsN9fow6kF2A4eldBrB7Br8lgoElSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6grblBrbCzsb7zaylgo9nBC29foEYgr8YgpldzoM6grblBrbCzsb7zaylgo9nBC29foEYgr81gHldzoM6grblBrbCzsb7zaylgo9nBYHkht29foyHgabnBaR0gZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1Cza8CgrUHBofHgaf0gsBH4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lht2xSVf2gr9ngrN9foDl4oB1BaflzaB7BrfngrU7BayASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4o9ngaU0grf1BaECBay7zs8ASVf2gr9ngrO9foDl4oyCBabnBa9lBaR2BsbrBoUASVf2gr9nzak9foDl4o8YBaB0BsU0zsb0goE1gsgQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6gsyrBrBrBrErga8HBsE1gV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BP7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9Ygo9nSVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9YgoyYSVfjBV1HBrBrBrBrgoE2gay1BrUChZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoE2Br9lgoynSVfjqHldBo9Ygob1Br9lSVfjBsMlht29fobCgofnzsUYzeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrMnBabrBo97SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpldSVvQ4eldBr91gsy1Br8YgpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Boylza9lBa9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7BaMlzsEnBHldzIG9fofYgr80zaBYBeldzomQ4eldBsR7goUCBaR1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBofYgsEnBoUHBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2BoRngsBYgsBHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSS7ASVfrBrUCgs9Ygo90SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofCzabnBo8nBrg9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrU0Ba8nBoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBYBoUHga9CBZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrBsRngs90Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrBlBsfCBayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgafrBsUYBsb1BZldzIG9fofYgr80zaBYBeldzovQ4eldgaBCzs8lBrfYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fo90zsb1zsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92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SVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBsfHht29foUrzsbYBa92zeldz50Hci2Qht29foEHgr9lBaU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsUnBsEHgryrSVfjqHldBo9Ygob1Br9lSVfjBoM7gY7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBaR1gr8YBrN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29fof2Brf7goR0gok9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCBay0Ba8HgoR1SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oMASVf2gr9ngre9foDl4oR1gaB2Br9HBafngrMCzayASVf2gr9ngrO9foDl4oR1gaB2Br9HBafngrMCzayASVf2gr9nzak9foDl4oR1gaB2Br9HBafngrMCza3QSS7ASVfCBay0BrU0zs8CSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRCzaB1gafnzaf1Bry7gV29foEYgr8YgpldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9YgoyYSVfjBV1HBoyrzaUCgoyCzaB1gamQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foB7BsMYBabngo39fowxSVfCgr9nzsyrgrN9foD2zsgQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjzPHQht29fo8nzaRCzaE1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfj4sECBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoRlht29foE0BrUHgsbCBeldzIG9fofYgr80zaBYBeldzo8HBaNQ4eldBrR2BrfnzsM1zeldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtvQ_"));
    v1253(v1246("density", "Aggresive", -1, "qCfof7ezm72eRHQaZeQEOFO3kF27foDdqHldBo9nBa87gs9lBpldzIG9fofYgr80zaBYBeldzoNQ4eldBrR7gaM0Bry1zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gaUYBrE0zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfnBryCgryHBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghUHmhmPZoXnp6OCfjfIG9foECgoECBrB7Bsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDHht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgY7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBreQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1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goBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCzsRYBrfYgs90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgryHBsMrgs8nSVfjqHldBo9Ygob1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gr9nzsyrgrN9foDGgI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr8YBsBnzab1BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRS7p6fEew9dM5fEmH8nAdzdvxSVfCzaR2BsUngsyYSVfjqHldBo9Ygob1Br9lSVfjzt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzd72BY7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBoZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoE2ht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDGBsgQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBCgsRlBs9rBsg9fowxSVfCgr9nzsyrgrN9foDlht29foBYgryCzafYBom9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foD0ht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD7ht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDYht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoZQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzoZQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfHBa81gsB1Bsv9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foD7gP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzoE2ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhsn1yRiZpXCfjf50Hcild4Vfof7ezm72eRHQaZeQtkF06XF0IfoDdqHldBsM1goRHgablBZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBs9HBa81grU2SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrkQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sBCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzomQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfCga81goElSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzaR0Bs8YzsO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDCzP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfj4sE2ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDGBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzd72gP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sEYht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRn2KkYk3ciGwc59dzdvxSVf2gr91zaf1BrR1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsf7zsRngsB7SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBoRnBsy1gaflgZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9lgoMlBoM0zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7gRSHg6OFeTXF0IfoDdqHldBsblza8HBs90gpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzokQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzomQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUlht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72zS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foD7ht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDCht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrfCgrf0BsRlgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2BsfYgryngHldzIG9fofYgr80zaBYBeldzobASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoElht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDYht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foD1ht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD7ht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4smQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7grUrBrU7geldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghUHmhRYm3c5mwc59dzdvxSVfCBoU7gry1gs80SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrf1gr97zsB2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDGBovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngsb1zs91Bam9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoBHzaUrgoErzZldz50HcilASVfCgaR0gaBlgo9rSVfjcIZAcV29fof1BsRrBoBnBrZ9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBsgQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobCgoE7zaynBeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2zaB1zsRrBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsRnBrfrBo8HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoUHht29foEYgoR1gofnBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1zaRYzsU1Brv9fow6kF2A4eldBoMrgoUlgofYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBogQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8Y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grb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBngsyYgobHBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDlht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgr8HBs90BoMrSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghZeQEkFgTXF0IfoDdqHldBr87BaM1BoMrzeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaMrBoEYzaBlSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBrkQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sB2ht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzopQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzogQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzogQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7Boy2grf7gaErSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf2Br8rgsb1Brf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfj4sEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2zS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsB2go8Yzak9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQRS7OCOFZrkie6Oip6OCfjfIG9foErza9Yzs80zam9fowxSVfCgr9nzsyrgrN9foDlht29fof7Br8YzsM0BeldzIG9fofYgr80zaBYBeldzoUASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzomQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzd7Yht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDGBs3Q4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoNQ4eldgsRnBaUCzaM0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgsRHzsMHBrp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElgayrzsBrzsk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2goU0goRYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsMlht29foE1BrUHgafnBog9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBayrgsf7BoBnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoflgoMlBa9nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BaEYBsyYBsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDCzS7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfj4sfCht29fofrga9YzsR0gav9fowxSVfCgr9nzsyrgrN9foDlht29fof7gsb7BrMngrg9fow6kF2A4eldBo8CBs91ga91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo97gay0zay2geldzIG9fofYgr80zaBYBeldzoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzovQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNsbkBmZghZeQvcdNNXSfdzdvxSVf2BrU2Br9HBoflSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBY7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDnht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDrht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBof7grU1gsB1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDnht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foDnht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgs92goR1za8HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1BrRCgrBrBog9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foDGgI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd72gY7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoUR0PsEZsSHmhtF1yUFpCfV8ymPZoXCfjfIG9fofrgoRCBsb2Brk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foD7ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foD0ht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foD7ht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDYht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BI7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjgS7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBoNQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBo91Bo9HzaMlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzogQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoOQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzomQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzoZQ4eldBobnBsUYBo8YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHgaErBo80gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzovQ4eldBrbnBaRCBsMrBeldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgrBHgs8nBpldzIG9fofYgr80zaBYBeldzoZQ4eldgoBHgrE0zaU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBaMlBsEHBoBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzafYzab2BoEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgamQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzo3Q4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoE2ht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDCht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD2BS7ASVfrzaBngo92BryHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf1gsM7Br8Czap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBry0zabrBaB0BpldzIG9fofYgr80zaBYBeldzobASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzof1ht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foE7grfHBoy0Brg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDGBsgQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzofHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2BS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsfrga8ngaU1SVfjqHldBo9Ygob1Br9lSVfjBY7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrgsRYBa8CBrElSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzaBYgrf2BrBHSVfjqHldBo9Ygob1Br9lSVfj4sErht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQWcdNUOFZTfoDdcIZAcVfAfdBoUR0PsEZsSHmhRIZ6c5p6OCfjfIG9foElBa9lBaf2Bse9fowxSVfCgr9nzsyrgrN9foDlht29fofHzabHBaMngpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsM7zaB0BrB0gHldzIG9fofYgr80zaBYBeldzo8lht29foEngabngs90gsZ9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBsyrgaR7Bo8CBHldzIG9fofYgr80zaBYBeldzo8lht29foflzaBHBoUCBrO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCBoMnBaMlgr8rSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BoflzaR1gs39fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDlht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foDCht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDrgY7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBrvQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7A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ht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDnht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBobYBrM2gr9lgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzd72zaNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoRCzabrBHldzIG9fofYgr80zaBYBeldzoeQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoNQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfHgs8lgaf1Bap9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldza8nzaylBrRHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBrR1gaBnBsB0SVfjcIZAcV29fof7gsb7BrMngrg9fow6kF2A4eldBoy2gsBCBr8rgZldzIG9fofYgr80zaBYBeldzo8lht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDCht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghZeQsc5Z3Xnp6OCfjfIG9foflBs92gsyngrN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaMnBa81gsO9fowxSVfCgr9nzsyrgrN9foD04eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErgoBHzsyrBop9fowxSVfCgr9nzsyrgrN9foD2BP7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfjzP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfj4sEnht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDGBsOQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrB7goB0BofrBeldzIG9fofYgr80zaBYBeldzoeQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgr9CBsBrgZldzIG9fofYgr80zaBYBeldzd77ht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBsM2BoU7zs82SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzogQ4eldBrBlgafCgsBlgeldzIG9fofYgr80zaBYBeldzoNQ4eldBrRHgrMnBoB2BeldzIG9fofYgr80zaBYBeldzomQ4eldBryrgo8YBsB1gZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgaBnBoy0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2zabYgsy1Bae9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29foErzsyYBrR7Bse9fowxSVfCgr9nzsyrgrN9foDYht29foEHBsyrzabHBre9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrfngsO9fowxSVfCgr9nzsyrgrN9foD7ht29foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7BP7ASVf2gr8Hza8CgoEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zayHgrb7zaBCSVfjcIZAcV29foflBr87Ba8Cgr39fowxSVfCgr9nzsyrgrN9fow79IZpht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBspQ4eldBoB7gr90gsb7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUHzsUrBa8YBHldz50HcilASVfCgof2gry7gr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgrU7zab1zaE7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryCgrR1BaMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCza87BafrBaBnSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfCzs82ga9Cgo91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsR7BsBCgobYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrUnBrbCBoBlSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzs8lgsf2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BaBYBrRHgo8CSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfnBrRYBsb1gae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezm72eRHQRSHg78F0bXF0IfoDdqHldBsMrga8Hgs9rgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsy2zaElBrbCBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBsBnBrR0zaBCzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0za9rgsU2BZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2ga9Cgsf1zsBrSVfjqHldBo9Ygob1Br9lSVfj4sfCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDlht29fof0BoB7go87ga39fowxSVfCgr9nzsyrgrN9foDrht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foD2ht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br9YBoErBrZ9fowxSVfCgr9nzsyrgrN9foDlht29foRHgoM7BoylzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsE1grUCBafHSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaU1BrbrBrbYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs87zs8HgrbHgZldzIG9fofYgr80zaBYBeldzoElBP7ASVf2zaB7gsUCgofrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoM1BrRCgafrgpldzIG9fofYgr80zaBYBeldzo8lht29fofCBa8lBaMYgog9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgsy7Br82Brp9fow6kF2A4eldBoUHzsUrBa8YBHldz50HcilASVfCzaEHBrfrgoBHSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoyngaMCBrMrgpldzIG9fofYgr80zaBYBeldzovQ4eldBobCBrUngoU7zeldzIG9fofYgr80zaBYBeldzoErht29foBrBaUCBoRrBam9fowxSVfCgr9nzsyrgrN9foDlht29foBHgs9lgofrBsN9fowxSVfCgr9nzsyrgrN9foD7ht29foB1Br8ngrErzaZ9fowxSVfCgr9nzsyrgrN9foDlht29foyHBaUrgof1zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBoMYBoRHza8HSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Brb1grBHgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsE1Bry0gsB2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gs8rBoBCgoRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2goBHBrylBr91SVfjqHldBo9Ygob1Br9lSVfjgaZQ4eldBs9ngsynBo82gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsy1gs90gayrBpldz50HcilASVfCBaBngaMnBo91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd7CBY7ASVfCBrUYgrbHzsUCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgaR0gaBlgo9rSVfjcIZAcV29fofnBoEYzaUYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYgaU1zsy1Bsm9fowxSVfCgr9nzsyrgrN9foDlht29fofYzafYgsylBav9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDCht29fof1goUlBoBlBrO9fowxSVfCgr9nzsyrgrN9foDrht29fof0goE7grfngr39fowxSVfCgr9nzsyrgrN9foDlht29foB2gsU2Brfnzsk9fowxSVfCgr9nzsyrgrN9foDlht29foBrga8rzsfCBrN9fowxSVfCgr9nzsyrgrN9foDlht29foB0goMHBoElBrN9fowxSVfCgr9nzsyrgrN9foDlht29foUlBr9rgsRngov9fowxSVfCgr9nzsyrgrN9foDCht29fo8rgs92zsy7BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foEYgry1ga81zam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gaUnBaU7gsEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gayHBs9lgaE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoR7zsMlBrylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9YBsbrgsEYgHldzIG9fofYgr80zaBYBeldzoElBP7ASVfCgr92zsBHBs91SVfjqHldBo9Ygob1Br9lSVfjBsMlht29fof1zaE7BoblBom9fowxSVfCgr9nzsyrgrN9foD2BaNQhS7ASVfHBoy2gob7zaN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2zsM2BaMnBsRHSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgPHQht29fo92zsbYBoMHBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofrzaEYBaR0grp9fowxSVfCgr9nzsyrgrN9foDrht29foBrgryYzs9Ygo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7grR0gs9lBaN9fowxSVfCgr9nzsyrgrN9foDCBaNQhSHQfdldfCgNspmvURpgSHgeZemvsbksS7Z8ZevNfoDdqHldBsUHzsU1gry2gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzafHBaErBo92SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foD74eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrgsbCBab1gsblSVfjqHldBo9Ygob1Br9lSVfjzPHQht29foB7BoMrgsEngrk9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1BpldzoMASVf2zsf1Bof0goe9foD24eldBsbrgabnzs97SVfjgo9ASVfCBablgsEHBaE1SVfjBV29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldzImCkFZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzobl4eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofCgsMYBsblgok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaMHBsBlgoUrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsRnzsy1zaBHSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf7BoUlgoEYBaE7SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDH4eldBoM0BaR2gsM2zeldzoEASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9nBafnBsfCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBofHBa92zsMngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUlBaR2BrMngag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRCga9lBoBrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof1BoblgrRlgsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BrfngsM2grU0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaM0BsR1BrEYSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2grUrBaRrzablSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gr8lBrMnBr9nSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2za9nBsBnzaUlSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBsyCBrRrgaRHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoB0Bs8nBsfHBHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoR2Ba8nBs87BeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBoy1zsbngrBHgpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrM1BsR1gabrzZldzIG9fofYgr80zaBYBeldzokQ4eldBrE1gobrgaBYgeldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrBCgsRYBoRCgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaBHgsM1gaN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgsyrBaMrzae9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUlgrf0gobnBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUCgobrBrf2Bov9fowxSVfCgr9nzsyrgrN9fow79IZpht29foyHBo80Brb7zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy1zaflBaEH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SVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7mpO5eHcPUdzdvxSVfrBs8nzaUCBrMlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7mH8nGwc59dzdvxSVfrgry0grbYBsylSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7OCOFZrkie6Oip6OCfjf50Hcild4Vfof7ezZEpVRpZRmZQRS7p6fEew9dfjfIG9foEYBrE7BoM2BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjzS7ASVf2zabrzaE0gaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBlBsMHgsUrgHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRvtZZmeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foBCzsMlgo9Czak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjBrNQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRS7Q6feNpOFAdzdv6kF2AfdldfCgNspmvUpvZZEZhZeQtkF06XF0IfoDdqHldgaM1go8HBoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7ezZEpVRpZRmZQRSHgAcYkY8F2TXF0IfoDdqHldBsR7ga97go90BHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBaUnzsfCgrv9fowxSVfCgr9nzsyrgrN9foDlht29foElzsbCzaUnzsN9fowxSVfCgr9nzsyrgrN9foD0ht29foE1zsB1Bsb7Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrM2BaRHgaBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhSHQfdldfCgNspmvUpvZZEZhZeQsc5Z3Xnp6OCfjfIG9foBYga81gr9rgse9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaM7gobCBo9CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Bab0Boy7goblSVfjqHldBo9Ygob1Br9lSVfjzS7ASVf2zabrzaE0gaEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBlBsMHgsUrgHldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBoUR0RtRvtZZmeSHmhRYm3c5mwc59dzdvxSVfCgr87Br97gaEHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMlga80BofYBpldzIG9fofYgr80zaBYBeldzoNQ4eldBsM0zsf1ga80BeldzIG9fofYgr80zaBYBeldzopQ4eldBsy0Bry2zsU2gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaElgsR7Brk9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQhS7d4Vfof7membZzR7pFmZQaZeQEOFO3kF27foDdqHldBsElBay7goECgeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrRlBrfCgrblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVfCgoR0gob2goRrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCzsBlBrylBrR2SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBrU0gofCgoN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7BaEngrBCBrk9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foB7goM7gsy2gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhmPZoXnp6OCfjfIG9foEYBoB1BaElBam9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobYBrfYgr8YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBrf1Bo87goRrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrRHBrBrgsfrBZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgaMCga8CzaE2gHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldgaM1BrU2BrMrBHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fobHgrb2grE7BeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRS7OCOFZrkie6Oip6OCfjfIG9fof2gaf2gaB7zs39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fofHgoR1gsfCzav9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof1BsbnBrbHgak9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foB7gof2BayCzap9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr9ngab7gaEHzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9nzs8lBr9CSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhtF1yUFpCfoDdqHldBs9rzaRrgoE0gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoErzsU0grb7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBr9HBaMYBoErSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfj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Bo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7BobCBrM0zsb0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhsn1yRiZpXCfjfIG9fofCgsfrgaBlBeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBo80Ba8ngrBnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsUlBsU7BaBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf7BoU0gsECzab1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfnzs8HBo92zaO9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29fo9HgsB2BoElBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQaZeQtkF06XF0IfoDdqHldBs9CBoMrBoR0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2za92grRCga87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoBY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gob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgrB1gayHgHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgr82gsMHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgry1gafYgrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVf1go92goBYzs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhUHmhRn0p8FGwc59dzdvxSVfCBrynBaMrBrN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfj4sy0hSHQ4eldBoRYBsRrgrf0gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoblgoBnBr81BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoEHBY7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf7Bsblgr9HBsy7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf7Boy1gaylBo90SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU1zsE7zsf7gHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgsR2Bob1goECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeS7gRSHg78F0bXF0IfoDdqHldBsR1zsMrgaBnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBsbCBrynBa97geldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBrflzafYBof7zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBrBlgsbYgrB7BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgsR2Ba87goblSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrEnzaB7Bo9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldgaMnBafrBofnBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzaM2goErgoMYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza8rgr8Czs9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHmhmiZ58SZAkVfjfIG9foE2grblgsB2geldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsyrBoB7goU2zeldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBoUnzay2grUrgpldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoR7BrRCgrRCzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBa9YgoMlBsk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBr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fofYgr80zaBYBeldzogQhSHQfdldfCgEmROespgvZbZhZeQvcdNNXSfdzdvxSVf2Ba82gr90BsR0SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjgapQhS7ASVf2gsM1za9YgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVf2goRHgsB0BoflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsb0gr87BrbCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foD7ht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBoBnBsMCBaUHzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1gs9rgaM2gsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo9YzsbCgrEnzeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzofCht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDGBseQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQhtfAfdBomEZimR0stZOeSHmhtF1yUFpCfV8ymPZoXCfjfIG9foE2zs97zaMCBHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoy0ht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foECBab7gaElBam9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof2zaU0BrE2gap9fowxSVfCgr9nzsyrgrN9foD74eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foD7zS7ASVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBsNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzd72gI7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgoM1goB0zsBrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBrM1Br9lzsE0gZldzIG9fofYgr80zaBYBeldzogQhS7ASVfCza8CgafYBsb1SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foBHBaU1zsR0gaN9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDCBIHQht29foB1Ba9YBrE1Bap9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsy2Ba90gsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzoEHht29foB7Baf0BrE0gok9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgsf7BrfHgo80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRCzsBngsU1zZldzIG9fofYgr80zaBYBeldzoEHht29fo80gaEYgrUrBZldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQWcdNUOFZTfoDdqHldBs9lgr9CgoRHzZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBofHBoR0gaBlgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB7Bof2go9ngog9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlgsynBrynzae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BrBrgayYgrm9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoRYBsUYgsRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQtkF06XF0IfoDdqHldBs8Hga80gsR2zeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBsy7gaRHBafCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE2gsEHzs9Cgom9fowxSVfCgr9nzsyrgrN9foDYht29foE2goBCzsBlBok9fowxSVfCgr9nzsyrgrN9foD0BP7ASVf2gaE1zaBYgsZ9fowxSVfCgr9nzsyrgrN9foDYht29foE0BabYBoy0grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaM0Brf7gr91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoU0zaE0gs8CBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo8nzsbCBay2BHldzIG9fofYgr80zaBYBeldzokQ4eldBrBnBsRnBr82BHldzIG9fofYgr80zaBYBeldzo8lht29foUlzsRrBrRnzsN9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBoE0zsRnBrfngpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBrgob2Br8nBov9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEnBrRrzaMrgr39fowxSVfCgr9nzsyrgrN9foDlht29foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fof2gs9YzsErBrm9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBPHQht29foUlBaRnBa9ngaN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUlzaMrBs9YBrg9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgoM7BsEngsE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhSHQfdldfCgEmROespgvZbZhZeQsciQYkneAXnp6OCfjfIG9foElzaErBofHgZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoE1BP7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVf2zsb7gsR7zs8nSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnBa8YBaB7zsk9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDGzapQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBobngry1zab2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foBlzaBYBab2zsZ9fowxSVfCgr9nzsyrgrN9foDrhSHQ4eldBryrBo92gof2BZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foRHgaUCBsBCzeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBsb1goBlBrm9fowxSVfCgr9nzsyrgrN9foDCht29foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fofHgrR7zsBnBa39fowxSVfCgr9nzsyrgrN9foDCht29fofYBr97Br8Cgrm9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaMYBa9rBom9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsZ9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foDCht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldgs9ngs8YBs8nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsEHBsR0grfngeldzIG9fofYgr80zaBYBeldzokQ4eldBsEnBrf0BrMCgHldzIG9fofYgr80zaBYBeldzoblht29foE7Bsy1Br9HgZldzIG9fofYgr80zaBYBeldzokQ4eldBsblzs9CzabYBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflBabrBoUYgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgab1BsbHgofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgo80zsflzaErSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfrBr82gs8rgoErSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgaM0gsBrgs80BeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgEmROespgvZbZhZeQsc5Z3Xnp6OCfjfIG9foEnBa81BrRYgs39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaE0za8rBaB7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2BayHgr97gaR0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgs9HgabrgoM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrBYgaBnBo97SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaUlgrMYBrf7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYgrb0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBIHQht29foE0Bs8CBaUnBoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof2za81zsBrBsp9fowxSVfCgr9nzsyrgrN9foDC4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlht29fofrBa9YgaBnBav9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrBs81BrUCgrM0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Ba8lBoBCBo82SVfjqHldBo9Ygob1Br9lSVfj4sy0hSHQ4eldBo8HzaE1goflgZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoEHBY7ASVfCBsRYgrb2BrB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrMYgrUrgoMCSVfjqHldBo9Ygob1Br9lSVfjBoNQhS7ASVfCgrEnzs92Bsf2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoE1BsMYzsRHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsm9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbHSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsk9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb1SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza91BaN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfrgaMCzsB2zs8YSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrRCgaBCgs8nzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHBobrgoR7zap9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfnzsU2gr97Bre9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrRYBrR0BabCSVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVf2zsR1zsECgr82SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1za87gafHBom9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7membZzR7pFmZQRSHg78F0bXF0IfoDdqHldBsflgaB0BaB1BHldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflht29foB2goyrgafYBap9fowxSVfCgr9nzsyrgrN9foDlht29foUlgoMCBrfCgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs8Ygs81BrfnzZldzIG9fofYgr80zaBYBeldzoMASVf7BaRlgayCBsRlSVfjqHldBs8rgsB1BaBYzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsbHzab2Bo9nBZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEHgr90BsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoBlgr97Br8lBpldzIG9fofYgr80zaBYBeldzoflhSHQ4eldBs9rgaUnzaE1gZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaRYgrU7gsp9fowxSVfCgr9nzsyrgrN9foDCht29fof2zaElgrbHgZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsg9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrb7SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9YzsO9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYgrbYSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzoEHht29fof1gaBCza9Yzsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCzaUrBoyYzaMlSVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldBrUlBobrBsbngHldzIG9fofYgr80zaBYBeldzoEHht29foBHBoUrBoRngop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsf0Br8Hgay0SVfjqHldBo9Ygob1Br9lSVfjBsZQ4eldgob7Bs9YgaB2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BaB0BrbHza39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BsR2gsbYBo87SVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2Bs8rBobrBafYSVfjqHldBo9Ygob1Br9lSVfjzsNQ4eldBsU2zayrgrRHSVfjqHldBo9Ygob1Br9lSVfjgY7ASVf2zsM0grf1zs9rSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoMlzsBCga9YzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof7zsy2zsRnBov9fowxSVfCgr9nzsyrgrN9foDlht29fofngob0BoM1Bsg9fowxSVfCgr9nzsyrgrN9foDYht29foBrgoEHgoBnBsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BabHBrBHgoblSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBngob1BoB7gsv9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foE0gsy0BsfYgoe9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldgof7BrBCzafCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM2zsynBrMrgeldzIG9fofYgr80zaBYBeldzovQ4eldBsM1gs9YgaUHzZldzIG9fofYgr80zaBYBeldzovQ4eldBoRYgsU0Br8lzeldzIG9fofYgr80zaBYBeldzovQ4eldBo9rgrUrgofYgeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7Ba9lgrBCgeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90BHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90geldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gpldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90gHldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zeldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1gr90zZldzIG9fofYgr80zaBYBeldzovQ4eldBoy7Brf1grylBeldzIG9fofYgr80zaBYBeldzovQhS7ASVf0BrBYBaEnzaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBayrgrM0BsbHSVfjqHldBo9Ygob1Br9lSVfjBYHQhS7d4Vfof7Z8ZevNfoDdqHldBob0BsE7zaynBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElgaMYBr87zae9fowxSVfCgr9nzsyrgrN9foD2BaM2ht29foElgobrgoR1BrZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grBHBaU1grN9fowxSVfCgr9nzsyrgrN9foDrBoZQ4eldBs9HzaM7BoM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE0Bs8Ygsylgs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoR1BrbYzsbnSVfjqHldBo9Ygob1Br9lSVfjBrfHht29fofrBrBCgsfHBak9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof7BafHBsR2grm9fowxSVfCgr9nzsyrgrN9foD7gS7ASVfCgrR1BsfCBsyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobnBaU1zaM0zeldzIG9fofYgr80zaBYBeldzoRlht29fof0zsR2goE2zak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsE7goBrBoE2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoErgoRHBrU2SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfCBr9rgsyHgHldzIG9fofYgr80zaBYBeldzoRlht29foBCgsMYzsB0za39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgs9HBa9CBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBryngsBYzaM1BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foRlBaElBsE0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR1zsMYBrB1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CBrE0go82geldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtfAfdBosRpsUCfjfIG9foE7grM0gaUYgov9fowxSVf7BaRlgayCBsRlSVfjqHldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1BafYgsRrgre9fowxSVf7BaRlgayCBsRlSVfjqHldBsRrzs9HzaMHgpldz50HcilASVfrBs87BsBlgap9fow6kF2A4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpld78WmykVl784UKGVHfgV/74xUGQV+78aU6giv74Z9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfrBsb7goUCgrk9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfngofHBaEngrg9fowxSVfCgr9nzsyrgrN9foD2zsyrht29foyYzsM2Bsy0BeldzIG9fofYgr80zaBYBeldzogQ4eldzsfnBaE0zak9fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBrUCBob0gaEHBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsUnBsRYgrU7SVfjqHldBo9Ygob1Br9lSVfjBYHQht29fo82Bs9ngaBlBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foblgsE1Bo90SVfjqHldBoR7Bo80Ba9YSVfjFYG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9fow58F2rOt29foE0BoyCBobnBZldzImCkFRASVf2zsB7zs80grm9foDYzV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjkPvHOSHk4eldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9lgs8HBs80zZldzIG9fofYgr80zaBYBeldzoylhSHQhtfAfdBosRQFmRHespUdzdvxSVf2gryYBsE2BrbHSVfjqHldgaMHBaU1BoEHBeldzIG9foElza9rgrfrgr39fowxSVfCgr9nzsyrgrN9foDYht29fof1BabCgafrgoe9fowxSVfCgr9nzsyrgrN9foDCgS7ASVfrBayHgrBlgaRYSVfjqHldBo9Ygob1Br9lSVfjgrvQ4eldzsfCBafCzafCSVfjqHldBo9Ygob1Br9lSVfjBYHQht29fof7BrM7Bsy1Bag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB7BrMngaUCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQfdldfCgtURkeUbQRfoDdqHldBsMnBr92Br91BpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEYgsRCBsB0zs39fowxSVfCgr9nzsyrgrN9foDrzS7ASVfCBoy1BoRnBoE2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrR2zaR2Br92SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCBr87gs8HgsBlSVfjqHldBo9Ygob1Br9lSVfjgY7ASVfCgrynBabrgrbYSVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldBoy7BaB1goUlgZldzIG9fofYgr80zaBYBeldzoflht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foDl4oMASVf2gr9nzak9foDl4o91gaB2Br90grbHBa97gaOQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBYgrbngsM1zse9fowxSVfCgr9nzsyrgrN9foDCgS7ASVf7gsBngoR2Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BaE2BrfCBsv9fowxSVfCgr9nzsyrgrN9foDrBSHQht29foE0zsU1gsBlBs39fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foElBr8HgrB1grm9fowxSVfCgr9nzsyrgrN9foDCgP7ASVf2gaRYgsRrgrUCSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCBoUYzsM2BsRrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUrgoU2Bo8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrUrgo8lgsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsy2BsB0Bop9fowxSVfCgr9nzsyrgrN9foDlht29foU2Bab1BsBCzap9fowxSVfCgr9nzsyrgrN9foDlht29foUCBa9Hzsy0gov9fowxSVfCgr9nzsyrgrN9foDCgPHQht29fofYzs8nzaflBrv9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE2BsMlgoB2Bop9fow6kF2A4eldBsU2za91BrU2BpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2zsB7gsy0zaO9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6zab7BsEYgrECzs97gsU1BC29foEYgr8YgpldzoM6gry1BoBHBr8nBrU7gaR2zt29foEYgr81gHldzoM6goR1zafrgsU0grUYga8YhZHQ4eldBoM1zsBHzsMlzZldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1ngsy1BoBHgabYga97go9ASVf2gr9ngrO9foDl4o8HzayCBrR7zs97grUngC29foEYgr81gHldzoM6zablBsbnBsU7gsylzaU2BSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBsyngafrzafYzZldzIG9fofYgr80zaBYBeldzogQ4eldBoB0gayCBo8nSVfjqHldBo9Ygob1Br9lSVfjBY7ASVfCzsR0zsE0BryHSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foE0BrUHzab1gpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rgrfHgablBo9CBaUHBsBHgt29foEYgr8YgpldzoM6grMHzayCBr9lga92zsR7BC29foEYgr81gHldzoM6gab1BaB0BoUHgoMHga81grZQSS7ASVfCBay0BrR0BaM0SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8rzsf2gs9lgr9YzabrBa9ASVf2gr9nzak9foDl4oR2gr87grM1grRYgaMlgseQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7gsU2ga8ngsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYBoRYBo9nBrO9fowxSVfCgr9nzsyrgrN9fow9fINC8IfQJVp9fI7ASVf0grfYgsyrzsv9fowxSVfCgr9nzsyrgrN9foD1BPHQht29foBYza92BaR2zae9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo974eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow79IZphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBry7Bs8Cgo91SVfjqHldBo9Ygob1Br9lSVfjgI7ASVf7BoErgaE1gsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf0BaE2BrfCBsv9fowxSVfCgr9nzsyrgrN9foD2gSHQht29foB0gsRHzafnBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEHBoBYBrRrzsk9fowxSVfCgr9nzsyrgrN9foDGBS7ASVf2gsBlBoEYBsN9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfCBay0Br8HBaB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDrhSHQhtfAfdBoRbZzmEZtfoDdqHldBoRCgob0gaEYBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fof2zafYgr9Ygsk9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB1BoErgabYBse9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foBlgaUrgsR1Bo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDChSHQht29foB2zsbrgaE2goN9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBo90grRHBaM2gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1YBaR1zafrgrM7grE0gsUr4eldBs9Ygo9nSVfjBV1nBo97gsElBafHzs91Bay14eldBs9YgoyYSVfjBV1ngo8ngo8nza8HBrU1zaEnhZHQ4eldBr82gs9YgrBrgpldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrgo90gsR7Bry7SVfjqHldgaMHBaU1BoEHBeldzIG9foErgr91za82zeldz50HcilASVf2gaMnzs82grUHSVfjqHldBo9Ygob1Br9lSVfjBS7ASVf2gsU0BoUHBop9fow6kF2A4eldBs8YgoEHzaf7BHldzIG9fofYgr80zaBYBeldzpld9PvpWZ29SVvPtR0PmZvsmR0smt0sFZgRmRHsfeGiRbZNtHpkSe29fdMyc5Ql9dN6cnH6SVvQ4eldBs8YgoU7gs8YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsyYgrRYgs8HgHldzIG9fofYgr80zaBYBeldzovQ4eldBof2BaRHBobYSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foBHBay1zaU7zak9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6zaUYBaR1zabCBoRlBa824eldBs9Ygo92SVfjBV1Yzsf2gs80BrUYBry2gsbC4eldBs9Ygo9nSVfjBV1nBoBHBob7BrUCBaU2BaEn4eldBs9YgoyYSVfjBV1ngsM0zaM7Bsf0goMlgsfHhZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9ngrO9foDl4oB1BaB0BoE0Br90gafHBaRASVf2gr9nzak9foDl4obCBsRnza80Bs9rBaU0zsgQ4PG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6Bsy1BoBHBrECgrMlBo92gd29foEYgr8YgpldzoM6Bsy1BoBHBrECgrMlBo92gd29foEYgr81gHldzoM6gaR1zafrgs82go81BrbnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrb7zafCgoO9fowxSVfCgr9nzsyrgrN9foD1ht29fofHzaMHBa9Cgom9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1Hgo9nzaRnBaUlzsR7gsbASVf2gr9ngrO9foDl4oRngr81gs8lgaM0gsUHzt29foEYgr81gHldzoM6gs8YgoyHgoM7BabHgaR0hZHQ4eldzaR7zs8lgsbHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQ4PG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsM2zs8lzaErzsb0Bs9n4eldBs9Ygo9nSVfjBV1HBaE0goM1BsB0zsb2gr8ASVf2gr9nzak9foDl4oRlBsbnBay2Brb0zsEYgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyCgrECBsy2Beldz50HcilASVfrBrUrgoMnBsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBrRlzay1gaU1gHldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV10zafHBrfYBrbnBrbCzafC4eldBs9Ygo9nSVfjBV1nzaf2zsRCga8CBsbnBrRASVf2gr9nzak9foDl4o80BsR1BaEYgoBHBrUHgaOQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6goE2BrRrgobHBrbCgoM1gd29foEYgr8YgpldzoM6gaUlgabHBaE7Bsblgo9rzaBASVf2gr9nzak9foDl4oU7gsyrgaBnzaUngrBrBabrht2xSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfrgsM1zay7gayYSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foDl4oy7za9HBoB2zsy2Bo9Yga9ASVf2gr9nzak9foDl4o9rgrb0BsfYBrUlBrEngrkQSS7ASVf1gsU0goMHzsZ9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6gsyrBrBrBrErga8HBsE1gV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BP7AqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9Ygo9nSVfjBV1HBrBrBrBrgoE2gay1BrUC4eldBs9YgoyYSVfjBV1HBrBrBrBrgoE2gay1BrUChZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgrM1gaR1zsyCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BoE2Br9lgoynSVfjqHldBo9Ygob1Br9lSVfjBsMlht29fobCgofnzsUYzeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgrMnBabrBo97SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoM1zsBngsMrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr9YBr90zsBHgZldzIG9fofYgr80zaBYBeldzpldSVvQ4eldBr91gsy1Br8YgpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7Boylza9lBa9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsM7BaMlzsEnBHldzIG9fofYgr80zaBYBeldzomQ4eldBsR7goUCBaR1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBofYgsEnBoUHBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVf2BoRngsBYgsBHSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSS7ASVfrBrUCgs9Ygo90SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foDl4oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofCzabnBo8nBrg9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9YgoyYSVfjBV17grMHzayCgo81gabHBs91hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrU0Ba8nBoMrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBYBoUHga9CBZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foBrBsRngs90Bav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrBlBsfCBayrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgafrBsUYBsb1BZldzIG9fofYgr80zaBYBeldzovQ4eldgaBCzs8lBrfYSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fo90zsb1zsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVfCBsyCgr9YgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrR0goynBag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1Hgo9nzaRnBaUlzsR7gsbASVf2gr9ngrO9foDl4oRngr81gs8lgaM0gsUHzt29foEYgr81gHldzoM6gs8YgoyHgoM7BabHgaR0hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrzaf2BrU0grE2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsbYzaRrBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29fob1BsR7BoBnBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foD2ht29fofrzsU1BofngpldzIG9fofYgr80zaBYBeldzomQ4eldBrBHzs81goMrSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9fofYzs80BrU7zag9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6za9Ygrf0BoBYBa90goflgV29foEYgr8YgpldzoM6goR2BrRlgaB1gsb7zaE1Bt29foEYgr81gHldzoM6goBnBoRYzaynzayngsbngYHkht29foB2gs82goyYzae9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBryCBsB7zs92BZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjBomQhSHQfdldfCgts7QRS7gRS7mpO5eHcPUdzdv6kF2AfdldfCgts7QRS7gRS7mH8nGwc59dzdv6kF2AfdldfCgts7QRS7gRS7OCOFZrkie6Oip6OCfjf50Hcild4VfofHvWsHmhUHmhtF1yUFpCfoDdcIZAcVfAfdBoRbQWZeQaZeQvcdNNXSfyvdNEkFgTfoDdcIZAcVfAfdBoRbQWZeQaZeQWcdNUOFZTfoDdcIZAcVfAfdBoRbQWZeQaZeQtkF06XF0IfoDdcIZAcVfAfdBoRbQWZeQaZeQsciQYkneAXnp6OCfjf50Hcild4VfofHvWsHmhUHmhRn0p8FGwc59dzdv6kF2AfdldfCgts7QRS7gRSHg78F0bXF0IfoDdcIZAcVfAfdBoRbQWZeQRS7mpO5eHcPUdzdv6kF2AfdldfCgts7QRSHmhmPZoXnp6OCfjf50Hcild4VfofHvWsHmhZeQi95Zp9Ym3c5mwc59dzdv6kF2AfdldfCgts7QRSHmhtF1yUFpCfoDdcIZAcVfAfdBoRbQWZeQRS7p6fEew9dM5fEmH8nAdzdv6kF2AfdldfCgts7QRSHmhsn1yRiZpXCfjf50Hcild4VfofHvWsHmhZeQtkF06XF0IfoDdcIZAcVfAfdBoRbQWZeQRSHgAcYkY8F2TXF0IfoDdcIZAcVfAfdBoRbQWZeQRSHg6OFeTXF0IfoDdcIZAcVfAfdBoRbQWZeQRSHg78F0bXF0IfoDdcIZAcVfAfdBoZbpsZReBRCfjfIG9foErzaMYgoM1Bo39fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBs9lBrb2gryrSVfjqHldBoRHgo81zaM7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrRCzsU2BsyHBoBHzs9YBd29foEYgr8YgpldzoM6BrRCzsU2BsyHBoBHzs9YBd29foEYgr81gHldzoM6zs8lgry7Br9Hgo8Ygs9ChZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foBHgrB1Bo92Brk9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZphSHQ4eldBsUrBoM2gsErBpldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBsBlht29foUrzsbYBa92zeldz50Hci2Qht29foEHgr9lBaU2gre9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gsUnBsEHgryrSVfjqHldBo9Ygob1Br9lSVfjBoM7gY7ASVf2za9Ygs9HgoRYSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBaR1gr8YBrN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foE1gr9HgrRngsk9fowxSVfCgr9nzsyrgrN9foDlht29fof2Brf7goR0gok9fowxSVfCgr9nzsyrgrN9foD2ht29foBrgsbnza8lBHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVfCBay0Ba8HgoR1SVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oMASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSS7ASVfCBay0BrU0zs8CSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oRCzaB1gafnzaf1Bry7gV29foEYgr8YgpldzoM6gsf1Bry7Bo81BoyrzaU74eldBs9YgoyYSVfjBV1HBoyrzaUCgoyCzaB1gamQSSHQ4eldBoM0BaR2gsM2zeldzoeQht29foB7BsMYBabngo39fowxSVfCgr9nzsyrgrN9foD2zaZQ4eldzs9CgrR1BrbCSVfjqHldBo9Ygob1Br9lSVfjgIHQht29fo8nzaRCzaE1BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfj4sE1BP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBs9Ygo8rSVfjqHldBo9Ygob1Br9lSVfj4sElht29foE0BrUHgsbCBeldzIG9fofYgr80zaBYBeldzo8lBaNQ4eldBrR2BrfnzsM1zeldzIG9fofYgr80zaBYBeldz5O3cPgphSHQhtvQ_"));
    v1284();
    l_v1172_2.list:update(v1279());
end;
v5("begin_antiaim");
v1172 = nil;
v1172 = {};
v1177 = 0;
v1182 = false;
v1183 = 0;
v1189 = false;
v1219 = {
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
v1220 = 0;
l_match_0 = 0;
v5("antiaim_buffer");
local v1307 = {};
local l_angles_0 = v25.antiaim.angles;
local v1309 = {};
v1309.__index = v1309;
v1309.clear = function(v1310)
    for v1311 in pairs(v1310) do
        v1310[v1311] = nil;
    end;
end;
v1309.copy = function(v1312, v1313)
    for v1314, v1315 in pairs(v1313) do
        v1312[v1314] = v1315;
    end;
end;
do
    local l_l_angles_0_0 = l_angles_0;
    v1309.unset = function(_)
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
    v1309.set = function(v1318)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override(v1318.enabled);
        l_l_angles_0_0.pitch:override(v1318.pitch);
        l_l_angles_0_0.yaw[1]:override(v1318.yaw);
        l_l_angles_0_0.yaw[2]:override(v1318.yaw_base);
        l_l_angles_0_0.yaw[3]:override(v1318.yaw_offset);
        l_l_angles_0_0.yaw[4]:override(v1318.avoid_backstab);
        l_l_angles_0_0.yaw[5]:override(v1318.hidden);
        l_l_angles_0_0.yaw_modifier[1]:override(v1318.yaw_modifier);
        l_l_angles_0_0.yaw_modifier[2]:override(v1318.modifier_offset);
        l_l_angles_0_0.body_yaw[1]:override(v1318.body_yaw);
        l_l_angles_0_0.body_yaw[2]:override(v1318.inverter);
        l_l_angles_0_0.body_yaw[3]:override(v1318.left_limit);
        l_l_angles_0_0.body_yaw[4]:override(v1318.right_limit);
        l_l_angles_0_0.body_yaw[5]:override(v1318.options);
        l_l_angles_0_0.body_yaw[6]:override(v1318.freestanding_body_yaw);
        l_l_angles_0_0.freestanding[1]:override(v1318.freestanding);
        l_l_angles_0_0.freestanding[2]:override(v1318.freestanding_disable_yaw_modifiers);
        l_l_angles_0_0.freestanding[3]:override(v1318.freestanding_body_freestanding);
        l_l_angles_0_0.extended_angles[1]:override(v1318.extended_angles);
        l_l_angles_0_0.extended_angles[2]:override(v1318.extended_angles_pitch);
        l_l_angles_0_0.extended_angles[3]:override(v1318.extended_angles_roll);
    end;
    setmetatable(v1307, v1309);
end;
v5("antiaim_defensive");
l_angles_0 = {};
v1309 = 0;
local v1319 = 0;
local v1320 = false;
local v1321 = 0;
local function v1323(v1322)
    -- upvalues: v25 (ref)
    if v25.ragebot.main.double_tap[1]:get() then
        return v1322.exploits:get("Double Tap");
    elseif v25.ragebot.main.hide_shots[1]:get() then
        return v1322.exploits:get("Hide Shots");
    else
        return false;
    end;
end;
local function v1326()
    local v1324 = entity.get_local_player();
    if v1324 == nil then
        return false;
    else
        local v1325 = v1324:get_player_weapon();
        if v1325 == nil then
            return false;
        elseif v1325:get_weapon_info().weapon_type == 9 then
            return false;
        else
            return true;
        end;
    end;
end;
do
    local l_v1177_2, l_v1182_1, l_v1183_2, l_v1189_2, l_v1219_1, l_v1220_1, l_l_match_0_2, l_v1307_0, l_l_angles_0_1, l_v1309_0, l_v1319_0, l_v1320_0 = v1177, v1182, v1183, v1189, v1219, v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320;
    do
        local l_l_v1309_0_0, l_l_v1319_0_0, l_l_v1320_0_0, l_v1321_0, l_v1323_0, l_v1326_0 = l_v1309_0, l_v1319_0, l_v1320_0, v1321, v1323, v1326;
        local function v1345()
            -- upvalues: l_l_v1320_0_0 (ref)
            l_l_v1320_0_0 = not l_l_v1320_0_0;
        end;
        local function v1346()
            -- upvalues: l_v1321_0 (ref)
            l_v1321_0 = l_v1321_0 + 1;
        end;
        local function v1351(v1347, v1348)
            -- upvalues: l_l_v1320_0_0 (ref), v24 (ref), v153 (ref), l_l_v1309_0_0 (ref)
            local v1349 = v1348.pitch:get();
            if v1349 == "Off" then
                return;
            elseif v1349 == "Static" then
                v1347.pitch_offset = v1348.pitch_offset:get();
                return;
            elseif v1349 == "Jitter" then
                v1347.pitch_offset = l_l_v1320_0_0 and v1348.pitch_offset_2:get() or v1348.pitch_offset_1:get();
                return;
            elseif v1349 == "Spin" then
                local v1350 = globals.curtime * (v1348.pitch_speed:get() * 0.1);
                v1347.pitch_offset = v24.lerp(v1348.pitch_offset_1:get(), v1348.pitch_offset_2:get(), v1350 % 1);
                return;
            elseif v1349 == "Random" then
                v1347.pitch_offset = utils.random_int(v1348.pitch_offset_1:get(), v1348.pitch_offset_2:get());
                return;
            else
                if v1349 == "Static Random" then
                    if v153.defensive_ticks == v153.max_defensive_ticks then
                        l_l_v1309_0_0 = utils.random_int(v1348.pitch_offset_1:get(), v1348.pitch_offset_2:get());
                    end;
                    v1347.pitch_offset = l_l_v1309_0_0;
                end;
                return;
            end;
        end;
        local function v1354(_, _)

        end;
        local function v1361(v1355, v1356)
            -- upvalues: v24 (ref), v153 (ref), l_l_v1319_0_0 (ref), v1354 (ref)
            local v1357 = v1356.yaw:get();
            if v1357 == "Off" then
                return;
            else
                if v1357 == "Static" then
                    v1355.yaw_offset = v1356.yaw_offset:get();
                end;
                if v1357 == "Spin" then
                    local v1358 = globals.curtime * (v1356.yaw_speed:get() * 0.1);
                    local v1359 = v1356.yaw_offset:get();
                    v1355.yaw_offset = -(180 + v24.lerp(-v1359, v1359, v1358 % 1));
                end;
                if v1357 == "Random" then
                    local v1360 = math.abs(v1356.yaw_offset:get() * 0.5);
                    v1355.yaw_offset = 180 + utils.random_int(-v1360, v1360);
                end;
                if v1357 == "Left/Right" then
                    v1355.yaw_offset = 0;
                    v1355.yaw_left = v1356.yaw_left:get();
                    v1355.yaw_right = v1356.yaw_right:get();
                end;
                if v1357 == "Static Random" then
                    if v153.defensive_ticks == v153.max_defensive_ticks then
                        l_l_v1319_0_0 = utils.random_int(v1356.yaw_left:get(), v1356.yaw_right:get());
                    end;
                    v1355.yaw_offset = l_l_v1319_0_0;
                end;
                v1354(v1355, v1356);
                return;
            end;
        end;
        local function v1367(v1362, v1363)
            if not v1363.delay:get() then
                return;
            else
                local v1364 = v1363.delay_mode:get();
                if v1364 == "Default" then
                    v1362.delay = v1363.delay_timing:get();
                end;
                if v1364 == "Random" then
                    v1362.delay = utils.random_int(v1363.delay_min_timing:get(), v1363.delay_max_timing:get());
                end;
                if v1364 == "Custom" then
                    local v1365 = v1363.delay_sliders:get();
                    local v1366 = v1363["delay_" .. math.random(1, v1365)];
                    if v1366 ~= nil then
                        v1362.delay = v1366:get();
                    end;
                end;
                return;
            end;
        end;
        l_l_angles_0_1.update = function(_, v1369)
            -- upvalues: l_v1307_0 (ref), v25 (ref), v1345 (ref), v1346 (ref)
            l_v1307_0.hidden = false;
            v25.ragebot.main.hide_shots[2]:override();
            v25.ragebot.main.double_tap[2]:override();
            if v1369.choked_commands == 0 then
                v1345();
                v1346();
            end;
        end;
        l_l_angles_0_1.apply = function(_, v1371, v1372)
            -- upvalues: l_v1326_0 (ref), l_v1307_0 (ref), v25 (ref), l_v1323_0 (ref), v1351 (ref), v1361 (ref), v1367 (ref)
            local v1373 = l_v1326_0();
            l_v1307_0.hidden = v1373;
            if v1372.force_defensive == nil or not v1372.force_defensive:get() then
                v1373 = false;
            end;
            v25.ragebot.main.hide_shots[2]:override(v1373 and "Break LC" or "Favor Fire Rate");
            v25.ragebot.main.double_tap[2]:override(v1373 and "Always On" or "On Peek");
            if v1373 and v1372.custom_defensive_ticks:get() then
                local v1374 = v1372.defensive_ticks_mode:get();
                local v1375 = nil;
                if v1374 == "Default" then
                    v1375 = v1372.defensive_ticks:get();
                end;
                if v1374 == "Random" then
                    v1375 = utils.random_int(v1372.min_defensive_ticks:get(), v1372.max_defensive_ticks:get());
                end;
                if v1374 == "Custom" then
                    local v1376 = v1372.defensive_ticks_sliders:get();
                    v1375 = v1372["defensive_ticks_" .. math.random(1, v1376)]:get();
                end;
                if v1375 ~= nil then
                    v1371.force_defensive = v1371.command_number % v1375 == 0;
                end;
            end;
            if v1372.enabled:get() and l_v1323_0(v1372) then
                local v1377 = {};
                v1351(v1377, v1372);
                v1361(v1377, v1372);
                v1367(v1377, v1372);
                l_v1307_0.defensive = v1377;
                return true;
            else
                return false;
            end;
        end;
    end;
    v5("antiaim_builder");
    l_v1309_0 = {};
    l_v1319_0 = v151.antiaim.builder;
    l_v1320_0 = {
        Off = "Off", 
        Default = "Peek Fake", 
        Reversed = "Peek Real"
    };
    v1321 = nil;
    v1323 = function(v1378)
        -- upvalues: l_v1307_0 (ref)
        local l_angles_1 = v1378.angles;
        local v1380 = l_angles_1.yaw:get();
        local v1381 = l_angles_1.yaw_method:get();
        local v1382 = l_angles_1.yaw_offset:get();
        l_v1307_0.yaw = "Backward";
        l_v1307_0.yaw_offset = v1382;
        if v1380 == "2-Way" then
            local v1383 = l_angles_1.yaw_left:get();
            local v1384 = l_angles_1.yaw_right:get();
            local v1385 = l_angles_1.yaw_left_random:get();
            local v1386 = l_angles_1.yaw_right_random:get();
            if l_angles_1.yaw_left_randomize:get() then
                v1383 = utils.random_int(v1383, v1385);
            end;
            if l_angles_1.yaw_right_randomize:get() then
                v1384 = utils.random_int(v1384, v1386);
            end;
            l_v1307_0.yaw_left = v1383;
            l_v1307_0.yaw_right = v1384;
        end;
        if v1381 == "Wave" then
            local v1387 = l_v1307_0.yaw_offset or 0;
            local v1388 = l_angles_1.yaw_frequency:get();
            local v1389 = l_angles_1.yaw_amplitude:get();
            l_v1307_0.yaw_offset = v1387 + math.sin(globals.curtime * v1388) * v1389;
        end;
        if v1381 == "Shake" then
            local v1390 = l_v1307_0.yaw_offset or 0;
            local v1391 = l_angles_1.yaw_min:get();
            local v1392 = l_angles_1.yaw_max:get();
            local v1393 = l_angles_1.yaw_scale:get();
            local v1394 = globals.curtime * v1393;
            l_v1307_0.yaw_offset = v1390 + utils.random_float(v1391, v1392) * math.sin(v1394) * math.cos(v1394 * 2) * math.sin(v1394 * 0.5);
        end;
    end;
    v1326 = function(v1395)
        -- upvalues: l_v1307_0 (ref), v152 (ref)
        local l_angles_2 = v1395.angles;
        local v1397 = l_angles_2.yaw_modifier:get();
        local v1398 = l_angles_2.modifier_mode:get();
        local v1399 = l_angles_2.modifier_offset:get();
        local v1400 = l_angles_2.modifier_switcher:get();
        if v1400 == "Ticks" then
            local v1401 = l_angles_2.modifier_ticks_value:get();
            if globals.tickcount % v1401 <= 1 then
                v1401 = "Off";
            end;
        end;
        if v1400 == "Random" then
            local v1402 = l_angles_2.modifier_random_value:get();
            if utils.random_int(0, v1402) == v1402 then
                v1402 = "Off";
            end;
        end;
        if v1397 == "Off" then
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = nil;
            return;
        else
            if v1397 == "Frostbomber" then
                v1398 = "Random";
            end;
            if v1398 == "Random" then
                v1399 = utils.random_int(l_angles_2.modifier_min_offset:get(), l_angles_2.modifier_max_offset:get());
            end;
            if v1398 == "Custom" then
                local v1403 = l_angles_2.modifier_sliders:get();
                local v1404 = l_angles_2["modifier_offset_" .. v152.sent_packets % v1403 + 1];
                if v1404 ~= nil then
                    v1399 = v1404:get();
                end;
            end;
            if v1398 == "Default" or v1398 == "Custom" then
                local v1405 = v1399 * (l_angles_2.modifier_random:get() * 0.01);
                v1399 = v1399 + utils.random_int(-v1405, v1405);
            end;
            l_v1307_0.yaw_modifier = v1397;
            l_v1307_0.modifier_offset = v1399;
            return;
        end;
    end;
    do
        local l_l_v1319_0_1, l_l_v1320_0_1, l_v1321_1, l_v1323_1, l_v1326_1 = l_v1319_0, l_v1320_0, v1321, v1323, v1326;
        local function v1425(v1411)
            -- upvalues: l_l_v1320_0_1 (ref), l_v1307_0 (ref)
            local l_angles_3 = v1411.angles;
            local v1413 = l_angles_3.body_yaw:get();
            local v1414 = l_angles_3.body_yaw_type:get();
            if v1414 == "Ticks" then
                local v1415 = l_angles_3.body_yaw_ticks_value:get();
                if globals.tickcount % v1415 <= 1 then
                    v1413 = false;
                end;
            end;
            if v1414 == "Random" then
                local v1416 = l_angles_3.body_yaw_random_value:get();
                if utils.random_int(0, v1416) == v1416 then
                    v1413 = false;
                end;
            end;
            local v1417 = {};
            if l_angles_3.body_yaw_jitter:get() then
                table.insert(v1417, "Jitter");
            end;
            local v1418 = l_angles_3.body_yaw_limit_type:get();
            local v1419 = l_angles_3.body_yaw_limit_left_value:get();
            local v1420 = l_angles_3.body_yaw_limit_right_value:get();
            local v1421 = l_angles_3.body_yaw_invert_chance:get();
            local v1422 = l_l_v1320_0_1[l_angles_3.body_yaw_freestanding:get()] or "Off";
            if v1418 == "Random" then
                v1419 = utils.random_int(l_angles_3.body_yaw_limit_min_value:get(), l_angles_3.body_yaw_limit_max_value:get());
                v1420 = utils.random_int(l_angles_3.body_yaw_limit_min_value:get(), l_angles_3.body_yaw_limit_max_value:get());
            end;
            if v1418 == "Ticks" then
                local v1423 = l_angles_3.body_yaw_timing:get();
                local v1424 = globals.tickcount % (v1423 * 2) < v1423 and l_angles_3.body_yaw_limit_min_value:get() or l_angles_3.body_yaw_limit_max_value:get();
                v1419 = v1424;
                v1420 = v1424;
            end;
            l_v1307_0.body_yaw = v1413;
            l_v1307_0.left_limit = v1419;
            l_v1307_0.right_limit = v1420;
            l_v1307_0.options = v1417;
            l_v1307_0.freestanding_body_yaw = v1422;
            l_v1307_0.invert_chance = v1421;
        end;
        local function v1434(v1426)
            -- upvalues: l_v1307_0 (ref)
            local l_angles_4 = v1426.angles;
            if l_angles_4.yaw:get() ~= "2-Way" then
                return;
            elseif not l_angles_4.delay:get() then
                return;
            else
                local v1428 = l_angles_4.delay_mode:get();
                if v1428 == "Default" then
                    l_v1307_0.delay = l_angles_4.delay_timing:get();
                end;
                if v1428 == "Random" then
                    l_v1307_0.delay = utils.random_int(l_angles_4.delay_min_timing:get(), l_angles_4.delay_max_timing:get());
                end;
                if v1428 == "Custom" then
                    local v1429 = l_angles_4.delay_sliders:get();
                    local v1430 = l_angles_4["delay_" .. math.random(1, v1429)];
                    if v1430 ~= nil then
                        l_v1307_0.delay = v1430:get();
                    end;
                end;
                if v1428 ~= "Random" then
                    local v1431 = l_angles_4.delay_random:get();
                    if v1431 > 0 and l_v1307_0.delay ~= nil then
                        local v1432 = v1431 * 0.01;
                        local v1433 = utils.random_float(-v1432 * 0.6, v1432 * 0.6);
                        l_v1307_0.delay = l_v1307_0.delay + math.floor(l_v1307_0.delay * v1433);
                        l_v1307_0.delay = math.clamp(l_v1307_0.delay, 1, 22);
                    end;
                end;
                return;
            end;
        end;
        l_v1309_0.get = function(_, v1436, v1437)
            -- upvalues: l_l_v1319_0_1 (ref)
            return l_l_v1319_0_1[v1436][v1437];
        end;
        l_v1309_0.is_active_ex = function(_, v1439)
            return v1439.enabled == nil or v1439.enabled:get();
        end;
        l_v1309_0.is_active = function(v1440, v1441, v1442)
            -- upvalues: l_v1309_0 (ref)
            local v1443 = v1440:get(v1441, v1442);
            if v1443 == nil then
                return false;
            else
                return l_v1309_0:is_active_ex(v1443);
            end;
        end;
        l_v1309_0.get_old_items = function(_)
            -- upvalues: l_v1321_1 (ref)
            return l_v1321_1;
        end;
        l_v1309_0.apply_ex = function(_, v1446)
            -- upvalues: l_v1307_0 (ref), v1425 (ref), l_v1323_1 (ref), l_v1326_1 (ref), v1434 (ref), l_v1321_1 (ref)
            if v1446 == nil then
                return false;
            else
                if v1446.angles ~= nil then
                    l_v1307_0.enabled = true;
                    l_v1307_0.pitch = "Down";
                    l_v1307_0.yaw_base = "At Target";
                    v1425(v1446);
                    l_v1323_1(v1446);
                    l_v1326_1(v1446);
                    v1434(v1446);
                end;
                l_v1321_1 = v1446;
                return true;
            end;
        end;
        l_v1309_0.apply = function(v1447, v1448, v1449)
            local v1450 = v1447:get(v1448, v1449);
            if v1450 == nil then
                return nil;
            elseif not v1447:is_active_ex(v1450) then
                return nil;
            else
                v1447:apply_ex(v1450);
                return v1450;
            end;
        end;
        l_v1309_0.update = function(v1451, _, v1453)
            -- upvalues: v492 (ref)
            if rage.exploit:get() ~= 1 then
                local v1454 = v1451:apply(v1453, "Fakelag");
                if v1454 ~= nil then
                    return v1454;
                end;
            end;
            local v1455 = v1451:apply(v1453, (v492.get()));
            if v1455 ~= nil then
                return v1455;
            else
                return v1451:apply(v1453, "Default");
            end;
        end;
        v1172.builder = l_v1309_0;
    end;
    v5("antiaim_antibrute");
    l_v1319_0 = {};
    l_v1320_0 = v506.get_event_bus();
    v1321 = {};
    v1323 = nil;
    v1326 = nil;
    local v1456 = nil;
    local v1457 = nil;
    local v1458 = nil;
    do
        local l_v1323_2, l_v1326_2, l_v1456_0, l_v1457_0, l_v1458_0 = v1323, v1326, v1456, v1457, v1458;
        local function v1466(v1464)
            -- upvalues: l_v1323_2 (ref)
            local v1465 = 0;
            if v1464.refresh_modifier:get() == "Meta" then
                v1465 = v1465 + (l_v1323_2 % 15 + 1) * 2 * (rage.antiaim:inverter() and 1 or -1);
            end;
            if v1464.refresh_offset:get() then
                v1465 = v1465 + math.random(-7, 13);
            end;
            if v1465 ~= 0 then
                return v1465;
            else
                return nil;
            end;
        end;
        local function v1469(v1467)
            local v1468 = v1467.refresh_modifier:get();
            if v1468 == "Meta" then
                return nil;
            elseif v1468 == "Increase" then
                return math.random(0, 5);
            elseif v1468 == "Decrease" then
                return math.random(-5, 0);
            else
                return nil;
            end;
        end;
        local function v1470()
            -- upvalues: l_v1323_2 (ref), l_v1326_2 (ref), l_v1456_0 (ref), l_v1457_0 (ref), l_v1458_0 (ref)
            l_v1323_2 = nil;
            l_v1326_2 = nil;
            l_v1456_0 = nil;
            l_v1457_0 = nil;
            l_v1458_0 = nil;
        end;
        v1321.update = function(_)
            -- upvalues: l_v1326_2 (ref), v1470 (ref), l_v1456_0 (ref), l_v1307_0 (ref), l_v1457_0 (ref), l_v1458_0 (ref)
            if l_v1326_2 ~= nil and globals.curtime > l_v1326_2 then
                v1470();
                return false;
            else
                if l_v1456_0 ~= nil then
                    l_v1307_0.delay = l_v1456_0;
                end;
                if l_v1457_0 ~= nil and l_v1307_0.yaw_offset ~= nil then
                    l_v1307_0.yaw_offset = l_v1307_0.yaw_offset + l_v1457_0;
                end;
                if l_v1458_0 ~= nil and l_v1307_0.modifier_offset ~= nil then
                    l_v1307_0.modifier_offset = l_v1307_0.modifier_offset + l_v1458_0;
                end;
                return true;
            end;
        end;
        v1321.enemy_shot = function(_, v1473)
            -- upvalues: l_v1323_2 (ref), l_v1326_2 (ref), l_v1456_0 (ref), l_v1457_0 (ref), v1466 (ref), l_v1458_0 (ref), v1469 (ref)
            local v1474 = v1473.duration:get();
            if l_v1323_2 == nil then
                l_v1323_2 = 1;
            else
                l_v1323_2 = l_v1323_2 + 1;
            end;
            l_v1326_2 = v1474 ~= 9 and globals.curtime + v1474 * 0.1 or nil;
            if v1473.enforce_delay:get() then
                l_v1456_0 = math.random(1, 5);
            end;
            l_v1457_0 = v1466(v1473);
            l_v1458_0 = v1469(v1473);
        end;
    end;
    do
        local l_v1321_2 = v1321;
        l_v1319_0.update = function(_, _, v1478)
            -- upvalues: l_v1321_2 (ref)
            local l_antibrute_0 = v1478.antibrute;
            if l_antibrute_0 == nil or not l_antibrute_0.enabled:get() then
                return false;
            else
                l_v1321_2:update();
                return true;
            end;
        end;
        v1323 = function()
            -- upvalues: l_v1309_0 (ref), l_v1321_2 (ref)
            local v1480 = l_v1309_0:get_old_items();
            if v1480 == nil then
                return;
            else
                l_v1321_2:enemy_shot(v1480.antibrute);
                return;
            end;
        end;
        v1326 = nil;
        l_v1320_0.enemy_shot:set(v1323, value);
    end;
    v5("antiaim_avoid_backstab");
    l_v1320_0 = {};
    v1321 = v151.antiaim.settings.avoid_backstab;
    do
        local l_v1321_3 = v1321;
        l_v1320_0.update = function(_)
            -- upvalues: l_v1307_0 (ref), l_v1321_3 (ref)
            l_v1307_0.avoid_backstab = l_v1321_3.enabled:get();
        end;
    end;
    v5("antiaim_force_lethal");
    v1321 = nil;
    v1323 = v151.ragebot.force_lethal;
    v1326 = v148.force_lethal;
    v1456 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    v1457 = {};
    v1458 = function(v1483)
        return {
            selection = {
                min_damage = ui.find("Aimbot", "Ragebot", "Selection", v1483, "Min. Damage"), 
                hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1483, "Hit Chance")
            }, 
            safety = {
                body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1483, "Body Aim")
            }
        };
    end;
    v1457.Auto = v1458("AutoSnipers");
    v1457.Deagle = v1458("Desert Eagle");
    v1458 = function(v1484)
        if v1484:get_weapon_info() == nil then
            return nil;
        else
            local v1485 = v1484:get_weapon_index();
            if v1485 == 1 then
                return "Deagle";
            elseif v1485 == 11 or v1485 == 38 then
                return "Auto";
            else
                return nil;
            end;
        end;
    end;
    do
        local l_v1323_3, l_v1326_3, l_v1456_1, l_v1457_1, l_v1458_1 = v1323, v1326, v1456, v1457, v1458;
        local function v1493()
            -- upvalues: l_v1457_1 (ref)
            for _, v1492 in pairs(l_v1457_1) do
                v1492.selection.min_damage:override();
                v1492.selection.hit_chance:override();
                v1492.safety.body_aim:override();
            end;
        end;
        local function v1505()
            -- upvalues: l_v1458_1 (ref), l_v1323_3 (ref), l_v1457_1 (ref), v509 (ref), l_v1456_1 (ref), l_v1326_3 (ref)
            local v1494 = entity.get_local_player();
            if v1494 == nil then
                return false;
            else
                local v1495 = v1494:get_player_weapon();
                if v1495 == nil then
                    return false;
                else
                    local v1496 = l_v1458_1(v1495);
                    if v1496 == nil then
                        return false;
                    elseif not l_v1323_3.weapons:get(v1496) then
                        return false;
                    else
                        local v1497 = l_v1323_3.mode:get();
                        local v1498 = l_v1457_1[v1496];
                        if v1498 == nil then
                            return false;
                        else
                            local v1499 = v509.get(v1498.selection.min_damage);
                            if v1499 ~= nil and v1499.active then
                                return false;
                            else
                                local v1500 = l_v1456_1:get() and rage.exploit:get() == 1;
                                if not v1500 and v1498.safety.body_aim:get() ~= "Force" then
                                    v1498.selection.min_damage:override(100);
                                    local v1501 = l_v1323_3[v1496];
                                    if v1501 ~= nil and v1501.hitchance ~= nil then
                                        local v1502 = v1501.hitchance:get();
                                        v1498.selection.hit_chance:override(v1502 ~= -1 and v1502 or nil);
                                    end;
                                    l_v1326_3.updated_division = false;
                                    l_v1326_3.updated_this_tick = true;
                                    return true;
                                elseif v1500 and v1497 == "Damage = HP/2" then
                                    local v1503 = entity.get_threat();
                                    if v1503 == nil then
                                        return;
                                    else
                                        local l_m_iHealth_0 = v1503.m_iHealth;
                                        v1498.selection.min_damage:override(math.ceil(l_m_iHealth_0 / 2));
                                        l_v1326_3.updated_division = true;
                                        l_v1326_3.updated_this_tick = true;
                                        return true;
                                    end;
                                else
                                    return false;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1506()
            -- upvalues: v1493 (ref)
            v1493();
        end;
        local function v1509()
            -- upvalues: l_v1326_3 (ref), v1505 (ref), v1493 (ref)
            local l_updated_this_tick_0 = l_v1326_3.updated_this_tick;
            l_v1326_3.updated_division = false;
            l_v1326_3.updated_this_tick = false;
            local v1508 = v1505();
            if l_updated_this_tick_0 and not v1508 then
                v1493();
            end;
        end;
        v1506 = v21("force_lethal.on_shutdown", v1506);
        v1509 = v21("force_lethal.on_createmove", v1509);
        local _ = nil;
        local function v1513(v1511)
            -- upvalues: v1493 (ref), v1506 (ref), v1509 (ref)
            local v1512 = v1511:get();
            if not v1512 then
                v1493();
            end;
            events.shutdown(v1506, v1512);
            events.createmove(v1509, v1512);
        end;
        l_v1323_3.enabled:set_callback(v1513, true);
    end;
    v5("antiaim_auto_hide_shots");
    v1323 = nil;
    v1326 = v151.ragebot.auto_hide_shots;
    v1456 = 1;
    v1457 = 2;
    v1458 = 3;
    local v1514 = 5;
    local function v1515()
        -- upvalues: v152 (ref), v25 (ref)
        if not v152.is_onground then
            if v152.is_crouched then
                return "In Air & Duck";
            else
                return "In Air";
            end;
        elseif v152.is_crouched then
            if v152.is_moving then
                return "Sneaking";
            else
                return "Ducking";
            end;
        elseif v152.is_moving then
            if v25.antiaim.misc.slow_walk:get() then
                return "Slowwalking";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1326_4, l_v1456_2, l_v1457_2, l_v1458_2, l_v1514_0, l_v1515_0 = v1326, v1456, v1457, v1458, v1514, v1515;
        local function v1526(v1522)
            -- upvalues: l_v1457_2 (ref), l_v1458_2 (ref), l_v1456_2 (ref), l_v1514_0 (ref)
            local v1523 = v1522:get_weapon_info();
            if v1523 == nil then
                return nil;
            else
                local l_weapon_type_0 = v1523.weapon_type;
                local v1525 = v1522:get_weapon_index();
                if l_weapon_type_0 == l_v1457_2 then
                    return "SMG";
                elseif l_weapon_type_0 == l_v1458_2 then
                    return "Rifles";
                elseif l_weapon_type_0 == l_v1456_2 then
                    if v1525 == 1 then
                        return "Desert Eagle";
                    elseif v1525 == 64 then
                        return "Revolver R8";
                    else
                        return "Pistols";
                    end;
                elseif l_weapon_type_0 == l_v1514_0 then
                    if v1525 == 40 then
                        return "Scout";
                    elseif v1525 == 9 then
                        return "AWP";
                    else
                        return "Auto Snipers";
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v1527()
            -- upvalues: v25 (ref)
            v25.ragebot.main.double_tap[1]:override();
            v25.ragebot.main.hide_shots[1]:override();
        end;
        local function v1528()
            -- upvalues: v25 (ref)
            v25.ragebot.main.double_tap[1]:override(false);
            v25.ragebot.main.hide_shots[1]:override(true);
        end;
        local function v1534()
            -- upvalues: v25 (ref), v1526 (ref), l_v1326_4 (ref), l_v1515_0 (ref)
            if v25.antiaim.misc.fake_duck:get() then
                return false;
            elseif v25.ragebot.main.peek_assist[1]:get() then
                return false;
            elseif not v25.ragebot.main.double_tap[1]:get() then
                return false;
            else
                local v1529 = entity.get_local_player();
                if v1529 == nil then
                    return false;
                else
                    local v1530 = v1529:get_player_weapon();
                    if v1530 == nil then
                        return false;
                    else
                        local v1531 = v1526(v1530);
                        if v1531 == nil or not l_v1326_4.weapons:get(v1531) then
                            return false;
                        else
                            local v1532 = l_v1326_4[v1531];
                            if v1532 == nil then
                                return false;
                            else
                                local v1533 = l_v1515_0();
                                if not v1532.states:get(v1533) then
                                    return false;
                                else
                                    return true;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1535()
            -- upvalues: v1527 (ref)
            v1527();
        end;
        local function v1536()
            -- upvalues: v1534 (ref), v1528 (ref), v1527 (ref)
            if v1534() then
                v1528();
            else
                v1527();
            end;
        end;
        v1535 = v21("auto_hide_shots.on_shutdown", v1535);
        v1536 = v21("auto_hide_shots.on_createmove", v1536);
        local _ = nil;
        local function v1540(v1538)
            -- upvalues: v1527 (ref), v1535 (ref), v1536 (ref)
            local v1539 = v1538:get();
            if not v1539 then
                v1527();
            end;
            events.shutdown(v1535, v1539);
            events.createmove(v1536, v1539);
        end;
        l_v1326_4.enabled:set_callback(v1540, true);
    end;
    v5("antiaim_animations");
    v1326 = nil;
    v1456 = v151.antiaim.settings.animations;
    v1457 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
    v1458 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
    do
        local l_v1456_3, l_v1457_3, l_v1458_3, l_v1514_1, l_v1515_1 = v1456, v1457, v1458, v1514, v1515;
        l_v1514_1 = function(v1546)
            -- upvalues: l_v1458_3 (ref)
            return ffi.cast(l_v1458_3, ffi.cast("uintptr_t", v1546[0]) + 10640)[0];
        end;
        l_v1515_1 = function(v1547, v1548)
            -- upvalues: l_v1456_3 (ref)
            local v1549 = l_v1456_3.air_legs:get();
            if v1549 == "Static" then
                v1547.m_flPoseParameter[6] = 0.5;
                return;
            elseif v1549 == "Walking" then
                local v1550 = v1548[6];
                v1550.m_flWeight = 1;
                v1550.m_flCycle = globals.curtime * 0.5 % 1;
                return;
            else
                return;
            end;
        end;
        local function v1558(v1551)
            -- upvalues: l_v1456_3 (ref), l_v1457_3 (ref)
            local v1552 = l_v1456_3.ground_legs:get();
            if v1552 == "Static" then
                v1551.m_flPoseParameter[0] = 1;
                l_v1457_3:override("Sliding");
                return;
            elseif v1552 == "Jitter" then
                local l_tickcount_1 = globals.tickcount;
                local v1554 = l_v1456_3.legs_offset_1:get();
                local v1555 = l_v1456_3.legs_offset_2:get();
                local v1556 = 1 / (l_tickcount_1 % 8 >= 4 and 200 or 400);
                local v1557 = l_tickcount_1 % 4 >= 2 and v1554 or v1555;
                l_v1457_3:override("Sliding");
                v1551.m_flPoseParameter[0] = v1557 * v1556;
                return;
            elseif v1552 == "Walking" then
                v1551.m_flPoseParameter[7] = 0;
                l_v1457_3:override("Walking");
                return;
            else
                if v1552 == "Earthquake" then
                    v1551.m_flPoseParameter[3] = math.random();
                    v1551.m_flPoseParameter[6] = math.random();
                    v1551.m_flPoseParameter[7] = math.random();
                end;
                l_v1457_3:override();
                return;
            end;
        end;
        local function v1561(v1559, v1560)
            -- upvalues: l_v1456_3 (ref)
            if not l_v1456_3.pitch_on_land:get() then
                return;
            else
                if v1560.landing then
                    v1559.m_flPoseParameter[12] = 0.5;
                end;
                return;
            end;
        end;
        local function v1564(v1562)
            -- upvalues: l_v1456_3 (ref), v152 (ref)
            local v1563 = l_v1456_3.body_lean:get();
            if v1563 == -1 or not v152.is_moving then
                return;
            else
                v1562[12].m_flWeight = v1563;
                return;
            end;
        end;
        local v1568 = v21("animations.on_post_update_clientside_animation", function(v1565)
            -- upvalues: l_v1514_1 (ref), v152 (ref), v1558 (ref), v1561 (ref), l_v1515_1 (ref), v1564 (ref)
            if v1565 ~= entity.get_local_player() then
                return;
            else
                local v1566 = v1565:get_anim_state();
                if v1566 == nil then
                    return;
                else
                    local v1567 = l_v1514_1(v1565);
                    if v1567 == nil then
                        return;
                    else
                        if v152.is_onground then
                            v1558(v1565);
                            v1561(v1565, v1566);
                        else
                            l_v1515_1(v1565, v1567);
                        end;
                        v1564(v1567);
                        return;
                    end;
                end;
            end;
        end);
        local _ = nil;
        local function v1572(v1570)
            -- upvalues: l_v1457_3 (ref), v1568 (ref)
            local v1571 = v1570:get();
            if not v1571 then
                l_v1457_3:override();
            end;
            events.post_update_clientside_animation(v1568, v1571);
        end;
        l_v1456_3.enabled:set_callback(v1572, true);
    end;
    v5("antiaim_disablers");
    v1456 = {};
    v1457 = v151.antiaim.settings.disablers;
    v1458 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled");
    v1514 = function()
        local v1573 = entity.get_local_player();
        if v1573 == nil then
            return false;
        else
            local l_m_iTeamNum_0 = v1573.m_iTeamNum;
            local v1575 = entity.get_player_resource();
            for v1576 = 1, globals.max_players do
                if v1575.m_bConnected[v1576] then
                    local v1577 = v1575.m_iTeam[v1576];
                    if v1573 ~= v1576 and v1577 ~= l_m_iTeamNum_0 and v1575.m_bAlive[v1576] then
                        return false;
                    end;
                end;
            end;
            return true;
        end;
    end;
    do
        local l_v1457_4, l_v1458_4, l_v1514_2, l_v1515_2 = v1457, v1458, v1514, v1515;
        l_v1515_2 = function()
            -- upvalues: l_v1457_4 (ref), l_v1514_2 (ref)
            local v1582 = entity.get_game_rules();
            if v1582 == nil then
                return false;
            elseif l_v1457_4.select:get("Warmup") and v1582.m_bWarmupPeriod then
                return true;
            elseif l_v1457_4.select:get("No Enemies") and l_v1514_2() then
                return true;
            else
                return false;
            end;
        end;
        v1456.update = function(_, _)
            -- upvalues: l_v1458_4 (ref), l_v1457_4 (ref), l_v1515_2 (ref), l_v1307_0 (ref)
            l_v1458_4:override();
            if not l_v1457_4.enabled:get() then
                return false;
            elseif not l_v1515_2() then
                return false;
            else
                local v1585 = globals.curtime * 2.4;
                l_v1307_0.enabled = true;
                l_v1307_0.pitch = "Disabled";
                l_v1307_0.yaw = "Backward";
                l_v1307_0.yaw_offset = v1585 % 1 * 360;
                l_v1307_0.yaw_modifier = "Disabled";
                l_v1307_0.modifier_offset = 0;
                l_v1307_0.body_yaw = true;
                l_v1307_0.inverter = false;
                l_v1307_0.left_limit = 60;
                l_v1307_0.right_limit = 60;
                l_v1307_0.options = {};
                l_v1307_0.freestanding_body_yaw = "Off";
                l_v1307_0.freestanding = false;
                l_v1307_0.defensive = nil;
                l_v1458_4:override(false);
                return true;
            end;
        end;
    end;
    v5("antiaim_air_lag");
    v1457 = {};
    v1458 = v151.antiaim.settings.air_lag;
    v1514 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    v1515 = 0;
    do
        local l_v1458_5, l_v1514_3, l_v1515_3 = v1458, v1514, v1515;
        local function v1589()
            -- upvalues: l_v1515_3 (ref), l_v1514_3 (ref)
            l_v1515_3 = 0;
            l_v1514_3:override();
        end;
        local v1590 = v21("antiaim_air_lag.on_createmove", function()
            -- upvalues: l_v1514_3 (ref), v152 (ref), l_v1515_3 (ref), l_v1458_5 (ref)
            l_v1514_3:override();
            if rage.exploit:get() ~= 1 then
                return;
            elseif v152.is_onground then
                return;
            else
                l_v1515_3 = l_v1515_3 + 1;
                if l_v1515_3 >= l_v1458_5.ticks:get() then
                    l_v1515_3 = 0;
                    l_v1514_3:override(true);
                end;
                return;
            end;
        end);
        v1589 = v21("antiaim_air_lag.on_shutdown", v1589);
        local _ = nil;
        local function v1594(v1592)
            -- upvalues: l_v1514_3 (ref), v1589 (ref), v1590 (ref)
            local v1593 = v1592:get();
            if not v1593 then
                l_v1514_3:override();
            end;
            events.shutdown(v1589, v1593);
            events.createmove(v1590, v1593);
        end;
        l_v1458_5.enabled:set_callback(v1594, true);
    end;
    v5("antiaim_defensive_flick");
    v1458 = {};
    v1514 = 0;
    v1515 = function()
        if rage.exploit:get() ~= 1 then
            return false;
        else
            local v1595 = entity.get_local_player();
            if v1595 == nil then
                return false;
            else
                local v1596 = v1595:get_player_weapon();
                if v1596 == nil then
                    return false;
                else
                    local v1597 = v1596:get_weapon_info();
                    if v1597 == nil or v1597.is_revolver then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
    do
        local l_v1514_4, l_v1515_4 = v1514, v1515;
        v1458.apply = function(_, v1601, v1602)
            -- upvalues: l_v1515_4 (ref), l_v1514_4 (ref), v25 (ref), v153 (ref), l_v1307_0 (ref)
            if v1602 == nil or not v1602.enabled:get() then
                return false;
            elseif not l_v1515_4() then
                return false;
            else
                if v1601.choked_commands == 0 then
                    l_v1514_4 = l_v1514_4 + 1;
                end;
                v1601.force_defensive = v1601.command_number % 7 == 0;
                v25.ragebot.main.hide_shots[2]:override("Break LC");
                v25.ragebot.main.double_tap[2]:override("Always On");
                if v153.defensive_ticks > 0 then
                    local v1603 = 0;
                    local v1604 = v1602.speed_mode:get();
                    if v1604 == "Default" then
                        v1603 = v1602.speed_default:get();
                    end;
                    if v1604 == "Random" then
                        v1603 = utils.random_int(v1602.speed_min:get(), v1602.speed_max:get());
                    end;
                    if v1603 < v153.defensive_ticks - v153.max_defensive_ticks then
                        return;
                    end;
                end;
                local v1605 = v1602.limit:get();
                l_v1307_0.yaw = "Backward";
                l_v1307_0.yaw_offset = 0;
                l_v1307_0.yaw_left = 0;
                l_v1307_0.yaw_right = 0;
                l_v1307_0.hidden = true;
                l_v1307_0.yaw_modifier = "Disabled";
                l_v1307_0.modifier_offset = 0;
                l_v1307_0.body_yaw = true;
                l_v1307_0.inverter = false;
                l_v1307_0.left_limit = v1605;
                l_v1307_0.right_limit = v1605;
                l_v1307_0.options = {};
                local v1606 = {
                    pitch_offset = v1602.pitch:get(), 
                    yaw_offset = v1602.yaw:get()
                };
                local v1607 = v1602.inverter:get();
                if v1602.jitter:get() and bit.band(l_v1514_4, 1) ~= 0 then
                    v1607 = not v1607;
                end;
                if v1607 then
                    v1606.yaw_offset = -v1606.yaw_offset;
                end;
                l_v1307_0.defensive = v1606;
                return true;
            end;
        end;
    end;
    v5("antiaim_manual_yaw");
    v1514 = {};
    v1515 = v151.antiaim.settings.manual_yaw;
    local v1608 = {
        Right = 90, 
        Left = -90, 
        Forward = 180, 
        Backward = 0
    };
    do
        local l_v1515_5, l_v1608_0 = v1515, v1608;
        local function v1611()
            -- upvalues: l_v1608_0 (ref), l_v1515_5 (ref)
            return l_v1608_0[l_v1515_5.select:get()];
        end;
        v1514.update = function(_, _)
            -- upvalues: v1611 (ref), l_v1307_0 (ref), l_v1515_5 (ref)
            local v1614 = v1611();
            if v1614 == nil then
                return false;
            else
                local v1615 = l_v1307_0.yaw_offset or 0;
                l_v1307_0.enabled = true;
                l_v1307_0.yaw_offset = v1615 + v1614;
                l_v1307_0.freestanding = false;
                if l_v1515_5.disable_yaw_modifiers:get() then
                    l_v1307_0.yaw_offset = v1615 + v1614;
                    l_v1307_0.yaw_left = 0;
                    l_v1307_0.yaw_right = 0;
                    l_v1307_0.yaw_modifier = "Disabled";
                    l_v1307_0.modifier_offset = 0;
                end;
                if l_v1515_5.body_freestanding:get() then
                    l_v1307_0.body_yaw = true;
                    l_v1307_0.left_limit = 60;
                    l_v1307_0.right_limit = 60;
                    l_v1307_0.options = {};
                    l_v1307_0.freestanding_body_yaw = "Peek Fake";
                end;
                l_v1307_0.yaw_base = "Local View";
                return true;
            end;
        end;
    end;
    v5("antiaim_freestanding");
    v1515 = {};
    v1608 = v151.antiaim.settings.freestanding;
    local function v1616()
        -- upvalues: v152 (ref), v25 (ref)
        if not v152.is_onground then
            if v152.is_crouched then
                return "In Air & Duck";
            else
                return "In Air";
            end;
        elseif v152.is_crouched then
            return "Ducking";
        elseif v152.is_moving then
            if v25.antiaim.misc.slow_walk:get() then
                return "Slowwalking";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1608_1, l_v1616_0 = v1608, v1616;
        local function v1619()
            -- upvalues: l_v1608_1 (ref), l_v1616_0 (ref)
            return l_v1608_1.disablers:get(l_v1616_0());
        end;
        local function v1620()
            -- upvalues: l_v1608_1 (ref), v1619 (ref)
            return l_v1608_1.enabled:get() and not v1619();
        end;
        local function v1623()
            local v1621 = rage.antiaim:get_target(false);
            local v1622 = rage.antiaim:get_target(true);
            if v1621 == nil or v1622 == nil then
                return nil;
            else
                return v1622 - v1621;
            end;
        end;
        local function v1629(v1624, v1625)
            -- upvalues: v1623 (ref), l_v1309_0 (ref), l_v1307_0 (ref), l_v1608_1 (ref), v1458 (ref), l_l_angles_0_1 (ref)
            local v1626 = v1623();
            if v1626 == nil then
                return;
            else
                local v1627 = l_v1309_0:apply(v1625, "Freestanding");
                if v1627 == nil then
                    l_v1307_0.freestanding = true;
                    l_v1307_0.freestanding_disable_yaw_modifiers = l_v1608_1.disable_yaw_modifiers:get();
                    l_v1307_0.freestanding_body_freestanding = l_v1608_1.body_freestanding:get();
                    return;
                else
                    l_v1307_0.yaw_offset = l_v1307_0.yaw_offset + v1626;
                    if v1627.defensive ~= nil and (v1458:apply(v1624, v1627.flick) or l_l_angles_0_1:apply(v1624, v1627.defensive)) then
                        local l_yaw_offset_0 = l_v1307_0.defensive.yaw_offset;
                        if l_yaw_offset_0 ~= nil then
                            l_v1307_0.defensive.yaw_offset = l_yaw_offset_0 + v1626;
                        end;
                    end;
                    l_v1307_0.freestanding = false;
                    return;
                end;
            end;
        end;
        v1515.update = function(_, v1631, v1632)
            -- upvalues: v1620 (ref), l_v1307_0 (ref), v1629 (ref)
            if not v1620() then
                l_v1307_0.freestanding = false;
                return false;
            else
                v1629(v1631, v1632);
                return true;
            end;
        end;
    end;
    v5("antiaim_edge_yaw");
    v1608 = {};
    v1616 = v151.antiaim.settings.edge_yaw;
    local v1633 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    local function v1643(v1634)
        -- upvalues: v24 (ref)
        local v1635 = entity.get_local_player();
        if v1635 == nil then
            return nil;
        else
            local v1636 = v1635:get_eye_position();
            if v1636 == nil then
                return nil;
            else
                local v1637 = 0;
                local v1638 = {};
                for v1639 = -180, 180, 45 do
                    local v1640 = v1636 + vector():angles(vector(0, v1639, 0)) * 25;
                    if utils.trace_line(v1636, v1640, v1635, 4294967295).fraction < 1 then
                        v1637 = v1637 + 1;
                        v1638[v1637] = v1639;
                    end;
                end;
                if v1637 < 2 then
                    return nil;
                else
                    local v1641 = math.normalize_yaw(v24.lerp(v1638[1], v1638[v1637], 0.5));
                    local v1642 = math.normalize_yaw(v1634.view_angles.y - v1641);
                    if math.abs(v1642) > 90 then
                        return nil;
                    else
                        return math.normalize_yaw(2 * (v1641 - v1634.view_angles.y) - 180);
                    end;
                end;
            end;
        end;
    end;
    do
        local l_v1616_1, l_v1633_0, l_v1643_0 = v1616, v1633, v1643;
        local function v1647()
            -- upvalues: l_v1616_1 (ref), l_v1633_0 (ref)
            if not l_v1616_1.enabled:get() then
                return false;
            elseif l_v1616_1.only_on_fake_duck:get() and not l_v1633_0:get() then
                return false;
            else
                return true;
            end;
        end;
        v1608.update = function(_, v1649)
            -- upvalues: v1647 (ref), l_v1643_0 (ref), l_v1307_0 (ref)
            if not v1647() then
                return false;
            else
                local v1650 = l_v1643_0(v1649);
                if v1650 == nil then
                    return false;
                else
                    l_v1307_0.yaw_offset = (l_v1307_0.yaw_offset or 0) + v1650;
                    return true;
                end;
            end;
        end;
    end;
    v5("antiaim_safe_head");
    v1616 = {};
    v1633 = v151.antiaim.settings.safe_head;
    v1643 = 0;
    local v1651 = 1440000;
    local function v1653(v1652)
        return v1652:get_weapon_index() == 31;
    end;
    do
        local l_v1633_1, l_v1643_1, l_v1651_0, l_v1653_0 = v1633, v1643, v1651, v1653;
        local function v1660(v1658)
            -- upvalues: l_v1653_0 (ref), l_v1643_1 (ref)
            if l_v1653_0(v1658) then
                return false;
            else
                local v1659 = v1658:get_weapon_info();
                if v1659 == nil then
                    return false;
                else
                    return v1659.weapon_type == l_v1643_1;
                end;
            end;
        end;
        local function v1673()
            -- upvalues: v1660 (ref), l_v1653_0 (ref), v152 (ref), l_v1633_1 (ref), l_v1651_0 (ref)
            local v1661 = entity.get_local_player();
            if v1661 == nil then
                return nil;
            else
                local v1662 = v1661:get_player_weapon();
                if v1662 == nil then
                    return nil;
                else
                    local v1663 = entity.get_threat();
                    if v1663 == nil then
                        return nil;
                    else
                        local v1664 = v1660(v1662);
                        local v1665 = l_v1653_0(v1662);
                        local v1666 = not v152.is_onground;
                        local l_is_moving_0 = v152.is_moving;
                        local l_is_crouched_0 = v152.is_crouched;
                        local l_is_onground_0 = v152.is_onground;
                        local v1670 = v1661:get_origin() - v1663:get_origin();
                        local v1671 = v1670:lengthsqr();
                        local v1672 = l_v1633_1.target_height:get();
                        if v1672 <= v1670.z and v1664 and v1666 and l_is_crouched_0 and l_v1633_1.select:get("Air Crouch Knife") then
                            return "Air Crouch Knife";
                        elseif v1672 <= v1670.z and v1665 and v1666 and l_is_crouched_0 and l_v1633_1.select:get("Air Crouch Taser") then
                            return "Air Crouch Taser";
                        elseif v1670.z >= 50 and (l_is_onground_0 and not l_is_moving_0 or l_is_crouched_0) and l_v1633_1.select:get("Height Advantage") then
                            return "Height Advantage";
                        elseif l_v1651_0 < v1671 and not l_is_moving_0 and l_is_crouched_0 and l_v1633_1.select:get("Crouch") then
                            return "Crouch";
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
        local function v1677(_, _)
            -- upvalues: l_v1307_0 (ref), l_v1633_1 (ref), v25 (ref)
            l_v1307_0.pitch = "Down";
            l_v1307_0.yaw_base = "At Target";
            l_v1307_0.yaw = "Backward";
            l_v1307_0.yaw_offset = 22;
            l_v1307_0.yaw_left = 0;
            l_v1307_0.yaw_right = 0;
            l_v1307_0.yaw_modifier = "Off";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.body_yaw = true;
            l_v1307_0.inverter = false;
            l_v1307_0.left_limit = 60;
            l_v1307_0.right_limit = 60;
            l_v1307_0.options = {};
            l_v1307_0.freestanding_body_yaw = "Off";
            l_v1307_0.delay = nil;
            if l_v1633_1.e_spam_while_safe_head:get() then
                local v1676 = {};
                l_v1307_0.hidden = true;
                v1676.pitch_offset = 0;
                v1676.yaw_offset = 180;
                v25.ragebot.main.hide_shots[2]:override("Break LC");
                v25.ragebot.main.double_tap[2]:override("Always On");
                l_v1307_0.defensive = v1676;
            end;
        end;
        v1616.update = function(_, v1679)
            -- upvalues: l_v1633_1 (ref), v1673 (ref), v1677 (ref)
            if not l_v1633_1.enabled:get() then
                return false;
            else
                local v1680 = v1673();
                if v1680 == nil then
                    return false;
                else
                    v1677(v1679, v1680);
                    return true;
                end;
            end;
        end;
    end;
    v5("antiaim_auto_teleport");
    v1633 = {};
    v1643 = v151.antiaim.settings.auto_teleport;
    v1651 = 1;
    v1653 = 2;
    local v1681 = 3;
    local v1682 = 5;
    local v1683 = false;
    local function v1684()
        -- upvalues: v152 (ref)
        if not v152.is_onground then
            if v152.is_crouched then
                return "In Air & Duck";
            else
                return "In Air";
            end;
        else
            return nil;
        end;
    end;
    do
        local l_v1643_2, l_v1651_1, l_v1653_1, l_v1681_0, l_v1682_0, l_v1683_0, l_v1684_0 = v1643, v1651, v1653, v1681, v1682, v1683, v1684;
        local function v1696(v1692)
            -- upvalues: l_v1653_1 (ref), l_v1681_0 (ref), l_v1651_1 (ref), l_v1682_0 (ref)
            local v1693 = v1692:get_weapon_info();
            if v1693 == nil then
                return nil;
            else
                local l_weapon_type_1 = v1693.weapon_type;
                local v1695 = v1692:get_weapon_index();
                if l_weapon_type_1 == l_v1653_1 then
                    return "SMG";
                elseif l_weapon_type_1 == l_v1681_0 then
                    return "Rifles";
                elseif l_weapon_type_1 == l_v1651_1 then
                    if v1695 == 1 then
                        return "Desert Eagle";
                    elseif v1695 == 64 then
                        return "Revolver R8";
                    else
                        return "Pistols";
                    end;
                elseif l_weapon_type_1 == l_v1682_0 then
                    if v1695 == 40 then
                        return "Scout";
                    elseif v1695 == 9 then
                        return "AWP";
                    else
                        return "Auto Snipers";
                    end;
                else
                    return nil;
                end;
            end;
        end;
        local function v1697()
            return entity.get_threat(true) ~= nil;
        end;
        local function v1703(_, _, v1700)
            -- upvalues: v1696 (ref), l_v1643_2 (ref), l_v1684_0 (ref)
            if rage.exploit:get() ~= 1 then
                return false;
            else
                local v1701 = v1696(v1700);
                if v1701 == nil then
                    return false;
                elseif not l_v1643_2.weapons:get(v1701) then
                    return false;
                else
                    local v1702 = l_v1684_0();
                    if not l_v1643_2.select:get(v1702) then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
        local v1707 = v21("auto_teleport.on_createmove", function(v1704)
            -- upvalues: v1697 (ref), v1703 (ref), l_v1683_0 (ref)
            local v1705 = entity.get_local_player();
            if v1705 == nil then
                return;
            else
                local v1706 = v1705:get_player_weapon();
                if v1706 == nil then
                    return;
                elseif v1697() then
                    if v1703(v1704, v1705, v1706) and not l_v1683_0 then
                        l_v1683_0 = true;
                        rage.exploit:force_teleport();
                    end;
                    return;
                else
                    l_v1683_0 = false;
                    return;
                end;
            end;
        end);
        local _ = nil;
        local function v1710(v1709)
            -- upvalues: v1707 (ref)
            events.createmove(v1707, v1709:get());
        end;
        l_v1643_2.enabled:set_callback(v1710, true);
    end;
    v1643 = function()
        -- upvalues: v152 (ref)
        if v152.team_num == 2 then
            return "T";
        elseif v152.team_num == 3 then
            return "CT";
        else
            return nil;
        end;
    end;
    v1651 = function(v1711, v1712)
        return ({
            [1] = -v1711, 
            [2] = -v1711 / 2, 
            [3] = -v1711 / 3, 
            [4] = v1711 / 3, 
            [5] = v1711 / 2, 
            [6] = v1711
        })[v1712];
    end;
    v1653 = function(v1713)
        -- upvalues: l_v1307_0 (ref), l_v1220_1 (ref), l_v1177_2 (ref), l_v1182_1 (ref)
        if v1713.choked_commands ~= 0 then
            return;
        else
            if rage.exploit:get() == 1 then
                local v1714 = math.max(1, l_v1307_0.delay or 1);
                l_v1220_1 = l_v1220_1 + 1;
                if l_v1220_1 < v1714 then
                    return;
                end;
            end;
            local v1715 = true;
            if l_v1307_0.invert_chance ~= nil then
                v1715 = false;
                if l_v1307_0.invert_chance >= utils.random_int(1, 100) then
                    v1715 = true;
                end;
            end;
            l_v1177_2 = l_v1177_2 + 1;
            if v1715 then
                l_v1182_1 = not l_v1182_1;
            end;
            l_v1220_1 = 0;
            return;
        end;
    end;
    v1681 = function()
        -- upvalues: l_v1307_0 (ref), l_l_match_0_2 (ref), l_v1183_2 (ref), l_v1189_2 (ref)
        local l_defensive_0 = l_v1307_0.defensive;
        local v1717 = 1;
        if l_defensive_0 ~= nil and l_defensive_0.delay ~= nil then
            v1717 = math.max(1, l_defensive_0.delay);
        end;
        l_l_match_0_2 = l_l_match_0_2 + 1;
        if l_l_match_0_2 < v1717 then
            return;
        else
            l_v1183_2 = l_v1183_2 + 1;
            l_v1189_2 = not l_v1189_2;
            l_l_match_0_2 = 0;
            return;
        end;
    end;
    v1682 = function()
        -- upvalues: l_v1307_0 (ref), l_v1189_2 (ref), l_v1183_2 (ref), l_v1219_1 (ref)
        local l_defensive_1 = l_v1307_0.defensive;
        if l_defensive_1 == nil then
            return;
        else
            if l_defensive_1.pitch_offset ~= nil then
                rage.antiaim:override_hidden_pitch(l_defensive_1.pitch_offset);
            end;
            if l_defensive_1.yaw_offset ~= nil then
                local l_yaw_offset_1 = l_defensive_1.yaw_offset;
                if l_v1307_0.yaw_offset ~= nil then
                    l_yaw_offset_1 = l_yaw_offset_1 - l_v1307_0.yaw_offset;
                end;
                if l_defensive_1.yaw_left ~= nil and l_v1189_2 == true then
                    l_yaw_offset_1 = l_yaw_offset_1 + l_defensive_1.yaw_left;
                end;
                if l_defensive_1.yaw_right ~= nil and l_v1189_2 == false then
                    l_yaw_offset_1 = l_yaw_offset_1 + l_defensive_1.yaw_right;
                end;
                if l_defensive_1.yaw_modifier == "Offset" then
                    local l_modifier_offset_0 = l_defensive_1.modifier_offset;
                    if not l_v1189_2 then
                        l_modifier_offset_0 = 0;
                    end;
                    l_yaw_offset_1 = l_yaw_offset_1 + l_modifier_offset_0;
                end;
                if l_defensive_1.yaw_modifier == "Center" then
                    local v1721 = l_defensive_1.modifier_offset * 0.5;
                    if not l_v1189_2 then
                        v1721 = -v1721;
                    end;
                    l_yaw_offset_1 = l_yaw_offset_1 + v1721;
                end;
                if l_defensive_1.yaw_modifier == "Skitter" then
                    l_yaw_offset_1 = l_yaw_offset_1 + l_defensive_1.modifier_offset * l_v1219_1[l_v1183_2 % #l_v1219_1 + 1];
                end;
                rage.antiaim:override_hidden_yaw_offset(-l_yaw_offset_1);
            end;
            return;
        end;
    end;
    v1683 = function()
        -- upvalues: l_v1307_0 (ref)
        if l_v1307_0.yaw_left ~= nil and l_v1307_0.yaw_right ~= nil then
            local v1722 = l_v1307_0.yaw_offset or 0;
            if l_v1307_0.inverter == true then
                l_v1307_0.yaw_offset = v1722 + l_v1307_0.yaw_left;
            end;
            if l_v1307_0.inverter == false then
                l_v1307_0.yaw_offset = v1722 + l_v1307_0.yaw_right;
            end;
            return;
        else
            return;
        end;
    end;
    v1684 = function()
        -- upvalues: l_v1307_0 (ref), l_v1182_1 (ref), l_v1177_2 (ref), l_v1219_1 (ref), v24 (ref), v152 (ref), v1651 (ref)
        if l_v1307_0.yaw_modifier == "Offset" then
            local v1723 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_1 = l_v1307_0.modifier_offset;
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1723 + (l_v1182_1 and l_modifier_offset_1 or 0);
            return;
        elseif l_v1307_0.yaw_modifier == "Center" then
            local v1725 = l_v1307_0.yaw_offset or 0;
            local v1726 = -l_v1307_0.modifier_offset;
            if not l_v1182_1 then
                v1726 = -v1726;
            end;
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1725 + v1726 / 2;
            return;
        elseif l_v1307_0.yaw_modifier == "Skitter" then
            local v1727 = l_v1219_1[l_v1177_2 % #l_v1219_1 + 1];
            local v1728 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_2 = l_v1307_0.modifier_offset;
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1728 + l_modifier_offset_2 * v1727;
            return;
        elseif l_v1307_0.yaw_modifier == "Spin" then
            local v1730 = globals.curtime * 3;
            local v1731 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_3 = l_v1307_0.modifier_offset;
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1731 + v24.lerp(-l_modifier_offset_3, l_modifier_offset_3, v1730 % 1);
            return;
        elseif l_v1307_0.yaw_modifier == "Random" then
            local v1733 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_4 = l_v1307_0.modifier_offset;
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1733 + utils.random_int(-l_modifier_offset_4, l_modifier_offset_4);
            return;
        elseif l_v1307_0.yaw_modifier == "3-Way" then
            local v1735 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_5 = l_v1307_0.modifier_offset;
            local v1737 = {
                [1] = -1, 
                [2] = 0, 
                [3] = 1
            };
            local v1738 = v1737[v152.sent_packets % #v1737 + 1];
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1735 + l_modifier_offset_5 * v1738;
            return;
        elseif l_v1307_0.yaw_modifier == "5-Way" then
            local v1739 = l_v1307_0.yaw_offset or 0;
            local l_modifier_offset_6 = l_v1307_0.modifier_offset;
            local v1741 = {
                [1] = -1, 
                [2] = -0.5, 
                [3] = 0, 
                [4] = 0.5, 
                [5] = 1
            };
            local v1742 = v1741[v152.sent_packets % #v1741 + 1];
            l_v1307_0.yaw_modifier = "Disabled";
            l_v1307_0.modifier_offset = 0;
            l_v1307_0.yaw_offset = v1739 + l_modifier_offset_6 * v1742;
            return;
        else
            if l_v1307_0.yaw_modifier == "Frost" then
                local l_modifier_offset_7 = l_v1307_0.modifier_offset;
                local v1744 = v152.sent_packets % 6 + 1;
                local v1745 = v1651(l_modifier_offset_7, v1744);
                l_v1307_0.yaw_modifier = "3-Way";
                l_v1307_0.modifier_offset = v1745;
            end;
            if l_v1307_0.yaw_modifier == "Frostbomber" then
                local v1746 = "3-Way";
                if v152.sent_packets % math.random(3, 4) == 0 then
                    v1746 = math.random(0, 6) == 0 and "5-way" or "Random";
                end;
                l_v1307_0.yaw_modifier = v1746;
            end;
            return;
        end;
    end;
    local function v1751()
        -- upvalues: l_v1307_0 (ref), l_v1182_1 (ref)
        if l_v1307_0.options == nil then
            return;
        else
            local v1747 = false;
            local v1748 = {};
            for v1749 = 1, #l_v1307_0.options do
                local v1750 = l_v1307_0.options[v1749];
                if v1750 == "Jitter" then
                    v1747 = true;
                elseif v1750 ~= "Randomize Jitter" then
                    table.insert(v1748, v1750);
                end;
            end;
            if v1747 then
                l_v1307_0.inverter = l_v1182_1;
            end;
            l_v1307_0.options = v1748;
            return;
        end;
    end;
    local function v1756(v1752)
        -- upvalues: v1643 (ref), l_v1320_0 (ref), l_l_angles_0_1 (ref), l_v1309_0 (ref), l_v1319_0 (ref), v1514 (ref), v1515 (ref), v1616 (ref), v1608 (ref), v1458 (ref), v1456 (ref)
        local v1753 = v1643();
        if v1753 == nil then
            return;
        else
            l_v1320_0:update();
            l_l_angles_0_1:update(v1752);
            local v1754 = l_v1309_0:update(v1752, v1753);
            l_v1319_0:update(v1752, v1754);
            local v1755 = l_v1309_0:get(v1753, "On Peek");
            if v1514:update(v1752) then
                return;
            elseif v1515:update(v1752, v1753) then
                return;
            elseif v1616:update(v1752) then
                return;
            elseif v1608:update(v1752) then
                return;
            else
                if v1754 ~= nil and v1754.defensive ~= nil and not v1458:apply(v1752, v1754.flick) then
                    l_l_angles_0_1:apply(v1752, v1754.defensive);
                end;
                if v1755 ~= nil and l_v1309_0:is_active_ex(v1755) and entity.get_threat(true) then
                    l_l_angles_0_1:apply(v1752, v1755.defensive);
                end;
                v1456:update(v1752);
                return;
            end;
        end;
    end;
    local function v1758(v1757)
        -- upvalues: v1653 (ref), v1681 (ref), v1751 (ref), v1684 (ref), v1683 (ref), v1682 (ref)
        rage.antiaim:override_hidden_yaw_offset(0);
        v1653(v1757);
        if v1757.choked_commands == 0 then
            v1681();
        end;
        v1751();
        v1684();
        v1683();
        v1682();
    end;
    local function v1759()
        -- upvalues: l_v1307_0 (ref)
        l_v1307_0:unset();
    end;
    local function v1761(v1760)
        -- upvalues: l_v1307_0 (ref), v1756 (ref), v1758 (ref)
        l_v1307_0:clear();
        l_v1307_0:unset();
        v1756(v1760);
        v1758(v1760);
        l_v1307_0:set();
    end;
    v1759 = v21("antiaim.on_shutdown", v1759);
    v1761 = v21("antiaim.on_createmove", v1761);
    events.shutdown(v1759);
    events.createmove(v1761);
end;
v5("begin_ragebot");
v1177 = nil;
v5("ragebot_smart_peek");
v1182 = nil;
v1183 = v151.ragebot.smart_peek;
v1189 = bit.lshift(1, 0);
v1219 = 0;
v1220 = 1;
l_match_0 = 2;
v1307 = 3;
l_angles_0 = 4;
v1309 = 5;
v1319 = 6;
v1320 = 7;
v1321 = 10;
v1323 = 0;
v1326 = 1;
local v1762 = 2;
local v1763 = 3;
local v1764 = 4;
local v1765 = 5;
local v1766 = 6;
local v1767 = 7;
local v1768 = 8;
local v1769 = 9;
local v1770 = 10;
local v1771 = 11;
local v1772 = 12;
local v1773 = 13;
local v1774 = 14;
local v1775 = 15;
local v1776 = 16;
local v1777 = 17;
local v1778 = 18;
local v1779 = {
    [v1323] = v1220, 
    [v1765] = l_match_0, 
    [v1763] = v1307, 
    [v1768] = v1319, 
    [v1767] = v1320, 
    [v1772] = v1319, 
    [v1771] = v1320, 
    [v1777] = l_angles_0, 
    [v1775] = v1309
};
local v1780 = nil;
local v1781 = 0;
local v1782 = nil;
local v1783 = {};
local function v1785(v1784)
    return {
        selection = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1784, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1784, "Multipoint", "Body Scale"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", v1784, "Min. Damage"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1784, "Hit Chance")
        }, 
        safety = {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1784, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1784, "Safe Points"), 
            ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", v1784, "Ensure Hitbox Safety")
        }
    };
end;
v1783["SSG-08"] = v1785("SSG-08");
v1783.Deagle = v1785("Desert Eagle");
v1783.Pistols = v1785("Pistols");
do
    local l_v1183_3, l_v1189_3, l_v1219_2, l_v1220_2, l_v1307_1, l_v1319_1, l_v1320_1, l_v1323_4, l_v1763_0, l_v1765_0, l_v1767_0, l_v1768_0, l_v1769_0, l_v1770_0, l_v1775_0, l_v1777_0, l_v1779_0, l_v1780_0, l_v1781_0, l_v1782_0, l_v1783_0, l_v1785_0 = v1183, v1189, v1219, v1220, v1307, v1319, v1320, v1323, v1763, v1765, v1767, v1768, v1769, v1770, v1775, v1777, v1779, v1780, v1781, v1782, v1783, v1785;
    l_v1785_0 = function()
        -- upvalues: l_v1780_0 (ref), l_v1781_0 (ref), l_v1782_0 (ref)
        l_v1780_0 = nil;
        l_v1781_0 = 0;
        l_v1782_0 = nil;
    end;
    local function v1810()
        -- upvalues: v25 (ref), l_v1783_0 (ref)
        v25.ragebot.main.double_tap[1]:override();
        v25.ragebot.main.peek_assist[4]:override();
        for _, v1809 in pairs(l_v1783_0) do
            v1809.selection.head_scale:override();
            v1809.selection.body_scale:override();
            v1809.selection.hit_chance:override();
            v1809.safety.body_aim:override();
            v1809.safety.safe_points:override();
            v1809.safety.ensure_hitbox_safety:override();
        end;
    end;
    local function v1815()
        -- upvalues: l_v1183_3 (ref), v25 (ref), l_v1783_0 (ref)
        local v1811 = l_v1183_3.hit_chance:get();
        local v1812 = l_v1183_3.unsafety:get();
        v25.ragebot.main.peek_assist[4]:override("On Shot");
        for _, v1814 in pairs(l_v1783_0) do
            v1814.selection.head_scale:override(100);
            v1814.selection.body_scale:override(100);
            if v1811 ~= -1 then
                v1814.selection.hit_chance:override(v1811);
            end;
            if v1812 then
                v1814.safety.body_aim:override("Default");
                v1814.safety.safe_points:override("Default");
                v1814.safety.ensure_hitbox_safety:override({});
            end;
        end;
    end;
    local function v1817(v1816)
        -- upvalues: l_v1220_2 (ref), l_v1307_1 (ref), l_v1319_1 (ref), l_v1320_1 (ref)
        if v1816 == l_v1220_2 then
            return 4;
        elseif v1816 == l_v1307_1 then
            return 1.25;
        elseif v1816 == l_v1319_1 then
            return 0.75;
        elseif v1816 == l_v1320_1 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1822(v1818, v1819, v1820, v1821)
        -- upvalues: v1817 (ref), l_v1220_2 (ref)
        v1819 = v1819 * v1817(v1820);
        if v1818.m_ArmorValue > 0 then
            if v1820 == l_v1220_2 then
                if v1818.m_bHasHelmet then
                    v1819 = v1819 * (v1821 * 0.5);
                end;
            else
                v1819 = v1819 * (v1821 * 0.5);
            end;
        end;
        return v1819;
    end;
    local function v1834(v1823, v1824, v1825, v1826, v1827)
        -- upvalues: v1822 (ref)
        local v1828 = v1824 - v1823;
        local l_damage_0 = v1827.damage;
        local l_armor_ratio_0 = v1827.armor_ratio;
        local l_range_0 = v1827.range;
        local l_range_modifier_0 = v1827.range_modifier;
        local v1833 = math.min(l_range_0, v1828:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v1833 * 0.002);
        return (v1822(v1825, l_damage_0, v1826, l_armor_ratio_0));
    end;
    local function v1835()
        -- upvalues: l_v1183_3 (ref)
        return l_v1183_3.simulation:get() * 0.01;
    end;
    local function v1836()
        -- upvalues: l_v1183_3 (ref)
        return l_v1183_3.rate_limit:get() * 0.01;
    end;
    local function v1837()
        -- upvalues: v25 (ref)
        return v25.ragebot.selection.min_damage:get();
    end;
    local function v1838()
        -- upvalues: l_v1183_3 (ref)
        return l_v1183_3.dev_mode:get() and l_v1183_3.range:get() or 20;
    end;
    local function v1839()
        -- upvalues: l_v1183_3 (ref)
        return l_v1183_3.dev_mode:get() and l_v1183_3.retreat:get() or 25;
    end;
    local function v1841()
        -- upvalues: l_v1183_3 (ref), l_v1323_4 (ref), l_v1765_0 (ref), l_v1763_0 (ref), l_v1777_0 (ref), l_v1775_0 (ref), l_v1768_0 (ref), l_v1767_0 (ref), l_v1770_0 (ref), l_v1769_0 (ref)
        local v1840 = {};
        if l_v1183_3.hitboxes:get("Head") then
            table.insert(v1840, l_v1323_4);
        end;
        if l_v1183_3.hitboxes:get("Chest") then
            table.insert(v1840, l_v1765_0);
        end;
        if l_v1183_3.hitboxes:get("Stomach") then
            table.insert(v1840, l_v1763_0);
        end;
        if l_v1183_3.hitboxes:get("Arms") then
            table.insert(v1840, l_v1777_0);
            table.insert(v1840, l_v1775_0);
        end;
        if l_v1183_3.hitboxes:get("Legs") then
            table.insert(v1840, l_v1768_0);
            table.insert(v1840, l_v1767_0);
            table.insert(v1840, l_v1770_0);
            table.insert(v1840, l_v1769_0);
        end;
        return v1840;
    end;
    local function v1843(v1842)
        -- upvalues: l_v1779_0 (ref), l_v1219_2 (ref)
        return l_v1779_0[v1842] or l_v1219_2;
    end;
    local function v1845(v1844)
        return v1844[0];
    end;
    local function v1850(v1846, v1847)
        local v1848 = v1846:get_weapon_index();
        local l_weapon_type_2 = v1847.weapon_type;
        if v1848 == 1 then
            return "Deagle";
        elseif v1848 == 64 then
            return "Revolver";
        elseif v1848 == 40 then
            return "SSG-08";
        elseif l_weapon_type_2 == 1 then
            return "Pistols";
        else
            return nil;
        end;
    end;
    local function v1867(v1851, v1852, v1853, v1854, v1855)
        -- upvalues: v1843 (ref), v1834 (ref)
        local v1856 = {};
        local v1857 = v1852:get_eye_position();
        local v1858 = v1853:get_weapon_info();
        local l_m_iHealth_1 = v1854.m_iHealth;
        for v1860 = 1, #v1851 do
            local v1861 = v1851[v1860];
            local v1862 = v1843(v1861);
            local v1863 = v1854:get_hitbox_position(v1861);
            local v1864 = v1834(v1857, v1863, v1854, v1862, v1858);
            local v1865 = v1864 < v1855;
            local v1866 = v1864 < l_m_iHealth_1;
            if not v1865 or not v1866 then
                table.insert(v1856, {
                    index = v1860, 
                    pos = v1863
                });
            end;
        end;
        return v1856;
    end;
    local function v1871(v1868)
        -- upvalues: v1845 (ref)
        if v1868 == nil then
            return false;
        else
            local l_status_8, l_result_8 = pcall(v1845, v1868);
            if not l_status_8 or l_result_8 == nil then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v1873(v1872)
        -- upvalues: v1871 (ref)
        return v1871(v1872.target);
    end;
    local function v1875(v1874)
        return not v1874.in_forward and not v1874.in_back and not v1874.in_moveleft and not v1874.in_moveright;
    end;
    local function v1877(v1876)
        -- upvalues: l_v1183_3 (ref)
        return l_v1183_3.weapons:get(v1876);
    end;
    local function v1881(v1878, v1879, v1880)
        if v1878 == nil or v1879 == nil then
            return false;
        elseif v1880.max_clip1 == 0 or v1879.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v1878.m_flNextAttack then
            return false;
        elseif globals.curtime < v1879.m_flNextPrimaryAttack then
            return false;
        else
            return true;
        end;
    end;
    local function v1882()
        return true;
    end;
    local function v1885(v1883, v1884)
        return {
            ctx = v1883, 
            target = v1884, 
            simtime = 0, 
            retreat = -1, 
            teleport = 0
        };
    end;
    local function v1887(v1886)
        return v1886:simulate_movement(nil, vector(), 1);
    end;
    local function v1894(v1888, v1889, v1890)
        local v1892, v1893 = utils.trace_bullet(v1888, v1889, v1890, function(v1891)
            -- upvalues: v1888 (ref)
            return v1891 ~= v1888 and v1891:is_enemy();
        end);
        return v1892, v1893;
    end;
    local function v1907(v1895, v1896, v1897, v1898, v1899)
        -- upvalues: v1894 (ref)
        local l_m_iHealth_2 = v1896.m_iHealth;
        for v1901 = 1, #v1898 do
            local v1902 = v1898[v1901];
            local v1903, _ = v1894(v1895, v1897, v1902.pos);
            local v1905 = v1899 <= v1903;
            local v1906 = l_m_iHealth_2 <= v1903;
            if v1905 or v1906 then
                return true;
            end;
        end;
        return false;
    end;
    local function v1914(v1908, v1909, v1910, v1911, v1912)
        -- upvalues: v1907 (ref)
        local v1913 = v1908.origin + vector(0, 0, v1908.view_offset);
        return v1908, v1907(v1909, v1910, v1913, v1911, v1912);
    end;
    local function v1924(v1915, v1916, v1917, v1918, v1919, v1920, v1921)
        -- upvalues: l_v1189_3 (ref), v1914 (ref)
        v1915.view_angles.y = v1919;
        v1918:think(1);
        if bit.band(v1918.flags, l_v1189_3) == 0 then
            return nil, false;
        else
            local _, v1923 = v1914(v1918, v1916, v1917, v1920, v1921);
            if v1923 then
                v1918:think(1);
            end;
            return v1918, v1923;
        end;
    end;
    local function v1959(v1925, v1926, v1927)
        -- upvalues: v1882 (ref), v1836 (ref), v1837 (ref), v1841 (ref), l_v1780_0 (ref), v1873 (ref), v1867 (ref), v1914 (ref), l_v1781_0 (ref), v1875 (ref), l_v1189_3 (ref), v1907 (ref), v1887 (ref), v1838 (ref), v1924 (ref), v1885 (ref)
        if not v1882() then
            return false;
        else
            local l_frametime_1 = globals.frametime;
            local v1929 = v1836();
            local v1930 = v1837();
            local v1931 = v1841();
            if l_v1780_0 ~= nil and v1873(l_v1780_0) then
                local l_ctx_0 = l_v1780_0.ctx;
                local l_target_0 = l_v1780_0.target;
                local l_m_iHealth_3 = l_target_0.m_iHealth;
                if v1930 >= 100 then
                    v1930 = v1930 + l_m_iHealth_3 - 100;
                end;
                local v1935 = v1867(v1931, v1926, v1927, l_target_0, v1930);
                local _, v1937 = v1914(l_ctx_0, v1926, l_target_0, v1935, v1930);
                if v1937 then
                    l_v1780_0.simtime = 0;
                end;
                l_v1780_0.simtime = l_v1780_0.simtime + l_frametime_1;
                return true;
            else
                if v1929 > 0 then
                    if l_v1781_0 > 0 then
                        l_v1781_0 = l_v1781_0 - l_frametime_1;
                        return false;
                    else
                        l_v1781_0 = v1929;
                    end;
                end;
                if not v1875(v1925) then
                    return false;
                else
                    local l_m_fFlags_0 = v1926.m_fFlags;
                    if bit.band(l_m_fFlags_0, l_v1189_3) == 0 then
                        return false;
                    elseif v1926.m_vecVelocity:length2dsqr() > 6400 then
                        return false;
                    else
                        local v1939 = entity.get_threat();
                        if v1939 == nil or v1939:is_dormant() then
                            return false;
                        else
                            local l_m_iHealth_4 = v1939.m_iHealth;
                            if v1930 >= 100 then
                                v1930 = v1930 + l_m_iHealth_4 - 100;
                            end;
                            local v1941 = v1867(v1931, v1926, v1927, v1939, v1930);
                            if v1907(v1926, v1939, v1926:get_eye_position(), v1941, v1930) then
                                return false;
                            else
                                local v1942 = nil;
                                local v1943 = nil;
                                local v1944 = v1926:get_origin();
                                local v1945 = (v1939:get_origin() - v1944):angles().y + 180;
                                v1942 = v1945 - 90;
                                v1943 = v1945 + 90;
                                v1944 = v1925.view_angles:clone();
                                local l_forwardmove_0 = v1925.forwardmove;
                                local l_sidemove_0 = v1925.sidemove;
                                local l_in_duck_0 = v1925.in_duck;
                                v1945 = v1925.in_jump;
                                local l_in_speed_0 = v1925.in_speed;
                                v1925.forwardmove = 450;
                                v1925.sidemove = 0;
                                v1925.in_duck = false;
                                v1925.in_jump = false;
                                v1925.in_speed = false;
                                local v1950 = v1887(v1926);
                                local v1951 = v1887(v1926);
                                local v1952 = 0;
                                local v1953 = 0;
                                for v1954 = 1, v1838() do
                                    if v1952 ~= -1 then
                                        v1952 = v1954;
                                        local v1955, v1956 = v1924(v1925, v1926, v1939, v1950, v1942, v1941, v1930);
                                        if v1955 == nil then
                                            v1952 = -1;
                                        end;
                                        if v1956 then
                                            l_v1780_0 = v1885(v1955, v1939);
                                            break;
                                        end;
                                    end;
                                    if v1953 ~= -1 then
                                        v1953 = v1954;
                                        local v1957, v1958 = v1924(v1925, v1926, v1939, v1951, v1943, v1941, v1930);
                                        if v1957 == nil then
                                            v1953 = -1;
                                        end;
                                        if v1958 then
                                            l_v1780_0 = v1885(v1957, v1939);
                                            break;
                                        end;
                                    end;
                                end;
                                v1925.view_angles.y = v1944.y;
                                v1925.forwardmove = l_forwardmove_0;
                                v1925.sidemove = l_sidemove_0;
                                v1925.in_duck = l_in_duck_0;
                                v1925.in_jump = v1945;
                                v1925.in_speed = l_in_speed_0;
                                return l_v1780_0 ~= nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1967(v1960, v1961, v1962)
        local v1963 = v1962 - v1961:get_origin();
        local v1964 = v1963:length2dsqr();
        if v1964 < 25 then
            local l_m_vecVelocity_1 = v1961.m_vecVelocity;
            local v1966 = l_m_vecVelocity_1:length();
            v1960.move_yaw = l_m_vecVelocity_1:angles().y;
            v1960.forwardmove = -v1966;
            v1960.sidemove = 0;
            return true, v1964;
        else
            v1960.move_yaw = v1963:angles().y;
            v1960.forwardmove = 450;
            v1960.sidemove = 0;
            return false, v1964;
        end;
    end;
    local function v1969(v1968)
        v1968.in_duck = false;
        v1968.in_jump = false;
        v1968.in_speed = false;
        v1968.in_forward = true;
        v1968.in_back = false;
        v1968.in_moveleft = false;
        v1968.in_moveright = false;
    end;
    local function v1989(v1970, v1971, v1972, v1973)
        -- upvalues: v1881 (ref), v1959 (ref), l_v1780_0 (ref), v1835 (ref), l_v1782_0 (ref), v1839 (ref), v1967 (ref), l_v1183_3 (ref), v1969 (ref), v1815 (ref), v45 (ref), l_v1785_0 (ref), v25 (ref), v1810 (ref)
        local v1974 = v1881(v1971, v1972, v1973);
        local v1975 = v1959(v1970, v1971, v1972);
        if l_v1780_0 == nil then
            return;
        else
            if v1835() < l_v1780_0.simtime then
                v1975 = false;
            end;
            if v1973.weapon_type == 5 and not v1971.m_bIsScoped then
                v1975 = false;
            end;
            if l_v1780_0.retreat <= 0 and v1975 then
                local l_ctx_1 = l_v1780_0.ctx;
                if l_v1782_0 == nil then
                    local v1977 = v1971:get_origin();
                    local v1978 = l_ctx_1.origin - v1977;
                    v1978:normalize();
                    local v1979 = l_ctx_1.origin - v1978 * v1839();
                    l_v1782_0 = utils.trace_hull(v1977, v1979, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, v1971, 33636363, 0).end_pos;
                end;
                local v1980, _ = v1967(v1970, v1971, l_ctx_1.origin);
                local v1982 = l_v1183_3.color:get();
                v1969(v1970);
                v1815();
                l_v1780_0.retreat = 0;
                if v1980 then
                    l_v1780_0.retreat = 1;
                end;
                v45.box_new(l_ctx_1.origin, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, vector(), color(0, 0, 0, 0), v1982, globals.tickinterval * 2);
                return;
            elseif not v1974 then
                l_v1785_0();
                return;
            elseif l_v1780_0.ctx == nil or l_v1780_0.retreat == -1 then
                return;
            else
                l_v1780_0.retreat = l_v1780_0.retreat + 1;
                local v1983, _ = v1967(v1970, v1971, l_v1782_0);
                local v1985 = v1971:get_origin();
                local l_m_vecVelocity_2 = v1971.m_vecVelocity;
                local v1987 = (l_v1782_0 - v1985):angles() - l_m_vecVelocity_2:angles();
                local v1988 = l_m_vecVelocity_2:length2dsqr();
                v1969(v1970);
                v1815();
                if v1988 > 1600 and math.abs(v1987.y) < 20 then
                    rage.exploit:force_teleport();
                    v25.ragebot.main.double_tap[1]:override(false);
                end;
                if v1974 and v1983 then
                    l_v1785_0();
                    v1810();
                end;
                return;
            end;
        end;
    end;
    local function v1995(v1990)
        -- upvalues: v25 (ref), l_v1785_0 (ref), v1810 (ref), v1850 (ref), v1877 (ref), v1989 (ref)
        if not v25.ragebot.main.peek_assist[1]:get() then
            l_v1785_0();
            v1810();
            return;
        else
            local v1991 = entity.get_local_player();
            if v1991 == nil then
                return;
            else
                local v1992 = v1991:get_player_weapon();
                if v1992 == nil then
                    return;
                else
                    local v1993 = v1992:get_weapon_info();
                    if v1993 == nil then
                        return;
                    else
                        local v1994 = v1850(v1992, v1993);
                        if not v1877(v1994) then
                            l_v1785_0();
                            v1810();
                            return;
                        else
                            v1989(v1990, v1991, v1992, v1993);
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local v1996 = v21("smart_peek.on_aim_fire", function()
        -- upvalues: l_v1780_0 (ref), l_v1785_0 (ref)
        if l_v1780_0 == nil then
            return nil;
        else
            l_v1785_0();
            return;
        end;
    end);
    v1995 = v21("smart_peek.on_createmove", v1995);
    local _ = nil;
    local function v2000(v1998)
        -- upvalues: l_v1785_0 (ref), v1810 (ref), v1996 (ref), v1995 (ref)
        local v1999 = v1998:get();
        if not v1999 then
            l_v1785_0();
            v1810();
        end;
        events.aim_fire(v1996, v1999);
        events.createmove(v1995, v1999);
    end;
    l_v1183_3.enabled:set_callback(v2000, true);
end;
v5("ragebot_dormant_aimbot");
v1183 = nil;
v1189 = v151.ragebot.dormant_aimbot;
v1219 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1220 = 5;
l_match_0 = nil;
v1307 = nil;
l_angles_0 = nil;
v1309 = nil;
v1319 = nil;
v1320 = false;
v1321 = false;
v1323 = 1;
v1326 = 0;
v1762 = {
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
v1763 = {
    Stomach = 3, 
    Chest = 2, 
    Head = 1, 
    Legs = 4
};
v1764 = {
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
v1765 = function(v2001, v2002)
    for v2003 = 1, #v2001 do
        if v2001[v2003] == v2002 then
            return true;
        end;
    end;
    return false;
end;
v1766 = function(v2004)
    return v2004 >= 1 and v2004 <= 6;
end;
v1767 = function()
    local v2005 = {};
    local v2006 = entity.get_player_resource();
    for v2007 = 1, globals.max_players do
        local v2008 = entity.get(v2007);
        if v2008 ~= nil and v2006.m_bConnected[v2007] and v2008:is_enemy() and v2008:is_dormant() then
            table.insert(v2005, v2008);
        end;
    end;
    return v2005;
end;
v1768 = function(v2009, v2010, v2011)
    local v2012 = v2009:to(v2010):angles();
    local v2013 = math.rad(v2012.y + 90);
    local v2014 = vector(math.cos(v2013), math.sin(v2013), 0) * v2011;
    return {
        [1] = {
            text = "Middle", 
            vec = v2010
        }, 
        [2] = {
            text = "Left", 
            vec = v2010 + v2014
        }, 
        [3] = {
            text = "Right", 
            vec = v2010 - v2014
        }
    };
end;
v1769 = function(v2015, v2016, v2017, v2018)
    local v2019, v2020 = utils.trace_bullet(v2015, v2016, v2017, v2018);
    if v2020 ~= nil then
        local l_entity_0 = v2020.entity;
        if l_entity_0 == nil then
            return 0, v2020;
        elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
            return 0, v2020;
        end;
    end;
    return v2019, v2020;
end;
do
    local l_v1189_4, l_v1219_3, l_v1220_3, l_l_match_0_3, l_v1307_2, l_l_angles_0_2, l_v1309_1, l_v1319_2, l_v1320_2, l_v1321_4, l_v1323_5, l_v1326_5, l_v1762_0, l_v1763_1, l_v1764_0, l_v1765_1, l_v1766_0, l_v1767_1, l_v1768_1, l_v1769_1, l_v1770_1, l_v1771_0, l_v1772_0, l_v1773_0 = v1189, v1219, v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773;
    l_v1770_1 = function(v2046)
        -- upvalues: l_v1219_3 (ref), l_v1326_5 (ref), l_v1766_0 (ref), l_v1767_1 (ref), l_v1189_4 (ref), l_v1323_5 (ref), v25 (ref), l_v1764_0 (ref), l_v1763_1 (ref), l_v1765_1 (ref), l_v1768_1 (ref), l_v1769_1 (ref), l_l_match_0_3 (ref), l_l_angles_0_2 (ref), l_v1309_1 (ref), l_v1307_2 (ref), l_v1319_2 (ref), l_v1220_3 (ref), l_v1321_4 (ref)
        l_v1219_3:override(false);
        local v2047 = entity.get_local_player();
        if v2047 == nil then
            return;
        else
            local v2048 = v2047:get_player_weapon();
            if v2048 == nil then
                return;
            else
                local v2049 = v2048:get_weapon_info();
                if v2049 == nil then
                    return;
                else
                    local v2050 = v2048:get_inaccuracy();
                    if v2050 == nil then
                        return;
                    else
                        local l_tickcount_2 = globals.tickcount;
                        local v2052 = v2047:get_eye_position();
                        local l_current_0 = v2047:get_simulation_time().current;
                        local v2054 = bit.band(v2047.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_2 < l_v1326_5 then
                            return;
                        elseif v2046.in_jump and not v2054 then
                            return;
                        else
                            local l_weapon_type_3 = v2049.weapon_type;
                            if not l_v1766_0(l_weapon_type_3) or v2048.m_iClip1 <= 0 then
                                return false;
                            else
                                local v2056 = l_v1767_1();
                                local v2057 = l_v1189_4.hitboxes:get();
                                if l_tickcount_2 % #v2056 ~= 0 then
                                    l_v1323_5 = l_v1323_5 + 1;
                                else
                                    l_v1323_5 = 1;
                                end;
                                local v2058 = v2056[l_v1323_5];
                                if v2058 == nil then
                                    return;
                                else
                                    local v2059 = v2058:get_bbox();
                                    local v2060 = v2058:get_origin();
                                    local l_m_flDuckAmount_0 = v2058.m_flDuckAmount;
                                    local v2062 = l_v1189_4.alpha_modifier:get();
                                    local v2063 = l_v1189_4.minimum_damage:get();
                                    if v2063 == 0 then
                                        v2063 = v25.ragebot.selection.min_damage:get();
                                    end;
                                    if v2063 >= 100 then
                                        v2063 = v2063 - 100 + v2058.m_iHealth;
                                    end;
                                    local v2064 = {};
                                    for v2065 = 1, #l_v1764_0 do
                                        local v2066 = l_v1764_0[v2065];
                                        local l_vec_0 = v2066.vec;
                                        local l_scale_0 = v2066.scale;
                                        local l_hitbox_0 = v2066.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #v2057 ~= 0 then
                                            local v2070 = l_v1763_1[l_hitbox_0];
                                            if l_v1765_1(v2057, v2070) then
                                                table.insert(v2064, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v2064, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v2049.is_revolver and not (v2048.m_flNextPrimaryAttack >= l_current_0) or math.max(v2047.m_flNextAttack, v2048.m_flNextPrimaryAttack, v2048.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v2071 = nil;
                                        local v2072 = nil;
                                        if math.floor(v2059.alpha * 100) + 5 <= v2062 then
                                            return;
                                        else
                                            for v2073 = 1, #v2064 do
                                                local v2074 = v2064[v2073];
                                                local v2075 = l_v1768_1(v2052, v2060 + v2074.vec, v2074.scale);
                                                for v2076 = 1, #v2075 do
                                                    local v2077 = v2075[v2076];
                                                    local l_vec_1 = v2077.vec;
                                                    local v2080, v2081 = l_v1769_1(v2047, v2052, l_vec_1, function(v2079)
                                                        -- upvalues: v2058 (ref)
                                                        return v2079 == v2058;
                                                    end);
                                                    if (v2081 == nil or not v2081:is_visible()) and v2080 ~= 0 and v2063 < v2080 then
                                                        v2071 = l_vec_1;
                                                        v2072 = v2080;
                                                        l_l_match_0_3 = v2058;
                                                        l_l_angles_0_2 = v2074.hitbox;
                                                        l_v1309_1 = v2080;
                                                        l_v1307_2 = v2077.text;
                                                        l_v1319_2 = v2059.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v2071 and v2072 then
                                                    break;
                                                end;
                                            end;
                                            if not v2071 or not v2072 then
                                                return;
                                            else
                                                local v2082 = v2052:to(v2071):angles();
                                                v2046.block_movement = 1;
                                                local v2083 = not v2046.in_jump and v2054;
                                                local v2084 = v2047.m_bIsScoped or v2047.m_bResumeZoom;
                                                local v2085 = v2049.weapon_type == l_v1220_3;
                                                if not v2084 and v2085 and v2083 then
                                                    v2046.in_attack2 = true;
                                                end;
                                                if v2050 < 0.01 then
                                                    v2046.view_angles = v2082;
                                                    v2046.in_attack = true;
                                                    l_v1321_4 = true;
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
    l_v1771_0 = function(v2086)
        -- upvalues: l_v1321_4 (ref), l_v1320_2 (ref), l_l_match_0_3 (ref), l_l_angles_0_2 (ref), l_v1309_1 (ref), l_v1307_2 (ref), l_v1319_2 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v2086 (ref), l_v1321_4 (ref), l_v1320_2 (ref), l_l_match_0_3 (ref), l_l_angles_0_2 (ref), l_v1309_1 (ref), l_v1307_2 (ref), l_v1319_2 (ref)
            if entity.get(v2086.userid, true) == entity.get_local_player() then
                if l_v1321_4 and not l_v1320_2 then
                    events.dormant_miss:call({
                        userid = l_l_match_0_3, 
                        aim_hitbox = l_l_angles_0_2, 
                        aim_damage = l_v1309_1, 
                        aim_point = l_v1307_2, 
                        accuracy = l_v1319_2
                    });
                end;
                l_v1320_2 = false;
                l_v1321_4 = false;
                l_l_match_0_3 = nil;
                l_l_angles_0_2 = nil;
                l_v1309_1 = nil;
                l_v1307_2 = nil;
                l_v1319_2 = nil;
            end;
        end);
    end;
    l_v1772_0 = function(v2087)
        -- upvalues: l_v1321_4 (ref), l_v1320_2 (ref), l_v1762_0 (ref), l_v1307_2 (ref), l_l_angles_0_2 (ref), l_v1309_1 (ref)
        local v2088 = entity.get_local_player();
        local v2089 = entity.get(v2087.userid, true);
        local v2090 = entity.get(v2087.attacker, true);
        if v2089 == nil or v2090 ~= v2088 then
            return;
        else
            local v2091 = v2089:get_bbox();
            if v2091 == nil then
                return;
            else
                if v2089:is_dormant() and l_v1321_4 == true then
                    l_v1320_2 = true;
                    events.dormant_hit:call({
                        userid = v2089, 
                        attacker = v2090, 
                        health = v2087.health, 
                        armor = v2087.armor, 
                        weapon = v2087.weapon, 
                        dmg_health = v2087.dmg_health, 
                        dmg_armor = v2087.dmg_armor, 
                        hitgroup = v2087.hitgroup, 
                        accuracy = v2091.alpha, 
                        hitbox = l_v1762_0[v2087.hitgroup], 
                        aim_point = l_v1307_2, 
                        aim_hitbox = l_l_angles_0_2, 
                        aim_damage = l_v1309_1
                    });
                end;
                return;
            end;
        end;
    end;
    l_v1773_0 = v21("dormant_aimbot.on_shutdown", function()
        -- upvalues: l_v1219_3 (ref)
        l_v1219_3:override();
    end);
    l_v1770_1 = v21("dormant_aimbot.on_createmove", l_v1770_1);
    l_v1771_0 = v21("dormant_aimbot.on_weapon_fire", l_v1771_0);
    l_v1772_0 = v21("dormant_aimbot.on_player_hurt", l_v1772_0);
    v1774 = nil;
    v1775 = function(v2092)
        -- upvalues: l_v1219_3 (ref), l_v1773_0 (ref), l_v1770_1 (ref), l_v1771_0 (ref), l_v1772_0 (ref)
        local v2093 = v2092:get();
        if not v2093 then
            l_v1219_3:override();
        end;
        events.shutdown(l_v1773_0, v2093);
        events.createmove(l_v1770_1, v2093);
        events.weapon_fire(l_v1771_0, v2093);
        events.player_hurt(l_v1772_0, v2093);
    end;
    l_v1189_4.enabled:set_callback(v1775, true);
end;
v5("ragebot_aimbot_logs");
v1189 = nil;
v1219 = v151.ragebot.aimbot_logs;
v1220 = v137.load_font("museo500", 16, "a");
l_match_0 = {
    hegrenade = "Naded", 
    knife = "Knifed", 
    inferno = "Burned"
};
v1307 = {
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
l_angles_0 = {};
v1309 = function(v2094, v2095)
    return string.format("\a%s%s\aDEFAULT", v2095, v2094);
end;
do
    local l_v1219_4, l_v1220_4, l_l_match_0_4, l_v1307_3, l_l_angles_0_3, l_v1309_2, l_v1319_3, l_v1320_3, l_v1321_5, l_v1323_6, l_v1326_6, l_v1762_1, l_v1763_2, l_v1764_1, l_v1765_2, l_v1766_1, l_v1767_2, l_v1768_2, l_v1769_2, l_v1770_2, l_v1771_1, l_v1772_1, l_v1773_1, l_v1774_0, l_v1775_1 = v1219, v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773, v1774, v1775;
    l_v1319_3 = function(v2121, v2122)
        -- upvalues: l_v1309_2 (ref)
        local v2123 = v2122.prefix_brackets:sub(1, 1);
        local v2124 = v2122.prefix_brackets:sub(2, 2);
        local v2125 = v2123 .. v2122.prefix .. v2124;
        if v2122.has_prefix_color then
            v2125 = l_v1309_2(v2125, v2121);
        end;
        return v2125;
    end;
    l_v1320_3 = function()
        -- upvalues: l_v1219_4 (ref)
        if not l_v1219_4.customize:get() then
            return color(168, 201, 228, 255);
        else
            return l_v1219_4.render_colors:get("Hit")[1];
        end;
    end;
    l_v1321_5 = function()
        -- upvalues: l_v1219_4 (ref)
        if not l_v1219_4.customize:get() then
            return color(227, 168, 168, 255);
        else
            return l_v1219_4.render_colors:get("Miss")[1];
        end;
    end;
    l_v1323_6 = function(v2126)
        local v2127 = {};
        local v2128 = {};
        local v2129 = 1;
        local v2130 = #v2126;
        local v2131 = false;
        while v2129 <= v2130 do
            local v2132 = v2126:sub(v2129, v2129);
            if v2132 == "\"" then
                v2131 = not v2131;
            end;
            if v2132 == " " and not v2131 then
                if #v2128 > 0 then
                    table.insert(v2127, table.concat(v2128, ""));
                    for v2133 = 1, #v2128 do
                        v2128[v2133] = nil;
                    end;
                end;
            else
                table.insert(v2128, v2132);
            end;
            v2129 = v2129 + 1;
        end;
        if next(v2128) ~= nil then
            table.insert(v2127, table.concat(v2128, ""));
        end;
        return v2127;
    end;
    l_v1326_6 = function(v2134)
        -- upvalues: l_v1323_6 (ref)
        local v2135 = {
            backtrack_ms = false, 
            has_prefix_color = true, 
            prefix = "frost", 
            prefix_brackets = "[]", 
            has_color_in_hitchance = true, 
            has_spread_in_events = false, 
            has_hitchance = true, 
            has_history = true, 
            has_mismatch = true, 
            has_brackets = true, 
            has_percentage = true, 
            has_prefix = true, 
            has_color = true, 
            spread_limiter = ": ", 
            backtrack_limiter = ": ", 
            hitchance_limiter = ": ", 
            damage_limiter = ": ", 
            hitchance_name = "hc", 
            backtrack_name = "backtrack", 
            hit_name = "Hit", 
            brackets = "()"
        };
        local v2136 = l_v1323_6(v2134);
        for v2137 = 1, #v2136 do
            local v2138 = v2136[v2137];
            local v2139 = v2138:match("^pr=\"([^\"]+)\"");
            local v2140 = v2138:match("^hit=\"([^\"]+)\"");
            local v2141 = v2138:match("^backtrack=\"([^\"]+)\"");
            local v2142 = v2138:match("^hitchance=\"([^\"]+)\"");
            local v2143 = v2138:match("^limiter=\"([^\"]+)\"");
            if v2138 == "prbr=()" then
                v2135.prefix_brackets = "()";
            end;
            if v2139 ~= nil then
                v2135.prefix = v2139;
            end;
            if v2140 ~= nil then
                v2135.hit_name = v2140;
            end;
            if v2141 ~= nil then
                v2135.backtrack_name = v2141;
            end;
            if v2142 ~= nil then
                v2135.hitchance_name = v2142;
            end;
            if v2143 ~= nil then
                v2135.damage_limiter = v2143;
                v2135.hitchance_limiter = v2143;
                v2135.backtrack_limiter = v2143;
                v2135.spread_limiter = v2143;
            end;
            if v2138 == "rprc" then
                v2135.has_prefix_color = false;
            end;
            if v2138 == "rc" then
                v2135.has_color = false;
            end;
            if v2138 == "rp" then
                v2135.has_prefix = false;
            end;
            if v2138 == "rb" then
                v2135.has_brackets = false;
            end;
            if v2138 == "rm" then
                v2135.has_mismatch = false;
            end;
            if v2138 == "rch" then
                v2135.has_color_in_hitchance = false;
            end;
            if v2138 == "rhc" then
                v2135.has_hitchance = false;
            end;
            if v2138 == "rbt" then
                v2135.has_history = false;
            end;
            if v2138 == "btms" then
                v2135.backtrack_ms = true;
            end;
            if v2138 == "spr" then
                v2135.has_spread_in_events = true;
            end;
        end;
        return v2135;
    end;
    l_v1762_1 = function(v2144, v2145, v2146)
        -- upvalues: l_v1309_2 (ref), l_v1319_3 (ref)
        local v2147 = {};
        local v2148 = " ";
        local v2149 = "";
        local v2150 = " ";
        local l_name_1 = v2145.name;
        local l_damage_1 = v2145.damage;
        local l_hitgroup_0 = v2145.hitgroup;
        local l_hitchance_0 = v2145.hitchance;
        local v2155 = string.format("%d", v2145.backtrack);
        if v2144.backtrack_ms then
            v2155 = string.format("%dms", to_time(v2145.backtrack) * 1000);
        end;
        if v2144.has_color then
            l_name_1 = l_v1309_2(l_name_1, v2146);
            l_damage_1 = l_v1309_2(l_damage_1, v2146);
            l_hitgroup_0 = l_v1309_2(l_hitgroup_0, v2146);
            if v2144.has_color_in_hitchance then
                l_hitchance_0 = l_v1309_2(l_hitchance_0, v2146);
            end;
            v2155 = l_v1309_2(v2155, v2146);
            v2150 = l_v1309_2(v2150, v2146);
        end;
        if v2144.has_percentage then
            local v2156 = "%";
            if v2144.has_color then
                v2156 = l_v1309_2(v2156, v2146);
            end;
            l_hitchance_0 = l_hitchance_0 .. v2156;
        end;
        if v2144.has_brackets and #v2144.brackets > 1 then
            v2148 = v2144.brackets:sub(1, 1);
            v2149 = v2144.brackets:sub(2, 2);
        end;
        if v2144.has_mismatch and v2145.hitgroup ~= v2145.wanted_hitgroup then
            local l_hitgroup_1 = v2145.hitgroup;
            local l_wanted_hitgroup_0 = v2145.wanted_hitgroup;
            if v2144.has_color then
                l_hitgroup_1 = l_v1309_2(l_hitgroup_1, v2146);
                l_wanted_hitgroup_0 = l_v1309_2(l_wanted_hitgroup_0, v2146);
            end;
            l_hitgroup_0 = l_hitgroup_1 .. v2148 .. l_wanted_hitgroup_0 .. v2149;
        end;
        table.insert(v2147, string.format("%s %s in the %s", v2144.hit_name, l_name_1, l_hitgroup_0));
        local l_backtrack_name_0 = v2144.backtrack_name;
        if v2144.has_hitchance then
            table.insert(v2147, string.format("(%s%s%s)", v2144.hitchance_name, v2144.hitchance_limiter, l_hitchance_0));
        end;
        table.insert(v2147, string.format("(%s%s%s)", "damage", v2144.damage_limiter, l_damage_1));
        if v2144.has_history then
            table.insert(v2147, string.format("(%s%s%s)", l_backtrack_name_0, v2144.backtrack_limiter, v2155));
        end;
        if v2145.spread ~= nil then
            local v2160 = string.format("%.2f\194\176", v2145.spread);
            if v2144.has_color then
                v2160 = l_v1309_2(v2160, v2146);
            end;
            table.insert(v2147, string.format("(spread%s%s)", v2144.spread_limiter, v2160));
        end;
        local v2161 = table.concat(v2147, v2150);
        if v2144.has_prefix then
            local v2162 = l_v1319_3(v2146, v2144);
            v2161 = string.format("%s %s", v2162, v2161);
        end;
        return v2161;
    end;
    l_v1763_2 = function(v2163, v2164, v2165)
        -- upvalues: l_v1309_2 (ref), l_v1319_3 (ref)
        local v2166 = {};
        local v2167 = "";
        local v2168 = "";
        local v2169 = " ";
        local l_name_2 = v2164.name;
        local l_damage_2 = v2164.damage;
        local l_reason_0 = v2164.reason;
        local l_hitgroup_2 = v2164.hitgroup;
        local l_hitchance_1 = v2164.hitchance;
        local v2175 = string.format("%d", v2164.backtrack);
        if v2163.has_brackets and #v2163.brackets > 1 then
            v2167 = v2163.brackets:sub(1, 1);
            v2168 = v2163.brackets:sub(2, 2);
        end;
        if v2163.backtrack_ms then
            v2175 = string.format("%dms", to_time(v2164.backtrack) * 1000);
        end;
        if v2163.has_color then
            l_name_2 = l_v1309_2(l_name_2, v2165);
            l_damage_2 = l_v1309_2(l_damage_2, v2165);
            l_reason_0 = l_v1309_2(l_reason_0, v2165);
            l_hitgroup_2 = l_v1309_2(l_hitgroup_2, v2165);
            if v2163.has_color_in_hitchance then
                l_hitchance_1 = l_v1309_2(l_hitchance_1, v2165);
            end;
            v2175 = l_v1309_2(v2175, v2165);
            v2169 = l_v1309_2(v2169, v2165);
        end;
        if v2163.has_percentage then
            local v2176 = "%";
            if v2163.has_color then
                v2176 = l_v1309_2(v2176, v2165);
            end;
            l_hitchance_1 = l_hitchance_1 .. v2176;
        end;
        table.insert(v2166, string.format("Missed %s in the %s due to %s", l_name_2, l_hitgroup_2, l_reason_0));
        local l_backtrack_name_1 = v2163.backtrack_name;
        if v2163.has_hitchance then
            table.insert(v2166, string.format("(%s%s%s)", v2163.hitchance_name, v2163.hitchance_limiter, l_hitchance_1));
        end;
        table.insert(v2166, string.format("(%s%s%s)", "damage", v2163.damage_limiter, l_damage_2));
        if v2163.has_history then
            table.insert(v2166, string.format("(%s%s%s)", l_backtrack_name_1, v2163.backtrack_limiter, v2175));
        end;
        if v2164.spread ~= nil then
            local v2178 = string.format("%.2f\194\176", v2164.spread);
            if v2163.has_color then
                v2178 = l_v1309_2(v2178, v2165);
            end;
            table.insert(v2166, string.format("(%s%s%s)", "spread", v2163.spread_limiter, v2178));
        end;
        local v2179 = table.concat(v2166, v2169);
        if v2163.has_prefix then
            local v2180 = l_v1319_3(v2165, v2163);
            v2179 = string.format("%s %s", v2180, v2179);
        end;
        return v2179;
    end;
    l_v1764_1 = function(v2181, v2182, v2183)
        -- upvalues: l_v1309_2 (ref), l_v1319_3 (ref)
        local v2184 = {};
        local v2185 = " ~ ";
        local l_name_3 = v2182.name;
        local l_damage_3 = v2182.damage;
        local l_action_0 = v2182.action;
        if v2181.has_color then
            l_name_3 = l_v1309_2(l_name_3, v2183);
            l_damage_3 = l_v1309_2(l_damage_3, v2183);
            v2185 = l_v1309_2(v2185, v2183);
        end;
        table.insert(v2184, string.format("%s %s for %s damage", l_action_0, l_name_3, l_damage_3));
        local v2189 = table.concat(v2184, v2185);
        if v2181.has_prefix then
            local v2190 = l_v1319_3(v2183, v2181);
            v2189 = string.format("%s %s", v2190, v2189);
        end;
        return v2189;
    end;
    l_v1765_2 = function()
        -- upvalues: l_l_angles_0_3 (ref)
        for v2191 = 1, #l_l_angles_0_3 do
            l_l_angles_0_3[v2191] = nil;
        end;
    end;
    l_v1766_1 = function(v2192, v2193, v2194)
        return {
            type = v2192, 
            text = v2193, 
            color = v2194, 
            alpha = 0, 
            liferemaining = 4
        };
    end;
    l_v1767_2 = function(v2195, v2196, v2197)
        -- upvalues: l_v1766_1 (ref), l_l_angles_0_3 (ref)
        local v2198 = l_v1766_1(v2195, v2196, v2197);
        table.insert(l_l_angles_0_3, v2198);
        if #l_l_angles_0_3 > 6 then
            table.remove(l_l_angles_0_3, 1);
        end;
    end;
    l_v1768_2 = function()
        -- upvalues: l_v1219_4 (ref)
        if l_v1219_4.customize:get() then
            return l_v1219_4.padding:get();
        else
            return 6;
        end;
    end;
    l_v1769_2 = function(v2199, v2200)
        -- upvalues: l_v1219_4 (ref), l_v1768_2 (ref)
        if l_v1219_4.customize:get() and l_v1219_4.radius:get() == "Semi-circle" then
            return math.abs(v2200.y - v2199.y) / 2;
        else
            return l_v1768_2() + 2;
        end;
    end;
    l_v1770_2 = function(v2201, v2202, v2203, v2204)
        -- upvalues: l_v1769_2 (ref), v137 (ref)
        local v2205 = v2203:clone();
        local v2206 = l_v1769_2(v2201, v2202);
        v2205.r = v2205.r * 0.1;
        v2205.g = v2205.g * 0.1;
        v2205.b = v2205.b * 0.1;
        v2205.a = 80 * v2204;
        v137.blur(v2201, v2202, 1.8, v2204, v2206);
        v137.rect(v2201, v2202, v2205, v2206);
    end;
    l_v1771_1 = function()
        -- upvalues: l_v1768_2 (ref), l_v1220_4 (ref), v137 (ref), v24 (ref), l_v1219_4 (ref), l_l_angles_0_3 (ref), l_play_0 (ref), v22 (ref), l_v1320_3 (ref), l_v1309_2 (ref), l_v1766_1 (ref), l_v1321_5 (ref), l_v1770_2 (ref)
        local v2207 = 6;
        local v2208 = l_v1768_2() + 4;
        local v2209 = l_v1768_2();
        local l_l_v1220_4_0 = l_v1220_4;
        local v2211 = "";
        local l_frametime_2 = globals.frametime;
        local v2213 = v137.screen_size();
        local v2214 = vector(v2213.x * 0.5, v24.lerp(v2213.y * 0.5 + 50, v2213.y - 200, l_v1219_4.offset_y:get() * 0.01));
        local v2215 = {};
        for v2216 = #l_l_angles_0_3, 1, -1 do
            local v2217 = l_l_angles_0_3[v2216];
            v2217.liferemaining = v2217.liferemaining - l_frametime_2;
            if v2217.liferemaining <= 0 then
                v2217.alpha = l_play_0.interp(v2217.alpha, 0, 0.075);
                if v2217.alpha <= 0 then
                    table.remove(l_l_angles_0_3, v2216);
                end;
            else
                v2217.alpha = l_play_0.interp(v2217.alpha, 1, 0.075);
            end;
        end;
        for v2218 = 1, #l_l_angles_0_3 do
            table.insert(v2215, l_l_angles_0_3[v2218]);
        end;
        local v2219 = ui.get_alpha();
        if v2219 > 0 and next(v2215) == nil then
            local l_user_0 = v22.user;
            local v2221 = 89;
            local v2222 = "stomach";
            local v2223 = 285;
            local v2224 = "head";
            local v2225 = "spread";
            local _ = nil;
            local v2227 = l_v1320_3();
            local v2228 = v2227:clone();
            v2228.a = v2228.a * 0.5;
            local v2229 = v2227:to_hex();
            local v2230 = v2228:to_hex();
            local v2231 = l_v1309_2(l_user_0, v2229);
            local v2232 = l_v1309_2(v2221, v2229);
            local v2233 = l_v1309_2(v2222, v2229);
            if v2221 ~= v2223 then
                v2232 = string.format("%s(%s)", l_v1309_2(v2221, v2229), l_v1309_2(v2223, v2230));
            end;
            if v2222 ~= v2224 then
                v2233 = string.format("%s(%s)", l_v1309_2(v2222, v2229), l_v1309_2(v2224, v2230));
            end;
            local v2234 = string.format("%s's %s for %s dmg", v2231, v2233, v2232);
            local v2235 = l_v1766_1("hit", v2234, v2227);
            v2235.alpha = v2219;
            table.insert(v2215, v2235);
            v2227 = nil;
            v2228 = l_v1321_5();
            v2229 = v2228:to_hex();
            v2230 = l_v1309_2(l_user_0, v2229);
            v2231 = l_v1309_2(v2222, v2229);
            v2232 = l_v1309_2(v2225, v2229);
            v2233 = string.format("%s's %s due to %s", v2230, v2231, v2232);
            v2234 = l_v1766_1("miss", v2233, v2228);
            v2234.alpha = v2219;
            table.insert(v2215, v2234);
        end;
        for v2236 = 1, #v2215 do
            local v2237 = v2215[v2236];
            local l_text_0 = v2237.text;
            local l_color_0 = v2237.color;
            local l_alpha_0 = v2237.alpha;
            local l_type_0 = v2237.type;
            local v2242 = v137.measure_text(l_l_v1220_4_0, v2211, l_type_0);
            local v2243 = v137.measure_text(l_l_v1220_4_0, v2211, l_text_0);
            local v2244 = vector(v2242.x + v2207 + 1 + v2207 + v2243.x, math.max(v2242.y, v2243.y)) + vector(v2208 * 2, v2209 * 2);
            local v2245 = v2214 - v2244 * 0.5;
            local v2246 = v2245 + vector(v2208, v2209);
            local v2247 = l_color_0:clone();
            v2247.a = v2247.a * l_alpha_0;
            l_v1770_2(v2245, v2245 + v2244, l_color_0, l_alpha_0);
            v137.text(l_l_v1220_4_0, v2246, v2247, v2211, l_type_0);
            v2246.x = v2246.x + v2242.x + v2207;
            v137.rect(v2246, v2246 + vector(1, v2243.y), color(255, 255, 255, 50 * l_alpha_0));
            v2246.x = v2246.x + 1 + v2207;
            v137.text(l_l_v1220_4_0, v2246, color(255, 255, 255, 255 * l_alpha_0), v2211, l_text_0);
            v2214.y = v2214.y - (v2244.y + 8) * l_alpha_0;
        end;
    end;
    l_v1772_1 = function(v2248)
        -- upvalues: l_v1307_3 (ref), l_v1219_4 (ref), l_v1326_6 (ref), l_v1762_1 (ref), l_v1320_3 (ref), l_v1309_2 (ref), l_v1767_2 (ref)
        local l_target_1 = v2248.target;
        if l_target_1 == nil then
            return;
        else
            local v2250 = l_target_1:get_name();
            local v2251 = v2248.hitchance or 0;
            local v2252 = v2248.backtrack or 0;
            local v2253 = v2248.damage or 0;
            local v2254 = l_v1307_3[v2248.hitgroup] or "?";
            local v2255 = v2248.wanted_damage or 0;
            local v2256 = l_v1307_3[v2248.wanted_hitgroup] or "?";
            local v2257 = l_v1219_4.default_colors:get("Hit")[1];
            if l_v1219_4.output:get("Console") then
                local v2258 = v2257:to_hex();
                local v2259 = nil;
                local v2260 = {
                    name = v2250, 
                    damage = v2253, 
                    wanted_damage = v2255, 
                    hitgroup = v2254, 
                    wanted_hitgroup = v2256, 
                    hitchance = v2251, 
                    backtrack = v2252
                };
                if v2248.spread ~= nil then
                    v2260.spread = v2248.spread;
                end;
                local v2261 = l_v1326_6(l_v1219_4.custom_prefix:get());
                v2259 = l_v1762_1(v2261, v2260, v2258);
                print_raw(v2259);
            end;
            if l_v1219_4.output:get("Events") then
                local v2262 = v2257:to_hex();
                local v2263 = nil;
                local v2264 = {
                    name = v2250, 
                    damage = v2253, 
                    wanted_damage = v2255, 
                    hitgroup = v2254, 
                    wanted_hitgroup = v2256, 
                    hitchance = v2251, 
                    backtrack = v2252
                };
                local v2265 = l_v1326_6(l_v1219_4.custom_prefix:get());
                if v2265.has_spread_in_events and v2248.spread ~= nil then
                    v2264.spread = v2248.spread;
                end;
                v2263 = l_v1762_1(v2265, v2264, v2262);
                print_dev(v2263);
            end;
            if l_v1219_4.output:get("Render") then
                local v2266 = l_v1320_3();
                local v2267 = v2266:clone();
                v2267.a = v2267.a * 0.5;
                local v2268 = v2266:to_hex();
                local v2269 = v2267:to_hex();
                local v2270 = l_v1309_2(v2250, v2268);
                local v2271 = l_v1309_2(v2253, v2268);
                local v2272 = l_v1309_2(v2254, v2268);
                if v2253 ~= v2255 then
                    v2271 = string.format("%s(%s)", l_v1309_2(v2253, v2268), l_v1309_2(v2255, v2269));
                end;
                if v2254 ~= v2256 then
                    v2272 = string.format("%s(%s)", l_v1309_2(v2254, v2268), l_v1309_2(v2256, v2269));
                end;
                local v2273 = string.format("%s's %s for %s dmg", v2270, v2272, v2271);
                l_v1767_2("hit", v2273, v2266);
            end;
            return;
        end;
    end;
    l_v1773_1 = function(v2274)
        -- upvalues: l_v1307_3 (ref), l_v1219_4 (ref), l_v1326_6 (ref), l_v1763_2 (ref), l_v1321_5 (ref), l_v1309_2 (ref), l_v1767_2 (ref)
        local l_target_2 = v2274.target;
        if l_target_2 == nil then
            return;
        else
            local v2276 = l_target_2:get_name();
            local v2277 = v2274.hitchance or 0;
            local v2278 = v2274.backtrack or 0;
            local v2279 = v2274.state or "?";
            local v2280 = v2274.wanted_damage or 0;
            local v2281 = l_v1307_3[v2274.wanted_hitgroup] or "?";
            local v2282 = l_v1219_4.default_colors:get("Miss")[1];
            if l_v1219_4.output:get("Console") then
                local v2283 = v2282:to_hex();
                local v2284 = nil;
                local v2285 = {
                    name = v2276, 
                    damage = v2280, 
                    reason = v2279, 
                    hitgroup = v2281, 
                    hitchance = v2277, 
                    backtrack = v2278
                };
                if v2274.spread ~= nil then
                    v2285.spread = v2274.spread;
                end;
                local v2286 = l_v1326_6(l_v1219_4.custom_prefix:get());
                v2284 = l_v1763_2(v2286, v2285, v2283);
                print_raw(v2284);
            end;
            if l_v1219_4.output:get("Events") then
                local v2287 = v2282:to_hex();
                local v2288 = nil;
                local v2289 = {
                    name = v2276, 
                    damage = v2280, 
                    reason = v2279, 
                    hitgroup = v2281, 
                    hitchance = v2277, 
                    backtrack = v2278
                };
                local v2290 = l_v1326_6(l_v1219_4.custom_prefix:get());
                if v2290.has_spread_in_events and v2274.spread ~= nil then
                    v2289.spread = v2274.spread;
                end;
                v2288 = l_v1763_2(v2290, v2289, v2287);
                print_dev(v2288);
            end;
            if l_v1219_4.output:get("Render") then
                local v2291 = l_v1321_5();
                local v2292 = v2291:to_hex();
                local v2293 = l_v1309_2(v2276, v2292);
                local v2294 = l_v1309_2(v2281, v2292);
                local v2295 = l_v1309_2(v2279, v2292);
                local v2296 = string.format("%s's %s due to %s", v2293, v2294, v2295);
                l_v1767_2("miss", v2296, v2291);
            end;
            return;
        end;
    end;
    l_v1774_0 = function(v2297)
        -- upvalues: l_v1772_1 (ref), l_v1773_1 (ref)
        if v2297.state == nil then
            l_v1772_1(v2297);
        else
            l_v1773_1(v2297);
        end;
    end;
    l_v1775_1 = function(v2298)
        -- upvalues: l_l_match_0_4 (ref), l_v1219_4 (ref), l_v1326_6 (ref), l_v1764_1 (ref), l_v1320_3 (ref), l_v1309_2 (ref), l_v1767_2 (ref)
        local v2299 = entity.get_local_player();
        local v2300 = entity.get(v2298.userid, true);
        local v2301 = entity.get(v2298.attacker, true);
        if v2299 == v2300 or v2299 ~= v2301 then
            return;
        else
            local v2302 = l_l_match_0_4[v2298.weapon];
            if v2302 == nil then
                return;
            else
                local l_dmg_health_0 = v2298.dmg_health;
                local v2304 = v2300:get_name();
                local v2305 = l_v1219_4.default_colors:get("Hit")[1]:to_hex();
                if l_v1219_4.output:get("Console") then
                    local v2306 = {
                        name = v2304, 
                        damage = l_dmg_health_0, 
                        action = v2302
                    };
                    local v2307 = l_v1326_6(l_v1219_4.custom_prefix:get());
                    local v2308 = l_v1764_1(v2307, v2306, v2305);
                    print_raw(v2308);
                end;
                if l_v1219_4.output:get("Events") then
                    local v2309 = {
                        name = v2304, 
                        damage = l_dmg_health_0, 
                        action = v2302
                    };
                    local v2310 = l_v1326_6(l_v1219_4.custom_prefix:get());
                    local v2311 = l_v1764_1(v2310, v2309, v2305);
                    print_dev(v2311);
                end;
                if l_v1219_4.output:get("Render") then
                    local v2312 = l_v1320_3();
                    local v2313 = v2312:to_hex();
                    local v2314 = l_v1309_2(v2304, v2313);
                    local v2315 = l_v1309_2(l_dmg_health_0, v2313);
                    local v2316 = string.format("%s %s for %s dmg", v2302, v2314, v2315);
                    l_v1767_2("hit", v2316, v2312);
                end;
                return;
            end;
        end;
    end;
    l_v1771_1 = v21("ragebot_hitchance_modifier.on_render", l_v1771_1);
    l_v1774_0 = v21("ragebot_hitchance_modifier.on_aim_ack", l_v1774_0);
    l_v1775_1 = v21("ragebot_hitchance_modifier.on_player_hurt", l_v1775_1);
    v1776 = nil;
    v1777 = function(v2317)
        -- upvalues: l_v1765_2 (ref), l_v1771_1 (ref)
        local v2318 = v2317:get("Render");
        if not v2318 then
            l_v1765_2();
        end;
        events.render(l_v1771_1, v2318);
    end;
    do
        local l_v1777_1 = v1777;
        v1778 = function(v2320)
            -- upvalues: l_v1765_2 (ref), l_v1771_1 (ref), l_v1219_4 (ref), l_v1777_1 (ref), l_v1774_0 (ref), l_v1775_1 (ref)
            local v2321 = v2320:get();
            if not v2321 then
                l_v1765_2();
                events.render(l_v1771_1, false);
            end;
            if v2321 then
                l_v1219_4.output:set_callback(l_v1777_1, true);
            else
                l_v1219_4.output:unset_callback(l_v1777_1);
            end;
            events.aim_ack(l_v1774_0, v2321);
            events.player_hurt(l_v1775_1, v2321);
        end;
        l_v1219_4.enabled:set_callback(v1778, true);
    end;
end;
v5("ragebot_hitchance_modifier");
v1219 = nil;
v1220 = v151.ragebot.hitchance_modifier;
l_match_0 = v148.hitchance;
v1307 = 40;
l_angles_0 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v1309 = {};
for v2322 = 1, #v1220.list do
    v1326 = v1220.list[v2322];
    v1309[v1326] = {
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", v1326, "Hit Chance"), 
        auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", v1326, "Auto Scope")
    };
end;
do
    local l_v1220_5, l_l_match_0_5, l_l_angles_0_4, l_v1309_3, l_v1319_4, l_v1320_4, l_v1321_6, l_v1323_7, l_v1326_7, l_v1762_2, l_v1763_3 = v1220, l_match_0, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762, v1763;
    l_v1319_4 = function()
        -- upvalues: l_l_angles_0_4 (ref)
        local v2334 = ui.get_binds(true);
        for v2335 = 1, #v2334 do
            local v2336 = v2334[v2335];
            local l_value_0 = v2336.value;
            local l_reference_0 = v2336.reference;
            if l_reference_0:get() == l_value_0 and l_reference_0:id() == l_l_angles_0_4:id() then
                return true;
            end;
        end;
        return false;
    end;
    l_v1320_4 = function(v2339, v2340, v2341)
        -- upvalues: v24 (ref)
        if v2339.m_bIsScoped or v2340 == nil then
            return false;
        elseif v2341 == 1001 then
            return true;
        else
            local v2342 = v2339:get_origin();
            local v2343 = v2340:get_origin() - v2342;
            return v24.to_foot(v2343:length()) <= v2341 * 0.1;
        end;
    end;
    l_v1321_6 = function(v2344)
        local v2345 = v2344:get_weapon_index();
        local l_weapon_type_4 = v2344:get_weapon_info().weapon_type;
        if l_weapon_type_4 == 1 then
            if v2345 == 1 then
                return "Desert Eagle";
            elseif v2345 == 64 then
                return "R8 Revolver";
            end;
        end;
        if l_weapon_type_4 == 5 then
            if v2345 == 9 then
                return "AWP";
            elseif v2345 == 40 then
                return "SSG-08";
            else
                return "AutoSnipers";
            end;
        else
            return nil;
        end;
    end;
    l_v1323_7 = function()
        -- upvalues: l_v1220_5 (ref), l_v1309_3 (ref)
        for v2347 = 1, #l_v1220_5.list do
            local v2348 = l_v1309_3[l_v1220_5.list[v2347]];
            if v2348 ~= nil then
                v2348.hitchance:override();
                v2348.auto_scope:override();
            end;
        end;
    end;
    l_v1326_7 = function()
        -- upvalues: l_v1319_4 (ref), l_v1321_6 (ref), l_v1309_3 (ref), l_v1220_5 (ref), v152 (ref), l_v1320_4 (ref), l_l_match_0_5 (ref)
        if l_v1319_4() then
            return;
        else
            local v2349 = entity.get_local_player();
            if v2349 == nil then
                return;
            else
                local v2350 = v2349:get_player_weapon();
                if v2350 == nil then
                    return;
                else
                    local v2351 = l_v1321_6(v2350);
                    if v2351 == nil then
                        return;
                    else
                        local v2352 = l_v1309_3[v2351];
                        if v2352 == nil then
                            return;
                        else
                            local v2353 = l_v1220_5[v2351];
                            if v2353 == nil then
                                return;
                            else
                                local v2354 = nil;
                                local v2355 = v2353["In Air"];
                                local v2356 = v2353["No Scope"];
                                if v2355 ~= nil and v2355.enabled:get() then
                                    local v2357 = v2355.value:get();
                                    if v2357 ~= -1 and not v152.is_onground then
                                        v2354 = v2357;
                                    end;
                                end;
                                if v2356 ~= nil and v2356.enabled:get() then
                                    local v2358 = entity.get_threat();
                                    local v2359 = v2356.value:get();
                                    local v2360 = v2356.distance:get();
                                    if v2359 ~= -1 and l_v1320_4(v2349, v2358, v2360) then
                                        v2354 = v2359;
                                        v2352.auto_scope:override(false);
                                    end;
                                end;
                                if v2354 ~= nil then
                                    v2352.hitchance:override(v2354);
                                    l_l_match_0_5.updated_this_tick = true;
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    l_v1762_2 = function()
        -- upvalues: l_v1323_7 (ref)
        l_v1323_7();
    end;
    l_v1763_3 = function()
        -- upvalues: l_l_match_0_5 (ref), l_v1323_7 (ref), l_v1326_7 (ref)
        l_l_match_0_5.updated_this_tick = false;
        l_v1323_7();
        l_v1326_7();
    end;
    l_v1762_2 = v21("ragebot_hitchance_modifier.on_shutdown", l_v1762_2);
    l_v1763_3 = v21("ragebot_hitchance_modifier.on_createmove", l_v1763_3);
    v1764 = nil;
    v1765 = function(v2361)
        -- upvalues: l_v1323_7 (ref), l_v1762_2 (ref), l_v1763_3 (ref)
        local v2362 = v2361:get();
        if not v2362 then
            l_v1323_7();
        end;
        events.shutdown(l_v1762_2, v2362);
        events.createmove(l_v1763_3, v2362);
    end;
    l_v1220_5.enabled:set_callback(v1765, true);
end;
v5("begin_visuals");
v1182 = nil;
v5("visuals_watermark");
v1183 = nil;
v1189 = v151.visuals.watermark;
do
    local l_v1189_5, l_v1219_5, l_v1220_6, l_l_match_0_6, l_v1307_4, l_l_angles_0_5 = v1189, v1219, v1220, l_match_0, v1307, l_angles_0;
    l_v1219_5 = function()
        -- upvalues: l_v1189_5 (ref), v24 (ref)
        local v2369, v2370 = l_v1189_5.color:get();
        if type(v2370) ~= "table" then
            v2370 = {
                [1] = v2370
            };
        end;
        for v2371 = 1, #v2370 do
            v2370[v2371].a = v24.lerp(50, 255, v2370[v2371].a / 255);
        end;
        return v2369, v2370;
    end;
    l_v1220_6 = {};
    l_l_match_0_6 = string.format("%s.lua", string.lower(v22.name));
    do
        local l_l_l_match_0_6_0 = l_l_match_0_6;
        l_v1220_6.on_render = function()
            -- upvalues: v137 (ref), l_l_l_match_0_6_0 (ref), l_v1219_5 (ref), l_v1189_5 (ref), v147 (ref)
            local v2373 = v137.screen_size();
            local v2374 = vector(v2373.x * 0.5, v2373.y - 8);
            local v2375 = 1;
            local v2376 = "";
            local l_l_l_l_match_0_6_0_0 = l_l_l_match_0_6_0;
            local v2378, v2379 = l_v1219_5();
            if v2378 == "Gradient" then
                local v2380 = globals.realtime * (l_v1189_5.speed:get() * 0.1);
                l_l_l_l_match_0_6_0_0 = v147.gradient(l_l_l_l_match_0_6_0_0, v2380, v2379[1], v2379[2]);
            end;
            local v2381 = v137.measure_text(v2375, v2376, l_l_l_l_match_0_6_0_0);
            v2374.x = v2374.x - v2381.x / 2;
            v2374.y = v2374.y - v2381.y;
            v137.text(v2375, v2374, v2379[1], v2376, l_l_l_l_match_0_6_0_0);
        end;
    end;
    l_l_match_0_6 = {};
    l_v1307_4 = common.get_username();
    l_l_angles_0_5 = string.lower(v22.name);
    v1309 = string.lower(v22.build);
    do
        local l_l_v1307_4_0, l_l_l_angles_0_5_0, l_v1309_4 = l_v1307_4, l_l_angles_0_5, v1309;
        l_l_match_0_6.on_render = function()
            -- upvalues: v137 (ref), l_v1219_5 (ref), l_l_l_angles_0_5_0 (ref), l_v1309_4 (ref), l_l_v1307_4_0 (ref)
            local v2385 = v137.screen_size();
            local v2386 = vector(v2385.x - 8, 8);
            local v2387 = 1;
            local v2388 = "";
            local _, v2390 = l_v1219_5();
            local v2391 = {};
            local v2392 = v2390[1] or color();
            local v2393 = v2390[2] or color();
            local v2394 = string.format("\a%s%s\a%s", v2392:to_hex(), l_l_l_angles_0_5_0, v2393:to_hex());
            table.insert(v2391, string.format("%s ~ %s : username: %s", v2394, l_v1309_4, l_l_v1307_4_0));
            for v2395 = 1, #v2391 do
                local v2396 = v2391[v2395];
                local v2397 = v137.measure_text(v2387, v2388, v2396);
                local v2398 = vector(v2386.x - v2397.x, v2386.y);
                local _ = nil;
                local v2400 = vector(v2398.x, v2398.y + 1);
                local v2401 = v2400 + vector(-8, -2);
                local v2402 = v2400 + v2397 + vector(8, 2);
                local v2403 = (v2401 + v2402) * 0.5;
                local v2404 = color(0, 0, 0, 0);
                local v2405 = color(0, 0, 0, 100);
                v137.gradient(v2401, vector(v2403.x, v2402.y), v2404, v2405, v2404, v2405);
                v137.gradient(v2402, vector(v2403.x, v2401.y), v2404, v2405, v2404, v2405);
                v137.text(v2387, v2398, color(), v2388, v2396);
                v2386.y = v2386.y + v2397.y + 4;
            end;
        end;
    end;
    l_v1307_4 = {};
    l_l_angles_0_5 = 8;
    v1309 = 12;
    v1319 = 1;
    v1320 = 14;
    v1321 = v137.load_font("museo500", 16, "a");
    v1323 = string.format("%s.lua", v22.name:lower());
    v1326 = common.get_username();
    v1762 = 1;
    v1763 = 0;
    v1764 = vector(18, 18);
    v1765 = nil;
    v1766 = string.format("https://en.neverlose.cc/static/avatars/%s.png", v1326);
    v1767 = {};
    do
        local l_l_l_angles_0_5_1, l_v1309_5, l_v1319_5, l_v1320_5, l_v1321_7, l_v1323_8, l_v1326_8, l_v1762_3, l_v1763_4, l_v1764_2, l_v1765_3, l_v1766_2, l_v1767_3, l_v1768_3, l_v1769_3, l_v1770_3, l_v1771_2 = l_l_angles_0_5, v1309, v1319, v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771;
        l_v1768_3 = function(v2423)
            -- upvalues: v137 (ref), l_v1764_2 (ref), l_v1765_3 (ref)
            if v2423 == nil then
                return;
            else
                local v2424 = v137.load_image(v2423, l_v1764_2);
                if v2424 == nil then
                    return;
                else
                    l_v1765_3 = v2424;
                    return;
                end;
            end;
        end;
        network.get(l_v1766_2, l_v1767_3, l_v1768_3);
        l_v1766_2 = nil;
        l_v1767_3 = v137.screen_size();
        l_v1768_3 = vector();
        if l_v1767_3.x ~= 0 and l_v1767_3.y ~= 0 then
            l_v1768_3.x = l_v1767_3.x - 32;
            l_v1768_3.y = 32;
        end;
        l_v1769_3 = vector(0, 0);
        l_v1766_2 = v146.new("new_watermark", l_v1768_3, l_v1769_3, {
            border = {
                [1] = vector(), 
                [2] = l_v1767_3
            }
        });
        l_v1767_3 = function(v2425)
            -- upvalues: l_v1189_5 (ref)
            if l_v1189_5.radius:get() == "Smooth" then
                return l_v1189_5.padding:get() + 2;
            else
                return v2425.y / 2;
            end;
        end;
        l_v1768_3 = function()
            -- upvalues: l_v1762_3 (ref)
            return string.format("%d", 1 / l_v1762_3);
        end;
        l_v1769_3 = function()
            local v2426 = common.get_system_time();
            return string.format("%02d:%02d", v2426.hours, v2426.minutes);
        end;
        l_v1770_3 = function()
            -- upvalues: l_v1763_4 (ref), l_v1762_3 (ref)
            local l_frametime_3 = globals.frametime;
            l_v1763_4 = l_v1763_4 - l_frametime_3;
            if l_v1763_4 <= 0 then
                l_v1763_4 = 1;
                l_v1762_3 = l_frametime_3;
            end;
        end;
        l_v1771_2 = function(v2428, v2429, v2430)
            -- upvalues: v137 (ref)
            if v2428 ~= nil then
                v137.texture(v2428, v2429, v2430, color(), "f");
            else
                v137.rect(v2429, v2429 + v2430, color(20, 20, 20, 255), math.max(v2430.x, v2430.y) / 2);
            end;
        end;
        l_v1307_4.on_render = function()
            -- upvalues: l_v1189_5 (ref), l_v1766_2 (ref), l_v1321_7 (ref), l_v1219_5 (ref), l_v1326_8 (ref), l_v1765_3 (ref), l_v1770_3 (ref), l_v1768_3 (ref), l_v1769_3 (ref), l_v1323_8 (ref), v137 (ref), l_l_l_angles_0_5_1 (ref), v147 (ref), l_v1767_3 (ref), l_v1309_5 (ref), l_v1319_5 (ref), l_v1320_5 (ref), l_v1771_2 (ref)
            local v2431 = l_v1189_5.padding:get();
            local v2432 = l_v1189_5.padding:get() + 4;
            local v2433 = l_v1766_2:get_drag_position();
            local l_l_v1321_7_0 = l_v1321_7;
            local v2435 = "";
            local v2436, v2437 = l_v1219_5();
            local v2438 = v2437[1]:clone();
            v2438.r = v2438.r * 0.1;
            v2438.g = v2438.g * 0.1;
            v2438.b = v2438.b * 0.1;
            v2438.a = 80;
            local v2439 = {};
            if l_v1189_5.display:get("User") then
                table.insert(v2439, {
                    text = l_v1326_8, 
                    texture = l_v1765_3
                });
            end;
            if l_v1189_5.display:get("FPS") then
                l_v1770_3();
                table.insert(v2439, {
                    text = l_v1768_3(), 
                    icon = ui.get_icon("layer-group")
                });
            end;
            if l_v1189_5.display:get("Time") then
                table.insert(v2439, {
                    text = l_v1769_3(), 
                    icon = ui.get_icon("clock")
                });
            end;
            local v2440 = vector();
            local _ = nil;
            local l_l_v1323_8_0 = l_v1323_8;
            local v2443 = ui.get_icon("code");
            local v2444 = v2437[1]:clone();
            v2444.a = 255;
            local v2445 = v137.measure_text(l_l_v1321_7_0, v2435, v2443);
            local v2446 = v137.measure_text(l_l_v1321_7_0, v2435, l_l_v1323_8_0);
            local v2447 = vector(v2445.x + v2446.x + l_l_l_angles_0_5_1, math.max(v2445.y, v2446.y)) + vector(v2432 * 2, v2431 * 2);
            if v2436 == "Gradient" then
                local v2448 = v2437[1] or color();
                local v2449 = v2437[2] or color();
                l_l_v1323_8_0 = v147.gradient(l_l_v1323_8_0, globals.realtime, v2448, v2449);
            end;
            local v2450 = v2433:clone();
            local v2451 = l_v1767_3(v2447);
            v137.blur(v2450, v2450 + v2447, 1.8, 1, v2451);
            v137.rect(v2450, v2450 + v2447, v2438, v2451);
            local v2452 = v2450 + vector(v2432, v2431);
            v137.text(l_l_v1321_7_0, v2452, v2444, v2435, v2443);
            v2452.x = v2452.x + v2445.x + l_l_l_angles_0_5_1;
            v137.text(l_l_v1321_7_0, v2452, v2444, v2435, l_l_v1323_8_0);
            v2440.x = v2440.x + v2447.x;
            v2440.y = math.max(v2440.y, v2447.y);
            v2433.x = v2433.x + v2447.x;
            if next(v2439) ~= nil then
                v2433.x = v2433.x + 10;
                v2440.x = v2440.x + 10;
                l_l_v1323_8_0 = {};
                for v2453 = 1, #v2439 do
                    local v2454 = v2439[v2453];
                    v2447 = {};
                    v2450 = v2454.text;
                    v2451 = v2454.icon;
                    v2452 = v2454.texture;
                    if v2450 ~= nil then
                        v2447.text_size = v137.measure_text(l_l_v1321_7_0, v2435, v2450);
                    end;
                    if v2451 ~= nil then
                        v2447.icon_size = v137.measure_text(l_l_v1321_7_0, v2435, v2451);
                    end;
                    if v2452 ~= nil then
                        v2447.texture_size = vector(v2452.width, v2452.height);
                    end;
                    l_l_v1323_8_0[v2453] = v2447;
                end;
                v2443 = color(255, 255, 255, 255);
                v2444 = color(255, 255, 255, 155);
                v2445 = vector(0, l_v1321_7.height);
                for v2455 = 1, #l_l_v1323_8_0 do
                    if v2455 ~= 1 then
                        v2445.x = v2445.x + l_v1309_5 + l_v1319_5 + l_v1309_5;
                    end;
                    v2451 = 0;
                    v2452 = l_l_v1323_8_0[v2455];
                    if v2452.text_size ~= nil then
                        v2451 = v2451 + 1;
                        v2445.x = v2445.x + v2452.text_size.x;
                    end;
                    if v2452.icon_size ~= nil then
                        v2451 = v2451 + 1;
                        v2445.x = v2445.x + v2452.icon_size.x;
                    end;
                    if v2452.texture_size ~= nil then
                        v2451 = v2451 + 1;
                        v2445.x = v2445.x + v2452.texture_size.x;
                    end;
                    v2445.x = v2445.x + (v2451 - 1) * l_l_l_angles_0_5_1;
                end;
                v2446 = v2445 + vector(v2432 * 2, v2431 * 2);
                local v2456 = v2433:clone();
                v2447 = l_v1767_3(v2446);
                v137.blur(v2456, v2456 + v2446, 1.8, 1, v2447);
                v137.rect(v2456, v2456 + v2446, v2438, v2447);
                v2450 = v2456 + vector(v2432, v2431);
                for v2457 = 1, #v2439 do
                    local v2458 = v2439[v2457];
                    local v2459 = l_l_v1323_8_0[v2457];
                    if v2457 ~= 1 then
                        v2450.x = v2450.x + l_v1309_5;
                        local v2460 = vector(v2450.x, v2456.y + v2446.y / 2 + 1);
                        v137.rect(v2460 + vector(0, -l_v1320_5 / 2), v2460 + vector(l_v1319_5, l_v1320_5 / 2), v2444);
                        v2450.x = v2450.x + l_v1319_5 + l_v1309_5;
                    end;
                    if v2458.texture ~= nil then
                        local v2461 = v2450 + vector(0, (v2445.y - v2459.texture_size.y) / 2);
                        l_v1771_2(v2458.texture, v2461, v2459.texture_size);
                        v2450.x = v2450.x + v2459.texture_size.x + l_l_l_angles_0_5_1;
                    end;
                    if v2458.icon ~= nil then
                        v137.text(l_l_v1321_7_0, v2450, v2444, v2435, v2458.icon);
                        v2450.x = v2450.x + v2459.icon_size.x + l_l_l_angles_0_5_1;
                    end;
                    if v2458.text ~= nil then
                        v137.text(l_l_v1321_7_0, v2450, v2443, v2435, v2458.text);
                        v2450.x = v2450.x + v2459.text_size.x;
                    end;
                end;
                v2440.x = v2440.x + v2446.x;
                v2440.y = math.max(v2440.y, v2446.y);
            end;
            l_v1766_2.size = v2440:clone();
            l_v1766_2();
        end;
    end;
    l_l_angles_0_5 = {};
    v1309 = {
        Console = 3, 
        Bold = 4, 
        Default = 1, 
        Pixel = 2
    };
    v1319 = nil;
    v1320 = v137.screen_size();
    v1321 = vector(v1320.x, 0);
    if v1320.x ~= 0 and v1320.y ~= 0 then
        v1321.x = v1321.x - 35;
        v1321.y = v1321.y + 10;
    end;
    v1323 = vector(0, 12);
    v1319 = v146.new("custom_watermark", v1321, v1323, {
        border = {
            [1] = vector(), 
            [2] = v1320
        }
    });
    v1320 = function(v2462, v2463)
        -- upvalues: l_v1189_5 (ref)
        if not v2463 then
            v2463 = 0;
        end;
        if l_v1189_5.animation:get() == "Encoded" and globals.realtime % 5 < 1 then
            local v2464 = {};
            for v2465 = 1, #v2462 do
                if v2462:sub(v2465, v2465) == " " then
                    table.insert(v2464, " ");
                else
                    local v2466 = math.floor(globals.realtime * 24);
                    table.insert(v2464, string.char(49 + (v2463 + v2465 * 9 + v2466) % 60));
                end;
            end;
            return table.concat(v2464, "");
        else
            return v2462;
        end;
    end;
    do
        local l_v1309_6, l_v1319_6, l_v1320_6, l_v1321_8, l_v1323_9, l_v1326_9, l_v1762_4, l_v1763_5, l_v1764_3 = v1309, v1319, v1320, v1321, v1323, v1326, v1762, v1763, v1764;
        l_v1321_8 = function()
            -- upvalues: l_v1309_6 (ref), l_v1189_5 (ref)
            return l_v1309_6[l_v1189_5.font:get()] or 1;
        end;
        l_v1323_9 = function(v2476, v2477)
            -- upvalues: l_v1189_5 (ref), v147 (ref)
            local v2478, v2479 = l_v1189_5.custom_colors[v2476]:get();
            if v2478 == "Single" then
                v2477 = string.format("\a%s%s", v2479:to_hex(), v2477);
            end;
            if v2478 == "Gradient" then
                v2477 = v147.gradient(v2477, -globals.realtime, v2479[1], v2479[2]);
            end;
            return v2477;
        end;
        l_v1326_9 = function(v2480, v2481, v2482)
            -- upvalues: l_v1189_5 (ref), v137 (ref)
            local v2483 = l_v1189_5.position:get();
            if v2483 == "Custom" then
                return v2480:get_drag_position(), true;
            else
                local v2484 = vector();
                local v2485 = v137.screen_size();
                if v2483 == "Left" then
                    v2484.x = 8;
                    v2484.y = (v2485.y - v2482) / 2;
                end;
                if v2483 == "Bottom" then
                    v2484.x = (v2485.x - v2481) / 2;
                    v2484.y = v2485.y - v2482 - 8;
                end;
                if v2483 == "Right" then
                    v2484.x = v2485.x - v2481 - 8;
                    v2484.y = (v2485.y - v2482) / 2;
                end;
                return v2484, false;
            end;
        end;
        l_v1762_4 = function(v2486)
            local v2487 = {};
            local v2488 = {};
            local v2489 = 1;
            local v2490 = #v2486;
            local v2491 = false;
            while v2489 <= v2490 do
                local v2492 = v2486:sub(v2489, v2489);
                if v2492 == "\"" then
                    v2491 = not v2491;
                end;
                if v2492 == " " and not v2491 then
                    if #v2488 > 0 then
                        table.insert(v2487, table.concat(v2488, ""));
                        for v2493 = 1, #v2488 do
                            v2488[v2493] = nil;
                        end;
                    end;
                else
                    table.insert(v2488, v2492);
                end;
                v2489 = v2489 + 1;
            end;
            if next(v2488) ~= nil then
                table.insert(v2487, table.concat(v2488, ""));
            end;
            return v2487;
        end;
        l_v1763_5 = function(v2494)
            -- upvalues: v22 (ref), l_v1762_4 (ref)
            local v2495 = {
                has_brackets = true, 
                main = "L U A", 
                pre = "F R O S T", 
                has_prefix = true, 
                has_main = true, 
                post = v22.build:upper()
            };
            local v2496 = l_v1762_4(v2494);
            for v2497 = 1, #v2496 do
                local v2498 = v2496[v2497];
                local v2499 = v2498:match("^pre=\"([^\"]+)\"");
                local v2500 = v2498:match("^main=\"([^\"]+)\"");
                local v2501 = v2498:match("^post=\"([^\"]+)\"");
                local v2502 = v2498:match("^pre_icon=\"([^\"]+)\"");
                local v2503 = v2498:match("^post_icon=\"([^\"]+)\"");
                if v2498 == "nobr" then
                    v2495.has_brackets = false;
                end;
                if v2498 == "nomn" then
                    v2495.has_main = false;
                end;
                if v2498 == "nopr" then
                    v2495.has_prefix = false;
                end;
                if v2499 ~= nil then
                    v2495.pre = v2499;
                end;
                if v2500 ~= nil then
                    v2495.main = v2500;
                end;
                if v2501 ~= nil then
                    v2495.post = v2501;
                end;
                if v2502 ~= nil then
                    v2495.pre_icon = v2502;
                end;
                if v2503 ~= nil then
                    v2495.post_icon = v2503;
                end;
            end;
            if v2495.has_main or v2495.has_prefix then
                v2495.pre = v2495.pre .. " ";
            end;
            return v2495;
        end;
        l_v1764_3 = function(v2504)
            -- upvalues: l_v1323_9 (ref), l_v1320_6 (ref)
            local v2505 = {};
            local l_pre_icon_0 = v2504.pre_icon;
            local l_post_icon_0 = v2504.post_icon;
            local l_pre_0 = v2504.pre;
            local l_main_0 = v2504.main;
            local l_post_0 = v2504.post;
            if l_pre_icon_0 ~= nil then
                local v2511 = ui.get_icon(l_pre_icon_0);
                if v2511 ~= nil then
                    table.insert(v2505, "\aDEFAULT" .. v2511 .. " ");
                end;
            end;
            if l_pre_0 ~= nil then
                table.insert(v2505, l_v1323_9("Pre", l_v1320_6(l_pre_0)));
            end;
            if l_main_0 ~= nil and v2504.has_main then
                table.insert(v2505, l_v1323_9("Main", l_v1320_6(l_main_0, 10)));
            end;
            if l_post_0 ~= nil and v2504.has_prefix then
                if v2504.has_brackets then
                    l_post_0 = "[" .. l_v1320_6(l_post_0, 20) .. "]";
                end;
                local v2512 = l_v1323_9("Post", l_post_0);
                if v2504.has_main then
                    v2512 = " " .. v2512;
                end;
                table.insert(v2505, v2512);
            end;
            if l_post_icon_0 ~= nil then
                local v2513 = ui.get_icon(l_post_icon_0);
                if v2513 ~= nil then
                    table.insert(v2505, " " .. "\aDEFAULT" .. v2513);
                end;
            end;
            return table.concat(v2505, "");
        end;
        l_l_angles_0_5.on_render = function()
            -- upvalues: l_v1763_5 (ref), l_v1189_5 (ref), l_v1764_3 (ref), l_v1321_8 (ref), v137 (ref), l_v1319_6 (ref), l_v1326_9 (ref)
            local v2514 = "";
            local v2515 = l_v1763_5(l_v1189_5.text:get());
            local v2516 = l_v1764_3(v2515);
            local v2517 = l_v1321_8();
            if v2517 == 2 then
                v2516 = v2516:upper();
            end;
            local v2518 = v137.measure_text(v2517, v2514, v2516);
            l_v1319_6.size = v2518:clone();
            local v2519, v2520 = l_v1326_9(l_v1319_6, v2518.x, v2518.y);
            v137.text(v2517, v2519, color(), v2514, v2516);
            if not v2520 then
                l_v1319_6:set_position(v2519.x, v2519.y);
            end;
            if v2520 then
                l_v1319_6();
            end;
        end;
    end;
    l_v1220_6.on_render = v21("watemark.default.on_render", l_v1220_6.on_render);
    l_l_match_0_6.on_render = v21("watemark.alternative.on_render", l_l_match_0_6.on_render);
    l_v1307_4.on_render = v21("watemark.new.on_render", l_v1307_4.on_render);
    l_l_angles_0_5.on_render = v21("watemark.custom.on_render", l_l_angles_0_5.on_render);
    v1309 = nil;
    v1319 = function(v2521)
        -- upvalues: l_v1220_6 (ref), l_l_match_0_6 (ref), l_v1307_4 (ref), l_l_angles_0_5 (ref)
        local v2522 = v2521:get();
        events.render(l_v1220_6.on_render, v2522 == "Default");
        events.render(l_l_match_0_6.on_render, v2522 == "Alternative");
        events.render(l_v1307_4.on_render, v2522 == "New");
        events.render(l_l_angles_0_5.on_render, v2522 == "Custom");
    end;
    l_v1189_5.style:set_callback(v1319, true);
end;
v5("visuals_screen_indicators");
v1189 = nil;
v1219 = v151.visuals.screen_indicators;
v1220 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
l_match_0 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1307 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
l_angles_0 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v1309 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v1319 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v1320 = function(v2523)
    local v2524 = v2523:get_override();
    if v2524 ~= nil then
        return v2524;
    else
        return v2523:get();
    end;
end;
v1321 = {};
v1323 = string.format("%s.%s", "FROST", "LUA");
v1326 = {
    [1] = {
        [1] = "\226\157\133", 
        [2] = -7, 
        [3] = 6, 
        [4] = 0.7
    }, 
    [2] = {
        [1] = "\226\157\133", 
        [2] = -2, 
        [3] = 10, 
        [4] = 0.5
    }, 
    [3] = {
        [1] = "\226\139\134", 
        [2] = -4, 
        [3] = 2, 
        [4] = 0.2
    }, 
    [4] = {
        [1] = "\226\139\134", 
        [2] = 0, 
        [3] = 9, 
        [4] = 0.2
    }, 
    [5] = {
        [1] = "\226\157\134", 
        [2] = -4, 
        [3] = 5, 
        [4] = 0.4
    }, 
    [6] = {
        [1] = "\226\157\133", 
        [2] = 0, 
        [3] = 6, 
        [4] = 0.7
    }, 
    [7] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 2, 
        [4] = 0.3
    }, 
    [8] = {
        [1] = "\226\157\134", 
        [2] = -3, 
        [3] = 8, 
        [4] = 0.4
    }
};
v1762 = l_smoothy_0.new(0);
v1763 = l_smoothy_0.new(0);
v1764 = l_smoothy_0.new(0);
v1765 = l_smoothy_0.new(0);
v1766 = l_smoothy_0.new(0);
v1767 = l_smoothy_0.new(0);
v1768 = function(v2525)
    local v2526 = v2525:get_weapon_info();
    if v2526 == nil then
        return false;
    else
        return v2526.weapon_type == 9;
    end;
end;
do
    local l_v1219_6, l_v1220_7, l_l_match_0_7, l_v1307_5, l_l_angles_0_6, l_v1309_7, l_v1319_7, l_v1320_7, l_v1321_9, l_v1323_10, l_v1326_10, l_v1762_5 = v1219, v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762;
    v1769 = function()
        -- upvalues: v151 (ref), l_v1320_7 (ref), l_v1319_7 (ref), v152 (ref), v25 (ref)
        local v2539 = v151.antiaim.settings.manual_yaw.select:get();
        if v2539 ~= nil and v2539 ~= "Off" then
            local v2540 = v2539:upper();
            return string.format("MANUAL %s", v2540);
        elseif l_v1320_7(l_v1319_7) and rage.antiaim:get_target(true) ~= nil then
            return "FREESTAND";
        elseif not v152.is_onground then
            if v152.is_crouched then
                return "AIR-CROUCH";
            else
                return "AIR";
            end;
        elseif v152.is_crouched then
            if v152.is_moving then
                return "CROUCH-MOVE";
            else
                return "CROUCH";
            end;
        elseif v152.is_moving then
            if v25.antiaim.misc.slow_walk:get() then
                return "SLOWING";
            else
                return "MOVING";
            end;
        else
            return "STANDING";
        end;
    end;
    do
        local l_l_v1323_10_0, l_l_v1326_10_0, l_l_v1762_5_0, l_v1763_6, l_v1764_4, l_v1765_4, l_v1766_3, l_v1767_4, l_v1768_4, l_v1769_4, l_v1770_4, l_v1771_3, l_v1772_2, l_v1773_2, l_v1774_1, l_v1775_2, l_v1776_0, l_v1777_2, l_v1778_0 = l_v1323_10, l_v1326_10, l_v1762_5, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773, v1774, v1775, v1776, v1777, v1778;
        l_v1770_4 = function(v2560, v2561, v2562)
            -- upvalues: l_l_v1326_10_0 (ref), v137 (ref), v17 (ref), l_v1763_6 (ref), v147 (ref)
            local v2563 = "";
            local v2564 = -globals.realtime;
            local v2565 = v2560.x + 4;
            local l_y_1 = v2560.y;
            local v2567 = {};
            local v2568 = #l_l_v1326_10_0;
            local v2569 = 0;
            local v2570 = 0;
            for v2571 = 1, v2568 do
                local v2572 = l_l_v1326_10_0[v2571];
                local v2573 = v137.measure_text(1, v2563, v2572[1]);
                v2569 = v2569 + (v2573.x + v2572[2]);
                v2570 = math.max(v2570, v2573.y + v2572[3]);
                v2567[v2571] = v2573;
            end;
            v2565 = v17(v2565 - v2569 * 0.5 * (1 - l_v1763_6.value));
            local v2574 = 0;
            local v2575 = 1 / (v2568 - 1);
            for v2576 = 1, v2568 do
                local v2577 = l_l_v1326_10_0[v2576];
                local v2578 = v2567[v2576];
                local v2579 = v2577[1];
                local v2580 = v2577[2];
                local v2581 = v2577[3];
                local v2582 = v2577[4];
                local v2583 = (math.sin(v2564 * v2582) * 0.5 + 0.5) * 0.5 + 0.3;
                v2579 = v147.gradient(v2579, (v2564 + v2574) * 1.25, v2561, v2562);
                local v2584 = vector(v2565 + v2580, l_y_1 + v2581);
                local v2585 = color(200, 200, 200, v2561.a);
                v2585.a = v2585.a * v2583;
                v137.text(1, v2584, v2585, v2563, v2579);
                v2565 = v2565 + v2578.x + v2580;
                v2574 = v2574 + v2575;
            end;
            v2560.y = v2560.y + v2570 * 0.75;
        end;
        l_v1771_3 = function(v2586, v2587, v2588)
            -- upvalues: l_v1769_4 (ref), v137 (ref), v17 (ref), l_v1763_6 (ref)
            local v2589 = 2;
            local v2590 = "";
            local v2591 = l_v1769_4();
            local v2592 = v137.measure_text(v2589, v2590, v2591);
            local v2593 = v2586:clone();
            v2593.x = v17(v2593.x - v2592.x * 0.5 * (1 - l_v1763_6.value));
            local v2594 = v2587:clone();
            v2594.a = v2594.a * v2588;
            v137.text(v2589, v2593, v2594, v2590, v2591);
            v2586.y = v2586.y + (v2592.y - 2);
        end;
        l_v1772_2 = function(v2595, v2596, v2597)
            -- upvalues: l_v1219_6 (ref), l_l_v1323_10_0 (ref), v137 (ref), v147 (ref), v17 (ref), l_v1763_6 (ref)
            local v2598 = l_v1219_6.animation:get();
            local v2599 = 2;
            local v2600 = "";
            local l_l_l_v1323_10_0_0 = l_l_v1323_10_0;
            local v2602 = v137.measure_text(v2599, v2600, l_l_l_v1323_10_0_0);
            local v2603 = -globals.realtime;
            if not v2598 then
                l_l_l_v1323_10_0_0 = string.format("\a%sFROST\aDEFAULT.LUA", v2596:to_hex());
            end;
            if v2598 then
                l_l_l_v1323_10_0_0 = v147.gradient(l_l_l_v1323_10_0_0, v2603 * 1.25, v2596, v2597);
            end;
            local v2604 = v2595:clone();
            v2604.x = v17(v2604.x - v2602.x * 0.5 * (1 - l_v1763_6.value));
            v137.text(v2599, v2604, v2597, v2600, l_l_l_v1323_10_0_0);
            v2595.y = v2595.y + v17(v2602.y - 2);
        end;
        l_v1773_2 = function(v2605, v2606, v2607, v2608)
            -- upvalues: v137 (ref), v17 (ref), l_v1763_6 (ref)
            local v2609 = 2;
            local v2610 = "";
            local v2611 = "DT";
            local v2612 = v137.measure_text(v2609, v2610, v2611);
            local v2613 = v2605:clone();
            v2613.x = v17(v2613.x - v2612.x * 0.5 * (1 - l_v1763_6.value));
            local v2614 = color(255, 0, 50, 255):lerp(v2606, rage.exploit:get());
            v2614.a = v2614.a * v2607 * v2608;
            v137.text(v2609, v2613, v2614, v2610, v2611);
            v2605.y = v2605.y + v17((v2612.y - 2) * v2607);
        end;
        l_v1774_1 = function(v2615, v2616, v2617, v2618)
            -- upvalues: v137 (ref), v17 (ref), l_v1763_6 (ref)
            local v2619 = 2;
            local v2620 = "";
            local v2621 = "OSAA";
            local v2622 = v137.measure_text(v2619, v2620, v2621);
            local v2623 = v2615:clone();
            v2623.x = v17(v2623.x - v2622.x * 0.5 * (1 - l_v1763_6.value));
            local v2624 = v2616:clone();
            v2624.a = v2624.a * v2617 * v2618;
            v137.text(v2619, v2623, v2624, v2620, v2621);
            v2615.y = v2615.y + v17((v2622.y - 2) * v2617);
        end;
        l_v1775_2 = function(v2625, v2626, v2627, v2628)
            -- upvalues: v137 (ref), v17 (ref), l_v1763_6 (ref)
            local v2629 = 2;
            local v2630 = "";
            local v2631 = "BODY";
            local v2632 = v137.measure_text(v2629, v2630, v2631);
            local v2633 = v2625:clone();
            v2633.x = v17(v2633.x - v2632.x * 0.5 * (1 - l_v1763_6.value));
            local v2634 = v2626:clone();
            v2634.a = v2634.a * v2627 * v2628;
            v137.text(v2629, v2633, v2634, v2630, v2631);
            v2625.y = v2625.y + v17((v2632.y - 2) * v2627);
        end;
        l_v1776_0 = function(v2635, v2636, v2637, v2638)
            -- upvalues: v137 (ref), v17 (ref), l_v1763_6 (ref)
            local v2639 = 2;
            local v2640 = "";
            local v2641 = "HC";
            local v2642 = v137.measure_text(v2639, v2640, v2641);
            local v2643 = v2635:clone();
            v2643.x = v17(v2643.x - v2642.x * 0.5 * (1 - l_v1763_6.value));
            local v2644 = v2636:clone();
            v2644.a = v2644.a * v2637 * v2638;
            v137.text(v2639, v2643, v2644, v2640, v2641);
            v2635.y = v2635.y + v17((v2642.y - 2) * v2637);
        end;
        l_v1777_2 = function(v2645)
            -- upvalues: l_v1320_7 (ref), l_v1220_7 (ref), l_l_match_0_7 (ref), v509 (ref), l_v1309_7 (ref), l_v1307_5 (ref), l_v1768_4 (ref), l_l_v1762_5_0 (ref), l_v1763_6 (ref), l_v1764_4 (ref), l_v1765_4 (ref), l_v1766_3 (ref), l_v1767_4 (ref)
            local v2646 = v2645:is_alive();
            local l_m_bIsScoped_0 = v2645.m_bIsScoped;
            local v2648 = l_v1320_7(l_v1220_7);
            local v2649 = l_v1320_7(l_l_match_0_7);
            local v2650 = v509.get(l_v1309_7);
            local v2651 = v2650 ~= nil and v2650.active;
            local v2652 = l_v1307_5:get() == "Force";
            local v2653 = 0;
            if v2646 then
                v2653 = 1;
                local v2654 = v2645:get_player_weapon();
                if l_m_bIsScoped_0 or v2654 ~= nil and l_v1768_4(v2654) then
                    v2653 = 0.5;
                end;
            end;
            l_l_v1762_5_0(0.05, v2653);
            l_v1763_6(0.05, l_m_bIsScoped_0);
            l_v1764_4(0.05, v2652);
            l_v1765_4(0.05, v2651);
            l_v1766_3(0.05, v2648);
            l_v1767_4(0.05, v2649);
        end;
        l_v1778_0 = function()
            -- upvalues: v137 (ref), l_v1219_6 (ref), l_v1763_6 (ref), l_l_v1762_5_0 (ref), l_v1770_4 (ref), l_v1772_2 (ref), l_v1771_3 (ref), l_v1773_2 (ref), l_v1766_3 (ref), l_v1774_1 (ref), l_v1767_4 (ref), l_v1775_2 (ref), l_v1764_4 (ref), l_v1776_0 (ref), l_v1765_4 (ref)
            local v2655 = v137.screen_size() * 0.5;
            local v2656 = l_v1219_6.color:get("Accent")[1]:clone();
            local v2657 = l_v1219_6.color:get("Secondary")[1]:clone();
            v2655.x = v2655.x + math.floor(0.5 + 10 * l_v1763_6.value);
            v2655.y = v2655.y + l_v1219_6.offset:get();
            v2656.a = v2656.a * l_l_v1762_5_0.value;
            v2657.a = v2657.a * l_l_v1762_5_0.value;
            l_v1770_4(v2655, v2656, v2657);
            l_v1772_2(v2655, v2656, v2657);
            l_v1771_3(v2655, color(250, 250, 250, 125), l_l_v1762_5_0.value);
            l_v1773_2(v2655, color(250, 250, 250, 175), l_v1766_3.value, l_l_v1762_5_0.value);
            l_v1774_1(v2655, color(250, 250, 250, 175), l_v1767_4.value, l_l_v1762_5_0.value);
            l_v1775_2(v2655, color(250, 250, 250, 175), l_v1764_4.value, l_l_v1762_5_0.value);
            l_v1776_0(v2655, color(250, 250, 250, 175), l_v1765_4.value, l_l_v1762_5_0.value);
        end;
        l_v1321_9.on_render = function()
            -- upvalues: l_v1777_2 (ref), l_l_v1762_5_0 (ref), l_v1778_0 (ref)
            local v2658 = entity.get_local_player();
            if v2658 == nil then
                return;
            else
                l_v1777_2(v2658);
                if l_l_v1762_5_0.value > 0 then
                    l_v1778_0();
                end;
                return;
            end;
        end;
    end;
    l_v1323_10 = {};
    l_v1326_10 = v137.load_font("museo500", 16, "ad");
    l_v1762_5 = v137.load_font("museo500", 14, "ad");
    v1763 = string.format("%s.%s", v22.name:lower(), "lua");
    v1764 = {
        [1] = {
            [1] = "\226\157\133", 
            [2] = -7, 
            [3] = 6, 
            [4] = 0.7
        }, 
        [2] = {
            [1] = "\226\157\133", 
            [2] = -2, 
            [3] = 10, 
            [4] = 0.5
        }, 
        [3] = {
            [1] = "\226\139\134", 
            [2] = -4, 
            [3] = 2, 
            [4] = 0.2
        }, 
        [4] = {
            [1] = "\226\139\134", 
            [2] = 0, 
            [3] = 9, 
            [4] = 0.2
        }, 
        [5] = {
            [1] = "\226\157\134", 
            [2] = -4, 
            [3] = 5, 
            [4] = 0.4
        }, 
        [6] = {
            [1] = "\226\157\133", 
            [2] = 0, 
            [3] = 6, 
            [4] = 0.7
        }, 
        [7] = {
            [1] = "\226\139\134", 
            [2] = -2, 
            [3] = 2, 
            [4] = 0.3
        }, 
        [8] = {
            [1] = "\226\157\134", 
            [2] = -3, 
            [3] = 8, 
            [4] = 0.4
        }
    };
    v1765 = l_smoothy_0.new(0);
    v1766 = l_smoothy_0.new(0);
    v1767 = l_smoothy_0.new(0);
    v1768 = l_smoothy_0.new(0);
    v1769 = l_smoothy_0.new(0);
    v1770 = function(v2659)
        local v2660 = v2659:get_weapon_info();
        if v2660 == nil then
            return false;
        else
            return v2660.weapon_type == 9;
        end;
    end;
    v1771 = function()
        -- upvalues: v152 (ref), v25 (ref)
        if not v152.is_onground then
            return "air";
        elseif v152.is_crouched then
            return "crouch";
        elseif v152.is_moving then
            if v25.antiaim.misc.slow_walk:get() then
                return "slowing";
            else
                return "moving";
            end;
        else
            return "stand";
        end;
    end;
    do
        local l_l_v1326_10_1, l_l_v1762_5_1, l_v1763_7, l_v1764_5, l_v1765_5, l_v1766_4, l_v1767_5, l_v1768_5, l_v1769_5, l_v1770_5, l_v1771_4, l_v1772_3, l_v1773_3, l_v1774_2, l_v1775_3, l_v1779_1, l_v1780_1 = l_v1326_10, l_v1762_5, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773, v1774, v1775, v1779, v1780;
        l_v1772_3 = function(v2678, v2679, v2680)
            -- upvalues: l_v1764_5 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref), v147 (ref)
            local v2681 = "";
            local v2682 = -globals.realtime;
            local v2683 = v2678.x + 4;
            local l_y_2 = v2678.y;
            local v2685 = {};
            local v2686 = #l_v1764_5;
            local v2687 = 0;
            local v2688 = 0;
            for v2689 = 1, v2686 do
                local v2690 = l_v1764_5[v2689];
                local v2691 = v137.measure_text(1, v2681, v2690[1]);
                v2687 = v2687 + (v2691.x + v2690[2]);
                v2688 = math.max(v2688, v2691.y + v2690[3]);
                v2685[v2689] = v2691;
            end;
            v2683 = v17(v2683 - v2687 * 0.5 * (1 - l_v1766_4.value));
            local v2692 = 0;
            local v2693 = 1 / (v2686 - 1);
            for v2694 = 1, v2686 do
                local v2695 = l_v1764_5[v2694];
                local v2696 = v2685[v2694];
                local v2697 = v2695[1];
                local v2698 = v2695[2];
                local v2699 = v2695[3];
                local v2700 = v2695[4];
                local v2701 = (math.sin(v2682 * v2700) * 0.5 + 0.5) * 0.5 + 0.3;
                v2697 = v147.gradient(v2697, (v2682 + v2692) * 1.25, v2679, v2680);
                local v2702 = vector(v2683 + v2698, l_y_2 + v2699);
                local v2703 = color(200, 200, 200, v2679.a);
                v2703.a = v2703.a * v2701;
                v137.text(1, v2702, v2703, v2681, v2697);
                v2683 = v2683 + v2696.x + v2698;
                v2692 = v2692 + v2693;
            end;
            v2678.y = v2678.y + v2688;
        end;
        l_v1773_3 = function(v2704, v2705, v2706, v2707)
            -- upvalues: l_l_v1326_10_1 (ref), l_v1763_7 (ref), v137 (ref), l_v1219_6 (ref), v17 (ref), l_v1766_4 (ref), v147 (ref)
            local l_l_l_v1326_10_1_0 = l_l_v1326_10_1;
            local v2709 = "";
            local l_l_v1763_7_0 = l_v1763_7;
            local v2711 = v137.measure_text(l_l_l_v1326_10_1_0, v2709, l_l_v1763_7_0);
            local v2712 = v2711 + vector(l_v1219_6.padding:get() + 6, l_v1219_6.padding:get());
            local v2713 = v2704:clone();
            v2713.x = v17(v2713.x - v2712.x * 0.5 * (1 - l_v1766_4.value));
            local v2714 = v2704:clone();
            v2714.x = v17(v2714.x - v2711.x * 0.5 * (1 - l_v1766_4.value));
            local v2715 = v2706:clone();
            if l_v1219_6.animation:get() then
                l_l_v1763_7_0 = v147.gradient(l_l_v1763_7_0, -globals.realtime * 1.25, v2705, v2706);
            end;
            local v2716 = v2705:clone();
            local v2717 = 8;
            v2716.r = v2716.r * 0.1;
            v2716.g = v2716.g * 0.1;
            v2716.b = v2716.b * 0.1;
            v2716.a = 80 * v2707;
            v137.blur(v2713, v2713 + v2712, 1.8, v2707, v2717);
            v137.rect(v2713, v2713 + v2712, v2716, v2717);
            v137.text(l_l_l_v1326_10_1_0, v2713 + (v2712 - v2711) / 2, v2715, v2709, l_l_v1763_7_0);
            v2704.y = v2704.y + v17(v2712.y - 1);
        end;
        l_v1774_2 = function(v2718, v2719, v2720)
            -- upvalues: l_l_v1762_5_1 (ref), l_v1771_4 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref)
            local l_l_l_v1762_5_1_0 = l_l_v1762_5_1;
            local v2722 = "";
            local v2723 = l_v1771_4();
            local v2724 = v137.measure_text(l_l_l_v1762_5_1_0, v2722, v2723);
            local v2725 = "\226\151\159";
            local v2726 = "\226\151\158";
            local v2727 = v137.measure_text(l_l_l_v1762_5_1_0, v2722, v2725);
            local v2728 = v137.measure_text(l_l_l_v1762_5_1_0, v2722, v2726);
            local v2729 = v2724:clone();
            v2729.x = v2729.x + v2727.x;
            v2729.x = v2729.x + v2728.x;
            local v2730 = v2718:clone();
            v2730.x = v17(v2730.x - v2729.x * 0.5 * (1 - l_v1766_4.value));
            local v2731 = v2719:clone();
            v2731.a = v2731.a * v2720;
            v137.text(l_l_l_v1762_5_1_0, v2730 + vector(0, -2), v2731, v2722, v2725);
            v2730.x = v2730.x + v2727.x;
            v137.text(l_l_l_v1762_5_1_0, v2730, v2731, v2722, v2723);
            v2730.x = v2730.x + v2724.x;
            v137.text(l_l_l_v1762_5_1_0, v2730 + vector(0, -2), v2731, v2722, v2726);
            v2718.y = v2718.y + v2729.y + 2;
        end;
        l_v1775_3 = function(v2732, v2733, v2734, v2735, v2736, v2737)
            -- upvalues: l_l_v1762_5_1 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref)
            local l_l_l_v1762_5_1_1 = l_l_v1762_5_1;
            local v2739 = "";
            local v2740 = 6;
            local v2741 = "dmg";
            local v2742 = "dt";
            local v2743 = "hs";
            local v2744 = v137.measure_text(l_l_l_v1762_5_1_1, v2739, v2741);
            local v2745 = v137.measure_text(l_l_l_v1762_5_1_1, v2739, v2742);
            local v2746 = v137.measure_text(l_l_l_v1762_5_1_1, v2739, v2743);
            local v2747 = vector(math.max(v2744.x + v2740 + v2745.x, v2746.x), math.max(v2744.y, v2745.y) + v2746.y);
            local v2748 = v2732:clone();
            local v2749 = v2732:clone();
            v2748.x = v17(v2748.x - v2747.x * 0.5 * (1 - l_v1766_4.value));
            v2749.x = v17(v2749.x - v2746.x * 0.5 * (1 - l_v1766_4.value));
            local v2750 = color(250, 250, 250, 175);
            local v2751 = color(250, 250, 250, 175);
            local v2752 = color(250, 250, 250, 175);
            local v2753 = color(255, 0, 50, 255):lerp(v2733, rage.exploit:get());
            v2750 = v2750:lerp(v2733, v2734);
            v2751 = v2751:lerp(v2753, v2735);
            v2752 = v2752:lerp(v2733, v2736);
            v2750.a = v2750.a * v2737;
            v2751.a = v2751.a * v2737;
            v2752.a = v2752.a * v2737;
            v137.text(l_l_l_v1762_5_1_1, v2748, v2750, v2739, v2741);
            v2748.x = v2748.x + v2744.x + v2740;
            v137.text(l_l_l_v1762_5_1_1, v2748, v2751, v2739, v2742);
            v2749.y = v2749.y + math.max(v2744.y, v2745.y);
            v137.text(l_l_l_v1762_5_1_1, v2749, v2752, v2739, v2743);
            v2732.y = v2732.y + v2747.y;
        end;
        v1776 = function(v2754, v2755, v2756, v2757)
            -- upvalues: l_l_v1762_5_1 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref)
            local l_l_l_v1762_5_1_2 = l_l_v1762_5_1;
            local v2759 = "";
            local v2760 = "dmg";
            local v2761 = v137.measure_text(l_l_l_v1762_5_1_2, v2759, v2760);
            local v2762 = v2754:clone();
            v2762.x = v17(v2762.x - v2761.x * 0.5 * (1 - l_v1766_4.value));
            local v2763 = v2755:clone();
            v2763.a = v2763.a * v2756 * v2757;
            v137.text(l_l_l_v1762_5_1_2, v2762, v2763, v2759, v2760);
            v2754.y = v2754.y + v17((v2761.y - 1) * v2756);
        end;
        v1777 = function(v2764, v2765, v2766, v2767)
            -- upvalues: l_l_v1762_5_1 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref)
            local l_l_l_v1762_5_1_3 = l_l_v1762_5_1;
            local v2769 = "";
            local v2770 = "dt";
            local v2771 = v137.measure_text(l_l_l_v1762_5_1_3, v2769, v2770);
            local v2772 = v2764:clone();
            v2772.x = v17(v2772.x - v2771.x * 0.5 * (1 - l_v1766_4.value));
            local v2773 = color(255, 0, 50, 255):lerp(v2765, rage.exploit:get());
            v2773.a = v2773.a * v2766 * v2767;
            v137.text(l_l_l_v1762_5_1_3, v2772, v2773, v2769, v2770);
            v2764.y = v2764.y + v17((v2771.y - 1) * v2766);
        end;
        v1778 = function(v2774, v2775, v2776, v2777)
            -- upvalues: l_l_v1762_5_1 (ref), v137 (ref), v17 (ref), l_v1766_4 (ref)
            local l_l_l_v1762_5_1_4 = l_l_v1762_5_1;
            local v2779 = "";
            local v2780 = "hs";
            local v2781 = v137.measure_text(l_l_l_v1762_5_1_4, v2779, v2780);
            local v2782 = v2774:clone();
            v2782.x = v17(v2782.x - v2781.x * 0.5 * (1 - l_v1766_4.value));
            local v2783 = v2775:clone();
            v2783.a = v2783.a * v2776 * v2777;
            v137.text(l_l_l_v1762_5_1_4, v2782, v2783, v2779, v2780);
            v2774.y = v2774.y + v17((v2781.y - 1) * v2776);
        end;
        l_v1779_1 = function(v2784)
            -- upvalues: l_v1320_7 (ref), l_v1220_7 (ref), l_l_match_0_7 (ref), v509 (ref), l_l_angles_0_6 (ref), l_v1770_5 (ref), l_v1765_5 (ref), l_v1766_4 (ref), l_v1767_5 (ref), l_v1768_5 (ref), l_v1769_5 (ref)
            local v2785 = v2784:is_alive();
            local l_m_bIsScoped_1 = v2784.m_bIsScoped;
            local v2787 = l_v1320_7(l_v1220_7);
            local v2788 = l_v1320_7(l_l_match_0_7);
            local v2789 = v509.get(l_l_angles_0_6);
            local v2790 = v2789 ~= nil and v2789.active;
            local v2791 = 0;
            if v2785 then
                v2791 = 1;
                local v2792 = v2784:get_player_weapon();
                if l_m_bIsScoped_1 or v2792 ~= nil and l_v1770_5(v2792) then
                    v2791 = 0.5;
                end;
            end;
            l_v1765_5(0.05, v2791);
            l_v1766_4(0.05, l_m_bIsScoped_1);
            l_v1767_5(0.05, v2790);
            l_v1768_5(0.05, v2787);
            l_v1769_5(0.05, v2788);
        end;
        l_v1780_1 = function()
            -- upvalues: v137 (ref), l_v1219_6 (ref), l_v1766_4 (ref), l_v1765_5 (ref), l_v1772_3 (ref), l_v1773_3 (ref), l_v1774_2 (ref), l_v1775_3 (ref), l_v1767_5 (ref), l_v1768_5 (ref), l_v1769_5 (ref)
            local v2793 = v137.screen_size() * 0.5;
            local v2794 = l_v1219_6.color:get("Accent")[1]:clone();
            local v2795 = l_v1219_6.color:get("Secondary")[1]:clone();
            v2793.x = v2793.x + math.floor(0.5 + 10 * l_v1766_4.value);
            v2793.y = v2793.y + l_v1219_6.offset:get();
            v2794.a = v2794.a * l_v1765_5.value;
            v2795.a = v2795.a * l_v1765_5.value;
            l_v1772_3(v2793, v2794, v2795);
            l_v1773_3(v2793, v2794, v2795, l_v1765_5.value);
            l_v1774_2(v2793, color(250, 250, 250, 125), l_v1765_5.value);
            l_v1775_3(v2793, v2794, l_v1767_5.value, l_v1768_5.value, l_v1769_5.value, l_v1765_5.value);
        end;
        l_v1323_10.on_render = function()
            -- upvalues: l_v1779_1 (ref), l_v1765_5 (ref), l_v1780_1 (ref)
            local v2796 = entity.get_local_player();
            if v2796 == nil then
                return;
            else
                l_v1779_1(v2796);
                if l_v1765_5.value > 0 then
                    l_v1780_1();
                end;
                return;
            end;
        end;
    end;
    l_v1326_10 = {};
    l_v1762_5 = string.format("%s.%s", v22.name:upper(), "LUA");
    v1763 = {
        [1] = {
            [1] = "\226\157\133", 
            [2] = -7, 
            [3] = 6, 
            [4] = 0.7
        }, 
        [2] = {
            [1] = "\226\157\133", 
            [2] = -2, 
            [3] = 10, 
            [4] = 0.5
        }, 
        [3] = {
            [1] = "\226\139\134", 
            [2] = -4, 
            [3] = 2, 
            [4] = 0.2
        }, 
        [4] = {
            [1] = "\226\139\134", 
            [2] = 0, 
            [3] = 9, 
            [4] = 0.2
        }, 
        [5] = {
            [1] = "\226\157\134", 
            [2] = -4, 
            [3] = 5, 
            [4] = 0.4
        }, 
        [6] = {
            [1] = "\226\157\133", 
            [2] = 0, 
            [3] = 6, 
            [4] = 0.7
        }, 
        [7] = {
            [1] = "\226\139\134", 
            [2] = -2, 
            [3] = 2, 
            [4] = 0.3
        }, 
        [8] = {
            [1] = "\226\157\134", 
            [2] = -3, 
            [3] = 8, 
            [4] = 0.4
        }
    };
    v1764 = l_smoothy_0.new(0);
    v1765 = l_smoothy_0.new(0);
    v1766 = l_smoothy_0.new(0);
    v1767 = l_smoothy_0.new(0);
    v1768 = l_smoothy_0.new(0);
    v1769 = function(v2797)
        local v2798 = v2797:get_weapon_info();
        if v2798 == nil then
            return false;
        else
            return v2798.weapon_type == 9;
        end;
    end;
    v1770 = function()
        -- upvalues: v152 (ref), v25 (ref)
        if not v152.is_onground then
            return "AIR";
        elseif v152.is_crouched then
            return "CROUCH";
        elseif v152.is_moving then
            if v25.antiaim.misc.slow_walk:get() then
                return "SLOWING";
            else
                return "MOVING";
            end;
        else
            return "STAND";
        end;
    end;
    do
        local l_l_v1762_5_2, l_v1763_8, l_v1764_6, l_v1765_6, l_v1766_5, l_v1767_6, l_v1768_6, l_v1769_6, l_v1770_6, l_v1771_5, l_v1772_4, l_v1773_4, l_v1774_3, l_v1775_4, l_v1776_1 = l_v1762_5, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773, v1774, v1775, v1776;
        l_v1771_5 = function(v2814, v2815, v2816)
            -- upvalues: l_v1763_8 (ref), v137 (ref), v17 (ref), l_v1765_6 (ref), v147 (ref)
            local v2817 = "";
            local v2818 = -globals.realtime;
            local v2819 = v2814.x + 4;
            local l_y_3 = v2814.y;
            local v2821 = {};
            local v2822 = #l_v1763_8;
            local v2823 = 0;
            local v2824 = 0;
            for v2825 = 1, v2822 do
                local v2826 = l_v1763_8[v2825];
                local v2827 = v137.measure_text(1, v2817, v2826[1]);
                v2823 = v2823 + (v2827.x + v2826[2]);
                v2824 = math.max(v2824, v2827.y + v2826[3]);
                v2821[v2825] = v2827;
            end;
            v2819 = v17(v2819 - v2823 * 0.5 * (1 - l_v1765_6.value));
            local v2828 = 0;
            local v2829 = 1 / (v2822 - 1);
            for v2830 = 1, v2822 do
                local v2831 = l_v1763_8[v2830];
                local v2832 = v2821[v2830];
                local v2833 = v2831[1];
                local v2834 = v2831[2];
                local v2835 = v2831[3];
                local v2836 = v2831[4];
                local v2837 = (math.sin(v2818 * v2836) * 0.5 + 0.5) * 0.5 + 0.3;
                v2833 = v147.gradient(v2833, (v2818 + v2828) * 1.25, v2815, v2816);
                local v2838 = vector(v2819 + v2834, l_y_3 + v2835);
                local v2839 = color(200, 200, 200, v2815.a);
                v2839.a = v2839.a * v2837;
                v137.text(1, v2838, v2839, v2817, v2833);
                v2819 = v2819 + v2832.x + v2834;
                v2828 = v2828 + v2829;
            end;
            v2814.y = v2814.y + v2824 * 0.95;
        end;
        l_v1772_4 = function(v2840, v2841, v2842, _)
            -- upvalues: l_l_v1762_5_2 (ref), v137 (ref), v17 (ref), l_v1765_6 (ref), l_v1219_6 (ref), v147 (ref)
            local v2844 = 2;
            local v2845 = "";
            local l_l_l_v1762_5_2_0 = l_l_v1762_5_2;
            local v2847 = v137.measure_text(v2844, v2845, l_l_l_v1762_5_2_0);
            local v2848 = v2840:clone();
            v2848.x = v17(v2848.x - v2847.x * 0.5 * (1 - l_v1765_6.value));
            local v2849 = v2842:clone();
            if l_v1219_6.animation:get() then
                l_l_l_v1762_5_2_0 = v147.gradient(l_l_l_v1762_5_2_0, -globals.realtime * 1.25, v2841, v2842);
            end;
            v137.text(v2844, v2848, v2849, v2845, l_l_l_v1762_5_2_0);
            v2840.y = v2840.y + v17(v2847.y - 1);
        end;
        l_v1773_4 = function(v2850, v2851, v2852)
            -- upvalues: l_v1770_6 (ref), v137 (ref), v17 (ref), l_v1765_6 (ref)
            local v2853 = 2;
            local v2854 = "";
            local v2855 = l_v1770_6();
            local v2856 = v137.measure_text(v2853, v2854, v2855);
            local v2857 = "\226\140\158";
            local v2858 = "\226\140\159";
            local v2859 = v137.measure_text(v2853, v2854, v2857);
            local v2860 = v137.measure_text(v2853, v2854, v2858);
            local v2861 = v2856:clone();
            v2861.x = v2861.x + v2859.x;
            v2861.x = v2861.x + v2860.x;
            local v2862 = v2850:clone();
            v2862.x = v17(v2862.x - v2861.x * 0.5 * (1 - l_v1765_6.value));
            local v2863 = v2851:clone();
            v2863.a = v2863.a * v2852;
            v137.text(v2853, v2862 + vector(0, -1), v2863, v2854, v2857);
            v2862.x = v2862.x + v2859.x;
            v137.text(v2853, v2862, v2863, v2854, v2855);
            v2862.x = v2862.x + v2856.x;
            v137.text(v2853, v2862 + vector(0, -1), v2863, v2854, v2858);
            v2850.y = v2850.y + v2861.y + 2;
        end;
        l_v1774_3 = function(v2864, v2865, v2866, v2867, v2868, v2869)
            -- upvalues: v137 (ref), v17 (ref), l_v1765_6 (ref)
            local v2870 = 2;
            local v2871 = "";
            local v2872 = 1;
            local v2873 = "DMG";
            local v2874 = "DT";
            local v2875 = "HS";
            local v2876 = v137.measure_text(v2870, v2871, v2873);
            local v2877 = v137.measure_text(v2870, v2871, v2874);
            local v2878 = v137.measure_text(v2870, v2871, v2875);
            local v2879 = vector(v2876.x + v2872 + v2877.x + v2872 + v2878.x, math.max(v2876.y, v2877.y, v2878.y));
            local v2880 = v2864:clone();
            v2880.x = v17(v2880.x - v2879.x * 0.5 * (1 - l_v1765_6.value));
            local v2881 = color(250, 250, 250, 175);
            local v2882 = color(250, 250, 250, 175);
            local v2883 = color(250, 250, 250, 175);
            local v2884 = color(255, 0, 50, 255):lerp(v2865, rage.exploit:get());
            v2881 = v2881:lerp(v2865, v2866);
            v2882 = v2882:lerp(v2884, v2867);
            v2883 = v2883:lerp(v2865, v2868);
            v2881.a = v2881.a * v2869;
            v2882.a = v2882.a * v2869;
            v2883.a = v2883.a * v2869;
            v137.text(v2870, v2880, v2881, v2871, v2873);
            v2880.x = v2880.x + v2876.x + v2872;
            v137.text(v2870, v2880, v2882, v2871, v2874);
            v2880.x = v2880.x + v2877.x + v2872;
            v137.text(v2870, v2880, v2883, v2871, v2875);
            v2864.y = v2864.y + v2879.y;
        end;
        l_v1775_4 = function(v2885)
            -- upvalues: l_v1320_7 (ref), l_v1220_7 (ref), l_l_match_0_7 (ref), v509 (ref), l_l_angles_0_6 (ref), l_v1769_6 (ref), l_v1764_6 (ref), l_v1765_6 (ref), l_v1766_5 (ref), l_v1767_6 (ref), l_v1768_6 (ref)
            local v2886 = v2885:is_alive();
            local l_m_bIsScoped_2 = v2885.m_bIsScoped;
            local v2888 = l_v1320_7(l_v1220_7);
            local v2889 = l_v1320_7(l_l_match_0_7);
            local v2890 = v509.get(l_l_angles_0_6);
            local v2891 = v2890 ~= nil and v2890.active;
            local v2892 = 0;
            if v2886 then
                v2892 = 1;
                local v2893 = v2885:get_player_weapon();
                if l_m_bIsScoped_2 or v2893 ~= nil and l_v1769_6(v2893) then
                    v2892 = 0.5;
                end;
            end;
            l_v1764_6(0.05, v2892);
            l_v1765_6(0.05, l_m_bIsScoped_2);
            l_v1766_5(0.05, v2891);
            l_v1767_6(0.05, v2888);
            l_v1768_6(0.05, v2889);
        end;
        l_v1776_1 = function()
            -- upvalues: v137 (ref), l_v1219_6 (ref), l_v1765_6 (ref), l_v1764_6 (ref), l_v1771_5 (ref), l_v1772_4 (ref), l_v1773_4 (ref), l_v1774_3 (ref), l_v1766_5 (ref), l_v1767_6 (ref), l_v1768_6 (ref)
            local v2894 = v137.screen_size() * 0.5;
            local v2895 = l_v1219_6.color:get("Accent")[1]:clone();
            local v2896 = l_v1219_6.color:get("Secondary")[1]:clone();
            v2894.x = v2894.x + math.floor(0.5 + 10 * l_v1765_6.value);
            v2894.y = v2894.y + l_v1219_6.offset:get();
            v2895.a = v2895.a * l_v1764_6.value;
            v2896.a = v2896.a * l_v1764_6.value;
            l_v1771_5(v2894, v2895, v2896);
            l_v1772_4(v2894, v2895, v2896, l_v1764_6.value);
            l_v1773_4(v2894, color(250, 250, 250, 125), l_v1764_6.value);
            l_v1774_3(v2894, v2895, l_v1766_5.value, l_v1767_6.value, l_v1768_6.value, l_v1764_6.value);
        end;
        l_v1326_10.on_render = function()
            -- upvalues: l_v1775_4 (ref), l_v1764_6 (ref), l_v1776_1 (ref)
            local v2897 = entity.get_local_player();
            if v2897 == nil then
                return;
            else
                l_v1775_4(v2897);
                if l_v1764_6.value > 0 then
                    l_v1776_1();
                end;
                return;
            end;
        end;
    end;
    l_v1321_9.on_render = v21("screen_indicators.alternative.on_render", l_v1321_9.on_render);
    l_v1323_10.on_render = v21("screen_indicators.new.on_render", l_v1323_10.on_render);
    l_v1326_10.on_render = v21("screen_indicators.modern.on_render", l_v1326_10.on_render);
    l_v1762_5 = function(v2898)
        -- upvalues: l_v1321_9 (ref), l_v1323_10 (ref), l_v1326_10 (ref)
        events.render(l_v1321_9.on_render, v2898 == "Alternative");
        events.render(l_v1323_10.on_render, v2898 == "New");
        events.render(l_v1326_10.on_render, v2898 == "Modern");
    end;
    v1763 = nil;
    v1764 = function(v2899)
        -- upvalues: l_v1762_5 (ref)
        l_v1762_5(v2899:get());
    end;
    do
        local l_v1764_7 = v1764;
        v1765 = function(v2901)
            -- upvalues: l_v1762_5 (ref), l_v1219_6 (ref), l_v1764_7 (ref)
            local v2902 = v2901:get();
            if not v2902 then
                l_v1762_5(nil);
            end;
            if v2902 then
                l_v1219_6.style:set_callback(l_v1764_7, true);
            else
                l_v1219_6.style:unset_callback(l_v1764_7);
            end;
        end;
        l_v1219_6.enabled:set_callback(v1765, true);
    end;
end;
v5("visuals_manual_arrows");
v1219 = nil;
v1220 = v151.visuals.manual_arrows;
l_match_0 = v151.antiaim.settings.manual_yaw;
v1307 = 40;
l_angles_0 = function()
    return math.abs(globals.realtime % 2 - 1);
end;
do
    local l_v1220_8, l_l_match_0_8, l_v1307_6, l_l_angles_0_7, l_v1309_8, l_v1319_8, l_v1320_8, l_v1321_10, l_v1323_11, l_v1326_11, l_v1762_6 = v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762;
    l_v1309_8 = function()
        -- upvalues: l_l_match_0_8 (ref)
        return l_l_match_0_8.select:get();
    end;
    l_v1319_8 = function(v2914)
        -- upvalues: l_v1220_8 (ref), v24 (ref), l_l_angles_0_7 (ref)
        local v2915 = l_v1220_8.color:get("Active")[1];
        if v2914 ~= false and l_v1220_8.animation:get() then
            v2915.a = v2915.a * v24.lerp(0.33, 1, l_l_angles_0_7());
        end;
        return v2915;
    end;
    l_v1320_8 = function()
        -- upvalues: l_v1220_8 (ref)
        return l_v1220_8.color:get("Inactive")[1];
    end;
    l_v1321_10 = {};
    l_v1323_11 = v137.load_font("Verdana", 20, "abd");
    do
        local l_l_v1323_11_0 = l_v1323_11;
        l_v1321_10.render = function()
            -- upvalues: v137 (ref), l_v1309_8 (ref), l_v1319_8 (ref), l_v1320_8 (ref), l_l_v1323_11_0 (ref), l_v1307_6 (ref)
            local v2917 = entity.get_local_player();
            if v2917 == nil or not v2917:is_alive() then
                return;
            else
                local v2918 = v137.screen_size();
                local v2919 = l_v1309_8();
                local v2920 = l_v1319_8();
                local v2921 = l_v1320_8();
                local _ = nil;
                local v2923 = "r";
                local v2924 = "<";
                local v2925 = v137.measure_text(l_l_v1323_11_0, v2923, v2924);
                local v2926 = vector(v2918.x * 0.5 - l_v1307_6 + 1, v2918.y * 0.5 - v2925.y * 0.5 - 1);
                local v2927 = v2919 == "Left" and v2920 or v2921;
                v137.text(l_l_v1323_11_0, v2926, v2927, v2923, v2924);
                v2923 = nil;
                v2924 = "";
                v2925 = ">";
                v2926 = v137.measure_text(l_l_v1323_11_0, v2924, v2925);
                v2927 = vector(v2918.x * 0.5 + l_v1307_6, v2918.y * 0.5 - v2926.y * 0.5 - 1);
                local v2928 = v2919 == "Right" and v2920 or v2921;
                v137.text(l_l_v1323_11_0, v2927, v2928, v2924, v2925);
                return;
            end;
        end;
    end;
    l_v1323_11 = {};
    l_v1326_11 = v137.load_font("Verdana", 27, "ab");
    do
        local l_l_v1326_11_0 = l_v1326_11;
        l_v1323_11.render = function()
            -- upvalues: v137 (ref), l_v1309_8 (ref), l_v1319_8 (ref), l_v1320_8 (ref), l_l_v1326_11_0 (ref), l_v1307_6 (ref)
            local v2930 = entity.get_local_player();
            if v2930 == nil or not v2930:is_alive() then
                return;
            else
                local v2931 = v137.screen_size();
                local v2932 = l_v1309_8();
                local v2933 = l_v1319_8();
                local v2934 = l_v1320_8();
                local _ = nil;
                local v2936 = "r";
                local v2937 = "\226\174\156";
                local v2938 = l_l_v1326_11_0.height + 4;
                local v2939 = v137.measure_text(l_l_v1326_11_0, v2936, v2937);
                local v2940 = vector(v2931.x * 0.5 - l_v1307_6 + 1, v2931.y * 0.5 - v2939.y * 0.5 - 1);
                local v2941 = vector(v2940.x - v2939.x * 0.5, v2931.y * 0.5);
                local v2942 = v2932 == "Left" and v2933 or v2934;
                local v2943 = v2932 == "Left" and v2933 or v2934;
                v137.shadow(v2941, v2941, v2943, v2938);
                v137.text(l_l_v1326_11_0, v2940, v2942, v2936, v2937);
                v2936 = nil;
                v2937 = "";
                v2938 = "\226\174\158";
                v2939 = l_l_v1326_11_0.height + 4;
                v2940 = v137.measure_text(l_l_v1326_11_0, v2937, v2938);
                v2941 = vector(v2931.x * 0.5 + l_v1307_6, v2931.y * 0.5 - v2940.y * 0.5 - 1);
                v2942 = vector(v2941.x + v2940.x * 0.5, v2931.y * 0.5);
                v2943 = v2932 == "Right" and v2933 or v2934;
                local v2944 = v2932 == "Right" and v2933 or v2934;
                v137.shadow(v2942, v2942, v2944, v2939);
                v137.text(l_l_v1326_11_0, v2941, v2943, v2937, v2938);
                return;
            end;
        end;
    end;
    l_v1326_11 = {
        render = function()
            -- upvalues: v137 (ref), l_v1309_8 (ref), l_v1319_8 (ref), l_v1320_8 (ref), l_v1307_6 (ref)
            local v2945 = entity.get_local_player();
            if v2945 == nil or not v2945:is_alive() then
                return;
            else
                local v2946 = v137.screen_size();
                local v2947 = l_v1309_8();
                local v2948 = l_v1319_8();
                local v2949 = l_v1320_8();
                local _ = nil;
                local v2951 = vector(v2946.x * 0.5 - l_v1307_6 + 1, v2946.y * 0.5);
                local v2952 = vector(v2951.x, v2951.y - 8);
                local v2953 = vector(v2951.x - 10, v2951.y);
                local v2954 = vector(v2951.x, v2951.y + 8);
                local v2955 = v2947 == "Left" and v2948 or v2949;
                v137.poly(v2955, v2952, v2953, v2954);
                v2951 = nil;
                v2952 = vector(v2946.x * 0.5 + l_v1307_6, v2946.y * 0.5);
                v2953 = vector(v2952.x, v2952.y - 8);
                v2954 = vector(v2952.x + 10, v2952.y);
                v2955 = vector(v2952.x, v2952.y + 8);
                local v2956 = v2947 == "Right" and v2948 or v2949;
                v137.poly(v2956, v2953, v2954, v2955);
                return;
            end;
        end
    };
    l_v1321_10.render = v21("manual_arrows.classic.render", l_v1321_10.render);
    l_v1323_11.render = v21("manual_arrows.modern.render", l_v1323_11.render);
    l_v1326_11.render = v21("manual_arrows.triangle.render", l_v1326_11.render);
    l_v1762_6 = function(v2957)
        -- upvalues: l_v1321_10 (ref), l_v1323_11 (ref), l_v1326_11 (ref)
        events.render(l_v1321_10.render, v2957 == "Classic");
        events.render(l_v1323_11.render, v2957 == "Modern");
        events.render(l_v1326_11.render, v2957 == "Triangle");
    end;
    v1763 = nil;
    v1764 = function(v2958)
        -- upvalues: l_v1762_6 (ref)
        l_v1762_6(v2958:get());
    end;
    do
        local l_v1764_8 = v1764;
        v1765 = function(v2960)
            -- upvalues: l_v1762_6 (ref), l_v1220_8 (ref), l_v1764_8 (ref)
            local v2961 = v2960:get();
            if not v2961 then
                l_v1762_6(nil);
            end;
            if v2961 then
                l_v1220_8.style:set_callback(l_v1764_8, true);
            else
                l_v1220_8.style:unset_callback(l_v1764_8);
            end;
        end;
        l_v1220_8.enabled:set_callback(v1765, true);
    end;
end;
v5("visuals_damage_indicator");
v1220 = nil;
l_match_0 = v151.visuals.damage_indicator;
v1307 = {
    Bold = 4, 
    Default = 1, 
    Pixel = 2
};
l_angles_0 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v1309 = 0;
v1319 = l_angles_0:get();
v1320 = "";
v1321 = nil;
v1323 = v137.screen_size();
v1326 = v1323 * 0.5;
v1762 = vector(10, 10);
v1763 = v1326 + vector(8, -8 - v1762.y);
v1321 = v146.new("damage_indicator", v1763, v1762, {
    border = {
        vector(0, 0), 
        v1323:clone()
    }
});
do
    local l_l_match_0_9, l_v1307_7, l_l_angles_0_8, l_v1309_9, l_v1319_9, l_v1320_9, l_v1321_11, l_v1323_12, l_v1326_12 = l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326;
    l_v1321_11.update = function(_)
        -- upvalues: l_v1309_9 (ref)
        return l_v1309_9;
    end;
    l_v1323_12 = function()
        -- upvalues: l_l_angles_0_8 (ref), l_l_match_0_9 (ref), l_v1319_9 (ref), l_play_0 (ref), v17 (ref)
        local v2972 = l_l_angles_0_8:get();
        if v2972 == 0 then
            return "AUTO";
        else
            if l_l_match_0_9.animation:get() then
                l_v1319_9 = l_play_0.interp(l_v1319_9, v2972, 0.035);
                v2972 = v17(l_v1319_9);
            end;
            if v2972 > 100 then
                return string.format("+%d", v2972 - 100);
            else
                return v2972;
            end;
        end;
    end;
    l_v1326_12 = v21("visuals_damage_indicator.on_render", function()
        -- upvalues: l_v1307_7 (ref), l_l_match_0_9 (ref), v509 (ref), l_l_angles_0_8 (ref), l_v1309_9 (ref), l_play_0 (ref), l_v1320_9 (ref), l_v1323_12 (ref), l_v1321_11 (ref), v137 (ref)
        local v2973 = entity.get_local_player();
        if v2973 == nil or not v2973:is_alive() then
            return;
        else
            local v2974 = l_v1307_7[l_l_match_0_9.font:get()];
            if v2974 == nil then
                return;
            else
                local v2975 = l_l_match_0_9.color:get();
                local v2976 = true;
                local v2977 = true;
                if l_l_match_0_9.when_active:get() then
                    local v2978 = v509.get(l_l_angles_0_8);
                    v2976 = v2978 ~= nil and v2978.active;
                    if not v2976 then
                        v2977 = false;
                    end;
                end;
                l_v1309_9 = l_play_0.interp(l_v1309_9, v2976, 0.05);
                if l_v1309_9 <= 0 then
                    return;
                else
                    v2975.a = v2975.a * l_v1309_9;
                    if v2977 then
                        l_v1320_9 = l_v1323_12();
                    end;
                    local v2979 = l_v1321_11:get_drag_position();
                    local v2980 = "";
                    local l_l_v1320_9_0 = l_v1320_9;
                    local v2982 = v137.measure_text(v2974, v2980, l_l_v1320_9_0);
                    v137.text(v2974, v2979 + vector(1, 0), v2975, v2980, l_l_v1320_9_0);
                    l_v1321_11.size = v2982:clone();
                    l_v1321_11();
                    return;
                end;
            end;
        end;
    end);
    v1762 = nil;
    v1763 = function(v2983)
        -- upvalues: l_v1326_12 (ref)
        events.render(l_v1326_12, v2983:get());
    end;
    l_l_match_0_9.enabled:set_callback(v1763, true);
end;
v5("visuals_hitchance_indicator");
l_match_0 = nil;
v1307 = v151.visuals.hitchance_indicator;
l_angles_0 = {
    Bold = 4, 
    Default = 1, 
    Pixel = 2
};
v1309 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v1319 = v1309:get();
v1320 = nil;
v1321 = v137.screen_size();
v1323 = v1321 * 0.5;
v1326 = vector(10, 10);
v1762 = v1323 + vector(-8 - v1326.x, -8 - v1326.y);
v1320 = v146.new("hitchance_indicator", v1762, v1326, {
    border = {
        vector(0, 0), 
        v1321:clone()
    }
});
do
    local l_v1307_8, l_l_angles_0_9, l_v1309_10, l_v1319_10, l_v1320_10, l_v1321_12, l_v1323_13, l_v1326_13 = v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326;
    l_v1321_12 = function()
        -- upvalues: l_v1309_10 (ref)
        local v2992 = l_v1309_10:get_override();
        if v2992 == nil then
            v2992 = l_v1309_10:get();
        end;
        return v2992;
    end;
    l_v1323_13 = function()
        -- upvalues: l_v1321_12 (ref), l_v1307_8 (ref), l_v1319_10 (ref), l_play_0 (ref), v17 (ref)
        local v2993 = l_v1321_12();
        if l_v1307_8.animation:get() then
            l_v1319_10 = l_play_0.interp(l_v1319_10, v2993, 0.035);
            v2993 = v17(l_v1319_10);
        end;
        return v2993;
    end;
    l_v1326_13 = v21("visuals_hitchance_indicator.on_render", function()
        -- upvalues: l_l_angles_0_9 (ref), l_v1307_8 (ref), l_v1320_10 (ref), l_v1323_13 (ref), v137 (ref)
        local v2994 = entity.get_local_player();
        if v2994 == nil or not v2994:is_alive() then
            return;
        else
            local v2995 = l_l_angles_0_9[l_v1307_8.font:get()];
            if v2995 == nil then
                return;
            else
                local v2996 = l_v1307_8.color:get();
                local v2997 = l_v1320_10:get_drag_position();
                local v2998 = "";
                local v2999 = l_v1323_13();
                local v3000 = v137.measure_text(v2995, v2998, v2999);
                v137.text(v2995, v2997, v2996, v2998, v2999);
                l_v1320_10.size = v3000:clone();
                l_v1320_10();
                return;
            end;
        end;
    end);
    v1762 = nil;
    v1763 = function(v3001)
        -- upvalues: l_v1326_13 (ref)
        events.render(l_v1326_13, v3001:get());
    end;
    l_v1307_8.enabled:set_callback(v1763, true);
end;
v5("visuals_velocity_warning");
v1307 = nil;
l_angles_0 = v151.visuals.velocity_warning;
v1309 = nil;
v1319 = vector(0.5, 0.2);
v1309 = v49.new("velocity_warning", v1319:unpack());
v1309:set_anchor(vector(0.5, 0.5));
v1319 = function(v3002)
    if v3002 == nil or not v3002:is_alive() then
        return 1;
    else
        return v3002.m_flVelocityModifier;
    end;
end;
v1320 = {};
v1321 = v137.load_font("museo500", 16, "a");
v1323 = 10;
v1326 = 10;
v1762 = 8;
v1763 = 0;
do
    local l_l_angles_0_10, l_v1309_11, l_v1319_11, l_v1320_11 = l_angles_0, v1309, v1319, v1320;
    v1764 = function(v3007)
        -- upvalues: l_l_angles_0_10 (ref)
        local v3008 = color();
        local v3009 = l_l_angles_0_10.color:get();
        local v3010 = "velocity";
        local v3011 = string.format("%d%%", v3007 * 100);
        return string.format("\a%s%s", v3008:to_hex(), v3010) .. "   " .. string.format("\a%s%s", v3009:to_hex(), v3011);
    end;
    v1765 = function(v3012)
        if v3012 <= 0.33 then
            return color(230, 127, 127, 255);
        elseif v3012 <= 0.5 then
            return color(230, 170, 127, 255);
        else
            return color(255, 255, 255, 255);
        end;
    end;
    do
        local l_v1321_13, l_v1323_14, l_v1762_7, l_v1763_9, l_v1764_9, l_v1765_7 = v1321, v1323, v1762, v1763, v1764, v1765;
        l_v1320_11.on_render = function()
            -- upvalues: l_v1309_11 (ref), l_v1319_11 (ref), l_v1764_9 (ref), l_v1763_9 (ref), l_play_0 (ref), v137 (ref), l_v1321_13 (ref), l_v1323_14 (ref), l_v1762_7 (ref), l_l_angles_0_10 (ref), l_v1765_7 (ref)
            local v3019 = entity.get_local_player();
            local v3020 = l_v1309_11.pos:clone();
            local v3021 = l_v1319_11(v3019);
            local v3022 = l_v1764_9(v3021);
            local v3023 = v3021 < 1 or ui.get_alpha() > 0;
            l_v1763_9 = l_play_0.interp(l_v1763_9, v3023, 0.05);
            if l_v1763_9 <= 0 then
                return;
            else
                local v3024 = ui.get_icon("triangle-exclamation");
                local v3025 = v137.measure_text(l_v1321_13, nil, v3024);
                local v3026 = v137.measure_text(l_v1321_13, nil, v3022);
                local v3027 = vector(36, 36);
                local v3028 = vector(v3026.x + l_v1323_14 * 2, 36);
                local v3029 = vector(v3027.x + v3028.x + l_v1762_7, math.max(v3027.y, v3028.y));
                local v3030 = 10;
                local v3031 = l_l_angles_0_10.color:get();
                local v3032 = l_v1765_7(v3021);
                local v3033 = color(255, 255, 255, 255);
                v3031.r = v3031.r * 0.1;
                v3031.g = v3031.g * 0.1;
                v3031.b = v3031.b * 0.1;
                v3031.a = 80 * l_v1763_9;
                v3032.a = v3032.a * l_v1763_9;
                v3033.a = v3033.a * l_v1763_9;
                v137.blur(v3020, v3020 + v3027, 1.8, l_v1763_9, v3030);
                v137.rect(v3020, v3020 + v3027, v3031, v3030);
                v137.text(l_v1321_13, v3020 + (v3027 - v3025) / 2, v3032, nil, v3024);
                v3020.x = v3020.x + v3027.x + l_v1762_7;
                v137.blur(v3020, v3020 + v3028, 1.8, l_v1763_9, v3030);
                v137.rect(v3020, v3020 + v3028, v3031, v3030);
                local _ = nil;
                local v3035 = v3020:clone();
                local v3036 = vector(v3028.x, v3030);
                v3035.y = v3035.y + v3028.y - v3036.y;
                local v3037 = l_l_angles_0_10.color:get();
                v3037.a = v3037.a * l_v1763_9;
                local v3038 = vector(v3035.x, v3035.y + v3036.y - 3);
                local v3039 = vector(v3035.x + v3036.x * v3021, v3035.y + v3036.y);
                v137.push_clip_rect(v3038, v3039);
                v137.rect(v3035, v3035 + v3036, v3037, {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = v3030, 
                    [4] = v3030
                });
                v137.pop_clip_rect();
                v137.text(l_v1321_13, v3020 + (v3028 - v3026) / 2, v3033, nil, v3022);
                l_v1309_11:set_size(v3029);
                l_v1309_11:update();
                return;
            end;
        end;
    end;
    l_v1320_11.on_render = v21("visuals_velocity_warning.new.on_render", l_v1320_11.on_render);
    v1321 = nil;
    v1323 = function(v3040)
        -- upvalues: l_v1320_11 (ref)
        events.render(l_v1320_11.on_render, v3040:get());
    end;
    l_l_angles_0_10.enabled:set_callback(v1323, true);
end;
v5("visuals_aspect_ratio");
l_angles_0 = nil;
v1309 = v151.visuals.aspect_ratio;
v1319 = cvar.r_aspectratio;
do
    local l_v1309_12, l_v1319_12, l_v1320_12, l_v1321_14, l_v1323_15 = v1309, v1319, v1320, v1321, v1323;
    l_v1320_12 = function()
        -- upvalues: l_v1319_12 (ref)
        l_v1319_12:float(tonumber(l_v1319_12:string()), true);
    end;
    l_v1321_14 = function(v3046)
        -- upvalues: l_v1319_12 (ref)
        l_v1319_12:float(v3046, true);
    end;
    l_v1323_15 = v21("visuals_aspect_ratio.on_shutdown", function()
        -- upvalues: l_v1320_12 (ref)
        l_v1320_12();
    end);
    v1326 = nil;
    v1762 = function(v3047)
        -- upvalues: l_v1321_14 (ref)
        l_v1321_14(v3047:get() * 0.01);
    end;
    do
        local l_v1762_8 = v1762;
        v1763 = function(v3049)
            -- upvalues: l_v1320_12 (ref), l_v1309_12 (ref), l_v1762_8 (ref), l_v1323_15 (ref)
            local v3050 = v3049:get();
            if not v3050 then
                l_v1320_12();
            end;
            if v3050 then
                l_v1309_12.value:set_callback(l_v1762_8, true);
            else
                l_v1309_12.value:unset_callback(l_v1762_8);
            end;
            events.shutdown(l_v1323_15, v3050);
        end;
        l_v1309_12.enabled:set_callback(v1763, true);
    end;
end;
v5("visuals_viewmodel");
v1309 = nil;
v1319 = v151.visuals.viewmodel;
v1320 = 0;
v1321 = cvar.cl_righthand;
v1323 = cvar.viewmodel_fov;
v1326 = cvar.viewmodel_offset_x;
v1762 = cvar.viewmodel_offset_y;
v1763 = cvar.viewmodel_offset_z;
v1764 = nil;
v1765 = function(v3051)
    return tonumber(v3051:string());
end;
do
    local l_v1319_13, l_v1320_13, l_v1321_15, l_v1323_16, l_v1326_14, l_v1762_9, l_v1763_10, l_v1764_10, l_v1765_8, l_v1766_6, l_v1767_7, l_v1768_7, l_v1769_7, l_v1770_7 = v1319, v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770;
    l_v1766_6 = function(v3066)
        -- upvalues: l_v1321_15 (ref)
        if l_v1321_15:string() == "1" then
            l_v1321_15:int(v3066 and 0 or 1, true);
        else
            l_v1321_15:int(v3066 and 1 or 0, true);
        end;
    end;
    l_v1767_7 = function()
        -- upvalues: l_v1323_16 (ref), l_v1765_8 (ref), l_v1326_14 (ref), l_v1762_9 (ref), l_v1763_10 (ref), l_v1321_15 (ref)
        l_v1323_16:float(l_v1765_8(l_v1323_16), false);
        l_v1326_14:float(l_v1765_8(l_v1326_14), false);
        l_v1762_9:float(l_v1765_8(l_v1762_9), false);
        l_v1763_10:float(l_v1765_8(l_v1763_10), false);
        l_v1321_15:int(l_v1321_15:string() == "1" and 1 or 0, false);
    end;
    l_v1768_7 = function()
        -- upvalues: l_v1767_7 (ref)
        l_v1767_7();
    end;
    l_v1769_7 = v21("visuals_viewmodel.on_pre_render", function()
        -- upvalues: l_v1764_10 (ref), l_v1320_13 (ref), l_v1766_6 (ref)
        local v3067 = entity.get_local_player();
        if v3067 == nil then
            return;
        else
            local v3068 = v3067:get_player_weapon();
            if v3068 == nil then
                return;
            else
                local v3069 = v3068:get_weapon_index();
                if l_v1764_10 ~= v3069 then
                    l_v1764_10 = v3069;
                    local v3070 = v3068:get_weapon_info();
                    if v3070 == nil then
                        return;
                    else
                        local v3071 = v3070.weapon_type == l_v1320_13;
                        l_v1766_6(v3071);
                    end;
                end;
                return;
            end;
        end;
    end);
    l_v1768_7 = v21("visuals_viewmodel.on_shutdown", l_v1768_7);
    l_v1770_7 = function(v3072)
        -- upvalues: l_v1767_7 (ref), l_v1769_7 (ref), l_v1768_7 (ref)
        if not v3072 then
            l_v1767_7();
        end;
        if not v3072 then
            events.pre_render(l_v1769_7, v3072);
        end;
        events.shutdown(l_v1768_7, v3072);
    end;
    v1771 = nil;
    v1772 = function(v3073)
        -- upvalues: l_v1323_16 (ref)
        l_v1323_16:float(v3073:get() * 0.01, true);
    end;
    v1773 = function(v3074)
        -- upvalues: l_v1326_14 (ref)
        l_v1326_14:float(v3074:get() * 0.01, true);
    end;
    v1774 = function(v3075)
        -- upvalues: l_v1762_9 (ref)
        l_v1762_9:float(v3075:get() * 0.01, true);
    end;
    v1775 = function(v3076)
        -- upvalues: l_v1763_10 (ref)
        l_v1763_10:float(v3076:get() * 0.01, true);
    end;
    v1776 = function(v3077)
        -- upvalues: l_v1321_15 (ref), l_v1764_10 (ref), l_v1769_7 (ref)
        local v3078 = v3077:get();
        if not v3078 then
            l_v1321_15:int(l_v1321_15:string() == "1" and 1 or 0, false);
        else
            l_v1764_10 = nil;
        end;
        events.pre_render(l_v1769_7, v3078);
    end;
    do
        local l_v1772_5, l_v1773_5, l_v1774_4, l_v1775_5, l_v1776_2 = v1772, v1773, v1774, v1775, v1776;
        v1777 = function(v3084)
            -- upvalues: l_v1319_13 (ref), l_v1772_5 (ref), l_v1773_5 (ref), l_v1774_4 (ref), l_v1775_5 (ref), l_v1776_2 (ref), l_v1770_7 (ref)
            local v3085 = v3084:get();
            if v3085 then
                l_v1319_13.fov:set_callback(l_v1772_5, true);
                l_v1319_13.offset_x:set_callback(l_v1773_5, true);
                l_v1319_13.offset_y:set_callback(l_v1774_4, true);
                l_v1319_13.offset_z:set_callback(l_v1775_5, true);
                l_v1319_13.opposite_knife_hand:set_callback(l_v1776_2, true);
            else
                l_v1319_13.fov:unset_callback(l_v1772_5);
                l_v1319_13.offset_x:unset_callback(l_v1773_5);
                l_v1319_13.offset_y:unset_callback(l_v1774_4);
                l_v1319_13.offset_z:unset_callback(l_v1775_5);
                l_v1319_13.opposite_knife_hand:unset_callback(l_v1776_2);
            end;
            l_v1770_7(v3085);
        end;
        l_v1319_13.enabled:set_callback(v1777, true);
    end;
end;
v5("visuals_custom_scope");
v1319 = nil;
v1320 = v151.visuals.custom_scope;
v1321 = 9.25925925925926E-4;
v1323 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v1326 = 0;
do
    local l_v1320_14, l_v1321_16, l_v1323_17, l_v1326_15, l_v1762_10, l_v1763_11, l_v1764_11 = v1320, v1321, v1323, v1326, v1762, v1763, v1764;
    l_v1762_10 = v21("visuals_custom_scope.on_render", function()
        -- upvalues: l_v1326_15 (ref), l_play_0 (ref), v137 (ref), l_v1320_14 (ref), l_v1321_16 (ref), v17 (ref)
        local v3093 = entity.get_local_player();
        if v3093 == nil or not v3093:is_alive() then
            return;
        else
            l_v1326_15 = l_play_0.interp(l_v1326_15, v3093.m_bIsScoped, 0.05);
            if l_v1326_15 == 0 then
                return;
            else
                local v3094 = v137.screen_size();
                local v3095 = v3094 * 0.5;
                local v3096 = l_v1320_14.style:get() == "Rotated";
                local v3097 = l_v1320_14.offset:get() * v3094.y * l_v1321_16;
                local v3098 = l_v1320_14.position:get() * v3094.y * l_v1321_16;
                local v3099 = l_v1320_14.thickness:get();
                local v3100 = l_v1320_14.color:get("Main")[1];
                local v3101 = l_v1320_14.color:get("Edge")[1];
                v3097 = v17(v3097);
                v3098 = v17(v3098);
                v3100.a = v3100.a * l_v1326_15;
                v3101.a = v3101.a * l_v1326_15;
                if v3096 then
                    v137.push_rotation(45);
                end;
                local _ = nil;
                local v3103 = vector(v3095.x + 0.5 - v3099 * 0.5, v3095.y - v3097 + 1);
                local v3104 = vector(v3095.x + 0.5 + v3099 * 0.5, v3095.y - v3098 + 1);
                v137.gradient(v3103, v3104, v3100, v3100, v3101, v3101);
                v3103 = nil;
                v3104 = vector(v3095.x + 0.5 - v3099 * 0.5, v3095.y + v3097);
                local v3105 = vector(v3095.x + 0.5 + v3099 * 0.5, v3095.y + v3098);
                v137.gradient(v3104, v3105, v3100, v3100, v3101, v3101);
                v3104 = nil;
                v3105 = vector(v3095.x - v3097 + 1, v3095.y + 0.5 - v3099 * 0.5);
                local v3106 = vector(v3095.x - v3098 + 1, v3095.y + 0.5 + v3099 * 0.5);
                v137.gradient(v3105, v3106, v3100, v3101, v3100, v3101);
                v3105 = nil;
                v3106 = vector(v3095.x + v3097, v3095.y + 0.5 - v3099 * 0.5);
                local v3107 = vector(v3095.x + v3098, v3095.y + 0.5 + v3099 * 0.5);
                v137.gradient(v3106, v3107, v3100, v3101, v3100, v3101);
                if v3096 then
                    v137.pop_rotation();
                end;
                return;
            end;
        end;
    end);
    on_shutdown = v21("visuals_custom_scope.on_shutdown", on_shutdown);
    l_v1763_11 = function()
        -- upvalues: l_v1323_17 (ref)
        l_v1323_17:override();
    end;
    l_v1764_11 = function(v3108)
        -- upvalues: l_v1323_17 (ref), l_v1762_10 (ref), l_v1763_11 (ref)
        if not v3108 then
            l_v1323_17:override();
        end;
        events.render(l_v1762_10, v3108);
        events.shutdown(l_v1763_11, v3108);
    end;
    v1765 = nil;
    v1766 = function(v3109)
        -- upvalues: l_v1323_17 (ref), l_v1764_11 (ref)
        local v3110 = v3109:get();
        if v3110 then
            l_v1323_17:override("Remove All");
        end;
        l_v1764_11(v3110);
    end;
    l_v1320_14.enabled:set_callback(v1766, true);
end;
v5("visuals_grenade_radius");
v1320 = nil;
v1321 = v151.visuals.grenade_radius;
v1323 = {};
v1326 = {};
v1762 = function(v3111)
    for v3112 in pairs(v3111) do
        v3111[v3112] = nil;
    end;
end;
do
    local l_v1321_17, l_v1323_18, l_v1326_16, l_v1762_11, l_v1763_12, l_v1764_12, l_v1765_9 = v1321, v1323, v1326, v1762, v1763, v1764, v1765;
    l_v1763_12 = function()
        -- upvalues: l_v1323_18 (ref)
        local v3120 = entity.get_entities("CSmokeGrenadeProjectile");
        local v3121 = {};
        for v3122 = 1, #v3120 do
            local v3123 = v3120[v3122];
            if v3123.m_bDidSmokeEffect then
                local v3124 = v3123:get_index();
                if l_v1323_18[v3124] == nil then
                    local v3125 = v3123:get_origin();
                    l_v1323_18[v3124] = {
                        radius = 125, 
                        alpha = 0, 
                        index = v3124, 
                        origin = v3125
                    };
                end;
                v3121[v3124] = true;
            end;
        end;
        for v3126 in pairs(l_v1323_18) do
            if v3121[v3126] == nil then
                l_v1323_18[v3126] = nil;
            end;
        end;
    end;
    l_v1764_12 = function()
        -- upvalues: l_v1326_16 (ref)
        local v3127 = entity.get_entities("CInferno");
        local v3128 = {};
        for v3129 = 1, #v3127 do
            local v3130 = v3127[v3129];
            local l_m_fireCount_0 = v3130.m_fireCount;
            if l_m_fireCount_0 ~= 0 then
                local v3132 = v3130:get_index();
                if l_v1326_16[v3132] == nil then
                    local v3133 = v3130:get_origin();
                    l_v1326_16[v3132] = {
                        radius = 0, 
                        fire_count = 0, 
                        alpha = 0, 
                        index = v3132, 
                        origin = v3133
                    };
                end;
                local v3134 = l_v1326_16[v3132];
                if v3134.fire_count < l_m_fireCount_0 then
                    v3134.fire_count = l_m_fireCount_0;
                    local v3135 = 0;
                    local v3136 = nil;
                    local v3137 = nil;
                    local v3138 = {};
                    local v3139 = 0;
                    for v3140 = 0, l_m_fireCount_0 - 1 do
                        if v3130.m_bFireIsBurning[v3140] then
                            local v3141 = vector(v3130.m_fireXDelta[v3140], v3130.m_fireYDelta[v3140], v3130.m_fireZDelta[v3140]);
                            v3139 = v3139 + 1;
                            v3138[v3139] = v3141;
                        end;
                    end;
                    for v3142 = 1, v3139 do
                        for v3143 = 1, v3139 do
                            local v3144 = v3138[v3142];
                            local v3145 = v3138[v3143];
                            local v3146 = (v3145 - v3144):lengthsqr();
                            if v3135 < v3146 then
                                v3135 = v3146;
                                v3136 = v3144;
                                v3137 = v3145;
                            end;
                        end;
                    end;
                    if v3136 ~= nil and v3137 ~= nil then
                        v3134.radius = math.sqrt(v3135) / 2 + 40;
                    end;
                end;
                v3128[v3132] = true;
            end;
        end;
        for v3147 in pairs(l_v1326_16) do
            if v3128[v3147] == nil then
                l_v1326_16[v3147] = nil;
            end;
        end;
    end;
    l_v1765_9 = function()
        -- upvalues: l_v1321_17 (ref), l_v1323_18 (ref), v137 (ref), l_v1326_16 (ref)
        local l_frametime_4 = globals.frametime;
        local v3149 = l_v1321_17.smoke_color:get();
        local v3150 = l_v1321_17.molotov_color:get();
        for _, v3152 in pairs(l_v1323_18) do
            v3152.alpha = math.min(v3152.alpha + l_frametime_4 * 4, 1);
            local v3153 = v3152.radius * v3152.alpha;
            v137.circle_3d_outline(v3152.origin, v3149, v3153, 0, 1, 1);
        end;
        for _, v3155 in pairs(l_v1326_16) do
            v3155.alpha = math.min(v3155.alpha + l_frametime_4 * 4, 1);
            local v3156 = v3155.radius * v3155.alpha;
            v137.circle_3d_outline(v3155.origin, v3150, v3156, 0, 1, 1);
        end;
    end;
    l_v1763_12 = v21("visuals_grenade_radius.update_smoke_data", l_v1763_12);
    l_v1764_12 = v21("visuals_grenade_radius.update_molotov_data", l_v1764_12);
    l_v1765_9 = v21("visuals_grenade_radius.on_render", l_v1765_9);
    v1766 = nil;
    v1767 = function(v3157)
        -- upvalues: l_v1762_11 (ref), l_v1323_18 (ref), l_v1763_12 (ref)
        local v3158 = v3157:get();
        if not v3158 then
            l_v1762_11(l_v1323_18);
        end;
        events.net_update_start(l_v1763_12, v3158);
    end;
    v1768 = function(v3159)
        -- upvalues: l_v1762_11 (ref), l_v1326_16 (ref), l_v1764_12 (ref)
        local v3160 = v3159:get();
        if not v3160 then
            l_v1762_11(l_v1326_16);
        end;
        events.net_update_start(l_v1764_12, v3160);
    end;
    do
        local l_v1767_8, l_v1768_8 = v1767, v1768;
        v1769 = function(v3163)
            -- upvalues: l_v1762_11 (ref), l_v1323_18 (ref), l_v1326_16 (ref), l_v1763_12 (ref), l_v1764_12 (ref), l_v1321_17 (ref), l_v1767_8 (ref), l_v1768_8 (ref), l_v1765_9 (ref)
            local v3164 = v3163:get();
            if not v3164 then
                l_v1762_11(l_v1323_18);
                l_v1762_11(l_v1326_16);
                events.net_update_start(l_v1763_12, false);
                events.net_update_start(l_v1764_12, false);
            end;
            if v3164 then
                l_v1321_17.smoke:set_callback(l_v1767_8, true);
                l_v1321_17.molotov:set_callback(l_v1768_8, true);
            else
                l_v1321_17.smoke:unset_callback(l_v1767_8);
                l_v1321_17.molotov:unset_callback(l_v1768_8);
            end;
            events.render(l_v1765_9, v3164);
        end;
        l_v1321_17.enabled:set_callback(v1769, true);
    end;
end;
v5("misc_clantag");
v1321 = nil;
v1323 = v151.visuals.clantag;
v1326 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
v1762 = {
    [1] = "\226\157\132", 
    [2] = "\226\157\132 f", 
    [3] = "\226\157\132 fr", 
    [4] = "\226\157\132 fro", 
    [5] = "\226\157\132 fros", 
    [6] = "\226\157\132 frost", 
    [7] = "\226\157\132 frost.", 
    [8] = "\226\157\132 frost.l", 
    [9] = "\226\157\132 frost.lu", 
    [10] = "\226\157\132 frost.lua", 
    [11] = "\226\157\132 frost.lua", 
    [12] = "\226\157\132 frost.lua", 
    [13] = "\226\157\132 frost.lua", 
    [14] = "\226\157\132 frost.lua", 
    [15] = "\226\157\132 rost.lua", 
    [16] = "\226\157\132 ost.lua", 
    [17] = "\226\157\132 st.lua", 
    [18] = "\226\157\132 t.lua", 
    [19] = "\226\157\132 .lua", 
    [20] = "\226\157\132 lua", 
    [21] = "\226\157\132 ua", 
    [22] = "\226\157\132 a", 
    [23] = "\226\157\132"
};
v1763 = nil;
v1764 = v1762;
v1765 = function(v3165)
    local v3166 = {};
    table.insert(v3166, "");
    for v3167 = 1, #v3165 do
        table.insert(v3166, v3165:sub(1, v3167));
    end;
    for _ = 1, 5 do
        table.insert(v3166, v3165);
    end;
    for v3169 = 1, #v3165 do
        table.insert(v3166, v3165:sub(v3169, #v3165));
    end;
    table.insert(v3166, "");
    return v3166;
end;
v1766 = function()
    -- upvalues: v17 (ref)
    return v17(globals.curtime * 2.4);
end;
do
    local l_v1323_19, l_v1326_17, l_v1762_12, l_v1763_13, l_v1764_13, l_v1765_10, l_v1766_7, l_v1767_9 = v1323, v1326, v1762, v1763, v1764, v1765, v1766, v1767;
    l_v1767_9 = v21("misc_clantag.on_net_update_end", function()
        -- upvalues: l_v1766_7 (ref), l_v1764_13 (ref), l_v1763_13 (ref)
        if not globals.is_in_game then
            return;
        else
            local v3178 = l_v1764_13[l_v1766_7() % #l_v1764_13 + 1] or "";
            if l_v1763_13 ~= v3178 then
                l_v1763_13 = v3178;
                common.set_clan_tag(v3178);
            end;
            return;
        end;
    end);
    v1768 = nil;
    v1769 = function(v3179)
        -- upvalues: l_v1764_13 (ref), l_v1762_12 (ref)
        local v3180 = v3179:get();
        if v3180 ~= "" then
            l_v1764_13 = {
                [1] = v3180
            };
            print(v3180);
        else
            l_v1764_13 = l_v1762_12;
        end;
    end;
    v1770 = function(v3181)
        -- upvalues: l_v1764_13 (ref), l_v1765_10 (ref), l_v1762_12 (ref)
        local v3182 = v3181:get();
        if v3182 ~= "" then
            l_v1764_13 = l_v1765_10(v3182);
        else
            l_v1764_13 = l_v1762_12;
        end;
    end;
    do
        local l_v1769_8, l_v1770_8, l_v1771_6, l_v1772_6 = v1769, v1770, v1771, v1772;
        l_v1771_6 = function(v3187)
            -- upvalues: l_v1323_19 (ref), l_v1770_8 (ref), l_v1769_8 (ref)
            local v3188 = v3187:get();
            if v3188 == "Static" then
                l_v1323_19.input:unset_callback(l_v1770_8);
                l_v1323_19.input:set_callback(l_v1769_8, true);
            end;
            if v3188 == "Animated" then
                l_v1323_19.input:unset_callback(l_v1769_8);
                l_v1323_19.input:set_callback(l_v1770_8, true);
            end;
        end;
        l_v1772_6 = function(v3189)
            -- upvalues: l_v1764_13 (ref), l_v1762_12 (ref), l_v1323_19 (ref), l_v1771_6 (ref), l_v1769_8 (ref), l_v1770_8 (ref)
            local v3190 = v3189:get();
            if v3190 == "Frost" then
                l_v1764_13 = l_v1762_12;
            end;
            if v3190 == "Custom" then
                l_v1323_19.style:set_callback(l_v1771_6, true);
            else
                l_v1323_19.style:unset_callback(l_v1771_6);
                l_v1323_19.input:unset_callback(l_v1769_8);
                l_v1323_19.input:unset_callback(l_v1770_8);
            end;
        end;
        v1773 = function(v3191)
            -- upvalues: l_v1323_19 (ref), l_v1772_6 (ref), l_v1771_6 (ref), l_v1769_8 (ref), l_v1770_8 (ref), l_v1326_17 (ref), l_v1767_9 (ref)
            local v3192 = v3191:get();
            if not v3192 then
                common.set_clan_tag("");
            end;
            if v3192 then
                l_v1323_19.mode:set_callback(l_v1772_6, true);
            else
                l_v1323_19.mode:unset_callback(l_v1772_6);
                l_v1323_19.style:unset_callback(l_v1771_6);
                l_v1323_19.input:unset_callback(l_v1769_8);
                l_v1323_19.input:unset_callback(l_v1770_8);
            end;
            local l_l_v1326_17_0 = l_v1326_17;
            local l_l_l_v1326_17_0_0 = l_l_v1326_17_0;
            l_l_v1326_17_0 = l_l_v1326_17_0.override;
            if v3192 then

            end;
            l_l_v1326_17_0(l_l_l_v1326_17_0_0, nil);
            events.net_update_end(l_v1767_9, v3192);
        end;
        l_v1323_19.enabled:set_callback(v1773, true);
    end;
end;
v5("visuals_hit_markers");
v1323 = nil;
v1326 = v151.visuals.hit_markers;
v1762 = {};
v1763 = {};
do
    local l_v1326_18, l_v1762_13, l_v1763_14, l_v1764_14 = v1326, v1762, v1763, v1764;
    do
        local l_l_v1763_14_0, l_l_v1764_14_0, l_v1765_11 = l_v1763_14, l_v1764_14, v1765;
        l_l_v1764_14_0 = function()
            -- upvalues: l_v1326_18 (ref), l_l_v1763_14_0 (ref), v137 (ref)
            if not globals.is_in_game then
                return;
            else
                local l_realtime_0 = globals.realtime;
                local v3203 = l_v1326_18.kibit.size:get();
                local v3204 = l_v1326_18.kibit.thickness:get();
                local v3205 = l_v1326_18.kibit.color:get("Horizontal")[1];
                local v3206 = l_v1326_18.kibit.color:get("Vertical")[1];
                for v3207 = #l_l_v1763_14_0, 1, -1 do
                    if l_l_v1763_14_0[v3207].time < l_realtime_0 then
                        table.remove(l_l_v1763_14_0, v3207);
                    end;
                end;
                for v3208 = 1, #l_l_v1763_14_0 do
                    local v3209 = l_l_v1763_14_0[v3208];
                    local v3210 = 1;
                    local v3211 = v3209.time - l_realtime_0;
                    if v3211 < 0.7 then
                        v3210 = v3211 / 0.7;
                    end;
                    local v3212 = v137.world_to_screen(v3209.point);
                    if v3212 ~= nil then
                        local v3213 = v3204 * 0.5;
                        local v3214 = v3203 + v3213;
                        local v3215 = vector(v3212.x - v3213, v3212.y - v3214);
                        local v3216 = vector(v3212.x + v3213, v3212.y + v3214);
                        local v3217 = vector(v3212.x - v3214, v3212.y - v3213);
                        local v3218 = vector(v3212.x + v3214, v3212.y + v3213);
                        local v3219 = v3205:clone();
                        local v3220 = v3206:clone();
                        v3219.a = v3219.a * v3210;
                        v3220.a = v3220.a * v3210;
                        v137.rect(v3217, v3218, v3219);
                        v137.rect(v3215, v3216, v3220);
                    end;
                end;
                return;
            end;
        end;
        l_v1765_11 = function(v3221)
            -- upvalues: l_l_v1763_14_0 (ref)
            local v3222 = globals.realtime + 3;
            table.insert(l_l_v1763_14_0, {
                time = v3222, 
                point = v3221.aim
            });
        end;
        l_l_v1764_14_0 = v21("visuals_hit_markers.kibit.on_render", l_l_v1764_14_0);
        l_v1765_11 = v21("visuals_hit_markers.kibit.on_aim_ack", l_v1765_11);
        l_v1762_13.set = function(v3223)
            -- upvalues: l_l_v1763_14_0 (ref), l_l_v1764_14_0 (ref), l_v1765_11 (ref)
            if not v3223 then
                for v3224 = 1, #l_l_v1763_14_0 do
                    l_l_v1763_14_0[v3224] = nil;
                end;
            end;
            events.render(l_l_v1764_14_0, v3223);
            events.aim_ack(l_v1765_11, v3223);
        end;
    end;
    l_v1763_14 = {};
    l_v1764_14 = 0;
    do
        local l_l_v1764_14_1, l_v1765_12, l_v1766_8 = l_v1764_14, v1765, v1766;
        l_v1765_12 = function()
            -- upvalues: l_l_v1764_14_1 (ref), l_v1326_18 (ref), v137 (ref)
            if not globals.is_in_game or l_l_v1764_14_1 <= 0 then
                return;
            else
                local v3228 = 1;
                if l_l_v1764_14_1 < 0.25 then
                    v3228 = l_l_v1764_14_1 / 0.25;
                end;
                local v3229 = l_v1326_18.screen.color:get();
                local v3230 = v137.screen_size() / 2;
                v3229.a = v3229.a * v3228;
                v137.line(vector(v3230.x - 10, v3230.y - 10), vector(v3230.x - 5, v3230.y - 5), v3229);
                v137.line(vector(v3230.x + 10, v3230.y - 10), vector(v3230.x + 5, v3230.y - 5), v3229);
                v137.line(vector(v3230.x + 10, v3230.y + 10), vector(v3230.x + 5, v3230.y + 5), v3229);
                v137.line(vector(v3230.x - 10, v3230.y + 10), vector(v3230.x - 5, v3230.y + 5), v3229);
                l_l_v1764_14_1 = math.max(l_l_v1764_14_1 - globals.frametime, 0);
                return;
            end;
        end;
        l_v1766_8 = function(v3231)
            -- upvalues: l_l_v1764_14_1 (ref)
            local v3232 = entity.get_local_player();
            local v3233 = entity.get(v3231.userid, true);
            local v3234 = entity.get(v3231.attacker, true);
            if v3233 == v3232 or v3234 ~= v3232 then
                return;
            else
                l_l_v1764_14_1 = 0.5;
                return;
            end;
        end;
        l_v1765_12 = v21("visuals_hit_markers.screen.on_render", l_v1765_12);
        l_v1766_8 = v21("visuals_hit_markers.screen.on_player_hurt", l_v1766_8);
        l_v1763_14.set = function(v3235)
            -- upvalues: l_l_v1764_14_1 (ref), l_v1765_12 (ref), l_v1766_8 (ref)
            if not v3235 then
                l_l_v1764_14_1 = 0;
            end;
            events.render(l_v1765_12, v3235);
            events.player_hurt(l_v1766_8, v3235);
        end;
    end;
    l_v1764_14 = {};
    v1765 = {};
    do
        local l_v1765_13, l_v1766_9, l_v1767_10 = v1765, v1766, v1767;
        l_v1766_9 = function()
            -- upvalues: l_v1326_18 (ref), l_v1765_13 (ref), v137 (ref)
            if not globals.is_in_game then
                return;
            else
                local l_realtime_1 = globals.realtime;
                local v3240 = ui.get_icon("snowflake");
                local v3241 = l_v1326_18.world.color:get();
                local v3242 = l_v1326_18.world.add_glow:get();
                for v3243 = #l_v1765_13, 1, -1 do
                    if l_v1765_13[v3243].time < l_realtime_1 then
                        table.remove(l_v1765_13, v3243);
                    end;
                end;
                for v3244 = 1, #l_v1765_13 do
                    local v3245 = l_v1765_13[v3244];
                    local v3246 = 1;
                    local v3247 = v3245.time - l_realtime_1;
                    if v3247 < 0.7 then
                        v3246 = v3247 / 0.7;
                    end;
                    local v3248 = v137.world_to_screen(v3245.point);
                    if v3248 ~= nil then
                        local v3249 = v3241:clone();
                        v3249.a = v3249.a * v3246;
                        if v3242 then
                            v137.shadow(v3248, v3248, v3249, 28);
                        end;
                        v137.text(1, v3248, v3249, "c", v3240);
                    end;
                end;
                return;
            end;
        end;
        l_v1767_10 = function(v3250)
            -- upvalues: l_v1765_13 (ref)
            local v3251 = globals.realtime + 3;
            table.insert(l_v1765_13, {
                time = v3251, 
                point = v3250.aim
            });
        end;
        l_v1766_9 = v21("visuals_hit_markers.world.on_render", l_v1766_9);
        l_v1767_10 = v21("visuals_hit_markers.world.on_aim_ack", l_v1767_10);
        l_v1764_14.set = function(v3252)
            -- upvalues: l_v1765_13 (ref), l_v1766_9 (ref), l_v1767_10 (ref)
            if not v3252 then
                for v3253 = 1, #l_v1765_13 do
                    l_v1765_13[v3253] = nil;
                end;
            end;
            events.render(l_v1766_9, v3252);
            events.aim_ack(l_v1767_10, v3252);
        end;
    end;
    v1765 = nil;
    v1766 = function(v3254)
        -- upvalues: l_v1762_13 (ref)
        l_v1762_13.set(v3254:get());
    end;
    v1767 = function(v3255)
        -- upvalues: l_v1763_14 (ref)
        l_v1763_14.set(v3255:get());
    end;
    v1768 = function(v3256)
        -- upvalues: l_v1764_14 (ref)
        l_v1764_14.set(v3256:get());
    end;
    do
        local l_v1766_10, l_v1767_11, l_v1768_9 = v1766, v1767, v1768;
        v1769 = function(v3260)
            -- upvalues: l_v1762_13 (ref), l_v1763_14 (ref), l_v1764_14 (ref), l_v1326_18 (ref), l_v1766_10 (ref), l_v1767_11 (ref), l_v1768_9 (ref)
            local v3261 = v3260:get();
            if not v3261 then
                l_v1762_13.set(false);
                l_v1763_14.set(false);
                l_v1764_14.set(false);
            end;
            if v3261 then
                l_v1326_18.kibit.enabled:set_callback(l_v1766_10, true);
                l_v1326_18.screen.enabled:set_callback(l_v1767_11, true);
                l_v1326_18.world.enabled:set_callback(l_v1768_9, true);
            else
                l_v1326_18.kibit.enabled:unset_callback(l_v1766_10);
                l_v1326_18.screen.enabled:unset_callback(l_v1767_11);
                l_v1326_18.world.enabled:unset_callback(l_v1768_9);
            end;
        end;
        l_v1326_18.enabled:set_callback(v1769, true);
    end;
end;
v5("visuals_skeet_indicators");
v1326 = nil;
v1762 = v151.visuals.skeet_indicators;
v1763 = 480;
v1764 = 8;
v1765 = 24;
v1766 = 4;
v1767 = 3;
v1768 = v137.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1769 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1770 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1771 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1772 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v1773 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
v1774 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v1775 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v1776 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v1777 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v1778 = 0;
v1779 = 0;
v1780 = 100;
v1781 = {};
v1781.__index = v1781;
v1781.new = function(v3262, v3263, v3264)
    return setmetatable({
        id = v3263, 
        size = v3264
    }, v3262);
end;
v1781.draw = function(v3265, v3266, v3267, ...)
    -- upvalues: v137 (ref)
    v137.texture(v3265.id, v3266, v3265.size, v3267, ...);
end;
v1783 = {
    bomb_c4 = v1781:new(({
        bomb_c4 = v137.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
    }).bomb_c4, vector(32, 29))
};
v1785 = function(v3268)
    local v3269 = v3268:get_override();
    if v3269 ~= nil then
        return v3269;
    else
        return v3268:get();
    end;
end;
local function v3272(v3270)
    -- upvalues: v509 (ref)
    local v3271 = v509.get(v3270);
    return v3271 ~= nil and v3271.active;
end;
local function v3278(v3273, v3274)
    local v3275 = 0.5;
    local v3276 = 0.5;
    if v3274 > 0 then
        local v3277 = v3273 * v3275;
        if v3274 < (v3273 - v3277) * v3276 then
            v3277 = v3273 - v3274 * (1 / v3276);
        end;
        v3273 = v3277;
    end;
    return v3273;
end;
do
    local l_v1762_14, l_v1763_15, l_v1764_15, l_v1765_14, l_v1766_11, l_v1767_12, l_v1768_10, l_v1769_9, l_v1770_9, l_v1771_7, l_v1772_7, l_v1773_6, l_v1774_5, l_v1775_6, l_v1776_3, l_v1777_3, l_v1778_1, l_v1779_2, l_v1780_2, l_v1783_1, l_v1785_1, l_v3272_0, l_v3278_0 = v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v1770, v1771, v1772, v1773, v1774, v1775, v1776, v1777, v1778, v1779, v1780, v1783, v1785, v3272, v3278;
    local function v3310(v3302, v3303)
        -- upvalues: l_v3278_0 (ref)
        local v3304 = 1;
        local v3305 = 500;
        local v3306 = v3305 * 3.5;
        local v3307 = (v3303:get_origin() - v3302:get_eye_position()):length();
        local v3308 = v3306 / 3;
        local v3309 = v3305 * math.exp(-v3307 * v3307 / (2 * v3308 * v3308)) * v3304;
        return l_v3278_0(v3309, v3302.m_ArmorValue);
    end;
    local v3311 = {};
    local v3312 = 0;
    local v3313 = 0;
    local v3314 = 0;
    local v3315 = 0;
    local v3316 = 0;
    local v3317 = 0;
    local v3318 = 0;
    local v3319 = 0;
    local v3320 = 0;
    local v3321 = 0;
    local function v3325(v3322, v3323, v3324)
        -- upvalues: l_v1762_14 (ref), l_play_0 (ref)
        if l_v1762_14.style:get() == "Old" then
            return v3323 and 1 or 0;
        else
            return l_play_0.interp(v3322, v3323, v3324);
        end;
    end;
    local function v3327()
        -- upvalues: v3311 (ref)
        for v3326 = 1, #v3311 do
            v3311[v3326] = nil;
        end;
    end;
    local function v3333(v3328)
        -- upvalues: l_v1762_14 (ref), v137 (ref), l_v1768_10 (ref), l_v1766_11 (ref), v3311 (ref), l_v1763_15 (ref), l_v1764_15 (ref)
        if l_v1762_14.style:get() == "Old" then
            v3328.icon = nil;
        end;
        if v3328.alpha == nil then
            v3328.alpha = 1;
        end;
        local v3329 = v137.measure_text(l_v1768_10, nil, v3328.text);
        local v3330 = v137.screen_size();
        v3329.y = v3329.y + l_v1766_11 * 2;
        local v3331 = v3311[#v3311];
        local v3332 = v3331 == nil and v3330.y - (v3330.y - l_v1763_15) / 2 or v3331.offset - (v3331.text_size.y + l_v1764_15) * v3331.alpha;
        v3328.offset = v3332;
        v3328.text_size = v3329;
        table.insert(v3311, v3328);
        return v3332;
    end;
    local function v3338(v3334, v3335, v3336, v3337)
        -- upvalues: v3333 (ref)
        return v3333({
            color = v3334, 
            text = v3336, 
            icon = v3335, 
            alpha = v3337
        });
    end;
    local function v3360(_)
        -- upvalues: l_v1762_14 (ref), l_v3272_0 (ref), l_v1774_5 (ref), l_v1785_1 (ref), l_v1777_3 (ref), l_v1775_6 (ref), l_v1776_3 (ref), l_v1772_7 (ref), l_v1773_6 (ref), l_v1770_9 (ref), l_v1771_7 (ref), l_v1769_9 (ref), v3312 (ref), v3325 (ref), v3313 (ref), v3314 (ref), v3315 (ref), v3316 (ref), v3317 (ref), v3318 (ref), v3319 (ref), v3320 (ref), v3321 (ref), v3338 (ref), l_v1780_2 (ref)
        local _ = l_v1762_14.style:get() == "New";
        local v3341 = l_v3272_0(l_v1774_5);
        local v3342 = l_v1785_1(l_v1777_3) > 0;
        local v3343 = l_v1785_1(l_v1775_6);
        local v3344 = l_v1785_1(l_v1776_3);
        local v3345 = l_v1785_1(l_v1772_7) == "Force";
        local v3346 = l_v1785_1(l_v1773_6) == "Force";
        local v3347 = l_v1785_1(l_v1770_9) and not v3343;
        local v3348 = l_v1785_1(l_v1771_7) and not v3343 and not v3347;
        local v3349 = l_v1785_1(l_v1769_9);
        v3312 = v3325(v3312, v3342 and l_v1762_14.list:get("Fake Latency"), 0.05);
        v3313 = v3325(v3313, v3348 and l_v1762_14.list:get("Hide Shots"), 0.05);
        v3314 = v3325(v3314, v3347 and l_v1762_14.list:get("Double Tap"), 0.05);
        v3315 = v3325(v3315, v3349 and l_v1762_14.list:get("Dormant Aimbot"), 0.05);
        v3316 = v3325(v3316, v3343 and l_v1762_14.list:get("Fake Duck"), 0.05);
        v3317 = v3325(v3317, v3346 and l_v1762_14.list:get("Force Safe Points"), 0.05);
        v3318 = v3325(v3318, v3345 and l_v1762_14.list:get("Force Body Aim"), 0.05);
        v3319 = v3325(v3319, v3341 and l_v1762_14.list:get("Min. Damage"), 0.05);
        v3320 = v3325(v3320, v3344 and l_v1762_14.list:get("Freestanding"), 0.05);
        v3321 = v3325(v3321, l_v1762_14.list:get("Hit/Miss Ratio"), 0.05);
        local v3350 = color(255, 255, 255, 200);
        local v3351 = color(255, 0, 50, 255);
        if v3312 > 0 then
            local v3352 = v3350:clone();
            local v3353 = utils.net_channel();
            if v3353 ~= nil then
                local v3354 = l_v1785_1(l_v1777_3);
                local v3355 = math.clamp(v3353.latency[0] + v3353.latency[1], 0.001, 0.2);
                local v3356 = math.clamp(v3354 * 0.001 + v3353.avg_latency[1], 0.001, 0.2);
                local v3357 = math.clamp(v3355 / v3356, 0, 1);
                if v3357 < 0.5 then
                    v3352 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v3357 * 2);
                else
                    v3352 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v3357 - 0.5) * 2);
                end;
            end;
            v3338(v3352, ui.get_icon("sun"), "PING", v3312);
        end;
        if v3313 > 0 then
            v3338(v3350, ui.get_icon("eye-slash"), "OSAA", v3313);
        end;
        if v3314 > 0 then
            local v3358 = ui.get_icon("xmark");
            local v3359 = v3351:clone();
            if rage.exploit:get() == 1 then
                v3358 = ui.get_icon("arrows-cross");
                v3359 = v3350:clone();
            end;
            v3338(v3359, v3358, "DT", v3314);
        end;
        if v3315 > 0 then
            v3338(v3350, ui.get_icon("eye"), "DA", v3315);
        end;
        if v3316 > 0 then
            v3338(v3350, ui.get_icon("wheelchair"), "DUCK", v3316);
        end;
        if v3317 > 0 then
            v3338(v3350, ui.get_icon("shield"), "SAFE", v3317);
        end;
        if v3318 > 0 then
            v3338(v3350, ui.get_icon("bullseye-arrow"), "BODY", v3318);
        end;
        if v3319 > 0 then
            v3338(v3350, ui.get_icon("dial-min"), "MD", v3319);
        end;
        if v3320 > 0 then
            v3338(v3350, ui.get_icon("arrows-turn-right"), "FS", v3320);
        end;
        if v3321 > 0 then
            v3338(v3350, ui.get_icon("wave-pulse"), l_v1780_2 .. "%", v3321);
        end;
    end;
    local function v3370(v3361, v3362)
        -- upvalues: v3333 (ref), l_v1783_1 (ref)
        local v3363 = v3362:get_player_weapon();
        if v3363 == nil then
            return;
        elseif not v3363.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v3363.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v3365 = v3362:get_origin();
                local l_m_bombsiteCenterA_0 = v3361.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v3361.m_bombsiteCenterB;
                local v3368 = v3365:distsqr(l_m_bombsiteCenterA_0) < v3365:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v3369 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v3333({
                    text = v3368, 
                    color = color(252, 243, 105, 255), 
                    progress = 1 - v3369, 
                    draw_cmd = l_v1783_1.bomb_c4
                });
                return;
            end;
        end;
    end;
    local function v3385(v3371, v3372)
        -- upvalues: v137 (ref), v3333 (ref), l_v1783_1 (ref), v3310 (ref), v3338 (ref)
        local l_m_bBombDefused_0 = v3372.m_bBombDefused;
        if not v3372.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local l_m_flC4Blow_0 = v3372.m_flC4Blow;
            local v3376 = l_m_flC4Blow_0 - l_curtime_0;
            if v3376 > 0 then
                if v3372.m_hBombDefuser ~= nil then
                    local v3377 = v137.screen_size();
                    local l_m_flDefuseCountDown_0 = v3372.m_flDefuseCountDown;
                    local v3379 = (l_m_flDefuseCountDown_0 - l_curtime_0) / 10;
                    local v3380 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v3381 = (v3377.y - 2) * (1 - v3379);
                    v137.rect(vector(0, 0), vector(20, v3377.y), color(0, 0, 0, 115));
                    v137.rect(vector(1, 1 + v3381), vector(19, v3377.y - 1), v3380);
                end;
                local v3382 = string.format("%s - %.1fs", v3372.m_nBombSite == 1 and "B" or "A", v3376);
                v3333({
                    text = v3382, 
                    color = color(255, 255, 255, 200), 
                    draw_cmd = l_v1783_1.bomb_c4
                });
            end;
            local l_m_iHealth_5 = v3371.m_iHealth;
            local v3384 = v3310(v3371, v3372);
            v3384 = math.floor(v3384);
            if l_m_iHealth_5 <= v3384 then
                v3338(color(255, 0, 50, 255), nil, "FATAL");
            elseif v3384 > 0 then
                v3338(color(252, 243, 105, 255), nil, string.format("-%d HP", v3384));
            end;
            return;
        end;
    end;
    local function v3393(v3386)
        -- upvalues: v3370 (ref), v3385 (ref)
        local v3387 = entity.get_game_rules();
        if v3387 == nil then
            return;
        else
            local v3388 = entity.get_player_resource();
            if v3388 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v3387.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v3388.m_iPlayerC4;
                if l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v3391 = entity.get(l_m_iPlayerC4_0);
                    if v3391 ~= nil then
                        v3370(v3388, v3391);
                    end;
                end;
                if l_m_bBombPlanted_0 then
                    local v3392 = entity.get_entities("CPlantedC4")[1];
                    if v3392 ~= nil then
                        v3385(v3386, v3392);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v3395()
        -- upvalues: v3360 (ref), l_v1762_14 (ref), v3393 (ref)
        local v3394 = entity.get_local_player();
        if v3394 == nil then
            return;
        else
            if v3394:is_alive() then
                v3360(v3394);
            end;
            if l_v1762_14.list:get("Bomb Information") then
                v3393(v3394);
            end;
            return;
        end;
    end;
    local function v3402(v3396, v3397, v3398)
        -- upvalues: v137 (ref)
        local v3399 = (v3396 + v3397) / 2;
        local v3400 = color(0, 0, 0, 0 * v3398);
        local v3401 = color(0, 0, 0, 50 * v3398);
        v137.gradient(v3396, vector(v3399.x, v3397.y), v3400, v3401, v3400, v3401);
        v137.gradient(v3397, vector(v3399.x, v3396.y), v3400, v3401, v3400, v3401);
    end;
    local function _(v3403, v3404, v3405)
        -- upvalues: v137 (ref)
        local v3406 = color(0, 0, 0, 50 * v3405);
        local v3407 = color(0, 0, 0, 0 * v3405);
        v137.gradient(v3403, v3404, v3406, v3407, v3406, v3407);
    end;
    local function v3415(v3409, v3410, v3411, v3412, v3413, v3414)
        -- upvalues: v137 (ref)
        v137.circle_outline(v3409, color(0, 0, 0, 255), v3411, v3412, 1, v3414);
        v137.circle_outline(v3409, v3410, v3411 - 1, v3412, v3413, v3414 - 2);
    end;
    local function v3438()
        -- upvalues: l_v1762_14 (ref), l_v1767_12 (ref), l_v1765_14 (ref), v3311 (ref), l_v1766_11 (ref), v137 (ref), l_v1768_10 (ref), v3402 (ref), v3415 (ref)
        local v3416 = l_v1762_14.style:get() == "New";
        local v3417 = v3416 and 5 or l_v1767_12;
        local v3418 = v3416 and 10 or l_v1765_14;
        for v3419 = 1, #v3311 do
            local v3420 = v3311[v3419];
            if v3420.color ~= nil then
                local l_color_1 = v3420.color;
                local l_icon_0 = v3420.icon;
                local l_text_1 = v3420.text;
                local l_alpha_1 = v3420.alpha;
                local l_draw_cmd_0 = v3420.draw_cmd;
                local l_progress_0 = v3420.progress;
                local v3427 = vector(v3417, v3420.offset);
                local v3428 = v3427 + vector(v3418, l_v1766_11);
                local v3429 = v3420.text_size + vector(50);
                local v3430 = v137.measure_text(l_v1768_10, "", l_icon_0);
                v3428.y = v3428.y + 2;
                if l_draw_cmd_0 ~= nil then
                    v3429.x = v3429.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_icon_0 ~= nil then
                    v3429.x = v3429.x + v3430.x + 5;
                end;
                if l_progress_0 ~= nil then
                    v3429.x = v3429.x + 30;
                end;
                local v3431 = color(0, 0, 0, 128);
                local v3432 = l_color_1:clone();
                v3431.a = v3431.a * l_alpha_1;
                v3432.a = v3432.a * l_alpha_1;
                v3402(v3427, v3427 + v3429, l_alpha_1);
                if l_draw_cmd_0 ~= nil then
                    local v3433 = v3428:clone();
                    v3433.y = v3427.y + (v3429.y - l_draw_cmd_0.size.y) / 2;
                    l_draw_cmd_0:draw(v3433, l_color_1, "f");
                    v3428.x = v3428.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_icon_0 ~= nil then
                    v137.text(l_v1768_10, v3428 + 1, v3431, "", l_icon_0);
                    v137.text(l_v1768_10, v3428, v3432, "", l_icon_0);
                    v3428.x = v3428.x + v3430.x + 5;
                end;
                v137.text(l_v1768_10, v3428 + 1, v3431, "", l_text_1);
                v137.text(l_v1768_10, v3428, v3432, "", l_text_1);
                v3428.x = v3428.x + v3420.text_size.x;
                if l_progress_0 ~= nil then
                    local v3434 = v3428.x + 10 / 2 + 12;
                    local v3435 = v3427.y + v3429.y / 2;
                    local v3436 = vector(v3434, v3435);
                    local v3437 = color(255, 255, 255, 200);
                    v3437.a = v3437.a * l_alpha_1;
                    v3415(v3436, v3437, 10, 0, l_progress_0, 5);
                end;
            end;
        end;
    end;
    on_render = function()
        -- upvalues: v3395 (ref), v3438 (ref), v3327 (ref)
        if globals.is_in_game then
            v3395();
            v3438();
        end;
        v3327();
    end;
    local function v3440(v3439)
        -- upvalues: l_v1778_1 (ref), l_v1779_2 (ref), l_v1780_2 (ref)
        l_v1778_1 = l_v1778_1 + 1;
        if v3439.state == nil then
            l_v1779_2 = l_v1779_2 + 1;
        end;
        l_v1780_2 = math.floor(l_v1779_2 / math.max(1, l_v1778_1) * 100);
    end;
    on_render = v21("screen_indicators.on_render", on_render);
    v3440 = v21("screen_indicators.on_aim_ack", v3440);
    local function v3442(v3441)
        -- upvalues: v3440 (ref)
        events.render(on_render, v3441);
        events.aim_ack(v3440, v3441);
    end;
    local _ = nil;
    local function v3445(v3444)
        -- upvalues: v3442 (ref)
        v3442(v3444:get());
    end;
    l_v1762_14.enabled:set_callback(v3445, true);
end;
v5("begin_misc");
v1183 = nil;
v5("misc_super_toss");
v1189 = nil;
v1219 = v151.misc.grenades;
v1220 = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions");
l_match_0 = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe");
v1307 = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist");
l_angles_0 = 0.3;
v1309 = function(v3446, v3447, v3448)
    return v3446 + v3448 * (v3447 - v3446);
end;
do
    local l_v1220_9, l_l_match_0_10, l_v1307_9, l_l_angles_0_11, l_v1309_13, l_v1319_14, l_v1320_15, l_v1321_18 = v1220, l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321;
    l_v1319_14 = function(v3457, v3458, v3459, v3460)
        -- upvalues: l_v1309_13 (ref), l_l_angles_0_11 (ref)
        v3457.x = v3457.x - 10 + math.abs(v3457.x) / 9;
        local v3461 = vector():angles(v3457);
        local v3462 = v3460 * 1.25;
        local v3463 = math.clamp(v3458 * 0.9, 15, 750);
        local v3464 = math.clamp(v3459, 0, 1);
        v3463 = v3463 * l_v1309_13(l_l_angles_0_11, 1, v3464);
        local l_v3461_0 = v3461;
        for _ = 1, 8 do
            l_v3461_0 = (v3461 * (l_v3461_0 * v3463 + v3462):length() - v3462) / v3463;
            l_v3461_0:normalize();
        end;
        local v3467 = l_v3461_0.angles(l_v3461_0);
        if v3467.x > -10 then
            v3467.x = 0.9 * v3467.x + 9;
        else
            v3467.x = 1.125 * v3467.x + 11.25;
        end;
        return v3467;
    end;
    l_v1320_15 = function(v3468)
        -- upvalues: l_v1319_14 (ref)
        local v3469 = entity.get_local_player();
        if v3469 == nil then
            return;
        else
            local v3470 = v3469:get_player_weapon();
            if v3470 == nil then
                return;
            else
                local v3471 = v3470:get_weapon_info();
                if v3471 == nil then
                    return;
                else
                    v3468.angles = l_v1319_14(v3468.angles, v3471.throw_velocity, v3470.m_flThrowStrength, v3468.velocity);
                    return;
                end;
            end;
        end;
    end;
    l_v1321_18 = v21("misc_super_toss.on_createmove", function(v3472)
        -- upvalues: l_l_match_0_10 (ref), l_v1307_9 (ref), l_v1220_9 (ref), l_v1319_14 (ref)
        l_l_match_0_10:override();
        l_v1307_9:override();
        l_v1220_9:override();
        if v3472.jitter_move ~= true then
            return;
        else
            local v3473 = entity.get_local_player();
            if v3473 == nil then
                return;
            else
                local v3474 = v3473:get_player_weapon();
                if v3474 == nil then
                    return;
                else
                    local v3475 = v3474:get_weapon_info();
                    if v3475 == nil or v3475.weapon_type ~= 9 then
                        return;
                    elseif v3474.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                        return;
                    else
                        v3472.in_speed = true;
                        local v3476 = v3473:simulate_movement();
                        v3476:think();
                        v3472.view_angles = l_v1319_14(v3472.view_angles, v3475.throw_velocity, v3474.m_flThrowStrength, v3476.velocity);
                        l_l_match_0_10:override(false);
                        l_v1307_9:override(false);
                        l_v1220_9:override("");
                        return;
                    end;
                end;
            end;
        end;
    end);
    l_v1320_15 = v21("misc_super_toss.on_grenade_override_view", l_v1320_15);
    v1323 = nil;
    v1326 = function(v3477)
        -- upvalues: l_v1321_18 (ref), l_v1320_15 (ref)
        local v3478 = v3477:get(1);
        events.createmove(l_v1321_18, v3478);
        events.grenade_override_view(l_v1320_15, v3478);
    end;
    v1219.select:set_callback(v1326, true);
end;
v5("misc_grenade_release");
v1219 = nil;
v1220 = v151.misc.grenades;
l_match_0 = nil;
do
    local l_v1220_10, l_l_match_0_11, l_v1307_10, l_l_angles_0_12 = v1220, l_match_0, v1307, l_angles_0;
    l_v1307_10 = function(v3483)
        -- upvalues: l_l_match_0_11 (ref), l_v1220_10 (ref)
        local v3484 = entity.get_local_player();
        if v3484 == nil then
            return;
        else
            local v3485 = v3484:get_player_weapon();
            if v3485 == nil then
                return;
            elseif not (v3485.m_bPinPulled and v3485.m_flThrowStrength > 0) then
                return;
            else
                if l_l_match_0_11 ~= nil and l_l_match_0_11 >= l_v1220_10.release_damage:get() then
                    v3483.in_attack = false;
                    v3483.in_attack2 = false;
                end;
                l_l_match_0_11 = nil;
                return;
            end;
        end;
    end;
    l_l_angles_0_12 = function(v3486)
        -- upvalues: l_l_match_0_11 (ref)
        l_l_match_0_11 = v3486.damage;
    end;
    l_v1307_10 = v21("misc_grenade_release.on_createmove", l_v1307_10);
    l_l_angles_0_12 = v21("misc_grenade_release.on_grenade_prediction", l_l_angles_0_12);
    v1309 = nil;
    v1319 = function(v3487)
        -- upvalues: l_v1307_10 (ref), l_l_angles_0_12 (ref)
        local v3488 = v3487:get(2);
        events.createmove(l_v1307_10, v3488);
        events.grenade_prediction(l_l_angles_0_12, v3488);
    end;
    l_v1220_10.select:set_callback(v1319, true);
end;
v5("misc_drop_nades");
v1220 = nil;
l_match_0 = v151.misc.grenades;
v1307 = {};
l_angles_0 = false;
v1309 = nil;
do
    local l_l_match_0_12, l_v1307_11, l_l_angles_0_13, l_v1309_14, l_v1319_15, l_v1320_16, l_v1321_19, l_v1323_20, l_v1326_19, l_v1762_15 = l_match_0, v1307, l_angles_0, v1309, v1319, v1320, v1321, v1323, v1326, v1762;
    l_v1319_15 = function(v3499)
        -- upvalues: l_l_match_0_12 (ref)
        if v3499 == "weapon_incgrenade" or v3499 == "weapon_molotov" then
            return l_l_match_0_12.drop_nades_select:get(1);
        elseif v3499 == "weapon_smokegrenade" then
            return l_l_match_0_12.drop_nades_select:get(2);
        elseif v3499 == "weapon_hegrenade" then
            return l_l_match_0_12.drop_nades_select:get(3);
        else
            return false;
        end;
    end;
    l_v1320_16 = function(v3500)
        -- upvalues: l_v1319_15 (ref)
        local v3501 = v3500:get_weapon_info();
        if v3501.weapon_type ~= 9 then
            return false;
        elseif not l_v1319_15(v3501.console_name) then
            return false;
        else
            return true;
        end;
    end;
    l_v1321_19 = function()
        -- upvalues: l_v1307_11 (ref)
        for v3502 = 1, #l_v1307_11 do
            l_v1307_11[v3502] = nil;
        end;
    end;
    l_v1323_20 = function(v3503)
        -- upvalues: l_v1320_16 (ref), l_v1307_11 (ref)
        local v3504 = v3503:get_player_weapon(true);
        for v3505 = 1, #v3504 do
            local v3506 = v3504[v3505];
            if l_v1320_16(v3506) then
                table.insert(l_v1307_11, v3506);
            end;
        end;
    end;
    l_v1326_19 = v21("misc_drop_nades.on_createmove", function(v3507)
        -- upvalues: l_l_match_0_12 (ref), l_v1309_14 (ref), l_l_angles_0_13 (ref), l_v1321_19 (ref), l_v1323_20 (ref), l_v1307_11 (ref)
        local v3508 = entity.get_local_player();
        if v3508 == nil then
            return;
        elseif v3508:get_player_weapon() == nil then
            return;
        else
            local v3509 = l_l_match_0_12.drop_nades_bind:get();
            if l_v1309_14 ~= v3509 then
                l_v1309_14 = v3509;
                if v3509 and not l_l_angles_0_13 then
                    l_v1321_19();
                    l_v1323_20(v3508);
                    l_l_angles_0_13 = next(l_v1307_11) ~= nil;
                end;
            end;
            local v3510 = utils.net_channel();
            local v3511 = to_time(4);
            if v3510 ~= nil then
                v3511 = v3511 + v3510.latency[1];
            end;
            for v3512 = 1, #l_v1307_11 do
                local v3513 = l_v1307_11[v3512];
                do
                    if v3513 ~= nil then
                        local v3514 = v3513:get_weapon_info();
                        if v3514 ~= nil then
                            local v3515 = v3512 == #l_v1307_11;
                            utils.execute_after(v3511 * v3512, function()
                                -- upvalues: v3514 (ref), v3515 (ref), l_l_angles_0_13 (ref)
                                utils.console_exec(string.format("use %s; drop", v3514.console_name));
                                if v3515 then
                                    utils.execute_after(0.1, function()
                                        -- upvalues: l_l_angles_0_13 (ref)
                                        l_l_angles_0_13 = false;
                                    end);
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            l_v1321_19();
            if l_l_angles_0_13 then
                v3507.in_use = true;
                v3507.no_choke = true;
                v3507.send_packet = true;
            end;
            return;
        end;
    end);
    l_v1762_15 = function(v3516)
        -- upvalues: l_v1321_19 (ref), l_v1326_19 (ref)
        if not v3516 then
            l_v1321_19();
        end;
        events.createmove(l_v1326_19, v3516);
    end;
    v1763 = nil;
    v1764 = function(v3517)
        -- upvalues: l_v1762_15 (ref)
        l_v1762_15(v3517:get(3));
    end;
    l_l_match_0_12.select:set_callback(v1764, true);
end;
v5("misc_ping_spike");
l_match_0 = nil;
v1307 = v151.misc.ping_spike;
l_angles_0 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v1309 = cvar.sv_maxunlag;
do
    local l_v1307_12, l_l_angles_0_14, l_v1309_15, l_v1319_16, l_v1320_17, l_v1321_20 = v1307, l_angles_0, v1309, v1319, v1320, v1321;
    l_v1319_16 = function()
        -- upvalues: l_l_angles_0_14 (ref), l_v1309_15 (ref)
        l_l_angles_0_14:override();
        l_l_angles_0_14:disabled(false);
        l_v1309_15:float(tonumber(l_v1309_15:string()), true);
    end;
    l_v1320_17 = function(v3524)
        -- upvalues: l_l_angles_0_14 (ref), l_v1309_15 (ref)
        l_l_angles_0_14:override(v3524);
        l_l_angles_0_14:disabled(true);
        l_v1309_15:float(0.4, true);
    end;
    l_v1321_20 = function()
        -- upvalues: l_v1319_16 (ref)
        l_v1319_16();
    end;
    on_render = v21("misc_ping_spike.on_render", on_render);
    l_v1321_20 = v21("misc_ping_spike.on_shutdown", l_v1321_20);
    v1323 = nil;
    v1326 = function(v3525)
        -- upvalues: l_v1320_17 (ref)
        l_v1320_17(v3525:get());
    end;
    do
        local l_v1326_20 = v1326;
        v1762 = function(v3527)
            -- upvalues: l_v1319_16 (ref), l_v1307_12 (ref), l_v1326_20 (ref), l_v1321_20 (ref)
            local v3528 = v3527:get();
            if not v3528 then
                l_v1319_16();
            end;
            if v3528 then
                l_v1307_12.value:set_callback(l_v1326_20, true);
            else
                l_v1307_12.value:unset_callback(l_v1326_20);
            end;
            events.shutdown(l_v1321_20, v3528);
        end;
        l_v1307_12.enabled:set_callback(v1762, true);
    end;
end;
v5("misc_unlock_fake_duck_speed");
v1307 = nil;
l_angles_0 = v151.misc.fake_duck;
v1309 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
on_createmove = v21("misc_unlock_fake_duck_speed.on_createmove", on_createmove);
do
    local l_v1309_16, l_v1319_17 = v1309, v1319;
    l_v1319_17 = function(v3531)
        -- upvalues: l_v1309_16 (ref)
        if not l_v1309_16:get() then
            return;
        else
            local v3532 = vector(v3531.forwardmove, v3531.sidemove);
            if v3532:length() < 2 then
                return;
            else
                v3532:normalize();
                v3531.forwardmove = v3532.x * 150;
                v3531.sidemove = v3532.y * 150;
                return;
            end;
        end;
    end;
    v1320 = nil;
    v1321 = function(v3533)
        -- upvalues: l_v1319_17 (ref)
        events.createmove_run(l_v1319_17, v3533:get(1));
    end;
    l_angles_0.select:set_callback(v1321, true);
end;
v5("misc_air_duck_collision");
l_angles_0 = nil;
v1309 = v151.misc.air_duck_collision;
v1319 = v21("misc_air_duck_collision.on_createmove", function(v3534)
    local v3535 = entity.get_local_player();
    if v3535 == nil then
        return;
    else
        local l_m_vecVelocity_3 = v3535.m_vecVelocity;
        local v3537 = v3535:simulate_movement();
        v3537:think();
        if l_m_vecVelocity_3.x < 30 or l_m_vecVelocity_3.z <= 0 then
            return;
        elseif not v3537.did_hit_collision then
            return;
        else
            v3534.in_duck = true;
            return;
        end;
    end;
end);
v1320 = nil;
do
    local l_v1319_18 = v1319;
    v1321 = function(v3539)
        -- upvalues: l_v1319_18 (ref)
        events.createmove(l_v1319_18, v3539:get());
    end;
    v1309.enabled:set_callback(v1321, true);
end;
v5("misc_freezetime_fake_duck");
v1309 = nil;
v1319 = v151.misc.fake_duck;
v1320 = 0;
v1321 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1323 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1326 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
do
    local l_v1320_18, l_v1321_21, l_v1323_21, l_v1326_21, l_v1762_16, l_v1763_16, l_v1764_16, l_v1765_15 = v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765;
    l_v1762_16 = function()
        -- upvalues: l_v1320_18 (ref)
        if l_v1320_18 >= 14 then
            l_v1320_18 = 0;
        end;
        l_v1320_18 = l_v1320_18 + 1;
    end;
    l_v1763_16 = function()
        -- upvalues: l_v1321_21 (ref), l_v1323_21 (ref)
        l_v1321_21:override();
        l_v1323_21:override();
    end;
    l_v1764_16 = function(v3548)
        -- upvalues: l_v1321_21 (ref), l_v1323_21 (ref), l_v1326_21 (ref), l_v1762_16 (ref), l_v1320_18 (ref)
        l_v1321_21:override();
        l_v1323_21:override();
        if not l_v1326_21:get() then
            return;
        else
            local v3549 = entity.get_game_rules();
            if v3549 == nil then
                return;
            elseif not v3549.m_bFreezePeriod then
                return;
            else
                l_v1762_16();
                v3548.in_duck = l_v1320_18 > 7;
                v3548.send_packet = l_v1320_18 == 14;
                l_v1321_21:override(false);
                l_v1323_21:override(false);
                return;
            end;
        end;
    end;
    l_v1765_15 = function(v3550)
        -- upvalues: l_v1326_21 (ref)
        if not l_v1326_21:get() then
            return;
        else
            local v3551 = entity.get_game_rules();
            if v3551 == nil then
                return;
            elseif not v3551.m_bFreezePeriod then
                return;
            else
                local v3552 = entity.get_local_player();
                if v3552 == nil then
                    return;
                else
                    local v3553 = v3552:get_origin();
                    v3550.camera.z = v3553.z + 64;
                    return;
                end;
            end;
        end;
    end;
    l_v1763_16 = v21("misc_freezetime_fake_duck.on_shutdown", l_v1763_16);
    l_v1764_16 = v21("misc_freezetime_fake_duck.on_createmove", l_v1764_16);
    l_v1765_15 = v21("misc_freezetime_fake_duck.on_override_view", l_v1765_15);
    v1766 = nil;
    v1767 = function(v3554)
        -- upvalues: l_v1321_21 (ref), l_v1323_21 (ref), l_v1763_16 (ref), l_v1764_16 (ref), l_v1765_15 (ref)
        local v3555 = v3554:get(2);
        if not v3555 then
            l_v1321_21:override();
            l_v1323_21:override();
        end;
        events.shutdown(l_v1763_16, v3555);
        events.createmove(l_v1764_16, v3555);
        events.override_view(l_v1765_15, v3555);
    end;
    v1319.select:set_callback(v1767, true);
end;
v5("misc_fps_optimize");
v1319 = nil;
v1320 = v151.misc.fps_optimize;
v1321 = false;
v1323 = {};
v1326 = function(v3556, v3557)
    return {
        convar = v3556, 
        old_value = nil, 
        new_value = v3557
    };
end;
v1323.Fog = {
    v1326(cvar.fog_enable, 0), 
    v1326(cvar.fog_enable_water_fog, 0)
};
v1323.Blood = {
    v1326(cvar.violence_hblood, 0)
};
v1323.Bloom = {
    v1326(cvar.mat_disable_bloom, 1)
};
v1323.Decals = {
    v1326(cvar.r_drawdecals, 0)
};
v1323.Shadows = {
    v1326(cvar.r_shadows, 0), 
    v1326(cvar.cl_csm_static_prop_shadows, 0), 
    v1326(cvar.cl_csm_shadows, 0), 
    v1326(cvar.cl_csm_world_shadows, 0), 
    v1326(cvar.cl_foot_contact_shadows, 0), 
    v1326(cvar.cl_csm_viewmodel_shadows, 0), 
    v1326(cvar.cl_csm_rope_shadows, 0), 
    v1326(cvar.cl_csm_sprite_shadows, 0), 
    v1326(cvar.cl_csm_translucent_shadows, 0), 
    v1326(cvar.cl_csm_entity_shadows, 0), 
    v1326(cvar.cl_csm_world_shadows_in_viewmodelcascad, 0)
};
v1323.Sprites = {
    v1326(cvar.r_drawsprites, 0)
};
v1323.Particles = {
    v1326(cvar.r_drawparticles, 0)
};
v1323.Ropes = {
    v1326(cvar.r_drawropes, 0)
};
v1323["Dynamic lights"] = {
    v1326(cvar.mat_disable_fancy_blending, 1)
};
v1323["Map details"] = {
    v1326(cvar.func_break_max_pieces, 0), 
    v1326(cvar.props_break_max_pieces, 0)
};
v1323["Weapon effects"] = {
    v1326(cvar.muzzleflash_light, 0), 
    v1326(cvar.r_drawtracers_firstperson, 0)
};
do
    local l_v1320_19, l_v1321_22, l_v1323_22, l_v1326_22, l_v1762_17, l_v1763_17, l_v1764_17, l_v1765_16 = v1320, v1321, v1323, v1326, v1762, v1763, v1764, v1765;
    l_v1326_22 = function()
        -- upvalues: l_v1320_19 (ref), v152 (ref)
        if l_v1320_19.always_on:get() then
            return true;
        elseif v152.is_peeking and l_v1320_19.detections:get("Peeking") then
            return true;
        elseif v152.is_vulnerable and l_v1320_19.detections:get("Hit Flag") then
            return true;
        else
            return false;
        end;
    end;
    l_v1762_17 = function()
        -- upvalues: l_v1321_22 (ref), l_v1323_22 (ref)
        if not l_v1321_22 then
            return;
        else
            for _, v3567 in pairs(l_v1323_22) do
                for v3568 = 1, #v3567 do
                    local v3569 = v3567[v3568];
                    local l_convar_0 = v3569.convar;
                    if v3569.old_value ~= nil then
                        l_convar_0:int(v3569.old_value);
                        v3569.old_value = nil;
                    end;
                end;
            end;
            l_v1321_22 = false;
            return;
        end;
    end;
    l_v1763_17 = function()
        -- upvalues: l_v1321_22 (ref), l_v1320_19 (ref), l_v1323_22 (ref)
        if l_v1321_22 then
            return;
        else
            local v3571 = l_v1320_19.select:get();
            for v3572 = 1, #v3571 do
                local v3573 = l_v1323_22[v3571[v3572]];
                for v3574 = 1, #v3573 do
                    local v3575 = v3573[v3574];
                    local l_convar_1 = v3575.convar;
                    if l_convar_1 ~= nil and v3575.old_value == nil then
                        v3575.old_value = l_convar_1:int();
                        l_convar_1:int(v3575.new_value);
                    end;
                end;
            end;
            l_v1321_22 = true;
            return;
        end;
    end;
    l_v1764_17 = function()
        -- upvalues: l_v1762_17 (ref)
        l_v1762_17();
    end;
    l_v1765_16 = function()
        -- upvalues: l_v1326_22 (ref), l_v1762_17 (ref), l_v1763_17 (ref)
        if not l_v1326_22() then
            return l_v1762_17();
        else
            l_v1763_17();
            return;
        end;
    end;
    l_v1764_17 = v21("misc_fps_optimize.on_shutdown", l_v1764_17);
    l_v1765_16 = v21("misc_fps_optimize.on_net_update_end", l_v1765_16);
    v1766 = nil;
    v1767 = function(_)
        -- upvalues: l_v1762_17 (ref), l_v1763_17 (ref)
        l_v1762_17();
        l_v1763_17();
    end;
    do
        local l_v1767_13 = v1767;
        v1768 = function(v3579)
            -- upvalues: l_v1320_19 (ref), l_v1767_13 (ref), l_v1762_17 (ref), l_v1764_17 (ref), l_v1765_16 (ref)
            local v3580 = v3579:get();
            if v3580 then
                l_v1320_19.select:set_callback(l_v1767_13, true);
            else
                l_v1320_19.select:unset_callback(l_v1767_13);
            end;
            if not v3580 then
                l_v1762_17();
            end;
            events.shutdown(l_v1764_17, v3580);
            events.net_update_end(l_v1765_16, v3580);
        end;
        l_v1320_19.enabled:set_callback(v1768, true);
    end;
end;
v5("misc_unmute_mute_silenced");
v1320 = nil;
v1321 = v151.misc.unmute_mute_silenced;
v1323 = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int)");
do
    local l_v1321_23, l_v1323_23, l_v1326_23, l_v1762_18 = v1321, v1323, v1326, v1762;
    l_v1326_23 = function(v3585)
        -- upvalues: l_v1323_23 (ref)
        local v3586 = entity.get_players();
        for v3587 = 1, #v3586 do
            local v3588 = v3586[v3587];
            if (v3585 ~= "Enemies" or v3588:is_enemy()) and (v3585 ~= "Teammates" or not v3588:is_enemy()) then
                l_v1323_23(v3588:get_index());
            end;
        end;
    end;
    l_v1762_18 = v21("misc_unmute_mute_silenced.on_player_connect_full", function(_)
        -- upvalues: l_v1326_23 (ref), l_v1321_23 (ref)
        l_v1326_23(l_v1321_23.mode:get());
    end);
    v1763 = nil;
    v1764 = function(v3590)
        -- upvalues: l_v1326_23 (ref), l_v1762_18 (ref)
        local v3591 = v3590:get();
        local v3592 = v3591 ~= "Disabled";
        if v3592 then
            l_v1326_23(v3591);
        end;
        events.player_connect_full(l_v1762_18, v3592);
    end;
    l_v1321_23.mode:set_callback(v1764, true);
end;
v5("misc_nickname_generator");
v1321 = nil;
v1323 = v151.misc.nickname_generator;
v1326 = cvar.name;
v1762 = nil;
v1763 = {
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
    local l_v1323_24, l_v1326_24, l_v1762_19, l_v1763_18, l_v1764_18, l_v1765_17 = v1323, v1326, v1762, v1763, v1764, v1765;
    l_v1764_18 = function()
        -- upvalues: l_v1762_19 (ref)
        if l_v1762_19 == nil then
            return;
        else
            common.set_name(l_v1762_19);
            l_v1762_19 = nil;
            return;
        end;
    end;
    l_v1765_17 = v21("misc_nickname.on_shutdown", function()
        -- upvalues: l_v1764_18 (ref)
        l_v1764_18();
    end);
    v1766 = nil;
    v1767 = function()
        -- upvalues: l_v1762_19 (ref), l_v1326_24 (ref), l_v1323_24 (ref), l_v1765_17 (ref)
        if l_v1762_19 == nil then
            l_v1762_19 = l_v1326_24:string();
        end;
        common.set_name(l_v1323_24.input:get());
        events.shutdown(l_v1765_17, true);
    end;
    v1768 = function()
        -- upvalues: l_v1764_18 (ref), l_v1765_17 (ref)
        l_v1764_18();
        events.shutdown(l_v1765_17, false);
    end;
    v1769 = function()
        -- upvalues: l_v1763_18 (ref), l_v1323_24 (ref)
        local v3599 = l_v1763_18[math.random(1, #l_v1763_18)];
        if v3599 ~= nil then
            l_v1323_24.input:set(v3599);
        end;
    end;
    l_v1323_24.set_button:set_callback(v1767);
    l_v1323_24.reset_button:set_callback(v1768);
    l_v1323_24.generate_button:set_callback(v1769);
end;
v5("misc_no_fall_damage");
v1323 = nil;
v1326 = v151.misc.no_fall_damage;
v1762 = false;
v1763 = function(v3600, v3601)
    local v3602 = v3600:get_origin();
    for v3603 = 0, math.pi * 2, math.pi * 2 / 8 do
        local v3604 = math.sin(v3603);
        local v3605 = math.cos(v3603);
        local v3606 = v3602 + vector(10 * v3605, 10 * v3604, 0);
        local v3607 = v3606 - vector(0, 0, v3601);
        if utils.trace_line(v3606, v3607, v3600).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v1762_20, l_v1763_19, l_v1764_19 = v1762, v1763, v1764;
    l_v1764_19 = v21("misc_no_fall_damage.on_createmove", function(v3611)
        -- upvalues: l_v1762_20 (ref), l_v1763_19 (ref)
        local v3612 = entity.get_local_player();
        if v3612 == nil then
            return;
        else
            if v3612.m_vecVelocity.z >= -500 then
                l_v1762_20 = false;
            elseif l_v1763_19(v3612, 15) then
                l_v1762_20 = false;
            elseif l_v1763_19(v3612, 75) then
                l_v1762_20 = true;
            end;
            if v3612.m_vecVelocity.z < -500 then
                v3611.in_duck = l_v1762_20;
            end;
            return;
        end;
    end);
    v1765 = nil;
    v1766 = function(v3613)
        -- upvalues: l_v1764_19 (ref)
        events.createmove(l_v1764_19, v3613:get());
    end;
    v1326.enabled:set_callback(v1766, true);
end;
v5("misc_fast_ladder");
v1326 = nil;
v1762 = v151.misc.fast_ladder;
v1763 = 9;
do
    local l_v1763_20, l_v1764_20 = v1763, v1764;
    l_v1764_20 = v21("misc_fast_ladder.on_createmove", function(v3616)
        -- upvalues: l_v1763_20 (ref), v137 (ref), v17 (ref)
        local v3617 = entity.get_local_player();
        if v3617 == nil then
            return;
        elseif v3617.m_MoveType ~= l_v1763_20 then
            return;
        else
            local v3618 = v137.camera_angles();
            v3616.view_angles.y = v17(v3616.view_angles.y);
            v3616.view_angles.z = 0;
            if v3616.forwardmove > 0 and v3618.x < 45 then
                v3616.view_angles.x = 89;
                v3616.in_moveright = 1;
                v3616.in_moveleft = 0;
                v3616.in_forward = 0;
                v3616.in_back = 1;
                if v3616.sidemove == 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 90;
                end;
                if v3616.sidemove < 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 150;
                end;
                if v3616.sidemove > 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 30;
                end;
            elseif v3616.forwardmove < 0 then
                v3616.view_angles.x = 89;
                v3616.in_moveleft = 1;
                v3616.in_moveright = 0;
                v3616.in_forward = 1;
                v3616.in_back = 0;
                if v3616.sidemove == 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 90;
                end;
                if v3616.sidemove > 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 150;
                end;
                if v3616.sidemove < 0 then
                    v3616.view_angles.y = v3616.view_angles.y + 30;
                end;
            end;
            return;
        end;
    end);
    v1765 = nil;
    v1766 = function(v3619)
        -- upvalues: l_v1764_20 (ref)
        events.createmove(l_v1764_20, v3619:get());
    end;
    v1762.enabled:set_callback(v1766, true);
end;