local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/inspect");
table.contains = function(v2, v3)
    if type(v2) ~= "table" then
        return false;
    else
        for v4 = 0, #v2 do
            if v2[v4] == v3 then
                return true, v4;
            end;
        end;
        return false;
    end;
end;
local v5 = {
    hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
    multipoint = {
        hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint"), 
        head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
        body_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale")
    }, 
    mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    doubletap = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
        immediate_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport")
    }, 
    peek_assist = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        autostop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
        retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
        max_distance = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Max Distance")
    }, 
    fakelatency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    body_aim_mode = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    freestanding = {
        switch = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
    }, 
    thirdperson_switch = ui.find("Visuals", "World", "Main", "Force Thirdperson")
};
local v6 = ui.create("Automatic peek");
local v7 = {};
local v8 = {};
v7.main_key = v6:switch("Automatic peek");
v7.movemode = v6:combo("Move mode (look tooltip)", {
    [1] = "Defensive", 
    [2] = "Offensive"
}):tooltip("\"Offensive\" - will follow you if you move manually\n\"Defensive\" - will stay in place even if you move manually (so you can bait with it if you want as it teleports you back to the center when you dont move)");
v7.visual = v6:switch("Visualize");
v8.visual = v7.visual:create();
v7.accent = v8.visual:color_picker("Color", color());
v7.debug_trace = v8.visual:switch("Show debug trace");
v7.additions = v6:switch("Enable additions");
v8.additions = v7.additions:create();
v7.all_hitboxes = v8.additions:switch("Enable all hitboxes"):tooltip("Can impact performance/FPS");
v7.faster_stop = v8.additions:switch("Faster autostop");
v7.hitchance = v8.additions:switch("Override hitchance");
v7.ping_spike = v8.additions:switch("Override pingspike");
v7.freestanding = v8.additions:switch("Override freestanding");
v7.visual:set(true);
v7.visual:set_callback(function(v9)
    -- upvalues: v7 (ref)
    v7.accent:visibility(v9:get());
    v7.debug_trace:visibility(v9:get());
end, true);
v7.additions:set_callback(function(v10)
    -- upvalues: v7 (ref)
    v7.all_hitboxes:visibility(v10:get());
    v7.faster_stop:visibility(v10:get());
    v7.hitchance:visibility(v10:get());
    v7.ping_spike:visibility(v10:get());
    v7.freestanding:visibility(v10:get());
end, true);
ui.sidebar("Automatic peek", "wheelchair");
local v11 = {
    Head = {
        [1] = 0
    }, 
    Chest = {
        [1] = 4, 
        [2] = 5, 
        [3] = 6
    }, 
    Stomach = {
        [1] = 2, 
        [2] = 3
    }, 
    Arms = {
        [1] = 13, 
        [2] = 14, 
        [3] = 15, 
        [4] = 16, 
        [5] = 17, 
        [6] = 18
    }, 
    Legs = {
        [1] = 7, 
        [2] = 8, 
        [3] = 9, 
        [4] = 10
    }, 
    Feet = {
        [1] = 11, 
        [2] = 12
    }
};
local v12 = {
    [1] = 0, 
    [2] = 5, 
    [3] = 2, 
    [4] = 15, 
    [5] = 17, 
    [6] = 9, 
    [7] = 10
};
local v13 = 4;
local v14 = 22;
local v15 = {};
local v16 = false;
local v17 = false;
local v18 = false;
local v19 = false;
local v20 = false;
local v21 = false;
local v22 = {
    active_point_index = 0, 
    last_returning_time = 0, 
    middle_pos = vector(), 
    eyepos_positions = {}, 
    rage_hitboxes = {}
};
local v23 = {
    main = false, 
    force_baim = false
};
local v24 = {
    active = false, 
    tracing = false, 
    data = {}, 
    debug_data = {
        vectors_to_hitboxes = {}, 
        vector_to_enemy = {}
    }, 
    values = {
        global_alpha = l_smoothy_0.new(), 
        tweens = {
            pos = {}, 
            alpha = {}
        }, 
        debug = {
            alpha = l_smoothy_0.new()
        }
    }
};
for v25 = 0, v13 do
    v24.debug_data.vectors_to_hitboxes[v25] = {};
    v24.data[v25] = false;
    v24.values.tweens.pos[v25] = l_smoothy_0.new(vector());
    v24.values.tweens.alpha[v25] = l_smoothy_0.new();
end;
local function v27(v26)
    if v26:get_classname() == "CCSPlayer" and v26:is_enemy() then
        return true;
    else
        return false;
    end;
end;
local function v32(v28, v29, v30)
    local v31 = v30 * math.pi / 180;
    return vector(v28.x + math.cos(v31) * v29, v28.y + math.sin(v31) * v29, v28.z);
end;
local function v37(v33, v34, v35)
    local l_y_0 = v35:get_origin():to(v34):angles().y;
    v33.in_forward = true;
    v33.in_back = false;
    v33.in_moveleft = false;
    v33.in_moveright = false;
    v33.in_speed = false;
    v33.forwardmove = 800;
    v33.sidemove = 0;
    v33.move_yaw = l_y_0;
end;
local function v46(v38)
    -- upvalues: v5 (ref), v11 (ref), v12 (ref), v15 (ref)
    local v39 = {};
    local v40 = v38:get();
    local v41 = {
        [1] = "Head", 
        [2] = "Arms", 
        [3] = "Legs", 
        [4] = "Feet"
    };
    for v42 = 1, #v40 do
        if v5.body_aim_mode:get() ~= "Force" or not table.contains(v41, v40[v42]) then
            local v43 = v11[v40[v42]];
            for v44 = 1, #v43 do
                local v45 = v43[v44];
                if table.contains(v12, v45) then
                    table.insert(v39, v45);
                end;
            end;
        end;
    end;
    v15 = v39;
end;
v5.body_aim_mode:set_callback(function()
    -- upvalues: v46 (ref), v5 (ref)
    v46(v5.hitboxes);
end);
v7.all_hitboxes:set_callback(function(v47)
    -- upvalues: v12 (ref), v46 (ref), v5 (ref)
    if v47:get() then
        v12 = {
            [1] = 0, 
            [2] = 4, 
            [3] = 5, 
            [4] = 6, 
            [5] = 2, 
            [6] = 3, 
            [7] = 13, 
            [8] = 14, 
            [9] = 15, 
            [10] = 16, 
            [11] = 17, 
            [12] = 18, 
            [13] = 7, 
            [14] = 8, 
            [15] = 9, 
            [16] = 10, 
            [17] = 11, 
            [18] = 12
        };
    else
        v12 = {
            [1] = 0, 
            [2] = 5, 
            [3] = 2, 
            [4] = 15, 
            [5] = 17, 
            [6] = 9, 
            [7] = 10
        };
    end;
    v46(v5.hitboxes);
end, true);
v46(v5.hitboxes);
local function v62(v48, v49, v50, v51, v52, v53, v54, v55, v56)
    -- upvalues: v32 (ref), v27 (ref)
    local v57 = v53 and vector(v48.x, v48.y, v53.z) - v49 or v48;
    local v58 = v32(v57, v51 * v52, v50);
    if v52 > 1 then
        v57 = v32(v58, -v51, v50);
    end;
    local l_end_pos_0 = utils.trace_hull(v58, v58 + vector(0, 0, v56), v54, v55, v27, 33636363).end_pos;
    local v60 = vector(0, 0, math.min(v56, math.abs(v48.z - l_end_pos_0.z)));
    local l_end_pos_1 = utils.trace_hull(v57 + v60, v58 + v60, v54, v55, v27, 33636363).end_pos;
    if v58:dist2d(l_end_pos_1) > v51 * 0.95 then
        return false;
    elseif v53 and v58:dist2d(v53) > v51 + 0.001 then
        return false;
    else
        return utils.trace_hull(l_end_pos_1, vector(l_end_pos_1.x, l_end_pos_1.y, v48.z - 240), v54, v55, v27, 33636363).end_pos + v49;
    end;
end;
local function v83(v63, v64, v65, v66, v67)
    -- upvalues: v62 (ref), v22 (ref), v24 (ref)
    local l_m_vecViewOffset_0 = v63.m_vecViewOffset;
    local l_m_vecMins_0 = v63.m_vecMins;
    local l_m_vecMaxs_0 = v63.m_vecMaxs;
    local v71 = 18;
    local v72 = v62(v64, l_m_vecViewOffset_0, v65, v67, 0, nil, l_m_vecMins_0, l_m_vecMaxs_0, v71);
    v22.eyepos_positions[0] = v72;
    v24.data[0] = v72;
    for v73 = 1, 2 do
        for v74 = 1, v66 / 2 do
            local l_v74_0 = v74;
            local v76 = v73 == 1 and v74 or v74 + v66 / 2;
            local v77 = v73 == 1 and v65 - 90 or v65 + 90;
            local v78 = v22.eyepos_positions[v76 == v66 / 2 + 1 and 0 or v76 - 1];
            local v79 = v62(v64, l_m_vecViewOffset_0, v77, v67, l_v74_0, v78, l_m_vecMins_0, l_m_vecMaxs_0, v71);
            if v76 >= 1 and (not v79 or v78 and v79 and v71 < math.abs(v78.z - v79.z)) then
                local l_v76_0 = v76;
                local v81 = v73 == 1 and v66 / 2 or v66;
                for v82 = l_v76_0, v81 do
                    v22.eyepos_positions[v82] = false;
                    v24.data[v82] = false;
                end;
                break;
            else
                v22.eyepos_positions[v76] = v79;
                v24.data[v76] = v79;
            end;
        end;
    end;
    return v22.eyepos_positions;
end;
local function v96(v84, v85, v86, v87)
    -- upvalues: v5 (ref), v24 (ref)
    local l_m_iHealth_0 = v86.m_iHealth;
    local v89 = math.clamp(v5.mindamage:get(), 1, 100);
    for v90 = 1, #v84 do
        local v91 = v84[v90];
        v24.debug_data.vectors_to_hitboxes[v90] = {};
        if v91 then
            for v92 = 1, #v87 do
                local v93 = v86:get_hitbox_position(v87[v92]);
                if v93 then
                    local v94, _ = utils.trace_bullet(v85, v91, v93);
                    v24.debug_data.vectors_to_hitboxes[v90][v92] = {
                        [1] = v91, 
                        [2] = v93
                    };
                    if math.min(v89, l_m_iHealth_0) <= v94 and v94 > 0 then
                        return v91, v90;
                    end;
                end;
            end;
        end;
    end;
    return nil, 0;
end;
local function v101(v97, v98)
    if not v98 then
        return false;
    else
        local v99 = v97.m_flNextAttack or 0;
        local v100 = v98.m_flNextPrimaryAttack or 0;
        if math.max(0, v99, v100) > globals.curtime or v98.m_iClip1 <= 0 then
            return false;
        else
            return true;
        end;
    end;
end;
local function v106(v102, v103)
    -- upvalues: v101 (ref), v5 (ref)
    if not v103 then
        return false;
    else
        local v104 = v102:get_player_weapon();
        if not v101(v102, v104) or v104.m_fLastShotTime - globals.curtime > 0 then
            return false;
        else
            local v105 = {
                [1] = "CWeaponSSG08", 
                [2] = "CWeaponAWP", 
                [3] = "CWeaponG3SG1", 
                [4] = "CWeaponSCAR20"
            };
            if not v5.autoscope:get() and table.contains(v105, v104:get_classname()) and not v102.m_bIsScoped then
                return false;
            elseif v5.doubletap.switch:get() and rage.exploit:get() ~= 1 then
                return false;
            elseif v102.m_flVelocityModifier ~= 1 then
                return false;
            elseif v103:get_bbox().alpha < 0.45 then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
local function v124(v107)
    -- upvalues: v7 (ref), v23 (ref), v22 (ref), v5 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v21 (ref), v24 (ref), v46 (ref), v83 (ref), v13 (ref), v14 (ref), v106 (ref), v96 (ref), v15 (ref), v37 (ref)
    local v108 = v7.main_key:get();
    if v108 and not v23.main then
        v22.middle_pos = entity.get_local_player():get_origin();
        v23.main = true;
    elseif not v108 and v23.main then
        v5.multipoint.head_scale:override();
        v5.hitchance:override();
        v5.doubletap.switch:override();
        v5.doubletap.lag_options:override();
        v5.doubletap.fakelag_limit:override();
        v5.doubletap.immediate_teleport:override();
        v5.peek_assist.switch:override();
        v5.peek_assist.retreat_mode:override();
        v5.peek_assist.max_distance:override();
        v5.peek_assist.autostop:override();
        v5.fakelatency:override();
        v5.freestanding.switch:override();
        v5.freestanding.disable_yaw_modifiers:override();
        v5.freestanding.body_freestanding:override();
        v23.main = false;
    end;
    if not v108 then
        v16 = false;
        v17 = false;
        v18 = false;
        v19 = false;
        v20 = false;
        v21 = false;
        v24.active = false;
        return;
    else
        if table.concat(v5.hitboxes:get()) ~= table.concat(v22.rage_hitboxes) then
            v46(v5.hitboxes);
            v22.rage_hitboxes = v5.hitboxes:get();
        end;
        local v109 = entity.get_local_player();
        v5.doubletap.fakelag_limit:override(1);
        v5.doubletap.immediate_teleport:override(false);
        v5.peek_assist.switch:override(true);
        if v7.faster_stop:get() then
            v5.peek_assist.autostop:override("Early");
        end;
        if v7.ping_spike:get() then
            v5.fakelatency:override(100);
        end;
        if v7.freestanding:get() then
            v5.freestanding.switch:override(true);
            v5.freestanding.disable_yaw_modifiers:override(true);
            v5.freestanding.body_freestanding:override(true);
        end;
        local v110 = v7.movemode:get();
        local v111 = v109.m_vecVelocity:length2d();
        local v112 = bit.band(v109.m_fFlags, bit.lshift(1, 0)) ~= 1 or v107.in_forward or v107.in_moveleft or v107.in_moveright or v107.in_back or v107.in_jump;
        local l_middle_pos_0 = v22.middle_pos;
        local v114 = v109:get_origin();
        local v115 = l_middle_pos_0:dist2d(v114);
        if v110 == "Offensive" and not v17 and not v16 or v115 > 0.05 and v111 < 1.11 and v111 ~= 0 then
            v22.middle_pos = v114;
        end;
        local v116 = entity.get_threat();
        v22.current_target = v116;
        local v117 = v116 and v116:get_origin() or vector();
        local v118 = v116 and l_middle_pos_0:to(v117):angles().y or render.camera_angles().y;
        local v119 = v83(v109, l_middle_pos_0, v118, v13, v14);
        v24.active = true;
        local v120 = nil;
        local v121 = 0;
        if not v112 and v106(v109, v116) then
            local v122, v123 = v96(v119, v109, v116, v15);
            v121 = v123;
            v120 = v122;
            v24.tracing = true;
        else
            v24.tracing = false;
        end;
        v17 = v120 ~= nil;
        v22.active_point_index = v121;
        if v17 then
            v37(v107, v120, v109);
            v16 = false;
            v18 = true;
            v19 = false;
            v20 = false;
            v21 = false;
        elseif v112 then
            v16 = false;
            v18 = false;
            v19 = false;
            v20 = false;
            v21 = false;
        elseif v18 or v110 == "Defensive" then
            v16 = true;
            v19 = true;
            v18 = false;
        end;
        if not v16 then
            v22.last_returning_time = globals.tickcount;
        end;
        if v16 then
            if v115 < 0.05 then
                v16 = false;
                v19 = false;
                v20 = false;
                v21 = false;
            elseif v19 and rage.exploit:get() == 1 and v22.last_returning_time - globals.tickcount <= -7 then
                rage.exploit:force_teleport();
                v19 = false;
                v20 = true;
            elseif v22.last_returning_time == globals.tickcount - 1 then
                v21 = true;
            end;
        end;
        if v17 then
            v5.multipoint.head_scale:override(100);
            if v7.hitchance:get() then
                v5.hitchance:override(50);
            end;
        else
            v5.multipoint.head_scale:override();
            v5.hitchance:override();
        end;
        if v17 then
            v5.peek_assist.retreat_mode:override("On Shot");
        elseif v16 then
            v5.peek_assist.retreat_mode:override({
                [1] = "On Shot", 
                [2] = "On Key Release"
            });
        else
            v5.peek_assist.retreat_mode:override();
        end;
        if v20 and rage.exploit:get() ~= 1 then
            v5.doubletap.switch:override(false);
        else
            v5.doubletap.switch:override();
        end;
        if v21 then
            v5.doubletap.lag_options:override("Always On");
        else
            v5.doubletap.lag_options:override("On Peek");
        end;
        return;
    end;
end;
local function v148()
    -- upvalues: v5 (ref), v24 (ref), v7 (ref), v22 (ref), v13 (ref)
    local v125 = entity.get_local_player();
    if not v125 or not v125:is_alive() or not v5.thirdperson_switch:get() then
        return;
    else
        local l_data_0 = v24.data;
        local v127 = v7.accent:get();
        local v128 = v24.active and v7.visual:get();
        local l_values_0 = v24.values;
        local l_active_point_index_0 = v22.active_point_index;
        if l_values_0.global_alpha(0.04, v128) <= 0 then
            return;
        else
            for v131 = 0, #l_data_0 do
                local v132 = l_data_0[v131];
                local v133 = l_values_0.tweens.alpha[v131](0.04, v132 and v128);
                if v133 > 0 then
                    if v132 then
                        l_values_0.tweens.pos[v131](v133 > 0.2 and 0.015 or 0, (l_active_point_index_0 == v131 and v132 + vector(0, 0, 1.5) or v132) + vector(0, 0, -26 + 4 * v133));
                    end;
                    local v134 = render.world_to_screen(l_values_0.tweens.pos[v131].value);
                    if v134 ~= nil and v134.x ~= 0 then
                        local v135 = color();
                        if l_active_point_index_0 == v131 then
                            v135 = v127;
                        end;
                        render.circle(v134, v135.alpha_modulate(v135, (100 + 155 * (l_active_point_index_0 == v131 and 1 or 0)) * v133), 2.5, 0, 1);
                    end;
                end;
                local l_v131_0 = v131;
                local v137 = v131 + 1;
                if v131 == v13 / 2 then
                    l_v131_0 = 0;
                end;
                if v137 > 0 and v137 <= #l_data_0 then
                    local l_value_0 = l_values_0.tweens.alpha[v137].value;
                    if l_value_0 > 0 then
                        local v139 = render.world_to_screen(l_values_0.tweens.pos[l_v131_0].value);
                        local v140 = render.world_to_screen(l_values_0.tweens.pos[v137].value);
                        if v139 ~= nil and v140 ~= nil and v139.x ~= 0 and v140.x ~= 0 then
                            render.line(v139, v140, color(255, 50 * l_value_0));
                        end;
                    end;
                end;
            end;
            local v141 = l_values_0.debug.alpha(0.04, v7.debug_trace:get() and v128 and v24.tracing);
            if v141 > 0 then
                for v142 = 1, #v24.debug_data.vectors_to_hitboxes do
                    local v143 = v24.debug_data.vectors_to_hitboxes[v142];
                    for v144 = 1, #v143 do
                        local v145 = v143[v144];
                        if v145 then
                            local v146 = render.world_to_screen(v145[1]);
                            local v147 = render.world_to_screen(v145[2]);
                            render.line(v146, v147, color(255, 25 * v141));
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
esp.enemy:new_text("Automatic peek target", "PEEK", function(v149)
    -- upvalues: v24 (ref), v22 (ref)
    if v24.active and type(v22.current_target) == "userdata" and v149:get_index() == v22.current_target:get_index() then
        return "PEEK";
    else
        return;
    end;
end);
events.createmove:set(v124);
events.render:set(v148);
events.shutdown:set(function()
    -- upvalues: v5 (ref)
    v5.multipoint.head_scale:override();
    v5.hitchance:override();
    v5.doubletap.switch:override();
    v5.doubletap.lag_options:override();
    v5.doubletap.fakelag_limit:override();
    v5.doubletap.immediate_teleport:override();
    v5.peek_assist.switch:override();
    v5.peek_assist.retreat_mode:override();
    v5.peek_assist.max_distance:override();
    v5.peek_assist.autostop:override();
    v5.fakelatency:override();
    v5.freestanding.switch:override();
    v5.freestanding.disable_yaw_modifiers:override();
    v5.freestanding.body_freestanding:override();
end);