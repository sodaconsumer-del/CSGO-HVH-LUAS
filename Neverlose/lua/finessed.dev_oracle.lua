local l_ffi_0 = require("ffi");
math.time_to_ticks = function(v1)
    return math.floor(0.5 + v1 / globals.tickinterval);
end;
math.ticks_to_time = function(v2)
    return v2 * globals.tickinterval;
end;
local v3 = {
    sidebar = ui.sidebar("finessed.dev", "shield"), 
    anti_aim = {}, 
    info = {}
};
local v4 = ui.create("", "anti-aimbot");
local v5 = ui.create("", "information");
local v6 = {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "In Air", 
    [5] = "Crouch In Air", 
    [6] = "Crouching"
};
v3.anti_aim.enabled = v4:switch("Enabled");
v3.anti_aim.state = v4:combo("State", v6);
for _, v8 in pairs(v6) do
    v3.anti_aim[v8] = {
        enabled = v4:switch("Enabled"), 
        jitter = v4:switch("Jitter"), 
        sway = v4:switch("Sway")
    };
    local v9 = v3.anti_aim[v8].jitter:create();
    v3.anti_aim[v8].jitter_left = v9:slider("Left", -1800, 1800, -295, 0.1);
    v3.anti_aim[v8].jitter_right = v9:slider("Right", -1800, 1800, 400, 0.1);
    v3.anti_aim[v8].jitter_delay = v9:slider("Delay", 0, 64, 3);
    local v10 = v3.anti_aim[v8].sway:create();
    v3.anti_aim[v8].sway_range = v10:slider("Range", -1800, 1800, 573, 0.1);
    v3.anti_aim[v8].sway_randomization = v10:slider("Randomization", 0, 100, 78, 1, "%");
end;
v5:label("hey everyone, its me svvayyz. Its been a wonderful journey contributing to this community through project like invictus.black, vandal.tech and stealth.codes");
v5:label("as a final contribution, I wanted to drop this last gift - a simple yet effective anti-aim lua script. I built it with simlicity and impact in mind.");
v5:label("thanks to everyone who has been part of the ride. without further ado, heres my last contribution. enjoy, stay safe and keep innovating.");
do
    local l_v3_0, l_v4_0, l_v5_0 = v3, v4, v5;
    l_v3_0.handle = function()
        -- upvalues: l_v3_0 (ref)
        local v14 = {
            enabled = l_v3_0.anti_aim.enabled:get(), 
            state = l_v3_0.anti_aim.state:get()
        };
        l_v3_0.anti_aim.state:visibility(v14.enabled);
        for v15, v16 in pairs(l_v3_0.anti_aim) do
            if type(v16) == "table" then
                local v17 = v15 == v14.state and v14.enabled;
                for _, v19 in pairs(v16) do
                    if v19 == v16.enabled then
                        v19:visibility(v17);
                    else
                        v19:visibility(v17 and v16.enabled:get());
                    end;
                end;
            end;
        end;
    end;
    local l_base64_0 = require("neverlose/base64");
    local l_clipboard_0 = require("neverlose/clipboard");
    do
        local l_l_base64_0_0, l_l_clipboard_0_0 = l_base64_0, l_clipboard_0;
        l_v3_0.export_config = function()
            -- upvalues: l_v3_0 (ref), l_l_base64_0_0 (ref), l_l_clipboard_0_0 (ref)
            local v24 = {};
            for v25, v26 in pairs(l_v3_0.anti_aim) do
                if type(v26) == "table" then
                    for v27, v28 in pairs(v26) do
                        if not v24[v25] then
                            v24[v25] = {};
                        end;
                        v24[v25][v27] = v28:get();
                    end;
                end;
            end;
            local v29 = l_l_base64_0_0.encode(json.stringify(v24));
            l_l_clipboard_0_0.set(v29);
        end;
        l_v4_0:button("Export", l_v3_0.export_config);
        l_v3_0.import_config = function()
            -- upvalues: l_l_clipboard_0_0 (ref), l_l_base64_0_0 (ref), l_v3_0 (ref)
            local v30 = l_l_clipboard_0_0.get();
            local v31 = json.parse(l_l_base64_0_0.decode(v30));
            for v32, v33 in pairs(l_v3_0.anti_aim) do
                if type(v33) == "table" then
                    for v34, v35 in pairs(v33) do
                        v35:set(v31[v32][v34]);
                    end;
                end;
            end;
        end;
        l_v4_0:button("Import", l_v3_0.import_config);
        local v36 = "eyJDcm91Y2ggSW4gQWlyIjp7ImVuYWJsZWQiOnRydWUsImppdHRlciI6dHJ1ZSwiaml0dGVyX2RlbGF5IjoyLjAsImppdHRlcl9sZWZ0IjotMjQ5LjAsImppdHRlcl9yaWdodCI6MzAzLjAsInN3YXkiOnRydWUsInN3YXlfcmFuZG9taXphdGlvbiI6NTguMCwic3dheV9yYW5nZSI6NDU3LjB9LCJDcm91Y2hpbmciOnsiZW5hYmxlZCI6dHJ1ZSwiaml0dGVyIjp0cnVlLCJqaXR0ZXJfZGVsYXkiOjMuMCwiaml0dGVyX2xlZnQiOi0yNDUuMCwiaml0dGVyX3JpZ2h0IjozNTAuMCwic3dheSI6dHJ1ZSwic3dheV9yYW5kb21pemF0aW9uIjo3OC4wLCJzd2F5X3JhbmdlIjo1NzAuMH0sIkRlZmF1bHQiOnsiZW5hYmxlZCI6dHJ1ZSwiaml0dGVyIjp0cnVlLCJqaXR0ZXJfZGVsYXkiOjMuMCwiaml0dGVyX2xlZnQiOi0yOTUuMCwiaml0dGVyX3JpZ2h0Ijo0MDAuMCwic3dheSI6dHJ1ZSwic3dheV9yYW5kb21pemF0aW9uIjo3OC4wLCJzd2F5X3JhbmdlIjo5OC4wfSwiSW4gQWlyIjp7ImVuYWJsZWQiOmZhbHNlLCJqaXR0ZXIiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjMuMCwiaml0dGVyX2xlZnQiOi0yOTUuMCwiaml0dGVyX3JpZ2h0Ijo0MDAuMCwic3dheSI6ZmFsc2UsInN3YXlfcmFuZG9taXphdGlvbiI6MC4wLCJzd2F5X3JhbmdlIjowLjB9LCJNb3ZpbmciOnsiZW5hYmxlZCI6dHJ1ZSwiaml0dGVyIjp0cnVlLCJqaXR0ZXJfZGVsYXkiOjMuMCwiaml0dGVyX2xlZnQiOi0yOTUuMCwiaml0dGVyX3JpZ2h0IjozNzMuMCwic3dheSI6dHJ1ZSwic3dheV9yYW5kb21pemF0aW9uIjo4OS4wLCJzd2F5X3JhbmdlIjozMTIuMH0sIlN0YW5kaW5nIjp7ImVuYWJsZWQiOmZhbHNlLCJqaXR0ZXIiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjMuMCwiaml0dGVyX2xlZnQiOi0yOTUuMCwiaml0dGVyX3JpZ2h0Ijo0MDAuMCwic3dheSI6ZmFsc2UsInN3YXlfcmFuZG9taXphdGlvbiI6MC4wLCJzd2F5X3JhbmdlIjowLjB9fQ==";
        l_v4_0:button("Load Default", function()
            -- upvalues: l_v3_0 (ref), v36 (ref)
            l_v3_0.import_config(v36);
        end);
        l_v3_0.references = {
            aa = {
                enabled = ui.find("aimbot", "anti aim", "angles", "enabled"), 
                freestanding = ui.find("aimbot", "anti aim", "angles", "freestanding")
            }
        };
    end;
    l_v4_0 = {
        crouch_in_air = 5, 
        in_air = 4, 
        moving = 3, 
        standing = 2, 
        default = 1, 
        crouching = 6
    };
    l_v5_0 = {
        [1] = "Default", 
        [2] = "Standing", 
        [3] = "Moving", 
        [4] = "In Air", 
        [5] = "Crouch In Air", 
        [6] = "Crouching"
    };
    v6 = {};
    l_base64_0 = {};
    l_clipboard_0 = function(v37)
        local v38 = v37:get_simulation_time();
        return (math.abs(math.time_to_ticks(v38.current - v38.old)));
    end;
    do
        local l_l_base64_0_1, l_l_clipboard_0_1 = l_base64_0, l_clipboard_0;
        local function v50(_, v42)
            -- upvalues: l_v4_0 (ref), l_l_base64_0_1 (ref), l_l_clipboard_0_1 (ref)
            local v47 = (function()
                -- upvalues: v42 (ref), l_v4_0 (ref)
                local l_m_fFlags_0 = v42.m_fFlags;
                local v44 = v42.m_vecVelocity:length2d();
                local v45 = bit.band(l_m_fFlags_0, 1) == 0;
                local v46 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0;
                if v44 <= 2 and not v45 and not v46 then
                    return l_v4_0.standing;
                elseif not v45 and not v46 then
                    return l_v4_0.moving;
                elseif not v46 then
                    return l_v4_0.in_air;
                elseif v45 and v46 then
                    return l_v4_0.crouch_in_air;
                elseif v46 then
                    return l_v4_0.crouching;
                else
                    return l_v4_0.default;
                end;
            end)();
            local v48 = v42:get_index();
            if not l_l_base64_0_1[v48] then
                l_l_base64_0_1[v48] = {
                    change_ticks = 0, 
                    counting = false, 
                    last_state = v47
                };
            end;
            local v49 = l_l_base64_0_1[v48];
            if not v49.counting then
                if (v49.last_state == l_v4_0.in_air or v49.last_state == l_v4_0.crouch_in_air) and v47 ~= l_v4_0.in_air and v47 ~= l_v4_0.crouch_in_air then
                    v49.counting = true;
                    v49.change_ticks = globals.tickcount;
                end;
            elseif globals.tickcount - v49.change_ticks > l_l_clipboard_0_1(v42) then
                v49.counting = false;
            else
                return v49.last_state;
            end;
            if not v49.counting then
                v49.last_state = v47;
                return v47;
            else
                return v49.last_state;
            end;
        end;
        local function v57(v51, v52)
            -- upvalues: l_l_clipboard_0_1 (ref)
            if not v52 then
                v52 = l_l_clipboard_0_1(v51);
            end;
            local v53 = v51:get_origin();
            local v54 = v51.m_vecVelocity * globals.tickinterval;
            local v55 = math.ticks_to_time(v52);
            local v56 = 0.5 * cvar.sv_gravity:float() * (v55 * v55);
            v54.z = math.max(v54.z - v56, 0);
            return v53 + v54 * v52;
        end;
        local function v60(v58)
            -- upvalues: v57 (ref)
            local v59 = {
                obj = entity.get_local_player()
            };
            v59.origin = v57(v59.obj, 1);
            v58.origin = v57(v58.obj);
            return v59.origin:to(v58.origin):angles().y;
        end;
        local function v62(v61)
            v61.view_angles.x = 89;
        end;
        local function v65(v63)
            -- upvalues: v60 (ref)
            local v64 = {
                obj = entity.get_threat()
            };
            if not v64.obj or v64.obj:is_dormant() then
                v63.view_angles.y = v63.view_angles.y + 180;
                return;
            else
                v63.view_angles.y = v60(v64) + 180;
                return;
            end;
        end;
        local function v68(v66, v67)
            if v67.choked_commands ~= 0 then
                return;
            else
                v67.send_packet = false;
                v67.view_angles.y = v67.view_angles.y + v66.desync.value * v66.desync.side;
                v66.desync.side = v66.desync.side * -1;
                return;
            end;
        end;
        local v69 = 0;
        local function v76(_, v71)
            -- upvalues: l_l_clipboard_0_1 (ref), v69 (ref)
            local v72 = {
                obj = entity.get_local_player()
            };
            v72.shift = l_l_clipboard_0_1(v72.obj);
            local v73 = v71.tickcount - v69;
            local v74 = cvar.sv_maxusrcmdprocessticks:int() - 2;
            local v75 = rage.exploit:get() >= 1 and v72.shift <= 0 and v74 / 2 <= v73;
            if v75 then
                v69 = v71.tickcount;
            end;
            v71.force_defensive = v75;
            rage.exploit:allow_defensive(v75);
        end;
        local function v80(v77, v78)
            local v79 = v77.desync.side * v77.jitter.side;
            v78.view_angles.y = v78.view_angles.y + v77.jitter.values[v79];
            if v77.jitter.counter >= v77.jitter.delay then
                v77.jitter.side = v77.jitter.side * -1;
                v77.jitter.counter = 0;
            else
                v77.jitter.counter = v77.jitter.counter + 1;
            end;
        end;
        local function v82(v81)
            v81.view_angles.y = math.normalize_yaw(v81.view_angles.y);
        end;
        local v83 = {
            tick = 0
        };
        local function v93(v84)
            -- upvalues: v83 (ref), v57 (ref)
            if not v84.in_jump or v84.in_duck then
                return;
            else
                local v85 = entity.get_local_player();
                local l_m_vecVelocity_0 = v85.m_vecVelocity;
                local v87 = math.abs(l_m_vecVelocity_0.x);
                local v88 = math.abs(l_m_vecVelocity_0.y);
                if v87 > 15 then
                    return;
                elseif v88 > 15 then
                    return;
                elseif l_m_vecVelocity_0.z < 0 then
                    return;
                else
                    if v83.tick + 5 < globals.tickcount then
                        local v89 = {
                            ticks = 0, 
                            vec = v85:get_origin()
                        };
                        for v90 = 1, 10 do
                            local v91 = v57(v85, v90);
                            if v91.z > v89.vec.z then
                                v89 = {
                                    vec = v91, 
                                    ticks = v90
                                };
                            end;
                        end;
                        v83.tick = globals.tickcount + v89.ticks;
                    end;
                    if v83.tick ~= globals.tickcount then
                        return;
                    else
                        local _ = v85:get_eye_position() + l_m_vecVelocity_0 * globals.tickinterval;
                        rage.exploit:force_teleport();
                        return;
                    end;
                end;
            end;
        end;
        local function v97(v94)
            v94.freestanding.yaw = 0;
            local v95 = rage.antiaim:get_target(false);
            local v96 = rage.antiaim:get_target(true);
            if not v95 or not v96 then
                return;
            else
                v94.freestanding.yaw = v96 - v95;
                return;
            end;
        end;
        local function v100(v98, v99)
            v99.view_angles.y = v99.view_angles.y + v98.freestanding.yaw;
        end;
        local v101 = 8;
        local v102 = 9;
        local v103 = bit.lshift(1, 5);
        local v104 = bit.lshift(1, 14);
        local function v112(v105, v106)
            -- upvalues: v97 (ref), v93 (ref), l_ffi_0 (ref), v103 (ref), v104 (ref), v101 (ref), v102 (ref), v76 (ref), v68 (ref), v62 (ref), v65 (ref), v80 (ref), v100 (ref), v82 (ref)
            v97(v105);
            v93(v106);
            local v107 = {
                obj = entity.get_game_rules()
            };
            v107.is_freeze_period = v107.obj.m_bFreezePeriod;
            if v107.is_freeze_period then
                return;
            else
                local v108 = {
                    obj = entity.get_local_player()
                };
                v108.ptr = l_ffi_0.cast("unsigned long", v108.obj[0]);
                v108.has_gun_game_immunity = v108.obj.m_bGunGameImmunity;
                if v108.has_gun_game_immunity then
                    return;
                else
                    v108.flags = v108.obj.m_fFlags;
                    if bit.band(v108.flags, v103) == 1 or bit.band(v108.flags, v104) == 1 then
                        return;
                    else
                        v108.move_type = l_ffi_0.cast("int*", v108.ptr + 603 + 1)[0];
                        if v108.move_type == v101 or v108.move_type == v102 then
                            return;
                        else
                            v108.wpn = {
                                obj = v108.obj:get_player_weapon()
                            };
                            if not v108.wpn.obj then
                                return;
                            else
                                v108.wpn.classname = v108.wpn.obj:get_classname();
                                v108.wpn.is_grenade = v108.wpn.classname:find("Grenade");
                                v108.wpn.is_knife = v108.wpn.classname:find("Knife");
                                if v108.wpn.is_grenade then
                                    v108.wpn.throw_time = v108.wpn.obj.m_fThrowTime;
                                    if math.abs(globals.curtime - v108.wpn.throw_time) < 0.2 then
                                        return;
                                    end;
                                else
                                    v108.wpn.next_primary_attack = v108.wpn.obj.m_flNextPrimaryAttack;
                                    v108.wpn.next_secondary_attack = v108.wpn.obj.m_flNextSecondaryAttack;
                                    local v109 = math.abs(globals.curtime - v108.wpn.next_primary_attack);
                                    local v110 = math.abs(globals.curtime - v108.wpn.next_secondary_attack);
                                    local v111 = 0.2;
                                    if v109 <= v111 and v106.in_attack then
                                        return;
                                    elseif v110 <= v111 and v106.in_attack2 and v108.wpn.is_knife then
                                        return;
                                    end;
                                end;
                                v76(v105, v106);
                                if v106.in_use then
                                    if v105.desync.enabled then
                                        v68(v105, v106);
                                    end;
                                    return;
                                else
                                    v62(v106);
                                    v65(v106);
                                    if v105.desync.enabled then
                                        v68(v105, v106);
                                    end;
                                    if v105.jitter.enabled then
                                        v80(v105, v106);
                                    end;
                                    if v105.freestanding.enabled then
                                        v100(v105, v106);
                                    end;
                                    v82(v106);
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v114(v113)
            if globals.realtime - v113.anti_bf.last_trigger < 0.25 then
                return;
            else
                v113.desync.side = v113.desync.side * -1;
                v113.anti_bf.last_trigger = globals.realtime;
                return;
            end;
        end;
        v6.new = function()
            -- upvalues: v50 (ref), v112 (ref), v114 (ref)
            return {
                desync = {
                    enabled = true, 
                    side = -1, 
                    value = 180 / math.pi
                }, 
                jitter = {
                    counter = 0, 
                    enabled = true, 
                    side = -1, 
                    delay = 3, 
                    values = {
                        [-1] = -29.5, 
                        [1] = 40
                    }
                }, 
                anti_bf = {
                    last_trigger = globals.realtime
                }, 
                freestanding = {
                    enabled = false, 
                    yaw = 0
                }, 
                get_state = v50, 
                process = v112, 
                abf = v114
            };
        end;
    end;
    l_base64_0 = v6.new();
    events.createmove:set(function(v115)
        -- upvalues: l_v3_0 (ref), l_v5_0 (ref), l_base64_0 (ref)
        l_v3_0.references.aa.enabled:set(not l_v3_0.anti_aim.enabled:get());
        if not l_v3_0.anti_aim.enabled:get() then
            return;
        else
            local v116 = 1 / globals.tickinterval / 64;
            local v117 = entity.get_local_player();
            local v118 = l_v5_0[l_base64_0:get_state(v117)];
            local v119 = l_v3_0.anti_aim[v118].enabled:get() and v118 or "Default";
            local v120 = utils.random_float(10 - 9 * (l_v3_0.anti_aim[v119].sway_randomization:get() / 100), 10);
            l_base64_0.desync.enabled = l_v3_0.anti_aim[v119].sway:get();
            l_base64_0.desync.value = l_v3_0.anti_aim[v119].sway_range:get() / 10 / v120;
            l_base64_0.jitter.enabled = l_v3_0.anti_aim[v119].jitter:get();
            l_base64_0.jitter.values = {
                [-1] = l_v3_0.anti_aim[v119].jitter_left:get() / 10, 
                [1] = l_v3_0.anti_aim[v119].jitter_right:get() / 10
            };
            l_base64_0.jitter.delay = l_v3_0.anti_aim[v119].jitter_delay:get() * v116;
            l_base64_0.freestanding.enabled = l_v3_0.references.aa.freestanding:get();
            l_base64_0:process(v115);
            return;
        end;
    end);
    events.bullet_impact:set(function(_)
        -- upvalues: l_v3_0 (ref), l_base64_0 (ref)
        if not l_v3_0.anti_aim.enabled:get() then
            return;
        else
            l_base64_0:abf();
            return;
        end;
    end);
    events.render:set(l_v3_0.handle);
end;
v3 = l_ffi_0.typeof("        struct {\n            uint64_t version; \n            union {\n                int64_t   xuid;\n                struct {\n                    uint32_t   xuid_low;\n                    uint32_t   xuid_high;\n                };\n            };\n            char name[128]; \n            int user_id; \n            char guid[33];\n            uint32_t friends_id;\n            char friends_name[128];\n            bool fakeplayer;\n            bool hltv;\n            int customfiles[4];\n            unsigned char files_downloaded;\n        }\n    ");
v4 = utils.get_vfunc("engine.dll", "VEngineClient014", 8, l_ffi_0.typeof("bool(__thiscall*)(void*, int, $*)", v3));
v5 = l_ffi_0.new(l_ffi_0.typeof("$[1]", v3));
do
    local l_v4_1, l_v5_1, l_v6_0 = v4, v5, v6;
    l_v6_0 = function(v125)
        -- upvalues: l_v4_1 (ref), l_v5_1 (ref), l_ffi_0 (ref)
        if not l_v4_1(v125, l_v5_1) then
            return false;
        else
            local v126 = l_v5_1[0];
            return {
                xuid = tonumber(v126.xuid), 
                xuid_low = tonumber(v126.xuid_low), 
                xuid_high = tonumber(v126.xuid_high), 
                name = l_ffi_0.string(v126.name), 
                user_id = tonumber(v126.user_id), 
                guid = l_ffi_0.string(v126.guid)
            };
        end;
    end;
    local v166 = {
        primordial = function(v127)
            local l_buffer_0 = v127.buffer;
            local v129 = {
                padding = l_buffer_0:read_bits(64), 
                keyp1 = l_buffer_0:read_bits(8), 
                entity_id = l_buffer_0:read_bits(8), 
                entity_id_key = l_buffer_0:read_bits(8), 
                loc_xor_key = l_buffer_0:read_bits(8), 
                x = l_buffer_0:read_bits(16), 
                y = l_buffer_0:read_bits(16), 
                z = l_buffer_0:read_bits(16), 
                keyp2 = l_buffer_0:read_bits(8)
            };
            return {
                entity_id = bit.bxor(v129.entity_id, v129.entity_id_key), 
                x = bit.bxor(v129.x, v129.loc_xor_key), 
                y = bit.bxor(v129.y, v129.loc_xor_key), 
                z = bit.bxor(v129.z, v129.loc_xor_key), 
                key = bit.bxor(v129.keyp1, v129.keyp2)
            };
        end, 
        gamesense = function(v130)
            -- upvalues: l_v6_0 (ref), l_ffi_0 (ref)
            local l_buffer_1 = v130.buffer;
            local v132 = v130.entity:get_index();
            local v133 = l_v6_0(v132);
            if not v133 then
                return false;
            else
                local v141 = (function()
                    -- upvalues: l_ffi_0 (ref), v133 (ref), v130 (ref)
                    local v134 = l_ffi_0.new("uint8_t[24]");
                    local v135 = l_ffi_0.cast("uint32_t*", v134);
                    v135[0] = v133.xuid_low;
                    v135[1] = v133.xuid_high;
                    v135[2] = v130.section_number;
                    v135[3] = v130.sequence_bytes;
                    v135[4] = v130.uncompressed_sample_offset;
                    local v136 = {
                        [0] = 94, 
                        [1] = 4, 
                        [2] = 184, 
                        [3] = 28, 
                        [4] = 143, 
                        [5] = 210, 
                        [6] = 241, 
                        [7] = 56, 
                        [8] = 207, 
                        [9] = 171, 
                        [10] = 136, 
                        [11] = 61, 
                        [12] = 194, 
                        [13] = 59, 
                        [14] = 115, 
                        [15] = 88, 
                        [16] = 65, 
                        [17] = 204, 
                        [18] = 6, 
                        [19] = 249, 
                        [20] = 32, 
                        [21] = 68, 
                        [22] = 121, 
                        [23] = 77, 
                        [24] = 172, 
                        [25] = 47, 
                        [26] = 202, 
                        [27] = 150, 
                        [28] = 217, 
                        [29] = 237, 
                        [30] = 34, 
                        [31] = 247, 
                        [32] = 44, 
                        [33] = 244, 
                        [34] = 67, 
                        [35] = 147, 
                        [36] = 13, 
                        [37] = 208, 
                        [38] = 70, 
                        [39] = 45, 
                        [40] = 141, 
                        [41] = 42, 
                        [42] = 180, 
                        [43] = 225, 
                        [44] = 12, 
                        [45] = 53, 
                        [46] = 89, 
                        [47] = 16, 
                        [48] = 114, 
                        [49] = 18, 
                        [50] = 236, 
                        [51] = 165, 
                        [52] = 79, 
                        [53] = 188, 
                        [54] = 174, 
                        [55] = 58, 
                        [56] = 71, 
                        [57] = 102, 
                        [58] = 205, 
                        [59] = 40, 
                        [60] = 160, 
                        [61] = 104, 
                        [62] = 154, 
                        [63] = 181, 
                        [64] = 92, 
                        [65] = 99, 
                        [66] = 246, 
                        [67] = 183, 
                        [68] = 36, 
                        [69] = 43, 
                        [70] = 195, 
                        [71] = 51, 
                        [72] = 90, 
                        [73] = 81, 
                        [74] = 76, 
                        [75] = 140, 
                        [76] = 49, 
                        [77] = 212, 
                        [78] = 177, 
                        [79] = 159, 
                        [80] = 122, 
                        [81] = 86, 
                        [82] = 235, 
                        [83] = 82, 
                        [84] = 112, 
                        [85] = 253, 
                        [86] = 2, 
                        [87] = 135, 
                        [88] = 84, 
                        [89] = 151, 
                        [90] = 232, 
                        [91] = 83, 
                        [92] = 10, 
                        [93] = 96, 
                        [94] = 120, 
                        [95] = 29, 
                        [96] = 145, 
                        [97] = 179, 
                        [98] = 134, 
                        [99] = 191, 
                        [100] = 98, 
                        [101] = 189, 
                        [102] = 201, 
                        [103] = 199, 
                        [104] = 7, 
                        [105] = 46, 
                        [106] = 80, 
                        [107] = 106, 
                        [108] = 105, 
                        [109] = 62, 
                        [110] = 190, 
                        [111] = 162, 
                        [112] = 166, 
                        [113] = 22, 
                        [114] = 119, 
                        [115] = 26, 
                        [116] = 196, 
                        [117] = 238, 
                        [118] = 87, 
                        [119] = 175, 
                        [120] = 146, 
                        [121] = 164, 
                        [122] = 176, 
                        [123] = 113, 
                        [124] = 9, 
                        [125] = 173, 
                        [126] = 152, 
                        [127] = 41, 
                        [128] = 206, 
                        [129] = 25, 
                        [130] = 224, 
                        [131] = 54, 
                        [132] = 198, 
                        [133] = 220, 
                        [134] = 230, 
                        [135] = 107, 
                        [136] = 211, 
                        [137] = 223, 
                        [138] = 148, 
                        [139] = 95, 
                        [140] = 131, 
                        [141] = 21, 
                        [142] = 52, 
                        [143] = 234, 
                        [144] = 153, 
                        [145] = 33, 
                        [146] = 221, 
                        [147] = 192, 
                        [148] = 19, 
                        [149] = 11, 
                        [150] = 254, 
                        [151] = 111, 
                        [152] = 66, 
                        [153] = 155, 
                        [154] = 75, 
                        [155] = 50, 
                        [156] = 64, 
                        [157] = 219, 
                        [158] = 222, 
                        [159] = 109, 
                        [160] = 14, 
                        [161] = 27, 
                        [162] = 124, 
                        [163] = 85, 
                        [164] = 255, 
                        [165] = 91, 
                        [166] = 158, 
                        [167] = 39, 
                        [168] = 57, 
                        [169] = 103, 
                        [170] = 138, 
                        [171] = 5, 
                        [172] = 73, 
                        [173] = 193, 
                        [174] = 37, 
                        [175] = 30, 
                        [176] = 31, 
                        [177] = 116, 
                        [178] = 228, 
                        [179] = 8, 
                        [180] = 216, 
                        [181] = 110, 
                        [182] = 127, 
                        [183] = 203, 
                        [184] = 245, 
                        [185] = 242, 
                        [186] = 137, 
                        [187] = 250, 
                        [188] = 38, 
                        [189] = 17, 
                        [190] = 72, 
                        [191] = 169, 
                        [192] = 125, 
                        [193] = 167, 
                        [194] = 200, 
                        [195] = 142, 
                        [196] = 243, 
                        [197] = 23, 
                        [198] = 35, 
                        [199] = 93, 
                        [200] = 128, 
                        [201] = 197, 
                        [202] = 48, 
                        [203] = 74, 
                        [204] = 130, 
                        [205] = 1, 
                        [206] = 240, 
                        [207] = 251, 
                        [208] = 182, 
                        [209] = 144, 
                        [210] = 185, 
                        [211] = 108, 
                        [212] = 209, 
                        [213] = 163, 
                        [214] = 0, 
                        [215] = 15, 
                        [216] = 20, 
                        [217] = 215, 
                        [218] = 161, 
                        [219] = 129, 
                        [220] = 170, 
                        [221] = 63, 
                        [222] = 132, 
                        [223] = 60, 
                        [224] = 252, 
                        [225] = 126, 
                        [226] = 239, 
                        [227] = 229, 
                        [228] = 187, 
                        [229] = 139, 
                        [230] = 213, 
                        [231] = 186, 
                        [232] = 218, 
                        [233] = 156, 
                        [234] = 149, 
                        [235] = 231, 
                        [236] = 69, 
                        [237] = 157, 
                        [238] = 55, 
                        [239] = 24, 
                        [240] = 101, 
                        [241] = 100, 
                        [242] = 214, 
                        [243] = 117, 
                        [244] = 178, 
                        [245] = 226, 
                        [246] = 133, 
                        [247] = 233, 
                        [248] = 248, 
                        [249] = 78, 
                        [250] = 118, 
                        [251] = 123, 
                        [252] = 168, 
                        [253] = 3, 
                        [254] = 97, 
                        [255] = 227
                    };
                    local v137 = 7;
                    for v138 = 0, 20 do
                        local v139 = v136[v138 + 129];
                        v136[v138 + 129] = v136[bit.band(v137 + v139, 255)];
                        v136[bit.band(v137 + v139, 255)] = v139;
                        v137 = bit.band(v137 + v139, 255);
                        v134[v138] = bit.bxor(v134[v138], v136[bit.band(v139 + v136[v138 + 129], 255)]);
                    end;
                    for v140 = 0, 4 do
                        v135[v140] = bit.bxor(bit.bxor(v135[v140], v134[v140 * 4]), bit.bxor(v135[v140], v136[v140]));
                    end;
                    return v135;
                end)();
                local v142 = {
                    padding = l_buffer_1:read_bits(64), 
                    entity_id = l_buffer_1:read_bits(8), 
                    padding_2 = l_buffer_1:read_bits(8), 
                    x = l_buffer_1:read_coord(), 
                    y = l_buffer_1:read_coord(), 
                    z = l_buffer_1:read_coord()
                };
                return {
                    entity_id = bit.bxor(v142.entity_id, v141[0]), 
                    tick_count = bit.bxor(v142.padding, v141[4]), 
                    x = bit.bxor(v142.x, v141[1]), 
                    y = bit.bxor(v142.y, v141[2]), 
                    z = bit.bxor(v142.z, v141[3])
                };
            end;
        end, 
        ev0lve = function(v143)
            -- upvalues: l_v6_0 (ref)
            local l_buffer_2 = v143.buffer;
            local v145 = v143.entity:get_index();
            local v146 = l_v6_0(v145);
            if not v146 then
                return false;
            else
                local v147 = {
                    identifier = l_buffer_2:read_bits(16), 
                    entity_id = l_buffer_2:read_bits(8), 
                    weapon_id = l_buffer_2:read_bits(8), 
                    x = l_buffer_2:read_coord(), 
                    y = l_buffer_2:read_coord(), 
                    z = l_buffer_2:read_coord(), 
                    padding = l_buffer_2:read_bits(16), 
                    tick_count = l_buffer_2:read_bits(32)
                };
                local v148 = bit.bor(bit.band(bit.bxor(v146.xuid_high, v145) % v146.xuid_low, 4294967295), bit.band(bit.bxor(v146.xuid_high, v146.xuid_low), 65535));
                local v149 = {
                    bit.band(v148, 255), 
                    bit.band(bit.rshift(v148, 8), 255), 
                    bit.band(bit.rshift(v148, 16), 255), 
                    bit.band(bit.rshift(v148, 24), 255)
                };
                return {
                    identifier = bit.band(bit.bxor(v147.identifier, v149[1]), 65535), 
                    entity_id = bit.band(bit.bxor(v147.entity_id, v149[2]), 255), 
                    weapon_id = bit.band(bit.bxor(v147.weapon_id, v149[3]), 255), 
                    x = bit.band(bit.bxor(v147.x, v149[1]), 65535), 
                    y = bit.band(bit.bxor(v147.y, v149[2]), 65535), 
                    z = bit.band(bit.bxor(v147.z, v149[3]), 65535), 
                    tick_count = bit.band(bit.bxor(v147.tick_count, v149[1]), 4294967295)
                };
            end;
        end, 
        fatality = function(v150)
            local l_buffer_3 = v150.buffer;
            return {
                identifier = l_buffer_3:read_bits(16), 
                entity_id = l_buffer_3:read_bits(8), 
                weapon_id = l_buffer_3:read_bits(8), 
                tick_count = l_buffer_3:read_bits(32), 
                x = l_buffer_3:read_coord(), 
                y = l_buffer_3:read_coord(), 
                z = l_buffer_3:read_coord()
            };
        end, 
        pandora = function(v152)
            local l_buffer_4 = v152.buffer;
            return {
                identifier = l_buffer_4:read_bits(32), 
                entity_id = l_buffer_4:read_bits(32), 
                x = l_buffer_4:read_coord(), 
                y = l_buffer_4:read_coord(), 
                z = l_buffer_4:read_coord()
            };
        end, 
        plague = function(v154)
            local l_buffer_5 = v154.buffer;
            return {
                identifier = l_buffer_5:read_bits(32), 
                entity_id = l_buffer_5:read_bits(8), 
                health = l_buffer_5:read_bits(8), 
                x = l_buffer_5:read_bits(16), 
                y = l_buffer_5:read_bits(16), 
                z = l_buffer_5:read_bits(16), 
                entity_again = l_buffer_5:read_bits(8), 
                padding = l_buffer_5:read_bits(24), 
                second_id = l_buffer_5:read_bits(32)
            };
        end, 
        nixware = function(v156)
            local l_buffer_6 = v156.buffer;
            return {
                identifier = l_buffer_6:read_bits(16), 
                entity_id = l_buffer_6:read_bits(7) + 1, 
                x = l_buffer_6:read_coord(), 
                y = l_buffer_6:read_coord(), 
                z = l_buffer_6:read_coord(), 
                tick_count = l_buffer_6:read_bits(32), 
                health = l_buffer_6:read_bits(7)
            };
        end, 
        onetap = function(v158)
            local l_buffer_7 = v158.buffer;
            local v160 = {
                padding = l_buffer_7:read_bits(32), 
                entity_id = l_buffer_7:read_bits(8), 
                tick_count = l_buffer_7:read_bits(8), 
                x = l_buffer_7:read_bits(16), 
                y = l_buffer_7:read_bits(16), 
                z = l_buffer_7:read_bits(16)
            };
            local _ = 1401050875;
            local v162 = 359866515;
            local v163 = 928134322;
            local v164 = {
                bit.band(v162, 255), 
                bit.band(bit.rshift(v162, 8), 255), 
                bit.band(bit.rshift(v162, 16), 255), 
                bit.band(bit.rshift(v162, 24), 255)
            };
            local v165 = {
                bit.band(v163, 255), 
                bit.band(bit.rshift(v163, 8), 255), 
                bit.band(bit.rshift(v163, 16), 255), 
                bit.band(bit.rshift(v163, 24), 255)
            };
            return {
                entity_id = bit.bxor(v160.entity_id, v164[1]), 
                tick_count = bit.bxor(v160.tick_count, v164[2]), 
                x = bit.bxor(v160.x, v165[1]), 
                y = bit.bxor(v160.y, v165[2]), 
                z = bit.bxor(v160.z, v165[3])
            };
        end
    };
    events.voice_message:set(function(v167)
        -- upvalues: v166 (ref)
        if v167.is_nl then
            return;
        else
            local function v173(v168)
                if v168.entity_id < 1 or v168.entity_id > 64 then
                    return;
                else
                    local l_status_0, l_result_0 = pcall(entity.get, v168.entity_id);
                    if not l_status_0 then
                        return false;
                    else
                        local _, l_result_1 = pcall(function()
                            -- upvalues: l_result_0 (ref)
                            return l_result_0:is_player();
                        end);
                        if not l_result_1 then
                            return false;
                        elseif v168.x > 16384 or v168.x < -16384 then
                            return false;
                        elseif v168.y > 16384 or v168.y < -16384 then
                            return false;
                        elseif v168.z > 16384 or v168.z < -16384 then
                            return false;
                        elseif v168.tick_count and globals.tickcount - v168.tick_count > 32 then
                            return false;
                        else
                            return l_result_0;
                        end;
                    end;
                end;
            end;
            for _, v175 in pairs(v166) do
                if v167.entity then
                    local v176 = v175(v167);
                    if v176 then
                        v176.entity = v173(v176);
                        if v176.entity then
                            if not v176.entity:is_enemy() or not v176.entity:is_dormant() then
                                v167.buffer:reset();
                                break;
                            else
                                v176.entity.m_vecOrigin = vector(v176.x, v176.y, v176.z);
                                v176.entity.m_bIsDormant = false;
                            end;
                        end;
                    end;
                    v167.buffer:reset();
                else
                    break;
                end;
            end;
            return;
        end;
    end);
end;