local l_ffi_0 = require("ffi");
local l_bit_0 = require("bit");
local v2 = l_ffi_0.load("UrlMon");
local v3 = l_ffi_0.load("WinInet");
local l_clipboard_0 = require("neverlose/clipboard");
local l_handler_0 = require("neverlose/ui_handler");
local l_gradient_0 = require("neverlose/gradient");
local l_defensive_0 = require("neverlose/get_defensive");
local l_weapons_0 = require("neverlose/csgo_weapons");
local l_events_0 = require("neverlose/events");
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {};
local _ = {};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = {
    error_logged = false, 
    last_error_log = -1, 
    network_ratelimit = 5
};
v15.log_error = function(v26)
    -- upvalues: v25 (ref)
    local l_v26_0 = v26;
    if not v25.error_logged then
        v25.error_logged = true;
        v25.last_error_log = globals.realtime;
        print_raw(l_v26_0);
        print_dev(l_v26_0);
        utils.console_exec("play resource\\warning.wav");
    end;
end;
v25.safecall = function(v28, v29, v30)
    -- upvalues: v15 (ref)
    return function(...)
        -- upvalues: v30 (ref), v28 (ref), v29 (ref), v15 (ref)
        local l_status_0, l_result_0 = pcall(v30, ...);
        if not l_status_0 then
            local v33 = v28 .. " : " .. l_result_0;
            if v29 then
                v15.log_error(v33);
            end;
            return false, v33;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
v25.subscribe = function(v34, v35, v36, v37)
    -- upvalues: l_events_0 (ref), v25 (ref)
    if v37 == nil then
        v37 = true;
    end;
    l_events_0[v34](v25.safecall(v35, true, v36), v37);
end;
utils.random_chineseword = panorama.loadstring("\tvar _rsl = \"\";\n\tvar _randomUniCode = Math.floor(Math.random() * (40870 - 19968) + 19968).toString(16);\n\teval(\"_rsl=\" + '\"\\\\u' + _randomUniCode + '\"');\n\treturn _rsl;\n");
local v38 = panorama.loadstring("    return {\n        stringify: JSON.stringify,\n        parse: JSON.parse\n    };\n")();
l_ffi_0.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
v10.download_file = function(v39, v40)
    -- upvalues: v3 (ref), v2 (ref)
    assert(type(v39) == "string", "Invalid type of download url");
    assert(type(v40) == "string", "Invalid type of file path");
    v3.DeleteUrlCacheEntryA(v39);
    v2.URLDownloadToFileA(nil, v39, v40, 0, 0);
end;
v10.SetAbsAngles = (function()
    -- upvalues: l_ffi_0 (ref)
    l_ffi_0.cdef("typedef struct { float x; float y; float z;} vmodel_vec3_t;");
    return l_ffi_0.typeof("void(__thiscall*)(void*, const vmodel_vec3_t&)");
end)();
v10.SetAbsAngles_fn = l_ffi_0.cast(v10.SetAbsAngles, utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 64 53 56 57 8B F1"));
local l_menu_0 = l_handler_0.menu;
l_menu_0.new = function(v42, v43, v44, v45)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.push({
        element = v42, 
        index = v43, 
        flags = v44, 
        conditions = v45
    });
    return function(v46)
        -- upvalues: v42 (ref)
        if v46 ~= nil then
            v46(v42:create());
        end;
    end;
end;
v23.notify = {};
v23.notify._table = {};
v12.username = common.get_username();
v12.build = _G.build == nil and "autumn" or _G.build;
v12.steamid = panorama.MyPersonaAPI.GetXuid();
v12.steam_name = panorama.MyPersonaAPI.GetName();
v12.screen_size = render.screen_size();
v12.cvars = {};
v12.cvars.sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks;
v12.cvars.sv_maxunlag = cvar.sv_maxunlag;
v12.cvars.mat_ambient_light_r = cvar.mat_ambient_light_r;
v12.cvars.mat_ambient_light_g = cvar.mat_ambient_light_g;
v12.cvars.mat_ambient_light_b = cvar.mat_ambient_light_b;
v12.cvars.r_modelAmbientMin = cvar.r_modelAmbientMin;
v12.cvars.aspect_ratio = cvar.r_aspectratio;
v12.cvars.viewmodel_fov = cvar.viewmodel_fov;
v12.cvars.viewmodel_offset_x = cvar.viewmodel_offset_x;
v12.cvars.viewmodel_offset_y = cvar.viewmodel_offset_y;
v12.cvars.viewmodel_offset_z = cvar.viewmodel_offset_z;
files.default_path = "nl\\paradise.autumn";
files.images_path = files.default_path .. "\\images";
files.menu_image = files.images_path .. "\\menuimage.jpg";
files.bomb_image = files.images_path .. "\\bombimage.jpg";
files.bombplanted_image = files.images_path .. "\\bombplantedimage.jpg";
(function()
    -- upvalues: v10 (ref)
    while true do
        files.create_folder(files.default_path);
        files.create_folder(files.images_path);
        if not files.read(files.menu_image) or files.get_crc32(files.menu_image) ~= -886617488 then
            v10.download_file("https://s21.ax1x.com/2024/07/14/pk4Lb8S.jpg", files.menu_image);
            goto label0 --[[  false, true  ]];
        end;
        if not files.read(files.bomb_image) or files.get_crc32(files.bomb_image) ~= -1808745910 then
            v10.download_file("https://s11.ax1x.com/2023/07/27/pCvnNNR.png", files.bomb_image);
            goto label0 --[[  false, true  ]];
        end;
        if not files.read(files.bombplanted_image) or files.get_crc32(files.bombplanted_image) ~= -1808745910 then
            v10.download_file("https://s11.ax1x.com/2023/07/27/pCvnBjO.png", files.bombplanted_image);
        else
            break;
        end;
        ::label0::;
    end;
end)();
v12.menu_image = render.load_image_from_file(files.menu_image);
v12.colored_text = function(...)
    local v47 = {
        ...
    };
    local v48 = "";
    for _, v50 in pairs(v47) do
        local v51 = v50[1];
        local v52 = "";
        if v51:find("icon_") then
            v51 = ui.get_icon(v51:gsub("icon_", ""));
        end;
        if not v51 then
            v51 = "nil";
        end;
        if v50[2] == nil then
            v50[2] = "DEFAULT";
        end;
        if type(v50[2]) == "userdata" then
            v50[2] = v50[2]:to_hex();
            v52 = ("\a%s"):format(v50[2]);
        else
            v52 = "\a" .. v50[2];
        end;
        v48 = v48 .. v52 .. v51;
    end;
    return v48;
end;
v12.get_bind = function(v53)
    local v54 = false;
    local v55 = 0;
    local v56 = ui.get_binds();
    for v57 = 1, #v56 do
        if v56[v57].name == v53 and v56[v57].active then
            v54 = true;
            v55 = v56[v57].value;
        end;
    end;
    return {
        [1] = v54, 
        [2] = v55
    };
end;
v13.angle_to_vector = function(v58)
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    v60 = math.sin(math.rad(v58.y));
    v62 = math.cos(math.rad(v58.y));
    v59 = math.sin(math.rad(v58.x));
    v61 = math.cos(math.rad(v58.x));
    return vector(v61 * v62, v61 * v60, -v59);
end;
v13.vector_to_angle = function(v63)
    local v64 = math.atan2(v63.y, v63.x) * (180 / math.pi);
    local v65 = math.atan2(v63.z, math.sqrt(v63.x * v63.x + v63.y * v63.y)) * (180 / math.pi);
    return vector(v64, v65);
end;
v13.as_angle = function(v66)
    return math.atan2(v66.y, v66.x);
end;
v14.black = color(0, 255);
v14.white = color(255);
v14.main = color(255, 120, 30, 255);
v14.link = ui.get_style("Link");
v14.link_active = ui.get_style("Link Active");
v14.rgb_health_based = function(v67)
    return 248 - 124 * v67, 195 * v67, 13;
end;
v14.hsv_to_rgb = function(v68, v69, v70, v71)
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = math.floor(v68 * 6);
    local v76 = v68 * 6 - v75;
    local v77 = v70 * (1 - v69);
    local v78 = v70 * (1 - v76 * v69);
    local v79 = v70 * (1 - (1 - v76) * v69);
    v75 = v75 % 6;
    if v75 == 0 then
        local l_v70_0 = v70;
        local l_v79_0 = v79;
        v74 = v77;
        v73 = l_v79_0;
        v72 = l_v70_0;
    elseif v75 == 1 then
        local l_v78_0 = v78;
        local l_v70_1 = v70;
        v74 = v77;
        v73 = l_v70_1;
        v72 = l_v78_0;
    elseif v75 == 2 then
        local l_v77_0 = v77;
        local l_v70_2 = v70;
        v74 = v79;
        v73 = l_v70_2;
        v72 = l_v77_0;
    elseif v75 == 3 then
        local l_v77_1 = v77;
        local l_v78_1 = v78;
        v74 = v70;
        v73 = l_v78_1;
        v72 = l_v77_1;
    elseif v75 == 4 then
        local l_v79_1 = v79;
        local l_v77_2 = v77;
        v74 = v70;
        v73 = l_v77_2;
        v72 = l_v79_1;
    elseif v75 == 5 then
        local l_v70_3 = v70;
        local l_v77_3 = v77;
        v74 = v78;
        v73 = l_v77_3;
        v72 = l_v70_3;
    end;
    return v72 * 255, v73 * 255, v74 * 255, v71 * 255;
end;
v14.gradient_text = function(v92, v93, v94, v95, v96, v97, v98, v99, v100)
    local v101 = "";
    local v102 = #v100 - 1;
    local v103 = (v96 - v92) / v102;
    local v104 = (v97 - v93) / v102;
    local v105 = (v98 - v94) / v102;
    local v106 = (v99 - v95) / v102;
    for v107 = 1, v102 + 1 do
        v101 = v101 .. ("\a%02x%02x%02x%02x%s"):format(v92, v93, v94, v95, v100:sub(v107, v107));
        v92 = v92 + v103;
        v93 = v93 + v104;
        v94 = v94 + v105;
        v95 = v95 + v106;
    end;
    return v101;
end;
v16.animated_lua_text = l_gradient_0.text_animate("\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134", 2, {
    [1] = v14.link_active, 
    [2] = v14.link
});
v11 = {
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = {
        mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        defensive_aa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
    }, 
    yaw_modifier = {
        mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
    }, 
    body_yaw = {
        switch = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        fake_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
    }, 
    roll = {
        switch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
        roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
    }, 
    freestanding = {
        switch = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
    }, 
    leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fakelag = {
        switch = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
    }, 
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    hide_shots = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
    }, 
    doubletap = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit")
    }, 
    autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    hitchance = {
        value = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        doubletap = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance", "Double Tap")
    }, 
    minimum_damage = {
        value = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        delay_show = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot")
    }, 
    hitbox = {
        def = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
        multi = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint")
    }, 
    multipoint = {
        head = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"), 
        body = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale")
    }, 
    body_aim = {
        mode = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        disablers = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers")
    }, 
    safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"), 
    thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    override_zoom = {
        force_viewmodel = ui.find("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel"), 
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
    }, 
    ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    anti_untrusted = ui.find("Miscellaneous", "Main", "Other", "Anti Untrusted")
};
math.max_lerp_low_fps = 2.2222222222222223;
math.color_lerp = function(v108, v109, v110)
    local v111 = globals.frametime * 100;
    return v108:lerp(v109, v110 * math.min(v111, math.max_lerp_low_fps));
end;
math.lerp = function(v112, v113, v114)
    return v113 + (v114 - v113) * v112;
end;
math.anim_lerp = function(v115, v116, v117)
    if v115 == v116 then
        return v116;
    else
        v117 = v117 * (globals.frametime * 170);
        local v118 = math.lerp(v117, v115, v116);
        if math.abs(v118 - v116) < 0.01 then
            return v116;
        else
            return v118;
        end;
    end;
end;
string.swaystring = function(v119, v120)
    return v119:sub(1, math.abs(1 * math.cos(2 * math.pi * globals.curtime / v120)) * (string.len(v119) + 1));
end;
entity.can_shift_shot = function(v121)
    if v121:is_alive() == false or v121 == nil then
        return false;
    else
        local l_m_hActiveWeapon_0 = v121.m_hActiveWeapon;
        if l_m_hActiveWeapon_0 == nil then
            return false;
        else
            return v121.m_flNextAttack <= globals.curtime and l_m_hActiveWeapon_0.m_flNextPrimaryAttack <= globals.curtime;
        end;
    end;
end;
v16.base_speed = 0.095;
v16._list = {};
v16.new = function(v123, v124, v125, v126)
    -- upvalues: v16 (ref), v14 (ref)
    if not v125 then
        v125 = v16.base_speed;
    end;
    local v127 = type(v124) == "userdata";
    if v16._list[v123] == nil then
        v16._list[v123] = v126 and v126 or v127 and v14.white or 0;
    end;
    local v128 = nil;
    if v127 then
        v128 = math.color_lerp;
    else
        v128 = math.anim_lerp;
    end;
    v16._list[v123] = v128(v16._list[v123], v124, v125);
    return v16._list[v123];
end;
v17.menu = {};
v17.items = {
    [1] = "velocity_indicator", 
    [2] = "lagcomp_indicator"
};
for v129, v130 in pairs(v17.items) do
    v17.menu[v130] = {
        l_menu_0.new(ui.create("drag", "drag"):slider(v130 .. "_pos_x", 0, v12.screen_size.x, math.floor(0.1 * v12.screen_size.x)), v130 .. "_pos_x", "", {
            [1] = function()
                return false;
            end
        }), 
        l_menu_0.new(ui.create("drag", "drag"):slider(v130 .. "_pos_y", 0, v12.screen_size.y, math.floor(0.1 * v129 * v12.screen_size.y)), v130 .. "_pos_y", "", {
            [1] = function()
                return false;
            end
        })
    };
end;
v17.in_bounds = function(v131, v132)
    local v133 = ui.get_mouse_position();
    return v133.x >= v131.x and v133.x <= v132.x and v133.y >= v131.y and v133.y <= v132.y;
end;
v17.item = {};
v17.current_drugging_item = nil;
v17.hovered_something = false;
v17.handle = function(v134, v135, v136, v137, v138, v139)
    -- upvalues: v17 (ref), v12 (ref), l_menu_0 (ref)
    if not v139 then
        v139 = 0;
    end;
    if v17.item[v138] == nil then
        v17.item[v138] = {};
        v17.item[v138].drag_position = vector(0, 0);
        v17.item[v138].is_dragging = false;
    end;
    if v17.in_bounds(vector(v134, v135), vector(v134 + v136, v135 + v137)) and v17.in_bounds(vector(0, 0), vector(v12.screen_size.x, v12.screen_size.y)) then
        v17.hovered_something = true;
        if common.is_button_down(1) and v17.item[v138].is_dragging == false and (v17.current_drugging_item == nil or v17.current_drugging_item == v138) then
            v17.item[v138].is_dragging = true;
            v17.current_drugging_item = v138;
            v17.item[v138].drag_position = vector(v134 - ui.get_mouse_position().x, v135 - ui.get_mouse_position().y);
        end;
    end;
    if not v17.in_bounds(vector(0, 0), vector(v12.screen_size.x, v12.screen_size.y)) then
        v17.item[v138].is_dragging = false;
    end;
    if not common.is_button_down(1) then
        v17.item[v138].is_dragging = false;
        v17.current_drugging_item = nil;
    end;
    if v17.item[v138].is_dragging and ui.get_alpha() > 0 then
        l_menu_0.get_element(v138 .. "_pos_x"):set(ui.get_mouse_position().x + v17.item[v138].drag_position.x);
        l_menu_0.get_element(v138 .. "_pos_y"):set(ui.get_mouse_position().y + v17.item[v138].drag_position.y);
    end;
end;
l_events_0.mouse_input:set(function()
    -- upvalues: v17 (ref)
    if (v17.hovered_something or v17.current_drugging_item) and ui.get_alpha() > 0 then
        return false;
    else
        return;
    end;
end);
table.insert(v23.notify._table, {
    alpha = 0, 
    text = "Welcome back! " .. v12.username, 
    time = globals.realtime + 3.8
});
v19.icon = {
    home = ui.get_icon("house"), 
    antiaim = ui.get_icon("shield"), 
    misc = ui.get_icon("microsoft")
};
v19.tab = {
    home = {
        image = ui.create(v19.icon.home, "\nImage"), 
        general = ui.create(v19.icon.home, "\nGeneral"), 
        config = ui.create(v19.icon.home, "\nConfig"), 
        setting = ui.create(v19.icon.home, "\nSetting"), 
        links = ui.create(v19.icon.home, "Links")
    }, 
    antiaim = {
        global = ui.create(v19.icon.antiaim, "\nGlobal"), 
        settings = ui.create(v19.icon.antiaim, "Settings")
    }, 
    misc = {
        global = ui.create(v19.icon.misc, "\nGlobal"), 
        main = ui.create(v19.icon.misc, "\nMain")
    }
};
v19.run_sidebar = function()
    -- upvalues: v14 (ref), v16 (ref), l_gradient_0 (ref)
    v14.link_active = ui.get_style("Link Active");
    v14.link = ui.get_style("Link");
    v16.animated_lua_text = l_gradient_0.text_animate("\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134", 2, {
        [1] = v14.link_active, 
        [2] = v14.white
    });
    ui.sidebar(v16.animated_lua_text:get_animated_text() .. " \aFFFFFF80\226\128\162\aDEFAULT { }", ui.get_icon("spinner"));
    v16.animated_lua_text:animate();
end;
l_menu_0.new(v19.tab.home.setting:list("\nselected_page", {
    [1] = "Information", 
    [2] = "Config"
}), "home_selected_page", "-", {});
l_menu_0.new(v19.tab.home.config:list("", {
    [1] = "\a777777FFEmpty config list."
}), "selected_config", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.home.config:input("Config name", "new config"), "config_name", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
files.config_path = files.default_path .. "\\configs.json";
v20.handler = {
    import = function(v140)
        -- upvalues: l_handler_0 (ref)
        l_handler_0.config.import(v140:gsub("paradiseSince2020_", ""));
    end, 
    export = function()
        -- upvalues: l_handler_0 (ref)
        return "paradiseSince2020_" .. l_handler_0.config.export();
    end
};
v20.presets = {
    names = {}, 
    codes = {}
};
v20.configs = {
    main = {
        names = v20.presets.names, 
        codes = v20.presets.codes
    }
};
v20.on_first_load = v25.safecall("g_config.on_first_load", true, function()
    -- upvalues: v38 (ref), v20 (ref)
    if files.read(files.config_path) == nil then
        files.create_folder(files.default_path);
        files.write(files.config_path, v38.stringify(v20.configs.main));
    end;
end);
v20.on_first_load();
v20.parse = v25.safecall("g_config.parse", true, function()
    -- upvalues: v38 (ref), v20 (ref), l_menu_0 (ref)
    local v141 = v38.parse(files.read(files.config_path));
    v20.presets.names = v141.names;
    v20.presets.codes = v141.codes;
    if #v20.presets.names ~= 0 then
        l_menu_0.get_element("selected_config"):update(v20.presets.names);
    end;
end);
v20.parse();
v20.update = v25.safecall("g_config.update", true, function()
    -- upvalues: v20 (ref), v38 (ref)
    v20.configs.main.names = v20.presets.names;
    v20.configs.main.codes = v20.presets.codes;
    files.write(files.config_path, (v38.stringify(v20.configs.main)));
end);
v20.update();
v20.update_list_empty = v25.safecall("g_config.update_list_empty", true, function()
    -- upvalues: v20 (ref), l_menu_0 (ref)
    if #v20.presets.names == 0 then
        l_menu_0.get_element("selected_config"):update({
            [1] = "\a777777FFEmpty config list."
        });
    end;
end);
v20.update_list_empty();
l_menu_0.new(v19.tab.home.image:texture(v12.menu_image, vector(240, 320)), "home_image", "-", {});
l_menu_0.new(v19.tab.home.general:label(v12.colored_text({
    [1] = "Welcome back! - "
}, {
    [1] = v12.username, 
    [2] = v14.link_active
}) .. "\n\n" .. v12.colored_text({
    [1] = "Version - "
}, {
    [1] = v12.build, 
    [2] = v14.link_active
})), "information_label", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 1;
    end
});
l_menu_0.new(v19.tab.home.links:button(v12.colored_text({
    [1] = "  "
}, {
    [1] = "icon_sparkles", 
    [2] = v14.link_active
}, {
    [1] = " Recommended paid config  "
}), v25.safecall("paid_config_button", true, function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=9P1Lbv");
end)), "paid_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 1;
    end
});
l_menu_0.new(v19.tab.home.links:button(v12.colored_text({
    [1] = "  "
}, {
    [1] = "icon_discord", 
    [2] = v14.link_active
}, {
    [1] = " Link our discord server  "
}), v25.safecall("link_discord_button", true, function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/rapidfire");
end)), "link_discord_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 1;
    end
});
l_menu_0.new(v19.tab.home.links:button(v12.colored_text({
    [1] = "  "
}, {
    [1] = "icon_youtube", 
    [2] = v14.link_active
}, {
    [1] = " My youtube channel  "
}), v25.safecall("youtube_button", true, function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://youtube.com/@CycleHvH");
end)), "youtube_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 1;
    end
});
l_menu_0.new(v19.tab.home.config:button(v12.colored_text({
    [1] = "icon_check", 
    [2] = v14.link_active
}, {
    [1] = " Load  "
}), v25.safecall("load_config_button", true, function()
    -- upvalues: v20 (ref), l_menu_0 (ref)
    v20.handler.import(v20.presets.codes[l_menu_0.get("selected_config")]);
    v20.update_list_empty();
    if #v20.presets.names ~= 0 then
        utils.console_exec("play ui\\beepclear");
    end;
end)), "load_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.home.config:button(v12.colored_text({
    [1] = "icon_floppy-disk", 
    [2] = v14.link_active
}, {
    [1] = " Save  "
}), v25.safecall("save_config_button", true, function()
    -- upvalues: v20 (ref), l_menu_0 (ref)
    v20.parse();
    table.insert(v20.presets.names, l_menu_0.get("config_name"));
    table.insert(v20.presets.codes, v20.handler.export());
    v20.update();
    if #v20.presets.names ~= 0 then
        l_menu_0.get_element("selected_config"):update(v20.presets.names);
    end;
    v20.update_list_empty();
    utils.console_exec("play ui\\beepclear");
end)), "save_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.home.config:button(v12.colored_text({
    [1] = "icon_trash-can", 
    [2] = v14.link_active
}, {
    [1] = " Delete  "
}), v25.safecall("delete_config_button", true, function()
    -- upvalues: v20 (ref), l_menu_0 (ref)
    v20.parse();
    table.remove(v20.presets.names, l_menu_0.get("selected_config"));
    table.remove(v20.presets.codes, l_menu_0.get("selected_config"));
    v20.update();
    if #v20.presets.names ~= 0 then
        l_menu_0.get_element("selected_config"):update(v20.presets.names);
    end;
    v20.update_list_empty();
    utils.console_exec("play ui\\beepclear");
end)), "delete_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.home.config:button(v12.colored_text({
    [1] = "  "
}, {
    [1] = "icon_file-export", 
    [2] = v14.link_active
}, {
    [1] = " Export settings "
}), v25.safecall("export_config_button", true, function()
    -- upvalues: l_clipboard_0 (ref), v20 (ref)
    l_clipboard_0.set(v20.handler.export());
end)), "export_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.home.config:button(v12.colored_text({
    [1] = "  "
}, {
    [1] = "icon_file-import", 
    [2] = v14.link_active
}, {
    [1] = " Import settings "
}), v25.safecall("import_config_button", true, function()
    -- upvalues: v20 (ref), l_clipboard_0 (ref)
    v20.handler.import(l_clipboard_0.get());
end)), "import_config_button", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("home_selected_page") == 2;
    end
});
l_menu_0.new(v19.tab.antiaim.global:switch("\226\128\162 Enable", true), "enable_antiaim", "", {});
l_menu_0.new(v19.tab.antiaim.global:list("-> Tab selection", {
    [1] = "\226\128\162 General settings", 
    [2] = "\226\128\162 Conditional builder"
}), "antiaim_tab_selection", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim");
    end
});
l_menu_0.new(v19.tab.antiaim.settings:combo("Manual yaw base", {
    [1] = "Disabled", 
    [2] = "Leftward", 
    [3] = "Rightward", 
    [4] = "Forward"
}), "manual_yaw_base", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
})(function(v142)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v142:switch("Disable yaw modifiers", true), "manual_static_yaw", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
        end
    });
    l_menu_0.new(v142:switch("Body freestanding", true), "manual_body_freestanding", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
        end
    });
    l_menu_0.new(v142:switch("Custom offset"), "manual_custom_offset", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
        end
    });
    l_menu_0.new(v142:slider("Left offset", -180, 180, -90), "manual_left_offset", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1 and l_menu_0.get("manual_custom_offset");
        end
    });
    l_menu_0.new(v142:slider("Right offset", -180, 180, 90), "manual_right_offset", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1 and l_menu_0.get("manual_custom_offset");
        end
    });
end);
l_menu_0.new(v19.tab.antiaim.settings:switch("Freestanding"), "freestanding", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
})(function(v143)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v143:switch("Disable yaw modifiers", true), "freestanding_static_yaw", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
        end
    });
    l_menu_0.new(v143:switch("Body freestanding", true), "freestanding_body_freestanding", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
        end
    });
end);
l_menu_0.new(v19.tab.antiaim.settings:switch("Allow anti-aim on use"), "antiaim_on_use", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:selectable("Disable fake lag", {
    [1] = "Double tap", 
    [2] = "Hide shots", 
    [3] = "DT heavy pistols", 
    [4] = "Standing", 
    [5] = "Break fake duck"
}), "disable_fakelag", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:combo("Leg breaker [\a00FF00FFsafety\aDEFAULT]", {
    [1] = "Default", 
    [2] = "Jitter", 
    [3] = "Hide"
}), "leg_breaker", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:label(" -> exploits"), "exploits_lable", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:switch("Celebrate on round end"), "shitaa_on_round_end", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:switch("Aerobic lag exploit"), "teleport_air_spam", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:selectable("Lag comp. breaker", {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slowwalk", 
    [4] = "Crouch", 
    [5] = "In air", 
    [6] = "In air duck", 
    [7] = "In use"
}), "lc_breaker", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.antiaim.settings:selectable("Twist lag peek", {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slowwalk", 
    [4] = "Crouch", 
    [5] = "In air", 
    [6] = "In air duck", 
    [7] = "In use"
}), "lp_breaker", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 1;
    end
});
v22.conditions = {};
v22.conditions_names = {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slowwalk", 
    [5] = "Crouch", 
    [6] = "In air", 
    [7] = "In air duck", 
    [8] = "In use", 
    [9] = "Fakelag"
};
l_menu_0.new(v19.tab.antiaim.global:label(" -> Condition tab selection"), "condition_label", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.antiaim.global:list("\n", v22.conditions_names), "condition_selection", "-", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 2;
    end
});
for v144, v145 in pairs(v22.conditions_names) do
    do
        local l_v144_0, l_v145_0 = v144, v145;
        local function v148()
            -- upvalues: l_menu_0 (ref), l_v144_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 2 and l_menu_0.get("condition_selection") == l_v144_0;
        end;
        local v149 = ui.create(v19.icon.antiaim, l_v145_0 .. " -> builder");
        v22.conditions[l_v144_0] = {};
        if l_v145_0 ~= "Default" then
            l_menu_0.new(v149:switch("Override " .. l_v145_0 .. " condition"), "switch_" .. l_v145_0, "", {
                [1] = v148
            });
        end;
        v148 = function()
            -- upvalues: l_menu_0 (ref), l_v144_0 (ref), l_v145_0 (ref)
            return l_menu_0.get("enable_antiaim") and l_menu_0.get("antiaim_tab_selection") == 2 and l_menu_0.get("condition_selection") == l_v144_0 and (l_v145_0 == "Default" or l_menu_0.get("switch_" .. l_v145_0));
        end;
        l_menu_0.new(v149:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Up"
        }), "pitch_" .. l_v145_0, "", {
            [1] = v148
        });
        l_menu_0.new(v149:switch("At target", true), "at_target_" .. l_v145_0, "", {
            [1] = v148
        });
        l_menu_0.new(v149:slider("  >  Left offset", -180, 180, 0, 1, "\194\176"), "left_yaw_add_" .. l_v145_0, "", {
            [1] = v148
        });
        l_menu_0.new(v149:slider("  >  Right offset", -180, 180, 0, 1, "\194\176"), "right_yaw_add_" .. l_v145_0, "", {
            [1] = v148
        });
        do
            local l_v148_0 = v148;
            l_menu_0.new(v149:combo("Yaw modifier", {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Dynamic", 
                [5] = "Random", 
                [6] = "Spin", 
                [7] = "X-way"
            }), "modifier_" .. l_v145_0, "", {
                [1] = l_v148_0
            })(function(v151)
                -- upvalues: l_menu_0 (ref), l_v145_0 (ref), l_v148_0 (ref)
                l_menu_0.new(v151:switch("L/R addition"), "modifier_lr_addition_" .. l_v145_0, "", {
                    [1] = l_v148_0, 
                    [2] = function()
                        -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                        return l_menu_0.get("modifier_" .. l_v145_0) ~= "Disabled";
                    end
                });
            end);
            l_menu_0.new(v149:slider("  >  Ways", 3, 5, 3), "modifier_ways_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("modifier_" .. l_v145_0) == "X-way";
                end
            });
            l_menu_0.new(v149:slider("  >  Degree", -180, 180, 0, 1, "\194\176"), "modifier_degree_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("modifier_" .. l_v145_0) ~= "Disabled" and not l_menu_0.get("modifier_lr_addition_" .. l_v145_0);
                end
            });
            l_menu_0.new(v149:slider("  >  Left degree", -180, 180, 0, 1, "\194\176"), "left_modifier_degree_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("modifier_" .. l_v145_0) ~= "Disabled" and l_menu_0.get("modifier_lr_addition_" .. l_v145_0);
                end
            });
            l_menu_0.new(v149:slider("  >  Right degree", -180, 180, 0, 1, "\194\176"), "right_modifier_degree_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("modifier_" .. l_v145_0) ~= "Disabled" and l_menu_0.get("modifier_lr_addition_" .. l_v145_0);
                end
            });
            l_menu_0.new(v149:combo("Body yaw", {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Jitter", 
                [4] = "Delay"
            }), "body_yaw_mode_" .. l_v145_0, "", {
                [1] = l_v148_0
            });
            l_menu_0.new(v149:slider("  >  Delay tick", 1, 64, 10), "delay_tick_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) == "Delay";
                end
            });
            l_menu_0.new(v149:combo("  >  Desync mode", {
                [1] = "Static", 
                [2] = "Jitter", 
                [3] = "Randomize", 
                [4] = "Step+", 
                [5] = "Adaptive"
            }), "desync_mode_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled";
                end
            });
            l_menu_0.new(v149:slider("  >  Randomize", 0, 60, 60, 1, "\194\176"), "randomize_fake_yaw_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled" and l_menu_0.get("desync_mode_" .. l_v145_0) == "Randomize";
                end
            });
            l_menu_0.new(v149:slider("  >  Left", 0, 60, 60, 1, "\194\176"), "left_fake_yaw_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled" and l_menu_0.get("desync_mode_" .. l_v145_0) ~= "Step+" and l_menu_0.get("desync_mode_" .. l_v145_0) ~= "Adaptive";
                end
            });
            l_menu_0.new(v149:slider("  >  Right", 0, 60, 60, 1, "\194\176"), "right_fake_yaw_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled" and l_menu_0.get("desync_mode_" .. l_v145_0) ~= "Step+" and l_menu_0.get("desync_mode_" .. l_v145_0) ~= "Adaptive";
                end
            });
            l_menu_0.new(v149:slider("  >  Step+ ticks", 1, 15, 4, 1, "\194\176"), "step_fake_yaw_ticks_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("desync_mode_" .. l_v145_0) == "Step+";
                end
            });
            l_menu_0.new(v149:slider("  >  Step+ value", 1, 60, 1, 1, "\194\176"), "step_fake_yaw_value_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("desync_mode_" .. l_v145_0) == "Step+";
                end
            });
            l_menu_0.new(v149:slider("  >  Step+ minimum", 0, 60, 0, 1, "\194\176"), "step_fake_yaw_min_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("desync_mode_" .. l_v145_0) == "Step+";
                end
            });
            l_menu_0.new(v149:slider("  >  Step+ maximum", 0, 60, 60, 1, "\194\176"), "step_fake_yaw_max_" .. l_v145_0, "", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("desync_mode_" .. l_v145_0) == "Step+";
                end
            });
            l_menu_0.new(v149:label("Options"), "body_yaw_options_" .. l_v145_0, "-", {
                [1] = l_v148_0, 
                [2] = function()
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                    return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled";
                end
            })(function(v152)
                -- upvalues: l_menu_0 (ref), l_v145_0 (ref), l_v148_0 (ref)
                l_menu_0.new(v152:switch("Avoid overlap"), "avoid_overlap_" .. l_v145_0, "", {
                    [1] = l_v148_0, 
                    [2] = function()
                        -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                        return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled";
                    end
                });
                l_menu_0.new(v152:combo("Freestanding", {
                    [1] = "Off", 
                    [2] = "Peek fake", 
                    [3] = "Peek real"
                }), "freestanding_desync_" .. l_v145_0, "", {
                    [1] = l_v148_0, 
                    [2] = function()
                        -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                        return l_menu_0.get("body_yaw_mode_" .. l_v145_0) ~= "Disabled";
                    end
                });
            end);
            if l_v145_0 ~= "Fakelag" then
                l_menu_0.new(v149:switch("Defensive AA"), "defensive_aa_" .. l_v145_0, "", {
                    [1] = l_v148_0
                })(function(v153)
                    -- upvalues: l_menu_0 (ref), l_v145_0 (ref), l_v148_0 (ref)
                    l_menu_0.new(v153:combo("Pitch", {
                        [1] = "Default", 
                        [2] = "Jitter", 
                        [3] = "Spin", 
                        [4] = "Random"
                    }), "defensive_pitch_mode_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("Speed \nPitch", 1, 45, 15), "defensive_pitch_speed_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_pitch_mode_" .. l_v145_0) == "Spin" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("\nPitch min", -89, 89, -45), "defensive_pitch_min_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_pitch_mode_" .. l_v145_0) ~= "Default" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("\nPitch max", -89, 89, 45), "defensive_pitch_max_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_pitch_mode_" .. l_v145_0) ~= "Default" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:combo("Yaw", {
                        [1] = "Default", 
                        [2] = "Jitter", 
                        [3] = "Spin", 
                        [4] = "Random"
                    }), "defensive_yaw_mode_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("Speed \nYaw", 1, 45, 25), "defensive_yaw_speed_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_yaw_mode_" .. l_v145_0) == "Spin" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("\nYaw min", -180, 180, -90), "defensive_yaw_min_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_yaw_mode_" .. l_v145_0) ~= "Default" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:slider("\nYaw max", -180, 180, 90), "defensive_yaw_max_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_yaw_mode_" .. l_v145_0) ~= "Default" and l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:switch("Anti-bruteforce", true), "defensive_anti_bruteforce_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:selectable("Avoidance [\a00FF00FFsafety\aDEFAULT]", {
                        [1] = "Unsafety ticks", 
                        [2] = "Enemy ping spike", 
                        [3] = "Local knife"
                    }), "avoidance_defensive_aa_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:switch("Static original aa [\aFFFF00FFalt\aDEFAULT]"), "static_defensive_aa_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                    l_menu_0.new(v153:switch("No choke [\aFF0000FFunsafety\aDEFAULT]"), "nochoke_defensive_aa_" .. l_v145_0, "", {
                        [1] = l_v148_0, 
                        [2] = function()
                            -- upvalues: l_menu_0 (ref), l_v145_0 (ref)
                            return l_menu_0.get("defensive_aa_" .. l_v145_0);
                        end
                    });
                end);
            end;
        end;
    end;
end;
l_menu_0.new(v19.tab.misc.global:list("\nother_tab_selection", {
    [1] = "Visual", 
    [2] = "Misc"
}), "other_tab_selection", "", {});
l_menu_0.new(v19.tab.misc.main:switch("Hide animation on load"), "disable_load_animation", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Center indicators"), "center_indicator", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v154)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v154:switch("Minimum damage"), "center_indicator_damage", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator");
        end
    });
    l_menu_0.new(v154:combo("Indicator type", {
        [1] = "New", 
        [2] = "Legacy"
    }), "center_indicator_style", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator");
        end
    });
    l_menu_0.new(v154:color_picker("Color", color(108, 133, 182, 255)), "center_indicator_color", "c", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator") and l_menu_0.get("center_indicator_style") == "New";
        end
    });
    l_menu_0.new(v154:selectable("Settings", {
        [1] = "build", 
        [2] = "anti-aim state", 
        [3] = "keybinds"
    }), "center_indicator_settings", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator") and l_menu_0.get("center_indicator_style") == "New";
        end
    });
    l_menu_0.new(v154:combo("Double tap text", {
        [1] = "dt", 
        [2] = "double tap", 
        [3] = "rapid fire", 
        [4] = "rapid"
    }), "center_indicator_dt_text", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator") and l_menu_0.contains("center_indicator_settings", "keybinds") and l_menu_0.get("center_indicator_style") == "New";
        end
    });
    l_menu_0.new(v154:combo("Freestanding text", {
        [1] = "fs", 
        [2] = "freestand", 
        [3] = "auto direction", 
        [4] = "ideal yaw"
    }), "center_indicator_fs_text", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("center_indicator") and l_menu_0.contains("center_indicator_settings", "keybinds") and l_menu_0.get("center_indicator_style") == "New";
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Slow down indicator"), "slow_down_indicator", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Lag comp. breaker indicator"), "lag_comp_breaker_indicator", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.misc.main:selectable("Feature indicators", {
    [1] = "Force safe point", 
    [2] = "Force body aim", 
    [3] = "Ping spike", 
    [4] = "Double tap", 
    [5] = "Duck peek assist", 
    [6] = "Freestanding", 
    [7] = "On shot anti-aim", 
    [8] = "Minimum damage override"
}), "feature_indicators", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Manual yaw base arrows"), "manual_yaw_base_arrows", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v155)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v155:color_picker("Color", color(255, 255, 255, 255)), "manual_yaw_base_arrows_color", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("manual_yaw_base_arrows");
        end
    });
    l_menu_0.new(v155:slider("Distance", 50, 150, 75, 1, "px"), "manual_yaw_base_arrows_distance", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("manual_yaw_base_arrows");
        end
    });
    l_menu_0.new(v155:switch("Moving animation", true), "manual_yaw_base_arrows_moving_animation", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("manual_yaw_base_arrows");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Better scope overlay"), "scope_overlay", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v156)
    -- upvalues: l_menu_0 (ref), v14 (ref), v12 (ref)
    l_menu_0.new(v156:color_picker("Color", v14.white), "scope_overlay_accent_color", "c", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("scope_overlay");
        end
    });
    l_menu_0.new(v156:selectable("Settings", {
        [1] = "Spread dependency", 
        [2] = "Inverted"
    }), "scope_overlay_settings", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("scope_overlay");
        end
    });
    l_menu_0.new(v156:slider("Size", 0, v12.screen_size.y, 50), "scope_overlay_size", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("scope_overlay");
        end
    });
    l_menu_0.new(v156:slider("Gap", 0, v12.screen_size.y, 5), "scope_overlay_gap", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("scope_overlay");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Keep scope transparency"), "keep_scope_transparency", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
});
l_menu_0.new(v19.tab.misc.main:label("Ambient tools"), "ambient_tools", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v157)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v157:switch("Wall dyeing"), "wall_dyeing_switch", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1;
        end
    });
    l_menu_0.new(v157:color_picker("\nWall dyeing value", color(33, 33, 33, 135)), "wall_dyeing_value", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("wall_dyeing_switch");
        end
    });
    l_menu_0.new(v157:slider("Bloom", 0, 250, 0, 1, "%"), "bloom_value", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1;
        end
    });
    l_menu_0.new(v157:slider("Exposure", 0, 200, 0, 1, "%"), "exposure_value", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1;
        end
    });
    l_menu_0.new(v157:slider("Model brightness", 0, 200, 0, 1, "%"), "model_brightness_value", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1;
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Aspect ratio"), "aspect_ratio", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v158)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v158:slider("Value", 0, 300, 0, 0.01), "aspect_ratio_value", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("aspect_ratio");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Override viewmodel"), "override_viewmodel", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 1;
    end
})(function(v159)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v159:selectable("Options", {
        [1] = "Follow aimbot", 
        [2] = "Fakeduck animation"
    }), "override_viewmodel_options", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Fov", -1000, 1000, 600, 0.1), "override_viewmodel_fov", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Offset x", -100, 100, 10, 0.1, "u"), "override_viewmodel_x", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Offset y", -100, 100, 10, 0.1, "u"), "override_viewmodel_y", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Offset z", -100, 100, -15, 0.1, "u"), "override_viewmodel_z", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Pitch", -90, 90, 0, 1, function(v160)
        if v160 == 0 then
            return "Off";
        else
            return v160 .. "\194\176";
        end;
    end), "override_viewmodel_pitch", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Yaw", -90, 90, 0, 1, function(v161)
        if v161 == 0 then
            return "Off";
        else
            return v161 .. "\194\176";
        end;
    end), "override_viewmodel_yaw", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
    l_menu_0.new(v159:slider("Roll", -180, 180, 0, 1, function(v162)
        if v162 == 0 then
            return "Off";
        else
            return v162 .. "\194\176";
        end;
    end), "override_viewmodel_roll", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 1 and l_menu_0.get("override_viewmodel");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Fast ladder"), "fast_ladder", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("No fall damage"), "no_fall_damage", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Quick fall"), "quick_fall", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Super toss"), "super_toss", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("No spread meta [\aFF0000FFunsafety\aDEFAULT]"), "force_ragebot_fire", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
})(function(v163)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v163:switch("Add to indicators"), "force_ragebot_fire_indicator", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("force_ragebot_fire");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Animation breaker"), "animfix", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
})(function(v164)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v164:selectable("Old elements", {
        [1] = "Adjust body lean", 
        [2] = "Slide slow-walking", 
        [3] = "Reset pitch on land", 
        [4] = "Break legs while in air", 
        [5] = "Break legs while landing"
    }), "animfix_elements", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix");
        end
    });
    l_menu_0.new(v164:selectable("Sliding elements", {
        [1] = "While walking", 
        [2] = "While running", 
        [3] = "While crouching"
    }), "animfix_slide", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Slide slow-walking");
        end
    });
    l_menu_0.new(v164:slider("Body lean value", 0, 100, 0, 1, function(v165)
        if v165 == 0 then
            return "Disabled";
        elseif v165 == 35 then
            return "Small";
        elseif v165 == 50 then
            return "Medium";
        elseif v165 == 75 then
            return "High";
        elseif v165 == 100 then
            return "Extreme";
        else
            return v165 .. "%";
        end;
    end), "animfix_bodylean", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Adjust body lean");
        end
    });
    l_menu_0.new(v164:switch("Michael Joseph Jackson"), "animfix_air_moonwalk", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Break legs while in air");
        end
    });
    l_menu_0.new(v164:slider("Air value", 0, 10, 5, 0.1, function(v166)
        if v166 == 0 then
            return "Disabled";
        elseif v166 == 5 then
            return "Default";
        elseif v166 == 100 then
            return "Maximum";
        else
            return v166 / 10 .. "s";
        end;
    end), "animfix_air", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Break legs while in air");
        end
    });
    l_menu_0.new(v164:switch("Moonwalk mode"), "animfix_land_moonwalk", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Break legs while landing");
        end
    });
    l_menu_0.new(v164:slider("Land value", 0, 100, 50, 1, function(v167)
        if v167 == 0 then
            return "Slowest";
        elseif v167 == 50 then
            return "Fastest";
        elseif v167 == 100 then
            return "Disabled";
        else
            return v167 .. "%";
        end;
    end), "animfix_land", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("animfix") and l_menu_0.contains("animfix_elements", "Break legs while landing");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Logger"), "loggger", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
})(function(v168)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v168:listable("Events", {
        [1] = "ragebot", 
        [2] = "other damage", 
        [3] = "getting hurt", 
        [4] = "anti-aim"
    }), "logger_events", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("loggger");
        end
    });
    l_menu_0.new(v168:listable("Output", {
        [1] = "Console", 
        [2] = "Screen"
    }), "logger_output", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("loggger");
        end
    });
end);
l_menu_0.new(v19.tab.misc.main:switch("Clantag"), "clantag", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
});
l_menu_0.new(v19.tab.misc.main:switch("Trash talk on kill"), "trash_talk_on_kill", "", {
    [1] = function()
        -- upvalues: l_menu_0 (ref)
        return l_menu_0.get("other_tab_selection") == 2;
    end
})(function(v169)
    -- upvalues: l_menu_0 (ref)
    l_menu_0.new(v169:combo("Mode", {
        [1] = "Preset", 
        [2] = "Trash"
    }), "trash_talk_on_kill_mode", "", {
        [1] = function()
            -- upvalues: l_menu_0 (ref)
            return l_menu_0.get("other_tab_selection") == 2 and l_menu_0.get("trash_talk_on_kill");
        end
    });
end);
v22.states = {
    slowwalk = 4, 
    in_use = 8, 
    air_crouch = 7, 
    air = 6, 
    crouching = 5, 
    moving = 3, 
    standing = 2, 
    unknown = -1, 
    fakelag = 9
};
v22.states_names = {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slowwalk", 
    [5] = "Crouch", 
    [6] = "In air", 
    [7] = "In air duck", 
    [8] = "In use", 
    [-1] = "Unknown", 
    [9] = "Fakelag"
};
v22.player_state = 1;
v22.update_player_state = function(v170)
    -- upvalues: l_bit_0 (ref), v11 (ref), v22 (ref), l_menu_0 (ref)
    local v171 = entity.get_local_player();
    if v171 == nil then
        return;
    else
        local l_m_fFlags_0 = v171.m_fFlags;
        local v173 = l_bit_0.band(l_m_fFlags_0, l_bit_0.lshift(1, 1)) ~= 0 or v11.fakeduck:get();
        local v174 = l_bit_0.band(l_m_fFlags_0, l_bit_0.lshift(1, 0)) ~= 0;
        local v175 = v171.m_vecVelocity:length() < 2;
        local v176 = v11.slowwalk:get();
        local l_in_jump_0 = v170.in_jump;
        if common.is_button_down(69) then
            v22.player_state = v22.states.in_use;
            return;
        elseif not v11.hide_shots.switch:get() and not v11.doubletap.switch:get() and l_menu_0.get("switch_Fakelag") then
            v22.player_state = v22.states.fakelag;
            return;
        elseif v173 and (l_in_jump_0 or not v174) then
            v22.player_state = v22.states.air_crouch;
            return;
        elseif l_in_jump_0 or not v174 then
            v22.player_state = v22.states.air;
            return;
        elseif v176 then
            v22.player_state = v22.states.slowwalk;
            return;
        elseif not v173 and v175 then
            v22.player_state = v22.states.standing;
            return;
        elseif v173 then
            v22.player_state = v22.states.crouching;
            return;
        elseif not v173 and not v175 and not v176 then
            v22.player_state = v22.states.moving;
            return;
        else
            v22.player_state = v22.states.unknown;
            return;
        end;
    end;
end;
v22.value_table = {
    fake_step_temp = 0, 
    fake_right = 0, 
    fake_left = 0, 
    in_use = false, 
    yaw_modifier_offset = 0, 
    yaw_modifier_mode = "Disabled", 
    yaw_way_step_temp = 0, 
    yaw_way_step_ticktemp = 0, 
    yaw_add = 0, 
    body_yaw = false, 
    yaw_base = "At Target", 
    manual_degree = 0, 
    delay_jitter = false, 
    delay_jitter_curtick = 0, 
    cuz_jitter = false, 
    shit_aa_yaw = 0, 
    yaw = "Backward", 
    pitch = "Disabled", 
    freestanding_desync = "Off", 
    defensive = {
        pitch = 0, 
        yaw = 0, 
        state = false
    }, 
    fake_options = {
        [1] = " ", 
        [2] = " ", 
        [3] = " ", 
        [4] = " "
    }
};
v22.in_use_fix_setup = function(v178)
    -- upvalues: l_menu_0 (ref), v22 (ref), l_bit_0 (ref), v13 (ref)
    if not l_menu_0.get("antiaim_on_use") then
        return;
    else
        v22.value_table.in_use = false;
        local v179 = l_bit_0.band(v178.buttons, l_bit_0.lshift(1, 5)) > 0;
        local v180 = entity.get_local_player():get_player_weapon();
        local v181 = false;
        if v180 then
            v181 = v180:get_classname() == "CC4";
        end;
        local v182 = entity.get_local_player().m_bInBombZone and v181;
        local v183 = entity.get_entities("CPlantedC4");
        local v184 = #v183 > 0;
        local v185 = 100;
        if v184 then
            local v186 = v183[#v183]:get_origin();
            v185 = entity.get_local_player():get_origin():dist(v186);
        end;
        if v185 < 62 and entity.get_local_player().m_iTeamNum == 3 then
            return;
        else
            local v187 = render.camera_angles();
            local v188 = entity.get_local_player():get_eye_position();
            local v189 = v188 + v13.angle_to_vector(v187) * 8192;
            local v190 = utils.trace_line(v188, v189, entity.get_local_player(), 1174421515);
            local l_v179_0 = v179;
            if v190 and v190.fraction < 1 and v190.entity then
                local v192 = v190.entity:get_classname();
                l_v179_0 = v192 ~= "CWorld" and v192 ~= "CFuncBrush" and v192 ~= "CCSPlayer";
            end;
            if not l_v179_0 and not v182 then
                v178.buttons = l_bit_0.band(v178.buttons, l_bit_0.bnot(l_bit_0.lshift(1, 5)));
                v22.value_table.in_use = true;
            end;
            return;
        end;
    end;
end;
v22.desync_amount = 0;
v22.get_desync_amount = function()
    -- upvalues: v22 (ref)
    if globals.choked_commands == 0 then
        v22.desync_amount = math.floor(entity.get_local_player().m_flPoseParameter[11] * 120 - 60);
    end;
    return v22.desync_amount;
end;
v22.get_max_feet_yaw = function()
    -- upvalues: v22 (ref)
    return math.max(28, v22.get_desync_amount());
end;
v22.get_way_step = function(v193, v194, v195)
    -- upvalues: v22 (ref)
    local v196 = {
        [3] = {
            [1] = nil, 
            [2] = 0, 
            [1] = -v195, 
            [3] = v195
        }, 
        [4] = {
            [1] = -v195, 
            [2] = -v195 / 2, 
            [3] = v195 / 2, 
            [4] = v195
        }, 
        [5] = {
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = -v195, 
            [2] = -v195 / 2, 
            [4] = v195 / 2, 
            [5] = v195
        }
    };
    if globals.choked_commands == 0 then
        local v197 = v22.value_table.yaw_way_step_ticktemp % v194 + 1;
        v193 = v196[v194][v197];
        v22.value_table.yaw_way_step_ticktemp = v22.value_table.yaw_way_step_ticktemp + 1;
    end;
    return v193;
end;
v22.get_step = function(v198, v199, v200, v201, v202)
    if globals.tickcount % v202 == v202 - 1 then
        if v198 < v200 then
            v198 = v198 + v201;
        elseif v200 <= v198 then
            v198 = v199;
        end;
    end;
    return v198;
end;
v22.get_spin = function(v203, v204, v205, v206)
    local v207 = math.min(v204, v205);
    local v208 = math.max(v204, v205);
    if v203 < v208 then
        v203 = v203 + v206;
    elseif v208 <= v203 then
        v203 = v207;
    end;
    return v203;
end;
v22.ban_og_menu = function(v209)
    -- upvalues: v11 (ref)
    v11.pitch:disabled(v209);
    v11.yaw.mode:disabled(v209);
    v11.yaw_modifier.mode:disabled(v209);
    v11.body_yaw.switch:disabled(v209);
    v11.freestanding.switch:disabled(v209);
end;
v22.unoverride_og_menu = function()
    -- upvalues: v11 (ref)
    v11.doubletap.lag_options:override(nil);
    v11.hide_shots.options:override(nil);
    v11.fakelag.limit:override(nil);
    v11.pitch:override(nil);
    v11.yaw.mode:override(nil);
    v11.yaw.base:override(nil);
    v11.yaw.offset:override(nil);
    v11.yaw.avoid_backstab:override(nil);
    v11.yaw.defensive_aa:override(nil);
    v11.yaw_modifier.mode:override(nil);
    v11.yaw_modifier.offset:override(nil);
    v11.body_yaw.switch:override(nil);
    v11.body_yaw.left_limit:override(nil);
    v11.body_yaw.right_limit:override(nil);
    v11.body_yaw.fake_options:override(nil);
    v11.body_yaw.desync_freestand:override(nil);
    v11.freestanding.switch:override(nil);
    v11.freestanding.body_freestanding:override(nil);
    v11.freestanding.disable_yaw_modifiers:override(nil);
    v11.leg_movement:override(nil);
end;
v22.get_current_state = function()
    -- upvalues: v22 (ref), l_menu_0 (ref)
    local v210 = v22.states_names[v22.player_state];
    if l_menu_0.get("switch_" .. v210) then
        return v210;
    else
        return "Default";
    end;
end;
v22.get_config = function(v211)
    -- upvalues: v22 (ref), l_menu_0 (ref)
    if v22.player_state == -1 then
        return "Default";
    else
        return l_menu_0.get(v211 .. "_" .. v22.get_current_state());
    end;
end;
v22.disable_fakelag_helpers = function(v212)
    -- upvalues: v11 (ref), l_weapons_0 (ref), l_menu_0 (ref)
    v11.fakelag.limit:override();
    local v213 = entity.get_local_player();
    if v213 == nil then
        return;
    else
        local v214 = v213:get_player_weapon();
        if v214 == nil then
            return;
        else
            local l_idx_0 = l_weapons_0(v214).idx;
            if l_idx_0 == nil then
                return;
            else
                if l_menu_0.contains("disable_fakelag", "Double tap") and v11.doubletap.switch:get() and not v11.fakeduck:get() then
                    v11.fakelag.limit:override(1);
                end;
                if l_menu_0.contains("disable_fakelag", "Hide shots") and v11.hide_shots.switch:get() and not v11.fakeduck:get() then
                    v11.fakelag.limit:override(1);
                end;
                if l_menu_0.contains("disable_fakelag", "DT heavy pistols") and (l_idx_0 == 64 or l_idx_0 == 1) and v11.doubletap.switch:get() and not v11.fakeduck:get() then
                    v11.fakelag.limit:override(1);
                end;
                if l_menu_0.contains("disable_fakelag", "Standing") and v212.forwardmove == 0 and v212.sidemove == 0 and not v11.fakeduck:get() then
                    v11.fakelag.limit:override(1);
                end;
                if l_menu_0.contains("disable_fakelag", "Break fake duck") and v11.fakeduck:get() then
                    v11.fakelag.limit:override(v212.tickcount % 16 == 0 and 1 or nil);
                end;
                return;
            end;
        end;
    end;
end;
v22.legmovement_helpers = v25.safecall("g_antiaim.legmovement_helpers", true, function(v216)
    -- upvalues: v11 (ref), l_menu_0 (ref)
    v11.leg_movement:override();
    if l_menu_0.get("leg_breaker") == "Jitter" then
        v11.leg_movement:override(globals.tickcount % 6 > 3 and "Sliding" or "Walking");
    elseif l_menu_0.get("leg_breaker") == "Hide" then
        v11.leg_movement:override(v216.command_number % 3 == 0 and "Default" or "Sliding");
    end;
end);
v22.defensive_helpers = v25.safecall("g_antiaim.defensive_helpers", true, function(v217)
    -- upvalues: l_menu_0 (ref), v22 (ref), v11 (ref)
    if l_menu_0.contains("lc_breaker", v22.states_names[v22.player_state]) then
        v11.doubletap.lag_options:override("Always On");
        v11.hide_shots.options:override("Break LC");
    else
        v11.doubletap.lag_options:override(nil);
        v11.hide_shots.options:override(nil);
    end;
    if l_menu_0.contains("lp_breaker", v22.states_names[v22.player_state]) then
        v11.doubletap.fakelag_limit:set(v217.tickcount % 6 == 1 and 7 or 1);
    else
        v11.doubletap.fakelag_limit:set(1);
    end;
end);
v22.lagspam_helpers = v25.safecall("g_antiaim.lagspam_helpers", true, function()
    -- upvalues: l_bit_0 (ref), l_menu_0 (ref)
    local v218 = entity.get_local_player();
    if v218 == nil then
        return;
    else
        local v219 = l_bit_0.band(v218.m_fFlags, l_bit_0.lshift(1, 0)) == 0;
        if l_menu_0.get("teleport_air_spam") and v219 and entity.get_threat(true) then
            rage.exploit:force_teleport();
            rage.exploit:force_charge();
        end;
        return;
    end;
end);
v22.defensive_anti_bruteforce = {
    phase = 1, 
    last_time = 0, 
    work = false
};
v22.defensive_anti_bruteforce.handle = function(v220)
    -- upvalues: v22 (ref), l_menu_0 (ref), v23 (ref)
    local v221 = entity.get(v220.userid, true);
    local v222 = entity.get_local_player();
    if not v221 or not v221:is_enemy() or not v222:is_alive() then
        return;
    elseif not v22.get_config("defensive_anti_bruteforce") then
        return;
    else
        local v223 = v222:get_hitbox_position(0);
        local l_m_vecOrigin_0 = v221.m_vecOrigin;
        local v225 = ((v220.y - l_m_vecOrigin_0.y) * v223.x - (v220.x - l_m_vecOrigin_0.x) * v223.y + v220.x * l_m_vecOrigin_0.y - v220.y * l_m_vecOrigin_0.x) / math.sqrt((v220.y - l_m_vecOrigin_0.y) ^ 2 + (v220.x - l_m_vecOrigin_0.x) ^ 2);
        if math.abs(v225) <= 35 and globals.curtime - v22.defensive_anti_bruteforce.last_time > 0.015 then
            v22.defensive_anti_bruteforce.work = true;
            if v22.defensive_anti_bruteforce.phase < 5 then
                v22.defensive_anti_bruteforce.phase = v22.defensive_anti_bruteforce.phase + 1;
            else
                v22.defensive_anti_bruteforce.phase = 1;
            end;
            if l_menu_0.contains("logger_events", 4) then
                table.insert(v23.notify._table, {
                    alpha = 0, 
                    text = "Anti-Bruteforce Reversed due to enemy shot - State: P" .. v22.defensive_anti_bruteforce.phase .. "[DEFENSIVE]", 
                    time = globals.realtime + 3.8
                });
            end;
            v22.defensive_anti_bruteforce.last_time = globals.curtime;
        end;
        return;
    end;
end;
v22.defensive_anti_bruteforce.reset = function()
    -- upvalues: v22 (ref)
    v22.defensive_anti_bruteforce.work = false;
    v22.defensive_anti_bruteforce.phase = 0;
    v22.defensive_anti_bruteforce.last_time = 0;
end;
v22.handler = function(v226)
    -- upvalues: v22 (ref), l_menu_0 (ref), v11 (ref), v23 (ref), l_defensive_0 (ref), l_weapons_0 (ref)
    v22.in_use_fix_setup(v226);
    v22.update_player_state(v226);
    v22.disable_fakelag_helpers(v226);
    v22.legmovement_helpers(v226);
    v22.defensive_helpers(v226);
    local v227 = entity.get_local_player();
    if not l_menu_0.get("enable_antiaim") or v22.player_state == -1 then
        v22.ban_og_menu(false);
        v22.unoverride_og_menu();
        return;
    else
        v22.ban_og_menu(true);
        if l_menu_0.get("shitaa_on_round_end") then
            local v228 = entity.get_players(true);
            local v229 = {};
            for _, v231 in ipairs(v228) do
                if v231 ~= v227 and v231:is_alive() then
                    table.insert(v229, v231);
                end;
            end;
            if #v229 == 0 then
                v11.pitch:override("Disabled");
                v11.yaw.mode:override("Backward");
                v11.yaw.base:override("Local View");
                v11.yaw.defensive_aa:override(false);
                v22.value_table.shit_aa_yaw = v22.get_spin(v22.value_table.shit_aa_yaw, -180, 180, 45);
                v11.yaw.offset:override(v22.value_table.shit_aa_yaw);
                v11.body_yaw.switch:override(false);
                v11.freestanding.switch:override(false);
                v226.no_choke = true;
                return;
            end;
        end;
        v22.lagspam_helpers();
        if globals.choked_commands == 0 then
            v22.value_table.cuz_jitter = not v22.value_table.cuz_jitter;
        end;
        if v22.get_config("delay_tick") == 1 then
            if v226.choked_commands == 0 then
                v22.value_table.delay_jitter_curtick = v22.value_table.delay_jitter_curtick + 1;
            end;
            if v22.value_table.delay_jitter_curtick >= 8 then
                v22.value_table.delay_jitter_curtick = 0;
            end;
            if v22.value_table.delay_jitter_curtick == 0 then
                v22.value_table.delay_jitter = true;
            elseif v22.value_table.delay_jitter_curtick == 1 then
                v22.value_table.delay_jitter = false;
            elseif v22.value_table.delay_jitter_curtick == 2 then
                v22.value_table.delay_jitter = false;
            elseif v22.value_table.delay_jitter_curtick == 3 then
                v22.value_table.delay_jitter = false;
            elseif v22.value_table.delay_jitter_curtick == 4 then
                v22.value_table.delay_jitter = true;
            elseif v22.value_table.delay_jitter_curtick == 5 then
                v22.value_table.delay_jitter = false;
            elseif v22.value_table.delay_jitter_curtick == 6 then
                v22.value_table.delay_jitter = true;
            elseif v22.value_table.delay_jitter_curtick == 7 then
                v22.value_table.delay_jitter = true;
            end;
        elseif globals.tickcount > v22.value_table.delay_jitter_curtick + v22.get_config("delay_tick") then
            if v226.choked_commands == 0 then
                v22.value_table.delay_jitter = not v22.value_table.delay_jitter;
                v22.value_table.delay_jitter_curtick = globals.tickcount;
            end;
        elseif globals.tickcount < v22.value_table.delay_jitter_curtick then
            v22.value_table.delay_jitter_curtick = globals.tickcount;
        end;
        v22.value_table.manual_degree = 0;
        if common.is_button_down(69) then
            v22.value_table.manual_degree = 0;
        elseif l_menu_0.get("manual_yaw_base") == "Forward" then
            v22.value_table.manual_degree = 180;
        elseif l_menu_0.get("manual_yaw_base") == "Leftward" then
            if l_menu_0.get("manual_custom_offset") then
                v22.value_table.manual_degree = l_menu_0.get("manual_left_offset");
            else
                v22.value_table.manual_degree = -90;
            end;
        elseif l_menu_0.get("manual_yaw_base") == "Rightward" then
            if l_menu_0.get("manual_desync_offset") then
                v22.value_table.manual_degree = l_menu_0.get("manual_right_offset");
            else
                v22.value_table.manual_degree = 90;
            end;
        end;
        if l_menu_0.contains("logger_events", 4) and v22.defensive_anti_bruteforce.work and globals.curtime - v22.defensive_anti_bruteforce.last_time > 5 then
            v22.defensive_anti_bruteforce.reset();
            table.insert(v23.notify._table, {
                alpha = 0, 
                text = "Anti-Bruteforce reset", 
                time = globals.realtime + 3.8
            });
        end;
        v22.value_table.pitch = v22.get_config("pitch") == "Up" and "Fake Up" or v22.get_config("pitch");
        v22.value_table.yaw = "Backward";
        v22.value_table.yaw_base = v22.get_config("at_target") and "At Target" or "Local View";
        if v22.get_config("body_yaw_mode") == "Delay" then
            v22.value_table.yaw_add = v22.value_table.delay_jitter and v22.get_config("right_yaw_add") or v22.get_config("left_yaw_add");
        else
            v22.value_table.yaw_add = v22.get_desync_amount() > 0 and v22.get_config("left_yaw_add") or v22.get_config("right_yaw_add");
        end;
        if not v22.get_config("modifier_lr_addition") then
            v22.value_table.yaw_modifier_offset = v22.get_config("modifier_degree");
        else
            v22.value_table.yaw_modifier_offset = v22.get_desync_amount() > 0 and v22.get_config("left_modifier_degree") or v22.get_config("right_modifier_degree");
        end;
        if v22.get_config("modifier") == "X-way" then
            v22.value_table.yaw_way_step_temp = v22.get_way_step(v22.value_table.yaw_way_step_temp, v22.get_config("modifier_ways"), v22.value_table.yaw_modifier_offset);
            v11.yaw_modifier.mode:override("Disabled");
            v11.yaw.offset:override(math.normalize_yaw(v22.value_table.yaw_add + v22.value_table.yaw_way_step_temp + v22.value_table.manual_degree));
        elseif v22.get_config("modifier") == "Dynamic" then
            v11.yaw.offset:override(math.normalize_yaw(v22.value_table.yaw_add + v22.value_table.manual_degree));
            v11.yaw_modifier.mode:override(utils.random_int(1, 2) == 1 and "Center" or "Offset");
            v11.yaw_modifier.offset:override(v22.value_table.yaw_modifier_offset);
        elseif v22.get_config("modifier") == "Center" and v22.get_config("body_yaw_mode") == "Delay" then
            v11.yaw.offset:override(math.normalize_yaw(v22.value_table.yaw_add + (v22.value_table.delay_jitter and -v22.value_table.yaw_modifier_offset / 2 or v22.value_table.yaw_modifier_offset / 2) + v22.value_table.manual_degree));
            v11.yaw_modifier.mode:override("Disabled");
        elseif v22.get_config("modifier") == "Offset" and v22.get_config("body_yaw_mode") == "Delay" then
            v11.yaw.offset:override(math.normalize_yaw(v22.value_table.yaw_add + (v22.value_table.delay_jitter and 0 or v22.value_table.yaw_modifier_offset) + v22.value_table.manual_degree));
            v11.yaw_modifier.mode:override("Disabled");
        else
            v11.yaw.offset:override(math.normalize_yaw(v22.value_table.yaw_add + v22.value_table.manual_degree));
            v11.yaw_modifier.mode:override(v22.get_config("modifier"));
            v11.yaw_modifier.offset:override(v22.value_table.yaw_modifier_offset);
        end;
        if v22.get_config("body_yaw_mode") == "Disabled" then
            v22.value_table.body_yaw = false;
        else
            v22.value_table.body_yaw = true;
            v11.body_yaw.inverter:override(nil);
            if v22.get_config("body_yaw_mode") == "Delay" then
                v11.body_yaw.inverter:override(not v22.value_table.delay_jitter);
            end;
            if v22.get_config("desync_mode") == "Static" then
                v22.value_table.fake_left = v22.get_config("left_fake_yaw");
                v22.value_table.fake_right = v22.get_config("right_fake_yaw");
            elseif v22.get_config("desync_mode") == "Jitter" then
                v22.value_table.fake_left = v22.value_table.cuz_jitter and 18 or v22.get_config("left_fake_yaw");
                v22.value_table.fake_right = v22.value_table.cuz_jitter and 18 or v22.get_config("right_fake_yaw");
            elseif v22.get_config("desync_mode") == "Randomize" then
                v22.value_table.fake_left = utils.random_int(v22.get_config("left_fake_yaw"), v22.get_config("randomize_fake_yaw"));
                v22.value_table.fake_right = utils.random_int(v22.get_config("right_fake_yaw"), v22.get_config("randomize_fake_yaw"));
            elseif v22.get_config("desync_mode") == "Step+" then
                v22.value_table.fake_step_temp = v22.get_step(v22.value_table.fake_step_temp, math.min(v22.get_config("step_fake_yaw_min"), v22.get_config("step_fake_yaw_max")), math.max(v22.get_config("step_fake_yaw_min"), v22.get_config("step_fake_yaw_max")), v22.get_config("step_fake_yaw_value"), v22.get_config("step_fake_yaw_ticks"));
                v22.value_table.fake_left = v22.value_table.fake_step_temp;
                v22.value_table.fake_right = v22.value_table.fake_step_temp;
            elseif v22.get_config("desync_mode") == "Adaptive" then
                v22.value_table.fake_left = math.abs(v22.get_max_feet_yaw());
                v22.value_table.fake_right = math.abs(v22.get_max_feet_yaw());
            end;
            v22.value_table.fake_options = {
                [1] = nil, 
                [2] = nil, 
                [3] = " ", 
                [4] = " ", 
                [1] = v22.get_config("avoid_overlap") and "Avoid Overlap" or " ", 
                [2] = v22.get_config("body_yaw_mode") == "Jitter" and "Jitter" or " "
            };
            v22.value_table.freestanding_desync = v22.get_config("freestanding_desync");
        end;
        v11.pitch:override(v22.value_table.pitch);
        v11.yaw.mode:override("Backward");
        v11.yaw.base:override(v22.value_table.yaw_base);
        v11.yaw.avoid_backstab:override(true);
        v11.body_yaw.switch:override(v22.value_table.body_yaw);
        v11.body_yaw.left_limit:override(v22.value_table.fake_left);
        v11.body_yaw.right_limit:override(v22.value_table.fake_right);
        v11.body_yaw.fake_options:override(v22.value_table.fake_options);
        v11.body_yaw.desync_freestand:override(v22.value_table.freestanding_desync);
        v11.freestanding.switch:override(l_menu_0.get("freestanding"));
        v11.freestanding.disable_yaw_modifiers:override(l_menu_0.get("freestanding_static_yaw"));
        v11.freestanding.body_freestanding:override(l_menu_0.get("freestanding_body_freestanding"));
        if v22.value_table.manual_degree ~= 0 or common.is_button_down(69) then
            v11.freestanding.switch:override(false);
        end;
        if v22.value_table.manual_degree ~= 0 then
            v11.yaw.base:override("Local View");
            if l_menu_0.get("manual_static_yaw") then
                v11.yaw.offset:override(v22.value_table.manual_degree);
                v11.yaw_modifier.offset:override(0);
                v11.body_yaw.inverter:override(false);
                v11.body_yaw.fake_options:override(" ", " ", " ", " ");
            end;
            if l_menu_0.get("manual_body_freestanding") then
                v11.body_yaw.desync_freestand:override("Peek Fake");
            end;
        end;
        local v232 = entity.get_threat();
        local v233 = l_defensive_0(true);
        local v234 = true;
        if l_menu_0.contains("avoidance_defensive_aa_" .. v22.get_current_state(), "Unsafety ticks") and (v233 < 6 or v233 > 9) then
            v234 = false;
        end;
        if entity.get_threat() ~= nil and l_menu_0.contains("avoidance_defensive_aa_" .. v22.get_current_state(), "Enemy ping spike") then
            local l_m_iPing_0 = v232:get_resource().m_iPing;
            if not l_m_iPing_0 or l_m_iPing_0 < 15 or l_m_iPing_0 > 90 then
                v234 = false;
            end;
        end;
        if l_menu_0.contains("avoidance_defensive_aa_" .. v22.get_current_state(), "Local knife") and v227:get_player_weapon() ~= nil and l_weapons_0(v227:get_player_weapon()).type == "knife" then
            v234 = false;
        end;
        if v22.player_state ~= 9 then
            if v22.get_config("defensive_aa") and v234 then
                v11.yaw.defensive_aa:override(true);
                if v22.get_config("defensive_pitch_mode") == "Jitter" then
                    v22.value_table.defensive.pitch = v22.value_table.cuz_jitter and v22.get_config("defensive_pitch_min") or v22.get_config("defensive_pitch_max");
                elseif v22.get_config("defensive_pitch_mode") == "Spin" then
                    v22.value_table.defensive.pitch = v22.get_spin(v22.value_table.defensive.pitch, v22.get_config("defensive_pitch_min"), v22.get_config("defensive_pitch_max"), v22.get_config("defensive_pitch_speed"));
                elseif v22.get_config("defensive_pitch_mode") == "Random" then
                    v22.value_table.defensive.pitch = utils.random_int(v22.get_config("defensive_pitch_min"), v22.get_config("defensive_pitch_max"));
                end;
                if v22.get_config("defensive_yaw_mode") == "Jitter" then
                    v22.value_table.defensive.yaw = v22.value_table.cuz_jitter and v22.get_config("defensive_yaw_min") or v22.get_config("defensive_yaw_max");
                elseif v22.get_config("defensive_yaw_mode") == "Spin" then
                    v22.value_table.defensive.yaw = v22.get_spin(v22.value_table.defensive.yaw, v22.get_config("defensive_yaw_min"), v22.get_config("defensive_yaw_max"), v22.get_config("defensive_yaw_speed"));
                elseif v22.get_config("defensive_yaw_mode") == "Random" then
                    v22.value_table.defensive.yaw = utils.random_int(v22.get_config("defensive_yaw_min"), v22.get_config("defensive_yaw_max"));
                end;
                if l_defensive_0() and v22.get_config("nochoke_defensive_aa") then
                    v226.no_choke = true;
                end;
                if l_defensive_0() and v22.get_config("static_defensive_aa") then
                    v11.yaw.offset:override(v22.value_table.manual_degree);
                    v11.yaw_modifier.offset:override(0);
                    v11.body_yaw.fake_options:override(" ", " ", " ", " ");
                    v11.body_yaw.desync_freestand:override("Off");
                end;
                if v22.get_config("defensive_pitch_mode") ~= "Default" then
                    rage.antiaim:override_hidden_pitch(math.clamp(v22.value_table.defensive.pitch, -89, 89));
                end;
                if v22.get_config("defensive_yaw_mode") ~= "Default" then
                    rage.antiaim:override_hidden_yaw_offset(math.clamp(v22.value_table.defensive.yaw, -180, 180));
                end;
            else
                v11.yaw.defensive_aa:override(false);
            end;
        end;
        return;
    end;
end;
v18.tahoma_loadanim = render.load_font("tahoma", 120, "ab");
v23.onscript_load_time = globals.realtime;
v23.onscript_load = function()
    -- upvalues: v16 (ref), v23 (ref), l_menu_0 (ref), v12 (ref), v14 (ref), v18 (ref)
    local v236 = {
        main = v16.new("on_script_load_main", v23.onscript_load_time + 4 > globals.realtime and 255 or 0)
    };
    if v236.main < 1 or l_menu_0.get("disable_load_animation") then
        return;
    else
        render.rect(vector(0, 0), vector(v12.screen_size.x, v12.screen_size.y), v14.black:alpha_modulate(math.min(180, v236.main)));
        local v237 = v12.screen_size.x / 2;
        local v238 = v12.screen_size.y / 2;
        render.text(v18.tahoma_loadanim, vector(v237 + 1, v238 - 5 + 1), color(0, 0, 0, v236.main), "c", "\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134");
        render.text(v18.tahoma_loadanim, vector(v237 - 1, v238 - 5 - 1), color(0, 0, 0, v236.main), "c", "\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134");
        render.text(v18.tahoma_loadanim, vector(v237 + 1, v238 - 5 - 1), color(0, 0, 0, v236.main), "c", "\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134");
        render.text(v18.tahoma_loadanim, vector(v237 - 1, v238 - 5 + 1), color(0, 0, 0, v236.main), "c", "\240\157\146\145\240\157\146\130\240\157\146\147\240\157\146\130\240\157\146\133\240\157\146\138\240\157\146\148\240\157\146\134");
        render.text(v18.tahoma_loadanim, vector(v237, v238 - 5), color(255, 255, 255, v236.main), "c", string.upper(v16.animated_lua_text:get_animated_text()));
        return;
    end;
end;
v18.comic_centerindicator = render.load_font("comic", 20, "aid");
v23.new_center_indicator_handle = function()
    -- upvalues: l_menu_0 (ref), v16 (ref), v22 (ref), v14 (ref), v11 (ref), v12 (ref), v18 (ref), l_gradient_0 (ref), l_defensive_0 (ref)
    local v239 = {};
    local v240 = l_menu_0.get("center_indicator") and l_menu_0.get("center_indicator_style") == "New";
    local v241 = l_menu_0.get("center_indicator_damage");
    local v242 = l_menu_0.contains("center_indicator_settings", "build");
    local v243 = l_menu_0.contains("center_indicator_settings", "anti-aim state");
    local v244 = l_menu_0.contains("center_indicator_settings", "keybinds");
    local v245 = l_menu_0.get("center_indicator_color");
    v239.main = v16.new("screen_indication_main", v240 and 255 or 0);
    if v239.main < 1 then
        return;
    else
        local v246 = entity.get_local_player();
        if v246 == nil or not v246:is_alive() then
            return;
        else
            local l_m_bIsScoped_0 = v246.m_bIsScoped;
            local v248 = v16.new("adding_anim", 25);
            local v249 = {
                [1] = "default", 
                [2] = "standing", 
                [3] = "moving", 
                [4] = "slowwalk", 
                [5] = "crouch", 
                [6] = "in air", 
                [7] = "in air duck", 
                [8] = "in use", 
                [-1] = "unknown", 
                [9] = "fakelag"
            };
            v239.states = {};
            v239.states.len = v16.new("states_len", #v249[v22.player_state], 0.3);
            local v250 = {
                [1] = {
                    [1] = "state", 
                    [2] = v243, 
                    [3] = v14.white
                }, 
                [2] = {
                    "dt", 
                    v244 and v11.doubletap.switch:get(), 
                    color(255, 255, 255, 150)
                }, 
                [3] = {
                    [1] = "hide", 
                    [2] = v244 and v11.hide_shots.switch:get() and not v11.doubletap.switch:get(), 
                    [3] = v14.white
                }, 
                [4] = {
                    [1] = l_menu_0.get("center_indicator_fs_text"), 
                    [2] = v244 and l_menu_0.get("freestanding"), 
                    [3] = v14.white
                }, 
                [5] = {
                    [1] = "damage", 
                    [2] = v244 and v12.get_bind("Min. Damage")[1], 
                    [3] = v14.white
                }, 
                [6] = {
                    [1] = "hitchance", 
                    [2] = v244 and v12.get_bind("Hit Chance")[1], 
                    [3] = v14.white
                }, 
                [7] = {
                    [1] = "body", 
                    [2] = v244 and v11.body_aim.mode:get() == "Force", 
                    [3] = v14.white
                }, 
                [8] = {
                    [1] = "safe", 
                    [2] = v244 and v11.safe_point:get() == "Force", 
                    [3] = v14.white
                }
            };
            v239.minimum_damage = v16.new("minimum_damage_alpha", v240 and v241 and 255 or 0);
            render.text(1, v12.screen_size / 2 + vector(10, -20), v14.white:alpha_modulate(v239.minimum_damage), nil, v11.minimum_damage.value:get());
            local v251 = "paradise" .. (v242 and " autumn" or "");
            local v252 = render.measure_text(v18.comic_centerindicator, nil, v251);
            v239.lua_name = {};
            v239.lua_name.alpha = v16.new("lua_name_alpha", v240 and 255 or 0);
            v239.lua_name.text = l_gradient_0.text_animate(v251, 3, {
                [1] = v14.white, 
                [2] = v245
            });
            v239.lua_name.move = v16.new("lua_main_move", l_m_bIsScoped_0 and -5 or v252.x / 2);
            if v239.lua_name.alpha > 1 then
                render.shadow(v12.screen_size / 2 - vector(v239.lua_name.move, -v248 - 10), v12.screen_size / 2 - vector(v239.lua_name.move, -v248 - 10) + vector(v252.x, 0), v245:alpha_modulate(v239.lua_name.alpha), 20, 0);
                render.text(v18.comic_centerindicator, v12.screen_size / 2 - vector(v239.lua_name.move, -v248), v14.white:alpha_modulate(v239.lua_name.alpha), nil, v239.lua_name.text:get_animated_text());
                v239.lua_name.text:animate();
                v248 = v248 + v239.lua_name.alpha / 255 * 20;
            end;
            local v253 = "";
            v239.binds = {};
            for _, v255 in pairs(v250) do
                if v255[1] == "state" then
                    v253 = "' " .. v249[v22.player_state]:sub(0, v239.states.len) .. " '";
                elseif v255[1] == "dt" then
                    local l_colored_text_0 = v12.colored_text;
                    local v257 = {
                        [1] = (v11.auto_peek:get() and "ideal tick" or l_menu_0.get("center_indicator_dt_text")) .. " "
                    };
                    local v258 = {};
                    local v259;
                    if rage.exploit:get() == 1 and entity.can_shift_shot(v246) then
                        v259 = l_defensive_0() and "active" or "ready";
                    else
                        v259 = "waiting";
                    end;
                    v258[1] = v259;
                    v258[2] = rage.exploit:get() == 1 and (l_defensive_0() and color(67, 142, 219, 150) or color(140, 255, 100, 150)) or color(255, 64, 64, 150);
                    v253 = l_colored_text_0(v257, v258);
                elseif v255[1] == "hide" then
                    local l_colored_text_1 = v12.colored_text;
                    local v261 = {
                        [1] = "hide "
                    };
                    local v262 = {};
                    local v263;
                    if rage.exploit:get() == 1 and entity.can_shift_shot(v246) then
                        v263 = l_defensive_0() and "active" or "ready";
                    else
                        v263 = "waiting";
                    end;
                    v262[1] = v263;
                    v262[2] = rage.exploit:get() == 1 and (l_defensive_0() and color(67, 142, 219, 150) or color(140, 255, 100, 150)) or color(255, 64, 64, 150);
                    v253 = l_colored_text_1(v261, v262);
                else
                    v253 = v255[1];
                end;
                v239.binds[v255[1]] = {};
                v239.binds[v255[1]].alpha = v16.new("binds_alpha_" .. v255[1], v240 and v255[2] and 255 or 0);
                v239.binds[v255[1]].move = v16.new("binds_move_" .. v255[1], not l_m_bIsScoped_0 and render.measure_text(1, nil, v253).x / 2 or -5);
                if v239.binds[v255[1]].alpha > 1 then
                    render.text(1, v12.screen_size / 2 - vector(v239.binds[v255[1]].move, -v248), v255[3]:alpha_modulate(v239.binds[v255[1]].alpha), nil, v253);
                    v248 = v248 + v239.binds[v255[1]].alpha / 255 * 10;
                end;
            end;
            return;
        end;
    end;
end;
v23.old_center_indicator_handle = function()
    -- upvalues: l_menu_0 (ref), v16 (ref), v12 (ref), v14 (ref), v11 (ref)
    local v264 = {};
    local v265 = l_menu_0.get("center_indicator") and l_menu_0.get("center_indicator_style") == "Legacy";
    local v266 = l_menu_0.get("center_indicator_damage");
    v264.main = v16.new("screen_indication_old", v265 and 255 or 0);
    if v264.main < 1 then
        return;
    else
        local v267 = entity.get_local_player();
        if v267 == nil or not v267:is_alive() then
            return;
        else
            local v268 = v16.new("adding_anim", 0);
            v264.minimum_damage = v16.new("minimum_damage_alpha", v265 and v266 and 255 or 0);
            render.text(1, v12.screen_size / 2 + vector(10, -20), v14.white:alpha_modulate(v264.minimum_damage), nil, v11.minimum_damage.value:get());
            local v269, v270, v271 = v14.hsv_to_rgb(globals.realtime * 0.2, 1, 1, 1);
            render.text(1, vector(v12.screen_size.x / 2 + 5, v12.screen_size.y / 2 + 15 + v268), color(30, 251, 146, v264.main), nil, v14.gradient_text(v271, v269, v270, v264.main, v269, v270, v271, v264.main, ">_ " .. string.swaystring("PARADISE", 7)));
            local v272 = {
                [1] = {
                    [1] = "DT", 
                    [2] = v11.doubletap.switch:get(), 
                    [3] = rage.exploit:get() == 1 and entity.can_shift_shot(v267) and v14.white or color(255, 0, 0, 255)
                }, 
                [2] = {
                    [1] = "OS", 
                    [2] = v11.hide_shots.switch:get() and not v11.doubletap.switch:get(), 
                    [3] = v14.white
                }, 
                [3] = {
                    [1] = "FS", 
                    [2] = l_menu_0.get("freestanding"), 
                    [3] = v14.white
                }, 
                [4] = {
                    [1] = "BA", 
                    [2] = v11.body_aim.mode:get() == "Force", 
                    [3] = v14.white
                }, 
                [5] = {
                    [1] = "SP", 
                    [2] = v11.safe_point:get() == "Force", 
                    [3] = v14.white
                }
            };
            local v273 = "";
            v264.binds = {};
            for _, v275 in pairs(v272) do
                v273 = v275[1];
                v264.binds[v275[1]] = {};
                v264.binds[v275[1]].alpha = v16.new("binds_alpha_" .. v275[1], v265 and v275[2] and 255 or 0);
                if v264.binds[v275[1]].alpha > 1 then
                    render.text(1, v12.screen_size / 2 - vector(-5, -30 - v268), v275[3]:alpha_modulate(v264.binds[v275[1]].alpha), nil, v273);
                    v268 = v268 + v264.binds[v275[1]].alpha / 255 * 10;
                end;
            end;
            return;
        end;
    end;
end;
v23.slow_down_indicator_handler = function()
    -- upvalues: l_menu_0 (ref), v16 (ref), v14 (ref), v12 (ref), v17 (ref)
    local v276 = entity.get_local_player();
    if v276 == nil then
        return;
    else
        local v277 = l_menu_0.get("slow_down_indicator");
        local v278 = v16.new("m_flVelocityModifier", ui.get_alpha() > 0 and v276.m_flVelocityModifier == 1 and 0.5 or v276:is_alive() and v276.m_flVelocityModifier or 1);
        local v279 = v16.new("drag_anim", v277 and ui.get_alpha() > 0.5 and 255 or 0);
        local l_new_0 = v16.new;
        local v281 = "velocity_indicator";
        local v282;
        if v277 then
            v282 = ui.get_alpha() > 0.5 and 255 or v278 ~= 1 and 255 or 0;
        else
            v282 = 0;
        end;
        l_new_0 = l_new_0(v281, v282);
        v281 = vector(120, l_new_0 / 255 * 29);
        v282 = vector(l_menu_0.get("velocity_indicator_pos_x"), l_menu_0.get("velocity_indicator_pos_y"));
        local v283 = color(unpack({
            v14.rgb_health_based(v278)
        }));
        if l_new_0 > 1 then
            local v284 = v12.colored_text({
                [1] = "\240\159\144\162 Slowed by "
            }, {
                [1] = tostring(math.floor(v278 * 100) .. "%"), 
                [2] = v283
            });
            render.text(1, vector(v282.x + 20, v282.y + 5), v14.white:alpha_modulate(l_new_0), nil, v284);
            render.shadow(vector(v282.x + 4, v282.y + 19), vector(v282.x + 126, v282.y + 25), v283:alpha_modulate(l_new_0), 20, 0);
            render.rect(vector(v282.x + 4, v282.y + 19), vector(v282.x + 126, v282.y + 25), v14.black:alpha_modulate(l_new_0 / 2), 2);
            render.rect(vector(v282.x + 5, v282.y + 20), vector(v282.x + v278 * 120 + 5, v282.y + 24), v283:alpha_modulate(l_new_0), 2);
        end;
        if l_new_0 > 1 then
            v17.handle(v282.x, v282.y, v281.x + 10, v281.y + 10, "velocity_indicator", v279);
        end;
        return;
    end;
end;
v23.lag_comp_breaker_indicator_handler = function()
    -- upvalues: l_menu_0 (ref), v16 (ref), l_defensive_0 (ref), v12 (ref), v14 (ref), v17 (ref)
    local v285 = entity.get_local_player();
    if v285 == nil then
        return;
    else
        local v286 = l_menu_0.get("lag_comp_breaker_indicator");
        local v287 = v16.new("current_tickbase", ui.get_alpha() > 0 and 7 or v285:is_alive() and l_defensive_0(true) or 14);
        local v288 = v287 > 2 and v287 < 14;
        local v289 = v16.new("drag_anim", v286 and ui.get_alpha() > 0.5 and 255 or 0);
        local l_new_1 = v16.new;
        local v291 = "lagcomp_indicator";
        local v292;
        if v286 then
            v292 = ui.get_alpha() > 0.5 and 255 or v288 and 255 or 0;
        else
            v292 = 0;
        end;
        l_new_1 = l_new_1(v291, v292);
        v291 = vector(120, l_new_1 / 255 * 29);
        v292 = vector(l_menu_0.get("lagcomp_indicator_pos_x"), l_menu_0.get("lagcomp_indicator_pos_y"));
        local v293 = v288 and color(0, 255, 0, 255) or color(255, 0, 0, 255);
        if l_new_1 > 1 then
            local v294 = v12.colored_text({
                [1] = (v288 and "\240\159\159\162" or "\240\159\148\180") .. " Lag comp. "
            }, {
                [1] = v288 and "safety" or "unsafety", 
                [2] = v293
            });
            render.text(1, vector(v292.x + 9, v292.y + 5), v14.white:alpha_modulate(l_new_1), nil, v294);
            render.shadow(vector(v292.x + 4, v292.y + 19), vector(v292.x + 126, v292.y + 25), v293:alpha_modulate(l_new_1), 20, 0);
            render.rect(vector(v292.x + 4, v292.y + 19), vector(v292.x + 126, v292.y + 25), v14.black:alpha_modulate(l_new_1 / 2), 2);
            render.rect(vector(v292.x + 5, v292.y + 20), vector(v292.x + math.min(v287 * 8.5, 120) + 5, v292.y + 24), v293:alpha_modulate(l_new_1), 2);
        end;
        if l_new_1 > 1 then
            v17.handle(v292.x, v292.y, v291.x + 10, v291.y + 10, "lagcomp_indicator", v289);
        end;
        return;
    end;
end;
v18.calibrib_gsindicator = render.load_font("Calibri Bold", vector(24, 23.5, 1), "ad");
v23.feature_indicators = {};
v23.feature_indicators.bomb_info = {
    planting = false, 
    planting_site = "", 
    fill = 0, 
    on_plant_time = 0
};
v23.feature_indicators.bomb_icons = {
    [1] = render.load_image_from_file(files.bomb_image, vector(25, 25)), 
    [1.25] = render.load_image_from_file(files.bomb_image, vector(25, 25) * 1.25), 
    [1.5] = render.load_image_from_file(files.bomb_image, vector(25, 25) * 1.5), 
    [1.75] = render.load_image_from_file(files.bomb_image, vector(25, 25) * 1.75), 
    [2] = render.load_image_from_file(files.bomb_image, vector(25, 25) * 2)
};
v23.feature_indicators.bombplanted_icons = {
    [1] = render.load_image_from_file(files.bombplanted_image, vector(25, 25)), 
    [1.25] = render.load_image_from_file(files.bombplanted_image, vector(25, 25) * 1.25), 
    [1.5] = render.load_image_from_file(files.bombplanted_image, vector(25, 25) * 1.5), 
    [1.75] = render.load_image_from_file(files.bombplanted_image, vector(25, 25) * 1.75), 
    [2] = render.load_image_from_file(files.bombplanted_image, vector(25, 25) * 2)
};
v23.feature_indicators.handle = function()
    -- upvalues: v12 (ref), v18 (ref), l_menu_0 (ref), v11 (ref), v23 (ref)
    if not globals.is_in_game or not globals.is_connected then
        return;
    else
        local v295 = entity.get_local_player();
        if v295 == nil or v295:is_alive() == false then
            return;
        else
            local v296 = render.get_scale(2);
            local v297 = 0;
            local function v306(v298, v299, v300, v301)
                -- upvalues: v296 (ref), v12 (ref), v297 (ref), v18 (ref)
                if v300 == nil or v301 == nil then
                    v300 = false;
                end;
                local v302 = 35 * v296;
                local v303 = v12.screen_size.y / 1.475 / v296 + v297;
                local v304 = "sd";
                local v305 = render.measure_text(v18.calibrib_gsindicator, v304, v298);
                render.gradient(vector(v302 - 25 * v296, v303 - 0.8 * v296), vector(v302 + v305.x / 2, v303 + 31.8 * v296), color(0, 0), color(0, 45), color(0, 0), color(0, 45));
                render.gradient(vector(v302 + v305.x / 2, v303 - 0.8 * v296), vector(v302 + v305.x + 25 * v296, v303 + 31.8 * v296), color(0, 45), color(0, 0), color(0, 45), color(0, 0));
                render.text(v18.calibrib_gsindicator, vector(v302, v303 + 4 * v296), v299, v304, v298);
                if v300 then
                    render.circle_outline(vector(v302 + v305.x + 18 * v296, v303 + v305.y - 9 * v296), color(0, 0, 0, 200), 10 * v296, 0, 1, 5 * v296);
                    render.circle_outline(vector(v302 + v305.x + 18 * v296, v303 + v305.y - 9 * v296), color(255, 255, 255, 200), 9 * v296, 0, v301, 3 * v296);
                end;
                v297 = v297 - 42 * v296;
                return v302, v303;
            end;
            if l_menu_0.contains("feature_indicators", "Ping spike") and v11.ping_spike:get() > 0 then
                local v307 = v11.ping_spike:get();
                if v307 ~= 0 then
                    local v308 = utils.net_channel();
                    if v308 ~= nil then
                        local v309 = v307 / (v308.latency[0] * 1000);
                        if v309 > 1 then
                            v309 = 1 - v309 % 1;
                        end;
                        v306("PING", color(255, 255, 128, 200):lerp(color(175, 255, 75, 200), v309));
                    end;
                end;
            end;
            if l_menu_0.contains("feature_indicators", "On shot anti-aim") and v11.hide_shots.switch:get() and not v11.fakeduck:get() and not v11.doubletap.switch:get() then
                v306("OSAA", color(255, 255, 255, 200));
            end;
            if l_menu_0.contains("feature_indicators", "Double tap") and v11.doubletap.switch:get() and not v11.fakeduck:get() then
                v306("DT", rage.exploit:get() == 1 and color(255, 255, 255, 200) or color(255, 0, 50, 255));
            end;
            if l_menu_0.contains("feature_indicators", "Duck peek assist") and v11.fakeduck:get() then
                v306("DUCK", color(255, 255, 255, 200));
            end;
            if l_menu_0.contains("feature_indicators", "Force safe point") and v11.safe_point:get() == "Force" then
                v306("SAFE", color(255, 255, 255, 200));
            end;
            if l_menu_0.contains("feature_indicators", "Force body aim") and v11.body_aim.mode:get() == "Force" then
                v306("BODY", color(255, 255, 255, 200));
            end;
            if l_menu_0.contains("feature_indicators", "Minimum damage override") and v12.get_bind("Min. Damage")[1] then
                v306("MD", color(255, 255, 255, 200));
            end;
            if l_menu_0.contains("feature_indicators", "Freestanding") and l_menu_0.get("freestanding") then
                v306("FS", color(255, 255, 255, 200));
            end;
            if l_menu_0.get("force_ragebot_fire") and l_menu_0.get("force_ragebot_fire_indicator") then
                v306(("+/- INTERCEPTED SPREAD SEED FROM SERVER %d/256"):format(utils.random_int(1, 256)), color(255, 255, 255, 255));
            end;
            entity.get_entities("CPlantedC4", true, function(v310)
                -- upvalues: v12 (ref), v295 (ref), v306 (ref), v23 (ref), v296 (ref)
                if v310 ~= nil then
                    local v311 = (v310.m_flC4Blow - globals.curtime) * 10 / 10;
                    local v312 = string.format("%.1f", v311);
                    local l_m_bBombDefused_0 = v310.m_bBombDefused;
                    if math.floor(v311) > 0 and not l_m_bBombDefused_0 then
                        local v314 = v310.m_hBombDefuser ~= 4294967295;
                        local l_m_flDefuseLength_0 = v310.m_flDefuseLength;
                        local v316 = v314 and math.floor((v310.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1;
                        if v316 > 0 then
                            local v317 = v316 < math.floor(v311) and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                            local v318 = (v12.screen_size.y - 50) / l_m_flDefuseLength_0 * v316;
                            render.rect(vector(0, 0), vector(16, v12.screen_size.y), color(25, 25, 25, 160));
                            render.rect_outline(vector(0, 0), vector(16, v12.screen_size.y), color(25, 25, 25, 160));
                            render.rect(vector(0, v12.screen_size.y - v318), vector(16, v12.screen_size.y), v317);
                        end;
                        local v319 = v310.m_nBombSite == 0 and "A" or "B";
                        local l_m_iHealth_0 = v295.m_iHealth;
                        local l_m_ArmorValue_0 = v295.m_ArmorValue;
                        local v322 = false;
                        local v323 = v310.m_vecOrigin:dist(v295.m_vecOrigin);
                        local v324 = 450.7;
                        local v325 = (v323 - 75.68) / 789.2;
                        local v326 = v324 * math.exp(-v325 * v325);
                        if l_m_ArmorValue_0 > 0 then
                            local v327 = v326 * 0.5;
                            local v328 = (v326 - v327) * 0.5;
                            if l_m_ArmorValue_0 < v328 then
                                l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                                v327 = v326 - v328;
                            end;
                            v326 = v327;
                        end;
                        local v329 = math.ceil(v326);
                        v322 = l_m_iHealth_0 <= v329;
                        local v330, v331 = v306("     " .. v319 .. " - " .. string.format("%.1f", v312) .. "s", color(255, 255, 255, 200));
                        render.texture(v23.feature_indicators.bombplanted_icons[v296], vector(v330, v331 + 3 * v296), vector(25, 25) * v296, color(255, 255, 255, 200), "f");
                        if v295 then
                            if v322 == true then
                                v306("FATAL", color(255, 0, 50, 255));
                            elseif v326 > 0.5 then
                                v306("-" .. v329 .. " HP", color(210, 216, 112, 255));
                            end;
                        end;
                    end;
                end;
            end);
            if v23.feature_indicators.bomb_info.planting then
                local v332, v333 = v306("     " .. v23.feature_indicators.bomb_info.planting_site, color(252, 239, 125, 255), true, v23.feature_indicators.bomb_info.fill / 3.125);
                render.texture(v23.feature_indicators.bomb_icons[v296], vector(v332, v333 + 3 * v296), vector(25, 25) * v296, color(255, 255, 255, 200), "f");
                v23.feature_indicators.bomb_info.fill = 3.125 - (3.125 + v23.feature_indicators.bomb_info.on_plant_time - globals.curtime);
                if v23.feature_indicators.bomb_info.fill > 3.125 then
                    v23.feature_indicators.bomb_info.fill = 3.125;
                end;
            end;
            return;
        end;
    end;
end;
v23.feature_indicators.on_bomb_abortplant = function()
    -- upvalues: v23 (ref)
    v23.feature_indicators.bomb_info.planting = false;
    v23.feature_indicators.bomb_info.fill = 0;
    v23.feature_indicators.bomb_info.on_plant_time = 0;
    v23.feature_indicators.bomb_info.planting_site = "";
end;
v23.feature_indicators.on_bomb_defused = function()
    -- upvalues: v23 (ref)
    v23.feature_indicators.bomb_info.planting = false;
    v23.feature_indicators.bomb_info.fill = 0;
    v23.feature_indicators.bomb_info.on_plant_time = 0;
    v23.feature_indicators.bomb_info.planting_site = "";
end;
v23.feature_indicators.on_bomb_planted = function()
    -- upvalues: v23 (ref)
    v23.feature_indicators.bomb_info.planting = false;
    v23.feature_indicators.bomb_info.fill = 0;
    v23.feature_indicators.bomb_info.on_plant_time = 0;
    v23.feature_indicators.bomb_info.planting_site = "";
end;
v23.feature_indicators.on_round_prestart = function()
    -- upvalues: v23 (ref)
    v23.feature_indicators.bomb_info.planting = false;
    v23.feature_indicators.bomb_info.fill = 0;
    v23.feature_indicators.bomb_info.on_plant_time = 0;
    v23.feature_indicators.bomb_info.planting_site = "";
end;
v23.feature_indicators.on_round_start = function()
    -- upvalues: v23 (ref)
    v23.feature_indicators.bomb_info.planting = false;
    v23.feature_indicators.bomb_info.fill = 0;
    v23.feature_indicators.bomb_info.on_plant_time = 0;
    v23.feature_indicators.bomb_info.planting_site = "";
end;
v23.feature_indicators.on_bomb_beginplant = function(v334)
    -- upvalues: v23 (ref)
    local v335 = entity.get_player_resource();
    v23.feature_indicators.bomb_info.on_plant_time = globals.curtime;
    v23.feature_indicators.bomb_info.planting = true;
    local l_m_bombsiteCenterA_0 = v335.m_bombsiteCenterA;
    local l_m_bombsiteCenterB_0 = v335.m_bombsiteCenterB;
    local v338 = entity.get(v334.userid, true):get_origin();
    local v339 = v338:dist(l_m_bombsiteCenterA_0);
    local v340 = v338:dist(l_m_bombsiteCenterB_0);
    v23.feature_indicators.bomb_info.planting_site = v339 < v340 and "A" or "B";
end;
v18.gs_bold = render.load_font("Verdana Bold", 14, "abd");
v23.manual_yaw_base_arrows_handle = function()
    -- upvalues: l_menu_0 (ref), v12 (ref), v16 (ref), v18 (ref)
    local v341 = entity.get_local_player();
    if v341 == nil or not v341:is_alive() then
        return;
    else
        local v342 = l_menu_0.get("manual_yaw_base");
        local l_m_bIsScoped_1 = v341.m_bIsScoped;
        local v344 = l_menu_0.get("manual_yaw_base_arrows");
        local v345 = l_menu_0.get("manual_yaw_base_arrows_distance");
        local v346 = l_menu_0.get("manual_yaw_base_arrows_color");
        local v347 = l_menu_0.get("manual_yaw_base_arrows_moving_animation");
        local v348 = v12.screen_size / 2;
        local v349 = {
            left = v16.new("manual_indication_left", v344 and v342 == "Leftward" and 1 or 0), 
            right = v16.new("manual_indication_right", v344 and v342 == "Rightward" and 1 or 0)
        };
        if v349.left == 0 and v349.right == 0 then
            return;
        else
            render.text(v18.gs_bold, v348 - vector(v345 * (v347 and v349.left or 1), 1), v346:alpha_modulate(v349.left * (l_m_bIsScoped_1 and 80 or 255)), "c", "<");
            render.text(v18.gs_bold, v348 + vector(v345 * (v347 and v349.right or 1), -1), v346:alpha_modulate(v349.right * (l_m_bIsScoped_1 and 80 or 255)), "c", ">");
            return;
        end;
    end;
end;
v23.scope_overlay_handle = function()
    -- upvalues: l_menu_0 (ref), v11 (ref), v16 (ref), v12 (ref)
    local v350 = l_menu_0.get("scope_overlay");
    local v351 = l_menu_0.contains("scope_overlay_settings", "Spread dependency");
    local v352 = l_menu_0.contains("scope_overlay_settings", "Inverted");
    local v353 = l_menu_0.get("scope_overlay_size");
    local v354 = l_menu_0.get("scope_overlay_gap");
    local v355 = l_menu_0.get("scope_overlay_accent_color");
    v11.override_zoom.scope_overlay:override(nil);
    if v350 then
        v11.override_zoom.scope_overlay:override("Remove All");
    end;
    local v356 = entity.get_local_player();
    if v356 == nil then
        return;
    else
        local v357 = v356:get_player_weapon();
        if v357 == nil then
            return;
        else
            local l_m_bIsScoped_2 = v356.m_bIsScoped;
            local v359 = {
                main = v16.new("scope_overlay", v350 and l_m_bIsScoped_2 and 1 or 0)
            };
            if v359.main < 0.1 then
                return;
            else
                v359.default = v16.new("scope_overlay_default", (not (v350 and l_m_bIsScoped_2) or v352) and 0 or 255);
                v359.inverted = v16.new("scope_overlay_inverted", v350 and l_m_bIsScoped_2 and v352 and 255 or 0);
                v359.spread = v351 and v16.new("scope_overlay_spread_dependensy", v357:get_inaccuracy() * 75) + v354 or v354;
                local v360 = {
                    v355:alpha_modulate(v359.default), 
                    v355:alpha_modulate(v359.inverted)
                };
                v353 = v353 * v359.main;
                local v361 = v12.screen_size / 2;
                render.gradient(v361 - vector(-1, v353 + v359.spread), v361 - vector(0, v359.spread), v360[2], v360[2], v360[1], v360[1]);
                render.gradient(v361 + vector(1, v353 + v359.spread), v361 + vector(0, v359.spread), v360[2], v360[2], v360[1], v360[1]);
                render.gradient(v361 + vector(v353 + v359.spread, 1), v361 + vector(v359.spread, 0), v360[2], v360[1], v360[2], v360[1]);
                render.gradient(v361 - vector(v353 + v359.spread, -1), v361 - vector(v359.spread, 0), v360[2], v360[1], v360[2], v360[1]);
                return;
            end;
        end;
    end;
end;
v23.keep_scope_transparency_handle = function()
    -- upvalues: l_menu_0 (ref)
    if not l_menu_0.get("keep_scope_transparency") then
        return;
    else
        local v362 = entity.get_local_player();
        if not v362 or not v362:is_alive() then
            return;
        else
            local v363 = v362:get_player_weapon();
            if not v363 or not v363.m_zoomLevel then
                return;
            elseif v363.m_zoomLevel > 0 then
                return 59;
            else
                return;
            end;
        end;
    end;
end;
v23.notify.handle = function()
    -- upvalues: v12 (ref), v23 (ref), v14 (ref)
    local l_realtime_0 = globals.realtime;
    local v365 = globals.frametime * 2;
    local v366 = vector(v12.screen_size.x * 0.5 + 1, v12.screen_size.y * 0.8333);
    for v367 = #v23.notify._table, 1, -1 do
        local v368 = v23.notify._table[v367];
        local v369 = "[Paradise Yaw] " .. v368.text;
        local l_time_0 = v368.time;
        local l_alpha_0 = v368.alpha;
        local l_white_0 = v14.white;
        if l_time_0 < l_realtime_0 then
            v368.alpha = v368.alpha - v365;
            if v368.alpha < 0 then
                v368.alpha = 0;
            end;
            if l_alpha_0 == 0 then
                table.remove(v23.notify._table, v367);
                goto label1 --[[  false, false  ]];
            end;
        else
            v368.alpha = v368.alpha + v365;
            if v368.alpha > 1 then
                v368.alpha = 1;
            end;
        end;
        if v367 > 4 then
            table.remove(v23.notify._table, 1);
        end;
        local v373 = render.measure_text(1, "c", v369) + vector(30, 8);
        local v374 = v373 * 0.5;
        local v375 = 255 * l_alpha_0;
        l_white_0 = l_white_0:alpha_modulate(255 * l_alpha_0);
        local v376 = v374.y + 0.5;
        render.text(1, v366 - 1, color(255, 255, 255, v375), "c", v369);
        render.circle_outline(v366 - v374 + v376 - vector(0, 1), l_white_0, v376 + 2, 90, 0.5 * l_alpha_0, 2);
        render.circle_outline(v366 + v374 - v376, l_white_0, v376 + 2, 270, 0.5 * l_alpha_0, 2);
        local v377 = vector((v373.x - v376 * 2) * l_alpha_0, 2);
        local v378 = v366 - v374 + vector(v376, -2);
        local v379 = v378 + v377;
        render.rect(v378, v379, l_white_0, 0, true);
        v378 = v366 + v374 - vector(v376, -2);
        v379 = v378 - v377;
        render.rect(v378, v379, l_white_0, 0, true);
        v366.y = v366.y + math.floor((v373.y + 10) * l_alpha_0);
        ::label1::;
    end;
end;
v23.ambient_tools = {};
v23.ambient_tools.bloom_default = nil;
v23.ambient_tools.exposure_min_default = nil;
v23.ambient_tools.exposure_max_default = nil;
v23.ambient_tools.bloom_prev = nil;
v23.ambient_tools.exposure_prev = nil;
v23.ambient_tools.model_ambient_min_prev = nil;
v23.ambient_tools.wallcolor_prev = nil;
v23.ambient_tools.reset_bloom = function(v380)
    -- upvalues: v23 (ref)
    if v23.ambient_tools.bloom_default == -1 then
        v380.m_bUseCustomBloomScale = 0;
        v380.m_flCustomBloomScale = 0;
    else
        v380.m_bUseCustomBloomScale = 1;
        v380.m_flCustomBloomScale = v23.ambient_tools.bloom_default;
    end;
end;
v23.ambient_tools.reset_exposure = function(v381)
    -- upvalues: v23 (ref)
    if v23.ambient_tools.exposure_min_default == -1 then
        v381.m_bUseCustomAutoExposureMin = 0;
        v381.m_flCustomAutoExposureMin = 0;
    else
        v381.m_bUseCustomAutoExposureMin = 1;
        v381.m_flCustomAutoExposureMin = v23.ambient_tools.exposure_min_default;
    end;
    if v23.ambient_tools.exposure_max_default == -1 then
        v381.m_bUseCustomAutoExposureMax = 0;
        v381.m_flCustomAutoExposureMax = 0;
    else
        v381.m_bUseCustomAutoExposureMax = 1;
        v381.m_flCustomAutoExposureMax = v23.ambient_tools.exposure_max_default;
    end;
end;
v23.ambient_tools.on_render = function()
    -- upvalues: l_menu_0 (ref), v23 (ref), v12 (ref)
    local v382 = l_menu_0.get("wall_dyeing_switch");
    if v382 or v23.ambient_tools.wallcolor_prev then
        if v382 then
            local v383, v384, v385, v386 = l_menu_0.get("wall_dyeing_value"):unpack();
            local v387 = v383 / 255;
            local v388 = v384 / 255;
            v385 = v385 / 255;
            v384 = v388;
            v383 = v387;
            v387 = v386 / 128 - 1;
            v388 = nil;
            local v389 = nil;
            local v390 = nil;
            if v387 > 0 then
                v387 = v387 * (900 ^ v387 - 1);
                local v391 = v383 * v387;
                local v392 = v384 * v387;
                v390 = v385 * v387;
                v389 = v392;
                v388 = v391;
            else
                local v393 = (1 - v383) * v387;
                local v394 = (1 - v384) * v387;
                v390 = (1 - v385) * v387;
                v389 = v394;
                v388 = v393;
            end;
            if v12.cvars.mat_ambient_light_r:float() ~= v388 or v12.cvars.mat_ambient_light_g:float() ~= v389 or v12.cvars.mat_ambient_light_b:float() ~= v390 then
                v12.cvars.mat_ambient_light_r:float(v388, true);
                v12.cvars.mat_ambient_light_g:float(v389, true);
                v12.cvars.mat_ambient_light_b:float(v390, true);
            end;
        else
            v12.cvars.mat_ambient_light_r:float(0, true);
            v12.cvars.mat_ambient_light_g:float(0, true);
            v12.cvars.mat_ambient_light_b:float(0, true);
        end;
    end;
    v23.ambient_tools.wallcolor_prev = v382;
    local v395 = l_menu_0.get("model_brightness_value");
    if (v395 > 0 or v23.ambient_tools.model_ambient_min_prev ~= nil and v23.ambient_tools.model_ambient_min_prev > 0) and v12.cvars.r_modelAmbientMin:float() ~= v395 * 0.05 then
        v12.cvars.r_modelAmbientMin:float(v395 * 0.05, true);
    end;
    v23.ambient_tools.model_ambient_min_prev = v395;
    local v396 = l_menu_0.get("bloom_value");
    local v397 = l_menu_0.get("exposure_value");
    if v396 ~= 0 or v397 ~= 0 or v23.ambient_tools.bloom_prev ~= -1 or v23.ambient_tools.exposure_prev ~= -1 then
        local v398 = entity.get_entities("CEnvTonemapController");
        for v399 = 1, #v398 do
            local v400 = v398[v399];
            if v396 ~= 0 then
                if v23.ambient_tools.bloom_default == nil then
                    if v400.m_bUseCustomBloomScale == 1 then
                        v23.ambient_tools.bloom_default = v400.m_flCustomBloomScale;
                    else
                        v23.ambient_tools.bloom_default = -1;
                    end;
                end;
                v400.m_bUseCustomBloomScale = 1;
                v400.m_flCustomBloomScale = v396 * 0.01;
            elseif v23.ambient_tools.bloom_prev ~= nil and v23.ambient_tools.bloom_prev ~= -1 and v23.ambient_tools.bloom_default ~= nil then
                v23.ambient_tools.reset_bloom(v400);
            end;
            if v397 ~= 0 then
                if v23.ambient_tools.exposure_min_default == nil then
                    if v400.m_bUseCustomAutoExposureMin == 1 then
                        v23.ambient_tools.exposure_min_default = v400.m_flCustomAutoExposureMin;
                    else
                        v23.ambient_tools.exposure_min_default = -1;
                    end;
                    if v400.m_bUseCustomAutoExposureMax == 1 then
                        v23.ambient_tools.exposure_max_default = v400.m_flCustomAutoExposureMax;
                    else
                        v23.ambient_tools.exposure_max_default = -1;
                    end;
                end;
                v400.m_bUseCustomAutoExposureMin = 1;
                v400.m_bUseCustomAutoExposureMax = 1;
                v400.m_flCustomAutoExposureMin = math.max(0, v397 * 0.01);
                v400.m_flCustomAutoExposureMax = math.max(0, v397 * 0.01);
            elseif v23.ambient_tools.exposure_prev ~= nil and v23.ambient_tools.exposure_prev ~= -1 and v23.ambient_tools.exposure_min_default ~= nil then
                v23.ambient_tools.reset_exposure(v400);
            end;
        end;
    end;
    v23.ambient_tools.bloom_prev = v396;
    v23.ambient_tools.exposure_prev = v397;
end;
v23.ambient_tools.task = function()
    -- upvalues: v23 (ref)
    if common.get_map_data() == nil then
        local l_ambient_tools_0 = v23.ambient_tools;
        local l_ambient_tools_1 = v23.ambient_tools;
        local l_ambient_tools_2 = v23.ambient_tools;
        local v404 = nil;
        local v405 = nil;
        l_ambient_tools_2.exposure_max_default = nil;
        l_ambient_tools_1.exposure_min_default = v405;
        l_ambient_tools_0.bloom_default = v404;
    end;
    utils.execute_after(0.5, v23.ambient_tools.task);
end;
v23.ambient_tools.task();
v23.ambient_tools.on_shutdown = function()
    -- upvalues: v23 (ref), v12 (ref)
    local v406 = entity.get_entities("CEnvTonemapController");
    for v407 = 1, #v406 do
        local v408 = v406[v407];
        if v23.ambient_tools.bloom_prev ~= -1 and v23.ambient_tools.bloom_default ~= nil then
            v23.ambient_tools.reset_bloom(v408);
        end;
        if v23.ambient_tools.exposure_prev ~= -1 and v23.ambient_tools.exposure_min_default ~= nil then
            v23.ambient_tools.reset_exposure(v408);
        end;
    end;
    v12.cvars.mat_ambient_light_r:float(0, true);
    v12.cvars.mat_ambient_light_g:float(0, true);
    v12.cvars.mat_ambient_light_b:float(0, true);
    v12.cvars.r_modelAmbientMin:float(0, true);
end;
v23.aspect_ratio = {};
v23.aspect_ratio.handle = function()
    -- upvalues: l_menu_0 (ref), v12 (ref)
    if l_menu_0.get("aspect_ratio") then
        v12.cvars.aspect_ratio:float(l_menu_0.get("aspect_ratio_value") / 100);
    else
        v12.cvars.aspect_ratio:float(0);
    end;
end;
l_menu_0.get_element("aspect_ratio"):set_callback(v23.aspect_ratio.handle, true);
l_menu_0.get_element("aspect_ratio_value"):set_callback(v23.aspect_ratio.handle, true);
v23.aspect_ratio.destroy = function()
    -- upvalues: v12 (ref)
    v12.cvars.aspect_ratio:float(0);
end;
v23.override_viewmodel = {};
v23.override_viewmodel.vec = vector(0, 0, 0);
v23.override_viewmodel.shot = {
    pitch = 0, 
    yaw = 0, 
    time = 0
};
v23.override_viewmodel.update = function()
    -- upvalues: l_menu_0 (ref), v12 (ref)
    if l_menu_0.get("override_viewmodel") then
        v12.cvars.viewmodel_fov:float(l_menu_0.get("override_viewmodel_fov") / 10, true);
        v12.cvars.viewmodel_offset_x:float(l_menu_0.get("override_viewmodel_x") / 10, true);
        v12.cvars.viewmodel_offset_y:float(l_menu_0.get("override_viewmodel_y") / 10, true);
        v12.cvars.viewmodel_offset_z:float(l_menu_0.get("override_viewmodel_z") / 10, true);
    else
        v12.cvars.viewmodel_fov:float(60);
        v12.cvars.viewmodel_offset_x:float(1);
        v12.cvars.viewmodel_offset_y:float(1);
        v12.cvars.viewmodel_offset_z:float(-1.5);
    end;
end;
v23.override_viewmodel.on_aim_fire = function(v409)
    -- upvalues: l_menu_0 (ref), v23 (ref)
    if not l_menu_0.get("override_viewmodel") or not l_menu_0.contains("override_viewmodel_options", "Follow aimbot") then
        return;
    else
        local v410 = entity.get_local_player();
        if not v410 or not v410:is_alive() then
            return;
        else
            local v411 = v410:get_eye_position():to(v409.aim):angles();
            v23.override_viewmodel.shot.time = globals.curtime;
            v23.override_viewmodel.shot.pitch = v411.x;
            v23.override_viewmodel.shot.yaw = -v411.y;
            return;
        end;
    end;
end;
v23.override_viewmodel.on_override_view = function()
    -- upvalues: l_menu_0 (ref), l_ffi_0 (ref), v23 (ref), v10 (ref)
    if not l_menu_0.get("override_viewmodel") then
        return;
    else
        local v412 = entity.get_local_player();
        if not v412 or not v412:is_alive() then
            return;
        else
            local v413 = v412["m_hViewModel[0]"];
            if v413 == nil then
                return;
            else
                local v414 = l_ffi_0.cast("void*", v413[0]);
                if not v414 or v414 == l_ffi_0.NULL then
                    return;
                else
                    local v415 = render.camera_angles();
                    if v23.override_viewmodel.shot.time ~= 0 and math.abs(globals.curtime - v23.override_viewmodel.shot.time) > 0.5 then
                        v23.override_viewmodel.shot.time = 0;
                    end;
                    local v416 = l_ffi_0.cast("vmodel_vec3_t*", l_ffi_0.new("char[?]", l_ffi_0.sizeof("vmodel_vec3_t")));
                    v23.override_viewmodel.vec.x = v23.override_viewmodel.shot.time ~= 0 and v23.override_viewmodel.shot.pitch or v415.x - l_menu_0.get("override_viewmodel_pitch");
                    v23.override_viewmodel.vec.y = v23.override_viewmodel.shot.time ~= 0 and v23.override_viewmodel.shot.yaw or v415.y - l_menu_0.get("override_viewmodel_yaw");
                    local l_x_0 = v23.override_viewmodel.vec.x;
                    local l_y_0 = v23.override_viewmodel.vec.y;
                    v416.z = -l_menu_0.get("override_viewmodel_roll");
                    v416.y = l_y_0;
                    v416.x = l_x_0;
                    v10.SetAbsAngles_fn(v414, v416);
                    return;
                end;
            end;
        end;
    end;
end;
v23.override_viewmodel.on_render = function()
    -- upvalues: l_menu_0 (ref), v12 (ref), v11 (ref)
    if not l_menu_0.get("override_viewmodel") or not l_menu_0.contains("override_viewmodel_options", "Fakeduck animation") then
        return;
    else
        local v419 = entity.get_local_player();
        if not v419 or not v419:is_alive() then
            return;
        else
            v12.cvars.viewmodel_offset_z:float(l_menu_0.get("override_viewmodel_z") / 10 - (v11.fakeduck:get() and (v419["m_vecViewOffset[2]"] - 48) * 0.5 or 0), true);
            return;
        end;
    end;
end;
l_menu_0.get_element("override_viewmodel"):set_callback(v23.override_viewmodel.update, true);
l_menu_0.get_element("override_viewmodel_fov"):set_callback(v23.override_viewmodel.update, true);
l_menu_0.get_element("override_viewmodel_x"):set_callback(v23.override_viewmodel.update, true);
l_menu_0.get_element("override_viewmodel_y"):set_callback(v23.override_viewmodel.update, true);
l_menu_0.get_element("override_viewmodel_z"):set_callback(v23.override_viewmodel.update, true);
v23.override_viewmodel.destroy = function()
    -- upvalues: v12 (ref)
    v12.cvars.viewmodel_fov:float(60);
    v12.cvars.viewmodel_offset_x:float(1);
    v12.cvars.viewmodel_offset_y:float(1);
    v12.cvars.viewmodel_offset_z:float(-1.5);
end;
v24.fast_ladder_handle = function(v420)
    -- upvalues: l_menu_0 (ref)
    if not l_menu_0.get("fast_ladder") then
        return;
    else
        local v421 = entity.get_local_player();
        if not v421 then
            return;
        elseif v421.m_MoveType ~= 9 then
            return;
        elseif v421:get_player_weapon() == nil then
            return;
        else
            local l_x_1 = render.camera_angles().x;
            local _ = render.camera_angles().y;
            v420.view_angles.y = math.floor(v420.view_angles.y + 0.5);
            v420.roll = 0;
            if v420.forwardmove > 0 and l_x_1 < 45 then
                v420.view_angles.x = 89;
                v420.in_moveright = 1;
                v420.in_moveleft = 0;
                v420.in_forward = 0;
                v420.in_back = 1;
                if v420.sidemove == 0 then
                    v420.view_angles.y = v420.view_angles.y + 90;
                end;
                if v420.sidemove < 0 then
                    v420.view_angles.y = v420.view_angles.y + 150;
                end;
                if v420.sidemove > 0 then
                    v420.view_angles.y = v420.view_angles.y + 30;
                end;
            end;
            if v420.forwardmove < 0 then
                v420.view_angles.x = 89;
                v420.in_moveleft = 1;
                v420.in_moveright = 0;
                v420.in_forward = 1;
                v420.in_back = 0;
                if v420.sidemove == 0 then
                    v420.view_angles.y = v420.view_angles.y + 90;
                end;
                if v420.sidemove > 0 then
                    v420.view_angles.y = v420.view_angles.y + 150;
                end;
                if v420.sidemove < 0 then
                    v420.view_angles.y = v420.view_angles.y + 30;
                end;
            end;
            return;
        end;
    end;
end;
v24.no_fall_damage_handle = function(v424)
    -- upvalues: l_menu_0 (ref), l_bit_0 (ref)
    if not l_menu_0.get("fast_ladder") then
        return;
    else
        local v425 = entity.get_local_player();
        if not v425 then
            return;
        else
            local l_m_vecVelocity_0 = v425.m_vecVelocity;
            local l_m_vecOrigin_1 = v425.m_vecOrigin;
            local v428 = l_bit_0.band(v425.m_fFlags, l_bit_0.lshift(1, 0)) == 0;
            local v429 = utils.trace_line(l_m_vecOrigin_1, vector(l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z - 500), nil, nil, 1);
            if l_m_vecOrigin_1.z - v429.end_pos.z <= 70 and l_m_vecOrigin_1.z - v429.end_pos.z >= 12 and v428 and l_m_vecVelocity_0.z < -450 then
                v424.in_duck = true;
            end;
            return;
        end;
    end;
end;
v24.quick_fall_handle = function(v430)
    -- upvalues: l_menu_0 (ref), l_bit_0 (ref)
    if not l_menu_0.get("quick_fall") then
        return;
    else
        local v431 = entity.get_local_player();
        if not v431 then
            return;
        else
            local l_m_vecVelocity_1 = v431.m_vecVelocity;
            local l_m_vecOrigin_2 = v431.m_vecOrigin;
            local v434 = utils.trace_line(l_m_vecOrigin_2, vector(l_m_vecOrigin_2.x, l_m_vecOrigin_2.y, l_m_vecOrigin_2.z - 75), nil, nil, 1);
            if l_bit_0.band(v430.buttons, l_bit_0.lshift(1, 1)) == 0 and l_m_vecVelocity_1.z < -100 and l_m_vecOrigin_2.z - v434.end_pos.z <= 55 then
                rage.exploit:force_teleport();
            end;
            return;
        end;
    end;
end;
v24.super_toss = {};
v24.super_toss.velocity = vector();
v24.super_toss.angles = vector();
v24.super_toss.view_offset = vector();
v24.super_toss.on_createmove = function(v435)
    -- upvalues: l_menu_0 (ref), v13 (ref), v24 (ref)
    if not l_menu_0.get("super_toss") then
        return;
    else
        local v436 = entity.get_local_player();
        if not v436 then
            return;
        elseif v436.m_MoveType == 9 then
            return;
        else
            local l_m_vecVelocity_2 = v436.m_vecVelocity;
            local v438 = v436:get_player_weapon();
            if not v438 or v438.m_bPinPulled == nil then
                return;
            else
                local l_m_fThrowTime_0 = v438.m_fThrowTime;
                if l_m_fThrowTime_0 > 0 and l_m_fThrowTime_0 < globals.curtime then
                    return;
                else
                    local v440 = v435.view_angles + v13.as_angle(v436.m_aimPunchAngle);
                    v440.x = v440.x - 10 * (90 - math.abs(v440.x)) / 90;
                    local l_throw_velocity_0 = v438:get_weapon_info().throw_velocity;
                    local v442 = math.clamp(l_throw_velocity_0 * 0.9, 15, 750);
                    local v443 = math.clamp(v438.m_flThrowStrength, 0, 1);
                    v442 = v442 * math.lerp(v443, 0.3, 1);
                    local v444 = v13.angle_to_vector(v440);
                    local v445 = (vector(v444.x * v442, v444.y * v442, v444.z * v442) + vector(l_m_vecVelocity_2.x * 1.25, l_m_vecVelocity_2.y * 1.25, l_m_vecVelocity_2.z * 1.25)):angles();
                    v24.super_toss.angles = vector(v435.view_angles.x - (v445.x - v440.x), v435.view_angles.y - (v445.y - v440.y), v435.view_angles.z);
                    v435.view_angles = v24.super_toss.angles;
                    return;
                end;
            end;
        end;
    end;
end;
v24.super_toss.on_grenade_override_view = function(v446)
    -- upvalues: l_menu_0 (ref), v24 (ref)
    if not l_menu_0.get("super_toss") then
        return;
    else
        v446.angles = v24.super_toss.angles;
        return;
    end;
end;
v24.nospread = {};
v24.nospread.was_on_ground = false;
v24.nospread.is_on_ground = function()
    -- upvalues: l_bit_0 (ref)
    return l_bit_0.band(entity.get_local_player().m_fFlags, 1) ~= 0;
end;
v24.nospread.createmove = function()
    -- upvalues: l_menu_0 (ref), v24 (ref)
    if not l_menu_0.get("force_ragebot_fire") then
        return;
    else
        v24.nospread.was_on_ground = v24.nospread.is_on_ground();
        return;
    end;
end;
v24.nospread.createmove_run = function()
    -- upvalues: l_menu_0 (ref), v11 (ref), v24 (ref)
    if not l_menu_0.get("force_ragebot_fire") then
        v11.hitchance.value:override(nil);
        v11.hitchance.doubletap:override(nil);
        v11.safe_point:override(nil);
        v11.minimum_damage.delay_show:override(nil);
        v11.hitbox_safety:override(nil);
        v11.hitbox.def:override(nil);
        v11.hitbox.multi:override(nil);
        v11.multipoint.head:override(nil);
        v11.multipoint.body:override(nil);
        v11.minimum_damage.value:override(nil);
        return;
    else
        if v24.nospread.was_on_ground == false and v24.nospread.is_on_ground() then
            v11.hitchance.value:override(1);
            v11.hitchance.doubletap:override(0);
            v11.safe_point:override("Default");
            v11.minimum_damage.delay_show:override(false);
            v11.hitbox_safety:override("");
            v11.hitbox.def:override("Head", "Chest", "Stomach", "Arms", "Legs", "Feet");
            v11.hitbox.multi:override("Head", "Chest", "Stomach", "Arms", "Legs", "Feet");
            v11.multipoint.head:override(100);
            v11.multipoint.body:override(100);
            v11.minimum_damage.value:override(0);
        end;
        return;
    end;
end;
v24.animfix = {};
v24.animfix.ground_ticks = 1;
v24.animfix.end_time = 0;
v24.animfix.pre_render = function(v447)
    -- upvalues: l_menu_0 (ref), l_ffi_0 (ref), l_bit_0 (ref), v24 (ref)
    if not l_menu_0.get("animfix") then
        return;
    elseif v447 ~= entity.get_local_player() then
        return;
    elseif not v447:is_alive() then
        return;
    else
        local v448 = l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v447[0]) + 10640)[0];
        if not v448 then
            return;
        else
            if l_menu_0.contains("animfix_elements", "Slide slow-walking") then
                if l_menu_0.contains("animfix_slide", "While walking") then
                    v447.m_flPoseParameter[9] = 0;
                end;
                if l_menu_0.contains("animfix_slide", "While running") then
                    v447.m_flPoseParameter[10] = 0;
                end;
                if l_menu_0.contains("animfix_slide", "While crouching") then
                    v447.m_flPoseParameter[8] = 0;
                end;
            end;
            if l_menu_0.contains("animfix_elements", "Break legs while in air") then
                local v449 = v448[6];
                if not v449 then
                    return;
                else
                    local v450 = l_bit_0.band(v447.m_fFlags, 1);
                    if l_menu_0.get("animfix_air_moonwalk") and v450 == 0 then
                        v449.m_flWeight = l_menu_0.get("animfix_air") / 10;
                    else
                        v447.m_flPoseParameter[6] = l_menu_0.get("animfix_air") / 10;
                    end;
                end;
            end;
            if l_menu_0.contains("animfix_elements", "Break legs while landing") then
                if l_menu_0.get("animfix_land_moonwalk") then
                    v447.m_flPoseParameter[7] = l_menu_0.get("animfix_land") / 1000;
                else
                    v447.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and l_menu_0.get("animfix_land") / 1000 or 1;
                end;
            end;
            if l_menu_0.contains("animfix_elements", "Adjust body lean") then
                local v451 = v448[12];
                if not v451 then
                    return;
                else
                    local v452 = v447["m_vecVelocity[0]"];
                    if math.abs(v452) >= 3 then
                        v451.m_flWeight = l_menu_0.get("animfix_bodylean") / 100;
                    end;
                end;
            end;
            if l_menu_0.contains("animfix_elements", "Reset pitch on land") then
                if l_bit_0.band(v447.m_fFlags, 1) == 1 then
                    v24.animfix.ground_ticks = v24.animfix.ground_ticks + 1;
                else
                    v24.animfix.ground_ticks = 0;
                    v24.animfix.end_time = globals.curtime + 1;
                end;
                if v24.animfix.ground_ticks < globals.choked_commands + 1 or v24.animfix.end_time < globals.curtime then
                    return;
                else
                    v447.m_flPoseParameter[12] = 0.5;
                end;
            end;
            return;
        end;
    end;
end;
v24.logger = {};
v24.logger.hitgroup_str = {
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
v24.logger.on_player_hurt = function(v453)
    -- upvalues: l_menu_0 (ref), v24 (ref), v23 (ref)
    if not l_menu_0.get("loggger") then
        return;
    else
        local v454 = entity.get_local_player();
        local v455 = entity.get(v453.attacker, true);
        local v456 = entity.get(v453.userid, true);
        local v457 = v24.logger.hitgroup_str[v453.hitgroup];
        local l_weapon_0 = v453.weapon;
        local v459 = l_menu_0.get_element("logger_events");
        local v460 = l_menu_0.get_element("logger_output");
        if v459:get(2) then
            local v461 = nil;
            if l_weapon_0 == "hegrenade" then
                v461 = "Naded";
            end;
            if l_weapon_0 == "inferno" then
                v461 = "Burned";
            end;
            if l_weapon_0 == "knife" then
                v461 = "Knifed";
            end;
            if v454 == v455 and v461 ~= nil then
                if v460:get(1) then
                    print_raw("paradise ~ \a00FF00FF" .. v461 .. "\aFFFFFFFF " .. v456:get_name() .. " for \a00FF00FF" .. v453.dmg_health .. "\aFFFFFFFF");
                    print_dev("paradise ~ \a00FF00FF" .. v461 .. "\aFFFFFFFF " .. v456:get_name() .. " for \a00FF00FF" .. v453.dmg_health .. "\aFFFFFFFF");
                end;
                if v460:get(2) then
                    table.insert(v23.notify._table, {
                        alpha = 0, 
                        text = v461 .. " " .. v456:get_name() .. " for " .. v453.dmg_health, 
                        time = globals.realtime + 3.8
                    });
                end;
            end;
        end;
        if v459:get(3) and v454 == v456 then
            if v460:get(1) then
                print_raw("paradise ~ \aFFFF00FFHarmed by\aFFFFFFFF " .. v455:get_name() .. " in \aFFFF00FF" .. v457 .. "\aFFFFFFFF for \aFFFF00FF" .. v453.dmg_health .. "\aFFFFFFFF");
                print_dev("paradise ~ \aFFFF00FFHarmed by\aFFFFFFFF " .. v455:get_name() .. " in \aFFFF00FF" .. v457 .. "\aFFFFFFFF for \aFFFF00FF" .. v453.dmg_health .. "\aFFFFFFFF");
            end;
            if v460:get(2) then
                table.insert(v23.notify._table, {
                    alpha = 0, 
                    text = "Harmed by " .. v455:get_name() .. " in " .. v457 .. " for " .. v453.dmg_health, 
                    time = globals.realtime + 3.8
                });
            end;
        end;
        return;
    end;
end;
v24.logger.on_aim_ack = function(v462)
    -- upvalues: l_menu_0 (ref), v24 (ref), v23 (ref)
    if not l_menu_0.get("loggger") then
        return;
    elseif not l_menu_0.get_element("logger_events"):get(1) then
        return;
    else
        local v463 = v462.target:get_name();
        local l_state_0 = v462.state;
        local l_damage_0 = v462.damage;
        local v466 = v462.target.m_iHealth < 1 and "Killed" or "Hit";
        local v467 = l_menu_0.get_element("logger_output");
        if l_state_0 == nil then
            local v468 = v24.logger.hitgroup_str[v462.hitgroup];
            if v467:get(1) then
                print_raw("paradise ~ \a00FF00FF" .. v466 .. "\aFFFFFFFF " .. v463 .. " in \a00FF00FF" .. v468 .. "\aFFFFFFFF for \a00FF00FF" .. l_damage_0 .. "\aFFFFFFFF (hc:" .. v462.hitchance .. "| bt:" .. v462.backtrack .. ")");
                print_dev("paradise ~ \a00FF00FF" .. v466 .. "\aFFFFFFFF " .. v463 .. " in \a00FF00FF" .. v468 .. "\aFFFFFFFF for \a00FF00FF" .. l_damage_0 .. "\aFFFFFFFF (hc:" .. v462.hitchance .. "| bt:" .. v462.backtrack .. ")");
            end;
            if v467:get(2) then
                table.insert(v23.notify._table, {
                    alpha = 0, 
                    text = v466 .. " " .. v463 .. " in " .. v468 .. " for " .. l_damage_0, 
                    time = globals.realtime + 3.8
                });
            end;
        else
            local v469 = v24.logger.hitgroup_str[v462.wanted_hitgroup];
            if v467:get(1) then
                print_raw("paradise ~ \aFF0000FFMissed\aFFFFFFFF " .. v463 .. "'s \aFF0000FF" .. v469 .. "\aFFFFFFFF due to \aFF0000FF" .. l_state_0 .. "\aFFFFFFFF (hc:" .. v462.hitchance .. "| bt:" .. v462.backtrack .. ")");
                print_dev("paradise ~ \aFF0000FFMissed\aFFFFFFFF " .. v463 .. "'s \aFF0000FF" .. v469 .. "\aFFFFFFFF due to \aFF0000FF" .. l_state_0 .. "\aFFFFFFFF (hc:" .. v462.hitchance .. "| bt:" .. v462.backtrack .. ")");
            end;
            if v467:get(2) then
                table.insert(v23.notify._table, {
                    alpha = 0, 
                    text = "Missed " .. v463 .. "'s " .. v469 .. " due to " .. l_state_0, 
                    time = globals.realtime + 3.8
                });
            end;
        end;
        return;
    end;
end;
v24.clantag = {};
v24.clantag.last = nil;
v24.clantag.set = function(v470)
    -- upvalues: v24 (ref)
    if v470 == v24.clantag.last then
        return;
    else
        common.set_clan_tag(v470);
        v24.clantag.last = v470;
        return;
    end;
end;
v24.clantag.build = function(v471)
    local v472 = {};
    for v473 = 1, #v471 do
        table.insert(v472, v471:sub(1, v473));
    end;
    for _ = 1, 4 do
        table.insert(v472, v471);
    end;
    for v475 = 1, #v471 do
        table.insert(v472, v471:sub(v475, #v471));
    end;
    table.insert(v472, "");
    return v472;
end;
v24.clantag.tag = v24.clantag.build("paradise recode");
v24.clantag.handle = function()
    -- upvalues: l_menu_0 (ref), v24 (ref)
    if not l_menu_0.get("clantag") then
        return;
    elseif not globals.is_in_game or not globals.is_connected then
        return;
    else
        local v476 = utils.net_channel();
        if not v476 then
            return;
        else
            local v477 = v476.latency[0] / globals.tickinterval;
            local v478 = globals.tickcount + v477;
            local v479 = math.floor(math.fmod(v478 / 13, #v24.clantag.tag)) + 1;
            v24.clantag.set(v24.clantag.tag[v479]);
            return;
        end;
    end;
end;
v24.clantag.destroy = function()
    -- upvalues: v24 (ref)
    v24.clantag.set("");
end;
l_menu_0.get_element("clantag"):set_callback(v24.clantag.destroy);
v24.trashtalk = {};
v24.trashtalk.preset = {
    [1] = "$$$ 1 TAP UFF YA $$$ (\226\151\149\226\128\191\226\151\149)", 
    [2] = "buy paradise adaptive", 
    [3] = "\228\184\173\229\155\189HvH\230\156\128\229\165\189\231\154\132\229\143\141\231\158\132\229\135\134 -> Paradise", 
    [4] = "\231\136\184\231\136\184\231\154\132\230\156\128\228\189\179\230\176\184\228\184\141\229\164\177\232\180\165\229\143\141\231\158\132\229\135\134\230\138\128\230\156\175 $ neverlose.cc/market/item?id=PqjKus", 
    [5] = "THIS IS PARADDDDISEEE (\226\151\163_\226\151\162)", 
    [6] = "\231\136\184\231\136\184\231\154\132\230\156\128\228\189\179\230\184\184\230\136\143\230\132\159\229\186\148\229\143\141\231\158\132\229\135\134\230\138\128\230\156\175 $ discord.gg/rapidfire", 
    [7] = "baited nn", 
    [8] = "PARADISE RECODE FOR NEVERLOSE", 
    [9] = "\229\164\169\229\160\130.lua PARADISE LUA \229\143\175\228\187\165\229\144\131\231\154\132\229\144\151\239\188\159\239\188\159\239\188\159GAME HACK NEVERLOSE \229\165\189\231\148\168\231\154\132\229\144\151\239\188\159\239\188\159100% HACK \229\164\169\229\160\130.lua PARADISE", 
    [10] = "0 iq", 
    [11] = "Which one of your 2 dads taught you how to play HVH?", 
    [12] = "Paradise no need update! (\226\151\163_\226\151\162)", 
    [13] = "( \205\161\194\176 \205\156\202\150 \205\161\194\176)", 
    [14] = "\228\184\173\229\155\189HvH\230\156\128\229\165\189\231\154\132\229\143\141\231\158\132\229\135\134 -> Paradise", 
    [15] = "PARADISE TECH\227\128\130 \230\138\128\230\156\175\229\164\154\229\138\159\232\131\189LUA\232\132\154\230\156\172", 
    [16] = "(\227\129\163\226\151\148\226\151\161\226\151\148)\227\129\163 \226\153\165 i just had `paradise recode` thats why you lost. :hearts:", 
    [17] = "-\240\157\154\155\240\157\154\142\240\157\154\153 0 \240\157\154\146\240\157\154\154", 
    [18] = "\229\144\174\229\144\184\231\136\184\231\136\184\231\154\132\228\184\138\229\184\157\229\164\169\229\160\130\239\188\140\230\178\161\230\175\141\228\186\178\231\154\132\229\173\169\229\173\144", 
    [19] = "\230\156\128\229\165\189\231\154\132 Paradise.LUA\239\188\129\230\131\179\229\135\187\232\180\165\228\184\150\231\149\140\228\184\138\230\156\128\229\165\189\231\154\132\229\144\151\239\188\159\228\189\191\231\148\168 Paradise\239\188\140\230\130\168\229\176\134\230\176\184\232\191\156\233\162\134\229\133\136\229\175\185\230\137\139\228\184\128\230\173\165", 
    [20] = "Go sleep (\226\140\163\204\128_\226\140\163\204\129)", 
    [21] = "nn kid go learn hvh: youtube.com/@CycleHvH", 
    [22] = "Tired of pasted luas? Check out Paradise: discord.gg/rapidfire", 
    [23] = "Paradise for neverlose & gamesense: discord.gg/rapidfire"
};
v24.trashtalk.handle = function(v480)
    -- upvalues: l_menu_0 (ref), v24 (ref)
    if not l_menu_0.get("trash_talk_on_kill") then
        return;
    else
        if entity.get(v480.attacker, true) == entity.get_local_player() then
            local l_preset_0 = v24.trashtalk.preset;
            do
                local l_l_preset_0_0 = l_preset_0;
                utils.execute_after(1.8, function()
                    -- upvalues: l_menu_0 (ref), l_l_preset_0_0 (ref)
                    if l_menu_0.get("trash_talk_on_kill_mode") == "Preset" then
                        utils.console_exec("say " .. l_l_preset_0_0[utils.random_int(1, #l_l_preset_0_0)]);
                    elseif l_menu_0.get("trash_talk_on_kill_mode") == "Trash" then
                        utils.console_exec("say " .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword() .. utils.random_chineseword());
                    end;
                end);
            end;
        end;
        return;
    end;
end;
v25.restore_all_og_menu = function()
    -- upvalues: v22 (ref), v11 (ref)
    v22.unoverride_og_menu();
    v11.override_zoom.scope_overlay:override(nil);
end;
v25.subscribe("render", "g_menu.run_sidebar", v19.run_sidebar);
v25.subscribe("bullet_impact", "g_antiaim.defensive_anti_bruteforce.handle", v22.defensive_anti_bruteforce.handle);
v25.subscribe("createmove", "g_antiaim.handler", v22.handler);
v25.subscribe("render", "g_visual.onscript_load", v23.onscript_load);
v25.subscribe("render", "g_visual.new_center_indicator_handle", v23.new_center_indicator_handle);
v25.subscribe("render", "g_visual.old_center_indicator_handle", v23.old_center_indicator_handle);
v25.subscribe("render", "g_visual.slow_down_indicator_handler", v23.slow_down_indicator_handler);
v25.subscribe("render", "g_visual.lag_comp_breaker_indicator_handler", v23.lag_comp_breaker_indicator_handler);
v25.subscribe("render", "g_visual.feature_indicators.handle", v23.feature_indicators.handle);
v25.subscribe("bomb_abortplant", "g_visual.feature_indicators.on_bomb_abortplant", v23.feature_indicators.on_bomb_abortplant);
v25.subscribe("bomb_beginplant", "g_visual.feature_indicators.on_bomb_beginplant", v23.feature_indicators.on_bomb_beginplant);
v25.subscribe("bomb_defused", "g_visual.feature_indicators.on_bomb_defused", v23.feature_indicators.on_bomb_defused);
v25.subscribe("bomb_planted", "g_visual.feature_indicators.on_bomb_planted", v23.feature_indicators.on_bomb_planted);
v25.subscribe("round_prestart", "g_visual.feature_indicators.on_round_prestart", v23.feature_indicators.on_round_prestart);
v25.subscribe("round_start", "g_visual.feature_indicators.on_round_start", v23.feature_indicators.on_round_start);
v25.subscribe("render", "g_visual.manual_yaw_base_arrows_handle", v23.manual_yaw_base_arrows_handle);
v25.subscribe("render", "g_visual.scope_overlay_handle", v23.scope_overlay_handle);
v25.subscribe("localplayer_transparency", "g_visual.keep_scope_transparency_handle", v23.keep_scope_transparency_handle);
v25.subscribe("render", "g_visual.notify.handle", v23.notify.handle);
v25.subscribe("render", "g_visual.ambient_tools.on_render", v23.ambient_tools.on_render);
v25.subscribe("shutdown", "g_visual.ambient_tools.on_shutdown", v23.ambient_tools.on_shutdown);
v25.subscribe("shutdown", "g_visual.aspect_ratio.destroy", v23.aspect_ratio.destroy);
v25.subscribe("aim_fire", "g_visual.override_viewmodel.on_aim_fire", v23.override_viewmodel.on_aim_fire);
v25.subscribe("override_view", "g_visual.override_viewmodel.on_override_view", v23.override_viewmodel.on_override_view);
v25.subscribe("render", "g_visual.override_viewmodel.on_render", v23.override_viewmodel.on_render);
v25.subscribe("shutdown", "g_visual.override_viewmodel.destroy", v23.override_viewmodel.destroy);
v25.subscribe("createmove", "g_misc.fast_ladder_handle", v24.fast_ladder_handle);
v25.subscribe("createmove", "g_misc.no_fall_damage_handle", v24.no_fall_damage_handle);
v25.subscribe("createmove", "g_misc.quick_fall_handle", v24.quick_fall_handle);
v25.subscribe("createmove", "g_misc.super_toss.on_createmove", v24.super_toss.on_createmove);
v25.subscribe("grenade_override_view", "g_misc.super_toss.on_grenade_override_view", v24.super_toss.on_grenade_override_view);
v25.subscribe("createmove", "g_misc.nospread.createmove", v24.nospread.createmove);
v25.subscribe("createmove_run", "g_misc.nospread.createmove_run", v24.nospread.createmove_run);
v25.subscribe("post_update_clientside_animation", "g_misc.animfix.pre_render", v24.animfix.pre_render);
v25.subscribe("player_hurt", "g_misc.logger.on_player_hurt", v24.logger.on_player_hurt);
v25.subscribe("aim_ack", "g_misc.logger.on_aim_ack", v24.logger.on_aim_ack);
v25.subscribe("render", "g_misc.clantag.handle", v24.clantag.handle);
v25.subscribe("shutdown", "g_misc.clantag.destroy", v24.clantag.destroy);
v25.subscribe("player_death", "g_misc.trashtalk.handle", v24.trashtalk.handle);
v25.subscribe("shutdown", "g_callback.restore_all_og_menu", v25.restore_all_og_menu);