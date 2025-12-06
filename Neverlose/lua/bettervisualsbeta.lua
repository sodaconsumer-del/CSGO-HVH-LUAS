local l_system_0 = require("neverlose/drag_system");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_gradient_0 = require("neverlose/gradient");
local l_lc_0 = require("neverlose/get_lc");
local l_decode_0 = require("neverlose/gif_decode");
local l_debugoverlay_0 = require("neverlose/debugoverlay");
ffi.cdef("    typedef struct {\n    \tvoid*   fnHandle;\n    \tchar    szName[260];\n    \tint     nLoadFlags;\n    \tint     nServerCount;\n    \tint     type;\n    \tint     flags;\n    \tfloat  vecMins[3];\n    \tfloat  vecMaxs[3];\n    \tfloat   radius;\n    \tchar    pad[0x1C];\n    }model_t;\n\t\n\ttypedef struct {\n\t    float x;\n\t    float y;\n\t    float z;\n\t} Vector;\n\t\n    typedef struct {\n        volatile long refCount;\n    } IRefCounted;\n\n\ttypedef struct { \n\t\tstruct IRefCounted**\tm_pMemory;\n\t\tint32_t                 m_nAllocationCount;\n        int32_t                 m_nGrowSize;\n        int32_t                 m_Size;\n        void*                   m_pElements;\n    } CUtlVector;\n\t\t\n\ttypedef struct {\n\t\tVector\tvecPosition;\n\t\tfloat\tflTimestamp;\n\t\tfloat\tflExpireTime;\n\t} ClientHitVerify;\n");
local v7 = {
    get_model_index = utils.get_vfunc("engine.dll", "VModelInfoClient004", 2, "int(__thiscall*)(void*, const char*)"), 
    set_model_index = utils.get_vfunc(75, "void(__thiscall*)(void*,int)"), 
    get_client_entity_from_handle = utils.get_vfunc("client.dll", "VClientEntityList003", 4, "void*(__thiscall*)(void*,void*)"), 
    get_client_entity = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)"), 
    find_or_load_model = utils.get_vfunc("engine.dll", "VModelInfoClient004", 39, "const model_t(__thiscall*)(void*, const char*)"), 
    find_table = utils.get_vfunc("engine.dll", "VEngineClientStringTable001", 3, "void*(__thiscall*)(void*, const char*)"), 
    add_string = utils.get_vfunc(8, "int(__thiscall*)(void*, bool, const char*, int, const void*)")
};
local v8 = {
    Weapon = ui.find("Visuals", "Players", "Self", "Chams", "Weapon"), 
    WeaponColor = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Color"), 
    WeaponReflectivity = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Reflectivity"), 
    WeaponPearlescent = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Pearlescent"), 
    WeaponShine = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Shine"), 
    WeaponRim = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Rim"), 
    WeaponOutline = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Outline"), 
    WeaponBrightness = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Brightness"), 
    WeaponFill = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Fill"), 
    BodyAim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    SafePoints = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    FakeDuck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    RageBotFOV = ui.find("Aimbot", "Ragebot", "Main", "Field of View"), 
    Removals = ui.find("Visuals", "World", "Main", "Removals"), 
    ScopeOverlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    HitSound = ui.find("Visuals", "World", "Other", "Hit Marker Sound"), 
    FilterConsole = ui.find("Miscellaneous", "Main", "Other", "Filters"), 
    HideShots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    DoubleTap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    AutoPeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    Autowall = ui.find("Aimbot", "Ragebot", "Selection", "Penetrate Walls"), 
    MinimumDamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    SlowWalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    FakeLimitLeft = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    FakeLimitRight = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    FakeLatency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    FakelagLimit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    YawBase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    Freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    DormantAimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    Perspective = ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Perspective"), 
    WeaponStyle = {
        ui.find("Visuals", "Players", "Self", "Chams", "Weapon", "Style")
    }, 
    SelfDefault = {
        ui.find("Visuals", "Players", "Self", "Chams", "Glow", "Default")
    }, 
    SelfRim = {
        ui.find("Visuals", "Players", "Self", "Chams", "Glow", "Rim")
    }, 
    SelfEdgeHighlight = {
        ui.find("Visuals", "Players", "Self", "Chams", "Glow", "Edge Highlight")
    }, 
    SelfEdgeHighlightPulse = {
        ui.find("Visuals", "Players", "Self", "Chams", "Glow", "Edge Highlight Pulse")
    }, 
    SelfGlow = ui.find("Visuals", "Players", "Self", "Chams", "Glow")
};
local v9 = {};
local function v14(v10, v11)
    local v12 = {};
    for v13 = 1, v11 do
        v12[v13] = v10;
    end;
    return v12;
end;
local function v19(v15, v16, v17)
    local l_v15_0 = v15;
    if v17 or l_v15_0[#l_v15_0] ~= v16 then
        table.insert(l_v15_0, v16);
        table.remove(l_v15_0, 1);
    end;
    v15 = l_v15_0;
end;
local _ = function(v20)
    local v21 = 0;
    local v22 = 0;
    for _, v24 in pairs(v20) do
        v22 = v22 + v24;
        v21 = v21 + 1;
    end;
    return v22 / v21;
end;
local function v30(v26, v27)
    -- upvalues: v9 (ref)
    table.insert(v9, {
        fn = v27, 
        time = v26, 
        realtime = globals.realtime
    });
    client_call_delay = function()
        -- upvalues: v9 (ref)
        for _, v29 in ipairs(v9) do
            if v29.realtime + v29.time < globals.realtime then
                v29.fn();
                v29.realtime = globals.realtime;
            end;
        end;
    end;
end;
local function v34(v31, v32, v33)
    return v31 + (v32 - v31) * v33;
end;
local function v42(v35, v36, v37, v38, v39, v40, v41)
    if not v39 then
        v39 = color(255, 255, 255);
    end;
    if not v40 then
        v40 = color(230, 210, 40);
    end;
    if not v41 then
        v41 = color(255, 32, 32);
    end;
    if v37 < v35 then
        return v40.lerp(v40, v41, math.clamp((v35 - v37) / (v38 - v37), 0, 1));
    else
        return v39.lerp(v39, v40, math.clamp((v35 - v36) / (v37 - v36), 0, 1));
    end;
end;
local function v45()
    local v43 = entity.get_local_player();
    if not v43 then
        return;
    elseif v43:is_alive() then
        return v43;
    else
        local l_m_hObserverTarget_0 = v43.m_hObserverTarget;
        return entity.get(l_m_hObserverTarget_0, true) or v43;
    end;
end;
local function v51(v46)
    local v47 = ui.get_binds();
    local v48 = {
        state = false, 
        value = 0
    };
    for v49 = 1, #v47 do
        local v50 = v47[v49];
        if v50.reference:name() == v46 then
            v48 = {
                state = v50.active, 
                value = v50.value
            };
        end;
    end;
    return v48;
end;
local function v55(v52, v53)
    for v54 = 1, #v52 do
        if v52[v54] == v53 then
            return true;
        end;
    end;
    return false;
end;
local function v56(v57)
    -- upvalues: v56 (ref)
    for _, v59 in pairs(v57) do
        if type(v59) == "table" then
            v56(v59);
        else
            v59:override();
        end;
    end;
end;
local function v61(v60)
    if not direction and not alpha then
        direction = false;
        alpha = 0;
    end;
    if direction == false then
        if alpha ~= 255 then
            alpha = math.clamp(alpha + v60, 0, 255);
        else
            direction = true;
        end;
    end;
    if direction == true then
        if alpha ~= 0 then
            alpha = math.clamp(alpha - v60, 0, 255);
        else
            direction = false;
        end;
    end;
    return alpha;
end;
local function v78(v62)
    local v63 = {};
    for v64, v65 in pairs(v62) do
        if type(v65) == "table" then
            for v66, v67 in pairs(v65) do
                if v67:type() == "color_picker" then
                    local l_v64_0 = v64;
                    local v69 = v67:get();
                    local v70 = {
                        r = v69.r, 
                        g = v69.g, 
                        b = v69.b, 
                        a = v69.a
                    };
                    table.insert(v63, {
                        name = l_v64_0, 
                        value = v70, 
                        key = v66
                    });
                else
                    local l_v64_1 = v64;
                    local v72 = v67:get();
                    table.insert(v63, {
                        name = l_v64_1, 
                        value = v72, 
                        key = v66
                    });
                end;
            end;
        elseif v65:type() == "color_picker" then
            local l_v64_2 = v64;
            local v74 = v65:get();
            local v75 = {
                r = v74.r, 
                g = v74.g, 
                b = v74.b, 
                a = v74.a
            };
            table.insert(v63, {
                name = l_v64_2, 
                value = v75
            });
        else
            local l_v64_3 = v64;
            local v77 = v65:get();
            table.insert(v63, {
                name = l_v64_3, 
                value = v77
            });
        end;
    end;
    return json.stringify(v63);
end;
local function v90(v79, v80)
    local l_status_0, l_result_0 = pcall(function()
        -- upvalues: v80 (ref)
        return json.parse(v80);
    end);
    if not l_status_0 then
        return common.add_notify("BetterVisuals", "Error! Your config is not valid.");
    else
        for _, v84 in pairs(l_result_0) do
            local l_name_0 = v84.name;
            local l_value_0 = v84.value;
            local l_key_0 = v84.key;
            local v88 = v79[l_name_0];
            if type(v88) == "table" and v88 then
                local v89 = v88[l_key_0];
                if v89 then
                    v89:set(v89:type() == "color_picker" and color(l_value_0.r, l_value_0.g, l_value_0.b, l_value_0.a) or l_value_0);
                end;
            elseif v88 then
                v88:set(v88:type() == "color_picker" and color(l_value_0.r, l_value_0.g, l_value_0.b, l_value_0.a) or l_value_0);
            end;
        end;
        return;
    end;
end;
local v114 = {
    get_data = function(_, v92)
        local v93 = v92:get_weapon_info();
        if not v93 then
            return;
        else
            local v94 = v92:get_weapon_index();
            if not v94 then
                return;
            else
                local l_weapon_type_0 = v93.weapon_type;
                if not l_weapon_type_0 then
                    return;
                else
                    return {
                        index = v94, 
                        type = l_weapon_type_0
                    };
                end;
            end;
        end;
    end, 
    IsC4 = function(v96, v97)
        return v96:get_data(v97).index == 49;
    end, 
    IsKnife = function(v98, v99)
        return v98:get_data(v99).type == 0 and v98:get_data(v99).index ~= 31;
    end, 
    IsTaser = function(v100, v101)
        return v100:get_data(v101).index == 31;
    end, 
    IsGrenade = function(v102, v103)
        return v102:get_data(v103).type == 9;
    end, 
    IsPistol = function(v104, v105)
        return v104:get_data(v105).type == 1;
    end, 
    IsAutoSniper = function(v106, v107)
        return v106:get_data(v107).index == 38 or v106:get_data(v107).index == 11;
    end, 
    IsRifle = function(v108, v109)
        return v108:get_data(v109).type == 3;
    end, 
    IsAWP = function(v110, v111)
        return v110:get_data(v111).index == 9;
    end, 
    IsSSG08 = function(v112, v113)
        return v112:get_data(v113).index == 40;
    end
};
local v115 = {
    menu_wpn = {
        [1] = "Desert Eagle", 
        [2] = "Dual Berettas", 
        [3] = "Five-SeveN", 
        [4] = "Glock-18", 
        [5] = "AK-47", 
        [6] = "AUG/SG 553", 
        [7] = "AWP", 
        [8] = "FAMAS", 
        [9] = "G3SG1/SCAR-20", 
        [10] = "Galil AR", 
        [11] = "M249", 
        [12] = "M4A4", 
        [13] = "MAC-10/MP9", 
        [14] = "P90", 
        [15] = "MP5-SD", 
        [16] = "UMP-45", 
        [17] = "XM1014", 
        [18] = "PP-Bizon", 
        [19] = "MAG-7/Sawed-Off", 
        [20] = "Negev", 
        [21] = "Tec-9", 
        [22] = "P2000", 
        [23] = "MP7", 
        [24] = "Nova", 
        [25] = "P250", 
        [26] = "SSG 08", 
        [27] = "M4A1-S", 
        [28] = "USP-S", 
        [29] = "CZ75-Auto", 
        [30] = "R8 Revolver", 
        [31] = "Knife", 
        [32] = "Gloves"
    }, 
    menu_wpn_to_idx = {
        [1] = "Desert Eagle", 
        [2] = "Dual Berettas", 
        [3] = "Five-SeveN", 
        [4] = "Glock-18", 
        [5] = nil, 
        [6] = nil, 
        [7] = "AK-47", 
        [8] = "AUG/SG 553", 
        [9] = "AWP", 
        [10] = "FAMAS", 
        [11] = "G3SG1/SCAR-20", 
        [12] = nil, 
        [13] = "Galil AR", 
        [14] = "M249", 
        [15] = nil, 
        [16] = "M4A4", 
        [17] = "MAC-10/MP9", 
        [18] = nil, 
        [19] = "P90", 
        [20] = nil, 
        [21] = nil, 
        [22] = nil, 
        [23] = "MP5-SD", 
        [24] = "UMP-45", 
        [25] = "XM1014", 
        [26] = "PP-Bizon", 
        [27] = "MAG-7/Sawed-Off", 
        [28] = "Negev", 
        [29] = "MAG-7/Sawed-Off", 
        [30] = "Tec-9", 
        [31] = nil, 
        [32] = "P2000", 
        [33] = "MP7", 
        [34] = "MAC-10/MP9", 
        [35] = "Nova", 
        [36] = "P250", 
        [37] = nil, 
        [38] = "G3SG1/SCAR-20", 
        [39] = "AUG/SG 553", 
        [40] = "SSG 08", 
        [41] = "Knife", 
        [42] = "Knife", 
        [43] = nil, 
        [44] = nil, 
        [45] = nil, 
        [46] = nil, 
        [47] = nil, 
        [48] = nil, 
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
        [59] = "Knife", 
        [60] = "M4A1-S", 
        [61] = "USP-S", 
        [62] = nil, 
        [63] = "CZ75-Auto", 
        [64] = "R8 Revolver", 
        [65] = nil, 
        [66] = nil, 
        [67] = nil, 
        [68] = nil, 
        [69] = nil, 
        [70] = nil, 
        [71] = nil, 
        [72] = nil, 
        [73] = nil, 
        [74] = nil, 
        [75] = nil, 
        [76] = nil, 
        [77] = nil, 
        [78] = nil, 
        [79] = nil, 
        [80] = "Knife", 
        [520] = "Knife", 
        [508] = "Knife", 
        [509] = "Knife", 
        [506] = "Knife", 
        [507] = "Knife", 
        [516] = "Knife", 
        [505] = "Knife", 
        [517] = "Knife", 
        [503] = "Knife", 
        [500] = "Knife", 
        [519] = "Knife", 
        [515] = "Knife", 
        [523] = "Knife", 
        [5027] = "Gloves", 
        [5028] = "Gloves", 
        [5029] = "Gloves", 
        [5030] = "Gloves", 
        [5031] = "Gloves", 
        [5032] = "Gloves", 
        [5033] = "Gloves", 
        [5034] = "Gloves", 
        [5035] = "Gloves", 
        [525] = "Knife", 
        [522] = "Knife", 
        [521] = "Knife", 
        [518] = "Knife", 
        [514] = "Knife", 
        [512] = "Knife"
    }, 
    list_names = {
        [1] = "Disabled", 
        [2] = "Custom", 
        [3] = "Dallas", 
        [4] = "Battle Mask", 
        [5] = "Evil Clown", 
        [6] = "Anaglyph", 
        [7] = "Boar", 
        [8] = "Bunny", 
        [9] = "Bunny Gold", 
        [10] = "Chains", 
        [11] = "Chicken", 
        [12] = "Devil Plastic", 
        [13] = "Hoxton", 
        [14] = "Pumpkin", 
        [15] = "Samurai", 
        [16] = "Sheep Bloody", 
        [17] = "Sheep Gold", 
        [18] = "Sheep Model", 
        [19] = "Skull", 
        [20] = "Skull Gold", 
        [21] = "Template", 
        [22] = "Tiki", 
        [23] = "Wolf", 
        [24] = "Zombie Fortune", 
        [25] = "Doll", 
        [26] = "Doll Kabuki"
    }
};
local v116 = {
    group = {
        better_weapon_chams = {}, 
        weapon_models_paths = {}, 
        weapon_models = {}
    }, 
    item = {
        better_weapon_chams_switch = {}, 
        better_weapon_chams_color = {}, 
        better_weapon_chams_styles = {}, 
        better_weapon_chams_style_color = {}, 
        better_weapon_chams_reflectivity = {}, 
        better_weapon_chams_pearlescent = {}, 
        better_weapon_chams_shine = {}, 
        better_weapon_chams_rim = {}, 
        better_weapon_chams_outline = {}, 
        better_weapon_chams_brightness = {}, 
        better_weapon_chams_fill = {}, 
        weapon_models_v = {}, 
        weapon_models_w = {}
    }
};
local v117 = ui.sidebar("\a69B83FFFBetterVisuals", "\a69B83FFF" .. ui.get_icon("paintbrush"));
local v118 = l_gradient_0.text_animate("BetterVisuals", -2, {
    color(105, 184, 63), 
    color(105, 184, 63), 
    color(192, 227, 173)
});
v116.group.welcome_tab = ui.create("Welcome", "Discord", 1);
v116.group.welcome_tab:label("Join Discord for Support");
v116.group.welcome_tab:button("Click here to copy discord link", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/duTaAK8eJY");
end);
v116.group.config_system_tab = ui.create("Welcome", "Config System", 2);
v116.group.config_system_tab:button("Export config to clipboard", function()
    -- upvalues: v78 (ref), v116 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    local v119 = v78(v116.item);
    local v120 = l_base64_0.encode(v119, "9GBy0uqF2Z4e8jtCDRalpwNI57LgSsvoJhWnAmMxPK3bYOQ6XVirfEUzTHk1cd+/=");
    l_clipboard_0.set(v120);
    common.add_notify("BetterVisuals", "Config exported to clipboard");
end);
v116.group.config_system_tab:button("Import config from clipboard", function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v90 (ref), v116 (ref)
    local v121 = l_clipboard_0.get();
    local v122 = l_base64_0.decode(v121, "9GBy0uqF2Z4e8jtCDRalpwNI57LgSsvoJhWnAmMxPK3bYOQ6XVirfEUzTHk1cd+/=");
    v90(v116.item, v122);
    common.add_notify("BetterVisuals", "Config imported from clipboard");
end);
v116.group.better_weapon_chams_tab = ui.create("Better Weapon Chams", "BetterVisuals");
v116.better_weapon_chams_weapons = {
    [1] = "C4", 
    [2] = "Knife", 
    [3] = "Taser", 
    [4] = "Grenade", 
    [5] = "Pistol", 
    [6] = "AutoSnipers", 
    [7] = "Rifles", 
    [8] = "AWP", 
    [9] = "SSG-08"
};
for v123 = 1, 9 do
    v116.item.better_weapon_chams_switch[v123] = v116.group.better_weapon_chams_tab:switch(string.format("%s Chams", v116.better_weapon_chams_weapons[v123]));
    v116.group.better_weapon_chams[v123] = v116.item.better_weapon_chams_switch[v123]:create();
    v116.item.better_weapon_chams_color[v123] = v116.group.better_weapon_chams[v123]:color_picker("Color");
    v116.item.better_weapon_chams_styles[v123] = v116.group.better_weapon_chams[v123]:combo("Style", {
        [1] = "Default", 
        [2] = "Solid", 
        [3] = "Glow", 
        [4] = "Glass", 
        [5] = "Material"
    });
    v116.item.better_weapon_chams_style_color[v123] = v116.item.better_weapon_chams_styles[v123]:color_picker();
    v116.item.better_weapon_chams_reflectivity[v123] = v116.group.better_weapon_chams[v123]:slider("Reflectivity", 0, 100, 0, 1);
    v116.item.better_weapon_chams_pearlescent[v123] = v116.group.better_weapon_chams[v123]:slider("Pearlescent", 0, 10, 0, 1);
    v116.item.better_weapon_chams_shine[v123] = v116.group.better_weapon_chams[v123]:slider("Shine", 0, 100, 0, 1);
    v116.item.better_weapon_chams_rim[v123] = v116.group.better_weapon_chams[v123]:slider("Rim", 0, 100, 0, 1);
    v116.item.better_weapon_chams_outline[v123] = v116.group.better_weapon_chams[v123]:switch("Outline");
    v116.item.better_weapon_chams_brightness[v123] = v116.group.better_weapon_chams[v123]:slider("Brightness", 1, 100, 10, 0.1);
    v116.item.better_weapon_chams_fill[v123] = v116.group.better_weapon_chams[v123]:slider("Fill", 1, 100, 90, 0.1);
end;
v116.group.miscellaneous_tab = ui.create("Miscellaneous", "BetterVisuals");
v116.group.miscellaneous_tab:label("Killmarks");
v116.item.killmarks_killstreaks = v116.group.miscellaneous_tab:selectable("Enable Killmarks", {
    [1] = "1st Kill", 
    [2] = "2nd Kill", 
    [3] = "3rd Kill", 
    [4] = "4th Kill", 
    [5] = "5th Kill", 
    [6] = "6th+ Kill", 
    [7] = "Headshot Kill", 
    [8] = "Wallbang Kill", 
    [9] = "Knife Kill", 
    [10] = "Grenade Kill"
});
v116.group.killmarks = v116.item.killmarks_killstreaks:create();
v116.item.killmarks_height = v116.group.killmarks:slider("Killmark Height", -math.floor(render.screen_size().y), math.floor(render.screen_size().y), 0, 1);
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Spread Circle");
v116.item.spread_circle_switch = v116.group.miscellaneous_tab:switch("Enable Spread Circle");
v116.group.spread_circle = v116.item.spread_circle_switch:create();
v116.item.spread_circle_color_scheme = v116.group.spread_circle:combo("Color Scheme", {
    [1] = "Simple", 
    [2] = "Fade"
});
v116.item.spread_circle_color = v116.group.spread_circle:color_picker("Color", color(0, 0, 0, 40));
v116.item.spread_circle_second_color = v116.group.spread_circle:color_picker("Second Color", color(45, 80, 140, 40));
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Rare Weapon Animation");
v116.item.rare_animations_switch = v116.group.miscellaneous_tab:switch("Enable Rare Animations");
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Custom Scope");
v116.item.custom_scope_switch = v116.group.miscellaneous_tab:switch("Enable Custom Scope");
v116.group.custom_scope = v116.item.custom_scope_switch:create();
v116.item.custom_scope_extras = v116.group.custom_scope:selectable("Extras", {
    [1] = "T Style Scope", 
    [2] = "Disable Animation"
});
v116.item.custom_scope_color = v116.group.custom_scope:color_picker("Color");
v116.item.custom_scope_origin = v116.group.custom_scope:slider("Origin", -200, 100, 25, 1);
v116.item.custom_scope_size = v116.group.custom_scope:slider("Size", 0, 200, 95, 1);
v116.item.custom_scope_speed = v116.group.custom_scope:slider("Speed", 1, 100, 50, 1, "%");
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("GS OOF Arrows");
v116.item.gs_oof_arrows_switch = v116.group.miscellaneous_tab:switch("Enable OOF Arrows");
v116.group.gs_oof_arrows = v116.item.gs_oof_arrows_switch:create();
v116.item.gs_oof_arrows_blinking = v116.group.gs_oof_arrows:switch("Enable Blinking Animation");
v116.item.gs_oof_arrows_color = v116.group.gs_oof_arrows:color_picker("Color", color());
v116.item.gs_oof_arrows_radius = v116.group.gs_oof_arrows:slider("Radius", 1, 100, 25, 1, "%");
v116.item.gs_oof_arrows_size = v116.group.gs_oof_arrows:slider("Size", 1, 30, 10, 1, "px");
v116.item.gs_oof_arrows_speed = v116.group.gs_oof_arrows:slider("Speed", 0, 100, 25, 1, "%");
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("GS Bullet Impact");
v116.item.bullet_impact = v116.group.miscellaneous_tab:switch("Enable Bullet Impact");
v116.group.bullet_impact = v116.item.bullet_impact:create();
v116.item.bullet_impact_serverside_color = v116.group.bullet_impact:color_picker("Server-side impacts ", color(0, 0, 255, 127));
v116.item.bullet_impact_clientside_color = v116.group.bullet_impact:color_picker("Client-side impacts ", color(255, 0, 0, 127));
v116.item.bullet_impact_size = v116.group.bullet_impact:slider("Size ", 0, 100, 10, 0.1);
v116.item.bullet_impact_duration = v116.group.bullet_impact:slider("Duration ", 0, 20, cvar.sv_showimpacts_time:int(), 1, "s");
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("GS Netgraph");
v116.item.netgraph_switch = v116.group.miscellaneous_tab:switch("Enable Netgraph");
v116.group.netgraph = v116.item.netgraph_switch:create();
v116.item.netgraph_combo = v116.group.netgraph:combo("Font", {
    [1] = "Verdana", 
    [2] = "Tahoma", 
    [3] = "Default", 
    [4] = "Console"
});
v116.item.netgraph_height = v116.group.netgraph:slider("Netgraph Y", -math.floor(render.screen_size().y / 2), math.floor(render.screen_size().y / 2), 250, 1);
v116.item.netgraph_lagcomp = v116.group.netgraph:switch("Enable Lagcomp");
v116.item.netgraph_lagcomp_height = v116.group.netgraph:slider("Lagcomp Y", -math.floor(render.screen_size().y / 2), math.floor(render.screen_size().y / 2), -10, 1);
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Hitmarkers");
v116.item.hitmarker3d_switch = v116.group.miscellaneous_tab:switch("3D Hitmarker");
v116.group.hitmarker3d = v116.item.hitmarker3d_switch:create();
v116.item.hitmarker3d_color = v116.group.hitmarker3d:color_picker("Color");
v116.item.hitmarker3d_combo = v116.group.hitmarker3d:combo("Symbol", {
    [1] = "X", 
    [2] = "+"
});
v116.item.hitmarker3d_size = v116.group.hitmarker3d:slider("Size", 1, 25, 8, 1);
v116.item.hitmarker3d_thickness = v116.group.hitmarker3d:slider("Thickness", 1, 6, 1);
v116.item.hitmarker3d_spacing = v116.group.hitmarker3d:slider("Spacing", 0, 25, 10, 1);
v116.item.hitmarker3d_fadetime = v116.group.hitmarker3d:slider("Fade Time", 2, 50, 20, 0.1);
v116.item.hitmarker2d_switch = v116.group.miscellaneous_tab:switch("2D Hitmarker");
v116.group.hitmarker2d = v116.item.hitmarker2d_switch:create();
v116.item.hitmarker2d_color = v116.group.hitmarker2d:color_picker("Color");
v116.item.hitmarker2d_size = v116.group.hitmarker2d:slider("Size", 1, 25, 8, 1);
v116.item.hitmarker2d_spacing = v116.group.hitmarker2d:slider("Spacing", 0, 25, 10, 1);
v116.item.hitmarker2d_fadetime = v116.group.hitmarker2d:slider("Fade Time", 2, 50, 20, 0.1);
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Hitlogs");
v116.item.hitlogs_selectable = v116.group.miscellaneous_tab:selectable("Enable Hitlogs", {
    [1] = "Screen", 
    [2] = "Console"
});
v116.group.hitlogs = v116.item.hitlogs_selectable:create();
v116.item.hitlogs_name = v116.group.hitlogs:input("Cheat name", "neverlose");
v116.item.hitlogs_height = v116.group.hitlogs:slider("Height", -math.floor(render.screen_size().y), math.floor(render.screen_size().y), 0, 1);
v116.item.hitlogs_font_combo = v116.group.hitlogs:combo("Font", {
    [1] = "Default", 
    [2] = "Console", 
    [3] = "Verdana", 
    [4] = "Tahoma"
});
v116.item.hitlogs_font_flags = v116.group.hitlogs:selectable("Font Flags", {
    [1] = "Anti-Aliasing", 
    [2] = "Bold", 
    [3] = "Italic", 
    [4] = "Outline", 
    [5] = "Shadow"
});
v116.item.hitlogs_font_size = v116.group.hitlogs:slider("Font Size", 4, 24, 12, 1);
v116.item.hitlogs_hit_color = v116.group.hitlogs:color_picker("Hit Color", color(182, 231, 23));
v116.item.hitlogs_miss_color = v116.group.hitlogs:color_picker("Miss Color", color(255, 0, 0));
v116.group.miscellaneous_tab:label("");
v116.group.miscellaneous_tab:label("Custom KillSound");
v116.item.killsound_switch = v116.group.miscellaneous_tab:switch("Enable Custom KillSound");
v116.group.killsound = v116.item.killsound_switch:create();
v116.item.killsound_selectable = v116.group.killsound:selectable("Killstreaks", {
    [1] = "1st Kill", 
    [2] = "2nd Kill", 
    [3] = "3rd Kill", 
    [4] = "4th Kill", 
    [5] = "5th Kill", 
    [6] = "6th+ Kill", 
    [7] = "Headshot Kill", 
    [8] = "Wallbang Kill", 
    [9] = "Knife Kill", 
    [10] = "Grenade Kill"
});
v116.item.killsound_volume = v116.group.killsound:slider("Volume", 0, 100, 25, 1);
v116.item.killsound_first_kill = v116.group.killsound:input("1st Kill");
v116.item.killsound_second_kill = v116.group.killsound:input("2nd Kill");
v116.item.killsound_third_kill = v116.group.killsound:input("3rd Kill");
v116.item.killsound_fourth_kill = v116.group.killsound:input("4th Kill");
v116.item.killsound_fifth_kill = v116.group.killsound:input("5th Kill");
v116.item.killsound_sixth_kill = v116.group.killsound:input("6th+ Kill");
v116.item.killsound_headshot_kill = v116.group.killsound:input("Headshot Kill");
v116.item.killsound_wallbang_kill = v116.group.killsound:input("Wallbang Kill");
v116.item.killsound_knife_kill = v116.group.killsound:input("Knife Kill");
v116.item.killsound_grenade_kill = v116.group.killsound:input("Grenade Kill");
v116.group.screen_tab = ui.create("Screen", "BetterVisuals");
v116.group.screen_tab:label("Viewmodel");
v116.item.viewmodel_switch = v116.group.screen_tab:switch("Enable Viewmodel");
v116.group.viewmodel = v116.item.viewmodel_switch:create();
v116.item.viewmodel_fov_slider = v116.group.viewmodel:slider("FOV", -10, 150, 60);
v116.item.viewmodel_x_slider = v116.group.viewmodel:slider("X", -50, 50, 0);
v116.item.viewmodel_y_slider = v116.group.viewmodel:slider("Y", -50, 50, 0);
v116.item.viewmodel_z_slider = v116.group.viewmodel:slider("Z", -50, 50, 0);
v116.item.aspect_ratio_switch = v116.group.screen_tab:switch("Enable Aspect Ratio");
v116.group.aspect_ratio = v116.item.aspect_ratio_switch:create();
v116.item.aspect_ratio_slider = v116.group.aspect_ratio:slider("Value", 0, 50, 0, 0.1);
v116.group.screen_tab:label("");
v116.group.screen_tab:label("Panorama Blur");
v116.item.panorama_blur_switch = v116.group.screen_tab:switch("Disable Panorama Blur");
v116.group.screen_tab:label("");
v116.group.screen_tab:label("Background Blur");
v116.item.blur_switch = v116.group.screen_tab:switch("Enable Background Blur");
v116.group.blur = v116.item.blur_switch:create();
v116.item.blur_strength = v116.group.blur:slider("Strength", 0, 30, 10, 0.1);
v116.group.screen_tab:label("");
v116.group.screen_tab:label("Healthshot Kill Effect");
v116.item.healthshot_switch = v116.group.screen_tab:switch("Enable Healthshot Effect");
v116.group.healthshot = v116.item.healthshot_switch:create();
v116.item.healthshot_duration = v116.group.healthshot:slider("Duration", 1, 50, 10, 0.1, "s");
v116.group.screen_tab:label("");
v116.group.screen_tab:label("GS Menu Border");
v116.item.gs_menu_border_switch = v116.group.screen_tab:switch("Enable GS Menu Border");
v116.group.gs_menu_border = v116.item.gs_menu_border_switch:create();
v116.item.gs_menu_border_color_schemes = v116.group.gs_menu_border:combo("Color Scheme", {
    [1] = "Fade", 
    [2] = "Gradient"
});
v116.item.gs_menu_border_animation = v116.group.gs_menu_border:slider("Animation", 1, 10, 4, 1);
v116.item.gs_menu_border_saturation = v116.group.gs_menu_border:slider("Saturation", 0, 1000, 650, 0.001);
v116.item.gs_menu_border_brightness = v116.group.gs_menu_border:slider("Brightness", 0, 1000, 750, 0.001);
v116.item.gs_menu_border_first_color = v116.group.gs_menu_border:color_picker("First Color", color(55, 177, 218));
v116.item.gs_menu_border_second_color = v116.group.gs_menu_border:color_picker("Second Color", color(204, 70, 205));
v116.item.gs_menu_border_third_color = v116.group.gs_menu_border:color_picker("Third Color", color(204, 227, 53));
v116.group.screen_tab:label("");
v116.group.screen_tab:label("GS Watermark");
v116.item.gs_watermark_switch = v116.group.screen_tab:switch("Enable GS Watermark");
v116.group.gs_watermark = v116.item.gs_watermark_switch:create();
v116.item.gs_watermark_enable = v116.group.gs_watermark:selectable("Enable", {
    [1] = "Logo", 
    [2] = "Username", 
    [3] = "FPS", 
    [4] = "Ping", 
    [5] = "KDR", 
    [6] = "Server info", 
    [7] = "Server framerate", 
    [8] = "Server IP", 
    [9] = "Network lag", 
    [10] = "Tickrate", 
    [11] = "Velocity", 
    [12] = "Time"
});
v116.item.gs_watermark_color = v116.item.gs_watermark_enable:color_picker(color(149, 184, 6));
v116.item.gs_watermark_optionals = v116.group.gs_watermark:selectable("Enable Optionals", {
    [1] = "Suffix", 
    [2] = "Rainbow header", 
    [3] = "Watermark title", 
    [4] = "Time seconds"
});
v116.item.logo_suffix = v116.group.gs_watermark:input("Logo suffix", "[beta]");
v116.item.gs_watermark_title_name = v116.group.gs_watermark:input("Watermark title", "Watermark");
v116.item.gs_watermark_custom_name = v116.group.gs_watermark:input("Watermark name", common.get_username());
v116.item.gs_watermark_logo_name = v116.group.gs_watermark:input("Logo name", "game");
v116.item.gs_watermark_logo_name_accent = v116.group.gs_watermark:input("Logo name accent", "sense");
v116.item.saved_top = v116.group.gs_watermark:slider("Top", -9000, 9000, 15, 1);
v116.item.saved_right = v116.group.gs_watermark:slider("Right", -9000, 9000, 15, 1);
v116.group.local_player_tab = ui.create("Local Player", "BetterVisuals");
v116.group.local_player_tab:label("China Hat");
v116.item.china_hat_switch = v116.group.local_player_tab:switch("Enable China Hat");
v116.group.china_hat = v116.item.china_hat_switch:create();
v116.item.china_hat_color = v116.group.china_hat:color_picker("Color", color(0, 221, 255, 190));
v116.item.china_hat_size = v116.group.china_hat:slider("Size", 0, 15, 10, 1);
v116.item.china_hat_polygons = v116.group.china_hat:slider("Polygons", 5, 90, 10, 1);
v116.item.china_hat_rgb = v116.group.china_hat:switch("Enable RGB");
v116.item.china_hat_rgb_speed = v116.group.china_hat:slider("Speed", 1, 15, 1, 1);
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Angel Halo");
v116.item.angel_halo_switch = v116.group.local_player_tab:switch("Enable Angel Halo");
v116.group.angel_halo = v116.item.angel_halo_switch:create();
v116.item.angel_halo_color = v116.group.angel_halo:color_picker("Color", color(0, 168, 255));
v116.item.angel_halo_size = v116.group.angel_halo:slider("Size", 4, 8, 6, 1);
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Snaplines");
v116.item.snaplines_selectable = v116.group.local_player_tab:selectable("Enable Snaplines", {
    [1] = "Third Person", 
    [2] = "First Person"
});
v116.group.snaplines = v116.item.snaplines_selectable:create();
v116.item.snaplines_combo = v116.group.snaplines:combo("Target", {
    [1] = "Closest (Single)", 
    [2] = "Closest (Multiple)", 
    [3] = "Current Threat"
});
v116.item.snaplines_allow_dormant = v116.group.snaplines:switch("Allow Dormant");
v116.item.snaplines_only_hittable = v116.group.snaplines:switch("Only Hittable");
v116.item.snaplines_only_visible = v116.group.snaplines:switch("Only Visible");
v116.item.snaplines_color = v116.group.snaplines:color_picker("Color", color(255, 255, 255));
v116.item.snaplines_accent_color = v116.group.snaplines:color_picker("Accent Color", color(255, 0, 0));
v116.item.snaplines_min_distance = v116.group.snaplines:slider("Min. Distance", 0, 4096, 200, 1);
v116.item.snaplines_max_distance = v116.group.snaplines:slider("Max Distance", 0, 4096, 600, 1);
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Model Changer");
v116.item.player_models_selectable = v116.group.local_player_tab:selectable("Enable Player Models", {
    [1] = "Terrorists", 
    [2] = "Counter-Terrorists"
});
v116.group.player_models = v116.item.player_models_selectable:create();
v116.item.player_model_changer_t = v116.group.player_models:input("T Model Path");
v116.item.player_model_changer_ct = v116.group.player_models:input("CT Model Path");
v116.item.player_model_show_on_menu = v116.group.player_models:switch("Show on Main Menu");
v116.item.weapon_models_selectable = v116.group.local_player_tab:selectable("Enable Weapon Models", v115.menu_wpn);
for _, v125 in pairs(v115.menu_wpn) do
    v116.group.weapon_models_paths[v125] = v116.group.local_player_tab:label(("%s Path"):format(v125));
    v116.group.weapon_models[v125] = v116.group.weapon_models_paths[v125]:create();
    v116.item.weapon_models_v[v125] = v116.group.weapon_models[v125]:input(("V Model"):format(v125));
    v116.item.weapon_models_w[v125] = v116.group.weapon_models[v125]:input(("W Model"):format(v125));
    v116.group.weapon_models_paths[v125]:visibility(false);
end;
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Mask Changer");
v116.item.mask_changer_combo = v116.group.local_player_tab:combo("Enable Mask Changer", v115.list_names);
v116.group.mask_changer = v116.item.mask_changer_combo:create();
v116.item.custom_mask_changer = v116.group.mask_changer:input("Path");
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Arms Skin");
v116.item.arms_changer_combo = v116.group.local_player_tab:combo("Arms Skin Color", {
    [1] = "Default", 
    [2] = "White", 
    [3] = "Black", 
    [4] = "Brown", 
    [5] = "Asian", 
    [6] = "Mexican", 
    [7] = "Tattos"
});
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Sleeve Opacity");
v116.item.sleeve_opacity_switch = v116.group.local_player_tab:switch("Enable Sleeve Opacity");
v116.group.sleeve_opacity = v116.item.sleeve_opacity_switch:create();
v116.item.sleeve_opacity_slider = v116.group.sleeve_opacity:slider("Change Opacity", 0, 100, 50, 1);
v116.group.local_player_tab:label("");
v116.group.local_player_tab:label("Knife Side");
v116.item.knife_side_selectable = v116.group.local_player_tab:combo("Choose Knife Side", {
    [1] = "Default", 
    [2] = "Left Side", 
    [3] = "Right Side"
});
v116.group.world_modulation_tab = ui.create("World Modulation", "BetterVisuals");
v116.group.world_modulation_tab:label("Model Bloom");
v116.item.model_bloom_switch = v116.group.world_modulation_tab:switch("Enable Model Bloom");
v116.group.model_bloom = v116.item.model_bloom_switch:create();
v116.item.model_bloom_slider = v116.group.model_bloom:slider("Bloom", 1, 100, 5, 1);
v116.item.model_bloom_ambient_light = v116.group.model_bloom:slider("Ambient Light", 0, 140, 0, 0.1);
v116.group.world_modulation_tab:label("");
v116.group.world_modulation_tab:label("FullBright");
v116.item.fullbright_switch = v116.group.world_modulation_tab:switch("Enable FullBright");
v116.group.world_modulation_tab:label("");
v116.group.world_modulation_tab:label("Molotov Modulation");
v116.item.molotov_modulation_switch = v116.group.world_modulation_tab:switch("Enable Molotov Modulation");
v116.group.molotov_modulation = v116.item.molotov_modulation_switch:create();
v116.item.molotov_modulation_selectable = v116.group.molotov_modulation:selectable("Options", {
    [1] = "Wireframe", 
    [2] = "IgnoreZ"
});
v116.group.indicators_tab = ui.create("Indicators", "BetterVisuals");
v116.group.indicators_tab:label("Round Time Remaining");
v116.item.time_remaining_switch = v116.group.indicators_tab:switch("Enable Round Time Remaining");
v116.item.time_remaining_x = v116.group.indicators_tab:slider("Time Remaining X", 0, render.screen_size().x, render.screen_size().x / 2 - 121.5):visibility(false);
v116.item.time_remaining_y = v116.group.indicators_tab:slider("Time Remaining Y", 0, render.screen_size().y, 75):visibility(false);
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Ninjatsu Indicators");
v116.item.ninjatsu_indicators_switch = v116.group.indicators_tab:switch("Enable Ninjatsu Indicators");
v116.group.ninjatsu_indicators = v116.item.ninjatsu_indicators_switch:create();
v116.item.ninjatsu_indicators_extras = v116.group.ninjatsu_indicators:selectable("Extras", {
    [1] = "Glow", 
    [2] = "Static Indicators"
});
v116.item.ninjatsu_indicators_enable = v116.group.ninjatsu_indicators:selectable("Enable Effects", {
    [1] = "Knife", 
    [2] = "Zeus"
});
v116.item.ninjatsu_indicators_sound = v116.group.ninjatsu_indicators:combo("Sound", {
    [1] = "Disabled", 
    [2] = "Naruto", 
    [3] = "Sekiro"
});
v116.item.ninjatsu_indicators_volume = v116.group.ninjatsu_indicators:slider("Volume", 0, 100, 20, 1);
v116.item.ninjatsu_indicators_color = v116.group.ninjatsu_indicators:combo("Color Scheme", {
    [1] = "Default", 
    [2] = "Sigma", 
    [3] = "Custom"
});
v116.item.ninjatsu_indicators_doubletap = v116.group.ninjatsu_indicators:color_picker("DoubleTap Color");
v116.item.ninjatsu_indicators_hideshots = v116.group.ninjatsu_indicators:color_picker("HideShots Color");
v116.item.ninjatsu_indicators_quickpeek = v116.group.ninjatsu_indicators:color_picker("Quick Peek Color");
v116.item.ninjatsu_indicators_fakeduck = v116.group.ninjatsu_indicators:color_picker("Fake Duck Color");
v116.item.ninjatsu_indicators_slowwalk = v116.group.ninjatsu_indicators:color_picker("Slow Walk Color");
v116.item.ninjatsu_indicators_zeus = v116.group.ninjatsu_indicators:color_picker("Zeus Color");
v116.item.ninjatsu_indicators_knife = v116.group.ninjatsu_indicators:color_picker("Knife Color");
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Velocity Warning");
v116.item.velocity_warning_switch = v116.group.indicators_tab:switch("Enable Velocity Warning");
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Zeus Warning");
v116.item.zeus_warning_switch = v116.group.indicators_tab:switch("Enable Zeus Warning");
v116.group.zeus_warning = v116.item.zeus_warning_switch:create();
v116.item.zeus_warning_combo = v116.group.zeus_warning:combo("Image", {
    [1] = "Default", 
    [2] = "Mjolnir"
});
v116.item.zeus_warning_slider = v116.group.zeus_warning:slider("Size", 15, 35, 25, 1, "px");
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Damage Indicator");
v116.item.damage_indicator_switch = v116.group.indicators_tab:switch("Enable Damage Indicator");
v116.group.damage_indicator = v116.item.damage_indicator_switch:create();
v116.item.damage_indicator_style = v116.group.damage_indicator:combo("Style", {
    [1] = "GS", 
    [2] = "OT"
});
v116.item.damage_indicator_font_combo = v116.group.damage_indicator:combo("Font", {
    [1] = "Default", 
    [2] = "Small", 
    [3] = "Console", 
    [4] = "Verdana", 
    [5] = "Tahoma"
});
v116.item.damage_indicator_font_flags = v116.group.damage_indicator:selectable("Flags", {
    [1] = "Anti-Aliasing", 
    [2] = "Bold", 
    [3] = "Italic", 
    [4] = "Outline", 
    [5] = "Shadow"
});
v116.item.damage_indicator_font_size = v116.group.damage_indicator:slider("Font Size", 8, 24, 13, 1);
v116.item.damage_indicator_head_color = v116.group.damage_indicator:color_picker("Head Color", color(146, 183, 34));
v116.item.damage_indicator_body_color = v116.group.damage_indicator:color_picker("Body Color", color(255, 255, 255));
v116.item.damage_indicator_grenade_color = v116.group.damage_indicator:color_picker("Grenade Color", color(255, 200, 70));
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Spectator List");
v116.item.spectator_list_switch = v116.group.indicators_tab:switch("Enable Spectator List");
v116.group.spectator_list = v116.item.spectator_list_switch:create();
v116.item.spectator_list_position = v116.group.spectator_list:combo("Position", {
    [1] = "Top-Left", 
    [2] = "Top-Right", 
    [3] = "Bottom-Left", 
    [4] = "Bottom-Right"
});
v116.item.spectator_list_font_combo = v116.group.spectator_list:combo("Font", {
    [1] = "Default", 
    [2] = "Small", 
    [3] = "Console", 
    [4] = "Verdana", 
    [5] = "Tahoma"
});
v116.item.spectator_list_font_flags = v116.group.spectator_list:selectable("Flags", {
    [1] = "Anti-Aliasing", 
    [2] = "Bold", 
    [3] = "Italic", 
    [4] = "Outline", 
    [5] = "Shadow"
});
v116.item.spectator_list_font_size = v116.group.spectator_list:slider("Font Size", 8, 13, 10, 1);
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("Min Dmg Indicator");
v116.item.min_dmg_indicator_style = v116.group.indicators_tab:combo("Enable Min Dmg Indicator", {
    [1] = "Disabled", 
    [2] = "Default Style", 
    [3] = "Kibit Style"
});
v116.group.min_dmg_indicator = v116.item.min_dmg_indicator_style:create();
v116.item.min_dmg_indicator_x = v116.group.min_dmg_indicator:slider("Pos X", -math.floor(render.screen_size().x / 10), math.floor(render.screen_size().x / 10), 0, 1);
v116.item.min_dmg_indicator_y = v116.group.min_dmg_indicator:slider("Pos Y", -math.floor(render.screen_size().x / 10), math.floor(render.screen_size().x / 10), 0, 1);
v116.item.min_dmg_indicator_spacing = v116.group.min_dmg_indicator:slider("Spacing", -math.floor(render.screen_size().x / 15), math.floor(render.screen_size().x / 15), 30, 1);
v116.item.min_dmg_indicator_always_show = v116.group.min_dmg_indicator:switch("Always Show");
v116.item.min_dmg_indicator_font_combo = v116.group.min_dmg_indicator:combo("Font", {
    [1] = "Default", 
    [2] = "Small", 
    [3] = "Console", 
    [4] = "Verdana", 
    [5] = "Tahoma"
});
v116.item.min_dmg_indicator_font_flags = v116.group.min_dmg_indicator:selectable("Flags", {
    [1] = "Anti-Aliasing", 
    [2] = "Bold", 
    [3] = "Italic", 
    [4] = "Outline", 
    [5] = "Shadow"
});
v116.item.min_dmg_indicator_font_size = v116.group.min_dmg_indicator:slider("Font Size", 4, 24, 12, 1);
v116.group.indicators_tab:label("");
v116.group.indicators_tab:label("GS Indicators");
v116.item.gs_indicators_selectable = v116.group.indicators_tab:selectable("Enable GS Indicators", {
    [1] = "Force safe point", 
    [2] = "Force body aim", 
    [3] = "Ping spike", 
    [4] = "Double tap", 
    [5] = "Duck peek assist", 
    [6] = "Freestanding", 
    [7] = "On shot anti-aim", 
    [8] = "Minimum damage override", 
    [9] = "Bomb information", 
    [10] = "Dormant aimbot", 
    [11] = "Hitchance override", 
    [12] = "Aimbot stats", 
    [13] = "Anti defensive", 
    [14] = "Fakelag cycle", 
    [15] = "Lag compensation", 
    [16] = "Slowed down", 
    [17] = "Low fps warning"
});
local v126 = {
    turned_off = not v116.item.better_weapon_chams_switch[1]:get() and not v116.item.better_weapon_chams_switch[2]:get() and not v116.item.better_weapon_chams_switch[3]:get() and not v116.item.better_weapon_chams_switch[4]:get() and not v116.item.better_weapon_chams_switch[5]:get() and not v116.item.better_weapon_chams_switch[6]:get() and not v116.item.better_weapon_chams_switch[7]:get() and not v116.item.better_weapon_chams_switch[8]:get() and not v116.item.better_weapon_chams_switch[9]:get(), 
    at_least_one_enabled = v116.item.better_weapon_chams_switch[1]:get() or v116.item.better_weapon_chams_switch[2]:get() or v116.item.better_weapon_chams_switch[3]:get() or v116.item.better_weapon_chams_switch[4]:get() or v116.item.better_weapon_chams_switch[5]:get() or v116.item.better_weapon_chams_switch[6]:get() or v116.item.better_weapon_chams_switch[7]:get() or v116.item.better_weapon_chams_switch[8]:get() or v116.item.better_weapon_chams_switch[9]:get(), 
    indexes = {
        [1] = v114.IsC4, 
        [2] = v114.IsKnife, 
        [3] = v114.IsTaser, 
        [4] = v114.IsGrenade, 
        [5] = v114.IsPistol, 
        [6] = v114.IsAutoSniper, 
        [7] = v114.IsRifle, 
        [8] = v114.IsAWP, 
        [9] = v114.IsSSG08
    }
};
v126.main = function()
    -- upvalues: v126 (ref), v114 (ref), v116 (ref), v8 (ref)
    local v127 = entity.get_local_player();
    if not v127 then
        return;
    elseif not v127:is_alive() then
        return;
    else
        local v128 = v127:get_player_weapon();
        if not v128 then
            return;
        else
            for v129, v130 in pairs(v126.indexes) do
                local v131 = v130(v114, v128);
                if v116.item.better_weapon_chams_switch[v129]:get() and v131 and not common.is_in_thirdperson() then
                    v8.Weapon:override(true);
                    v8.WeaponColor:override(v116.item.better_weapon_chams_color[v129]:get());
                    v8.WeaponStyle[1]:override(v116.item.better_weapon_chams_styles[v129]:get());
                    v8.WeaponStyle[2]:override(v116.item.better_weapon_chams_style_color[v129]:get());
                    v8.WeaponReflectivity:override(v116.item.better_weapon_chams_reflectivity[v129]:get());
                    v8.WeaponPearlescent:override(v116.item.better_weapon_chams_pearlescent[v129]:get());
                    v8.WeaponShine:override(v116.item.better_weapon_chams_shine[v129]:get());
                    v8.WeaponRim:override(v116.item.better_weapon_chams_rim[v129]:get());
                    v8.WeaponOutline:override(v116.item.better_weapon_chams_outline[v129]:get());
                    v8.WeaponBrightness:override(v116.item.better_weapon_chams_brightness[v129]:get() / 10);
                    v8.WeaponFill:override(v116.item.better_weapon_chams_fill[v129]:get() / 10);
                    return;
                elseif v126.at_least_one_enabled or v126.turned_off then
                    v8.Weapon:override();
                    v8.WeaponColor:override();
                    v8.WeaponStyle[1]:override();
                    v8.WeaponStyle[2]:override();
                    v8.WeaponReflectivity:override();
                    v8.WeaponPearlescent:override();
                    v8.WeaponShine:override();
                    v8.WeaponRim:override();
                    v8.WeaponOutline:override();
                    v8.WeaponBrightness:override();
                    v8.WeaponFill:override();
                    v8.Perspective:override();
                end;
            end;
            return;
        end;
    end;
end;
v126.ui = function(v132)
    -- upvalues: v116 (ref)
    local v133 = v116.item.better_weapon_chams_styles[v132]:get();
    v116.item.better_weapon_chams_style_color[v132]:visibility(v133 ~= "Solid" and v133 ~= "Material" and (not v116.item.better_weapon_chams_outline[v132]:get() or v133 ~= "Glow"));
    v116.item.better_weapon_chams_reflectivity[v132]:visibility(v133 == "Default");
    v116.item.better_weapon_chams_pearlescent[v132]:visibility(v133 == "Default");
    v116.item.better_weapon_chams_shine[v132]:visibility(v133 == "Default");
    v116.item.better_weapon_chams_rim[v132]:visibility(v133 == "Default");
    v116.item.better_weapon_chams_outline[v132]:visibility(v133 == "Glow");
    v116.item.better_weapon_chams_brightness[v132]:visibility(v133 == "Glow");
    v116.item.better_weapon_chams_fill[v132]:visibility(v133 == "Glow");
end;
for v134 = 1, 9 do
    do
        local l_v134_0 = v134;
        v116.item.better_weapon_chams_styles[l_v134_0]:set_callback(function()
            -- upvalues: v126 (ref), l_v134_0 (ref)
            v126.ui(l_v134_0);
        end, true);
        v116.item.better_weapon_chams_outline[l_v134_0]:set_callback(function()
            -- upvalues: v126 (ref), l_v134_0 (ref)
            v126.ui(l_v134_0);
        end, true);
    end;
end;
local v136 = {
    retry = false, 
    count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    }, 
    cf_downloaded_files = {
        error = false, 
        error_index = {}
    }, 
    cf_image = {}, 
    valorant_image = {}, 
    time = {}, 
    size = {
        vector(100, 100), 
        vector(74, 102), 
        vector(375, 250)
    }, 
    cf_bytes = {
        [1] = "https://i.imgur.com/iEKxjHO.png", 
        [2] = "https://i.imgur.com/AsDKPR5.png", 
        [3] = "https://i.imgur.com/rJarwOP.png", 
        [4] = "https://i.imgur.com/VDrRXD7.png", 
        [5] = "https://i.imgur.com/qHpmPoO.png", 
        [6] = "https://i.imgur.com/pkIJ9TW.png", 
        [7] = "https://i.imgur.com/8TjuNi7.png", 
        [8] = "https://i.imgur.com/TEGBavn.png", 
        [9] = "https://i.imgur.com/cgnyAPZ.png", 
        [10] = "https://i.imgur.com/83awGIE.png", 
        [11] = "https://i.imgur.com/Pypa0ys.png", 
        [12] = "https://i.imgur.com/r3Hxxzp.png", 
        [13] = "https://i.imgur.com/GMWk8b5.png"
    }
};
v136.load_images = function(v137, v138)
    -- upvalues: v136 (ref)
    if v137 then
        v136.cf_image[v138] = render.load_image_from_file(("nl\\bettervisuals\\crossfire_%s.png"):format(v138), v136.size[1]);
    else
        for v139 = 1, 13 do
            if files.get_crc32(("nl\\bettervisuals\\crossfire_%s.png"):format(v139)) == -1808745910 then
                v136.cf_image[v139] = render.load_image_from_file(("nl\\bettervisuals\\crossfire_%s.png"):format(v139), v136.size[1]);
            else
                v136.cf_downloaded_files.error = true;
                v136.cf_downloaded_files.error_index[#v136.cf_downloaded_files.error_index + 1] = v139;
            end;
        end;
    end;
end;
v136.load_images();
v136.download_images = function()
    -- upvalues: v136 (ref)
    if v136.cf_downloaded_files.error then
        for _, v141 in pairs(v136.cf_downloaded_files.error_index) do
            do
                local l_v141_0 = v141;
                network.get(v136.cf_bytes[l_v141_0], {}, function(v143)
                    -- upvalues: l_v141_0 (ref), v136 (ref)
                    if v143 then
                        files.create_folder("nl\\bettervisuals");
                        files.write(("nl\\bettervisuals\\crossfire_%s.png"):format(l_v141_0), v143, true);
                        v136.load_images(true, l_v141_0);
                    end;
                end);
            end;
        end;
    end;
end;
v136.download_images();
events.player_death:set(function(v144)
    -- upvalues: v116 (ref), v136 (ref)
    if not v116.item.killmarks_killstreaks:get() then
        return;
    else
        local v145 = entity.get_local_player();
        if not v145 then
            return;
        elseif not v145:is_alive() then
            return;
        else
            local v146 = entity.get(v144.userid, true);
            local v147 = entity.get(v144.attacker, true);
            local l_weapon_0 = v144.weapon;
            local l_headshot_0 = v144.headshot;
            local v150 = v144.penetrated == 1;
            if v147 ~= v145 or v146 == v145 or v146 == v147 then
                return;
            else
                local v151 = false;
                if l_weapon_0:match("knife_") or l_weapon_0:match("bayonet") then
                    v151 = true;
                end;
                v136.count.default = v136.count.default + 1;
                v136.count.priority = 5;
                if v116.item.killmarks_killstreaks:get(10) and (l_weapon_0 == "inferno" or l_weapon_0 == "hegrenade") then
                    v136.count.grenade = v136.count.grenade + 1;
                    v136.count.priority = 1;
                end;
                if v116.item.killmarks_killstreaks:get(9) and v151 then
                    v136.count.knife = v136.count.knife + 1;
                    v136.count.priority = 2;
                end;
                if not v151 and l_weapon_0 ~= "inferno" and l_weapon_0 ~= "hegrenade" then
                    if l_headshot_0 and not v150 then
                        if v116.item.killmarks_killstreaks:get(7) then
                            v136.count.headshot = v136.count.headshot + 1;
                            v136.count.priority = 3;
                        end;
                    elseif l_headshot_0 and v150 then
                        if v116.item.killmarks_killstreaks:get(8) then
                            v136.count.wallbang = v136.count.wallbang + 1;
                            v136.count.priority = 4;
                        elseif v116.item.killmarks_killstreaks:get(7) then
                            v136.count.headshot = v136.count.headshot + 1;
                            v136.count.priority = 3;
                        end;
                    end;
                end;
                v136.time[1] = {
                    start_time = globals.realtime
                };
                return;
            end;
        end;
    end;
end);
v136.render = function()
    -- upvalues: v116 (ref), v136 (ref)
    if not v116.item.killmarks_killstreaks:get() then
        return;
    else
        local v152 = entity.get_local_player();
        if not v152 or not v152:is_alive() then
            v136.count = {
                grenade = 0, 
                knife = 0, 
                headshot = 0, 
                wallbang = 0, 
                default = 0, 
                priority = 0
            };
            return;
        else
            for v153 = 1, #v136.time do
                local l_realtime_0 = globals.realtime;
                local v155 = l_realtime_0 - v136.time[v153].start_time <= 1 and 255 or math.floor(320 - 255 * (l_realtime_0 - v136.time[v153].start_time));
                local v156 = vector(render.screen_size().x / 2 - v136.size[1].x / 2, render.screen_size().y - v136.size[1].y - 30 + v116.item.killmarks_height:get());
                local v157 = vector(render.screen_size().x / 2 - v136.size[2].x / 2, render.screen_size().y - v136.size[2].y - 57 + v116.item.killmarks_height:get());
                if v136.count.priority == 5 then
                    if v116.item.killmarks_killstreaks:get(1) and v136.count.default == 1 then
                        render.texture(v136.cf_image[1], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(2) and v136.count.default == 2 then
                        render.texture(v136.cf_image[2], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(3) and v136.count.default == 3 then
                        render.texture(v136.cf_image[3], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(4) and v136.count.default == 4 then
                        render.texture(v136.cf_image[4], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(5) and v136.count.default == 5 then
                        render.texture(v136.cf_image[5], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(6) and v136.count.default >= 6 then
                        render.texture(v136.cf_image[6], v156, v136.size[1], color(255, 255, 255, v155));
                    end;
                end;
                if v136.count.priority == 2 then
                    if v116.item.killmarks_killstreaks:get(9) and v136.count.knife == 1 then
                        render.texture(v136.cf_image[7], v157, v136.size[2], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(9) and v136.count.knife == 2 then
                        render.texture(v136.cf_image[8], v157, v136.size[2], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(9) and v136.count.knife == 3 then
                        render.texture(v136.cf_image[9], v157, v136.size[2], color(255, 255, 255, v155));
                    end;
                    if v116.item.killmarks_killstreaks:get(9) and v136.count.knife >= 4 then
                        render.texture(v136.cf_image[10], v157, v136.size[2], color(255, 255, 255, v155));
                    end;
                end;
                if v116.item.killmarks_killstreaks:get(10) and v136.count.grenade >= 1 and v136.count.priority == 1 then
                    render.texture(v136.cf_image[11], v156, v136.size[1], color(255, 255, 255, v155));
                end;
                if v116.item.killmarks_killstreaks:get(7) and v136.count.headshot >= 1 and v136.count.priority == 3 then
                    render.texture(v136.cf_image[12], v156, v136.size[1], color(255, 255, 255, v155));
                end;
                if v116.item.killmarks_killstreaks:get(8) and v136.count.wallbang >= 1 and v136.count.priority == 4 then
                    render.texture(v136.cf_image[13], v156, v136.size[1], color(255, 255, 255, v155));
                end;
            end;
            return;
        end;
    end;
end;
local v173 = {
    render_triangle = function(v158, v159, v160, v161)
        render.poly(v161, vector(v158.x, v158.y), vector(v159.x, v159.y), vector(v159.x, v159.y), vector(v160.x, v160.y), vector(v160.x, v160.y), vector(v158.x, v158.y));
    end, 
    rotate_triangle = function(v162, v163)
        local v164 = (v162[1] + v162[2] + v162[3]) / 3;
        local v165 = {};
        for v166, v167 in pairs(v162) do
            v167 = v167 - v164;
            local l_x_0 = v167.x;
            local l_y_0 = v167.y;
            local v170 = math.rad(v163);
            local v171 = math.cos(v170);
            local v172 = math.sin(v170);
            v167.x = l_x_0 * v171 - l_y_0 * v172;
            v167.y = l_x_0 * v172 + l_y_0 * v171;
            v165[v166] = v167 + v164;
        end;
        return v165;
    end, 
    M_RADPI = 57.295779513082
};
v173.calculate_angle = function(v174, v175)
    -- upvalues: v173 (ref)
    local v176 = vector();
    local v177 = v174 - v175;
    local v178 = v177:length2d();
    v176.y = math.atan(v177.y / v177.x) * v173.M_RADPI;
    v176.x = math.atan(-v177.z / v178) * -v173.M_RADPI;
    v176.z = 0;
    if v177.x >= 0 then
        v176.y = v176.y + 180;
    end;
    return v176;
end;
v173.main = function()
    -- upvalues: v116 (ref), v45 (ref), v173 (ref), v61 (ref)
    if not v116.item.gs_oof_arrows_switch:get() then
        return;
    else
        local v179 = v45();
        if not v179 then
            return;
        else
            entity.get_players(false, false, function(v180)
                -- upvalues: v179 (ref), v173 (ref), v116 (ref), v61 (ref)
                if not v180:is_alive() or v180.m_iTeamNum == v179.m_iTeamNum then
                    return;
                elseif not ({
                    render.get_offscreen(v180:get_origin(), 1, false)
                })[3] then
                    return;
                else
                    local v181 = render.camera_angles();
                    local _ = render.screen_size().x;
                    local _ = render.screen_size().y;
                    local v184 = render.screen_size() / 2;
                    local v185 = math.rad(v181.y - v173.calculate_angle(entity.get_local_player():get_eye_position(), v180:get_origin()).y - 90);
                    local v186 = v116.item.gs_oof_arrows_size:get() / 2;
                    local v187 = v116.item.gs_oof_arrows_radius:get() / 100;
                    local v188 = vector(v184.x + ((render.screen_size().x / 2 - v186 * 3) * v187 + 10) * math.cos(v185) + 6 * (v186 / 16), v184.y + ((render.screen_size().y / 2 - v186 * 3) * v187 + 10) * math.sin(v185));
                    local v189 = {
                        vector(v188.x - v186, v188.y - v186), 
                        vector(v188.x + v186, v188.y), 
                        vector(v188.x - v186, v188.y + v186)
                    };
                    local v190 = v116.item.gs_oof_arrows_color:get();
                    if v116.item.gs_oof_arrows_blinking:get() then
                        v190.a = v61(v116.item.gs_oof_arrows_speed:get() / 20);
                    end;
                    local v191 = v173.rotate_triangle(v189, v181.y - v173.calculate_angle(entity.get_local_player():get_eye_position(), v180:get_origin()).y - 90);
                    v173.render_triangle(v191[1], v191[2], v191[3], v190);
                    return;
                end;
            end);
            return;
        end;
    end;
end;
v116.item.gs_oof_arrows_blinking:set_callback(function(v192)
    -- upvalues: v116 (ref)
    v116.item.gs_oof_arrows_speed:visibility(v192:get());
end, true);
local v197 = {
    last_count = 0, 
    get_client_impact_list = function(v193)
        -- upvalues: v7 (ref)
        local v194 = ffi.cast("uintptr_t", v7.get_client_entity(v193));
        if v194 == nil then
            return;
        else
            local v195 = ffi.cast("CUtlVector*", v194 + 72784);
            if v195 == nil then
                return;
            else
                local v196 = ffi.cast("ClientHitVerify*", v195.m_pMemory);
                if v196 == nil then
                    return;
                else
                    return v195, v196;
                end;
            end;
        end;
    end
};
events.bullet_impact:set(function(v198)
    -- upvalues: v116 (ref), l_debugoverlay_0 (ref)
    if not v116.item.bullet_impact:get() then
        return;
    else
        local v199 = entity.get_local_player();
        local v200 = entity.get(v198.userid, true);
        if not v199 or v200 ~= v199 then
            return;
        else
            local v201 = vector(v198.x, v198.y, v198.z);
            if v201 then
                local v202, v203, v204, v205 = v116.item.bullet_impact_serverside_color:get():unpack();
                local v206 = vector(v116.item.bullet_impact_size:get(), v116.item.bullet_impact_size:get(), v116.item.bullet_impact_size:get()) / 10;
                l_debugoverlay_0.AddBoxOverlay(v201, -v206, v206, vector(), v202, v203, v204, v205, v116.item.bullet_impact_duration:get());
            end;
            return;
        end;
    end;
end);
v197.server_side = function()
    -- upvalues: v197 (ref), v116 (ref), l_debugoverlay_0 (ref)
    local v207 = entity.get_local_player();
    if not v207 then
        v197.last_count = 0;
        return;
    else
        local v208, v209 = v197.get_client_impact_list(v207:get_index());
        if v208 == nil or v209 == nil then
            v197.last_count = 0;
            return;
        else
            for v210 = v208.m_Size, v197.last_count + 1, -1 do
                local l_vecPosition_0 = v209[v210 - 1].vecPosition;
                local v212 = vector(l_vecPosition_0.x, l_vecPosition_0.y, l_vecPosition_0.z);
                if v212 and v116.item.bullet_impact:get() then
                    local v213, v214, v215, v216 = v116.item.bullet_impact_clientside_color:get():unpack();
                    local v217 = vector(v116.item.bullet_impact_size:get(), v116.item.bullet_impact_size:get(), v116.item.bullet_impact_size:get()) / 10;
                    l_debugoverlay_0.AddBoxOverlay(v212, -v217, v217, vector(), v213, v214, v215, v216, v116.item.bullet_impact_duration:get());
                end;
            end;
            if v208.m_Size ~= v197.last_count then
                v197.last_count = v208.m_Size;
            end;
            return;
        end;
    end;
end;
utils.execute_after(1.5, function()
    -- upvalues: v197 (ref)
    events.pre_render(v197.server_side);
end);
local v225 = {
    render = function()
        -- upvalues: v116 (ref)
        local v218 = v116.item.spread_circle_switch:get();
        local v219 = v116.item.spread_circle_color:get();
        local v220 = v116.item.spread_circle_second_color:get();
        if not v218 then
            return;
        else
            local v221 = entity.get_local_player();
            if not v221 then
                return;
            elseif not v221:is_alive() then
                return;
            else
                local v222 = v221:get_player_weapon();
                if not v222 then
                    return;
                else
                    local v223 = vector(render.screen_size().x / 2, render.screen_size().y / 2);
                    local v224 = v222:get_inaccuracy(v222) * 550;
                    if v116.item.spread_circle_color_scheme:get() == "Simple" then
                        render.circle(v223, v219, v224, 60, 1);
                    else
                        render.circle_gradient(v223, v219, v220, v224, 60, 1);
                    end;
                    return;
                end;
            end;
        end;
    end
};
v116.item.spread_circle_color_scheme:set_callback(function(v226)
    -- upvalues: v116 (ref)
    v116.item.spread_circle_second_color:visibility(v226:get() == "Fade");
end, true);
local v227 = {
    sequence_overrides = {
        [1] = {
            [7] = 8
        }, 
        [64] = {
            [3] = 4
        }, 
        [503] = {
            [12] = 15
        }, 
        [512] = {
            [12] = 13
        }, 
        [515] = {
            [1] = 0, 
            [13] = 15, 
            [14] = 15
        }, 
        [519] = {
            [0] = 1, 
            [14] = 13
        }, 
        [517] = {
            [0] = 1, 
            [14] = 13
        }, 
        [518] = {
            [0] = 1, 
            [14] = 13
        }, 
        [521] = {
            [14] = 13
        }, 
        [522] = {
            [13] = 12
        }, 
        [523] = {
            [14] = 15
        }, 
        [525] = {
            [0] = 1, 
            [13] = 14
        }
    }
};
v227.main = function()
    -- upvalues: v116 (ref), v227 (ref)
    if not v116.item.rare_animations_switch:get() then
        return;
    else
        local v228 = entity.get_local_player();
        if not v228 then
            return;
        else
            local v229 = v228["m_hViewModel[0]"];
            if v229 == nil then
                return;
            else
                local v230 = v228:get_player_weapon();
                if not v230 then
                    return;
                else
                    local v231 = v230:get_weapon_index();
                    local l_m_nSequence_0 = v229.m_nSequence;
                    local v233 = v227.sequence_overrides[v231];
                    if v233 then
                        local v234 = v233[l_m_nSequence_0];
                        if v234 then
                            v229.m_nSequence = v234;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
local v241 = {
    length = 0, 
    scope_overlay = function(v235, v236, v237, v238)
        local v239 = render.screen_size().x / 2;
        local v240 = render.screen_size().y / 2;
        if not v238 then
            render.gradient(vector(v239 + 1, v240 - v235 + 1), vector(v239, v240 - v235 - v236 + 1), v237, v237, color(v237.r, v237.g, v237.b, 0), color(v237.r, v237.g, v237.b, 0));
        end;
        render.gradient(vector(v239 + 1, v240 + v235), vector(v239, v240 + v235 + v236), v237, v237, color(v237.r, v237.g, v237.b, 0), color(v237.r, v237.g, v237.b, 0));
        render.gradient(vector(v239 - v235 + 1, v240 + 1), vector(v239 - v235 - v236 + 1, v240), v237, color(v237.r, v237.g, v237.b, 0), v237, color(v237.r, v237.g, v237.b, 0));
        render.gradient(vector(v239 + v235, v240 + 1), vector(v239 + v235 + v236, v240), v237, color(v237.r, v237.g, v237.b, 0), v237, color(v237.r, v237.g, v237.b, 0));
    end
};
v241.render = function()
    -- upvalues: v116 (ref), v8 (ref), v241 (ref)
    if not v116.item.custom_scope_switch:get() then
        v8.ScopeOverlay:override();
        return;
    else
        local v242 = entity.get_local_player();
        if not v242 or not v242:is_alive() then
            return;
        else
            if v242.m_bIsScoped then
                v8.ScopeOverlay:override("Remove All");
                local v243 = math.min(v116.item.custom_scope_origin:get(), v241.length);
                local v244 = math.min(v116.item.custom_scope_size:get(), v241.length);
                if v116.item.custom_scope_extras:get(2) then
                    v241.length = v116.item.custom_scope_origin:get() / 2 + v116.item.custom_scope_size:get();
                else
                    v241.length = math.clamp(v241.length + v116.item.custom_scope_speed:get() / 50, v243, v116.item.custom_scope_origin:get() / 2 + v116.item.custom_scope_size:get());
                end;
                v241.scope_overlay(v243, v244, v116.item.custom_scope_color:get(), v116.item.custom_scope_extras:get(1));
            else
                v8.ScopeOverlay:override();
                v241.length = 0;
            end;
            return;
        end;
    end;
end;
local v245 = {
    downloaded_file_error = false
};
v116.item.netgraph_combo:set_callback(function(v246)
    -- upvalues: v245 (ref)
    if v246:get() == "Verdana" or v246:get() == "Tahoma" then
        v245.font = render.load_font(v246:get(), 12, "o");
    end;
end, true);
v245.cl_interp_ratio = cvar.cl_interp_ratio;
v245.cl_updaterate = cvar.cl_updaterate;
v245.tickbase_data = v14(0, 16);
v245.alpha_pulsating = 1;
v245.load_image = function(v247)
    -- upvalues: v245 (ref)
    local v248 = files.get_crc32("nl\\bettervisuals\\warning_icon.png");
    if v247 or v248 == -1808745910 then
        v245.warning_icon = render.load_image_from_file("nl\\bettervisuals\\warning_icon.png", vector(20, 19));
    elseif v248 ~= -1808745910 then
        v245.downloaded_file_error = true;
    end;
end;
v245.load_image();
v245.download_image = function()
    -- upvalues: v245 (ref)
    if v245.downloaded_file_error then
        network.get("https://i.imgur.com/clHGGif.png", {}, function(v249)
            -- upvalues: v245 (ref)
            if v249 then
                files.create_folder("nl\\bettervisuals");
                files.write("nl\\bettervisuals\\warning_icon.png", v249, true);
                v245.load_image(true);
            end;
        end);
    end;
end;
v245.download_image();
v245.render = function()
    -- upvalues: v116 (ref), v245 (ref), l_lc_0 (ref)
    if not v116.item.netgraph_switch:get() then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        local v250 = utils.net_channel();
        local v251 = v250.loss[1];
        local v252 = v250.choke[1];
        local v253 = v250.data[1];
        local v254 = v250.data[0];
        local v255 = v252 > 0 and 1 or v251 > 0 and 2 or 0;
        local v256 = v250:get_server_info();
        local l_frame_time_0 = v256.frame_time;
        local l_deviation_0 = v256.deviation;
        local v259 = 1 / globals.tickinterval;
        local v260 = v245.cl_interp_ratio:float() * (1000 / v259);
        local v261 = v250.latency[0];
        local v262 = v250.latency[1];
        local v263 = math.max(0, (v262 - v261) * 1000);
        local v264 = v261 * 1000;
        local v265 = v250.avg_latency[0] * 1000;
        if v250.is_timing_out then
            local v266 = 3;
            v251 = 1;
            v255 = v266;
            v245.alpha_pulsating = v245.alpha_pulsating - globals.frametime;
            v245.alpha_pulsating = v245.alpha_pulsating < 0.05 and 0.05 or v245.alpha_pulsating;
        else
            v245.alpha_pulsating = v245.alpha_pulsating + globals.frametime * 2;
            v245.alpha_pulsating = v245.alpha_pulsating > 1 and 1 or v245.alpha_pulsating;
        end;
        local v267 = math.min(math.floor(math.sin(globals.realtime % 3 * 4) * 125 + 200), 255);
        local v268 = color(255, 255, 255, math.floor(v245.alpha_pulsating * 255));
        local v269 = v255 ~= 0 and color(255, 255, 255, 255) or color(255, 255, 255, math.floor(v267));
        local v270 = v255 ~= 0 and color(255, 50, 50, v267) or color(255, 200, 95, 255);
        local v271 = v260 / 1000 < 2 / v245.cl_updaterate:int() and color(255, 125, 95, math.floor(v245.alpha_pulsating * 255)) or color(255, 255, 255, math.floor(v245.alpha_pulsating * 255));
        local v272 = v265 < 100 and color(255, 125, 95, math.floor(v245.alpha_pulsating * 255)) or v265 < 40 and color(255, 255, 255, math.floor(v245.alpha_pulsating * 255)) or color(255, 60, 80, math.floor(v245.alpha_pulsating * 255));
        local v273 = render.screen_size().x / 2;
        local v274 = render.screen_size().y / 2 + v116.item.netgraph_height:get();
        local v275 = ({
            [0] = "clock syncing", 
            [1] = "packet choke", 
            [2] = "packet loss", 
            [3] = "lost connection"
        })[v255];
        local v276 = v263 > 1 and (": %dms"):format(v263) or "";
        local v277 = v255 ~= 0 and "+- " .. ("%.1f%% (%.1f%%)"):format(v251 * 100, v252 * 100) or "+- " .. ("%.1fms"):format(l_deviation_0 / 2);
        local v278 = ("in: %.2fk/s    "):format(v253 / 1024);
        local v279 = ("lerp: %.1fms"):format(v260);
        local v280 = ("out: %.2fk/s"):format(v254 / 1024);
        local v281 = ("sv: %.2f +- %.2fms    var: %.3f ms"):format(l_frame_time_0, l_deviation_0, l_deviation_0);
        local v282 = ("delay: %dms (+- %dms)    "):format(v265, math.abs(v265 - v264));
        local v283 = ("datagram%s"):format(v276);
        local v284 = render.measure_text(v245.font, "o", v275);
        local v285 = 1;
        local v286 = 30;
        local v287 = (not (v116.item.netgraph_combo:get() ~= "Verdana") or v116.item.netgraph_combo:get() == "Tahoma") and v245.font or v116.item.netgraph_combo:get() == "Default" and 1 or v116.item.netgraph_combo:get() == "Console" and 3;
        local v288 = v273 - v284.x - v286;
        left_y = v274;
        left_x = v288;
        render.text(v287, vector(left_x, left_y), v269, nil, v275);
        v288 = v273 + v284.x / 2;
        right_y = v274;
        right_x = v288;
        render.text(v287, vector(right_x - 3, right_y), color(255, 255, 255, 255), nil, v277);
        v288 = v273 - v284.x - v286;
        left_y = v274 + v285 * 20;
        left_x = v288;
        render.text(v287, vector(left_x, left_y), v268, nil, v278);
        v288 = render.measure_text(v287, "o", v278);
        render.text(v287, vector(left_x + v288.x, left_y), v271, nil, v279);
        v285 = v285 + 1;
        left_y = v274 + v285 * 20;
        render.text(v287, vector(left_x, left_y), v268, nil, v280);
        v285 = v285 + 1;
        left_y = v274 + v285 * 20;
        render.text(v287, vector(left_x, left_y), v268, nil, v281);
        left_y = v274 + (v285 + 1) * 20;
        render.text(v287, vector(left_x, left_y), v272, nil, v282);
        local v289 = render.measure_text(v287, "o", v282);
        render.text(v287, vector(left_x + v289.x, left_y), v268, nil, v283);
        if v245.warning_icon ~= nil then
            render.texture(v245.warning_icon, vector(v273 - 10, v274 - 8), vector(20, 19), v270);
        end;
        if v116.item.netgraph_lagcomp:get() then
            local v290 = l_lc_0();
            local v291 = ({
                [0] = "unsafe", 
                [1] = "broken", 
                [-1] = "unsafe"
            })[v290];
            local v292 = "lagcomp: ";
            local v293 = v290 > 0 and color(25, 255, 165, 255) or color(255, 0, 0, 255);
            local v294 = v273 - render.measure_text(v287, "o", v292 .. v291).x / 2;
            local v295 = v274 + 115 + v116.item.netgraph_lagcomp_height:get();
            render.text(v287, vector(v294, v295), color(255, 255, 255, 255), nil, v292);
            local v296 = render.measure_text(v287, "o", v292);
            render.text(v287, vector(v294 + v296.x, v295), v293, nil, v291);
        end;
        return;
    end;
end;
v116.item.netgraph_lagcomp:set_callback(function(v297)
    -- upvalues: v116 (ref)
    v116.item.netgraph_lagcomp_height:visibility(v297:get());
end, true);
local v298 = {
    hit_positions = {}, 
    hit_times = {}, 
    bullet_impact_positions = {}, 
    delta_times = {}, 
    x_hit = 0, 
    y_hit = 0, 
    hit_count = 0, 
    new_hit_count = 0, 
    bullet_impact_count = 0, 
    hit_flag = false
};
v298.add_hit = function(v299)
    -- upvalues: v298 (ref)
    table.insert(v298.hit_positions, v299);
    table.insert(v298.hit_times, globals.curtime);
    v298.hit_count = v298.hit_count + 1;
end;
v298.remove_hit = function(v300)
    -- upvalues: v298 (ref)
    table.remove(v298.hit_positions, v300);
    table.remove(v298.hit_times, v300);
    table.remove(v298.delta_times, v300);
    v298.new_hit_count = v298.new_hit_count - 1;
end;
v298.get_closest_impact = function(v301)
    -- upvalues: v298 (ref)
    local v302 = nil;
    local v303 = 11111111111;
    for v304 = 0, v298.bullet_impact_count do
        if v298.bullet_impact_positions[v304] ~= nil then
            local v305 = (v298.bullet_impact_positions[v304] - v301):length();
            if v305 < v303 then
                v303 = v305;
                v302 = v304;
            end;
        end;
    end;
    return v298.bullet_impact_positions[v302];
end;
events.bullet_impact:set(function(v306)
    -- upvalues: v116 (ref), v298 (ref)
    if not v116.item.hitmarker3d_switch:get() and not v116.item.hitmarker2d_switch:get() then
        return;
    else
        local v307 = entity.get(v306.userid, true);
        local v308 = entity.get_local_player();
        if v307 ~= nil and v307:get_name() == v308:get_name() then
            v298.hit_flag = true;
            local v309 = vector(v306.x, v306.y, v306.z);
            table.insert(v298.bullet_impact_positions, v309);
            v298.bullet_impact_count = v298.bullet_impact_count + 1;
        end;
        return;
    end;
end);
events.player_hurt:set(function(v310)
    -- upvalues: v116 (ref), v298 (ref)
    if not v116.item.hitmarker3d_switch:get() and not v116.item.hitmarker2d_switch:get() then
        return;
    else
        local v311 = entity.get(v310.userid, true);
        local v312 = entity.get(v310.attacker, true);
        local v313 = entity.get_local_player();
        if v312 ~= nil and v311 ~= nil and v312:get_name() == v313:get_name() and v311:is_enemy() then
            local l_hitgroup_0 = v310.hitgroup;
            if v298.hit_flag then
                v298.hit_flag = false;
                local v315 = v298.get_closest_impact(v311:get_hitbox_position(l_hitgroup_0));
                v298.add_hit(v315);
                v298.bullet_impact_positions = {};
                v298.bullet_impact_count = 0;
            end;
        end;
        return;
    end;
end);
v298.render = function()
    -- upvalues: v116 (ref), v298 (ref)
    local v316 = entity.get_local_player();
    if not v116.item.hitmarker3d_switch:get() and not v116.item.hitmarker2d_switch:get() or not v316 or not v316:is_alive() then
        v298.hit_positions = {};
        v298.hit_times = {};
        v298.bullet_impact_positions = {};
        v298.delta_times = {};
        v298.x_hit = 0;
        v298.y_hit = 0;
        v298.hit_count = 0;
        v298.new_hit_count = 0;
        v298.bullet_impact_count = 0;
        v298.hit_flag = false;
        return;
    else
        v298.new_hit_count = v298.hit_count;
        for v317 = 0, v298.hit_count do
            if v298.hit_times[v317] ~= nil and v298.hit_positions[v317] ~= nil then
                local v318 = globals.curtime - v298.hit_times[v317];
                if v116.item.hitmarker3d_fadetime:get() / 10 < v318 then
                    v298.remove_hit(v317);
                else
                    if v116.item.hitmarker3d_switch:get() then
                        local v319 = render.world_to_screen(v298.hit_positions[v317]) or vector(-150, -150);
                        local l_v298_0 = v298;
                        local l_v298_1 = v298;
                        local l_x_2 = v319.x;
                        l_v298_1.y_hit = v319.y;
                        l_v298_0.x_hit = l_x_2;
                        if v298.x_hit ~= nil and v298.y_hit ~= nil then
                            l_v298_0 = nil;
                            if v116.item.hitmarker3d_fadetime:get() / 10 / 2 < v318 then
                                l_v298_0 = (1 - (v318 - v298.delta_times[v317]) / v116.item.hitmarker3d_fadetime:get() * 10 * 2) * 255;
                                if l_v298_0 < 0 then
                                    l_v298_0 = 0;
                                end;
                            else
                                table.insert(v298.delta_times, v317, v318);
                                l_v298_0 = 255;
                            end;
                            if v116.item.hitmarker3d_combo:get() == "X" then
                                render.line(vector(v298.x_hit - v116.item.hitmarker3d_size:get(), v298.y_hit - v116.item.hitmarker3d_size:get()), vector(v298.x_hit - math.floor(v116.item.hitmarker3d_spacing:get() / 4), v298.y_hit - math.floor(v116.item.hitmarker3d_spacing:get() / 4)), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0));
                                render.line(vector(v298.x_hit - v116.item.hitmarker3d_size:get(), v298.y_hit + v116.item.hitmarker3d_size:get()), vector(v298.x_hit - math.floor(v116.item.hitmarker3d_spacing:get() / 4), v298.y_hit + math.floor(v116.item.hitmarker3d_spacing:get() / 4)), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0));
                                render.line(vector(v298.x_hit + v116.item.hitmarker3d_size:get(), v298.y_hit - v116.item.hitmarker3d_size:get()), vector(v298.x_hit + math.floor(v116.item.hitmarker3d_spacing:get() / 4), v298.y_hit - math.floor(v116.item.hitmarker3d_spacing:get() / 4)), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0));
                                render.line(vector(v298.x_hit + v116.item.hitmarker3d_size:get(), v298.y_hit + v116.item.hitmarker3d_size:get()), vector(v298.x_hit + math.floor(v116.item.hitmarker3d_spacing:get() / 4), v298.y_hit + math.floor(v116.item.hitmarker3d_spacing:get() / 4)), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0));
                            elseif v116.item.hitmarker3d_combo:get() == "+" then
                                render.rect(vector(v298.x_hit + v116.item.hitmarker3d_size:get(), v298.y_hit - v116.item.hitmarker3d_thickness:get() / 2), vector(v298.x_hit - v116.item.hitmarker3d_size:get(), v298.y_hit + v116.item.hitmarker3d_thickness:get() / 2), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0), 0, true);
                                render.rect(vector(v298.x_hit - v116.item.hitmarker3d_thickness:get() / 2, v298.y_hit + v116.item.hitmarker3d_size:get()), vector(v298.x_hit + v116.item.hitmarker3d_thickness:get() / 2, v298.y_hit - v116.item.hitmarker3d_size:get()), color(v116.item.hitmarker3d_color:get().r, v116.item.hitmarker3d_color:get().g, v116.item.hitmarker3d_color:get().b, l_v298_0), 0, true);
                            end;
                        end;
                    end;
                    if v298.x_hit ~= nil and v298.y_hit ~= nil and v116.item.hitmarker2d_switch:get() then
                        local v323 = nil;
                        if v116.item.hitmarker2d_fadetime:get() / 10 / 2 < v318 then
                            v323 = (1 - (v318 - v298.delta_times[v317]) / v116.item.hitmarker2d_fadetime:get() * 10 * 2) * 255;
                            if v323 < 0 then
                                v323 = 0;
                            end;
                        else
                            table.insert(v298.delta_times, v317, v318);
                            v323 = 255;
                        end;
                        local l_x_3 = render.screen_size().x;
                        local l_y_2 = render.screen_size().y;
                        l_x_3 = l_x_3 / 2;
                        l_y_2 = l_y_2 / 2;
                        render.line(vector(l_x_3 - v116.item.hitmarker2d_size:get(), l_y_2 - v116.item.hitmarker2d_size:get()), vector(l_x_3 - math.floor(v116.item.hitmarker2d_spacing:get() / 4), l_y_2 - math.floor(v116.item.hitmarker2d_spacing:get() / 4)), color(v116.item.hitmarker2d_color:get().r, v116.item.hitmarker2d_color:get().g, v116.item.hitmarker2d_color:get().b, v323));
                        render.line(vector(l_x_3 - v116.item.hitmarker2d_size:get(), l_y_2 + v116.item.hitmarker2d_size:get()), vector(l_x_3 - math.floor(v116.item.hitmarker2d_spacing:get() / 4), l_y_2 + math.floor(v116.item.hitmarker2d_spacing:get() / 4)), color(v116.item.hitmarker2d_color:get().r, v116.item.hitmarker2d_color:get().g, v116.item.hitmarker2d_color:get().b, v323));
                        render.line(vector(l_x_3 + v116.item.hitmarker2d_size:get(), l_y_2 - v116.item.hitmarker2d_size:get()), vector(l_x_3 + math.floor(v116.item.hitmarker2d_spacing:get() / 4), l_y_2 - math.floor(v116.item.hitmarker2d_spacing:get() / 4)), color(v116.item.hitmarker2d_color:get().r, v116.item.hitmarker2d_color:get().g, v116.item.hitmarker2d_color:get().b, v323));
                        render.line(vector(l_x_3 + v116.item.hitmarker2d_size:get(), l_y_2 + v116.item.hitmarker2d_size:get()), vector(l_x_3 + math.floor(v116.item.hitmarker2d_spacing:get() / 4), l_y_2 + math.floor(v116.item.hitmarker2d_spacing:get() / 4)), color(v116.item.hitmarker2d_color:get().r, v116.item.hitmarker2d_color:get().g, v116.item.hitmarker2d_color:get().b, v323));
                    end;
                end;
            end;
        end;
        v298.hit_count = v298.new_hit_count;
        return;
    end;
end;
v116.item.hitmarker3d_combo:set_callback(function()
    -- upvalues: v116 (ref)
    v116.item.hitmarker3d_spacing:visibility(v116.item.hitmarker3d_combo:get() ~= "+");
    v116.item.hitmarker3d_thickness:visibility(v116.item.hitmarker3d_combo:get() == "+");
end, true);
local v331 = {
    full_string = {}, 
    separated_string = {}, 
    hitgroups = {
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
    reverse = function(v326)
        local v327 = {};
        local v328 = #v326;
        for v329, v330 in ipairs(v326) do
            v327[v328 + 1 - v329] = v330;
        end;
        return v327;
    end
};
v331.multicolored_text = function(v332, v333, v334, v335, v336, v337)
    -- upvalues: v331 (ref)
    local v338 = {
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
    local v339 = {
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
    local v340 = v331.reverse(v337);
    local v341 = ("%s%s"):format(v335, v334);
    for v342, v343 in pairs(v340) do
        for v344 = 1, 9 do
            local v345 = v343[v344].text or "unknown";
            local l_x_4 = render.measure_text(v336, v341, v345).x;
            v338[v342] = v338[v342] + l_x_4;
        end;
    end;
    for v347, v348 in pairs(v340) do
        for v349 = 1, 9 do
            local v350 = v348[v349].text or "unknown";
            local v351 = v348[v349].clr or color(1, 1, 1, 1);
            local l_realtime_1 = v348.realtime;
            local v353 = render.measure_text(v336, v341, v350);
            local v354 = v332 - v338[v347] / 2 + v339[v347];
            local v355 = math.min((globals.realtime - l_realtime_1) * 1.2, 1);
            local v356 = math.max((globals.realtime - 4 - l_realtime_1) * 2.5, 0);
            local v357 = math.min((globals.realtime - 3 - l_realtime_1) * 90 + 250, 0);
            local v358 = math.max((globals.realtime - 3 - l_realtime_1) * 30, 0);
            render.text(v336, vector(v354 + v357 + v358, v333 + (v347 * v353.y + 1)), color(v351[1], v351[2], v351[3], (v355 - v356) * 255), nil, v350);
            v339[v347] = v339[v347] + v353.x;
        end;
    end;
end;
v331.manage_font = function()
    -- upvalues: v116 (ref), v331 (ref)
    if v116.item.hitlogs_font_combo:get() == "Verdana" or v116.item.hitlogs_font_combo:get() == "Tahoma" then
        local v359 = ("%s%s%s%s%s"):format(v116.item.hitlogs_font_flags:get(1) and "a" or "", v116.item.hitlogs_font_flags:get(2) and "b" or "", v116.item.hitlogs_font_flags:get(3) and "i" or "", v116.item.hitlogs_font_flags:get(4) and "o" or "", v116.item.hitlogs_font_flags:get(5) and "d" or "");
        v331.font = render.load_font(v116.item.hitlogs_font_combo:get(), v116.item.hitlogs_font_size:get(), v359);
    else
        v331.font = v116.item.hitlogs_font_combo:get() == "Default" and 1 or 3;
    end;
end;
v116.item.hitlogs_font_combo:set_callback(v331.manage_font);
v116.item.hitlogs_font_flags:set_callback(v331.manage_font);
v116.item.hitlogs_font_size:set_callback(v331.manage_font);
v331.manage_font();
v331.render = function()
    -- upvalues: v116 (ref), v331 (ref)
    if not v116.item.hitlogs_selectable:get(1) then
        return;
    elseif not entity.get_local_player() then
        return;
    elseif not entity.get_local_player():is_alive() then
        return;
    else
        if v331.separated_string ~= nil and #v331.separated_string > 0 then
            v331.multicolored_text(render.screen_size().x / 2, render.screen_size().y / 1.3 - v116.item.hitlogs_height:get(), v116.item.hitlogs_font_flags:get(4) and "o" or "", v116.item.hitlogs_font_flags:get(5) and "d" or "", v331.font, v331.separated_string);
            if #v331.separated_string > 5 then
                table.remove(v331.separated_string, 1);
            end;
            for _, v361 in pairs(v331.reverse(v331.separated_string)) do
                if v361.realtime + 5 < globals.realtime then
                    table.remove(v331.separated_string, 1);
                end;
            end;
        end;
        return;
    end;
end;
v331.main = function(v362)
    -- upvalues: v116 (ref), v331 (ref)
    if not v116.item.hitlogs_selectable:get(1) and not v116.item.hitlogs_selectable:get(2) then
        return;
    else
        local l_target_0 = v362.target;
        if not l_target_0 then
            return;
        else
            local v364 = l_target_0:get_name();
            local v365 = v331.hitgroups[v362.hitgroup];
            local v366 = v331.hitgroups[v362.wanted_hitgroup];
            local l_state_0 = v362.state;
            local l_damage_0 = v362.damage;
            local l_hitchance_0 = v362.hitchance;
            local l_m_iHealth_0 = l_target_0.m_iHealth;
            local v371, v372, v373 = v116.item.hitlogs_hit_color:get():unpack();
            local v374, v375, v376 = v116.item.hitlogs_miss_color:get():unpack();
            if l_state_0 == nil then
                v331.full_string = ("Hit %s in the %s for %s damage (%s health remaining)"):format(v364, v365, l_damage_0, l_m_iHealth_0);
                table.insert(v331.separated_string, #v331.separated_string + 1, {
                    [1] = {
                        text = "Hit ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [2] = {
                        text = v364, 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v371, 
                            [2] = v372, 
                            [3] = v373
                        }
                    }, 
                    [3] = {
                        text = " in the ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [4] = {
                        text = v365, 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v371, 
                            [2] = v372, 
                            [3] = v373
                        }
                    }, 
                    [5] = {
                        text = " for ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [6] = {
                        text = tostring(l_damage_0), 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v371, 
                            [2] = v372, 
                            [3] = v373
                        }
                    }, 
                    [7] = {
                        text = " damage (", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [8] = {
                        text = tostring(l_m_iHealth_0), 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v371, 
                            [2] = v372, 
                            [3] = v373
                        }
                    }, 
                    [9] = {
                        text = " health remaining)", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    realtime = globals.realtime
                });
            else
                v331.full_string = ("Missed %s's %s due to %s (%s %%HC)"):format(v364, v366, l_state_0, l_hitchance_0);
                table.insert(v331.separated_string, #v331.separated_string + 1, {
                    [1] = {
                        text = "Missed ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [2] = {
                        text = v364, 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v374, 
                            [2] = v375, 
                            [3] = v376
                        }
                    }, 
                    [3] = {
                        text = "'s ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [4] = {
                        text = v366, 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v374, 
                            [2] = v375, 
                            [3] = v376
                        }
                    }, 
                    [5] = {
                        text = " due to ", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [6] = {
                        text = l_state_0, 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v374, 
                            [2] = v375, 
                            [3] = v376
                        }
                    }, 
                    [7] = {
                        text = " (", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [8] = {
                        text = tostring(l_hitchance_0), 
                        clr = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v374, 
                            [2] = v375, 
                            [3] = v376
                        }
                    }, 
                    [9] = {
                        text = "% HC)", 
                        clr = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    realtime = globals.realtime
                });
            end;
            if v116.item.hitlogs_selectable:get(2) then
                local v377 = ("\a%s"):format(color(255, 255, 255):to_hex());
                if l_state_0 == nil then
                    local v378 = ("\a%s"):format(v116.item.hitlogs_hit_color:get():to_hex());
                    print_raw(("%s[%s] %sHit %s%s %sin the %s%s %sfor %s%s %sdamage (%s%s %shealth remaining)"):format(v378, v116.item.hitlogs_name:get(), v377, v378, v364, v377, v378, v365, v377, v378, l_damage_0, v377, v378, l_m_iHealth_0, v377));
                else
                    local v379 = ("\a%s"):format(v116.item.hitlogs_miss_color:get():to_hex());
                    print_raw(("%s[%s] %sMissed %s%s%s's %s%s %sdue to %s%s %s(%s%s%s%% HC)"):format(v379, v116.item.hitlogs_name:get(), v377, v379, v364, v377, v379, v366, v377, v379, l_state_0, v377, v379, l_hitchance_0, v377));
                end;
            end;
            return;
        end;
    end;
end;
v331.ui = function()
    -- upvalues: v116 (ref)
    v116.item.hitlogs_name:visibility(v116.item.hitlogs_selectable:get(2));
    v116.item.hitlogs_height:visibility(v116.item.hitlogs_selectable:get(1));
    v116.item.hitlogs_font_combo:visibility(v116.item.hitlogs_selectable:get(1));
    v116.item.hitlogs_font_size:visibility(v116.item.hitlogs_selectable:get(1) and v116.item.hitlogs_font_combo:get() ~= "Default" and v116.item.hitlogs_font_combo:get() ~= "Console");
    v116.item.hitlogs_font_flags:visibility(v116.item.hitlogs_selectable:get(1) and v116.item.hitlogs_font_combo:get() ~= "Default" and v116.item.hitlogs_font_combo:get() ~= "Console");
    v116.item.hitlogs_hit_color:visibility(v116.item.hitlogs_selectable:get(1) or v116.item.hitlogs_selectable:get(2));
    v116.item.hitlogs_miss_color:visibility(v116.item.hitlogs_selectable:get(1) or v116.item.hitlogs_selectable:get(2));
end;
v116.item.hitlogs_selectable:set_callback(v331.ui, true);
v116.item.hitlogs_font_combo:set_callback(v331.ui, true);
local v380 = {
    count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    }
};
events.player_death:set(function(v381)
    -- upvalues: v116 (ref), v380 (ref)
    if not v116.item.killsound_switch:get() then
        return;
    else
        local v382 = entity.get_local_player();
        if not v382 then
            return;
        elseif not v382:is_alive() then
            return;
        else
            local v383 = entity.get(v381.userid, true);
            local v384 = entity.get(v381.attacker, true);
            local l_weapon_1 = v381.weapon;
            local l_headshot_1 = v381.headshot;
            local l_penetrated_0 = v381.penetrated;
            if v384 ~= v382 or v383 == v382 or v383 == v384 then
                return;
            else
                local v388 = false;
                if l_weapon_1:match("knife_") or l_weapon_1:match("bayonet") then
                    v388 = true;
                end;
                v380.count.default = v380.count.default + 1;
                v380.count.priority = 5;
                if v116.item.killsound_selectable:get(10) and (l_weapon_1 == "inferno" or l_weapon_1 == "hegrenade") then
                    v380.count.grenade = v380.count.grenade + 1;
                    v380.count.priority = 1;
                end;
                if v116.item.killsound_selectable:get(9) and v388 then
                    v380.count.knife = v380.count.knife + 1;
                    v380.count.priority = 2;
                end;
                if not v388 and l_weapon_1 ~= "inferno" and l_weapon_1 ~= "hegrenade" then
                    if l_headshot_1 and not l_penetrated_0 then
                        if v116.item.killsound_selectable:get(7) then
                            v380.count.headshot = v380.count.headshot + 1;
                            v380.count.priority = 3;
                        end;
                    elseif l_headshot_1 and l_penetrated_0 then
                        if v116.item.killsound_selectable:get(8) then
                            v380.count.wallbang = v380.count.wallbang + 1;
                            v380.count.priority = 4;
                        elseif v116.item.killsound_selectable:get(7) then
                            v380.count.headshot = v380.count.headshot + 1;
                            v380.count.priority = 3;
                        end;
                    end;
                end;
                local v389 = v116.item.killsound_volume:get() / 100;
                if v116.item.killsound_selectable:get(1) and v380.count.default == 1 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_first_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(2) and v380.count.default == 2 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_second_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(3) and v380.count.default == 3 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_third_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(4) and v380.count.default == 4 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_fourth_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(5) and v380.count.default == 5 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_fifth_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(6) and v380.count.default >= 6 and v380.count.priority == 5 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_sixth_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(7) and v380.count.headshot >= 1 and v380.count.priority == 3 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_headshot_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(8) and v380.count.wallbang >= 1 and v380.count.priority == 4 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_wallbang_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(9) and v380.count.knife >= 1 and v380.count.priority == 2 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_knife_kill:get(), v389));
                    end;
                end;
                if v116.item.killsound_selectable:get(10) and v380.count.grenade >= 1 and v380.count.priority == 1 then
                    for _ = 1, 2 do
                        utils.console_exec(("playvol %s %s"):format(v116.item.killsound_grenade_kill:get(), v389));
                    end;
                end;
                return;
            end;
        end;
    end;
end);
v116.item.killsound_selectable:set_callback(function(v400)
    -- upvalues: v116 (ref)
    v116.item.killsound_first_kill:visibility(v400:get(1));
    v116.item.killsound_second_kill:visibility(v400:get(2));
    v116.item.killsound_third_kill:visibility(v400:get(3));
    v116.item.killsound_fourth_kill:visibility(v400:get(4));
    v116.item.killsound_fifth_kill:visibility(v400:get(5));
    v116.item.killsound_sixth_kill:visibility(v400:get(6));
    v116.item.killsound_headshot_kill:visibility(v400:get(7));
    v116.item.killsound_wallbang_kill:visibility(v400:get(8));
    v116.item.killsound_knife_kill:visibility(v400:get(9));
    v116.item.killsound_grenade_kill:visibility(v400:get(10));
end, true);
local v401 = {
    cvar = cvar["@panorama_disable_blur"], 
    stored_cvar = cvar["@panorama_disable_blur"]:int()
};
v116.item.panorama_blur_switch:set_callback(function(v402)
    -- upvalues: v401 (ref)
    if v402:get() then
        v401.cvar:int(1);
    else
        v401.cvar:int(0);
    end;
end, true);
local function v403()
    -- upvalues: v116 (ref)
    if not v116.item.blur_switch:get() or ui.get_alpha() == 0 then
        return;
    else
        render.blur(vector(0, 0), render.screen_size(), v116.item.blur_strength:get() / 10, ui.get_alpha());
        return;
    end;
end;
events.player_death:set(function(v404)
    -- upvalues: v116 (ref)
    if not v116.item.healthshot_switch:get() then
        return;
    else
        local v405 = entity.get_local_player();
        if v405 == entity.get(v404.attacker, true) then
            v405.m_flHealthShotBoostExpirationTime = globals.curtime + v116.item.healthshot_duration:get() / 10;
        end;
        return;
    end;
end);
local v414 = {
    render = function()
        -- upvalues: v116 (ref)
        if not v116.item.gs_menu_border_switch:get() or ui.get_alpha() == 0 then
            return;
        else
            local v406 = ui.get_alpha();
            local v407 = ui.get_size();
            local v408 = ui.get_position();
            local v409 = vector(v408.x + v407.x, v408.y + v407.y);
            render.rect(vector(v408.x - 7, v408.y - 9), vector(v409.x + 7, v409.y + 7), color(12, 12, 12, v406 * 255));
            render.rect(vector(v408.x - 6, v408.y - 8), vector(v409.x + 6, v409.y + 6), color(60, 60, 60, v406 * 255));
            render.rect(vector(v408.x - 5, v408.y - 7), vector(v409.x + 5, v409.y + 5), color(40, 40, 40, v406 * 255));
            render.rect(vector(v408.x - 2, v408.y - 4), vector(v409.x + 2, v409.y + 2), color(60, 60, 60, v406 * 255));
            render.rect(vector(v408.x - 1, v408.y - 3), vector(v409.x + 1, v409.y + 1), color(12, 12, 12, v406 * 255));
            render.rect(vector(v408.x, v408.y), vector(v409.x, v409.y), color(12, 12, 12, v406 * 255));
            if v116.item.gs_menu_border_color_schemes:get() == "Gradient" then
                local v410 = color():as_hsv(globals.realtime / 10 * v116.item.gs_menu_border_animation:get(), v116.item.gs_menu_border_saturation:get() * 0.001, v116.item.gs_menu_border_brightness:get() * 0.001);
                local v411 = color(v410.b, v410.r, v410.g, v406 * 255);
                local v412 = color(v410.r, v410.g, v410.b, v406 * 255);
                local v413 = color(v410.g, v410.b, v410.r, v406 * 255);
                render.gradient(vector(v408.x + v407.x / 2, v408.y - 2), vector(v408.x + v407.x, v408.y - 1), v413, v411, v413, v411);
                render.gradient(vector(v408.x, v408.y - 2), vector(v408.x + v407.x / 2, v408.y - 1), v412, v413, v412, v413);
            else
                render.gradient(vector(v408.x + v407.x, v408.y), vector(v408.x + v407.x / 2, v408.y + v407.y - v407.y - 2), color(v116.item.gs_menu_border_third_color:get().r, v116.item.gs_menu_border_third_color:get().g, v116.item.gs_menu_border_third_color:get().b, v406 * 255), color(v116.item.gs_menu_border_second_color:get().r, v116.item.gs_menu_border_second_color:get().g, v116.item.gs_menu_border_second_color:get().b, v406 * 255), color(v116.item.gs_menu_border_third_color:get().r, v116.item.gs_menu_border_third_color:get().g, v116.item.gs_menu_border_third_color:get().b, v406 * 255), color(v116.item.gs_menu_border_second_color:get().r, v116.item.gs_menu_border_second_color:get().g, v116.item.gs_menu_border_second_color:get().b, v406 * 255));
                render.gradient(vector(v408.x, v408.y), vector(v408.x + v407.x / 2, v408.y + v407.y - v407.y - 2), color(v116.item.gs_menu_border_first_color:get().r, v116.item.gs_menu_border_first_color:get().g, v116.item.gs_menu_border_first_color:get().b, v406 * 255), color(v116.item.gs_menu_border_second_color:get().r, v116.item.gs_menu_border_second_color:get().g, v116.item.gs_menu_border_second_color:get().b, v406 * 255), color(v116.item.gs_menu_border_first_color:get().r, v116.item.gs_menu_border_first_color:get().g, v116.item.gs_menu_border_first_color:get().b, v406 * 255), color(v116.item.gs_menu_border_second_color:get().r, v116.item.gs_menu_border_second_color:get().g, v116.item.gs_menu_border_second_color:get().b, v406 * 255));
                render.gradient(vector(v408.x, v408.y), vector(v408.x + v407.x, v408.y + v407.y - v407.y - 1), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)));
                render.gradient(vector(v408.x, v408.y), vector(v408.x + v407.x, v408.y + v407.y - v407.y - 1), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)), color(0, 0, 0, 50 * (v406 * 255)));
            end;
            return;
        end;
    end
};
v116.item.gs_menu_border_color_schemes:set_callback(function(v415)
    -- upvalues: v116 (ref)
    v116.item.gs_menu_border_animation:visibility(v415:get() == "Gradient");
    v116.item.gs_menu_border_saturation:visibility(v415:get() == "Gradient");
    v116.item.gs_menu_border_brightness:visibility(v415:get() == "Gradient");
    v116.item.gs_menu_border_first_color:visibility(v415:get() == "Fade");
    v116.item.gs_menu_border_second_color:visibility(v415:get() == "Fade");
    v116.item.gs_menu_border_third_color:visibility(v415:get() == "Fade");
end, true);
local v416 = {
    cvar_game_mode = cvar.game_mode, 
    cvar_game_type = cvar.game_type, 
    cvar_fps_max = cvar.fps_max, 
    cvar_fps_max_menu = cvar.fps_max_menu
};
v416.window = (function()
    -- upvalues: v416 (ref)
    local v417 = {};
    local l_floor_0 = math.floor;
    local l_ceil_0 = math.ceil;
    local function v428(v420, v421, v422, v423, v424, v425, v426, v427)
        render.rect(vector(v420, v421), vector(v420 + v422, v421 + v423), color(v424, v425, v426, v427));
    end;
    local function v442(v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441)
        render.gradient(vector(v429, v430), vector(v429 + v431, v430 + v432), color(v433, v434, v435, v436), color(v437, v438, v439, v440), color(v433, v434, v435, v436), color(v437, v438, v439, v440), v441);
    end;
    local function v453(v443, v444, v445, v446, v447, v448, v449, v450, v451, v452)
        render.texture(v443, vector(v444, v445), vector(v446, v447), color(v448, v449, v450, v451), v452);
    end;
    local function v461(v454, v455, v456, v457, v458, v459, v460)
        render.line(vector(v454, v455), vector(v456, v457), v460);
        render.line(vector(v456, v457), vector(v458, v459), v460);
        render.line(vector(v458, v459), vector(v454, v455), v460);
    end;
    local function v471(v462, v463, v464, v465, v466, v467, v468, v469, v470)
        -- upvalues: v428 (ref)
        if not v470 then
            v470 = 1;
        end;
        v428(v462, v463, v464, v470, v466, v467, v468, v469);
        v428(v462, v463 + v465 - v470, v464, v470, v466, v467, v468, v469);
        v428(v462, v463 + v470, v470, v465 - v470 * 2, v466, v467, v468, v469);
        v428(v462 + v464 - v470, v463 + v470, v470, v465 - v470 * 2, v466, v467, v468, v469);
    end;
    local function _(v472, v473, v474, v475, v476, v477, v478, v479, v480, v481, v482, v483, v484, v485)
        -- upvalues: v428 (ref), v442 (ref)
        if not v485 then
            v485 = 1;
        end;
        if v484 then
            v428(v472, v473, v485, v475, v476, v477, v478, v479);
            v428(v472 + v474 - v485, v473, v485, v475, v480, v481, v482, v483);
            v442(v472 + v485, v473, v474 - v485 * 2, v485, v476, v477, v478, v479, v480, v481, v482, v479, true);
            v442(v472 + v485, v473 + v475 - v485, v474 - v485 * 2, v485, v476, v477, v478, v479, v480, v481, v482, v479, true);
        else
            v428(v472, v473, v474, v485, v476, v477, v478, v479);
            v428(v472, v473 + v475 - v485, v474, v485, v480, v481, v482, v483);
            v442(v472, v473 + v485, v485, v475 - v485 * 2, v476, v477, v478, v479, v480, v481, v482, v483, false);
            v442(v472 + v474 - v485, v473 + v485, v485, v475 - v485 * 2, v476, v477, v478, v479, v480, v481, v482, v483, false);
        end;
    end;
    local v487 = nil;
    local v488 = "\020\020\020\255";
    local v489 = "\f\f\f\255";
    v487 = render.load_image_rgba(table.concat({
        [1] = v488, 
        [2] = v488, 
        [3] = v488, 
        [4] = v489, 
        [5] = v488, 
        [6] = v489, 
        [7] = v488, 
        [8] = v489, 
        [9] = v488, 
        [10] = v489, 
        [11] = v488, 
        [12] = v488, 
        [13] = v488, 
        [14] = v489, 
        [15] = v488, 
        [16] = v489
    }), vector(4, 4));
    v488 = function(v490, v491)
        if v491 ~= nil and type(v490) == "string" and v490:sub(-1, -1) == "%" then
            v490 = math.floor(tonumber(v490:sub(1, -2)) / 100 * v491);
        end;
        return v490;
    end;
    v489 = function(v492)
        -- upvalues: v488 (ref), v471 (ref), v442 (ref), v428 (ref), l_floor_0 (ref), l_ceil_0 (ref), v453 (ref), v487 (ref), v461 (ref)
        if v492.position == "fixed" then
            local l_x_5 = render.screen_size().x;
            local l_y_3 = render.screen_size().y;
            if v492.left ~= nil then
                v492.x = v488(v492.left, l_x_5);
            elseif v492.right ~= nil then
                v492.x = l_x_5 - (v492.w or 0) - v488(v492.right, l_x_5);
            end;
            if v492.top ~= nil then
                v492.y = v488(v492.top, l_y_3);
            elseif v492.bottom ~= nil then
                v492.y = l_y_3 - (v492.h or 0) - v488(v492.bottom, l_y_3);
            end;
        end;
        local l_x_6 = v492.x;
        local l_y_4 = v492.y;
        local l_w_0 = v492.w;
        local l_h_0 = v492.h;
        local v499 = v492.a or 255;
        local v500 = 1;
        if l_x_6 == nil or l_y_4 == nil or l_w_0 == nil or v499 == nil then
            return;
        else
            local l_x_7 = v492.x;
            local l_y_5 = v492.y;
            local l_w_1 = v492.w;
            v492.i_h = v492.h;
            v492.i_w = l_w_1;
            v492.i_y = l_y_5;
            v492.i_x = l_x_7;
            if v492.title_bar then
                v500 = (v492.title ~= nil and select(2, render.measure_text(1, v492.title_text_size, v492.title).y) or 13) + 2;
                l_x_7 = v492.x;
                l_y_5 = v492.y;
                l_w_1 = v492.w;
                v492.t_h = v500;
                v492.t_w = l_w_1;
                v492.t_y = l_y_5;
                v492.t_x = l_x_7;
            end;
            if v492.border then
                v471(l_x_6, l_y_4, l_w_0, l_h_0, 18, 18, 18, v499);
                v471(l_x_6 + 1, l_y_4 + 1, l_w_0 - 2, l_h_0 - 2, 62, 62, 62, v499);
                v471(l_x_6 + 2, l_y_4 + v500 + 1, l_w_0 - 4, l_h_0 - v500 - 3, 44, 44, 44, v499, v492.border_width);
                v471(l_x_6 + v492.border_width + 2, l_y_4 + v500 + v492.border_width + 1, l_w_0 - v492.border_width * 2 - 4, l_h_0 - v500 - v492.border_width * 2 - 3, 62, 62, 62, v499);
                v492.i_x = v492.i_x + v492.border_width + 3;
                v492.i_y = v492.i_y + v492.border_width + 3;
                v492.i_w = v492.i_w - (v492.border_width + 3) * 2;
                v492.i_h = v492.i_h - (v492.border_width + 3) * 2;
                l_x_7 = v492.x + 2;
                l_y_5 = v492.y + 2;
                v492.t_w = v492.w - 4;
                v492.t_y = l_y_5;
                v492.t_x = l_x_7;
                v500 = v500 - 1;
            end;
            if v500 > 1 then
                v442(v492.t_x, v492.t_y, v492.t_w, v500, 56, 56, 56, v499, 44, 44, 44, v499, false);
                if v492.title ~= nil then
                    local v504;
                    l_x_7, l_y_5, l_w_1, v504 = unpack(v492.title_text_color);
                    v504 = v504 * v492.a / 255;
                    render.text(1, vector(v492.t_x + 3, v492.t_y + 2), color(l_x_7 or 255, l_y_5 or 255, l_w_1 or 255, v504 or 255), (v492.title_text_size or "") .. (v492.title_text_flags or ""), tostring(v492.title));
                end;
                v492.i_y = v492.i_y + v500;
                v492.i_h = v492.i_h - v500;
            end;
            if v492.gradient_bar then
                l_x_7 = 0;
                if v492.background then
                    l_x_7 = 1;
                    l_y_5 = 16;
                    l_w_1 = 25;
                    v428(v492.i_x + 1, v492.i_y, v492.i_w - 2, 1, l_y_5, l_y_5, l_y_5, v499);
                    v428(v492.i_x + 1, v492.i_y + 3, v492.i_w - 2, 1, l_w_1, l_w_1, l_w_1, v499);
                    for v505 = 0, 1 do
                        v442(v492.i_x + (v492.i_w - 1) * v505, v492.i_y, 1, 4, l_y_5, l_y_5, l_y_5, v499, l_w_1, l_w_1, l_w_1, v499, false);
                    end;
                end;
                l_y_5 = v492.i_x + l_x_7;
                l_w_1 = v492.i_y + l_x_7;
                local v506 = 1;
                local v507 = l_floor_0((v492.i_w - l_x_7 * 2) / 2);
                local v508 = l_ceil_0((v492.i_w - l_x_7 * 2) / 2);
                for _ = 1, 2 do
                    v442(l_y_5, l_w_1, v507, 1, 59 * v506, 175 * v506, 222 * v506, v499, 202 * v506, 70 * v506, 205 * v506, v499, true);
                    v442(l_y_5 + v507, l_w_1, v508, 1, 202 * v506, 70 * v506, 205 * v506, v499, 201 * v506, 227 * v506, 58 * v506, v499, true);
                    local v510 = l_w_1 + 1;
                    v506 = v506 * 0.5;
                    l_w_1 = v510;
                end;
                v492.i_y = v492.i_y + 2 + l_x_7 * 2;
                v492.i_h = v492.i_h - 2 - l_x_7 * 2;
            end;
            if v492.background then
                v453(v487, v492.i_x, v492.i_y, v492.i_w, v492.i_h, 255, 255, 255, 255, "r");
            end;
            if v492.draggable then
                l_x_7 = 7;
                v461(l_x_6 + l_w_0 - 1, l_y_4 + l_h_0 - l_x_7, l_x_6 + l_w_0 - 1, l_y_4 + l_h_0 - 1, l_x_6 + l_w_0 - l_x_7, l_y_4 + l_h_0 - 1, color(62, 62, 62, v499));
            end;
            v492.i_x = v492.i_x + v492.margin_left;
            v492.i_w = v492.i_w - v492.margin_left - v492.margin_right;
            v492.i_y = v492.i_y + v492.margin_top;
            v492.i_h = v492.i_h - v492.margin_top - v492.margin_bottom;
            return;
        end;
    end;
    local v511 = {};
    local v512 = {};
    local v513 = {};
    local v514 = {
        __index = v513
    };
    v513.set_active = function(v515, v516)
        -- upvalues: v511 (ref), v512 (ref)
        if v516 then
            v511[v515.id] = v515;
            table.insert(v512, 1, v515.id);
        else
            v511[v515.id] = nil;
        end;
    end;
    v513.set_z_index = function(v517, v518)
        v517.z_index = v518;
        v517.z_index_reset = true;
    end;
    v513.is_in_window = function(v519, v520, v521)
        return v519.x <= v520 and v520 <= v519.x + v519.w and v519.y <= v521 and v521 <= v519.y + v519.h;
    end;
    v513.set_inner_width = function(v522, v523)
        if v522.border then
            v523 = v523 + (v522.border_width + 3) * 2;
        end;
        v522.w = v523 + v522.margin_left + v522.margin_right;
    end;
    v513.set_inner_height = function(v524, v525)
        local v526 = 1;
        if v524.title_bar then
            v526 = (v524.title ~= nil and select(2, render.measure_text(1, v524.title_text_size, v524.title).y) or 13) + 2;
        end;
        if v524.border then
            v525 = v525 + (v524.border_width + 3) * 2;
            v526 = v526 - 1;
        end;
        if v526 > 1 then
            v525 = v525 + v526;
        end;
        if v524.gradient_bar then
            local v527 = 0;
            if v524.background then
                v527 = 1;
            end;
            v525 = v525 + 2 + v527 * 2;
        end;
        v524.h = v525 + v524.margin_top + v524.margin_bottom;
    end;
    v417.new = function(v528, v529, v530, v531, v532, v533)
        -- upvalues: v514 (ref)
        local v534 = setmetatable({
            draggable_save = false, 
            visible = true, 
            first = true, 
            border = true, 
            border_width = 2, 
            title_bar_in_menu = false, 
            gradient_bar = true, 
            margin_top = 0, 
            margin_bottom = 2, 
            position = "fixed", 
            title_bar = true, 
            in_menu = true, 
            a = 255, 
            margin_right = 3, 
            margin_left = 3, 
            draggable = false, 
            background = true, 
            id = v528, 
            top = v529, 
            left = v530, 
            w = v531, 
            h = v532, 
            paint_callback = v533, 
            title_text_color = {
                [1] = 255, 
                [2] = 255, 
                [3] = 255, 
                [4] = 255
            }
        }, v514);
        v534:set_active(true);
        return v534;
    end;
    local v535 = nil;
    local v536 = nil;
    local v537 = nil;
    v416.callback = function(v538)
        -- upvalues: v512 (ref), v511 (ref), v535 (ref), v536 (ref), v537 (ref), v489 (ref)
        local v539 = {
            [1] = "bottom", 
            [2] = "unset", 
            [3] = "top"
        };
        local v540 = {};
        for v541 = #v512, 1, -1 do
            local v542 = v511[v512[v541]];
            if v542 ~= nil then
                local v543 = v542.z_index or "unset";
                if v542.z_index_reset then
                    v542.z_index = nil;
                    v542.z_index_reset = nil;
                end;
                v540[v543] = v540[v543] or {};
                if v542.first then
                    table.insert(v540[v543], 1, v542.id);
                    v542.first = nil;
                else
                    table.insert(v540[v543], v542.id);
                end;
            end;
        end;
        v512 = {};
        for v544 = 1, #v539 do
            local v545 = v540[v539[v544]];
            if v545 ~= nil then
                for v546 = #v545, 1, -1 do
                    table.insert(v512, v545[v546]);
                end;
            end;
        end;
        local v547 = ui.get_alpha() > 0;
        local v548 = {};
        for v549 = 1, #v512 do
            local v550 = v511[v512[v549]];
            if v550 ~= nil and v550.in_menu == v538 then
                if v550.title_bar_in_menu then
                    v550.title_bar = v547;
                end;
                if v550.pre_paint_callback ~= nil then
                    v550:pre_paint_callback();
                end;
                if v511[v550.id] ~= nil then
                    table.insert(v548, v511[v550.id]);
                end;
            end;
        end;
        if v547 then
            local l_x_8 = ui.get_mouse_position().x;
            local l_y_6 = ui.get_mouse_position().y;
            local v553 = common.is_button_down(1);
            if v553 then
                for v554 = #v548, 1, -1 do
                    local v555 = v548[v554];
                    if v555.visible and v555:is_in_window(v535, v536) then
                        v555.first = true;
                        if v537 then
                            local v556 = l_x_8 - v535;
                            local v557 = l_y_6 - v536;
                            if v555.position == "fixed" then
                                local v558 = v555.left == nil and "right" or "left";
                                local v559 = v555.top == nil and "bottom" or "top";
                                local v560 = {
                                    [1] = {
                                        [1] = v558, 
                                        [2] = (v558 == "right" and -1 or 1) * v556
                                    }, 
                                    [2] = {
                                        [1] = v559, 
                                        [2] = (v559 == "bottom" and -1 or 1) * v557
                                    }
                                };
                                for v561 = 1, #v560 do
                                    local v562, v563 = unpack(v560[v561]);
                                    local v564 = type(v555[v562]);
                                    if (v564 ~= "string" or v555[v562]:sub(-1, -1) ~= "%") and v564 == "number" then
                                        v555[v562] = v555[v562] + v563;
                                    end;
                                end;
                                break;
                            else
                                v555.x = v555.x + v556;
                                v555.y = v555.y + v557;
                                break;
                            end;
                        else
                            break;
                        end;
                    end;
                end;
            end;
            local l_l_x_8_0 = l_x_8;
            v536 = l_y_6;
            v535 = l_l_x_8_0;
            v537 = v553;
        end;
        for v566 = 1, #v548 do
            local v567 = v548[v566];
            if v567.visible and v567.in_menu == v538 then
                v489(v567);
                if v567.paint_callback ~= nil then
                    v567:paint_callback();
                end;
            end;
        end;
    end;
    local _ = nil;
    local _ = nil;
    local _ = nil;
    return v417;
end)().new("watermark");
v116.item.saved_top:visibility(false);
v116.item.saved_right:visibility(false);
v416.window.top = v116.item.saved_top:get();
v416.window.right = v116.item.saved_right:get();
v416.fps_prev = 0;
v416.value_prev = {};
local v571 = "offset_x";
local v572 = "offset_y";
local v573 = -15;
v416[v572] = 15;
v416[v571] = v573;
v416.get_fps = function()
    -- upvalues: v416 (ref)
    v416.fps_prev = v416.fps_prev * 0.9 + globals.absoluteframetime * 0.1;
    return math.floor(1 / v416.fps_prev);
end;
v416.client_latency = function()
    local v574 = utils.net_channel();
    local v575 = v574 and v574.latency[0] * 1000 or 0;
    return math.floor(v575);
end;
v416.items = {
    [1] = {
        name = "Logo", 
        get_width = function(v576, _)
            -- upvalues: v116 (ref)
            local v578 = v116.item.gs_watermark_logo_name:get();
            local v579 = v116.item.gs_watermark_logo_name_accent:get();
            local v580 = v116.item.logo_suffix:get();
            v576.logo_width = render.measure_text(1, nil, v578).x;
            v576.logo_accent_width = render.measure_text(1, nil, v579).x;
            v576.beta_width = v116.item.gs_watermark_optionals:get(1) and render.measure_text(1, nil, " " .. v580).x or 0;
            return v576.logo_width + v576.logo_accent_width + v576.beta_width;
        end, 
        draw = function(v581, v582, v583, _, _, _, _, _, v589)
            -- upvalues: v116 (ref)
            local l_r_0 = v116.item.gs_watermark_color:get().r;
            local l_g_0 = v116.item.gs_watermark_color:get().g;
            local l_b_0 = v116.item.gs_watermark_color:get().b;
            local v593 = v116.item.gs_watermark_logo_name:get();
            local v594 = v116.item.gs_watermark_logo_name_accent:get();
            local v595 = v116.item.logo_suffix:get();
            render.text(1, vector(v582, v583), color(255, 255, 255, v589), nil, v593);
            render.text(1, vector(v582 + v581.logo_width, v583), color(l_r_0, l_g_0, l_b_0, v589), nil, v594);
            if v116.item.gs_watermark_optionals:get(1) then
                render.text(1, vector(v582 + v581.logo_width + v581.logo_accent_width, v583), color(255, 255, 255, v589 * 0.9), nil, " " .. v595);
            end;
        end
    }, 
    [2] = {
        name = "Username", 
        get_width = function(v596, _)
            -- upvalues: v116 (ref)
            local v598 = v116.item.gs_watermark_custom_name:get();
            if v598 ~= nil and v598:gsub(" ", "") ~= "" then
                v596.text = v598;
                return render.measure_text(1, nil, v598).x;
            else
                v596.text = nil;
                return;
            end;
        end, 
        draw = function(v599, v600, v601, _, _, v604, v605, v606, v607)
            render.text(1, vector(v600, v601), color(v604, v605, v606, v607), nil, v599.text);
        end
    }, 
    [3] = {
        name = "FPS", 
        get_width = function(v608, _)
            -- upvalues: v416 (ref)
            v608.fps = v416.get_fps();
            v608.text = tostring(v608.fps or 0) .. " fps";
            local v610 = v416.cvar_fps_max:float();
            local v611 = v416.cvar_fps_max_menu:float();
            local v612 = common.get_map_data() == nil and math.min(v610 == 0 and 999 or v610, v611 == 0 and 999 or v610) or v610 == 0 and 999 or v610;
            v608.width = math.max(render.measure_text(1, nil, v608.text).x, render.measure_text(1, nil, v612 .. " fps").x);
            return v608.width;
        end, 
        draw = function(v613, v614, v615, _, _, v618, v619, v620, v621)
            render.text(1, vector(v614 + v613.width, v615), color(v618, v619, v620, v621), "r", v613.text);
        end
    }, 
    [4] = {
        name = "Ping", 
        get_width = function(v622, _)
            -- upvalues: v416 (ref)
            local v624 = v416.client_latency();
            if v624 > 0 then
                v622.ping = v624;
                v622.text = v622.ping .. "ms";
                v622.width = math.max(render.measure_text(1, nil, "999ms").x, render.measure_text(1, nil, v622.text).x);
                return v622.width;
            else
                return;
            end;
        end, 
        draw = function(v625, v626, v627, _, _, v630, v631, v632, v633)
            if v625.ping > 150 then
                local v634 = 255;
                local v635 = 0;
                v632 = 0;
                v631 = v635;
                v630 = v634;
            end;
            render.text(1, vector(v626 + v625.width, v627), color(v630, v631, v632, v633), "r", v625.text);
        end
    }, 
    [5] = {
        name = "KDR", 
        get_width = function(v636, v637)
            v637.local_player = v637.local_player or entity.get_local_player();
            if v637.local_player == nil then
                return;
            else
                local v638 = v637.local_player:get_resource();
                if v638 == nil then
                    return;
                else
                    v636.kills = v638.m_iKills;
                    v636.deaths = math.max(v638.m_iDeaths, 1);
                    v636.kdr = v636.kills / v636.deaths;
                    if v636.kdr ~= 0 then
                        v636.text = string.format("%1.1f", v636.kdr);
                        v636.text_width = math.max(render.measure_text(1, nil, "10.0").x, render.measure_text(1, nil, v636.text).x);
                        v636.unit_width = render.measure_text(4, nil, "kdr").x;
                        return v636.text_width + v636.unit_width;
                    else
                        return;
                    end;
                end;
            end;
        end, 
        draw = function(v639, v640, v641, _, _, v644, v645, v646, v647)
            render.text(1, vector(v640 + v639.text_width, v641), color(v644, v645, v646, v647), "r", v639.text);
            render.text(4, vector(v640 + v639.text_width + v639.unit_width, v641 + 2), color(255, 255, 255, v647 * 0.75), "r", "kdr");
        end
    }, 
    [6] = {
        name = "Velocity", 
        get_width = function(v648, v649)
            v649.local_player = v649.local_player or entity.get_local_player();
            if v649.local_player == nil then
                return;
            else
                local l_x_9 = v649.local_player.m_vecVelocity.x;
                local l_y_7 = v649.local_player.m_vecVelocity.y;
                if l_x_9 ~= nil then
                    v648.velocity = math.sqrt(l_x_9 * l_x_9 + l_y_7 * l_y_7);
                    v648.vel_width = render.measure_text(1, nil, "9999").x;
                    v648.unit_width = render.measure_text(4, nil, "vel").x;
                    return v648.vel_width + v648.unit_width;
                else
                    return;
                end;
            end;
        end, 
        draw = function(v652, v653, v654, _, _, _, _, _, v660)
            local l_velocity_0 = v652.velocity;
            l_velocity_0 = math.min(9999, l_velocity_0) + 0.4;
            l_velocity_0 = math.floor(l_velocity_0);
            render.text(1, vector(v653 + v652.vel_width, v654), color(255, 255, 255, v660), "r", l_velocity_0);
            render.text(4, vector(v653 + v652.vel_width + v652.unit_width, v654 + 3), color(255, 255, 255, v660 * 0.75), "r", "vel");
        end
    }, 
    [7] = {
        name = "Server framerate", 
        get_width = function(v662, v663)
            v663.local_player = v663.local_player or entity.get_local_player();
            if v663.local_player == nil then
                return;
            else
                v663.net_channel_info = v663.net_channel_info or utils.net_channel();
                if v663.net_channel_info == nil then
                    return;
                else
                    local v664 = v663.net_channel_info:get_server_info();
                    local l_frame_time_1 = v664.frame_time;
                    local l_deviation_1 = v664.deviation;
                    if l_frame_time_1 ~= nil then
                        v662.framerate = l_frame_time_1;
                        v662.var = l_deviation_1;
                        v662.text1 = "sv:";
                        v662.text2 = string.format("%.1f", v662.framerate);
                        v662.text3 = " +-";
                        v662.text4 = string.format("%.1f", v662.var);
                        v662.width1 = render.measure_text(1, nil, v662.text1).x;
                        v662.width2 = math.max(render.measure_text(1, nil, v662.text2).x, render.measure_text(1, nil, "99.9").x);
                        v662.width3 = render.measure_text(1, nil, v662.text3).x;
                        v662.width4 = math.max(render.measure_text(1, nil, v662.text4).x, render.measure_text(1, nil, "9.9").x);
                        return v662.width1 + v662.width2 + v662.width3 + v662.width4;
                    else
                        return;
                    end;
                end;
            end;
        end, 
        draw = function(v667, v668, v669, _, _, v672, v673, v674, v675)
            -- upvalues: v42 (ref)
            local v676 = v42(v667.framerate, 8, 14, 20, color(v672, v673, v674));
            local v677 = v42(v667.var, 5, 10, 18, color(v672, v673, v674));
            render.text(1, vector(v668, v669), color(v672, v673, v674, v675), nil, v667.text1);
            render.text(1, vector(v668 + v667.width1 + v667.width2, v669), color(v676.r, v676.g, v676.b, v675), "r", v667.text2);
            render.text(1, vector(v668 + v667.width1 + v667.width2, v669), color(v672, v673, v674, v675), nil, v667.text3);
            render.text(1, vector(v668 + v667.width1 + v667.width2 + v667.width3, v669), color(v677.r, v677.g, v677.b, v675), nil, v667.text4);
        end
    }, 
    [8] = {
        name = "Network lag", 
        get_width = function(v678, v679)
            v679.local_player = v679.local_player or entity.get_local_player();
            if v679.local_player == nil then
                return;
            else
                v679.net_channel_info = v679.net_channel_info or utils.net_channel();
                if v679.net_channel_info == nil then
                    return;
                else
                    local v680 = {};
                    local l_time_since_last_received_0 = v679.net_channel_info.time_since_last_received;
                    if l_time_since_last_received_0 ~= nil and l_time_since_last_received_0 > 0.1 then
                        table.insert(v680, string.format("%.1fs timeout", l_time_since_last_received_0));
                    end;
                    local v682 = v679.net_channel_info.loss[1];
                    if v682 ~= nil and v682 > 0 then
                        table.insert(v680, string.format("%d%% loss", math.ceil(v682 * 100)));
                    end;
                    local v683 = v679.net_channel_info.choke[1];
                    if v683 > 0 then
                        table.insert(v680, string.format("%d%% choke", math.ceil(v683 * 100)));
                    end;
                    if #v680 > 0 then
                        v678.text = table.concat(v680, ", ");
                        return render.measure_text(1, nil, v678.text).x;
                    else
                        return;
                    end;
                end;
            end;
        end, 
        draw = function(v684, v685, v686, _, _, _, _, _, v692)
            render.text(1, vector(v685, v686), color(255, 32, 32, v692), nil, v684.text);
        end
    }, 
    [9] = {
        name = "Server info", 
        get_width = function(v693, v694)
            -- upvalues: v416 (ref)
            v694.local_player = v694.local_player or entity.get_local_player();
            if v694.local_player == nil then
                return;
            else
                v694.net_channel_info = v694.net_channel_info or utils.net_channel();
                if v694.net_channel_info == nil then
                    return;
                else
                    v694.is_loopback = v694.is_loopback == nil and v694.net_channel_info.is_loopback or v694.is_loopback;
                    local v695 = entity.get_game_rules();
                    v694.is_valve_ds = v694.is_valve_ds == nil and v695.m_bIsValveDS == 1 or v694.is_valve_ds;
                    local v696 = nil;
                    if v694.is_loopback then
                        v696 = "Local server";
                    elseif v694.is_valve_ds then
                        local v697 = nil;
                        local v698 = v416.cvar_game_mode:int();
                        local v699 = v416.cvar_game_type:int();
                        if v695.m_bIsQueuedMatchmaking == 1 then
                            if v699 == 0 and v698 == 1 then
                                v697 = "MM";
                            elseif v699 == 0 and v698 == 2 then
                                v697 = "Wingman";
                            elseif v699 == 3 then
                                v697 = "Custom";
                            elseif v699 == 4 and v698 == 0 then
                                v697 = "Guardian";
                            elseif v699 == 4 and v698 == 1 then
                                v697 = "Co-op Strike";
                            elseif v699 == 6 and v698 == 0 then
                                v697 = "Danger Zone";
                            end;
                        elseif v699 == 0 and v698 == 0 then
                            v697 = "Casual";
                        elseif v699 == 1 and v698 == 0 then
                            v697 = "Arms Race";
                        elseif v699 == 1 and v698 == 1 then
                            v697 = "Demolition";
                        elseif v699 == 1 and v698 == 2 then
                            v697 = "Deathmatch";
                        end;
                        if v697 ~= nil then
                            v696 = "Valve (" .. v697 .. ")";
                        else
                            v696 = "Valve";
                        end;
                    end;
                    if v696 ~= nil then
                        v693.text = v696;
                        return render.measure_text(1, nil, v696).x;
                    else
                        return;
                    end;
                end;
            end;
        end, 
        draw = function(v700, v701, v702, _, _, _, _, _, v708)
            render.text(1, vector(v701, v702), color(255, 255, 255, v708), nil, v700.text);
        end
    }, 
    [10] = {
        name = "Server IP", 
        get_width = function(v709, v710)
            v710.net_channel_info = v710.net_channel_info or utils.net_channel();
            if v710.net_channel_info == nil then
                return;
            else
                v710.is_loopback = v710.is_loopback == nil and v710.net_channel_info.is_loopback or v710.is_loopback;
                if v710.is_loopback then
                    return;
                else
                    v710.is_valve_ds = v710.is_valve_ds == nil and entity.get_game_rules().m_bIsValveDS == 1 or v710.is_valve_ds;
                    if v710.is_valve_ds then
                        return;
                    else
                        v710.server_address = v710.server_address or v710.net_channel_info:get_server_info().address;
                        if v710.server_address ~= nil and v710.server_address ~= "" then
                            v709.text = v710.server_address;
                            return render.measure_text(1, nil, v709.text).x;
                        else
                            return;
                        end;
                    end;
                end;
            end;
        end, 
        draw = function(v711, v712, v713, _, _, _, _, _, v719)
            render.text(1, vector(v712, v713), color(255, 255, 255, v719), nil, v711.text);
        end
    }, 
    [11] = {
        name = "Tickrate", 
        get_width = function(v720, _)
            if common.get_map_data() == nil then
                return;
            elseif globals.tickinterval ~= nil then
                local v722 = 1 / globals.tickinterval .. " tick";
                v720.text = v722;
                return render.measure_text(1, nil, v722).x;
            else
                return;
            end;
        end, 
        draw = function(v723, v724, v725, _, _, _, _, _, v731)
            render.text(1, vector(v724, v725), color(255, 255, 255, v731), nil, v723.text);
        end
    }, 
    [12] = {
        seconds = false, 
        name = "Time", 
        get_width = function(v732, _)
            v732.time_width = render.measure_text(1, nil, "00").x;
            v732.sep_width = render.measure_text(1, nil, ":").x;
            return v732.time_width + v732.sep_width + v732.time_width + (v732.seconds and v732.sep_width + v732.time_width or 0);
        end, 
        draw = function(v734, v735, v736, _, _, _, _, _, v742)
            local v743 = common.get_system_time();
            local l_hours_0 = v743.hours;
            local l_minutes_0 = v743.minutes;
            local l_seconds_0 = v743.seconds;
            local v747 = string.format("%02d", l_hours_0);
            l_minutes_0 = string.format("%02d", l_minutes_0);
            render.text(1, vector(v735, v736), color(255, 255, 255, v742), nil, v747);
            render.text(1, vector(v735 + v734.time_width - 1, v736), color(255, 255, 255, v742), nil, ":");
            render.text(1, vector(v735 + v734.time_width + v734.sep_width, v736), color(255, 255, 255, v742), nil, l_minutes_0);
            if v734.seconds then
                l_seconds_0 = string.format("%02d", l_seconds_0);
                render.text(1, vector(v735 + v734.time_width * 2 + v734.sep_width - 1, v736), color(255, 255, 255, v742), nil, ":");
                render.text(1, vector(v735 + v734.time_width * 2 + v734.sep_width * 2, v736), color(255, 255, 255, v742), nil, l_seconds_0);
            end;
        end
    }
};
v416.items_drawn = {};
v416.window.pre_paint_callback = function()
    -- upvalues: v416 (ref), v116 (ref), v55 (ref)
    v416.items_drawn = {};
    local v748 = v116.item.gs_watermark_enable:get();
    local l_x_10 = render.screen_size().x;
    local l_y_8 = render.screen_size().y;
    if v416.offset_x < 0 or not v416.offset_x then
        local _ = l_x_10 + v416.offset_x;
    end;
    if v416.offset_y < 0 or not v416.offset_y then
        local _ = l_y_8 + v416.offset_y;
    end;
    for v753 = 1, #v416.items do
        local v754 = v416.items[v753];
        if v754.name == "Time" then
            v754.seconds = v116.item.gs_watermark_optionals:get(4) and v116.item.gs_watermark_enable:get(12);
            if v754.seconds then
                table.insert(v748, "Time");
            end;
        end;
    end;
    local v755 = 9;
    local v756 = 0;
    local v757 = {};
    for v758 = 1, #v416.items do
        local v759 = v416.items[v758];
        if v55(v748, v759.name) then
            local v760 = v759:get_width(v757);
            if v760 ~= nil and v760 > 0 then
                table.insert(v416.items_drawn, {
                    item = v759, 
                    item_width = v760, 
                    x = v756
                });
                v756 = v756 + v760 + v755;
            end;
        end;
    end;
    local l_y_9 = render.measure_text(1, nil, "A").y;
    v416.window.gradient_bar = v116.item.gs_watermark_optionals:get(2);
    v416.window:set_inner_width(v756 - v755);
    v416.window:set_inner_height(l_y_9);
    v416.window.visible = #v416.items_drawn > 0;
end;
v416.window.paint_callback = function()
    -- upvalues: v416 (ref)
    local v762 = 255;
    local v763 = 255;
    local v764 = 255;
    local v765 = 230;
    for v766 = 1, #v416.items_drawn do
        local v767 = v416.items_drawn[v766];
        v767.item:draw(v416.window.i_x + v767.x, v416.window.i_y, v767.item_width, 30, v762, v763, v764, v765);
        if v766 < #v416.items_drawn then
            render.rect(vector(v416.window.i_x + v767.x + v767.item_width + 4, v416.window.i_y + 1), vector(v416.window.i_x + v767.x + v767.item_width + 5, v416.window.i_y + v416.window.i_h), color(210, 210, 210, 255));
        end;
    end;
end;
v116.item.gs_watermark_enable:set_callback(function(v768)
    -- upvalues: v116 (ref)
    v116.item.gs_watermark_logo_name:visibility(v768:get(1));
    v116.item.gs_watermark_logo_name_accent:visibility(v768:get(1));
    v116.item.gs_watermark_custom_name:visibility(v768:get(2));
    v116.item.gs_watermark_optionals:visibility(#v768:get() > 0);
end, true);
v116.item.gs_watermark_optionals:set_callback(function(v769)
    -- upvalues: v116 (ref)
    v116.item.logo_suffix:visibility(v769:get(1));
    v116.item.gs_watermark_title_name:visibility(v769:get(3));
end, true);
v571 = {
    old_aspectratio = cvar.r_aspectratio:float(), 
    old_fov = cvar.viewmodel_fov:int(), 
    old_x = cvar.viewmodel_offset_x:float(), 
    old_y = cvar.viewmodel_offset_y:float(), 
    old_z = cvar.viewmodel_offset_z:float()
};
cvar.viewmodel_fov:set_callback(function(v770)
    -- upvalues: v116 (ref), v571 (ref)
    if not v116.item.viewmodel_switch:get() then
        v571.old_fov = v770:int();
    end;
end, true);
cvar.viewmodel_offset_x:set_callback(function(v771)
    -- upvalues: v116 (ref), v571 (ref)
    if not v116.item.viewmodel_switch:get() then
        v571.old_x = v771:int();
    end;
end, true);
cvar.viewmodel_offset_y:set_callback(function(v772)
    -- upvalues: v116 (ref), v571 (ref)
    if not v116.item.viewmodel_switch:get() then
        v571.old_y = v772:int();
    end;
end, true);
cvar.viewmodel_offset_z:set_callback(function(v773)
    -- upvalues: v116 (ref), v571 (ref)
    if not v116.item.viewmodel_switch:get() then
        v571.old_z = v773:int();
    end;
end, true);
cvar.r_aspectratio:set_callback(function(v774)
    -- upvalues: v116 (ref), v571 (ref)
    if not v116.item.aspect_ratio_switch:get() then
        v571.old_aspectratio = v774:float();
    end;
end, true);
v116.item.aspect_ratio_switch:set_callback(function(v775)
    -- upvalues: v116 (ref), v571 (ref)
    cvar.r_aspectratio:float(v775:get() and v116.item.aspect_ratio_slider:get() / 10 or v571.old_aspectratio);
end, true);
v116.item.aspect_ratio_slider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.item.aspect_ratio_switch:get() then
        cvar.r_aspectratio:float(v116.item.aspect_ratio_slider:get() / 10);
    end;
end, true);
v116.item.viewmodel_switch:set_callback(function(v776)
    -- upvalues: v116 (ref), v571 (ref)
    cvar.viewmodel_fov:int(v776:get() and v116.item.viewmodel_fov_slider:get() or v571.old_fov, true);
    cvar.viewmodel_offset_x:int(v776:get() and v116.item.viewmodel_x_slider:get() or v571.old_x, true);
    cvar.viewmodel_offset_y:int(v776:get() and v116.item.viewmodel_y_slider:get() or v571.old_y, true);
    cvar.viewmodel_offset_z:int(v776:get() and v116.item.viewmodel_z_slider:get() or v571.old_z, true);
end, true);
v116.item.viewmodel_fov_slider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.item.viewmodel_switch:get() then
        cvar.viewmodel_fov:int(v116.item.viewmodel_fov_slider:get(), true);
    end;
end, true);
v116.item.viewmodel_x_slider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.item.viewmodel_switch:get() then
        cvar.viewmodel_offset_x:int(v116.item.viewmodel_x_slider:get(), true);
    end;
end, true);
v116.item.viewmodel_y_slider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.item.viewmodel_switch:get() then
        cvar.viewmodel_offset_y:int(v116.item.viewmodel_y_slider:get(), true);
    end;
end, true);
v116.item.viewmodel_z_slider:set_callback(function()
    -- upvalues: v116 (ref)
    if v116.item.viewmodel_switch:get() then
        cvar.viewmodel_offset_z:int(v116.item.viewmodel_z_slider:get(), true);
    end;
end, true);
v572 = {
    render_triangle = function(v777, v778, v779, v780, v781, v782, v783)
        local function v787(v784, v785, v786)
            if (v785.y - v784.y) * (v786.x - v785.x) - (v785.x - v784.x) * (v786.y - v785.y) < 0 then
                return true;
            else
                return false;
            end;
        end;
        if v787(v777, v778, v779) then
            render.poly(color(v780, v781, v782, v783), vector(v777.x, v777.y), vector(v778.x, v778.y), vector(v779.x, v779.y));
        elseif v787(v777, v779, v778) then
            render.poly(color(v780, v781, v782, v783), vector(v777.x, v777.y), vector(v779.x, v779.y), vector(v778.x, v778.y));
        elseif v787(v778, v779, v777) then
            render.poly(color(v780, v781, v782, v783), vector(v778.x, v778.y), vector(v779.x, v779.y), vector(v777.x, v777.y));
        elseif v787(v778, v777, v779) then
            render.poly(color(v780, v781, v782, v783), vector(v778.x, v778.y), vector(v777.x, v777.y), vector(v779.x, v779.y));
        elseif v787(v779, v777, v778) then
            render.poly(color(v780, v781, v782, v783), vector(v779.x, v779.y), vector(v777.x, v777.y), vector(v778.x, v778.y));
        else
            render.poly(color(v780, v781, v782, v783), vector(v779.x, v779.y), vector(v778.x, v778.y), vector(v777.x, v777.y));
        end;
    end
};
v572.render = function()
    -- upvalues: v116 (ref), v572 (ref)
    if not v116.item.china_hat_switch:get() then
        return;
    else
        local v788 = entity.get_local_player();
        if not v788 then
            return;
        elseif not v788:is_alive() then
            return;
        elseif not common.is_in_thirdperson() then
            return;
        else
            local v789 = nil;
            local v790 = v116.item.china_hat_rgb:get();
            local v791, v792, v793 = v116.item.china_hat_color:get():unpack();
            local l_realtime_2 = globals.realtime;
            local v795 = v788:get_hitbox_position(0);
            for v796 = 0, 360, v116.item.china_hat_polygons:get() do
                local v797 = vector(v795.x - math.sin(math.rad(v796)) * v116.item.china_hat_size:get(), v795.y - math.cos(math.rad(v796)) * v116.item.china_hat_size:get(), v795.z);
                if v790 then
                    local v798 = 0;
                    v798 = (l_realtime_2 * (v116.item.china_hat_rgb_speed:get() * 50) + v796) % 360;
                    v798 = math.min(360, math.max(0, v798));
                    local l_r_1 = color():as_hsv(v798 / 360, 1, 1).r;
                    local l_g_1 = color():as_hsv(v798 / 360, 1, 1).g;
                    local l_b_1 = color():as_hsv(v798 / 360, 1, 1).b;
                    local v802, v803, v804 = color(l_r_1, l_g_1, l_b_1):unpack();
                    v793 = v804;
                    v792 = v803;
                    v791 = v802;
                end;
                if v789 ~= nil then
                    local v805 = render.get_offscreen(vector(v789.x, v789.y, v789.z), 9999);
                    local v806 = render.get_offscreen(vector(v797.x, v797.y, v797.z), 9999);
                    local v807 = render.get_offscreen(vector(v795.x, v795.y, v795.z + 8), 9999);
                    if v805.x ~= nil and v806.x ~= nil and v807.x ~= nil then
                        v572.render_triangle(vector(v805.x, v805.y), vector(v806.x, v806.y), vector(v807.x, v807.y), v791, v792, v793, 50);
                        render.line(vector(v805.x, v805.y), vector(v806.x, v806.y), color(v791, v792, v793, 255));
                    end;
                end;
                v789 = v797;
            end;
            return;
        end;
    end;
end;
v573 = function()
    -- upvalues: v116 (ref)
    if not v116.item.angel_halo_switch:get() then
        return;
    else
        local v808 = entity.get_local_player();
        if not v808 then
            return;
        elseif not v808:is_alive() then
            return;
        else
            if common.is_in_thirdperson() then
                local v809 = v808:get_hitbox_position(0);
                local v810 = nil;
                for v811 = 0, 360, 15 do
                    local v812 = vector(v809.x - math.sin(math.rad(v811)) * v116.item.angel_halo_size:get(), v809.y - math.cos(math.rad(v811)) * v116.item.angel_halo_size:get(), v809.z);
                    if v810 ~= nil then
                        local v813 = render.get_offscreen(vector(v810.x, v810.y, v810.z + 7), 9999);
                        local v814 = render.get_offscreen(vector(v812.x, v812.y, v812.z + 7), 9999);
                        local v815 = render.get_offscreen(v809, 9999);
                        if v813.x ~= nil and v814.x ~= nil and v815.x ~= nil then
                            render.line(vector(v813.x, v813.y), vector(v814.x, v814.y), v116.item.angel_halo_color:get());
                        end;
                    end;
                    v810 = v812;
                end;
            end;
            return;
        end;
    end;
end;
local v824 = {
    dormant_player_handler = function(v816, v817)
        if not v816 then
            return false;
        else
            local v818 = v816:get_network_state();
            if not v817 and v818 > 0 and v818 < 5 or v818 == 5 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    get_w2s_position = function(v819, v820)
        if v820 then
            local v821, _, _ = render.get_offscreen(v819, 360, true);
            return v821;
        else
            return render.world_to_screen(v819);
        end;
    end
};
v824.closest_enemy = function(v825, v826, v827, v828, v829)
    -- upvalues: v824 (ref)
    local v830 = entity.get_local_player():get_origin();
    local v831 = render.screen_size() * 0.5;
    local l_huge_0 = math.huge;
    local v833 = nil;
    for _, v835 in ipairs(entity.get_players(true, true)) do
        local v836 = v824.dormant_player_handler(v835, v828);
        if v835 and v835:is_alive() and not v836 and (not v829 or v835:is_visible()) then
            local v837 = v835:get_origin();
            local v838 = v837:dist(v830);
            local v839 = render.world_to_screen(v837);
            if v827 then
                if v825 < v838 and v838 < v826 and v839 then
                    local v840 = v831:dist2d(v839);
                    if v840 < l_huge_0 then
                        l_huge_0 = v840;
                        v833 = v835;
                    end;
                end;
            elseif v825 < v838 and v838 < v826 then
                l_huge_0 = v838;
                v833 = v835;
            end;
        end;
    end;
    return v833;
end;
v824.render = function()
    -- upvalues: v116 (ref), v824 (ref)
    if not v116.item.snaplines_selectable:get(1) and not v116.item.snaplines_selectable:get(2) then
        return;
    else
        local v841 = entity.get_local_player();
        if not v841 then
            return;
        elseif not v841:is_alive() then
            return;
        else
            local v842 = v116.item.snaplines_selectable:get(1) and common.is_in_thirdperson() and v841:get_hitbox_position(2) or not (not v116.item.snaplines_selectable:get(2) or common.is_in_thirdperson()) and v841:get_origin() or nil;
            if v842 then
                local v843 = v824.get_w2s_position(v842, v116.item.snaplines_selectable:get(2) and not common.is_in_thirdperson());
                if v116.item.snaplines_combo:get() == "Closest (Single)" then
                    local v844 = v824.closest_enemy(0, v116.item.snaplines_min_distance:get(), false, v116.item.snaplines_allow_dormant:get(), v116.item.snaplines_only_visible:get());
                    if v844 then
                        local v845 = render.world_to_screen(v844:get_origin());
                        local v846 = v844:get_bbox();
                        local v847 = v846 and v846.alpha or 0;
                        render.line(v845, v843, color(v116.item.snaplines_accent_color:get().r, v116.item.snaplines_accent_color:get().g, v116.item.snaplines_accent_color:get().b, v847 * v116.item.snaplines_accent_color:get().a));
                    end;
                    local v848 = v824.closest_enemy(v116.item.snaplines_min_distance:get(), v116.item.snaplines_max_distance:get(), true, v116.item.snaplines_allow_dormant:get(), v116.item.snaplines_only_visible:get());
                    if v848 and not v844 then
                        local v849 = render.world_to_screen(v848:get_origin());
                        local v850 = v848:get_bbox();
                        local v851 = v850 and v850.alpha or 0;
                        render.line(v849, v843, color(v116.item.snaplines_color:get().r, v116.item.snaplines_color:get().g, v116.item.snaplines_color:get().b, v851 * v116.item.snaplines_color:get().a));
                    end;
                elseif v116.item.snaplines_combo:get() == "Closest (Multiple)" then
                    for _, v853 in ipairs(entity.get_players(true, true)) do
                        local v854 = v824.dormant_player_handler(v853, v116.item.snaplines_allow_dormant:get());
                        if v853 and v853:is_alive() and not v854 and (not v116.item.snaplines_only_visible:get() or v853:is_visible()) then
                            local v855 = v853:get_origin();
                            local v856 = v855:dist(v842);
                            local v857 = render.world_to_screen(v855);
                            local v858 = v853:get_bbox();
                            local v859 = v858 and v858.alpha or 0;
                            if v856 < v116.item.snaplines_min_distance:get() then
                                render.line(v857, v843, color(v116.item.snaplines_accent_color:get().r, v116.item.snaplines_accent_color:get().g, v116.item.snaplines_accent_color:get().b, v859 * v116.item.snaplines_accent_color:get().a));
                            end;
                            if v116.item.snaplines_min_distance:get() < v856 and v856 < v116.item.snaplines_max_distance:get() then
                                render.line(v857, v843, color(v116.item.snaplines_color:get().r, v116.item.snaplines_color:get().g, v116.item.snaplines_color:get().b, v859 * v116.item.snaplines_color:get().a));
                            end;
                        end;
                    end;
                else
                    local v860 = entity.get_threat(v116.item.snaplines_only_hittable:get());
                    local v861 = v824.dormant_player_handler(v860, v116.item.snaplines_allow_dormant:get());
                    if v860 and v860:is_alive() and not v861 and (not v116.item.snaplines_only_visible:get() or v860:is_visible()) then
                        local v862 = v860:get_origin();
                        local v863 = v862:dist(v842);
                        local v864 = render.world_to_screen(v862);
                        local v865 = v860:get_bbox();
                        local v866 = v865 and v865.alpha or 0;
                        if v863 < v116.item.snaplines_min_distance:get() then
                            render.line(v864, v843, color(v116.item.snaplines_accent_color:get().r, v116.item.snaplines_accent_color:get().g, v116.item.snaplines_accent_color:get().b, v866 * v116.item.snaplines_accent_color:get().a));
                        end;
                        if v116.item.snaplines_min_distance:get() < v863 and v863 < v116.item.snaplines_max_distance:get() then
                            render.line(v864, v843, color(v116.item.snaplines_color:get().r, v116.item.snaplines_color:get().g, v116.item.snaplines_color:get().b, v866 * v116.item.snaplines_color:get().a));
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v116.item.snaplines_combo:set_callback(function(v867)
    -- upvalues: v116 (ref)
    v116.item.snaplines_only_hittable:visibility(v867:get() == "Current Threat");
    v116.item.snaplines_only_visible:visibility(v867:get() ~= "Current Threat");
end, true);
v115.functions = panorama.loadstring("\t_AddModifiersFromWeaponItemId = function(itemId, arrModifiers)\n\t{\n\t\tvar weaponName = ItemInfo.GetItemDefinitionName( itemId );\n\t\tarrModifiers.push( weaponName );\n\n\t\tvar weaponType = InventoryAPI.GetWeaponTypeString( itemId );\n\t\tarrModifiers.push( weaponType );\n\t}\n\t\n\tload_model = function(path)\n\t{\n\t\tvar importedSettings = ItemInfo.GetOrUpdateVanityCharacterSettings();\n\t\tvar playerPanel = $.GetContextPanel().GetChild(0).FindChildInLayoutFile('JsMainmenu_Vanity');\n\t\tvar settings = ItemInfo.DeepCopyVanityCharacterSettings( importedSettings )\n\t\t\n\t\tsettings.activity = 'ACT_CSGO_UIPLAYER_WALKUP';\n\t\tvar wid = settings.weaponItemId;\n\t\t\n\t\tif ( path != null ) {\n\t\t\tplayerPanel.SetSceneModel(path);\n\t\t} else {\n\t\t\tsettings.model = ItemInfo.GetModelPlayer( settings.charItemId )\n\t\t\t\n\t\t\tif ( !settings.model )\n\t\t\t{\n\t\t\t\tif ( settings.team == 'ct' )\n\t\t\t\t\tsettings.model = \"models/player/custom_player/legacy/ctm_sas.mdl\";\n\t\t\t\telse\n\t\t\t\t\tsettings.model = \"models/player/custom_player/legacy/tm_phoenix.mdl\";\n\t\t\t}\n\t\t\t\n\t\t\tplayerPanel.SetPlayerCharacterItemID( settings.charItemId );\n\t\t\tplayerPanel.SetSceneModel( settings.model );\n\t\t}\n\t\t\n\t\tplayerPanel.EquipPlayerWithItem( wid );\n\t\tplayerPanel.EquipPlayerWithItem( settings.glovesItemId );\n\n\t\tplayerPanel.ResetActivityModifiers();\n\t\t\n\t\tplayerPanel.ApplyActivityModifier( settings.team );\n\n\t\tif ( !( 'arrModifiers' in settings ) ) {\n\t\t\tsettings.arrModifiers = [];\n\t\t}\n\n\t\t_AddModifiersFromWeaponItemId( wid, settings.arrModifiers );\n\n\t\tsettings.arrModifiers.forEach( mod => playerPanel.ApplyActivityModifier( mod ) );\n\t\t\n\t\tif ( !('activity' in settings ) || settings.activity == \"\" ) {\n\t\t\tsettings.activity = 'ACT_CSGO_UIPLAYER_IDLE';\n\t\t}\n\t\t\n\t\tif ( !( 'immediate' in settings ) || settings.immediate == \"\" ) {\n\t\t\tsettings.immediate = true;\n\t\t}\n\t\t\n\t\tplayerPanel.PlayActivity( settings.activity, settings.immediate );\n\t}\n\t\n\treturn {\n\t\tget: () => {\n\t\t\tvar importedSettings = ItemInfo.GetOrUpdateVanityCharacterSettings();\n\t\t\tvar playerPanel = $.GetContextPanel().GetChild(0).FindChildInLayoutFile('JsMainmenu_Vanity');\n\t\t\tvar settings = ItemInfo.DeepCopyVanityCharacterSettings( importedSettings )\n\t\t\tif (settings && playerPanel) {\n\t\t\t\treturn { team: settings.team, model: playerPanel.item };\n\t\t\t}\n\t\t}\n\t}\n")();
v115.mask_path = {
    ["Sheep Model"] = "models/player/holiday/facemasks/facemask_sheep_model.mdl", 
    ["Sheep Gold"] = "models/player/holiday/facemasks/facemask_sheep_gold.mdl", 
    ["Sheep Bloody"] = "models/player/holiday/facemasks/facemask_sheep_bloody.mdl", 
    Samurai = "models/player/holiday/facemasks/facemask_samurai.mdl", 
    Pumpkin = "models/player/holiday/facemasks/facemask_pumpkin.mdl", 
    Hoxton = "models/player/holiday/facemasks/facemask_hoxton.mdl", 
    ["Devil Plastic"] = "models/player/holiday/facemasks/facemask_devil_plastic.mdl", 
    Chicken = "models/player/holiday/facemasks/facemask_chicken.mdl", 
    Chains = "models/player/holiday/facemasks/facemask_chains.mdl", 
    ["Bunny Gold"] = "models/player/holiday/facemasks/facemask_bunny_gold.mdl", 
    Bunny = "models/player/holiday/facemasks/facemask_bunny.mdl", 
    Boar = "models/player/holiday/facemasks/facemask_boar.mdl", 
    Anaglyph = "models/player/holiday/facemasks/facemask_anaglyph.mdl", 
    ["Evil Clown"] = "models/player/holiday/facemasks/evil_clown.mdl", 
    ["Battle Mask"] = "models/player/holiday/facemasks/facemask_battlemask.mdl", 
    Dallas = "models/player/holiday/facemasks/facemask_dallas.mdl", 
    Custom = "", 
    Disabled = "", 
    ["Doll Kabuki"] = "models/player/holiday/facemasks/facemask_porcelain_doll_kabuki.mdl", 
    Doll = "models/player/holiday/facemasks/porcelain_doll.mdl", 
    ["Zombie Fortune"] = "models/player/holiday/facemasks/facemask_zombie_fortune_plastic.mdl", 
    Wolf = "models/player/holiday/facemasks/facemask_wolf.mdl", 
    Tiki = "models/player/holiday/facemasks/facemask_tiki.mdl", 
    Template = "models/player/holiday/facemasks/facemask_template.mdl", 
    ["Skull Gold"] = "models/player/holiday/facemasks/facemask_skull_gold.mdl", 
    Skull = "models/player/holiday/facemasks/facemask_skull.mdl"
};
v115.precache_model = function(v868)
    -- upvalues: v7 (ref)
    local v869 = v7.find_table("modelprecache");
    if v869 then
        v7.find_or_load_model(v868);
        if v7.add_string(v869, false, v868, -1, nil) == -1 then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v115.change_model = function(v870, v871)
    -- upvalues: v115 (ref), v7 (ref)
    if v871:len() > 5 then
        if v115.precache_model(v871) == false then
            error("invalid model", 2);
        end;
        local v872 = v7.get_model_index(v871);
        if v872 ~= -1 then
            v870.m_nModelIndex = v872;
        end;
    end;
end;
v115.change_attachment = function(v873, v874)
    -- upvalues: v115 (ref), v7 (ref)
    if v874:len() > 5 then
        if v115.precache_model(v874) == false then
            error("invalid model", 2);
        end;
        local v875 = v7.get_model_index(v874);
        local v876 = entity.get_local_player():get_index();
        local v877 = ffi.cast("intptr_t*", v7.get_client_entity(v876));
        local v878 = ffi.cast("intptr_t*", v877 + 17967)[0];
        local v879 = -1;
        while v878 ~= -1 do
            v879 = ffi.cast("intptr_t*", v877 + 17964)[0] + 24 * v878;
            v878 = ffi.cast("intptr_t*", v879 + 20)[0];
            local v880 = ffi.cast("intptr_t**", v879)[0];
            local v881 = ffi.cast("intptr_t*", v879 + 4)[0];
            if tonumber(v881) == v873 and v875 ~= -1 then
                local v882 = v7.get_client_entity_from_handle(v880);
                v7.set_model_index(v882, v875);
            end;
        end;
    end;
end;
v116.item.player_models_selectable:set_callback(function(v883)
    if not v883:get(1) or not v883:get(2) then
        common.force_full_update();
        if not entity.get_local_player() then
            panorama.load_model(nil);
        end;
    end;
end);
v116.item.mask_changer_combo:set_callback(function(v884)
    if v884:get() == "Disabled" then
        common.force_full_update();
    end;
end);
v116.item.player_model_show_on_menu:set_callback(function(v885)
    if not v885:get() and not entity.get_local_player() then
        panorama.load_model(nil);
    end;
end);
v116.item.weapon_models_selectable:set_callback(function(v886)
    -- upvalues: v115 (ref), v55 (ref), v116 (ref)
    for _, v888 in pairs(v115.menu_wpn) do
        local v889 = v55(v886:get(), v888);
        v116.group.weapon_models_paths[v888]:visibility(v889);
    end;
end);
v115.main_menu = function()
    -- upvalues: v116 (ref), v115 (ref)
    if not v116.item.player_model_show_on_menu:get() then
        return;
    elseif entity.get_local_player() then
        return;
    else
        local v890 = v115.functions:get();
        if not v890 then
            return;
        else
            local l_team_0 = v890.team;
            local l_model_0 = v890.model;
            local v893 = l_team_0 == "t" and v116.item.player_models_selectable:get(1) and v116.item.player_model_changer_t:get() ~= "" and string.gsub(v116.item.player_model_changer_t:get(), "\\", "/") or l_team_0 == "ct" and v116.item.player_models_selectable:get(2) and v116.item.player_model_changer_ct:get() ~= "" and string.gsub(v116.item.player_model_changer_ct:get(), "\\", "/") or nil;
            if l_model_0 ~= v893 and v893 ~= nil then
                panorama.load_model(v893);
            end;
            return;
        end;
    end;
end;
v115.player = function()
    -- upvalues: v116 (ref), v115 (ref)
    local v894 = entity.get_local_player();
    if not v894 or not v894:is_alive() then
        return;
    elseif not v894.m_hViewModel[0] then
        return;
    else
        local v895 = v894.m_iTeamNum == 2;
        local v896 = v895 and v116.item.player_models_selectable:get(1) and v116.item.player_model_changer_t:get() or not v895 and v116.item.player_models_selectable:get(2) and v116.item.player_model_changer_ct:get() or nil;
        if v896 ~= nil then
            v115.change_model(v894, v896);
        end;
        return;
    end;
end;
v115.weapon = function()
    -- upvalues: v115 (ref), v116 (ref)
    local v897 = entity.get_local_player();
    if not v897 or not v897:is_alive() then
        return;
    else
        local v898 = v897.m_hViewModel[0];
        local v899 = v897:get_player_weapon();
        if not v898 or not v899 then
            return;
        else
            local v900 = v899:get_weapon_index();
            local l_m_hWeaponWorldModel_0 = v899.m_hWeaponWorldModel;
            local v902 = v115.menu_wpn_to_idx[v900];
            if v116.group.weapon_models_paths[v902] and v116.group.weapon_models_paths[v902]:visibility() then
                v115.change_model(v898, v116.item.weapon_models_v[v902]:get());
                v115.change_model(l_m_hWeaponWorldModel_0, v116.item.weapon_models_w[v902]:get());
            end;
            return;
        end;
    end;
end;
v115.mask = function()
    -- upvalues: v116 (ref), v115 (ref)
    if v116.item.mask_changer_combo:get() == "Disabled" then
        return;
    else
        local v903 = entity.get_local_player();
        if not v903 or not v903:is_alive() then
            return;
        else
            if bit.band(v903.m_iAddonBits, 65536) ~= 65536 then
                v903.m_iAddonBits = 65536 + v903.m_iAddonBits;
            end;
            local v904 = v116.item.mask_changer_combo:get() == "Custom" and v116.item.custom_mask_changer:get() or v115.mask_path[v116.item.mask_changer_combo:get()];
            if v904 ~= nil then
                v115.change_attachment(16, v904);
            end;
            return;
        end;
    end;
end;
v116.item.mask_changer_combo:set_callback(function(v905)
    -- upvalues: v116 (ref)
    v116.item.custom_mask_changer:visibility(v905:get() == "Custom");
end, true);
v116.item.player_models_selectable:set_callback(function(v906)
    -- upvalues: v116 (ref)
    v116.item.player_model_changer_t:visibility(v906:get(1));
    v116.item.player_model_changer_ct:visibility(v906:get(2));
    v116.item.player_model_show_on_menu:visibility(v906:get(1) or v906:get(2));
end, true);
local v907 = {
    cvar = cvar.r_skin, 
    skin_choice = 0
};
v907.main = function()
    -- upvalues: v116 (ref), v907 (ref)
    if v116.item.arms_changer_combo:get() == "Default" then
        v907.skin_choice = 0;
    elseif v116.item.arms_changer_combo:get() == "White" then
        v907.skin_choice = -1;
    elseif v116.item.arms_changer_combo:get() == "Black" then
        v907.skin_choice = 1;
    elseif v116.item.arms_changer_combo:get() == "Brown" then
        v907.skin_choice = 2;
    elseif v116.item.arms_changer_combo:get() == "Asian" then
        v907.skin_choice = 3;
    elseif v116.item.arms_changer_combo:get() == "Mexican" then
        v907.skin_choice = 4;
    elseif v116.item.arms_changer_combo:get() == "Tattos" then
        v907.skin_choice = 5;
    end;
    v907.cvar:int(v907.skin_choice);
end;
local v911 = {
    main = function()
        -- upvalues: v116 (ref)
        local v908 = materials.get_materials("sleeve");
        for _, v910 in pairs(v908) do
            if v116.item.sleeve_opacity_switch:get() then
                v910:alpha_modulate(v116.item.sleeve_opacity_slider:get() / 100);
            else
                v910:reset();
            end;
        end;
    end
};
events.player_spawn:set(function(v912)
    -- upvalues: v911 (ref)
    if entity.get(v912.userid, true) == entity.get_local_player() then
        v911.main();
    end;
end);
v116.item.sleeve_opacity_switch:set_callback(v911.main, true);
v116.item.sleeve_opacity_slider:set_callback(v911.main, true);
local v913 = {
    cvar = cvar.cl_righthand, 
    stored_cvar = cvar.cl_righthand:int()
};
v913.cvar:set_callback(function(v914)
    -- upvalues: v116 (ref), v913 (ref)
    if v116.item.knife_side_selectable:get() == "Default" then
        v913.stored_cvar = v914:int();
    end;
end, true);
v913.main = function()
    -- upvalues: v114 (ref), v116 (ref), v913 (ref)
    local v915 = entity.get_local_player();
    if not v915 then
        return;
    else
        local v916 = v915:get_player_weapon();
        if not v916 then
            return;
        else
            if v114:IsKnife(v916) then
                local v917 = v116.item.knife_side_selectable:get() == "Left Side" and 0 or v116.item.knife_side_selectable:get() == "Right Side" and 1 or v913.stored_cvar;
                v913.cvar:int(v917);
            else
                local v918 = v116.item.knife_side_selectable:get() == "Left Side" and 1 or v116.item.knife_side_selectable:get() == "Right Side" and 0 or v913.stored_cvar;
                v913.cvar:int(v918);
            end;
            return;
        end;
    end;
end;
local v919 = {
    mat_disable_bloom = cvar.mat_disable_bloom, 
    mat_bloom_scalefactor_scalar = cvar.mat_bloom_scalefactor_scalar, 
    r_modelAmbientMin = cvar.r_modelAmbientMin, 
    mat_vignette_enable = cvar.mat_vignette_enable, 
    old_Removals = v8.Removals:get(), 
    old_mat_vignette_enable = cvar.mat_vignette_enable:int(), 
    old_mat_disable_bloom = cvar.mat_disable_bloom:int()
};
v919.mat_vignette_enable:set_callback(function(v920)
    -- upvalues: v116 (ref), v919 (ref)
    if not v116.item.model_bloom_switch:get() then
        v919.old_mat_vignette_enable = v920:int();
    end;
end, true);
v919.mat_disable_bloom:set_callback(function(v921)
    -- upvalues: v116 (ref), v919 (ref)
    if not v116.item.model_bloom_switch:get() then
        v919.old_mat_disable_bloom = v921:int();
    end;
end, true);
v8.Removals:set_callback(function(v922)
    -- upvalues: v919 (ref)
    v919.cached_removals = v922:get();
end, true);
v116.item.model_bloom_switch:set_callback(function(v923)
    -- upvalues: v919 (ref)
    if v923:get() then
        v919.mat_disable_bloom:int(0);
        v919.mat_vignette_enable:int(0);
    else
        v919.mat_disable_bloom:int(v919.old_mat_disable_bloom);
        v919.mat_vignette_enable:int(v919.old_mat_vignette_enable);
        v919.r_modelAmbientMin:float(0);
    end;
end, true);
v919.main = function()
    -- upvalues: v116 (ref), v919 (ref), v8 (ref)
    if not entity.get_local_player() then
        return;
    else
        if v116.item.model_bloom_switch:get() then
            local v924 = v919.cached_removals[1] == "Flashbang" and "Flashbang" or v919.cached_removals[1] == "Smoke Rendering" and "Smoke Rendering" or "";
            local v925 = v919.cached_removals[2] == "Smoke Rendering" and "Smoke Rendering" or "";
            v8.Removals:override({
                [1] = v924, 
                [2] = v925
            });
            v919.mat_bloom_scalefactor_scalar:float(v116.item.model_bloom_slider:get());
            v919.r_modelAmbientMin:float(v116.item.model_bloom_ambient_light:get() / 10);
        else
            v8.Removals:override();
            v919.mat_bloom_scalefactor_scalar:float(1);
        end;
        return;
    end;
end;
v116.item.fullbright_switch:set_callback(function(v926)
    local l_mat_fullbright_0 = cvar.mat_fullbright;
    if v926:get() then
        l_mat_fullbright_0:int(1);
    else
        l_mat_fullbright_0:int(0);
    end;
end);
local v928 = {
    materials = {
        [1] = "particle/particle_flares/particle_flare_gray", 
        [2] = "particle/smoke1/smoke1_nearcull2", 
        [3] = "particle/vistasmokev1/vistasmokev1_nearcull", 
        [4] = "particle/smoke1/smoke1_nearcull", 
        [5] = "particle/vistasmokev1/vistasmokev1_nearcull_nodepth", 
        [6] = "particle/vistasmokev1/vistasmokev1_nearcull_fog", 
        [7] = "particle/vistasmokev1/vistasmokev4_nearcull", 
        [8] = "particle/fire_burning_character/fire_env_fire_depthblend_oriented", 
        [9] = "particle/fire_burning_character/fire_burning_character", 
        [10] = "particle/fire_burning_character/fire_env_fire", 
        [11] = "particle/fire_explosion_1/fire_explosion_1_oriented", 
        [12] = "particle/fire_explosion_1/fire_explosion_1_bright", 
        [13] = "particle/fire_burning_character/fire_burning_character_depthblend", 
        [14] = "particle/fire_burning_character/fire_env_fire_depthblend"
    }
};
v928.main = function()
    -- upvalues: v928 (ref), v116 (ref)
    for _, v930 in pairs(v928.materials) do
        local v931 = materials.get(v930);
        if v116.item.molotov_modulation_switch:get() and (v116.item.molotov_modulation_selectable:get(1) or v116.item.molotov_modulation_selectable:get(2)) then
            v931:var_flag(28, v116.item.molotov_modulation_selectable:get(1));
            v931:var_flag(15, v116.item.molotov_modulation_selectable:get(2));
        else
            v931:reset();
        end;
    end;
end;
events.player_spawn:set(function(v932)
    -- upvalues: v928 (ref)
    if entity.get(v932.userid, true) == entity.get_local_player() then
        v928.main();
    end;
end);
v116.item.molotov_modulation_switch:set_callback(v928.main, true);
v116.item.molotov_modulation_selectable:set_callback(v928.main, true);
local v933 = {
    downloaded_file_error = false, 
    font = render.load_font("Calibri", 18, "ab")
};
v933.load_image = function(v934)
    -- upvalues: v933 (ref)
    local v935 = files.get_crc32("nl\\bettervisuals\\warning_img.png");
    if v934 or v935 == -1808745910 then
        v933.warning_img = render.load_image_from_file("nl\\bettervisuals\\warning_img.png", vector(18, 16));
    elseif v935 ~= -1808745910 then
        v933.downloaded_file_error = true;
    end;
end;
v933.load_image();
v933.download_image = function()
    -- upvalues: v933 (ref)
    if v933.downloaded_file_error then
        network.get("https://i.imgur.com/VRnqARF.png", {}, function(v936)
            -- upvalues: v933 (ref)
            if v936 then
                files.create_folder("nl\\bettervisuals");
                files.write("nl\\bettervisuals\\warning_img.png", v936, true);
                v933.load_image(true);
            end;
        end);
    end;
end;
v933.download_image();
v933.main = l_system_0.register({
    [1] = v116.item.time_remaining_x, 
    [2] = v116.item.time_remaining_y
}, vector(243, 38), "Time Remaining", function(v937)
    -- upvalues: v933 (ref)
    local l_x_11 = v937.position.x;
    local l_y_10 = v937.position.y;
    local v940 = false;
    local v941 = 0;
    local v942 = entity.get_local_player();
    if not v942 then
        v940 = false;
        return;
    elseif not v942:is_alive() then
        v940 = false;
        return;
    else
        local v943 = entity.get_game_rules();
        local v944 = v943.m_fRoundStartTime + v943.m_iRoundTime - globals.curtime;
        local v945 = entity.get_entities("CPlantedC4");
        if #v945 >= 0 then
            local v946 = v945[1];
            if v946 then
                v940 = v946.m_bBombTicking and true or false;
                if v946.m_flC4Blow ~= nil then
                    v941 = globals.curtime - v946.m_flC4Blow;
                end;
            end;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect_outline(vector(l_x_11, l_y_10), vector(l_x_11 + 243, l_y_10 + 38), color(255, 255, 255, ui.get_alpha() * 50));
        end;
        if v944 >= 0 and v944 <= 20 and v940 == false then
            render.text(v933.font, vector(l_x_11 + 40, l_y_10 + 10), color(255, 0, 0), nil, ("TIME REMAINING: %.2f"):format(v944));
            render.texture(v933.warning_img, vector(l_x_11 + 10, l_y_10 + 10), vector(18, 16), color(255, 0, 0));
        elseif v940 == true and v941 * -1 >= 0 then
            render.text(v933.font, vector(l_x_11 + 40, l_y_10 + 10), color(255, 0, 0), nil, ("TIME REMAINING: %.2f"):format(math.abs(v941)));
            render.texture(v933.warning_img, vector(l_x_11 + 10, l_y_10 + 10), vector(18, 16), color(255, 0, 0));
        elseif ui.get_alpha() ~= 0 then
            render.text(v933.font, vector(l_x_11 + 40, l_y_10 + 10), color(255, 0, 0, ui.get_alpha() * 255), nil, "TIME REMAINING: 0.00");
            render.texture(v933.warning_img, vector(l_x_11 + 10, l_y_10 + 10), vector(18, 16), color(255, 0, 0, ui.get_alpha() * 255));
        end;
        return;
    end;
end);
local v947 = {
    downloaded_files = {
        error = false, 
        error_index = {}
    }, 
    image = {}, 
    links = {
        [1] = "https://i.imgur.com/5ALMF3X.png", 
        [2] = "https://i.imgur.com/AstAboq.png", 
        [3] = "https://i.imgur.com/00lhXKG.png", 
        [4] = "https://i.imgur.com/pwd2dtS.png", 
        [5] = "https://i.imgur.com/fioVk5b.png", 
        [6] = "https://i.imgur.com/YOo4rdL.png", 
        [7] = "https://i.imgur.com/onuR59U.png", 
        [8] = "https://i.imgur.com/Uxskqjl.png", 
        [9] = "https://i.imgur.com/oQhwhbG.png", 
        [10] = "https://i.imgur.com/Ov81HNW.png", 
        [11] = "https://i.imgur.com/ZAeDP0J.png", 
        [12] = "https://i.imgur.com/eG7mbz7.png", 
        [13] = "https://i.imgur.com/jlkQEWq.png", 
        [14] = "https://i.imgur.com/fD1ggcd.png"
    }
};
v947.load_images = function(v948, v949)
    -- upvalues: v947 (ref)
    local v950 = {
        [1] = "doubletap_fade", 
        [2] = "doubletap_text", 
        [3] = "quickpeek_fade", 
        [4] = "quickpeek_text", 
        [5] = "hideshots_fade", 
        [6] = "hideshots_text", 
        [7] = "fakeduck_fade", 
        [8] = "fakeduck_text", 
        [9] = "slowwalk_fade", 
        [10] = "slowwalk_text", 
        [11] = "zeus_fade", 
        [12] = "zeus_text", 
        [13] = "knife_fade", 
        [14] = "knife_text"
    };
    if v948 then
        v947.image[v950[v949]] = render.load_image_from_file(("nl\\bettervisuals\\ninjatsu_%s.png"):format(v949), vector(500, 500));
    else
        for v951 = 1, 14 do
            if files.get_crc32(("nl\\bettervisuals\\ninjatsu_%s.png"):format(v951)) == -1808745910 then
                v947.image[v950[v951]] = render.load_image_from_file(("nl\\bettervisuals\\ninjatsu_%s.png"):format(v951), vector(500, 500));
            else
                v947.downloaded_files.error = true;
                v947.downloaded_files.error_index[#v947.downloaded_files.error_index + 1] = v951;
            end;
        end;
    end;
end;
v947.load_images();
v947.download_images = function()
    -- upvalues: v947 (ref)
    if v947.downloaded_files.error then
        for _, v953 in pairs(v947.downloaded_files.error_index) do
            do
                local l_v953_0 = v953;
                network.get(v947.links[l_v953_0], {}, function(v955)
                    -- upvalues: l_v953_0 (ref), v947 (ref)
                    if v955 then
                        files.create_folder("nl\\bettervisuals");
                        files.write(("nl\\bettervisuals\\ninjatsu_%s.png"):format(l_v953_0), v955, true);
                        v947.load_images(true, l_v953_0);
                    end;
                end);
            end;
        end;
    end;
end;
v947.download_images();
v947.color = {
    default = {
        doubletap = color(255, 0, 0), 
        quickpeek = color(0, 255, 255), 
        hideshots = color(78, 44, 173), 
        fakeduck = color(240, 244, 142), 
        slowwalk = color(0, 255, 0), 
        zeus = color(0, 175, 255), 
        knife = color(255, 0, 0)
    }, 
    sigma = {
        doubletap = color(0, 102, 255), 
        quickpeek = color(255, 114, 0), 
        hideshots = color(78, 44, 173), 
        fakeduck = color(240, 244, 142), 
        slowwalk = color(0, 255, 0), 
        zeus = color(0, 175, 255), 
        knife = color(255, 0, 0)
    }
};
v947.cache_anim = {
    alpha = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0, 
        [4] = 0, 
        [5] = 0, 
        [6] = 0, 
        [7] = 0
    }, 
    texture_alpha = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0, 
        [4] = 0, 
        [5] = 0, 
        [6] = 0, 
        [7] = 0
    }, 
    glow_alpha = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0, 
        [4] = 0, 
        [5] = 0, 
        [6] = 0, 
        [7] = 0
    }, 
    switch = {
        [1] = false, 
        [2] = false, 
        [3] = false, 
        [4] = false, 
        [5] = false, 
        [6] = false, 
        [7] = false, 
        [8] = false
    }, 
    audioSwitch = {
        [1] = true, 
        [2] = true, 
        [3] = true, 
        [4] = true, 
        [5] = true, 
        [6] = true, 
        [7] = true, 
        [8] = true
    }, 
    glowSwitch = {
        [1] = false, 
        [2] = false, 
        [3] = false, 
        [4] = false, 
        [5] = false, 
        [6] = false, 
        [7] = false, 
        [8] = false
    }, 
    image_array = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}, 
        [4] = {}, 
        [5] = {}, 
        [6] = {}, 
        [7] = {}
    }, 
    y_array = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0, 
        [4] = 0, 
        [5] = 0, 
        [6] = 0, 
        [7] = 0
    }, 
    x_array = {
        [1] = 1, 
        [2] = 1, 
        [3] = 1, 
        [4] = 1, 
        [5] = 1, 
        [6] = 1, 
        [7] = 1
    }
};
v947.player_death = {
    time_on_knife_kill = 0, 
    knife = false, 
    time_on_zeus_kill = 0, 
    zeus = false, 
    origin = {
        [1] = 0, 
        [2] = 0, 
        [3] = 0
    }
};
v947.display_hud = function()
    -- upvalues: v116 (ref), v947 (ref), v34 (ref)
    local v956 = v116.item.ninjatsu_indicators_color:get() == "Default" and {
        [1] = v947.color.default.doubletap, 
        [2] = v947.color.default.hideshots, 
        [3] = v947.color.default.quickpeek, 
        [4] = v947.color.default.fakeduck, 
        [5] = v947.color.default.slowwalk, 
        [6] = v947.color.default.zeus, 
        [7] = v947.color.default.knife
    } or v116.item.ninjatsu_indicators_color:get() == "Sigma" and {
        [1] = v947.color.sigma.doubletap, 
        [2] = v947.color.sigma.hideshots, 
        [3] = v947.color.sigma.quickpeek, 
        [4] = v947.color.sigma.fakeduck, 
        [5] = v947.color.sigma.slowwalk, 
        [6] = v947.color.sigma.zeus, 
        [7] = v947.color.sigma.knife
    } or {
        v116.item.ninjatsu_indicators_doubletap:get(), 
        v116.item.ninjatsu_indicators_hideshots:get(), 
        v116.item.ninjatsu_indicators_quickpeek:get(), 
        v116.item.ninjatsu_indicators_fakeduck:get(), 
        v116.item.ninjatsu_indicators_slowwalk:get(), 
        v116.item.ninjatsu_indicators_zeus:get(), 
        v116.item.ninjatsu_indicators_knife:get()
    };
    local v957 = render.screen_size();
    local v958 = 0;
    for v959, _ in ipairs(v947.cache_anim.image_array) do
        if v947.cache_anim.texture_alpha[v959] > 1 then
            v958 = v958 + 1;
            v947.cache_anim.x_array[v959] = v34(v947.cache_anim.x_array[v959], v958 * 70, globals.frametime * 12);
            local l_r_2 = v956[v959].r;
            local l_g_2 = v956[v959].g;
            local l_b_2 = v956[v959].b;
            local _ = v956[v959].a;
            render.texture(v947.cache_anim.image_array[v959][1], vector(v957.x / 5 + v947.cache_anim.x_array[v959], v957.y / 1.053), vector(math.floor(v957.x / 38.4 + 0.5), math.floor(v957.y / 21.6 + 0.5)), color(l_r_2, l_g_2, l_b_2, v947.cache_anim.texture_alpha[v959]));
            render.texture(v947.cache_anim.image_array[v959][2], vector(v957.x / 5 + v947.cache_anim.x_array[v959], v957.y / 1.053), vector(math.floor(v957.x / 38.4 + 0.5), math.floor(v957.y / 21.6 + 0.5)), color(255, 255, 255, v947.cache_anim.texture_alpha[v959]));
        end;
    end;
end;
v947.render = function(v965, v966, v967, v968, v969, v970, v971)
    -- upvalues: v947 (ref), v34 (ref), v116 (ref), v8 (ref)
    local v972 = render.screen_size();
    if not v947.cache_anim.image_array[v971][{
        [1] = v968, 
        [2] = v969
    }] then
        v947.cache_anim.image_array[v971] = {
            [1] = v968, 
            [2] = v969
        };
    end;
    if v967 and not v947.cache_anim.switch[v971] then
        v947.cache_anim.glowSwitch[v971] = true;
        v947.cache_anim.y_array[v971] = v34(v947.cache_anim.y_array[v971], 20, globals.frametime * 12);
        v947.cache_anim.alpha[v971] = v34(v947.cache_anim.alpha[v971], 255, globals.frametime * 12);
        v947.cache_anim.texture_alpha[v971] = v34(v947.cache_anim.texture_alpha[v971], 255, globals.frametime * 12);
        if v116.item.ninjatsu_indicators_sound:get() ~= "Disabled" and v947.cache_anim.audioSwitch[v971] then
            if v116.item.ninjatsu_indicators_sound:get() == "Naruto" then
                utils.console_exec("playvol naruto.mp3 " .. v116.item.ninjatsu_indicators_volume:get() / 100);
            elseif v116.item.ninjatsu_indicators_sound:get() == "Sekiro" then
                utils.console_exec("playvol sekiro.mp3 " .. v116.item.ninjatsu_indicators_volume:get() / 100);
            end;
            v947.cache_anim.audioSwitch[v971] = false;
        end;
        if v947.cache_anim.alpha[v971] >= 254 then
            v947.cache_anim.switch[v971] = true;
        end;
    end;
    if v947.cache_anim.switch[v971] then
        v947.cache_anim.alpha[v971] = v34(v947.cache_anim.alpha[v971], -1, globals.frametime * 12);
    end;
    if v967 then
        v947.cache_anim.glow_alpha[v971] = v34(v947.cache_anim.glow_alpha[v971], 66, globals.frametime * 3);
    end;
    if not v967 then
        v947.cache_anim.switch[v971] = false;
        v947.cache_anim.audioSwitch[v971] = true;
        v947.cache_anim.alpha[v971] = v34(v947.cache_anim.alpha[v971], -1, globals.frametime * 12);
        v947.cache_anim.y_array[v971] = v34(v947.cache_anim.y_array[v971], 0, globals.frametime * 12);
        v947.cache_anim.texture_alpha[v971] = v34(v947.cache_anim.texture_alpha[v971], -1, globals.frametime * 12);
        v947.cache_anim.glow_alpha[v971] = v34(v947.cache_anim.glow_alpha[v971], -1, globals.frametime * 12);
        if v947.cache_anim.texture_alpha[v971] <= 0 then
            v947.cache_anim.image_array[v971] = {
                [1] = v968, 
                [2] = v969
            };
        end;
        if v947.cache_anim.glow_alpha[v971] <= 0 then
            v947.cache_anim.glowSwitch[v971] = false;
        end;
    end;
    if v947.cache_anim.glowSwitch[v971] and v116.item.ninjatsu_indicators_extras:get(1) then
        v8.SelfRim[1]:override(true);
        v8.SelfGlow:override(true);
        v8.SelfDefault[1]:override(false);
        v8.SelfEdgeHighlight[1]:override(false);
        v8.SelfEdgeHighlightPulse[1]:override(false);
        v8.SelfRim[2]:override(color(v970.r, v970.g, v970.b, v947.cache_anim.glow_alpha[v971]));
    end;
    render.texture(v969, vector(v965, v966 - v947.cache_anim.y_array[v971]), vector(math.floor(v972.x / 19), math.floor(v972.y / 11)), color(255, 255, 255, v947.cache_anim.alpha[v971]));
    render.texture(v968, vector(v965, v966 - v947.cache_anim.y_array[v971]), vector(math.floor(v972.x / 19), math.floor(v972.y / 11)), color(v970.r, v970.g, v970.b, v947.cache_anim.alpha[v971]));
end;
v116.item.ninjatsu_indicators_switch:set_callback(function(v973)
    -- upvalues: v116 (ref), v8 (ref)
    if v973:get() and v116.item.ninjatsu_indicators_extras:get(1) then
        v8.SelfRim[2]:override(color(0, 0, 0, 0));
        v8.SelfRim[1]:override(true);
        v8.SelfGlow:override(true);
        v8.SelfDefault[1]:override(false);
        v8.SelfEdgeHighlight[1]:override(false);
        v8.SelfEdgeHighlightPulse[1]:override(false);
    else
        v8.SelfRim[1]:override();
        v8.SelfGlow:override();
        v8.SelfDefault[1]:override();
        v8.SelfEdgeHighlight[1]:override();
        v8.SelfEdgeHighlightPulse[1]:override();
        v8.SelfRim[2]:override();
    end;
end);
v947.main = function()
    -- upvalues: v116 (ref), v8 (ref), v947 (ref)
    if not entity.get_local_player() or not entity.get_local_player():is_alive() or not v116.item.ninjatsu_indicators_switch:get() then
        return;
    else
        local v974 = v8.FakeDuck:get();
        local v975 = v8.DoubleTap:get();
        local v976 = v8.HideShots:get();
        local v977 = v8.AutoPeek:get();
        local v978 = v8.SlowWalk:get();
        local v979 = v116.item.ninjatsu_indicators_color:get() == "Default" and v947.color.default or v116.item.ninjatsu_indicators_color:get() == "Sigma" and v947.color.sigma or nil;
        local v980 = render.screen_size();
        local v981 = v980.x / 2 - 40;
        local v982 = v980.y / 2 - 90;
        if v116.item.ninjatsu_indicators_extras:get(2) then
            v947.display_hud();
        end;
        v947.render(v981, v982, v975 and not v977, v947.image.doubletap_fade, v947.image.doubletap_text, v979 ~= nil and v979.doubletap or v116.item.ninjatsu_indicators_doubletap:get(), 1);
        v947.render(v981, v982, v976, v947.image.hideshots_fade, v947.image.hideshots_text, v979 ~= nil and v979.hideshots or v116.item.ninjatsu_indicators_hideshots:get(), 2);
        v947.render(v981, v982, v977, v947.image.quickpeek_fade, v947.image.quickpeek_text, v979 ~= nil and v979.quickpeek or v116.item.ninjatsu_indicators_quickpeek:get(), 3);
        v947.render(v981, v982, v974, v947.image.fakeduck_fade, v947.image.fakeduck_text, v979 ~= nil and v979.fakeduck or v116.item.ninjatsu_indicators_fakeduck:get(), 4);
        v947.render(v981, v982, v978, v947.image.slowwalk_fade, v947.image.slowwalk_text, v979 ~= nil and v979.slowwalk or v116.item.ninjatsu_indicators_slowwalk:get(), 5);
        if v116.item.ninjatsu_indicators_enable:get(2) and v947.player_death.zeus == true then
            local v983 = render.world_to_screen(vector(v947.player_death.origin[1], v947.player_death.origin[2], v947.player_death.origin[3]));
            if v983 ~= nil then
                v947.render(v983.x - 60, v983.y - 120, globals.realtime - v947.player_death.time_on_zeus_kill < 2, v947.image.zeus_fade, v947.image.zeus_text, v979 ~= nil and v979.zeus or v116.item.ninjatsu_indicators_zeus:get(), 6);
            end;
        end;
        if v116.item.ninjatsu_indicators_enable:get(1) and v947.player_death.knife == true then
            local v984 = render.world_to_screen(vector(v947.player_death.origin[1], v947.player_death.origin[2], v947.player_death.origin[3]));
            if v984 ~= nil then
                v947.render(v984.x - 60, v984.y - 120, globals.realtime - v947.player_death.time_on_knife_kill < 2, v947.image.knife_fade, v947.image.knife_text, v979 ~= nil and v979.knife or v116.item.ninjatsu_indicators_knife:get(), 7);
            end;
        end;
        return;
    end;
end;
v947.ui = function()
    -- upvalues: v116 (ref)
    v116.item.ninjatsu_indicators_sound:visibility(files.get_crc32("csgo\\sound\\naruto.mp3") and files.get_crc32("csgo\\sound\\sekiro.mp3") and true or false);
    v116.item.ninjatsu_indicators_volume:visibility(v116.item.ninjatsu_indicators_sound:get() ~= "Disabled" and (files.get_crc32("csgo\\sound\\naruto.mp3") and files.get_crc32("csgo\\sound\\sekiro.mp3") and true or false));
    v116.item.ninjatsu_indicators_doubletap:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom");
    v116.item.ninjatsu_indicators_hideshots:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom");
    v116.item.ninjatsu_indicators_quickpeek:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom");
    v116.item.ninjatsu_indicators_fakeduck:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom");
    v116.item.ninjatsu_indicators_slowwalk:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom");
    v116.item.ninjatsu_indicators_zeus:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom" and (v116.item.ninjatsu_indicators_enable:get(2) and true or false));
    v116.item.ninjatsu_indicators_knife:visibility(v116.item.ninjatsu_indicators_color:get() == "Custom" and (v116.item.ninjatsu_indicators_enable:get(1) and true or false));
end;
v116.item.ninjatsu_indicators_color:set_callback(v947.ui, true);
v116.item.ninjatsu_indicators_sound:set_callback(v947.ui, true);
v116.item.ninjatsu_indicators_enable:set_callback(v947.ui, true);
events.player_death:set(function(v985)
    -- upvalues: v947 (ref)
    if not entity.get(v985.attacker, true) == entity.get_local_player() then
        return;
    else
        local v986 = entity.get(v985.userid, true);
        if v985.weapon == "taser" then
            local l_x_12 = v986.m_vecOrigin.x;
            local l_y_11 = v986.m_vecOrigin.y;
            local l_z_0 = v986.m_vecOrigin.z;
            v947.player_death.id = v985.userid;
            v947.player_death.time_on_zeus_kill = globals.realtime;
            v947.player_death.origin = {
                [1] = l_x_12, 
                [2] = l_y_11, 
                [3] = l_z_0
            };
            v947.player_death.zeus = true;
        end;
        if string.find(v985.weapon, "knife") then
            local l_x_13 = v986.m_vecOrigin.x;
            local l_y_12 = v986.m_vecOrigin.y;
            local l_z_1 = v986.m_vecOrigin.z;
            v947.player_death.id = v985.userid;
            v947.player_death.time_on_knife_kill = globals.realtime;
            v947.player_death.origin = {
                [1] = l_x_13, 
                [2] = l_y_12, 
                [3] = l_z_1
            };
            v947.player_death.knife = true;
        end;
        return;
    end;
end);
local v1001 = {
    warning = render.load_image_from_file("materials/panorama/images/icons/ui/warning.svg", vector(35, 35)), 
    rgb_health_based = function(v993)
        return 248 - 124 * v993, 195 * v993, 13;
    end, 
    remap = function(v994, v995, v996, v997, v998, v999)
        if not v997 then
            v997 = 0;
        end;
        if not v998 then
            v998 = 1;
        end;
        local v1000 = (v994 - v997) / (v998 - v997);
        if v999 ~= false then
            v1000 = math.min(1, math.max(0, v1000));
        end;
        return v995 + (v996 - v995) * v1000;
    end, 
    interval = 0
};
v1001.drawBar = function(v1002, v1003, v1004, v1005, v1006, v1007)
    -- upvalues: v1001 (ref)
    v1001.interval = v1001.interval + (1 - v1002) * 0.7 + 0.3;
    local v1008 = math.abs(v1001.interval * 0.01 % 2 - 1) * 255;
    local v1009 = 95;
    local l_x_14 = render.screen_size().x;
    local l_y_13 = render.screen_size().y;
    local v1012 = l_x_14 / 2 - v1009;
    local v1013 = l_y_13 * 0.35;
    local l_width_0 = v1001.warning.width;
    local l_height_0 = v1001.warning.height;
    render.texture(v1001.warning, vector(v1012 - 3, v1013 - 4), vector(l_width_0 + 6, l_height_0 + 6), color(16, 16, 16, 255 * v1006));
    if v1006 > 0.7 then
        render.rect(vector(v1012 + 13, v1013 + 11), vector(v1012 + 21, v1013 + 31), color(16, 16, 16, 255 * v1006));
    end;
    render.texture(v1001.warning, vector(v1012, v1013), vector(l_width_0, l_height_0), color(v1003, v1004, v1005, v1008 * v1006));
    render.text(4, vector(v1012 + l_width_0 + 8, v1013 + 3), color(255, 255, 255, 255 * v1006), nil, string.format("%s %d%%", v1007, v1002 * 100));
    local v1016 = v1012 + l_width_0 + 8;
    local v1017 = v1013 + 3 + 17;
    local l_v1009_0 = v1009;
    local v1019 = 12;
    render.rect_outline(vector(v1016, v1017), vector(v1016 + l_v1009_0 - 1, v1017 + v1019 - 1), color(0, 0, 0, 255 * v1006), 1);
    render.rect(vector(v1016 + 1, v1017 + 1), vector(v1016 + l_v1009_0 - 2, v1017 + v1019 - 2), color(16, 16, 16, 180 * v1006));
    render.rect(vector(v1016 + 1, v1017 + 1), vector(v1016 + math.floor((l_v1009_0 - 2) * v1002), v1017 + v1019 - 2), color(v1003, v1004, v1005, 180 * v1006));
end;
v1001.main = function()
    -- upvalues: v116 (ref), v1001 (ref)
    if not v116.item.velocity_warning_switch:get() then
        return;
    else
        local v1020 = entity.get_local_player();
        if not v1020 or not v1020:is_alive() then
            return;
        else
            local l_m_flVelocityModifier_0 = v1020.m_flVelocityModifier;
            if l_m_flVelocityModifier_0 == 1 then
                return;
            else
                local v1022, v1023, v1024 = v1001.rgb_health_based(l_m_flVelocityModifier_0);
                local v1025 = v1001.remap(l_m_flVelocityModifier_0, 1, 0, 0.85, 1);
                v1001.drawBar(l_m_flVelocityModifier_0, v1022, v1023, v1024, v1025, "Slowed down");
                return;
            end;
        end;
    end;
end;
local v1026 = {
    default_img = render.load_image("<svg id=\"svg\" version=\"1.1\" width=\"608\" height=\"689\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" ><g id=\"svgg\"><path id=\"path0\" d=\"M185.803 18.945 C 184.779 19.092,182.028 23.306,174.851 35.722 C 169.580 44.841,157.064 66.513,147.038 83.882 C 109.237 149.365,100.864 163.863,93.085 177.303 C 88.686 184.901,78.772 202.072,71.053 215.461 C 63.333 228.849,53.959 245.069,50.219 251.505 C 46.480 257.941,43.421 263.491,43.421 263.837 C 43.421 264.234,69.566 264.530,114.025 264.635 L 184.628 264.803 181.217 278.618 C 179.342 286.217,174.952 304.128,171.463 318.421 C 167.974 332.714,160.115 364.836,153.999 389.803 C 147.882 414.770,142.934 435.254,143.002 435.324 C 143.127 435.452,148.286 428.934,199.343 364.145 C 215.026 344.243,230.900 324.112,234.619 319.408 C 238.337 314.704,254.449 294.276,270.423 274.013 C 286.397 253.750,303.090 232.582,307.519 226.974 C 340.870 184.745,355.263 166.399,355.263 166.117 C 355.263 165.937,323.554 165.789,284.798 165.789 C 223.368 165.789,214.380 165.667,214.701 164.831 C 215.039 163.949,222.249 151.366,243.554 114.474 C 280.604 50.317,298.192 19.768,298.267 19.444 C 298.355 19.064,188.388 18.576,185.803 18.945 \" stroke=\"none\" fill=\"#fff200\" fill-rule=\"evenodd\"></path></g></svg>", vector(50, 50))
};
v1026.load_image = function(v1027)
    -- upvalues: v1026 (ref)
    local v1028 = files.get_crc32("nl\\bettervisuals\\mjolnir_img.png");
    if v1027 or v1028 == -1808745910 then
        v1026.mjolnir_img = render.load_image_from_file("nl\\bettervisuals\\mjolnir_img.png", vector(250, 250));
    elseif v1028 ~= -1808745910 then
        v1026.downloaded_file_error = true;
    end;
end;
v1026.load_image();
v1026.download_image = function()
    -- upvalues: v1026 (ref)
    if v1026.downloaded_file_error then
        network.get("https://i.imgur.com/D5qFJkN.png", {}, function(v1029)
            -- upvalues: v1026 (ref)
            if v1029 then
                files.create_folder("nl\\bettervisuals");
                files.write("nl\\bettervisuals\\mjolnir_img.png", v1029, true);
                v1026.load_image(true);
            end;
        end);
    end;
end;
v1026.download_image();
v1026.main = function()
    -- upvalues: v116 (ref), v45 (ref), v1026 (ref)
    if not v116.item.zeus_warning_switch:get() then
        return;
    else
        local v1030 = v45();
        if not v1030 then
            return;
        else
            local v1031 = v116.item.zeus_warning_combo:get() == "Default" and v1026.default_img or v1026.mjolnir_img;
            local v1032 = v116.item.zeus_warning_slider:get();
            local v1033 = v116.item.zeus_warning_combo:get() == "Default" and vector(10, 0) or vector(15, 5);
            local _ = entity.get_players(false, false, function(v1034)
                -- upvalues: v1030 (ref), v1031 (ref), v1032 (ref), v1033 (ref)
                if v1034.m_iTeamNum ~= v1030.m_iTeamNum and v1034:is_alive() then
                    local l_pos1_0 = v1034:get_bbox().pos1;
                    local l_pos2_0 = v1034:get_bbox().pos2;
                    local v1037 = v1034:get_bbox().alpha * 255;
                    if l_pos1_0 and l_pos2_0 then
                        local l_x_15 = l_pos1_0.x;
                        local l_y_14 = l_pos1_0.y;
                        local _ = l_pos2_0.x;
                        local _ = l_pos2_0.y;
                        local v1042 = v1034:get_player_weapon();
                        local v1043 = v1042 and v1042:get_weapon_index() or 0;
                        local v1044 = 0;
                        local v1045 = v1034:get_player_weapon(true);
                        for v1046 = 1, #v1045 do
                            if v1045[v1046]:get_weapon_index() == 31 then
                                v1044 = 1;
                            end;
                        end;
                        if v1043 == 31 then
                            v1044 = 2;
                        end;
                        local v1047 = 255;
                        local v1048 = 255;
                        if v1044 == 2 then
                            local v1049 = 0;
                            v1048 = 0;
                            v1047 = v1049;
                        end;
                        if v1044 > 0 then
                            render.texture(v1031, vector(l_x_15 - v1032 / 2 - v1033.x, l_y_14 - v1033.y), vector(v1032, v1032), color(255, v1047, v1048, v1037));
                        end;
                    end;
                end;
            end);
            return;
        end;
    end;
end;
local v1051 = {};
v1051.manage_font = function()
    -- upvalues: v116 (ref), v1051 (ref)
    if v116.item.damage_indicator_font_combo:get() == "Verdana" or v116.item.damage_indicator_font_combo:get() == "Tahoma" then
        local v1052 = ("%s%s%s%s%s"):format(v116.item.damage_indicator_font_flags:get(1) and "a" or "", v116.item.damage_indicator_font_flags:get(2) and "b" or "", v116.item.damage_indicator_font_flags:get(3) and "i" or "", v116.item.damage_indicator_font_flags:get(4) and "o" or "", v116.item.damage_indicator_font_flags:get(5) and "d" or "");
        v1051.font = render.load_font(v116.item.damage_indicator_font_combo:get(), v116.item.damage_indicator_font_size:get(), v1052);
    else
        v1051.font = v116.item.damage_indicator_font_combo:get() == "Default" and 1 or v116.item.damage_indicator_font_combo:get() == "Small" and 2 or 3;
    end;
    v1051.font2 = render.load_font("Verdana", 13, "b");
end;
v116.item.damage_indicator_font_combo:set_callback(v1051.manage_font);
v116.item.damage_indicator_font_flags:set_callback(v1051.manage_font);
v116.item.damage_indicator_font_size:set_callback(v1051.manage_font);
v1051.manage_font();
v1051.shot_data = {};
v1051.main = function()
    -- upvalues: v116 (ref), v1051 (ref)
    if not v116.item.damage_indicator_switch:get() then
        return;
    else
        if v116.item.damage_indicator_style:get() == "GS" then
            for v1053 = 1, #v1051.shot_data do
                local v1054 = v1051.shot_data[v1053];
                if v1054.time > globals.realtime then
                    local v1055 = render.world_to_screen(vector(v1054.x, v1054.y, v1054.z));
                    if v1055 ~= nil then
                        render.text(v1051.font, vector(v1055.x, v1055.y), color(v1054.color.r, v1054.color.g, v1054.color.b, v1054.alpha), "cs", tostring(v1054.damage));
                    end;
                    v1054.alpha = (v1054.time - 1.65 - globals.realtime) * 500;
                    v1054.z = v1054.z + 0.1;
                end;
            end;
        else
            for v1056 = 1, #v1051.shot_data do
                local v1057 = v1051.shot_data[v1056];
                if v1057.time > globals.realtime then
                    local v1058 = render.world_to_screen(vector(v1057.x, v1057.y, v1057.z));
                    if v1058 ~= nil then
                        render.text(v1051.font2, vector(v1058.x, v1058.y - 16), color(255, 255, 255, v1057.alpha), "sc", tostring(v1057.damage));
                        render.line(vector(v1058.x - 8, v1058.y - 8), vector(v1058.x - 2, v1058.y - 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x - 8, v1058.y + 8), vector(v1058.x - 2, v1058.y + 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x + 8, v1058.y - 8), vector(v1058.x + 2, v1058.y - 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x + 8, v1058.y + 8), vector(v1058.x + 2, v1058.y + 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x - 8, v1058.y - 8), vector(v1058.x - 2, v1058.y - 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x - 8, v1058.y + 8), vector(v1058.x - 2, v1058.y + 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x + 8, v1058.y - 8), vector(v1058.x + 2, v1058.y - 2), color(255, 255, 255, v1057.alpha));
                        render.line(vector(v1058.x + 8, v1058.y + 8), vector(v1058.x + 2, v1058.y + 2), color(255, 255, 255, v1057.alpha));
                    end;
                    v1057.alpha = (v1057.time - globals.realtime) * 255;
                end;
            end;
        end;
        return;
    end;
end;
events.aim_ack:set(function(v1059)
    -- upvalues: v116 (ref), v1051 (ref)
    if not v116.item.damage_indicator_switch:get() then
        return;
    elseif v1059.state ~= nil then
        return;
    else
        local l_x_17 = v1059.aim.x;
        local l_y_16 = v1059.aim.y;
        local l_z_2 = v1059.aim.z;
        v1051.shot_data[#v1051.shot_data + 1] = {
            alpha = 255, 
            x = l_x_17, 
            y = l_y_16, 
            z = l_z_2, 
            damage = v1059.damage, 
            time = globals.realtime + 2.75, 
            color = v1059.hitgroup == 1 and v116.item.damage_indicator_head_color:get() or v116.item.damage_indicator_body_color:get()
        };
        return;
    end;
end);
events.player_hurt:set(function(v1063)
    -- upvalues: v116 (ref), v1051 (ref)
    if not v116.item.damage_indicator_switch:get() or not v116.item.damage_indicator_style:get(1) then
        return;
    else
        local v1064 = entity.get_local_player();
        local v1065 = entity.get(v1063.attacker, true);
        local v1066 = entity.get(v1063.userid, true);
        if v1064 ~= v1065 or v1064 == v1066 or v1063.hitgroup ~= 0 then
            return;
        else
            local l_x_18 = v1066:get_origin().x;
            local l_y_17 = v1066:get_origin().y;
            local l_z_3 = v1066:get_origin().z;
            v1051.shot_data[#v1051.shot_data + 1] = {
                alpha = 255, 
                x = l_x_18, 
                y = l_y_17, 
                z = l_z_3, 
                damage = v1063.dmg_health, 
                time = globals.realtime + 2.75, 
                color = v116.item.damage_indicator_grenade_color:get()
            };
            return;
        end;
    end;
end);
events.round_start:set(function()
    -- upvalues: v1051 (ref)
    v1051.shot_data = {};
end);
v1051.ui = function()
    -- upvalues: v116 (ref)
    v116.item.damage_indicator_font_combo:visibility(v116.item.damage_indicator_style:get() == "GS");
    v116.item.damage_indicator_font_flags:visibility(v116.item.damage_indicator_style:get() == "GS" and v116.item.damage_indicator_font_combo:get() ~= "Default" and v116.item.damage_indicator_font_combo:get() ~= "Small" and v116.item.damage_indicator_font_combo:get() ~= "Console");
    v116.item.damage_indicator_font_size:visibility(v116.item.damage_indicator_style:get() == "GS" and v116.item.damage_indicator_font_combo:get() ~= "Default" and v116.item.damage_indicator_font_combo:get() ~= "Small" and v116.item.damage_indicator_font_combo:get() ~= "Console");
    v116.item.damage_indicator_head_color:visibility(v116.item.damage_indicator_style:get() == "GS");
    v116.item.damage_indicator_body_color:visibility(v116.item.damage_indicator_style:get() == "GS");
    v116.item.damage_indicator_grenade_color:visibility(v116.item.damage_indicator_style:get() == "GS");
end;
v116.item.damage_indicator_style:set_callback(v1051.ui, true);
v116.item.damage_indicator_font_combo:set_callback(v1051.ui, true);
local v1070 = {};
v1070.manage_font = function()
    -- upvalues: v116 (ref), v1070 (ref)
    if v116.item.spectator_list_font_combo:get() == "Verdana" or v116.item.spectator_list_font_combo:get() == "Tahoma" then
        local v1071 = ("%s%s%s%s%s"):format(v116.item.spectator_list_font_flags:get(1) and "a" or "", v116.item.spectator_list_font_flags:get(2) and "b" or "", v116.item.spectator_list_font_flags:get(3) and "i" or "", v116.item.spectator_list_font_flags:get(4) and "o" or "", v116.item.spectator_list_font_flags:get(5) and "d" or "");
        v1070.font = render.load_font(v116.item.spectator_list_font_combo:get(), v116.item.spectator_list_font_size:get(), v1071);
    else
        v1070.font = v116.item.spectator_list_font_combo:get() == "Default" and 1 or v116.item.spectator_list_font_combo:get() == "Small" and 2 or 3;
    end;
end;
v116.item.spectator_list_font_combo:set_callback(v1070.manage_font);
v116.item.spectator_list_font_flags:set_callback(v1070.manage_font);
v116.item.spectator_list_font_size:set_callback(v1070.manage_font);
v1070.manage_font();
v1070.main = function()
    -- upvalues: v116 (ref), v45 (ref), v1070 (ref)
    if not v116.item.spectator_list_switch:get() then
        return;
    else
        local v1072 = v45();
        if not v1072 then
            return;
        else
            local v1073 = v1072:get_spectators() or {};
            local v1074 = 0;
            local v1075 = render.screen_size();
            render_spectators = function(v1076)
                -- upvalues: v116 (ref), v1070 (ref), v1074 (ref), v1075 (ref)
                if v116.item.spectator_list_position:get() == "Top-Left" then
                    render.text(v1070.font, vector(10, 10 + v1074), color(), "s", v1076);
                    v1074 = v1074 + 16;
                elseif v116.item.spectator_list_position:get() == "Top-Right" then
                    local v1077 = render.measure_text(v1070.font, "s", v1076);
                    render.text(v1070.font, vector(v1075.x - 10 - v1077.x, 10 + v1074), color(), "s", v1076);
                    v1074 = v1074 + 16;
                elseif v116.item.spectator_list_position:get() == "Bottom-Left" then
                    render.text(v1070.font, vector(10, v1075.y - 55 + v1074), color(), "s", v1076);
                    v1074 = v1074 - 16;
                elseif v116.item.spectator_list_position:get() == "Bottom-Right" then
                    local v1078 = render.measure_text(v1070.font, "s", v1076);
                    render.text(v1070.font, vector(v1075.x - 10 - v1078.x, v1075.y - 55 + v1074), color(), "s", v1076);
                    v1074 = v1074 - 16;
                end;
            end;
            for v1079 = 1, #v1073 do
                render_spectators(v1073[v1079]:get_name());
            end;
            return;
        end;
    end;
end;
v116.item.spectator_list_font_combo:set_callback(function()
    -- upvalues: v116 (ref)
    v116.item.spectator_list_font_size:visibility(v116.item.spectator_list_font_combo:get() ~= "Default" and v116.item.spectator_list_font_combo:get() ~= "Small" and v116.item.spectator_list_font_combo:get() ~= "Console");
    v116.item.spectator_list_font_flags:visibility(v116.item.spectator_list_font_combo:get() ~= "Default" and v116.item.spectator_list_font_combo:get() ~= "Small" and v116.item.spectator_list_font_combo:get() ~= "Console");
end, true);
local v1080 = {};
v1080.manage_font = function()
    -- upvalues: v116 (ref), v1080 (ref)
    if v116.item.min_dmg_indicator_font_combo:get() == "Verdana" or v116.item.min_dmg_indicator_font_combo:get() == "Tahoma" then
        local v1081 = ("%s%s%s%s%s"):format(v116.item.min_dmg_indicator_font_flags:get(1) and "a" or "", v116.item.min_dmg_indicator_font_flags:get(2) and "b" or "", v116.item.min_dmg_indicator_font_flags:get(3) and "i" or "", v116.item.min_dmg_indicator_font_flags:get(4) and "o" or "", v116.item.min_dmg_indicator_font_flags:get(5) and "d" or "");
        v1080.font = render.load_font(v116.item.min_dmg_indicator_font_combo:get(), v116.item.min_dmg_indicator_font_size:get(), v1081);
    else
        v1080.font = v116.item.min_dmg_indicator_font_combo:get() == "Default" and 1 or v116.item.min_dmg_indicator_font_combo:get() == "Small" and 2 or 3;
    end;
end;
v116.item.min_dmg_indicator_font_combo:set_callback(v1080.manage_font);
v116.item.min_dmg_indicator_font_flags:set_callback(v1080.manage_font);
v116.item.min_dmg_indicator_font_size:set_callback(v1080.manage_font);
v1080.manage_font();
v1080.main = function()
    -- upvalues: v116 (ref), v51 (ref), v8 (ref), v1080 (ref)
    if v116.item.min_dmg_indicator_style:get() == "Disabled" then
        return;
    elseif not entity.get_local_player() then
        return;
    elseif not entity.get_local_player():is_alive() then
        return;
    else
        local v1082 = v51("Min. Damage");
        if v116.item.min_dmg_indicator_style:get() == "Default Style" then
            local v1083 = vector(render.screen_size().x / 2 + v116.item.min_dmg_indicator_x:get(), render.screen_size().y / 2 + v116.item.min_dmg_indicator_y:get());
            local v1084 = v116.item.min_dmg_indicator_always_show:get() and tostring(v8.MinimumDamage:get()) or v1082.state and v1082.value or nil;
            if v1084 then
                render.text(v1080.font, v1083, color(), "s", v1084);
            end;
        elseif v116.item.min_dmg_indicator_style:get() == "Kibit Style" then
            local v1085 = render.measure_text(v1080.font, "s", tostring(v8.MinimumDamage:get()));
            local v1086 = vector(render.screen_size().x / 2 - v1085.x / 2 + v116.item.min_dmg_indicator_x:get(), render.screen_size().y / 2 - 45 + v116.item.min_dmg_indicator_y:get());
            local v1087 = vector(render.screen_size().x / 2 + v116.item.min_dmg_indicator_x:get() - v116.item.min_dmg_indicator_spacing:get(), render.screen_size().y / 2 - 45 + v116.item.min_dmg_indicator_y:get());
            local v1088 = tostring(v8.MinimumDamage:get());
            render.text(v1080.font, v1086, color(), "s", v1088);
            local v1089 = v1082.state and "1" or "0";
            render.text(v1080.font, v1087, color(), "s", v1089);
        end;
        return;
    end;
end;
v1080.ui = function()
    -- upvalues: v116 (ref)
    v116.item.min_dmg_indicator_font_size:visibility(v116.item.min_dmg_indicator_font_combo:get() ~= "Default" and v116.item.min_dmg_indicator_font_combo:get() ~= "Small" and v116.item.min_dmg_indicator_font_combo:get() ~= "Console");
    v116.item.min_dmg_indicator_font_flags:visibility(v116.item.min_dmg_indicator_font_combo:get() ~= "Default" and v116.item.min_dmg_indicator_font_combo:get() ~= "Small" and v116.item.min_dmg_indicator_font_combo:get() ~= "Console");
    v116.item.min_dmg_indicator_spacing:visibility(v116.item.min_dmg_indicator_style:get() == "Kibit Style");
    v116.item.min_dmg_indicator_always_show:visibility(v116.item.min_dmg_indicator_style:get() == "Default Style");
end;
v116.item.min_dmg_indicator_font_combo:set_callback(v1080.ui, true);
v116.item.min_dmg_indicator_style:set_callback(v1080.ui, true);
local v1090 = {
    alpha = 0, 
    total_shot = 0, 
    hit_shot = 0, 
    spacing = 0, 
    cl_lagcompensation = cvar.cl_lagcompensation, 
    value = {}, 
    condition = {}, 
    color = {}, 
    c4_results = {}
};
v1090.c4_info = {
    last_beep_diff = 1, 
    last_beep = 0, 
    last_site = "", 
    planting_time = 3.125, 
    mp_c4timer = cvar.mp_c4timer, 
    reset = function(v1091, _)
        -- upvalues: v1090 (ref)
        v1091.last_site = "";
        v1091.last_beep = 0;
        v1091.last_beep_diff = 1;
        v1091.planting_site = nil;
        v1091.planting_started_at = nil;
        v1091.planting_player = nil;
        v1090.c4_results = {
            type = -1
        };
    end, 
    beep = function(v1093, _)
        v1093.last_beep_diff = math.clamp(globals.curtime - v1093.last_beep, 0, 1);
        v1093.last_beep = globals.curtime;
    end, 
    begin_plant = function(v1095, v1096)
        local v1097 = entity.get_player_resource();
        if not v1097 then
            return;
        else
            local l_m_bombsiteCenterA_0 = v1097.m_bombsiteCenterA;
            local l_m_bombsiteCenterB_0 = v1097.m_bombsiteCenterB;
            local v1100 = entity.get(v1096.site);
            if not v1100 then
                return;
            else
                local v1101 = v1100.m_vecMins:lerp(v1100.m_vecMaxs, 0.5);
                v1095.planting_site = v1101:distsqr(l_m_bombsiteCenterA_0) < v1101:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                v1095.planting_started_at = globals.curtime;
                v1095.planting_player = entity.get(v1096.userid, true);
                v1095.last_site = v1095.planting_site;
                return;
            end;
        end;
    end, 
    damage_apply_armor = function(_, v1103, v1104)
        local v1105 = 0.5;
        local v1106 = 0.5;
        if v1104 > 0 then
            local v1107 = v1103 * v1105;
            if v1104 < (v1103 - v1107) * v1106 then
                v1107 = v1103 - v1104 * (1 / v1106);
            end;
            v1103 = v1107;
        end;
        return v1103;
    end, 
    calculate_damage = function(v1108, v1109, v1110, v1111)
        local v1112 = v1109:get_eye_position():dist(v1110:get_origin());
        local v1113 = common.get_map_data().shortname == "de_inferno" and 620 or 500;
        local v1114 = v1113 * 3.5;
        v1113 = v1113 * math.exp(-(v1112 * v1112 / (v1114 * 2 / 3 * (v1114 / 3))));
        return (math.floor(v1108:damage_apply_armor(math.max(v1113, 0), v1111)));
    end, 
    get_active_bomb = function(v1115, v1116)
        -- upvalues: v1090 (ref)
        local v1117 = v1116 or entity.get_local_player();
        if not v1117 then
            return;
        else
            local l_m_ArmorValue_0 = v1117.m_ArmorValue;
            local l_m_iHealth_1 = v1117.m_iHealth;
            if v1115.planting_player then
                local v1120 = (globals.curtime - v1115.planting_started_at) / v1115.planting_time;
                if v1120 > 0 and v1120 < 1 then
                    if entity.get_game_rules().m_bBombPlanted == 1 then
                        return;
                    else
                        v1090.c4_results = {
                            type = 1, 
                            site = v1115.planting_site, 
                            percentage = v1120, 
                            planting_started_at = v1115.planting_started_at
                        };
                    end;
                end;
            else
                entity.get_entities("CPlantedC4", true, function(v1121)
                    -- upvalues: v1115 (ref), v1117 (ref), l_m_ArmorValue_0 (ref), l_m_iHealth_1 (ref), v1090 (ref)
                    local l_m_bBombDefused_0 = v1121.m_bBombDefused;
                    local l_m_hBombDefuser_0 = v1121.m_hBombDefuser;
                    local l_m_flC4Blow_0 = v1121.m_flC4Blow;
                    local v1125 = v1121.m_nBombSite == 0 and "A" or "B";
                    local v1126 = l_m_flC4Blow_0 - globals.curtime;
                    local v1127 = false;
                    local v1128 = false;
                    local v1129 = -1;
                    local v1130 = -1;
                    local v1131 = -1;
                    local v1132 = -1;
                    if not l_m_bBombDefused_0 and v1126 >= 0 then
                        if l_m_hBombDefuser_0 then
                            v1130 = v1121.m_flDefuseLength;
                            v1131 = v1121.m_flDefuseCountDown - globals.curtime;
                            if v1131 > 0 then
                                v1127 = v1131 < v1126;
                                v1129 = render.screen_size().y / v1130 * v1131;
                            end;
                        end;
                        v1132 = v1115:calculate_damage(v1117, v1121, l_m_ArmorValue_0);
                        if v1117:is_alive() and v1132 >= 1 and l_m_iHealth_1 <= v1132 then
                            v1128 = true;
                        end;
                    end;
                    v1090.c4_results = {
                        type = l_m_bBombDefused_0 == false and 2 or -1, 
                        site = v1125, 
                        damage = v1132, 
                        fatal = v1128, 
                        defuser = l_m_hBombDefuser_0, 
                        defused = l_m_bBombDefused_0, 
                        defusetimer = v1131, 
                        time_left = v1126, 
                        time_for_defuse = v1127, 
                        barlength = v1129
                    };
                end);
            end;
            return;
        end;
    end
};
local v1133 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000!\000\000\000\015\b\006\000\000\000jB\166)\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001!IDATx\218\188U\129\017\131 \fL\189.\192\nv\004;\002\142\208\021t\004;\002\142`Wp\004\028\193\142\160#\212\017l\232A/\151\162\208\179\246\239rbx \132<\192<\207r\014C\000\002\191\205\nG\161e\192`\198\162Uh\015\1987\190\212\145\138/\130\024\"\184\005\t \r\140\209\134\151\176\192\187\131\031\019|\"w\157\216n\137\191y\239\016@\161\185\246\141\240\207\230\031m\242eB\195\n\216\174$\235\163\233\174<>\1774o\002\191\195\221\227\163\vg\255\b\"\020\152v\025\218%\b\155j\186\211\209~kFUDI)\157 \164\142~\173&\172\0045\241\015,@\185\162\144\203\214 |\024|w\005Y\167\247\140I\183\168\131/^E\030\157d\170Q[j\"'\247\200\t\173\142\025\132\188\142\213\138\216[\029K\160\210\029w\v\194\212\134M{E\149`\139\177 \212\246\184\243n\133\189\186\141$}\156\018\143\231\149\t\250.L\129\137\163\185\246\236K\246\1748\\\205\251\129\028\243~\192S\128\001\000\rxZ\242\129_\190u\000\000\000\000IEND\174B`\130", vector(33, 15));
local v1134 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\030\000\000\000\015\b\006\000\000\000\243\186\127\156\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001&IDATx\218\172T\129\r\1300\016,l\192\n]\001G\208\017p\004\029\001fq\004\029\161\140\128#\192\b:B\253O\218\228x\030|\140\1514\225\233\245\175\127m\2239\0051\198c\156#\184\021(\\\137\1509\206\002\"\222\149\004\245\n\247\018m\b4\170\188\174T\018\241d\147\194\t\166\026\195\158\251\002@\241\021rp\213a\171Z\172\160\129\239\209\192\015Z!\188\0228\1515\225\144\b/\017G\237\172\190\t+\156aau\1789'\191e\251\128b\187$K<\224\187f\029y\198h\195Sl@\206\155A\199\253\022\247e!\156/\208\155\200\015X\1487\193\231\213\184?\160\004\155=\219\160X#\227_\133+UX$\2367\132\143\248\030\141}\161BarqZ\019\1585\016\138G\177\243\189U/\138*\211\142j\176yo\"K\181\173t\175T\018u\133\002\250\127\216kwj\022\252n}\022\165T7$`g\241\027\137\006l\254;{\245}v\185\146\144\135^;\025\027\129W\250\185\004?\197\142\198\137\242\158q\226#\192\000yH\142\218\021\017\213\144\000\000\000\000IEND\174B`\130", vector(30, 15));
local v1135 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\022\000\000\000\015\b\006\000\000\000\224m?h\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\000\197IDATx\218b\248\255\255\127\232\127\004X\197@$\000\170-\a\2263\255Q\001\136_\014\146g\001bA$\245\130D\024h\f\164@\014P\194\"\r\1463\006\170\017db \001\0005\128\f\219\141d\232j Vf\132\002 ;\029\136\247\192\020\167!ye7\001\131g\018\027lL$\184\022\020LiHB\157T1\024\b\\\144\216\239\129>?K-\131\145#\235,!\197$E\030)`\208\025,HM\131\247 g\004h\154\166\220`h*\184\135$\212A\205\160\168@b\131\202\152U\200.\135\150; \177\153\2329\015\027x\135\150Q\b\169\255\0153\216\133\020\131ae\006\180t{\135\166v7\172t\003\b0\000~\137\255fT\r\170r\000\000\000\000IEND\174B`\130", vector(22, 15));
local v1136 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\161\000\000\000\015\b\006\000\000\000\140G\175(\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\003\228IDATx\218\228Y\139\145\1630\fu\210\001W\002[\002[\002\148\192\150@J %@\t\161\132\163\132PB(!)!.\12937rNQ$\127\200w\2304\195\236\1986\150\245\252$\217BM\211t\152\254I\166\136\152\182\196<g\232?\147\190\155wI\155O~3\186j\164\2392\206<\021\026\215\160\190Z1b\218\247.\187\024\219&\248?Q\130\152\190#\025\203\225U\1621\1650O\t6Md\190\217\246TX\027'\a\021(\243\1880\255Q\208\155\145\241;\031\198h\157V\142\208\150{\214}\177\147\0036\023\022\127\017\199\166\228\247\144\144l\158$e(@>\187`L\205\001\228\216D*{f\\\133\250+f\195\246!\196\018\244-\"a \182W\182\019l\014\142\185\241\184\029\131\129$\023'^\171\a\203j\181\250^!1M\029\234\222\174\174\229\199\130d\254\224\168\216\1469\182\2309\169\199\139\141T'\166-Dr\137\224\130\204\164\181\227G\243\020\200\198\130`Eq\229\228;\132\128\004\219-\193\182E}\r\138\222x-\153\148M\144=\179\fL\255\128t}\1611s\198i\158\018\t\153\247c\163V\029\000\236\221\145\144\216U\147\b\158z\198\031\164h(EB\210~t\165}\031\238\017)\152\166\244J\024\215\208\148\202\028ijO*>\v\182\238}v\173\213\155\005<\207n\1866\014\211\190HuI<\184\143\136\134#\242\232\220\017%\176`\002t\198N\253\"\027-\217OF\167\020i1\230)\178g\240`\130\219\186\192Ly\162D~;\t\231P\239\t\231\207&\225h\128\025\003\000wm\\\229\139Ho\178\019\235\236\029\196\208\224X4\197\210\148\156F\166b\014\v\188\1669\232\232O#\225\248\162\232\155!\189\003l\196\136\244g\190\232f\198\015\b\248\138K\225\130\141VW\236\154o\014\246\001\175\2255\249\"\175\022\200\201f\bp\172\028\145i\b\196}G\029\153\146\240\230\230f\218\142\234\179\165\225\174^d\003\\i\164\023\18896\026\214\031\136M\f\t%\1450\201Q\170\239<\1517\187'\a\228\144\173=z\173\213\255)%:'\141\002!\171\128\243ML4\188\183\234@\229W\192k\152x\201B\213=I\201\t\147\138\251\2009\231\027\250\214\254\160$,\168\165p\173~\166\220\v\212\150\171]H%\029\184)\167\028x@H\251^\018X~\t\137\134\1549#\190BN\017\216\166\220{LJ\174<\142\204\150h\128G#\202^\141D\194w\200\184\176F\183T0\177jO\026/\003\"\212\128\210Q\197m6l\146~\177\157J\184l\176\229 b\247\224H\201\1826\154\196DA\184\021\255\016\236\211O!aO\202\003\207>[U\017c\203\192\168\213\006\016\172'\027\144\188\024\219\204\017\217\027\018\18543\143Fd.\151\164b bG3\199\219I\b\v\163U\251\134x\170-&W\247\232\130\154\228\197\131\133\175\016+\004x\226\138 \002\184\153\131\168\026\165\190=&\197|s\132\162\241\241\193\216\226M\167\223\224\019\248tZ\162c\195F\184%\015\140#\143\vn\250W\169\253S\234\132\n\014\169\157\148&\193S\179\a\168\n\173ku\vRg\027@\136\002\0171\195\213\b\1849\214\017%\154\160o\199F\239F]\127*\219!\157gu\253\233\178\160\197dO\196\235\023\236\245@\t\189&g\021\2379T\235\136\190\168\210\000\128U\b\1559\147b\131*\254!srk\203\209\239>\176,\145\133\216\n\155\183q\156\201\254\158\r\225V\187U\1835\209\019\180\023H\135~\144\147\023p\030k\005[\231\203\221\151\239\130\193\172\167\143\192^z\175\252#\192\000L\210\b^:\175\246t\000\000\000\000IEND\174B`\130", vector(161, 15));
local v1137 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0000\000\000\000\015\b\006\000\000\000\162.L\255\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001\132IDATx\218\196V\129q\1310\f\004o@GpG\160#x\133d\0042\002\025!\030\001F\136G(#\148\017\194\be\004\"\229LNU-\1769\210\254\157\238\140-\203\146_\018\206\166i\170&\025W\144C\198\000s\023\162S\179\181\027Y\251\006)\003\251\015D\231\151}\162\135\1905\001\191\208n\rb2A\129\163a\134\155P\0000\214\129\189\159\130c3\170\192z\201.B\132b{\207\185\a\142\201|\021:(\018\230qS\145\240\140a\208\218O9\144\143\156\000\190\143 \022\023\149d\b\244\172\223\252t$\209\241\158\140\235\132}\200v\225\199\022\2528\130\244\2047\a\242\184l\149\224D\177!\128\142\176PF\220>\214\195\1727\160\147k{T\246ZX\154\134\017\2504\2006\230\128\181\000\140\192F\020\224\006;\194\002\214\145N\b\160\023\186\022\197M-\208ya\001\180;\176\176V\v:\209\182\230\001<\251;;\f\vi\216\226}\"\v\163`\195\177.\020\157BXD\239h`\199ZXba\016\210)\186\006\206\249O\216\1737\031`\161%\197\\Dt=\179G\017\191\170#I\207\135\150\164\145\225\207\148\127\r\1923\217.\165\a\232\160\243'V\147\r\253\135\240\183\211_2\192Y\144\002u\254\1690\146\148\251\"\205\229J\139^I\149\191\1301b~\020X8-\228=\237:o\190\137t\129s\220\220`\238\002\f\000+8\134\170\241\240OW\000\000\000\000IEND\174B`\130", vector(48, 15));
local v1138 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\026\000\000\000\015\b\006\000\000\000\250Q\223\230\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\000\206IDATx\218b\248\255\255\191\203\127\220\224)\016\239\005\169a@\003@\1773\255\137\a\171\152\128z\148\024p\003) v\002\226\221@\197 ,\200@.\000jNC\178y7\022\185\187H\242g\240\1523\019I]9\186<\019>G022\206\002R&@|\015*d\f\178\156\028\0151\017R\000\180\236=\144\234D\018\162\141EP\176\026\137mLN\\\017e\017\212W\247\144\132\004i\229#\138\001)\022\t\210\220\"h\156\b\"\005\229=Z\249(\020\137\189\135&>\130\250\166\028G\n\164\142E\208\204y\006\169\152Z\r\205\196$\003\0224>\184\128\197\149\151\128\150\132\145\155\024X\208\242\a:\128\149\ng\129\150\016\138\155\247\248$\001\002\f\000\137\163\180r\147\208\005\140\000\000\000\000IEND\174B`\130", vector(26, 15));
local v1139 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0008\000\000\000\015\b\006\000\000\000\177\249\f\v\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001\183IDATx\218\172W\001m\1960\f\172\198 \020J\161\020B!\020J!\020\158\194S\200 t\016B\161\131\016\n];}+\255\253\217\241^\179\020\169m\226\216g\159\157t\024\132l\2196\239\227\190\189J\217G\030\f9\230\247QA\239\216+vt\164\1526@w\001\221h-\014D\129\201\001`t\024{\018\195n\131\165\205\tnbI\176\020*\128\152\196\\\196y#\v\199\186 \130\1505\167\247\239I\232\173\22699\000\222\020\221\208\163\201\170l8B\180g1W\254\226\156\208;K\161=J\227\162\181C\247\004\181\000\216\217Z\204\023\240\168\021\133\158\217\t.\136\128\021xo4\019\207\140\186\236\193\251\194\02063\197\156RM\001~6\150\177\0030a\214\189L\000{\129\212rP\001v\156\138l-\161\175\236\188Q\217\171\016'\147\167a\b[U\001\1575\128\235;\000\005H\173\147\222\b=\025\213C\143M\016\132\172|\175\255\154A\178\166\016\1443\156\181\180\230A7\027\141i\1952\000\022M\239\212\224\172F\137w]z\180@\166\131ac1\026S\237\128\207\026\242\228h\235/\180s\028\198\171B\195\158\140\n\r{r\149\219\199>>\133_\179\230,\204}9N\003I\161ok\127C\146\242\220\181}5\184\a\157\176\251a\228\154\2094\218\163\139E\200^\197Z\131o\147\227~ZI\230\155\193\154B\253\196\006b\200\173s\1422\185\147@\174\157K\128\148\201{\211\209\206\234\001\238\142\1498\153\141\136Gr\216\159\a~R\026H\239\207D6\"\252\195\137\206\027\210o\r\255\b0\000\144\ry\139\021\135\254\130\000\000\000\000IEND\174B`\130", vector(56, 15));
local v1140 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\029\000\000\000\015\b\006\000\000\000\024\141\196\159\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001#IDATx\218\148U\139\017\131 \fU7`\005W\176#\184\002+\208\017\\\161\029\161\142\160#\232\bu\005F\208\017(\185\195\2465G\000s\199\241\v\188\228\133\132\2029\215\187\180\f\164S\021\136\215[\216\217^R4\174L\232B\149\000\236\"g\166\152n\195\230k\r\226\231w\223l\216#\171\151\132\163\026\198\231\025\0293\180I\209\229qG\223\221\224\018\242\198d@W\223f\193\152<h\000>|\247\132%\019\161\150Xh\001tM\129\242\152.B\188\020\139\149b\251\015\190\231\251]\210oJ^e\240\214\194\018\143\211\233\253\022tIF\137\157\"\208L\154h0\002c\185I\020_\001\149\210\005sq\006vh|\192\003\236.\129\134\152(\184\208\194\186\006j-;:\199\140+\245\020\233Y\217E\n\188\249\019\022KS\f\026\188\025\004\235\245\133\240\180gYl2\128d\221\027rp\014\005\131S{\212\130D)\190P{\167D~\191R\175\027\244\246o5I\000\237\210/C@\217\223\228WX\176P\180\031\001\006\000\176\169\161x\a\152\230r\000\000\000\000IEND\174B`\130", vector(29, 15));
local v1141 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0007\000\000\000\015\b\006\000\000\000@\242W\134\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001\154IDATx\218\212W\253q\133 \f\183n\192\n\174\224\nv\004;\130o\004:\130+\216\017|#\240F\208\017|#\232\b4\220\133\187\188\148\bX\254hs\151\019\145|\252B \177\178\214*\224\221\2024\001\015U\128P\214\211^\t\004\223f\178\174\019\214\244l\157E\1914p\147b\015\230F\234\183\155hl\026m\192-S\246\"{\002\206H\224\208a\019\177\189\196\2369\189L\166\173\185#o\132\224\245\029\248\129\159\\\244\140\143bA2\192\030\240\234l2\251_1\005.@\240\152\200\212'\136\175I\209g\2332\149\2189\151\238,3T\004D\208\030\243o\206J\173@\234\170B\224\0222\175\019v\232\135\189\179\000\213)y\003[\252\196\148\241\212\2536\023\209\tz\134\031\023t\184#2\226\235\001\252\001\190\030Y\224\200y\240\164\n\156\181\150\005p\189\160c&\190\220\184\142\186\250\223\212\b\227lp\234\015\130\187\145\241\200o\242\250b\148\158\005\028;\002g0\139 \r\239\240\184\1794\205+\196l\205NnK\021\186E\003\242\027-\174d\158vF\195\197\219\178azt.\184`\157\v\\\231C@\182\147Z&l\237J\2129\205\187\147(8t\204\1569\192\234\204N\001\162\252&\213\178@\212\023V\a[\236\023\183\004_\ro\215rz\203Ej\189\216\014\136\r\184 \219F\026w\155\b\142\227\208U\194_\193\152x\030z\001\164\155\235\019\2285Kq\159)9\127\0054=\183o\001\006\000YB\161\173\2430o\144\000\000\000\000IEND\174B`\130", vector(55, 15));
local v1142 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000/\000\000\000\015\b\006\000\000\000t\139\150\154\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\0016IDATx\218\188V\129\r\132 \f$\191\001+\176\002+\184\002+\176\002+\176\130+\184\130?\130+\248#\184\002\143\t~\250\149\022!\226%\196\004\v\030\246zT\136\132\016\130\140\195\197\177\133\127\236sJ\016\136\239f\020?\016q2\1797\134\169\136]\142\141U\028+\0198\019\132t&v\"bU(\195T\196\254\200O`rD\228F\134\144\a\235\224\225e\137\188`P\019+P\138\164\184\b@xF\a\177O\144\127\165'$\172/\018\223\181}\212\194;\141\003F<\133]?\184H/\172\2418[\\\006{\202\198\016E\225)\167\001D\023\226@\238.\242\025l'\0250\142c\152\195:b~ip\027\217D\030|\196fd\020`\006\146\003\157\2303\210\209w\144o\169\131\001\017\241\153\vd\201\172\027\137\172\244\209<\179\137\195\254\207\212G\014\235\019VI\001:\198\167\193\006\021\213.\220e\147:\201\192!]\027$\027\149$\195\023\205\249\198\246\221d\147\180]\130\005\197|j#\n\214\187u\176\202\191\222\198\162\191\005;JM\020\227\192|\\\182f\173\166\171\252\n0\000\1490Hl\244\191\166\250\000\000\000\000IEND\174B`\130", vector(47, 15));
local v1143 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0007\000\000\000\015\b\006\000\000\000@\242W\134\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001\198IDATx\218\172V\129\141\1310\f\f\213/\192\n\172\144\031\129\031\129\021X\129\031\001F\128\017\202\b0\002\029\001F\128\017\242\225\021\164\195\181I\130z\018j\149\216\137\207vl+cLnd\172\246\171\236\151*\001v/s2\179\160\171\025\157\212\237Kh\237W2z\168\195\237#\151u_(\141\031\187\225\025sXa\194P1\0141\129\247j\208\171`ob\236\025Nw\018r-\bj\018\141\218C\140\018\168\201~!\145c\188?\144\f\200\132\136\231R\212\254\179M\"\199xj\184H\171RHY$8\135\144\003\153\167\224t\201\166\246\205\209\017\228jX/9\163\133\183\133\208\017\228h\234\166R\244\136\236z\200>.\f\219\r\193\136\244\240_\v\235'$I\178\217\159\023,\229*\016Vw\225t\221\153\r\172\023\196\206\198\201\188\145+\193\155\251\131=\138\200\183U\192\139\176\184l\030;7u\031x'V\236\014\206Er\155\219S\151\145#\152\200\187\202>d\252-\144\232\165@\252\247\136\026G\174K\000\1870\236\181\208\0146\193\163\159\198\213\217\029\177c\177&w(\240\240x\168!o\234\136\222\018A\014\163\188D\146\019u]\132zBV\005\147\187\200\251\160\"\225\"\141\006\142\161\172\156\174\134Ly\197\134=\132\156f\188w\170\156\216L\t\176\241\143\248\030\002\128\186}\164\174\n\233st4\203\132\166\185b\193q\189\232\201M\0257&\148Y\154m\217\198\237! \161\244\204rA\243a\228l9q3m(\185/\207#?Jn\239\154*-8?nf\220\141\167\135\143.\021\027\225\220\237\162\0245\\\245\139\237\161\127\002\f\000 \162'\b3D\141_\000\000\000\000IEND\174B`\130", vector(55, 15));
local v1144 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000#\000\000\000\015\b\006\000\000\000n\183v\020\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\0017IDATx\218\172U\139\r\1300\016\173\141\vt\005V\192\017t\004\028\001G\192\021\028AV`\004\025AV`\004\025\161\222\1536y\148\1634\150\151\144b\185\222\189\190\251\168\172\181\133]\162Q\017\208\247Z8S\192\247\179\141\163a\155T\1993\231\129\189\161\231#\216\215\t>C\188\216\159?\167\131X#\188W+\194\240\190w0\168m\244\a\000\253\190A\028V\231\181F\166\a\195:B\198\019O!3\003\241ii9A\156\210\171\170\005\251\206\173E\152W\151:\191\215\170?A\132&Z\030\176\181IFJU\021\168\152\003\140\195\234\024-\176\030@\194\n\v\fR78;\149\169\014\214\168\209\027\172\141W\195\165\172\016n\181\027t\130\132\149\144\162\189\200\152M2.\005>\r<\192J \195\173:\230\178p\2337\016s\212\137\005\246\132\131\253N\170,\154!F\006\131\150\240\222\238\164J\019^\\G\170}\016\134Z\231\186 \135\bw\228\027\155\193\rBuL\152\005e\230l\249\253i\174\249'\"W,`\188\233\020\169\155I\232\162\181\179\177\002g\187;=\023$\194\248\n0\000-\212\016\242.\180p\203\000\000\000\000IEND\174B`\130", vector(35, 15));
local v1145 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\021\000\000\000\015\b\006\000\000\000\vZ\132k\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\000\219IDATx\218b\248\255\255\191\203\127\194@\144\001\n@l .\a\226whj@bJ0Ei\196\026\n\210\004\196w\241\168\219\rR\199\196\128\n\2460b\a\239\161\242\029@\172\004e\207\130I\002\217& >\016\191\199\230\210\221\fx\000\154\151\005q\169cb \r \027dL-C\207\"\177w\131\"\135\026\134v\162\241;\160A\209\001\143y\"c\255\fZ\184\186\224I\001\161\228\184\148\001\024\217\160\020\162\fd\166\163\005\a\b\172\002\187\152\148\216\199\145\"\\\208RE\a\201.\197\230r\180\176\022\164\216P,I\237\030\019\t\2224\134z\179\0289\166\161\145\147\134\164t5\209aJd\193\147\006\139\253\247Hz\223\019\b\187t\176K0A\005(\255\003\213\128\242?\003@\128\001\000j\250w\222\149\0216\140\000\000\000\000IEND\174B`\130", vector(21, 15));
local v1146 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000:\000\000\000\015\b\006\000\000\000\181\f\2206\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\002\003IDATx\218\156W\139q\195 \fu\189\001+\208\017\200\bt\132\172\224\142\224\021\232\b\205\b\206\ba\0043\1303\130=\002\133\030\206\201B\002\028\221q\135\197;\025}\158,w]\018\239\189\bk\fk\245G\137:\tpWp6u\r\018pCX\191>\151)\218'\240\240\014\1388\215\200\142\172`\166])\195Z</\015t\233L\2078\024\131\247\240u\153Q0g\024h\194\174\193\201 0#87}\210\155\176\246\023\221>\146\132\253%>\135\181u\239I\f\132N{\023\237\001\219_I\023%f\rV\135\005{E\216\213\232\153\194\168\204\030*\021\209P\134\213\140\162\136.\fF\162w\015D\217\173D\149`Y\v\229\255\127\182gTT\162\243\142\f`\255C\001Bb\159\169b\014\153\nz\v\170H\160\224k\194\148\128\\N{\001\179\217\131\178z\149\027U\243g$\241\r6\136{\001\238\024',\163\135\137\1841\024\141\237\247L\196w\178\027\170\1635\136D\153+q\028\158\t&\000\138p\194\021\184\172\152\128\189x\193u\222\235\025\142\"\204R\201\254\225S\001\203\015ve\130\159\134\226b\210-X\215\131\168\219\176>\195\246\027E3\202t2\179\027\151\221V\twq\192\142J<\149D\198-\228)\194\217\204Q\240\130\248y\185\164\246\1911\205\165&O\220)\027\203\028\a\024\243\148\226\176k\192\228\142\194\f#\238\138\147\142n\149NY\231S\206\211\029\235\000\239-\13194\193\190ra\193e\169Rv\027\234\180\003\195O\133\206\176\163w&[\150)q\136q\135&\152\234zef\218\021\207\147'\006\006I\204\181%\251\134\1773\151\154c\194L\004\198\212\006dJ\006\166\163\250\210\148\210h\155u\146\153k\179A\031Mad0\224\229\169\168\140\132Q\221\234(\250+\154[\2367\252\169\204\r\213\179\224\006\248'\192\000\255\229\029 0\147j=\000\000\000\000IEND\174B`\130", vector(58, 15));
local v1147 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\028\000\000\000\027\b\006\000\000\000o\b\239,\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\002\210IDATx\218\188\150MHTQ\020\199\231\233H\218\135f\164\019}P\016\180\1372\"\201EBE\016\005\237\n%*\130\150\005\006Q\173\130\218\004\017-\002iWAH\016\213\1746B\v\139>\022E\129\228\194E\nQ\216`\154\213\140\163\1423\253N\253'n\183g\243f\178.\252\230\190w\222\157s\238=\231\220so,\246\151-\159\207W\198\254W\195\2162\232\132\186\217V\\\a\181!\242\157\249\031\173)\228\219\"X\224\203+\"\218<\n\215QP\227\201\231\168\159\235O\144\238.\028,\215\224s\216\005\167g0X\227\197\244\018l\132\151\229\026|\000W`)\n\027\029\249{\232\130aG\182Z+\190\f\207|EA\tq\172\210\248\169 \b\242\206j*g\144\229\144e}=q\006\180\208\183\150\152D\197d\159\224&d\245\205\146g\031\180\197\249\185c\174\138h\203\020},2&!\151\230\224*\198,\225\206\193B\184g\214\191\230\163\183\246\b\171?\171\177\199\245\254\016\158\194\150\239.\133\233\018\1889\233\196)WH<b\229\234Hy\249q\202\178\188\016\207x\025E\192\n\128\205\246\173\140\174D\214\131\194T\216x\228\191dj\169\006\205@\006\250\224\139\179\162\201?L\208\182\145e\184eU\174\152\193n\248\160\f\1716\152\177)\031t\198\248IT\229\189\219\254]\165\140\157r\r\166\161W{h\147\158/\194\019\216-\131\237\2048I\223\168\205n\238\1570E`\229lT\021\201m'\221I\020*\205\b\028\134N\173\202\020\156\129fV\148v\018k\000^h\172\245\205\218R\230\214\003\146\141y1\028\128\254\002\133\021Z\161}\172\018f\155\244\026\188\134\205\250\222#\183\174\128\173\176\004\182\233\189Z\019O\168\1284x1\172\199\208\168\191\194I%\129\245\245J\142V\185\213\218+\245c\138E\198\193\\<\004\227\242L\218s\233-\140\158\248y\210\2400\006)\216\163\247u\206F\239\135\1970\172w\251c\021\220\214\216\014\216\014\213pC\178.\141\237\208\187U\155,\f\194\222\128\031s\227z\205&[d\171Lk%\243\2253\204s\182K\133\188T\171-p\bWv\203h\139\202\219\134@\133u\205,\223>\1981\214\023r\247Y[\202\241\148\208c\2109\138j\020\243\017d\025Gq\131\142\167d\185w\026\139\235\144\226\019w\228m\138\255\014Gf\241\188\015o\194\238AQO\252\253\138\207\005\239P\205\234(\154p\246\157\173\244\188\228G~;\128K\184b<BY\175'\207\020b\230\201\173:\029\131w\229\186\212\146+\b\1457i\235,\015\251\207\191\184\b\a\186\235Dn\223\004\024\000\234\183\213\196\241F\a\175\000\000\000\000IEND\174B`\130", vector(28, 27));
local v1148 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000>\000\000\000\015\b\006\000\000\000\188\231|L\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\001,IDATx\218\180W\129\r\131 \016\196O\023`\005W\208\017X\193\142\224\f\157\197\017\202\bu\004]\193\017\202\bT\019m>\031(\020\254/\185\004\004\185\135\255\231Uy\239\141OC\239T\001\190\200<\019\153\183\248|<+\181\014\014\169\245@)\213\1702t;\ry6*\025\252\171\165#\237/\128\244\231&\f\023xw@\237\r=\v\t\245;\027\196\t\141=\200\216\189R+\vP\225\133\203\152y\167\141\024\201\005v\173\210\141\027\148\"\243I\169\141\139h\221*\140\185p\132\173;\169\2071}\246\1856\206\174U\234\241\235bY\145\232$t\201\137h\209\141\135J\219\018\200\183\235R\193\249\182\n\132\187\152\022T\134\158%m\135\202O\199\028\230\172Z9\229\172'5q@\167\190\145\247m\196\232\018\136jA\129\a4:iO82\230\185\168\022\020\228\\.\218J\175\139jAa\2329\242\181\133\201\017\238\226ZP\232\001\251c\158e\bwN-\019H\1477\144\226\239\018?\n9\198\204h\029\029\249\tJ}p\212jm\169\147\253\b0\000\021\138@\005?\141YZ\000\000\000\000IEND\174B`\130", vector(62, 15));
local v1149 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0003\000\000\000\015\b\006\000\000\000I\025\247\252\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\000\222IDATx\218\212VQ\r\003!\f\005\028`\129I\192\194,`aZfa\1470$\236,\156\005$\236$\176\146\208\165#p\185}\237\241\018r\189\166$}\240\218\162r\206\ni\245@\254g\254\198\185\023g\0208(qO\1596\249\203\148d\bA\216\137}D\210\206Lf\161\021\a$\241\201\212\218p\130\204\178GF!7\000\250\191\138\162\183\213\247j}\179\200\140\v}\213Zo\213\190\143\026\129\001\150X\145\017\159\188\172\149u(5T\153\145}\019rrM\206Rj\030\250fj-\004!\177\212\132\200\155\250\204 =\154\186\255\002%\206\018{\028\220\146h\207\t\185f\194\015\177\142\1597\006\\b\155\030\160'5\003~+q'.\182-\026\145\140?H\166\188\006x\246\216\210\241\222\002\f\000\135\t\199\237\231\156\148\015\000\000\000\000IEND\174B`\130", vector(51, 15));
local v1150 = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\0001\000\000\000\015\b\006\000\000\000M\236'\193\000\000\000\025tEXtSoftware\000Adobe ImageReadyq\201e<\000\000\000\188IDATx\218\212\149\193\017\130@\fEW\198\006h\129\022\150\018l\193\022b\tZ\130\148\128-\216\138\180\176%`\t\241G\179L\014\136\030\1477\243g\152\205e\223@>\137\153\147\195\028\248;3rF\218\1644\201'\221\198L.\127E\030\016\233<KXn;\005\207=R\140(E\145X\128\199$R\230(\135\147Xa\n'\129\029\200\245\019R\238u\2241\196\191\201\222\219\233\031\164\157(\\;iC]\204l\148\154\r\247&\2241,\187\240\129\154\200\173T\127~Q%\178y.\225$t\153\143\182f\247\001\238M\181\133V8aG\138W\137\1781{\"\239\229\022\0019x\t0\000\v1P\205\151\2052\127\000\000\000\000IEND\174B`\130", vector(49, 15));
local v1151 = l_decode_0.load_gif("GIF89a\020\000\020\000\145\003\000\014\n\n\201\201\201\a\a\a\255\255\255!\249\004\005\a\000\003\000,\000\000\000\000\020\000\020\000\000\0023\156?\162\139}\v\153K\177\170f\179@\218\190\202\129\148\228D#\137u\211\151\173\134\234\194k\183M\160iC\175\184\227']\235\001\131BY\170\229*\018\015\005\000!\249\004\005\a\000\003\000,\017\000\n\000\002\000\001\000\000\002\002L\n\000!\249\004\005\a\000\003\000,\016\000\n\000\003\000\002\000\000\002\003\140e\005\000!\249\004\005\006\000\003\000,\003\000\001\000\017\000\019\000\000\002&\156\a\167\203\237\143 K\178N\171(6\186\234\222\128U\176\136K\016P&\023\181!$&\157|\172\142\202\194\022\237\020\000!\249\004\005\a\000\003\000,\015\000\f\000\003\000\006\000\000\002\a\140!!\130\219;\n\000!\249\004\005\a\000\003\000,\015\000\r\000\003\000\005\000\000\002\006\140u \1870\005\000!\249\004\005\006\000\003\000,\015\000\014\000\002\000\004\000\000\002\004\204\022pR\000!\249\004\005\a\000\003\000,\r\000\014\000\003\000\004\000\000\002\006\\f\001&\003\005\000!\249\004\005\a\000\003\000,\r\000\015\000\004\000\004\000\000\002\a\204>v!0>\n\000!\249\004\005\006\000\003\000,\f\000\015\000\002\000\003\000\000\002\003\204fQ\000!\249\004\005\a\000\003\000,\f\000\016\000\003\000\003\000\000\002\004\140\031\"\005\000!\249\004\005\a\000\003\000,\v\000\016\000\004\000\003\000\000\002\004\140\143\002\005\000!\249\004\005\006\000\003\000,\b\000\016\000\004\000\004\000\000\002\a\220bg\128\002^\000\000!\249\004\005\a\000\003\000,\b\000\016\000\004\000\004\000\000\002\006\\\134g\n\210\005\000!\249\004\005\a\000\003\000,\a\000\016\000\002\000\003\000\000\002\003T~\005\000!\249\004\005\006\000\003\000,\006\000\015\000\002\000\003\000\000\002\003\\|\005\000!\249\004\005\a\000\003\000,\005\000\015\000\002\000\003\000\000\002\003T~\005\000!\249\004\005\a\000\003\000,\004\000\015\000\002\000\002\000\000\002\002T^\000!\249\004\005\006\000\003\000,\003\000\014\000\003\000\002\000\000\002\003\220\130S\000!\249\004\005\a\000\003\000,\003\000\014\000\002\000\001\000\000\002\002L\n\000!\249\004\005\a\000\003\000,\002\000\f\000\004\000\003\000\000\002\005\220\"\161gS\000!\249\004\005\006\000\003\000,\001\000\f\000\003\000\001\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\001\000\v\000\003\000\001\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\001\000\n\000\003\000\001\000\000\002\002\140\v\000!\249\004\005\006\000\003\000,\001\000\t\000\003\000\001\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\001\000\b\000\003\000\001\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\001\000\a\000\004\000\001\000\000\002\002\140S\000!\249\004\005\006\000\003\000,\002\000\005\000\002\000\002\000\000\002\003\204\018\005\000!\249\004\005\a\000\003\000,\003\000\005\000\002\000\002\000\000\002\002\140S\000!\249\004\005\a\000\003\000,\003\000\004\000\003\000\002\000\000\002\003L\134Q\000!\249\004\005\006\000\003\000,\004\000\003\000\002\000\002\000\000\002\002\140S\000!\249\004\005\a\000\003\000,\005\000\002\000\002\000\003\000\000\002\003\204fQ\000!\249\004\005\a\000\003\000,\006\000\002\000\002\000\003\000\000\002\002\140_\000!\249\004\005\006\000\003\000,\a\000\001\000\002\000\003\000\000\002\002\140_\000!\249\004\005\a\000\003\000,\t\000\001\000\001\000\003\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\n\000\001\000\001\000\003\000\000\002\002\140\v\000!\249\004\005\006\000\003\000,\v\000\001\000\001\000\003\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\f\000\001\000\001\000\003\000\000\002\002\140\v\000!\249\004\005\a\000\003\000,\f\000\002\000\006\000\004\000\000\002\bL\132c\136\135\192\158(\000!\249\004\005\006\000\003\000,\r\000\002\000\002\000\003\000\000\002\003\\|\005\000!\249\004\005\a\000\003\000,\014\000\003\000\002\000\003\000\000\002\003\140-\005\000!\249\004\005\a\000\003\000,\015\000\004\000\003\000\002\000\000\002\004\\\0162\005\000!\249\004\005\006\000\003\000,\015\000\005\000\003\000\002\000\000\002\003\140-\005\000!\249\004\005\a\000\003\000,\015\000\006\000\003\000\005\000\000\002\006\140-\002\185b\005\000!\249\004\005\a\000\003\000,\015\000\a\000\004\000\004\000\000\002\006\140#\b\178|\005\000!\249\004\005\006\000\003\000,\016\000\b\000\003\000\002\000\000\002\003\140-\005\000!\249\004\005\006\000\003\000,\018\000\t\000\001\000\001\000\000\002\002L\001\000;");
v1090.font = render.load_font("Calibri Bold", vector(25.5, 23.5, 0), "a");
v1090.render_indicator = function(v1152, v1153, v1154, v1155, v1156)
    -- upvalues: v1090 (ref)
    local v1157 = vector(render.screen_size().x, math.floor(render.screen_size().y / 1.479));
    local v1158 = v1152.resolution and vector(v1152.width, v1152.height) or render.measure_text(v1090.font, nil, v1152);
    local v1159 = v1155 and v1155 or vector(0, 0);
    if not v1155 then
        local v1160 = v1156 and v1153.a * 0.204 or 52;
        render.gradient(vector(0, v1157.y + v1154), vector(30 + v1158.x / 2, v1157.y + v1154 + 33), color(0, 0, 0, 0), color(0, 0, 0, v1160), color(0, 0, 0, 0), color(0, 0, 0, v1160));
        render.gradient(vector(30 + v1158.x / 2, v1157.y + v1154), vector(60 + v1158.x, v1157.y + v1154 + 33), color(0, 0, 0, v1160), color(0, 0, 0, 0), color(0, 0, 0, v1160), color(0, 0, 0, 0));
    end;
    local v1161 = v1156 and v1153.a * 0.492 or 125;
    if v1152.resolution then
        render.texture(v1152, vector(31 - v1159.x, v1157.y + v1154 + 11 - v1159.y), color(0, 0, 0, v1161));
        render.texture(v1152, vector(30 - v1159.x, v1157.y + v1154 + 10 - v1159.y), v1153);
    else
        render.text(v1090.font, vector(31, v1157.y + v1154 + 8), color(0, 0, 0, v1161), nil, v1152);
        render.text(v1090.font, vector(30, v1157.y + v1154 + 7), v1153, nil, v1152);
    end;
end;
v1090.framerate_data = v14(0, 10);
v1090.fakelag_data = v14(0, 5);
v30(0.25, function()
    -- upvalues: v116 (ref), v19 (ref), v1090 (ref)
    local v1162 = entity.get_local_player();
    if not v1162 or not v1162:is_alive() then
        return;
    else
        if v116.item.gs_indicators_selectable:get(17) then
            local v1163 = 1 / globals.frametime;
            v19(v1090.framerate_data, v1163, true);
        end;
        if v116.item.gs_indicators_selectable:get(14) then
            local l_choked_commands_0 = globals.choked_commands;
            v19(v1090.fakelag_data, l_choked_commands_0, true);
        end;
        return;
    end;
end);
v1090.render = function()
    -- upvalues: v1090 (ref), v1133 (ref), v1134 (ref), v1135 (ref), v1136 (ref), v1137 (ref), v1138 (ref), v1139 (ref), v1140 (ref), v1141 (ref), v1142 (ref), v1143 (ref), v1144 (ref), v1145 (ref), v1146 (ref), v1147 (ref), v1151 (ref)
    local v1165 = entity.get_local_player();
    if not v1165 or not v1165:is_alive() then
        return;
    else
        local v1166 = vector(render.screen_size().x, math.floor(render.screen_size().y / 1.479));
        v1090.spacing = 0;
        if v1090.condition.fps then
            v1090.render_indicator(v1133, v1090.color.fps, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.aimbot_stats then
            v1090.render_indicator(v1090.value.aimbot_stats, v1090.color.aimbot_stats, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.fakelag then
            v1090.render_indicator(v1090.value.fakelag, v1090.color.fakelag, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.anti_defensive then
            v1090.render_indicator(v1134, v1090.color.anti_defensive, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.lagcomp then
            v1090.render_indicator(v1135, v1090.color.lagcomp, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.hitchance_ovr then
            v1090.render_indicator(v1136, v1090.color.hitchance_ovr, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.ping_spike then
            v1090.render_indicator(v1137, v1090.color.ping_spike, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.doubletap then
            v1090.render_indicator(v1138, v1090.color.doubletap, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.osaa then
            v1090.render_indicator(v1139, v1090.color.osaa, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.dormant_aimbot then
            v1090.render_indicator(v1140, v1090.color.dormant_aimbot, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.duck then
            v1090.render_indicator(v1141, v1090.color.duck, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.safe then
            v1090.render_indicator(v1142, v1090.color.safe, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.body then
            v1090.render_indicator(v1143, v1090.color.body, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.min_damage then
            v1090.render_indicator(v1144, v1090.color.min_damage, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.freestanding then
            v1090.render_indicator(v1145, v1090.color.freestanding, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.slow then
            v1090.render_indicator(v1146, v1090.color.slow, v1090.spacing, false, true);
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.bomb_site then
            v1090.render_indicator(v1090.value.bomb_site, v1090.color.bomb_site, v1090.spacing);
            v1090.render_indicator(v1147, v1090.color.bomb_site, v1090.spacing, vector(0, 7));
            v1090.render_indicator(v1090.value.bomb_site_image, v1090.color.bomb_site, v1090.spacing, vector(0, 0));
            if v1090.c4_results.type == 1 then
                local v1167 = v1090.site == "A" and 0 or 2;
                v1151:draw(globals.curtime - v1090.c4_results.planting_started_at, vector(88 - v1167, v1166.y + v1090.spacing + 6), vector(20, 20));
            end;
            v1090.spacing = v1090.spacing - 41;
        end;
        if v1090.condition.defusing_bar then
            render.rect(vector(0, 0), vector(20, render.screen_size().y), color(0, 0, 0, 125));
            render.rect(vector(1, v1090.c4_results.barlength + 2), vector(19, render.screen_size().y - 2), v1090.color.defusing_bar);
        end;
        if v1090.condition.bomb_damage then
            v1090.render_indicator(v1090.value.bomb_damage, v1090.color.bomb_damage, v1090.spacing);
            v1090.spacing = v1090.spacing - 41;
        end;
        v1090.c4_info:get_active_bomb();
        return;
    end;
end;
v1090.pre_load = function()
    -- upvalues: v1001 (ref), v1090 (ref), v116 (ref), l_lc_0 (ref), v8 (ref), v42 (ref), v1149 (ref), v1150 (ref), v1148 (ref)
    local v1168 = entity.get_local_player();
    if not v1168 or not v1168:is_alive() then
        return;
    else
        local v1169 = color(255, 0, 50);
        local v1170 = color(255, 198, 198);
        local v1171 = color(255, 255, 255, 200);
        local v1172 = color(143, 194, 21);
        local v1173 = color(252, 243, 105);
        local v1174 = color(230, 210, 40);
        local v1175 = color(255, 255, 255);
        local v1176 = color(0, 255, 0, 125);
        local v1177 = color(255, 0, 0, 125);
        local v1178 = rage.exploit:get();
        local v1179 = utils.net_channel();
        local v1180 = v1179.latency[0];
        local _ = v1179.latency[1];
        local l_m_flVelocityModifier_1 = v1168.m_flVelocityModifier;
        local v1183 = color(v1001.rgb_health_based(l_m_flVelocityModifier_1));
        local v1184 = v1001.remap(l_m_flVelocityModifier_1, 1, 0, 0.85, 1);
        if l_m_flVelocityModifier_1 == 1 and v1090.alpha > 0 then
            v1090.alpha = v1090.alpha - 1;
        elseif l_m_flVelocityModifier_1 ~= 1 then
            v1090.alpha = 550;
        end;
        local v1185 = v1090.framerate_data[1] / (v1090.framerate_data[1] + v1090.framerate_data[10]);
        local v1186 = (not (v1090.hit_shot <= 0) or v1090.total_shot > 0) and v1090.hit_shot / v1090.total_shot * 100 or 0;
        v1090.condition.fps = v116.item.gs_indicators_selectable:get(17) and v1185 > 0.7;
        v1090.color.fps = v1174;
        v1090.value.aimbot_stats = ("%s/%s (%.1f)"):format(v1090.hit_shot, v1090.total_shot, v1186);
        v1090.condition.aimbot_stats = v116.item.gs_indicators_selectable:get(12);
        v1090.color.aimbot_stats = v1171;
        v1090.value.fakelag = ("%i-%i-%i-%i-%i"):format(v1090.fakelag_data[1], v1090.fakelag_data[2], v1090.fakelag_data[3], v1090.fakelag_data[4], v1090.fakelag_data[5]);
        v1090.condition.fakelag = v116.item.gs_indicators_selectable:get(14);
        v1090.color.fakelag = v1171;
        v1090.condition.anti_defensive = v116.item.gs_indicators_selectable:get(13);
        v1090.color.anti_defensive = v1090.cl_lagcompensation:int() == 1 and v1169 or v1172;
        v1090.condition.lagcomp = v116.item.gs_indicators_selectable:get(15) and l_lc_0() >= 0;
        v1090.color.lagcomp = l_lc_0() == 0 and v1169 or l_lc_0() == 1 and v1172;
        v1090.condition.hitchance_ovr = false;
        v1090.color.hitchance_ovr = v1175;
        v1090.condition.ping_spike = v116.item.gs_indicators_selectable:get(3) and v8.FakeLatency:get() > 0;
        v1090.color.ping_spike = v42(math.min(v1180 * 1000 / v8.FakeLatency:get(), 1), 0, 0.5, 1, v1170, v1173, v1172);
        v1090.condition.doubletap = false;
        v1090.color.doubletap = v1178 == 1 and v1171 or v1169;
        v1090.condition.osaa = false;
        v1090.color.osaa = v1171;
        v1090.condition.dormant_aimbot = v116.item.gs_indicators_selectable:get(10) and v8.DormantAimbot:get();
        v1090.color.dormant_aimbot = v1169;
        v1090.condition.duck = false;
        v1090.color.duck = v1171;
        v1090.condition.safe = false;
        v1090.color.safe = v1171;
        v1090.condition.body = false;
        v1090.color.body = v1171;
        v1090.condition.min_damage = false;
        v1090.color.min_damage = v1171;
        v1090.condition.freestanding = false;
        v1090.color.freestanding = v1171;
        v1090.condition.slow = v116.item.gs_indicators_selectable:get(16) and v1184 > 0;
        v1090.color.slow = color(v1183.r, v1183.g, v1183.b, 255 * v1184);
        v1090.condition.defusing_bar = v1090.c4_results.type == 2 and v1090.c4_results.time_left >= 0 and v1090.c4_results.barlength >= 0;
        v1090.color.defusing_bar = v1090.c4_results.time_for_defuse and v1176 or v1177;
        v1090.value.bomb_site = v1090.c4_results.type == 2 and ("         - %.1fs"):format(v1090.c4_results.time_left) or "            ";
        v1090.value.bomb_site_image = v1090.c4_results.site == "A" and v1149 or v1150;
        v1090.condition.bomb_site = v116.item.gs_indicators_selectable:get(9) and (v1090.c4_results.type == 1 or v1090.c4_results.type == 2 and v1090.c4_results.time_left > 0);
        v1090.color.bomb_site = v1090.c4_results.type == 1 and v1173 or v1171;
        v1090.value.bomb_damage = v1090.c4_results.fatal and v1148 or ("-%s HP"):format(v1090.c4_results.damage);
        v1090.condition.bomb_damage = v116.item.gs_indicators_selectable:get(9) and v1090.c4_results.type == 2 and v1090.c4_results.damage > 0;
        v1090.color.bomb_damage = v1090.c4_results.fatal and v1169 or v1173;
        local v1187 = ui.get_binds();
        for v1188 = 1, #v1187 do
            local v1189 = v1187[v1188];
            local v1190 = v1189.reference:name();
            local l_active_0 = v1189.active;
            local l_value_1 = v1189.value;
            if v116.item.gs_indicators_selectable:get(11) and v1190 == "Hit Chance" then
                v1090.condition.hitchance_ovr = l_active_0;
            end;
            if (v116.item.gs_indicators_selectable:get(4) and v1190 == "Double Tap" or v116.item.gs_indicators_selectable:get(7) and v1190 == "Hide Shots" or v116.item.gs_indicators_selectable:get(5) and v1190 == "Fake Duck") and l_active_0 then
                v1090.condition.doubletap = v1190 == "Double Tap";
                v1090.condition.osaa = v1190 == "Hide Shots";
                v1090.condition.duck = v1190 == "Fake Duck";
            end;
            if v116.item.gs_indicators_selectable:get(1) and v1190 == "Safe Points" and l_value_1 == "Force" then
                v1090.condition.safe = l_active_0;
            end;
            if v116.item.gs_indicators_selectable:get(2) and v1190 == "Body Aim" and l_value_1 == "Force" then
                v1090.condition.body = l_active_0;
            end;
            if v116.item.gs_indicators_selectable:get(8) and v1190 == "Min. Damage" then
                v1090.condition.min_damage = l_active_0;
            end;
            if v116.item.gs_indicators_selectable:get(6) and v1190 == "Freestanding" then
                v1090.condition.freestanding = l_active_0;
            end;
        end;
        entity.get_players(true, true, function(v1193)
            -- upvalues: v1090 (ref), v1172 (ref), v1171 (ref), v1169 (ref)
            local v1194 = v1193:get_network_state();
            v1090.color.dormant_aimbot = v1194 == 1 and v1172 or v1194 > 1 and v1171 or v1169;
        end);
        return;
    end;
end;
events.bomb_beginplant:set(function(v1195)
    -- upvalues: v1090 (ref)
    v1090.c4_info:begin_plant(v1195);
end);
events.bomb_abortplant:set(function()
    -- upvalues: v1090 (ref)
    v1090.c4_info:reset();
end);
events.bomb_planted:set(function()
    -- upvalues: v1090 (ref)
    v1090.c4_info:reset();
end);
events.round_start:set(function()
    -- upvalues: v1090 (ref)
    v1090.c4_info:reset();
end);
events.round_prestart:set(function()
    -- upvalues: v1090 (ref)
    v1090.c4_info:reset();
end);
events.round_end:set(function()
    -- upvalues: v1090 (ref)
    v1090.c4_info:reset();
end);
events.level_init:set(function()
    -- upvalues: v116 (ref), v1090 (ref)
    if not v116.item.gs_indicators_selectable:get(12) then
        return;
    else
        v1090.hit_shot = 0;
        v1090.total_shot = 0;
        return;
    end;
end);
events.aim_ack:set(function(v1196)
    -- upvalues: v1090 (ref)
    v1090.total_shot = v1090.total_shot + 1;
    if v1196.state == nil then
        v1090.hit_shot = v1090.hit_shot + 1;
    end;
end);
events.render:set(function()
    -- upvalues: v117 (ref), v118 (ref), v126 (ref), v136 (ref), v225 (ref), v173 (ref), v241 (ref), v298 (ref), v331 (ref), v572 (ref), v573 (ref), v824 (ref), v907 (ref), v913 (ref), v1026 (ref), v1051 (ref), v1070 (ref), v1080 (ref), v1090 (ref), v947 (ref), v1001 (ref), v403 (ref), v414 (ref), v245 (ref), v116 (ref), v416 (ref), v933 (ref)
    v117 = ui.sidebar(v118:get_animated_text(), "\a69B83FFF" .. ui.get_icon("paintbrush"));
    v118:animate();
    v126.main();
    v136.render();
    v225.render();
    v173.main();
    v241.render();
    v298.render();
    v331.render();
    v572.render();
    v573();
    v824.render();
    v907.main();
    v913.main();
    v1026.main();
    v1051.main();
    v1070.main();
    v1080.main();
    v1090.render();
    v947.main();
    v1001.main();
    v403();
    v414.render();
    v245.render();
    if v116.item.gs_watermark_switch:get() then
        v416.window.title = v116.item.gs_watermark_title_name:get();
        v416.window.title_bar = v116.item.gs_watermark_optionals:get(3);
        v116.item.saved_top:set(v416.window.top);
        v116.item.saved_right:set(v416.window.right);
        if not globals.is_in_game then
            v416.callback(false);
        end;
        v416.callback(true);
    end;
    if v116.item.time_remaining_switch:get() then
        v933.main:update();
    end;
    client_call_delay();
end);
events.pre_render:set(function()
    -- upvalues: v115 (ref), v1090 (ref)
    v115.main_menu();
    v1090.pre_load();
end);
events.post_render:set(function()
    -- upvalues: v919 (ref)
    v919.main();
end);
events.net_update_end:set(function()
    -- upvalues: v115 (ref), v227 (ref)
    v115.player();
    v115.weapon();
    v115.mask();
    v227.main();
end);
events.aim_ack:set(function(v1197)
    -- upvalues: v331 (ref)
    v331.main(v1197);
end);
events.round_end:set(function()
    -- upvalues: v380 (ref), v136 (ref)
    v380.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
    v136.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
end);
events.round_start:set(function()
    -- upvalues: v380 (ref), v136 (ref)
    v380.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
    v136.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
end);
events.cs_game_disconnected:set(function()
    -- upvalues: v380 (ref), v136 (ref)
    v380.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
    v136.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
end);
events.client_disconnect:set(function()
    -- upvalues: v380 (ref), v136 (ref)
    v380.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
    v136.count = {
        grenade = 0, 
        knife = 0, 
        headshot = 0, 
        wallbang = 0, 
        default = 0, 
        priority = 0
    };
end);
events.shutdown:set(function()
    -- upvalues: v571 (ref), v401 (ref), v913 (ref), v919 (ref), v56 (ref), v8 (ref), v928 (ref), v116 (ref)
    cvar.r_aspectratio:float(v571.old_aspectratio);
    cvar.viewmodel_fov:int(v571.old_fov);
    cvar.viewmodel_offset_x:float(v571.old_x);
    cvar.viewmodel_offset_y:float(v571.old_y);
    cvar.viewmodel_offset_z:float(v571.old_z);
    v401.cvar:int(v401.stored_cvar);
    v913.cvar:int(v913.stored_cvar);
    v919.mat_vignette_enable:int(v919.old_mat_vignette_enable);
    v919.mat_disable_bloom:int(v919.old_mat_disable_bloom);
    v919.r_modelAmbientMin:float(0);
    v56(v8);
    for _, v1199 in pairs(v928.materials) do
        materials.get(v1199):reset();
    end;
    if v116.item.player_models_selectable:get(1) or v116.item.player_models_selectable:get(2) or v116.item.player_model_show_on_menu:get() or v116.item.mask_changer_combo:get() ~= "Disabled" then
        common.force_full_update();
        if not entity.get_local_player() then
            panorama.load_model(nil);
        end;
    end;
end);