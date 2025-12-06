_DEBUG = true;
local v0 = false;
local v1 = v0 and "Beta" or "Stable";
local v2 = {};
local v3 = {};
local v6 = {
    this_call = function(v4, v5)
        return function(...)
            -- upvalues: v4 (ref), v5 (ref)
            return v4(v5, ...);
        end;
    end
};
local v7 = {};
local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_gradient_0 = require("neverlose/gradient");
local l_clipboard_0 = require("neverlose/clipboard");
local function v15(v12, v13, v14)
    table.insert(v12, setmetatable(v13, {
        __index = v14
    }));
end;
local function v21(v16, v17)
    local v18 = v16 and v16 or {};
    for _, v20 in ipairs(v18) do
        if v17 == v20 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v22)
    local v23 = {};
    for v24, _ in pairs(v22) do
        table.insert(v23, v24);
    end;
    return v23;
end;
local function v32(v27, v28)
    local v29 = {};
    for _, v31 in ipairs(v27) do
        if v31 ~= v28 then
            table.insert(v29, v31);
        end;
    end;
    return v29;
end;
local function v33()
    return math.floor(math.sin(math.abs(-math.pi + globals.curtime * 1.5 % (math.pi * 2))) * 100) / 100;
end;
local v34 = {
    user = common.get_username(), 
    screen = render.screen_size()
};
local v35 = {
    slow_wark = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    auto_stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"), 
    dt_auto_stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Double Tap"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
local v36 = {};
local v46 = {
    create_draggable = function(v37, v38, v39, v40, v41, v42)
        -- upvalues: v7 (ref), v34 (ref), v36 (ref)
        local v43 = ui.create("Drag items");
        v7.new(v41 .. "_x", v43:slider(v41 .. "_x", 0, v34.screen.x, v37), function()
            return false;
        end);
        v7.new(v41 .. "_y", v43:slider(v41 .. "_y", 0, v34.screen.y, v38), function()
            return false;
        end);
        return {
            started_dragging = false, 
            position_x = v7.elements[v41 .. "_x"]:get(), 
            position_y = v7.elements[v41 .. "_y"]:get(), 
            size_x = v39, 
            size_y = v40, 
            initial_drag_pos = vector(0, 0), 
            drag_pos = vector(0, 0), 
            callback_function = v42, 
            update = function(v44)
                -- upvalues: v36 (ref), v41 (ref), v7 (ref)
                if ui.get_alpha() > 0 then
                    local v45 = ui.get_mouse_position();
                    if (v45.x >= v44.position_x and v45.y >= v44.position_y and v45.x <= v44.position_x + v44.size_x and v45.y <= v44.position_y + v44.size_y or v44.started_dragging) and common.is_button_down(1) and (v36.mouse_target == 0 or v36.mouse_target == v41) then
                        v36.mouse_target = v41;
                        if not v44.started_dragging then
                            v44.started_dragging = true;
                            v44.initial_drag_pos = vector(v45.x - v44.position_x, v45.y - v44.position_y);
                        else
                            v44.position_x = v45.x - v44.initial_drag_pos.x;
                            v44.position_y = v45.y - v44.initial_drag_pos.y;
                            v7.elements[v41 .. "_x"]:set(math.floor(tonumber(v44.position_x)));
                            v7.elements[v41 .. "_y"]:set(math.floor(tonumber(v44.position_y)));
                        end;
                    elseif not common.is_button_down(1) then
                        v36.mouse_target = 0;
                        v44.started_dragging = false;
                        v44.initial_drag_pos = v44.drag_pos;
                    end;
                end;
                v44:callback_function();
            end
        };
    end
};
string.multi_color = function(v47, _)
    local v49 = "";
    for _, v51 in ipairs(v47) do
        local v52 = v51[1];
        local v53 = v51[2] or color();
        local v54 = "";
        if v53 ~= nil then
            v54 = v53:to_hex();
        end;
        v49 = v49 .. "\a" .. v54 .. v52;
    end;
    return v49;
end;
local function v55()
    return ui.get_style()["Link Active"];
end;
local function v59(v56, v57, _)
    -- upvalues: v55 (ref)
    if v57 == nil then
        v57 = v55();
    end;
    return "\a" .. v57.to_hex(v57) .. tostring(v56) .. "\aDEFAULT";
end;
local function v72(v60, v61, v62, _)
    -- upvalues: v55 (ref)
    if v61 == nil or v62 == nil then
        local v64 = v55();
        v61 = v64;
        v62 = v64 / 1.3;
    end;
    local v65 = #v60;
    local v66 = (v62.r - v61.r) / v65;
    local v67 = (v62.g - v61.g) / v65;
    local v68 = (v62.b - v61.b) / v65;
    local v69 = (v62.a - v61.a) / v65;
    local v70 = "";
    for v71 = 1, v65 do
        v70 = v70 .. "\a" .. v61.to_hex(v61) .. v60:sub(v71, v71);
        v61.r = v61.r + v66;
        v61.g = v61.g + v67;
        v61.b = v61.b + v68;
        v61.a = v61.a + v69;
    end;
    return v70;
end;
local function v74(v73)
    if not v73 or not v73 then
        v73 = 1;
    end;
    if globals.is_connected then
        return math.floor(utils.net_channel().latency[v73] * 1000);
    else
        return 0;
    end;
end;
local v75 = {
    data = {}
};
v75.lerp = function(v76, v77, v78)
    -- upvalues: v75 (ref)
    if v78 == nil then
        v78 = 0.09;
    end;
    if type(v76) == "userdata" then
        local v79 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0
        };
        for v80, v81 in ipairs({
            [1] = "r", 
            [2] = "g", 
            [3] = "b", 
            [4] = "a"
        }) do
            v79[v80] = v75.lerp(v76[v81], v77[v81], v78);
        end;
        return color(unpack(v79));
    else
        return (v77 - v76) * v78 + v76;
    end;
end;
v75.new = function(v82, v83, v84)
    -- upvalues: v75 (ref)
    if v75.data[v82] == nil then
        v75.data[v82] = v83;
    end;
    v75.data[v82] = v75.lerp(v75.data[v82], v83, v84);
    return v75.data[v82];
end;
v7.elements = {};
v7.refs = {};
v7.run_update = function()
    -- upvalues: v7 (ref)
    for _, v86 in pairs(v7.refs) do
        if v86.condition ~= nil then
            v86.ref:visibility(v86.condition());
        end;
    end;
end;
v7.new = function(v87, v88, v89)
    -- upvalues: v7 (ref)
    v7.refs[v87] = {
        ref = v88, 
        name = v87, 
        condition = v89
    };
    local function v90()
        -- upvalues: v7 (ref), v87 (ref), v88 (ref)
        v7.elements[v87] = v88;
        v7.run_update();
    end;
    v90();
    v88:set_callback(v90);
    return v88;
end;
local v95 = {
    data = {}, 
    whitelist_elements = {
        [1] = "antiaim_condition", 
        [2] = "config_name", 
        [3] = "config_manage", 
        [4] = "config_list", 
        [5] = "config_type", 
        [6] = "aspect_ratio_value", 
        [7] = "aspect_ratio_enable", 
        [8] = "config_copy", 
        [9] = "config_load_copied", 
        [10] = "config_default"
    }, 
    get = function()
        -- upvalues: v7 (ref), l_base64_0 (ref), v34 (ref)
        local v91 = {};
        for v92, v93 in pairs(v7.elements) do
            local v94 = v93:get();
            if v92:find("color") then
                v94 = v94:to_hex();
            end;
            v91[v92] = v94;
        end;
        return ("aarneclub>%s<"):format(l_base64_0.encode(json.stringify({
            author = v34.user, 
            data = v91
        })));
    end
};
v95.copy = function()
    -- upvalues: l_clipboard_0 (ref), v95 (ref)
    local v96 = pcall(function()
        -- upvalues: l_clipboard_0 (ref), v95 (ref)
        l_clipboard_0.set(v95.get());
    end);
    common.add_notify("Config", not v96 and "Failed on copying config." or "Config successfully copied!");
end;
v95.load = function(v97)
    -- upvalues: l_base64_0 (ref), v7 (ref)
    local v98 = "";
    local v102 = pcall(function()
        -- upvalues: l_base64_0 (ref), v97 (ref), v98 (ref), v7 (ref)
        local v99 = json.parse(l_base64_0.decode(v97:match("aarneclub>(.-)<")));
        v98 = v99.author;
        for v100, v101 in pairs(v99.data) do
            if v100:find("color") then
                v101 = type(v101) == "string" and color():init(v101) or color();
            end;
            if v7.elements[v100] ~= nil and v101 ~= nil then
                v7.elements[v100]:set(v101);
            end;
        end;
        v7.run_update();
    end);
    common.add_notify("Config", not v102 and "Cant load this data, copy config and try again." or "Successfully loaded config by " .. v98);
end;
local v103 = {
    cvar_timer = cvar.mp_c4timer
};
v103.init = function()
    -- upvalues: v103 (ref)
    local v104 = entity.get_entities("CPlantedC4")[1];
    return {
        get_site = function(_)
            -- upvalues: v104 (ref)
            local v106 = "?";
            if v104 ~= nil and v104.m_nBombSite ~= nil then
                v106 = v104.m_nBombSite == 0 and "A" or "B";
            end;
            return v106;
        end, 
        get_timer = function(_)
            -- upvalues: v104 (ref), v103 (ref)
            local v108 = 0;
            local v109 = 1;
            if v104 ~= nil and v104.m_flC4Blow ~= nil then
                local _ = v103.cvar_timer:float();
                local v111 = v104.m_flC4Blow - globals.curtime;
                if v111 > 0 then
                    v108 = v111;
                    v109 = 1 / v104.m_flTimerLength * v111;
                end;
            end;
            return v108, v109;
        end, 
        get_damage = function(_)
            -- upvalues: v104 (ref)
            local v113 = false;
            local v114 = 0;
            local v115 = entity.get_local_player();
            if v115 ~= nil and v104 ~= nil then
                local v116 = v115:get_origin():dist((v104:get_origin()));
                local v117 = 450.7;
                local v118 = (v116 - 75.68) / 789.2;
                local v119 = v117 * math.exp(-v118 * v118);
                local l_m_ArmorValue_0 = v115.m_ArmorValue;
                if l_m_ArmorValue_0 > 0 then
                    local v121 = v119 * 0.5;
                    local v122 = (v119 - v121) * 0.5;
                    if l_m_ArmorValue_0 < v122 then
                        l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                        v121 = v119 - v122;
                    end;
                    v119 = v121;
                end;
                v114 = math.floor(v119);
                v113 = v115.m_iHealth <= v114;
            end;
            return v113, v114;
        end, 
        get_defuse_time = function(v123)
            -- upvalues: v104 (ref)
            local v124 = false;
            local v125 = 0;
            local v126 = false;
            local v127 = 1;
            local v128 = v123:get_timer();
            if v104 ~= nil then
                local _ = v104.m_bBombDefused;
                local l_m_hBombDefuser_0 = v104.m_hBombDefuser;
                local l_m_flDefuseLength_0 = v104.m_flDefuseLength;
                v125 = l_m_hBombDefuser_0 and v104.m_flDefuseCountDown - globals.curtime or -1;
                v124 = v125 > 0;
                v126 = v125 < v128;
                v127 = 1 / l_m_flDefuseLength_0 * v125;
            end;
            return v124, v125, v126, v127;
        end, 
        get_state = function(v132)
            -- upvalues: v104 (ref)
            local v133 = false;
            local v134 = false;
            local v135 = v132:get_timer();
            if v104 ~= nil then
                v133 = v104.m_bBombTicking and v135 > 0;
                v134 = v104.m_bBombDefused;
            end;
            return v133, v134;
        end, 
        planting = function(_)
            local v137 = false;
            entity.get_entities("CC4", true, function(v138)
                -- upvalues: v137 (ref)
                v137 = v138.m_bStartedArming;
            end);
        end
    };
end;
local function v143(v139, v140)
    -- upvalues: v72 (ref)
    local v141 = ui.get_style()["Link Active"];
    local v142 = string.multi_color({
        [1] = {
            [1] = v72("aarneclub", v141, v141 / 1.3)
        }, 
        [2] = {
            " : ", 
            color(50, 50, 50)
        }, 
        [3] = {
            v139, 
            color()
        }, 
        [4] = {
            [1] = v72(v140, v141, v141 / 1.3)
        }
    });
    print_raw(v142);
end;
local function v145(v144)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v144);
end;
local function v149(v146, v147)
    -- upvalues: v59 (ref)
    local v148 = ui.get_icon(v146) or "";
    return v59(v148, nil, true) .. (v147 ~= nil and "  " .. v147 or "");
end;
local v150 = {
    accent = ui.get_style("Link Active"), 
    dark = color(25, 25, 25), 
    text = color(240, 240, 240)
};
local function v154(v151, ...)
    -- upvalues: v150 (ref)
    v151 = v151:gsub("\v", "\a" .. v150.accent:to_hex()):gsub("\r", "\aDEFAULT"):gsub("\f%b<>", function(v152)
        return ui.get_icon(v152:match("<(.-)>"));
    end):gsub("\a%b[]", function(v153)
        -- upvalues: v150 (ref)
        return "\a" .. (v150[v153:sub(3, -2)] or color()):to_hex();
    end);
    if #{
        ...
    } > 0 then
        return v151:format(...);
    else
        return v151;
    end;
end;
local v155 = {
    main = v154("\f<house>")
};
v155.aarneclub = ui.create(v155.main, "home", 1);
v155.aarneclub:label(v154("\f<hand-wave>  Hello, %s", v34.user));
v155.aarneclub:label(v154("\f<code>  Build: %s", v1));
local _ = nil;
local v157 = l_pui_0.create(v155.main, "products", 1);
v157:label("\f<flask>   evalate \226\128\186 Beta");
v157:button("  \f<arrow-up-right-from-square>  Try for free  ", function()
    -- upvalues: v145 (ref)
    v145("http://market.neverlose.cc/k3jdRt");
end, true);
v155.config = ui.create(v155.main, "presets", 2);
v155.config:button(v154("   \f<copy>  Copy   "), function()
    -- upvalues: v95 (ref)
    v95.copy();
end, true);
v155.config:button(v154("   \f<download>  Paste   "), function()
    -- upvalues: v95 (ref), l_clipboard_0 (ref)
    v95.load(l_clipboard_0.get());
end, true);
v155.config:button(v154("   \f<check>  Default   "), function()
    -- upvalues: v95 (ref)
    v95.load("aarneclub>eyJhdXRob3IiOiJwcmluY2UxMzM3IiwiZGF0YSI6eyJhaXJfaGl0Y2hhbmNlX2VuYWJsZSI6dHJ1ZSwiYWlyX2hpdGNoYW5jZV92YWx1ZSI6NDMuMCwiYWlyX2hpdGNoYW5jZV93ZWFwb25zIjpbIlNjb3V0IiwiUjggUmV2b2x2ZXIiXSwiYW50aWFpbV9EaXNhYmxlIEFudGkgQnJ1dGVmb3JjZV9BaXIiOnRydWUsImFudGlhaW1fRGlzYWJsZSBBbnRpIEJydXRlZm9yY2VfQWlyLUNyb3VjaCI6dHJ1ZSwiYW50aWFpbV9EaXNhYmxlIEFudGkgQnJ1dGVmb3JjZV9Dcm91Y2giOnRydWUsImFudGlhaW1fRGlzYWJsZSBBbnRpIEJydXRlZm9yY2VfR2xvYmFsIjp0cnVlLCJhbnRpYWltX0Rpc2FibGUgQW50aSBCcnV0ZWZvcmNlX01vdmUiOmZhbHNlLCJhbnRpYWltX0Rpc2FibGUgQW50aSBCcnV0ZWZvcmNlX05vIEV4cGxvaXRzIjpmYWxzZSwiYW50aWFpbV9EaXNhYmxlIEFudGkgQnJ1dGVmb3JjZV9PbiBVc2UiOnRydWUsImFudGlhaW1fRGlzYWJsZSBBbnRpIEJydXRlZm9yY2VfU2xvdy1NbyI6dHJ1ZSwiYW50aWFpbV9EaXNhYmxlIEFudGkgQnJ1dGVmb3JjZV9TdGFuZCI6ZmFsc2UsImFudGlhaW1fRnJlZXN0YW5kaW5nIEJvZHlfQWlyIjoiT2ZmIiwiYW50aWFpbV9GcmVlc3RhbmRpbmcgQm9keV9BaXItQ3JvdWNoIjoiT2ZmIiwiYW50aWFpbV9GcmVlc3RhbmRpbmcgQm9keV9Dcm91Y2giOiJPZmYiLCJhbnRpYWltX0ZyZWVzdGFuZGluZyBCb2R5X0dsb2JhbCI6Ik9mZiIsImFudGlhaW1fRnJlZXN0YW5kaW5nIEJvZHlfTW92ZSI6Ik9mZiIsImFudGlhaW1fRnJlZXN0YW5kaW5nIEJvZHlfTm8gRXhwbG9pdHMiOiJPZmYiLCJhbnRpYWltX0ZyZWVzdGFuZGluZyBCb2R5X09uIFVzZSI6IlBlZWsgRmFrZSIsImFudGlhaW1fRnJlZXN0YW5kaW5nIEJvZHlfU2xvdy1NbyI6Ik9mZiIsImFudGlhaW1fRnJlZXN0YW5kaW5nIEJvZHlfU3RhbmQiOiJPZmYiLCJhbnRpYWltX0ppdHRlciBWYWx1ZV9BaXIiOjAuMCwiYW50aWFpbV9KaXR0ZXIgVmFsdWVfQWlyLUNyb3VjaCI6MC4wLCJhbnRpYWltX0ppdHRlciBWYWx1ZV9Dcm91Y2giOjAuMCwiYW50aWFpbV9KaXR0ZXIgVmFsdWVfR2xvYmFsIjo2MC4wLCJhbnRpYWltX0ppdHRlciBWYWx1ZV9Nb3ZlIjoyNC4wLCJhbnRpYWltX0ppdHRlciBWYWx1ZV9ObyBFeHBsb2l0cyI6MC4wLCJhbnRpYWltX0ppdHRlciBWYWx1ZV9PbiBVc2UiOjYwLjAsImFudGlhaW1fSml0dGVyIFZhbHVlX1Nsb3ctTW8iOjAuMCwiYW50aWFpbV9KaXR0ZXIgVmFsdWVfU3RhbmQiOjAuMCwiYW50aWFpbV9MZWZ0IExpbWl0X0FpciI6NjAuMCwiYW50aWFpbV9MZWZ0IExpbWl0X0Fpci1Dcm91Y2giOjMxLjAsImFudGlhaW1fTGVmdCBMaW1pdF9Dcm91Y2giOjYwLjAsImFudGlhaW1fTGVmdCBMaW1pdF9HbG9iYWwiOjQ4LjAsImFudGlhaW1fTGVmdCBMaW1pdF9Nb3ZlIjo2MC4wLCJhbnRpYWltX0xlZnQgTGltaXRfTm8gRXhwbG9pdHMiOjAuMCwiYW50aWFpbV9MZWZ0IExpbWl0X09uIFVzZSI6NjAuMCwiYW50aWFpbV9MZWZ0IExpbWl0X1Nsb3ctTW8iOjEzLjAsImFudGlhaW1fTGVmdCBMaW1pdF9TdGFuZCI6MC4wLCJhbnRpYWltX0xpbWl0IFR5cGVfQWlyIjoiU3RhdGljIiwiYW50aWFpbV9MaW1pdCBUeXBlX0Fpci1Dcm91Y2giOiJTdGF0aWMiLCJhbnRpYWltX0xpbWl0IFR5cGVfQ3JvdWNoIjoiU3RhdGljIiwiYW50aWFpbV9MaW1pdCBUeXBlX0dsb2JhbCI6IkppdHRlciIsImFudGlhaW1fTGltaXQgVHlwZV9Nb3ZlIjoiU3RhdGljIiwiYW50aWFpbV9MaW1pdCBUeXBlX05vIEV4cGxvaXRzIjoiU3RhdGljIiwiYW50aWFpbV9MaW1pdCBUeXBlX09uIFVzZSI6IlN0YXRpYyIsImFudGlhaW1fTGltaXQgVHlwZV9TbG93LU1vIjoiU3RhdGljIiwiYW50aWFpbV9MaW1pdCBUeXBlX1N0YW5kIjoiU3RhdGljIiwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgTGVmdF9BaXIiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgTGVmdF9BaXItQ3JvdWNoIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIExlZnRfQ3JvdWNoIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIExlZnRfR2xvYmFsIjotODUuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgTGVmdF9Nb3ZlIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIExlZnRfTm8gRXhwbG9pdHMiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgTGVmdF9PbiBVc2UiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgTGVmdF9TbG93LU1vIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIExlZnRfU3RhbmQiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgUmlnaHRfQWlyIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIFJpZ2h0X0Fpci1Dcm91Y2giOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgUmlnaHRfQ3JvdWNoIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIFJpZ2h0X0dsb2JhbCI6LTI3LjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIFJpZ2h0X01vdmUiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgUmlnaHRfTm8gRXhwbG9pdHMiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgUmlnaHRfT24gVXNlIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlIFJpZ2h0X1Nsb3ctTW8iOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWUgUmlnaHRfU3RhbmQiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWVfQWlyIjoxNi4wLCJhbnRpYWltX01vZGlmaWVyIERlZ3JlZV9BaXItQ3JvdWNoIjotNC4wLCJhbnRpYWltX01vZGlmaWVyIERlZ3JlZV9Dcm91Y2giOjI1LjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlX0dsb2JhbCI6MTguMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWVfTW92ZSI6MjguMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWVfTm8gRXhwbG9pdHMiOjAuMCwiYW50aWFpbV9Nb2RpZmllciBEZWdyZWVfT24gVXNlIjowLjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlX1Nsb3ctTW8iOjE4LjAsImFudGlhaW1fTW9kaWZpZXIgRGVncmVlX1N0YW5kIjowLjAsImFudGlhaW1fT3B0aW9uc19BaXIiOlsiSml0dGVyIl0sImFudGlhaW1fT3B0aW9uc19BaXItQ3JvdWNoIjpbIkppdHRlciJdLCJhbnRpYWltX09wdGlvbnNfQ3JvdWNoIjpbIkppdHRlciJdLCJhbnRpYWltX09wdGlvbnNfR2xvYmFsIjpbIkppdHRlciJdLCJhbnRpYWltX09wdGlvbnNfTW92ZSI6W10sImFudGlhaW1fT3B0aW9uc19ObyBFeHBsb2l0cyI6W10sImFudGlhaW1fT3B0aW9uc19PbiBVc2UiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiXSwiYW50aWFpbV9PcHRpb25zX1Nsb3ctTW8iOlsiSml0dGVyIiwiUmFuZG9taXplIEppdHRlciJdLCJhbnRpYWltX09wdGlvbnNfU3RhbmQiOltdLCJhbnRpYWltX092ZXJyaWRlX0FpciI6dHJ1ZSwiYW50aWFpbV9PdmVycmlkZV9BaXItQ3JvdWNoIjpmYWxzZSwiYW50aWFpbV9PdmVycmlkZV9Dcm91Y2giOnRydWUsImFudGlhaW1fT3ZlcnJpZGVfTW92ZSI6ZmFsc2UsImFudGlhaW1fT3ZlcnJpZGVfTm8gRXhwbG9pdHMiOmZhbHNlLCJhbnRpYWltX092ZXJyaWRlX09uIFVzZSI6dHJ1ZSwiYW50aWFpbV9PdmVycmlkZV9TbG93LU1vIjpmYWxzZSwiYW50aWFpbV9PdmVycmlkZV9TdGFuZCI6ZmFsc2UsImFudGlhaW1fUmFuZG9taXphdGlvbiBEZWdyZWVfQWlyIjowLjAsImFudGlhaW1fUmFuZG9taXphdGlvbiBEZWdyZWVfQWlyLUNyb3VjaCI6MC4wLCJhbnRpYWltX1JhbmRvbWl6YXRpb24gRGVncmVlX0Nyb3VjaCI6MC4wLCJhbnRpYWltX1JhbmRvbWl6YXRpb24gRGVncmVlX0dsb2JhbCI6MC4wLCJhbnRpYWltX1JhbmRvbWl6YXRpb24gRGVncmVlX01vdmUiOjAuMCwiYW50aWFpbV9SYW5kb21pemF0aW9uIERlZ3JlZV9ObyBFeHBsb2l0cyI6MC4wLCJhbnRpYWltX1JhbmRvbWl6YXRpb24gRGVncmVlX09uIFVzZSI6MC4wLCJhbnRpYWltX1JhbmRvbWl6YXRpb24gRGVncmVlX1Nsb3ctTW8iOjAuMCwiYW50aWFpbV9SYW5kb21pemF0aW9uIERlZ3JlZV9TdGFuZCI6MC4wLCJhbnRpYWltX1JpZ2h0IExpbWl0X0FpciI6NjAuMCwiYW50aWFpbV9SaWdodCBMaW1pdF9BaXItQ3JvdWNoIjoyMS4wLCJhbnRpYWltX1JpZ2h0IExpbWl0X0Nyb3VjaCI6NjAuMCwiYW50aWFpbV9SaWdodCBMaW1pdF9HbG9iYWwiOjI0LjAsImFudGlhaW1fUmlnaHQgTGltaXRfTW92ZSI6NjAuMCwiYW50aWFpbV9SaWdodCBMaW1pdF9ObyBFeHBsb2l0cyI6MC4wLCJhbnRpYWltX1JpZ2h0IExpbWl0X09uIFVzZSI6NjAuMCwiYW50aWFpbV9SaWdodCBMaW1pdF9TbG93LU1vIjo2LjAsImFudGlhaW1fUmlnaHQgTGltaXRfU3RhbmQiOjAuMCwiYW50aWFpbV9Ud28gRGVncmVlX0FpciI6ZmFsc2UsImFudGlhaW1fVHdvIERlZ3JlZV9BaXItQ3JvdWNoIjpmYWxzZSwiYW50aWFpbV9Ud28gRGVncmVlX0Nyb3VjaCI6ZmFsc2UsImFudGlhaW1fVHdvIERlZ3JlZV9HbG9iYWwiOnRydWUsImFudGlhaW1fVHdvIERlZ3JlZV9Nb3ZlIjpmYWxzZSwiYW50aWFpbV9Ud28gRGVncmVlX05vIEV4cGxvaXRzIjpmYWxzZSwiYW50aWFpbV9Ud28gRGVncmVlX09uIFVzZSI6ZmFsc2UsImFudGlhaW1fVHdvIERlZ3JlZV9TbG93LU1vIjpmYWxzZSwiYW50aWFpbV9Ud28gRGVncmVlX1N0YW5kIjpmYWxzZSwiYW50aWFpbV9XYXlzX0FpciI6NS4wLCJhbnRpYWltX1dheXNfQWlyLUNyb3VjaCI6NS4wLCJhbnRpYWltX1dheXNfQ3JvdWNoIjo1LjAsImFudGlhaW1fV2F5c19HbG9iYWwiOjUuMCwiYW50aWFpbV9XYXlzX01vdmUiOjYuMCwiYW50aWFpbV9XYXlzX05vIEV4cGxvaXRzIjo1LjAsImFudGlhaW1fV2F5c19PbiBVc2UiOjUuMCwiYW50aWFpbV9XYXlzX1Nsb3ctTW8iOjUuMCwiYW50aWFpbV9XYXlzX1N0YW5kIjo1LjAsImFudGlhaW1fWWF3IEFkZCBMZWZ0X0FpciI6MC4wLCJhbnRpYWltX1lhdyBBZGQgTGVmdF9BaXItQ3JvdWNoIjotMTkuMCwiYW50aWFpbV9ZYXcgQWRkIExlZnRfQ3JvdWNoIjozMi4wLCJhbnRpYWltX1lhdyBBZGQgTGVmdF9HbG9iYWwiOjQ0LjAsImFudGlhaW1fWWF3IEFkZCBMZWZ0X01vdmUiOjAuMCwiYW50aWFpbV9ZYXcgQWRkIExlZnRfTm8gRXhwbG9pdHMiOjAuMCwiYW50aWFpbV9ZYXcgQWRkIExlZnRfT24gVXNlIjowLjAsImFudGlhaW1fWWF3IEFkZCBMZWZ0X1Nsb3ctTW8iOjAuMCwiYW50aWFpbV9ZYXcgQWRkIExlZnRfU3RhbmQiOjAuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X0FpciI6MC4wLCJhbnRpYWltX1lhdyBBZGQgUmlnaHRfQWlyLUNyb3VjaCI6MjkuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X0Nyb3VjaCI6MzAuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X0dsb2JhbCI6NDUuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X01vdmUiOjAuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X05vIEV4cGxvaXRzIjowLjAsImFudGlhaW1fWWF3IEFkZCBSaWdodF9PbiBVc2UiOjAuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X1Nsb3ctTW8iOjAuMCwiYW50aWFpbV9ZYXcgQWRkIFJpZ2h0X1N0YW5kIjowLjAsImFudGlhaW1fWWF3IE1vZGlmaWVyX0FpciI6IkNlbnRlciIsImFudGlhaW1fWWF3IE1vZGlmaWVyX0Fpci1Dcm91Y2giOiJDZW50ZXIiLCJhbnRpYWltX1lhdyBNb2RpZmllcl9Dcm91Y2giOiJYLVdheSIsImFudGlhaW1fWWF3IE1vZGlmaWVyX0dsb2JhbCI6Ik9mZnNldCIsImFudGlhaW1fWWF3IE1vZGlmaWVyX01vdmUiOiJYLVdheSIsImFudGlhaW1fWWF3IE1vZGlmaWVyX05vIEV4cGxvaXRzIjoiRGlzYWJsZWQiLCJhbnRpYWltX1lhdyBNb2RpZmllcl9PbiBVc2UiOiJEaXNhYmxlZCIsImFudGlhaW1fWWF3IE1vZGlmaWVyX1Nsb3ctTW8iOiJDZW50ZXIiLCJhbnRpYWltX1lhdyBNb2RpZmllcl9TdGFuZCI6IkRpc2FibGVkIiwiYW50aWFpbV9jb25kaXRpb24iOiJHbG9iYWwiLCJhbnRpYWltX2VuYWJsZSI6dHJ1ZSwiYW50aWFpbV9tYW51YWxzIjoiQXQgVGFyZ2V0IiwiYW50aWFpbV9tb3JlIjpbIkF2b2lkIEJhY2tzdGFiIiwiT24gVXNlIEFBIiwiQnJlYWsgTEMgaW4gQWlyIiwiU3RhdGljIE1hbnVhbHMiXSwiYW50aWJydXRlX2FkZCI6ZmFsc2UsImFudGlicnV0ZV9jb3VudCI6Mi4wLCJhbnRpYnJ1dGVfZGVncmVlOjEiOjAuMCwiYW50aWJydXRlX2RlZ3JlZToxMCI6MC4wLCJhbnRpYnJ1dGVfZGVncmVlOjIiOjAuMCwiYW50aWJydXRlX2RlZ3JlZTozIjowLjAsImFudGlicnV0ZV9kZWdyZWU6NCI6MC4wLCJhbnRpYnJ1dGVfZGVncmVlOjUiOjAuMCwiYW50aWJydXRlX2RlZ3JlZTo2IjowLjAsImFudGlicnV0ZV9kZWdyZWU6NyI6MC4wLCJhbnRpYnJ1dGVfZGVncmVlOjgiOjAuMCwiYW50aWJydXRlX2RlZ3JlZTo5IjowLjAsImFudGlicnV0ZV9kZWxldGUiOmZhbHNlLCJhbnRpYnJ1dGVfbGFiZWwiOjEwNDM4ODQxMjcuMCwiYW50aWJydXRlX2xhYmVsOjEiOjIxNTY2NzU4NDEuMCwiYW50aWJydXRlX2xhYmVsOjEwIjoyNDUwODI2MDY1LjAsImFudGlicnV0ZV9sYWJlbDoyIjoyMTU2Njc1ODQyLjAsImFudGlicnV0ZV9sYWJlbDozIjoyMTU2Njc1ODQzLjAsImFudGlicnV0ZV9sYWJlbDo0IjoyMTU2Njc1ODQ0LjAsImFudGlicnV0ZV9sYWJlbDo1IjoyMTU2Njc1ODQ1LjAsImFudGlicnV0ZV9sYWJlbDo2IjoyMTU2Njc1ODQ2LjAsImFudGlicnV0ZV9sYWJlbDo3IjoyMTU2Njc1ODQ3LjAsImFudGlicnV0ZV9sYWJlbDo4IjoyMTU2Njc1ODQ4LjAsImFudGlicnV0ZV9sYWJlbDo5IjoyMTU2Njc1ODQ5LjAsImFudGlicnV0ZV9sZWZ0OjEiOjAuMCwiYW50aWJydXRlX2xlZnQ6MTAiOjAuMCwiYW50aWJydXRlX2xlZnQ6MiI6MC4wLCJhbnRpYnJ1dGVfbGVmdDozIjowLjAsImFudGlicnV0ZV9sZWZ0OjQiOjAuMCwiYW50aWJydXRlX2xlZnQ6NSI6MC4wLCJhbnRpYnJ1dGVfbGVmdDo2IjowLjAsImFudGlicnV0ZV9sZWZ0OjciOjAuMCwiYW50aWJydXRlX2xlZnQ6OCI6MC4wLCJhbnRpYnJ1dGVfbGVmdDo5IjowLjAsImFudGlicnV0ZV9tb2RpZmllcjoxIjoiRGlzYWJsZWQiLCJhbnRpYnJ1dGVfbW9kaWZpZXI6MTAiOiJEaXNhYmxlZCIsImFudGlicnV0ZV9tb2RpZmllcjoyIjoiRGlzYWJsZWQiLCJhbnRpYnJ1dGVfbW9kaWZpZXI6MyI6IkRpc2FibGVkIiwiYW50aWJydXRlX21vZGlmaWVyOjQiOiJEaXNhYmxlZCIsImFudGlicnV0ZV9tb2RpZmllcjo1IjoiRGlzYWJsZWQiLCJhbnRpYnJ1dGVfbW9kaWZpZXI6NiI6IkRpc2FibGVkIiwiYW50aWJydXRlX21vZGlmaWVyOjciOiJEaXNhYmxlZCIsImFudGlicnV0ZV9tb2RpZmllcjo4IjoiRGlzYWJsZWQiLCJhbnRpYnJ1dGVfbW9kaWZpZXI6OSI6IkRpc2FibGVkIiwiYW50aWJydXRlX3JpZ2h0OjEiOjAuMCwiYW50aWJydXRlX3JpZ2h0OjEwIjowLjAsImFudGlicnV0ZV9yaWdodDoyIjowLjAsImFudGlicnV0ZV9yaWdodDozIjowLjAsImFudGlicnV0ZV9yaWdodDo0IjowLjAsImFudGlicnV0ZV9yaWdodDo1IjowLjAsImFudGlicnV0ZV9yaWdodDo2IjowLjAsImFudGlicnV0ZV9yaWdodDo3IjowLjAsImFudGlicnV0ZV9yaWdodDo4IjowLjAsImFudGlicnV0ZV9yaWdodDo5IjowLjAsImFycm93cyI6ZmFsc2UsImFycm93c19hY3RpdmVfY29sb3IiOiJDNkFDOTRGRiIsImFycm93c19kaXN0YW5jZSI6NDMuMCwiYXJyb3dzX2luX3Njb3BlIjoiUmVwbGFjZSIsImFycm93c19pbmFjdGl2ZV9jb2xvciI6IjAwMDAwMDMyIiwiYXJyb3dzX2ludmVydGVkX2NvbG9yIjoiQzZBQzk0RkYiLCJhcnJvd3Nfc2l6ZSI6Ni4wLCJhc3BlY3RfcmF0aW9fZW5hYmxlIjpmYWxzZSwiYXNwZWN0X3JhdGlvX3ZhbHVlIjoxNTguMCwiYnJlYWtlcnMiOltdLCJjbGFudGFnX2N1c3RvbSI6ImJvbWJhc3RpYy5sdWEiLCJjbGFudGFnX2VuYWJsZSI6dHJ1ZSwiY2xhbnRhZ190eXBlIjoiY3VzdG9tIiwiY29uc29sZV9jb2xvciI6IkM2QUM5NEZGIiwiY29uc29sZV9lbmFibGUiOnRydWUsImNyb3NzX2FjdGl2ZV9jb2xvciI6IkM2QUM5NEZGIiwiY3Jvc3NfZGFtYWdlX251bSI6ZmFsc2UsImNyb3NzX2luYWN0aXZlX2NvbG9yIjoiNjA1MzQ4RkYiLCJjcm9zc19wb3MiOiJDZW50ZXIiLCJjcm9zc2hhaXJfaW5kaWNhdG9ycyI6dHJ1ZSwiZGFtYWdlX2luZGljYXRvcl94Ijo5NjIuMCwiZGFtYWdlX2luZGljYXRvcl95Ijo1MTcuMCwiZ3JlbmFkZV9yYWRfZW5hYmxlIjpmYWxzZSwiZ3JlbmFkZXMiOltdLCJoaXRsb2dzIjp0cnVlLCJoaXRsb2dzX2FudGlfYnJ1dGVfY29sb3IiOiJDNkFDOTRGRiIsImhpdGxvZ3NfY3VzdG9tX2tvbG9ycyI6dHJ1ZSwiaGl0bG9nc19kZWF0aF9jb2xvciI6IjNDM0MzQ0ZGIiwiaGl0bG9nc19mb250IjoiRGVmYXVsdCIsImhpdGxvZ3NfZ2xvdyI6dHJ1ZSwiaGl0bG9nc19oaXRfY29sb3IiOiJDNkFDOTRGRiIsImhpdGxvZ3NfbGFnY29tcF9jb2xvciI6IkM2OTM5M0ZGIiwiaGl0bG9nc19taXNwcmVkaWN0aW9uX2NvbG9yIjoiQzY5MzkzRkYiLCJoaXRsb2dzX29mZnNldCI6MTMxLjAsImhpdGxvZ3NfcGxheWVyX2RlYXRoX2NvbG9yIjoiM0MzQzNDRkYiLCJoaXRsb2dzX3ByZWRpY3Rpb25fY29sb3IiOiJDNjkzOTNGRiIsImhpdGxvZ3NfcmVzb2x2ZXJfY29sb3IiOiJDNjkzOTNGRiIsImhpdGxvZ3Nfc3ByZWFkX2NvbG9yIjoiQzY5MzkzRkYiLCJoaXRsb2dzX3N0eWxlIjpbIkNlbnRlciIsIkNvbnNvbGUiXSwiaGl0bG9nc191bnJlZ2lzdGVyZWRfY29sb3IiOiJDNjkzOTNGRiIsImhpdG1hcmtlciI6ZmFsc2UsImhpdG1hcmtlcl9jb2xvciI6IkZGRkZGRkZGIiwiaGl0bWFya2VyX2ZvbnQiOiJEZWZhdWx0IiwiaGl0bWFya2VyX3N0eWxlIjpbXSwiaWRlYWx0aWNrX2VuYWJsZSI6ZmFsc2UsImlkZWFsdGlja19mZWF0dXJlcyI6WyJBdXRvIFBlZWsiLCJCZXR0ZXIgQXV0byBTdG9wIiwiRnJlZXN0YW5kaW5nIiwiSnVtcCBTY291dCJdLCJpbmZvX3BhbmVsX2VuYWJsZSI6ZmFsc2UsImluZm9fcGFuZWxfZm9udCI6IkRlZmF1bHQiLCJpbmZvX3BhbmVsX2xpc3QiOlsiVXNlcm5hbWUiLCJIaXQvTWlzcyIsIkNvdW50cnkiLCJWZXJzaW9uIiwiU3RhdGUiLCJEZXN5bmMiXSwiaW5mb19wYW5lbF94IjoxMC4wLCJpbmZvX3BhbmVsX3kiOjU0MC4wLCJtb2xvdG92X2NvbG9yIjoiRkZGRkZGRkYiLCJtb2xvdG92X2VuZW15X2NvbG9yIjoiRkYzMjMyRkYiLCJub3Njb3BlX2hpdGNoYW5jZV9lbmFibGUiOmZhbHNlLCJub3Njb3BlX2hpdGNoYW5jZV92YWx1ZSI6NDMuMCwibm9zY29wZV9oaXRjaGFuY2Vfd2VhcG9ucyI6WyJTY291dCJdLCJyYWRhcl9kaXNhYmxlIjpmYWxzZSwic2NvcGVfY29sb3IiOiJDNkFDOTRGRiIsInNjb3BlX2Rpc2FibGVfbGluZXMiOltdLCJzY29wZV9sZW5ndGgiOjQ2LjAsInNjb3BlX2xpbmVzIjp0cnVlLCJzY29wZV9vZmZzZXQiOjE2LjAsInNjb3BlX3N0eWxlIjoiSW52ZXJ0ZWQiLCJzaGFyZWRfaWNvbiI6ZmFsc2UsInNpZGVfYmluZHMiOlsiQm9tYiBJbmZvIiwiTWluLiBEYW1hZ2UiLCJIaXRjaGFuY2UiLCJQaW5nIiwiRG91YmxlIFRhYiIsIkhpZGUgU2hvdHMiLCJEb3JtYW50IEFpbWJvdCIsIkZyZWVzdGFuZGluZyIsIkZha2UgRHVjayIsIlNhZmUgUG9pbnRzIiwiQm9keSBBaW0iLCJSYWdlYm90IFN0YXRzIiwiRmFrZSJdLCJzaWRlX2ZvbnQiOiJTbWFsbCIsInNpZGVfaW5kaWNhdG9ycyI6ZmFsc2UsInNpZGVfcG9zX3kiOjgwMC4wLCJzbG93X2Rvd25feCI6ODY5LjAsInNsb3dfZG93bl95IjoxMDMuMCwic21va2VfY29sb3IiOiJGRkZGRkZGRiIsInNwcmVhZF9zY29wZSI6dHJ1ZSwidGFza2Jhcl9ub3RpZnkiOnRydWUsInRlbGVwb3J0X2VuYWJsZSI6dHJ1ZSwidGVsZXBvcnRfd2VhcG9ucyI6WyJBV1AiLCJTY291dCIsIlRhc2VyIl0sInRyYXNodGFsa19lbmFibGUiOmZhbHNlLCJ0cmFzaHRhbGtfZXZlbnRzIjpbXSwidHJhc2h0YWxrX3JlcGx5X3JhbmRvbV9jYXNlIjp0cnVlLCJ0cmFzaHRhbGtfdHlwZSI6IlJlcGx5IGluIGNoYXQiLCJ2aWV3bW9kZWxfZW5hYmxlIjpmYWxzZSwidmlld21vZGVsX2ZvdiI6NjguMCwidmlld21vZGVsX29mZnNldF94IjoyNS4wLCJ2aWV3bW9kZWxfb2Zmc2V0X3kiOjAuMCwidmlld21vZGVsX29mZnNldF96IjotMTUuMCwid2lkZ2V0cyI6WyJXYXRlcm1hcmsiLCJLZXliaW5kcyIsIlNsb3cgRG93biJdLCJ3aWRnZXRzX2NvbG9yIjoiQzZBQzk0M0QiLCJ3aWRnZXRzX2VuYWJsZSI6ZmFsc2UsIndpZGdldHNfZ2xvdyI6dHJ1ZSwid2lkZ2V0c19rZXliaW5kc194Ijo5NjAuMCwid2lkZ2V0c19rZXliaW5kc195IjozMDAuMH19<");
end, true);
v157 = {
    name = ""
};
v155.nick = ui.create(v155.main, "nickname", 2);
v157.label = v155.nick:input("");
v157.get_new = v155.nick:button(v154("     \f<fire>  Get Random     "), nil, true);
v157.name = v155.nick:button(v154("       \f<check>  Set Name      "), nil, true);
v157.get_new:set_callback(function()
    -- upvalues: v157 (ref), v143 (ref)
    network.get("https://625c894695cd5855d6139e9b.mockapi.io/api/v1/nicknames/", {}, function(v158)
        -- upvalues: v157 (ref), v143 (ref)
        if v158 == nil then
            return common.add_notify("Random Nickname", "Failed request");
        else
            local v159 = json.parse(v158);
            local v160 = utils.random_int(1, #v159);
            v157.name = v159[v160] and v159[v160].nickname or "";
            v157.label:set(v157.name);
            v143("Cool nickname: " .. v157.name, "");
            return;
        end;
    end);
end);
v157.name:set_callback(function()
    -- upvalues: v157 (ref)
    local v161 = v157.label:get();
    if #v161 < 1 then
        return;
    else
        common.set_name(v161);
        return;
    end;
end);
local v162 = {
    shots_data = {
        hit = 0, 
        miss = 0
    }
};
v162.update_shot_data = function(v163)
    -- upvalues: v162 (ref)
    if v163.state == nil then
        v162.shots_data.hit = v162.shots_data.hit + 1;
        return;
    else
        v162.shots_data.miss = v162.shots_data.miss + 1;
        return;
    end;
end;
events.aim_ack:set(v162.update_shot_data);
v155.settings = v154("\f<layer-group>");
v155.global_rage = ui.create(v155.settings, "Rage");
local v164 = {
    csgo_weapons = {
        [1] = "Deagle", 
        [2] = "Pistols", 
        [3] = "Pistols", 
        [4] = "Pistols", 
        [5] = "Pistols", 
        [6] = "Pistols", 
        [7] = "Rifle/LMG", 
        [8] = "Rifle/LMG", 
        [9] = "AWP", 
        [10] = "Rifle/LMG", 
        [11] = "AutoSnipers", 
        [12] = "Rifle/LMG", 
        [13] = "Rifle/LMG", 
        [14] = "Rifle/LMG", 
        [15] = "Rifle/LMG", 
        [16] = "Rifle/LMG", 
        [17] = "SMG", 
        [18] = "SMG", 
        [19] = "SMG", 
        [20] = "Scout", 
        [21] = "Rifle/LMG", 
        [22] = "Rifle/LMG", 
        [23] = "SMG", 
        [24] = "SMG", 
        [25] = "Shotgun", 
        [26] = "SMG", 
        [27] = "Shotgun", 
        [28] = "Rifle/LMG", 
        [29] = "Shotgun", 
        [30] = "Pistols", 
        [31] = "Taser", 
        [32] = "Pistols", 
        [33] = "SMG", 
        [34] = "SMG", 
        [35] = "Shotgun", 
        [36] = "Pistols", 
        [37] = "AutoSnipers", 
        [38] = "AutoSnipers", 
        [39] = "Rifle/LMG", 
        [40] = "Scout", 
        [41] = "Other", 
        [42] = "Other", 
        [43] = "Nades", 
        [44] = "Nades", 
        [45] = "Nades", 
        [46] = "Nades", 
        [47] = "Nades", 
        [48] = "Nades", 
        [49] = "Other", 
        [50] = nil, 
        [51] = nil, 
        [52] = nil, 
        [53] = nil, 
        [54] = nil, 
        [55] = nil, 
        [56] = nil, 
        [57] = nil, 
        [58] = nil, 
        [59] = "Other", 
        [60] = "Rifle/LMG", 
        [61] = "Pistols", 
        [62] = nil, 
        [63] = "Pistols", 
        [64] = "R8 Revolver", 
        [197126] = "Other", 
        [508] = "Other", 
        [509] = "Other", 
        [506] = "Other", 
        [507] = "Other", 
        [516] = "Other", 
        [197116] = "Other", 
        [197114] = "Other", 
        [515] = "Other", 
        [500] = "Other", 
        [197108] = "Other", 
        [197120] = "Other", 
        [197124] = "Other", 
        [197133] = "Other", 
        [197131] = "Other", 
        [197129] = "Other", 
        [197127] = "Other", 
        [197125] = "Other", 
        [197123] = "Other", 
        [262205] = "Pistols", 
        [197122] = "Other", 
        [197130] = "Other", 
        [197117] = "Other", 
        [197115] = "Other", 
        [197113] = "Other", 
        [197111] = "Other", 
        [262208] = "Pistols", 
        [505] = "Other", 
        [514] = "Other", 
        [512] = "Other", 
        [197128] = "Other"
    }
};
v7.new("noscope_hitchance_enable", v155.global_rage:switch("No-Scope Hitchance"));
v155.noscope_hs = v7.elements.noscope_hitchance_enable:create();
v7.new("noscope_hitchance_value", v155.noscope_hs:slider("Hitchance", 0, 100, 60));
v7.new("noscope_hitchance_weapons", v155.noscope_hs:selectable("Weapons", {
    [1] = "AWP", 
    [2] = "Scout", 
    [3] = "AutoSnipers"
}));
v7.new("air_hitchance_enable", v155.global_rage:switch("Air Hitchance"));
v155.air_hs = v7.elements.air_hitchance_enable:create();
v7.new("air_hitchance_value", v155.air_hs:slider("Hitchance", 0, 100, 60));
v7.new("air_hitchance_weapons", v155.air_hs:selectable("Weapons", {
    [1] = "Scout", 
    [2] = "R8 Revolver"
}));
v35.hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v164.on_createmove = function()
    -- upvalues: v164 (ref), v35 (ref), v7 (ref), v21 (ref)
    local v165 = entity.get_players(true);
    if not v165 or #v165 < 1 then
        return;
    else
        local v166 = entity.get_local_player();
        if v166 == nil or not v166:is_alive() then
            return;
        else
            local v167 = v166:get_player_weapon();
            if v167 == nil then
                return;
            else
                local v168 = v167:get_weapon_index();
                if v168 == nil then
                    return;
                else
                    local v169 = v164.csgo_weapons[v168] or "?";
                    v35.hitchance:override();
                    if v7.elements.noscope_hitchance_enable:get() and not v166.m_bIsScoped and v21(v7.elements.noscope_hitchance_weapons:get(), v169) then
                        local v170 = v7.elements.noscope_hitchance_value:get();
                        if type(v170) ~= "number" then
                            return;
                        else
                            v35.hitchance:override(v170);
                        end;
                    end;
                    if v7.elements.air_hitchance_enable:get() and not v166:get_anim_state().on_ground and v21(v7.elements.air_hitchance_weapons:get(), v169) then
                        local v171 = v7.elements.air_hitchance_value:get();
                        if type(v171) ~= "number" then
                            return;
                        else
                            v35.hitchance:override(v171);
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.createmove:set(v164.on_createmove);
local v172 = {
    csgo_weapons = {
        [1] = "Deagle", 
        [2] = "Pistols", 
        [3] = "Pistols", 
        [4] = "Pistols", 
        [5] = "Pistols", 
        [6] = "Pistols", 
        [7] = "Rifle/LMG", 
        [8] = "Rifle/LMG", 
        [9] = "AWP", 
        [10] = "Rifle/LMG", 
        [11] = "AutoSnipers", 
        [12] = "Rifle/LMG", 
        [13] = "Rifle/LMG", 
        [14] = "Rifle/LMG", 
        [15] = "Rifle/LMG", 
        [16] = "Rifle/LMG", 
        [17] = "SMG", 
        [18] = "SMG", 
        [19] = "SMG", 
        [20] = "Scout", 
        [21] = "Rifle/LMG", 
        [22] = "Rifle/LMG", 
        [23] = "SMG", 
        [24] = "SMG", 
        [25] = "Shotgun", 
        [26] = "SMG", 
        [27] = "Shotgun", 
        [28] = "Rifle/LMG", 
        [29] = "Shotgun", 
        [30] = "Pistols", 
        [31] = "Taser", 
        [32] = "Pistols", 
        [33] = "SMG", 
        [34] = "SMG", 
        [35] = "Shotgun", 
        [36] = "Pistols", 
        [37] = "AutoSnipers", 
        [38] = "AutoSnipers", 
        [39] = "Rifle/LMG", 
        [40] = "Scout", 
        [41] = "Other", 
        [42] = "Other", 
        [43] = "Nades", 
        [44] = "Nades", 
        [45] = "Nades", 
        [46] = "Nades", 
        [47] = "Nades", 
        [48] = "Nades", 
        [49] = "Other", 
        [50] = nil, 
        [51] = nil, 
        [52] = nil, 
        [53] = nil, 
        [54] = nil, 
        [55] = nil, 
        [56] = nil, 
        [57] = nil, 
        [58] = nil, 
        [59] = "Other", 
        [60] = "Rifle/LMG", 
        [61] = "Pistols", 
        [62] = nil, 
        [63] = "Pistols", 
        [64] = "Pistols", 
        [197126] = "Other", 
        [508] = "Other", 
        [509] = "Other", 
        [506] = "Other", 
        [507] = "Other", 
        [516] = "Other", 
        [197116] = "Other", 
        [197114] = "Other", 
        [515] = "Other", 
        [500] = "Other", 
        [197108] = "Other", 
        [197120] = "Other", 
        [197124] = "Other", 
        [197133] = "Other", 
        [197131] = "Other", 
        [197129] = "Other", 
        [197127] = "Other", 
        [197125] = "Other", 
        [197123] = "Other", 
        [262205] = "Pistols", 
        [197122] = "Other", 
        [197130] = "Other", 
        [197117] = "Other", 
        [197115] = "Other", 
        [197113] = "Other", 
        [197111] = "Other", 
        [262208] = "Pistols", 
        [505] = "Other", 
        [514] = "Other", 
        [512] = "Other", 
        [197128] = "Other"
    }, 
    weapons_list = {}, 
    weapon_list_names = {}
};
for v173, v174 in pairs(v172.csgo_weapons) do
    if v172.weapons_list[v174] == nil then
        v172.weapons_list[v174] = {};
        table.insert(v172.weapon_list_names, v174);
    end;
    table.insert(v172.weapons_list[v174], v173);
end;
table.sort(v172.weapon_list_names);
v172.combo_weapon_ids = {};
v172.sort_names_and_ids = function()
    -- upvalues: v172 (ref)
    local v175 = {};
    for v176, v177 in pairs(v172.weapon_list_names) do
        table.insert(v175, v177);
        v172.combo_weapon_ids[v177] = v176;
    end;
    return v175;
end;
v7.new("teleport_enable", v155.global_rage:switch("Teleport in Air"));
v7.new("teleport_weapons", v7.elements.teleport_enable:create():selectable("Weapons", v172.sort_names_and_ids()));
v172.min_penetrate_damage = 10;
v172.on_createmove = function(_)
    -- upvalues: v7 (ref), v35 (ref), v172 (ref), v21 (ref)
    if not v7.elements.teleport_enable:get() then
        return;
    elseif #v7.elements.teleport_weapons:get() < 1 then
        return;
    elseif not v35.double_tap:get() then
        return;
    elseif rage.exploit:get() ~= 1 then
        return;
    else
        local v179 = entity.get_local_player();
        if v179 == nil or not v179:is_alive() then
            return;
        else
            local v180 = v179:get_player_weapon();
            if v180 == nil then
                return;
            else
                v180 = v180:get_weapon_index();
                local v181 = v172.csgo_weapons[v180];
                if v181 == nil then
                    return;
                elseif not v21(v7.elements.teleport_weapons:get(), v181) then
                    return;
                elseif v179:get_anim_state().on_ground then
                    return;
                else
                    local v182 = entity.get_players(true);
                    if #v182 < 1 then
                        return;
                    else
                        local v183 = v179:get_eye_position();
                        for _, v185 in ipairs(v182) do
                            if not v185:is_dormant() and v185:is_alive() then
                                local v186 = v185:get_hitbox_position(6);
                                local v187, v188 = utils.trace_bullet(v179, v183, v186);
                                if v188.entity and v172.min_penetrate_damage < v187 and v188.entity == v185 then
                                    rage.exploit:force_teleport();
                                    break;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
events.createmove:set(v172.on_createmove);
local v189 = {
    works = false
};
v7.new("idealtick_enable", v155.global_rage:switch("Ideal Tick"));
v189.tab = v7.elements.idealtick_enable:create();
v7.new("idealtick_features", v189.tab:selectable("Options", {
    [1] = "Auto Peek", 
    [2] = "Better Auto Stop", 
    [3] = "Freestanding", 
    [4] = "Jump Scout"
}));
v189.on_render = function()
    -- upvalues: v189 (ref), v35 (ref), v7 (ref), v21 (ref)
    v189.works = false;
    v35.peek_assist:override();
    v35.auto_stop:override();
    v35.dt_auto_stop:override();
    v35.freestanding:override();
    if not v7.elements.idealtick_enable:get() then
        return;
    else
        local v190 = entity.get_local_player();
        if v190 == nil or v190:is_alive() == false then
            return;
        else
            local v191 = v190:get_anim_state();
            local v192 = v190:get_player_weapon();
            local v193 = v192 ~= nil and v192:get_name() or "nil";
            local function v195(v194)
                -- upvalues: v21 (ref), v7 (ref)
                return v21(v7.elements.idealtick_features:get(), v194);
            end;
            if v195("Auto Peek") then
                v35.peek_assist:override(true);
            end;
            if v195("Freestanding") and not v35.freestanding:get() and v191.on_ground then
                v35.freestanding:override(true);
            end;
            if v195("Better Auto Stop") and v191.on_ground then
                v35.auto_stop:override({
                    [1] = "Early"
                });
                v35.dt_auto_stop:override({});
            end;
            if v195("Jump Scout") and not v191.on_ground and v193 == "SSG 08" then
                v35.auto_stop:override({
                    [1] = "In Air", 
                    [2] = "Full Stop"
                });
            end;
            v189.works = true;
            return;
        end;
    end;
end;
events.render:set(v189.on_render);
v2.state_data = {};
v2.add_player_state = function(v196, v197, v198)
    -- upvalues: v2 (ref)
    table.insert(v2.state_data, {
        menu_name = v196, 
        indicator_name = v197, 
        callback = v198
    });
end;
v2.get_player_state = function(v199)
    -- upvalues: v2 (ref)
    local v200 = entity.get_local_player();
    if v200 == nil then
        return nil;
    else
        local v201 = nil;
        for _, v203 in ipairs(v2.state_data) do
            if v203.callback(v200) then
                v201 = v203;
            end;
        end;
        if v199 and v201 then
            return v199 == v201.menu_name;
        else
            return v201;
        end;
    end;
end;
v2.add_player_state("Stand", "Stand", function(v204)
    local v205 = v204:get_anim_state();
    return v205.velocity:length() < 2 and v205.on_ground;
end);
v2.add_player_state("Move", "Move", function(v206)
    local v207 = v206:get_anim_state();
    return v207.velocity:length() > 2 and v207.on_ground;
end);
v2.add_player_state("Air", "Air", function(v208)
    return not v208:get_anim_state().on_ground or common.is_button_down(32);
end);
v2.add_player_state("Crouch", "Crouch", function(v209)
    -- upvalues: v35 (ref)
    local v210 = v209:get_anim_state();
    return (not (v210.anim_duck_amount <= 0.8) or v35.fake_duck:get()) and v210.on_ground;
end);
v2.add_player_state("Air-Crouch", "Air-C", function(v211)
    local v212 = v211:get_anim_state();
    return v212.anim_duck_amount > 0.9 and (not v212.on_ground or common.is_button_down(32));
end);
v2.add_player_state("On Use", "Use", function(_)
    -- upvalues: v2 (ref)
    return v2.on_use_work;
end);
v2.add_player_state("Roll", "Roll", function(_)
    -- upvalues: v35 (ref)
    return v35.roll:get();
end);
v2.add_player_state("Slow-Mo", "Slow", function(v215)
    -- upvalues: v35 (ref), v2 (ref)
    local v216 = v215:get_anim_state();
    return v35.slow_wark:get() and not v2.on_use_work and v216.on_ground;
end);
v2.add_player_state("No Exploits", "No-Exp", function(_)
    -- upvalues: v35 (ref), v2 (ref)
    return not v35.double_tap:get() and not v35.hide_shots:get() and not v2.on_use_work;
end);
v155.antiaim = v154("\f<shield>");
v155.antiaim_main = ui.create(v155.antiaim, v149("crosshairs", "Main"));
v7.new("antiaim_enable", v155.antiaim_main:switch("Enable"));
v7.new("antiaim_condition", v155.antiaim_main:combo("Condition", {
    [1] = "loading..."
}), function()
    -- upvalues: v7 (ref)
    return v7.elements.antiaim_enable:get();
end);
v7.new("antiaim_manuals", v155.antiaim_main:combo("Manuals", {
    [1] = "Backward", 
    [2] = "At Target", 
    [3] = "Forward", 
    [4] = "Right", 
    [5] = "Left"
}), function()
    -- upvalues: v7 (ref)
    return v7.elements.antiaim_enable:get();
end);
v7.new("antiaim_more", v155.antiaim_main:selectable("Options", {
    [1] = "Defensive AA", 
    [2] = "Avoid Backstab", 
    [3] = "On Use AA", 
    [4] = "Break LC in Air", 
    [5] = "Static Manuals", 
    [6] = "Anti Bruteforce"
}), function()
    -- upvalues: v7 (ref)
    return v7.elements.antiaim_enable:get();
end);
v2.condition_names = {};
v2.menu_tabs = {};
v2.create_condition = function(v218, v219)
    -- upvalues: v2 (ref), v7 (ref), v155 (ref), v149 (ref)
    table.insert(v2.condition_names, v218);
    v7.elements.antiaim_condition:update(v2.condition_names);
    v2.menu_tabs[v218] = ui.create(v155.antiaim, v149("running", v218));
    if v219 ~= nil then
        v7.new("antiaim_Override_" .. v218, v2.menu_tabs[v218]:switch("Override " .. v218), function()
            -- upvalues: v7 (ref), v218 (ref)
            return v7.elements.antiaim_condition:get() == v218 and v7.elements.antiaim_enable:get();
        end);
    end;
    local function v221()
        -- upvalues: v7 (ref), v218 (ref), v219 (ref)
        local v220 = v7.elements.antiaim_condition:get() == v218 and v7.elements.antiaim_enable:get();
        if v219 ~= nil then
            return v220 and v7.elements["antiaim_Override_" .. v218]:get();
        else
            return v220;
        end;
    end;
    v7.new("antiaim_Yaw Add Left_" .. v218, v2.menu_tabs[v218]:slider("Left Add", -180, 180, 0), v221);
    v7.new("antiaim_Yaw Add Right_" .. v218, v2.menu_tabs[v218]:slider("Right Add", -180, 180, 0), v221);
    v7.new("antiaim_Yaw Modifier_" .. v218, v2.menu_tabs[v218]:combo("Modifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "3-Way", 
        [7] = "5-Way", 
        [8] = "X-Way"
    }), v221);
    local v222 = v7.elements["antiaim_Yaw Modifier_" .. v218]:create();
    v7.new("antiaim_Two Degree_" .. v218, v222:switch("Min\\Max Degree"));
    v7.new("antiaim_Randomization Degree_" .. v218, v222:slider("Randomization", 0, 30));
    v7.new("antiaim_Ways_" .. v218, v2.menu_tabs[v218]:slider("Ways", 3, 9, 5), function()
        -- upvalues: v7 (ref), v218 (ref), v221 (ref)
        return v7.elements["antiaim_Yaw Modifier_" .. v218]:get() == "X-Way" and v221();
    end);
    v7.new("antiaim_Modifier Degree_" .. v218, v2.menu_tabs[v218]:slider("Degree", -180, 180, 0), function()
        -- upvalues: v221 (ref), v7 (ref), v218 (ref)
        return v221() and not v7.elements["antiaim_Two Degree_" .. v218]:get() and v7.elements["antiaim_Yaw Modifier_" .. v218]:get() ~= "Disabled";
    end);
    v7.new("antiaim_Modifier Degree Left_" .. v218, v2.menu_tabs[v218]:slider("Min Degree", -180, 180, 0), function()
        -- upvalues: v221 (ref), v7 (ref), v218 (ref)
        return v221() and v7.elements["antiaim_Two Degree_" .. v218]:get() and v7.elements["antiaim_Yaw Modifier_" .. v218]:get() ~= "Disabled";
    end);
    v7.new("antiaim_Modifier Degree Right_" .. v218, v2.menu_tabs[v218]:slider("Max Degree", -180, 180, 0), function()
        -- upvalues: v221 (ref), v7 (ref), v218 (ref)
        return v221() and v7.elements["antiaim_Two Degree_" .. v218]:get() and v7.elements["antiaim_Yaw Modifier_" .. v218]:get() ~= "Disabled";
    end);
    v7.new("antiaim_Limit Type_" .. v218, v2.menu_tabs[v218]:combo("Fake Type", {
        [1] = "Static", 
        [2] = "Jitter"
    }), v221);
    v7.new("antiaim_Jitter Value_" .. v218, v2.menu_tabs[v218]:slider("Jitter", 0, 60, 0), function()
        -- upvalues: v7 (ref), v218 (ref), v221 (ref)
        return v7.elements["antiaim_Limit Type_" .. v218]:get() == "Jitter" and v221();
    end);
    v7.new("antiaim_Left Limit_" .. v218, v2.menu_tabs[v218]:slider("Left Fake", 0, 60, 0), v221);
    v7.new("antiaim_Right Limit_" .. v218, v2.menu_tabs[v218]:slider("Right Fake", 0, 60, 0), v221);
    v7.new("antiaim_Options_" .. v218, v2.menu_tabs[v218]:selectable("Options", {
        [1] = "Avoid Overlap", 
        [2] = "Jitter", 
        [3] = "Randomize Jitter", 
        [4] = "Anti Bruteforce"
    }), v221);
    v7.new("antiaim_Freestanding Body_" .. v218, v2.menu_tabs[v218]:combo("Freestanding", {
        [1] = "Off", 
        [2] = "Peek Fake", 
        [3] = "Peek Real"
    }), v221);
    v7.new("antiaim_Disable Anti Bruteforce_" .. v218, v2.menu_tabs[v218]:switch("Disable Anti Bruteforce"), v221);
end;
v2.create_condition("Global");
v2.create_condition("Stand", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Stand");
end);
v2.create_condition("Move", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Move");
end);
v2.create_condition("Air", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Air");
end);
v2.create_condition("Crouch", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Crouch");
end);
v2.create_condition("Air-Crouch", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Air-Crouch");
end);
v2.create_condition("Slow-Mo", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("Slow-Mo");
end);
v2.create_condition("On Use", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("On Use");
end);
v2.create_condition("No Exploits", function()
    -- upvalues: v2 (ref)
    return v2.get_player_state("No Exploits");
end);
v2.menu_refs = {
    Enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    Pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    Yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    Base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    ["Yaw Offset"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    ["Yaw Modifier"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    ["Modifier Degree"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    ["Body Yaw"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    ["Left Limit"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    ["Right Limit"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    Options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    ["Freestanding Body"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    Freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
v2.get_manual_func = {
    Forward = function()
        -- upvalues: v2 (ref)
        v2.menu_refs.Base:set("Local View");
        return 180;
    end, 
    Backward = function()
        -- upvalues: v2 (ref)
        v2.menu_refs.Base:set("Local View");
        return 0;
    end, 
    Right = function()
        -- upvalues: v2 (ref)
        v2.menu_refs.Base:set("Local View");
        return 90;
    end, 
    Left = function()
        -- upvalues: v2 (ref)
        v2.menu_refs.Base:set("Local View");
        return -90;
    end, 
    ["At Target"] = function()
        -- upvalues: v2 (ref)
        v2.menu_refs.Base:set("At Target");
        return 0;
    end, 
    Freestanding = function()
        return 0;
    end, 
    state = function(_)
        -- upvalues: v7 (ref)
        local v224 = v7.elements.antiaim_manuals:get();
        return {
            left = v224 == "Left", 
            right = v224 == "Right", 
            any = v224 == "Left" or v224 == "Right"
        };
    end
};
v2.get_desync_delta = function()
    return math.min(math.normalize_yaw(rage.antiaim:get_rotation(true) - rage.antiaim:get_rotation()), rage.antiaim:get_max_desync());
end;
v2.get_inverter_state = function()
    -- upvalues: v2 (ref)
    return v2.get_desync_delta() <= 0;
end;
v2.valid_on_use = function()
    local v225 = entity.get_local_player();
    if v225 == nil then
        return;
    else
        local v226 = v225:get_player_weapon();
        if v226 == nil then
            return;
        elseif v226:get_classname() == "CC4" then
            return true;
        else
            local v227 = render.camera_angles();
            local v228 = vector():angles(v227);
            local v229 = v225:get_eye_position();
            local v230 = utils.trace_line(v229, v229 + v228 * 200, v225, 1174421515);
            if v230.entity ~= nil then
                local v231 = string.lower(v230.entity:get_classname());
                if v231:match("weapon") or v231:match("deagle") or v231:match("door") then
                    return true;
                end;
            end;
            if v225.m_iTeamNum ~= 3 then
                return false;
            else
                local v232 = {
                    [1] = 1337
                };
                entity.get_entities("CHostage", false, function(v233)
                    -- upvalues: v232 (ref), v229 (ref)
                    if v233.m_nHostageState ~= 3 then
                        table.insert(v232, v233.m_vecOrigin:dist(v229));
                    end;
                end);
                entity.get_entities("CPlantedC4", false, function(v234)
                    -- upvalues: v232 (ref), v229 (ref)
                    table.insert(v232, v234.m_vecOrigin:dist(v229));
                end);
                if math.min(unpack(v232)) < 125 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
v2.on_use = function(v235)
    -- upvalues: v7 (ref), v21 (ref), v2 (ref)
    local v236 = v7.elements.antiaim_enable:get();
    local v237 = v21(v7.elements.antiaim_more:get(), "On Use AA");
    v2.on_use_work = v236 and v237 and not v2.valid_on_use() and v235.in_use;
    if v2.on_use_work then
        v235.in_use = not v235.in_use;
    end;
end;
events.createmove:set(v2.on_use);
v35["lag options"] = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
v35["hs options"] = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
v2.break_lc_air = function()
    -- upvalues: v35 (ref), v21 (ref), v7 (ref), v2 (ref)
    v35["lag options"]:override();
    v35["hs options"]:override();
    if not v21(v7.elements.antiaim_more:get(), "Break LC in Air") then
        return;
    else
        local v238 = v2.get_player_state();
        if v238 and (v238.indicator_name == "Air" or v238.indicator_name == "Air-C") then
            v35["lag options"]:override("Always On");
            v35["hs options"]:override("Break LC");
        end;
        return;
    end;
end;
events.createmove:set(v2.break_lc_air);
local v239 = {
    limits = {
        max = 10, 
        min = 2
    }
};
v155.antibrute = ui.create(v155.antiaim, v149("sync-alt", "Anti Bruteforce"));
v239.visible = function()
    -- upvalues: v7 (ref), v21 (ref)
    return v7.elements.antiaim_enable:get() and v21(v7.elements.antiaim_more:get(), "Anti Bruteforce");
end;
v7.new("antibrute_count", v155.antibrute:slider("Count", v239.limits.min, v239.limits.max), function()
    return false;
end);
v239.ui_count = v7.elements.antibrute_count;
v7.new("antibrute_label", v155.antibrute:label("Phase Manage"), v239.visible);
v7.new("antibrute_add", v155.antibrute:button(v149("plus", "Create"), nil, true), v239.visible):set_callback(function()
    -- upvalues: v239 (ref)
    if v239.ui_count:get() < v239.limits.max then
        v239.ui_count:set(v239.ui_count:get() + 1);
    end;
end);
v7.new("antibrute_delete", v155.antibrute:button(v149("minus", "Delete"), nil, true), v239.visible):set_callback(function()
    -- upvalues: v239 (ref)
    if v239.ui_count:get() > v239.limits.min then
        v239.ui_count:set(v239.ui_count:get() - 1);
    end;
end);
v239.count = 0;
v239.create_phase = function()
    -- upvalues: v239 (ref), v7 (ref), v155 (ref), v59 (ref)
    v239.count = v239.count + 1;
    local v240 = tostring(v239.count);
    v7.new("antibrute_label:" .. v240, v155.antibrute:label("Phase: " .. v59(v240, nil, true)));
    local v241 = v7.elements["antibrute_label:" .. v240]:create();
    v7.new("antibrute_left:" .. v240, v241:slider("Left Add", -180, 180, 0));
    v7.new("antibrute_right:" .. v240, v241:slider("Right Add", -180, 180, 0));
    v7.new("antibrute_modifier:" .. v240, v241:combo("Modifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Offset", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "3-Way", 
        [7] = "5-Way"
    }));
    v7.new("antibrute_degree:" .. v240, v241:slider("Degree", -180, 180, 0), function()
        -- upvalues: v7 (ref), v240 (ref)
        return v7.elements["antibrute_modifier:" .. v240]:get() ~= "Disabled";
    end);
end;
for _ = 1, v239.limits.max do
    v239.create_phase();
end;
v239.get_settings = function(v243)
    -- upvalues: v7 (ref)
    return {
        left = v7.elements["antibrute_left:" .. v243] and v7.elements["antibrute_left:" .. v243]:get() or 0, 
        right = v7.elements["antibrute_right:" .. v243] and v7.elements["antibrute_right:" .. v243]:get() or 0, 
        modifier = v7.elements["antibrute_modifier:" .. v243] and v7.elements["antibrute_modifier:" .. v243]:get() or 0, 
        degree = v7.elements["antibrute_degree:" .. v243] and v7.elements["antibrute_degree:" .. v243]:get() or 0
    };
end;
v239.menu_update = function()
    -- upvalues: v7 (ref), v239 (ref)
    local v244 = v7.elements.antibrute_count:get();
    local v245 = v239.visible();
    for v246 = 1, v239.count do
        local v247 = v7.elements["antibrute_label:" .. v246];
        if v247 then
            v247:visibility(v246 <= v244 and v245);
        end;
    end;
end;
v239.menu_update();
v7.elements.antiaim_more:set_callback(v239.menu_update);
v7.elements.antiaim_enable:set_callback(v239.menu_update);
v7.elements.antibrute_add:set_callback(v239.menu_update);
v7.elements.antibrute_delete:set_callback(v239.menu_update);
v239.work = true;
v239.distance = 70;
v239.last_handled_tick = -1;
v239.current_phase = 0;
v239.update_time = 0;
v239.active_time = 5;
v239.target = nil;
v239.get_log_color = function()
    -- upvalues: v7 (ref)
    return v7.elements.hitlogs_custom_kolors:get() and v7.elements.hitlogs_anti_brute_color:get() or color(255, 255, 204);
end;
v239.last_hurt_curtime = 0;
events.player_hurt:set(function()
    -- upvalues: v239 (ref)
    v239.last_hurt_curtime = math.floor(globals.curtime);
end);
v239.on_bullet = function(v248)
    -- upvalues: v239 (ref), v3 (ref)
    if not v239.visible() then
        return;
    elseif v239.last_handled_tick == globals.tickcount then
        return;
    elseif v239.last_hurt_curtime == math.floor(globals.curtime) then
        return;
    else
        local v249 = entity.get_local_player();
        if not v249 or v249.m_iHealth <= 0 then
            return;
        else
            local v250 = entity.get(v248.userid, true);
            if not v250 or v250:is_dormant() or not v250:is_enemy() then
                return;
            else
                local v251 = v249:get_eye_position();
                if not v251 then
                    return;
                else
                    local v252 = v250:get_eye_position();
                    if not v252 then
                        return;
                    elseif v251:closest_ray_point(v252, (vector(v248.x, v248.y, v248.z))):dist(v251) > v239.distance then
                        return;
                    else
                        v239.last_handled_tick = globals.tickcount;
                        v239.target = v250;
                        v239.current_phase = v239.current_phase + 1;
                        if v239.current_phase > v239.ui_count:get() then
                            v239.current_phase = 1;
                        end;
                        v239.update_time = globals.realtime + v239.active_time;
                        local l_current_phase_0 = v239.current_phase;
                        local v254 = v3.build_log("Switched phase due to {name} miss [phase: {phase}]", v239.get_log_color(), {
                            alpha = true, 
                            name = v250:get_name(), 
                            phase = l_current_phase_0
                        });
                        v3.is_enabled("Center", function()
                            -- upvalues: v254 (ref)
                            v254:push_render("Center", col);
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
events.bullet_impact:set(v239.on_bullet);
v239.reset = function()
    -- upvalues: v239 (ref)
    v239.current_phase = 0;
    v239.target = nil;
end;
v239.on_death = function(v255)
    -- upvalues: v239 (ref), v3 (ref)
    local v256 = entity.get_local_player();
    local _ = entity.get(v255.attacker, true);
    local v258 = entity.get(v255.userid, true);
    local v259 = nil;
    if v256 == v258 and v239.work == true then
        v259 = v3.build_log("Reset phase due to {local_player} death", v239.get_log_color(), {
            alpha = true, 
            local_player = "local player"
        });
        v239.reset();
    end;
    if v258 == v239.target then
        v259 = v3.build_log("Reset phase due to target {target} death", v239.get_log_color(), {
            alpha = true, 
            target = v239.target and v239.target:get_name() or "?"
        });
        v239.reset();
    end;
    if v259 ~= nil then
        v3.is_enabled("Center", function()
            -- upvalues: v259 (ref)
            v259:push_render("Center", col);
        end);
    end;
end;
events.player_death:set(v239.on_death);
v2.x_way = function(v260, v261, v262)
    -- upvalues: v75 (ref)
    local v263 = {};
    for v264 = 0, v260 do
        local v265 = v264 / v260;
        local v266 = v75.lerp(v261, v262, v265);
        table.insert(v263, v266);
    end;
    return v263;
end;
v2.ref_hidden_aa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
v2.ref_avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab");
v2.apply_current_condition = function()
    -- upvalues: v7 (ref), v2 (ref), v239 (ref), v35 (ref), v21 (ref), v32 (ref)
    if not v7.elements.antiaim_enable:get() then
        return;
    else
        local v267 = v2.get_player_state();
        if not v267 then
            return;
        else
            v267 = v267.menu_name;
            local function v272(v268, v269)
                -- upvalues: v267 (ref), v7 (ref)
                local v270 = v269 and v269 or v267;
                local v271 = v7.elements[("antiaim_%s_%s"):format(v268, v270)];
                if v271 ~= nil then
                    return v271:get();
                else
                    return nil;
                end;
            end;
            if not v272("Override") then
                v267 = "Global";
            end;
            if v239.update_time < globals.realtime then
                v239.reset();
            end;
            if v2.on_use_work and (v35.freestanding:get_override() or v35.freestanding:get()) then
                v35.freestanding:override(false);
            end;
            v239.work = v239.current_phase > 0 and not v272("Disable Anti Bruteforce");
            local v273 = v239.get_settings(v239.current_phase);
            local v274 = v2.on_use_work and "Forward" or v7.elements.antiaim_manuals:get();
            local v275 = v2.get_manual_func[v274]() or 0;
            local v276 = v2.get_manual_func:state().any and v21(v7.elements.antiaim_more:get(), "Static Manuals");
            v2.ref_hidden_aa:override(v21(v7.elements.antiaim_more:get(), "Defensive AA"));
            v2.ref_avoid_backstab:override(v21(v7.elements.antiaim_more:get(), "Avoid Backstab"));
            local v277 = utils.random_int(-v272("Randomization Degree"), v272("Randomization Degree"));
            for v278, v279 in pairs(v2.menu_refs) do
                local v280 = v272(v278);
                if v278 == "Pitch" then
                    v280 = v2.on_use_work and "Disabled" or "Down";
                end;
                if v278 == "Yaw" then
                    v280 = "Backward";
                end;
                if v278 == "Body Yaw" then
                    v280 = true;
                end;
                if v278 == "Enabled" then
                    v280 = true;
                end;
                if v278 == "Yaw Offset" then
                    local v281 = v239.work and v273.left or v272("Yaw Add Left");
                    local v282 = v239.work and v273.right or v272("Yaw Add Right");
                    local v283 = v2.get_inverter_state() and v281 or v282;
                    if v272("Yaw Modifier") == "X-Way" then
                        local v284 = v272("Modifier Degree Left");
                        local v285 = v272("Modifier Degree Right");
                        local v286 = v272("Modifier Degree");
                        local v287 = v2.x_way(v272("Ways"), v286, -v286);
                        if v272("Two Degree") then
                            v287 = v2.x_way(v272("Ways"), v284, v285);
                        end;
                        local v288 = globals.tickcount % #v287 + 1;
                        v280 = v283 + v275 + (v276 and 0 or v287[v288]) + v277;
                    else
                        v280 = v275 + v283 + v277;
                    end;
                end;
                if v278 == "Modifier Degree" then
                    v280 = (v272("Two Degree") and (globals.tickcount % 8 > 3 and v272("Modifier Degree Left") or v272("Modifier Degree Right")) or v272("Modifier Degree")) + v277;
                end;
                if v278 == "Modifier Degree" and v239.work then
                    v280 = v273.degree;
                end;
                if v278 == "Yaw Modifier" and v239.work then
                    v280 = v273.modifier;
                end;
                if v278 == "Yaw Modifier" and v276 then
                    v280 = "Disabled";
                end;
                if v278 == "Yaw Modifier" and v280 == "X-Way" then
                    v280 = "Disabled";
                end;
                if v278 == "Options" and v276 then
                    v280 = v32(v280, "Jitter");
                end;
                if v272("Limit Type") == "Jitter" then
                    local v289 = globals.tickcount % 4 > 1;
                    if v278 == "Left Limit" or v278 == "Right Limit" then
                        v280 = v289 and v272(v278) or v272("Jitter Value");
                    end;
                end;
                if v280 ~= nil then
                    v279:override(v280);
                end;
            end;
            return;
        end;
    end;
end;
events.createmove:set(v2.apply_current_condition);
v155.visual_main = ui.create(v155.settings, v149("eye", "Visual"));
v7.new("crosshair_indicators", v155.visual_main:switch("Crosshair Indicators"));
v155.cross_ind_tab = v7.elements.crosshair_indicators:create();
v7.new("cross_active_color", v155.cross_ind_tab:color_picker("Color", color(255, 107, 205)));
v7.new("cross_damage_num", v155.cross_ind_tab:switch("Damage"));
v7.new("cross_pos", v155.cross_ind_tab:combo("Position", {
    [1] = "Center", 
    [2] = "Right"
}));
local v290 = {
    logo = render.load_font("verdana", 12, "abdi"), 
    verdana_b = render.load_font("verdana", 11, "abd")
};
local v294 = {
    mt = {
        alpha = 0, 
        add_y = 10, 
        GetBool = function()
            return true;
        end, 
        CustomRender = function(_, _, _)

        end
    }, 
    move_in_scope = false
};
v35["Min. Damage"] = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v294.damage_indicator = v46.create_draggable(v34.screen.x / 2, v34.screen.y / 2, 0, 0, "damage_indicator", function(v295)
    -- upvalues: v7 (ref), v35 (ref)
    if not v7.elements.cross_damage_num:get() then
        return;
    else
        local v296 = tonumber(v35["Min. Damage"]:get());
        local v297 = tostring(v296);
        local v298 = vector(v295.position_x, v295.position_y);
        local v299 = render.measure_text(2, nil, v297);
        v295.size_x = v299.x;
        v295.size_y = v299.y;
        if ui.get_alpha() > 0 then
            render.rect_outline(v298, v298 + vector(v295.size_x, v295.size_y) + 6, color(255, 255, 255, 100), 1, 3);
        end;
        v298 = v298 + 3;
        render.text(2, v298, color(), nil, v297);
        return;
    end;
end);
v294.data = {};
v294.data.CreateObject = function(v300, v301)
    -- upvalues: v294 (ref)
    table.insert(v300, setmetatable(v301, {
        __index = v294.mt
    }));
end;
v294.data:CreateObject({
    logo = l_gradient_0.text_animate("aarneclub", -1, {
        color(), 
        color()
    }), 
    CustomRender = function(v302, v303, v304)
        -- upvalues: v7 (ref), v239 (ref), v2 (ref), v75 (ref)
        v304 = v304 - 6;
        local v305 = v7.elements.cross_pos:get();
        local v306 = v7.elements.cross_active_color:get();
        v306.a = v302.alpha;
        local v307 = v305 == "Center" and "c" or "";
        local v308 = v305 == "Center" and 6 or 0;
        v302.logo:set_colors({
            v306, 
            v306:alpha_modulate(0)
        });
        v302.logo:animate();
        render.text(1, vector(v303, v304 + v308), color(), v307, v302.logo:get_animated_text());
        local v309 = render.measure_text(1, nil, v302.logo:get_text());
        local v310 = v239.work and 60 / v239.active_time * (v239.update_time - globals.realtime) or math.abs(v2.get_desync_delta());
        local v311 = v75.new("desycn_line", math.clamp(v310, 2, 60), 0.05);
        local v312 = vector(v309.x, 3);
        local v313 = v305 == "Center" and v312.x / 2 or 0;
        local v314 = vector(v303 - v313, v304 + v309.y);
        render.rect(v314, v314 + v312, color(0, 0, 0, v302.alpha / 3));
        render.rect_outline(v314, v314 + v312, color(0, 0, 0, v302.alpha / 2), 1);
        render.gradient(v314 + 1, v314 + vector(v312.x * v311 / 60, v312.y) - 1, v306, v306:alpha_modulate(0), v306, v306:alpha_modulate(0));
    end
});
local v317 = {
    get_velocity = function()
        local v315 = 1;
        local v316 = entity.get_local_player();
        if v316 and v316:is_alive() then
            v315 = v316.m_flVelocityModifier;
        end;
        return v315;
    end
};
v294.shit_talkin = (function()
    -- upvalues: v75 (ref)
    local v318 = {
        binds = {}
    };
    v318.new_bind = function(v319, v320, v321, v322)
        -- upvalues: v318 (ref)
        if not v318.binds[v319] then
            v318.binds[v319] = {};
        end;
        table.insert(v318.binds[v319], {
            alpha = 0, 
            col = v321, 
            name = v320, 
            callback = v322
        });
    end;
    v318.get_active_binds = function(v323)
        -- upvalues: v318 (ref), v75 (ref)
        local v324 = {};
        for _, v326 in ipairs(v318.binds[v323]) do
            v326.alpha = v75.lerp(v326.alpha, v326.callback() and 255 or 0);
            if v326.alpha > 3 then
                table.insert(v324, v326);
            end;
        end;
        return v324;
    end;
    return v318;
end)();
v294.shit_talkin.new_bind("first", "DT", function()
    -- upvalues: v75 (ref), v7 (ref)
    return v75.new("color_dt", rage.exploit:get() == 1 and v7.elements.cross_active_color:get() or color(255, 100, 100));
end, function()
    -- upvalues: v35 (ref)
    return v35.double_tap:get();
end);
v294.shit_talkin.new_bind("first", "HS", function()
    -- upvalues: v7 (ref)
    return v7.elements.cross_active_color:get();
end, function()
    -- upvalues: v35 (ref)
    return v35.hide_shots:get();
end);
v294.shit_talkin.new_bind("first", "DMG", function()
    -- upvalues: v7 (ref)
    return v7.elements.cross_active_color:get();
end, function()
    for _, v328 in ipairs(ui.get_binds()) do
        if v328.name == "Min. Damage" and v328.active then
            return true;
        end;
    end;
    return false;
end);
v294.shit_talkin.new_bind("second", "SP", function()
    -- upvalues: v7 (ref)
    return v7.elements.cross_active_color:get();
end, function()
    -- upvalues: v35 (ref)
    return v35.safe_points:get() == "Force";
end);
v294.shit_talkin.new_bind("second", "BA", function()
    -- upvalues: v7 (ref)
    return v7.elements.cross_active_color:get();
end, function()
    -- upvalues: v35 (ref)
    return v35.body_aim:get() == "Force";
end);
v294.shit_talkin.new_bind("second", "FS", function()
    -- upvalues: v7 (ref)
    return v7.elements.cross_active_color:get();
end, function()
    -- upvalues: v35 (ref)
    return v35.freestanding:get_override() or v35.freestanding:get();
end);
v294.data:CreateObject({
    GetBool = function()
        -- upvalues: v294 (ref)
        return #v294.shit_talkin.get_active_binds("first") > 0;
    end, 
    CustomRender = function(_, v330, v331)
        -- upvalues: v294 (ref), v7 (ref)
        local v332 = 0;
        local v333 = v294.shit_talkin.get_active_binds("first");
        local v334 = 0;
        for _, v336 in ipairs(v333) do
            v334 = v334 + (1 + render.measure_text(2, nil, v336.name).x) * (v336.alpha / 255);
        end;
        v330 = v330 - (v7.elements.cross_pos:get() == "Center" and v334 / 2 or 0);
        for _, v338 in ipairs(v333) do
            local v339 = type(v338.col) == "function" and v338.col() or v338.col;
            v339.a = v338.alpha;
            render.text(2, vector(v330 + v332, v331), v339, nil, v338.name);
            v332 = v332 + (1 + render.measure_text(2, nil, v338.name).x) * (v338.alpha / 255);
        end;
    end
});
v294.data:CreateObject({
    GetBool = function()
        -- upvalues: v294 (ref)
        return #v294.shit_talkin.get_active_binds("second") > 0;
    end, 
    CustomRender = function(_, v341, v342)
        -- upvalues: v294 (ref), v7 (ref)
        local v343 = 0;
        local v344 = v294.shit_talkin.get_active_binds("second");
        local v345 = 0;
        for _, v347 in ipairs(v344) do
            v345 = v345 + (1 + render.measure_text(2, nil, v347.name).x) * (v347.alpha / 255);
        end;
        v341 = v341 - (v7.elements.cross_pos:get() == "Center" and v345 / 2 or 0);
        for _, v349 in ipairs(v344) do
            local v350 = type(v349.col) == "function" and v349.col() or v349.col;
            v350.a = v349.alpha;
            render.text(2, vector(v341 + v343, v342), v350, nil, v349.name);
            v343 = v343 + (1 + render.measure_text(2, nil, v349.name).x) * (v349.alpha / 255);
        end;
    end
});
v294.GetActiveBinds = function(v351)
    -- upvalues: v75 (ref)
    local v352 = {};
    for _, v354 in ipairs(v351.data) do
        v354.alpha = v75.lerp(v354.alpha, v354:GetBool() and 255 or 0);
        if v354.alpha > 0 then
            table.insert(v352, v354);
        end;
    end;
    return v352;
end;
v294.on_draw = function()
    -- upvalues: v7 (ref), v294 (ref), v75 (ref), v34 (ref)
    if not v7.elements.crosshair_indicators:get() then
        return;
    else
        local v355 = entity.get_local_player();
        if not v355 or not v355:is_alive() then
            return;
        else
            v294.damage_indicator:update();
            v294.move_in_scope = v355.m_bIsScoped;
            local v356 = v7.elements.cross_pos:get();
            local l_new_0 = v75.new;
            local v358 = "plus_x";
            local v359;
            if v294.move_in_scope then
                v359 = v356 == "Center" and 35 or 5;
            else
                v359 = 0;
            end;
            l_new_0 = l_new_0(v358, v359);
            v358 = v34.screen.x / 2 + l_new_0;
            v359 = v34.screen.y / 2 + 25;
            local v360 = 0;
            local l_v294_ActiveBinds_0 = v294:GetActiveBinds();
            local _ = 0;
            for _, v364 in pairs(l_v294_ActiveBinds_0) do
                v364:CustomRender(v358, v359 + v360 * v364.add_y);
                v360 = v360 + v364.alpha / 255;
            end;
            return;
        end;
    end;
end;
events.render:set(v294.on_draw);
local v365 = {};
v7.new("side_indicators", v155.visual_main:switch("Side Indicators"));
v365.tab = v7.elements.side_indicators:create();
v7.new("side_binds", v365.tab:selectable("Binds", {
    [1] = "Bomb Info", 
    [2] = "Min. Damage", 
    [3] = "Hitchance", 
    [4] = "Ping", 
    [5] = "Double Tab", 
    [6] = "Hide Shots", 
    [7] = "Dormant Aimbot", 
    [8] = "Freestanding", 
    [9] = "Fake Duck", 
    [10] = "Safe Points", 
    [11] = "Body Aim", 
    [12] = "Ragebot Stats", 
    [13] = "Fake"
}));
v7.new("side_pos_y", v365.tab:slider("Offset", 0, v34.screen.y, math.floor(v34.screen.y / 1.4)), function()
    -- upvalues: v7 (ref)
    return #v7.elements.side_binds:get() > 0;
end);
v290.side_default = render.load_font("calibri", 23, "adb");
v290.side_small = render.load_font("calibri", 19, "adb");
v365.mt = {
    alpha = 0, 
    add_y = 40, 
    GetBool = function()
        return true;
    end, 
    CustomRender = function(_, _, _)

    end
};
v365.data = {};
v365.data.CreateObject = function(v369, v370)
    -- upvalues: v365 (ref)
    table.insert(v369, setmetatable(v370, {
        __index = v365.mt
    }));
end;
v365.render_gradient = function(v371, v372, v373, v374, ...)
    render.gradient(vector(v371, v372), vector(v371 + v373, v372 + v374), ...);
end;
v365.render_indicator = function(v375, v376, v377, v378)
    -- upvalues: v290 (ref), v365 (ref)
    local v379 = render.measure_text(v290.side_default, nil, v378);
    local v380 = v377.a / 255;
    v365.render_gradient(v375 - 10, v376 - 5, v379.x / 2 + 10, v379.y + 10, color(0, 0, 0, 0 * v380), color(0, 0, 0, 30 * v380), color(0, 0, 0, 0 * v380), color(0, 0, 0, 30 * v380));
    v365.render_gradient(v375 + v379.x / 2, v376 - 5, v379.x / 2 + 10, v379.y + 10, color(0, 0, 0, 30 * v380), color(0, 0, 0, 0 * v380), color(0, 0, 0, 30 * v380), color(0, 0, 0, 0 * v380));
    render.text(v290.side_default, vector(v375, v376), v377, nil, v378);
end;
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.side_binds:get(), "Fake");
    end, 
    CustomRender = function(v382, v383, v384)
        -- upvalues: v75 (ref), v2 (ref), v365 (ref)
        local v385 = v75.new("desync_side", math.abs(v2.get_desync_delta())) / 60;
        local v386 = color(195, 16, 16):lerp(color(132, 195, 16), v385);
        v386.a = v382.alpha;
        v365.render_indicator(v383, v384, v386, "FAKE");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.side_binds:get(), "Ragebot Stats");
    end, 
    CustomRender = function(v388, v389, v390)
        -- upvalues: v162 (ref), v365 (ref)
        local v391 = color(200, 200, 200);
        v391.a = v388.alpha;
        local v392 = v162.shots_data.hit + v162.shots_data.miss;
        local v393 = v162.shots_data.hit / v392;
        local v394 = 0;
        if v393 > 0 then
            v394 = math.floor(v393 * 100);
        end;
        local v395 = ("%s/%s (%s%%)"):format(v162.shots_data.hit, v162.shots_data.miss, v394);
        v365.render_indicator(v389, v390, v391, v395);
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        if not v21(v7.elements.side_binds:get(), "Min. Damage") then
            return false;
        else
            for _, v398 in ipairs(ui.get_binds()) do
                if v398.name == "Min. Damage" and v398.active then
                    return true;
                end;
            end;
            return false;
        end;
    end, 
    CustomRender = function(v399, v400, v401)
        -- upvalues: v35 (ref), v365 (ref)
        local v402 = color(200, 200, 200);
        v402.a = v399.alpha;
        local v403 = tostring(v35["Min. Damage"]:get());
        v365.render_indicator(v400, v401, v402, ("DMG: %s"):format(v403));
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        if not v21(v7.elements.side_binds:get(), "Hitchance") then
            return false;
        else
            for _, v406 in ipairs(ui.get_binds()) do
                if v406.name == "Hit Chance" and v406.active then
                    return true;
                end;
            end;
            return false;
        end;
    end, 
    CustomRender = function(v407, v408, v409)
        -- upvalues: v35 (ref), v365 (ref)
        local v410 = color(200, 200, 200, v407.alpha);
        local v411 = v35.hitchance:get();
        v365.render_indicator(v408, v409, v410, ("HC: %s"):format(v411));
    end
});
v35.fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref), v35 (ref)
        return v21(v7.elements.side_binds:get(), "Ping") and v35.fake_latency:get() > 0;
    end, 
    CustomRender = function(v413, v414, v415)
        -- upvalues: v74 (ref), v35 (ref), v365 (ref)
        local v416 = math.clamp(v74(0) / v35.fake_latency:get(), 0, 1);
        local v417 = color(238, 222, 185):lerp(color(123, 194, 21), v416);
        v417.a = v413.alpha;
        v365.render_indicator(v414, v415, v417, "PING");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.fake_duck:get() and v21(v7.elements.side_binds:get(), "Fake Duck");
    end, 
    CustomRender = function(v419, v420, v421)
        -- upvalues: v365 (ref)
        local v422 = color(200, 200, 200, v419.alpha);
        v365.render_indicator(v420, v421, v422, "DUCK");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.body_aim:get() == "Force" and v21(v7.elements.side_binds:get(), "Body Aim");
    end, 
    CustomRender = function(v424, v425, v426)
        -- upvalues: v365 (ref)
        local v427 = color(200, 200, 200);
        v427.a = v424.alpha;
        v365.render_indicator(v425, v426, v427, "BAIM");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.safe_points:get() == "Force" and v21(v7.elements.side_binds:get(), "Safe Points");
    end, 
    CustomRender = function(v429, v430, v431)
        -- upvalues: v365 (ref)
        local v432 = color(200, 200, 200);
        v432.a = v429.alpha;
        v365.render_indicator(v430, v431, v432, "SAFE");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v2 (ref), v21 (ref), v7 (ref)
        return v2.menu_refs.Freestanding:get() and v21(v7.elements.side_binds:get(), "Freestanding");
    end, 
    CustomRender = function(v434, v435, v436)
        -- upvalues: v365 (ref)
        local v437 = color(200, 200, 200);
        v437.a = v434.alpha;
        v365.render_indicator(v435, v436, v437, "FS");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.dormant_aimbot:get() and v21(v7.elements.side_binds:get(), "Dormant Aimbot");
    end, 
    CustomRender = function(v439, v440, v441)
        -- upvalues: v365 (ref)
        local v442 = color(200, 200, 200);
        v442.a = v439.alpha;
        v365.render_indicator(v440, v441, v442, "DA");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.hide_shots:get() and v21(v7.elements.side_binds:get(), "Hide Shots");
    end, 
    CustomRender = function(v444, v445, v446)
        -- upvalues: v365 (ref)
        local v447 = color(200, 200, 200);
        v447.a = v444.alpha;
        v365.render_indicator(v445, v446, v447, "OS");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v35 (ref), v21 (ref), v7 (ref)
        return v35.double_tap:get() and v21(v7.elements.side_binds:get(), "Double Tab");
    end, 
    CustomRender = function(v449, v450, v451)
        -- upvalues: v365 (ref)
        local v452 = rage.exploit:get() == 1 and color(200, 200, 200) or color(255, 0, 50);
        v452.a = v449.alpha;
        v365.render_indicator(v450, v451, v452, "DT");
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v103 (ref), v21 (ref), v7 (ref)
        local v454, v455 = v103.init():get_state();
        return v21(v7.elements.side_binds:get(), "Bomb Info") and v454 and not v455;
    end, 
    CustomRender = function(v456, v457, v458)
        -- upvalues: v103 (ref), v75 (ref), v365 (ref)
        local v459 = v103.init();
        local v460 = v459:get_site();
        local v461, _ = v459:get_timer();
        local v463 = v75.new("bomb_timer", v461 < 5 and color(255, 0, 50) or color(222, 222, 222));
        v463.a = v456.alpha;
        local v464 = ("%s - %.1fs"):format(v460, v461);
        v365.render_indicator(v457, v458, v463, v464);
    end
});
v365.data:CreateObject({
    GetBool = function(_)
        -- upvalues: v103 (ref), v21 (ref), v7 (ref)
        local v466, v467 = v103.init():get_state();
        return v21(v7.elements.side_binds:get(), "Bomb Info") and v466 and not v467;
    end, 
    CustomRender = function(v468, v469, v470)
        -- upvalues: v103 (ref), v75 (ref), v365 (ref)
        local v471, v472 = v103.init():get_damage();
        local v473 = v75.new("bomb_fatal", v471 and color(255, 0, 50) or color(252, 243, 105));
        v473.a = v468.alpha;
        local v474 = v471 and "FATAL" or ("-%s HP"):format(v472);
        v365.render_indicator(v469, v470, v473, v474);
    end
});
v365.GetActiveBinds = function(v475)
    local v476 = {};
    for _, v478 in ipairs(v475.data) do
        v478.alpha = v478:GetBool() and 255 or 0;
        if v478.alpha > 0 then
            table.insert(v476, v478);
        end;
    end;
    return v476;
end;
v365.on_draw = function()
    -- upvalues: v7 (ref), v365 (ref)
    if not v7.elements.side_indicators:get() then
        return;
    else
        local v479 = entity.get_local_player();
        if not v479 or not v479:is_alive() then
            return;
        else
            local v480 = 20;
            local v481 = v7.elements.side_pos_y:get();
            local _ = 0;
            local l_v365_ActiveBinds_0 = v365:GetActiveBinds();
            for v484, v485 in ipairs(l_v365_ActiveBinds_0) do
                v485:CustomRender(v480, v481 - v484 * v485.add_y);
            end;
            return;
        end;
    end;
end;
events.render:set(v365.on_draw);
local v486 = {
    var = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
};
v7.new("scope_lines", v155.visual_main:switch("Scope Lines"));
v486.tab = v7.elements.scope_lines:create();
v7.new("scope_color", v486.tab:color_picker("Color", color(255, 255, 255)));
v7.new("scope_offset", v486.tab:slider("Offset", 0, 100, 10));
v7.new("scope_length", v486.tab:slider("Length", 0, 300, 60));
v7.new("scope_options", v486.tab:listable("", "Spread Based", "Inverted", "T-Style"));
v486.on_draw = function()
    -- upvalues: v7 (ref), v486 (ref), v75 (ref), v21 (ref), v34 (ref)
    if not v7.elements.scope_lines:get() then
        return;
    else
        v486.var:override("Remove All");
        local v487 = entity.get_local_player();
        local v488;
        if v487 and v487:is_alive() then
            v488 = not not v487.m_bIsScoped;
        else
            v488 = false;
        end;
        local v489 = v75.new("scope_lines", v488 and 1 or 0);
        local v490 = 0;
        if v7.elements.scope_options:get(1) and v487 then
            local v491 = v487:get_player_weapon();
            if v491 and v487.m_bIsScoped then
                v490 = v75.new("spread", (v491:get_inaccuracy() + v491:get_spread()) * v491:get_max_speed()) / 2;
            end;
        end;
        local function _(v492)
            -- upvalues: v21 (ref), v7 (ref)
            return v21(v7.elements.scope_disable_lines:get(), v492);
        end;
        local v494 = not v7.elements.scope_options:get(2);
        v486.offset = v7.elements.scope_offset:get() * v489 + v490;
        v486.length = v7.elements.scope_length:get() * v489;
        v486.col_1 = v7.elements.scope_color:get();
        v486.col_2 = v7.elements.scope_color:get();
        v486.width = 1;
        v486.col_1.a = (v494 and v486.col_1.a or 0) * v489;
        v486.col_2.a = (not v494 and v486.col_2.a or 0) * v489;
        v486.start_x = v34.screen.x / 2;
        v486.start_y = v34.screen.y / 2;
        render.gradient(vector(v486.start_x - v486.offset, v486.start_y), vector(v486.start_x - v486.offset - v486.length, v486.start_y + v486.width), v486.col_1, v486.col_2, v486.col_1, v486.col_2);
        render.gradient(vector(v486.start_x + v486.offset, v486.start_y), vector(v486.start_x + v486.offset + v486.length, v486.start_y + v486.width), v486.col_1, v486.col_2, v486.col_1, v486.col_2);
        render.gradient(vector(v486.start_x, v486.start_y + v486.offset), vector(v486.start_x + v486.width, v486.start_y + v486.offset + v486.length), v486.col_1, v486.col_1, v486.col_2, v486.col_2);
        if not v7.elements.scope_options:get(3) then
            render.gradient(vector(v486.start_x, v486.start_y - v486.offset), vector(v486.start_x + v486.width, v486.start_y - v486.offset - v486.length), v486.col_1, v486.col_1, v486.col_2, v486.col_2);
        end;
        return;
    end;
end;
v486.on_destroy = function()
    -- upvalues: v486 (ref)
    v486.var:override();
end;
v7.elements.scope_lines:set_callback(v486.on_destroy);
events.render:set(v486.on_draw);
events.shutdown:set(v486.on_destroy);
local v495 = {};
v7.new("arrows", v155.visual_main:switch("Arrows"));
v495.tab = v7.elements.arrows:create();
v7.new("arrows_size", v495.tab:slider("Size", 0, 15, 9));
v7.new("arrows_distance", v495.tab:slider("Distance", 0, 60, 43));
v7.new("arrows_inverted_color", v495.tab:color_picker("Inverted", color(150, 150, 255)));
v7.new("arrows_active_color", v495.tab:color_picker("Active", color(150, 150, 255)));
v7.new("arrows_inactive_color", v495.tab:color_picker("Inactive", color(0, 0, 0, 50)));
v7.new("arrows_in_scope", v495.tab:combo("In Scope", {
    [1] = "Nothing", 
    [2] = "Disable", 
    [3] = "Replace"
}));
v495.on_draw = function()
    -- upvalues: v7 (ref), v34 (ref), v75 (ref), v2 (ref)
    local v496 = true;
    if not v7.elements.arrows:get() then
        v496 = false;
    end;
    local v497 = entity.get_local_player();
    if not v497 or not v497:is_alive() then
        v496 = false;
    end;
    local v498 = v7.elements.arrows_in_scope:get();
    local v499 = v497 and v497.m_bIsScoped;
    if v7.elements.scope_lines:get() and v499 and v498 == "Disable" then
        v496 = false;
    end;
    local v500 = v34.screen.x / 2;
    local v501 = v34.screen.y / 2;
    local v502 = v7.elements.arrows_distance:get() or 0;
    local v503 = v7.elements.arrows_size:get() or 0;
    local v504 = 5 + (v7.elements.arrows_size:get() or 0);
    v501 = v501 - v75.new("replace_arrows", v498 == "Replace" and v499 and v503 + 7 or 0);
    local v505 = v2.get_manual_func:state();
    local v506 = v2.get_inverter_state();
    local v507 = v7.elements.arrows_active_color:get();
    local v508 = v7.elements.arrows_inactive_color:get();
    local v509 = v75.new("arrows_alpha", v496 and 1 or 0);
    local v510 = v75.new("poly_left", v505.left and v507 or v508);
    v510.a = v510.a * v509;
    local v511 = v75.new("poly_right", v505.right and v507 or v508);
    v511.a = v511.a * v509;
    local v512 = v7.elements.arrows_inverted_color:get();
    local v513 = v75.new("inverted_left", v506 and v512 or v508);
    v513.a = v513.a * v509;
    local v514 = v75.new("inverted_right", v506 and v508 or v512);
    v514.a = v514.a * v509;
    render.poly(v510, vector(v500 - v502, v501 - v503), vector(v500 - (v502 + v504), v501), vector(v500 - v502, v501 + v503));
    render.poly(v511, vector(v500 + v502, v501 - v503), vector(v500 + (v502 + v504), v501), vector(v500 + v502, v501 + v503));
    render.rect(vector(v500 - (v502 - 2), v501 - v503), vector(v500 - (v502 - 2) + 2, v501 + v503), v513);
    render.rect(vector(v500 + (v502 - 2) - 2, v501 - v503), vector(v500 + (v502 - 2), v501 + v503), v514);
end;
events.render:set(v495.on_draw);
v155.global_misc = ui.create(v155.settings, v149("wrench", "Misc"));
local v515 = {};
v7.new("clantag_enable", v155.global_misc:switch("Clantag"));
v515.tab = v7.elements.clantag_enable:create();
v7.new("clantag_type", v515.tab:combo("Type", {
    [1] = "original", 
    [2] = "custom"
}));
v7.new("clantag_custom", v515.tab:input("Text", ""), function()
    -- upvalues: v7 (ref)
    return v7.elements.clantag_type:get() == "custom";
end);
v515.last = nil;
v515.set = function(v516)
    -- upvalues: v515 (ref)
    if v516 == v515.last then
        return;
    else
        common.set_clan_tag(v516);
        v515.last = v516;
        return;
    end;
end;
v515.build = function(v517)
    local v518 = {};
    for v519 = 1, #v517 do
        table.insert(v518, v517:sub(1, v519));
    end;
    for _ = 1, 4 do
        table.insert(v518, v517);
    end;
    for v521 = 1, #v517 do
        table.insert(v518, v517:sub(v521, #v517));
    end;
    table.insert(v518, "");
    return v518;
end;
v515.types = {};
v515.new_type = function(v522, v523)
    -- upvalues: v515 (ref)
    if not v515.types[v522] then
        v515.types[v522] = {
            get_string = function()
                -- upvalues: v523 (ref)
                if type(v523) == "string" then
                    return v523;
                else
                    return v523();
                end;
            end
        };
    end;
end;
v515.new_type("original", function()
    return "aarneclub";
end);
v515.new_type("custom", function()
    -- upvalues: v7 (ref)
    return v7.elements.clantag_custom:get();
end);
v515.on_render = function()
    -- upvalues: v7 (ref), v515 (ref)
    if not v7.elements.clantag_enable:get() then
        return;
    elseif not globals.is_connected then
        return;
    else
        local v524 = utils.net_channel();
        if not v524 then
            return;
        else
            local v525 = v7.elements.clantag_type:get();
            local v526 = v515.types[v525] and v515.types[v525]:get_string() or "";
            local v527 = v515.build(v526);
            local v528 = v524.latency[0] / globals.tickinterval;
            local v529 = globals.tickcount + v528;
            local v530 = math.floor(math.fmod(v529 / 13, #v527)) + 1;
            v515.set(v527[v530]);
            return;
        end;
    end;
end;
events.render:set(v515.on_render);
v515.destroy = function()
    -- upvalues: v515 (ref)
    v515.set("");
end;
v7.elements.clantag_enable:set_callback(v515.destroy);
events.shutdown:set(v515.destroy);
local v531 = {};
v7.new("trashtalk_enable", v155.global_misc:switch("Trashtalk"));
v531.tab = v7.elements.trashtalk_enable:create();
v7.new("trashtalk_type", v531.tab:combo("Type", {
    [1] = "Random Phrases", 
    [2] = "Reply in chat"
}));
v7.new("trashtalk_reply_random_case", v531.tab:switch("Random case"), function()
    -- upvalues: v7 (ref)
    return v7.elements.trashtalk_type:get() == "Reply in chat";
end);
v7.new("trashtalk_events", v531.tab:selectable("Events", {
    [1] = "On Kill", 
    [2] = "On Death"
}), function()
    -- upvalues: v7 (ref)
    return v7.elements.trashtalk_type:get() == "Random Phrases";
end);
v531.phrases = {
    on_kill = {
        [1] = "A \208\156\208\144\208\156\208\149? \208\144 \208\159\208\144\208\159\208\149?? \208\144 \208\146 \208\165\208\163\208\153???", 
        [2] = "\208\178 \208\179\209\131\208\187\208\176\208\179", 
        [3] = "\209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140 \209\129\208\178\208\190\208\184\208\188 \208\190\209\135\208\186\208\190\208\188 \209\131\208\188\208\181\208\181\209\130 \208\180\208\190\209\128\208\190\208\179\208\184 \209\129\209\130\209\128\208\190\208\184\209\130\209\140", 
        [4] = "\209\143 \209\129\208\188\208\190\209\130\209\128\208\181\208\187 \208\178\208\184\208\180\208\190\209\129\209\139 \208\189\208\190\208\187\208\176\208\178\208\176 \208\188\208\189\208\181 \208\191\208\190\209\133\209\131\208\185 (\226\151\163_\226\151\162)", 
        [5] = "primordial.dev/refund.php", 
        [6] = "\209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\178 \209\130\208\178\208\190\208\181\208\188 \208\180\208\190\208\188\208\181 \208\181\208\177\208\176\208\187, \209\133\208\176\209\130\209\131 \209\128\208\176\208\183\208\190\208\179\209\128\208\181\208\178\208\176\208\187", 
        [7] = "\208\178\209\129\209\143 \208\186\208\190\208\189\209\129\208\190\208\187\209\140 \208\178 \209\130\208\178\208\190\208\184\209\133 \209\129\208\188\208\181\209\128\209\130\209\143\209\133", 
        [8] = nil, 
        [9] = "\208\183\208\176\208\179\208\184\208\191\208\189\208\190\209\130\208\184\208\183\208\184\209\128\208\190\208\178\208\176\208\187 \209\130\208\181\208\177\209\143 \209\129\208\178\208\190\208\184\208\188 \209\135\208\187\208\181\208\189\208\190\208\188", 
        [10] = "\208\190\208\185, \209\131\208\177\208\184\208\187 \209\130\208\181\208\177\209\143, \208\188\208\189\208\181 \209\130\208\176\208\187\208\184\209\129\208\188\208\176\208\189 \208\191\208\184\209\129\209\143\208\189\208\186\208\176 \208\191\208\190\208\188\208\190\208\179", 
        [11] = "\208\180\209\131\208\188\208\176\208\187 \209\131\208\177\209\140\209\145\209\136\209\140? \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\190\209\130 \208\191\208\184\209\129\209\143\208\189\208\186\208\184 \208\191\208\190\208\188\208\190\208\179\208\187\208\184", 
        [12] = "\209\131\208\180\208\176\208\187\208\184 northon, \208\186\209\131\208\191\208\184 aarneclub", 
        [13] = "\208\176 \208\184\208\177\208\190 \208\189\208\181\209\133\209\131\208\185 \209\130\208\181\208\177\208\181 \209\130\209\139\209\128\208\186\208\176\209\130\209\140 \208\191\208\190 \208\186\208\187\208\176\208\178\208\184\208\176\209\130\209\131\209\128\208\181 \208\184 \208\189\208\176\208\180\208\181\208\181\209\130\209\129\209\143 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131", 
        [14] = "\209\133\208\176, \208\190\208\177\208\181\208\183\209\140\209\143\208\189\208\186\208\176, \209\131\208\177\208\184\208\187 \209\130\208\181\208\177\209\143", 
        [15] = nil, 
        [16] = "\209\133\208\178\208\176\209\130\208\184\209\130 \208\191\208\184\209\130\209\140 \208\177\208\190\209\128\208\182\208\190\208\188\208\184", 
        [17] = "\208\178\208\190\209\130 \209\141\209\130\208\190 \209\133\208\181\208\180\209\136\208\190\209\130 0_\208\190", 
        [18] = "neverlose.cc/market/item-dispute?id=acidtech", 
        [19] = "\226\153\155 \240\157\144\142\240\157\144\150\240\157\144\141\240\157\144\132\240\157\144\131 \240\157\144\129\240\157\144\152 \240\157\144\143\240\157\144\142\240\157\144\149\240\157\144\136\240\157\144\131\240\157\144\139\240\157\144\142 \226\153\155", 
        [20] = nil, 
        [21] = "\208\178\209\133\208\176\208\178\208\178\209\133\208\176\208\183\209\133 \208\177\208\187\209\143\208\180\209\140 \208\181\209\137\208\181 \209\129\208\186\208\176\208\182\208\184 \209\135\209\130\208\190 \209\130\209\139 \209\129\209\130\209\128\208\184\208\188\209\139 \209\132\208\184\208\191\208\176 \209\129\208\188\208\190\209\130\209\128\208\184\209\136\209\140", 
        [8] = {
            [1] = "\209\130\208\176\208\186\208\190\208\185 \209\130\209\131\208\191\208\190\209\128\209\139\208\187\209\139\208\185", 
            [2] = "\209\143 \208\178\208\176\209\133\209\131\208\181"
        }, 
        [15] = {
            [1] = "\208\189\209\131 \209\136\208\190 \209\130\208\181 \208\189\208\176\208\191\208\184\209\129\208\176\209\130\209\140", 
            [2] = "\208\189\209\131 1"
        }, 
        [20] = {
            [1] = "\208\184\208\179\209\128\208\176\208\181\209\136\209\140 \209\129 northon?", 
            [2] = "\208\190\208\189\208\190 \208\184 \208\178\208\184\208\180\208\189\208\190))"
        }
    }, 
    on_death = {
        [1] = nil, 
        [2] = nil, 
        [3] = "\208\189\209\131 \209\132\209\131 \208\177\208\187\209\143\209\130\209\140", 
        [4] = "\208\189\209\131 \208\191\209\128\208\184\208\180\209\131\209\128\208\190\208\186 \208\191\209\128\208\190\208\181\208\177\208\176\208\187 \208\178\209\129\209\145 \209\135\209\130\208\190 \208\188\208\190\208\182\208\189\208\190", 
        [5] = "\208\189\209\131 \208\188\208\176\208\188\209\131 \208\181\208\177\208\176\208\187 \209\130\209\139 \208\186\208\176\208\186 \209\131\208\177\208\184\208\187 \208\188\208\181\208\189\209\143", 
        [6] = "\208\189\209\131 \209\131 \208\188\208\181\208\189\209\143 \208\182\208\181 \208\178\209\129\209\145-\209\130\208\176\208\186\208\184 \208\189\208\181 \209\129\208\186\208\184\209\130..", 
        [7] = "\209\132\209\131 \208\177\208\187\209\143\208\180\208\190\209\130\208\176 \209\129 \208\189\208\187\208\190\208\188 \209\131\208\177\208\184\208\178\208\176\208\181\209\130 \208\190\208\191\209\143\209\130\209\140", 
        [8] = "\208\176 \209\130\208\184\208\188\208\181\208\185\209\130 \208\186\208\176\208\186 \208\178\209\129\208\181\208\179\208\180\208\176 \208\189\208\176 \208\177", 
        [9] = "\208\154\208\144\208\154 \208\162\208\171 \208\162\208\163\208\162 \208\146\208\171\208\161\208\162\208\160\208\149\208\155\208\152\208\155 \208\148\208\144\208\163\208\157", 
        [10] = "\209\141\209\130\208\190 \209\130\209\139 \209\129\208\186\208\190\208\187\209\140\208\186\208\190 \208\186\208\189\208\190\208\191\208\190\208\186 \208\191\209\128\208\190\208\182\208\176\208\187 \209\135\209\130\208\190\208\177\209\139 \209\131\208\177\208\184\209\130\209\140 \208\188\208\181\208\189\209\143?", 
        [11] = "mcdonalds resolver", 
        [12] = nil, 
        [13] = nil, 
        [14] = "\209\141\209\130\208\190 \208\176\208\189\209\128\208\181\208\179 \208\178 \208\191\208\184\208\189\208\179", 
        [1] = {
            [1] = "\208\189\208\181 \208\187\208\184\208\178\208\176\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129", 
            [2] = "\209\137\208\176 \208\183\208\176\208\179\209\128\209\131\208\182\209\131 \208\186\208\190\208\189\209\132\208\184\208\179 \208\186\208\184\209\129\208\187\208\190\208\179\208\190 \208\184 \208\178\209\139\208\181\208\177\209\131 \209\130\208\181\208\177\209\143"
        }, 
        [2] = {
            [1] = "\208\189\209\131 \208\189\208\181 \208\189\208\181", 
            [2] = "\208\189\209\131 \209\130\208\176\208\186\208\190\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\208\187"
        }, 
        [12] = {
            [1] = "[acidtech] missed shot due to death", 
            [2] = "\208\183\208\176\208\181\208\177\208\184\209\129\209\140 \208\191\208\176\209\129\209\130\208\176 \208\177\208\187\209\143\208\180\209\140"
        }, 
        [13] = {
            [1] = "you're killin' me slow", 
            [2] = "so slow", 
            [3] = "oh no"
        }
    }
};
v531.say_after = function(v532, v533)
    utils.execute_after(v532, function()
        -- upvalues: v533 (ref)
        utils.console_exec("say " .. v533);
    end);
end;
v531.delay_say = function(v534)
    -- upvalues: v531 (ref)
    local v535 = 0.75;
    if type(v534) == "string" then
        return v531.say_after(v535, v534);
    else
        for _, v537 in ipairs(v534) do
            v531.say_after(v535, v537);
            v535 = v535 + 0.75;
        end;
        return;
    end;
end;
v531.on_event = function(v538)
    -- upvalues: v7 (ref), v21 (ref), v531 (ref)
    if not v7.elements.trashtalk_enable:get() then
        return;
    elseif v7.elements.trashtalk_type:get() ~= "Random Phrases" then
        return;
    else
        local v539 = entity.get_local_player();
        local v540 = entity.get(v538.attacker, true);
        local v541 = entity.get(v538.userid, true);
        local v542 = v7.elements.trashtalk_events:get();
        if v21(v542, "On Death") and v540 ~= v539 and v541 == v539 then
            local l_on_death_0 = v531.phrases.on_death;
            local v544 = l_on_death_0[utils.random_int(1, #l_on_death_0)];
            v531.delay_say(v544);
        end;
        if v21(v542, "On Kill") and v540 == v539 and v541 ~= v539 then
            local l_on_kill_0 = v531.phrases.on_kill;
            local v546 = l_on_kill_0[utils.random_int(1, #l_on_kill_0)];
            v531.delay_say(v546);
        end;
        return;
    end;
end;
events.player_death:set(v531.on_event);
v531.string_find = function(v547, v548)
    v547 = string.lower(v547);
    if type(v548) == "string" then
        return v547:find(v548);
    else
        for _, v550 in pairs(v548) do
            if v547:find(v550) then
                return true;
            end;
        end;
        return false;
    end;
end;
v531.check_words = {
    [1] = "1", 
    [2] = "rs", 
    [3] = "\208\186\209\139"
};
v531.on_say = function(v551)
    -- upvalues: v7 (ref), v531 (ref)
    if not v7.elements.trashtalk_enable:get() then
        return;
    elseif v7.elements.trashtalk_type:get() ~= "Reply in chat" then
        return;
    else
        local _ = entity.get_local_player();
        if not entity.get(v551.userid, true):is_enemy() then
            return;
        elseif v531.string_find(v551.text, v531.check_words) then
            return;
        else
            if v7.elements.trashtalk_reply_random_case:get() then
                local v553 = "";
                for v554 = 1, #v551.text do
                    local v555 = v551.text:sub(v554, v554);
                    local v556 = utils.random_int(0, 1) == 1;
                    v553 = v553 .. string[v556 and "upper" or "lower"](v555);
                end;
                v551.text = v553;
            end;
            v531.say_after(1, v551.text);
            return;
        end;
    end;
end;
events.player_say:set(v531.on_say);
local v557 = {
    keys = {
        [1] = "viewmodel_fov", 
        [2] = "viewmodel_offset_x", 
        [3] = "viewmodel_offset_y", 
        [4] = "viewmodel_offset_z"
    }, 
    backup = {}
};
v557.backup.data = {};
v557.backup.update = function()
    -- upvalues: v557 (ref)
    for _, v559 in ipairs(v557.keys) do
        v557.backup.data[v559] = cvar[v559]:float();
    end;
end;
v557.backup.update();
v557.backup.set = function()
    -- upvalues: v557 (ref)
    for v560, v561 in pairs(v557.backup.data) do
        cvar[v560]:float(v561);
    end;
end;
events.shutdown:set(v557.backup.set);
v7.new("viewmodel_enable", v155.global_misc:switch("Viewmodel"));
v557.tab = v7.elements.viewmodel_enable:create();
v7.new("viewmodel_fov", v557.tab:slider("FOV", -100, 100, 68));
v7.new("viewmodel_offset_x", v557.tab:slider("X", -100, 100, 25, 0.1));
v7.new("viewmodel_offset_y", v557.tab:slider("Y", -100, 100, 0, 0.1));
v7.new("viewmodel_offset_z", v557.tab:slider("Z", -100, 100, -15, 0.1));
v557.on_createmove = function()
    -- upvalues: v7 (ref), v557 (ref)
    if not v7.elements.viewmodel_enable:get() then
        return;
    else
        for _, v563 in ipairs(v557.keys) do
            local v564 = v7.elements[v563]:get();
            if v563:find("fov") == nil then
                v564 = v564 * 0.1;
            end;
            cvar[v563]:float(v564, true);
        end;
        return;
    end;
end;
events.createmove:set(v557.on_createmove);
v7.elements.viewmodel_enable:set_callback(function()
    -- upvalues: v7 (ref), v557 (ref)
    if not v7.elements.viewmodel_enable:get() then
        v557.backup.set();
    end;
end);
local v565 = {};
v7.new("aspect_ratio_enable", v155.global_misc:switch("Aspect Ratio"));
v565.tab = v7.elements.aspect_ratio_enable:create();
v7.new("aspect_ratio_value", v565.tab:slider("Value", 0, 300, 140, 0.01));
v565.hiden_cvars_ref = ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars");
v565.cvar = cvar.r_aspectratio;
v565.update_value = function()
    -- upvalues: v565 (ref), v7 (ref)
    if not v565.hiden_cvars_ref:get() then
        v565.hiden_cvars_ref:set(true);
    end;
    local v566 = v7.elements.aspect_ratio_enable:get() and v7.elements.aspect_ratio_value:get() * 0.01 or 0;
    if v565.cvar:float() ~= v566 then
        v565.cvar:float(v566);
    end;
end;
v565.shutdown = function()
    -- upvalues: v565 (ref)
    v565.cvar:int(0);
end;
events.shutdown:set(v565.shutdown);
events.render:set(v565.update_value);
local v567 = {};
v7.new("radar_disable", v155.global_misc:switch("Disable Radar"));
v567.on_switch = function()
    -- upvalues: v7 (ref)
    cvar.cl_drawhud_force_radar:int(v7.elements.radar_disable:get() and -1 or 0);
end;
events.shutdown:set(function()
    cvar.cl_drawhud_force_radar:int(0);
end);
v567.on_switch();
v7.elements.radar_disable:set_callback(v567.on_switch);
local _ = nil;
local v569 = v155.global_misc:switch("Taskbar Notify");
v569:tooltip("Will flash your csgo icon in taskbar on round start.");
v7.new("taskbar_notify", v569);
ffi.cdef("        int GetForegroundWindow();\n        bool FlashWindow(int hwnd, bool invert);\n        int FindWindowA(const char* class, const char* name);\n    ");
local v570 = ffi.load("user32");
local v571 = v570.FindWindowA("Valve001", "Counter-Strike: Global Offensive - Direct3D 9");
do
    local l_v569_0, l_v570_0, l_v571_0 = v569, v570, v571;
    local function v575()
        -- upvalues: l_v570_0 (ref), l_v571_0 (ref)
        return l_v570_0.GetForegroundWindow() == l_v571_0;
    end;
    local function v576()
        -- upvalues: v575 (ref), l_v570_0 (ref), l_v571_0 (ref)
        if not v575() then
            l_v570_0.FlashWindow(l_v571_0, true);
        end;
    end;
    local function v577()
        -- upvalues: l_v569_0 (ref), v576 (ref)
        if l_v569_0:get() then
            v576();
        end;
    end;
    events.round_start(v577);
end;
v155.visual_other = ui.create(v155.settings, v149("swatchbook", "Other"));
v7.new("hitlogs", v155.visual_other:switch("Logs"));
v3.tab = v7.elements.hitlogs:create();
v7.new("hitlogs_offset", v3.tab:slider("Offset", 0, 300, 0));
v7.new("hitlogs_style", v3.tab:selectable("Style", {
    [1] = "Center", 
    [2] = "Default", 
    [3] = "Console"
}));
v7.new("hitlogs_font", v3.tab:combo("Font", {
    [1] = "Default", 
    [2] = "Bold"
}), function()
    -- upvalues: v7 (ref)
    return #v7.elements.hitlogs_style:get() > 0;
end);
v7.new("hitlogs_glow", v3.tab:switch("Glow"), function()
    -- upvalues: v21 (ref), v7 (ref)
    return v21(v7.elements.hitlogs_style:get(), "Center");
end);
v7.elements.hitlogs_glow:tooltip("Only for center logs.");
v7.new("hitlogs_custom_kolors", v3.tab:switch("Custom Colors"), function()
    -- upvalues: v7 (ref)
    return #v7.elements.hitlogs_style:get() > 0;
end);
v3.custom_colors_visibility = function()
    -- upvalues: v7 (ref)
    return #v7.elements.hitlogs_style:get() > 0 and v7.elements.hitlogs_custom_kolors:get();
end;
v7.new("hitlogs_hit_color", v3.tab:color_picker("Hit", color(178, 255, 178)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_death_color", v3.tab:color_picker("Death", color(125, 125, 125)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_spread_color", v3.tab:color_picker("Spread", color(255, 230, 127)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_lagcomp_color", v3.tab:color_picker("Lagcomp", color(255, 127, 127)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_resolver_color", v3.tab:color_picker("Resolver", color(255, 127, 127)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_prediction_color", v3.tab:color_picker("Prediction", color(255, 230, 127)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_unregistered_color", v3.tab:color_picker("Unregistered", color(125, 125, 125)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_player_death_color", v3.tab:color_picker("Player Death", color(125, 125, 125)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_misprediction_color", v3.tab:color_picker("Misprediction", color(255, 127, 127)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v7.new("hitlogs_anti_brute_color", v3.tab:color_picker("Anti Bruteforce", color(255, 255, 204)), function()
    -- upvalues: v3 (ref)
    return v3.custom_colors_visibility();
end);
v3.work_time = 5;
v3.mt = {
    add_y = 15, 
    alpha = 0, 
    realtime = globals.realtime, 
    default_pos = vector(5, 5), 
    CustomRender = function(v578, v579, v580)
        -- upvalues: v290 (ref)
        local v581 = color(255, 255, 255, v578.alpha);
        render.text(v290.verdana_b, vector(v579, v580), v581, nil, "");
    end
};
v3.style = {};
v3.style.Center = {};
v3.style.Default = {};
v3.shots = 0;
events.round_start:set(function()
    -- upvalues: v3 (ref)
    v3.shots = 0;
end);
v3.count = {
    [1] = "st", 
    [2] = "nd", 
    [3] = "rd"
};
v3.hitgroup_names = {
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
};
v3.shot_data = {};
v3.on_ragebot = function(v582)
    -- upvalues: v3 (ref)
    v3.shot_data = {
        backtrack = v582.backtrack, 
        hitchance = v582.hitchance, 
        hitgroup = v582.hitgroup, 
        damage = v582.damage, 
        angle = v582.angle
    };
end;
events.aim_fire:set(v3.on_ragebot);
v3.get_reason = function(v583)
    -- upvalues: v7 (ref)
    v583 = tostring(v583);
    local v584 = v7.elements.hitlogs_custom_kolors:get();
    return ({
        ["nil"] = {
            name = "hit", 
            color = v584 and v7.elements.hitlogs_hit_color:get() or color(178, 255, 178)
        }, 
        spread = {
            name = "spread", 
            color = v584 and v7.elements.hitlogs_spread_color:get() or color(255, 230, 127)
        }, 
        correction = {
            name = "resolver", 
            color = v584 and v7.elements.hitlogs_resolver_color:get() or color(255, 127, 127)
        }, 
        misprediction = {
            name = "misprediction", 
            color = v584 and v7.elements.hitlogs_misprediction_color:get() or color(255, 127, 127)
        }, 
        ["lagcomp failure"] = {
            name = "lagcomp failure", 
            color = v584 and v7.elements.hitlogs_lagcomp_color:get() or color(255, 127, 127)
        }, 
        ["prediction error"] = {
            name = "prediction error", 
            color = v584 and v7.elements.hitlogs_prediction_color:get() or color(255, 230, 127)
        }, 
        ["unregistered shot"] = {
            name = "unregistered", 
            color = v584 and v7.elements.hitlogs_unregistered_color:get() or color(125, 125, 125)
        }, 
        ["player death"] = {
            name = "player death", 
            color = v584 and v7.elements.hitlogs_player_death_color:get() or color(125, 125, 125)
        }, 
        death = {
            name = "death", 
            color = v584 and v7.elements.hitlogs_death_color:get() or color(125, 125, 125)
        }
    })[v583] or {
        name = "?", 
        color = color()
    };
end;
v3.build_log = function(v585, v586, v587)
    -- upvalues: v72 (ref), v59 (ref), v34 (ref), v15 (ref), v3 (ref), v7 (ref)
    local v588 = v585:gsub("{logo}", v72("aarneclub")):gsub("{prefix}", v59("\226\128\162", color(50, 50, 50)));
    for v589, v590 in pairs(v587) do
        v589 = ("{%s}"):format(v589);
        v588 = v588.gsub(v588, v589, v59(v590, v586, v587.alpha));
    end;
    return {
        push_render = function(_, v592, v593)
            -- upvalues: v34 (ref), v15 (ref), v3 (ref), v588 (ref), v7 (ref)
            local v594 = v592 == "Default" and vector(5, 5) or vector(v34.screen.x / 2, v34.screen.y / 1.5);
            local v595 = v592 == "Center" and "c" or nil;
            local v596 = v593 and v593 or color();
            v15(v3.style[v592], {
                realtime = globals.realtime, 
                default_pos = v594, 
                CustomRender = function(v597, v598, v599, v600)
                    -- upvalues: v588 (ref), v595 (ref), v592 (ref), v7 (ref), v596 (ref)
                    local v601 = render.measure_text(v600, nil, v588);
                    render.text(v600, vector(v598, v599), color(255, 255, 255, v597.alpha), v595, v588);
                    if v592 == "Center" and v7.elements.hitlogs_glow:get() then
                        render.shadow(vector(v598 - v601.x / 2, v599 + v601.y / 2 - 5), vector(v598 + v601.x / 2, v599 + v601.y / 2 - 5), color(v596.r, v596.g, v596.b, v597.alpha / 1.5), 30);
                    end;
                end
            }, v3.mt);
        end, 
        get_text = function(_)
            -- upvalues: v588 (ref)
            return v588;
        end
    };
end;
v3.is_enabled = function(v603, v604)
    -- upvalues: v7 (ref), v21 (ref)
    local v605 = v7.elements.hitlogs_style:get();
    local v606 = v21(v605, v603);
    if v604 and v606 then
        return v604();
    else
        return v606;
    end;
end;
v3.on_shot = function(v607)
    -- upvalues: v7 (ref), v3 (ref)
    if not v7.elements.hitlogs:get() then
        return;
    else
        local v608 = entity.get_local_player();
        if not v607.target or not v607.target:is_player() or not v608 then
            return;
        else
            local v609 = v608:get_player_weapon();
            if v609 ~= nil and v609:get_name() == "Zeus x27" and v607.state == nil then
                return;
            else
                v3.shots = v3.shots + 1;
                local _ = v3.shots .. (v3.count[v3.shots] or "th");
                local v611 = v607.target:get_name();
                local v612 = v3.get_reason(v607.state);
                local v613 = v3.hitgroup_names[v607.hitgroup] or "?";
                local v614 = v3.hitgroup_names[v607.wanted_hitgroup] or "?";
                local v615 = v3.hitgroup_names[v3.shot_data.hitgroup] or "?";
                local v616 = v607.damage and math.floor(v607.damage) or 0;
                local v617 = math.floor(v607.wanted_damage);
                local v618 = math.floor(v607.hitchance + 0.5);
                local _ = math.floor(v3.shot_data.hitchance + 0.5);
                local v620 = math.floor(v607.backtrack);
                local v621 = v607.target:is_alive() and ("%s remaining"):format(v607.target.m_iHealth) or "dead";
                v3.is_enabled("Console", function()
                    -- upvalues: v3 (ref), v612 (ref), v611 (ref), v613 (ref), v614 (ref), v616 (ref), v617 (ref), v621 (ref), v618 (ref), v620 (ref), v615 (ref)
                    local v622 = v3.build_log("{logo} {prefix} Hit {name}'s {hitgroup}({want_hitgroup}) for {damage}({want_damage}) ({state}) [hc={hitchance}% | bt={backtrack}]", v612.color, {
                        name = v611, 
                        hitgroup = v613, 
                        want_hitgroup = v614, 
                        damage = v616, 
                        want_damage = v617, 
                        state = v621, 
                        hitchance = v618, 
                        backtrack = v620
                    });
                    local v623 = v3.build_log("{logo} {prefix} Missed {name}'s {hitgroup}({want_damage}) due to {reason} [hc={hitchance}% | bt={backtrack}]", v612.color, {
                        name = v611, 
                        hitgroup = v615, 
                        reason = v612.name, 
                        hitchance = v618, 
                        backtrack = v620, 
                        want_damage = v617
                    });
                    local v624 = v612.name == "hit" and v622 or v623;
                    print_raw(v624:get_text());
                end);
                v3.is_enabled("Default", function()
                    -- upvalues: v3 (ref), v612 (ref), v611 (ref), v613 (ref), v614 (ref), v616 (ref), v617 (ref), v621 (ref), v618 (ref), v620 (ref), v615 (ref)
                    local v625 = v3.build_log("Hit {name}'s {hitgroup}({want_hitgroup}) for {damage}({want_damage}) ({state}) [hc={hitchance}% | bt={backtrack}]", v612.color, {
                        alpha = true, 
                        name = v611, 
                        hitgroup = v613, 
                        want_hitgroup = v614, 
                        damage = v616, 
                        want_damage = v617, 
                        state = v621, 
                        hitchance = v618, 
                        backtrack = v620
                    });
                    local v626 = v3.build_log("Missed {name}'s {hitgroup}({want_damage}) due to {reason} [hc={hitchance}% | bt={backtrack}]", v612.color, {
                        alpha = true, 
                        name = v611, 
                        hitgroup = v615, 
                        reason = v612.name, 
                        hitchance = v618, 
                        backtrack = v620, 
                        want_damage = v617
                    });
                    (v612.name == "hit" and v625 or v626):push_render("Default", v612.color);
                end);
                v3.is_enabled("Center", function()
                    -- upvalues: v607 (ref), v3 (ref), v612 (ref), v611 (ref), v616 (ref), v613 (ref), v614 (ref), v615 (ref)
                    local v627 = v607.target:is_alive() and ("%s hp left"):format(v607.target.m_iHealth) or "dead";
                    local v628 = v3.build_log("Hit {name}'s {hitgroup} for {damage} damage ({state})", v612.color, {
                        alpha = true, 
                        name = v611, 
                        damage = v616, 
                        hitgroup = v613, 
                        want_hitgroup = v614, 
                        state = v627
                    });
                    local v629 = v3.build_log("Missed {name}'s {hitgroup} due to {reason}", v612.color, {
                        alpha = true, 
                        name = v611, 
                        damage = v616, 
                        hitgroup = v615, 
                        reason = v612.name
                    });
                    (v612.name == "hit" and v628 or v629):push_render("Center", v612.color);
                end);
                return;
            end;
        end;
    end;
end;
events.aim_ack:set(v3.on_shot);
v3.weapon_to_verb = {
    hegrenade = "Naded", 
    inferno = "Burned", 
    knife = "Knifed", 
    taser = "Tased"
};
v3.on_hurt = function(v630)
    -- upvalues: v7 (ref), v3 (ref)
    if not v7.elements.hitlogs:get() then
        return;
    else
        local v631 = entity.get(v630.userid, true);
        local v632 = entity.get(v630.attacker, true);
        local v633 = entity.get_local_player();
        local v634 = v3.weapon_to_verb[v630.weapon];
        if v634 == nil or v633 == nil or v633 ~= v632 then
            return;
        else
            local v635 = v631:get_name();
            local v636 = tostring(v630.dmg_health);
            local v637 = v630.health > 0 and ("%s hp left"):format(v630.health) or "dead";
            local v638 = v3.get_reason("nil");
            local v639 = v3.build_log(v634 .. " {name} for {damage} damage ({state})", v638.color, {
                alpha = true, 
                name = v635, 
                damage = v636, 
                state = v637
            });
            v3.is_enabled("Center", function()
                -- upvalues: v639 (ref), v638 (ref)
                v639:push_render("Center", v638.color);
            end);
            v3.is_enabled("Default", function()
                -- upvalues: v639 (ref), v638 (ref)
                v639:push_render("Default", v638.color);
            end);
            local v640 = v630.health > 0 and ("%s remaining"):format(v630.health) or "dead";
            local v641 = v3.build_log("{logo} {prefix} " .. v634 .. " {name} for {damage} damage ({state})", v638.color, {
                name = v635, 
                damage = v636, 
                state = v640
            });
            v3.is_enabled("Console", function()
                -- upvalues: v641 (ref)
                print_raw(v641:get_text());
            end);
            return;
        end;
    end;
end;
events.player_hurt:set(v3.on_hurt);
v3.on_draw = function()
    -- upvalues: v7 (ref), v290 (ref), v3 (ref), v21 (ref), v75 (ref)
    if not v7.elements.hitlogs:get() then
        return;
    else
        local v642 = 6;
        local v643 = v7.elements.hitlogs_offset:get();
        local v644 = v7.elements.hitlogs_font:get() == "Bold" and v290.verdana_b or 1;
        local v645 = {};
        for v646, v647 in pairs(v3.style) do
            if v21(v7.elements.hitlogs_style:get(), v646) then
                v645[v646] = 0;
                for v648, v649 in ipairs(v647) do
                    local v650 = v649.realtime + v3.work_time > globals.realtime;
                    v649.alpha = v75.lerp(v649.alpha, v650 and 255 or 0);
                    local v651 = v649.default_pos.y + v645[v646] * v649.add_y;
                    v649:CustomRender(v649.default_pos.x, v651 + v643, v644);
                    v645[v646] = v645[v646] + v649.alpha / 255;
                    if v642 ~= 0 and v642 < #v647 then
                        table.remove(v647, 1);
                    end;
                    if not v650 and v649.alpha < 1 then
                        table.remove(v647, v648);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(v3.on_draw);
v569 = {};
v7.new("widgets_enable", v155.visual_other:switch("Widgets"));
v569.tab = v7.elements.widgets_enable:create();
v7.new("widgets", v569.tab:selectable("Widgets", {
    [1] = "Watermark", 
    [2] = "Keybinds", 
    [3] = "Slow Down"
}));
v7.new("widgets_glow", v569.tab:switch("Glow"));
v7.new("widgets_color", v569.tab:color_picker("Color"));
v569.render_box = function(v652, v653, v654, v655, v656)
    -- upvalues: v7 (ref)
    local v657 = v7.elements.widgets_color:get();
    v657.a = v657.a * v656;
    local l_v657_0 = v657;
    local v659 = color(v657.r, v657.g, v657.b, 50 * v656);
    local v660 = 3;
    local l_l_v657_0_0 = l_v657_0;
    local l_v659_0 = v659;
    local l_l_v657_0_1 = l_v657_0;
    local l_v659_1 = v659;
    local v665 = 1;
    render.rect(vector(v652 + v665, v653 + v665), vector(v652 + v665, v653 + v665) + vector(v654 - v665 - 1, v655 - v665), color(10, 10, 10, v657.a), v660);
    v657.a = 255 * v656;
    if v7.elements.widgets_glow:get() then
        render.shadow(vector(v652 + 1, v653), vector(v652 + v654 - 1, v653 + v655), v657, 30, nil, 5);
    end;
    render.gradient(vector(v652 + v660, v653), vector(v652 + v660, v653) + vector(v654 - v660 * 2, v665), l_l_v657_0_0, l_v659_0, l_l_v657_0_0, l_v659_0);
    render.circle_outline(vector(v652 + v660, v653 + v660), l_l_v657_0_0, v660, 180, 0.25, v665);
    render.circle_outline(vector(v652 + v654 - v660, v653 + v660), l_v659_0, v660, 270, 0.25, v665);
    render.gradient(vector(v652, v653 + v660), vector(v652, v653 + v660) + vector(v665, v655 - v660 * 2), l_l_v657_0_0, l_l_v657_0_0, l_l_v657_0_1, l_l_v657_0_1);
    render.gradient(vector(v652 + v654 - v665, v653 + v660), vector(v652 + v654 - v665, v653 + v660) + vector(v665, v655 - v660 * 2), l_v659_0, l_v659_0, l_v659_1, l_v659_1);
    render.circle_outline(vector(v652 + v660, v653 + v655 - v660), l_l_v657_0_1, v660, 90, 0.25, v665);
    render.circle_outline(vector(v652 + v654 - v660, v653 + v655 - v660), l_v659_1, v660, 0, 0.25, v665);
    render.gradient(vector(v652 + v660, v653 + v655 - v665), vector(v652 + v660, v653 + v655 - v665) + vector(v654 - v660 * 2, v665), l_l_v657_0_1, l_v659_1, l_l_v657_0_1, l_v659_1);
end;
v569.watermark_features = {};
v569.watermark_add_feature = function(v666, v667)
    -- upvalues: v569 (ref)
    table.insert(v569.watermark_features, {
        name = v666, 
        callback = v667
    });
end;
v569.watermark_get_active = function()
    -- upvalues: v569 (ref)
    local v668 = {};
    for _, v670 in ipairs(v569.watermark_features) do
        table.insert(v668, v670.callback());
    end;
    return v668;
end;
v569.watermark_add_feature("script_name", function()
    -- upvalues: v7 (ref), l_gradient_0 (ref), v0 (ref)
    local v671 = v7.elements.widgets_color:get();
    v671.a = 255;
    local v672 = l_gradient_0.text_animate("aarneclub" .. (v0 and " beta" or ""), -1, {
        [1] = v671 / 1.3, 
        [2] = v671
    });
    v672:animate();
    return v672:get_animated_text() .. "\a" .. color(222, 222, 222):to_hex();
end);
v569.watermark_add_feature("username", function()
    -- upvalues: v34 (ref)
    return v34.user;
end);
v569.watermark_add_feature("ping", function()
    -- upvalues: v74 (ref)
    return tostring(v74()) .. "ms";
end);
v569.watermark_add_feature("time", function()
    return common.get_date("%I:%M") .. " " .. string.lower(common.get_date("%p"));
end);
v569.watermark = function()
    -- upvalues: v7 (ref), v21 (ref), v569 (ref), v34 (ref)
    if not v7.elements.widgets_enable:get() or not v21(v7.elements.widgets:get(), "Watermark") then
        return;
    else
        local v673 = v569.watermark_get_active();
        local v674 = table.concat(v673, " \226\128\162 ");
        local v675 = render.measure_text(1, nil, v674);
        local l_x_0 = v34.screen.x;
        local v677 = 10;
        local v678 = v675.x + 10;
        local v679 = 18;
        l_x_0 = l_x_0 - v678 - 10;
        v569.render_box(l_x_0, v677, v678, v679, 1);
        render.text(1, vector(l_x_0 + 5, v677 + 2), color(), nil, v674);
        return;
    end;
end;
events.render:set(v569.watermark);
v570 = {
    data = {}, 
    get_active = function(v680)
        -- upvalues: v75 (ref)
        local v681 = ui.get_binds();
        local v682 = {};
        local v683 = false;
        for v684 = 1, #v681 do
            local v685 = v681[v684];
            local l_name_0 = v685.name;
            if v680.data[l_name_0] == nil then
                v680.data[l_name_0] = {
                    alpha = 0, 
                    name = l_name_0, 
                    value = v685.value, 
                    mode = v685.mode
                };
            else
                if v680.data[l_name_0].value ~= v685.value then
                    v680.data[l_name_0].value = v685.value;
                end;
                local l_active_0 = v685.active;
                v680.data[l_name_0].alpha = v75.lerp(v680.data[l_name_0].alpha, l_active_0 and 255 or 0);
                if v680.data[l_name_0].alpha > 1 then
                    local l_name_1 = v680.data[l_name_0].name;
                    local v689 = tostring(v680.data[l_name_0].value);
                    if #l_name_1 + #v689 > 28 then
                        if #l_name_1 >= #v689 then
                            l_name_1 = string.sub(l_name_1, 1, 14) .. "...";
                        else
                            v689 = string.sub(v689, 1, 14) .. "...";
                        end;
                    end;
                    table.insert(v682, 1, {
                        name = l_name_1, 
                        state = v689, 
                        mode = v680.data[l_name_0].mode, 
                        alpha = v680.data[l_name_0].alpha
                    });
                end;
                if l_active_0 then
                    v683 = true;
                end;
            end;
        end;
        return {
            active = v682, 
            is_any_active = v683
        };
    end
};
v569.keybinds_data = {
    width = 100, 
    modes = {
        [1] = "holding", 
        [2] = "toggled"
    }
};
v569.keybinds = v46.create_draggable(v34.screen.x / 2, 300, 0, 0, "widgets_keybinds", function(v690)
    -- upvalues: v7 (ref), v21 (ref), v569 (ref), v570 (ref), v75 (ref)
    if not v7.elements.widgets_enable:get() or not v21(v7.elements.widgets:get(), "Keybinds") then
        return;
    else
        local v691 = vector(v690.position_x, v690.position_y);
        v690.size_x = v569.keybinds_data.width;
        v690.size_y = 20;
        local v692 = v570:get_active();
        local v693 = v692.is_any_active or ui.get_alpha() > 0;
        local v694 = v75.new("widgets_keybinds_alpha", v693 and 1 or 0);
        if v694 < 0.05 then
            return;
        else
            local l_x_1 = v691.x;
            local l_y_0 = v691.y;
            local l_size_x_0 = v690.size_x;
            v569.render_box(l_x_1, l_y_0, l_size_x_0, 18, v694);
            render.text(1, vector(l_x_1 + l_size_x_0 / 2, l_y_0 + 8), color(222, 222, 222, 222 * v694), "c", "keybinds");
            local v698 = 0;
            local v699 = 0;
            for _, v701 in ipairs(v692.active) do
                if v701.state == "true" then
                    v701.state = v569.keybinds_data.modes[v701.mode];
                end;
                v701.state = ("[%s]"):format(v701.state);
                local v702 = render.measure_text(1, nil, v701.state);
                local v703 = render.measure_text(1, nil, v701.name);
                local v704 = l_y_0 + v699 * 15 + 20;
                render.text(1, vector(l_x_1 + 3, v704), color(222, 222, 222, v701.alpha * v694), nil, v701.name);
                render.text(1, vector(l_x_1 + l_size_x_0 - v702.x - 3, v704), color(222, 222, 222, v701.alpha * v694), nil, v701.state);
                local v705 = v703.x + v702.x + 13;
                if v705 > 100 and v698 < v705 then
                    v698 = v705;
                end;
                v699 = v699 + v701.alpha / 255;
            end;
            v569.keybinds_data.width = v75.new("keybinds_size", math.max(100, v698));
            return;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v569 (ref)
    v569.keybinds:update();
end);
v317.svg = "<svg width=\"110\" height=\"110\" viewBox=\"0 0 110 110\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M93.5381 70.75L60.6292 13.75C58.1273 9.41667 51.8727 9.41667 49.3708 13.75L16.4619 70.75C13.96 75.0833 17.0873 80.5 22.091 80.5H87.909C92.9127 80.5 96.04 75.0833 93.5381 70.75Z\" fill=\"white\" stroke=\"black\" stroke-width=\"2\"/></svg>";
v317.icon = render.load_image(v317.svg, vector(50, 50));
v317.line = function(v706, v707, v708, v709, v710, v711)
    local v712 = color(99, 150, 0);
    local v713 = color(135, 0, 0):lerp(v712, v710);
    v713.a = v711;
    render.rect(vector(v706, v707), vector(v706 + v708, v707 + v709), color(0, 0, 0, v711 / 3), 4);
    render.rect_outline(vector(v706, v707), vector(v706 + v708, v707 + v709), color(0, 0, 0, v711 / 4), 1, 4);
    render.rect(vector(v706, v707) + 1, vector(v706 + v708 * v710, v707 + v709) - 1, v713, 4);
    return v713;
end;
v317.BIG_FONT = render.load_font("verdana", 22, "ab");
v317.tahoma = render.load_font("tahoma", 11, "abd");
v317.on_draw = v46.create_draggable(math.floor(v34.screen.x / 2), 300, 0, 0, "slow_down", function(v714)
    -- upvalues: v7 (ref), v21 (ref), v317 (ref), v75 (ref), v33 (ref)
    local v715 = true;
    if not v7.elements.widgets_enable:get() or not v21(v7.elements.widgets:get(), "Slow Down") then
        v715 = false;
    end;
    local v716 = v317.get_velocity();
    if v716 == 1 and ui.get_alpha() <= 0 then
        v715 = false;
    end;
    local v717 = v75.new("slow_down_alpha", v715 and 255 or 0);
    if not v715 and v717 < 1 then
        return;
    else
        local v718 = vector(v714.position_x, v714.position_y);
        v714.size_x = 150;
        v714.size_y = 40;
        local v719 = v317.line(v718.x + 50, v718.y + 21, 100, 15, v716, v717);
        render.text(v317.tahoma, vector(v718.x + 52, v718.y + 5), color(200, 200, 200, v717), nil, ("Slow Down %s%%"):format(math.floor(100 * v716)));
        local v720 = v33() * v717;
        v719.a = v720;
        if v317.icon ~= nil then
            render.texture(v317.icon, vector(v718.x, v718.y), nil, v719);
            render.text(v317.BIG_FONT, vector(v718.x + 25, v718.y + 23), color(0, 0, 0, v720), "c", "!");
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v317 (ref)
    v317.on_draw:update();
end);
v571 = {};
v7.new("hitmarker", v155.visual_other:switch("Hitmarker"));
v571.tab = v7.elements.hitmarker:create();
v7.new("hitmarker_color", v571.tab:color_picker("Color", color()));
v7.new("hitmarker_style", v571.tab:selectable("Style ", {
    [1] = "Plus", 
    [2] = "Damage"
}));
v7.new("hitmarker_font", v571.tab:combo("Font", {
    [1] = "Default", 
    [2] = "Bold", 
    [3] = "Pixel"
}), function()
    -- upvalues: v21 (ref), v7 (ref)
    return v21(v7.elements.hitmarker_style:get(), "Damage");
end);
v571.mt = {
    move_y = 0, 
    alpha = 0, 
    realtime = globals.realtime, 
    hitpos = vector(), 
    CustomRender = function(v721, v722)
        -- upvalues: v290 (ref)
        local v723 = color(255, 255, 255, v721.alpha);
        render.text(v290.verdana_b, vector(hitpos.x, hitpos.y), v723, "c", v722);
    end
};
v571.data = {};
render.cross = function(v724, v725, v726, v727, v728)
    render.line(vector(v724 - v727, v725 - v727), vector(v724 - v727 - v726, v725 - v727 - v726), v728);
    render.line(vector(v724 + v727, v725 - v727), vector(v724 + v727 + v726, v725 - v727 - v726), v728);
    render.line(vector(v724 + v727, v725 + v727), vector(v724 + v727 + v726, v725 + v727 + v726), v728);
    render.line(vector(v724 - v727, v725 + v727), vector(v724 - v727 - v726, v725 + v727 + v726), v728);
end;
v571.on_hurt = function(v729)
    -- upvalues: v7 (ref), v290 (ref), v15 (ref), v571 (ref), v21 (ref)
    if not v7.elements.hitmarker:get() then
        return;
    else
        local v730 = entity.get_local_player();
        if not v730 then
            return;
        else
            local v731 = entity.get(v729.userid, true);
            if v730 ~= entity.get(v729.attacker, true) or v730 == v731 then
                return;
            else
                local v732 = v7.elements.hitmarker_font:get();
                local v733 = v732 == "Bold" and v290.verdana_b or v732 == "Pixel" and 2 or 1;
                local l_dmg_health_0 = v729.dmg_health;
                local v735 = v731:get_hitbox_position(v729.hitgroup);
                v15(v571.data, {
                    realtime = globals.realtime, 
                    hitpos = v735, 
                    CustomRender = function(v736)
                        -- upvalues: v7 (ref), v21 (ref), v733 (ref), l_dmg_health_0 (ref)
                        local v737 = v7.elements.hitmarker_color:get();
                        v737.a = v736.alpha;
                        local v738 = render.world_to_screen(v736.hitpos);
                        if not v738 then
                            return;
                        else
                            local l_x_2 = v738.x;
                            local l_y_1 = v738.y;
                            local v741 = v7.elements.hitmarker_style:get();
                            if v21(v741, "Plus") then
                                local v742 = v736.alpha / 255;
                                render.rect(vector(l_x_2 - 5 * v742, l_y_1), vector(l_x_2 + 5 * v742, l_y_1 + 1), v737);
                                render.rect(vector(l_x_2, l_y_1 - 5 * v742), vector(l_x_2 + 1, l_y_1 + 5 * v742), v737);
                            end;
                            if v21(v741, "Damage") then
                                render.text(v733, vector(l_x_2, l_y_1 - v736.move_y), v737, "c", tostring(l_dmg_health_0));
                            end;
                            return;
                        end;
                    end
                }, v571.mt);
                return;
            end;
        end;
    end;
end;
events.player_hurt:set(v571.on_hurt);
v571.on_draw = function()
    -- upvalues: v7 (ref), v571 (ref), v75 (ref)
    if not v7.elements.hitmarker:get() then
        return;
    else
        for v743, v744 in ipairs(v571.data) do
            local v745 = v744.realtime + 1.5 > globals.realtime;
            v744.alpha = v75.lerp(v744.alpha, v745 and 255 or 0);
            v744:CustomRender();
            v744.move_y = v75.lerp(v744.move_y, 100, 0.0025);
            if not v745 and v744.alpha < 1 then
                table.remove(v571.data, v743);
            end;
        end;
        return;
    end;
end;
events.render:set(v571.on_draw);
local v746 = {
    data = {}
};
v7.new("info_panel_enable", v155.visual_other:switch("Info Panel"));
v746.tab = v7.elements.info_panel_enable:create();
v7.new("info_panel_list", v746.tab:selectable("Features", {
    [1] = "Username", 
    [2] = "Hit/Miss", 
    [3] = "Country", 
    [4] = "Version", 
    [5] = "State", 
    [6] = "Desync"
}));
v7.new("info_panel_font", v746.tab:combo("Font", {
    [1] = "Default", 
    [2] = "Bold"
}), function()
    -- upvalues: v7 (ref)
    return #v7.elements.info_panel_list:get() > 0;
end);
v746.mt = {
    alpha = 0, 
    add_y = 12, 
    GetBool = function()
        return true;
    end, 
    CustomRender = function(_, _, _)

    end
};
v746.country_data = {};
v746.change_country_name = {
    ["Russian Federation"] = "Russia"
};
v746.update_country_data = function()
    -- upvalues: v746 (ref)
    network.get("https://api.myip.com", {}, function(v750)
        -- upvalues: v746 (ref)
        if v750 == nil then
            return;
        else
            local v751 = json.parse(v750);
            local v752 = v746.change_country_name[v751.country];
            v746.country_data.name = v752 and v752 or v751.country;
            local v753 = ("https://www.countryflagicons.com/FLAT/64/%s.png"):format(v751.cc);
            network.get(v753, {}, function(v754)
                -- upvalues: v746 (ref)
                local l_status_0, l_result_0 = pcall(render.load_image, v754, vector(10, 10));
                if l_status_0 and l_result_0 ~= nil then
                    v746.country_data.flag = l_result_0;
                end;
            end);
            return;
        end;
    end);
end;
v746.update_country_data();
v746.get_pos_by_screen = function(v757, v758)
    -- upvalues: v34 (ref)
    local v759 = 150;
    if v757 < v34.screen.x / 3 then
        return 0;
    elseif v34.screen.x / 1.5 < v757 then
        return v759 - v758;
    else
        return v759 / 2 - v758 / 2;
    end;
end;
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "Username");
    end, 
    CustomRender = function(v761, v762, v763, v764)
        -- upvalues: v34 (ref), v746 (ref), v75 (ref)
        local v765 = "aarneclub - " .. v34.user;
        local v766 = render.measure_text(v764, "d", v765);
        local v767 = color(255, 255, 255, v761.alpha);
        local v768 = v746.get_pos_by_screen(v762, v766.x);
        local v769 = v75.new("info_aarne", v768);
        render.text(v764, vector(v762 + v769, v763), v767, "d", v765);
    end
}, v746.mt);
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "Hit/Miss");
    end, 
    CustomRender = function(v771, v772, v773, v774)
        -- upvalues: v162 (ref), v746 (ref), v75 (ref)
        local v775 = v162.shots_data.hit + v162.shots_data.miss;
        local v776 = v162.shots_data.hit / v775;
        local v777 = 0;
        if v776 > 0 then
            v777 = math.floor(v776 * 100);
        end;
        local v778 = ("hit/miss: %s/%s(%s%%)"):format(v162.shots_data.hit, v162.shots_data.miss, v777);
        local v779 = render.measure_text(v774, "d", v778);
        local v780 = color(255, 255, 255, v771.alpha);
        local v781 = v746.get_pos_by_screen(v772, v779.x);
        local v782 = v75.new("info_hitrate", v781);
        render.text(v774, vector(v772 + v782, v773), v780, "d", v778);
    end
}, v746.mt);
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "Country");
    end, 
    CustomRender = function(v784, v785, v786, v787)
        -- upvalues: v746 (ref), v75 (ref)
        local v788 = "country: " .. (v746.country_data.name ~= nil and v746.country_data.name or "loading...");
        local v789 = render.measure_text(v787, "d", v788);
        local v790 = color(255, 255, 255, v784.alpha);
        local v791 = v746.get_pos_by_screen(v785, v789.x + 15);
        local v792 = v75.new("info_country", v791);
        render.text(v787, vector(v785 + v792, v786), v790, "d", v788);
        if v746.country_data.flag then
            render.texture(v746.country_data.flag, vector(v785 + v789.x + v792 + 2, v786 + 2), nil, v790);
        end;
    end
}, v746.mt);
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "Version");
    end, 
    CustomRender = function(v794, v795, v796, v797)
        -- upvalues: v1 (ref), v746 (ref), v75 (ref), v33 (ref)
        local v798 = "version: " .. v1;
        local v799 = render.measure_text(v797, "d", v798);
        local v800 = color(255, 255, 255, v794.alpha);
        local v801 = v746.get_pos_by_screen(v795, v799.x);
        local v802 = v75.new("info_version", v801);
        render.text(v797, vector(v795 + v802, v796), v800, "d", "version: ");
        local v803 = color(255, 255, 255, v794.alpha * v33());
        local v804 = render.measure_text(v797, "d", "version: ");
        render.text(v797, vector(v795 + v802 + v804.x, v796), v803, "d", v1);
    end
}, v746.mt);
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "State");
    end, 
    CustomRender = function(v806, v807, v808, v809)
        -- upvalues: v2 (ref), v746 (ref), v75 (ref)
        local v810 = v2.get_player_state();
        local v811 = "state: " .. (v810 and v810.indicator_name:lower() or "none");
        local v812 = render.measure_text(v809, "d", v811);
        local v813 = color(255, 255, 255, v806.alpha);
        local v814 = v746.get_pos_by_screen(v807, v812.x);
        local v815 = v75.new("info_state", v814);
        render.text(v809, vector(v807 + v815, v808), v813, "d", v811);
    end
}, v746.mt);
v15(v746.data, {
    GetBool = function(_)
        -- upvalues: v21 (ref), v7 (ref)
        return v21(v7.elements.info_panel_list:get(), "Desync");
    end, 
    CustomRender = function(v817, v818, v819, v820)
        -- upvalues: v746 (ref), v75 (ref), v2 (ref)
        local v821 = "desync: ";
        local v822 = render.measure_text(v820, "d", v821 .. "00\194\176");
        local v823 = color(255, 255, 255, v817.alpha);
        local v824 = v746.get_pos_by_screen(v818, v822.x);
        local v825 = v75.new("info_desync", v824);
        render.text(v820, vector(v818 + v825, v819), v823, "d", v821 .. tostring(math.abs(math.floor(v2.get_desync_delta()))) .. "\194\176");
    end
}, v746.mt);
v746.get_active = function()
    -- upvalues: v746 (ref), v75 (ref)
    local v826 = {};
    for _, v828 in ipairs(v746.data) do
        v828.alpha = v75.lerp(v828.alpha, v828:GetBool() and 255 or 0);
        if v828:GetBool() and v828.alpha > 0 then
            table.insert(v826, v828);
        end;
    end;
    return v826;
end;
v746.on_draw = v46.create_draggable(10, math.floor(v34.screen.y / 2), 0, 0, "info_panel", function(v829)
    -- upvalues: v7 (ref), v75 (ref), v746 (ref), v290 (ref)
    local v830 = false;
    local v831 = entity.get_local_player();
    local v832 = ui.get_alpha() > 0;
    v830 = v7.elements.info_panel_enable:get() and (v831 and v831:is_alive() or v832);
    local v833 = v75.new("info_panel_alpha", v830 and 255 or 0);
    if v830 == false and v833 < 1 then
        return;
    else
        local v834 = v746.get_active();
        local v835 = vector(v829.position_x, v829.position_y);
        local v836 = 0;
        v829.size_x = 150;
        v829.size_y = v75.new("info_panel_size_y", 13 * #v834);
        if #v834 > 0 and v832 and v830 then
            render.rect_outline(vector(v835.x, v835.y) - 5, vector(v835.x + v829.size_x, v835.y + v829.size_y) + 5, color(255, 255, 255, v833 / 2), 1, 5);
        end;
        local v837 = v7.elements.info_panel_font:get() == "Bold" and v290.verdana_b or 1;
        for _, v839 in ipairs(v834) do
            v839.alpha = v839.alpha * (v833 / 255);
            local v840 = v835.y + v836 * v839.add_y;
            v839:CustomRender(v835.x, v840, v837);
            v836 = v836 + v839.alpha / 255;
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v746 (ref)
    v746.on_draw:update();
end);
events.player_connect_full:set(function(v841)
    -- upvalues: v162 (ref)
    if entity.get_local_player() ~= entity.get(v841.userid, true) then
        return;
    else
        v162.shots_data = {
            hit = 0, 
            miss = 0
        };
        return;
    end;
end);
local v842 = {};
v7.new("grenade_rad_enable", v155.visual_other:switch("Grenade Radius"));
v842.tab = v7.elements.grenade_rad_enable:create();
v7.new("grenades", v842.tab:selectable("Grenades", {
    [1] = "Smoke", 
    [2] = "Molotov"
}));
v842.is_grenade = function(v843)
    -- upvalues: v21 (ref), v7 (ref)
    return v21(v7.elements.grenades:get(), v843);
end;
v7.new("molotov_enemy_color", v842.tab:color_picker("Enemy Molotov", color(255, 50, 50)), function()
    -- upvalues: v842 (ref)
    return v842.is_grenade("Molotov");
end);
v7.new("molotov_color", v842.tab:color_picker("Safe Molotov"), function()
    -- upvalues: v842 (ref)
    return v842.is_grenade("Molotov");
end);
v7.new("smoke_color", v842.tab:color_picker("Smoke"), function()
    -- upvalues: v842 (ref)
    return v842.is_grenade("Smoke");
end);
v842.on_render = function()
    -- upvalues: v7 (ref), v842 (ref), v75 (ref)
    if not v7.elements.grenade_rad_enable:get() then
        return;
    else
        local v844 = entity.get_local_player();
        if not v844 then
            return;
        else
            local v845 = 130;
            if v842.is_grenade("Smoke") then
                entity.get_entities("CSmokeGrenadeProjectile", false, function(v846)
                    -- upvalues: v844 (ref), v845 (ref), v75 (ref), v7 (ref)
                    local v847 = v844:get_origin():dist2d(v846:get_origin());
                    local v848 = v846.m_bDidSmokeEffect and v847 < v845;
                    local v849 = v75.new("smoke_alpha" .. v846:get_index(), v848 and 1 or 0);
                    local v850 = v75.new("smoke_rad" .. v846:get_index(), v846.m_bDidSmokeEffect and 125 or 0);
                    local v851 = v7.elements.smoke_color:get();
                    v851.a = v851.a * v849;
                    if v846.m_bDidSmokeEffect then
                        render.circle_3d_outline(v846:get_origin(), v851, v850, 0, 1, 1);
                    end;
                end);
            end;
            if v842.is_grenade("Molotov") then
                entity.get_entities("CInferno", false, function(v852)
                    -- upvalues: v844 (ref), v845 (ref), v75 (ref), v7 (ref)
                    local v853 = v844:get_origin():dist2d(v852:get_origin());
                    local v854 = v852.m_bFireIsBurning and v853 < v845;
                    local v855 = v75.new("moly_alpha" .. v852:get_index(), v854 and 1 or 0);
                    local l_m_hOwnerEntity_0 = v852.m_hOwnerEntity;
                    local v857 = l_m_hOwnerEntity_0 ~= nil and tonumber(cvar.mp_friendlyfire:int()) == 0 and l_m_hOwnerEntity_0 ~= v844 and not l_m_hOwnerEntity_0:is_enemy() and v7.elements.molotov_color:get() or v7.elements.molotov_enemy_color:get();
                    v857.a = v857.a * v855;
                    local v858 = 40;
                    local _ = 0;
                    local v860 = {};
                    local v861 = 0;
                    local v862 = nil;
                    local v863 = nil;
                    for v864 = 1, 64 do
                        if v852.m_bFireIsBurning[v864] then
                            table.insert(v860, vector(v852.m_fireXDelta[v864], v852.m_fireYDelta[v864], v852.m_fireZDelta[v864]));
                        end;
                    end;
                    for v865 = 1, #v860 do
                        for v866 = 1, #v860 do
                            local v867 = v860[v865]:dist2d(v860[v866]);
                            if v861 < v867 then
                                v861 = v867;
                                v862 = v860[v865];
                                v863 = v860[v866];
                            end;
                        end;
                    end;
                    if v862 ~= nil and v863 ~= nil then
                        local v868 = v862.lerp(v862, v863, 0.5);
                        local v869 = v852:get_origin() + v868;
                        local v870 = v75.new("moly_rad" .. v852:get_index(), v861 / 2 + v858);
                        if v852.m_bFireIsBurning then
                            render.circle_3d_outline(v869, v857, v870, 0, 1, 1);
                        end;
                    end;
                end);
            end;
            return;
        end;
    end;
end;
events.render:set(v842.on_render);
local v871 = {};
v7.new("console_enable", v155.visual_other:switch("Custom Console"));
v871.tab = v7.elements.console_enable:create();
v7.new("console_color", v871.tab:color_picker("Color"));
v871.engine_client = ffi.cast(ffi.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"));
v871.is_visible = v6.this_call(ffi.cast(ffi.typeof("bool(__thiscall*)(void*)"), v871.engine_client[0][11]), v871.engine_client);
v871.material_names = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
v871.materials = {};
v871.update_materials = function()
    -- upvalues: v871 (ref)
    v871.materials = {};
    for _, v873 in ipairs(v871.material_names) do
        local v874 = materials.get(v873);
        if v874 == nil then
            v874 = materials.get_materials(v873)[1];
        end;
        if v874 ~= nil and v874.is_valid(v874) then
            v871.materials[v873] = v874;
        end;
    end;
end;
v871.update_materials();
v871.last_color = nil;
v871.setup_color = function(v875)
    -- upvalues: v871 (ref)
    if not v871.is_visible() then
        v875 = color();
    end;
    if v871.last_color == v875 then
        return;
    else
        for _, v877 in pairs(v871.materials) do
            v877:alpha_modulate(v875.a / 255);
            v877:color_modulate(color(v875.r, v875.g, v875.b));
        end;
        v871.last_color = v875;
        return;
    end;
end;
v871.on_render = function()
    -- upvalues: v7 (ref), v871 (ref)
    if not v7.elements.console_enable:get() then
        return;
    else
        local v878 = v7.elements.console_color:get();
        v871.setup_color(v878);
        return;
    end;
end;
v871.on_unload = function()
    -- upvalues: v871 (ref)
    v871.setup_color(color());
end;
events.render:set(v871.on_render);
events.shutdown:set(v871.on_unload);
v7.elements.console_enable:set_callback(v871.on_unload);
events.mouse_input:set(function()
    return ui.get_alpha() < 1;
end);
ui.sidebar("aarneclub" .. (v0 and " beta" or ""));
local v879 = v3.build_log("{logo} {prefix} Welcome back, {name}!", color(), {
    name = v34.user, 
    version = v1
});
print_raw(v879:get_text());