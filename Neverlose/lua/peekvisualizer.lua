ffi.cdef("    \n    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);\n    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\n");
local v0 = ffi.load("UrlMon");
local v1 = ffi.load("WinInet");
utils.download_file = function(v2, v3)
    -- upvalues: v1 (ref), v0 (ref)
    v1.DeleteUrlCacheEntryA(v2);
    v0.URLDownloadToFileA(nil, v2, v3, 0, 0);
end;
if files.read("nl\\n__\\MuseoSansCyrl-700.ttf") == nil then
    files.create_folder("nl\\n__\\");
    utils.download_file("https://drive.google.com/uc?id=1bG5XhcGOjgMscW3tTZ-2jS_gYEv9_ueI", "nl\\n__\\MuseoSansCyrl-700.ttf");
end;
local v4 = render.load_font("nl\\n__\\MuseoSansCyrl-700.ttf", 13.5, "a");
local v5 = ui.get_style();
local v6 = v5["Active Text"];
local l_Separator_0 = v5.Separator;
local v8 = v5["Window Title"];
local v9 = color(v8.r, v8.g, v8.b, 70);
local v10 = v5["Link Active"];
local l_Text_0 = v5.Text;
local v12 = v5["Logo Back"];
local l_Shadows_0 = v5.Shadows;
local _ = color(0, 0, 0, 0);
local v15 = render.screen_size();
local v16 = v15 * 0.5;
math.saturate = function(v17)
    if v17 < 0 then
        return 0;
    elseif v17 > 1 then
        return 1;
    else
        return v17;
    end;
end;
math.smoothStep = function(v18, v19, v20)
    local v21 = 0 + math.saturate((v20 - v18) / (v19 - v18));
    return v21 * v21 * (3 - 2 * v21);
end;
math.lerp = function(v22, v23, v24)
    return v22 + v24 * (v23 - v22);
end;
utils.colored_string = function(v25, v26)
    return ("\a%02x%02x%02x%02x%s"):format(v26.r, v26.g, v26.b, v26.a, v25);
end;
utils.menu_strings = function(v27, v28, v29, v30)
    return ("\a%02x%02x%02x%02x%s"):format(v29.r, v29.g, v29.b, v29.a, ui.get_icon(v27)) .. ("\a%02x%02x%02x%02x%s"):format(v30.r, v30.g, v30.b, v30.a, v28);
end;
utils.get_enemies = function(v31, v32)
    local v33 = entity.get_players(true, not v31);
    for v34 = #v33, 1, -1 do
        if not v33[v34]:is_alive() and v32 then
            table.remove(v33, v34);
        end;
    end;
    return v33;
end;
utils.get_target = function()
    -- upvalues: v15 (ref), v16 (ref)
    local v35 = utils.get_enemies(false, true);
    local v36 = nil;
    local l_x_0 = v15.x;
    for v38 = 1, #v35 do
        local v39 = v35[v38]:get_hitbox_position(5):to_screen();
        if v39 and globals.curtime - v35[v38].m_flSimulationTime <= 10 and (v39 - v16):length() < l_x_0 then
            l_x_0 = (v39 - v16):length();
            v36 = v35[v38];
        end;
    end;
    return v36;
end;
render.window = function(v40, v41, v42, v43)
    -- upvalues: v9 (ref), l_Shadows_0 (ref), v8 (ref), v4 (ref), v12 (ref), v6 (ref), l_Separator_0 (ref)
    render.blur(vector(v42.x, v42.y + 25), v43, 1, 1, 4);
    render.rect(vector(v42.x, v42.y + 25), vector(v43.x - 1, v43.y - 1), v9, 4);
    render.shadow(v42, vector(v43.x, v42.y + 20), l_Shadows_0, 26, 0, 5.5);
    render.rect(v42, vector(v43.x, v42.y + 20), v8, 5.5);
    render.text(v4, vector(v42.x + 9, v42.y + 3), v12, nil, ui.get_icon(v40));
    render.text(v4, vector(v42.x + 10, v42.y + 4), v6, nil, ui.get_icon(v40));
    render.line(vector(v42.x + 27, v42.y + 4), vector(v42.x + 27, v42.y + 17), l_Separator_0);
    render.text(v4, vector(v42.x + 34, v42.y + 3), v6, nil, v41);
end;
local function v45(v44)
    if v44 == 5 then
        return "Default";
    elseif v44 <= 3 then
        return "Low";
    elseif v44 <= 10 then
        return "Normal";
    else
        return "High";
    end;
end;
ui.sidebar("Peek Visualizer", "magnifying-glass-location");
local v46 = ui.create(utils.menu_strings("clipboard-list", " Infos", v10, v6));
local _ = v46:label(utils.menu_strings("rss", " News", v10, v6));
local _ = v46:label(network.get("https://pastebin.com/raw/dfCZ63P5"));
local _ = v46:label("");
local _ = v46:label(utils.menu_strings("comments", " Contact", v10, v6));
local _ = v46:label("Do you have a suggestion ? Wanna report a bug ? In need of a custom lua ? Contact me on discord: n__anemone");
local _ = v46:label("");
local _ = v46:label(utils.menu_strings("cart-circle-arrow-down", " Market                                           ", v10, v6));
local v54 = v46:button(utils.menu_strings("money-bill-wave", "        Paid Luas        ", v10, l_Text_0), nil, true);
local v55 = v46:button(utils.menu_strings("handshake", "        Free Luas        ", v10, l_Text_0), nil, true);
local v56 = ui.create(utils.menu_strings("magnifying-glass-location", " Peek Visualizer", v10, v6));
local v57 = v56:switch("Peek Visualizer", false);
v57:tooltip("If for some reason you need a bind.");
local v58 = v56:slider("\t- Precision", 1, 20, 5, 1, v45);
v58:tooltip("Be careful, this option may have a significant impact on performances. Decrease if you are getting low fps.");
local v59 = v56:combo("\t- Style", {
    [1] = "Wall", 
    [2] = "Gradient", 
    [3] = "Glow Line"
});
local v60 = v56:color_picker("\t- Colors", {
    colors = {
        color(255, 255, 255), 
        color(0, 0, 0)
    }
});
local v61 = v56:slider("\t- Indicator Height", 0, 100, 17, 0.01);
local v62 = v56:slider("\t- Indicator Size", 0, 100, 0, 0.01);
local function v63()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/?page=0&search=author:n__&sort=drec0&type=2&filter=0");
end;
local function v64()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/?page=0&search=author:n__&sort=drec0&type=3&filter=0");
end;
local function v65()
    -- upvalues: v58 (ref), v57 (ref), v59 (ref), v60 (ref), v61 (ref), v62 (ref)
    v58:visibility(v57:get());
    v59:visibility(v57:get());
    v60:visibility(v57:get());
    v61:visibility(v57:get());
    v62:visibility(v57:get());
end;
v54:set_callback(v63);
v55:set_callback(v64);
v57:set_callback(v65, true);
local v66 = 0;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local function v88(v73, v74, v75, v76)
    local l_a_0 = v76.a;
    v75 = v73 + v75;
    for v78 = 1, 20 do
        v76.a = math.smoothStep(1, 0, v78 * 0.05) * math.lerp(1, 0, l_a_0 * 0.01) * 255;
        local v79 = v74 * 0.5 * (v78 - 1);
        local v80 = v74 * 0.5 * v78;
        local v81 = (v73 + v79):to_screen();
        local v82 = (v75 + v79):to_screen();
        local v83 = (v75 + v80):to_screen();
        local v84 = (v73 + v80):to_screen();
        if v81 ~= nil and v82 ~= nil and v83 ~= nil and v84 ~= nil then
            render.poly(v76, v81, v82, v83, v84);
        end;
        local v85 = (v73 - v79):to_screen();
        local v86 = (v75 - v79):to_screen();
        local v87 = (v75 - v80):to_screen();
        v84 = (v73 - v80):to_screen();
        v83 = v87;
        v82 = v86;
        v81 = v85;
        if v81 ~= nil and v82 ~= nil and v83 ~= nil and v84 ~= nil then
            render.poly(v76, v81, v82, v83, v84);
        end;
    end;
end;
local function v101(v89, v90, v91, v92)
    local l_a_1 = v92.a;
    v91 = v89 + v91;
    for v94 = 1, 10 do
        v92.a = ((10 - v94) * 0.1) ^ 2 * math.lerp(1, 0, l_a_1 * 0.01) * 255;
        local v95 = v90 * (v94 / 2);
        local v96 = v90 * ((v94 + 1) / 2);
        local v97 = (v89 + v95):to_screen();
        local v98 = (v91 + v95):to_screen();
        local v99 = (v91 + v96):to_screen();
        local v100 = (v89 + v96):to_screen();
        if v97 ~= nil and v98 ~= nil and v99 ~= nil and v100 ~= nil then
            render.poly(v92, v97, v98, v99, v100);
        end;
    end;
end;
local function v106(v102, v103, v104, v105)
    -- upvalues: v67 (ref), v68 (ref), v69 (ref), v70 (ref), v71 (ref), v72 (ref)
    v104.a = 255;
    v103 = v102 + v103;
    if v105 == 1 then
        v67 = v102;
        v68 = v103;
        v69 = v104;
    else
        v70 = v102;
        v71 = v103;
        v72 = v104;
    end;
end;
local function v146()
    -- upvalues: v57 (ref), v15 (ref), v62 (ref), v61 (ref), v66 (ref), v6 (ref), v58 (ref), v60 (ref), v59 (ref), v88 (ref), v101 (ref), v106 (ref)
    if not v57:get() then
        return;
    else
        local v107 = entity.get_local_player();
        if v107 == nil then
            return;
        elseif not v107:is_alive() then
            return;
        else
            local v108 = v15.x * 0.4 * (v62:get() * 0.01 + 0.2);
            local v109 = math.lerp(v15.y - 75, 0, v61:get() * 0.01);
            local v110 = false;
            if not ui.find("visuals", "world", "main", "force thirdperson"):get() and common.get_timestamp() - v66 < 1000 then
                render.window("magnifying-glass-location", "Peek Visualizer", vector(v15.x * 0.5 - v108, v109), vector(v15.x * 0.5 + v108, v109 + 75));
                render.rect(vector(v15.x * 0.5 - 3, v109 + 30), vector(v15.x * 0.5 + 3, v109 + 69), v6, 5);
                v110 = true;
            end;
            local v111 = utils.get_target();
            if v111 == nil then
                return;
            else
                local v112 = v107:get_origin();
                local v113 = v107:get_eye_position();
                local v114 = vector():angles(0, render.camera_angles().y, 0);
                local v115 = vector():angles(0, render.camera_angles().y + 90, 0);
                local v116 = vector():angles(0, render.camera_angles().y - 90, 0);
                if utils.trace_bullet(v107, v113, v111:get_hitbox_position(3)) >= 1 then
                    return;
                else
                    local v117 = v58:get();
                    local v118 = nil;
                    local v119 = 100;
                    local v120 = 100;
                    local v121 = utils.trace_line(v113, v113 + v115 * v119, v107, 4294967295, 1);
                    local v122 = utils.trace_line(v113, v113 + v116 * v120, v107, 4294967295, 1);
                    if v121.fraction ~= 1 then
                        v119 = (v121.end_pos - v113):length() - 1;
                    end;
                    if v122.fraction ~= 1 then
                        v120 = (v122.end_pos - v113):length() - 1;
                    end;
                    for v123 = 1, 2 do
                        local v124 = nil;
                        if v123 == 1 then
                            v124 = v115;
                            v118 = v119;
                        else
                            v124 = v116;
                            v118 = v120;
                        end;
                        local v125 = nil;
                        local v126 = nil;
                        local v127 = v118 / v117;
                        local v128 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
                        if v128 == 0 then
                            v128 = 20;
                        end;
                        if v111.m_iHealth < v128 then
                            v128 = v111.m_iHealth;
                        end;
                        local v129 = v107:get_player_weapon();
                        if v129 == nil then
                            return;
                        else
                            v129 = v129:get_weapon_info();
                            if v129 == nil then
                                return;
                            else
                                v129 = v129.damage;
                                if v129 == nil then
                                    return;
                                else
                                    local v130 = 0;
                                    if (v128 < v129 or v111:is_dormant()) and cvar.mp_damage_headshot_only:int() == 0 then
                                        v130 = 3;
                                    end;
                                    local v131 = v111:get_hitbox_position(v130) + vector(0, 0, 4);
                                    for v132 = v127, v118, v127 do
                                        local v133, v134 = utils.trace_bullet(v107, v113 + v124 * v132, v131);
                                        if v134.entity then
                                            if v128 <= v133 and v134.entity:is_enemy() then
                                                v125 = v132 - v127;
                                                v126 = v132;
                                                break;
                                            end;
                                        elseif v128 <= v133 then
                                            v125 = v132 - v127;
                                            v126 = v132;
                                            break;
                                        end;
                                    end;
                                    if v125 ~= nil then
                                        for _ = 1, 7 do
                                            local v136 = (v126 + v125) * 0.5;
                                            local v137, v138 = utils.trace_bullet(v107, v113 + v124 * v136, v131);
                                            if v138.entity then
                                                if v128 <= v137 and v138.entity:is_enemy() then
                                                    v126 = v136;
                                                else
                                                    v125 = v136;
                                                end;
                                            elseif v128 <= v137 then
                                                v126 = v136;
                                            else
                                                v125 = v136;
                                            end;
                                        end;
                                        if v125 > 0 then
                                            v66 = common.get_timestamp();
                                            local v139, v140 = unpack(v60:get("colors"));
                                            local v141 = v139:clone():lerp(v140, v125 * 0.01);
                                            if ui.find("visuals", "world", "main", "force thirdperson"):get() then
                                                v141.a = v125;
                                                local v142 = v112 + v124 * v125;
                                                local v143 = v113 - v112;
                                                if v59:get() == "Wall" then
                                                    v88(v142, v114, v143, v141);
                                                end;
                                                if v59:get() == "Gradient" then
                                                    v101(v142, -v124, v143, v141);
                                                end;
                                                if v59:get() == "Glow Line" then
                                                    v106(v142, v143, v141, v123);
                                                end;
                                            else
                                                if v110 == false then
                                                    render.window("magnifying-glass-location", "Peek Visualizer", vector(v15.x * 0.5 - v108, v109), vector(v15.x * 0.5 + v108, v109 + 75));
                                                    render.rect(vector(v15.x * 0.5 - 3, v109 + 30), vector(v15.x * 0.5 + 3, v109 + 69), v6, 5);
                                                    v110 = true;
                                                end;
                                                local v144 = 0;
                                                local v145 = v123 == 1 and -1 or 1;
                                                v144 = v15.x * 0.5 + v145 * math.lerp(0, v108, v125 * 0.01);
                                                render.line(vector(v144, v109 + 34), vector(v144, v109 + 65), v141);
                                                render.shadow(vector(v144, v109 + 34), vector(v144, v109 + 65), v141, 50, 0, 5.5);
                                            end;
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
    end;
end;
local function v148(v147)
    -- upvalues: v67 (ref), v68 (ref), v69 (ref), v70 (ref), v71 (ref), v72 (ref)
    if v67 ~= nil then
        v147:render(v67, v68, 0.1, "lgw", v69);
        v67 = nil;
    end;
    if v70 ~= nil then
        v147:render(v70, v71, 0.1, "lgw", v72);
        v70 = nil;
    end;
end;
events.render:set(function()
    -- upvalues: v146 (ref)
    v146();
end);
events.render_glow:set(function(v149)
    -- upvalues: v148 (ref)
    v148(v149);
end);