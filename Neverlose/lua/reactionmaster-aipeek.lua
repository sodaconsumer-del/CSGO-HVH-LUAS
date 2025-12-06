local v0 = {};
local v1 = {};
local v2 = 1;
local v3 = "\226\128\138";
do
    local l_v3_0 = v3;
    local function v6(v5)
        -- upvalues: l_v3_0 (ref)
        return string.rep(l_v3_0, v5);
    end;
    local function v11(v7, v8, v9, v10)
        -- upvalues: v6 (ref)
        return v6(v9) .. "\a{Link Active}" .. ui.get_icon(v7) .. v6(v10) .. "\aDEFAULT" .. v8;
    end;
    local function v19(v12, v13)
        local v14 = v12:get();
        if #v14 == 0 then
            if v13 == nil then
                local v15 = v12:type();
                local v16 = v12:list();
                if v15 == "selectable" then
                    v13 = v16;
                elseif v15 == "listable" then
                    v13 = {};
                    for v17 = 1, #v16 do
                        v13[v17] = v17;
                    end;
                end;
            end;
            v14 = v13;
            v12:set(v13);
        end;
        v12:set_callback(function()
            -- upvalues: v12 (ref), v14 (ref)
            local v18 = v12:get();
            if #v18 > 0 then
                v14 = v18;
            else
                v12:set(v14);
            end;
        end);
    end;
    local v20 = {
        [1] = "Desert Eagle", 
        [2] = "Pistol", 
        [3] = "Pistol", 
        [4] = "Pistol", 
        [5] = nil, 
        [6] = nil, 
        [7] = "Rifle", 
        [8] = "Rifle", 
        [9] = "AWP", 
        [10] = "Rifle", 
        [11] = "Autoscoutr", 
        [12] = nil, 
        [13] = "Rifle", 
        [14] = "Machine Gun", 
        [15] = nil, 
        [16] = "Rifle", 
        [17] = "SMG", 
        [18] = nil, 
        [19] = "SMG", 
        [20] = nil, 
        [21] = nil, 
        [22] = nil, 
        [23] = "SMG", 
        [24] = "SMG", 
        [25] = "Shotgun", 
        [26] = "SMG", 
        [27] = "Shotgun", 
        [28] = "Machine Gun", 
        [29] = "Shotgun", 
        [30] = "Pistol", 
        [31] = "Zeus x27", 
        [32] = "Pistol", 
        [33] = "SMG", 
        [34] = "SMG", 
        [35] = "Shotgun", 
        [36] = "Pistol", 
        [37] = nil, 
        [38] = "Autoscoutr", 
        [39] = "Rifle", 
        [40] = "SSG 08", 
        [41] = nil, 
        [42] = nil, 
        [43] = "Nades", 
        [44] = "Nades", 
        [45] = "Nades", 
        [46] = "Nades", 
        [47] = "Nades", 
        [48] = "Nades", 
        [49] = nil, 
        [50] = nil, 
        [51] = nil, 
        [52] = nil, 
        [53] = nil, 
        [54] = nil, 
        [55] = nil, 
        [56] = nil, 
        [57] = nil, 
        [58] = nil, 
        [59] = nil, 
        [60] = "Rifle", 
        [61] = "Pistol", 
        [62] = nil, 
        [63] = "Pistol", 
        [64] = "R8 Revolver"
    };
    get_weapon_type_from_index = function(v21)
        -- upvalues: v20 (ref)
        return v20[v21] or "Other";
    end;
    local v22 = ui.create("AI Peek", v2);
    local v23 = {};
    local v24 = {
        enabled = v22:switch(v11("microchip-ai", "Reaction King", 1, 6))
    };
    local v25 = v24.enabled:create();
    v24.hitboxes = v25:listable("Scanning Hitboxes", {
        [1] = "Head", 
        [2] = "Chest", 
        [3] = "Stomach", 
        [4] = "Arms", 
        [5] = "Legs", 
        [6] = "Feet"
    }):tooltip("Hitboxes to scan for damage");
    v24.weapon_filter = v25:selectable("Weapon Filter", {
        [1] = "Autoscoutr", 
        [2] = "R8 Revolver", 
        [3] = "SSG 08", 
        [4] = "AWP", 
        [5] = "Zeus x27", 
        [6] = "Pistol", 
        [7] = "Desert Eagle", 
        [8] = "SMG", 
        [9] = "Shotgun", 
        [10] = "Rifle", 
        [11] = "Machine Gun"
    }):tooltip("Filter which weapons the AI peek should work with");
    v24.simulation_time = v25:slider("Simulation Time", 25, 35, 28, 0.01, "s"):tooltip("Time to simulate the peek");
    v24.rate_limit = v25:slider("Rate Limit", 0, 30, 2, 0.01, "s"):tooltip("Rate limit for peek updates");
    v24.hit_chance = v25:slider("Hit Chance", 0, 100, 0, nil, function(v26)
        return v26 == 0 and "Def." or v26 .. "%";
    end):tooltip("Minimum hit chance to consider a hitbox valid.");
    v24.unsafety = v25:switch("Unsafety"):tooltip("Allows to use 100% multipoint and body aim, but may cause misses.");
    v24.predict_key = v25:switch("Reaction MASTER"):tooltip("AKA PR");
    v24.predict_delay = v25:slider("Predict Delay", 1, 150, 1, nil, "v"):tooltip("Delay to predict peek");
    v24.developer_mode = v25:switch("Developer Mode"):tooltip("Allows to change peek range and retreat distance, useful for testing.");
    v24.range = v25:slider("Range", 15, 25, 20, nil, "t"):tooltip("Range to scan for enemies");
    v24.retreat = v25:slider("Retreat", 15, 30, 25, nil, "u"):tooltip("Distance to retreat after peek");
    v24.jump_scout = v25:switch("Jump Scout"):tooltip("Enable automatic jump sniping");
    v24.force_jump_scout = v25:switch("Jump Scout LLC"):tooltip("Force jump scout mode - always use normal peek logic without retreat");
    v24.block_movement_type = v25:slider("Quick Stop type", 1, 2, 1, nil, function(v27)
        return v27 == 1 and "Type 1" or "Type 2";
    end):tooltip("1 for slow movement, 2 for stop movement");
    v24.jump_scan_range = v25:slider("Jump Scan Range", 10, 50, 25, nil, "u"):tooltip("Range to scan for jump scout opportunities");
    v24.jump_height_check = v25:slider("Min Jump Height", 20, 128, 30, nil, "u"):tooltip("Minimum height required for jump scout");
    v24.jump_timing = v25:slider("Jump Timing", 1, 9, 3, 0.1, "s"):tooltip("Timing window for jump scout execution");
    v24.jump_prefire = v25:switch("Jump Prefire"):tooltip("Fire before landing for better timing");
    v24.developer_mode:set_callback(function(v28)
        -- upvalues: v24 (ref)
        local v29 = v28:get();
        v24.range:visibility(v29);
        v24.retreat:visibility(v29);
    end, true);
    v24.jump_scout:set_callback(function(v30)
        -- upvalues: v24 (ref)
        local v31 = v30:get();
        v24.force_jump_scout:visibility(v31);
        v24.jump_scan_range:visibility(v31);
        v24.jump_height_check:visibility(v31);
        v24.jump_timing:visibility(v31);
        v24.jump_prefire:visibility(v31);
        v24.block_movement_type:visibility(v31);
    end, true);
    v24.predict_key:set_callback(function(v32)
        -- upvalues: v24 (ref)
        local v33 = v32:get();
        v24.predict_delay:visibility(v33);
    end, true);
    v19(v24.hitboxes);
    v19(v24.weapon_filter);
    v23.reaction = v24;
    v1.main = v23;
    v0.menu = v1;
end;
v1 = bit.lshift(1, 0);
v2 = 1;
v3 = 2;
local v34 = 3;
local v35 = 4;
local v36 = 5;
local v37 = 6;
local v38 = 7;
local v39 = 0;
local v40 = 3;
local v41 = 5;
local v42 = 7;
local v43 = 8;
local v44 = 9;
local v45 = 10;
local v46 = 15;
local v47 = 17;
local v48 = 0;
local v49 = {
    [v39] = v2, 
    [v41] = v3, 
    [v40] = v34, 
    [v43] = v37, 
    [v42] = v38, 
    [v44] = v37, 
    [v45] = v38, 
    [v47] = v35, 
    [v46] = v36
};
local v50 = nil;
local v51 = 0;
local v52 = nil;
local v53 = nil;
local v54 = 0;
local v55 = false;
local v56 = false;
local v57 = 0;
local v58 = false;
local v59 = false;
local v60 = 0;
local v61 = {
    rage = {
        main = {
            dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
            hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            peek_assist = {
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
                {
                    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style")
                }, 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
                ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
            }
        }, 
        accuracy = {
            weapon = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options")
        }, 
        selection = {
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
            minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
        }
    }, 
    main = {
        air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }
};
local v62 = {};
local function v64(v63)
    return {
        selection = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v63, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v63, "Multipoint", "Body Scale"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", v63, "Min. Damage"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v63, "Hit Chance")
        }, 
        safety = {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v63, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v63, "Safe Points"), 
            ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", v63, "Ensure Hitbox Safety")
        }
    };
end;
v62["SSG-08"] = v64("SSG-08");
v62.Deagle = v64("Desert Eagle");
v62.Pistols = v64("Pistols");
local function v67()
    local v65 = entity.get_local_player();
    if v65 == nil then
        return 0;
    else
        local l_m_vecVelocity_0 = v65.m_vecVelocity;
        return math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2);
    end;
end;
do
    local l_v1_0, l_v2_0, l_v34_0, l_v37_0, l_v38_0, l_v39_0, l_v40_0, l_v41_0, l_v42_0, l_v43_0, l_v44_0, l_v45_0, l_v46_0, l_v47_0, l_v48_0, l_v49_0, l_v50_0, l_v51_0, l_v52_0, l_v53_0, l_v54_0, l_v55_0, l_v56_0, l_v57_0, l_v58_0, l_v59_0, l_v60_0, l_v61_0, l_v62_0, l_v67_0 = v1, v2, v34, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v67;
    local function v98()
        -- upvalues: v0 (ref), l_v67_0 (ref), l_v61_0 (ref)
        if (v0.menu.main.reaction.predict_key:get() or v0.menu.main.reaction.force_jump_scout:get()) and l_v67_0() > v0.menu.main.reaction.predict_delay:get() then
            l_v61_0.rage.main.double_tap:override(false);
            return true;
        else
            return false;
        end;
    end;
    local function v99()
        -- upvalues: v0 (ref), l_v61_0 (ref)
        if v0.menu.main.reaction.predict_key:get() then
            l_v61_0.rage.main.double_tap:override();
        end;
    end;
    local function v100()
        -- upvalues: l_v50_0 (ref), l_v51_0 (ref), l_v52_0 (ref), l_v53_0 (ref), l_v54_0 (ref), l_v55_0 (ref), l_v56_0 (ref), l_v57_0 (ref), l_v58_0 (ref), l_v59_0 (ref)
        l_v50_0 = nil;
        l_v51_0 = 0;
        l_v52_0 = nil;
        l_v53_0 = nil;
        l_v54_0 = 0;
        l_v55_0 = false;
        l_v56_0 = false;
        l_v57_0 = 0;
        l_v58_0 = false;
        l_v59_0 = false;
    end;
    local function v103()
        -- upvalues: l_v61_0 (ref), l_v62_0 (ref)
        l_v61_0.rage.main.double_tap:override();
        l_v61_0.rage.main.peek_assist[4]:override();
        for _, v102 in pairs(l_v62_0) do
            v102.selection.head_scale:override();
            v102.selection.body_scale:override();
            v102.selection.hit_chance:override();
            v102.safety.body_aim:override();
            v102.safety.safe_points:override();
            v102.safety.ensure_hitbox_safety:override();
        end;
    end;
    local function v108()
        -- upvalues: v0 (ref), l_v61_0 (ref), l_v62_0 (ref)
        local v104 = v0.menu.main.reaction.hit_chance:get();
        local v105 = v0.menu.main.reaction.unsafety:get();
        l_v61_0.rage.main.peek_assist[4]:override("On Shot");
        for _, v107 in pairs(l_v62_0) do
            if v104 ~= 0 then
                v107.selection.hit_chance:override(v104);
            end;
            if v105 then
                v107.selection.head_scale:override(100);
                v107.selection.body_scale:override(100);
                v107.safety.body_aim:override("Default");
                v107.safety.safe_points:override("Default");
                v107.safety.ensure_hitbox_safety:override({});
            end;
        end;
    end;
    local function v110(v109)
        -- upvalues: l_v2_0 (ref), l_v34_0 (ref), l_v37_0 (ref), l_v38_0 (ref)
        if v109 == l_v2_0 then
            return 4;
        elseif v109 == l_v34_0 then
            return 1.25;
        elseif v109 == l_v37_0 or v109 == l_v38_0 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v115(v111, v112, v113, v114)
        -- upvalues: v110 (ref), l_v2_0 (ref)
        v112 = v112 * v110(v113);
        if v111.m_ArmorValue > 0 then
            if v113 == l_v2_0 then
                if v111.m_bHasHelmet then
                    v112 = v112 * (v114 * 0.5);
                end;
            else
                v112 = v112 * (v114 * 0.5);
            end;
        end;
        return v112;
    end;
    local function v127(v116, v117, v118, v119, v120)
        -- upvalues: v115 (ref)
        local v121 = v117 - v116;
        local l_damage_0 = v120.damage;
        local l_armor_ratio_0 = v120.armor_ratio;
        local l_range_0 = v120.range;
        local l_range_modifier_0 = v120.range_modifier;
        local v126 = math.min(l_range_0, v121:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v126 * 0.002);
        return v115(v118, l_damage_0, v119, l_armor_ratio_0);
    end;
    local function v128()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.simulation_time:get() * 0.01;
    end;
    local function v129()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.rate_limit:get() * 0.01;
    end;
    local function v130()
        -- upvalues: l_v61_0 (ref)
        return l_v61_0.rage.selection.minimum_damage:get();
    end;
    local function v131()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.developer_mode:get() and v0.menu.main.reaction.range:get() or 20;
    end;
    local function v132()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.developer_mode:get() and v0.menu.main.reaction.retreat:get() or 25;
    end;
    local function v133()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.jump_scout:get();
    end;
    local function v134()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.force_jump_scout:get();
    end;
    local function v135()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.jump_scan_range:get();
    end;
    local function v136()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.jump_height_check:get();
    end;
    local function v137()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.jump_timing:get() * 0.1;
    end;
    local function v138()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.jump_prefire:get();
    end;
    local function v139()
        -- upvalues: v0 (ref)
        return v0.menu.main.reaction.block_movement_type:get();
    end;
    local function v141()
        -- upvalues: v0 (ref), l_v39_0 (ref), l_v41_0 (ref), l_v40_0 (ref), l_v47_0 (ref), l_v46_0 (ref), l_v43_0 (ref), l_v42_0 (ref), l_v44_0 (ref), l_v45_0 (ref)
        local v140 = {};
        if v0.menu.main.reaction.hitboxes:get("Head") then
            table.insert(v140, l_v39_0);
        end;
        if v0.menu.main.reaction.hitboxes:get("Chest") then
            table.insert(v140, l_v41_0);
        end;
        if v0.menu.main.reaction.hitboxes:get("Stomach") then
            table.insert(v140, l_v40_0);
        end;
        if v0.menu.main.reaction.hitboxes:get("Arms") then
            table.insert(v140, l_v47_0);
            table.insert(v140, l_v46_0);
        end;
        if v0.menu.main.reaction.hitboxes:get("Legs") then
            table.insert(v140, l_v43_0);
            table.insert(v140, l_v42_0);
        end;
        if v0.menu.main.reaction.hitboxes:get("Feet") then
            table.insert(v140, l_v44_0);
            table.insert(v140, l_v45_0);
        end;
        return v140;
    end;
    local function v143(v142)
        -- upvalues: l_v49_0 (ref), l_v48_0 (ref)
        return l_v49_0[v142] or l_v48_0;
    end;
    local function v145(v144)
        return v144[0];
    end;
    local function _(v146, v147)
        local v148 = v146:get_weapon_index();
        local l_weapon_type_0 = v147.weapon_type;
        if v148 == 1 then
            return "Deagle";
        elseif v148 == 64 then
            return "Revolver";
        elseif v148 == 40 then
            return "SSG-08";
        elseif l_weapon_type_0 == 1 then
            return "Pistols";
        else
            return nil;
        end;
    end;
    local function v167(v151, v152, v153, v154, v155)
        -- upvalues: v143 (ref), v127 (ref)
        local v156 = {};
        local v157 = v152:get_eye_position();
        local v158 = v153:get_weapon_info();
        local l_m_iHealth_0 = v154.m_iHealth;
        for v160 = 1, #v151 do
            local v161 = v151[v160];
            local v162 = v143(v161);
            local v163 = v154:get_hitbox_position(v161);
            local v164 = v127(v157, v163, v154, v162, v158);
            local v165 = v164 < v155;
            local v166 = v164 < l_m_iHealth_0;
            if not v165 or not v166 then
                table.insert(v156, {
                    index = v160, 
                    pos = v163
                });
            end;
        end;
        return v156;
    end;
    local function v171(v168)
        -- upvalues: v145 (ref)
        if v168 == nil then
            return false;
        else
            local l_status_0, l_result_0 = pcall(v145, v168);
            return l_status_0 and l_result_0 ~= nil;
        end;
    end;
    local function v173(v172)
        -- upvalues: v171 (ref)
        return v171(v172.target);
    end;
    local function v175(v174)
        -- upvalues: v0 (ref)
        if v0.menu.main.reaction.predict_key:get() or v0.menu.main.reaction.force_jump_scout:get() then
            return true;
        else
            return not v174.in_forward and not v174.in_back and not v174.in_moveleft and not v174.in_moveright;
        end;
    end;
    local function v180(v176, v177, v178)
        -- upvalues: l_v61_0 (ref)
        if v176 == nil or v177 == nil then
            return false;
        elseif v178.max_clip1 == 0 or v177.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v176.m_flNextAttack then
            return false;
        elseif globals.curtime < v177.m_flNextPrimaryAttack then
            return false;
        elseif l_v61_0.rage.main.double_tap:get() and not rage.exploit:get() == 1 then
            return false;
        else
            if v177:get_weapon_index() == 64 then
                local l_m_flPostponeFireReadyTime_0 = v177.m_flPostponeFireReadyTime;
                if l_m_flPostponeFireReadyTime_0 and globals.curtime < l_m_flPostponeFireReadyTime_0 then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    local function v181()
        return true;
    end;
    local function v184(v182, v183)
        return {
            teleport = 0, 
            simtime = 0, 
            retreat = -1, 
            ctx = v182, 
            target = v183
        };
    end;
    local function v186(v185)
        return v185:simulate_movement(nil, vector(), 1);
    end;
    local function v193(v187, v188, v189)
        local v191, v192 = utils.trace_bullet(v187, v188, v189, function(v190)
            -- upvalues: v187 (ref)
            return v190 ~= v187 and v190:is_enemy();
        end);
        return v191, v192;
    end;
    local function v204(v194, v195, v196, v197, v198)
        -- upvalues: v193 (ref)
        local l_m_iHealth_1 = v195.m_iHealth;
        for v200 = 1, #v197 do
            local v201 = v197[v200];
            local v202, _ = v193(v194, v196, v201.pos);
            if v198 <= v202 or l_m_iHealth_1 <= v202 then
                return true;
            end;
        end;
        return false;
    end;
    local function v211(v205, v206, v207, v208, v209)
        -- upvalues: v204 (ref)
        local v210 = v205.origin + vector(0, 0, v205.view_offset);
        return v205, v204(v206, v207, v210, v208, v209);
    end;
    local function v221(v212, v213, v214, v215, v216, v217, v218)
        -- upvalues: l_v1_0 (ref), v211 (ref)
        v212.view_angles.y = v216;
        v215:think(1);
        if bit.band(v215.flags, l_v1_0) == 0 then
            return nil, false;
        else
            local _, v220 = v211(v215, v213, v214, v217, v218);
            if v220 then
                v215:think(1);
            end;
            return v215, v220;
        end;
    end;
    local function v230(v222, v223, _)
        -- upvalues: v133 (ref), v135 (ref), v136 (ref), v193 (ref), l_v39_0 (ref)
        if not v133() then
            return false;
        else
            local v225 = v222:get_origin();
            if (v223:get_origin() - v225):length() > v135() * 50 then
                return false;
            else
                local v226 = v136();
                local v227 = v225 + vector(0, 0, v226) + vector(0, 0, v222:get_eye_position().z - v225.z);
                local v228, v229 = v193(v222, v227, v223:get_hitbox_position(l_v39_0));
                return v228 > 0 and not v229.hit_sky;
            end;
        end;
    end;
    local function v237(v231)
        -- upvalues: v0 (ref)
        if v231 == nil then
            return false;
        else
            local v232 = v231:get_weapon_index();
            local v233 = get_weapon_type_from_index(v232);
            local v234 = v0.menu.main.reaction.weapon_filter:get();
            for _, v236 in pairs(v234) do
                if v236 == v233 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    local function v244(v238, v239)
        -- upvalues: v133 (ref), v237 (ref), v134 (ref), v193 (ref), l_v39_0 (ref), v230 (ref)
        if not v133() then
            return false;
        elseif not v237(v239) then
            return false;
        elseif v134() then
            return true;
        elseif v239:get_weapon_index() ~= 40 then
            return false;
        else
            local v240 = entity.get_threat();
            if v240 == nil or v240:is_dormant() then
                return false;
            else
                local v241 = v238:get_eye_position();
                local v242, _ = v193(v238, v241, v240:get_hitbox_position(l_v39_0));
                if v242 > 0 then
                    return false;
                else
                    return v230(v238, v240, v241);
                end;
            end;
        end;
    end;
    local function v252(v245, v246, v247)
        local v248 = v247 - v246:get_origin();
        local v249 = v248:length2dsqr();
        if v249 < 25 then
            local l_m_vecVelocity_1 = v246.m_vecVelocity;
            local v251 = l_m_vecVelocity_1:length();
            v245.move_yaw = l_m_vecVelocity_1:angles().y;
            v245.forwardmove = -v251;
            v245.sidemove = 0;
            return true, v249;
        else
            v245.move_yaw = v248:angles().y;
            v245.forwardmove = 450;
            v245.sidemove = 0;
            return false, v249;
        end;
    end;
    local function v254(v253)
        -- upvalues: v0 (ref)
        if v0.menu.main.reaction.predict_key:get() or v0.menu.main.reaction.force_jump_scout:get() then
            v253.in_duck = false;
            v253.in_speed = false;
            return;
        else
            v253.in_duck = false;
            v253.in_speed = false;
            v253.in_forward = true;
            v253.in_back = false;
            v253.in_moveleft = false;
            v253.in_moveright = false;
            return;
        end;
    end;
    local function v255(v256, v257, v258)
        -- upvalues: v134 (ref), v175 (ref), l_v55_0 (ref), l_v60_0 (ref), l_v54_0 (ref), l_v56_0 (ref), l_v59_0 (ref), l_v53_0 (ref), v137 (ref), v130 (ref), v141 (ref), l_v1_0 (ref), l_v50_0 (ref), v252 (ref), v254 (ref), v98 (ref), l_v61_0 (ref), l_v39_0 (ref), v138 (ref), v173 (ref), v167 (ref), v204 (ref), v108 (ref), l_v58_0 (ref), v139 (ref), l_v57_0 (ref), v244 (ref), v255 (ref)
        local v259 = entity.get_threat();
        if v259 == nil then
            return false;
        else
            local l_curtime_0 = globals.curtime;
            if v134() and v175(v256) then
                if not l_v55_0 then
                    l_v55_0 = true;
                    l_v60_0 = l_curtime_0;
                    l_v54_0 = l_curtime_0 + 1;
                    l_v56_0 = false;
                    l_v59_0 = false;
                    l_v53_0 = {
                        peek_completed = false, 
                        peek_phase = true, 
                        target = v259, 
                        start_pos = v257:get_origin()
                    };
                end;
                local _ = l_curtime_0 - l_v60_0;
                local v262 = l_curtime_0 - l_v54_0;
                local v263 = v137();
                local v264 = v130();
                local v265 = v141();
                local l_m_fFlags_0 = v257.m_fFlags;
                local v267 = bit.band(l_m_fFlags_0, l_v1_0) ~= 0;
                if l_v53_0 and l_v53_0.peek_phase and not l_v53_0.peek_completed and l_v50_0 and l_v50_0.ctx then
                    local l_origin_0 = l_v50_0.ctx.origin;
                    if (l_origin_0 - v257:get_origin()):length() < 10 then
                        l_v53_0.peek_completed = true;
                        l_v54_0 = l_curtime_0;
                    else
                        v252(v256, v257, l_origin_0);
                        v254(v256);
                        if v98() then
                            l_v61_0.rage.accuracy.weapon:override({
                                [1] = "In Air", 
                                [2] = "Move between Shots"
                            });
                            v256.in_jump = true;
                            rage.exploit:allow_charge(false);
                            utils.execute_after(0.6, function()
                                -- upvalues: l_v61_0 (ref)
                                l_v61_0.rage.accuracy.weapon:override();
                                rage.exploit:allow_charge(true);
                                l_v61_0.rage.main.double_tap:override();
                            end);
                        end;
                        return true;
                    end;
                end;
                if l_v53_0 and l_v53_0.peek_completed then
                    if v262 < v263 then
                        local v269 = v259:get_hitbox_position(l_v39_0);
                        local v270 = v257:get_eye_position();
                        v256.view_angles = (v269 - v270):angles();
                        local v271 = false;
                        if v138() then
                            v271 = v262 > 0.1;
                        else
                            v271 = v263 * 0.6 < v262;
                        end;
                        if v271 then
                            if l_v50_0 ~= nil and v173(l_v50_0) then
                                local v272 = v167(v265, v257, v258, l_v50_0.target, v264);
                                local _ = v204(v257, v259, v270, v272, v264);
                            end;
                            if can_hit then
                                l_v56_0 = true;
                                v108();
                            end;
                        end;
                        return true;
                    elseif v267 then
                        l_v55_0 = false;
                        l_v53_0 = nil;
                        l_v56_0 = false;
                        l_v58_0 = false;
                        l_v59_0 = false;
                        l_v61_0.rage.main.double_tap:override();
                        return false;
                    end;
                end;
                return true;
            else
                if not l_v55_0 then
                    l_v55_0 = true;
                    l_v60_0 = l_curtime_0;
                    l_v54_0 = l_curtime_0 + 0.1;
                    l_v56_0 = false;
                    l_v59_0 = false;
                    l_v53_0 = {
                        target = v259, 
                        start_pos = v257:get_origin()
                    };
                end;
                local v274 = l_curtime_0 - l_v60_0;
                local v275 = l_curtime_0 - l_v54_0;
                local v276 = v137();
                local v277 = v130();
                local v278 = v141();
                local l_m_fFlags_1 = v257.m_fFlags;
                local v280 = bit.band(l_m_fFlags_1, l_v1_0) ~= 0;
                if v274 < 0.1 then
                    v256.block_movement = v139();
                    return true;
                elseif v275 < 0.1 then
                    l_v61_0.rage.accuracy.weapon:override({
                        [1] = "In Air", 
                        [2] = "Move between Shots"
                    });
                    utils.execute_after(0.5, function()
                        -- upvalues: l_v61_0 (ref)
                        l_v61_0.rage.accuracy.weapon:override();
                    end);
                    v256.in_jump = true;
                    v256.in_duck = false;
                    if not l_v59_0 then
                        l_v61_0.rage.main.double_tap:override(false);
                        utils.execute_after(0.5, function()
                            -- upvalues: l_v61_0 (ref)
                            l_v61_0.rage.main.double_tap:override();
                        end);
                        l_v59_0 = true;
                    end;
                    return true;
                elseif v275 < v276 then
                    local v281 = v259:get_hitbox_position(l_v39_0);
                    local v282 = v257:get_eye_position();
                    v256.view_angles = (v281 - v282):angles();
                    if not v280 then
                        rage.exploit:allow_charge(false);
                    else
                        rage.exploit:allow_charge(true);
                    end;
                    local v283 = false;
                    if v138() then
                        v283 = v275 > 0.1;
                    else
                        v283 = v276 * 0.6 < v275;
                    end;
                    if v283 then
                        if l_v50_0 ~= nil and v173(l_v50_0) then
                            local v284 = v167(v278, v257, v258, l_v50_0.target, v277);
                            local _ = v204(v257, v259, v282, v284, v277);
                        end;
                        if can_hit then
                            l_v56_0 = true;
                            v108();
                        end;
                    end;
                    return true;
                elseif v280 then
                    if not l_v56_0 then
                        if not l_v58_0 then
                            l_v58_0 = true;
                            l_v57_0 = l_curtime_0;
                            l_v61_0.rage.main.double_tap:override();
                            rage.exploit:allow_charge(true);
                            return true;
                        else
                            if l_curtime_0 - l_v57_0 > 0.2 then
                                l_v58_0 = false;
                                l_v55_0 = false;
                                l_v53_0 = nil;
                                l_v59_0 = false;
                                if v244(v257, v258) then
                                    return v255(v256, v257, v258);
                                end;
                            end;
                            return true;
                        end;
                    else
                        l_v55_0 = false;
                        l_v53_0 = nil;
                        l_v56_0 = false;
                        l_v58_0 = false;
                        l_v59_0 = false;
                        l_v61_0.rage.main.double_tap:override();
                        return false;
                    end;
                else
                    return true;
                end;
            end;
        end;
    end;
    local function v326(v286, v287, v288)
        -- upvalues: v181 (ref), v129 (ref), v130 (ref), v141 (ref), l_v50_0 (ref), v173 (ref), v167 (ref), v211 (ref), l_v51_0 (ref), v175 (ref), l_v1_0 (ref), v0 (ref), v204 (ref), v186 (ref), v131 (ref), v221 (ref), v184 (ref)
        if not v181() then
            return false;
        else
            local l_frametime_0 = globals.frametime;
            local v290 = v129();
            local v291 = v130();
            local v292 = v141();
            if l_v50_0 ~= nil and v173(l_v50_0) then
                local l_ctx_0 = l_v50_0.ctx;
                local l_target_0 = l_v50_0.target;
                local l_m_iHealth_2 = l_target_0.m_iHealth;
                if v291 >= 100 then
                    v291 = v291 + l_m_iHealth_2 - 100;
                end;
                local v296 = v167(v292, v287, v288, l_target_0, v291);
                local _, v298 = v211(l_ctx_0, v287, l_target_0, v296, v291);
                if v298 then
                    l_v50_0.simtime = 0;
                end;
                l_v50_0.simtime = l_v50_0.simtime + l_frametime_0;
                return true;
            else
                if v290 > 0 then
                    if l_v51_0 > 0 then
                        l_v51_0 = l_v51_0 - l_frametime_0;
                        return false;
                    else
                        l_v51_0 = v290;
                    end;
                end;
                if not v175(v286) then
                    return false;
                else
                    local l_m_fFlags_2 = v287.m_fFlags;
                    if bit.band(l_m_fFlags_2, l_v1_0) == 0 then
                        return false;
                    else
                        local l_m_vecVelocity_2 = v287.m_vecVelocity;
                        if ((not not v0.menu.main.reaction.predict_key:get() or v0.menu.main.reaction.force_jump_scout:get()) and 62500 or 6400) < l_m_vecVelocity_2:length2dsqr() then
                            return false;
                        else
                            local v301 = entity.get_threat();
                            if v301 == nil or v301:is_dormant() then
                                return false;
                            else
                                local l_m_iHealth_3 = v301.m_iHealth;
                                if v291 >= 100 then
                                    v291 = v291 + l_m_iHealth_3 - 100;
                                end;
                                local v303 = v167(v292, v287, v288, v301, v291);
                                if v204(v287, v301, v287:get_eye_position(), v303, v291) then
                                    return false;
                                else
                                    local v304 = nil;
                                    local v305 = nil;
                                    local v306 = nil;
                                    local v307 = v287:get_origin();
                                    local v308 = (v301:get_origin() - v307):angles().y + 180;
                                    v304 = v308 - 90;
                                    v305 = v308 + 90;
                                    v306 = v308 + 180;
                                    v307 = v286.view_angles:clone();
                                    local l_forwardmove_0 = v286.forwardmove;
                                    local l_sidemove_0 = v286.sidemove;
                                    local l_in_duck_0 = v286.in_duck;
                                    v308 = v286.in_jump;
                                    local l_in_speed_0 = v286.in_speed;
                                    v286.forwardmove = 450;
                                    v286.sidemove = 0;
                                    v286.in_duck = false;
                                    v286.in_jump = false;
                                    v286.in_speed = false;
                                    local v313 = v186(v287);
                                    local v314 = v186(v287);
                                    local v315 = v186(v287);
                                    local v316 = 0;
                                    local v317 = 0;
                                    local v318 = 0;
                                    for v319 = 1, v131() do
                                        if v316 ~= -1 then
                                            v316 = v319;
                                            local v320, v321 = v221(v286, v287, v301, v313, v304, v303, v291);
                                            if v320 == nil then
                                                v316 = -1;
                                            end;
                                            if v321 then
                                                l_v50_0 = v184(v320, v301);
                                                break;
                                            end;
                                        end;
                                        if v317 ~= -1 then
                                            v317 = v319;
                                            local v322, v323 = v221(v286, v287, v301, v314, v305, v303, v291);
                                            if v322 == nil then
                                                v317 = -1;
                                            end;
                                            if v323 then
                                                l_v50_0 = v184(v322, v301);
                                                break;
                                            end;
                                        end;
                                        if v318 ~= -1 then
                                            v318 = v319;
                                            local v324, v325 = v221(v286, v287, v301, v315, v306, v303, v291);
                                            if v324 == nil then
                                                v318 = -1;
                                            end;
                                            if v325 then
                                                l_v50_0 = v184(v324, v301);
                                                break;
                                            end;
                                        end;
                                    end;
                                    v286.view_angles.y = v307.y;
                                    v286.forwardmove = l_forwardmove_0;
                                    v286.sidemove = l_sidemove_0;
                                    v286.in_duck = l_in_duck_0;
                                    v286.in_jump = v308;
                                    v286.in_speed = l_in_speed_0;
                                    return l_v50_0 ~= nil;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v346(v327, v328, v329, v330)
        -- upvalues: v180 (ref), v134 (ref), v133 (ref), v326 (ref), l_v50_0 (ref), v255 (ref), v128 (ref), v252 (ref), v254 (ref), v108 (ref), v98 (ref), v99 (ref), v100 (ref), v103 (ref), v244 (ref), l_v52_0 (ref), v132 (ref), v0 (ref), l_v39_0 (ref), l_v61_0 (ref)
        local v331 = v180(v328, v329, v330);
        if v134() and v133() then
            local v332 = v326(v327, v328, v329);
            if l_v50_0 ~= nil and v331 and rage.exploit:get() == 1 and v255(v327, v328, v329) then
                return;
            elseif l_v50_0 == nil then
                return;
            else
                if v128() < l_v50_0.simtime then
                    v332 = false;
                end;
                if v330.weapon_type == 5 and not v328.m_bIsScoped then
                    v332 = false;
                end;
                if v332 then
                    local l_ctx_1 = l_v50_0.ctx;
                    local v334 = v252(v327, v328, l_ctx_1.origin);
                    v254(v327);
                    v108();
                    if v98() then
                        utils.execute_after(0.5, v99);
                    end;
                    if v334 then
                        v100();
                        v103();
                    end;
                    return;
                else
                    if v331 then
                        v100();
                        v103();
                    end;
                    return;
                end;
            end;
        elseif v244(v328, v329) and rage.exploit:get() == 1 and v255(v327, v328, v329) then
            return;
        else
            local v335 = v326(v327, v328, v329);
            local _ = v328.m_fFlags;
            if l_v50_0 == nil then
                return;
            else
                if v128() < l_v50_0.simtime then
                    v335 = false;
                end;
                if v330.weapon_type == 5 and not v328.m_bIsScoped then
                    v335 = false;
                end;
                if l_v50_0.retreat <= 0 and v335 then
                    local l_ctx_2 = l_v50_0.ctx;
                    if l_v52_0 == nil then
                        local v338 = v328:get_origin();
                        local v339 = l_ctx_2.origin - v338;
                        v339:normalize();
                        local v340 = l_ctx_2.origin - v339 * v132();
                        l_v52_0 = utils.trace_hull(v338, v340, l_ctx_2.obb_mins, l_ctx_2.obb_maxs, v328, 33636363, 0).end_pos;
                    end;
                    local v341 = v252(v327, v328, l_ctx_2.origin);
                    v254(v327);
                    v108();
                    if v98() then
                        utils.execute_after(0.5, v99);
                    end;
                    l_v50_0.retreat = 0;
                    if v341 then
                        l_v50_0.retreat = 1;
                    end;
                    return;
                elseif not v331 then
                    v100();
                    return;
                elseif l_v50_0.ctx == nil or l_v50_0.retreat == -1 then
                    return;
                else
                    l_v50_0.retreat = l_v50_0.retreat + 1;
                    local l_m_vecVelocity_3 = v328.m_vecVelocity;
                    if v0.menu.main.reaction.predict_key:get() or v0.menu.main.reaction.force_jump_scout:get() then
                        if l_v50_0.target and not l_v50_0.target:is_dormant() then
                            v327.view_angles = (l_v50_0.target:get_hitbox_position(l_v39_0) - v328:get_eye_position()):angles();
                        end;
                        v254(v327);
                        v108();
                        if l_v50_0.retreat > 30 then
                            v100();
                            v103();
                        end;
                        return;
                    else
                        local v343 = v252(v327, v328, l_v52_0);
                        local v344 = v328:get_origin();
                        local v345 = (l_v52_0 - v344):angles() - l_m_vecVelocity_3:angles();
                        v254(v327);
                        v108();
                        if v328.m_vecVelocity:length2dsqr() > 1600 and math.abs(v345.y) < 20 then
                            rage.exploit:force_teleport();
                            l_v61_0.rage.main.double_tap:override(false);
                        end;
                        if v331 and v343 then
                            v100();
                            v103();
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
    local function v351(v347)
        -- upvalues: v0 (ref), v100 (ref), v103 (ref), v237 (ref), v346 (ref)
        if not v0.menu.main.reaction.enabled:get() then
            v100();
            v103();
            return;
        else
            local v348 = entity.get_local_player();
            if v348 == nil then
                return;
            else
                local v349 = v348:get_player_weapon();
                if v349 == nil then
                    return;
                else
                    local v350 = v349:get_weapon_info();
                    if v350 == nil then
                        return;
                    elseif not v237(v349) then
                        v103();
                        return;
                    else
                        v346(v347, v348, v349, v350);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local function v352()
        -- upvalues: l_v50_0 (ref), v100 (ref)
        if l_v50_0 == nil then
            return nil;
        else
            v100();
            return;
        end;
    end;
    local function v359()
        -- upvalues: v0 (ref), v133 (ref), v134 (ref), l_v55_0 (ref), l_v53_0 (ref), l_v58_0 (ref), v244 (ref)
        if not v0.menu.main.reaction.enabled:get() then
            return;
        elseif entity.get_local_player() == nil then
            return;
        else
            local v353 = render.screen_size();
            local v354 = v353.x / 2;
            local v355 = v353.y / 2 + 500;
            if v0.menu.main.reaction.predict_key:get() then
                render.text(1, vector(v354, v355), color(255, 255, 255, 255), "c", "REACTION MASTER LLC");
            end;
            if v133() then
                local v356 = "";
                local v357 = color(255, 255, 255, 255);
                if v134() then
                    if l_v55_0 then
                        if l_v53_0 and l_v53_0.peek_phase and not l_v53_0.peek_completed then
                            v356 = "FORCE JUMP SCOUT - PEEKING";
                            v357 = color(100, 255, 255, 255);
                        elseif l_v53_0 and l_v53_0.peek_completed then
                            v356 = "FORCE JUMP SCOUT - JUMPING";
                            v357 = color(255, 100, 255, 255);
                        else
                            v356 = "FORCE JUMP SCOUT - ACTIVE";
                            v357 = color(255, 0, 255, 255);
                        end;
                    else
                        v356 = "FORCE JUMP SCOUT MODE";
                        v357 = color(255, 0, 255, 255);
                    end;
                elseif l_v55_0 then
                    v356 = "JUMP SCOUTING ACTIVE";
                    v357 = color(255, 100, 100, 255);
                elseif l_v58_0 then
                    v356 = "CHARGING DT FOR RETRY";
                    v357 = color(255, 255, 100, 255);
                else
                    local v358 = entity.get_local_player();
                    if v358 and v244(v358, v358:get_player_weapon()) then
                        v356 = "JUMP SCOUT READY";
                        v357 = color(100, 255, 100, 255);
                    else
                        v356 = "JUMP SCOUT ENABLED";
                        v357 = color(200, 200, 100, 255);
                    end;
                end;
            end;
            return;
        end;
    end;
    v0.menu.main.reaction.enabled:set_callback(function(v360)
        -- upvalues: v100 (ref), v103 (ref), v352 (ref), v351 (ref), v359 (ref)
        local v361 = v360:get();
        if not v361 then
            v100();
            v103();
        end;
        events.aim_fire(v352, v361);
        events.createmove(v351, v361);
        events.render(v359, v361);
    end, true);
end;
return v0;