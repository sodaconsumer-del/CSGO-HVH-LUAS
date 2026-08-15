anim = require("neverlose/animations");
anim = require("neverlose/animations");
gradient = require("neverlose/gradient");
websockets = require("neverlose/websockets");
clipboard = require("neverlose/clipboard");
get_defensive = require("neverlose/get_defensive");
base64 = require("neverlose/base64");
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n");
download = function(v0, v1)
    local v2 = ffi.load("WinInet");
    local v3 = ffi.load("UrlMon");
    v2.DeleteUrlCacheEntryA(v0);
    v3.URLDownloadToFileA(nil, v0, v1, 0, 0);
end;
if not files.read("citrine\\pixel.ttf") then
    files.create_folder("citrine");
    download("https://github.com/Gyrba/nos/raw/main/pixel.ttf", "citrine\\pixel.ttf");
end;
print = function(v4)
    return print_raw("\a808080FF[\aDEFAULTcitrine\a808080FF] \aDEFAULT" .. tostring(v4));
end;
refs = {
    helpers = {
        script_online = 0, 
        antiaim = {
            active_side = {
                yaw = 0, 
                yaw_modifier = 0
            }
        }, 
        rage = {
            dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
        }, 
        font_pixel = render.load_font("citrine\\pixel.ttf", 10, "a, o"), 
        username = common.get_username(), 
        screen_size = render.screen_size()
    }
};
welcome_back = ui.create("\240\159\143\160", "\n", 1):label("Welcome back, " .. refs.helpers.username .. "!");
current_build = ui.create("\240\159\143\160", "\n", 1):label("Build: 0");
last_update = ui.create("\240\159\143\160", "\n", 1):label("Updated: 0");
script_online = ui.create("\240\159\143\160", "\n", 1):label("Current users: 0");
youtube_channel = ui.create("\240\159\143\160", "\n\n", 1):button("youtube", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@Gyrbix");
end, true);
discord_server = ui.create("\240\159\143\160", "\n\n", 1):button("discord", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/HkgEzWCWtm");
end, true);
nl_config = ui.create("\240\159\143\160", "\n\n", 1):button("best config", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=7kYE1t");
end, true);
configs = {
    elements = {}, 
    antiaim_elements = {}, 
    item = function(v5, v6)
        if configs.elements[v5] ~= nil then
            return;
        else
            configs.elements[v5] = v6;
            return v6;
        end;
    end, 
    antiaim = function(v7, v8)
        if configs.elements[v7] ~= nil then
            return;
        else
            configs.elements[v7] = v8;
            if configs.antiaim_elements[v7] ~= nil then
                return;
            else
                configs.antiaim_elements[v7] = v8;
                return v8;
            end;
        end;
    end
};
configs.export = function(_, v10)
    local l_status_0, l_result_0 = pcall(function()
        local v11 = {};
        for v12, v13 in pairs(configs.elements) do
            local v14 = v13:get();
            if type(v14) == "userdata" then
                v11[v12] = {
                    [1] = v14.r, 
                    [2] = v14.g, 
                    [3] = v14.b, 
                    [4] = v14.a
                };
            else
                v11[v12] = v14;
            end;
        end;
        v11.config_type = "all";
        local v15 = json.stringify(v11);
        custom_encoded = "[citrine] " .. base64.encode(v15) .. " [citrine]";
        clipboard.set(custom_encoded);
    end);
    if v10 then
        if not l_status_0 then
            utils.console_exec("play error.wav");
            print("Error: " .. l_result_0);
        else
            utils.console_exec("play success.wav");
        end;
    elseif not l_status_0 then
        utils.console_exec("play error.wav");
        print("Error: " .. l_result_0);
    else
        utils.console_exec("play success.wav");
        print("Configuration successfully uploaded.");
    end;
end;
configs.import = function(_, v19, v20, v21)
    local v22 = nil;
    local l_status_1, _ = pcall(function()
        -- upvalues: v19 (ref), v22 (ref)
        local v23 = string.gsub(v19, "%[citrine] ", "");
        local v24 = string.gsub(v23, " [citrine]%", "");
        local v25 = string.match(v24, "[%w%+%/]+%=*");
        local v26 = json.parse(base64.decode(v25));
        if v26.config_type == "antiaim" then
            v22 = true;
            error("You're trying to download a config that's designed for anti-aiming.");
            return;
        else
            if v26 ~= nil then
                for v27, v28 in pairs(v26) do
                    local v29 = configs.elements[v27];
                    if v29 ~= nil then
                        if type(v29:get()) == "userdata" then
                            v29:set(color(unpack(v28)));
                        else
                            v29:set(v28);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end);
    if v21 then
        if not l_status_1 then
            utils.console_exec("play error.wav");
            print("Failed to load script settings.");
        else
            utils.console_exec("play success.wav");
            print("Configuration successfully loaded.");
        end;
    elseif v20 then
        if not l_status_1 then
            utils.console_exec("play error.wav");
            print("Failed to load default configuration.");
        else
            utils.console_exec("play success.wav");
            print("Default configuration loaded.");
        end;
    elseif v22 then
        if not l_status_1 then
            utils.console_exec("play error.wav");
            print("You're trying to download a config that's designed for anti-aiming.");
        end;
    elseif not l_status_1 then
        utils.console_exec("play error.wav");
        print("Failed to load script settings.");
    else
        utils.console_exec("play success.wav");
        print("Configuration successfully loaded.");
    end;
end;
configs.export_antiaim = function(_)
    local l_status_2, l_result_2 = pcall(function()
        local v33 = {};
        for v34, v35 in pairs(configs.antiaim_elements) do
            local v36 = v35:get();
            if type(v36) == "userdata" then
                v33[v34] = {
                    [1] = v36.r, 
                    [2] = v36.g, 
                    [3] = v36.b, 
                    [4] = v36.a
                };
            else
                v33[v34] = v36;
            end;
        end;
        v33.config_type = "antiaim";
        local v37 = json.stringify(v33);
        custom_encoded = "[citrine] " .. base64.encode(v37) .. " [citrine]";
        clipboard.set(custom_encoded);
    end);
    if not l_status_2 then
        utils.console_exec("play error.wav");
        print("Error: " .. l_result_2);
    else
        utils.console_exec("play success.wav");
        print("Antiaims successfully uploaded.");
    end;
end;
configs.import_antiaim = function(_, v41)
    local v42 = nil;
    local l_status_3, l_result_3 = pcall(function()
        -- upvalues: v41 (ref), v42 (ref)
        local v43 = string.gsub(v41, "%[citrine] ", "");
        local v44 = string.gsub(v43, " [citrine]%", "");
        local v45 = string.match(v44, "[%w%+%/]+%=*");
        local v46 = json.parse(base64.decode(v45));
        if v46.config_type == "all" then
            v42 = true;
            error("You are trying to load a configuration that is not designed for anti-aim.");
            return;
        else
            if v46 ~= nil then
                for v47, v48 in pairs(v46) do
                    local v49 = configs.antiaim_elements[v47];
                    if v49 ~= nil then
                        if type(v49:get()) == "userdata" then
                            v49:set(color(unpack(v48)));
                        else
                            v49:set(v48);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end);
    if v42 then
        if not l_status_3 then
            utils.console_exec("play error.wav");
            print("You are trying to load a configuration that is not designed for anti-aim.");
        end;
    elseif not l_status_3 then
        utils.console_exec("play error.wav");
        print("Failed to import antiaims. " .. l_result_3);
    else
        utils.console_exec("play success.wav");
        print("Antiaims successfully loaded.");
    end;
end;
if files.read("citrine_configs.json") == nil then
    files.write("citrine_configs.json", "{\"configs\":[]}");
end;
configs.load = function(_)
    local _ = {
        configs = {}
    };
    local v54 = create_input:get();
    local v55 = json.parse(files.read("citrine_configs.json"));
    for v56 = 1, #v55.configs do
        if v55.configs[v56].name == v54 then
            configs:import(v55.configs[v56].data, nil, true);
            configs.update_list();
        end;
    end;
end;
configs.save = function(_)
    local v58 = {
        configs = {}
    };
    local v59 = false;
    local v60 = create_input:get();
    if v60 == "" then
        return print("\aFF0000FFWrong name");
    else
        local v61 = json.parse(files.read("citrine_configs.json"));
        local v62 = clipboard:get();
        for _, v64 in pairs(v61) do
            if #v61.configs < 1 then
                configs:export("");
                v58.configs[1] = {
                    name = v60, 
                    data = clipboard.get()
                };
                clipboard.set(v62);
                files.write("citrine_configs.json", json.stringify(v58));
                print("Configuration successfully created.");
                configs.update_list();
                return;
            else
                local v65 = json.parse(files.read("citrine_configs.json"));
                for v66 = 1, #v65.configs do
                    v58.configs[v66] = {
                        name = v64[v66].name, 
                        data = v64[v66].data
                    };
                end;
                for v67 = 1, #v65.configs do
                    if v64[v67].name == v60 then
                        v59 = true;
                        configs:export("");
                        v58.configs[v67] = {
                            name = v64[v67].name, 
                            data = clipboard.get()
                        };
                        clipboard.set(v62);
                    end;
                end;
                files.write("citrine_configs.json", json.stringify(v58));
                print("Configuration successfully updated.");
                configs.update_list();
                for _ = 1, #v65.configs do
                    if v59 == false then
                        configs:export("");
                        v58.configs[#v65.configs + 1] = {
                            name = v60, 
                            data = clipboard.get()
                        };
                        clipboard.set(v62);
                        files.write("citrine_configs.json", json.stringify(v58));
                        print("Configuration successfully created.");
                        configs.update_list();
                        return;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
configs.remove = function(_)
    local v70 = {
        configs = {}
    };
    local v71 = create_input:get();
    local v72 = json.parse(files.read("citrine_configs.json"));
    for v73 = 1, #v72.configs do
        v70.configs[v73] = {
            name = v72.configs[v73].name, 
            data = v72.configs[v73].data
        };
    end;
    for v74 = 1, #v72.configs do
        if v72.configs[v74].name == v71 then
            table.remove(v70.configs, v74);
        end;
    end;
    files.write("citrine_configs.json", json.stringify(v70));
    utils.console_exec("play success.wav");
    print("Configuration successfully removed.");
    configs.update_list();
    if list:list()[1] ~= nil then
        list:set(1);
        create_input:set(list:list()[1]);
    end;
end;
websocket_online = function()
    callbacks = {
        open = function(_)

        end, 
        message = function(_, v77)
            refs.helpers.script_online = v77;
        end, 
        close = function(_)
            refs.helpers.script_online = "0";
        end
    };
    websockets.connect("ws://5.42.85.86:9000", callbacks);
end;
websocket_online();
list = ui.create("\240\159\143\160", "\n\n\n", 2):list("");
load = ui.create("\240\159\143\160", "\n\n\n", 2):button("Load", function()
    configs:load();
end, true);
save = ui.create("\240\159\143\160", "\n\n\n", 2):button("Save", function()
    configs:save();
end, true);
remove = ui.create("\240\159\143\160", "\n\n\n", 2):button("Remove", function()
    configs:remove();
end, true);
create_input = ui.create("\240\159\143\160", "\n\n\n", 2):input("Configuration");
export = ui.create("\240\159\143\160", "\n\n\n", 2):button("Export", function()
    configs:export();
end, true);
import = ui.create("\240\159\143\160", "\n\n\n", 2):button("Import", function()
    configs:import(clipboard.get());
end, true);
default = ui.create("\240\159\143\160", "\n\n\n", 2):button("Default", function()
    configs:import(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiTW92aW5nIiwiYTJUZXJyb3Jpc3QiOiJHbG9iYWwiLCJhbmltX2NoYW5nZXIuaW5fYWlyIjoiQnJlYWsgd2Fsa2luZyIsImFuaW1fY2hhbmdlci5sZWFuX3dhbGtpbmciOjEwMC4wLCJhbmltX2NoYW5nZXIubGlzdCI6WyJPbiBsYW5kIiwiSW4gYWlyIiwiTGVhbiB3YWxraW5nIiwiUGl0Y2ggMCB3aGVuIGxhbmRpbmciXSwiYW5pbV9jaGFuZ2VyLm9uX2xhbmQiOiJKaXR0ZXIiLCJiMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjFHbG9iYWxBIjp0cnVlLCJiMUdsb2JhbEErIjp0cnVlLCJiMUdsb2JhbEMiOnRydWUsImIxR2xvYmFsRkQiOnRydWUsImIxR2xvYmFsRkwiOnRydWUsImIxR2xvYmFsRyI6dHJ1ZSwiYjFHbG9iYWxNIjp0cnVlLCJiMUdsb2JhbFMiOnRydWUsImIxR2xvYmFsU1ciOnRydWUsImIxVGVycm9yaXN0QSI6ZmFsc2UsImIxVGVycm9yaXN0QSsiOmZhbHNlLCJiMVRlcnJvcmlzdEMiOmZhbHNlLCJiMVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFUZXJyb3Jpc3RGTCI6ZmFsc2UsImIxVGVycm9yaXN0RyI6ZmFsc2UsImIxVGVycm9yaXN0TSI6ZmFsc2UsImIxVGVycm9yaXN0UyI6ZmFsc2UsImIxVGVycm9yaXN0U1ciOmZhbHNlLCJiMkNvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjJHbG9iYWxBIjoiRG93biIsImIyR2xvYmFsQSsiOiJEb3duIiwiYjJHbG9iYWxDIjoiRG93biIsImIyR2xvYmFsRkQiOiJEb3duIiwiYjJHbG9iYWxGTCI6IkRvd24iLCJiMkdsb2JhbEciOiJEb3duIiwiYjJHbG9iYWxNIjoiRG93biIsImIyR2xvYmFsUyI6IkRvd24iLCJiMkdsb2JhbFNXIjoiRG93biIsImIyVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiM0NvdW50ZXItVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0QSsiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEMiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RGTCI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0UyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0U1ciOiJMb2NhbCBWaWV3IiwiYjNHbG9iYWxBIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBKyI6IkF0IFRhcmdldCIsImIzR2xvYmFsQyI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkQiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZMIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxHIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxNIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTVyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEErIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0QyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RkwiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdFMiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RTVyI6IkxvY2FsIFZpZXciLCJiNENvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjRHbG9iYWxBIjoiQ2VudGVyIiwiYjRHbG9iYWxBKyI6IkNlbnRlciIsImI0R2xvYmFsQyI6IkNlbnRlciIsImI0R2xvYmFsRkQiOiJDZW50ZXIiLCJiNEdsb2JhbEZMIjoiQ2VudGVyIiwiYjRHbG9iYWxHIjoiQ2VudGVyIiwiYjRHbG9iYWxNIjoiQ2VudGVyIiwiYjRHbG9iYWxTIjoiQ2VudGVyIiwiYjRHbG9iYWxTVyI6IkNlbnRlciIsImI0VGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiNUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjVHbG9iYWxBIjp0cnVlLCJiNUdsb2JhbEErIjp0cnVlLCJiNUdsb2JhbEMiOnRydWUsImI1R2xvYmFsRkQiOnRydWUsImI1R2xvYmFsRkwiOnRydWUsImI1R2xvYmFsRyI6dHJ1ZSwiYjVHbG9iYWxNIjp0cnVlLCJiNUdsb2JhbFMiOnRydWUsImI1R2xvYmFsU1ciOnRydWUsImI1VGVycm9yaXN0QSI6ZmFsc2UsImI1VGVycm9yaXN0QSsiOmZhbHNlLCJiNVRlcnJvcmlzdEMiOmZhbHNlLCJiNVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVUZXJyb3Jpc3RGTCI6ZmFsc2UsImI1VGVycm9yaXN0RyI6ZmFsc2UsImI1VGVycm9yaXN0TSI6ZmFsc2UsImI1VGVycm9yaXN0UyI6ZmFsc2UsImI1VGVycm9yaXN0U1ciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjZHbG9iYWxBIjpmYWxzZSwiYjZHbG9iYWxBKyI6ZmFsc2UsImI2R2xvYmFsQyI6ZmFsc2UsImI2R2xvYmFsRkQiOmZhbHNlLCJiNkdsb2JhbEZMIjpmYWxzZSwiYjZHbG9iYWxHIjp0cnVlLCJiNkdsb2JhbE0iOmZhbHNlLCJiNkdsb2JhbFMiOmZhbHNlLCJiNkdsb2JhbFNXIjpmYWxzZSwiYjZUZXJyb3Jpc3RBIjpmYWxzZSwiYjZUZXJyb3Jpc3RBKyI6ZmFsc2UsImI2VGVycm9yaXN0QyI6ZmFsc2UsImI2VGVycm9yaXN0RkQiOmZhbHNlLCJiNlRlcnJvcmlzdEZMIjpmYWxzZSwiYjZUZXJyb3Jpc3RHIjpmYWxzZSwiYjZUZXJyb3Jpc3RNIjpmYWxzZSwiYjZUZXJyb3Jpc3RTIjpmYWxzZSwiYjZUZXJyb3Jpc3RTVyI6ZmFsc2UsImMxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEEiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsQSsiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsQyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxGRCI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxGTCI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxHIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbE0iOiIxODAgRGVncmVlcyIsImMxR2xvYmFsUyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxTVyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImMyQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJjMkdsb2JhbEEiOjUuMCwiYzJHbG9iYWxBKyI6MTAuMCwiYzJHbG9iYWxDIjo4LjAsImMyR2xvYmFsRkQiOjUuMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjoxMC4wLCJjMkdsb2JhbFMiOjYuMCwiYzJHbG9iYWxTVyI6Ni4wLCJjMlRlcnJvcmlzdEEiOjAuMCwiYzJUZXJyb3Jpc3RBKyI6MC4wLCJjMlRlcnJvcmlzdEMiOjAuMCwiYzJUZXJyb3Jpc3RGRCI6MC4wLCJjMlRlcnJvcmlzdEZMIjowLjAsImMyVGVycm9yaXN0RyI6MC4wLCJjMlRlcnJvcmlzdE0iOjAuMCwiYzJUZXJyb3Jpc3RTIjowLjAsImMyVGVycm9yaXN0U1ciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImMzR2xvYmFsQSI6MzcuMCwiYzNHbG9iYWxBKyI6MjYuMCwiYzNHbG9iYWxDIjo0MS4wLCJjM0dsb2JhbEZEIjowLjAsImMzR2xvYmFsRkwiOjAuMCwiYzNHbG9iYWxHIjowLjAsImMzR2xvYmFsTSI6MzAuMCwiYzNHbG9iYWxTIjo0MS4wLCJjM0dsb2JhbFNXIjoxLjAsImMzVGVycm9yaXN0QSI6MC4wLCJjM1RlcnJvcmlzdEErIjowLjAsImMzVGVycm9yaXN0QyI6MC4wLCJjM1RlcnJvcmlzdEZEIjowLjAsImMzVGVycm9yaXN0RkwiOjAuMCwiYzNUZXJyb3Jpc3RHIjowLjAsImMzVGVycm9yaXN0TSI6MC4wLCJjM1RlcnJvcmlzdFMiOjAuMCwiYzNUZXJyb3Jpc3RTVyI6MC4wLCJjNENvdW50ZXItVGVycm9yaXN0QSI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0QSsiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEZEIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGTCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0TSI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0UyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0U1ciOjIuMCwiYzRHbG9iYWxBIjo5LjAsImM0R2xvYmFsQSsiOjE5LjAsImM0R2xvYmFsQyI6OS4wLCJjNEdsb2JhbEZEIjoyLjAsImM0R2xvYmFsRkwiOjIuMCwiYzRHbG9iYWxHIjoyLjAsImM0R2xvYmFsTSI6MTAuMCwiYzRHbG9iYWxTIjo5LjAsImM0R2xvYmFsU1ciOjEwLjAsImM0VGVycm9yaXN0QSI6Mi4wLCJjNFRlcnJvcmlzdEErIjoyLjAsImM0VGVycm9yaXN0QyI6Mi4wLCJjNFRlcnJvcmlzdEZEIjoyLjAsImM0VGVycm9yaXN0RkwiOjIuMCwiYzRUZXJyb3Jpc3RHIjoyLjAsImM0VGVycm9yaXN0TSI6Mi4wLCJjNFRlcnJvcmlzdFMiOjIuMCwiYzRUZXJyb3Jpc3RTVyI6Mi4wLCJjb25maWdfdHlwZSI6ImFsbCIsImQxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEEiOiJVbm1hdGNoZWQiLCJkMUdsb2JhbEErIjoiVW5tYXRjaGVkIiwiZDFHbG9iYWxDIjoiVW5tYXRjaGVkIiwiZDFHbG9iYWxGRCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxGTCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxHIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbE0iOiJVbm1hdGNoZWQiLCJkMUdsb2JhbFMiOiJVbm1hdGNoZWQiLCJkMUdsb2JhbFNXIjoiVW5tYXRjaGVkIiwiZDFUZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImQyQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJkMkdsb2JhbEEiOi02Ny4wLCJkMkdsb2JhbEErIjo4LjAsImQyR2xvYmFsQyI6LTQwLjAsImQyR2xvYmFsRkQiOi02Ny4wLCJkMkdsb2JhbEZMIjotNDAuMCwiZDJHbG9iYWxHIjotNzEuMCwiZDJHbG9iYWxNIjotMzAuMCwiZDJHbG9iYWxTIjotNDAuMCwiZDJHbG9iYWxTVyI6LTU2LjAsImQyVGVycm9yaXN0QSI6MC4wLCJkMlRlcnJvcmlzdEErIjowLjAsImQyVGVycm9yaXN0QyI6MC4wLCJkMlRlcnJvcmlzdEZEIjowLjAsImQyVGVycm9yaXN0RkwiOjAuMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6MC4wLCJkMlRlcnJvcmlzdFMiOjAuMCwiZDJUZXJyb3Jpc3RTVyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiZDNHbG9iYWxBIjozLjAsImQzR2xvYmFsQSsiOi04NS4wLCJkM0dsb2JhbEMiOi04NS4wLCJkM0dsb2JhbEZEIjowLjAsImQzR2xvYmFsRkwiOi01OC4wLCJkM0dsb2JhbEciOjAuMCwiZDNHbG9iYWxNIjotODMuMCwiZDNHbG9iYWxTIjotODMuMCwiZDNHbG9iYWxTVyI6LTkwLjAsImQzVGVycm9yaXN0QSI6MC4wLCJkM1RlcnJvcmlzdEErIjowLjAsImQzVGVycm9yaXN0QyI6MC4wLCJkM1RlcnJvcmlzdEZEIjowLjAsImQzVGVycm9yaXN0RkwiOjAuMCwiZDNUZXJyb3Jpc3RHIjowLjAsImQzVGVycm9yaXN0TSI6MC4wLCJkM1RlcnJvcmlzdFMiOjAuMCwiZDNUZXJyb3Jpc3RTVyI6MC4wLCJlMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZTFHbG9iYWxBIjp0cnVlLCJlMUdsb2JhbEErIjp0cnVlLCJlMUdsb2JhbEMiOnRydWUsImUxR2xvYmFsRkQiOmZhbHNlLCJlMUdsb2JhbEZMIjpmYWxzZSwiZTFHbG9iYWxHIjpmYWxzZSwiZTFHbG9iYWxNIjp0cnVlLCJlMUdsb2JhbFMiOnRydWUsImUxR2xvYmFsU1ciOnRydWUsImUxVGVycm9yaXN0QSI6ZmFsc2UsImUxVGVycm9yaXN0QSsiOmZhbHNlLCJlMVRlcnJvcmlzdEMiOmZhbHNlLCJlMVRlcnJvcmlzdEZEIjpmYWxzZSwiZTFUZXJyb3Jpc3RGTCI6ZmFsc2UsImUxVGVycm9yaXN0RyI6ZmFsc2UsImUxVGVycm9yaXN0TSI6ZmFsc2UsImUxVGVycm9yaXN0UyI6ZmFsc2UsImUxVGVycm9yaXN0U1ciOmZhbHNlLCJlMkNvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZTJHbG9iYWxBIjoiTm9uZSIsImUyR2xvYmFsQSsiOiJOb25lIiwiZTJHbG9iYWxDIjoiTm9uZSIsImUyR2xvYmFsRkQiOiJOb25lIiwiZTJHbG9iYWxGTCI6Ik5vbmUiLCJlMkdsb2JhbEciOiJOb25lIiwiZTJHbG9iYWxNIjoiTm9uZSIsImUyR2xvYmFsUyI6Ik5vbmUiLCJlMkdsb2JhbFNXIjoiTm9uZSIsImUyVGVycm9yaXN0QSI6Ik5vbmUiLCJlMlRlcnJvcmlzdEErIjoiTm9uZSIsImUyVGVycm9yaXN0QyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZEIjoiTm9uZSIsImUyVGVycm9yaXN0RkwiOiJOb25lIiwiZTJUZXJyb3Jpc3RHIjoiTm9uZSIsImUyVGVycm9yaXN0TSI6Ik5vbmUiLCJlMlRlcnJvcmlzdFMiOiJOb25lIiwiZTJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJlM0NvdW50ZXItVGVycm9yaXN0QSI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEErIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0QyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZEIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RkwiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RHIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0TSI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdFMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTVyI6NjAuMCwiZTNHbG9iYWxBIjo2MC4wLCJlM0dsb2JhbEErIjo2MC4wLCJlM0dsb2JhbEMiOjYwLjAsImUzR2xvYmFsRkQiOjYwLjAsImUzR2xvYmFsRkwiOjYwLjAsImUzR2xvYmFsRyI6NjAuMCwiZTNHbG9iYWxNIjo2MC4wLCJlM0dsb2JhbFMiOjYwLjAsImUzR2xvYmFsU1ciOjYwLjAsImUzVGVycm9yaXN0QSI6NjAuMCwiZTNUZXJyb3Jpc3RBKyI6NjAuMCwiZTNUZXJyb3Jpc3RDIjo2MC4wLCJlM1RlcnJvcmlzdEZEIjo2MC4wLCJlM1RlcnJvcmlzdEZMIjo2MC4wLCJlM1RlcnJvcmlzdEciOjYwLjAsImUzVGVycm9yaXN0TSI6NjAuMCwiZTNUZXJyb3Jpc3RTIjo2MC4wLCJlM1RlcnJvcmlzdFNXIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0QSI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEErIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0QyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZEIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RkwiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RHIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0TSI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdFMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTVyI6NjAuMCwiZTRHbG9iYWxBIjo2MC4wLCJlNEdsb2JhbEErIjo2MC4wLCJlNEdsb2JhbEMiOjYwLjAsImU0R2xvYmFsRkQiOjYwLjAsImU0R2xvYmFsRkwiOjYwLjAsImU0R2xvYmFsRyI6NjAuMCwiZTRHbG9iYWxNIjo2MC4wLCJlNEdsb2JhbFMiOjYwLjAsImU0R2xvYmFsU1ciOjYwLjAsImU0VGVycm9yaXN0QSI6NjAuMCwiZTRUZXJyb3Jpc3RBKyI6NjAuMCwiZTRUZXJyb3Jpc3RDIjo2MC4wLCJlNFRlcnJvcmlzdEZEIjo2MC4wLCJlNFRlcnJvcmlzdEZMIjo2MC4wLCJlNFRlcnJvcmlzdEciOjYwLjAsImU0VGVycm9yaXN0TSI6NjAuMCwiZTRUZXJyb3Jpc3RTIjo2MC4wLCJlNFRlcnJvcmlzdFNXIjo2MC4wLCJlNUNvdW50ZXItVGVycm9yaXN0QSI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RBKyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RDIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZEIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZMIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEciOltdLCJlNUNvdW50ZXItVGVycm9yaXN0TSI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdFNXIjpbXSwiZTVHbG9iYWxBIjpbIkppdHRlciJdLCJlNUdsb2JhbEErIjpbIkppdHRlciJdLCJlNUdsb2JhbEMiOlsiSml0dGVyIl0sImU1R2xvYmFsRkQiOlsiSml0dGVyIl0sImU1R2xvYmFsRkwiOlsiSml0dGVyIl0sImU1R2xvYmFsRyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxNIjpbIkppdHRlciJdLCJlNUdsb2JhbFMiOlsiSml0dGVyIl0sImU1R2xvYmFsU1ciOlsiSml0dGVyIl0sImU1VGVycm9yaXN0QSI6W10sImU1VGVycm9yaXN0QSsiOltdLCJlNVRlcnJvcmlzdEMiOltdLCJlNVRlcnJvcmlzdEZEIjpbXSwiZTVUZXJyb3Jpc3RGTCI6W10sImU1VGVycm9yaXN0RyI6W10sImU1VGVycm9yaXN0TSI6W10sImU1VGVycm9yaXN0UyI6W10sImU1VGVycm9yaXN0U1ciOltdLCJlNkNvdW50ZXItVGVycm9yaXN0QSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RBKyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RDIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZMIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEciOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0TSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdFNXIjoiT2ZmIiwiZTZHbG9iYWxBIjoiT2ZmIiwiZTZHbG9iYWxBKyI6Ik9mZiIsImU2R2xvYmFsQyI6Ik9mZiIsImU2R2xvYmFsRkQiOiJPZmYiLCJlNkdsb2JhbEZMIjoiT2ZmIiwiZTZHbG9iYWxHIjoiT2ZmIiwiZTZHbG9iYWxNIjoiT2ZmIiwiZTZHbG9iYWxTIjoiT2ZmIiwiZTZHbG9iYWxTVyI6Ik9mZiIsImU2VGVycm9yaXN0QSI6Ik9mZiIsImU2VGVycm9yaXN0QSsiOiJPZmYiLCJlNlRlcnJvcmlzdEMiOiJPZmYiLCJlNlRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGTCI6Ik9mZiIsImU2VGVycm9yaXN0RyI6Ik9mZiIsImU2VGVycm9yaXN0TSI6Ik9mZiIsImU2VGVycm9yaXN0UyI6Ik9mZiIsImU2VGVycm9yaXN0U1ciOiJPZmYiLCJmMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZjFHbG9iYWxBIjp0cnVlLCJmMUdsb2JhbEErIjp0cnVlLCJmMUdsb2JhbEMiOnRydWUsImYxR2xvYmFsRkQiOmZhbHNlLCJmMUdsb2JhbEZMIjpmYWxzZSwiZjFHbG9iYWxHIjp0cnVlLCJmMUdsb2JhbE0iOnRydWUsImYxR2xvYmFsUyI6dHJ1ZSwiZjFHbG9iYWxTVyI6dHJ1ZSwiZjFUZXJyb3Jpc3RBIjpmYWxzZSwiZjFUZXJyb3Jpc3RBKyI6ZmFsc2UsImYxVGVycm9yaXN0QyI6ZmFsc2UsImYxVGVycm9yaXN0RkQiOmZhbHNlLCJmMVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFUZXJyb3Jpc3RHIjpmYWxzZSwiZjFUZXJyb3Jpc3RNIjpmYWxzZSwiZjFUZXJyb3Jpc3RTIjpmYWxzZSwiZjFUZXJyb3Jpc3RTVyI6ZmFsc2UsImYyQ291bnRlci1UZXJyb3Jpc3RBIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkQiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZMIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RHIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RNIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RTIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmMkdsb2JhbEEiOiJFeHBlcmltZW50YWwiLCJmMkdsb2JhbEErIjoiVXAiLCJmMkdsb2JhbEMiOiJNZXRhIiwiZjJHbG9iYWxGRCI6Ik5vbmUiLCJmMkdsb2JhbEZMIjoiTm9uZSIsImYyR2xvYmFsRyI6IlNlbWktVXAiLCJmMkdsb2JhbE0iOiJVcCIsImYyR2xvYmFsUyI6IkV4cGVyaW1lbnRhbCIsImYyR2xvYmFsU1ciOiJFeHBlcmltZW50YWwiLCJmMlRlcnJvcmlzdEEiOiJOb25lIiwiZjJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmMlRlcnJvcmlzdEMiOiJOb25lIiwiZjJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZMIjoiTm9uZSIsImYyVGVycm9yaXN0RyI6Ik5vbmUiLCJmMlRlcnJvcmlzdE0iOiJOb25lIiwiZjJUZXJyb3Jpc3RTIjoiTm9uZSIsImYyVGVycm9yaXN0U1ciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYzR2xvYmFsQSI6IlJhbmRvbSIsImYzR2xvYmFsQSsiOiJTaWRld2F5cyIsImYzR2xvYmFsQyI6Ik5vbmUiLCJmM0dsb2JhbEZEIjoiTm9uZSIsImYzR2xvYmFsRkwiOiJOb25lIiwiZjNHbG9iYWxHIjoiU2lkZXdheXMiLCJmM0dsb2JhbE0iOiJOb25lIiwiZjNHbG9iYWxTIjoiMy1XYXkiLCJmM0dsb2JhbFNXIjoiUmFuZG9tIiwiZjNUZXJyb3Jpc3RBIjoiTm9uZSIsImYzVGVycm9yaXN0QSsiOiJOb25lIiwiZjNUZXJyb3Jpc3RDIjoiTm9uZSIsImYzVGVycm9yaXN0RkQiOiJOb25lIiwiZjNUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEciOiJOb25lIiwiZjNUZXJyb3Jpc3RNIjoiTm9uZSIsImYzVGVycm9yaXN0UyI6Ik5vbmUiLCJmM1RlcnJvcmlzdFNXIjoiTm9uZSIsImY0Q291bnRlci1UZXJyb3Jpc3RBIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RBKyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RkQiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZMIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RHIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RNIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTVyI6NS4wLCJmNEdsb2JhbEEiOjQ2LjAsImY0R2xvYmFsQSsiOjYzLjAsImY0R2xvYmFsQyI6NDguMCwiZjRHbG9iYWxGRCI6NS4wLCJmNEdsb2JhbEZMIjo1LjAsImY0R2xvYmFsRyI6Mi4wLCJmNEdsb2JhbE0iOjYwLjAsImY0R2xvYmFsUyI6NTYuMCwiZjRHbG9iYWxTVyI6MTAwLjAsImY0VGVycm9yaXN0QSI6NS4wLCJmNFRlcnJvcmlzdEErIjo1LjAsImY0VGVycm9yaXN0QyI6NS4wLCJmNFRlcnJvcmlzdEZEIjo1LjAsImY0VGVycm9yaXN0RkwiOjUuMCwiZjRUZXJyb3Jpc3RHIjo1LjAsImY0VGVycm9yaXN0TSI6NS4wLCJmNFRlcnJvcmlzdFMiOjUuMCwiZjRUZXJyb3Jpc3RTVyI6NS4wLCJmNUNvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiZjVHbG9iYWxBIjoxODAuMCwiZjVHbG9iYWxBKyI6MTMuMCwiZjVHbG9iYWxDIjoxMy4wLCJmNUdsb2JhbEZEIjowLjAsImY1R2xvYmFsRkwiOjAuMCwiZjVHbG9iYWxHIjowLjAsImY1R2xvYmFsTSI6LTEwLjAsImY1R2xvYmFsUyI6MTAuMCwiZjVHbG9iYWxTVyI6MC4wLCJmNVRlcnJvcmlzdEEiOjAuMCwiZjVUZXJyb3Jpc3RBKyI6MC4wLCJmNVRlcnJvcmlzdEMiOjAuMCwiZjVUZXJyb3Jpc3RGRCI6MC4wLCJmNVRlcnJvcmlzdEZMIjowLjAsImY1VGVycm9yaXN0RyI6MC4wLCJmNVRlcnJvcmlzdE0iOjAuMCwiZjVUZXJyb3Jpc3RTIjowLjAsImY1VGVycm9yaXN0U1ciOjAuMCwiaGlkZV9oZWFkIjpbIktuaWZlIiwiVGFzZXIiXSwibGFnX2NvcnJlY3Rpb24iOlsiRG91YmxlIHRhcCIsIkhpZGUgc2hvdHMiXSwibWFpbl9zd2l0Y2giOnRydWUsIm1pc2MuYXV0b19tdXRlIjpmYWxzZSwibWlzYy5hdXRvX211dGVfbW9kZSI6Ik11dGUiLCJtaXNjLmF1dG9fbXV0ZV9tdXRlX2VuZW15Ijp0cnVlLCJtaXNjLmNsYW50YWdfc3BhbW1lciI6dHJ1ZSwibWlzYy5jdXN0b21fbW9kZWxfb3BhY2l0eSI6ZmFsc2UsIm1pc2MuY3VzdG9tX21vZGVsX29wYWNpdHlfb3BhY2l0eSI6MTUwLjAsIm1pc2MuY3VzdG9tX21vZGVsX29wYWNpdHlfc3R5bGUiOlsiSW4gc2NvcGUiLCJHcmVuYWRlcyJdLCJtaXNjLmN1c3RvbV9zaWRlYmFyIjpmYWxzZSwibWlzYy5jdXN0b21fc2lkZWJhcl9jb2xvciI6WzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXSwibWlzYy5jdXN0b21fc2lkZWJhcl9ncmFkaWVudCI6WzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXSwibWlzYy5jdXN0b21fc2lkZWJhcl9zcGVlZCI6LTMuMCwibWlzYy5jdXN0b21fc2lkZWJhcl9zdHlsZSI6MS4wLCJtaXNjLmRvbnRfZmlyZV93aGlsZV9tZW51X29wZW4iOnRydWUsIm1pc2Mub3ZlcnJpZGVfYXNwZWN0X3JhdGlvIjp0cnVlLCJtaXNjLm92ZXJyaWRlX2FzcGVjdF9yYXRpb19yYXRpbyI6MTIwLjAsIm1pc2Mub3ZlcnJpZGVfdmlld21vZGVsIjpmYWxzZSwibWlzYy5vdmVycmlkZV92aWV3bW9kZWxfZm92Ijo2MC4wLCJtaXNjLm92ZXJyaWRlX3ZpZXdtb2RlbF9vZmZzZXRfeCI6MTAuMCwibWlzYy5vdmVycmlkZV92aWV3bW9kZWxfb2Zmc2V0X3kiOjEwLjAsIm1pc2Mub3ZlcnJpZGVfdmlld21vZGVsX29mZnNldF96IjotMTAuMCwibWlzYy5vdmVycmlkZV92aWV3bW9kZWxfcmlnaHRfaGFuZCI6dHJ1ZSwibWlzYy5zaGFyZWRfaWNvbiI6ZmFsc2UsIm1pc2MudGFza2Jhcl9ub3RpZmljYXRpb24iOmZhbHNlLCJtaXNjLnRyYXNoX3RhbGtpbmciOnRydWUsIm1pc2MudHJhc2hfdGFsa2luZ19kZWxheSI6My4wLCJtaXNjLnRyYXNoX3RhbGtpbmdfd2FybXVwIjp0cnVlLCJwbGF5ZXJfc2lkZSI6Ikdsb2JhbCIsInJhZ2Vib3QuYWltYm90X2xvZyI6dHJ1ZSwicmFnZWJvdC5haW1ib3RfbG9nX2hpdF9waWNrZXIiOlsxNDMuMCwyMDAuMCw0Ni4wLDI1NS4wXSwicmFnZWJvdC5haW1ib3RfbG9nX21pc3NfcGlja2VyIjpbMjU1LjAsMTE3LjAsMTE3LjAsMjU1LjBdLCJyYWdlYm90LmFpbWJvdF9sb2dfdHlwZSI6WyJDb25zb2xlIiwiRXZlbnRzIl0sInJhZ2Vib3QuYWlyX3N0cmFmZV9maXgiOmZhbHNlLCJyYWdlYm90LmF1dG9fYm9keV9haW0iOmZhbHNlLCJyYWdlYm90LmF1dG9fYm9keV9haW1fbGV0aGFsIjp0cnVlLCJyYWdlYm90LmF1dG9fdGVsZXBvcnQiOmZhbHNlLCJyYWdlYm90LmF1dG9fdGVsZXBvcnRfd2VhcG9ucyI6W10sInJhZ2Vib3QuY3VzdG9tX2hpdGNoYW5jZSI6ZmFsc2UsInJhZ2Vib3QuY3VzdG9tX2hpdGNoYW5jZV9oY19haXIiOjAuMCwicmFnZWJvdC5jdXN0b21faGl0Y2hhbmNlX2hjX25zIjowLjAsInJhZ2Vib3QuY3VzdG9tX2hpdGNoYW5jZV9tb2RlIjpbXSwicmFnZWJvdC5jdXN0b21faGl0Y2hhbmNlX3dlYXBvbnMiOltdLCJyYWdlYm90LmxhZ19leHBsb2l0IjpmYWxzZSwic2V0dGluZ3MiOlsiQW50aS1haW0gb24gdXNlIiwiQW50aS1rbmlmZSBzeXN0ZW0iLCJDbGltYmluZyB0aGUgbGFkZGVyIHF1aWNrbHkiXSwic2lkZXdheXMuZGlzYWJsZV9ib2R5IjpmYWxzZSwic2lkZXdheXMuZGlzYWJsZV95YXdfbW9kaWYiOmZhbHNlLCJzaWRld2F5cy5vZmZzZXQiOjkwLjAsInNpZGV3YXlzLnNpZGUiOiJEaXNhYmxlZCIsInZpc3VhbHMuY3Jvc3NoYWlyX2luZGljYXRvciI6dHJ1ZSwidmlzdWFscy5jcm9zc2hhaXJfaW5kaWNhdG9yX3ByaW1hcnlfY29sb3IiOlsyNTUuMCwxODcuMCwxODcuMCwyNTUuMF0sInZpc3VhbHMuY3Jvc3NoYWlyX2luZGljYXRvcl9zZWNvbmRfY29sb3IiOlsyNTUuMCwxODcuMCwxODcuMCwyNTUuMF0sInZpc3VhbHMuY3VzdG9tX2JhY2tncm91bmQiOmZhbHNlLCJ2aXN1YWxzLmN1c3RvbV9iYWNrZ3JvdW5kX2FscGhhIjoxLjAsInZpc3VhbHMuY3VzdG9tX2JhY2tncm91bmRfc3RyZW5ndGgiOjAuMCwidmlzdWFscy5jdXN0b21fYmFja2dyb3VuZF9zdHlsZSI6MS4wLCJ2aXN1YWxzLmN1c3RvbV9zY29wZV9vdmVybGF5Ijp0cnVlLCJ2aXN1YWxzLmN1c3RvbV9zY29wZV9vdmVybGF5X2NvbG9yIjpbMjU1LjAsMjU1LjAsMjU1LjAsMjU1LjBdLCJ2aXN1YWxzLmN1c3RvbV9zY29wZV9vdmVybGF5X2dhcCI6NS4wLCJ2aXN1YWxzLmN1c3RvbV9zY29wZV9vdmVybGF5X2ludmVydGVkIjp0cnVlLCJ2aXN1YWxzLmN1c3RvbV9zY29wZV9vdmVybGF5X2xpbmUiOjY2LjAsInZpc3VhbHMuY3VzdG9tX3Njb3BlX292ZXJsYXlfc3ByZWFkX2Jhc2VkIjpmYWxzZSwidmlzdWFscy5jdXN0b21fc2NvcGVfb3ZlcmxheV9zdHlsZSI6IkRlZmF1bHQiLCJ2aXN1YWxzLmRhbWFnZV9pbmRpY2F0b3IiOmZhbHNlLCJ2aXN1YWxzLmRhbWFnZV9pbmRpY2F0b3JfY29sb3IiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sInZpc3VhbHMubWFudWFsX2Fycm93cyI6ZmFsc2UsInZpc3VhbHMubWFudWFsX2Fycm93c19jb2xvciI6WzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXSwidmlzdWFscy5yZXZvbHZlcl9oZWxwZXIiOmZhbHNlLCJ2aXN1YWxzLnJldm9sdmVyX2hlbHBlcl9jb2xvciI6WzI1NS4wLDI1NS4wLDI1NS4wLDI1NS4wXX0= [citrine]"), true);
end, true);
list:set_callback(function(v79)
    if list:list()[1] == nil or list:list()[1] == "\aFF0000FFNo Configs" then
        return;
    else
        create_input:set(list:list()[v79:get()]);
        return;
    end;
end);
configs_list = {};
configs.update_list = function()
    local v80 = json.parse(files.read("citrine_configs.json"));
    for _, v82 in pairs(v80) do
        configs_list = {};
        for v83 = 1, #v80.configs do
            if create_input:get() == "" then
                create_input:set(v82[v83].name);
            end;
            configs_list[v82[v83].name] = v82[v83].name;
        end;
    end;
    list:update(configs_list);
end;
configs.update_list();
configs.render = function()
    if #list:list() < 1 then
        list:update("\aFF0000FFNo Configs");
    end;
    if #list:list() == 1 and list:list()[1] == "\aFF0000FFNo Configs" then
        load:disabled(true);
        remove:disabled(true);
        return;
    else
        for _ = 1, #list:list() do
            if list:list()[list:get()] ~= create_input:get() then
                disabled_state = true;
            else
                disabled_state = false;
            end;
        end;
        if list:list()[1] == nil then
            disabled_state = true;
        end;
        load:disabled(disabled_state);
        remove:disabled(disabled_state);
        return;
    end;
end;
main_switch = configs.item("main_switch", ui.create("\240\159\142\175", "\n", 1):switch("Main switch"));
settings = {};
settings.customizations = configs.item("settings", ui.create("\240\159\142\175", "\n\n", 1):selectable("Customizations", {
    [1] = "Anti-aim in the warmup", 
    [2] = "Anti-aim on use", 
    [3] = "Anti-knife system", 
    [4] = "Hide head", 
    [5] = "Climbing the ladder quickly", 
    [6] = "Lag correction"
}));
settings.hide_head = configs.item("hide_head", settings.customizations:create():selectable("Hide head", {
    [1] = "Knife", 
    [2] = "Taser", 
    [3] = "Stand", 
    [4] = "Crouch", 
    [5] = "Air crouch"
}));
settings.lag_correction = configs.item("lag_correction", settings.customizations:create():selectable("Lag correction", {
    [1] = "Double tap", 
    [2] = "Hide shots"
}));
sideways = {};
sideways.side = configs.item("sideways.side", ui.create("\240\159\142\175", "\n\n", 1):combo("Side", {
    [1] = "Disabled", 
    [2] = "Left", 
    [3] = "Right", 
    [4] = "Forward"
}));
sideways.offset = configs.item("sideways.offset", sideways.side:create():slider("Offset", 50, 120, 90));
sideways.disable_yaw_modif = configs.item("sideways.disable_yaw_modif", sideways.side:create():switch("Disable yaw modif.", true));
sideways.disable_body = configs.item("sideways.disable_body", sideways.side:create():switch("Disable body", true));
anim_changer = {};
anim_changer.list = configs.item("anim_changer.list", ui.create("\240\159\142\175", "\n\n", 1):selectable("List", {
    [1] = "On land", 
    [2] = "In air", 
    [3] = "Lean walking", 
    [4] = "Pitch 0 when landing"
}));
anim_changer.on_land = configs.item("anim_changer.on_land", anim_changer.list:create():combo("On land", {
    [1] = "Sliding", 
    [2] = "Walking", 
    [3] = "Jitter"
}));
anim_changer.in_air = configs.item("anim_changer.in_air", anim_changer.list:create():combo("In air", {
    [1] = "Frozen", 
    [2] = "Walking", 
    [3] = "Break walking"
}));
anim_changer.lean_walking = configs.item("anim_changer.lean_walking", anim_changer.list:create():slider("Lean walking", 1, 100, 100, 1, "%"));
list_settings = ui.create("\240\159\142\175", "\n\n", 1):list("", {
    [1] = "Settings", 
    [2] = "Sideways anti-aim", 
    [3] = "Changing animations"
});
export_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("Export", function()
    configs:export_antiaim();
end, true);
import_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("Import", function()
    configs:import_antiaim(clipboard.get());
end, true);
configs_label = ui.create("\240\159\142\175", "\n\n", 1):label("Configs:");
default1_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\208\144\208\179\209\128\208\181\209\129\208\184\208\178\209\139", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiTW92aW5nIiwiYTJUZXJyb3Jpc3QiOiJHbG9iYWwiLCJhbmltX2NoYW5nZXIuaW5fYWlyIjoiV2Fsa2luZyIsImFuaW1fY2hhbmdlci5sZWFuX3dhbGtpbmciOjEwMC4wLCJhbmltX2NoYW5nZXIubGlzdCI6WyJPbiBsYW5kIiwiSW4gYWlyIiwiTGVhbiB3YWxraW5nIiwiUGl0Y2ggMCB3aGVuIGxhbmRpbmciXSwiYW5pbV9jaGFuZ2VyLm9uX2xhbmQiOiJKaXR0ZXIiLCJiMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjFHbG9iYWxBIjp0cnVlLCJiMUdsb2JhbEErIjp0cnVlLCJiMUdsb2JhbEMiOnRydWUsImIxR2xvYmFsRkQiOnRydWUsImIxR2xvYmFsRkwiOnRydWUsImIxR2xvYmFsRyI6dHJ1ZSwiYjFHbG9iYWxNIjp0cnVlLCJiMUdsb2JhbFMiOnRydWUsImIxR2xvYmFsU1ciOnRydWUsImIxVGVycm9yaXN0QSI6ZmFsc2UsImIxVGVycm9yaXN0QSsiOmZhbHNlLCJiMVRlcnJvcmlzdEMiOmZhbHNlLCJiMVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFUZXJyb3Jpc3RGTCI6ZmFsc2UsImIxVGVycm9yaXN0RyI6ZmFsc2UsImIxVGVycm9yaXN0TSI6ZmFsc2UsImIxVGVycm9yaXN0UyI6ZmFsc2UsImIxVGVycm9yaXN0U1ciOmZhbHNlLCJiMkNvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjJHbG9iYWxBIjoiRG93biIsImIyR2xvYmFsQSsiOiJEb3duIiwiYjJHbG9iYWxDIjoiRG93biIsImIyR2xvYmFsRkQiOiJEb3duIiwiYjJHbG9iYWxGTCI6IkRvd24iLCJiMkdsb2JhbEciOiJEb3duIiwiYjJHbG9iYWxNIjoiRG93biIsImIyR2xvYmFsUyI6IkRvd24iLCJiMkdsb2JhbFNXIjoiRG93biIsImIyVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiM0NvdW50ZXItVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0QSsiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEMiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RGTCI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0UyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0U1ciOiJMb2NhbCBWaWV3IiwiYjNHbG9iYWxBIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBKyI6IkF0IFRhcmdldCIsImIzR2xvYmFsQyI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkQiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZMIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxHIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxNIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTVyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEErIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0QyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RkwiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdFMiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RTVyI6IkxvY2FsIFZpZXciLCJiNENvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjRHbG9iYWxBIjoiQ2VudGVyIiwiYjRHbG9iYWxBKyI6IkNlbnRlciIsImI0R2xvYmFsQyI6IkNlbnRlciIsImI0R2xvYmFsRkQiOiJDZW50ZXIiLCJiNEdsb2JhbEZMIjoiQ2VudGVyIiwiYjRHbG9iYWxHIjoiQ2VudGVyIiwiYjRHbG9iYWxNIjoiQ2VudGVyIiwiYjRHbG9iYWxTIjoiQ2VudGVyIiwiYjRHbG9iYWxTVyI6IkNlbnRlciIsImI0VGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiNUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjVHbG9iYWxBIjp0cnVlLCJiNUdsb2JhbEErIjp0cnVlLCJiNUdsb2JhbEMiOnRydWUsImI1R2xvYmFsRkQiOnRydWUsImI1R2xvYmFsRkwiOnRydWUsImI1R2xvYmFsRyI6dHJ1ZSwiYjVHbG9iYWxNIjp0cnVlLCJiNUdsb2JhbFMiOnRydWUsImI1R2xvYmFsU1ciOnRydWUsImI1VGVycm9yaXN0QSI6ZmFsc2UsImI1VGVycm9yaXN0QSsiOmZhbHNlLCJiNVRlcnJvcmlzdEMiOmZhbHNlLCJiNVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVUZXJyb3Jpc3RGTCI6ZmFsc2UsImI1VGVycm9yaXN0RyI6ZmFsc2UsImI1VGVycm9yaXN0TSI6ZmFsc2UsImI1VGVycm9yaXN0UyI6ZmFsc2UsImI1VGVycm9yaXN0U1ciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjZHbG9iYWxBIjp0cnVlLCJiNkdsb2JhbEErIjp0cnVlLCJiNkdsb2JhbEMiOnRydWUsImI2R2xvYmFsRkQiOmZhbHNlLCJiNkdsb2JhbEZMIjpmYWxzZSwiYjZHbG9iYWxHIjp0cnVlLCJiNkdsb2JhbE0iOnRydWUsImI2R2xvYmFsUyI6ZmFsc2UsImI2R2xvYmFsU1ciOnRydWUsImI2VGVycm9yaXN0QSI6ZmFsc2UsImI2VGVycm9yaXN0QSsiOmZhbHNlLCJiNlRlcnJvcmlzdEMiOmZhbHNlLCJiNlRlcnJvcmlzdEZEIjpmYWxzZSwiYjZUZXJyb3Jpc3RGTCI6ZmFsc2UsImI2VGVycm9yaXN0RyI6ZmFsc2UsImI2VGVycm9yaXN0TSI6ZmFsc2UsImI2VGVycm9yaXN0UyI6ZmFsc2UsImI2VGVycm9yaXN0U1ciOmZhbHNlLCJjMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEErIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxNIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiYzJHbG9iYWxBIjoxMS4wLCJjMkdsb2JhbEErIjoxNS4wLCJjMkdsb2JhbEMiOjEzLjAsImMyR2xvYmFsRkQiOjguMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjoxMS4wLCJjMkdsb2JhbFMiOjkuMCwiYzJHbG9iYWxTVyI6OS4wLCJjMlRlcnJvcmlzdEEiOjAuMCwiYzJUZXJyb3Jpc3RBKyI6MC4wLCJjMlRlcnJvcmlzdEMiOjAuMCwiYzJUZXJyb3Jpc3RGRCI6MC4wLCJjMlRlcnJvcmlzdEZMIjowLjAsImMyVGVycm9yaXN0RyI6MC4wLCJjMlRlcnJvcmlzdE0iOjAuMCwiYzJUZXJyb3Jpc3RTIjowLjAsImMyVGVycm9yaXN0U1ciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImMzR2xvYmFsQSI6MC4wLCJjM0dsb2JhbEErIjowLjAsImMzR2xvYmFsQyI6MC4wLCJjM0dsb2JhbEZEIjowLjAsImMzR2xvYmFsRkwiOjAuMCwiYzNHbG9iYWxHIjowLjAsImMzR2xvYmFsTSI6MC4wLCJjM0dsb2JhbFMiOjAuMCwiYzNHbG9iYWxTVyI6MC4wLCJjM1RlcnJvcmlzdEEiOjAuMCwiYzNUZXJyb3Jpc3RBKyI6MC4wLCJjM1RlcnJvcmlzdEMiOjAuMCwiYzNUZXJyb3Jpc3RGRCI6MC4wLCJjM1RlcnJvcmlzdEZMIjowLjAsImMzVGVycm9yaXN0RyI6MC4wLCJjM1RlcnJvcmlzdE0iOjAuMCwiYzNUZXJyb3Jpc3RTIjowLjAsImMzVGVycm9yaXN0U1ciOjAuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEEiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEErIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RDIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGRCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkwiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEciOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdE0iOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFNXIjoyLjAsImM0R2xvYmFsQSI6Mi4wLCJjNEdsb2JhbEErIjoyLjAsImM0R2xvYmFsQyI6Mi4wLCJjNEdsb2JhbEZEIjoyLjAsImM0R2xvYmFsRkwiOjIuMCwiYzRHbG9iYWxHIjoyLjAsImM0R2xvYmFsTSI6Mi4wLCJjNEdsb2JhbFMiOjIuMCwiYzRHbG9iYWxTVyI6Mi4wLCJjNFRlcnJvcmlzdEEiOjIuMCwiYzRUZXJyb3Jpc3RBKyI6Mi4wLCJjNFRlcnJvcmlzdEMiOjIuMCwiYzRUZXJyb3Jpc3RGRCI6Mi4wLCJjNFRlcnJvcmlzdEZMIjoyLjAsImM0VGVycm9yaXN0RyI6Mi4wLCJjNFRlcnJvcmlzdE0iOjIuMCwiYzRUZXJyb3Jpc3RTIjoyLjAsImM0VGVycm9yaXN0U1ciOjIuMCwiY29uZmlnX3R5cGUiOiJhbnRpYWltIiwiZDFDb3VudGVyLVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxBKyI6IkxlZnQgJiBSaWdodCIsImQxR2xvYmFsQyI6IkxlZnQgJiBSaWdodCIsImQxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxNIjoiTGVmdCAmIFJpZ2h0IiwiZDFHbG9iYWxTIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbFNXIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQyR2xvYmFsQSI6LTY1LjAsImQyR2xvYmFsQSsiOi04NC4wLCJkMkdsb2JhbEMiOi04NC4wLCJkMkdsb2JhbEZEIjotNTguMCwiZDJHbG9iYWxGTCI6LTcxLjAsImQyR2xvYmFsRyI6LTcxLjAsImQyR2xvYmFsTSI6LTg1LjAsImQyR2xvYmFsUyI6LTU4LjAsImQyR2xvYmFsU1ciOi02NS4wLCJkMlRlcnJvcmlzdEEiOjAuMCwiZDJUZXJyb3Jpc3RBKyI6MC4wLCJkMlRlcnJvcmlzdEMiOjAuMCwiZDJUZXJyb3Jpc3RGRCI6MC4wLCJkMlRlcnJvcmlzdEZMIjowLjAsImQyVGVycm9yaXN0RyI6MC4wLCJkMlRlcnJvcmlzdE0iOjAuMCwiZDJUZXJyb3Jpc3RTIjowLjAsImQyVGVycm9yaXN0U1ciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQzR2xvYmFsQSI6MC4wLCJkM0dsb2JhbEErIjotNzMuMCwiZDNHbG9iYWxDIjotNjQuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjowLjAsImQzR2xvYmFsRyI6MC4wLCJkM0dsb2JhbE0iOi03MS4wLCJkM0dsb2JhbFMiOjAuMCwiZDNHbG9iYWxTVyI6MC4wLCJkM1RlcnJvcmlzdEEiOjAuMCwiZDNUZXJyb3Jpc3RBKyI6MC4wLCJkM1RlcnJvcmlzdEMiOjAuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOjAuMCwiZDNUZXJyb3Jpc3RTIjowLjAsImQzVGVycm9yaXN0U1ciOjAuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6ZmFsc2UsImUxR2xvYmFsQSsiOmZhbHNlLCJlMUdsb2JhbEMiOmZhbHNlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6ZmFsc2UsImUxR2xvYmFsUyI6ZmFsc2UsImUxR2xvYmFsU1ciOmZhbHNlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6NjAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QSsiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGTCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RHIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdE0iOltdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTVyI6W10sImU1R2xvYmFsQSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxBKyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxDIjpbIkppdHRlciJdLCJlNUdsb2JhbEZEIjpbIkppdHRlciJdLCJlNUdsb2JhbEZMIjpbIkppdHRlciJdLCJlNUdsb2JhbEciOlsiSml0dGVyIl0sImU1R2xvYmFsTSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTIjpbIkppdHRlciJdLCJlNUdsb2JhbFNXIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEEiOltdLCJlNVRlcnJvcmlzdEErIjpbXSwiZTVUZXJyb3Jpc3RDIjpbXSwiZTVUZXJyb3Jpc3RGRCI6W10sImU1VGVycm9yaXN0RkwiOltdLCJlNVRlcnJvcmlzdEciOltdLCJlNVRlcnJvcmlzdE0iOltdLCJlNVRlcnJvcmlzdFMiOltdLCJlNVRlcnJvcmlzdFNXIjpbXSwiZTZDb3VudGVyLVRlcnJvcmlzdEEiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QSsiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGRCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGTCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RHIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdE0iOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0UyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTVyI6Ik9mZiIsImU2R2xvYmFsQSI6Ik9mZiIsImU2R2xvYmFsQSsiOiJPZmYiLCJlNkdsb2JhbEMiOiJPZmYiLCJlNkdsb2JhbEZEIjoiT2ZmIiwiZTZHbG9iYWxGTCI6Ik9mZiIsImU2R2xvYmFsRyI6Ik9mZiIsImU2R2xvYmFsTSI6Ik9mZiIsImU2R2xvYmFsUyI6Ik9mZiIsImU2R2xvYmFsU1ciOiJPZmYiLCJlNlRlcnJvcmlzdEEiOiJPZmYiLCJlNlRlcnJvcmlzdEErIjoiT2ZmIiwiZTZUZXJyb3Jpc3RDIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGRCI6Ik9mZiIsImU2VGVycm9yaXN0RkwiOiJPZmYiLCJlNlRlcnJvcmlzdEciOiJPZmYiLCJlNlRlcnJvcmlzdE0iOiJPZmYiLCJlNlRlcnJvcmlzdFMiOiJPZmYiLCJlNlRlcnJvcmlzdFNXIjoiT2ZmIiwiZjFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImYxR2xvYmFsQSI6dHJ1ZSwiZjFHbG9iYWxBKyI6dHJ1ZSwiZjFHbG9iYWxDIjp0cnVlLCJmMUdsb2JhbEZEIjpmYWxzZSwiZjFHbG9iYWxGTCI6ZmFsc2UsImYxR2xvYmFsRyI6dHJ1ZSwiZjFHbG9iYWxNIjp0cnVlLCJmMUdsb2JhbFMiOmZhbHNlLCJmMUdsb2JhbFNXIjp0cnVlLCJmMVRlcnJvcmlzdEEiOmZhbHNlLCJmMVRlcnJvcmlzdEErIjpmYWxzZSwiZjFUZXJyb3Jpc3RDIjpmYWxzZSwiZjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImYxVGVycm9yaXN0RkwiOmZhbHNlLCJmMVRlcnJvcmlzdEciOmZhbHNlLCJmMVRlcnJvcmlzdE0iOmZhbHNlLCJmMVRlcnJvcmlzdFMiOmZhbHNlLCJmMVRlcnJvcmlzdFNXIjpmYWxzZSwiZjJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYyR2xvYmFsQSI6IlJhbmRvbSIsImYyR2xvYmFsQSsiOiJVcCIsImYyR2xvYmFsQyI6IlVwIiwiZjJHbG9iYWxGRCI6Ik5vbmUiLCJmMkdsb2JhbEZMIjoiTm9uZSIsImYyR2xvYmFsRyI6IlNlbWktVXAiLCJmMkdsb2JhbE0iOiJTZW1pLVVwIiwiZjJHbG9iYWxTIjoiU2VtaS1Eb3duIiwiZjJHbG9iYWxTVyI6IlNlbWktRG93biIsImYyVGVycm9yaXN0QSI6Ik5vbmUiLCJmMlRlcnJvcmlzdEErIjoiTm9uZSIsImYyVGVycm9yaXN0QyI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZEIjoiTm9uZSIsImYyVGVycm9yaXN0RkwiOiJOb25lIiwiZjJUZXJyb3Jpc3RHIjoiTm9uZSIsImYyVGVycm9yaXN0TSI6Ik5vbmUiLCJmMlRlcnJvcmlzdFMiOiJOb25lIiwiZjJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjNHbG9iYWxBIjoiUmFuZG9tIiwiZjNHbG9iYWxBKyI6IjMtV2F5IiwiZjNHbG9iYWxDIjoiQ3VzdG9tIiwiZjNHbG9iYWxGRCI6Ik5vbmUiLCJmM0dsb2JhbEZMIjoiTm9uZSIsImYzR2xvYmFsRyI6IlNpZGV3YXlzIiwiZjNHbG9iYWxNIjoiU2lkZXdheXMiLCJmM0dsb2JhbFMiOiJTaWRld2F5cyIsImYzR2xvYmFsU1ciOiIzLVdheSIsImYzVGVycm9yaXN0QSI6Ik5vbmUiLCJmM1RlcnJvcmlzdEErIjoiTm9uZSIsImYzVGVycm9yaXN0QyI6Ik5vbmUiLCJmM1RlcnJvcmlzdEZEIjoiTm9uZSIsImYzVGVycm9yaXN0RkwiOiJOb25lIiwiZjNUZXJyb3Jpc3RHIjoiTm9uZSIsImYzVGVycm9yaXN0TSI6Ik5vbmUiLCJmM1RlcnJvcmlzdFMiOiJOb25lIiwiZjNUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmNENvdW50ZXItVGVycm9yaXN0QSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QSsiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZEIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGTCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0TSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0UyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0U1ciOjUuMCwiZjRHbG9iYWxBIjo1MC4wLCJmNEdsb2JhbEErIjoxMDAuMCwiZjRHbG9iYWxDIjo1LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjoyOS4wLCJmNEdsb2JhbFMiOjguMCwiZjRHbG9iYWxTVyI6NS4wLCJmNFRlcnJvcmlzdEEiOjUuMCwiZjRUZXJyb3Jpc3RBKyI6NS4wLCJmNFRlcnJvcmlzdEMiOjUuMCwiZjRUZXJyb3Jpc3RGRCI6NS4wLCJmNFRlcnJvcmlzdEZMIjo1LjAsImY0VGVycm9yaXN0RyI6NS4wLCJmNFRlcnJvcmlzdE0iOjUuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MC4wLCJmNUdsb2JhbEErIjowLjAsImY1R2xvYmFsQyI6MTAuMCwiZjVHbG9iYWxGRCI6MC4wLCJmNUdsb2JhbEZMIjowLjAsImY1R2xvYmFsRyI6MC4wLCJmNUdsb2JhbE0iOjAuMCwiZjVHbG9iYWxTIjowLjAsImY1R2xvYmFsU1ciOjAuMCwiZjVUZXJyb3Jpc3RBIjowLjAsImY1VGVycm9yaXN0QSsiOjAuMCwiZjVUZXJyb3Jpc3RDIjowLjAsImY1VGVycm9yaXN0RkQiOjAuMCwiZjVUZXJyb3Jpc3RGTCI6MC4wLCJmNVRlcnJvcmlzdEciOjAuMCwiZjVUZXJyb3Jpc3RNIjowLjAsImY1VGVycm9yaXN0UyI6MC4wLCJmNVRlcnJvcmlzdFNXIjowLjAsImhpZGVfaGVhZCI6WyJLbmlmZSIsIlRhc2VyIl0sImxhZ19jb3JyZWN0aW9uIjpbIkRvdWJsZSB0YXAiLCJIaWRlIHNob3RzIl0sImxpc3Rfc2V0dGluZ3MiOjEuMCwibWFpbl9zd2l0Y2giOnRydWUsInBsYXllcl9zaWRlIjoiR2xvYmFsIiwic2V0dGluZ3MiOlsiQW50aS1haW0gaW4gdGhlIHdhcm11cCIsIkFudGktYWltIG9uIHVzZSIsIkFudGkta25pZmUgc3lzdGVtIiwiQ2xpbWJpbmcgdGhlIGxhZGRlciBxdWlja2x5Il0sInNpZGV3YXlzLmRpc2FibGVfYm9keSI6ZmFsc2UsInNpZGV3YXlzLmRpc2FibGVfeWF3X21vZGlmIjpmYWxzZSwic2lkZXdheXMub2Zmc2V0Ijo5MC4wLCJzaWRld2F5cy5zaWRlIjoiRGlzYWJsZWQifQ== [citrine]"));
end, true);
default2_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\208\145\208\190\208\188\208\182\208\176\209\128\208\176", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiRmFrZWxhZ2dpbmciLCJhMlRlcnJvcmlzdCI6Ikdsb2JhbCIsImFuaW1fY2hhbmdlci5pbl9haXIiOiJXYWxraW5nIiwiYW5pbV9jaGFuZ2VyLmxlYW5fd2Fsa2luZyI6MTAwLjAsImFuaW1fY2hhbmdlci5saXN0IjpbIk9uIGxhbmQiLCJJbiBhaXIiLCJMZWFuIHdhbGtpbmciLCJQaXRjaCAwIHdoZW4gbGFuZGluZyJdLCJhbmltX2NoYW5nZXIub25fbGFuZCI6IkppdHRlciIsImIxQ291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiMUdsb2JhbEEiOnRydWUsImIxR2xvYmFsQSsiOnRydWUsImIxR2xvYmFsQyI6dHJ1ZSwiYjFHbG9iYWxGRCI6dHJ1ZSwiYjFHbG9iYWxGTCI6dHJ1ZSwiYjFHbG9iYWxHIjp0cnVlLCJiMUdsb2JhbE0iOnRydWUsImIxR2xvYmFsUyI6dHJ1ZSwiYjFHbG9iYWxTVyI6dHJ1ZSwiYjFUZXJyb3Jpc3RBIjpmYWxzZSwiYjFUZXJyb3Jpc3RBKyI6ZmFsc2UsImIxVGVycm9yaXN0QyI6ZmFsc2UsImIxVGVycm9yaXN0RkQiOmZhbHNlLCJiMVRlcnJvcmlzdEZMIjpmYWxzZSwiYjFUZXJyb3Jpc3RHIjpmYWxzZSwiYjFUZXJyb3Jpc3RNIjpmYWxzZSwiYjFUZXJyb3Jpc3RTIjpmYWxzZSwiYjFUZXJyb3Jpc3RTVyI6ZmFsc2UsImIyQ291bnRlci1UZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiMkdsb2JhbEEiOiJEb3duIiwiYjJHbG9iYWxBKyI6IkRvd24iLCJiMkdsb2JhbEMiOiJEb3duIiwiYjJHbG9iYWxGRCI6IkRvd24iLCJiMkdsb2JhbEZMIjoiRG93biIsImIyR2xvYmFsRyI6IkRvd24iLCJiMkdsb2JhbE0iOiJEb3duIiwiYjJHbG9iYWxTIjoiRG93biIsImIyR2xvYmFsU1ciOiJEb3duIiwiYjJUZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImIzQ291bnRlci1UZXJyb3Jpc3RBIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RBKyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0QyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RkQiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEZMIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RNIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RTIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RTVyI6IkxvY2FsIFZpZXciLCJiM0dsb2JhbEEiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEErIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxDIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxGRCI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkwiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEciOiJBdCBUYXJnZXQiLCJiM0dsb2JhbE0iOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFMiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFNXIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RBIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0QSsiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RDIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RkQiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RGTCI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEciOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RNIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0UyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdFNXIjoiTG9jYWwgVmlldyIsImI0Q291bnRlci1UZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiNEdsb2JhbEEiOiJDZW50ZXIiLCJiNEdsb2JhbEErIjoiQ2VudGVyIiwiYjRHbG9iYWxDIjoiQ2VudGVyIiwiYjRHbG9iYWxGRCI6IkNlbnRlciIsImI0R2xvYmFsRkwiOiJDZW50ZXIiLCJiNEdsb2JhbEciOiJDZW50ZXIiLCJiNEdsb2JhbE0iOiJDZW50ZXIiLCJiNEdsb2JhbFMiOiJDZW50ZXIiLCJiNEdsb2JhbFNXIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImI1Q291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiNUdsb2JhbEEiOnRydWUsImI1R2xvYmFsQSsiOnRydWUsImI1R2xvYmFsQyI6dHJ1ZSwiYjVHbG9iYWxGRCI6dHJ1ZSwiYjVHbG9iYWxGTCI6dHJ1ZSwiYjVHbG9iYWxHIjp0cnVlLCJiNUdsb2JhbE0iOnRydWUsImI1R2xvYmFsUyI6dHJ1ZSwiYjVHbG9iYWxTVyI6dHJ1ZSwiYjVUZXJyb3Jpc3RBIjpmYWxzZSwiYjVUZXJyb3Jpc3RBKyI6ZmFsc2UsImI1VGVycm9yaXN0QyI6ZmFsc2UsImI1VGVycm9yaXN0RkQiOmZhbHNlLCJiNVRlcnJvcmlzdEZMIjpmYWxzZSwiYjVUZXJyb3Jpc3RHIjpmYWxzZSwiYjVUZXJyb3Jpc3RNIjpmYWxzZSwiYjVUZXJyb3Jpc3RTIjpmYWxzZSwiYjVUZXJyb3Jpc3RTVyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiNkdsb2JhbEEiOnRydWUsImI2R2xvYmFsQSsiOnRydWUsImI2R2xvYmFsQyI6dHJ1ZSwiYjZHbG9iYWxGRCI6ZmFsc2UsImI2R2xvYmFsRkwiOmZhbHNlLCJiNkdsb2JhbEciOnRydWUsImI2R2xvYmFsTSI6dHJ1ZSwiYjZHbG9iYWxTIjpmYWxzZSwiYjZHbG9iYWxTVyI6ZmFsc2UsImI2VGVycm9yaXN0QSI6ZmFsc2UsImI2VGVycm9yaXN0QSsiOmZhbHNlLCJiNlRlcnJvcmlzdEMiOmZhbHNlLCJiNlRlcnJvcmlzdEZEIjpmYWxzZSwiYjZUZXJyb3Jpc3RGTCI6ZmFsc2UsImI2VGVycm9yaXN0RyI6ZmFsc2UsImI2VGVycm9yaXN0TSI6ZmFsc2UsImI2VGVycm9yaXN0UyI6ZmFsc2UsImI2VGVycm9yaXN0U1ciOmZhbHNlLCJjMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEErIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxNIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiYzJHbG9iYWxBIjoxMS4wLCJjMkdsb2JhbEErIjoxMy4wLCJjMkdsb2JhbEMiOjEzLjAsImMyR2xvYmFsRkQiOjguMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjotMi4wLCJjMkdsb2JhbFMiOjEwLjAsImMyR2xvYmFsU1ciOjYuMCwiYzJUZXJyb3Jpc3RBIjowLjAsImMyVGVycm9yaXN0QSsiOjAuMCwiYzJUZXJyb3Jpc3RDIjowLjAsImMyVGVycm9yaXN0RkQiOjAuMCwiYzJUZXJyb3Jpc3RGTCI6MC4wLCJjMlRlcnJvcmlzdEciOjAuMCwiYzJUZXJyb3Jpc3RNIjowLjAsImMyVGVycm9yaXN0UyI6MC4wLCJjMlRlcnJvcmlzdFNXIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJjM0dsb2JhbEEiOjAuMCwiYzNHbG9iYWxBKyI6MC4wLCJjM0dsb2JhbEMiOjAuMCwiYzNHbG9iYWxGRCI6MC4wLCJjM0dsb2JhbEZMIjowLjAsImMzR2xvYmFsRyI6MC4wLCJjM0dsb2JhbE0iOjAuMCwiYzNHbG9iYWxTIjowLjAsImMzR2xvYmFsU1ciOjAuMCwiYzNUZXJyb3Jpc3RBIjowLjAsImMzVGVycm9yaXN0QSsiOjAuMCwiYzNUZXJyb3Jpc3RDIjowLjAsImMzVGVycm9yaXN0RkQiOjAuMCwiYzNUZXJyb3Jpc3RGTCI6MC4wLCJjM1RlcnJvcmlzdEciOjAuMCwiYzNUZXJyb3Jpc3RNIjowLjAsImMzVGVycm9yaXN0UyI6MC4wLCJjM1RlcnJvcmlzdFNXIjowLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBKyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0QyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkQiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEZMIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RHIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RNIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTVyI6Mi4wLCJjNEdsb2JhbEEiOjIuMCwiYzRHbG9iYWxBKyI6Mi4wLCJjNEdsb2JhbEMiOjIuMCwiYzRHbG9iYWxGRCI6Mi4wLCJjNEdsb2JhbEZMIjoyLjAsImM0R2xvYmFsRyI6Mi4wLCJjNEdsb2JhbE0iOjIuMCwiYzRHbG9iYWxTIjoyLjAsImM0R2xvYmFsU1ciOjIuMCwiYzRUZXJyb3Jpc3RBIjoyLjAsImM0VGVycm9yaXN0QSsiOjIuMCwiYzRUZXJyb3Jpc3RDIjoyLjAsImM0VGVycm9yaXN0RkQiOjIuMCwiYzRUZXJyb3Jpc3RGTCI6Mi4wLCJjNFRlcnJvcmlzdEciOjIuMCwiYzRUZXJyb3Jpc3RNIjoyLjAsImM0VGVycm9yaXN0UyI6Mi4wLCJjNFRlcnJvcmlzdFNXIjoyLjAsImNvbmZpZ190eXBlIjoiYW50aWFpbSIsImQxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEEiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSsiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxGRCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxGTCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxHIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbE0iOiIxODAgRGVncmVlcyIsImQxR2xvYmFsUyI6IkxlZnQgJiBSaWdodCIsImQxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMkNvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiZDJHbG9iYWxBIjotNjUuMCwiZDJHbG9iYWxBKyI6LTc4LjAsImQyR2xvYmFsQyI6LTcxLjAsImQyR2xvYmFsRkQiOi01OC4wLCJkMkdsb2JhbEZMIjotNDQuMCwiZDJHbG9iYWxHIjotNzEuMCwiZDJHbG9iYWxNIjotODUuMCwiZDJHbG9iYWxTIjotNDUuMCwiZDJHbG9iYWxTVyI6LTg1LjAsImQyVGVycm9yaXN0QSI6MC4wLCJkMlRlcnJvcmlzdEErIjowLjAsImQyVGVycm9yaXN0QyI6MC4wLCJkMlRlcnJvcmlzdEZEIjowLjAsImQyVGVycm9yaXN0RkwiOjAuMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6MC4wLCJkMlRlcnJvcmlzdFMiOjAuMCwiZDJUZXJyb3Jpc3RTVyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiZDNHbG9iYWxBIjowLjAsImQzR2xvYmFsQSsiOi01OC4wLCJkM0dsb2JhbEMiOi02NC4wLCJkM0dsb2JhbEZEIjowLjAsImQzR2xvYmFsRkwiOjAuMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTcxLjAsImQzR2xvYmFsUyI6LTY1LjAsImQzR2xvYmFsU1ciOjAuMCwiZDNUZXJyb3Jpc3RBIjowLjAsImQzVGVycm9yaXN0QSsiOjAuMCwiZDNUZXJyb3Jpc3RDIjowLjAsImQzVGVycm9yaXN0RkQiOjAuMCwiZDNUZXJyb3Jpc3RGTCI6MC4wLCJkM1RlcnJvcmlzdEciOjAuMCwiZDNUZXJyb3Jpc3RNIjowLjAsImQzVGVycm9yaXN0UyI6MC4wLCJkM1RlcnJvcmlzdFNXIjowLjAsImUxQ291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJlMUdsb2JhbEEiOmZhbHNlLCJlMUdsb2JhbEErIjp0cnVlLCJlMUdsb2JhbEMiOmZhbHNlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6ZmFsc2UsImUxR2xvYmFsUyI6ZmFsc2UsImUxR2xvYmFsU1ciOmZhbHNlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6NjAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QSsiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGTCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RHIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdE0iOltdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTVyI6W10sImU1R2xvYmFsQSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxBKyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxDIjpbIkppdHRlciJdLCJlNUdsb2JhbEZEIjpbIkppdHRlciJdLCJlNUdsb2JhbEZMIjpbIkppdHRlciJdLCJlNUdsb2JhbEciOlsiSml0dGVyIl0sImU1R2xvYmFsTSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTIjpbIkppdHRlciJdLCJlNUdsb2JhbFNXIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEEiOltdLCJlNVRlcnJvcmlzdEErIjpbXSwiZTVUZXJyb3Jpc3RDIjpbXSwiZTVUZXJyb3Jpc3RGRCI6W10sImU1VGVycm9yaXN0RkwiOltdLCJlNVRlcnJvcmlzdEciOltdLCJlNVRlcnJvcmlzdE0iOltdLCJlNVRlcnJvcmlzdFMiOltdLCJlNVRlcnJvcmlzdFNXIjpbXSwiZTZDb3VudGVyLVRlcnJvcmlzdEEiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QSsiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGRCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGTCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RHIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdE0iOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0UyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTVyI6Ik9mZiIsImU2R2xvYmFsQSI6Ik9mZiIsImU2R2xvYmFsQSsiOiJPZmYiLCJlNkdsb2JhbEMiOiJPZmYiLCJlNkdsb2JhbEZEIjoiT2ZmIiwiZTZHbG9iYWxGTCI6Ik9mZiIsImU2R2xvYmFsRyI6Ik9mZiIsImU2R2xvYmFsTSI6Ik9mZiIsImU2R2xvYmFsUyI6Ik9mZiIsImU2R2xvYmFsU1ciOiJPZmYiLCJlNlRlcnJvcmlzdEEiOiJPZmYiLCJlNlRlcnJvcmlzdEErIjoiT2ZmIiwiZTZUZXJyb3Jpc3RDIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGRCI6Ik9mZiIsImU2VGVycm9yaXN0RkwiOiJPZmYiLCJlNlRlcnJvcmlzdEciOiJPZmYiLCJlNlRlcnJvcmlzdE0iOiJPZmYiLCJlNlRlcnJvcmlzdFMiOiJPZmYiLCJlNlRlcnJvcmlzdFNXIjoiT2ZmIiwiZjFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImYxR2xvYmFsQSI6dHJ1ZSwiZjFHbG9iYWxBKyI6dHJ1ZSwiZjFHbG9iYWxDIjp0cnVlLCJmMUdsb2JhbEZEIjpmYWxzZSwiZjFHbG9iYWxGTCI6ZmFsc2UsImYxR2xvYmFsRyI6dHJ1ZSwiZjFHbG9iYWxNIjp0cnVlLCJmMUdsb2JhbFMiOmZhbHNlLCJmMUdsb2JhbFNXIjp0cnVlLCJmMVRlcnJvcmlzdEEiOmZhbHNlLCJmMVRlcnJvcmlzdEErIjpmYWxzZSwiZjFUZXJyb3Jpc3RDIjpmYWxzZSwiZjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImYxVGVycm9yaXN0RkwiOmZhbHNlLCJmMVRlcnJvcmlzdEciOmZhbHNlLCJmMVRlcnJvcmlzdE0iOmZhbHNlLCJmMVRlcnJvcmlzdFMiOmZhbHNlLCJmMVRlcnJvcmlzdFNXIjpmYWxzZSwiZjJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYyR2xvYmFsQSI6IlVwIiwiZjJHbG9iYWxBKyI6IlVwIiwiZjJHbG9iYWxDIjoiVXAiLCJmMkdsb2JhbEZEIjoiTm9uZSIsImYyR2xvYmFsRkwiOiJOb25lIiwiZjJHbG9iYWxHIjoiU2VtaS1VcCIsImYyR2xvYmFsTSI6IlVwIiwiZjJHbG9iYWxTIjoiU2VtaS1Eb3duIiwiZjJHbG9iYWxTVyI6IlNlbWktRG93biIsImYyVGVycm9yaXN0QSI6Ik5vbmUiLCJmMlRlcnJvcmlzdEErIjoiTm9uZSIsImYyVGVycm9yaXN0QyI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZEIjoiTm9uZSIsImYyVGVycm9yaXN0RkwiOiJOb25lIiwiZjJUZXJyb3Jpc3RHIjoiTm9uZSIsImYyVGVycm9yaXN0TSI6Ik5vbmUiLCJmMlRlcnJvcmlzdFMiOiJOb25lIiwiZjJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjNHbG9iYWxBIjoiU2lkZXdheXMiLCJmM0dsb2JhbEErIjoiU2lkZXdheXMiLCJmM0dsb2JhbEMiOiJTaWRld2F5cyIsImYzR2xvYmFsRkQiOiJOb25lIiwiZjNHbG9iYWxGTCI6Ik5vbmUiLCJmM0dsb2JhbEciOiJTaWRld2F5cyIsImYzR2xvYmFsTSI6IlNpZGV3YXlzIiwiZjNHbG9iYWxTIjoiU2lkZXdheXMiLCJmM0dsb2JhbFNXIjoiMy1XYXkiLCJmM1RlcnJvcmlzdEEiOiJOb25lIiwiZjNUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmM1RlcnJvcmlzdEMiOiJOb25lIiwiZjNUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEZMIjoiTm9uZSIsImYzVGVycm9yaXN0RyI6Ik5vbmUiLCJmM1RlcnJvcmlzdE0iOiJOb25lIiwiZjNUZXJyb3Jpc3RTIjoiTm9uZSIsImYzVGVycm9yaXN0U1ciOiJOb25lIiwiZjRDb3VudGVyLVRlcnJvcmlzdEEiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEErIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RDIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGRCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RkwiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEciOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdE0iOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdFMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdFNXIjo1LjAsImY0R2xvYmFsQSI6NjAuMCwiZjRHbG9iYWxBKyI6NDAuMCwiZjRHbG9iYWxDIjo1LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjoyOS4wLCJmNEdsb2JhbFMiOjguMCwiZjRHbG9iYWxTVyI6NS4wLCJmNFRlcnJvcmlzdEEiOjUuMCwiZjRUZXJyb3Jpc3RBKyI6NS4wLCJmNFRlcnJvcmlzdEMiOjUuMCwiZjRUZXJyb3Jpc3RGRCI6NS4wLCJmNFRlcnJvcmlzdEZMIjo1LjAsImY0VGVycm9yaXN0RyI6NS4wLCJmNFRlcnJvcmlzdE0iOjUuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MC4wLCJmNUdsb2JhbEErIjowLjAsImY1R2xvYmFsQyI6MTAuMCwiZjVHbG9iYWxGRCI6MC4wLCJmNUdsb2JhbEZMIjowLjAsImY1R2xvYmFsRyI6MC4wLCJmNUdsb2JhbE0iOjAuMCwiZjVHbG9iYWxTIjowLjAsImY1R2xvYmFsU1ciOjAuMCwiZjVUZXJyb3Jpc3RBIjowLjAsImY1VGVycm9yaXN0QSsiOjAuMCwiZjVUZXJyb3Jpc3RDIjowLjAsImY1VGVycm9yaXN0RkQiOjAuMCwiZjVUZXJyb3Jpc3RGTCI6MC4wLCJmNVRlcnJvcmlzdEciOjAuMCwiZjVUZXJyb3Jpc3RNIjowLjAsImY1VGVycm9yaXN0UyI6MC4wLCJmNVRlcnJvcmlzdFNXIjowLjAsImhpZGVfaGVhZCI6WyJLbmlmZSIsIlRhc2VyIl0sImxhZ19jb3JyZWN0aW9uIjpbIkRvdWJsZSB0YXAiLCJIaWRlIHNob3RzIl0sImxpc3Rfc2V0dGluZ3MiOjMuMCwibWFpbl9zd2l0Y2giOnRydWUsInBsYXllcl9zaWRlIjoiR2xvYmFsIiwic2V0dGluZ3MiOlsiQW50aS1haW0gaW4gdGhlIHdhcm11cCIsIkFudGktYWltIG9uIHVzZSIsIkFudGkta25pZmUgc3lzdGVtIiwiQ2xpbWJpbmcgdGhlIGxhZGRlciBxdWlja2x5Il0sInNpZGV3YXlzLmRpc2FibGVfYm9keSI6ZmFsc2UsInNpZGV3YXlzLmRpc2FibGVfeWF3X21vZGlmIjpmYWxzZSwic2lkZXdheXMub2Zmc2V0Ijo5MC4wLCJzaWRld2F5cy5zaWRlIjoiRGlzYWJsZWQifQ== [citrine]"));
end, true);
default3_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\208\162\208\181\209\129\209\130", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiRmFrZWxhZ2dpbmciLCJhMlRlcnJvcmlzdCI6Ikdsb2JhbCIsImFuaW1fY2hhbmdlci5haXIiOiJQaWRvcmFzSiIsImFuaW1fY2hhbmdlci5lbmFibGUiOlsiR3JvdW5kIiwiQWlyIiwiTW92ZSBMZWFuIl0sImFuaW1fY2hhbmdlci5ncm91bmQiOiJKaXR0ZXIiLCJhbmltX2NoYW5nZXIubW92ZV9sZWFuIjoxMDAuMCwiYjFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImIxR2xvYmFsQSI6dHJ1ZSwiYjFHbG9iYWxBKyI6dHJ1ZSwiYjFHbG9iYWxDIjp0cnVlLCJiMUdsb2JhbEZEIjp0cnVlLCJiMUdsb2JhbEZMIjp0cnVlLCJiMUdsb2JhbEciOnRydWUsImIxR2xvYmFsTSI6dHJ1ZSwiYjFHbG9iYWxTIjp0cnVlLCJiMUdsb2JhbFNXIjp0cnVlLCJiMVRlcnJvcmlzdEEiOmZhbHNlLCJiMVRlcnJvcmlzdEErIjpmYWxzZSwiYjFUZXJyb3Jpc3RDIjpmYWxzZSwiYjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImIxVGVycm9yaXN0RkwiOmZhbHNlLCJiMVRlcnJvcmlzdEciOmZhbHNlLCJiMVRlcnJvcmlzdE0iOmZhbHNlLCJiMVRlcnJvcmlzdFMiOmZhbHNlLCJiMVRlcnJvcmlzdFNXIjpmYWxzZSwiYjJDb3VudGVyLVRlcnJvcmlzdEEiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RGRCI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdE0iOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImIyR2xvYmFsQSI6IkRvd24iLCJiMkdsb2JhbEErIjoiRG93biIsImIyR2xvYmFsQyI6IkRvd24iLCJiMkdsb2JhbEZEIjoiRG93biIsImIyR2xvYmFsRkwiOiJEb3duIiwiYjJHbG9iYWxHIjoiRG93biIsImIyR2xvYmFsTSI6IkRvd24iLCJiMkdsb2JhbFMiOiJEb3duIiwiYjJHbG9iYWxTVyI6IkRvd24iLCJiMlRlcnJvcmlzdEEiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RGRCI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdE0iOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjNDb3VudGVyLVRlcnJvcmlzdEEiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEErIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RDIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RGRCI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RkwiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEciOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdE0iOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdFMiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiTG9jYWwgVmlldyIsImIzR2xvYmFsQSI6IkF0IFRhcmdldCIsImIzR2xvYmFsQSsiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEMiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZEIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxGTCI6IkF0IFRhcmdldCIsImIzR2xvYmFsRyI6IkF0IFRhcmdldCIsImIzR2xvYmFsTSI6IkF0IFRhcmdldCIsImIzR2xvYmFsUyI6IkF0IFRhcmdldCIsImIzR2xvYmFsU1ciOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEEiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RBKyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEMiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RGRCI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEZMIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdE0iOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RTIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0U1ciOiJMb2NhbCBWaWV3IiwiYjRDb3VudGVyLVRlcnJvcmlzdEEiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RGRCI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdE0iOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImI0R2xvYmFsQSI6IkNlbnRlciIsImI0R2xvYmFsQSsiOiJDZW50ZXIiLCJiNEdsb2JhbEMiOiJDZW50ZXIiLCJiNEdsb2JhbEZEIjoiQ2VudGVyIiwiYjRHbG9iYWxGTCI6IkNlbnRlciIsImI0R2xvYmFsRyI6IkNlbnRlciIsImI0R2xvYmFsTSI6IkNlbnRlciIsImI0R2xvYmFsUyI6IkNlbnRlciIsImI0R2xvYmFsU1ciOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEEiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RGRCI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdE0iOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjVDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImI1R2xvYmFsQSI6dHJ1ZSwiYjVHbG9iYWxBKyI6dHJ1ZSwiYjVHbG9iYWxDIjp0cnVlLCJiNUdsb2JhbEZEIjp0cnVlLCJiNUdsb2JhbEZMIjp0cnVlLCJiNUdsb2JhbEciOnRydWUsImI1R2xvYmFsTSI6dHJ1ZSwiYjVHbG9iYWxTIjp0cnVlLCJiNUdsb2JhbFNXIjp0cnVlLCJiNVRlcnJvcmlzdEEiOmZhbHNlLCJiNVRlcnJvcmlzdEErIjpmYWxzZSwiYjVUZXJyb3Jpc3RDIjpmYWxzZSwiYjVUZXJyb3Jpc3RGRCI6ZmFsc2UsImI1VGVycm9yaXN0RkwiOmZhbHNlLCJiNVRlcnJvcmlzdEciOmZhbHNlLCJiNVRlcnJvcmlzdE0iOmZhbHNlLCJiNVRlcnJvcmlzdFMiOmZhbHNlLCJiNVRlcnJvcmlzdFNXIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImI2R2xvYmFsQSI6dHJ1ZSwiYjZHbG9iYWxBKyI6dHJ1ZSwiYjZHbG9iYWxDIjp0cnVlLCJiNkdsb2JhbEZEIjpmYWxzZSwiYjZHbG9iYWxGTCI6ZmFsc2UsImI2R2xvYmFsRyI6dHJ1ZSwiYjZHbG9iYWxNIjpmYWxzZSwiYjZHbG9iYWxTIjpmYWxzZSwiYjZHbG9iYWxTVyI6dHJ1ZSwiYjZUZXJyb3Jpc3RBIjpmYWxzZSwiYjZUZXJyb3Jpc3RBKyI6ZmFsc2UsImI2VGVycm9yaXN0QyI6ZmFsc2UsImI2VGVycm9yaXN0RkQiOmZhbHNlLCJiNlRlcnJvcmlzdEZMIjpmYWxzZSwiYjZUZXJyb3Jpc3RHIjpmYWxzZSwiYjZUZXJyb3Jpc3RNIjpmYWxzZSwiYjZUZXJyb3Jpc3RTIjpmYWxzZSwiYjZUZXJyb3Jpc3RTVyI6ZmFsc2UsImMxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEEiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsQSsiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsQyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxGRCI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxGTCI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxHIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbE0iOiIxODAgRGVncmVlcyIsImMxR2xvYmFsUyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxTVyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImMyQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJjMkdsb2JhbEEiOjExLjAsImMyR2xvYmFsQSsiOjEzLjAsImMyR2xvYmFsQyI6MTMuMCwiYzJHbG9iYWxGRCI6OC4wLCJjMkdsb2JhbEZMIjo4LjAsImMyR2xvYmFsRyI6OS4wLCJjMkdsb2JhbE0iOjExLjAsImMyR2xvYmFsUyI6MTAuMCwiYzJHbG9iYWxTVyI6OS4wLCJjMlRlcnJvcmlzdEEiOjAuMCwiYzJUZXJyb3Jpc3RBKyI6MC4wLCJjMlRlcnJvcmlzdEMiOjAuMCwiYzJUZXJyb3Jpc3RGRCI6MC4wLCJjMlRlcnJvcmlzdEZMIjowLjAsImMyVGVycm9yaXN0RyI6MC4wLCJjMlRlcnJvcmlzdE0iOjAuMCwiYzJUZXJyb3Jpc3RTIjowLjAsImMyVGVycm9yaXN0U1ciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImMzR2xvYmFsQSI6MC4wLCJjM0dsb2JhbEErIjowLjAsImMzR2xvYmFsQyI6MC4wLCJjM0dsb2JhbEZEIjowLjAsImMzR2xvYmFsRkwiOjAuMCwiYzNHbG9iYWxHIjowLjAsImMzR2xvYmFsTSI6MC4wLCJjM0dsb2JhbFMiOjAuMCwiYzNHbG9iYWxTVyI6MC4wLCJjM1RlcnJvcmlzdEEiOjAuMCwiYzNUZXJyb3Jpc3RBKyI6MC4wLCJjM1RlcnJvcmlzdEMiOjAuMCwiYzNUZXJyb3Jpc3RGRCI6MC4wLCJjM1RlcnJvcmlzdEZMIjowLjAsImMzVGVycm9yaXN0RyI6MC4wLCJjM1RlcnJvcmlzdE0iOjAuMCwiYzNUZXJyb3Jpc3RTIjowLjAsImMzVGVycm9yaXN0U1ciOjAuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEEiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEErIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RDIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGRCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkwiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEciOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdE0iOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFNXIjoyLjAsImM0R2xvYmFsQSI6Mi4wLCJjNEdsb2JhbEErIjoyLjAsImM0R2xvYmFsQyI6Mi4wLCJjNEdsb2JhbEZEIjoyLjAsImM0R2xvYmFsRkwiOjIuMCwiYzRHbG9iYWxHIjoyLjAsImM0R2xvYmFsTSI6Mi4wLCJjNEdsb2JhbFMiOjIuMCwiYzRHbG9iYWxTVyI6Mi4wLCJjNFRlcnJvcmlzdEEiOjIuMCwiYzRUZXJyb3Jpc3RBKyI6Mi4wLCJjNFRlcnJvcmlzdEMiOjIuMCwiYzRUZXJyb3Jpc3RGRCI6Mi4wLCJjNFRlcnJvcmlzdEZMIjoyLjAsImM0VGVycm9yaXN0RyI6Mi4wLCJjNFRlcnJvcmlzdE0iOjIuMCwiYzRUZXJyb3Jpc3RTIjoyLjAsImM0VGVycm9yaXN0U1ciOjIuMCwiY29uZmlnX3R5cGUiOiJhbnRpYWltIiwiZDFDb3VudGVyLVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxBKyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsTSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxTIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbFNXIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQyR2xvYmFsQSI6LTcxLjAsImQyR2xvYmFsQSsiOi03OC4wLCJkMkdsb2JhbEMiOi04NC4wLCJkMkdsb2JhbEZEIjotNTguMCwiZDJHbG9iYWxGTCI6LTU4LjAsImQyR2xvYmFsRyI6LTcxLjAsImQyR2xvYmFsTSI6LTg1LjAsImQyR2xvYmFsUyI6LTUxLjAsImQyR2xvYmFsU1ciOi02NS4wLCJkMlRlcnJvcmlzdEEiOjAuMCwiZDJUZXJyb3Jpc3RBKyI6MC4wLCJkMlRlcnJvcmlzdEMiOjAuMCwiZDJUZXJyb3Jpc3RGRCI6MC4wLCJkMlRlcnJvcmlzdEZMIjowLjAsImQyVGVycm9yaXN0RyI6MC4wLCJkMlRlcnJvcmlzdE0iOjAuMCwiZDJUZXJyb3Jpc3RTIjowLjAsImQyVGVycm9yaXN0U1ciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQzR2xvYmFsQSI6MC4wLCJkM0dsb2JhbEErIjotNTguMCwiZDNHbG9iYWxDIjotNjQuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjowLjAsImQzR2xvYmFsRyI6MC4wLCJkM0dsb2JhbE0iOi03MS4wLCJkM0dsb2JhbFMiOjAuMCwiZDNHbG9iYWxTVyI6MC4wLCJkM1RlcnJvcmlzdEEiOjAuMCwiZDNUZXJyb3Jpc3RBKyI6MC4wLCJkM1RlcnJvcmlzdEMiOjAuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOjAuMCwiZDNUZXJyb3Jpc3RTIjowLjAsImQzVGVycm9yaXN0U1ciOjAuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6ZmFsc2UsImUxR2xvYmFsQSsiOmZhbHNlLCJlMUdsb2JhbEMiOmZhbHNlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6ZmFsc2UsImUxR2xvYmFsUyI6ZmFsc2UsImUxR2xvYmFsU1ciOmZhbHNlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6IlJhbmRvbSIsImUyR2xvYmFsQSsiOiJSYW5kb20iLCJlMkdsb2JhbEMiOiJSYW5kb20iLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6IlJhbmRvbSIsImUyR2xvYmFsUyI6IlJhbmRvbSIsImUyR2xvYmFsU1ciOiJSYW5kb20iLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6NjAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QSsiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGTCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RHIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdE0iOltdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTVyI6W10sImU1R2xvYmFsQSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxBKyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxDIjpbIkppdHRlciJdLCJlNUdsb2JhbEZEIjpbIkppdHRlciJdLCJlNUdsb2JhbEZMIjpbIkppdHRlciJdLCJlNUdsb2JhbEciOlsiSml0dGVyIl0sImU1R2xvYmFsTSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTIjpbIkppdHRlciJdLCJlNUdsb2JhbFNXIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEEiOltdLCJlNVRlcnJvcmlzdEErIjpbXSwiZTVUZXJyb3Jpc3RDIjpbXSwiZTVUZXJyb3Jpc3RGRCI6W10sImU1VGVycm9yaXN0RkwiOltdLCJlNVRlcnJvcmlzdEciOltdLCJlNVRlcnJvcmlzdE0iOltdLCJlNVRlcnJvcmlzdFMiOltdLCJlNVRlcnJvcmlzdFNXIjpbXSwiZTZDb3VudGVyLVRlcnJvcmlzdEEiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QSsiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGRCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGTCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RHIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdE0iOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0UyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTVyI6Ik9mZiIsImU2R2xvYmFsQSI6Ik9mZiIsImU2R2xvYmFsQSsiOiJPZmYiLCJlNkdsb2JhbEMiOiJPZmYiLCJlNkdsb2JhbEZEIjoiT2ZmIiwiZTZHbG9iYWxGTCI6Ik9mZiIsImU2R2xvYmFsRyI6Ik9mZiIsImU2R2xvYmFsTSI6Ik9mZiIsImU2R2xvYmFsUyI6Ik9mZiIsImU2R2xvYmFsU1ciOiJPZmYiLCJlNlRlcnJvcmlzdEEiOiJPZmYiLCJlNlRlcnJvcmlzdEErIjoiT2ZmIiwiZTZUZXJyb3Jpc3RDIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGRCI6Ik9mZiIsImU2VGVycm9yaXN0RkwiOiJPZmYiLCJlNlRlcnJvcmlzdEciOiJPZmYiLCJlNlRlcnJvcmlzdE0iOiJPZmYiLCJlNlRlcnJvcmlzdFMiOiJPZmYiLCJlNlRlcnJvcmlzdFNXIjoiT2ZmIiwiZjFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImYxR2xvYmFsQSI6dHJ1ZSwiZjFHbG9iYWxBKyI6dHJ1ZSwiZjFHbG9iYWxDIjp0cnVlLCJmMUdsb2JhbEZEIjpmYWxzZSwiZjFHbG9iYWxGTCI6ZmFsc2UsImYxR2xvYmFsRyI6dHJ1ZSwiZjFHbG9iYWxNIjp0cnVlLCJmMUdsb2JhbFMiOmZhbHNlLCJmMUdsb2JhbFNXIjp0cnVlLCJmMVRlcnJvcmlzdEEiOmZhbHNlLCJmMVRlcnJvcmlzdEErIjpmYWxzZSwiZjFUZXJyb3Jpc3RDIjpmYWxzZSwiZjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImYxVGVycm9yaXN0RkwiOmZhbHNlLCJmMVRlcnJvcmlzdEciOmZhbHNlLCJmMVRlcnJvcmlzdE0iOmZhbHNlLCJmMVRlcnJvcmlzdFMiOmZhbHNlLCJmMVRlcnJvcmlzdFNXIjpmYWxzZSwiZjJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYyR2xvYmFsQSI6IlVwIiwiZjJHbG9iYWxBKyI6IlVwIiwiZjJHbG9iYWxDIjoiVXAiLCJmMkdsb2JhbEZEIjoiTm9uZSIsImYyR2xvYmFsRkwiOiJOb25lIiwiZjJHbG9iYWxHIjoiU2VtaS1VcCIsImYyR2xvYmFsTSI6IlNlbWktVXAiLCJmMkdsb2JhbFMiOiJTZW1pLURvd24iLCJmMkdsb2JhbFNXIjoiVXAiLCJmMlRlcnJvcmlzdEEiOiJOb25lIiwiZjJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmMlRlcnJvcmlzdEMiOiJOb25lIiwiZjJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZMIjoiTm9uZSIsImYyVGVycm9yaXN0RyI6Ik5vbmUiLCJmMlRlcnJvcmlzdE0iOiJOb25lIiwiZjJUZXJyb3Jpc3RTIjoiTm9uZSIsImYyVGVycm9yaXN0U1ciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYzR2xvYmFsQSI6IjMtV2F5IiwiZjNHbG9iYWxBKyI6IlNpZGV3YXlzIiwiZjNHbG9iYWxDIjoiQ3VzdG9tIiwiZjNHbG9iYWxGRCI6Ik5vbmUiLCJmM0dsb2JhbEZMIjoiTm9uZSIsImYzR2xvYmFsRyI6IlNpZGV3YXlzIiwiZjNHbG9iYWxNIjoiU2lkZXdheXMiLCJmM0dsb2JhbFMiOiJTaWRld2F5cyIsImYzR2xvYmFsU1ciOiJOb25lIiwiZjNUZXJyb3Jpc3RBIjoiTm9uZSIsImYzVGVycm9yaXN0QSsiOiJOb25lIiwiZjNUZXJyb3Jpc3RDIjoiTm9uZSIsImYzVGVycm9yaXN0RkQiOiJOb25lIiwiZjNUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEciOiJOb25lIiwiZjNUZXJyb3Jpc3RNIjoiTm9uZSIsImYzVGVycm9yaXN0UyI6Ik5vbmUiLCJmM1RlcnJvcmlzdFNXIjoiTm9uZSIsImY0Q291bnRlci1UZXJyb3Jpc3RBIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RBKyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RkQiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZMIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RHIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RNIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTVyI6NS4wLCJmNEdsb2JhbEEiOjAuMCwiZjRHbG9iYWxBKyI6MTAwLjAsImY0R2xvYmFsQyI6NS4wLCJmNEdsb2JhbEZEIjo1LjAsImY0R2xvYmFsRkwiOjUuMCwiZjRHbG9iYWxHIjoyLjAsImY0R2xvYmFsTSI6MjkuMCwiZjRHbG9iYWxTIjo4LjAsImY0R2xvYmFsU1ciOjUuMCwiZjRUZXJyb3Jpc3RBIjo1LjAsImY0VGVycm9yaXN0QSsiOjUuMCwiZjRUZXJyb3Jpc3RDIjo1LjAsImY0VGVycm9yaXN0RkQiOjUuMCwiZjRUZXJyb3Jpc3RGTCI6NS4wLCJmNFRlcnJvcmlzdEciOjUuMCwiZjRUZXJyb3Jpc3RNIjo1LjAsImY0VGVycm9yaXN0UyI6NS4wLCJmNFRlcnJvcmlzdFNXIjo1LjAsImY1Q291bnRlci1UZXJyb3Jpc3RBIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RHIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RNIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RTIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJmNUdsb2JhbEEiOjAuMCwiZjVHbG9iYWxBKyI6MC4wLCJmNUdsb2JhbEMiOjEwLjAsImY1R2xvYmFsRkQiOjAuMCwiZjVHbG9iYWxGTCI6MC4wLCJmNUdsb2JhbEciOjAuMCwiZjVHbG9iYWxNIjowLjAsImY1R2xvYmFsUyI6MC4wLCJmNUdsb2JhbFNXIjowLjAsImY1VGVycm9yaXN0QSI6MC4wLCJmNVRlcnJvcmlzdEErIjowLjAsImY1VGVycm9yaXN0QyI6MC4wLCJmNVRlcnJvcmlzdEZEIjowLjAsImY1VGVycm9yaXN0RkwiOjAuMCwiZjVUZXJyb3Jpc3RHIjowLjAsImY1VGVycm9yaXN0TSI6MC4wLCJmNVRlcnJvcmlzdFMiOjAuMCwiZjVUZXJyb3Jpc3RTVyI6MC4wLCJmYWtlX2xhZ19jb3JyZWN0aW9ucyI6WyJEb3VibGUgVGFwIiwiSGlkZSBTaG90cyJdLCJsaXN0X3NldHRpbmdzIjozLjAsIm1hbnVhbF9kaXNfYiI6ZmFsc2UsIm1hbnVhbF9kaXNfeWF3X20iOnRydWUsIm1hbnVhbF9vIjo5MC4wLCJtYW51YWxfeSI6IkRpc2FibGVkIiwibXNfYW50aWFpbSI6dHJ1ZSwicGxheWVyX3NpZGUiOiJHbG9iYWwiLCJzYWZlX2hlYWQiOltdLCJzZXR0aW5ncyI6WyJBbnRpIEFpbSBPbiBXYXJtdXAiLCJBbnRpIEFpbSBPbiBVc2UiLCJBdm9pZCBCYWNrc3RhYiIsIkZhc3QgQ2xpbWIgTGFkZGVyIl19 [citrine]"));
end, true);
default4_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\208\148\208\182\208\184\209\130\209\130\208\181\209\128", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiRmFrZWxhZ2dpbmciLCJhMlRlcnJvcmlzdCI6Ikdsb2JhbCIsImIxQ291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiMUdsb2JhbEEiOnRydWUsImIxR2xvYmFsQSsiOnRydWUsImIxR2xvYmFsQyI6dHJ1ZSwiYjFHbG9iYWxGRCI6dHJ1ZSwiYjFHbG9iYWxGTCI6dHJ1ZSwiYjFHbG9iYWxHIjp0cnVlLCJiMUdsb2JhbE0iOnRydWUsImIxR2xvYmFsUyI6dHJ1ZSwiYjFHbG9iYWxTVyI6dHJ1ZSwiYjFUZXJyb3Jpc3RBIjpmYWxzZSwiYjFUZXJyb3Jpc3RBKyI6ZmFsc2UsImIxVGVycm9yaXN0QyI6ZmFsc2UsImIxVGVycm9yaXN0RkQiOmZhbHNlLCJiMVRlcnJvcmlzdEZMIjpmYWxzZSwiYjFUZXJyb3Jpc3RHIjpmYWxzZSwiYjFUZXJyb3Jpc3RNIjpmYWxzZSwiYjFUZXJyb3Jpc3RTIjpmYWxzZSwiYjFUZXJyb3Jpc3RTVyI6ZmFsc2UsImIyQ291bnRlci1UZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiMkdsb2JhbEEiOiJEb3duIiwiYjJHbG9iYWxBKyI6IkRvd24iLCJiMkdsb2JhbEMiOiJEb3duIiwiYjJHbG9iYWxGRCI6IkRvd24iLCJiMkdsb2JhbEZMIjoiRG93biIsImIyR2xvYmFsRyI6IkRvd24iLCJiMkdsb2JhbE0iOiJEb3duIiwiYjJHbG9iYWxTIjoiRG93biIsImIyR2xvYmFsU1ciOiJEb3duIiwiYjJUZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImIzQ291bnRlci1UZXJyb3Jpc3RBIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RBKyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0QyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RkQiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEZMIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RNIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RTIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RTVyI6IkxvY2FsIFZpZXciLCJiM0dsb2JhbEEiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEErIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxDIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxGRCI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkwiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEciOiJBdCBUYXJnZXQiLCJiM0dsb2JhbE0iOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFMiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFNXIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RBIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0QSsiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RDIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RkQiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RGTCI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEciOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RNIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0UyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdFNXIjoiTG9jYWwgVmlldyIsImI0Q291bnRlci1UZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0QSsiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RGTCI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0UyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiNEdsb2JhbEEiOiJDZW50ZXIiLCJiNEdsb2JhbEErIjoiQ2VudGVyIiwiYjRHbG9iYWxDIjoiQ2VudGVyIiwiYjRHbG9iYWxGRCI6IkNlbnRlciIsImI0R2xvYmFsRkwiOiJDZW50ZXIiLCJiNEdsb2JhbEciOiJDZW50ZXIiLCJiNEdsb2JhbE0iOiJDZW50ZXIiLCJiNEdsb2JhbFMiOiJDZW50ZXIiLCJiNEdsb2JhbFNXIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RBIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEMiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RkQiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RNIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0U1ciOiJEaXNhYmxlZCIsImI1Q291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiNUdsb2JhbEEiOnRydWUsImI1R2xvYmFsQSsiOnRydWUsImI1R2xvYmFsQyI6dHJ1ZSwiYjVHbG9iYWxGRCI6dHJ1ZSwiYjVHbG9iYWxGTCI6dHJ1ZSwiYjVHbG9iYWxHIjp0cnVlLCJiNUdsb2JhbE0iOnRydWUsImI1R2xvYmFsUyI6dHJ1ZSwiYjVHbG9iYWxTVyI6dHJ1ZSwiYjVUZXJyb3Jpc3RBIjpmYWxzZSwiYjVUZXJyb3Jpc3RBKyI6ZmFsc2UsImI1VGVycm9yaXN0QyI6ZmFsc2UsImI1VGVycm9yaXN0RkQiOmZhbHNlLCJiNVRlcnJvcmlzdEZMIjpmYWxzZSwiYjVUZXJyb3Jpc3RHIjpmYWxzZSwiYjVUZXJyb3Jpc3RNIjpmYWxzZSwiYjVUZXJyb3Jpc3RTIjpmYWxzZSwiYjVUZXJyb3Jpc3RTVyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEErIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEMiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RkQiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RkwiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RNIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFMiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0U1ciOmZhbHNlLCJiNkdsb2JhbEEiOmZhbHNlLCJiNkdsb2JhbEErIjpmYWxzZSwiYjZHbG9iYWxDIjpmYWxzZSwiYjZHbG9iYWxGRCI6ZmFsc2UsImI2R2xvYmFsRkwiOmZhbHNlLCJiNkdsb2JhbEciOnRydWUsImI2R2xvYmFsTSI6ZmFsc2UsImI2R2xvYmFsUyI6ZmFsc2UsImI2R2xvYmFsU1ciOmZhbHNlLCJiNlRlcnJvcmlzdEEiOmZhbHNlLCJiNlRlcnJvcmlzdEErIjpmYWxzZSwiYjZUZXJyb3Jpc3RDIjpmYWxzZSwiYjZUZXJyb3Jpc3RGRCI6ZmFsc2UsImI2VGVycm9yaXN0RkwiOmZhbHNlLCJiNlRlcnJvcmlzdEciOmZhbHNlLCJiNlRlcnJvcmlzdE0iOmZhbHNlLCJiNlRlcnJvcmlzdFMiOmZhbHNlLCJiNlRlcnJvcmlzdFNXIjpmYWxzZSwiYzFDb3VudGVyLVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImMxR2xvYmFsQSI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBKyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImMxR2xvYmFsTSI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxTIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFNXIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzJDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImMyR2xvYmFsQSI6NS4wLCJjMkdsb2JhbEErIjoxMC4wLCJjMkdsb2JhbEMiOjguMCwiYzJHbG9iYWxGRCI6OC4wLCJjMkdsb2JhbEZMIjo4LjAsImMyR2xvYmFsRyI6OS4wLCJjMkdsb2JhbE0iOjEwLjAsImMyR2xvYmFsUyI6Ni4wLCJjMkdsb2JhbFNXIjo2LjAsImMyVGVycm9yaXN0QSI6MC4wLCJjMlRlcnJvcmlzdEErIjowLjAsImMyVGVycm9yaXN0QyI6MC4wLCJjMlRlcnJvcmlzdEZEIjowLjAsImMyVGVycm9yaXN0RkwiOjAuMCwiYzJUZXJyb3Jpc3RHIjowLjAsImMyVGVycm9yaXN0TSI6MC4wLCJjMlRlcnJvcmlzdFMiOjAuMCwiYzJUZXJyb3Jpc3RTVyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiYzNHbG9iYWxBIjozNy4wLCJjM0dsb2JhbEErIjoyNi4wLCJjM0dsb2JhbEMiOjQxLjAsImMzR2xvYmFsRkQiOjAuMCwiYzNHbG9iYWxGTCI6MC4wLCJjM0dsb2JhbEciOjAuMCwiYzNHbG9iYWxNIjozMC4wLCJjM0dsb2JhbFMiOjQxLjAsImMzR2xvYmFsU1ciOjEuMCwiYzNUZXJyb3Jpc3RBIjowLjAsImMzVGVycm9yaXN0QSsiOjAuMCwiYzNUZXJyb3Jpc3RDIjowLjAsImMzVGVycm9yaXN0RkQiOjAuMCwiYzNUZXJyb3Jpc3RGTCI6MC4wLCJjM1RlcnJvcmlzdEciOjAuMCwiYzNUZXJyb3Jpc3RNIjowLjAsImMzVGVycm9yaXN0UyI6MC4wLCJjM1RlcnJvcmlzdFNXIjowLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBKyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0QyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkQiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEZMIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RHIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RNIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTVyI6Mi4wLCJjNEdsb2JhbEEiOjkuMCwiYzRHbG9iYWxBKyI6MTkuMCwiYzRHbG9iYWxDIjo5LjAsImM0R2xvYmFsRkQiOjIuMCwiYzRHbG9iYWxGTCI6Mi4wLCJjNEdsb2JhbEciOjIuMCwiYzRHbG9iYWxNIjoxMC4wLCJjNEdsb2JhbFMiOjkuMCwiYzRHbG9iYWxTVyI6MTAuMCwiYzRUZXJyb3Jpc3RBIjoyLjAsImM0VGVycm9yaXN0QSsiOjIuMCwiYzRUZXJyb3Jpc3RDIjoyLjAsImM0VGVycm9yaXN0RkQiOjIuMCwiYzRUZXJyb3Jpc3RGTCI6Mi4wLCJjNFRlcnJvcmlzdEciOjIuMCwiYzRUZXJyb3Jpc3RNIjoyLjAsImM0VGVycm9yaXN0UyI6Mi4wLCJjNFRlcnJvcmlzdFNXIjoyLjAsImNvbmZpZ190eXBlIjoiYW50aWFpbSIsImQxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEEiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSsiOiJMZWZ0ICYgUmlnaHQiLCJkMUdsb2JhbEMiOiJMZWZ0ICYgUmlnaHQiLCJkMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsTSI6IkxlZnQgJiBSaWdodCIsImQxR2xvYmFsUyI6IkxlZnQgJiBSaWdodCIsImQxR2xvYmFsU1ciOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQyR2xvYmFsQSI6LTc4LjAsImQyR2xvYmFsQSsiOi0xMDAuMCwiZDJHbG9iYWxDIjotMTAwLjAsImQyR2xvYmFsRkQiOi04MC4wLCJkMkdsb2JhbEZMIjotODcuMCwiZDJHbG9iYWxHIjotNzEuMCwiZDJHbG9iYWxNIjotMTA1LjAsImQyR2xvYmFsUyI6LTcxLjAsImQyR2xvYmFsU1ciOi0xMDUuMCwiZDJUZXJyb3Jpc3RBIjowLjAsImQyVGVycm9yaXN0QSsiOjAuMCwiZDJUZXJyb3Jpc3RDIjowLjAsImQyVGVycm9yaXN0RkQiOjAuMCwiZDJUZXJyb3Jpc3RGTCI6MC4wLCJkMlRlcnJvcmlzdEciOjAuMCwiZDJUZXJyb3Jpc3RNIjowLjAsImQyVGVycm9yaXN0UyI6MC4wLCJkMlRlcnJvcmlzdFNXIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJkM0dsb2JhbEEiOi01MS4wLCJkM0dsb2JhbEErIjotODUuMCwiZDNHbG9iYWxDIjotODUuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjotNTguMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTkwLjAsImQzR2xvYmFsUyI6LTg1LjAsImQzR2xvYmFsU1ciOi05MC4wLCJkM1RlcnJvcmlzdEEiOjAuMCwiZDNUZXJyb3Jpc3RBKyI6MC4wLCJkM1RlcnJvcmlzdEMiOjAuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOjAuMCwiZDNUZXJyb3Jpc3RTIjowLjAsImQzVGVycm9yaXN0U1ciOjAuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6dHJ1ZSwiZTFHbG9iYWxBKyI6dHJ1ZSwiZTFHbG9iYWxDIjp0cnVlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6dHJ1ZSwiZTFHbG9iYWxTIjp0cnVlLCJlMUdsb2JhbFNXIjp0cnVlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6NjAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QSsiOltdLCJlNUNvdW50ZXItVGVycm9yaXN0QyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RGTCI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RHIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdE0iOltdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTVyI6W10sImU1R2xvYmFsQSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxBKyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxDIjpbIkppdHRlciJdLCJlNUdsb2JhbEZEIjpbIkppdHRlciJdLCJlNUdsb2JhbEZMIjpbIkppdHRlciJdLCJlNUdsb2JhbEciOlsiSml0dGVyIl0sImU1R2xvYmFsTSI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTIjpbIkppdHRlciJdLCJlNUdsb2JhbFNXIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEEiOltdLCJlNVRlcnJvcmlzdEErIjpbXSwiZTVUZXJyb3Jpc3RDIjpbXSwiZTVUZXJyb3Jpc3RGRCI6W10sImU1VGVycm9yaXN0RkwiOltdLCJlNVRlcnJvcmlzdEciOltdLCJlNVRlcnJvcmlzdE0iOltdLCJlNVRlcnJvcmlzdFMiOltdLCJlNVRlcnJvcmlzdFNXIjpbXSwiZTZDb3VudGVyLVRlcnJvcmlzdEEiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QSsiOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0QyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGRCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RGTCI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RHIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdE0iOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0UyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTVyI6Ik9mZiIsImU2R2xvYmFsQSI6Ik9mZiIsImU2R2xvYmFsQSsiOiJPZmYiLCJlNkdsb2JhbEMiOiJPZmYiLCJlNkdsb2JhbEZEIjoiT2ZmIiwiZTZHbG9iYWxGTCI6Ik9mZiIsImU2R2xvYmFsRyI6Ik9mZiIsImU2R2xvYmFsTSI6Ik9mZiIsImU2R2xvYmFsUyI6Ik9mZiIsImU2R2xvYmFsU1ciOiJPZmYiLCJlNlRlcnJvcmlzdEEiOiJPZmYiLCJlNlRlcnJvcmlzdEErIjoiT2ZmIiwiZTZUZXJyb3Jpc3RDIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGRCI6Ik9mZiIsImU2VGVycm9yaXN0RkwiOiJPZmYiLCJlNlRlcnJvcmlzdEciOiJPZmYiLCJlNlRlcnJvcmlzdE0iOiJPZmYiLCJlNlRlcnJvcmlzdFMiOiJPZmYiLCJlNlRlcnJvcmlzdFNXIjoiT2ZmIiwiZjFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImYxR2xvYmFsQSI6dHJ1ZSwiZjFHbG9iYWxBKyI6dHJ1ZSwiZjFHbG9iYWxDIjp0cnVlLCJmMUdsb2JhbEZEIjpmYWxzZSwiZjFHbG9iYWxGTCI6ZmFsc2UsImYxR2xvYmFsRyI6dHJ1ZSwiZjFHbG9iYWxNIjp0cnVlLCJmMUdsb2JhbFMiOnRydWUsImYxR2xvYmFsU1ciOnRydWUsImYxVGVycm9yaXN0QSI6ZmFsc2UsImYxVGVycm9yaXN0QSsiOmZhbHNlLCJmMVRlcnJvcmlzdEMiOmZhbHNlLCJmMVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFUZXJyb3Jpc3RGTCI6ZmFsc2UsImYxVGVycm9yaXN0RyI6ZmFsc2UsImYxVGVycm9yaXN0TSI6ZmFsc2UsImYxVGVycm9yaXN0UyI6ZmFsc2UsImYxVGVycm9yaXN0U1ciOmZhbHNlLCJmMkNvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjJHbG9iYWxBIjoiRXhwZXJpbWVudGFsIiwiZjJHbG9iYWxBKyI6IlVwIiwiZjJHbG9iYWxDIjoiTWV0YSIsImYyR2xvYmFsRkQiOiJOb25lIiwiZjJHbG9iYWxGTCI6Ik5vbmUiLCJmMkdsb2JhbEciOiJTZW1pLVVwIiwiZjJHbG9iYWxNIjoiVXAiLCJmMkdsb2JhbFMiOiJFeHBlcmltZW50YWwiLCJmMkdsb2JhbFNXIjoiRXhwZXJpbWVudGFsIiwiZjJUZXJyb3Jpc3RBIjoiTm9uZSIsImYyVGVycm9yaXN0QSsiOiJOb25lIiwiZjJUZXJyb3Jpc3RDIjoiTm9uZSIsImYyVGVycm9yaXN0RkQiOiJOb25lIiwiZjJUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmMlRlcnJvcmlzdEciOiJOb25lIiwiZjJUZXJyb3Jpc3RNIjoiTm9uZSIsImYyVGVycm9yaXN0UyI6Ik5vbmUiLCJmMlRlcnJvcmlzdFNXIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RBIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RkQiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZMIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RHIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RNIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RTIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0dsb2JhbEEiOiJSYW5kb20iLCJmM0dsb2JhbEErIjoiU2lkZXdheXMiLCJmM0dsb2JhbEMiOiJOb25lIiwiZjNHbG9iYWxGRCI6Ik5vbmUiLCJmM0dsb2JhbEZMIjoiTm9uZSIsImYzR2xvYmFsRyI6IlNpZGV3YXlzIiwiZjNHbG9iYWxNIjoiTm9uZSIsImYzR2xvYmFsUyI6IjMtV2F5IiwiZjNHbG9iYWxTVyI6IlJhbmRvbSIsImYzVGVycm9yaXN0QSI6Ik5vbmUiLCJmM1RlcnJvcmlzdEErIjoiTm9uZSIsImYzVGVycm9yaXN0QyI6Ik5vbmUiLCJmM1RlcnJvcmlzdEZEIjoiTm9uZSIsImYzVGVycm9yaXN0RkwiOiJOb25lIiwiZjNUZXJyb3Jpc3RHIjoiTm9uZSIsImYzVGVycm9yaXN0TSI6Ik5vbmUiLCJmM1RlcnJvcmlzdFMiOiJOb25lIiwiZjNUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmNENvdW50ZXItVGVycm9yaXN0QSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QSsiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZEIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGTCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0TSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0UyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0U1ciOjUuMCwiZjRHbG9iYWxBIjo0Ni4wLCJmNEdsb2JhbEErIjo2My4wLCJmNEdsb2JhbEMiOjQ4LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjo2MC4wLCJmNEdsb2JhbFMiOjU2LjAsImY0R2xvYmFsU1ciOjEwMC4wLCJmNFRlcnJvcmlzdEEiOjUuMCwiZjRUZXJyb3Jpc3RBKyI6NS4wLCJmNFRlcnJvcmlzdEMiOjUuMCwiZjRUZXJyb3Jpc3RGRCI6NS4wLCJmNFRlcnJvcmlzdEZMIjo1LjAsImY0VGVycm9yaXN0RyI6NS4wLCJmNFRlcnJvcmlzdE0iOjUuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MTgwLjAsImY1R2xvYmFsQSsiOjEzLjAsImY1R2xvYmFsQyI6MTMuMCwiZjVHbG9iYWxGRCI6MC4wLCJmNUdsb2JhbEZMIjowLjAsImY1R2xvYmFsRyI6MC4wLCJmNUdsb2JhbE0iOi0xMC4wLCJmNUdsb2JhbFMiOjEwLjAsImY1R2xvYmFsU1ciOjAuMCwiZjVUZXJyb3Jpc3RBIjowLjAsImY1VGVycm9yaXN0QSsiOjAuMCwiZjVUZXJyb3Jpc3RDIjowLjAsImY1VGVycm9yaXN0RkQiOjAuMCwiZjVUZXJyb3Jpc3RGTCI6MC4wLCJmNVRlcnJvcmlzdEciOjAuMCwiZjVUZXJyb3Jpc3RNIjowLjAsImY1VGVycm9yaXN0UyI6MC4wLCJmNVRlcnJvcmlzdFNXIjowLjAsInBsYXllcl9zaWRlIjoiR2xvYmFsIn0= [citrine]"));
end, true);
default1_antiaim:tooltip("Aggresive");
default2_antiaim:tooltip("Aggresive #2");
default3_antiaim:tooltip("Experimental");
default4_antiaim:tooltip("Jitter");
configs_label = ui.create("\240\159\142\175", "\n\n", 1):label("Update:");
default1NEW_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\209\129\208\181\208\185\208\178\209\139", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6IkNyb3VjaGluZyIsImEyR2xvYmFsIjoiQ3JvdWNoaW5nIiwiYTJUZXJyb3Jpc3QiOiJDcm91Y2hpbmciLCJiMUNvdW50ZXItVGVycm9yaXN0QSI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdEErIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0QyI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZEIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0RkwiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RHIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0TSI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdFMiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RTVyI6dHJ1ZSwiYjFHbG9iYWxBIjp0cnVlLCJiMUdsb2JhbEErIjp0cnVlLCJiMUdsb2JhbEMiOnRydWUsImIxR2xvYmFsRkQiOmZhbHNlLCJiMUdsb2JhbEZMIjp0cnVlLCJiMUdsb2JhbEciOnRydWUsImIxR2xvYmFsTSI6dHJ1ZSwiYjFHbG9iYWxTIjp0cnVlLCJiMUdsb2JhbFNXIjp0cnVlLCJiMVRlcnJvcmlzdEEiOnRydWUsImIxVGVycm9yaXN0QSsiOnRydWUsImIxVGVycm9yaXN0QyI6dHJ1ZSwiYjFUZXJyb3Jpc3RGRCI6dHJ1ZSwiYjFUZXJyb3Jpc3RGTCI6dHJ1ZSwiYjFUZXJyb3Jpc3RHIjpmYWxzZSwiYjFUZXJyb3Jpc3RNIjp0cnVlLCJiMVRlcnJvcmlzdFMiOnRydWUsImIxVGVycm9yaXN0U1ciOnRydWUsImIyQ291bnRlci1UZXJyb3Jpc3RBIjoiRG93biIsImIyQ291bnRlci1UZXJyb3Jpc3RBKyI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0QyI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0RkQiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZMIjoiRG93biIsImIyQ291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0TSI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0UyI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0U1ciOiJEb3duIiwiYjJHbG9iYWxBIjoiRG93biIsImIyR2xvYmFsQSsiOiJEb3duIiwiYjJHbG9iYWxDIjoiRG93biIsImIyR2xvYmFsRkQiOiJEb3duIiwiYjJHbG9iYWxGTCI6IkRvd24iLCJiMkdsb2JhbEciOiJEb3duIiwiYjJHbG9iYWxNIjoiRG93biIsImIyR2xvYmFsUyI6IkRvd24iLCJiMkdsb2JhbFNXIjoiRG93biIsImIyVGVycm9yaXN0QSI6IkRvd24iLCJiMlRlcnJvcmlzdEErIjoiRG93biIsImIyVGVycm9yaXN0QyI6IkRvd24iLCJiMlRlcnJvcmlzdEZEIjoiRG93biIsImIyVGVycm9yaXN0RkwiOiJEb3duIiwiYjJUZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdE0iOiJEb3duIiwiYjJUZXJyb3Jpc3RTIjoiRG93biIsImIyVGVycm9yaXN0U1ciOiJEb3duIiwiYjNDb3VudGVyLVRlcnJvcmlzdEEiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0QSsiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0QyI6IkF0IFRhcmdldCIsImIzQ291bnRlci1UZXJyb3Jpc3RGRCI6IkF0IFRhcmdldCIsImIzQ291bnRlci1UZXJyb3Jpc3RGTCI6IkF0IFRhcmdldCIsImIzQ291bnRlci1UZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RNIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdFMiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0U1ciOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEEiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEErIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxDIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxGRCI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkwiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEciOiJBdCBUYXJnZXQiLCJiM0dsb2JhbE0iOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFMiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbFNXIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RBIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RBKyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0RkQiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEZMIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0TSI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0UyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0U1ciOiJBdCBUYXJnZXQiLCJiNENvdW50ZXItVGVycm9yaXN0QSI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RBKyI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RDIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZEIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZMIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RNIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdFMiOiJDZW50ZXIiLCJiNENvdW50ZXItVGVycm9yaXN0U1ciOiJDZW50ZXIiLCJiNEdsb2JhbEEiOiJDZW50ZXIiLCJiNEdsb2JhbEErIjoiRGlzYWJsZWQiLCJiNEdsb2JhbEMiOiJDZW50ZXIiLCJiNEdsb2JhbEZEIjoiQ2VudGVyIiwiYjRHbG9iYWxGTCI6IkNlbnRlciIsImI0R2xvYmFsRyI6IkNlbnRlciIsImI0R2xvYmFsTSI6IkNlbnRlciIsImI0R2xvYmFsUyI6IkRpc2FibGVkIiwiYjRHbG9iYWxTVyI6IkNlbnRlciIsImI0VGVycm9yaXN0QSI6IkNlbnRlciIsImI0VGVycm9yaXN0QSsiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEMiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEZEIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RGTCI6IkNlbnRlciIsImI0VGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RNIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RTIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RTVyI6IkNlbnRlciIsImI1Q291bnRlci1UZXJyb3Jpc3RBIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0QSsiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RDIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0RkQiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RGTCI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0TSI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdFMiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RTVyI6dHJ1ZSwiYjVHbG9iYWxBIjp0cnVlLCJiNUdsb2JhbEErIjp0cnVlLCJiNUdsb2JhbEMiOnRydWUsImI1R2xvYmFsRkQiOnRydWUsImI1R2xvYmFsRkwiOnRydWUsImI1R2xvYmFsRyI6dHJ1ZSwiYjVHbG9iYWxNIjp0cnVlLCJiNUdsb2JhbFMiOnRydWUsImI1R2xvYmFsU1ciOnRydWUsImI1VGVycm9yaXN0QSI6dHJ1ZSwiYjVUZXJyb3Jpc3RBKyI6dHJ1ZSwiYjVUZXJyb3Jpc3RDIjp0cnVlLCJiNVRlcnJvcmlzdEZEIjp0cnVlLCJiNVRlcnJvcmlzdEZMIjp0cnVlLCJiNVRlcnJvcmlzdEciOmZhbHNlLCJiNVRlcnJvcmlzdE0iOnRydWUsImI1VGVycm9yaXN0UyI6dHJ1ZSwiYjVUZXJyb3Jpc3RTVyI6dHJ1ZSwiYjZDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImI2R2xvYmFsQSI6ZmFsc2UsImI2R2xvYmFsQSsiOmZhbHNlLCJiNkdsb2JhbEMiOmZhbHNlLCJiNkdsb2JhbEZEIjpmYWxzZSwiYjZHbG9iYWxGTCI6ZmFsc2UsImI2R2xvYmFsRyI6dHJ1ZSwiYjZHbG9iYWxNIjpmYWxzZSwiYjZHbG9iYWxTIjpmYWxzZSwiYjZHbG9iYWxTVyI6ZmFsc2UsImI2VGVycm9yaXN0QSI6ZmFsc2UsImI2VGVycm9yaXN0QSsiOnRydWUsImI2VGVycm9yaXN0QyI6dHJ1ZSwiYjZUZXJyb3Jpc3RGRCI6ZmFsc2UsImI2VGVycm9yaXN0RkwiOmZhbHNlLCJiNlRlcnJvcmlzdEciOmZhbHNlLCJiNlRlcnJvcmlzdE0iOnRydWUsImI2VGVycm9yaXN0UyI6ZmFsc2UsImI2VGVycm9yaXN0U1ciOmZhbHNlLCJjMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEErIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxNIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjEwLjAsImMyQ291bnRlci1UZXJyb3Jpc3RDIjo5LjAsImMyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkwiOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdE0iOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdFMiOjYuMCwiYzJDb3VudGVyLVRlcnJvcmlzdFNXIjo4LjAsImMyR2xvYmFsQSI6MTAuMCwiYzJHbG9iYWxBKyI6MC4wLCJjMkdsb2JhbEMiOjEzLjAsImMyR2xvYmFsRkQiOjguMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjoxMC4wLCJjMkdsb2JhbFMiOjEwLjAsImMyR2xvYmFsU1ciOjMuMCwiYzJUZXJyb3Jpc3RBIjo5LjAsImMyVGVycm9yaXN0QSsiOjEwLjAsImMyVGVycm9yaXN0QyI6OC4wLCJjMlRlcnJvcmlzdEZEIjo3LjAsImMyVGVycm9yaXN0RkwiOjcuMCwiYzJUZXJyb3Jpc3RHIjowLjAsImMyVGVycm9yaXN0TSI6Ny4wLCJjMlRlcnJvcmlzdFMiOjEwLjAsImMyVGVycm9yaXN0U1ciOjcuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImMzR2xvYmFsQSI6MzcuMCwiYzNHbG9iYWxBKyI6MzkuMCwiYzNHbG9iYWxDIjo0MS4wLCJjM0dsb2JhbEZEIjowLjAsImMzR2xvYmFsRkwiOjAuMCwiYzNHbG9iYWxHIjowLjAsImMzR2xvYmFsTSI6NTAuMCwiYzNHbG9iYWxTIjo0MS4wLCJjM0dsb2JhbFNXIjozNy4wLCJjM1RlcnJvcmlzdEEiOjAuMCwiYzNUZXJyb3Jpc3RBKyI6MC4wLCJjM1RlcnJvcmlzdEMiOjAuMCwiYzNUZXJyb3Jpc3RGRCI6MC4wLCJjM1RlcnJvcmlzdEZMIjowLjAsImMzVGVycm9yaXN0RyI6MC4wLCJjM1RlcnJvcmlzdE0iOjAuMCwiYzNUZXJyb3Jpc3RTIjowLjAsImMzVGVycm9yaXN0U1ciOjAuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEEiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEErIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RDIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGRCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkwiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEciOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdE0iOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFNXIjoyLjAsImM0R2xvYmFsQSI6OS4wLCJjNEdsb2JhbEErIjo5LjAsImM0R2xvYmFsQyI6OS4wLCJjNEdsb2JhbEZEIjoyLjAsImM0R2xvYmFsRkwiOjIuMCwiYzRHbG9iYWxHIjoyLjAsImM0R2xvYmFsTSI6OS4wLCJjNEdsb2JhbFMiOjkuMCwiYzRHbG9iYWxTVyI6OS4wLCJjNFRlcnJvcmlzdEEiOjIuMCwiYzRUZXJyb3Jpc3RBKyI6Mi4wLCJjNFRlcnJvcmlzdEMiOjIuMCwiYzRUZXJyb3Jpc3RGRCI6Mi4wLCJjNFRlcnJvcmlzdEZMIjoyLjAsImM0VGVycm9yaXN0RyI6Mi4wLCJjNFRlcnJvcmlzdE0iOjIuMCwiYzRUZXJyb3Jpc3RTIjoyLjAsImM0VGVycm9yaXN0U1ciOjIuMCwiY29uZmlnX3R5cGUiOiJhbnRpYWltIiwiZDFDb3VudGVyLVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RBKyI6IkxlZnQgJiBSaWdodCIsImQxQ291bnRlci1UZXJyb3Jpc3RDIjoiTGVmdCAmIFJpZ2h0IiwiZDFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0TSI6IkxlZnQgJiBSaWdodCIsImQxQ291bnRlci1UZXJyb3Jpc3RTIjoiTGVmdCAmIFJpZ2h0IiwiZDFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEEiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSsiOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxGRCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxGTCI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxHIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbE0iOiIxODAgRGVncmVlcyIsImQxR2xvYmFsUyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxTVyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RBIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RBKyI6IkxlZnQgJiBSaWdodCIsImQxVGVycm9yaXN0QyI6IkxlZnQgJiBSaWdodCIsImQxVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RNIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RTIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RTVyI6IkxlZnQgJiBSaWdodCIsImQyQ291bnRlci1UZXJyb3Jpc3RBIjotNzEuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEErIjotNDQuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEMiOi03MS4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkQiOi01OC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkwiOi03MS4wLCJkMkNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0TSI6LTY1LjAsImQyQ291bnRlci1UZXJyb3Jpc3RTIjotNTguMCwiZDJDb3VudGVyLVRlcnJvcmlzdFNXIjotNzguMCwiZDJHbG9iYWxBIjotNTEuMCwiZDJHbG9iYWxBKyI6MTMuMCwiZDJHbG9iYWxDIjotNTEuMCwiZDJHbG9iYWxGRCI6LTU4LjAsImQyR2xvYmFsRkwiOi0zMC4wLCJkMkdsb2JhbEciOi03MS4wLCJkMkdsb2JhbE0iOi01MS4wLCJkMkdsb2JhbFMiOi01OC4wLCJkMkdsb2JhbFNXIjotNjIuMCwiZDJUZXJyb3Jpc3RBIjotNzEuMCwiZDJUZXJyb3Jpc3RBKyI6LTcxLjAsImQyVGVycm9yaXN0QyI6LTg1LjAsImQyVGVycm9yaXN0RkQiOi02NS4wLCJkMlRlcnJvcmlzdEZMIjotNzguMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6LTgwLjAsImQyVGVycm9yaXN0UyI6LTg1LjAsImQyVGVycm9yaXN0U1ciOi05Mi4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOi01My4wLCJkM0NvdW50ZXItVGVycm9yaXN0QyI6LTY1LjAsImQzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdE0iOi03MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6LTUwLjAsImQzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJkM0dsb2JhbEEiOi01MS4wLCJkM0dsb2JhbEErIjotNjUuMCwiZDNHbG9iYWxDIjotNzEuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjotNTguMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTg3LjAsImQzR2xvYmFsUyI6LTU3LjAsImQzR2xvYmFsU1ciOi01MS4wLCJkM1RlcnJvcmlzdEEiOi03NS4wLCJkM1RlcnJvcmlzdEErIjotODAuMCwiZDNUZXJyb3Jpc3RDIjotNjUuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOi03Mi4wLCJkM1RlcnJvcmlzdFMiOi03MS4wLCJkM1RlcnJvcmlzdFNXIjotNzEuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6dHJ1ZSwiZTFHbG9iYWxBKyI6dHJ1ZSwiZTFHbG9iYWxDIjp0cnVlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6dHJ1ZSwiZTFHbG9iYWxTIjp0cnVlLCJlMUdsb2JhbFNXIjp0cnVlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6MzAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RBKyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZMIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0RyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RNIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNUdsb2JhbEEiOlsiSml0dGVyIl0sImU1R2xvYmFsQSsiOlsiSml0dGVyIl0sImU1R2xvYmFsQyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGRCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGTCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxHIjpbIkppdHRlciJdLCJlNUdsb2JhbE0iOlsiSml0dGVyIl0sImU1R2xvYmFsUyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTVyI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RBIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEErIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkQiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkwiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RyI6W10sImU1VGVycm9yaXN0TSI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RTIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNkNvdW50ZXItVGVycm9yaXN0QSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RBKyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RDIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZMIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEciOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0TSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdFNXIjoiT2ZmIiwiZTZHbG9iYWxBIjoiT2ZmIiwiZTZHbG9iYWxBKyI6IlBlZWsgRmFrZSIsImU2R2xvYmFsQyI6Ik9mZiIsImU2R2xvYmFsRkQiOiJPZmYiLCJlNkdsb2JhbEZMIjoiT2ZmIiwiZTZHbG9iYWxHIjoiT2ZmIiwiZTZHbG9iYWxNIjoiT2ZmIiwiZTZHbG9iYWxTIjoiT2ZmIiwiZTZHbG9iYWxTVyI6Ik9mZiIsImU2VGVycm9yaXN0QSI6Ik9mZiIsImU2VGVycm9yaXN0QSsiOiJPZmYiLCJlNlRlcnJvcmlzdEMiOiJPZmYiLCJlNlRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGTCI6Ik9mZiIsImU2VGVycm9yaXN0RyI6Ik9mZiIsImU2VGVycm9yaXN0TSI6Ik9mZiIsImU2VGVycm9yaXN0UyI6Ik9mZiIsImU2VGVycm9yaXN0U1ciOiJPZmYiLCJmMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZjFHbG9iYWxBIjp0cnVlLCJmMUdsb2JhbEErIjp0cnVlLCJmMUdsb2JhbEMiOnRydWUsImYxR2xvYmFsRkQiOmZhbHNlLCJmMUdsb2JhbEZMIjpmYWxzZSwiZjFHbG9iYWxHIjp0cnVlLCJmMUdsb2JhbE0iOnRydWUsImYxR2xvYmFsUyI6ZmFsc2UsImYxR2xvYmFsU1ciOnRydWUsImYxVGVycm9yaXN0QSI6ZmFsc2UsImYxVGVycm9yaXN0QSsiOnRydWUsImYxVGVycm9yaXN0QyI6dHJ1ZSwiZjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImYxVGVycm9yaXN0RkwiOmZhbHNlLCJmMVRlcnJvcmlzdEciOmZhbHNlLCJmMVRlcnJvcmlzdE0iOnRydWUsImYxVGVycm9yaXN0UyI6ZmFsc2UsImYxVGVycm9yaXN0U1ciOmZhbHNlLCJmMkNvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0TSI6IlVwIiwiZjJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYyR2xvYmFsQSI6IlVwIiwiZjJHbG9iYWxBKyI6IldheSIsImYyR2xvYmFsQyI6IldheSIsImYyR2xvYmFsRkQiOiJOb25lIiwiZjJHbG9iYWxGTCI6Ik5vbmUiLCJmMkdsb2JhbEciOiJTZW1pLVVwIiwiZjJHbG9iYWxNIjoiRXhwZXJpbWVudGFsIiwiZjJHbG9iYWxTIjoiTm9uZSIsImYyR2xvYmFsU1ciOiJXYXkiLCJmMlRlcnJvcmlzdEEiOiJOb25lIiwiZjJUZXJyb3Jpc3RBKyI6IlVwIiwiZjJUZXJyb3Jpc3RDIjoiRXhwZXJpbWVudGFsIiwiZjJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZMIjoiTm9uZSIsImYyVGVycm9yaXN0RyI6Ik5vbmUiLCJmMlRlcnJvcmlzdE0iOiJTZW1pLVVwIiwiZjJUZXJyb3Jpc3RTIjoiTm9uZSIsImYyVGVycm9yaXN0U1ciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYzR2xvYmFsQSI6IlNwaW4iLCJmM0dsb2JhbEErIjoiUmFuZG9tIiwiZjNHbG9iYWxDIjoiUmFuZG9tIiwiZjNHbG9iYWxGRCI6Ik5vbmUiLCJmM0dsb2JhbEZMIjoiTm9uZSIsImYzR2xvYmFsRyI6IlNpZGV3YXlzIiwiZjNHbG9iYWxNIjoiU2lkZXdheXMiLCJmM0dsb2JhbFMiOiJOb25lIiwiZjNHbG9iYWxTVyI6Ik5vbmUiLCJmM1RlcnJvcmlzdEEiOiJOb25lIiwiZjNUZXJyb3Jpc3RBKyI6IlNpZGV3YXlzIiwiZjNUZXJyb3Jpc3RDIjoiUmFuZG9tIiwiZjNUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEZMIjoiTm9uZSIsImYzVGVycm9yaXN0RyI6Ik5vbmUiLCJmM1RlcnJvcmlzdE0iOiJTaWRld2F5cyIsImYzVGVycm9yaXN0UyI6Ik5vbmUiLCJmM1RlcnJvcmlzdFNXIjoiTm9uZSIsImY0Q291bnRlci1UZXJyb3Jpc3RBIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RBKyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RkQiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZMIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RHIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RNIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RTVyI6NS4wLCJmNEdsb2JhbEEiOjEwMC4wLCJmNEdsb2JhbEErIjo2My4wLCJmNEdsb2JhbEMiOjQ4LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjo2MC4wLCJmNEdsb2JhbFMiOjU2LjAsImY0R2xvYmFsU1ciOjU0LjAsImY0VGVycm9yaXN0QSI6NS4wLCJmNFRlcnJvcmlzdEErIjo1LjAsImY0VGVycm9yaXN0QyI6NS4wLCJmNFRlcnJvcmlzdEZEIjo1LjAsImY0VGVycm9yaXN0RkwiOjUuMCwiZjRUZXJyb3Jpc3RHIjo1LjAsImY0VGVycm9yaXN0TSI6NDAuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MC4wLCJmNUdsb2JhbEErIjoxMy4wLCJmNUdsb2JhbEMiOjEzLjAsImY1R2xvYmFsRkQiOjAuMCwiZjVHbG9iYWxGTCI6MC4wLCJmNUdsb2JhbEciOjAuMCwiZjVHbG9iYWxNIjowLjAsImY1R2xvYmFsUyI6MTAuMCwiZjVHbG9iYWxTVyI6MC4wLCJmNVRlcnJvcmlzdEEiOjAuMCwiZjVUZXJyb3Jpc3RBKyI6MC4wLCJmNVRlcnJvcmlzdEMiOjAuMCwiZjVUZXJyb3Jpc3RGRCI6MC4wLCJmNVRlcnJvcmlzdEZMIjowLjAsImY1VGVycm9yaXN0RyI6MC4wLCJmNVRlcnJvcmlzdE0iOjAuMCwiZjVUZXJyb3Jpc3RTIjowLjAsImY1VGVycm9yaXN0U1ciOjAuMCwicGxheWVyX3NpZGUiOiJHbG9iYWwifQ== [citrine]"));
end, true);
default2NEW_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("aggresive", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6IkNyb3VjaGluZyIsImEyR2xvYmFsIjoiRmFrZWxhZ2dpbmciLCJhMlRlcnJvcmlzdCI6IkNyb3VjaGluZyIsImIxQ291bnRlci1UZXJyb3Jpc3RBIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0QSsiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RDIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0RkQiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RGTCI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdEciOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RNIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0UyI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdFNXIjp0cnVlLCJiMUdsb2JhbEEiOnRydWUsImIxR2xvYmFsQSsiOnRydWUsImIxR2xvYmFsQyI6dHJ1ZSwiYjFHbG9iYWxGRCI6dHJ1ZSwiYjFHbG9iYWxGTCI6dHJ1ZSwiYjFHbG9iYWxHIjp0cnVlLCJiMUdsb2JhbE0iOnRydWUsImIxR2xvYmFsUyI6dHJ1ZSwiYjFHbG9iYWxTVyI6dHJ1ZSwiYjFUZXJyb3Jpc3RBIjp0cnVlLCJiMVRlcnJvcmlzdEErIjp0cnVlLCJiMVRlcnJvcmlzdEMiOnRydWUsImIxVGVycm9yaXN0RkQiOnRydWUsImIxVGVycm9yaXN0RkwiOnRydWUsImIxVGVycm9yaXN0RyI6ZmFsc2UsImIxVGVycm9yaXN0TSI6dHJ1ZSwiYjFUZXJyb3Jpc3RTIjp0cnVlLCJiMVRlcnJvcmlzdFNXIjp0cnVlLCJiMkNvdW50ZXItVGVycm9yaXN0QSI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0QSsiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdEMiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiRG93biIsImIyQ291bnRlci1UZXJyb3Jpc3RGTCI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdE0iOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdFMiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiRG93biIsImIyR2xvYmFsQSI6IkRvd24iLCJiMkdsb2JhbEErIjoiRG93biIsImIyR2xvYmFsQyI6IkRvd24iLCJiMkdsb2JhbEZEIjoiRG93biIsImIyR2xvYmFsRkwiOiJEb3duIiwiYjJHbG9iYWxHIjoiRG93biIsImIyR2xvYmFsTSI6IkRvd24iLCJiMkdsb2JhbFMiOiJEb3duIiwiYjJHbG9iYWxTVyI6IkRvd24iLCJiMlRlcnJvcmlzdEEiOiJEb3duIiwiYjJUZXJyb3Jpc3RBKyI6IkRvd24iLCJiMlRlcnJvcmlzdEMiOiJEb3duIiwiYjJUZXJyb3Jpc3RGRCI6IkRvd24iLCJiMlRlcnJvcmlzdEZMIjoiRG93biIsImIyVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RNIjoiRG93biIsImIyVGVycm9yaXN0UyI6IkRvd24iLCJiMlRlcnJvcmlzdFNXIjoiRG93biIsImIzQ291bnRlci1UZXJyb3Jpc3RBIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdEErIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdEMiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RkQiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RkwiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0TSI6IkF0IFRhcmdldCIsImIzQ291bnRlci1UZXJyb3Jpc3RTIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBKyI6IkF0IFRhcmdldCIsImIzR2xvYmFsQyI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkQiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZMIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxHIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxNIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTVyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSsiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEMiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEZEIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RGTCI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdE0iOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdFMiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdFNXIjoiQXQgVGFyZ2V0IiwiYjRDb3VudGVyLVRlcnJvcmlzdEEiOiJDZW50ZXIiLCJiNENvdW50ZXItVGVycm9yaXN0QSsiOiJDZW50ZXIiLCJiNENvdW50ZXItVGVycm9yaXN0QyI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RGRCI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RGTCI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0TSI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RTIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdFNXIjoiQ2VudGVyIiwiYjRHbG9iYWxBIjoiQ2VudGVyIiwiYjRHbG9iYWxBKyI6IkNlbnRlciIsImI0R2xvYmFsQyI6IkNlbnRlciIsImI0R2xvYmFsRkQiOiJEaXNhYmxlZCIsImI0R2xvYmFsRkwiOiJDZW50ZXIiLCJiNEdsb2JhbEciOiJDZW50ZXIiLCJiNEdsb2JhbE0iOiJDZW50ZXIiLCJiNEdsb2JhbFMiOiJDZW50ZXIiLCJiNEdsb2JhbFNXIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RBIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RBKyI6IkNlbnRlciIsImI0VGVycm9yaXN0QyI6IkNlbnRlciIsImI0VGVycm9yaXN0RkQiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEZMIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdE0iOiJDZW50ZXIiLCJiNFRlcnJvcmlzdFMiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdFNXIjoiQ2VudGVyIiwiYjVDb3VudGVyLVRlcnJvcmlzdEEiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RBKyI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdEMiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RGRCI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZMIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0RyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RNIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0UyI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdFNXIjp0cnVlLCJiNUdsb2JhbEEiOnRydWUsImI1R2xvYmFsQSsiOnRydWUsImI1R2xvYmFsQyI6dHJ1ZSwiYjVHbG9iYWxGRCI6dHJ1ZSwiYjVHbG9iYWxGTCI6dHJ1ZSwiYjVHbG9iYWxHIjp0cnVlLCJiNUdsb2JhbE0iOnRydWUsImI1R2xvYmFsUyI6dHJ1ZSwiYjVHbG9iYWxTVyI6dHJ1ZSwiYjVUZXJyb3Jpc3RBIjp0cnVlLCJiNVRlcnJvcmlzdEErIjp0cnVlLCJiNVRlcnJvcmlzdEMiOnRydWUsImI1VGVycm9yaXN0RkQiOnRydWUsImI1VGVycm9yaXN0RkwiOnRydWUsImI1VGVycm9yaXN0RyI6ZmFsc2UsImI1VGVycm9yaXN0TSI6dHJ1ZSwiYjVUZXJyb3Jpc3RTIjp0cnVlLCJiNVRlcnJvcmlzdFNXIjp0cnVlLCJiNkNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjZHbG9iYWxBIjp0cnVlLCJiNkdsb2JhbEErIjp0cnVlLCJiNkdsb2JhbEMiOmZhbHNlLCJiNkdsb2JhbEZEIjpmYWxzZSwiYjZHbG9iYWxGTCI6ZmFsc2UsImI2R2xvYmFsRyI6dHJ1ZSwiYjZHbG9iYWxNIjpmYWxzZSwiYjZHbG9iYWxTIjpmYWxzZSwiYjZHbG9iYWxTVyI6ZmFsc2UsImI2VGVycm9yaXN0QSI6ZmFsc2UsImI2VGVycm9yaXN0QSsiOnRydWUsImI2VGVycm9yaXN0QyI6dHJ1ZSwiYjZUZXJyb3Jpc3RGRCI6ZmFsc2UsImI2VGVycm9yaXN0RkwiOmZhbHNlLCJiNlRlcnJvcmlzdEciOmZhbHNlLCJiNlRlcnJvcmlzdE0iOnRydWUsImI2VGVycm9yaXN0UyI6ZmFsc2UsImI2VGVycm9yaXN0U1ciOmZhbHNlLCJjMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEErIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxNIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjEwLjAsImMyQ291bnRlci1UZXJyb3Jpc3RDIjo5LjAsImMyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkwiOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdE0iOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdFMiOjYuMCwiYzJDb3VudGVyLVRlcnJvcmlzdFNXIjo4LjAsImMyR2xvYmFsQSI6Ni4wLCJjMkdsb2JhbEErIjoxMS4wLCJjMkdsb2JhbEMiOjEwLjAsImMyR2xvYmFsRkQiOjAuMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjo4LjAsImMyR2xvYmFsUyI6My4wLCJjMkdsb2JhbFNXIjozLjAsImMyVGVycm9yaXN0QSI6OS4wLCJjMlRlcnJvcmlzdEErIjoxMC4wLCJjMlRlcnJvcmlzdEMiOjguMCwiYzJUZXJyb3Jpc3RGRCI6Ny4wLCJjMlRlcnJvcmlzdEZMIjo3LjAsImMyVGVycm9yaXN0RyI6MC4wLCJjMlRlcnJvcmlzdE0iOjcuMCwiYzJUZXJyb3Jpc3RTIjoxMC4wLCJjMlRlcnJvcmlzdFNXIjo3LjAsImMzQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJjM0dsb2JhbEEiOjM3LjAsImMzR2xvYmFsQSsiOjM5LjAsImMzR2xvYmFsQyI6NDEuMCwiYzNHbG9iYWxGRCI6MC4wLCJjM0dsb2JhbEZMIjowLjAsImMzR2xvYmFsRyI6MC4wLCJjM0dsb2JhbE0iOjUwLjAsImMzR2xvYmFsUyI6MTcuMCwiYzNHbG9iYWxTVyI6MzcuMCwiYzNUZXJyb3Jpc3RBIjowLjAsImMzVGVycm9yaXN0QSsiOjAuMCwiYzNUZXJyb3Jpc3RDIjowLjAsImMzVGVycm9yaXN0RkQiOjAuMCwiYzNUZXJyb3Jpc3RGTCI6MC4wLCJjM1RlcnJvcmlzdEciOjAuMCwiYzNUZXJyb3Jpc3RNIjowLjAsImMzVGVycm9yaXN0UyI6MC4wLCJjM1RlcnJvcmlzdFNXIjowLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RBKyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0QyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkQiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEZMIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RHIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RNIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RTVyI6Mi4wLCJjNEdsb2JhbEEiOjkuMCwiYzRHbG9iYWxBKyI6OS4wLCJjNEdsb2JhbEMiOjkuMCwiYzRHbG9iYWxGRCI6Mi4wLCJjNEdsb2JhbEZMIjoyLjAsImM0R2xvYmFsRyI6Mi4wLCJjNEdsb2JhbE0iOjkuMCwiYzRHbG9iYWxTIjo1LjAsImM0R2xvYmFsU1ciOjkuMCwiYzRUZXJyb3Jpc3RBIjoyLjAsImM0VGVycm9yaXN0QSsiOjIuMCwiYzRUZXJyb3Jpc3RDIjoyLjAsImM0VGVycm9yaXN0RkQiOjIuMCwiYzRUZXJyb3Jpc3RGTCI6Mi4wLCJjNFRlcnJvcmlzdEciOjIuMCwiYzRUZXJyb3Jpc3RNIjoyLjAsImM0VGVycm9yaXN0UyI6Mi4wLCJjNFRlcnJvcmlzdFNXIjoyLjAsImNvbmZpZ190eXBlIjoiYW50aWFpbSIsImQxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0QSsiOiJMZWZ0ICYgUmlnaHQiLCJkMUNvdW50ZXItVGVycm9yaXN0QyI6IkxlZnQgJiBSaWdodCIsImQxQ291bnRlci1UZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdE0iOiJMZWZ0ICYgUmlnaHQiLCJkMUNvdW50ZXItVGVycm9yaXN0UyI6IkxlZnQgJiBSaWdodCIsImQxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEErIjoiTGVmdCAmIFJpZ2h0IiwiZDFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsTSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxTIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbFNXIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEEiOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdEErIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RDIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdFMiOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdFNXIjoiTGVmdCAmIFJpZ2h0IiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOi03MS4wLCJkMkNvdW50ZXItVGVycm9yaXN0QSsiOi00NC4wLCJkMkNvdW50ZXItVGVycm9yaXN0QyI6LTcxLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6LTU4LjAsImQyQ291bnRlci1UZXJyb3Jpc3RGTCI6LTcxLjAsImQyQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RNIjotNjUuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOi01OC4wLCJkMkNvdW50ZXItVGVycm9yaXN0U1ciOi03OC4wLCJkMkdsb2JhbEEiOi02Ny4wLCJkMkdsb2JhbEErIjotNjcuMCwiZDJHbG9iYWxDIjotNjcuMCwiZDJHbG9iYWxGRCI6LTU4LjAsImQyR2xvYmFsRkwiOi01Ni4wLCJkMkdsb2JhbEciOi03MS4wLCJkMkdsb2JhbE0iOi04MC4wLCJkMkdsb2JhbFMiOi00MC4wLCJkMkdsb2JhbFNXIjotNjIuMCwiZDJUZXJyb3Jpc3RBIjotNzEuMCwiZDJUZXJyb3Jpc3RBKyI6LTcxLjAsImQyVGVycm9yaXN0QyI6LTg1LjAsImQyVGVycm9yaXN0RkQiOi02NS4wLCJkMlRlcnJvcmlzdEZMIjotNzguMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6LTgwLjAsImQyVGVycm9yaXN0UyI6LTg1LjAsImQyVGVycm9yaXN0U1ciOi05Mi4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOi01My4wLCJkM0NvdW50ZXItVGVycm9yaXN0QyI6LTY1LjAsImQzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdE0iOi03MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6LTUwLjAsImQzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJkM0dsb2JhbEEiOi01MS4wLCJkM0dsb2JhbEErIjotNDYuMCwiZDNHbG9iYWxDIjotNzEuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjotNTguMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTg3LjAsImQzR2xvYmFsUyI6LTU3LjAsImQzR2xvYmFsU1ciOi01MS4wLCJkM1RlcnJvcmlzdEEiOi03NS4wLCJkM1RlcnJvcmlzdEErIjotODAuMCwiZDNUZXJyb3Jpc3RDIjotNjUuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOi03Mi4wLCJkM1RlcnJvcmlzdFMiOi03MS4wLCJkM1RlcnJvcmlzdFNXIjotNzEuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6dHJ1ZSwiZTFHbG9iYWxBKyI6dHJ1ZSwiZTFHbG9iYWxDIjp0cnVlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6dHJ1ZSwiZTFHbG9iYWxTIjp0cnVlLCJlMUdsb2JhbFNXIjp0cnVlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6MzAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RBKyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZMIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0RyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RNIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNUdsb2JhbEEiOlsiSml0dGVyIl0sImU1R2xvYmFsQSsiOlsiSml0dGVyIl0sImU1R2xvYmFsQyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGRCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGTCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxHIjpbIkppdHRlciJdLCJlNUdsb2JhbE0iOlsiSml0dGVyIl0sImU1R2xvYmFsUyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTVyI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RBIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEErIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkQiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkwiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RyI6W10sImU1VGVycm9yaXN0TSI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RTIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNkNvdW50ZXItVGVycm9yaXN0QSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RBKyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RDIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZMIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEciOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0TSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdFNXIjoiT2ZmIiwiZTZHbG9iYWxBIjoiT2ZmIiwiZTZHbG9iYWxBKyI6Ik9mZiIsImU2R2xvYmFsQyI6Ik9mZiIsImU2R2xvYmFsRkQiOiJPZmYiLCJlNkdsb2JhbEZMIjoiT2ZmIiwiZTZHbG9iYWxHIjoiT2ZmIiwiZTZHbG9iYWxNIjoiT2ZmIiwiZTZHbG9iYWxTIjoiT2ZmIiwiZTZHbG9iYWxTVyI6Ik9mZiIsImU2VGVycm9yaXN0QSI6Ik9mZiIsImU2VGVycm9yaXN0QSsiOiJPZmYiLCJlNlRlcnJvcmlzdEMiOiJPZmYiLCJlNlRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGTCI6Ik9mZiIsImU2VGVycm9yaXN0RyI6Ik9mZiIsImU2VGVycm9yaXN0TSI6Ik9mZiIsImU2VGVycm9yaXN0UyI6Ik9mZiIsImU2VGVycm9yaXN0U1ciOiJPZmYiLCJmMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZjFHbG9iYWxBIjp0cnVlLCJmMUdsb2JhbEErIjp0cnVlLCJmMUdsb2JhbEMiOnRydWUsImYxR2xvYmFsRkQiOmZhbHNlLCJmMUdsb2JhbEZMIjpmYWxzZSwiZjFHbG9iYWxHIjp0cnVlLCJmMUdsb2JhbE0iOnRydWUsImYxR2xvYmFsUyI6ZmFsc2UsImYxR2xvYmFsU1ciOnRydWUsImYxVGVycm9yaXN0QSI6ZmFsc2UsImYxVGVycm9yaXN0QSsiOnRydWUsImYxVGVycm9yaXN0QyI6dHJ1ZSwiZjFUZXJyb3Jpc3RGRCI6ZmFsc2UsImYxVGVycm9yaXN0RkwiOmZhbHNlLCJmMVRlcnJvcmlzdEciOmZhbHNlLCJmMVRlcnJvcmlzdE0iOnRydWUsImYxVGVycm9yaXN0UyI6ZmFsc2UsImYxVGVycm9yaXN0U1ciOmZhbHNlLCJmMkNvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0TSI6IlVwIiwiZjJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImYyR2xvYmFsQSI6IkV4cGVyaW1lbnRhbCIsImYyR2xvYmFsQSsiOiJEb3duIiwiZjJHbG9iYWxDIjoiV2F5IiwiZjJHbG9iYWxGRCI6Ik5vbmUiLCJmMkdsb2JhbEZMIjoiTm9uZSIsImYyR2xvYmFsRyI6IlNlbWktVXAiLCJmMkdsb2JhbE0iOiJFeHBlcmltZW50YWwiLCJmMkdsb2JhbFMiOiJOb25lIiwiZjJHbG9iYWxTVyI6IldheSIsImYyVGVycm9yaXN0QSI6Ik5vbmUiLCJmMlRlcnJvcmlzdEErIjoiVXAiLCJmMlRlcnJvcmlzdEMiOiJFeHBlcmltZW50YWwiLCJmMlRlcnJvcmlzdEZEIjoiTm9uZSIsImYyVGVycm9yaXN0RkwiOiJOb25lIiwiZjJUZXJyb3Jpc3RHIjoiTm9uZSIsImYyVGVycm9yaXN0TSI6IlNlbWktVXAiLCJmMlRlcnJvcmlzdFMiOiJOb25lIiwiZjJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjNHbG9iYWxBIjoiT3Bwb3NpdGUgV2F5IiwiZjNHbG9iYWxBKyI6Ik9wcG9zaXRlIFdheSIsImYzR2xvYmFsQyI6IlJhbmRvbSIsImYzR2xvYmFsRkQiOiJOb25lIiwiZjNHbG9iYWxGTCI6Ik5vbmUiLCJmM0dsb2JhbEciOiJTaWRld2F5cyIsImYzR2xvYmFsTSI6IlNpZGV3YXlzIiwiZjNHbG9iYWxTIjoiTm9uZSIsImYzR2xvYmFsU1ciOiJOb25lIiwiZjNUZXJyb3Jpc3RBIjoiTm9uZSIsImYzVGVycm9yaXN0QSsiOiJTaWRld2F5cyIsImYzVGVycm9yaXN0QyI6IlJhbmRvbSIsImYzVGVycm9yaXN0RkQiOiJOb25lIiwiZjNUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEciOiJOb25lIiwiZjNUZXJyb3Jpc3RNIjoiU2lkZXdheXMiLCJmM1RlcnJvcmlzdFMiOiJOb25lIiwiZjNUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmNENvdW50ZXItVGVycm9yaXN0QSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QSsiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZEIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGTCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0TSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0UyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0U1ciOjUuMCwiZjRHbG9iYWxBIjoxMDAuMCwiZjRHbG9iYWxBKyI6NjMuMCwiZjRHbG9iYWxDIjo0OC4wLCJmNEdsb2JhbEZEIjo1LjAsImY0R2xvYmFsRkwiOjUuMCwiZjRHbG9iYWxHIjoyLjAsImY0R2xvYmFsTSI6NjAuMCwiZjRHbG9iYWxTIjo1Ni4wLCJmNEdsb2JhbFNXIjo1NC4wLCJmNFRlcnJvcmlzdEEiOjUuMCwiZjRUZXJyb3Jpc3RBKyI6NS4wLCJmNFRlcnJvcmlzdEMiOjUuMCwiZjRUZXJyb3Jpc3RGRCI6NS4wLCJmNFRlcnJvcmlzdEZMIjo1LjAsImY0VGVycm9yaXN0RyI6NS4wLCJmNFRlcnJvcmlzdE0iOjQwLjAsImY0VGVycm9yaXN0UyI6NS4wLCJmNFRlcnJvcmlzdFNXIjo1LjAsImY1Q291bnRlci1UZXJyb3Jpc3RBIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RHIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RNIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RTIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJmNUdsb2JhbEEiOjAuMCwiZjVHbG9iYWxBKyI6MTMuMCwiZjVHbG9iYWxDIjoxMy4wLCJmNUdsb2JhbEZEIjowLjAsImY1R2xvYmFsRkwiOjAuMCwiZjVHbG9iYWxHIjowLjAsImY1R2xvYmFsTSI6MC4wLCJmNUdsb2JhbFMiOjEwLjAsImY1R2xvYmFsU1ciOjAuMCwiZjVUZXJyb3Jpc3RBIjowLjAsImY1VGVycm9yaXN0QSsiOjAuMCwiZjVUZXJyb3Jpc3RDIjowLjAsImY1VGVycm9yaXN0RkQiOjAuMCwiZjVUZXJyb3Jpc3RGTCI6MC4wLCJmNVRlcnJvcmlzdEciOjAuMCwiZjVUZXJyb3Jpc3RNIjowLjAsImY1VGVycm9yaXN0UyI6MC4wLCJmNVRlcnJvcmlzdFNXIjowLjAsInBsYXllcl9zaWRlIjoiR2xvYmFsIn0= [citrine]"));
end, true);
default3NEW_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\209\129\208\184\208\179\208\188\208\176", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0IjpmYWxzZSwiYTFHbG9iYWwiOnRydWUsImExVGVycm9yaXN0IjpmYWxzZSwiYTJDb3VudGVyLVRlcnJvcmlzdCI6Ikdsb2JhbCIsImEyR2xvYmFsIjoiQ3JvdWNoaW5nIiwiYTJUZXJyb3Jpc3QiOiJHbG9iYWwiLCJiMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImIxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjFHbG9iYWxBIjp0cnVlLCJiMUdsb2JhbEErIjp0cnVlLCJiMUdsb2JhbEMiOnRydWUsImIxR2xvYmFsRkQiOnRydWUsImIxR2xvYmFsRkwiOnRydWUsImIxR2xvYmFsRyI6dHJ1ZSwiYjFHbG9iYWxNIjp0cnVlLCJiMUdsb2JhbFMiOnRydWUsImIxR2xvYmFsU1ciOnRydWUsImIxVGVycm9yaXN0QSI6ZmFsc2UsImIxVGVycm9yaXN0QSsiOmZhbHNlLCJiMVRlcnJvcmlzdEMiOmZhbHNlLCJiMVRlcnJvcmlzdEZEIjpmYWxzZSwiYjFUZXJyb3Jpc3RGTCI6ZmFsc2UsImIxVGVycm9yaXN0RyI6ZmFsc2UsImIxVGVycm9yaXN0TSI6ZmFsc2UsImIxVGVycm9yaXN0UyI6ZmFsc2UsImIxVGVycm9yaXN0U1ciOmZhbHNlLCJiMkNvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiMkNvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImIyQ291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjJHbG9iYWxBIjoiRG93biIsImIyR2xvYmFsQSsiOiJEb3duIiwiYjJHbG9iYWxDIjoiRG93biIsImIyR2xvYmFsRkQiOiJEb3duIiwiYjJHbG9iYWxGTCI6IkRvd24iLCJiMkdsb2JhbEciOiJEb3duIiwiYjJHbG9iYWxNIjoiRG93biIsImIyR2xvYmFsUyI6IkRvd24iLCJiMkdsb2JhbFNXIjoiRG93biIsImIyVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImIyVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiMlRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiM0NvdW50ZXItVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0QSsiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEMiOiJMb2NhbCBWaWV3IiwiYjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzQ291bnRlci1UZXJyb3Jpc3RGTCI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0UyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0U1ciOiJMb2NhbCBWaWV3IiwiYjNHbG9iYWxBIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBKyI6IkF0IFRhcmdldCIsImIzR2xvYmFsQyI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkQiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZMIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxHIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxNIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTVyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEErIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0QyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdEZEIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0RkwiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RHIjoiTG9jYWwgVmlldyIsImIzVGVycm9yaXN0TSI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdFMiOiJMb2NhbCBWaWV3IiwiYjNUZXJyb3Jpc3RTVyI6IkxvY2FsIFZpZXciLCJiNENvdW50ZXItVGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEErIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0QyI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0RkwiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRDb3VudGVyLVRlcnJvcmlzdFMiOiJEaXNhYmxlZCIsImI0Q291bnRlci1UZXJyb3Jpc3RTVyI6IkRpc2FibGVkIiwiYjRHbG9iYWxBIjoiQ2VudGVyIiwiYjRHbG9iYWxBKyI6IkNlbnRlciIsImI0R2xvYmFsQyI6IkNlbnRlciIsImI0R2xvYmFsRkQiOiJDZW50ZXIiLCJiNEdsb2JhbEZMIjoiQ2VudGVyIiwiYjRHbG9iYWxHIjoiQ2VudGVyIiwiYjRHbG9iYWxNIjoiQ2VudGVyIiwiYjRHbG9iYWxTIjoiQ2VudGVyIiwiYjRHbG9iYWxTVyI6IkNlbnRlciIsImI0VGVycm9yaXN0QSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RBKyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RDIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZEIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEZMIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdEciOiJEaXNhYmxlZCIsImI0VGVycm9yaXN0TSI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RTIjoiRGlzYWJsZWQiLCJiNFRlcnJvcmlzdFNXIjoiRGlzYWJsZWQiLCJiNUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI1Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjVDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjVHbG9iYWxBIjp0cnVlLCJiNUdsb2JhbEErIjp0cnVlLCJiNUdsb2JhbEMiOnRydWUsImI1R2xvYmFsRkQiOnRydWUsImI1R2xvYmFsRkwiOnRydWUsImI1R2xvYmFsRyI6dHJ1ZSwiYjVHbG9iYWxNIjp0cnVlLCJiNUdsb2JhbFMiOnRydWUsImI1R2xvYmFsU1ciOnRydWUsImI1VGVycm9yaXN0QSI6ZmFsc2UsImI1VGVycm9yaXN0QSsiOmZhbHNlLCJiNVRlcnJvcmlzdEMiOmZhbHNlLCJiNVRlcnJvcmlzdEZEIjpmYWxzZSwiYjVUZXJyb3Jpc3RGTCI6ZmFsc2UsImI1VGVycm9yaXN0RyI6ZmFsc2UsImI1VGVycm9yaXN0TSI6ZmFsc2UsImI1VGVycm9yaXN0UyI6ZmFsc2UsImI1VGVycm9yaXN0U1ciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiYjZHbG9iYWxBIjp0cnVlLCJiNkdsb2JhbEErIjp0cnVlLCJiNkdsb2JhbEMiOnRydWUsImI2R2xvYmFsRkQiOmZhbHNlLCJiNkdsb2JhbEZMIjpmYWxzZSwiYjZHbG9iYWxHIjp0cnVlLCJiNkdsb2JhbE0iOmZhbHNlLCJiNkdsb2JhbFMiOmZhbHNlLCJiNkdsb2JhbFNXIjpmYWxzZSwiYjZUZXJyb3Jpc3RBIjpmYWxzZSwiYjZUZXJyb3Jpc3RBKyI6ZmFsc2UsImI2VGVycm9yaXN0QyI6ZmFsc2UsImI2VGVycm9yaXN0RkQiOmZhbHNlLCJiNlRlcnJvcmlzdEZMIjpmYWxzZSwiYjZUZXJyb3Jpc3RHIjpmYWxzZSwiYjZUZXJyb3Jpc3RNIjpmYWxzZSwiYjZUZXJyb3Jpc3RTIjpmYWxzZSwiYjZUZXJyb3Jpc3RTVyI6ZmFsc2UsImMxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEEiOiJSYW5kb20iLCJjMUdsb2JhbEErIjoiUmFuZG9tIiwiYzFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImMxR2xvYmFsTSI6IlJhbmRvbSIsImMxR2xvYmFsUyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxTVyI6IlJhbmRvbSIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImMyQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJjMkNvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiYzJHbG9iYWxBIjoxMS4wLCJjMkdsb2JhbEErIjoxMy4wLCJjMkdsb2JhbEMiOjEzLjAsImMyR2xvYmFsRkQiOjguMCwiYzJHbG9iYWxGTCI6OC4wLCJjMkdsb2JhbEciOjkuMCwiYzJHbG9iYWxNIjowLjAsImMyR2xvYmFsUyI6MTEuMCwiYzJHbG9iYWxTVyI6MTMuMCwiYzJUZXJyb3Jpc3RBIjowLjAsImMyVGVycm9yaXN0QSsiOjAuMCwiYzJUZXJyb3Jpc3RDIjowLjAsImMyVGVycm9yaXN0RkQiOjAuMCwiYzJUZXJyb3Jpc3RGTCI6MC4wLCJjMlRlcnJvcmlzdEciOjAuMCwiYzJUZXJyb3Jpc3RNIjowLjAsImMyVGVycm9yaXN0UyI6MC4wLCJjMlRlcnJvcmlzdFNXIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RBIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RBKyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RkQiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEZMIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RNIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJjM0dsb2JhbEEiOjAuMCwiYzNHbG9iYWxBKyI6Ny4wLCJjM0dsb2JhbEMiOjAuMCwiYzNHbG9iYWxGRCI6MC4wLCJjM0dsb2JhbEZMIjowLjAsImMzR2xvYmFsRyI6MC4wLCJjM0dsb2JhbE0iOjExLjAsImMzR2xvYmFsUyI6OC4wLCJjM0dsb2JhbFNXIjotMy4wLCJjM1RlcnJvcmlzdEEiOjAuMCwiYzNUZXJyb3Jpc3RBKyI6MC4wLCJjM1RlcnJvcmlzdEMiOjAuMCwiYzNUZXJyb3Jpc3RGRCI6MC4wLCJjM1RlcnJvcmlzdEZMIjowLjAsImMzVGVycm9yaXN0RyI6MC4wLCJjM1RlcnJvcmlzdE0iOjAuMCwiYzNUZXJyb3Jpc3RTIjowLjAsImMzVGVycm9yaXN0U1ciOjAuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEEiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEErIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RDIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGRCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RkwiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEciOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdE0iOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdFNXIjoyLjAsImM0R2xvYmFsQSI6Mi4wLCJjNEdsb2JhbEErIjoyLjAsImM0R2xvYmFsQyI6Mi4wLCJjNEdsb2JhbEZEIjoyLjAsImM0R2xvYmFsRkwiOjIuMCwiYzRHbG9iYWxHIjoyLjAsImM0R2xvYmFsTSI6MTEuMCwiYzRHbG9iYWxTIjoyLjAsImM0R2xvYmFsU1ciOjIuMCwiYzRUZXJyb3Jpc3RBIjoyLjAsImM0VGVycm9yaXN0QSsiOjIuMCwiYzRUZXJyb3Jpc3RDIjoyLjAsImM0VGVycm9yaXN0RkQiOjIuMCwiYzRUZXJyb3Jpc3RGTCI6Mi4wLCJjNFRlcnJvcmlzdEciOjIuMCwiYzRUZXJyb3Jpc3RNIjoyLjAsImM0VGVycm9yaXN0UyI6Mi4wLCJjNFRlcnJvcmlzdFNXIjoyLjAsImNvbmZpZ190eXBlIjoiYW50aWFpbSIsImQxQ291bnRlci1UZXJyb3Jpc3RBIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RNIjoiMTgwIERlZ3JlZXMiLCJkMUNvdW50ZXItVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEEiOiJSYW5kb20iLCJkMUdsb2JhbEErIjoiUmFuZG9tIiwiZDFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZEIjoiUmFuZG9tIiwiZDFHbG9iYWxGTCI6IlJhbmRvbSIsImQxR2xvYmFsRyI6IlJhbmRvbSIsImQxR2xvYmFsTSI6IlJhbmRvbSIsImQxR2xvYmFsUyI6IlJhbmRvbSIsImQxR2xvYmFsU1ciOiJSYW5kb20iLCJkMVRlcnJvcmlzdEEiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QSsiOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiIxODAgRGVncmVlcyIsImQxVGVycm9yaXN0UyI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RDIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkMkNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImQyR2xvYmFsQSI6LTcwLjAsImQyR2xvYmFsQSsiOi04MS4wLCJkMkdsb2JhbEMiOi03MS4wLCJkMkdsb2JhbEZEIjotNjIuMCwiZDJHbG9iYWxGTCI6LTcwLjAsImQyR2xvYmFsRyI6NDAuMCwiZDJHbG9iYWxNIjotNzUuMCwiZDJHbG9iYWxTIjotNzguMCwiZDJHbG9iYWxTVyI6LTc4LjAsImQyVGVycm9yaXN0QSI6MC4wLCJkMlRlcnJvcmlzdEErIjowLjAsImQyVGVycm9yaXN0QyI6MC4wLCJkMlRlcnJvcmlzdEZEIjowLjAsImQyVGVycm9yaXN0RkwiOjAuMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6MC4wLCJkMlRlcnJvcmlzdFMiOjAuMCwiZDJUZXJyb3Jpc3RTVyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImQzQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiZDNHbG9iYWxBIjotNTEuMCwiZDNHbG9iYWxBKyI6LTU4LjAsImQzR2xvYmFsQyI6LTY0LjAsImQzR2xvYmFsRkQiOi0yNS4wLCJkM0dsb2JhbEZMIjotNTUuMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTU1LjAsImQzR2xvYmFsUyI6LTQ0LjAsImQzR2xvYmFsU1ciOi00Ni4wLCJkM1RlcnJvcmlzdEEiOjAuMCwiZDNUZXJyb3Jpc3RBKyI6MC4wLCJkM1RlcnJvcmlzdEMiOjAuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOjAuMCwiZDNUZXJyb3Jpc3RTIjowLjAsImQzVGVycm9yaXN0U1ciOjAuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6ZmFsc2UsImUxR2xvYmFsQSsiOnRydWUsImUxR2xvYmFsQyI6ZmFsc2UsImUxR2xvYmFsRkQiOmZhbHNlLCJlMUdsb2JhbEZMIjpmYWxzZSwiZTFHbG9iYWxHIjpmYWxzZSwiZTFHbG9iYWxNIjpmYWxzZSwiZTFHbG9iYWxTIjpmYWxzZSwiZTFHbG9iYWxTVyI6ZmFsc2UsImUxVGVycm9yaXN0QSI6ZmFsc2UsImUxVGVycm9yaXN0QSsiOmZhbHNlLCJlMVRlcnJvcmlzdEMiOmZhbHNlLCJlMVRlcnJvcmlzdEZEIjpmYWxzZSwiZTFUZXJyb3Jpc3RGTCI6ZmFsc2UsImUxVGVycm9yaXN0RyI6ZmFsc2UsImUxVGVycm9yaXN0TSI6ZmFsc2UsImUxVGVycm9yaXN0UyI6ZmFsc2UsImUxVGVycm9yaXN0U1ciOmZhbHNlLCJlMkNvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZTJHbG9iYWxBIjoiTm9uZSIsImUyR2xvYmFsQSsiOiJOb25lIiwiZTJHbG9iYWxDIjoiTm9uZSIsImUyR2xvYmFsRkQiOiJOb25lIiwiZTJHbG9iYWxGTCI6Ik5vbmUiLCJlMkdsb2JhbEciOiJOb25lIiwiZTJHbG9iYWxNIjoiTm9uZSIsImUyR2xvYmFsUyI6Ik5vbmUiLCJlMkdsb2JhbFNXIjoiTm9uZSIsImUyVGVycm9yaXN0QSI6Ik5vbmUiLCJlMlRlcnJvcmlzdEErIjoiTm9uZSIsImUyVGVycm9yaXN0QyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZEIjoiTm9uZSIsImUyVGVycm9yaXN0RkwiOiJOb25lIiwiZTJUZXJyb3Jpc3RHIjoiTm9uZSIsImUyVGVycm9yaXN0TSI6Ik5vbmUiLCJlMlRlcnJvcmlzdFMiOiJOb25lIiwiZTJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJlM0NvdW50ZXItVGVycm9yaXN0QSI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEErIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0QyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZEIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RkwiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RHIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0TSI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdFMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTVyI6NjAuMCwiZTNHbG9iYWxBIjo2MC4wLCJlM0dsb2JhbEErIjo2MC4wLCJlM0dsb2JhbEMiOjYwLjAsImUzR2xvYmFsRkQiOjYwLjAsImUzR2xvYmFsRkwiOjYwLjAsImUzR2xvYmFsRyI6NjAuMCwiZTNHbG9iYWxNIjo2MC4wLCJlM0dsb2JhbFMiOjYwLjAsImUzR2xvYmFsU1ciOjYwLjAsImUzVGVycm9yaXN0QSI6NjAuMCwiZTNUZXJyb3Jpc3RBKyI6NjAuMCwiZTNUZXJyb3Jpc3RDIjo2MC4wLCJlM1RlcnJvcmlzdEZEIjo2MC4wLCJlM1RlcnJvcmlzdEZMIjo2MC4wLCJlM1RlcnJvcmlzdEciOjYwLjAsImUzVGVycm9yaXN0TSI6NjAuMCwiZTNUZXJyb3Jpc3RTIjo2MC4wLCJlM1RlcnJvcmlzdFNXIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0QSI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEErIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0QyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZEIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RkwiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RHIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0TSI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdFMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTVyI6NjAuMCwiZTRHbG9iYWxBIjo2MC4wLCJlNEdsb2JhbEErIjo2MC4wLCJlNEdsb2JhbEMiOjYwLjAsImU0R2xvYmFsRkQiOjYwLjAsImU0R2xvYmFsRkwiOjYwLjAsImU0R2xvYmFsRyI6NjAuMCwiZTRHbG9iYWxNIjo2MC4wLCJlNEdsb2JhbFMiOjYwLjAsImU0R2xvYmFsU1ciOjYwLjAsImU0VGVycm9yaXN0QSI6NjAuMCwiZTRUZXJyb3Jpc3RBKyI6NjAuMCwiZTRUZXJyb3Jpc3RDIjo2MC4wLCJlNFRlcnJvcmlzdEZEIjo2MC4wLCJlNFRlcnJvcmlzdEZMIjo2MC4wLCJlNFRlcnJvcmlzdEciOjYwLjAsImU0VGVycm9yaXN0TSI6NjAuMCwiZTRUZXJyb3Jpc3RTIjo2MC4wLCJlNFRlcnJvcmlzdFNXIjo2MC4wLCJlNUNvdW50ZXItVGVycm9yaXN0QSI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RBKyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RDIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZEIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZMIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdEciOltdLCJlNUNvdW50ZXItVGVycm9yaXN0TSI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RTIjpbXSwiZTVDb3VudGVyLVRlcnJvcmlzdFNXIjpbXSwiZTVHbG9iYWxBIjpbIkppdHRlciJdLCJlNUdsb2JhbEErIjpbIkppdHRlciJdLCJlNUdsb2JhbEMiOlsiSml0dGVyIl0sImU1R2xvYmFsRkQiOlsiSml0dGVyIl0sImU1R2xvYmFsRkwiOlsiSml0dGVyIl0sImU1R2xvYmFsRyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxNIjpbIkppdHRlciJdLCJlNUdsb2JhbFMiOlsiSml0dGVyIl0sImU1R2xvYmFsU1ciOlsiSml0dGVyIl0sImU1VGVycm9yaXN0QSI6W10sImU1VGVycm9yaXN0QSsiOltdLCJlNVRlcnJvcmlzdEMiOltdLCJlNVRlcnJvcmlzdEZEIjpbXSwiZTVUZXJyb3Jpc3RGTCI6W10sImU1VGVycm9yaXN0RyI6W10sImU1VGVycm9yaXN0TSI6W10sImU1VGVycm9yaXN0UyI6W10sImU1VGVycm9yaXN0U1ciOltdLCJlNkNvdW50ZXItVGVycm9yaXN0QSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RBKyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RDIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZMIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEciOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0TSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdFNXIjoiT2ZmIiwiZTZHbG9iYWxBIjoiT2ZmIiwiZTZHbG9iYWxBKyI6Ik9mZiIsImU2R2xvYmFsQyI6Ik9mZiIsImU2R2xvYmFsRkQiOiJPZmYiLCJlNkdsb2JhbEZMIjoiT2ZmIiwiZTZHbG9iYWxHIjoiT2ZmIiwiZTZHbG9iYWxNIjoiT2ZmIiwiZTZHbG9iYWxTIjoiT2ZmIiwiZTZHbG9iYWxTVyI6Ik9mZiIsImU2VGVycm9yaXN0QSI6Ik9mZiIsImU2VGVycm9yaXN0QSsiOiJPZmYiLCJlNlRlcnJvcmlzdEMiOiJPZmYiLCJlNlRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGTCI6Ik9mZiIsImU2VGVycm9yaXN0RyI6Ik9mZiIsImU2VGVycm9yaXN0TSI6Ik9mZiIsImU2VGVycm9yaXN0UyI6Ik9mZiIsImU2VGVycm9yaXN0U1ciOiJPZmYiLCJmMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZjFHbG9iYWxBIjp0cnVlLCJmMUdsb2JhbEErIjp0cnVlLCJmMUdsb2JhbEMiOnRydWUsImYxR2xvYmFsRkQiOmZhbHNlLCJmMUdsb2JhbEZMIjpmYWxzZSwiZjFHbG9iYWxHIjp0cnVlLCJmMUdsb2JhbE0iOnRydWUsImYxR2xvYmFsUyI6dHJ1ZSwiZjFHbG9iYWxTVyI6dHJ1ZSwiZjFUZXJyb3Jpc3RBIjpmYWxzZSwiZjFUZXJyb3Jpc3RBKyI6ZmFsc2UsImYxVGVycm9yaXN0QyI6ZmFsc2UsImYxVGVycm9yaXN0RkQiOmZhbHNlLCJmMVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFUZXJyb3Jpc3RHIjpmYWxzZSwiZjFUZXJyb3Jpc3RNIjpmYWxzZSwiZjFUZXJyb3Jpc3RTIjpmYWxzZSwiZjFUZXJyb3Jpc3RTVyI6ZmFsc2UsImYyQ291bnRlci1UZXJyb3Jpc3RBIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkQiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZMIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RHIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RNIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RTIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmMkdsb2JhbEEiOiJXYXkiLCJmMkdsb2JhbEErIjoiV2F5KyIsImYyR2xvYmFsQyI6IlJhbmRvbSIsImYyR2xvYmFsRkQiOiJOb25lIiwiZjJHbG9iYWxGTCI6Ik5vbmUiLCJmMkdsb2JhbEciOiJTZW1pLVVwIiwiZjJHbG9iYWxNIjoiVXAiLCJmMkdsb2JhbFMiOiJaZXJvIiwiZjJHbG9iYWxTVyI6IlNlbWktRG93biIsImYyVGVycm9yaXN0QSI6Ik5vbmUiLCJmMlRlcnJvcmlzdEErIjoiTm9uZSIsImYyVGVycm9yaXN0QyI6Ik5vbmUiLCJmMlRlcnJvcmlzdEZEIjoiTm9uZSIsImYyVGVycm9yaXN0RkwiOiJOb25lIiwiZjJUZXJyb3Jpc3RHIjoiTm9uZSIsImYyVGVycm9yaXN0TSI6Ik5vbmUiLCJmMlRlcnJvcmlzdFMiOiJOb25lIiwiZjJUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QSsiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEMiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZEIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0TSI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjNHbG9iYWxBIjoiUmFuZG9tIiwiZjNHbG9iYWxBKyI6IlJhbmRvbSIsImYzR2xvYmFsQyI6IlJhbmRvbSIsImYzR2xvYmFsRkQiOiJOb25lIiwiZjNHbG9iYWxGTCI6Ik5vbmUiLCJmM0dsb2JhbEciOiJTaWRld2F5cyIsImYzR2xvYmFsTSI6IlNpZGV3YXlzIiwiZjNHbG9iYWxTIjoiU2lkZXdheXMiLCJmM0dsb2JhbFNXIjoiMy1XYXkiLCJmM1RlcnJvcmlzdEEiOiJOb25lIiwiZjNUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmM1RlcnJvcmlzdEMiOiJOb25lIiwiZjNUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEZMIjoiTm9uZSIsImYzVGVycm9yaXN0RyI6Ik5vbmUiLCJmM1RlcnJvcmlzdE0iOiJOb25lIiwiZjNUZXJyb3Jpc3RTIjoiTm9uZSIsImYzVGVycm9yaXN0U1ciOiJOb25lIiwiZjRDb3VudGVyLVRlcnJvcmlzdEEiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEErIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RDIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGRCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RkwiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEciOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdE0iOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdFMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdFNXIjo1LjAsImY0R2xvYmFsQSI6NjAuMCwiZjRHbG9iYWxBKyI6NDAuMCwiZjRHbG9iYWxDIjo1LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjoyOS4wLCJmNEdsb2JhbFMiOjguMCwiZjRHbG9iYWxTVyI6NS4wLCJmNFRlcnJvcmlzdEEiOjUuMCwiZjRUZXJyb3Jpc3RBKyI6NS4wLCJmNFRlcnJvcmlzdEMiOjUuMCwiZjRUZXJyb3Jpc3RGRCI6NS4wLCJmNFRlcnJvcmlzdEZMIjo1LjAsImY0VGVycm9yaXN0RyI6NS4wLCJmNFRlcnJvcmlzdE0iOjUuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MC4wLCJmNUdsb2JhbEErIjowLjAsImY1R2xvYmFsQyI6MTAuMCwiZjVHbG9iYWxGRCI6MC4wLCJmNUdsb2JhbEZMIjowLjAsImY1R2xvYmFsRyI6MC4wLCJmNUdsb2JhbE0iOjAuMCwiZjVHbG9iYWxTIjowLjAsImY1R2xvYmFsU1ciOjAuMCwiZjVUZXJyb3Jpc3RBIjowLjAsImY1VGVycm9yaXN0QSsiOjAuMCwiZjVUZXJyb3Jpc3RDIjowLjAsImY1VGVycm9yaXN0RkQiOjAuMCwiZjVUZXJyb3Jpc3RGTCI6MC4wLCJmNVRlcnJvcmlzdEciOjAuMCwiZjVUZXJyb3Jpc3RNIjowLjAsImY1VGVycm9yaXN0UyI6MC4wLCJmNVRlcnJvcmlzdFNXIjowLjAsInBsYXllcl9zaWRlIjoiR2xvYmFsIn0= [citrine]"));
end, true);
default4NEW_antiaim = ui.create("\240\159\142\175", "\n\n", 1):button("\208\187\208\176\208\186\208\184", function()
    configs:import_antiaim(tostring("[citrine] eyJhMUNvdW50ZXItVGVycm9yaXN0Ijp0cnVlLCJhMUdsb2JhbCI6dHJ1ZSwiYTFUZXJyb3Jpc3QiOnRydWUsImEyQ291bnRlci1UZXJyb3Jpc3QiOiJDcm91Y2hpbmciLCJhMkdsb2JhbCI6IkZha2VsYWdnaW5nIiwiYTJUZXJyb3Jpc3QiOiJDcm91Y2hpbmciLCJiMUNvdW50ZXItVGVycm9yaXN0QSI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdEErIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0QyI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdEZEIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0RkwiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RHIjp0cnVlLCJiMUNvdW50ZXItVGVycm9yaXN0TSI6dHJ1ZSwiYjFDb3VudGVyLVRlcnJvcmlzdFMiOnRydWUsImIxQ291bnRlci1UZXJyb3Jpc3RTVyI6dHJ1ZSwiYjFHbG9iYWxBIjpmYWxzZSwiYjFHbG9iYWxBKyI6ZmFsc2UsImIxR2xvYmFsQyI6ZmFsc2UsImIxR2xvYmFsRkQiOmZhbHNlLCJiMUdsb2JhbEZMIjpmYWxzZSwiYjFHbG9iYWxHIjp0cnVlLCJiMUdsb2JhbE0iOmZhbHNlLCJiMUdsb2JhbFMiOmZhbHNlLCJiMUdsb2JhbFNXIjpmYWxzZSwiYjFUZXJyb3Jpc3RBIjp0cnVlLCJiMVRlcnJvcmlzdEErIjp0cnVlLCJiMVRlcnJvcmlzdEMiOnRydWUsImIxVGVycm9yaXN0RkQiOnRydWUsImIxVGVycm9yaXN0RkwiOnRydWUsImIxVGVycm9yaXN0RyI6ZmFsc2UsImIxVGVycm9yaXN0TSI6dHJ1ZSwiYjFUZXJyb3Jpc3RTIjp0cnVlLCJiMVRlcnJvcmlzdFNXIjp0cnVlLCJiMkNvdW50ZXItVGVycm9yaXN0QSI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0QSsiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdEMiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdEZEIjoiRG93biIsImIyQ291bnRlci1UZXJyb3Jpc3RGTCI6IkRvd24iLCJiMkNvdW50ZXItVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJDb3VudGVyLVRlcnJvcmlzdE0iOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdFMiOiJEb3duIiwiYjJDb3VudGVyLVRlcnJvcmlzdFNXIjoiRG93biIsImIyR2xvYmFsQSI6IkRvd24iLCJiMkdsb2JhbEErIjoiRG93biIsImIyR2xvYmFsQyI6IkRvd24iLCJiMkdsb2JhbEZEIjoiRG93biIsImIyR2xvYmFsRkwiOiJEb3duIiwiYjJHbG9iYWxHIjoiRG93biIsImIyR2xvYmFsTSI6IkRvd24iLCJiMkdsb2JhbFMiOiJEb3duIiwiYjJHbG9iYWxTVyI6IkRvd24iLCJiMlRlcnJvcmlzdEEiOiJEb3duIiwiYjJUZXJyb3Jpc3RBKyI6IkRvd24iLCJiMlRlcnJvcmlzdEMiOiJEb3duIiwiYjJUZXJyb3Jpc3RGRCI6IkRvd24iLCJiMlRlcnJvcmlzdEZMIjoiRG93biIsImIyVGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjJUZXJyb3Jpc3RNIjoiRG93biIsImIyVGVycm9yaXN0UyI6IkRvd24iLCJiMlRlcnJvcmlzdFNXIjoiRG93biIsImIzQ291bnRlci1UZXJyb3Jpc3RBIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdEErIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdEMiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RkQiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RkwiOiJBdCBUYXJnZXQiLCJiM0NvdW50ZXItVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM0NvdW50ZXItVGVycm9yaXN0TSI6IkF0IFRhcmdldCIsImIzQ291bnRlci1UZXJyb3Jpc3RTIjoiQXQgVGFyZ2V0IiwiYjNDb3VudGVyLVRlcnJvcmlzdFNXIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxBKyI6IkF0IFRhcmdldCIsImIzR2xvYmFsQyI6IkF0IFRhcmdldCIsImIzR2xvYmFsRkQiOiJBdCBUYXJnZXQiLCJiM0dsb2JhbEZMIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxHIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxNIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTIjoiQXQgVGFyZ2V0IiwiYjNHbG9iYWxTVyI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0QSsiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEMiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdEZEIjoiQXQgVGFyZ2V0IiwiYjNUZXJyb3Jpc3RGTCI6IkF0IFRhcmdldCIsImIzVGVycm9yaXN0RyI6IkxvY2FsIFZpZXciLCJiM1RlcnJvcmlzdE0iOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdFMiOiJBdCBUYXJnZXQiLCJiM1RlcnJvcmlzdFNXIjoiQXQgVGFyZ2V0IiwiYjRDb3VudGVyLVRlcnJvcmlzdEEiOiJDZW50ZXIiLCJiNENvdW50ZXItVGVycm9yaXN0QSsiOiJDZW50ZXIiLCJiNENvdW50ZXItVGVycm9yaXN0QyI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RGRCI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RGTCI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RHIjoiRGlzYWJsZWQiLCJiNENvdW50ZXItVGVycm9yaXN0TSI6IkNlbnRlciIsImI0Q291bnRlci1UZXJyb3Jpc3RTIjoiQ2VudGVyIiwiYjRDb3VudGVyLVRlcnJvcmlzdFNXIjoiQ2VudGVyIiwiYjRHbG9iYWxBIjoiQ2VudGVyIiwiYjRHbG9iYWxBKyI6IkNlbnRlciIsImI0R2xvYmFsQyI6IkNlbnRlciIsImI0R2xvYmFsRkQiOiJDZW50ZXIiLCJiNEdsb2JhbEZMIjoiQ2VudGVyIiwiYjRHbG9iYWxHIjoiQ2VudGVyIiwiYjRHbG9iYWxNIjoiQ2VudGVyIiwiYjRHbG9iYWxTIjoiQ2VudGVyIiwiYjRHbG9iYWxTVyI6IkNlbnRlciIsImI0VGVycm9yaXN0QSI6IkNlbnRlciIsImI0VGVycm9yaXN0QSsiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEMiOiJDZW50ZXIiLCJiNFRlcnJvcmlzdEZEIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RGTCI6IkNlbnRlciIsImI0VGVycm9yaXN0RyI6IkRpc2FibGVkIiwiYjRUZXJyb3Jpc3RNIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RTIjoiQ2VudGVyIiwiYjRUZXJyb3Jpc3RTVyI6IkNlbnRlciIsImI1Q291bnRlci1UZXJyb3Jpc3RBIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0QSsiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RDIjp0cnVlLCJiNUNvdW50ZXItVGVycm9yaXN0RkQiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RGTCI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJiNUNvdW50ZXItVGVycm9yaXN0TSI6dHJ1ZSwiYjVDb3VudGVyLVRlcnJvcmlzdFMiOnRydWUsImI1Q291bnRlci1UZXJyb3Jpc3RTVyI6dHJ1ZSwiYjVHbG9iYWxBIjp0cnVlLCJiNUdsb2JhbEErIjp0cnVlLCJiNUdsb2JhbEMiOnRydWUsImI1R2xvYmFsRkQiOnRydWUsImI1R2xvYmFsRkwiOnRydWUsImI1R2xvYmFsRyI6dHJ1ZSwiYjVHbG9iYWxNIjp0cnVlLCJiNUdsb2JhbFMiOnRydWUsImI1R2xvYmFsU1ciOnRydWUsImI1VGVycm9yaXN0QSI6dHJ1ZSwiYjVUZXJyb3Jpc3RBKyI6dHJ1ZSwiYjVUZXJyb3Jpc3RDIjp0cnVlLCJiNVRlcnJvcmlzdEZEIjp0cnVlLCJiNVRlcnJvcmlzdEZMIjp0cnVlLCJiNVRlcnJvcmlzdEciOmZhbHNlLCJiNVRlcnJvcmlzdE0iOnRydWUsImI1VGVycm9yaXN0UyI6dHJ1ZSwiYjVUZXJyb3Jpc3RTVyI6dHJ1ZSwiYjZDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiYjZDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJiNkNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImI2Q291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImI2R2xvYmFsQSI6dHJ1ZSwiYjZHbG9iYWxBKyI6dHJ1ZSwiYjZHbG9iYWxDIjp0cnVlLCJiNkdsb2JhbEZEIjpmYWxzZSwiYjZHbG9iYWxGTCI6ZmFsc2UsImI2R2xvYmFsRyI6dHJ1ZSwiYjZHbG9iYWxNIjp0cnVlLCJiNkdsb2JhbFMiOnRydWUsImI2R2xvYmFsU1ciOnRydWUsImI2VGVycm9yaXN0QSI6ZmFsc2UsImI2VGVycm9yaXN0QSsiOnRydWUsImI2VGVycm9yaXN0QyI6dHJ1ZSwiYjZUZXJyb3Jpc3RGRCI6ZmFsc2UsImI2VGVycm9yaXN0RkwiOmZhbHNlLCJiNlRlcnJvcmlzdEciOmZhbHNlLCJiNlRlcnJvcmlzdE0iOnRydWUsImI2VGVycm9yaXN0UyI6ZmFsc2UsImI2VGVycm9yaXN0U1ciOmZhbHNlLCJjMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEErIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0QyI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0RkwiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJjMUNvdW50ZXItVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFDb3VudGVyLVRlcnJvcmlzdFMiOiIxODAgRGVncmVlcyIsImMxQ291bnRlci1UZXJyb3Jpc3RTVyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxBIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEErIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbEMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkQiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRkwiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsRyI6IjE4MCBEZWdyZWVzIiwiYzFHbG9iYWxNIjoiMTgwIERlZ3JlZXMiLCJjMUdsb2JhbFMiOiIxODAgRGVncmVlcyIsImMxR2xvYmFsU1ciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RBKyI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RDIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZEIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEZMIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImMxVGVycm9yaXN0TSI6IjE4MCBEZWdyZWVzIiwiYzFUZXJyb3Jpc3RTIjoiMTgwIERlZ3JlZXMiLCJjMVRlcnJvcmlzdFNXIjoiMTgwIERlZ3JlZXMiLCJjMkNvdW50ZXItVGVycm9yaXN0QSI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0QSsiOjEwLjAsImMyQ291bnRlci1UZXJyb3Jpc3RDIjo5LjAsImMyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ny4wLCJjMkNvdW50ZXItVGVycm9yaXN0RkwiOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiYzJDb3VudGVyLVRlcnJvcmlzdE0iOjguMCwiYzJDb3VudGVyLVRlcnJvcmlzdFMiOjYuMCwiYzJDb3VudGVyLVRlcnJvcmlzdFNXIjo4LjAsImMyR2xvYmFsQSI6MTAuMCwiYzJHbG9iYWxBKyI6MTUuMCwiYzJHbG9iYWxDIjoxMy4wLCJjMkdsb2JhbEZEIjo4LjAsImMyR2xvYmFsRkwiOjguMCwiYzJHbG9iYWxHIjo5LjAsImMyR2xvYmFsTSI6MTAuMCwiYzJHbG9iYWxTIjoxMC4wLCJjMkdsb2JhbFNXIjoxMC4wLCJjMlRlcnJvcmlzdEEiOjkuMCwiYzJUZXJyb3Jpc3RBKyI6MTAuMCwiYzJUZXJyb3Jpc3RDIjo4LjAsImMyVGVycm9yaXN0RkQiOjcuMCwiYzJUZXJyb3Jpc3RGTCI6Ny4wLCJjMlRlcnJvcmlzdEciOjAuMCwiYzJUZXJyb3Jpc3RNIjo3LjAsImMyVGVycm9yaXN0UyI6MTAuMCwiYzJUZXJyb3Jpc3RTVyI6Ny4wLCJjM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0QSsiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEMiOjAuMCwiYzNDb3VudGVyLVRlcnJvcmlzdEZEIjowLjAsImMzQ291bnRlci1UZXJyb3Jpc3RGTCI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0RyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0TSI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0UyI6MC4wLCJjM0NvdW50ZXItVGVycm9yaXN0U1ciOjAuMCwiYzNHbG9iYWxBIjozNy4wLCJjM0dsb2JhbEErIjozOS4wLCJjM0dsb2JhbEMiOjQxLjAsImMzR2xvYmFsRkQiOjAuMCwiYzNHbG9iYWxGTCI6MC4wLCJjM0dsb2JhbEciOjAuMCwiYzNHbG9iYWxNIjo1MC4wLCJjM0dsb2JhbFMiOjQxLjAsImMzR2xvYmFsU1ciOjM3LjAsImMzVGVycm9yaXN0QSI6MC4wLCJjM1RlcnJvcmlzdEErIjowLjAsImMzVGVycm9yaXN0QyI6MC4wLCJjM1RlcnJvcmlzdEZEIjowLjAsImMzVGVycm9yaXN0RkwiOjAuMCwiYzNUZXJyb3Jpc3RHIjowLjAsImMzVGVycm9yaXN0TSI6MC4wLCJjM1RlcnJvcmlzdFMiOjAuMCwiYzNUZXJyb3Jpc3RTVyI6MC4wLCJjNENvdW50ZXItVGVycm9yaXN0QSI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0QSsiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEMiOjIuMCwiYzRDb3VudGVyLVRlcnJvcmlzdEZEIjoyLjAsImM0Q291bnRlci1UZXJyb3Jpc3RGTCI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0RyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0TSI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0UyI6Mi4wLCJjNENvdW50ZXItVGVycm9yaXN0U1ciOjIuMCwiYzRHbG9iYWxBIjo5LjAsImM0R2xvYmFsQSsiOjkuMCwiYzRHbG9iYWxDIjo5LjAsImM0R2xvYmFsRkQiOjIuMCwiYzRHbG9iYWxGTCI6Mi4wLCJjNEdsb2JhbEciOjIuMCwiYzRHbG9iYWxNIjo5LjAsImM0R2xvYmFsUyI6OS4wLCJjNEdsb2JhbFNXIjo5LjAsImM0VGVycm9yaXN0QSI6Mi4wLCJjNFRlcnJvcmlzdEErIjoyLjAsImM0VGVycm9yaXN0QyI6Mi4wLCJjNFRlcnJvcmlzdEZEIjoyLjAsImM0VGVycm9yaXN0RkwiOjIuMCwiYzRUZXJyb3Jpc3RHIjoyLjAsImM0VGVycm9yaXN0TSI6Mi4wLCJjNFRlcnJvcmlzdFMiOjIuMCwiYzRUZXJyb3Jpc3RTVyI6Mi4wLCJjb25maWdfdHlwZSI6ImFudGlhaW0iLCJkMUNvdW50ZXItVGVycm9yaXN0QSI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEErIjoiTGVmdCAmIFJpZ2h0IiwiZDFDb3VudGVyLVRlcnJvcmlzdEMiOiJMZWZ0ICYgUmlnaHQiLCJkMUNvdW50ZXItVGVycm9yaXN0RkQiOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFDb3VudGVyLVRlcnJvcmlzdEciOiIxODAgRGVncmVlcyIsImQxQ291bnRlci1UZXJyb3Jpc3RNIjoiTGVmdCAmIFJpZ2h0IiwiZDFDb3VudGVyLVRlcnJvcmlzdFMiOiJMZWZ0ICYgUmlnaHQiLCJkMUNvdW50ZXItVGVycm9yaXN0U1ciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsQSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxBKyI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxDIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZEIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEZMIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbEciOiIxODAgRGVncmVlcyIsImQxR2xvYmFsTSI6IjE4MCBEZWdyZWVzIiwiZDFHbG9iYWxTIjoiMTgwIERlZ3JlZXMiLCJkMUdsb2JhbFNXIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdEEiOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdEErIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RDIjoiTGVmdCAmIFJpZ2h0IiwiZDFUZXJyb3Jpc3RGRCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RGTCI6IjE4MCBEZWdyZWVzIiwiZDFUZXJyb3Jpc3RHIjoiMTgwIERlZ3JlZXMiLCJkMVRlcnJvcmlzdE0iOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdFMiOiJMZWZ0ICYgUmlnaHQiLCJkMVRlcnJvcmlzdFNXIjoiTGVmdCAmIFJpZ2h0IiwiZDJDb3VudGVyLVRlcnJvcmlzdEEiOi03MS4wLCJkMkNvdW50ZXItVGVycm9yaXN0QSsiOi00NC4wLCJkMkNvdW50ZXItVGVycm9yaXN0QyI6LTcxLjAsImQyQ291bnRlci1UZXJyb3Jpc3RGRCI6LTU4LjAsImQyQ291bnRlci1UZXJyb3Jpc3RGTCI6LTcxLjAsImQyQ291bnRlci1UZXJyb3Jpc3RHIjowLjAsImQyQ291bnRlci1UZXJyb3Jpc3RNIjotNjUuMCwiZDJDb3VudGVyLVRlcnJvcmlzdFMiOi01OC4wLCJkMkNvdW50ZXItVGVycm9yaXN0U1ciOi03OC4wLCJkMkdsb2JhbEEiOi03OC4wLCJkMkdsb2JhbEErIjotNzguMCwiZDJHbG9iYWxDIjotNzEuMCwiZDJHbG9iYWxGRCI6LTU4LjAsImQyR2xvYmFsRkwiOi01MS4wLCJkMkdsb2JhbEciOi03MS4wLCJkMkdsb2JhbE0iOi04NS4wLCJkMkdsb2JhbFMiOi01OC4wLCJkMkdsb2JhbFNXIjotNjUuMCwiZDJUZXJyb3Jpc3RBIjotNzEuMCwiZDJUZXJyb3Jpc3RBKyI6LTcxLjAsImQyVGVycm9yaXN0QyI6LTg1LjAsImQyVGVycm9yaXN0RkQiOi02NS4wLCJkMlRlcnJvcmlzdEZMIjotNzguMCwiZDJUZXJyb3Jpc3RHIjowLjAsImQyVGVycm9yaXN0TSI6LTgwLjAsImQyVGVycm9yaXN0UyI6LTg1LjAsImQyVGVycm9yaXN0U1ciOi05Mi4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0QSsiOi01My4wLCJkM0NvdW50ZXItVGVycm9yaXN0QyI6LTY1LjAsImQzQ291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZDNDb3VudGVyLVRlcnJvcmlzdE0iOi03MC4wLCJkM0NvdW50ZXItVGVycm9yaXN0UyI6LTUwLjAsImQzQ291bnRlci1UZXJyb3Jpc3RTVyI6MC4wLCJkM0dsb2JhbEEiOi01MS4wLCJkM0dsb2JhbEErIjotNjUuMCwiZDNHbG9iYWxDIjotNzEuMCwiZDNHbG9iYWxGRCI6MC4wLCJkM0dsb2JhbEZMIjotNTguMCwiZDNHbG9iYWxHIjowLjAsImQzR2xvYmFsTSI6LTg3LjAsImQzR2xvYmFsUyI6LTU3LjAsImQzR2xvYmFsU1ciOi01MS4wLCJkM1RlcnJvcmlzdEEiOi03NS4wLCJkM1RlcnJvcmlzdEErIjotODAuMCwiZDNUZXJyb3Jpc3RDIjotNjUuMCwiZDNUZXJyb3Jpc3RGRCI6MC4wLCJkM1RlcnJvcmlzdEZMIjowLjAsImQzVGVycm9yaXN0RyI6MC4wLCJkM1RlcnJvcmlzdE0iOi03Mi4wLCJkM1RlcnJvcmlzdFMiOi03MS4wLCJkM1RlcnJvcmlzdFNXIjotNzEuMCwiZTFDb3VudGVyLVRlcnJvcmlzdEEiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QSsiOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0QyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGRCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RGTCI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RHIjpmYWxzZSwiZTFDb3VudGVyLVRlcnJvcmlzdE0iOmZhbHNlLCJlMUNvdW50ZXItVGVycm9yaXN0UyI6ZmFsc2UsImUxQ291bnRlci1UZXJyb3Jpc3RTVyI6ZmFsc2UsImUxR2xvYmFsQSI6dHJ1ZSwiZTFHbG9iYWxBKyI6dHJ1ZSwiZTFHbG9iYWxDIjp0cnVlLCJlMUdsb2JhbEZEIjpmYWxzZSwiZTFHbG9iYWxGTCI6ZmFsc2UsImUxR2xvYmFsRyI6ZmFsc2UsImUxR2xvYmFsTSI6dHJ1ZSwiZTFHbG9iYWxTIjp0cnVlLCJlMUdsb2JhbFNXIjp0cnVlLCJlMVRlcnJvcmlzdEEiOmZhbHNlLCJlMVRlcnJvcmlzdEErIjpmYWxzZSwiZTFUZXJyb3Jpc3RDIjpmYWxzZSwiZTFUZXJyb3Jpc3RGRCI6ZmFsc2UsImUxVGVycm9yaXN0RkwiOmZhbHNlLCJlMVRlcnJvcmlzdEciOmZhbHNlLCJlMVRlcnJvcmlzdE0iOmZhbHNlLCJlMVRlcnJvcmlzdFMiOmZhbHNlLCJlMVRlcnJvcmlzdFNXIjpmYWxzZSwiZTJDb3VudGVyLVRlcnJvcmlzdEEiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEErIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RDIjoiTm9uZSIsImUyQ291bnRlci1UZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMkNvdW50ZXItVGVycm9yaXN0RkwiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdEciOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdE0iOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFMiOiJOb25lIiwiZTJDb3VudGVyLVRlcnJvcmlzdFNXIjoiTm9uZSIsImUyR2xvYmFsQSI6Ik5vbmUiLCJlMkdsb2JhbEErIjoiTm9uZSIsImUyR2xvYmFsQyI6Ik5vbmUiLCJlMkdsb2JhbEZEIjoiTm9uZSIsImUyR2xvYmFsRkwiOiJOb25lIiwiZTJHbG9iYWxHIjoiTm9uZSIsImUyR2xvYmFsTSI6Ik5vbmUiLCJlMkdsb2JhbFMiOiJOb25lIiwiZTJHbG9iYWxTVyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEEiOiJOb25lIiwiZTJUZXJyb3Jpc3RBKyI6Ik5vbmUiLCJlMlRlcnJvcmlzdEMiOiJOb25lIiwiZTJUZXJyb3Jpc3RGRCI6Ik5vbmUiLCJlMlRlcnJvcmlzdEZMIjoiTm9uZSIsImUyVGVycm9yaXN0RyI6Ik5vbmUiLCJlMlRlcnJvcmlzdE0iOiJOb25lIiwiZTJUZXJyb3Jpc3RTIjoiTm9uZSIsImUyVGVycm9yaXN0U1ciOiJOb25lIiwiZTNDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTNDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImUzQ291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlM0NvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImUzR2xvYmFsQSI6NjAuMCwiZTNHbG9iYWxBKyI6NjAuMCwiZTNHbG9iYWxDIjo2MC4wLCJlM0dsb2JhbEZEIjo2MC4wLCJlM0dsb2JhbEZMIjo2MC4wLCJlM0dsb2JhbEciOjYwLjAsImUzR2xvYmFsTSI6NjAuMCwiZTNHbG9iYWxTIjo2MC4wLCJlM0dsb2JhbFNXIjo2MC4wLCJlM1RlcnJvcmlzdEEiOjYwLjAsImUzVGVycm9yaXN0QSsiOjYwLjAsImUzVGVycm9yaXN0QyI6NjAuMCwiZTNUZXJyb3Jpc3RGRCI6NjAuMCwiZTNUZXJyb3Jpc3RGTCI6NjAuMCwiZTNUZXJyb3Jpc3RHIjo2MC4wLCJlM1RlcnJvcmlzdE0iOjYwLjAsImUzVGVycm9yaXN0UyI6NjAuMCwiZTNUZXJyb3Jpc3RTVyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEEiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RBKyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEMiOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RGRCI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdEZMIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0RyI6NjAuMCwiZTRDb3VudGVyLVRlcnJvcmlzdE0iOjYwLjAsImU0Q291bnRlci1UZXJyb3Jpc3RTIjo2MC4wLCJlNENvdW50ZXItVGVycm9yaXN0U1ciOjYwLjAsImU0R2xvYmFsQSI6NjAuMCwiZTRHbG9iYWxBKyI6NjAuMCwiZTRHbG9iYWxDIjo2MC4wLCJlNEdsb2JhbEZEIjo2MC4wLCJlNEdsb2JhbEZMIjo2MC4wLCJlNEdsb2JhbEciOjYwLjAsImU0R2xvYmFsTSI6NjAuMCwiZTRHbG9iYWxTIjo2MC4wLCJlNEdsb2JhbFNXIjo2MC4wLCJlNFRlcnJvcmlzdEEiOjYwLjAsImU0VGVycm9yaXN0QSsiOjYwLjAsImU0VGVycm9yaXN0QyI6NjAuMCwiZTRUZXJyb3Jpc3RGRCI6NjAuMCwiZTRUZXJyb3Jpc3RGTCI6NjAuMCwiZTRUZXJyb3Jpc3RHIjo2MC4wLCJlNFRlcnJvcmlzdE0iOjYwLjAsImU0VGVycm9yaXN0UyI6NjAuMCwiZTRUZXJyb3Jpc3RTVyI6NjAuMCwiZTVDb3VudGVyLVRlcnJvcmlzdEEiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RBKyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1Q291bnRlci1UZXJyb3Jpc3RGRCI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdEZMIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0RyI6W10sImU1Q291bnRlci1UZXJyb3Jpc3RNIjpbIkppdHRlciJdLCJlNUNvdW50ZXItVGVycm9yaXN0UyI6WyJKaXR0ZXIiXSwiZTVDb3VudGVyLVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNUdsb2JhbEEiOlsiSml0dGVyIl0sImU1R2xvYmFsQSsiOlsiSml0dGVyIl0sImU1R2xvYmFsQyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGRCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxGTCI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxHIjpbIkppdHRlciJdLCJlNUdsb2JhbE0iOlsiSml0dGVyIl0sImU1R2xvYmFsUyI6WyJKaXR0ZXIiXSwiZTVHbG9iYWxTVyI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RBIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEErIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdEMiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkQiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RkwiOlsiSml0dGVyIl0sImU1VGVycm9yaXN0RyI6W10sImU1VGVycm9yaXN0TSI6WyJKaXR0ZXIiXSwiZTVUZXJyb3Jpc3RTIjpbIkppdHRlciJdLCJlNVRlcnJvcmlzdFNXIjpbIkppdHRlciJdLCJlNkNvdW50ZXItVGVycm9yaXN0QSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RBKyI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RDIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEZMIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdEciOiJPZmYiLCJlNkNvdW50ZXItVGVycm9yaXN0TSI6Ik9mZiIsImU2Q291bnRlci1UZXJyb3Jpc3RTIjoiT2ZmIiwiZTZDb3VudGVyLVRlcnJvcmlzdFNXIjoiT2ZmIiwiZTZHbG9iYWxBIjoiT2ZmIiwiZTZHbG9iYWxBKyI6Ik9mZiIsImU2R2xvYmFsQyI6Ik9mZiIsImU2R2xvYmFsRkQiOiJPZmYiLCJlNkdsb2JhbEZMIjoiT2ZmIiwiZTZHbG9iYWxHIjoiT2ZmIiwiZTZHbG9iYWxNIjoiT2ZmIiwiZTZHbG9iYWxTIjoiT2ZmIiwiZTZHbG9iYWxTVyI6Ik9mZiIsImU2VGVycm9yaXN0QSI6Ik9mZiIsImU2VGVycm9yaXN0QSsiOiJPZmYiLCJlNlRlcnJvcmlzdEMiOiJPZmYiLCJlNlRlcnJvcmlzdEZEIjoiT2ZmIiwiZTZUZXJyb3Jpc3RGTCI6Ik9mZiIsImU2VGVycm9yaXN0RyI6Ik9mZiIsImU2VGVycm9yaXN0TSI6Ik9mZiIsImU2VGVycm9yaXN0UyI6Ik9mZiIsImU2VGVycm9yaXN0U1ciOiJPZmYiLCJmMUNvdW50ZXItVGVycm9yaXN0QSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RBKyI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RDIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEZMIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdEciOmZhbHNlLCJmMUNvdW50ZXItVGVycm9yaXN0TSI6ZmFsc2UsImYxQ291bnRlci1UZXJyb3Jpc3RTIjpmYWxzZSwiZjFDb3VudGVyLVRlcnJvcmlzdFNXIjpmYWxzZSwiZjFHbG9iYWxBIjp0cnVlLCJmMUdsb2JhbEErIjp0cnVlLCJmMUdsb2JhbEMiOnRydWUsImYxR2xvYmFsRkQiOmZhbHNlLCJmMUdsb2JhbEZMIjpmYWxzZSwiZjFHbG9iYWxHIjp0cnVlLCJmMUdsb2JhbE0iOnRydWUsImYxR2xvYmFsUyI6dHJ1ZSwiZjFHbG9iYWxTVyI6dHJ1ZSwiZjFUZXJyb3Jpc3RBIjpmYWxzZSwiZjFUZXJyb3Jpc3RBKyI6dHJ1ZSwiZjFUZXJyb3Jpc3RDIjp0cnVlLCJmMVRlcnJvcmlzdEZEIjpmYWxzZSwiZjFUZXJyb3Jpc3RGTCI6ZmFsc2UsImYxVGVycm9yaXN0RyI6ZmFsc2UsImYxVGVycm9yaXN0TSI6dHJ1ZSwiZjFUZXJyb3Jpc3RTIjpmYWxzZSwiZjFUZXJyb3Jpc3RTVyI6ZmFsc2UsImYyQ291bnRlci1UZXJyb3Jpc3RBIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0QyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0RkQiOiJOb25lIiwiZjJDb3VudGVyLVRlcnJvcmlzdEZMIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RHIjoiTm9uZSIsImYyQ291bnRlci1UZXJyb3Jpc3RNIjoiVXAiLCJmMkNvdW50ZXItVGVycm9yaXN0UyI6Ik5vbmUiLCJmMkNvdW50ZXItVGVycm9yaXN0U1ciOiJOb25lIiwiZjJHbG9iYWxBIjoiVXAiLCJmMkdsb2JhbEErIjoiV2F5IiwiZjJHbG9iYWxDIjoiV2F5IiwiZjJHbG9iYWxGRCI6Ik5vbmUiLCJmMkdsb2JhbEZMIjoiTm9uZSIsImYyR2xvYmFsRyI6IlNlbWktVXAiLCJmMkdsb2JhbE0iOiJFeHBlcmltZW50YWwiLCJmMkdsb2JhbFMiOiJXYXkiLCJmMkdsb2JhbFNXIjoiV2F5IiwiZjJUZXJyb3Jpc3RBIjoiTm9uZSIsImYyVGVycm9yaXN0QSsiOiJVcCIsImYyVGVycm9yaXN0QyI6IkV4cGVyaW1lbnRhbCIsImYyVGVycm9yaXN0RkQiOiJOb25lIiwiZjJUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmMlRlcnJvcmlzdEciOiJOb25lIiwiZjJUZXJyb3Jpc3RNIjoiU2VtaS1VcCIsImYyVGVycm9yaXN0UyI6Ik5vbmUiLCJmMlRlcnJvcmlzdFNXIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RBIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RBKyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0QyI6Ik5vbmUiLCJmM0NvdW50ZXItVGVycm9yaXN0RkQiOiJOb25lIiwiZjNDb3VudGVyLVRlcnJvcmlzdEZMIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RHIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RNIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RTIjoiTm9uZSIsImYzQ291bnRlci1UZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmM0dsb2JhbEEiOiJOb25lIiwiZjNHbG9iYWxBKyI6IlJhbmRvbSIsImYzR2xvYmFsQyI6IlJhbmRvbSIsImYzR2xvYmFsRkQiOiJOb25lIiwiZjNHbG9iYWxGTCI6Ik5vbmUiLCJmM0dsb2JhbEciOiJTaWRld2F5cyIsImYzR2xvYmFsTSI6IlNpZGV3YXlzIiwiZjNHbG9iYWxTIjoiTm9uZSIsImYzR2xvYmFsU1ciOiJOb25lIiwiZjNUZXJyb3Jpc3RBIjoiTm9uZSIsImYzVGVycm9yaXN0QSsiOiJTaWRld2F5cyIsImYzVGVycm9yaXN0QyI6IlJhbmRvbSIsImYzVGVycm9yaXN0RkQiOiJOb25lIiwiZjNUZXJyb3Jpc3RGTCI6Ik5vbmUiLCJmM1RlcnJvcmlzdEciOiJOb25lIiwiZjNUZXJyb3Jpc3RNIjoiU2lkZXdheXMiLCJmM1RlcnJvcmlzdFMiOiJOb25lIiwiZjNUZXJyb3Jpc3RTVyI6Ik5vbmUiLCJmNENvdW50ZXItVGVycm9yaXN0QSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0QSsiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEMiOjUuMCwiZjRDb3VudGVyLVRlcnJvcmlzdEZEIjo1LjAsImY0Q291bnRlci1UZXJyb3Jpc3RGTCI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0RyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0TSI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0UyI6NS4wLCJmNENvdW50ZXItVGVycm9yaXN0U1ciOjUuMCwiZjRHbG9iYWxBIjo0Ni4wLCJmNEdsb2JhbEErIjo2My4wLCJmNEdsb2JhbEMiOjQ4LjAsImY0R2xvYmFsRkQiOjUuMCwiZjRHbG9iYWxGTCI6NS4wLCJmNEdsb2JhbEciOjIuMCwiZjRHbG9iYWxNIjo2MC4wLCJmNEdsb2JhbFMiOjU2LjAsImY0R2xvYmFsU1ciOjU0LjAsImY0VGVycm9yaXN0QSI6NS4wLCJmNFRlcnJvcmlzdEErIjo1LjAsImY0VGVycm9yaXN0QyI6NS4wLCJmNFRlcnJvcmlzdEZEIjo1LjAsImY0VGVycm9yaXN0RkwiOjUuMCwiZjRUZXJyb3Jpc3RHIjo1LjAsImY0VGVycm9yaXN0TSI6NDAuMCwiZjRUZXJyb3Jpc3RTIjo1LjAsImY0VGVycm9yaXN0U1ciOjUuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEEiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEErIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RDIjowLjAsImY1Q291bnRlci1UZXJyb3Jpc3RGRCI6MC4wLCJmNUNvdW50ZXItVGVycm9yaXN0RkwiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdEciOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdE0iOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFMiOjAuMCwiZjVDb3VudGVyLVRlcnJvcmlzdFNXIjowLjAsImY1R2xvYmFsQSI6MC4wLCJmNUdsb2JhbEErIjoxMy4wLCJmNUdsb2JhbEMiOjEzLjAsImY1R2xvYmFsRkQiOjAuMCwiZjVHbG9iYWxGTCI6MC4wLCJmNUdsb2JhbEciOjAuMCwiZjVHbG9iYWxNIjowLjAsImY1R2xvYmFsUyI6MTAuMCwiZjVHbG9iYWxTVyI6MC4wLCJmNVRlcnJvcmlzdEEiOjAuMCwiZjVUZXJyb3Jpc3RBKyI6MC4wLCJmNVRlcnJvcmlzdEMiOjAuMCwiZjVUZXJyb3Jpc3RGRCI6MC4wLCJmNVRlcnJvcmlzdEZMIjowLjAsImY1VGVycm9yaXN0RyI6MC4wLCJmNVRlcnJvcmlzdE0iOjAuMCwiZjVUZXJyb3Jpc3RTIjowLjAsImY1VGVycm9yaXN0U1ciOjAuMCwicGxheWVyX3NpZGUiOiJUZXJyb3Jpc3QifQ== [citrine]"));
end, true);
default1NEW_antiaim:tooltip("Safe");
default2NEW_antiaim:tooltip("Aggresive #3");
default3NEW_antiaim:tooltip("Sigma");
default4NEW_antiaim:tooltip("Lucky");
side_list = {
    [1] = "Global", 
    [2] = "Counter-Terrorist", 
    [3] = "Terrorist"
};
conditional_types = {
    [1] = "G", 
    [2] = "S", 
    [3] = "M", 
    [4] = "SW", 
    [5] = "C", 
    [6] = "A", 
    [7] = "A+", 
    [8] = "FD", 
    [9] = "FL"
};
conditional_list = {
    [1] = "Global", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slow-walking", 
    [5] = "Crouching", 
    [6] = "Air", 
    [7] = "Air+", 
    [8] = "Fakeducking", 
    [9] = "Fakelagging"
};
main_f = {
    [1] = {}, 
    [2] = {}
};
pitch_f = {
    [1] = {}, 
    [2] = {}
};
base_f = {
    [1] = {}, 
    [2] = {}
};
yaw_modif_f = {
    [1] = {}, 
    [2] = {}
};
body_yaw_f = {
    [1] = {}, 
    [2] = {}
};
defensive_f = {
    [1] = {}, 
    [2] = {}
};
player_side = configs.antiaim("player_side", ui.create("\240\159\142\175", "\n\n\n", 2):combo("Player side", side_list));
for v85 = 1, #side_list do
    main_f[v85] = {
        side_switch = configs.antiaim("a1" .. side_list[v85], ui.create("\240\159\142\175", "\n\n\n", 2):switch("Enable " .. side_list[v85])), 
        player_state = configs.antiaim("a2" .. side_list[v85], ui.create("\240\159\142\175", "\n\n\n", 2):combo("Player state", conditional_list))
    };
    pitch_f[v85] = {};
    base_f[v85] = {};
    yaw_modif_f[v85] = {};
    body_yaw_f[v85] = {};
    defensive_f[v85] = {};
    for v86 = 1, #conditional_list do
        main_f[v85][v86] = {
            condition_switch = configs.antiaim("b1" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):switch("Enable " .. conditional_list[v86] .. " Condition")), 
            pitch = configs.antiaim("b2" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):combo("Pitch", {
                [1] = "Disabled", 
                [2] = "Down"
            })), 
            base = configs.antiaim("b3" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):combo("Base", {
                [1] = "Local View", 
                [2] = "At Target"
            })), 
            yaw_modifier = configs.antiaim("b4" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):combo("Yaw Modifier", {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "Spin", 
                [6] = "3-Way", 
                [7] = "5-Way"
            })), 
            body_yaw = configs.antiaim("b5" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):switch("Body Yaw")), 
            defensive = configs.antiaim("b6" .. side_list[v85] .. conditional_types[v86], ui.create("\240\159\142\175", "\n\n\n\n", 2):switch("Defensive AA"))
        };
        pitch_f[v85][v86] = {};
        base_f[v85][v86] = {
            mode = configs.antiaim("c1" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].base:create():combo("Mode", {
                [1] = "180 Degrees", 
                [2] = "Left & Right", 
                [3] = "L & R Delaying", 
                [4] = "Random"
            })), 
            offset = configs.antiaim("c2" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].base:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset", -180, 180, 0)), 
            offset_two = configs.antiaim("c3" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].base:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset #2", -180, 180, 0)), 
            delaying = configs.antiaim("c4" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].base:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Delaying", 2, 30, 0, 1, "t"))
        };
        yaw_modif_f[v85][v86] = {
            mode = configs.antiaim("d1" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].yaw_modifier:create():combo("Mode", {
                [1] = "180 Degrees", 
                [2] = "Left & Right", 
                [3] = "Random", 
                [4] = "Unmatched"
            })), 
            offset = configs.antiaim("d2" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].yaw_modifier:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset", -180, 180, 0)), 
            offset_two = configs.antiaim("d3" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].yaw_modifier:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset #2", -180, 180, 0))
        };
        body_yaw_f[v85][v86] = {
            inverter = configs.antiaim("e1" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():switch("Inverter")), 
            mode = configs.antiaim("e2" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():combo("Mode", {
                [1] = "None", 
                [2] = "Random"
            })), 
            left_limit = configs.antiaim("e3" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Left Limit", 0, 60, 60)), 
            right_limit = configs.antiaim("e4" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Right Limit", 0, 60, 60)), 
            options = configs.antiaim("e5" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():selectable("Options", {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Randomize Jitter", 
                [4] = "Anti Bruteforce"
            })), 
            freestanding = configs.antiaim("e6" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].body_yaw:create():combo("Freestanding", {
                [1] = "Off", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            }))
        };
        defensive_f[v85][v86] = {
            work_with_hs = configs.antiaim("f1" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].defensive:create():switch("Working with Hide Shots")), 
            pitch = configs.antiaim("f2" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].defensive:create():combo("Pitch", {
                [1] = "None", 
                [2] = "Down", 
                [3] = "Up", 
                [4] = "Semi-Up", 
                [5] = "Semi-Down", 
                [6] = "Zero", 
                [7] = "Random", 
                [8] = "Experimental", 
                [9] = "Way", 
                [10] = "Meta", 
                [11] = "Way+"
            })), 
            yaw = configs.antiaim("f3" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].defensive:create():combo("Yaw", {
                [1] = "None", 
                [2] = "Opposite", 
                [3] = "Sideways", 
                [4] = "Spin", 
                [5] = "3-Way", 
                [6] = "5-Way", 
                [7] = "Random", 
                [8] = "Custom", 
                [9] = "Opposite Way"
            })), 
            speed = configs.antiaim("f4" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].defensive:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Speed", 0, 100, 5, 1, "%")), 
            offset = configs.antiaim("f5" .. side_list[v85] .. conditional_types[v86], main_f[v85][v86].defensive:create():slider(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset", -180, 180, 0))
        };
    end;
end;
refs.antiaim = {
    enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_modif_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
};
refs.override_yaw_offset = function(v87)
    refs.antiaim.yaw_offset:override(v87);
    rage.antiaim:override_hidden_yaw_offset(v87);
end;
refs.player_state = function(v88)
    local v89 = entity.get_local_player();
    if not v89 or not v89:is_alive() then
        return;
    else
        local v90 = v89.m_flDuckAmount > 0.7;
        local v91 = bit.band(v89.m_fFlags, 1) == 1;
        local v92 = bit.band(v89.m_fFlags, 1) == 0 or common.is_button_down(32);
        local l_m_vecVelocity_0 = v89.m_vecVelocity;
        local v94 = math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2) > 5;
        local v95 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
        local v96 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        if not v88 and refs.get_fakelag() then
            return "Fakelagging";
        elseif not v88 and v95 and v91 then
            return "Fakeducking";
        elseif v92 and v90 then
            return "Air+";
        elseif v92 then
            return "Air";
        elseif not v95 and v90 then
            return "Crouching";
        elseif v91 and v96 then
            return "Slow-walking";
        elseif v91 and v94 then
            return "Moving";
        elseif v91 and not v94 then
            return "Standing";
        else
            return;
        end;
    end;
end;
refs.fast_ladder = function(v97)
    v97.roll = 0;
    if common.is_button_down(87) then
        v97.view_angles.y = v97.view_angles.y + 120;
        v97.view_angles.x = 89;
        v97.in_moveright = 1;
        v97.in_moveleft = 0;
        v97.in_forward = 0;
        v97.in_back = 1;
    end;
    if common.is_button_down(83) then
        v97.view_angles.y = v97.view_angles.y + 120;
        v97.view_angles.x = 89;
        v97.in_moveright = 0;
        v97.in_moveleft = 1;
        v97.in_forward = 1;
        v97.in_back = 0;
    end;
end;
refs.warmup_preset = function()
    refs.antiaim.hidden:override(true);
    rage.antiaim:override_hidden_pitch(89);
    rage.antiaim:override_hidden_yaw_offset(math.random(-90, 90));
    refs.antiaim.body_yaw:override(true);
end;
refs.hide_head = function(v98)
    if settings.hide_head:get("Knife") and bit.band(v98.m_fFlags, 1) == 0 then
        for _, v100 in pairs({
            [1] = 41, 
            [2] = 42, 
            [3] = 59, 
            [4] = 500, 
            [5] = 503, 
            [6] = 505, 
            [7] = 506, 
            [8] = 507, 
            [9] = 508, 
            [10] = 509, 
            [11] = 512, 
            [12] = 514, 
            [13] = 515, 
            [14] = 516, 
            [15] = 517, 
            [16] = 518, 
            [17] = 519, 
            [18] = 520, 
            [19] = 521, 
            [20] = 522, 
            [21] = 523, 
            [22] = 525
        }) do
            if not v98:get_player_weapon() then
                return;
            elseif v100 == v98:get_player_weapon():get_weapon_index() then
                refs.antiaim.hidden:override(false);
                refs.antiaim.pitch:override("Down");
                refs.antiaim.base:override("At Target");
                refs.override_yaw_offset(0);
                refs.antiaim.yaw_modifier:override("Disabled");
                refs.antiaim.body_yaw:override(true);
                refs.antiaim.left_limit:override(60);
                refs.antiaim.right_limit:override(60);
                refs.antiaim.options:override("");
                return;
            end;
        end;
    end;
    local v101 = bit.band(v98.m_fFlags, 1) == 1 and not common.is_button_down(32);
    local v102 = v98.m_flDuckAmount > 0.7;
    local v103 = bit.band(v98.m_fFlags, 1) == 0 or common.is_button_down(32);
    if settings.hide_head:get("Taser") and bit.band(v98.m_fFlags, 1) == 0 and v98:get_player_weapon():get_weapon_index() == 31 then
        refs.antiaim.hidden:override(false);
        refs.antiaim.pitch:override("Down");
        refs.antiaim.base:override("At Target");
        refs.override_yaw_offset(23);
        refs.antiaim.yaw_modifier:override("Disabled");
        refs.antiaim.body_yaw:override(true);
        refs.antiaim.left_limit:override(60);
        refs.antiaim.right_limit:override(30);
        refs.antiaim.options:override("");
        return;
    elseif settings.hide_head:get("Air crouch") and v103 and v102 and not v101 then
        refs.antiaim.hidden:override(false);
        refs.antiaim.pitch:override("Down");
        refs.antiaim.base:override("At Target");
        refs.override_yaw_offset(0);
        refs.antiaim.yaw_modifier:override("Disabled");
        refs.antiaim.body_yaw:override(true);
        refs.antiaim.left_limit:override(25);
        refs.antiaim.right_limit:override(25);
        refs.antiaim.options:override("");
        return;
    else
        local v104 = entity.get_threat();
        local v105 = entity.get_threat(true);
        if v104 == nil or v105 == nil then
            return;
        elseif not v104:is_enemy() or not v105:is_enemy() then
            return;
        else
            if v98:get_origin().z >= v104:get_origin().z and v105:get_index() == v104:get_index() and not v104:is_dormant() then
                local v106 = vector(v104:get_origin().z):dist((vector(v98:get_origin().z))) > 5;
                if settings.hide_head:get("Stand") and refs.player_state() == "Standing" and v106 then
                    refs.antiaim.hidden:override(false);
                    refs.antiaim.pitch:override("Down");
                    refs.antiaim.base:override("At Target");
                    refs.override_yaw_offset(15);
                    refs.antiaim.yaw_modifier:override("Disabled");
                    refs.antiaim.body_yaw:override(true);
                    refs.antiaim.left_limit:override(24);
                    refs.antiaim.right_limit:override(24);
                    refs.antiaim.options:override("");
                    return;
                elseif settings.hide_head:get("Crouch") and v102 and not v103 and v106 then
                    refs.antiaim.hidden:override(false);
                    refs.antiaim.pitch:override("Down");
                    refs.antiaim.base:override("At Target");
                    refs.override_yaw_offset(27);
                    refs.antiaim.yaw_modifier:override("Disabled");
                    refs.antiaim.body_yaw:override(true);
                    refs.antiaim.left_limit:override(45);
                    refs.antiaim.right_limit:override(45);
                    refs.antiaim.options:override("");
                    return;
                end;
            end;
            return;
        end;
    end;
end;
refs.lag_correction = function()
    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(nil);
    if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
        if settings.lag_correction:get("Double tap") then
            ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(1);
        end;
    elseif ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and settings.lag_correction:get("Hide shots") then
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(1);
    end;
end;
refs.sideways_antiaim = function()
    if sideways.side:get() ~= "Disabled" then
        if sideways.disable_yaw_modif:get() then
            refs.antiaim.yaw_modifier:override("Disabled");
        end;
        if sideways.disable_body:get() then
            refs.antiaim.body_yaw:override(false);
        end;
    end;
    if sideways.side:get() == "Left" then
        refs.antiaim.yaw_offset:override(sideways.offset:get() * -1);
    elseif sideways.side:get() == "Right" then
        refs.antiaim.yaw_offset:override(sideways.offset:get());
    elseif sideways.side:get() == "Forward" then
        refs.antiaim.yaw_offset:override(180);
    end;
end;
refs.antiaim_on_use = function(v107, v108)
    if not v107.in_use then
        hostage_distance = 55;
        bomb_distance = 60;
        start_time = globals.realtime;
        return;
    elseif hostage_distance == nil or bomb_distance == nil then
        return;
    else
        if #entity.get_entities("CHostage") > 0 and v108.m_iTeamNum ~= 2 then
            hostage_distance = math.min(v108:get_origin():dist(entity.get_entities("CHostage")[1]:get_origin()), v108:get_origin():dist(entity.get_entities("CHostage")[2]:get_origin()));
        elseif #entity.get_entities("CPlantedC4") > 0 and v108.m_iTeamNum ~= 2 then
            bomb_distance = v108:get_origin():dist(entity.get_entities("CPlantedC4")[1]:get_origin());
        end;
        if hostage_distance < 55 or bomb_distance < 60 then
            return;
        elseif v107.in_use and globals.realtime - start_time < 0.02 then
            return;
        else
            refs.antiaim.hidden:override(false);
            refs.antiaim.pitch:override("Disabled");
            refs.antiaim.base:override("Local View");
            refs.antiaim.yaw_offset:override(180);
            refs.antiaim.yaw_modifier:override("Disabled");
            refs.antiaim.body_yaw:override(true);
            refs.antiaim.left_limit:override(60);
            refs.antiaim.right_limit:override(60);
            refs.antiaim.options:override("");
            v107.in_use = false;
            return;
        end;
    end;
end;
refs.get_fakelag = function()
    if ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):get() and ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):get() > 1 then
        if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
            return false;
        elseif ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
delayings = {};
antiaim_builder_f = function(v109)
    if not main_switch:get() then
        return;
    else
        local v110 = entity.get_local_player();
        if not v110 or not v110:is_alive() then
            return;
        else
            refs.antiaim.avoid_backstab:override(settings.customizations:get("Anti-knife system"));
            if settings.customizations:get("Lag correction") then
                refs.lag_correction();
            end;
            if settings.customizations:get("Climbing the ladder quickly") and v110.m_MoveType == 9 then
                refs.fast_ladder(v109);
            end;
            if settings.customizations:get("Anti-aim in the warmup") and entity.get_game_rules().m_bWarmupPeriod then
                refs.warmup_preset();
                return;
            else
                local l_m_iTeamNum_0 = v110.m_iTeamNum;
                for v112 = 2, #conditional_list do
                    if refs.player_state() == conditional_list[v112] then
                        if main_f[3].side_switch:get() and main_f[3][v112].condition_switch:get() and l_m_iTeamNum_0 == 2 then
                            sidev = 3;
                            condtion = v112;
                        elseif main_f[2].side_switch:get() and main_f[2][v112].condition_switch:get() and l_m_iTeamNum_0 == 3 then
                            sidev = 2;
                            condtion = v112;
                        elseif main_f[1][v112].condition_switch:get() then
                            sidev = 1;
                            condtion = v112;
                        elseif main_f[3].side_switch:get() and main_f[3][1].condition_switch:get() and l_m_iTeamNum_0 == 2 then
                            sidev = 3;
                            condtion = 1;
                        elseif main_f[2].side_switch:get() and main_f[2][1].condition_switch:get() and l_m_iTeamNum_0 == 3 then
                            sidev = 2;
                            condtion = 1;
                        elseif main_f[1][1].condition_switch:get() then
                            sidev = 1;
                            condtion = 1;
                        end;
                    end;
                end;
                if #delayings < 1 then
                    for v113 = 1, 2 do
                        delayings[v113] = 0;
                    end;
                    return;
                else
                    pitch = main_f[sidev][condtion].pitch:get();
                    base = main_f[sidev][condtion].base:get();
                    yaw_modifier = main_f[sidev][condtion].yaw_modifier:get();
                    body_yaw = main_f[sidev][condtion].body_yaw:get();
                    defensive = main_f[sidev][condtion].defensive:get();
                    yaw_mode = base_f[sidev][condtion].mode:get();
                    yaw_offset = base_f[sidev][condtion].offset:get();
                    yaw_offset_two = base_f[sidev][condtion].offset_two:get();
                    yaw_delaying = base_f[sidev][condtion].delaying:get();
                    yaw_modif_mode = yaw_modif_f[sidev][condtion].mode:get();
                    yaw_modif_offset = yaw_modif_f[sidev][condtion].offset:get();
                    yaw_modif_offset_two = yaw_modif_f[sidev][condtion].offset_two:get();
                    inverter = body_yaw_f[sidev][condtion].inverter:get();
                    desync_mode = body_yaw_f[sidev][condtion].mode:get();
                    left_limit = body_yaw_f[sidev][condtion].left_limit:get();
                    right_limit = body_yaw_f[sidev][condtion].right_limit:get();
                    options = body_yaw_f[sidev][condtion].options:get();
                    freestanding = body_yaw_f[sidev][condtion].freestanding:get();
                    work_with_hs = defensive_f[sidev][condtion].work_with_hs:get();
                    def_pitch = defensive_f[sidev][condtion].pitch:get();
                    def_yaw = defensive_f[sidev][condtion].yaw:get();
                    def_speed = defensive_f[sidev][condtion].speed:get();
                    def_offset = defensive_f[sidev][condtion].offset:get();
                    if pitch == "Disabled" then
                        refs.antiaim.pitch:override(pitch);
                        rage.antiaim:override_hidden_pitch(0);
                    elseif pitch == "Down" then
                        refs.antiaim.pitch:override(pitch);
                        rage.antiaim:override_hidden_pitch(89);
                    end;
                    refs.antiaim.yaw:override("Backward");
                    refs.antiaim.base:override(base);
                    refs.antiaim.yaw_modifier:override(yaw_modifier);
                    refs.antiaim.body_yaw:override(body_yaw);
                    if yaw_mode == "180 Degrees" then
                        refs.override_yaw_offset(yaw_offset);
                    elseif yaw_mode == "Left & Right" then
                        local v114 = globals.tickcount % 3 < 1;
                        refs.override_yaw_offset(v114 and yaw_offset or yaw_offset_two);
                    elseif yaw_mode == "L & R Delaying" then
                        if delayings[1] >= yaw_delaying then
                            delayings[1] = 0;
                        else
                            delayings[1] = delayings[1] + 1;
                        end;
                        if delayings[1] == 0 and yaw_offset ~= refs.helpers.antiaim.active_side.yaw then
                            refs.helpers.antiaim.active_side.yaw = yaw_offset;
                        elseif delayings[1] == 0 and yaw_offset == refs.helpers.antiaim.active_side.yaw then
                            refs.helpers.antiaim.active_side.yaw = yaw_offset_two;
                        end;
                        for v115 = 1, #options do
                            if options[v115] == "Jitter" then
                                if yaw_offset ~= refs.helpers.antiaim.active_side.yaw then
                                    rage.antiaim:inverter(false);
                                elseif yaw_offset == refs.helpers.antiaim.active_side.yaw then
                                    rage.antiaim:inverter(true);
                                end;
                            end;
                        end;
                        refs.override_yaw_offset(refs.helpers.antiaim.active_side.yaw);
                    elseif yaw_mode == "Random" then
                        local v116 = math.random(yaw_offset, yaw_offset_two);
                        refs.override_yaw_offset(v116);
                    end;
                    if yaw_modif_mode == "180 Degrees" then
                        refs.antiaim.yaw_modif_offset:override(yaw_modif_offset);
                    elseif yaw_modif_mode == "Left & Right" then
                        local v117 = globals.tickcount % 3 < 1;
                        refs.antiaim.yaw_modif_offset:override(v117 and yaw_modif_offset or yaw_modif_offset_two);
                    elseif yaw_modif_mode == "Random" then
                        local v118 = math.random(yaw_modif_offset, yaw_modif_offset_two);
                        refs.antiaim.yaw_modif_offset:override(v118);
                    elseif yaw_modif_mode == "Unmatched" then
                        refs.antiaim.yaw_modif_offset:override(yaw_modif_offset);
                        if get_defensive() then
                            refs.antiaim.yaw_modif_offset:override(yaw_modif_offset_two);
                        end;
                    end;
                    refs.antiaim.inverter:override(inverter);
                    if desync_mode == "None" then
                        refs.antiaim.left_limit:override(left_limit);
                        refs.antiaim.right_limit:override(right_limit);
                    elseif desync_mode == "Random" then
                        local v119 = math.random(left_limit, right_limit);
                        refs.antiaim.left_limit:override(v119);
                        refs.antiaim.right_limit:override(v119);
                    end;
                    refs.antiaim.options:override(options);
                    refs.antiaim.freestanding:override(freestanding);
                    if defensive and work_with_hs then
                        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override("Break LC");
                    else
                        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override(nil);
                    end;
                    if defensive then
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
                    else
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(nil);
                    end;
                    refs.antiaim.hidden:override(defensive);
                    if defensive and sideways.side:get() == "Disabled" and get_defensive() then
                        if def_pitch == "Down" then
                            rage.antiaim:override_hidden_pitch(89);
                        elseif def_pitch == "Up" then
                            rage.antiaim:override_hidden_pitch(-89);
                        elseif def_pitch == "Semi-Up" then
                            rage.antiaim:override_hidden_pitch(-44.5);
                        elseif def_pitch == "Semi-Down" then
                            rage.antiaim:override_hidden_pitch(44.5);
                        elseif def_pitch == "Zero" then
                            rage.antiaim:override_hidden_pitch(0);
                        elseif def_pitch == "Random" then
                            rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                        elseif def_pitch == "Experimental" then
                            rage.antiaim:override_hidden_pitch(math.random(-89, -10));
                        elseif def_pitch == "Meta" then
                            local v120 = globals.tickcount * def_speed % 179 - 89;
                            rage.antiaim:override_hidden_pitch(v120);
                        elseif def_pitch == "Way" then
                            local v121 = globals.tickcount % 3;
                            if v121 == 2 then
                                rage.antiaim:override_hidden_pitch(-89);
                            end;
                            if v121 == 1 then
                                rage.antiaim:override_hidden_pitch(0);
                            end;
                            if v121 == 0 then
                                rage.antiaim:override_hidden_pitch(89);
                            end;
                        elseif def_pitch == "Way+" then
                            local v122 = globals.tickcount % 7;
                            if v122 == 5 then
                                rage.antiaim:override_hidden_pitch(-89);
                            end;
                            if v122 == 4 then
                                rage.antiaim:override_hidden_pitch(-45);
                            end;
                            if v122 == 3 then
                                rage.antiaim:override_hidden_pitch(-20);
                            end;
                            if v122 == 2 then
                                rage.antiaim:override_hidden_pitch(20);
                            end;
                            if v122 == 1 then
                                rage.antiaim:override_hidden_pitch(45);
                            end;
                            if v122 == 0 then
                                rage.antiaim:override_hidden_pitch(89);
                            end;
                        end;
                        if def_yaw == "Opposite" then
                            rage.antiaim:override_hidden_yaw_offset(180);
                        elseif def_yaw == "Sideways" then
                            local v123 = globals.tickcount % 3 < 1;
                            rage.antiaim:override_hidden_yaw_offset(v123 and -90 or 90);
                        elseif def_yaw == "Spin" then
                            if rage.antiaim:inverter() then
                                local v124 = globals.tickcount * def_speed / 5 % 180 * -1;
                                rage.antiaim:override_hidden_yaw_offset(v124);
                            else
                                local v125 = globals.tickcount * def_speed / 5 % 180;
                                rage.antiaim:override_hidden_yaw_offset(v125);
                            end;
                        elseif def_yaw == "3-Way" then
                            local v126 = globals.tickcount % 3;
                            if v126 == 2 then
                                rage.antiaim:override_hidden_yaw_offset(-65);
                            end;
                            if v126 == 1 then
                                rage.antiaim:override_hidden_yaw_offset(65);
                            end;
                            if v126 == 0 then
                                rage.antiaim:override_hidden_yaw_offset(0);
                            end;
                        elseif def_yaw == "5-Way" then
                            local v127 = globals.tickcount % 5;
                            if v127 == 4 then
                                rage.antiaim:override_hidden_yaw_offset(-35);
                            end;
                            if v127 == 3 then
                                rage.antiaim:override_hidden_yaw_offset(35);
                            end;
                            if v127 == 2 then
                                rage.antiaim:override_hidden_yaw_offset(-70);
                            end;
                            if v127 == 1 then
                                rage.antiaim:override_hidden_yaw_offset(70);
                            end;
                            if v127 == 0 then
                                rage.antiaim:override_hidden_yaw_offset(0);
                            end;
                        elseif def_yaw == "Opposite Way" then
                            local v128 = globals.tickcount % 5;
                            if v128 == 3 then
                                rage.antiaim:override_hidden_yaw_offset(80);
                            end;
                            if v128 == 2 then
                                rage.antiaim:override_hidden_yaw_offset(-80);
                            end;
                            if v128 == 1 then
                                rage.antiaim:override_hidden_yaw_offset(120);
                            end;
                            if v128 == 0 then
                                rage.antiaim:override_hidden_yaw_offset(-120);
                            end;
                        elseif def_yaw == "Random" then
                            rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                        elseif def_yaw == "Custom" then
                            rage.antiaim:override_hidden_yaw_offset(def_offset);
                        end;
                    end;
                    if settings.customizations:get("Hide head") then
                        refs.hide_head(v110);
                    end;
                    refs.sideways_antiaim();
                    if settings.customizations:get("Anti-aim on use") then
                        refs.antiaim_on_use(v109, v110);
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
call = function(v129, v130)
    return function(...)
        -- upvalues: v129 (ref), v130 (ref)
        return v129(v130, ...);
    end;
end;
entitys = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
entity_address = call(ffi.cast("get_client_entity_t", entitys[0][3]), entitys);
events.post_update_clientside_animation:set(function(_)
    if not main_switch:get() or #anim_changer.list:get() == 0 then
        return;
    else
        local v132 = entity.get_local_player();
        if not v132 or not v132:is_alive() then
            return;
        else
            local v133 = entity_address(v132:get_index());
            if anim_changer.list:get("On land") then
                if anim_changer.on_land:get() == "Sliding" then
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                    v132.m_flPoseParameter[0] = 1;
                elseif anim_changer.on_land:get() == "Walking" then
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
                    v132.m_flPoseParameter[7] = 1;
                elseif anim_changer.on_land:get() == "Jitter" then
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                    if globals.tickcount % 3 == 0 then
                        v132.m_flPoseParameter[0] = 1;
                    else
                        v132.m_flPoseParameter[0] = 0.2;
                    end;
                end;
            end;
            if not ground or not end_time then
                ground = 0;
                end_time = 0;
            end;
            if anim_changer.list:get("In air") then
                if anim_changer.in_air:get() == "Frozen" and bit.band(v132.m_fFlags, 1) == 0 then
                    v132.m_flPoseParameter[6] = 1;
                elseif anim_changer.in_air:get() == "Walking" and bit.band(v132.m_fFlags, 1) == 0 then
                    ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v133) + 10640)[0][6].m_flWeight = 1;
                elseif anim_changer.in_air:get() == "Break walking" and bit.band(v132.m_fFlags, 1) == 0 then
                    ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v133) + 10640)[0][6].m_flWeight = 0.3;
                end;
            end;
            if anim_changer.list:get("Pitch 0 when landing") then
                if bit.band(v132.m_fFlags, 1) == 0 then
                    ground = 0;
                    end_time = globals.curtime + 0.5;
                else
                    ground = ground + 1;
                end;
                if ground > 1 and end_time > globals.curtime then
                    v132.m_flPoseParameter[12] = 0.5;
                end;
            end;
            if anim_changer.list:get("Lean walking") and refs.player_state("") ~= "Standing" then
                ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v133) + 10640)[0][12].m_flWeight = anim_changer.lean_walking:get() / 100;
            end;
            return;
        end;
    end;
end);
tabs_settings = ui.create("\226\154\153\239\184\143", "", 1):list("", {
    [1] = "Ragebot", 
    [2] = "Visuals", 
    [3] = "Misc"
});
ragebot = {};
ragebot.aimbot_log = configs.item("ragebot.aimbot_log", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Aimbot log"));
ragebot.aimbot_log_hit_picker = configs.item("ragebot.aimbot_log_hit_picker", ragebot.aimbot_log:create():color_picker("Hit", color("#8FC82EFF")));
ragebot.aimbot_log_miss_picker = configs.item("ragebot.aimbot_log_miss_picker", ragebot.aimbot_log:create():color_picker("Miss", color("#FF7575FF")));
ragebot.aimbot_log_type = configs.item("ragebot.aimbot_log_type", ragebot.aimbot_log:create():selectable("", {
    [1] = "Console", 
    [2] = "Events"
}));
ragebot.custom_hitchance = configs.item("ragebot.custom_hitchance", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Custom hitchance"));
ragebot.custom_hitchance_weapons = configs.item("ragebot.custom_hitchance_weapons", ragebot.custom_hitchance:create():selectable("Weapons", {
    [1] = "Scout", 
    [2] = "Auto", 
    [3] = "Awp"
}));
ragebot.custom_hitchance_mode = configs.item("ragebot.custom_hitchance_mode", ragebot.custom_hitchance:create():selectable("Mode", {
    [1] = "Air", 
    [2] = "No scope"
}));
ragebot.custom_hitchance_hc_air = configs.item("ragebot.custom_hitchance_hc_air", ragebot.custom_hitchance:create():slider("Air hitchance", 0, 100, 0, 1, function(v134)
    if v134 < 1 then
        return "off";
    else
        return v134 .. "%";
    end;
end));
ragebot.custom_hitchance_hc_ns = configs.item("ragebot.custom_hitchance_hc_ns", ragebot.custom_hitchance:create():slider("No scope hitchance", 0, 100, 0, 1, function(v135)
    if v135 < 1 then
        return "off";
    else
        return v135 .. "%";
    end;
end));
ragebot.auto_teleport = configs.item("ragebot.auto_teleport", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Auto teleport"));
ragebot.auto_teleport_weapons = configs.item("ragebot.auto_teleport_weapons", ragebot.auto_teleport:create():selectable("Weapons", {
    [1] = "Scout", 
    [2] = "Awp", 
    [3] = "Knife", 
    [4] = "Taser"
}));
ragebot.lag_exploit = configs.item("ragebot.lag_exploit", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Lag Exploit"));
ragebot.air_strafe_fix = configs.item("ragebot.air_strafe_fix", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Air strafe fix"));
ragebot.auto_body_aim = configs.item("ragebot.auto_body_aim", ui.create("\226\154\153\239\184\143", "\n", 2):switch("Auto body aim"));
ragebot.auto_body_aim_lethal = configs.item("ragebot.auto_body_aim_lethal", ragebot.auto_body_aim:create():switch("If lethal"));
visuals = {};
visuals.crosshair_indicator = configs.item("visuals.crosshair_indicator", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Crosshair indicator"));
visuals.crosshair_indicator_primary_color = configs.item("visuals.crosshair_indicator_primary_color", visuals.crosshair_indicator:create():color_picker("Primary color", color("444343FF")));
visuals.crosshair_indicator_second_color = configs.item("visuals.crosshair_indicator_second_color", visuals.crosshair_indicator:create():color_picker("Second color", color("FFFFFFFF")));
visuals.custom_scope_overlay = configs.item("visuals.custom_scope_overlay", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Custom scope overlay"));
visuals.custom_scope_overlay_color = configs.item("visuals.custom_scope_overlay_color", visuals.custom_scope_overlay:create():color_picker("Color"));
visuals.custom_scope_overlay_style = configs.item("visuals.custom_scope_overlay_style", visuals.custom_scope_overlay:create():combo("Style", {
    [1] = "Default", 
    [2] = "T"
}));
visuals.custom_scope_overlay_line = configs.item("visuals.custom_scope_overlay_line", visuals.custom_scope_overlay:create():slider("Line", 0, 250, 75));
visuals.custom_scope_overlay_gap = configs.item("visuals.custom_scope_overlay_gap", visuals.custom_scope_overlay:create():slider("Gap", 0, 250, 5));
visuals.custom_scope_overlay_inverted = configs.item("visuals.custom_scope_overlay_inverted", visuals.custom_scope_overlay:create():switch("Inverted"));
visuals.custom_scope_overlay_spread_based = configs.item("visuals.custom_scope_overlay_spread_based", visuals.custom_scope_overlay:create():switch("Spread based"));
visuals.damage_indicator = configs.item("visuals.damage_indicator", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Damage indicator"));
visuals.damage_indicator_color = configs.item("visuals.damage_indicator_color", visuals.damage_indicator:create():color_picker("Color"));
visuals.manual_arrows = configs.item("visuals.manual_arrows", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Manual arrows"));
visuals.manual_arrows_color = configs.item("visuals.manual_arrows_color", visuals.manual_arrows:create():color_picker("Color", color("#FFFFFFFF")));
visuals.custom_background = configs.item("visuals.custom_background", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Custom background"));
visuals.custom_background_style = configs.item("visuals.custom_background_style", visuals.custom_background:create():list("", {
    [1] = "Blur"
}));
visuals.custom_background_strength = configs.item("visuals.custom_background_strength", visuals.custom_background:create():slider("", 0, 10, 5, 0.1));
visuals.custom_background_alpha = configs.item("visuals.custom_background_alpha", visuals.custom_background:create():slider("", 1, 10, 5, 0.1));
visuals.revolver_helper = configs.item("visuals.revolver_helper", ui.create("\226\154\153\239\184\143", "\n\n", 2):switch("Revolver helper"));
visuals.revolver_helper_color = configs.item("visuals.revolver_helper_color", visuals.revolver_helper:create():color_picker("Color", color("#FFFFFFFF")));
misc = {};
misc.trash_talking = configs.item("misc.trash_talking", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Trash talking"));
misc.trash_talking_warmup = configs.item("misc.trash_talking_warmup", misc.trash_talking:create():switch("Disable on warmup"));
misc.trash_talking_delay = configs.item("misc.trash_talking_delay", misc.trash_talking:create():slider("Delay", 1, 5));
misc.clantag_spammer = configs.item("misc.clantag_spammer", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Clantag spammer"));
misc.auto_mute = configs.item("misc.auto_mute", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Auto mute"));
misc.auto_mute_mute_enemy = configs.item("misc.auto_mute_mute_enemy", misc.auto_mute:create():switch("Only enemy", true));
misc.auto_mute_mode = configs.item("misc.auto_mute_mode", misc.auto_mute:create():combo("", {
    [1] = "Mute", 
    [2] = "Unmute"
}));
misc.override_viewmodel = configs.item("misc.override_viewmodel", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Viewmodel"));
misc.override_viewmodel_fov = configs.item("misc.override_viewmodel_fov", misc.override_viewmodel:create():slider("Fov", 54, 68, 60));
misc.override_viewmodel_offset_x = configs.item("misc.override_viewmodel_offset_x", misc.override_viewmodel:create():slider("Offset X", -20, 25, 10, 0.1));
misc.override_viewmodel_offset_y = configs.item("misc.override_viewmodel_offset_y", misc.override_viewmodel:create():slider("Offset Y", -20, 20, 10, 0.1));
misc.override_viewmodel_offset_z = configs.item("misc.override_viewmodel_offset_z", misc.override_viewmodel:create():slider("Offset Z", -20, 20, -10, 0.1));
misc.override_viewmodel_right_hand = configs.item("misc.override_viewmodel_right_hand", misc.override_viewmodel:create():switch("Right hand", true));
misc.override_viewmodel_reset = misc.override_viewmodel:create():button("Reset", function(_)
    misc.override_viewmodel_fov:set(60);
    misc.override_viewmodel_offset_x:set(10);
    misc.override_viewmodel_offset_y:set(10);
    misc.override_viewmodel_offset_z:set(-10);
end);
misc.override_aspect_ratio = configs.item("misc.override_aspect_ratio", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Aspect ratio"));
misc.override_aspect_ratio_ratio = configs.item("misc.override_aspect_ratio_ratio", misc.override_aspect_ratio:create():slider("Ratio", 0, 200, 0, 0.01, function(v137)
    if v137 == 0 then
        return "off";
    elseif v137 == 125 then
        return "5:4";
    elseif v137 == 133 then
        return "4:3";
    elseif v137 == 150 then
        return "3:2";
    elseif v137 == 160 then
        return "16:10";
    elseif v137 == 177 then
        return "16:9";
    else
        return;
    end;
end));
misc.override_aspect_ratio_5on4 = misc.override_aspect_ratio:create():button(" 5:4 ", function(_)
    misc.override_aspect_ratio_ratio:set(125);
end, true);
misc.override_aspect_ratio_4on3 = misc.override_aspect_ratio:create():button(" 4:3 ", function(_)
    misc.override_aspect_ratio_ratio:set(133);
end, true);
misc.override_aspect_ratio_3on2 = misc.override_aspect_ratio:create():button(" 3:2 ", function(_)
    misc.override_aspect_ratio_ratio:set(150);
end, true);
misc.override_aspect_ratio_16on10 = misc.override_aspect_ratio:create():button(" 16:10 ", function(_)
    misc.override_aspect_ratio_ratio:set(160);
end, true);
misc.override_aspect_ratio_16on9 = misc.override_aspect_ratio:create():button(" 16:9 ", function(_)
    misc.override_aspect_ratio_ratio:set(177);
end, true);
misc.taskbar_notification = configs.item("misc.taskbar_notification", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Taskbar notification"));
misc.custom_sidebar = configs.item("misc.custom_sidebar", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Custom sidebar"));
misc.custom_sidebar_style = configs.item("misc.custom_sidebar_style", misc.custom_sidebar:create():list("", {
    [1] = "Static", 
    [2] = "Gradient"
}));
misc.custom_sidebar_color = configs.item("misc.custom_sidebar_color", misc.custom_sidebar:create():color_picker("Color 1", color("#00BFFFFF")));
misc.custom_sidebar_gradient = configs.item("misc.custom_sidebar_gradient", misc.custom_sidebar:create():color_picker("Color 2", color("#FFFFFFFF")));
misc.custom_sidebar_speed = configs.item("misc.custom_sidebar_speed", misc.custom_sidebar:create():slider("Speed", -3, 3, -3, 1, "%"));
misc.custom_sidebar_style:set_callback(function(v143)
    if v143:get() == 1 then
        misc.custom_sidebar_color:name("Color");
    else
        misc.custom_sidebar_color:name("Color 1");
    end;
end);
misc.shared_icon = configs.item("misc.shared_icon", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Shared icon"));
misc.custom_model_opacity = configs.item("misc.custom_model_opacity", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Custom model opacity"));
misc.custom_model_opacity_style = configs.item("misc.custom_model_opacity_style", misc.custom_model_opacity:create():selectable("", {
    [1] = "In scope", 
    [2] = "Grenades"
}));
misc.custom_model_opacity_opacity = configs.item("misc.custom_model_opacity_opacity", misc.custom_model_opacity:create():slider("Opacity", 0, 255, 150));
misc.dont_fire_while_menu_open = configs.item("misc.dont_fire_while_menu_open", ui.create("\226\154\153\239\184\143", "\n\n\n", 2):switch("Dot't fire while menu open"));
hitgroup_str = {
    [0] = "?", 
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
aimbot_log_f = function(v144)
    if not ragebot.aimbot_log:get() then
        return;
    else
        local v145 = ragebot.aimbot_log_hit_picker:get():to_hex();
        local v146 = ragebot.aimbot_log_miss_picker:get():to_hex();
        if not miss_id or miss_id > 999 then
            miss_id = 0;
        end;
        miss_id = miss_id + 1;
        if not v144.state then
            if ragebot.aimbot_log_type:get("Console") then
                print_raw(string.format("\a808080FF[\a%scitrine\a808080FF] \aDEFAULTHit \a%s" .. v144.target:get_name() .. "\aDEFAULT's \a%s" .. hitgroup_str[v144.hitgroup] .. "\aDEFAULT for \a%s" .. v144.damage .. "\aDEFAULT(\a%s" .. v144.wanted_damage .. "\aDEFAULT)(\a%s" .. v144.hitchance .. "%%\aDEFAULT)(\a%s" .. v144.backtrack .. "t\aDEFAULT)", v145, v145, v145, v145, v145, v145, v145));
            end;
            if ragebot.aimbot_log_type:get("Events") then
                common.add_event(string.format("Hit \a%s" .. v144.target:get_name() .. "\aDEFAULT's \a%s" .. hitgroup_str[v144.hitgroup] .. "\aDEFAULT(\a%s" .. hitgroup_str[v144.wanted_hitgroup] .. "\aDEFAULT) for \a%s" .. v144.damage .. "\aDEFAULT (\a%s" .. v144.wanted_damage .. "\aDEFAULT) bt:\a%s" .. v144.backtrack, v145, v145, v145, v145, v145, v145), "\a" .. ragebot.aimbot_log_hit_picker:get():to_hex() .. ui.get_icon("heart"));
            end;
        else
            if ragebot.aimbot_log_type:get("Console") then
                print_raw(string.format("\a808080FF[\a%scitrine\a808080FF] \aDEFAULTMissed shot (\a%s" .. miss_id .. "\aDEFAULT) in \a%s" .. v144.target:get_name() .. "\aDEFAULT's \a%s" .. hitgroup_str[v144.wanted_hitgroup] .. "\aDEFAULT(\a%s" .. v144.wanted_damage .. "\aDEFAULT)(\a%s" .. v144.hitchance .. "%%\aDEFAULT)(\a%s" .. v144.backtrack .. "t\aDEFAULT) due to \a%s" .. v144.state, v146, v146, v146, v146, v146, v146, v146, v146));
            end;
            if ragebot.aimbot_log_type:get("Events") then
                common.add_event(string.format("Miss \a%s" .. v144.target:get_name() .. "\aDEFAULT's \a%s" .. hitgroup_str[v144.wanted_hitgroup] .. "\aDEFAULT for \a%s" .. v144.wanted_damage .. "\aDEFAULT due to \a%s" .. v144.state .. "\aDEFAULT bt:\a%s" .. v144.backtrack, v146, v146, v146, v146, v146, v146), "\a" .. ragebot.aimbot_log_miss_picker:get():to_hex() .. ui.get_icon("heart-crack"));
            end;
        end;
        return;
    end;
end;
custom_hitchance_f = function(_)
    ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(nil);
    ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(nil);
    ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(nil);
    if not ragebot.custom_hitchance:get() then
        return;
    else
        local v148 = entity.get_local_player();
        if not v148 then
            return;
        else
            local v149 = v148:get_player_weapon();
            if not v149 then
                return;
            else
                local v150 = v149:get_weapon_index();
                local l_m_bIsScoped_0 = v148.m_bIsScoped;
                if ragebot.custom_hitchance_weapons:get("Scout") and v150 == 40 then
                    if ragebot.custom_hitchance_mode:get("Air") and bit.band(v148.m_fFlags, 1) == 0 and ragebot.custom_hitchance_hc_air:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(ragebot.custom_hitchance_hc_air:get());
                    elseif ragebot.custom_hitchance_mode:get("No Scope") and not l_m_bIsScoped_0 and ragebot.custom_hitchance_hc_ns:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(ragebot.custom_hitchance_hc_ns:get());
                    end;
                elseif ragebot.custom_hitchance_weapons:get("Auto") and v150 == 38 or v150 == 11 then
                    if ragebot.custom_hitchance_mode:get("Air") and bit.band(v148.m_fFlags, 1) == 0 and ragebot.custom_hitchance_hc_air:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(ragebot.custom_hitchance_hc_air:get());
                    elseif ragebot.custom_hitchance_mode:get("No Scope") and not l_m_bIsScoped_0 and ragebot.custom_hitchance_hc_ns:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(ragebot.custom_hitchance_hc_ns:get());
                    end;
                elseif ragebot.custom_hitchance_weapons:get("Auto") and v150 == 9 then
                    if ragebot.custom_hitchance_mode:get("Air") and bit.band(v148.m_fFlags, 1) == 0 and ragebot.custom_hitchance_hc_air:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(ragebot.custom_hitchance_hc_air:get());
                    elseif ragebot.custom_hitchance_mode:get("No Scope") and not l_m_bIsScoped_0 and ragebot.custom_hitchance_hc_ns:get() ~= 0 then
                        ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(ragebot.custom_hitchance_hc_ns:get());
                    end;
                end;
                return;
            end;
        end;
    end;
end;
knife_table = {
    [514] = 1, 
    [508] = 1, 
    [509] = 1, 
    [506] = 1, 
    [507] = 1, 
    [515] = 1, 
    [505] = 1, 
    [42] = 1, 
    [503] = 1, 
    [500] = 1, 
    [516] = 1, 
    [519] = 1, 
    [521] = 1, 
    [522] = 1, 
    [523] = 1, 
    [59] = 1, 
    [525] = 1, 
    [41] = 1, 
    [520] = 1, 
    [518] = 1, 
    [517] = 1, 
    [512] = 1
};
grenades_table = {
    [45] = 1, 
    [47] = 1, 
    [43] = 1, 
    [44] = 1, 
    [46] = 1
};
extrapolate_target = function(v152)
    local v153 = v152:get_origin();
    local l_m_vecVelocity_1 = v152.m_vecVelocity;
    local l_tickinterval_0 = globals.tickinterval;
    return v153 + l_m_vecVelocity_1 * 6 * l_tickinterval_0;
end;
auto_teleport_f = function(_)
    if not ragebot.auto_teleport:get() then
        return;
    else
        local v157 = entity.get_local_player();
        if not v157 then
            return;
        else
            local v158 = v157:get_player_weapon();
            if not v158 then
                return;
            else
                local v159 = v158:get_weapon_index();
                local v160 = extrapolate_target(v157);
                if not refs.helpers.rage.dt:get() then
                    return;
                elseif rage.exploit:get() ~= 1 then
                    return;
                else
                    threat = entity.get_threat();
                    if threat then
                        if ragebot.auto_teleport_weapons:get("Scout") and v159 == 40 or ragebot.auto_teleport_weapons:get("Awp") and v159 == 9 or ragebot.auto_teleport_weapons:get("Knife") and knife_table[v159] ~= nil or ragebot.auto_teleport_weapons:get("Taser") and v159 == 31 then
                            local v161, v162 = utils.trace_bullet(v157, v160, threat:get_hitbox_position(6));
                            local v163 = v157:get_origin();
                            if v160.z > v163.z then
                                return;
                            elseif (refs.player_state() == "Air+" or refs.player_state() == "Air") and v161 > 0 and v162.entity:is_enemy() and not v162.entity:is_dormant() then
                                rage.exploit:force_teleport();
                            end;
                        else
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
lag_exploit_f = function(_)
    if not ragebot.lag_exploit:get() then
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(nil);
        return;
    else
        local v165 = rage.exploit:get();
        if globals.tickcount % 2 == 1 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(v165 == 0);
        end;
        return;
    end;
end;
air_strafe_fix_f = function(v166)
    if not ragebot.air_strafe_fix:get() then
        return;
    else
        local v167 = entity.get_local_player();
        if not v167 then
            return;
        elseif v167.m_MoveType == 9 then
            return;
        else
            v166.in_speed = true;
            if math.sqrt(v167.m_vecVelocity.x ^ 2 + v167.m_vecVelocity.y ^ 2) > 2 then
                v166.in_speed = false;
            end;
            return;
        end;
    end;
end;
auto_body_aim_f = function(_)
    ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"):override(nil);
    if not ragebot.auto_body_aim:get() then
        return;
    else
        local v169 = entity.get_threat();
        if not v169 then
            return;
        elseif not v169:is_enemy() then
            return;
        else
            if ragebot.auto_body_aim_lethal:get() and v169.m_iHealth < 94 then
                ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"):override("Stomach");
            end;
            return;
        end;
    end;
end;
font = refs.helpers.font_pixel;
font_settings = "";
local v170 = refs.helpers.screen_size.x / 2;
y = refs.helpers.screen_size.y / 2;
x = v170;
bind_list = {
    ["Hide Shots"] = "HS", 
    ["Body Aim"] = "BAIM", 
    ["Safe Points"] = "SP", 
    ["Min. Damage"] = "MD", 
    ["Double Tap"] = "DT", 
    ["Hit Chance"] = "HC"
};
color_check = false;
crosshair_indicator_f = function()
    if not visuals.crosshair_indicator:get() then
        return;
    else
        local v171 = entity.get_local_player();
        if not v171 then
            return;
        elseif not refs.player_state("") then
            return;
        else
            local v172 = string.upper(refs.player_state(""));
            local v173 = render.measure_text(font, font_settings, "citrinestable");
            local v174 = render.measure_text(font, font_settings, v172);
            local v175 = anim.new("x_anim", x):update(anim.types.LERP, v171.m_bIsScoped and x + 35 or x);
            local v176 = anim.new("color_anim", 40):update(anim.types.LERP, color_check and 40 or 255, 0.03);
            local v177 = color(visuals.crosshair_indicator_primary_color:get().r, visuals.crosshair_indicator_primary_color:get().g, visuals.crosshair_indicator_primary_color:get().b, v176 / 255 * 255);
            if v176 == 40 then
                color_check = false;
            elseif v176 == 255 then
                color_check = true;
            end;
            render.text(font, vector(v175 - math.floor(v173.x / 2), y + 25), color(255), font_settings, "citrine\a" .. v177:to_hex() .. "stable");
            render.text(font, vector(v175 - math.floor(v174.x / 2), y + 35), visuals.crosshair_indicator_second_color:get(), font_settings, v172);
            render.shadow(vector(v175 - math.floor(v173.x / 2), y + 30), vector(v175 + math.floor(v173.x / 2), y + 31), v177, 25, 0, 3);
            local v178 = 0;
            for v179 = 1, #ui.get_binds() do
                local v180 = ui.get_binds()[v179];
                if bind_list[v180.name] ~= nil then
                    local v181 = color(255);
                    local v182 = render.measure_text(font, font_settings, bind_list[v180.name]);
                    if v180.name == "Double Tap" then
                        v181 = rage.exploit:get() == 1 and color("8FC82EFF") or color("FF7575FF");
                    end;
                    render.text(font, vector(v175 - math.floor(v182.x / 2), y + 45 + v178), v181, font_settings, bind_list[v180.name]);
                    v178 = v178 + 10;
                end;
            end;
            return;
        end;
    end;
end;
custom_scope_overlay_f = function()
    if not visuals.custom_scope_overlay:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override(nil);
        return;
    else
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove All");
        local v183 = entity.get_local_player();
        if not v183 then
            return;
        elseif not v183.m_bIsScoped then
            return;
        else
            local v184 = refs.helpers.screen_size.x / 2;
            local v185 = refs.helpers.screen_size.y / 2;
            local l_m_vecVelocity_2 = v183.m_vecVelocity;
            local v187 = math.floor(math.sqrt(l_m_vecVelocity_2.x ^ 2 + l_m_vecVelocity_2.y ^ 2)) / 15;
            if not visuals.custom_scope_overlay_spread_based:get() then
                v187 = 0;
            end;
            local v188 = visuals.custom_scope_overlay_style:get();
            local v189 = visuals.custom_scope_overlay_line:get() + v187;
            local v190 = visuals.custom_scope_overlay_gap:get() + v187;
            local v191 = visuals.custom_scope_overlay_inverted:get();
            local v192 = color(visuals.custom_scope_overlay_color:get().r, visuals.custom_scope_overlay_color:get().g, visuals.custom_scope_overlay_color:get().b, 0);
            local v193 = color(visuals.custom_scope_overlay_color:get().r, visuals.custom_scope_overlay_color:get().g, visuals.custom_scope_overlay_color:get().b, visuals.custom_scope_overlay_color:get().a);
            local function v194()
                -- upvalues: v191 (ref), v192 (ref), v193 (ref)
                if v191 then
                    return v192;
                else
                    return v193;
                end;
            end;
            local function v195()
                -- upvalues: v191 (ref), v193 (ref), v192 (ref)
                if v191 then
                    return v193;
                else
                    return v192;
                end;
            end;
            if v188 == "Default" then
                render.gradient(vector(v184, v185 - v190 - v189), vector(v184 + 1, v185 - v190), v194(), v194(), v195(), v195());
            end;
            render.gradient(vector(v184 - v189 - v190, v185), vector(v184 - v190, v185 + 1), v194(), v195(), v194(), v195());
            render.gradient(vector(v184 + v189 + v190, v185), vector(v184 + v190, v185 + 1), v194(), v195(), v194(), v195());
            render.gradient(vector(v184, v185 + v190 + v189), vector(v184 + 1, v185 + v190), v194(), v194(), v195(), v195());
            return;
        end;
    end;
end;
damage_indicator_f = function()
    if not visuals.damage_indicator:get() then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        local v196 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
        if v196 < 1 then
            v196 = "AUTO";
        end;
        local v197 = refs.helpers.screen_size.x / 2;
        local v198 = refs.helpers.screen_size.y / 2;
        render.text(2, vector(v197 + 4, v198 - 14), visuals.damage_indicator_color:get(), nil, v196);
        return;
    end;
end;
manual_arrows_f = function()
    if not visuals.manual_arrows:get() then
        return;
    else
        local v199 = refs.helpers.screen_size.x / 2;
        local v200 = refs.helpers.screen_size.y / 2;
        local v201 = visuals.manual_arrows_color:get();
        if sideways.side:get() == "Left" then
            render.poly(v201, vector(v199, v200) - vector(45, 0) - vector(0, 5), vector(v199, v200) - vector(45, 0) - vector(9, 0), vector(v199, v200) - vector(45, 0) + vector(0, 5));
        elseif sideways.side:get() == "Right" then
            render.poly(v201, vector(v199, v200) + vector(45, 0) - vector(0, 5), vector(v199, v200) + vector(45, 0) + vector(9, 0), vector(v199, v200) + vector(45, 0) + vector(0, 5));
        end;
        return;
    end;
end;
custom_background_f = function()
    if not visuals.custom_background:get() then
        return;
    else
        render.blur(vector(0, 0), vector(refs.helpers.screen_size.x, refs.helpers.screen_size.y), visuals.custom_background_strength:get() / 10, visuals.custom_background_alpha:get() / 10);
        return;
    end;
end;
revolver_helper_f = function()
    if not visuals.revolver_helper:get() then
        return;
    elseif not visuals.revolver_helper:get() then
        return;
    else
        local v202 = entity.get_local_player();
        if not v202 then
            return;
        else
            local v203 = v202:get_player_weapon();
            if not v203 then
                return;
            elseif v203:get_weapon_index() ~= 64 then
                return;
            else
                for _, v205 in pairs(entity.get_players(true, false)) do
                    if v205 and v205:is_alive() then
                        local v206 = v205:get_origin();
                        local v207 = v202:get_origin();
                        local v208 = render.world_to_screen(v205:get_hitbox_position(5));
                        if v208 and v206:dist(v207) < 586 then
                            local v209 = refs.helpers.screen_size.x / 2;
                            local v210 = refs.helpers.screen_size.y / 2;
                            render.line(vector(v209, v210), vector(v208.x, v208.y), visuals.revolver_helper_color:get());
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
kill_phase = {
    [1] = {
        [1] = "\208\188\208\181\208\189\209\143 citrine \208\177\209\131\209\129\209\130\208\184\209\130", 
        [2] = "\208\176 \209\130\209\139 \209\133\209\131\208\181\208\178\209\139\208\185 \208\177\208\181\208\183 citrine beta"
    }, 
    [2] = {
        [1] = "\209\129\208\190\209\129\208\184 \209\135\208\187\208\181\208\189 \208\177\208\190\208\188\208\182 \208\181\208\177\208\176\208\189\209\139\208\185", 
        [2] = "\209\143 \209\130\208\178\208\190\209\142 \208\188\208\176\209\130\209\140 \208\181\208\177\208\176\208\187"
    }, 
    [3] = {
        [1] = "\209\132\208\176\208\189\208\176\209\130 \208\188\208\190\208\181\208\179\208\190 \209\133\209\131\209\143", 
        [2] = "\208\189\208\176 \208\186\208\176\208\187\208\181\208\189\208\184"
    }, 
    [4] = {
        [1] = "\208\191\208\184\208\180\208\190\209\128 \208\181\208\177\208\176\208\189\209\139\208\185", 
        [2] = "c\209\138\208\181\208\177\208\176\208\187\209\129\209\143 \208\176\209\130\209\129\209\142\208\180\208\176"
    }, 
    [5] = {
        [1] = "1", 
        [2] = "\208\189\208\176 \209\135\209\130\208\190 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\189\208\176\208\180\208\181\209\143\208\187\209\129\209\143?"
    }, 
    [6] = {
        [1] = "\208\178 \209\129\209\130\209\128\208\176\209\133\208\181 \209\129\209\138\208\181\208\177\208\176\208\187\209\129\209\143", 
        [2] = "\209\131\208\181\208\177\208\190\208\186"
    }, 
    [7] = {
        [1] = "\209\143 \208\178\208\184\208\182\209\131 \209\130\209\139 \208\177\208\181\208\183 citrine beta", 
        [2] = "\208\191\208\190\209\141\209\130\208\190\208\188\209\131 \209\143 \208\178 \209\130\208\181\208\177\209\143 \208\184 \208\191\208\190\208\191\208\176\208\187)"
    }, 
    [8] = {
        [1] = "citrine \208\186\208\176\208\186 \208\178\209\129\208\181\208\179\208\180\208\176 \208\191\208\190\208\180\208\177\209\131\209\129\209\130\208\184\208\187", 
        [2] = "\208\178\208\190\209\130 \208\191\208\190\209\141\209\130\208\190\208\188\209\131 \209\143 \209\130\208\181\208\177\209\143 \208\184 \209\131\208\177\208\184\208\187)"
    }, 
    [9] = {
        [1] = "\208\190\208\191\209\143\209\130\209\140 \209\132\208\176\208\189\208\176\209\130 \208\188\208\190\208\185 \209\131\208\191\208\176\208\187)", 
        [2] = "\208\190\209\130\209\129\208\190\209\129\208\184\208\186\208\176 \209\130\209\139 \208\186\208\190\208\189\208\181\209\136\208\189\208\190 \208\189\208\190\209\128\208\188 \208\180\208\176\208\187"
    }, 
    [10] = {
        [1] = "\208\178\209\139\208\181\208\177\208\176\208\189\208\176 \208\186\208\176\208\186 \209\136\208\187\209\142\209\133\208\176", 
        [2] = "\209\133\208\176\209\135 \208\181\208\177\208\176\208\189\209\139\208\185"
    }, 
    [11] = {
        [1] = "1.", 
        [2] = "\209\136\208\187\209\142\209\133\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
        [3] = "\208\186\208\176\208\186 \209\130\209\139 \208\178\208\176\209\137\208\181 \208\184\208\179\209\128\208\176\208\184\209\136 \208\178 \209\141\209\130\209\131 \208\184\208\179\209\128\209\131?"
    }
};
death_phase = {
    [1] = {
        [1] = "\209\137\208\176\208\187\208\176\208\178\208\176 \208\188\208\181\208\189\209\143 \208\180\208\176\208\182\208\181 \208\189\208\181 \209\131\208\178\208\184\208\180\208\181\208\187\208\176", 
        [2] = "\208\178\209\129\208\181 \209\128\208\176\208\178\208\189\208\190 \208\186\208\176\208\186 \209\130\208\190 \209\131\208\177\208\184\208\187\208\176"
    }, 
    [2] = {
        [1] = "\209\130\209\139 \208\178\208\176\208\177\209\137\208\181 \208\191\208\190\208\189\209\143\208\187 \208\186\208\176\208\186 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\208\187?", 
        [2] = "\208\179\208\189\208\184\208\180\208\176 \208\181\208\177\208\176\208\189\208\189\208\176\209\143"
    }, 
    [3] = {
        [1] = "\208\190\208\191\209\143\209\130\209\140 \209\133\209\131\208\181\209\129\208\190\209\129 \208\189\208\176 \208\187\208\176\208\186\208\184 \209\131\208\177\208\184\208\187", 
        [2] = "\209\132\209\131 \208\177\208\187\209\143\209\130\209\140"
    }, 
    [4] = {
        [1] = "\208\189\209\131 \208\188\209\128\208\176\208\183\208\190\209\130\208\176", 
        [2] = "\208\186\208\176\208\186 \208\178\209\129\208\181\208\179\208\180\208\176 \209\143 \208\191\208\190 \209\130\208\181\208\177\208\181 5 \208\191\209\131\208\187\209\140 \208\188\208\184\209\129\209\129\208\189\209\131\208\187"
    }, 
    [5] = {
        [1] = "\209\136\208\176\208\187\208\176\208\178\208\176", 
        [2] = "\208\186\208\176\208\186 \209\130\209\139 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\208\187\208\176?"
    }, 
    [6] = {
        [1] = "\208\171\208\146\208\144\208\159\208\169\208\155\208\148\208\171\208\146\208\155\208\148\208\159\208\171\208\146\208\150\208\148\208\151\208\159\208\151\208\171\208\148\208\146\208\144\208\155\208\159\208\150\208\148", 
        [2] = "\208\158\208\159\208\175\208\162\208\172 \208\156\208\160\208\144\208\151\208\172 \208\163\208\145\208\152\208\155\208\144 \208\161\208\155\208\163\208\167\208\144\208\153\208\157\208\158"
    }, 
    [7] = {
        [1] = "\208\145\208\155\208\175\208\175\208\175", 
        [2] = "\208\189\208\176\208\180\208\190 \208\177\209\139\208\187\208\190 citrine \208\191\208\190\208\186\209\131\208\191\208\176\209\130\209\140"
    }, 
    [8] = {
        [1] = "\208\157\208\163 \208\147\208\157\208\152\208\148\208\144 \208\145\208\149\208\151 CITRINE", 
        [2] = "\208\151\208\144\208\149\208\145\208\144\208\155\208\144 \208\157\208\144 \208\155\208\144\208\154\208\152 \208\163\208\145\208\149\208\146\208\144\208\162\208\172"
    }, 
    [9] = {
        [1] = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129\208\184\208\189\208\176, \208\190\208\191\209\143\209\130\209\140 \208\189\208\176 \208\187\208\176\208\186\208\184 \209\131\208\177\208\184\208\187\208\176", 
        [2] = "\208\183\208\176\208\181\208\177\208\176\208\187\208\176 \209\131\208\182\208\181 \209\133\209\131\208\181\208\178\208\176\209\143"
    }, 
    [10] = {
        [1] = "\208\165\208\163\208\149\208\146\208\171\208\153 \208\145\208\158\208\156\208\150", 
        [2] = "\208\175 \208\162\208\146\208\158\208\174 \208\156\208\144\208\162\208\172 \208\149\208\145\208\144\208\155"
    }
};
current_state = function(v211)
    if not current_text then
        current_text = 0;
    end;
    current_text = current_text + 1;
    if current_text > #v211 then
        current_text = 1;
    end;
    return current_text;
end;
trash_talking_f = function(v212)
    if not misc.trash_talking:get() then
        return;
    elseif misc.trash_talking_warmup:get() and entity.get_game_rules().m_bWarmupPeriod then
        return;
    else
        local v213 = entity.get_local_player();
        if not v213 then
            return;
        elseif not entity.get(v212.userid, true) or not entity.get(v212.attacker, true) then
            return;
        else
            local v214 = entity.get(v212.userid, true):get_index();
            local v215 = entity.get(v212.attacker, true):get_index();
            if not v214 or not v215 then
                return;
            else
                if v215 == v213:get_index() and v214 ~= v213:get_index() then
                    utils.execute_after(misc.trash_talking_delay:get(), function()
                        for v216, v217 in ipairs(kill_phase[current_state(kill_phase)]) do
                            do
                                local l_v217_0 = v217;
                                utils.execute_after(v216, function()
                                    -- upvalues: l_v217_0 (ref)
                                    utils.console_exec("say " .. l_v217_0);
                                end);
                            end;
                        end;
                    end);
                end;
                if v213:get_index() ~= v215 and v214 == v213:get_index() then
                    utils.execute_after(misc.trash_talking_delay:get(), function()
                        for v219, v220 in ipairs(death_phase[current_state(death_phase)]) do
                            do
                                local l_v220_0 = v220;
                                utils.execute_after(v219, function()
                                    -- upvalues: l_v220_0 (ref)
                                    utils.console_exec("say " .. l_v220_0);
                                end);
                            end;
                        end;
                    end);
                end;
                return;
            end;
        end;
    end;
end;
clantag_cache = "";
set_clantag = function(v222)
    if v222 == nil then
        return;
    else
        if v222 ~= clantag_cache then
            common.set_clan_tag(v222);
            clantag_cache = v222;
        end;
        return;
    end;
end;
animation_clantag = {
    [1] = "c", 
    [2] = "ci", 
    [3] = "cit", 
    [4] = "citr", 
    [5] = "citri", 
    [6] = "citrin", 
    [7] = "citrine", 
    [8] = "citrine", 
    [9] = "citrin", 
    [10] = "citri", 
    [11] = "citr", 
    [12] = "cit", 
    [13] = "ci", 
    [14] = "c", 
    [15] = ""
};
clantag_spammer_f = function()
    if not misc.clantag_spammer:get() then
        ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(nil);
        set_clantag("");
        return;
    else
        local v223 = entity.get_local_player();
        if not v223 or not globals.is_in_game then
            return;
        elseif v223.m_iTeamNum == 0 then
            return;
        else
            ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(false);
            local v224 = math.floor(globals.curtime * 3);
            local v225 = #animation_clantag + 1;
            set_clantag(animation_clantag[v224 % v225]);
            return;
        end;
    end;
end;
auto_mute_f = function()
    if not misc.auto_mute:get() then
        return;
    else
        entity.get_players(misc.auto_mute_mute_enemy:get(), true, function(v226)
            if misc.auto_mute_mode:get() == "Mute" and not panorama.FriendsListAPI.IsSelectedPlayerMuted(v226:get_player_info().steamid64) then
                panorama.FriendsListAPI.ToggleMute(v226:get_player_info().steamid64);
            elseif misc.auto_mute_mode:get() == "Unmute" and panorama.FriendsListAPI.IsSelectedPlayerMuted(v226:get_player_info().steamid64) then
                panorama.FriendsListAPI.ToggleMute(v226:get_player_info().steamid64);
            end;
        end);
        return;
    end;
end;
override_viewmodel_f = function()
    if not misc.override_viewmodel:get() then
        return;
    else
        cvar.viewmodel_fov:int(misc.override_viewmodel_fov:get());
        cvar.viewmodel_offset_x:float(misc.override_viewmodel_offset_x:get() / 10);
        cvar.viewmodel_offset_y:float(misc.override_viewmodel_offset_y:get() / 10);
        cvar.viewmodel_offset_z:float(misc.override_viewmodel_offset_z:get() / 10);
        if misc.override_viewmodel_right_hand:get() then
            cvar.cl_righthand:int(1);
        else
            cvar.cl_righthand:int(0);
        end;
        return;
    end;
end;
override_aspect_ratio_f = function()
    if not misc.override_aspect_ratio:get() then
        cvar.r_aspectratio:float(0);
        return;
    else
        cvar.r_aspectratio:float(misc.override_aspect_ratio_ratio:get() / 100);
        return;
    end;
end;
hwnd_ptr = ffi.cast("uintptr_t***", ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2;
flash_window = ffi.cast("int(__stdcall*)(uintptr_t, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 83 EC 14 8B 45 0C F7"));
insn_jmp_ecx = ffi.cast("int(__thiscall*)(uintptr_t)", utils.opcode_scan("gameoverlayrenderer.dll", "FF E1"));
taskbar_notification_f = function()
    if not misc.taskbar_notification:get() then
        return;
    else
        if insn_jmp_ecx(ffi.cast("uintptr_t**", ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "FF 15 ?? ?? ?? ?? 3B C6 74")) + 2)[0][0]) ~= hwnd_ptr[0] then
            flash_window(hwnd_ptr[0], 1);
        end;
        return;
    end;
end;
custom_sidebar_f = function()
    if not misc.custom_sidebar:get() then
        ui.sidebar("\a{Link Active}citrine stable", "\a{Link Active}" .. ui.get_icon("crown"));
        return;
    else
        if misc.custom_sidebar_style:get() == 1 then
            color1 = misc.custom_sidebar_color:get();
            color2 = misc.custom_sidebar_color:get();
        else
            color1 = misc.custom_sidebar_color:get();
            color2 = misc.custom_sidebar_gradient:get();
        end;
        local v227 = misc.custom_sidebar_speed:get();
        local v228 = gradient.text_animate("citrine stable", v227, {
            [1] = color1, 
            [2] = color2
        });
        ui.sidebar(v228:get_animated_text(), "\a" .. color1:to_hex() .. ui.get_icon("crown"));
        if v227 ~= 0 then
            v228:animate();
        end;
        return;
    end;
end;
misc.shared_icon:set_callback(function(v229)
    local v230 = entity.get_local_player();
    if not v230 then
        return;
    else
        if v229:get() then
            v230:set_icon("https://cdn.discordapp.com/attachments/1101099013396250624/1142605843288834219/Group_1_5.png");
        else
            v230:set_icon();
        end;
        return;
    end;
end);
custom_model_opacity_f = function()
    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Transparency"):override(nil);
    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Style"):override(nil);
    ui.find("Visuals", "Players", "Self", "Chams", "Model"):override(nil);
    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(nil);
    if not misc.custom_model_opacity:get() then
        return;
    else
        local v231 = entity.get_local_player();
        if not v231 then
            return;
        else
            local v232 = v231:get_player_weapon();
            if not v232 then
                return;
            else
                local v233 = v232:get_weapon_index();
                ui.find("Visuals", "Players", "Self", "Chams", "Model", "Transparency"):override("");
                if not ui.find("Visuals", "Players", "Self", "Chams", "Model"):get() then
                    ui.find("Visuals", "Players", "Self", "Chams", "Model"):override(true);
                    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Style"):override("Material");
                    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(color(255, 255, 255, 255));
                    if misc.custom_model_opacity_style:get("In Scope") and v231.m_bIsScoped then
                        ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(color(255, 255, 255, misc.custom_model_opacity_opacity:get()));
                    elseif misc.custom_model_opacity_style:get("Grenades") and grenades_table[v233] then
                        ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(color(255, 255, 255, misc.custom_model_opacity_opacity:get()));
                    end;
                elseif misc.custom_model_opacity_style:get("In Scope") and v231.m_bIsScoped then
                    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(color(255, 255, 255, misc.custom_model_opacity_opacity:get()));
                elseif misc.custom_model_opacity_style:get("Grenades") and grenades_table[v233] then
                    ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"):override(color(255, 255, 255, misc.custom_model_opacity_opacity:get()));
                end;
                return;
            end;
        end;
    end;
end;
visibility_for_tabs = function()
    ragebot.aimbot_log:visibility(tabs_settings:get() == 1);
    ragebot.custom_hitchance:visibility(tabs_settings:get() == 1);
    ragebot.auto_teleport:visibility(tabs_settings:get() == 1);
    ragebot.lag_exploit:visibility(tabs_settings:get() == 1);
    ragebot.air_strafe_fix:visibility(tabs_settings:get() == 1);
    ragebot.auto_body_aim:visibility(tabs_settings:get() == 1);
    visuals.crosshair_indicator:visibility(tabs_settings:get() == 2);
    visuals.custom_scope_overlay:visibility(tabs_settings:get() == 2);
    visuals.damage_indicator:visibility(tabs_settings:get() == 2);
    visuals.manual_arrows:visibility(tabs_settings:get() == 2);
    visuals.custom_background:visibility(tabs_settings:get() == 2);
    visuals.revolver_helper:visibility(tabs_settings:get() == 2);
    misc.trash_talking:visibility(tabs_settings:get() == 3);
    misc.clantag_spammer:visibility(tabs_settings:get() == 3);
    misc.auto_mute:visibility(tabs_settings:get() == 3);
    misc.override_viewmodel:visibility(tabs_settings:get() == 3);
    misc.override_aspect_ratio:visibility(tabs_settings:get() == 3);
    misc.taskbar_notification:visibility(tabs_settings:get() == 3);
    misc.custom_sidebar:visibility(tabs_settings:get() == 3);
    misc.shared_icon:visibility(tabs_settings:get() == 3);
    misc.custom_model_opacity:visibility(tabs_settings:get() == 3);
    misc.dont_fire_while_menu_open:visibility(tabs_settings:get() == 3);
end;
elements_visibility = function()
    ragebot.aimbot_log_hit_picker:visibility(ragebot.aimbot_log:get());
    ragebot.aimbot_log_miss_picker:visibility(ragebot.aimbot_log:get());
    ragebot.aimbot_log_type:visibility(ragebot.aimbot_log:get());
    ragebot.custom_hitchance_weapons:visibility(ragebot.custom_hitchance:get());
    ragebot.custom_hitchance_mode:visibility(ragebot.custom_hitchance:get() and #ragebot.custom_hitchance_weapons:get() > 0);
    ragebot.custom_hitchance_hc_air:visibility(ragebot.custom_hitchance:get() and #ragebot.custom_hitchance_weapons:get() > 0 and ragebot.custom_hitchance_mode:get("Air"));
    ragebot.custom_hitchance_hc_ns:visibility(ragebot.custom_hitchance:get() and #ragebot.custom_hitchance_weapons:get() > 0 and ragebot.custom_hitchance_mode:get("No Scope"));
    ragebot.auto_teleport_weapons:visibility(ragebot.auto_teleport:get());
    ragebot.auto_body_aim_lethal:visibility(ragebot.auto_body_aim:get());
    visuals.crosshair_indicator_primary_color:visibility(visuals.crosshair_indicator:get());
    visuals.crosshair_indicator_second_color:visibility(visuals.crosshair_indicator:get());
    visuals.custom_scope_overlay_color:visibility(visuals.custom_scope_overlay:get());
    visuals.custom_scope_overlay_style:visibility(visuals.custom_scope_overlay:get());
    visuals.custom_scope_overlay_line:visibility(visuals.custom_scope_overlay:get());
    visuals.custom_scope_overlay_gap:visibility(visuals.custom_scope_overlay:get());
    visuals.custom_scope_overlay_inverted:visibility(visuals.custom_scope_overlay:get());
    visuals.custom_scope_overlay_spread_based:visibility(visuals.custom_scope_overlay:get());
    visuals.damage_indicator_color:visibility(visuals.damage_indicator:get());
    visuals.manual_arrows_color:visibility(visuals.manual_arrows:get());
    visuals.custom_background_style:visibility(visuals.custom_background:get());
    visuals.custom_background_strength:visibility(visuals.custom_background:get());
    visuals.custom_background_alpha:visibility(visuals.custom_background:get());
    visuals.revolver_helper_color:visibility(visuals.revolver_helper:get());
    misc.trash_talking_warmup:visibility(misc.trash_talking:get());
    misc.auto_mute_mute_enemy:visibility(misc.auto_mute:get());
    misc.auto_mute_mode:visibility(misc.auto_mute:get());
    misc.override_viewmodel_fov:visibility(misc.override_viewmodel:get());
    misc.override_viewmodel_offset_x:visibility(misc.override_viewmodel:get());
    misc.override_viewmodel_offset_y:visibility(misc.override_viewmodel:get());
    misc.override_viewmodel_offset_z:visibility(misc.override_viewmodel:get());
    misc.override_viewmodel_right_hand:visibility(misc.override_viewmodel:get());
    misc.override_viewmodel_reset:visibility(misc.override_viewmodel:get());
    misc.override_aspect_ratio_ratio:visibility(misc.override_aspect_ratio:get());
    misc.override_aspect_ratio_5on4:visibility(misc.override_aspect_ratio:get());
    misc.override_aspect_ratio_4on3:visibility(misc.override_aspect_ratio:get());
    misc.override_aspect_ratio_3on2:visibility(misc.override_aspect_ratio:get());
    misc.override_aspect_ratio_16on10:visibility(misc.override_aspect_ratio:get());
    misc.override_aspect_ratio_16on9:visibility(misc.override_aspect_ratio:get());
    misc.custom_sidebar_style:visibility(misc.custom_sidebar:get());
    misc.custom_sidebar_color:visibility(misc.custom_sidebar:get());
    misc.custom_sidebar_gradient:visibility(misc.custom_sidebar:get() and misc.custom_sidebar_style:get() == 2);
    misc.custom_sidebar_speed:visibility(misc.custom_sidebar:get() and misc.custom_sidebar_style:get() == 2);
    misc.custom_model_opacity_style:visibility(misc.custom_model_opacity:get());
    misc.custom_model_opacity_opacity:visibility(misc.custom_model_opacity:get());
end;
colored_elements = function()
    local v234 = "\a{Link Active}";
    welcome_back:name(v234 .. ui.get_icon("user") .. "\aDEFAULT  Welcome back, \a" .. v234 .. refs.helpers.username .. "\aDEFAULT!");
    current_build:name(v234 .. ui.get_icon("code-compare") .. "\aDEFAULT  Build: \a" .. v234 .. "stable");
    last_update:name(v234 .. ui.get_icon("pencil") .. "\aDEFAULT  Updated: \a" .. v234 .. "23.08.2023");
    script_online:name(v234 .. ui.get_icon("users") .. "\aDEFAULT  Current users: \a" .. v234 .. refs.helpers.script_online);
    youtube_channel:name(v234 .. ui.get_icon("youtube") .. "  \aDEFAULTyoutube");
    discord_server:name(v234 .. ui.get_icon("discord") .. "  \aDEFAULTdiscord");
    nl_config:name(v234 .. ui.get_icon("octagon-check") .. "  \aDEFAULTbest config");
    load:name(v234 .. ui.get_icon("loader") .. " \aDEFAULTLoad");
    save:name(v234 .. ui.get_icon("floppy-disk") .. " \aDEFAULTSave");
    remove:name(v234 .. ui.get_icon("trash") .. " \aDEFAULTRemove");
    create_input:name(" " .. v234 .. ui.get_icon("file-signature") .. " \aDEFAULTConfiguration");
    export:name("  " .. v234 .. ui.get_icon("file-export") .. " \aDEFAULTExport   ");
    import:name("  " .. v234 .. ui.get_icon("file-import") .. " \aDEFAULTImport   ");
    default:name("   " .. v234 .. ui.get_icon("file-check") .. " \aDEFAULTDefault  ");
    export_antiaim:name("\t\t   " .. v234 .. ui.get_icon("file-export") .. " \aDEFAULTExport\t\t  ");
    import_antiaim:name("\t\t   " .. v234 .. ui.get_icon("file-import") .. " \aDEFAULTImport\t\t  ");
    default1_antiaim:name("    " .. v234 .. ui.get_icon("user-ninja") .. "    ");
    default2_antiaim:name("    " .. v234 .. ui.get_icon("user-astronaut") .. "    ");
    default3_antiaim:name("    " .. v234 .. ui.get_icon("wheelchair-move") .. "    ");
    default4_antiaim:name("    " .. v234 .. ui.get_icon("user-bounty-hunter") .. "    ");
    default1NEW_antiaim:name("    " .. v234 .. ui.get_icon("user-shield") .. "    ");
    default2NEW_antiaim:name("    " .. v234 .. ui.get_icon("rabbit-running") .. "    ");
    default3NEW_antiaim:name("    " .. v234 .. ui.get_icon("user-tie") .. "    ");
    default4NEW_antiaim:name("    " .. v234 .. ui.get_icon("user-crown") .. "    ");
    main_switch:name("\a" .. v234 .. ui.get_icon("repeat") .. " \aDEFAULTMain switch");
    settings.customizations:name(v234 .. ui.get_icon("sliders") .. " \aDEFAULTCustomizations");
    settings.hide_head:name(v234 .. ui.get_icon("shield") .. " \aDEFAULTHide head");
    settings.lag_correction:name(v234 .. ui.get_icon("bolt-lightning") .. " \aDEFAULTLag correction");
    sideways.side:name(v234 .. ui.get_icon("arrows-left-right") .. " \aDEFAULTSide");
    sideways.offset:name(v234 .. ui.get_icon("arrows-to-dot") .. " \aDEFAULTOffset");
    sideways.disable_yaw_modif:name(v234 .. ui.get_icon("toggle-off") .. " \aDEFAULTDisable yaw modif.");
    sideways.disable_body:name(v234 .. ui.get_icon("toggle-off") .. " \aDEFAULTDisable body");
    anim_changer.list:name(v234 .. ui.get_icon("list") .. " \aDEFAULTList");
    anim_changer.on_land:name(v234 .. ui.get_icon("socks") .. " \aDEFAULTOn land");
    anim_changer.in_air:name(v234 .. ui.get_icon("person-falling") .. " \aDEFAULTIn air");
    anim_changer.lean_walking:name(v234 .. ui.get_icon("person-praying") .. " \aDEFAULTLean walking");
    list_settings:update({
        [1] = "\a" .. v234 .. ui.get_icon("gear") .. " \aDEFAULTSettings", 
        [2] = "\a" .. v234 .. ui.get_icon("location-arrow") .. " \aDEFAULTSideways anti-aim", 
        [3] = "\a" .. v234 .. ui.get_icon("circle-radiation") .. " \aDEFAULTChanging animations"
    });
    player_side:name(v234 .. ui.get_icon("person-rifle") .. " \aDEFAULTPlayer side");
    for v235 = 1, #side_list do
        main_f[v235].player_state:name(v234 .. ui.get_icon("person-walking-arrow-loop-left") .. " \aDEFAULTPlayer state\t");
    end;
    tabs_settings:update({
        [1] = "\a" .. v234 .. ui.get_icon("crosshairs") .. " \aDEFAULTRagebot", 
        [2] = "\a" .. v234 .. ui.get_icon("palette") .. " \aDEFAULTVisuals", 
        [3] = "\a" .. v234 .. ui.get_icon("icons") .. " \aDEFAULTMisc"
    });
    ragebot.aimbot_log:name(v234 .. ui.get_icon("list") .. " \aDEFAULTAimbot logs");
    ragebot.custom_hitchance:name(v234 .. ui.get_icon("percent") .. " \aDEFAULTCustom hitchance");
    ragebot.auto_teleport:name(v234 .. ui.get_icon("gun") .. " \aDEFAULTAuto teleport");
    ragebot.lag_exploit:name(v234 .. ui.get_icon("person-rifle") .. " \aDEFAULTLag Exploit");
    ragebot.air_strafe_fix:name(v234 .. ui.get_icon("toolbox") .. " \aDEFAULTAir strafe fix");
    ragebot.auto_body_aim:name(v234 .. ui.get_icon("child-reaching") .. " \aDEFAULTAuto body aim");
    visuals.crosshair_indicator:name(v234 .. ui.get_icon("paintbrush") .. " \aDEFAULTCrosshair indicator");
    visuals.custom_scope_overlay:name(v234 .. ui.get_icon("telescope") .. " \aDEFAULTCustom scope overlay");
    visuals.damage_indicator:name(v234 .. ui.get_icon("hundred-points") .. " \aDEFAULTDamage indicator");
    visuals.manual_arrows:name(v234 .. ui.get_icon("arrows-rotate") .. " \aDEFAULTManaul arrows");
    visuals.custom_background:name(v234 .. ui.get_icon("film") .. " \aDEFAULTCustom background");
    visuals.revolver_helper:name(v234 .. ui.get_icon("gun-squirt") .. " \aDEFAULTRevolver helper");
    misc.trash_talking:name(v234 .. ui.get_icon("eye-evil") .. " \aDEFAULTTrash talking");
    misc.clantag_spammer:name(v234 .. ui.get_icon("user-tag") .. " \aDEFAULTClantag spammer");
    misc.auto_mute:name(v234 .. ui.get_icon("volume-xmark") .. " \aDEFAULTAuto mute");
    misc.override_viewmodel:name(v234 .. ui.get_icon("hand") .. " \aDEFAULTViewmodel");
    misc.override_aspect_ratio:name(v234 .. ui.get_icon("tv") .. " \aDEFAULTAspect ratio");
    misc.taskbar_notification:name(v234 .. ui.get_icon("triangle-exclamation") .. " \aDEFAULTTaskbar notification");
    misc.custom_sidebar:name(v234 .. ui.get_icon("sidebar") .. " \aDEFAULTCustom sidebar");
    misc.shared_icon:name(v234 .. ui.get_icon("users") .. " \aDEFAULTShared icon");
    misc.custom_model_opacity:name(v234 .. ui.get_icon("m") .. " \aDEFAULTCustom model opacity");
    misc.dont_fire_while_menu_open:name(v234 .. ui.get_icon("fire") .. " \aDEFAULTDon't fire while menu open");
end;
antiaim_visibility = function()
    player_side:visibility(main_switch:get());
    settings.customizations:visibility(main_switch:get() and list_settings:get() == 1);
    settings.hide_head:visibility(main_switch:get() and list_settings:get() == 1 and settings.customizations:get("Hide head"));
    settings.lag_correction:visibility(main_switch:get() and list_settings:get() == 1 and settings.customizations:get("Lag correction"));
    sideways.side:visibility(main_switch:get() and list_settings:get() == 2);
    anim_changer.list:visibility(main_switch:get() and list_settings:get() == 3);
    anim_changer.on_land:visibility(main_switch:get() and list_settings:get() == 3 and #anim_changer.list:get() > 0 and anim_changer.list:get("On land"));
    anim_changer.in_air:visibility(main_switch:get() and list_settings:get() == 3 and #anim_changer.list:get() > 0 and anim_changer.list:get("In air"));
    anim_changer.lean_walking:visibility(main_switch:get() and list_settings:get() == 3 and #anim_changer.list:get() > 0 and anim_changer.list:get("Lean walking"));
    list_settings:visibility(main_switch:get());
    export_antiaim:visibility(main_switch:get());
    import_antiaim:visibility(main_switch:get());
    configs_label:visibility(main_switch:get());
    default1_antiaim:visibility(main_switch:get());
    default2_antiaim:visibility(main_switch:get());
    default3_antiaim:visibility(main_switch:get());
    default4_antiaim:visibility(main_switch:get());
    default1NEW_antiaim:visibility(main_switch:get());
    default2NEW_antiaim:visibility(main_switch:get());
    default3NEW_antiaim:visibility(main_switch:get());
    default4NEW_antiaim:visibility(main_switch:get());
    for v236 = 1, #side_list do
        for v237 = 1, #conditional_list do
            local v238 = main_switch:get() and player_side:get() == side_list[v236] and main_f[v236].player_state:get() == conditional_list[v237] and main_f[v236].side_switch:get();
            local v239 = main_switch:get() and player_side:get() == side_list[v236] and main_f[v236].player_state:get() == conditional_list[v237] and main_f[v236].side_switch:get() and main_f[v236][v237].condition_switch:get();
            main_f[v236].player_state:visibility(main_switch:get() and player_side:get() == side_list[v236] and main_f[v236].side_switch:get());
            main_f[v236].side_switch:visibility(main_switch:get() and player_side:get() == side_list[v236]);
            main_f[1].side_switch:visibility(false);
            main_f[1].side_switch:set(true);
            main_f[v236][v237].condition_switch:visibility(v238);
            main_f[1][1].condition_switch:visibility(false);
            main_f[1][1].condition_switch:set(true);
            main_f[v236][v237].pitch:visibility(v239);
            main_f[v236][v237].base:visibility(v239);
            main_f[v236][v237].yaw_modifier:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled");
            main_f[v236][v237].body_yaw:visibility(v239);
            main_f[v236][v237].defensive:visibility(v239);
            if base_f[v236][v237].mode:get() ~= "180 Degrees" then
                base_f[v236][v237].offset:name(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset #1");
            else
                base_f[v236][v237].offset:name(" \a00BFFFE6 \226\158\155 \aDEFAULT Offset");
            end;
            base_f[v236][v237].mode:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled");
            base_f[v236][v237].offset:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled");
            base_f[v236][v237].offset_two:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled" and base_f[v236][v237].mode:get() ~= "180 Degrees");
            base_f[v236][v237].delaying:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled" and base_f[v236][v237].mode:get() ~= "180 Degrees" and base_f[v236][v237].mode:get() ~= "Left & Right" and base_f[v236][v237].mode:get() ~= "Random");
            yaw_modif_f[v236][v237].mode:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled" and main_f[v236][v237].yaw_modifier:get() ~= "Disabled");
            yaw_modif_f[v236][v237].offset:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled" and main_f[v236][v237].yaw_modifier:get() ~= "Disabled");
            yaw_modif_f[v236][v237].offset_two:visibility(v239 and main_f[v236][v237].base:get() ~= "Disabled" and main_f[v236][v237].yaw_modifier:get() ~= "Disabled" and yaw_modif_f[v236][v237].mode:get() ~= "180 Degrees");
            local l_options_0 = body_yaw_f[v236][v237].options;
            if #l_options_0:get() < 1 then
                body_yaw_f[v236][v237].inverter:visibility(v239 and main_f[v236][v237].body_yaw:get());
            end;
            for v241 = 1, #l_options_0:get() do
                body_yaw_f[v236][v237].inverter:visibility(v239 and main_f[v236][v237].body_yaw:get() and l_options_0:get()[v241] ~= "Jitter");
            end;
            body_yaw_f[v236][v237].mode:visibility(v239 and main_f[v236][v237].body_yaw:get());
            body_yaw_f[v236][v237].left_limit:visibility(v239 and main_f[v236][v237].body_yaw:get());
            body_yaw_f[v236][v237].right_limit:visibility(v239 and main_f[v236][v237].body_yaw:get());
            body_yaw_f[v236][v237].options:visibility(v239 and main_f[v236][v237].body_yaw:get());
            body_yaw_f[v236][v237].freestanding:visibility(v239 and main_f[v236][v237].body_yaw:get());
            defensive_f[v236][v237].work_with_hs:visibility(v239 and main_f[v236][v237].defensive:get());
            defensive_f[v236][v237].pitch:visibility(v239 and main_f[v236][v237].defensive:get());
            defensive_f[v236][v237].yaw:visibility(v239 and main_f[v236][v237].defensive:get());
            defensive_f[v236][v237].speed:visibility(v239 and main_f[v236][v237].defensive:get() and defensive_f[v236][v237].yaw:get() == "Spin");
            defensive_f[v236][v237].offset:visibility(v239 and main_f[v236][v237].defensive:get() and defensive_f[v236][v237].yaw:get() == "Custom");
        end;
    end;
end;
events.aim_ack:set(function(v242)
    aimbot_log_f(v242);
end);
events.player_death:set(function(v243)
    trash_talking_f(v243);
end);
events.mouse_input:set(function(v244)
    if not misc.dont_fire_while_menu_open:get() or ui.get_alpha() == 0 then
        return true;
    elseif v244.m1 or v244.m2 then
        return false;
    else
        return;
    end;
end);
events.round_start:set(function()
    taskbar_notification_f();
end);
events.render:set(function()
    if ui.get_alpha() > 0 then
        configs.render();
        visibility_for_tabs();
        elements_visibility();
        antiaim_visibility();
        custom_sidebar_f();
        colored_elements();
        custom_background_f();
    end;
    clantag_spammer_f();
    auto_mute_f();
    override_viewmodel_f();
    override_aspect_ratio_f();
    crosshair_indicator_f();
    custom_scope_overlay_f();
    damage_indicator_f();
    manual_arrows_f();
    revolver_helper_f();
end);
events.createmove:set(function(v245)
    v245.animate_lean_walking = anim_changer.list:get("Lean walking");
    antiaim_builder_f(v245);
    custom_hitchance_f(v245);
    auto_teleport_f(v245);
    lag_exploit_f(v245);
    air_strafe_fix_f(v245);
    auto_body_aim_f(v245);
    custom_model_opacity_f();
end);
events.shutdown:set(function()
    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override(nil);
    ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(nil);
    set_clantag("");
end);