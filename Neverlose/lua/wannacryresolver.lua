ui.sidebar("Advanced Resolver", "face-sad-cry");
local _ = ui.create("Information");
local v1 = ui.create("Statistics");
local v2 = ui.create("Miscellaneous");
local _ = color(212, 212, 212):to_hex();
local _ = color(161, 161, 161):to_hex();
local _ = color(252, 78, 3, 255):to_hex();
local v6 = color(21, 255, 0):to_hex();
local _ = color(3, 169, 252):to_hex();
local v8 = v1:switch("Jitter Detection", true);
local v9 = v1:switch("Aggressive Bruteforce", true);
local v10 = v1:switch("Debug Info", false);
local _ = v2:switch("Hit logs", true);
local v12 = v2:switch("Save History", true);
v2:label("\a" .. v6 .. "Resolver is active. To deactivate, unload the script.");
v2:button("Unload", function()
    common.unload_script();
end);
ffi.cdef("    typedef unsigned char uint8_t;\n    int GetAsyncKeyState(int vKey);\n    uint8_t GetKeyState(int nVirtKey);\n    int MapVirtualKeyA(int uCode, int uMapType);\n");
local v13 = ffi.typeof("    struct {\n        char    u0[ 0x18 ];\n        float    anim_update_timer;\n        char    u1[ 0xC ];\n        float    started_moving_time;\n        float    last_move_time;\n        char    u2[ 0x10 ];\n        float    last_lby_time;\n        char    u3[ 0x8 ];\n        float    run_amount;\n        char    u4[ 0x10 ];\n        void    *entity;\n        __int32 active_weapon;\n        __int32 last_active_weapon;\n        float    m_flLastClientSideAnimationUpdateTime;\n        __int32 m_iLastClientSideAnimationUpdateFramecount;\n        float    m_flAnimUpdateDelta;\n        float    m_flEyeYaw;\n        float    m_flPitch;\n        float    m_flGoalFeetYaw;\n        float    m_flCurrentFeetYaw;\n        float    m_flCurrentTorsoYaw;\n        float    m_flUnknownVelocityLean;\n        float    m_flLeanAmount;\n        char    u5[ 0x4 ];\n        float    m_flFeetCycle;\n        float    m_flFeetYawRate;\n        char    u6[ 0x4 ];\n        float    m_fDuckAmount;\n        float    m_fLandingDuckAdditiveSomething;\n        char    u7[ 0x4 ];\n        float     m_vOriginX; //0xB0\n        float     m_vOriginY; //0xB4\n        float     m_vOriginZ; //0xB8\n        float     m_vLastOriginX; //0xBC\n        float     m_vLastOriginY; //0xC0\n        float     m_vLastOriginZ; //0xC4\n        float    m_vVelocityX;\n        float    m_vVelocityY;\n        char    u8[ 0x10 ];\n        float    m_flUnknownFloat1; //move_direction_1\n        float    m_flUnknownFloat2; //move_direction_2\n        char    u9[ 0x4 ];\n        float    m_flSpeed2D;\n        float    m_flUpVelocity;\n        float    m_flSpeedNormalized;\n        float    m_flFeetSpeedForwardsOrSideWays;\n        float    m_flFeetSpeedUnknownForwardOrSideways;\n        float    m_flTimeSinceStartedMoving;\n        float    m_flTimeSinceStoppedMoving;\n        bool    m_bOnGround;\n        bool    m_bInHitGroundAnimation;\n        char    u10[ 0x4 ];\n        float    m_flLastOriginZ;\n        float    m_flHeadHeightOrOffsetFromHittingGroundAnimation;\n        float    m_flStopToFullRunningFraction;\n        char    u11[ 0x14 ];\n        __int32 m_flUnknownFraction;\n        char    u12[ 0x20 ];\n        float    last_anim_update_time;\n        float    moving_direction_x;\n        float    moving_direction_y;\n        float    moving_direction_z;\n        char    u13[ 0x44 ];\n        __int32 started_moving;\n        char    u14[ 0x8 ];\n        float    lean_yaw;\n        char    u15[ 0x8 ];\n        float    poses_speed;\n        char    u16[ 0x8 ];\n        float    ladder_speed;\n        char    u17[ 0x8 ];\n        float    ladder_yaw;\n        char    u18[ 0x8 ];\n        float    some_pose;\n        char    u19[ 0x14 ];\n        float    body_yaw;\n        char    u20[ 0x8 ];\n        float    body_pitch;\n        char    u21[ 0x8 ];\n        float    death_yaw;\n        char    u22[ 0x8 ];\n        float    stand;\n        char    u23[ 0x8 ];\n        float    jump_fall;\n        char    u24[ 0x8 ];\n        float    aim_blend_stand_idle;\n        char    u25[ 0x8 ];\n        float    aim_blend_crouch_idle;\n        char    u26[ 0x8 ];\n        float    strafe_yaw;\n        char    u27[ 0x8 ];\n        float    aim_blend_stand_walk;\n        char    u28[ 0x8 ];\n        float    aim_blend_stand_run;\n        char    u29[ 0x8 ];\n        float    aim_blend_crouch_walk;\n        char    u30[ 0x8 ];\n        float    move_blend_walk;\n        char    u31[ 0x8 ];\n        float    move_blend_run;\n        char    u32[ 0x8 ];\n        float    move_blend_crouch;\n        char    u33[ 0x4 ];\n        float    speed;\n        __int32 moving_in_any_direction;\n        float    acceleration;\n        char    u34[ 0x74 ];\n        float    crouch_height;\n        __int32 is_full_crouched;\n        char    u35[ 0x4 ];\n        float    velocity_subtract_x;\n        float    velocity_subtract_y;\n        float    velocity_subtract_z;\n        float    standing_head_height;\n    } **\n");
local v14 = {
    actual_misses = {}, 
    variables = {}, 
    player_data = {}, 
    lby_timers = {}, 
    pattern_history = {}, 
    get_client_entity_func = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)")
};
math.calc_angle = function(v15, v16)
    if not v15 or not v16 then
        return vector(0, 0, 0);
    else
        local v17 = v16 - v15;
        local v18 = math.sqrt(v17.x * v17.x + v17.y * v17.y);
        if v18 == 0 then
            return vector(0, 0, 0);
        else
            local v19 = math.atan2(-v17.z, v18) * (180 / math.pi);
            local v20 = math.atan2(v17.y, v17.x) * (180 / math.pi);
            return vector(v19, v20, 0);
        end;
    end;
end;
math.deg_to_rad = function(v21)
    return (v21 or 0) * (math.pi / 180);
end;
v14.round = function(v22, v23)
    if not v22 then
        v22 = 0;
    end;
    if not v23 then
        v23 = 0;
    end;
    if type(v22) ~= "number" or type(v23) ~= "number" then
        return 0;
    else
        local v24 = 10 ^ v23;
        return math.floor(v22 * v24 + 0.5) / v24;
    end;
end;
math.normalize_yaw = function(v25)
    if type(v25) ~= "number" then
        return 0;
    else
        while v25 > 180 do
            v25 = v25 - 360;
        end;
        while v25 < -180 do
            v25 = v25 + 360;
        end;
        return v25;
    end;
end;
math.delta_yaw = function(v26, v27)
    if type(v26) ~= "number" or type(v27) ~= "number" then
        return 0;
    else
        local v28 = v26 - v27;
        if v28 > 180 then
            v28 = v28 - 360;
        elseif v28 < -180 then
            v28 = v28 + 360;
        end;
        return v28;
    end;
end;
v14.get_client_entity = function(v29)
    -- upvalues: v14 (ref)
    if not v29 or not v14.get_client_entity_func or not get_client_entity_list then
        return nil;
    else
        return v14.get_client_entity_func(get_client_entity_list, v29);
    end;
end;
v14.get_animstate = function(v30)
    -- upvalues: v13 (ref), v14 (ref)
    if not v30 or not ffi or not v13 then
        return nil;
    else
        local v31 = v14.get_client_entity(v30:get_index());
        if not v31 or ffi.isnull(v31) then
            return nil;
        else
            local l_status_0, l_result_0 = pcall(function()
                -- upvalues: v31 (ref)
                return ffi.cast("char*", v31) + 39264;
            end);
            if not l_status_0 or not l_result_0 or ffi.isnull(l_result_0) then
                return nil;
            else
                return ffi.cast(v13, l_result_0)[0];
            end;
        end;
    end;
end;
v14.GetGoalFeetYaw = function(v34)
    -- upvalues: v14 (ref)
    local v35 = v14.get_animstate(v34);
    return v35 and v35.m_flGoalFeetYaw or 0;
end;
v14.SetGoalFeetYaw = function(v36, v37)
    -- upvalues: v14 (ref)
    local v38 = v14.get_animstate(v36);
    if v38 and v37 then
        v38.m_flGoalFeetYaw = math.normalize_yaw(v37);
    end;
end;
v14.GetDSYDelta = function(v39)
    if not v39 then
        return 0;
    else
        local v40 = v39:get_anim_state();
        if not v40 then
            return 58;
        else
            local v41 = math.max(0, math.min(v40.m_flFeetSpeedForwardsOrSideWays or 0, 1));
            local v42 = math.max(0, math.min(v40.m_flFeetSpeedUnknownForwardOrSideways or 0, 1));
            local v43 = ((v40.m_flStopToFullRunningFraction or 0) * -0.30000001 - 0.19999999) * v41 + 1;
            if v40.m_fDuckAmount > 0 then
                v43 = v43 + v40.m_fDuckAmount * v42 * (0.5 - v43);
            end;
            if not v40.m_bOnGround then
                v43 = v43 * 0.9;
            end;
            return (v40.m_flAimYawMax or 58) * v43;
        end;
    end;
end;
v14.get_velocity = function(v44)
    if v44 == nil or not v44.m_vecVelocity then
        return 0;
    else
        return v44.m_vecVelocity:length2d();
    end;
end;
v14.is_standing = function(v45)
    -- upvalues: v14 (ref)
    return v14.get_velocity(v45) < 5;
end;
v14.get_body_bounds = function(v46)
    -- upvalues: v14 (ref)
    local v47 = 58;
    local v48 = 58;
    if not v46 then
        return v47, v48;
    else
        local v49 = v14.get_velocity(v46);
        if v49 > 5 then
            local v50 = math.min(v49 / 250, 1);
            v47 = math.max(29, 58 - v50 * 15);
            v48 = v47;
        end;
        return v47, v48;
    end;
end;
v14.check_lby_update = function(v51, v52)
    -- upvalues: v14 (ref), v12 (ref)
    if not v51 or not v52 or not v14.lby_timers then
        return false, 0;
    else
        if not v14.lby_timers[v52] then
            v14.lby_timers[v52] = {
                expected_update = false, 
                last_lby_time = 0, 
                last_angle = 0, 
                last_check_time = globals.curtime
            };
        end;
        local v53 = v14.get_animstate(v51);
        if not v53 then
            return false, v14.lby_timers[v52] and v14.lby_timers[v52].last_angle or 0;
        else
            local l_last_lby_time_0 = v53.last_lby_time;
            local v55 = v14.lby_timers[v52];
            local v56 = v14.get_velocity(v51) > 5;
            local v57 = globals.curtime - v55.last_lby_time;
            local v58 = false;
            if v56 then
                v58 = v55.last_lby_time < l_last_lby_time_0;
            elseif v14.is_standing(v51) and (v55.last_lby_time < l_last_lby_time_0 or v57 >= 1.08) then
                v58 = true;
            end;
            if v58 then
                v55.last_lby_time = l_last_lby_time_0;
                v55.last_angle = v53.m_flCurrentFeetYaw;
                v55.expected_update = false;
                if v12:get() then
                    if not v14.pattern_history[v52] then
                        v14.pattern_history[v52] = {
                            count = 0, 
                            angles = {}
                        };
                    end;
                    local v59 = v14.pattern_history[v52];
                    v59.count = v59.count + 1;
                    if v51.m_angEyeAngles then
                        v59.angles[v59.count % 8] = math.normalize_yaw(v53.m_flCurrentFeetYaw - v51.m_angEyeAngles.y);
                    end;
                end;
            end;
            v55.last_check_time = globals.curtime;
            return v58, v55.last_angle;
        end;
    end;
end;
v14.detect_desync_pattern = function(v60)
    -- upvalues: v12 (ref), v14 (ref)
    if not v12:get() or not v14.pattern_history or not v14.pattern_history[v60] or v14.pattern_history[v60].count < 4 then
        return "unknown";
    else
        local v61 = v14.pattern_history[v60];
        local l_angles_0 = v61.angles;
        local v63 = math.min(v61.count, 8);
        if v63 <= 0 then
            return "unknown";
        else
            local v64 = l_angles_0[0 % #l_angles_0];
            if v64 == nil then
                return "static";
            else
                local v65 = true;
                for v66 = 1, v63 - 1 do
                    local v67 = l_angles_0[v66 % #l_angles_0];
                    if v67 == nil or math.abs(math.delta_yaw(v67, v64)) > 10 then
                        v65 = false;
                        break;
                    end;
                end;
                if v65 then
                    return "static";
                else
                    local v68 = true;
                    local v69 = l_angles_0[0 % #l_angles_0];
                    local v70 = l_angles_0[1 % #l_angles_0];
                    if v69 == nil or v70 == nil or math.abs(math.delta_yaw(v69, v70)) < 10 then
                        v68 = false;
                    else
                        for v71 = 0, v63 - 1 do
                            local v72 = l_angles_0[v71 % #l_angles_0];
                            if v72 == nil then
                                v68 = false;
                                break;
                            else
                                local v73 = v71 % 2 == 0 and v69 or v70;
                                if math.abs(math.delta_yaw(v72, v73)) > 10 then
                                    v68 = false;
                                    break;
                                end;
                            end;
                        end;
                    end;
                    if v68 then
                        return "jitter";
                    else
                        return "random";
                    end;
                end;
            end;
        end;
    end;
end;
v14.detect_lby_breaker = function(v74, v75)
    -- upvalues: v14 (ref), v10 (ref)
    if not v74 or not v75 or not v14.player_data or not v14.player_data[v75] then
        return false;
    else
        local v76 = v14.player_data[v75];
        if v76.missed_shots < 3 then
            return false;
        elseif v76.last_miss_side ~= nil and v76.consecutive_same_side >= 3 then
            v76.is_lby_breaker = true;
            v76.last_side = v76.last_side * -1;
            v76.consecutive_same_side = 0;
            if v10:get() then
                print_dev("LBY Breaker detected for " .. (v74:get_name() or "player") .. ". Inverting side.");
            end;
            return true;
        else
            return false;
        end;
    end;
end;
v14.get_records = function(v77, v78)
    -- upvalues: v14 (ref), v9 (ref)
    if not v77 or not v78 or not v14.player_data or not v14.player_data[v78] then
        return;
    else
        local v79 = v14.player_data[v78];
        local v80, v81 = v14.get_body_bounds(v77);
        local v82 = globals.tickcount % 5;
        local v83 = v77.m_angEyeAngles and v77.m_angEyeAngles.y or 0;
        if v79.is_lby_breaker or v9:get() then
            local v84 = {
                [1] = 45, 
                [2] = 60, 
                [3] = 30, 
                [4] = 20
            };
            local v85 = v82 % 2 == 0 and -1 or 1;
            local v86 = math.floor(v82 / 2) + 1;
            if v86 >= 1 and v86 <= #v84 then
                v14.SetGoalFeetYaw(v77, v83 + v84[v86] * v85);
            end;
        else
            local v87 = v77:get_anim_overlay(6);
            local v88 = (v87 and v87.playback_rate or 0) * 100000000;
            if v82 == 0 then
                v14.SetGoalFeetYaw(v77, v83 - v80);
                v79.left_rate = v14.round(v88, 2);
            elseif v82 == 1 then
                v14.SetGoalFeetYaw(v77, v83 + v81);
                v79.right_rate = v14.round(v88, 2);
            elseif v82 == 2 then
                local v89 = v14.get_animstate(v77);
                if v89 then
                    local v90 = math.normalize_yaw(v89.m_flCurrentFeetYaw - v83);
                    v14.SetGoalFeetYaw(v77, v83 + v90);
                    v79.lby_rate = v14.round(v88, 2);
                end;
            elseif v82 == 3 then
                v14.SetGoalFeetYaw(v77, v83 - v80 * 0.5);
                v79.half_left_rate = v14.round(v88, 2);
            elseif v82 == 4 then
                local v91 = math.random(40, 60);
                local v92 = v79.missed_shots % 2 == 0 and 1 or -1;
                v14.SetGoalFeetYaw(v77, v83 + v91 * v92);
                v79.random_rate = v14.round(v88, 2);
            end;
        end;
        local v93 = v77:get_anim_overlay(3);
        local v94 = v77:get_anim_overlay(12);
        v79.move_rate = v14.round((v93 and v93.playback_rate or 0) * 10000, 2);
        v79.speed_rate = v14.round((v94 and v94.playback_rate or 0) * 10000, 2);
        local v95 = v14.get_animstate(v77);
        if v95 then
            v79.body_yaw = v95.m_flCurrentFeetYaw;
            v79.eye_yaw = v95.m_flEyeYaw;
        end;
        local v96, v97 = v14.check_lby_update(v77, v78);
        if v96 then
            v79.last_lby_angle = v97;
            v79.lby_updated_time = globals.curtime;
        end;
        return;
    end;
end;
v14.save_player = function(v98)
    -- upvalues: v14 (ref), v10 (ref)
    if not v98 then
        return;
    else
        local v99 = v98:get_index();
        if not v99 then
            return;
        else
            if not v14.player_data[v99] then
                v14.player_data[v99] = {
                    last_side = 1, 
                    is_lby_breaker = false, 
                    consecutive_same_side = 0, 
                    body_yaw = 0, 
                    eye_yaw = 0, 
                    missed_shots = 0, 
                    move_rate = 0, 
                    velocity = 0, 
                    random_rate = 0, 
                    speed_rate = 0, 
                    half_left_rate = 0, 
                    lby_rate = 0, 
                    right_rate = 0, 
                    left_rate = 0, 
                    yaw = 58, 
                    current_pattern = "unknown", 
                    flip_tick = 0, 
                    m_wall_detect_ang = 0, 
                    m_did_wall_detect = false, 
                    interaction = 1, 
                    center_rate = 0, 
                    original_rate = 0, 
                    past_yaw = 0, 
                    lby_updated_time = 0, 
                    last_lby_angle = 0, 
                    player = v98
                };
                if v10:get() then
                    print_dev("Initialized player data for index: " .. v99);
                end;
            else
                v14.player_data[v99].player = v98;
            end;
            return;
        end;
    end;
end;
v14.wall_detect = function(v100)
    -- upvalues: v10 (ref)
    if not v100 or not v100.player or not entity.get_local_player() then
        if v100 then
            v100.m_did_wall_detect = false;
        end;
        return;
    else
        v100.m_did_wall_detect = true;
        local function v106(v101, v102, v103)
            local l_v101_0 = v101;
            local v105 = math.deg_to_rad(v102);
            l_v101_0.x = l_v101_0.x + math.cos(v105) * v103;
            l_v101_0.y = l_v101_0.y + math.sin(v105) * v103;
            return l_v101_0;
        end;
        local v107 = v100.player:get_origin() + vector(0, 0, 60);
        local v108 = entity.get_local_player():get_eye_position();
        if not v107 or not v108 then
            return;
        else
            local v109 = math.calc_angle(v107, v108);
            local v110 = math.normalize_yaw(v109.y);
            local v111 = 25;
            local v112 = 12;
            local v113 = v106(v107, v110 - 90, v111);
            local v114 = v106(v107, v110 + 90, v111);
            local v115 = v106(v107, v110 - 90, v112);
            local v116 = v106(v107, v110 + 90, v112);
            local v117 = v106(v108, v110 - 90, v111);
            local v118 = v106(v108, v110 + 90, v111);
            local function v123(v119, v120)
                -- upvalues: v100 (ref)
                if not utils or not utils.trace_bullet then
                    return 0, nil;
                else
                    local v121, v122 = utils.trace_bullet(v100.player, v119, v120);
                    return v121 or 0, v122;
                end;
            end;
            local function v135(v124, v125, v126, v127, v128)
                -- upvalues: v123 (ref)
                local v129, _ = v123(v124, v126);
                local v131, _ = v123(v125, v127);
                if v128 then
                    return v129 > 0;
                else
                    local v133 = v129 <= 0;
                    local v134 = v131 <= 0;
                    if v133 and not v134 then
                        return 1;
                    elseif not v133 and v134 then
                        return 2;
                    else
                        return 0;
                    end;
                end;
            end;
            local v136 = 0;
            local v137 = v135(v113, v114, v117, v118, false);
            local v138 = true;
            if v137 == 1 then
                local v139, _ = v123(v107, v118);
                v138 = v139 > 0;
            elseif v137 == 2 then
                local v141, _ = v123(v107, v117);
                v138 = v141 > 0;
            end;
            if v137 ~= 0 and v138 then
                v136 = v137;
            else
                v137 = v135(v113, v114, v118, v117, false);
                v138 = true;
                if v137 == 1 then
                    local v143, _ = v123(v107, v117);
                    v138 = v143 > 0;
                elseif v137 == 2 then
                    local v145, _ = v123(v107, v118);
                    v138 = v145 > 0;
                end;
                if v137 ~= 0 and v138 then
                    v136 = v137;
                end;
            end;
            local v147 = false;
            if v136 == 1 then
                local v148, _ = v123(v116, v108);
                v147 = v148 <= 0;
            elseif v136 == 2 then
                local v150, _ = v123(v115, v108);
                v147 = v150 <= 0;
            end;
            if v147 then
                v136 = 0;
            end;
            if v136 == 0 then
                v100.m_did_wall_detect = false;
                return;
            else
                v100.last_side = v136 == 1 and -1 or 1;
                v100.m_wall_detect_ang = math.normalize_yaw(v110 + v100.last_side * 90);
                if v10:get() then
                    print_dev("Wall detect: Set side to " .. v100.last_side .. " for " .. (v100.player:get_name() or "player"));
                end;
                return;
            end;
        end;
    end;
end;
v14.update_animation = function(v152)
    -- upvalues: v14 (ref), v8 (ref), v10 (ref)
    if not v152 or not v152:is_enemy() or not v152:is_alive() or v152:is_dormant() then
        return;
    else
        local v153 = v152:get_index();
        if not v153 then
            return;
        else
            if not v14.player_data[v153] then
                v14.save_player(v152);
                if not v14.player_data[v153] then
                    return;
                end;
            end;
            local v154 = v14.player_data[v153];
            v154.current_pattern = v14.detect_desync_pattern(v153);
            if v8:get() and v154.current_pattern == "jitter" and v154.flip_tick ~= globals.tickcount then
                v154.last_side = -v154.last_side;
                v154.flip_tick = globals.tickcount;
                if v10:get() then
                    print_dev("Jitter detected - alternating side for " .. (v152:get_name() or "player"));
                end;
            end;
            local l_interaction_0 = v154.interaction;
            v154.velocity = v14.get_velocity(v152);
            if l_interaction_0 == 1 then
                v14.get_records(v152, v153);
            end;
            v154.previous_m_eye_angles = v154.m_eye_angles;
            v154.m_eye_angles = v152.m_angEyeAngles;
            local v156 = 0;
            if v154.previous_m_eye_angles and v154.m_eye_angles then
                v156 = math.delta_yaw(v154.m_eye_angles.y, v154.previous_m_eye_angles.y);
            end;
            local v157 = v14.is_standing(v152);
            local v158, v159 = v14.check_lby_update(v152, v153);
            if v157 then
                if v158 then
                    local v160 = 0;
                    if v154.m_eye_angles then
                        v160 = math.delta_yaw(v159, v154.m_eye_angles.y);
                    end;
                    if math.abs(v160) > 20 then
                        v154.last_side = v160 > 0 and 1 or -1;
                        if v10:get() then
                            print_dev("LBY updated standing - setting side to " .. v154.last_side .. " for " .. (v152:get_name() or "player"));
                        end;
                    end;
                elseif v154.missed_shots > 1 and not v14.detect_lby_breaker(v152, v153) and v154.missed_shots % 2 == 0 then
                    v154.last_side = -v154.last_side;
                    if v10:get() then
                        print_dev("Missed shot standing - flipping side to " .. v154.last_side .. " for " .. (v152:get_name() or "player"));
                    end;
                end;
            else
                if math.abs(v156) > 35 then
                    v154.last_side = v156 > 0 and 1 or -1;
                end;
                v154.is_lby_breaker = false;
                v154.consecutive_same_side = 0;
                v154.last_miss_side = nil;
            end;
            if v154.m_did_wall_detect and v154.m_wall_detect_ang ~= 0 then
                v154.last_side = v154.last_side;
                if v10:get() then
                    print_dev("Using Wall Detect side: " .. v154.last_side .. " for " .. (v152:get_name() or "player"));
                end;
            end;
            local l_yaw_0 = v154.yaw;
            local v162 = nil;
            if v154.m_eye_angles then
                v162 = v154.m_eye_angles.y + l_yaw_0 * v154.last_side;
            else
                v162 = v154.past_yaw;
            end;
            if v154.past_yaw ~= 0 then
                local v163 = math.delta_yaw(v162, v154.past_yaw);
                if math.abs(v163) > 60 then
                    v162 = math.normalize_yaw(v154.past_yaw + v163 * 0.5);
                end;
            end;
            v14.SetGoalFeetYaw(v152, v162);
            v154.past_yaw = v162;
            v154.interaction = v154.interaction + 1;
            if v154.interaction > 3 then
                v154.interaction = 1;
            end;
            return;
        end;
    end;
end;
local v164 = vector();
v14.on_createmove = function()
    -- upvalues: v164 (ref), v14 (ref)
    local v165 = entity.get_local_player();
    if not v165 then
        return;
    else
        local v166 = v165:get_eye_position();
        if not v166 then
            return;
        else
            local v167 = true;
            if v164 then
                v167 = (v166 - v164):length() > 2;
            end;
            for _, v169 in ipairs(entity.get_players(true, false)) do
                if v169 and v169:is_alive() then
                    local v170 = v169:get_index();
                    if v170 and v14.player_data[v170] then
                        if v167 then
                            v14.player_data[v170].m_did_wall_detect = false;
                        end;
                        if not v14.player_data[v170].m_did_wall_detect then
                            v14.wall_detect(v14.player_data[v170]);
                        end;
                    end;
                end;
            end;
            v164 = v166;
            return;
        end;
    end;
end;
v14.init = function()
    -- upvalues: v14 (ref), v10 (ref)
    v14.player_data = {};
    v14.lby_timers = {};
    v14.pattern_history = {};
    if v10:get() then
        print_dev("Resolver data re-initialized.");
    end;
end;
local function v174(v171, v172)
    local v173 = ui.get_mouse_position();
    if not v171 then
        return false;
    else
        return v173.x >= v171.x and v173.x <= v171.x + v172.x and v173.y >= v171.y and v173.y <= v171.y + v172.y;
    end;
end;
local function _()
    return ui.get_mouse_position();
end;
local v176 = {
    shots = 1, 
    aim_tick = 0, 
    hit_groups = {
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
    }, 
    reasons = {
        resolver = "resolver", 
        death = "death", 
        ["player death"] = "player death", 
        ["unregistered shot"] = "unregistered shot", 
        ["lagcomp failure"] = "lagcomp failure", 
        ["prediction error"] = "prediction error", 
        misprediction = "misprediction", 
        correction = "correction", 
        spread = "spread", 
        ["damage rejection"] = "damage rejection", 
        occlusion = "occlusion"
    }
};
v176.shot_tick = function()
    -- upvalues: v176 (ref)
    v176.aim_tick = globals.tickcount % 1000;
end;
local v177 = {
    max_history_points = 50, 
    global = {
        hits = 0, 
        shots_fired = 0, 
        total_damage = 0, 
        misses = 0, 
        hitgroup_counts = {}, 
        miss_reasons = {}, 
        accuracy_history = {}
    }, 
    players = {}, 
    session_start = globals.realtime
};
local v178 = {
    background = color(18, 18, 18, 240), 
    card_bg = color(28, 28, 30, 220), 
    card_bg_secondary = color(44, 44, 46, 220), 
    card_highlight = color(255, 255, 255, 255), 
    text_primary = color(255, 255, 255, 220), 
    text_secondary = color(255, 255, 255, 160), 
    text_tertiary = color(255, 255, 255, 120), 
    accent_blue = color(10, 132, 255, 220), 
    accent_green = color(48, 209, 88, 220), 
    accent_red = color(255, 69, 58, 220), 
    accent_orange = color(255, 159, 10, 220), 
    accent_purple = color(191, 90, 242, 220), 
    separator = color(60, 60, 65, 180), 
    highlight = color(120, 120, 128, 60), 
    glow = color(10, 132, 255, 60), 
    chart_colors = {
        color(10, 132, 255, 220), 
        color(48, 209, 88, 220), 
        color(255, 69, 58, 220), 
        color(255, 159, 10, 220), 
        color(191, 90, 242, 220), 
        color(94, 92, 230, 220), 
        color(255, 55, 95, 220), 
        color(50, 215, 75, 220), 
        color(255, 179, 64, 220), 
        color(142, 142, 147, 220)
    }
};
local v179 = ui.create("Analytics Dashboard");
local v180 = v179:switch("Show Dashboard", true);
local _ = v179:combo("Performance Mode", {
    [1] = "Battery Saver", 
    [2] = "High Quality"
}, 1);
local v182 = v179:switch("Enable Animations", true);
local _ = v179:slider("UI Opacity", 0, 100, 100);
v182:visibility(false);
local _ = render.load_font("Verdana", 14, "a");
local v185 = render.load_font("Verdana", 14, "b");
local v186 = render.load_font("Verdana", 16, "b");
local v187 = render.load_font("Verdana", 18, "b");
local v188 = render.load_font("Verdana", 24, "b");
local _ = render.load_font("Verdana", 32, "b");
local v190 = render.load_font("Verdana", 14, "a");
local v191 = 0;
local v192 = 8;
local v193 = 0;
local v194 = {
    accuracy = 0, 
    shots_fired = 0, 
    hits = 0, 
    damage = 0, 
    session = 0, 
    misses = 0
};
local v195 = {
    minimized_height = 40, 
    grid_size = 10, 
    snap_distance = 15, 
    resizing = false, 
    canre = false, 
    cards = {}, 
    menu = {
        hover_time = 0, 
        anim_time = 0, 
        width = 240, 
        visible = false, 
        position = vector(render.screen_size().x, 60), 
        target_position = vector(render.screen_size().x - 240, 60)
    }, 
    resize_start = vector(0, 0), 
    resize_start_size = vector(0, 0), 
    card_states = {
        MAXIMIZED = 2, 
        MINIMIZED = 1, 
        NORMAL = 0, 
        DOCKED_BOTTOM = 6, 
        DOCKED_TOP = 5, 
        DOCKED_RIGHT = 4, 
        DOCKED_LEFT = 3
    }, 
    settings = {
        animations = true, 
        snap_enabled = true, 
        show_grid = true
    }
};
local _ = {
    MAXIMIZED = 2, 
    MINIMIZED = 1, 
    NORMAL = 0, 
    DOCKED_BOTTOM = 6, 
    DOCKED_TOP = 5, 
    DOCKED_RIGHT = 4, 
    DOCKED_LEFT = 3
};
local function v200(v197, v198, v199)
    return v197 + (v198 - v197) * v199;
end;
local function v202(v201)
    return 1 - (1 - v201) * (1 - v201);
end;
local function v204(v203)
    if v203 >= 1000000 then
        return string.format("%.1fM", v203 / 1000000);
    elseif v203 >= 1000 then
        return string.format("%.1fK", v203 / 1000);
    else
        return tostring(math.floor(v203));
    end;
end;
local function v206(v205)
    -- upvalues: v195 (ref)
    return vector(math.floor(v205.x / v195.grid_size) * v195.grid_size, math.floor(v205.y / v195.grid_size) * v195.grid_size);
end;
local function _(v207, v208, v209, v210)
    return v207.x < v209.x + v210.x and v207.x + v208.x > v209.x and v207.y < v209.y + v210.y and v207.y + v208.y > v209.y;
end;
v177.update_player = function(v212, v213, v214, v215, v216)
    -- upvalues: v177 (ref), v176 (ref), v194 (ref), v193 (ref)
    if not v177.players[v212] then
        v177.players[v212] = {
            hits = 0, 
            shots_fired = 0, 
            total_damage = 0, 
            misses = 0, 
            hitgroup_counts = {}, 
            miss_reasons = {}, 
            last_update = globals.realtime
        };
    end;
    local v217 = v177.players[v212];
    v217.shots_fired = v217.shots_fired + 1;
    v177.global.shots_fired = v177.global.shots_fired + 1;
    if v213 then
        v217.hits = v217.hits + 1;
        v217.total_damage = v217.total_damage + (v214 or 0);
        v177.global.hits = v177.global.hits + 1;
        v177.global.total_damage = v177.global.total_damage + (v214 or 0);
        local v218 = v215 and v176.hit_groups[v215] or "unknown";
        v217.hitgroup_counts[v218] = (v217.hitgroup_counts[v218] or 0) + 1;
        v177.global.hitgroup_counts[v218] = (v177.global.hitgroup_counts[v218] or 0) + 1;
        v194.hits = globals.realtime;
        v194.damage = globals.realtime;
    else
        v217.misses = v217.misses + 1;
        v177.global.misses = v177.global.misses + 1;
        local v219 = v216 and (v176.reasons[v216] or v216) or "unknown";
        v217.miss_reasons[v219] = (v217.miss_reasons[v219] or 0) + 1;
        v177.global.miss_reasons[v219] = (v177.global.miss_reasons[v219] or 0) + 1;
        v194.misses = globals.realtime;
    end;
    local v220 = v177.global.shots_fired > 0 and v177.global.hits / v177.global.shots_fired * 100 or 0;
    table.insert(v177.global.accuracy_history, v220);
    if #v177.global.accuracy_history > v177.max_history_points then
        table.remove(v177.global.accuracy_history, 1);
    end;
    v217.last_update = globals.realtime;
    v193 = globals.realtime;
    v194.shots_fired = globals.realtime;
    v194.accuracy = globals.realtime;
end;
local function v229()
    -- upvalues: v195 (ref), v178 (ref), v186 (ref), v174 (ref), v190 (ref)
    local v221 = ui.get_mouse_position();
    local v222 = render.screen_size();
    if v221.x > v222.x - 50 and v221.y < v222.y * 0.3 then
        v195.menu.hover_time = math.min(v195.menu.hover_time + globals.frametime * 4, 1);
    else
        v195.menu.hover_time = math.max(v195.menu.hover_time - globals.frametime * 4, 0);
    end;
    if v195.menu.hover_time > 0.1 then
        v195.menu.anim_time = math.min(v195.menu.anim_time + globals.frametime * 8, 1);
    else
        v195.menu.anim_time = math.max(v195.menu.anim_time - globals.frametime * 8, 0);
    end;
    if v195.menu.visible or v195.menu.anim_time > 0 then
        local v223 = vector(v222.x - v195.menu.width * v195.menu.anim_time, 60);
        render.rect(v223, v223 + vector(v195.menu.width, v222.y - 60), v178.card_bg, 12);
        render.blur(v223, v223 + vector(v195.menu.width, v222.y - 60), 12, 0.4);
        render.text(v186, v223 + vector(16, 16), v178.text_primary, nil, "WIDGETS");
        local v224 = v223.y + 60;
        for _, v226 in ipairs(v195.cards) do
            local v227 = vector(v223.x + v195.menu.width - 40, v224 + 4);
            local l_visible_0 = v226.visible;
            render.rect(v227, v227 + vector(32, 18), v178.card_bg_secondary, 9);
            render.rect(v227 + vector(l_visible_0 and 14 or 2, 2), v227 + vector(l_visible_0 and 30 or 16, 16), l_visible_0 and v178.accent_blue or v178.text_secondary, 7);
            if v174(v227, vector(32, 18)) and common.is_button_down(1) then
                v226.visible = not v226.visible;
            end;
            render.text(v190, vector(v223.x + 16, v224 + 4), v178.text_primary, nil, v226.title);
            v224 = v224 + 40;
        end;
    end;
end;
local function v234(v230, v231, v232, v233)
    -- upvalues: v195 (ref)
    return {
        z_index = 0, 
        anim_progress = 0, 
        visible = true, 
        dragging = false, 
        minimized = false, 
        id = string.lower(v230:gsub(" ", "_") .. "_" .. string.format("%x", math.random(0, 65535))), 
        title = v230, 
        original_size = v231:clone(), 
        current_size = v231:clone(), 
        position = vector(0, 0), 
        state = v195.card_states.NORMAL, 
        render = v232, 
        drag_offset = vector(0, 0), 
        last_interaction_time = globals.realtime, 
        settings = {
            opacity = 1, 
            show_border = true, 
            show_header = true
        }, 
        canresize = v233
    };
end;
local function v239(v235)
    -- upvalues: v195 (ref)
    local v236 = 0;
    for _, v238 in ipairs(v195.cards) do
        if v238 ~= v235 and v236 < v238.z_index then
            v236 = v238.z_index;
        end;
    end;
    v235.z_index = v236 + 1;
end;
local function v259(v240, v241, v242, v243)
    -- upvalues: v195 (ref), v202 (ref), v191 (ref), v186 (ref), v178 (ref), v177 (ref), v190 (ref), v188 (ref), v185 (ref)
    local v244 = v195.settings.animations and v202(math.min(1, v191 * 2 - 0.4)) or 1;
    if v244 > 0 then
        render.text(v186, vector(v240 + 20, v241 - 20), v178.text_primary:alpha_modulate(v178.text_primary.a * v244), nil, "HIT DISTRIBUTION");
        local l_hits_0 = v177.global.hits;
        if l_hits_0 > 0 then
            local v246 = vector(v240 + v242 / 2, v241 + v243 / 2 + 10);
            local v247 = math.min(v242, v243) / 2 - 30;
            local v248 = {};
            for v249, v250 in pairs(v177.global.hitgroup_counts) do
                table.insert(v248, {
                    name = v249, 
                    count = v250, 
                    pct = v250 / l_hits_0, 
                    color = v178.chart_colors[#v248 % #v178.chart_colors + 1]
                });
            end;
            table.sort(v248, function(v251, v252)
                return v251.pct > v252.pct;
            end);
            local v253 = 0;
            for v254, v255 in ipairs(v248) do
                local v256 = v202(math.min(1, v191 * 2 - v254 * 0.1));
                local v257 = v253 + 360 * v255.pct * v256;
                render.circle(v246, v255.color:alpha_modulate(220 * v244), v247, v253, (v257 - v253) / 360);
                render.circle_outline(v246, v178.card_bg:alpha_modulate(255 * v244), v247, v253, (v257 - v253) / 360, 2);
                if v254 <= 5 then
                    local v258 = v241 + 60 + (v254 - 1) * 30;
                    render.rect(vector(v240 + v242 - 100, v258), vector(v240 + v242 - 80, v258 + 12), v255.color:alpha_modulate(220 * v244), 2);
                    render.text(v190, vector(v240 + v242 - 70, v258 - 2), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v244), "l", string.format("%s: %.0f%%", v255.name:sub(1, 12), v255.pct * 100));
                end;
                v253 = v257;
            end;
            render.circle(v246, v178.card_bg_secondary:alpha_modulate(220 * v244), v247 * 0.6, 0, 1);
            render.text(v188, v246 + vector(0, -15), v178.text_primary:alpha_modulate(v178.text_primary.a * v244), "c", string.format("%.0f%%", v177.global.hits / v177.global.shots_fired * 100));
            render.text(v190, v246 + vector(0, 15), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v244), "c", "HIT RATE");
        else
            render.text(v185, vector(v240 + v242 / 2, v241 + v243 / 2), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v244), "c", "No hit data");
        end;
    end;
end;
local function v281(v260, v261, v262, v263)
    -- upvalues: v195 (ref), v202 (ref), v191 (ref), v186 (ref), v178 (ref), v177 (ref), v193 (ref), v190 (ref), v185 (ref)
    local v264 = v195.settings.animations and v202(math.min(1, v191 * 2 - 0.6)) or 1;
    if v264 > 0 then
        render.text(v186, vector(v260 + 20, v261 - 20), v178.text_primary:alpha_modulate(v178.text_primary.a * v264), nil, "MISS REASONS");
        local l_miss_reasons_0 = v177.global.miss_reasons;
        local l_misses_0 = v177.global.misses;
        if l_misses_0 > 0 and next(l_miss_reasons_0) ~= nil then
            local v267 = {};
            for v268, v269 in pairs(l_miss_reasons_0) do
                table.insert(v267, {
                    name = v268, 
                    count = v269
                });
            end;
            table.sort(v267, function(v270, v271)
                return v270.count > v271.count;
            end);
            local l_count_0 = v267[1].count;
            local v273 = v262 - 40;
            local v274 = v261 + 20;
            for v275 = 1, math.min(5, #v267) do
                local v276 = v267[v275];
                local v277 = v202(math.min(1, v191 * 3 - 0.6 - v275 * 0.1));
                local _ = globals.realtime - v193;
                local v279 = v260 + 20;
                if v277 > 0 then
                    render.text(v190, vector(v279, v274 + (v275 - 1) * 30), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v264 * v277), nil, v276.name:gsub("_", " "):upper());
                    render.text(v190, vector(v260 + v262 - 20, v274 + (v275 - 1) * 30), v178.text_primary:alpha_modulate(v178.text_primary.a * v264 * v277), "r", string.format("%.0f%%", v276.count / l_misses_0 * 100));
                    local v280 = v276.count / l_count_0 * v273 * v277;
                    render.rect(vector(v279, v274 + (v275 - 1) * 30 + 15), vector(v279 + v273, v274 + (v275 - 1) * 30 + 15 + 6), v178.card_bg_secondary:alpha_modulate(120 * v264 * v277), 3);
                    render.rect(vector(v279, v274 + (v275 - 1) * 30 + 15), vector(v279 + v280, v274 + (v275 - 1) * 30 + 15 + 6), v178.accent_red:alpha_modulate(220 * v264 * v277), 3);
                end;
            end;
        else
            render.text(v185, vector(v260 + v262 / 2, v261 + v263 / 2), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v264), "c", "No miss data");
        end;
    end;
end;
local function v302(v282, v283, v284, v285)
    -- upvalues: v195 (ref), v202 (ref), v191 (ref), v177 (ref), v178 (ref), v194 (ref), v192 (ref), v185 (ref), v204 (ref), v187 (ref), v190 (ref)
    if not v195.settings.animations or not v202(math.min(1, v191 * 2)) then
        local _ = 1;
    end;
    local v287 = {
        [1] = {
            icon = "\240\159\148\171", 
            label = "SHOTS", 
            value = v177.global.shots_fired, 
            color = v178.text_primary
        }, 
        [2] = {
            icon = "\240\159\142\175", 
            label = "HITS", 
            value = v177.global.hits, 
            color = v178.accent_green
        }, 
        [3] = {
            icon = "\226\157\140", 
            label = "MISSES", 
            value = v177.global.misses, 
            color = v178.accent_red
        }, 
        [4] = {
            icon = "\240\159\147\138", 
            format = "%.1f%%", 
            label = "ACCURACY", 
            value = v177.global.shots_fired > 0 and v177.global.hits / v177.global.shots_fired * 100 or 0, 
            color = v178.accent_blue
        }, 
        [5] = {
            icon = "\240\159\146\165", 
            label = "DAMAGE", 
            value = v177.global.total_damage, 
            color = v178.accent_orange
        }
    };
    local v288 = v284 / 3;
    local v289 = v285 / 2;
    for v290, v291 in ipairs(v287) do
        local v292 = (v290 - 1) % 3;
        local v293 = math.floor((v290 - 1) / 3);
        local v294 = vector(v282 + v292 * v288, v283 + v293 * v289);
        local v295 = globals.realtime - (v194[v291.label:lower()] or 0);
        local v296 = v195.settings.animations and math.min(1, v295 / 0.5) or 1;
        if v195.settings.animations and (v295 >= 1 or not (1 + 0.1 * math.sin(8 * v295))) then
            local _ = 1;
        end;
        local v298 = v195.settings.animations and v202(math.min(1, v191 * 3 - v290 * 0.1)) or 1;
        if v298 > 0 then
            local v299 = vector(v288 - 10, v289 - 10) * v298;
            local v300 = v294 + vector(5, 5) + vector(v288 - 10, v289 - 10) * (1 - v298) / 2;
            render.rect(v300, v300 + v299, v178.card_bg_secondary, v192 * v298);
            render.blur(v300, v300 + v299, 3, 0.1 * v298);
            render.text(v185, v300 + vector(15, 12), v291.color:alpha_modulate(220 * v296), nil, v291.icon);
            local v301 = v291.format and string.format(v291.format, v291.value) or v204(v291.value);
            render.text(v187, v300 + vector(15, 35), v291.color:alpha_modulate(255 * v296), nil, v301);
            render.text(v190, v300 + vector(15, 55), v178.text_secondary:alpha_modulate(220 * v296), nil, v291.label);
        end;
    end;
end;
local function v323(v303, v304, v305, v306)
    -- upvalues: v195 (ref), v202 (ref), v191 (ref), v178 (ref), v190 (ref), v177 (ref), v185 (ref)
    local v307 = v195.settings.animations and v202(math.min(1, v191 * 2 - 0.2)) or 1;
    if v307 > 0 then
        local v308 = v303 + 30;
        local v309 = v304 + 20;
        local v310 = v305 - 60;
        local v311 = v306 - 30;
        for v312 = 0, 4 do
            local v313 = v309 + v311 - v312 * v311 / 4;
            render.line(vector(v308, v313), vector(v308 + v310, v313), v178.separator:alpha_modulate(80 * v307), 1);
            render.text(v190, vector(v308 - 5, v313 - 8), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v307), "c", string.format("%d%%", v312 * 25));
        end;
        local l_accuracy_history_0 = v177.global.accuracy_history;
        if #l_accuracy_history_0 >= 2 then
            local v315 = v310 / (#l_accuracy_history_0 - 1);
            local v316 = nil;
            for v317, v318 in ipairs(l_accuracy_history_0) do
                local v319 = v308 + (v317 - 1) * v315;
                local v320 = v309 + v311 - v318 / 100 * v311;
                local v321 = vector(v319, v320);
                if v316 then
                    local v322 = {
                        v316, 
                        v321, 
                        vector(v321.x, v309 + v311), 
                        vector(v316.x, v309 + v311)
                    };
                    render.poly(v178.accent_blue:alpha_modulate(30 * v307), unpack(v322));
                    render.line(v316, v321, v178.accent_blue:alpha_modulate(200 * v307), 3);
                    render.line(v316, v321, v178.glow:alpha_modulate(100 * v307), 6);
                end;
                render.circle(v321, v178.card_bg:alpha_modulate(255 * v307), 4, 0, 1);
                render.circle_outline(v321, v178.accent_blue:alpha_modulate(220 * v307), 4, 0, 1, 1);
                v316 = v321;
            end;
        else
            render.text(v185, vector(v303 + v305 / 2, v304 + v306 / 2), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v307), "c", "Insufficient data");
        end;
    end;
end;
local function v360()
    -- upvalues: v195 (ref), v234 (ref), v302 (ref), v323 (ref), v259 (ref), v281 (ref), v182 (ref), v202 (ref), v191 (ref), v178 (ref), v192 (ref), v186 (ref), v190 (ref), v177 (ref), v200 (ref), v185 (ref)
    v195.cards = {
        v234("Performance Overview", vector(420, 260), v302, true), 
        v234("Accuracy Timeline", vector(420, 260), v323, true), 
        v234("Hit Distribution", vector(420, 260), v259, true), 
        v234("Miss Reasons", vector(420, 260), v281, true), 
        v234("Player Stats", vector(855, 260), function(v324, v325, v326, v327)
            -- upvalues: v182 (ref), v202 (ref), v191 (ref), v178 (ref), v192 (ref), v186 (ref), v190 (ref), v177 (ref), v200 (ref), v185 (ref)
            local v328 = v182:get() and v202(math.min(1, v191 * 2 - 0.8)) or 1;
            if v328 > 0 then
                render.rect(vector(v324, v325), vector(v324 + v326, v325 + v327), v178.card_bg:alpha_modulate(v178.card_bg.a * v328), v192);
                render.blur(vector(v324, v325), vector(v324 + v326, v325 + v327), 5, 0.2 * v328);
                render.text(v186, vector(v324 + 20, v325 - 20), v178.text_primary:alpha_modulate(v178.text_primary.a * v328), nil, "PLAYER STATS");
                local v329 = {
                    [1] = {
                        width = 150, 
                        name = "PLAYER"
                    }, 
                    [2] = {
                        width = 80, 
                        name = "HITS"
                    }, 
                    [3] = {
                        width = 80, 
                        name = "MISSES"
                    }, 
                    [4] = {
                        width = 220, 
                        name = "ACCURACY"
                    }, 
                    [5] = {
                        width = 90, 
                        name = "LAST HIT"
                    }
                };
                local v330 = v324 + 20;
                for _, v332 in ipairs(v329) do
                    render.text(v190, vector(v330, v325 + 30), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v328), nil, v332.name);
                    v330 = v330 + v332.width;
                end;
                if next(v177.players) ~= nil then
                    local v333 = {};
                    for v334, v335 in pairs(v177.players) do
                        table.insert(v333, {
                            index = v334, 
                            data = v335, 
                            accuracy = v335.shots_fired > 0 and v335.hits / v335.shots_fired * 100 or 0
                        });
                    end;
                    table.sort(v333, function(v336, v337)
                        return v336.data.total_damage > v337.data.total_damage;
                    end);
                    for v338 = 1, math.min(3, #v333) do
                        local v339 = v333[v338];
                        local v340 = entity.get(v339.index);
                        local v341 = v340 and v340:get_name() or "Player " .. v339.index;
                        local v342 = globals.realtime - v339.data.last_update;
                        local v343 = 0.5;
                        local v344 = 1;
                        local v345 = v182:get() and math.min(1, v342 / v343) or 1;
                        local v346;
                        if v182:get() then
                            v346 = v342 < v344 and 255 * (1 - v342 / v344) or 0;
                        else
                            v346 = 0;
                        end;
                        local v347 = v324 + v326;
                        local v348 = v324 + 20;
                        local v349 = v200(v347, v348, v345);
                        local v350 = v182:get() and v202(math.min(1, v191 * 3 - 0.8 - v338 * 0.15)) or 1;
                        if v350 > 0 then
                            if v338 % 2 == 1 then
                                render.rect(vector(v324 + 10, v325 + 50 + (v338 - 1) * 40), vector(v324 + v326 - 10, v325 + 50 + (v338 - 1) * 40 + 35), v178.highlight:alpha_modulate(v178.highlight.a * v328 * v350), 8);
                            end;
                            render.rect(vector(v324 + 10, v325 + 50 + (v338 - 1) * 40), vector(v324 + v326 - 10, v325 + 50 + (v338 - 1) * 40 + 35), v178.accent_blue:alpha_modulate(v346), 8);
                            local v351 = #v341 > 15 and v341:sub(1, 12) .. "..." or v341;
                            render.text(v190, vector(v349, v325 + 50 + (v338 - 1) * 40 + 10), v178.text_primary:alpha_modulate(v178.text_primary.a * v328 * v350), nil, v351);
                            render.text(v190, vector(v324 + 170, v325 + 50 + (v338 - 1) * 40 + 10), v178.accent_green:alpha_modulate(v178.accent_green.a * v328 * v350), nil, tostring(v339.data.hits));
                            render.text(v190, vector(v324 + 250, v325 + 50 + (v338 - 1) * 40 + 10), v178.accent_red:alpha_modulate(v178.accent_red.a * v328 * v350), nil, tostring(v339.data.misses));
                            local v352 = v324 + 330;
                            local v353 = 100;
                            render.rect(vector(v352, v325 + 50 + (v338 - 1) * 40 + 15), vector(v352 + v353, v325 + 50 + (v338 - 1) * 40 + 15 + 6), v178.card_bg_secondary:alpha_modulate(120 * v328 * v350), 3);
                            render.rect(vector(v352, v325 + 50 + (v338 - 1) * 40 + 15), vector(v352 + v339.accuracy / 100 * v353 * v350, v325 + 50 + (v338 - 1) * 40 + 15 + 6), v178.accent_blue:alpha_modulate(220 * v328 * v350), 3);
                            render.text(v190, vector(v352 + v353 + 10, v325 + 50 + (v338 - 1) * 40 + 10), v178.text_primary:alpha_modulate(v178.text_primary.a * v328 * v350), nil, string.format("%.1f%%", v339.accuracy));
                            render.text(v190, vector(v324 + 530, v325 + 50 + (v338 - 1) * 40 + 10), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v328 * v350), nil, "0:12s ago");
                        end;
                    end;
                else
                    render.text(v185, vector(v324 + v326 / 2, v325 + v327 / 2), v178.text_secondary:alpha_modulate(v178.text_secondary.a * v328), "c", "No player data");
                end;
            end;
        end, false)
    };
    local v354 = vector(100, 100);
    local v355 = {
        columns = 2, 
        row_height = 300, 
        spacing = 20
    };
    for v356, v357 in ipairs(v195.cards) do
        local v358 = (v356 - 1) % v355.columns;
        local v359 = math.floor((v356 - 1) / v355.columns);
        v357.position = v354 + vector(v358 * (v357.original_size.x + v355.spacing), v359 * v355.row_height);
        v357.anim_progress = 1;
    end;
end;
local function v372(v361)
    -- upvalues: v174 (ref), v178 (ref), v192 (ref), v239 (ref), v195 (ref), v185 (ref)
    if not v361.visible then
        return;
    else
        local l_position_0 = v361.position;
        local l_current_size_0 = v361.current_size;
        local v364 = v361.anim_progress * 255;
        if v361.resizing then
            local v365 = ui.get_mouse_position() - l_position_0;
            v365.x = math.max(420, math.min(1200, v365.x));
            v365.y = math.max(260, math.min(1200, v365.y));
            v361.current_size = v365;
        end;
        local v366 = vector(l_position_0.x + l_current_size_0.x - 16, l_position_0.y + l_current_size_0.y - 16);
        if v174(v366, vector(16, 16)) and v361.canresize then
            render.rect_outline(l_position_0 - vector(2, 2), l_position_0 + l_current_size_0 + vector(4, 4), v178.card_highlight:alpha_modulate(150), 2, v192);
            if common.is_button_down(1) and not v361.resizing then
                v361.resizing = true;
                v361.resize_start = ui.get_mouse_position();
                v361.resize_start_size = l_current_size_0:clone();
                v239(v361);
            end;
        end;
        if v361.resizing and ffi.C.GetAsyncKeyState(1) == 0 then
            v361.resizing = false;
        end;
        if v361.minimized then
            l_current_size_0 = vector(l_current_size_0.x, v195.minimized_height);
        end;
        render.rect(l_position_0, l_position_0 + l_current_size_0, v178.card_bg:alpha_modulate(v364), v192);
        render.blur(l_position_0, l_position_0 + l_current_size_0, 8, 0.3 * (v364 / 255));
        local v367 = vector(l_position_0.x, l_position_0.y);
        vector(l_position_0.x + l_current_size_0.x, l_position_0.y + 30);
        render.rect(v367.from, v367.to, v178.card_bg_secondary:alpha_modulate(v364), v192, true);
        local v368 = {
            [1] = {
                icon = "\240\159\151\149", 
                action = "minimize", 
                pos = vector(l_current_size_0.x - 70, 5)
            }, 
            [2] = {
                icon = "\226\156\149", 
                action = "close", 
                pos = vector(l_current_size_0.x - 30, 5)
            }
        };
        for _, v370 in ipairs(v368) do
            local v371 = l_position_0 + v370.pos;
            if v174(v371, vector(24, 24)) then
                render.rect(v371, v371 + vector(24, 24), v178.highlight:alpha_modulate(v364), 6);
                if common.is_button_down(1) then
                    if v370.action == "minimize" then
                        v361.minimized = not v361.minimized;
                    elseif v370.action == "close" then
                        v361.visible = false;
                    end;
                end;
            end;
            render.text(v185, v371 + vector(4, 2), v178.text_primary:alpha_modulate(v364), nil, v370.icon);
        end;
        if v174(l_position_0, l_current_size_0 - vector(0, l_current_size_0.y / 4)) then
            if common.is_button_down(1) and not v361.dragging then
                v361.dragging = true;
                v361.drag_offset = ui.get_mouse_position() - l_position_0;
            elseif common.is_button_released(1) then
                v361.dragging = false;
            end;
        end;
        if not v361.minimized then
            v361.render(l_position_0.x, l_position_0.y + 40, l_current_size_0.x, l_current_size_0.y - 40);
        end;
        return;
    end;
end;
local function v375()
    -- upvalues: v195 (ref), v191 (ref), v372 (ref), v229 (ref)
    if v195.settings.animations then
        v191 = math.min(v191 + globals.frametime * 2, 1);
    else
        v191 = 1;
    end;
    for _, v374 in ipairs(v195.cards) do
        if v374.visible then
            v372(v374);
        end;
    end;
    v229();
end;
local function v378()
    -- upvalues: v195 (ref), v206 (ref)
    for _, v377 in ipairs(v195.cards) do
        if v377.dragging then
            v377.position = ui.get_mouse_position() - v377.drag_offset;
            if v195.settings.snap_enabled then
                v377.position = v206(v377.position);
            end;
            if v377.position.x <= v195.snap_distance then
                v377.state = v195.card_states.DOCKED_LEFT;
            elseif v377.position.x + v377.current_size.x >= render.screen_size().x - v195.snap_distance then
                v377.state = v195.card_states.DOCKED_RIGHT;
            else
                v377.state = v195.card_states.NORMAL;
            end;
        end;
    end;
end;
v177.init = function()
    -- upvalues: v177 (ref), v360 (ref)
    v177.global = {
        hits = 0, 
        shots_fired = 0, 
        total_damage = 0, 
        misses = 0, 
        hitgroup_counts = {}, 
        miss_reasons = {}, 
        accuracy_history = {}
    };
    v177.players = {};
    v177.session_start = globals.realtime;
    v360();
end;
events.render:set(function()
    -- upvalues: v180 (ref), v378 (ref), v375 (ref)
    if not v180:get() then
        return;
    else
        v378();
        v375();
        return;
    end;
end);
v176.handle = function(v379)
    -- upvalues: v177 (ref)
    if not v379 or not v379.target then
        return;
    elseif not entity.get(v379.target) then
        return;
    else
        local v380 = v379.target:get_index();
        if not v380 then
            return;
        else
            if v379.state == nil then
                v177.update_player(v380, true, v379.damage, v379.hitgroup, nil);
            else
                v177.update_player(v380, false, 0, nil, v379.state);
            end;
            return;
        end;
    end;
end;
v360();
v177.init();
v14.reset = function()
    -- upvalues: v14 (ref)
    v14.player_data = {};
end;
v14.miss = function(v381)
    -- upvalues: v14 (ref)
    local v382 = v381.target:get_index();
    if not v14.player_data[v382] then
        return;
    elseif v381.state == nil or v381.state == "damage rejection" then
        if not v14.player_data[v382].missed_shots then
            v14.player_data[v382].missed_shots = 0;
        else
            v14.player_data[v382].missed_shots = 0;
        end;
        return;
    else
        if not v14.player_data[v382].missed_shots then
            v14.player_data[v382].missed_shots = 1;
        else
            v14.player_data[v382].missed_shots = v14.player_data[v382].missed_shots + 1;
        end;
        return;
    end;
end;
events.aim_fire:set(v176.shot_tick);
events.aim_ack:set(v176.handle);
events.createmove:set(v14.on_createmove);
events.pre_update_clientside_animation:set(v14.update_animation);
events.round_start:set(v14.reset);
events.round_end:set(v14.reset);
events.client_disconnect:set(v14.reset);
events.aim_ack:set(v14.miss);
events.player_death:set(v14.reset);
v14.init();