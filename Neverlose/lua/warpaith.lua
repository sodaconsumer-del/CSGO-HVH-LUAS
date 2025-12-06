_DEBUG = true;
local v0 = nil;
local v1 = 0;
do
    local l_v1_0 = v1;
    local function v3()
        -- upvalues: l_v1_0 (ref)
        l_v1_0 = common.get_timestamp();
    end;
    local function v4()
        -- upvalues: l_v1_0 (ref)
        return common.get_timestamp() - l_v1_0;
    end;
    v0 = {
        start = v3, 
        stop = v4
    };
end;
v0.start();
cvar.cl_foot_contact_shadows:int(0);
cvar.clear:call();
print_raw("\226\150\136\226\150\136\226\149\151    \226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151  \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\151  \226\150\136\226\150\136\226\149\151   \226\150\136\226\150\136\226\149\151     \226\150\136\226\150\136\226\149\151   \226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \n\226\150\136\226\150\136\226\149\145    \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\149\154\226\149\144\226\149\144\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145     \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\n\226\150\136\226\150\136\226\149\145 \226\150\136\226\149\151 \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145     \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\n\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\157 \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145     \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\n\226\149\154\226\150\136\226\150\136\226\150\136\226\149\148\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145     \226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\149\145  \226\150\136\226\150\136\226\149\145\n \226\149\154\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\144\226\149\157 \226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157     \226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157   \226\149\154\226\149\144\226\149\157   \226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157 \226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157 \226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\157");
v1 = render.screen_size().x;
local _ = render.screen_size().y;
local l_clipboard_0 = require("neverlose/clipboard");
local l_gradient_0 = require("neverlose/gradient");
local _ = require("neverlose/anti_aim");
local _ = common.get_username();
local l_mtools_0 = require("neverlose/mtools");
local l_base64_0 = require("neverlose/base64");
local _ = render.screen_size();
local l_minterface_0 = require("neverlose/minterface");
local l_pui_0 = require("neverlose/pui");
local l_smoothy_0 = require("neverlose/smoothy");
local v16 = render.screen_size();
out_products = l_pui_0.create("Info", "  ");
out_products2 = out_products:label("\aE3C353FF\f<triangle-exclamation>   \rIf you have found some kind of bugs in the script or have any suggestions,                     We are waiting for \vyou \rin our discord server");
out_products3 = out_products:label("\v\f<spider>   \rReport bugs");
out_products3 = out_products:button("\v\f<discord>  \rDiscord Server", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/39a7vHt3Ck");
end);
gif = ui.create("Info", "");
gif1 = ui.create("Home", "Information");
global_ui = ui.create("Info", "");
buttons_ui = l_pui_0.create("Info", "\vContacts", 1);
global_info = ui.create("Info", "Information");
cfgs = ui.create("Info", "PREMIUM");
main_ui = ui.create("Global", "main");
visuals_ui = ui.create("Global", "visuals");
misc_ui = ui.create("Global", "miscellaneous");
rage_ui = ui.create("Global", "ragebot");
out_products = l_pui_0.create("Info", "Our Products", 1);
out_products:label("\a{Small Text}Themes");
menu_style = out_products:button("\a506BFFFF\f<circle>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=kHEcIxBEO9kRtvmg-xvJ6TLMZ4B");
end);
menu_style:tooltip("\226\128\186 warpaith theme");
herp = out_products:button("\v\f<circle>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=n2gHBKEVb7RTDKMY-ALrC931ixu");
end);
herp:tooltip("\226\128\186 warpaith night");
out_products3 = out_products:label("\a{Small Text}Configs");
huyaten = out_products:button("\aBADDFBFF\f<circle> \aDEFAULT Courtney\n", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=0mpVbR");
end);
perchik = out_products:button("\aDEA06AFF\f<circle> \aDEFAULT Juice\n\n", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=OQ9T5N");
end);
local v17 = l_pui_0.create("Info", "\n", 1);
local v18 = {};
local v19 = ffi.load("Winmm");
ffi.cdef("        typedef int BOOL;\n        typedef const char* LPCSTR;\n        \n        BOOL PlaySoundA(LPCSTR pszSound, void* hmod, unsigned int fdwSound);\n        typedef unsigned long DWORD;\n        typedef void* HWAVEOUT;\n        int waveOutSetVolume(HWAVEOUT hwo, DWORD dwVolume);\n    ");
local v20 = 1;
local v21 = 131072;
local v22 = 64;
do
    local l_v19_0, l_v20_0, l_v21_0, l_v22_0 = v19, v20, v21, v22;
    v18.play = function(v27)
        -- upvalues: l_v19_0 (ref), l_v20_0 (ref), l_v21_0 (ref)
        l_v19_0.PlaySoundA(v27, nil, bit.bor(l_v20_0, l_v21_0));
    end;
    v18.stop = function()
        -- upvalues: l_v19_0 (ref), l_v22_0 (ref)
        l_v19_0.PlaySoundA(nil, nil, l_v22_0);
    end;
    v18.set_volume = function(v28)
        -- upvalues: l_v19_0 (ref)
        local v29 = math.floor(math.clamp(v28, 0, 1) * 65535);
        local v30 = bit.bor(bit.lshift(v29, 16), v29);
        l_v19_0.waveOutSetVolume(nil, v30);
    end;
end;
v19 = {};
v20 = color("f839e2ff");
v21 = color("f839e2ff");
v19.INDICATORS_COLOR = v20:clone();
v19.work = false;
v22 = "nl\\Fight Club Game\\";
files.create_folder(v22);
local v32 = v17:switch("\v\f<alien-8bit>   \rFight Club Game", false, nil, function(v31)
    return {
        volume = v31:slider("Volume", 0, 100, 30, 1, "%")
    };
end);
local v33 = {};
do
    local l_v20_1, l_v21_1, l_v22_1, l_v33_0 = v20, v21, v22, v33;
    add_image = function(v38)
        -- upvalues: l_v33_0 (ref)
        if v38:find(".png") then
            local l_status_0, l_result_0 = pcall(render.load_image_from_file, v38);
            if l_status_0 and l_result_0 ~= nil then
                table.insert(l_v33_0, l_result_0);
            end;
        end;
    end;
    download = function(v41, v42, v43)
        local v44 = v42 .. v43;
        if files.read(v44) == nil then
            network.get(v41, {}, function(v45)
                -- upvalues: v44 (ref), v43 (ref)
                if files.write(v44, v45, true) then
                    add_image(v44);
                    common.add_notify("Fight Club Game", v43 .. " downloaded.");
                end;
            end);
        else
            add_image(v44);
        end;
    end;
    download("https://i.imgur.com/pYaGYlk.png", l_v22_1, "tyler.png");
    download("https://i.imgur.com/txUC9xy.png", l_v22_1, "narrator.png");
    download("https://i.imgur.com/f4Z50gy.png", l_v22_1, "marla.png");
    download("https://github.com/kissprince/evalate/raw/main/welcome.wav", l_v22_1, "welcome.wav");
    download("https://github.com/kissprince/evalate/raw/main/mind.wav", l_v22_1, "mind.wav");
    local v46 = {};
    local v47 = 1;
    local v48 = l_pui_0.find("Visuals", "World", "Ambient", "Night Mode");
    local v49 = l_pui_0.find("Visuals", "World", "Ambient", "Fog Changer");
    local v50 = l_pui_0.find("Visuals", "World", "Ambient", "Skybox Changer");
    v32:set_event("render", function()
        -- upvalues: v19 (ref), v49 (ref), v48 (ref), l_v20_1 (ref), v50 (ref), l_v21_1 (ref), v46 (ref), v47 (ref), l_v33_0 (ref)
        v19.work = true;
        v49:override("Off");
        v48.color:override(l_v20_1);
        v50.color:override(l_v21_1);
        entity.get_players(true, false, function(v51)
            -- upvalues: v46 (ref), v47 (ref), l_v33_0 (ref)
            local v52 = v51:get_bbox();
            local v53 = string.format("%s::%s", v51:get_index(), v51:get_name());
            if v46[v53] == nil then
                v46[v53] = v47;
                v47 = v47 >= #l_v33_0 and 1 or v47 + 1;
            end;
            if v46[v53] ~= nil and v52.pos1 and v52.pos2 then
                render.texture(l_v33_0[v46[v53]], v52.pos1, v52.pos2 - v52.pos1);
            end;
        end);
    end);
    v32:set_callback(function(v54)
        -- upvalues: v19 (ref), v49 (ref), v48 (ref), v50 (ref)
        if not v54.value then
            v19.work = false;
            v49:override();
            v48.color:override();
            v50.color:override();
        end;
    end);
    local v55 = common.get_game_directory():gsub("csgo", "") .. l_v22_1;
    v32:set_callback(function(v56)
        -- upvalues: l_v22_1 (ref), v18 (ref), v55 (ref)
        if v56.value then
            if files.read(l_v22_1 .. "welcome.wav") ~= nil and files.read(l_v22_1 .. "mind.wav") ~= nil then
                v18.set_volume(v56.volume.value / 100);
                v18.play(v55 .. "welcome.wav");
                utils.execute_after(3.5, function()
                    -- upvalues: v56 (ref), v18 (ref), v55 (ref)
                    if v56.value then
                        v18.play(v55 .. "mind.wav");
                    end;
                end);
            else
                common.add_notify("Fight Club Game", "The files haven't downloaded yet, wait a bit.");
            end;
        else
            v18.stop();
        end;
    end);
    events.shutdown(v18.stop);
end;
v20 = common.get_username();
v21 = {
    data = {}
};
v21.new = function(v57, v58)
    -- upvalues: v21 (ref)
    assert(v21.data[v57] == nil, "menu.new - element with same name already exist");
    v21.data[v57] = v58;
    return v58;
end;
v21.get = function(v59)
    -- upvalues: v21 (ref)
    return v21.data[v59];
end;
v22 = {
    home = l_pui_0.create("Info", {
        [1] = {
            [1] = "gpresets_creation", 
            [2] = "name", 
            [3] = 2
        }, 
        [2] = {
            [1] = "gpresets", 
            [2] = "presets", 
            [3] = 2
        }
    })
};
v32 = {
    menu = {}
};
v32.menu.name = v22.home.gpresets_creation:input("");
v32.menu.create = v22.home.gpresets_creation:button("           \f<folder>  Create           ", nil);
v32.menu.import = v22.home.gpresets_creation:button("        \f<file-import>  Import        ", nil, true);
v32.menu.list = v22.home.gpresets:list("\n", {
    [1] = "There is no presets..."
});
v32.menu.load = v22.home.gpresets:button("    \f<play>    ");
v32.menu.load_antiaims = v22.home.gpresets:button("    \f<shield>    ");
v32.menu.save = v22.home.gpresets:button("    \f<floppy-disk>    ", nil, true);
v32.menu.export = v22.home.gpresets:button("    \f<file-export>    ", nil, true);
v32.menu.delete = v22.home.gpresets:button("    \ab82a2aff\f<trash>    ", nil, true);
v32.menu.load:tooltip("Load preset");
v32.menu.load_antiaims:tooltip("Load anti-aim's from preset");
v32.menu.save:tooltip("Save preset");
v32.menu.export:tooltip("Export preset");
v32.menu.delete:tooltip("Delete preset");
v33 = "warpaith.gpresets";
local v60 = db[v33] or {};
do
    local l_v33_1, l_v60_0 = v33, v60;
    local function v63()
        -- upvalues: l_v33_1 (ref), l_v60_0 (ref)
        db[l_v33_1] = l_v60_0;
    end;
    local v64 = {};
    local function v67()
        -- upvalues: v64 (ref), l_v60_0 (ref), v32 (ref)
        v64 = {};
        for _, v66 in ipairs(l_v60_0) do
            table.insert(v64, v66.name);
        end;
        v32.menu.list:update(#v64 > 0 and v64 or {
            [1] = "There is no presets..."
        });
    end;
    local function v69()
        -- upvalues: v32 (ref), l_v60_0 (ref)
        local v68 = v32.menu.list:get();
        if l_v60_0[v68] == nil then
            return v32.menu.list:name("\n");
        else
            v32.menu.list:name(string.format("Created by \v%s\r  \194\183  \v%s", l_v60_0[v68].author, common.get_date("%e %B %H:%M", l_v60_0[v68].time)) or "\n");
            return;
        end;
    end;
    local function v71()
        -- upvalues: v32 (ref), l_v60_0 (ref)
        local v70 = l_v60_0[v32.menu.list:get()] == nil;
        v32.menu.load:disabled(v70);
        v32.menu.load_antiaims:disabled(v70);
        v32.menu.save:disabled(v70);
        v32.menu.export:disabled(v70);
        v32.menu.delete:disabled(v70);
    end;
    local function v72()
        -- upvalues: v63 (ref), v67 (ref), v69 (ref), v71 (ref)
        v63();
        v67();
        v69();
        v71();
    end;
    v72();
    local function v79(v73, v74, v75, v76, v77)
        -- upvalues: l_v60_0 (ref), v72 (ref)
        local v78 = pcall(function()
            -- upvalues: v77 (ref), l_v60_0 (ref), v75 (ref), v76 (ref), v73 (ref), v74 (ref), v72 (ref)
            if v77 == true then
                if l_v60_0[1] ~= nil and l_v60_0[1].author == "warpaith" and l_v60_0[1].name == "Default" then
                    l_v60_0[1].data = v75;
                    l_v60_0[1].time = v76;
                else
                    table.insert(l_v60_0, 1, {
                        name = v73, 
                        author = v74, 
                        data = v75, 
                        time = v76
                    });
                end;
            else
                table.insert(l_v60_0, {
                    name = v73 ~= nil and #v73 > 0 and v73 or "Preset #" .. tostring(#l_v60_0 + 1), 
                    author = v74, 
                    data = v75, 
                    time = v76
                });
            end;
            v72();
        end);
        if v77 ~= true then
            common.add_notify("Presets", v78 and "Preset created" or "Failed on preset create");
        end;
    end;
    local function v82(v80)
        -- upvalues: l_v60_0 (ref), v72 (ref)
        local v81 = pcall(function()
            -- upvalues: l_v60_0 (ref), v80 (ref), v72 (ref)
            table.remove(l_v60_0, v80);
            v72();
        end);
        common.add_notify("Presets", v81 and "Preset deleted" or "Failed on preset delete");
    end;
    local function v85(v83)
        -- upvalues: l_v60_0 (ref), v32 (ref), v72 (ref)
        if l_v60_0[v83] == nil then
            return;
        else
            local v84 = pcall(function()
                -- upvalues: l_v60_0 (ref), v83 (ref), v32 (ref), v72 (ref)
                l_v60_0[v83].data = v32.package:save();
                l_v60_0[v83].time = common.get_unixtime();
                v72();
            end);
            common.add_notify("Presets", v84 and "Preset saved" or "Failed on preset save");
            return;
        end;
    end;
    local function v92(v86, v87)
        -- upvalues: l_v60_0 (ref), v32 (ref)
        if l_v60_0[v86] == nil then
            return print(v86, " nil");
        else
            local v88 = pcall(function()
                -- upvalues: v32 (ref), l_v60_0 (ref), v86 (ref), v87 (ref)
                v32.package:load(l_v60_0[v86].data, v87 == true and "antiaim" or nil);
            end);
            local l_add_notify_0 = common.add_notify;
            local v90 = "Presets";
            local v91;
            if v88 then
                v91 = v87 == true and "Anti-aim's loaded from preset" or "Preset loaded";
            else
                v91 = "Failed on preset load";
            end;
            l_add_notify_0(v90, v91);
            return;
        end;
    end;
    local function v95(v93)
        -- upvalues: l_v60_0 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
        if l_v60_0[v93] == nil then
            return print(v93, " nil");
        else
            local v94 = pcall(function()
                -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), l_v60_0 (ref), v93 (ref)
                l_clipboard_0.set(("warpaith.preset>%s<"):format(l_base64_0.encode(msgpack.pack(l_v60_0[v93]))));
            end);
            common.add_notify("Presets", v94 and "Preset exported" or "Failed on preset export");
            return;
        end;
    end;
    local function v100(v96, v97)
        -- upvalues: l_base64_0 (ref), v79 (ref)
        local v99 = pcall(function()
            -- upvalues: l_base64_0 (ref), v96 (ref), v97 (ref), v79 (ref)
            local v98 = msgpack.unpack(l_base64_0.decode(v96:match("warpaith.preset>(.-)<")));
            if v97 == true then
                v79("Default", "warpaith", v98.data, v98.time, true);
            else
                v79(v98.name, v98.author, v98.data, v98.time);
            end;
        end);
        if v97 ~= true then
            common.add_notify("Presets", v99 and "Preset imported" or "Failed on preset import");
        end;
    end;
    v32.menu.list:set_callback(v69, true);
    v32.menu.load:set_callback(function()
        -- upvalues: v92 (ref), v32 (ref)
        v92(v32.menu.list:get());
    end);
    v32.menu.load_antiaims:set_callback(function()
        -- upvalues: v92 (ref), v32 (ref)
        v92(v32.menu.list:get(), true);
    end);
    v32.menu.save:set_callback(function()
        -- upvalues: v85 (ref), v32 (ref)
        v85(v32.menu.list:get());
    end);
    v32.menu.export:set_callback(function()
        -- upvalues: v95 (ref), v32 (ref)
        v95(v32.menu.list:get());
    end);
    v32.menu.delete:set_callback(function()
        -- upvalues: v82 (ref), v32 (ref)
        v82(v32.menu.list:get());
    end);
    v32.menu.create:set_callback(function()
        -- upvalues: v79 (ref), v32 (ref), v20 (ref)
        v79(v32.menu.name:get(), v20, v32.package:save(), common.get_unixtime());
    end);
    v32.menu.import:set_callback(function()
        -- upvalues: v100 (ref), l_clipboard_0 (ref)
        v100(l_clipboard_0.get());
    end);
    v100("warpaith.preset>hKRkYXRhgqVvdGhlct4ATqt6ZXVzX2VuYWJsZcOyemV1c19kZWZhdWx0X2NvbG9yqSNGRkRGMDJGRrN6ZXVzX2luX2hhbmRzX2NvbG9yqSNGRjAwMDBGRq10aHJlYXQuZW5hYmxlwq10aHJlYXQub2Zmc2V0zMipRGlzY2hhcmdlwqxyYXRpb19lbmFibGXDrndlYXBvbnN3aXRjaGVywqtmYXN0X2xhZGRlcsOmdmlld1964qtrZWVwX3Njb3BlZMOmdmlld195KLdtZW51X3JlZi5zZXR0aW5ncy5zdHlsZaR2Mi41tm1lbnVfcmVmLnNldHRpbmdzLmRhdGHDt21lbnVfcmVmLnNldHRpbmdzLmNoZWF0qW5ldmVybG9zZbZtZW51X3JlZi5zZXR0aW5ncy5uYW1loLZtZW51X3JlZi5zZXR0aW5ncy5iZXRhw7dtZW51X3JlZi5zZXR0aW5ncy5jb2xvcqkjQTBCRUZGMjmuZW5fc21va2VfY29sb3KpIzNEOTNGQUI0t21lbnVfcmVmLnNldHRpbmdzLnBvc194BbdtZW51X3JlZi5zZXR0aW5ncy5wb3Nfec0COrhtZW51X3JlZi5zZXR0aW5ncy5wb3NfeDLNBgi4bWVudV9yZWYuc2V0dGluZ3MucG9zX3kyzQGItm1lbnVfcmVmLm1haW4uZmVhdHVyZXOUqVdhdGVybWFya6hLZXliaW5kc6pTcGVjdGF0b3JzoX6qYmFyX2VuYWJsZcKpYmFyX2NvbG9yqSM5NEEwRjRGRq9hdXRvX2hpZGVfc2hvdHPDsHRlbGVwb3J0X2V4cGxvaXTCrmFuaW1fYnJlYWtlcl8ywqxncmVuYWRlX2Ryb3DCtXNrZWV0X3NpZGVfaW5kaWNhdG9yc8KpbWVudV9sb2dzw6hhcnJvd191acKxfnRlbGVwb3J0X2V4cGxvaXSBpXRpY2tzCrN+YW5pbWF0aW9uX2JyZWFrZXJzg6NhaXKnRGlzYWJsZaR3YWxrpkppdHRlcqVvdGhlcpGhfq9+ZG9ybWFudF9haW1ib3SCrm1pbl9pbmFjY3VyYWN5MKptaW5fZGFtYWdlCLNkZWZlbnNpdmVfaW5keS5kcmFncbNkZWZlbnNpdmVfaW5keC5kcmFnzQTJtn5za2VldF9zaWRlX2luZGljYXRvcnOBpWl0ZW1zkaF+sH5hdXRvX2hpZGVfc2hvdHOCpnN0YXRlc5MBAqF+r2Rpc2FibGVfd2VhcG9uc5GhfqtzY29wZV9saW5lc8KrKmJhcl9lbmFibGWpIzk0QTBGNEZGrHNjb3BlX29mZnNldAqsc2NvcGVfbGVuZ3RoPKhtYXh1bmxhZ8Kzc2NvcGVfZGlzYWJsZV9saW5lc5Ghfql+YXJyb3dfdWmDpHNpemUKqGRpc3RhbmNlFKZhY2NlbnSpI0ZGRkZGRkZGrypjb25zb2xlX2VuYWJsZakjMkUyRjNFRUOqfm1lbnVfbG9nc4KmcmVuZGVylAECA6F+pm9mZnNldM0BkLBkYW1hZ2VfaW5kaWNhdG9yw6tzY29wZV9jb2xvcqkjRkZGRkZGRkaqY3RhZ2VuYWJsZcOsc3ByZWFkX3Njb3Blwqh2aWV3X2ZvdjOqZW5fbW9sb3RvdsK2c29sdXNfbWVudS5tYWluLmVuYWJsZcOpZGVidWdfYm94wq5kb3JtYW50X2FpbWJvdMKwd2F0ZXJtYXJrX2Nvcm5lcq1Cb3R0b20gY2VudGVyqipkZWJ1Z19ib3ipIzlCQThGRkZGsX5kYW1hZ2VfaW5kaWNhdG9yg6F58aF4Bq1oaWRlX2luYWN0aXZlw6tzY29wZV9zdHlsZadEZWZhdWx0rHNrZWV0X3NwZWN0c8KqanVtcF9zY291dMKtY29uc29sZV9jb2xvcqkjMkUyRjNFRUOoZW5fc21va2XCsX5pbmRpY2F0b3JzLmNvbWJvgapsb2dvX2NvbG9yqSM5RUNGRjBGRq5jb25zb2xlX2VuYWJsZcOwaW5kaWNhdG9ycy5jb21ib6hDeXJpbGxpY7ttZW51X3JlZi5zZXR0aW5ncy5wb3N0Y29sb3KpIzYxODhEQTREr3VubXV0ZV9zaWxlbmNlZMOrdmlld19lbmFibGXDpnZpZXdfeDKyYW5pbWF0aW9uX2JyZWFrZXJzw6lUcmFzaHRhbGvDq3NoYXJlZF9pY29uwrBlbl9tb2xvdG92X2NvbG9yqSNGRjNGM0ZCRatyYXRpb192YWx1ZcyIp2FudGlhaW2CpG1lbnWFqWNvbmRpdGlvbqNSdW6vd2FybXVwX2Rpc2FibGVyw6dvcHRpb25zg6l2aWV3X2Jhc2WpQXQgdGFyZ2V0pnN0YXRpY8OmbWFudWFsp0Rpc2FibGWmcHJlc2V0pkN1c3RvbaxhbGxvd19vbl91c2XDpnN0YXRlc4yjUnVu3gATqGxlZnRfbWF4V6R3YXlzA6lyaWdodF9tYXgYp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUBqWZyZWVzdGFuZKNPZmamb2Zmc2V0AKhtb2RpZmllcqZSYW5kb22nb3B0aW9uc5KmSml0dGVyoX6rZGVsYXlfdGlja3MFpmRlZ3JlZQqmZW5hYmxlw6pkZWdyZWVfbWlu8al+bW9kaWZpZXKBp21pbl9tYXjDqmRlZ3JlZV9tYXgPqmRlbGF5X3R5cGWmQ3VzdG9tpmRlc3luY8OlcmlnaHQ6pGxlZnQ6p35vZmZzZXSCqGFkZF9sZWZ04alhZGRfcmlnaHQgpVN0YW5k3gATqGxlZnRfbWF4XaR3YXlzBalyaWdodF9tYXgQp35kZXN5bmOCpnN3aXRjaCWlc3R5bGUDqWZyZWVzdGFuZKlQZWVrIEZha2Wmb2Zmc2V0AKhtb2RpZmllcqZDZW50ZXKnb3B0aW9uc5OmSml0dGVyr0FudGkgQnJ1dGVmb3JjZaF+q2RlbGF5X3RpY2tzAqZkZWdyZWX5pmVuYWJsZcOqZGVncmVlX21pbuqpfm1vZGlmaWVygadtaW5fbWF4w6pkZWdyZWVfbWF4GqpkZWxheV90eXBlpkN1c3RvbaZkZXN5bmPDpXJpZ2h0OqRsZWZ0Oqd+b2Zmc2V0gqhhZGRfbGVmdP2pYWRkX3JpZ2h0DqZHbG9iYWzeABKobGVmdF9tYXhkpHdheXMDqXJpZ2h0X21heGSnfmRlc3luY4Kmc3dpdGNoOqVzdHlsZQGpZnJlZXN0YW5ko09mZqZvZmZzZXQAqG1vZGlmaWVyqERpc2FibGVkp29wdGlvbnOSpkppdHRlcqF+q2RlbGF5X3RpY2tzAqRsZWZ0OqpkZWdyZWVfbWluAKd+b2Zmc2V0gqhhZGRfbGVmdACpYWRkX3JpZ2h0AKpkZWdyZWVfbWF4AKpkZWxheV90eXBlo09mZqZkZXN5bmPDpXJpZ2h0Oql+bW9kaWZpZXKBp21pbl9tYXjCpmRlZ3JlZQCjQWly3gATqGxlZnRfbWF4ZKR3YXlzA6lyaWdodF9tYXhkp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUBqWZyZWVzdGFuZKNPZmamb2Zmc2V0AKhtb2RpZmllcqZDZW50ZXKnb3B0aW9uc5KmSml0dGVyoX6rZGVsYXlfdGlja3MEpmRlZ3JlZeamZW5hYmxlw6pkZWdyZWVfbWlu4al+bW9kaWZpZXKBp21pbl9tYXjDqmRlZ3JlZV9tYXgkqmRlbGF5X3R5cGWjT2ZmpmRlc3luY8OlcmlnaHQ6pGxlZnQ6p35vZmZzZXSCqGFkZF9sZWZ0AKlhZGRfcmlnaHQAr2RlZmVuc2l2ZV9zZXR1cMOwfmRlZmVuc2l2ZV9zZXR1cN4ASq5SdW5waXRjaF9zcGVlZMyEsFN0YW5kcGl0Y2hfc3BlZWQPpkFpcnlhd6ZSYW5kb22oUnVucGl0Y2imU3RhdGljtUFpciBDcm91Y2hwaXRjaF9zcGVlZBywV2Fsa3BpdGNoX29mZnNldNCor0FpcnBpdGNoX29mZnNldNC0q0Nyb3VjaHBpdGNoplJhbmRvbbRXYWxrcGl0Y2hfb2Zmc2V0X21pbtCnrUFpciBDcm91Y2h5YXemU3dpdGNoqVJ1bmVuYWJsZcKpV2Fsa3BpdGNopkxpbmVhcqhTdGFuZHlhd6ZTd2l0Y2itQWlyeWF3X29mZnNldHStV2Fsa3lhd19zcGVlZBWwQWlyIENyb3VjaGVuYWJsZcOuQWlycGl0Y2hfc3BlZWTMyKxTdGFuZG1pbl9tYXjCtkNyb3VjaHBpdGNoX29mZnNldF9tYXg0qWNvbmRpdGlvbqpBaXIgQ3JvdWNotVN0YW5kcGl0Y2hfb2Zmc2V0X21pbtCntVN0YW5kcGl0Y2hfb2Zmc2V0X21heNCntENyb3VjaHlhd19vZmZzZXRfbWluHrRDcm91Y2h5YXdfb2Zmc2V0X21heFmqQWlybWluX21heMKxQWlyIENyb3VjaG1pbl9tYXjCs1N0YW5keWF3X29mZnNldF9taW4As1N0YW5keWF3X29mZnNldF9tYXgAs0FpcnBpdGNoX29mZnNldF9taW7Qp7NBaXJwaXRjaF9vZmZzZXRfbWF40KetQ3JvdWNobWluX21heMK6QWlyIENyb3VjaHBpdGNoX29mZnNldF9tYXjQv7FBaXJ5YXdfb2Zmc2V0X21pbgCxQWlyeWF3X29mZnNldF9tYXgAtFdhbGtwaXRjaF9vZmZzZXRfbWF40Ke4QWlyIENyb3VjaHlhd19vZmZzZXRfbWF4IKpSdW5taW5fbWF4wrJXYWxreWF3X29mZnNldF9tYXgAr0Nyb3VjaHlhd19zcGVlZBWyV2Fsa3lhd19vZmZzZXRfbWluALFSdW55YXdfb2Zmc2V0X21pbgCrV2Fsa21pbl9tYXjCuEFpciBDcm91Y2h5YXdfb2Zmc2V0X21pbnGzUnVucGl0Y2hfb2Zmc2V0X21pbjGmc2FmZXR5lapXaGlsZSBwZWVrrlNhZmUgY29uZGl0aW9uqk9uIGdyZW5hZGWmT24gVXNloX62Q3JvdWNocGl0Y2hfb2Zmc2V0X21pbtCnukFpciBDcm91Y2hwaXRjaF9vZmZzZXRfbWluJLNSdW5waXRjaF9vZmZzZXRfbWF4MaxSdW55YXdfc3BlZWQrsVN0YW5kcGl0Y2hfb2Zmc2V0WapXYWxrZW5hYmxlw6lBaXJlbmFibGXDrENyb3VjaGVuYWJsZcOmUnVueWF3pFNwaW60QWlyIENyb3VjaHlhd19vZmZzZXRkqlN0YW5kcGl0Y2imU3RhdGljq1N0YW5kZW5hYmxlwq9SdW5waXRjaF9vZmZzZXRZqEFpcnBpdGNoplN0YXRpY69BaXIgQ3JvdWNocGl0Y2imTGluZWFyrlN0YW5keWF3X3NwZWVkD69XYWxrcGl0Y2hfc3BlZWQOsENyb3VjaHlhd19vZmZzZXRkqUNyb3VjaHlhd6ZSYW5kb22xUnVueWF3X29mZnNldF9tYXgAr1N0YW5keWF3X29mZnNldEKnV2Fsa3lhd6ZTd2l0Y2isQWlyeWF3X3NwZWVkB65XYWxreWF3X29mZnNldGK2QWlyIENyb3VjaHBpdGNoX29mZnNldNCnskNyb3VjaHBpdGNoX29mZnNldNCns0FpciBDcm91Y2h5YXdfc3BlZWQBrVJ1bnlhd19vZmZzZXQKsUNyb3VjaHBpdGNoX3NwZWVkR6NVc2XeABOobGVmdF9tYXhkpHdheXMDqXJpZ2h0X21heGSnfmRlc3luY4Kmc3dpdGNoOqVzdHlsZQOpZnJlZXN0YW5kqVBlZWsgUmVhbKZvZmZzZXQAqG1vZGlmaWVypkNlbnRlcqdvcHRpb25zk61Bdm9pZCBPdmVybGFwr0FudGkgQnJ1dGVmb3JjZaF+q2RlbGF5X3RpY2tzBKZkZWdyZWX5pmVuYWJsZcOqZGVncmVlX21pbv6pfm1vZGlmaWVygadtaW5fbWF4w6pkZWdyZWVfbWF4DKpkZWxheV90eXBlpFNvZnSmZGVzeW5jw6VyaWdodDqkbGVmdDqnfm9mZnNldIKoYWRkX2xlZnQAqWFkZF9yaWdodACuYXZvaWRfYmFja3N0YWLDpEFpciveABOobGVmdF9tYXhkpHdheXMDqXJpZ2h0X21heGSnfmRlc3luY4Kmc3dpdGNoOqVzdHlsZQGpZnJlZXN0YW5ko09mZqZvZmZzZXT/qG1vZGlmaWVypkNlbnRlcqdvcHRpb25zkqZKaXR0ZXKhfqtkZWxheV90aWNrcwKmZGVncmVl5aZlbmFibGXDqmRlZ3JlZV9taW7pqX5tb2RpZmllcoGnbWluX21heMOqZGVncmVlX21heB2qZGVsYXlfdHlwZaNPZmamZGVzeW5jw6VyaWdodBGkbGVmdDGnfm9mZnNldIKoYWRkX2xlZnQAqWFkZF9yaWdodACkRHVja94AE6hsZWZ0X21heGSkd2F5cwOpcmlnaHRfbWF4ZKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlA6lmcmVlc3RhbmSjT2Zmpm9mZnNldAGobW9kaWZpZXKmQ2VudGVyp29wdGlvbnOTpkppdHRlcq9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwOmZGVncmVl6qZlbmFibGXDqmRlZ3JlZV9taW4AqX5tb2RpZmllcoGnbWluX21heMKqZGVncmVlX21heACqZGVsYXlfdHlwZaVSaWdpZKZkZXN5bmPDpXJpZ2h0OqRsZWZ0Oqd+b2Zmc2V0gqhhZGRfbGVmdPSpYWRkX3JpZ2h0DKRTYWZl3gAUqGxlZnRfbWF4ZKR3YXlzA6d+b2Zmc2V0gqhhZGRfbGVmdACpYWRkX3JpZ2h0AKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlA6lmcmVlc3RhbmSjT2ZmqmRlbGF5X3R5cGWlUmlnaWSobW9kaWZpZXKmQ2VudGVyp29wdGlvbnOSr0FudGkgQnJ1dGVmb3JjZaF+q2RlbGF5X3RpY2tzAqd+ZW5hYmxlgqR6ZXVzwqVrbmlmZcKmZGVncmVl/qZlbmFibGXDpXJpZ2h0AKlyaWdodF9tYXhkqmRlZ3JlZV9tYXgAqX5tb2RpZmllcoGnbWluX21heMKmZGVzeW5jw6ZvZmZzZXQAqmRlZ3JlZV9taW4ApGxlZnQAqVNsb3cgV2Fsa94AE6hsZWZ0X21heGSkd2F5cwOpcmlnaHRfbWF4ZKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlA6lmcmVlc3RhbmSjT2Zmpm9mZnNldACobW9kaWZpZXKmUmFuZG9tp29wdGlvbnOTpkppdHRlcq9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwKmZGVncmVl7aZlbmFibGXDqmRlZ3JlZV9taW4AqX5tb2RpZmllcoGnbWluX21heMKqZGVncmVlX21heACqZGVsYXlfdHlwZaZDdXN0b22mZGVzeW5jw6VyaWdodDqkbGVmdDqnfm9mZnNldIKoYWRkX2xlZnTwqWFkZF9yaWdodBOkdGltZc5nbeX4pmF1dGhvcqR4YUdlpG5hbWWmYWJ1c2ly<", true);
end;
v33 = nil;
v60 = function()
    -- upvalues: l_pui_0 (ref)
    local v101 = l_pui_0.accent:clone();
    return {
        v101, 
        v101:alpha_modulate(0)
    };
end;
local v102 = l_gradient_0.text_animate("warpaith ~ stable", 1.5, v60());
local function v103()
    -- upvalues: v19 (ref)
    return {
        v19.INDICATORS_COLOR:clone(), 
        v19.INDICATORS_COLOR:clone():alpha_modulate(0)
    };
end;
local v104 = l_gradient_0.text_animate("fight club", 1.5, v103());
do
    local l_v60_1, l_v102_0, l_v103_0, l_v104_0 = v60, v102, v103, v104;
    local function v111()
        -- upvalues: v19 (ref), l_v104_0 (ref), l_v102_0 (ref), l_v103_0 (ref), l_v60_1 (ref), l_pui_0 (ref)
        local v109 = v19.work and l_v104_0 or l_v102_0;
        local v110 = v19.work and l_v103_0() or l_v60_1();
        v109:animate();
        v109:set_colors(v110);
        l_pui_0.sidebar(v109:get_animated_text(), string.sub(v109:get_animated_text(), 1, 9) .. "\f<free-code-camp>");
    end;
    events.render(v111);
end;
v102 = l_pui_0.find("Visuals", "Players", "Enemies", "ESP"):switch("\vWhats There\r ?"):tooltip("This feature \vdont make something\r. \n\n Just sitting there because of \n\vI \rwant to \vsay \rto all of you \aC1F682FFthanks\r. ");
v103 = {
    element = l_pui_0.create("Misc", ui.get_icon("palette") .. " Visuals"):switch("\v\f<hand-point-up> \r   Hit Logs \aFFB880FF*new style!", false, nil, function(v112)
        local v113 = {
            render = v112:listable("", {
                [1] = "Console", 
                [2] = "Corner", 
                [3] = "Skeet center \aFFB880FF*new"
            }), 
            offset = v112:slider("Offset", 0, 400, 200, 1, "px")
        };
        v113.offset:depend({
            [1] = nil, 
            [2] = 3, 
            [1] = v113.render
        });
        return v113, true;
    end)
};
v21.new("menu_logs", v103.element);
v104 = {
    color = {
        text = color("D6D2D5"), 
        border = color("111111"), 
        outline = color("272727"), 
        background = color(0), 
        gradient = {
            left = color("6EA2C9"), 
            right = color("E4E2AA"), 
            center = color("C17EB8")
        }
    }, 
    padding = vector(25, 21), 
    paint = function(v114, v115, v116, v117, v118)
        if not v117 then
            v117 = 255;
        end;
        local v119 = render.measure_text(1, "", v116);
        local v120 = v119 + v114.padding;
        if v118 then
            v115 = v115 - v120 / 2;
        end;
        local v121 = v115 + v119 + v114.padding;
        render.rect(v115, v121, v114.color.background:alpha_modulate(v117));
        render.rect_outline(v115 + 3, v121 - 3, v114.color.border:alpha_modulate(v117), 4);
        render.rect_outline(v115 + 2, v121 - 2, v114.color.outline:alpha_modulate(v117));
        render.rect_outline(v115 + 6, v121 - 6, v114.color.outline:alpha_modulate(v117));
        local v122 = vector((v119.x - 18 + v114.padding.x) / 2, 1);
        render.gradient(v115 + 9, v115 + v122 + 9, v114.color.gradient.left:alpha_modulate(v117), v114.color.gradient.center:alpha_modulate(v117), v114.color.gradient.left:alpha_modulate(v117), v114.color.gradient.center:alpha_modulate(v117));
        render.gradient(v115 + vector(v122.x, 0) + 9, v115 + vector(v122.x, 0) + v122 + 9, v114.color.gradient.center:alpha_modulate(v117), v114.color.gradient.right:alpha_modulate(v117), v114.color.gradient.center:alpha_modulate(v117), v114.color.gradient.right:alpha_modulate(v117));
        render.text(1, v115 + v114.padding / 2, v114.color.text:alpha_modulate(v117), "", v116);
    end
};
local _ = {};
local v124 = 40;
local v125 = 5;
local v126 = 6;
local v127 = {};
do
    local l_v124_0, l_v125_0, l_v126_0, l_v127_0 = v124, v125, v126, v127;
    local function v133(v132)
        -- upvalues: v103 (ref), l_v127_0 (ref), l_smoothy_0 (ref)
        if v103.element.value and v103.element.render:get(3) then
            table.insert(l_v127_0, 1, {
                alpha = 0, 
                func = v132, 
                time = globals.realtime, 
                smoothy = l_smoothy_0.new(0)
            });
        end;
    end;
    v133(function(v134, v135)
        -- upvalues: v104 (ref), v20 (ref)
        v104:paint(v135, ("Welcome back, %s!"):format(v20), v134.alpha, true);
    end);
    local v136 = l_smoothy_0.new(0);
    local function v145()
        -- upvalues: v103 (ref), v136 (ref), v16 (ref), l_v127_0 (ref), l_v125_0 (ref), l_v124_0 (ref), l_v126_0 (ref)
        local v137 = entity.get_local_player() ~= nil and v103.element.value and v103.element.render:get(3);
        local v138 = v136(0.075, v137);
        if not v137 and v138 < 0.05 then
            return;
        else
            local v139 = 0;
            local v140 = v16 / 2;
            local l_value_0 = v103.element.offset.value;
            for v142, v143 in pairs(l_v127_0) do
                local v144 = v143.time + l_v125_0 > globals.realtime;
                v143:func(vector(v140.x, v140.y + l_value_0 + l_v124_0 * v139));
                v143.alpha = math.clamp(v143.smoothy(0.075, v144 and 275 or -25), 0, 255) * v138;
                v139 = v139 + v143.alpha / 255;
                if #l_v127_0 > l_v126_0 then
                    table.remove(l_v127_0);
                end;
                if v144 == false and v143.alpha < 1 then
                    table.remove(l_v127_0, v142);
                end;
            end;
            return;
        end;
    end;
    local v146 = {
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
    local function v151(v147)
        -- upvalues: v146 (ref), v133 (ref), v104 (ref)
        if v147.target == nil or v147.target:is_player() == false or v147.state ~= nil then
            return;
        else
            local v148 = ("hit %s in the %s for %s damage (%s health remaining)"):format(v147.target:get_name(), v146[v147.hitgroup] or "?", math.floor(v147.damage), v147.target.m_iHealth);
            v133(function(v149, v150)
                -- upvalues: v104 (ref), v148 (ref)
                v104:paint(v150, v148, v149.alpha, true);
            end);
            return;
        end;
    end;
    local function v156(v152)
        -- upvalues: v133 (ref), v104 (ref)
        if v152.target == nil or v152.target:is_player() == false or v152.state == nil then
            return;
        else
            local v153 = ("missed shot due to %s"):format(v152.state == "correction" and "unknown" or v152.state);
            v133(function(v154, v155)
                -- upvalues: v104 (ref), v153 (ref)
                v104:paint(v155, v153, v154.alpha, true);
            end);
            return;
        end;
    end;
    events.aim_ack(v151);
    events.aim_ack(v156);
    events.render(v145);
end;
({
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
    new_state = {
        correction = "unknown"
    }, 
    send = function(_, v158)
        -- upvalues: v103 (ref)
        if not v103.element.value then
            return;
        else
            if v103.element.render:get(1) then
                print_raw(v158);
            end;
            if v103.element.render:get(2) then
                print_dev(v158);
            end;
            return;
        end;
    end, 
    on_fire = function(v159, v160)
        if v160.target == nil or v160.target:is_player() == false then
            return;
        else
            v159:send((("aim fire: player: %s | hitbox: %s | hitchance: %s%% | damage: %s | custom_body_yaw: %.2f\194\176 | lag_comp: %s\aDEFAULT"):format(v160.target:get_name(), v159.hitgroups[v160.hitgroup] or "?", math.floor(v160.hitchance + 0.5), math.floor(v160.damage), v160.angle.x, v160.backtrack)));
            return;
        end;
    end, 
    on_hit = function(v161, v162)
        if v162.target == nil or v162.target:is_player() == false or v162.state ~= nil then
            return;
        else
            v161:send((("\a97B33111hit %s in the %s for %s damage (%s health remaining)\aDEFAULT"):format(v162.target:get_name(), v161.hitgroups[v162.hitgroup] or "?", math.floor(v162.damage), v162.target.m_iHealth)));
            return;
        end;
    end, 
    on_miss = function(v163, v164)
        if v164.target == nil or v164.target:is_player() == false or v164.state == nil then
            return;
        else
            v163:send((("\ac95b5bbbmissed shot due to %s\aDEFAULT"):format(v163.new_state[v164.state] or v164.state)));
            return;
        end;
    end, 
    setup = function(v165)
        events.aim_fire:set(function(v166)
            -- upvalues: v165 (ref)
            v165:on_fire(v166);
        end);
        events.aim_ack:set(function(v167)
            -- upvalues: v165 (ref)
            v165:on_hit(v167);
        end);
        events.aim_ack:set(function(v168)
            -- upvalues: v165 (ref)
            v165:on_miss(v168);
        end);
    end
}):setup();
v125 = require("neverlose/pui");
v126 = {
    lerp = function(_, v170, v171, v172)
        local v173 = v170 + (v171 - v170) * globals.frametime * v172;
        return math.abs(v171 - v173) < 0.005 and v171 or v173;
    end, 
    data = {}, 
    new = function(v174, v175, v176, v177)
        if v174.data[v175] == nil then
            v174.data[v175] = v176;
        end;
        v174.data[v175] = v174:lerp(v174.data[v175], v176, 20);
        if v177 ~= nil then
            return math.floor(v174.data[v175] + v177);
        else
            return v174.data[v175];
        end;
    end
};
v127 = {
    styles = {}, 
    style_names = {
        [1] = "None"
    }, 
    combo = v125.create("Misc", ui.get_icon("palette") .. " Visuals"):combo("\v\f<user-check> \r Indicators", {
        [1] = "loading..."
    }, nil, function(v178, v179)
        local v180 = {
            logo_color = v178:color_picker("Logo", color("4FF9FFFF"))
        };
        v180.logo_color:depend({
            [1] = nil, 
            [2] = "Glowed", 
            [3] = "Cyrillic", 
            [1] = v179
        });
        return v180;
    end), 
    new_style = function(v181, v182, v183)
        assert(v181.styles[v182] == nil, "this style already exist");
        table.insert(v181.style_names, v182);
        v181.combo:update(v181.style_names);
        v181.styles[v182] = setmetatable({}, {
            __index = {
                data = {}, 
                offset = v183 or 10, 
                get_active = function(v184)
                    local v185 = {};
                    for _, v187 in pairs(v184.data) do
                        if v187:get() then
                            table.insert(v185, v187);
                        end;
                    end;
                    return v185;
                end, 
                push = function(v188, v189)
                    table.insert(v188.data, setmetatable(v189, {
                        __index = {
                            alpha = 0, 
                            get = function(_)
                                return true;
                            end, 
                            paint = function(_)

                            end
                        }
                    }));
                end
            }
        });
        return v181.styles[v182];
    end, 
    handle = function(v192)
        -- upvalues: v126 (ref)
        local v193 = entity.get_local_player();
        if not v193 or not v193:is_alive() then
            return;
        else
            local v194 = 0;
            local v195 = 20;
            local v196 = render.screen_size() / 2;
            local v197 = v192.styles[v192.combo:get()];
            if v197 == nil then
                return;
            else
                for _, v199 in ipairs(v197.data) do
                    v199.alpha = math.clamp(v126:lerp(v199.alpha, v199:get() and 300 or -30, 20), 0, 255);
                    v199:paint(vector(v196.x + 1, v196.y + v195 + v197.offset * v194), v193.m_bIsScoped and true or false);
                    v194 = v194 + v199.alpha / 255;
                end;
                return;
            end;
        end;
    end, 
    setup = function(v200)
        -- upvalues: v19 (ref), l_gradient_0 (ref), v126 (ref)
        local v201 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
        local v202 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
        local v203 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
        local v204 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
        local v205 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
        local _ = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
        local _ = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
        local v208 = v200:new_style("Simple");
        v208:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return v19.work;
            end, 
            gradient = l_gradient_0.text_animate("fight club", 1, {
                v19.INDICATORS_COLOR, 
                v19.INDICATORS_COLOR:alpha_modulate(100)
            }), 
            paint = function(v210, v211)
                v210.gradient:animate();
                local v212 = v210.gradient:get_animated_text();
                render.text(4, v211, color(255, v210.alpha), "", v212);
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return not v19.work;
            end, 
            paint = function(v214, v215)
                local v216 = string.format("warpaith \a%srecognize", color(170, 175, 242):to_hex());
                render.text(4, v215, color(255, v214.alpha), "", v216);
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v203 (ref)
                return v203:get();
            end, 
            paint = function(v218, v219)
                local v220 = rage.exploit:get() == 1 and color(0, 255, 0, v218.alpha) or color(255, 0, 0, v218.alpha);
                render.text(4, v219, v220, "", "dt");
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v204 (ref)
                return v204:get();
            end, 
            paint = function(v222, v223)
                render.text(4, v223, color(224, 255, 233, v222.alpha), "", "hs");
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v205 (ref)
                return v205:get_override() or v205:get();
            end, 
            paint = function(v225, v226)
                render.text(4, v226, color(255, v225.alpha), "", "fs");
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v202 (ref)
                return v202:get() == "Force";
            end, 
            paint = function(v228, v229)
                render.text(4, v229, color(255, v228.alpha), "", "sp");
            end
        });
        v208:push({
            get = function(_)
                -- upvalues: v201 (ref)
                return v201:get() == "Force";
            end, 
            paint = function(v231, v232)
                render.text(4, v232, color(255, v231.alpha), "", "baim");
            end
        });
        local v233 = v200:new_style("Pixelia", 11);
        v233:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return v19.work;
            end, 
            gradient = l_gradient_0.text_animate("FIGHT CLUB", 1, {
                v19.INDICATORS_COLOR, 
                v19.INDICATORS_COLOR:alpha_modulate(100)
            }), 
            paint = function(v235, v236, v237)
                -- upvalues: v126 (ref)
                v235.gradient:animate();
                local v238 = v235.gradient:get_animated_text();
                local v239 = v126:new("pixelia_name_fight", v237 and 0 or render.measure_text(2, "", v238).x / 2, 0.55);
                v236.x = v236.x - v239;
                render.text(2, v236, color(255, v235.alpha), "", v238);
            end
        });
        v233:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return not v19.work;
            end, 
            paint = function(v241, v242, v243)
                -- upvalues: v126 (ref)
                local v244 = string.format("WARPAITH  \a%sRECODE", color(255, 150):to_hex());
                local v245 = v126:new("pixelia_name", v243 and 0 or render.measure_text(2, "", v244).x / 2, 0.55);
                v242.x = v242.x - v245;
                render.text(2, v242, color(255, v241.alpha), "", v244);
            end
        });
        v233:push({
            get = function(_)
                -- upvalues: v203 (ref)
                return v203:get();
            end, 
            paint = function(v247, v248, v249)
                -- upvalues: v126 (ref)
                local v250 = rage.exploit:get() == 1 and color(170, 255, 170, v247.alpha) or color(255, 170, 170, v247.alpha);
                local v251 = "DOUBLE  TAP";
                local v252 = v126:new("pixelia_dt", v249 and 0 or render.measure_text(2, "", v251).x / 2, 0.55);
                v248.x = v248.x - v252;
                render.text(2, v248, v250, "", v251);
            end
        });
        v233:push({
            get = function(_)
                -- upvalues: v204 (ref)
                return v204:get();
            end, 
            paint = function(v254, v255, v256)
                -- upvalues: v126 (ref)
                local v257 = "ON  SHOT";
                local v258 = v126:new("pixelia_hs", v256 and 0 or render.measure_text(2, "", v257).x / 2, 0.55);
                v255.x = v255.x - v258;
                render.text(2, v255, color(192, 255, 247, v254.alpha), "", v257);
            end
        });
        v233:push({
            get_state = function(_)
                local v260 = entity.get_local_player();
                if not v260 then
                    return;
                else
                    local v261 = v260:get_anim_state();
                    local v262 = v261.velocity:length();
                    local v263 = {};
                    local function v266(v264, v265)
                        -- upvalues: v263 (ref)
                        table.insert(v263, {
                            name = v264, 
                            call = v265
                        });
                    end;
                    v266("ducking", function()
                        -- upvalues: v261 (ref), v262 (ref)
                        return v261.on_ground and v261.anim_duck_amount > 0.8 and v262 < 4;
                    end);
                    v266("standing", function()
                        -- upvalues: v261 (ref), v262 (ref)
                        return v261.on_ground and v262 < 4;
                    end);
                    v266("in duck moving", function()
                        -- upvalues: v261 (ref), v262 (ref)
                        return v261.on_ground and v261.anim_duck_amount > 0.8 and v262 > 4;
                    end);
                    v266("moving", function()
                        -- upvalues: v261 (ref), v262 (ref)
                        return v261.on_ground and v262 > 4;
                    end);
                    v266("in air", function()
                        -- upvalues: v261 (ref)
                        return not v261.on_ground;
                    end);
                    for _, v268 in pairs(v263) do
                        if v268.call() then
                            return v268.name;
                        end;
                    end;
                    return;
                end;
            end, 
            paint = function(v269, v270, v271)
                -- upvalues: v126 (ref)
                local v272 = ("'   %s   '"):format(v269:get_state():upper() or "NONE");
                local v273 = v126:new("pixelia_state", v271 and 0 or render.measure_text(2, "", v272).x / 2, 0.55);
                v270.x = v270.x - v273;
                render.text(2, v270, color(255, v269.alpha), "", v272);
            end
        });
        local v274 = v200:new_style("Bold", 11);
        v274:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return v19.work;
            end, 
            gradient = l_gradient_0.text_animate("fight club", 1, {
                v19.INDICATORS_COLOR, 
                v19.INDICATORS_COLOR:alpha_modulate(100)
            }), 
            paint = function(v276, v277, v278)
                -- upvalues: v126 (ref)
                v276.gradient:animate();
                local v279 = v276.gradient:get_animated_text();
                local v280 = v126:new("bold_name_fight", v278 and 0 or render.measure_text(4, "", v279).x / 2, 0.55);
                v277.x = v277.x - v280;
                render.text(4, v277, color(255, v276.alpha), "", v279);
            end
        });
        v274:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return not v19.work;
            end, 
            paint = function(v282, v283, v284)
                -- upvalues: v126 (ref)
                local v285 = string.format("warpaith  \a%srecode", color(255, 150):to_hex());
                local v286 = v126:new("bold_name", v284 and 0 or render.measure_text(4, "", v285).x / 2, 0.55);
                v283.x = v283.x - v286;
                render.text(4, v283, color(255, v282.alpha), "", v285:lower());
            end
        });
        v274:push({
            get = function(_)
                -- upvalues: v203 (ref)
                return v203:get();
            end, 
            paint = function(v288, v289, v290)
                -- upvalues: v126 (ref)
                local v291 = rage.exploit:get() == 1 and color(0, 255, 0, v288.alpha) or color(255, 170, 170, v288.alpha);
                local v292 = "dt";
                local v293 = v126:new("bold_dt", v290 and 0 or render.measure_text(4, "", v292).x / 2, 0.55);
                v289.x = v289.x - v293;
                render.text(4, v289, v291, "", v292:lower());
            end
        });
        v274:push({
            get = function(_)
                -- upvalues: v204 (ref)
                return v204:get();
            end, 
            paint = function(v295, v296, v297)
                -- upvalues: v126 (ref)
                local v298 = "hs";
                local v299 = v126:new("bold_hs", v297 and 0 or render.measure_text(4, "", v298).x / 2, 0.55);
                v296.x = v296.x - v299;
                render.text(4, v296, color(192, 255, 247, v295.alpha), "", v298:lower());
            end
        });
        v274:push({
            get_state = function(_)
                local v301 = entity.get_local_player();
                if not v301 then
                    return;
                else
                    local v302 = v301:get_anim_state();
                    local v303 = v302.velocity:length();
                    local v304 = {};
                    local function v307(v305, v306)
                        -- upvalues: v304 (ref)
                        table.insert(v304, {
                            name = v305, 
                            call = v306
                        });
                    end;
                    v307("ducking", function()
                        -- upvalues: v302 (ref), v303 (ref)
                        return v302.on_ground and v302.anim_duck_amount > 0.8 and v303 < 4;
                    end);
                    v307("standing", function()
                        -- upvalues: v302 (ref), v303 (ref)
                        return v302.on_ground and v303 < 4;
                    end);
                    v307("in duck moving", function()
                        -- upvalues: v302 (ref), v303 (ref)
                        return v302.on_ground and v302.anim_duck_amount > 0.8 and v303 > 4;
                    end);
                    v307("moving", function()
                        -- upvalues: v302 (ref), v303 (ref)
                        return v302.on_ground and v303 > 4;
                    end);
                    v307("in air", function()
                        -- upvalues: v302 (ref)
                        return not v302.on_ground;
                    end);
                    for _, v309 in pairs(v304) do
                        if v309.call() then
                            return v309.name;
                        end;
                    end;
                    return;
                end;
            end, 
            paint = function(v310, v311, v312)
                -- upvalues: v126 (ref)
                local v313 = ("'   %s   '"):format(v310:get_state() or "none");
                local v314 = v126:new("bold_state", v312 and 0 or render.measure_text(4, "", v313).x / 2, 0.55);
                v311.x = v311.x - v314;
                render.text(4, v311, color(255, v310.alpha), "", v313:lower());
            end
        });
        local v315 = v200:new_style("Glowed", 11);
        v315:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return v19.work;
            end, 
            gradient = l_gradient_0.text_animate("FIGHT CLUB", 1, {
                v19.INDICATORS_COLOR, 
                v19.INDICATORS_COLOR:alpha_modulate(100)
            }), 
            paint = function(v317, v318, v319)
                -- upvalues: v126 (ref), v19 (ref)
                v317.gradient:animate();
                local v320 = v317.gradient:get_animated_text();
                local v321 = render.measure_text(4, "", v320);
                local v322 = v126:new("test_name_fight", v319 and 0 or v321.x / 2, 0.55);
                v318.x = v318.x - v322;
                local v323 = vector(v318.x, v318.y + 6);
                render.shadow(v323, v323 + vector(v321.x, 0), v19.INDICATORS_COLOR:clone():alpha_modulate(v317.alpha), 40);
                render.text(4, v318, color(255, v317.alpha), "", v320);
            end
        });
        local l_logo_color_0 = v200.combo.logo_color;
        v315:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return not v19.work;
            end, 
            paint = function(v326, v327, v328)
                -- upvalues: l_logo_color_0 (ref), v126 (ref)
                local v329 = string.format("WARPAITH", l_logo_color_0.value:alpha_modulate(255):to_hex());
                local v330 = render.measure_text(4, "", v329);
                local v331 = v126:new("test_name", v328 and 0 or v330.x / 2, 0.55);
                v327.x = v327.x - v331;
                local v332 = vector(v327.x, v327.y + 6);
                render.shadow(v332, v332 + vector(v330.x, 0), l_logo_color_0.value:alpha_modulate(v326.alpha), 40);
                render.text(4, v327, l_logo_color_0.value:alpha_modulate(v326.alpha), "", v329);
            end
        });
        v315:push({
            paint = function(v333, v334, v335)
                -- upvalues: v126 (ref)
                local v336 = string.format("\a%sRECODE", color(255, 150):to_hex());
                local v337 = v126:new("test_name1", v335 and 0 or render.measure_text(2, "", v336).x / 2, 0.55);
                v334.x = v334.x - v337;
                render.text(2, v334, color(255, v333.alpha), "", v336);
            end
        });
        v315:push({
            get = function(_)
                -- upvalues: v203 (ref)
                return v203:get();
            end, 
            paint = function(v339, v340, v341)
                -- upvalues: v126 (ref)
                local v342 = rage.exploit:get() == 1 and color(170, 255, 170, v339.alpha) or color(255, 170, 170, v339.alpha);
                local v343 = "DT";
                local v344 = v126:new("test_dt", v341 and 0 or render.measure_text(2, "", v343).x / 2, 0.55);
                v340.x = v340.x - v344;
                render.text(2, v340, v342, "", v343);
            end
        });
        v315:push({
            get = function(_)
                -- upvalues: v204 (ref)
                return v204:get();
            end, 
            paint = function(v346, v347, v348)
                -- upvalues: v126 (ref)
                local v349 = "OS";
                local v350 = v126:new("test_hs", v348 and 0 or render.measure_text(2, "", v349).x / 2, 0.55);
                v347.x = v347.x - v350;
                render.text(2, v347, color(192, 255, 247, v346.alpha), "", v349);
            end
        });
        v315:push({
            get_state = function(_)
                local v352 = entity.get_local_player();
                if not v352 then
                    return;
                else
                    local v353 = v352:get_anim_state();
                    local v354 = v353.velocity:length();
                    local v355 = {};
                    local function v358(v356, v357)
                        -- upvalues: v355 (ref)
                        table.insert(v355, {
                            name = v356, 
                            call = v357
                        });
                    end;
                    v358("ducking", function()
                        -- upvalues: v353 (ref), v354 (ref)
                        return v353.on_ground and v353.anim_duck_amount > 0.8 and v354 < 4;
                    end);
                    v358("standing", function()
                        -- upvalues: v353 (ref), v354 (ref)
                        return v353.on_ground and v354 < 4;
                    end);
                    v358("in duck moving", function()
                        -- upvalues: v353 (ref), v354 (ref)
                        return v353.on_ground and v353.anim_duck_amount > 0.8 and v354 > 4;
                    end);
                    v358("moving", function()
                        -- upvalues: v353 (ref), v354 (ref)
                        return v353.on_ground and v354 > 4;
                    end);
                    v358("in air", function()
                        -- upvalues: v353 (ref)
                        return not v353.on_ground;
                    end);
                    for _, v360 in pairs(v355) do
                        if v360.call() then
                            return v360.name;
                        end;
                    end;
                    return;
                end;
            end, 
            paint = function(v361, v362, v363)
                -- upvalues: v126 (ref)
                local v364 = ("'   %s   '"):format(v361:get_state():upper() or "NONE");
                local v365 = v126:new("test_state", v363 and 0 or render.measure_text(2, "", v364).x / 2, 0.55);
                v362.x = v362.x - v365;
                render.text(2, v362, color(255, v361.alpha), "", v364);
            end
        });
        local v366 = v200:new_style("Cyrillic", 11);
        v366:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return v19.work;
            end, 
            gradient = l_gradient_0.text_animate("fight club", 1, {
                v19.INDICATORS_COLOR, 
                v19.INDICATORS_COLOR:alpha_modulate(100)
            }), 
            paint = function(v368, v369, v370)
                -- upvalues: v126 (ref), v19 (ref)
                v368.gradient:animate();
                local v371 = v368.gradient:get_animated_text();
                local v372 = render.measure_text(1, "", v371);
                local v373 = v126:new("cyrillic_name_fight", v370 and 0 or v372.x / 2, 0.55);
                v369.x = v369.x - v373;
                local v374 = vector(v369.x, v369.y + 6);
                render.shadow(v374, v374 + vector(v372.x, 0), v19.INDICATORS_COLOR:clone():alpha_modulate(v368.alpha), 30);
                render.text(1, v369, color(255, v368.alpha), "", v371);
            end
        });
        local l_logo_color_1 = v200.combo.logo_color;
        v366:push({
            get = function(_)
                -- upvalues: v19 (ref)
                return not v19.work;
            end, 
            paint = function(v377, v378, v379)
                -- upvalues: l_logo_color_1 (ref), v126 (ref)
                local v380 = string.format("warpaith", l_logo_color_1.value:alpha_modulate(255):to_hex());
                local v381 = render.measure_text(1, "", v380);
                local v382 = v126:new("cyrillic_name", v379 and 0 or v381.x / 2, 0.55);
                v378.x = v378.x - v382;
                local v383 = vector(v378.x - 2.5, v378.y + 6);
                render.shadow(v383, v383 + vector(v381.x, 0), l_logo_color_1.value:alpha_modulate(v377.alpha), 30);
                render.text(1, v378, l_logo_color_1.value:alpha_modulate(v377.alpha), "", v380);
            end
        });
        v366:push({
            paint = function(v384, v385, v386)
                -- upvalues: v126 (ref)
                local v387 = string.format("\a%sBETA", color(255, 150):to_hex());
                local v388 = v126:new("cyrillic_name1", v386 and 0 or render.measure_text(2, "", v387).x / 2, 0.55);
                v385.x = v385.x - v388;
                render.text(2, v385, color(255, v384.alpha), "", v387);
            end
        });
        v366:push({
            get = function(_)
                -- upvalues: v203 (ref)
                return v203:get();
            end, 
            paint = function(v390, v391, v392)
                -- upvalues: v126 (ref)
                local v393 = rage.exploit:get() == 1 and color(255, 255, 255, v390.alpha) or color(255, 170, 170, v390.alpha);
                local v394 = "DT";
                local v395 = v126:new("cyrillic_dt", v392 and 0 or render.measure_text(2, "", v394).x / 2, 0.55);
                v391.x = v391.x - v395;
                render.text(2, v391, v393, "", v394);
            end
        });
        v366:push({
            get = function(_)
                -- upvalues: v204 (ref)
                return v204:get();
            end, 
            paint = function(v397, v398, v399)
                -- upvalues: v126 (ref)
                local v400 = "OS";
                local v401 = v126:new("cyrillic_hs", v399 and 0 or render.measure_text(2, "", v400).x / 2, 0.55);
                v398.x = v398.x - v401;
                render.text(2, v398, rage.exploit:get() == 1 and color(255, 255, 255, v397.alpha) or color(255, 170, 170, v397.alpha), "", v400);
            end
        });
        v366:push({
            get_state = function(_)
                local v403 = entity.get_local_player();
                if not v403 then
                    return;
                else
                    local v404 = v403:get_anim_state();
                    local v405 = v404.velocity:length();
                    local v406 = {};
                    local function v409(v407, v408)
                        -- upvalues: v406 (ref)
                        table.insert(v406, {
                            name = v407, 
                            call = v408
                        });
                    end;
                    v409("ducking", function()
                        -- upvalues: v404 (ref), v405 (ref)
                        return v404.on_ground and v404.anim_duck_amount > 0.8 and v405 < 4;
                    end);
                    v409("standing", function()
                        -- upvalues: v404 (ref), v405 (ref)
                        return v404.on_ground and v405 < 4;
                    end);
                    v409("in duck moving", function()
                        -- upvalues: v404 (ref), v405 (ref)
                        return v404.on_ground and v404.anim_duck_amount > 0.8 and v405 > 4;
                    end);
                    v409("moving", function()
                        -- upvalues: v404 (ref), v405 (ref)
                        return v404.on_ground and v405 > 4;
                    end);
                    v409("in air", function()
                        -- upvalues: v404 (ref)
                        return not v404.on_ground;
                    end);
                    for _, v411 in pairs(v406) do
                        if v411.call() then
                            return v411.name;
                        end;
                    end;
                    return;
                end;
            end, 
            paint = function(v412, v413, v414)
                -- upvalues: v126 (ref)
                local v415 = ("-%s-"):format(v412:get_state():lower() or "NONE");
                local v416 = v126:new("cyrillic_state", v414 and 0 or render.measure_text(4, "", v415).x / 2, 0.55);
                v413.x = v413.x - v416;
                render.text(1, v413, color(255, v412.alpha), "", v415);
            end
        });
        events.render:set(function()
            -- upvalues: v200 (ref)
            v200:handle();
        end);
    end
};
v127:setup();
v21.new("indicators.combo", v127.combo);
global = v125.create("Misc", ui.get_icon("globe") .. " Misc");
ui_element = global:switch("\v\f<keyboard> \r Trashtalk", false);
v21.new("Trashtalk", ui_element);
phrases = {
    [1] = "x\225\180\128\201\180\225\180\135 \225\180\128\225\180\133\225\180\133\225\180\135\225\180\133 \225\180\155\202\156\201\170\234\156\177 \225\180\155\225\180\143 \225\180\161\225\180\128\202\128\225\180\152\225\180\128\201\170\225\180\155\202\156 \202\128\225\180\135\225\180\132\225\180\143\225\180\133\225\180\135 \225\180\128\201\180\225\180\133 \201\170\225\180\155 \225\180\141\225\180\128\225\180\133\225\180\135 \201\170\225\180\155 \234\156\177\225\180\143 \225\180\141\225\180\156\225\180\132\202\156 \202\153\225\180\135\225\180\155\225\180\155\225\180\135\202\128", 
    [2] = "skeet invite code in morse: ... .-- ..-. -.-- -... .-- ..-. -... .--- --.. -... .-.. -.- .... ..-. .-.. -.- --. .. .-. .--. --. .-.. --.- --.- - -.-- .---- -..- . .-- -.- -.-- --.- ---.. .-.. .... ... ...- --.. -..- -.. .--. -..- -- -... - -.--", 
    [3] = "\227\128\144\227\128\128\239\188\183\239\188\161\239\188\178\239\188\176\239\188\161\239\188\169\239\188\180\239\188\168\227\128\128\239\188\161\239\188\174\239\188\180\239\188\169\239\188\141\239\188\161\239\188\169\239\188\173\239\188\162\239\188\175\239\188\180\227\128\128\239\188\178\239\188\165\239\188\163\239\188\175\239\188\164\239\188\165\227\128\128\227\128\145", 
    [4] = "\240\157\159\157\240\157\159\153.\240\157\159\153\240\157\159\159\240\157\159\160.\240\157\159\153\240\157\159\160\240\157\159\157.\240\157\159\154\240\157\159\155\240\157\159\155.\240\157\149\161\240\157\149\157\240\157\149\146\240\157\149\170\240\157\149\150\240\157\149\163\240\157\149\164.\240\157\149\155\240\157\149\164\240\157\149\160\240\157\149\159 \240\157\147\172\240\157\147\189\240\157\147\187\240\157\147\181+f , \240\157\150\142\240\157\150\152\240\157\150\152\240\157\150\148 \240\157\150\139\240\157\150\148\240\157\150\142 \240\157\150\137\240\157\150\148\240\157\150\149\240\157\150\138, \240\157\150\140\240\157\150\134\240\157\150\147\240\157\150\137\240\157\150\134 \240\157\150\153\240\157\150\148\240\157\150\150\240\157\150\154\240\157\150\138", 
    [5] = "\240\159\149\175\239\184\143\226\167\154\240\159\142\131\226\167\154\240\159\148\174 \198\153\196\133YR\224\189\158\198\161\197\139 \225\191\179\196\177\198\150\198\150 \198\136\198\161\198\161\226\132\152 \202\130\226\132\152\196\177\201\155\198\150\201\155\197\139 \240\159\148\174\226\167\154\240\159\142\131\226\167\154\240\159\149\175\239\184\143", 
    [6] = "\224\174\131\225\133\148>.< \209\135\208\187\208\181\208\189 \208\178 \208\183\208\176\208\180\208\189\208\184\209\134\208\181 \209\131 \208\189\208\190\209\129\208\190\209\128\208\190\208\179\208\190\208\178 \239\188\183\239\188\161\239\188\178\239\188\176\239\188\161\239\188\169\239\188\180\239\188\168 \239\188\178\239\188\165\239\188\163\239\188\175\239\188\164\239\188\165\225\133\149\224\174\131", 
    [7] = "\226\130\169\226\130\179\226\177\164\226\130\177\226\130\179\197\130\226\130\174\226\177\167 \226\130\180\201\134\226\130\166\196\144 \226\130\178\226\177\164\201\134\201\134\226\130\174\197\130\226\130\166\226\130\178\226\130\180 \226\130\177\226\130\179\226\177\164\226\130\179 \226\130\179 \226\130\181\195\152\226\130\166\226\130\179 \196\144\226\130\179 \226\130\174\201\132\226\130\179 \226\130\165\226\130\179\204\131\201\134", 
    [8] = "\200\182\202\143 \202\132\214\133\202\128 \202\1412 \198\136\214\133\202\141\214\132\201\168\211\188\201\168\214\133\213\188 \213\161\201\168\200\182\201\166 \200\182\201\166\201\155 \214\132\214\133\214\132\214\134 \199\159\213\188\201\150 \200\182\201\166\201\155 \201\174\199\159\213\188\201\162\214\134 \202\132\200\182 \240\157\147\140\240\157\146\182\240\157\147\135\240\157\147\133\240\157\146\182\240\157\146\190\240\157\147\137\240\157\146\189 \240\157\147\129\240\157\147\138\240\157\146\182"
};
events.player_death(function(v417)
    local v418 = entity.get(v417.userid, true);
    local v419 = entity.get(v417.attacker, true);
    local v420 = entity.get_local_player();
    if ui_element:get(1) and v420 == v419 and v420 ~= v418 then
        utils.execute_after(2.3, function()
            utils.console_exec("say " .. phrases[math.random(#phrases)]);
        end);
    end;
end);
group = v125.create("Misc", ui.get_icon("globe") .. " Misc");
ctagenable = group:switch("\v\f<list>   \rClan Tag");
v21.new("ctagenable", ctagenable);
tag = {
    [1] = "  ", 
    [2] = "w", 
    [3] = "w", 
    [4] = "\240\157\147\166", 
    [5] = "\240\157\147\166", 
    [6] = "\240\157\153\146", 
    [7] = "\240\157\153\146", 
    [8] = "wa", 
    [9] = "wa", 
    [10] = "w\240\157\151\174", 
    [11] = "w\240\157\151\174", 
    [12] = "w\240\157\148\184", 
    [13] = "w\240\157\148\184", 
    [14] = "wa", 
    [15] = "war", 
    [16] = "war", 
    [17] = "war", 
    [18] = "wa\226\147\135", 
    [19] = "wa\226\147\135", 
    [20] = "wa\226\147\135", 
    [21] = "wa\240\157\147\161", 
    [22] = "wa\240\157\147\161", 
    [23] = "wa\240\157\147\161", 
    [24] = "wa\240\157\144\171", 
    [25] = "wa\240\157\144\171", 
    [26] = "wa\240\157\144\171", 
    [27] = "wa\226\177\164", 
    [28] = "wa\226\177\164", 
    [29] = "wa\226\177\164", 
    [30] = "warp", 
    [31] = "warp", 
    [32] = "war\226\130\177", 
    [33] = "war\226\130\177", 
    [34] = "war\226\130\177", 
    [35] = "war\240\157\144\169", 
    [36] = "war\240\157\144\169", 
    [37] = "war\226\132\153", 
    [38] = "war\226\132\153", 
    [39] = "warpa", 
    [40] = "warpa", 
    [41] = "warp\240\157\146\182", 
    [42] = "warp\240\157\146\182", 
    [43] = "warp\224\184\132", 
    [44] = "warp\224\184\132", 
    [45] = "warp\225\151\169\240\157\149\146", 
    [46] = "warp\240\157\149\146\225\151\169", 
    [47] = "warpai ", 
    [48] = "warpai ", 
    [49] = "warpa\240\157\147\178", 
    [50] = "warpa\240\157\147\178", 
    [51] = "warpa\240\157\144\136", 
    [52] = "warpa\240\157\144\136", 
    [53] = "warpa\240\157\144\162", 
    [54] = "warpa\240\157\144\162", 
    [55] = "warpait", 
    [56] = "warpait", 
    [57] = "warpai\198\172", 
    [58] = "warpai\198\172", 
    [59] = "warpai\227\132\146", 
    [60] = "warpai\227\132\146", 
    [61] = "warpai\240\157\147\137", 
    [62] = "warpai\240\157\147\137", 
    [63] = "warpaith", 
    [64] = "warpaith ", 
    [65] = "warpait\226\146\189", 
    [66] = "warpait\226\146\189", 
    [67] = "warpait\240\157\147\177", 
    [68] = "warpait\240\157\147\177", 
    [69] = "warpait\229\141\132", 
    [70] = "warpait\229\141\132", 
    [71] = "warpait\240\159\133\183", 
    [72] = "warpait\240\159\133\183", 
    [73] = "warpaith", 
    [74] = "warpaith", 
    [75] = "warpaith\226\156\167", 
    [76] = "warpaith\226\156\167", 
    [77] = "warpaith\226\153\165", 
    [78] = "warpaith\226\153\165", 
    [79] = "warpaith\226\154\155", 
    [80] = "warpaith\226\154\155", 
    [81] = "warpaith$", 
    [82] = "warpaith$", 
    [83] = "warpaith$", 
    [84] = "$warpaith", 
    [85] = "$warpaith", 
    [86] = "$warpaith", 
    [87] = "warpaith\226\153\148", 
    [88] = "warpaith\226\153\148", 
    [89] = "warpaith\226\153\148", 
    [90] = "*warpaith", 
    [91] = "*warpaith", 
    [92] = "*warpaith", 
    [93] = "warpaith*", 
    [94] = "warpaith*", 
    [95] = "warpaith*", 
    [96] = "\226\153\146warpaith", 
    [97] = "\226\153\146warpaith", 
    [98] = "\226\153\146warpaith", 
    [99] = "warpaith\226\153\146", 
    [100] = "warpaith\226\153\146", 
    [101] = "warpaith\226\153\146", 
    [102] = "\195\151warpaith", 
    [103] = "\195\151warpaith", 
    [104] = "\195\151warpaith", 
    [105] = "warpaith\195\151", 
    [106] = "warpaith\195\151", 
    [107] = "warpaith\195\151", 
    [108] = "warpaith ", 
    [109] = "warpaith ", 
    [110] = "warpaith ", 
    [111] = "warpaith ", 
    [112] = "warpaith ", 
    [113] = "warpaith ", 
    [114] = "warpaith ", 
    [115] = "warpaith ", 
    [116] = "warpaith", 
    [117] = "warpait", 
    [118] = "warpai", 
    [119] = "warpa", 
    [120] = "warp", 
    [121] = "war", 
    [122] = "wa", 
    [123] = "w", 
    [124] = " ", 
    [125] = "  ", 
    [126] = "  ", 
    [127] = " "
};
getClantag = function()
    net = utils.net_channel();
    if net == nil then
        return;
    else
        local v421 = net.latency[0] / globals.tickinterval;
        local v422 = globals.tickcount + v421;
        local v423 = math.floor(math.fmod(v422 / 12, #tag + 1) + 1);
        return tag[v423];
    end;
end;
_last_clantag = nil;
set_tag = function(v424)
    if v424 == _last_clantag then
        return;
    elseif v424 == nil then
        return;
    else
        common.set_clan_tag(v424);
        _last_clantag = v424;
        return;
    end;
end;
events.render:set(function()
    if ctagenable:get() then
        set_tag(getClantag());
    else
        set_tag(" ");
    end;
end);
local _ = nil;
local v426 = {
    movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
};
local v427 = ffi.typeof("        struct {\t\t\t\t\t\t\t\t\t\tchar pad_0x0000[0x18];\n            int\tsequence;\n            float\t\tprev_cycle;\n            float\t\tweight;\n            float\t\tweight_delta_rate;\n            float\t\tplayback_rate;\n            float\t\tcycle;\n            void\t\t*entity;\t\t\t\t\t\tchar pad_0x0038[0x4];\n        } **\n    ");
local v429 = v125.create("Anti-Aim", ui.get_icon("transporter") .. " Anti-Aim"):switch("\v\f<person-walking>   \a4E5382FFAnim. breakers", false, nil, function(v428)
    return {
        air = v428:combo("Air", "Disable", "Static", "Moonwalk"), 
        walk = v428:combo("Walk", "Disable", "Slide", "Static", "Jitter", "Moonwalk"), 
        other = v428:selectable("Other", "Pitch on land", "Static slow walk", "Static duck", "Flashed")
    }, true;
end);
v21.new("animation_breakers", v429);
do
    local l_v426_0, l_v427_0, l_v429_0 = v426, v427, v429;
    local function v438(v433)
        -- upvalues: l_v426_0 (ref), l_v427_0 (ref), l_v429_0 (ref)
        local v434 = entity.get_local_player();
        if v433 ~= v434 then
            return;
        else
            l_v426_0.movement:override();
            local v435 = ffi.cast(l_v427_0, ffi.cast("uintptr_t", v433[0]) + 10640)[0];
            local v436 = v434:get_anim_state();
            local v437 = not v436.on_ground;
            if l_v429_0.walk.value == "Static" and not v437 then
                l_v426_0.movement:override("Walking");
                v435[6].sequence = 3;
            end;
            if l_v429_0.walk.value == "Slide" then
                l_v426_0.movement:override("Sliding");
                v434.m_flPoseParameter[0] = 0;
            end;
            if l_v429_0.walk.value == "Jitter" then
                l_v426_0.movement:override("Sliding");
                v434.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 0;
            end;
            if l_v429_0.walk.value == "Moonwalk" then
                l_v426_0.movement:override("Walking");
                v434.m_flPoseParameter[7] = 0;
            end;
            if l_v429_0.air.value == "Static" then
                v434.m_flPoseParameter[6] = 1;
            end;
            if l_v429_0.air.value == "Moonwalk" and v437 then
                v435[6].weight = 1;
                v434.m_flPoseParameter[7] = 0;
            end;
            if l_v429_0.other:get(1) and v436.landing and not v437 then
                v434.m_flPoseParameter[12] = 0.5;
            end;
            if l_v429_0.other:get(2) then
                l_v426_0.movement:override("Walking");
                v434.m_flPoseParameter[9] = 0;
            end;
            if l_v429_0.other:get(3) then
                v434.m_flPoseParameter[8] = 0;
            end;
            if l_v429_0.other:get(4) then
                v435[0].sequence = 227;
            end;
            return;
        end;
    end;
    events.post_update_clientside_animation(function(v439)
        -- upvalues: l_v429_0 (ref), v438 (ref)
        if l_v429_0.value then
            v438(v439);
        end;
    end);
    events.shutdown(function()
        -- upvalues: l_v426_0 (ref)
        l_v426_0.movement:override();
    end);
    l_v429_0:set_callback(function()
        -- upvalues: l_v426_0 (ref)
        l_v426_0.movement:override();
    end);
end;
v125.colors.none = color(0, 0);
v427 = (function(v440)
    local v441 = {};
    for v442, v443 in next, v440 do
        v441[v442] = v443;
    end;
    return v441;
end)(table);
v427.has = function(v444, v445)
    for _, v447 in ipairs(v444) do
        if v445 == v447 then
            return true;
        end;
    end;
    return false;
end;
v427.delete = function(v448, v449)
    -- upvalues: v427 (ref)
    local v450 = {};
    for _, v452 in ipairs(v448) do
        if v452 ~= v449 then
            v427.insert(v450, v452);
        end;
    end;
    return v450;
end;
v427.change = function(v453, v454, v455)
    -- upvalues: v427 (ref)
    local v456 = {};
    for _, v458 in pairs(v453) do
        if v458 == v454 then
            v427.insert(v456, v455);
        else
            v427.insert(v456, v458);
        end;
    end;
    return v456;
end;
v22.antiaim = v125.create("Anti-Aim", {
    [1] = {
        [1] = "preset", 
        [2] = "preset", 
        [3] = 2
    }, 
    [2] = {
        [1] = "general", 
        [2] = nil, 
        [3] = 1, 
        [2] = ui.get_icon("transporter") .. " Anti-Aim"
    }, 
    [3] = {
        [1] = "features", 
        [2] = "features", 
        [3] = 1
    }, 
    [4] = {
        [1] = "configs", 
        [2] = "configs", 
        [3] = 1
    }
});
local v459 = nil;
v429 = false;
local v460 = 1;
local v461 = 1;
do
    local l_v429_1, l_v460_0, l_v461_0 = v429, v460, v461;
    local function v465()
        -- upvalues: l_v460_0 (ref), l_v461_0 (ref), l_v429_1 (ref)
        if globals.choked_commands == 0 then
            if l_v460_0 > 1 then
                if l_v460_0 <= l_v461_0 then
                    l_v461_0 = 1;
                    l_v429_1 = not l_v429_1;
                else
                    l_v461_0 = l_v461_0 + 1;
                end;
            else
                l_v429_1 = not l_v429_1;
            end;
        end;
    end;
    events.createmove(v465);
    v459 = setmetatable({
        get_last = function()
            -- upvalues: l_v429_1 (ref)
            return l_v429_1;
        end
    }, {
        __call = function(_, v467)
            -- upvalues: l_v460_0 (ref), l_v429_1 (ref)
            l_v460_0 = v467 or 1;
            return l_v429_1;
        end
    });
end;
v429 = nil;
v460 = 1;
v461 = 3;
do
    local l_v460_1, l_v461_1 = v460, v461;
    local function v470()
        -- upvalues: l_v460_1 (ref), l_v461_1 (ref)
        if globals.choked_commands == 0 then
            if l_v461_1 <= l_v460_1 then
                l_v460_1 = 0;
            end;
            l_v460_1 = l_v460_1 + 1;
        end;
    end;
    events.createmove(v470);
    v429 = function(v471, _)
        -- upvalues: l_v461_1 (ref), l_v460_1 (ref)
        l_v461_1 = v471 or 3;
        return math.clamp(l_v460_1, 1, l_v461_1);
    end;
end;
v460 = {
    on_use = false, 
    menu = {}, 
    states = {}, 
    names = {}, 
    callbacks = {}
};
v461 = v460;
local v473 = nil;
v461.menu.preset = v22.antiaim.general:combo("\v\f<layer-group>  \rPreset", {
    [1] = "Custom"
}, nil, function(v474)
    return {
        _export = v474:button("              \f<copy>  Copy settings              ", nil), 
        _import = v474:button("        \f<arrow-down-to-line>  Load from clipboard        ", nil)
    };
end);
v461.menu.preset_log = v22.antiaim.preset:label("");
v461.menu.preset_log:visibility(false);
v461.menu.allow_on_use = v22.antiaim.features:switch("\v\f<toggle-on>  \rAllow on use");
v461.menu.warmup_disabler = v22.antiaim.features:switch("\v\f<wand-sparkles>  \rWarmup disablers");
v461.states.avoid_backstab = v22.antiaim.features:switch("\v\f<knife-kitchen>  \rAvoid backstab");
local v475 = {
    enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    ["yaw offset"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    ["yaw modifier"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    ["modifier degree"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    ["body yaw"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    ["left limit"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    ["right limit"] = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    ["avoid backstab"] = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab")
};
local v476 = {
    Right = 90, 
    Left = -90, 
    Forward = 180, 
    Backward = 0, 
    Freestand = 0, 
    Disable = 0
};
local v477 = v125.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
    YAW = "Disable Yaw Modifiers", 
    BODY = "Body Freestanding"
});
math.lerp = function(v478, v479, v480)
    return (v479 - v478) * v480 + v478;
end;
local function v485(v481, v482, v483)
    local v484 = globals.realtime % v481 / v481;
    return math.lerp(v482, v483, v484);
end;
local function v490(v486, v487, v488)
    local l_v486_0 = v486;
    return vector(v487):lerp(vector(v488), globals.realtime % l_v486_0 / l_v486_0).x;
end;
local function v497(v491, v492, v493)
    -- upvalues: v427 (ref)
    local v494 = v491 - 1;
    local v495 = {};
    for v496 = 0, v494 do
        v427.insert(v495, math.lerp(v492, v493, v496 / v494));
    end;
    return v495;
end;
do
    local l_v461_2, l_v473_0, l_v475_0, l_v476_0, l_v477_0, l_v485_0, l_v490_0, l_v497_0 = v461, v473, v475, v476, v477, v485, v490, v497;
    local v554 = {
        pitch = {
            names = {}, 
            callbacks = {}, 
            new = function(v506, v507, v508)
                -- upvalues: v427 (ref)
                v427.insert(v506.names, v507);
                v506.callbacks[v507] = v508;
            end, 
            init = function(v509)
                -- upvalues: l_v490_0 (ref)
                v509:new("None");
                v509:new("Linear", function(v510, v511, v512, v513, v514)
                    -- upvalues: l_v490_0 (ref)
                    return l_v490_0(v514, v510 and v512 or 0, v510 and v513 or v511);
                end);
                v509:new("Static", function(_, v516, _, _, _)
                    return v516;
                end);
                v509:new("Switch", function(v520, v521, v522, v523, _)
                    return globals.tickcount % 4 > 1 and (v520 and v522 or v521) or v520 and v523 or -v521;
                end);
                v509:new("Random", function(v525, v526, v527, v528, _)
                    return math.random(v525 and v527 or -v526, v525 and v528 or v526);
                end);
            end
        }, 
        yaw = {
            names = {}, 
            callbacks = {}, 
            new = function(v530, v531, v532)
                -- upvalues: v427 (ref)
                v427.insert(v530.names, v531);
                v530.callbacks[v531] = v532;
            end, 
            init = function(v533)
                -- upvalues: l_v490_0 (ref)
                v533:new("None", function(_, _, _, _, _)
                    return 0;
                end);
                v533:new("Spin", function(v539, v540, v541, v542, v543)
                    -- upvalues: l_v490_0 (ref)
                    return l_v490_0(v543, v539 and v541 or 0, v539 and v542 or v540);
                end);
                v533:new("Switch", function(v544, v545, v546, v547, _)
                    return globals.tickcount % 4 > 1 and (v544 and v546 or v545) or v544 and v547 or -v545;
                end);
                v533:new("Random", function(v549, v550, v551, v552, _)
                    return math.random(v549 and v551 or -v550, v549 and v552 or v550);
                end);
            end
        }
    };
    v554.yaw:init();
    v554.pitch:init();
    local v555 = {
        modifier = 0
    };
    local v578 = (function()
        -- upvalues: v427 (ref)
        local v556 = {
            data = {}, 
            names = {}
        };
        local function v559(v557, v558)
            -- upvalues: v556 (ref), v427 (ref)
            v556.data[v557] = v558;
            v427.insert(v556.names, v557);
        end;
        v559("Air", function(v560)
            local v561 = v560:get_anim_state();
            return not v561.on_ground and v561.anim_duck_amount < 0.8;
        end);
        local v562 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
        v559("Run", function(v563)
            -- upvalues: v562 (ref)
            local v564 = v563:get_anim_state();
            return v564.velocity:length() > 2 and v564.on_ground and v564.anim_duck_amount < 0.8 and not v562:get();
        end);
        v559("Walk", function(v565)
            -- upvalues: v562 (ref)
            local v566 = v565:get_anim_state();
            return v566.velocity:length() > 2 and v566.on_ground and v562:get();
        end);
        v559("Stand", function(v567)
            local v568 = v567:get_anim_state();
            return v568.velocity:length() < 2 and v568.on_ground and v568.anim_duck_amount < 0.8;
        end);
        v559("Crouch", function(v569)
            local v570 = v569:get_anim_state();
            return v570.on_ground and v570.anim_duck_amount > 0.8;
        end);
        v559("Air Crouch", function(v571)
            local v572 = v571:get_anim_state();
            return not v572.on_ground and v572.anim_duck_amount > 0.8;
        end);
        v556.get_names = function(v573)
            return v573.names;
        end;
        v556.get_active_state = function(v574, v575)
            if not v575 then
                return;
            else
                for v576, v577 in pairs(v574.data) do
                    if v577 ~= nil and v577(v575) then
                        return v576;
                    end;
                end;
                return;
            end;
        end;
        return v556;
    end)();
    v125.colors.invis = color(0, 0);
    do
        local l_v578_0 = v578;
        l_v461_2.states.defensive_setup = v22.antiaim.features:switch("\v\f<stars>  \rDefensive setup", false, nil, function(v580)
            -- upvalues: l_v578_0 (ref), v554 (ref)
            local v581 = {
                safety = v580:selectable("Safety", "While peek", "On low-pingers", "Safe condition", "On grenade", "Remove modifier", "On Use"), 
                condition = v580:combo("Condition", l_v578_0:get_names())
            };
            for _, v583 in ipairs(l_v578_0:get_names()) do
                do
                    local l_v583_0 = v583;
                    local function v586(v585)
                        -- upvalues: l_v583_0 (ref)
                        return l_v583_0 .. v585;
                    end;
                    v581[v586("enable")] = v580:switch("Enable\a[invis]" .. l_v583_0);
                    v581[v586("min_max")] = v580:switch("Use Min\\Max\a[invis]" .. l_v583_0);
                    v581[v586("pitch")] = v580:combo("\v\226\128\186  \rPitch\a[invis]" .. l_v583_0, v554.pitch.names);
                    v581[v586("pitch_speed")] = v580:slider("\v\226\128\186  \rSpeed\n\a[invis]" .. l_v583_0, 0, 200, 15, 1, "ms");
                    v581[v586("pitch_offset")] = v580:slider("\v\226\128\186  \rOffset\n\a[invis]" .. l_v583_0, -89, 89);
                    v581[v586("pitch_offset_min")] = v580:slider("\v\226\128\186  \rOffset Min\n\a[invis]" .. l_v583_0, -89, 89);
                    v581[v586("pitch_offset_max")] = v580:slider("\v\226\128\186  \rOffset Max\n\a[invis]" .. l_v583_0, -89, 89);
                    v581[v586("yaw")] = v580:combo("\v\226\128\186  \rYaw\a[invis]" .. l_v583_0, v554.yaw.names);
                    v581[v586("yaw_speed")] = v580:slider("\v\226\128\186  \rSpeed\a[invis]" .. l_v583_0, 0, 200, 15, 1, "ms");
                    v581[v586("yaw_offset")] = v580:slider("\v\226\128\186  \rOffset\a[invis]" .. l_v583_0, -180, 180);
                    v581[v586("yaw_offset_min")] = v580:slider("\v\226\128\186  \rOffset Min\a[invis]" .. l_v583_0, -180, 180);
                    v581[v586("yaw_offset_max")] = v580:slider("\v\226\128\186  \rOffset Max\a[invis]" .. l_v583_0, -180, 180);
                    do
                        local l_v586_0 = v586;
                        local function v590(v588)
                            -- upvalues: v581 (ref), l_v586_0 (ref)
                            return function(...)
                                -- upvalues: v581 (ref), l_v586_0 (ref), v588 (ref)
                                local l_value_1 = v581[l_v586_0("min_max")].value;
                                if l_value_1 and v581[l_v586_0(v588)].value == "Static" then
                                    return false;
                                else
                                    return l_value_1;
                                end;
                            end;
                        end;
                        local function v592(v591)
                            -- upvalues: v581 (ref), l_v586_0 (ref)
                            return function(...)
                                -- upvalues: v581 (ref), l_v586_0 (ref), v591 (ref)
                                return v581[l_v586_0(v591)].value == "Static" or not v581[l_v586_0("min_max")].value;
                            end;
                        end;
                        v581[l_v586_0("pitch_speed")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, v581[l_v586_0("enable")], {
                            [1] = nil, 
                            [2] = "Linear", 
                            [1] = v581[l_v586_0("pitch")]
                        });
                        v581[l_v586_0("yaw_speed")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, v581[l_v586_0("enable")], {
                            [1] = nil, 
                            [2] = "Spin", 
                            [3] = "Linear", 
                            [1] = v581[l_v586_0("yaw")]
                        });
                        v581[l_v586_0("enable")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        });
                        v581[l_v586_0("min_max")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, v581[l_v586_0("enable")]);
                        v581[l_v586_0("yaw")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, v581[l_v586_0("enable")]);
                        v581[l_v586_0("pitch")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, v581[l_v586_0("enable")]);
                        v581[l_v586_0("yaw_offset")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("yaw")]
                        }, v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v592("yaw")
                        });
                        v581[l_v586_0("yaw_offset_min")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("yaw")]
                        }, v581[l_v586_0("enable")], v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v590("yaw")
                        });
                        v581[l_v586_0("yaw_offset_max")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("yaw")]
                        }, v581[l_v586_0("enable")], v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v590("yaw")
                        });
                        v581[l_v586_0("pitch_offset")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("pitch")]
                        }, v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v592("pitch")
                        });
                        v581[l_v586_0("pitch_offset_min")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("pitch")]
                        }, v581[l_v586_0("enable")], v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v590("pitch")
                        });
                        v581[l_v586_0("pitch_offset_max")]:depend({
                            [1] = v581.condition, 
                            [2] = l_v583_0
                        }, {
                            [1] = nil, 
                            [2] = "None", 
                            [3] = true, 
                            [1] = v581[l_v586_0("pitch")]
                        }, v581[l_v586_0("enable")], v581[l_v586_0("enable")], {
                            v581[l_v586_0("min_max")], 
                            v590("pitch")
                        });
                    end;
                end;
            end;
            return v581, true;
        end);
        l_v461_2.states.defensive_setup:depend({
            [1] = nil, 
            [2] = "Custom", 
            [1] = l_v461_2.menu.preset
        });
        local v593 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
        local v594 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
        local v595 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
        local function v599()
            local v596 = entity.get_threat();
            if not v596 then
                return;
            elseif v596:is_bot() then
                return;
            else
                local v597 = v596:get_resource();
                if not v597 then
                    return;
                else
                    local l_m_iPing_0 = v597.m_iPing;
                    if not l_m_iPing_0 then
                        return;
                    else
                        return l_m_iPing_0 < 30;
                    end;
                end;
            end;
        end;
        local function v627(_, _)
            -- upvalues: v594 (ref), v595 (ref), v593 (ref), l_v461_2 (ref), l_v578_0 (ref), l_v473_0 (ref), v599 (ref), v460 (ref), v554 (ref), v555 (ref)
            v594:override();
            v595:override();
            v593:override();
            local v602 = entity.get_local_player();
            if not v602 then
                return;
            elseif not v602:get_anim_state() then
                return;
            else
                local l_defensive_setup_0 = l_v461_2.states.defensive_setup;
                if not l_defensive_setup_0.value then
                    return;
                else
                    local v604 = l_v578_0:get_active_state(v602);
                    if not v604 then
                        return;
                    else
                        local function v606(v605)
                            -- upvalues: v604 (ref)
                            return v604 .. v605;
                        end;
                        if l_defensive_setup_0[v606("enable")] and l_defensive_setup_0[v606("enable")].value then
                            v594:override("always on");
                            v595:override("break lc");
                        end;
                        local function v609()
                            -- upvalues: v602 (ref)
                            local v607 = v602:get_player_weapon();
                            if not v607 then
                                return;
                            else
                                local v608 = v607:get_weapon_info();
                                if not v608 then
                                    return;
                                else
                                    return v608.weapon_type == 9;
                                end;
                            end;
                        end;
                        local v610 = l_defensive_setup_0.safety:get(4) and v609();
                        local v611 = l_defensive_setup_0.safety:get(3) and l_v473_0 ~= nil and l_v473_0 == "Safe";
                        local v612 = l_defensive_setup_0.safety:get(2) and v599();
                        local v613 = (v594:get_override() or v594:get()) == "Always On" or (v595:get_override() or v595:get()) == "Break LC";
                        local v614 = l_defensive_setup_0.safety:get(6) and v460.on_use;
                        local v615 = not v612 and not v611 and not v610 and not v614;
                        if l_defensive_setup_0.safety:get(1) then
                            v593:override(v613 and v615);
                        else
                            v593:override(v615);
                        end;
                        local function v617(v616)
                            -- upvalues: l_defensive_setup_0 (ref), v606 (ref)
                            return l_defensive_setup_0[v606(v616)].value;
                        end;
                        local v618 = v617("yaw");
                        local v619 = v554.yaw.callbacks[v618];
                        if v619 then
                            local v620 = v617("min_max");
                            local v621 = v617("yaw_speed");
                            local v622 = v619(v620, v617("yaw_offset"), v617("yaw_offset_min"), v617("yaw_offset_max"), v621 * 0.01);
                            local v623 = l_defensive_setup_0.safety:get(5) and v555.modifier or 0;
                            rage.antiaim:override_hidden_yaw_offset(v623 - v622);
                        end;
                        v618 = v617("pitch");
                        v619 = v554.pitch.callbacks[v618];
                        if v619 then
                            local v624 = v617("min_max");
                            local v625 = v617("pitch_speed");
                            local v626 = v619(v624, v617("pitch_offset"), v617("pitch_offset_min"), v617("pitch_offset_max"), v625 * 0.01);
                            rage.antiaim:override_hidden_pitch(v626);
                        end;
                        return;
                    end;
                end;
            end;
        end;
        events.createmove(v627);
    end;
    local v628 = {};
    v628.export = function()
        -- upvalues: l_base64_0 (ref), v628 (ref)
        local _, l_result_1 = pcall(function()
            -- upvalues: l_base64_0 (ref), v628 (ref)
            return string.format("warpaith.lua>>%s<<", l_base64_0.encode(msgpack.pack(v628.package:save())));
        end);
        return l_result_1;
    end;
    v628.import = function(v631)
        -- upvalues: v628 (ref), l_base64_0 (ref)
        local _ = pcall(function()
            -- upvalues: v628 (ref), l_base64_0 (ref), v631 (ref)
            v628.package:load(msgpack.unpack(l_base64_0.decode(v631:match("warpaith.lua>>(.-)<<"))));
        end);
    end;
    l_v461_2.menu.preset._export:set_callback(function()
        -- upvalues: l_clipboard_0 (ref), v628 (ref)
        l_clipboard_0.set(v628.export());
    end);
    l_v461_2.menu.preset._import:set_callback(function()
        -- upvalues: v628 (ref), l_clipboard_0 (ref)
        v628.import(l_clipboard_0.get());
    end);
    v578 = {};
    local v633 = {};
    local v634 = {
        [1] = "Custom"
    };
    do
        local l_v633_0, l_v634_0 = v633, v634;
        v578.new = function(v637, v638, v639)
            -- upvalues: v427 (ref), l_v634_0 (ref), l_v633_0 (ref)
            v427.insert(l_v634_0, v637);
            l_v633_0[v637] = {
                preset = v639, 
                description = v638
            };
        end;
        local v640 = nil;
        local v641 = nil;
        v578.update = function()
            -- upvalues: l_v461_2 (ref), l_v633_0 (ref), v641 (ref), v640 (ref), v628 (ref)
            local v642 = l_v461_2.menu.preset:get();
            local v643 = l_v633_0[v642] and l_v633_0[v642].preset or nil;
            local v644 = l_v633_0[v642] and l_v633_0[v642].description or "";
            l_v461_2.menu.preset_log:visibility(l_v633_0[v642] ~= nil);
            l_v461_2.menu.preset_log:name(v644);
            if v641 == "Custom" then
                v640 = v628.export();
            end;
            if v643 ~= nil and v642 ~= "Custom" then
                v628.import(v643);
            else
                v628.import(v640);
            end;
            v641 = v642;
        end;
        v578.new("\240\159\154\185 Default", "You are using \240\159\154\185 Default preset.\nEverything is already set up.", "warpaith.lua>>jKNSdW7eABOobGVmdF9tYXhkpHdheXMDpmVuYWJsZcOpZnJlZXN0YW5ko09mZqZvZmZzZXQAqG1vZGlmaWVyplJhbmRvbadvcHRpb25zkqZKaXR0ZXKhfqtkZWxheV90aWNrcwWmZGVzeW5jw6RsZWZ0OqlyaWdodF9tYXhkqmRlZ3JlZV9taW7xqmRlbGF5X3R5cGWmQ3VzdG9tqmRlZ3JlZV9tYXgPp35vZmZzZXSCqGFkZF9sZWZ04alhZGRfcmlnaHQgp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUDpXJpZ2h0Oql+bW9kaWZpZXKBp21pbl9tYXjDpmRlZ3JlZdDfpVN0YW5k3gATqGxlZnRfbWF4XaR3YXlzBaZlbmFibGXDqWZyZWVzdGFuZKlQZWVrIEZha2Wmb2Zmc2V0AKhtb2RpZmllcqZPZmZzZXSnb3B0aW9uc5SmSml0dGVyrUF2b2lkIE92ZXJsYXCvQW50aSBCcnV0ZWZvcmNloX6rZGVsYXlfdGlja3MCpmRlc3luY8OkbGVmdDqpcmlnaHRfbWF4EKpkZWdyZWVfbWluAKpkZWxheV90eXBlpkN1c3RvbapkZWdyZWVfbWF4AKd+b2Zmc2V0gqhhZGRfbGVmdPepYWRkX3JpZ2h0Dqd+ZGVzeW5jgqZzd2l0Y2glpXN0eWxlA6VyaWdodDqpfm1vZGlmaWVygadtaW5fbWF4wqZkZWdyZWX5pkdsb2JhbN4AEqhsZWZ0X21heGSkd2F5cwOpcmlnaHRfbWF4ZKlmcmVlc3RhbmSjT2ZmqmRlbGF5X3R5cGWjT2ZmqG1vZGlmaWVyqERpc2FibGVkp29wdGlvbnOSpkppdHRlcqF+q2RlbGF5X3RpY2tzAqRsZWZ0OqZkZXN5bmPDpXJpZ2h0Oql+bW9kaWZpZXKBp21pbl9tYXjCqmRlZ3JlZV9tYXgAp35vZmZzZXSCqGFkZF9sZWZ0AKlhZGRfcmlnaHQAp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUBpmRlZ3JlZQCmb2Zmc2V0AKpkZWdyZWVfbWluAKNBaXLeABOobGVmdF9tYXhkpHdheXMDpmVuYWJsZcOpZnJlZXN0YW5ko09mZqZvZmZzZXQAqG1vZGlmaWVypkNlbnRlcqdvcHRpb25zk6ZKaXR0ZXKvQW50aSBCcnV0ZWZvcmNloX6rZGVsYXlfdGlja3MFpmRlc3luY8OkbGVmdDqpcmlnaHRfbWF4ZKpkZWdyZWVfbWluAKpkZWxheV90eXBlpkN1c3RvbapkZWdyZWVfbWF4AKd+b2Zmc2V0gqhhZGRfbGVmdPOpYWRkX3JpZ2h0BKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlAaVyaWdodDqpfm1vZGlmaWVygadtaW5fbWF4wqZkZWdyZWXmr2RlZmVuc2l2ZV9zZXR1cMOjVXNl3gATqGxlZnRfbWF4ZKR3YXlzA6ZlbmFibGXDqWZyZWVzdGFuZKlQZWVrIFJlYWymb2Zmc2V0AKhtb2RpZmllcqZSYW5kb22nb3B0aW9uc5OtQXZvaWQgT3ZlcmxhcK9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwSmZGVzeW5jw6RsZWZ0OqlyaWdodF9tYXhkqmRlZ3JlZV9taW4AqmRlbGF5X3R5cGWkU29mdKpkZWdyZWVfbWF4AKd+b2Zmc2V0gqhhZGRfbGVmdACpYWRkX3JpZ2h0AKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlA6VyaWdodDqpfm1vZGlmaWVygadtaW5fbWF4wqZkZWdyZWX5sH5kZWZlbnNpdmVfc2V0dXDeAEq0V2Fsa3BpdGNoX29mZnNldF9taW7Qp6xTdGFuZG1pbl9tYXjCtkNyb3VjaHBpdGNoX29mZnNldF9tYXjQp7VTdGFuZHBpdGNoX29mZnNldF9taW7Qp7VTdGFuZHBpdGNoX29mZnNldF9tYXjQp7RDcm91Y2h5YXdfb2Zmc2V0X21pbtH/TLRDcm91Y2h5YXdfb2Zmc2V0X21heMy0qWNvbmRpdGlvbqNBaXKxQWlyIENyb3VjaG1pbl9tYXjDs1N0YW5keWF3X29mZnNldF9taW7R/0yzU3RhbmR5YXdfb2Zmc2V0X21heNH/TLNBaXJwaXRjaF9vZmZzZXRfbWlu0KezQWlycGl0Y2hfb2Zmc2V0X21heNCnrUNyb3VjaG1pbl9tYXjDukFpciBDcm91Y2hwaXRjaF9vZmZzZXRfbWF40KexQWlyeWF3X29mZnNldF9taW7R/2yxQWlyeWF3X29mZnNldF9tYXjMnrRXYWxrcGl0Y2hfb2Zmc2V0X21heA+4QWlyIENyb3VjaHlhd19vZmZzZXRfbWF4zLSqUnVubWluX21heMKyV2Fsa3lhd19vZmZzZXRfbWF4zLSyV2Fsa3lhd19vZmZzZXRfbWlu0f9csVJ1bnlhd19vZmZzZXRfbWlu0f9Mq1dhbGttaW5fbWF4w7hBaXIgQ3JvdWNoeWF3X29mZnNldF9taW7R/0yzUnVucGl0Y2hfb2Zmc2V0X21pbtCntkNyb3VjaHBpdGNoX29mZnNldF9taW7Qp7pBaXIgQ3JvdWNocGl0Y2hfb2Zmc2V0X21pbtCns1J1bnBpdGNoX29mZnNldF9tYXjQp7FSdW55YXdfb2Zmc2V0X21heNH/TK5SdW5waXRjaF9zcGVlZA+wU3RhbmRwaXRjaF9zcGVlZA+mQWlyeWF3pFNwaW6oUnVucGl0Y2imU3RhdGljtUFpciBDcm91Y2hwaXRjaF9zcGVlZA+wV2Fsa3BpdGNoX29mZnNldNCsr0FpcnBpdGNoX29mZnNldPSrQ3JvdWNocGl0Y2imU3RhdGljr0Nyb3VjaHlhd19zcGVlZBWtQWlyIENyb3VjaHlhd6RTcGluqVJ1bmVuYWJsZcKpV2Fsa3BpdGNopkxpbmVhcqhTdGFuZHlhd6ZTd2l0Y2itQWlyeWF3X29mZnNldMyerVdhbGt5YXdfc3BlZWQVsEFpciBDcm91Y2hlbmFibGXDrkFpcnBpdGNoX3NwZWVkzMixU3RhbmRwaXRjaF9vZmZzZXRZqldhbGtlbmFibGXDqUFpcmVuYWJsZcOsQ3JvdWNoZW5hYmxlw6ZSdW55YXekTm9uZbRBaXIgQ3JvdWNoeWF3X29mZnNldMy0qlN0YW5kcGl0Y2imU3RhdGljq1N0YW5kZW5hYmxlw69SdW5waXRjaF9vZmZzZXRZqEFpcnBpdGNoplN0YXRpY69BaXIgQ3JvdWNocGl0Y2imU3RhdGljrlN0YW5keWF3X3NwZWVkD69XYWxrcGl0Y2hfc3BlZWQOsENyb3VjaHlhd19vZmZzZXTMtKlDcm91Y2h5YXekU3BpbqxSdW55YXdfc3BlZWQSr1N0YW5keWF3X29mZnNldEKnV2Fsa3lhd6RTcGlurEFpcnlhd19zcGVlZAeuV2Fsa3lhd19vZmZzZXTMtLZBaXIgQ3JvdWNocGl0Y2hfb2Zmc2V00KeyQ3JvdWNocGl0Y2hfb2Zmc2V00N6zQWlyIENyb3VjaHlhd19zcGVlZBStUnVueWF3X29mZnNldACxQ3JvdWNocGl0Y2hfc3BlZWQPpnNhZmV0eZaqV2hpbGUgcGVla65TYWZlIGNvbmRpdGlvbqpPbiBncmVuYWRlr1JlbW92ZSBtb2RpZmllcqZPbiBVc2WhfqpBaXJtaW5fbWF4w65hdm9pZF9iYWNrc3RhYsOkQWlyK94AE6hsZWZ0X21heGSkd2F5cwOmZW5hYmxlw6lmcmVlc3RhbmSjT2Zmpm9mZnNldACobW9kaWZpZXKmQ2VudGVyp29wdGlvbnOTpkppdHRlcq9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwKmZGVzeW5jw6RsZWZ0OqlyaWdodF9tYXhkqmRlZ3JlZV9taW4AqmRlbGF5X3R5cGWjT2ZmqmRlZ3JlZV9tYXgAp35vZmZzZXSCqGFkZF9sZWZ0B6lhZGRfcmlnaHQHp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUDpXJpZ2h0Oql+bW9kaWZpZXKBp21pbl9tYXjCpmRlZ3JlZeWkRHVja94AE6hsZWZ0X21heGSkd2F5cwOmZW5hYmxlw6lmcmVlc3RhbmSjT2Zmpm9mZnNldACobW9kaWZpZXKmQ2VudGVyp29wdGlvbnOTpkppdHRlcq9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwOmZGVzeW5jw6RsZWZ0OqlyaWdodF9tYXhkqmRlZ3JlZV9taW4AqmRlbGF5X3R5cGWlUmlnaWSqZGVncmVlX21heACnfm9mZnNldIKoYWRkX2xlZnT0qWFkZF9yaWdodAynfmRlc3luY4Kmc3dpdGNoOqVzdHlsZQOlcmlnaHQ6qX5tb2RpZmllcoGnbWluX21heMKmZGVncmVl+6RTYWZl3gAUqGxlZnRfbWF4AKR3YXlzA6ZlbmFibGXDp35lbmFibGWCpHpldXPCpWtuaWZlw6ZvZmZzZXQAqG1vZGlmaWVyqERpc2FibGVkp29wdGlvbnOSr0FudGkgQnJ1dGVmb3JjZaF+q2RlbGF5X3RpY2tzAql+bW9kaWZpZXKBp21pbl9tYXjCqXJpZ2h0X21heACkbGVmdACqZGVsYXlfdHlwZaNPZmaqZGVncmVlX21pbgCmZGVzeW5jw6pkZWdyZWVfbWF4AKd+b2Zmc2V0gqhhZGRfbGVmdACpYWRkX3JpZ2h0AKd+ZGVzeW5jgqZzd2l0Y2g6pXN0eWxlA6VyaWdodACpZnJlZXN0YW5ko09mZqZkZWdyZWUAqVNsb3cgV2Fsa94AE6hsZWZ0X21heGSkd2F5cwOmZW5hYmxlw6lmcmVlc3RhbmSjT2Zmpm9mZnNldACobW9kaWZpZXKmUmFuZG9tp29wdGlvbnOTpkppdHRlcq9BbnRpIEJydXRlZm9yY2WhfqtkZWxheV90aWNrcwKmZGVzeW5jw6RsZWZ0OqlyaWdodF9tYXhkqmRlZ3JlZV9taW4AqmRlbGF5X3R5cGWmQ3VzdG9tqmRlZ3JlZV9tYXgAp35vZmZzZXSCqGFkZF9sZWZ08KlhZGRfcmlnaHQTp35kZXN5bmOCpnN3aXRjaDqlc3R5bGUDpXJpZ2h0Oql+bW9kaWZpZXKBp21pbl9tYXjCpmRlZ3JlZe0=<<");
        l_v461_2.menu.preset:update(l_v634_0);
        l_v461_2.menu.preset:set_callback(v578.update, true);
    end;
    v460.init_conditions = function()
        -- upvalues: l_v461_2 (ref), v125 (ref), v22 (ref)
        for _, v646 in pairs(l_v461_2.names) do
            local v647 = v125.create(v22.antiaim.general.par:name(), v646 .. " - yaw", 2);
            local v648 = v125.create(v22.antiaim.general.par:name(), v646 .. " - desync", 2);
            local v649 = v125.create(v22.antiaim.general.par:name(), v646 .. " - extra", 2);
            do
                local l_v646_0 = v646;
                l_v461_2.states[l_v646_0] = {
                    enable = l_v461_2.callbacks[l_v646_0] ~= nil and v647:switch("Enable", false, nil, function(v651)
                        -- upvalues: l_v646_0 (ref)
                        local v652 = {};
                        if l_v646_0 == "Safe" then
                            v652.zeus = v651:switch("\v\f<bolt>   \rTaser");
                            v652.knife = v651:switch("\v\f<knife-kitchen>  \rKnife");
                        end;
                        return v652, true;
                    end) or nil, 
                    offset = v647:slider("Offset", -180, 180, 0, 1, nil, function(v653)
                        return {
                            add_left = v653:slider("Add left", -180, 180, 0), 
                            add_right = v653:slider("Add right", -180, 180, 0)
                        };
                    end), 
                    modifier = v647:combo("Modifier", {
                        [1] = "Disabled", 
                        [2] = "Center", 
                        [3] = "Offset", 
                        [4] = "Random", 
                        [5] = "Spin", 
                        [6] = "X-Ways"
                    }, nil, function(v654)
                        return {
                            min_max = v654:switch("Min \\ Max Degree")
                        };
                    end), 
                    ways = v647:slider("Ways", 3, 9, 3), 
                    degree = v647:slider("Degree", -180, 180, 0), 
                    degree_min = v647:slider("Degree Min", -180, 180, 0), 
                    degree_max = v647:slider("Degree Max", -180, 180, 0), 
                    desync = v648:switch("Desync", false, nil, function(v655)
                        return {
                            style = v655:list("", {
                                [1] = "Default", 
                                [2] = "Switch", 
                                [3] = "Adaptive"
                            }), 
                            switch = v655:slider("Switch", 0, 58, 58)
                        }, true;
                    end), 
                    left = v648:slider("Left limit", 0, 58, 58), 
                    right = v648:slider("Right limit", 0, 58, 58), 
                    left_max = v648:slider("Left max", 0, 100, 100, 1, function(v656)
                        return v656 == 100 and "max" or v656 == 0 and "min" or string.format("%s%%", v656);
                    end), 
                    right_max = v648:slider("Right max", 0, 100, 100, 1, function(v657)
                        return v657 == 100 and "max" or v657 == 0 and "min" or string.format("%s%%", v657);
                    end), 
                    options = v648:selectable("Options", {
                        [1] = "Jitter", 
                        [2] = "Avoid Overlap", 
                        [3] = "Anti Bruteforce"
                    }), 
                    freestand = v648:combo("Freestanding", {
                        [1] = "Off", 
                        [2] = "Peek Real", 
                        [3] = "Peek Fake"
                    }), 
                    delay_type = v649:combo("Delay type", {
                        [1] = "Off", 
                        [2] = "Soft", 
                        [3] = "Rigid", 
                        [4] = "Custom"
                    }), 
                    delay_ticks = v649:slider("Ticks", 1, 16, 2, 1, "t")
                };
                local v658 = {
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = l_v461_2.menu.preset
                };
                local v659 = {
                    [1] = l_v461_2.menu.condition, 
                    [2] = l_v646_0
                };
                local v660 = l_v461_2.callbacks[l_v646_0] ~= nil and {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].enable
                } or nil;
                if l_v461_2.callbacks[l_v646_0] ~= nil then
                    l_v461_2.states[l_v646_0].enable:depend(v658, v659);
                end;
                local v661 = {
                    [1] = v658, 
                    [2] = v659, 
                    [3] = v660
                };
                l_v461_2.states[l_v646_0].offset:depend(unpack(v661));
                l_v461_2.states[l_v646_0].modifier:depend(unpack(v661));
                l_v461_2.states[l_v646_0].modifier.min_max:depend({
                    [1] = nil, 
                    [2] = "Disabled", 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier
                }, unpack(v661));
                l_v461_2.states[l_v646_0].ways:depend({
                    [1] = nil, 
                    [2] = "X-Ways", 
                    [1] = l_v461_2.states[l_v646_0].modifier
                }, unpack(v661));
                l_v461_2.states[l_v646_0].degree:depend({
                    [1] = nil, 
                    [2] = "Disabled", 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier
                }, {
                    [1] = nil, 
                    [2] = false, 
                    [1] = l_v461_2.states[l_v646_0].modifier.min_max
                }, unpack(v661));
                l_v461_2.states[l_v646_0].degree_min:depend({
                    [1] = nil, 
                    [2] = "Disabled", 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier.min_max
                }, unpack(v661));
                l_v461_2.states[l_v646_0].degree_max:depend({
                    [1] = nil, 
                    [2] = "Disabled", 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier
                }, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].modifier.min_max
                }, unpack(v661));
                l_v461_2.states[l_v646_0].desync:depend(unpack(v661));
                l_v461_2.states[l_v646_0].options:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, unpack(v661));
                l_v461_2.states[l_v646_0].freestand:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, unpack(v661));
                l_v461_2.states[l_v646_0].left:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, {
                    [1] = nil, 
                    [2] = 3, 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync.style
                }, unpack(v661));
                l_v461_2.states[l_v646_0].right:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, {
                    [1] = nil, 
                    [2] = 3, 
                    [3] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync.style
                }, unpack(v661));
                l_v461_2.states[l_v646_0].left_max:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, {
                    [1] = nil, 
                    [2] = 3, 
                    [1] = l_v461_2.states[l_v646_0].desync.style
                }, unpack(v661));
                l_v461_2.states[l_v646_0].right_max:depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_v461_2.states[l_v646_0].desync
                }, {
                    [1] = nil, 
                    [2] = 3, 
                    [1] = l_v461_2.states[l_v646_0].desync.style
                }, unpack(v661));
                l_v461_2.states[l_v646_0].desync.switch:depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = l_v461_2.states[l_v646_0].desync.style
                });
                l_v461_2.states[l_v646_0].delay_type:depend(unpack(v661));
                l_v461_2.states[l_v646_0].delay_ticks:depend({
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = l_v461_2.states[l_v646_0].delay_type
                }, unpack(v661));
            end;
        end;
    end;
    v460.new_condition = function(v662, v663)
        -- upvalues: v427 (ref), l_v461_2 (ref)
        v427.insert(l_v461_2.names, v662);
        l_v461_2.callbacks[v662] = v663;
    end;
    l_v461_2.global_state_name = "Global";
    v460.create_conditions = function()
        -- upvalues: v460 (ref), l_v461_2 (ref)
        v460.new_condition(l_v461_2.global_state_name);
        v460.new_condition("Use", function(_)
            -- upvalues: l_v461_2 (ref)
            return l_v461_2.on_use;
        end);
        v460.new_condition("Safe", function(v665)
            -- upvalues: l_v461_2 (ref)
            if l_v461_2.states.Safe == nil or l_v461_2.states.Safe.enable == nil then
                return;
            else
                local l_enable_0 = l_v461_2.states.Safe.enable;
                local v667 = v665:get_player_weapon();
                local v668 = l_enable_0.zeus.value and v667 ~= nil and v667:get_classname() == "CWeaponTaser";
                local v669 = l_enable_0.knife.value and v667 ~= nil and v667:get_classname() == "CKnife";
                return v668 or v669;
            end;
        end);
        v460.new_condition("Stand", function(v670, v671)
            local v672 = v670:get_anim_state();
            local v673;
            if v672.velocity:length() >= 2 or v671.in_jump or not v672.on_ground or v672.anim_duck_amount >= 0.7 then
                v673 = false;
            else
                v673 = true;
            end;
            return v673;
        end);
        v460.new_condition("Air+", function(v674, v675)
            local v676 = v674:get_anim_state();
            return v676.anim_duck_amount > 0.7 and (v675.in_jump or not v676.on_ground);
        end);
        v460.new_condition("Air", function(v677, v678)
            local v679 = v677:get_anim_state();
            return v678.in_jump or not v679.on_ground;
        end);
        v460.new_condition("Duck", function(v680, v681)
            local v682 = v680:get_anim_state();
            return v682.anim_duck_amount > 0.7 and not v681.in_jump and not not v682.on_ground;
        end);
        local v683 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
        v460.new_condition("Run", function(v684, v685)
            -- upvalues: v683 (ref)
            local v686 = v684:get_anim_state();
            local v687;
            if v686.velocity:length() > 2 and not v685.in_jump and not not v686.on_ground then
                v687 = not v683:get();
            else
                v687 = false;
            end;
            return v687;
        end);
        v460.new_condition("Slow Walk", function(v688, v689)
            -- upvalues: v683 (ref)
            local v690 = v688:get_anim_state();
            return v683:get() and not v689.in_jump and not not v690.on_ground;
        end);
    end;
    v460.create_conditions();
    l_v461_2.menu.condition = v22.antiaim.general:combo("\v\f<person-walking>   \rCondition", l_v461_2.names):depend({
        [1] = nil, 
        [2] = "Custom", 
        [1] = l_v461_2.menu.preset
    });
    l_v461_2.menu.options = v22.antiaim.general:label("\v\f<gear>  \rOptions", nil, function(v691)
        return {
            view_base = v691:combo("View", "At target", "Local view"), 
            manual = v691:combo("Manual", "Disable", "Backward", "Forward", "Left", "Right", "Freestand"), 
            static = v691:switch("Static on manual")
        };
    end);
    v460.init_conditions();
    v460.validate_on_use = function()
        -- upvalues: v427 (ref)
        local v692 = entity.get_local_player();
        if v692 == nil then
            return;
        else
            local v693 = v692:get_player_weapon();
            if v693 == nil then
                return;
            elseif v693:get_classname() == "CC4" then
                return true;
            else
                local v694 = render.camera_angles();
                local v695 = vector():angles(v694);
                local v696 = v692:get_eye_position();
                local v697 = utils.trace_line(v696, v696 + v695 * 200, v692, 1174421515);
                if v697.entity ~= nil then
                    local v698 = string.lower(v697.entity:get_classname());
                    if v698:match("weapon") or v698:match("deagle") or v698:match("door") then
                        return true;
                    end;
                end;
                if v692.m_iTeamNum ~= 3 then
                    return false;
                else
                    local v699 = {
                        [1] = 1337
                    };
                    entity.get_entities("CHostage", false, function(v700)
                        -- upvalues: v427 (ref), v699 (ref), v696 (ref)
                        if v700.m_nHostageState ~= 3 then
                            v427.insert(v699, v700.m_vecOrigin:dist(v696));
                        end;
                    end);
                    entity.get_entities("CPlantedC4", false, function(v701)
                        -- upvalues: v427 (ref), v699 (ref), v696 (ref)
                        v427.insert(v699, v701.m_vecOrigin:dist(v696));
                    end);
                    if math.min(unpack(v699)) < 125 then
                        return true;
                    else
                        return false;
                    end;
                end;
            end;
        end;
    end;
    v460.allow_on_use = function(v702)
        -- upvalues: l_v461_2 (ref), l_v477_0 (ref)
        l_v461_2.on_use = l_v461_2.menu.allow_on_use.value and not l_v461_2.validate_on_use() and v702.in_use;
        if l_v461_2.on_use then
            v702.in_use = not v702.in_use;
            l_v477_0:override(false);
        end;
    end;
    v460.connect_elements = function(v703)
        -- upvalues: l_v475_0 (ref), l_v461_2 (ref), v459 (ref), l_v477_0 (ref), l_v485_0 (ref), l_v497_0 (ref), v429 (ref), v555 (ref), l_v476_0 (ref), v427 (ref)
        local function v706(v704, v705)
            -- upvalues: l_v475_0 (ref)
            l_v475_0[v704]:override(v705());
        end;
        local function v709(v707, v708)
            -- upvalues: l_v461_2 (ref), v703 (ref)
            if v708 then
                return l_v461_2.states[v703][v707][v708].value;
            else
                return l_v461_2.states[v703][v707].value;
            end;
        end;
        local v710 = 0;
        local v711 = {
            Soft = 2, 
            Rigid = math.random(4), 
            Custom = v709("delay_ticks")
        };
        local v712 = v709("delay_type");
        if v711[v712] then
            v710 = v711[v712];
        end;
        v711 = v459(v710);
        v706("enabled", function()
            -- upvalues: l_v461_2 (ref)
            if l_v461_2.menu.warmup_disabler.value and entity.get_game_rules().m_bWarmupPeriod == true then
                return false;
            else
                return true;
            end;
        end);
        v706("avoid backstab", function()
            -- upvalues: l_v461_2 (ref)
            return l_v461_2.states.avoid_backstab.value;
        end);
        v706("yaw", function()
            return "backward";
        end);
        v706("pitch", function()
            -- upvalues: l_v461_2 (ref)
            return l_v461_2.on_use and "disabled" or "down";
        end);
        v712 = l_v461_2.menu.options.manual.value;
        v706("base", function()
            -- upvalues: l_v461_2 (ref), v712 (ref)
            if l_v461_2.on_use or v712 == "Left" or v712 == "Right" then
                return "local view";
            else
                return l_v461_2.menu.options.view_base.value;
            end;
        end);
        v706("yaw offset", function()
            -- upvalues: l_v477_0 (ref), v709 (ref), v711 (ref), l_v485_0 (ref), l_v497_0 (ref), v429 (ref), v555 (ref), l_v461_2 (ref), v712 (ref), l_v476_0 (ref)
            l_v477_0:override();
            local v713 = {};
            local function v716(v714, v715)
                -- upvalues: v713 (ref)
                v713[v714] = type(v715) == "function" and v715() or v715;
            end;
            l_v477_0:override();
            local v717 = v709("offset");
            local v718 = v709("offset", "add_left");
            local v719 = v709("offset", "add_right");
            v717 = v717 + (rage.antiaim:inverter() and v718 or v719);
            local v720 = v709("degree");
            local v721 = v709("modifier", "min_max") and v709("degree_min") or v720;
            local v722 = v709("modifier", "min_max") and v709("degree_max") or -v720;
            v716("Center", v711 and v721 or v722);
            v716("Offset", function()
                -- upvalues: v721 (ref), v709 (ref), v722 (ref), v711 (ref)
                local l_v721_0 = v721;
                local v724 = v709("modifier", "min_max") and v722 or 0;
                return v711 and l_v721_0 or v724;
            end);
            v716("Random", math.random(v722, v721));
            v716("Spin", l_v485_0(0.5, v721, v722));
            v716("X-Ways", function()
                -- upvalues: l_v497_0 (ref), v709 (ref), v721 (ref), v722 (ref), v429 (ref)
                local v725 = l_v497_0(v709("ways"), v721, v722);
                return v725[v429(#v725)];
            end);
            v555.modifier = v717 + (v713[v709("modifier")] or 0);
            if l_v461_2.on_use then
                return 180 + v717 + v555.modifier;
            elseif v712 == "Left" or v712 == "Right" then
                l_v477_0:override(false);
                return l_v476_0[v712];
            else
                if v712 == "Freestand" then
                    l_v477_0:override(true);
                end;
                return l_v476_0[v712] + v555.modifier;
            end;
        end);
        if l_v461_2.menu.options.static.value and (v712 == "Left" or v712 == "Right" or v712 == "Freestand" or l_v477_0:get_override() or l_v477_0:get()) then
            l_v477_0.YAW:override(true);
            l_v477_0.BODY:override(true);
        end;
        local v726 = l_v461_2.menu.options.static.value and (v712 == "Left" or v712 == "Right");
        v706("yaw modifier", function()
            return "Disabled";
        end);
        v706("modifier degree", function()
            return 0;
        end);
        v706("body yaw", function()
            -- upvalues: v709 (ref)
            return v709("desync");
        end);
        v706("left limit", function()
            -- upvalues: v709 (ref)
            if v709("desync", "style") == 2 then
                return globals.tickcount % 4 > 1 and v709("left") or v709("desync", "switch");
            elseif v709("desync", "style") == 3 then
                return rage.antiaim:get_max_desync() * (v709("left_max") / 100);
            else
                return v709("left");
            end;
        end);
        v706("right limit", function()
            -- upvalues: v709 (ref)
            if v709("desync", "style") == 2 then
                return globals.tickcount % 4 > 1 and v709("right") or v709("desync", "switch");
            elseif v709("desync", "style") == 3 then
                return rage.antiaim:get_max_desync() * (v709("right_max") / 100);
            else
                return v709("right");
            end;
        end);
        v706("freestanding", function()
            -- upvalues: v709 (ref)
            return v709("freestand");
        end);
        v706("options", function()
            -- upvalues: v427 (ref), v709 (ref)
            return v427.delete(v709("options"), "Jitter");
        end);
        v706("inverter", function()
            -- upvalues: v726 (ref), v427 (ref), v709 (ref), v711 (ref)
            if not v726 and v427.has(v709("options"), "Jitter") then
                return v711;
            else
                return false;
            end;
        end);
    end;
    v460.update_values = function(v727)
        -- upvalues: l_v461_2 (ref), l_v473_0 (ref)
        local v728 = entity.get_local_player();
        if v728 == nil then
            return;
        else
            local l_global_state_name_0 = l_v461_2.global_state_name;
            for _, v731 in ipairs(l_v461_2.names) do
                local v732 = l_v461_2.callbacks[v731];
                local v733 = l_v461_2.states[v731].enable and l_v461_2.states[v731].enable.value;
                if v732 and v732(v728, v727) and v733 then
                    l_global_state_name_0 = v731;
                    break;
                end;
            end;
            l_v473_0 = l_global_state_name_0;
            l_v461_2.allow_on_use(v727);
            l_v461_2.connect_elements(l_global_state_name_0);
            return;
        end;
    end;
    events.createmove(v460.update_values);
    v628.package = v125.setup(l_v461_2.states, true);
end;
v461 = nil;
v473 = function(v734, v735, v736, v737, v738, v739, v740)
    v734 = ({
        left = {
            vector(v736 - v740, v737 - v739), 
            vector(v736 - (v740 + v738), v737), 
            vector(v736 - v740, v737 + v739)
        }, 
        right = {
            vector(v736 + v740, v737 - v739), 
            vector(v736 + v740 + v738, v737), 
            vector(v736 + v740, v737 + v739)
        }, 
        backward = {
            vector(v736 - v739, v737 + v740), 
            vector(v736, v737 + v738 + v740), 
            vector(v736 + v739, v737 + v740)
        }, 
        forward = {
            vector(v736 - v739, v737 - v740), 
            vector(v736, v737 - v738 - v740), 
            vector(v736 + v739, v737 - v740)
        }
    })[v734];
    if not v734 then
        return;
    else
        local v741, v742, v743 = unpack(v734);
        render.poly(color(0, v735.a), v741 + 1, v742 + 1, v743 + 1);
        render.poly(v735, v741, v742, v743);
        return;
    end;
end;
v475 = v125.switch({
    [1] = "Anti-Aim", 
    [2] = "features"
}, "\v\f<location-arrow>  \rManual arrows", false, nil, function(v744)
    return {
        accent = v744:color_picker("color"), 
        size = v744:slider("size", 0, 20, 10), 
        distance = v744:slider("distance", 0, 50, 20)
    }, true;
end);
v21.new("arrow_ui", v475);
do
    local l_v473_1, l_v475_1 = v473, v475;
    v461 = function()
        -- upvalues: l_v475_1 (ref), l_v473_1 (ref), v460 (ref)
        if not l_v475_1:get() then
            return;
        else
            local v747 = entity.get_local_player();
            if not v747 or not v747:is_alive() then
                return;
            else
                local v748 = render.screen_size() * 0.5;
                local l_x_0 = v748.x;
                local l_y_1 = v748.y;
                local v751 = l_v475_1.size:get();
                local v752 = l_v475_1.size:get() * 0.6;
                local v753 = l_v475_1.distance:get();
                local v754 = l_v475_1.accent:get();
                l_v473_1(string.lower(v460.menu.options.manual.value), v754, l_x_0, l_y_1, v751, v752, v753);
                return;
            end;
        end;
    end;
end;
events.render(v461);
v473 = function(v755, v756)
    local v757 = v755 and v755 or {};
    for _, v759 in ipairs(v757) do
        if v756 == v759 then
            return true;
        end;
    end;
    return false;
end;
v475 = {
    data = {}
};
v475.lerp = function(v760, v761, v762)
    -- upvalues: v475 (ref)
    if v762 == nil then
        v762 = 0.09;
    end;
    if type(v760) == "userdata" then
        local v763 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0
        };
        for v764, v765 in ipairs({
            [1] = "r", 
            [2] = "g", 
            [3] = "b", 
            [4] = "a"
        }) do
            v763[v764] = v475.lerp(v760[v765], v761[v765], v762);
        end;
        return color(unpack(v763));
    else
        return (v761 - v760) * v762 + v760;
    end;
end;
v475.new = function(v766, v767, v768)
    -- upvalues: v475 (ref)
    if v475.data[v766] == nil then
        v475.data[v766] = v767;
    end;
    v475.data[v766] = v475.lerp(v475.data[v766], v767, v768);
    return v475.data[v766];
end;
v476 = v125.create("Misc", ui.get_icon("palette") .. " Visuals");
v477 = {
    var = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    scope_lines = v476:switch("\v\f<crosshairs> \r Custom Scope")
};
v477.tab = v477.scope_lines:create();
v477.scope_offset = v477.tab:slider("Offset", 0, 100, 10);
v477.scope_length = v477.tab:slider("Length", 0, 300, 60);
v477.scope_disable_lines = v477.tab:selectable("Disable", {
    [1] = "Top", 
    [2] = "Bottom", 
    [3] = "Right", 
    [4] = "Left"
});
v477.scope_style = v477.tab:combo("Style", {
    [1] = "Default", 
    [2] = "Inverted"
});
v477.scope_color = v477.tab:color_picker("Color", color(255, 255, 255));
v477.spread_scope = v477.tab:switch("Spread Scope");
v21.new("scope_lines", v477.scope_lines);
v21.new("scope_offset", v477.scope_offset);
v21.new("scope_length", v477.scope_length);
v21.new("scope_disable_lines", v477.scope_disable_lines);
v21.new("scope_style", v477.scope_style);
v21.new("scope_color", v477.scope_color);
v21.new("spread_scope", v477.spread_scope);
v477.on_draw = function()
    -- upvalues: v477 (ref), v475 (ref), v473 (ref)
    if not v477.scope_lines:get() then
        return;
    else
        v477.var:override("Remove All");
        local v769 = entity.get_local_player();
        local v770;
        if v769 and v769:is_alive() then
            v770 = not not v769.m_bIsScoped;
        else
            v770 = false;
        end;
        local v771 = v475.new("scope_lines", v770 and 1 or 0);
        local v772 = 0;
        if v477.spread_scope:get() and v769 then
            local v773 = v769:get_player_weapon();
            if v773 and v769.m_bIsScoped then
                v772 = v475.new("spread", (v773:get_inaccuracy() + v773:get_spread()) * v773:get_max_speed()) / 2;
            end;
        end;
        local function v775(v774)
            -- upvalues: v473 (ref), v477 (ref)
            return v473(v477.scope_disable_lines:get(), v774);
        end;
        local v776 = v477.scope_style:get() == "Default";
        v477.offset = v477.scope_offset:get() * v771 + v772;
        v477.length = v477.scope_length:get() * v771;
        v477.col_1 = v477.scope_color:get();
        v477.col_2 = v477.scope_color:get();
        v477.width = 1;
        v477.col_1.a = (v776 and v477.col_1.a or 0) * v771;
        v477.col_2.a = (not v776 and v477.col_2.a or 0) * v771;
        v477.start_x = render.screen_size().x / 2;
        v477.start_y = render.screen_size().y / 2;
        if not v775("Left") then
            render.gradient(vector(v477.start_x - v477.offset, v477.start_y), vector(v477.start_x - v477.offset - v477.length, v477.start_y + v477.width), v477.col_1, v477.col_2, v477.col_1, v477.col_2);
        end;
        if not v775("Right") then
            render.gradient(vector(v477.start_x + v477.offset, v477.start_y), vector(v477.start_x + v477.offset + v477.length, v477.start_y + v477.width), v477.col_1, v477.col_2, v477.col_1, v477.col_2);
        end;
        if not v775("Bottom") then
            render.gradient(vector(v477.start_x, v477.start_y + v477.offset), vector(v477.start_x + v477.width, v477.start_y + v477.offset + v477.length), v477.col_1, v477.col_1, v477.col_2, v477.col_2);
        end;
        if not v775("Top") then
            render.gradient(vector(v477.start_x, v477.start_y - v477.offset), vector(v477.start_x + v477.width, v477.start_y - v477.offset - v477.length), v477.col_1, v477.col_1, v477.col_2, v477.col_2);
        end;
        return;
    end;
end;
v477.on_destroy = function()
    -- upvalues: v477 (ref)
    v477.var:override();
end;
v477.scope_lines:set_callback(v477.on_destroy);
events.render:set(v477.on_draw);
events.shutdown:set(v477.on_destroy);
v485 = {};
v490 = {};
v497 = {};
local v777 = v125.create("Misc", ui.get_icon("palette") .. " Visuals");
local v778 = v125.create("Misc", ui.get_icon("palette") .. " Visuals");
math.lerp = function(v779, v780, v781)
    if v779 == v780 then
        return v780;
    else
        v781 = v781 * (globals.frametime * 170);
        local v782 = v779 + (v780 - v779) * v781;
        if math.abs(v782 - v780) < 0.01 then
            return v780;
        else
            return v782;
        end;
    end;
end;
v485.base_speed = 0.07;
v485._list = {};
v485.new = function(v783, v784, v785, v786)
    -- upvalues: v485 (ref)
    if not v785 then
        v785 = v485.base_speed;
    end;
    local v787 = type(v784) ~= "number";
    if v485._list[v783] == nil then
        v485._list[v783] = v786 and v786 or v787 and color(255) or 0;
    end;
    local v788 = nil;
    if v787 then
        v788 = math.color_lerp;
    else
        v788 = math.lerp;
    end;
    v485._list[v783] = v788(v485._list[v783], v784, v785);
    return v485._list[v783];
end;
v490.cvar = cvar.r_aspectratio;
v490.cvar_float_raw = v490.cvar.float;
v497.cvar_fov = cvar.viewmodel_fov;
v497.cvar_x = cvar.viewmodel_offset_x;
v497.cvar_y = cvar.viewmodel_offset_y;
v497.cvar_z = cvar.viewmodel_offset_z;
v497.cvar_fov_raw = v497.cvar_fov.float;
v497.cvar_x_raw = v497.cvar_x.float;
v497.cvar_y_raw = v497.cvar_y.float;
v497.cvar_z_raw = v497.cvar_z.float;
local v789 = v777:switch("\v\f<sliders>  \rAspect ratio", false);
local v790 = v789:create():slider("Value", 50, 300, 0, 0.01);
local v791 = v778:switch("\v\f<binoculars>  \rViewmodel", false);
local v792 = v791:create():slider("FOV", 0, 100, 68);
local v793 = v791:create():slider("X", -100, 100, 2.5, 0.1);
local v794 = v791:create():slider("Y", -100, 100, 1, 0.1);
local v795 = v791:create():slider("Z", -100, 100, -1, 0.1);
v21.new("ratio_enable", v789);
v21.new("ratio_value", v790);
v21.new("view_enable", v791);
v21.new("view_fov", v792);
v21.new("view_x", v793);
v21.new("view_y", v794);
v21.new("view_z", v795);
v490.handel = function()
    -- upvalues: v485 (ref), v790 (ref), v789 (ref), v490 (ref)
    local v796 = v485.new("ratio", v790:get() / 100, nil, v790:get() / 100);
    if v790:get() == 50 then
        v796 = 0;
    end;
    if not v789:get() then
        v796 = 0;
    end;
    if v796 ~= v490.cvar_float_raw(v490.cvar) then
        v490.cvar_float_raw(v490.cvar, v796);
    end;
end;
v497.handel = function()
    -- upvalues: v485 (ref), v792 (ref), v793 (ref), v794 (ref), v795 (ref), v497 (ref), v791 (ref)
    local v797 = v485.new("fovs", v792:get(), nil, v792:get());
    local v798 = v485.new("x", v793:get() / 10, nil, v793:get() / 10);
    local v799 = v485.new("y", v794:get() / 10, nil, v794:get() / 10);
    local v800 = v485.new("z", v795:get() / 10, nil, v795:get() / 10);
    local v801 = v497.cvar_x_raw(v497.cvar_x);
    local v802 = v497.cvar_y_raw(v497.cvar_y);
    local v803 = v497.cvar_z_raw(v497.cvar_z);
    if not v791:get() then
        v797 = 68;
        v798 = 2.5;
        v799 = 0;
        v800 = -1;
    end;
    if v792:get() == 0 then
        v797 = 68;
    end;
    if v797 ~= fov_default then
        cvar.viewmodel_fov:float(v797, true);
    end;
    if v798 ~= v801 then
        cvar.viewmodel_offset_x:float(v798, true);
    end;
    if v799 ~= v802 then
        cvar.viewmodel_offset_y:float(v799, true);
    end;
    if v800 ~= v803 then
        cvar.viewmodel_offset_z:float(v800, true);
    end;
end;
v490.shutdown = function()
    -- upvalues: v490 (ref)
    v490.cvar_float_raw(v490.cvar, 0);
end;
v497.shutdown = function()
    cvar.viewmodel_fov:float(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
end;
events.shutdown:set(function()
    -- upvalues: v490 (ref), v497 (ref)
    v490.shutdown();
    v497.shutdown();
end);
events.render:set(function()
    -- upvalues: v490 (ref), v497 (ref)
    v490.handel();
    v497.handel();
end);
local v804 = ui.create("Misc", ui.get_icon("palette") .. " Visuals");
local _ = require("neverlose/images");
local v806 = {
    Screen = render.screen_size()
};
local v808 = {
    Settings = {
        Enable = l_minterface_0.Switch(v804, v125.string("\v\f<triangle-exclamation> \r Velocity Indicator"), {
            [1] = false
        }, nil, function(v807)
            -- upvalues: l_minterface_0 (ref), v806 (ref)
            return {
                X = l_minterface_0.Slider(v807, "X", {
                    [1] = nil, 
                    [2] = 0, 
                    [3] = nil, 
                    [4] = 1, 
                    [1] = v806.Screen.x / 2 - 67.5, 
                    [3] = v806.Screen.x
                }, nil, nil), 
                Y = l_minterface_0.Slider(v807, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [3] = nil, 
                    [4] = 1, 
                    [1] = v806.Screen.y / 5, 
                    [3] = v806.Screen.y
                }, nil, nil)
            };
        end)
    }
};
v808.Settings.Enable[0].X:visibility(false);
v808.Settings.Enable[0].Y:visibility(false);
local v809 = {
    Interval = 0, 
    Image = render.load_image_from_file("materials\\panorama\\images\\icons\\ui\\warning.svg", vector(35, 35))
};
RGBHB = function(v810, v811)
    if not v811 then
        v811 = 15;
    end;
    return 246 - 123 * v810, 195 * v810, v811;
end;
Remap = function(v812, v813, v814, v815, v816, v817)
    if not v815 then
        v815 = 0;
    end;
    if not v816 then
        v816 = 1;
    end;
    local v818 = (v812 - v815) / (v816 - v815);
    if v817 ~= false then
        v818 = math.min(1, math.max(0, v818));
    end;
    return v813 + (v814 - v813) * v818;
end;
local v838 = l_mtools_0.Widget:Register({
    [1] = nil, 
    [2] = nil, 
    [3] = 135, 
    [4] = 40, 
    [1] = v808.Settings.Enable[0].X, 
    [2] = v808.Settings.Enable[0].Y
}, {
    [1] = 16, 
    [2] = 0
}, function(v819)
    -- upvalues: l_mtools_0 (ref), v808 (ref), v806 (ref), v809 (ref)
    local l_x_1 = v819.Position.x;
    local l_y_2 = v819.Position.y;
    local l_x_2 = v819.Size.x;
    local l_y_3 = v819.Size.y;
    local v824 = entity.get_local_player();
    if (v824 == nil or not v824:is_alive()) and ui.get_alpha() < 1 then
        return;
    else
        local v825;
        if v824 == nil then
            v825 = ui.get_alpha() >= 0.5 and 0.5 or 1;
        else
            if v824:is_alive() then
                if ui.get_alpha() >= 0.5 then
                    v825 = 1;
                    goto label0 --[[  true, true  ]];
                else
                    v825 = v824.m_flVelocityModifier;
                    if v825 then
                        goto label0;
                    end;
                end;
            end;
            v825 = 0.5;
        end;
        ::label0::;
        local v826 = ui.get_mouse_position();
        local v827 = l_mtools_0.Animation:Lerp("MTools", "Mouse.Alpha", l_x_1 >= v826.x or not (v826.x < l_x_1 + l_x_2) or not (l_y_2 < v826.y) or v826.y >= l_y_2 + l_y_3) * ui.get_alpha();
        if v827 > 0 then
            render.text(1, vector(l_x_1 + l_x_2 / 2, l_y_2 + l_y_3 * 1.15), color(222, 222, 222, 255 * v827), "c", "Right-click to put it in the center.");
            if common.is_button_down(2) then
                v808.Settings.Enable[0].X:set(v806.Screen.x / 2 - v819.Size.x / 2 - 0.5);
                v819.Position.x = v806.Screen.x / 2 - v819.Size.x / 2 - 0.5;
            end;
        end;
        local v828, v829, v830 = RGBHB(v825, 13);
        local v831 = Remap(v825, 1, 0, 0.85, 1);
        if ui.get_alpha() > 0 then
            local v832 = ui.get_alpha();
            if v832 then
                v831 = v832;
            end;
        end;
        render.texture(v809.Image, vector(l_x_1 - 3, l_y_2 - 4), vector(41, 41), color(16, 16, 16, 255 * v831));
        if v831 > 0.7 then
            render.rect(vector(l_x_1 + 13, l_y_2 + 11), vector(l_x_1 + 13 + 8, l_y_2 + 11 + 20), color(16, 16, 16, 255 * v831));
        end;
        v809.Interval = v809.Interval + (1 - v825) * 0.7 + 0.3;
        local v833 = math.abs(v809.Interval * 0.01 % 2 - 1) * 255;
        render.texture(v809.Image, vector(l_x_1, l_y_2), vector(35, 35), color(v828, v829, v830, v833 * v831));
        render.text(1, vector(l_x_1 + 35 + 8, l_y_2 + 3), color(255, 255, 255, 255 * v831), "b", string.format("%s %d%%", "Slowed down", v825 * 100));
        local v834 = l_x_1 + 35 + 8;
        local v835 = l_y_2 + 3 + 17;
        local v836 = 95;
        local v837 = 12;
        render.rect_outline(vector(v834, v835), vector(v834 + v836, v835 + v837), color(0, 0, 0, 255 * v831));
        render.rect(vector(v834 + 1, v835 + 1), vector(v834 + 1 + v836 - 2, v835 + 1 + v837 - 2), color(16, 16, 16, 180 * v831));
        render.rect(vector(v834 + 1, v835 + 1), vector(v834 + 1 + math.floor((v836 - 2) * v825), v835 + 1 + v837 - 2), color(v828, v829, v830, 180 * v831));
        return;
    end;
end);
events.render:set(function()
    -- upvalues: l_mtools_0 (ref), v808 (ref), v838 (ref)
    l_mtools_0.Animation:Register("MTools");
    l_mtools_0.Animation:Update("MTools", 6);
    if v808.Settings.Enable:get() then
        v838:Update();
    end;
end);
events.mouse_input:set(function()
    -- upvalues: l_mtools_0 (ref)
    return l_mtools_0.Widget:GetAntiShot();
end);
local l_system_0 = require("neverlose/drag_system");
local v840 = v125.create("Misc", ui.get_icon("globe") .. " Misc");
local _ = v125.create("\v\f<hammer>  \rSettings");
local v842 = {
    main = {
        enable = v21.new("solus_menu.main.enable", v840:switch("\v\f<person-through-window>  \rSolus UI"))
    }
};
local v843 = v842.main.enable:create();
local v844 = {
    main = {
        features = v843:selectable("\v\f<user-tie>  \rWidgets", {
            [1] = "Watermark", 
            [2] = "Keybinds", 
            [3] = "Spectators"
        })
    }, 
    settings = {
        blank = v843:label(""), 
        style = v843:combo("\rStyle", {
            [1] = "v1", 
            [2] = "v2", 
            [3] = "v2.5", 
            [4] = "v3", 
            [5] = "v4"
        }), 
        data = v843:switch("\v\f<wrench>  \rData Editor", false, "Edits watermark data."), 
        cheat = v843:combo("\rCheat Name", {
            [1] = "gamesense", 
            [2] = "neverlose"
        }), 
        name = v843:input("\rName", common.get_username()), 
        beta = v843:switch("\v\f<id-badge>  \rBeta", false, "Includes '[beta]' text in the watermark."), 
        color = v843:color_picker("\v\f<palette>  \rColor", color(37, 64, 72, 104)), 
        postcolor = v843:color_picker("\v\f<palette>  \rPostfix Color", color(37, 64, 72, 104)), 
        pos_x = v843:slider("posx222", 0, render.screen_size().x, 534), 
        pos_y = v843:slider("posy222", 0, render.screen_size().x, 434), 
        pos_x2 = v843:slider("posx12321321", 0, render.screen_size().x, 834), 
        pos_y2 = v843:slider("posy231231", 0, render.screen_size().x, 434)
    }
};
v21.new("menu_ref.settings.style", v844.settings.style);
v21.new("menu_ref.settings.data", v844.settings.data);
v21.new("menu_ref.settings.cheat", v844.settings.cheat);
v21.new("menu_ref.settings.name", v844.settings.name);
v21.new("menu_ref.settings.beta", v844.settings.beta);
v21.new("menu_ref.settings.color", v844.settings.color);
v21.new("menu_ref.settings.postcolor", v844.settings.postcolor);
v21.new("menu_ref.settings.pos_x", v844.settings.pos_x);
v21.new("menu_ref.settings.pos_y", v844.settings.pos_y);
v21.new("menu_ref.settings.pos_x2", v844.settings.pos_x2);
v21.new("menu_ref.settings.pos_y2", v844.settings.pos_y2);
v21.new("menu_ref.main.features", v844.main.features);
events.render:set(function()
    -- upvalues: v844 (ref)
    if v844.main.features:get("Watermark") or v844.main.features:get("Keybinds") or v844.main.features:get("Spectators") then
        v844.settings.blank:visibility(false);
    else
        v844.settings.blank:visibility(true);
    end;
    v844.settings.style:visibility(v844.main.features:get("Watermark") or v844.main.features:get("Keybinds") or v844.main.features:get("Spectators"));
    v844.settings.data:visibility(v844.main.features:get("Watermark"));
    v844.settings.cheat:visibility(v844.main.features:get("Watermark") and v844.settings.data:get());
    v844.settings.name:visibility(v844.main.features:get("Watermark") and v844.settings.data:get());
    v844.settings.beta:visibility(v844.main.features:get("Watermark") and v844.settings.data:get());
    if v844.settings.style:get() == "v4" then
        v844.settings.color:visibility(false);
    else
        v844.settings.color:visibility(v844.main.features:get("Watermark") or v844.main.features:get("Keybinds") or v844.main.features:get("Spectators"));
    end;
    v844.settings.postcolor:visibility(v844.main.features:get("Watermark") and v844.settings.style:get() == "v2" or v844.main.features:get("Watermark") and not (v844.settings.style:get() ~= "v2.5") or v844.main.features:get("Watermark") and not (v844.settings.style:get() ~= "v3") or v844.main.features:get("Watermark") and not (v844.settings.style:get() ~= "v4") or v844.main.features:get("Watermark") and v844.settings.style:get() == "sapphyrus");
    v844.settings.pos_x:visibility(false);
    v844.settings.pos_y:visibility(false);
    v844.settings.pos_x2:visibility(false);
    v844.settings.pos_y2:visibility(false);
end);
lerpx = function(v845, v846, v847)
    return v846 * (1 - v845) + v847 * v845;
end;
window = function(v848, v849, v850, v851, v852, v853)
    -- upvalues: v844 (ref), v842 (ref)
    local v854 = render.measure_text(1, "", v852);
    local l_r_0 = v844.settings.color:get().r;
    local l_g_0 = v844.settings.color:get().g;
    local l_b_0 = v844.settings.color:get().b;
    local l_a_0 = v844.settings.color:get().a;
    local l_r_1 = v844.settings.color:get().r;
    local l_g_1 = v844.settings.color:get().g;
    local l_b_1 = v844.settings.color:get().b;
    local _ = v844.settings.color:get().a;
    if not v842.main.enable:get() then
        return;
    else
        if v844.settings.style:get() == "v1" then
            render.rect(vector(v848 + 1, v849 + 1 - 3), vector(v848 + v850 + 1, v849 + 17), color(15, 15, 15, v853 / 1 - 255 + l_a_0), 0);
            render.rect(vector(v848 + 1, v849 - 4), vector(v848 + v850 + 1, v849 + 1 - 3), color(l_r_1, l_g_1, l_b_1, v853 / 1), 0);
            render.text(1, vector(v848 + 1 + v850 / 2 + 1 - v854.x / 2, v849 + v851 / 2 - v854.y / 2 - 1), color(255, 255, 255, v853), "", v852);
        elseif v844.settings.style:get() == "v2" then
            render.rect_outline(vector(v848 - 1 + 2, v849 - 2), vector(v848 + v850 + 4 - 2, v849 + v851 + 1), color(l_r_0, l_g_0, l_b_0, v853 / 5), 1, 4);
            render.rect(vector(v848 + 2 + 2, v849 - 2), vector(v848 + v850 + 1 - 2, v849 + 1 - 2), color(l_r_1, l_g_1, l_b_1, v853 - 50), 4);
            render.rect(vector(v848 + 2, v849 + 1 - 2), vector(v848 + v850 + 3 - 2, v849 + 16), color(0, 0, 0, v853 - 255 + l_a_0), 4);
            render.circle_outline(vector(v848 + 2 + 2, v849 + 3 - 2), color(l_r_1, l_g_1, l_b_1, v853), 3.5, 160, 0.3, 1);
            render.circle_outline(vector(v848 + v850 + 1 - 2, v849 + 3 - 2), color(l_r_1, l_g_1, l_b_1, v853), 3.5, 260, 0.3, 1);
            render.gradient(vector(v848 - 1 + 2, v849 + 2 - 2), vector(v848 + 2, v849 + v851 - 2), color(l_r_1, l_g_1, l_b_1, v853), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, v853 / 2), color(l_r_1, l_g_1, l_b_1, 0));
            render.gradient(vector(v848 + v850 + 3 - 2, v849 + 2 - 2), vector(v848 + v850 + 4 - 2, v849 + v851 - 2), color(l_r_1, l_g_1, l_b_1, v853), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, v853 / 2), color(l_r_1, l_g_1, l_b_1, 0));
            render.text(1, vector(v848 + 2 + v850 / 2 + 1 - v854.x / 2, v849 + v851 / 2 - v854.y / 2 - 1), color(255, 255, 255, v853), "", v852);
            render.shadow(vector(v848 - 1 + 4, v849 - 2), vector(v848 + v850 + 4 - 2, v849 + 16), color(l_r_1, l_g_1, l_b_1, v853 - 150), 30, 0, 4);
        elseif v844.settings.style:get() == "v2.5" then
            render.rect(vector(v848 + 1, v849 + 1 - 3), vector(v848 + v850 + 1, v849 + 17), color(15, 15, 15, v853 / 1 - 255 + l_a_0), 0);
            render.rect(vector(v848 - 1, v849 + 4), vector(v848 + 2, v849 + 12), color(l_r_1, l_g_1, l_b_1, v853 / 1), 0);
            render.shadow(vector(v848 - 1, v849 + 4), vector(v848 + 2, v849 + 12), color(l_r_1, l_g_1, l_b_1, v853 / 1), 25, 0, 0);
            render.rect(vector(v848 + v850 - 1, v849 + 4), vector(v848 + v850 + 2, v849 + 12), color(l_r_1, l_g_1, l_b_1, v853 / 1), 0);
            render.shadow(vector(v848 + v850 - 1, v849 + 4), vector(v848 + v850 + 2, v849 + 12), color(l_r_1, l_g_1, l_b_1, v853 / 1), 25, 0, 0);
            render.text(1, vector(v848 + 1 + v850 / 2 + 1 - v854.x / 2, v849 + v851 / 2 - v854.y / 2 - 1), color(255, 255, 255, v853), "", v852);
        elseif v844.settings.style:get() == "v3" then
            render.rect(vector(v848, v849 + 1 - 3), vector(v848 + v850 + 3, v849 + 17), color(15, 15, 15, v853 / 1 - 255 + l_a_0), 4);
            render.rect(vector(v848 + 4, v849 - 3), vector(v848 + v850 - 1, v849 + 1 - 3), color(l_r_1, l_g_1, l_b_1, v853 / 2), 2);
            render.circle_outline(vector(v848 + 3, v849 + 4 - 3), color(l_r_1, l_g_1, l_b_1, v853 - 50), 4.5, 175, 0.33, 1);
            render.circle_outline(vector(v848 + v850, v849 + 4 - 3), color(l_r_1, l_g_1, l_b_1, v853 - 50), 4.5, 260, 0.3, 1);
            render.gradient(vector(v848 - 1, v849 + 2 - 3), vector(v848, v849 + v851 - 4 - 3), color(l_r_1, l_g_1, l_b_1, v853), color(l_r_1, l_g_1, l_b_1, v853 / 2), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, 0));
            render.gradient(vector(v848 + v850 + 3, v849 + 2 - 3), vector(v848 + v850 + 4, v849 + v851 - 4 - 3), color(l_r_1, l_g_1, l_b_1, v853), color(l_r_1, l_g_1, l_b_1, v853 / 2), color(l_r_1, l_g_1, l_b_1, 0), color(l_r_1, l_g_1, l_b_1, 0));
            render.text(1, vector(v848 + 1 + v850 / 2 + 1 - v854.x / 2, v849 + v851 / 2 - v854.y / 2 - 1), color(255, 255, 255, v853), "", v852);
            render.shadow(vector(v848, v849 - 3), vector(v848 + v850 + 3, v849 + 17), color(l_r_1, l_g_1, l_b_1, v853 - 150), 30, 0, 4);
        elseif v844.settings.style:get() == "v4" then
            render.rect(vector(v848, v849 - 10), vector(v848 - 14 + 17 + v850, v849 + 18), color(12, 12, 12, v853), 0);
            render.rect(vector(v848 + 1, v849 - 9), vector(v848 - 15 + 17 + v850, v849 + 17), color(39, 39, 39, v853), 0);
            render.rect_outline(vector(v848 + 1, v849 - 9), vector(v848 - 15 + 17 + v850, v849 + 17), color(59, 59, 59, v853), 0);
            render.rect_outline(vector(v848 + 3, v849 - 7), vector(v848 - 17 + 17 + v850, v849 + 15), color(59, 59, 59, v853), 0);
            render.rect(vector(v848 + 4, v849 - 5), vector(v848 - 18 + 17 + v850, v849 + 13), color(12, 12, 12, v853), 0);
            render.gradient(vector(v848 + 4, v849 - 5), vector(v848 - 52 + v850, v849 - 4), color(46, 149, 184, v853), color(201, 84, 205, v853), color(46, 149, 184, v853), color(201, 84, 205, v853), 0);
            render.gradient(vector(v848 - 52 + v850, v849 - 5), vector(v848 - 19 + 18 + v850, v849 - 4), color(201, 84, 205, v853), color(181, 184, 47, v853), color(201, 84, 205, v853), color(181, 184, 47, v853), 0);
            render.gradient(vector(v848 + 4, v849 - 4), vector(v848 - 52 + v850, v849 - 3), color(46, 149, 184, v853 / 2), color(201, 84, 205, v853 / 2), color(46, 149, 184, v853 / 2), color(201, 84, 205, v853 / 2), 0);
            render.gradient(vector(v848 - 52 + v850, v849 - 4), vector(v848 - 19 + 18 + v850, v849 - 3), color(201, 84, 205, v853 / 2), color(181, 184, 47, v853 / 2), color(201, 84, 205, v853 / 2), color(181, 184, 47, v853 / 2), 0);
            render.gradient(vector(v848 + 4, v849 - 3), vector(v848 - 52 + v850, v849 - 2), color(46, 149, 184, v853 / 4), color(201, 84, 205, v853 / 4), color(46, 149, 184, v853 / 4), color(201, 84, 205, v853 / 4), 0);
            render.gradient(vector(v848 - 52 + v850, v849 - 3), vector(v848 - 19 + 18 + v850, v849 - 2), color(201, 84, 205, v853 / 4), color(181, 184, 47, v853 / 4), color(201, 84, 205, v853 / 4), color(181, 184, 47, v853 / 4), 0);
            render.text(1, vector(v848 + 2 + v850 / 2 + 1 - v854.x / 2, v849 + v851 / 2 - v854.y / 2 - 3), color(255, 255, 255, v853), "", v852);
        end;
        return;
    end;
end;
local l_x_3 = render.screen_size().x;
local _ = render.screen_size().y;
local v865 = 0;
local v866 = 0;
local v867 = 1;
local _ = 0;
local v869 = 0;
local v870 = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
local _ = 1;
watermark = function()
    -- upvalues: v844 (ref), v842 (ref), v20 (ref), l_x_3 (ref)
    if not v844.main.features:get("Watermark") then
        return;
    elseif not v842.main.enable:get() then
        return;
    else
        local _ = math.floor(1 / globals.tickinterval);
        local _ = common.get_username();
        get_ping = function()
            local v875 = utils.net_channel();
            if v875 == nil then
                return 0;
            else
                return math.floor(v875.latency[1] * 1000);
            end;
        end;
        local v876 = "";
        local v877 = "";
        local v878 = "";
        local v879 = "";
        if v844.settings.beta:get() then
            v879 = v844.settings.cheat:get() == "neverlose" and " [nightly] | " or " [beta] | ";
        else
            v879 = " | ";
        end;
        local function v881()
            -- upvalues: v844 (ref), v20 (ref)
            local v880 = v844.settings.name:get();
            return #v880 > 0 and v880 or v20;
        end;
        v876 = common.get_date("%H:%M:%S");
        if not globals.is_in_game then
            v877 = "";
        elseif v844.settings.style:get() == "v4" then
            v877 = " |  " .. get_ping() .. "ms";
        else
            v877 = " | delay: " .. get_ping() .. "ms";
        end;
        solushex = color(v844.settings.color:get().r, v844.settings.color:get().g, v844.settings.color:get().b, 255):to_hex();
        if v844.settings.style:get() == "v1" then
            v878 = v844.settings.cheat:get() .. v879 .. v881() .. v877 .. " | " .. v876;
        elseif v844.settings.cheat:get() == "neverlose" then
            v878 = "never\a" .. solushex .. "lose\aFFFFFFFF" .. v879 .. v881() .. v877 .. " | " .. v876;
        else
            v878 = "game\a" .. solushex .. "sense\aFFFFFFFF" .. v879 .. v881() .. v877 .. " | " .. v876;
        end;
        local l_x_4 = render.measure_text(1, "", v878).x;
        if v844.settings.style:get() == "v4" then
            window(l_x_3 - l_x_4 - 27, 29, l_x_4 + 13, 16, v878, 255);
        elseif v844.settings.style:get() == "v3" then
            local v883 = v844.settings.color:get();
            local v884 = v844.settings.postcolor:get();
            local v885 = "";
            local v886 = "";
            local v887 = "";
            if v844.settings.beta:get() then
                v887 = v844.settings.cheat:get() == "neverlose" and "[nightly] " or "[beta] ";
            else
                v887 = "";
            end;
            if v844.settings.cheat:get() == "neverlose" then
                v885 = render.measure_text(1, nil, "never");
                v886 = render.measure_text(1, nil, "neverlose");
            else
                v885 = render.measure_text(1, nil, "game");
                v886 = render.measure_text(1, nil, "gamesense");
            end;
            local l_x_5 = render.screen_size().x;
            local l_y_5 = render.screen_size().y;
            local _ = render.screen_size().y + 9;
            local v891 = entity.get_local_player();
            local v892 = common.get_system_time();
            if v892.hours < 10 then
                v892.hours = "0" .. v892.hours;
            end;
            if v892.minutes < 10 then
                v892.minutes = "0" .. v892.minutes;
            end;
            if v892.seconds < 10 then
                v892.seconds = "0" .. v892.seconds;
            end;
            local v893 = string.format("%02d:%02d:%02s", v892.hours, v892.minutes, v892.seconds);
            local v894 = 0;
            v894 = v891 == nil and 0 or string.format("%1.f", math.max(0, utils.net_channel():get_packet_response_latency(0, 0)));
            if v894 == nil then
                v894 = 0;
            end;
            local v895 = 28;
            local v896 = "";
            if v844.settings.cheat:get() == "neverlose" then
                v896 = render.measure_text(1, nil, "neverlose" .. v887 .. v881() .. " delay: " .. v894 .. "ms " .. v893).x - 30;
            else
                v896 = render.measure_text(1, nil, "gamesense" .. v887 .. v881() .. " delay: " .. v894 .. "ms " .. v893).x - 30;
            end;
            if v895 < v896 and v896 then
                v895 = v896;
            end;
            local v897 = 108 - v895;
            render.gradient(vector(l_x_5 - 162 + v897, l_y_5 / 60 - 12 + 4), vector(l_x_5 - 147 + v897, l_y_5 / 60 - 10 + 4), color(v883.r, v883.g, v883.b, 90), color(0, 0, 0, 0), color(v883.r, v883.g, v883.b, 110), color(0, 0, 0, 0), 4);
            render.gradient(vector(l_x_5 - 162 + v897, l_y_5 / 60 + 10 + 4), vector(l_x_5 - 147 + v897, l_y_5 / 60 + 12 + 4), color(v883.r, v883.g, v883.b, 90), color(0, 0, 0, 0), color(v883.r, v883.g, v883.b, 110), color(0, 0, 0, 0), 4);
            render.circle_outline(vector(l_x_5 - 162 + v897, l_y_5 / 60 - 2 + 4), color(v883.r, v883.g, v883.b, 110), 10, 226, 0.12, 1.5);
            render.circle_outline(vector(l_x_5 - 162 + v897, l_y_5 / 60 + 2 + 4), color(v883.r, v883.g, v883.b, 110), 10, 90, 0.12, 1.5);
            render.rect(vector(l_x_5 - 167 + v897, l_y_5 / 60 - 10 + 4), vector(l_x_5 - 13, l_y_5 / 60 + 10 + 4), color(0, 0, 0, v883.a), 3);
            render.rect(vector(l_x_5 - 169 + v897, l_y_5 / 60 - 8 + 4), vector(l_x_5 + v897 - 167, l_y_5 / 60 + 9 + 4), color(v883.r, v883.g, v883.b, 110), 0);
            render.shadow(vector(l_x_5 - 167 + v897, l_y_5 / 60 - 10 + 4), vector(l_x_5 - 13, l_y_5 / 60 + 10 + 4), color(v883.r, v883.g, v883.b, 150), 20, 0, 3);
            if v844.settings.cheat:get() == "neverlose" then
                render.text(1, vector(l_x_5 - 156 - 5 + v897, l_y_5 / 60 - 7 + 4), color(255, 255, 255, 255), nil, "never");
            else
                render.text(1, vector(l_x_5 - 156 - 5 + v897, l_y_5 / 60 - 7 + 4), color(255, 255, 255, 255), nil, "game");
            end;
            if v844.settings.cheat:get() == "neverlose" then
                render.text(1, vector(l_x_5 - 156 - 5 + v897 + v885.x, l_y_5 / 60 - 7 + 4), color(v884.r, v884.g, v884.b, 255), nil, "lose");
            else
                render.text(1, vector(l_x_5 - 156 - 5 + v897 + v885.x, l_y_5 / 60 - 7 + 4), color(v884.r, v884.g, v884.b, 255), nil, "sense");
            end;
            render.text(1, vector(l_x_5 - 152 - 5 + v897 + v886.x, l_y_5 / 60 - 7 + 4), color(255, 255, 255, 255), nil, v887 .. v881());
            if v844.settings.cheat:get() == "neverlose" then
                render.text(1, vector(l_x_5 - 151 - 5 + v897 + render.measure_text(1, nil, "neverlose" .. v887 .. v881()).x, l_y_5 / 60 - 7 + 4), color(255, 255, 255, 255), nil, " delay: " .. v894 .. "ms " .. v893);
            else
                render.text(1, vector(l_x_5 - 151 - 5 + v897 + render.measure_text(1, nil, "gamesense" .. v887 .. v881()).x, l_y_5 / 60 - 7 + 4), color(255, 255, 255, 255), nil, " delay: " .. v894 .. "ms " .. v893);
            end;
        elseif v844.settings.style:get() == "v2.5" then
            window(l_x_3 - l_x_4 - 23, 20, l_x_4 + 11, 16, v878, 255);
        else
            window(l_x_3 - l_x_4 - 23, 22, l_x_4 + 11, 16, v878, 255);
        end;
        return;
    end;
end;
local v913 = l_system_0.register({
    [1] = v844.settings.pos_x, 
    [2] = v844.settings.pos_y
}, vector(120, 60), "Test", function(v898)
    -- upvalues: v844 (ref), v842 (ref), v870 (ref), v869 (ref), v427 (ref), v867 (ref), v865 (ref)
    if v844.main.features:get("Keybinds") and v842.main.enable:get() then
        local v899 = 0;
        local v900 = globals.frametime * 16;
        local v901 = 0;
        local _ = 150;
        local v903 = {};
        local v904 = ui.get_binds();
        for v905 = 1, #v904 do
            local v906 = v904[v905];
            local v907 = v904[v905].mode == 1 and "holding" or v904[v905].mode == 2 and "toggled" or "[?]";
            local _ = v904[v905].value;
            local l_name_0 = v904[v905].name;
            if l_name_0 == "Peek Assist" then
                l_name_0 = "Quick peek assist";
            end;
            if l_name_0 == "Edge Jump" then
                l_name_0 = "Jump at edge";
            end;
            if l_name_0 == "Hide Shots" then
                l_name_0 = "On shot anti-aim";
            end;
            if l_name_0 == "Min. Damage" then
                l_name_0 = "Minimum damage";
            end;
            if l_name_0 == "Fake Latency" then
                l_name_0 = "Ping spike";
            end;
            if l_name_0 == "Fake Duck" then
                l_name_0 = "Duck peek assist";
            end;
            if l_name_0 == "Safe Points" then
                l_name_0 = "Force safe points";
            end;
            if l_name_0 == "Body Aim" then
                l_name_0 = "Force body aim";
            end;
            if l_name_0 == "Double Tap" then
                l_name_0 = "Double tap";
            end;
            if l_name_0 == "Yaw Base" then
                l_name_0 = "Manual yaw override";
            end;
            if l_name_0 == "Slow Walk" then
                l_name_0 = "Slow motion";
            end;
            local v910 = render.measure_text(1, nil, v907);
            local v911 = render.measure_text(1, nil, l_name_0);
            if v870[v906.name] == nil then
                v870[v906.name] = {
                    alpha_k = 0
                };
            end;
            v870[v906.name].alpha_k = lerpx(v900, v870[v906.name].alpha_k, v906.active and 255 or 0);
            render.text(1, vector(v898.position.x + 6, v898.position.y + 21 + v901), color(255, v870[v906.name].alpha_k), "", l_name_0);
            if l_name_0 == "Minimum damage" or l_name_0 == "Ping spike" then
                render.text(1, vector(v898.position.x + (v869 - v910.x - 10), v898.position.y + 21 + v901), color(255, v870[v906.name].alpha_k), "", "[" .. v907 .. "]");
            else
                render.text(1, vector(v898.position.x + (v869 - v910.x - 10), v898.position.y + 21 + v901), color(255, v870[v906.name].alpha_k), "", "[" .. v907 .. "]");
            end;
            v901 = v901 + 16 * v870[v906.name].alpha_k / 255;
            local v912 = v910.x + v911.x + 26;
            if v912 > 99 and v899 < v912 then
                v899 = v912;
            end;
            if v904.active then
                v427.insert(v903, v904);
            end;
        end;
        v867 = lerpx(v900, v867, (not (ui.get_alpha() <= 0) or v901 > 0) and 1 or 0);
        v869 = lerpx(v900, v869, math.max(v899, 141));
        if ui.get_alpha() > 0 or v901 > 6 then
            v865 = lerpx(v900, v865, math.max(ui.get_alpha() * 255, v901 > 1 and 255 or 0));
        elseif v901 < 15.99 and ui.get_alpha() == 0 then
            v865 = lerpx(v900, v865, 0);
        end;
        if ui.get_alpha() or #v903 > 0 then
            window(v898.position.x, v898.position.y, v869, 16, "keybinds", v865);
        end;
    end;
end);
network.get("https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg", {}, function(v914)
    local l_status_2, l_result_2 = pcall(render.load_image, v914, vector(50, 50));
    if l_status_2 and l_result_2 ~= nil then
        fnay = l_result_2;
    end;
end);
local v929 = l_system_0.register({
    [1] = v844.settings.pos_x2, 
    [2] = v844.settings.pos_y2
}, vector(120, 60), "Test2", function(v917)
    -- upvalues: v844 (ref), v842 (ref), v866 (ref)
    if v844.main.features:get("Spectators") and v842.main.enable:get() then
        local v918 = globals.frametime * 16;
        local v919 = 141;
        local v920 = 0;
        if v919 > 99 and v920 < v919 then
            v920 = v919;
        end;
        if ui.get_alpha() > 0.3 then
            v866 = lerpx(v918, v866, math.max(ui.get_alpha() * 255, 255));
        elseif ui.get_alpha() == 0 then
            v866 = lerpx(v918, v866, 0);
        end;
        if ui.get_alpha() > 0.3 or ui.get_alpha() > 0.3 and not globals.is_in_game then
            window(v917.position.x, v917.position.y, v919, 16, "spectators", v866);
        end;
        local v921 = entity.get_local_player();
        if v921 == nil then
            return;
        else
            local _ = v921:get_spectators();
            if v921.m_hObserverTarget and (v921.m_iObserverMode == 4 or v921.m_iObserverMode == 5) then
                v921 = v921.m_hObserverTarget;
            end;
            local v923 = v921.get_spectators(v921);
            if v923 == nil then
                return;
            else
                for v924, v925 in pairs(v923) do
                    local v926 = v925:get_name();
                    local _ = render.measure_text(1, nil, v926).x;
                    name_sub = string.len(v926) > 30 and string.sub(v926, 0, 30) .. "..." or v926;
                    local v928 = v925:get_steam_avatar();
                    if v928 == nil or v928.width <= 5 then
                        v928 = fnay;
                    end;
                    if not v925:is_bot() or v925:is_player() then
                        if v844.settings.style:get() == "v4" then
                            render.text(1, vector(v917.position.x + 25, v917.position.y + 6 + v924 * 15), color(), "u", name_sub);
                            render.texture(v928, vector(v917.position.x + 9, v917.position.y + 6 + v924 * 15), vector(12, 12), color(), "f", 0);
                        elseif v844.settings.style:get() == "v2" then
                            render.text(1, vector(v917.position.x + 20, v917.position.y + 5 + v924 * 15), color(), "u", name_sub);
                            render.texture(v928, vector(v917.position.x + 4, v917.position.y + 5 + v924 * 15), vector(12, 12), color(), "f", 0);
                        else
                            render.text(1, vector(v917.position.x + 17, v917.position.y + 5 + v924 * 15), color(), "u", name_sub);
                            render.texture(v928, vector(v917.position.x + 1, v917.position.y + 5 + v924 * 15), vector(12, 12), color(), "f", 0);
                        end;
                    end;
                end;
                if #v921.get_spectators(v921) > 0 or v921.m_iObserverMode == 4 or v921.m_iObserverMode == 5 then
                    window(v917.position.x, v917.position.y, v919, 16, "spectators", 255);
                end;
            end;
        end;
    end;
end);
events.mouse_input:set(function()
    if ui.get_alpha() > 0.5 then
        return false;
    else
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v913 (ref), v929 (ref)
    watermark();
    v913:update();
    v929:update();
end);
local l_load_font_0 = render.load_font;
render.load_font = function(v931, v932, v933)
    -- upvalues: l_load_font_0 (ref)
    local _, l_result_3 = pcall(l_load_font_0, v931, v932, v933);
    return l_result_3;
end;
local v945 = {
    main_folder = "nl/Warpaith/", 
    targets = {
        ["arrows.ttf"] = "https://raw.githubusercontent.com/6sixgang/textisory/main/arrows.ttf", 
        ["bolt.ttf"] = "https://raw.githubusercontent.com/6sixgang/textisory/main/bolt.ttf"
    }, 
    download = function(_, v937, v938)
        network.get(v937, nil, function(v939)
            -- upvalues: v938 (ref)
            if v939 ~= nil then
                v938(v939);
            end;
        end);
    end, 
    setup = function(v940)
        files.create_folder(v940.main_folder);
        for v941, v942 in pairs(v940.targets) do
            do
                local l_v941_0 = v941;
                if files.read(v940.main_folder .. l_v941_0) == nil then
                    v940:download(v942, function(v944)
                        -- upvalues: v940 (ref), l_v941_0 (ref)
                        if files.write(v940.main_folder .. l_v941_0, v944, l_v941_0:find(".ttf") and true or false) == true then
                            common.reload_script();
                        end;
                    end);
                end;
            end;
        end;
    end
};
v945:setup();
local v946 = v125.create("Misc", ui.get_icon("globe") .. " UI");
local _ = nil;
local v948 = render.load_font("Calibri Bold", 24, "ad");
local v949 = 45;
local v950 = vector(9, 10);
local v951 = vector(10, v16.y / 2);
local v952 = {
    base = color("C4C4C4"), 
    red = color("FF0000"), 
    green = color("A2D01E"), 
    yellow = color("FCF369"), 
    gradient = {
        side = color(0, 0), 
        center = color(0, 50)
    }
};
local v954 = v946:switch("\aA2D01EFF0$ \rIndicators \aFFB880FF*new", false, nil, function(v953)
    return {
        items = v953:listable("", {
            [1] = "Fake", 
            [2] = "Ping", 
            [3] = "Fake Duck", 
            [4] = "Body Aim", 
            [5] = "Safe Points", 
            [6] = "Hitchance", 
            [7] = "Double Tap", 
            [8] = "Hide Shots", 
            [9] = "Min. Damage", 
            [10] = "Freestanding", 
            [11] = "Dormant Aimbot"
        })
    }, true;
end);
v21.new("skeet_side_indicators", v954);
do
    local l_v948_0, l_v949_0, l_v950_0, l_v951_0, l_v952_0, l_v954_0 = v948, v949, v950, v951, v952, v954;
    local function v964(v961)
        -- upvalues: l_v954_0 (ref)
        for v962, v963 in ipairs(l_v954_0.items:list()) do
            if v961 == v963 then
                return l_v954_0.items:get(v962);
            end;
        end;
        return false;
    end;
    local v965 = {};
    local function v968(v966)
        -- upvalues: v427 (ref), v965 (ref)
        local v967 = {
            get = function()

            end, 
            paint = function()

            end
        };
        v427.insert(v965, setmetatable(v966, {
            __index = v967
        }));
    end;
    local function v973(v969, v970, v971)
        -- upvalues: l_v948_0 (ref), l_v950_0 (ref), l_v952_0 (ref)
        local v972 = render.measure_text(l_v948_0, "", v971) + l_v950_0;
        render.gradient(v969, vector(v969.x + v972.x / 2, v969.y + v972.y), l_v952_0.gradient.side, l_v952_0.gradient.center, l_v952_0.gradient.side, l_v952_0.gradient.center);
        render.gradient(vector(v969.x + v972.x / 2, v969.y), vector(v969.x + v972.x, v969.y + v972.y), l_v952_0.gradient.center, l_v952_0.gradient.side, l_v952_0.gradient.center, l_v952_0.gradient.side);
        render.text(l_v948_0, vector(v969.x + l_v950_0.x * 2, v969.y + l_v950_0.y / 2 + 1), v970, "", v971);
    end;
    local function v977()
        -- upvalues: v965 (ref), v427 (ref)
        local v974 = {};
        for _, v976 in ipairs(v965) do
            if v976:get() then
                v427.insert(v974, v976);
            end;
        end;
        return v974;
    end;
    local function v982()
        -- upvalues: l_v954_0 (ref), v977 (ref), l_v951_0 (ref), l_v949_0 (ref)
        local v978 = entity.get_local_player();
        if not l_v954_0.value or not v978 or not v978:is_alive() then
            return;
        else
            local _ = 0;
            for v980, v981 in ipairs(v977()) do
                v981:paint(vector(l_v951_0.x, l_v951_0.y + l_v949_0 * v980));
            end;
            return;
        end;
    end;
    events.render(v982);
    v968({
        menu_double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        get = function(v983)
            -- upvalues: v964 (ref)
            return v964("Double Tap") and (v983.menu_double_tap:get_override() or v983.menu_double_tap:get());
        end, 
        paint = function(_, v985)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local v986 = rage.exploit:get() == 1 and l_v952_0.base or l_v952_0.red;
            v973(v985, v986, "DT");
        end
    });
    v968({
        menu_fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        get = function(v987)
            -- upvalues: v964 (ref)
            return v964("Fake Duck") and (v987.menu_fake_duck:get_override() or v987.menu_fake_duck:get());
        end, 
        paint = function(_, v989)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_0 = l_v952_0.base;
            v973(v989, l_base_0, "DUCK");
        end
    });
    v968({
        desync_smoothy = l_smoothy_0.new(0), 
        get = function(_)
            -- upvalues: v964 (ref)
            return v964("Fake");
        end, 
        paint = function(v992, v993)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local v994 = math.clamp(math.min(math.abs(rage.antiaim:get_rotation(true) - rage.antiaim:get_rotation()), rage.antiaim:get_max_desync()), 0, 58);
            local v995 = v992.desync_smoothy(0.04, v994);
            local v996 = l_v952_0.red:lerp(l_v952_0.green, v995 / 60);
            v973(v993, v996, "FAKE");
        end
    });
    v968({
        menu_fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        get_ping = function()
            if globals.is_connected then
                return math.floor(utils.net_channel().latency[0] * 1000);
            else
                return 0;
            end;
        end, 
        get = function(v997)
            -- upvalues: v964 (ref)
            return v964("Ping") and v997.menu_fake_latency:get() > 0;
        end, 
        paint = function(v998, v999)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local v1000 = math.clamp(v998.get_ping() / v998.menu_fake_latency:get(), 0, 1);
            local v1001 = l_v952_0.red:lerp(l_v952_0.green, v1000);
            v973(v999, v1001, "PING");
        end
    });
    v968({
        menu_min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        get = function(v1002)
            -- upvalues: v964 (ref)
            if not v964("Min. Damage") then
                return false;
            else
                for _, v1004 in ipairs(ui.get_binds()) do
                    if v1004.reference:id() == v1002.menu_min_damage:id() and v1004.active then
                        return true;
                    end;
                end;
                return false;
            end;
        end, 
        paint = function(v1005, v1006)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_1 = l_v952_0.base;
            local v1008 = v1005.menu_min_damage:get();
            v973(v1006, l_base_1, ("DMG: %s"):format(v1008 > 100 and string.format("+%s", v1008 - 100) or v1008));
        end
    });
    v968({
        menu_hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        get = function(v1009)
            -- upvalues: v964 (ref)
            if not v964("Hitchance") then
                return false;
            else
                for _, v1011 in ipairs(ui.get_binds()) do
                    if v1011.reference:id() == v1009.menu_hit_chance:id() and v1011.active then
                        return true;
                    end;
                end;
                return false;
            end;
        end, 
        paint = function(v1012, v1013)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_2 = l_v952_0.base;
            v973(v1013, l_base_2, ("HC: %i%%"):format(v1012.menu_hit_chance:get()));
        end
    });
    v968({
        menu_body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        get = function(v1015)
            -- upvalues: v964 (ref)
            return v964("Body Aim") and v1015.menu_body_aim:get() == "Force";
        end, 
        paint = function(_, v1017)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_3 = l_v952_0.base;
            v973(v1017, l_base_3, "BAIM");
        end
    });
    v968({
        menu_safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        get = function(v1019)
            -- upvalues: v964 (ref)
            return v964("Safe Points") and v1019.menu_safe_points:get() == "Force";
        end, 
        paint = function(_, v1021)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_4 = l_v952_0.base;
            v973(v1021, l_base_4, "SAFE");
        end
    });
    v968({
        menu_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        get = function(v1023)
            -- upvalues: v964 (ref)
            return v964("Freestanding") and (v1023.menu_freestanding:get_override() or v1023.menu_freestanding:get());
        end, 
        paint = function(_, v1025)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_5 = l_v952_0.base;
            v973(v1025, l_base_5, "FS");
        end
    });
    v968({
        menu_dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        get = function(v1027)
            -- upvalues: v964 (ref)
            return v964("Dormant Aimbot") and (v1027.menu_dormant_aimbot:get_override() or v1027.menu_dormant_aimbot:get());
        end, 
        paint = function(_, v1029)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_6 = l_v952_0.base;
            v973(v1029, l_base_6, "DA");
        end
    });
    v968({
        menu_hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        get = function(v1031)
            -- upvalues: v964 (ref)
            return v964("Hide Shots") and (v1031.menu_hide_shots:get_override() or v1031.menu_hide_shots:get());
        end, 
        paint = function(_, v1033)
            -- upvalues: l_v952_0 (ref), v973 (ref)
            local l_base_7 = l_v952_0.base;
            v973(v1033, l_base_7, "OS");
        end
    });
end;
v948 = {
    lightningbolt = render.load_font(v945.main_folder .. "bolt.ttf", 20, "ad")
};
({
    render = function(_, v1036, v1037)
        -- upvalues: v948 (ref)
        local v1038 = entity.get_local_player();
        entity.get_players(true, true, function(v1039)
            -- upvalues: v1038 (ref), v1036 (ref), v1037 (ref), v948 (ref)
            if not v1039:is_alive() or not v1038:is_alive() then
                return;
            else
                local v1040 = v1039:get_player_weapon();
                local v1041 = v1039:get_player_weapon(true);
                if not v1041 or not v1040 then
                    return;
                else
                    local l_v1036_0 = v1036;
                    for _, v1044 in ipairs(v1041) do
                        local v1045 = v1044:get_classname();
                        local l_pos1_0 = v1039:get_bbox().pos1;
                        if v1045 == "CWeaponTaser" and l_pos1_0 ~= nil then
                            if v1045 == v1040:get_classname() then
                                l_v1036_0 = v1037;
                            end;
                            render.text(v948.lightningbolt, vector(l_pos1_0.x - 11, l_pos1_0.y + 7), l_v1036_0.get(l_v1036_0), "c", "1");
                        end;
                    end;
                    return;
                end;
            end;
        end);
    end, 
    setup = function(v1047)
        -- upvalues: v946 (ref), v21 (ref)
        local v1048 = v946:switch("\v\f<bolt> \r   Zeus \vWarning\r");
        local v1049 = v1048:create();
        local v1050 = v1049:color_picker("Inactive Color");
        color(235, 245, 130);
        local v1051 = v1049:color_picker("In Hands Color", color(255, 0, 0));
        v21.new("zeus_enable", v1048);
        v21.new("zeus_default_color", v1050);
        v21.new("zeus_in_hands_color", v1051);
        events.render:set(function()
            -- upvalues: v1048 (ref), v1047 (ref), v1050 (ref), v1051 (ref)
            if v1048:get() then
                v1047:render(v1050, v1051);
            end;
        end);
    end
}):setup();
v950 = true;
zalupendra = v125.create("Anti-Aim", "features"):switch("\v\f<bolt> \r Discharge Exploit");
zalupendra:tooltip("Disables doubletap in air while enemy peeks\n\n");
v21.new("Discharge", zalupendra);
v952 = {
    DT = ui.find("aimbot", "ragebot", "main", "double tap"), 
    HS = ui.find("aimbot", "ragebot", "main", "hide shots"), 
    QP = ui.find("aimbot", "ragebot", "main", "peek assist"), 
    FakeDuck = ui.find("aimbot", "anti aim", "misc", "Fake Duck"), 
    FS = ui.find("aimbot", "anti aim", "angles", "freestanding")
};
events.createmove:set(function()
    -- upvalues: v950 (ref)
    if not v950 then
        return;
    else
        local v1052 = ui.find("aimbot", "ragebot", "main", "double tap");
        local v1053 = entity.get_local_player();
        if v1053 == nil then
            return;
        else
            if zalupendra:get() == true and not v1053:is_dormant() then
                if not v1052:get() then
                    return;
                else
                    local _ = false;
                    local v1055 = false;
                    local v1056 = v1053:get_player_weapon();
                    if v1056 == nil then
                        return;
                    else
                        local v1057 = v1056:get_classname() == "CKnife";
                        local function v1061(v1058)
                            -- upvalues: v1053 (ref)
                            local v1059, v1060 = utils.trace_bullet(v1058, v1058:get_hitbox_position(3), v1053:get_hitbox_position(3));
                            if v1059 == 0 or v1059 >= 50 or not v1060.entity or v1060.entity ~= v1053 then
                                return false;
                            else
                                return true;
                            end;
                        end;
                        if not v1057 then
                            for _, v1063 in pairs(entity.get_players(true)) do
                                if v1063 ~= v1053 and v1061(v1063) then
                                    v1055 = true;
                                end;
                            end;
                        end;
                        local function v1066(v1064, v1065)
                            return bit.band(v1064.m_fFlags, bit.lshift(1, v1065)) ~= 0;
                        end;
                        if v1055 and not v1066(v1053, 0) then
                            rage.exploit:force_teleport();
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end);
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
local v1067 = v125.create("Misc", ui.get_icon("globe") .. " UI"):switch("\v\f<message-lines>   \rConsole Modulation");
local v1068 = v1067:color_picker(color(46, 47, 62, 236));
v21.new("console_enable", v1067);
v21.new("console_color", v1068);
({
    is_visible = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)"), 
    material_names = {
        [1] = "vgui_white", 
        [2] = "vgui/hud/800corner1", 
        [3] = "vgui/hud/800corner2", 
        [4] = "vgui/hud/800corner3", 
        [5] = "vgui/hud/800corner4"
    }, 
    materials = {}, 
    update_materials = function(v1069)
        v1069.materials = {};
        for _, v1071 in ipairs(v1069.material_names) do
            local v1072 = materials.get(v1071);
            if v1072 == nil then
                v1072 = materials.get_materials(v1071)[1];
            end;
            if v1072 ~= nil and v1072.is_valid(v1072) then
                v1069.materials[v1071] = v1072;
            end;
        end;
    end, 
    setup_color = function(v1073, v1074)
        if not v1073.is_visible() then
            v1074 = color();
        end;
        if v1073.last_color == v1074 then
            return;
        else
            for _, v1076 in pairs(v1073.materials) do
                v1076:alpha_modulate(v1074.a / 255);
                v1076:color_modulate(color(v1074.r, v1074.g, v1074.b));
            end;
            v1073.last_color = v1074;
            return;
        end;
    end, 
    render = function(v1077)
        -- upvalues: v1067 (ref), v1068 (ref)
        if not v1067:get() then
            return;
        else
            v1077:setup_color((v1068:get()));
            return;
        end;
    end, 
    shutdown = function(v1078)
        v1078:setup_color(color());
    end, 
    setup = function(v1079)
        -- upvalues: v1067 (ref)
        v1079:update_materials();
        events.render:set(function()
            -- upvalues: v1079 (ref)
            v1079:render();
        end);
        events.shutdown:set(function()
            -- upvalues: v1079 (ref)
            v1079:shutdown();
        end);
        v1067:set_callback(function()
            -- upvalues: v1079 (ref)
            v1079:shutdown();
        end);
    end
}):setup();
local v1080 = v125.create("Misc", ui.get_icon("bolt") .. " functions");
local _ = nil;
local v1082 = v125.find("Aimbot", "Ragebot", "Main", "Peek Assist");
local v1083 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
local v1084 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
local v1085 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
local v1089 = {
    data = {}, 
    names = {}, 
    new = function(v1086, v1087, v1088)
        -- upvalues: v427 (ref)
        v1086.data[v1087] = v1088;
        v427.insert(v1086.names, v1087);
    end
};
v1089:new("Standing", function(v1090, _, v1092, v1093)
    return v1092.on_ground and v1093 < 2 and not v1090.in_duck;
end);
v1089:new("Crouching", function(v1094, _, v1096, _)
    return v1096.on_ground and v1094.in_duck;
end);
do
    local l_v1082_0, l_v1083_0, l_v1084_0, l_v1085_0, l_v1089_0 = v1082, v1083, v1084, v1085, v1089;
    l_v1089_0:new("Walking", function(_, _, _, _)
        -- upvalues: l_v1085_0 (ref)
        return l_v1085_0:get();
    end);
    local v1110 = {
        data = {}, 
        names = {}, 
        new = function(v1107, v1108, v1109)
            -- upvalues: v427 (ref)
            v1107.data[v1108] = v1109;
            v427.insert(v1107.names, v1108);
        end
    };
    v1110:new("Pistols", function(v1111, v1112)
        return v1112.weapon_type == 1 and v1111:get_name() ~= "Desert Eagle" and v1111:get_name() ~= "R8 Revolver";
    end);
    v1110:new("Desert Eagle", function(v1113, _)
        return v1113:get_name() == "Desert Eagle";
    end);
    v1110:new("R8 Revolver", function(v1115, _)
        return v1115:get_name() == "R8 Revolver";
    end);
    v1110:new("SSG 08", function(v1117, _)
        return v1117:get_name() == "SSG 08";
    end);
    v1110:new("Auto Snipers", function(v1119, _)
        return v1119:get_name() == "G3SG1" or v1119:get_name() == "SCAR-20";
    end);
    local v1124 = v1080:switch("\v\f<bird>   \rAuto Hide shots", false, nil, function(v1121, _)
        -- upvalues: l_v1089_0 (ref), v1110 (ref)
        local v1123 = {
            states = v1121:listable("Player State", l_v1089_0.names), 
            disable_weapons = v1121:listable("Disable Weapon", v1110.names)
        };
        v1123.disable_weapons:depend({
            [1] = v1123.states, 
            [2] = function()
                -- upvalues: v1123 (ref)
                return #v1123.states.value > 0;
            end
        });
        return v1123, true;
    end);
    v21.new("auto_hide_shots", v1124);
    v1110.get_active = function(v1125, v1126, v1127)
        -- upvalues: v1124 (ref)
        for v1128, v1129 in ipairs(v1125.names) do
            local v1130 = v1125.data[v1129];
            if v1124.disable_weapons:get(v1128) and v1130 and v1130(v1126, v1127) then
                return true;
            end;
        end;
        return false;
    end;
    l_v1089_0.get_active = function(v1131, v1132, v1133, v1134, v1135)
        -- upvalues: v1124 (ref)
        for v1136, v1137 in ipairs(v1131.names) do
            local v1138 = v1131.data[v1137];
            if v1124.states:get(v1136) and v1138 and v1138(v1132, v1133, v1134, v1135) then
                return true;
            end;
        end;
        return false;
    end;
    local function v1139()
        -- upvalues: l_v1084_0 (ref), l_v1083_0 (ref)
        l_v1084_0:override();
        l_v1083_0:override();
    end;
    local function v1146(v1140)
        -- upvalues: l_v1083_0 (ref), l_v1084_0 (ref), l_v1082_0 (ref), l_v1089_0 (ref), v1110 (ref), v1139 (ref)
        local v1141 = entity.get_local_player();
        if not v1141 then
            return;
        else
            local v1142 = v1141:get_anim_state();
            if not v1142 then
                return;
            else
                local v1143 = v1141:get_player_weapon();
                local v1144 = v1143:get_weapon_info();
                local v1145 = v1142.velocity:length();
                if l_v1083_0:get() and not l_v1084_0:get() and rage.exploit:get() == 1 and not l_v1082_0:get_override() and not l_v1082_0:get() and l_v1089_0:get_active(v1140, v1141, v1142, v1145) and not v1110:get_active(v1143, v1144) then
                    l_v1084_0:override(true);
                    l_v1083_0:override(false);
                    return;
                else
                    v1139();
                    return;
                end;
            end;
        end;
    end;
    v1124:set_callback(v1139);
    v1124:set_event("createmove", v1146);
    if false then
        events.render(function()
            -- upvalues: l_v1084_0 (ref), l_v1083_0 (ref)
            local l_text_0 = render.text;
            local v1148 = 1;
            local v1149 = vector(500, 200);
            local v1150 = color();
            local v1151 = "";
            local v1152 = "HideShots: ";
            local v1153;
            if l_v1084_0:get_override() ~= nil then
                v1153 = l_v1084_0:get_override() == true and "override on" or "override off";
            else
                v1153 = l_v1084_0:get() and "on" or "off";
            end;
            l_text_0(v1148, v1149, v1150, v1151, v1152, v1153);
            l_text_0 = render.text;
            v1148 = 1;
            v1149 = vector(500, 215);
            v1150 = color();
            v1151 = "";
            v1152 = "DoubleTap: ";
            if l_v1083_0:get_override() ~= nil then
                v1153 = l_v1083_0:get_override() == true and "override on" or "override off";
            else
                v1153 = l_v1083_0:get() and "on" or "off";
            end;
            l_text_0(v1148, v1149, v1150, v1151, v1152, v1153);
        end);
    end;
end;
v1082 = nil;
v1083 = v1080:switch("\v\f<balloons>  \rJump scout");
v21.new("jump_scout", v1083);
v1084 = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe");
v1085 = v125.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", {
    options = "Options", 
    double_tab = "Double Tap"
});
do
    local l_v1084_1, l_v1085_1, l_v1089_1 = v1084, v1085, v1089;
    l_v1089_1 = function()
        -- upvalues: l_v1084_1 (ref), l_v1085_1 (ref)
        l_v1084_1:override();
        l_v1085_1.options:override();
    end;
    v1083:set_event("createmove", function(v1157)
        -- upvalues: v950 (ref), l_v1089_1 (ref), l_v1084_1 (ref), l_v1085_1 (ref)
        if v950 == false then
            l_v1089_1();
        end;
        v950 = true;
        local v1158 = entity.get_local_player();
        if not v1158 or not v1158:is_alive() then
            return;
        else
            local v1159 = v1158:get_anim_state();
            if not v1159 then
                return;
            else
                local v1160 = v1158:get_player_weapon();
                local v1161 = v1160 ~= nil and v1160:get_name() or "nil";
                local v1162 = v1157.forwardmove + v1157.sidemove;
                local v1163 = v1157.in_jump or not v1159.on_ground;
                local v1164 = v1159.velocity:length();
                local v1165 = v1157.in_moveleft or v1157.in_moveright or v1157.in_forward or v1157.in_back or v1157.in_left or v1157.in_right;
                if v1161 ~= "SSG 08" and v1161 ~= "R8 Revolver" or not v1163 or v1165 or v1162 ~= 0 or v1164 >= 1.2 then
                    return;
                else
                    v950 = false;
                    l_v1084_1:override(false);
                    l_v1085_1.options:override({
                        [1] = "In Air"
                    });
                    return;
                end;
            end;
        end;
    end);
    v1083:set_callback(function()
        -- upvalues: l_v1089_1 (ref)
        l_v1089_1();
    end);
end;
v1083 = nil;
v1084 = {};
v1085 = {
    mute = utils.get_vfunc("client.dll", "GameClientExports001", 2, "void(__thiscall*)(void*, int playerIndex)"), 
    unmute = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int playerIndex)"), 
    is_muted = utils.get_vfunc("client.dll", "GameClientExports001", 1, "bool(__thiscall*)(void*, int playerIndex)")
};
v1089 = v1080:switch("\v\f<microphone-slash>  \rUnmute Silenced \aFFB880FF*new");
v21.new("unmute_silenced", v1089);
do
    local l_v1084_2, l_v1085_2 = v1084, v1085;
    local function v1173()
        -- upvalues: l_v1085_2 (ref), l_v1084_2 (ref)
        local v1168 = entity.get_local_player();
        if not v1168 then
            return;
        else
            entity.get_players(false, true, function(v1169)
                -- upvalues: v1168 (ref), l_v1085_2 (ref), l_v1084_2 (ref)
                if v1169 == v1168 then
                    return;
                else
                    local v1170 = v1169:get_name();
                    local v1171 = v1169:get_index();
                    local v1172 = string.format("%s::%s", v1170, v1171);
                    if l_v1085_2.is_muted(v1171) == true and l_v1084_2[v1172] == nil then
                        l_v1085_2.unmute(v1171);
                        l_v1084_2[v1172] = true;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v1175()
        -- upvalues: l_v1084_2 (ref), l_v1085_2 (ref)
        l_v1084_2 = {};
        entity.get_players(false, true, function(v1174)
            -- upvalues: l_v1085_2 (ref)
            l_v1085_2.unmute(v1174:get_index());
        end);
    end;
    events.shutdown(v1175);
    events.level_init(v1175);
    v1089:set_event("render", v1173);
    v1089:set_callback(v1175);
end;
v1084 = nil;
v1085 = v1080:switch("\v\f<shield-halved> \r  Dormant Aimbot", false, nil, function(v1176)
    return {
        min_damage = v1176:slider("Min. Damage", 0, 100, 20), 
        min_inaccuracy = v1176:slider("Hitchance", 0, 100, 80, 1, "%")
    };
end);
v21.new("dormant_aimbot", v1085);
v1085:tooltip("\aFF7E7EEE\f<triangle-exclamation> \rDo not use this with other enabled dormant aimbot.");
v1089 = function(v1177, v1178)
    local v1179 = math.sqrt(v1177.forwardmove * v1177.forwardmove + v1177.sidemove * v1177.sidemove);
    if v1178 <= 0 or v1179 <= 0 then
        return;
    else
        if v1177.in_duck then
            v1178 = v1178 * 2.94117647;
        end;
        if v1179 <= v1178 then
            return;
        else
            local v1180 = v1178 / v1179;
            v1177.forwardmove = v1177.forwardmove * v1180;
            v1177.sidemove = v1177.sidemove * v1180;
            return;
        end;
    end;
end;
local v1181 = {
    [1] = "100% info", 
    [2] = "updated by shared esp", 
    [3] = "updated by sounds", 
    [4] = "not updated", 
    [5] = "data is unavailable or too old"
};
do
    local l_v1085_3, l_v1089_2, l_v1181_0 = v1085, v1089, v1181;
    local function v1197(v1185)
        -- upvalues: l_v1085_3 (ref), l_v1181_0 (ref)
        local v1186 = entity.get_players(true, true);
        local v1187 = v1185:get_eye_position();
        local v1188 = nil;
        for _, v1190 in pairs(v1186) do
            local v1191 = v1190:get_network_state();
            local v1192 = v1190:get_bbox();
            if v1190:is_alive() and v1190:is_dormant() and v1191 ~= 0 and v1192.alpha > 0 then
                local v1193 = v1190:get_origin() + vector(0, 0, 35) + vector(utils.random_float(-7, 7), utils.random_float(-7, 7), utils.random_float(-10, 25));
                local v1195, _ = utils.trace_bullet(v1185, v1187, v1193, function(v1194)
                    return v1194:is_player() and v1194:is_enemy();
                end);
                if l_v1085_3.min_damage.value <= v1195 then
                    v1188 = {
                        player = v1190, 
                        damage = v1195, 
                        angles = v1187:to(v1193):angles(), 
                        network_state = l_v1181_0[v1191] or v1191
                    };
                end;
            end;
        end;
        return v1188;
    end;
    local v1198 = {};
    local function v1208(v1199)
        -- upvalues: v1197 (ref), l_v1089_2 (ref), l_v1085_3 (ref), v1198 (ref)
        local v1200 = entity.get_local_player();
        if not v1200 or not v1200:is_alive() then
            return;
        elseif not v1200:get_anim_state().on_ground or v1199.in_jump then
            return;
        else
            local v1201 = v1200:get_player_weapon();
            if not v1201 then
                return;
            else
                local v1202 = 0;
                local v1203 = 1 / v1201:get_inaccuracy();
                v1202 = math.clamp(v1203, 0, 666);
                v1203 = v1201:get_weapon_info();
                if v1203.bullets < 1 then
                    return;
                else
                    local v1204 = v1203.weapon_type == 5;
                    local v1205 = false;
                    if v1204 or v1203.is_revolver then
                        v1205 = globals.curtime + 0.3 > v1200.m_flNextAttack and globals.curtime + 0.3 > v1201.m_flNextPrimaryAttack;
                    end;
                    if not v1205 then
                        return;
                    else
                        local v1206 = v1197(v1200);
                        if not v1206 then
                            return;
                        else
                            if v1204 and not v1200.m_bIsScoped then
                                v1199.in_attack2 = true;
                            end;
                            l_v1089_2(v1199, (v1200.m_bIsScoped and v1203.max_player_speed_alt or v1203.max_player_speed) * 0.1);
                            if v1202 < l_v1085_3.min_inaccuracy.value then
                                return;
                            else
                                local v1207 = v1200.m_aimPunchAngle * cvar.weapon_recoil_scale:float();
                                v1199.view_angles = v1206.angles - v1207;
                                v1199.in_attack = true;
                                v1198[math.floor(globals.realtime)] = v1206;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local v1209 = 0;
    events.aim_fire(function()
        -- upvalues: v1209 (ref)
        v1209 = math.floor(globals.realtime);
    end);
    local function v1212(v1210, ...)
        local v1211 = string.format(v1210, ...);
        print_dev(v1211);
        print_raw(v1211);
    end;
    events.weapon_fire(function(v1213)
        -- upvalues: v1209 (ref), v1198 (ref), v1212 (ref)
        if entity.get(v1213.userid, true) ~= entity.get_local_player() or v1209 == math.floor(globals.realtime) then
            return;
        else
            local v1214 = v1198[math.floor(globals.realtime)];
            if not v1214 then
                return;
            else
                v1212("\a97B33111dormant shot in %s for pred. damage: %i | network state: %s", v1214.player:get_name(), v1214.damage, v1214.network_state);
                return;
            end;
        end;
    end);
    l_v1085_3:set_event("createmove", v1208);
end;
weapons = require("neverlose/csgo_weapons");
weaponswitcher = v125.create("Misc", ui.get_icon("bolt") .. " functions"):switch(v125.string("\v\f<gun> \r  Force Revolver"));
v21.new("weaponswitcher", weaponswitcher);
v1085 = panorama.LoadoutAPI;
v1089 = panorama.InventoryAPI;
v1181 = weapons.weapon_revolver.idx;
local l_idx_0 = weapons.weapon_deagle.idx;
local function v1223()
    -- upvalues: v1085 (ref), v1089 (ref), v1181 (ref), l_idx_0 (ref)
    local l_m_totalRoundsPlayed_0 = entity.get_game_rules().m_totalRoundsPlayed;
    local v1217 = cvar.game_mode:int() == 2 and (not (l_m_totalRoundsPlayed_0 ~= 0) or not (l_m_totalRoundsPlayed_0 ~= 8)) or l_m_totalRoundsPlayed_0 == 0 or l_m_totalRoundsPlayed_0 == 15;
    for _, v1219 in pairs({
        [1] = "ct", 
        [2] = "t"
    }) do
        local v1220 = v1085.GetItemID(v1219, "secondary4");
        if v1217 and v1089.GetItemDefinitionIndex(v1220) ~= v1181 then
            local v1221 = v1089.GetFauxItemIDFromDefAndPaintIndex(v1181);
            v1085.EquipItemInSlot(v1219, v1221, "secondary4");
        elseif not v1217 and v1089.GetItemDefinitionIndex(v1220) ~= l_idx_0 then
            local v1222 = v1089.GetFauxItemIDFromDefAndPaintIndex(l_idx_0);
            v1085.EquipItemInSlot(v1219, v1222, "secondary4");
        end;
    end;
end;
weaponswitcher:tooltip("\aFF7E7EEE\f<triangle-exclamation> \rThis function may \aFF7E7EEEdisable \rrevolver shoot,so \aFF7E7EEEdont enable it \rwhen changing team sides. \nAlso, the weapon \aFF7E7EEEwon't change \rif theres no \vinventory avaible\r \n\nReplaces \a{Link Active}deagle \aDEFAULTweapon to \a{Link Active}revolver \aDEFAULTin \a{Link Active}pistol round\aDEFAULT.\nAfter round = \a{Link Active}replaces \aDEFAULTto \a{Link Active}deagle\aDEFAULT");
events.enter_buyzone:set(function()
    -- upvalues: v1223 (ref)
    if weaponswitcher:get() then
        v1223();
    end;
end);
events.level_init:set(function()
    -- upvalues: v1223 (ref)
    if weaponswitcher:get() then
        v1223();
    end;
end);
local v1224 = render.screen_size();
local v1225 = {
    data = {}
};
v1225.lerp = function(v1226, v1227, v1228)
    -- upvalues: v1225 (ref)
    if v1228 == nil then
        v1228 = 0.09;
    end;
    if type(v1226) == "userdata" then
        local v1229 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0
        };
        for v1230, v1231 in ipairs({
            [1] = "r", 
            [2] = "g", 
            [3] = "b", 
            [4] = "a"
        }) do
            v1229[v1230] = v1225.lerp(v1226[v1231], v1227[v1231], v1228);
        end;
        return color(unpack(v1229));
    else
        return (v1227 - v1226) * v1228 + v1226;
    end;
end;
v1225.new = function(v1232, v1233, v1234)
    -- upvalues: v1225 (ref)
    if v1225.data[v1232] == nil then
        v1225.data[v1232] = v1233;
    end;
    v1225.data[v1232] = v1225.lerp(v1225.data[v1232], v1233, v1234);
    return v1225.data[v1232];
end;
local v1244 = {
    is_any = false, 
    lib = l_system_0, 
    group = v125.create("drag items"), 
    new = function(v1235, v1236, v1237, v1238, v1239)
        -- upvalues: v1224 (ref), v21 (ref)
        local v1240 = v1235.group:slider(v1238 .. "x", 0, v1224.x, v1236.x);
        local v1241 = v1235.group:slider(v1238 .. "y", 0, v1224.y, v1236.y);
        v21.new(v1238 .. "x.drag", v1240);
        v21.new(v1238 .. "y.drag", v1241);
        v1240:visibility(false);
        v1241:visibility(false);
        local v1243 = v1235.lib.register({
            [1] = v1240, 
            [2] = v1241
        }, v1237, v1238, function(v1242)
            -- upvalues: v1239 (ref)
            v1239(v1242);
        end);
        return function()
            -- upvalues: v1243 (ref), v1235 (ref)
            v1243:update();
            v1235.is_any = v1243:is_in_area(ui.get_mouse_position());
        end;
    end
};
events.mouse_input:set(function()
    -- upvalues: v1244 (ref)
    if v1244.is_any and ui.get_alpha() > 0 then
        return false;
    else
        return;
    end;
end);
local v1245 = {
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
};
local v1246 = v125.create("Misc", ui.get_icon("palette") .. " Visuals"):switch("\v\f<virus>  \rDefensive Indicator");
local v1247 = v1246:color_picker(color());
v21.new("bar_enable", v1246);
v21.new("bar_color", v1247);
({
    state = false, 
    ticks = 0, 
    time_to_ticks = function(_, v1249)
        return math.floor(0.5 + v1249 / globals.tickinterval);
    end, 
    update_state = function(v1250)
        local v1251 = entity.get_local_player();
        if v1251 == nil then
            return;
        else
            local v1252 = v1251:get_simulation_time();
            local v1253 = v1250:time_to_ticks(v1252.current - v1252.old);
            local v1254 = false;
            v1250.state = v1253 < 0;
            if v1250.state then
                v1254 = true;
            end;
            if v1254 then
                v1250.ticks = v1250.ticks + 1;
            end;
            if v1250.ticks >= 20 then
                v1254 = false;
                v1250.ticks = 0;
            end;
            return;
        end;
    end, 
    in_area = function(_, v1256, v1257)
        local v1258 = ui.get_mouse_position();
        return v1258.x >= v1256.x and v1258.x <= v1257.x and v1258.y >= v1256.y and v1258.y <= v1257.y;
    end, 
    render = function(v1259)
        -- upvalues: v1244 (ref), v1224 (ref), v1225 (ref), v1245 (ref), v1246 (ref), v1247 (ref)
        local v1266 = v1244:new(vector(v1224.x / 2 - 67.5, v1224.y / 5), vector(135, 35), "defensive_ind", function(v1260)
            -- upvalues: v1225 (ref), v1245 (ref), v1259 (ref), v1246 (ref), v1247 (ref), v1224 (ref)
            local v1261 = entity.get_local_player();
            if not v1261 then
                return;
            else
                local _ = v1225.new("m_flVelocityModifier", ui.get_alpha() > 0 and v1261.m_flVelocityModifier == 1 and 0.5 or v1261:is_alive() and v1261.m_flVelocityModifier or 1);
                local l_new_0 = v1225.new;
                local v1264 = "m_flDefensiveModifier";
                local v1265;
                if ui.get_alpha() > 0 and not v1245.doubletap:get() then
                    v1265 = 1;
                else
                    v1265 = v1259.state and 0 or 1;
                end;
                l_new_0 = l_new_0(v1264, v1265);
                v1264 = {
                    drag = v1225.new("anim_drag", v1246:get() and ui.get_alpha() > 0.5 and 255 or 0), 
                    defensive = v1225.new("defensive_indication", v1246:get() and (v1245.doubletap:get() or ui.get_alpha() > 0.5) and 255 or 0)
                };
                v1265 = v1247:get();
                if v1264.defensive > 1 then
                    render.text(1, vector(v1260.position.x + 15, v1260.position.y + 5), color(255, v1264.defensive), nil, ("- defensive  \a%s%s \aDEFAULT-"):format(v1265:to_hex(), v1259.state and "active" or "ready"));
                    render.shadow(vector(v1260.position.x + 4, v1260.position.y + 19), vector(v1260.position.x + 126, v1260.position.y + 23), color(v1265.r, v1265.g, v1265.b, v1264.defensive), 20, 0);
                    render.rect(vector(v1260.position.x + 4, v1260.position.y + 19), vector(v1260.position.x + 126, v1260.position.y + 23), color(0, v1264.defensive / 2), 2);
                    render.rect(vector(v1260.position.x + 5, v1260.position.y + 20), vector(v1260.position.x + l_new_0 * 120 + 5, v1260.position.y + 22), color(v1265.r, v1265.g, v1265.b, v1264.defensive), 2);
                end;
                if v1264.defensive > 1 then
                    v1264.menu = v1225.new("defensive_indication_menu", v1246:get() and ui.get_alpha() > 0.5 and 255 or 0);
                    if v1264.menu > 1 then
                        render.rect_outline(v1260.position - 5, v1260.position + v1260.size, color(255, v1264.menu), 1, 5);
                        render.text(1, vector(v1260.position.x, v1260.position.y + v1260.size.y + 5), color(255, v1264.menu), nil, "Press M2 to center.");
                    end;
                    if common.is_button_down(2) and v1259:in_area(v1260.position, v1260.position + v1260.size + 10) then
                        v1260.position.x = v1224.x / 2 - v1260.size.x / 2;
                    end;
                end;
                return;
            end;
        end);
        events.render:set(v1266);
    end, 
    setup = function(v1267)
        events.createmove:set(function(_)
            -- upvalues: v1267 (ref)
            v1267:update_state();
        end);
        v1267:render();
    end
}):setup();
local v1269 = v125.create("Misc", ui.get_icon("globe") .. " UI"):switch("\v\f<fire-flame-curved> \r   Molotov Radius", false);
local v1270 = v1269:create():color_picker("Molotov Color", color(255, 63, 63, 190));
local v1271 = v125.create("Misc", ui.get_icon("globe") .. " UI"):switch("\v\f<smoke> \r Smoke Radius", false);
local v1272 = v1271:create():color_picker("Smoke Color", color(61, 147, 250, 180));
v21.new("en_molotov", v1269);
v21.new("en_molotov_color", v1270);
v21.new("en_smoke", v1271);
v21.new("en_smoke_color", v1272);
events.render:set(function()
    -- upvalues: v1269 (ref), v427 (ref), v1270 (ref), v1271 (ref), v1272 (ref)
    if not entity.get_local_player() then
        return;
    else
        local function v1275(v1273, v1274)
            return math.sqrt((v1274.x - v1273.x) ^ 2 + (v1274.y - v1273.y) ^ 2);
        end;
        local function v1279(v1276, v1277, v1278)
            return vector((v1277.x - v1276.x) * v1278 + v1276.x, (v1277.y - v1276.y) * v1278 + v1276.y, (v1277.z - v1276.z) * v1278 + v1276.z);
        end;
        local v1280 = 17.55;
        local v1281 = 125;
        if v1269:get() then
            local _ = molotov_at;
            molotov_at = {};
            local v1283 = entity.get_entities("CInferno");
            for v1284 = 1, #v1283 do
                local v1285 = v1283[v1284];
                local v1286 = v1285:get_origin();
                local v1287 = 40;
                local _ = 0;
                local v1289 = {};
                local v1290 = 0;
                local v1291 = nil;
                local v1292 = nil;
                local v1293 = v1283[v1284];
                for v1294 = 1, 64 do
                    if v1293.m_bFireIsBurning[v1294] == true then
                        v427.insert(v1289, vector(v1285.m_fireXDelta[v1294], v1285.m_fireYDelta[v1294], v1285.m_fireZDelta[v1294]));
                    end;
                end;
                for v1295 = 1, #v1289 do
                    for v1296 = 1, #v1289 do
                        local v1297 = v1275(v1289[v1295], v1289[v1296]);
                        if v1290 < v1297 then
                            v1290 = v1297;
                            v1291 = v1289[v1295];
                            v1292 = v1289[v1296];
                        end;
                    end;
                end;
                if v1291 ~= nil and v1292 ~= nil then
                    local v1298 = v1286 + v1279(v1291, v1292, 0.5);
                    render.circle_3d_outline(v1298, color(v1270:get().r, v1270:get().g, v1270:get().b, 255), v1290 / 2 + v1287, 0, 1, 1);
                end;
            end;
        end;
        if v1271:get() then
            local l_tickcount_0 = globals.tickcount;
            local l_tickinterval_0 = globals.tickinterval;
            local _ = globals.curtime;
            local v1302 = entity.get_entities("CSmokeGrenadeProjectile");
            for v1303 = 1, #v1302 do
                local v1304 = v1302[v1303];
                local v1305 = v1304:get_classname();
                local v1306 = 1;
                if v1305 == "CSmokeGrenadeProjectile" and v1304.m_bDidSmokeEffect == true then
                    local l_m_nSmokeEffectTickBegin_0 = v1304.m_nSmokeEffectTickBegin;
                    if l_m_nSmokeEffectTickBegin_0 ~= nil then
                        local v1308 = l_tickinterval_0 * (l_tickcount_0 - l_m_nSmokeEffectTickBegin_0);
                        if v1308 > 0 and v1280 - v1308 > 0 then
                            if grenade_timer then
                                v1306 = 1 - v1308 / v1280;
                            end;
                            if v1271:get() then
                                local l_r_2 = v1272:get().r;
                                local l_g_2 = v1272:get().g;
                                local l_b_2 = v1272:get().b;
                                local l_a_2 = v1272:get().a;
                                local l_v1281_0 = v1281;
                                if v1308 < 0.3 then
                                    l_v1281_0 = l_v1281_0 * 0.6 + l_v1281_0 * (v1308 / 0.3) * 0.4;
                                    l_a_2 = l_a_2 * (v1308 / 0.3);
                                end;
                                if v1280 - v1308 < 1 then
                                    l_v1281_0 = l_v1281_0 * ((v1280 - v1308) / 1 * 0.3 + 0.7);
                                end;
                                render.circle_3d_outline(v1304:get_origin(), color(l_r_2, l_g_2, l_b_2, l_a_2 * math.min(1, v1306 * 1.3)), l_v1281_0, 0, 1);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end);
local _ = nil;
local v1315 = v125.create("Misc", ui.get_icon("bolt") .. " functions"):combo("\v\f<arrows-maximize> \r   Watermark Placement", {
    [1] = "Top right", 
    [2] = "Bottom center"
});
v21.new("watermark_corner", v1315);
local v1316 = render.screen_size();
do
    local l_v1315_0, l_v1316_0 = v1315, v1316;
    local function v1325()
        -- upvalues: l_v1316_0 (ref)
        local v1319 = 1;
        local v1320 = "warpaith";
        local v1321 = render.measure_text(v1319, nil, v1320);
        local v1322 = vector(l_v1316_0.x, 0);
        local v1323 = vector(5, 5);
        local v1324 = vector(v1321.x, v1321.y);
        render.gradient(vector(v1322.x - v1324.x - v1323.x, 0), vector(v1322.x, v1322.y + v1324.y + v1323.y), color(0, 0), color(0, 150), color(0, 0), color(0, 150));
        render.text(v1319, vector(v1322.x - v1321.x - v1323.x, v1322.y + v1323.y / 2), color(), nil, v1320);
    end;
    local function v1330()
        -- upvalues: l_v1316_0 (ref)
        local v1326 = 2;
        local v1327 = "WARPAITH";
        local _ = render.measure_text(v1326, nil, v1327);
        local v1329 = vector(l_v1316_0.x / 2, l_v1316_0.y - 40);
        render.text(v1326, v1329, color(), "c", v1327);
    end;
    local function v1332()
        -- upvalues: l_v1315_0 (ref), v1325 (ref), v1330 (ref)
        local v1331 = l_v1315_0:get();
        if v1331 == "Top right" then
            v1325();
        end;
        if v1331 == "Bottom center" then
            v1330();
        end;
    end;
    events.render(v1332);
end;
local v1333 = v125.create("Misc", ui.get_icon("globe") .. " Misc");
v1315 = {};
v1316 = {};
v1316 = render.screen_size();
local v1334 = v1333:switch("\aFFFFFFFFG\vS \r Spectator List", false);
v21.new("skeet_spects", v1334);
v1315.font = render.load_font("Calibri", 23, "bda");
v1315.spectators_get = function()
    -- upvalues: v427 (ref)
    local v1335 = {};
    local v1336, v1337 = entity.get_local_player();
    if v1336 ~= nil then
        if v1336.m_hObserverTarget then
            v1337 = v1336.m_hObserverTarget;
        else
            v1337 = v1336;
        end;
        local v1338 = entity.get_players(false, false);
        if v1338 ~= nil then
            for _, v1340 in pairs(v1338) do
                local l_m_hObserverTarget_0 = v1340.m_hObserverTarget;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v1337 then
                    v427.insert(v1335, v1340);
                end;
            end;
        end;
    end;
    return v1335;
end;
v1315.spectators = function()
    -- upvalues: v1334 (ref), v21 (ref), v1315 (ref), v844 (ref), v842 (ref), v1316 (ref)
    if not v1334:get() then
        return;
    else
        local v1342 = v21.get("watermark_corner");
        local v1343 = 14;
        local v1344 = v1315.spectators_get();
        for _, v1346 in pairs(v1344) do
            local v1347 = v1346:get_name();
            local l_x_7 = render.measure_text(1, nil, v1347).x;
            if not v844.main.features:get("Watermark") and v1342:get() == "Bottom center" or not v842.main.enable:get() and v1342:get() == "Bottom center" then
                render.text(1, vector(v1316.x - l_x_7 - 2, -11 + v1343), color(255), nil, v1347);
            elseif v1342:get() == "Top right" and not v844.main.features:get("Watermark") or not v842.main.enable:get() and v1342:get() == "Top right" then
                render.text(1, vector(v1316.x - l_x_7 - 2, 2 + v1343), color(255), nil, v1347);
            else
                render.text(1, vector(v1316.x - l_x_7 - 2, 32 + v1343), color(255), nil, v1347);
            end;
            v1343 = v1343 + 17;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v1315 (ref)
    v1315.spectators();
end);
local v1349 = nil;
local v1350 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
do
    local l_v1350_0 = v1350;
    local function v1354()
        -- upvalues: l_v1350_0 (ref)
        for _, v1353 in ipairs(ui.get_binds()) do
            if v1353.reference:id() == l_v1350_0:id() and v1353.active then
                return true;
            end;
        end;
        return false;
    end;
    local v1355 = render.screen_size() * 0.5;
    local v1357 = v125.switch({
        [1] = "Misc", 
        [2] = ui.get_icon("globe") .. " Misc"
    }, "\v\f<hundred-points>  \rDamage Indicator", false, nil, function(v1356)
        return {
            hide_inactive = v1356:switch("Hide On Inactive"), 
            x = v1356:slider("x", -30, 30, 6), 
            y = v1356:slider("y", -30, 30, -15)
        }, true;
    end);
    v21.new("damage_indicator", v1357);
    v1349 = function()
        -- upvalues: v1357 (ref), v1354 (ref), l_v1350_0 (ref), v1355 (ref)
        if not v1357:get() then
            return;
        elseif not v1354() and v1357.hide_inactive:get() then
            return;
        else
            local v1358 = entity.get_local_player();
            if not v1358 or not v1358:is_alive() then
                return;
            else
                local v1359 = l_v1350_0:get_override() or l_v1350_0:get();
                if v1359 == 0 then
                    v1359 = "A";
                end;
                local v1360 = vector(v1355.x + v1357.x:get(), v1355.y + v1357.y:get());
                render.text(1, v1360, color(), nil, tostring(v1359));
                return;
            end;
        end;
    end;
end;
events.render(v1349);
v1350 = nil;
local v1361 = v125.create("Misc", ui.get_icon("globe") .. " UI"):switch("\v\f<microsoft>    \rLagcomp box", false, nil, {
    [1] = nil, 
    [2] = true, 
    [1] = color(47, 117, 255, 221)
});
v21.new("debug_box", v1361);
local v1362 = {};
local v1363 = {};
local l_sv_gravity_0 = cvar.sv_gravity;
local function v1366(v1365)
    return math.floor(0.5 + v1365 / globals.tickinterval);
end;
do
    local l_v1361_0, l_v1362_0, l_v1363_0, l_l_sv_gravity_0_0, l_v1366_0 = v1361, v1362, v1363, l_sv_gravity_0, v1366;
    local function v1379(v1372, v1373, v1374)
        -- upvalues: l_l_sv_gravity_0_0 (ref)
        local v1375 = bit.band(v1373, 1) == 0 and -l_l_sv_gravity_0_0:float() or 0;
        local l_m_vecVelocity_0 = v1372.m_vecVelocity;
        local v1377 = v1372:get_origin();
        local v1378 = v1377 + vector(l_m_vecVelocity_0.x * v1374 * globals.tickinterval, l_m_vecVelocity_0.y * v1374 * globals.tickinterval, l_m_vecVelocity_0.z * v1374 * globals.tickinterval + v1375 * (v1374 * globals.tickinterval * v1374 * globals.tickinterval) / 2);
        return utils.trace_line(v1377, v1378, v1372, 1).end_pos;
    end;
    local function v1389(v1380)
        -- upvalues: l_v1362_0 (ref), l_v1363_0 (ref), l_v1366_0 (ref), v1379 (ref)
        if not entity.get_local_player() then
            return;
        elseif not v1380:is_enemy() then
            return;
        else
            local v1381 = v1380:get_index();
            if v1380:is_dormant() then
                l_v1362_0[v1381] = nil;
                l_v1363_0[v1381] = nil;
            else
                local v1382 = l_v1363_0[v1381];
                local v1383 = l_v1366_0(v1380.m_flSimulationTime);
                local v1384 = v1380:get_origin();
                if v1382 then
                    local v1385 = v1383 - v1382.sim_time;
                    if v1385 ~= 0 then
                        local l_m_fFlags_0 = v1380.m_fFlags;
                        local v1387 = (v1382.origin - v1384):lengthsqr();
                        local v1388 = v1379(v1380, l_m_fFlags_0, v1385 - 1);
                        l_v1362_0[v1381] = {
                            player = v1380, 
                            delta = v1385, 
                            origin = v1384, 
                            extrapolated = v1388, 
                            lagcomp = v1387 > 4096, 
                            shifting = v1385 < 0
                        };
                    end;
                end;
                l_v1363_0[v1381] = {
                    sim_time = v1383, 
                    origin = v1384
                };
            end;
            return;
        end;
    end;
    events.post_update_clientside_animation(v1389);
    local v1390 = {
        [1] = {
            [1] = 0, 
            [2] = 1
        }, 
        [2] = {
            [1] = 1, 
            [2] = 2
        }, 
        [3] = {
            [1] = 2, 
            [2] = 3
        }, 
        [4] = {
            [1] = 3, 
            [2] = 0
        }, 
        [5] = {
            [1] = 5, 
            [2] = 6
        }, 
        [6] = {
            [1] = 6, 
            [2] = 7
        }, 
        [7] = {
            [1] = 1, 
            [2] = 4
        }, 
        [8] = {
            [1] = 4, 
            [2] = 8
        }, 
        [9] = {
            [1] = 0, 
            [2] = 4
        }, 
        [10] = {
            [1] = 1, 
            [2] = 5
        }, 
        [11] = {
            [1] = 2, 
            [2] = 6
        }, 
        [12] = {
            [1] = 3, 
            [2] = 7
        }, 
        [13] = {
            [1] = 5, 
            [2] = 8
        }, 
        [14] = {
            [1] = 7, 
            [2] = 8
        }, 
        [15] = {
            [1] = 3, 
            [2] = 4
        }
    };
    local function v1403()
        -- upvalues: l_v1361_0 (ref), l_v1362_0 (ref), v1390 (ref)
        if not l_v1361_0:get() then
            return;
        elseif not entity.get_local_player() then
            return;
        else
            for _, v1392 in pairs(l_v1362_0) do
                if v1392 and v1392.lagcomp and v1392.player and v1392.player:is_alive() and not v1392.player:is_dormant() then
                    local v1393 = v1392.player.m_vecMins + v1392.extrapolated;
                    local v1394 = v1392.player.m_vecMaxs + v1392.extrapolated;
                    local v1395 = {
                        v1393, 
                        vector(v1393.x, v1394.y, v1393.z), 
                        vector(v1394.x, v1394.y, v1393.z), 
                        vector(v1394.x, v1393.y, v1393.z), 
                        vector(v1393.x, v1393.y, v1394.z), 
                        vector(v1393.x, v1394.y, v1394.z), 
                        v1394, 
                        vector(v1394.x, v1393.y, v1394.z)
                    };
                    for v1396, v1397 in pairs(v1390) do
                        if v1396 == 1 then
                            local l_origin_0 = v1392.origin;
                            local v1399 = render.world_to_screen(l_origin_0);
                            local v1400 = render.world_to_screen(v1393);
                            if v1399 ~= nil and v1399.x ~= nil and v1400 ~= nil and v1400.x ~= nil then
                                render.line(v1399, v1400, l_v1361_0.color.value);
                            end;
                        end;
                        if v1395[v1397[1]] ~= nil and v1395[v1397[2]] ~= nil then
                            local v1401 = render.world_to_screen(v1395[v1397[1]]);
                            local v1402 = render.world_to_screen(v1395[v1397[2]]);
                            render.line(v1401, v1402, l_v1361_0.color.value);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    local v1406 = {
        [1] = "Lag comp", 
        [2] = "LAG COMP BREAKER", 
        [3] = function(v1404)
            -- upvalues: l_v1362_0 (ref)
            local v1405 = v1404:get_index();
            if not l_v1362_0[v1405] then
                return;
            elseif l_v1362_0[v1405].lagcomp then
                return "LAG COMP BREAKER";
            elseif l_v1362_0[v1405].shifting then
                return "SHIFTING TICKBASE";
            else
                return;
            end;
        end
    };
    esp.enemy:new_text(unpack(v1406));
    events.render(v1403);
    events.round_start(function()
        -- upvalues: l_v1362_0 (ref)
        l_v1362_0 = {};
    end);
end;
local v1407 = {};
v1361 = render.screen_size();
v1407.enable = v125.create("Misc", "\f<globe> Misc"):switch("\v\f<diamond-exclamation>  \rThreat Alert");
v1407.offset = v1407.enable:create():slider("Offset", 0, v1361.y / 2, v1361.y * 0.25);
v21.new("threat.enable", v1407.enable);
v21.new("threat.offset", v1407.offset);
v1407.enable:tooltip(" Detects when we are hittible by the enemy, when it detects that we are at risk it displays an alert.");
v1363 = {
    default = color(), 
    threating = color(227, 134, 2)
};
do
    local l_v1363_1, l_l_sv_gravity_0_1, l_v1366_1 = v1363, l_sv_gravity_0, v1366;
    l_l_sv_gravity_0_1 = function()
        -- upvalues: l_v1363_1 (ref)
        return entity.get_threat(true) and l_v1363_1.threating or l_v1363_1.default;
    end;
    l_v1366_1 = function()
        local v1411 = rage.exploit:get();
        if entity.get_threat(true) then
            return "-threat-";
        elseif v1411 < 1 and v1411 > 0 then
            return "-charging-";
        else
            return "-safe-";
        end;
    end;
    local v1412 = vector(v1361.x * 0.5, v1361.y * 0.237);
    local v1413 = vector(84, 6);
    local v1414 = 2;
    local function v1421()
        -- upvalues: v1407 (ref), v1412 (ref), l_v1366_1 (ref), v1414 (ref), l_l_sv_gravity_0_1 (ref), v1413 (ref)
        if not v1407.enable:get() then
            return;
        else
            local v1415 = entity.get_local_player();
            if (not v1415 or not v1415:is_alive()) and ui.get_alpha() <= 0 then
                return;
            else
                v1412.y = v1407.offset:get();
                local v1416 = l_v1366_1():upper();
                local v1417 = render.measure_text(v1414, "", v1416);
                local v1418 = l_l_sv_gravity_0_1();
                render.text(v1414, vector(v1412.x - v1417.x / 2, v1412.y), v1418, "", v1416);
                local v1419 = vector(v1412.x - v1413.x / 2, v1412.y + 15);
                render.rect(v1419, v1419 + v1413, color(0, 110));
                render.rect(v1419 + 2, v1419 + 2 + (v1413 - 4), color(0, 110));
                local v1420 = vector((v1413.x - 4) * (rage.antiaim:get_max_desync() / 58), 2);
                render.rect(v1419 + 2, v1419 + 2 + v1420, v1418);
                return;
            end;
        end;
    end;
    events.render(v1421);
end;
v1361 = nil;
v1362 = v125.create("Misc", ui.get_icon("globe") .. " Misc"):switch("\v\f<hands-asl-interpreting>  \rFast Ladder");
v21.new("fast_ladder", v1362);
do
    local l_v1362_1 = v1362;
    v1363 = function(v1423)
        -- upvalues: l_v1362_1 (ref)
        if not l_v1362_1:get() then
            return;
        else
            if entity.get_local_player().m_MoveType == 9 then
                v1423.view_angles.y = math.floor(v1423.view_angles.y + 0.5);
                v1423.roll = 0;
                if v1423.forwardmove == 0 and v1423.sidemove ~= 0 then
                    v1423.view_angles.x = 89;
                    v1423.view_angles.y = v1423.view_angles.y + 180;
                    if v1423.sidemove < 0 then
                        v1423.in_moveleft = 0;
                        v1423.in_moveright = 1;
                    end;
                    if v1423.sidemove > 0 then
                        v1423.in_moveleft = 1;
                        v1423.in_moveright = 0;
                    end;
                end;
                if v1423.forwardmove > 0 then
                    v1423.view_angles.x = 89;
                    v1423.in_moveright = 1;
                    v1423.in_moveleft = 0;
                    v1423.in_forward = 0;
                    v1423.in_back = 1;
                    if v1423.sidemove == 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 90;
                    end;
                    if v1423.sidemove < 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 150;
                    end;
                    if v1423.sidemove > 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 30;
                    end;
                end;
                if v1423.forwardmove < 0 then
                    v1423.view_angles.x = 89;
                    v1423.in_moveleft = 1;
                    v1423.in_moveright = 0;
                    v1423.in_forward = 1;
                    v1423.in_back = 0;
                    if v1423.sidemove == 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 90;
                    end;
                    if v1423.sidemove > 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 150;
                    end;
                    if v1423.sidemove < 0 then
                        v1423.view_angles.y = v1423.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end;
    events.createmove(v1363);
end;
v1362 = nil;
l_sv_gravity_0 = v125.create("Misc", ui.get_icon("globe") .. " UI"):switch("\v\f<bat>   \rKeep Model transparency");
v21.new("keep_scoped", l_sv_gravity_0);
v1366 = l_smoothy_0.new(255);
do
    local l_v1366_2 = v1366;
    local function v1429(v1425)
        -- upvalues: l_v1366_2 (ref)
        local v1426 = entity.get_local_player();
        local v1427 = v1426.m_bResumeZoom or v1426.m_bIsScoped;
        local l_v1425_0 = v1425;
        if v1427 then
            l_v1425_0 = 59;
        end;
        return l_v1366_2(0.07, l_v1425_0);
    end;
    l_sv_gravity_0:tooltip("A \aC1F682FFgamesense \aDEFAULTfeature that every warpaith user jerks off to. \n\nKeeps the local player model transparent after shooting with bolt-action sniper rifles and adds can extra fade-in/out animation.\n");
    l_sv_gravity_0:set_event("localplayer_transparency", v1429);
end;
v1363 = nil;
v1366 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):create():slider("Process Ticks", 9, 32, 0, 1, function(v1430)
    return v1430 == 9 and "Default" or v1430;
end);
v21.new("double_tap_ticks", v1366);
local l_sv_maxusrcmdprocessticks_0 = cvar.sv_maxusrcmdprocessticks;
local v1432 = l_sv_maxusrcmdprocessticks_0:int();
do
    local l_v1366_3, l_l_sv_maxusrcmdprocessticks_0_0, l_v1432_0 = v1366, l_sv_maxusrcmdprocessticks_0, v1432;
    local function v1437()
        -- upvalues: l_v1366_3 (ref), l_v1432_0 (ref), l_l_sv_maxusrcmdprocessticks_0_0 (ref)
        local v1436 = l_v1366_3:get() == 9 and l_v1432_0 or l_v1366_3:get();
        if l_l_sv_maxusrcmdprocessticks_0_0:int() ~= v1436 then
            l_l_sv_maxusrcmdprocessticks_0_0:int(v1436);
        end;
    end;
    local function v1438()
        -- upvalues: l_l_sv_maxusrcmdprocessticks_0_0 (ref), l_v1432_0 (ref)
        l_l_sv_maxusrcmdprocessticks_0_0:int(l_v1432_0);
    end;
    events.shutdown(v1438);
    events.createmove(v1437);
end;
l_sv_gravity_0 = require("neverlose/steam_network");
l_sv_maxusrcmdprocessticks_0 = v125.create("Misc", ui.get_icon("bolt") .. " functions"):switch("\v\f<users>  \rShared Icon");
v21.new("shared_icon", l_sv_maxusrcmdprocessticks_0);
({
    message = "\208\186\208\190\208\180\208\181\209\128 \209\136\208\187\209\142", 
    channel = 2000, 
    icon_link = "https://raw.githubusercontent.com/6sixgang/textisory/main/6d92d87b2ed62b99622f6384fd989227.png", 
    checked_players = {}, 
    get_xuid = panorama.GameStateAPI.GetPlayerXuidStringFromEntIndex, 
    set_icon = function(v1439, v1440)
        if v1440 then
            v1440:set_icon(v1439.icon_link);
        end;
    end, 
    reset = function(v1441)
        v1441.checked_players = {};
        entity.get_players(false, true, function(v1442)
            v1442:set_icon();
        end);
    end, 
    get_steam_id = function(v1443, v1444)
        if not v1444 then
            return;
        else
            local v1445 = v1443.get_xuid(v1444:get_index());
            if not v1445 then
                return;
            else
                local v1446 = v1445:sub(4, -1);
                if #v1446 == 0 then
                    return;
                else
                    return 76500000000000000ULL + tonumber(v1446);
                end;
            end;
        end;
    end, 
    send = function(v1447, v1448)
        -- upvalues: l_sv_gravity_0 (ref)
        if not v1448:get_player_info() then
            return;
        else
            local v1449 = v1447:get_steam_id(v1448);
            if not v1449 then
                return;
            else
                local v1450 = json.stringify({
                    index = entity.get_local_player():get_index(), 
                    message = v1447.message
                });
                l_sv_gravity_0.close_connection_with_user(v1449);
                l_sv_gravity_0.send_message_to_user(v1449, (">%s<"):format(v1450), v1447.channel);
                return;
            end;
        end;
    end, 
    receive = function(v1451)
        -- upvalues: l_sv_gravity_0 (ref)
        local v1452, v1453 = l_sv_gravity_0.receive_messages_on_channel(v1451.channel);
        for v1454 = 1, v1452 do
            local v1455 = v1453[v1454 - 1][0];
            if v1455 then
                local v1456 = ffi.string(v1455.m_pData);
                do
                    local l_v1456_0 = v1456;
                    if l_v1456_0 then
                        local l_status_4, l_result_4 = pcall(function()
                            -- upvalues: l_v1456_0 (ref)
                            return json.parse(l_v1456_0:match(">(.-)<"));
                        end);
                        if l_status_4 and l_result_4 and l_result_4.message ~= nil and l_result_4.message == v1451.message then
                            local v1460 = v1451:get_steam_id(ent);
                            if v1460 then
                                l_sv_gravity_0.close_connection_with_user(v1460);
                            end;
                            local v1461 = entity.get(l_result_4.index);
                            if v1461 then
                                v1451:set_icon(v1461);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    setup = function(v1462)
        -- upvalues: l_sv_maxusrcmdprocessticks_0 (ref), l_sv_gravity_0 (ref)
        events.render:set(function()
            -- upvalues: l_sv_maxusrcmdprocessticks_0 (ref), v1462 (ref), l_sv_gravity_0 (ref)
            if not l_sv_maxusrcmdprocessticks_0:get() then
                return;
            else
                entity.get_players(false, true, function(v1463)
                    -- upvalues: v1462 (ref), l_sv_gravity_0 (ref)
                    if v1462.checked_players[v1463:get_index()] == nil then
                        local v1464 = v1462:get_steam_id(v);
                        if v1464 then
                            l_sv_gravity_0.accept_session_with_user(v1464);
                        end;
                        v1462:send(v1463);
                        v1462.checked_players[v1463:get_index()] = true;
                    end;
                    v1462:receive();
                end);
                return;
            end;
        end);
        l_sv_maxusrcmdprocessticks_0:set_callback(function()
            -- upvalues: v1462 (ref)
            v1462:reset();
        end);
        events.shutdown:set(function()
            -- upvalues: l_sv_maxusrcmdprocessticks_0 (ref), v1462 (ref)
            if l_sv_maxusrcmdprocessticks_0:get() then
                v1462:reset();
            end;
        end);
        events.round_start:set(function()
            -- upvalues: l_sv_maxusrcmdprocessticks_0 (ref), v1462 (ref)
            if l_sv_maxusrcmdprocessticks_0:get() then
                v1462:reset();
            end;
        end);
    end
}):setup();
local _ = nil;
local v1466 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit");
local v1468 = v125.create("Anti-Aim", "features"):switch("\v\f<paper-plane> \r Lag Exploit", false, nil, function(v1467)
    return {
        ticks = v1467:slider("ticks", 10, 30, 18, 1, "t")
    };
end);
v21.new("teleport_exploit", v1468);
v1468:tooltip("Feature makes that your \vexploits recharging \rin air always \n\nBetter to use switch def. aa (100)");
do
    local l_v1466_0, l_v1468_0 = v1466, v1468;
    local function v1476(v1471)
        -- upvalues: l_v1466_0 (ref), l_v1468_0 (ref)
        l_v1466_0:override();
        if not l_v1468_0:get() then
            return;
        else
            local v1472 = entity.get_local_player();
            if not v1472 or not v1472:is_alive() then
                return;
            else
                local v1473 = v1472:get_anim_state();
                if not v1473 then
                    return;
                else
                    local v1474 = v1472:get_player_weapon();
                    if not v1474 then
                        return;
                    else
                        local v1475 = v1474:get_weapon_info();
                        if not v1475 then
                            return;
                        elseif v1475.weapon_type == 9 then
                            return;
                        elseif not (not v1473.on_ground or v1471.in_jump) then
                            return;
                        else
                            v1471.force_defensive = true;
                            if rage.exploit:get() > 0 and globals.tickcount % l_v1468_0.ticks:get() == 0 then
                                rage.exploit:force_teleport();
                            end;
                            rage.exploit:force_charge();
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    events.createmove(v1476);
end;
v1466 = v125.create("Misc", ui.get_icon("bolt") .. " functions"):switch("\v\f<person-walking-with-cane>\r    Animation Breaker");
v1466:tooltip("this is other type of \vanimation breaker \rwhat makes your character \aFF7E7EEEshaking\r. \nevery \aC1F682FFgamesense \rusers jerks off on it \n\n\aFF7E7EEE\f<triangle-exclamation> \vi dont know \rif it is doing \aFF7E7EEEbad things \ron your cheat.");
v21.new("anim_breaker_2", v1466);
events.post_update_clientside_animation:set(function(v1477)
    -- upvalues: v1466 (ref)
    if not v1466:get() then
        return;
    else
        if v1477 == entity.get_local_player() then
            local _ = v1477:get_anim_state();
            if v1466:get() then
                v1477.m_flPoseParameter[1] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[2] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[4] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[6] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[3] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[7] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[8] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[9] = math.random(0, 10) / 10;
                v1477.m_flPoseParameter[10] = math.random(0, 10) / 10;
            end;
        end;
        return;
    end;
end);
local _ = nil;
local v1480 = v125.create("Misc", ui.get_icon("bolt") .. " functions"):switch("\v\f<stars>   \rRelease Grenades", false, "Drop all grenades *\vBIND ME\r*");
v21.new("grenade_drop", v1480);
local v1481 = false;
local v1482 = {
    ["Incendiary Grenade"] = "weapon_incgrenade", 
    ["High Explosive Grenade"] = "weapon_hegrenade", 
    Molotov = "weapon_molotov", 
    ["Smoke Grenade"] = "weapon_smokegrenade"
};
do
    local l_v1480_0, l_v1481_0, l_v1482_0 = v1480, v1481, v1482;
    local function v1494(v1486)
        -- upvalues: l_v1480_0 (ref), l_v1481_0 (ref), l_v1482_0 (ref)
        local v1487 = entity.get_local_player();
        if not v1487 then
            return;
        else
            local v1488 = v1487:get_player_weapon(true);
            if not v1488 then
                return;
            else
                if l_v1480_0:get() then
                    v1486.in_use = true;
                    if not l_v1481_0 then
                        local v1489 = 1;
                        for _, v1491 in pairs(v1488) do
                            local v1492 = l_v1482_0[v1491:get_name()];
                            do
                                local l_v1492_0 = v1492;
                                if l_v1492_0 ~= nil then
                                    utils.execute_after(0.02 * v1489, function()
                                        -- upvalues: l_v1492_0 (ref)
                                        utils.console_exec("use " .. l_v1492_0 .. "; drop");
                                    end);
                                end;
                                v1489 = v1489 + 1;
                            end;
                        end;
                    end;
                end;
                l_v1481_0 = l_v1480_0:get();
                return;
            end;
        end;
    end;
    events.createmove(v1494);
end;
v1468 = nil;
v1481 = v125.find("Miscellaneous", "Main", "Other"):switch(v125.string("\v[?] \rMax Unlag"));
v21.new("maxunlag", v1481);
v1481:tooltip("This feature makes your \vfake ping\r & \vbacktrack \rworks \votherways\r");
v1482 = cvar.sv_maxunlag:float();
do
    local l_v1481_1, l_v1482_1 = v1481, v1482;
    local function v1497()
        -- upvalues: l_v1482_1 (ref)
        cvar.sv_maxunlag:float(l_v1482_1);
    end;
    l_v1481_1:set_callback(function()
        -- upvalues: l_v1481_1 (ref), v1497 (ref)
        if l_v1481_1:get() then
            return cvar.sv_maxunlag:float(1);
        else
            v1497();
            return;
        end;
    end);
    events.shutdown(v1497);
end;
v32.package = v125.setup({
    other = v21.data, 
    antiaim = {
        menu = v460.menu, 
        states = v460.states
    }
}, true);
print("Load time is ", v0.stop(), "ms");