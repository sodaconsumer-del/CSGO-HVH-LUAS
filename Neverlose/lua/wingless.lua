local l_ffi_0 = require("ffi");
l_ffi_0.cdef("        typedef void* HWND;\n        typedef int BOOL;\n\n        BOOL SetForegroundWindow(HWND hWnd);\n        BOOL BringWindowToTop(HWND hWnd);\n        BOOL FlashWindow(HWND hWnd, BOOL bInvert);\n\n        typedef struct {\n            char  pad_0000[20];\n            int m_nOrder;\n            int m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            float m_flWeightDeltaRate;\n            float m_flPlaybackRate;\n            float m_flCycle;\n            void *m_pOwner;\n            char  pad_0038[4];\n        } CAnimationLayer;\n    ");
local v1 = {};
local v2 = false;
local v6 = (function()
    -- upvalues: l_ffi_0 (ref)
    l_ffi_0.cdef("            typedef struct {\n                long long QuadPart;\n            } LARGE_INTEGER;\n            int QueryPerformanceCounter(LARGE_INTEGER* lpPerformanceCount);\n            int QueryPerformanceFrequency(LARGE_INTEGER* lpFrequency);\n            uint64_t GetTickCount64(void);\n        ");
    local v3 = l_ffi_0.new("LARGE_INTEGER");
    local v4 = l_ffi_0.new("LARGE_INTEGER");
    if l_ffi_0.C.QueryPerformanceFrequency(v3) == 1 then
        local v5 = tonumber(v3.QuadPart);
        return function()
            -- upvalues: l_ffi_0 (ref), v4 (ref), v5 (ref)
            if l_ffi_0.C.QueryPerformanceCounter(v4) == 1 then
                return tonumber(v4.QuadPart) / v5;
            else
                return l_ffi_0.C.GetTickCount64() / 1000;
            end;
        end;
    else
        return function()
            -- upvalues: l_ffi_0 (ref)
            return l_ffi_0.C.GetTickCount64() / 1000;
        end;
    end;
end)();
local v7 = {
    map = {}, 
    performance = {}, 
    setup = {}
};
do
    local l_v6_0, l_v7_0 = v6, v7;
    local v16 = {
        set = function(v10, v11)
            -- upvalues: l_v7_0 (ref)
            if not l_v7_0.setup[v10.name] then
                l_v7_0.setup[v10.name] = {};
            end;
            if not v10.handlers[v11] then
                table.insert(l_v7_0.setup[v10.name], v11);
                v10.handlers[v11] = v11;
                return true;
            else
                return false;
            end;
        end, 
        unset = function(v12, v13)
            if v12.handlers[v13] then
                v12.handlers[v13] = nil;
                return true;
            else
                return false;
            end;
        end, 
        call = function(v14, ...)
            local v15 = events[v14.name];
            if v15 then
                v15:call(...);
            end;
        end
    };
    local function v23(v17, v18)
        -- upvalues: l_v7_0 (ref), l_v6_0 (ref)
        if type(v17) == "string" then
            events[v17](function(...)
                -- upvalues: l_v7_0 (ref), v17 (ref), v18 (ref), l_v6_0 (ref)
                l_v7_0.performance[v17] = {};
                xpcall(function(...)
                    -- upvalues: v18 (ref), l_v6_0 (ref), l_v7_0 (ref), v17 (ref)
                    for _, v20 in pairs(v18) do
                        local v21 = l_v6_0();
                        v20(...);
                        l_v7_0.performance[v17][v20] = (l_v6_0() - v21) * 1000;
                    end;
                end, function(v22)
                    -- upvalues: v17 (ref)
                    print(string.format("[%s] Error: %s", v17, v22));
                end, ...);
            end);
        end;
    end;
    v1 = events;
    if v2 then
        v1 = setmetatable({}, {
            __index = function(_, v25)
                -- upvalues: l_v7_0 (ref), v16 (ref), v23 (ref)
                local v26 = l_v7_0.map[v25];
                if not v26 then
                    print(string.format("Registering new event: %s", v25));
                    v26 = setmetatable({
                        handlers = {}, 
                        name = v25
                    }, {
                        __index = v16, 
                        __call = function(v27, v28, v29)
                            if v29 == nil then
                                v29 = true;
                            end;
                            v27[v29 and "set" or "unset"](v27, v28);
                        end
                    });
                    l_v7_0.map[v25] = v26;
                    v23(v25, v26.handlers);
                end;
                return v26;
            end
        });
        local v30 = 3;
        local v31 = 16;
        do
            local l_v30_0, l_v31_0 = v30, v31;
            events.render(function()
                -- upvalues: l_v7_0 (ref), l_v30_0 (ref), l_v31_0 (ref)
                local v34 = render.screen_size();
                local v35 = vector(5, v34.y * 0.25);
                for v36, v37 in pairs(l_v7_0.performance) do
                    render.text(l_v30_0, v35, color(255, 255, 255), nil, v36);
                    v35.y = v35.y + l_v31_0;
                    local l_ipairs_0 = ipairs;
                    local v39 = l_v7_0.setup[v36] or {};
                    for v40, v41 in l_ipairs_0(v39) do
                        local v42 = v37[v41] or 0;
                        local v43 = string.format("  [%d]: %.3fms", v40, v42);
                        local v44 = v42 > 1 and color(255, 100, 100) or color(255, 255, 255);
                        render.text(l_v30_0, v35, v44, nil, v43);
                        v35.y = v35.y + l_v31_0;
                    end;
                    v35.y = v35.y + 8;
                end;
            end);
        end;
    end;
end;
v6 = nil;
v7 = {
    [1] = {
        path = "nl/wingless/Inter-SemiBold.ttf", 
        link = "https://github.com/SQWAT0/neverlose/raw/main/Inter-SemiBold.ttf"
    }, 
    [2] = {
        path = "csgo/materials/panorama/images/icons/xp/wingless.png", 
        link = "https://raw.githubusercontent.com/SQWAT0/neverlose/main/wings_small.png"
    }
};
files.create_folder("nl/wingless");
for _, v46 in ipairs(v7) do
    if not files.read(v46.path) then
        local v47 = network.get(v46.link);
        files.write(v46.path, v47, true);
    end;
end;
v7 = require("neverlose/pui");
local l_gradient_0 = require("neverlose/gradient");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local v51 = render.screen_size();
local v52 = {
    list = {}
};
v52.__index = v52;
local l_curtime_0 = globals.curtime;
v52.new = function(v54, v55)
    -- upvalues: v52 (ref)
    if v52.list[v54] == nil then
        v52.list[v54] = v55 or 0;
    end;
    return setmetatable({
        name = v54
    }, v52);
end;
do
    local l_l_curtime_0_0 = l_curtime_0;
    v52.update = function(v57, v58, v59)
        -- upvalues: v52 (ref), l_l_curtime_0_0 (ref)
        if not v59 then
            v59 = 0.095;
        end;
        v59 = globals.frametime * (v59 * 175);
        if type(v58) == "boolean" then
            v58 = v58 and 1 or 0;
        end;
        local v60 = v52.list[v57.name];
        local v61 = v60 + (v58 - v60) * v59;
        if globals.curtime - l_l_curtime_0_0 < 0.5 and globals.frametime >= 0.1 then
            v61 = v60;
        end;
        v52.list[v57.name] = v61;
        return v61;
    end;
    v52.get = function(v62)
        -- upvalues: v52 (ref)
        return v52.list[v62.name];
    end;
    v52.get_name = function(v63)
        return v63.name;
    end;
end;
l_curtime_0 = nil;
math.round = function(v64)
    return v64 and math.floor(v64 + 0.5) or 0;
end;
math.lerp = function(v65, v66, v67)
    return v65 + (v66 - v65) * v67;
end;
local v68 = {};
local v69 = 0;
do
    local l_v69_0 = v69;
    local function v71()
        -- upvalues: l_v69_0 (ref), v71 (ref)
        l_v69_0 = math.round(1 / globals.frametime);
        utils.execute_after(0.5, v71);
    end;
    v71();
    v68.get_fps = function(_)
        -- upvalues: l_v69_0 (ref)
        return l_v69_0;
    end;
    v68.open_url = function(_, v74)
        panorama.SteamOverlayAPI.OpenExternalBrowserURL(v74);
    end;
    v68.format_time = function(_, v76)
        local v77 = v76 / 3600;
        return string.format("%.2f", v77);
    end;
end;
v69 = {
    list = {}, 
    add = function(v78, v79, v80, v81, v82)
        -- upvalues: v7 (ref), v52 (ref)
        if not v80 then
            v80 = "";
        end;
        v79 = v7.string(v79);
        local v83 = {
            time = 5, 
            text = v81 and v7.string(v81 .. "\r " .. v79) or v79, 
            shine = v82, 
            alpha = v52.new(string.format("notifications / %s", globals.absoluteframetime)), 
            real_time = globals.realtime
        };
        if v80.find(v80, "s") then
            table.insert(v78.list, 1, v83);
        end;
        if v80.find(v80, "e") then
            print_dev(v7.string(v79));
        end;
        local v84 = string.format(v7.string("[\a[accent]wingless\r] \194\187 %s"), v79);
        if v80.find(v80, "c") then
            print_raw(v84);
        end;
    end, 
    on_render = function(v85)
        -- upvalues: v51 (ref)
        local l_realtime_0 = globals.realtime;
        local v87 = 10;
        local v88 = 0;
        for v89, v90 in pairs(v85.list) do
            local v91 = v51 / vector(2, 1.8) + vector(0, 150 + 16 * v88);
            local l_text_0 = v90.text;
            local l_real_time_0 = v90.real_time;
            local l_time_0 = v90.time;
            local l_shine_0 = v90.shine;
            local v96 = l_realtime_0 < l_real_time_0 + l_time_0;
            local v97 = v89 < v87;
            v90.alpha:update(v96 and v97 and 100 or 0, 0.05);
            local v98 = math.ceil(v90.alpha:get()) / 100;
            local v99 = render.measure_text(1, "c", v90.text);
            local v100 = v91 - v99 * 0.5;
            if v98 > 0.1 then
                if l_shine_0 then
                    render.shadow(v100 + vector(0, v99.y / 2), v100 + vector(v99.x, v99.y / 2), l_shine_0:alpha_modulate(255 * v98));
                end;
                render.text(1, v91, color(255, 255 * v98), "c", l_text_0);
                v88 = v88 + v98;
            end;
        end;
        for v101, v102 in pairs(v85.list) do
            local v103 = math.ceil(v102.alpha:get()) / 100;
            if v102.real_time + v102.time < l_realtime_0 and v103 < 0.1 then
                table.remove(v85.list, v101);
            end;
        end;
    end
};
v1.render:set(function()
    -- upvalues: v69 (ref)
    v69:on_render();
end);
local v104 = {};
local v105 = db["wingless-configs"] or {};
v104.export = function(_, ...)
    -- upvalues: v7 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    local v107 = v7.save(...);
    local v108 = l_base64_0.encode(json.stringify(v107));
    l_clipboard_0.set(v108);
end;
v104.import = function(_, v110, ...)
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v7 (ref)
    local v111 = v110 or l_clipboard_0.get();
    local v112 = json.parse(l_base64_0.decode(v111));
    v7.load(v112, ...);
end;
do
    local l_v105_0 = v105;
    v104.get_configs = function(_)
        -- upvalues: l_v105_0 (ref)
        local v115 = {};
        for v116, v117 in ipairs(l_v105_0) do
            v115[v116] = v117.name;
        end;
        return v115;
    end;
    v104.get_config_by_id = function(_, v119)
        -- upvalues: l_v105_0 (ref)
        return l_v105_0[v119];
    end;
    v104.delete = function(_, v121)
        -- upvalues: l_v105_0 (ref)
        table.remove(l_v105_0, v121);
    end;
    v104.create = function(_, v123, v124)
        -- upvalues: l_v105_0 (ref)
        l_v105_0[#l_v105_0 + 1] = {
            name = v123, 
            code = v124
        };
    end;
    v104.save = function(v125, v126, v127)
        v125:get_config_by_id(v126).code = v127;
    end;
    v1.shutdown:set(function()
        -- upvalues: l_v105_0 (ref)
        db["wingless-configs"] = l_v105_0;
    end);
end;
v105 = {};
local v128 = render.load_font("c:/windows/fonts/seguisb.ttf", 15, "ad");
local v129 = false;
local v130 = {};
local v131 = nil;
local v140 = (function(v132, v133, v134, v135)
    -- upvalues: l_ffi_0 (ref)
    local v136 = utils.create_interface(v132, v133);
    assert(v136, "invalid interface");
    local v137 = l_ffi_0.typeof(v135);
    local v138 = l_ffi_0.cast("void***", v136);
    local v139 = l_ffi_0.cast(v137, v138[0][v134]);
    return function(...)
        -- upvalues: v139 (ref), v138 (ref)
        return v139(v138, ...);
    end;
end)("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void *thisptr, int &x, int &y)");
do
    local l_v128_0, l_v129_0, l_v130_0, l_v131_0, l_v140_0 = v128, v129, v130, v131, v140;
    local function v148()
        -- upvalues: l_ffi_0 (ref), l_v140_0 (ref)
        local v146 = l_ffi_0.new("int[1]");
        local v147 = l_ffi_0.new("int[1]");
        l_v140_0(v146, v147);
        return vector(v146[0], v147[0]);
    end;
    local function v152(v149, v150, v151)
        return v151.x >= v149.x and v151.x <= v150.x and v151.y >= v149.y and v151.y <= v150.y;
    end;
    v105.new = function(_, v154, v155, v156, v157, v158, v159, v160)
        -- upvalues: l_v130_0 (ref), v52 (ref), v148 (ref), v7 (ref), l_v129_0 (ref), l_v131_0 (ref), v152 (ref), v51 (ref), l_v128_0 (ref)
        if l_v130_0[v154] == nil then
            l_v130_0[v154] = {
                x = 0, 
                y = 0, 
                dragging = false, 
                animate = v52.new(v154 .. " / animate"), 
                animate_text = v52.new(v154 .. " / animate_text")
            };
        end;
        local v161 = common.is_button_down(1);
        local v162 = v148();
        local v163 = v7.get_alpha() == 1;
        local v164 = l_v130_0[v154];
        local l_v155_0 = v155;
        local v166 = v156:get();
        if v155 and type(v155) ~= "number" then
            l_v155_0 = v155:get();
        end;
        local v167 = vector(l_v155_0, v166);
        local v168 = vector(l_v155_0 + v157, v166 + v158);
        if not l_v129_0 then
            if v163 and (l_v131_0 == nil or l_v131_0 == v154) and v152(v167, v168, v162) then
                l_v131_0 = v154;
                if not v164.dragging then
                    v164.animate:update(0.4);
                    v164.animate_text:update(1);
                end;
                if v161 and not v164.dragging then
                    local v169 = l_v155_0 - v162.x;
                    local v170 = v166 - v162.y;
                    v164.x = v169;
                    v164.y = v170;
                    v164.dragging = true;
                end;
            end;
            if not v161 or not v163 then
                v164.dragging = false;
                l_v131_0 = nil;
            end;
            if not v164.dragging and not v152(v167, v168, v162) then
                v164.animate:update(0);
                v164.animate_text:update(0);
            end;
            if v164.dragging and v163 then
                local v171 = v162.x + v164.x;
                local v172 = v162.y + v164.y;
                v164.animate:update(0.8);
                v164.animate_text:update(0);
                if not v160 or not v155 then
                    v155:set(math.max(0, math.min(v171, v51.x - v157)));
                end;
                v156:set(math.max(0, math.min(v172, v51.y - v158 - (v159 and v159 or 0))));
            end;
            render.rect(v167 - 1, v168 + 1, color(255, 125 * v164.animate:get()), 6);
            if v160 then
                render.text(l_v128_0, vector(v167.x + v157 * 0.5, v167.y - 15), color(255, 255 * v164.animate_text:get()), "c", "You can only drag vertically");
            end;
        end;
    end;
    v105.get_target = function(_)
        -- upvalues: l_v131_0 (ref)
        return l_v131_0;
    end;
    v105.set_target = function(_, v175)
        -- upvalues: l_v131_0 (ref)
        l_v131_0 = v175;
    end;
    v105.block = function(_)
        -- upvalues: l_v129_0 (ref)
        l_v129_0 = true;
    end;
    v105.allow = function(_)
        -- upvalues: l_v129_0 (ref)
        l_v129_0 = false;
    end;
    v1.render:set(function()
        -- upvalues: v52 (ref), v105 (ref), v51 (ref)
        local v178 = v52.new("draggable system / alpha"):update(v105:get_target() ~= nil and 120 or 0);
        v178 = math.floor(v178 + 0.5);
        if v105:get_target() ~= "" then
            render.rect(vector(0, 0), v51, color(0, v178));
        end;
    end);
end;
v128 = {
    rage = {
        hide_shots = v7.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        double_tap = v7.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        quick_switch = v7.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"), 
        lag_options = v7.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        dormant_aimbot = v7.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        safe_point = v7.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        body_aim = v7.find("Aimbot", "Ragebot", "Safety", "Body Aim")
    }, 
    anti_aim = {
        fake_duck = v7.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        avoid_backstab = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        leg_movement = v7.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
    }, 
    visuals = {
        scope_overlay = v7.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
    }, 
    misc = {
        clantag = v7.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
        fake_latency = v7.find("Miscellaneous", "Main", "Other", "Fake Latency")
    }, 
    fake_lag = {
        limit = v7.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        variability = v7.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
    }
};
v129 = {
    built = "alpha", 
    user = {
        name = common.get_username()
    }
};
v7.sidebar("wingless", "\f<code-fork>");
v7.colors.miss = color(255, 177, 177);
v7.colors.hit = color(177, 255, 177);
v7.colors.accent = color("#ABCDFFFF");
v130 = {};
v131 = v7.create("\v\f<house>", {
    [1] = {
        [1] = "logo", 
        [2] = "##logo"
    }, 
    [2] = {
        [1] = "about", 
        [2] = "##about"
    }, 
    [3] = {
        [1] = "configs", 
        [2] = "##configs"
    }, 
    [4] = {
        [1] = "tab", 
        [2] = "##home_tab", 
        [3] = 1
    }, 
    [5] = {
        [1] = "products", 
        [2] = "recommendations"
    }, 
    [6] = {
        [1] = "sidebar", 
        [2] = "##sidebar", 
        [3] = 1
    }
});
local v179 = v7.create("\v\f<bars>", {
    [1] = {
        [1] = "selection", 
        [2] = "##selection"
    }, 
    [2] = {
        [1] = "rage", 
        [2] = "ragebot"
    }, 
    [3] = {
        [1] = "movement", 
        [2] = "movement features"
    }, 
    [4] = {
        [1] = "misc", 
        [2] = "miscellaneous"
    }, 
    [5] = {
        [1] = "general", 
        [2] = "##general", 
        [3] = 1
    }, 
    [6] = {
        [1] = "indicators", 
        [2] = "indicators", 
        [3] = 2
    }, 
    [7] = {
        [1] = "widgets", 
        [2] = "widgets", 
        [3] = 2
    }, 
    [8] = {
        [1] = "in_game", 
        [2] = "in game", 
        [3] = 1
    }
});
v140 = db["WINGLESS::PLAYED_SECONDS"] or 0;
do
    local l_v131_1, l_v140_1 = v131, v140;
    network.get("https://raw.githubusercontent.com/SQWAT0/neverlose/main/wings.png", nil, function(v182)
        -- upvalues: v130 (ref), l_v131_1 (ref), v7 (ref)
        local v183 = render.load_image(v182, vector(256, 256));
        v130.logo = l_v131_1.logo:texture(v183, vector(270, 256), v7.accent);
    end);
    v130.home_selector = l_v131_1.tab:list("", {
        [1] = "\v\f<user>    \rAbout", 
        [2] = "\v\f<floppy-disk>    \rConfigs"
    });
    v130.about = {
        username = l_v131_1.about:label(("\v\f<user>   \r%s"):format(v129.user.name)), 
        version = l_v131_1.about:label("\v\f<code-commit> \r1.5 \v" .. v129.built), 
        hours_played = l_v131_1.about:label("\v\f<clock>  \rHours Played"), 
        hours_played_time = l_v131_1.about:button("\v" .. v68:format_time(l_v140_1), nil, true), 
        configs = l_v131_1.products:label("Configs"), 
        kutsuki = l_v131_1.products:button("\240\159\170\189\vKutsuki\r's Config", function()
            -- upvalues: v68 (ref)
            v68:open_url("https://neverlose.cc/market/item?id=avtjUq");
        end, true), 
        socials = l_v131_1.products:label("Socials"), 
        discord = l_v131_1.products:button("\v\f<discord> \rJoin Us!", function()
            -- upvalues: v68 (ref)
            v68:open_url("https://discord.gg/dhPa6zjkXh");
        end, true), 
        youtube = l_v131_1.products:button("\v\f<youtube> \rYou\a[red]Tube", function()
            -- upvalues: v68 (ref)
            v68:open_url("https://www.youtube.com/@KutSuki");
        end, true), 
        sidebar = l_v131_1.sidebar:combo("\v\f<bars>   \rSidebar Style", {
            [1] = "Default", 
            [2] = "Stylish"
        }, function(v184)
            return {
                branch = v184:switch("Branch")
            };
        end)
    };
    local v185 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v130.home_selector
    };
    l_v131_1.about:depend(v185);
    l_v131_1.products:depend(v185);
    l_v131_1.sidebar:depend(v185);
    v1.render:set(function()
        -- upvalues: l_v140_1 (ref), v7 (ref), v130 (ref), v68 (ref)
        l_v140_1 = l_v140_1 + globals.frametime;
        if v7.get_alpha() > 0 then
            v130.about.hours_played_time:name("\v" .. v68:format_time(l_v140_1));
        end;
    end);
    v1.shutdown:set(function()
        -- upvalues: l_v140_1 (ref)
        db["WINGLESS::PLAYED_SECONDS"] = l_v140_1;
    end);
    v185 = v104:get_configs();
    local v186 = 1;
    local v187 = "";
    v130.configs = {
        list = l_v131_1.configs:list("", #v185 ~= 0 and v185 or {
            [1] = "No configs here! Create one."
        }), 
        load = l_v131_1.configs:button("\v\f<spinner>  \rLoad", function()
            -- upvalues: v185 (ref), v104 (ref), v186 (ref), l_base64_0 (ref), v7 (ref), v69 (ref)
            if #v185 == 0 then
                return;
            else
                local v188 = v104:get_config_by_id(v186);
                local v189 = json.parse(l_base64_0.decode(v188.code));
                v7.load(v189);
                v69:add(string.format("Config \a[accent]%s \rloaded!", v188.name), "sce");
                return;
            end;
        end, true, "Loading a choosen config."), 
        save = l_v131_1.configs:button("\v\f<floppy-disk>  \rSave", function()
            -- upvalues: v7 (ref), l_base64_0 (ref), v104 (ref), v186 (ref), v187 (ref), v69 (ref)
            local v190 = v7.save();
            local v191 = l_base64_0.encode(json.stringify(v190));
            local v192 = v104:get_config_by_id(v186) and v104:get_config_by_id(v186).name or "No configs here! Create one.";
            if v187:gsub(" ", "") ~= "" and v187 ~= v192 then
                v104:create(v187, v191);
                v69:add(string.format("Config \a[accent]%s \rcreated!", v187), "sce");
            else
                v104:save(v186, v191);
                v69:add(string.format("Config \a[accent]%s \rsaved!", v104:get_config_by_id(v186).name), "sce");
            end;
        end, true, "Saves / Overwrites current config."), 
        remove = l_v131_1.configs:button("\v\f<trash>  \rRemove", function()
            -- upvalues: v185 (ref), v69 (ref), v104 (ref), v186 (ref)
            if #v185 == 0 then
                return;
            else
                v69:add(string.format("Config \a[accent]%s \rdeleted!", v104:get_config_by_id(v186).name), "sce");
                v104:delete(v186);
                return;
            end;
        end, true, "Removes a config."), 
        export = l_v131_1.configs:button("\v\f<file-export>  \rExport", function()
            -- upvalues: v104 (ref), v69 (ref)
            v104:export();
            v69:add("Current settings exported!", "sce");
        end, true, "Exports a config to clipboard."), 
        import = l_v131_1.configs:button("\v\f<file-import>  \rImport", function()
            -- upvalues: v104 (ref), v69 (ref)
            v104:import();
            v69:add("Settings imported!", "sce");
        end, true, "Loads a config from clipboard."), 
        default = l_v131_1.configs:button("\v\f<file-circle-check>  \rDefault", function()
            -- upvalues: v69 (ref), v104 (ref)
            local v193 = "eyJhYm91dCI6eyJzaWRlYmFyIjoiU3R5bGlzaCIsIn5zaWRlYmFyIjp7ImJyYW5jaCI6dHJ1ZX19LCJhbnRpX2FpbWJvdCI6eyJhdm9pZF9iYWNrc3RhYiI6dHJ1ZSwiYnJlYWtfbGMiOlsiUmVsb2FkaW5nIiwiU2xvd3dhbGtpbmciLCJDcm91Y2hpbmciLCJTbmVha2luZyIsIkluIEFpciIsIkluIEFpciAmIENyb3VjaGluZyIsIn4iXSwiZW5hYmxlIjp0cnVlLCJoaWRlX2hlYWQiOnRydWUsInNlbGVjdG9yIjoxLjAsInNldHRpbmdzIjp7IkNyb3VjaGluZyI6eyJkZWZlbnNpdmVfc25hcCI6eyJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IlJhbmRvbSIsInlhdyI6IlNpZGV3YXlzIiwifnBpdGNoIjp7ImN1c3RvbSI6LTQ1LjAsInNtb290aCI6MC4wfSwifnlhdyI6eyJzcGVlZCI6My4wfX0sImRlc3luYyI6IkppdHRlciIsImVuYWJsZSI6dHJ1ZSwieWF3Ijp7Im1vZGUiOiJMZWZ0L1JpZ2h0IiwibW9kaWZpZXIiOiJDZW50ZXIiLCJ+bW9kZSI6eyJsZWZ0X29mZnNldCI6LTI4LjAsIm9mZnNldCI6NS4wLCJyaWdodF9vZmZzZXQiOjQzLjB9LCJ+bW9kaWZpZXIiOnsiZGVncmVlIjowLjAsImRlbGF5IjozLjAsIndheXMiOjMuMH19LCJ+ZGVzeW5jIjp7ImxlZnRfbGltaXQiOjYwLjAsInJpZ2h0X2xpbWl0Ijo2MC4wfX0sIkRlZmF1bHQiOnsiZGVmZW5zaXZlX3NuYXAiOnsiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEZWZhdWx0IiwieWF3IjoiRGVmYXVsdCIsIn5waXRjaCI6eyJjdXN0b20iOjAuMCwic21vb3RoIjowLjB9LCJ+eWF3Ijp7InNwZWVkIjozLjB9fSwiZGVzeW5jIjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsInlhdyI6eyJtb2RlIjoiU3RhdGljIiwibW9kaWZpZXIiOiJOb25lIiwifm1vZGUiOnsibGVmdF9vZmZzZXQiOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MC4wfSwifm1vZGlmaWVyIjp7ImRlZ3JlZSI6MC4wLCJkZWxheSI6Mi4wLCJ3YXlzIjozLjB9fSwifmRlc3luYyI6eyJsZWZ0X2xpbWl0IjowLjAsInJpZ2h0X2xpbWl0IjowLjB9fSwiRmFrZWxhZ3MiOnsiZGVmZW5zaXZlX3NuYXAiOnsiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEZWZhdWx0IiwieWF3IjoiRGVmYXVsdCIsIn5waXRjaCI6eyJjdXN0b20iOjAuMCwic21vb3RoIjowLjB9LCJ+eWF3Ijp7InNwZWVkIjozLjB9fSwiZGVzeW5jIjoiSml0dGVyIiwiZW5hYmxlIjp0cnVlLCJ5YXciOnsibW9kZSI6IlN0YXRpYyIsIm1vZGlmaWVyIjoiTm9uZSIsIn5tb2RlIjp7ImxlZnRfb2Zmc2V0IjowLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjAuMH0sIn5tb2RpZmllciI6eyJkZWdyZWUiOjAuMCwiZGVsYXkiOjIuMCwid2F5cyI6My4wfX0sIn5kZXN5bmMiOnsibGVmdF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXQiOjYwLjB9fSwiSW4gQWlyIjp7ImRlZmVuc2l2ZV9zbmFwIjp7ImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRGVmYXVsdCIsInlhdyI6IkJhY2t3YXJkIiwifnBpdGNoIjp7ImN1c3RvbSI6MC4wLCJzbW9vdGgiOjAuMH0sIn55YXciOnsic3BlZWQiOjMuMH19LCJkZXN5bmMiOiJKaXR0ZXIiLCJlbmFibGUiOnRydWUsInlhdyI6eyJtb2RlIjoiTGVmdC9SaWdodCIsIm1vZGlmaWVyIjoiU2tpdHRlciIsIn5tb2RlIjp7ImxlZnRfb2Zmc2V0IjotMTUuMCwib2Zmc2V0IjowLjAsInJpZ2h0X29mZnNldCI6MjMuMH0sIn5tb2RpZmllciI6eyJkZWdyZWUiOi01LjAsImRlbGF5Ijo1LjAsIndheXMiOjMuMH19LCJ+ZGVzeW5jIjp7ImxlZnRfbGltaXQiOjYwLjAsInJpZ2h0X2xpbWl0Ijo2MC4wfX0sIkluIEFpciAmIENyb3VjaGluZyI6eyJkZWZlbnNpdmVfc25hcCI6eyJlbmFibGUiOmZhbHNlLCJwaXRjaCI6IlJhbmRvbSIsInlhdyI6IlNpZGV3YXlzIiwifnBpdGNoIjp7ImN1c3RvbSI6LTE1LjAsInNtb290aCI6MC4wfSwifnlhdyI6eyJzcGVlZCI6NS4wfX0sImRlc3luYyI6IkppdHRlciIsImVuYWJsZSI6dHJ1ZSwieWF3Ijp7Im1vZGUiOiJMZWZ0L1JpZ2h0IiwibW9kaWZpZXIiOiJDZW50ZXIiLCJ+bW9kZSI6eyJsZWZ0X29mZnNldCI6LTEwLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjMxLjB9LCJ+bW9kaWZpZXIiOnsiZGVncmVlIjotMTAuMCwiZGVsYXkiOjIuMCwid2F5cyI6My4wfX0sIn5kZXN5bmMiOnsibGVmdF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXQiOjYwLjB9fSwiTW92aW5nIjp7ImRlZmVuc2l2ZV9zbmFwIjp7ImVuYWJsZSI6ZmFsc2UsInBpdGNoIjoiRGVmYXVsdCIsInlhdyI6IkJhY2t3YXJkIiwifnBpdGNoIjp7ImN1c3RvbSI6MC4wLCJzbW9vdGgiOjAuMH0sIn55YXciOnsic3BlZWQiOjMuMH19LCJkZXN5bmMiOiJKaXR0ZXIiLCJlbmFibGUiOnRydWUsInlhdyI6eyJtb2RlIjoiU3RhdGljIiwibW9kaWZpZXIiOiJDZW50ZXIiLCJ+bW9kZSI6eyJsZWZ0X29mZnNldCI6LTI0LjAsIm9mZnNldCI6Ni4wLCJyaWdodF9vZmZzZXQiOjM5LjB9LCJ+bW9kaWZpZXIiOnsiZGVncmVlIjotNTguMCwiZGVsYXkiOjIuMCwid2F5cyI6My4wfX0sIn5kZXN5bmMiOnsibGVmdF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXQiOjYwLjB9fSwiU2xvd3dhbGtpbmciOnsiZGVmZW5zaXZlX3NuYXAiOnsiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJSYW5kb20iLCJ5YXciOiJSYW5kb20iLCJ+cGl0Y2giOnsiY3VzdG9tIjotNDYuMCwic21vb3RoIjowLjB9LCJ+eWF3Ijp7InNwZWVkIjozLjB9fSwiZGVzeW5jIjoiSml0dGVyIiwiZW5hYmxlIjp0cnVlLCJ5YXciOnsibW9kZSI6IkxlZnQvUmlnaHQiLCJtb2RpZmllciI6IkNlbnRlciIsIn5tb2RlIjp7ImxlZnRfb2Zmc2V0IjotMjMuMCwib2Zmc2V0Ijo1LjAsInJpZ2h0X29mZnNldCI6NDcuMH0sIn5tb2RpZmllciI6eyJkZWdyZWUiOi01LjAsImRlbGF5IjoyLjAsIndheXMiOjMuMH19LCJ+ZGVzeW5jIjp7ImxlZnRfbGltaXQiOjYwLjAsInJpZ2h0X2xpbWl0Ijo2MC4wfX0sIlNuZWFraW5nIjp7ImRlZmVuc2l2ZV9zbmFwIjp7ImVuYWJsZSI6dHJ1ZSwicGl0Y2giOiJEZWZhdWx0IiwieWF3IjoiQmFja3dhcmQiLCJ+cGl0Y2giOnsiY3VzdG9tIjowLjAsInNtb290aCI6MC4wfSwifnlhdyI6eyJzcGVlZCI6My4wfX0sImRlc3luYyI6IkppdHRlciIsImVuYWJsZSI6dHJ1ZSwieWF3Ijp7Im1vZGUiOiJMZWZ0L1JpZ2h0IiwibW9kaWZpZXIiOiJDZW50ZXIiLCJ+bW9kZSI6eyJsZWZ0X29mZnNldCI6LTEwLjAsIm9mZnNldCI6MC4wLCJyaWdodF9vZmZzZXQiOjMxLjB9LCJ+bW9kaWZpZXIiOnsiZGVncmVlIjotMjUuMCwiZGVsYXkiOjIuMCwid2F5cyI6My4wfX0sIn5kZXN5bmMiOnsibGVmdF9saW1pdCI6NjAuMCwicmlnaHRfbGltaXQiOjYwLjB9fSwiU3RhbmRpbmciOnsiZGVmZW5zaXZlX3NuYXAiOnsiZW5hYmxlIjpmYWxzZSwicGl0Y2giOiJEZWZhdWx0IiwieWF3IjoiQmFja3dhcmQiLCJ+cGl0Y2giOnsiY3VzdG9tIjowLjAsInNtb290aCI6MC4wfSwifnlhdyI6eyJzcGVlZCI6My4wfX0sImRlc3luYyI6IkppdHRlciIsImVuYWJsZSI6dHJ1ZSwieWF3Ijp7Im1vZGUiOiJMZWZ0L1JpZ2h0IiwibW9kaWZpZXIiOiJDZW50ZXIiLCJ+bW9kZSI6eyJsZWZ0X29mZnNldCI6LTM0LjAsIm9mZnNldCI6MTAuMCwicmlnaHRfb2Zmc2V0Ijo0MS4wfSwifm1vZGlmaWVyIjp7ImRlZ3JlZSI6MC4wLCJkZWxheSI6NS4wLCJ3YXlzIjozLjB9fSwifmRlc3luYyI6eyJsZWZ0X2xpbWl0Ijo2MC4wLCJyaWdodF9saW1pdCI6NjAuMH19fSwic3RhdGVfc2VsZWN0b3IiOiJTbmVha2luZyIsInlhdyI6IkRpc2FibGVkIiwifmhpZGVfaGVhZCI6eyJjb25kaXRpb24iOlsiSW4gQWlyICYgQ3JvdWNoaW5nIiwifiJdLCJkaXN0YW5jZSI6MjAwLjAsImVfc3BhbSI6ZmFsc2UsIndlYXBvbiI6WyJLbmlmZSIsIn4iXX0sIn55YXciOnsiYWxsb3dfZGVmZW5zaXZlX3NuYXAiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJzdGF0aWNfeWF3Ijp0cnVlLCJ5YXdfYmFzZSI6IkF0IFRhcmdldCJ9fSwiY29uZmlncyI6eyJsaXN0IjoyLjAsIm5hbWUiOiJrdXRzdWtpMiJ9LCJkaWZmZXJlbnRfc2VsZWN0b3IiOjIuMCwiZ2VuZXJhbCI6eyJhY2NlbnRfY29sb3IiOiIjQjJCRkVGNzUiLCJvcHRpb25zIjp7ImJsdXIiOnRydWUsInNoYWRvdyI6dHJ1ZSwic2hpbmUiOnRydWV9fSwiaG9tZV9zZWxlY3RvciI6Mi4wLCJpbl9nYW1lIjp7ImFuaW1hdGVfc2NvcGVfem9vbSI6ZmFsc2UsImFuaW1hdGlvbl9icmVha2VyIjp0cnVlLCJhc3BlY3RfcmF0aW8iOnRydWUsImN1c3RvbV9zY29wZSI6dHJ1ZSwibm90aWZ5Ijp0cnVlLCJ2aWV3bW9kZWwiOnRydWUsIn5hbmltYXRpb25fYnJlYWtlciI6eyJsZWdzX2luX2FpciI6IlN0YXRpYyIsImxlZ3Nfb25fZ3JvdW5kIjoiSml0dGVyIiwib3RoZXIiOlsifiJdfSwifmFzcGVjdF9yYXRpbyI6eyJldmFsdWF0ZSI6MTU1LjB9LCJ+Y3VzdG9tX3Njb3BlIjp7IippbnZlcnRlciI6IiNGRkZGRkZGRiIsImludmVydGVyIjpmYWxzZSwibGVuZ3RoIjoxMDAuMCwib2Zmc2V0IjoxMC4wfSwifm5vdGlmeSI6eyJkaXNwbGF5IjpbIkNvbnNvbGUiLCJFdmVudHMiLCJ+Il0sImhpdCI6IiNCMkJGRUY3NSIsIm1pc3MiOiIjRkZCMUIxRkYifSwifnZpZXdtb2RlbCI6eyJmb3YiOjY4MC4wLCJrbmlmZV9vcHBvc2l0ZV9oYW5kIjpmYWxzZSwieCI6LTEwLjAsInkiOi0yMC4wLCJ6IjotMjAuMH19LCJpbmRpY2F0b3JzIjp7Iipjcm9zc2hhaXJfaW5kaWNhdG9ycyI6IiNCMkJGRUY3NSIsImNyb3NzaGFpcl9pbmRpY2F0b3JzIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yIjp0cnVlLCJzaG90X21hcmtlcnMiOnRydWUsInNrZWV0X2luZGljYXRvcnMiOlsiU2FmZSBQb2ludHMiLCJEb3VibGUgVGFwIiwiSGlkZSBTaG90cyIsIkZha2UgRHVjayIsIkJvZHkgQWltIiwiTWluaW11bSBEYW1hZ2UiLCJEb3JtYW50IEFpbWJvdCIsIn4iXSwifmRhbWFnZV9pbmRpY2F0b3IiOnsiYW5pbWF0ZWQiOnRydWV9fSwibWlzYyI6eyJjbGFudGFnIjp0cnVlLCJnYW1lX2ZvY3VzIjp0cnVlLCJzaGFyZWRfaWNvbiI6dHJ1ZX0sIm1vdmVtZW50Ijp7ImZhc3RfbGFkZGVyIjp0cnVlLCJub19mYWxsX2RhbWFnZSI6ZmFsc2V9LCJyYWdlIjp7ImF1dG9fdGVsZXBvcnQiOmZhbHNlLCJkb3JtYW50X2FpbWJvdCI6dHJ1ZSwiZml4X3Rocm93Ijp0cnVlLCJmb3JjZV9ib2R5X2FpbSI6ZmFsc2UsImZvcmNlX3RlbGVwb3J0X2V4cGxvaXQiOmZhbHNlLCJncmVuYWRlX3JlbGVhc2UiOmZhbHNlLCJzdXBlcl90b3NzIjp0cnVlLCJ1bmxvY2tfZmFrZV9sYXRlbmN5Ijp0cnVlLCJ+YXV0b190ZWxlcG9ydCI6eyJkZWxheSI6IkxvdyIsIm9ubHlfaW5fYWlyIjp0cnVlfSwifmRvcm1hbnRfYWltYm90Ijp7ImFjY3VyYWN5Ijo3MC4wLCJhdXRvX3Njb3BlIjpmYWxzZSwiZGFtYWdlIjoxLjAsImhpdGJveGVzIjpbIkhlYWQiLCJDaGVzdCIsIlN0b21hY2giLCJ+Il19LCJ+Z3JlbmFkZV9yZWxlYXNlIjp7ImRhbWFnZSI6MzAuMH0sIn51bmxvY2tfZmFrZV9sYXRlbmN5Ijp7ImxhdGVuY3kiOjEzNy4wfX0sIndpZGdldHMiOnsia2V5bGlzdCI6dHJ1ZSwibmV0X2dyYXBoIjpmYWxzZSwic2xvd2Rvd24iOnRydWUsIndhdGVybWFyayI6dHJ1ZSwifndhdGVybWFyayI6eyJmaWVsZHMiOlsiUGluZyIsIlRpbWUiLCJ+Il0sInVzZXJuYW1lIjoiIn19fQ==";
            v69:add("Config \a[accent]Default \rloaded!", "sce");
            v104:import(v193);
        end, true, "Loads default config from script author."), 
        name = l_v131_1.configs:input("")
    };
    local v194 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v130.home_selector
    };
    l_v131_1.configs:depend(v194);
    v1.render:set(function()
        -- upvalues: v104 (ref), v185 (ref), v130 (ref)
        local v195 = v104:get_configs();
        if #v195 ~= #v185 then
            v185 = v195;
            v130.configs.list:update(#v195 ~= 0 and v195 or {
                [1] = "No configs here! Create one."
            });
        end;
    end);
    v1.render:set(function()
        -- upvalues: v130 (ref), v186 (ref)
        local v196 = v130.configs.list:get();
        if v196 ~= v186 then
            v186 = v196;
        end;
    end);
    v1.render:set(function()
        -- upvalues: v130 (ref), v187 (ref)
        local v197 = v130.configs.name:get();
        if v197 ~= v187 then
            v187 = v197;
        end;
    end);
    v130.anti_aimbot = {};
    v130.different_selector = v179.selection:list("", {
        [1] = "\v\f<list>    \rFeatures", 
        [2] = "\v\f<computer>   \rVisuals"
    });
    v130.general = {
        accent_color = v179.general:color_picker("\v\f<palette>     \rAccent", color("#ABCDFFFF")), 
        options = v179.general:label("\v\f<gear>     \rOptions", function(v198)
            return {
                shine = v198:switch("Shine"), 
                blur = v198:switch("Blur"), 
                shadow = v198:switch("Shadow")
            };
        end)
    };
    v1.render:set(function()
        -- upvalues: v7 (ref), v130 (ref)
        v7.colors.accent = v130.general.accent_color:get():alpha_modulate(255);
    end);
    v194 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v130.different_selector
    };
    v179.general:depend(v194);
    v179.in_game:depend(v194);
    v179.indicators:depend(v194);
    v179.widgets:depend(v194);
    v130.in_game = {
        aspect_ratio = v179.in_game:switch("\v\f<tv>   \rAspect ratio", false, function(v199)
            local v201 = {
                evaluate = v199:slider("", 0, 300, 0, 0.01, function(v200)
                    return ({
                        [0] = "Off", 
                        [1.33] = "4:3", 
                        [1.5] = "3:2", 
                        [1.25] = "5:4", 
                        [1.6] = "16:10", 
                        [1.78] = "16:9"
                    })[v200 / 100] or nil;
                end)
            };
            v201.button169 = v199:button("16:9", function()
                -- upvalues: v201 (ref)
                v201.evaluate:set(177.77777777777777);
            end, true);
            v201.button1610 = v199:button("16:10", function()
                -- upvalues: v201 (ref)
                v201.evaluate:set(160);
            end, true);
            v201.button32 = v199:button("3:2", function()
                -- upvalues: v201 (ref)
                v201.evaluate:set(150);
            end, true);
            v201.button43 = v199:button("4:3", function()
                -- upvalues: v201 (ref)
                v201.evaluate:set(133.33333333333331);
            end, true);
            v201.button54 = v199:button("5:4", function()
                -- upvalues: v201 (ref)
                v201.evaluate:set(125);
            end, true);
            return v201, true;
        end), 
        viewmodel = v179.in_game:switch("\v\f<hand>    \rViewmodel", false, function(v202)
            local v203 = {
                fov = v202:slider("Field of View", 0, 1000, cvar.viewmodel_fov:float() * 10, 0.1), 
                x = v202:slider("X", -100, 100, cvar.viewmodel_offset_x:float() * 10, 0.1), 
                y = v202:slider("Y", -100, 100, cvar.viewmodel_offset_y:float() * 10, 0.1), 
                z = v202:slider("Z", -100, 100, cvar.viewmodel_offset_z:float() * 10, 0.1), 
                knife_opposite_hand = v202:switch("Knife opposite hand")
            };
            v203.reset = v202:button("Reset", function()
                -- upvalues: v203 (ref)
                v203.fov:set(600);
                v203.x:set(10);
                v203.y:set(10);
                v203.z:set(15);
            end);
            return v203, true;
        end), 
        notify = v179.in_game:switch("\v\f<bell>     \rLog aimbot shots", false, function(v204)
            -- upvalues: v7 (ref)
            return {
                display = v204:selectable("Display", {
                    [1] = "On screen", 
                    [2] = "Console", 
                    [3] = "Events"
                }), 
                hit = v204:color_picker("Hit", v7.colors.hit), 
                miss = v204:color_picker("Miss", v7.colors.miss)
            }, true;
        end), 
        custom_scope = v179.in_game:switch("\v\f<crosshairs-simple>    \rCustom scope overlay", false, function(v205)
            return {
                inverter = v205:switch("Color", false, color("#9CD1FFFF"), "Inverts color"), 
                offset = v205:slider("Offset", 10, 100, 10, 1), 
                length = v205:slider("Length", 10, 100, 50, 1)
            }, true;
        end), 
        animate_scope_zoom = v179.in_game:switch("\v\f<magnifying-glass>    \rAnimate scope zoom"), 
        animation_breaker = v179.in_game:switch("\v\f<person-walking-with-cane>    \rAnimation breaker", false, function(v206)
            return {
                legs_on_ground = v206:combo("Legs on ground", {
                    [1] = "Default", 
                    [2] = "Follow direction", 
                    [3] = "Moon walk", 
                    [4] = "Jitter"
                }), 
                legs_in_air = v206:combo("Legs in air", {
                    [1] = "Default", 
                    [2] = "Static", 
                    [3] = "Walking"
                }), 
                other = v206:listable("Additional", {
                    [1] = "Zero pitch on landing", 
                    [2] = "Blinded", 
                    [3] = "Kinguru"
                })
            }, true;
        end)
    };
    v1.render:set(function()
        -- upvalues: v7 (ref), v130 (ref)
        v7.colors.hit = v130.in_game.notify.hit:get();
        v7.colors.miss = v130.in_game.notify.miss:get();
    end);
    v130.indicators = {
        crosshair_indicators = v179.indicators:switch("\v\f<indent>    \rCrosshair indicators", false, color()), 
        damage_indicator = v179.indicators:switch("\v\f<skull>\r\tDamage indicator", false, function(v207)
            return {
                animated = v207:switch("Animated", false)
            }, true;
        end), 
        shot_markers = v179.indicators:switch("\v\f<bullseye-arrow>   \rShot markers"), 
        skeet_indicators = v179.indicators:selectable(string.format("\v\f<sidebar-flip>   \a%s$500\r indicators", "8fc215ff"), {
            [1] = "Safe Points", 
            [2] = "Double Tap", 
            [3] = "Hide Shots", 
            [4] = "Fake Duck", 
            [5] = "Body Aim", 
            [6] = "Minimum Damage", 
            [7] = "Dormant Aimbot"
        }), 
        dmg_x = v179.indicators:slider("Damage x", 1, v51.x, v51.x / 2, 1):visibility(false), 
        dmg_y = v179.indicators:slider("Damage y", 1, v51.y, v51.y / 2, 1):visibility(false)
    };
    v130.widgets = {
        watermark = v179.widgets:switch("\v\f<rectangle-ad>   \rWatermark", false, function(v208)
            return {
                fields = v208:selectable("Fields", {
                    [1] = "Ping", 
                    [2] = "Time"
                }), 
                username = v208:input("")
            }, true;
        end), 
        keylist = v179.widgets:switch("\v\f<toggle-on>   \rKeylist"), 
        keylist_x = v179.widgets:slider("Keybinds x", 1, v51.x, 300, 1):visibility(false), 
        keylist_y = v179.widgets:slider("Keybinds y", 1, v51.y, 300, 1):visibility(false), 
        slowdown = v179.widgets:switch("\v\f<chart-line>   \rSlowdown warning"), 
        slowdown_x = v179.widgets:slider("Slowdown x", 1, v51.x, v51.x / 2, 1):visibility(false), 
        slowdown_y = v179.widgets:slider("Slowdown y", 1, v51.y, 300, 1):visibility(false), 
        net_graph = v179.widgets:switch("\v\f<chart-simple>    \rNet graph"), 
        net_graph_x = v179.widgets:slider("Net graph x", 1, v51.x, v51.x - 400, 1):visibility(false), 
        net_graph_y = v179.widgets:slider("Net graph y", 1, v51.y, v51.y - 400, 1):visibility(false)
    };
    v130.rage = {
        auto_teleport = v179.rage:switch("\v\f<person-to-portal>   \rShrewd teleport", false, "Automatically teleport, if the enemy is a danger to you.", function(v209)
            return {
                only_in_air = v209:switch("Only in air", true), 
                delay = v209:combo("Delay", {
                    [1] = "Low", 
                    [2] = "Medium", 
                    [3] = "High", 
                    [4] = "-"
                })
            }, true;
        end), 
        fix_throw = v179.rage:switch("\v\f<bomb>   \rFix throw nades"), 
        force_teleport_exploit = v179.rage:switch("\v\f<wand-magic-sparkles>   \rForce teleport exploit"), 
        force_body_aim = v179.rage:switch("\v\f<eye>   \rBody aim if lethal"), 
        dormant_aimbot = v179.rage:switch("\v\f<eye-low-vision>   \rDormant aimbot", false, function(v210)
            return {
                hitboxes = v210:selectable("Hitboxes", {
                    [1] = "Head", 
                    [2] = "Chest", 
                    [3] = "Stomach"
                }), 
                accuracy = v210:slider("Accuracy", 35, 100, 75, nil, "%"), 
                damage = v210:slider("Minimum damage", 1, 126, 10, nil, function(v211)
                    if v211 == 1 then
                        return "Inherited";
                    elseif v211 > 100 then
                        return string.format("HP+ %i", v211 - 100);
                    else
                        return v211;
                    end;
                end), 
                auto_scope = v210:switch("Auto scope")
            }, true;
        end), 
        grenade_release = v179.rage:switch("\v\f<bomb>   \rGrenade release", false, "Automatically throws a grenade if it does the damage you want to the enemy.", function(v212)
            return {
                damage = v212:slider("Damage", 10, 55, 25)
            }, true;
        end), 
        unlock_fake_latency = v179.rage:switch("\v\f<signal>   \rUnlock fake latency", false, nil, function(v213)
            return {
                latency = v213:slider("Fake Latency", 0, 200, 0, nil, "ms")
            }, true;
        end), 
        super_toss = v179.rage:switch("\v\f<bullseye-arrow>   \rSuper toss", false, "Trying to remove player movement impact from grenade trajectories for more consistent throws.")
    };
    v130.movement = {
        fast_ladder = v179.movement:switch("\v\f<water-ladder>   \rFast ladder climb"), 
        no_fall_damage = v179.movement:switch("\v\f<person-falling>    \rNo fall damage")
    };
    v130.misc = {
        clantag = v179.misc:switch("\v\f<user-tag>   \rLua tag"), 
        shared_icon = v179.misc:switch("\v\f<users>   \rShared icon"), 
        game_focus = v179.misc:switch("\v\f<sword>    \rFlash taskbar icon")
    };
    v194 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v130.different_selector
    };
    v179.rage:depend(v194);
    v179.misc:depend(v194);
    v179.movement:depend(v194);
end;
v131 = cvar.sv_maxunlag;
v179 = v128.misc.fake_latency;
do
    local l_v131_2, l_v179_0, l_v140_2 = v131, v179, v140;
    l_v140_2 = function()
        -- upvalues: l_v179_0 (ref), l_v131_2 (ref)
        l_v179_0:override();
        l_v131_2:float(tonumber(l_v131_2:string()), true);
    end;
    local function v218(v217)
        -- upvalues: l_v179_0 (ref), l_v131_2 (ref)
        l_v179_0:override(v217);
        l_v131_2:float(0.4, true);
    end;
    local function v221(v219, v220)
        -- upvalues: l_v140_2 (ref), v218 (ref)
        if not v219 then
            l_v140_2();
            return;
        else
            v218(v220);
            return;
        end;
    end;
    v130.rage.unlock_fake_latency.latency:set_callback(function(v222)
        -- upvalues: v221 (ref), v130 (ref)
        v221(v130.rage.unlock_fake_latency:get(), v222:get());
    end, true);
    v130.rage.unlock_fake_latency:set_callback(function(v223)
        -- upvalues: v221 (ref), v130 (ref)
        local v224 = v223:get();
        v221(v224, v130.rage.unlock_fake_latency.latency:get());
    end, true);
    v1.shutdown(function()
        -- upvalues: v130 (ref), l_v140_2 (ref)
        if not v130.rage.unlock_fake_latency:get() then
            return;
        else
            l_v140_2();
            return;
        end;
    end);
end;
v131 = function(v225, v226, v227, v228)
    v225.x = v225.x - 10 + math.abs(v225.x) / 9;
    local v229 = vector():angles(v225);
    local v230 = v228 * 1.25;
    local v231 = math.clamp(v226 * 0.9, 15, 750);
    local v232 = math.clamp(v227, 0, 1);
    v231 = v231 * math.lerp(0.3, 1, v232);
    local l_v229_0 = v229;
    for _ = 1, 8 do
        l_v229_0 = (v229 * (l_v229_0 * v231 + v230):length() - v230) / v231;
        l_v229_0:normalize();
    end;
    local v235 = l_v229_0.angles(l_v229_0);
    if v235.x > -10 then
        v235.x = 0.9 * v235.x + 9;
    else
        v235.x = 1.125 * v235.x + 11.25;
    end;
    return v235;
end;
do
    local l_v131_3 = v131;
    v1.createmove(function(v237)
        -- upvalues: v130 (ref), l_v131_3 (ref)
        if not v130.rage.super_toss:get() then
            return;
        else
            local v238 = entity.get_local_player();
            if not v238 then
                return;
            else
                local v239 = v238:get_player_weapon();
                if not v239 then
                    return;
                else
                    local v240 = v239:get_weapon_info();
                    if not v240 or v240.weapon_type ~= 9 or v239.m_fThrowTime < globals.curtime or not v237.jitter_move then
                        return;
                    else
                        local v241 = v238:simulate_movement();
                        v241:think();
                        v237.view_angles = l_v131_3(v237.view_angles, v240.throw_velocity, v239.m_flThrowStrength, v241.velocity);
                        return;
                    end;
                end;
            end;
        end;
    end);
    v1.grenade_override_view(function(v242)
        -- upvalues: v130 (ref), l_v131_3 (ref)
        if not v130.rage.super_toss:get() then
            return;
        else
            local v243 = entity.get_local_player();
            if not v243 then
                return;
            else
                local v244 = v243:get_player_weapon();
                if not v244 then
                    return;
                else
                    local v245 = v244:get_weapon_info();
                    if not v245 then
                        return;
                    else
                        v242.angles = l_v131_3(v242.angles, v245.throw_velocity, v244.m_flThrowStrength, v242.velocity);
                        return;
                    end;
                end;
            end;
        end;
    end);
end;
v131 = nil;
v179 = l_gradient_0.text_animate("wingless", -1.2, {
    [1] = color(116, 116, 116, 255), 
    [2] = v7.accent
});
do
    local l_v179_1 = v179;
    v1.render:set(function()
        -- upvalues: v7 (ref), l_v179_1 (ref), v130 (ref), v129 (ref)
        if v7.get_alpha() == 0 then
            return;
        else
            l_v179_1:set_colors({
                [1] = color(116, 116, 116, 255), 
                [2] = v7.accent
            });
            local l_sidebar_0 = v130.about.sidebar;
            local v248 = "wingless";
            if l_sidebar_0:get() == "Stylish" then
                v248 = l_v179_1:get_animated_text();
            end;
            if l_sidebar_0.branch:get() then
                v248 = string.format("%s\r ~ \v%s", v248, v129.built);
            end;
            v7.sidebar(v248, "\f<stars>");
            l_v179_1:animate();
            return;
        end;
    end);
end;
v179 = {};
v140 = {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Slowwalking", 
    [4] = "Moving", 
    [5] = "Crouching", 
    [6] = "Sneaking", 
    [7] = "In Air", 
    [8] = "In Air & Crouching", 
    [9] = "Fakelags"
};
local l_lshift_0 = bit.lshift;
local l_band_0 = bit.band;
local v251 = v7.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
local v252 = v7.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
local v253 = false;
local v254 = false;
local v255 = {
    FL_ONGROUND = l_lshift_0(1, 0), 
    FL_DUCKING = l_lshift_0(1, 1), 
    FL_WATERJUMP = l_lshift_0(1, 3), 
    FL_ONTRAIN = l_lshift_0(1, 4), 
    FL_INRAIN = l_lshift_0(1, 5), 
    FL_FROZEN = l_lshift_0(1, 6), 
    FL_ATCONTROLS = l_lshift_0(1, 7), 
    FL_CLIENT = l_lshift_0(1, 8), 
    FL_FAKECLIENT = l_lshift_0(1, 9), 
    FL_INWATER = l_lshift_0(1, 10), 
    FL_HIDEHUD_SCOPE = l_lshift_0(1, 11)
};
do
    local l_l_band_0_0, l_v251_0, l_v252_0, l_v253_0, l_v254_0, l_v255_0 = l_band_0, v251, v252, v253, v254, v255;
    v1.createmove:set(function(v262)
        -- upvalues: l_v253_0 (ref), l_v254_0 (ref)
        l_v253_0 = v262.in_jump;
        l_v254_0 = v262.in_speed;
    end);
    v179.get_statement = function(_, v264)
        -- upvalues: l_l_band_0_0 (ref), l_v255_0 (ref), l_v253_0 (ref), l_v254_0 (ref), l_v252_0 (ref), v128 (ref), l_v251_0 (ref)
        local v265 = entity.get_local_player();
        if not v265 or not v265:is_alive() then
            return "Standing";
        else
            local l_m_fFlags_0 = v265.m_fFlags;
            local v267 = v265.m_vecVelocity:length();
            local v268 = l_l_band_0_0(l_m_fFlags_0, l_v255_0.FL_DUCKING) == l_v255_0.FL_DUCKING;
            local v269 = l_v253_0 or l_l_band_0_0(l_m_fFlags_0, l_v255_0.FL_ONGROUND) ~= l_v255_0.FL_ONGROUND;
            local v270 = l_v254_0 or l_v252_0:get();
            if not v128.rage.double_tap:get() and not v128.rage.hide_shots:get() and v264 then
                return "Fakelags";
            elseif v269 then
                return v268 and "In Air & Crouching" or "In Air";
            elseif v268 or l_v251_0:get() then
                return v267 > 2 and "Sneaking" or "Crouching";
            elseif v267 > 2 then
                return v270 and "Slowwalking" or "Moving";
            else
                return "Standing";
            end;
        end;
    end;
    local v271 = {
        [1] = {
            [1] = "selector", 
            [2] = "##anti_aimbot selector"
        }, 
        [2] = {
            [1] = "settings", 
            [2] = "##settings"
        }, 
        [3] = {
            [1] = "state_selector", 
            [2] = "##anti_aimbot state_selector"
        }
    };
    for _, v273 in pairs(v140) do
        table.insert(v271, {
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = string.format("yaw[%s]", v273), 
            [2] = string.format("%s \226\128\186 \vyaw", v273)
        });
        table.insert(v271, {
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = string.format("desync[%s]", v273), 
            [2] = string.format("%s \226\128\186 \vdesync", v273)
        });
        table.insert(v271, {
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = string.format("misc[%s]", v273), 
            [2] = string.format("%s \226\128\186 \vmisc", v273)
        });
    end;
    local v274 = v7.create("\v\f<shield>", v271);
    v130.anti_aimbot.enable = v274.selector:switch("Enable");
    v130.anti_aimbot.selector = v274.selector:list("", {
        [1] = "\v\f<gear>   \rSettings", 
        [2] = "\v\f<layer-group>   \rBuilder"
    });
    v130.anti_aimbot.yaw = v274.settings:combo("\v\f<arrows-repeat>   \rManual yaw", {
        [1] = "Disabled", 
        [2] = "Left", 
        [3] = "Right", 
        [4] = "Forward"
    }, function(v275)
        return {
            static_yaw = v275:switch("Static yaw", true), 
            allow_defensive_snap = v275:switch("Allow defensive snap"), 
            pitch = v275:combo("Pitch", {
                [1] = "Down", 
                [2] = "Disabled", 
                [3] = "Fake Up", 
                [4] = "Fake Down"
            }), 
            yaw_base = v275:combo("Yaw base", {
                [1] = "At Target", 
                [2] = "Local View"
            })
        };
    end);
    v130.anti_aimbot.hide_head = v274.settings:switch("\v\f<user-helmet-safety>   \rSafe head", false, function(v276)
        return {
            e_spam = v276:switch("E spam"), 
            weapon = v276:selectable("Weapon", {
                [1] = "Taser", 
                [2] = "Knife"
            }), 
            condition = v276:selectable("Condition", {
                [1] = "Standing", 
                [2] = "Slowwalking", 
                [3] = "Crouching", 
                [4] = "Sneaking", 
                [5] = "In Air", 
                [6] = "In Air & Crouching"
            }), 
            distance = v276:slider("Distance", 50, 200, 120, 0.1, "m")
        }, true;
    end);
    v130.anti_aimbot.avoid_backstab = v274.settings:switch("\v\f<knife-kitchen>  \rAvoid backstab");
    v130.anti_aimbot.break_lc = v274.settings:selectable("\v\f<shield-exclamation>   \rLC Breaker", {
        [1] = "Reloading", 
        [2] = "Standing", 
        [3] = "Slowwalking", 
        [4] = "Moving", 
        [5] = "Crouching", 
        [6] = "Sneaking", 
        [7] = "In Air", 
        [8] = "In Air & Crouching"
    });
    v130.anti_aimbot.state_selector = v274.selector:combo("\v\f<person>   \rState", v140);
    v130.anti_aimbot.selector:depend({
        [1] = nil, 
        [2] = true, 
        [1] = v130.anti_aimbot.enable
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v130.anti_aimbot.enable
    });
    v130.anti_aimbot.state_selector:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v130.anti_aimbot.selector
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v130.anti_aimbot.enable
    });
    v274.settings:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v130.anti_aimbot.selector
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v130.anti_aimbot.enable
    });
    local v277 = {
        pitch = v7.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = {
            self = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            base = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            offset = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            hidden = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
        }, 
        yaw_modifier = {
            self = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            offset = v7.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
        }, 
        body_yaw = {
            self = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            inverter = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
            left_limit = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            right_limit = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            options = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            freestanding = v7.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
        }
    };
    v130.anti_aimbot.settings = {};
    for _, v279 in ipairs(v140) do
        do
            local l_v279_0 = v279;
            v130.anti_aimbot.settings[l_v279_0] = {
                enable = v274.selector:switch("Enable \v" .. l_v279_0, l_v279_0 == "Default"), 
                yaw = {
                    mode = v274[("yaw[%s]"):format(l_v279_0)]:combo("Mode", {
                        [1] = "Static", 
                        [2] = "Left/Right"
                    }, function(_, v282)
                        -- upvalues: v274 (ref), l_v279_0 (ref)
                        local v283 = {
                            offset = v274[("yaw[%s]"):format(l_v279_0)]:slider("Offset", -90, 90, 0, 1, "\194\176"), 
                            left_offset = v274[("yaw[%s]"):format(l_v279_0)]:slider("Left", -90, 90, 0, 1, "\194\176"), 
                            right_offset = v274[("yaw[%s]"):format(l_v279_0)]:slider("Right", -90, 90, 0, 1, "\194\176")
                        };
                        v283.offset:depend({
                            [1] = nil, 
                            [2] = "Static", 
                            [1] = v282
                        });
                        v283.left_offset:depend({
                            [1] = nil, 
                            [2] = "Left/Right", 
                            [1] = v282
                        });
                        v283.right_offset:depend({
                            [1] = nil, 
                            [2] = "Left/Right", 
                            [1] = v282
                        });
                        return v283;
                    end), 
                    modifier = v274[("yaw[%s]"):format(l_v279_0)]:combo("Modifier", {
                        [1] = "None", 
                        [2] = "Offset", 
                        [3] = "Center", 
                        [4] = "X-way", 
                        [5] = "Skitter"
                    }, function(_, v285)
                        -- upvalues: v274 (ref), l_v279_0 (ref)
                        local v286 = {
                            ways = v274[("yaw[%s]"):format(l_v279_0)]:slider("Ways", 3, 9, 3), 
                            delay = v274[("yaw[%s]"):format(l_v279_0)]:slider("Delay", 2, 10, 2, 1, "t"), 
                            degree = v274[("yaw[%s]"):format(l_v279_0)]:slider("Degree", -90, 90, 0, 1, "\194\176")
                        };
                        v286.ways:depend({
                            [1] = nil, 
                            [2] = "X-way", 
                            [1] = v285
                        });
                        v286.degree:depend({
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v285
                        });
                        v286.delay:depend({
                            [1] = nil, 
                            [2] = "Center", 
                            [3] = "Offset", 
                            [1] = v285
                        });
                        return v286;
                    end)
                }, 
                desync = v274[("desync[%s]"):format(l_v279_0)]:combo("Mode", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Jitter"
                }, function(_, v288)
                    -- upvalues: v274 (ref), l_v279_0 (ref)
                    local v291 = {
                        left_limit = v274[("desync[%s]"):format(l_v279_0)]:slider("Left limit", 0, 60, 0, 1, "\194\176"), 
                        right_limit = v274[("desync[%s]"):format(l_v279_0)]:slider("Right limit", 0, 60, 0, 1, "\194\176"), 
                        options = v274[("desync[%s]"):format(l_v279_0)]:label("Options", function(v289, _)
                            return {
                                avoid_overlap = v289:switch("Avoid overlap"), 
                                anti_bruteforce = v289:switch("Anti bruteforce"), 
                                freestanding = v289:combo("Freestanding", {
                                    [1] = "Off", 
                                    [2] = "Peek fake", 
                                    [3] = "Peek real"
                                })
                            };
                        end)
                    };
                    v291.left_limit:depend({
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = v288
                    });
                    v291.right_limit:depend({
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = v288
                    });
                    v291.options:depend({
                        [1] = nil, 
                        [2] = "Disabled", 
                        [3] = true, 
                        [1] = v288
                    });
                    return v291;
                end), 
                defensive_snap = {
                    enable = v274[("misc[%s]"):format(l_v279_0)]:switch("Defensive snap"), 
                    pitch = v274[("misc[%s]"):format(l_v279_0)]:combo("Pitch", {
                        [1] = "Default", 
                        [2] = "Up", 
                        [3] = "Zero", 
                        [4] = "Switch", 
                        [5] = "Random", 
                        [6] = "Custom"
                    }, function(v292, v293)
                        local v294 = {
                            smooth = v292:slider("Smooth", 0, 100, 0, 1, "%"), 
                            custom = v292:slider("Degree", -89, 89, 0, 1, "\194\176")
                        };
                        v294.smooth:depend({
                            [1] = nil, 
                            [2] = "Switch", 
                            [1] = v293
                        });
                        v294.custom:depend({
                            [1] = nil, 
                            [2] = "Custom", 
                            [1] = v293
                        });
                        return v294;
                    end), 
                    yaw = v274[("misc[%s]"):format(l_v279_0)]:combo("Yaw", {
                        [1] = "Default", 
                        [2] = "Spinbot", 
                        [3] = "Random", 
                        [4] = "Forward", 
                        [5] = "Sideways", 
                        [6] = "Backward"
                    }, function(v295, v296)
                        local v297 = {
                            speed = v295:slider("Speed", 1, 10, 3, 1, "t")
                        };
                        v297.speed:depend({
                            [1] = nil, 
                            [2] = "Spinbot", 
                            [1] = v296
                        });
                        return v297;
                    end)
                }
            };
            v130.anti_aimbot.settings.Default.enable:set(true);
        end;
    end;
    for _, v299 in ipairs(v140) do
        v274[("yaw[%s]"):format(v299)]:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v130.anti_aimbot.selector
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v130.anti_aimbot.enable
        }, {
            [1] = v130.anti_aimbot.state_selector, 
            [2] = v299
        });
        v274[("desync[%s]"):format(v299)]:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v130.anti_aimbot.selector
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v130.anti_aimbot.enable
        }, {
            [1] = v130.anti_aimbot.state_selector, 
            [2] = v299
        });
        v274[("misc[%s]"):format(v299)]:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v130.anti_aimbot.selector
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v130.anti_aimbot.enable
        }, {
            [1] = v130.anti_aimbot.state_selector, 
            [2] = v299
        });
        v274[("misc[%s]"):format(v299)]:disabled(v299 == "Fakelags");
        local v300 = v130.anti_aimbot.settings[v299];
        for v301, v302 in pairs(v300) do
            if v301 == "enable" then
                v302:depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v130.anti_aimbot.selector
                }, {
                    [1] = v130.anti_aimbot.state_selector, 
                    [2] = v299 == "Default" or v299
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = v130.anti_aimbot.enable
                });
            end;
        end;
    end;
    local function v305(v303, v304)
        return v303 * (v304 / 100);
    end;
    local v306 = {
        sended = 0
    };
    v179.safe_head = function(v307)
        -- upvalues: v130 (ref), v277 (ref)
        local v308 = entity.get_local_player();
        if not v308 or not v308:is_alive() then
            return false;
        else
            local l_hide_head_0 = v130.anti_aimbot.hide_head;
            local v310 = table.concat(l_hide_head_0.condition:get());
            local v311 = table.concat(l_hide_head_0.weapon:get());
            local v312 = entity.get_threat();
            local v313 = v308:get_eye_position();
            local v314 = v312 and v312:get_eye_position() or vector();
            local v315 = v312 and v313 - v314 or vector();
            local v316 = v307:get_statement();
            local v317 = v308:get_player_weapon();
            local v318 = v317 and v317:get_classname():gsub("C", ""):gsub("Weapon", "") or "";
            local v319 = v310:find(v316);
            local v320 = v311:find(v318);
            local v321 = tonumber(string.format("%.1f", v315:length() * 0.0254));
            local v322 = l_hide_head_0:get() and v315.z > 0 and v319 and v320 and v312 and v321 <= l_hide_head_0.distance:get() * 0.1 and v130.anti_aimbot.enable:get();
            if v322 then
                v277.pitch:override("Down");
                v277.yaw.self:override("Backward");
                v277.yaw.base:override("At Target");
                v277.yaw.offset:override(0);
                v277.yaw_modifier.self:override("Disabled");
                v277.body_yaw.self:override(false);
                if l_hide_head_0.e_spam:get() then
                    rage.antiaim:override_hidden_pitch(0);
                    rage.antiaim:override_hidden_yaw_offset(180);
                end;
            end;
            return v322;
        end;
    end;
    v179.defensive_snap = function(v323, v324)
        -- upvalues: v130 (ref), v306 (ref), v305 (ref)
        local v325 = v323:get_statement();
        if not v130.anti_aimbot.settings[v325].enable:get() or not v325 then
            v325 = "Default";
        end;
        local l_defensive_snap_0 = v130.anti_aimbot.settings[v325].defensive_snap;
        if not l_defensive_snap_0.enable:get() or not v130.anti_aimbot.enable:get() or v324 and not v130.anti_aimbot.yaw.allow_defensive_snap:get() or v323:safe_head() then
            return false;
        else
            local l_pitch_0 = l_defensive_snap_0.pitch;
            local v328 = {
                Zero = 0, 
                Up = -89
            };
            local v329;
            if l_pitch_0.smooth:get() == 0 then
                v329 = v306.sended % 2 == 0 and -89 or 89;
            else
                v329 = math.floor(89 * math.sin(globals.curtime / v305(1.3, l_pitch_0.smooth:get())));
            end;
            v328.Switch = v329;
            v328.Random = utils.random_int(89, -89);
            v328.Custom = l_pitch_0.custom:get();
            if l_pitch_0:get() ~= "Default" then
                rage.antiaim:override_hidden_pitch(v328[l_pitch_0:get()]);
            end;
            v328 = l_defensive_snap_0.yaw;
            v329 = {
                Forward = 180, 
                Backward = 0, 
                Spinbot = math.lerp(-180, 180, globals.curtime * v328.speed:get() % 2 - 1), 
                Random = utils.random_int(-180, 180), 
                Sideways = v306.sended % 2 == 0 and -90 or 90
            };
            if v328:get() ~= "Default" then
                rage.antiaim:override_hidden_yaw_offset(v329[v328:get()]);
            end;
            return true;
        end;
    end;
    v179.force_defensive = function(v330, _)
        -- upvalues: v130 (ref), v128 (ref)
        local v332 = table.concat(v130.anti_aimbot.break_lc:get());
        if v130.rage.force_teleport_exploit:get() or not v130.anti_aimbot.enable:get() then
            return;
        else
            local v333 = v330:get_statement();
            local v334 = entity.get_local_player():get_player_weapon();
            if not v334 then
                return;
            else
                if v332:find("Reloading") and v334:get_weapon_reload() ~= -1 then
                    v128.rage.lag_options:override("Always On");
                elseif v332:find(v333) then
                    v128.rage.lag_options:override("Always On");
                else
                    v128.rage.lag_options:override(nil);
                end;
                return;
            end;
        end;
    end;
    v179.calculate_ways = function(_, v336, v337)
        -- upvalues: v306 (ref)
        local v338 = v306.sended % v336;
        local v339 = math.floor(v336 * 0.5);
        if v339 <= v338 then
            if v336 % 2 == 0 then
                v338 = v338 + 1;
            end;
            if v338 == v339 then
                return 0;
            end;
        end;
        local v340 = (v338 - v339) / v339;
        return (math.floor(v337 * v340));
    end;
    v179.calculate_skitter = function(_, v342, v343)
        -- upvalues: v306 (ref)
        return ({
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = -v342, 
            [2] = -v342, 
            [4] = v342, 
            [5] = v342
        })[v306.sended % 5 + 1] + v343;
    end;
    v179.calculate_jitter = function(_, v345, v346)
        -- upvalues: v306 (ref)
        return v306.sended % v345 >= math.ceil(v345 / 2) and v346 or -v346;
    end;
    v179.manual_yaw = function(_)
        -- upvalues: v130 (ref)
        local v348 = v130.anti_aimbot.yaw:get();
        return ({
            Forward = 180, 
            Right = 90, 
            Left = -90
        })[v348];
    end;
    local _ = nil;
    local v350 = 0;
    do
        local l_v350_0 = v350;
        v179.is_break_lagcomp = function(_)
            -- upvalues: l_v350_0 (ref)
            local v353 = entity.get_local_player();
            local v354 = utils.net_channel();
            local v355 = v353:get_simulation_time();
            local v356 = to_ticks(v355.current - v355.old);
            if v356 < 0 then
                l_v350_0 = globals.tickcount + math.abs(v356) - to_ticks(v354.latency[0]);
            end;
            return l_v350_0 > globals.tickcount;
        end;
    end;
    v179.builder = function(v357, _, v359, v360)
        -- upvalues: v130 (ref), v277 (ref), v306 (ref)
        if not v130.anti_aimbot.enable:get() then
            v277.pitch:override(nil);
            v277.yaw.base:override(nil);
            v277.yaw_modifier.self:override(nil);
            v277.yaw_modifier.offset:override(nil);
            v277.yaw.offset:override(nil);
            v277.body_yaw.self:override(nil);
            v277.body_yaw.left_limit:override(nil);
            v277.body_yaw.right_limit:override(nil);
            v277.body_yaw.options:override(nil);
            v277.body_yaw.freestanding:override(nil);
            return;
        elseif v359[1] then
            return;
        else
            local v361 = v357:get_statement(v130.anti_aimbot.settings.Fakelags.enable:get());
            if not v130.anti_aimbot.settings[v361].enable:get() or not v361 then
                v361 = "Default";
            end;
            local v362 = v130.anti_aimbot.settings[v361];
            local l_yaw_0 = v362.yaw;
            local l_desync_0 = v362.desync;
            local l_modifier_0 = l_yaw_0.modifier;
            v277.yaw_modifier.self:override("Disabled");
            v277.yaw.offset:override(0);
            v277.body_yaw.self:override(false);
            if v360 and v130.anti_aimbot.yaw.static_yaw:get() then
                v277.yaw.offset:override(v360);
                return;
            else
                local v366 = l_modifier_0.ways:get();
                local v367 = l_modifier_0.degree:get();
                local v368 = l_modifier_0.delay:get();
                local v369 = l_yaw_0.mode.offset:get();
                local v370 = l_modifier_0:get() == "Center" and v368 > 2;
                if l_yaw_0.mode:get() == "Left/Right" then
                    v369 = (v370 and v306.sended % v368 >= math.ceil(v368 / 2) or rage.antiaim:inverter()) and l_yaw_0.mode.left_offset:get() or l_yaw_0.mode.right_offset:get();
                end;
                if not v359[2] then
                    local v371 = v360 or v369;
                    if l_modifier_0:get() == "X-way" then
                        local v372 = v357:calculate_ways(v366, v367) * 0.5;
                        v277.yaw.offset:override(v371 + v372);
                    elseif l_modifier_0:get() == "Center" then
                        local v373 = v357:calculate_jitter(v368, v367) * 0.5;
                        if v368 > 2 then
                            v277.yaw.offset:override(math.normalize_yaw(v371 + v373));
                        else
                            v277.yaw.offset:override(v371);
                            v277.yaw_modifier.self:override("Center");
                            v277.yaw_modifier.offset:override(v367);
                        end;
                    elseif l_modifier_0:get() == "Offset" then
                        v277.yaw.offset:override(v371);
                        v277.yaw_modifier.self:override("Offset");
                        v277.yaw_modifier.offset:override(v367);
                    elseif l_modifier_0:get() == "Skitter" then
                        local v374 = v357:calculate_skitter(v367, v369) * 0.5;
                        v277.yaw.offset:override(v374);
                    elseif l_modifier_0:get() == "None" then
                        v277.yaw.offset:override(v369);
                    end;
                end;
                v277.body_yaw.self:override(l_desync_0:get() ~= "Disabled");
                v277.body_yaw.inverter:override(v370 and l_desync_0:get() == "Jitter" and v306.sended % v368 >= math.ceil(v368 / 2) or nil);
                v277.body_yaw.left_limit:override(l_desync_0.left_limit:get());
                v277.body_yaw.right_limit:override(l_desync_0.right_limit:get());
                v277.body_yaw.options:override({
                    [1] = l_desync_0.options.avoid_overlap:get() and "Avoid Overlap" or "", 
                    [2] = (not (l_desync_0:get() == "Jitter") or v370) and "" or "Jitter", 
                    [3] = l_desync_0.options.anti_bruteforce:get() and "Anti Bruteforce" or ""
                });
                v277.body_yaw.freestanding:override(l_desync_0.options.freestanding:get());
                return;
            end;
        end;
    end;
    v179.on_createmove = function(v375, v376)
        -- upvalues: v306 (ref), v130 (ref), v128 (ref), v277 (ref)
        if v376.choked_commands == 0 then
            v306.sended = v306.sended + 1;
        end;
        local v377 = v375:safe_head();
        local v378 = v375:manual_yaw();
        local v379 = v375:defensive_snap(v378);
        v375:builder(v376, {
            [1] = v377, 
            [2] = v379 and v375:is_break_lagcomp()
        }, v378);
        v375:force_defensive(v376);
        if v130.anti_aimbot.enable:get() then
            v128.anti_aim.avoid_backstab:override(v130.anti_aimbot.avoid_backstab:get());
            v277.yaw.hidden:override(v377 and v130.anti_aimbot.hide_head.e_spam:get() or v379);
        else
            v128.anti_aim.avoid_backstab:override(nil);
            v277.yaw.hidden:override(nil);
        end;
        v277.pitch:override(v130.anti_aimbot.enable:get() and v130.anti_aimbot.yaw.pitch:get() or nil);
        v277.yaw.base:override(v130.anti_aimbot.enable:get() and v130.anti_aimbot.yaw.yaw_base:get() or nil);
    end;
    v1.createmove:set(function(v380)
        -- upvalues: v179 (ref)
        v179:on_createmove(v380);
    end);
end;
v7.setup(v130);
v140 = {};
l_lshift_0 = function(v381)
    -- upvalues: v7 (ref)
    local v382 = v7.get_binds();
    for v383 = 1, #v382 do
        local v384 = v382[v383];
        if v384.active and v384.name == v381 then
            return true;
        end;
    end;
    return false;
end;
l_band_0 = {};
v251 = {
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
v252 = {
    hegrenade = "Naded", 
    knife = "Knifed", 
    inferno = "Burned"
};
do
    local l_l_lshift_0_0, l_l_band_0_1, l_v251_1, l_v252_1, l_v253_1, l_v254_1, l_v255_1 = l_lshift_0, l_band_0, v251, v252, v253, v254, v255;
    do
        local l_l_v251_1_0, l_l_v252_1_0 = l_v251_1, l_v252_1;
        l_l_band_0_1.on_aimbot_hit = function(_, v395)
            -- upvalues: v130 (ref), l_l_v251_1_0 (ref), v7 (ref), v69 (ref)
            if not v130.in_game.notify:get() then
                return;
            elseif v395.state then
                return;
            else
                local l_target_0 = v395.target;
                if not l_target_0 then
                    return;
                else
                    local v397 = v395.spread and string.format("%.2f", v395.spread) or "-";
                    local v398 = v395.hitgroup ~= v395.wanted_hitgroup and ("(%s)"):format(l_l_v251_1_0[v395.wanted_hitgroup]) or "";
                    local v399 = v395.damage < v395.wanted_damage and ("(%s)"):format(v395.wanted_damage) or "";
                    local v400 = string.format("Hit \a[hit]%s\r's \a[hit]%s%s \rfor \a[hit]%s%s \rdamage (\a[hit]%s\r\194\176, bt:\a[hit]%s\r)", l_target_0:get_name(), l_l_v251_1_0[v395.hitgroup], v398, v395.damage, v399, v397, v395.backtrack);
                    local l_display_0 = v130.in_game.notify.display;
                    local v402 = table.concat({
                        [1] = l_display_0:get("On screen") and "s" or "", 
                        [2] = l_display_0:get("Console") and "c" or "", 
                        [3] = l_display_0:get("Events") and "e" or ""
                    });
                    local v403 = v130.general.options.shine:get() and v7.colors.hit or nil;
                    v69:add(v400, v402, "\a[hit]\f<check>", v403);
                    return;
                end;
            end;
        end;
        l_l_band_0_1.on_player_hurt = function(_, v405)
            -- upvalues: v130 (ref), l_l_v252_1_0 (ref), v7 (ref), v69 (ref)
            if not v130.in_game.notify:get() then
                return;
            else
                local v406 = entity.get_local_player();
                local v407 = entity.get(v405.attacker, true);
                local v408 = entity.get(v405.userid, true);
                if v407 ~= v406 or v408 == v406 then
                    return;
                elseif not v408 then
                    return;
                else
                    local l_weapon_0 = v405.weapon;
                    if not l_l_v252_1_0[l_weapon_0] then
                        return;
                    else
                        local v410 = {
                            hegrenade = "\a[hit]\f<bomb>", 
                            knife = "\a[hit]\f<knife-kitchen>", 
                            inferno = "\a[hit]\f<fire>"
                        };
                        local l_health_0 = v405.health;
                        local v412 = string.format("%s \a[hit]%s \rfor \a[hit]%s \rdamage" .. (l_health_0 > 0 and " (\a[hit]%s \rhp remaining)" or ""), l_l_v252_1_0[l_weapon_0], v408:get_name(), v405.dmg_health, l_health_0);
                        local l_display_1 = v130.in_game.notify.display;
                        local v414 = table.concat({
                            [1] = l_display_1:get("On screen") and "s" or "", 
                            [2] = l_display_1:get("Console") and "c" or "", 
                            [3] = l_display_1:get("Events") and "e" or ""
                        });
                        local v415 = v130.general.options.shine:get() and v7.colors.hit or nil;
                        v69:add(v412, v414, v410[l_weapon_0], v415);
                        return;
                    end;
                end;
            end;
        end;
        l_l_band_0_1.on_aimbot_miss = function(_, v417)
            -- upvalues: v130 (ref), l_l_v251_1_0 (ref), v7 (ref), v69 (ref)
            if not v130.in_game.notify:get() then
                return;
            elseif not v417.state then
                return;
            else
                local l_target_1 = v417.target;
                if not l_target_1 then
                    return;
                else
                    local v419 = v417.spread and string.format("%.2f", v417.spread) or "-";
                    local v420 = string.format("Missed at \a[miss]%s\r's \a[miss]%s \rdue to \a[miss]%s \r(\a[miss]%s\r\194\176, bt:\a[miss]%s\r)", l_target_1:get_name(), l_l_v251_1_0[v417.wanted_hitgroup], v417.state, v419, v417.backtrack);
                    local l_display_2 = v130.in_game.notify.display;
                    local v422 = table.concat({
                        [1] = l_display_2:get("On screen") and "s" or "", 
                        [2] = l_display_2:get("Console") and "c" or "", 
                        [3] = l_display_2:get("Events") and "e" or ""
                    });
                    local v423 = v130.general.options.shine:get() and v7.colors.miss or nil;
                    v69:add(v420, v422, "\a[miss]\f<xmark>", v423);
                    return;
                end;
            end;
        end;
        v1.player_hurt:set(function(v424)
            -- upvalues: l_l_band_0_1 (ref)
            l_l_band_0_1:on_player_hurt(v424);
        end);
        v1.aim_ack:set(function(v425)
            -- upvalues: l_l_band_0_1 (ref)
            l_l_band_0_1:on_aimbot_hit(v425);
            l_l_band_0_1:on_aimbot_miss(v425);
        end);
    end;
    l_v251_1 = {
        enable = v130.indicators.damage_indicator, 
        animated = v130.indicators.damage_indicator.animated
    };
    l_v252_1 = render.load_font("Verdana", 10, "ad");
    l_v253_1 = v130.indicators.dmg_x;
    l_v254_1 = v130.indicators.dmg_y;
    l_v255_1 = v7.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
    do
        local l_l_v252_1_1, l_l_v253_1_0, l_l_v254_1_0, l_l_v255_1_0 = l_v252_1, l_v253_1, l_v254_1, l_v255_1;
        l_v251_1.on_paint = function(_)
            -- upvalues: l_l_v255_1_0 (ref), l_v251_1 (ref), v52 (ref), l_l_v253_1_0 (ref), l_l_v254_1_0 (ref), l_l_v252_1_1 (ref), v105 (ref)
            local v431 = l_l_v255_1_0:get();
            if l_v251_1.animated:get() then
                v431 = math.round(v52.new("damage_indicator / value"):update(v431));
            end;
            if v431 < 1 then
                v431 = "A";
            elseif v431 > 100 then
                v431 = string.format("+%s", v431 - 100);
            end;
            local v432 = vector(l_l_v253_1_0:get(), l_l_v254_1_0:get());
            local v433 = tostring(v431);
            local v434 = render.measure_text(l_l_v252_1_1, nil, v433);
            render.text(l_l_v252_1_1, v432 + vector(2, 1), color(255, 255, 255, 255), nil, v433);
            v105:new("damage_indicator", l_l_v253_1_0, l_l_v254_1_0, v434.x + 4, v434.y + 4);
        end;
        v1.render:set(function()
            -- upvalues: l_v251_1 (ref)
            local v435 = entity.get_local_player();
            if not v435 or not v435:is_alive() then
                return;
            elseif not l_v251_1.enable:get() then
                return;
            else
                l_v251_1:on_paint();
                return;
            end;
        end);
    end;
    l_v252_1 = {};
    l_v253_1 = {};
    l_v254_1 = {};
    l_v255_1 = 0.005;
    local v436 = v52.new("indicators / global alpha");
    local v437 = v52.new("indicators / scope value");
    l_v253_1.FONT = render.load_font("C:/Windows/Fonts/Tahoma.ttf", 11, "adbu");
    l_v253_1.TEXT = l_gradient_0.text_animate("wingless\194\176", -3, {
        color(), 
        v130.general.accent_color:get()
    });
    l_v254_1.arraylist = {
        [1] = {
            text = "safe", 
            update = function(_)
                -- upvalues: v179 (ref)
                return v179:safe_head();
            end
        }, 
        [2] = {
            text = "spike", 
            update = function(_)
                -- upvalues: v128 (ref)
                return v128.misc.fake_latency:get() > 0;
            end
        }, 
        [3] = {
            text = "doubletap", 
            update = function(_)
                -- upvalues: l_l_lshift_0_0 (ref)
                return l_l_lshift_0_0("Double Tap");
            end, 
            color = function()
                -- upvalues: l_l_lshift_0_0 (ref)
                return color():lerp(color(255, 50, 50), l_l_lshift_0_0("Fake Duck") and 1 or 1 - rage.exploit:get());
            end
        }, 
        [4] = {
            text = "on-shot", 
            update = function(_)
                -- upvalues: l_l_lshift_0_0 (ref)
                return l_l_lshift_0_0("Hide Shots");
            end, 
            color = function()
                -- upvalues: l_l_lshift_0_0 (ref)
                return color():lerp(color(255, 50, 50), l_l_lshift_0_0("Double Tap") and 1 or l_l_lshift_0_0("Fake Duck") and 1 or 0);
            end
        }, 
        [5] = {
            text = "damage", 
            update = function(_)
                -- upvalues: l_l_lshift_0_0 (ref)
                return l_l_lshift_0_0("Min. Damage");
            end
        }, 
        [6] = {
            text = "duck", 
            update = function(_)
                -- upvalues: l_l_lshift_0_0 (ref)
                return l_l_lshift_0_0("Fake Duck");
            end
        }
    };
    do
        local l_l_v253_1_1, l_l_v254_1_1, l_l_v255_1_1, l_v436_0, l_v437_0 = l_v253_1, l_v254_1, l_v255_1, v436, v437;
        l_v252_1.draw = function(_, v450, v451)
            -- upvalues: v51 (ref), l_l_v255_1_1 (ref), l_l_v253_1_1 (ref), v130 (ref), l_l_v254_1_1 (ref), v52 (ref)
            if v450 < 0 then
                return;
            else
                local v452 = v51 * vector(0.5 + (v451 and l_l_v255_1_1 or 0), 0.525);
                local v453 = render.measure_text(l_l_v253_1_1.FONT, nil, l_l_v253_1_1.TEXT:get_animated_text());
                l_l_v253_1_1.TEXT:animate();
                l_l_v253_1_1.TEXT:set_colors({
                    color(), 
                    v130.indicators.crosshair_indicators.color:get()
                });
                local v454 = v451 and vector(0, 0) or vector(v453.x * 0.5, 0);
                local v455 = v452 - v454;
                if v130.general.options.shine:get() then
                    render.shadow(v455 + vector(0, v453.y * 0.5), v455 + vector(v453.x, v453.y * 0.5), color():alpha_modulate(255 * v450));
                end;
                render.text(l_l_v253_1_1.FONT, v452 - v454, color(255, 255, 255, 255 * v450), "", l_l_v253_1_1.TEXT:get_animated_text());
                v452.y = v452.y + v453.y;
                for v456 = 1, #l_l_v254_1_1.arraylist do
                    local v457 = l_l_v254_1_1.arraylist[v456];
                    v457.alpha = v457.alpha or 0;
                    v457.alpha = v52.new(("indicators / %s"):format(v456), 0):update(v457:update() and 1 or 0);
                    if v457.alpha >= 0.1 then
                        local l_text_1 = v457.text;
                        local v459 = v450 * v457.alpha;
                        local v460 = v457.color and v457.color() or color();
                        local v461 = render.measure_text(1, "s", l_text_1);
                        local v462 = v451 and vector(0, 0) or vector(v461.x * 0.5, 0);
                        local _ = v452 - v462;
                        if v130.general.options.shine:get() then

                        end;
                        local v464 = math.round(v52.new(("indicators clip / %s"):format(v456), 0):update(v457:update() and 100 or 0, 0.055)) / 100;
                        if v459 > 0.1 then
                            render.push_clip_rect(v452 - v462, v452 - v462 + vector(v461.x, v461.y * v464));
                            render.text(1, v452 - v462, v460:alpha_modulate(255 * v459), "s", l_text_1);
                            v452.y = v452.y + v461.y * v457.alpha;
                            render.pop_clip_rect();
                        end;
                    end;
                end;
                return;
            end;
        end;
        l_v252_1.on_paint = function(v465)
            -- upvalues: l_v436_0 (ref), l_v437_0 (ref)
            local v466 = entity.get_local_player();
            local v467 = v466 ~= nil and (v466:is_alive() and v466:get_player_weapon() or false);
            local v468 = (type(v467) ~= "boolean" and v467:get_weapon_info().weapon_type or 0) == 9;
            l_v436_0:update(v468 and 0.5 or v466 ~= nil and v466:is_alive() and 1 or 0, 0.095);
            l_v437_0:update(v466 ~= nil and v466:is_alive() and v466.m_bIsScoped and 1 or 0, 0.095);
            if l_v436_0:get() == 0 then
                return;
            else
                v465:draw(l_v436_0:get() - l_v437_0:get(), false);
                v465:draw(l_v437_0:get(), true);
                return;
            end;
        end;
        v1.render:set(function()
            -- upvalues: v130 (ref), l_v252_1 (ref)
            if not v130.indicators.crosshair_indicators:get() then
                return;
            else
                l_v252_1:on_paint();
                return;
            end;
        end);
    end;
    l_v253_1 = {};
    l_v254_1 = render.load_font("nl/wingless/Inter-SemiBold.ttf", 13 * render.get_scale(1), "a");
    l_v255_1 = render.load_font("Verdana", 15 * render.get_scale(1), "a");
    v436 = {
        offset = 0
    };
    v437 = 15;
    local v469 = 4;
    do
        local l_l_v254_1_2, l_l_v255_1_2 = l_v254_1, l_v255_1;
        do
            local l_v437_1, l_v469_0 = v437, v469;
            v436.add_field = function(v474, v475, v476, v477)
                -- upvalues: l_l_v254_1_2 (ref), l_v437_1 (ref), v130 (ref), l_v469_0 (ref)
                local v478 = render.measure_text(l_l_v254_1_2, "c", v476);
                v474.offset = v474.offset + l_v437_1 + v478.x;
                v475 = vector(v475.x - 5 - v474.offset, v475.y * render.get_scale(1));
                local v479 = v478 + 10 * vector(1, 1);
                if v130.general.options.blur:get() then
                    render.blur(v475, v475 + v479, 10, v477, 4);
                end;
                if v130.general.options.shadow:get() then
                    render.shadow(v475, v475 + v479, color(0, 204 * v477), nil, nil, l_v469_0);
                end;
                render.rect(v475, v475 + v479, color(32, 255 * v477), l_v469_0);
                render.rect_outline(v475, v475 + v479, color(50, 199 * v477), 1, l_v469_0);
                render.text(l_l_v254_1_2, v475 + v479 * 0.5 - vector(0, 1), color(255, 200 * v477), "c", v476);
            end;
            v436.on_render = function(v480)
                -- upvalues: v7 (ref), l_l_v254_1_2 (ref), v52 (ref), v130 (ref), v51 (ref), v129 (ref), l_v469_0 (ref)
                v480.offset = 0;
                local v481 = v7.string("\a[accent]\f<stars> \rwingless");
                local v482 = render.measure_text(l_l_v254_1_2, "c", v481);
                local v483 = v52.new("watermark / alpha"):update(v130.widgets.watermark:get());
                local v484 = vector(v51.x, v482.y + 26);
                local v485 = globals.is_connected and math.round(utils.net_channel().avg_latency[1] * 1000);
                if v130.widgets.watermark.fields:get("Time") then
                    v480:add_field(v484, v7.string("\a[accent]\f<clock> \r") .. common.get_date("%I:%M \aDEFAULT%p", common.get_unixtime()), v483);
                end;
                if v130.widgets.watermark.fields:get("Ping") and v485 then
                    v480:add_field(v484, v7.string("\a[accent]\f<wifi> \r") .. v485 .. "ms", v483);
                end;
                local v486 = v130.widgets.watermark.username:get();
                local v487 = #v486 > 0 and v486:match("^%s*$") == nil and v486 or v129.user.name;
                v480:add_field(v484, v7.string("\a[accent]\f<user> \r") .. v487, v483);
                local v488 = math.round(v52.new("watermark / width"):update(v480.offset < v482.x + 10 and v482.x + 10 or v480.offset));
                local v489 = vector(v51.x - v488 - 5, 10 * render.get_scale(1));
                local v490 = vector(v488 - 5, v482.y + 10);
                if v483 > 0.1 then
                    if v130.general.options.blur:get() then
                        render.blur(v489, v489 + v490, 10, v483, 4);
                    end;
                    if v130.general.options.shadow:get() then
                        render.shadow(v489, v489 + v490, color(0, 204 * v483), nil, nil, l_v469_0);
                    end;
                    render.rect(v489, v489 + v490, color(32, 255 * v483), l_v469_0);
                    render.rect_outline(v489, v489 + v490, color(50, 199 * v483), 1, l_v469_0);
                    render.text(l_l_v254_1_2, v489 + v490 * 0.5 - vector(0, 1), color(255, 200 * v483), "c", v481);
                end;
            end;
        end;
        v437 = {
            offset = 0
        };
        v469 = 24 * render.get_scale(1);
        local v491 = v51.x * 0.5 - v469 * 0.5;
        local v492 = 4;
        local v493 = 6;
        local v494 = v469 + v493;
        local l_keylist_x_0 = v130.widgets.keylist_x;
        local l_keylist_y_0 = v130.widgets.keylist_y;
        local l_v469_1 = v469;
        local l_v469_2 = v469;
        do
            local l_v469_3, l_v491_0, l_v492_0, l_v493_0, l_v494_0, l_l_keylist_x_0_0, l_l_keylist_y_0_0, l_l_v469_1_0, l_l_v469_2_0 = v469, v491, v492, v493, v494, l_keylist_x_0, l_keylist_y_0, l_v469_1, l_v469_2;
            v437.preview = function(v508, v509, v510)
                -- upvalues: l_v493_0 (ref), l_v494_0 (ref), v52 (ref), v130 (ref), v7 (ref), l_l_v254_1_2 (ref), l_v469_3 (ref), l_v492_0 (ref)
                local v511 = "Hotkey";
                local v512 = v509 + vector(v510 and -l_v493_0 or l_v494_0, 0);
                local v513 = v52.new("keybinds / " .. v511):update(v130.widgets.keylist:get() and #ui.get_binds() == 0 and v7.get_alpha());
                local v514 = vector(render.measure_text(l_l_v254_1_2, nil, v511).x, l_v469_3);
                local v515 = "Value";
                local v516 = vector(render.measure_text(l_l_v254_1_2, nil, v515).x, l_v469_3);
                local v517 = vector(math.ceil(v514.x + v516.x + l_v493_0 * 3), l_v469_3);
                local v518 = vector(math.ceil(v514.x + v516.x + l_v493_0 * 3), l_v469_3);
                local v519 = v509 + vector(v510 and -l_v493_0 or l_v494_0, math.ceil(v508.offset));
                if v510 then
                    v517.x = -v517.x;
                    v519.x = v519.x + v517.x;
                end;
                if v513 > 0.1 then
                    if v130.general.options.blur:get() then
                        render.blur(v519, v519 + v518, 10, v513, 4);
                    end;
                    if v130.general.options.shadow:get() then
                        render.shadow(v519, v519 + v518, color(0, 204 * v513), nil, nil, l_v492_0);
                    end;
                    render.rect(v512, v512 + v517, color(32, 204 * v513), l_v492_0, true);
                    render.rect_outline(v512, v512 + v517, color(50, 199 * v513), 1, l_v492_0, true);
                    render.text(l_l_v254_1_2, v512 + vector(v510 and -l_v493_0 - v514.x or l_v493_0, render.measure_text(l_l_v254_1_2, nil, v511).y * 0.5 - 1), color(255, 220 * v513), nil, v511);
                    render.text(l_l_v254_1_2, v512 + vector(v510 and -l_v493_0 * 2 - v516.x - v514.x or l_v493_0 * 2 + v514.x, render.measure_text(l_l_v254_1_2, nil, v515).y * 0.5 - 1), color("#E3E3E3"):alpha_modulate(110 * v513), nil, v515);
                end;
            end;
            v437.list = function(v520, v521, v522)
                -- upvalues: l_v493_0 (ref), l_v494_0 (ref), v52 (ref), v130 (ref), l_l_v254_1_2 (ref), l_v469_3 (ref), l_v492_0 (ref)
                local v523 = {};
                for _, v525 in pairs(ui.get_binds()) do
                    local l_name_0 = v525.name;
                    local v527 = v521 + vector(v522 and -l_v493_0 or l_v494_0, math.ceil(v520.offset));
                    local v528 = v52.new("keybinds / " .. l_name_0):update(v130.widgets.keylist:get() and v525.active);
                    local v529 = vector(render.measure_text(l_l_v254_1_2, nil, l_name_0).x, l_v469_3);
                    local v530 = type(v525.value) == "boolean" and ({
                        [1] = "Hold", 
                        [2] = "Toggle"
                    })[v525.mode] or type(v525.value) == "table" and table.concat(v525.value, ", ") or v525.value;
                    local v531 = vector(render.measure_text(l_l_v254_1_2, nil, v530).x, l_v469_3);
                    local v532 = vector(math.ceil(v529.x + v531.x + l_v493_0 * 3), l_v469_3);
                    local v533 = vector(math.ceil(v529.x + v531.x + l_v493_0 * 3), l_v469_3);
                    local v534 = v521 + vector(v522 and -l_v493_0 or l_v494_0, math.ceil(v520.offset));
                    if v522 then
                        v532.x = -v532.x;
                        v534.x = v534.x + v532.x;
                    end;
                    if v528 > 0.1 then
                        if v130.general.options.blur:get() then
                            render.blur(v534, v534 + v533, 1, v528, 4);
                        end;
                        if v130.general.options.shadow:get() then
                            render.shadow(v534, v534 + v533, color(0, 204 * v528), nil, nil, l_v492_0);
                        end;
                        render.rect(v527, v527 + v532, color(32, 204 * v528), l_v492_0, true);
                        render.rect_outline(v527, v527 + v532, color(50, 199 * v528), 1, l_v492_0, true);
                        render.text(l_l_v254_1_2, v527 + vector(v522 and -l_v493_0 - v529.x or l_v493_0, render.measure_text(l_l_v254_1_2, nil, l_name_0).y * 0.5 - 1), color(255, 220 * v528), nil, l_name_0);
                        render.text(l_l_v254_1_2, v527 + vector(v522 and -l_v493_0 * 2 - v531.x - v529.x or l_v493_0 * 2 + v529.x, render.measure_text(l_l_v254_1_2, nil, v530).y * 0.5 - 1), color("#E3E3E3"):alpha_modulate(110 * v528), nil, v530);
                        v520.offset = v520.offset + l_v494_0 * v528;
                    end;
                    v523 = {
                        active = v525.active, 
                        animate = v528
                    };
                end;
                return v523;
            end;
            v437.on_render = function(v535)
                -- upvalues: v7 (ref), l_l_keylist_x_0_0 (ref), l_l_keylist_y_0_0 (ref), l_v491_0 (ref), l_l_v255_1_2 (ref), v52 (ref), l_l_v469_1_0 (ref), l_v494_0 (ref), l_l_v469_2_0 (ref), l_v469_3 (ref), v130 (ref), v105 (ref), l_v492_0 (ref)
                local v536 = v7.string("\f<keyboard-brightness>");
                local l_accent_0 = v7.colors.accent;
                v535.offset = 0;
                local v538 = vector(l_l_keylist_x_0_0:get(), l_l_keylist_y_0_0:get());
                local v539 = false;
                if l_v491_0 < l_l_keylist_x_0_0:get() then
                    v539 = true;
                end;
                local v540 = v535:list(v538, v539);
                v535:preview(v538, v539);
                local v541 = render.measure_text(l_l_v255_1_2, nil, v536);
                local v542 = v52.new("keybinds / height"):update(l_l_v469_1_0 - l_v494_0 + v535.offset);
                local v543 = #ui.get_binds() == 1 and v540.animate or #ui.get_binds() > 0 or v7.get_alpha();
                local v544 = vector(l_l_v469_2_0, math.max(l_v469_3, math.ceil(v542)));
                local v545 = v52.new("keybinds / alpha"):update(v130.widgets.keylist:get() and v543);
                if v545 > 0.1 then
                    v105:new("keybinds", l_l_keylist_x_0_0, l_l_keylist_y_0_0, l_l_v469_2_0, v544.y);
                end;
                local v546 = v52.new("keybinds / rotation");
                local l_v546_0 = v546;
                v546 = v546.update;
                local v548;
                if #ui.get_binds() > 1 then
                    v548 = v539 and 0 or 180;
                else
                    v548 = 90;
                end;
                v546 = v546(l_v546_0, v548);
                if v545 > 0.1 then
                    if v130.general.options.blur:get() then
                        render.blur(v538, v538 + v544, 10, v545, 4);
                    end;
                    if v130.general.options.shadow:get() then
                        render.shadow(v538, v538 + v544, color(0, 204 * v545), nil, nil, l_v492_0);
                    end;
                    render.rect(v538, v538 + v544, color(32, 220 * v545), l_v492_0);
                    render.rect_outline(v538, v538 + v544, color(50, 199 * v545), 1, l_v492_0);
                    render.push_rotation(math.floor(v546 + 0.5));
                    render.text(l_l_v255_1_2, v538 + (v544 - v541) * 0.5 - vector(0, 1), l_accent_0:alpha_modulate(200 * v545), nil, v536);
                    render.pop_rotation();
                end;
            end;
        end;
        v469 = {};
        v491 = 36 * render.get_scale(1);
        v492 = 4;
        v493 = v130.widgets.slowdown_x;
        v494 = v130.widgets.slowdown_y;
        l_keylist_x_0 = v491;
        l_keylist_y_0 = v491;
        do
            local l_v492_1, l_v493_1, l_v494_1, l_l_keylist_x_0_1, l_l_keylist_y_0_1 = v492, v493, v494, l_keylist_x_0, l_keylist_y_0;
            v469.on_render = function(_)
                -- upvalues: v52 (ref), l_l_v254_1_2 (ref), l_l_keylist_y_0_1 (ref), l_v493_1 (ref), l_v494_1 (ref), l_l_keylist_x_0_1 (ref), v130 (ref), v51 (ref), v105 (ref), l_v492_1 (ref)
                local v555 = entity.get_local_player();
                local v556 = v555 and v555:is_alive() and v555.m_flVelocityModifier or 1;
                local v557 = v52.new("slowdown / text"):update((1 - v556) * 100);
                v557 = math.floor(v557 + 0.5);
                local v558 = string.format("Max velocity decreased by \a%s%s\aDEFAULT%%", color():lerp(color(255, 100, 100), v557 / 100):to_hex(), v557);
                local v559 = render.measure_text(l_l_v254_1_2, "c", v558);
                local v560 = v52.new("slowdown / width"):update(l_l_keylist_y_0_1 + v559.x);
                local v561 = vector(l_v493_1:get(), l_v494_1:get());
                local v562 = vector(v560, l_l_keylist_x_0_1);
                v130.widgets.slowdown_x:set(v51.x / 2 - v562.x / 2);
                local v563 = v52.new("slowdown / alpha"):update(v130.widgets.slowdown:get() and (ui.get_alpha() > 0 or v557 > 0));
                if v563 > 0.1 then
                    v105:new("slowdown", l_v493_1, l_v494_1, v560, l_l_keylist_x_0_1, nil, true);
                    if v130.general.options.blur:get() then
                        render.blur(v561, v561 + v562, 10, v563, l_v492_1);
                    end;
                    if v130.general.options.shadow:get() then
                        render.shadow(v561, v561 + v562, color(0, 204 * v563), nil, nil, l_v492_1);
                    end;
                    render.rect(v561, v561 + v562, color(32, 220 * v563), l_v492_1);
                    render.rect_outline(v561, v561 + v562, color(50, 199 * v563), 1, l_v492_1);
                    render.text(l_l_v254_1_2, v561 + v562 * 0.5, color(255, 200 * v563), "c", v558);
                end;
            end;
        end;
        v491 = {};
        v492 = 36 * render.get_scale(1);
        v493 = 4;
        v494 = v130.widgets.net_graph_x;
        l_keylist_x_0 = v130.widgets.net_graph_y;
        l_keylist_y_0 = v492;
        l_v469_1 = v492;
        do
            local l_v493_2, l_v494_2, l_l_keylist_x_0_2, l_l_keylist_y_0_2, l_l_v469_1_1 = v493, v494, l_keylist_x_0, l_keylist_y_0, l_v469_1;
            v491.on_render = function(_)
                -- upvalues: l_l_v469_1_1 (ref), l_l_keylist_y_0_2 (ref), v7 (ref), v68 (ref), l_v494_2 (ref), l_l_keylist_x_0_2 (ref), v52 (ref), v130 (ref), v105 (ref), l_v493_2 (ref), l_l_v254_1_2 (ref)
                local l_l_l_v469_1_1_0 = l_l_v469_1_1;
                local l_l_l_keylist_y_0_2_0 = l_l_keylist_y_0_2;
                local v572 = globals.is_connected and globals.is_in_game;
                local v573 = utils.net_channel();
                local v574 = v572 and math.round(v573.avg_latency[1] * 1000) or 0;
                local v575 = v572 and v573.loss[1] or 0;
                local v576 = v572 and string.format("%.1f", v573.choke[1]) or 0;
                local v577 = v572 and 1 / globals.tickinterval or 0;
                local v578 = v572 and v573:get_server_info().frame_time or 0;
                local v579 = {
                    [1] = v7.string(("fps: \a[accent]%s  \r%s"):format(v68:get_fps(), v572 and string.format("ping: \a[accent]%s \rms", v574) or "not connected")), 
                    [2] = v572 and v7.string(("loss: \a[accent]%s\r%%   choke: \a[accent]%s\r%%"):format(math.round(v575), v576)) or nil, 
                    [3] = v572 and v7.string(("tick: \a[accent]%.1f   \rsv: \a[accent]%.1f"):format(v577, v578)) or nil
                };
                local v580 = vector(l_v494_2:get(), l_l_keylist_x_0_2:get());
                local v581 = v52.new("net graph / height");
                local v582 = v52.new("net graph / width");
                local v583 = vector(math.round(20 + v582:get()), math.round(v581:get()));
                local v584 = 0;
                local v585 = v52.new("net graph / alpha"):update(v130.widgets.net_graph:get());
                if v585 > 0.1 then
                    v105:new("net graph", l_v494_2, l_l_keylist_x_0_2, v583.x, v583.y);
                    if v130.general.options.blur:get() then
                        render.blur(v580, v580 + v583, 10, v585, l_v493_2);
                    end;
                    if v130.general.options.shadow:get() then
                        render.shadow(v580, v580 + v583, color(0, 204 * v585), nil, nil, l_v493_2);
                    end;
                    render.rect(v580, v580 + v583, color(32, 220 * v585), l_v493_2);
                    render.rect_outline(v580, v580 + v583, color(50, 199 * v585), 1, l_v493_2);
                    for v586, v587 in pairs(v579) do
                        local v588 = render.measure_text(l_l_v254_1_2, "c", v587);
                        if l_l_l_v469_1_1_0 < v588.x then
                            l_l_l_v469_1_1_0 = v588.x;
                        end;
                        if v586 > 1 then
                            l_l_l_keylist_y_0_2_0 = l_l_l_keylist_y_0_2_0 + v588.y;
                        end;
                        render.text(l_l_v254_1_2, v580 + vector(v583.x * 0.5, (v572 and 5 or 10) + v583.y * 0.2 + v584), color(255, 200 * v585), "c", v587);
                        v584 = v584 + v588.y;
                    end;
                    v582:update(l_l_l_v469_1_1_0);
                    v581:update(l_l_l_keylist_y_0_2_0);
                end;
            end;
        end;
        l_v253_1.watermark = v436;
        l_v253_1.keybinds = v437;
        l_v253_1.slowdown = v469;
        l_v253_1.net_graph = v491;
        v1.mouse_input:set(function()
            -- upvalues: v7 (ref)
            return v7.get_alpha() < 1;
        end);
    end;
    l_v254_1 = {};
    l_v255_1 = render.load_font("Calibri", 23, "bda");
    v436 = vector(29.5, v51.y * 0.683);
    v437 = {};
    do
        local l_l_v255_1_3, l_v436_1, l_v437_2 = l_v255_1, v436, v437;
        l_v254_1.add = function(_, v593, v594)
            -- upvalues: l_l_v255_1_3 (ref), l_v437_2 (ref)
            if not v594 then
                v594 = color(255, 255, 255, 255);
            end;
            v594.a = 204;
            local v595 = render.measure_text(l_l_v255_1_3, "", v593);
            table.insert(l_v437_2, {
                text = v593, 
                color = v594, 
                measure = v595
            });
        end;
        l_v254_1.render = function(_)
            -- upvalues: l_v437_2 (ref), l_v436_1 (ref), l_l_v255_1_3 (ref)
            for v597, v598 in ipairs(l_v437_2) do
                v597 = v597 - 1;
                local l_text_2 = v598.text;
                local l_color_0 = v598.color;
                local l_measure_0 = v598.measure;
                local v602 = l_v436_1.x + l_measure_0.x / 2;
                local v603 = vector(0, l_v436_1.y - 40.5 * v597);
                render.gradient(v603 - vector(0, 8), v603 + vector(v602, 25), color(0, 0, 0, 0), color(0, 0, 0, 56), color(0, 0, 0, 0), color(0, 0, 0, 56));
                v603 = v603 + vector(v602, 0);
                render.gradient(v603 - vector(0, 8), v603 + vector(v602, 25), color(0, 0, 0, 56), color(0, 0, 0, 0), color(0, 0, 0, 56), color(0, 0, 0, 0));
                render.text(l_l_v255_1_3, l_v436_1 - vector(0, 41 * v597), l_color_0, "", l_text_2);
            end;
            l_v437_2 = {};
        end;
        v1.render:set(function()
            -- upvalues: l_v254_1 (ref)
            local _ = entity.get_local_player();
            l_v254_1:render();
        end);
        v1.render:set(function()
            -- upvalues: v130 (ref), v128 (ref), l_v254_1 (ref), l_l_lshift_0_0 (ref)
            local l_skeet_indicators_0 = v130.indicators.skeet_indicators;
            if v128.anti_aim.fake_duck:get() and l_skeet_indicators_0:get("Fake Duck") then
                l_v254_1:add("DUCK");
            elseif v128.rage.double_tap:get() and l_skeet_indicators_0:get("Double Tap") then
                l_v254_1:add("DT", color(255):lerp(color(255, 0, 0), 1 - rage.exploit:get()));
            elseif v128.rage.hide_shots:get() and l_skeet_indicators_0:get("Hide Shots") then
                l_v254_1:add("OSAA");
            end;
            if l_l_lshift_0_0("Safe Points") and l_skeet_indicators_0:get("Safe Points") then
                l_v254_1:add("SAFE");
            end;
            if l_l_lshift_0_0("Body Aim") and l_skeet_indicators_0:get("Body Aim") then
                l_v254_1:add("BODY");
            end;
            if l_l_lshift_0_0("Min. Damage") and l_skeet_indicators_0:get("Min. Damage") then
                l_v254_1:add("MD");
            end;
            if v128.rage.dormant_aimbot:get() and l_skeet_indicators_0:get("Dormant Aimbot") then
                l_v254_1:add("DA");
            end;
        end);
    end;
    l_v255_1 = 0;
    v140.aspect_ratio = function(_)
        -- upvalues: l_v255_1 (ref), v130 (ref)
        if l_v255_1 ~= v130.in_game.aspect_ratio.evaluate:get() then
            cvar.r_aspectratio:float(v130.in_game.aspect_ratio.evaluate:get() / 100, true);
            l_v255_1 = v130.in_game.aspect_ratio.evaluate:get();
        end;
    end;
    v436 = nil;
    v437 = cvar.cl_righthand:int();
    do
        local l_v437_3 = v437;
        v140.knife_opposite_hand = function(_)
            -- upvalues: v130 (ref), l_v437_3 (ref)
            local l_viewmodel_0 = v130.in_game.viewmodel;
            local v610 = entity.get_local_player();
            if not v610 or not v610:is_alive() then
                return;
            else
                local v611 = v610:get_player_weapon();
                if not v611 then
                    return;
                else
                    local v612 = v611:get_classname();
                    if not v612 then
                        return;
                    else
                        if not v612 == "CKnife" then
                            l_v437_3 = cvar.cl_righthand:int();
                        end;
                        local function v614(v613)
                            return v613 == 0 and 1 or 0;
                        end;
                        if l_viewmodel_0.knife_opposite_hand:get() then
                            cvar.cl_righthand:int(v612 == "CKnife" and v614(l_v437_3) or l_v437_3);
                        end;
                        return;
                    end;
                end;
            end;
        end;
        v140.override_viewmodel = function(_)
            -- upvalues: v130 (ref)
            local l_viewmodel_1 = v130.in_game.viewmodel;
            if not l_viewmodel_1:get() then
                return;
            else
                cvar.viewmodel_fov:float(l_viewmodel_1.fov:get() / 10, true);
                cvar.viewmodel_offset_x:float(l_viewmodel_1.x:get() / 10, true);
                cvar.viewmodel_offset_y:float(l_viewmodel_1.y:get() / 10, true);
                cvar.viewmodel_offset_z:float(l_viewmodel_1.z:get() / 10, true);
                return;
            end;
        end;
    end;
    v437 = {};
    v469 = v128.visuals.scope_overlay;
    do
        local l_v469_4 = v469;
        v437.on_render = function(_)
            -- upvalues: v51 (ref), v52 (ref), v130 (ref), l_v469_4 (ref)
            local v619 = entity.get_local_player();
            local v620 = v51 * 0.5;
            local v621 = v52.new("custom scope"):update(v130.in_game.custom_scope:get() and v619 and v619:is_alive() and v619.m_bIsScoped and 1 or 0);
            l_v469_4:override(v130.in_game.custom_scope:get() and "Remove All" or nil);
            if v621 < 0.11 then
                return;
            else
                local v622 = v130.in_game.custom_scope.offset:get() * v621;
                local v623 = v130.in_game.custom_scope.length:get() * v621;
                local v624 = v52.new("custom scope / alpha"):update(common.is_button_down(9) and 120 or 255);
                local v625 = v130.in_game.custom_scope.inverter.color:get();
                local v626 = v130.in_game.custom_scope.inverter:get();
                local v627 = v625:alpha_modulate(v626 and 0 or math.round(v624));
                local v628 = v625:alpha_modulate(v626 and math.round(255) or 0);
                render.gradient(v620 + vector(v622 + 1, 0), v620 + vector(v622 + v623 + 1, 1), v627, v628, v627, v628);
                render.gradient(v620 - vector(v622, 0), v620 - vector(v622 + v623, -1), v627, v628, v627, v628);
                render.gradient(v620 + vector(0, v622 + 1), v620 + vector(1, v622 + v623 + 1), v627, v627, v628, v628);
                render.gradient(v620 - vector(0, v622), v620 - vector(-1, v622 + v623), v627, v627, v628, v628);
                return;
            end;
        end;
        v1.render:set(function()
            -- upvalues: v437 (ref)
            v437:on_render();
        end);
    end;
    v469 = {};
    local v629 = {};
    do
        local l_v629_0 = v629;
        v469.create = function(_, v632)
            -- upvalues: v52 (ref), l_v629_0 (ref)
            local v633 = {
                time = 0.5, 
                position = v632, 
                real_time = globals.realtime, 
                animate = v52.new(string.format("shot markers / %s", globals.absoluteframetime)), 
                radius = v52.new(string.format("shot markers / radius[%s]", globals.absoluteframetime))
            };
            l_v629_0[#l_v629_0 + 1] = v633;
        end;
        v469.on_render = function(_)
            -- upvalues: l_v629_0 (ref)
            local l_realtime_1 = globals.realtime;
            for _, v637 in ipairs(l_v629_0) do
                local v638 = l_realtime_1 < v637.real_time + v637.time;
                local v639 = v637.animate:update(v638, 0.05);
                local v640 = v637.radius:update(1, 0.0095);
                if v639 > 0.11 then
                    render.circle_outline(v637.position:to_screen(), color(255, 255 * v639), 10 * v640, 0, 1, 1);
                end;
            end;
            for v641, v642 in ipairs(l_v629_0) do
                local v643 = l_realtime_1 < v642.real_time + v642.time;
                if v642.animate:get() < 0.1 and not v643 then
                    table.remove(l_v629_0, v641);
                end;
            end;
        end;
        v1.aim_fire:set(function(v644)
            -- upvalues: v130 (ref), v469 (ref)
            local l_aim_0 = v644.aim;
            if not v130.indicators.shot_markers:get() then
                return;
            else
                v469:create(l_aim_0);
                return;
            end;
        end);
        v1.render:set(function()
            -- upvalues: v469 (ref)
            v469:on_render();
        end);
    end;
    v629 = v7.find("Visuals", "World", "Main", "Override Zoom");
    v140.animate_zoom_scope = function(_)
        -- upvalues: v52 (ref), v629 (ref), v130 (ref)
        local v647 = entity.get_local_player();
        if not v647 or not v647:is_alive() then
            return;
        else
            local v648 = v52.new("animate scope zoom"):update(v647.m_bIsScoped and v629:get() or 0, 0.075);
            if v130.in_game.animate_scope_zoom:get() then
                v629:override(v648);
            else
                v629:override(nil);
            end;
            return;
        end;
    end;
    local v658 = {
        post_clientside_animation = function(_, v650)
            -- upvalues: v130 (ref), v128 (ref), v179 (ref), l_ffi_0 (ref)
            local l_animation_breaker_0 = v130.in_game.animation_breaker;
            local v652 = entity.get_local_player();
            if v650:get_index() ~= v652:get_index() then
                return;
            else
                local v653 = v652[0];
                v128.anti_aim.leg_movement:override(nil);
                if not l_animation_breaker_0:get() then
                    return;
                else
                    local v654 = v179:get_statement();
                    local v655 = l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v653) + 10640)[0];
                    local v656 = v652:get_anim_state();
                    local v657 = table.concat(l_animation_breaker_0.other:get(), ", ");
                    if v654:find("In Air") then
                        if l_animation_breaker_0.legs_in_air:get() == "Static" then
                            v652.m_flPoseParameter[6] = 1;
                        elseif l_animation_breaker_0.legs_in_air:get() == "Walking" then
                            v655[6].m_flWeight = 1.5;
                        end;
                    elseif l_animation_breaker_0.legs_on_ground:get() == "Follow direction" then
                        v128.anti_aim.leg_movement:override("Sliding");
                        v652.m_flPoseParameter[0] = 1;
                    elseif l_animation_breaker_0.legs_on_ground:get() == "Moon walk" then
                        v128.anti_aim.leg_movement:override("Walking");
                        v652.m_flPoseParameter[7] = 0;
                    elseif l_animation_breaker_0.legs_on_ground:get() == "Jitter" then
                        v128.anti_aim.leg_movement:override("Sliding");
                        v652.m_flPoseParameter[0] = utils.random_float(0.1, 0.9);
                    end;
                    if v657:find(1) and v656.landing and not v656.landed_on_ground_this_frame then
                        v652.m_flPoseParameter[12] = 0.5;
                    end;
                    if v657:find(2) then
                        v655[7].m_flWeight = 1;
                        v655[7].m_nSequence = 224;
                        v655[7].m_flCycle = 0;
                    end;
                    if v657:find(3) then
                        v650.m_flPoseParameter[3] = math.random();
                        v650.m_flPoseParameter[7] = math.random();
                        v650.m_flPoseParameter[6] = math.random();
                    end;
                    return;
                end;
            end;
        end
    };
    v1.post_update_clientside_animation:set(function(v659)
        -- upvalues: v658 (ref)
        v658:post_clientside_animation(v659);
    end);
    v1.pre_render:set(function()
        -- upvalues: v140 (ref)
        v140:knife_opposite_hand();
    end);
    v1.net_update_end:set(function()
        -- upvalues: v140 (ref)
        v140:aspect_ratio();
        v140:override_viewmodel();
    end);
    v1.render:set(function()
        -- upvalues: v140 (ref), l_v253_1 (ref)
        v140:animate_zoom_scope();
        l_v253_1.watermark:on_render();
        l_v253_1.keybinds:on_render();
        l_v253_1.slowdown:on_render();
        l_v253_1.net_graph:on_render();
    end);
end;
l_lshift_0 = {};
l_band_0 = {};
v251 = {
    High = 2, 
    Medium = 1.5, 
    Low = 1, 
    ["-"] = -1
};
v252 = function(v660)
    return v660 and v660:is_alive();
end;
do
    local l_l_band_0_2, l_v252_2, l_v253_2 = l_band_0, v252, v253;
    do
        local l_v251_2, l_l_v252_2_0, l_l_v253_2_0 = v251, l_v252_2, l_v253_2;
        l_l_v253_2_0 = function(v667, v668)
            -- upvalues: l_l_v252_2_0 (ref)
            if not l_l_v252_2_0(v667) or not l_l_v252_2_0(v668) then
                return 0;
            else
                local v669 = v667:get_eye_position();
                local v670 = v668:get_eye_position();
                return utils.trace_bullet(v667, v669, v670) or 0;
            end;
        end;
        l_l_band_0_2.since = -1;
        l_l_band_0_2.is_threat_present = function(_)
            -- upvalues: l_l_v252_2_0 (ref), l_l_v253_2_0 (ref)
            local v672 = entity.get_local_player();
            if not l_l_v252_2_0(v672) then
                return false;
            else
                local v673 = false;
                entity.get_players(true, false, function(v674)
                    -- upvalues: l_l_v252_2_0 (ref), l_l_v253_2_0 (ref), v672 (ref), v673 (ref)
                    if not l_l_v252_2_0(v674) then
                        return;
                    else
                        if l_l_v253_2_0(v672, v674) + l_l_v253_2_0(v674, v672) > 0 then
                            v673 = true;
                        end;
                        return;
                    end;
                end);
                return v673;
            end;
        end;
        l_l_band_0_2.execute_teleport = function(v675, v676)
            local l_curtime_1 = globals.curtime;
            if l_curtime_1 <= v675.since then
                return;
            else
                rage.exploit:force_charge();
                rage.exploit:force_teleport();
                v675.since = l_curtime_1 + v676 / 10;
                return;
            end;
        end;
        l_l_band_0_2.on_createmove = function(v678)
            -- upvalues: l_l_v252_2_0 (ref), v130 (ref), v179 (ref), l_v251_2 (ref)
            local v679 = entity.get_local_player();
            if not l_l_v252_2_0(v679) then
                return;
            else
                local l_auto_teleport_0 = v130.rage.auto_teleport;
                local v681 = not l_auto_teleport_0.only_in_air:get() or v179:get_statement():find("In Air");
                if l_auto_teleport_0:get() and not v130.rage.force_teleport_exploit:get() and v678:is_threat_present() and v681 then
                    v678:execute_teleport(l_v251_2[l_auto_teleport_0.delay:get()]);
                end;
                return;
            end;
        end;
        v1.createmove:set(function()
            -- upvalues: l_l_band_0_2 (ref)
            l_l_band_0_2:on_createmove();
        end);
        v1.render:set(function()
            -- upvalues: l_l_band_0_2 (ref)
            if not globals.is_connected or not globals.is_in_game then
                l_l_band_0_2.since = -1;
            end;
        end);
    end;
    l_lshift_0.air_exploit = function(_, _)
        -- upvalues: v179 (ref), v130 (ref), v128 (ref)
        local v684 = v179:get_statement();
        if v130.rage.force_teleport_exploit:get() and v684:find("In Air") then
            v128.fake_lag.limit:override(17);
            v128.fake_lag.variability:override(0);
            v128.rage.lag_options:override("On Peek");
            cvar.sv_maxusrcmdprocessticks:int(19);
            if globals.tickcount % 2 == 1 then
                v128.anti_aim.fake_duck:override(true);
            else
                v128.anti_aim.fake_duck:override(false);
            end;
        else
            v128.fake_lag.limit:override();
            v128.fake_lag.variability:override();
            v128.anti_aim.fake_duck:override();
            cvar.sv_maxusrcmdprocessticks:int(16);
        end;
    end;
    l_lshift_0.nade_throw_fix = function(_)
        -- upvalues: v130 (ref), v128 (ref)
        local v686 = v130.rage.fix_throw:get();
        local v687 = entity.get_local_player();
        if not v687 or not v687:is_alive() then
            return;
        else
            local v688 = v687:get_player_weapon();
            if not v688 then
                return;
            else
                local v689 = v688:get_weapon_info().weapon_type == 9;
                local l_quick_switch_0 = v128.rage.quick_switch;
                local l_l_quick_switch_0_0 = l_quick_switch_0;
                l_quick_switch_0 = l_quick_switch_0.override;
                if not v686 or v689 then

                end;
                l_quick_switch_0(l_l_quick_switch_0_0, (not v686 or not v689) and nil);
                if v686 and v689 then
                    v128.rage.lag_options:override("Disabled");
                end;
                return;
            end;
        end;
    end;
    l_lshift_0.grenade_release = function(_, v693)
        -- upvalues: v130 (ref)
        local v694 = entity.get_local_player();
        if not v694 or not v694:is_alive() then
            return;
        elseif not v130.rage.grenade_release:get() then
            return;
        elseif v693.type ~= "Frag" then
            return;
        else
            local v695 = v694:get_player_weapon();
            if not v695.m_bPinPulled then
                return;
            elseif v130.rage.grenade_release.damage:get() > v693.damage then
                return;
            else
                if v695.m_flThrowStrength == 1 then
                    utils.console_exec("+attack");
                    utils.execute_after(0.1, function()
                        utils.console_exec("-attack");
                    end);
                else
                    utils.console_exec("+attack2");
                    utils.execute_after(0.1, function()
                        utils.console_exec("-attack2");
                    end);
                end;
                return;
            end;
        end;
    end;
    v251 = {};
    l_v252_2 = -1;
    do
        local l_l_v252_2_1, l_v254_2, l_v255_2 = l_v252_2, v254, v255;
        l_v253_2 = function(_)
            -- upvalues: l_l_v252_2_1 (ref)
            l_l_v252_2_1 = globals.tickcount;
        end;
        l_v254_2 = 5;
        l_v255_2 = 1;
        local v700 = {
            [1] = {
                hitbox = "Head", 
                scale = 3, 
                vec = vector(0, 0, 58)
            }, 
            [2] = {
                hitbox = "Chest", 
                scale = 6, 
                vec = vector(0, 0, 50)
            }, 
            [3] = {
                hitbox = "Stomach", 
                scale = 5, 
                vec = vector(0, 0, 40)
            }
        };
        local function v704(v701, v702)
            for v703 = 1, #v701 do
                if v701[v703] == v702 then
                    return true;
                end;
            end;
            return false;
        end;
        local function v709()
            local v705 = {};
            local v706 = entity.get_player_resource();
            for v707 = 1, globals.max_players do
                local v708 = entity.get(v707);
                if v708 and v706.m_bConnected[v707] and v708:is_enemy() and v708:is_dormant() then
                    table.insert(v705, v708);
                end;
            end;
            return v705;
        end;
        local function v716(v710, v711, v712)
            local v713 = v710:to(v711):angles();
            local v714 = math.rad(v713.y + 90);
            local v715 = vector(math.cos(v714), math.sin(v714), 0) * v712;
            return {
                [1] = {
                    text = "Middle", 
                    vec = v711
                }, 
                [2] = {
                    text = "Left", 
                    vec = v711 + v715
                }, 
                [3] = {
                    text = "Right", 
                    vec = v711 - v715
                }
            };
        end;
        local function v723(v717, v718, v719, v720)
            local v721, v722 = utils.trace_bullet(v717, v718, v719, v720);
            if v722 and v722.entity and v722.entity:is_player() and not v722.entity:is_enemy() then
                return 0, v722;
            else
                return v721, v722;
            end;
        end;
        local v724 = v7.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
        local function v762(v725)
            -- upvalues: v130 (ref), l_l_v252_2_1 (ref), v709 (ref), l_v255_2 (ref), v724 (ref), v700 (ref), v704 (ref), v716 (ref), v723 (ref), l_v254_2 (ref)
            local v726 = entity.get_local_player();
            if not v726 or not v726:is_alive() or not v130.rage.dormant_aimbot:get() then
                return;
            else
                local v727 = v726:get_player_weapon();
                if not v727 then
                    return;
                else
                    local v728 = v727:get_weapon_info();
                    if not v728 then
                        return;
                    else
                        local v729 = v727:get_inaccuracy();
                        if not v729 then
                            return;
                        else
                            local l_tickcount_0 = globals.tickcount;
                            if l_tickcount_0 < l_l_v252_2_1 then
                                return;
                            else
                                local v731 = v726:get_anim_state();
                                if not v731 or v725.in_jump and not v731.on_ground then
                                    return;
                                else
                                    local l_weapon_type_0 = v728.weapon_type;
                                    if l_weapon_type_0 < 1 or l_weapon_type_0 > 6 or v727.m_iClip1 <= 0 then
                                        return;
                                    else
                                        local v733 = v709();
                                        local v734 = v130.rage.dormant_aimbot.hitboxes:get();
                                        l_v255_2 = l_tickcount_0 % #v733 ~= 0 and l_v255_2 + 1 or 1;
                                        local v735 = v733[l_v255_2];
                                        if not v735 then
                                            return;
                                        else
                                            local v736 = v735:get_bbox();
                                            local v737 = v735:get_origin();
                                            local l_m_flDuckAmount_0 = v735.m_flDuckAmount;
                                            local v739 = v130.rage.dormant_aimbot.accuracy:get();
                                            local v740 = v130.rage.dormant_aimbot.damage:get() or v724:get();
                                            if v740 > 100 then
                                                v740 = v740 - 100 + v735.m_iHealth;
                                            end;
                                            local v741 = {};
                                            for _, v743 in ipairs(v700) do
                                                local l_vec_0 = v743.vec;
                                                if v743.hitbox == "Head" then
                                                    l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                                elseif v743.hitbox == "Chest" then
                                                    l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                                end;
                                                if #v734 == 0 or v704(v734, v743.hitbox) then
                                                    table.insert(v741, {
                                                        vec = l_vec_0, 
                                                        scale = v743.scale, 
                                                        hitbox = v743.hitbox
                                                    });
                                                end;
                                            end;
                                            local v745 = v726:get_eye_position();
                                            local l_current_0 = v726:get_simulation_time().current;
                                            if (not v728.is_revolver or v727.m_flNextPrimaryAttack >= l_current_0) and math.max(v726.m_flNextAttack, v727.m_flNextPrimaryAttack, v727.m_flNextSecondaryAttack) >= l_current_0 or math.floor(v736.alpha * 100) + 5 <= v739 then
                                                return;
                                            else
                                                local v747 = nil;
                                                local v748 = nil;
                                                for _, v750 in ipairs(v741) do
                                                    local v751 = v716(v745, v737 + v750.vec, v750.scale);
                                                    for _, v753 in ipairs(v751) do
                                                        local v755, v756 = v723(v726, v745, v753.vec, function(v754)
                                                            -- upvalues: v735 (ref)
                                                            return v754 == v735;
                                                        end);
                                                        if v756 and not v756:is_visible() and v755 ~= 0 and v740 < v755 then
                                                            local l_vec_1 = v753.vec;
                                                            v748 = v755;
                                                            v747 = l_vec_1;
                                                            break;
                                                        end;
                                                    end;
                                                    if v747 then
                                                        break;
                                                    end;
                                                end;
                                                if not v747 or not v748 then
                                                    return;
                                                else
                                                    local v758 = v745:to(v747):angles();
                                                    v725.block_movement = 1;
                                                    if v130.rage.dormant_aimbot.auto_scope:get() then
                                                        local v759 = not v725.in_jump and v731.on_ground;
                                                        local v760 = v726.m_bIsScoped or v726.m_bResumeZoom;
                                                        local v761 = v728.weapon_type == l_v254_2;
                                                        if not v760 and v761 and v759 then
                                                            v725.in_attack2 = true;
                                                        end;
                                                    end;
                                                    if v729 < 0.01 then
                                                        v725.view_angles = v758;
                                                        v725.in_attack = true;
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
        v1.round_start:set(l_v253_2);
        v1.createmove:set(v762);
    end;
    l_v252_2 = {
        get_weapon_type = function(_)
            local v764 = entity.get_local_player();
            if not v764 or not v764:is_alive() then
                return;
            else
                local v765 = v764:get_player_weapon();
                if not v765 then
                    return;
                else
                    local v766 = v765:get_weapon_info();
                    local v767 = ({
                        [0] = "Global", 
                        [1] = "Pistols", 
                        [2] = "SMGs", 
                        [3] = "Rifles", 
                        [4] = "Shotguns", 
                        [5] = "Snipers", 
                        [6] = "Rifles", 
                        [7] = "Global", 
                        [8] = "che za huinya blyat", 
                        [9] = "Global", 
                        [10] = "unknown"
                    })[v766.weapon_type];
                    local v768 = v766.console_name:gsub("weapon_", "");
                    local v769 = {
                        deagle = "Desert Eagle", 
                        taser = "Taser", 
                        revolver = "R8 Revolver", 
                        scar20 = "Auto", 
                        awp = "AWP", 
                        g3sg1 = "Auto", 
                        ssg08 = "SSG-08", 
                        sg556 = "AUG/SG 553", 
                        negev = "Machineguns", 
                        aug = "AUG/SG 553", 
                        m4a1_silencer = "M4A1/M4A4", 
                        m249 = "Machineguns", 
                        m4a1 = "M4A1/M4A4", 
                        ak47 = "AK47"
                    };
                    if v769[v768] then
                        v767 = v769[v768];
                    end;
                    return v767;
                end;
            end;
        end
    };
    l_v253_2 = v7.find("Aimbot", "Ragebot", "Safety", "Body Aim", {
        disablers = "Disablers"
    });
    do
        local l_l_v253_2_1 = l_v253_2;
        l_v252_2.on_render = function(_)
            -- upvalues: v130 (ref), l_l_v253_2_1 (ref)
            local v772 = entity.get_threat();
            if not v772 then
                return;
            else
                local v773 = entity.get_local_player();
                if not v773 or not v773:is_alive() then
                    return;
                else
                    local v774 = v773:get_player_weapon();
                    if not v774 then
                        return;
                    else
                        local v775 = v774:get_weapon_info();
                        local v776 = v130.rage.force_body_aim:get() and v775.damage >= v772.m_iHealth;
                        l_l_v253_2_1:override(v776 and "Force" or nil);
                        l_l_v253_2_1.disablers:override(v776 and {
                            [1] = "Target Shooting"
                        } or nil);
                        return;
                    end;
                end;
            end;
        end;
        v1.render:set(function()
            -- upvalues: l_v252_2 (ref)
            l_v252_2:on_render();
        end);
    end;
    l_v253_2 = {
        str = "         wingless        ", 
        last = "", 
        set = function(v777, v778)
            -- upvalues: v130 (ref)
            if v778 == v777.last then
                return;
            elseif v130.misc.clantag:get() then
                common.set_clan_tag(v778);
                v777.last = v778;
                return;
            else
                if v777.last ~= "" then
                    common.set_clan_tag("");
                    v777.last = "";
                end;
                return;
            end;
        end, 
        rotate = function(v779, v780)
            v779.str = v779.str:sub(v780 + 1) .. v779.str:sub(1, v780);
            return v779.str;
        end
    };
    v1.net_update_end:set(function()
        -- upvalues: l_v253_2 (ref), v130 (ref), v128 (ref)
        if not globals.is_in_game or globals.tickcount % #l_v253_2.str ~= 0 then
            return;
        else
            local v781 = l_v253_2:rotate(1):sub(1, 11):gsub(" ", "") .. " $";
            if v130.misc.clantag:get() then
                v128.misc.clantag:override(false);
            else
                v128.misc.clantag:override(nil);
            end;
            l_v253_2:set(v781);
            return;
        end;
    end);
    v1.shutdown:set(function()
        -- upvalues: l_v253_2 (ref)
        l_v253_2:set("");
    end);
    l_lshift_0.fast_ladder = function(_, v783)
        -- upvalues: v130 (ref)
        local v784 = entity.get_local_player();
        if not v784 or not v784:is_alive() then
            return;
        elseif not v130.movement.fast_ladder:get() then
            return;
        else
            if v784.m_MoveType == 9 then
                if v783.forwardmove > 0 then
                    v783.view_angles.x = 89;
                    v783.view_angles.y = v783.view_angles.y + 89;
                    v783.in_moveright = 1;
                    v783.in_moveleft = 0;
                    v783.in_forward = 0;
                    v783.in_back = 1;
                    if v783.sidemove == 0 then
                        v783.move_yaw = v783.move_yaw + 90;
                    end;
                    if v783.sidemove < 0 then
                        v783.move_yaw = v783.move_yaw + 150;
                    end;
                    if v783.sidemove > 0 then
                        v783.move_yaw = v783.move_yaw + 30;
                    end;
                end;
                if v783.forwardmove < 0 then
                    v783.view_angles.x = 89;
                    v783.view_angles.y = v783.view_angles.y + 89;
                    v783.in_moveright = 0;
                    v783.in_moveleft = 1;
                    v783.in_forward = 1;
                    v783.in_back = 0;
                    if v783.sidemove == 0 then
                        v783.move_yaw = v783.move_yaw + 90;
                    end;
                    if v783.sidemove > 0 then
                        v783.move_yaw = v783.move_yaw + 150;
                    end;
                    if v783.sidemove < 0 then
                        v783.move_yaw = v783.move_yaw + 30;
                    end;
                end;
            end;
            return;
        end;
    end;
    l_lshift_0.no_fall_damage = function(_, v786)
        -- upvalues: v130 (ref)
        local v787 = entity.get_local_player();
        if not v787 or not v130.movement.no_fall_damage:get() then
            return;
        else
            local v788 = v787:get_origin();
            local l_m_vecVelocity_0 = v787.m_vecVelocity;
            if l_m_vecVelocity_0.z >= 0 or math.abs(l_m_vecVelocity_0.z) < 300 then
                return;
            else
                for v790 = -math.pi, math.pi, math.pi / 4 do
                    local v791 = v788 + vector():angles(0, math.deg(v790)) * 10;
                    local v792 = v791:clone();
                    v792.z = -1024;
                    local v793 = utils.trace_line(v791, v792, v787);
                    local v794 = math.floor(v793.start_pos:dist(v793.end_pos));
                    if v794 >= 10 and v794 <= 11 then
                        v786.in_duck = 1;
                    end;
                end;
                return;
            end;
        end;
    end;
    v254 = {};
    v255 = {};
    do
        local l_v255_3 = v255;
        v1.render(function()
            -- upvalues: v130 (ref), l_v255_3 (ref), v1 (ref)
            if not v130.misc.shared_icon:get() then
                return;
            else
                local v796 = entity.get_local_player();
                if v796 then
                    local v797 = v796:get_xuid();
                    if not l_v255_3[v797] then
                        l_v255_3[v797] = {
                            applied = true, 
                            last_update = globals.curtime
                        };
                    end;
                    l_v255_3[v797] = {
                        applied = true, 
                        last_update = globals.curtime
                    };
                    v796:set_icon("file://{images}/icons/xp/wingless.png");
                end;
                v1.voice_message:call(function(v798)
                    v798:write_bits(901431946, 32);
                end);
                return;
            end;
        end);
        v1.voice_message(function(v799)
            -- upvalues: v130 (ref), l_v255_3 (ref)
            if v799.buffer:read_bits(32) ~= 901431946 or not v130.misc.shared_icon:get() then
                return;
            else
                local v800 = v799.entity:get_xuid();
                if not l_v255_3[v800] then
                    l_v255_3[v800] = {
                        applied = true, 
                        last_update = globals.curtime + 1
                    };
                end;
                l_v255_3[v800] = {
                    applied = true, 
                    last_update = globals.curtime + 1
                };
                v799.entity:set_icon("file://{images}/icons/xp/wingless.png");
                return;
            end;
        end);
        v1.render:set(function()
            -- upvalues: l_v255_3 (ref)
            local l_curtime_2 = globals.curtime;
            entity.get_players(false, true, function(v802)
                -- upvalues: l_v255_3 (ref), l_curtime_2 (ref)
                local v803 = v802:get_xuid();
                if l_v255_3[v803] and l_v255_3[v803].applied and l_curtime_2 > l_v255_3[v803].last_update then
                    v802:set_icon("\000");
                    l_v255_3[v803].applied = false;
                end;
            end);
        end);
        v1.shutdown:set(function()
            -- upvalues: l_v255_3 (ref)
            entity.get_players(false, true, function(v804)
                -- upvalues: l_v255_3 (ref)
                local v805 = v804:get_xuid();
                if l_v255_3[v805] and l_v255_3[v805].applied then
                    v804:set_icon("\000");
                    l_v255_3[v805].applied = false;
                end;
            end);
        end);
    end;
    v255 = {};
    local v806 = l_ffi_0.load("user32");
    local v807 = l_ffi_0.cast("int*", (l_ffi_0.cast("uintptr_t***", l_ffi_0.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2)[0]);
    do
        local l_v806_0, l_v807_0 = v806, v807;
        v1.round_start:set(function()
            -- upvalues: v130 (ref), l_v806_0 (ref), l_v807_0 (ref)
            if v130.misc.game_focus:get() then
                l_v806_0.FlashWindow(l_v807_0, true);
            end;
        end);
    end;
    v1.grenade_prediction:set(function(v810)
        -- upvalues: l_lshift_0 (ref)
        xpcall(function(...)
            -- upvalues: l_lshift_0 (ref)
            l_lshift_0:grenade_release(...);
        end, print, v810);
    end);
    v1.createmove:set(function(v811)
        -- upvalues: l_lshift_0 (ref)
        l_lshift_0:air_exploit(v811);
        l_lshift_0:nade_throw_fix(v811);
        l_lshift_0:fast_ladder(v811);
    end);
end;