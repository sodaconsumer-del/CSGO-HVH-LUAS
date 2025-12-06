local l_ffi_0 = require("ffi");
local l_pui_0 = require("neverlose/pui");
local l_vector_0 = require("vector");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_file_0 = require("neverlose/file");
local l_weapons_0 = require("neverlose/csgo_weapons");
local l_system_0 = require("neverlose/drag_system");
utils.console_exec("play ui\\beepclear");
local v8 = {
    [1] = "global", 
    [2] = "stand", 
    [3] = "slow walk", 
    [4] = "run", 
    [5] = "duck", 
    [6] = "duck move", 
    [7] = "jump", 
    [8] = "duck jump", 
    [9] = "freestanding", 
    [10] = "fakelag", 
    [11] = "hideshots", 
    [12] = "air exploit"
};
local v9 = {
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
local l_utils_0 = utils;
local _ = {};
local v12 = {};
local v13 = {};
local v14 = {};
local _ = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {};
local v21 = {};
local _ = {};
local v23 = {};
local v24 = {};
local v25 = {};
local _ = {};
local v27 = ui.get_style("Link Active");
local v28 = ui.get_style("Active Text");
local l_format_0 = string.format;
getmetatable(color()).override = function(v30, v31, v32)
    local v33 = v30:clone();
    v33[v31] = v32;
    return v33;
end;
local v34 = nil;
l_ffi_0.cdef("        typedef struct {\n            char  pad_0000[20];\n            int m_nOrder; //0x0014\n            int m_nSequence; //0x0018\n            float m_flPrevCycle; //0x001C\n            float m_flWeight; //0x0020\n            float m_flWeightDeltaRate; //0x0024\n            float m_flPlaybackRate; //0x0028\n            float m_flCycle; //0x002C\n            void *m_pOwner; //0x0030\n            char  pad_0038[4]; //0x0034\n        } CAnimationLayer;\n    ");
v34 = {
    bind_argument = function(v35, v36)
        return function(...)
            -- upvalues: v35 (ref), v36 (ref)
            return v35(v36, ...);
        end;
    end, 
    entity_list_pointer = l_utils_0.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)"), 
    native_GetNetChannelInfo = l_utils_0.get_vfunc("engine.dll", "VEngineClient014", 78, "void* (__thiscall*)(void* ecx)"), 
    native_GetLatency = l_utils_0.get_vfunc(9, "float(__thiscall*)(void*, int)"), 
    engine_client = l_ffi_0.cast(l_ffi_0.typeof("void***"), l_utils_0.create_interface("engine.dll", "VEngineClient014"))
};
v34.console_is_visible = v34.bind_argument(l_ffi_0.cast("bool(__thiscall*)(void*)", v34.engine_client[0][11]), v34.engine_client);
local v37 = 0;
l_utils_0.lerp = function(v38, v39, v40)
    return v38 + (v39 - v38) * v40;
end;
do
    local l_v37_0 = v37;
    l_utils_0.defensive = function()
        -- upvalues: l_v37_0 (ref)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_v37_0) > 64 then
            l_v37_0 = 0;
        end;
        local v43 = 0;
        if l_v37_0 < l_m_nTickBase_0 then
            l_v37_0 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v37_0 then
            v43 = math.min(14, math.max(0, l_v37_0 - l_m_nTickBase_0 - 1));
        end;
        return v43;
    end;
    l_utils_0.get_weapon_struct = function(v44)
        -- upvalues: l_weapons_0 (ref)
        local v45 = v44:get_player_weapon();
        if v45 == nil then
            return;
        else
            local v46 = l_weapons_0[v45.m_iItemDefinitionIndex];
            if v46 == nil then
                return;
            else
                return v46;
            end;
        end;
    end;
    l_utils_0.get_weapon_index = function(v47)
        local v48 = v47:get_player_weapon();
        if v48 == nil then
            return;
        else
            return v48.m_iItemDefinitionIndex;
        end;
    end;
    l_utils_0.air = function(v49)
        local l_m_fFlags_0 = v49.m_fFlags;
        return bit.band(l_m_fFlags_0, 1) == 0;
    end;
    l_utils_0.in_duck = function(v51)
        local l_m_fFlags_1 = v51.m_fFlags;
        return bit.band(l_m_fFlags_1, 4) == 4;
    end;
    l_utils_0.color_text = function(...)
        local v53 = {
            ...
        };
        local v54 = "";
        for v55 = 1, #v53 do
            if v53[v55] ~= nil and v53[v55][1] ~= nil then
                if v53[v55][2] == nil then
                    v54 = v54 .. v53[v55][1];
                else
                    v54 = v54 .. ("\a%s%s\aDEFAULT"):format(v53[v55][2]:to_hex(), v53[v55][1]);
                end;
            end;
        end;
        return v54;
    end;
    l_utils_0.centered_text = function(v56)
        local v57 = "";
        if #v56 > 44 then
            return "";
        else
            for _ = 1, 44 - #v56 do
                v57 = v57 .. " ";
            end;
            return v57 .. v56;
        end;
    end;
    l_utils_0.normalize = function(v59, v60, v61)
        local v62 = v61 - v60;
        while v59 < v60 do
            v59 = v59 + v62;
        end;
        while v61 < v59 do
            v59 = v59 - v62;
        end;
        return v59;
    end;
    l_utils_0.normalize_yaw = function(v63)
        -- upvalues: l_utils_0 (ref)
        return l_utils_0.normalize(v63, -180, 180);
    end;
    l_utils_0.normalize_pitch = function(v64, _, _)
        -- upvalues: l_utils_0 (ref)
        return l_utils_0.normalize(v64, -89, 89);
    end;
    l_utils_0.toInteger = function(v67)
        return math.floor(v67 + 0.5);
    end;
    l_utils_0.rgbaToHexText = function(v68, v69)
        -- upvalues: l_utils_0 (ref)
        return ("\a%02x%02x%02x%02x%s"):format(l_utils_0.toInteger(math.clamp(v68.r, 0, 255)), l_utils_0.toInteger(math.clamp(v68.g, 0, 255)), l_utils_0.toInteger(math.clamp(v68.b, 0, 255)), l_utils_0.toInteger(math.clamp(v68.a, 0, 255)), v69);
    end;
    l_utils_0.CreateAnimationText = function(v70, v71, v72, v73, v74)
        -- upvalues: l_utils_0 (ref)
        local v75 = {};
        local v76 = "";
        local v77 = v70:len() * 5;
        local v78 = globals.curtime / (11 - v73 / 10);
        for v79 = 1, v70:len() do
            local v80 = math.abs(v79 * 5 / v77);
            v75[v79] = math.abs(1 * math.cos(2 * math.pi * v78 + (v74 and -v80 or v80)));
        end;
        for v81, v82 in pairs(v75) do
            local v83 = l_utils_0.lerp(v71, v72, v82);
            v76 = ("%s%s"):format(v76, l_utils_0.rgbaToHexText(v83, v70:sub(v81, v81)));
        end;
        return v76;
    end;
    l_utils_0.notify = function(v84, v85)
        -- upvalues: v12 (ref)
        table.insert(v12, #v12 + 1, {
            [1] = nil, 
            [2] = 255, 
            text = v84, 
            realtime = globals.realtime, 
            [1] = math.floor(globals.curtime), 
            clr = color(255), 
            ziti = v85
        });
    end;
end;
l_utils_0.notify("Hello, \a" .. v27:to_hex() .. "" .. common.get_username() .. "\aFFFFFFFF !", true);
l_utils_0.notify("The script loads successfully !", true);
v37 = function()
    -- upvalues: v12 (ref)
    if #v12 ~= 0 then
        if globals.is_connected == false or globals.curtime == 0 then
            table.remove(v12, #v12);
        end;
        if #v12 > 5 then
            table.remove(v12, 1);
        end;
        for v86 = 1, #v12 do
            if v12[v86] == nil then
                return;
            elseif v12[v86][1] + 4 > math.floor(globals.curtime) then
                return;
            else
                v12[v86][2] = v12[v86][2] - math.floor(globals.frametime * 340);
                if v12[v86][2] < 0 then
                    table.remove(v12, v86);
                end;
            end;
        end;
    end;
end;
do
    local l_v37_1 = v37;
    local function v101()
        -- upvalues: l_v37_1 (ref), v12 (ref), l_vector_0 (ref)
        l_v37_1();
        local v88 = render.screen_size().x / 2;
        local v89 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [6] = 0, 
            [7] = 0, 
            [8] = 0, 
            [9] = 0, 
            [10] = 0, 
            [11] = 0, 
            [12] = 0, 
            [13] = 0, 
            [14] = 0, 
            [15] = 0, 
            [16] = 0, 
            [17] = 0, 
            [18] = 0, 
            [19] = 0, 
            [20] = 0, 
            [21] = 0, 
            [22] = 0, 
            [23] = 0, 
            [24] = 0, 
            [25] = 0, 
            [26] = 0
        };
        local v90 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [6] = 0, 
            [7] = 0, 
            [8] = 0, 
            [9] = 0, 
            [10] = 0, 
            [11] = 0, 
            [12] = 0, 
            [13] = 0, 
            [14] = 0, 
            [15] = 0, 
            [16] = 0, 
            [17] = 0, 
            [18] = 0, 
            [19] = 0, 
            [20] = 0, 
            [21] = 0, 
            [22] = 0, 
            [23] = 0, 
            [24] = 0, 
            [25] = 0, 
            [26] = 0
        };
        local _ = 0;
        for v92, v93 in pairs(v12) do
            if not v93.clr then
                local _ = color(255, 255, 255, 255);
            end;
            local v95 = render.measure_text(1, nil, v93.text).x + render.measure_text(4, nil, "meteor").x;
            local l_x_0 = render.measure_text(4, nil, "meteor").x;
            v89[v92] = v89[v92] + v95;
            local v97 = math.min((globals.realtime - v93.realtime) * 1.5, 1);
            local v98 = math.max((globals.realtime - 3 - v93.realtime) * 2, 0);
            local v99 = v88 - v89[v92] / 2 + v90[v92];
            for v100 = 1, 1 do
                render.rect_outline(l_vector_0(v99 - 8 - v100, 897 + v92 * 30 - v100 + (v97 - v98) * 7), l_vector_0(v99 + v95 + 12 + v100, 917 + v92 * 30 + v100 + (v97 - v98) * 11), color(5, 5, 5, (1 - v100 / 5.5) * math.clamp((v97 - v98) * 255, 0, 255)), 0.5, 2);
            end;
            render.rect(l_vector_0(v99 - 8, 897 + v92 * 30 + (v97 - v98) * 7), l_vector_0(v99 + v95 + 12, 917 + v92 * 30 + (v97 - v98) * 11), color(15, 15, 15, math.clamp((v97 - v98) * 255, 0, 255)), 2.5);
            render.text(4, l_vector_0(v99, 900 + v92 * 30 + (v97 - v98) * 9.5), color(255):alpha_modulate((v97 - v98) * 255), nil, "meteor");
            render.text(v93.ziti and 4 or 1, l_vector_0(v99 + l_x_0 + 6, 900 + v92 * 30 + (v97 - v98) * 9.5), color(255, 255, 255, (v97 - v98) * 255), nil, v93.text);
            render.rect_outline(l_vector_0(v99 - 8, 897 + v92 * 30 + (v97 - v98) * 7), l_vector_0(v99 + v95 + 12, 917 + v92 * 30 + (v97 - v98) * 11), color(35, 35, 35, math.clamp((v97 - v98) * 255, 0, 255)), 1, 2.5);
        end;
    end;
    events.render:set(v101);
end;
v14.rage = {
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    multipoint = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint"), 
    quick_switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"), 
    hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    doubletap_config = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    doubletap_fakelag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    prefer_body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    prefer_safety = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    quick_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hideshots_config = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
};
v14.aa = {
    angles = {
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        enable_aa = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        yaw_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        body_yaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        disable_yaw_modif = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
        extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
        extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
        extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
    }, 
    fakelag = {
        fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        fakelag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        fakelag_var = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
    }, 
    other = {
        slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
    }
};
v14.misc = {
    quick_switch2 = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
};
math.vector_lerp = function(v102, v103, v104)
    local v105 = globals.frametime * 100;
    return v102:lerp(v103, v104 * math.min(v105, math.max_lerp_low_fps));
end;
math.color_lerp = function(v106, v107, v108)
    local v109 = globals.frametime * 100;
    return v106:lerp(v107, v108 * math.min(v109, math.max_lerp_low_fps));
end;
math.lerp = function(v110, v111, v112)
    if v110 == v111 then
        return v111;
    else
        v112 = v112 * (globals.frametime * 170);
        local v113 = v110 + (v111 - v110) * v112;
        if math.abs(v113 - v111) < 0.01 then
            return v111;
        else
            return v113;
        end;
    end;
end;
v13.base_speed = 0.095;
v13._list = {};
v13.new = function(v114, v115, v116, v117)
    -- upvalues: v13 (ref)
    if not v116 then
        v116 = v13.base_speed;
    end;
    local v118 = type(v115) == "userdata";
    local v119 = type(v115) == "vector";
    if v13._list[v114] == nil then
        v13._list[v114] = v117 and v117 or v118 and color(255) or 0;
    end;
    local v120 = nil;
    if v119 then
        v120 = math.vector_lerp;
    elseif v118 then
        v120 = math.color_lerp;
    else
        v120 = math.lerp;
    end;
    v13._list[v114] = v120(v13._list[v114], v115, v116);
    return v13._list[v114];
end;
v17.builder = {};
local v121 = (function()
    -- upvalues: l_utils_0 (ref), v28 (ref)
    return l_utils_0.color_text({
        [1] = "\a" .. v28:to_hex() .. l_utils_0.centered_text("meteor.nl \194\169 2021 - 2024"), 
        [2] = v28
    });
end)();
local v122 = {
    list = l_pui_0.create("\v\f<house> \rmain", "\v\f<bolt> \rInformations"), 
    anitaim = {
        builder = l_pui_0.create("\v\f<house> \rmain", "\v\f<user-gear> \r Builder"), 
        other = l_pui_0.create("\v\f<house> \rmain", "\v\f<lightbulb> \r Other"), 
        defensive = l_pui_0.create("\v\f<house> \rmain", "\v\f<circle-info> \r Defensive")
    }, 
    visuals = l_pui_0.create("\v\f<house> \rmain", "\v\f<pen> \r Visuals"), 
    misc = l_pui_0.create("\v\f<house> \rmain", "\v\f<lightbulb> \r Misc"), 
    config = l_pui_0.create("\v\f<house> \rmain", "\v\f<download> \r Config")
};
v17.main_list = v122.list:list("\n", {
    [1] = "anti-aim", 
    [2] = "visuals", 
    [3] = "misc", 
    [4] = "config"
});
v122.list:label(v121);
v17.switch_builder = v122.anitaim.builder:switch("anti-aim builder"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v17.main_list
});
v17.anitaim = {
    manual = v122.anitaim.other:combo("manual", {
        [1] = "default", 
        [2] = "manual left", 
        [3] = "manual right", 
        [4] = "manual forward", 
        [5] = "manual edge"
    }), 
    freestand = v122.anitaim.other:switch("freestanding", false, nil, function(v123)
        return {
            air = v123:selectable("blocking conditions", {
                [1] = "stand", 
                [2] = "slow walk", 
                [3] = "run", 
                [4] = "duck", 
                [5] = "jump"
            })
        };
    end), 
    antiaims_tweaks = v122.anitaim.other:selectable("additionals", {
        [1] = "anti-aim on use", 
        [2] = "avoid-backstab", 
        [3] = "static manual", 
        [4] = "safe head", 
        [5] = "manual disabled defensive"
    }), 
    anim_breakers = v122.anitaim.other:selectable("anim breakers", {
        [1] = "legs on ground", 
        [2] = "legs in air", 
        [3] = "0 pitch on land", 
        [4] = "move lean earthquake"
    }, nil, function(v124)
        return {
            ground = v124:combo("Legs on ground", {
                [1] = "sliding", 
                [2] = "allah", 
                [3] = "dislocated arm"
            }), 
            air = v124:combo("Legs in air", {
                [1] = "static", 
                [2] = "allah", 
                [3] = "t-pose", 
                [4] = "dumb", 
                [5] = "stiff duck"
            })
        };
    end), 
    air_lag = v122.anitaim.other:switch("air lag exploit", false), 
    roll = v122.anitaim.other:switch("Roll", false, function(v125)
        return {
            roll = v125:slider("\n", -45, 45, 0), 
            auto_switch = v125:switch("auto switch")
        }, true;
    end), 
    condition = v122.anitaim.builder:combo("builder condition", v8)
};
for _, v127 in ipairs(v8) do
    v17.builder[v127] = {};
    local v128 = v17.builder[v127];
    if v127 ~= "global" then
        v128.enable = v122.anitaim.builder:switch(l_utils_0.color_text({
            [1] = "activate ", 
            [2] = v28
        }, {
            [1] = v127, 
            [2] = v27
        }));
    end;
    v128.break_lc = v122.anitaim.defensive:switch("force break lc" .. "\n" .. v127);
    v128.defensive = v122.anitaim.defensive:switch("defensive aa" .. "\n" .. v127);
    v128.pitch = v122.anitaim.defensive:combo("pitch" .. "\n" .. v127, {
        [1] = "off", 
        [2] = "static", 
        [3] = "jitter", 
        [4] = "spin", 
        [5] = "random", 
        [6] = "3-way"
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v128.defensive
    });
    do
        local l_v128_0 = v128;
        l_v128_0.pitch_angles_1 = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "angles 1\n pitch" .. v127, -89, 89, 0, 1, "\194\176"):depend({
            [1] = l_v128_0.pitch, 
            [2] = function()
                -- upvalues: l_v128_0 (ref)
                return l_v128_0.pitch() ~= "off";
            end
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.pitch_angles_2 = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "angles 2\n pitch" .. v127, -89, 89, 0, 1, "\194\176"):depend({
            [1] = l_v128_0.pitch, 
            [2] = function()
                -- upvalues: l_v128_0 (ref)
                return l_v128_0.pitch() == "random" or not (l_v128_0.pitch() ~= "jitter") or l_v128_0.pitch() == "3-way";
            end
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.pitch_speed = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "speed\n pitch" .. v127, -50, 50, 0, 0.1, "t"):depend({
            [1] = nil, 
            [2] = "spin", 
            [1] = l_v128_0.pitch
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.yaw = v122.anitaim.defensive:combo("yaw" .. "\n" .. v127, {
            [1] = "off", 
            [2] = "static", 
            [3] = "jitter", 
            [4] = "spin", 
            [5] = "random", 
            [6] = "opposite", 
            [7] = "3-way", 
            [8] = "neverlose"
        }):depend({
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.yaw_angles = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "angles \n yaw" .. v127, 0, 360, 0, 1, "\194\176"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        }, {
            [1] = l_v128_0.yaw, 
            [2] = function()
                -- upvalues: l_v128_0 (ref)
                return l_v128_0.yaw() == "static" or not (l_v128_0.yaw() ~= "jitter") or not (l_v128_0.yaw() ~= "spin") or not (l_v128_0.yaw() ~= "random") or l_v128_0.yaw() == "3-way";
            end
        });
        l_v128_0.yaw_angles_delay = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "delay \n yaw" .. v127, 1, 15, 0, 1, "t"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        }, {
            [1] = nil, 
            [2] = "jitter", 
            [1] = l_v128_0.yaw
        });
        l_v128_0.yaw_speed = v122.anitaim.defensive:slider(l_utils_0.color_text({
            [1] = "~ ", 
            [2] = v27
        }) .. "speed\n yaw" .. v127, -50, 50, 0, 0.1, "t"):depend({
            [1] = nil, 
            [2] = "spin", 
            [1] = l_v128_0.yaw
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.freestand = v122.anitaim.defensive:switch("follow freestand" .. "\n" .. v127):depend({
            [1] = nil, 
            [2] = true, 
            [1] = l_v128_0.defensive
        });
        l_v128_0.yaw_base = v122.anitaim.builder:combo("yaw base" .. "\n" .. v127, {
            [1] = "local view", 
            [2] = "at target"
        });
        l_v128_0.body_yaw = v122.anitaim.builder:combo("body" .. "\n" .. v127, {
            [1] = "off", 
            [2] = "static", 
            [3] = "jitter"
        });
        l_v128_0.body_yaw_side = v122.anitaim.builder:slider("body yaw" .. "\n" .. v127, -180, 180, 0, true, "\194\176", 1):depend({
            [1] = nil, 
            [2] = "static", 
            [1] = l_v128_0.body_yaw
        });
        l_v128_0.jitter_delay = v122.anitaim.builder:slider("jitter delay\n" .. v127, 1, 10, 1, 1, "t"):depend({
            [1] = nil, 
            [2] = "jitter", 
            [1] = l_v128_0.body_yaw
        });
        l_v128_0.yaw_jitter = v122.anitaim.builder:combo("yaw jitter" .. "\n" .. v127, {
            [1] = "disabled", 
            [2] = "offset", 
            [3] = "center"
        });
        l_v128_0.yaw_jitter_add = v122.anitaim.builder:slider("yaw jitter add\n" .. v127, -180, 180, 0, true, "\194\176", 1):depend({
            [1] = nil, 
            [2] = "disabled", 
            [3] = true, 
            [1] = l_v128_0.yaw_jitter
        });
        l_v128_0.yaw_add = v122.anitaim.builder:slider("yaw add" .. "\n" .. v127, -180, 180, 0, true, "\194\176", 1);
        l_v128_0.yaw_add_r = v122.anitaim.builder:slider("yaw add (r)" .. "\n" .. v127, -180, 180, 0, true, "\194\176", 1):depend({
            [1] = nil, 
            [2] = "jitter", 
            [1] = l_v128_0.body_yaw
        });
        for v130, v131 in pairs(l_v128_0) do
            local v132 = {
                [1] = {
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v17.main_list
                }, 
                [2] = {
                    [1] = v17.anitaim.condition, 
                    [2] = v127
                }, 
                [3] = {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v17.switch_builder
                }
            };
            if v130 ~= "enable" and v127 ~= "global" then
                v132 = {
                    [1] = {
                        [1] = v17.anitaim.condition, 
                        [2] = v127
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = true, 
                        [1] = l_v128_0.enable
                    }, 
                    [3] = {
                        [1] = nil, 
                        [2] = 1, 
                        [1] = v17.main_list
                    }, 
                    [4] = {
                        [1] = nil, 
                        [2] = true, 
                        [1] = v17.switch_builder
                    }
                };
            end;
            v131:depend(table.unpack(v132));
        end;
    end;
end;
for _, v134 in pairs(v17.anitaim) do
    v134:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v17.main_list
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v17.switch_builder
    });
end;
v17.visuals = {
    sc_indicators = v122.visuals:switch("screen indicator", false, nil, function(v135)
        return {
            ind_color = v135:color_picker("Indicator color", color(255, 255, 255)), 
            build_color = v135:color_picker("Build color", color(255, 255, 255)), 
            glow_px = v135:slider("offset", 0, 100, 10, 1, "px"), 
            glow_switch = v135:switch("glow", false)
        }, true;
    end), 
    damage_indicator = v122.visuals:switch("damage indicator"), 
    sindicators = v122.visuals:switch("gamesense indicator", false, nil, function(v136)
        return {
            ele = v136:selectable("gamesense indicator", {
                [1] = "LC", 
                [2] = "Double tap", 
                [3] = "Dormant aimbot", 
                [4] = "Ping spike", 
                [5] = "Fake duck", 
                [6] = "Freestanding", 
                [7] = "Body aim", 
                [8] = "Hide shots", 
                [9] = "Choked commands", 
                [10] = "Safe points", 
                [11] = "Hitchance", 
                [12] = "Minimum damage"
            }, 0)
        }, true;
    end), 
    aspect_ratio = v122.visuals:switch("aspect ratio", false, nil, function(v137)
        local v138 = {
            val = v137:slider("value", 50, 300, 0, 0.01), 
            preset1 = v137:button(" 4:3 "), 
            preset2 = v137:button(" 5:4"), 
            preset3 = v137:button(" 3:2"), 
            preset4 = v137:button(" 16:10"), 
            preset5 = v137:button("16:9 ")
        };
        v138.preset1:set_callback(function()
            -- upvalues: v138 (ref)
            v138.val:set(133);
        end);
        v138.preset2:set_callback(function()
            -- upvalues: v138 (ref)
            v138.val:set(125);
        end);
        v138.preset3:set_callback(function()
            -- upvalues: v138 (ref)
            v138.val:set(150);
        end);
        v138.preset4:set_callback(function()
            -- upvalues: v138 (ref)
            v138.val:set(160);
        end);
        v138.preset5:set_callback(function()
            -- upvalues: v138 (ref)
            v138.val:set(178);
        end);
        return v138, true;
    end), 
    viewmodel = v122.visuals:switch("viewmodel", false, nil, function(v139)
        local v140 = {
            fov = v139:slider("fov", 0, 100, 68), 
            x = v139:slider("x", -100, 100, 25, 0.1), 
            y = v139:slider("y", -100, 100, 0, 0.1), 
            z = v139:slider("z", -100, 100, -15, 0.1), 
            preset = v139:button(" preset ")
        };
        v140.preset:set_callback(function()
            -- upvalues: v140 (ref)
            v140.fov:set(68);
        end);
        v140.preset:set_callback(function()
            -- upvalues: v140 (ref)
            v140.x:set(25);
        end);
        v140.preset:set_callback(function()
            -- upvalues: v140 (ref)
            v140.y:set(0);
        end);
        v140.preset:set_callback(function()
            -- upvalues: v140 (ref)
            v140.z:set(-15);
        end);
        return v140, true;
    end), 
    nade_radius = v122.visuals:switch("\ac0abffff[debug]\r nade radius", false, nil, function(v141)
        local v142 = {
            grenade_select = v141:listable("", {
                [1] = "Smoke", 
                [2] = "Molotov"
            }), 
            molotov_color = v141:color_picker("Team Molotov Color", color(116, 192, 41, 255)), 
            enemy_molotov_color = v141:color_picker("Enemy Molotov Color", color(255, 63, 63, 190)), 
            smoke_color = v141:color_picker("Smoke Color", color(61, 147, 250, 180))
        };
        v142.molotov_color:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v142.grenade_select
        });
        v142.enemy_molotov_color:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v142.grenade_select
        });
        v142.smoke_color:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v142.grenade_select
        });
        return v142, true;
    end), 
    manual_arrows = v122.visuals:switch("manual arrows", false, nil, function(v143)
        return {
            manuals_offset = v143:slider("offset", 0, 100, 10, 1, "px"), 
            manuals_color = v143:color_picker("color", color(114, 168, 236, 255))
        }, true;
    end), 
    keepscope = v122.visuals:switch("keep scope transparency"), 
    console_color = v122.visuals:switch("vgui color", false, nil, function(v144)
        return {
            accent_color = v144:color_picker("color", color(114, 168, 236, 255))
        }, true;
    end), 
    velocity_indication = v122.visuals:switch("velocity", false, nil, function(v145)
        local v146 = {
            velocity_indication = v145:switch("velocity", false), 
            velocity_accent_color = v145:color_picker("color", color(255)), 
            defensive_indication = v145:switch("defensive", false), 
            defensive_accent_color = v145:color_picker("color", color(255)), 
            airlag_indication = v145:switch("airlag", false), 
            airlag_accent_color = v145:color_picker("color", color(255))
        };
        v146.velocity_accent_color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v146.velocity_indication
        });
        v146.defensive_accent_color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v146.defensive_indication
        });
        v146.airlag_accent_color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v146.airlag_indication
        });
        return v146, true;
    end)
};
v17.misc = {
    killsay = v122.misc:switch("chat spammer"), 
    clantag = v122.misc:switch("clantag"), 
    nade_fixer = v122.misc:switch("\ac0abffff[debug]\r nade fix", false), 
    aipeek = v122.misc:switch("\ac0abffff[debug]\r peek bot", false, nil, function(v147)
        local v148 = {
            ai_key = v147:switch("key", false), 
            department = v147:slider("department", 1, 10, 3), 
            gap = v147:slider("gap", 10, 100, 50), 
            ticks = v147:slider("ticks", 1, 10, 3, 1, "t"), 
            tp_peek = v147:switch("TP when peeking", false), 
            tp_delay = v147:slider("\ntp delay", 0, 200, 0, 1, "ms"), 
            disable_dormant = v147:switch("disabled doramnt check"), 
            disable_d_prediction = v147:switch("disabled dormant prediction", false)
        };
        v148.tp_delay:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v148.tp_peek
        });
        return v148, true;
    end), 
    dormant = v122.misc:switch("\ac0abffff[debug]\r dormant aimbot", false, nil, function(v149)
        local v150 = {};
        for v151 = 1, 27 do
            v150[100 + v151] = "HP + " .. v151;
        end;
        return {
            dormantHitboxes = v149:selectable("hitbox", "Head", "Chest", "Stomach", "Legs"), 
            dormantAccuracy = v149:slider("aimbot accuracy", 50, 100, 90, 1, "%"), 
            dormantMindmg = v149:slider("minimum damage", 0, 126, 10, nil, function(v152)
                -- upvalues: v150 (ref)
                return v150[v152] ~= nil and v150[v152 + 1] or v152;
            end), 
            experimental = v149:switch("accurate history [experimental]"), 
            dormantLogs = v149:switch("log dormant shots")
        }, true;
    end), 
    auto_hideshots = v122.misc:switch("automatic hideshots", false, nil, function(v153)
        return {
            auto_hideshots_wpns = v153:selectable("\nStyle", {
                [1] = "Pistol", 
                [2] = "Scout", 
                [3] = "Scar", 
                [4] = "Rifle", 
                [5] = "SMG", 
                [6] = "Machinegun", 
                [7] = "Shotgun"
            })
        }, true;
    end), 
    aimbot_logging = v122.misc:switch("log aimbot shots", false, nil, function(v154)
        return {
            selectable = v154:selectable("\n", "print_dev", "print_raw", "notify"), 
            hit = v154:color_picker("hit", color(163, 211, 80, 255)), 
            miss = v154:color_picker("miss", color(240, 191, 86, 255))
        }, true;
    end), 
    fast = v122.misc:switch("fast ladder move"), 
    fall = v122.misc:switch("no fall damage"), 
    cheat_revealer = v122.misc:switch("cheat revealer", false, nil, function(v155)
        return {
            cheat_revealer_style = v155:selectable("\nStyle", {
                [1] = "Scoreboard icon", 
                [2] = "Flag"
            })
        }, true;
    end), 
    grenade_release = v122.misc:switch("grenade release", false, nil, function(v156)
        return {
            damage = v156:slider("damage", 1, 50, 50)
        }, true;
    end), 
    icon_shared = v122.misc:switch("shared icon", false)
};
v17.config = {};
v17.config.list = v122.config:combo("\n", {
    [1] = "Default"
});
v17.config.name = v122.config:input("\n", "Enter a name for the config.");
v17.config.load = v122.config:button("\v\f<cloud-arrow-down>\rLoad", function()
    -- upvalues: v17 (ref), v25 (ref)
    local v157 = files.read(string.format("nl\\meteor\\%s.ct", v17.config.list.value));
    v25.import(v157);
end, true);
v17.config.save = v122.config:button("\v\f<floppy-disk>\rSave", function()
    -- upvalues: v25 (ref), v17 (ref)
    v25.save(v17.config.list.value);
end, true);
v17.config.create = v122.config:button("\v\f<folder-plus>\rCreate", function()
    -- upvalues: v25 (ref), v17 (ref)
    v25.save(v17.config.name.value);
end, true);
v17.config.delete = v122.config:button("\v\f<trash-can-xmark>\rDelete", function()
    -- upvalues: v25 (ref)
    v25.delete_local();
end, true);
v17.config.update = v122.config:button("                    \v\f<rotate> \rForce Update List                    ", function()
    -- upvalues: v25 (ref)
    v25.refresh_local();
end, true);
v17.config.import = v122.config:button("          \v\f<file-import> \rimport           ", function()
    -- upvalues: v25 (ref), l_clipboard_0 (ref)
    v25.import(l_clipboard_0.get():match("[%w%+%/]+%=*"));
end, true);
v17.config.export = v122.config:button("        \v\f<file-export> \rexport        ", function()
    -- upvalues: v25 (ref)
    v25.export();
end, true);
for _, v159 in pairs(v17.visuals) do
    v159:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v17.main_list
    });
end;
for _, v161 in pairs(v17.misc) do
    v161:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v17.main_list
    });
end;
for _, v163 in pairs(v17.config) do
    v163:depend({
        [1] = nil, 
        [2] = 4, 
        [1] = v17.main_list
    });
end;
local function v165(v164)
    -- upvalues: v14 (ref)
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):disabled(v164);
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):disabled(v164);
    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):disabled(v164);
    ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):disabled(v164);
    ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):disabled(v164);
    v14.aa.angles.freestanding:disabled(v164);
end;
do
    local l_v165_0 = v165;
    v17.switch_builder:set_callback(function(v167)
        -- upvalues: l_v165_0 (ref)
        if v167:get() then
            l_v165_0(true);
        end;
        if not v167:get() then
            l_v165_0(false);
        end;
    end, true);
    l_pui_0.setup(v17);
end;
v37 = {};
v25.get_documents = function(v168, v169, v170)
    -- upvalues: l_file_0 (ref)
    local v171 = 1;
    local v172 = {};
    local v173 = string.sub(common.get_game_directory(), 0, -5);
    if v170 and type(v170) == "table" then
        v172 = v170;
        v171 = #v170 + 1;
    end;
    l_file_0.add_search_path(v173 .. v168, "GAME", 0);
    if not l_file_0.is_directory(v173 .. v168, "GAME") then
        v172[v171] = "";
        l_file_0.remove_search_path(v173 .. v168, "GAME");
        return v172;
    else
        local v174, v175 = l_file_0.find_first((v173 .. v168) .. "*.*");
        while v175 do
            if v175.lower(v175):find(v169) then
                v172[v171] = v175;
                v171 = v171 + 1;
            end;
            v175 = l_file_0.find_next(v174[0]);
        end;
        l_file_0.find_close(v174[0]);
        if #v172 == 0 then
            v172[v171] = "";
        end;
        l_file_0.remove_search_path(v173 .. v168, "GAME");
        return v172;
    end;
end;
do
    local l_v37_2 = v37;
    v25.get_list = function()
        -- upvalues: v25 (ref), l_v37_2 (ref)
        local v177 = {};
        for _, v179 in pairs(v25.get_documents("nl\\meteor\\", ".ct")) do
            table.insert(v177, string.sub(v179, 1, -4));
        end;
        l_v37_2.local_list = v177;
    end;
    v25.get_list();
    v25.refresh_local = function()
        -- upvalues: v25 (ref), v17 (ref), l_v37_2 (ref)
        v25.get_list();
        v17.config.list:update(l_v37_2.local_list);
    end;
    l_utils_0.execute_after(0.5, v25.refresh_local);
    v25.import = function(v180)
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_pui_0 (ref), l_utils_0 (ref)
        assert(l_clipboard_0.get() ~= nil, "\229\143\130\230\149\176\230\149\176\229\128\188\228\184\141\232\131\189\228\184\186\231\169\186!");
        xpcall(function()
            -- upvalues: l_base64_0 (ref), v180 (ref), l_pui_0 (ref)
            local v181 = json.parse(l_base64_0.decode(v180));
            l_pui_0.load(v181);
        end, function()
            common.add_notify("\229\135\186\233\148\153\229\149\166\239\188\129", "\229\143\130\230\149\176\230\149\176\229\128\188\232\167\163\230\158\144\233\148\153\232\175\175!");
        end);
        l_utils_0.console_exec("play ui\\beepclear");
        l_utils_0.notify("succesfully import!", true);
    end;
    v25.export = function()
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref), l_utils_0 (ref)
        local v182 = l_pui_0.save();
        local v183 = l_base64_0.encode(json.stringify(v182));
        l_clipboard_0.set(v183);
        l_utils_0.console_exec("play ui\\beepclear");
        l_utils_0.notify("succesfully export!", true);
    end;
    v25.delete_local = function()
        -- upvalues: v17 (ref), l_file_0 (ref), v25 (ref), l_utils_0 (ref)
        local v184 = string.sub(common.get_game_directory(), 0, -5);
        local v185 = string.format("%snl\\meteor\\%s.ct", v184, v17.config.list.value);
        l_file_0.remove(v185, "GAME");
        v25.refresh_local();
        l_utils_0.console_exec("play ui\\beepclear");
    end;
    v25.save = function(v186)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), v25 (ref), l_utils_0 (ref)
        if v186 == "" or v186 == "Enter a name for the config." or v186 == nil then
            return;
        else
            local v187 = l_pui_0.save();
            local v188 = l_base64_0.encode(json.stringify(v187));
            files.write(string.format("nl\\meteor\\%s.ct", v186), v188);
            v25.refresh_local();
            l_utils_0.console_exec("play ui\\beepclear");
            return;
        end;
    end;
    if not files.read("nl/meteor/Default.ct") then
        files.write(string.format("nl\\meteor\\%s.ct", "Default"), "eyJhbml0YWltIjp7ImFpcl9sYWciOmZhbHNlLCJhbmltX2JyZWFrZXJzIjpbImxlZ3Mgb24gZ3JvdW5kIiwibGVncyBpbiBhaXIiLCIwIHBpdGNoIG9uIGxhbmQiLCJ+Il0sImFudGlhaW1zX3R3ZWFrcyI6WyJhbnRpLWFpbSBvbiB1c2UiLCJhdm9pZC1iYWNrc3RhYiIsInN0YXRpYyBtYW51YWwiLCJzYWZlIGhlYWQiLCJtYW51YWwgZGlzYWJsZWQgZGVmZW5zaXZlIiwifiJdLCJjb25kaXRpb24iOiJmcmVlc3RhbmRpbmciLCJmcmVlc3RhbmQiOmZhbHNlLCJtYW51YWwiOiJkZWZhdWx0Iiwicm9sbCI6ZmFsc2UsIn5hbmltX2JyZWFrZXJzIjp7ImFpciI6InN0YXRpYyIsImdyb3VuZCI6ImFsbGFoIn0sIn5mcmVlc3RhbmQiOnsiYWlyIjpbInNsb3cgd2FsayIsImR1Y2siLCJqdW1wIiwifiJdfSwifnJvbGwiOnsiYXV0b19zd2l0Y2giOmZhbHNlLCJyb2xsIjotNC4wfX0sImJ1aWxkZXIiOnsiYWlyIGV4cGxvaXQiOnsiYm9keV95YXciOiJzdGF0aWMiLCJib2R5X3lhd19zaWRlIjowLjAsImJyZWFrX2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJmcmVlc3RhbmQiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjEuMCwicGl0Y2giOiJqaXR0ZXIiLCJwaXRjaF9hbmdsZXNfMSI6LTg5LjAsInBpdGNoX2FuZ2xlc18yIjotMzMuMCwicGl0Y2hfc3BlZWQiOjAuMCwieWF3Ijoib3Bwb3NpdGUiLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfYW5nbGVzIjowLjAsInlhd19hbmdsZXNfZGVsYXkiOjEuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfc3BlZWQiOjAuMH0sImR1Y2siOnsiYm9keV95YXciOiJqaXR0ZXIiLCJib2R5X3lhd19zaWRlIjowLjAsImJyZWFrX2xjIjp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImVuYWJsZSI6dHJ1ZSwiZnJlZXN0YW5kIjpmYWxzZSwiaml0dGVyX2RlbGF5IjozLjAsInBpdGNoIjoic3RhdGljIiwicGl0Y2hfYW5nbGVzXzEiOi04OS4wLCJwaXRjaF9hbmdsZXNfMiI6LTg5LjAsInBpdGNoX3NwZWVkIjowLjAsInlhdyI6ImppdHRlciIsInlhd19hZGQiOjQzLjAsInlhd19hZGRfciI6LTI4LjAsInlhd19hbmdsZXMiOjIzNS4wLCJ5YXdfYW5nbGVzX2RlbGF5IjoxLjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2ppdHRlciI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X3NwZWVkIjo0LjB9LCJkdWNrIGp1bXAiOnsiYm9keV95YXciOiJqaXR0ZXIiLCJib2R5X3lhd19zaWRlIjowLjAsImJyZWFrX2xjIjp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOnRydWUsImZyZWVzdGFuZCI6ZmFsc2UsImppdHRlcl9kZWxheSI6Mi4wLCJwaXRjaCI6ImppdHRlciIsInBpdGNoX2FuZ2xlc18xIjoxNS4wLCJwaXRjaF9hbmdsZXNfMiI6LTguMCwicGl0Y2hfc3BlZWQiOjAuMCwieWF3IjoibmV2ZXJsb3NlIiwieWF3X2FkZCI6NDcuMCwieWF3X2FkZF9yIjotMjQuMCwieWF3X2FuZ2xlcyI6MzEuMCwieWF3X2FuZ2xlc19kZWxheSI6Mi4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19zcGVlZCI6My4wfSwiZHVjayBtb3ZlIjp7ImJvZHlfeWF3Ijoiaml0dGVyIiwiYm9keV95YXdfc2lkZSI6MC4wLCJicmVha19sYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwiZnJlZXN0YW5kIjpmYWxzZSwiaml0dGVyX2RlbGF5Ijo0LjAsInBpdGNoIjoib2ZmIiwicGl0Y2hfYW5nbGVzXzEiOjAuMCwicGl0Y2hfYW5nbGVzXzIiOjAuMCwicGl0Y2hfc3BlZWQiOjAuMCwieWF3Ijoib2ZmIiwieWF3X2FkZCI6MzMuMCwieWF3X2FkZF9yIjotMzEuMCwieWF3X2FuZ2xlcyI6MC4wLCJ5YXdfYW5nbGVzX2RlbGF5IjoxLjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2ppdHRlciI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X3NwZWVkIjowLjB9LCJmYWtlbGFnIjp7ImJvZHlfeWF3Ijoib2ZmIiwiYm9keV95YXdfc2lkZSI6MC4wLCJicmVha19sYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsImZyZWVzdGFuZCI6ZmFsc2UsImppdHRlcl9kZWxheSI6MS4wLCJwaXRjaCI6Im9mZiIsInBpdGNoX2FuZ2xlc18xIjowLjAsInBpdGNoX2FuZ2xlc18yIjowLjAsInBpdGNoX3NwZWVkIjowLjAsInlhdyI6Im9mZiIsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19hbmdsZXMiOjAuMCwieWF3X2FuZ2xlc19kZWxheSI6MS4wLCJ5YXdfYmFzZSI6ImxvY2FsIHZpZXciLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfc3BlZWQiOjAuMH0sImZyZWVzdGFuZGluZyI6eyJib2R5X3lhdyI6ImppdHRlciIsImJvZHlfeWF3X3NpZGUiOjE4MC4wLCJicmVha19sYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwiZnJlZXN0YW5kIjpmYWxzZSwiaml0dGVyX2RlbGF5Ijo3LjAsInBpdGNoIjoic3RhdGljIiwicGl0Y2hfYW5nbGVzXzEiOi04OS4wLCJwaXRjaF9hbmdsZXNfMiI6LTQxLjAsInBpdGNoX3NwZWVkIjowLjAsInlhdyI6Im9wcG9zaXRlIiwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX3IiOjAuMCwieWF3X2FuZ2xlcyI6MzYwLjAsInlhd19hbmdsZXNfZGVsYXkiOjIuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfc3BlZWQiOjAuMH0sImdsb2JhbCI6eyJib2R5X3lhdyI6InN0YXRpYyIsImJvZHlfeWF3X3NpZGUiOjAuMCwiYnJlYWtfbGMiOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJmcmVlc3RhbmQiOnRydWUsImppdHRlcl9kZWxheSI6Mi4wLCJwaXRjaCI6InN0YXRpYyIsInBpdGNoX2FuZ2xlc18xIjotODkuMCwicGl0Y2hfYW5nbGVzXzIiOi0xOC4wLCJwaXRjaF9zcGVlZCI6MC4wLCJ5YXciOiJqaXR0ZXIiLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6LTI0LjAsInlhd19hbmdsZXMiOjg5LjAsInlhd19hbmdsZXNfZGVsYXkiOjQuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfc3BlZWQiOjAuMH0sImhpZGVzaG90cyI6eyJib2R5X3lhdyI6Im9mZiIsImJvZHlfeWF3X3NpZGUiOjAuMCwiYnJlYWtfbGMiOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJmcmVlc3RhbmQiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjEuMCwicGl0Y2giOiJvZmYiLCJwaXRjaF9hbmdsZXNfMSI6MC4wLCJwaXRjaF9hbmdsZXNfMiI6MC4wLCJwaXRjaF9zcGVlZCI6MC4wLCJ5YXciOiJvZmYiLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfYW5nbGVzIjowLjAsInlhd19hbmdsZXNfZGVsYXkiOjEuMCwieWF3X2Jhc2UiOiJsb2NhbCB2aWV3IiwieWF3X2ppdHRlciI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X3NwZWVkIjowLjB9LCJqdW1wIjp7ImJvZHlfeWF3Ijoiaml0dGVyIiwiYm9keV95YXdfc2lkZSI6MC4wLCJicmVha19sYyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJmcmVlc3RhbmQiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjIuMCwicGl0Y2giOiJqaXR0ZXIiLCJwaXRjaF9hbmdsZXNfMSI6LTg5LjAsInBpdGNoX2FuZ2xlc18yIjotODEuMCwicGl0Y2hfc3BlZWQiOi02LjAsInlhdyI6InNwaW4iLCJ5YXdfYWRkIjozMy4wLCJ5YXdfYWRkX3IiOi0zOC4wLCJ5YXdfYW5nbGVzIjozNy4wLCJ5YXdfYW5nbGVzX2RlbGF5IjozLjAsInlhd19iYXNlIjoiYXQgdGFyZ2V0IiwieWF3X2ppdHRlciI6ImRpc2FibGVkIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X3NwZWVkIjoyLjB9LCJydW4iOnsiYm9keV95YXciOiJqaXR0ZXIiLCJib2R5X3lhd19zaWRlIjowLjAsImJyZWFrX2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJmcmVlc3RhbmQiOmZhbHNlLCJqaXR0ZXJfZGVsYXkiOjIuMCwicGl0Y2giOiJvZmYiLCJwaXRjaF9hbmdsZXNfMSI6MC4wLCJwaXRjaF9hbmdsZXNfMiI6MC4wLCJwaXRjaF9zcGVlZCI6MC4wLCJ5YXciOiJvZmYiLCJ5YXdfYWRkIjo0Mi4wLCJ5YXdfYWRkX3IiOi0yNC4wLCJ5YXdfYW5nbGVzIjowLjAsInlhd19hbmdsZXNfZGVsYXkiOjEuMCwieWF3X2Jhc2UiOiJhdCB0YXJnZXQiLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfc3BlZWQiOjAuMH0sInNsb3cgd2FsayI6eyJib2R5X3lhdyI6ImppdHRlciIsImJvZHlfeWF3X3NpZGUiOjAuMCwiYnJlYWtfbGMiOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOnRydWUsImZyZWVzdGFuZCI6ZmFsc2UsImppdHRlcl9kZWxheSI6MS4wLCJwaXRjaCI6Im9mZiIsInBpdGNoX2FuZ2xlc18xIjowLjAsInBpdGNoX2FuZ2xlc18yIjowLjAsInBpdGNoX3NwZWVkIjowLjAsInlhdyI6Im9mZiIsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19hbmdsZXMiOjAuMCwieWF3X2FuZ2xlc19kZWxheSI6MS4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FkZCI6ODMuMCwieWF3X3NwZWVkIjowLjB9LCJzdGFuZCI6eyJib2R5X3lhdyI6ImppdHRlciIsImJvZHlfeWF3X3NpZGUiOjAuMCwiYnJlYWtfbGMiOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOnRydWUsImZyZWVzdGFuZCI6ZmFsc2UsImppdHRlcl9kZWxheSI6NS4wLCJwaXRjaCI6ImppdHRlciIsInBpdGNoX2FuZ2xlc18xIjo4LjAsInBpdGNoX2FuZ2xlc18yIjotNzkuMCwicGl0Y2hfc3BlZWQiOjAuMCwieWF3Ijoiaml0dGVyIiwieWF3X2FkZCI6NDEuMCwieWF3X2FkZF9yIjotMzQuMCwieWF3X2FuZ2xlcyI6ODMuMCwieWF3X2FuZ2xlc19kZWxheSI6NC4wLCJ5YXdfYmFzZSI6ImF0IHRhcmdldCIsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19zcGVlZCI6LTMuMH19LCJjb25maWciOnsibGlzdCI6IiIsIm5hbWUiOiIxc3RhciJ9LCJtYWluX2xpc3QiOjQuMCwibWlzYyI6eyJhaW1ib3RfbG9nZ2luZyI6dHJ1ZSwiYWlwZWVrIjpmYWxzZSwiYXV0b19oaWRlc2hvdHMiOnRydWUsImNoZWF0X3JldmVhbGVyIjpmYWxzZSwiY2xhbnRhZyI6ZmFsc2UsImZhbGwiOmZhbHNlLCJmYXN0IjpmYWxzZSwiZ3JlbmFkZV9yZWxlYXNlIjpmYWxzZSwiaWNvbl9zaGFyZWQiOmZhbHNlLCJraWxsc2F5IjpmYWxzZSwibmFkZV9maXhlciI6ZmFsc2UsIn5haW1ib3RfbG9nZ2luZyI6eyJoaXQiOiIjQTNEMzUwRkYiLCJtaXNzIjoiI0YwQkY1NkZGIn0sIn5haXBlZWsiOnsiYWlfa2V5IjpmYWxzZSwiZGVwYXJ0bWVudCI6My4wLCJkaXNhYmxlX2RfcHJlZGljdGlvbiI6dHJ1ZSwiZGlzYWJsZV9kb3JtYW50IjpmYWxzZSwiZ2FwIjoyMC4wLCJ0aWNrcyI6My4wLCJ0cF9kZWxheSI6MC4wLCJ0cF9wZWVrIjpmYWxzZX0sIn5hdXRvX2hpZGVzaG90cyI6eyJhdXRvX2hpZGVzaG90c193cG5zIjpbIlBpc3RvbCIsIlNjb3V0IiwiUmlmbGUiLCJ+Il19LCJ+Y2hlYXRfcmV2ZWFsZXIiOnsiY2hlYXRfcmV2ZWFsZXJfc3R5bGUiOlsiU2NvcmVib2FyZCBpY29uIiwiRmxhZyIsIn4iXX0sIn5ncmVuYWRlX3JlbGVhc2UiOnsiZGFtYWdlIjoxOS4wfX0sInN3aXRjaF9idWlsZGVyIjp0cnVlLCJ2aXN1YWxzIjp7ImFzcGVjdF9yYXRpbyI6dHJ1ZSwiY29uc29sZV9jb2xvciI6ZmFsc2UsImRhbWFnZV9pbmRpY2F0b3IiOnRydWUsImtlZXBzY29wZSI6ZmFsc2UsIm1hbnVhbF9hcnJvd3MiOmZhbHNlLCJuYWRlX3JhZGl1cyI6dHJ1ZSwic2NfaW5kaWNhdG9ycyI6dHJ1ZSwic2NvcGVfb3ZlcmxheSI6ZmFsc2UsInNpbmRpY2F0b3JzIjpmYWxzZSwidmVsb2NpdHlfaW5kaWNhdGlvbiI6dHJ1ZSwidmlld21vZGVsIjpmYWxzZSwifmFzcGVjdF9yYXRpbyI6eyJ2YWwiOjEwMC4wfSwifmNvbnNvbGVfY29sb3IiOnsiYWNjZW50X2NvbG9yIjoiIzIxMzE0Njg0In0sIn5tYW51YWxfYXJyb3dzIjp7Im1hbnVhbHNfY29sb3IiOiIjNzJBOEVDRkYiLCJtYW51YWxzX29mZnNldCI6NTAuMH0sIn5uYWRlX3JhZGl1cyI6eyJlbmVteV9tb2xvdG92X2NvbG9yIjoiI0ZGM0YzRkJFIiwiZ3JlbmFkZV9zZWxlY3QiOlsxLjAsMi4wLCJ+Il0sIm1vbG90b3ZfY29sb3IiOiIjNzRDMDI5RkYiLCJzbW9rZV9jb2xvciI6IiMzRDkzRkFCNCJ9LCJ+c2NfaW5kaWNhdG9ycyI6eyJidWlsZF9jb2xvciI6IiNGRkZGRkZGRiIsImdsb3dfcHgiOjkzLjAsImdsb3dfc3dpdGNoIjp0cnVlLCJpbmRfY29sb3IiOiIjRkZGRkZGRkYiLCJzY29wZV9tb3ZlIjp0cnVlfSwifnNjb3BlX292ZXJsYXkiOnsicmVtb3ZlX2xpbmUiOlsifiJdLCJzY29wZV9jb2xvciI6IiNGRkZGRkZGRiIsInNjb3BlX2dhcCI6Ny4wLCJzY29wZV9zaXplIjoxMDUuMCwic2NvcGVfc3R5bGUiOiJSZXZlcnNlZCJ9LCJ+c2luZGljYXRvcnMiOnsiZWxlIjpbIkxDIiwiRG91YmxlIHRhcCIsIkRvcm1hbnQgYWltYm90IiwiUGluZyBzcGlrZSIsIkZha2UgZHVjayIsIkZyZWVzdGFuZGluZyIsIkJvZHkgYWltIiwiSGlkZSBzaG90cyIsIkNob2tlZCBjb21tYW5kcyIsIn4iXX0sIn52ZWxvY2l0eV9pbmRpY2F0aW9uIjp7ImFpcmxhZ19hY2NlbnRfY29sb3IiOiIjNzg4N0ZGRkYiLCJhaXJsYWdfaW5kaWNhdGlvbiI6dHJ1ZSwiZGVmZW5zaXZlX2FjY2VudF9jb2xvciI6IiM3ODg3RkZGRiIsImRlZmVuc2l2ZV9pbmRpY2F0aW9uIjp0cnVlLCJ2ZWxvY2l0eV9hY2NlbnRfY29sb3IiOiIjNzg4N0ZGRkYiLCJ2ZWxvY2l0eV9pbmRpY2F0aW9uIjp0cnVlfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY0LjAsIngiOjI1LjAsInkiOjAuMCwieiI6LTE1LjB9fX0=");
    end;
end;
v37 = globals.tickcount;
v121 = true;
do
    local l_v37_3, l_v121_0 = v37, v121;
    v16.get_state = function()
        -- upvalues: l_utils_0 (ref), v14 (ref), l_v121_0 (ref), l_v37_3 (ref)
        local v191 = entity.get_local_player();
        local v192 = v191.m_vecVelocity:length();
        local v193 = l_utils_0.in_duck(v191) or v14.aa.other.fake_duck:get();
        local v194 = v192 > 1.5 and "run" or "stand";
        if l_utils_0.air(v191) or l_v121_0 then
            v194 = v193 and "duck jump" or "jump";
        elseif v192 > 1.5 and v193 then
            v194 = "duck move";
        elseif v14.aa.other.slow_walk:get() then
            v194 = "slow walk";
        elseif v193 then
            v194 = "duck";
        end;
        if globals.tickcount ~= l_v37_3 then
            l_v121_0 = l_utils_0.air(v191);
            l_v37_3 = globals.tickcount;
        end;
        return v194;
    end;
    v16.fs_disablers = {
        stand = function()
            -- upvalues: v16 (ref)
            return v16.get_state() == "stand";
        end, 
        run = function()
            -- upvalues: v16 (ref)
            return v16.get_state() == "run";
        end, 
        ["slow walk"] = function()
            -- upvalues: v16 (ref)
            return v16.get_state() == "slow walk";
        end, 
        jump = function()
            -- upvalues: l_utils_0 (ref)
            return l_utils_0.air(entity.get_local_player());
        end, 
        duck = function()
            -- upvalues: l_utils_0 (ref)
            return l_utils_0.in_duck(entity.get_local_player());
        end
    };
    v16.disable_freestanding = function()
        -- upvalues: v17 (ref), v16 (ref)
        if #v17.anitaim.freestand.air.value <= 0 then
            return;
        else
            for _, v196 in pairs(v17.anitaim.freestand.air()) do
                if v16.fs_disablers[v196]() then
                    return true;
                end;
            end;
            return;
        end;
    end;
    v16.calculate_additional_states = function()
        -- upvalues: v16 (ref), v14 (ref), v17 (ref), v19 (ref)
        local v197 = v16.get_state();
        local v198 = v14.rage.doubletap:get();
        local v199 = v14.rage.hideshots:get();
        local v200 = v14.aa.other.fake_duck:get();
        local v201 = v17.anitaim.freestand() and not v16.disable_freestanding();
        if v17.builder.freestanding.enable() and rage.antiaim:get_target(true) and v201 then
            v197 = "freestanding";
        end;
        if v19.reset then
            v197 = "air exploit";
        end;
        if v17.builder.fakelag.enable() and (not v198 and not v199 or v200) then
            v197 = "fakelag";
        end;
        if v17.builder.hideshots.enable() and v199 and not v198 and not v200 then
            v197 = "hideshots";
        end;
        return v197;
    end;
end;
v37 = {};
v121 = nil;
v122 = nil;
v165 = nil;
local v202 = nil;
local v203 = nil;
local l_realtime_0 = globals.realtime;
local v205 = false;
local v206 = false;
local v207 = l_vector_0(0, 0, 0);
do
    local l_v37_4, l_l_realtime_0_0, l_v205_0, l_v206_0, l_v207_0 = v37, l_realtime_0, v205, v206, v207;
    local function v231(v213)
        -- upvalues: v17 (ref), l_utils_0 (ref), l_v207_0 (ref), l_vector_0 (ref)
        if not v17.anitaim.manual() == "manual edge" then
            return;
        elseif l_utils_0.air(entity.get_local_player()) then
            return;
        else
            local v214 = entity.get_local_player();
            if v214 == nil then
                return;
            else
                if v213.send_packet then
                    l_v207_0 = v214:get_eye_position();
                end;
                local v215 = {};
                local v216 = render.camera_angles();
                local v217 = {};
                for v218 = 18, 360, 18 do
                    v218 = math.normalize_yaw(v218);
                    local v219 = l_v207_0 + l_vector_0():angles(0, v218) * 198;
                    local v220 = l_utils_0.trace_line(l_v207_0, v219, v214, 1174421507);
                    table.insert(v217, l_v207_0:dist(v220.end_pos));
                    local l_fraction_0 = v220.fraction;
                    local l_entity_0 = v220.entity;
                    if l_entity_0 and l_entity_0:get_classname() == "CWorld" and l_fraction_0 < 0.3 then
                        v215[#v215 + 1] = {
                            vecTraceEnd = v219, 
                            flYaw = v218
                        };
                    end;
                end;
                table.sort(v217);
                if v217[1] > 30 then
                    return;
                else
                    table.sort(v215, function(v223, v224)
                        return v223.flYaw < v224.flYaw;
                    end);
                    table.remove(v215, #v215);
                    local v225 = nil;
                    if #v215 >= 3 then
                        local v226 = v215[1].vecTraceEnd:lerp(v215[#v215].vecTraceEnd, 0.5);
                        v225 = (l_v207_0 - v226):angles();
                    end;
                    if v225 then
                        local l_y_0 = v216.y;
                        local l_y_1 = v225.y;
                        local v229 = math.normalize_yaw(l_y_1 - l_y_0);
                        if math.abs(v229) < 90 then
                            v229 = 0;
                            l_y_0 = math.normalize_yaw(l_y_1 + 180);
                        end;
                        local v230 = -l_y_0;
                        return (math.normalize_yaw(v230 + l_y_1 + v229 + 180));
                    else
                        return;
                    end;
                end;
            end;
        end;
    end;
    v23.get_manual = function(v232)
        -- upvalues: v17 (ref), v231 (ref)
        local _ = entity.get_local_player();
        local v234 = v17.anitaim.manual() == "manual left";
        local v235 = v17.anitaim.manual() == "manual right";
        local v236 = v17.anitaim.manual() == "manual forward";
        local v237 = v17.anitaim.manual() == "manual edge";
        if v234 then
            return -90;
        elseif v235 then
            return 90;
        elseif v236 then
            return 180;
        elseif v237 then
            return v231(v232);
        else
            return;
        end;
    end;
    local function v240(v238)
        -- upvalues: v14 (ref), l_v206_0 (ref)
        local v239 = v238 * 2;
        if v14.rage.doubletap:get() or v14.rage.hideshots:get() then
            if globals.tickcount % v239 == v239 - 1 then
                l_v206_0 = not l_v206_0;
            end;
        elseif globals.tickcount % 2 == 0 then
            l_v206_0 = not l_v206_0;
        end;
        return l_v206_0;
    end;
    local function v243(v241)
        -- upvalues: l_v205_0 (ref)
        local v242 = v241 * 2;
        if globals.tickcount % v242 == v242 - 1 then
            l_v205_0 = not l_v205_0;
        end;
        return l_v205_0;
    end;
    v18.anitaim_builder = function(v244)
        -- upvalues: l_v37_4 (ref), v240 (ref)
        l_v37_4.body_yaw_options = "";
        l_v37_4.body_yaw_freestanding = "off";
        if v244.body_yaw() == "static" then
            l_v37_4.modifier = v244.yaw_jitter();
            l_v37_4.modifier_add = v244.yaw_jitter_add();
            l_v37_4.yaw_value = v244.yaw_add();
            l_v37_4.body = true;
            if v244.body_yaw_side() > 0 then
                l_v37_4.inverter = false;
                l_v37_4.fake_r = -v244.body_yaw_side() * 0.32;
            else
                l_v37_4.inverter = true;
                l_v37_4.fake_l = v244.body_yaw_side() * 0.32;
            end;
        elseif v244.body_yaw() == "jitter" then
            l_v37_4.modifier = "Disabled";
            l_v37_4.yaw_value = rage.antiaim:inverter() and v244.yaw_add_r() or v244.yaw_add();
            l_v37_4.inverter = v240(v244.jitter_delay());
            l_v37_4.body = true;
            l_v37_4.fake_r = 60;
            l_v37_4.fake_l = 60;
            if v244.yaw_jitter() == "offset" then
                l_v37_4.yaw_value = l_v37_4.yaw_value + (rage.antiaim:inverter() and v244.yaw_jitter_add() / 2 or 0);
            elseif v244.yaw_jitter() == "center" then
                l_v37_4.yaw_value = l_v37_4.yaw_value + (rage.antiaim:inverter() and -v244.yaw_jitter_add() / 2 or v244.yaw_jitter_add() / 2);
            end;
        elseif v244.body_yaw() == "off" then
            l_v37_4.modifier = v244.yaw_jitter();
            l_v37_4.modifier_add = v244.yaw_jitter_add();
            l_v37_4.yaw_value = v244.yaw_add();
            l_v37_4.body = false;
        end;
    end;
    local v245 = false;
    v21.use = function(v246)
        -- upvalues: v245 (ref), v17 (ref), l_l_realtime_0_0 (ref)
        v245 = false;
        if not v17.anitaim.antiaims_tweaks:get("anti-aim on use") then
            return;
        elseif not v246.in_use then
            l_l_realtime_0_0 = globals.realtime;
            return;
        else
            local v247 = entity.get_local_player();
            if v247 == nil then
                return;
            else
                local v248 = v247:get_origin();
                local v249 = entity.get_entities("CPlantedC4");
                local v250 = 999;
                if #v249 > 0 then
                    v250 = v248:dist((v249[1]:get_origin()));
                end;
                local v251 = entity.get_entities("CHostage");
                local v252 = 999;
                if #v251 > 0 then
                    local v253 = {
                        v251[1]:get_origin(), 
                        v251[2]:get_origin()
                    };
                    v252 = math.min(v248:dist(v253[1]), v248:dist(v253[2]));
                end;
                if v252 < 65 and v247.m_iTeamNum ~= 2 then
                    return;
                elseif v250 < 65 and v247.m_iTeamNum ~= 2 then
                    return;
                elseif v246.in_use and globals.realtime - l_l_realtime_0_0 < 0.02 then
                    return;
                else
                    v246.in_use = false;
                    v245 = true;
                    return;
                end;
            end;
        end;
    end;
    v21.tweaks = function(v254, v255)
        -- upvalues: l_v37_4 (ref), v17 (ref), v23 (ref), v16 (ref), v14 (ref), l_utils_0 (ref), v245 (ref)
        local v256 = entity.get_local_player();
        l_v37_4.defensive_dis = false;
        if v17.anitaim.antiaims_tweaks:get("static manual") and v23.get_manual(v255) then
            l_v37_4.yaw_value = v23.get_manual(v255);
            l_v37_4.body_yaw_options = "";
            l_v37_4.modifier = "disabled";
            l_v37_4.inverter = false;
            l_v37_4.defensive_dis = true;
        elseif v23.get_manual(v255) and v17.anitaim.antiaims_tweaks() ~= "static manual" then
            l_v37_4.yaw_value = l_v37_4.yaw_value + v23.get_manual(v255);
            l_v37_4.defensive_dis = true;
        end;
        l_v37_4.bese = v23.get_manual(v255) and "local view" or v254.yaw_base();
        if v17.anitaim.freestand() and not v16.disable_freestanding() and rage.antiaim:get_target(true) then
            l_v37_4.fs = true;
        else
            l_v37_4.fs = false;
        end;
        v14.aa.angles.yaw_backstab:override(v17.anitaim.antiaims_tweaks:get("avoid-backstab"));
        if v256:get_player_weapon() ~= nil and v256:get_player_weapon():get_classname() == "CKnife" and l_utils_0.air(v256) and v17.anitaim.antiaims_tweaks:get("safe head") then
            l_v37_4.inverter = false;
            l_v37_4.yaw_value = 0;
            l_v37_4.modifier = "Disabled";
            l_v37_4.options = "";
            l_v37_4.defensive_dis = true;
        end;
        if v245 then
            l_v37_4.bese = "local view";
            l_v37_4.pitch = "Disabled";
            l_v37_4.yaw_value = l_v37_4.yaw_value + 180;
            l_v37_4.fs = false;
            l_v37_4.hidden = false;
            l_v37_4.defensive_dis = true;
        else
            l_v37_4.pitch = "down";
        end;
    end;
    local v257 = 0;
    l_v37_4.defensive_yaw = 0;
    local v258 = false;
    v18.defensive = function(v259)
        -- upvalues: l_v37_4 (ref), v17 (ref), v258 (ref), v257 (ref), l_utils_0 (ref), v243 (ref)
        l_v37_4.break_lc = v259.break_lc();
        if v17.anitaim.antiaims_tweaks:get("manual disabled defensive") and l_v37_4.defensive_dis then
            l_v37_4.defensive = false;
        else
            l_v37_4.defensive = v259.defensive();
        end;
        if not v259.defensive() then
            return;
        else
            if v259.pitch() == "off" then
                l_v37_4.defensive_pitch = 89;
            elseif v259.pitch() == "static" then
                l_v37_4.defensive_pitch = v259.pitch_angles_1();
            elseif v259.pitch() == "jitter" then
                if globals.choked_commands == 0 then
                    v258 = not v258;
                end;
                l_v37_4.defensive_pitch = v258 and v259.pitch_angles_1() or v259.pitch_angles_2();
            elseif v259.pitch() == "spin" then
                v257 = l_utils_0.normalize_pitch(v257 + v259.pitch_angles_1() / (v259.pitch_speed() == 0 and v259.pitch_angles_1() or v259.pitch_speed() / 10));
                l_v37_4.defensive_pitch = v257;
            elseif v259.pitch() == "random" then
                l_v37_4.defensive_pitch = l_utils_0.random_int(v259.pitch_angles_1(), v259.pitch_angles_2());
            elseif v259.pitch() == "3-way" then
                l_v37_4.defensive_pitch = ({
                    nil, 
                    0, 
                    [1] = -v259.pitch_angles_1(), 
                    v259.pitch_angles_2()
                })[globals.tickcount % 3 + 1];
            end;
            if v259.yaw() == "off" then
                l_v37_4.defensive_yaw = 0;
            elseif v259.yaw() == "static" then
                l_v37_4.defensive_yaw = v259.yaw_angles();
            elseif v259.yaw() == "jitter" and l_utils_0.defensive() > 0 then
                l_v37_4.inverter = v243(v259.yaw_angles_delay());
                l_v37_4.defensive_yaw = rage.antiaim:inverter() and v259.yaw_angles() or -v259.yaw_angles();
            elseif v259.yaw() == "spin" then
                l_v37_4.defensive_yaw = l_utils_0.normalize_yaw(l_v37_4.defensive_yaw + v259.yaw_angles() / (v259.yaw_speed() == 0 and v259.yaw_angles() or v259.yaw_speed()));
            elseif v259.yaw() == "random" then
                l_v37_4.defensive_yaw = l_utils_0.random_int(-v259.yaw_angles() / 2, v259.yaw_angles() / 2);
            elseif v259.yaw() == "opposite" then
                l_v37_4.defensive_yaw = 180;
            elseif v259.yaw() == "3-way" then
                l_v37_4.defensive_yaw = ({
                    [1] = nil, 
                    [2] = 180, 
                    [1] = -v259.yaw_angles() / 2, 
                    [3] = v259.yaw_angles() / 2
                })[globals.tickcount % 3 + 1] + l_utils_0.random_int(-18, 18);
            end;
            if l_utils_0.defensive() > 0 and v259.freestand() then
                l_v37_4.yaw_value = 0;
            end;
            return;
        end;
    end;
    v18.setup = function(v260)
        -- upvalues: v16 (ref), v17 (ref), v18 (ref), v21 (ref), l_v37_4 (ref), v14 (ref)
        if entity.get_local_player() == nil then
            return;
        else
            local v261 = v16.calculate_additional_states();
            local v262 = v17.builder[v261].enable() and v17.builder[v261] or v17.builder.global;
            v18.anitaim_builder(v262);
            v18.defensive(v262);
            v21.tweaks(v262, v260);
            if l_v37_4.inverter ~= nil then
                v14.aa.angles.inverter:override(l_v37_4.inverter);
            end;
            if l_v37_4.pitch ~= nil then
                v14.aa.angles.pitch:override(l_v37_4.pitch);
            end;
            if l_v37_4.bese ~= nil then
                v14.aa.angles.yaw_base:override(l_v37_4.bese);
            end;
            if l_v37_4.yaw_value ~= nil then
                v14.aa.angles.yaw_offset:override(l_v37_4.yaw_value);
            end;
            if l_v37_4.body ~= nil then
                v14.aa.angles.body_yaw:override(l_v37_4.body);
            end;
            v14.aa.angles.yaw:override("backward");
            if l_v37_4.fake_l ~= nil then
                v14.aa.angles.left_limit:override(l_v37_4.fake_l);
            end;
            if l_v37_4.fake_l ~= nil then
                v14.aa.angles.right_limit:override(l_v37_4.fake_r);
            end;
            if l_v37_4.options ~= nil then
                v14.aa.angles.body_yaw_options:override(l_v37_4.options);
            end;
            if l_v37_4.freestanding ~= nil then
                v14.aa.angles.body_yaw_freestanding:override(l_v37_4.freestanding);
            end;
            if l_v37_4.modifier ~= nil then
                v14.aa.angles.yaw_modifier:override(l_v37_4.modifier);
            end;
            if l_v37_4.modifier_add ~= nil then
                v14.aa.angles.yaw_modifier_offset:override(l_v37_4.modifier_add);
            end;
            if l_v37_4.defensive_pitch ~= nil then
                rage.antiaim:override_hidden_pitch(l_v37_4.defensive_pitch);
            end;
            if l_v37_4.defensive_yaw ~= nil and v262.yaw() ~= "neverlose" then
                rage.antiaim:override_hidden_yaw_offset(l_v37_4.defensive_yaw);
            end;
            if l_v37_4.defensive ~= nil then
                v14.aa.angles.hidden:override(l_v37_4.defensive);
            end;
            if l_v37_4.break_lc ~= nil then
                v14.rage.doubletap_config:override(l_v37_4.break_lc and "always on" or "on peek");
                v14.rage.hideshots_config:override(l_v37_4.break_lc and "Break LC" or nil);
            end;
            if l_v37_4.fs ~= nil then
                v14.aa.angles.freestanding:override(l_v37_4.fs);
            end;
            if v17.anitaim.roll() then
                v260.view_angles.z = v17.anitaim.roll.auto_switch() and (rage.antiaim:inverter() and v17.anitaim.roll.roll() or -v17.anitaim.roll.roll()) or v17.anitaim.roll.roll();
            end;
            v14.aa.angles.disable_yaw_modif:override(false);
            v14.aa.angles.body_freestanding:override(false);
            return;
        end;
    end;
    v17.switch_builder:set_event("createmove", v21.use);
    v17.switch_builder:set_event("createmove", v18.setup);
end;
v37 = nil;
v37 = {
    handle = function()
        -- upvalues: v34 (ref), v17 (ref), l_ffi_0 (ref), v14 (ref), l_utils_0 (ref)
        local v263 = entity.get_local_player();
        local v264 = v34.entity_list_pointer(v263:get_index());
        if v263 == nil then
            return;
        else
            if v17.anitaim.anim_breakers:get("legs in air") then
                if v17.anitaim.anim_breakers.air() == "allah" then
                    if bit.band(entity.get_local_player().m_fFlags, 1) == 0 then
                        l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_flWeight = 1;
                        entity.get_local_player().m_flPoseParameter[7] = 1;
                    end;
                elseif v17.anitaim.anim_breakers.air() == "t-pose" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][4].m_flCycle = 0.4;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][4].m_nSequence = 11;
                elseif v17.anitaim.anim_breakers.air() == "static" then
                    entity.get_local_player().m_flPoseParameter[6] = 1;
                elseif v17.anitaim.anim_breakers.air() == "dumb" and bit.band(entity.get_local_player().m_fFlags, 1) == 0 then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_nSequence = 135;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_nSequence = 100;
                elseif v17.anitaim.anim_breakers.air() == "stiff duck" and bit.band(entity.get_local_player().m_fFlags, 1) == 0 then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_nSequence = 30;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_nSequence = 30;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][2].m_flCycle = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_flCycle = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_nSequence = 185;
                end;
            end;
            if v17.anitaim.anim_breakers:get("legs on ground") then
                if v17.anitaim.anim_breakers.ground() == "allah" then
                    v14.aa.other.legs:set("Walking");
                    entity.get_local_player().m_flPoseParameter[7] = 0;
                elseif v17.anitaim.anim_breakers.ground() == "sliding" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_flWeight = 1;
                    entity.get_local_player().m_flPoseParameter[0] = 1;
                    v14.aa.other.legs:set("Sliding");
                elseif not bit.band(entity.get_local_player().m_fFlags, 1) == 0 and v17.anitaim.anim_breakers.ground() == "dislocated arm" then
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][6].m_nSequence = 5;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][4].m_flCycle = 5;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][8].m_flWeight = 1;
                    l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][7].m_nSequence = 400;
                end;
            end;
            if v17.anitaim.anim_breakers:get("0 pitch on land") and entity.get_local_player():get_anim_state().landing then
                entity.get_local_player().m_flPoseParameter[12] = 0.5;
            end;
            if v17.anitaim.anim_breakers:get("move lean earthquake") then
                l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v264) + 10640)[0][12].m_flWeight = l_utils_0.random_int(-0.3, 0.65);
            end;
            return;
        end;
    end
};
v17.switch_builder:set_event("post_update_clientside_animation", v37.handle);
v19.reset = false;
v19.backups = function()
    -- upvalues: v19 (ref), v14 (ref)
    if v19.reset then
        v14.aa.other.fake_duck:override(nil);
        v14.aa.fakelag.fakelag_limit:override(nil);
        v14.aa.fakelag.fakelag_var:override(nil);
        cvar.sv_maxusrcmdprocessticks:int(16);
        v19.reset = false;
    end;
end;
v19.handle = function()
    -- upvalues: v17 (ref), v19 (ref), v14 (ref)
    if not v17.anitaim.air_lag() then
        return v19.backups();
    elseif not v14.rage.doubletap:get() then
        return v19.backups();
    else
        cvar.sv_maxusrcmdprocessticks:int(19);
        v14.aa.fakelag.fakelag_limit:override(17);
        v14.aa.fakelag.fakelag_var:override(0);
        rage.exploit:force_charge();
        v14.aa.other.fake_duck:override(globals.tickcount % 10 == 0 or nil);
        v19.reset = true;
        return;
    end;
end;
v17.switch_builder:set_event("createmove", v19.handle);
v121 = render.load_font("Verdana Bold", 10, "ad");
v122 = render.screen_size();
do
    local l_v121_1, l_v122_0 = v121, v122;
    v20.sc_indicators = function()
        -- upvalues: v17 (ref), v13 (ref), v14 (ref), v19 (ref), l_v121_1 (ref), l_utils_0 (ref), l_v122_0 (ref), l_vector_0 (ref)
        local v267 = {};
        local v268 = v17.visuals.sc_indicators();
        local v269 = v17.visuals.sc_indicators.ind_color();
        local v270 = v17.visuals.sc_indicators.build_color();
        v267.main = v13.new("screen_indication_main", v268 and 255 or 0);
        if v267.main < 1 then
            return;
        else
            local v271 = entity.get_local_player();
            if v271 == nil or not v271:is_alive() then
                return;
            else
                local l_m_bIsScoped_0 = v271.m_bIsScoped;
                local v273 = 25 + v17.visuals.sc_indicators.glow_px();
                local v274 = {
                    [1] = {
                        [1] = "safe", 
                        [2] = v14.rage.prefer_safety:get() == "Force"
                    }, 
                    [2] = {
                        [1] = "body", 
                        [2] = v14.rage.prefer_body:get() == "Force"
                    }, 
                    [3] = {
                        "dt", 
                        v14.rage.doubletap:get()
                    }, 
                    [4] = {
                        "hs", 
                        v14.rage.hideshots:get()
                    }, 
                    [5] = {
                        "fs", 
                        v17.anitaim.freestand()
                    }, 
                    [6] = {
                        [1] = "al", 
                        [2] = v19.reset
                    }
                };
                local l_x_1 = render.measure_text(l_v121_1, nil, "meteor").x;
                v267.lua_name = {};
                v267.lua_name.move = {};
                v267.lua_name.alpha = v13.new("lua_name_alpha", v268 and 255 or 0);
                v267.lua_name.move = 0 + string.format("%.0f", v13.new("lua_name_move", not (not v268 or l_m_bIsScoped_0) and -l_x_1 * 0.5 or 15));
                v267.lua_name.text = l_utils_0.CreateAnimationText("meteor", v269:override("a", v267.lua_name.alpha), v270:override("a", v267.lua_name.alpha), 85, true);
                if v267.lua_name.alpha > 1 then
                    if v17.visuals.sc_indicators.glow_switch() then
                        render.shadow(l_v122_0 * 0.5 + l_vector_0(v267.lua_name.move, v273 + 7), l_v122_0 * 0.5 + l_vector_0(v267.lua_name.move, v273 + 7) + l_vector_0(l_x_1, 0), color(v269.r, v269.g, v269.b, v267.lua_name.alpha), 20, 0);
                    end;
                    render.text(l_v121_1, l_v122_0 * 0.5 + l_vector_0(v267.lua_name.move, v273), color(v269.r, v269.g, v269.b, v267.lua_name.alpha), nil, v267.lua_name.text);
                    v273 = v273 + string.format("%.0f", v267.lua_name.alpha / 255 * 12);
                end;
                local _ = "";
                v267.binds = {};
                for _, v278 in pairs(v274) do
                    v267.binds[v278[1]] = {};
                    v267.binds[v278[1]].alpha = v13.new("binds_alpha_" .. v278[1], v268 and v278[2] and 255 or 0, 0.5);
                    v267.binds[v278[1]].move = 0 + string.format("%.0f", v13.new("binds_move_" .. v278[1], not (not v268 or l_m_bIsScoped_0) and -render.measure_text(1, nil, v278[1]).x * 0.5 or 15));
                    if v267.binds[v278[1]].alpha > 1 then
                        render.text(1, l_v122_0 * 0.5 + l_vector_0(v267.binds[v278[1]].move, v273), v278[1] ~= "hs" and color() or not v14.rage.doubletap:get() and color() or color(255, 100, 100, v267.binds[v278[1]].alpha) or v278[1] ~= "dt" and color() or rage.exploit:get() == 1 and color() or color(255, 100, 100, v267.binds[v278[1]].alpha), nil, v278[1]);
                        v273 = v273 + string.format("%.0f", v267.binds[v278[1]].alpha / 255 * 12);
                    end;
                end;
                return;
            end;
        end;
    end;
    v20.damage_indicator = function()
        -- upvalues: v14 (ref), l_vector_0 (ref), l_v122_0 (ref)
        local v279 = entity.get_local_player();
        if v279 == nil or not v279:is_alive() then
            return;
        else
            local _ = render.screen_size() / 2;
            local v281 = tostring(v14.rage.min_damage:get());
            render.text(1, l_vector_0(l_v122_0.x / 2 + 10, l_v122_0.y / 2 - 15), color(), "", v281);
            return;
        end;
    end;
    v17.visuals.sc_indicators:set_event("render", v20.sc_indicators);
    v17.visuals.damage_indicator:set_event("render", v20.damage_indicator);
    events.render:set(function()
        -- upvalues: l_v121_1 (ref), l_vector_0 (ref), l_v122_0 (ref)
        render.text(l_v121_1, l_vector_0(l_v122_0.x * 0.5, l_v122_0.y - 15), color(), "c", "m e t e o r");
    end);
    v17.misc.aipeek.ai_key:set_event("render", function()
        -- upvalues: v17 (ref), l_v121_1 (ref), l_vector_0 (ref), l_v122_0 (ref)
        if not v17.misc.aipeek() then
            return;
        else
            render.text(l_v121_1, l_vector_0(l_v122_0.x * 0.5, l_v122_0.y / 2 - 50), color(), "c", "AI-PEEK");
            return;
        end;
    end);
end;
v121 = cvar.r_aspectratio;
v122 = v121.float;
do
    local l_v121_2, l_v122_1 = v121, v122;
    v165 = function()
        -- upvalues: v17 (ref), l_v122_1 (ref), l_v121_2 (ref)
        local v284 = v17.visuals.aspect_ratio.val() / 100;
        if v17.visuals.aspect_ratio.val() == 50 then
            v284 = 0;
        end;
        if not v17.visuals.aspect_ratio() then
            v284 = 0;
        end;
        if v284 ~= l_v122_1(l_v121_2) then
            l_v122_1(l_v121_2, v284);
        end;
    end;
    v202 = function()
        -- upvalues: l_v122_1 (ref), l_v121_2 (ref)
        l_v122_1(l_v121_2, 0);
    end;
    v203 = function()
        -- upvalues: v17 (ref)
        if v17.visuals.viewmodel() then
            print(1);
            cvar.viewmodel_fov:float(v17.visuals.viewmodel.fov(), true);
            cvar.viewmodel_offset_x:float(v17.visuals.viewmodel.x() / 10, true);
            cvar.viewmodel_offset_y:float(v17.visuals.viewmodel.y() / 10, true);
            cvar.viewmodel_offset_z:float(v17.visuals.viewmodel.z() / 10, true);
        else
            cvar.viewmodel_fov:float(68);
            cvar.viewmodel_offset_x:float(2.5);
            cvar.viewmodel_offset_y:float(0);
            cvar.viewmodel_offset_z:float(-5);
        end;
    end;
    l_realtime_0 = function()
        cvar.viewmodel_fov:float(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-5);
    end;
    v203();
    v165();
    v17.visuals.viewmodel:set_callback(v165);
    v17.visuals.viewmodel.fov:set_callback(v165);
    v17.visuals.viewmodel.x:set_callback(v165);
    v17.visuals.viewmodel.y:set_callback(v165);
    v17.visuals.viewmodel.z:set_callback(v165);
    v17.visuals.aspect_ratio:set_callback(v165);
    v17.visuals.aspect_ratio.val:set_callback(v165);
    v17.visuals.aspect_ratio.preset1:set_callback(v165);
    v17.visuals.aspect_ratio.preset2:set_callback(v165);
    v17.visuals.aspect_ratio.preset3:set_callback(v165);
    v17.visuals.aspect_ratio.preset4:set_callback(v165);
    v17.visuals.aspect_ratio.preset5:set_callback(v165);
    events.shutdown:set(v202);
    events.shutdown:set(l_realtime_0);
end;
v121 = nil;
v121 = function(v285)
    -- upvalues: v9 (ref), v17 (ref), l_utils_0 (ref)
    local v286 = v9[v285.hitgroup];
    local v287 = entity.get(v285.target);
    local v288 = v287:get_name();
    local l_damage_0 = v285.damage;
    local l_hitchance_0 = v285.hitchance;
    local l_state_0 = v285.state;
    local l_m_iHealth_0 = v287.m_iHealth;
    local v293 = v9[v285.wanted_hitgroup];
    local l_backtrack_0 = v285.backtrack;
    local v295 = v17.misc.aimbot_logging.hit();
    local v296 = v17.misc.aimbot_logging.miss();
    local function v300(v297, v298)
        -- upvalues: v295 (ref), v296 (ref)
        local v299 = v297 == 1 and v295 or v297 == 2 and v296;
        if v299 ~= nil then
            return "\a" .. v299:to_hex() .. v298 .. "\aDCDCDCFF";
        else
            return;
        end;
    end;
    if l_state_0 == nil then
        local v301 = "  METEOR ~ " .. "Hit " .. v300(1, v288) .. "'s " .. v300(1, v286) .. " for " .. v300(1, l_damage_0) .. " damage " .. "( hc = " .. v300(1, l_hitchance_0) .. " | " .. v300(1, l_m_iHealth_0) .. " health remaining" .. " | backtrack = " .. v300(1, l_backtrack_0) .. ")";
        local v302 = "Hit " .. v300(1, v288) .. "'s " .. v300(1, v286) .. " for " .. v300(1, l_damage_0) .. " damage " .. "( hc = " .. v300(1, l_hitchance_0) .. " | " .. v300(1, l_m_iHealth_0) .. " health remaining" .. " | backtrack = " .. v300(1, l_backtrack_0) .. ")";
        if v17.misc.aimbot_logging.selectable:get("print_dev") then
            print_dev(v302);
        end;
        if v17.misc.aimbot_logging.selectable:get("print_raw") then
            print_raw(v301);
        end;
        if v17.misc.aimbot_logging.selectable:get("notify") then
            l_utils_0.notify(v302, false);
        end;
    else
        local v303 = "  METEOR ~ " .. "Missed " .. v300(2, v288) .. "'s " .. v300(2, v293) .. " due to " .. v300(2, l_state_0) .. " ( hc = " .. v300(2, l_hitchance_0) .. " | backtrack = " .. v300(2, l_backtrack_0) .. ")";
        local v304 = "Missed " .. v300(2, v288) .. "'s " .. v300(2, v293) .. " due to " .. v300(2, l_state_0) .. " ( hc = " .. v300(2, l_hitchance_0) .. " | backtrack = " .. v300(2, l_backtrack_0) .. ")";
        if v17.misc.aimbot_logging.selectable:get("print_dev") then
            print_dev(v304);
        end;
        if v17.misc.aimbot_logging.selectable:get("print_raw") then
            print_raw(v303);
        end;
        if v17.misc.aimbot_logging.selectable:get("notify") then
            l_utils_0.notify(v304, false);
        end;
    end;
end;
v17.misc.aimbot_logging:set_event("aim_ack", v121);
v122 = false;
v165 = false;
v202 = render.load_font("Calibri Bold", l_vector_0(25, 22, -1), "a, d");
v203 = 0;
l_realtime_0 = 0;
v205 = 0;
v206 = 0;
v207 = 0;
local v305 = 0;
local v306 = false;
do
    local l_v122_2, l_v165_1, l_v202_0, l_v203_0, l_l_realtime_0_1, l_v205_1, l_v206_1, l_v207_1, l_v305_0, l_v306_0 = v122, v165, v202, v203, l_realtime_0, v205, v206, v207, v305, v306;
    local function v326(v317, v318, v319, v320, v321, v322)
        -- upvalues: l_v202_0 (ref), l_vector_0 (ref)
        local v323 = render.screen_size().x / 100 + 9;
        local v324 = render.screen_size().y / 1.47 + 70;
        local v325 = render.measure_text(l_v202_0, nil, v317);
        render.gradient(l_vector_0(v323 / 1.9, v324 + v318), l_vector_0(v323 / 1.9 + v325.x / 2 + 5, v324 + v318 + v325.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
        render.gradient(l_vector_0(v323 / 1.9 + v325.x / 2 + 5, v324 + v318), l_vector_0(v323 / 1.9 + v325.x + 40, v324 + v318 + v325.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
        render.text(l_v202_0, l_vector_0(v323, v324 + 8 + v318), v319, nil, v317);
        if v322 == true then
            render.texture(c4_img, l_vector_0(v323, v324 + v318 + 2), l_vector_0(32, 30), v319, "f", 1);
        end;
        if v320 and v321 then
            render.circle_outline(l_vector_0(v323 + v325.x + 18, v324 + v318 + v325.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5);
            render.circle_outline(l_vector_0(v323 + v325.x + 18, v324 + v318 + v325.y / 2 + 8), v320, 9, 1, v321, 3);
        end;
    end;
    v24.indicator = function()
        -- upvalues: l_v306_0 (ref), l_v122_2 (ref), l_v165_1 (ref), l_format_0 (ref), l_l_realtime_0_1 (ref), l_v205_1 (ref), l_v206_1 (ref), l_v207_1 (ref), l_v305_0 (ref), v17 (ref), v14 (ref), v326 (ref)
        local v327 = entity.get_local_player();
        if v327 == nil or v327:is_alive() == false then
            return;
        else
            for _, v329 in ipairs(entity.get_players(true)) do
                if v329 == nil then
                    l_v306_0 = false;
                end;
                if v329 ~= nil and v329:is_enemy() and v329:is_dormant() then
                    l_v306_0 = true;
                else
                    l_v306_0 = false;
                end;
            end;
            local v330 = ui.get_binds();
            for v331 in pairs(v330) do
                if v330[v331].name == "Hit Chance" then
                    if v330[v331].active then
                        l_v122_2 = true;
                    else
                        l_v122_2 = false;
                    end;
                end;
                if v330[v331].name == "Min. Damage" then
                    if v330[v331].active then
                        l_v165_1 = true;
                    else
                        l_v165_1 = false;
                    end;
                end;
            end;
            local v332 = 40;
            local v333 = 0;
            local v334 = {
                [1] = {
                    l_format_0("%i-%i-%i-%i-%i", l_l_realtime_0_1, l_v205_1, l_v206_1, l_v207_1, l_v305_0), 
                    v17.visuals.sindicators.ele:get("Choked commands"), 
                    color(200, 199, 197)
                }, 
                [2] = {
                    "H1TCHANCE", 
                    v17.visuals.sindicators.ele:get("Hitchance") and l_v122_2 == true, 
                    color(200, 199, 197)
                }, 
                [3] = {
                    "PING", 
                    v17.visuals.sindicators.ele:get("Ping spike") and v14.misc.fake_latency:get() > 0, 
                    color(163, 194, 43)
                }, 
                [4] = {
                    "SAFE", 
                    v17.visuals.sindicators.ele:get("Safe points") and v14.rage.prefer_safety:get() == "Force", 
                    color(200, 199, 197)
                }, 
                [5] = {
                    "BODY", 
                    v17.visuals.sindicators.ele:get("Body Aim") and v14.rage.prefer_body:get() == "Force", 
                    color(200, 199, 197)
                }, 
                [6] = {
                    [1] = "DT", 
                    [2] = v17.visuals.sindicators.ele:get("Double tap") and v14.rage.doubletap:get(), 
                    [3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [7] = {
                    "MD", 
                    v17.visuals.sindicators.ele:get("Minimum damage") and l_v165_1 == true, 
                    color(200, 199, 197)
                }, 
                [8] = {
                    [1] = "DA", 
                    [2] = v17.visuals.sindicators.ele:get("Dormant aimbot") and v14.rage.dormant:get(), 
                    [3] = l_v306_0 == true and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [9] = {
                    "DUCK", 
                    v17.visuals.sindicators.ele:get("Fake duck") and v14.aa.other.fake_duck:get(), 
                    color(200, 199, 197)
                }, 
                [10] = {
                    "FS", 
                    v17.visuals.sindicators.ele:get("Freestanding") and v17.anitaim.freestand(), 
                    color(200, 199, 197)
                }, 
                [11] = {
                    "OSAA", 
                    v17.visuals.sindicators.ele:get("Hide shots") and v14.rage.hideshots:get() and not v14.rage.doubletap:get() and not v14.aa.other.fake_duck:get(), 
                    color(200, 199, 197)
                }
            };
            for _, v336 in pairs(v334) do
                if v336[2] then
                    v326(v336[1], v333, v336[3], v336[4], v336[5], v336[6]);
                    v333 = v333 - v332;
                end;
            end;
            return;
        end;
    end;
    local function v338(v337)
        -- upvalues: l_v203_0 (ref), l_v305_0 (ref), l_v207_1 (ref), l_v206_1 (ref), l_v205_1 (ref), l_l_realtime_0_1 (ref)
        if entity.get_local_player() == nil or entity.get_local_player():is_alive() == false then
            return;
        else
            if v337.choked_commands < l_v203_0 then
                l_v305_0 = l_v207_1;
                l_v207_1 = l_v206_1;
                l_v206_1 = l_v205_1;
                l_v205_1 = l_l_realtime_0_1;
                l_l_realtime_0_1 = l_v203_0;
            end;
            l_v203_0 = v337.choked_commands;
            return;
        end;
    end;
    v17.visuals.sindicators:set_event("render", v24.indicator);
    v17.visuals.sindicators:set_event("createmove", v338);
end;
v122 = nil;
v165 = 0;
v202 = 0;
do
    local l_v165_2, l_v202_1 = v165, v202;
    v122 = function()
        -- upvalues: v17 (ref), l_v165_2 (ref), l_utils_0 (ref), l_v202_1 (ref), l_vector_0 (ref)
        local v341 = entity.get_local_player();
        if v341 == nil or not v341:is_alive() then
            return;
        else
            local l_m_bIsScoped_1 = v341.m_bIsScoped;
            local v343 = v17.anitaim.manual();
            local v344 = v17.visuals.manual_arrows.manuals_offset();
            local v345 = v17.visuals.manual_arrows.manuals_color();
            local v346 = render.screen_size() / 2;
            local _ = {};
            if not l_m_bIsScoped_1 then
                l_v165_2 = l_utils_0.lerp(l_v165_2, v343 == "manual left" and 255 or 100, 25 * globals.frametime);
                l_v202_1 = l_utils_0.lerp(l_v202_1, v343 == "manual right" and 255 or 100, 25 * globals.frametime);
            else
                l_v165_2 = l_utils_0.lerp(l_v165_2, 0, 25 * globals.frametime);
                l_v202_1 = l_utils_0.lerp(l_v202_1, 0, 25 * globals.frametime);
            end;
            if l_v165_2 < 1 then
                return;
            else
                render.poly(v343 == "manual left" and v345 or color(0, l_v165_2), v346 - l_vector_0(v344, -7) - l_vector_0(0, 5), v346 - l_vector_0(v344, -7) - l_vector_0(9, 0), v346 - l_vector_0(v344, -7) + l_vector_0(0, 5));
                render.poly(v343 == "manual right" and v345 or color(0, l_v202_1), v346 + l_vector_0(v344, 7) - l_vector_0(0, 5), v346 + l_vector_0(v344, 7) + l_vector_0(9, 0), v346 + l_vector_0(v344, 7) + l_vector_0(0, 5));
                return;
            end;
        end;
    end;
    v17.visuals.manual_arrows:set_event("render", v122);
end;
v165 = nil;
v17.misc.fast:set_event("createmove", function(v348)
    local v349 = entity.get_local_player();
    if v349 == nil then
        return;
    else
        if v349.m_MoveType == 9 then
            v348.view_angles.y = math.floor(v348.view_angles.y + 0.5);
            if v348.forwardmove > 0 then
                if v348.view_angles.x < 45 then
                    v348.view_angles.x = 89;
                    v348.in_moveright = 1;
                    v348.in_moveleft = 0;
                    v348.in_forward = 0;
                    v348.in_back = 1;
                    if v348.sidemove == 0 then
                        v348.view_angles.y = v348.view_angles.y + 90;
                    end;
                    if v348.sidemove < 0 then
                        v348.view_angles.y = v348.view_angles.y + 150;
                    end;
                    if v348.sidemove > 0 then
                        v348.view_angles.y = v348.view_angles.y + 30;
                    end;
                end;
            elseif v348.forwardmove < 0 then
                v348.view_angles.x = 89;
                v348.in_moveleft = 1;
                v348.in_moveright = 0;
                v348.in_forward = 1;
                v348.in_back = 0;
                if v348.sidemove == 0 then
                    v348.view_angles.y = v348.view_angles.y + 90;
                end;
                if v348.sidemove > 0 then
                    v348.view_angles.y = v348.view_angles.y + 150;
                end;
                if v348.sidemove < 0 then
                    v348.view_angles.y = v348.view_angles.y + 30;
                end;
            end;
        end;
        return;
    end;
end);
v202 = nil;
v203 = function(v350, v351)
    -- upvalues: l_utils_0 (ref), l_vector_0 (ref)
    local l_x_2 = v350.m_vecOrigin.x;
    local l_y_2 = v350.m_vecOrigin.y;
    local l_z_0 = v350.m_vecOrigin.z;
    local v355 = math.pi * 2;
    for v356 = 0, v355, v355 / 8 do
        local v357 = 10 * math.cos(v356) + l_x_2;
        local v358 = 10 * math.sin(v356) + l_y_2;
        local v359 = l_utils_0.trace_line(l_vector_0(v357, v358, l_z_0), l_vector_0(v357, v358, l_z_0 - v351), v350);
        local l_fraction_1 = v359.fraction;
        local _ = v359.entity;
        if l_fraction_1 ~= 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v203_1 = v203;
    v202 = function(v363)
        -- upvalues: l_v203_1 (ref)
        local v364 = entity.get_local_player();
        if v364 == nil then
            return;
        else
            if v364.m_vecVelocity.z < -500 then
                if l_v203_1(v364, 15) then
                    v363.in_duck = 0;
                elseif l_v203_1(v364, 75) then
                    v363.in_duck = 1;
                end;
            end;
            return;
        end;
    end;
    v17.misc.fall:set_event("createmove", v202);
end;
v203 = nil;
l_realtime_0 = {
    [1] = "ez owned by meteor? lol", 
    [2] = "what u do?? dog", 
    [3] = "1, y u lose? xaxaxaxaxa", 
    [4] = "legends never die -- meteor", 
    [5] = "\229\144\174\229\144\184\231\136\184\231\136\184\231\154\132\233\187\145\232\137\178\229\164\167\229\177\140", 
    [6] = "lol, brainless kid, miss again and dead again", 
    [7] = "\208\155\208\181\208\179\208\181\208\189\208\180\208\176 \208\189\208\184\208\186\208\190\208\179\208\180\208\176 \208\189\208\181 \208\186\208\190\208\189\209\135\208\176\208\181\209\130\209\129\209\143 \226\128\147 \208\188\208\181\209\130\208\181\208\190\209\128", 
    [8] = "Get Meteor - Recode ----> https://en.neverlose.cc/market/item?id=R1lm2A, xaxaxaxaxa", 
    [9] = "\228\189\160\231\154\132aa\230\175\148\232\150\175\231\137\135\232\132\134", 
    [10] = "\229\174\158\229\156\168\228\184\141\232\161\140\228\189\160\229\142\187\228\185\176\228\184\170\230\168\161\229\158\139\229\144\167", 
    [11] = "\228\189\160\231\154\132\232\132\145\229\173\144\229\143\170\233\128\130\229\144\136\231\142\169\229\142\159\231\165\158?", 
    [12] = "\230\187\154\229\142\187\231\142\169\231\142\139\232\128\133\232\141\163\232\128\128\229\144\167\231\170\157\229\155\138\229\186\159", 
    [13] = "\228\189\160\230\152\175\230\178\161\230\156\137\230\137\139\229\144\151?", 
    [14] = "\228\189\160\231\154\132\232\132\145\229\174\185\233\135\143\230\175\148\228\189\160\229\143\130\231\190\164\228\186\186\230\149\176\232\191\152\229\176\145", 
    [15] = "\233\147\182\232\161\140\229\141\161\229\175\134\231\160\129\233\131\189\232\162\171\230\136\145\233\170\151\229\135\186\230\157\165\228\186\134", 
    [16] = "\229\134\156\230\157\145\228\186\186\230\187\154\229\155\158\229\142\187\231\167\141\229\156\176", 
    [17] = "\228\189\160\230\128\142\228\185\136\228\184\128\233\170\151\229\176\177\229\135\186\228\186\134\229\173\169\229\173\144", 
    [18] = "\228\189\160\229\156\168\229\177\143\229\185\149\229\137\141\231\186\162\230\184\169\231\154\132\230\160\183\229\173\144\232\162\171\230\136\145\232\174\176\229\189\149\228\184\139\230\157\165\228\186\134", 
    [19] = "\230\136\145\230\157\128\228\189\160\229\143\170\233\156\128\232\166\129\228\184\128\230\160\185\230\137\139\230\140\135", 
    [20] = "ez", 
    [21] = "\232\191\153\229\176\177\230\173\187\228\186\134\229\144\151...\230\136\145\233\131\189\232\191\152\230\178\161\229\188\128\229\167\139\229\143\145\229\138\155", 
    [22] = "\230\136\145\230\178\161\230\131\179\229\136\176\228\189\160\229\143\130\230\149\176\232\191\153\228\185\136\229\158\131\229\156\190...", 
    [23] = "\230\157\128\228\189\160\229\143\170\233\156\128\232\166\129\228\184\128\230\160\185\230\137\139\230\140\135", 
    [24] = "1", 
    [25] = "1\239\188\140\228\189\160\230\128\142\228\185\136\232\191\153\228\185\136\232\143\156...", 
    [26] = "\228\189\160\229\156\168\231\148\168otc\228\185\136\229\186\159\231\137\169?", 
    [27] = "easy xD", 
    [28] = "1,\229\136\171\230\128\165", 
    [29] = "\229\134\156\230\176\145\228\189\160\232\162\171\228\189\160\231\136\1851\228\186\134\239\188\140\230\187\154\229\142\187\228\185\176\228\184\170\229\165\189\231\130\185\231\154\132\229\143\130\230\149\176\229\144\167", 
    [30] = "\228\189\160\228\185\159\232\162\171\232\132\145\230\142\167\228\186\134\229\144\151"
};
do
    local l_l_realtime_0_2 = l_realtime_0;
    v203 = function(v366)
        -- upvalues: l_utils_0 (ref), l_l_realtime_0_2 (ref)
        local v367 = entity.get_local_player();
        local v368 = entity.get(v366.userid, true);
        local v369 = entity.get(v366.attacker, true);
        if v368 == v369 or v369 ~= v367 then
            return;
        else
            l_utils_0.execute_after(1, function()
                -- upvalues: l_utils_0 (ref), l_l_realtime_0_2 (ref)
                l_utils_0.console_exec("say \"" .. l_l_realtime_0_2[l_utils_0.random_int(1, #l_l_realtime_0_2)]:gsub("\"", "") .. "\"");
            end);
            return;
        end;
    end;
    v17.misc.killsay:set_event("player_death", v203);
end;
l_realtime_0 = nil;
l_realtime_0 = {};
v205 = "\t";
v206 = "\t";
v207 = -1;
v305 = "";
do
    local l_v205_2, l_v206_2, l_v207_2, l_v306_1 = v205, v206, v207, v306;
    l_realtime_0.build = function(v374)
        -- upvalues: l_v205_2 (ref), l_v206_2 (ref)
        local v375 = {};
        local v376 = #v374;
        if v376 < 2 then
            table.insert(v375, v374);
            return v375;
        else
            for _ = 1, 8 do
                table.insert(v375, string.format("%s%s%s", l_v205_2, v374, l_v206_2));
            end;
            for v378 = 1, v376 do
                local v379 = v374:sub(v378, v376);
                table.insert(v375, string.format("%s%s%s", l_v205_2, v379, l_v206_2));
            end;
            table.insert(v375, string.format("%s%s", l_v205_2, l_v206_2));
            for v380 = math.min(2, v376), v376 do
                local v381 = v374:sub(1, v380);
                table.insert(v375, string.format("%s%s%s", l_v205_2, v381, l_v206_2));
            end;
            for _ = 1, 4 do
                table.insert(v375, string.format("%s%s%s", l_v205_2, v374, l_v206_2));
            end;
            return v375;
        end;
    end;
    l_v306_1 = l_realtime_0.build("meteor-recode");
    l_realtime_0.handle = function()
        -- upvalues: l_v306_1 (ref), l_v207_2 (ref)
        local v383 = math.floor(globals.tickcount * 0.0625) % #l_v306_1 + 1;
        if v383 == l_v207_2 then
            return;
        else
            l_v207_2 = v383;
            common.set_clan_tag(l_v306_1[v383] or "");
            return;
        end;
    end;
    v17.misc.clantag:set_event("render", l_realtime_0.handle);
end;
v205 = nil;
v17.visuals.keepscope:set_event("localplayer_transparency", function()
    local v384 = entity.get_local_player();
    if v384.m_bResumeZoom or v384.m_bIsScoped then
        return 59;
    else
        return;
    end;
end);
v206 = nil;
v206 = function(v385)
    -- upvalues: v17 (ref), l_utils_0 (ref)
    if entity.get_local_player() == nil then
        return;
    elseif entity.get_local_player():get_player_weapon() == nil then
        return;
    else
        local v386 = entity.get_local_player():get_player_weapon():get_weapon_index();
        if not v386 == 44 or not v386 == 46 then
            return;
        else
            if v385.damage >= v17.misc.grenade_release.damage() then
                l_utils_0.console_exec("+attack");
                l_utils_0.execute_after(0.1, function()
                    -- upvalues: l_utils_0 (ref)
                    l_utils_0.console_exec("-attack");
                end);
            end;
            return;
        end;
    end;
end;
v17.misc.grenade_release:set_event("grenade_prediction", v206);
v207 = function()
    -- upvalues: l_utils_0 (ref)
    local v387 = entity.get_local_player();
    if v387 == nil then
        return;
    else
        l_utils_0.execute_after(0.5, function()
            -- upvalues: v387 (ref)
            v387:set_icon("https://raw.githubusercontent.com/tickcount/.p2c-icons/main/spirthack.png");
        end);
        events.voice_message(function(v388)
            local l_buffer_0 = v388.buffer;
            local v390 = entity.get_local_player();
            if v390 == nil then
                return;
            elseif v388.entity == v390 then
                return;
            else
                local v391 = l_buffer_0:read_bits(32);
                if v388.entity == nil then
                    return;
                elseif v388.entity:is_bot() then
                    return;
                else
                    if v391 == 20739 then
                        v388.entity:set_icon("https://raw.githubusercontent.com/tickcount/.p2c-icons/main/spirthack.png");
                    end;
                    return;
                end;
            end;
        end);
        events.voice_message:call(function(v392)
            v392:write_bits(20739, 16);
            v392:write_bits(globals.tickcount, 32);
        end);
        return;
    end;
end;
v305 = function()
    local v393 = entity.get_local_player();
    if v393 == nil then
        return;
    else
        v393:set_icon();
        events.voice_message:call(function(v394)
            v394:write_bits(20739, 16);
            v394:write_bits(globals.tickcount, 32);
        end);
        entity.get_players(true, true, function(v395)
            v395:set_icon();
        end);
        return;
    end;
end;
do
    local l_v207_3, l_v305_1 = v207, v305;
    v17.misc.icon_shared:set_callback(function(v398)
        -- upvalues: l_v207_3 (ref), l_v305_1 (ref)
        if v398:get() then
            l_v207_3();
        end;
        if not v398:get() then
            l_v305_1();
        end;
    end, true);
    events.shutdown:set(l_v305_1);
end;
v207 = nil;
v305 = {
    shotgun = "Shotgun", 
    machinegun = "Machinegun", 
    smg = "SMG", 
    rifle = "Rifle", 
    pistol = "Pistol"
};
v306 = {
    ["SSG 08"] = "Scout", 
    G3SG1 = "Scar", 
    ["SCAR-20"] = "Scar"
};
local v399 = {
    [64] = true
};
do
    local l_v305_2, l_v306_2, l_v399_0 = v305, v306, v399;
    v207 = function(v403)
        -- upvalues: v17 (ref), v14 (ref), l_utils_0 (ref), l_v305_2 (ref), l_v306_2 (ref), l_v399_0 (ref)
        if not v17.misc.auto_hideshots.value or #v17.misc.auto_hideshots.auto_hideshots_wpns.value <= 0 then
            return;
        elseif v17.anitaim.air_lag() then
            v14.rage.hideshots:override();
            return;
        else
            local v404 = entity.get_local_player();
            local v405 = l_utils_0.get_weapon_struct(v404);
            if v405 == nil then
                return;
            else
                local v406 = l_v305_2[v405.type] ~= nil and v17.misc.auto_hideshots.auto_hideshots_wpns:get(l_v305_2[v405.type]);
                local v407 = l_v306_2[v405.name] ~= nil and v17.misc.auto_hideshots.auto_hideshots_wpns:get(l_v306_2[v405.name]);
                if v403.in_duck and not l_utils_0.air(v404) and v14.rage.doubletap:get() and (v406 or v407) and not l_v399_0[l_utils_0.get_weapon_index(v404)] then
                    v14.rage.hideshots:override(true);
                    v14.rage.doubletap:override(false);
                else
                    v14.rage.hideshots:override(nil);
                    v14.rage.doubletap:override(nil);
                end;
                return;
            end;
        end;
    end;
    v17.misc.auto_hideshots:set_event("createmove", v207);
end;
v305 = nil;
v306 = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
v399 = color(255);
do
    local l_v306_3, l_v399_1 = v306, v399;
    local function v413(v410)
        -- upvalues: l_v399_1 (ref), l_v306_3 (ref)
        if l_v399_1 ~= v410 then
            for _, v412 in pairs(l_v306_3) do
                materials.get_materials(v412)[1]:alpha_modulate(v410.a / 255);
                materials.get_materials(v412)[1]:color_modulate(color(v410.r, v410.g, v410.b));
            end;
            l_v399_1 = v410;
        end;
    end;
    v305 = function()
        -- upvalues: v34 (ref), v17 (ref), v413 (ref)
        local v414 = v34.console_is_visible() and v17.visuals.console_color.accent_color() or color(255);
        v413(v414);
    end;
    v17.visuals.console_color:set_event("render", v305);
end;
v306 = nil;
v399 = function()
    -- upvalues: l_vector_0 (ref)
    local v415 = entity.get_local_player();
    if v415 == nil then
        return;
    else
        local v416 = v415:get_origin();
        local v417 = entity.get_entities("CSmokeGrenadeProjectile");
        local v418 = entity.get_entities("CInferno");
        local v419 = {
            [1] = {
                percentage = 0, 
                alpha = 0, 
                draw = false, 
                position = l_vector_0(0, 0, 0)
            }
        };
        local v420 = {
            [1] = {
                alpha = 0, 
                teammate = false, 
                radius = 0, 
                draw = false, 
                percentage = 0, 
                position = l_vector_0(0, 0, 0)
            }
        };
        local l_tickcount_0 = globals.tickcount;
        local l_tickinterval_0 = globals.tickinterval;
        local v423 = 600;
        if v417 ~= nil then
            for v424, v425 in pairs(v417) do
                if v419[v424] == nil then
                    v419[v424] = {};
                end;
                v419[v424].percentage = (17.55 - l_tickinterval_0 * (l_tickcount_0 - v425.m_nSmokeEffectTickBegin)) / 17.55;
                v419[v424].position = v425:get_origin();
                v419[v424].alpha = v425:get_bbox().alpha * 255;
                if v425.m_bDidSmokeEffect and v416:dist(v419[v424].position) < v423 then
                    v419[v424].draw = true;
                end;
            end;
        end;
        if v418 ~= nil then
            local v426 = cvar.mp_friendlyfire:int() == 0;
            for v427, v428 in pairs(v418) do
                if v420[v427] == nil then
                    v420[v427] = {};
                end;
                v420[v427].percentage = (7 - l_tickinterval_0 * (l_tickcount_0 - v428.m_nFireEffectTickBegin)) / 7;
                v420[v427].position = v428:get_origin();
                v420[v427].alpha = v428:get_bbox().alpha * 255;
                local l_m_hOwnerEntity_0 = v428.m_hOwnerEntity;
                if v426 and l_m_hOwnerEntity_0 ~= v415 and not l_m_hOwnerEntity_0:is_enemy() then
                    v420[v427].teammate = true;
                end;
                local v430 = 40;
                local _ = 0;
                local v432 = {};
                local v433 = 0;
                local v434 = nil;
                local v435 = nil;
                for v436 = 1, 64 do
                    if v428.m_bFireIsBurning[v436] == true then
                        table.insert(v432, l_vector_0(v428.m_fireXDelta[v436], v428.m_fireYDelta[v436], v428.m_fireZDelta[v436]));
                    end;
                end;
                local v437 = #v432;
                for v438 = 1, v437 do
                    for v439 = 1, v437 do
                        local v440 = v432[v438]:dist(v432[v439]);
                        if v433 < v440 then
                            v433 = v440;
                            v434 = v432[v438];
                            v435 = v432[v439];
                        end;
                    end;
                end;
                if v434 ~= nil and v435 ~= nil and v416:dist(v420[v427].position) < v423 then
                    v420[v427].draw = true;
                    v420[v427].radius = v433 / 2 + v430;
                end;
            end;
        end;
        return {
            smoke = v419, 
            molotov = v420
        };
    end;
end;
do
    local l_v399_2 = v399;
    v306 = function()
        -- upvalues: v17 (ref), l_v399_2 (ref), v13 (ref)
        local v442 = v17.visuals.nade_radius.grenade_select.ref:get(2);
        local v443 = v17.visuals.nade_radius.grenade_select.ref:get(1);
        if not v442 and not v443 then
            return;
        else
            local v444 = l_v399_2();
            if v444 == nil then
                return;
            else
                local v445 = v17.visuals.nade_radius.enemy_molotov_color();
                local v446 = v17.visuals.nade_radius.molotov_color();
                local v447 = v17.visuals.nade_radius.smoke_color();
                local v448 = {
                    team = {
                        [1] = v446.a / 255, 
                        [2] = v446:override("a", 0), 
                        [3] = v446
                    }, 
                    enemy = {
                        [1] = v445.a / 255, 
                        [2] = v445:override("a", 0), 
                        [3] = v445
                    }
                };
                local v449 = {
                    molotov_radius = {}
                };
                for v450 = 1, #v444.molotov do
                    local v451 = v444.molotov[v450];
                    v449.molotov_radius[v450] = v13.new("molotov_radius_" .. v450, v451.draw and v451.radius or 0, 0.095);
                    if v451.draw and v442 then
                        local v452 = v448[v451.teammate and "team" or "enemy"];
                        render.circle_3d(v451.position, v452[3]:override("a", v452[1] * v451.alpha), v449.molotov_radius[v450], 0, 1);
                        render.circle_3d_outline(v451.position, v452[3]:override("a", v452[1] * v451.alpha), v449.molotov_radius[v450], 0, v451.percentage, 1.5);
                    end;
                end;
                local v453 = v447.a / 255;
                local _ = v447:override("a", 0);
                v449.smoke_radius = {};
                for v455 = 1, #v444.smoke do
                    local v456 = v444.smoke[v455];
                    v449.smoke_radius[v455] = v13.new("smoke_radius_" .. v455, v456.draw and 125 or 0, 0.095);
                    if v456.draw and v443 then
                        local l_v447_0 = v447;
                        render.circle_3d(v456.position, l_v447_0:override("a", v453 * v456.alpha), v449.smoke_radius[v455], 0, 1);
                        render.circle_3d_outline(v456.position, l_v447_0:override("a", v453 * v456.alpha), v449.smoke_radius[v455], 0, v456.percentage, 1.5);
                    end;
                end;
                return;
            end;
        end;
    end;
    v17.visuals.nade_radius:set_event("render", v306);
end;
v399 = nil;
local v458 = l_pui_0.create("\v\f<house> \rmain", "\v\f<bolt> \rInformations"):slider("pos_x", 0, render.screen_size().x, 900):visibility(false);
local v459 = l_pui_0.create("\v\f<house> \rmain", "\v\f<bolt> \rInformations"):slider("pos_y", 0, render.screen_size().y, 300):visibility(false);
v399 = l_system_0.register({
    [1] = v458, 
    [2] = v459
}, l_vector_0(190, 50), "Velocity", function(v460)
    -- upvalues: v17 (ref), l_vector_0 (ref), v13 (ref), v14 (ref), l_utils_0 (ref)
    local v461 = entity.get_local_player();
    if v461 == nil or v461:is_alive() == false then
        return;
    else
        local v462 = v17.visuals.velocity_indication.velocity_indication();
        local v463 = v17.visuals.velocity_indication.velocity_accent_color();
        local _ = v17.visuals.velocity_indication.defensive_indication();
        local v465 = v17.visuals.velocity_indication.defensive_accent_color();
        local v466 = v17.visuals.velocity_indication.defensive_indication();
        local v467 = v17.visuals.velocity_indication.airlag_accent_color();
        local v468 = v17.visuals.velocity_indication.airlag_indication();
        local v469 = l_vector_0(v460.position.x, v460.position.y);
        local v470 = v13.new("m_flVelocityModifier", ui.get_alpha() > 0 and v461.m_flVelocityModifier == 1 and 0.5 or v461:is_alive() and v461.m_flVelocityModifier or 1);
        local l_new_0 = v13.new;
        local v472 = "m_flDefensiveModifier";
        local v473;
        if ui.get_alpha() > 0 and not v14.rage.doubletap:get() then
            v473 = 1;
        else
            v473 = l_utils_0.defensive() > 0 and 0 or 1;
        end;
        l_new_0 = l_new_0(v472, v473);
        v472 = {};
        v473 = 0;
        local v474 = l_vector_0(120, 0);
        v472.drag = v13.new("anim_drag", (not not v462 or v466) and ui.get_alpha() > 0.5 and 255 or 0);
        v472.defensive = v13.new("defensive_indication", v466 and (v14.rage.doubletap:get() or ui.get_alpha() > 0.5) and 255 or 0);
        v474.y = v474.y + v472.defensive / 255 * 29;
        if v472.defensive > 1 then
            local v475 = l_utils_0.color_text({
                [1] = "defensive: "
            }, {
                [1] = l_utils_0.defensive() > 1 and "active" or "ready", 
                [2] = v465
            });
            render.text(1, l_vector_0(v469.x + 20, v469.y + 5), color(255):override("a", v472.defensive), nil, v475);
            render.shadow(l_vector_0(v469.x + 4, v469.y + 19), l_vector_0(v469.x + 126, v469.y + 25), v465:override("a", v472.defensive), 20, 0);
            render.rect(l_vector_0(v469.x + 4, v469.y + 19), l_vector_0(v469.x + 126, v469.y + 25), color(0, 255):override("a", v472.defensive / 2), 2);
            render.rect(l_vector_0(v469.x + 5, v469.y + 20), l_vector_0(v469.x + l_new_0 * 120 + 5, v469.y + 24), v465:override("a", v472.defensive), 2);
        end;
        v473 = v473 + v472.defensive / 255 * 29;
        local l_new_1 = v13.new;
        local v477 = "velocity_indication";
        local v478;
        if v462 then
            v478 = ui.get_alpha() > 0.5 and 255 or v470 < 0.9 and 255 or 0;
        else
            v478 = 0;
        end;
        v472.velocity = l_new_1(v477, v478);
        v474.y = v474.y + v472.velocity / 255 * 29;
        if v472.velocity > 1 then
            l_new_1 = l_utils_0.color_text({
                [1] = "Slowed down "
            }, {
                [1] = tostring(math.floor(v470 * 100)), 
                [2] = v463
            }, {
                [1] = "%"
            });
            render.text(1, l_vector_0(v469.x + 20, v469.y + v473 + 5), color(255):override("a", v472.velocity), nil, l_new_1);
            render.shadow(l_vector_0(v469.x + 4, v469.y + v473 + 19), l_vector_0(v469.x + 126, v469.y + v473 + 25), v463:override("a", v472.velocity), 20, 0);
            render.rect(l_vector_0(v469.x + 4, v469.y + v473 + 19), l_vector_0(v469.x + 126, v469.y + v473 + 25), color(0, 255):override("a", v472.velocity / 2), 2);
            render.rect(l_vector_0(v469.x + 5, v469.y + v473 + 20), l_vector_0(v469.x + v470 * 120 + 5, v469.y + v473 + 24), v463:override("a", v472.velocity), 2);
        end;
        v473 = v473 + v472.velocity / 255 * 29;
        l_new_1 = v13.new;
        v477 = "airlag_indication";
        if v468 then
            v478 = ui.get_alpha() > 0.5 and 255 or v17.anitaim.air_lag() and rage.exploit:get() and 255 or 0;
        else
            v478 = 0;
        end;
        v472.airlag = l_new_1(v477, v478);
        v474.y = v474.y + v472.airlag / 255 * 29;
        if v472.airlag > 1 then
            l_new_1 = l_utils_0.color_text({
                [1] = "air lag exploit "
            }, {
                [1] = tostring(math.floor(rage.exploit:get() * 100)), 
                [2] = v467
            }, {
                [1] = "%"
            });
            render.text(1, l_vector_0(v469.x + 20, v469.y + v473 + 5), color(255):override("a", v472.airlag), nil, l_new_1);
            render.shadow(l_vector_0(v469.x + 4, v469.y + v473 + 19), l_vector_0(v469.x + 126, v469.y + v473 + 25), v467:override("a", v472.airlag), 20, 0);
            render.rect(l_vector_0(v469.x + 4, v469.y + v473 + 19), l_vector_0(v469.x + 126, v469.y + v473 + 25), color(0, 255):override("a", v472.airlag / 2), 2);
            render.rect(l_vector_0(v469.x + 5, v469.y + v473 + 20), l_vector_0(v469.x + rage.exploit:get() * 120 + 5, v469.y + v473 + 24), v467:override("a", v472.airlag), 2);
        end;
        return;
    end;
end);
local function v479()
    -- upvalues: v399 (ref)
    v399:update();
end;
v17.visuals.velocity_indication:set_event("render", v479);
v458 = nil;
v17.misc.nade_fixer:set_event("createmove", function(v480)
    local v481 = entity.get_local_player();
    rage.exploit:allow_defensive(true);
    local v482 = v481:get_player_weapon();
    if v482 == nil then
        return;
    else
        local v483 = v482:get_classname();
        local l_m_fThrowTime_0 = v482.m_fThrowTime;
        if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 and string.match(v483, "Grenade") then
            rage.exploit:allow_defensive(false);
            v480.no_choke = true;
        end;
        return;
    end;
end);
v459 = nil;
v479 = entity.get_local_player();
local v485 = l_vector_0();
local v486 = l_vector_0();
local v487 = l_vector_0();
local v488 = 64;
local l_tickinterval_1 = globals.tickinterval;
local v490 = globals.frametime * 2;
local v491 = true;
local v492 = false;
local v493 = false;
local v494 = {};
local v495 = false;
local v496 = nil;
local v497 = nil;
local v498 = 0;
do
    local l_v485_0, l_v486_0, l_v487_0, l_v488_0, l_l_tickinterval_1_0, l_v490_0, l_v491_0, l_v492_0, l_v493_0, l_v494_0, l_v495_0, l_v496_0, l_v497_0, l_v498_0 = v485, v486, v487, v488, l_tickinterval_1, v490, v491, v492, v493, v494, v495, v496, v497, v498;
    v17.misc.aipeek.ai_key:set_callback(function(v513)
        -- upvalues: v17 (ref), v14 (ref), l_v486_0 (ref), l_v485_0 (ref)
        if v513:get() and v17.misc.aipeek() then
            v14.rage.quick_peek:override(true);
            l_v486_0 = l_v485_0;
        end;
        if not v513:get() then
            v14.rage.quick_peek:override(nil);
        end;
    end);
    local function v514()
        if entity.get_threat(true) or not entity.get_threat() then
            return nil;
        else
            return entity.get_threat();
        end;
    end;
    local function v522()
        -- upvalues: l_vector_0 (ref), l_utils_0 (ref), v17 (ref), l_v494_0 (ref)
        local v515 = rage.antiaim:get_target(true);
        local v516 = rage.antiaim:get_target();
        if v515 and v516 then
            if v515 - v516 ~= 0 then
                v516 = v515 - v516;
                local v517 = l_vector_0():angles(0, v515 + 180);
                local v518 = entity.get_local_player():get_eye_position();
                local l_end_pos_0 = l_utils_0.trace_line(v518, v518 + v517 * v17.misc.aipeek.gap()).end_pos;
                for v520 = 1, v17.misc.aipeek.department() do
                    local v521 = (l_end_pos_0 - v518) * v520;
                    if v521 ~= l_vector_0() then
                        l_v494_0[v520] = v518 + v521 + l_end_pos_0 - v518;
                    end;
                end;
                return;
            else
                return;
            end;
        else
            return;
        end;
    end;
    local function v529(v523, v524, v525)
        -- upvalues: l_vector_0 (ref)
        local l_m_vecVelocity_0 = v524.m_vecVelocity;
        if not l_m_vecVelocity_0 then
            return l_vector_0();
        else
            local l_tickinterval_2 = globals.tickinterval;
            for _ = 0, v523 do
                v525.x = v525.x + l_m_vecVelocity_0.x * l_tickinterval_2;
                v525.y = v525.y + l_m_vecVelocity_0.y * l_tickinterval_2;
                v525.z = v525.z + (l_m_vecVelocity_0.z * l_tickinterval_2 + 9.81 * l_tickinterval_2 * l_tickinterval_2 / 2);
            end;
            return v525;
        end;
    end;
    local function v534(v530, v531)
        -- upvalues: v17 (ref), v529 (ref)
        local v532 = v17.misc.aipeek.ticks();
        local v533 = v530:get_hitbox_position(v531);
        if not v17.misc.aipeek.tp_peek() then
            v532 = v532 * 2;
        end;
        if not (v530:is_dormant() and v17.misc.aipeek.disable_d_prediction()) then
            return v529(v532, v530, v533);
        else
            return v533;
        end;
    end;
    local function v537(v535)
        -- upvalues: l_utils_0 (ref), l_vector_0 (ref), l_v488_0 (ref)
        local v536 = l_utils_0.trace_line(v535, v535 - l_vector_0(0, 0, 2048));
        return v535.z - v536.end_pos.z < l_v488_0 + 20;
    end;
    local function v539(v538)
        return v538:is_enemy();
    end;
    local function v547()
        -- upvalues: v17 (ref), l_v494_0 (ref), v537 (ref), l_utils_0 (ref), v534 (ref), v539 (ref), l_v495_0 (ref), l_v487_0 (ref)
        local v540 = entity.get_threat();
        if not v540 then
            return;
        elseif v17.misc.aipeek.disable_dormant() and v540:is_dormant() then
            return;
        else
            for _, v542 in pairs(l_v494_0) do
                if v537(v542) then
                    local v543 = l_utils_0.trace_bullet(entity.get_local_player(), v542, v534(v540, 2), v539);
                    local v544 = l_utils_0.trace_bullet(entity.get_local_player(), v542, v534(v540, 5), v539);
                    local v545 = l_utils_0.trace_bullet(entity.get_local_player(), v542, v540:get_hitbox_position(2), v539);
                    local v546 = l_utils_0.trace_bullet(entity.get_local_player(), v542, v540:get_hitbox_position(5), v539);
                    if v543 > 0 or v544 > 0 or v545 > 0 or v546 > 0 then
                        l_v495_0 = globals.tickcount;
                        l_v487_0 = v542;
                        return;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v553(v548, v549, v550, v551)
        -- upvalues: l_v485_0 (ref)
        if not v551 and (v548.in_forawrd or v548.in_back or v548.in_moveleft or v548.in_moveright) then
            return;
        else
            v548.move_yaw = (v549 - l_v485_0):angles().y;
            local v552 = v549:dist2d(l_v485_0);
            if (v550 or 5) < v552 then
                v548.forwardmove = math.min(450, v552 * 15);
                v548.sidemove = 0;
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v560(v554)
        -- upvalues: l_v495_0 (ref), l_v491_0 (ref), l_v498_0 (ref), v553 (ref), l_v487_0 (ref), v17 (ref), l_v492_0 (ref), l_utils_0 (ref), v534 (ref), v539 (ref)
        if not l_v495_0 then
            return;
        else
            l_v491_0 = false;
            local l_m_flNextPrimaryAttack_0 = entity.get_local_player():get_player_weapon().m_flNextPrimaryAttack;
            local l_m_flNextAttack_0 = entity.get_local_player().m_flNextAttack;
            if l_m_flNextPrimaryAttack_0 < globals.curtime and l_m_flNextAttack_0 < globals.curtime then
                l_v498_0 = v553(v554, l_v487_0, 2) and l_v498_0 + 1 or 0;
                if v17.misc.aipeek.tp_peek() and not l_v492_0 then
                    l_utils_0.execute_after(v17.misc.aipeek.tp_delay() / 100, function()
                        -- upvalues: v17 (ref), l_v495_0 (ref), l_utils_0 (ref), l_v487_0 (ref), v534 (ref), v539 (ref)
                        local v557 = entity.get_threat();
                        if not v557 then
                            return;
                        elseif v17.misc.aipeek.disable_dormant() and v557:is_dormant() then
                            return;
                        else
                            if l_v495_0 then
                                local v558 = l_utils_0.trace_bullet(entity.get_local_player(), l_v487_0, v534(v557, 2), v539);
                                local v559 = l_utils_0.trace_bullet(entity.get_local_player(), l_v487_0, v534(v557, 5), v539);
                                if v558 > 0 or v559 > 0 then
                                    rage.exploit:force_teleport();
                                    rage.exploit:allow_charge(false);
                                end;
                            end;
                            return;
                        end;
                    end);
                    l_v492_0 = true;
                end;
            end;
            return;
        end;
    end;
    local function v563()
        -- upvalues: l_v485_0 (ref), l_v488_0 (ref), l_l_tickinterval_1_0 (ref), v14 (ref), l_v490_0 (ref), l_v491_0 (ref)
        local v561 = entity.get_local_player();
        local v562 = entity.get_threat();
        if not v561 then
            return;
        else
            l_v485_0 = v561.m_vecOrigin;
            l_v488_0 = v561:get_eye_position().z - l_v485_0.z;
            l_l_tickinterval_1_0 = v14.rage.doubletap:get() and globals.tickinterval * cvar.sv_maxusrcmdprocessticks:int() or globals.tickinterval * 2;
            l_v490_0 = globals.frametime * 2;
            if v562 and not v562:is_alive() then
                l_v491_0 = true;
            end;
            return;
        end;
    end;
    v459 = function(v564)
        -- upvalues: v563 (ref), v17 (ref), l_v492_0 (ref), l_v493_0 (ref), l_v494_0 (ref), l_v495_0 (ref), l_v496_0 (ref), v514 (ref), l_v491_0 (ref), v522 (ref), v547 (ref), l_v497_0 (ref), v553 (ref), l_v486_0 (ref), v560 (ref)
        v563();
        local v565 = v17.misc.aipeek.ai_key();
        if not v565 then
            l_v492_0 = false;
            l_v493_0 = false;
            rage.exploit:allow_charge(true);
            l_v494_0 = {};
        end;
        if l_v495_0 and globals.tickcount - l_v495_0 > 1 then
            l_v495_0 = false;
        end;
        l_v496_0 = l_v495_0 and l_v496_0 or v514();
        if l_v496_0 and l_v491_0 then
            v522();
        end;
        v547();
        if not v565 or l_v497_0 ~= l_v496_0 then
            l_v491_0 = true;
            l_v497_0 = l_v496_0;
            return;
        else
            if not l_v495_0 then
                v553(v564, l_v486_0, 2);
            end;
            v560(v564);
            return;
        end;
    end;
    v17.misc.aipeek:set_event("createmove", v459);
end;
v479 = function()
    -- upvalues: v27 (ref), l_utils_0 (ref)
    local v566 = v27:alpha_modulate(0);
    local v567 = l_utils_0.CreateAnimationText("m e t e o r", v27, v566, 85, true);
    if ui.get_alpha() > 0.5 then
        ui.sidebar(v567 .. " \226\152\129 ", "ME");
    end;
end;
events.render:set(v479);
v479 = {
    [1] = "generic", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "neck", 
    [10] = "?", 
    [11] = "gear"
};
v485 = {
    [1] = "", 
    [2] = "Head", 
    [3] = "Chest", 
    [4] = "Stomach", 
    [5] = "Chest", 
    [6] = "Chest", 
    [7] = "Legs", 
    [8] = "Legs", 
    [9] = "Head", 
    [10] = "", 
    [11] = ""
};
v486 = function(v568, v569, v570)
    -- upvalues: l_vector_0 (ref)
    local _, v572 = v568:to(v569):angles():unpack();
    local v573 = math.rad(v572 + 90);
    local v574 = l_vector_0(math.cos(v573), math.sin(v573), 0) * v570;
    return {
        [1] = {
            text = "Middle", 
            vec = v569
        }, 
        [2] = {
            text = "Left", 
            vec = v569 + v574
        }, 
        [3] = {
            text = "Right", 
            vec = v569 - v574
        }
    };
end;
v487 = function(v575, v576)
    for v577 = 1, #v575 do
        if v575[v577] == v576 then
            return true;
        end;
    end;
    return false;
end;
v488 = function(v578, v579)
    local v580 = math.sqrt(v578.forwardmove * v578.forwardmove + v578.sidemove * v578.sidemove);
    if v579 <= 0 or v580 <= 0 then
        return;
    else
        if v578.in_duck == 1 then
            v579 = v579 * 2.94117647;
        end;
        if v580 <= v579 then
            return;
        else
            local v581 = v579 / v580;
            v578.forwardmove = v578.forwardmove * v581;
            v578.sidemove = v578.sidemove * v581;
            return;
        end;
    end;
end;
l_tickinterval_1 = function()
    local v582 = {};
    local v583 = entity.get_player_resource();
    for v584 = 1, globals.max_players do
        local v585 = entity.get(v584);
        if v585 ~= nil and v583.m_bConnected[v584] and v585 ~= entity.get_local_player() and v585:is_enemy() then
            v582[#v582 + 1] = v585;
        end;
    end;
    return v582;
end;
v490 = function()
    local v586 = {};
    local v587 = entity.get_player_resource();
    for v588 = 1, globals.max_players do
        local v589 = entity.get(v588);
        if v587.m_bConnected[v588] == true and v589 ~= nil and v589:is_dormant() and v589:is_enemy() then
            v586[#v586 + 1] = v588;
        end;
    end;
    return v586;
end;
v491 = function(v590, v591)
    for _, v593 in ipairs(v590) do
        if v593[1] == v591 then
            return true;
        end;
    end;
    return false;
end;
v492 = 0;
v493 = {};
v494 = {};
v495 = {
    [1] = {
        scale = 5, 
        hitbox = "Stomach", 
        vec = l_vector_0(0, 0, 40)
    }, 
    [2] = {
        scale = 6, 
        hitbox = "Chest", 
        vec = l_vector_0(0, 0, 50)
    }, 
    [3] = {
        scale = 3, 
        hitbox = "Head", 
        vec = l_vector_0(0, 0, 58)
    }, 
    [4] = {
        scale = 4, 
        hitbox = "Legs", 
        vec = l_vector_0(0, 0, 20)
    }
};
v496 = {
    [0] = "Head", 
    [1] = nil, 
    [2] = "Stomach", 
    [3] = nil, 
    [4] = "Stomach", 
    [5] = "Chest", 
    [6] = "Chest", 
    [7] = "Legs", 
    [8] = "Legs"
};
v497 = 1;
v498 = nil;
local v594 = nil;
local v595 = nil;
local v596 = nil;
local v597 = nil;
local v598 = false;
local function v604(v599)
    local v600 = false;
    local v601 = 0;
    for v602 = 1, #ui.get_binds() do
        local v603 = ui.get_binds()[v602];
        if v603.name == v599 then
            v600 = true;
            v601 = v603.value;
        end;
    end;
    return v600, v601;
end;
do
    local l_v479_0, l_v485_1, l_v486_1, l_v487_1, l_v488_1, l_l_tickinterval_1_1, l_v490_1, l_v491_1, l_v492_1, l_v493_1, l_v494_1, l_v495_1, l_v496_1, l_v497_1, l_v498_1, l_v594_0, l_v595_0, l_v596_0, l_v597_0, l_v598_0, l_v604_0 = v479, v485, v486, v487, v488, l_tickinterval_1, v490, v491, v492, v493, v494, v495, v496, v497, v498, v594, v595, v596, v597, v598, v604;
    local function v682(v626)
        -- upvalues: v17 (ref), l_l_tickinterval_1_1 (ref), l_v491_1 (ref), l_v494_1 (ref), l_weapons_0 (ref), l_v490_1 (ref), l_v497_1 (ref), l_v493_1 (ref), l_v492_1 (ref), l_v604_0 (ref), l_v495_1 (ref), l_v487_1 (ref), l_vector_0 (ref), l_v496_1 (ref), l_v486_1 (ref), l_utils_0 (ref), l_v594_0 (ref), l_v595_0 (ref), l_v596_0 (ref), l_v597_0 (ref), l_v488_1 (ref), l_v498_1 (ref)
        local v627 = v17.misc.dormant.dormantHitboxes:get();
        local v628 = {};
        for _, v630 in ipairs(l_l_tickinterval_1_1()) do
            if v630:get_bbox().alpha < 1 then
                if not l_v491_1(l_v494_1, v630) then
                    table.insert(l_v494_1, {
                        [1] = v630, 
                        [2] = globals.tickcount
                    });
                end;
            elseif l_v491_1(l_v494_1, v630) then
                for v631, v632 in ipairs(l_v494_1) do
                    if v632[1] == v630 then
                        table.remove(l_v494_1, v631);
                    end;
                end;
            end;
        end;
        if not v17.misc.dormant:get() then
            return;
        else
            local v633 = entity.get_local_player();
            local v634 = v633:get_player_weapon();
            if not v634 then
                return;
            else
                local v635 = v634:get_inaccuracy();
                if not v635 then
                    return;
                else
                    local v636 = v633:get_eye_position();
                    local l_m_flSimulationTime_0 = v633.m_flSimulationTime;
                    local v638 = l_weapons_0(v634);
                    local l_m_bIsScoped_2 = v633.m_bIsScoped;
                    local v640 = bit.band(v633.m_fFlags, bit.lshift(1, 0));
                    local v641 = l_v490_1();
                    if globals.tickcount % #v641 ~= 0 then
                        l_v497_1 = l_v497_1 + 1;
                    else
                        l_v497_1 = 1;
                    end;
                    local v642 = entity.get(v641[l_v497_1]);
                    if not v642 or v642 == nil then
                        l_v493_1 = {};
                        return;
                    else
                        local v643 = v642:get_bbox();
                        if globals.tickcount < l_v492_1 then
                            l_v493_1 = {};
                            return;
                        elseif v638.type == "grenade" or v638.type == "knife" then
                            l_v493_1 = {};
                            return;
                        elseif v626.in_jump == 1 and v640 == 0 then
                            l_v493_1 = {};
                            return;
                        else
                            local v644 = {};
                            local v645 = v17.misc.dormant.dormantAccuracy:get();
                            local l_m_iHealth_1 = v642.m_iHealth;
                            local v647, v648 = l_v604_0("Min. Damage");
                            local l_v647_0 = v647;
                            local v650 = not (not (v17.misc.dormant.dormantMindmg:get() == 0) or l_v647_0) and ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get() or v17.misc.dormant.dormantMindmg:get() == 0 and l_v647_0 and v648 or v17.misc.dormant.dormantMindmg:get();
                            if v650 > 100 then
                                v650 = v650 - 100 + l_m_iHealth_1;
                            end;
                            local l_m_flDuckAmount_0 = v642.m_flDuckAmount;
                            for _, v653 in ipairs(l_v495_1) do
                                if #v627 ~= 0 then
                                    if l_v487_1(v627, v653.hitbox) then
                                        if v653.hitbox == "Head" then
                                            table.insert(v644, {
                                                vec = v653.vec - l_vector_0(0, 0, l_m_flDuckAmount_0 * 10), 
                                                scale = v653.scale, 
                                                hitbox = v653.hitbox
                                            });
                                        elseif v653.hitbox == "Chest" then
                                            table.insert(v644, {
                                                vec = v653.vec - l_vector_0(0, 0, l_m_flDuckAmount_0 * 4), 
                                                scale = v653.scale, 
                                                hitbox = v653.hitbox
                                            });
                                        else
                                            table.insert(v644, {
                                                vec = v653.vec, 
                                                scale = v653.scale, 
                                                hitbox = v653.hitbox
                                            });
                                        end;
                                    end;
                                else
                                    table.insert(v644, 1, {
                                        vec = v653.vec, 
                                        scale = v653.scale, 
                                        hitbox = v653.hitbox
                                    });
                                end;
                            end;
                            local v654 = nil;
                            if v638.is_revolver then
                                v654 = v634.m_flNextPrimaryAttack < l_m_flSimulationTime_0;
                            else
                                v654 = math.max(v633.m_flNextAttack, v634.m_flNextPrimaryAttack, v634.m_flNextSecondaryAttack) < l_m_flSimulationTime_0;
                            end;
                            if not v654 then
                                return;
                            else
                                local v655 = v642:get_origin();
                                local v656 = v642:get_hitbox_position(4);
                                l_v493_1[v642] = nil;
                                for v657 = 1, 7 do
                                    if #v627 ~= 0 and l_v487_1(v627, l_v496_1[v657 - 1]) and v642:is_alive() and v643.alpha > 0 and math.abs(v655.x - v656.x) < 7 then
                                        table.insert(v628, {
                                            scale = 3, 
                                            hitbox = l_v496_1[v657 - 1], 
                                            vec = v642:get_hitbox_position(v657 - 1)
                                        });
                                    end;
                                end;
                                local v658 = nil;
                                local v659 = nil;
                                local v660 = nil;
                                if v17.misc.dormant.experimental:get() then
                                    for _, v662 in ipairs(v628) do
                                        local v663 = l_v486_1(v636, v662.vec, 3);
                                        for _, v665 in ipairs(v663) do
                                            local l_vec_0 = v665.vec;
                                            local v667, _ = l_utils_0.trace_bullet(v633, v636, l_vec_0, entity.get_players(false, false));
                                            if v662.hitbox == "Head" then
                                                v667 = v667 * 4;
                                            end;
                                            if v667 ~= 0 and v650 < v667 then
                                                v658 = l_vec_0;
                                                v659 = v667;
                                                v660 = v662.hitbox;
                                                break;
                                            end;
                                        end;
                                    end;
                                end;
                                if v645 >= math.floor(v643.alpha * 100) + 5 and not v17.misc.dormant.experimental:get() then
                                    return;
                                else
                                    local v669 = nil;
                                    local v670 = nil;
                                    if v659 ~= nil and v658 ~= nil then
                                        v669 = v658;
                                        v670 = v659;
                                        l_v594_0 = v660;
                                        l_v595_0 = nil;
                                        l_v596_0 = v642;
                                        l_v597_0 = v643.alpha;
                                    else
                                        for _, v672 in ipairs(v644) do
                                            local v673 = v655 + v672.vec;
                                            local v674 = l_v486_1(v636, v673, v672.scale);
                                            for _, v676 in ipairs(v674) do
                                                local l_vec_1 = v676.vec;
                                                local v678, v679 = l_utils_0.trace_bullet(v633, v636, l_vec_1, true);
                                                if v679:is_visible() then
                                                    return;
                                                elseif v678 ~= 0 and v650 < v678 then
                                                    v669 = l_vec_1;
                                                    v670 = v678;
                                                    l_v594_0 = v672.hitbox;
                                                    l_v595_0 = v676.text;
                                                    l_v596_0 = v642;
                                                    l_v597_0 = v643.alpha;
                                                    break;
                                                end;
                                            end;
                                            if v669 and v670 then
                                                break;
                                            end;
                                        end;
                                    end;
                                    if not v670 then
                                        return;
                                    elseif not v669 then
                                        return;
                                    else
                                        l_v488_1(v626, (l_m_bIsScoped_2 and v638.max_player_speed_alt or v638.max_player_speed) * 0.33);
                                        local v680, v681 = v636:to(v669):angles():unpack();
                                        if not l_m_bIsScoped_2 and v638.type == "sniperrifle" and v626.in_jump == false and v640 == 1 then
                                            v626.in_attack2 = 1;
                                        end;
                                        l_v493_1[v642] = true;
                                        if v635 < 0.01 then
                                            v626.view_angles.x = v680;
                                            v626.view_angles.y = v681;
                                            v626.in_attack = 1;
                                            l_v498_1 = true;
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
    events.weapon_fire(function(v683)
        -- upvalues: l_utils_0 (ref), l_v498_1 (ref), l_v598_0 (ref), l_v596_0 (ref), l_v594_0 (ref), l_v595_0 (ref), l_v597_0 (ref)
        l_utils_0.execute_after(0.03, function()
            -- upvalues: v683 (ref), l_v498_1 (ref), l_v598_0 (ref), l_v596_0 (ref), l_v594_0 (ref), l_v595_0 (ref), l_v597_0 (ref)
            local v684 = entity.get_local_player();
            local v685 = entity.get(v683.userid, true);
            if not v685 or v685 == nil then
                return;
            else
                if v685 == v684 then
                    if l_v498_1 and not l_v598_0 then
                        events.dormant_miss:call({
                            userid = l_v596_0, 
                            aim_hitbox = l_v594_0, 
                            aim_point = l_v595_0, 
                            accuracy = l_v597_0
                        });
                    end;
                    l_v598_0 = false;
                    l_v498_1 = false;
                    l_v594_0 = nil;
                    l_v595_0 = nil;
                    l_v596_0 = nil;
                    l_v597_0 = nil;
                end;
                return;
            end;
        end);
    end);
    local function v690(v686)
        -- upvalues: l_v498_1 (ref), l_v598_0 (ref), l_v594_0 (ref)
        local v687 = entity.get(v686.userid, true);
        if not v687 or v687 == nil then
            return;
        else
            local v688 = entity.get(v686.attacker, true);
            if not v688 or v688 == nil then
                return;
            else
                local v689 = v687:get_bbox();
                if v688 == entity.get_local_player() and v687 ~= nil and l_v498_1 == true then
                    l_v598_0 = true;
                    events.dormant_hit:call({
                        userid = v687, 
                        attacker = v688, 
                        health = v686.health, 
                        armor = v686.armor, 
                        weapon = v686.weapon, 
                        dmg_health = v686.dmg_health, 
                        dmg_armor = v686.dmg_armor, 
                        hitgroup = v686.hitgroup, 
                        accuracy = v689.alpha, 
                        aim_hitbox = l_v594_0
                    });
                end;
                return;
            end;
        end;
    end;
    local function v691()
        -- upvalues: l_v492_1 (ref)
        l_v492_1 = globals.tickcount + (cvar.mp_freezetime:float() + 1) / globals.tickinterval;
    end;
    events.dormant_hit(function(v692)
        -- upvalues: v17 (ref), l_v485_1 (ref), l_v594_0 (ref), l_v479_0 (ref)
        if v17.misc.dormant.dormantLogs:get() then
            local v693 = v692.userid:get_name();
            if l_v485_1[v692.hitgroup + 1] == v692.aim_hitbox or l_v594_0 == "Head" then
                print(string.format("[DA] Hit %s in the %s for %i damage (%i health remaining) (%s accuracy)", v693, l_v479_0[v692.hitgroup + 1], v692.dmg_health, v692.health, string.format("%.0f", v692.accuracy * 100) .. "%"));
            else
                print(string.format("[DA] Hit %s in the %s for %i damage (%i health remaining) aimed=%s (%s accuracy)", v693, l_v479_0[v692.hitgroup + 1], v692.dmg_health, v692.health, v692.aim_hitbox, string.format("%.0f", v692.accuracy * 100) .. "%"));
            end;
        end;
    end);
    events.dormant_miss(function(v694)
        -- upvalues: v17 (ref), l_v595_0 (ref), l_v594_0 (ref)
        if v17.misc.dormant.dormantLogs:get() then
            local v695 = v694.userid:get_name();
            if l_v595_0 ~= nil then
                print(string.format("[DA] Missed %s's %s (mp=%s) (%s accuracy)", v695, l_v594_0, l_v595_0, string.format("%.0f", v694.accuracy * 100) .. "%"));
            else
                print(string.format("[DA] Missed %s's %s (%s accuracy)", v695, l_v594_0, string.format("%.0f", v694.accuracy * 100) .. "%"));
            end;
        end;
    end);
    v17.misc.dormant:set_event("createmove", v682);
    v17.misc.dormant:set_event("round_prestart", v691);
    v17.misc.dormant:set_event("player_hurt", v690);
    v17.misc.dormant:set_callback(function()
        ui.find("Visuals", "Players", "Enemies", "ESP", "Dormant"):override(true);
    end);
end;