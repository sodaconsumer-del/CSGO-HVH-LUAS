local v0 = true;
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_smoothy_0 = require("neverlose/smoothy");
local l_websockets_0 = require("neverlose/websockets");
local _ = require("neverlose/inspect");
local v6 = {
    name = "All in One", 
    build = "Release", 
    user = common.get_username(), 
    icon = ui.get_icon("atlassian"), 
    online_user = "0"
};
local v7 = {
    ragebot = {
        double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        peek_assist_retreat = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        double_tap_option = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        hide_shots_option = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
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
            body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            freestanding_yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
            freestanding_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
            extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
            extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
            extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
        }, 
        fakelag = {
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
    world = {
        world_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "3D Marker"), 
        damage_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "Damage Marker"), 
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
    }, 
    misc = {
        fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
        air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }
};
local v8 = {
    insecure = "B6B665FF"
};
local v9 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)");
if v0 then
    local l_print_0 = print;
    do
        local l_l_print_0_0 = l_print_0;
        print = function(...)
            -- upvalues: l_l_print_0_0 (ref)
            print_dev(...);
            l_l_print_0_0(...);
        end;
    end;
end;
v8.get_space = function(v12)
    local v13 = {
        [2] = "\226\128\138", 
        [3] = "\226\128\175"
    };
    if v12 == nil then
        return "";
    else
        for v14 = 0, math.floor(v12 / 3) do
            local v15 = v12 - v14 * 3;
            if v15 % 2 == 0 then
                local v16 = v15 / 2;
                return string.rep(v13[2], v16) .. string.rep(v13[3], v14);
            end;
        end;
        return "";
    end;
end;
v8.icon_title_ex = function(v17, v18, v19, v20, v21)
    -- upvalues: v8 (ref)
    local v22 = ui.get_icon(v18);
    local v23 = "\a" .. v17;
    local v24 = "\a" .. "DEFAULT";
    if v19 == nil then
        v19 = "";
    end;
    return v8.get_space(v20) .. v23 .. v22 .. v8.get_space(v21) .. v24 .. v19;
end;
v8.icon_title = function(v25, v26, v27, v28)
    -- upvalues: v8 (ref)
    return v8.icon_title_ex("{Link Active}", v25, v26, v27, v28);
end;
v8.link = function(v29)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v29);
end;
do
    local l_v9_0 = v9;
    v8.get_clock = function()
        -- upvalues: l_v9_0 (ref)
        return globals.frametime / l_v9_0();
    end;
    v8.clamp = function(v31, v32, v33)
        if v33 < v32 then
            local l_v33_0 = v33;
            v33 = v32;
            v32 = l_v33_0;
        end;
        return math.max(v32, math.min(v31, v33));
    end;
    v8.contains = function(v35, v36)
        if v35 == nil then
            return false;
        else
            for v37 = 1, #v35 do
                if v35[v37] == v36 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    v8.get_original = function(v38)
        return tonumber(cvar[v38]:string());
    end;
    v8.merge = function(...)
        local v39 = "";
        for v40 = 1, select("#", ...) do
            v39 = v39 .. select(v40, ...);
        end;
        return v39;
    end;
    v8.round = function(v41)
        return math.floor(v41 + 0.5);
    end;
    v8.extrapolate = function(v42, v43, v44)
        return v42 + v43 * globals.tickinterval * v44;
    end;
end;
v9 = {
    get_u8_array = function(v45)
        local v46 = {};
        local v47 = 0;
        for v48 in v45:gmatch(".[\128-\191]*") do
            v47 = v47 + 1;
            v46[v47] = v48;
        end;
        return v46, v47;
    end
};
v9.wave = function(v49, v50, v51, v52)
    -- upvalues: v9 (ref)
    if not v52 then
        v52 = globals.realtime;
    end;
    local v53 = {};
    local v54, v55 = v9.get_u8_array(v49);
    local v56 = 1 / (v55 - 1);
    local v57 = v51.r - v50.r;
    local v58 = v51.g - v50.g;
    local v59 = v51.b - v50.b;
    local v60 = v51.a - v50.a;
    local v61 = color();
    for v62 = 1, v55 do
        local v63 = math.abs((v52 - 1) % 2 - 1);
        v61.r = v50.r + v57 * v63;
        v61.g = v50.g + v58 * v63;
        v61.b = v50.b + v59 * v63;
        v61.a = v50.a + v60 * v63;
        local v64 = "\a" .. v61:to_hex() .. v54[v62];
        table.insert(v53, v64);
        v52 = v52 + v56;
    end;
    return table.concat(v53);
end;
v9.lerp = function(v65, v66, v67)
    return v65 + (v66 - v65) * v67;
end;
v9.lerp_position = function(v68, v69, v70)
    return vector((v69.x - v68.x) * v70 + v68.x, (v69.y - v68.y) * v70 + v68.y, (v69.z - v68.z) * v70 + v68.z);
end;
v9.linear = function(v71, v72, v73, v74)
    return v73 * v71 / v74 + v72;
end;
v9.solve = function(v75, v76, v77, v78, v79)
    if v78 <= 0 then
        return v77;
    elseif v79 <= v78 then
        return v77;
    else
        v76 = v75(v78, v76, v77 - v76, v79);
        if type(v76) == "number" then
            if math.abs(v77 - v76) < 0.001 then
                return v77;
            else
                local v80 = v76 % 1;
                if v80 < 0.001 then
                    return math.floor(v76);
                elseif v80 > 0.999 then
                    return math.ceil(v76);
                end;
            end;
        end;
        return v76;
    end;
end;
v9.interp = function(v81, v82, v83, v84)
    -- upvalues: v9 (ref), v8 (ref)
    if not v84 then
        v84 = v9.linear;
    end;
    if type(v82) == "boolean" then
        v82 = v82 and 1 or 0;
    end;
    return v9.solve(v84, v81, v82, v8.get_clock(), v83);
end;
v9.clamp = function(v85, v86, v87)
    return v85 < v86 and v86 or v87 < v85 and v87 or v85;
end;
v9.normalize_yaw = function(v88)
    return (v88 + 180) % -360 + 180;
end;
v9.frametime = function()
    return globals.frametime * 8;
end;
v9.distance_2d = function(v89, v90)
    return math.sqrt((v90.x - v89.x) ^ 2 + (v90.y - v89.y) ^ 2);
end;
local v91 = {};
local l_band_0 = bit.band;
local l_bor_0 = bit.bor;
local l_bxor_0 = bit.bxor;
local l_lshift_0 = bit.lshift;
local l_rshift_0 = bit.rshift;
local l_bnot_0 = bit.bnot;
local v98 = {
    [1] = 1116352408, 
    [2] = 1899447441, 
    [3] = 3049323471, 
    [4] = 3921009573, 
    [5] = 961987163, 
    [6] = 1508970993, 
    [7] = 2453635748, 
    [8] = 2870763221, 
    [9] = 3624381080, 
    [10] = 310598401, 
    [11] = 607225278, 
    [12] = 1426881987, 
    [13] = 1925078388, 
    [14] = 2162078206, 
    [15] = 2614888103, 
    [16] = 3248222580, 
    [17] = 3835390401, 
    [18] = 4022224774, 
    [19] = 264347078, 
    [20] = 604807628, 
    [21] = 770255983, 
    [22] = 1249150122, 
    [23] = 1555081692, 
    [24] = 1996064986, 
    [25] = 2554220882, 
    [26] = 2821834349, 
    [27] = 2952996808, 
    [28] = 3210313671, 
    [29] = 3336571891, 
    [30] = 3584528711, 
    [31] = 113926993, 
    [32] = 338241895, 
    [33] = 666307205, 
    [34] = 773529912, 
    [35] = 1294757372, 
    [36] = 1396182291, 
    [37] = 1695183700, 
    [38] = 1986661051, 
    [39] = 2177026350, 
    [40] = 2456956037, 
    [41] = 2730485921, 
    [42] = 2820302411, 
    [43] = 3259730800, 
    [44] = 3345764771, 
    [45] = 3516065817, 
    [46] = 3600352804, 
    [47] = 4094571909, 
    [48] = 275423344, 
    [49] = 430227734, 
    [50] = 506948616, 
    [51] = 659060556, 
    [52] = 883997877, 
    [53] = 958139571, 
    [54] = 1322822218, 
    [55] = 1537002063, 
    [56] = 1747873779, 
    [57] = 1955562222, 
    [58] = 2024104815, 
    [59] = 2227730452, 
    [60] = 2361852424, 
    [61] = 2428436474, 
    [62] = 2756734187, 
    [63] = 3204031479, 
    [64] = 3329325298
};
local function v101(...)
    local v99 = 0;
    for v100 = 1, select("#", ...) do
        v99 = (v99 + select(v100, ...)) % 4294967296;
    end;
    return v99;
end;
do
    local l_l_band_0_0, l_l_bor_0_0, l_l_bxor_0_0, l_l_lshift_0_0, l_l_rshift_0_0, l_l_bnot_0_0, l_v98_0, l_v101_0 = l_band_0, l_bor_0, l_bxor_0, l_lshift_0, l_rshift_0, l_bnot_0, v98, v101;
    local function v112(v110, v111)
        -- upvalues: l_l_band_0_0 (ref), l_l_rshift_0_0 (ref)
        return string.char(l_l_band_0_0(l_l_rshift_0_0(v110, 24), 255), l_l_band_0_0(l_l_rshift_0_0(v110, 16), 255), l_l_band_0_0(l_l_rshift_0_0(v110, 8), 255), l_l_band_0_0(v110, 255), l_l_band_0_0(l_l_rshift_0_0(v111, 24), 255), l_l_band_0_0(l_l_rshift_0_0(v111, 16), 255), l_l_band_0_0(l_l_rshift_0_0(v111, 8), 255), l_l_band_0_0(v111, 255));
    end;
    local function v117(v113, v114, v115, v116)
        -- upvalues: l_l_lshift_0_0 (ref)
        return l_l_lshift_0_0(v113, 24) + l_l_lshift_0_0(v114, 16) + l_l_lshift_0_0(v115, 8) + v116;
    end;
    local function v120(v118, v119)
        -- upvalues: l_l_bor_0_0 (ref), l_l_rshift_0_0 (ref), l_l_lshift_0_0 (ref), l_l_band_0_0 (ref)
        return l_l_bor_0_0(l_l_rshift_0_0(v118, v119), l_l_lshift_0_0(l_l_band_0_0(v118, l_l_rshift_0_0(4294967295, 32 - v119)), 32 - v119));
    end;
    local function v124(v121, v122, v123)
        -- upvalues: l_l_bxor_0_0 (ref), l_l_band_0_0 (ref), l_l_bnot_0_0 (ref)
        return l_l_bxor_0_0(l_l_band_0_0(v121, v122), l_l_band_0_0(l_l_bnot_0_0(v121), v123));
    end;
    local function v128(v125, v126, v127)
        -- upvalues: l_l_bxor_0_0 (ref), l_l_band_0_0 (ref)
        return l_l_bxor_0_0(l_l_bxor_0_0(l_l_band_0_0(v125, v126), l_l_band_0_0(v125, v127)), l_l_band_0_0(v126, v127));
    end;
    local function v130(v129)
        -- upvalues: l_l_bxor_0_0 (ref), v120 (ref)
        return l_l_bxor_0_0(l_l_bxor_0_0(v120(v129, 2), v120(v129, 13)), v120(v129, 22));
    end;
    local function v132(v131)
        -- upvalues: l_l_bxor_0_0 (ref), v120 (ref)
        return l_l_bxor_0_0(l_l_bxor_0_0(v120(v131, 6), v120(v131, 11)), v120(v131, 25));
    end;
    local function v134(v133)
        -- upvalues: l_l_bxor_0_0 (ref), v120 (ref), l_l_rshift_0_0 (ref)
        return l_l_bxor_0_0(l_l_bxor_0_0(v120(v133, 7), v120(v133, 18)), l_l_rshift_0_0(v133, 3));
    end;
    local function v136(v135)
        -- upvalues: l_l_bxor_0_0 (ref), v120 (ref), l_l_rshift_0_0 (ref)
        return l_l_bxor_0_0(l_l_bxor_0_0(v120(v135, 17), v120(v135, 19)), l_l_rshift_0_0(v135, 10));
    end;
    v91.hash = function(v137)
        -- upvalues: v112 (ref), v117 (ref), l_v101_0 (ref), v136 (ref), v134 (ref), v132 (ref), v124 (ref), l_v98_0 (ref), v130 (ref), v128 (ref)
        local v138 = {
            [1] = 1779033703, 
            [2] = 3144134277, 
            [3] = 1013904242, 
            [4] = 2773480762, 
            [5] = 1359893119, 
            [6] = 2600822924, 
            [7] = 528734635, 
            [8] = 1541459225
        };
        local v139 = #v137;
        local v140 = v139 * 8;
        v137 = string.format("%s%s", v137, string.char(128));
        local v141 = 64 - (v139 + 9) % 64;
        if v141 == 64 then
            v141 = 0;
        end;
        v137 = string.format("%s%s", v137, string.rep(string.char(0), v141));
        local v142 = math.floor(v140 / 4294967296);
        local v143 = v140 % 4294967296;
        v137 = string.format("%s%s", v137, v112(v142, v143));
        for v144 = 1, #v137, 64 do
            local v145 = v137:sub(v144, v144 + 63);
            local v146 = {};
            for v147 = 0, 15 do
                local v148 = v147 * 4 + 1;
                v146[v147] = v117(v145:byte(v148, v148 + 3));
            end;
            for v149 = 16, 63 do
                v146[v149] = l_v101_0(v136(v146[v149 - 2]), v146[v149 - 7], v134(v146[v149 - 15]), v146[v149 - 16]);
            end;
            local v150 = v138[1];
            local v151 = v138[2];
            local v152 = v138[3];
            local v153 = v138[4];
            local v154 = v138[5];
            local v155 = v138[6];
            local v156 = v138[7];
            local v157 = v138[8];
            for v158 = 0, 63 do
                local v159 = l_v101_0(v157, v132(v154), v124(v154, v155, v156), l_v98_0[v158 + 1], v146[v158]);
                local v160 = l_v101_0(v130(v150), v128(v150, v151, v152));
                v157 = v156;
                v156 = v155;
                v155 = v154;
                v154 = l_v101_0(v153, v159);
                v153 = v152;
                v152 = v151;
                v151 = v150;
                v150 = l_v101_0(v159, v160);
            end;
            v138[1] = l_v101_0(v138[1], v150);
            v138[2] = l_v101_0(v138[2], v151);
            v138[3] = l_v101_0(v138[3], v152);
            v138[4] = l_v101_0(v138[4], v153);
            v138[5] = l_v101_0(v138[5], v154);
            v138[6] = l_v101_0(v138[6], v155);
            v138[7] = l_v101_0(v138[7], v156);
            v138[8] = l_v101_0(v138[8], v157);
        end;
        local v161 = "";
        for v162 = 1, 8 do
            v161 = v161 .. string.format("%08x", v138[v162]);
        end;
        return v161;
    end;
end;
l_band_0 = {};
l_bor_0 = {};
l_bxor_0 = nil;
l_lshift_0 = nil;
l_rshift_0 = ui.create("Windows"):visibility(false);
l_bnot_0 = function(v163)
    local l_status_0, l_result_0 = pcall(json.parse, v163);
    if not l_status_0 then
        return nil;
    else
        return l_result_0;
    end;
end;
v98 = {
    mouse_pos = vector(), 
    mouse_pos_prev = vector(), 
    mouse_down = false, 
    mouse_clicked = false, 
    mouse_down_duration = 0, 
    mouse_delta = vector(), 
    mouse_clicked_pos = vector()
};
do
    local l_l_bor_0_1, l_l_bxor_0_1, l_l_lshift_0_1, l_l_rshift_0_1, l_l_bnot_0_1, l_v98_1, l_v101_1 = l_bor_0, l_bxor_0, l_lshift_0, l_rshift_0, l_bnot_0, v98, v101;
    l_v98_1.update_mouse_inputs = function()
        -- upvalues: l_v98_1 (ref)
        local l_frametime_0 = globals.frametime;
        local v174 = ui.get_mouse_position();
        local v175 = common.is_button_down(1);
        l_v98_1.mouse_pos_prev = l_v98_1.mouse_pos;
        l_v98_1.mouse_pos = v174;
        l_v98_1.mouse_delta = l_v98_1.mouse_pos - l_v98_1.mouse_pos_prev;
        l_v98_1.mouse_down = v175;
        l_v98_1.mouse_clicked = v175 and l_v98_1.mouse_down_duration < 0;
        local l_l_v98_1_0 = l_v98_1;
        local v177;
        if v175 then
            if l_v98_1.mouse_down_duration < 0 then
                v177 = 0;
                goto label0 --[[  true, true  ]];
            else
                v177 = l_v98_1.mouse_down_duration + l_frametime_0;
                if v177 then
                    goto label0;
                end;
            end;
        end;
        v177 = -1;
        ::label0::;
        l_l_v98_1_0.mouse_down_duration = v177;
        if l_v98_1.mouse_clicked then
            l_v98_1.mouse_clicked_pos = l_v98_1.mouse_pos;
        end;
    end;
    l_v101_1 = {};
    l_v101_1.__index = l_v101_1;
    l_v101_1.__new = function(v178, v179, v180)
        -- upvalues: l_l_rshift_0_1 (ref)
        if type(v180) ~= "table" then
            v180 = {};
        end;
        return setmetatable({
            is_hovered = false, 
            is_active = true, 
            item = l_l_rshift_0_1:value(v179, ""), 
            is_clamped = v180.clamped == true, 
            pos = vector(), 
            size = vector(), 
            anchor = vector()
        }, v178);
    end;
    l_v101_1.get_pos = function(v181)
        return v181.pos;
    end;
    l_v101_1.set_pos = function(v182, v183)
        local v184 = render.screen_size();
        local v185 = v183:clone();
        if v182.is_clamped then
            v185.x = math.clamp(v185.x, 0, v184.x - v182.size.x);
            v185.y = math.clamp(v185.y, 0, v184.y - v182.size.y);
        end;
        if v182.pos ~= v185 then
            v182.item:set(json.stringify({
                x = v185.x + v182.size.x * v182.anchor.x, 
                y = v185.y + v182.size.y * v182.anchor.y
            }));
        end;
        v182.pos = v185;
        return v182;
    end;
    l_v101_1.get_size = function(v186)
        return v186.size;
    end;
    l_v101_1.set_size = function(v187, v188)
        local v189 = v188 - v187.size;
        local v190 = v187.pos - v189 * v187.anchor;
        v187.size = v188;
        v187:set_pos(v190);
        return v187;
    end;
    l_v101_1.get_anchor = function(v191)
        return v191.anchor;
    end;
    l_v101_1.set_anchor = function(v192, v193)
        v192.anchor = v193;
        return v192;
    end;
    l_v101_1.build = function(v194)
        -- upvalues: l_l_bnot_0_1 (ref), l_l_bor_0_1 (ref)
        local v195 = v194.item:get();
        local v196 = l_l_bnot_0_1(v195);
        if v196 ~= nil and v196.x ~= nil and v196.y ~= nil then
            v194.pos = vector(v196.x, v196.y);
        end;
        table.insert(l_l_bor_0_1, v194);
        return v194;
    end;
    local function v200(v197, v198, v199)
        return v197.x >= v198.x and v197.x <= v199.x and v197.y >= v198.y and v197.y <= v199.y;
    end;
    local function v206()
        -- upvalues: l_l_bor_0_1 (ref), v200 (ref), l_v98_1 (ref), l_l_bxor_0_1 (ref)
        local v201 = nil;
        if ui.get_alpha() > 0 then
            for v202 = 1, #l_l_bor_0_1 do
                local v203 = l_l_bor_0_1[v202];
                local l_pos_0 = v203.pos;
                local l_size_0 = v203.size;
                if v203.is_active and v200(l_v98_1.mouse_pos, l_pos_0, l_pos_0 + l_size_0) then
                    v201 = v203;
                end;
            end;
        end;
        l_l_bxor_0_1 = v201;
    end;
    local function v207()
        -- upvalues: l_v98_1 (ref), l_l_lshift_0_1 (ref), l_l_bxor_0_1 (ref)
        if not l_v98_1.mouse_down then
            l_l_lshift_0_1 = nil;
            return;
        else
            if l_v98_1.mouse_clicked and l_l_bxor_0_1 ~= nil then
                l_l_lshift_0_1 = l_l_bxor_0_1;
            end;
            return;
        end;
    end;
    local function v210()
        -- upvalues: l_l_bor_0_1 (ref)
        for v208 = 1, #l_l_bor_0_1 do
            local v209 = l_l_bor_0_1[v208];
            v209.is_dragged = false;
            v209.is_hovered = false;
        end;
    end;
    local function v211()
        -- upvalues: l_l_bxor_0_1 (ref)
        if l_l_bxor_0_1 == nil then
            return;
        else
            l_l_bxor_0_1.is_hovered = true;
            return;
        end;
    end;
    local function v213()
        -- upvalues: l_l_lshift_0_1 (ref), l_v98_1 (ref)
        if l_l_lshift_0_1 == nil then
            return;
        else
            local v212 = l_l_lshift_0_1.pos + l_v98_1.mouse_delta;
            l_l_lshift_0_1:set_pos(v212);
            l_l_lshift_0_1.is_dragged = true;
            return;
        end;
    end;
    local function v214()
        -- upvalues: l_v98_1 (ref), v206 (ref), v207 (ref), v210 (ref), v211 (ref), v213 (ref)
        l_v98_1.update_mouse_inputs();
        v206();
        v207();
        v210();
        v211();
        v213();
    end;
    local function v216(v215)
        -- upvalues: l_l_lshift_0_1 (ref), l_l_bxor_0_1 (ref)
        if not (l_l_lshift_0_1 ~= nil or l_l_bxor_0_1 ~= nil) then
            return;
        else
            v215.in_attack = false;
            v215.in_attack2 = false;
            return;
        end;
    end;
    l_band_0.new = function(v217, v218)
        -- upvalues: l_v101_1 (ref)
        return l_v101_1:__new(v217, v218);
    end;
    events.render(v214);
    events.createmove(v216);
end;
l_bor_0 = {};
l_bxor_0 = ui.get_style();
l_lshift_0 = "\a" .. l_bxor_0["Link Active"]:to_hex();
l_rshift_0 = "\a" .. l_bxor_0["Small Text"]:to_hex();
l_bnot_0 = "\a" .. color(251, 41, 75):to_hex();
v98 = v8.merge(l_lshift_0, "All in One", "\aDEFAULT");
v101 = v8.merge(l_rshift_0, " \194\183 ", "\aDEFAULT");
do
    local l_l_bnot_0_2, l_v98_2, l_v101_2 = l_bnot_0, v98, v101;
    l_bor_0.success = function(...)
        -- upvalues: v8 (ref), l_v98_2 (ref), l_v101_2 (ref)
        local v222 = v8.merge(...);
        cvar.playvol:call("ui/beepclear.wav", 1);
        print_raw(l_v98_2 .. l_v101_2 .. v222);
    end;
    l_bor_0.error = function(...)
        -- upvalues: v8 (ref), l_l_bnot_0_2 (ref), l_v98_2 (ref), l_v101_2 (ref)
        local v223 = v8.merge(l_l_bnot_0_2, ...);
        cvar.playvol:call("resource/warning.wav", 1);
        print_raw(l_v98_2 .. l_v101_2 .. v223);
    end;
end;
l_bxor_0 = {};
l_lshift_0 = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ");
l_rshift_0 = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ");
l_bnot_0 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", l_lshift_0, l_lshift_0, l_lshift_0, l_lshift_0));
v98 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", l_lshift_0, l_lshift_0));
v101 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", l_lshift_0, l_lshift_0, l_lshift_0, l_lshift_0, l_rshift_0, l_rshift_0);
do
    local l_l_lshift_0_2, l_l_rshift_0_2, l_l_bnot_0_3, l_v98_3, l_v101_3 = l_lshift_0, l_rshift_0, l_bnot_0, v98, v101;
    l_bxor_0.box = function(v229, v230, v231, v232, v233, v234, v235, v236, v237)
        -- upvalues: l_l_lshift_0_2 (ref), l_l_bnot_0_3 (ref)
        v229 = l_l_lshift_0_2(v229:unpack());
        v230 = l_l_lshift_0_2(v230:unpack());
        v231 = l_l_lshift_0_2(v231:unpack());
        v232 = l_l_lshift_0_2(v232:unpack());
        l_l_bnot_0_3(v229, v230, v231, v232, v233, v234, v235, v236, v237);
    end;
    l_bxor_0.line = function(v238, v239, v240, v241, v242)
        -- upvalues: l_l_lshift_0_2 (ref), l_v98_3 (ref)
        v238 = l_l_lshift_0_2(v238:unpack());
        v239 = l_l_lshift_0_2(v239:unpack());
        l_v98_3(v238, v239, v240.r, v240.g, v240.b, v240.a, v241, v242);
    end;
    l_bxor_0.box_new = function(v243, v244, v245, v246, v247, v248, v249)
        -- upvalues: l_l_lshift_0_2 (ref), l_l_rshift_0_2 (ref), l_v101_3 (ref)
        v243 = l_l_lshift_0_2(v243:unpack());
        v244 = l_l_lshift_0_2(v244:unpack());
        v245 = l_l_lshift_0_2(v245:unpack());
        v246 = l_l_lshift_0_2(v246:unpack());
        v247 = l_l_rshift_0_2(v247:unpack());
        v248 = l_l_rshift_0_2(v248:unpack());
        l_v101_3(v243, v244, v245, v246, v247, v248, v249);
    end;
end;
l_lshift_0 = {};
l_rshift_0 = "BqvbCHsU5NwhxAzGKjFgytIT0oXlurekOdS8ZiPVaEnR7219Q6mM3DfLW4YpcJ+/=";
l_bnot_0 = ".\\nl\\allinone";
v98 = l_bnot_0 .. "\\db.dat";
v101 = {};
do
    local l_l_rshift_0_3, l_l_bnot_0_4, l_v98_4, l_v101_4 = l_rshift_0, l_bnot_0, v98, v101;
    local function v254()
        -- upvalues: l_v98_4 (ref)
        return files.read(l_v98_4);
    end;
    local function v257(v255, v256)
        -- upvalues: l_v98_4 (ref)
        if v256 == nil then
            v256 = false;
        end;
        return files.write(l_v98_4, v255, v256);
    end;
    local function v263(v258)
        -- upvalues: l_base64_0 (ref), l_l_rshift_0_3 (ref)
        local l_status_1, l_result_1 = pcall(json.stringify, v258);
        if not l_status_1 then
            return false, l_result_1;
        else
            local l_status_2, l_result_2 = pcall(l_base64_0.encode, l_result_1, l_l_rshift_0_3);
            l_result_1 = l_result_2;
            if not l_status_2 then
                return false, l_result_1;
            else
                return true, l_result_1;
            end;
        end;
    end;
    local function v269(v264)
        -- upvalues: l_base64_0 (ref), l_l_rshift_0_3 (ref)
        local l_status_3, l_result_3 = pcall(l_base64_0.decode, v264, l_l_rshift_0_3);
        if not l_status_3 then
            return false, l_result_3;
        else
            local l_status_4, l_result_4 = pcall(json.parse, l_result_3);
            l_result_3 = l_result_4;
            if not l_status_4 then
                return false, l_result_3;
            else
                return true, l_result_3;
            end;
        end;
    end;
    local function v273(v270)
        -- upvalues: l_l_bnot_0_4 (ref), v263 (ref), l_bor_0 (ref), v257 (ref)
        files.create_folder(l_l_bnot_0_4);
        local v271, v272 = v263(v270);
        if not v271 then
            l_bor_0.error(v272);
            return false;
        elseif not v257(v272) then
            l_bor_0.error("Unable to write db");
            return false;
        else
            return true;
        end;
    end;
    local function v277()
        -- upvalues: l_l_bnot_0_4 (ref), v254 (ref), v273 (ref), l_bor_0 (ref), v269 (ref)
        files.create_folder(l_l_bnot_0_4);
        local v274 = v254();
        if v274 == nil then
            if not v273({}) then
                l_bor_0.error("Unable to create local database");
            end;
            return {};
        else
            local v275, v276 = v269(v274);
            if not v275 then
                l_bor_0.error("Unable to decode local database");
                if not v273({}) then
                    l_bor_0.error("Unable to flush local database");
                end;
                return {};
            else
                return v276;
            end;
        end;
    end;
    local v283 = {
        __index = function(_, v279)
            -- upvalues: l_v101_4 (ref)
            return l_v101_4[v279];
        end, 
        __newindex = function(_, v281, v282)
            -- upvalues: l_v101_4 (ref), v273 (ref)
            l_v101_4[v281] = v282;
            v273(l_v101_4);
        end
    };
    l_v101_4 = v277();
    setmetatable(l_lshift_0, v283);
end;
l_rshift_0 = {};
l_bnot_0 = "allinone_";
v98 = "_";
v101 = {};
do
    local l_l_bnot_0_5, l_v98_5, l_v101_5 = l_bnot_0, v98, v101;
    local function v287(v288)
        -- upvalues: v287 (ref)
        local v289 = {};
        for v290, v291 in pairs(v288) do
            if type(v291) ~= "table" then
                local l_status_5, l_result_5 = pcall(v291.export, v291);
                if l_status_5 and l_result_5 ~= nil then
                    v289[v290] = l_result_5;
                end;
            else
                v289[v290] = v287(v291);
            end;
        end;
        return v289;
    end;
    local function v294(v295, v296)
        -- upvalues: v294 (ref)
        for v297, v298 in pairs(v296) do
            local v299 = v295[v297];
            if type(v299) ~= "table" then
                if v299.import ~= nil then
                    pcall(v299.import, v299, v298);
                end;
            else
                v294(v299, v298);
            end;
        end;
    end;
    local function v305(v300)
        -- upvalues: l_base64_0 (ref), l_l_bnot_0_5 (ref), l_v98_5 (ref)
        local l_status_6, l_result_6 = pcall(json.stringify, v300);
        if not l_status_6 then
            return false, "Failed to convert config";
        else
            local l_status_7, l_result_7 = pcall(l_base64_0.encode, l_result_6);
            if not l_status_7 then
                return false, "Failed to encode config";
            else
                return true, string.format("%s%s%s", l_l_bnot_0_5, l_result_7, l_v98_5);
            end;
        end;
    end;
    local function v312(v306)
        -- upvalues: l_l_bnot_0_5 (ref), l_v98_5 (ref), l_base64_0 (ref)
        local v307 = string.match(v306, string.format("^%s(.-)%s$", l_l_bnot_0_5, l_v98_5));
        if v307 == nil then
            return false, "Invalid config";
        else
            local l_status_8, l_result_8 = pcall(l_base64_0.decode, v307);
            if not l_status_8 then
                return false, "Failed to decode config";
            else
                local l_status_9, l_result_9 = pcall(json.parse, l_result_8);
                if not l_status_9 then
                    return false, "Failed to parse config";
                else
                    return true, l_result_9;
                end;
            end;
        end;
    end;
    local function v317(v313, v314)
        -- upvalues: v312 (ref), v294 (ref)
        if type(v314) ~= "string" then
            return false, "Not supported type";
        elseif v314 == "" then
            return false, "Config is empty";
        else
            local v315, v316 = v312(v314);
            if not v315 then
                return false, v316;
            elseif not pcall(v294, v313, v316) then
                return false, "Data is invalid";
            else
                return true, nil;
            end;
        end;
    end;
    l_rshift_0.set_package = function(v318)
        -- upvalues: l_v101_5 (ref)
        if type(v318) ~= "table" then
            error("Invalid package");
        end;
        l_v101_5 = v318;
    end;
    l_rshift_0.encode = function(v319)
        -- upvalues: v305 (ref)
        return v305(v319);
    end;
    l_rshift_0.decode = function(v320)
        -- upvalues: v312 (ref)
        return v312(v320);
    end;
    l_rshift_0.import = function(v321)
        -- upvalues: l_v101_5 (ref), l_clipboard_0 (ref), v317 (ref)
        if v321 == nil then
            v321 = l_v101_5;
        end;
        local l_status_10, l_result_10 = pcall(l_clipboard_0.get);
        if not l_status_10 then
            return false, l_result_10;
        else
            local v324, v325 = v317(v321, l_result_10);
            l_result_10 = v325;
            if not v324 then
                return false, l_result_10;
            else
                return true, nil;
            end;
        end;
    end;
    l_rshift_0.export_as_string = function(v326)
        -- upvalues: l_v101_5 (ref), v287 (ref), v305 (ref)
        if v326 == nil then
            v326 = l_v101_5;
        end;
        local l_status_11, l_result_11 = pcall(v287, v326);
        if not l_status_11 then
            return false, l_result_11;
        else
            local v329, v330 = v305(l_result_11);
            if not v329 then
                return false, v330;
            else
                return true, v330;
            end;
        end;
    end;
    l_rshift_0.export = function(v331)
        -- upvalues: l_rshift_0 (ref), l_bor_0 (ref), l_clipboard_0 (ref)
        local v332, v333 = l_rshift_0.export_as_string(v331);
        if not v332 then
            l_bor_0.error(v333);
            return;
        else
            l_clipboard_0.set(v333);
            l_bor_0.success("Config exported to the clipboard");
            return;
        end;
    end;
    l_rshift_0.load = function(v334, v335)
        -- upvalues: l_v101_5 (ref), v317 (ref)
        if v334 == nil then
            v334 = l_v101_5;
        end;
        return v317(v334, v335);
    end;
end;
l_bnot_0 = {};
v98 = "allinone";
v101 = {};
local v336 = l_lshift_0[v98] or v101;
local v337 = {};
local v338 = {};
local v339 = nil;
local l_match_0 = string.match;
do
    local l_l_match_0_0 = l_match_0;
    v339 = function(v342)
        -- upvalues: l_l_match_0_0 (ref)
        return l_l_match_0_0(v342, "^()%s*$") and "" or l_l_match_0_0(v342, "^%s*(.*%S)");
    end;
end;
l_match_0 = function(v343, v344, v345, v346)
    return {
        name = v344, 
        author = v343, 
        content = v346, 
        created_at = v345, 
        updated_at = v345
    };
end;
do
    local l_v98_6, l_v336_0, l_v337_0, l_v338_0, l_v339_0, l_l_match_0_1 = v98, v336, v337, v338, v339, l_match_0;
    local function v356(v353)
        -- upvalues: l_rshift_0 (ref), l_l_match_0_1 (ref)
        local v354, v355 = l_rshift_0.export_as_string();
        if not v354 then
            return nil;
        else
            return l_l_match_0_1(common.get_username(), v353, common.get_unixtime(), v355);
        end;
    end;
    local function v360(v357)
        -- upvalues: l_v338_0 (ref)
        for v358 = #l_v338_0, 1, -1 do
            local v359 = l_v338_0[v358];
            if v359.name == v357 then
                return v359, v358;
            end;
        end;
        return nil, -1;
    end;
    local function v361()
        -- upvalues: l_lshift_0 (ref), l_v98_6 (ref), l_v336_0 (ref)
        l_lshift_0[l_v98_6] = l_v336_0;
    end;
    l_bnot_0.load = function(v362)
        -- upvalues: l_v339_0 (ref), v360 (ref), l_rshift_0 (ref)
        v362 = l_v339_0(v362);
        local v363 = v360(v362);
        if v363 == nil or v363.content == nil then
            return false, "Not found";
        else
            return l_rshift_0.load(nil, v363.content);
        end;
    end;
    l_bnot_0.save = function(v364)
        -- upvalues: l_v339_0 (ref), v360 (ref), v356 (ref), l_v336_0 (ref), l_v337_0 (ref), l_rshift_0 (ref), v361 (ref)
        v364 = l_v339_0(v364);
        local v365, v366 = v360(v364);
        if v365 == nil then
            local v367 = v356(v364);
            if v367 == nil then
                return false, "Failed to create new config";
            else
                v365 = v367;
                table.insert(l_v336_0, v367);
            end;
        end;
        if v366 ~= -1 and v366 <= #l_v337_0 then
            return false, "Failed to change default preset";
        else
            local v368, v369 = l_rshift_0.export_as_string();
            if not v368 then
                return false, "Failed to export config";
            else
                v365.content = v369;
                v365.updated_at = common.get_unixtime();
                v361();
                return true, nil;
            end;
        end;
    end;
    l_bnot_0.delete = function(v370)
        -- upvalues: l_v339_0 (ref), v360 (ref), l_v337_0 (ref), l_v336_0 (ref)
        v370 = l_v339_0(v370);
        local _, v372 = v360(v370);
        if v372 ~= -1 and v372 <= #l_v337_0 then
            return false, "Can't delete default config";
        else
            local v373 = v372 - #l_v337_0;
            table.remove(l_v336_0, v373);
            return true, nil;
        end;
    end;
    l_bnot_0.get = function(v374)
        -- upvalues: l_v338_0 (ref)
        return l_v338_0[v374];
    end;
    l_bnot_0.get_list = function()
        -- upvalues: l_v338_0 (ref), l_v337_0 (ref), v8 (ref)
        local v375 = #l_v338_0;
        if v375 == 0 then
            return {
                [1] = "No availabe presets"
            };
        else
            local v376 = {};
            for v377 = 1, v375 do
                local l_name_0 = l_v338_0[v377].name;
                if v377 <= #l_v337_0 then
                    l_name_0 = v8.icon_title_ex("DEFAULT", "lock", "\a{Small Text}\226\128\162\a{Link Active}" .. v8.get_space(6) .. l_name_0, 4, 7);
                end;
                v376[v377] = l_name_0;
            end;
            for v379 = 1, 11 do
                if v376[v379] == nil then
                    v376[v379] = " ";
                end;
            end;
            return v376;
        end;
    end;
    l_bnot_0.update_data = function()
        -- upvalues: l_v338_0 (ref), l_v337_0 (ref), l_v336_0 (ref)
        l_v338_0 = {};
        for v380 = 1, #l_v337_0 do
            table.insert(l_v338_0, l_v337_0[v380]);
        end;
        table.sort(l_v336_0, function(v381, v382)
            return v381.name < v382.name;
        end);
        for v383 = 1, #l_v336_0 do
            table.insert(l_v338_0, l_v336_0[v383]);
        end;
    end;
    table.insert(l_v337_0, l_l_match_0_1("Iska", "Iska", -1, "allinone_eyJBaXIiOnsiYW5nbGVzIjoie1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjkxNTI0Nzk5MFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4ODg4MDc0NTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTd9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjM4fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIkFpciAmIENyb3VjaGVkIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNzQwNzY2MDgyXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6M30sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTIxfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjozNH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTM5MDIwOTc1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzc0NDUyNzU0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjc2MzkzNDU1NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQ1MDIwOTA3MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzE4NjQ3MDg0OFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxMDQwNjA0NzYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjozOX0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjo2fSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjd9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6LTQxfX19LFwiMjUwNDM5MzQzNVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjMxODYxOTY0NTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjI1NTI2NVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjkwfSxcIjQyNTY2MjEzOTZcIjp7XCIyNzc2OTgzNzBcIjo5MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjh9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjotOTB9fX0sXCIzNzQwNzY2MDgyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzODYzMTE5OTQ1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNzExOTE2NDMyXCI6e1wiMjc3Njk4MzcwXCI6N30sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NTd9fX19In0sIkNyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyOTE1MjQ3OTkwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTg4ODgwNzQ1N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzc0MDc2NjA4MlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yMn0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDl9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjUzOTAyMDk3NVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3NDQ1Mjc1NFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI3NjM5MzQ1NTVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE0NTAyMDkwNzBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMxODY0NzA4NDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTA0MDYwNDc2M1wiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjI1MDQzOTM0MzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzMTg2MTk2NDUwXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDIyNTUyNjVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyNTY2MjEzOTZcIjp7XCIyNzc2OTgzNzBcIjo5MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzc0MDc2NjA4MlwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzg2MzExOTk0NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzcxMTkxNjQzMlwiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjM3OTI0MzM0OTRcIjp7XCIyNzc2OTgzNzBcIjo2MH19fX0ifSwiQ3JvdWNoaW5nICYgTW92ZSI6eyJhbmdsZXMiOiJ7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyOTE1MjQ3OTkwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTg4ODgwNzQ1N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzc0MDc2NjA4MlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xMX0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6Mzh9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjUzOTAyMDk3NVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3NDQ1Mjc1NFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI3NjM5MzQ1NTVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE0NTAyMDkwNzBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMxODY0NzA4NDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTA0MDYwNDc2M1wiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjI1MDQzOTM0MzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzMTg2MTk2NDUwXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDIyNTUyNjVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyNTY2MjEzOTZcIjp7XCIyNzc2OTgzNzBcIjo5MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzc0MDc2NjA4MlwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzg2MzExOTk0NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzcxMTkxNjQzMlwiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjM3OTI0MzM0OTRcIjp7XCIyNzc2OTgzNzBcIjo2MH19fX0ifSwiTW92aW5nIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNzQwNzY2MDgyXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTIzfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjo0MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTM5MDIwOTc1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzc0NDUyNzU0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjc2MzkzNDU1NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQ1MDIwOTA3MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzE4NjQ3MDg0OFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxMDQwNjA0NzYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjUwNDM5MzQzNVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjMxODYxOTY0NTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjI1NTI2NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDI1NjYyMTM5NlwiOntcIjI3NzY5ODM3MFwiOjkwfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzNzQwNzY2MDgyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzODYzMTE5OTQ1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNzExOTE2NDMyXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiMzc5MjQzMzQ5NFwiOntcIjI3NzY5ODM3MFwiOjYwfX19fSJ9LCJTaGFyZWQiOnsiYW5nbGVzIjoie1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjkxNTI0Nzk5MFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNzQwNzY2MDgyXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTM5MDIwOTc1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzc0NDUyNzU0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjc2MzkzNDU1NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQ1MDIwOTA3MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzE4NjQ3MDg0OFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxMDQwNjA0NzYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjUwNDM5MzQzNVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjMxODYxOTY0NTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjI1NTI2NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDI1NjYyMTM5NlwiOntcIjI3NzY5ODM3MFwiOjkwfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzNzQwNzY2MDgyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzODYzMTE5OTQ1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNzExOTE2NDMyXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiMzc5MjQzMzQ5NFwiOntcIjI3NzY5ODM3MFwiOjYwfX19fSJ9LCJTbG93IFdhbGsiOnsiYW5nbGVzIjoie1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjkxNTI0Nzk5MFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4ODg4MDc0NTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIlN0YW5kaW5nIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNzQwNzY2MDgyXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjo0MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTM5MDIwOTc1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzc0NDUyNzU0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjc2MzkzNDU1NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQ1MDIwOTA3MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzE4NjQ3MDg0OFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxMDQwNjA0NzYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjUwNDM5MzQzNVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjMxODYxOTY0NTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjI1NTI2NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDI1NjYyMTM5NlwiOntcIjI3NzY5ODM3MFwiOjkwfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzNzQwNzY2MDgyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzODYzMTE5OTQ1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNzExOTE2NDMyXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiMzc5MjQzMzQ5NFwiOntcIjI3NzY5ODM3MFwiOjYwfX19fSJ9LCJhbnRpYWltIjp7ImFuZ2xlcyI6IntcIjEwMDc4MDM1OTVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTM0OTkzMjZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM0NTY4ODIzODFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNDgyMjEzNjlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyNTUyNjkwNDVcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTM3OTg2ODI5NVwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMzIwMDA5NDU4M1wiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMzM3NTg4NDM4NFwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMzU1NjQ3MjM4MFwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMzY2NjY5OTk0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI0MjI0OTgwNjYzXCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIyMTAzNjM2OTg4XCI6bnVsbCxcIjM2NjU3MDg5MTdcIjpudWxsfX0sXCI0MjcwMjMxMDEyXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI1ODczOTQyMzJcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfX0iLCJkaXJlY3Rpb25zIjoie1wiMjYwNDgxMDAyMlwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI3MDYxMDgzMzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzNjc0MTgzMDk5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNTc1MjczMjIxXCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjpmYWxzZSxcIjE5MjgyMjk2MVwiOnRydWUsXCIxOTM0OTY5NzRcIjoyMCxcIjIwOTA1MTUwMThcIjoxLFwiMjM5OTQ0MDkwNVwiOjAsXCIzMzA3MDY4MzYzXCI6dHJ1ZX1dLFwiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjQ3MDI4NTk0OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjI5Nzk0Mzk4MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODgwNDk2NDY2XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiOTk1MTI3NTk3XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCI0MjY2ODEwMTIxXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjI0NzAyODU5NDlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzMDI4MTE1MzMyXCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjoxMTQwLFwiMTkyODIyOTYxXCI6MyxcIjE5MzQ5Njk3NFwiOjM4LFwiMjA5MDUxNTAxOFwiOjAsXCIyMzk5NDQwOTA1XCI6MCxcIjMzMDcwNjgzNjNcIjp0cnVlfV0sXCIyNzc2OTgzNzBcIjowfSxcIjg4MDQ5NjQ2NlwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19fSIsInBsYXllciI6IntcIjMwNzA2OTYzMjdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNzYyNzgzNDVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTU1MjgxMjY1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE3NTg2MTkzMjFcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiMzU5NzYwMDg1OFwiOntcIjI3NzY5ODM3MFwiOjB9fSIsInR3ZWFrcyI6IntcIjE0NDk0ODQyMTJcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjIwMTc5NTE1XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNDM0ODczNjE5XCI6e1wiMjc3Njk4MzcwXCI6N30sXCI0MDcxNDgyNDk1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NjczNzA1NjlcIjp7XCIyNzc2OTgzNzBcIjoyMn19In0sIm90aGVyIjp7ImV4cGxvaXRzIjoie1wiMTUwNzY0MzQ5NVwiOntcIjQwNTA0ODIxNTBcIjp7XCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NzU0NTY0NzZcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzIxNzM1MDQzNlwiOntcIjQwNTA0ODIxNTBcIjp7XCIzMzE4NjQwMzM1XCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIzNjQ0NzEwNDM2XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM5MjYzMDQzMTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTAzOTk0MDcwMFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjIxODM1MDI5MjFcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjM2NDQ3MTA0MzZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwOTYyOTIzNThcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjkzMTEwNDI2NVwiOntcIjI3NzY5ODM3MFwiOjE0fX19fSIsIm90aGVyIjoie1wiMjgyMzQwNTAzNlwiOntcIjQwNTA0ODIxNTBcIjp7XCIyMTA5ODE4NTM1XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIyNTIzMzE1MjI3XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMjU5OTg1NjI5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMzc1NjM2N1wiOntcIjI3NzY5ODM3MFwiOnRydWV9fX0sXCIzMjIyNTg5OTE1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMjk0OTA4MzM0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzg3ODk2OTQ4NVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxNTMyNDU1MzkzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzIyNTM0ODgxXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNTAyMTc1NDQ5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzk4MDM5MDYzM1wiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjU3ODI2OTAwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX19fX0iLCJyYWdlIjoie1wiMjMzODA3MjUzNlwiOntcIjI3NzY5ODM3MFwiOjE1NX0sXCIyNDQyNzA2MzA3XCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjpmYWxzZSxcIjE5MjgyMjk2MVwiOnRydWUsXCIxOTM0OTY5NzRcIjo1LFwiMjA5MDUxNTAxOFwiOjEsXCIyMzk5NDQwOTA1XCI6MCxcIjMzMDcwNjgzNjNcIjp0cnVlfV0sXCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDk3MDEwNjI2XCI6e1wiMjc3Njk4MzcwXCI6NzF9LFwiMTQ1MjQ4MjMyMFwiOntcIjI3NzY5ODM3MFwiOjd9LFwiMzk4MDM5MDYzM1wiOntcIjI3NzY5ODM3MFwiOjl9fX0sXCIzNjEwMTU2MTYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjI2MjE5OTc4ODRcIjp7XCIyNzc2OTgzNzBcIjoxMDB9LFwiMjYyMTk5Nzg4NVwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCIyNjIxOTk3ODg2XCI6e1wiMjc3Njk4MzcwXCI6MTAwfSxcIjMxNDgyNjU1NTBcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzMTQ4MjY1NTUxXCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzE0ODI2NTU1MlwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM0MzY5MjkxNjdcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzNDM2OTI5MTY4XCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzQzNjkyOTE2OVwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM2NTQzMDc4MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ2ODk1Mzg2M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDY4OTUzODY0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0Njg5NTM4NjVcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODQ2MjgxNDMxXCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjpmYWxzZSxcIjE5MjgyMjk2MVwiOnRydWUsXCIxOTM0OTY5NzRcIjoyMCxcIjIwOTA1MTUwMThcIjoxLFwiMjM5OTQ0MDkwNVwiOjAsXCIzMzA3MDY4MzYzXCI6dHJ1ZX1dLFwiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTQxMzkwMzIwMFwiOntcIjI3NzY5ODM3MFwiOjI3fSxcIjE0NTI0ODIzMjBcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjE4NzM4MzEwMTNcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxOTAwOTA5MDkwXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6N30sXCI2MTAyMTMxMjNcIjp7XCIyNzc2OTgzNzBcIjo0MH19fX0iLCJ1dGlscyI6IntcIjEyOTU4ODY2NzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTkyNDcwMTA2MVwiOm51bGwsXCIyNjY1MjkxMjI5XCI6bnVsbCxcIjI4MjA5MjEyNTRcIjpudWxsLFwiMjkxNjY1MDkxNlwiOm51bGwsXCI3MDIwODIxMThcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTc3NzY0NDYwNFwiOntcIjI3NzY5ODM3MFwiOjd9LFwiMzc4MjkzOTA3MVwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTIyNzk2NzcwNVwiOntcIjI3NzY5ODM3MFwiOjE5fSxcIjE2NzA2Mjc4MjNcIjp7XCIyNzc2OTgzNzBcIjotN30sXCIyMjYxNDUwMzMyXCI6e1wiMjc3Njk4MzcwXCI6LTI1fSxcIjM1ODc5MTQ0MDZcIjp7XCIyNzc2OTgzNzBcIjo2ODd9LFwiNDI3NjcyNTI1OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiNzE0NDc1MTRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI3NDYxMDIwNDVcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3NjcxXCI6MC4yMzE0NDEwMjA5NjU1NzYxNyxcIjE3NzY3NlwiOjAuMTUwNTg4ODcwMDQ4NTIyOTUsXCIxNzc2ODdcIjowLjE1MDU4ODI1OTEwMDkxNH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6dHJ1ZX19IiwidmlzdWFscyI6IntcIjE2NTcxOTk3NjRcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTI5MjYyMTQxM1wiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMTQ1MTkyNzQxMlwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMTgzNTg4MTU0MVwiOntcIjI1NTY2ODgwNFwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIyOTEyMzIzNTg4XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9LHtcIjE3NzY3MFwiOjAuNDIzNTI5NDQ2MTI1MDMwNSxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjAuNzUyOTQxMjUwODAxMDg2NCxcIjE3NzY4N1wiOjAuNzAxOTYwODAyMDc4MjQ3MX1dfSxcIjU4NjE2MjdcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfSxcIjU4NjE2NjBcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzMDczNDUyMzYyXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIxNjczMjkwMzVcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjIzNzUwNTI1M1wiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIyMDg5MDk4MjI5XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2NzFcIjowLjQ2Mjc0NTEzMDA2MjEwMzI3LFwiMTc3Njc2XCI6MC40NjI3NDUxMzAwNjIxMDMyNyxcIjE3NzY4N1wiOjAuNDYyNzQ1MTMwMDYyMTAzMjd9LHtcIjE3NzY3MFwiOjAuODgyMzUzMDA3NzkzNDI2NSxcIjE3NzY3MVwiOjAuNDYyNzQ1MTMwMDYyMTAzMjcsXCIxNzc2NzZcIjowLjQ2Mjc0NTEzMDA2MjEwMzI3LFwiMTc3Njg3XCI6MC40NjI3NDUxMzAwNjIxMDMyN31dfSxcIjM1MDg4NTgzNTFcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjAuNDIzNTI5NDQ2MTI1MDMwNSxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjAuNzUyOTQxMjUwODAxMDg2NCxcIjE3NzY4N1wiOjAuNzAxOTYwODAyMDc4MjQ3MX1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMzgxMTMzMzE1OVwiOntcIjI3NzY5ODM3MFwiOjE0N30sXCIzOTM5MzQ5Mzg2XCI6e1wiMjc3Njk4MzcwXCI6NTJ9LFwiNDAzMzQ2MDkyMlwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIyMTk3NTU1NTcyXCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjIwODkwOTgyMjlcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjAuNzg0MzEzNzk3OTUwNzQ0NixcIjE3NzY3MVwiOjAuMDY2NjY2NjcwMTQzNjA0MjgsXCIxNzc2NzZcIjowLjA2NjY2NjY3MDE0MzYwNDI4LFwiMTc3Njg3XCI6MC4wNjY2NjY2NzAxNDM2MDQyOH0se1wiMTc3NjcwXCI6MC4wLFwiMTc3NjcxXCI6MC4wLFwiMTc3Njc2XCI6MC4wLFwiMTc3Njg3XCI6MS4wfV19LFwiMzUwODg1ODM1MVwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3NjcxXCI6MC4wNjY2NjY2NzAxNDM2MDQyOCxcIjE3NzY3NlwiOjAuMDY2NjY2NjcwMTQzNjA0MjgsXCIxNzc2ODdcIjowLjA2NjY2NjY3MDE0MzYwNDI4fV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIyOTIxODQ1NjY5XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjE0NTE5Mjc0MTJcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODU1MDUwMDA3XCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjE5NTM0MDkzODBcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH0se1wiMTc3NjcwXCI6MC40MjM1Mjk0NDYxMjUwMzA1LFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MC43NTI5NDEyNTA4MDEwODY0LFwiMTc3Njg3XCI6MC43MDE5NjA4MDIwNzgyNDcxfV19LFwiMjY3MzU3MzcwMlwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MC40OTAxOTYxMDg4MTgwNTQyLFwiMTc3Njg3XCI6MC4zMDk4MDM5MzI5MDUxOTcxNH1dfX0sXCIyMDkwNTE1MDE4XCI6MX19LFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIyNjI2OTA4ODg4XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIyNzM0NDc0OTU1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNjczNjI0NjM2XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjE4MzU4ODE1NDFcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMjc5NjkzNDQ4M1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19LFwiMzg2MTY0MDAzN1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC4yMTU2ODYyOTE0NTYyMjI1MyxcIjE3NzY3MVwiOjAuMCxcIjE3NzY3NlwiOjAuMCxcIjE3NzY4N1wiOjAuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzYyMDE5NDkzMFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjM4OTYxMTU3MDJcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI1MzgxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQwNjkyMzI0NjJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTEyNzMwODMyN1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4MzU4ODE1NDFcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMjM2NjI1MzE2XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2ODdcIjowLjMwOTgwMzkzMjkwNTE5NzE0fV19LFwiOTAyOTM1MDI5XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2NzFcIjowLjI5NDExNzY1OTMzMDM2ODA0LFwiMTc3Njc2XCI6MC4xNjA3ODQzMTkwNDMxNTk0OCxcIjE3NzY4N1wiOjAuOTg0MzEzNzg2MDI5ODE1N31dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzEyODY4MDA3MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiODc0NzQ1OTA0XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjE4NzM4MzEwMTNcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMTkzNDU4OTg2XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjQyMzUyOTQ0NjEyNTAzMDUsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjowLjg0MDcyODc1OTc2NTYyNSxcIjE3NzY4N1wiOjAuODA3ODYwMjU1MjQxMzk0fV19LFwiMjA4OTM1OTAwOVwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC42ODc1LFwiMTc3NjcxXCI6MC43Mzk0NDA2MTk5NDU1MjYxLFwiMTc3Njc2XCI6MC42OTgzODQ4ODEwMTk1OTIzLFwiMTc3Njg3XCI6MC45NTE5NjUwOTM2MTI2NzA5fV19fSxcIjIwOTA1MTUwMThcIjoxfX0sXCIyNzc2OTgzNzBcIjp0cnVlfSxcIjIwODg0MTc3NzFcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjcyODk1MTU5M1wiOntcIjI3NzY5ODM3MFwiOnRydWV9fX19In19_"));
    table.insert(l_v337_0, l_l_match_0_1("GrAnDMeMo1337", "Grandmemo", 0, "allinone_eyJBaXIiOnsiYW5nbGVzIjoie1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjkxNTI0Nzk5MFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4ODg4MDc0NTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjV9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjM3fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIkFpciAmIENyb3VjaGVkIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NTh9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NTh9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjJ9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ5fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MTF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjExfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTA0MDYwNDc2M1wiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjI1MDQzOTM0MzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzMTg2MTk2NDUwXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDIyNTUyNjVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyNTY2MjEzOTZcIjp7XCIyNzc2OTgzNzBcIjo5MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzc0MDc2NjA4MlwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzg2MzExOTk0NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzcxMTkxNjQzMlwiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjM3OTI0MzM0OTRcIjp7XCIyNzc2OTgzNzBcIjo2MH19fX0ifSwiQ3JvdWNoaW5nIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NTl9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NTZ9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzNzQwNzY2MDgyXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6OX0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTI4fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjoyNn0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTM5MDIwOTc1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzc0NDUyNzU0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjc2MzkzNDU1NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQ1MDIwOTA3MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzE4NjQ3MDg0OFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxMDQwNjA0NzYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjUwNDM5MzQzNVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjMxODYxOTY0NTBcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjI1NTI2NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDI1NjYyMTM5NlwiOntcIjI3NzY5ODM3MFwiOjkwfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzNzQwNzY2MDgyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzODYzMTE5OTQ1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNzExOTE2NDMyXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiMzc5MjQzMzQ5NFwiOntcIjI3NzY5ODM3MFwiOjYwfX19fSJ9LCJDcm91Y2hpbmcgJiBNb3ZlIjp7ImFuZ2xlcyI6IntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI5MTUyNDc5OTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODg4ODA3NDU3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjo1fSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjIyfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIk1vdmluZyI6eyJhbmdsZXMiOiJ7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyOTE1MjQ3OTkwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTg4ODgwNzQ1N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzc0MDc2NjA4MlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yM30sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjUzOTAyMDk3NVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3NDQ1Mjc1NFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI3NjM5MzQ1NTVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjE0NTAyMDkwNzBcIjp7XCIyNzc2OTgzNzBcIjotNX0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6OX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIlNoYXJlZCI6eyJhbmdsZXMiOiJ7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyOTE1MjQ3OTkwXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4ODg4MDc0NTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sIlNsb3cgV2FsayI6eyJhbmdsZXMiOiJ7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyOTE1MjQ3OTkwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTg4ODgwNzQ1N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzc0MDc2NjA4MlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjZ9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xOH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjUzOTAyMDk3NVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI1MDQzOTM0MzVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3NDQ1Mjc1NFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI3NjM5MzQ1NTVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE0NTAyMDkwNzBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMxODY0NzA4NDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTA0MDYwNDc2M1wiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjI1MDQzOTM0MzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzMTg2MTk2NDUwXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDIyNTUyNjVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyNTY2MjEzOTZcIjp7XCIyNzc2OTgzNzBcIjo5MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzc0MDc2NjA4MlwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzg2MzExOTk0NVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzcxMTkxNjQzMlwiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjM3OTI0MzM0OTRcIjp7XCIyNzc2OTgzNzBcIjo2MH19fX0ifSwiU3RhbmRpbmciOnsiYW5nbGVzIjoie1wiMjUwNDM5MzQzNVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjkxNTI0Nzk5MFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4ODg4MDc0NTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo1NH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo1OX0sXCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM3NDA3NjYwODJcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTd9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ1fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1MzkwMjA5NzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNTA0MzkzNDM1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzQ0NTI3NTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNzYzOTM0NTU1XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDUwMjA5MDcwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMTg2NDcwODQ4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjEwNDA2MDQ3NjNcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNjQxNjY4MTczXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2NTk4NDQ3ODNcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjk3NDI5NzAxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNTA0MzkzNDM1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExNDI1MTgxMTBcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI3MTY0MTA4MzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzMjg1ODk0NzdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY0MTY2ODE3M1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiNjU5ODQ0NzgzXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5NzQyOTcwMTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzE4NjE5NjQ1MFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMTQyMjU1MjY1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxMTQyNTE4MTEwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzE2NDEwODMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzI4NTg5NDc3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjU2NjIxMzk2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM3NDA3NjYwODJcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTE0MjUxODExMFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjcxNjQxMDgzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyODU4OTQ3N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDE2NjgxNzNcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY1OTg0NDc4M1wiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTc0Mjk3MDExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NjMxMTk5NDVcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM3MTE5MTY0MzJcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIzNzkyNDMzNDk0XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX19In0sImFudGlhaW0iOnsiYW5nbGVzIjoie1wiMTAwNzgwMzU5NVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI1MzQ5OTMyNlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzQ1Njg4MjM4MVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA0ODIyMTM2OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDI1NTI2OTA0NVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIxMzc5ODY4Mjk1XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzMjAwMDk0NTgzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzMzc1ODg0Mzg0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNTU2NDcyMzgwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNjY2Njk5OTRcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjQyMjQ5ODA2NjNcIjp7XCIyNzc2OTgzNzBcIjoyLFwiNDA1MDQ4MjE1MFwiOntcIjIxMDM2MzY5ODhcIjpudWxsLFwiMzY2NTcwODkxN1wiOm51bGx9fSxcIjQyNzAyMzEwMTJcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjU4NzM5NDIzMlwiOntcIjI3NzY5ODM3MFwiOnRydWV9fSIsImRpcmVjdGlvbnMiOiJ7XCIyNjA0ODEwMDIyXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjcwNjEwODMzOFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjM2NzQxODMwOTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM1NzUyNzMyMjFcIjp7XCIyNTQyNjkwNzdcIjpbe1wiMTQyNzg1NTgzNlwiOmZhbHNlLFwiMTczNTcwNjE4MlwiOmZhbHNlLFwiMTkyODIyOTYxXCI6dHJ1ZSxcIjE5MzQ5Njk3NFwiOjE2NCxcIjIwOTA1MTUwMThcIjoxLFwiMjM5OTQ0MDkwNVwiOjAsXCIzMzA3MDY4MzYzXCI6ZmFsc2V9XSxcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI0NzAyODU5NDlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIyOTc5NDM5ODJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg4MDQ5NjQ2NlwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjk5NTEyNzU5N1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiNDI2NjgxMDEyMVwiOntcIjQwNTA0ODIxNTBcIjp7XCIyNDcwMjg1OTQ5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzAyODExNTMzMlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODgwNDk2NDY2XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX19IiwicGxheWVyIjoie1wiMzA3MDY5NjMyN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM3NjI3ODM0NVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxNTUyODEyNjU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTc1ODYxOTMyMVwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIzNTk3NjAwODU4XCI6e1wiMjc3Njk4MzcwXCI6MH19IiwidHdlYWtzIjoie1wiMTQ0OTQ4NDIxMlwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMjAxNzk1MTVcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjM0MzQ4NzM2MTlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNzE0ODI0OTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjY2NzM3MDU2OVwiOntcIjI3NzY5ODM3MFwiOjE1fX0ifSwib3RoZXIiOnsiZXhwbG9pdHMiOiJ7XCIxNTA3NjQzNDk1XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjM2NTQzMDc4MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg3NTQ1NjQ3NlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzMjE3MzUwNDM2XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjMzMTg2NDAzMzVcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjM2NDQ3MTA0MzZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM2NTQzMDc4MDhcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzkyNjMwNDMxMFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMDM5OTQwNzAwXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMjE4MzUwMjkyMVwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiMzY0NDcxMDQzNlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA5NjI5MjM1OFwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiOTMxMTA0MjY1XCI6e1wiMjc3Njk4MzcwXCI6MTR9fX19Iiwib3RoZXIiOiJ7XCIyODIzNDA1MDM2XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjIxMDk4MTg1MzVcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIyNTIzMzE1MjI3XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMjU5OTg1NjI5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMzc1NjM2N1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzIyMjU4OTkxNVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzI5NDkwODMzNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjM4Nzg5Njk0ODVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTUzMjQ1NTM5M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzMyMjUzNDg4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjM1MDIxNzU0NDlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzOTgwMzkwNjMzXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiNTc4MjY5MDBcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fX0iLCJyYWdlIjoie1wiMjMzODA3MjUzNlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQ0MjcwNjMwN1wiOntcIjI1NDI2OTA3N1wiOlt7XCIxNDI3ODU1ODM2XCI6ZmFsc2UsXCIxNzM1NzA2MTgyXCI6ZmFsc2UsXCIxOTI4MjI5NjFcIjp0cnVlLFwiMTkzNDk2OTc0XCI6MTEyLFwiMjA5MDUxNTAxOFwiOjAsXCIyMzk5NDQwOTA1XCI6MCxcIjMzMDcwNjgzNjNcIjp0cnVlfV0sXCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDk3MDEwNjI2XCI6e1wiMjc3Njk4MzcwXCI6MzB9LFwiMTQ1MjQ4MjMyMFwiOntcIjI3NzY5ODM3MFwiOjd9LFwiMzk4MDM5MDYzM1wiOntcIjI3NzY5ODM3MFwiOjV9fX0sXCIzNjEwMTU2MTYzXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjI2MjE5OTc4ODRcIjp7XCIyNzc2OTgzNzBcIjoxMDB9LFwiMjYyMTk5Nzg4NVwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCIyNjIxOTk3ODg2XCI6e1wiMjc3Njk4MzcwXCI6MTAwfSxcIjMxNDgyNjU1NTBcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzMTQ4MjY1NTUxXCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzE0ODI2NTU1MlwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM0MzY5MjkxNjdcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzNDM2OTI5MTY4XCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzQzNjkyOTE2OVwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM2NTQzMDc4MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ2ODk1Mzg2M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDY4OTUzODY0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0Njg5NTM4NjVcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODQ2MjgxNDMxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTQxMzkwMzIwMFwiOntcIjI3NzY5ODM3MFwiOjMwfSxcIjE0NTI0ODIzMjBcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjE4NzM4MzEwMTNcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxOTAwOTA5MDkwXCI6e1wiMjc3Njk4MzcwXCI6M30sXCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI2MTAyMTMxMjNcIjp7XCIyNzc2OTgzNzBcIjo1MH19fX0iLCJ1dGlscyI6IntcIjEyOTU4ODY2NzVcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTkyNDcwMTA2MVwiOm51bGwsXCIyNjY1MjkxMjI5XCI6bnVsbCxcIjI4MjA5MjEyNTRcIjpudWxsLFwiMjkxNjY1MDkxNlwiOm51bGwsXCI3MDIwODIxMThcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTc3NzY0NDYwNFwiOntcIjI3NzY5ODM3MFwiOjE1fSxcIjM3ODI5MzkwNzFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMjI3OTY3NzA1XCI6e1wiMjc3Njk4MzcwXCI6MjV9LFwiMTY3MDYyNzgyM1wiOntcIjI3NzY5ODM3MFwiOi0xNX0sXCIyMjYxNDUwMzMyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNTg3OTE0NDA2XCI6e1wiMjc3Njk4MzcwXCI6NjgwfSxcIjQyNzY3MjUyNThcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjcxNDQ3NTE0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI3NDYxMDIwNDVcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC44ODIzNTMwMDc3OTM0MjY1LFwiMTc3NjcxXCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3Njc2XCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3Njg3XCI6MC43ODQzMTM3OTc5NTA3NDQ2fV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjp0cnVlfX0iLCJ2aXN1YWxzIjoie1wiMTY1NzE5OTc2NFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMjkyNjIxNDEzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ1MTkyNzQxMlwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE4MzU4ODE1NDFcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMjkxMjMyMzU4OFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfSx7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2ODdcIjowLjMwOTgwMzkzMjkwNTE5NzE0fV19LFwiNTg2MTYyN1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19LFwiNTg2MTY2MFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzMDczNDUyMzYyXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIxNjczMjkwMzVcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjIzNzUwNTI1M1wiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIyMDg5MDk4MjI5XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjQ5MDE5NjEwODgxODA1NDIsXCIxNzc2NzFcIjowLjQ2Mjc0NTEzMDA2MjEwMzI3LFwiMTc3Njc2XCI6MC40NjI3NDUxMzAwNjIxMDMyNyxcIjE3NzY4N1wiOjAuNDYyNzQ1MTMwMDYyMTAzMjd9LHtcIjE3NzY3MFwiOjAuODgyMzUzMDA3NzkzNDI2NSxcIjE3NzY3MVwiOjAuNDYyNzQ1MTMwMDYyMTAzMjcsXCIxNzc2NzZcIjowLjQ2Mjc0NTEzMDA2MjEwMzI3LFwiMTc3Njg3XCI6MC40NjI3NDUxMzAwNjIxMDMyN31dfSxcIjM1MDg4NTgzNTFcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjAuODgyMzUzMDA3NzkzNDI2NSxcIjE3NzY3MVwiOjAuNDYyNzQ1MTMwMDYyMTAzMjcsXCIxNzc2NzZcIjowLjQ2Mjc0NTEzMDA2MjEwMzI3LFwiMTc3Njg3XCI6MC40NjI3NDUxMzAwNjIxMDMyN31dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMzgxMTMzMzE1OVwiOntcIjI3NzY5ODM3MFwiOjEwNX0sXCIzOTM5MzQ5Mzg2XCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiNDAzMzQ2MDkyMlwiOntcIjI3NzY5ODM3MFwiOjN9fX0sXCIyMTk3NTU1NTcyXCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjIwODkwOTgyMjlcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjAuMzM5MTkxNTU1OTc2ODY3NyxcIjE3NzY3MVwiOjAuODcwNTg4MjQzMDA3NjU5OSxcIjE3NzY3NlwiOjAuNzMwMDI0NTE2NTgyNDg5LFwiMTc3Njg3XCI6MC42NzU5ODYxNzA3Njg3Mzc4fSx7XCIxNzc2NzBcIjowLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjowLjY1ODM1MTQyMTM1NjIwMTIsXCIxNzc2ODdcIjowLjU3NjQ3MDYxMzQ3OTYxNDN9XX0sXCIzNTA4ODU4MzUxXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjc4NDMxMzc5Nzk1MDc0NDYsXCIxNzc2NzFcIjowLjA2NjY2NjY3MDE0MzYwNDI4LFwiMTc3Njc2XCI6MC4wNjY2NjY2NzAxNDM2MDQyOCxcIjE3NzY4N1wiOjAuMDY2NjY2NjcwMTQzNjA0Mjh9XX19LFwiMjA5MDUxNTAxOFwiOjF9fSxcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjI5MjE4NDU2NjlcIjp7XCI0MDUwNDgyMTUwXCI6e1wiMTQ1MTkyNzQxMlwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMTg1NTA1MDAwN1wiOntcIjI1NTY2ODgwNFwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIxOTUzNDA5MzgwXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjowLjc3NjQ3MDYwMTU1ODY4NTMsXCIxNzc2NzZcIjowLjY2NDM2MTM1NzY4ODkwMzgsXCIxNzc2ODdcIjowLjU1NzIzMTg0MzQ3MTUyNzF9LHtcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuMCxcIjE3NzY3NlwiOjAuMCxcIjE3NzY4N1wiOjAuMH1dfSxcIjI2NzM1NzM3MDJcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjAuNDkwMTk2MTA4ODE4MDU0MixcIjE3NzY4N1wiOjAuMzA5ODAzOTMyOTA1MTk3MTR9XX19LFwiMjA5MDUxNTAxOFwiOjF9fSxcIjI3NzY5ODM3MFwiOnRydWV9LFwiMjYyNjkwODg4OFwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMjczNDQ3NDk1NVwiOntcIjI3NzY5ODM3MFwiOnRydWV9fX0sXCIzNjczNjI0NjM2XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjE4MzU4ODE1NDFcIjp7XCIyNTU2Njg4MDRcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMjc5NjkzNDQ4M1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC43ODQzMTM3OTc5NTA3NDQ2LFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19LFwiMzg2MTY0MDAzN1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC4yMTU2ODYyOTE0NTYyMjI1MyxcIjE3NzY3MVwiOjAuMCxcIjE3NzY3NlwiOjAuMCxcIjE3NzY4N1wiOjAuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNjIwMTk0OTMwXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzODk2MTE1NzAyXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI1MzgxXCI6e1wiMjc3Njk4MzcwXCI6MzI3Njd9fX0sXCI0MDY5MjMyNDYyXCI6e1wiNDA1MDQ4MjE1MFwiOntcIjExMjczMDgzMjdcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxODM1ODgxNTQxXCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjIzNjYyNTMxNlwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC40OTAxOTYxMDg4MTgwNTQyLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MC40OTAxOTYxMDg4MTgwNTQyLFwiMTc3Njg3XCI6MC4zMDk4MDM5MzI5MDUxOTcxNH1dfSxcIjkwMjkzNTAyOVwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MC40OTAxOTYxMDg4MTgwNTQyLFwiMTc3NjcxXCI6MC4yOTQxMTc2NTkzMzAzNjgwNCxcIjE3NzY3NlwiOjAuMTYwNzg0MzE5MDQzMTU5NDgsXCIxNzc2ODdcIjowLjk4NDMxMzc4NjAyOTgxNTd9XX19LFwiMjA5MDUxNTAxOFwiOjB9fSxcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjMxMjg2ODAwNzFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjg3NDc0NTkwNFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxODczODMxMDEzXCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjE5MzQ1ODk4NlwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MC40OTAxOTYxMDg4MTgwNTQyLFwiMTc3Njg3XCI6MC4zMDk4MDM5MzI5MDUxOTcxNH1dfSxcIjIwODkzNTkwMDlcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuMjk0MTE3NjU5MzMwMzY4MDQsXCIxNzc2NzZcIjowLjE2MDc4NDMxOTA0MzE1OTQ4LFwiMTc3Njg3XCI6MC45ODQzMTM3ODYwMjk4MTU3fV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzc2OTgzNzBcIjp0cnVlfSxcIjIwODg0MTc3NzFcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjcyODk1MTU5M1wiOntcIjI3NzY5ODM3MFwiOnRydWV9fX19In19_"));
    l_bnot_0.update_data();
    events.shutdown(v361);
end;
v98 = {};
v101 = {};
do
    local l_v101_6 = v101;
    v336 = function()
        -- upvalues: l_v101_6 (ref)
        local v385 = ui.get_binds();
        for v386 in pairs(l_v101_6) do
            l_v101_6[v386] = nil;
        end;
        for v387 = 1, #v385 do
            local v388 = v385[v387];
            l_v101_6[v388.reference:id()] = v388;
        end;
    end;
    v98.get = function(v389)
        -- upvalues: l_v101_6 (ref)
        if v389 == nil then
            return nil;
        else
            return l_v101_6[v389:id()];
        end;
    end;
    events.render(v336);
end;
v101 = {};
v336 = "allinone_deadlock";
v337 = db[v336] or {
    debuff_remover = false
};
do
    local l_v336_1, l_v337_1, l_v338_1 = v336, v337, v338;
    l_v338_1 = function()
        -- upvalues: l_v336_1 (ref), l_v337_1 (ref)
        db[l_v336_1] = l_v337_1;
    end;
    v339 = function(v393)
        -- upvalues: l_v337_1 (ref), l_v338_1 (ref)
        if v393 == "debuff_remover" then
            l_v337_1.debuff_remover = not l_v337_1.debuff_remover;
            l_v338_1();
        end;
    end;
    events.console_input(v339);
    events.shutdown(l_v338_1);
    v101.get_debuff_remover = function()
        -- upvalues: l_v337_1 (ref)
        return l_v337_1.debuff_remover;
    end;
end;
v336 = {};
v337 = "https://a2ep24pv.allinone.guru";
v338 = "k6RlAJTa0RkkQYatjZbc2dOh7zkK3DXM";
v339 = function(v394)
    if not v394 then
        v394 = 16;
    end;
    local v395 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    local v396 = "";
    for _ = 1, v394 do
        local v398 = math.random(1, #v395);
        v396 = string.format("%s%s", v396, v395:sub(v398, v398));
    end;
    return v396;
end;
l_match_0 = function(v399)
    local v400 = {};
    for v401 in pairs(v399) do
        table.insert(v400, v401);
    end;
    table.sort(v400);
    return v400;
end;
do
    local l_v337_2, l_v338_2, l_v339_1, l_l_match_0_2 = v337, v338, v339, l_match_0;
    local function v412(v406, v407)
        -- upvalues: l_l_match_0_2 (ref), v91 (ref)
        local v408 = l_l_match_0_2(v406);
        local v409 = "";
        for _, v411 in ipairs(v408) do
            v409 = string.format("%s%s%s", v409, v411, tostring(v406[v411]));
        end;
        v409 = string.format("%s%s", v409, v407);
        return v91.hash(v409);
    end;
    v336.verify = function()
        -- upvalues: v6 (ref), l_v339_1 (ref), v412 (ref), l_v338_2 (ref), l_v337_2 (ref), l_bor_0 (ref), l_clipboard_0 (ref)
        local v413 = {
            cheat = "neverlose", 
            username = v6.user, 
            nonce = l_v339_1(16)
        };
        v413.signature = v412(v413, l_v338_2);
        local v414 = string.format("%s%s", l_v337_2, "/token/generate");
        local v415 = json.stringify(v413);
        local v416 = {
            ["Content-Type"] = "application/json"
        };
        network.post(v414, v415, v416, function(v417)
            -- upvalues: l_bor_0 (ref), l_clipboard_0 (ref), v6 (ref)
            local v418 = json.parse(v417);
            if v418.success then
                local v419 = string.format("Token: %s", v418.token);
                l_bor_0.success(v419);
                l_clipboard_0.set(v418.token);
                common.add_notify(v6.name, "Your token is in the clipboard and console");
            else
                local v420 = string.format("%s", v418.error or "Unknown error");
                l_bor_0.error(v420);
            end;
        end);
    end;
end;
v337 = {};
conditions = {
    [0] = "Shared", 
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slow Walk", 
    [4] = "Crouching", 
    [5] = "Crouching & Move", 
    [6] = "Air", 
    [7] = "Air & Crouched"
};
v338 = {};
v339 = function()
    -- upvalues: v9 (ref), v6 (ref)
    local v421 = ui.get_style();
    local v422 = v421["Link Active"];
    local v423 = v421["Text Preview"];
    local l_realtime_0 = globals.realtime;
    local v425 = v9.wave(v6.name, v422, v423, l_realtime_0);
    ui.sidebar(string.format("%s", v425 .. "##1"), v6.icon);
end;
events.render(v339);
v339 = {};
v337.home = v339;
l_match_0 = v8.icon_title("house-night");
v339.group_about = ui.create(l_match_0, "About", 1);
v339.group_social = ui.create(l_match_0, "Social", 1);
v339.group_leaderboard = ui.create(l_match_0, "Leaderboard", 1):visibility(false);
v339.group_links = ui.create(l_match_0, "Links", 1);
v339.group_presets = ui.create(l_match_0, "Presets", 2);
v339.group_credits = ui.create(l_match_0, "Credits", 2):visibility(false);
local v426 = {};
v337.home.about = v426;
local v427 = {};
v426.user = v427;
v427.label = v339.group_about:label(v8.icon_title("user", "User", 4, 12));
v427.button = v339.group_about:button(v8.icon_title("", "\a{Link Active}" .. v6.user), function()
    -- upvalues: v8 (ref), v6 (ref)
    v8.link("https://forum.neverlose.cc/u/" .. v6.user .. "/summary");
end, true);
local v428 = {};
v426.version = v428;
v428.label = v339.group_about:label(v8.icon_title("code-branch", "Version", 4, 13));
v428.button = v339.group_about:button(v8.icon_title("", "\a{Link Active}" .. v6.build), function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/market/item?id=W80k72");
end, true);
v427 = {};
v339.social = v427;
v428 = {};
v427.discord = v428;
v428.label = v339.group_social:label(v8.icon_title("fingerprint", "Social", 3, 11));
v428.server_button = v339.group_social:button(v8.icon_title("discord"), function()
    -- upvalues: v8 (ref)
    v8.link("https://discord.gg/allinone");
end, true):tooltip("\194\183  Join to discord server");
v428.verify_button = v339.group_social:button(v8.icon_title("key"), function()
    -- upvalues: v336 (ref)
    v336.verify();
end, true):tooltip("\194\183  Generate \"token\" for take role.");
local v429 = {};
v427.online = v429;
v429.label = v339.group_social:label(v8.icon_title("screencast", "Online", 2, 10));
v429.button = v339.group_social:button(v8.icon_title("loader", ""), nil, true):tooltip("\194\183  Current online \"users\".");
v428 = {};
v339.leaderboard = v428;
v429 = {};
v428.position = v429;
v429.label = v339.group_leaderboard:label(v8.icon_title("medal", "Position", 3, 11));
v429.number_button = v339.group_leaderboard:button("#1", nil, true);
v429.reset_button = v339.group_leaderboard:button(v8.icon_title_ex("C12332FF", "delete-left", ""), function()
    web.reset_stats();
end, true):tooltip("\194\183 \aDD3636ffThis is button full reset your actually statistic without recovery!");
local v430 = {};
v428.statistics = v430;
v430.label = v339.group_leaderboard:label(v8.icon_title("chart-radar", "Statistics", 3, 11));
v430.kills_button = v339.group_leaderboard:button("5", nil, true):tooltip("\194\183  Kills.");
v430.death_button = v339.group_leaderboard:button("1", nil, true):tooltip("\194\183  Death.");
v430.kd_button = v339.group_leaderboard:button("5.0", nil, true):tooltip("\194\183  K/D.");
v429 = {};
v339.links = v429;
v430 = {};
v429.cfg = v430;
v430.label = v339.group_links:label(v8.icon_title("gear", "Configs", 3, 11));
v430.iska_button = v339.group_links:button("\240\159\140\138  Iska", function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/market/item?id=UNnTo1");
end, true):tooltip("\194\183  Iska configuration.");
v430.puff_button = v339.group_links:button("\240\159\148\165  puff", function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/market/item?id=epyTLB");
end, true):tooltip("\194\183  Puff configuration.");
local v431 = {};
v429.themes = v431;
v431.label = v339.group_links:label(v8.icon_title("sun", "Themes", 3, 12));
v431.purple_button = v339.group_links:button(v8.icon_title_ex("CCBAEAFF", "circle", "##1"), function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/getitem?c=4kagl5QIfPMT8SGs-p-GqNZKwAF");
end, true):tooltip("\194\183  Theme \aCCBAEAFF\"purple\".");
v431.mint_button = v339.group_links:button(v8.icon_title_ex("A4FFF9FF", "circle", "##2"), function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/getitem?c=YAgiWUc0cnzICRQt-qRXBpV8mOu");
end, true):tooltip("\194\183  Theme \aA4FFF9FF\"mint\".");
v431.pitch_button = v339.group_links:button(v8.icon_title_ex("EABABAFF", "circle", "##3"), function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/getitem?c=LsiyuxiN11LveKCA-rBZM6gYl65");
end, true):tooltip("\194\183  Theme \aEABABAFF\"pitch\".");
v431.red_button = v339.group_links:button(v8.icon_title_ex("FF0000FF", "circle", "##4"), function()
    -- upvalues: v8 (ref)
    v8.link("https://neverlose.cc/getitem?c=e1dRuiOp0mYLSIjJ-oQBSpM-47p");
end, true):tooltip("\194\183  Theme \aFF0000FF\"red\".");
v430 = {};
v339.presets = v430;
v430.list = v339.group_presets:list("##1", {});
v430.input = v339.group_presets:input("");
v430.import_button = v339.group_presets:button(v8.icon_title_ex("DEFAULT", "download", "", 6, 6), nil, true):tooltip("\194\183  Import current settings.\n\n\194\183  Please note that the settings will be imported into the current configuration, not the selected preset.");
v430.export_button = v339.group_presets:button(v8.icon_title_ex("DEFAULT", "file", "", 6, 6), nil, true):tooltip("\194\183  Export current settings.\n\n\194\183  Please note that the settings will be exported from the current configuration, not the selected preset.");
v430.delete_button = v339.group_presets:button(v8.icon_title_ex("C12332FF", "trash-xmark", "", 6, 7), nil, true):tooltip("\194\183  Delete preset.");
v430.save_button = v339.group_presets:button(v8.icon_title("floppy-disk", "Save" .. v8.get_space(6), 6, 6), nil, true):tooltip("\194\183  Save/Create preset.");
v430.load_button = v339.group_presets:button(v8.icon_title("toggle-large-on", "Load" .. v8.get_space(6), 6, 6), nil, true):tooltip("\194\183  Load preset.");
v430.cancel = v339.group_presets:button(v8.icon_title_ex("C12332FF", "xmark", "Cancel" .. v8.get_space(30), 30, 8), nil, true):disabled(true);
v430.confirm = v339.group_presets:button(v8.icon_title("check", "Confirm" .. v8.get_space(25), 25, 8), nil, true):disabled(true);
v431 = {};
v339.credits = v431;
v431.name = v339.group_credits:label("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \t\t\t\tAll in One\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDeveloper LazyMind and Iska\n\t\t\t\t\t\t\t\t\t\t\tTelegram @lazymind1337 and @shwebenbeb");
v431.sofa = v339.group_credits:switch(v8.icon_title("atlassian", "Sofa Mode", 4, 12));
local v432 = nil;
do
    local l_v426_0 = v426;
    local function v435(v434)
        -- upvalues: v6 (ref), l_v426_0 (ref)
        if v434:get() then
            v6.name = "Sofa";
            v6.build = "Nightly";
            v6.icon = "couch";
            l_v426_0.version.button:name("\a{Link Active}" .. v6.build);
        else
            v6.name = "All in One";
            v6.build = "Release";
            v6.icon = "atlassian";
            l_v426_0.version.button:name("\a{Link Active}" .. v6.build);
        end;
    end;
    v431.sofa:set_callback(v435, true);
end;
l_match_0 = {};
v337.other = l_match_0;
v426 = v8.icon_title("grid-2");
l_match_0.group_exploits = ui.create(v426, "Exploits", 1);
l_match_0.group_rage = ui.create(v426, "Rage", 1);
l_match_0.group_misc = ui.create(v426, "Misc", 1);
l_match_0.group_visuals = ui.create(v426, "Visuals", 2);
l_match_0.group_utils = ui.create(v426, "Utils", 2);
v427 = {};
v337.exploits = v427;
v428 = {};
v427.fakelag = v428;
v428.label = l_match_0.group_exploits:label(v8.icon_title_ex(v8.insecure, "transporter-3", "Fakelag", 3, 11));
v429 = v428.label:create();
v428.unlock_fd = v429:switch(v8.icon_title("rabbit", "Unlock FD Speed", 3, 11));
v428.type = v429:combo(v8.icon_title("send-backward", "Type", 3, 12), {
    [1] = "Default", 
    [2] = "Neverlose+", 
    [3] = "Fluctuate"
});
v428.limit = v429:slider(v8.icon_title("arrow-trend-up", "Limit", 2, 10), 1, 16, 14, 1, "t");
v428.stage = v429:slider(v8.icon_title("bars", "Stage", 4, 12), 1, 3, 2, 1);
v428.ignore_fd = v429:switch(v8.icon_title("duck", "Ignore FD", 3, 11));
v430 = nil;
do
    local l_v428_0, l_v429_0, l_v430_0 = v428, v429, v430;
    v431 = function(v439)
        -- upvalues: l_v428_0 (ref)
        local v440 = v439:get();
        l_v428_0.limit:visibility(v440 == "Neverlose+" or v440 == "Custom");
        l_v428_0.stage:visibility(v440 == "Fluctuate");
        l_v428_0.ignore_fd:visibility(v440 == "Fluctuate");
    end;
    l_v428_0.type:set_callback(v431, true);
    l_v429_0 = {};
    v427.auto_double_tap = l_v429_0;
    l_v429_0.label = l_match_0.group_exploits:label(v8.icon_title_ex(v8.insecure, "xing", "Auto Double Tap", 5, 13));
    l_v430_0 = l_v429_0.label:create();
    l_v429_0.type = l_v430_0:combo(v8.icon_title("send-backward", "Type", 3, 12), {
        [1] = "Disabled", 
        [2] = "Air Lag", 
        [3] = "Teleport"
    });
    l_v429_0.weapon = l_v430_0:selectable(v8.icon_title("gun", "Weapon", 2, 11), {
        [1] = "Autosnipers", 
        [2] = "Scout", 
        [3] = "AWP", 
        [4] = "R8 / Deagle", 
        [5] = "Knife / Taser", 
        [6] = "Other"
    });
    l_v429_0.delay = l_v430_0:slider(v8.icon_title("hourglass-clock", "Delay", 2, 11), 0, 16, 4, 1, "s");
    v431 = nil;
    v432 = function(v441)
        -- upvalues: l_v429_0 (ref)
        local v442 = v441:get();
        l_v429_0.delay:visibility(v442 ~= "Disabled");
        l_v429_0.weapon:visibility(v442 ~= "Disabled");
    end;
    local function v445(v443)
        -- upvalues: l_v429_0 (ref)
        local v444 = unpack(v443:get());
        l_v429_0.delay:disabled(v444 == nil);
    end;
    l_v429_0.type:set_callback(v432, true);
    l_v429_0.weapon:set_callback(v445, true);
    l_v430_0 = {};
    v427.auto_hide_shots = l_v430_0;
    l_v430_0.label = l_match_0.group_exploits:label(v8.icon_title_ex(v8.insecure, "shield", "Auto Hide Shots", 3, 12));
    v431 = l_v430_0.label:create();
    l_v430_0.states = v431:selectable(v8.icon_title("square-sliders", "States", 4, 12), {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Slow Walk", 
        [4] = "Crouching", 
        [5] = "Crouching & Move", 
        [6] = "Air", 
        [7] = "Air & Crouched"
    });
    l_v430_0.weapon = v431:selectable(v8.icon_title("gun", "Weapon", 2, 11), {
        [1] = "Autosnipers", 
        [2] = "Scout", 
        [3] = "AWP", 
        [4] = "R8 / Deagle", 
        [5] = "Knife / Taser", 
        [6] = "Other"
    });
    v432 = nil;
    v445 = function(v446)
        -- upvalues: l_v430_0 (ref)
        local v447 = unpack(v446:get());
        l_v430_0.weapon:disabled(v447 == nil);
    end;
    l_v430_0.states:set_callback(v445, true);
end;
v428 = {};
v337.ragebob = v428;
v429 = {};
v428.peek_bot = v429;
v429.enabled = l_match_0.group_rage:switch(v8.icon_title("microchip-ai", "Peek Bot", 3, 11));
v430 = v429.enabled:create();
v429.override_color = v430:switch(v8.icon_title("sun", "Override color", 3, 11));
v429.color = v429.override_color:color_picker(color());
v429.hitboxes = v430:selectable(v8.icon_title("boxes-stacked", "Hitboxes", 2, 10), {
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Arms", 
    [5] = "Legs"
});
v429.weapons = v430:selectable(v8.icon_title("gun", "Weapon", 2, 11), {
    [1] = "Scout", 
    [2] = "Deagle", 
    [3] = "Pistols"
});
v429.hitchance = v430:slider(v8.icon_title("bullseye-arrow", "Hit Chance", 3, 11), 0, 100, 50, 1, function(v448)
    if v448 == 0 then
        return "Auto";
    else
        return string.format("%s%%", v448);
    end;
end);
v429.simulation = v430:slider(v8.icon_title("filter-list", "Simulation", 3, 11), 25, 35, 30, 0.01, "s");
v429.rate_limit = v430:slider(v8.icon_title("heart-pulse", "Rate Limit", 2, 10), 0, 30, 3, 0.01, "s");
v431 = nil;
v432 = v429.hitboxes:get();
do
    local l_v429_1, l_v430_1, l_v431_0 = v429, v430, v431;
    do
        local l_v432_0 = v432;
        local function v455(v453)
            -- upvalues: l_v432_0 (ref), l_v429_1 (ref)
            local v454 = v453:get();
            if #v454 > 0 then
                l_v432_0 = v454;
            else
                l_v429_1.hitboxes:set(l_v432_0);
            end;
        end;
        if #l_v432_0 == 0 then
            l_v432_0 = {
                [1] = "Head", 
                [2] = "Chest", 
                [3] = "Stomach"
            };
            l_v429_1.hitboxes:set(l_v432_0);
        end;
        local function v458(v456)
            -- upvalues: l_v429_1 (ref)
            local v457 = v456:get();
            l_v429_1.color:visibility(v457);
        end;
        l_v429_1.hitboxes:set_callback(v455, true);
        l_v429_1.override_color:set_callback(v458, true);
    end;
    l_v430_1 = {};
    v428.dormant_aimbot = l_v430_1;
    l_v430_1.enabled = l_match_0.group_rage:switch(v8.icon_title("block-brick", "Dormant Aimbot", 4, 12));
    l_v431_0 = l_v430_1.enabled:create();
    l_v430_1.hitbox = l_v431_0:selectable(v8.icon_title("boxes-stacked", "Hitboxes", 2, 10), {
        [1] = "Head", 
        [2] = "Chest", 
        [3] = "Stomach", 
        [4] = "Legs"
    });
    l_v430_1.accuracy = l_v431_0:slider(v8.icon_title("arrow-down-short-wide", "Accuracy", 2, 10), 30, 100, 90, 1, function(v459)
        if v459 == 30 then
            return ui.get_icon("ghost");
        else
            return string.format("%d%%", v459);
        end;
    end);
    l_v430_1.damage = l_v431_0:slider(v8.icon_title("arrow-up-short-wide", "Min. Damage", 2, 10), 0, 100, 10, 1, function(v460)
        if v460 == 0 then
            return "Auto";
        else
            return v460;
        end;
    end);
    v432 = nil;
    local v461 = l_v430_1.hitbox:get();
    do
        local l_v461_0 = v461;
        local function v465(v463)
            -- upvalues: l_v461_0 (ref), l_v430_1 (ref)
            local v464 = v463:get();
            if #v464 > 0 then
                l_v461_0 = v464;
            else
                l_v430_1.hitbox:set(l_v461_0);
            end;
        end;
        if #l_v461_0 == 0 then
            l_v461_0 = {
                [1] = "Head", 
                [2] = "Chest", 
                [3] = "Stomach"
            };
            l_v430_1.hitbox:set(l_v461_0);
        end;
        l_v430_1.hitbox:set_callback(v465, true);
    end;
    l_v431_0 = {};
    v428.hitchance_modifiers = l_v431_0;
    l_v431_0.label = l_match_0.group_rage:label(v8.icon_title("badge-percent", "Hitchance Modifiers", 3, 11));
    v432 = l_v431_0.label:create();
    v461 = {
        [1] = "AutoSnipers", 
        [2] = "AWP", 
        [3] = "SSG-08"
    };
    l_v431_0.weapon = v432:list(v8.icon_title("gun", "Weapon", 2, 11), v461);
    local v466 = {};
    l_v431_0.options = v466;
    for v467 = 1, #v461 do
        local v468 = v461[v467];
        local v470 = {
            modifiers = v432:selectable(v8.icon_title("gear", "Modifiers##" .. v467, 3, 11), {
                [1] = "No Scope", 
                [2] = "In Air"
            }), 
            distance = v432:slider(v8.icon_title("arrows-left-right", "Distance##" .. v467, 3, 11), 40, 201, 100, 0.1, function(v469)
                if v469 == 201 then
                    return "Inf";
                else
                    return string.format("%.1fm", v469 * 0.1);
                end;
            end), 
            ns_hitchance = v432:slider(v8.icon_title("location-crosshairs-slash", "No Scope##" .. v467, 2, 8), 0, 100, 50, 1, "%"), 
            air_hitchance = v432:slider(v8.icon_title("wind", "In Air##" .. v467, 3, 11), 0, 100, 50, 1, "%")
        };
        l_v431_0.options[v468] = v470;
    end;
    local _ = nil;
    do
        local l_v461_1, l_v466_0 = v461, v466;
        local function v481()
            -- upvalues: l_v431_0 (ref), l_v461_1 (ref), l_v466_0 (ref)
            local v474 = l_v431_0.weapon:get();
            for v475 = 1, #l_v461_1 do
                local v476 = l_v461_1[v475];
                local v477 = v474 == v475;
                local v478 = l_v466_0[v476];
                local v479 = v478.modifiers:get("No Scope");
                local v480 = v478.modifiers:get("In Air");
                v478.modifiers:visibility(v477);
                v478.distance:visibility(v477 and v479);
                v478.ns_hitchance:visibility(v477 and v479);
                v478.air_hitchance:visibility(v477 and v480);
            end;
        end;
        for v482 = 1, #l_v461_1 do
            l_v466_0[l_v461_1[v482]].modifiers:set_callback(v481);
        end;
        l_v431_0.weapon:set_callback(v481, true);
    end;
    v428.fake_latency = l_match_0.group_rage:slider(v8.icon_title("signal-stream", "Fake Latency", 2, 10), 0, 200, 0, 1, function(v483)
        if v483 == 0 then
            return "Off";
        else
            return v483 .. "ms";
        end;
    end);
end;
v429 = {};
v337.misc = v429;
v430 = {};
v429.granades = v430;
v430.label = l_match_0.group_misc:label(v8.icon_title("bomb", "Grenades", 3, 11));
v431 = v430.label:create();
v430.throw_fix = v431:switch(v8.icon_title("hand-holding-heart", "Throw Fix", 2, 11));
v430.super_toss = v431:switch(v8.icon_title("mitten", "Super Toss", 4, 12));
v430.drop = v431:switch(v8.icon_title("citrus", "Drop Nades", 3, 11));
v430.release = v431:selectable(v8.icon_title("bolt-auto", "Nade Release", 2, 10), {
    [1] = "HE", 
    [2] = "Molotov", 
    [3] = "Smoke", 
    [4] = "Flashbang"
}):tooltip("\194\183 Enabling \"HE\" unlocks \"Min. Damage\" feature");
v430.release_dmg = v431:slider(v8.icon_title("arrow-up-short-wide", "Min. Damage", 2, 10), 1, 50, 10, 1);
v432 = nil;
do
    local l_v430_2 = v430;
    local function v487(v485)
        -- upvalues: l_v430_2 (ref)
        local v486 = v485:get("HE");
        l_v430_2.release_dmg:disabled(not v486);
    end;
    l_v430_2.release:set_callback(v487, true);
    v431 = {};
    v429.movement = v431;
    v431.label = l_match_0.group_misc:label(v8.icon_title("wheelchair-move", "Movement", 4, 12));
    v432 = v431.label:create();
    v431.fast_ladder = v432:switch(v8.icon_title("water-ladder", "Fast Ladder", 2, 10));
    v431.no_fall_damage = v432:switch(v8.icon_title("bird", "No Fall Damage", 3, 11));
    v431.edge_quick_stop = v432:switch(v8.icon_title("person-circle-exclamation", "Edge Quick Stop", 2, 10));
    v431.collision_air_duck = v432:switch(v8.icon_title("duck", "Collision Air Duck", 3, 11));
    v429.clantag = l_match_0.group_misc:switch(v8.icon_title("tag", "Clan Tag", 4, 12));
    v432 = {};
    v429.optimizations = v432;
    v432.enabled = l_match_0.group_misc:selectable(v8.icon_title("trash-can", "Optimizations", 4, 12), {
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
end;
v430 = {};
v337.visuals = v430;
v431 = {};
v430.logs = v431;
v431.label = l_match_0.group_visuals:label(v8.icon_title("calendar-pen", "Aimbot Logging", 4, 13));
v432 = v431.label:create();
v431.override_color = v432:switch(v8.icon_title("sun", "Override color", 3, 11));
v431.color = v431.override_color:color_picker({
    Miss = {
        color(251, 41, 75)
    }, 
    Hit = {
        color(79, 125, 255)
    }
});
v431.console = v432:switch(v8.icon_title("rectangle-terminal", "Console", 3, 11));
v431.event = v432:switch(v8.icon_title("message-text", "Event", 3, 11));
local v488 = nil;
do
    local l_v431_1, l_v432_1, l_v488_0 = v431, v432, v488;
    local function v494(v492)
        -- upvalues: l_v431_1 (ref)
        local v493 = v492:get();
        l_v431_1.color:visibility(v493);
    end;
    l_v431_1.override_color:set_callback(v494, true);
    l_v432_1 = {};
    v430.indicators = l_v432_1;
    l_v432_1.label = l_match_0.group_visuals:label(v8.icon_title("bars", "Indicators", 4, 12));
    l_v488_0 = l_v432_1.label:create();
    l_v432_1.override_style = l_v488_0:switch(v8.icon_title("sun", "Override Style", 3, 11));
    l_v432_1.color = l_v432_1.override_style:color_picker({
        Release = {
            color(79, 125, 255)
        }, 
        Nightly = {
            color(255, 255, 255), 
            color(79, 125, 255)
        }
    });
    l_v432_1.crosshairs = l_v488_0:switch(v8.icon_title("crosshairs", "Crosshairs", 3, 11));
    l_v432_1.damage = l_v488_0:switch(v8.icon_title("raygun", "Damage", 2, 10));
    l_v432_1.manual = l_v488_0:switch(v8.icon_title("arrows-left-right", "Manuals", 3, 11));
    v494 = nil;
    local function v497(v495)
        -- upvalues: l_v432_1 (ref)
        local v496 = v495:get();
        l_v432_1.color:visibility(v496);
    end;
    l_v432_1.override_style:set_callback(v497, true);
    l_v488_0 = {};
    v430.overlay_markers = l_v488_0;
    l_v488_0.label = l_match_0.group_visuals:label(v8.icon_title("fan", "Markers", 3, 11));
    v494 = l_v488_0.label:create();
    l_v488_0.override_color = v494:switch(v8.icon_title("sun", "Override Color", 3, 11));
    l_v488_0.color = l_v488_0.override_color:color_picker({
        ["2D"] = {
            color(255, 255, 255)
        }, 
        ["3D"] = {
            color(255, 255, 255)
        }, 
        Damage = {
            color(255, 255, 255), 
            color(79, 125, 255)
        }
    });
    l_v488_0.damage = v494:switch(v8.icon_title("raygun", "Damage", 2, 10));
    l_v488_0.marker2d = v494:switch(v8.icon_title("crosshairs-simple", "2D", 3, 11));
    l_v488_0.marker3d = v494:switch(v8.icon_title("cube", "3D", 3, 11));
    v497 = nil;
    local function v500(v498)
        -- upvalues: l_v488_0 (ref)
        local v499 = v498:get();
        l_v488_0.color:visibility(v499);
    end;
    l_v488_0.override_color:set_callback(v500, true);
    v494 = {};
    v430.gamesense_indicators = v494;
    v494.label = l_match_0.group_visuals:label(v8.icon_title_ex(v8.insecure, "recycle", "GameSense", 3, 11));
    v497 = v494.label:create();
    v494.override_color = v497:switch(v8.icon_title("sun", "Override Color", 3, 11));
    v494.color = v494.override_color:color_picker({
        Accent = {
            color(255, 255, 255, 200)
        }, 
        Background = {
            color(0, 0, 0, 55)
        }
    });
    v494.icon = v497:switch(v8.icon_title("icons", "Icon", 3, 11));
    v494.select = v497:listable("", {
        [1] = "Aimbot Statistics", 
        [2] = "Fake Latency", 
        [3] = "Fake Duck", 
        [4] = "Hide Shots", 
        [5] = "Double Tap", 
        [6] = "Safe Point", 
        [7] = "Body Aim", 
        [8] = "Min. Damage Override", 
        [9] = "Hit Chance Override", 
        [10] = "Peek Bot", 
        [11] = "Dormant Aimbot", 
        [12] = "Freestanding", 
        [13] = "Velocity Warning", 
        [14] = "Defusing", 
        [15] = "Bomb Information"
    });
    v494.spectator_list = v497:switch(v8.icon_title("eye", "Spectator List", 2, 11));
    v500 = nil;
    local function v502(v501)
        -- upvalues: v494 (ref)
        v494.color:visibility(v501:get());
    end;
    v494.override_color:set_callback(v502, true);
    v497 = {};
    v430.scope_overlay = v497;
    v497.enabled = l_match_0.group_visuals:switch(v8.icon_title("crosshairs-simple", "Scope Overlay", 3, 11));
    v500 = v497.enabled:create();
    v497.color = v500:color_picker(v8.icon_title("sun", "Color", 3, 11), {
        Simple = {
            color(118, 118, 118, 225)
        }, 
        Fade = {
            color(118, 118, 118, 125), 
            color(118, 118, 118, 225)
        }
    });
    v497.position = v500:slider(v8.icon_title("arrows-maximize", "Position", 4, 12), 0, 500, 105, 1, "px");
    v497.offset = v500:slider(v8.icon_title("arrows-up-down-left-right", "Offset", 3, 11), 0, 500, 10, 1, "px");
    v497.options = v500:selectable(v8.icon_title("gear", "Options", 3, 11), {
        [1] = "Animate Size", 
        [2] = "T Style"
    });
    v500 = {};
    v430.grenade_radius = v500;
    v500.label = l_match_0.group_visuals:label(v8.icon_title("circle", "Grenade Radius", 3, 11));
    v502 = v500.label:create();
    v500.override_color = v502:switch(v8.icon_title("sun", "Override Color", 3, 11));
    v500.color = v500.override_color:color_picker({
        Smoke = {
            color(79, 125, 255, 125)
        }, 
        Molotov = {
            color(251, 41, 75, 125)
        }
    });
    v500.smoke = v502:switch(v8.icon_title("cloud-meatball", "Smoke", 2, 10));
    v500.molotov = v502:switch(v8.icon_title("fire", "Molotov", 4, 12));
    local v503 = nil;
    local function v506(v504)
        -- upvalues: v500 (ref)
        local v505 = v504:get();
        v500.color:visibility(v505);
    end;
    v500.override_color:set_callback(v506, true);
    v502 = {};
    v430.inaccuracy_overlay = v502;
    v502.enabled = l_match_0.group_visuals:switch(v8.icon_title("circle-notch", "Inaccuracy Overlay", 3, 11));
    v502.color = v502.enabled:color_picker({
        Simple = {
            color(17, 17, 17, 200)
        }, 
        Fade = {
            color(17, 17, 17, 200), 
            color(17, 17, 17, 0)
        }
    });
    v503 = nil;
    v506 = function(v507)
        -- upvalues: v502 (ref)
        local v508 = v507:get();
        v502.color:visibility(v508);
    end;
    v502.enabled:set_callback(v506, true);
end;
v431 = {};
v337.utilits = v431;
v432 = {};
v431.aspect_ratio = v432;
v432.label = l_match_0.group_utils:label(v8.icon_title("expand", "Aspect Ratio", 4, 13));
v488 = v432.label:create();
local v509 = {
    [1] = "16:9", 
    [2] = "16:10", 
    [3] = "4:3", 
    [4] = "5:4"
};
local v510 = {
    ["16:9"] = 177, 
    ["5:4"] = 125, 
    ["4:3"] = 133, 
    ["16:10"] = 160
};
local v511 = {};
for v512 = 1, #v509 do
    local v513 = v509[v512];
    v511[v510[v513]] = v513;
end;
do
    local l_v432_2, l_v510_0 = v432, v510;
    do
        local l_v511_0 = v511;
        local function v518(v517)
            -- upvalues: l_v511_0 (ref)
            if v517 == 0 then
                return "Off";
            else
                return l_v511_0[v517];
            end;
        end;
        l_v432_2.proportion = v488:slider(v8.icon_title("arrow-right-arrow-left", "Proportion", 3, 11), 0, 200, 0, 0.01, v518);
        for v519 = 1, #v509 do
            local v520 = v509[v519];
            local v521 = l_v510_0[v520];
            do
                local l_v521_0 = v521;
                local function v523()
                    -- upvalues: l_v432_2 (ref), l_v521_0 (ref)
                    l_v432_2.proportion:set(l_v521_0);
                end;
                v488:button(v8.icon_title("", "" .. v520 .. v8.get_space(11), 12), v523, true);
            end;
        end;
    end;
    v488 = {};
    v431.viewmodel = v488;
    v488.enabled = l_match_0.group_utils:switch(v8.icon_title("hands", "Viewmodel", 3, 12));
    v509 = v488.enabled:create();
    v488.fov = v509:slider(v8.icon_title("arrows-maximize", "Field of View", 4, 12), 0, 1000, tonumber(cvar.viewmodel_fov:string()) * 10, 0.1);
    v488.x = v509:slider(v8.icon_title("arrows-left-right", "Offset X", 3, 11), -100, 100, tonumber(cvar.viewmodel_offset_x:string()) * 10, 0.1);
    v488.y = v509:slider(v8.icon_title("arrow-up-right-and-arrow-down-left-from-center", "Offset Y", 3, 11), -100, 100, tonumber(cvar.viewmodel_offset_y:string()) * 10, 0.1);
    v488.z = v509:slider(v8.icon_title("arrow-down-arrow-up", "Offset Z", 4, 12), -100, 100, tonumber(cvar.viewmodel_offset_z:string()) * 10, 0.1);
    v488.swap_knife_hand = v509:switch(v8.icon_title("fork-knife", "Swap Knife Hand", 2, 11));
    v509 = {};
    v431.keep_model_transparency = v509;
    v509.enabled = l_match_0.group_utils:switch(v8.icon_title("face-dotted", "Keep Model Transparency", 3, 11));
    l_v510_0 = {};
    v431.vgui_color = l_v510_0;
    l_v510_0.enabled = l_match_0.group_utils:switch(v8.icon_title("square-terminal", "VGUI Override Color", 5, 12));
    l_v510_0.color = l_v510_0.enabled:color_picker(color(200, 200, 200, 225));
    v511 = nil;
    local function v526(v524)
        -- upvalues: l_v510_0 (ref)
        local v525 = v524:get();
        l_v510_0.color:visibility(v525);
    end;
    l_v510_0.enabled:set_callback(v526, true);
    v511 = {};
    v431.panorama = v511;
    v511.list = l_match_0.group_utils:selectable(v8.icon_title("earth-americas", "Panorama", 3, 11), {
        [1] = "Remove News and Shop", 
        [2] = "Remove Cooldown", 
        [3] = "Legacy Warning", 
        [4] = "Custom Background"
    });
end;
v426 = {};
v337.antiaim = v426;
v427 = v8.icon_title("route-interstate");
v426.group_angles = ui.create(v427, "Angles", 2);
v426.group_directions = ui.create(v427, "Directions", 1);
v426.group_tweaks = ui.create(v427, "Tweaks", 1);
v426.group_player = ui.create(v427, "Player", 1);
v428 = {};
v426.defensive = v428;
v428.enabled = v426.group_angles:switch(v8.icon_title_ex(v8.insecure, "arrows-spin", "Defensive", 3, 11));
v429 = v428.enabled:create();
v428.actions = v429:selectable(v8.icon_title("list", "Actions", 3, 12), {
    [1] = "Hide Shots", 
    [2] = "Double Tap"
});
v428.triggers = v429:selectable(v8.icon_title("fingerprint", "Triggers", 3, 12), {
    [1] = "On Peek", 
    [2] = "Safe Head", 
    [3] = "Directions", 
    [4] = "Flashed", 
    [5] = "Taking Damage", 
    [6] = "Weapon Not Ready"
}):tooltip("\194\183 Enabling \"Safe Head\" or \"Directions\" unlocks \"Spam Bait\" feature");
v428.spam = v429:selectable(v8.icon_title("sparkles", "Spam Bait", 3, 11), {
    [1] = "Safe Head", 
    [2] = "Directions"
});
v428.ping_cap = v429:slider(v8.icon_title("arrow-up-wide-short", "Ping Cap", 2, 10), 0, 200, 0, nil, function(v527)
    if v527 == 0 then
        return "Off";
    else
        return v527 .. "ms";
    end;
end);
v430 = nil;
do
    local l_v426_1 = v426;
    do
        local l_v427_0, l_v428_1, l_v429_2 = v427, v428, v429;
        v431 = function(v532)
            -- upvalues: l_v428_1 (ref)
            local v533 = v532:get("Safe Head") or v532:get("Directions");
            l_v428_1.spam:disabled(not v533);
        end;
        l_v428_1.triggers:set_callback(v431, true);
        l_v429_2 = {};
        l_v426_1.menu_states = l_v429_2;
        l_v429_2.select = l_v426_1.group_angles:combo(v8.icon_title("list-dropdown", "Condition", 3, 11), conditions);
        v430 = l_v429_2.select:create();
        v431 = function()
            -- upvalues: v337 (ref), l_v429_2 (ref)
            local v534 = v337.antiaim.builder[l_v429_2.select:get()];
            if v534 == nil then
                return {};
            else
                return v534.groups;
            end;
        end;
        do
            local l_v431_2 = v431;
            v432 = function()
                -- upvalues: l_rshift_0 (ref), l_v431_2 (ref), l_clipboard_0 (ref)
                local v536, _ = l_rshift_0.load(l_v431_2(), l_clipboard_0.get());
                if not v536 then
                    return;
                else
                    print("Condition imported");
                    return;
                end;
            end;
            v488 = function()
                -- upvalues: l_rshift_0 (ref), l_v431_2 (ref), l_clipboard_0 (ref)
                local v538, v539 = l_rshift_0.export_as_string(l_v431_2());
                if not v538 then
                    return;
                else
                    l_clipboard_0.set(v539);
                    print("Condition exported");
                    return;
                end;
            end;
            l_v429_2.import_button = v430:button(v8.icon_title_ex("DEFAULT", "download", "", 6, 6), v432, true):tooltip("\194\183  Import current preset.");
            l_v429_2.export_button = v430:button(v8.icon_title_ex("DEFAULT", "file", "", 6, 6), v488, true):tooltip("\194\183  Export current preset.");
        end;
        v430 = {};
        l_v426_1.manual_yaw = v430;
        v430.label = l_v426_1.group_directions:label(v8.icon_title("arrows-left-right", "Manual Yaw", 3, 11));
        v431 = v430.label:create();
        v430.direction = v431:combo(v8.icon_title("arrows-up-down-left-right", "Direction", 3, 11), {
            [1] = "Disabled", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Forward"
        });
        v430.disable_yaw_modifiers = v431:switch(v8.icon_title("toggle-large-off", "Disable Yaw Modifiers", 2, 10));
        v430.body_freestanding = v431:switch(v8.icon_title("right-left", "Body Freestanding", 3, 11));
        v431 = {};
        l_v426_1.freestanding = v431;
        v431.enabled = l_v426_1.group_directions:switch(v8.icon_title("repeat", "Freestanding", 3, 11));
        v432 = v431.enabled:create();
        v431.disablers = v432:selectable(v8.icon_title("list", "Disablers", 3, 11), {
            [1] = "Air", 
            [2] = "Air & Crouched", 
            [3] = "Crouching"
        });
        v431.disable_yaw_modifiers = v432:switch(v8.icon_title("toggle-large-off", "Disable Yaw Modifiers", 2, 10));
        v431.body_freestanding = v432:switch(v8.icon_title("right-left", "Body Freestanding", 3, 11));
        v431.only_if_peek_assist = v432:switch(v8.icon_title("street-view", "Only if Peek Assist", 3, 11));
        v432 = {};
        l_v426_1.edge_yaw = v432;
        v432.enabled = l_v426_1.group_directions:switch(v8.icon_title("magnet", "Edge Yaw", 4, 12));
        v488 = v432.enabled:create();
        v432.disable_eye_base = v488:switch(v8.icon_title("eye", "Disable Eye Base", 2, 10));
        v432.only_if_fake_ducking = v488:switch(v8.icon_title("duck", "Only if Fake Ducking", 3, 11));
        v488 = {};
        l_v426_1.avoid_backstab = v488;
        v488.enabled = l_v426_1.group_tweaks:switch(v8.icon_title("knife-kitchen", "Avoid Backstab", 2, 11));
        v509 = {};
        l_v426_1.antiaim_on_use = v509;
        v509.enabled = l_v426_1.group_tweaks:switch(v8.icon_title("mitten", "Anti-Aim on Use", 4, 13));
        v510 = {};
        l_v426_1.safe_head = v510;
        v510.select = l_v426_1.group_tweaks:selectable(v8.icon_title("helmet-safety", "Safe Head", 2, 10), {
            [1] = "Standing", 
            [2] = "Crouched", 
            [3] = "Air & Crouched", 
            [4] = "Distance", 
            [5] = "Knife / Taser"
        });
        v511 = {};
        l_v426_1.vanish_mode = v511;
        v511.select = l_v426_1.group_tweaks:selectable(v8.icon_title("transporter-5", "Vanish Mode", 3, 12), {
            [1] = "On Warmup", 
            [2] = "No Enemies"
        });
        local v540 = {};
        l_v426_1.force_break_lc = v540;
        v540.select = l_v426_1.group_tweaks:selectable(v8.icon_title_ex(v8.insecure, "wind", "Force Break LC", 3, 11), {
            [1] = "Air", 
            [2] = "Air & Crouched", 
            [3] = "Crouching"
        });
        local v541 = {};
        l_v426_1.animations = v541;
        v541.label = l_v426_1.group_player:label(v8.icon_title("layer-group", "Animations", 3, 12));
        local v542 = v541.label:create();
        v541.pitch_zero_on_land = v542:switch(v8.icon_title("head-side", "Pitch Zero on Land", 3, 11));
        v541.lean_amount = v542:slider(v8.icon_title("person-snowboarding", "Extended Lean", 3, 11), 1, 10, 1, 1, function(v543)
            if v543 == 1 then
                return "NL";
            else
                return v543 .. "x";
            end;
        end);
        v541.onground_legs = l_v426_1.group_player:combo(v8.icon_title("person-walking-with-cane", "Onground Legs", 4, 12), {
            [1] = "Disabled", 
            [2] = "Sliding", 
            [3] = "Jitter", 
            [4] = "Direction"
        });
        v541.in_air_legs = l_v426_1.group_player:combo(v8.icon_title("person-drowning", "In-Air Legs", 2, 11), {
            [1] = "Disabled", 
            [2] = "Force", 
            [3] = "Legacy", 
            [4] = "Direction"
        });
        v542 = {};
        l_v426_1.builder = v542;
        local l_conditions_0 = conditions;
        local v545 = #l_conditions_0;
        local function v572(v546, _)
            -- upvalues: v8 (ref), v7 (ref)
            local v548 = {
                pitch = v546:combo(v8.icon_title("arrow-up-arrow-down", "Pitch", 4, 12), v7.antiaim.angles.pitch:list()), 
                yaw = v546:combo(v8.icon_title("arrow-right-arrow-left", "Yaw", 3, 12), v7.antiaim.angles.yaw:list())
            };
            local v549 = v548.yaw:create();
            v548.yaw_base = v549:combo(v8.icon_title("compass", "Base", 3, 11), v7.antiaim.angles.yaw_base:list());
            v548.yaw_type = v549:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "180", 
                [2] = "Left / Right"
            });
            v548.yaw_offset = v549:slider(v8.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "\194\176");
            v548.yaw_random = v549:slider(v8.icon_title("shuffle", "Randomization", 3, 11), 0, 100, 0, 1, function(v550)
                if v550 == 0 then
                    return "Off";
                else
                    return v550 .. "%";
                end;
            end);
            v548.yaw_offset_left = v549:slider(v8.icon_title("arrow-left", "Offset Left", 4, 12), -180, 180, 0, 1, "\194\176");
            v548.yaw_offset_right = v549:slider(v8.icon_title("arrow-right", "Offset Right", 4, 12), -180, 180, 0, 1, "\194\176");
            v548.yaw_delay = v549:slider(v8.icon_title("clock-twelve", "Delay", 3, 11), 1, 10, 0, 1, function(v551)
                if v551 == 1 then
                    return "Off";
                else
                    return v551 .. "t";
                end;
            end);
            v548.yaw_delay_second = v549:slider(v8.icon_title("clock-six-thirty", "Delay Second", 3, 11), 0, 10, 0, 1, function(v552)
                if v552 == 0 then
                    return "Off";
                else
                    return v552 .. "t";
                end;
            end);
            local v553 = nil;
            local function v556(v554)
                -- upvalues: v548 (ref)
                local v555 = v554:get();
                v548.yaw_delay_second:visibility(v555 ~= 1);
            end;
            do
                local l_v556_0 = v556;
                local function v561()
                    -- upvalues: v548 (ref), l_v556_0 (ref)
                    local v558 = v548.yaw_type:get();
                    local v559 = v558 == "180";
                    local v560 = v558 == "Left / Right";
                    if v560 then
                        v548.yaw_delay:set_callback(l_v556_0, true);
                    else
                        v548.yaw_delay:unset_callback(l_v556_0);
                    end;
                    if not v560 then
                        v548.yaw_delay_second:visibility(false);
                    end;
                    v548.yaw_offset:visibility(v559);
                    v548.yaw_random:visibility(v559);
                    v548.yaw_offset_left:visibility(v560);
                    v548.yaw_offset_right:visibility(v560);
                    v548.yaw_delay:visibility(v560);
                end;
                v548.yaw_type:set_callback(v561, true);
            end;
            v548.yaw_modifier = v546:combo(v8.icon_title("arrows-repeat", "Modifier", 3, 11), {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "Spin", 
                [6] = "3-Way", 
                [7] = "5-Way", 
                [8] = "Skitter"
            });
            v553 = v548.yaw_modifier:create();
            v548.yaw_modifier_type = v553:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "Default", 
                [2] = "Switch", 
                [3] = "Half-Sway"
            });
            v548.yaw_modifier_offset = v553:slider(v8.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "\194\176");
            v548.yaw_modifier_random = v553:slider(v8.icon_title("shuffle", "Randomization", 3, 11), 0, 100, 0, 1, function(v562)
                if v562 == 0 then
                    return "Off";
                else
                    return v562 .. "%";
                end;
            end);
            v548.yaw_modifier_offset_from = v553:slider(v8.icon_title("arrow-left-to-line", "Offset From", 4, 12), -180, 180, 0, 1, "\194\176");
            v548.yaw_modifier_offset_to = v553:slider(v8.icon_title("arrow-right-to-line", "Offset To", 4, 12), -180, 180, 0, 1, "\194\176");
            v556 = nil;
            local function v565(v563)
                -- upvalues: v548 (ref)
                local v564 = v563:get();
                v548.yaw_modifier_offset:visibility(v564 == "Default");
                v548.yaw_modifier_random:visibility(v564 == "Default");
                v548.yaw_modifier_offset_from:visibility(v564 ~= "Default");
                v548.yaw_modifier_offset_to:visibility(v564 ~= "Default");
            end;
            v548.yaw_modifier_type:set_callback(v565, true);
            v548.body_yaw = v546:switch(v8.icon_title("angle-90", "Body Yaw", 4, 12));
            v556 = v548.body_yaw:create();
            v548.body_yaw_options = v556:selectable(v8.icon_title("list", "Options", 3, 11), {
                [1] = "Jitter", 
                [2] = "Avoid Overlap", 
                [3] = "Anti Bruteforce"
            });
            v548.body_limit_left = v556:slider(v8.icon_title("arrow-left-to-line", "Limit Left", 4, 12), 0, 60, 60, 1, "\194\176");
            v548.body_limit_right = v556:slider(v8.icon_title("arrow-right-to-line", "Limit Right", 4, 12), 0, 60, 60, 1, "\194\176");
            v548.body_random_jitter = v556:switch(v8.icon_title("shuffle", "Randomize Jitter", 3, 11));
            v548.body_inverter = v556:switch(v8.icon_title("toggle-large-on", "Inverter", 2, 10));
            v548.body_freestanding = v556:combo(v8.icon_title("repeat", "Freestanding", 3, 11), v7.antiaim.angles.body_freestanding:list());
            v565 = nil;
            local function v568(v566)
                -- upvalues: v548 (ref)
                local l_v566_0 = v566;
                v548.body_random_jitter:visibility(l_v566_0:get("Jitter"));
                v548.body_inverter:visibility(not l_v566_0:get("Jitter"));
            end;
            v548.body_yaw_options:set_callback(v568, true);
            v548.extended_angles = v546:switch(v8.icon_title_ex(v8.insecure, "people-arrows", "Extended Angles", 2, 10));
            v565 = v548.extended_angles:create();
            v548.extended_angles_pitch = v565:slider(v8.icon_title("arrow-up-arrow-down", "Pitch", 4, 12), -180, 180, 0, 1, "\194\176");
            v548.extended_angles_roll = v565:slider(v8.icon_title("arrow-up-right-from-square", "Roll", 4, 12), 0, 90, 0, 1, "\194\176");
            v568 = nil;
            local function v571(v569)
                -- upvalues: v548 (ref)
                local v570 = v569:get();
                v548.yaw_modifier:visibility(v570 ~= "Disabled");
            end;
            v548.yaw:set_callback(v571, true);
            return v548;
        end;
        local function v604(v573, _)
            -- upvalues: v8 (ref)
            local v575 = {
                mode = v573:combo(v8.icon_title_ex(v8.insecure, "list", "Type", 3, 12), {
                    [1] = "Disabled", 
                    [2] = "Default", 
                    [3] = "Flick"
                })
            };
            local v576 = v575.mode:create();
            v575.speed = v576:slider(v8.icon_title("rabbit", "Speed", 3, 11), 2, 12, 10, 1, "t");
            v575.limit = v576:slider(v8.icon_title("angle-90", "Limit", 4, 12), 0, 60, 60, 1, "\194\176");
            local v577 = nil;
            local function v580(v578)
                -- upvalues: v575 (ref)
                local v579 = v578:get();
                v575.speed:visibility(v579 == "Flick");
                v575.limit:visibility(v579 == "Flick");
            end;
            v575.mode:set_callback(v580, true);
            v577 = {};
            v575.default = v577;
            v577.pitch = v573:label(v8.icon_title("arrow-up-arrow-down", "Pitch", 4, 12));
            v580 = v577.pitch:create();
            v577.pitch_type = v580:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Switch", 
                [4] = "Spin", 
                [5] = "Random"
            });
            v577.pitch_angle = v580:slider(v8.icon_title("chart-line-up", "Angle", 3, 12), -89, 89, 0, 1, "\194\176");
            v577.pitch_angle_from = v580:slider(v8.icon_title("arrow-left-to-line", "Angle From", 4, 13), -89, 89, 0, 1, "\194\176");
            v577.pitch_angle_to = v580:slider(v8.icon_title("arrow-right-to-line", "Angle To", 4, 13), -89, 89, 0, 1, "\194\176");
            v577.pitch_angle_delay = v580:slider(v8.icon_title("gauge-simple-max", "Delay", 3, 11), 1, 8, 1, nil, function(v581)
                if v581 == 1 then
                    return "Off";
                else
                    return v581 .. "t";
                end;
            end);
            v577.pitch_angle_speed = v580:slider(v8.icon_title("gauge-simple-max", "Speed", 3, 11), 2, 20, 1, 0.5);
            local v582 = nil;
            local function v585(v583)
                -- upvalues: v577 (ref)
                local v584 = v583:get();
                v577.pitch_angle:visibility(v584 == "Static");
                v577.pitch_angle_from:visibility(v584 == "Switch" or not (v584 ~= "Random") or v584 == "Spin");
                v577.pitch_angle_to:visibility(v584 == "Switch" or not (v584 ~= "Random") or v584 == "Spin");
                v577.pitch_angle_delay:visibility(v584 == "Switch");
                v577.pitch_angle_speed:visibility(v584 == "Spin");
            end;
            v577.pitch_type:set_callback(v585, true);
            v577.yaw = v573:label(v8.icon_title("arrow-right-arrow-left", "Yaw", 3, 12));
            v582 = v577.yaw:create();
            v577.yaw_type = v582:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Switch", 
                [4] = "Spin", 
                [5] = "Random", 
                [6] = "Center"
            });
            v577.yaw_angle = v582:slider(v8.icon_title("chart-line-up", "Angle", 3, 12), -180, 180, 0, 1, "\194\176");
            v577.yaw_angle_from = v582:slider(v8.icon_title("arrow-left-to-line", "Angle From", 4, 13), -180, 180, 0, 1, "\194\176");
            v577.yaw_angle_to = v582:slider(v8.icon_title("arrow-right-to-line", "Angle To", 4, 13), -180, 180, 0, 1, "\194\176");
            v577.yaw_angle_delay = v582:slider(v8.icon_title("gauge-simple-max", "Delay", 3, 11), 1, 8, 1, nil, function(v586)
                if v586 == 1 then
                    return "Off";
                else
                    return v586 .. "t";
                end;
            end);
            v577.yaw_angle_speed = v582:slider(v8.icon_title("gauge-simple-max", "Speed", 3, 11), 2, 20, 1, 0.5);
            v577.yaw_offset = v582:slider(v8.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "\194\176");
            v585 = nil;
            local function v589(v587)
                -- upvalues: v577 (ref)
                local v588 = v587:get();
                v577.yaw_angle:visibility(v588 == "Static" or v588 == "Random");
                v577.yaw_offset:visibility(v588 == "Center");
                v577.yaw_angle_from:visibility(v588 == "Switch" or v588 == "Spin");
                v577.yaw_angle_to:visibility(v588 == "Switch" or v588 == "Spin");
                v577.yaw_angle_delay:visibility(v588 == "Switch");
                v577.yaw_angle_speed:visibility(v588 == "Spin");
            end;
            v577.yaw_type:set_callback(v589, true);
            v580 = {};
            v575.flick = v580;
            v580.pitch = v573:label(v8.icon_title("arrow-up-arrow-down", "Pitch ", 4, 12));
            v582 = v580.pitch:create();
            v580.pitch_type = v582:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Switch", 
                [4] = "Spin", 
                [5] = "Random"
            });
            v580.pitch_angle = v582:slider(v8.icon_title("chart-line-up", "Angle", 3, 12), -89, 89, 0, 1, "\194\176");
            v580.pitch_angle_from = v582:slider(v8.icon_title("arrow-left-to-line", "Angle From", 4, 13), -89, 89, 0, 1, "\194\176");
            v580.pitch_angle_to = v582:slider(v8.icon_title("arrow-right-to-line", "Angle To", 4, 13), -89, 89, 0, 1, "\194\176");
            v580.pitch_angle_delay = v582:slider(v8.icon_title("gauge-simple-max", "Delay", 3, 11), 1, 8, 1, nil, function(v590)
                if v590 == 1 then
                    return "Off";
                else
                    return v590 .. "t";
                end;
            end);
            v580.pitch_angle_speed = v582:slider(v8.icon_title("gauge-simple-max", "Speed", 3, 11), 2, 20, 1, 0.5);
            v585 = nil;
            v589 = function(v591)
                -- upvalues: v580 (ref)
                local v592 = v591:get();
                v580.pitch_angle:visibility(v592 == "Static");
                v580.pitch_angle_from:visibility(v592 == "Switch" or not (v592 ~= "Random") or v592 == "Spin");
                v580.pitch_angle_to:visibility(v592 == "Switch" or not (v592 ~= "Random") or v592 == "Spin");
                v580.pitch_angle_delay:visibility(v592 == "Switch");
                v580.pitch_angle_speed:visibility(v592 == "Spin");
            end;
            v580.pitch_type:set_callback(v589, true);
            v580.yaw = v573:label(v8.icon_title("arrow-right-arrow-left", "Yaw ", 3, 12));
            v585 = v580.yaw:create();
            v580.yaw_mode = v585:combo(v8.icon_title("list", "Mode", 3, 12), {
                [1] = "Default", 
                [2] = "Custom"
            });
            v580.yaw_type = v585:combo(v8.icon_title("list", "Type", 3, 12), {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Switch", 
                [4] = "Spin", 
                [5] = "Random", 
                [6] = "Center"
            });
            v580.yaw_angle = v585:slider(v8.icon_title("chart-line-up", "Angle", 3, 12), -180, 180, 0, 1, "\194\176");
            v580.yaw_angle_from = v585:slider(v8.icon_title("arrow-left-to-line", "Angle From", 4, 13), -180, 180, 0, 1, "\194\176");
            v580.yaw_angle_to = v585:slider(v8.icon_title("arrow-right-to-line", "Angle To", 4, 13), -180, 180, 0, 1, "\194\176");
            v580.yaw_angle_delay = v585:slider(v8.icon_title("gauge-simple-max", "Delay", 3, 11), 1, 8, 1, nil, function(v593)
                if v593 == 1 then
                    return "Off";
                else
                    return v593 .. "t";
                end;
            end);
            v580.yaw_angle_speed = v585:slider(v8.icon_title("gauge-simple-max", "Speed", 3, 11), 2, 20, 1, 0.5);
            v580.yaw_offset = v585:slider(v8.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "\194\176");
            v580.yaw_offset_default = v585:slider(v8.icon_title("chart-line-up", "Offset##DEFAULT", 3, 11), 0, 180, 90, 1, "\194\176");
            v589 = nil;
            local function v596(v594)
                -- upvalues: v580 (ref)
                local v595 = v594:get();
                v580.yaw_type:visibility(true);
                v580.yaw_angle:visibility(v595 == "Static" or v595 == "Random");
                v580.yaw_offset:visibility(v595 == "Center");
                v580.yaw_offset_default:visibility(false);
                v580.yaw_angle_from:visibility(v595 == "Switch" or v595 == "Spin");
                v580.yaw_angle_to:visibility(v595 == "Switch" or v595 == "Spin");
                v580.yaw_angle_delay:visibility(v595 == "Switch");
                v580.yaw_angle_speed:visibility(v595 == "Spin");
            end;
            do
                local l_v596_0 = v596;
                local function v601()
                    -- upvalues: v580 (ref), l_v596_0 (ref)
                    local v598 = v580.yaw_mode:get();
                    local v599 = v598 == "Default";
                    local v600 = v598 == "Custom";
                    if v600 then
                        v580.yaw_type:set_callback(l_v596_0, true);
                    else
                        v580.yaw_type:unset_callback(l_v596_0);
                    end;
                    if not v600 then
                        v580.yaw_type:visibility(not v599);
                        v580.yaw_angle:visibility(not v599);
                        v580.yaw_offset:visibility(not v599);
                        v580.yaw_offset_default:visibility(true);
                        v580.yaw_angle_from:visibility(not v599);
                        v580.yaw_angle_to:visibility(not v599);
                        v580.yaw_angle_delay:visibility(not v599);
                        v580.yaw_angle_speed:visibility(not v599);
                    end;
                end;
                v580.yaw_mode:set_callback(v601, true);
            end;
            v582 = nil;
            v585 = function(v602)
                -- upvalues: v575 (ref)
                local v603 = v602:get();
                v575.default.pitch:visibility(v603 == "Default");
                v575.default.yaw:visibility(v603 == "Default");
                v575.flick.pitch:visibility(v603 == "Flick");
                v575.flick.yaw:visibility(v603 == "Flick");
            end;
            v575.mode:set_callback(v585, true);
            return v575;
        end;
        do
            local l_l_conditions_0_0, l_v545_0, l_v572_0, l_v604_0 = l_conditions_0, v545, v572, v604;
            local function v613(v609)
                -- upvalues: l_v427_0 (ref), l_v426_1 (ref), v8 (ref), l_v572_0 (ref), l_v604_0 (ref)
                local v610 = {};
                local v611 = ui.create(l_v427_0, v609, 2);
                local v612 = ui.create(l_v427_0, "Defensive##" .. v609, 2);
                if v609 ~= "Shared" then
                    v610.enabled = l_v426_1.group_angles:switch(v8.icon_title("toggle-large-on", "Enabled##" .. v609, 2, 10));
                end;
                v610.angles = l_v572_0(v611, v609);
                v610.defensive = l_v604_0(v612, v609);
                v610.groups = {
                    angles = v611, 
                    defensive = v612
                };
                return v610;
            end;
            for v614 = 0, l_v545_0 do
                local v615 = l_l_conditions_0_0[v614];
                v542[v615] = v613(v615);
            end;
            local _ = nil;
            local function v624()
                -- upvalues: l_v429_2 (ref), l_v545_0 (ref), l_l_conditions_0_0 (ref), v542 (ref)
                local v617 = l_v429_2.select:get();
                for v618 = 0, l_v545_0 do
                    local v619 = l_l_conditions_0_0[v618];
                    local v620 = v542[v619];
                    if v620 ~= nil then
                        local v621 = v617 == v619;
                        if v620.enabled ~= nil then
                            v620.enabled:visibility(v621);
                            if not v620.enabled:get() then
                                v621 = false;
                            end;
                        end;
                        if v620.groups ~= nil then
                            for _, v623 in pairs(v620.groups) do
                                v623:visibility(v621);
                            end;
                        end;
                    end;
                end;
            end;
            for v625 = 0, l_v545_0 do
                local v626 = v542[l_l_conditions_0_0[v625]];
                if v626 ~= nil and v626.enabled ~= nil then
                    v626.enabled:set_callback(v624);
                end;
            end;
            l_v429_2.select:set_callback(v624, true);
        end;
    end;
end;
v338 = {};
v339 = 0;
l_match_0 = 0;
v338.is_onground = false;
v338.is_moving = false;
v338.is_crouched = false;
v338.velocity2d = 0;
v338.duck_amount = 0;
v338.eye_position = vector();
v338.team_num = 0;
v338.sent_packets = 0;
v426 = function(v627)
    -- upvalues: v8 (ref)
    local v628 = false;
    local v629 = false;
    local l_m_vecVelocity_0 = v627.m_vecVelocity;
    local v631 = v627:get_hitbox_position(0);
    local v632 = v627:get_eye_position();
    local v633 = v8.extrapolate(v632, l_m_vecVelocity_0, 14);
    local v634 = entity.get_players(true);
    for v635 = 1, #v634 do
        local v636 = v634[v635];
        if v636:is_enemy() and v636:is_alive() then
            local v637 = v636:get_eye_position();
            local v638 = v636:get_hitbox_position(0);
            local v639 = v8.extrapolate(v638, l_m_vecVelocity_0, 4);
            local v640 = utils.trace_bullet(v627, v633, v639);
            local v641 = utils.trace_bullet(v636, v637, v631);
            if v640 ~= nil and v640 > 0 then
                v628 = true;
            end;
            if v641 ~= nil and v641 > 0 then
                v629 = true;
            end;
            if v628 and v629 then
                break;
            end;
        end;
    end;
    return v628, v629;
end;
do
    local l_v339_2, l_l_match_0_3, l_v426_2 = v339, l_match_0, v426;
    v427 = function(v645)
        -- upvalues: l_v426_2 (ref), l_v339_2 (ref), v338 (ref)
        local v646 = entity.get_local_player();
        if v646 == nil then
            return;
        else
            local v647, v648 = l_v426_2(v646);
            l_v339_2 = v646.m_fFlags;
            v338.velocity2d = v646.m_vecVelocity:length2d();
            v338.is_peeking = v647;
            v338.is_vulnerable = v648;
            if v645.choked_commands == 0 then
                v338.duck_amount = v646.m_flDuckAmount;
                v338.eye_position = v646:get_eye_position();
                v338.sent_packets = v338.sent_packets + 1;
            end;
            v338.is_moving = v338.velocity2d > 3.63;
            v338.is_crouched = v338.duck_amount > 0;
            v338.team_num = v646.m_iTeamNum;
            return;
        end;
    end;
    v428 = function(_)
        -- upvalues: l_l_match_0_3 (ref), v338 (ref), l_v339_2 (ref)
        local v650 = entity.get_local_player();
        if v650 == nil then
            return;
        else
            l_l_match_0_3 = v650.m_fFlags;
            v338.is_onground = bit.band(l_v339_2, 1) == 1 and bit.band(l_l_match_0_3, 1) == 1;
            return;
        end;
    end;
    events.createmove(v427);
    events.createmove_run(v428);
end;
v339 = {};
l_match_0 = 0;
v339.max_ticks = 0;
v339.ticks = 0;
do
    local l_l_match_0_4, l_v426_3 = l_match_0, v426;
    l_v426_3 = function(v653)
        -- upvalues: l_l_match_0_4 (ref), v339 (ref)
        local l_m_nTickBase_0 = v653.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_l_match_0_4) > 64 then
            l_l_match_0_4 = 0;
        end;
        local v655 = 0;
        if l_l_match_0_4 < l_m_nTickBase_0 then
            l_l_match_0_4 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_l_match_0_4 then
            v655 = math.min(14, math.max(0, l_l_match_0_4 - l_m_nTickBase_0 - 1));
        end;
        if v655 > 0 then
            if v339.max_ticks == 0 then
                v339.max_ticks = v655;
            end;
            v339.ticks = v655;
        else
            v339.ticks = 0;
            v339.max_ticks = 0;
        end;
    end;
    v427 = function()
        -- upvalues: l_v426_3 (ref)
        local v656 = entity.get_local_player();
        if v656 == nil then
            return;
        else
            l_v426_3(v656);
            return;
        end;
    end;
    events.createmove(v427);
end;
l_match_0 = {};
v426 = {};
v427 = 0;
do
    local l_v426_4, l_v427_1, l_v428_2, l_v429_3, l_v430_3, l_v431_3, l_v432_3 = v426, v427, v428, v429, v430, v431, v432;
    l_v428_2 = function(v664)
        -- upvalues: l_v427_1 (ref), l_v426_4 (ref)
        l_v427_1 = l_v427_1 + 1;
        l_v426_4[l_v427_1] = v664;
    end;
    l_v429_3 = function()
        -- upvalues: l_v427_1 (ref), l_v426_4 (ref)
        for v665 = 1, l_v427_1 do
            l_v426_4[v665] = nil;
        end;
        l_v427_1 = 0;
    end;
    l_v430_3 = function()
        -- upvalues: v338 (ref), l_v428_2 (ref), v7 (ref)
        if not v338.is_onground then
            return;
        elseif v338.is_moving then
            l_v428_2("Moving");
            if v338.is_crouched then
                return;
            else
                if v7.antiaim.misc.slow_walk:get() then
                    l_v428_2("Slow Walk");
                end;
                return;
            end;
        else
            l_v428_2("Standing");
            return;
        end;
    end;
    l_v431_3 = function()
        -- upvalues: v338 (ref), l_v428_2 (ref)
        if not v338.is_crouched then
            return;
        else
            l_v428_2("Crouching");
            if v338.is_moving then
                l_v428_2("Crouching & Move");
            end;
            return;
        end;
    end;
    l_v432_3 = function()
        -- upvalues: v338 (ref), l_v428_2 (ref)
        if v338.is_onground then
            return;
        else
            l_v428_2("Air");
            if v338.is_crouched then
                l_v428_2("Air & Crouched");
            end;
            return;
        end;
    end;
    l_match_0.get = function()
        -- upvalues: l_v426_4 (ref)
        return l_v426_4;
    end;
    v488 = function()
        -- upvalues: l_v429_3 (ref), l_v430_3 (ref), l_v431_3 (ref), l_v432_3 (ref)
        l_v429_3();
        l_v430_3();
        l_v431_3();
        l_v432_3();
    end;
    events.createmove(v488);
end;
v426 = {};
v427 = function(v666)
    if v666 == nil then
        return nil;
    else
        local v667 = v666:get_weapon_info();
        if not v667 then
            return nil;
        else
            local l_weapon_type_0 = v667.weapon_type;
            local v669 = v666:get_weapon_index();
            if l_weapon_type_0 == 0 then
                return "Knife / Taser";
            elseif l_weapon_type_0 == 1 then
                if v669 == 1 or v669 == 64 then
                    return "R8 / Deagle";
                else
                    return "Other";
                end;
            elseif l_weapon_type_0 == 5 then
                if v669 == 40 then
                    return "Scout";
                elseif v669 == 9 then
                    return "AWP";
                else
                    return "Autosnipers";
                end;
            elseif l_weapon_type_0 ~= 1 or l_weapon_type_0 ~= 5 then
                return "Other";
            else
                return nil;
            end;
        end;
    end;
end;
v428 = {};
v429 = v337.exploits.fakelag;
v430 = {
    [1] = 13.4, 
    [2] = 0.7, 
    [3] = 28.3
};
v431 = nil;
v432 = function(v670)
    -- upvalues: v7 (ref)
    local v671 = entity.get_local_player();
    if v671 == nil then
        return;
    elseif not v7.antiaim.misc.fake_duck:get() then
        return;
    elseif v671.m_vecVelocity:length2dsqr() < 100 then
        return;
    else
        local v672 = vector(v670.forwardmove, v670.sidemove);
        v672:normalize();
        v670.forwardmove = v672.x * 170;
        v670.sidemove = v672.y * 170;
        return;
    end;
end;
v488 = nil;
do
    local l_v432_4 = v432;
    v509 = function(v674)
        -- upvalues: l_v432_4 (ref)
        events.createmove_run(l_v432_4, v674:get());
    end;
    v429.unlock_fd:set_callback(v509, true);
end;
v432 = nil;
v488 = cvar.sv_maxusrcmdprocessticks;
do
    local l_v429_4, l_v430_4 = v429, v430;
    do
        local l_v488_1, l_v509_0, l_v510_1, l_v511_1 = v488, v509, v510, v511;
        l_v509_0 = function()
            -- upvalues: v7 (ref), l_v488_1 (ref)
            v7.antiaim.fakelag.enabled:override();
            v7.antiaim.fakelag.limit:override();
            v7.antiaim.fakelag.variability:override();
            l_v488_1:int(16);
        end;
        l_v510_1 = function(v681)
            -- upvalues: l_v488_1 (ref), v7 (ref)
            l_v488_1:int(18);
            v7.antiaim.fakelag.enabled:override(true);
            v7.antiaim.fakelag.limit:override(v681);
        end;
        l_v511_1 = function()
            -- upvalues: l_v509_0 (ref)
            l_v509_0();
        end;
        local function v684(_)
            -- upvalues: l_v429_4 (ref), v7 (ref), l_v509_0 (ref), l_v430_4 (ref)
            if not l_v429_4.ignore_fd:get() and v7.antiaim.misc.fake_duck:get() then
                l_v509_0();
                return;
            else
                local v683 = l_v430_4[l_v429_4.stage:get()];
                if v683 == nil then
                    error("Timing is not provided, seems like stage not specified");
                end;
                if math.random(1, v683) == 1 then
                    v7.antiaim.fakelag.limit:override(3);
                    v7.antiaim.fakelag.variability:override(0);
                else
                    v7.antiaim.fakelag.limit:override(14);
                    v7.antiaim.fakelag.variability:override(4);
                end;
                v7.antiaim.fakelag.enabled:override(true);
                return;
            end;
        end;
        local _ = nil;
        local function v688(v686)
            -- upvalues: l_v509_0 (ref), l_v510_1 (ref), l_v429_4 (ref)
            local _ = false;
            if v686 == "Default" then
                l_v509_0();
                return;
            elseif v686 == "Neverlose+" then
                l_v509_0();
                l_v510_1(l_v429_4.limit:get());
                return;
            else
                return;
            end;
        end;
        do
            local l_v688_0 = v688;
            local function v690()
                -- upvalues: l_v688_0 (ref), l_v429_4 (ref)
                l_v688_0(l_v429_4.type:get());
            end;
            local function v695(v691)
                -- upvalues: l_v429_4 (ref), v690 (ref), v7 (ref), v684 (ref), l_v688_0 (ref), l_v511_1 (ref)
                local v692 = v691:get();
                local v693 = v692 ~= "Default";
                local v694 = v692 == "Fluctuate";
                if v693 then
                    l_v429_4.limit:set_callback(v690, true);
                    v7.antiaim.fakelag.enabled:set_callback(v690);
                    v7.antiaim.fakelag.limit:set_callback(v690);
                    v7.antiaim.fakelag.variability:set_callback(v690);
                else
                    l_v429_4.limit:unset_callback(v690);
                    v7.antiaim.fakelag.enabled:unset_callback(v690);
                    v7.antiaim.fakelag.limit:unset_callback(v690);
                    v7.antiaim.fakelag.variability:unset_callback(v690);
                end;
                events.createmove(v684, v694);
                l_v688_0(v692);
                events.shutdown(l_v511_1);
            end;
            l_v429_4.type:set_callback(v695, true);
        end;
    end;
end;
v429 = {};
v430 = v337.exploits.auto_hide_shots;
v431 = function()
    -- upvalues: v7 (ref)
    v7.ragebot.double_tap:override();
    v7.ragebot.hide_shots:override();
end;
v432 = function()
    -- upvalues: v7 (ref)
    v7.ragebot.double_tap:override(false);
    v7.ragebot.hide_shots:override(true);
end;
do
    local l_v427_2 = v427;
    do
        local l_v430_5, l_v431_4, l_v432_5, l_v488_2, l_v509_1 = v430, v431, v432, v488, v509;
        l_v488_2 = function()
            -- upvalues: l_v431_4 (ref)
            l_v431_4();
        end;
        l_v509_1 = function()
            -- upvalues: v7 (ref), l_match_0 (ref), l_v427_2 (ref), l_v430_5 (ref), l_v432_5 (ref), l_v431_4 (ref)
            if v7.antiaim.misc.fake_duck:get() and not v7.ragebot.double_tap:get() then
                return;
            else
                local v702 = entity.get_local_player();
                if v702 == nil then
                    return;
                else
                    local v703 = v702:get_player_weapon();
                    if v703 == nil then
                        return;
                    else
                        local v704 = l_match_0.get();
                        local v705 = v704[#v704];
                        local v706 = l_v427_2(v703);
                        if l_v430_5.states:get(v705) and l_v430_5.weapon:get(v706) then
                            l_v432_5();
                            return;
                        else
                            l_v431_4();
                            return;
                        end;
                    end;
                end;
            end;
        end;
        v510 = nil;
        v511 = function(v707)
            -- upvalues: l_v430_5 (ref), l_v431_4 (ref), l_v509_1 (ref)
            local l_v707_0 = v707;
            local v709 = unpack(l_v430_5.states:get());
            local v710 = l_v707_0 ~= nil and v709 ~= nil;
            if not v710 then
                l_v431_4();
            end;
            events.createmove(l_v509_1, v710);
        end;
        do
            local l_v511_2 = v511;
            local function v712()
                -- upvalues: l_v511_2 (ref), l_v430_5 (ref)
                l_v511_2(l_v430_5.weapon:get());
            end;
            local function v715(v713)
                -- upvalues: l_v430_5 (ref), v712 (ref), l_v511_2 (ref), l_v488_2 (ref)
                local v714 = unpack(v713:get());
                if v714 ~= nil then
                    l_v430_5.weapon:set_callback(v712, true);
                else
                    l_v430_5.weapon:unset_callback(v712, true);
                end;
                l_v511_2(v714);
                events.shutdown(l_v488_2);
            end;
            l_v430_5.states:set_callback(v715, true);
        end;
    end;
    v430 = {};
    v431 = v337.exploits.auto_double_tap;
    do
        local l_v431_5, l_v432_6 = v431, v432;
        l_v432_6 = function()
            -- upvalues: v7 (ref), l_v427_2 (ref), l_v431_5 (ref), l_match_0 (ref), v337 (ref)
            if v7.ragebot.hide_shots:get() then
                return;
            else
                local v718 = entity.get_local_player();
                if v718 == nil then
                    return;
                else
                    local v719 = v718:get_player_weapon();
                    if v719 == nil then
                        return;
                    else
                        local v720 = l_v427_2(v719);
                        local v721 = l_v431_5.type:get();
                        if not l_v431_5.weapon:get(v720) then
                            return;
                        else
                            local v722 = l_match_0.get();
                            local v723 = v722[#v722];
                            local v724 = v723 == "Air" or v723 == "Air & Crouched";
                            if v721 == "Air Lag" and v724 then
                                if globals.tickcount % (v337.exploits.auto_double_tap.delay:get() * 0.5) == 0 and entity.get_threat(true) then
                                    rage.exploit:force_teleport();
                                end;
                                if entity.get_threat() ~= nil then
                                    rage.exploit:force_charge();
                                end;
                                return;
                            elseif v721 == "Teleport" and v724 then
                                if entity.get_threat(true) then
                                    rage.exploit:force_teleport();
                                end;
                                return;
                            else
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v488 = nil;
        v509 = function(v725)
            -- upvalues: l_v431_5 (ref), l_v432_6 (ref)
            local v726 = unpack(l_v431_5.weapon:get());
            local v727 = v725 ~= "Disabled";
            local v728 = v726 ~= nil and v727;
            events.createmove(l_v432_6, v728);
        end;
        do
            local l_v509_2, l_v510_2 = v509, v510;
            l_v510_2 = function()
                -- upvalues: l_v509_2 (ref), l_v431_5 (ref)
                l_v509_2(l_v431_5.weapon:get());
            end;
            v511 = function(v731)
                -- upvalues: l_v431_5 (ref), l_v510_2 (ref), l_v509_2 (ref)
                local v732 = v731:get();
                if v732 ~= "Disabled" then
                    l_v431_5.weapon:set_callback(l_v510_2, true);
                else
                    l_v431_5.weapon:unset_callback(l_v510_2, true);
                end;
                l_v509_2(v732);
            end;
            l_v431_5.type:set_callback(v511, true);
        end;
    end;
end;
v427 = {};
v428 = {};
v429 = v337.ragebob.peek_bot;
v430 = bit.lshift(1, 0);
v431 = {
    gear = 10, 
    head = 1, 
    right_leg = 7, 
    left_leg = 6, 
    righ_arm = 5, 
    left_arm = 4, 
    stomach = 3, 
    chest = 2, 
    generic = 0
};
v432 = {
    left_calf = 10, 
    right_calf = 9, 
    left_thigh = 8, 
    right_thigh = 7, 
    upper_chest = 6, 
    lower_chest = 4, 
    pelvis = 2, 
    neck = 1, 
    stomach = 3, 
    chest = 5, 
    head = 0, 
    left_forearm = 18, 
    left_upper_arm = 17, 
    right_forearm = 16, 
    right_upper_arm = 15, 
    left_hand = 14, 
    right_hand = 13, 
    left_foot = 12, 
    right_foot = 11
};
v488 = {
    [v432.head] = v431.head, 
    [v432.chest] = v431.chest, 
    [v432.stomach] = v431.stomach, 
    [v432.left_thigh] = v431.left_leg, 
    [v432.right_thigh] = v431.right_leg, 
    [v432.left_foot] = v431.left_leg, 
    [v432.right_foot] = v431.right_leg, 
    [v432.left_upper_arm] = v431.left_arm, 
    [v432.right_upper_arm] = v431.righ_arm
};
v509 = nil;
v510 = 0;
v511 = nil;
local v733 = nil;
local v734 = nil;
local v735 = nil;
local v736 = l_smoothy_0.new(0);
do
    local l_v429_5, l_v430_6, l_v431_6, l_v432_7, l_v488_3, l_v509_3, l_v510_3, l_v511_3, l_v733_0, l_v734_0, l_v735_0, l_v736_0 = v429, v430, v431, v432, v488, v509, v510, v511, v733, v734, v735, v736;
    local function v749()
        -- upvalues: l_v509_3 (ref), l_v510_3 (ref), l_v511_3 (ref)
        l_v509_3 = nil;
        l_v510_3 = 0;
        l_v511_3 = nil;
    end;
    local function v750()
        -- upvalues: v7 (ref)
        v7.ragebot.double_tap:override();
        v7.ragebot.peek_assist_retreat:override();
        v7.ragebot.hitchance:override();
    end;
    local function v753()
        -- upvalues: l_v429_5 (ref)
        local v751 = l_v429_5.hitchance:get();
        local v752 = 0;
        if v751 > 0 then
            v752 = l_v429_5.hitchance:get();
        end;
        return v752;
    end;
    local function v755()
        -- upvalues: v753 (ref), v7 (ref)
        local v754 = v753();
        v7.ragebot.peek_assist_retreat:override("On Shot");
        v7.ragebot.hitchance:override(v754);
    end;
    local function v757(v756)
        -- upvalues: l_v431_6 (ref)
        if v756 == l_v431_6.head then
            return 4;
        elseif v756 == l_v431_6.stomach then
            return 1.25;
        elseif v756 == l_v431_6.left_leg then
            return 0.75;
        elseif v756 == l_v431_6.right_leg then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v762(v758, v759, v760, v761)
        -- upvalues: v757 (ref), l_v431_6 (ref)
        v759 = v759 * v757(v760);
        if v758.m_ArmorValue > 0 then
            if v760 == l_v431_6.head then
                if v758.m_bHasHelmet then
                    v759 = v759 * (v761 * 0.5);
                end;
            else
                v759 = v759 * (v761 * 0.5);
            end;
        end;
        return v759;
    end;
    local function v774(v763, v764, v765, v766, v767)
        -- upvalues: v762 (ref)
        local v768 = v764 - v763;
        local l_damage_0 = v767.damage;
        local l_armor_ratio_0 = v767.armor_ratio;
        local l_range_0 = v767.range;
        local l_range_modifier_0 = v767.range_modifier;
        local v773 = math.min(l_range_0, v768:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v773 * 0.002);
        return (v762(v765, l_damage_0, v766, l_armor_ratio_0));
    end;
    local function v776(v775)
        -- upvalues: l_v429_5 (ref)
        return l_v429_5.hitboxes:get(v775);
    end;
    local function v777()
        -- upvalues: l_v429_5 (ref)
        return l_v429_5.simulation:get() * 0.01;
    end;
    local function v778()
        -- upvalues: l_v429_5 (ref)
        return l_v429_5.rate_limit:get() * 0.01;
    end;
    local function v779()
        -- upvalues: v7 (ref)
        return v7.ragebot.minimum_damage:get();
    end;
    local function v781()
        -- upvalues: v776 (ref), l_v432_7 (ref)
        local v780 = {};
        if v776("Head") then
            table.insert(v780, l_v432_7.head);
        end;
        if v776("Chest") then
            table.insert(v780, l_v432_7.chest);
        end;
        if v776("Stomach") then
            table.insert(v780, l_v432_7.stomach);
        end;
        if v776("Arms") then
            table.insert(v780, l_v432_7.left_upper_arm);
            table.insert(v780, l_v432_7.right_upper_arm);
        end;
        if v776("Legs") then
            table.insert(v780, l_v432_7.left_thigh);
            table.insert(v780, l_v432_7.right_thigh);
            table.insert(v780, l_v432_7.left_calf);
            table.insert(v780, l_v432_7.right_calf);
        end;
        return v780;
    end;
    local function v783(v782)
        -- upvalues: l_v488_3 (ref), l_v431_6 (ref)
        return l_v488_3[v782] or l_v431_6.generic;
    end;
    local function v785(v784)
        return v784[0];
    end;
    local function v790(v786, v787)
        local v788 = v786:get_weapon_index();
        local l_weapon_type_1 = v787.weapon_type;
        if v788 == 1 then
            return "Deagle";
        elseif v788 == 40 then
            return "Scout";
        elseif l_weapon_type_1 == 1 then
            return "Pistols";
        else
            return nil;
        end;
    end;
    local function v807(v791, v792, v793, v794, v795)
        -- upvalues: v783 (ref), v774 (ref)
        local v796 = {};
        local v797 = v792:get_eye_position();
        local v798 = v793:get_weapon_info();
        local l_m_iHealth_0 = v794.m_iHealth;
        for v800 = 1, #v791 do
            local v801 = v791[v800];
            local v802 = v783(v801);
            local v803 = v794:get_hitbox_position(v801);
            local v804 = v774(v797, v803, v794, v802, v798);
            local v805 = v804 < v795;
            local v806 = v804 < l_m_iHealth_0;
            if not v805 or not v806 then
                table.insert(v796, {
                    index = v801, 
                    pos = v803
                });
            end;
        end;
        return v796;
    end;
    local function v811(v808)
        -- upvalues: v785 (ref)
        if v808 == nil then
            return false;
        else
            local l_status_12, l_result_12 = pcall(v785, v808);
            if not l_status_12 or l_result_12 == nil then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v813(v812)
        -- upvalues: v811 (ref)
        return v811(v812.target);
    end;
    local function v815(v814)
        return not v814.in_forward and not v814.in_back and not v814.in_moveleft and not v814.in_moveright;
    end;
    local function v817(v816)
        -- upvalues: l_v429_5 (ref)
        return l_v429_5.weapons:get(v816);
    end;
    local function v821(v818, v819, v820)
        if v818 == nil or v819 == nil then
            return false;
        elseif v820.max_clip1 == 0 or v819.m_iClip1 == 0 then
            return false;
        elseif globals.curtime < v818.m_flNextAttack then
            return false;
        elseif globals.curtime < v819.m_flNextPrimaryAttack then
            return false;
        else
            return true;
        end;
    end;
    local function v822()
        -- upvalues: l_v429_5 (ref)
        if l_v429_5.override_color:get() then
            return l_v429_5.color:get();
        else
            return ui.get_style("Link Active");
        end;
    end;
    local function v823()
        return true;
    end;
    local function v826(v824, v825)
        return {
            ctx = v824, 
            target = v825, 
            hitbox = nil, 
            simtime = 0, 
            retreat = -1, 
            teleport = 0
        };
    end;
    local function v828(v827)
        return v827:simulate_movement(nil, vector(), 1);
    end;
    local function v835(v829, v830, v831)
        local v833, v834 = utils.trace_bullet(v829, v830, v831, function(v832)
            -- upvalues: v829 (ref)
            return v832 ~= v829 and v832:is_enemy();
        end);
        return v833, v834;
    end;
    local function v848(v836, v837, v838, v839, v840)
        -- upvalues: v835 (ref)
        local l_m_iHealth_1 = v837.m_iHealth;
        for v842 = 1, #v839 do
            local v843 = v839[v842];
            local v844, _ = v835(v836, v838, v843.pos);
            local v846 = v840 <= v844;
            local v847 = l_m_iHealth_1 <= v844;
            if v846 or v847 then
                return v844, v843;
            end;
        end;
        return nil, nil;
    end;
    local function v857(v849, v850, v851, v852, v853)
        -- upvalues: v848 (ref)
        local v854 = v849.origin + vector(0, 0, v849.view_offset);
        local v855, v856 = v848(v850, v851, v854, v852, v853);
        return v849, v855, v856;
    end;
    local function v868(v858, v859, v860, v861, v862, v863, v864)
        -- upvalues: l_v430_6 (ref), v857 (ref)
        v858.view_angles.y = v862;
        v861:think(1);
        if bit.band(v861.flags, l_v430_6) == 0 then
            return nil, false;
        else
            local _, v866, v867 = v857(v861, v859, v860, v863, v864);
            if v866 ~= nil then
                v861:think(1);
            end;
            return v861, v866, v867;
        end;
    end;
    local function v908(v869, v870, v871)
        -- upvalues: v823 (ref), v778 (ref), v779 (ref), v781 (ref), l_v509_3 (ref), v813 (ref), v807 (ref), v857 (ref), l_v510_3 (ref), v815 (ref), l_v430_6 (ref), v848 (ref), v828 (ref), l_v733_0 (ref), l_v734_0 (ref), l_v735_0 (ref), v868 (ref), v826 (ref)
        if not v823() then
            return false;
        else
            local l_frametime_1 = globals.frametime;
            local v873 = v778();
            local v874 = v779();
            local v875 = v781();
            if l_v509_3 ~= nil and v813(l_v509_3) then
                local l_ctx_0 = l_v509_3.ctx;
                local l_target_0 = l_v509_3.target;
                local l_m_iHealth_2 = l_target_0.m_iHealth;
                if v874 >= 100 then
                    v874 = v874 + l_m_iHealth_2 - 100;
                end;
                local v879 = v807(v875, v870, v871, l_target_0, v874);
                if l_ctx_0 ~= nil then
                    local _, v881, v882 = v857(l_ctx_0, v870, l_target_0, v879, v874);
                    if v881 ~= nil then
                        l_v509_3.simtime = 0;
                    end;
                    if l_v509_3.hitbox ~= nil then
                        l_v509_3.hitbox = v882;
                    end;
                    l_v509_3.simtime = l_v509_3.simtime + l_frametime_1;
                end;
                return true;
            else
                if v873 > 0 then
                    if l_v510_3 > 0 then
                        l_v510_3 = l_v510_3 - l_frametime_1;
                        return false;
                    else
                        l_v510_3 = v873;
                    end;
                end;
                if not v815(v869) then
                    return false;
                else
                    local l_m_fFlags_0 = v870.m_fFlags;
                    if bit.band(l_m_fFlags_0, l_v430_6) == 0 then
                        return false;
                    elseif v870.m_vecVelocity:length2dsqr() > 6400 then
                        return false;
                    else
                        local v884 = entity.get_threat();
                        if v884 == nil or v884:is_dormant() then
                            return false;
                        else
                            local l_m_iHealth_3 = v884.m_iHealth;
                            if v874 >= 100 then
                                v874 = v874 + l_m_iHealth_3 - 100;
                            end;
                            local v886 = v807(v875, v870, v871, v884, v874);
                            if v848(v870, v884, v870:get_eye_position(), v886, v874) then
                                return false;
                            else
                                local v887 = nil;
                                local v888 = nil;
                                local v889 = v870:get_origin();
                                local v890 = (v884:get_origin() - v889):angles().y + 180;
                                v887 = v890 - 90;
                                v888 = v890 + 90;
                                v889 = v869.view_angles:clone();
                                local l_forwardmove_0 = v869.forwardmove;
                                local l_sidemove_0 = v869.sidemove;
                                local l_in_duck_0 = v869.in_duck;
                                v890 = v869.in_jump;
                                local l_in_speed_0 = v869.in_speed;
                                v869.forwardmove = 450;
                                v869.sidemove = 0;
                                v869.in_duck = false;
                                v869.in_jump = false;
                                v869.in_speed = false;
                                local v895 = v828(v870);
                                local v896 = v828(v870);
                                local v897 = 0;
                                local v898 = 0;
                                local v899 = 20;
                                local v900 = math.floor(v899 / 2);
                                l_v733_0 = {};
                                l_v734_0 = {};
                                l_v735_0 = v870:get_origin() + vector(0, 0, 64);
                                for v901 = 1, v899 do
                                    if v897 ~= -1 then
                                        v897 = v901;
                                        local v902, v903, v904 = v868(v869, v870, v884, v895, v887, v886, v874);
                                        if v901 - 1 == v900 then
                                            table.insert(l_v733_0, v895.origin + vector(0, 0, v895.view_offset));
                                        end;
                                        if v902 == nil then
                                            v897 = -1;
                                        end;
                                        if v903 ~= nil then
                                            l_v509_3 = v826(v902, v884);
                                            if v904 ~= nil then
                                                l_v509_3.hitbox = v904;
                                                break;
                                            else
                                                break;
                                            end;
                                        end;
                                    end;
                                    if v898 ~= -1 then
                                        v898 = v901;
                                        local v905, v906, v907 = v868(v869, v870, v884, v896, v888, v886, v874);
                                        if v901 == v900 then
                                            table.insert(l_v734_0, v896.origin + vector(0, 0, v896.view_offset));
                                        end;
                                        if v905 == nil then
                                            v898 = -1;
                                        end;
                                        if v906 ~= nil then
                                            l_v509_3 = v826(v905, v884);
                                            if v907 ~= nil then
                                                l_v509_3.hitbox = v907;
                                                break;
                                            else
                                                break;
                                            end;
                                        end;
                                    end;
                                end;
                                if v895 ~= nil then
                                    table.insert(l_v733_0, v895.origin + vector(0, 0, v895.view_offset));
                                end;
                                if v896 ~= nil then
                                    table.insert(l_v734_0, v896.origin + vector(0, 0, v896.view_offset));
                                end;
                                v869.view_angles.y = v889.y;
                                v869.forwardmove = l_forwardmove_0;
                                v869.sidemove = l_sidemove_0;
                                v869.in_duck = l_in_duck_0;
                                v869.in_jump = v890;
                                v869.in_speed = l_in_speed_0;
                                return l_v509_3 ~= nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v916(v909, v910, v911)
        local v912 = v911 - v910:get_origin();
        local v913 = v912:length2dsqr();
        if v913 < 25 then
            local l_m_vecVelocity_1 = v910.m_vecVelocity;
            local v915 = l_m_vecVelocity_1:length();
            v909.move_yaw = l_m_vecVelocity_1:angles().y;
            v909.forwardmove = -v915;
            v909.sidemove = 0;
            return true, v913;
        else
            v909.move_yaw = v912:angles().y;
            v909.forwardmove = 450;
            v909.sidemove = 0;
            return false, v913;
        end;
    end;
    local function v918(v917)
        v917.in_duck = false;
        v917.in_jump = false;
        v917.in_speed = false;
        v917.in_forward = true;
        v917.in_back = false;
        v917.in_moveleft = false;
        v917.in_moveright = false;
    end;
    local function v939(v919, v920, v921, v922)
        -- upvalues: v821 (ref), v908 (ref), l_v509_3 (ref), v777 (ref), l_v511_3 (ref), v916 (ref), v918 (ref), v755 (ref), v822 (ref), v813 (ref), l_bxor_0 (ref), v749 (ref), v7 (ref), v750 (ref)
        local v923 = v821(v920, v921, v922);
        local v924 = v908(v919, v920, v921);
        if l_v509_3 == nil then
            return;
        else
            local l_ctx_1 = l_v509_3.ctx;
            if l_ctx_1 == nil then
                return;
            else
                if v777() < l_v509_3.simtime then
                    v924 = false;
                end;
                if v922.weapon_type == 5 and not v920.m_bIsScoped then
                    v924 = false;
                end;
                if l_v509_3.retreat <= 0 and v924 then
                    if l_v511_3 == nil then
                        local v926 = v920:get_origin();
                        local v927 = l_ctx_1.origin - v926;
                        v927:normalize();
                        local v928 = l_ctx_1.origin - v927 * 25;
                        l_v511_3 = utils.trace_hull(v926, v928, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, v920, 33636363, 0).end_pos;
                    end;
                    local v929, _ = v916(v919, v920, l_ctx_1.origin);
                    v918(v919);
                    v755();
                    l_v509_3.retreat = 0;
                    if v929 then
                        l_v509_3.retreat = 1;
                    end;
                    local v931 = v822();
                    local v932 = globals.tickinterval * 2;
                    if v813(l_v509_3) and l_v509_3.hitbox ~= nil then
                        l_bxor_0.line(l_ctx_1.origin + v920.m_vecViewOffset, l_v509_3.target:get_hitbox_position(l_v509_3.hitbox.index), v931, true, v932);
                    end;
                    l_bxor_0.box_new(l_ctx_1.origin, l_ctx_1.obb_mins, l_ctx_1.obb_maxs, vector(), color(0, 0, 0, 0), v931, v932);
                    return;
                elseif not v923 then
                    v749();
                    return;
                elseif l_v509_3.retreat == -1 then
                    return;
                else
                    l_v509_3.retreat = l_v509_3.retreat + 1;
                    local v933, _ = v916(v919, v920, l_v511_3);
                    local v935 = v920:get_origin();
                    local l_m_vecVelocity_2 = v920.m_vecVelocity;
                    local v937 = (l_v511_3 - v935):angles() - l_m_vecVelocity_2:angles();
                    local v938 = l_m_vecVelocity_2:length2dsqr();
                    v918(v919);
                    v755();
                    if v938 > 1600 and math.abs(v937.y) < 20 then
                        rage.exploit:force_teleport();
                        v7.ragebot.double_tap:override(false);
                    end;
                    if v923 and v933 then
                        v749();
                        v750();
                    end;
                    return;
                end;
            end;
        end;
    end;
    local function v945(v940, v941, v942)
        local v943 = render.world_to_screen(v940);
        local v944 = render.world_to_screen(v941);
        if v943 == nil or v944 == nil then
            return;
        else
            render.line(v943, v944, v942);
            return;
        end;
    end;
    local function v952(v946, v947, v948, v949, v950)
        local v951 = render.world_to_screen(v946);
        if v951 == nil then
            return;
        else
            render.circle(v951, v947, v948, v949, v950);
            return;
        end;
    end;
    local function v970(v953)
        -- upvalues: l_v735_0 (ref), l_v736_0 (ref), v822 (ref), l_v733_0 (ref), v945 (ref), v952 (ref), l_v734_0 (ref)
        if entity.get_local_player() == nil or l_v735_0 == nil then
            return;
        else
            local v954 = l_v736_0(0.05, v953);
            if v954 <= 0 then
                return;
            else
                local v955 = vector(0, 0, -4 * (1 - v954));
                local v956 = l_v735_0 + v955;
                local v957 = color(255, 255, 255, 100);
                local v958 = v822();
                v957.a = v957.a * v954;
                v958.a = v958.a * v954;
                local v959 = 2.5;
                if l_v733_0 ~= nil then
                    local l_v956_0 = v956;
                    for v961 = 1, #l_v733_0 do
                        local v962 = l_v733_0[v961] + v955;
                        v945(l_v956_0, v962, v957);
                        l_v956_0 = v962;
                    end;
                    for v963 = 1, #l_v733_0 do
                        local v964 = l_v733_0[v963] + v955;
                        v952(v964, v958, v959, 0, 1);
                    end;
                end;
                if l_v734_0 ~= nil then
                    local l_v956_1 = v956;
                    for v966 = 1, #l_v734_0 do
                        local v967 = l_v734_0[v966] + v955;
                        v945(l_v956_1, v967, v957);
                        l_v956_1 = v967;
                    end;
                    for v968 = 1, #l_v734_0 do
                        local v969 = l_v734_0[v968] + v955;
                        v952(v969, v958, v959, 0, 1);
                    end;
                end;
                v952(v956, v958, v959, 0, 1);
                return;
            end;
        end;
    end;
    local function v971()
        -- upvalues: l_v509_3 (ref), v813 (ref), v822 (ref)
        if l_v509_3 == nil or not v813(l_v509_3.target) then
            return false;
        elseif l_v509_3.hitbox == nil then
            return false;
        else
            render.highlight_hitbox(l_v509_3.target, l_v509_3.hitbox.index, v822());
            return true;
        end;
    end;
    local function v977(v972)
        -- upvalues: v7 (ref), v750 (ref), v749 (ref), v790 (ref), v817 (ref), v939 (ref)
        if not v7.ragebot.peek_assist:get() then
            v750();
            v749();
            return;
        else
            local v973 = entity.get_local_player();
            if v973 == nil then
                return;
            else
                local v974 = v973:get_player_weapon();
                if v974 == nil then
                    return;
                else
                    local v975 = v974:get_weapon_info();
                    if v975 == nil then
                        return;
                    else
                        local v976 = v790(v974, v975);
                        if not v817(v976) then
                            v749();
                            v750();
                            return;
                        else
                            v939(v972, v973, v974, v975);
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v979()
        -- upvalues: v7 (ref), v971 (ref), l_v511_3 (ref), v970 (ref)
        local v978 = false;
        if v7.ragebot.peek_assist:get() then
            v978 = not v971();
        end;
        if l_v511_3 ~= nil then
            v978 = false;
        end;
        v970(v978);
    end;
    local function v980()
        -- upvalues: l_v509_3 (ref), v749 (ref), v750 (ref)
        if l_v509_3 == nil then
            return nil;
        else
            v749();
            v750();
            return;
        end;
    end;
    local _ = nil;
    local function v984(v982)
        -- upvalues: v750 (ref), v749 (ref), v979 (ref), v980 (ref), v977 (ref)
        local v983 = v982:get();
        if not v983 then
            v750();
            v749();
        end;
        events.render(v979, v983);
        events.aim_fire(v980, v983);
        events.createmove(v977, v983);
    end;
    l_v429_5.enabled:set_callback(v984, true);
end;
v429 = {};
v430 = v337.ragebob.dormant_aimbot;
v431 = nil;
v432 = nil;
v488 = nil;
v509 = nil;
v510 = nil;
v511 = false;
v733 = false;
v734 = 1;
v735 = 0;
v736 = {};
local v985 = {
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
local v986 = {
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
local function v990(v987, v988)
    for v989 = 1, #v987 do
        if v987[v989] == v988 then
            return true;
        end;
    end;
    return false;
end;
local function v992(v991)
    return v991 >= 1 and v991 <= 6;
end;
local function v997()
    local v993 = {};
    local v994 = entity.get_player_resource();
    for v995 = 1, globals.max_players do
        local v996 = entity.get(v995);
        if v996 ~= nil and v994.m_bConnected[v995] and v996:is_enemy() and v996:is_dormant() then
            table.insert(v993, v996);
        end;
    end;
    return v993;
end;
local function v1004(v998, v999, v1000)
    local v1001 = v998:to(v999):angles();
    local v1002 = math.rad(v1001.y + 90);
    local v1003 = vector(math.cos(v1002), math.sin(v1002), 0) * v1000;
    return {
        [1] = {
            text = "Middle", 
            vec = v999
        }, 
        [2] = {
            text = "Left", 
            vec = v999 + v1003
        }, 
        [3] = {
            text = "Right", 
            vec = v999 - v1003
        }
    };
end;
local function v1012(v1005, v1006, v1007, v1008)
    local v1009, v1010 = utils.trace_bullet(v1005, v1006, v1007, v1008);
    if v1010 ~= nil then
        local l_entity_0 = v1010.entity;
        if l_entity_0 == nil then
            return 0, v1010;
        elseif l_entity_0:is_player() and not l_entity_0:is_enemy() then
            return 0, v1010;
        end;
    end;
    return v1009, v1010;
end;
do
    local l_v430_7, l_v431_7, l_v432_8, l_v488_4, l_v509_4, l_v510_4, l_v511_4, l_v733_1, l_v734_1, l_v735_1, l_v736_1, l_v985_0, l_v986_0, l_v990_0, l_v992_0, l_v997_0, l_v1004_0, l_v1012_0 = v430, v431, v432, v488, v509, v510, v511, v733, v734, v735, v736, v985, v986, v990, v992, v997, v1004, v1012;
    local function v1033(v1031)
        -- upvalues: l_v430_7 (ref), l_v736_1 (ref)
        if not l_v430_7.enabled:get() then
            return;
        else
            local v1032 = entity.get_local_player();
            if v1032 == nil then
                return;
            elseif not v1032:is_alive() then
                return;
            elseif not l_v736_1[v1031:get_index()] then
                return;
            else
                return "DA";
            end;
        end;
    end;
    local function v1070(v1034)
        -- upvalues: v7 (ref), l_v735_1 (ref), l_v992_0 (ref), l_v997_0 (ref), l_v430_7 (ref), l_v734_1 (ref), l_v986_0 (ref), l_v990_0 (ref), l_v1004_0 (ref), l_v1012_0 (ref), l_v431_7 (ref), l_v488_4 (ref), l_v509_4 (ref), l_v432_8 (ref), l_v510_4 (ref), l_v733_1 (ref)
        v7.ragebot.dormant_aimbot:override(false);
        local v1035 = entity.get_local_player();
        local v1036 = v1035:get_player_weapon();
        if v1036 == nil then
            return;
        else
            local v1037 = v1036:get_weapon_info();
            if v1037 == nil then
                return;
            else
                local v1038 = v1036:get_inaccuracy();
                if v1038 == nil then
                    return;
                else
                    local l_tickcount_0 = globals.tickcount;
                    local v1040 = v1035:get_eye_position();
                    local l_current_0 = v1035:get_simulation_time().current;
                    local v1042 = bit.band(v1035.m_fFlags, bit.lshift(1, 0)) ~= 0;
                    if l_tickcount_0 < l_v735_1 then
                        return;
                    elseif v1034.in_jump and not v1042 then
                        return;
                    else
                        local l_weapon_type_2 = v1037.weapon_type;
                        if not l_v992_0(l_weapon_type_2) or v1036.m_iClip1 <= 0 then
                            return false;
                        else
                            local v1044 = l_v997_0();
                            local v1045 = l_v430_7.hitbox:get();
                            if l_tickcount_0 % #v1044 ~= 0 then
                                l_v734_1 = l_v734_1 + 1;
                            else
                                l_v734_1 = 1;
                            end;
                            local v1046 = v1044[l_v734_1];
                            if v1046 == nil then
                                return;
                            else
                                local v1047 = v1046:get_bbox();
                                local v1048 = v1046:get_origin();
                                local l_m_flDuckAmount_0 = v1046.m_flDuckAmount;
                                local v1050 = l_v430_7.accuracy:get();
                                local v1051 = l_v430_7.damage:get();
                                if v1051 == 0 then
                                    v1051 = v7.ragebot.minimum_damage:get();
                                end;
                                if v1051 > 100 then
                                    v1051 = v1051 - 100 + v1046.m_iHealth;
                                end;
                                local v1052 = {};
                                for v1053 = 1, #l_v986_0 do
                                    local v1054 = l_v986_0[v1053];
                                    local l_vec_0 = v1054.vec;
                                    local l_scale_0 = v1054.scale;
                                    local l_hitbox_0 = v1054.hitbox;
                                    if l_hitbox_0 == "Head" then
                                        l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                    end;
                                    if l_hitbox_0 == "Chest" then
                                        l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                    end;
                                    if #v1045 ~= 0 then
                                        if l_v990_0(v1045, l_hitbox_0) then
                                            table.insert(v1052, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    else
                                        table.insert(v1052, 1, {
                                            vec = l_vec_0, 
                                            scale = l_scale_0, 
                                            hitbox = l_hitbox_0
                                        });
                                    end;
                                end;
                                if not (v1037.is_revolver and not (v1036.m_flNextPrimaryAttack >= l_current_0) or math.max(v1035.m_flNextAttack, v1036.m_flNextPrimaryAttack, v1036.m_flNextSecondaryAttack) < l_current_0) then
                                    return;
                                else
                                    local v1058 = nil;
                                    local v1059 = nil;
                                    if math.floor(v1047.alpha * 100) + 5 <= v1050 then
                                        return;
                                    else
                                        for v1060 = 1, #v1052 do
                                            local v1061 = v1052[v1060];
                                            local v1062 = l_v1004_0(v1040, v1048 + v1061.vec, v1061.scale);
                                            for v1063 = 1, #v1062 do
                                                local v1064 = v1062[v1063];
                                                local l_vec_1 = v1064.vec;
                                                local v1067, v1068 = l_v1012_0(v1035, v1040, l_vec_1, function(v1066)
                                                    -- upvalues: v1046 (ref)
                                                    return v1066 == v1046;
                                                end);
                                                if (v1068 == nil or not v1068:is_visible()) and v1067 ~= 0 and v1051 < v1067 then
                                                    v1058 = l_vec_1;
                                                    v1059 = v1067;
                                                    l_v431_7 = v1046;
                                                    l_v488_4 = v1061.hitbox;
                                                    l_v509_4 = v1067;
                                                    l_v432_8 = v1064.text;
                                                    l_v510_4 = v1047.alpha;
                                                    break;
                                                end;
                                            end;
                                            if v1058 and v1059 then
                                                break;
                                            end;
                                        end;
                                        if not v1058 or not v1059 then
                                            return;
                                        else
                                            local v1069 = v1040:to(v1058):angles();
                                            v1034.block_movement = 1;
                                            if v1038 < 0.01 then
                                                v1034.view_angles = v1069;
                                                v1034.in_attack = true;
                                                l_v733_1 = true;
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
    local function v1071()
        -- upvalues: v7 (ref)
        v7.ragebot.dormant_aimbot:override();
    end;
    local function v1073(v1072)
        -- upvalues: l_v733_1 (ref), l_v511_4 (ref), l_v431_7 (ref), l_v488_4 (ref), l_v509_4 (ref), l_v432_8 (ref), l_v510_4 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v1072 (ref), l_v733_1 (ref), l_v511_4 (ref), l_v431_7 (ref), l_v488_4 (ref), l_v509_4 (ref), l_v432_8 (ref), l_v510_4 (ref)
            if entity.get(v1072.userid, true) == entity.get_local_player() then
                if l_v733_1 and not l_v511_4 then
                    events.dormant_miss:call({
                        userid = l_v431_7, 
                        aim_hitbox = l_v488_4, 
                        aim_damage = l_v509_4, 
                        aim_point = l_v432_8, 
                        accuracy = l_v510_4
                    });
                end;
                l_v511_4 = false;
                l_v733_1 = false;
                l_v431_7 = nil;
                l_v488_4 = nil;
                l_v509_4 = nil;
                l_v432_8 = nil;
                l_v510_4 = nil;
            end;
        end);
    end;
    local function v1079(v1074)
        -- upvalues: l_v733_1 (ref), l_v511_4 (ref), l_v985_0 (ref), l_v432_8 (ref), l_v488_4 (ref), l_v509_4 (ref)
        local v1075 = entity.get_local_player();
        local v1076 = entity.get(v1074.userid, true);
        local v1077 = entity.get(v1074.attacker, true);
        if v1076 == nil or v1077 ~= v1075 then
            return;
        else
            local v1078 = v1076:get_bbox();
            if v1078 == nil then
                return;
            else
                if v1076:is_dormant() and l_v733_1 == true then
                    l_v511_4 = true;
                    events.dormant_hit:call({
                        userid = v1076, 
                        attacker = v1077, 
                        health = v1074.health, 
                        armor = v1074.armor, 
                        weapon = v1074.weapon, 
                        dmg_health = v1074.dmg_health, 
                        dmg_armor = v1074.dmg_armor, 
                        hitgroup = v1074.hitgroup, 
                        accuracy = v1078.alpha, 
                        hitbox = l_v985_0[v1074.hitgroup], 
                        aim_point = l_v432_8, 
                        aim_hitbox = l_v488_4, 
                        aim_damage = l_v509_4
                    });
                end;
                return;
            end;
        end;
    end;
    local _ = nil;
    local function v1083(v1081)
        -- upvalues: v7 (ref), v1071 (ref), v1070 (ref), v1073 (ref), v1079 (ref)
        local v1082 = v1081:get();
        if not v1082 then
            v7.ragebot.dormant_aimbot:override();
        end;
        events.shutdown(v1071);
        events.createmove(v1070, v1082);
        events.weapon_fire(v1073, v1082);
        events.player_hurt(v1079, v1082);
    end;
    l_v430_7.enabled:set_callback(v1083, true);
    esp.enemy:new_text("Dormant Aimbot", "DA", v1033);
end;
v430 = {};
v431 = v337.ragebob.hitchance_modifiers;
v432 = 0.0254;
v488 = v431.weapon:list();
v509 = 0;
v510 = 0;
v511 = 0;
v733 = 0;
v734 = {};
for v1084 = 1, #v488 do
    v990 = v488[v1084];
    v734[v990] = {
        hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v990, "Hit Chance"), 
        auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", v990, "Auto Scope")
    };
end;
v735 = function(v1085)
    local v1086 = v1085:get_classname();
    if v1085:get_weapon_info().weapon_type == 5 then
        if v1086 == "CWeaponAWP" then
            return "AWP";
        elseif v1086 == "CWeaponSSG08" then
            return "SSG-08";
        else
            return "AutoSnipers";
        end;
    else
        return nil;
    end;
end;
do
    local l_v431_8, l_v432_9, l_v509_5, l_v510_5, l_v511_5, l_v733_2, l_v734_2, l_v735_2, l_v736_2, l_v985_1, l_v986_1, l_v990_1, l_v992_1, l_v997_1, l_v1004_1, l_v1012_1 = v431, v432, v509, v510, v511, v733, v734, v735, v736, v985, v986, v990, v992, v997, v1004, v1012;
    l_v736_2 = function(v1103, v1104, v1105)
        -- upvalues: l_v432_9 (ref)
        local v1106 = v1103:get_origin();
        return v1104:get_origin():dist(v1106) * l_v432_9 <= v1105;
    end;
    l_v985_1 = function(v1107, v1108, v1109)
        -- upvalues: l_v736_2 (ref)
        if v1107.m_bIsScoped then
            return false;
        elseif v1109 == 201 then
            return true;
        else
            return l_v736_2(v1107, v1108, v1109 * 0.1);
        end;
    end;
    l_v986_1 = function(v1110)
        -- upvalues: l_v511_5 (ref), l_v432_9 (ref), l_v733_2 (ref)
        l_v511_5 = v1110:get() * 0.1 / l_v432_9;
        l_v733_2 = 1.5;
    end;
    l_v990_1 = function()
        -- upvalues: l_v733_2 (ref), l_v509_5 (ref), v9 (ref), l_v510_5 (ref), l_v511_5 (ref)
        local l_frametime_2 = globals.frametime;
        l_v733_2 = math.max(l_v733_2 - l_frametime_2, 0);
        if l_v733_2 > 0 then
            l_v509_5 = v9.interp(l_v509_5, 1, 0.05);
            l_v510_5 = v9.interp(l_v510_5, l_v511_5, 0.05);
            return;
        else
            l_v509_5 = v9.interp(l_v509_5, 0, 0.05);
            return;
        end;
    end;
    l_v992_1 = function()
        -- upvalues: l_v509_5 (ref), l_v510_5 (ref)
        if l_v509_5 <= 0 then
            return;
        else
            local v1112 = entity.get_local_player();
            if v1112 == nil or not v1112:is_alive() then
                return;
            else
                local v1113 = color(255, 255, 255, 128 * l_v509_5);
                local v1114 = v1112:get_origin();
                render.circle_3d(v1114, v1113, l_v510_5, 0, 1, true);
                return;
            end;
        end;
    end;
    l_v997_1 = function()
        -- upvalues: l_v734_2 (ref)
        for _, v1116 in pairs(l_v734_2) do
            v1116.hit_chance:override();
        end;
    end;
    l_v1004_1 = function()
        -- upvalues: l_v734_2 (ref)
        for _, v1118 in pairs(l_v734_2) do
            v1118.auto_scope:override();
        end;
    end;
    l_v1012_1 = function()
        -- upvalues: l_v735_2 (ref), l_v734_2 (ref), l_v431_8 (ref), v338 (ref), l_v985_1 (ref)
        local v1119 = entity.get_local_player();
        if v1119 == nil or not v1119:is_alive() then
            return false, false;
        else
            local v1120 = entity.get_threat();
            if v1120 == nil or not v1120:is_alive() then
                return false, false;
            else
                local v1121 = v1119:get_player_weapon();
                if v1121 == nil then
                    return false, false;
                else
                    local v1122 = l_v735_2(v1121);
                    if v1122 == nil then
                        return false, false;
                    else
                        local v1123 = l_v734_2[v1122];
                        local v1124 = l_v431_8.options[v1122];
                        if v1123 == nil or v1124 == nil then
                            return false, false;
                        elseif v1124.modifiers:get("In Air") and not v338.is_onground then
                            local v1125 = v1124.air_hitchance:get();
                            v1123.hit_chance:override(v1125);
                            return true, false;
                        else
                            if v1124.modifiers:get("No Scope") then
                                local v1126 = v1124.distance:get();
                                if l_v985_1(v1119, v1120, v1126) then
                                    local v1127 = v1124.ns_hitchance:get();
                                    v1123.hit_chance:override(v1127);
                                    v1123.auto_scope:override(false);
                                    return true, true;
                                end;
                            end;
                            return false, false;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1128()
        -- upvalues: l_v997_1 (ref), l_v1004_1 (ref)
        l_v997_1();
        l_v1004_1();
    end;
    local function v1131()
        -- upvalues: l_v1012_1 (ref), l_v997_1 (ref), l_v1004_1 (ref)
        local v1129, v1130 = l_v1012_1();
        if not v1129 then
            l_v997_1();
        end;
        if not v1130 then
            l_v1004_1();
        end;
    end;
    local function v1132()
        -- upvalues: l_v990_1 (ref), l_v992_1 (ref)
        l_v990_1();
        l_v992_1();
    end;
    local _ = nil;
    local function v1138()
        -- upvalues: l_v431_8 (ref), v1132 (ref), v1131 (ref), v1128 (ref)
        local v1134 = false;
        for _, v1136 in pairs(l_v431_8.options) do
            local v1137 = v1136.modifiers:get();
            if next(v1137) ~= nil then
                v1134 = true;
                break;
            end;
        end;
        events.render(v1132, v1134);
        events.createmove(v1131, v1134);
        events.shutdown(v1128);
    end;
    local function v1140(v1139)
        -- upvalues: l_v986_1 (ref)
        l_v986_1(v1139);
    end;
    for _, v1142 in pairs(l_v431_8.options) do
        v1142.modifiers:set_callback(v1138, true);
        v1142.distance:set_callback(v1140);
    end;
end;
v431 = {};
v432 = v337.ragebob.fake_latency;
v488 = function()
    -- upvalues: v7 (ref)
    v7.misc.fake_latency:override();
    v7.misc.fake_latency:disabled(false);
end;
v509 = function(v1143)
    -- upvalues: v7 (ref)
    v7.misc.fake_latency:override(v1143);
    v7.misc.fake_latency:disabled(true);
end;
v510 = nil;
do
    local l_v488_5, l_v509_6 = v488, v509;
    v432:set_callback(function(v1146)
        -- upvalues: l_v509_6 (ref), l_v488_5 (ref)
        local v1147 = v1146:get();
        if v1147 > 0 then
            l_v509_6(v1147);
        else
            l_v488_5();
        end;
        events.shutdown(l_v488_5);
    end, true);
end;
v428 = {};
v429 = {};
v430 = {};
v431 = v337.misc.granades.throw_fix;
v432 = function()
    -- upvalues: v7 (ref)
    local v1148 = entity.get_local_player():get_player_weapon();
    if v1148 == nil then
        return;
    else
        local v1149 = v1148:get_weapon_info();
        if v1149 == nil then
            return;
        else
            if v1149.weapon_type == 9 then
                v7.misc.weapon_actions:override({});
            else
                v7.misc.weapon_actions:override();
            end;
            return;
        end;
    end;
end;
v488 = function()
    -- upvalues: v7 (ref)
    v7.misc.weapon_actions:override();
end;
v509 = nil;
do
    local l_v432_10, l_v488_6 = v432, v488;
    v431:set_callback(function(v1152)
        -- upvalues: l_v488_6 (ref), l_v432_10 (ref)
        local v1153 = v1152:get();
        if not v1153 then
            l_v488_6();
        end;
        events.shutdown(l_v488_6, v1153);
        events.createmove(l_v432_10, v1153);
    end, true);
end;
v431 = {};
v432 = v337.misc.granades.drop;
v488 = {};
do
    local l_v488_7, l_v509_7, l_v510_6, l_v511_6, l_v733_3, l_v734_3 = v488, v509, v510, v511, v733, v734;
    l_v509_7 = function()
        -- upvalues: l_v488_7 (ref)
        for v1160 = 1, #l_v488_7 do
            l_v488_7[v1160] = nil;
        end;
    end;
    l_v510_6 = function(v1161)
        return v1161 == "weapon_molotov" or not (v1161 ~= "weapon_hegrenade") or v1161 == "weapon_incgrenade";
    end;
    l_v511_6 = function(v1162)
        local v1163 = {};
        for v1164 = 0, 63 do
            local v1165 = v1162.m_hMyWeapons[v1164];
            if v1165 ~= nil then
                v1163[#v1163 + 1] = v1165;
            end;
        end;
        return v1163;
    end;
    l_v733_3 = function(v1166)
        -- upvalues: l_v509_7 (ref), l_v511_6 (ref), l_v510_6 (ref), l_v488_7 (ref)
        l_v509_7();
        local v1167 = l_v511_6(v1166);
        for v1168 = 1, #v1167 do
            local v1169 = v1167[v1168];
            local v1170 = v1169:get_weapon_info();
            if v1170.weapon_type == 9 and l_v510_6(v1170.weapon_name) then
                l_v488_7[#l_v488_7 + 1] = v1169;
            end;
        end;
    end;
    l_v734_3 = function(v1171)
        -- upvalues: l_v488_7 (ref)
        local v1172 = entity.get_local_player();
        if v1172 == nil then
            return;
        elseif v1172:get_player_weapon() == nil then
            return;
        elseif #l_v488_7 == 0 then
            return;
        else
            v1171.in_use = true;
            v1171.force_defensive = false;
            v1171.send_packet = true;
            v1171.no_choke = true;
            return;
        end;
    end;
    v735 = nil;
    v736 = function()
        -- upvalues: l_v733_3 (ref), l_v488_7 (ref)
        local v1173 = entity.get_local_player();
        if v1173 == nil then
            return;
        else
            l_v733_3(v1173);
            for v1174 = 1, #l_v488_7 do
                local v1175 = l_v488_7[v1174]:get_weapon_info();
                do
                    local l_v1174_0 = v1174;
                    do
                        local l_v1175_0 = v1175;
                        utils.execute_after(0.02 * l_v1174_0, function()
                            -- upvalues: l_v1175_0 (ref), l_v488_7 (ref), l_v1174_0 (ref)
                            utils.console_exec(string.format("use %s", l_v1175_0.weapon_name));
                            utils.console_exec("drop");
                            l_v488_7[l_v1174_0] = nil;
                        end);
                    end;
                end;
            end;
            return;
        end;
    end;
    do
        local l_v736_3 = v736;
        v432:set_callback(function(v1179)
            -- upvalues: l_v736_3 (ref), l_v734_3 (ref)
            local v1180 = v1179:get();
            if not v1180 then
                return;
            else
                l_v736_3();
                events.createmove(l_v734_3, v1180);
                return;
            end;
        end, true);
    end;
end;
v432 = {};
v488 = v337.misc.granades;
v509 = 0;
v510 = 0;
v511 = 0;
v733 = 14;
do
    local l_v488_8, l_v509_8, l_v510_7, l_v511_7, l_v733_4, l_v734_4, l_v735_3, l_v736_4 = v488, v509, v510, v511, v733, v734, v735, v736;
    l_v734_4 = function(v1189)
        -- upvalues: l_v509_8 (ref), l_v510_7 (ref)
        local l_damage_1 = v1189.damage;
        l_v510_7 = v1189.target;
        l_v509_8 = l_damage_1;
    end;
    l_v735_3 = function(v1191)
        -- upvalues: l_v488_8 (ref), l_v510_7 (ref), l_v509_8 (ref), l_v511_7 (ref), l_v733_4 (ref)
        local v1192 = entity.get_local_player();
        if not v1192 then
            return;
        else
            local v1193 = v1192:get_player_weapon();
            if not v1193 then
                return;
            else
                local v1194 = v1193:get_classname();
                local v1195 = globals.tickcount * 2.4;
                if v1191.in_attack or v1191.in_attack2 then
                    if l_v488_8.release:get("HE") and l_v510_7 and v1194 == "CHEGrenade" and (l_v509_8 >= l_v488_8.release_dmg:get() or l_v509_8 >= l_v510_7.m_iHealth) and v1195 - l_v511_7 >= l_v733_4 then
                        utils.console_exec("-attack;-attack2");
                        l_v511_7 = v1195;
                    end;
                    if l_v488_8.release:get("Molotov") and l_v510_7 and (v1194 == "CMolotovGrenade" or v1194 == "CIncendiaryGrenade") and (l_v509_8 >= l_v488_8.release_dmg:get() or l_v509_8 >= l_v510_7.m_iHealth) and v1195 - l_v511_7 >= l_v733_4 then
                        utils.console_exec("-attack;-attack2");
                        l_v511_7 = v1195;
                    end;
                    if l_v488_8.release:get("Smoke") and v1194 == "CSmokeGrenade" and l_v509_8 >= 1 and v1195 - l_v511_7 >= l_v733_4 then
                        utils.console_exec("-attack;-attack2");
                        l_v511_7 = v1195;
                    end;
                    if l_v488_8.release:get("Flashbang") and l_v510_7 and v1194 == "CFlashbang" then
                        if l_v510_7 == v1192 then
                            return;
                        elseif l_v509_8 >= 66 and v1195 - l_v511_7 >= l_v733_4 then
                            utils.console_exec("-attack;-attack2");
                            l_v511_7 = v1195;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
    l_v736_4 = function()
        -- upvalues: l_v511_7 (ref)
        l_v511_7 = cur_tick;
    end;
    v985 = nil;
    v986 = function(v1196)
        -- upvalues: l_v488_8 (ref), l_v734_4 (ref), l_v735_3 (ref)
        local l_v1196_0 = v1196;
        local v1198 = unpack(l_v488_8.release:get());
        local v1199 = l_v1196_0 ~= nil and v1198 ~= nil;
        if not v1199 then
            return;
        else
            events.grenade_prediction(l_v734_4, v1199);
            events.createmove(l_v735_3, v1199);
            return;
        end;
    end;
    do
        local l_v986_2, l_v990_2 = v986, v990;
        l_v990_2 = function()
            -- upvalues: l_v986_2 (ref), l_v488_8 (ref)
            l_v986_2(l_v488_8.release:get());
        end;
        v992 = function(v1202)
            -- upvalues: l_v488_8 (ref), l_v990_2 (ref), l_v986_2 (ref), l_v736_4 (ref)
            local v1203 = unpack(v1202:get());
            if v1203 ~= nil then
                l_v488_8.release:set_callback(l_v990_2, true);
            else
                l_v488_8.release:unset_callback(l_v990_2, true);
            end;
            l_v986_2(v1203);
            events.shutdown(l_v736_4);
        end;
        l_v488_8.release:set_callback(v992, true);
    end;
end;
v488 = {};
v509 = v337.misc.granades.super_toss;
v510 = 0.3;
v511 = false;
v733 = function(v1204, v1205)
    local v1206 = math.cos(math.rad(v1205));
    local v1207 = math.sin(math.rad(v1205));
    local v1208 = v1206 * v1204.forwardmove + v1207 * v1204.sidemove;
    local v1209 = v1207 * v1204.forwardmove + v1206 * v1204.sidemove;
    v1204.forwardmove = v1208;
    v1204.sidemove = v1209;
end;
v734 = function(v1210, v1211, v1212)
    if math.abs(v1210.x) > math.abs(v1210.y) then
        local v1213 = v1210.y / v1210.x;
        local v1214 = 1 + v1213 * v1213;
        local v1215 = -2 * v1211.x - 2 * v1213 * v1211.y;
        local v1216 = v1211:length2dsqr() - v1212 * v1212;
        local v1217 = v1215 * v1215 - 4 * v1214 * v1216;
        if v1217 < 0 then
            return v1211 + (v1210 * v1211:dot(v1210) - v1211):normalized() * v1212;
        elseif v1217 < 0.001 then
            local v1218 = -v1215 / (2 * v1214);
            local v1219 = v1213 * v1218;
            return vector(v1218, v1219);
        else
            local v1220 = math.sqrt(v1217);
            local v1221 = (-v1215 + v1220) / (2 * v1214);
            local v1222 = v1213 * v1221;
            local v1223 = vector(v1221, v1222);
            v1221 = (-v1215 - v1220) / (2 * v1214);
            v1222 = v1213 * v1221;
            local v1224 = vector(v1221, v1222);
            if v1210:dot(v1223) > v1210:dot(v1224) then
                return v1223;
            else
                return v1224;
            end;
        end;
    else
        local v1225 = v1210.x / v1210.y;
        local v1226 = 1 + v1225 * v1225;
        local v1227 = -2 * v1211.y - 2 * v1225 * v1211.x;
        local v1228 = v1211:length2dsqr() - v1212 * v1212;
        local v1229 = v1227 * v1227 - 4 * v1226 * v1228;
        if v1229 < 0 then
            return v1211 + (v1210 * v1211:dot(v1210) - v1211):normalized() * v1212;
        elseif v1229 < 0.001 then
            local v1230 = -v1227 / (2 * v1226);
            local v1231 = v1225 * v1230;
            return vector(v1231, v1230);
        else
            local v1232 = math.sqrt(v1229);
            local v1233 = (-v1227 + v1232) / (2 * v1226);
            local v1234 = v1225 * v1233;
            local v1235 = vector(v1234, v1233);
            v1233 = (-v1227 - v1232) / (2 * v1226);
            v1234 = v1225 * v1233;
            local v1236 = vector(v1234, v1233);
            if v1210:dot(v1235) > v1210:dot(v1236) then
                return v1235;
            else
                return v1236;
            end;
        end;
    end;
end;
do
    local l_v510_8, l_v511_8, l_v735_4, l_v736_5, l_v985_2 = v510, v511, v735, v736, v985;
    l_v735_4 = function(v1242, v1243, v1244, v1245)
        -- upvalues: v9 (ref), l_v510_8 (ref)
        v1242.x = v1242.x - 10 + math.abs(v1242.x) / 9;
        local v1246 = vector():angles(v1242);
        local v1247 = v1245 * 1.25;
        local v1248 = math.clamp(v1243 * 0.9, 15, 750);
        local v1249 = math.clamp(v1244, 0, 1);
        v1248 = v1248 * v9.lerp(l_v510_8, 1, v1249);
        local l_v1246_0 = v1246;
        for _ = 1, 7 do
            l_v1246_0 = (v1246 * (l_v1246_0 * v1248 + v1247):length() - v1247) / v1248;
            l_v1246_0:normalize();
        end;
        local v1252 = l_v1246_0.angles(l_v1246_0);
        if v1252.x > -10 then
            v1252.x = 0.9 * v1252.x + 9;
        else
            v1252.x = 1.125 * v1252.x + 11.25;
        end;
        return v1252;
    end;
    l_v736_5 = function(v1253)
        -- upvalues: l_v511_8 (ref), v7 (ref), l_v735_4 (ref)
        if l_v511_8 then
            v7.misc.air_strafe:override(nil);
            l_v511_8 = false;
        end;
        local v1254 = entity.get_local_player();
        if v1254 == nil then
            return;
        else
            local v1255 = v1254:get_player_weapon();
            if v1255 == nil then
                return;
            else
                local v1256 = v1255:get_weapon_info();
                if v1256 == nil or v1256.weapon_type ~= 9 then
                    return;
                elseif v1255.m_fThrowTime == 0 then
                    return;
                elseif v1254.m_nTickBase * globals.tickinterval < v1255.m_fThrowTime and rage.exploit:get() ~= 1 then
                    return;
                else
                    local l_view_angles_0 = v1253.view_angles;
                    if l_view_angles_0 == nil then
                        return;
                    else
                        local v1258 = render.camera_angles();
                        if not (v1258.x == l_view_angles_0.x or v1258.y == l_view_angles_0.y) then
                            return;
                        else
                            local v1259 = v1254:simulate_movement();
                            v1259:think();
                            v1253.view_angles = l_v735_4(l_view_angles_0, v1256.throw_velocity, v1255.m_flThrowStrength, v1259.velocity);
                            v7.misc.air_strafe:override(false);
                            l_v511_8 = true;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    l_v985_2 = function(v1260)
        -- upvalues: l_v735_4 (ref)
        local v1261 = entity.get_local_player();
        local v1262 = v1261:get_player_weapon();
        if v1262 == nil then
            return;
        else
            local v1263 = v1262:get_weapon_info();
            if v1263 ~= nil and v1263.weapon_type == 9 then
                local v1264 = v1261:simulate_movement(nil, v1260.velocity);
                v1264:think();
                v1260.angles = l_v735_4(v1260.angles, v1263.throw_velocity, v1262.m_flThrowStrength, v1264.velocity);
            end;
            return;
        end;
    end;
    v986 = nil;
    v509:set_callback(function(v1265)
        -- upvalues: l_v511_8 (ref), v7 (ref), l_v736_5 (ref), l_v985_2 (ref)
        local v1266 = v1265:get();
        if not v1266 and l_v511_8 then
            v7.misc.air_strafe:override(nil);
            l_v511_8 = false;
        end;
        events.createmove(l_v736_5, v1266);
        events.grenade_override_view(l_v985_2, v1266);
    end, true);
end;
v430 = {};
v431 = {};
v432 = v337.misc.movement.fast_ladder;
v488 = function(v1267)
    if entity.get_local_player().m_MoveType == 9 then
        if v1267.forwardmove > 0 and render.camera_angles().x < 45 then
            v1267.view_angles.x = 89;
            v1267.in_moveright = 1;
            v1267.in_moveleft = 0;
            v1267.in_forward = 0;
            v1267.in_back = 1;
            if v1267.sidemove == 0 then
                v1267.view_angles.y = v1267.view_angles.y + 90;
            end;
            if v1267.sidemove < 0 then
                v1267.view_angles.y = v1267.view_angles.y + 150;
            end;
            if v1267.sidemove > 0 then
                v1267.view_angles.y = v1267.view_angles.y + 30;
            end;
        end;
        if v1267.forwardmove < 0 then
            v1267.view_angles.x = 89;
            v1267.in_moveleft = 1;
            v1267.in_moveright = 0;
            v1267.in_forward = 1;
            v1267.in_back = 0;
            if v1267.sidemove == 0 then
                v1267.view_angles.y = v1267.view_angles.y + 90;
            end;
            if v1267.sidemove > 0 then
                v1267.view_angles.y = v1267.view_angles.y + 150;
            end;
            if v1267.sidemove < 0 then
                v1267.view_angles.y = v1267.view_angles.y + 30;
            end;
        end;
    end;
end;
v509 = nil;
do
    local l_v488_9 = v488;
    v432:set_callback(function(v1269)
        -- upvalues: l_v488_9 (ref)
        local v1270 = v1269:get();
        events.createmove(l_v488_9, v1270);
    end, true);
end;
v432 = {};
v488 = v337.misc.movement.no_fall_damage;
v509 = function(v1271, v1272)
    local v1273 = v1271:get_origin();
    local v1274 = math.pi * 2 / 16;
    for v1275 = 0, math.pi * 2, v1274 do
        local v1276 = math.sin(v1275);
        local v1277 = math.cos(v1275);
        local v1278 = v1273 + vector(10 * v1277, 10 * v1276, 0);
        local v1279 = v1278 - vector(0, 0, v1272);
        if utils.trace_line(v1278, v1279, v1271).fraction < 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v509_9, l_v510_9 = v509, v510;
    l_v510_9 = function(v1282)
        -- upvalues: l_v509_9 (ref)
        local v1283 = entity.get_local_player();
        if not v1283 or not v1283:is_alive() then
            return;
        else
            if v1283.m_vecVelocity.z >= -500 then
                triggered = false;
            elseif l_v509_9(v1283, 15) then
                triggered = false;
            elseif l_v509_9(v1283, 75) then
                triggered = true;
            end;
            if v1283.m_vecVelocity.z < -500 then
                v1282.in_duck = triggered;
            end;
            return;
        end;
    end;
    v511 = nil;
    v488:set_callback(function(v1284)
        -- upvalues: l_v510_9 (ref)
        local v1285 = v1284:get();
        events.createmove(l_v510_9, v1285);
    end, true);
end;
v488 = {};
v509 = v337.misc.movement.edge_quick_stop;
v510 = function(v1286)
    local v1287 = entity.get_local_player();
    if not v1287 or not v1287:is_alive() then
        return;
    else
        local v1288 = v1287:simulate_movement();
        v1288:think(5);
        if v1288.velocity.z < 0 then
            v1286.block_movement = 2;
        end;
        return;
    end;
end;
v511 = nil;
do
    local l_v510_10 = v510;
    v509:set_callback(function(v1290)
        -- upvalues: l_v510_10 (ref)
        local v1291 = v1290:get();
        events.createmove(l_v510_10, v1291);
    end, true);
end;
v509 = {};
v510 = v337.misc.movement.collision_air_duck;
v511 = function(v1292)
    local v1293 = entity.get_local_player();
    if not v1293 or not v1293:is_alive() then
        return;
    else
        local l_m_fFlags_1 = v1293.m_fFlags;
        if bit.band(l_m_fFlags_1, 1) ~= 0 then
            return;
        elseif v1292.in_duck then
            return;
        else
            local v1295 = false;
            local v1296 = v1293:simulate_movement();
            v1292.in_duck = true;
            v1296:think(1);
            v1295 = bit.band(v1296.flags, 1) == 0 and v1296.did_hit_collision;
            v1296 = false;
            local v1297 = v1293:simulate_movement();
            v1292.in_duck = false;
            v1297:think(1);
            v1296 = bit.band(v1297.flags, 1) == 0 and v1297.did_hit_collision;
            if not v1295 and v1296 then
                v1292.in_duck = true;
            end;
            return;
        end;
    end;
end;
v733 = nil;
do
    local l_v511_9 = v511;
    v510:set_callback(function(v1299)
        -- upvalues: l_v511_9 (ref)
        local v1300 = v1299:get();
        events.createmove(l_v511_9, v1300);
    end, true);
end;
v431 = {};
v432 = v337.misc.clantag;
v488 = {
    M = "m", 
    Q = "q", 
    P = "p", 
    O = "0", 
    H = "#", 
    N = "|\\|", 
    L = "1", 
    K = "k", 
    W = "w", 
    J = "j", 
    Y = "y", 
    I = "!", 
    C = "<", 
    G = "&", 
    F = "f", 
    E = "3", 
    D = "d", 
    Z = "z", 
    B = "6", 
    X = "x", 
    A = "4", 
    V = "\\/", 
    U = "u", 
    T = "7", 
    S = "5", 
    R = "r"
};
v509 = "";
v510 = 5;
v511 = cvar.cl_clanid;
do
    local l_v488_10, l_v509_10, l_v510_11, l_v511_10, l_v733_5, l_v734_5 = v488, v509, v510, v511, v733, v734;
    l_v733_5 = function()
        -- upvalues: l_v511_10 (ref), l_v509_10 (ref)
        local v1307 = l_v511_10:int();
        l_v511_10:call(0);
        l_v511_10:call(v1307);
        l_v509_10 = nil;
    end;
    l_v734_5 = function()
        -- upvalues: v6 (ref), l_v488_10 (ref), l_v510_11 (ref), l_v509_10 (ref)
        local l_curtime_0 = globals.curtime;
        local v1309 = v6.name .. "          ";
        local v1310 = string.len(v1309);
        v1310 = 0;
        for v1311 = 1, #v1309 do
            local v1312 = string.sub(v1309, v1311, v1311);
            local v1313 = l_v488_10[string.upper(v1312)];
            if v1313 ~= nil and v1313 ~= v1312 then
                v1310 = v1310 + string.len(v1313) + 1;
            else
                v1310 = v1310 + 1;
            end;
        end;
        v1310 = v1310 * 2;
        local v1314 = math.floor(l_curtime_0 * l_v510_11 % v1310 + 1);
        local _ = "";
        local _ = -1;
        local _ = 0;
        local _ = 1;
        local _ = false;
        local l_v1314_0 = v1314;
        local v1321 = "";
        local _ = 0;
        for v1323 = 1, v1310 / 2 do
            local v1324 = string.sub(v1309, v1323, v1323);
            local v1325 = l_v488_10[string.upper(v1324)];
            if v1325 == nil or string.lower(v1324) == v1325 then
                if l_v1314_0 > 0 then
                    v1321 = v1321 .. v1324;
                    l_v1314_0 = l_v1314_0 - 1;
                end;
            else
                local v1326 = "";
                for v1327 = 1, #v1325 do
                    if l_v1314_0 > 0 then
                        v1326 = v1326 .. string.sub(v1325, v1327, v1327);
                        l_v1314_0 = l_v1314_0 - 1;
                    end;
                end;
                if l_v1314_0 > 0 then
                    v1321 = v1321 .. v1324;
                    l_v1314_0 = l_v1314_0 - 1;
                else
                    v1321 = v1321 .. v1326;
                end;
            end;
        end;
        if v1310 / 2 < v1314 then
            v1321 = "";
            l_v1314_0 = v1310 - v1314;
            for v1328 = 1, v1310 / 2 do
                local v1329 = string.sub(v1309, v1328, v1328);
                local v1330 = l_v488_10[string.upper(v1329)];
                if v1330 == nil or string.lower(v1329) == v1330 then
                    if l_v1314_0 > 0 then
                        v1321 = v1321 .. v1329;
                        l_v1314_0 = l_v1314_0 - 1;
                    end;
                else
                    local v1331 = "";
                    for v1332 = 1, #v1330 do
                        if l_v1314_0 > 0 then
                            v1331 = v1331 .. string.sub(v1330, v1332, v1332);
                            l_v1314_0 = l_v1314_0 - 1;
                        end;
                    end;
                    if l_v1314_0 > 0 then
                        v1321 = v1321 .. v1329;
                        l_v1314_0 = l_v1314_0 - 1;
                    else
                        v1321 = v1321 .. v1331;
                    end;
                end;
            end;
        end;
        if l_v509_10 ~= v1321 then
            common.set_clan_tag(v1321);
            l_v509_10 = v1321;
        end;
    end;
    v735 = nil;
    v432:set_callback(function(v1333)
        -- upvalues: l_v733_5 (ref), l_v734_5 (ref)
        local v1334 = v1333:get();
        if not v1334 then
            l_v733_5();
        end;
        events.pre_render(l_v734_5, v1334);
    end, true);
end;
v432 = {};
v488 = v337.misc.optimizations;
v509 = false;
v510 = {};
v511 = function(v1335, v1336)
    return {
        convar = v1335, 
        old_value = nil, 
        new_value = v1336
    };
end;
v510.Fog = {
    v511(cvar.fog_enable, 0), 
    v511(cvar.fog_enable_water_fog, 0)
};
v510.Blood = {
    v511(cvar.violence_hblood, 0)
};
v510.Bloom = {
    v511(cvar.mat_disable_bloom, 1)
};
v510.Decals = {
    v511(cvar.r_drawdecals, 0)
};
v510.Shadows = {
    v511(cvar.r_shadows, 0), 
    v511(cvar.cl_csm_static_prop_shadows, 0), 
    v511(cvar.cl_csm_shadows, 0), 
    v511(cvar.cl_csm_world_shadows, 0), 
    v511(cvar.cl_foot_contact_shadows, 0), 
    v511(cvar.cl_csm_viewmodel_shadows, 0), 
    v511(cvar.cl_csm_rope_shadows, 0), 
    v511(cvar.cl_csm_sprite_shadows, 0), 
    v511(cvar.cl_csm_translucent_shadows, 0), 
    v511(cvar.cl_csm_entity_shadows, 0), 
    v511(cvar.cl_csm_world_shadows_in_viewmodelcascad, 0)
};
v510.Sprites = {
    v511(cvar.r_drawsprites, 0)
};
v510.Particles = {
    v511(cvar.r_drawparticles, 0)
};
v510.Ropes = {
    v511(cvar.r_drawropes, 0)
};
v510["Dynamic lights"] = {
    v511(cvar.mat_disable_fancy_blending, 1)
};
v510["Map details"] = {
    v511(cvar.func_break_max_pieces, 0), 
    v511(cvar.props_break_max_pieces, 0)
};
v510["Weapon effects"] = {
    v511(cvar.muzzleflash_light, 0), 
    v511(cvar.r_drawtracers_firstperson, 0)
};
v511 = function()
    return true;
end;
do
    local l_v488_11, l_v509_11, l_v510_12, l_v511_11, l_v733_6, l_v734_6, l_v735_5, l_v736_6 = v488, v509, v510, v511, v733, v734, v735, v736;
    l_v733_6 = function()
        -- upvalues: l_v509_11 (ref), l_v510_12 (ref)
        if not l_v509_11 then
            return;
        else
            for _, v1346 in pairs(l_v510_12) do
                for v1347 = 1, #v1346 do
                    local v1348 = v1346[v1347];
                    local l_convar_0 = v1348.convar;
                    if v1348.old_value ~= nil then
                        l_convar_0:int(v1348.old_value);
                        v1348.old_value = nil;
                    end;
                end;
            end;
            l_v509_11 = false;
            return;
        end;
    end;
    l_v734_6 = function()
        -- upvalues: l_v509_11 (ref), l_v488_11 (ref), l_v510_12 (ref)
        if l_v509_11 then
            return;
        else
            local v1350 = l_v488_11.enabled:get();
            for v1351 = 1, #v1350 do
                local v1352 = l_v510_12[v1350[v1351]];
                for v1353 = 1, #v1352 do
                    local v1354 = v1352[v1353];
                    local l_convar_1 = v1354.convar;
                    if l_convar_1 ~= nil and v1354.old_value == nil then
                        v1354.old_value = l_convar_1:int();
                        l_convar_1:int(v1354.new_value);
                    end;
                end;
            end;
            l_v509_11 = true;
            return;
        end;
    end;
    l_v735_5 = function()
        -- upvalues: l_v733_6 (ref)
        l_v733_6();
    end;
    l_v736_6 = function()
        -- upvalues: l_v511_11 (ref), l_v733_6 (ref), l_v734_6 (ref)
        if not l_v511_11() then
            return l_v733_6();
        else
            l_v734_6();
            return;
        end;
    end;
    v985 = nil;
    v986 = function(v1356)
        -- upvalues: l_v736_6 (ref), l_v735_5 (ref)
        local v1357 = v1356:get();
        if unpack(v1357) ~= nil then
            events.net_update_end(l_v736_6, true);
        end;
        l_v735_5();
        events.shutdown(l_v735_5, true);
    end;
    l_v488_11.enabled:set_callback(v986, true);
end;
v429 = {};
v430 = {};
v431 = v7.antiaim.angles;
v432 = {};
v432.__index = v432;
v432.clear = function(v1358)
    for v1359 in pairs(v1358) do
        v1358[v1359] = nil;
    end;
end;
v432.copy = function(v1360, v1361)
    for v1362, v1363 in pairs(v1361) do
        v1360[v1362] = v1363;
    end;
end;
do
    local l_v431_9 = v431;
    v432.unset = function(_)
        -- upvalues: l_v431_9 (ref)
        l_v431_9.enabled:override();
        l_v431_9.pitch:override();
        l_v431_9.yaw:override();
        l_v431_9.yaw_base:override();
        l_v431_9.yaw_offset:override();
        l_v431_9.avoid_backstab:override();
        l_v431_9.hidden:override();
        l_v431_9.yaw_modifier:override();
        l_v431_9.modifier_offset:override();
        l_v431_9.body_yaw:override();
        l_v431_9.inverter:override();
        l_v431_9.left_limit:override();
        l_v431_9.right_limit:override();
        l_v431_9.options:override();
        l_v431_9.body_freestanding:override();
        l_v431_9.freestanding:override();
        l_v431_9.freestanding_yaw_modifier:override();
        l_v431_9.freestanding_body:override();
        l_v431_9.extended_angles:override();
        l_v431_9.extended_pitch:override();
        l_v431_9.extended_roll:override();
    end;
    v432.set = function(v1366)
        -- upvalues: l_v431_9 (ref)
        l_v431_9.enabled:override(v1366.enabled);
        l_v431_9.pitch:override(v1366.pitch);
        l_v431_9.yaw:override(v1366.yaw);
        l_v431_9.yaw_base:override(v1366.yaw_base);
        l_v431_9.yaw_offset:override(v1366.yaw_offset);
        l_v431_9.avoid_backstab:override(v1366.avoid_backstab);
        l_v431_9.hidden:override(v1366.hidden);
        l_v431_9.yaw_modifier:override(v1366.yaw_modifier);
        l_v431_9.modifier_offset:override(v1366.modifier_offset);
        l_v431_9.body_yaw:override(v1366.body_yaw);
        l_v431_9.inverter:override(v1366.inverter);
        l_v431_9.left_limit:override(v1366.left_limit);
        l_v431_9.right_limit:override(v1366.right_limit);
        l_v431_9.options:override(v1366.options);
        l_v431_9.body_freestanding:override(v1366.freestanding_body_yaw);
        l_v431_9.freestanding:override(v1366.freestanding);
        l_v431_9.freestanding_yaw_modifier:override(v1366.freestanding_disable_yaw_modifiers);
        l_v431_9.freestanding_body:override(v1366.freestanding_body_freestanding);
        l_v431_9.extended_angles:override(v1366.extended_angles);
        l_v431_9.extended_pitch:override(v1366.extended_angles_pitch);
        l_v431_9.extended_roll:override(v1366.extended_angles_roll);
    end;
    setmetatable(v430, v432);
end;
v431 = {};
v432 = function()
    return {
        count = 0, 
        invert = false, 
        update = function(v1367, v1368)
            v1367.count = v1367.count + 1;
            if v1368 ~= false then
                v1367.invert = not v1367.invert;
            end;
        end
    };
end;
do
    local l_v430_8, l_v431_10, l_v432_11, l_v488_12, l_v509_12, l_v510_13, l_v511_12, l_v733_7, l_v734_7, l_v735_6, l_v736_7, l_v985_3, l_v990_3, l_v992_2 = v430, v431, v432, v488, v509, v510, v511, v733, v734, v735, v736, v985, v990, v992;
    do
        local l_l_v432_11_0, l_l_v509_12_0, l_l_v510_13_0, l_l_v511_12_0, l_l_v733_7_0 = l_v432_11, l_v509_12, l_v510_13, l_v511_12, l_v733_7;
        l_v488_12 = function()
            -- upvalues: l_l_v432_11_0 (ref)
            return {
                value = 0, 
                inverter = l_l_v432_11_0(), 
                update = function(v1388, v1389, v1390)
                    if v1389 == nil then
                        v1389 = 1;
                    end;
                    if v1390 == nil then
                        v1390 = true;
                    end;
                    v1389 = math.max(1, v1389);
                    v1388.value = v1388.value + 1;
                    if v1388.value < v1389 then
                        return;
                    else
                        v1388.value = 0;
                        v1388.inverter:update(v1390);
                        return;
                    end;
                end
            };
        end;
        l_l_v509_12_0 = {
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
        l_l_v510_13_0 = l_v488_12();
        l_l_v511_12_0 = l_v488_12();
        l_l_v733_7_0 = l_v488_12();
        l_v431_10.update_regular_delays = function(_)
            -- upvalues: l_v430_8 (ref), v8 (ref), l_l_v510_13_0 (ref)
            local v1392 = 1;
            if rage.exploit:get() == 1 then
                v1392 = math.max(1, l_v430_8.delay or 1);
            end;
            local v1393 = true;
            if l_v430_8.options ~= nil and v8.contains(l_v430_8.options, "Randomize Jitter") then
                v1393 = utils.random_int(0, 1) == 0;
            end;
            l_l_v510_13_0:update(v1392, v1393);
        end;
        l_v431_10.update_defensive_delays = function(_)
            -- upvalues: l_l_v511_12_0 (ref), l_v430_8 (ref), l_l_v733_7_0 (ref)
            l_l_v511_12_0:update(l_v430_8.defensive ~= nil and l_v430_8.defensive.pitch_delay or nil);
            l_l_v733_7_0:update(l_v430_8.defensive ~= nil and l_v430_8.defensive.yaw_delay or nil);
        end;
        l_v431_10.update_defensive = function(_)
            -- upvalues: l_v430_8 (ref), l_l_v511_12_0 (ref), l_l_v733_7_0 (ref), l_l_v509_12_0 (ref)
            local l_defensive_0 = l_v430_8.defensive;
            if l_defensive_0 == nil then
                return;
            else
                if l_defensive_0.pitch_offset ~= nil then
                    rage.antiaim:override_hidden_pitch(l_defensive_0.pitch_offset);
                elseif l_defensive_0.pitch_from ~= nil and l_defensive_0.pitch_to ~= nil then
                    local l_pitch_from_0 = l_defensive_0.pitch_from;
                    if l_l_v511_12_0.inverter.invert then
                        l_pitch_from_0 = l_defensive_0.pitch_to;
                    end;
                    rage.antiaim:override_hidden_pitch(l_pitch_from_0);
                end;
                if l_defensive_0.yaw_offset ~= nil then
                    local l_yaw_offset_0 = l_defensive_0.yaw_offset;
                    local l_inverter_0 = l_l_v733_7_0.inverter;
                    if l_v430_8.yaw_offset ~= nil then
                        l_yaw_offset_0 = l_yaw_offset_0 - l_v430_8.yaw_offset;
                    end;
                    if l_defensive_0.yaw_left ~= nil and l_inverter_0.invert == true then
                        l_yaw_offset_0 = l_yaw_offset_0 + l_defensive_0.yaw_left;
                    end;
                    if l_defensive_0.yaw_right ~= nil and l_inverter_0.invert == false then
                        l_yaw_offset_0 = l_yaw_offset_0 + l_defensive_0.yaw_right;
                    end;
                    if l_defensive_0.yaw_modifier == "Offset" then
                        local l_modifier_offset_0 = l_defensive_0.modifier_offset;
                        if not l_inverter_0.invert then
                            l_modifier_offset_0 = 0;
                        end;
                        l_yaw_offset_0 = l_yaw_offset_0 + l_modifier_offset_0;
                    end;
                    if l_defensive_0.yaw_modifier == "Center" then
                        local v1401 = l_defensive_0.modifier_offset * 0.5;
                        if not l_inverter_0.invert then
                            v1401 = -v1401;
                        end;
                        l_yaw_offset_0 = l_yaw_offset_0 + v1401;
                    end;
                    if l_defensive_0.yaw_modifier == "Skitter" then
                        l_yaw_offset_0 = l_yaw_offset_0 + l_defensive_0.modifier_offset * l_l_v509_12_0[l_inverter_0.count % #l_l_v509_12_0 + 1];
                    end;
                    rage.antiaim:override_hidden_yaw_offset(-l_yaw_offset_0);
                end;
                return;
            end;
        end;
        l_v431_10.update_yaw_offset = function(_)
            -- upvalues: l_v430_8 (ref)
            if l_v430_8.yaw_type == "180" then
                local v1403 = l_v430_8.yaw_randomization or 0;
                local v1404 = utils.random_int(-v1403, v1403);
                l_v430_8.yaw_offset = math.normalize_yaw(l_v430_8.yaw_offset + v1404);
            end;
            if l_v430_8.yaw_type == "Left / Right" and l_v430_8.yaw_left ~= nil and l_v430_8.yaw_right ~= nil then
                local v1405 = l_v430_8.yaw_offset or 0;
                if l_v430_8.inverter == true then
                    l_v430_8.yaw_offset = v1405 + l_v430_8.yaw_left;
                end;
                if l_v430_8.inverter == false then
                    l_v430_8.yaw_offset = v1405 + l_v430_8.yaw_right;
                end;
                return;
            else
                return;
            end;
        end;
        l_v431_10.update_yaw_jitter_modifiers = function(_)
            -- upvalues: l_v430_8 (ref), v338 (ref)
            if l_v430_8.modifier_type == "Default" then
                local l_modifier_randomization_0 = l_v430_8.modifier_randomization;
                local v1408 = utils.random_int(-l_modifier_randomization_0, l_modifier_randomization_0);
                l_v430_8.modifier_offset = math.normalize_yaw(l_v430_8.modifier_offset + v1408);
            end;
            if l_v430_8.modifier_type == "Switch" then
                local l_modifier_from_0 = l_v430_8.modifier_from;
                local l_modifier_to_0 = l_v430_8.modifier_to;
                if l_modifier_from_0 and l_modifier_to_0 then
                    l_v430_8.modifier_offset = v338.sent_packets % 2 == 0 and l_modifier_from_0 or l_modifier_to_0;
                end;
                return;
            elseif l_v430_8.modifier_type == "Half-Sway" then
                local l_modifier_from_1 = l_v430_8.modifier_from;
                local l_modifier_to_1 = l_v430_8.modifier_to;
                if l_modifier_from_1 and l_modifier_to_1 then
                    if l_modifier_to_1 < l_modifier_from_1 then
                        local l_l_modifier_to_1_0 = l_modifier_to_1;
                        l_modifier_to_1 = l_modifier_from_1;
                        l_modifier_from_1 = l_l_modifier_to_1_0;
                    end;
                    local v1414 = l_modifier_to_1 - l_modifier_from_1;
                    l_v430_8.modifier_offset = l_modifier_from_1 + globals.tickcount % (v1414 + 1);
                end;
                return;
            else
                return;
            end;
        end;
        l_v431_10.update_yaw_jitter = function(_)
            -- upvalues: l_l_v510_13_0 (ref), l_v430_8 (ref), l_l_v509_12_0 (ref), v9 (ref)
            local l_inverter_1 = l_l_v510_13_0.inverter;
            if l_v430_8.yaw_modifier == "Offset" then
                local v1417 = l_v430_8.yaw_offset or 0;
                local l_modifier_offset_1 = l_v430_8.modifier_offset;
                l_v430_8.yaw_modifier = "Off";
                l_v430_8.modifier_offset = 0;
                l_v430_8.yaw_offset = v1417 + (l_inverter_1.invert and l_modifier_offset_1 or 0);
                return;
            elseif l_v430_8.yaw_modifier == "Center" then
                local v1419 = l_v430_8.yaw_offset or 0;
                local l_modifier_offset_2 = l_v430_8.modifier_offset;
                if not l_inverter_1.invert then
                    l_modifier_offset_2 = -l_modifier_offset_2;
                end;
                l_v430_8.yaw_modifier = "Off";
                l_v430_8.modifier_offset = 0;
                l_v430_8.yaw_offset = v1419 + l_modifier_offset_2 / 2;
                return;
            elseif l_v430_8.yaw_modifier == "Skitter" then
                local v1421 = l_l_v509_12_0[l_inverter_1.count % #l_l_v509_12_0 + 1];
                local v1422 = l_v430_8.yaw_offset or 0;
                local l_modifier_offset_3 = l_v430_8.modifier_offset;
                l_v430_8.yaw_modifier = "Off";
                l_v430_8.modifier_offset = 0;
                l_v430_8.yaw_offset = v1422 + l_modifier_offset_3 * v1421;
                return;
            elseif l_v430_8.yaw_modifier == "Spin" then
                local v1424 = globals.curtime * 3;
                local v1425 = l_v430_8.yaw_offset or 0;
                local l_modifier_offset_4 = l_v430_8.modifier_offset;
                l_v430_8.yaw_modifier = "Off";
                l_v430_8.modifier_offset = 0;
                l_v430_8.yaw_offset = v1425 + v9.lerp(-l_modifier_offset_4, l_modifier_offset_4, v1424 % 1);
                return;
            elseif l_v430_8.yaw_modifier == "Random" then
                local v1427 = l_v430_8.yaw_offset or 0;
                local l_modifier_offset_5 = l_v430_8.modifier_offset;
                l_v430_8.yaw_modifier = "Off";
                l_v430_8.modifier_offset = 0;
                l_v430_8.yaw_offset = v1427 + utils.random_int(-l_modifier_offset_5, l_modifier_offset_5);
                return;
            else
                return;
            end;
        end;
        l_v431_10.update_body_yaw = function(_)
            -- upvalues: l_v430_8 (ref), l_l_v510_13_0 (ref)
            if l_v430_8.options == nil then
                return;
            else
                local l_inverter_2 = l_l_v510_13_0.inverter;
                local v1431 = false;
                local v1432 = {};
                for v1433 = 1, #l_v430_8.options do
                    local v1434 = l_v430_8.options[v1433];
                    if v1434 == "Jitter" then
                        v1431 = true;
                    elseif v1434 ~= "Randomize Jitter" then
                        table.insert(v1432, v1434);
                    end;
                end;
                if v1431 then
                    l_v430_8.inverter = l_inverter_2.invert;
                end;
                l_v430_8.options = v1432;
                return;
            end;
        end;
    end;
    l_v432_11 = {
        update = function(_, v1436)
            -- upvalues: v337 (ref), v338 (ref), l_v430_8 (ref)
            if v337.antiaim.manual_yaw.direction:get() ~= "Disabled" then
                return;
            elseif not v338.is_crouched then
                return;
            else
                local v1437 = entity.get_local_player();
                if v1437 == nil then
                    return;
                else
                    local v1438 = v1437:get_player_weapon();
                    if v1438 == nil then
                        return;
                    else
                        local v1439 = v1438:get_weapon_info();
                        if v1439 == nil then
                            return;
                        else
                            local v1440 = v1437.m_vecVelocity:lengthsqr();
                            local v1441 = v1437.m_bIsScoped and v1439.max_player_speed or v1439.max_player_speed_alt;
                            if v1437.m_flDuckAmount == 1 then
                                v1441 = v1441 * 0.34;
                            end;
                            local v1442 = v1441 - v1441 * 0.1;
                            local v1443 = v1442 * v1442;
                            local v1444 = v1440 > 1.44;
                            local v1445 = v1444 and v1440 < v1443;
                            if v1443 * 0.55 < v1440 then
                                if l_v430_8.yaw_left ~= nil and l_v430_8.yaw_right ~= nil then
                                    l_v430_8.yaw_left = l_v430_8.yaw_left - 10;
                                    l_v430_8.yaw_right = l_v430_8.yaw_right - 10;
                                else
                                    l_v430_8.yaw_offset = l_v430_8.yaw_offset - 8;
                                end;
                            end;
                            if (v1436.in_back or v1436.in_forward) and v1436.in_moveright and v1444 and not v1445 then
                                if l_v430_8.yaw_left ~= nil and l_v430_8.yaw_right ~= nil then
                                    l_v430_8.yaw_left = l_v430_8.yaw_left + 10;
                                    l_v430_8.yaw_right = l_v430_8.yaw_right + 10;
                                else
                                    l_v430_8.yaw_offset = l_v430_8.yaw_offset + 8;
                                end;
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end
    };
    l_v488_12 = {};
    l_v509_12 = v337.antiaim.builder;
    l_v510_13 = {};
    l_v511_12 = utils.get_netvar_offset("DT_CSPlayer", "m_flFlashDuration") - 16;
    do
        local l_l_v509_12_1, l_l_v510_13_1 = l_v509_12, l_v510_13;
        do
            local l_l_v511_12_1, l_l_v733_7_1, l_l_v734_7_0, l_l_v735_6_0, l_l_v736_7_0, l_l_v985_3_0, l_v986_3, l_l_v990_3_0, l_l_v992_2_0, l_v997_2, l_v1004_2, l_v1012_2 = l_v511_12, l_v733_7, l_v734_7, l_v735_6, l_v736_7, l_v985_3, v986, l_v990_3, l_v992_2, v997, v1004, v1012;
            l_l_v733_7_1 = function(v1460)
                -- upvalues: l_l_v511_12_1 (ref)
                return ffi.cast("float*", ffi.cast("unsigned int", v1460[0]) + l_l_v511_12_1)[0];
            end;
            l_l_v734_7_0 = v337.antiaim.defensive;
            l_l_v735_6_0 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
            l_l_v736_7_0 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
            l_l_v985_3_0 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
            l_v986_3 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
            l_l_v990_3_0 = function(v1461)
                local v1462 = v1461:get_anim_overlay(10);
                if v1462 == nil then
                    return false;
                elseif v1462.cycle < 0.99 then
                    return false;
                else
                    return true;
                end;
            end;
            l_l_v992_2_0 = function(v1463, v1464)
                if globals.curtime < v1463.m_flNextAttack then
                    return false;
                elseif v1464:get_weapon_reload() ~= -1 then
                    return false;
                else
                    return true;
                end;
            end;
            l_v997_2 = function()
                local v1465 = entity.get_game_rules();
                if v1465 == nil then
                    return false;
                else
                    return v1465.m_bFreezePeriod;
                end;
            end;
            l_v1004_2 = function()
                local v1466 = entity.get_local_player();
                if v1466 == nil then
                    return false;
                else
                    local v1467 = v1466:get_player_weapon();
                    if v1467 == nil then
                        return false;
                    else
                        local v1468 = v1467:get_weapon_info();
                        if v1468 == nil then
                            return false;
                        else
                            return v1468.weapon_type == 9;
                        end;
                    end;
                end;
            end;
            l_v1012_2 = function(v1469, v1470)
                if v1469 == nil or v1470 == nil then
                    return false;
                elseif v1469:is_bot() then
                    return false;
                else
                    local v1471 = v1469:get_resource();
                    if v1471 == nil then
                        return false;
                    else
                        return v1471.m_iPing < v1470;
                    end;
                end;
            end;
            local function v1474()
                -- upvalues: l_l_v734_7_0 (ref), l_v1012_2 (ref)
                if not l_l_v734_7_0.enabled:get() then
                    return false;
                else
                    local v1472 = l_l_v734_7_0.ping_cap:get();
                    if v1472 > 0 then
                        local v1473 = entity.get_threat();
                        if l_v1012_2(v1473, v1472) then
                            return false;
                        end;
                    end;
                    return true;
                end;
            end;
            local function v1477()
                -- upvalues: l_l_v734_7_0 (ref), l_l_v733_7_1 (ref), l_l_v990_3_0 (ref), l_l_v992_2_0 (ref)
                local v1475 = entity.get_local_player();
                if v1475 == nil then
                    return false;
                else
                    local v1476 = v1475:get_player_weapon();
                    if v1476 == nil then
                        return false;
                    elseif l_l_v734_7_0.triggers:get("Flashed") and l_l_v733_7_1(v1475) > 0 then
                        return true;
                    elseif l_l_v734_7_0.triggers:get("Taking Damage") and not l_l_v990_3_0(v1475) then
                        return true;
                    elseif l_l_v734_7_0.triggers:get("Weapon Not Ready") and not l_l_v992_2_0(v1475, v1476) then
                        return true;
                    else
                        return false;
                    end;
                end;
            end;
            local function v1478()
                -- upvalues: l_v997_2 (ref), l_v1004_2 (ref)
                return not l_v997_2() and not l_v1004_2();
            end;
            local function v1479()
                -- upvalues: l_l_v734_7_0 (ref), l_l_v736_7_0 (ref)
                return l_l_v734_7_0.actions:get("Double tap") and l_l_v736_7_0:get();
            end;
            local function v1480()
                -- upvalues: l_l_v734_7_0 (ref), l_l_v735_6_0 (ref)
                return l_l_v734_7_0.actions:get("Hide shots") and l_l_v735_6_0:get();
            end;
            local function v1484(v1481)
                -- upvalues: l_v986_3 (ref), l_l_v985_3_0 (ref), v1478 (ref), v1479 (ref), v1480 (ref)
                local v1482 = l_v986_3:get();
                local v1483 = l_l_v985_3_0:get();
                if v1482 == "Always On" then
                    v1482 = "On Peek";
                end;
                if v1483 == "Break LC" then
                    v1483 = "Favor Fire Rate";
                end;
                if v1481 and v1478() then
                    if v1479() then
                        v1482 = "Always on";
                    end;
                    if v1480() then
                        v1483 = "Break LC";
                    end;
                end;
                l_v986_3:override(v1482);
                l_l_v985_3_0:override(v1483);
            end;
            local v1485 = {};
            local function v1490(v1486, v1487)
                -- upvalues: v9 (ref)
                local v1488 = v1487.pitch_type:get();
                if v1488 == "Static" then
                    v1486.pitch_offset = v1487.pitch_angle:get();
                end;
                if v1488 == "Switch" then
                    v1486.pitch_from = v1487.pitch_angle_from:get();
                    v1486.pitch_to = v1487.pitch_angle_to:get();
                    v1486.pitch_delay = v1487.pitch_angle_delay:get();
                end;
                if v1488 == "Spin" then
                    local v1489 = globals.curtime * (v1487.pitch_angle_speed:get() * 0.1);
                    v1486.pitch_offset = v9.lerp(v1487.pitch_angle_from:get(), v1487.pitch_angle_to:get(), v1489 % 1);
                end;
                if v1488 == "Random" then
                    v1486.pitch_offset = utils.random_int(v1487.pitch_angle_from:get(), v1487.pitch_angle_to:get());
                end;
            end;
            local function v1495(v1491, v1492)
                -- upvalues: v9 (ref)
                local v1493 = v1492.yaw_type:get();
                if v1493 == "Static" then
                    v1491.yaw_offset = v1492.yaw_angle:get();
                end;
                if v1493 == "Switch" then
                    v1491.yaw_offset = 0;
                    v1491.yaw_left = v1492.yaw_angle_from:get();
                    v1491.yaw_right = v1492.yaw_angle_to:get();
                    v1491.yaw_delay = v1492.yaw_angle_delay:get();
                end;
                if v1493 == "Spin" then
                    local v1494 = globals.curtime * (v1492.yaw_angle_speed:get() * 0.1);
                    v1491.yaw_offset = v9.lerp(v1492.yaw_angle_from:get(), v1492.yaw_angle_to:get(), v1494 % 1);
                end;
                if v1493 == "Random" then
                    v1491.yaw_offset = utils.random_int(v1492.yaw_angle_from:get(), v1492.yaw_angle_to:get());
                end;
                if v1493 == "Center" then
                    v1491.yaw_offset = 0;
                    v1491.yaw_modifier = "Center";
                    v1491.modifier_offset = v1492.yaw_offset:get();
                end;
            end;
            do
                local l_v1490_0, l_v1495_0 = v1490, v1495;
                v1485.apply = function(_, v1499)
                    -- upvalues: l_v1490_0 (ref), l_v1495_0 (ref), l_v430_8 (ref)
                    local v1500 = {};
                    l_v1490_0(v1500, v1499);
                    l_v1495_0(v1500, v1499);
                    l_v430_8.hidden = true;
                    l_v430_8.defensive = v1500;
                end;
            end;
            v1490 = {};
            v1495 = 0;
            local function v1503()
                local v1501 = rage.antiaim:get_target(false);
                local v1502 = rage.antiaim:get_target(true);
                if v1501 == nil or v1502 == nil then
                    return nil;
                else
                    return math.normalize_yaw(v1502 - v1501);
                end;
            end;
            local function v1505(_)
                -- upvalues: l_v430_8 (ref)
                l_v430_8.yaw = "Backward";
                l_v430_8.yaw_offset = 0;
                l_v430_8.yaw_left = 0;
                l_v430_8.yaw_right = 0;
                l_v430_8.hidden = true;
                l_v430_8.yaw_modifier = "Disabled";
                l_v430_8.modifier_offset = 0;
                l_v430_8.body_yaw = true;
                l_v430_8.inverter = false;
                l_v430_8.left_limit = limit;
                l_v430_8.right_limit = limit;
                l_v430_8.options = {};
            end;
            local function v1510(v1506, v1507)
                -- upvalues: v9 (ref)
                local v1508 = v1507.pitch_type:get();
                if v1508 == "Static" then
                    v1506.pitch_offset = v1507.pitch_angle:get();
                end;
                if v1508 == "Switch" then
                    v1506.pitch_from = v1507.pitch_angle_from:get();
                    v1506.pitch_to = v1507.pitch_angle_to:get();
                    v1506.pitch_delay = v1507.pitch_angle_delay:get();
                end;
                if v1508 == "Spin" then
                    local v1509 = globals.curtime * (v1507.pitch_angle_speed:get() * 0.1);
                    v1506.pitch_offset = v9.lerp(v1507.pitch_angle_from:get(), v1507.pitch_angle_to:get(), v1509 % 1);
                end;
                if v1508 == "Random" then
                    v1506.pitch_offset = utils.random_int(v1507.pitch_angle_from:get(), v1507.pitch_angle_to:get());
                end;
            end;
            local function v1513(v1511, v1512)
                v1511.yaw_offset = v1512.yaw_offset_default:get();
            end;
            local function v1518(v1514, v1515)
                -- upvalues: v9 (ref)
                local v1516 = v1515.yaw_type:get();
                if v1516 == "Static" then
                    v1514.yaw_offset = v1515.yaw_angle:get();
                end;
                if v1516 == "Switch" then
                    v1514.yaw_offset = 0;
                    v1514.yaw_left = v1515.yaw_angle_from:get();
                    v1514.yaw_right = v1515.yaw_angle_to:get();
                    v1514.yaw_delay = v1515.yaw_angle_delay:get();
                end;
                if v1516 == "Spin" then
                    local v1517 = globals.curtime * (v1515.yaw_angle_speed:get() * 0.1);
                    v1514.yaw_offset = v9.lerp(v1515.yaw_angle_from:get(), v1515.yaw_angle_to:get(), v1517 % 1);
                end;
                if v1516 == "Random" then
                    v1514.yaw_offset = utils.random_int(v1515.yaw_angle_from:get(), v1515.yaw_angle_to:get());
                end;
                if v1516 == "Center" then
                    v1514.yaw_offset = 0;
                    v1514.yaw_modifier = "Center";
                    v1514.modifier_offset = v1515.yaw_offset:get();
                end;
            end;
            do
                local l_v1495_1, l_v1503_0, l_v1505_0, l_v1510_0, l_v1513_0, l_v1518_0 = v1495, v1503, v1505, v1510, v1513, v1518;
                local function v1528(v1525, v1526)
                    -- upvalues: l_v1513_0 (ref), l_v1518_0 (ref), l_v1495_1 (ref)
                    local v1527 = v1526.yaw_mode:get();
                    if v1527 == "Default" then
                        l_v1513_0(v1525, v1526);
                    end;
                    if v1527 == "Custom" then
                        l_v1518_0(v1525, v1526);
                    end;
                    if v1525.yaw_offset ~= nil then
                        v1525.yaw_offset = v1525.yaw_offset;
                        if l_v1495_1 ~= 0 then
                            v1525.yaw_offset = v1525.yaw_offset * (l_v1495_1 * -1);
                        end;
                    end;
                end;
                local function v1531(v1529)
                    -- upvalues: l_v430_8 (ref)
                    local v1530 = v1529.limit:get();
                    l_v430_8.left_limit = v1530;
                    l_v430_8.right_limit = v1530;
                end;
                v1490.update = function(_, v1533, v1534)
                    -- upvalues: l_v1503_0 (ref), l_v1495_1 (ref)
                    if rage.exploit:get() ~= 1 then
                        return false;
                    else
                        local v1535 = l_v1503_0();
                        if v1535 ~= nil and v1535 < 0 then
                            l_v1495_1 = -1;
                        end;
                        if v1535 ~= nil and v1535 > 0 then
                            l_v1495_1 = 1;
                        end;
                        v1533.force_defensive = v1533.command_number % v1534.speed:get() == 0;
                        return true;
                    end;
                end;
                v1490.apply = function(_, v1537, v1538)
                    -- upvalues: l_v1505_0 (ref), l_v1510_0 (ref), v1528 (ref), v1531 (ref), l_v430_8 (ref)
                    local v1539 = {};
                    l_v1505_0(v1537);
                    l_v1510_0(v1539, v1538.flick);
                    v1528(v1539, v1538.flick);
                    v1531(v1538);
                    l_v430_8.hidden = true;
                    l_v430_8.defensive = v1539;
                end;
            end;
            v1495 = {
                update = function(_, v1541, v1542)
                    -- upvalues: l_l_v734_7_0 (ref), l_v430_8 (ref), l_v488_12 (ref), l_l_v510_13_1 (ref), v1484 (ref)
                    if l_l_v734_7_0.spam:get("Directions") then
                        local v1543 = {
                            pitch_offset = 0, 
                            yaw_offset = 180 + v1542
                        };
                        l_v430_8.hidden = true;
                        l_v430_8.defensive = v1543;
                    else
                        local v1544 = l_v488_12:get("Shared");
                        if v1544 ~= nil and v1544.defensive ~= nil then
                            l_l_v510_13_1:apply_ex(v1541, v1544.defensive);
                        end;
                    end;
                    v1484(true);
                end
            };
            v1503 = {
                update = function(_, v1546)
                    -- upvalues: l_l_v734_7_0 (ref), l_v430_8 (ref), l_v488_12 (ref), l_l_v510_13_1 (ref), v1484 (ref)
                    if l_l_v734_7_0.spam:get("Safe Head") then
                        local v1547 = {
                            pitch_offset = 0, 
                            yaw_offset = 180
                        };
                        l_v430_8.hidden = true;
                        l_v430_8.defensive = v1547;
                    else
                        local v1548 = l_v488_12:get("Shared");
                        if v1548 ~= nil and v1548.defensive ~= nil then
                            l_l_v510_13_1:apply_ex(v1546, v1548.defensive);
                        end;
                    end;
                    v1484(true);
                end
            };
            l_l_v510_13_1.apply_ex = function(_, v1550, v1551)
                -- upvalues: v1479 (ref), v1480 (ref), v1485 (ref), v1490 (ref)
                if not (v1479() or v1480()) then
                    return false;
                elseif v1551.mode:get() == "Default" then
                    v1485:apply(v1551.default);
                    return true;
                elseif v1551.mode:get() == "Flick" then
                    if v1490:update(v1550, v1551) then
                        v1490:apply(v1550, v1551);
                    end;
                    return true;
                else
                    return false;
                end;
            end;
            l_l_v510_13_1.update = function(_, v1553, v1554)
                -- upvalues: v1474 (ref), l_l_v510_13_1 (ref), v1484 (ref)
                if not v1474() then
                    return;
                else
                    if l_l_v510_13_1:apply_ex(v1553, v1554) then
                        v1484(true);
                    end;
                    return;
                end;
            end;
            l_l_v510_13_1.update_on_peek = function(_, v1556)
                -- upvalues: v1474 (ref), l_l_v734_7_0 (ref), l_v488_12 (ref), l_l_v510_13_1 (ref), v1484 (ref)
                if not v1474() then
                    return;
                else
                    if l_l_v734_7_0.triggers:get("On Peek") then
                        local v1557 = l_v488_12:get("Shared");
                        if v1557 ~= nil and v1557.defensive ~= nil then
                            l_l_v510_13_1:apply_ex(v1556, v1557.defensive);
                        end;
                        v1484(false);
                    end;
                    return;
                end;
            end;
            l_l_v510_13_1.update_triggers = function(_, v1559)
                -- upvalues: v1474 (ref), v1477 (ref), l_v488_12 (ref), l_l_v510_13_1 (ref), v1484 (ref)
                if not v1474() then
                    return;
                else
                    if v1477() then
                        local v1560 = l_v488_12:get("Shared");
                        if v1560 ~= nil and v1560.defensive ~= nil then
                            l_l_v510_13_1:apply_ex(v1559, v1560.defensive);
                        end;
                        v1484(true);
                    end;
                    return;
                end;
            end;
            l_l_v510_13_1.update_directions = function(_, v1562, v1563)
                -- upvalues: v1474 (ref), l_l_v734_7_0 (ref), v1495 (ref)
                if not v1474() then
                    return;
                else
                    if l_l_v734_7_0.triggers:get("Directions") then
                        v1495:update(v1562, v1563);
                    end;
                    return;
                end;
            end;
            l_l_v510_13_1.update_safe_head = function(_, v1565)
                -- upvalues: v1474 (ref), l_l_v734_7_0 (ref), v1503 (ref)
                if not v1474() then
                    return;
                else
                    if l_l_v734_7_0.triggers:get("Safe Head") then
                        v1503:update(v1565);
                    end;
                    return;
                end;
            end;
        end;
        l_v488_12.get = function(_, v1567)
            -- upvalues: l_l_v509_12_1 (ref)
            return l_l_v509_12_1[v1567];
        end;
        l_v488_12.is_active_ex = function(_, v1569)
            if v1569.enabled == nil then
                return true;
            else
                return v1569.enabled:get();
            end;
        end;
        l_v488_12.is_active = function(v1570, v1571)
            local v1572 = v1570:get(v1571);
            if v1572 == nil then
                return false;
            else
                return v1570:is_active_ex(v1572);
            end;
        end;
        l_v488_12.apply_ex = function(_, v1574, v1575)
            -- upvalues: l_v430_8 (ref), l_l_v510_13_1 (ref)
            l_v430_8.enabled = true;
            l_v430_8.pitch = v1575.angles.pitch:get();
            l_v430_8.yaw = v1575.angles.yaw:get();
            l_v430_8.yaw_type = v1575.angles.yaw_type:get();
            l_v430_8.yaw_offset = v1575.angles.yaw_offset:get();
            l_v430_8.yaw_randomization = v1575.angles.yaw_random:get();
            if l_v430_8.yaw_type == "Left / Right" then
                local v1576 = v1575.angles.yaw_delay:get();
                local v1577 = v1575.angles.yaw_delay_second:get();
                if v1576 > 1 then
                    if v1577 > 0 then
                        v1576 = utils.random_int(v1576, v1577);
                    end;
                    l_v430_8.delay = v1576;
                end;
                l_v430_8.yaw_offset = 0;
                l_v430_8.yaw_left = v1575.angles.yaw_offset_left:get();
                l_v430_8.yaw_right = v1575.angles.yaw_offset_right:get();
            end;
            l_v430_8.yaw_base = v1575.angles.yaw_base:get();
            l_v430_8.yaw_modifier = v1575.angles.yaw_modifier:get();
            l_v430_8.modifier_type = v1575.angles.yaw_modifier_type:get();
            l_v430_8.modifier_from = v1575.angles.yaw_modifier_offset_from:get();
            l_v430_8.modifier_to = v1575.angles.yaw_modifier_offset_to:get();
            l_v430_8.modifier_offset = v1575.angles.yaw_modifier_offset:get();
            l_v430_8.modifier_randomization = v1575.angles.yaw_modifier_random:get();
            l_v430_8.body_yaw = v1575.angles.body_yaw:get();
            l_v430_8.inverter = v1575.angles.body_inverter:get();
            l_v430_8.left_limit = v1575.angles.body_limit_left:get();
            l_v430_8.right_limit = v1575.angles.body_limit_right:get();
            l_v430_8.options = v1575.angles.body_yaw_options:get();
            l_v430_8.freestanding_body_yaw = v1575.angles.body_freestanding:get();
            l_v430_8.extended_angles = v1575.angles.extended_angles:get();
            l_v430_8.extended_angles_pitch = v1575.angles.extended_angles_pitch:get();
            l_v430_8.extended_angles_roll = v1575.angles.extended_angles_roll:get();
            if v1575.angles.body_random_jitter:get() then
                table.insert(l_v430_8.options, "Randomize Jitter");
            end;
            if v1575.defensive ~= nil then
                l_l_v510_13_1:update(v1574, v1575.defensive);
            end;
        end;
        l_v488_12.apply = function(v1578, v1579, v1580)
            local v1581 = v1578:get(v1580);
            if v1581 == nil then
                return nil;
            elseif not v1578:is_active_ex(v1581) then
                return nil;
            else
                v1578:apply_ex(v1579, v1581);
                return v1581;
            end;
        end;
        l_v488_12.update = function(_, v1583)
            -- upvalues: l_match_0 (ref), l_l_v510_13_1 (ref), l_v488_12 (ref)
            local v1584 = l_match_0.get();
            local v1585 = v1584[#v1584];
            l_l_v510_13_1:update_on_peek(v1583);
            local v1586 = l_v488_12:apply(v1583, v1585) or l_v488_12:apply(v1583, "Shared");
            l_l_v510_13_1:update_triggers(v1583);
            return v1586;
        end;
        l_v488_12.defensive = l_l_v510_13_1;
    end;
    l_v509_12 = {};
    l_v510_13 = v337.antiaim.manual_yaw;
    l_v511_12 = {
        Forward = 180, 
        Right = 90, 
        Left = -90
    };
    do
        local l_l_v510_13_2, l_l_v511_12_2 = l_v510_13, l_v511_12;
        l_v509_12.think = function(_)
            -- upvalues: l_l_v511_12_2 (ref), l_l_v510_13_2 (ref)
            return l_l_v511_12_2[l_l_v510_13_2.direction:get()];
        end;
        l_v509_12.update = function(_, v1591, v1592, v1593)
            -- upvalues: l_l_v510_13_2 (ref), l_v488_12 (ref)
            if v1592.yaw_offset == nil then
                v1592.yaw_offset = 0;
            end;
            v1592.yaw_base = "Local View";
            v1592.yaw_offset = v1592.yaw_offset + v1593;
            v1592.freestanding = false;
            if l_l_v510_13_2.disable_yaw_modifiers:get() then
                v1592.yaw_offset = v1593;
                v1592.yaw_modifier = "Disabled";
                v1592.options = "";
                v1592.delay = nil;
                v1592.inverter = nil;
            end;
            if l_l_v510_13_2.body_freestanding:get() then
                v1592.left_limit = 60;
                v1592.right_limit = 60;
                v1592.freestanding_body_yaw = "Peek Fake";
            end;
            if v1592.defensive ~= nil and v1592.defensive.yaw_offset ~= nil then
                v1592.defensive.yaw_offset = v1592.defensive.yaw_offset + v1593;
            end;
            l_v488_12.defensive:update_directions(v1591, v1593);
        end;
    end;
    l_v510_13 = {};
    l_v511_12 = v337.antiaim.freestanding;
    l_v733_7 = function()
        local v1594 = rage.antiaim:get_target(false);
        local v1595 = rage.antiaim:get_target(true);
        if v1594 == nil or v1595 == nil then
            return nil;
        else
            return v1595 - v1594;
        end;
    end;
    l_v734_7 = function()
        -- upvalues: v338 (ref)
        if not v338.is_onground and not v338.is_crouched then
            return "Air";
        elseif not v338.is_onground and v338.is_crouched then
            return "Air & Crouched";
        elseif v338.is_onground and v338.is_crouched then
            return "Crouching";
        else
            return;
        end;
    end;
    do
        local l_l_v511_12_3, l_l_v733_7_2, l_l_v734_7_1, l_l_v735_6_1 = l_v511_12, l_v733_7, l_v734_7, l_v735_6;
        l_l_v735_6_1 = function()
            -- upvalues: l_l_v511_12_3 (ref), l_l_v734_7_1 (ref), v7 (ref)
            if not l_l_v511_12_3.enabled:get() then
                return false;
            else
                local v1600 = l_l_v734_7_1();
                if l_l_v511_12_3.disablers:get(v1600) then
                    return false;
                else
                    local v1601 = v7.ragebot.peek_assist:get();
                    if l_l_v511_12_3.only_if_peek_assist:get() and not v1601 then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
        l_v510_13.update = function(_, v1603, v1604)
            -- upvalues: l_l_v735_6_1 (ref), l_l_v733_7_2 (ref), l_l_v511_12_3 (ref), l_v488_12 (ref)
            if not l_l_v735_6_1() then
                v1604.freestanding = false;
                return false;
            else
                local v1605 = l_l_v733_7_2();
                if v1605 == nil then
                    return;
                else
                    v1604.yaw_offset = v1604.yaw_offset + v1605;
                    if l_l_v511_12_3.disable_yaw_modifiers:get() then
                        v1604.yaw = "Backward";
                        v1604.yaw_modifier = "Disabled";
                    end;
                    if l_l_v511_12_3.body_freestanding:get() then
                        v1604.inverter = nil;
                        v1604.left_limit = 60;
                        v1604.right_limit = 60;
                        v1604.freestanding_body_yaw = "Peek Fake";
                    end;
                    v1604.freestanding = false;
                    if v1605 ~= nil then
                        l_v488_12.defensive:update_directions(v1603, v1605);
                    end;
                    return true;
                end;
            end;
        end;
    end;
    l_v511_12 = {};
    l_v733_7 = v337.antiaim.edge_yaw;
    l_v734_7 = 25;
    l_v735_6 = 10;
    l_v736_7 = 1;
    l_v985_3 = 90;
    v986 = -180;
    l_v990_3 = 180;
    l_v992_2 = (l_v990_3 - v986) / l_v735_6;
    l_v990_3 = l_v990_3 - l_v992_2;
    do
        local l_l_v733_7_3, l_l_v734_7_2, l_l_v736_7_1, l_l_v985_3_1, l_v986_4, l_l_v990_3_1, l_l_v992_2_1 = l_v733_7, l_v734_7, l_v736_7, l_v985_3, v986, l_v990_3, l_v992_2;
        l_v511_12.is_active = function()
            -- upvalues: l_l_v733_7_3 (ref), v7 (ref)
            if not l_l_v733_7_3.enabled:get() then
                return false;
            elseif l_l_v733_7_3.only_if_fake_ducking:get() and not v7.antiaim.misc.fake_duck:get() then
                return false;
            else
                return true;
            end;
        end;
        l_v511_12.update = function(_, v1614)
            -- upvalues: l_v511_12 (ref), v338 (ref), l_v986_4 (ref), l_l_v990_3_1 (ref), l_l_v992_2_1 (ref), l_l_v734_7_2 (ref), v9 (ref), l_l_v733_7_3 (ref), l_l_v736_7_1 (ref), l_l_v985_3_1 (ref), l_v430_8 (ref)
            if not l_v511_12.is_active() then
                return;
            elseif entity.get_local_player() == nil then
                return;
            else
                local l_eye_position_0 = v338.eye_position;
                local v1616 = {};
                for v1617 = l_v986_4, l_l_v990_3_1, l_l_v992_2_1 do
                    local v1618 = l_eye_position_0 + vector():angles(0, v1617) * l_l_v734_7_2;
                    local v1619 = utils.trace_line(l_eye_position_0, v1618, 4294967295);
                    if v1619 ~= nil and v1619:did_hit_world() then
                        v1616[#v1616 + 1] = v1617;
                    end;
                end;
                local v1620 = #v1616;
                if v1620 == 0 then
                    return;
                else
                    local v1621 = nil;
                    if v1620 == 1 then
                        v1621 = v1616[1];
                    else
                        v1621 = v9.lerp(v1616[1], v1616[v1620], 0.5);
                    end;
                    local v1622 = v1621 - v1614.view_angles.y;
                    if not l_l_v733_7_3.disable_eye_base:get() then
                        v1622 = v1622 + v1622 * l_l_v736_7_1;
                    end;
                    if math.abs(math.normalize_yaw(v1622)) > l_l_v985_3_1 then
                        return;
                    else
                        l_v430_8.yaw_base = "Local View";
                        l_v430_8.yaw_offset = v1622 + 180;
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_v733_7 = {};
    l_v734_7 = v337.antiaim.avoid_backstab;
    do
        local l_l_v734_7_3 = l_v734_7;
        l_v733_7.update = function(_, v1625)
            -- upvalues: l_l_v734_7_3 (ref)
            v1625.avoid_backstab = l_l_v734_7_3.enabled:get();
        end;
    end;
    l_v734_7 = {};
    l_v735_6 = v337.antiaim.antiaim_on_use;
    l_v736_7 = false;
    l_v985_3 = function(v1626, v1627)
        return (v1626:get_origin() - v1627):length2dsqr() < 10000;
    end;
    v986 = function(v1628)
        if not v1628.m_bInBombZone then
            return false;
        else
            local v1629 = v1628:get_player_weapon();
            if v1629 == nil then
                return false;
            else
                return v1629:get_classid() == 34;
            end;
        end;
    end;
    do
        local l_l_v735_6_2, l_l_v736_7_2, l_l_v985_3_2, l_v986_5, l_l_v990_3_2, l_l_v992_2_2, l_v997_3, l_v1004_3, l_v1012_3 = l_v735_6, l_v736_7, l_v985_3, v986, l_v990_3, l_v992_2, v997, v1004, v1012;
        l_l_v990_3_2 = function(v1639)
            -- upvalues: l_l_v985_3_2 (ref)
            if v1639.m_iTeamNum ~= 3 then
                return false;
            else
                local v1640 = v1639:get_origin();
                local v1641 = entity.get_entities("CPlantedC4");
                for v1642 = 1, #v1641 do
                    local v1643 = v1641[v1642];
                    if v1643.m_bBombTicking and l_l_v985_3_2(v1643, v1640) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        l_l_v992_2_2 = function(v1644)
            local v1645 = render.camera_angles();
            local v1646 = v1644:get_eye_position();
            local v1647 = v1646 + vector():angles(v1645) * 128;
            local v1648 = utils.trace_line(v1646, v1647, v1644, 4294967295, 0);
            if v1648.entity == nil or v1648.fraction == 1 then
                return false;
            elseif v1644.m_bInBombZone then
                if v1648.entity:get_classname():find("CWeapon") then
                    return true;
                else
                    return false;
                end;
            else
                return true;
            end;
        end;
        l_v997_3 = function(v1649, v1650)
            local l_entity_1 = v1650.entity;
            if l_entity_1 == nil then
                return false;
            elseif l_entity_1:get_classid() ~= 97 then
                return false;
            else
                return (l_entity_1:get_origin() - v1649:get_origin()):length2dsqr() < 3000;
            end;
        end;
        l_v1004_3 = function(v1652)
            -- upvalues: l_v986_5 (ref), l_l_v990_3_2 (ref)
            return l_v986_5(v1652) or l_l_v990_3_2(v1652);
        end;
        l_v1012_3 = function(v1653)
            local v1654 = render.camera_angles();
            local v1655 = v1653:get_eye_position();
            local v1656 = v1655 + vector():angles(v1654) * 128;
            local v1657 = vector(-1, -1, -1);
            local v1658 = vector(1, 1, 1);
            local v1659 = bit.bor(1, 2, 8, 16384, 33554432);
            return utils.trace_hull(v1655, v1656, v1657, v1658, v1653, v1659, 0);
        end;
        l_v734_7.think = function(_, v1661)
            -- upvalues: l_l_v735_6_2 (ref), l_v1004_3 (ref), l_l_v736_7_2 (ref), l_v1012_3 (ref), l_v997_3 (ref), l_l_v992_2_2 (ref)
            local v1662 = entity.get_local_player();
            if v1662 == nil then
                return false;
            elseif not l_l_v735_6_2.enabled:get() then
                return false;
            else
                local v1663 = v1661.in_use == true;
                local v1664 = l_v1004_3(v1662);
                if not v1663 or v1664 then
                    l_l_v736_7_2 = false;
                    return false;
                else
                    local v1665 = l_v1012_3(v1662);
                    if l_v997_3(v1662, v1665) then
                        return false;
                    else
                        if not l_l_v736_7_2 then
                            l_l_v736_7_2 = true;
                            if l_l_v992_2_2(v1662) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end;
            end;
        end;
        l_v734_7.update = function(_, v1667, v1668)
            v1667.in_use = false;
            v1668.pitch = "Disabled";
            v1668.yaw_base = "Local View";
            v1668.yaw_offset = 180;
            v1668.freestanding = false;
            v1668.extended_angles = false;
            v1668.hidden = false;
        end;
    end;
    l_v735_6 = {};
    l_v736_7 = v337.antiaim.safe_head;
    l_v985_3 = function(v1669, v1670)
        -- upvalues: v338 (ref)
        local v1671 = v1669:get_player_weapon();
        if v1671 == nil then
            return nil;
        else
            local v1672 = v1671:get_weapon_info();
            if v1672 == nil then
                return nil;
            else
                local l_weapon_name_0 = v1672.weapon_name;
                local v1674 = l_weapon_name_0 == "weapon_knife";
                local v1675 = l_weapon_name_0 == "weapon_taser";
                local v1676 = v1669:get_origin();
                local v1677 = v1670:get_origin() - v1676;
                local v1678 = -v1677.z;
                local v1679 = v1677:length2dsqr();
                if v338.is_onground then
                    if (not v338.is_moving or v338.is_crouched) and v1678 >= 10 and v1679 > 1000000 then
                        return "Distance";
                    else
                        if v338.is_crouched then
                            if v1678 >= 48 then
                                return "Crouched";
                            end;
                        elseif not v338.is_moving and v1678 >= 70 then
                            return "Standing";
                        end;
                        return nil;
                    end;
                else
                    if v338.is_crouched then
                        if v1675 and v1678 > -20 and v1679 < 250000 or v1674 then
                            return "Knife / Taser";
                        elseif v1678 > 160 then
                            return "Air & Crouched";
                        end;
                    end;
                    return nil;
                end;
            end;
        end;
    end;
    v986 = function(v1680)
        -- upvalues: l_v430_8 (ref)
        local v1681 = entity.get_local_player():get_player_weapon():get_weapon_info().weapon_name == "weapon_knife";
        if v1680 == "Knife / Taser" and v1681 then
            l_v430_8.pitch = "Down";
            l_v430_8.yaw_base = "At Target";
            l_v430_8.yaw = "Backward";
            l_v430_8.yaw_offset = 37;
            l_v430_8.yaw_left = 0;
            l_v430_8.yaw_right = 0;
            l_v430_8.yaw_modifier = "Disabled";
            l_v430_8.modifier_offset = 0;
            l_v430_8.inverter = false;
            l_v430_8.left_limit = 60;
            l_v430_8.right_limit = 60;
            l_v430_8.options = {};
            l_v430_8.body_freestanding = false;
            l_v430_8.extended_angles = false;
            return;
        else
            l_v430_8.pitch = "Down";
            l_v430_8.yaw_base = "At Target";
            l_v430_8.yaw = "Backward";
            l_v430_8.yaw_offset = 0;
            l_v430_8.yaw_left = 0;
            l_v430_8.yaw_right = 0;
            l_v430_8.yaw_modifier = "Disabled";
            l_v430_8.modifier_offset = 0;
            l_v430_8.inverter = false;
            l_v430_8.left_limit = 0;
            l_v430_8.right_limit = 0;
            l_v430_8.options = {};
            l_v430_8.body_freestanding = false;
            l_v430_8.extended_angles = false;
            return;
        end;
    end;
    do
        local l_l_v736_7_3, l_l_v985_3_3, l_v986_6 = l_v736_7, l_v985_3, v986;
        l_v735_6.update = function(_, _)
            -- upvalues: l_l_v985_3_3 (ref), l_l_v736_7_3 (ref), l_v986_6 (ref), l_v430_8 (ref), l_v488_12 (ref)
            local v1687 = entity.get_local_player();
            if v1687 == nil then
                return false;
            else
                local v1688 = entity.get_threat();
                if v1688 == nil then
                    return false;
                else
                    local v1689 = l_l_v985_3_3(v1687, v1688);
                    if v1689 == nil then
                        return false;
                    elseif not l_l_v736_7_3.select:get(v1689) then
                        return false;
                    else
                        l_v986_6(v1689);
                        l_v430_8.defensive = nil;
                        l_v488_12.defensive:update_safe_head();
                        return true;
                    end;
                end;
            end;
        end;
    end;
    l_v736_7 = {};
    l_v985_3 = v337.antiaim.vanish_mode;
    v986 = function()
        local v1690 = entity.get_game_rules();
        if v1690 == nil then
            return false;
        elseif not v1690.m_bWarmupPeriod then
            return false;
        else
            return true;
        end;
    end;
    l_v990_3 = function()
        local v1691 = entity.get_local_player();
        if v1691 == nil or not v1691:is_alive() then
            return false;
        else
            for v1692 = 1, 64 do
                local v1693 = entity.get(v1692);
                if v1693 ~= nil and v1693 ~= v1691 and v1693:is_enemy() and v1693:is_alive() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    do
        local l_l_v985_3_4, l_v986_7, l_l_v990_3_3, l_l_v992_2_3 = l_v985_3, v986, l_v990_3, l_v992_2;
        l_l_v992_2_3 = function()
            -- upvalues: l_l_v985_3_4 (ref), l_l_v990_3_3 (ref), l_v986_7 (ref)
            if l_l_v985_3_4.select:get("No Enemies") and l_l_v990_3_3() then
                return true;
            elseif l_l_v985_3_4.select:get("On Warmup") and l_v986_7() then
                return true;
            else
                return false;
            end;
        end;
        l_v736_7.update = function(_)
            -- upvalues: l_l_v992_2_3 (ref), l_v430_8 (ref)
            if not l_l_v992_2_3() then
                return false;
            else
                l_v430_8.enabled = true;
                l_v430_8.pitch = "Disabled";
                l_v430_8.yaw = "Backward";
                l_v430_8.yaw_type = "180";
                l_v430_8.yaw_offset = -globals.curtime * 2160 % 360;
                l_v430_8.yaw_left = 0;
                l_v430_8.yaw_right = 0;
                l_v430_8.yaw_modifier = "Disabled";
                l_v430_8.modifier_offset = 0;
                l_v430_8.body_yaw = false;
                l_v430_8.defensive = nil;
                return true;
            end;
        end;
    end;
    l_v985_3 = {};
    v986 = v337.antiaim.force_break_lc;
    l_v990_3 = function()
        -- upvalues: v7 (ref)
        v7.ragebot.double_tap_option:override();
        v7.ragebot.hide_shots_option:override();
    end;
    l_v992_2 = function()
        -- upvalues: v7 (ref)
        v7.ragebot.double_tap_option:override("Always On");
        v7.ragebot.hide_shots_option:override("Break LC");
    end;
    v997 = function()
        -- upvalues: v338 (ref)
        if not v338.is_onground and not v338.is_crouched then
            return "Air";
        elseif not v338.is_onground and v338.is_crouched then
            return "Air & Crouched";
        elseif v338.is_onground and v338.is_crouched then
            return "Crouching";
        else
            return nil;
        end;
    end;
    do
        local l_v986_8, l_l_v990_3_4, l_l_v992_2_4, l_v997_4 = v986, l_v990_3, l_v992_2, v997;
        l_v985_3.reset = function(_)
            -- upvalues: l_l_v990_3_4 (ref)
            l_l_v990_3_4();
        end;
        l_v985_3.update = function(_)
            -- upvalues: l_v997_4 (ref), l_v986_8 (ref), l_l_v992_2_4 (ref)
            local v1705 = entity.get_local_player();
            if v1705 == nil or not v1705:is_alive() then
                return;
            else
                local v1706 = l_v997_4();
                if v1706 == nil then
                    return;
                elseif not l_v986_8.select:get(v1706) then
                    return;
                else
                    l_l_v992_2_4();
                    return;
                end;
            end;
        end;
        events.shutdown(l_l_v990_3_4);
    end;
    v986 = {};
    l_v990_3 = v337.antiaim.animations;
    l_v992_2 = bit.lshift(1, 0);
    v997 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
    v1004 = 0;
    do
        local l_l_v990_3_5, l_l_v992_2_5, l_v997_5, l_v1004_4, l_v1012_4 = l_v990_3, l_v992_2, v997, v1004, v1012;
        l_v1012_4 = function(v1712)
            -- upvalues: l_v997_5 (ref)
            return ffi.cast(l_v997_5, ffi.cast("uintptr_t", v1712[0]) + 10640)[0];
        end;
        local function v1714()
            -- upvalues: l_l_v992_2_5 (ref), l_v1004_4 (ref)
            local v1713 = entity.get_local_player();
            if v1713 == nil then
                return;
            else
                if bit.band(v1713.m_fFlags, l_l_v992_2_5) ~= 0 then
                    l_v1004_4 = 0;
                else
                    l_v1004_4 = l_v1004_4 + globals.tickinterval;
                end;
                return;
            end;
        end;
        local function v1718(v1715)
            -- upvalues: l_l_v990_3_5 (ref), v338 (ref), v7 (ref)
            local v1716 = entity.get_local_player();
            if v1715 ~= v1716 then
                return;
            else
                local v1717 = l_l_v990_3_5.onground_legs:get();
                if v338.is_onground then
                    if v1717 == "Sliding" then
                        v1716.m_flPoseParameter[0] = 1;
                        v7.antiaim.misc.leg_movement:override("Sliding");
                        return;
                    elseif v1717 == "Jitter" then
                        v1716.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 1;
                        v7.antiaim.misc.leg_movement:override("Sliding");
                        return;
                    elseif v1717 == "Direction" then
                        v1716.m_flPoseParameter[7] = 0;
                        v7.antiaim.misc.leg_movement:override("Walking");
                    end;
                end;
                return;
            end;
        end;
        local function v1725(v1719)
            -- upvalues: l_v1012_4 (ref), l_l_v990_3_5 (ref), v338 (ref), l_v1004_4 (ref)
            local v1720 = entity.get_local_player();
            if v1719 ~= v1720 then
                return;
            elseif v1719:get_anim_state() == nil then
                return;
            else
                local v1721 = l_v1012_4(v1719);
                if v1721 == nil then
                    return;
                else
                    local v1722 = l_l_v990_3_5.in_air_legs:get();
                    if not v338.is_onground then
                        if v1722 == "Force" then
                            v1720.m_flPoseParameter[6] = 0.5;
                            return;
                        elseif v1722 == "Legacy" then
                            local v1723 = math.clamp(l_v1004_4, 0.75, 1.5);
                            v1720.m_flPoseParameter[6] = math.map(v1723, 0.7, 1.5, 0, 1);
                            return;
                        elseif v1722 == "Direction" then
                            local v1724 = v1721[6];
                            v1724.m_flWeight = 1;
                            v1724.m_flCycle = globals.curtime * 0.55 % 1;
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end;
        local function v1728(v1726)
            -- upvalues: l_v1012_4 (ref), v338 (ref)
            if v1726 ~= entity.get_local_player() then
                return;
            else
                local v1727 = v1726:get_anim_state();
                if v1727 == nil then
                    return;
                elseif l_v1012_4(v1726) == nil then
                    return;
                elseif v338.is_onground then
                    if v1727.landing then
                        v1726.m_flPoseParameter[12] = 0.5;
                    end;
                    return;
                else
                    return;
                end;
            end;
        end;
        local function v1732(v1729)
            -- upvalues: l_v1012_4 (ref), l_l_v990_3_5 (ref), v338 (ref)
            if v1729 ~= entity.get_local_player() then
                return;
            elseif v1729:get_anim_state() == nil then
                return;
            else
                local v1730 = l_v1012_4(v1729);
                if v1730 == nil then
                    return;
                else
                    local v1731 = l_l_v990_3_5.lean_amount:get();
                    if v1731 == 1 or not v338.is_moving then
                        return;
                    else
                        v1730[12].m_flWeight = v1731;
                        return;
                    end;
                end;
            end;
        end;
        local function v1733()
            -- upvalues: v7 (ref)
            v7.antiaim.misc.leg_movement:override();
        end;
        local _ = nil;
        local function v1737(v1735)
            -- upvalues: v1733 (ref), v1718 (ref)
            local v1736 = v1735:get() ~= "Disabled";
            if not v1736 then
                v1733();
            end;
            events.post_update_clientside_animation(v1718, v1736);
        end;
        local function v1740(v1738)
            -- upvalues: v1733 (ref), v1714 (ref), v1725 (ref)
            local v1739 = v1738:get() ~= "Disabled";
            if not v1739 then
                v1733();
            end;
            events.net_update_end(v1714, v1739);
            events.post_update_clientside_animation(v1725, v1739);
        end;
        local function v1742(v1741)
            -- upvalues: v1728 (ref)
            events.post_update_clientside_animation(v1728, v1741:get());
        end;
        local function v1746(v1743)
            -- upvalues: v1732 (ref)
            local v1744 = v1743:get();
            local v1745 = false;
            if v1744 > 1 then
                v1745 = true;
            end;
            events.post_update_clientside_animation(v1732, v1745);
        end;
        l_l_v990_3_5.onground_legs:set_callback(v1737, true);
        l_l_v990_3_5.in_air_legs:set_callback(v1740, true);
        l_l_v990_3_5.pitch_zero_on_land:set_callback(v1742, true);
        l_l_v990_3_5.lean_amount:set_callback(v1746, true);
    end;
    l_v990_3 = function(v1747)
        -- upvalues: l_v985_3 (ref), l_v488_12 (ref), l_v432_11 (ref), l_v734_7 (ref), l_v509_12 (ref), l_v733_7 (ref), l_v430_8 (ref), l_v736_7 (ref), l_v510_13 (ref), l_v511_12 (ref), l_v735_6 (ref)
        l_v985_3:reset();
        l_v488_12:update(v1747);
        l_v985_3:update();
        l_v432_11:update(v1747);
        local v1748 = l_v734_7:think(v1747);
        local v1749 = l_v509_12:think();
        l_v733_7:update(l_v430_8);
        if v1748 then
            l_v734_7:update(v1747, l_v430_8);
            return;
        elseif v1749 ~= nil then
            l_v509_12:update(v1747, l_v430_8, v1749);
            return;
        elseif l_v736_7:update() then
            return;
        else
            l_v510_13:update(v1747, l_v430_8);
            l_v511_12:update(v1747);
            l_v735_6:update(v1747);
            return;
        end;
    end;
    l_v992_2 = function(v1750)
        -- upvalues: l_v431_10 (ref)
        rage.antiaim:override_hidden_yaw_offset(0);
        if v1750.choked_commands == 0 then
            l_v431_10:update_regular_delays();
            l_v431_10:update_defensive_delays();
        end;
        l_v431_10:update_body_yaw();
        l_v431_10:update_yaw_jitter_modifiers();
        l_v431_10:update_yaw_jitter();
        l_v431_10:update_yaw_offset();
        l_v431_10:update_defensive();
    end;
    v997 = function()
        -- upvalues: l_v430_8 (ref)
        l_v430_8:unset();
    end;
    v1004 = function(v1751)
        -- upvalues: l_v430_8 (ref), l_v990_3 (ref), l_v992_2 (ref)
        l_v430_8:clear();
        l_v430_8:unset();
        l_v990_3(v1751);
        l_v992_2(v1751);
        l_v430_8:set();
    end;
    events.shutdown(v997);
    events.createmove(v1004);
end;
v430 = {};
v431 = {};
v432 = v337.visuals.logs;
v488 = {
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
v509 = {
    inferno = "Burned", 
    hegrenade = "Naded", 
    knife = "Knifed"
};
v510 = false;
v511 = false;
do
    local l_v432_12, l_v488_13, l_v509_13, l_v733_8, l_v734_8, l_v735_7, l_v736_8, l_v985_4, l_v986_9, l_v990_4, l_v992_3 = v432, v488, v509, v733, v734, v735, v736, v985, v986, v990, v992;
    l_v733_8 = function(v1763)
        -- upvalues: l_v488_13 (ref)
        return l_v488_13[v1763] or "?";
    end;
    l_v734_8 = function(v1764, v1765)
        local v1766 = 0;
        return (v1764:gsub("%${(.-)}", function(v1767)
            -- upvalues: v1766 (ref), v1765 (ref)
            v1766 = v1766 + 1;
            return string.format("\a%s%s\aDEFAULT", v1765[v1766], v1767);
        end));
    end;
    l_v735_7 = function(v1768)
        -- upvalues: l_v733_8 (ref), l_v432_12 (ref), l_v734_8 (ref)
        local l_target_1 = v1768.target;
        if l_target_1 == nil then
            return;
        else
            local v1770 = l_target_1:get_name();
            local l_hitchance_0 = v1768.hitchance;
            local l_backtrack_0 = v1768.backtrack;
            local l_m_iHealth_4 = l_target_1.m_iHealth;
            local l_damage_2 = v1768.damage;
            local l_hitgroup_0 = v1768.hitgroup;
            local l_wanted_damage_0 = v1768.wanted_damage;
            local l_wanted_hitgroup_0 = v1768.wanted_hitgroup;
            local v1778 = {};
            table.insert(v1778, string.format("bt: ${%dt}", l_backtrack_0));
            table.insert(v1778, string.format("hc: ${%d%%}", l_hitchance_0));
            v1778.dev = table.concat(v1778, " ");
            v1778.raw = table.concat(v1778, " ");
            local v1779 = {};
            local v1780 = string.format("${%d}", l_damage_2);
            local v1781 = string.format("${%s}", l_v733_8(l_hitgroup_0));
            local v1782 = ui.get_style()["Link Active"];
            local v1783 = nil;
            if l_v432_12.override_color:get() then
                v1783 = unpack(l_v432_12.color:get("Hit")):to_hex();
            else
                v1783 = v1782:to_hex();
            end;
            if l_damage_2 ~= l_wanted_damage_0 then
                v1780 = v1780 .. string.format("(${%d})", l_wanted_damage_0);
            end;
            if l_hitgroup_0 ~= l_wanted_hitgroup_0 then
                v1781 = v1781 .. string.format("(${%s})", l_v733_8(l_wanted_hitgroup_0));
            end;
            l_m_iHealth_4 = l_m_iHealth_4 == 0 and "${dead}" or string.format("${%s} hp remaining", l_m_iHealth_4);
            local v1784 = {
                [1] = v1783, 
                [2] = v1783, 
                [3] = v1783, 
                [4] = v1783, 
                [5] = v1783, 
                [6] = v1783, 
                [7] = v1783, 
                [8] = v1783, 
                [9] = v1783
            };
            local v1785 = string.format("Hit ${%s}'s %s for %s damage ~ %s (%s)", v1770, v1781, v1780, l_m_iHealth_4, v1778.dev);
            local v1786 = string.format("Hit ${%s}'s %s for %s damage ~ %s (%s)", v1770, v1781, v1780, l_m_iHealth_4, v1778.raw);
            v1779.dev = l_v734_8(v1785, v1784);
            v1779.raw = l_v734_8(v1786, v1784);
            if l_v432_12.console:get() then
                print_raw(v1779.raw);
            end;
            if l_v432_12.event:get() then
                print_dev(v1779.dev);
            end;
            return;
        end;
    end;
    l_v736_8 = function(v1787)
        -- upvalues: l_v733_8 (ref), l_v432_12 (ref), l_v734_8 (ref)
        local l_target_2 = v1787.target;
        if l_target_2 == nil then
            return;
        else
            local v1789 = l_target_2:get_name();
            local l_hitchance_1 = v1787.hitchance;
            local l_backtrack_1 = v1787.backtrack;
            local l_wanted_damage_1 = v1787.wanted_damage;
            local l_wanted_hitgroup_1 = v1787.wanted_hitgroup;
            local v1794 = {};
            table.insert(v1794, string.format("dmg: ${%s}", l_wanted_damage_1));
            table.insert(v1794, string.format("bt: ${%dt}", l_backtrack_1));
            table.insert(v1794, string.format("hc: ${%d%%}", l_hitchance_1));
            v1794.dev = table.concat(v1794, " ");
            v1794.raw = table.concat(v1794, " ");
            local v1795 = {};
            local v1796 = l_v733_8(l_wanted_hitgroup_1);
            local l_state_0 = v1787.state;
            local _ = ui.get_style()["Link Active"];
            local v1799 = nil;
            if l_v432_12.override_color:get() then
                v1799 = unpack(l_v432_12.color:get("Miss")):to_hex();
            else
                v1799 = color(251, 41, 75):to_hex();
            end;
            local v1800 = {
                [1] = v1799, 
                [2] = v1799, 
                [3] = v1799, 
                [4] = v1799, 
                [5] = v1799, 
                [6] = v1799
            };
            local v1801 = string.format("Missed ${%s}'s ${%s} due to ${%s} (%s)", v1789, v1796, l_state_0, v1794.dev);
            local v1802 = string.format("Missed ${%s}'s ${%s} due to ${%s} (%s)", v1789, v1796, l_state_0, v1794.raw);
            v1795.dev = l_v734_8(v1801, v1800);
            v1795.raw = l_v734_8(v1802, v1800);
            if l_v432_12.console:get() then
                print_raw(v1795.raw);
            end;
            if l_v432_12.event:get() then
                print_dev(v1795.dev);
            end;
            return;
        end;
    end;
    l_v985_4 = function(v1803)
        -- upvalues: l_v509_13 (ref), l_v432_12 (ref), l_v734_8 (ref)
        local v1804 = entity.get_local_player();
        local v1805 = entity.get(v1803.userid, true);
        local v1806 = entity.get(v1803.attacker, true);
        if v1804 == v1805 or v1804 ~= v1806 then
            return;
        else
            local v1807 = l_v509_13[v1803.weapon];
            if v1807 == nil then
                return;
            else
                local v1808 = v1805:get_name();
                local l_health_0 = v1803.health;
                local l_dmg_health_0 = v1803.dmg_health;
                local v1811 = {};
                local v1812 = ui.get_style()["Link Active"];
                local v1813 = nil;
                if l_v432_12.override_color:get() then
                    v1813 = unpack(l_v432_12.color:get("Hit")):to_hex();
                else
                    v1813 = v1812:to_hex();
                end;
                l_health_0 = l_health_0 == 0 and "${dead}" or string.format("${%s} hp remaining", l_health_0);
                local v1814 = {
                    [1] = v1813, 
                    [2] = v1813, 
                    [3] = v1813, 
                    [4] = v1813, 
                    [5] = v1813, 
                    [6] = v1813
                };
                local v1815 = string.format("%s ${%s} for ${%d} damage ~ %s", v1807, v1808, l_dmg_health_0, l_health_0);
                local v1816 = string.format("%s ${%s} for ${%d} damage ~ %s", v1807, v1808, l_dmg_health_0, l_health_0);
                v1811.dev = l_v734_8(v1815, v1814);
                v1811.raw = l_v734_8(v1816, v1814);
                if l_v432_12.console:get() then
                    print_raw(v1811.raw);
                end;
                if l_v432_12.event:get() then
                    print_dev(v1811.dev);
                end;
                return;
            end;
        end;
    end;
    l_v986_9 = function(v1817)
        -- upvalues: l_v432_12 (ref), l_v734_8 (ref)
        local l_userid_0 = v1817.userid;
        if l_userid_0 == nil then
            return;
        else
            local v1819 = l_userid_0:get_name();
            local v1820 = v1817.accuracy * 100;
            local v1821 = v1817.aim_point:lower();
            local l_health_1 = v1817.health;
            local l_dmg_health_1 = v1817.dmg_health;
            local l_hitbox_1 = v1817.hitbox;
            local l_aim_damage_0 = v1817.aim_damage;
            local _ = v1817.aim_hitbox;
            local v1827 = {};
            table.insert(v1827, string.format("mp: ${%s}", v1821));
            table.insert(v1827, string.format("hc: ${%d%%}", v1820));
            v1827.dev = table.concat(v1827, " ");
            v1827.raw = table.concat(v1827, " ");
            local v1828 = {};
            local v1829 = string.format("${%d}", l_dmg_health_1);
            local v1830 = string.format("${%s}", l_hitbox_1:lower());
            local v1831 = ui.get_style()["Link Active"];
            local v1832 = nil;
            if l_v432_12.override_color:get() then
                v1832 = unpack(l_v432_12.color:get("Hit")):to_hex();
            else
                v1832 = v1831:to_hex();
            end;
            if l_dmg_health_1 ~= l_aim_damage_0 then
                v1829 = v1829 .. string.format("(${%d})", l_aim_damage_0);
            end;
            l_health_1 = l_health_1 == 0 and "${dead}" or string.format("${%s} hp remaining", l_health_1);
            local v1833 = {
                [1] = v1832, 
                [2] = v1832, 
                [3] = v1832, 
                [4] = v1832, 
                [5] = v1832, 
                [6] = v1832, 
                [7] = v1832, 
                [8] = v1832, 
                [9] = v1832
            };
            local v1834 = string.format("Dormant hit ${%s}'s %s for %s damage ~ %s (%s)", v1819, v1830, v1829, l_health_1, v1827.dev);
            local v1835 = string.format("Dormant hit ${%s}'s %s for %s damage ~ %s (%s)", v1819, v1830, v1829, l_health_1, v1827.raw);
            v1828.dev = l_v734_8(v1834, v1833);
            v1828.raw = l_v734_8(v1835, v1833);
            if l_v432_12.console:get() then
                print_raw(v1828.raw);
            end;
            if l_v432_12.event:get() then
                print_dev(v1828.dev);
            end;
            return;
        end;
    end;
    l_v990_4 = function(v1836)
        -- upvalues: l_v432_12 (ref), l_v734_8 (ref)
        local l_userid_1 = v1836.userid;
        if l_userid_1 == nil then
            return;
        else
            local v1838 = l_userid_1:get_name();
            local v1839 = v1836.accuracy * 100;
            local v1840 = v1836.aim_point:lower();
            local l_aim_damage_1 = v1836.aim_damage;
            local l_aim_hitbox_1 = v1836.aim_hitbox;
            local v1843 = {};
            table.insert(v1843, string.format("dmg: ${%s}", l_aim_damage_1));
            table.insert(v1843, string.format("mp: ${%s}", v1840));
            table.insert(v1843, string.format("hc: ${%d%%}", v1839));
            v1843.dev = table.concat(v1843, " ");
            v1843.raw = table.concat(v1843, " ");
            local v1844 = {};
            local v1845 = l_aim_hitbox_1:lower();
            local v1846 = "dormant";
            local _ = ui.get_style()["Link Active"];
            local v1848 = nil;
            if l_v432_12.override_color:get() then
                v1848 = unpack(l_v432_12.color:get("Miss")):to_hex();
            else
                v1848 = color(251, 41, 75):to_hex();
            end;
            local v1849 = {
                [1] = v1848, 
                [2] = v1848, 
                [3] = v1848, 
                [4] = v1848, 
                [5] = v1848, 
                [6] = v1848, 
                [7] = v1848
            };
            local v1850 = string.format("Missed ${%s}'s ${%s} due to ${%s} (%s)", v1838, v1845, v1846, v1843.dev);
            local v1851 = string.format("Missed ${%s}'s ${%s} due to ${%s} (%s)", v1838, v1845, v1846, v1843.raw);
            v1844.dev = l_v734_8(v1850, v1849);
            v1844.raw = l_v734_8(v1851, v1849);
            if l_v432_12.console:get() then
                print_raw(v1844.raw);
            end;
            if l_v432_12.event:get() then
                print_dev(v1844.dev);
            end;
            return;
        end;
    end;
    l_v992_3 = function(v1852)
        -- upvalues: l_v736_8 (ref), l_v735_7 (ref)
        if v1852.state ~= nil then
            l_v736_8(v1852);
        else
            l_v735_7(v1852);
        end;
    end;
    v997 = nil;
    v1004 = function()
        -- upvalues: l_v432_12 (ref), l_v992_3 (ref), l_v985_4 (ref), l_v986_9 (ref), l_v990_4 (ref)
        local v1853 = l_v432_12.console:get() or l_v432_12.event:get();
        if v1853 then
            events.aim_ack:set(l_v992_3, v1853);
            events.player_hurt:set(l_v985_4, v1853);
            events.dormant_hit:set(l_v986_9, v1853);
            events.dormant_miss:set(l_v990_4, v1853);
        else
            events.aim_ack:unset(l_v992_3);
            events.player_hurt:unset(l_v985_4);
            events.dormant_hit:unset(l_v986_9);
            events.dormant_miss:unset(l_v990_4);
        end;
    end;
    l_v432_12.console:set_callback(v1004, true);
    l_v432_12.event:set_callback(v1004, true);
end;
v432 = {};
v488 = v337.visuals.indicators;
v509 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)");
v510 = {};
v511 = 1;
v733 = {
    alpha = 0, 
    align = 0, 
    hide_shots = 0, 
    double_tap = 0, 
    min_damage = 0
};
do
    local l_v488_14, l_v509_14, l_v510_14, l_v511_13, l_v733_9 = v488, v509, v510, v511, v733;
    v734 = function()
        -- upvalues: l_v488_14 (ref)
        local v1859 = nil;
        local v1860 = nil;
        if l_v488_14.override_style:get() then
            v1859 = l_v488_14.color:get("Release")[1];
            v1860 = color(255, 255, 255, 255);
        else
            v1859 = ui.get_style()["Link Active"];
            v1860 = color(255, 255, 255, 255);
        end;
        return v1859, v1860;
    end;
    v735 = function()
        -- upvalues: v338 (ref)
        if not v338.is_onground then
            return "air";
        elseif v338.is_crouched then
            return "crouch";
        elseif v338.is_moving then
            return "moving";
        else
            return "standing";
        end;
    end;
    do
        local l_l_v511_13_0, l_l_v733_9_0, l_v734_9, l_v735_8, l_v736_9, l_v985_5, l_v986_10, l_v990_5, l_v992_4, l_v997_6, l_v1004_5 = l_v511_13, l_v733_9, v734, v735, v736, v985, v986, v990, v992, v997, v1004;
        l_v736_9 = function()
            -- upvalues: l_v509_14 (ref), v98 (ref), v7 (ref), l_l_v733_9_0 (ref), v9 (ref)
            local v1872 = entity.get_local_player();
            if v1872 == nil then
                return;
            else
                local v1873 = v1872:get_player_weapon();
                if v1873 == nil then
                    return;
                else
                    local v1874 = v1873:get_weapon_info();
                    if v1874 == nil then
                        return;
                    else
                        local v1875 = 0;
                        local v1876 = 0;
                        if v1872 ~= nil and v1872:is_alive() then
                            v1875 = 1;
                            if v1872.m_bIsScoped then
                                v1876 = 1;
                            end;
                            if l_v509_14() or v1874.weapon_type == 9 then
                                v1875 = 0.2;
                            end;
                        end;
                        local v1877 = v98.get(v7.ragebot.minimum_damage);
                        l_l_v733_9_0.alpha = v9.interp(l_l_v733_9_0.alpha, v1875, 0.04);
                        l_l_v733_9_0.align = v9.interp(l_l_v733_9_0.align, v1876, 0.04);
                        l_l_v733_9_0.hide_shots = v9.interp(l_l_v733_9_0.hide_shots, v7.ragebot.hide_shots:get() and not v7.ragebot.double_tap:get(), 0.04);
                        l_l_v733_9_0.double_tap = v9.interp(l_l_v733_9_0.double_tap, v7.ragebot.double_tap:get(), 0.04);
                        l_l_v733_9_0.min_damage = v9.interp(l_l_v733_9_0.min_damage, v1877 ~= nil and v1877.active, 0.04);
                        return;
                    end;
                end;
            end;
        end;
        l_v985_5 = function(v1878, v1879, v1880)
            -- upvalues: l_l_v511_13_0 (ref), v6 (ref), l_l_v733_9_0 (ref), v9 (ref)
            local l_l_l_v511_13_0_0 = l_l_v511_13_0;
            local v1882 = "";
            local v1883 = v6.name:lower();
            local v1884 = render.measure_text(l_l_l_v511_13_0_0, v1882, v1883);
            local v1885 = v1878:clone();
            v1885.x = v1885.x + 1 - v1884.x * 0.5 * (1 - l_l_v733_9_0.align);
            v1883 = v9.wave(v1883, v1879, v1880, globals.realtime);
            render.text(l_l_l_v511_13_0_0, v1885, v1879, nil, v1883);
            v1878.y = v1878.y + v1884.y;
        end;
        l_v986_10 = function(v1886, v1887)
            -- upvalues: l_l_v511_13_0 (ref), l_v735_8 (ref), l_l_v733_9_0 (ref)
            local l_l_l_v511_13_0_1 = l_l_v511_13_0;
            local v1889 = "";
            local v1890 = l_v735_8();
            local v1891 = render.measure_text(l_l_l_v511_13_0_1, v1889, v1890);
            local v1892 = v1886:clone();
            v1892.x = v1892.x + 1 - v1891.x * 0.5 * (1 - l_l_v733_9_0.align);
            render.text(l_l_l_v511_13_0_1, v1892, v1887, nil, v1890);
            v1886.y = v1886.y + v1891.y;
        end;
        l_v990_5 = function(v1893, v1894, v1895)
            -- upvalues: l_l_v511_13_0 (ref), l_l_v733_9_0 (ref), v9 (ref)
            local v1896 = rage.exploit:get();
            local l_l_l_v511_13_0_2 = l_l_v511_13_0;
            local v1898 = "";
            local v1899 = "dt";
            local v1900 = render.measure_text(l_l_l_v511_13_0_2, v1898, v1899);
            local v1901 = v1893:clone();
            v1901.x = v1901.x + 1 - v1900.x * 0.5 * (1 - l_l_v733_9_0.align);
            local v1902 = v1894:clone();
            v1902.a = v1902.a * v1895;
            v1902.r = v9.lerp(255, v1902.r, v1896);
            v1902.g = v9.lerp(0, v1902.g, v1896);
            v1902.b = v9.lerp(50, v1902.b, v1896);
            render.text(l_l_l_v511_13_0_2, v1901, v1902, nil, v1899);
            v1893.y = v1893.y + v1900.y * v1895;
        end;
        l_v992_4 = function(v1903, v1904, v1905)
            -- upvalues: l_l_v511_13_0 (ref), l_l_v733_9_0 (ref)
            local l_l_l_v511_13_0_3 = l_l_v511_13_0;
            local v1907 = "";
            local v1908 = "hs";
            local v1909 = render.measure_text(l_l_l_v511_13_0_3, v1907, v1908);
            local v1910 = v1903:clone();
            v1910.x = v1910.x + 1 - v1909.x * 0.5 * (1 - l_l_v733_9_0.align);
            local v1911 = v1904:clone();
            v1911.a = v1911.a * v1905;
            render.text(l_l_l_v511_13_0_3, v1910, v1911, nil, v1908);
            v1903.y = v1903.y + v1909.y * v1905;
        end;
        l_v997_6 = function(v1912, v1913, v1914)
            -- upvalues: l_l_v511_13_0 (ref), l_l_v733_9_0 (ref)
            local l_l_l_v511_13_0_4 = l_l_v511_13_0;
            local v1916 = "";
            local v1917 = "dmg";
            local v1918 = render.measure_text(l_l_l_v511_13_0_4, v1916, v1917);
            local v1919 = v1912:clone();
            v1919.x = v1919.x + 1 - v1918.x * 0.5 * (1 - l_l_v733_9_0.align);
            local v1920 = v1913:clone();
            v1920.a = v1920.a * v1914;
            render.text(l_l_l_v511_13_0_4, v1919, v1920, nil, v1917);
            v1912.y = v1912.y + v1918.y * v1914;
        end;
        l_v1004_5 = function()
            -- upvalues: l_l_v733_9_0 (ref), l_v734_9 (ref), l_v985_5 (ref), l_v986_10 (ref), l_v990_5 (ref), l_v992_4 (ref), l_v997_6 (ref)
            if l_l_v733_9_0.alpha == 0 then
                return;
            else
                local v1921 = render.screen_size();
                local v1922, v1923 = l_v734_9();
                local v1924 = (v1921 / 2):floor();
                v1924.x = v1924.x + 10 * l_l_v733_9_0.align;
                v1924.y = v1924.y + 22;
                v1922.a = v1922.a * l_l_v733_9_0.alpha;
                v1923.a = v1923.a * l_l_v733_9_0.alpha;
                l_v985_5(v1924, v1922, v1923);
                l_v986_10(v1924, v1923:clone());
                l_v990_5(v1924, v1923:clone(), l_l_v733_9_0.double_tap);
                l_v992_4(v1924, v1923:clone(), l_l_v733_9_0.hide_shots);
                l_v997_6(v1924, v1923:clone(), l_l_v733_9_0.min_damage);
                return;
            end;
        end;
        l_v510_14.on_render = function()
            -- upvalues: l_v736_9 (ref), l_v1004_5 (ref)
            l_v736_9();
            l_v1004_5();
        end;
    end;
    l_v511_13 = {};
    l_v733_9 = 2;
    v734 = {
        alpha = 0, 
        align = 0, 
        exploit = 0, 
        fs_disabled = 0, 
        min_damage = 0, 
        state_width = 0, 
        exploit_width = 0
    };
    v735 = "";
    v736 = function()
        -- upvalues: v337 (ref), v7 (ref)
        if not v337.antiaim.freestanding.enabled:get() then
            return false;
        elseif v337.antiaim.freestanding.only_if_peek_assist:get() and not v7.ragebot.peek_assist:get() then
            return false;
        elseif v337.antiaim.manual_yaw.direction:get() == "Disabled" then
            return false;
        else
            return true;
        end;
    end;
    v985 = function()
        -- upvalues: l_v488_14 (ref)
        local v1925 = l_v488_14.color:get("Nightly");
        return v1925[1], v1925[2], (color());
    end;
    v986 = function(v1926, v1927)
        -- upvalues: v337 (ref), v6 (ref), v9 (ref)
        if v337.home.credits.sofa:get() then
            return string.format(v6.name:upper() .. " %s", v9.wave(ui.get_icon(v6.icon), v1926, v1927, globals.realtime));
        else
            return v9.wave("ALL  IN  ONE", v1926, v1927, globals.realtime);
        end;
    end;
    v990 = function()
        -- upvalues: v337 (ref), v338 (ref)
        if v337.antiaim.manual_yaw.direction:get() ~= "Disabled" then
            return "MANUAL";
        elseif not v338.is_onground then
            return "AIR";
        elseif v338.is_crouched then
            return "CROUCH";
        elseif v338.is_moving then
            return "MOVING";
        else
            return "STANDING";
        end;
    end;
    v992 = function(v1928)
        local v1929 = color(255, 64, 64);
        local v1930 = color(192, 255, 145);
        if v1928 == 0 then
            return "WAITING", v1929:clone();
        elseif v1928 > 0 and v1928 < 1 then
            return "CHARGING", v1929:lerp(v1930, v1928);
        else
            return "READY", v1930:clone();
        end;
    end;
    do
        local l_l_v733_9_1, l_v734_10, l_v735_9, l_v736_10, l_v985_6, l_v986_11, l_v990_6, l_v992_5, l_v997_7, l_v1004_6, l_v1012_5 = l_v733_9, v734, v735, v736, v985, v986, v990, v992, v997, v1004, v1012;
        l_v997_7 = function(v1942)
            -- upvalues: l_v735_9 (ref), l_v992_5 (ref), v8 (ref)
            local l_l_v735_9_0 = l_v735_9;
            local v1944 = nil;
            local v1945 = nil;
            local v1946, v1947 = l_v992_5(v1942);
            v1945 = v1947;
            v1944 = v1946;
            if v1944 ~= nil and v1945 ~= nil then
                return v8.merge(l_l_v735_9_0, " ", "\a", v1945:to_hex(), v1944);
            else
                return l_l_v735_9_0;
            end;
        end;
        l_v1004_6 = function()
            -- upvalues: v7 (ref)
            if v7.ragebot.double_tap:get() then
                return "DT";
            elseif v7.ragebot.hide_shots:get() then
                return "HIDE";
            else
                return nil;
            end;
        end;
        l_v1012_5 = function()
            return "FS \affffff80DISABLED";
        end;
        local function v1955()
            -- upvalues: l_v509_14 (ref), v98 (ref), v7 (ref), l_v1004_6 (ref), l_v734_10 (ref), v9 (ref), l_v736_10 (ref), l_v735_9 (ref)
            local v1948 = entity.get_local_player();
            if v1948 == nil then
                return;
            else
                local v1949 = v1948:get_player_weapon();
                if v1949 == nil then
                    return;
                else
                    local v1950 = v1949:get_weapon_info();
                    if v1950 == nil then
                        return;
                    else
                        local v1951 = 0;
                        local v1952 = 0;
                        if v1948 ~= nil and v1948:is_alive() then
                            v1951 = 1;
                            if v1948.m_bIsScoped then
                                v1952 = 1;
                            end;
                            if l_v509_14() or v1950.weapon_type == 9 then
                                v1951 = 0.2;
                            end;
                        end;
                        local v1953 = v98.get(v7.ragebot.minimum_damage);
                        local v1954 = l_v1004_6();
                        l_v734_10.alpha = v9.interp(l_v734_10.alpha, v1951, 0.04);
                        l_v734_10.align = v9.interp(l_v734_10.align, v1952, 0.04);
                        l_v734_10.exploit = v9.interp(l_v734_10.exploit, v1954 ~= nil, 0.04);
                        l_v734_10.fs_disabled = v9.interp(l_v734_10.fs_disabled, l_v736_10(), 0.04);
                        l_v734_10.min_damage = v9.interp(l_v734_10.min_damage, v1953 ~= nil and v1953.active, 0.04);
                        if v1954 ~= nil then
                            l_v735_9 = v1954;
                        end;
                        return;
                    end;
                end;
            end;
        end;
        local function v1965(v1956, v1957, v1958, v1959)
            -- upvalues: l_l_v733_9_1 (ref), l_v986_11 (ref), l_v734_10 (ref)
            local l_l_l_v733_9_1_0 = l_l_v733_9_1;
            local v1961 = "";
            local v1962 = l_v986_11(v1957, v1958);
            local v1963 = render.measure_text(l_l_l_v733_9_1_0, v1961, v1962);
            local v1964 = v1956:clone();
            v1964.x = v1964.x + 1 - v1963.x * 0.5 * (1 - l_v734_10.align);
            render.text(l_l_l_v733_9_1_0, v1964, v1959, nil, v1962);
            v1956.y = v1956.y + (v1963.y - 1);
        end;
        local function v1981(v1966, v1967)
            -- upvalues: l_l_v733_9_1 (ref), l_v990_6 (ref), l_v734_10 (ref), v9 (ref), v8 (ref)
            local v1968 = 1;
            local l_l_l_v733_9_1_1 = l_l_v733_9_1;
            local v1970 = "";
            local v1971 = l_v990_6();
            local v1972 = "\194\183";
            local v1973 = render.measure_text(l_l_l_v733_9_1_1, v1970, v1971);
            local v1974 = render.measure_text(l_l_l_v733_9_1_1, v1970, v1972);
            l_v734_10.state_width = v9.interp(l_v734_10.state_width, v1973.x, 0.04);
            if l_v734_10.state_width > v1973.x then
                l_v734_10.state_width = v1973.x;
            end;
            local v1975 = l_v734_10.state_width + (v1974.x + v1968) * 2;
            local v1976 = v1966:clone();
            v1976.x = v1976.x + 1 - v1975 * 0.5 * (1 - l_v734_10.align);
            local _ = nil;
            render.text(l_l_l_v733_9_1_1, v1976, v1967, nil, v1972);
            v1976.x = v1976.x + v1974.x + v1968;
            local _ = nil;
            local v1979 = v1976:clone();
            local v1980 = v1973:clone();
            v1980.x = v8.round(l_v734_10.state_width);
            render.push_clip_rect(v1979, v1979 + v1980);
            render.text(l_l_l_v733_9_1_1, v1976, v1967, nil, v1971);
            render.pop_clip_rect();
            v1976.x = v1976.x + v1980.x;
            v1976.x = v1976.x + v1968;
            v1979 = nil;
            render.text(l_l_l_v733_9_1_1, v1976, v1967, nil, v1972);
            v1966.y = v1966.y + (v1973.y - 1);
        end;
        local function v1996(v1982, v1983, v1984)
            -- upvalues: l_l_v733_9_1 (ref), l_v997_7 (ref), l_v734_10 (ref), v9 (ref)
            local v1985 = rage.exploit:get();
            local l_l_l_v733_9_1_2 = l_l_v733_9_1;
            local v1987 = "";
            local v1988 = l_v997_7(v1985);
            local v1989 = render.measure_text(l_l_l_v733_9_1_2, v1987, v1988);
            l_v734_10.exploit_width = v9.interp(l_v734_10.exploit_width, v1989.x, 0.04);
            if l_v734_10.exploit_width > v1989.x then
                l_v734_10.exploit_width = v1989.x;
            end;
            local v1990 = v1982:clone();
            v1990.x = v1990.x + 1 - l_v734_10.exploit_width * 0.5 * (1 - l_v734_10.align);
            local v1991 = v1983:clone();
            v1991.a = v1991.a * v1984;
            local _ = nil;
            local v1993 = v1990:clone();
            local v1994 = v1989:clone();
            local v1995 = v1991:clone();
            v1994.x = l_v734_10.exploit_width;
            v1995.a = v1995.a * 0.2;
            render.push_clip_rect(v1993, v1993 + v1994);
            render.text(l_l_l_v733_9_1_2, v1993, v1995, nil, v1988);
            render.pop_clip_rect();
            v1993 = nil;
            v1994 = v1990:clone();
            v1995 = v1989:clone();
            v1995.x = l_v734_10.exploit_width * v1985;
            render.push_clip_rect(v1994, v1994 + v1995);
            render.text(l_l_l_v733_9_1_2, v1994, v1991, nil, v1988);
            render.pop_clip_rect();
            v1982.y = v1982.y + (v1989.y - 1) * v1984;
        end;
        local function v2006(v1997, v1998, v1999)
            -- upvalues: l_l_v733_9_1 (ref), l_v1012_5 (ref), l_v734_10 (ref)
            local l_l_l_v733_9_1_3 = l_l_v733_9_1;
            local v2001 = "";
            local v2002 = l_v1012_5();
            local v2003 = render.measure_text(l_l_l_v733_9_1_3, v2001, v2002);
            local v2004 = v1997:clone();
            v2004.x = v2004.x + 1 - v2003.x * 0.5 * (1 - l_v734_10.align);
            local v2005 = v1998:clone();
            v2005.a = v2005.a * v1999;
            render.text(l_l_l_v733_9_1_3, v2004, v2005, nil, v2002);
            v1997.y = v1997.y + (v2003.y - 1) * v1999;
        end;
        local function v2016(v2007, v2008, v2009)
            -- upvalues: l_l_v733_9_1 (ref), l_v734_10 (ref)
            local l_l_l_v733_9_1_4 = l_l_v733_9_1;
            local v2011 = "";
            local v2012 = "DMG";
            local v2013 = render.measure_text(l_l_l_v733_9_1_4, v2011, v2012);
            local v2014 = v2007:clone();
            v2014.x = v2014.x + 1 - v2013.x * 0.5 * (1 - l_v734_10.align);
            local v2015 = v2008:clone();
            v2015.a = v2015.a * v2009;
            render.text(l_l_l_v733_9_1_4, v2014, v2015, nil, v2012);
            v2007.y = v2007.y + (v2013.y - 1) * v2009;
        end;
        local function v2022()
            -- upvalues: l_v734_10 (ref), l_v985_6 (ref), v1965 (ref), v1996 (ref), v2006 (ref), v2016 (ref), v1981 (ref)
            if l_v734_10.alpha == 0 then
                return;
            else
                local v2017 = render.screen_size();
                local v2018, v2019, v2020 = l_v985_6();
                local v2021 = (v2017 / 2):floor();
                v2021.x = v2021.x + 10 * l_v734_10.align;
                v2021.y = v2021.y + 22;
                v2018.a = v2018.a * l_v734_10.alpha;
                v2019.a = v2019.a * l_v734_10.alpha;
                v2020.a = v2020.a * l_v734_10.alpha;
                v1965(v2021, v2018, v2019, v2020);
                v1996(v2021, v2020:clone(), l_v734_10.exploit);
                v2006(v2021, v2020:clone(), l_v734_10.fs_disabled);
                v2016(v2021, v2020:clone(), l_v734_10.min_damage);
                v1981(v2021, v2020:clone());
                return;
            end;
        end;
        l_v511_13.on_render = function()
            -- upvalues: v1955 (ref), v2022 (ref)
            v1955();
            v2022();
        end;
    end;
    l_v733_9 = function()
        -- upvalues: l_v488_14 (ref), l_v510_14 (ref), l_v511_13 (ref)
        local v2023 = entity.get_local_player();
        if v2023 == nil then
            return;
        elseif not v2023:is_alive() then
            return;
        else
            local v2024 = "Release";
            if l_v488_14.override_style:get() then
                v2024 = l_v488_14.color:get();
            end;
            if v2024 == "Release" then
                l_v510_14.on_render();
            end;
            if v2024 == "Nightly" then
                l_v511_13.on_render();
            end;
            return;
        end;
    end;
    v734 = nil;
    v735 = function(v2025)
        -- upvalues: l_v733_9 (ref)
        events.render(l_v733_9, v2025:get());
    end;
    l_v488_14.crosshairs:set_callback(v735, true);
end;
v488 = {};
v509 = v337.visuals.indicators;
v510 = 1;
v511 = l_smoothy_0.new(0);
v733 = render.screen_size();
v734 = l_band_0.new("damage_indicator"):set_anchor(vector(0, 1)):set_pos(vector(v733.x * 0.5 + 12, v733.y * 0.5 - 12)):build();
do
    local l_v509_15, l_v510_15, l_v511_14, l_v734_11, l_v735_10, l_v736_11 = v509, v510, v511, v734, v735, v736;
    l_v735_10 = function()
        -- upvalues: l_v509_15 (ref), l_v510_15 (ref)
        if l_v509_15.color:get() == "Release" then
            l_v510_15 = 1;
        else
            l_v510_15 = 2;
        end;
        return l_v510_15;
    end;
    l_v736_11 = function()
        -- upvalues: l_v734_11 (ref), l_v511_14 (ref), v7 (ref), l_v735_10 (ref)
        local v2032 = entity.get_local_player();
        if v2032 == nil or not v2032:is_alive() then
            return;
        else
            local l_is_dragged_0 = l_v734_11.is_dragged;
            local v2034 = ui.get_alpha() > 0 and (l_is_dragged_0 and 0.5 or 1);
            local v2035 = l_v511_14(0.05, v2034);
            local v2036 = l_v734_11:get_pos();
            local v2037 = tostring(v7.ragebot.minimum_damage:get());
            local v2038 = l_v735_10();
            local v2039 = render.measure_text(v2038, "s", v2037) + vector(4, 4) * 2 + vector(1, 0);
            local v2040 = v2036 + v2039 * 0.5 + vector(1, 0);
            local v2041 = color(200, 200, 200, 128);
            v2041.a = v2041.a * v2035;
            render.rect_outline(v2036, v2036 + v2039, v2041, 1, 4);
            render.text(v2038, v2040, color(), "cs", v2037);
            l_v734_11:set_size(v2039);
            return;
        end;
    end;
    v985 = nil;
    v986 = function(v2042)
        -- upvalues: l_v736_11 (ref)
        local v2043 = v2042:get();
        events.render(l_v736_11, v2043);
    end;
    l_v509_15.damage:set_callback(v986, true);
end;
v509 = {};
v510 = v337.visuals.indicators;
v511 = v337.antiaim.manual_yaw;
v733 = "<svg width=\"44\" height=\"51\" viewBox=\"0 0 44 51\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><g clip-path=\"url(#clip0_263_2)\"><path d=\"M39.1994 0.427328L1.7819 23.2222C0.0196985 24.2955 0.022499 26.8231 1.7865 27.893L39.1885 50.5757C41.6589 52.0739 44.515 49.3119 43.044 46.8473L31.1677 26.9498C30.656 26.0926 30.655 25.0295 31.1649 24.1714L43.0625 4.14816C44.5286 1.68041 41.6668 -1.07609 39.1994 0.427328Z\" fill=\"white\"/><path d=\"M39.1994 0.427328L1.7819 23.2222C0.0196985 24.2955 0.022499 26.8231 1.7865 27.893L39.1885 50.5757C41.6589 52.0739 44.515 49.3119 43.044 46.8473L31.1677 26.9498C30.656 26.0926 30.655 25.0295 31.1649 24.1714L43.0625 4.14816C44.5286 1.68041 41.6668 -1.07609 39.1994 0.427328Z\" fill=\"white\"/></g><defs><clipPath id=\"clip0_263_2\"><rect width=\"44\" height=\"51\" fill=\"white\" transform=\"matrix(-1 0 0 1 44 0)\"/></clipPath></defs></svg>";
v734 = "<svg width=\"44\" height=\"51\" viewBox=\"0 0 44 51\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M4.80057 0.42733L42.2181 23.2222C43.9803 24.2955 43.9775 26.8231 42.2135 27.893L4.81149 50.5757C2.3411 52.0739 -0.515033 49.3119 0.956021 46.8473L12.8323 26.9498C13.344 26.0926 13.345 25.0295 12.8351 24.1714L0.937543 4.14816C-0.528614 1.68041 2.33319 -1.07609 4.80057 0.42733Z\" fill=\"white\"/><path d=\"M4.80057 0.42733L42.2181 23.2222C43.9803 24.2955 43.9775 26.8231 42.2135 27.893L4.81149 50.5757C2.3411 52.0739 -0.515033 49.3119 0.956021 46.8473L12.8323 26.9498C13.344 26.0926 13.345 25.0295 12.8351 24.1714L0.937543 4.14816C-0.528614 1.68041 2.33319 -1.07609 4.80057 0.42733Z\" fill=\"white\"/></svg>";
v735 = vector(15, 18);
v736 = render.load_image(v733, v735);
v985 = render.load_image(v734, v735);
v986 = cvar.cl_crosshairgap;
v990 = cvar.cl_crosshairsize;
do
    local l_v510_16, l_v511_15, l_v735_11, l_v736_12, l_v985_7, l_v986_12, l_v990_7, l_v992_6, l_v997_8, l_v1004_7, l_v1012_6 = v510, v511, v735, v736, v985, v986, v990, v992, v997, v1004, v1012;
    l_v992_6 = function()
        -- upvalues: l_v986_12 (ref), l_v990_7 (ref)
        local v2055 = l_v986_12:float() * 2;
        local v2056 = l_v990_7:float() * 2;
        if v2055 < 0 then
            v2055 = -v2055 / 2;
        end;
        v2056 = math.max(1, v2056);
        return math.floor(v2055 + v2056);
    end;
    l_v997_8 = function()
        -- upvalues: l_v992_6 (ref)
        return 38 + l_v992_6();
    end;
    l_v1004_7 = {};
    l_v1012_6 = render.load_font("Calibri Bold", vector(25, 23.5, 0), "a");
    do
        local l_l_v1012_6_0 = l_v1012_6;
        local function v2067()
            -- upvalues: l_v997_8 (ref), l_v511_15 (ref), l_l_v1012_6_0 (ref)
            local v2058 = render.screen_size() * 0.5;
            local v2059 = l_v997_8();
            local v2060 = l_v511_15.direction:get();
            if v2060 == "Left" then
                local v2061 = "<";
                local v2062 = render.measure_text(l_l_v1012_6_0, nil, v2061);
                local v2063 = vector(v2058.x - v2062.x - v2059 + 1, v2058.y - v2062.y * 0.5 + 1);
                render.text(l_l_v1012_6_0, v2063, color(), nil, v2061);
            end;
            if v2060 == "Right" then
                local v2064 = ">";
                local v2065 = render.measure_text(l_l_v1012_6_0, nil, v2064);
                local v2066 = vector(v2058.x + v2059, v2058.y - v2065.y * 0.5 + 1);
                render.text(l_l_v1012_6_0, v2066, color(), nil, v2064);
            end;
        end;
        l_v1004_7.on_render = function()
            -- upvalues: v2067 (ref)
            v2067();
        end;
    end;
    l_v1012_6 = {};
    local function v2076()
        -- upvalues: l_v997_8 (ref), l_v511_15 (ref), l_v735_11 (ref), l_v736_12 (ref), l_v985_7 (ref)
        local v2068 = render.screen_size() * 0.5;
        local v2069 = 0.75;
        local v2070 = l_v997_8();
        local v2071 = l_v511_15.direction:get();
        if v2071 == "Left" then
            local v2072 = l_v735_11 * v2069;
            local v2073 = vector(v2068.x - v2070 * 1.4, v2068.y);
            v2073.y = v2073.y - v2072.y * 0.5 + 1;
            render.texture(l_v736_12, v2073, v2072, color(), "f");
        end;
        if v2071 == "Right" then
            local v2074 = l_v735_11 * v2069;
            local v2075 = vector(v2068.x + v2070, v2068.y);
            v2075.y = v2075.y - v2074.y * 0.5 + 1;
            render.texture(l_v985_7, v2075, v2074, color(), "f");
        end;
    end;
    do
        local l_v2076_0 = v2076;
        l_v1012_6.on_render = function()
            -- upvalues: l_v2076_0 (ref)
            l_v2076_0();
        end;
    end;
    v2076 = function()
        -- upvalues: l_v510_16 (ref), l_v1004_7 (ref), l_v1012_6 (ref)
        local v2078 = entity.get_local_player();
        if v2078 == nil then
            return;
        elseif not v2078:is_alive() then
            return;
        else
            local v2079 = "Release";
            if l_v510_16.override_style:get() then
                v2079 = l_v510_16.color:get();
            end;
            if v2079 == "Release" then
                l_v1004_7.on_render();
            end;
            if v2079 == "Nightly" then
                l_v1012_6.on_render();
            end;
            return;
        end;
    end;
    local _ = nil;
    local function v2083(v2081)
        -- upvalues: v2076 (ref)
        local v2082 = v2081:get();
        events.render(v2076, v2082);
    end;
    l_v510_16.manual:set_callback(v2083, true);
end;
v510 = {};
v511 = v337.visuals.overlay_markers;
v733 = function(v2084, v2085, v2086, v2087)
    local _ = nil;
    local v2089 = vector(v2084.x - v2085, v2084.y - v2085);
    local v2090 = vector(v2084.x - v2086, v2084.y - v2086);
    render.line(v2089, v2090, v2087);
    v2089 = nil;
    v2090 = vector(v2084.x + v2085, v2084.y - v2085);
    local v2091 = vector(v2084.x + v2086, v2084.y - v2086);
    render.line(v2090, v2091, v2087);
    v2090 = nil;
    v2091 = vector(v2084.x - v2085, v2084.y + v2085);
    local v2092 = vector(v2084.x - v2086, v2084.y + v2086);
    render.line(v2091, v2092, v2087);
    v2091 = nil;
    v2092 = vector(v2084.x + v2085, v2084.y + v2085);
    local v2093 = vector(v2084.x + v2086, v2084.y + v2086);
    render.line(v2092, v2093, v2087);
end;
do
    local l_v511_16, l_v733_10, l_v734_12 = v511, v733, v734;
    l_v734_12 = function()
        -- upvalues: v7 (ref), l_v511_16 (ref)
        v7.world.world_marker:override();
        v7.world.damage_marker:override();
        if l_v511_16.marker3d:get() then
            v7.world.world_marker:override(false);
        end;
        if l_v511_16.damage:get() then
            v7.world.damage_marker:override(false);
        end;
    end;
    v735 = {};
    v736 = 0;
    v985 = 0;
    v986 = nil;
    v990 = function()
        -- upvalues: l_v511_16 (ref)
        return l_v511_16.marker2d:get();
    end;
    do
        local l_v736_13, l_v985_8, l_v986_13, l_v990_8, l_v992_7, l_v997_9, l_v1004_8, l_v1012_7 = v736, v985, v986, v990, v992, v997, v1004, v1012;
        l_v992_7 = function()
            -- upvalues: l_v990_8 (ref), l_v985_8 (ref), l_v736_13 (ref), v9 (ref)
            if not l_v990_8() then
                return;
            else
                l_v985_8 = math.max(l_v985_8 - globals.frametime, 0);
                if l_v985_8 == 0 then
                    l_v736_13 = v9.interp(l_v736_13, 0, 0.075);
                end;
                return;
            end;
        end;
        l_v997_9 = function()
            -- upvalues: l_v990_8 (ref), l_v736_13 (ref), l_v511_16 (ref), l_v986_13 (ref), l_v733_10 (ref)
            if not l_v990_8() then
                return;
            elseif l_v736_13 == 0 then
                return;
            else
                if l_v511_16.override_color:get() then
                    l_v986_13 = unpack(l_v511_16.color:get("2D"));
                else
                    l_v986_13 = color(255, 255, 255, 255);
                end;
                l_v986_13.a = l_v986_13.a * l_v736_13;
                local v2105 = render.screen_size() * 0.5;
                local v2106 = 3 + 1 * l_v736_13;
                local v2107 = 4 + 2 * l_v736_13 + v2106;
                l_v733_10(v2105, v2106, v2107, l_v986_13);
                return;
            end;
        end;
        l_v1004_8 = function()
            -- upvalues: l_v736_13 (ref), l_v985_8 (ref)
            l_v736_13 = 0;
            l_v985_8 = 0;
        end;
        l_v1012_7 = function(v2108)
            -- upvalues: l_v990_8 (ref), l_v736_13 (ref), l_v985_8 (ref)
            if not l_v990_8() then
                return;
            else
                local v2109 = entity.get_local_player();
                if v2109 == nil then
                    return;
                else
                    local _ = entity.get(v2108.userid, true);
                    if v2109 ~= entity.get(v2108.attacker, true) then
                        return;
                    else
                        l_v736_13 = 1;
                        l_v985_8 = 0.5;
                        return;
                    end;
                end;
            end;
        end;
        local function v2111()
            -- upvalues: l_v992_7 (ref), l_v997_9 (ref)
            l_v992_7();
            l_v997_9();
        end;
        local _ = nil;
        local function v2114(v2113)
            -- upvalues: v2111 (ref), l_v1012_7 (ref), l_v734_12 (ref), l_v1004_8 (ref)
            if v2113:get() then
                events.render(v2111, true);
                events.player_hurt(l_v1012_7, true);
                l_v734_12();
            end;
            events.on_shutdown(l_v1004_8);
        end;
        l_v511_16.marker2d:set_callback(v2114, true);
    end;
    v736 = {};
    v985 = {};
    v986 = nil;
    v990 = function()
        -- upvalues: l_v511_16 (ref)
        return l_v511_16.marker3d:get();
    end;
    do
        local l_v985_9, l_v986_14, l_v990_9, l_v992_8, l_v997_10, l_v1004_9, l_v1012_8 = v985, v986, v990, v992, v997, v1004, v1012;
        l_v992_8 = function(v2122)
            -- upvalues: l_v985_9 (ref)
            local v2123 = {
                pos = v2122, 
                alpha = 1, 
                clock = 1
            };
            l_v985_9[#l_v985_9 + 1] = v2123;
        end;
        l_v997_10 = function()
            -- upvalues: l_v990_9 (ref), l_v985_9 (ref), v9 (ref)
            if not l_v990_9() then
                return;
            else
                for v2124 = #l_v985_9, 1, -1 do
                    local v2125 = l_v985_9[v2124];
                    v2125.clock = math.max(v2125.clock - globals.frametime, 0);
                    if v2125.clock == 0 then
                        v2125.alpha = v9.interp(v2125.alpha, 0, 0.075);
                        if v2125.alpha == 0 then
                            table.remove(l_v985_9, v2124);
                        end;
                    end;
                end;
                return;
            end;
        end;
        l_v1004_9 = function()
            -- upvalues: l_v990_9 (ref), l_v511_16 (ref), l_v986_14 (ref), l_v985_9 (ref), l_v733_10 (ref)
            if not l_v990_9() then
                return;
            else
                if l_v511_16.override_color:get() then
                    l_v986_14 = unpack(l_v511_16.color:get("3D"));
                else
                    l_v986_14 = color(255, 255, 255, 255);
                end;
                local v2126 = 2;
                local v2127 = v2126 + 3;
                for v2128 = 1, #l_v985_9 do
                    local v2129 = l_v985_9[v2128];
                    local v2130 = render.world_to_screen(v2129.pos);
                    if v2130 ~= nil then
                        local v2131 = l_v986_14:clone();
                        v2131.a = v2131.a * v2129.alpha;
                        l_v733_10(v2130, v2126, v2127, v2131);
                    end;
                end;
                return;
            end;
        end;
        l_v1012_8 = function()
            -- upvalues: l_v985_9 (ref)
            table_clear(l_v985_9);
        end;
        local function v2133(v2132)
            -- upvalues: l_v990_9 (ref), l_v992_8 (ref)
            if not l_v990_9() then
                return;
            elseif entity.get_local_player() == nil then
                return;
            else
                l_v992_8(v2132.aim);
                return;
            end;
        end;
        local function v2135(v2134)
            -- upvalues: v2133 (ref)
            if v2134.state == nil then
                v2133(v2134);
            end;
        end;
        local function v2136()
            -- upvalues: l_v997_10 (ref), l_v1004_9 (ref)
            l_v997_10();
            l_v1004_9();
        end;
        local _ = nil;
        local function v2139(v2138)
            -- upvalues: v2136 (ref), v2135 (ref), l_v734_12 (ref), l_v1012_8 (ref)
            if v2138:get() then
                events.render(v2136, true);
                events.aim_ack(v2135, true);
                l_v734_12();
            end;
            events.on_shutdown(l_v1012_8);
        end;
        l_v511_16.marker3d:set_callback(v2139, true);
    end;
    v985 = {};
    v986 = 2;
    v990 = 1600;
    v992 = 1;
    v997 = {};
    v1004 = nil;
    v1012 = nil;
    local v2140 = nil;
    local v2141 = {
        inferno = true, 
        hegrenade = true, 
        knife = true
    };
    do
        local l_v986_15, l_v990_10, l_v992_9, l_v997_11, l_v1004_10, l_v1012_9, l_v2140_0, l_v2141_0 = v986, v990, v992, v997, v1004, v1012, v2140, v2141;
        local function v2152(v2150, v2151)
            -- upvalues: l_v990_10 (ref)
            if v2150 == nil then
                return false;
            elseif v2150.clock <= 0 then
                return false;
            elseif v2150.pos:distsqr(v2151) > l_v990_10 then
                return false;
            else
                return true;
            end;
        end;
        local function v2153()
            -- upvalues: l_v511_16 (ref)
            return l_v511_16.damage:get();
        end;
        local function v2159(v2154, v2155)
            -- upvalues: v2152 (ref), l_v1004_10 (ref), l_v986_15 (ref), l_v997_11 (ref)
            if v2152(l_v1004_10, v2154) then
                local l_damage_3 = l_v1004_10.damage;
                local v2157 = l_damage_3 + v2155;
                l_v1004_10.clock = l_v986_15;
                l_v1004_10.value = l_damage_3;
                l_v1004_10.damage = v2157;
                return;
            else
                local v2158 = {
                    pos = v2154, 
                    height = 0, 
                    value = 0, 
                    damage = v2155, 
                    alpha = 1, 
                    clock = l_v986_15
                };
                l_v997_11[#l_v997_11 + 1] = v2158;
                l_v1004_10 = v2158;
                return;
            end;
        end;
        local function v2160()
            -- upvalues: l_v997_11 (ref)
            table_clear(l_v997_11);
        end;
        local function v2163(v2161)
            -- upvalues: v2153 (ref), l_v2141_0 (ref), v2159 (ref)
            if not v2153() then
                return;
            elseif not l_v2141_0[v2161.weapon] then
                return;
            else
                local v2162 = entity.get(v2161.userid, true);
                if v2162 == nil then
                    return;
                else
                    v2159(v2162:get_eye_position(), v2161.dmg_health);
                    return;
                end;
            end;
        end;
        local function v2165(v2164)
            -- upvalues: v2153 (ref), v2159 (ref)
            if not v2153() then
                return;
            elseif v2164.damage == nil then
                return;
            else
                v2159(v2164.aim:clone(), v2164.damage);
                return;
            end;
        end;
        local function v2167(v2166)
            -- upvalues: v2165 (ref)
            if entity.get_local_player() == nil then
                return;
            else
                if v2166.state == nil then
                    v2165(v2166);
                end;
                return;
            end;
        end;
        local function v2172()
            -- upvalues: v2153 (ref), l_v997_11 (ref), v9 (ref)
            if not v2153() then
                return;
            else
                local l_frametime_3 = globals.frametime;
                for v2169 = #l_v997_11, 1, -1 do
                    local v2170 = l_v997_11[v2169];
                    local v2171 = v2170.value / v2170.damage;
                    v2170.clock = math.max(v2170.clock - l_frametime_3, 0);
                    v2170.value = math.min(v2170.value + v2170.damage * l_frametime_3, v2170.damage);
                    v2170.pos.z = v2170.pos.z + l_frametime_3 * v9.lerp(1, 0.15, v2171) * 80;
                    if v2170.clock == 0 then
                        v2170.alpha = v9.interp(v2170.alpha, 0, 0.075);
                        if v2170.alpha == 0 then
                            table.remove(l_v997_11, v2169);
                        end;
                    end;
                end;
                return;
            end;
        end;
        local function v2181()
            -- upvalues: v2153 (ref), l_v511_16 (ref), l_v1012_9 (ref), l_v2140_0 (ref), l_v997_11 (ref), l_v992_9 (ref)
            if not v2153() then
                return;
            else
                if l_v511_16.override_color:get() then
                    local v2173, v2174 = unpack(l_v511_16.color:get("Damage"));
                    l_v2140_0 = v2174;
                    l_v1012_9 = v2173;
                else
                    local v2175 = color(255, 255, 255, 255);
                    l_v2140_0 = color(255, 255, 255, 255);
                    l_v1012_9 = v2175;
                end;
                for v2176 = 1, #l_v997_11 do
                    local v2177 = l_v997_11[v2176];
                    local v2178 = render.world_to_screen(v2177.pos);
                    if v2178 ~= nil then
                        local v2179 = v2177.value / v2177.damage;
                        local v2180 = l_v1012_9:lerp(l_v2140_0, v2179);
                        v2180.a = v2180.a * v2177.alpha;
                        render.text(l_v992_9, v2178, v2180, "c", string.format("%d", v2177.value));
                    end;
                end;
                return;
            end;
        end;
        local function v2182()
            -- upvalues: v2172 (ref), v2181 (ref)
            v2172();
            v2181();
        end;
        local _ = nil;
        local function v2185(v2184)
            -- upvalues: v2182 (ref), v2167 (ref), v2163 (ref), l_v734_12 (ref), v2160 (ref)
            if v2184:get() then
                events.render(v2182, true);
                events.aim_ack(v2167, true);
                events.player_hurt(v2163, true);
                l_v734_12();
            end;
            events.on_shutdown(v2160);
        end;
        l_v511_16.damage:set_callback(v2185, true);
    end;
end;
v511 = {};
v733 = v337.visuals.gamesense_indicators;
v734 = 480;
v735 = 8;
v736 = 24;
v985 = 28;
v986 = 4;
v990 = 5;
v992 = render.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v997 = {};
v997.__index = v997;
v997.new = function(v2186, v2187, v2188)
    return setmetatable({
        id = v2187, 
        size = v2188
    }, v2186);
end;
v997.draw = function(v2189, v2190, v2191, ...)
    render.texture(v2189.id, v2190, v2189.size, v2191, ...);
end;
v1004 = {};
v1012 = 0;
local v2192 = 0;
local v2193 = 0;
local v2194 = {
    bomb = v997:new(render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(32, 32)), vector(32, 29))
};
do
    local l_v733_11, l_v734_13, l_v735_12, l_v736_14, l_v985_10, l_v986_16, l_v990_11, l_v992_10, l_v1004_11, l_v1012_10, l_v2192_0, l_v2193_0, l_v2194_0 = v733, v734, v735, v736, v985, v986, v990, v992, v1004, v1012, v2192, v2193, v2194;
    local function v2209()
        -- upvalues: l_v1004_11 (ref)
        for v2208 = 1, #l_v1004_11 do
            l_v1004_11[v2208] = nil;
        end;
    end;
    local function v2215(v2210)
        -- upvalues: l_v1004_11 (ref), l_v992_10 (ref), l_v986_16 (ref), l_v734_13 (ref), l_v735_12 (ref)
        local v2211 = l_v1004_11[#l_v1004_11];
        local v2212 = render.screen_size();
        local v2213 = render.measure_text(l_v992_10, nil, v2210.text);
        v2213.y = v2213.y + l_v986_16 * 2;
        local v2214 = v2211 == nil and v2212.y - (v2212.y - l_v734_13) / 2 or v2211.offset - l_v735_12 - v2213.y;
        v2210.offset = v2214;
        v2210.text_size = v2213;
        table.insert(l_v1004_11, v2210);
        return v2214;
    end;
    local function v2219(v2216, v2217, v2218, ...)
        -- upvalues: v2215 (ref)
        v2217 = table.concat({
            v2217, 
            ...
        });
        return v2215({
            icon = v2218, 
            text = v2217, 
            color = v2216
        });
    end;
    local function v2225(v2220, v2221)
        local v2222 = 0.5;
        local v2223 = 0.5;
        if v2221 > 0 then
            local v2224 = v2220 * v2222;
            if v2221 < (v2220 - v2224) * v2223 then
                v2224 = v2220 - v2221 * (1 / v2223);
            end;
            v2220 = v2224;
        end;
        return v2220;
    end;
    local function v2229(v2226)
        if v2226 == nil then
            return nil;
        elseif not v2226:is_alive() then
            local l_m_iObserverMode_0 = v2226.m_iObserverMode;
            local l_m_hObserverTarget_0 = v2226.m_hObserverTarget;
            if l_m_hObserverTarget_0 ~= nil and l_m_iObserverMode_0 ~= 6 then
                return l_m_hObserverTarget_0;
            else
                return nil;
            end;
        else
            return v2226;
        end;
    end;
    local function v2237(v2230, v2231)
        -- upvalues: v2225 (ref)
        local v2232 = 1;
        local v2233 = 500;
        local v2234 = v2233 * 3.5 / 3;
        local v2235 = (v2231:get_origin() - v2230:get_eye_position()):length();
        local v2236 = v2233 * math.exp(-v2235 * v2235 / (2 * v2234 * v2234)) * v2232;
        return v2225(v2236, v2230.m_ArmorValue);
    end;
    local function v2275(v2238)
        -- upvalues: v7 (ref), v337 (ref), v98 (ref), l_v733_11 (ref), v2219 (ref), l_v2193_0 (ref)
        local v2239 = v7.ragebot.double_tap:get();
        local v2240 = v7.ragebot.hide_shots:get();
        local v2241 = v7.antiaim.misc.fake_duck:get();
        local v2242 = v7.antiaim.angles.freestanding:get() or v337.antiaim.freestanding.enabled:get();
        local v2243 = v98.get(v7.ragebot.safe_points);
        local v2244 = v2243 ~= nil and v2243.active;
        local v2245 = v98.get(v7.ragebot.body_aim);
        local v2246 = v2245 ~= nil and v2245.active;
        local v2247 = v98.get(v7.ragebot.minimum_damage);
        local v2248 = v2247 ~= nil and v2247.active;
        local v2249 = v98.get(v7.ragebot.hitchance);
        local v2250 = v2249 ~= nil and v2249.active;
        local v2251 = v7.ragebot.dormant_aimbot:get() or v337.ragebob.dormant_aimbot.enabled:get();
        local v2252 = entity.get_threat() and entity.get_threat():is_dormant();
        local v2253 = v337.ragebob.peek_bot.enabled:get();
        if v2239 then
            v2240 = false;
        end;
        if v2241 then
            v2239 = false;
            v2240 = false;
        end;
        local v2254 = nil;
        if l_v733_11.override_color:get() then
            v2254 = l_v733_11.color:get("Accent")[1];
        else
            v2254 = color(255, 255, 255, 200);
        end;
        if l_v733_11.select:get("Fake Latency") then
            local v2255 = utils.net_channel();
            if v2255 ~= nil then
                local v2256 = nil;
                local v2257 = nil;
                local v2258 = v7.misc.fake_latency:get_override() or v7.misc.fake_latency:get();
                local v2259 = math.clamp(v2255.latency[0] + v2255.latency[1], 0.001, 0.2);
                local v2260 = math.clamp(v2258 * 0.001 + v2255.avg_latency[1], 0.001, 0.2);
                local v2261 = math.clamp(v2259 / v2260, 0, 1);
                if v2261 < 0.5 then
                    v2257 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v2261 * 2);
                else
                    v2257 = color(213, 197, 84, 255):lerp(color(123, 194, 21, 255), (v2261 - 0.5) * 2);
                end;
                if l_v733_11.icon:get() then
                    v2256 = ui.get_icon("chart-mixed");
                end;
                v2219(v2257, "PING", v2256);
            end;
        end;
        if l_v733_11.select:get("Double Tap") and v2239 then
            local v2262 = color(255, 0, 50, 255);
            local v2263 = nil;
            if rage.exploit:get() == 1 then
                v2262 = v2254;
            end;
            if l_v733_11.icon:get() then
                if rage.exploit:get() == 1 then
                    v2263 = ui.get_icon("xing");
                else
                    v2263 = ui.get_icon("xmark-large");
                end;
            end;
            v2219(v2262, "DT", v2263);
        end;
        if l_v733_11.select:get("Hide Shots") and v2240 then
            local v2264 = nil;
            if l_v733_11.icon:get() then
                v2264 = ui.get_icon("shield");
            end;
            v2219(v2254, "OSAA", v2264);
        end;
        if l_v733_11.select:get("Fake Duck") and v2241 then
            v2219(v2254, "DUCK");
        end;
        if l_v733_11.select:get("Freestanding") and v2242 then
            local v2265 = nil;
            if l_v733_11.icon:get() then
                v2265 = ui.get_icon("retweet");
            end;
            v2219(v2254, "FS", v2265);
        end;
        if l_v733_11.select:get("Safe Point") and v2244 then
            v2219(v2254, "SAFE");
        end;
        if l_v733_11.select:get("Body Aim") and v2246 then
            v2219(v2254, "BODY");
        end;
        if l_v733_11.select:get("Min. Damage Override") and v2248 then
            local v2266 = nil;
            if l_v733_11.icon:get() then
                v2266 = ui.get_icon("crosshairs-simple");
            end;
            v2219(v2254, "MD", v2266);
        end;
        if l_v733_11.select:get("Hit Chance Override") and v2250 then
            local v2267 = nil;
            if l_v733_11.icon:get() then
                v2267 = ui.get_icon("circle-xmark");
            end;
            v2219(v2254, "HC", v2267);
        end;
        if l_v733_11.select:get("Dormant Aimbot") and v2251 then
            local v2268 = color(255, 0, 50, 255);
            local v2269 = nil;
            if v2252 then
                v2268 = v2254;
            end;
            if l_v733_11.icon:get() then
                if v2252 then
                    v2269 = ui.get_icon("bolt");
                else
                    v2269 = ui.get_icon("bolt-slash");
                end;
            end;
            v2219(v2268, "DA", v2269);
        end;
        if l_v733_11.select:get("Peek Bot") and v2253 then
            local v2270 = nil;
            if l_v733_11.icon:get() then
                v2270 = ui.get_icon("splotch");
            end;
            v2219(v2254, "PB", v2270);
        end;
        if l_v733_11.select:get("Aimbot Statistics") then
            local v2271 = nil;
            if l_v733_11.icon:get() then
                v2271 = ui.get_icon("chart-simple");
            end;
            v2219(v2254, l_v2193_0 .. "%", v2271);
        end;
        if l_v733_11.select:get("Velocity Warning") then
            local l_m_flVelocityModifier_0 = v2238.m_flVelocityModifier;
            if l_m_flVelocityModifier_0 < 1 then
                local v2273 = nil;
                local v2274 = nil;
                if l_m_flVelocityModifier_0 < 0.5 then
                    v2273 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), l_m_flVelocityModifier_0 * 2);
                else
                    v2273 = color(213, 197, 84, 255):lerp(color(123, 194, 21, 255), (l_m_flVelocityModifier_0 - 0.5) * 2);
                end;
                if l_v733_11.icon:get() then
                    v2274 = ui.get_icon("triangle-exclamation");
                end;
                v2219(v2273, "SLOW", v2274);
            end;
        end;
    end;
    local function v2285(v2276, v2277)
        -- upvalues: v2215 (ref), l_v2194_0 (ref)
        local v2278 = v2277:get_player_weapon();
        if v2278 == nil then
            return;
        elseif not v2278.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v2278.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v2280 = v2277:get_origin();
                local l_m_bombsiteCenterA_0 = v2276.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v2276.m_bombsiteCenterB;
                local v2283 = v2280:distsqr(l_m_bombsiteCenterA_0) < v2280:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v2284 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v2215({
                    text = v2283, 
                    color = color(252, 243, 105, 255), 
                    progress = 1 - v2284, 
                    draw_cmd = l_v2194_0.bomb_c4
                });
                return;
            end;
        end;
    end;
    local function v2301(v2286, v2287)
        -- upvalues: v2215 (ref), l_v733_11 (ref), l_v2194_0 (ref), v2237 (ref), v2219 (ref)
        local l_m_bBombDefused_0 = v2287.m_bBombDefused;
        if not v2287.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_1 = globals.curtime;
            local l_m_flC4Blow_0 = v2287.m_flC4Blow;
            local v2291 = l_m_flC4Blow_0 - l_curtime_1;
            if v2291 > 0 then
                if v2287.m_hBombDefuser ~= nil then
                    local v2292 = render.screen_size();
                    local l_m_flDefuseCountDown_0 = v2287.m_flDefuseCountDown;
                    local v2294 = (l_m_flDefuseCountDown_0 - l_curtime_1) / 10;
                    local v2295 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v2296 = v2292.y - 2;
                    local v2297 = v2296 * v2294;
                    render.rect(vector(0, 0), vector(20, v2292.y), color(0, 0, 0, 115));
                    render.rect(vector(1, 1 + v2296 - v2297), vector(19, v2292.y - 1), v2295);
                end;
                local v2298 = string.format("%s - %.1fs", v2287.m_nBombSite == 1 and "B" or "A", v2291);
                v2215({
                    text = v2298, 
                    color = l_v733_11.color:get("Accent")[1], 
                    draw_cmd = l_v2194_0.bomb
                });
            end;
            if v2286 ~= nil then
                local l_m_iHealth_5 = v2286.m_iHealth;
                local v2300 = v2237(v2286, v2287);
                v2300 = math.floor(v2300);
                if l_m_iHealth_5 <= v2300 then
                    v2219(color(255, 0, 50, 255), "FATAL");
                elseif v2300 > 0 then
                    v2219(color(252, 243, 105, 255), string.format("-%d HP", v2300));
                end;
            end;
            return;
        end;
    end;
    local function v2309(v2302)
        -- upvalues: l_v733_11 (ref), v2285 (ref), v2301 (ref)
        local v2303 = entity.get_game_rules();
        if v2303 == nil then
            return;
        else
            local v2304 = entity.get_player_resource();
            if v2304 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v2303.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v2304.m_iPlayerC4;
                if l_v733_11.select:get("Bomb Information") and l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v2307 = entity.get(l_m_iPlayerC4_0);
                    if v2307 ~= nil then
                        v2285(v2304, v2307);
                    end;
                end;
                if l_v733_11.select:get("Defusing") and l_m_bBombPlanted_0 then
                    local v2308 = entity.get_entities("CPlantedC4")[1];
                    if v2308 ~= nil then
                        v2301(v2302, v2308);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v2312()
        -- upvalues: v2275 (ref), v2229 (ref), v2309 (ref)
        local v2310 = entity.get_local_player();
        if v2310 == nil then
            return;
        else
            if v2310:is_alive() then
                v2275(v2310);
            end;
            local v2311 = v2229(v2310);
            if v2311 == nil then
                return;
            else
                v2309(v2311);
                return;
            end;
        end;
    end;
    local function v2319(v2313, v2314, v2315)
        local v2316 = (v2313 + v2314) / 2;
        local v2317 = v2315:clone();
        local v2318 = v2315:clone();
        v2317.a = 0;
        render.gradient(v2313, vector(v2316.x, v2314.y), v2317, v2318, v2317, v2318);
        render.gradient(v2314, vector(v2316.x, v2313.y), v2317, v2318, v2317, v2318);
    end;
    local function v2326(v2320, v2321, v2322, v2323, v2324, v2325)
        render.circle_outline(v2320, color(0, 0, 0, 255), v2322, v2323, 1, v2325);
        render.circle_outline(v2320, v2321, v2322 - 1, v2323, v2324, v2325 - 2);
    end;
    local function v2345()
        -- upvalues: l_v733_11 (ref), l_v1004_11 (ref), l_v990_11 (ref), l_v736_14 (ref), l_v986_16 (ref), l_v992_10 (ref), l_v985_10 (ref), v2319 (ref), v2326 (ref)
        local v2327 = nil;
        if l_v733_11.override_color:get() then
            v2327 = l_v733_11.color:get("Background")[1];
        else
            v2327 = color(0, 0, 0, 55);
        end;
        for v2328 = 1, #l_v1004_11 do
            local v2329 = l_v1004_11[v2328];
            if v2329.color ~= nil then
                local v2330 = vector(l_v990_11, v2329.offset);
                local v2331 = v2330 + vector(l_v736_14, l_v986_16);
                local v2332 = v2329.text_size + vector(50);
                local l_icon_0 = v2329.icon;
                local l_draw_cmd_0 = v2329.draw_cmd;
                local l_progress_0 = v2329.progress;
                local v2336 = vector();
                local v2337 = v2329.color:clone();
                local v2338 = color(0, 0, 0, 128);
                if l_icon_0 ~= nil then
                    v2336 = render.measure_text(l_v992_10, nil, l_icon_0);
                end;
                v2331.y = v2331.y + 2;
                if l_draw_cmd_0 ~= nil then
                    v2332.x = v2332.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_icon_0 ~= nil then
                    v2332.x = v2332.x + l_v985_10 + 5;
                end;
                if l_progress_0 ~= nil then
                    v2332.x = v2332.x + 30;
                end;
                v2319(v2330, v2330 + v2332, v2327);
                if l_draw_cmd_0 ~= nil then
                    local v2339 = v2330:clone();
                    v2339.x = v2339.x + l_v736_14;
                    v2339.y = v2339.y + (v2332.y - l_draw_cmd_0.size.y) / 2;
                    l_draw_cmd_0:draw(v2339, v2337, "f");
                    v2331.x = v2331.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_icon_0 ~= nil then
                    local v2340 = v2331:clone();
                    v2340.x = v2340.x + (l_v985_10 - v2336.x) / 2;
                    render.text(l_v992_10, v2340 + 1, v2338, "", l_icon_0);
                    render.text(l_v992_10, v2340, v2337, "", l_icon_0);
                    v2331.x = v2331.x + l_v985_10 + 2;
                end;
                render.text(l_v992_10, v2331 + 1, v2338, "", v2329.text);
                render.text(l_v992_10, v2331, v2337, "", v2329.text);
                v2331.x = v2331.x + v2329.text_size.x;
                if l_progress_0 ~= nil then
                    local v2341 = v2331.x + 10 / 2 + 12;
                    local v2342 = v2330.y + v2332.y / 2;
                    local v2343 = vector(v2341, v2342);
                    local v2344 = l_v733_11.color:get("Accent")[1];
                    v2326(v2343, v2344, 10, 0, l_progress_0, 5);
                end;
            end;
        end;
    end;
    local function v2353(v2346)
        local v2347 = render.screen_size();
        local v2348 = vector(v2347.x - 8, 5);
        for v2349 = 1, #v2346 do
            local v2350 = v2346[v2349]:get_name();
            local v2351 = render.measure_text(1, nil, v2350);
            local v2352 = v2348 + vector(-v2351.x, 0);
            render.text(1, v2352, color(255, 255, 255, 200), nil, v2350);
            v2348.y = v2348.y + v2351.y + 8;
        end;
    end;
    local function v2355(v2354)
        -- upvalues: l_v2192_0 (ref), l_v1012_10 (ref), l_v2193_0 (ref)
        l_v2192_0 = l_v2192_0 + 1;
        if v2354.state == nil then
            l_v1012_10 = l_v1012_10 + 1;
        end;
        l_v2193_0 = math.floor(l_v1012_10 / math.max(1, l_v2192_0) * 100);
    end;
    local function v2356()
        -- upvalues: v2312 (ref), v2345 (ref), v2209 (ref)
        if globals.is_in_game then
            v2312();
            v2345();
        end;
        v2209();
    end;
    local function v2360()
        -- upvalues: v2229 (ref), v2353 (ref)
        local v2357 = entity.get_local_player();
        if v2357 == nil then
            return;
        else
            local v2358 = v2229(v2357);
            if v2358 == nil then
                return;
            else
                local v2359 = v2358:get_spectators();
                if v2359 == nil then
                    return;
                else
                    v2353(v2359);
                    return;
                end;
            end;
        end;
    end;
    local _ = nil;
    local function v2363(v2362)
        -- upvalues: v2356 (ref)
        events.render(v2356, next(v2362:get()) ~= nil);
    end;
    local function v2365(v2364)
        -- upvalues: v2360 (ref)
        events.render(v2360, v2364:get());
    end;
    l_v733_11.select:set_callback(v2363, true);
    l_v733_11.spectator_list:set_callback(v2365, true);
    events.aim_ack(v2355);
end;
v733 = {};
v734 = v337.visuals.scope_overlay;
v735 = 0;
do
    local l_v734_14, l_v735_13, l_v736_15, l_v985_11, l_v986_17, l_v990_12, l_v992_11 = v734, v735, v736, v985, v986, v990, v992;
    l_v736_15 = function()
        -- upvalues: l_v734_14 (ref)
        local v2373 = nil;
        local v2374 = nil;
        if l_v734_14.color:get() == "Simple" then
            v2373 = unpack(l_v734_14.color:get("Simple"));
            v2373.a = math.max(v2373.a, 35);
            v2374 = v2373:clone();
            v2374.a = 0;
        end;
        if l_v734_14.color:get() == "Fade" then
            local v2375, v2376 = unpack(l_v734_14.color:get("Fade"));
            v2374 = v2376;
            v2373 = v2375;
        end;
        return v2373, v2374;
    end;
    l_v985_11 = function()
        -- upvalues: v7 (ref)
        v7.world.scope_overlay:override();
    end;
    l_v986_17 = function()
        -- upvalues: l_v734_14 (ref), v7 (ref), l_v735_13 (ref), v9 (ref), l_v985_11 (ref)
        local v2377 = entity.get_local_player();
        if v2377 == nil then
            return;
        else
            local v2378 = l_v734_14.enabled:get();
            if v2378 then
                local v2379 = v2377:is_alive() and v2377.m_bIsScoped;
                v7.world.scope_overlay:override("Remove All");
                l_v735_13 = v9.interp(l_v735_13, v2379 and v2378, 0.05);
                return;
            else
                l_v985_11();
                l_v735_13 = v9.interp(l_v735_13, 0, 0.05);
                return;
            end;
        end;
    end;
    l_v990_12 = function()
        -- upvalues: l_v735_13 (ref), l_v734_14 (ref), l_v736_15 (ref), v8 (ref)
        local v2380 = entity.get_local_player();
        if v2380 == nil then
            return;
        elseif not v2380:is_alive() then
            return;
        elseif l_v735_13 == 0 then
            return;
        else
            local v2381 = render.screen_size() / 2;
            local v2382 = l_v734_14.position:get();
            local v2383 = l_v734_14.offset:get();
            if l_v734_14.options:get("Animate Size") then
                v2382 = l_v734_14.position:get() * l_v735_13;
                v2383 = l_v734_14.offset:get() * l_v735_13;
            end;
            local v2384, v2385 = l_v736_15();
            v2382 = v8.round(v2382);
            v2383 = v8.round(v2383);
            v2384.a = v2384.a * l_v735_13;
            v2385.a = v2385.a * l_v735_13;
            if v2382 == 0 then
                render.rect(v2381, v2381 + 1, v2385);
            elseif v2383 == 0 then
                render.rect(v2381, v2381 + 1, v2384);
            end;
            if not l_v734_14.options:get("T Style") then
                local v2386 = vector(v2381.x, v2381.y - v2383):floor();
                local v2387 = vector(v2381.x + 1, v2381.y - v2382):floor();
                render.gradient(v2386, v2387, v2384, v2384, v2385, v2385);
            end;
            local _ = nil;
            local v2389 = vector(v2381.x, v2381.y + v2383 + 1):floor();
            local v2390 = vector(v2381.x + 1, v2381.y + v2382 + 1):floor();
            render.gradient(v2389, v2390, v2384, v2384, v2385, v2385);
            v2389 = nil;
            v2390 = vector(v2381.x - v2383, v2381.y):floor();
            local v2391 = vector(v2381.x - v2382, v2381.y + 1):floor();
            render.gradient(v2390, v2391, v2384, v2385, v2384, v2385);
            v2390 = nil;
            v2391 = vector(v2381.x + v2383 + 1, v2381.y):floor();
            local v2392 = vector(v2381.x + v2382 + 1, v2381.y + 1):floor();
            render.gradient(v2391, v2392, v2384, v2385, v2384, v2385);
            return;
        end;
    end;
    l_v992_11 = function()
        -- upvalues: l_v986_17 (ref), l_v990_12 (ref)
        l_v986_17();
        l_v990_12();
    end;
    v997 = nil;
    v1004 = function(v2393)
        -- upvalues: l_v985_11 (ref), l_v992_11 (ref)
        local v2394 = v2393:get();
        if not v2394 then
            l_v985_11();
        end;
        events.render(l_v992_11, v2394);
        events.shutdown(l_v985_11, true);
    end;
    l_v734_14.enabled:set_callback(v1004, true);
end;
v734 = {};
v735 = v337.visuals.grenade_radius;
v736 = {};
do
    local l_v735_14 = v735;
    v985 = function()
        -- upvalues: l_v735_14 (ref)
        local l_tickcount_1 = globals.tickcount;
        local l_tickinterval_0 = globals.tickinterval;
        local v2398 = entity.get_entities("CSmokeGrenadeProjectile");
        local v2399 = 79;
        local v2400 = 125;
        local v2401 = 255;
        local v2402 = 125;
        if l_v735_14.override_color:get() then
            local l_r_0 = unpack(l_v735_14.color:get("Smoke")).r;
            local l_g_0 = unpack(l_v735_14.color:get("Smoke")).g;
            local l_b_0 = unpack(l_v735_14.color:get("Smoke")).b;
            v2402 = unpack(l_v735_14.color:get("Smoke")).a;
            v2401 = l_b_0;
            v2400 = l_g_0;
            v2399 = l_r_0;
        end;
        local v2406 = 125;
        for v2407 = 1, #v2398 do
            local v2408 = v2398[v2407];
            local v2409 = v2408:get_classname();
            local v2410 = 1;
            if v2409 == "CSmokeGrenadeProjectile" and v2408.m_bDidSmokeEffect == true then
                local l_m_nSmokeEffectTickBegin_0 = v2408.m_nSmokeEffectTickBegin;
                if l_m_nSmokeEffectTickBegin_0 ~= nil then
                    local v2412 = l_tickinterval_0 * (l_tickcount_1 - l_m_nSmokeEffectTickBegin_0);
                    if v2412 > 0 and 17.55 - v2412 > 0 then
                        if grenade_timer then
                            v2410 = 1 - v2412 / 17.55;
                        end;
                        if v2412 < 0.3 then
                            v2406 = v2406 * 0.6 + v2406 * (v2412 / 0.3) * 0.4;
                            v2402 = v2402 * (v2412 / 0.3);
                        end;
                        if 17.55 - v2412 < 1 then
                            v2406 = v2406 * ((17.55 - v2412) / 1 * 0.3 + 0.7);
                        end;
                        render.circle_3d(v2408:get_origin(), color(v2399, v2400, v2401, v2402 * math.min(1, v2410 * 1.3)), v2406, 0, 1);
                    end;
                end;
            end;
        end;
    end;
    v986 = nil;
    do
        local l_v985_12 = v985;
        v990 = function(v2414)
            -- upvalues: l_v985_12 (ref)
            local v2415 = v2414:get();
            events.render(l_v985_12, v2415);
        end;
        l_v735_14.smoke:set_callback(v990, true);
    end;
    v985 = {};
    v986 = function()
        -- upvalues: l_v735_14 (ref), v9 (ref)
        local v2416 = entity.get_entities("CInferno");
        local v2417 = color(251, 41, 75, 125);
        if l_v735_14.override_color:get() then
            v2417 = unpack(l_v735_14.color:get("Molotov"));
        end;
        for v2418 = 1, #v2416 do
            local v2419 = v2416[v2418];
            local v2420 = v2419:get_origin();
            local v2421 = 40;
            local v2422 = {};
            local v2423 = 0;
            local v2424 = nil;
            local v2425 = nil;
            local v2426 = v2416[v2418];
            for v2427 = 1, 64 do
                if v2426.m_bFireIsBurning[v2427] == true then
                    table.insert(v2422, vector(v2419.m_fireXDelta[v2427], v2419.m_fireYDelta[v2427], v2419.m_fireZDelta[v2427]));
                end;
            end;
            for v2428 = 1, #v2422 do
                for v2429 = 1, #v2422 do
                    local v2430 = v9.distance_2d(v2422[v2428], v2422[v2429]);
                    if v2423 < v2430 then
                        v2423 = v2430;
                        v2424 = v2422[v2428];
                        v2425 = v2422[v2429];
                    end;
                end;
            end;
            if v2424 ~= nil and v2425 ~= nil then
                local v2431 = v2420 + v9.lerp_position(v2424, v2425, 0.5);
                render.circle_3d(v2431, v2417, v2423 / 2 + v2421, 0, 1, 1);
            end;
        end;
    end;
    v990 = nil;
    do
        local l_v986_18 = v986;
        v992 = function(v2433)
            -- upvalues: l_v986_18 (ref)
            local v2434 = v2433:get();
            events.render(l_v986_18, v2434);
        end;
        l_v735_14.molotov:set_callback(v992, true);
    end;
end;
v735 = {};
v736 = v337.visuals.inaccuracy_overlay;
do
    local l_v736_16, l_v985_13 = v736, v985;
    l_v985_13 = function()
        -- upvalues: l_v736_16 (ref)
        local v2437 = entity.get_local_player();
        if v2437 == nil or not v2437:is_alive() then
            return;
        else
            local v2438 = v2437:get_player_weapon();
            if v2438 == nil then
                return;
            else
                local v2439 = v2438:get_inaccuracy() * 387;
                if not l_v736_16.color:get("Simple") then
                    return;
                else
                    local v2440 = render.screen_size();
                    local v2441 = vector(v2440.x / 2, v2440.y / 2);
                    local v2442 = unpack(l_v736_16.color:get("Simple"));
                    local v2443, v2444 = unpack(l_v736_16.color:get("Fade"));
                    if l_v736_16.color:get() == "Simple" then
                        render.circle_gradient(v2441, v2442, color(0, 0, 0, 0), v2439, 0, 1);
                    end;
                    if l_v736_16.color:get() == "Fade" then
                        render.circle_gradient(v2441, v2443, v2444, v2439, 0, 1);
                    end;
                    return;
                end;
            end;
        end;
    end;
    v986 = nil;
    v990 = function(v2445)
        -- upvalues: l_v985_13 (ref)
        local v2446 = v2445:get();
        events.render(l_v985_13, v2446);
    end;
    l_v736_16.enabled:set_callback(v990, true);
end;
v736 = {};
v985 = v337.visuals.indicators;
v986 = render.load_font("museo700", 13, "ad");
v990 = function()
    -- upvalues: v6 (ref), v337 (ref), v9 (ref)
    local v2447 = ui.get_style();
    local v2448 = v2447["Link Active"];
    local v2449 = v2447["Text Preview"];
    if v6.user == "LazyMind" then
        return;
    elseif v337.home.credits.sofa:get() then
        return string.format("%s %s", v6.name, v9.wave(ui.get_icon(v6.icon), v2448, v2449, globals.realtime));
    else
        return (v9.wave(v6.name, color(255, 255, 255), v2448, globals.realtime));
    end;
end;
do
    local l_v986_19, l_v990_13, l_v992_12 = v986, v990, v992;
    l_v992_12 = function()
        -- upvalues: v101 (ref), l_v990_13 (ref), l_v986_19 (ref)
        if v101.get_debuff_remover() == true then
            return;
        else
            local v2453 = render.screen_size() / 1;
            local v2454 = v2453 * 0.5;
            local v2455 = l_v990_13();
            render.text(l_v986_19, vector(v2454.x, v2453.y - 20), color(255, 255, 255), "c", v2455);
            return;
        end;
    end;
    v997 = nil;
    v1004 = function(v2456)
        -- upvalues: l_v992_12 (ref)
        local v2457 = not v2456:get();
        events.render(l_v992_12, v2457);
    end;
    v985.crosshairs:set_callback(v1004, true);
end;
v431 = {};
v432 = {};
v488 = v337.utilits.aspect_ratio;
v509 = cvar.r_aspectratio;
v510 = nil;
v511 = function()
    local v2458 = render.screen_size();
    return v2458.x / v2458.y;
end;
do
    local l_v488_15, l_v509_16, l_v510_17, l_v511_17, l_v733_12, l_v734_15, l_v735_15, l_v736_17, l_v985_14 = v488, v509, v510, v511, v733, v734, v735, v736, v985;
    l_v733_12 = function()
        -- upvalues: l_v509_16 (ref), l_v511_17 (ref)
        local v2468 = l_v509_16:float();
        if v2468 == 0 then
            return l_v511_17();
        else
            return v2468;
        end;
    end;
    l_v734_15 = function()
        -- upvalues: l_v488_15 (ref)
        return l_v488_15.proportion:get() * 0.01;
    end;
    l_v735_15 = function()
        -- upvalues: l_v509_16 (ref)
        l_v509_16:float(tonumber(l_v509_16:string()), true);
    end;
    l_v736_17 = function()
        -- upvalues: l_v735_15 (ref)
        l_v735_15();
    end;
    l_v985_14 = function()
        -- upvalues: l_v734_15 (ref), l_v510_17 (ref), l_v511_17 (ref), v9 (ref), l_v509_16 (ref), l_v733_12 (ref)
        if not (l_v734_15() > 0) then
            if l_v510_17 == nil then
                return;
            else
                local v2469 = l_v511_17();
                l_v510_17 = v9.interp(l_v510_17, v2469, 0.1);
                if l_v510_17 == v2469 then
                    l_v510_17 = nil;
                end;
                l_v509_16:float(l_v510_17 or 0, true);
                return;
            end;
        else
            if l_v510_17 == nil then
                l_v510_17 = l_v733_12();
            end;
            local v2470 = l_v734_15();
            l_v510_17 = v9.interp(l_v510_17, v2470, 0.1);
            l_v509_16:float(l_v510_17, true);
            return;
        end;
    end;
    v986 = nil;
    v990 = function(v2471)
        -- upvalues: l_v985_14 (ref), l_v736_17 (ref)
        if v2471:get() * 0.01 > 0 then
            events.pre_render(l_v985_14, true);
        end;
        events.shutdown(l_v736_17, true);
    end;
    l_v488_15.proportion:set_callback(v990, true);
end;
v488 = {};
v509 = v337.utilits.viewmodel;
v510 = {};
v511 = function(v2472)
    -- upvalues: v8 (ref)
    return v8.get_original(v2472) or 0;
end;
do
    local l_v509_17, l_v510_18, l_v511_18, l_v733_13, l_v734_16, l_v735_16, l_v736_18, l_v985_15, l_v986_20, l_v990_14 = v509, v510, v511, v733, v734, v735, v736, v985, v986, v990;
    l_v733_13 = function(v2483)
        -- upvalues: l_v511_18 (ref)
        cvar[v2483]:float(l_v511_18(v2483), true);
    end;
    l_v734_16 = function(v2484, v2485)
        -- upvalues: l_v510_18 (ref)
        if l_v510_18[v2484] == v2485 then
            return;
        else
            l_v510_18[v2484] = v2485;
            cvar[v2484]:float(v2485, true);
            return;
        end;
    end;
    l_v735_16 = function(v2486, v2487)
        -- upvalues: l_v510_18 (ref), l_v511_18 (ref), l_v734_16 (ref), v9 (ref)
        if l_v510_18[v2486] == nil then
            l_v510_18[v2486] = l_v511_18(v2486);
        end;
        l_v734_16(v2486, v9.interp(l_v510_18[v2486], v2487, 0.1));
    end;
    l_v736_18 = function()
        -- upvalues: l_v733_13 (ref)
        l_v733_13("viewmodel_fov");
        l_v733_13("viewmodel_offset_x");
        l_v733_13("viewmodel_offset_y");
        l_v733_13("viewmodel_offset_z");
        l_v733_13("cl_righthand");
    end;
    l_v985_15 = function()
        -- upvalues: l_v509_17 (ref), l_v735_16 (ref), l_v511_18 (ref)
        if not l_v509_17.enabled:get() then
            l_v735_16("viewmodel_fov", l_v511_18("viewmodel_fov"));
            l_v735_16("viewmodel_offset_x", l_v511_18("viewmodel_offset_x"));
            l_v735_16("viewmodel_offset_y", l_v511_18("viewmodel_offset_y"));
            l_v735_16("viewmodel_offset_z", l_v511_18("viewmodel_offset_z"));
            return;
        else
            l_v735_16("viewmodel_fov", l_v509_17.fov:get() * 0.1);
            l_v735_16("viewmodel_offset_x", l_v509_17.x:get() * 0.1);
            l_v735_16("viewmodel_offset_y", l_v509_17.y:get() * 0.1);
            l_v735_16("viewmodel_offset_z", l_v509_17.z:get() * 0.1);
            return;
        end;
    end;
    l_v986_20 = function()
        -- upvalues: l_v509_17 (ref), l_v733_13 (ref), l_v511_18 (ref)
        if not l_v509_17.enabled:get() or not l_v509_17.swap_knife_hand:get() then
            l_v733_13("cl_righthand");
            return;
        else
            local v2488 = entity.get_local_player();
            if v2488 == nil then
                return;
            else
                local v2489 = v2488:get_player_weapon();
                if v2489 == nil then
                    return;
                else
                    local v2490 = l_v511_18("cl_righthand");
                    if v2489:get_classname() == "CKnife" then
                        if v2490 == 0 then
                            cvar.cl_righthand:float(1, true);
                            return;
                        else
                            cvar.cl_righthand:float(0, true);
                            return;
                        end;
                    else
                        l_v733_13("cl_righthand");
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_v990_14 = function()
        -- upvalues: l_v985_15 (ref), l_v986_20 (ref)
        l_v985_15();
        l_v986_20();
    end;
    v992 = nil;
    v997 = function(v2491)
        -- upvalues: l_v990_14 (ref), l_v736_18 (ref)
        if v2491:get() then
            events.pre_render(l_v990_14, true);
        end;
        events.shutdown(l_v736_18);
    end;
    l_v509_17.enabled:set_callback(v997, true);
end;
v509 = {};
v510 = v337.utilits.keep_model_transparency;
v511 = function()
    local v2492 = entity.get_local_player();
    if v2492 == nil or not v2492:is_alive() then
        return;
    else
        return (not not v2492.m_bIsScoped or v2492.m_bResumeZoom) and 100 or 255;
    end;
end;
v733 = nil;
do
    local l_v511_19 = v511;
    v734 = function(v2494)
        -- upvalues: l_v511_19 (ref)
        local v2495 = v2494:get();
        events.localplayer_transparency(l_v511_19, v2495);
    end;
    v510.enabled:set_callback(v734, true);
end;
v510 = {};
v511 = v337.utilits.vgui_color;
v733 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)");
v734 = nil;
v734 = {};
v735 = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
for v2496 = 1, #v735 do
    v734[v2496] = materials.get_materials(v735[v2496]);
end;
do
    local l_v511_20, l_v733_14, l_v734_17, l_v735_17, l_v736_19, l_v985_16 = v511, v733, v734, v735, v736, v985;
    l_v735_17 = function(v2503)
        -- upvalues: l_v734_17 (ref)
        local v2504 = v2503.a / 255;
        for v2505 = 1, #l_v734_17 do
            local v2506 = l_v734_17[v2505];
            local v2507 = unpack(v2506);
            v2507:alpha_modulate(v2504);
            v2507:color_modulate(v2503);
        end;
    end;
    l_v736_19 = function()
        -- upvalues: l_v735_17 (ref)
        l_v735_17(color(255, 255, 255, 255));
    end;
    l_v985_16 = function()
        -- upvalues: l_v733_14 (ref), l_v735_17 (ref), l_v511_20 (ref)
        if not l_v733_14() then
            l_v735_17(color(255, 255, 255, 255));
        else
            l_v735_17(l_v511_20.color:get());
        end;
    end;
    v986 = nil;
    v990 = function(v2508)
        -- upvalues: l_v735_17 (ref), l_v736_19 (ref), l_v985_16 (ref)
        local v2509 = v2508:get();
        if not v2509 then
            l_v735_17(color(255, 255, 255, 255));
        end;
        events.shutdown(l_v736_19, true);
        events.pre_render(l_v985_16, v2509);
    end;
    l_v511_20.enabled:set_callback(v990, true);
end;
v511 = {};
v733 = v337.utilits.panorama;
v734 = utils.get_vfunc("engine.dll", "VEngineClient014", 28, "bool(__thiscall*)(void*)");
v735 = nil;
v736 = cvar.ui_mainmenu_bkgnd_movie_CC4ECB9;
v985 = panorama.loadstring("            const o_IsVacBanned = MyPersonaAPI.IsVacBanned\n            const o_GetCooldownSecondsRemaining = CompetitiveMatchAPI.GetCooldownSecondsRemaining\n            const o_IsNewClientAvailable = NewsAPI.IsNewClientAvailable;\n\n            let ctx = $.GetContextPanel()\n            if (ctx == null) return\n\n            return {\n                set_visible(name, visible) {\n                    let child = ctx.FindChildTraverse(name)\n                    if (child == null) return\n\n                    child.visible = visible\n                },\n\n                set_cooldown(visible) {\n                    if (visible) {\n                        MyPersonaAPI.IsVacBanned = o_IsVacBanned\n                        CompetitiveMatchAPI.GetCooldownSecondsRemaining = o_GetCooldownSecondsRemaining\n\n                        return\n                    }\n\n                    MyPersonaAPI.IsVacBanned = () => 0\n                    CompetitiveMatchAPI.GetCooldownSecondsRemaining = () => 0\n                },\n\n                override_version_check(visible) {\n                    if (visible) {\n                        NewsAPI.IsNewClientAvailable = o_IsNewClientAvailable;\n                        return;\n                    }\n\n                    NewsAPI.IsNewClientAvailable = () => false;\n                },\n\n                set_movie(file) {\n                    let movie = ctx.FindChildTraverse(\"MainMenuMovie\")\n                    if (movie == null) return\n\n                    movie.SetMovie(file)\n                    movie.SetRepeat(true)\n                    movie.SetSound(\"\")\n                    movie.Play()\n                }\n            }\n        ", "MainMenu")();
do
    local l_v733_15, l_v734_18, l_v735_18, l_v736_20, l_v985_17, l_v986_21, l_v990_15, l_v992_13, l_v997_12, l_v1004_12, l_v2192_1 = v733, v734, v735, v736, v985, v986, v990, v992, v997, v1004, v2192;
    l_v986_21 = function(v2521)
        -- upvalues: l_v735_18 (ref), l_v985_17 (ref)
        if v2521 == l_v735_18 then
            return;
        else
            l_v985_17.set_movie(string.format("file://{resources}/videos/%s.webm", v2521));
            l_v735_18 = v2521;
            return;
        end;
    end;
    l_v990_15 = function(v2522)
        -- upvalues: l_v985_17 (ref)
        l_v985_17.set_visible("JsNewsContainer", v2522);
    end;
    l_v992_13 = function(v2523)
        -- upvalues: l_v985_17 (ref)
        l_v985_17.set_cooldown(v2523);
    end;
    l_v997_12 = function(v2524)
        -- upvalues: l_v985_17 (ref)
        l_v985_17.override_version_check(v2524);
    end;
    l_v1004_12 = function(v2525)
        -- upvalues: l_v986_21 (ref), l_v736_20 (ref)
        if not v2525 then
            l_v986_21(l_v736_20:string());
            return;
        else
            l_v986_21("search");
            return;
        end;
    end;
    v1012 = function()
        -- upvalues: l_v990_15 (ref), l_v992_13 (ref), l_v1004_12 (ref), l_v997_12 (ref)
        l_v990_15(true);
        l_v992_13(true);
        l_v1004_12(false);
        l_v997_12(true);
    end;
    l_v2192_1 = function()
        -- upvalues: l_v734_18 (ref), l_v735_18 (ref), l_v990_15 (ref), l_v733_15 (ref), l_v992_13 (ref), l_v1004_12 (ref), l_v997_12 (ref)
        if l_v734_18() or globals.is_in_game then
            l_v735_18 = nil;
            return;
        else
            l_v990_15(not l_v733_15.list:get("Remove News and Shop"));
            l_v992_13(not l_v733_15.list:get("Remove Cooldown"));
            l_v1004_12(l_v733_15.list:get("Custom Background"));
            l_v997_12(not l_v733_15.list:get("Legacy Warning"));
            return;
        end;
    end;
    v2193 = nil;
    v2194 = function(v2526)
        -- upvalues: l_v2192_1 (ref)
        local v2527 = v2526:get() ~= nil;
        events.pre_render(l_v2192_1, v2527);
    end;
    l_v733_15.list:set_callback(v2194, true);
    l_v736_20:set_callback(function()
        -- upvalues: l_v735_18 (ref)
        l_v735_18 = nil;
    end);
    events.shutdown(v1012);
end;
v432 = {};
v488 = v337.home.presets;
v509 = {
    other = {
        exploits = v337.other.group_exploits, 
        rage = v337.other.group_rage, 
        other = v337.other.group_misc, 
        visuals = v337.other.group_visuals, 
        utils = v337.other.group_utils
    }, 
    antiaim = {
        angles = v337.antiaim.group_angles, 
        directions = v337.antiaim.group_directions, 
        tweaks = v337.antiaim.group_tweaks, 
        player = v337.antiaim.group_player
    }
};
for v2528, v2529 in pairs(v337.antiaim.builder) do
    v509[v2528] = v2529.groups;
end;
l_rshift_0.set_package(v509);
v510 = nil;
do
    local l_v488_16, l_v510_19, l_v511_21, l_v733_16, l_v734_19, l_v735_19 = v488, v510, v511, v733, v734, v735;
    l_v511_21 = function()
        -- upvalues: l_bnot_0 (ref), l_v488_16 (ref), l_bor_0 (ref), v6 (ref)
        local v2536, v2537 = l_bnot_0.save(l_v488_16.input:get());
        if not v2536 then
            l_bor_0.error(v2537);
            return;
        else
            l_bnot_0.update_data();
            l_v488_16.list:update(l_bnot_0.get_list());
            l_bor_0.success("Config saved");
            common.add_notify(v6.name, "Config saved");
            return;
        end;
    end;
    l_v733_16 = function()
        -- upvalues: l_bnot_0 (ref), l_v488_16 (ref), l_bor_0 (ref), v6 (ref)
        local v2538, v2539 = l_bnot_0.delete(l_v488_16.input:get());
        if not v2538 then
            l_bor_0.error(v2539);
            return;
        else
            l_bnot_0.update_data();
            l_v488_16.list:update(l_bnot_0.get_list());
            l_bor_0.success("Config deleted");
            common.add_notify(v6.name, "Config deleted");
            return;
        end;
    end;
    l_v734_19 = function()
        -- upvalues: l_rshift_0 (ref), l_bor_0 (ref), l_clipboard_0 (ref), v6 (ref)
        local v2540, v2541 = l_rshift_0.export_as_string();
        if not v2540 then
            l_bor_0.error(v2541);
            return;
        else
            l_clipboard_0.set(v2541);
            l_bor_0.success("Config exported to clipboard");
            common.add_notify(v6.name, "Config exported to clipboard");
            return;
        end;
    end;
    l_v735_19 = function(v2542)
        -- upvalues: l_v510_19 (ref), l_v488_16 (ref)
        assert(type(v2542) == "function", "action must be a function");
        l_v510_19 = function()
            -- upvalues: v2542 (ref), l_v510_19 (ref)
            v2542();
            l_v510_19 = nil;
        end;
        l_v488_16.cancel:disabled(false);
        l_v488_16.confirm:disabled(false);
        l_v488_16.list:disabled(true);
        l_v488_16.input:disabled(true);
        l_v488_16.import_button:disabled(true);
        l_v488_16.export_button:disabled(true);
        l_v488_16.delete_button:disabled(true);
        l_v488_16.save_button:disabled(true);
        l_v488_16.load_button:disabled(true);
    end;
    v736 = nil;
    v985 = function(v2543)
        -- upvalues: l_bnot_0 (ref), l_v488_16 (ref)
        local v2544 = v2543:get();
        if v2544 == nil or v2544 <= 0 then
            return;
        else
            local v2545 = l_bnot_0.get(v2544);
            if v2545 == nil then
                l_v488_16.input:set("");
            else
                l_v488_16.input:set(v2545.name);
            end;
            return;
        end;
    end;
    v986 = function()
        -- upvalues: l_v510_19 (ref), l_v488_16 (ref)
        if l_v510_19 ~= nil then
            l_v510_19();
        end;
        l_v488_16.list:disabled(false);
        l_v488_16.input:disabled(false);
        l_v488_16.import_button:disabled(false);
        l_v488_16.export_button:disabled(false);
        l_v488_16.delete_button:disabled(false);
        l_v488_16.save_button:disabled(false);
        l_v488_16.load_button:disabled(false);
        l_v488_16.cancel:disabled(true);
        l_v488_16.confirm:disabled(true);
    end;
    v990 = function()
        -- upvalues: l_v510_19 (ref), l_v488_16 (ref)
        if l_v510_19 ~= nil then
            l_v510_19 = nil;
        end;
        l_v488_16.list:disabled(false);
        l_v488_16.input:disabled(false);
        l_v488_16.import_button:disabled(false);
        l_v488_16.export_button:disabled(false);
        l_v488_16.delete_button:disabled(false);
        l_v488_16.save_button:disabled(false);
        l_v488_16.load_button:disabled(false);
        l_v488_16.cancel:disabled(true);
        l_v488_16.confirm:disabled(true);
    end;
    v992 = function()
        -- upvalues: l_bnot_0 (ref), l_v488_16 (ref), l_bor_0 (ref), v6 (ref)
        local v2546, v2547 = l_bnot_0.load(l_v488_16.input:get());
        if not v2546 then
            l_bor_0.error(v2547);
            return;
        else
            l_bor_0.success("Config loaded");
            common.add_notify(v6.name, "Config loaded");
            return;
        end;
    end;
    do
        local l_v985_18, l_v986_22, l_v990_16, l_v992_14 = v985, v986, v990, v992;
        l_v488_16.confirm:set_callback(function()
            -- upvalues: l_v986_22 (ref)
            l_v986_22();
        end);
        l_v488_16.cancel:set_callback(function()
            -- upvalues: l_v990_16 (ref)
            l_v990_16();
        end);
        l_v488_16.load_button:set_callback(function()
            -- upvalues: l_v992_14 (ref)
            l_v992_14();
        end);
        l_v488_16.save_button:set_callback(function()
            -- upvalues: l_v735_19 (ref), l_v511_21 (ref)
            l_v735_19(l_v511_21);
        end);
        l_v488_16.delete_button:set_callback(function()
            -- upvalues: l_v735_19 (ref), l_v733_16 (ref)
            l_v735_19(l_v733_16);
        end);
        l_v488_16.import_button:set_callback(function()
            -- upvalues: l_rshift_0 (ref), l_clipboard_0 (ref), l_bor_0 (ref), v6 (ref)
            local v2552, v2553 = l_rshift_0.load(nil, l_clipboard_0.get());
            if not v2552 then
                l_bor_0.error(v2553);
                return;
            else
                l_bor_0.success("Config imported from clipboard");
                common.add_notify(v6.name, "Config imported from clipboard");
                return;
            end;
        end);
        l_v488_16.export_button:set_callback(function()
            -- upvalues: l_v735_19 (ref), l_v734_19 (ref)
            l_v735_19(l_v734_19);
        end);
        l_v488_16.list:set_callback(function(v2554)
            -- upvalues: l_v985_18 (ref)
            l_v985_18(v2554);
        end);
    end;
    l_v488_16.list:update(l_bnot_0.get_list());
end;
v488 = {};
v509 = "wss://a2ep24pv.allinone.guru";
v510 = "k6RlAJTa0RkkQYatjZbc2dOh7zkK3DXM";
v511 = "allinone";
v733 = "neverlose";
v734 = 30;
v735 = 10;
v736 = 3;
v985 = nil;
v986 = 0;
v990 = 0;
v992 = false;
v997 = true;
v1004 = function(v2555)
    if not v2555 then
        v2555 = 16;
    end;
    local v2556 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    local v2557 = "";
    for _ = 1, v2555 do
        local v2559 = math.random(1, #v2556);
        v2557 = string.format("%s%s", v2557, v2556:sub(v2559, v2559));
    end;
    return v2557;
end;
v1012 = function(v2560)
    local v2561 = {};
    for v2562 in pairs(v2560) do
        table.insert(v2561, v2562);
    end;
    table.sort(v2561);
    return v2561;
end;
do
    local l_v509_18, l_v510_20, l_v511_22, l_v733_17, l_v734_20, l_v735_20, l_v736_21, l_v985_19, l_v986_23, l_v990_17, l_v992_15, l_v997_13, l_v1004_13, l_v1012_11, l_v2192_2, l_v2193_1, l_v2194_1 = v509, v510, v511, v733, v734, v735, v736, v985, v986, v990, v992, v997, v1004, v1012, v2192, v2193, v2194;
    l_v2192_2 = function(v2580, v2581)
        -- upvalues: l_v1012_11 (ref), v91 (ref)
        local v2582 = l_v1012_11(v2580);
        local v2583 = "";
        for _, v2585 in ipairs(v2582) do
            v2583 = string.format("%s%s%s", v2583, v2585, tostring(v2580[v2585]));
        end;
        v2583 = string.format("%s%s", v2583, v2581);
        return v91.hash(v2583);
    end;
    l_v2193_1 = function(v2586, v2587)
        if type(v2587) == "table" and next(v2587) ~= nil then
            local v2588 = "";
            for v2589, v2590 in pairs(v2587) do
                if v2588 ~= "" then
                    v2588 = v2588 .. "&";
                end;
                v2588 = v2588 .. string.format("%s=%s", v2589, v2590);
            end;
            v2586 = string.format("%s?%s", v2586, v2588);
        end;
        return v2586;
    end;
    l_v2194_1 = function()
        -- upvalues: v8 (ref), v6 (ref), v337 (ref)
        local v2591 = string.format(v8.icon_title("", "%s"), v6.online_user);
        v337.home.social.online.button:name(v2591);
    end;
    local function v2593(v2592)
        -- upvalues: v6 (ref), l_v2194_1 (ref)
        v6.online_user = v2592.active_users;
        l_v2194_1();
    end;
    local function v2595()
        -- upvalues: l_v985_19 (ref), l_v986_23 (ref)
        if l_v985_19 and l_v985_19.open then
            local v2594 = json.stringify({
                type = "get_active_users"
            });
            l_v985_19:send(v2594);
            l_v986_23 = globals.realtime;
        end;
    end;
    local function v2599(v2596)
        -- upvalues: v2593 (ref)
        local l_status_13, l_result_13 = pcall(json.parse, v2596);
        if not l_status_13 then
            return;
        elseif l_result_13.ct == 1 then
            v2593(l_result_13);
            return;
        else
            return;
        end;
    end;
    local function v2600()
        -- upvalues: l_v990_17 (ref), l_v735_20 (ref), l_v997_13 (ref), l_v992_15 (ref), l_v736_21 (ref), v488 (ref)
        if l_v735_20 <= l_v990_17 then
            l_v997_13 = false;
            return;
        else
            l_v990_17 = l_v990_17 + 1;
            l_v992_15 = false;
            utils.execute_after(l_v736_21, function()
                -- upvalues: l_v997_13 (ref), v488 (ref)
                if l_v997_13 then
                    v488:init();
                end;
            end);
            return;
        end;
    end;
    local v2608 = {
        open = function(_)
            -- upvalues: l_v990_17 (ref), l_v992_15 (ref), l_v986_23 (ref), v2595 (ref)
            l_v990_17 = 0;
            l_v992_15 = false;
            l_v986_23 = globals.realtime;
            v2595();
        end, 
        message = function(_, v2603)
            -- upvalues: v2599 (ref)
            v2599(v2603);
        end, 
        close = function(_, _)
            -- upvalues: l_v992_15 (ref), l_v997_13 (ref), v2600 (ref)
            l_v992_15 = false;
            if l_v997_13 then
                v2600();
            end;
        end, 
        error = function(_, _)
            -- upvalues: l_v992_15 (ref), l_v997_13 (ref), v2600 (ref)
            l_v992_15 = false;
            if l_v997_13 then
                v2600();
            end;
        end
    };
    v488.init = function(_)
        -- upvalues: l_v992_15 (ref), l_v985_19 (ref), l_v1004_13 (ref), v6 (ref), l_v733_17 (ref), l_v511_22 (ref), l_v2192_2 (ref), l_v510_20 (ref), l_v2193_1 (ref), l_v509_18 (ref), l_websockets_0 (ref), v2608 (ref)
        if l_v992_15 then
            return;
        elseif l_v985_19 and l_v985_19.open then
            return;
        else
            l_v992_15 = true;
            local v2610 = l_v1004_13(16);
            local v2611 = {
                username = v6.user, 
                product = l_v733_17, 
                script = l_v511_22, 
                nonce = v2610
            };
            local v2612 = l_v2192_2(v2611, l_v510_20);
            local v2613 = l_v2193_1(l_v509_18, {
                username = v6.user, 
                product = l_v733_17, 
                script = l_v511_22, 
                nonce = v2610, 
                signature = v2612
            });
            l_v985_19 = l_websockets_0.connect(v2613, v2608);
            return;
        end;
    end;
    v488.check_connection = function(v2614)
        -- upvalues: l_v985_19 (ref), l_v997_13 (ref), l_v992_15 (ref), l_v986_23 (ref), l_v734_20 (ref), v2595 (ref)
        if not l_v985_19 or not l_v985_19.open then
            if l_v997_13 and not l_v992_15 then
                v2614:init();
            end;
            return;
        else
            if globals.realtime - l_v986_23 >= l_v734_20 then
                v2595();
            end;
            return;
        end;
    end;
    v488.is_connected = function(_)
        -- upvalues: l_v985_19 (ref)
        return l_v985_19 and l_v985_19.open;
    end;
    v488.force_reconnect = function(v2616)
        -- upvalues: l_v990_17 (ref), l_v997_13 (ref), l_v985_19 (ref)
        l_v990_17 = 0;
        l_v997_13 = true;
        if l_v985_19 and l_v985_19.open then
            l_v985_19:close();
        else
            v2616:init();
        end;
    end;
    v488.on_shutdown = function(_)
        -- upvalues: l_v997_13 (ref), l_v985_19 (ref)
        l_v997_13 = false;
        if l_v985_19 == nil then
            return;
        elseif not l_v985_19.open then
            return;
        else
            l_v985_19:close();
            return;
        end;
    end;
    v488:init();
    events.pre_render(function()
        -- upvalues: v488 (ref)
        v488:check_connection();
    end);
end;