ui.sidebar("Voyager", "satellite-dish");
local _ = render.get_scale(1);
local v1 = common.get_username();
local v2 = render.screen_size();
local v3 = render.get_scale(2);
local v4 = ui.get_style("Link Active");
local l_r_0 = ui.get_style("Link Active").r;
local l_g_0 = ui.get_style("Link Active").g;
local l_b_0 = ui.get_style("Link Active").b;
local l_mtools_0 = require("neverlose/mtools");
local l_ffi_0 = require("ffi");
local l_gradient_0 = require("neverlose/gradient");
local _ = require("neverlose/anti_aim");
local l_system_0 = require("neverlose/drag_system");
local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local _ = require("neverlose/exploits");
local l_events_0 = require("neverlose/events");
local v18 = vector(0, 0, 0);
local v29 = {
    scale = {
        head = 4, 
        chest = 1, 
        stomach = 1.25, 
        legs = 0.75, 
        arms = 0.75
    }, 
    calculate = function(v19, v20, v21, v22)
        if not v20 then
            return 0;
        elseif not v20:get_player_weapon() then
            return 0;
        else
            local v23 = v20:get_player_weapon():get_weapon_info();
            if not v23 then
                return 0;
            else
                local v24 = v20.m_vecAbsOrigin:dist(v21.m_vecAbsOrigin);
                local v25 = v23.damage * math.pow(v23.range_modifier, v24 * 0.002);
                local l_m_ArmorValue_0 = v21.m_ArmorValue;
                local v27 = v25 * (v23.armor_ratio * 0.5);
                if l_m_ArmorValue_0 < v25 - v25 * (v23.armor_ratio * 0.5) * 0.5 then
                    v27 = v25 - l_m_ArmorValue_0 / 0.5;
                end;
                local _ = v21.m_iHealth;
                return v27 * v19.scale[v22];
            end;
        end;
    end
};
local v36 = {
    db = {}, 
    is_active = function(v30, v31)
        if v31 == nil then
            return {
                tick = 0, 
                active = false
            };
        else
            local v32 = v31:get_index();
            local l_tickcount_0 = globals.tickcount;
            local v34 = to_ticks(v31.m_flSimulationTime);
            v30.db[v32] = v30.db[v32] and v30.db[v32] or {
                defensive_until = 0, 
                last_sim_time = 0
            };
            if v30.db[v32].last_sim_time == 0 then
                v30.db[v32].last_sim_time = v34;
                return {
                    tick = 0, 
                    active = false
                };
            else
                local v35 = v34 - v30.db[v32].last_sim_time;
                if v35 < 0 then
                    v30.db[v32].defensive_until = l_tickcount_0 + math.abs(v35) - to_ticks(utils.net_channel().latency[0]);
                end;
                v30.db[v32].last_sim_time = v34;
                return {
                    tick = v30.db[v32].defensive_until - globals.tickcount, 
                    active = l_tickcount_0 < v30.db[v32].defensive_until
                };
            end;
        end;
    end
};
local v37 = {
    cache = {}
};
v37.new = function(v38, v39)
    -- upvalues: v37 (ref)
    v37.cache[v38] = v39 or 0;
end;
v37.lerp = function(v40, v41, v42)
    -- upvalues: v37 (ref)
    if v37.cache[v40] == nil then
        v37.new(v40);
    end;
    v37.cache[v40] = v37.cache[v40] + (v41 - v37.cache[v40]) * (globals.frametime * v42);
    return v37.cache[v40];
end;
v37.get = function(v43)
    -- upvalues: v37 (ref)
    if v37.cache[v43] == nil then
        return false;
    else
        return v37.cache[v43];
    end;
end;
v37.reset = function(v44)
    -- upvalues: v37 (ref)
    if v37.cache[v44] == nil then
        return false;
    else
        v37.cache[v44] = 0;
        return;
    end;
end;
v37.delete = function(v45)
    -- upvalues: v37 (ref)
    v37.cache[v45] = nil;
end;
local v46 = "Voyagerbestluafrfrongodnokizzynocap";
local v47 = "https://bot.skidadleskidodle.party/verify";
local v48 = "https://bot.skidadleskidodle.party/config";
local v49 = "Beta";
local v50 = nil;
local l_md5_0 = require("neverlose/md5");
local v64 = (function(v52, v53)
    -- upvalues: l_md5_0 (ref)
    generate_signature = function(v54, v55, v56)
        -- upvalues: l_md5_0 (ref)
        return l_md5_0.sumhexa(string.format("role%susername%s%s", v55, v54, v56));
    end;
    get_code = function(v57, v58, v59)
        -- upvalues: v53 (ref), v52 (ref)
        local v60 = generate_signature(v57, v58, v53);
        network.post(v52, {
            signature = v60, 
            username = v57, 
            role = v58
        }, {
            ["Content-Type"] = "application/json"
        }, function(v61)
            -- upvalues: v59 (ref)
            local l_status_0, l_result_0 = pcall(json.parse, v61);
            if l_status_0 then
                v59(l_result_0.success, l_result_0.error, l_result_0.code);
            else
                common.add_notify("Voyager", "Could Not Find Server Please Contact Staff");
                utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            end;
        end);
    end;
    return {
        get_code = get_code
    };
end)(v47, v46);
local function v68()
    -- upvalues: v64 (ref), v49 (ref), l_clipboard_0 (ref)
    v64.get_code(common.get_username(), "Voyager " .. v49, function(v65, _, v67)
        -- upvalues: l_clipboard_0 (ref)
        if v65 then
            l_clipboard_0.set(v67);
            common.add_notify("Voyager", "Copied Code To Clipboard");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        else
            common.add_notify("Voyager", "Something went Wrong Please Contact Staff");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        end;
    end);
end;
(function()
    -- upvalues: v64 (ref), v49 (ref), v50 (ref)
    v64.get_code(common.get_username(), "Voyager " .. v49, function(v69, _, v71)
        -- upvalues: v50 (ref)
        if v69 then
            v50 = v71;
        end;
    end);
end)();
local v72 = "nl\\Voyager\\";
files.create_folder(v72);
l_ffi_0.cdef("        void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n        bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n        ");
local v73 = l_ffi_0.load("UrlMon");
local v74 = l_ffi_0.load("WinInet");
download = function(v75, v76)
    -- upvalues: v74 (ref), v73 (ref)
    v74.DeleteUrlCacheEntryA(v75);
    v73.URLDownloadToFileA(nil, v75, v76, 0, 0);
end;
openlink = function(v77)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v77);
end;
local v78 = l_ffi_0.cast("unsigned long(__thiscall*)(void*, const char*)", utils.opcode_scan("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))(l_ffi_0.cast("unsigned long**", l_ffi_0.cast("uintptr_t", utils.opcode_scan("client.dll", "B9 ? ? ? ? E8 ? ? ? ? 8B 5D 08")) + 1)[0], "CHudChat");
local v79 = l_ffi_0.cast("void(__cdecl*)(int, int, int, const char*, ...)", l_ffi_0.cast("void***", v78)[0][27]);
local function _(v80)
    -- upvalues: v79 (ref), v78 (ref)
    v79(v78, 0, 0, string.format("%s ", v80));
end;
local v82 = {
    [1] = "smallest_pixel.ttf", 
    [2] = "logo_full.png", 
    [3] = "logo_text.png", 
    [4] = "voyager_font.ttf", 
    [5] = "calibri.ttf", 
    [6] = "arrow.ttf"
};
for v83 = 1, #v82 do
    if files.read(v72 .. "\\" .. v82[v83]) == nil then
        download("https://github.com/635e/file_storage/raw/refs/heads/main/arrows.ttf", v72 .. "arrow.ttf");
        download("https://github.com/635e/file_storage/raw/main/smallest_pixel.ttf", v72 .. "smallest_pixel.ttf");
        download("https://github.com/635e/file_storage/blob/main/logo_full.png?raw=true", v72 .. "logo_full.png");
        download("https://github.com/635e/file_storage/blob/main/logo_text.png?raw=true", v72 .. "logo_text.png");
        download("https://github.com/635e/file_storage/raw/main/Vampire%20Wars%20Italic.ttf", v72 .. "voyager_font.ttf");
        download("https://github.com/635e/file_storage/raw/main/calibri.ttf", v72 .. "calibri.ttf");
    end;
end;
local v84 = {
    pixel9 = render.load_font(v72 .. "smallest_pixel.ttf", 10, "a o"), 
    voyager = render.load_font(v72 .. "voyager_font.ttf", 17, "a i o"), 
    calibri = render.load_font(v72 .. "calibri.ttf", 14, "b a"), 
    arrow = render.load_font(v72 .. "arrow.ttf", 30, "a")
};
updateFont = function()
    -- upvalues: v84 (ref), v3 (ref)
    v84.pixel9:set_size(9 * v3);
    v84.voyager:set_size(17 * v3);
    v84.calibri:set_size(14 * v3);
    v84.arrow:set_size(30 * v3);
end;
updateFont();
local v85 = {
    logo_full = render.load_image_from_file(v72 .. "logo_full.png", vector(2000, 500)), 
    logo = render.load_image_from_file(v72 .. "logo_text.png", vector(1440, 360))
};
utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
common.add_notify("Welcome, " .. v1, "Voyager succesfully loaded!");
local v86 = {
    pitch = ui.find("aimbot", "anti aim", "angles", "pitch"), 
    yaw = ui.find("aimbot", "anti aim", "angles", "Yaw"), 
    yaw_base = ui.find("aimbot", "anti aim", "angles", "yaw", "base"), 
    yaw_offset = ui.find("aimbot", "anti aim", "angles", "yaw", "offset"), 
    yaw_avoid_backstab = ui.find("aimbot", "anti aim", "angles", "yaw", "Avoid Backstab"), 
    yaw_hidden = ui.find("aimbot", "anti aim", "angles", "yaw", "Hidden"), 
    yaw_mod = ui.find("aimbot", "anti aim", "angles", "yaw modifier"), 
    yaw_mod_offset = ui.find("aimbot", "anti aim", "angles", "yaw modifier", "offset"), 
    body_yaw = ui.find("aimbot", "anti aim", "angles", "body yaw"), 
    left_limit = ui.find("aimbot", "anti aim", "angles", "body yaw", "left limit"), 
    right_limit = ui.find("aimbot", "anti aim", "angles", "body yaw", "right limit"), 
    options = ui.find("aimbot", "anti aim", "angles", "body yaw", "options"), 
    freestanding_desync = ui.find("aimbot", "anti aim", "angles", "body yaw", "freestanding"), 
    inverter = ui.find("aimbot", "anti aim", "angles", "body yaw", "inverter"), 
    freestanding = ui.find("aimbot", "anti aim", "angles", "Freestanding"), 
    freestanding_yaw_modifier = ui.find("aimbot", "anti aim", "angles", "Freestanding", "Disable Yaw Modifiers"), 
    freestanding_body = ui.find("aimbot", "anti aim", "angles", "Freestanding", "Body Freestanding"), 
    autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
    safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    daim = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    walk = ui.find("Aimbot", "anti aim", "misc", "slow walk"), 
    fd = ui.find("Aimbot", "anti aim", "misc", "Fake duck"), 
    dt = ui.find("aimbot", "ragebot", "main", "double tap"), 
    md = ui.find("aimbot", "ragebot", "selection", "min. damage"), 
    hc = ui.find("aimbot", "ragebot", "selection", "hit chance"), 
    hs = ui.find("aimbot", "ragebot", "main", "hide shots"), 
    hs_gear = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    pa = ui.find("aimbot", "ragebot", "main", "peek assist"), 
    air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    bh = ui.find("Miscellaneous", "Main", "Movement", "Bunny Hop"), 
    fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    fb = ui.find("aimbot", "ragebot", "Safety", "Body Aim"), 
    nlhit = ui.find("Miscellaneous", "Main", "Other", "Log Events"), 
    lagopt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    dtfl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    fl_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fl_random = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    windows = ui.find("Miscellaneous", "Main", "Other", "Windows"), 
    scope_zoom = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    strafe_assist = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist"), 
    bunnyhop = ui.find("Miscellaneous", "Main", "Movement", "Bunny Hop"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    pingspike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    dt_quickswitch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
};
cfglist = nil;
updateConfigList = function(v87)
    if v87 == "" then
        return "The Config Servers Are Down";
    else
        cfglist = json.parse(v87).data;
        local v88 = {};
        if cfglist == nil then
            return "There Are No Configs";
        else
            table.sort(cfglist, function(v89, v90)
                return v89.DownloadCount > v90.DownloadCount;
            end);
            for v91 = 1, #cfglist do
                v88[v91] = "\addff00FF[" .. cfglist[v91].DownloadCount .. "]\aFFFFFFFF " .. cfglist[v91].Name;
            end;
            return v88;
        end;
    end;
end;
local v92 = {
    [1] = "nigger", 
    [2] = "retard", 
    [3] = "faggot", 
    [4] = "femboy", 
    [5] = "trans", 
    [6] = "gay", 
    [7] = "lgbtq", 
    [8] = "black"
};
local function v93()
    -- upvalues: v48 (ref), v50 (ref)
    configsys.cloud.list.ref:update(updateConfigList(network.get(v48 .. "/getConfigs", {
        Code = v50
    })));
end;
configsys = {
    logo = l_pui_0.texture({
        [1] = "\f<bars>", 
        [2] = "\vDiscord", 
        [3] = 2
    }, v85.logo_full, vector(250, 62.5), nil, nil, 5), 
    madeby = l_pui_0.label({
        [1] = "\f<bars>", 
        [2] = "\vDiscord", 
        [3] = 1
    }, "          Made by \v 635 \affffffff and \v Clown_K1NG \n"), 
    button_code = l_pui_0.button({
        [1] = "\f<bars>", 
        [2] = "\vDiscord", 
        [3] = 1
    }, "                        \v\f<link>\r Generate Code                        ", v68), 
    button_join = l_pui_0.button({
        [1] = "\f<bars>", 
        [2] = "\vDiscord", 
        [3] = 1
    }, "                    \v\f<discord>\r Join Discord Server                    ", function()
        openlink("https://discord.gg/DkGNCAGFzE");
    end), 
    normal = {
        cfg_list = l_pui_0.list({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "\n", {}), 
        cfg_name = l_pui_0.input({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "\n"), 
        save = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "   \f<floppy-disk>   ", function()
            ConfigSystem:save();
        end, true), 
        load = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "               Load Config               ", function()
            ConfigSystem:load();
        end), 
        delete = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "   \aff0000ff\f<trash>   ", function()
            ConfigSystem:delete();
        end, true), 
        export_menu = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "             Export             ", function()
            ConfigSystem.export();
        end, true), 
        import_menu = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vConfig", 
            [3] = 2
        }, "             Import             ", function()
            ConfigSystem.import();
        end, true)
    }, 
    selection = l_pui_0.list({
        [1] = "\f<bars>", 
        [2] = "\vVoyager", 
        [3] = 1
    }, "\n", "\v\f<house>\r  Main", "\v\f<files>\r   Local Config", "\v\f<clouds>\r Cloud Config"), 
    cloud = {
        list = l_pui_0.list({
            [1] = "\f<bars>", 
            [2] = "\vCloud Configs", 
            [3] = 2
        }, "", "Reload to Show Configs"), 
        info1 = l_pui_0.label({
            [1] = "\f<bars>", 
            [2] = "\vCloud Configs", 
            [3] = 2
        }, "Owner: "), 
        info2 = l_pui_0.label({
            [1] = "\f<bars>", 
            [2] = "\vCloud Configs", 
            [3] = 2
        }, "Last Updated: "), 
        label = l_pui_0.label({
            [1] = "\f<bars>", 
            [2] = "\vCloud Manager", 
            [3] = 2
        }, "\n"), 
        input = l_pui_0.input({
            [1] = "\f<bars>", 
            [2] = "\vCloud Manager", 
            [3] = 2
        }, "Cfg Name"), 
        create = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vCloud Manager", 
            [3] = 2
        }, "Create", function(v94)
            -- upvalues: v92 (ref), v48 (ref), v50 (ref), l_base64_0 (ref), l_pui_0 (ref), v49 (ref), v93 (ref)
            local v95 = string.lower(configsys.cloud.input.ref:get());
            if string.gsub(configsys.cloud.input.ref:get(), " ", "") == "" or string.gsub(configsys.cloud.input.ref:get(), " ", "") == " " then
                common.add_notify("Voyager", "You cannot publish a config without a name");
                utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                return;
            else
                for _, v97 in pairs(v92) do
                    if string.find(v95:gsub("[^a-z]", ""), v97) then
                        common.add_notify("Voyager", "No bad words for you");
                        utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                        return;
                    end;
                end;
                if cfglist ~= nil and common.get_username() ~= "635" and common.get_username() ~= "ClownK1NG" then
                    for _, v99 in pairs(cfglist) do
                        if v99.OwnerName == common.get_username() and v99.OwnerName ~= "635" or v99.OwnerName == common.get_username() and v99.OwnerName ~= "ClownK1NG" then
                            common.add_notify("Voyager", "You already Have a Public Config");
                            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                            return;
                        elseif v99.Name == configsys.cloud.input.ref:get() then
                            common.add_notify("Voyager", "There Is Already A Config With This Name");
                            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                            return;
                        end;
                    end;
                end;
                test = network.post(v48 .. "/createConfig", nil, {
                    Code = v50, 
                    Cfg = l_base64_0.encode(msgpack.pack(l_pui_0.save())), 
                    CfgName = configsys.cloud.input.ref:get(), 
                    Username = common.get_username(), 
                    Version = v49
                });
                v94:disabled(true);
                common.add_notify("Voyager", "Config uploaded");
                v93();
                utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                utils.execute_after(20, function()
                    -- upvalues: v94 (ref)
                    v94:disabled(false);
                end);
                config_check();
                return;
            end;
        end, true), 
        getcfg = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vCloud Configs", 
            [3] = 2
        }, "Load Config", function(v100)
            ConfigSystem:load(getConfig(configsys.cloud.list.ref:list()[configsys.cloud.list.ref:get()]) or "No Config");
            v100:disabled(true);
            utils.execute_after(5, function()
                -- upvalues: v100 (ref)
                v100:disabled(false);
            end);
        end, true), 
        reload = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vCloud Configs", 
            [3] = 2
        }, "Refresh Configs", function(v101)
            -- upvalues: v93 (ref)
            v93();
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            v101:disabled(true);
            utils.execute_after(5, function()
                -- upvalues: v101 (ref)
                v101:disabled(false);
            end);
        end, true), 
        delete = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vCloud Manager", 
            [3] = 1
        }, "Delete", function(v102)
            -- upvalues: v48 (ref), v50 (ref), v93 (ref)
            if cfglist == nil then
                return;
            else
                name = common.get_username();
                if cfglist[configsys.cloud.list.ref:get()].OwnerName == name then
                    if configsys.cloud.list.ref:list()[configsys.cloud.list.ref:get()] ~= "There Are No Configs" then
                        network.post(v48 .. "/deleteConfig", nil, {
                            Code = v50, 
                            CfgName = cfglist[configsys.cloud.list.ref:get()].Name, 
                            Username = common.get_username()
                        });
                        common.add_notify("Voyager", "Config Deleted");
                        v93();
                        utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                        v102:disabled(true);
                        utils.execute_after(20, function()
                            -- upvalues: v102 (ref)
                            v102:disabled(false);
                        end);
                        config_check();
                    end;
                else
                    common.add_notify("Voyager", "You cannot Delete That Config");
                    utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                end;
                return;
            end;
        end, true), 
        update = l_pui_0.button({
            [1] = "\f<bars>", 
            [2] = "\vCloud Manager", 
            [3] = 1
        }, "Update", function(v103)
            -- upvalues: v48 (ref), v50 (ref), l_base64_0 (ref), l_pui_0 (ref)
            if cfglist == nil then
                return;
            else
                name = common.get_username();
                local v104 = false;
                for v105, _ in pairs(cfglist) do
                    if cfglist[v105].OwnerName == name then
                        network.post(v48 .. "/updateConfig", nil, {
                            Code = v50, 
                            Cfg = l_base64_0.encode(msgpack.pack(l_pui_0.save())), 
                            CfgName = cfglist[configsys.cloud.list.ref:get()].Name, 
                            Username = name
                        });
                        v103:disabled(true);
                        utils.execute_after(20, function()
                            -- upvalues: v103 (ref)
                            v103:disabled(false);
                        end);
                        v104 = true;
                        common.add_notify("Voyager", "\vConfig Updated");
                        utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                        return;
                    end;
                end;
                if not v104 then
                    common.add_notify("Voyager", "You Dont Have a Cloud Config");
                    utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
                end;
                return;
            end;
        end, true)
    }
};
local v107 = v72 .. "\\" .. "cfg.voyager";
files.create_folder(v72);
if files.read(v107) == nil then
    files.write(v107, msgpack.pack({}), false);
end;
ConfigSystem = {
    CurrentLoadedConfig = "", 
    CurrentConfigs = {}, 
    ConfigPath = v72 .. "\\" .. "cfg.voyager", 
    getKeys = function(v108)
        local v109 = msgpack.unpack(files.read(v108.ConfigPath));
        v108.CurrentConfigs = {};
        for v110, _ in pairs(v109) do
            table.insert(v108.CurrentConfigs, v110);
        end;
        table.sort(v108.CurrentConfigs);
        configsys.normal.cfg_list:update(v108.CurrentConfigs);
    end, 
    save = function(v112)
        local v113 = msgpack.unpack(files.read(v112.ConfigPath));
        local v114 = v112:export("Reason: Save");
        local v115 = configsys.normal.cfg_name:get();
        if v115 == "" then
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            return common.add_notify("Voyager", "Config needs a name");
        else
            v113[v115] = v114;
            files.write(v112.ConfigPath, msgpack.pack(v113), false);
            common.add_notify("Voyager", "Saved Config \"" .. v115 .. "\"");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            v112:getKeys();
            return;
        end;
    end, 
    load = function(v116, v117)
        -- upvalues: l_base64_0 (ref), l_pui_0 (ref)
        if v117 == nil then
            local v118 = msgpack.unpack(files.read(v116.ConfigPath));
            local v119 = v116.CurrentConfigs[configsys.normal.cfg_list:get()];
            local v120 = msgpack.unpack(l_base64_0.decode(v118[v119]:sub(10)));
            l_pui_0.load(v120);
            common.add_notify("Voyager", "Loaded Config \"" .. v119 .. "\"");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            v116:getKeys();
        elseif v117 == "No Config" then
            return;
        else
            l_pui_0.load(msgpack.unpack(l_base64_0.decode(v117)));
            common.add_notify("Voyager", "Loaded Cloud Config");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        end;
    end, 
    delete = function(v121)
        local v122 = msgpack.unpack(files.read(v121.ConfigPath));
        local v123 = v121.CurrentConfigs[configsys.normal.cfg_list:get()];
        v122[v123] = nil;
        files.write(v121.ConfigPath, msgpack.pack(v122), false);
        common.add_notify("Voyager", "Deleted Config \"" .. v123 .. "\"");
        utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        v121:getKeys();
    end, 
    import = function()
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_pui_0 (ref)
        local v124 = l_clipboard_0:get();
        local l_status_1, l_result_1 = pcall(l_base64_0.decode, v124:sub(10));
        if l_status_1 then
            l_pui_0.load(msgpack.unpack(l_result_1));
            common.add_notify("Voyager", "Imported Settings From Clipboard");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        else
            common.add_notify("Voyager", "Invalid Config");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
        end;
    end, 
    export = function(v127)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v128 = l_pui_0.save();
        local v129 = "[Voyager] " .. l_base64_0.encode(msgpack.pack(v128));
        if v127 == nil then
            l_clipboard_0.set(v129);
            common.add_notify("Voyager", "Exported Settings To Clipboard");
            utils.console_exec("playvol \"survival/buy_item_failed_01.wav\" 1");
            return;
        else
            return v129;
        end;
    end
};
ConfigSystem:getKeys();
configsys.normal.cfg_list:update(ConfigSystem.CurrentConfigs);
configsys.cloud.list.ref:update(updateConfigList(network.get(v48 .. "/getConfigs", {
    Code = v50
})));
configsys.cloud.reload.ref:tooltip("Can Only Be Done Every 5 Seconds");
l_events_0.render:set(function()
    cfg = configsys.cloud.input.ref:get();
    local v130 = nil;
    if string.len(cfg) >= 16 then
        configsys.cloud.input.ref:update(v130);
    else
        v130 = cfg;
    end;
end);
getConfig = function(_)
    -- upvalues: v48 (ref), v50 (ref)
    if cfglist == nil then
        return;
    else
        local v132 = network.get(v48 .. "/getConfigByName", {
            Name = cfglist[configsys.cloud.list.ref:get()].Name, 
            Code = v50
        });
        return json.parse(v132).data;
    end;
end;
cloud_visability = function()
    if ui.get_alpha() > 0 then
        for _, v134 in pairs(configsys.cloud) do
            v134:visibility(configsys.selection:get() == 3);
        end;
        for _, v136 in pairs(configsys.normal) do
            v136:visibility(configsys.selection:get() == 2);
        end;
    end;
end;
local v137 = false;
config_check = function()
    -- upvalues: v137 (ref)
    local v138 = common.get_username();
    if cfglist == nil then
        v137 = false;
        return;
    else
        for v139, _ in pairs(cfglist) do
            if cfglist[v139].OwnerName == v138 then
                v137 = true;
                configsys.cloud.label:name("" .. cfglist[v139].Name .. "\nLast Updated: " .. cfglist[v139].LastUpdated .. "                                  ");
                return;
            end;
        end;
        v137 = false;
        return;
    end;
end;
config_check();
local v141 = nil;
local _ = nil;
configsys.normal.cfg_list:set_callback(function()
    if ConfigSystem.CurrentConfigs[1] == nil then
        return;
    else
        configsys.normal.cfg_name:set(ConfigSystem.CurrentConfigs[configsys.normal.cfg_list:get()]);
        return;
    end;
end);
l_events_0.render:set(function()
    -- upvalues: v141 (ref)
    if cfglist ~= nil and v141 ~= configsys.cloud.list.ref:get() then
        v141 = configsys.cloud.list.ref:get();
        if cfglist[configsys.cloud.list.ref:get()].OwnerName == "ClownK1NG" or cfglist[configsys.cloud.list.ref:get()].OwnerName == "635" then
            configsys.cloud.info1.ref:name("Owner: " .. cfglist[configsys.cloud.list.ref:get()].OwnerName .. " \aff0022FF[Owner]" .. "\a" .. ui.get_style("Text"):to_hex() .. " | Build: " .. cfglist[configsys.cloud.list.ref:get()].Version);
        elseif cfglist[configsys.cloud.list.ref:get()].OwnerName == "Tr1x1234" then
            configsys.cloud.info1.ref:name("Owner: " .. cfglist[configsys.cloud.list.ref:get()].OwnerName .. " \aff8800FF[Staff]" .. "\a" .. ui.get_style("Text"):to_hex() .. " | Build: " .. cfglist[configsys.cloud.list.ref:get()].Version);
        else
            configsys.cloud.info1.ref:name("Owner: " .. cfglist[configsys.cloud.list.ref:get()].OwnerName .. " | Build: " .. cfglist[configsys.cloud.list.ref:get()].Version);
        end;
        configsys.cloud.info2.ref:name("Last Update: " .. cfglist[configsys.cloud.list.ref:get()].LastUpdated .. "                                         ");
    end;
end);
l_events_0.render:set(cloud_visability);
set_tooltips = function()
    configsys.normal.save:tooltip("Save / Create if config doesen't exist");
    configsys.normal.delete:tooltip("Delete");
end;
set_tooltips();
menuvars = {
    antiaim = {
        main = l_pui_0.create("\f<shield-quartered>", "\v\f<list> Main", 1), 
        stategroup = l_pui_0.create("\f<shield-quartered>", "\v\f<sparkles> State", 2), 
        builder = l_pui_0.create("\f<shield-quartered>", "\v\f<fire> Builder", 2)
    }, 
    selection = l_pui_0.create("\f<wand-magic-sparkles>", "\v\f<bars> Selection", 1), 
    visuals = {
        main = l_pui_0.create("\f<wand-magic-sparkles>", "\v\f<sparkles> Visuals", 2), 
        secondary = l_pui_0.create("\f<wand-magic-sparkles>", "\v\f<stars> Extras", 1)
    }, 
    misc = {
        main = l_pui_0.create("\f<wand-magic-sparkles>", "\v\f<lightbulb-exclamation-on> Essentials", 2), 
        secondary = l_pui_0.create("\f<wand-magic-sparkles>", "\v\f<code> Extras ", 1)
    }
};
phase_table = {
    [1] = "#1"
};
voyager_menu = {
    selection = l_pui_0.list(menuvars.selection, "\n", "\v\f<wand-magic-sparkles>\r  Visuals", "\v\f<gears>\r Misc"), 
    visuals = {
        widgets_tog = l_pui_0.switch(menuvars.visuals.main, "\v\f<window>\r  Widgets", false, function(v143)
            return {
                color = v143:color_picker("Color", ui.get_style("Link Active")), 
                rounding = v143:slider("Rounding", 0, 6, 3)
            };
        end), 
        widgets = l_pui_0.listable(menuvars.visuals.main, "\n", {
            [1] = "Keybind", 
            [2] = "Spectator", 
            [3] = "Defensive", 
            [4] = "Slowdown", 
            [5] = "Watermark"
        }), 
        dragable = {
            keyx = l_pui_0.slider(menuvars.visuals.main, "keyx", 0, v2.x, 300), 
            keyy = l_pui_0.slider(menuvars.visuals.main, "keyy", 0, v2.y, 400), 
            specx = l_pui_0.slider(menuvars.visuals.main, "specx", 0, v2.x, 200), 
            specy = l_pui_0.slider(menuvars.visuals.main, "specy", 0, v2.y, 400), 
            defx = l_pui_0.slider(menuvars.visuals.main, "defx", 0, v2.x, v2.x / 2 - 75), 
            defy = l_pui_0.slider(menuvars.visuals.main, "defy", 0, v2.y, 250), 
            slowx = l_pui_0.slider(menuvars.visuals.main, "slowx", 0, v2.x, v2.x / 2 - 75), 
            slowy = l_pui_0.slider(menuvars.visuals.main, "slowy", 0, v2.y, 350), 
            baitx = l_pui_0.slider(menuvars.visuals.main, "baitx", 0, v2.x, v2.x / 2 - 50), 
            baity = l_pui_0.slider(menuvars.visuals.main, "baity", 0, v2.y, v2.y / 2 + 300)
        }, 
        indicators_tog = l_pui_0.switch(menuvars.visuals.main, "\v\f<star>\r Indicators", false, function(v144)
            return {
                color = v144:color_picker("Indicator Color", ui.get_style("Link Active")), 
                ind = v144:selectable("Indicators", "dt", "hs", "fs", "baim", "safepoint")
            }, true;
        end), 
        indicators = l_pui_0.listable(menuvars.visuals.main, "\n\n", {
            [1] = "Main", 
            [2] = "Min. Damage", 
            [3] = "Hitlogs", 
            [4] = "Hitmarkers"
        }), 
        hitlog_settings = l_pui_0.label(menuvars.visuals.main, "Hitlog settings", function(v145)
            return {
                style = v145:combo("Style", "Simple", "Customizable"), 
                hitlog_type = v145:selectable("Hitlogs", "Console", "On screen"), 
                settings = v145:listable("\n\n\n\n", {
                    [1] = "Type", 
                    [2] = "Name", 
                    [3] = "Miss Reason", 
                    [4] = "Hitbox", 
                    [5] = "Wanted Hitbox", 
                    [6] = "Damage", 
                    [7] = "Wanted Damage", 
                    [8] = "Hitchance", 
                    [9] = "Backtrack", 
                    [10] = "Spread", 
                    [11] = "Outline"
                }), 
                offset = v145:slider("Offset", -10, 10, 0), 
                include_undermin = v145:switch("Include Undermin"), 
                color_hit = v145:color_picker("Hit Color", color(179, 184, 255)), 
                color_miss = v145:color_picker("Miss Color", color(255, 87, 87)), 
                color_missmatch = v145:color_picker("Missmatch Color", color(255, 201, 130)), 
                color_undermin = v145:color_picker("Undermin Color", color(181, 182, 199))
            };
        end), 
        hitmarker_settings = l_pui_0.label(menuvars.visuals.main, "Hitmarker settings", function(v146)
            return {
                settings = v146:selectable("\n\n\n", {
                    [1] = "3D", 
                    [2] = "Damage", 
                    [3] = "Animate Damage"
                }), 
                colormarker = v146:color_picker("3D Color", color(255, 255, 255, 200)), 
                colorbaim = v146:color_picker("Baim Color", color(255, 255, 255, 200)), 
                colorhead = v146:color_picker("Headshot Color", color(255, 0, 0, 200))
            };
        end), 
        custom_scope = l_pui_0.switch(menuvars.visuals.secondary, "\v\f<crosshairs-simple>\r Custom Scope", false, function(v147)
            return {
                color = v147:color_picker("Color", color(255)), 
                length = v147:slider("Lenght", 0, 40, 7), 
                offset = v147:slider("Start", 0, 40, 3), 
                animation = v147:combo("Animation", {
                    [1] = "None", 
                    [2] = "Opacity", 
                    [3] = "Move", 
                    [4] = "Move Inverted"
                }), 
                tstyle = v147:switch("T Style", false), 
                invert = v147:switch("Invert", false)
            }, true;
        end), 
        intro = l_pui_0.switch(menuvars.visuals.secondary, "\v\f<film>\r Startupscreen", true), 
        anims_tog = l_pui_0.switch(menuvars.visuals.secondary, "\v\f<circle-radiation>\r Animations", true), 
        anims = l_pui_0.listable(menuvars.visuals.secondary, "\n\v", {
            [1] = "0 Pitch on Land", 
            [2] = "Static Legs in Air", 
            [3] = "Backward Legs", 
            [4] = "No Moving Animation", 
            [5] = "Static Legs on Slowwalk", 
            [6] = "Devious Walk"
        })
    }, 
    misc = {
        aspect_ratio_tog = l_pui_0.switch(menuvars.misc.secondary, "\v\f<arrows-left-right-to-line>\r Aspect Ratio"), 
        aspect_ratio = l_pui_0.slider(menuvars.misc.secondary, "\n", 0, 200, 0, 0.01), 
        viewmodel = l_pui_0.switch(menuvars.misc.secondary, "\v\f<users-viewfinder>\r Viewmodel", true, function(v148)
            return {
                x = v148:slider("X", -5000, 5000, 1000, 0.001), 
                y = v148:slider("Y", -5000, 5000, 1000, 0.001), 
                z = v148:slider("Z", -5000, 5000, 2000, 0.001), 
                fov = v148:slider("Fov", 35, 140, 60)
            }, true;
        end), 
        clantag = l_pui_0.switch(menuvars.misc.main, "\v\f<tags>\r Clantag", false), 
        trashtalk = l_pui_0.switch(menuvars.misc.secondary, "\v\f<trash>\r Trashtalk", false), 
        fastladder = l_pui_0.switch(menuvars.misc.main, "\v\f<gauge-max>\r Fast Ladder", false), 
        shared_icon = l_pui_0.switch(menuvars.misc.main, "\v\f<users>\r Shared Icon", true), 
        fakeduck = l_pui_0.switch(menuvars.misc.secondary, "\v\f<person-praying>\r Animate Fakeduck", false), 
        visualize_aimbot = l_pui_0.switch(menuvars.misc.secondary, "\v\f<person-rifle>\r Visualize Aimbot", false), 
        nade_fix = l_pui_0.switch(menuvars.misc.main, "\v\f<bomb>\r Nadethrow Fix", true), 
        forcebaim = l_pui_0.switch(menuvars.misc.main, "\v\f<skull>\r Forcebaim on Lethal", true), 
        jumpscout = l_pui_0.switch(menuvars.misc.main, "\v\f<person-falling>\r Jumpscout", false), 
        inairhc = l_pui_0.selectable(menuvars.misc.main, "\v\f<crosshairs>\r Air Hitchance", {
            [1] = "Scout", 
            [2] = "AutoSniper", 
            [3] = "Awp"
        }, function(v149)
            return {
                awp = v149:slider("Awp", 0, 100), 
                ssg = v149:slider("Scout", 0, 100), 
                auto = v149:slider("AutoSniper", 0, 100)
            }, true;
        end), 
        pingspike_tog = l_pui_0.switch(menuvars.misc.main, "\v\f<wifi>\r Pingspike", false), 
        pingspike = l_pui_0.slider(menuvars.misc.main, "\n", 0, 800, 200), 
        pingpike_warning = l_pui_0.label(menuvars.misc.main, "  \affff00ff\f<triangle-exclamation>\r values above 200 may cause issues \affff00ff\f<triangle-exclamation>\r")
    }, 
    antiaim = {
        condition = l_pui_0.combo(menuvars.antiaim.stategroup, "Condition", {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Running", 
            [4] = "Slowwalk", 
            [5] = "Crouching", 
            [6] = "Air", 
            [7] = "Air+C"
        }), 
        builder = l_pui_0.switch(menuvars.antiaim.main, "Antiaim Master Switch", true), 
        defensive = l_pui_0.switch(menuvars.antiaim.main, "Enable Defensive", true), 
        bait_aa = l_pui_0.switch(menuvars.antiaim.main, "Bait AA", true, function(v150)
            return {
                condition = v150:selectable("Bait on:", {
                    [1] = "Freestand", 
                    [2] = "Manuals"
                }), 
                pitch = v150:slider("Pitch", -89, 89, 89), 
                trigger = v150:combo("Trigger", {
                    [1] = "Don't Override", 
                    [2] = "On Peek", 
                    [3] = "Always On"
                }), 
                indicator = v150:switch("Indicator")
            }, true;
        end), 
        backstab = l_pui_0.switch(menuvars.antiaim.main, "Anti Backstab", true), 
        onshot_fl = l_pui_0.switch(menuvars.antiaim.main, "Disable Fl on shot", false), 
        smoothen_state = l_pui_0.switch(menuvars.antiaim.main, "Smoothen States", false), 
        smooth_amount = l_pui_0.slider(menuvars.antiaim.main, "Smoothing Amount", 2, 32, 4), 
        safehead = l_pui_0.selectable(menuvars.antiaim.main, "Safehead", {
            [1] = "Knife", 
            [2] = "Zeus", 
            [3] = "Above Enemy"
        }, function(v151)
            return {
                height = v151:slider("Height", 30, 200, 70), 
                defensive = v151:switch("Defensive"), 
                pitch = v151:slider("Pitch", -89, 89, 0)
            }, true;
        end), 
        manuals_tog = l_pui_0.switch(menuvars.antiaim.main, "Manuals", true), 
        manuals = l_pui_0.combo(menuvars.antiaim.main, "\n", {
            [1] = "None", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Backwards", 
            [5] = "Forwards"
        }), 
        manuals_static = l_pui_0.switch(menuvars.antiaim.main, "Static on manual", true), 
        manuals_arrows = l_pui_0.switch(menuvars.antiaim.main, "Arrows", true, function(v152)
            return {
                arrows = v152:selectable("Sides", {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Down", 
                    [4] = "Up"
                }), 
                offset = v152:slider("Offset", -40, 250, 0), 
                show_scoped = v152:combo("When Scoped", {
                    [1] = "Nothing", 
                    [2] = "Hide", 
                    [3] = "Move"
                }), 
                color_active = v152:color_picker("Active", ui.get_style("Link Active")), 
                color_inactive = v152:color_picker("Inactive", color(70, 70, 70, 100))
            }, true;
        end)
    }
};
tooltips = {
    voyager_menu.misc.visualize_aimbot:tooltip("Doesnt work with cl_righthand 0"), 
    voyager_menu.antiaim.onshot_fl:tooltip("Forces the cheat to send a packet after shooting to minimize time spent flicking out"), 
    voyager_menu.antiaim.smoothen_state:tooltip("Makes it so you have to remain in a state for at least x amount of ticks to switch to that state"), 
    voyager_menu.antiaim.safehead:tooltip("Static Antiaim when condition is met (e.g. In air + knife or x units above enemy)"), 
    voyager_menu.misc.fakeduck:tooltip("Visualizes your fakeduck with your viewmodel"), 
    voyager_menu.misc.visualize_aimbot:tooltip("Visualizes your aimbot with your viewmodel"), 
    voyager_menu.misc.inairhc:tooltip("Override your hitchance in air")
};
state = {};
for v153 = 1, 7 do
    state[v153] = {};
    if v153 ~= 1 then
        state[v153].override = l_pui_0.switch(menuvars.antiaim.stategroup, " Enable", false);
    else
        state[v153].placeholder = l_pui_0.label(menuvars.antiaim.stategroup, "      \"\vMen turn me on\r\" -Aradem 2024", false);
    end;
    state[v153].pitch = l_pui_0.combo(menuvars.antiaim.builder, " Pitch", {
        [1] = "Down", 
        [2] = "Fake Up", 
        [3] = "Fake Down"
    });
    state[v153].yaw = l_pui_0.combo(menuvars.antiaim.builder, " Yaw", {
        [1] = "180", 
        [2] = "LR", 
        [3] = "X-Way", 
        [4] = "Sway"
    }, function(v154)
        return {
            base = v154:combo("Yaw Base", {
                [1] = "At Target", 
                [2] = "Local View"
            }), 
            offset = v154:slider("Offset", -180, 180, 0), 
            xways = v154:slider("Ways", 3, 10, 3), 
            xoffset = v154:slider("Offset", -180, 180, 0), 
            left = v154:slider("L Offset", -180, 180, 0), 
            left_random = v154:slider("L Random", 0, 180, 0), 
            right = v154:slider("R Offset", -180, 180, 0), 
            right_random = v154:slider("R Random", 0, 180, 0), 
            delay = v154:slider("Delay", 2, 16, 2, 1, "t"), 
            swaydelay = v154:slider("Delay", 2, 128, 6, 1, "t"), 
            speed = v154:slider("Speed", 1, 40, 20), 
            randomize = v154:slider("Randomization", 0, 180, 0)
        };
    end);
    state[v153].yaw_mod = l_pui_0.combo(menuvars.antiaim.builder, " Yawmod", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "3-Way", 
        [4] = "5-Way"
    }, function(v155)
        return {
            offset = v155:slider("Offset", -180, 180, 0), 
            randomization = v155:slider("Randomization", -180, 180, 0)
        };
    end);
    state[v153].desync = l_pui_0.switch(menuvars.antiaim.builder, " Desync", false, function(v156)
        return {
            l_limit = v156:slider("Left Limit", 0, 60, 60), 
            l_random = v156:slider("Left Random", 0, 60, 0), 
            r_limit = v156:slider("Right Limit", 0, 60, 60), 
            r_random = v156:slider("Right Random", 0, 60, 0), 
            options = v156:selectable("Options", {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Anti Bruteforce", 
                [4] = "Randomize Jitter"
            }), 
            delay = v156:slider("Delay", 2, 16, 2, 1, function(v157)
                if v157 == 2 then
                    return "NL";
                elseif v157 == 16 then
                    return "Phase";
                else
                    return v157 .. "t";
                end;
            end), 
            delayrandom = v156:slider("Randomization", 0, 12, 0, 1, "t"), 
            phase_select = v156:slider("Phases", 2, 8, 4, 1, "P"), 
            phase1 = v156:slider("1", 2, 8, 2, 1, "t"), 
            phase2 = v156:slider("2", 2, 8, 2, 1, "t"), 
            phase3 = v156:slider("3", 2, 8, 4, 1, "t"), 
            phase4 = v156:slider("4", 2, 8, 4, 1, "t"), 
            phase5 = v156:slider("5", 2, 8, 2, 1, "t"), 
            phase6 = v156:slider("6", 2, 8, 2, 1, "t"), 
            phase7 = v156:slider("7", 2, 8, 5, 1, "t"), 
            phase8 = v156:slider("8", 2, 8, 6, 1, "t"), 
            modifier = v156:selectable("Delay Modifier", {
                [1] = "Speed", 
                [2] = "Weapon Switch"
            }), 
            compensate = v156:switch("Compensate Angle", false), 
            freestand = v156:combo("Freestand", {
                [1] = "Off", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            })
        }, true;
    end);
    state[v153].defensive = l_pui_0.switch(menuvars.antiaim.builder, "\aff8566ff Defensive", false, function(v158)
        return {
            lag_type = v158:combo("Defensive DT", {
                [1] = "On Peek", 
                [2] = "Always On"
            }), 
            hideshots = v158:switch("Defensive Hideshots", true), 
            defensive_antiaim = v158:switch("Defensive Angles", true), 
            yaw = v158:combo("Yaw", {
                [1] = "Inherit", 
                [2] = "Custom", 
                [3] = "Jitter", 
                [4] = "Synced Jitter", 
                [5] = "Spin", 
                [6] = "Random", 
                [7] = "Sway", 
                [8] = "Movement"
            }), 
            yaw_offset = v158:slider("\n", -180, 180, 0), 
            delay = v158:slider("Delay", 2, 16, 2, 1, function(v159)
                return v159 == 16 and "Cycle" or v159 .. "t";
            end), 
            pitch = v158:combo("Pitch", {
                [1] = "Custom", 
                [2] = "Jitter", 
                [3] = "Random", 
                [4] = "Sway", 
                [5] = "X-Way"
            }), 
            ways = v158:slider("Ways", 3, 6, 3), 
            pitch_offset1 = v158:slider("1", -89, 89, 0), 
            pitch_offset2 = v158:slider("2", -89, 89, 0), 
            pitch_offset3 = v158:slider("3", -89, 89, 0), 
            pitch_offset4 = v158:slider("4", -89, 89, 0), 
            pitch_offset5 = v158:slider("5", -89, 89, 0), 
            pitch_offset6 = v158:slider("6", -89, 89, 0), 
            pitch_jitter_delay = v158:slider("Delay", 2, 32, 2, 1, "t")
        }, true;
    end);
end;
get_velocity = function(v160)
    v160 = entity.get_local_player();
    if v160 == nil then
        return;
    else
        return (v160.m_vecVelocity:length());
    end;
end;
is_crouching = function(v161)
    local l_m_fFlags_0 = v161.m_fFlags;
    if bit.band(l_m_fFlags_0, 4) == 4 then
        return true;
    else
        return false;
    end;
end;
local function v166(v163, v164)
    local l_m_fFlags_1 = v163.m_fFlags;
    if bit.band(l_m_fFlags_1, 1) ~= 0 and (v164 == nil or not v164.in_jump) then
        return false;
    else
        return true;
    end;
end;
local v167 = 0;
l_events_0.aim_fire:set(function()
    -- upvalues: v167 (ref)
    v167 = 0;
end);
local function v169(v168)
    return v168 == "weapon_hegrenade" or not (v168 ~= "weapon_molotov") or not (v168 ~= "weapon_smokegrenade") or not (v168 ~= "weapon_incgrenade") or not (v168 ~= "weapon_flashbang") or v168 == "weapon_decoy";
end;
local v170 = true;
local v171 = 0;
local v172 = 1;
local _ = false;
local _ = 0;
local v175 = 0;
local _ = nil;
local v177 = false;
local v178 = false;
local v179 = 0;
local v180 = 1;
local v181 = {};
local v182 = true;
local v183 = 0;
local v184 = 0;
local v185 = false;
local v186 = false;
local _ = 0;
local v188 = false;
local v189 = 0;
local v190 = 0;
local v191 = 0;
local v192 = 0;
local v193 = 0;
local v194 = 0;
builder_func = function(v195)
    -- upvalues: v86 (ref), v167 (ref), v186 (ref), v194 (ref), v193 (ref), v185 (ref), v166 (ref), v36 (ref), v169 (ref), v184 (ref), v177 (ref), v37 (ref), v183 (ref), v180 (ref), v192 (ref), v178 (ref), v175 (ref), v170 (ref), v188 (ref), v190 (ref), v191 (ref), v189 (ref), v181 (ref), v179 (ref), v182 (ref), v171 (ref), v172 (ref)
    v86.freestanding:override();
    if not voyager_menu.antiaim.builder:get() or v195.in_use then
        return;
    else
        local v196 = entity.get_local_player();
        if not v196 then
            return;
        else
            if voyager_menu.antiaim.onshot_fl:get() then
                if v167 <= 2 then
                    if rage.exploit:get() == 0 and not v86.fd:get() then
                        v86.fl:override(false);
                        v195.send_packet = true;
                    end;
                else
                    v86.fl:override();
                end;
                v167 = v167 + 1;
            end;
            local _ = math.normalize_yaw(entity.get_local_player().m_flPoseParameter[11] * 120 - 60) / 2 > 0;
            if v196:get_player_weapon() ~= nil then
                if v196:get_player_weapon():get_weapon_info().weapon_name == nil then
                    v186 = "nil";
                else
                    v186 = v196:get_player_weapon():get_weapon_info().weapon_name;
                end;
            else
                v186 = "nil";
            end;
            lp_weapon_info = v196:get_player_weapon():get_weapon_info();
            switch_timer = v196:get_simulation_time().current > math.max(v196.m_flNextAttack - 0.6);
            v194 = v196:get_origin().z or 0;
            if entity.get_threat(false) then
                v193 = entity.get_threat(false):get_origin().z;
            else
                v193 = 999;
            end;
            v185 = voyager_menu.antiaim.safehead:get(2) and v166(v196, v195) and is_crouching(v196) and v186 == "weapon_taser" or voyager_menu.antiaim.safehead:get(1) and switch_timer and v166(v196, v195) and is_crouching(v196) and not (v186 ~= "weapon_knife") or voyager_menu.antiaim.safehead:get(3) and is_crouching(v196) and not v166(v196) and v193 < v194 - voyager_menu.antiaim.safehead.height:get();
            defensive_active = (not not v86.dt:get() or v86.hs:get()) and v36:is_active(v196).active and voyager_menu.antiaim.defensive:get() and state[condition_val].defensive:get() and not v185 and not v169(v186);
            defensive_ticks = math.abs(v36:is_active(entity.get_local_player()).tick);
            v86.pitch:override(state[condition_val].pitch:get());
            if state[condition_val].yaw:get() == "180" then
                v86.yaw:override("Backward");
            end;
            if state[condition_val].yaw:get() == "LR" then
                v86.yaw:override("Backward");
                if rage.antiaim:inverter() then
                    v184 = state[condition_val].yaw.left.value + math.random(-state[condition_val].yaw.left_random.value, state[condition_val].yaw.left_random.value);
                else
                    v184 = state[condition_val].yaw.right.value - math.random(-state[condition_val].yaw.left_random.value, state[condition_val].yaw.left_random.value);
                end;
            end;
            if state[condition_val].yaw:get() == "Sway" then
                v86.yaw:override("Backward");
                if globals.tickcount % state[condition_val].yaw.swaydelay.value == 0 then
                    v177 = not v177;
                end;
                v184 = v37.lerp("yaw_sway_not_defensive", v177 and state[condition_val].yaw.left.value or state[condition_val].yaw.right.value, state[condition_val].yaw.speed.value);
            end;
            if state[condition_val].yaw:get() == "X-Way" then
                v86.yaw:override("Backward");
                if v183 <= to_ticks(globals.realtime) then
                    v180 = v180 + 1;
                    if rage.exploit:get() == 0 and globals.choked_commands == 0 then
                        v183 = to_ticks(globals.realtime) + 2;
                    else
                        v183 = to_ticks(globals.realtime) + state[condition_val].yaw.delay:get();
                    end;
                    if v180 > state[condition_val].yaw.xways.value then
                        v180 = 1;
                    end;
                end;
                v184 = -state[condition_val].yaw.xoffset.value / 2 + state[condition_val].yaw.xoffset.value / (state[condition_val].yaw.xways.value / v180);
            end;
            v86.yaw_base:override(state[condition_val].yaw.base:get());
            if state[condition_val].defensive.pitch.value == "Custom" then
                v192 = state[condition_val].defensive.pitch_offset1.value;
            end;
            if state[condition_val].defensive.pitch.value == "Random" then
                v192 = math.random(-state[condition_val].defensive.pitch_offset1.value, state[condition_val].defensive.pitch_offset1.value);
            end;
            if state[condition_val].defensive.pitch.value == "Jitter" then
                if globals.tickcount % state[condition_val].defensive.pitch_jitter_delay.value == 0 then
                    pitch_jitter = not pitch_jitter;
                end;
                v192 = pitch_jitter and state[condition_val].defensive.pitch_offset1.value or state[condition_val].defensive.pitch_offset2.value;
            end;
            if state[condition_val].defensive.pitch.value == "Sway" then
                v192 = v37.lerp("pitch_sway", v178 and state[condition_val].defensive.pitch_offset1.value or -state[condition_val].defensive.pitch_offset1.value, 6);
            end;
            if state[condition_val].defensive.pitch.value == "X-Way" and globals.tickcount % 2 == 0 then
                v175 = v175 + 1;
                if v175 > state[condition_val].defensive.ways.value then
                    v175 = 1;
                end;
                defensive_pitch_table = {};
                defensive_pitch_table[1] = state[condition_val].defensive.pitch_offset1.value;
                defensive_pitch_table[2] = state[condition_val].defensive.pitch_offset2.value;
                defensive_pitch_table[3] = state[condition_val].defensive.pitch_offset3.value;
                defensive_pitch_table[4] = state[condition_val].defensive.pitch_offset4.value;
                defensive_pitch_table[5] = state[condition_val].defensive.pitch_offset5.value;
                defensive_pitch_table[6] = state[condition_val].defensive.pitch_offset6.value;
                v192 = defensive_pitch_table[math.abs(v175)];
            end;
            if state[condition_val].defensive.yaw.value == "Jitter" then
                if state[condition_val].defensive.delay.value == 16 then
                    if defensive_active then
                        if v170 then
                            v188 = not v188;
                            v170 = false;
                        end;
                    else
                        v170 = true;
                    end;
                elseif v190 <= to_ticks(globals.realtime) then
                    v188 = not v188;
                    v190 = to_ticks(globals.realtime) + state[condition_val].defensive.delay.value;
                end;
                if v188 then
                    v191 = state[condition_val].defensive.yaw_offset.value - v184;
                else
                    v191 = -state[condition_val].defensive.yaw_offset.value + v184;
                end;
            end;
            if state[condition_val].defensive.yaw.value == "Synced Jitter" then
                if rage.antiaim:inverter() then
                    v191 = state[condition_val].defensive.yaw_offset.value - 30;
                else
                    v191 = -state[condition_val].defensive.yaw_offset.value + 30;
                end;
            end;
            if state[condition_val].defensive.yaw.value == "Custom" then
                v191 = state[condition_val].defensive.yaw_offset.value + v184;
            end;
            if globals.tickcount % 16 == 0 then
                v178 = not v178;
            end;
            if state[condition_val].defensive.yaw.value == "Sway" then
                v191 = v37.lerp("yaw_sway", v178 and state[condition_val].defensive.yaw_offset.value or -state[condition_val].defensive.yaw_offset.value, 6);
            end;
            if state[condition_val].defensive.yaw.value == "Movement" then
                v191 = math.clamp(-v195.sidemove / 7, -90, 90);
            end;
            if state[condition_val].defensive.yaw.value == "Spin" then
                if v189 > 180 then
                    v189 = -180;
                end;
                if v189 < -180 then
                    v189 = 180;
                end;
                v189 = v189 + state[condition_val].defensive.yaw_offset.value + (rage.antiaim:inverter() and -30 or 30);
                v191 = v189;
            end;
            if state[condition_val].defensive.yaw.value == "Random" then
                v191 = math.random(-state[condition_val].defensive.yaw_offset.value, state[condition_val].defensive.yaw_offset.value);
            end;
            if state[condition_val].defensive.yaw.value == "Inherit" then
                v191 = 0;
            end;
            v86.body_yaw:override(state[condition_val].desync:get());
            v86.left_limit:override(math.clamp(state[condition_val].desync.l_limit:get() + math.random(-state[condition_val].desync.l_random.value / 2, state[condition_val].desync.l_random.value / 2), 0, 60));
            v86.right_limit:override(math.clamp(state[condition_val].desync.r_limit:get() + math.random(-state[condition_val].desync.r_random.value / 2, state[condition_val].desync.r_random.value / 2), 0, 60));
            if state[condition_val].defensive:get() and voyager_menu.antiaim.defensive:get() then
                v86.lagopt:override(state[condition_val].defensive.lag_type.value);
            else
                v86.lagopt:override();
            end;
            if state[condition_val].defensive.hideshots.value and voyager_menu.antiaim.defensive:get() then
                v86.hs_gear:override("Break LC");
            else
                v86.hs_gear:override("Favor Fire Rate");
            end;
            if (state[condition_val].desync.delay.value > 2 or state[condition_val].desync.delayrandom.value > 0) and state[condition_val].desync.options:get(2) then
                v181 = state[condition_val].desync.options:get();
                for v198 = 1, #v181 do
                    if v181[v198] == "Jitter" then
                        table.remove(v181, v198);
                    end;
                end;
                v86.options:override(v181);
                if rage.exploit:get() == 0 and state[condition_val].yaw:get() == "LR" then
                    if globals.tickcount % 2 == 0 then
                        v179 = math.random(0, state[condition_val].desync.delayrandom.value);
                        v182 = not v182;
                    end;
                elseif state[condition_val].desync.delay:get() == 16 then
                    phase_table = {
                        state[condition_val].desync.phase1:get(), 
                        state[condition_val].desync.phase2:get(), 
                        state[condition_val].desync.phase3:get(), 
                        state[condition_val].desync.phase4:get(), 
                        state[condition_val].desync.phase5:get(), 
                        state[condition_val].desync.phase6:get(), 
                        state[condition_val].desync.phase7:get(), 
                        state[condition_val].desync.phase8:get()
                    };
                    if v171 <= globals.tickcount then
                        v172 = v172 + 1;
                        if v172 > state[condition_val].desync.phase_select:get() then
                            v172 = 1;
                        end;
                        v182 = not v182;
                        local l_tickcount_1 = globals.tickcount;
                        local l_clamp_0 = math.clamp;
                        local v201 = phase_table[v172] + (state[condition_val].desync.modifier:get(1) and get_velocity(v196) < ((not (condition_val ~= 5) or condition_val == 4) and 60 or 120) and math.ceil(-state[condition_val].desync.delay.value / 2) or 0);
                        local v202;
                        if state[condition_val].desync.modifier:get(2) then
                            v202 = not switch_timer and math.ceil(-state[condition_val].desync.delay.value / 2) or 0;
                        else
                            v202 = 0;
                        end;
                        v171 = l_tickcount_1 + l_clamp_0(v201 + v202, 2, 32);
                    end;
                else
                    local l_tickcount_2 = globals.tickcount;
                    local l_clamp_1 = math.clamp;
                    local v205 = state[condition_val].desync.delay.value + v179;
                    local v206 = state[condition_val].desync.modifier:get(1) and get_velocity(v196) < ((not (condition_val ~= 5) or condition_val == 4) and 60 or 120) and math.ceil(-state[condition_val].desync.delay.value / 2) or 0;
                    local v207;
                    if state[condition_val].desync.modifier:get(2) then
                        v207 = not switch_timer and math.ceil(-state[condition_val].desync.delay.value / 2) or 0;
                    else
                        v207 = 0;
                    end;
                    if l_tickcount_2 % l_clamp_1(v205 + (v206 + v207), 2, 32) == 0 then
                        v179 = math.random(0, state[condition_val].desync.delayrandom.value);
                        v182 = not v182;
                    end;
                end;
                rage.antiaim:inverter(v182);
            else
                v86.options:override(state[condition_val].desync.options:get());
            end;
            v86.freestanding_desync:override(state[condition_val].desync.freestand:get());
            if state[condition_val].defensive:get() and voyager_menu.antiaim.defensive:get() then
                v86.lagopt:override(state[condition_val].defensive.lag_type:get());
            else
                v86.lagopt:override();
            end;
            v86.yaw_hidden:override(state[condition_val].defensive:get() and voyager_menu.antiaim.defensive:get() and state[condition_val].defensive.defensive_antiaim:get());
            v86.yaw_offset:override((not (state[condition_val].yaw:get() ~= "LR" and state[condition_val].yaw:get() ~= "X-Way") or state[condition_val].yaw:get() == "Sway") and math.clamp(v184, -180, 180) + (state[condition_val].desync.compensate:get() and (rage.antiaim:inverter() and -rage.antiaim:get_max_desync() / 3.5 or rage.antiaim:get_max_desync() / 3.5) or 0) or math.clamp(state[condition_val].yaw.offset:get() + math.random(-state[condition_val].yaw.randomize:get() / 2, state[condition_val].yaw.randomize:get() / 2), -180, 180) + (state[condition_val].desync.compensate:get() and (rage.antiaim:inverter() and -rage.antiaim:get_max_desync() / 3.5 or rage.antiaim:get_max_desync() / 3.5) or 0));
            v86.yaw_avoid_backstab:override(voyager_menu.antiaim.backstab:get());
            v86.yaw_mod:override(state[condition_val].yaw_mod:get());
            v86.yaw_mod_offset:override(math.clamp(state[condition_val].yaw_mod.offset:get() + math.random(-state[condition_val].yaw_mod.randomization:get() / 2, state[condition_val].yaw_mod.randomization:get() / 2), -180, 180));
            if v185 then
                v86.yaw_offset:override(0);
                v86.yaw_mod_offset:override(0);
                rage.antiaim:inverter(false);
                v86.options:override("Anti Bruteforce");
                v86.left_limit:override(0);
                v86.right_limit:override(0);
                if voyager_menu.antiaim.safehead.defensive:get() then
                    v86.lagopt:override("Always On");
                    v86.hs_gear:override("Break LC");
                else
                    v86.lagopt:override("On Peek");
                    v86.hs_gear:override("Favor Fire Rate");
                end;
                rage.antiaim:override_hidden_pitch(voyager_menu.antiaim.safehead.pitch:get());
                rage.antiaim:override_hidden_yaw_offset(180);
            end;
            if voyager_menu.antiaim.manuals:get() ~= "None" and voyager_menu.antiaim.manuals_tog:get() then
                v86.freestanding:override(false);
                v86.pitch:override(state[condition_val].pitch:get());
                if voyager_menu.antiaim.manuals_static:get() then
                    v86.yaw_hidden:override(false);
                    v86.lagopt:override();
                    v86.hs_gear:override();
                    v86.yaw_mod:override("Disabled");
                    rage.antiaim:inverter(false);
                    v184 = 0;
                end;
                v86.yaw:override("Backward");
                v86.yaw_base:override("Local View");
                if voyager_menu.antiaim.manuals:get() == "Left" then
                    v86.yaw_offset:override(-90 + v184);
                end;
                if voyager_menu.antiaim.manuals:get() == "Right" then
                    v86.yaw_offset:override(90 + v184);
                end;
                if voyager_menu.antiaim.manuals:get() == "Backwards" then
                    v86.yaw_offset:override(0 + v184);
                end;
                if voyager_menu.antiaim.manuals:get() == "Forwards" then
                    v86.yaw_offset:override(180 + v184);
                end;
            end;
            if voyager_menu.antiaim.bait_aa:get() and (voyager_menu.antiaim.bait_aa.condition:get(1) and v86.freestanding:get() and rage.antiaim:get_target(true) or voyager_menu.antiaim.bait_aa.condition:get(2) and voyager_menu.antiaim.manuals:get() ~= "None" and v86.dt:get()) then
                v86.yaw_hidden:override(true);
                if voyager_menu.antiaim.bait_aa.trigger:get() ~= "Don't Override" then
                    v86.lagopt:override(voyager_menu.antiaim.bait_aa.trigger:get());
                end;
                v191 = 180;
                v192 = voyager_menu.antiaim.bait_aa.pitch.value;
            end;
            if voyager_menu.misc.nade_fix:get() and v169(v186) then
                v86.lagopt:override("Disabled");
                v86.hs_gear:override("Favor Fire Rate");
                v86.dt_quickswitch:override(false);
            end;
            rage.antiaim:override_hidden_pitch(v192);
            rage.antiaim:override_hidden_yaw_offset(v191);
            return;
        end;
    end;
end;
local v208 = 0;
local v209 = 1;
local _ = 1;
conditions_func = function(v211)
    -- upvalues: v208 (ref), v209 (ref)
    if condition_val == nil then
        condition_val = 1;
    end;
    if entity.get_local_player() == nil then
        return;
    else
        local v212 = v211.in_moveright or v211.in_moveleft or v211.in_forward or v211.in_back;
        if voyager_menu.antiaim.smoothen_state:get() then
            if reset_smooth then
                v208 = 0;
                condition_val = v209;
                reset_smooth = false;
            end;
            if v208 > voyager_menu.antiaim.smooth_amount:get() then
                condition_val = v209;
                v208 = 0;
            end;
            v208 = v208 + 1;
            if v211.in_speed and not v211.in_jump then
                v209 = 4;
            elseif v211.in_jump and not v211.in_speed and not v211.in_duck then
                v209 = 6;
            elseif v211.in_jump and v211.in_duck then
                v209 = 7;
            elseif v212 and not v211.in_speed and not v211.in_duck then
                v209 = 3;
            elseif not v212 and not v211.in_speed and not v211.in_duck then
                v209 = 2;
            elseif v211.in_duck and not v211.in_speed and not v211.in_jump then
                v209 = 5;
            end;
            if state[v209].override ~= nil and not state[v209].override:get() then
                v209 = 1;
            end;
        else
            reset_smooth = true;
            if v211.in_speed and not v211.in_jump then
                condition_val = 4;
            elseif v211.in_jump and not v211.in_speed and not v211.in_duck then
                condition_val = 6;
            elseif v211.in_jump and v211.in_duck then
                condition_val = 7;
            elseif v212 and not v211.in_speed and not v211.in_duck then
                condition_val = 3;
            elseif not v212 and not v211.in_speed and not v211.in_duck then
                condition_val = 2;
            elseif v211.in_duck and not v211.in_speed and not v211.in_jump then
                condition_val = 5;
            end;
            if state[condition_val].override ~= nil and not state[condition_val].override:get() then
                condition_val = 1;
            end;
        end;
        return;
    end;
end;
conditionconverter = function()
    if voyager_menu.antiaim.condition:get() == "Global" then
        converted_condition = 1;
    elseif voyager_menu.antiaim.condition:get() == "Standing" then
        converted_condition = 2;
    elseif voyager_menu.antiaim.condition:get() == "Running" then
        converted_condition = 3;
    elseif voyager_menu.antiaim.condition:get() == "Slowwalk" then
        converted_condition = 4;
    elseif voyager_menu.antiaim.condition:get() == "Crouching" then
        converted_condition = 5;
    elseif voyager_menu.antiaim.condition:get() == "Air" then
        converted_condition = 6;
    elseif voyager_menu.antiaim.condition:get() == "Air+C" then
        converted_condition = 7;
    end;
end;
menu_vis = function()
    -- upvalues: v137 (ref)
    menuvars.visuals.main:visibility(voyager_menu.selection:get() == 1);
    menuvars.visuals.secondary:visibility(voyager_menu.selection:get() == 1);
    menuvars.misc.main:visibility(voyager_menu.selection:get() == 2);
    menuvars.misc.secondary:visibility(voyager_menu.selection:get() == 2);
    configsys.button_code:visibility(configsys.selection:get() == 1);
    configsys.button_join:visibility(configsys.selection:get() == 1);
    configsys.logo:visibility(configsys.selection:get() == 1);
    configsys.madeby:visibility(configsys.selection:get() == 1);
    configsys.normal.cfg_list:visibility(configsys.selection:get() == 2);
    configsys.normal.export_menu:visibility(configsys.selection:get() == 2);
    configsys.normal.import_menu:visibility(configsys.selection:get() == 2);
    configsys.normal.save:visibility(configsys.selection:get() == 2);
    configsys.normal.load:visibility(configsys.selection:get() == 2);
    configsys.normal.delete:visibility(configsys.selection:get() == 2);
    configsys.normal.cfg_name:visibility(configsys.selection:get() == 2);
    configsys.cloud.list:visibility(configsys.selection:get() == 3);
    configsys.cloud.info1:visibility(configsys.selection:get() == 3 and cfglist ~= nil);
    configsys.cloud.info2:visibility(configsys.selection:get() == 3 and cfglist ~= nil);
    configsys.cloud.getcfg:visibility(configsys.selection:get() == 3 and cfglist ~= nil);
    configsys.cloud.reload:visibility(configsys.selection:get() == 3 and cfglist ~= nil);
    configsys.cloud.input:visibility(configsys.selection:get() == 3 and v137 == false);
    configsys.cloud.label:visibility(configsys.selection:get() == 3 and v137 == true);
    configsys.cloud.create:visibility(configsys.selection:get() == 3 and v137 == false);
    configsys.cloud.delete:visibility(configsys.selection:get() == 3 and v137 == true);
    configsys.cloud.update:visibility(configsys.selection:get() == 3 and v137 == true);
    voyager_menu.visuals.indicators_tog.ind:visibility(voyager_menu.visuals.indicators:get(1));
    voyager_menu.visuals.hitlog_settings:visibility(voyager_menu.visuals.indicators:get(3));
    voyager_menu.visuals.hitlog_settings.settings:visibility(voyager_menu.visuals.hitlog_settings.style:get() == "Customizable");
    voyager_menu.visuals.hitlog_settings.include_undermin:visibility(voyager_menu.visuals.hitlog_settings.style:get() == "Customizable");
    voyager_menu.visuals.hitlog_settings.color_undermin:visibility(voyager_menu.visuals.hitlog_settings.style:get() == "Customizable" and voyager_menu.visuals.hitlog_settings.include_undermin:get());
    voyager_menu.visuals.hitmarker_settings:visibility(voyager_menu.visuals.indicators:get(4));
    voyager_menu.visuals.dragable.keyx:visibility(false);
    voyager_menu.visuals.dragable.keyy:visibility(false);
    voyager_menu.visuals.dragable.specx:visibility(false);
    voyager_menu.visuals.dragable.specy:visibility(false);
    voyager_menu.visuals.dragable.defx:visibility(false);
    voyager_menu.visuals.dragable.defy:visibility(false);
    voyager_menu.visuals.dragable.slowx:visibility(false);
    voyager_menu.visuals.dragable.slowy:visibility(false);
    voyager_menu.visuals.dragable.baitx:visibility(false);
    voyager_menu.visuals.dragable.baity:visibility(false);
    menuvars.antiaim.stategroup:visibility(voyager_menu.antiaim.builder:get());
    menuvars.antiaim.builder:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.visuals.widgets:visibility(voyager_menu.visuals.widgets_tog:get());
    voyager_menu.visuals.indicators:visibility(voyager_menu.visuals.indicators_tog:get());
    voyager_menu.visuals.indicators_tog.color:visibility(voyager_menu.visuals.indicators:get(1));
    voyager_menu.antiaim.manuals:visibility(voyager_menu.antiaim.manuals_tog:get() and voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.manuals_arrows:visibility(voyager_menu.antiaim.manuals_tog:get() and voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.manuals_static:visibility(voyager_menu.antiaim.manuals_tog:get() and voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.defensive:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.bait_aa:visibility(voyager_menu.antiaim.builder:get() and voyager_menu.antiaim.defensive:get());
    voyager_menu.antiaim.onshot_fl:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.smoothen_state:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.backstab:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.safehead:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.safehead.pitch:visibility(voyager_menu.antiaim.safehead.defensive:get());
    voyager_menu.antiaim.manuals_tog:visibility(voyager_menu.antiaim.builder:get());
    voyager_menu.antiaim.smooth_amount:visibility(voyager_menu.antiaim.builder:get() and voyager_menu.antiaim.smoothen_state:get());
    voyager_menu.misc.inairhc.ssg:visibility(voyager_menu.misc.inairhc:get(1));
    voyager_menu.misc.inairhc.auto:visibility(voyager_menu.misc.inairhc:get(2));
    voyager_menu.misc.inairhc.awp:visibility(voyager_menu.misc.inairhc:get(3));
    voyager_menu.misc.aspect_ratio:visibility(voyager_menu.misc.aspect_ratio_tog:get());
    voyager_menu.visuals.anims:visibility(voyager_menu.visuals.anims_tog:get());
    voyager_menu.misc.pingspike:visibility(voyager_menu.misc.pingspike_tog:get());
    voyager_menu.misc.pingpike_warning:visibility(voyager_menu.misc.pingspike_tog:get() and voyager_menu.misc.pingspike:get() > 200);
    for v213 = 1, 7 do
        if v213 ~= 1 then
            state[v213].override:visibility(converted_condition == v213);
            state[v213].pitch:visibility(converted_condition == v213 and state[v213].override:get());
            state[v213].yaw:visibility(converted_condition == v213 and state[v213].override:get());
            state[v213].yaw_mod:visibility(converted_condition == v213 and state[v213].override:get());
            state[v213].desync:visibility(converted_condition == v213 and state[v213].override:get());
            state[v213].desync.delay:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2));
            state[v213].desync.delayrandom:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() ~= 16);
            state[v213].desync.phase_select:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase1:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase2:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase3:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 2);
            state[v213].desync.phase4:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 3);
            state[v213].desync.phase5:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 4);
            state[v213].desync.phase6:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 5);
            state[v213].desync.phase7:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 6);
            state[v213].desync.phase8:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 7);
            state[v213].desync.modifier:visibility(state[v213].desync.options:get(2));
            state[v213].yaw.offset:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "180");
            state[v213].yaw.randomize:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "180");
            state[v213].yaw.left:visibility(converted_condition == v213 and state[v213].override:get() and (not (state[v213].yaw:get() ~= "LR") or state[v213].yaw:get() == "Sway"));
            state[v213].yaw.right:visibility(converted_condition == v213 and state[v213].override:get() and (not (state[v213].yaw:get() ~= "LR") or state[v213].yaw:get() == "Sway"));
            state[v213].yaw.left_random:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "LR");
            state[v213].yaw.right_random:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "LR");
            state[v213].yaw.delay:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "X-Way");
            state[v213].yaw.swaydelay:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "Sway");
            state[v213].yaw.speed:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "Sway");
            state[v213].defensive:visibility(converted_condition == v213 and state[v213].override:get() and voyager_menu.antiaim.defensive:get());
            state[v213].defensive.yaw:visibility(state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch:visibility(state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.delay:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.yaw.value == "Jitter" and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.ways:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.yaw_offset:visibility(converted_condition == v213 and state[v213].override:get() and (not (state[v213].defensive.yaw.value == "Inherit") or state[v213].defensive.yaw.value ~= "Movement") and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_jitter_delay:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "Jitter" and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset1:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value ~= "Movement" and state[v213].defensive.pitch.value ~= "Inherit" and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset2:visibility(converted_condition == v213 and state[v213].override:get() and not (state[v213].defensive.pitch.value ~= "Jitter") or state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset3:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 3 and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset4:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 4 and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset5:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 5 and state[v213].defensive.defensive_antiaim:get());
            state[v213].defensive.pitch_offset6:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 6 and state[v213].defensive.defensive_antiaim:get());
            state[v213].yaw.xways:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "X-Way");
            state[v213].yaw.xoffset:visibility(converted_condition == v213 and state[v213].override:get() and state[v213].yaw:get() == "X-Way");
        else
            state[v213].placeholder:visibility(converted_condition == v213);
            state[v213].pitch:visibility(converted_condition == v213);
            state[v213].yaw:visibility(converted_condition == v213);
            state[v213].yaw_mod:visibility(converted_condition == v213);
            state[v213].desync:visibility(converted_condition == v213);
            state[v213].desync.delay:visibility(converted_condition == v213 and state[v213].desync.options:get(2));
            state[v213].desync.delayrandom:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() ~= 16);
            state[v213].desync.phase_select:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase1:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase2:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16);
            state[v213].desync.phase3:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 2);
            state[v213].desync.phase4:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 3);
            state[v213].desync.phase5:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 4);
            state[v213].desync.phase6:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 5);
            state[v213].desync.phase7:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 6);
            state[v213].desync.phase8:visibility(converted_condition == v213 and state[v213].desync.options:get(2) and state[v213].desync.delay:get() == 16 and state[v213].desync.phase_select:get() > 7);
            state[v213].desync.modifier:visibility(state[v213].desync.options:get(2));
            state[v213].yaw.offset:visibility(converted_condition == v213 and state[v213].yaw:get() == "180");
            state[v213].yaw.randomize:visibility(converted_condition == v213 and state[v213].yaw:get() == "180");
            state[v213].yaw.left:visibility(converted_condition == v213 and (not (state[v213].yaw:get() ~= "LR") or state[v213].yaw:get() == "Sway"));
            state[v213].yaw.right:visibility(converted_condition == v213 and (not (state[v213].yaw:get() ~= "LR") or state[v213].yaw:get() == "Sway"));
            state[v213].yaw.left_random:visibility(converted_condition == v213 and state[v213].yaw:get() == "LR");
            state[v213].yaw.right_random:visibility(converted_condition == v213 and state[v213].yaw:get() == "LR");
            state[v213].yaw.delay:visibility(converted_condition == v213 and state[v213].yaw:get() == "X-Way");
            state[v213].yaw.swaydelay:visibility(converted_condition == v213 and state[v213].yaw:get() == "Sway");
            state[v213].yaw.speed:visibility(converted_condition == v213 and state[v213].yaw:get() == "Sway");
            state[v213].defensive:visibility(converted_condition == v213 and voyager_menu.antiaim.defensive:get());
            state[v213].defensive.delay:visibility(converted_condition == v213 and state[v213].defensive.yaw.value == "Jitter");
            state[v213].defensive.ways:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "X-Way");
            state[v213].defensive.yaw_offset:visibility(converted_condition == v213 and (not (state[v213].defensive.yaw.value == "Inherit") or state[v213].defensive.yaw.value ~= "Movement"));
            state[v213].defensive.pitch_jitter_delay:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "Jitter");
            state[v213].defensive.pitch_offset1:visibility(converted_condition == v213 and state[v213].defensive.pitch.value ~= "Movement" and state[v213].defensive.pitch.value ~= "Inherit");
            state[v213].defensive.pitch_offset2:visibility(converted_condition == v213 and not (state[v213].defensive.pitch.value ~= "Jitter") or state[v213].defensive.pitch.value == "X-Way");
            state[v213].defensive.pitch_offset3:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 3);
            state[v213].defensive.pitch_offset4:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 4);
            state[v213].defensive.pitch_offset5:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 5);
            state[v213].defensive.pitch_offset6:visibility(converted_condition == v213 and state[v213].defensive.pitch.value == "X-Way" and state[v213].defensive.ways.value >= 6);
            state[v213].yaw.xways:visibility(converted_condition == v213 and state[v213].yaw:get() == "X-Way");
            state[v213].yaw.xoffset:visibility(converted_condition == v213 and state[v213].yaw:get() == "X-Way");
        end;
    end;
end;
local v214 = false;
local v215 = false;
local v216 = false;
local v217 = false;
local _ = 0;
local _ = 0;
local v220 = 0;
local v221 = false;
local function v233()
    -- upvalues: v4 (ref), l_r_0 (ref), l_g_0 (ref), l_b_0 (ref), v216 (ref), v37 (ref), v214 (ref), v215 (ref), v2 (ref), v85 (ref), v221 (ref), v84 (ref), v3 (ref), v86 (ref)
    local v222 = entity.get_local_player();
    v4 = ui.get_style("Link Active");
    local l_r_1 = ui.get_style("Link Active").r;
    local l_g_1 = ui.get_style("Link Active").g;
    l_b_0 = ui.get_style("Link Active").b;
    l_g_0 = l_g_1;
    l_r_0 = l_r_1;
    if v216 == true then
        v37.lerp("startup_Animation1", 200, 3);
    end;
    if v214 == true then
        v37.lerp("startup_Animation2", 255, 4);
    end;
    if v215 == true then
        v37.lerp("startup_Animation2", 0, 7);
        v37.lerp("startup_Animation1", 0, 7);
    end;
    render.rect(vector(0, 0), vector(v2.x, v2.y), color(0, 0, 0, math.clamp(v37.get("startup_Animation1") or 0, -1, 255)), 0, true);
    render.texture(v85.logo_full, vector(v2.x / 2 - 500, v2.y / 2 - 125), vector(1000, 250), color(255, 255, 255, math.clamp(v37.get("startup_Animation2") or 0, 0, 255)), nil, 0);
    if not v222 then
        return;
    else
        if v222:is_alive() and voyager_menu.antiaim.builder:get() then
            if v222.m_bIsScoped then
                if voyager_menu.antiaim.manuals_arrows.show_scoped:get() == "Hide" then
                    v221 = 1;
                elseif voyager_menu.antiaim.manuals_arrows.show_scoped:get() == "Move" then
                    v221 = 2;
                else
                    v221 = 0;
                end;
            else
                v221 = 0;
            end;
            if voyager_menu.antiaim.manuals_tog:get() and voyager_menu.antiaim.manuals_arrows:get() then
                l_r_1 = voyager_menu.antiaim.manuals_arrows.color_inactive:get();
                l_g_1 = l_r_1.r;
                local l_g_2 = l_r_1.g;
                local l_b_1 = l_r_1.b;
                local l_a_0 = l_r_1.a;
                local v228 = voyager_menu.antiaim.manuals_arrows.color_active:get();
                local l_r_2 = v228.r;
                local l_g_3 = v228.g;
                local l_b_2 = v228.b;
                local l_a_1 = v228.a;
                offset = voyager_menu.antiaim.manuals_arrows.offset:get();
                offsetleft = render.measure_text(v84.arrow, "A", "X");
                offsetright = render.measure_text(v84.arrow, "A", "Z");
                offsetdown = render.measure_text(v84.arrow, "A", "Y");
                offsetup = render.measure_text(v84.arrow, "A", "V");
                if v221 == 2 then
                    v37.lerp("scopemove", 20 * v3, 15 * v3);
                else
                    v37.lerp("scopemove", 0, 15 * v3);
                end;
                if voyager_menu.antiaim.manuals_arrows.arrows:get(1) and v221 ~= 1 then
                    v37.lerp("iarrowLalpha", 1, 20);
                else
                    v37.lerp("iarrowLalpha", 0, 20);
                end;
                if voyager_menu.antiaim.manuals_arrows.arrows:get(2) and v221 ~= 1 then
                    v37.lerp("iarrowRalpha", 1, 20);
                else
                    v37.lerp("iarrowRalpha", 0, 20);
                end;
                if voyager_menu.antiaim.manuals_arrows.arrows:get(3) and v221 ~= 1 then
                    v37.lerp("iarrowBalpha", 1, 20);
                else
                    v37.lerp("iarrowBalpha", 0, 20);
                end;
                if voyager_menu.antiaim.manuals_arrows.arrows:get(4) and v221 ~= 1 then
                    v37.lerp("iarrowFalpha", 1, 20);
                else
                    v37.lerp("iarrowFalpha", 0, 20);
                end;
                render.text(v84.arrow, vector(v2.x / 2 - (offset + offsetleft.x + 50 * v3), v2.y / 2 - 11 * v3 + v37.get("scopemove")), color(l_g_1, l_g_2, l_b_1, l_a_0 * v37.get("iarrowLalpha")), "A", "X");
                render.text(v84.arrow, vector(v2.x / 2 + (offset + 52 * v3), v2.y / 2 - 11 * v3 + v37.get("scopemove")), color(l_g_1, l_g_2, l_b_1, l_a_0 * v37.get("iarrowRalpha")), "A", "Z");
                render.text(v84.arrow, vector(v2.x / 2 - offsetdown.x / 2, v2.y / 2 + (offset + 52 * v3)), color(l_g_1, l_g_2, l_b_1, l_a_0 * v37.get("iarrowBalpha")), "A", "Y");
                render.text(v84.arrow, vector(v2.x / 2 - offsetdown.x / 2, v2.y / 2 - (offsetup.y / 1.4 + offset + 52 * v3)), color(l_g_1, l_g_2, l_b_1, l_a_0 * v37.get("iarrowFalpha")), "A", "W");
                if voyager_menu.antiaim.manuals_arrows:get() then
                    if v37.get("arrowLalpha") == false then
                        v37.new("arrowLalpha", 0);
                    end;
                    if v37.get("arrowRalpha") == false then
                        v37.new("arrowRalpha", 0);
                    end;
                    if v37.get("arrowBalpha") == false then
                        v37.new("arrowBalpha", 0);
                    end;
                    if v37.get("arrowFalpha") == false then
                        v37.new("arrowFalpha", 0);
                    end;
                    if voyager_menu.antiaim.manuals:get() == "Left" and voyager_menu.antiaim.manuals_arrows.arrows:get(1) and v221 ~= 1 then
                        v37.lerp("arrowLalpha", 1, 30);
                    else
                        v37.lerp("arrowLalpha", 0, 30);
                    end;
                    if voyager_menu.antiaim.manuals:get() == "Right" and voyager_menu.antiaim.manuals_arrows.arrows:get(2) and v221 ~= 1 then
                        v37.lerp("arrowRalpha", 1, 30);
                    else
                        v37.lerp("arrowRalpha", 0, 30);
                    end;
                    if voyager_menu.antiaim.manuals:get() == "Backwards" and voyager_menu.antiaim.manuals_arrows.arrows:get(3) and v221 ~= 1 then
                        v37.lerp("arrowBalpha", 1, 30);
                    else
                        v37.lerp("arrowBalpha", 0, 30);
                    end;
                    if voyager_menu.antiaim.manuals:get() == "Forwards" and voyager_menu.antiaim.manuals_arrows.arrows:get(4) and v221 ~= 1 then
                        v37.lerp("arrowFalpha", 1, 30);
                    else
                        v37.lerp("arrowFalpha", 0, 30);
                    end;
                    render.text(v84.arrow, vector(v2.x / 2 - (offset + offsetleft.x + 50 * v3), v2.y / 2 - 11 * v3 + v37.get("scopemove")), color(l_r_2, l_g_3, l_b_2, l_a_1 * v37.get("arrowLalpha")), "A", "X");
                    render.text(v84.arrow, vector(v2.x / 2 + (offset + 52 * v3), v2.y / 2 - 11 * v3 + v37.get("scopemove")), color(l_r_2, l_g_3, l_b_2, l_a_1 * v37.get("arrowRalpha")), "A", "Z");
                    render.text(v84.arrow, vector(v2.x / 2 - offsetdown.x / 2, v2.y / 2 + (offset + 52 * v3)), color(l_r_2, l_g_3, l_b_2, l_a_1 * v37.get("arrowBalpha")), "A", "Y");
                    render.text(v84.arrow, vector(v2.x / 2 - offsetdown.x / 2, v2.y / 2 - (offsetup.y / 1.4 + offset + 52 * v3)), color(l_r_2, l_g_3, l_b_2, l_a_1 * v37.get("arrowFalpha")), "A", "W");
                end;
            end;
        end;
        if v222 and voyager_menu.visuals.custom_scope:get() then
            l_r_1 = 0;
            l_g_1 = 0;
            if v37.get("c_scope_anim") == false then
                v37.new("c_scope_anim", 0);
            end;
            if v37.get("c_scope_alpha") == false then
                v37.new("c_scope_alpha", 0);
            end;
            if v222.m_bIsScoped then
                v86.scope_zoom:override("Remove All");
                if voyager_menu.visuals.custom_scope.animation:get() == "None" then
                    l_r_1 = 1;
                    l_g_1 = 1;
                elseif voyager_menu.visuals.custom_scope.animation:get() == "Opacity" then
                    l_r_1 = 1;
                    l_g_1 = v37.lerp("c_scope_alpha", 1, 25);
                else
                    l_r_1 = v37.lerp("c_scope_anim", 1, 10);
                    l_g_1 = v37.lerp("c_scope_alpha", 1, 25);
                end;
            elseif voyager_menu.visuals.custom_scope.animation:get() == "None" then
                l_r_1 = 0;
                l_g_1 = 1;
            elseif voyager_menu.visuals.custom_scope.animation:get() == "Opacity" then
                l_r_1 = 1;
                l_g_1 = v37.lerp("c_scope_alpha", 0, 25);
            elseif voyager_menu.visuals.custom_scope.animation:get() == "Move" then
                l_r_1 = v37.lerp("c_scope_anim", 0, 10);
                l_g_1 = v37.lerp("c_scope_alpha", 0, 25);
            else
                l_r_1 = v37.lerp("c_scope_anim", 2, 10);
                l_g_1 = v37.lerp("c_scope_alpha", 0, 25);
            end;
            length = math.floor(voyager_menu.visuals.custom_scope.length.value * 10 * l_r_1 * v3);
            offset = math.floor(voyager_menu.visuals.custom_scope.offset.value * 10 * l_r_1 * v3);
            if voyager_menu.visuals.custom_scope.invert:get() then
                color_out = color(voyager_menu.visuals.custom_scope.color:get().r, voyager_menu.visuals.custom_scope.color:get().g, voyager_menu.visuals.custom_scope.color:get().b, math.clamp(l_g_1 * 400, 0, 255));
                color_in = color(voyager_menu.visuals.custom_scope.color:get().r, voyager_menu.visuals.custom_scope.color:get().g, voyager_menu.visuals.custom_scope.color:get().b, 0);
            else
                color_out = color(voyager_menu.visuals.custom_scope.color:get().r, voyager_menu.visuals.custom_scope.color:get().g, voyager_menu.visuals.custom_scope.color:get().b, 0);
                color_in = color(voyager_menu.visuals.custom_scope.color:get().r, voyager_menu.visuals.custom_scope.color:get().g, voyager_menu.visuals.custom_scope.color:get().b, math.clamp(l_g_1 * 400, 0, 255));
            end;
            render.gradient(vector(v2.x / 2 + offset, v2.y / 2), vector(v2.x / 2 + offset + length, v2.y / 2 + 1), color_in, color_out, color_in, color_out, 0);
            render.gradient(vector(v2.x / 2 - offset, v2.y / 2), vector(v2.x / 2 - offset - length, v2.y / 2 + 1), color_in, color_out, color_in, color_out, 0);
            if not voyager_menu.visuals.custom_scope.tstyle.ref:get() then
                render.gradient(vector(v2.x / 2, v2.y / 2 - offset), vector(v2.x / 2 + 1, v2.y / 2 - offset - length), color_in, color_in, color_out, color_out, 0);
            end;
            render.gradient(vector(v2.x / 2, v2.y / 2 + offset), vector(v2.x / 2 + 1, v2.y / 2 + offset + length), color_in, color_in, color_out, color_out, 0);
        end;
        return;
    end;
end;
local function v234()
    -- upvalues: v37 (ref), v86 (ref), v2 (ref), v3 (ref)
    if voyager_menu.visuals.indicators:get(2) then
        v37.lerp("mindmg", v86.md:get(), 8);
        if v37.get("mindmg") >= v86.md:get() then
            md_lerp = math.floor(v37.get("mindmg"));
        else
            md_lerp = math.ceil(v37.get("mindmg"));
        end;
        render.text(1, vector(v2.x / 2 + 7 * v3, v2.y / 2 - 16 * v3), color(255), "d l s", md_lerp > 100 and "hp+" .. (tonumber(tostring(md_lerp):sub(2):sub(1, 1)) ~= 0 and tostring(md_lerp):sub(2) or tostring(md_lerp):sub(3)) or tostring(md_lerp));
    end;
end;
local function v242()
    -- upvalues: v37 (ref), v3 (ref), l_gradient_0 (ref), v86 (ref), v2 (ref)
    local v235 = entity.get_local_player().m_bIsScoped and v37.lerp("scope_off", 100, 15) or v37.lerp("scope_off", 0, 15);
    local v236 = math.floor(v235) / 100;
    local l_r_3 = voyager_menu.visuals.indicators_tog.color.value.r;
    local l_g_4 = voyager_menu.visuals.indicators_tog.color.value.g;
    local l_b_3 = voyager_menu.visuals.indicators_tog.color.value.b;
    local v240 = 17 * v3;
    local v241 = rage.exploit:get() > 0 and v37.lerp("colorind", 1, 10) or v37.lerp("colorind", 0, 10);
    gradient_text = l_gradient_0.text_animate("voyager", -1, {
        color(255, 255, 255, 150), 
        color(l_r_3, l_g_4, l_b_3)
    });
    gradient_text:animate();
    ind_gradient = gradient_text:get_animated_text();
    dt_measure = render.measure_text(1, "a c d s", "doubletap");
    hs_measure = render.measure_text(1, "a c d s", "hideshots");
    fs_measure = render.measure_text(1, "a c d s", "freestand");
    safe_measure = render.measure_text(1, "a c d s", "safe");
    baim_measure = render.measure_text(1, "a c d s", "baim");
    if voyager_menu.visuals.indicators_tog.ind.ref:get(1) and v86.dt:get() then
        v37.lerp("dtoff", 1 * v3, 15);
    else
        v37.lerp("dtoff", 0, 15);
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(2) and v86.hs:get() then
        v37.lerp("hsoff", 1 * v3, 15);
    else
        v37.lerp("hsoff", 0, 15);
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(3) and v86.freestanding:get() then
        v37.lerp("fsoff", 1 * v3, 15);
    else
        v37.lerp("fsoff", 0, 15);
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(4) and v86.fb:get() ~= "Default" then
        v37.lerp("baimoff", 1 * v3, 15);
    else
        v37.lerp("baimoff", 0, 15);
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(5) and v86.safepoint:get() ~= "Default" then
        v37.lerp("safeoff", 1 * v3, 15);
    else
        v37.lerp("safeoff", 0, 15);
    end;
    render.text(4, vector(v2.x / 2 + v236 * (31 * v3), v2.y / 2 + v240), color(255), "c s", ind_gradient);
    if voyager_menu.visuals.indicators_tog.ind.ref:get(1) then
        render.push_clip_rect(vector(v2.x / 2 + v236 * (34 * v3) - dt_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - dt_measure.y / 1.5), vector(v2.x / 2 + v236 * (34 * v3) - dt_measure.x / 2 + v37.get("dtoff") * dt_measure.x, v2.y / 2 + v240 + 12 * v3 + dt_measure.y / 1.5), false);
        render.text(1, vector(v2.x / 2 + v236 * (34 * v3), v2.y / 2 + v240 + 11 * v3), color(255 - (255 - l_r_3), v241 * l_g_4, v241 * l_b_3, 255), "a c d s", "doubletap");
        render.pop_clip_rect();
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(2) then
        render.push_clip_rect(vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - hs_measure.y / 1.5 + v37.get("dtoff") * 10), vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 2 + v37.get("hsoff") * hs_measure.x, v2.y / 2 + v240 + 12 * v3 + hs_measure.y / 1.5 + v37.get("dtoff") * 10), false);
        render.text(1, vector(v2.x / 2 + v236 * (34 * v3), v2.y / 2 + v240 + 11 * v3 + v37.get("dtoff") * 10), color(math.clamp(l_r_3 + 30, 0, 255), math.clamp(l_g_4 + 30, 0, 255), math.clamp(l_b_3 + 30, 0, 255)), "a c d s", "hideshots");
        render.pop_clip_rect();
        render.push_clip_rect(vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - hs_measure.y / 1.5 + v37.get("dtoff") * 10), vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 2 + v37.get("dtoff") * hs_measure.x / v3, v2.y / 2 + v240 + 12 * v3 + hs_measure.y / 1.5 + v37.get("dtoff") * 10), false);
        render.line(vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 2, v2.y / 2 + v240 + 12 * v3 + math.floor(v37.get("dtoff") * 10.4)), vector(v2.x / 2 + v236 * (34 * v3) - hs_measure.x / 2 + v37.get("hsoff") * hs_measure.x / v3, v2.y / 2 + v240 + 12 * v3 + math.floor(v37.get("dtoff") * 10.4)), color(l_r_3, l_g_4, l_b_3));
        render.pop_clip_rect();
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(3) then
        render.push_clip_rect(vector(v2.x / 2 + v236 * (34 * v3) - fs_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - fs_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10), vector(v2.x / 2 + v236 * (34 * v3) - fs_measure.x / 2 + v37.get("fsoff") * fs_measure.x, v2.y / 2 + v240 + 12 * v3 + fs_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10), false);
        render.text(1, vector(v2.x / 2 + v236 * (34 * v3), v2.y / 2 + v240 + 11 * v3 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10), color(l_r_3, l_g_4, l_b_3, 255), "a c d s", "freestand");
        render.pop_clip_rect();
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(4) then
        render.push_clip_rect(vector(v2.x / 2 + v236 * (22 * v3) - baim_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - baim_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10), vector(v2.x / 2 + v236 * (22 * v3) - baim_measure.x / 2 + v37.get("baimoff") * baim_measure.x, v2.y / 2 + v240 + 12 * v3 + baim_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10), false);
        render.text(1, vector(v2.x / 2 + v236 * (22 * v3), v2.y / 2 + v240 + 11 * v3 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10), color(l_r_3, l_g_4, l_b_3, 255), "a c d s", "baim");
        render.pop_clip_rect();
    end;
    if voyager_menu.visuals.indicators_tog.ind.ref:get(5) then
        render.push_clip_rect(vector(v2.x / 2 + v236 * (20 * v3) - safe_measure.x / 1.2, v2.y / 2 + v240 + 12 * v3 - safe_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10), vector(v2.x / 2 + v236 * (20 * v3) - safe_measure.x / 2 + v37.get("safeoff") * safe_measure.x, v2.y / 2 + v240 + 12 * v3 + safe_measure.y / 1.5 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10 + v37.get("safeoff") * 10), false);
        render.text(1, vector(v2.x / 2 + v236 * (20 * v3), v2.y / 2 + v240 + 11 * v3 + v37.get("dtoff") * 10 + v37.get("hsoff") * 10 + v37.get("fsoff") * 10 + v37.get("baimoff") * 10), color(l_r_3, l_g_4, l_b_3, 255), "a c d s", "safe");
        render.pop_clip_rect();
    end;
end;
a = 1;
clantable = {
    [1] = "\194\187", 
    [2] = "\194\187V", 
    [3] = "\194\187Vo", 
    [4] = "\194\187Voy", 
    [5] = "\194\187Voya", 
    [6] = "\194\187Voyag", 
    [7] = "\194\187Voyage", 
    [8] = "\194\187Voyager", 
    [9] = "\194\187Voyager\194\171", 
    [10] = "\194\187Voyager\194\171", 
    [11] = "\194\187Voyager\194\171", 
    [12] = "\194\187Voyager\194\171", 
    [13] = "\194\187Voyager\194\171", 
    [14] = "\194\187Voyager", 
    [15] = "\194\187Voyage", 
    [16] = "\194\187Voyag", 
    [17] = "\194\187Voya", 
    [18] = "\194\187Voy", 
    [19] = "\194\187Vo", 
    [20] = "\194\187V", 
    [21] = "\194\187"
};
round = function(v243, v244)
    local v245 = 10 ^ (v244 or 0);
    return math.floor(v243 * v245 + 0.5) / v245;
end;
local v246 = globals.tickcount + 1;
local v247 = 0;
clantag = function()
    -- upvalues: v246 (ref), v247 (ref)
    if voyager_menu.misc.clantag:get() then
        if v246 <= globals.tickcount then
            common.set_clan_tag(clantable[round(globals.curtime * 2 % #clantable + 0.5)]);
            v246 = globals.tickcount + 16;
            v247 = 1;
        end;
    elseif v247 == 1 then
        common.set_clan_tag("");
        v247 = 0;
    end;
end;
local v248 = false;
local _ = false;
local _ = false;
local v251 = 0;
misc_func = function()
    -- upvalues: v248 (ref), v251 (ref), v86 (ref)
    if voyager_menu.misc.aspect_ratio_tog:get() then
        v248 = true;
        cvar.r_aspectratio:float(voyager_menu.misc.aspect_ratio:get() / 100);
    elseif v248 == true then
        cvar.r_aspectratio:float(0);
        v248 = false;
    end;
    if voyager_menu.misc.pingspike_tog:get() then
        if fakeping_cur ~= voyager_menu.misc.pingspike:get() then
            v251 = true;
        end;
        if v251 == true then
            cvar.sv_maxunlag:float(voyager_menu.misc.pingspike:get() > 200 and 0.8 or 0.2);
            fakeping_cur = voyager_menu.misc.pingspike:get();
            v251 = false;
        end;
        v86.pingspike:override(voyager_menu.misc.pingspike:get());
    else
        v251 = true;
    end;
end;
trashtalk = {
    killsay_weapon = {
        [1] = "your KD ratio just reported you", 
        [2] = "movement so bad I thought it was part of the meme", 
        [3] = "you looked confused mid-death", 
        [4] = "nice lua, shame about the gameplay", 
        [5] = "your resolver is running on feelings", 
        [6] = "cfg so bad even resolver pitied you", 
        [7] = "you paid for that config?", 
        [8] = "Your aim is as lost as your skill.", 
        [9] = "You should refund both the cheat and the idea of playing.", 
        [10] = "Performance? More like performance anxiety.", 
        [11] = "Missing with cheats? That\226\128\153s talent.", 
        [12] = "Skill diff? Nah, brain diff.", 
        [13] = "I could play with a steering wheel and still beat you.", 
        [14] = "you\226\128\153d lose a 1v1 vs Windows Defender", 
        [15] = "your skill issue is terminal", 
        [16] = "even your cheats gave up on you", 
        [17] = "nn as expected", 
        [18] = "your config needs a priest", 
        [19] = "nice death, uninstall now", 
        [20] = "cheated to bottomfrag, impressive", 
        [21] = "aimbot sponsored by wish.com", 
        [22] = "you're not just bad, you're historically bad", 
        [23] = "seen better plays from bots", 
        [24] = "error 404: skill not found", 
        [25] = "this ain't it, chief", 
        [26] = "looks like your cheats need cheats", 
        [27] = "your paste has expired", 
        [28] = "premium retard moment", 
        [29] = "your recoil control is a war crime", 
        [30] = "your movement hurts to watch", 
        [31] = "config sponsored by braindamage", 
        [32] = "that spray pattern looked like jazz", 
        [33] = "you're the reason bots exist", 
        [34] = "get a refund for that cfg", 
        [35] = "scripted death moment", 
        [36] = "you died with style... none of it yours", 
        [37] = "cheated and still losing, talentless", 
        [38] = "Your free trial of life has expired", 
        [39] = "nice config, did your dog make it?", 
        [40] = "you play like you close your eyes", 
        [41] = "your script died before you did", 
        [42] = "skill issue detected \226\128\147 no patch available", 
        [43] = "you peaked and dropped like your fps", 
        [44] = "you\226\128\153re the reason votekicks exists", 
        [45] = "imagine pasting and still bottomfragging", 
        [46] = "you got debugged mid-round", 
        [47] = "someone uninstall his game please", 
        [48] = "nice antiaim, now try aiming back", 
        [49] = "you're fragging like your mouse is wireless... with no battery", 
        [50] = "you peek like it's a turn-based game", 
        [51] = "spectators are cringing right now", 
        [52] = "you died so fast I thought it was prefire", 
        [53] = "your cheat menu has more options than you have brain cells", 
        [54] = "you shoot like you're lagging IRL", 
        [55] = "was that death part of the strat?", 
        [56] = "you have more deaths than brain activity", 
        [57] = "you missed more than an absentee father", 
        [58] = "you play like your hands are upside down", 
        [59] = "even your monitor gave up on you"
    }, 
    killsay_nade = {
        [1] = "you walked into it like it was scripted", 
        [2] = "your antiaim got out-aimed by a grenade", 
        [3] = "exploded your dignity too", 
        [4] = "nade landed harder than your resolver", 
        [5] = "walking HE detector moment", 
        [6] = "your ESP didn\226\128\153t see that coming?", 
        [7] = "that was a legit prediction... from the HE", 
        [8] = "grenade resolved your position", 
        [9] = "Boom'd before you even peeked.", 
        [10] = "High explosive, low IQ victim.", 
        [11] = "Spontaneous combustion caused by lack of skill.", 
        [12] = "Nade so clean it deserves a medal.", 
        [13] = "Check the radar, that was a missile.", 
        [14] = "That nade did what your aim never could.", 
        [15] = "Exploded your ego.", 
        [16] = "The floor called, it wants your body back.", 
        [17] = "deleted by hand grenade.exe", 
        [18] = "nade delivery \226\128\147 straight to your face", 
        [19] = "you just got DHL\226\128\153d", 
        [20] = "express explosion, signature required", 
        [21] = "boom goes your career", 
        [22] = "grenade says hi", 
        [23] = "kablammo certified", 
        [24] = "surprise parcel from C4 logistics", 
        [25] = "naded like it\226\128\153s 2008 MW2", 
        [26] = "exploded like your config folder", 
        [27] = "walked into that like a pro", 
        [28] = "big boom incoming \226\128\147 oh wait, too late", 
        [29] = "your esp didn\226\128\153t warn you?", 
        [30] = "caught the nade like a champ", 
        [31] = "boom \226\128\147 your config exploded too", 
        [32] = "grenade to the face, classic", 
        [33] = "that wasn\226\128\153t a frag, that was a message", 
        [34] = "exploded like a discount config", 
        [35] = "you should\226\128\153ve ducked", 
        [36] = "press F for your awareness", 
        [37] = "straight to the moon with that nade", 
        [38] = "caught a gift from csgo santa", 
        [39] = "that nade hit harder than your whole team", 
        [40] = "boom, instant uninstall", 
        [41] = "kaboom moment sponsored by logic", 
        [42] = "you walked into that like it\226\128\153s your job", 
        [43] = "your foot found the nade like destiny", 
        [44] = "CS:GO physics just deleted you", 
        [45] = "you attract frags like a magnet", 
        [46] = "pro tip: don't hug grenades", 
        [47] = "splash damage to your ego", 
        [48] = "your esp blind or just bad?", 
        [49] = "nade accuracy 100%, player awareness 0%", 
        [50] = "you ate that nade like breakfast"
    }, 
    killsay_burned = {
        [1] = "premium roast unlocked", 
        [2] = "fire said GG before you did", 
        [3] = "burned so bad your cfg needs therapy", 
        [4] = "premium config, paper legs", 
        [5] = "you dodged bullets but not fire? gg", 
        [6] = "you\226\128\153re the bbq special in hvh tonight", 
        [7] = "Your corpse smells like bad decisions.", 
        [8] = "The flames were kinder than your K/D.", 
        [9] = "You\226\128\153re sizzling like your GPU temps.", 
        [10] = "You got cooked like your config.", 
        [11] = "Overcooked and underplayed.", 
        [12] = "Bro\226\128\153s playstyle got BBQ\226\128\153d.", 
        [13] = "Roasted with no seasoning \226\128\147 just shame.", 
        [14] = "You just became environmental damage.", 
        [15] = "flamed harder than your config", 
        [16] = "deepfried like mcdonald\226\128\153s leftovers", 
        [17] = "extra crispy", 
        [18] = "burnt like your fps", 
        [19] = "that\226\128\153s some nice BBQ", 
        [20] = "flame-grilled with no sauce", 
        [21] = "cooked alive \226\128\147 well done", 
        [22] = "roasted like your cheat\226\128\153s dev", 
        [23] = "fried and denied", 
        [24] = "you melted like butter", 
        [25] = "crispy and clueless", 
        [26] = "well-done, like your account", 
        [27] = "you just got thermally deleted", 
        [28] = "charred like your credibility", 
        [29] = "extra heat for extra shame", 
        [30] = "barbecued by mistake or design?", 
        [31] = "you lit up like a christmas tree", 
        [32] = "deepfried confidence", 
        [33] = "fire roasted ego", 
        [34] = "cooked clean off the server", 
        [35] = "you got flamb\195\169ed with precision", 
        [36] = "extra spicy death for extra salty players", 
        [37] = "your config couldn\226\128\153t handle the heat", 
        [38] = "hotter than your CPU under load", 
        [39] = "you just ragequit from a fire", 
        [40] = "charcoal\226\128\153d like your reputation", 
        [41] = "sizzled like bacon", 
        [42] = "you walked into that like it\226\128\153s your job"
    }, 
    player_blind = {
        [1] = "your screen blanked out like your strategy", 
        [2] = "vision 0%, brain 1%", 
        [3] = "flash was your cue to fold", 
        [4] = "screen white, config useless", 
        [5] = "your resolver saw the flash too", 
        [6] = "Flashed into next week.", 
        [7] = "Couldn\226\128\153t see, couldn\226\128\153t shoot, couldn\226\128\153t win.", 
        [8] = "White screen speedrun world record.", 
        [9] = "The flashbang outplayed you.", 
        [10] = "Retina reset complete.", 
        [11] = "Blind and still full ego.", 
        [12] = "Vision check failed.", 
        [13] = "Flashed so hard you questioned reality.", 
        [14] = "Nothing to see here\226\128\148literally.", 
        [15] = "Your screen went white, your hope went black.", 
        [16] = "flashbang sponsored by the sun", 
        [17] = "your eyes good bro?", 
        [18] = "bro saw god for a second", 
        [19] = "lights out, brain off", 
        [20] = "flash level: divine", 
        [21] = "blink and you're gone", 
        [22] = "daylight savings just hit hard", 
        [23] = "flash so bright, it lit your soul", 
        [24] = "you just got alt-tabbed by the flash", 
        [25] = "looks like you play in IRL night mode", 
        [26] = "flash sent you back to the lobby", 
        [27] = "reaction time: error 900ms", 
        [28] = "vision set to potato mode", 
        [29] = "flash so strong it reached the next match", 
        [30] = "you just alt+f4'd mentally", 
        [31] = "flashbanged back to 2018", 
        [32] = "eyes melted on contact", 
        [33] = "you play better blind anyway", 
        [34] = "screen went white, brain went offline", 
        [35] = "that flash gave you amnesia", 
        [36] = "flash so strong it turned off your monitor", 
        [37] = "even the sun isn\226\128\153t that bright", 
        [38] = "you walked into that like it\226\128\153s your job", 
        [39] = "brain.exe stopped working after flash", 
        [40] = "your screen\226\128\153s white, like your win chances", 
        [41] = "caught in 4k... whiteout edition", 
        [42] = "flashbangs love you, skill doesn\226\128\153t", 
        [43] = "that flash went straight into your soul", 
        [44] = "light mode death activated", 
        [45] = "blind as your map awareness"
    }
};
trashtalk_norm = function()
    local v252 = nil;
    local v253 = math.random(1, #trashtalk.killsay_weapon);
    while v253 == v252 do
        v253 = math.random(1, #trashtalk.killsay_weapon);
    end;
    utils.console_exec("say " .. trashtalk.killsay_weapon[v253]);
    v252 = v253;
end;
trashtalk_hegrenade = function()
    local v254 = nil;
    local v255 = math.random(1, #trashtalk.killsay_weapon);
    while v255 == v254 do
        v255 = math.random(1, #trashtalk.killsay_weapon);
    end;
    utils.console_exec("say " .. trashtalk.killsay_nade[v255]);
    v254 = v255;
end;
trashtalk_burned = function()
    local v256 = nil;
    local v257 = math.random(1, #trashtalk.killsay_weapon);
    while v257 == v256 do
        v257 = math.random(1, #trashtalk.killsay_weapon);
    end;
    utils.console_exec("say " .. trashtalk.killsay_burned[v257]);
    v256 = v257;
end;
trashtalk_flash = function()
    local v258 = nil;
    local v259 = math.random(1, #trashtalk.killsay_weapon);
    while v259 == v258 do
        v259 = math.random(1, #trashtalk.killsay_weapon);
    end;
    utils.console_exec("say " .. trashtalk.player_blind[v259]);
    v258 = v259;
end;
local v260 = "[^a-zA-Z0-9\\s ].-*+#~?\195\159\"\194\167$%&/!_[]{}():;\226\130\172 / \\ |";
local v261 = l_ffi_0.cast("void(__cdecl*)(int, int, int, const char*, ...)", l_ffi_0.cast("void***", v78)[0][30]);
local function _(v262)
    -- upvalues: v261 (ref), v78 (ref)
    v261(v78, 0, 0, string.format("%s ", v262));
end;
local v264 = {
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
local v265 = {};
local v266 = 1;
hitlog_color = color(255);
smooth_hitlog_color = color(255);
aim_ack_hitlogs = function(v267)
    -- upvalues: v260 (ref), v264 (ref), v86 (ref), v265 (ref), v266 (ref)
    if voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("On Screen") and voyager_menu.visuals.indicators:get(3) then
        settings = voyager_menu.visuals.hitlog_settings;
        settingsA = settings.settings;
        local v268 = {
            type = settingsA:get(1), 
            name = settingsA:get(2), 
            miss = settingsA:get(3), 
            hitbox = settingsA:get(4), 
            wanted_hitbox = settingsA:get(5), 
            damage = settingsA:get(6), 
            wanted_damage = settingsA:get(7), 
            hitchance = settingsA:get(8), 
            backtrack = settingsA:get(9), 
            spread = settingsA:get(10)
        };
        player_name = tostring(v267.target:get_name():gsub(v260, "?")) or "";
        damage = v267.damage;
        wanted_hitgroup = v267.wanted_hitgroup;
        hitchance = v267.hitchance;
        hitgroup = v264[v267.hitgroup];
        backtrack = v267.backtrack;
        wanted_damage = v267.wanted_damage;
        hitchance = v267.hitchance;
        wanted_hitgroup = v264[v267.wanted_hitgroup];
        hitlog_state = v267.state;
        if v267.spread ~= nil then
            spread = string.sub(v267.spread, 1, string.find(v267.spread, "%.") + 2) .. "\194\176";
        else
            spread = 0;
        end;
        local v269 = {
            string = " Hit: ", 
            boolean = false
        };
        local v270 = "\a" .. settings.color_hit:get():to_hex();
        local v271 = "\a" .. settings.color_miss:get():to_hex();
        local v272 = "\a" .. settings.color_missmatch:get():to_hex();
        local v273 = "\a" .. settings.color_undermin:get():to_hex();
        local v274 = "\adbdbdbdb";
        if hitgroup ~= wanted_hitgroup then
            v269 = {
                string = " Missmatched: ", 
                boolean = true
            };
        else
            v269 = {
                string = " Hit: ", 
                boolean = false
            };
        end;
        if voyager_menu.visuals.hitlog_settings.style:get() == "Customizable" then
            if hitlog_state == nil then
                if hitgroup ~= wanted_hitgroup then
                    hitlog_color = settings.color_missmatch:get();
                    text = (v268.type and v274 .. "Missmatched:" or "") .. (v268.name and " " .. v272 .. player_name .. v274 .. "" or "") .. (v268.hitbox and " in: " .. v272 .. hitgroup .. v274 or "") .. (v268.wanted_hitbox and " (" .. v272 .. wanted_hitgroup .. v274 .. ")" or "") .. (v268.damage and " damage: " .. v272 .. damage .. v274 or "") .. (v268.wanted_damage and " (" .. v272 .. wanted_damage .. v274 .. ")" or "") .. (v268.hitchance and " hc: " .. v272 .. hitchance .. v274 or "") .. (v268.backtrack and " bt: " .. v272 .. backtrack .. "t" .. v274 or "") .. (v268.spread and " spread: " .. v272 .. spread .. v274 or "");
                elseif damage < v86.md:get() and settings.include_undermin:get() then
                    hitlog_color = settings.color_undermin:get();
                    text = (v268.type and v274 .. "Undermind:" or "") .. (v268.name and " " .. v273 .. player_name .. v274 .. "" or "") .. (v268.hitbox and " in: " .. v273 .. hitgroup .. v274 or "") .. (v268.wanted_hitbox and " (" .. v273 .. wanted_hitgroup .. v274 .. ")" or "") .. (v268.damage and " damage: " .. v273 .. damage .. v274 or "") .. (v268.wanted_damage and " (" .. v273 .. wanted_damage .. v274 .. ")" or "") .. (v268.hitchance and " hc: " .. v273 .. hitchance .. v274 or "") .. (v268.backtrack and " bt: " .. v273 .. backtrack .. "t" .. v274 or "") .. (v268.spread and " spread: " .. v273 .. spread .. v274 or "");
                else
                    hitlog_color = settings.color_hit:get();
                    text = (v268.type and v274 .. "Hit:" or "") .. (v268.name and " " .. v270 .. player_name .. v274 .. "" or "") .. (v268.hitbox and " in: " .. v270 .. hitgroup .. v274 or "") .. (v268.wanted_hitbox and " (" .. v270 .. wanted_hitgroup .. v274 .. ")" or "") .. (v268.damage and " damage: " .. v270 .. damage .. v274 or "") .. (v268.wanted_damage and " (" .. v270 .. wanted_damage .. v274 .. ")" or "") .. (v268.hitchance and " hc: " .. v270 .. hitchance .. v274 or "") .. (v268.backtrack and " bt: " .. v270 .. backtrack .. "t" .. v274 or "") .. (v268.spread and " spread: " .. v270 .. spread .. v274 or "");
                end;
            else
                text = (v268.type and v274 .. "Missed:" or "") .. (v268.name and " " .. v271 .. player_name .. v274 or "") .. (v268.miss and " due to: " .. v271 .. hitlog_state .. v274 or "") .. (v268.wanted_hitbox and " (" .. v271 .. wanted_hitgroup .. v274 .. ")" or "") .. (v268.wanted_damage and " (" .. v271 .. wanted_damage .. v274 .. ")" or "") .. (v268.hitchance and " hc: " .. v271 .. hitchance .. v274 or "") .. (v268.backtrack and " bt: " .. v271 .. backtrack .. "t" .. v274 or "") .. (v268.spread and " spread: " .. v271 .. spread .. v274 or "");
                hitlog_color = settings.color_miss:get();
            end;
        elseif hitlog_state ~= nil then
            text = v274 .. " Missed: " .. v271 .. player_name .. v274 .. " due to " .. v271 .. hitlog_state .. v274 .. " | Wanted: " .. v271 .. wanted_hitgroup .. " (" .. wanted_damage .. ") " .. v274 .. " | HC: " .. v271 .. hitchance .. "%" .. v274 .. " | BT: " .. v271 .. backtrack .. "t";
        elseif hitgroup ~= wanted_hitgroup then
            text = v274 .. " Missmatched: " .. v272 .. player_name .. v274 .. " | HB: " .. v272 .. hitgroup .. " (" .. damage .. ")" .. v274 .. (" | Wanted: " .. v272 .. wanted_hitgroup .. " (" .. wanted_damage .. ") " .. v274) .. " | HC: " .. v272 .. hitchance .. "%" .. v274 .. " | BT: " .. v272 .. backtrack .. "t";
        else
            text = v274 .. " Hit: " .. v270 .. player_name .. v274 .. " | HB: " .. v270 .. hitgroup .. " (" .. damage .. ")" .. v274 .. " | HC: " .. v270 .. hitchance .. "%" .. v274 .. " | BT: " .. v270 .. backtrack .. "t";
        end;
        v265[#v265 + 1] = {
            [1] = nil, 
            [2] = nil, 
            [3] = 0, 
            [1] = text, 
            [2] = globals.tickcount + 256
        };
        v266 = v266 == 999 and 1 or v266 + 1;
    end;
end;
local _ = {
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
    [10] = "unknow"
};
local function v285(v276)
    -- upvalues: v86 (ref), v260 (ref), v264 (ref)
    v86.nlhit:override(" ");
    if entity.get_local_player() == nil then
        return;
    else
        player_name = tostring(v276.target:get_name():gsub(v260, "?")) or "";
        damage = v276.damage;
        wanted_hitgroup = v276.wanted_hitgroup;
        hitchance = v276.hitchance;
        hitgroup = v264[v276.hitgroup];
        backtrack = v276.backtrack;
        wanted_damage = v276.wanted_damage;
        hitchance = v276.hitchance;
        wanted_hitgroup = v264[v276.wanted_hitgroup];
        hitlog_state = v276.state;
        if v276.spread ~= nil then
            spread = string.sub(v276.spread, 1, string.find(v276.spread, "%.") + 2) .. "\194\176";
        else
            spread = 0;
        end;
        local v277 = {
            string = " Missmatched: ", 
            boolean = true
        };
        local _ = {
            [1] = v276.damage ~= v276.wanted_damage
        };
        local v279 = "\a" .. voyager_menu.visuals.hitlog_settings.color_hit:get():to_hex();
        local v280 = "\aC8C8C8C8";
        if v276.hitgroup ~= v276.wanted_hitgroup then
            v277 = {
                string = " Missmatched: ", 
                boolean = true
            };
        else
            v277 = {
                string = " Hit: ", 
                boolean = false
            };
        end;
        if v276.state == nil then
            local _ = {
                [1] = v276.damage ~= v276.wanted_damage
            };
            local l_damage_0 = v276.damage;
            local l_wanted_damage_0 = v276.wanted_damage;
            if voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("Console") and voyager_menu.visuals.indicators:get(3) then
                print_raw(v279 .. " [ Voyager ]" .. v280 .. v277.string .. v279 .. player_name .. v280 .. " | HB: " .. v279 .. hitgroup .. " (" .. l_damage_0 .. ")" .. v280 .. (v277.boolean and " | Wanted: " .. v279 .. wanted_hitgroup .. " (" .. l_wanted_damage_0 .. ") " .. v280 or "") .. "| HC: " .. v279 .. hitchance .. v280 .. " | BT: " .. v279 .. backtrack .. v280 .. " | Spread: " .. v279 .. spread);
            end;
        elseif v276.state then
            local l_wanted_damage_1 = v276.wanted_damage;
            if voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("Console") and voyager_menu.visuals.indicators:get(3) then
                print_raw(v279 .. " [ Voyager ]" .. v280 .. " Missed: " .. v279 .. player_name .. v280 .. " due to \aC85454FF" .. hitlog_state .. v280 .. " | Wanted: " .. v279 .. wanted_hitgroup .. " (" .. l_wanted_damage_1 .. ") " .. v280 .. "| HC: " .. v279 .. hitchance .. v280 .. " | BT: " .. v279 .. backtrack .. v280 .. " | Spread: " .. v279 .. spread);
            end;
        end;
        return;
    end;
end;
local _ = false;
render_hitlogs = function()
    -- upvalues: v265 (ref), v1 (ref), v2 (ref), v3 (ref), v37 (ref)
    if not voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("On Screen") then
        return;
    else
        settings = voyager_menu.visuals.hitlog_settings;
        settingsA = settings.settings;
        local v287 = "\a" .. settings.color_hit:get():to_hex();
        local v288 = "\adbdbdbdb";
        local v289 = {
            type = settingsA:get(1), 
            name = settingsA:get(2), 
            miss = settingsA:get(3), 
            hitbox = settingsA:get(4), 
            wanted_hitbox = settingsA:get(5), 
            damage = settingsA:get(6), 
            wanted_damage = settingsA:get(7), 
            hitchance = settingsA:get(8), 
            backtrack = settingsA:get(9), 
            spread = settingsA:get(10), 
            outline = settingsA:get(11)
        };
        if ui.get_alpha() > 0 then
            hitlog_color = settings.color_hit:get();
            if voyager_menu.visuals.hitlog_settings.style:get() == "Customizable" then
                v265[1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 255, 
                    [1] = (v289.type and v288 .. "Hit:" or "") .. (v289.name and " " .. v287 .. v1 .. v288 .. "" or "") .. (v289.hitbox and " in: " .. v287 .. "Head" .. v288 or "") .. (v289.wanted_hitbox and " (" .. v287 .. "Head" .. v288 .. ")" or "") .. (v289.damage and " damage: " .. v287 .. "101" .. v288 or "") .. (v289.wanted_damage and " (" .. v287 .. "202" .. v288 .. ")" or "") .. (v289.hitchance and " hc: " .. v287 .. "99%" .. v288 or "") .. (v289.backtrack and " bt: " .. v287 .. "32t" .. v288 or "") .. (v289.spread and " spread: " .. v287 .. "0.03" .. v288 or ""), 
                    [2] = globals.tickcount + 1
                };
                text_size = render.measure_text(1, "s d", v265[1][1]).x;
                if v289.outline then
                    render.shadow(vector(v2.x / 2 - text_size / 2 - 6 * v3 + v265[1][3] / 35, v2.y / 1.4 + 35 * v3 * 1 - 3 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), vector(v2.x / 2 + text_size / 2 + 5 * v3 + v265[1][3] / 35, v2.y / 1.4 + 35 * v3 * 1 + 17 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), settings.color_hit:get(), 40, 0, voyager_menu.visuals.widgets_tog.rounding.value);
                end;
            end;
            if voyager_menu.visuals.hitlog_settings.style:get() == "Simple" then
                v265[1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 255, 
                    [1] = v288 .. " Hit: " .. v287 .. v1 .. v288 .. " | HB: " .. v287 .. "Head" .. " (" .. "101" .. ")" .. v288 .. " | HC: " .. v287 .. "99%" .. v288 .. " | BT: " .. v287 .. "32t", 
                    [2] = globals.tickcount + 1
                };
            end;
        end;
        if #v265 > 0 then
            if globals.tickcount >= v265[1][2] then
                if v265[1][3] > 0 then
                    v265[1][3] = v265[1][3] - 20;
                elseif v265[1][3] <= 0 then
                    table.remove(v265, 1);
                end;
            end;
            if #v265 > 5 then
                table.remove(v265, 1);
            end;
            if globals.is_connected == false and ui.get_alpha() == 0 then
                table.remove(v265, #v265);
            end;
            for v290 = 1, #v265 do
                text_size = render.measure_text(1, "s d", v265[v290][1]).x;
                if v265[v290][3] < 255 then
                    v265[v290][3] = v265[v290][3] + 10;
                end;
                if voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("On Screen") and voyager_menu.visuals.indicators:get(3) and voyager_menu.visuals.hitlog_settings.style:get() == "Customizable" then
                    local v291 = color(v37.lerp("hitlog_colorr", hitlog_color.r, 3), v37.lerp("hitlog_colorg", hitlog_color.g, 3), v37.lerp("hitlog_colorb", hitlog_color.b, 3));
                    if settingsA:get(11) then
                        render.shadow(vector(v2.x / 2 - text_size / 2 - 6 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 - 3 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), vector(v2.x / 2 + text_size / 2 + 5 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 + 17 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), v291:alpha_modulate((v265[v290][2] - globals.tickcount) / 256 * 255), (v265[v290][2] - globals.tickcount) / 256 * 40, 0, voyager_menu.visuals.widgets_tog.rounding.value);
                        render.rect(vector(v2.x / 2 - text_size / 2 - 6 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 - 3 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), vector(v2.x / 2 + text_size / 2 + 5 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 + 17 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), color(50, 50, 50, v265[v290][3] / 255 * 100), voyager_menu.visuals.widgets_tog.rounding.value, false);
                        render.rect_outline(vector(v2.x / 2 - text_size / 2 - 6 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 - 3 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), vector(v2.x / 2 + text_size / 2 + 5 * v3 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 + 17 * v3 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), v291:alpha_modulate(v265[v290][3]), 1, voyager_menu.visuals.widgets_tog.rounding.value, false);
                    end;
                    render.text(1, vector(v2.x / 2 - text_size / 2 + v265[v290][3] / 35, v2.y / 1.4 + 35 * v3 * v290 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), color(255, 255, 255, v265[v290][3]), "s d", v265[v290][1]);
                end;
                if voyager_menu.visuals.hitlog_settings.hitlog_type.ref:get("On Screen") and voyager_menu.visuals.indicators:get(3) and voyager_menu.visuals.hitlog_settings.style:get() == "Simple" then
                    render.text(1, vector(v2.x / 2 - text_size / 2 + v265[v290][3] / 35, v2.y / 1.4 + 20 * v3 * v290 + voyager_menu.visuals.hitlog_settings.offset.value * v3 * -10), color(255, 255, 255, v265[v290][3]), "s d", v265[v290][1]);
                end;
            end;
        end;
        return;
    end;
end;
count = 0;
local _ = 0;
local v293 = 100 * v3;
local _ = 0;
local v318 = l_system_0.register({
    [1] = voyager_menu.visuals.dragable.keyx, 
    [2] = voyager_menu.visuals.dragable.keyy
}, vector(100 * v3, 30 * v3), "Keybinds", function(v295)
    -- upvalues: v3 (ref), v37 (ref), v293 (ref)
    local l_x_0 = v295.position.x;
    local l_y_0 = v295.position.y;
    local v298 = ui.get_mouse_position();
    local v299 = 5 * v3;
    local v300 = 30 * v3;
    local v301 = ui.get_binds();
    local _ = 0;
    local v303 = {};
    local v304 = v37.get("keyalpha") or 0;
    if ui.get_alpha() > 0 and l_x_0 < v298.x and l_y_0 < v298.y and v298.x < l_x_0 + v293 and v298.y < l_y_0 + v300 then
        render.rect_outline(vector(l_x_0, l_y_0), vector(l_x_0 + v293, l_y_0 + v300), color(255, 255, 255, 100), 1, 0, true);
        render.text(1, vector(l_x_0 + v293 / 2, l_y_0 - 5 * v3), color(255, 255, 255, 100), "c a d s", "RMB to sync height");
        if common.is_button_down(2) then
            v295.position.y = voyager_menu.visuals.dragable.specy:get();
            voyager_menu.visuals.dragable.keyy:set(voyager_menu.visuals.dragable.specy:get());
        end;
    end;
    render.rect(vector(l_x_0 + v299, l_y_0 + v299), vector(l_x_0 + v293 - v299, l_y_0 + v300 - v299), color(35, 35, 35, v304 / 100 * 255), voyager_menu.visuals.widgets_tog.rounding:get() * v3, true);
    render.rect_outline(vector(l_x_0 + v299, l_y_0 + v299), vector(l_x_0 + v293 - v299, l_y_0 + v300 - v299), color(160, 160, 160, v304 / 100 * 155), 1, voyager_menu.visuals.widgets_tog.rounding:get() * v3, true);
    render.text(1, vector(l_x_0 + v293 / 2, l_y_0 + v299 + 9 * v3), color(255, 255, 255, v304 / 100 * 255), "c d s", "\a" .. voyager_menu.visuals.widgets_tog.color:get():to_hex() .. ui.get_icon("bars") .. " \affffffffKeybinds");
    if #v301 == 0 then
        v293 = v37.lerp("keywidth", 100 * v3, 10);
    end;
    if #v301 == 0 and ui.get_alpha() <= 0 then
        v37.lerp("keyalpha", 0, 40);
    else
        v37.lerp("keyalpha", 100, 40);
    end;
    for v305, v306 in pairs(v301) do
        local v307 = v306.mode == 1 and "[Hold]" or "[Toggle]";
        local v308 = type(v306.value) == "number";
        local l_x_1 = render.measure_text(1, "a c d s", v306.name .. (v308 and "[" .. v306.value .. "]" or v307)).x;
        table.insert(v303, v305, l_x_1);
        len = math.max(table.unpack(v303));
    end;
    for v310 = 1, #v301 do
        local v311 = v301[v310];
        local v312 = v311.mode == 1 and "[Hold]" or "[Toggle]";
        local v313 = type(v311.value) == "number";
        if v311.active then
            local _ = v37.lerp("a" .. v311.name, 255, 25);
        else
            local _ = v37.lerp("a" .. v311.name, 0, 25);
        end;
        if v311.active then
            local _ = v37.lerp("o" .. v311.name, 12, 15);
        else
            local _ = v37.lerp("o" .. v311.name, 0, 15);
        end;
        if len >= 30 then
            v293 = math.floor(v37.lerp("keywidth", 100 * v3 + len - 70 * v3, 10));
        else
            v293 = math.floor(v37.lerp("keywidth", 100 * v3, 10));
        end;
        render.text(1, vector(l_x_0 + v299 + 2 * v3, l_y_0 + 14 * v3 + math.floor(v37.lerp("o2" .. v311.name, v37.get("o" .. v311.name) * v310, 30)) * v3), color(255, 255, 255, v37.get("a" .. v311.name)), "a l d s", v311.name);
        render.text(1, vector(l_x_0 + v293 - v299 - 2 * v3, l_y_0 + 14 * v3 + math.floor(v37.lerp("o2" .. v311.name, v37.get("o" .. v311.name) * v310, 30)) * v3), color(255, 255, 255, v37.get("a" .. v311.name)), "a r d s", v313 and "[" .. v311.value .. "]" or v312);
    end;
end);
local _ = 0;
local v320 = 100 * v3;
local _ = 0;
local v341 = l_system_0.register({
    [1] = voyager_menu.visuals.dragable.specx, 
    [2] = voyager_menu.visuals.dragable.specy
}, vector(100 * v3, 30 * v3), "Spectators", function(v322)
    -- upvalues: v3 (ref), v37 (ref), v320 (ref)
    local l_x_2 = v322.position.x;
    local l_y_1 = v322.position.y;
    local v325 = ui.get_mouse_position();
    local v326 = 5 * v3;
    local v327 = 30 * v3;
    local v328 = entity.get_local_player();
    if v328 then
        if v328.m_hObserverTarget and (v328.m_iObserverMode == 4 or v328.m_iObserverMode == 5) then
            v328 = v328.m_hObserverTarget;
        end;
        specs = v328.get_spectators(v328) or {};
    else
        specs = {};
    end;
    local _ = 0;
    local v330 = {};
    local v331 = v37.get("specalpha") or 0;
    if ui.get_alpha() > 0 and l_x_2 < v325.x and l_y_1 < v325.y and v325.x < l_x_2 + v320 and v325.y < l_y_1 + v327 then
        render.rect_outline(vector(l_x_2, l_y_1), vector(l_x_2 + v320, l_y_1 + v327), color(255, 255, 255, 100), 1, 0, true);
        render.text(1, vector(l_x_2 + v320 / 2, l_y_1 - 5 * v3), color(255, 255, 255, 100), "c a d s", "RMB to sync height");
        if common.is_button_down(2) then
            v322.position.y = voyager_menu.visuals.dragable.keyy:get();
            voyager_menu.visuals.dragable.specy:set(voyager_menu.visuals.dragable.keyy:get());
        end;
    end;
    render.rect(vector(l_x_2 + v326, l_y_1 + v326), vector(l_x_2 + v320 - v326, l_y_1 + v327 - v326), color(35, 35, 35, v331 / 100 * 255), voyager_menu.visuals.widgets_tog.rounding:get() * v3, true);
    render.rect_outline(vector(l_x_2 + v326, l_y_1 + v326), vector(l_x_2 + v320 - v326, l_y_1 + v327 - v326), color(160, 160, 160, v331 / 100 * 155), 1, voyager_menu.visuals.widgets_tog.rounding:get() * v3, true);
    render.text(1, vector(l_x_2 + v320 / 2, l_y_1 + v326 + 9 * v3), color(255, 255, 255, v331 / 100 * 255), "c s d", "\a" .. voyager_menu.visuals.widgets_tog.color:get():to_hex() .. ui.get_icon("users") .. " \affffffffSpectators");
    if #specs == 0 then
        v320 = v37.lerp("specwidth", 100 * v3, 10);
    end;
    if #specs == 0 and ui.get_alpha() <= 0 then
        v37.lerp("specalpha", 0, 40);
    else
        v37.lerp("specalpha", 100, 40);
    end;
    for v332, v333 in pairs(specs) do
        local l_x_3 = render.measure_text(1, "a c d s", v333:get_name()).x;
        table.insert(v330, v332, l_x_3);
        len = math.max(table.unpack(v330));
    end;
    for v335 = 1, #specs do
        local v336 = specs[v335];
        if v336 then
            local _ = v37.lerp("a" .. v336:get_name(), 255, 25);
        else
            local _ = v37.lerp("a" .. v336:get_name(), 0, 25);
        end;
        if v336 then
            local _ = v37.lerp("o" .. v336:get_name(), 12, 15);
        else
            local _ = v37.lerp("o" .. v336:get_name(), 0, 15);
        end;
        if len >= 60 * v3 then
            v320 = math.floor(v37.lerp("specwidth", 100 * v3 + len - 70 * v3, 10));
        else
            v320 = math.floor(v37.lerp("specwidth", 100 * v3, 10));
        end;
        pfp = v336:get_steam_avatar();
        render.text(1, vector(l_x_2 + v326 + 14 * v3, l_y_1 + 14 * v3 + math.floor(v37.lerp("o2" .. v336:get_name(), v37.get("o" .. v336:get_name()) * v335, 30)) * v3), color(255, 255, 255, v37.get("a" .. v336:get_name())), "a l d s", v336:get_name());
        render.texture(pfp, vector(l_x_2 + v326 + 2 * v3, l_y_1 + 16 * v3 + math.floor(v37.lerp("o2" .. v336:get_name(), v37.get("o" .. v336:get_name()) * v335, 30)) * v3), vector(10 * v3, 10 * v3), nil, nil, 0);
    end;
end);
local v353 = l_system_0.register({
    [1] = voyager_menu.visuals.dragable.defx, 
    [2] = voyager_menu.visuals.dragable.defy
}, vector(150 * v3, 30 * v3), "defensive", function(v342)
    -- upvalues: v3 (ref), v2 (ref), v36 (ref), v37 (ref)
    local l_x_4 = v342.position.x;
    local l_y_2 = v342.position.y;
    local v345 = ui.get_mouse_position();
    local v346 = 150 * v3;
    local v347 = 20 * v3;
    local v348 = 5 * v3;
    local _ = entity.get_local_player();
    if ui.get_alpha() > 0 and l_x_4 < v345.x and l_y_2 < v345.y and v345.x < l_x_4 + v346 and v345.y < l_y_2 + v347 then
        render.rect_outline(vector(l_x_4, l_y_2), vector(l_x_4 + v346, l_y_2 + v347), color(255, 255, 255, 100), 1, 0, true);
        render.text(1, vector(l_x_4 + v346 / 2, l_y_2 + v347 + 5 * v3), color(255, 255, 255, 100), "c a d s", "RMB to center");
        if common.is_button_down(2) then
            v342.position.x = v2.x / 2 - v346 / 2;
            voyager_menu.visuals.dragable.defx:set(v2.x / 2 - v346 / 2);
        end;
    end;
    if voyager_menu.visuals.widgets_tog:get() and voyager_menu.visuals.widgets:get(3) then
        local l_r_4 = voyager_menu.visuals.widgets_tog.color:get().r;
        local l_g_5 = voyager_menu.visuals.widgets_tog.color:get().g;
        local l_b_4 = voyager_menu.visuals.widgets_tog.color:get().b;
        if entity.get_local_player() and entity.get_local_player():is_alive() then
            if math.abs(v36:is_active(entity.get_local_player()).tick) < 30 or ui.get_alpha() > 0 then
                deftextalpha = v37.lerp("deftextalpha", 255, 20);
            else
                deftextalpha = v37.lerp("deftextalpha", 0, 20);
            end;
        elseif ui.get_alpha() > 0 then
            deftextalpha = v37.lerp("deftextalpha", 255, 20);
        else
            deftextalpha = v37.lerp("deftextalpha", 0, 20);
        end;
        if entity.get_local_player() ~= nil then
            choke_lerp = v37.lerp("defensive_choke", math.clamp(math.abs(v36:is_active(entity.get_local_player()).tick), 0, 16), 30);
        else
            choke_lerp = 16;
        end;
        smoothing = (255 - deftextalpha) / 255;
        smoothoff = 70 * v3;
        render.text(1, vector(l_x_4 + v346 / 2, l_y_2), color(230, 230, 230, deftextalpha), "a c d s", "defensive choke");
        render.rect(vector(l_x_4 + v348 + smoothoff * smoothing, l_y_2 + v348 + 2), vector(l_x_4 + v346 - v348 - smoothoff * smoothing, l_y_2 + v347 - v348), color(60, 60, 60, deftextalpha), math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
        render.rect(vector(l_x_4 + v348 - smoothoff * smoothing + math.clamp(choke_lerp * (15 * v3), 0, 140 * v3), l_y_2 + v348 + 2), vector(l_x_4 + v346 - v348 + smoothoff * smoothing - math.clamp(choke_lerp * (15 * v3), 0, 140 * v3), l_y_2 + v347 - v348), color(l_r_4, l_g_5, l_b_4, deftextalpha), math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
        render.rect_outline(vector(l_x_4 + v348 + smoothoff * smoothing, l_y_2 + v348 + 2), vector(l_x_4 + v346 - smoothoff * smoothing - v348, l_y_2 + v347 - v348), color(130, 130, 130, deftextalpha), 1, math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
    end;
end);
local v367 = l_system_0.register({
    [1] = voyager_menu.visuals.dragable.baitx, 
    [2] = voyager_menu.visuals.dragable.baity
}, vector(82 * v3, 82 * v3), "bait", function(v354)
    -- upvalues: v3 (ref), v2 (ref), v86 (ref), v37 (ref), v36 (ref), v18 (ref)
    local l_x_5 = v354.position.x;
    local l_y_3 = v354.position.y;
    local v357 = nil;
    local v358 = ui.get_mouse_position();
    local v359 = 80 * v3;
    local v360 = 80 * v3;
    local _ = 5 * v3;
    if baitchoke_lerp == nil then
        baitchoke_lerp = 0;
    end;
    if ui.get_alpha() > 0 and l_x_5 < v358.x and l_y_3 < v358.y and v358.x < l_x_5 + v359 and v358.y < l_y_3 + v360 then
        render.circle_outline(vector(l_x_5 + v359 / 2, l_y_3 + v360 / 2), color(255, 255, 255, 100), 40, 0, 1, 1);
        render.text(1, vector(l_x_5 + v359 / 2, l_y_3 + v360 + 10 * v3), color(255, 255, 255, 100), "c a d s", "RMB to center");
        if common.is_button_down(2) then
            v354.position.x = v2.x / 2 - v359 / 2;
            voyager_menu.visuals.dragable.baitx:set(v2.x / 2 - v359 / 2);
        end;
    end;
    if voyager_menu.antiaim.bait_aa:get() and voyager_menu.antiaim.bait_aa.indicator:get() then
        local l_r_5 = voyager_menu.visuals.widgets_tog.color:get().r;
        local l_g_6 = voyager_menu.visuals.widgets_tog.color:get().g;
        local l_b_5 = voyager_menu.visuals.widgets_tog.color:get().b;
        if entity.get_local_player() and entity.get_local_player():is_alive() and v86.dt:get() then
            if baitchoke_lerp < 15.9 and (voyager_menu.antiaim.bait_aa.condition:get(1) and v86.freestanding:get() and rage.antiaim:get_target(true) or voyager_menu.antiaim.bait_aa.condition:get(2) and voyager_menu.antiaim.manuals:get() ~= "None") or ui.get_alpha() > 0 then
                baittextalpha = v37.lerp("baittextalpha", 255, 20);
            else
                baittextalpha = v37.lerp("baittextalpha", 0, 20);
            end;
        elseif ui.get_alpha() > 0 then
            baittextalpha = v37.lerp("baittextalpha", 255, 20);
        else
            baittextalpha = v37.lerp("baittextalpha", 0, 20);
        end;
        if entity.get_local_player() ~= nil then
            baitchoke_lerp = v37.lerp("baitdefensive_choke", math.clamp(math.abs(v36:is_active(entity.get_local_player()).tick), 0, 16), 30);
        else
            baitchoke_lerp = 0;
        end;
        local _ = render.camera_angles();
        local v366 = entity.get_local_player();
        if not v366 or not v366:is_alive() then
            v357 = vector(math.sin(globals.realtime) * 360, 0, 0);
        else
            v357 = vector(render.camera_angles().y - v18.y - 5, 0, 0);
        end;
        if v357 == nil then
            return;
        else
            render.circle(vector(l_x_5 + v359 / 2 + 1, l_y_3 + v360 / 2 + 1), color(30, 30, 30, baittextalpha), 30 * v3, 0, 1);
            render.circle_outline(vector(l_x_5 + v359 / 2, l_y_3 + v360 / 2), color(l_r_5, l_g_6, l_b_5, baittextalpha), 30 * v3, 270 + v357.x - 15, 0.13, 3 * v3);
            render.text(1, vector(l_x_5 + v359 / 2 + 1, l_y_3 + v360 / 2 + 1), color(230, 230, 230, baittextalpha), "a c d s", "Baiting");
            render.circle_outline(vector(l_x_5 + v359 / 2, l_y_3 + v360 / 2), color(130, 130, 130, baittextalpha), 31 * v3, 0, 1, 1);
        end;
    end;
end);
local v378 = l_system_0.register({
    [1] = voyager_menu.visuals.dragable.slowx, 
    [2] = voyager_menu.visuals.dragable.slowy
}, vector(150 * v3, 30 * v3), "defensive", function(v368)
    -- upvalues: v37 (ref), v3 (ref), v2 (ref), v220 (ref)
    slowdown_raw = entity.get_local_player() and entity.get_local_player():is_alive() and entity.get_local_player().m_flVelocityModifier or 1;
    if entity.get_local_player() and entity.get_local_player():is_alive() then
        slowdown = v37.lerp("slowdown2", entity.get_local_player().m_flVelocityModifier, 5);
    else
        slowdown = v37.lerp("slowdown2", 1, 5);
    end;
    local l_x_6 = v368.position.x;
    local l_y_4 = v368.position.y;
    local v371 = ui.get_mouse_position();
    local v372 = 150 * v3;
    local v373 = 20 * v3;
    local v374 = 5 * v3;
    if ui.get_alpha() > 0 and l_x_6 < v371.x and l_y_4 < v371.y and v371.x < l_x_6 + v372 and v371.y < l_y_4 + v373 then
        render.rect_outline(vector(l_x_6, l_y_4), vector(l_x_6 + v372, l_y_4 + v373), color(255, 255, 255, 100), 1, 0, true);
        render.text(1, vector(l_x_6 + v372 / 2, l_y_4 + v373 + 5 * v3), color(255, 255, 255, 100), "c a d s", "RMB to center");
        if common.is_button_down(2) then
            v368.position.x = v2.x / 2 - v372 / 2;
            voyager_menu.visuals.dragable.slowx:set(v2.x / 2 - v372 / 2);
        end;
    end;
    if voyager_menu.visuals.widgets_tog:get() and voyager_menu.visuals.widgets:get(4) then
        local l_r_6 = voyager_menu.visuals.widgets_tog.color:get().r;
        local l_g_7 = voyager_menu.visuals.widgets_tog.color:get().g;
        local l_b_6 = voyager_menu.visuals.widgets_tog.color:get().b;
        if entity.get_local_player() ~= nil then
            if slowdown < 0.99 or ui.get_alpha() > 0 then
                v220 = v37.lerp("alphalerp2", 255, 20);
            else
                v220 = v37.lerp("alphalerp2", 0, 20);
            end;
        elseif ui.get_alpha() > 0 then
            v220 = v37.lerp("alphalerp2", 255, 20);
        else
            v220 = v37.lerp("alphalerp2", 0, 20);
        end;
        smoothing = (255 - v220) / 255;
        smoothoff = 70 * v3;
        render.text(1, vector(l_x_6 + v372 / 2, l_y_4), color(230, 230, 230, v220), "a c d s", "slowed to " .. math.clamp(math.ceil(v37.lerp("slowdowntext", slowdown_raw * 100, 10)), 0, 100) .. "%");
        render.rect(vector(l_x_6 + v374 + smoothoff * smoothing, l_y_4 + v374 + 2), vector(l_x_6 + v372 - v374 - smoothoff * smoothing, l_y_4 + v373 - v374), color(60, 60, 60, v220), math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
        render.rect(vector(l_x_6 + v374 + smoothoff * smoothing, l_y_4 + v374 + 2), vector(l_x_6 + slowdown * (v372 - v374) - smoothoff * smoothing, l_y_4 + v373 - v374), color(l_r_6, l_g_7, l_b_6, v220), math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
        render.rect_outline(vector(l_x_6 + v374 + smoothoff * smoothing, l_y_4 + v374 + 2), vector(l_x_6 + v372 - v374 - smoothoff * smoothing, l_y_4 + v373 - v374), color(130, 130, 130, v220), 1, math.clamp(voyager_menu.visuals.widgets_tog.rounding.value - 1, 0, 6) * v3, true);
    end;
end);
watermark_width = 250 * v3;
render_watermark = function()
    -- upvalues: v3 (ref), v37 (ref), v1 (ref), v2 (ref), v85 (ref)
    local v379 = 22 * v3;
    local v380 = 10 * v3;
    local v381 = voyager_menu.visuals.widgets_tog.color:get();
    local v382 = "\a" .. v381:to_hex();
    local v383 = "\affffffff";
    local v384 = (string.len(tostring(common.get_system_time().hours)) == 1 and "0" .. common.get_system_time().hours or common.get_system_time().hours) .. ":" .. (string.len(tostring(common.get_system_time().minutes)) == 1 and "0" .. common.get_system_time().minutes or common.get_system_time().minutes);
    local v385 = math.floor(v37.lerp("ping", ping, 1));
    local v386 = math.floor(v37.lerp("fps", fps, 1));
    if v37.get("watermark") == false then
        v37.new("watermark", 90 * v3 + render.measure_text(1, "a b o r s", "| " .. v382 .. v1 .. v383 .. " | " .. v382 .. v386 .. v383 .. "fps | " .. v382 .. v385 .. v383 .. "ms | " .. v384).x);
    end;
    watermark_width = v37.lerp("watermark", 79 * v3 + render.measure_text(1, "a b o r s", "| " .. v382 .. v1 .. v383 .. " | " .. v382 .. v386 .. v383 .. "fps | " .. v382 .. v385 .. v383 .. "ms | " .. v384).x, 1);
    render.rect(vector(v2.x - watermark_width, v380), vector(v2.x - v380, v379 + v380), color(30, 30, 30, 255), voyager_menu.visuals.widgets_tog.rounding.value * v3);
    render.text(1, vector(v2.x - v380 * 1.4, v380 + 4 * v3), color(255), "a b o r s", "| " .. v382 .. v1 .. v383 .. " | " .. v382 .. v386 .. v383 .. "fps | " .. v382 .. v385 .. v383 .. "ms | " .. v384);
    render.rect_outline(vector(v2.x - watermark_width, v380), vector(v2.x - v380, v379 + v380), color(255, 255, 255, 120), 1, voyager_menu.visuals.widgets_tog.rounding.value * v3, true);
    render.texture(v85.logo, vector(v2.x - watermark_width + 5 * v3, v380 + 5 * v3), vector(55 * v3, 13 * v3), v381, nil, 0);
end;
shared_data = {
    scoped = false, 
    throw_time = 0, 
    pin_pulled = false, 
    movetype = -1
};
collect_shared = function()
    local v387 = entity.get_local_player();
    if v387 == nil then
        return;
    else
        local v388 = v387:get_player_weapon();
        if v388 == nil then
            return;
        else
            shared_data.scoped = v387.m_bIsScoped;
            shared_data.movetype = v387.m_MoveType;
            shared_data.pin_pulled = v388.m_bPinPulled;
            shared_data.throw_time = v388.m_fThrowTime;
            return;
        end;
    end;
end;
fastladder = function(v389)
    if not voyager_menu.misc.fastladder:get() then
        return;
    elseif shared_data.movetype ~= 9 then
        return;
    else
        if v389.sidemove == 0 then
            v389.view_angles.y = v389.view_angles.y + 45;
        end;
        if v389.in_forward and v389.sidemove < 0 then
            v389.view_angles.y = v389.view_angles.y + 90;
        end;
        if v389.in_back and v389.sidemove > 0 then
            v389.view_angles.y = v389.view_angles.y + 90;
        end;
        v389.in_moveleft = v389.in_back;
        v389.in_moveright = v389.in_forward;
        if v389.view_angles.x < 0 then
            v389.view_angles.x = -45;
        end;
        return;
    end;
end;
local v390 = "1981838ed755f9627ac954f98ad2e427";
local v391 = "https://github.com/635e/file_storage/blob/main/sharedicon.png?raw=true";
local v392 = {};
local function v394()
    -- upvalues: l_events_0 (ref), v390 (ref)
    l_events_0.voice_message:call(function(v393)
        -- upvalues: v390 (ref)
        v393:write_bits(29777, 128);
        v393:crypt(v390);
    end);
end;
local function v398()
    -- upvalues: l_events_0 (ref), v390 (ref)
    local v395 = entity.get_local_player();
    if v395 == nil then
        return;
    else
        v395:set_icon();
        l_events_0.voice_message:call(function(v396)
            -- upvalues: v390 (ref)
            v396:write_bits(33124, 128);
            v396:crypt(v390);
        end);
        entity.get_players(false, true, function(v397)
            v397:set_icon();
        end);
        return;
    end;
end;
local function v401()
    -- upvalues: v391 (ref), l_events_0 (ref), v390 (ref)
    local v399 = entity.get_local_player();
    if v399 == nil then
        return;
    else
        utils.execute_after(0.5, function()
            -- upvalues: v399 (ref), v391 (ref)
            if v399 == nil then
                return;
            else
                v399:set_icon(v391);
                return;
            end;
        end);
        l_events_0.voice_message:call(function(v400)
            -- upvalues: v390 (ref)
            v400:write_bits(33175, 128);
            v400:crypt(v390);
        end);
        return;
    end;
end;
indexOf = function(v402, v403)
    for v404, v405 in ipairs(v402) do
        if v405 == v403 then
            return v404;
        end;
    end;
    return nil;
end;
l_events_0.voice_message(function(v406)
    -- upvalues: v390 (ref), v392 (ref), v391 (ref), v394 (ref)
    if voyager_menu.misc.shared_icon:get() then
        local l_buffer_0 = v406.buffer;
        local v408 = entity.get_local_player();
        if v408 == nil then
            return;
        elseif v406.entity == v408 then
            return;
        else
            l_buffer_0:crypt(v390);
            local v409 = l_buffer_0:read_bits(128);
            if v406.entity == nil then
                return;
            elseif v406.entity:is_bot() then
                return;
            elseif v409 == 29777 then
                table.insert(v392, v406.entity);
                v406.entity:set_icon(v391);
            elseif v409 == 33124 then
                table.remove(v392, indexOf(v392, v406.entity));
                v406.entity:set_icon();
            elseif v409 == 33175 then
                utils.execute_after(0.3, v394);
                v406.entity:set_icon(v391);
            end;
        end;
    end;
end);
voyager_menu.misc.shared_icon:set_callback(function(v410)
    -- upvalues: v394 (ref), v401 (ref), v398 (ref)
    if v410:get() then
        utils.execute_after(0.1, v394);
        utils.execute_after(0.5, v401);
    end;
    if not v410:get() then
        v398();
    end;
end, true);
l_events_0.round_start:set(function()
    -- upvalues: v394 (ref), v401 (ref), v86 (ref)
    if not voyager_menu.misc.shared_icon:get() then
        local v411 = entity.get_local_player();
        if v411 == nil then
            return;
        else
            v411:set_icon();
        end;
    else
        utils.execute_after(0.1, v394);
        utils.execute_after(0.5, v401);
    end;
    for v412, v413 in pairs(v86) do
        if v412 ~= "nl_hit" or v412 ~= "scope_zoom" or v412 ~= "Windows" then
            v413:override();
        end;
    end;
end);
local _ = esp.enemy:new_text("Voyager", "Voyager User", function(v414)
    -- upvalues: v392 (ref)
    for _, v416 in ipairs(v392) do
        if v416 == v414 then
            return "Voyager";
        end;
    end;
end);
local _ = esp.team:new_text("Voyager", "Voyager User", function(v418)
    -- upvalues: v392 (ref)
    for _, v420 in ipairs(v392) do
        if v420 == v418 then
            return "Voyager";
        end;
    end;
end);
local v422 = false;
local v423 = nil;
local v424 = vector();
local v425 = false;
local v426 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
l_ffi_0.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } vec3_t;\n");
local v427 = l_ffi_0.cast("void(__thiscall*)(void*, const vec3_t*)", utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 64 53 56 57 8B F1"));
local v433 = {
    z = 0, 
    pitch = 0, 
    roll = 0, 
    fakeduck_animation = false, 
    visualize_target = false, 
    x = 0, 
    was_fakeducking = false, 
    yaw = 0, 
    fov = 0, 
    y = 0, 
    vec = l_ffi_0.new("vec3_t"), 
    target = {
        time = 0, 
        angles = vector()
    }, 
    fakeduck = function(v428, v429, v430)
        v428.was_fakeducking = not v429;
        cvar.viewmodel_offset_z:float(0, true);
        cvar.viewmodel_offset_z:float(v428.z - (v429 and 0 or v430 * 10), true);
    end, 
    set_target = function(v431, v432)
        -- upvalues: v424 (ref)
        v431.target.time = common.get_timestamp();
        v431.target.angles = v424:to(v432):angles();
    end
};
voyager_menu.misc.visualize_aimbot:set_callback(function(v434)
    -- upvalues: v433 (ref)
    v433.visualize_target = v434.value;
end, true);
voyager_menu.misc.fakeduck:set_callback(function(v435)
    -- upvalues: v433 (ref)
    v433.fakeduck_animation = v435.value;
end, true);
l_events_0.net_update_end:set(function()
    -- upvalues: v422 (ref)
    local v436 = entity.get_game_rules();
    if v436 then
        v422 = v436.m_bFreezePeriod;
    end;
end);
viewmodel_func = function(v437)
    -- upvalues: v425 (ref), v423 (ref), v424 (ref), v426 (ref), v422 (ref)
    if not v425 then
        cvar.viewmodel_fov:float(voyager_menu.misc.viewmodel.fov.value, true);
        cvar.viewmodel_offset_x:float(voyager_menu.misc.viewmodel.x.value / 1000, true);
        cvar.viewmodel_offset_y:float(voyager_menu.misc.viewmodel.y.value / 1000, true);
        if not v425 then
            cvar.viewmodel_offset_z:float(voyager_menu.misc.viewmodel.z.value / 1000, true);
        end;
    elseif globals.tickcount % 64 == 0 then
        cvar.viewmodel_fov:float(voyager_menu.misc.viewmodel.fov.value, true);
        cvar.viewmodel_offset_x:float(voyager_menu.misc.viewmodel.x.value / 1000, true);
        cvar.viewmodel_offset_y:float(voyager_menu.misc.viewmodel.y.value / 1000, true);
        if not v425 then
            cvar.viewmodel_offset_z:float(voyager_menu.misc.viewmodel.z.value / 1000, true);
        end;
    end;
    v423 = entity.get_local_player();
    if not v423 then
        return;
    else
        local _, v439 = math.modf(v423.m_fFlags / 2);
        v424 = v423:get_eye_position() + v423.m_vecVelocity:scaled(globals.tickinterval);
        v425 = v426:get() and v439 == 0.5 and not v422 and not v437.in_duck;
        return;
    end;
end;
fakeduck_func = function()
    -- upvalues: v423 (ref), v425 (ref), v433 (ref), v424 (ref)
    if not globals.is_in_game then
        v423 = nil;
        return;
    elseif not v423 then
        return;
    elseif not v423:is_alive() then
        return;
    else
        if v425 and v433.fakeduck_animation then
            v433:fakeduck(false, (64 - (v424.z - v423:get_origin().z)) / 18);
        elseif v433.was_fakeducking then
            v433:fakeduck(true, 0);
        end;
        return;
    end;
end;
override_view_func = function(v440)
    -- upvalues: v433 (ref), l_ffi_0 (ref), v427 (ref)
    local l_vec_0 = v433.vec;
    local l_view_0 = v440.view;
    if cvar.cl_righthand:int() == 0 then
        return;
    else
        if common.get_timestamp() - v433.target.time < 220 then
            l_vec_0.x = v433.target.angles.x;
            l_vec_0.y = v433.target.angles.y;
        else
            l_vec_0.x = l_view_0.x + v433.pitch;
            l_vec_0.y = l_view_0.y + v433.yaw;
        end;
        l_vec_0.z = v433.roll;
        entity.get_entities(140, true, function(v443)
            -- upvalues: l_ffi_0 (ref), v427 (ref), l_vec_0 (ref)
            if v443[0] ~= l_ffi_0.nullptr then
                v427(v443[0], l_vec_0);
            end;
        end);
        return;
    end;
end;
visualize_aimbot_func = function(v444)
    -- upvalues: v433 (ref)
    if not v433.visualize_target then
        return;
    else
        v433:set_target(v444.aim);
        return;
    end;
end;
jumpscout = function(_)
    -- upvalues: v169 (ref), v86 (ref)
    local v446 = entity.get_local_player();
    local l_weapon_name_0 = v446:get_player_weapon():get_weapon_info().weapon_name;
    if v169(l_weapon_name_0) then
        return;
    else
        local l_m_vecVelocity_0 = v446.m_vecVelocity;
        if not v446:is_alive() then
            v86.strafe_assist:override();
            v86.bunnyhop:override();
            v86.airstrafe:override();
            return;
        else
            if math.abs(l_m_vecVelocity_0.x) < 5 and math.abs(l_m_vecVelocity_0.y) < 5 and v446:get_player_weapon(false):get_weapon_index() == 40 then
                v86.strafe_assist:override(false);
                v86.bunnyhop:override(false);
                v86.airstrafe:override(false);
            else
                v86.autostop:override();
                v86.strafe_assist:override();
                v86.bunnyhop:override();
                v86.airstrafe:override();
                v86.hc:override();
            end;
            return;
        end;
    end;
end;
inairhitchance = function()
    -- upvalues: v86 (ref), v166 (ref)
    if voyager_menu.misc.inairhc:get()[1] == nil then
        return;
    elseif not entity.get_local_player() then
        v86.hc:override();
        return;
    else
        local v449 = entity.get_local_player();
        local _ = v449.m_vecVelocity;
        local v451 = v449:get_player_weapon(false);
        if v451 == nil then
            v86.hc:override();
            return;
        else
            local v452 = v451:get_weapon_index();
            if not v452 then
                v86.hc:override();
                return;
            else
                if v166(v449) and v449:is_alive() then
                    if v452 == 40 and voyager_menu.misc.inairhc:get(1) then
                        v86.hc:override(voyager_menu.misc.inairhc.ssg.value);
                    end;
                    if (v452 == 38 or v452 == 11) and voyager_menu.misc.inairhc:get(2) then
                        v86.hc:override(voyager_menu.misc.inairhc.auto.value);
                    end;
                    if v452 == 9 and voyager_menu.misc.inairhc:get(3) then
                        v86.hc:override(voyager_menu.misc.inairhc.awp.value);
                    end;
                else
                    v86.hc:override();
                end;
                return;
            end;
        end;
    end;
end;
local function v460()
    -- upvalues: v86 (ref), v29 (ref)
    if entity.get_local_player() == nil then
        v86.fb:override();
        return;
    else
        local v453 = nil;
        local v454 = nil;
        if v453 == nil then
            v453 = true;
        end;
        if v454 == nil then
            v454 = true;
        end;
        local v455 = entity.get_local_player();
        local v456 = entity.get_threat();
        if v456 == nil or not voyager_menu.misc.forcebaim:get() then
            v86.fb:override();
            return;
        else
            local l_m_iHealth_1 = v456.m_iHealth;
            local v458 = 0;
            if v86.md:get() <= 100 then
                v458 = v86.md:get() == 0 and 80 or v86.md:get();
            else
                v458 = l_m_iHealth_1 + v86.md:get() - 100;
            end;
            local v459 = v29:calculate(v455, v456, "stomach");
            if l_m_iHealth_1 < v459 and v458 <= v459 then
                if v453 == true then
                    v86.fb:override("Force");
                    v454 = true;
                    v453 = false;
                end;
            elseif v454 == true then
                v86.fb:override();
                v453 = true;
                v454 = false;
            end;
            return;
        end;
    end;
end;
l_ffi_0.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_3;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char    pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_3        vecOrigin; // 0xB0\n        Vector_3        vecLastOrigin;// 0xBC\n        Vector_3        vecVelocity; // 0xC8\n        Vector_3        vecVelocityNormalized; // 0xD4\n        Vector_3        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLength2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CPlayer_Animation_State;\n");
l_ffi_0.cdef("    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } CAnimationLayer_t;\n");
animbreaker_func = function(v461)
    -- upvalues: l_ffi_0 (ref)
    if v461 ~= entity.get_local_player() then
        return;
    else
        local v462 = v461[0];
        if voyager_menu.visuals.anims_tog:get() then
            if l_ffi_0.cast("CPlayer_Animation_State**", l_ffi_0.cast("uintptr_t", v462) + 39264)[0].bHitGroundAnimation and voyager_menu.visuals.anims.ref:get("0 Pitch on Land") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[12] = 0.5;
            end;
            if voyager_menu.visuals.anims.ref:get("Static Legs in Air") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[6] = 1;
            end;
            if voyager_menu.visuals.anims.ref:get("Backward Legs") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[0] = 1;
            end;
            if voyager_menu.visuals.anims.ref:get("No Moving Animation") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[10] = 0;
            end;
            if voyager_menu.visuals.anims.ref:get("Static Legs on Slowwalk") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[9] = 0;
            end;
            if voyager_menu.visuals.anims.ref:get("Devious Walk") then
                l_ffi_0.cast("float*", l_ffi_0.cast("uintptr_t", v462) + 10104)[7] = 1;
                local v463 = entity.get_local_player();
                l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v463[0]) + 10640)[0][6].m_flWeight = 1;
            end;
        end;
        return;
    end;
end;
local v464 = {};
hitmarker_logger = function(v465)
    -- upvalues: v464 (ref)
    if v465.state ~= nil then
        return;
    else
        table.insert(v464, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = nil, 
            [6] = nil, 
            [7] = nil, 
            [8] = 0, 
            [1] = v465.aim, 
            [2] = v465.hitgroup, 
            [3] = v465.damage, 
            [4] = v465.hitgroup == 1 and voyager_menu.visuals.hitmarker_settings.colorhead:get() or voyager_menu.visuals.hitmarker_settings.colorbaim:get(), 
            [5] = voyager_menu.visuals.hitmarker_settings.colormarker:get(), 
            [6] = globals.realtime + 2, 
            [7] = v465.target
        });
        return;
    end;
end;
local function v469()
    -- upvalues: v464 (ref), v84 (ref), v3 (ref), v37 (ref)
    if not voyager_menu.visuals.indicators:get(4) then
        return;
    else
        for v466, v467 in pairs(v464) do
            local v468 = render.world_to_screen(v467[1]);
            if v468 == nil then
                return;
            else
                if voyager_menu.visuals.hitmarker_settings.settings:get(2) then
                    render.text(v84.calibri, vector(v468.x, v468.y - 15 * v3), v467[4], "b c", voyager_menu.visuals.hitmarker_settings.settings:get(3) and v467[7] or v467[3]);
                end;
                if voyager_menu.visuals.hitmarker_settings.settings:get(1) then
                    render.line(vector(v468.x - 2 * v3, v468.y - 2 * v3), vector(v468.x - 7 * v3, v468.y - 7 * v3), v467[5]);
                    render.line(vector(v468.x - 2 * v3, v468.y - 1 * v3), vector(v468.x - 7 * v3, v468.y - 6 * v3), v467[5]);
                    render.line(vector(v468.x + 2 * v3, v468.y - 2 * v3), vector(v468.x + 7 * v3, v468.y - 7 * v3), v467[5]);
                    render.line(vector(v468.x + 2 * v3, v468.y - 1 * v3), vector(v468.x + 7 * v3, v468.y - 6 * v3), v467[5]);
                    render.line(vector(v468.x + 2 * v3, v468.y + 2 * v3), vector(v468.x + 7 * v3, v468.y + 7 * v3), v467[5]);
                    render.line(vector(v468.x + 2 * v3, v468.y + 1 * v3), vector(v468.x + 7 * v3, v468.y + 6 * v3), v467[5]);
                    render.line(vector(v468.x - 2 * v3, v468.y + 2 * v3), vector(v468.x - 7 * v3, v468.y + 7 * v3), v467[5]);
                    render.line(vector(v468.x - 2 * v3, v468.y + 1 * v3), vector(v468.x - 7 * v3, v468.y + 6 * v3), v467[5]);
                end;
                if v37.get("halpha" .. v466) == false then
                    v37.new("halpha" .. v466, 255);
                end;
                if v37.get("hdamage" .. v466) == false then
                    v37.new("hdamage" .. v466, 0);
                end;
                v467[7] = math.ceil(v37.lerp("hdamage" .. v466, v467[3], 5));
                v467[4].a = math.clamp(v37.get("halpha" .. v466), 0, 255);
                v467[5].a = math.clamp(v37.get("halpha" .. v466), 0, 255);
                if v467[6] < globals.realtime then
                    v37.lerp("halpha" .. v466, 0, 10);
                    if v37.get("halpha" .. v466) < 5 then
                        v464[v466] = nil;
                        v37.delete("halpha" .. v466);
                        v37.delete("hdamage" .. v466);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
l_events_0.post_update_clientside_animation(function(v470)
    animbreaker_func(v470);
end);
l_events_0.shutdown:set(function()
    -- upvalues: v398 (ref)
    v398();
end);
l_events_0.render:set(function(_)
    -- upvalues: v242 (ref), v234 (ref), v367 (ref), l_mtools_0 (ref), v3 (ref), v318 (ref), v341 (ref), v353 (ref), v378 (ref), v233 (ref), v469 (ref)
    if entity.get_local_player() and entity.get_local_player():is_alive() then
        if voyager_menu.visuals.indicators:get(1) and voyager_menu.visuals.indicators_tog:get() then
            v242();
        end;
        if voyager_menu.visuals.indicators:get(2) and voyager_menu.visuals.indicators_tog:get() then
            v234();
        end;
    end;
    if voyager_menu.antiaim.bait_aa.indicator:get() and voyager_menu.antiaim.bait_aa:get() and voyager_menu.antiaim.defensive:get() and voyager_menu.antiaim.builder:get() then
        v367:update();
    end;
    fps = l_mtools_0.Client.GetFPS(true);
    ping = l_mtools_0.Client.GetPing();
    if v3 ~= render.get_scale(2) then
        v3 = render.get_scale(2);
        updateFont();
    end;
    if voyager_menu.visuals.widgets_tog:get() then
        if voyager_menu.visuals.widgets:get(1) then
            v318:update();
        end;
        if voyager_menu.visuals.widgets:get(2) then
            v341:update();
        end;
        if voyager_menu.visuals.widgets:get(5) then
            render_watermark();
        end;
        if voyager_menu.visuals.widgets:get(3) then
            v353:update();
        end;
        if voyager_menu.visuals.widgets:get(4) then
            v378:update();
        end;
    end;
    clantag();
    if ui.get_alpha() > 0 then
        menu_vis();
    end;
    v233();
    conditionconverter();
    if voyager_menu.visuals.indicators:get(3) and voyager_menu.visuals.indicators_tog:get() then
        render_hitlogs();
    end;
    fakeduck_func();
    v469();
end);
l_events_0.level_init:set(function()
    -- upvalues: v251 (ref), v246 (ref), v183 (ref), v190 (ref), v171 (ref), v401 (ref)
    fakeping_cur = 0;
    v251 = true;
    v246 = 0;
    v183 = 0;
    cycle_oldtick = 0;
    v190 = 0;
    v171 = 0;
    v401();
end);
l_events_0.createmove:set(function(v472)
    -- upvalues: v460 (ref), v18 (ref)
    collect_shared(v472);
    misc_func(v472);
    conditions_func(v472);
    builder_func(v472);
    fastladder(v472);
    viewmodel_func(v472);
    jumpscout(v472);
    inairhitchance(v472);
    v460(v472);
    local v473 = entity.get_local_player():get_anim_state();
    if v472.choked_commands == 0 then
        v18 = vector(0, v473.eye_yaw, 0);
    end;
end);
l_events_0.aim_ack:set(function(v474)
    -- upvalues: v285 (ref)
    v285(v474);
    aim_ack_hitlogs(v474);
    hitmarker_logger(v474);
end);
l_events_0.aim_fire:set(function(v475)
    visualize_aimbot_func(v475);
end);
l_events_0.override_view:set(function(_)

end);
l_pui_0.setup({
    [1] = voyager_menu, 
    [2] = state
});
if voyager_menu.visuals.intro:get() then
    v216 = true;
    utils.execute_after(0.5, function()
        -- upvalues: v214 (ref)
        v214 = true;
    end);
    utils.execute_after(3.5, function()
        -- upvalues: v216 (ref), v215 (ref), v214 (ref), v217 (ref)
        v216 = false;
        v215 = true;
        v214 = false;
        v217 = true;
    end);
    utils.execute_after(1, function()
        -- upvalues: v216 (ref), v215 (ref), v214 (ref)
        v216 = false;
        v215 = false;
        v214 = false;
    end);
end;
l_events_0.player_death:set(function(v477)
    if voyager_menu.misc.trashtalk:get() then
        utils.execute_after(1.3, function()
            -- upvalues: v477 (ref)
            attacker = entity.get(v477.attacker, true);
            lplr = entity.get_local_player();
            weapon = v477.weapon;
            if attacker == lplr and weapon ~= "hegrenade" then
                if weapon == "inferno" then
                    trashtalk_burned();
                else
                    trashtalk_norm();
                end;
            end;
        end);
    end;
end);
l_events_0.player_hurt:set(function(v478)
    if voyager_menu.misc.trashtalk:get() then
        utils.execute_after(1.3, function()
            -- upvalues: v478 (ref)
            attacker = entity.get(v478.attacker, true);
            lplr = entity.get_local_player();
            weapon = v478.weapon;
            if attacker == lplr and weapon == "hegrenade" then
                trashtalk_hegrenade();
            end;
        end);
    end;
end);
l_events_0.player_blind:set(function(v479)
    if voyager_menu.misc.trashtalk:get() then
        attacker = entity.get(v479.attacker, true);
        lplr = entity.get_local_player();
        if attacker == lplr then
            utils.execute_after(1, function()
                trashtalk_flash();
            end);
        end;
    end;
end);