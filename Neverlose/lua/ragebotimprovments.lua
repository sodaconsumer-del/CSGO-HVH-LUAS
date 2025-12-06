_DEBUG = false;
local v0 = {};
local l_ffi_0 = require("ffi");
local _ = require("neverlose/clipboard");
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/gradient");
local _ = require("neverlose/mtools");
l_ffi_0.cdef("    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
local _ = panorama.loadstring("    return {\n        OpenExternalBrowserURL: function(url){\n            void SteamOverlayAPI.OpenExternalBrowserURL(url)\n        }\n    }\n")();
v0.urlmon = l_ffi_0.load("UrlMon");
v0.wininet = l_ffi_0.load("WinInet");
local v94 = {
    round = function(v7, v8)
        local v9 = 10 ^ (v8 or 0);
        return math.floor(v7 * v9 + 0.5) / v9;
    end, 
    in_air = function(v10)
        if v10 == nil then
            return;
        else
            local l_m_fFlags_0 = v10.m_fFlags;
            if bit.band(l_m_fFlags_0, 1) == 0 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    on_ground = function(v12)
        if v12 == nil then
            return;
        else
            local l_m_fFlags_1 = v12.m_fFlags;
            if bit.band(l_m_fFlags_1, 1) == 1 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    is_crouching = function(v14)
        if v14 == nil then
            return;
        else
            local l_m_fFlags_2 = v14.m_fFlags;
            if bit.band(l_m_fFlags_2, 4) == 4 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    get_velocity = function(v16)
        if v16 == nil then
            return;
        else
            return (v16.m_vecVelocity:length());
        end;
    end, 
    Download = function(v17, v18)
        -- upvalues: v0 (ref)
        v0.wininet.DeleteUrlCacheEntryA(v17);
        v0.urlmon.URLDownloadToFileA(nil, v17, v18, 0, 0);
    end, 
    get_nearest_enemy = function(_, v20)
        local v21 = entity.get_local_player();
        if not v21 or not v21:is_alive() then
            return;
        else
            local v22 = render.camera_position();
            local v23 = render.camera_angles();
            local v24 = vector():angles(v23);
            local l_huge_0 = math.huge;
            local v26 = nil;
            for v27 = 1, #v20 do
                local v28 = entity.get(v20[v27]);
                local v29 = v28:get_hitbox_position(1):dist_to_ray(v22, v24);
                if v29 < l_huge_0 then
                    l_huge_0 = v29;
                    v26 = v28;
                end;
            end;
            if not v26 then
                return;
            else
                return v26;
            end;
        end;
    end, 
    angle_vector = function(v30, v31)
        local v32 = math.sin(math.rad(v31));
        local v33 = math.cos(math.rad(v31));
        local v34 = math.sin(math.rad(v30));
        local v35 = math.cos(math.rad(v30));
        return v35 * v33, v35 * v32, -v34;
    end, 
    get_damage = function(_, v37, v38, v39, v40)
        local v41 = {};
        local v42 = {};
        local v43 = {};
        local l_x_0 = v37:get_hitbox_position(1).x;
        local l_y_0 = v37:get_hitbox_position(1).y;
        v43[0] = v37:get_hitbox_position(1).z;
        v42[0] = l_y_0;
        v41[0] = l_x_0;
        l_x_0 = v41[0] + 40;
        l_y_0 = v42[0];
        v43[1] = v43[0];
        v42[1] = l_y_0;
        v41[1] = l_x_0;
        l_x_0 = v41[0];
        l_y_0 = v42[0] + 40;
        v43[2] = v43[0];
        v42[2] = l_y_0;
        v41[2] = l_x_0;
        l_x_0 = v41[0] - 40;
        l_y_0 = v42[0];
        v43[3] = v43[0];
        v42[3] = l_y_0;
        v41[3] = l_x_0;
        l_x_0 = v41[0];
        l_y_0 = v42[0] - 40;
        v43[4] = v43[0];
        v42[4] = l_y_0;
        v41[4] = l_x_0;
        l_x_0 = v41[0];
        l_y_0 = v42[0];
        v43[5] = v43[0] + 40;
        v42[5] = l_y_0;
        v41[5] = l_x_0;
        l_x_0 = v41[0];
        l_y_0 = v42[0];
        v43[6] = v43[0] - 40;
        v42[6] = l_y_0;
        v41[6] = l_x_0;
        l_x_0 = {
            damage = 0
        };
        for v46 = 0, 6 do
            if l_x_0.damage == 0 or l_x_0.damage == nil then
                local v47, v48 = utils.trace_bullet(v37, vector(v41[v46], v42[v46], v43[v46]), vector(v38, v39, v40));
                l_x_0.trace = v48;
                l_x_0.damage = v47;
            end;
        end;
        return l_x_0.damage;
    end, 
    lerp = function(v49, v50, v51)
        return v49 + (v50 - v49) * v51;
    end, 
    gram_create = function(v52, v53)
        local v54 = {};
        for v55 = 1, v53 do
            v54[v55] = v52;
        end;
        return v54;
    end, 
    gradient_text = function(v56, v57, v58, v59, v60, v61, v62, v63, v64)
        local v65 = "";
        local v66 = #v64 - 1;
        local v67 = (v60 - v56) / v66;
        local v68 = (v61 - v57) / v66;
        local v69 = (v62 - v58) / v66;
        local v70 = (v63 - v59) / v66;
        for v71 = 1, v66 + 1 do
            v65 = v65 .. ("\a%02x%02x%02x%02x%s"):format(v56, v57, v58, v59, v64:sub(v71, v71));
            v56 = v56 + v67;
            v57 = v57 + v68;
            v58 = v58 + v69;
            v59 = v59 + v70;
        end;
        return v65;
    end, 
    colored_single_text = function(v72, v73, v74, v75, v76, v77, v78, v79, v80)
        local _ = "";
        return (("\a%02x%02x%02x%02x%s\a%02x%02x%02x%02x"):format(v72, v73, v74, v75, v76, v77, v78, v79, v80));
    end, 
    vectordistance = function(v82, v83, v84, v85, v86, v87)
        return math.sqrt(math.pow(v82 - v85, 2) + math.pow(v83 - v86, 2) + math.pow(v84 - v87, 2));
    end, 
    colored_text = function(v88, v89, v90, v91, v92)
        local _ = "";
        return (("\a%02x%02x%02x%02x%s"):format(v88, v89, v90, v91, v92));
    end, 
    screen_size = render.screen_size()
};
if not unpack then
    local _ = table.unpack;
end;
local _ = {};
local v97 = {
    list = {}
};
v97.push = function(v98)
    -- upvalues: v97 (ref)
    assert(v98.element, "Element is nil");
    assert(v98.index, "Index is nil");
    assert(type(v98.index) == "string", "Invalid type of index");
    v97.list[v98.index] = {};
    v97.list[v98.index].element = v98.element;
    v97.list[v98.index].flags = v98.flags or "";
    v97.list[v98.index].visible_state = function()
        -- upvalues: v98 (ref)
        if not v98.conditions then
            return true;
        else
            for _, v100 in pairs(v98.conditions) do
                if not v100() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v97.list[v98.index].element:set_callback(v97.visibility_handle);
    v97.visibility_handle();
end;
v97.get = function(v101)
    -- upvalues: v97 (ref)
    return v97.list[v101] and v97.list[v101].element:get();
end;
v97.get_element = function(v102)
    -- upvalues: v97 (ref)
    return v97.list[v102] and v97.list[v102].element;
end;
v97.delete = function(v103)
    -- upvalues: v97 (ref)
    v97.get(v103):destroy();
    v97.list[v103] = nil;
end;
v97.contains = function(v104, v105)
    -- upvalues: v97 (ref)
    v104 = v97.get(v104);
    if type(v104) ~= "table" then
        return false;
    else
        for v106 = 1, #v104 do
            if v104[v106] == v105 then
                return true;
            end;
        end;
        return false;
    end;
end;
v97.visibility_handle = function()
    -- upvalues: v97 (ref)
    if ui.get_alpha() == 0 then
        return;
    else
        for _, v108 in pairs(v97.list) do
            v108.element:visibility(v108.visible_state());
        end;
        return;
    end;
end;
if not unpack then
    local _ = table.unpack;
end;
local v110 = {
    username = common.get_username(), 
    lua_name = "luxury.club"
};
local v111 = {
    list = {}
};
v111.push = function(v112)
    -- upvalues: v111 (ref)
    assert(v112.element, "Element is nil");
    assert(v112.index, "Index is nil");
    assert(type(v112.index) == "string", "Invalid type of index");
    v111.list[v112.index] = {};
    v111.list[v112.index].element = v112.element;
    v111.list[v112.index].flags = v112.flags or "";
    v111.list[v112.index].visible_state = function()
        -- upvalues: v112 (ref)
        if not v112.conditions then
            return true;
        else
            for _, v114 in pairs(v112.conditions) do
                if not v114() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v111.list[v112.index].element:set_callback(v111.visibility_handle);
    v111.visibility_handle();
end;
v111.get = function(v115)
    -- upvalues: v111 (ref)
    return v111.list[v115] and v111.list[v115].element:get();
end;
v111.get_element = function(v116)
    -- upvalues: v111 (ref)
    return v111.list[v116] and v111.list[v116].element;
end;
v111.delete = function(v117)
    -- upvalues: v111 (ref)
    v111.get(v117):destroy();
    v111.list[v117] = nil;
end;
v111.contains = function(v118, v119)
    -- upvalues: v111 (ref)
    v118 = v111.get(v118);
    if type(v118) ~= "table" then
        return false;
    else
        for v120 = 1, #v118 do
            if v118[v120] == v119 then
                return true;
            end;
        end;
        return false;
    end;
end;
v111.visibility_handle = function()
    -- upvalues: v111 (ref)
    if ui.get_alpha() == 0 then
        return;
    else
        for _, v122 in pairs(v111.list) do
            v122.element:visibility(v122.visible_state());
        end;
        return;
    end;
end;
local v123 = {
    doubletap = {
        switch = ui.find("aimbot", "Ragebot", "Main", "Double Tap"), 
        lag_options = ui.find("aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fakelag_limit = ui.find("aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit")
    }, 
    hitchance = {
        value = ui.find("aimbot", "Ragebot", "Selection", "Hit Chance")
    }, 
    minimum_damage = {
        value = ui.find("aimbot", "Ragebot", "Selection", "Min. Damage"), 
        delay_show = ui.find("aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot")
    }, 
    body_aim = {
        mode = ui.find("aimbot", "Ragebot", "Safety", "Body Aim"), 
        disablers = ui.find("aimbot", "Ragebot", "Safety", "Body Aim", "Disablers")
    }
};
local v124 = {
    fakeping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
};
local v125 = {
    aimbot = {
        main = l_pui_0.create("\f<star>", "\f<star> \bF02555C0C\bF02399[Main]", 1), 
        kartinka = l_pui_0.create("\f<star>", " ", 0), 
        ragebot = l_pui_0.create("\f<star>", "ragebot"), 
        ponos = l_pui_0.create("\f<star>", " \f<shop> \bF02555C0C\bF02399[rage]"), 
        underponos = l_pui_0.create("\f<star>", "  ")
    }
};
local v127 = {
    fake_ping = v125.aimbot.underponos:switch("\bF50C0C\bF102399993[Extended Fake Latency]", false, "\aF50C0C\aF1023999\f<signal>Overriding Fake Latency \vNL feature", function(v126)
        return {
            amount = v126:slider("\a", 0, 1000, 150, 1, "ms")
        }, true;
    end)
};
local v128 = {
    fake_ping = function()
        -- upvalues: v127 (ref), v124 (ref)
        if v127.fake_ping and v127.fake_ping:get() then
            cvar.sv_maxunlag:float(1);
            v124.fakeping:override(v127.fake_ping.amount:get());
            v124.fakeping:disabled(true);
        else
            v124.fakeping:override();
            cvar.sv_maxunlag:float(0.2);
            v124.fakeping:disabled(false);
        end;
    end
};
({
    setup = function(_)
        -- upvalues: v125 (ref), v128 (ref)
        events.render:set(function()
            -- upvalues: v125 (ref), v128 (ref)
            if v125.aimbot.underponos then
                v128.fake_ping();
            end;
        end);
    end
}):setup();
local v130 = render.load_image(network.get("https://i.imgur.com/i1yMAnA.png"), vector(50, 50));
v125.aimbot.kartinka:texture(v130, vector(260, 250));
v125.aimbot.kartinka:label("");
local v131 = ui.get_style("Button"):to_hex();
v125.aimbot.main:label("                         \bF50C0C\bF102399993[~  \239\189\140\239\189\149\239\189\152\239\189\149\239\189\146\239\189\153  ~]                      ");
v125.aimbot.main:label("\bF50C0C\bF102399993[ \234\146\176 \240\159\165\165 \234\146\177\216\152 \224\191\144 \224\191\148*:\239\189\165\239\190\159   welcome,] \bF50C0C\bF555" .. v131 .. "\bF50C0C\bF102399993[" .. common.get_username() .. "]");
v125.aimbot.main:label("\bF50C0C\bF10233" .. v131 .. "[ \234\146\176 \240\159\165\165 \234\146\177\216\152 \224\191\144 \224\191\148*:\239\189\165\239\190\159   latest update - 24.03.2025]");
v125.aimbot.underponos:label("\bF50C0C\bF1023" .. v131 .. "[      \f              \240\157\154\156\240\157\154\157\240\157\154\138\240\157\154\139\240\157\154\149\240\157\154\142 \240\157\154\159\240\157\154\142\240\157\154\155\240\157\154\156\240\157\154\146\240\157\154\152\240\157\154\151 ~ \240\157\159\184\240\157\159\182\240\157\159\184\240\157\159\187         \f      ]");
local l_gradient_1 = require("neverlose/gradient");
local function v134()
    -- upvalues: l_gradient_1 (ref)
    local v133 = l_gradient_1.text_animate("luxury", -0.9, {
        color(139, 44, 44), 
        color(178, 34, 34), 
        color(220, 20, 60)
    });
    ui.sidebar(v133:get_animated_text(), "\240\159\146\150");
    v133:animate();
end;
ui.sidebar(v94.gradient_text(149, 171, 255, 255, 119, 124, 147, 255, v110.lua_name), "\226\154\156\239\184\143");
common.add_notify("\aF50C0C\aF1023999[\240\157\154\160\240\157\154\142\240\157\154\149\240\157\154\140\240\157\154\152\240\157\154\150\240\157\154\142 \240\157\154\139\240\157\154\138\240\157\154\140\240\157\154\148] " .. common.get_username() .. "\240\159\145\139", "\aF50C0C\aF1023999\240\157\154\144\240\157\154\152\240\157\154\152\240\157\154\141 \240\157\154\149\240\157\154\158\240\157\154\140\240\157\154\148 \240\157\154\160\240\157\154\146\240\157\154\157\240\157\154\145 \240\157\154\141\240\157\154\142\240\157\154\156\240\157\154\157\240\157\154\155\240\157\154\152\240\157\154\162\240\157\154\146\240\157\154\151\240\157\154\144");
v127.gears = {};
v111.push({
    flags = "", 
    index = "aimbot_elements", 
    element = v125.aimbot.main:selectable("\bF50C0C\bF102399993[\234\146\176 \240\159\165\165 \234\146\177\216\152 \224\191\144 \224\191\148*:\239\189\165\239\190\159]", {
        [1] = "ragebot"
    })
});
v111.push({
    flags = "", 
    index = "doubletap_options", 
    element = v125.aimbot.ponos:selectable("", {
        [1] = "Faster doubletap", 
        [2] = "Adaptive recharge", 
        [3] = "Predict dt damage"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v111 (ref)
            return v111.contains("aimbot_elements", "ragebot");
        end
    }
});
local v135 = {
    values = {
        remove_overlay = false
    }
};
local v136 = {};
local _ = v123.doubletap.switch:get();
v136.doubletap = {};
v136.doubletap.predict_dt_damage = function()
    -- upvalues: v123 (ref)
    v123.minimum_damage.value:override(nil);
    if rage.exploit:get() ~= 1 then
        return;
    else
        local v138 = ui.get_binds();
        for v139 = 1, #v138 do
            if v138[v139].active and v138[v139].name == "Minimum Damage" then
                return;
            end;
        end;
        local v140 = entity.get_players(true);
        if not v140 then
            return;
        else
            for _, v142 in pairs(v140) do
                if v142 and v142:is_alive() then
                    local l_m_iHealth_0 = v142.m_iHealth;
                    if l_m_iHealth_0 >= 0 then
                        local v144 = entity.get_local_player();
                        if not v144:is_alive() then
                            return;
                        else
                            local v145 = v144:get_player_weapon();
                            if v145 == nil then
                                return;
                            else
                                local v146 = v145:get_weapon_index();
                                if v146 == nil then
                                    return;
                                elseif v146 == 11 or v146 == 38 then
                                    v123.minimum_damage.value:override(math.floor(l_m_iHealth_0 / 2.6 + 0.5));
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v136.doubletap.can_shift_shot = function(v147)
    local v148 = entity.get_local_player();
    if v148 == nil then
        return;
    else
        local v149 = v148:get_player_weapon();
        if not v148 or not v149 then
            return false;
        else
            local l_m_nTickBase_0 = v148.m_nTickBase;
            local v151 = globals.tickinterval * (l_m_nTickBase_0 - v147);
            if v151 < v148.m_flNextAttack then
                return false;
            elseif v151 < v149.m_flNextPrimaryAttack then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v136.doubletap.recharge = function()
    -- upvalues: v136 (ref)
    local v152 = rage.exploit:get();
    if v136.doubletap.can_shift_shot(1) and v152 ~= 1 then
        rage.exploit:allow_charge(true);
        rage.exploit:force_charge();
    end;
end;
v136.handledt = function()
    -- upvalues: v111 (ref)
    if v111.get("Faster Doubletap") then
        local v153 = EngineClient.GetNetChannelInfo():GetAvgLatency(0) * 1000;
        if v153 <= 50 then
            tickbase = "17";
            Exploits.OverrideDoubleTapSpeed(17);
            CVar.FindVar("cl_clock_correction"):SetInt(0);
            CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(450);
        end;
        if v153 >= 60 and v153 < 60 then
            tickbase = "14";
            Exploits.OverrideDoubleTapSpeed(14);
            CVar.FindVar("cl_clock_correction"):SetInt(0);
            CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(300);
        end;
        if v153 >= 60 then
            tickbase = "13";
            Exploits.OverrideDoubleTapSpeed(13);
            CVar.FindVar("cl_clock_correction"):SetInt(1);
            CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(200);
        end;
    end;
    if ui.dtmode:GetBool(1) and EntityList.GetLocalPlayer():GetProp("m_iHealth") < 40 then
        activedtmode = "Vulnerability";
        if ui.vul_mode:GetInt() == 0 then
            tickbase = "14";
            Exploits.OverrideDoubleTapSpeed(14);
            CVar.FindVar("cl_clock_correction"):SetInt(1);
            CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(200);
        elseif ui.vul_mode:GetInt() == 1 then
            tickbase = "17";
            Exploits.OverrideDoubleTapSpeed(17);
            CVar.FindVar("cl_clock_correction"):SetInt(0);
            CVar.FindVar("cl_clock_correction_adjustment_max_amount"):SetInt(450);
        end;
    end;
end;
v135.on_createmove_run = function(_)
    -- upvalues: v111 (ref), v136 (ref)
    if v111.contains("aimbot_elements", "ragebot") then
        if v111.contains("doubletap_options", "Adaptive recharge") then
            v136.doubletap.recharge();
        end;
        if v111.contains("doubletap_options", "Predict dt damage") then
            v136.doubletap.predict_dt_damage();
        end;
    end;
end;
local _ = rage.exploit:get();
debug_info = function()
    local v156 = entity.get_local_player();
    if v156 == nil then
        return;
    else
        local _ = render.screen_size();
        local _ = math.sin(math.abs(-3.14 + globals.curtime * 3.3333333333333335 % 6.28)) * 255;
        local v159 = "false";
        local _ = v156.m_flPoseParameter[11] * 120 - 60;
        if rage.exploit:get() == 0 then
            v159 = "false";
        elseif rage.exploit:get() == 1 then
            v159 = "true";
        end;
        return;
    end;
end;
if v135.on_createmove and type(v135.on_createmove) == "function" then
    events.createmove:set(v135.on_createmove);
end;
if v135.on_createmove_run and type(v135.on_createmove_run) == "function" then
    events.createmove_run:set(v135.on_createmove_run);
end;
if v135.on_render and type(v135.on_render) == "function" then
    events.render:set(v135.on_render);
end;
if v135.on_render then
    events.render:set(function()

    end);
end;
events.render:set(function()
    -- upvalues: v134 (ref)
    if ui.get_alpha() > 0 then
        v134();
    end;
end);
events.createmove:set(function()
    -- upvalues: v134 (ref)
    v134();
end);