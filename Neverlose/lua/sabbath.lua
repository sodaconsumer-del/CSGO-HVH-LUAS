local l_random_0 = math.random;
local l_clamp_0 = math.clamp;
local l_ceil_0 = math.ceil;
local l_floor_0 = math.floor;
local _ = math.modf;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_rad_0 = math.rad;
local l_sqrt_0 = math.sqrt;
local l_abs_0 = math.abs;
local l_get_icon_0 = ui.get_icon;
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_animations_0 = require("neverlose/animations");
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/md5");
local l_monylinear_0 = require("neverlose/monylinear");
local l_defensive_0 = require("neverlose/get_defensive");
local l_ffi_0 = require("ffi");
local v19 = {};
local v20 = {};
local v21 = {};
local v22 = {};
local _ = {};
local v24 = {};
local v25 = {};
local v26 = {};
local _ = {};
local v28 = {};
local v29 = {};
v25 = {
    c2 = 0, 
    c1 = 0, 
    prev = 0, 
    des = 58, 
    current = 0, 
    c5 = 0, 
    c4 = 0, 
    c3 = 0
};
v26 = {
    dist = 0, 
    last = globals.tickcount
};
v22.colors = {
    ["damage rejection"] = "\aDE6060FF", 
    ["backtrack failure"] = "\aDE6060FF", 
    ["prediction error"] = "\aDE6060FF", 
    misprediction = "\aDE6060FF", 
    correction = "\aDE6060FF", 
    spread = "\aDEDE60FF", 
    death = "\aDE6060FF", 
    ["player death"] = "\aDE6060FF", 
    ["unregistered shot"] = "\aDE6060FF"
};
v22.hitboxes = {
    [1] = "body", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "neck", 
    [10] = "body", 
    [11] = "gear"
};
v22.data = {};
v22.marker = {};
v22.reg = 0;
v22.hit = 0;
v28.ground = 0;
v28.oldcount = 0;
v28.shift = 0;
local v30 = color(255);
v29.r = color(255);
v29.l = v30;
l_ffi_0.cdef("        bool URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n        bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\n        typedef struct {\n            char  pad_0000[20];\n            int m_nOrder;\n            int m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            float m_flWeightDeltaRate;\n            float m_flPlaybackRate;\n            float m_flCycle;\n            void *m_pOwner;\n            char  pad_0038[4];\n        } CAnimationLayer_t;\n    ");
files.create_folder("csgo/sabbath");
v30 = l_ffi_0.load("UrlMon");
local v31 = l_ffi_0.load("WinInet");
v21.download = function(v32, v33)
    -- upvalues: v31 (ref), v30 (ref)
    v31.DeleteUrlCacheEntryA(v32);
    v30.URLDownloadToFileA(nil, v32, v33, 0, 0);
end;
v21.font_m = files.get_crc32("csgo/a_m.ttf");
if v21.font_m == nil then
    v21.download("https://1024terabox.com/s/1nGD9nZUVNJPpPzZPnTkyug", "csgo/a_m.ttf");
end;
v21.font_bm = files.get_crc32("csgo/a_bm.ttf");
if v21.font_bm == nil then
    v21.download("https://1024terabox.com/s/19IX165lp3Df4XINFd-KBag", "csgo/a_bm.ttf");
end;
v21.font_bi = files.get_crc32("csgo/a_bi.ttf");
if v21.font_bi == nil then
    v21.download("https://1024terabox.com/s/1geCT-GoNFAyBsUm0x89TMg", "csgo/a_bi.ttf");
end;
v21.logo = files.get_crc32("sabbath/logo.png");
if v21.logo == nil then
    v21.download("https://1024terabox.com/s/1dmedHeDny1b8AZ61Gn9OOQ", "sabbath/logo.png");
end;
local v34 = render.load_image_from_file("csgo/sabbath/logo.png", vector(100, 100));
local v35 = "https://en.neverlose.cc/static/avatars/" .. common.get_username() .. ".png";
local v36 = network.get(v35);
local v37 = render.load_image(v36);
local v38 = l_ffi_0.cast(l_ffi_0.typeof("void***"), utils.create_interface("engine.dll", "VEngineClient014"));
local v39 = l_ffi_0.cast(l_ffi_0.typeof("bool(__thiscall*)(void*)"), v38[0][11]);
local function v42(v40)
    local v41 = v40:gsub("\a.{6}", "");
    print_raw(v41);
end;
local function v49(v43, v44, v45)
    -- upvalues: v42 (ref)
    return function(...)
        -- upvalues: v45 (ref), v43 (ref), v44 (ref), v42 (ref)
        local l_status_0, l_result_0 = pcall(v45, ...);
        if not l_status_0 then
            local v48 = v43 .. " : " .. l_result_0:gsub(".{6}", "");
            if v44 then
                v42(v48);
            end;
            return false, v48;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
local function v53(v50, v51, v52)
    -- upvalues: v49 (ref)
    events[v50]:set(v49(v51, true, v52));
end;
local function v58(v54, v55, v56, v57)
    index = v54:get();
    v55[index] = v56 .. v57 .. v55[index];
    v54:update(v55);
end;
local function v62(v59, v60)
    for v61 = 1, #v59 do
        if v59[v61] == v60 then
            return true;
        end;
    end;
    return false;
end;
local function v68(v63)
    table.foreach(materials.get_materials("vgui/hud/800"), function(_, v65)
        -- upvalues: v63 (ref)
        v65:color_modulate(v63);
        v65:alpha_modulate(v63.a / 255);
    end);
    table.foreach(materials.get_materials("vgui_white"), function(_, v67)
        -- upvalues: v63 (ref)
        v67:color_modulate(v63);
        v67:alpha_modulate(v63.a / 255);
    end);
end;
local function v75(v69, v70, v71, v72, v73, v74)
    -- upvalues: l_floor_0 (ref), l_sin_0 (ref)
    return l_floor_0(l_sin_0(globals.realtime * v69) * (v72 - 32) + (v72 - 31.75)), l_floor_0(l_sin_0(globals.realtime * v69 + v71) * (v73 - 32) + (v73 - 31.75)), l_floor_0(l_sin_0(globals.realtime * v69 + v71 * 2) * (v74 - 32) + (v73 - 31.75)), v70;
end;
local v76 = v49("yhuk", false, function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=dwoVmg");
end);
local v77 = v49("discord", false, function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/Pg6Gc65skF");
end);
v19.default = {
    p1 = {
        [1] = "default"
    }, 
    p2 = {
        [1] = "$abbath"
    }, 
    p3 = {
        [1] = ""
    }
};
v19.path = "game/csgo/subtitle.txt";
if files.read(v19.path) == nil then
    files.write(v19.path, l_base64_0.encode(msgpack.pack(v19.default)));
end;
v19.data = msgpack.unpack(l_base64_0.decode(files.read(v19.path)));
local v136 = new_class():struct("data")({
    active = "\a{Link Active}", 
    pitchticks = 0, 
    pitchtime = 0, 
    fps = 0, 
    build = "recode", 
    update = "v2.", 
    username = common.get_username(), 
    fullscreen = render.screen_size(), 
    screen = render.screen_size() * 0.5, 
    conditions = {
        [1] = "override", 
        [2] = "standing", 
        [3] = "running", 
        [4] = "walking", 
        [5] = "crouching", 
        [6] = "crouch-walking", 
        [7] = "jumping", 
        [8] = "jump-crouching"
    }, 
    trashtalk = {
        [1] = "SKEET$LAYER", 
        [2] = "good doggy back to kennel ", 
        [3] = "The sounds you made last time we were in bed made me so weak.", 
        [4] = "nice work man you have your mothers c0ck.", 
        [5] = "I\226\128\153ve been thinking about being inside of you all day.", 
        [6] = "\240\157\149\154 \240\157\149\146\240\157\149\158 \240\157\149\165\240\157\149\153\240\157\149\150 \240\157\149\153\240\157\149\167\240\157\149\153 \240\157\149\168\240\157\149\154\240\157\149\171\240\157\149\146\240\157\149\163\240\157\149\149, \240\157\149\168\240\157\149\146\240\157\149\167\240\157\149\150 \240\157\149\158\240\157\149\170 \240\157\149\148\240\157\149\160\240\157\149\148\240\157\149\156 \240\157\149\146\240\157\149\159\240\157\149\149 \240\157\149\159\240\157\149\159\240\157\149\164 \240\157\149\149\240\157\149\154\240\157\149\164\240\157\149\146\240\157\149\161\240\157\149\161\240\157\149\150\240\157\149\146\240\157\149\163 \226\153\155", 
        [7] = "print_chat(\"1 eblet\")", 
        [8] = "ooga booga smelly monkey", 
        [9] = "stay r4ped freak", 
        [10] = "meow for me kitten", 
        [11] = "$abbath said sit puppy.", 
        [12] = "hell sent. ", 
        [13] = "you will never get this \226\153\155", 
        [14] = "yappa yappa gang r4ped kid", 
        [15] = "if i knew you sucked this much id say meet me around the back after this game.", 
        [16] = "lol you good?", 
        [17] = "sit, now, good dog, roll over, gooood boy.", 
        [18] = "nice weather to knee you in the chin", 
        [19] = "rolf nice ragebot", 
        [20] = "\209\142\208\184\208\180 \209\133\209\129\208\176 1488", 
        [21] = "iq? nope. braindead? yep.", 
        [22] = "i should of been a school shooter fr.", 
        [23] = "look >> -_- 1\226\153\155"
    }, 
    deathtalk = {
        [1] = "about time lmao", 
        [2] = "i was bored", 
        [3] = "dropped my monitor (._.`)", 
        [4] = "lol i was afk", 
        [5] = "lol you are still neg freak", 
        [6] = "1", 
        [7] = "$abbath wasnt loaded"
    }, 
    fonts = {
        [1] = render.load_font("csgo/a_m.ttf", 12, "a"), 
        [2] = render.load_font("csgo/a_bm.ttf", 11, "a"), 
        [3] = render.load_font("csgo/a_bi.ttf", 13, "ad"), 
        [4] = render.load_font("csgo/a_m.ttf", 25, "a"), 
        [5] = render.load_font("csgo/a_m.ttf", 14, "a"), 
        [6] = render.load_font("Calibri", vector(24, 24, 0), "ab")
    }
}):struct("ref")({
    rage = {
        dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        peekassist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
    }, 
    antiaim = {
        enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        ext = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
        base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        moffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        invert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        left = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        dfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        extroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
        extpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
        fsbody = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
        fsmod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers")
    }, 
    exploit = {
        dt = {
            enable = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
            teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
            switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
        }, 
        hs = {
            enable = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
        }
    }, 
    fakelag = {
        enable = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        random = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
    }, 
    misc = {
        fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
        scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        windows = ui.find("Miscellaneous", "Main", "Other", "Windows"), 
        leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
        clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
    }
}):struct("menu")({
    update = function(v78)
        -- upvalues: l_pui_0 (ref), v34 (ref), v76 (ref), v77 (ref), v19 (ref)
        tab = {
            info = {
                settings = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\f<gears>\a595959C8  \226\128\162  \rsettings", 2), 
                logo = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\f<house-blank>\a595959C8  \226\128\162  \rwelcome", 1), 
                media = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\f<hourglass-half>\a595959C8  \226\128\162  \rmedia", 2), 
                script = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\n\n", 1)
            }, 
            presets = {
                create1 = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\n\n\n", 2), 
                create2 = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\n\n\n\n", 2), 
                list = l_pui_0.create(v78.data.active .. ui.get_icon("house-blank"), v78.data.active .. "\n\n\n\n\n", 2)
            }, 
            antiaim = {
                settings = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<gears>\a595959C8  \226\128\162  \rsettings", 1), 
                angles = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<wave-sine>\a595959C8  \226\128\162  \rangles", 1), 
                global = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<shield-check>\a595959C8  \226\128\162  \rglobal", 2), 
                exploits = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<stars>\a595959C8  \226\128\162  \rexploits", 2), 
                states = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<street-view>\a595959C8  \226\128\162  \rstates", 1), 
                presets = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<pencil>\a595959C8  \226\128\162  \rvibrance", 2), 
                presetson = l_pui_0.create(v78.data.active .. ui.get_icon("shield"), v78.data.active .. "\f<star-of-david>\a595959C8  \226\128\162  \renable vibrance", 1)
            }, 
            misc = {
                general = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\n\n\n\n", 1), 
                misc1 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<fire>\a595959C8  \226\128\162  \rhelpers", 1), 
                misc2 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<comment>\a595959C8  \226\128\162  \rpersonal", 1), 
                misc3 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<sparkles>\a595959C8  \226\128\162  \rgeneral", 2), 
                misc4 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<link>\a595959C8  \226\128\162  \rexploits", 2)
            }, 
            visuals = {
                visuals1 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<palette>\a595959C8  \226\128\162  \rgeneral", 1), 
                visuals2 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<eraser>\a595959C8  \226\128\162  \rin-game", 1), 
                visuals3 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<lightbulb>\a595959C8  \226\128\162  \rwidgets", 2), 
                visuals4 = l_pui_0.create(v78.data.active .. ui.get_icon("gear"), v78.data.active .. "\f<bell>\a595959C8  \226\128\162  \rcrosshair", 2)
            }
        };
        items = {
            info = {
                settings = tab.info.settings:list("", {
                    [1] = "   \aDEFAULTstatistics", 
                    [2] = "   \aDEFAULTpresets"
                }), 
                logo = tab.info.logo:texture(v34, vector(260, 280), ui.get_style("Link Active"), "f"), 
                welcome = tab.info.media:button("                    \rWelcome back, " .. v78.data.active .. v78.data.username .. "                    ", nil, true), 
                configs = tab.info.media:label(v78.data.active .. "\f<route-interstate>\a595959C8  \226\128\162  \rconfigs"), 
                yhuk = tab.info.media:button("  yhuk  ", function()
                    -- upvalues: v76 (ref)
                    v76();
                end), 
                panel = tab.info.media:switch(v78.data.active .. "\f<star-sharp-half-stroke>\a595959C8  \226\128\162  \rinfo panel", true), 
                discord_text = tab.info.media:label(v78.data.active .. "\f<discord>\a595959C8 \226\128\162  \rdiscord server"), 
                discord_button = tab.info.media:button(" discord ", function()
                    -- upvalues: v77 (ref)
                    v77();
                end), 
                sabbath = tab.info.script:button("                        \rBe best, be" .. v78.data.active .. " sabbath                        ", nil, true), 
                build = tab.info.script:label("build\a595959C8  \226\128\162  " .. v78.data.active .. v78.data.build), 
                update = tab.info.script:label("version\a595959C8  \226\128\162  " .. v78.data.active .. v78.data.update)
            }, 
            presets = {
                name = tab.presets.create1:input(""), 
                add = tab.presets.create2:button("            create           ", function()
                    -- upvalues: v19 (ref)
                    v19.add();
                end, true), 
                create = tab.presets.create1:button("             create            ", function()
                    -- upvalues: v19 (ref)
                    v19.create();
                end, true), 
                back = tab.presets.create1:button("             back            ", function()
                    -- upvalues: v19 (ref)
                    v19.back();
                end, true), 
                import = tab.presets.create2:button("            import           ", function()
                    -- upvalues: v19 (ref)
                    v19.import();
                end, true), 
                list = tab.presets.list:list("", v19.data.p1), 
                aa = tab.presets.list:button("     \f<shield>     ", function()
                    -- upvalues: v19 (ref)
                    v19.antiaim();
                end):tooltip("import anti-aims"), 
                other = tab.presets.list:button("   \f<gear>   ", function()
                    -- upvalues: v19 (ref)
                    v19.other();
                end):tooltip("import other"), 
                save = tab.presets.list:button("    \a43A149EB\f<floppy-disk>    ", function()
                    -- upvalues: v19 (ref)
                    v19.save();
                end, true), 
                remove = tab.presets.list:button("   \aA14343EB\f<trash>   ", function()
                    -- upvalues: v19 (ref)
                    v19.remove();
                end, true), 
                export = tab.presets.list:button("    \f<file-export>    ", function()
                    -- upvalues: v19 (ref)
                    v19.export();
                end, true)
            }, 
            antiaim = {
                enable = tab.antiaim.settings:switch("enable"), 
                settings = tab.antiaim.settings:list("", {
                    [1] = ui.get_icon("gear") .. "   \aDEFAULTglobal", 
                    [2] = ui.get_icon("shield") .. "   \aDEFAULTbuilder", 
                    [3] = ui.get_icon("trillium") .. "   \aDEFAULTvibrance"
                }), 
                base = tab.antiaim.angles:combo(v78.data.active .. "\f<crosshairs>   \rview", {
                    [1] = "at targets", 
                    [2] = "eye based"
                }), 
                manual = tab.antiaim.angles:combo(v78.data.active .. "\f<transporter>   \rmanual", {
                    [1] = "disabled", 
                    [2] = "forward", 
                    [3] = "left", 
                    [4] = "right"
                }, function(v79)
                    return {
                        static = v79:switch("static")
                    };
                end), 
                freestanding = tab.antiaim.angles:switch(v78.data.active .. "\f<person-to-portal>   \rfreestanding"), 
                safehead = tab.antiaim.global:switch(v78.data.active .. "\f<head-side>    \rsafe head", false, function(v80)
                    -- upvalues: v78 (ref)
                    return {
                        weapon = v80:listable(v78.data.active .. "\f<person-rifle>\a595959C8  \226\128\162  \rweapons", {
                            [1] = "knife", 
                            [2] = "zeus", 
                            [3] = "grenade", 
                            [4] = "scout", 
                            [5] = "awp"
                        }), 
                        attargets = v80:switch("at targets", true)
                    }, true;
                end), 
                edgeyaw = tab.antiaim.global:switch(v78.data.active .. "\f<shuffle>    \redge yaw"), 
                legit = tab.antiaim.global:switch(v78.data.active .. "\f<magnet>     \re-hold antiaim"), 
                warmup = tab.antiaim.global:switch(v78.data.active .. "\f<binoculars>    \rtrash on warm-up"), 
                static = tab.antiaim.global:selectable(v78.data.active .. "\f<hourglass-half>     \rstatic on", {
                    [1] = "fakelag", 
                    [2] = "recharge", 
                    [3] = "fakeduck"
                }), 
                defensive = tab.antiaim.exploits:switch(v78.data.active .. "\f<stars>    \rdefensive", false, function(v81)
                    return {
                        mod = v81:switch("disable modifier"), 
                        fps = v81:switch("fps safety")
                    }, true;
                end), 
                lagcomp = tab.antiaim.exploits:selectable(v78.data.active .. "\f<timer>    \rbreak lc", {
                    [1] = "standing", 
                    [2] = "walking", 
                    [3] = "running", 
                    [4] = "crouching", 
                    [5] = "crouch-walking", 
                    [6] = "jumping", 
                    [7] = "jump-crouching"
                }), 
                states = tab.antiaim.states:combo("states", v78.data.conditions), 
                vibrance = tab.antiaim.presetson:switch("enable vibrance"), 
                vibrancetext = tab.antiaim.presets:label("you're using a " .. v78.data.active .. "game-ready \rpreset. have a good game" .. v78.data.active .. "!"), 
                vibrancemode = tab.antiaim.presets:list(v78.data.active .. "\f<lightbulb>\a595959C8  \226\128\162  \rchoose preset", {
                    [1] = "\aDEFAULTsynthesized", 
                    [2] = "\aDEFAULTsabbath."
                })
            }, 
            visuals = {
                accent = tab.visuals.visuals1:color_picker(v78.data.active .. "\f<paintbrush>   \raccent", {
                    single = {
                        color(107, 135, 185)
                    }, 
                    gradient = {
                        color(107, 135, 185), 
                        color(202, 221, 255)
                    }, 
                    rainbow = {
                        color(255, 255, 255)
                    }
                }), 
                settings = tab.visuals.visuals1:label(v78.data.active .. "\f<palette>    \rsettings", function(v82)
                    -- upvalues: v78 (ref)
                    return {
                        glow = v82:slider(v78.data.active .. "\f<lightbulb-on>   \rglow", 0, 10, 0, nil, function(v83)
                            return "." .. v83;
                        end), 
                        performance = v82:switch(v78.data.active .. "\f<droplet-degree>     \rperformance mode"), 
                        radar = v82:switch(v78.data.active .. "\f<radar>    \rhide radar"), 
                        docking = v82:hotkey(v78.data.active .. "\f<command>    \rdocking key", 160)
                    };
                end), 
                vgui = tab.visuals.visuals2:switch(v78.data.active .. "\f<fill>    \rvgui recolor", false, color(255)), 
                aspect = tab.visuals.visuals2:switch(v78.data.active .. "\f<wave-sine>   \raspect ratio", false, function(v84)
                    -- upvalues: v78 (ref)
                    return {
                        amount = v84:slider("", 50, 200, 100, 0.01, function(v85)
                            -- upvalues: v78 (ref)
                            if v85 == 178 then
                                return v78.data.active .. " 16:9 ";
                            elseif v85 == 125 then
                                return v78.data.active .. " 5:4 ";
                            elseif v85 == 133 then
                                return v78.data.active .. " 4:3 ";
                            elseif v85 == 150 then
                                return v78.data.active .. " 3:2 ";
                            else
                                return;
                            end;
                        end), 
                        a1 = v84:button("  16:9  "), 
                        a2 = v84:button("   5:4   "), 
                        a3 = v84:button("   4:3   "), 
                        a4 = v84:button("   3:2   ")
                    }, true;
                end), 
                viewmodel = tab.visuals.visuals2:switch(v78.data.active .. "\f<up-down-left-right>     \rviewmodel", false, function(v86)
                    return {
                        fov = v86:slider("\n", 0, 150, 68, nil, function(v87)
                            return "fov: " .. v87;
                        end), 
                        x = v86:slider("\n\n", -100, 100, 0, 0.1, function(v88)
                            return "x: " .. v88;
                        end), 
                        y = v86:slider("\n\n\n", -100, 100, 0, 0.1, function(v89)
                            return "y: " .. v89;
                        end), 
                        z = v86:slider("\n\n\n\n", -100, 100, 0, 0.1, function(v90)
                            return "z: " .. v90;
                        end), 
                        clear = v86:button("              reset position              ")
                    }, true;
                end), 
                scope = tab.visuals.visuals2:switch(v78.data.active .. "\f<crosshairs>     \rscope overlay", false, function(v91)
                    return {
                        exclude = v91:selectable("exclude", {
                            [1] = "top", 
                            [2] = "bottom", 
                            [3] = "left", 
                            [4] = "right"
                        }), 
                        invert = v91:switch("invert"), 
                        color = v91:color_picker("color", color(255)), 
                        offset = v91:slider("offset", 0, 50, 10, nil, "px"), 
                        length = v91:slider("length", 0, 200, 50, nil, "px")
                    }, true;
                end), 
                radius = tab.visuals.visuals2:switch(v78.data.active .. "\f<bomb>     \rnade radius", false, function(v92)
                    -- upvalues: v78 (ref)
                    return {
                        nades = v92:listable(v78.data.active .. "\f<object-exclude>\a595959C8  \226\128\162  \rgrenades", {
                            [1] = "molotov", 
                            [2] = "smoke"
                        }), 
                        molotov = v92:color_picker("molotov color", color(198, 115, 82, 255)), 
                        smoke = v92:color_picker("smoke color", color(148, 148, 148, 255))
                    }, true;
                end), 
                watermark = tab.visuals.visuals3:switch(v78.data.active .. "\f<bookmark>     \rwatermark", false, function(v93)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v93:slider("x_pos", 0, 2560, 1620 - render.measure_text(v78.data.fonts[1], nil, v78.data.username).x, 0.01), 
                        y_pos = v93:slider("y_pos", 0, 2560, 10, 0.01), 
                        style = v93:list(v78.data.active .. "\f<mistletoe>\a595959C8  \226\128\162  \rstyle", {
                            [1] = "advanced", 
                            [2] = "flat"
                        }), 
                        build = v93:switch("build", true), 
                        user = v93:switch("user", true), 
                        avatar = v93:switch("show avatar", true), 
                        customname = v93:input(""), 
                        fakechance = v93:switch("fake chance", true), 
                        delay = v93:switch("delay", true), 
                        time = v93:switch("time", true)
                    }, true;
                end), 
                keybinds = tab.visuals.visuals3:switch(v78.data.active .. "\f<paperclip>     \rhotkeys", false, function(v94)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v94:slider("x_pos", 0, 2560, v78.data.screen.x - 300, 0.01), 
                        y_pos = v94:slider("y_pos", 0, 2560, v78.data.screen.y - 17, 0.01)
                    };
                end), 
                spectators = tab.visuals.visuals3:switch(v78.data.active .. "\f<user>     \rspectators", false, function(v95)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v95:slider("x_pos", 0, 2560, v78.data.screen.x + 170, 0.01), 
                        y_pos = v95:slider("y_pos", 0, 2560, v78.data.screen.y - 17, 0.01), 
                        avatar = v95:switch("show avatars", true)
                    }, true;
                end), 
                status = tab.visuals.visuals3:switch(v78.data.active .. "\f<lightbulb>      \rstatus", false, function(v96)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v96:slider("x_pos", 0, 2560, v78.data.screen.x - 65, 0.01), 
                        y_pos = v96:slider("y_pos", 0, 2560, v78.data.screen.y - 350, 0.01), 
                        slow = v96:switch("slow"), 
                        time = v96:switch("time"), 
                        timer = v96:slider("", 5, 20, 10, nil, " s")
                    }, true;
                end), 
                sidebar = tab.visuals.visuals3:switch(v78.data.active .. "\f<clipboard>      \rsidebar", false, function(v97)
                    -- upvalues: v78 (ref)
                    return {
                        elements = v97:listable(v78.data.active .. "\f<list>\a595959C8  \226\128\162  \relements", {
                            [1] = "doubletap", 
                            [2] = "hideshots", 
                            [3] = "freestanding", 
                            [4] = "fakeduck", 
                            [5] = "min. damage", 
                            [6] = "hitchance", 
                            [7] = "lower body", 
                            [8] = "hit/miss", 
                            [9] = "lagcomp", 
                            [10] = "choke", 
                            [11] = "ping spike", 
                            [12] = "safepoint", 
                            [13] = "bodyaim", 
                            [14] = "dormant"
                        })
                    }, true;
                end), 
                indicators = tab.visuals.visuals4:switch(v78.data.active .. "\f<pen-to-square>    \rindicators", false, function(v98)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v98:slider("x_pos", 0, 2560, 50, 0.01), 
                        y_pos = v98:slider("y_pos", 400, 620, 550), 
                        style = v98:list(v78.data.active .. "\f<lightbulb>\a595959C8  \226\128\162  \rstyle", {
                            [1] = "branded", 
                            [2] = "macro"
                        }), 
                        elements = v98:listable(v78.data.active .. "\f<bell>\a595959C8  \226\128\162  \relements", {
                            [1] = "underline", 
                            [2] = "states", 
                            [3] = "hotkeys"
                        }), 
                        glow = v98:switch("glow", true)
                    }, true;
                end), 
                eventlogs = tab.visuals.visuals4:switch(v78.data.active .. "\f<bell>     \reventlogs", false, function(v99)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v99:slider("x_pos", 0, 2560, 50, 0.01), 
                        y_pos = v99:slider("y_pos", 0, 2560, v78.data.screen.y * 1.25, 0.01), 
                        pos = v99:listable(v78.data.active .. "\f<street-view>\a595959C8  \226\128\162  \rposition", {
                            [1] = "console", 
                            [2] = "screen"
                        }), 
                        triggers = v99:listable(v78.data.active .. "\f<thumbtack>\a595959C8  \226\128\162  \rtriggers", {
                            [1] = "hit", 
                            [2] = "miss", 
                            [3] = "hurt", 
                            [4] = "deviade"
                        })
                    }, true;
                end), 
                mindamage = tab.visuals.visuals4:switch(v78.data.active .. "\f<square-9>     \rmindamage", false, function(v100)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v100:slider("x_pos", 0, 2560, v78.data.screen.x + 30, 0.01), 
                        y_pos = v100:slider("y_pos", 0, 2560, v78.data.screen.y - 30, 0.01), 
                        font = v100:list(v78.data.active .. "\f<palette>\a595959C8  \226\128\162  \rstyle", {
                            [1] = "branded", 
                            [2] = "macro"
                        }), 
                        animate = v100:switch("animate", true)
                    }, true;
                end), 
                arrows = tab.visuals.visuals4:switch(v78.data.active .. "\f<arrows-left-right>    \rantiaim arrows", false, function(v101)
                    -- upvalues: v78 (ref)
                    return {
                        x_pos = v101:slider("x_pos", 0, 2560, v78.data.screen.x + 60, 0.01), 
                        y_pos = v101:slider("y_pos", 0, 2560, v78.data.screen.y - 11, 0.01)
                    }, true;
                end), 
                marker = tab.visuals.visuals4:switch(v78.data.active .. "\f<location-pin>     \rshotmarker", false, function(v102)
                    -- upvalues: v78 (ref)
                    return {
                        pos = v102:listable(v78.data.active .. "\f<street-view>\a595959C8  \226\128\162  \rposition", {
                            [1] = "screen", 
                            [2] = "world"
                        })
                    }, true;
                end)
            }, 
            misc = {
                settings = tab.misc.general:list("", {
                    [1] = ui.get_icon("pen-fancy") .. "   \aDEFAULTvisuals", 
                    [2] = ui.get_icon("crosshairs") .. "   \aDEFAULTmisc"
                }), 
                hitchance = tab.misc.misc1:switch(v78.data.active .. "\f<location-crosshairs-slash>     \rhitchance", false, function(v103)
                    -- upvalues: v78 (ref)
                    return {
                        state = v103:listable(v78.data.active .. "\f<timer>\a595959C8  \226\128\162  \rstate", {
                            [1] = "in-air", 
                            [2] = "no-scope"
                        }), 
                        airw = v103:selectable("in-air", {
                            [1] = "Global", 
                            [2] = "Pistols", 
                            [3] = "AWP", 
                            [4] = "SSG-08", 
                            [5] = "AK-47", 
                            [6] = "AutoSnipers", 
                            [7] = "Snipers", 
                            [8] = "Rifles", 
                            [9] = "SMGs", 
                            [10] = "Shotguns", 
                            [11] = "Machineguns", 
                            [12] = "M4A1/M4A4", 
                            [13] = "Desert Eagle", 
                            [14] = "R8 Revolver", 
                            [15] = "AUG/SG 553", 
                            [16] = "Taser"
                        }), 
                        air = v103:slider("", 0, 100, 100, nil, "%"), 
                        scopew = v103:selectable("no-scope", {
                            [1] = "SSG-08", 
                            [2] = "AWP", 
                            [3] = "AutoSnipers", 
                            [4] = "Snipers"
                        }), 
                        scope = v103:slider("", 0, 100, 100, nil, "%")
                    }, true;
                end), 
                grenades = tab.misc.misc1:switch(v78.data.active .. "\f<bomb>      \rgrenades", false, function(v104)
                    return {
                        fix = v104:switch("throw fix"), 
                        supertoss = v104:switch("supertoss"), 
                        release = v104:switch("auto release")
                    }, true;
                end), 
                clantag = tab.misc.misc2:switch(v78.data.active .. "\f<user-tag>    \rclantag"), 
                trashtalk = tab.misc.misc2:switch(v78.data.active .. "\f<recycle>     \rtrashtalk", false, function(v105)
                    -- upvalues: v78 (ref)
                    return {
                        state = v105:listable(v78.data.active .. "\f<check>\a595959C8  \226\128\162  \rstate", {
                            [1] = "kill", 
                            [2] = "death"
                        })
                    }, true;
                end), 
                shared = tab.misc.misc2:switch(v78.data.active .. "\f<share-nodes>      \rshared logo"), 
                avoid = tab.misc.misc3:switch(v78.data.active .. "\f<cowbell>      \ravoid collisions"), 
                fall = tab.misc.misc3:switch(v78.data.active .. "\f<person-falling>      \rno fall damage"), 
                ladder = tab.misc.misc3:switch(v78.data.active .. "\f<stairs>     \rfast ladder"), 
                scout = tab.misc.misc3:switch(v78.data.active .. "\f<paper-plane>      \rjumpscout"), 
                teleport = tab.misc.misc4:switch(v78.data.active .. "\f<transporter>     \rin-air teleport", false, function(v106)
                    -- upvalues: v78 (ref)
                    return {
                        sensor = v106:list(v78.data.active .. "\f<person-walking>\a595959C8  \226\128\162  \rsensor", {
                            [1] = "peek", 
                            [2] = "threat"
                        }), 
                        fast = v106:switch("fast landing")
                    }, true;
                end), 
                exploits = tab.misc.misc4:switch(v78.data.active .. "\f<repeat>     \rexploit switcher"), 
                fakelag = tab.misc.misc4:switch(v78.data.active .. "\f<gears>    \rfakelag fix"), 
                kangaroo = tab.misc.misc4:switch(v78.data.active .. "\f<star>    \rskeet kangaroo"), 
                animation = tab.misc.misc4:switch(v78.data.active .. "\f<rotate-exclamation>     \ranimations", false, function(v107)
                    -- upvalues: v78 (ref)
                    return {
                        mode = v107:listable(v78.data.active .. "\f<code-compare>\a595959C8  \226\128\162  \rmode", {
                            [1] = "on-ground", 
                            [2] = "in-air", 
                            [3] = "pitch", 
                            [4] = "lean"
                        }), 
                        ground = v107:list(v78.data.active .. "\f<person-walking>\a595959C8  \226\128\162  \ron-ground", {
                            [1] = "backward", 
                            [2] = "walking", 
                            [3] = "jitter"
                        }), 
                        air = v107:list(v78.data.active .. "\f<person-ski-jumping>\a595959C8  \226\128\162  \rin-air", {
                            [1] = "static", 
                            [2] = "walking", 
                            [3] = "bird"
                        }), 
                        lean = v107:slider("lean amount", 0, 100, 100, nil, "%")
                    }, true;
                end)
            }
        };
        items.presets.save:depend(true, {
            [1] = nil, 
            [2] = 1, 
            [3] = true, 
            [1] = items.presets.list
        }):tooltip("save");
        items.presets.remove:depend(true, {
            [1] = nil, 
            [2] = 1, 
            [3] = true, 
            [1] = items.presets.list
        }):tooltip("remove");
        items.presets.export:depend(true, {
            [1] = nil, 
            [2] = 1, 
            [3] = true, 
            [1] = items.presets.list
        }):tooltip("export");
        items.antiaim.settings:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        });
        tab.presets.create1:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.info.settings
        });
        tab.presets.create2:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.info.settings
        });
        tab.presets.list:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.info.settings
        });
        tab.info.media:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.info.settings
        });
        tab.antiaim.angles:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 1, 
            [1] = items.antiaim.settings
        });
        tab.antiaim.global:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 1, 
            [1] = items.antiaim.settings
        });
        tab.antiaim.exploits:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 1, 
            [1] = items.antiaim.settings
        });
        tab.antiaim.states:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 2, 
            [1] = items.antiaim.settings
        });
        tab.antiaim.presets:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 3, 
            [1] = items.antiaim.settings
        });
        tab.antiaim.presets:depend(true, {
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.vibrance
        });
        tab.antiaim.presetson:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.antiaim.enable
        }, {
            [1] = nil, 
            [2] = 3, 
            [1] = items.antiaim.settings
        });
        tab.visuals.visuals1:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.settings
        });
        tab.visuals.visuals2:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.settings
        });
        tab.visuals.visuals3:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.settings
        });
        tab.visuals.visuals4:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.settings
        });
        tab.misc.misc1:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.settings
        });
        tab.misc.misc2:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.settings
        });
        tab.misc.misc3:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.settings
        });
        tab.misc.misc4:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.settings
        });
        items.misc.animation.ground:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.animation.mode
        });
        items.misc.animation.air:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.animation.mode
        });
        items.misc.animation.lean:depend({
            [1] = nil, 
            [2] = 4, 
            [1] = items.misc.animation.mode
        });
        items.misc.grenades.supertoss:disabled(false);
        items.misc.grenades.release:disabled(false);
        items.misc.hitchance.airw:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.hitchance.state
        });
        items.misc.hitchance.air:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.misc.hitchance.state
        }, {
            [1] = items.misc.hitchance.airw, 
            [2] = function()
                return #items.misc.hitchance.airw:get() > 0;
            end
        });
        items.misc.hitchance.scopew:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.hitchance.state
        });
        items.misc.hitchance.scope:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.misc.hitchance.state
        }, {
            [1] = items.misc.hitchance.scopew, 
            [2] = function()
                return #items.misc.hitchance.scopew:get() > 0;
            end
        });
        items.visuals.vgui.color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.visuals.vgui
        });
        items.visuals.settings.glow:depend(true, {
            [1] = nil, 
            [2] = false, 
            [1] = items.visuals.settings.performance
        });
        items.visuals.watermark.x_pos:visibility(false);
        items.visuals.watermark.y_pos:visibility(false);
        items.visuals.watermark.avatar:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.visuals.watermark.user
        });
        items.visuals.watermark.customname:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.visuals.watermark.user
        });
        items.visuals.keybinds.x_pos:visibility(false);
        items.visuals.keybinds.y_pos:visibility(false);
        items.visuals.spectators.x_pos:visibility(false);
        items.visuals.spectators.y_pos:visibility(false);
        items.visuals.status.x_pos:visibility(false);
        items.visuals.status.y_pos:visibility(false);
        items.visuals.status.timer:depend({
            [1] = nil, 
            [2] = true, 
            [1] = items.visuals.status.time
        });
        items.visuals.indicators.x_pos:visibility(false);
        items.visuals.indicators.y_pos:visibility(false);
        items.visuals.indicators.glow:depend(true, {
            [1] = nil, 
            [2] = false, 
            [1] = items.visuals.settings.performance
        });
        items.visuals.mindamage.x_pos:visibility(false);
        items.visuals.mindamage.y_pos:visibility(false);
        items.visuals.arrows.x_pos:visibility(false);
        items.visuals.arrows.y_pos:visibility(false);
        items.visuals.eventlogs.x_pos:visibility(false);
        items.visuals.eventlogs.y_pos:visibility(false);
        items.visuals.eventlogs.triggers:depend({
            [1] = items.visuals.eventlogs.pos, 
            [2] = function()
                return items.visuals.eventlogs.pos:get(1) or items.visuals.eventlogs.pos:get(2);
            end
        });
        items.visuals.radius.molotov:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = items.visuals.radius.nades
        });
        items.visuals.radius.smoke:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = items.visuals.radius.nades
        });
    end
}):struct("builder")({
    update = function(v108)
        -- upvalues: l_pui_0 (ref)
        antiaim = {};
        states = {};
        tabs = {};
        condition = {};
        child = {};
        antiaim.enable = items.antiaim.enable;
        antiaim.settings = items.antiaim.settings;
        antiaim.state = items.antiaim.states;
        antiaim.defensive = items.antiaim.defensive;
        antiaim.vibrance = items.antiaim.vibrance;
        for v109 = 1, #v108.data.conditions do
            states[v109] = {
                state = tab.antiaim.states:switch("override\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109])
            };
            tabs[v109] = {
                mode = l_pui_0.create(v108.data.active .. ui.get_icon("shield"), "\rmode\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109], 2), 
                phases = l_pui_0.create(v108.data.active .. ui.get_icon("shield"), "\rphases\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109], 2), 
                yaw = l_pui_0.create(v108.data.active .. ui.get_icon("shield"), "\ryaw\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109], 2), 
                desync = l_pui_0.create(v108.data.active .. ui.get_icon("shield"), "\rdesync\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109], 2), 
                misc = l_pui_0.create(v108.data.active .. ui.get_icon("shield"), "\rancillary\a595959C8  \226\128\162  " .. v108.data.active .. v108.data.conditions[v109], 1)
            };
            do
                local l_v109_0 = v109;
                condition[l_v109_0] = {
                    mode = tabs[l_v109_0].mode:combo("mode", {
                        [1] = "classic", 
                        [2] = "phased"
                    }), 
                    phases_info = tabs[l_v109_0].phases:label("                            total phases: " .. v108.data.active .. "2                      "), 
                    phases_count = tabs[l_v109_0].phases:slider("relation count", 2, 9, 2), 
                    phases_add = tabs[l_v109_0].phases:button(v108.data.active .. "                \f<plus-large>                 ", function(_)
                        -- upvalues: l_v109_0 (ref)
                        condition[l_v109_0].phases_count:set(condition[l_v109_0].phases_count:get() + 1);
                    end, true), 
                    phases_del = tabs[l_v109_0].phases:button(v108.data.active .. "                 \f<xmark>                 ", function(_)
                        -- upvalues: l_v109_0 (ref)
                        condition[l_v109_0].phases_count:set(condition[l_v109_0].phases_count:get() - 1);
                    end, true), 
                    phases_1 = tabs[l_v109_0].phases:slider(v108.data.active .. "1\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_2 = tabs[l_v109_0].phases:slider(v108.data.active .. "2\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_3 = tabs[l_v109_0].phases:slider(v108.data.active .. "3\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_4 = tabs[l_v109_0].phases:slider(v108.data.active .. "4\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_5 = tabs[l_v109_0].phases:slider(v108.data.active .. "5\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_6 = tabs[l_v109_0].phases:slider(v108.data.active .. "6\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_7 = tabs[l_v109_0].phases:slider(v108.data.active .. "7\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_8 = tabs[l_v109_0].phases:slider(v108.data.active .. "8\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    phases_9 = tabs[l_v109_0].phases:slider(v108.data.active .. "9\a595959C8  \226\128\162  \rphase", -90, 90, 0, nil, "\194\176"), 
                    yaw = tabs[l_v109_0].yaw:combo("yaw", {
                        [1] = "static", 
                        [2] = "left & right"
                    }), 
                    static = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rmain offset", -60, 60, 0, nil, "\194\176"), 
                    left = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rleft", -60, 60, 0, nil, "\194\176"), 
                    right = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rright", -60, 60, 0, nil, "\194\176"), 
                    modifier = tabs[l_v109_0].yaw:combo("modifier", {
                        [1] = "disabled", 
                        [2] = "jitter", 
                        [3] = "ways", 
                        [4] = "sway", 
                        [5] = "random"
                    }), 
                    random = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rrandom", 0, 100, 0, 0.1), 
                    ways = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rways", 1, 4, 1, nil, function(v113)
                        if v113 == 1 then
                            return "3";
                        elseif v113 == 2 then
                            return "5";
                        elseif v113 == 3 then
                            return "7";
                        elseif v113 == 4 then
                            return "9";
                        else
                            return;
                        end;
                    end), 
                    speed = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rspeed", 10, 100, 10, 0.1), 
                    offset = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \roffset", -60, 60, 0, nil, "\194\176"), 
                    min = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rmin", -60, 60, 0, nil, "\194\176"), 
                    max = tabs[l_v109_0].yaw:slider("\a595959C8  \226\128\162  \rmax", -60, 60, 0, nil, "\194\176"), 
                    desync = tabs[l_v109_0].desync:combo("desync", {
                        [1] = "disabled", 
                        [2] = "default", 
                        [3] = "synced"
                    }), 
                    desyncways = tabs[l_v109_0].desync:switch("\a595959C8  \226\128\162  \rway-comp"), 
                    leftlimit = tabs[l_v109_0].desync:slider("\a595959C8  \226\128\162  \rleft limit", 0, 60, 60, nil, "\194\176"), 
                    rightlimit = tabs[l_v109_0].desync:slider("\a595959C8  \226\128\162  \rright limit", 0, 60, 60, nil, "\194\176"), 
                    options = tabs[l_v109_0].desync:label("\a595959C8  \226\128\162  \roptions"), 
                    defensive = tabs[l_v109_0].misc:switch("defensive"), 
                    delay = tabs[l_v109_0].misc:slider("frequency", 1, 17, 0, nil, function(v114)
                        if v114 == 1 then
                            return "off";
                        elseif v114 == 17 then
                            return "at";
                        else
                            return v114 .. " t";
                        end;
                    end)
                };
                local v115 = {
                    phases_1 = condition[l_v109_0].phases_1:create(), 
                    phases_2 = condition[l_v109_0].phases_2:create(), 
                    phases_3 = condition[l_v109_0].phases_3:create(), 
                    phases_4 = condition[l_v109_0].phases_4:create(), 
                    phases_5 = condition[l_v109_0].phases_5:create(), 
                    phases_6 = condition[l_v109_0].phases_6:create(), 
                    phases_7 = condition[l_v109_0].phases_7:create(), 
                    phases_8 = condition[l_v109_0].phases_8:create(), 
                    phases_9 = condition[l_v109_0].phases_9:create(), 
                    modifier = condition[l_v109_0].modifier:create(""), 
                    options = condition[l_v109_0].options:create(""), 
                    defensive = condition[l_v109_0].defensive:create("")
                };
                child[l_v109_0] = {
                    phases_1_desync = v115.phases_1:switch("desync", true), 
                    phases_1_limit = v115.phases_1:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_1_rand = v115.phases_1:label("random"), 
                    phases_1_random = v115.phases_1:slider("\n", 0, 100, 0, 0.1), 
                    phases_2_desync = v115.phases_2:switch("desync", true), 
                    phases_2_limit = v115.phases_2:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_2_rand = v115.phases_2:label("random"), 
                    phases_2_random = v115.phases_2:slider("\n", 0, 100, 0, 0.1), 
                    phases_3_desync = v115.phases_3:switch("desync", true), 
                    phases_3_limit = v115.phases_3:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_3_rand = v115.phases_3:label("random"), 
                    phases_3_random = v115.phases_3:slider("\n", 0, 100, 0, 0.1), 
                    phases_4_desync = v115.phases_4:switch("desync", true), 
                    phases_4_limit = v115.phases_4:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_4_rand = v115.phases_4:label("random"), 
                    phases_4_random = v115.phases_4:slider("\n", 0, 100, 0, 0.1), 
                    phases_5_desync = v115.phases_5:switch("desync", true), 
                    phases_5_limit = v115.phases_5:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_5_rand = v115.phases_5:label("random"), 
                    phases_5_random = v115.phases_5:slider("\n", 0, 100, 0, 0.1), 
                    phases_6_desync = v115.phases_6:switch("desync", true), 
                    phases_6_limit = v115.phases_6:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_6_rand = v115.phases_6:label("random"), 
                    phases_6_random = v115.phases_6:slider("\n", 0, 100, 0, 0.1), 
                    phases_7_desync = v115.phases_7:switch("desync", true), 
                    phases_7_limit = v115.phases_7:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_7_rand = v115.phases_7:label("random"), 
                    phases_7_random = v115.phases_7:slider("\n", 0, 100, 0, 0.1), 
                    phases_8_desync = v115.phases_8:switch("desync", true), 
                    phases_8_limit = v115.phases_8:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_8_rand = v115.phases_8:label("random"), 
                    phases_8_random = v115.phases_8:slider("\n", 0, 100, 0, 0.1), 
                    phases_9_desync = v115.phases_9:switch("desync", true), 
                    phases_9_limit = v115.phases_9:slider("", -60, 60, 0, nil, "\194\176"), 
                    phases_9_rand = v115.phases_9:label("random"), 
                    phases_9_random = v115.phases_9:slider("\n", 0, 100, 0, 0.1), 
                    modifierseparate = v115.modifier:switch("separate"), 
                    random = v115.modifier:switch("random"), 
                    jitter = v115.options:switch("jitter"), 
                    overlap = v115.options:switch("avoid overlap"), 
                    brute = v115.options:switch("anti-bruteforce"), 
                    mode = v115.defensive:listable(v108.data.active .. "\f<stars>\a595959C8  \226\128\162  \rmode", {
                        [1] = "yaw", 
                        [2] = "pitch"
                    }), 
                    yaw = v115.defensive:combo("yaw", {
                        [1] = "switch", 
                        [2] = "jitter", 
                        [3] = "spin", 
                        [4] = "random", 
                        [5] = "actually spin", 
                        [6] = "pirated"
                    }), 
                    yawvalue = v115.defensive:slider("\n\n\n", -180, 180, 0, nil, function(v116)
                        if v116 > 0 then
                            return "+" .. v116;
                        else
                            return;
                        end;
                    end), 
                    pitch = v115.defensive:combo("pitch", {
                        [1] = "switch", 
                        [2] = "jitter", 
                        [3] = "3-way", 
                        [4] = "random", 
                        [5] = "pirated", 
                        [6] = "sabbath", 
                        [7] = "special", 
                        [8] = "stutter", 
                        [9] = "hypnotic", 
                        [10] = "neck break", 
                        [11] = "yhuk", 
                        [12] = "random flick", 
                        [13] = "jitter", 
                        [14] = "hidden jitter"
                    }), 
                    pitchvalue = v115.defensive:slider("\n\n\n\n", -89, 89, -89, nil, function(v117)
                        if v117 > 0 then
                            return "-" .. v117;
                        elseif v117 < 0 then
                            return "+" .. string.sub(v117, 2, 3);
                        else
                            return;
                        end;
                    end)
                };
            end;
        end;
        visible = function()
            -- upvalues: v108 (ref)
            local v118 = antiaim.state:get();
            for v119 = 1, #v108.data.conditions do
                local v120 = v118 == v108.data.conditions[v119] and antiaim.enable:get() and antiaim.settings:get() == 2;
                states[v119].state:visibility(v120 and v118 ~= "override");
                tabs[v119].mode:visibility(v120);
                tabs[v119].phases:visibility(v120 and condition[v119].mode:get() == "phased");
                tabs[v119].yaw:visibility(v120 and condition[v119].mode:get() == "classic");
                tabs[v119].desync:visibility(v120 and condition[v119].mode:get() == "classic");
                tabs[v119].misc:visibility(v120);
                tabs[v119].mode:disabled(v120 and (not states[v119].state:get() or antiaim.vibrance:get()) and v118 ~= "override");
                tabs[v119].phases:disabled(v120 and (not states[v119].state:get() or antiaim.vibrance:get()) and v118 ~= "override");
                tabs[v119].yaw:disabled(v120 and (not states[v119].state:get() or antiaim.vibrance:get()) and v118 ~= "override");
                tabs[v119].desync:disabled(v120 and (not states[v119].state:get() or antiaim.vibrance:get()) and v118 ~= "override");
                tabs[v119].misc:disabled(v120 and (not states[v119].state:get() or antiaim.vibrance:get()) and v118 ~= "override");
                child[v119].modifierseparate:visibility(condition[v119].modifier:get() ~= "disabled");
                child[v119].random:visibility(condition[v119].modifier:get() ~= "disabled");
                child[v119].mode:visibility(condition[v119].defensive:get());
                child[v119].yaw:visibility(child[v119].mode:get("yaw") and condition[v119].defensive:get());
                child[v119].yawvalue:visibility(child[v119].mode:get("yaw") and condition[v119].defensive:get() and child[v119].yaw:get() ~= "spin");
                child[v119].pitch:visibility(child[v119].mode:get("pitch") and condition[v119].defensive:get());
                child[v119].pitchvalue:visibility(child[v119].mode:get("pitch") and condition[v119].defensive:get());
                condition[v119].static:visibility(condition[v119].yaw:get() == "static");
                condition[v119].left:visibility(condition[v119].yaw:get() ~= "static");
                condition[v119].right:visibility(condition[v119].yaw:get() ~= "static");
                condition[v119].random:visibility(condition[v119].modifier:get() ~= "disabled" and child[v119].random:get());
                condition[v119].ways:visibility(condition[v119].modifier:get() == "ways");
                condition[v119].speed:visibility(condition[v119].modifier:get() == "sway");
                condition[v119].offset:visibility(condition[v119].modifier:get() ~= "disabled" and not child[v119].modifierseparate:get());
                condition[v119].min:visibility(condition[v119].modifier:get() ~= "disabled" and child[v119].modifierseparate:get());
                condition[v119].max:visibility(condition[v119].modifier:get() ~= "disabled" and child[v119].modifierseparate:get());
                condition[v119].desyncways:visibility(condition[v119].desync:get() == "default" and condition[v119].modifier:get() == "ways");
                condition[v119].leftlimit:visibility(condition[v119].desync:get() == "default" and (not (condition[v119].modifier:get() == "ways") or not condition[v119].desyncways:get()));
                condition[v119].rightlimit:visibility(condition[v119].desync:get() == "default" and (not (condition[v119].modifier:get() == "ways") or not condition[v119].desyncways:get()));
                condition[v119].options:visibility(condition[v119].desync:get() ~= "disabled");
                condition[v119].defensive:visibility(antiaim.defensive:get());
                condition[v119].phases_add:disabled(condition[v119].phases_count:get() == 9);
                condition[v119].phases_del:disabled(condition[v119].phases_count:get() == 2);
                condition[v119].phases_count:visibility(false);
                condition[v119].phases_info:name("                            total phases: " .. v108.data.active .. condition[v119].phases_count:get() .. "                      ");
                condition[v119].phases_1:visibility(condition[v119].phases_count:get() >= 1);
                condition[v119].phases_2:visibility(condition[v119].phases_count:get() >= 2);
                condition[v119].phases_3:visibility(condition[v119].phases_count:get() >= 3);
                condition[v119].phases_4:visibility(condition[v119].phases_count:get() >= 4);
                condition[v119].phases_5:visibility(condition[v119].phases_count:get() >= 5);
                condition[v119].phases_6:visibility(condition[v119].phases_count:get() >= 6);
                condition[v119].phases_7:visibility(condition[v119].phases_count:get() >= 7);
                condition[v119].phases_8:visibility(condition[v119].phases_count:get() >= 8);
                condition[v119].phases_9:visibility(condition[v119].phases_count:get() >= 9);
                child[v119].phases_1_limit:visibility(child[v119].phases_1_desync:get());
                child[v119].phases_2_limit:visibility(child[v119].phases_2_desync:get());
                child[v119].phases_3_limit:visibility(child[v119].phases_3_desync:get());
                child[v119].phases_4_limit:visibility(child[v119].phases_4_desync:get());
                child[v119].phases_5_limit:visibility(child[v119].phases_5_desync:get());
                child[v119].phases_6_limit:visibility(child[v119].phases_6_desync:get());
                child[v119].phases_7_limit:visibility(child[v119].phases_7_desync:get());
                child[v119].phases_8_limit:visibility(child[v119].phases_8_desync:get());
                child[v119].phases_9_limit:visibility(child[v119].phases_9_desync:get());
            end;
        end;
        set_callback = function(_)
            for _, v123 in pairs(antiaim) do
                v123:set_callback(visible);
            end;
            for v124, _ in pairs(states) do
                for _, v127 in pairs(states[v124]) do
                    v127:set_callback(visible);
                end;
            end;
            for v128, _ in pairs(condition) do
                for _, v131 in pairs(condition[v128]) do
                    v131:set_callback(visible);
                end;
            end;
            for v132, _ in pairs(child) do
                for _, v135 in pairs(child[v132]) do
                    v135:set_callback(visible);
                end;
            end;
        end;
        visible();
        set_callback();
    end
});
v49("ctx.menu", true, v136.menu:update());
v49("ctx.builder", true, v136.builder:update());
items.antiaim.enable:set_callback(function(v137)
    -- upvalues: v136 (ref)
    if v137:get() then
        v136.ref.antiaim.enable:disabled(true);
        v136.ref.antiaim.pitch:disabled(true);
        v136.ref.antiaim.yaw:disabled(true);
        v136.ref.antiaim.base:disabled(true);
        v136.ref.antiaim.offset:disabled(true);
        v136.ref.antiaim.backstab:disabled(true);
        v136.ref.antiaim.hidden:disabled(true);
        v136.ref.antiaim.modifier:disabled(true);
        v136.ref.antiaim.moffset:disabled(true);
        v136.ref.antiaim.desync:disabled(true);
        v136.ref.antiaim.invert:disabled(true);
        v136.ref.antiaim.left:disabled(true);
        v136.ref.antiaim.right:disabled(true);
        v136.ref.antiaim.options:disabled(true);
        v136.ref.antiaim.dfs:disabled(true);
        v136.ref.antiaim.fs:disabled(true);
        v136.ref.antiaim.fsbody:disabled(true);
        v136.ref.antiaim.fsmod:disabled(true);
        v136.ref.antiaim.enable:override(true);
        v136.ref.antiaim.pitch:override("Down");
        v136.ref.antiaim.yaw:override("Static");
        v136.ref.antiaim.base:override(items.antiaim.base:get() == "at targets" and "At Target" or "Local View");
        v136.ref.antiaim.backstab:override(true);
        v136.ref.antiaim.modifier:override("Disabled");
        v136.ref.antiaim.moffset:override(0);
        v136.ref.antiaim.invert:override(false);
        v136.ref.antiaim.dfs:override("Off");
        v136.ref.antiaim.fsbody:override(true);
        v136.ref.antiaim.fsmod:override(true);
    else
        v136.ref.antiaim.enable:disabled(false);
        v136.ref.antiaim.pitch:disabled(false);
        v136.ref.antiaim.yaw:disabled(false);
        v136.ref.antiaim.base:disabled(false);
        v136.ref.antiaim.offset:disabled(false);
        v136.ref.antiaim.backstab:disabled(false);
        v136.ref.antiaim.hidden:disabled(false);
        v136.ref.antiaim.modifier:disabled(false);
        v136.ref.antiaim.moffset:disabled(false);
        v136.ref.antiaim.desync:disabled(false);
        v136.ref.antiaim.invert:disabled(false);
        v136.ref.antiaim.left:disabled(false);
        v136.ref.antiaim.right:disabled(false);
        v136.ref.antiaim.options:disabled(false);
        v136.ref.antiaim.dfs:disabled(false);
        v136.ref.antiaim.fs:disabled(false);
        v136.ref.antiaim.fsbody:disabled(false);
        v136.ref.antiaim.fsmod:disabled(false);
        v136.ref.antiaim.enable:override();
        v136.ref.antiaim.pitch:override();
        v136.ref.antiaim.yaw:override();
        v136.ref.antiaim.base:override();
        v136.ref.antiaim.offset:override();
        v136.ref.antiaim.backstab:override();
        v136.ref.antiaim.hidden:override();
        v136.ref.antiaim.modifier:override();
        v136.ref.antiaim.moffset:override();
        v136.ref.antiaim.desync:override();
        v136.ref.antiaim.invert:override();
        v136.ref.antiaim.left:override();
        v136.ref.antiaim.right:override();
        v136.ref.antiaim.options:override();
        v136.ref.antiaim.dfs:override();
        v136.ref.antiaim.fs:override();
        v136.ref.antiaim.fsbody:override();
        v136.ref.antiaim.fsmod:override();
    end;
end);
items.antiaim.base:set_callback(function(v138)
    -- upvalues: v136 (ref)
    v136.ref.antiaim.base:override(v138:get() == "at targets" and "At Target" or "Local View");
end);
items.antiaim.settings:set_callback(function(v139)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v139, {
        [1] = ui.get_icon("gear") .. "   \aDEFAULTglobal", 
        [2] = ui.get_icon("shield") .. "   \aDEFAULTbuilder", 
        [3] = ui.get_icon("trillium") .. "   \aDEFAULTvibrance"
    }, v136.data.active, "\226\128\162   ");
end);
items.antiaim.vibrancemode:set_callback(function(v140)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v140, {
        [1] = "\aDEFAULTsynthesized", 
        [2] = "\aDEFAULTsabbath."
    }, v136.data.active, "\226\128\162   ");
end);
items.misc.settings:set_callback(function(v141)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v141, {
        [1] = ui.get_icon("pen-fancy") .. "   \aDEFAULTvisuals", 
        [2] = ui.get_icon("crosshairs") .. "   \aDEFAULTmisc"
    }, v136.data.active, "\226\128\162   ");
end);
items.visuals.indicators.style:set_callback(function(v142)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v142, {
        [1] = "\aDEFAULTbranded", 
        [2] = "\aDEFAULTmacro"
    }, v136.data.active, "\226\128\162   ");
end);
items.visuals.watermark.style:set_callback(function(v143)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v143, {
        [1] = "\aDEFAULTadvanced", 
        [2] = "\aDEFAULTflat"
    }, v136.data.active, "\226\128\162   ");
end);
items.visuals.mindamage.font:set_callback(function(v144)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v144, {
        [1] = "\aDEFAULTbranded", 
        [2] = "\aDEFAULTmacro"
    }, v136.data.active, "\226\128\162   ");
end);
items.visuals.settings.radar:set_callback(function(v145)
    utils.console_exec("cl_drawhud_force_radar " .. (v145:get() and "-1" or "1"));
end);
items.misc.teleport.sensor:set_callback(function(v146)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v146, {
        [1] = "\aDEFAULTpeek", 
        [2] = "\aDEFAULTthreat"
    }, v136.data.active, "\226\128\162   ");
end);
cvar.toggleconsole:set_callback(function()
    -- upvalues: v39 (ref), v38 (ref), v68 (ref)
    if items.visuals.vgui:get() then
        local v147 = items.visuals.vgui.color:get();
        if not v39(v38) then
            v68(color(v147.r, v147.g, v147.b, v147.a));
        else
            v68(color());
        end;
    end;
end);
items.visuals.vgui.color:set_callback(function(v148)
    -- upvalues: v39 (ref), v38 (ref), v68 (ref)
    local v149 = v148:get();
    if v39(v38) then
        v68(color(v149.r, v149.g, v149.b, v149.a));
    end;
end);
items.visuals.vgui:set_callback(function(v150)
    -- upvalues: v68 (ref), v39 (ref), v38 (ref)
    local v151 = items.visuals.vgui.color:get();
    if not v150:get() then
        v68(color());
    elseif v39(v38) then
        v68(color(v151.r, v151.g, v151.b, v151.a));
    end;
end);
items.visuals.scope:set_callback(function(v152)
    -- upvalues: v136 (ref)
    if not v152:get() then
        v136.ref.misc.scope:override();
    end;
end);
cvar.r_aspectratio:set_callback(function()
    if cvar.r_aspectratio:float() > 1.77 and cvar.r_aspectratio:float() < 1.79 then
        cvar.r_aspectratio:float(0);
    end;
end);
items.visuals.aspect.a1:set_callback(function()
    items.visuals.aspect.amount:set(178);
end);
items.visuals.aspect.a2:set_callback(function()
    items.visuals.aspect.amount:set(125);
end);
items.visuals.aspect.a3:set_callback(function()
    items.visuals.aspect.amount:set(133);
end);
items.visuals.aspect.a4:set_callback(function()
    items.visuals.aspect.amount:set(150);
end);
items.visuals.viewmodel:set_callback(function()
    cvar.viewmodel_fov:float(68, true);
    cvar.viewmodel_offset_x:float(2.5, true);
    cvar.viewmodel_offset_y:float(0, true);
    cvar.viewmodel_offset_z:float(-1.5, true);
end);
items.visuals.viewmodel.clear:set_callback(function()
    items.visuals.viewmodel.fov:set(68);
    items.visuals.viewmodel.x:set(0);
    items.visuals.viewmodel.y:set(0);
    items.visuals.viewmodel.z:set(0);
end);
items.info.settings:set_callback(function(v153)
    -- upvalues: v58 (ref), v136 (ref)
    v58(v153, {
        [1] = "\aDEFAULTstatistics", 
        [2] = "\aDEFAULTpresets"
    }, v136.data.active, "\226\128\162   ");
end);
v24.rectblur = function(v154, v155, v156, v157, v158)
    if not items.visuals.settings.performance:get() then
        render.blur(vector(v154.x, v154.y), vector(v155.x, v155.y), 1, 1 * v157, v158);
    end;
    render.rect(vector(v154.x, v154.y), vector(v155.x, v155.y), color(v156.r, v156.g, v156.b, v156.a * v157), v158);
end;
v24.verticalgrad = function(v159, v160, v161, v162, v163)
    render.push_clip_rect(vector(v159.x, v159.y), vector(v159.x + 2, v159.y + 5));
    render.rect_outline(vector(v159.x, v159.y), vector(v160.x + 50, v160.y), color(v161.r, v161.g, v161.b, 255 * v163), 2, 4);
    render.pop_clip_rect();
    render.push_clip_rect(vector(v159.x, v160.y - 5), vector(v159.x + 2, v160.y));
    render.rect_outline(vector(v159.x, v159.y), vector(v160.x + 50, v160.y), color(v162.r, v162.g, v162.b, 255 * v163), 2, 4);
    render.pop_clip_rect();
    render.push_clip_rect(vector(v159.x, v159.y), vector(v159.x + 4, v159.y + 2));
    render.rect_outline(vector(v159.x, v159.y), vector(v160.x + 50, v160.y), color(v161.r, v161.g, v161.b, 255 * v163), 1, 4);
    render.pop_clip_rect();
    render.push_clip_rect(vector(v159.x, v160.y - 2), vector(v159.x + 4, v160.y));
    render.rect_outline(vector(v159.x, v159.y), vector(v160.x + 50, v160.y), color(v162.r, v162.g, v162.b, 255 * v163), 1, 4);
    render.pop_clip_rect();
    render.gradient(vector(v159.x, v159.y + 5), vector(v159.x + 2, v160.y - 5), color(v161.r, v161.g, v161.b, 255 * v163), color(v161.r, v161.g, v161.b, 255 * v163), color(v162.r, v162.g, v162.b, 255 * v163), color(v162.r, v162.g, v162.b, 255 * v163));
    if not items.visuals.settings.performance:get() then
        render.shadow(vector(v159.x + 1, v159.y + 5), vector(v159.x + 1, v160.y - 5), color(v161.r, v161.g, v161.b, 255 * v163 * (items.visuals.settings.glow:get() / 10)));
    end;
end;
v24.horizontalgrad = function(v164, v165, v166, v167, v168, v169)
    render.gradient(vector(v164.x, v164.y), vector(v165.x, v165.y), color(v166.r, v166.g, v166.b, 255 * v168), color(v167.r, v167.g, v167.b, 255 * v168), color(v166.r, v166.g, v166.b, 255 * v168), color(v167.r, v167.g, v167.b, 255 * v168), v169);
    if not items.visuals.settings.performance:get() then
        render.shadow(vector(v164.x, v164.y), vector(v165.x, v164.y), color(v166.r, v166.g, v166.b, 255 * v168 * (items.visuals.settings.glow:get() / 10)));
    end;
end;
v24.abar = function(v170, v171, v172, v173, v174, v175, v176)
    -- upvalues: v24 (ref), v136 (ref)
    if v173 == nil or v173 == "" or v173 == " " then
        return;
    else
        v24.rectblur(vector(13, v136.data.fullscreen.y - 350 - v174 * 30), vector(13 + render.measure_text(v136.data.fonts[1], nil, v173).x + 18, v136.data.fullscreen.y - 345 - v174 * 30 + 20), color(0, 0, 0, 150), 1, 6);
        v24.verticalgrad(vector(13, v136.data.fullscreen.y - 350 - v174 * 30), vector(13, v136.data.fullscreen.y - 345 - v174 * 30 + 20), v171, v172, 1);
        render.text(v136.data.fonts[1], vector(22, v136.data.fullscreen.y - 344 - v174 * 30), color(v170.r, v170.g, v170.b, v170.a), nil, v173);
        if v176 ~= nil and v175 ~= nil then
            render.push_clip_rect(vector(20, v136.data.fullscreen.y - 344 - v174 * 30 - 20), vector(20 + v175, v136.data.fullscreen.y - 344 - v174 * 30 + 20));
            render.text(v136.data.fonts[1], vector(22, v136.data.fullscreen.y - 344 - v174 * 30), color(v176.r, v176.g, v176.b, v176.a), nil, v173);
            render.pop_clip_rect();
        end;
        return;
    end;
end;
v24.bar = function(v177, v178, v179)
    -- upvalues: v136 (ref)
    if v178 == nil or v178 == "" or v178 == " " then
        return;
    else
        render.gradient(vector(13, v136.data.fullscreen.y - 350 - v179 * 37), vector(13 + render.measure_text(v136.data.fonts[6], nil, v178).x / 2, v136.data.fullscreen.y - 345 - v179 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(13 + render.measure_text(v136.data.fonts[6], nil, v178).x, v136.data.fullscreen.y - 350 - v179 * 37), vector(13 + render.measure_text(v136.data.fonts[6], nil, v178).x / 2, v136.data.fullscreen.y - 345 - v179 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v136.data.fonts[6], vector(20, v136.data.fullscreen.y - 343 - v179 * 37), color(0, 0, 0, 150), nil, v178);
        render.text(v136.data.fonts[6], vector(19, v136.data.fullscreen.y - 344 - v179 * 37), v177, nil, v178);
        return;
    end;
end;
local function v181(v180)
    if v180:get_override() == nil then
        return v180:get();
    else
        return v180:get_override();
    end;
end;
local v182 = nil;
v182 = {
    sides = {}, 
    delay = {}
};
v182.calculate = function(v183, v184, v185, v186)
    -- upvalues: v182 (ref)
    if not v182.sides[v183] then
        v182.sides[v183] = 0;
    end;
    if not v182.delay[v183] then
        v182.delay[v183] = 0;
    end;
    if globals.choked_commands == 0 then
        v182.delay[v183] = v182.delay[v183] + 1;
        if v182.delay[v183] > v185 - 1 then
            v182.delay[v183] = 0;
            v182.sides[v183] = v182.sides[v183] + 1;
            if v182.sides[v183] > (v186 == nil and #v184 or v186) then
                v182.sides[v183] = 1;
            end;
        end;
    end;
    return v184[v182.sides[v183]];
end;
local v187 = nil;
v187 = {
    vars = {
        [1] = raw, 
        [2] = yaw, 
        [3] = v182, 
        [4] = add, 
        [5] = sway, 
        [6] = random, 
        [7] = canjitter, 
        [8] = invert, 
        [9] = dpitch, 
        [10] = dyaw, 
        [11] = safeyaw, 
        [12] = safebool, 
        [13] = edgeyaw, 
        [14] = edgebool, 
        [15] = legit, 
        [16] = legitstart, 
        [17] = limit, 
        [18] = desync, 
        [19] = vibrance
    }
};
v187.vars.sway = l_animations_0.new("builder.vars.sway");
v187.invert = true;
v187.legitstart = globals.realtime;
v187.manual = {
    left = 90, 
    right = -90, 
    forward = 0, 
    disabled = 180
};
v187.manualfix = {
    left = -90, 
    right = 90, 
    forward = 180, 
    disabled = 0
};
v187.velocity = function(v188)
    return math.ceil(v188.m_vecVelocity:length());
end;
v187.state = function(v189, v190)
    -- upvalues: v187 (ref), v136 (ref)
    if v189 == nil then
        return;
    else
        local l_m_fFlags_0 = v189.m_fFlags;
        local v192 = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) == 0;
        local v193 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0;
        if v192 and v193 then
            local v194;
            if v190 then
                v194 = states[8].state:get() and 8 or 1;
            else
                v194 = 8;
            end;
            return v194;
        elseif v192 then
            local v195;
            if v190 then
                v195 = states[7].state:get() and 7 or 1;
            else
                v195 = 7;
            end;
            return v195;
        elseif v187.velocity(v189) > 5 and v193 then
            local v196;
            if v190 then
                v196 = states[6].state:get() and 6 or 1;
            else
                v196 = 6;
            end;
            return v196;
        elseif v187.velocity(v189) < 5 and v193 then
            local v197;
            if v190 then
                v197 = states[5].state:get() and 5 or 1;
            else
                v197 = 5;
            end;
            return v197;
        elseif v187.velocity(v189) > 5 and v136.ref.misc.slowwalk:get() then
            local v198;
            if v190 then
                v198 = states[4].state:get() and 4 or 1;
            else
                v198 = 4;
            end;
            return v198;
        elseif v187.velocity(v189) > 5 then
            local v199;
            if v190 then
                v199 = states[3].state:get() and 3 or 1;
            else
                v199 = 3;
            end;
            return v199;
        else
            local v200;
            if v190 then
                v200 = states[2].state:get() and 2 or 1;
            else
                v200 = 2;
            end;
            return v200;
        end;
    end;
end;
v187.desync = function(_)
    -- upvalues: v25 (ref)
    local v202 = entity.get_local_player();
    if v202 == nil or not v202:is_alive() then
        v25.des = 58;
    end;
    if globals.choked_commands > 0 then
        return;
    else
        v25.des = v202.m_flPoseParameter[11] * 110 - 55;
        v25.des = v25.des < 0 and -v25.des or v25.des;
        return;
    end;
end;
v187.edge = function(v203)
    -- upvalues: v187 (ref)
    v187.vars.edgeyaw = 0;
    v187.vars.edgebool = false;
    local v204 = vector();
    if not items.antiaim.edgeyaw:get() then
        return;
    else
        local v205 = entity.get_local_player();
        if v205 == nil or not v205:is_alive() then
            return;
        else
            if v203.send_packet then
                v204 = v205:get_eye_position();
            end;
            local v206 = {};
            local v207 = render.camera_angles();
            local v208 = {};
            for v209 = 18, 360, 18 do
                v209 = math.normalize_yaw(v209);
                local v210 = v204 + vector():angles(0, v209) * 198;
                local v211 = utils.trace_line(v204, v210, v205, 1174421507);
                table.insert(v208, v204.dist(v204, v211.end_pos));
                local l_fraction_0 = v211.fraction;
                local l_entity_0 = v211.entity;
                if l_entity_0 and l_entity_0:get_classname() == "CWorld" and l_fraction_0 < 0.3 then
                    v206[#v206 + 1] = {
                        vecTraceEnd = v210, 
                        flYaw = v209
                    };
                end;
            end;
            table.sort(v208);
            if v208[1] > 30 then
                return;
            else
                table.sort(v206, function(v214, v215)
                    return v214.flYaw < v215.flYaw;
                end);
                table.remove(v206, #v206);
                local v216 = nil;
                if #v206 >= 3 then
                    v216 = (v204 - v206[1].vecTraceEnd:lerp(v206[#v206].vecTraceEnd, 0.5)):angles();
                end;
                if v216 then
                    local l_y_0 = v207.y;
                    local l_y_1 = v216.y;
                    local v219 = math.normalize_yaw(l_y_1 - l_y_0);
                    if math.abs(v219) < 90 then
                        v219 = 0;
                        l_y_0 = math.normalize_yaw(l_y_1 + 180);
                    end;
                    local v220 = -l_y_0;
                    v220 = math.normalize_yaw(v220 + l_y_1 + v219 + 180);
                    v187.vars.edgeyaw = v220;
                    v187.vars.edgebool = true;
                end;
                return;
            end;
        end;
    end;
end;
v187.legit = function(v221)
    -- upvalues: v187 (ref)
    v187.vars.legit = false;
    if not items.antiaim.enable:get() or not items.antiaim.legit:get() then
        return;
    elseif not v221.in_use then
        v187.vars.legitstart = globals.realtime;
        return;
    else
        local v222 = entity.get_local_player();
        if v222 == nil or not v222:is_alive() then
            return;
        else
            local v223 = v222:get_origin();
            local v224 = entity.get_entities("CPlantedC4");
            local v225 = 999;
            if #v224 > 0 then
                v225 = v223:dist((v224[1]:get_origin()));
            end;
            local v226 = entity.get_entities("CHostage");
            local v227 = 999;
            if #v226 > 0 then
                local v228 = {
                    v226[1]:get_origin(), 
                    v226[2]:get_origin()
                };
                v227 = math.min(v223:dist(v228[1]), v223:dist(v228[2]));
            end;
            if v227 < 65 and v222.m_iTeamNum ~= 2 then
                return;
            elseif v225 < 65 and v222.m_iTeamNum ~= 2 then
                return;
            elseif v221.in_use and globals.realtime - v187.vars.legitstart < 0.02 then
                return;
            else
                v221.in_use = false;
                v187.vars.legit = true;
                return;
            end;
        end;
    end;
end;
v187.update = function(v229)
    -- upvalues: v136 (ref), v187 (ref), v181 (ref), l_random_0 (ref), v182 (ref), l_defensive_0 (ref), l_clamp_0 (ref), l_ceil_0 (ref), l_animations_0 (ref)
    local v230 = entity.get_local_player();
    local v231 = v230:get_player_weapon();
    if v230 == nil or not v230:is_alive() or not items.antiaim.enable:get() then
        return;
    else
        v136.ref.antiaim.enable:override(true);
        v136.ref.antiaim.pitch:override(v187.vars.legit and "Disabled" or "Down");
        v136.ref.antiaim.yaw:override("Static");
        v136.ref.antiaim.backstab:override(true);
        v136.ref.antiaim.modifier:override("Disabled");
        v136.ref.antiaim.invert:override(false);
        v136.ref.antiaim.dfs:override("Off");
        v136.ref.antiaim.fs:override(items.antiaim.freestanding:get());
        v187.vars.canjitter = true;
        v187.vars.headbool = false;
        v187.vars.headyaw = 0;
        v187.edge(v229);
        v187.legit(v229);
        v187.desync(v229);
        local v232 = v187.state(entity.get_local_player(), true);
        local v233 = v187.state(entity.get_local_player(), false);
        v136.ref.exploit.dt.options:override(items.antiaim.lagcomp:get(v136.data.conditions[v233]) and "Always On" or nil);
        v136.ref.exploit.dt.limit:override(items.antiaim.lagcomp:get(v136.data.conditions[v233]) and 1 or nil);
        v136.ref.exploit.hs.options:override(items.antiaim.lagcomp:get(v136.data.conditions[v233]) and "Break LC" or nil);
        v187.vars.raw = v229.view_angles.y + (items.antiaim.base:get() == "eye based" and v187.manual[items.antiaim.manual:get()] or rage.antiaim:get_target() == nil and v187.manual[items.antiaim.manual:get()] or v187.manualfix[items.antiaim.manual:get()]);
        if items.antiaim.base:get() == "eye based" then
            v187.vars.yaw = v187.vars.raw + (v187.vars.legit and 180 or 0);
        else
            v187.vars.yaw = v187.vars.raw - v229.view_angles.y + (rage.antiaim:get_target() == nil and -(v187.vars.raw - v229.view_angles.y) or rage.antiaim:get_target()) + (v187.vars.legit and 180 or 0);
        end;
        if rage.antiaim:get_target() == nil then
            v187.vars.yaw = v187.vars.raw + (v187.vars.legit and 180 or 0);
        end;
        if items.antiaim.manual:get() ~= "disabled" and items.antiaim.manual.static:get() then
            v187.vars.canjitter = false;
        end;
        if v231 ~= nil then
            local v234 = v231:get_weapon_index();
            if items.antiaim.safehead:get() and (v232 == 7 or v232 == 8) then
                if items.antiaim.safehead.weapon:get(1) and (v234 == 41 or v234 == 42 or v234 == 59 or v234 == 500 or v234 == 503 or v234 == 505 or v234 == 506 or v234 == 507 or v234 == 508 or v234 == 509 or v234 == 512 or v234 == 514 or v234 == 515 or v234 == 516 or v234 == 517 or v234 == 518 or v234 == 519 or v234 == 520 or v234 == 521 or v234 == 522 or v234 == 523 or v234 == 525) then
                    v187.vars.canjitter = false;
                    v187.vars.headbool = true;
                    v187.vars.headyaw = 15;
                end;
                if items.antiaim.safehead.weapon:get(2) and v234 == 31 then
                    v187.vars.canjitter = false;
                    v187.vars.headbool = true;
                    v187.vars.headyaw = 15;
                end;
                if items.antiaim.safehead.weapon:get(3) and (v234 == 43 or v234 == 44 or v234 == 45 or v234 == 46 or v234 == 47 or v234 == 48) then
                    v187.vars.canjitter = false;
                    v187.vars.headbool = true;
                    v187.vars.headyaw = 15;
                end;
                if items.antiaim.safehead.weapon:get(4) and v234 == 40 then
                    v187.vars.canjitter = false;
                    v187.vars.headbool = true;
                    v187.vars.headyaw = 15;
                end;
                if items.antiaim.safehead.weapon:get(5) and v234 == 9 then
                    v187.vars.canjitter = false;
                    v187.vars.headbool = true;
                    v187.vars.headyaw = 15;
                end;
            end;
        end;
        if v187.vars.headbool and items.antiaim.safehead.attargets:get() then
            v187.vars.yaw = v187.vars.raw - v229.view_angles.y + (rage.antiaim:get_target() == nil and -(v187.vars.raw - v229.view_angles.y) or rage.antiaim:get_target());
        end;
        if items.antiaim.static:get("fakelag") and globals.choked_commands > 2 and not v181(v136.ref.misc.fakeduck) then
            v187.vars.canjitter = false;
        elseif items.antiaim.static:get("recharge") and v181(v136.ref.exploit.dt.enable) and rage.exploit:get() == 0 and not v181(v136.ref.misc.fakeduck) then
            v187.vars.canjitter = false;
        elseif items.antiaim.static:get("fakeduck") and v181(v136.ref.misc.fakeduck) then
            v187.vars.canjitter = false;
        end;
        if items.antiaim.vibrance:get() then
            if items.antiaim.vibrancemode:get() == 1 then
                v187.vars.vibrance = {
                    [1] = {
                        freq = 1, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = 0, 
                            [2] = 0
                        }, 
                        limit = {
                            [1] = 0, 
                            [2] = 0
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [2] = {
                        freq = 1, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = -25, 
                            [2] = 37
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [3] = {
                        freq = 1, 
                        add = 5, 
                        random = 0, 
                        jitter = {
                            [1] = -31, 
                            [2] = 35
                        }, 
                        limit = {
                            [1] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025, 
                            [2] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [4] = {
                        add = 0, 
                        random = 15, 
                        jitter = {
                            [1] = -32, 
                            [2] = 32
                        }, 
                        freq = l_random_0(1, 2), 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [5] = {
                        freq = 2, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = -23, 
                            [2] = 43
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            pitch = -36, 
                            bool = true, 
                            yaw = l_random_0(-110, 110)
                        }
                    }, 
                    [6] = {
                        freq = 1, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = -19, 
                            [2] = 37
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [7] = {
                        freq = 1, 
                        add = 0, 
                        random = 3, 
                        jitter = {
                            [1] = -20, 
                            [2] = 36
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = -85, 
                            bool = true
                        }
                    }, 
                    [8] = {
                        freq = 3, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = -33, 
                            [2] = 33
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            bool = true, 
                            yaw = v182.calculate("vibrance.defensive.yaw", {
                                [1] = -46, 
                                [2] = 46
                            }, 0), 
                            pitch = v182.calculate("vibrance.defensive.pitch", {
                                [1] = 89, 
                                [2] = 14, 
                                [3] = -75
                            }, 0) or 0
                        }
                    }
                };
            else
                v187.vars.vibrance = {
                    [1] = {
                        freq = 1, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = 0, 
                            [2] = 0
                        }, 
                        limit = {
                            [1] = 0, 
                            [2] = 0
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [2] = {
                        freq = 2, 
                        add = 6, 
                        random = 0, 
                        jitter = {
                            [1] = -21, 
                            [2] = 35
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 57
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [3] = {
                        freq = 17, 
                        add = 0, 
                        random = 2, 
                        jitter = {
                            [1] = -19, 
                            [2] = 39
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [4] = {
                        freq = 4, 
                        add = 6, 
                        random = 11, 
                        jitter = {
                            [1] = -38, 
                            [2] = 38
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [5] = {
                        freq = 1, 
                        add = 0, 
                        random = 3, 
                        jitter = {
                            [1] = -20, 
                            [2] = 38
                        }, 
                        limit = {
                            [1] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025, 
                            [2] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025
                        }, 
                        defensive = {
                            bool = true, 
                            yaw = l_random_0(-140, 140), 
                            pitch = v182.calculate("vibrance.defensive.pitch", {
                                [1] = -35, 
                                [2] = -40
                            }, 0) or 0
                        }
                    }, 
                    [6] = {
                        freq = 1, 
                        add = 0, 
                        random = 5, 
                        jitter = {
                            [1] = -12, 
                            [2] = 41
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            yaw = 0, 
                            pitch = 0, 
                            bool = false
                        }
                    }, 
                    [7] = {
                        freq = 1, 
                        add = 0, 
                        random = 3, 
                        jitter = {
                            [1] = -12, 
                            [2] = 41
                        }, 
                        limit = {
                            [1] = 60, 
                            [2] = 60
                        }, 
                        defensive = {
                            bool = true, 
                            yaw = l_random_0(-135, 135), 
                            pitch = v182.calculate("vibrance.defensive.pitch", {
                                [1] = -35, 
                                [2] = -42
                            }, 0) or 0
                        }
                    }, 
                    [8] = {
                        freq = 1, 
                        add = 0, 
                        random = 0, 
                        jitter = {
                            [1] = -15, 
                            [2] = 37
                        }, 
                        limit = {
                            [1] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025, 
                            [2] = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025
                        }, 
                        defensive = {
                            bool = true, 
                            yaw = l_random_0(-140, 140), 
                            pitch = v182.calculate("vibrance.defensive.pitch", {
                                [1] = -35, 
                                [2] = -45
                            }, 0) or 0
                        }
                    }
                };
            end;
            if v187.vars.vibrance[v233].defensive.bool and items.antiaim.defensive:get() then
                rage.antiaim:override_hidden_pitch(v187.vars.vibrance[v233].defensive.pitch);
                if v187.vars.vibrance[v233].defensive.yaw ~= 0 then
                    rage.antiaim:override_hidden_yaw_offset(v187.vars.vibrance[v233].defensive.yaw);
                end;
                v136.ref.antiaim.hidden:override(true);
            else
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(0);
                v136.ref.antiaim.hidden:override(false);
            end;
            v187.vars.invert = v182.calculate("vibrance." .. v233, {
                [1] = false, 
                [2] = true
            }, v187.vars.vibrance[v233].freq == 17 and l_random_0(1, 4) or v187.vars.vibrance[v233].freq);
            if v187.vars.invert ~= nil then
                v187.vars.add = v187.vars.vibrance[v233].add;
                v187.vars.random = l_random_0(-v187.vars.vibrance[v233].random, v187.vars.vibrance[v233].random) * 0.33;
                v187.vars.jitter = v187.vars.invert and v187.vars.vibrance[v233].jitter[2] or v187.vars.vibrance[v233].jitter[1];
                v187.invert = v187.vars.invert;
                v136.ref.antiaim.left:override(v187.vars.canjitter and (v187.vars.invert and v187.vars.vibrance[v233].limit[2] or -v187.vars.vibrance[v233].limit[1]) or v187.vars.vibrance[v233].limit[2]);
                v136.ref.antiaim.right:override(v187.vars.canjitter and (v187.vars.invert and v187.vars.vibrance[v233].limit[2] or -v187.vars.vibrance[v233].limit[1]) or v187.vars.vibrance[v233].limit[2]);
                v136.ref.antiaim.desync:override(true);
                v136.ref.antiaim.offset:override(v187.vars.yaw + (v187.vars.canjitter and v187.vars.jitter + v187.vars.add + v187.vars.random or 0) + v187.vars.headyaw + v187.vars.edgeyaw);
            end;
        else
            if condition[v232].defensive:get() and items.antiaim.defensive:get() then
                if (not items.antiaim.defensive.fps:get() or v136.data.fps >= 60) and rage.exploit:get() == 1 then
                    if items.antiaim.defensive.mod:get() and l_defensive_0() then
                        v187.vars.canjitter = false;
                    end;
                    v136.ref.antiaim.hidden:override(true);
                    if child[v232].mode:get("yaw") then
                        if child[v232].yaw:get() == "switch" then
                            rage.antiaim:override_hidden_yaw_offset(child[v232].yawvalue:get());
                        elseif child[v232].yaw:get() == "jitter" then
                            rage.antiaim:override_hidden_yaw_offset(v182.calculate("defensive.yaw" .. v232, {
                                -child[v232].yawvalue:get(), 
                                child[v232].yawvalue:get()
                            }, 1) or 0);
                        elseif child[v232].yaw:get() ~= "spin" and child[v232].yaw:get() ~= "random" then
                            if child[v232].yaw:get() == "Actually Spin" then
                                rage.antiaim:override_hidden_yaw_offset(normalize_yaw(globals.tickcount % 30 * math.random(-180, 180)));
                            elseif child[v232].yaw:get() == "pirated" then
                                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 5 == 0 and math.random(-89, -40) or -89);
                                rage.antiaim:override_hidden_yaw_offset(l_random_0(-child[v232].yawvalue:get(), child[v232].yawvalue:get()));
                            end;
                        end;
                    else
                        rage.antiaim:override_hidden_yaw_offset(0);
                    end;
                    if child[v232].mode:get("pitch") then
                        if child[v232].pitch:get() == "switch" then
                            rage.antiaim:override_hidden_pitch(child[v232].pitchvalue:get());
                        elseif child[v232].pitch:get() == "jitter" then
                            rage.antiaim:override_hidden_pitch(v182.calculate("defensive.pitch" .. v232, {
                                89, 
                                child[v232].pitchvalue:get()
                            }, 1) or 0);
                        elseif child[v232].pitch:get() == "3-way" then
                            rage.antiaim:override_hidden_pitch(v182.calculate("defensive.pitch" .. v232, {
                                89, 
                                child[v232].pitchvalue:get() + 89, 
                                child[v232].pitchvalue:get()
                            }, 1) or 0);
                        elseif child[v232].pitch:get() == "random" then
                            rage.antiaim:override_hidden_pitch(globals.tickcount % -89);
                        elseif child[v232].pitch:get() == "pirated" then
                            rage.antiaim:override_hidden_pitch(globals.tickcount % 10 == 0 and math.random(-360, -180, 89) or -89);
                        elseif child[v232].pitch:get() == "sabbath" then
                            rage.antiaim:override_hidden_pitch(globals.tickcount % 10 > 5 and -51 or math.random(-89, 89));
                        elseif child[v232].pitch:get() == "special" then
                            rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                        elseif child[v232].pitch:get() == "stutter" then
                            rage.antiaim:override_hidden_pitch(globals.tickcount % 10 == 0 and math.random(-65, -25) or -65);
                        elseif child[v232].pitch:get() == "hypnotic" then
                            rage.antiaim:override_hidden_pitch(sens_tick14 and 89 or math.max(math.random(-89, 89, 0), math.random(-89, -89, 89), math.random(-89, 89, 0)));
                        elseif child[v232].pitch:get() == "neck break" then
                            rage.antiaim:override_hidden_pitch(sens_tick12 and 89 or math.max(math.random(-89, 0), math.random(-89, 0), math.random(-89, 0)));
                        elseif child[v232].pitch:get() == "yhuk" then
                            rage.antiaim:override_hidden_pitch(sens_tick11 and -89 or math.max(math.random(89, -65, -89), math.random(-89, -89, 45), math.random(-89, -65, 89)));
                        elseif child[v232].pitch:get() == "random flick" then
                            rage.antiaim:override_hidden_pitch(sens_tick15 and -89 or math.max(math.random(-89, -65), math.random(55, -55), math.random(0, 35)));
                        elseif child[v232].pitch:get() == "jitter" then
                            rage.antiaim:override_hidden_pitch(v182.calculate("defensive.pitch" .. v232, {
                                -89, 
                                child[v232].pitchvalue:get()
                            }, 1) or -89);
                        elseif child[v232].pitch:get() == "hidden jitter" then
                            rage.antiaim:override_hidden_pitch(sens_tick18 and 89 or math.max(math.random(35, 38), math.random(30, 35), math.random(-89, 35)));
                            rage.antiaim:override_hidden_pitch(l_random_0(89, child[v232].pitchvalue:get()));
                        end;
                    end;
                else
                    rage.antiaim:override_hidden_yaw_offset(0);
                    v136.ref.antiaim.hidden:override(false);
                end;
            else
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(0);
                v136.ref.antiaim.hidden:override(false);
            end;
            if condition[v232].mode:get() == "classic" then
                if condition[v232].modifier:get() == "disabled" then
                    v187.vars.invert = v182.calculate("disabled.invert_" .. v232, {
                        [1] = false, 
                        [2] = true
                    }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                    v187.vars.jitter = 0;
                elseif condition[v232].modifier:get() == "jitter" then
                    v187.vars.invert = v182.calculate("jitter_" .. v232, {
                        [1] = false, 
                        [2] = true
                    }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                    if child[v232].modifierseparate:get() then
                        v187.vars.jitter = v187.vars.invert and condition[v232].max:get() or condition[v232].min:get();
                    else
                        v187.vars.jitter = v187.vars.invert and condition[v232].offset:get() or -condition[v232].offset:get();
                    end;
                elseif condition[v232].modifier:get() == "ways" then
                    v187.vars.invert = v182.calculate("ways.invert_" .. v232, {
                        [1] = false, 
                        [2] = true
                    }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                    if condition[v232].ways:get() == 1 then
                        if child[v232].modifierseparate:get() then
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                0, 
                                [1] = condition[v232].min:get(), 
                                condition[v232].max:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        else
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                0, 
                                [1] = -condition[v232].offset:get(), 
                                condition[v232].offset:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        end;
                    elseif condition[v232].ways:get() == 2 then
                        if child[v232].modifierseparate:get() then
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                0, 
                                [1] = condition[v232].min:get(), 
                                [2] = condition[v232].min:get() * 0.5, 
                                condition[v232].max:get() * 0.5, 
                                condition[v232].max:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        else
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                0, 
                                [1] = -condition[v232].offset:get(), 
                                [2] = -condition[v232].offset:get() * 0.5, 
                                condition[v232].offset:get() * 0.5, 
                                condition[v232].offset:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        end;
                    elseif condition[v232].ways:get() == 3 then
                        if child[v232].modifierseparate:get() then
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                0, 
                                [1] = condition[v232].min:get(), 
                                [2] = condition[v232].min:get() * 0.5, 
                                condition[v232].max:get() * 0.5, 
                                condition[v232].max:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        else
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                nil, 
                                0, 
                                [1] = -condition[v232].offset:get(), 
                                [2] = -condition[v232].offset:get() * 0.7, 
                                [3] = -condition[v232].offset:get() * 0.3, 
                                condition[v232].offset:get() * 0.3, 
                                condition[v232].offset:get() * 0.7, 
                                condition[v232].offset:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        end;
                    elseif condition[v232].ways:get() == 4 then
                        if child[v232].modifierseparate:get() then
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                nil, 
                                nil, 
                                0, 
                                [1] = condition[v232].min:get(), 
                                [2] = condition[v232].min:get() * 0.75, 
                                [3] = condition[v232].min:get() * 0.5, 
                                [4] = condition[v232].min:get() * 0.25, 
                                condition[v232].max:get() * 0.25, 
                                condition[v232].max:get() * 0.5, 
                                condition[v232].max:get() * 0.75, 
                                condition[v232].max:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        else
                            v187.vars.jitter = v182.calculate("ways_" .. v232, {
                                nil, 
                                nil, 
                                nil, 
                                nil, 
                                0, 
                                [1] = -condition[v232].offset:get(), 
                                [2] = -condition[v232].offset:get() * 0.75, 
                                [3] = -condition[v232].offset:get() * 0.5, 
                                [4] = -condition[v232].offset:get() * 0.25, 
                                condition[v232].offset:get() * 0.25, 
                                condition[v232].offset:get() * 0.5, 
                                condition[v232].offset:get() * 0.75, 
                                condition[v232].offset:get()
                            }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                        end;
                    end;
                elseif condition[v232].modifier:get() == "sway" then
                    v187.vars.invert = v182.calculate("sway.invert_" .. v232, {
                        [1] = false, 
                        [2] = true
                    }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                    local v235 = l_clamp_0(l_ceil_0(globals.curtime * (condition[v232].speed:get() / 5)) % 2, 0, 1) > 0.5;
                    local v236 = v187.vars.sway:update(l_animations_0.types.OUT_QUINT, child[v232].modifierseparate:get() and (v235 and condition[v232].min:get() or condition[v232].max:get()) or v235 and -condition[v232].offset:get() or condition[v232].offset:get(), condition[v232].speed:get() / 2000);
                    v187.vars.jitter = v236;
                elseif condition[v232].modifier:get() == "random" then
                    v187.vars.invert = v182.calculate("random.invert_" .. v232, {
                        [1] = false, 
                        [2] = true
                    }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get());
                    if child[v232].modifierseparate:get() then
                        v187.vars.jitter = l_random_0(condition[v232].min:get(), condition[v232].max:get());
                    else
                        v187.vars.jitter = l_random_0(-condition[v232].offset:get(), condition[v232].offset:get());
                    end;
                end;
                v187.vars.add = condition[v232].yaw:get() ~= "static" and (v187.vars.invert and condition[v232].left:get() or condition[v232].right:get()) or condition[v232].static:get();
                v187.vars.random = condition[v232].modifier:get() ~= "disabled" and child[v232].random:get() and l_random_0(-condition[v232].random:get(), condition[v232].random:get()) * 0.33 or 0;
                if condition[v232].desync:get() == "default" then
                    if condition[v232].modifier:get() ~= "ways" or not condition[v232].desyncways:get() then
                        v136.ref.antiaim.left:override(v187.vars.canjitter and child[v232].jitter:get() and (v187.vars.invert and condition[v232].rightlimit:get() or -condition[v232].leftlimit:get()) or condition[v232].rightlimit:get());
                        v136.ref.antiaim.right:override(v187.vars.canjitter and child[v232].jitter:get() and (v187.vars.invert and condition[v232].rightlimit:get() or -condition[v232].leftlimit:get()) or condition[v232].rightlimit:get());
                    else
                        v136.ref.antiaim.left:override(v187.vars.canjitter and v187.vars.jitter or condition[v232].rightlimit:get());
                        v136.ref.antiaim.right:override(v187.vars.canjitter and v187.vars.jitter or condition[v232].rightlimit:get());
                    end;
                elseif condition[v232].desync:get() == "synced" then
                    local l_left_0 = v136.ref.antiaim.left;
                    local l_l_left_0_0 = l_left_0;
                    l_left_0 = l_left_0.override;
                    local v239 = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025;
                    local v240;
                    if not v187.vars.canjitter or not child[v232].jitter:get() then
                        v240 = 1;
                    else
                        v240 = v187.vars.invert and 1 or -1;
                    end;
                    l_left_0(l_l_left_0_0, v239 * v240);
                    l_left_0 = v136.ref.antiaim.right;
                    l_l_left_0_0 = l_left_0;
                    l_left_0 = l_left_0.override;
                    v239 = math.ceil(rage.antiaim:get_max_desync() - 73) * -1 * 1.025;
                    if not v187.vars.canjitter or not child[v232].jitter:get() then
                        v240 = 1;
                    else
                        v240 = v187.vars.invert and 1 or -1;
                    end;
                    l_left_0(l_l_left_0_0, v239 * v240);
                end;
                v136.ref.antiaim.desync:override(condition[v232].desync:get() ~= "disabled");
                v136.ref.antiaim.options:override({
                    [1] = child[v232].brute:get() and "Anti Bruteforce" or "", 
                    [2] = child[v232].overlap:get() and "Avoid Overlap" or ""
                });
            elseif condition[v232].mode:get() == "phased" then
                v187.vars.jitter = v182.calculate("phases_jitter_" .. v232, {
                    condition[v232].phases_1:get(), 
                    condition[v232].phases_2:get(), 
                    condition[v232].phases_3:get(), 
                    condition[v232].phases_4:get(), 
                    condition[v232].phases_5:get(), 
                    condition[v232].phases_6:get(), 
                    condition[v232].phases_7:get(), 
                    condition[v232].phases_8:get(), 
                    condition[v232].phases_9:get()
                }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get(), condition[v232].phases_count:get());
                v187.vars.add = 0;
                v187.vars.random = v182.calculate("phases_random_" .. v232, {
                    child[v232].phases_1_random:get(), 
                    child[v232].phases_2_random:get(), 
                    child[v232].phases_3_random:get(), 
                    child[v232].phases_4_random:get(), 
                    child[v232].phases_5_random:get(), 
                    child[v232].phases_6_random:get(), 
                    child[v232].phases_7_random:get(), 
                    child[v232].phases_8_random:get(), 
                    child[v232].phases_9_random:get()
                }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get(), condition[v232].phases_count:get());
                v187.vars.desync = v182.calculate("phases_desync_" .. v232, {
                    child[v232].phases_1_desync:get(), 
                    child[v232].phases_2_desync:get(), 
                    child[v232].phases_3_desync:get(), 
                    child[v232].phases_4_desync:get(), 
                    child[v232].phases_5_desync:get(), 
                    child[v232].phases_6_desync:get(), 
                    child[v232].phases_7_desync:get(), 
                    child[v232].phases_8_desync:get(), 
                    child[v232].phases_9_desync:get()
                }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get(), condition[v232].phases_count:get());
                v187.vars.limit = v182.calculate("phases_limit_" .. v232, {
                    child[v232].phases_1_limit:get(), 
                    child[v232].phases_2_limit:get(), 
                    child[v232].phases_3_limit:get(), 
                    child[v232].phases_4_limit:get(), 
                    child[v232].phases_5_limit:get(), 
                    child[v232].phases_6_limit:get(), 
                    child[v232].phases_7_limit:get(), 
                    child[v232].phases_8_limit:get(), 
                    child[v232].phases_9_limit:get()
                }, condition[v232].delay:get() == 17 and l_random_0(1, 4) or condition[v232].delay:get(), condition[v232].phases_count:get());
                v187.vars.random = l_random_0(-v187.vars.random, v187.vars.random);
                v136.ref.antiaim.left:override(v187.vars.limit);
                v136.ref.antiaim.right:override(v187.vars.limit);
                v136.ref.antiaim.desync:override(v187.vars.desync);
                v136.ref.antiaim.options:override({
                    [1] = ""
                });
            end;
            if v187.vars.jitter ~= nil then
                v187.invert = v187.vars.invert;
                v136.ref.antiaim.offset:override(v187.vars.yaw + (v187.vars.canjitter and v187.vars.add + v187.vars.random + v187.vars.jitter or 0) + v187.vars.headyaw + v187.vars.edgeyaw);
            end;
        end;
        if items.antiaim.warmup:get() and entity.get_game_rules().m_bWarmupPeriod then
            v136.ref.antiaim.left:override(l_random_0(-60, 60));
            v136.ref.antiaim.right:override(l_random_0(-60, 60));
            v136.ref.antiaim.offset:override(v187.vars.yaw + l_random_0(-180, 180));
        end;
        return;
    end;
end;
local function v244()
    -- upvalues: v58 (ref), v136 (ref)
    v58(items.antiaim.settings, {
        [1] = ui.get_icon("gear") .. "   \aDEFAULTglobal", 
        [2] = ui.get_icon("shield") .. "   \aDEFAULTbuilder", 
        [3] = ui.get_icon("trillium") .. "   \aDEFAULTvibrance"
    }, v136.data.active, "\226\128\162   ");
    v58(items.antiaim.vibrancemode, {
        [1] = "\aDEFAULTsynthesized", 
        [2] = "\aDEFAULTsabbath."
    }, v136.data.active, "\226\128\162   ");
    v58(items.misc.settings, {
        [1] = ui.get_icon("pen-fancy") .. "   \aDEFAULTvisuals", 
        [2] = ui.get_icon("crosshairs") .. "   \aDEFAULTmisc"
    }, v136.data.active, "\226\128\162   ");
    v58(items.visuals.indicators.style, {
        [1] = "\aDEFAULTbranded", 
        [2] = "\aDEFAULTmacro"
    }, v136.data.active, "\226\128\162   ");
    v58(items.visuals.mindamage.font, {
        [1] = "\aDEFAULTbranded", 
        [2] = "\aDEFAULTmacro"
    }, v136.data.active, "\226\128\162   ");
    v58(items.info.settings, {
        [1] = "\aDEFAULTstatistics", 
        [2] = "\aDEFAULTpresets"
    }, v136.data.active, "\226\128\162   ");
    v58(items.misc.teleport.sensor, {
        [1] = "\aDEFAULTpeek", 
        [2] = "\aDEFAULTthreat"
    }, v136.data.active, "\226\128\162   ");
    v58(items.visuals.watermark.style, {
        [1] = "\aDEFAULTadvanced", 
        [2] = "\aDEFAULTflat"
    }, v136.data.active, "\226\128\162   ");
    utils.console_exec("cl_drawhud_force_radar " .. (items.visuals.settings.radar:get() and "-1" or "1"));
    items.presets.create:visibility(false);
    items.presets.name:visibility(false);
    items.presets.back:visibility(false);
    v136.ref.antiaim.enable:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.pitch:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.yaw:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.base:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.offset:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.backstab:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.hidden:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.modifier:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.moffset:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.desync:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.invert:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.left:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.right:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.options:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.dfs:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.fs:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.fsbody:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.fsmod:disabled(items.antiaim.enable:get());
    v136.ref.antiaim.enable:override(items.antiaim.enable:get() and true or nil);
    v136.ref.antiaim.pitch:override(items.antiaim.enable:get() and "Down" or nil);
    v136.ref.antiaim.yaw:override(items.antiaim.enable:get() and "Static" or nil);
    local l_base_0 = v136.ref.antiaim.base;
    local l_l_base_0_0 = l_base_0;
    l_base_0 = l_base_0.override;
    local v243;
    if items.antiaim.enable:get() then
        v243 = items.antiaim.base:get() == "at targets" and "At Targets" or "Local View";
    else
        v243 = nil;
    end;
    l_base_0(l_l_base_0_0, v243);
    v136.ref.antiaim.backstab:override(items.antiaim.enable:get() and true or nil);
    v136.ref.antiaim.modifier:override(items.antiaim.enable:get() and "Disabled" or nil);
    v136.ref.antiaim.moffset:override(items.antiaim.enable:get() and 0 or nil);
    l_base_0 = v136.ref.antiaim.invert;
    l_l_base_0_0 = l_base_0;
    l_base_0 = l_base_0.override;
    if items.antiaim.enable:get() then

    end;
    l_base_0(l_l_base_0_0, nil);
    v136.ref.antiaim.dfs:override(items.antiaim.enable:get() and "Off" or nil);
    v136.ref.antiaim.fsbody:override(items.antiaim.enable:get() and true or nil);
    v136.ref.antiaim.fsmod:override(items.antiaim.enable:get() and true or nil);
end;
local function v249(_)
    local v246 = entity.get_local_player();
    if v246 == nil then
        return;
    else
        local v247 = nil;
        if v246:is_alive() then
            v247 = v246:get_spectators();
        else
            local l_m_hObserverTarget_0 = v246.m_hObserverTarget;
            if not l_m_hObserverTarget_0 then
                return;
            else
                v247 = l_m_hObserverTarget_0:get_spectators();
            end;
        end;
        return v247;
    end;
end;
local function v252()
    local v250 = entity.get_local_player();
    local v251 = utils.net_channel();
    return v250 == nil and 0 or math.floor(v251.avg_latency[1] * 1000);
end;
local function v259(v253, v254)
    -- upvalues: l_sin_0 (ref), l_rad_0 (ref), l_cos_0 (ref)
    local v255 = nil;
    local v256 = nil;
    local v257 = nil;
    local v258 = nil;
    v255 = l_sin_0(l_rad_0(v253));
    v256 = l_sin_0(l_rad_0(v254));
    v257 = l_cos_0(l_rad_0(v253));
    v258 = l_cos_0(l_rad_0(v254));
    return vector(v257 * v258, v257 * v256, -v255);
end;
local function v263()
    -- upvalues: l_floor_0 (ref), v181 (ref), v136 (ref)
    local v260 = entity.get_local_player();
    if v260 == nil or not v260:is_alive() then
        return;
    else
        local l_m_nTickBase_0 = v260.m_nTickBase;
        local v262 = utils.net_channel().avg_latency[0];
        return l_floor_0(l_m_nTickBase_0 - globals.tickcount - 3 - to_ticks(v262) * 0.5 + 0.5 * (v262 * 10)) <= -14 + (v181(v136.ref.exploit.dt.limit) - 1) + 3;
    end;
end;
local function _(v264, v265)
    -- upvalues: l_sqrt_0 (ref)
    local l_x_0 = v264.x;
    local l_y_2 = v264.y;
    local l_z_0 = v264.z;
    local l_x_1 = v265.x;
    local l_y_3 = v265.y;
    local l_z_1 = v265.z;
    local v272 = l_x_0 - l_x_1;
    local v273 = l_y_2 - l_y_3;
    local v274 = l_z_0 - l_z_1;
    return l_sqrt_0(v272 * v272 + v273 * v273 + v274 * v274);
end;
local function v279()
    local v276 = entity.get_local_player():get_player_weapon(false);
    if v276 == nil then
        return false;
    else
        local l_m_fLastShotTime_0 = v276.m_fLastShotTime;
        if l_m_fLastShotTime_0 == nil or l_m_fLastShotTime_0 <= 0 then
            return false;
        else
            local v278 = math.abs(math.floor(0.5 + (globals.curtime - l_m_fLastShotTime_0) / globals.tickinterval));
            return v278 > 0 and v278 < 2;
        end;
    end;
end;
local function v291()
    -- upvalues: l_monylinear_0 (ref), v136 (ref), v22 (ref)
    local v280 = nil;
    local v281 = nil;
    local v282, _ = items.visuals.accent:get();
    if v282 == "single" then
        local v284 = unpack(items.visuals.accent:get("single"));
        v281 = unpack(items.visuals.accent:get("single"));
        v280 = v284;
    else
        local v285, v286 = unpack(items.visuals.accent:get("gradient"));
        v281 = v286;
        v280 = v285;
    end;
    local v287 = "\a" .. color(v280.r, v280.g, v280.b, 255):to_hex();
    local v288 = l_monylinear_0:Static("sabbath", {
        color(v280.r, v280.g, v280.b, 255), 
        color(v281.r * 0.7, v281.g * 0.7, v281.b * 0.7, 255)
    });
    local _ = "          ";
    local v290 = "\aB2B2B2FFwelcome to" .. v287 .. " sabbath \aB2B2B2FFsystems, " .. v287 .. v136.data.username .. "\aB2B2B2FF!";
    print_raw("  " .. v288 .. "\a626262FF  \194\187  " .. v290);
    table.insert(v22.data, 1, {
        type = "welcome", 
        alpha = 0, 
        size1 = render.measure_text(v136.data.fonts[1], nil, "\a7091D0C8\226\128\162   \aFFFFFFFFWelcome").x, 
        size2 = render.measure_text(v136.data.fonts[1], nil, "\a7091D0C8\226\128\162   \aFFFFFFFFWelcome").x, 
        text = "\a7091D0C8\226\128\162   \aFFFFFFFFWelcome" .. " to " .. v287 .. "sabbath \aFFFFFFFFsystems, " .. v287 .. v136.data.username, 
        time = globals.realtime
    });
end;
local function v314(v292)
    -- upvalues: v22 (ref), l_monylinear_0 (ref), v136 (ref)
    v22.reg = v22.reg + 1;
    if v292.state == nil then
        v22.hit = v22.hit + 1;
    end;
    if items.visuals.marker:get() then
        table.insert(v22.marker, {
            alpha1 = 0, 
            alpha = 0, 
            point = v292.aim, 
            time = globals.realtime, 
            state = v292.state
        });
    end;
    if items.visuals.eventlogs:get() then
        local v293 = nil;
        local v294 = nil;
        local v295, _ = items.visuals.accent:get();
        if v295 == "single" then
            local v297 = unpack(items.visuals.accent:get("single"));
            v294 = unpack(items.visuals.accent:get("single"));
            v293 = v297;
        else
            local v298, v299 = unpack(items.visuals.accent:get("gradient"));
            v294 = v299;
            v293 = v298;
        end;
        local v300 = "\a" .. color(v293.r, v293.g, v293.b, 255):to_hex();
        local v301 = l_monylinear_0:Static("sabbath", {
            color(v293.r, v293.g, v293.b, 255), 
            color(v294.r * 0.7, v294.g * 0.7, v294.b * 0.7, 255)
        });
        local v302 = "          ";
        if v292.state == nil and items.visuals.eventlogs.triggers:get(1) then
            local v303 = v22.hitboxes[v292.hitgroup + 1];
            local l_m_iHealth_0 = v292.target.m_iHealth;
            local v305 = v292.target:get_name();
            local v306 = string.sub(v305, 1, 16) .. (#v305 > 16 and ".." or "");
            local v307 = (l_m_iHealth_0 ~= 0 and "\aB2B2B2FFhit " or "\aB2B2B2FFkilled ") .. v300 .. v306 .. " \aB2B2B2FFin " .. v300 .. v303 .. (l_m_iHealth_0 ~= 0 and " \aB2B2B2FFfor " .. v300 .. v292.damage .. "\aB2B2B2FF (" .. v300 .. v292.target.m_iHealth .. " \aB2B2B2FFhp now)" or "") .. "\a626262FF ~ \aB2B2B2FF(" .. v300 .. v292.wanted_damage .. "\aB2B2B2FF) (HC - " .. v300 .. v292.hitchance .. " \a626262FF/ \aB2B2B2FFBT - " .. v300 .. v292.backtrack .. "\aB2B2B2FF)";
            if items.visuals.eventlogs.pos:get(1) then
                print_raw("  " .. v301 .. "\a626262FF  \194\187  " .. v307);
            end;
            if items.visuals.eventlogs.pos:get(2) then
                table.insert(v22.data, 1, {
                    type = "hit", 
                    alpha = 0, 
                    size1 = render.measure_text(v136.data.fonts[1], nil, l_m_iHealth_0 ~= 0 and "\a64A79AFF\226\128\162   \aFFFFFFFFHit" or "\a6475A7FF\226\128\162   \aFFFFFFFFKilled").x, 
                    size2 = render.measure_text(v136.data.fonts[1], nil, (l_m_iHealth_0 ~= 0 and "\a64A79AFF\226\128\162   \aFFFFFFFFHit" or "\a6475A7FF\226\128\162   \aFFFFFFFFKilled") .. v302).x, 
                    text = (l_m_iHealth_0 ~= 0 and "\a64A79AFF\226\128\162   \aFFFFFFFFHit" or "\a6475A7FF\226\128\162   \aFFFFFFFFKilled") .. v302 .. v300 .. v306 .. " \aFFFFFFFFin " .. v300 .. v303 .. (l_m_iHealth_0 ~= 0 and " \aFFFFFFFFfor " .. v300 .. v292.damage .. " \aFFFFFFFFdamage" or ""), 
                    time = globals.realtime
                });
            end;
        end;
        if v292.state ~= nil and items.visuals.eventlogs.triggers:get(2) then
            local v308 = v22.hitboxes[v292.wanted_hitgroup + 1];
            local v309 = v22.colors[v292.state];
            local l_state_0 = v292.state;
            local v311 = v292.target:get_name();
            local v312 = string.sub(v311, 1, 16) .. (#v311 > 16 and ".." or "");
            local v313 = v309 .. "missed\aB2B2B2FF in " .. v300 .. v312 .. "\aB2B2B2FF's " .. v300 .. v308 .. "\aB2B2B2FF due to " .. v309 .. l_state_0 .. "\aB2B2B2FF (" .. v300 .. v292.target.m_iHealth .. " \aB2B2B2FFhp now)\a626262FF ~ \aB2B2B2FF(" .. v300 .. v292.wanted_damage .. "\aB2B2B2FF) (HC - " .. v300 .. v292.hitchance .. " \a626262FF/ \aB2B2B2FFBT - " .. v300 .. v292.backtrack .. "\aB2B2B2FF)";
            if items.visuals.eventlogs.pos:get(1) then
                print_raw("  " .. v301 .. "\a626262FF  \194\187  " .. v313);
            end;
            if items.visuals.eventlogs.pos:get(2) then
                table.insert(v22.data, 1, {
                    type = "miss", 
                    alpha = 0, 
                    size1 = render.measure_text(v136.data.fonts[1], nil, "\226\128\162   Missed").x, 
                    size2 = render.measure_text(v136.data.fonts[1], nil, "\226\128\162   Missed" .. v302).x, 
                    text = v22.colors[l_state_0] .. "\226\128\162   Missed" .. v302 .. "\aFFFFFFFFshot in " .. v300 .. v312 .. "\aFFFFFFFF's " .. v300 .. v308 .. " \aFFFFFFFFdue to  " .. v22.colors[l_state_0] .. l_state_0, 
                    time = globals.realtime
                });
            end;
        end;
    end;
end;
local function v319(v315)
    -- upvalues: v136 (ref)
    if items.misc.trashtalk:get() then
        local v316 = entity.get_local_player();
        local v317 = entity.get(v315.userid, true);
        local v318 = entity.get(v315.attacker, true);
        if v316 == nil then
            return;
        elseif items.misc.trashtalk.state:get(1) and v318 == v316 and v317 ~= v318 then
            utils.console_exec("say \"" .. v136.data.trashtalk[utils.random_int(1, #v136.data.trashtalk)] .. "\"");
        elseif items.misc.trashtalk.state:get(2) and v318 ~= v316 and v317 == v316 then
            utils.console_exec("say \"" .. v136.data.deathtalk[utils.random_int(1, #v136.data.deathtalk)] .. "\"");
        end;
    end;
end;
local function v339(v320)
    -- upvalues: l_monylinear_0 (ref), v22 (ref), v136 (ref)
    if items.visuals.eventlogs:get() and items.visuals.eventlogs.triggers:get(3) then
        local v321 = nil;
        local v322 = nil;
        local v323, _ = items.visuals.accent:get();
        if v323 == "single" then
            local v325 = unpack(items.visuals.accent:get("single"));
            v322 = unpack(items.visuals.accent:get("single"));
            v321 = v325;
        else
            local v326, v327 = unpack(items.visuals.accent:get("gradient"));
            v322 = v327;
            v321 = v326;
        end;
        local v328 = "\a" .. color(v321.r, v321.g, v321.b, 255):to_hex();
        local v329 = l_monylinear_0:Static("sabbath", {
            color(v321.r, v321.g, v321.b, 255), 
            color(v322.r * 0.7, v322.g * 0.7, v322.b * 0.7, 255)
        });
        local v330 = "          ";
        local l_dmg_health_0 = v320.dmg_health;
        local l_health_0 = v320.health;
        local v333 = entity.get(v320.userid, true);
        local v334 = entity.get(v320.attacker, true);
        local v335 = entity.get_local_player();
        if v334 == nil or v333 ~= v335 or v334 == v335 or v335.m_iHealth <= 0 or v334.m_iTeamNum == v335.m_iTeamNum or v334:get_name() == "CWorld" then
            return;
        else
            local v336 = v334:get_name();
            local v337 = string.sub(v336, 1, 16) .. (#v336 > 16 and ".." or "");
            if items.visuals.eventlogs.pos:get(1) then
                local v338 = (l_health_0 <= 0 and "\aB2B2B2FFkilled" or "\aB2B2B2FFhurt") .. " by " .. v328 .. v337 .. (l_health_0 <= 0 and "" or " \aB2B2B2FFfor " .. v328 .. l_dmg_health_0);
                print_raw("  " .. v329 .. "\a626262FF  \194\187  " .. v338);
            end;
            if items.visuals.eventlogs.pos:get(2) then
                table.insert(v22.data, 1, {
                    type = "hurt", 
                    alpha = 0, 
                    size1 = render.measure_text(v136.data.fonts[1], nil, l_health_0 <= 0 and "\aDE6060FF\226\128\162   Killed" or "\aDE6060FF\226\128\162   Hurt").x, 
                    size2 = render.measure_text(v136.data.fonts[1], nil, (l_health_0 <= 0 and "\aDE6060FF\226\128\162   Killed" or "\aDE6060FF\226\128\162   Hurt") .. v330).x, 
                    text = (l_health_0 <= 0 and "\aDE6060FF\226\128\162   Killed" or "\aDE6060FF\226\128\162   Hurt") .. v330 .. "\aFFFFFFFF by " .. v328 .. v337 .. (l_health_0 <= 0 and "" or " \aFFFFFFFFfor " .. v328 .. l_dmg_health_0), 
                    time = globals.realtime
                });
            end;
        end;
    end;
end;
local function v358(v340)
    -- upvalues: v26 (ref), l_monylinear_0 (ref), v22 (ref), v136 (ref)
    local v341 = entity.get_local_player();
    if v341 == nil or not v341:is_alive() then
        return;
    else
        local v342 = entity.get(v340.userid, true);
        if v342 == nil or not v342:is_alive() or v342:is_dormant() or not v342:is_enemy() then
            return;
        elseif v26.last == globals.tickcount then
            return;
        else
            local v343 = vector(v340.x, v340.y, v340.z);
            local v344 = v342:get_eye_position();
            local v345 = v341:get_eye_position();
            v26.dist = v345:closest_ray_point(v344, v343):dist(v345);
            local v346 = nil;
            local v347 = nil;
            local v348, _ = items.visuals.accent:get();
            if v348 == "single" then
                local v350 = unpack(items.visuals.accent:get("single"));
                v347 = unpack(items.visuals.accent:get("single"));
                v346 = v350;
            else
                local v351, v352 = unpack(items.visuals.accent:get("gradient"));
                v347 = v352;
                v346 = v351;
            end;
            local v353 = "\a" .. color(v346.r, v346.g, v346.b, 255):to_hex();
            local v354 = l_monylinear_0:Static("sabbath", {
                color(v346.r, v346.g, v346.b, 255), 
                color(v347.r * 0.7, v347.g * 0.7, v347.b * 0.7, 255)
            });
            local v355 = "          ";
            if v26.dist < 150 and v26.dist > 40 then
                v26.last = globals.tickcount;
                if items.visuals.eventlogs:get() and items.visuals.eventlogs.triggers:get(4) then
                    local v356 = string.sub(v342:get_name(), 1, 16) .. (#v342:get_name() > 16 and ".." or "");
                    local v357 = "\aB2B2B2FFdeviaded " .. v353 .. v356 .. "\aB2B2B2FF's" .. " \aB2B2B2FFshot";
                    if items.visuals.eventlogs.pos:get(1) then
                        print_raw("  " .. v354 .. "\a626262FF  \194\187  " .. v357);
                    end;
                    if items.visuals.eventlogs.pos:get(2) then
                        table.insert(v22.data, 1, {
                            type = "deviade", 
                            alpha = 0, 
                            size1 = render.measure_text(v136.data.fonts[1], nil, "\a7D64A7FF\226\128\162   \aFFFFFFFFDeviaded").x, 
                            size2 = render.measure_text(v136.data.fonts[1], nil, "\a7D64A7FF\226\128\162   \aFFFFFFFFDeviaded" .. v355).x, 
                            text = "\a7D64A7FF\226\128\162   \aFFFFFFFFDeviaded" .. v355 .. v353 .. v356 .. "\aFFFFFFFF's " .. "\aFFFFFFFFshot", 
                            time = globals.realtime
                        });
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v380(v359)
    -- upvalues: v29 (ref), l_monylinear_0 (ref), v22 (ref), v136 (ref)
    if items.visuals.eventlogs:get() and items.visuals.eventlogs.triggers:get(1) then
        local v360 = nil;
        local v361 = nil;
        local v362, _ = items.visuals.accent:get();
        if v362 == "single" then
            local v364 = unpack(items.visuals.accent:get("single"));
            v361 = unpack(items.visuals.accent:get("single"));
            v360 = v364;
        elseif v362 == "gradient" then
            local v365, v366 = unpack(items.visuals.accent:get("gradient"));
            v361 = v366;
            v360 = v365;
        else
            local l_l_0 = v29.l;
            v361 = v29.r;
            v360 = l_l_0;
        end;
        local v368 = "\a" .. color(v360.r, v360.g, v360.b, 255):to_hex();
        local v369 = l_monylinear_0:Static("sabbath", {
            color(v360.r, v360.g, v360.b, 255), 
            color(v361.r * 0.7, v361.g * 0.7, v361.b * 0.7, 255)
        });
        local v370 = "          ";
        local l_dmg_health_1 = v359.dmg_health;
        local l_health_1 = v359.health;
        local v373 = entity.get(v359.userid, true);
        local v374 = entity.get(v359.attacker, true);
        local v375 = entity.get_local_player();
        if v373 == nil or v373 == v375 or v375 == nil or v375.m_iHealth <= 0 or v374 ~= v375 then
            return;
        else
            local v376 = v373:get_name();
            local v377 = string.sub(v376, 1, 16) .. (#v376 > 16 and ".." or "");
            if v359.weapon == "hegrenade" or v359.weapon == "molotov" or v359.weapon == "incgrenade" then
                if items.visuals.eventlogs.pos:get(1) then
                    local v378 = (l_health_1 <= 0 and "\aB2B2B2FFkilled " or "\aB2B2B2FFnaded ") .. v368 .. v377 .. (l_health_1 <= 0 and "" or " \aB2B2B2FFfor " .. v368 .. l_dmg_health_1);
                    print_raw("  " .. v369 .. "\a626262FF  \194\187  " .. v378);
                end;
                if items.visuals.eventlogs.pos:get(2) then
                    table.insert(v22.data, 1, {
                        type = "nade", 
                        alpha = 0, 
                        size1 = render.measure_text(v136.data.fonts[1], nil, l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFKilled" or "\a64A79AFF\226\128\162   \aFFFFFFFFNaded").x, 
                        size2 = render.measure_text(v136.data.fonts[1], nil, (l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFKilled" or "\a64A79AFF\226\128\162   \aFFFFFFFFNaded") .. v370).x, 
                        text = (l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFKilled" or "\a64A79AFF\226\128\162   \aFFFFFFFFNaded") .. v370 .. v368 .. v377 .. (l_health_1 <= 0 and "" or " \aFFFFFFFFfor " .. v368 .. l_dmg_health_1), 
                        time = globals.realtime
                    });
                end;
            elseif v359.weapon == "knife" then
                if items.visuals.eventlogs.pos:get(1) then
                    local v379 = "\aB2B2B2FFknifed " .. v368 .. v377 .. (l_health_1 <= 0 and "" or " \aB2B2B2FFfor " .. v368 .. l_dmg_health_1);
                    print_raw("  " .. v369 .. "\a626262FF  \194\187  " .. v379);
                end;
                if items.visuals.eventlogs.pos:get(2) then
                    table.insert(v22.data, 1, {
                        type = "knife", 
                        alpha = 0, 
                        size1 = render.measure_text(v136.data.fonts[1], nil, l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFStabbed" or "\a64A79AFF\226\128\162   \aFFFFFFFFKnifed").x, 
                        size2 = render.measure_text(v136.data.fonts[1], nil, (l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFStabbed" or "\a64A79AFF\226\128\162   \aFFFFFFFFKnifed") .. v370).x, 
                        text = (l_health_1 <= 0 and "\a6475A7FF\226\128\162   \aFFFFFFFFStabbed" or "\a64A79AFF\226\128\162   \aFFFFFFFFKnifed") .. v370 .. v368 .. v377 .. (l_health_1 <= 0 and "" or " \aFFFFFFFFfor " .. v368 .. l_dmg_health_1), 
                        time = globals.realtime
                    });
                end;
            end;
        end;
    end;
end;
local function v406()
    local v381 = entity.get_local_player();
    if v381 == nil then
        return;
    else
        local v382 = v381:get_origin();
        local v383 = entity.get_entities("CSmokeGrenadeProjectile");
        local v384 = entity.get_entities("CInferno");
        local v385 = {
            [1] = {
                draw = false, 
                time = 0, 
                alpha = 0, 
                percentage = 0, 
                position = vector(0, 0, 0)
            }
        };
        local v386 = {
            [1] = {
                radius = 0, 
                time = 0, 
                draw = false, 
                teammate = false, 
                alpha = 0, 
                percentage = 0, 
                position = vector(0, 0, 0)
            }
        };
        local l_tickcount_0 = globals.tickcount;
        local l_tickinterval_0 = globals.tickinterval;
        local v389 = 600;
        if v383 ~= nil then
            for v390, v391 in pairs(v383) do
                if v385[v390] == nil then
                    v385[v390] = {};
                end;
                v385[v390].time = l_tickinterval_0 * (l_tickcount_0 - v391.m_nSmokeEffectTickBegin);
                v385[v390].percentage = (17.55 - l_tickinterval_0 * (l_tickcount_0 - v391.m_nSmokeEffectTickBegin)) / 17.55;
                v385[v390].position = v391:get_origin();
                v385[v390].alpha = v391:get_bbox().alpha * 255;
                if v391.m_bDidSmokeEffect and v382:dist(v385[v390].position) < v389 then
                    v385[v390].draw = true;
                end;
            end;
        end;
        if v384 ~= nil then
            for v392, v393 in pairs(v384) do
                if v386[v392] == nil then
                    v386[v392] = {};
                end;
                v386[v392].time = l_tickinterval_0 * (l_tickcount_0 - v393.m_nFireEffectTickBegin);
                v386[v392].percentage = (7 - l_tickinterval_0 * (l_tickcount_0 - v393.m_nFireEffectTickBegin)) / 7;
                v386[v392].position = v393:get_origin();
                v386[v392].alpha = v393:get_bbox().alpha * 255;
                local l_m_hOwnerEntity_0 = v393.m_hOwnerEntity;
                if thrower ~= nil and is_not_friendly_fire and l_m_hOwnerEntity_0 ~= v381 and not l_m_hOwnerEntity_0:is_enemy() then
                    v386[v392].teammate = true;
                end;
                local v395 = 40;
                local _ = 0;
                local v397 = {};
                local v398 = 0;
                local v399 = nil;
                local v400 = nil;
                for v401 = 1, 64 do
                    if v393.m_bFireIsBurning[v401] == true then
                        table.insert(v397, vector(v393.m_fireXDelta[v401], v393.m_fireYDelta[v401], v393.m_fireZDelta[v401]));
                    end;
                end;
                local v402 = #v397;
                for v403 = 1, v402 do
                    for v404 = 1, v402 do
                        local v405 = v397[v403]:dist(v397[v404]);
                        if v398 < v405 then
                            v398 = v405;
                            v399 = v397[v403];
                            v400 = v397[v404];
                        end;
                    end;
                end;
                if v399 ~= nil and v400 ~= nil and v382:dist(v386[v392].position) < v389 then
                    v386[v392].draw = true;
                    v386[v392].radius = v398 / 2 + v395;
                end;
            end;
        end;
        return {
            smoke = v385, 
            molotov = v386
        };
    end;
end;
({
    step = 1, 
    speed = 3, 
    list = {
        [1] = "$>\226\160\128\226\160\128\226\160\128\226\160\128", 
        [2] = "$a>\226\160\128\226\160\128\226\160\128\226\160\128", 
        [3] = "$ab>\226\160\128  \226\160\128\226\160\128", 
        [4] = "$abb>\226\160\128\226\160\128\226\160\128", 
        [5] = "$abba>\226\160\128\226\160\128\226\160\128", 
        [6] = "$abbat>\226\160\128\226\160\128", 
        [7] = "$abbath>", 
        [8] = "\226\156\168\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128", 
        [9] = "\226\160\128\226\156\168\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128", 
        [10] = "\226\160\128\226\160\128\226\156\168\226\160\128\226\160\128\226\160\128\226\160\128", 
        [11] = "\226\160\128\226\160\128\226\160\128\226\156\168\226\160\128\226\160\128\226\160\128", 
        [12] = "\226\160\128\226\160\128\226\160\128\226\160\128\226\156\168\226\160\128\226\160\128", 
        [13] = "\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128\226\156\168\226\160\128", 
        [14] = "\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128\226\160\128\226\156\168"
    }, 
    run = function(v407)
        -- upvalues: v136 (ref)
        local function v409()
            -- upvalues: v407 (ref), v136 (ref)
            local v408 = math.floor(globals.curtime * v407.speed + 0.5) % #v407.list + 1;
            if v408 == v407.step then
                return;
            else
                v407.step = v408;
                v136.ref.misc.clantag:override(false);
                common.set_clan_tag(v407.list[v408]);
                return;
            end;
        end;
        items.misc.clantag:set_callback(function(v410)
            -- upvalues: v409 (ref)
            if v410:get() then
                events.net_update_end:set(v409);
            else
                events.net_update_end:unset(v409);
                common.set_clan_tag("");
            end;
        end, true);
    end
}):run();
local v411 = "726d4f4ac00bbbc8337fd305294f582a";
local v412 = "your link to tab icon";
local function v414()
    -- upvalues: v411 (ref)
    events.voice_message:call(function(v413)
        -- upvalues: v411 (ref)
        v413:write_bits(22153, 128);
        v413:crypt(v411);
    end);
end;
local function v418()
    -- upvalues: v411 (ref)
    local v415 = entity.get_local_player();
    if v415 == nil then
        return;
    else
        v415:set_icon();
        events.voice_message:call(function(v416)
            -- upvalues: v411 (ref)
            v416:write_bits(25729, 128);
            v416:crypt(v411);
        end);
        entity.get_players(false, true, function(v417)
            v417:set_icon();
        end);
        return;
    end;
end;
local function v421()
    -- upvalues: v412 (ref), v411 (ref)
    local v419 = entity.get_local_player();
    if v419 == nil then
        return;
    else
        utils.execute_after(0.5, function()
            -- upvalues: v419 (ref), v412 (ref)
            v419:set_icon(v412);
        end);
        events.voice_message:call(function(v420)
            -- upvalues: v411 (ref)
            v420:write_bits(13842, 128);
            v420:crypt(v411);
        end);
        return;
    end;
end;
events.voice_message(function(v422)
    -- upvalues: v411 (ref), v412 (ref), v414 (ref)
    if items.misc.shared:get() then
        local l_buffer_0 = v422.buffer;
        local v424 = entity.get_local_player();
        if v424 == nil then
            return;
        elseif v422.entity == v424 then
            return;
        else
            l_buffer_0:crypt(v411);
            local v425 = l_buffer_0:read_bits(128);
            if v422.entity == nil then
                return;
            elseif v422.entity:is_bot() then
                return;
            elseif v425 == 22153 then
                v422.entity:set_icon(v412);
            elseif v425 == 25729 then
                v422.entity:set_icon();
            elseif v425 == 13842 then
                utils.execute_after(0.3, v414);
                v422.entity:set_icon(v412);
            end;
        end;
    end;
end);
items.misc.shared:set_callback(function(v426)
    -- upvalues: v414 (ref), v421 (ref), v418 (ref)
    if v426:get() then
        utils.execute_after(0.1, v414);
        utils.execute_after(0.5, v421);
    end;
    if not v426:get() then
        v418();
    end;
end, true);
events.round_start:set(function()
    if not items.misc.shared:get() then
        local v427 = entity.get_local_player();
        if v427 == nil then
            return;
        else
            v427:set_icon();
        end;
    end;
end);
events.level_init:set(v421);
events.shutdown:set(v418);
v20.list = {};
v20.tabs = {};
v20.darkbool = false;
v20.onx = false;
v20.ony = false;
v20.__index = v20;
v20.new = function(v428, v429, v430, v431, v432, v433)
    -- upvalues: v20 (ref)
    local v434 = {
        dragbool = false, 
        bool = false, 
        pos = vector(v428[1]:get(), v428[2]:get()), 
        size = v429, 
        add = v430, 
        dragpos = vector(), 
        on = on, 
        name = v431, 
        dock = v432, 
        func = v433, 
        get_pos = {
            x = v428[1], 
            y = v428[2]
        }
    };
    table.insert(v20.tabs, v434);
    return setmetatable(v434, v20);
end;
v20.limitpos = function(v435)
    -- upvalues: v136 (ref), v20 (ref)
    if v435.pos.x + v435.add.x <= 0 then
        v435.pos.x = -v435.add.x + 0;
    end;
    if v435.pos.x + v435.size.x >= v136.data.fullscreen.x - 1 then
        v435.pos.x = v136.data.fullscreen.x - v435.size.x - 1;
    end;
    if v435.pos.y <= 0 then
        v435.pos.y = 0;
    end;
    if v435.pos.y + v435.size.y >= v136.data.fullscreen.y - 1 then
        v435.pos.y = v136.data.fullscreen.y - v435.size.y - 1;
    end;
    local _ = ui.get_mouse_position();
    if v435.dock == false then
        return;
    else
        if items.visuals.settings.docking:get() then
            if v435.pos.x + v435.add.x / 2 + v435.size.x / 2 >= v136.data.screen.x - 20 and v435.pos.x + v435.add.x / 2 + v435.size.x / 2 <= v136.data.screen.x + 20 then
                v435.pos.x = v136.data.screen.x - v435.size.x / 2 - v435.add.x / 2;
                v20.onx = true;
            else
                v20.onx = false;
            end;
            if v435.pos.y + v435.size.y / 2 <= 60 then
                v435.pos.y = 40 - v435.size.y / 2;
                v20.ony = true;
            else
                v20.ony = false;
            end;
            if v435.pos.y + v435.size.y / 2 >= v136.data.fullscreen.y - 60 then
                v435.pos.y = v136.data.fullscreen.y - 40 - v435.size.y / 2;
                v20.ony = true;
            end;
        end;
        return;
    end;
end;
v20.get_on = function(v437, v438)
    if ui.get_alpha() ~= 0 then
        return v438.x >= v437.pos.x + v437.add.x and v438.x <= v437.pos.x + v437.size.x and v438.y >= v437.pos.y + v437.add.y and v438.y <= v437.pos.y + v437.size.y;
    else
        return false;
    end;
end;
v20.update = function(v439, ...)
    -- upvalues: v20 (ref)
    if ui.get_alpha() == 1 then
        local v440 = ui.get_mouse_position();
        local v441 = v439:get_on(v440);
        v439.on = v439.bool and v441 or false;
        local l_list_0 = v20.list;
        local v443 = common.is_button_down(1);
        if (v441 or v439.dragbool) and v439.bool and v443 and (l_list_0.target == "" or l_list_0.target == v439.name) then
            l_list_0.target = v439.name;
            if not v439.dragbool then
                v439.dragbool = true;
                v20.darkbool = true;
                v439.dragpos = v440 - v439.pos;
            else
                v439.pos = v440 - v439.dragpos;
                v439:limitpos();
                v439.get_pos.x:set(math.floor(v439.pos.x));
                v439.get_pos.y:set(math.floor(v439.pos.y));
            end;
        elseif not v443 then
            l_list_0.target = "";
            v439.dragbool = false;
            v20.darkbool = false;
            v439.dragpos = vector();
        end;
    end;
    v439:func(...);
end;
v20.preset = function()
    -- upvalues: v20 (ref)
    for _, v445 in pairs(v20.tabs) do
        v445.pos = vector(v445.get_pos.x:get(), v445.get_pos.y:get());
    end;
end;
v20.vars = {
    darken = {
        alpha = l_animations_0.new("windows.vars.darken.alpha"), 
        x = l_animations_0.new("windows.vars.darken.x"), 
        y = l_animations_0.new("windows.vars.darken.y"), 
        docking = l_animations_0.new("windows.vars.darken.docking")
    }, 
    select = {
        is = 20, 
        alpha = 10, 
        on = 20, 
        color = color(255, 255, 255)
    }, 
    watermark = {
        alpha = l_animations_0.new("windows.vars.watermark.alpha"), 
        width = l_animations_0.new("windows.vars.watermark.width"), 
        on = l_animations_0.new("windows.vars.watermark.on"), 
        is = l_animations_0.new("windows.vars.watermark.is")
    }, 
    keybinds = {
        alpha = l_animations_0.new("windows.vars.keybinds.alpha"), 
        width = l_animations_0.new("windows.vars.keybinds.width", 130), 
        on = l_animations_0.new("windows.vars.keybinds.on"), 
        is = l_animations_0.new("windows.vars.keybinds.is")
    }, 
    spectators = {
        players = {}, 
        m_alpha = {
            [""] = 0
        }, 
        alpha = l_animations_0.new("windows.vars.spectators.alpha"), 
        width = l_animations_0.new("windows.vars.spectators.width", 130), 
        on = l_animations_0.new("windows.vars.spectators.on"), 
        is = l_animations_0.new("windows.vars.spectators.is"), 
        specs = {
            alpha = 0, 
            active = {}, 
            contents = {}, 
            unsorted = {}
        }
    }, 
    status = {
        alpha = l_animations_0.new("windows.vars.status.alpha"), 
        slow = l_animations_0.new("windows.vars.status.slow"), 
        time = l_animations_0.new("windows.vars.status.time"), 
        up = l_animations_0.new("windows.vars.status.up", 80), 
        on = l_animations_0.new("windows.vars.status.on"), 
        is = l_animations_0.new("windows.vars.status.is")
    }, 
    indicators = {
        alpha = l_animations_0.new("windows.vars.indicators.alpha"), 
        height = l_animations_0.new("windows.vars.indicators.height"), 
        scope = l_animations_0.new("windows.vars.indicators.scope"), 
        state = l_animations_0.new("windows.vars.indicators.state"), 
        dt = l_animations_0.new("windows.vars.indicators.dt"), 
        dtready = l_animations_0.new("windows.vars.indicators.dtready"), 
        hs = l_animations_0.new("windows.vars.indicators.hs"), 
        pa = l_animations_0.new("windows.vars.indicators.pa"), 
        ba = l_animations_0.new("windows.vars.indicators.ba"), 
        fs = l_animations_0.new("windows.vars.indicators.fs"), 
        on = l_animations_0.new("windows.vars.indicators.on"), 
        is = l_animations_0.new("windows.vars.indicators.is"), 
        conditions = {
            [1] = "0", 
            [2] = "STAND", 
            [3] = "RUN", 
            [4] = "WALK", 
            [5] = "DUCK", 
            [6] = "DUCK-WALK", 
            [7] = "AIR", 
            [8] = "AIR+"
        }
    }, 
    mindamage = {
        alpha = l_animations_0.new("windows.vars.mindamage.alpha"), 
        number = l_animations_0.new("windows.vars.mindamage.number"), 
        on = l_animations_0.new("windows.vars.mindamage.on"), 
        is = l_animations_0.new("windows.vars.mindamage.is")
    }, 
    eventlogs = {
        alpha = l_animations_0.new("windows.vars.eventlogs.alpha"), 
        preview = l_animations_0.new("windows.vars.eventlogs.preview"), 
        on = l_animations_0.new("windows.vars.eventlogs.on"), 
        is = l_animations_0.new("windows.vars.eventlogs.is")
    }, 
    arrows = {
        alpha = l_animations_0.new("windows.vars.arrows.alpha"), 
        scope = l_animations_0.new("windows.vars.arrows.scope"), 
        on = l_animations_0.new("windows.vars.arrows.on"), 
        is = l_animations_0.new("windows.vars.arrows.is")
    }, 
    infopanel = {
        alpha = l_animations_0.new("windows.vars.infopanel.alpha")
    }, 
    scope = {
        alpha = l_animations_0.new("windows.vars.scope.alpha"), 
        color = l_animations_0.new("windows.vars.scope.color")
    }, 
    aspect = {
        alpha = l_animations_0.new("windows.vars.aspect.alpha")
    }
};
v20.watermark = v20.new({
    [1] = items.visuals.watermark.x_pos, 
    [2] = items.visuals.watermark.y_pos
}, vector(10, 34), vector(-250, 0), "watermark", true, function(v446)
    -- upvalues: v20 (ref), l_animations_0 (ref), v136 (ref), v29 (ref), v24 (ref), v25 (ref), l_clamp_0 (ref), l_ceil_0 (ref), v252 (ref), v37 (ref)
    v446.bool = items.visuals.watermark:get();
    local v447 = v20.vars.watermark.alpha:update(l_animations_0.types.OUT_QUINT, items.visuals.watermark:get() and (items.visuals.watermark.build:get() or items.visuals.watermark.user:get() or items.visuals.watermark.fakechance:get() or items.visuals.watermark.delay:get() or items.visuals.watermark.time:get()) and 100 or 0, 0.03) / 100;
    if v447 == 0 then
        return;
    else
        local v448 = items.visuals.watermark.customname:get();
        local v449 = v448 ~= "" and v448 ~= " " and v448 ~= "  " and v448 ~= "   " and string.sub(v448, 1, 16) .. (#v448 > 16 and ".." or "") or v136.data.username;
        local _ = render.measure_text(v136.data.fonts[1], nil, v449).x;
        local v451 = {};
        local v452 = 0;
        local v453 = 0;
        local v454 = nil;
        local v455 = nil;
        local v456, _ = items.visuals.accent:get();
        if v456 == "single" then
            local v458 = unpack(items.visuals.accent:get("single"));
            v455 = unpack(items.visuals.accent:get("single"));
            v454 = v458;
        elseif v456 == "gradient" then
            local v459, v460 = unpack(items.visuals.accent:get("gradient"));
            v455 = v460;
            v454 = v459;
        else
            local l_l_1 = v29.l;
            v455 = v29.r;
            v454 = l_l_1;
        end;
        if ui.get_alpha() ~= 0 then
            on = v20.vars.watermark.on:update(l_animations_0.types.OUT_QUINT, v446.on and 100 or 0) / 100;
            is = v20.vars.watermark.is:update(l_animations_0.types.OUT_QUINT, v446.dragbool and 100 or 0) / 100;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v446.pos.x + v446.add.x, v446.pos.y), vector(v446.pos.x + v446.size.x, v446.pos.y + v446.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * v447), 6);
            render.rect_outline(vector(v446.pos.x + v446.add.x, v446.pos.y), vector(v446.pos.x + v446.size.x, v446.pos.y + v446.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * v447), 1, 6);
        end;
        if items.visuals.watermark.build:get() then
            table.insert(v451, "sabbath " .. ui.get_icon("sparkles"));
            if items.visuals.watermark.style:get() == 1 then
                v24.rectblur(vector(v446.pos.x + 5 + v446.add.x, v446.pos.y + 5), vector(v446.pos.x + v446.size.x - 5 + v446.add.x + render.measure_text(v136.data.fonts[3], nil, "sabbath " .. ui.get_icon("sparkles")).x + 13, v446.pos.y + v446.size.y - 5), color(0, 0, 0, 100), v447, 4);
            end;
        end;
        if items.visuals.watermark.avatar:get() and items.visuals.watermark.user:get() then
            table.insert(v451, "   ");
        end;
        if items.visuals.watermark.user:get() then
            table.insert(v451, (items.visuals.watermark.avatar:get() and "" or ui.get_icon("user") .. "  ") .. "\aFFFFFFFF" .. v449);
        end;
        if items.visuals.watermark.fakechance:get() then
            local v462 = v25.des / 53;
            local v463 = color(255, 255 * v462, 255 * v462, 255):to_hex();
            table.insert(v451, ui.get_icon("rotate-exclamation") .. "  \a" .. v463 .. l_clamp_0(l_ceil_0(v462 * 100), 0, 100) .. " \aFFFFFFFF%");
        end;
        if items.visuals.watermark.delay:get() then
            table.insert(v451, ui.get_icon("street-view") .. "  \aFFFFFFFF" .. v252() .. " ms");
        end;
        if items.visuals.watermark.time:get() then
            local v464 = common.get_system_time();
            local v465 = string.format("%02d:%02d", v464.hours > 12 and v464.hours - 12 or v464.hours, v464.minutes) .. "" .. (v464.hours > 12 and " PM" or " AM");
            table.insert(v451, ui.get_icon("hourglass") .. "  \aFFFFFFFF" .. v465);
        end;
        for v466 = 1, #v451 do
            v452 = v452 + render.measure_text(v451[v466] == "sabbath " .. ui.get_icon("sparkles") and v136.data.fonts[3] or v136.data.fonts[1], nil, v451[#v451 - v466 + 1]).x + 15;
        end;
        local v467 = v20.vars.watermark.width:update(l_animations_0.types.OUT_QUINT, v452);
        if (items.visuals.watermark.user:get() or items.visuals.watermark.delay:get() or items.visuals.watermark.time:get() or items.visuals.watermark.fakechance:get()) and items.visuals.watermark.style:get() == 1 then
            v24.rectblur(vector(v446.pos.x + 5 + v446.add.x + (items.visuals.watermark.build:get() and render.measure_text(v136.data.fonts[3], nil, "sabbath " .. ui.get_icon("sparkles")).x + 15 or 0), v446.pos.y + 5), vector(v446.pos.x + v446.size.x - 5, v446.pos.y + v446.size.y - 5), color(0, 0, 0, 100), v447, 4);
            v24.verticalgrad(vector(v446.pos.x + 5 + v446.add.x + (items.visuals.watermark.build:get() and render.measure_text(v136.data.fonts[3], nil, "sabbath " .. ui.get_icon("sparkles")).x + 15 or 0), v446.pos.y + 5), vector(v446.pos.x + 5 + v446.add.x + (items.visuals.watermark.build:get() and render.measure_text(v136.data.fonts[3], nil, "sabbath " .. ui.get_icon("sparkles")).x + 15 or 0), v446.pos.y + v446.size.y - 5), v454, v455, v447);
        end;
        for v468 = 1, #v451 do
            if v451[v468] == "   " and items.visuals.watermark.avatar:get() and items.visuals.watermark.user:get() then
                render.texture(v37, vector(v446.pos.x + 12 + v446.add.x + v453, v446.pos.y + 9), vector(16, 16), color(255, 255, 255, 255 * v447), nil, 10);
            end;
            render.text(v451[v468] == "sabbath " .. ui.get_icon("sparkles") and v136.data.fonts[3] or v136.data.fonts[1], vector(v446.pos.x + 12 + v446.add.x + v453, v446.pos.y + 11 + (v451[v468] == "sabbath " .. ui.get_icon("sparkles") and -1 or 0)), color(v454.r, v454.g, v454.b, 255 * v447), nil, v451[v468]);
            v453 = v453 + render.measure_text(v451[v468] == "sabbath " .. ui.get_icon("sparkles") and v136.data.fonts[3] or v136.data.fonts[1], nil, v451[v468]).x + 15;
        end;
        v446.add.x = -v467;
        return;
    end;
end);
v20.keybinds = v20.new({
    [1] = items.visuals.keybinds.x_pos, 
    [2] = items.visuals.keybinds.y_pos
}, vector(130, 35), vector(0, 0), "keybinds", true, function(v469)
    -- upvalues: v136 (ref), v20 (ref), l_animations_0 (ref), v29 (ref), v24 (ref)
    v469.bool = items.visuals.keybinds:get();
    local v470 = ui.get_binds();
    local v471 = false;
    local v472 = 30;
    local v473 = 0;
    for v474 = 1, #v470 do
        local l_name_0 = v470[v474].name;
        local v476 = render.measure_text(v136.data.fonts[1], nil, l_name_0).x - 30;
        if v470[v474].active then
            v471 = true;
            if v472 < v476 and v476 then
                v472 = v476;
            end;
        end;
    end;
    local l_alpha_0 = v20.vars.keybinds.alpha;
    local l_l_alpha_0_0 = l_alpha_0;
    l_alpha_0 = l_alpha_0.update;
    local l_OUT_QUINT_0 = l_animations_0.types.OUT_QUINT;
    local v480;
    if items.visuals.keybinds:get() then
        v480 = ui.get_alpha() == 1 and 100 or v471 and 100 or 0;
    else
        v480 = 0;
    end;
    l_alpha_0 = l_alpha_0(l_l_alpha_0_0, l_OUT_QUINT_0, v480, 0.03) / 100;
    if l_alpha_0 == 0 then
        return;
    else
        l_l_alpha_0_0 = nil;
        l_OUT_QUINT_0 = nil;
        local v481;
        v480, v481 = items.visuals.accent:get();
        if v480 == "single" then
            local v482 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_0 = unpack(items.visuals.accent:get("single"));
            l_l_alpha_0_0 = v482;
        elseif v480 == "gradient" then
            local v483, v484 = unpack(items.visuals.accent:get("gradient"));
            l_OUT_QUINT_0 = v484;
            l_l_alpha_0_0 = v483;
        else
            local l_l_2 = v29.l;
            l_OUT_QUINT_0 = v29.r;
            l_l_alpha_0_0 = l_l_2;
        end;
        local v486 = v20.vars.keybinds.width:update(l_animations_0.types.OUT_QUINT, v472 + 100);
        if ui.get_alpha() ~= 0 then
            on = v20.vars.keybinds.on:update(l_animations_0.types.OUT_QUINT, v469.on and 100 or 0) / 100;
            is = v20.vars.keybinds.is:update(l_animations_0.types.OUT_QUINT, v469.dragbool and 100 or 0) / 100;
        end;
        v469.size.x = v486;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v469.pos.x, v469.pos.y), vector(v469.pos.x + v469.size.x, v469.pos.y + v469.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_0), 6);
            render.rect_outline(vector(v469.pos.x, v469.pos.y), vector(v469.pos.x + v469.size.x, v469.pos.y + v469.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_0), 1, 6);
        end;
        for v487 = 1, #v470 do
            local l_name_1 = v470[v487].name;
            local l_value_0 = v470[v487].value;
            local v490;
            if type(l_value_0) ~= "number" then
                v490 = v470[v487].mode == 1 and "hold" or v470[v487].mode == 2 and "on" or "?";
            else
                v490 = l_animations_0.new("windows.vars.keybinds.value" .. l_name_1, l_value_0):update(l_animations_0.types.OUT_QUINT, l_value_0);
            end;
            local v491 = l_animations_0.new("windows.vars.keybinds.loop" .. l_name_1, 0):update(l_animations_0.types.OUT_QUINT, v470[v487].active and 100 or 0, 0.03) / 100;
            local v492 = -21 * -(v491 - 1);
            v24.rectblur(vector(v469.pos.x + 8, v469.pos.y + 33 + v473 + v492), vector(v469.pos.x + v469.size.x - 8, v469.pos.y + 52 + v473 + v492), color(0, 0, 0, 85), v491 * l_alpha_0, 4);
            render.text(v136.data.fonts[1], vector(v469.pos.x + 14, v469.pos.y + 36 + v473 + v492), color(255, 255, 255, 255 * v491 * l_alpha_0), nil, l_name_1);
            local l_text_0 = render.text;
            local v494 = v136.data.fonts[1];
            local l_vector_0 = vector;
            local v496 = v469.pos.x + v469.size.x - 15;
            local l_measure_text_0 = render.measure_text;
            local v498 = v136.data.fonts[1];
            local v499 = nil;
            local v500;
            if type(bind_value) == "number" or not v490 then
                v500 = num;
            else
                v500 = v490;
            end;
            l_text_0(v494, l_vector_0(v496 - l_measure_text_0(v498, v499, v500).x, v469.pos.y + 36 + v473 + v492), color(l_OUT_QUINT_0.r, l_OUT_QUINT_0.g, l_OUT_QUINT_0.b, 255 * v491 * l_alpha_0), nil, v490);
            v473 = v473 + 21 * v491;
        end;
        v24.rectblur(vector(v469.pos.x + 5, v469.pos.y + 5), vector(v469.pos.x + v469.size.x - 5, v469.pos.y + v469.size.y - 7), color(0, 0, 0, 150), l_alpha_0, {
            [1] = 5, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0
        });
        render.gradient(vector(v469.pos.x + 5, v469.pos.y + v469.size.y - 7), vector(v469.pos.x + v469.size.x - 5, v469.pos.y + v469.size.y - 5), color(l_l_alpha_0_0.r, l_l_alpha_0_0.g, l_l_alpha_0_0.b, 255 * l_alpha_0), color(l_OUT_QUINT_0.r, l_OUT_QUINT_0.g, l_OUT_QUINT_0.b, 255 * l_alpha_0), color(l_l_alpha_0_0.r, l_l_alpha_0_0.g, l_l_alpha_0_0.b, 255 * l_alpha_0), color(l_OUT_QUINT_0.r, l_OUT_QUINT_0.g, l_OUT_QUINT_0.b, 255 * l_alpha_0), {
            [1] = 0, 
            [2] = 0, 
            [3] = 20, 
            [4] = 20
        });
        v24.horizontalgrad(vector(v469.pos.x + 5, v469.pos.y + v469.size.y - 7), vector(v469.pos.x + v469.size.x - 5, v469.pos.y + v469.size.y - 5), l_l_alpha_0_0, l_OUT_QUINT_0, l_alpha_0, {
            [1] = 0, 
            [2] = 0, 
            [3] = 20, 
            [4] = 20
        });
        render.text(v136.data.fonts[1], vector(v469.pos.x + v469.size.x / 2, v469.pos.y + 16), color(255, 255, 255, 255 * l_alpha_0), "c", "Keybinds");
        return;
    end;
end);
v20.spectators = v20.new({
    [1] = items.visuals.spectators.x_pos, 
    [2] = items.visuals.spectators.y_pos
}, vector(130, 35), vector(0, 0), "spectators", true, function(v501)
    -- upvalues: v249 (ref), v20 (ref), l_animations_0 (ref), v29 (ref), v136 (ref), v24 (ref)
    v501.bool = items.visuals.spectators:get();
    local v502 = v249() == nil and {} or v249();
    local v503 = 30;
    local v504 = 0;
    for v505 = 1, 32 do
        v20.vars.spectators.specs.unsorted[v505] = {
            active = false, 
            idx = v505
        };
    end;
    for _, v507 in pairs(v502) do
        local v508 = v507:get_index();
        do
            local l_v507_0 = v507;
            do
                local l_v508_0 = v508;
                v20.vars.spectators.specs.unsorted[l_v508_0] = {
                    idx = l_v508_0, 
                    active = (function()
                        -- upvalues: l_v507_0 (ref)
                        if l_v507_0 == me then
                            return false;
                        else
                            return true;
                        end;
                    end)(), 
                    avatar = (function()
                        -- upvalues: l_v507_0 (ref), v20 (ref), l_v508_0 (ref)
                        local v511 = l_v507_0:get_steam_avatar();
                        if v511 == nil then
                            return nil;
                        else
                            if v20.vars.spectators.specs.contents[l_v508_0] == nil or v20.vars.spectators.specs.contents[l_v508_0].conts ~= v511 then
                                v20.vars.spectators.specs.contents[l_v508_0] = {
                                    conts = v511, 
                                    texture = v511
                                };
                            end;
                            return v20.vars.spectators.specs.contents[l_v508_0].texture;
                        end;
                    end)()
                };
            end;
        end;
    end;
    local l_alpha_1 = v20.vars.spectators.alpha;
    local l_l_alpha_1_0 = l_alpha_1;
    l_alpha_1 = l_alpha_1.update;
    local l_OUT_QUINT_1 = l_animations_0.types.OUT_QUINT;
    local v515;
    if items.visuals.spectators:get() then
        v515 = ui.get_alpha() == 1 and 100 or #v502 ~= 0 and 100 or 0;
    else
        v515 = 0;
    end;
    l_alpha_1 = l_alpha_1(l_l_alpha_1_0, l_OUT_QUINT_1, v515, 0.03) / 100;
    if l_alpha_1 == 0 then
        return;
    else
        l_l_alpha_1_0 = nil;
        l_OUT_QUINT_1 = nil;
        local v516;
        v515, v516 = items.visuals.accent:get();
        if v515 == "single" then
            local v517 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_1 = unpack(items.visuals.accent:get("single"));
            l_l_alpha_1_0 = v517;
        elseif v515 == "gradient" then
            local v518, v519 = unpack(items.visuals.accent:get("gradient"));
            l_OUT_QUINT_1 = v519;
            l_l_alpha_1_0 = v518;
        else
            local l_l_3 = v29.l;
            l_OUT_QUINT_1 = v29.r;
            l_l_alpha_1_0 = l_l_3;
        end;
        local v521 = false;
        if ui.get_alpha() ~= 0 then
            on = v20.vars.spectators.on:update(l_animations_0.types.OUT_QUINT, v501.on and 100 or 0) / 100;
            is = v20.vars.spectators.is:update(l_animations_0.types.OUT_QUINT, v501.dragbool and 100 or 0) / 100;
        end;
        for _, v523 in pairs(v20.vars.spectators.specs.unsorted) do
            local l_idx_0 = v523.idx;
            local v525 = "";
            local v526 = entity.get(l_idx_0);
            if v526 then
                v525 = string.sub(v526:get_name(), 1, 25);
            end;
            if not v20.vars.spectators.m_alpha[l_idx_0] then
                v20.vars.spectators.m_alpha[l_idx_0] = 0;
            end;
            v20.vars.spectators.m_alpha[l_idx_0] = l_animations_0.new("windows.vars.spectators.m_alpha" .. l_idx_0, 0):update(l_animations_0.types.OUT_QUINT, v523.active and 100 or 0, 0.03) / 100;
            local v527 = v20.vars.spectators.m_alpha[l_idx_0] * l_alpha_1;
            if v523.active then
                v521 = true;
                if v20.vars.spectators.specs.active[l_idx_0] == nil then
                    v20.vars.spectators.specs.active[l_idx_0] = {
                        offset = 0, 
                        active = true, 
                        alpha = 0
                    };
                end;
                local v528 = render.measure_text(v136.data.fonts[1], nil, string.sub(v525 .. (#v525 > 16 and "..." or ""), 1, 16)) - 30;
                v20.vars.spectators.specs.active[l_idx_0].active = true;
                v20.vars.spectators.specs.active[l_idx_0].offset = v528;
                v20.vars.spectators.specs.active[l_idx_0].alpha = v527;
                v20.vars.spectators.specs.active[l_idx_0].avatar = v523.avatar;
                v20.vars.spectators.specs.active[l_idx_0].name = string.sub(v525, 1, 16) .. (#v525 > 16 and "..." or "");
                if v503 < v528.x then
                    local l_x_3 = v528.x;
                    if l_x_3 then
                        v503 = l_x_3;
                    end;
                end;
            elseif v20.vars.spectators.specs.active[l_idx_0] ~= nil then
                v20.vars.spectators.specs.active[l_idx_0].active = false;
                v20.vars.spectators.specs.active[l_idx_0].alpha = v527;
                if v20.vars.spectators.specs.active[l_idx_0].alpha <= 0 then
                    v20.vars.spectators.specs.active[l_idx_0] = nil;
                end;
            end;
        end;
        if l_alpha_1 ~= 0 and not v521 then
            local v530 = " ";
            v521 = true;
            v20.vars.spectators.specs.active[v530] = {
                offset = 0, 
                active = true, 
                alpha = 0, 
                name = " "
            };
        end;
        local v531 = v20.vars.spectators.width:update(l_animations_0.types.OUT_QUINT, v503 + 100);
        v501.size.x = v531;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v501.pos.x, v501.pos.y), vector(v501.pos.x + v501.size.x, v501.pos.y + v501.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_1), 6);
            render.rect_outline(vector(v501.pos.x, v501.pos.y), vector(v501.pos.x + v501.size.x, v501.pos.y + v501.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_1), 1, 6);
        end;
        for _, v533 in pairs(v20.vars.spectators.specs.active) do
            local v534 = -21 * -(v533.alpha - 1);
            v24.rectblur(vector(v501.pos.x + 8, v501.pos.y + 33 + v504 + v534), vector(v501.pos.x + v501.size.x - 8, v501.pos.y + 52 + v504 + v534), color(0, 0, 0, 85), v533.alpha * l_alpha_1, 4);
            render.text(v136.data.fonts[1], vector(v501.pos.x + 14 + (items.visuals.spectators.avatar:get() and 17 or 0), v501.pos.y + 36 + v504 + v534), color(255, 255, 255, 255 * v533.alpha * l_alpha_1), nil, v533.name);
            if v533.avatar ~= nil and items.visuals.spectators.avatar:get() then
                render.texture(v533.avatar, vector(v501.pos.x + 14, v501.pos.y + 36 + v504 + v534), vector(13, 13), color(255, 255, 255, 255 * v533.alpha * l_alpha_1), nil, 10);
            end;
            v504 = v504 + 21 * v533.alpha;
        end;
        v24.rectblur(vector(v501.pos.x + 5, v501.pos.y + 5), vector(v501.pos.x + v501.size.x - 5, v501.pos.y + v501.size.y - 7), color(0, 0, 0, 150), l_alpha_1, {
            [1] = 5, 
            [2] = 5, 
            [3] = 0, 
            [4] = 0
        });
        v24.horizontalgrad(vector(v501.pos.x + 5, v501.pos.y + v501.size.y - 7), vector(v501.pos.x + v501.size.x - 5, v501.pos.y + v501.size.y - 5), l_l_alpha_1_0, l_OUT_QUINT_1, l_alpha_1, {
            [1] = 0, 
            [2] = 0, 
            [3] = 20, 
            [4] = 20
        });
        render.text(v136.data.fonts[1], vector(v501.pos.x + v501.size.x / 2, v501.pos.y + 16), color(255, 255, 255, 255 * l_alpha_1), "c", "Spectators \a808080C8[" .. #v502 .. "]");
        return;
    end;
end);
v20.status = v20.new({
    [1] = items.visuals.status.x_pos, 
    [2] = items.visuals.status.y_pos
}, vector(130, 50), vector(0, 0), "status", true, function(v535)
    -- upvalues: v20 (ref), l_animations_0 (ref), v187 (ref), v29 (ref), v24 (ref), v136 (ref), l_get_icon_0 (ref)
    v535.bool = items.visuals.status:get() and (items.visuals.status.slow:get() or items.visuals.status.time:get());
    local v536 = entity.get_local_player() == nil and 1 or entity.get_local_player().m_flVelocityModifier;
    local v537 = entity.get_game_rules();
    local v538 = v537 == nil and items.visuals.status.timer:get() or v537.m_fRoundStartTime + v537.m_iRoundTime - globals.curtime;
    local l_alpha_2 = v20.vars.status.alpha;
    local l_l_alpha_2_0 = l_alpha_2;
    l_alpha_2 = l_alpha_2.update;
    local l_OUT_QUINT_2 = l_animations_0.types.OUT_QUINT;
    local v542;
    if items.visuals.status:get() then
        if ui.get_alpha() == 1 then
            v542 = (not not items.visuals.status.slow:get() or items.visuals.status.time:get()) and 100 or 0;
        else
            v542 = (not (v536 == 1) or v538 < items.visuals.status.timer:get() and v538 > 1) and 100 or 0;
        end;
    else
        v542 = 0;
    end;
    l_alpha_2 = l_alpha_2(l_l_alpha_2_0, l_OUT_QUINT_2, v542, 0.03) / 100;
    if l_alpha_2 == 0 then
        return;
    else
        l_l_alpha_2_0 = entity.get_local_player() == nil and 3 or v187.state(entity.get_local_player(), false);
        l_OUT_QUINT_2 = nil;
        v542 = nil;
        local v543, _ = items.visuals.accent:get();
        if v543 == "single" then
            local v545 = unpack(items.visuals.accent:get("single"));
            v542 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_2 = v545;
        elseif v543 == "gradient" then
            local v546, v547 = unpack(items.visuals.accent:get("gradient"));
            v542 = v547;
            l_OUT_QUINT_2 = v546;
        else
            local l_l_4 = v29.l;
            v542 = v29.r;
            l_OUT_QUINT_2 = l_l_4;
        end;
        if ui.get_alpha() ~= 0 then
            on = v20.vars.status.on:update(l_animations_0.types.OUT_QUINT, v535.on and 100 or 0) / 100;
            is = v20.vars.status.is:update(l_animations_0.types.OUT_QUINT, v535.dragbool and 100 or 0) / 100;
        end;
        local l_slow_0 = v20.vars.status.slow;
        local l_l_slow_0_0 = l_slow_0;
        l_slow_0 = l_slow_0.update;
        local l_OUT_QUINT_3 = l_animations_0.types.OUT_QUINT;
        local v552;
        if items.visuals.status.slow:get() then
            v552 = ui.get_alpha() == 1 and 100 or v536 ~= 1 and 100 or 0;
        else
            v552 = 0;
        end;
        l_slow_0 = l_slow_0(l_l_slow_0_0, l_OUT_QUINT_3, v552) / 100;
        l_l_slow_0_0 = v20.vars.status.time;
        l_OUT_QUINT_3 = l_l_slow_0_0;
        l_l_slow_0_0 = l_l_slow_0_0.update;
        v552 = l_animations_0.types.OUT_QUINT;
        local v553;
        if items.visuals.status.time:get() then
            v553 = ui.get_alpha() == 1 and 100 or v538 < items.visuals.status.timer:get() and v538 > 1 and 100 or 0;
        else
            v553 = 0;
        end;
        l_l_slow_0_0 = l_l_slow_0_0(l_OUT_QUINT_3, v552, v553) / 100;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v535.pos.x, v535.pos.y), vector(v535.pos.x + v535.size.x, v535.pos.y + v535.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_2), 6);
            render.rect_outline(vector(v535.pos.x, v535.pos.y), vector(v535.pos.x + v535.size.x, v535.pos.y + v535.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_2), 1, 6);
        end;
        if l_slow_0 ~= 0 or l_l_slow_0_0 ~= 0 then
            v24.rectblur(vector(v535.pos.x + 5, v535.pos.y + 5), vector(v535.pos.x + v535.size.x - 5, v535.pos.y + 45), color(0, 0, 0, 150), l_alpha_2, 5);
            v24.verticalgrad(vector(v535.pos.x + 25, v535.pos.y + 5), vector(v535.pos.x + 25, v535.pos.y + 45), l_OUT_QUINT_2, v542, l_alpha_2);
            render.text(v136.data.fonts[3], vector(v535.pos.x + 15, v535.pos.y + 25), color(255, 255, 255, 255 * l_alpha_2), "c", l_get_icon_0("circle-question"));
        end;
        if l_slow_0 ~= 0 then
            render.text(v136.data.fonts[1], vector(v535.pos.x + 75, v535.pos.y + 25 - 7 * l_l_slow_0_0), color(255, 255, 255, 255 * l_slow_0 * l_alpha_2), "c", "slowed \aA0A0A0FF" .. math.ceil(100 - v536 * 100) .. "\aFFFFFFFF%");
        end;
        if l_l_slow_0_0 ~= 0 then
            if items.visuals.status.timer:get() < v538 then
                l_OUT_QUINT_3 = items.visuals.status.timer:get();
                if l_OUT_QUINT_3 then
                    v538 = l_OUT_QUINT_3;
                    goto label0 --[[  true, true  ]];
                end;
            end;
            if v538 <= 0 or not v538 then
                v538 = 0;
            end;
            ::label0::;
            l_OUT_QUINT_3, v552 = math.modf(v538);
            render.text(v136.data.fonts[1], vector(v535.pos.x + 75, v535.pos.y + 25 + 7 * l_slow_0), color(255, 255, 255, 255 * l_l_slow_0_0 * l_alpha_2), "c", "remain \aA0A0A0FF" .. l_OUT_QUINT_3 .. (v538 < items.visuals.status.timer:get() and v538 ~= 0 and "." or "") .. string.sub(v552, 3, 3) .. "\aFFFFFFFF sec");
        end;
        return;
    end;
end);
v20.indicators = v20.new({
    [1] = items.visuals.indicators.x_pos, 
    [2] = items.visuals.indicators.y_pos
}, vector(60, 26), vector(0, 0), "indicators", false, function(v554)
    -- upvalues: v136 (ref), v20 (ref), l_animations_0 (ref), l_monylinear_0 (ref), v29 (ref), v187 (ref), v181 (ref)
    v554.bool = items.visuals.indicators:get();
    v554.pos.x = v136.data.screen.x - v554.size.x / 2;
    v554.pos.y = items.visuals.indicators.y_pos:get();
    local _ = entity.get_local_player();
    local l_alpha_3 = v20.vars.indicators.alpha;
    local l_l_alpha_3_0 = l_alpha_3;
    l_alpha_3 = l_alpha_3.update;
    local l_OUT_QUINT_4 = l_animations_0.types.OUT_QUINT;
    local v559;
    if items.visuals.indicators:get() then
        v559 = entity.get_local_player() ~= nil and 100 or ui.get_alpha() == 1 and 100 or 0;
    else
        v559 = 0;
    end;
    l_alpha_3 = l_alpha_3(l_l_alpha_3_0, l_OUT_QUINT_4, v559, 0.03) / 100;
    if l_alpha_3 == 0 then
        return;
    else
        l_l_alpha_3_0 = entity.get_local_player();
        l_OUT_QUINT_4 = nil;
        v559 = nil;
        local v560 = nil;
        local v561, _ = items.visuals.accent:get();
        if v561 == "single" then
            local v563 = unpack(items.visuals.accent:get("single"));
            v559 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_4 = v563;
            v560 = l_monylinear_0:Animate("sabbath", {
                color(l_OUT_QUINT_4.r * 0.8, l_OUT_QUINT_4.g * 0.8, l_OUT_QUINT_4.b * 0.8, 255 * l_alpha_3), 
                color(l_OUT_QUINT_4.r * 1.5, l_OUT_QUINT_4.g * 1.5, l_OUT_QUINT_4.b * 1.4, 255 * l_alpha_3)
            }, 5, 3);
        elseif v561 == "gradient" then
            local v564, v565 = unpack(items.visuals.accent:get("gradient"));
            v559 = v565;
            l_OUT_QUINT_4 = v564;
            v560 = l_monylinear_0:Animate("sabbath", {
                color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), 
                color(v559.r, v559.g, v559.b, 255 * l_alpha_3)
            }, 5, 3);
        else
            local l_l_5 = v29.l;
            v559 = v29.r;
            l_OUT_QUINT_4 = l_l_5;
            v560 = l_monylinear_0:Animate("sabbath", {
                color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), 
                color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3)
            }, 5, 3);
        end;
        if ui.get_alpha() ~= 0 then
            on = v20.vars.indicators.on:update(l_animations_0.types.OUT_QUINT, v554.on and 100 or 0) / 100;
            is = v20.vars.indicators.is:update(l_animations_0.types.OUT_QUINT, v554.dragbool and 100 or 0) / 100;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v136.data.screen.x - v554.size.x / 2, v554.pos.y), vector(v136.data.screen.x + v554.size.x / 2, v554.pos.y + v554.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_3), 6);
            render.rect_outline(vector(v136.data.screen.x - v554.size.x / 2, v554.pos.y), vector(v136.data.screen.x + v554.size.x / 2, v554.pos.y + v554.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_3), 1, 6);
        end;
        local v567 = l_l_alpha_3_0 == nil and 2 or v187.state(l_l_alpha_3_0, false);
        local v568 = l_l_alpha_3_0 ~= nil and (l_l_alpha_3_0.m_bIsScoped or false);
        local v569 = v20.vars.indicators.scope:update(l_animations_0.types.OUT_QUINT, ui.get_alpha() == 1 and 0 or v568 and 100 or 0) / 100;
        local v570 = v20.vars.indicators.dt:update(l_animations_0.types.OUT_QUINT, v181(v136.ref.exploit.dt.enable) and 100 or 0, 0.02) / 100;
        local v571 = v20.vars.indicators.dtready:update(l_animations_0.types.OUT_QUINT, rage.exploit:get() * 100, 0.02) / 100;
        local v572 = v20.vars.indicators.hs:update(l_animations_0.types.OUT_QUINT, v181(v136.ref.exploit.hs.enable) and 100 or 0, 0.02) / 100;
        local v573 = v20.vars.indicators.pa:update(l_animations_0.types.OUT_QUINT, v181(v136.ref.rage.peekassist) and 100 or 50, 0.02) / 100;
        local v574 = v20.vars.indicators.ba:update(l_animations_0.types.OUT_QUINT, v181(v136.ref.rage.bodyaim) == "Force" and 100 or 50, 0.02) / 100;
        local v575 = v20.vars.indicators.fs:update(l_animations_0.types.OUT_QUINT, v181(v136.ref.antiaim.fs) and 100 or 50, 0.02) / 100;
        local l_height_0 = v20.vars.indicators.height;
        local l_l_height_0_0 = l_height_0;
        l_height_0 = l_height_0.update;
        local l_OUT_QUINT_5 = l_animations_0.types.OUT_QUINT;
        local v579;
        if items.visuals.indicators.elements:get(1) then
            v579 = items.visuals.indicators.style:get() == 1 and 1 or 3;
        else
            v579 = 0;
        end;
        local v580;
        if items.visuals.indicators.elements:get(2) then
            v580 = items.visuals.indicators.style:get() == 1 and 10 or 10;
        else
            v580 = 0;
        end;
        l_height_0 = l_height_0(l_l_height_0_0, l_OUT_QUINT_5, v579 + v580);
        if items.visuals.indicators.style:get() == 1 then
            l_l_height_0_0 = v20.vars.indicators.state:update(l_animations_0.types.OUT_QUINT, render.measure_text(2, nil, v20.vars.indicators.conditions[v567]).x);
            if not items.visuals.settings.performance:get() and items.visuals.indicators.glow:get() then
                render.shadow(vector(v136.data.screen.x + 40 * v569 - 20, v554.pos.y + 13), vector(v136.data.screen.x + 40 * v569 + 20, v554.pos.y + 13), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3));
            end;
            if items.visuals.indicators.elements:get(1) then
                render.gradient(vector(v136.data.screen.x - 23 * rage.antiaim:get_max_desync() / 58 + 40 * v569, v554.pos.y + 17), vector(v136.data.screen.x + 40 * v569, v554.pos.y + 19), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 100 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(v559.r, v559.g, v559.b, 100 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), {
                    [1] = 20, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 20
                });
                render.gradient(vector(v136.data.screen.x + 40 * v569, v554.pos.y + 17), vector(v136.data.screen.x + 23 * rage.antiaim:get_max_desync() / 58 + 40 * v569, v554.pos.y + 19), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 100 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(v559.r, v559.g, v559.b, 100 * l_alpha_3), {
                    [1] = 0, 
                    [2] = 20, 
                    [3] = 20, 
                    [4] = 0
                });
            end;
            if items.visuals.indicators.elements:get(2) then
                render.text(2, vector(v136.data.screen.x + 17 * v569 - l_l_height_0_0 / 2 * (1 - v569), v554.pos.y + 8 + l_height_0), color(255, 255, 255, 255 * l_alpha_3), nil, v20.vars.indicators.conditions[v567]);
            end;
            if items.visuals.indicators.elements:get(3) then
                if v570 > 0 then
                    l_OUT_QUINT_5 = -10 * -(v570 - 1);
                    render.text(2, vector(v136.data.screen.x + 23 * v569, v554.pos.y + 24 + l_height_0 + l_OUT_QUINT_5), color(255, 255, 255, 255 * v570 * l_alpha_3), "c", "DT");
                    render.push_clip_rect(vector(v136.data.screen.x + 23 * v569 - 5, v554.pos.y + 13 + l_height_0 + l_OUT_QUINT_5), vector(v136.data.screen.x + 23 * v569 - 5 + 10 * -(v571 - 1), v554.pos.y + 33 + l_height_0 + l_OUT_QUINT_5));
                    render.text(2, vector(v136.data.screen.x + 23 * v569, v554.pos.y + 24 + l_height_0 + l_OUT_QUINT_5), color(255, 50, 50, 255 * v570 * l_alpha_3), "c", "DT");
                    render.pop_clip_rect();
                end;
                if v572 > 0 then
                    l_OUT_QUINT_5 = -10 * -(v572 - 1);
                    render.text(2, vector(v136.data.screen.x + 23 * v569, v554.pos.y + 24 + 10 * v570 + l_height_0 + l_OUT_QUINT_5), color(255 * (1 - v570 * 0.5), 255 * (1 - v570 * 0.5), 255 * (1 - v570 * 0.5), 255 * v572 * (1 - v570 * 0.5) * l_alpha_3), "c", "HS");
                end;
                if v573 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v573, 255 * v573, 255 * v573, 255 * v573 * l_alpha_3), "c", "PA");
                end;
                if v574 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569 - 12, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v574, 255 * v574, 255 * v574, 255 * v574 * l_alpha_3), "c", "BA");
                end;
                if v575 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569 + 12, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v575, 255 * v575, 255 * v575, 255 * v575 * l_alpha_3), "c", "FS");
                end;
            end;
            render.text(v136.data.fonts[3], vector(v136.data.screen.x + 40 * v569, v554.pos.y + 13), color(255, 255, 255, 255 * l_alpha_3), "c", v560);
        else
            if not items.visuals.settings.performance:get() and items.visuals.indicators.glow:get() then
                render.shadow(vector(v136.data.screen.x + 35 * v569 - 20, v554.pos.y + 13), vector(v136.data.screen.x + 35 * v569 + 20, v554.pos.y + 13), color(255, 255, 255, 255 * l_alpha_3));
            end;
            if items.visuals.indicators.elements:get(1) then
                render.gradient(vector(v136.data.screen.x - rage.antiaim:get_max_desync() * 0.3 + 35 * v569, v554.pos.y + 19), vector(v136.data.screen.x + 35 * v569, v554.pos.y + 20), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 0 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(v559.r, v559.g, v559.b, 0 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3));
                render.gradient(vector(v136.data.screen.x + 35 * v569, v554.pos.y + 19), vector(v136.data.screen.x + rage.antiaim:get_max_desync() * 0.3 + 35 * v569, v554.pos.y + 20), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 0 * l_alpha_3), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * l_alpha_3), color(v559.r, v559.g, v559.b, 0 * l_alpha_3));
            end;
            if items.visuals.indicators.elements:get(2) then
                render.text(2, vector(v136.data.screen.x + 17 * v569 + render.measure_text(2, "c", v20.vars.indicators.conditions[v567]).x / 2 * v569, v554.pos.y + 24 + l_height_0 - 10), color(255, 255, 255, 255 * l_alpha_3), "c", v20.vars.indicators.conditions[v567]);
            end;
            if items.visuals.indicators.elements:get(3) then
                if v570 > 0 then
                    l_l_height_0_0 = -10 * -(v570 - 1);
                    render.text(2, vector(v136.data.screen.x + 26 * v569 - 3, v554.pos.y + 24 + l_height_0 + l_l_height_0_0), color(255, 255, 255, 255 * v570 * l_alpha_3), "c", "DT");
                    render.circle_outline(vector(v136.data.screen.x + 26 * v569 + 5, v554.pos.y + 24 + l_height_0 + l_l_height_0_0), color(l_OUT_QUINT_4.r, l_OUT_QUINT_4.g, l_OUT_QUINT_4.b, 255 * v570 * l_alpha_3), 3.5, 0, v571, 1);
                end;
                if v572 > 0 then
                    l_l_height_0_0 = -10 * -(v572 - 1);
                    render.text(2, vector(v136.data.screen.x + 23 * v569, v554.pos.y + 24 + 10 * v570 + l_height_0 + l_l_height_0_0), color(255 * (1 - v570 * 0.5), 255 * (1 - v570 * 0.5), 255 * (1 - v570 * 0.5), 255 * v572 * (1 - v570 * 0.5) * l_alpha_3), "c", "HS");
                end;
                if v573 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v573, 255 * v573, 255 * v573, 255 * v573 * l_alpha_3), "c", "PA");
                end;
                if v574 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569 - 12, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v574, 255 * v574, 255 * v574, 255 * v574 * l_alpha_3), "c", "BA");
                end;
                if v575 > 0 then
                    render.text(2, vector(v136.data.screen.x + 35 * v569 + 12, v554.pos.y + 24 + 10 * v570 + 10 * v572 + l_height_0), color(255 * v575, 255 * v575, 255 * v575, 255 * v575 * l_alpha_3), "c", "FS");
                end;
            end;
            render.text(2, vector(v136.data.screen.x + 39 * v569, v554.pos.y + 13), color(255, 255, 255, 255 * l_alpha_3), "c", "sabbath\a" .. l_OUT_QUINT_4.to_hex(l_OUT_QUINT_4) .. ui.get_icon("sparkles"));
        end;
        return;
    end;
end);
v20.mindamage = v20.new({
    [1] = items.visuals.mindamage.x_pos, 
    [2] = items.visuals.mindamage.y_pos
}, vector(20, 20), vector(0, 0), "mindamage", false, function(v581)
    -- upvalues: v20 (ref), l_animations_0 (ref), v29 (ref), v136 (ref)
    v581.bool = items.visuals.mindamage:get();
    local v582 = entity.get_local_player();
    local l_alpha_4 = v20.vars.mindamage.alpha;
    local l_l_alpha_4_0 = l_alpha_4;
    l_alpha_4 = l_alpha_4.update;
    local l_OUT_QUINT_6 = l_animations_0.types.OUT_QUINT;
    local v586;
    if items.visuals.mindamage:get() then
        if v582 == nil then
            v586 = ui.get_alpha() == 1 and 100 or 0;
        else
            v586 = 100;
        end;
    else
        v586 = 0;
    end;
    l_alpha_4 = l_alpha_4(l_l_alpha_4_0, l_OUT_QUINT_6, v586, 0.03) / 100;
    if l_alpha_4 == 0 then
        return;
    else
        l_l_alpha_4_0 = nil;
        l_OUT_QUINT_6 = nil;
        local v587;
        v586, v587 = items.visuals.accent:get();
        if v586 == "single" then
            local v588 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_6 = unpack(items.visuals.accent:get("single"));
            l_l_alpha_4_0 = v588;
        elseif v586 == "gradient" then
            local v589, v590 = unpack(items.visuals.accent:get("gradient"));
            l_OUT_QUINT_6 = v590;
            l_l_alpha_4_0 = v589;
        else
            local l_l_6 = v29.l;
            l_OUT_QUINT_6 = v29.r;
            l_l_alpha_4_0 = l_l_6;
        end;
        if ui.get_alpha() ~= 0 then
            on = v20.vars.mindamage.on:update(l_animations_0.types.OUT_QUINT, v581.on and 100 or 0) / 100;
            is = v20.vars.mindamage.is:update(l_animations_0.types.OUT_QUINT, v581.dragbool and 100 or 0) / 100;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v581.pos.x, v581.pos.y), vector(v581.pos.x + v581.size.x, v581.pos.y + v581.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_4), 6);
            render.rect_outline(vector(v581.pos.x, v581.pos.y), vector(v581.pos.x + v581.size.x, v581.pos.y + v581.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * on + v20.vars.select.is * is) * ui.get_alpha() * l_alpha_4), 1, 6);
        end;
        local v592 = not items.visuals.mindamage.animate:get() and v136.ref.rage.mindamage:get() or v20.vars.mindamage.number:update(l_animations_0.types.OUT_QUINT, v136.ref.rage.mindamage:get());
        render.text(items.visuals.mindamage.font:get() == 1 and v136.data.fonts[1] or 2, vector(v581.pos.x + v581.size.x * 0.5, v581.pos.y + v581.size.y * 0.5), color(255, 255, 255, 255 * l_alpha_4), "c", v592 == 0 and "A" or v592 > 100 and "+" .. string.sub(v592, v592 - 100 > 9 and 2 or 3, 3) or v592);
        return;
    end;
end);
v20.eventlogs = v20.new({
    [1] = items.visuals.eventlogs.x_pos, 
    [2] = items.visuals.eventlogs.y_pos
}, vector(270, 35), vector(0, 0), "eventlogs", false, function(v593)
    -- upvalues: v136 (ref), v20 (ref), l_animations_0 (ref), v22 (ref), v29 (ref), v24 (ref)
    v593.bool = items.visuals.eventlogs:get() and items.visuals.eventlogs.pos:get(2);
    v593.pos.x = v136.data.screen.x - 135;
    local l_alpha_5 = v20.vars.eventlogs.alpha;
    local l_l_alpha_5_0 = l_alpha_5;
    l_alpha_5 = l_alpha_5.update;
    local l_OUT_QUINT_7 = l_animations_0.types.OUT_QUINT;
    local v597;
    if items.visuals.eventlogs:get() and items.visuals.eventlogs.pos:get(2) then
        v597 = #v22.data > 0 and 100 or ui.get_alpha() == 1 and 100 or 0;
    else
        v597 = 0;
    end;
    l_alpha_5 = l_alpha_5(l_l_alpha_5_0, l_OUT_QUINT_7, v597, 0.03) / 100;
    if l_alpha_5 == 0 then
        return;
    else
        l_l_alpha_5_0 = 0;
        l_OUT_QUINT_7 = true;
        v597 = nil;
        local v598 = nil;
        local v599 = nil;
        local v600 = nil;
        local v601 = nil;
        local v602, _ = items.visuals.accent:get();
        if v602 == "single" then
            local v604 = unpack(items.visuals.accent:get("single"));
            v601 = unpack(items.visuals.accent:get("single"));
            v600 = v604;
        elseif v602 == "gradient" then
            local v605, v606 = unpack(items.visuals.accent:get("gradient"));
            v601 = v606;
            v600 = v605;
        else
            local l_l_7 = v29.l;
            v601 = v29.r;
            v600 = l_l_7;
        end;
        if ui.get_alpha() ~= 0 then
            local l_preview_0 = v20.vars.eventlogs.preview;
            local l_l_preview_0_0 = l_preview_0;
            l_preview_0 = l_preview_0.update;
            local l_OUT_QUINT_8 = l_animations_0.types.OUT_QUINT;
            local v611;
            if #v22.data == 0 then
                v611 = ui.get_alpha() == 1 and 100 or 0;
            else
                v611 = 0;
            end;
            v599 = l_preview_0(l_l_preview_0_0, l_OUT_QUINT_8, v611) / 100;
            v597 = v20.vars.eventlogs.on:update(l_animations_0.types.OUT_QUINT, v593.on and 100 or 0) / 100;
            v598 = v20.vars.eventlogs.is:update(l_animations_0.types.OUT_QUINT, v593.dragbool and 100 or 0) / 100;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v593.pos.x, v593.pos.y), vector(v593.pos.x + v593.size.x, v593.pos.y + v593.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v597 + v20.vars.select.is * v598) * ui.get_alpha() * l_alpha_5), 6);
            render.rect_outline(vector(v593.pos.x, v593.pos.y), vector(v593.pos.x + v593.size.x, v593.pos.y + v593.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v597 + v20.vars.select.is * v598) * ui.get_alpha() * l_alpha_5), 1, 6);
        end;
        for v612, v613 in ipairs(v22.data) do
            v613.alpha = l_animations_0.new("eventlogs.alpha" .. v613.time, 0):update(l_animations_0.types.OUT_QUINT, globals.realtime - v613.time < 1 and 100 or globals.realtime - v613.time > 3 and 0 or 100, 0.03) / 100;
            if v613.alpha == 0 then
                table.remove(v22.data, v612);
            end;
            if l_OUT_QUINT_7 then
                l_OUT_QUINT_7 = false;
            else
                l_OUT_QUINT_7 = true;
            end;
            local v614 = (l_OUT_QUINT_7 and 50 or -50) * -(v613.alpha - 1);
            local l_x_4 = render.measure_text(v136.data.fonts[1], nil, v613.text).x;
            if v613.type ~= "welcome" then
                v24.rectblur(vector(v593.pos.x + v593.size.x / 2 - l_x_4 / 2 - 8 + v614, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 - 10), vector(v593.pos.x + v593.size.x / 2 - l_x_4 / 2 - 8 + v614 + v613.size2 - 4, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 + 11), color(0, 0, 0, 120), v613.alpha * l_alpha_5, 4);
            end;
            v24.rectblur(vector(v593.pos.x + v593.size.x / 2 - l_x_4 / 2 - 8 + v614 + v613.size2, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 - 10), vector(v593.pos.x + v593.size.x / 2 + l_x_4 / 2 + 8 + v614, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 + 11), color(0, 0, 0, 90), v613.alpha * l_alpha_5, 4);
            v24.verticalgrad(vector(v593.pos.x + v593.size.x / 2 - l_x_4 / 2 - 8 + v614 + v613.size2, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 - 10), vector(v593.pos.x + v593.size.x / 2 - l_x_4 / 2 - 8 + v614 + v613.size2, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0 + 11), v600, v601, v613.alpha * l_alpha_5);
            render.text(v136.data.fonts[1], vector(v593.pos.x + v593.size.x / 2 + v614, v593.pos.y + v593.size.y / 2 + l_l_alpha_5_0), color(255, 255, 255, 255 * v613.alpha * l_alpha_5), "c", v613.text);
            l_l_alpha_5_0 = l_l_alpha_5_0 + 25 * v613.alpha;
            if #v22.data > 7 then
                v22.data[#v22.data].alpha = l_animations_0.new("eventlogs.alphadown" .. #v22.data, v22.data[#v22.data].alpha):update(l_animations_0.types.OUT_QUINT, 0, 0.03) / 100;
                if math.floor(v22.data[#v22.data].alpha) <= 0.1 then
                    table.remove(v22.data, #v22.data);
                end;
            end;
        end;
        if v599 ~= nil then
            local v616 = "\a" .. color(v600.r, v600.g, v600.b, 255):to_hex();
            local v617 = v22.colors["backtrack failure"] .. "\226\128\162   Missed" .. "          " .. "\aFFFFFFFFshot in " .. v616 .. "yhuk" .. "\aFFFFFFFF's " .. v616 .. "head" .. " \aFFFFFFFFdue to " .. v22.colors["backtrack failure"] .. "backtrack failure";
            local l_x_5 = render.measure_text(v136.data.fonts[1], nil, v617).x;
            local _ = render.measure_text(v136.data.fonts[1], nil, "\226\128\162   Missed").x;
            local l_x_7 = render.measure_text(v136.data.fonts[1], nil, "\226\128\162   Missed          ").x;
            v24.rectblur(vector(v593.pos.x + v593.size.x / 2 - l_x_5 / 2 - 8, v593.pos.y + v593.size.y / 2 - 10), vector(v593.pos.x + v593.size.x / 2 - l_x_5 / 2 - 8 + l_x_7 - 4, v593.pos.y + v593.size.y / 2 + 11), color(0, 0, 0, 120), v599 * l_alpha_5, 4);
            v24.rectblur(vector(v593.pos.x + v593.size.x / 2 - l_x_5 / 2 - 8 + l_x_7, v593.pos.y + v593.size.y / 2 - 10), vector(v593.pos.x + v593.size.x / 2 + l_x_5 / 2 + 8, v593.pos.y + v593.size.y / 2 + 11), color(0, 0, 0, 90), v599 * l_alpha_5, {
                [1] = 6, 
                [2] = 4, 
                [3] = 4, 
                [4] = 6
            });
            v24.verticalgrad(vector(v593.pos.x + v593.size.x / 2 - l_x_5 / 2 - 8 + l_x_7, v593.pos.y + v593.size.y / 2 - 10), vector(v593.pos.x + v593.size.x / 2 - l_x_5 / 2 - 8 + l_x_7, v593.pos.y + v593.size.y / 2 + 11), v600, v601, v599 * l_alpha_5);
            render.text(v136.data.fonts[1], vector(v593.pos.x + v593.size.x / 2, v593.pos.y + v593.size.y / 2), color(255, 255, 255, 255 * v599 * l_alpha_5), "c", v617);
        end;
        return;
    end;
end);
v20.arrows = v20.new({
    [1] = items.visuals.arrows.x_pos, 
    [2] = items.visuals.arrows.y_pos
}, vector(22, 22), vector(0, 0), "arrows", false, function(v621)
    -- upvalues: v136 (ref), v20 (ref), l_animations_0 (ref), v29 (ref), v187 (ref)
    v621.bool = items.visuals.arrows:get();
    if v621.pos.x <= v136.data.screen.x + 30 then
        v621.pos.x = v136.data.screen.x + 30;
    end;
    local v622 = entity.get_local_player();
    local l_alpha_6 = v20.vars.arrows.alpha;
    local l_l_alpha_6_0 = l_alpha_6;
    l_alpha_6 = l_alpha_6.update;
    local l_OUT_QUINT_9 = l_animations_0.types.OUT_QUINT;
    local v626;
    if items.visuals.arrows:get() then
        v626 = v622 ~= nil and 100 or ui.get_alpha() == 1 and 100 or 0;
    else
        v626 = 0;
    end;
    l_alpha_6 = l_alpha_6(l_l_alpha_6_0, l_OUT_QUINT_9, v626, 0.03) / 100;
    if l_alpha_6 == 0 then
        return;
    else
        l_l_alpha_6_0 = nil;
        l_OUT_QUINT_9 = nil;
        local v627;
        v626, v627 = items.visuals.accent:get();
        if v626 == "single" then
            local v628 = unpack(items.visuals.accent:get("single"));
            l_OUT_QUINT_9 = unpack(items.visuals.accent:get("single"));
            l_l_alpha_6_0 = v628;
        elseif v626 == "gradient" then
            local v629, v630 = unpack(items.visuals.accent:get("gradient"));
            l_OUT_QUINT_9 = v630;
            l_l_alpha_6_0 = v629;
        else
            local l_l_8 = v29.l;
            l_OUT_QUINT_9 = v29.r;
            l_l_alpha_6_0 = l_l_8;
        end;
        local v632 = nil;
        local v633 = nil;
        local l_invert_0 = v187.invert;
        local v635 = v622 ~= nil and (v622.m_bIsScoped or false);
        local v636 = v20.vars.arrows.scope:update(l_animations_0.types.OUT_QUINT, ui.get_alpha() == 1 and 0 or v635 and v136.data.screen.y - v621.pos.y - 30 or 0);
        if ui.get_alpha() ~= 0 then
            v632 = v20.vars.arrows.on:update(l_animations_0.types.OUT_QUINT, v621.on and 100 or 0) / 100;
            v633 = v20.vars.arrows.is:update(l_animations_0.types.OUT_QUINT, v621.dragbool and 100 or 0) / 100;
        end;
        if ui.get_alpha() ~= 0 then
            render.rect(vector(v621.pos.x, v621.pos.y), vector(v621.pos.x + v621.size.x, v621.pos.y + v621.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v632 + v20.vars.select.is * v633) * ui.get_alpha() * l_alpha_6), 6);
            render.rect_outline(vector(v621.pos.x, v621.pos.y), vector(v621.pos.x + v621.size.x, v621.pos.y + v621.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v632 + v20.vars.select.is * v633) * ui.get_alpha() * l_alpha_6), 1, 6);
            render.rect(vector(-v621.pos.x + v136.data.fullscreen.x - 22, v621.pos.y), vector(-v621.pos.x + v621.size.x + v136.data.fullscreen.x - 22, v621.pos.y + v621.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v632 + v20.vars.select.is * v633) * ui.get_alpha() * l_alpha_6), 6);
            render.rect_outline(vector(-v621.pos.x + v136.data.fullscreen.x - 22, v621.pos.y), vector(-v621.pos.x + v621.size.x + v136.data.fullscreen.x - 22, v621.pos.y + v621.size.y), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, (v20.vars.select.alpha + v20.vars.select.on * v632 + v20.vars.select.is * v633) * ui.get_alpha() * l_alpha_6), 1, 6);
        end;
        render.push_clip_rect(vector(v621.pos.x + 4, v621.pos.y - 24 + v636), vector(v621.pos.x + 21, v621.pos.y + 16 + v636));
        render.poly(color(l_invert_0 and l_l_alpha_6_0.r or 25, l_invert_0 and l_l_alpha_6_0.g or 25, l_invert_0 and l_l_alpha_6_0.b or 25, 150 * l_alpha_6 * (l_invert_0 and 1 or 0)), vector(v621.pos.x + 18, v621.pos.y + 11 + v636), vector(v621.pos.x + 3, v621.pos.y + 6 + v636), vector(v621.pos.x + 6, v621.pos.y + 11 + v636), vector(v621.pos.x + 3, v621.pos.y + 16 + v636));
        render.pop_clip_rect();
        render.push_clip_rect(vector(-v621.pos.x + v136.data.fullscreen.x - 19, v621.pos.y - 24 + v636), vector(-v621.pos.x + v136.data.fullscreen.x - 4, v621.pos.y + 16 + v636));
        render.poly(color(not l_invert_0 and l_l_alpha_6_0.r or 25, not l_invert_0 and l_l_alpha_6_0.g or 25, not l_invert_0 and l_l_alpha_6_0.b or 25, 150 * l_alpha_6 * (l_invert_0 and 0 or 1)), vector(-v621.pos.x + v136.data.fullscreen.x - 18, v621.pos.y + 11 + v636), vector(-v621.pos.x + v136.data.fullscreen.x - 3, v621.pos.y + 6 + v636), vector(-v621.pos.x + v136.data.fullscreen.x - 6, v621.pos.y + 11 + v636), vector(-v621.pos.x + v136.data.fullscreen.x - 3, v621.pos.y + 16 + v636));
        render.pop_clip_rect();
        return;
    end;
end);
v20.infopanel = function()
    -- upvalues: v20 (ref), l_animations_0 (ref), l_monylinear_0 (ref), v29 (ref), v24 (ref), v136 (ref), v37 (ref)
    local v637 = v20.vars.infopanel.alpha:update(l_animations_0.types.OUT_QUINT, items.info.panel:get() and 100 * ui.get_alpha() or 0, 0.02) / 100;
    if v637 == 0 then
        return;
    else
        local v638 = nil;
        local v639 = nil;
        local v640 = nil;
        local v641, _ = items.visuals.accent:get();
        if v641 == "single" then
            local v643 = unpack(items.visuals.accent:get("single"));
            v639 = unpack(items.visuals.accent:get("single"));
            v638 = v643;
            v640 = l_monylinear_0:Animate("sabbath", {
                color(v638.r, v638.g, v638.b, 255 * v637), 
                color(v638.r * 1.4, v638.g * 1.4, v638.b * 1.4, 255 * v637)
            }, 5, 3);
        elseif v641 == "gradient" then
            local v644, v645 = unpack(items.visuals.accent:get("gradient"));
            v639 = v645;
            v638 = v644;
            v640 = l_monylinear_0:Animate("sabbath", {
                color(v638.r, v638.g, v638.b, 255 * v637), 
                color(v639.r, v639.g, v639.b, 255 * v637)
            }, 5, 3);
        else
            local l_l_9 = v29.l;
            v639 = v29.r;
            v638 = l_l_9;
            v640 = l_monylinear_0:Animate("sabbath", {
                color(v638.r, v638.g, v638.b, 255 * v637), 
                color(v638.r, v638.g, v638.b, 255 * v637)
            }, 5, 3);
        end;
        local l_x_8 = ui.get_position().x;
        local l_y_4 = ui.get_position().y;
        local v649 = render.get_scale(1);
        local l_x_9 = ui.get_size().x;
        local _ = ui.get_size().y;
        v24.rectblur(vector(l_x_8, l_y_4 - 50 * v649), vector(l_x_8 + 185 * v649, l_y_4 - 10), color(0, 0, 0, 150), v637, 6);
        v24.rectblur(vector(l_x_8 + 200 * v649, l_y_4 - 50 * v649), vector(l_x_8 + l_x_9, l_y_4 - 10), color(0, 0, 0, 90), v637, 6);
        v24.verticalgrad(vector(l_x_8 + 200 * v649, l_y_4 - 50 * v649), vector(l_x_8 + 200 * v649, l_y_4 - 10), v638, v639, v637);
        local v652 = l_monylinear_0:Animate("recode", {
            color(255, 255, 255, 255 * v637), 
            color(255, 255, 255, 255 * v637), 
            color(255, 255, 255, 255 * v637), 
            color(255, 255, 255, 0)
        }, 3, 3);
        render.text(v136.data.fonts[3], vector(l_x_8 + 185 * v649 / 2, l_y_4 - 10 - 40 * v649 / 2 - 3), color(255, 255, 255, 255 * v637), "c", v640);
        render.text(v136.data.fonts[1], vector(l_x_8 + 185 * v649 / 2, l_y_4 - 10 - 40 * v649 / 2 + 6), color(255, 255, 255, 255 * v637), "c", v652);
        render.text(v136.data.fonts[1], vector(l_x_8 + 200 * v649 + (l_x_9 - 200) / 2, l_y_4 - 10 - 40 * v649 / 2 - 11), color(255, 255, 255, 255 * v637), nil, v136.data.username);
        render.text(v136.data.fonts[1], vector(l_x_8 + 200 * v649 + (l_x_9 - 200) / 2, l_y_4 - 10 - 40 * v649 / 2 - 1), color(180, 180, 180, 255 * v637), nil, v136.data.update .. " " .. v136.data.build);
        render.texture(v37, vector(l_x_8 + 200 * v649 + (l_x_9 - 200) / 2 - render.measure_text(v136.data.fonts[1], nil, v136.data.username).x / 2 - 12, l_y_4 - 10 - 40 * v649 / 2 - 12), vector(25, 25), color(255, 255, 255, 255 * v637), nil, 10);
        return;
    end;
end;
v20.darken = function()
    -- upvalues: v20 (ref), l_animations_0 (ref), v136 (ref)
    local v653 = v20.vars.darken.alpha:update(l_animations_0.types.OUT_QUINT, v20.darkbool and 100 or 0, 0.02) / 100;
    if v653 == 0 then
        return;
    else
        local _ = ui.get_mouse_position();
        local v655 = v20.vars.darken.x:update(l_animations_0.types.OUT_QUINT, v20.ony and 100 or 0, 0.02) / 100;
        local v656 = v20.vars.darken.y:update(l_animations_0.types.OUT_QUINT, v20.onx and 100 or 0, 0.02) / 100;
        local v657 = v20.vars.darken.docking:update(l_animations_0.types.OUT_QUINT, items.visuals.settings.docking:get() and 100 or 0, 0.02) / 100;
        if not items.visuals.settings.performance:get() then
            render.blur(vector(0, 0), vector(v136.data.fullscreen.x, v136.data.fullscreen.y), 1, 1 * v653);
        end;
        render.rect(vector(0, 0), vector(v136.data.fullscreen.x, v136.data.fullscreen.y), color(0, 0, 0, 125 * v653));
        render.rect(vector(40, v136.data.screen.y - 85), vector(263, v136.data.screen.y - 35), color(v20.vars.select.color.r, v20.vars.select.color.g, v20.vars.select.color.b, 20 * v653), 6);
        render.text(v136.data.fonts[4], vector(50, v136.data.screen.y - 80), color(255, 255, 255, 255 * v653), nil, "Tips:");
        render.text(v136.data.fonts[1], vector(50, v136.data.screen.y - 55), color(255, 255, 255, 255 * v653), nil, "Press \"left shift\" (by default) to enable docking.");
        render.line(vector(0, v136.data.fullscreen.y - 40), vector(v136.data.fullscreen.x, v136.data.fullscreen.y - 40), color(100, 100, 100, (100 * v657 + 155 * v655) * v653));
        render.line(vector(0, 40), vector(v136.data.fullscreen.x, 40), color(100, 100, 100, (100 * v657 + 155 * v655) * v653));
        render.line(vector(v136.data.screen.x, v136.data.fullscreen.y * 2), vector(v136.data.screen.x, 0), color(100, 100, 100, (100 * v657 + 155 * v656) * v653));
        return;
    end;
end;
onrender = function()
    -- upvalues: v136 (ref), v20 (ref), l_floor_0 (ref), v29 (ref), v75 (ref), l_monylinear_0 (ref), l_animations_0 (ref), v22 (ref), v25 (ref), v181 (ref), v24 (ref), l_defensive_0 (ref), v406 (ref)
    local l_windows_0 = v136.ref.misc.windows;
    local l_l_windows_0_0 = l_windows_0;
    l_windows_0 = l_windows_0.override;
    local v660 = {};
    local v661;
    if items.visuals.watermark:get() then
        v661 = v136.ref.misc.windows:get("Watermark") and "" or v136.ref.misc.windows:get("Watermark") and "Watermark" or "";
    else
        v661 = v136.ref.misc.windows:get("Watermark") and "Watermark" or "";
    end;
    v660[1] = v661;
    if items.visuals.keybinds:get() then
        v661 = v136.ref.misc.windows:get("Hotkeys") and "" or v136.ref.misc.windows:get("Hotkeys") and "Hotkeys" or "";
    else
        v661 = v136.ref.misc.windows:get("Hotkeys") and "Hotkeys" or "";
    end;
    v660[2] = v661;
    if items.visuals.spectators:get() then
        v661 = v136.ref.misc.windows:get("Spectators") and "" or v136.ref.misc.windows:get("Spectators") and "Spectators" or "";
    else
        v661 = v136.ref.misc.windows:get("Spectators") and "Spectators" or "";
    end;
    v660[3] = v661;
    v660[4] = v136.ref.misc.windows:get("Bomb Info") and "Bomb Info" or "";
    l_windows_0(l_l_windows_0_0, v660);
    v20.arrows:update();
    v20.eventlogs:update();
    v20.mindamage:update();
    v20.indicators:update();
    v20.status:update();
    v20.spectators:update();
    v20.keybinds:update();
    v20.watermark:update();
    v136.data.fps = l_floor_0(1 / globals.frametime);
    l_windows_0 = nil;
    l_l_windows_0_0 = nil;
    v660, v661 = items.visuals.accent:get();
    if v660 == "single" then
        local v662 = unpack(items.visuals.accent:get("single"));
        l_l_windows_0_0 = unpack(items.visuals.accent:get("single"));
        l_windows_0 = v662;
    elseif v660 == "gradient" then
        local v663, v664 = unpack(items.visuals.accent:get("gradient"));
        l_l_windows_0_0 = v664;
        l_windows_0 = v663;
    else
        local v665 = unpack(items.visuals.accent:get("rainbow"));
        local l_v29_0 = v29;
        local l_v29_1 = v29;
        local v668 = color(v75(2, 255, 2, v665.r, v665.g, v665.b));
        l_v29_1.r = color(v75(2, 255, 4, v665.r, v665.g, v665.b));
        l_v29_0.l = v668;
        l_v29_0 = v29.l;
        l_l_windows_0_0 = v29.r;
        l_windows_0 = l_v29_0;
    end;
    if ui.get_alpha() ~= 0 then
        items.info.logo:set(color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 255));
        local v669 = 0;
        local v670 = {
            [1] = "$ \226\156\168\226\160\128\226\160\128\226\160\128\226\160\128", 
            [2] = "$\240\157\148\158 \226\156\168\226\160\128\226\160\128\226\160\128\226\160\128", 
            [3] = "$\240\157\148\158\240\157\148\159 \226\156\168\226\160\128  \226\160\128\226\160\128", 
            [4] = "$\240\157\148\158\240\157\148\159\240\157\148\159 \226\156\168\226\160\128\226\160\128\226\160\128", 
            [5] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158 \226\156\168\226\160\128\226\160\128\226\160\128", 
            [6] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158\240\157\148\177  \226\156\168\226\160\128\226\160\128", 
            [7] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158\240\157\148\177\240\157\148\165 \226\156\168", 
            [8] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158\240\157\148\177\240\157\148\165 \226\156\168", 
            [9] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158\240\157\148\177 \226\156\168", 
            [10] = "$\240\157\148\158\240\157\148\159\240\157\148\159\240\157\148\158 \226\156\168", 
            [11] = "$\240\157\148\158\240\157\148\159\240\157\148\159 \226\156\168", 
            [12] = "$\240\157\148\158\240\157\148\159 \226\156\168", 
            [13] = "$\240\157\148\158 \226\156\168", 
            [14] = "$", 
            [15] = "\226\160\128\226\160\128\226\160\128 \226\156\168\226\160\128\226\160\128\226\160\128"
        };
        local v671 = math.floor(globals.curtime * 3 + 0.5) % #v670 + 1;
        if v671 == v669 then
            return;
        else
            v669 = v671;
            local v672 = nil;
            local v673 = nil;
            if v660 == "single" then
                local v674 = unpack(items.visuals.accent:get("single"));
                l_l_windows_0_0 = unpack(items.visuals.accent:get("single"));
                l_windows_0 = v674;
                v672 = l_monylinear_0:Animate(v670[v671], {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_windows_0.r * 1.4, l_windows_0.g * 1.4, l_windows_0.b * 1.4, 255)
                }, 5, 3);
                v673 = l_monylinear_0:Animate(ui.get_icon("sparkles"), {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_windows_0.r * 1.4, l_windows_0.g * 1.4, l_windows_0.b * 1.4, 255)
                }, 5, 3);
            elseif v660 == "gradient" then
                local v675, v676 = unpack(items.visuals.accent:get("gradient"));
                l_l_windows_0_0 = v676;
                l_windows_0 = v675;
                v672 = l_monylinear_0:Animate(v670[v671], {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_l_windows_0_0.r, l_l_windows_0_0.g, l_l_windows_0_0.b, 255)
                }, 5, 3);
                v673 = l_monylinear_0:Animate(ui.get_icon("sparkles"), {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_l_windows_0_0.r, l_l_windows_0_0.g, l_l_windows_0_0.b, 255)
                }, 5, 3);
            else
                local l_l_10 = v29.l;
                l_l_windows_0_0 = v29.r;
                l_windows_0 = l_l_10;
                v672 = l_monylinear_0:Animate(v670[v671], {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 255)
                }, 5, 3);
                v673 = l_monylinear_0:Animate(ui.get_icon("sparkles"), {
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 150), 
                    color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 255)
                }, 5, 3);
            end;
            ui.sidebar(v672, v673);
        end;
    end;
    local v678 = entity.get_local_player();
    if items.visuals.viewmodel:get() then
        cvar.viewmodel_fov:float(items.visuals.viewmodel.fov:get(), true);
        cvar.viewmodel_offset_x:float(items.visuals.viewmodel.x:get() / 10 + 2.5, true);
        cvar.viewmodel_offset_y:float(items.visuals.viewmodel.y:get() / 10, true);
        cvar.viewmodel_offset_z:float(items.visuals.viewmodel.z:get() / 10 - 1.5, true);
    end;
    local v679 = v20.vars.aspect.alpha:update(l_animations_0.types.OUT_QUINT, (items.visuals.aspect:get() and items.visuals.aspect.amount:get() or 178) * 100) / 10000;
    if v679 ~= items.visuals.aspect.amount:get() / 100 and items.visuals.aspect:get() then
        cvar.r_aspectratio:float(v679);
    elseif not items.visuals.aspect:get() and v679 ~= 1.78 then
        cvar.r_aspectratio:float(v679);
    end;
    if items.visuals.sidebar:get() and v678 ~= nil and v678:is_alive() then
        local v680 = ui.get_binds();
        local v681 = 0;
        local v682 = false;
        local v683 = false;
        local v684 = false;
        local v685 = false;
        local v686 = v22.hit > 0 and v22.reg > 0 and v22.hit / v22.reg * 100 or 100;
        local _ = v22.reg - v22.hit;
        local v688 = v22.hit .. " / " .. v22.reg .. " (" .. string.format("%.1f", v686) .. ")";
        v25.current = globals.choked_commands;
        for v689 = 1, #v680 do
            local l_name_2 = v680[v689].name;
            local l_value_1 = v680[v689].value;
            if l_name_2 == "Min. Damage" then
                v682 = true;
            end;
            if l_name_2 == "Hit Chance" then
                v683 = true;
            end;
            if l_name_2 == "Safe Points" and l_value_1 == "Force" then
                v684 = true;
            end;
            if l_name_2 == "Body Aim" and l_value_1 == "Force" then
                v685 = true;
            end;
        end;
        if items.visuals.sidebar.elements:get(1) and v181(v136.ref.exploit.dt.enable) then
            local v692 = v20.vars.indicators.dtready:update(l_animations_0.types.OUT_QUINT, rage.exploit:get() == 1 and 100 or 0) / 100;
            v24.bar(color(225 + 30 * v692, 225 * v692, 225 - 175 * -(v692 - 1)), "DT", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(2) and v181(v136.ref.exploit.hs.enable) then
            v24.bar(color(132, 196, 20), "OS", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(3) and v181(v136.ref.antiaim.fs) then
            v24.bar(color(225), "FS", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(4) and v181(v136.ref.misc.fakeduck) then
            v24.bar(color(225), "DUCK", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(5) and v682 then
            v24.bar(color(225), "DMG", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(6) and v683 then
            v24.bar(color(225), "HITCHANCE OVR", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(7) then
            v24.bar(color(255 * (-(rage.antiaim:get_max_desync() - 57) / 30), 200 * (rage.antiaim:get_max_desync() / 57), 100), "FAKE", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(8) then
            v24.bar(color(225), v688, v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(9) and (v181(v136.ref.exploit.dt.enable) or v181(v136.ref.exploit.hs.enable)) then
            v24.bar(color(225, l_defensive_0() and 100 or 225, l_defensive_0() and 100 or 225), "LC", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(10) then
            if v25.current < v25.prev then
                v25.c1 = v25.c2;
                v25.c2 = v25.c3;
                v25.c3 = v25.c4;
                v25.c4 = v25.c5;
                v25.c5 = v25.prev;
            end;
            v25.prev = v25.current;
            v24.bar(color(225), string.format("%i-%i-%i-%i-%i", v25.c5, v25.c4, v25.c3, v25.c2, v25.c1), v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(11) and v181(v136.ref.misc.spike) ~= 0 then
            v24.bar(color(225, 225 - v181(v136.ref.misc.spike) * 2, 225 - v181(v136.ref.misc.spike) * 2), "PING", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(12) and v684 then
            v24.bar(color(225), "SAFE", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(13) and v685 then
            v24.bar(color(225), "BODY", v681);
            v681 = v681 + 1;
        end;
        if items.visuals.sidebar.elements:get(14) and v181(v136.ref.rage.dormant) then
            v24.bar(color(132, 196, 20), "DORMANT", v681);
            v681 = v681 + 1;
        end;
    end;
    if items.visuals.radius:get() then
        local v693 = v406();
        if v693 ~= nil then
            local v694 = items.visuals.radius.molotov:get();
            local _ = color(148, 148, 148);
            local v696 = items.visuals.radius.smoke:get();
            local v697 = {};
            if items.visuals.radius.nades:get(1) then
                v697.molotov_radius = {};
                for v698 = 1, #v693.molotov do
                    local v699 = v693.molotov[v698];
                    local l_molotov_radius_0 = v697.molotov_radius;
                    local v701 = l_animations_0.new("molotov_radius_" .. v698, 0);
                    local l_v701_0 = v701;
                    v701 = v701.update;
                    local l_OUT_QUINT_10 = l_animations_0.types.OUT_QUINT;
                    local v704;
                    if v699.draw then
                        if v699.percentage < 0.025 then
                            v704 = 0;
                            goto label1 --[[  true, true  ]];
                        else
                            v704 = v699.radius;
                            if v704 then
                                goto label1;
                            end;
                        end;
                    end;
                    v704 = 0;
                    ::label1::;
                    l_molotov_radius_0[v698] = v701(l_v701_0, l_OUT_QUINT_10, v704);
                    if v699.draw then
                        l_molotov_radius_0 = v694;
                        render.circle_3d_gradient(v699.position, color(l_molotov_radius_0.r, l_molotov_radius_0.g, l_molotov_radius_0.b, 20), color(l_molotov_radius_0.r, l_molotov_radius_0.g, l_molotov_radius_0.b, 100), v697.molotov_radius[v698], 0, 1);
                        render.circle_3d_outline(v699.position, l_molotov_radius_0, v697.molotov_radius[v698], 0, v699.percentage, 3);
                    end;
                end;
            end;
            if items.visuals.radius.nades:get(2) then
                v697.smoke_radius = {};
                for v705 = 1, #v693.smoke do
                    local v706 = v693.smoke[v705];
                    local l_smoke_radius_0 = v697.smoke_radius;
                    local v708 = l_animations_0.new("smoke_radius_" .. v705, 0);
                    local l_v708_0 = v708;
                    v708 = v708.update;
                    local l_OUT_QUINT_11 = l_animations_0.types.OUT_QUINT;
                    local v711;
                    if v706.draw then
                        v711 = v706.percentage < 0.025 and 0 or 125;
                    else
                        v711 = 0;
                    end;
                    l_smoke_radius_0[v705] = v708(l_v708_0, l_OUT_QUINT_11, v711);
                    if v706.draw then
                        l_smoke_radius_0 = v696;
                        render.circle_3d_gradient(v706.position, color(l_smoke_radius_0.r, l_smoke_radius_0.g, l_smoke_radius_0.b, 20), color(l_smoke_radius_0.r, l_smoke_radius_0.g, l_smoke_radius_0.b, 100), v697.smoke_radius[v705], 0, 1);
                        render.circle_3d_outline(v706.position, l_smoke_radius_0, v697.smoke_radius[v705], 0, v706.percentage, 3);
                    end;
                end;
            end;
        end;
    end;
    if items.visuals.marker:get() then
        local v712 = entity.get_local_player();
        if #v22.marker > 0 and v712 ~= nil and (items.visuals.marker.pos:get(1) or items.visuals.marker.pos:get(2)) then
            for v713, v714 in ipairs(v22.marker) do
                v714.alpha = l_animations_0.new("eventlogs.marker.alpha" .. v714.time, 0):update(l_animations_0.types.OUT_QUINT, globals.realtime - v714.time < 1 and 100 or globals.realtime - v714.time > 3 and 0 or 100) / 100;
                v714.alpha2 = l_animations_0.new("eventlogs.marker.alpha2" .. v714.time, 0):update(l_animations_0.types.OUT_QUINT, globals.realtime - v714.time < 1 and 100 or globals.realtime - v714.time > 1 and 0 or 100, 0.02) / 100;
                if v714.alpha == 0 and v714.alpha2 == 0 then
                    table.remove(v22.marker, v713);
                end;
                if items.visuals.marker.pos:get(2) then
                    if v714.state == nil then
                        render.circle_gradient(render.world_to_screen(v714.point), color(l_l_windows_0_0.r, l_l_windows_0_0.g, l_l_windows_0_0.b, globals.realtime - v714.time > 1 and 0 or 100 * -(v714.alpha - 1)), color(l_windows_0.r, l_windows_0.g, l_windows_0.b, globals.realtime - v714.time > 1 and 0 or -(v714.alpha - 1)), 40 * v714.alpha, 0, 1);
                        render.circle_outline(render.world_to_screen(v714.point), color(l_windows_0.r, l_windows_0.g, l_windows_0.b, 255 * v714.alpha), 4.5, 180, v714.alpha, 2);
                    else
                        render.text(v136.data.fonts[1], render.world_to_screen(v714.point), color(255, 100, 100, 255 * v714.alpha), "c", ui.get_icon("xmark"));
                    end;
                end;
            end;
            if v22.marker[#v22.marker] ~= nil and items.visuals.marker.pos:get(1) and v22.marker[#v22.marker].alpha2 ~= 0 then
                aim_alpha = v22.marker[#v22.marker].alpha2;
                render.line(vector(v136.data.screen.x + 5, v136.data.screen.y + 5), vector(v136.data.screen.x + 10 / v136.data.fullscreen.x * v136.data.fullscreen.x, v136.data.screen.y + 10 / v136.data.fullscreen.y * v136.data.fullscreen.y), color(255, 255, 255, 255 * aim_alpha));
                render.line(vector(v136.data.screen.x - 5, v136.data.screen.y + 5), vector(v136.data.screen.x - 10 / v136.data.fullscreen.x * v136.data.fullscreen.x, v136.data.screen.y + 10 / v136.data.fullscreen.y * v136.data.fullscreen.y), color(255, 255, 255, 255 * aim_alpha));
                render.line(vector(v136.data.screen.x - 5, v136.data.screen.y - 5), vector(v136.data.screen.x - 10 / v136.data.fullscreen.x * v136.data.fullscreen.x, v136.data.screen.y - 10 / v136.data.fullscreen.y * v136.data.fullscreen.y), color(255, 255, 255, 255 * aim_alpha));
                render.line(vector(v136.data.screen.x + 5, v136.data.screen.y - 5), vector(v136.data.screen.x + 10 / v136.data.fullscreen.x * v136.data.fullscreen.x, v136.data.screen.y - 10 / v136.data.fullscreen.y * v136.data.fullscreen.y), color(255, 255, 255, 255 * aim_alpha));
            end;
        end;
    end;
    if items.visuals.scope:get() then
        v136.ref.misc.scope:override("Remove All");
        local v715 = entity.get_local_player();
        if v715 == nil or not v715:is_alive() then
            return;
        else
            local v716 = v20.vars.scope.alpha:update(l_animations_0.types.OUT_QUINT, v715.m_bIsScoped and 100 or 0, 0.02) / 100;
            if v716 == 0 then
                return;
            else
                local v717 = v20.vars.scope.color:update(l_animations_0.types.OUT_QUINT, not items.visuals.scope.invert:get() and 255 or 0);
                local v718 = items.visuals.scope.offset:get() - 10 * -(v716 - 1);
                if v718 < 0 then
                    v718 = 0;
                end;
                local v719 = items.visuals.scope.length:get() * v716;
                local v720 = items.visuals.scope.color:get();
                local v721 = color(v720.r, v720.g, v720.b, v717);
                local v722 = color(v720.r, v720.g, v720.b, -(v717 - 255));
                if not items.visuals.scope.exclude:get("top") then
                    render.gradient(vector(v136.data.screen.x, v136.data.screen.y - v718 + 1), vector(v136.data.screen.x + 1, v136.data.screen.y - v718 - v719 + 1), v721, v721, v722, v722);
                end;
                if not items.visuals.scope.exclude:get("bottom") then
                    render.gradient(vector(v136.data.screen.x, v136.data.screen.y + v718), vector(v136.data.screen.x + 1, v136.data.screen.y + v718 + v719), v721, v721, v722, v722);
                end;
                if not items.visuals.scope.exclude:get("left") then
                    render.gradient(vector(v136.data.screen.x - v718 + 1, v136.data.screen.y), vector(v136.data.screen.x - v718 - v719 + 1, v136.data.screen.y + 1), v721, v722, v721, v722);
                end;
                if not items.visuals.scope.exclude:get("right") then
                    render.gradient(vector(v136.data.screen.x + v718, v136.data.screen.y), vector(v136.data.screen.x + v718 + v719, v136.data.screen.y + 1), v721, v722, v721, v722);
                end;
            end;
        end;
    end;
end;
oncreatemove = function(v723)
    -- upvalues: v187 (ref), v136 (ref), v20 (ref), v259 (ref), l_abs_0 (ref), l_cos_0 (ref), l_rad_0 (ref), l_sin_0 (ref), l_floor_0 (ref), v181 (ref), v263 (ref), v279 (ref), v28 (ref)
    local v724 = entity.get_local_player();
    if v724 == nil or not v724:is_alive() then
        return;
    else
        local v725 = v187.state(v724, false);
        v136.ref.exploit.dt.enable:override();
        v136.ref.exploit.hs.enable:override();
        v136.ref.fakelag.limit:override();
        v136.ref.misc.actions:override();
        v136.ref.rage.hitchance:override();
        if ui.get_alpha() == 1 and (v20.darkbool or v20.watermark.bool and v20.watermark.on or v20.keybinds.bool and v20.keybinds.on or v20.spectators.bool and v20.spectators.on or v20.status.bool and v20.status.on or v20.indicators.bool and v20.indicators.on or v20.mindamage.bool and v20.mindamage.on or v20.eventlogs.bool and v20.eventlogs.on or v20.arrows.bool and v20.arrows.on) then
            v723.in_attack = false;
        end;
        if items.misc.avoid:get() then
            local v726 = v724:get_player_weapon();
            if v726 == nil then
                return;
            else
                local v727 = v726:get_weapon_index();
                if v727 == nil then
                    return;
                elseif v727 == 31 then
                    return;
                else
                    local _ = v724.m_vecVelocity;
                    local l_m_vecOrigin_0 = v724.m_vecOrigin;
                    local _ = utils.trace_line(l_m_vecOrigin_0, vector(l_m_vecOrigin_0.x, l_m_vecOrigin_0.y, l_m_vecOrigin_0.z - 500), nil, nil, 1);
                    local v731 = 15;
                    local l_y_6 = render.camera_angles().y;
                    local l_m_vecOrigin_1 = v724.m_vecOrigin;
                    local l_huge_0 = math.huge;
                    local l_huge_1 = math.huge;
                    for v736 = 1, 180 do
                        local l_x_10 = v259(0, l_y_6 + v736 - 90).x;
                        local l_y_7 = v259(0, l_y_6 + v736 - 90).y;
                        local _ = v259(0, l_y_6).z;
                        local v740 = l_m_vecOrigin_1.x + l_x_10 * 70;
                        local v741 = l_m_vecOrigin_1.y + l_y_7 * 70;
                        local v742 = l_m_vecOrigin_1.z + 60;
                        local v743 = utils.trace_line(l_m_vecOrigin_1, vector(v740, v741, v742), nil, nil, 1);
                        if l_m_vecOrigin_1:dist(v743.end_pos) < l_huge_0 then
                            l_huge_0 = l_m_vecOrigin_1:dist(v743.end_pos);
                            l_huge_1 = v736;
                        end;
                    end;
                    if l_huge_0 < 25 + v731 and v723.in_jump and not v723.in_moveright and not v723.in_moveleft and not v723.in_back then
                        forward_velo = l_abs_0(v724.m_vecVelocity:length2d() * l_cos_0(l_rad_0(l_huge_1)));
                        if l_abs_0(l_huge_1 - 90) < 40 then
                            side_velo = v724.m_vecVelocity:length2d() * l_sin_0(l_rad_0(l_huge_1)) * (25 + v731 - l_huge_0) / 15;
                        else
                            side_velo = v724.m_vecVelocity:length2d() * l_sin_0(l_rad_0(l_huge_1));
                        end;
                        v723.forwardmove = forward_velo;
                        if l_huge_1 >= 90 then
                            v723.sidemove = side_velo;
                        else
                            v723.sidemove = side_velo * -1;
                        end;
                    end;
                end;
            end;
        end;
        if items.misc.fall:get() then
            local v744 = v187.state(v724, false) == 7 or v187.state(v724, false) == 8;
            local l_m_vecVelocity_1 = v724.m_vecVelocity;
            local l_m_vecOrigin_2 = v724.m_vecOrigin;
            local v747 = utils.trace_line(l_m_vecOrigin_2, vector(l_m_vecOrigin_2.x, l_m_vecOrigin_2.y, l_m_vecOrigin_2.z - 500), nil, nil, 1);
            if l_m_vecOrigin_2.z - v747.end_pos.z <= 70 and l_m_vecOrigin_2.z - v747.end_pos.z >= 12 and v744 and l_m_vecVelocity_1.z < -450 then
                v723.in_duck = true;
            end;
        end;
        if items.misc.ladder:get() then
            local l_x_11 = render.camera_angles().x;
            local _ = render.camera_angles().y;
            v723.view_angles.y = l_floor_0(v723.view_angles.y + 0.5);
            v723.roll = 0;
            if v724.m_MoveType == 9 and v723.forwardmove > 0 and l_x_11 < 45 then
                v723.view_angles.x = 89;
                v723.in_moveright = 1;
                v723.in_moveleft = 0;
                v723.in_forward = 0;
                v723.in_back = 1;
                if v723.sidemove == 0 then
                    v723.view_angles.y = v723.view_angles.y + 90;
                end;
                if v723.sidemove < 0 then
                    v723.view_angles.y = v723.view_angles.y + 150;
                end;
                if v723.sidemove > 0 then
                    v723.view_angles.y = v723.view_angles.y + 30;
                end;
            end;
        end;
        if items.misc.scout:get() and not v723.in_forward and not v723.in_back and not v723.in_moveleft and not v723.in_moveright and v724.m_vecVelocity:length2d() < 5 then
            v723.in_speed = true;
        end;
        if items.misc.teleport:get() then
            local v750 = v724:get_player_weapon();
            if v750 == nil then
                return;
            else
                local v751 = v750:get_weapon_index();
                if v751 == nil then
                    return;
                else
                    local v752 = entity.get_players(true);
                    if v752 == nil or #v752 == 0 then
                        return;
                    else
                        local function v756(v753)
                            -- upvalues: v724 (ref)
                            local v754, v755 = utils.trace_bullet(v753, v753:get_hitbox_position(3), v724:get_hitbox_position(3));
                            if v754 > 0 and v755.entity and v755.entity == v724 then
                                return true;
                            else
                                return false;
                            end;
                        end;
                        local v757 = true;
                        local v758 = false;
                        local v759 = false;
                        local v760 = false;
                        if v757 then
                            for _, v762 in pairs(v752) do
                                if v762 == v724 then
                                    return;
                                elseif v756(v762) then
                                    v758 = true;
                                else
                                    v759 = false;
                                    v760 = false;
                                end;
                            end;
                        end;
                        if v181(v136.ref.exploit.dt.enable) and (v725 == 7 or v725 == 8) then
                            if items.misc.teleport.sensor:get() == 1 then
                                if v758 and not v759 then
                                    if v751 == 48 or v751 == 47 or v751 == 46 or v751 == 45 or v751 == 44 or v751 == 43 or v751 == 41 or v751 == 42 or v751 == 59 or v751 == 64 or v751 == 500 or v751 == 503 or v751 == 505 or v751 == 506 or v751 == 507 or v751 == 508 or v751 == 509 or v751 == 512 or v751 == 514 or v751 == 515 or v751 == 516 or v751 == 517 or v751 == 518 or v751 == 519 or v751 == 520 or v751 == 521 or v751 == 522 or v751 == 523 or v751 == 525 then
                                        return;
                                    elseif items.misc.teleport.fast:get() then
                                        local l_m_vecVelocity_2 = v724.m_vecVelocity;
                                        local l_m_vecOrigin_3 = v724.m_vecOrigin;
                                        local v765 = utils.trace_line(l_m_vecOrigin_3, vector(l_m_vecOrigin_3.x, l_m_vecOrigin_3.y, l_m_vecOrigin_3.z - 75), nil, nil, 1);
                                        if l_m_vecVelocity_2.z < -100 and l_m_vecOrigin_3.z - v765.end_pos.z <= 55 then
                                            rage.exploit:force_teleport();
                                            v759 = true;
                                        end;
                                    else
                                        rage.exploit:force_teleport();
                                        v759 = true;
                                    end;
                                end;
                            else
                                local v766 = entity.get_threat(true);
                                if not v759 and v766 and v263() then
                                    if items.misc.teleport.fast:get() then
                                        local l_m_vecVelocity_3 = v724.m_vecVelocity;
                                        local l_m_vecOrigin_4 = v724.m_vecOrigin;
                                        local v769 = utils.trace_line(l_m_vecOrigin_4, vector(l_m_vecOrigin_4.x, l_m_vecOrigin_4.y, l_m_vecOrigin_4.z - 75), nil, nil, 1);
                                        if l_m_vecVelocity_3.z < -100 and l_m_vecOrigin_4.z - v769.end_pos.z <= 55 then
                                            rage.exploit:force_teleport();
                                            v759 = true;
                                        end;
                                    else
                                        rage.exploit:force_teleport();
                                        v759 = true;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if items.misc.exploits:get() then
            local v770 = v724:get_player_weapon();
            if v770 == nil then
                return;
            else
                local v771 = v770:get_weapon_index();
                if v771 == nil then
                    return;
                elseif rage.exploit:get() == 1 and v771 ~= 48 and v771 ~= 47 and v771 ~= 46 and v771 ~= 45 and v771 ~= 44 and v771 ~= 43 and v771 ~= 41 and v771 ~= 42 and v771 ~= 59 and v771 ~= 64 and v771 ~= 500 and v771 ~= 503 and v771 ~= 505 and v771 ~= 506 and v771 ~= 507 and v771 ~= 508 and v771 ~= 509 and v771 ~= 512 and v771 ~= 514 and v771 ~= 515 and v771 ~= 516 and v771 ~= 517 and v771 ~= 518 and v771 ~= 519 and v771 ~= 520 and v771 ~= 521 and v771 ~= 522 and v771 ~= 523 and v771 ~= 525 and v181(v136.ref.exploit.dt.enable) and (v725 == 2 or v725 == 4 or v725 == 5 or v725 == 6) then
                    v136.ref.exploit.dt.enable:override(true);
                    v136.ref.exploit.hs.enable:override(true);
                end;
            end;
        end;
        if items.misc.fakelag:get() then
            if (v181(v136.ref.exploit.dt.enable) or v181(v136.ref.exploit.hs.enable)) and not v181(v136.ref.misc.fakeduck) then
                v136.ref.fakelag.limit:override(1);
            end;
            local v772 = v279();
            if v28.oldcount == v723.tickcount then
                v28.shift = v28.shift + 1;
            else
                v28.oldcount = v723.tickcount;
                v28.shift = 0;
            end;
            if not v772 and v28.shift > 0 then
                v136.ref.antiaim.desync:override(false);
            end;
            if items.misc.kangaroo:get() then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Default");
                entity.get_local_player().m_flPoseParameter[0] = math.random(0, 10) / 10;
                entity.get_local_player().m_flPoseParameter[2] = math.random(0, 4) / 14;
            end;
        end;
        if items.misc.hitchance:get() then
            local v773 = items.misc.hitchance.airw:get();
            local v774 = items.misc.hitchance.scopew:get();
            if items.misc.hitchance.state:get(1) and (v725 == 7 or v725 == 8) then
                for v775 = 1, #v773 do
                    ui.find("Aimbot", "Ragebot", "Selection", v773[v775], "Hit Chance"):override(items.misc.hitchance.air:get());
                end;
            end;
            if items.misc.hitchance.state:get(2) and v725 ~= 7 and v725 ~= 8 and not v724.m_bIsScoped then
                for v776 = 1, #v774 do
                    ui.find("Aimbot", "Ragebot", "Selection", v774[v776], "Hit Chance"):override(items.misc.hitchance.scope:get());
                end;
            end;
        end;
        if items.misc.grenades:get() and items.misc.grenades.fix:get() then
            local v777 = v724:get_player_weapon();
            if v777 == nil then
                return;
            else
                local v778 = v777:get_weapon_index();
                if v778 == nil then
                    return;
                elseif v778 == 43 or v778 == 44 or v778 == 45 or v778 == 46 or v778 == 47 or v778 == 48 then
                    v136.ref.misc.actions:override({
                        [1] = ""
                    });
                end;
            end;
        end;
        return;
    end;
end;
post_update_clientside_animation = function(v779)
    -- upvalues: v187 (ref), v136 (ref), l_ffi_0 (ref)
    if not items.misc.animation:get() then
        return;
    else
        local v780 = entity.get_local_player();
        if v780 == nil or not v780:is_alive() or v779 ~= v780 then
            return;
        else
            local v781 = v187.state(v780, false) == 7 or v187.state(v780, false) == 8;
            v136.ref.misc.leg:override();
            if items.misc.animation.mode:get(1) and not v781 then
                if items.misc.animation.ground:get() == 1 then
                    v136.ref.misc.leg:override("Sliding");
                    v780.m_flPoseParameter[0] = 1;
                elseif items.misc.animation.ground:get() == 2 then
                    v136.ref.misc.leg:override("Walking");
                    v780.m_flPoseParameter[7] = 0;
                else
                    v136.ref.misc.leg:override("Sliding");
                    v780.m_flPoseParameter[0] = globals.tickcount % 3 == 0 and 1 or 0.5;
                end;
            end;
            if items.misc.animation.mode:get(2) and v781 then
                if items.misc.animation.air:get() == 1 then
                    v780.m_flPoseParameter[6] = 1;
                elseif items.misc.animation.air:get() == 2 then
                    l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v780[0]) + 10640)[0][6].m_flWeight = 1;
                else
                    l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v780[0]) + 10640)[0][4].m_flCycle = 0.7;
                    l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v780[0]) + 10640)[0][4].m_nSequence = 11;
                end;
            end;
            if items.misc.animation.mode:get(3) then
                if bit.band(v780.m_fFlags, 1) == 1 then
                    v136.data.pitchticks = v136.data.pitchticks + 1;
                else
                    v136.data.pitchticks = 0;
                    v136.data.pitchtime = globals.curtime + 1;
                end;
                if not v781 and v136.data.pitchticks > 1 and v136.data.pitchtime > globals.curtime then
                    v780.m_flPoseParameter[12] = 0.5;
                end;
            end;
            if items.misc.animation.mode:get(4) and v187.velocity(v780) > 3 and v187.velocity(v780) < 100 then
                l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v780[0]) + 10640)[0][12].m_flWeight = items.misc.animation.lean:get() / 100;
            end;
            return;
        end;
    end;
end;
shutdown = function()
    -- upvalues: v136 (ref), v68 (ref)
    utils.console_exec("cl_drawhud_force_radar 1");
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:float(68, true);
    cvar.viewmodel_offset_x:float(2.5, true);
    cvar.viewmodel_offset_y:float(0, true);
    cvar.viewmodel_offset_z:float(-1.5, true);
    common.set_clan_tag("");
    v136.ref.misc.clantag:override();
    v68(color());
end;
l_pui_0.setup({
    [1] = items.antiaim, 
    [2] = states, 
    [3] = condition, 
    [4] = child, 
    [5] = items.visuals, 
    [6] = items.misc
});
v19.export = v49("presets.export", false, function()
    -- upvalues: l_pui_0 (ref), v19 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    local _ = items.presets.name:get();
    local v783 = common.get_username();
    local v784 = l_pui_0.save();
    fullname = v19.data.p1[items.presets.list:get()];
    local v785 = {
        p1 = fullname, 
        p2 = v783, 
        p3 = v784
    };
    l_clipboard_0.set(l_base64_0.encode(msgpack.pack(v785)));
end);
v19.import = v49("presets.import", false, function()
    -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref), v62 (ref), v19 (ref)
    local v786 = msgpack.unpack(l_base64_0.decode(l_clipboard_0.get()));
    if not v62(v19.data.p1, v786.p1) then
        table.insert(v19.data.p1, v786.p1);
        table.insert(v19.data.p2, v786.p2);
        table.insert(v19.data.p3, v786.p3);
        items.presets.list:update(v19.data.p1);
        files.write(v19.path, l_base64_0.encode(msgpack.pack(v19.data)));
    end;
end);
v19.save = v49("presets.save", false, function()
    -- upvalues: v19 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if items.presets.list:get() ~= 1 then
        v19.data.p3[items.presets.list:get()] = l_pui_0.save();
        files.write(v19.path, l_base64_0.encode(msgpack.pack(v19.data)));
    end;
end);
v19.antiaim = v49("presets.antiaim", false, function()
    -- upvalues: l_pui_0 (ref), v19 (ref), l_base64_0 (ref)
    if items.presets.list:get() ~= 1 then
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 1);
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 2);
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 3);
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 4);
    else
        local v787 = msgpack.unpack(l_base64_0.decode("g6JwMqZ1bmhvb2uicDOW3gAQpndhcm11cMKsZnJlZXN0YW5kaW5nwqZzdGF0aWORoX6oc2FmZWhlYWTCqWRlZmVuc2l2ZYKjbW9kw6NmcHPCrX5mcmVlc3RhbmRpbmeBpnN0YXRpY8KpfnNhZmVoZWFkgqlhdHRhcmdldHPDpndlYXBvbpGhfqd+bWFudWFsgaZzdGF0aWPCpm1hbnVhbKhkaXNhYmxlZKdsYWdjb21wk6dqdW1waW5nrmp1bXAtY3JvdWNoaW5noX6kYmFzZaphdCB0YXJnZXRzqHNldHRpbmdzAadlZGdleWF3wqZlbmFibGXDpWxlZ2l0wqZzdGF0ZXOpY3JvdWNoaW5nmIGlc3RhdGXCgaVzdGF0ZcOBpXN0YXRlw4Glc3RhdGXDgaVzdGF0ZcOBpXN0YXRlw4Glc3RhdGXDgaVzdGF0ZcOYj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQGkbGVmdACmZGVzeW5jqGRpc2FibGVko21pbgCjbWF4AKhtb2RpZmllcqhkaXNhYmxlZKlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tAKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5AqRsZWZ0AaZkZXN5bmOnZGVmYXVsdKNtaW4Ao21heACobW9kaWZpZXKmaml0dGVyqWRlZmVuc2l2ZcKlc3BlZWQKqnJpZ2h0bGltaXQ6pm9mZnNldB2pbGVmdGxpbWl0OqZyYW5kb20ApXJpZ2h0AI+qZGVzeW5jd2F5c8Kkd2F5cwGlZGVsYXkCpGxlZnQApmRlc3luY6dkZWZhdWx0o21pbuOjbWF4Hqhtb2RpZmllcqZqaXR0ZXKpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQWkbGVmdACmZGVzeW5jp2RlZmF1bHSjbWlu6aNtYXghqG1vZGlmaWVypmppdHRlcqlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tFKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5AaRsZWZ0AKZkZXN5bmOnZGVmYXVsdKNtaW7no21heCGobW9kaWZpZXKmaml0dGVyqWRlZmVuc2l2ZcKlc3BlZWQKqnJpZ2h0bGltaXQ6pm9mZnNldACpbGVmdGxpbWl0OqZyYW5kb20ApXJpZ2h0AI+qZGVzeW5jd2F5c8Kkd2F5cwGlZGVsYXkBpGxlZnQApmRlc3luY6dkZWZhdWx0o21pbuejbWF4Iahtb2RpZmllcqZqaXR0ZXKpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQGkbGVmdACmZGVzeW5jp2RlZmF1bHSjbWlu6aNtYXgdqG1vZGlmaWVypmppdHRlcqlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tAKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5EaRsZWZ0BKZkZXN5bmOnZGVmYXVsdKNtaW4Ao21heACobW9kaWZpZXKoZGlzYWJsZWSpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAmIukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsKoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcKnb3ZlcmxhcMKmcmFuZG9twqVicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXCp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXCi6Rtb2RlkaF+o3lhd6Zzd2l0Y2imaml0dGVyw6h5YXd2YWx1ZQClcGl0Y2imc3dpdGNoqnBpdGNodmFsdWUAq3lhd3NlcGFyYXRlwrBtb2RpZmllcnNlcGFyYXRlw6dvdmVybGFwwqZyYW5kb23CpWJydXRlwoukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsOoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcOnb3ZlcmxhcMKmcmFuZG9tw6VicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXDp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXCi6Rtb2RlkaF+o3lhd6Zzd2l0Y2imaml0dGVyw6h5YXd2YWx1ZQClcGl0Y2imc3dpdGNoqnBpdGNodmFsdWUAq3lhd3NlcGFyYXRlwrBtb2RpZmllcnNlcGFyYXRlw6dvdmVybGFwwqZyYW5kb23CpWJydXRlwoukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsOoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcOnb3ZlcmxhcMKmcmFuZG9twqVicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXCp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXC3gAgqH5zaWRlYmFygahlbGVtZW50c54BAgMEBQYICQoLDA0OoX6qc3BlY3RhdG9yc8KqaW5kaWNhdG9yc8OmYXJyb3dzwqZyYWRpdXPDp3NpZGViYXLCpHZndWnDqGtleWJpbmRzw6Zhc3BlY3TDp35zdGF0dXOFpXhfcG9zzQN/pHNsb3fCpXRpbWVyCqR0aW1lwqV5X3BvczqnfnJhZGl1c4OnbW9sb3RvdqkjQzY3MzUyRkalc21va2WpIzk0OTQ5NEZGpW5hZGVzkwECoX6pbWluZGFtYWdlw6l3YXRlcm1hcmvDqHNldHRpbmdzg6VyYWRhcsKrcGVyZm9ybWFuY2XCpGdsb3cAp35tYXJrZXKBo3Bvc5IBoX6qfm1pbmRhbWFnZYSnYW5pbWF0ZcOkZm9udAGleF9wb3PNA86leV9wb3PNAfurfnNwZWN0YXRvcnODpmF2YXRhcsOleF9wb3PNBLeleV9wb3PNATirfmluZGljYXRvcnOFqGVsZW1lbnRzlAECA6F+pXN0eWxlAaRnbG93w6V4X3Bvc80DmKV5X3Bvc80CJqUqdmd1aakjNkE4NkI4QjWmbWFya2Vywqd+YXNwZWN0gaZhbW91bnTMhap+d2F0ZXJtYXJriKR1c2Vyw6V5X3BvcxemYXZhdGFyw6VkZWxhecOkdGltZcOqY3VzdG9tbmFtZaCleF9wb3PNBk2lYnVpbGTDp35hcnJvd3OCpXhfcG9zzQPzpXlfcG9zzQImqXZpZXdtb2RlbMKpfmtleWJpbmRzgqV4X3Bvc80CCKV5X3Bvc80BiqZzdGF0dXPCpn5zY29wZYWnZXhjbHVkZZGhfqZpbnZlcnTCpmxlbmd0aGSmb2Zmc2V0CqVjb2xvcqkjOTQ5NDk0RkamYWNjZW50k6ZzaW5nbGWpIzZBODZCOEZGoX6lc2NvcGXDqn52aWV3bW9kZWyEoXkAoXoAoXgAo2ZvdkSpZXZlbnRsb2dzw6p+ZXZlbnRsb2dzg6Nwb3OTAQKhfqV4X3Bvc80DQ6V5X3Bvc80DNN4AE6RmYWxswqZsYWRkZXLDp2NsYW50YWfDqHRlbGVwb3J0w6VzY291dMOpYW5pbWF0aW9uwqdmYWtlbGFnw6l+dGVsZXBvcnSBpGZhc3TCqWhpdGNoYW5jZcKmc2hhcmVkw6Vhdm9pZMKqfmFuaW1hdGlvboOkbW9kZZGhfqNhaXIDpmdyb3VuZAOoc2V0dGluZ3MBqGV4cGxvaXRzwql+Z3JlbmFkZXODqXN1cGVydG9zc8KncmVsZWFzZcKjZml4w6p+aGl0Y2hhbmNlhaZzY29wZXeRoX6lc3RhdGWRoX6lc2NvcGVkpGFpcneRoX6jYWlyZKl0cmFzaHRhbGvDqn50cmFzaHRhbGuBpXN0YXRlkwECoX6oZ3JlbmFkZXPDonAxoTU="));
        l_pui_0.load(v787.p3, 1);
        l_pui_0.load(v787.p3, 2);
        l_pui_0.load(v787.p3, 3);
        l_pui_0.load(v787.p3, 4);
    end;
end);
v19.other = v49("presets.other", false, function()
    -- upvalues: l_pui_0 (ref), v19 (ref), l_base64_0 (ref), v20 (ref)
    if items.presets.list:get() ~= 1 then
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 5);
        l_pui_0.load(v19.data.p3[items.presets.list:get()], 6);
    else
        local v788 = msgpack.unpack(l_base64_0.decode("g6JwMqZ1bmhvb2uicDOW3gAQpndhcm11cMKsZnJlZXN0YW5kaW5nwqZzdGF0aWORoX6oc2FmZWhlYWTCqWRlZmVuc2l2ZYKjbW9kw6NmcHPCrX5mcmVlc3RhbmRpbmeBpnN0YXRpY8KpfnNhZmVoZWFkgqlhdHRhcmdldHPDpndlYXBvbpGhfqd+bWFudWFsgaZzdGF0aWPCpm1hbnVhbKhkaXNhYmxlZKdsYWdjb21wk6dqdW1waW5nrmp1bXAtY3JvdWNoaW5noX6kYmFzZaphdCB0YXJnZXRzqHNldHRpbmdzAadlZGdleWF3wqZlbmFibGXDpWxlZ2l0wqZzdGF0ZXOpY3JvdWNoaW5nmIGlc3RhdGXCgaVzdGF0ZcOBpXN0YXRlw4Glc3RhdGXDgaVzdGF0ZcOBpXN0YXRlw4Glc3RhdGXDgaVzdGF0ZcOYj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQGkbGVmdACmZGVzeW5jqGRpc2FibGVko21pbgCjbWF4AKhtb2RpZmllcqhkaXNhYmxlZKlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tAKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5AqRsZWZ0AaZkZXN5bmOnZGVmYXVsdKNtaW4Ao21heACobW9kaWZpZXKmaml0dGVyqWRlZmVuc2l2ZcKlc3BlZWQKqnJpZ2h0bGltaXQ6pm9mZnNldB2pbGVmdGxpbWl0OqZyYW5kb20ApXJpZ2h0AI+qZGVzeW5jd2F5c8Kkd2F5cwGlZGVsYXkCpGxlZnQApmRlc3luY6dkZWZhdWx0o21pbuOjbWF4Hqhtb2RpZmllcqZqaXR0ZXKpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQWkbGVmdACmZGVzeW5jp2RlZmF1bHSjbWlu6aNtYXghqG1vZGlmaWVypmppdHRlcqlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tFKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5AaRsZWZ0AKZkZXN5bmOnZGVmYXVsdKNtaW7no21heCGobW9kaWZpZXKmaml0dGVyqWRlZmVuc2l2ZcKlc3BlZWQKqnJpZ2h0bGltaXQ6pm9mZnNldACpbGVmdGxpbWl0OqZyYW5kb20ApXJpZ2h0AI+qZGVzeW5jd2F5c8Kkd2F5cwGlZGVsYXkBpGxlZnQApmRlc3luY6dkZWZhdWx0o21pbuejbWF4Iahtb2RpZmllcqZqaXR0ZXKpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAj6pkZXN5bmN3YXlzwqR3YXlzAaVkZWxheQGkbGVmdACmZGVzeW5jp2RlZmF1bHSjbWlu6aNtYXgdqG1vZGlmaWVypmppdHRlcqlkZWZlbnNpdmXCpXNwZWVkCqpyaWdodGxpbWl0OqZvZmZzZXQAqWxlZnRsaW1pdDqmcmFuZG9tAKVyaWdodACPqmRlc3luY3dheXPCpHdheXMBpWRlbGF5EaRsZWZ0BKZkZXN5bmOnZGVmYXVsdKNtaW4Ao21heACobW9kaWZpZXKoZGlzYWJsZWSpZGVmZW5zaXZlwqVzcGVlZAqqcmlnaHRsaW1pdDqmb2Zmc2V0AKlsZWZ0bGltaXQ6pnJhbmRvbQClcmlnaHQAmIukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsKoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcKnb3ZlcmxhcMKmcmFuZG9twqVicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXCp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXCi6Rtb2RlkaF+o3lhd6Zzd2l0Y2imaml0dGVyw6h5YXd2YWx1ZQClcGl0Y2imc3dpdGNoqnBpdGNodmFsdWUAq3lhd3NlcGFyYXRlwrBtb2RpZmllcnNlcGFyYXRlw6dvdmVybGFwwqZyYW5kb23CpWJydXRlwoukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsOoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcOnb3ZlcmxhcMKmcmFuZG9tw6VicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXDp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXCi6Rtb2RlkaF+o3lhd6Zzd2l0Y2imaml0dGVyw6h5YXd2YWx1ZQClcGl0Y2imc3dpdGNoqnBpdGNodmFsdWUAq3lhd3NlcGFyYXRlwrBtb2RpZmllcnNlcGFyYXRlw6dvdmVybGFwwqZyYW5kb23CpWJydXRlwoukbW9kZZGhfqN5YXemc3dpdGNopmppdHRlcsOoeWF3dmFsdWUApXBpdGNopnN3aXRjaKpwaXRjaHZhbHVlAKt5YXdzZXBhcmF0ZcKwbW9kaWZpZXJzZXBhcmF0ZcOnb3ZlcmxhcMKmcmFuZG9twqVicnV0ZcKLpG1vZGWRoX6jeWF3pnN3aXRjaKZqaXR0ZXLDqHlhd3ZhbHVlAKVwaXRjaKZzd2l0Y2iqcGl0Y2h2YWx1ZQCreWF3c2VwYXJhdGXCsG1vZGlmaWVyc2VwYXJhdGXCp292ZXJsYXDCpnJhbmRvbcKlYnJ1dGXC3gAgqH5zaWRlYmFygahlbGVtZW50c54BAgMEBQYICQoLDA0OoX6qc3BlY3RhdG9yc8KqaW5kaWNhdG9yc8OmYXJyb3dzwqZyYWRpdXPDp3NpZGViYXLCpHZndWnDqGtleWJpbmRzw6Zhc3BlY3TDp35zdGF0dXOFpXhfcG9zzQN/pHNsb3fCpXRpbWVyCqR0aW1lwqV5X3BvczqnfnJhZGl1c4OnbW9sb3RvdqkjQzY3MzUyRkalc21va2WpIzk0OTQ5NEZGpW5hZGVzkwECoX6pbWluZGFtYWdlw6l3YXRlcm1hcmvDqHNldHRpbmdzg6VyYWRhcsKrcGVyZm9ybWFuY2XCpGdsb3cAp35tYXJrZXKBo3Bvc5IBoX6qfm1pbmRhbWFnZYSnYW5pbWF0ZcOkZm9udAGleF9wb3PNA86leV9wb3PNAfurfnNwZWN0YXRvcnODpmF2YXRhcsOleF9wb3PNBLeleV9wb3PNATirfmluZGljYXRvcnOFqGVsZW1lbnRzlAECA6F+pXN0eWxlAaRnbG93w6V4X3Bvc80DmKV5X3Bvc80CJqUqdmd1aakjNkE4NkI4QjWmbWFya2Vywqd+YXNwZWN0gaZhbW91bnTMhap+d2F0ZXJtYXJriKR1c2Vyw6V5X3BvcxemYXZhdGFyw6VkZWxhecOkdGltZcOqY3VzdG9tbmFtZaCleF9wb3PNBk2lYnVpbGTDp35hcnJvd3OCpXhfcG9zzQPzpXlfcG9zzQImqXZpZXdtb2RlbMKpfmtleWJpbmRzgqV4X3Bvc80CCKV5X3Bvc80BiqZzdGF0dXPCpn5zY29wZYWnZXhjbHVkZZGhfqZpbnZlcnTCpmxlbmd0aGSmb2Zmc2V0CqVjb2xvcqkjOTQ5NDk0RkamYWNjZW50k6ZzaW5nbGWpIzZBODZCOEZGoX6lc2NvcGXDqn52aWV3bW9kZWyEoXkAoXoAoXgAo2ZvdkSpZXZlbnRsb2dzw6p+ZXZlbnRsb2dzg6Nwb3OTAQKhfqV4X3Bvc80DQ6V5X3Bvc80DNN4AE6RmYWxswqZsYWRkZXLDp2NsYW50YWfDqHRlbGVwb3J0w6VzY291dMOpYW5pbWF0aW9uwqdmYWtlbGFnw6l+dGVsZXBvcnSBpGZhc3TCqWhpdGNoYW5jZcKmc2hhcmVkw6Vhdm9pZMKqfmFuaW1hdGlvboOkbW9kZZGhfqNhaXIDpmdyb3VuZAOoc2V0dGluZ3MBqGV4cGxvaXRzwql+Z3JlbmFkZXODqXN1cGVydG9zc8KncmVsZWFzZcKjZml4w6p+aGl0Y2hhbmNlhaZzY29wZXeRoX6lc3RhdGWRoX6lc2NvcGVkpGFpcneRoX6jYWlyZKl0cmFzaHRhbGvDqn50cmFzaHRhbGuBpXN0YXRlkwECoX6oZ3JlbmFkZXPDonAxoTU="));
        l_pui_0.load(v788.p3, 5);
        l_pui_0.load(v788.p3, 6);
    end;
    v20.preset();
end);
v19.add = v49("presets.add", false, function()
    items.presets.name:visibility(true);
    items.presets.add:visibility(false);
    items.presets.create:visibility(true);
    items.presets.back:visibility(true);
    items.presets.import:visibility(false);
end);
v19.back = v49("presets.back", false, function()
    items.presets.name:visibility(false);
    items.presets.add:visibility(true);
    items.presets.create:visibility(false);
    items.presets.back:visibility(false);
    items.presets.import:visibility(true);
end);
v19.create = v49("presets.create", true, function()
    -- upvalues: l_pui_0 (ref), v62 (ref), v19 (ref), l_base64_0 (ref)
    local v789 = common.get_username();
    local v790 = items.presets.name:get();
    local v791 = l_pui_0.save();
    if v790 ~= "" and not v62(v19.data.p1, v790) then
        items.presets.name:set("");
        items.presets.name:visibility(false);
        items.presets.add:visibility(true);
        items.presets.create:visibility(false);
        items.presets.back:visibility(false);
        items.presets.import:visibility(true);
        table.insert(v19.data.p1, v790);
        table.insert(v19.data.p2, v789);
        table.insert(v19.data.p3, v791);
        files.write(v19.path, l_base64_0.encode(msgpack.pack(v19.data)));
    end;
    items.presets.list:update(v19.data.p1);
end);
v19.remove = v49("presets.remove", false, function()
    -- upvalues: v19 (ref), l_base64_0 (ref)
    if items.presets.list:get() ~= 1 then
        table.remove(v19.data.p1, items.presets.list:get());
        table.remove(v19.data.p2, items.presets.list:get());
        table.remove(v19.data.p3, items.presets.list:get());
        files.write(v19.path, l_base64_0.encode(msgpack.pack(v19.data)));
        items.presets.list:update(v19.data.p1);
    end;
end);
local _ = function(v792, v793)
    local v794 = {};
    for v795 in v792:gmatch("[^\r\n]+") do
        table.insert(v794, v795);
    end;
    local v796 = "";
    for _, v798 in ipairs(v794) do
        local v799 = math.floor((v793 - #v798) / 2);
        v796 = v796 .. string.rep(" ", v799) .. v798 .. "";
    end;
    return v796;
end;
local l_base64_1 = require("neverlose/base64");
local l_gradient_0 = require("neverlose/gradient");
local l_clipboard_1 = require("neverlose/clipboard");
local v804 = {
    list = {}
};
v804.push = function(v805)
    -- upvalues: v804 (ref)
    assert(v805.element, "Element is nil");
    assert(v805.index, "Index is nil");
    assert(type(v805.index) == "string", "Invalid type of index");
    v804.list[v805.index] = {};
    v804.list[v805.index].element = v805.element;
    v804.list[v805.index].flags = v805.flags or "";
    v804.list[v805.index].visible_state = function()
        -- upvalues: v805 (ref)
        if not v805.conditions then
            return true;
        else
            for _, v807 in pairs(v805.conditions) do
                if not v807() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v804.list[v805.index].element:set_callback(v804.visibility_handle);
    v804.visibility_handle();
end;
v804.get = function(v808)
    -- upvalues: v804 (ref)
    return v804.list[v808] and v804.list[v808].element:get();
end;
v804.set = function(v809, v810)
    -- upvalues: v804 (ref)
    return v804.list[v809] and v804.list[v809].element:set(v810);
end;
v804.get_element = function(v811)
    -- upvalues: v804 (ref)
    return v804.list[v811] and v804.list[v811].element;
end;
v804.delete = function(v812)
    -- upvalues: v804 (ref)
    v804.get(v812):destroy();
    v804.list[v812] = nil;
end;
v804.contains = function(v813, v814)
    -- upvalues: v804 (ref)
    v813 = v804.get(v813);
    if type(v813) ~= "table" then
        return false;
    else
        for v815 = 1, #v813 do
            if v813[v815] == v814 then
                return true;
            end;
        end;
        return false;
    end;
end;
v804.visibility_handle = function()
    -- upvalues: v804 (ref)
    if ui.get_alpha() == 1 then
        for _, v817 in pairs(v804.list) do
            v817.element:visibility(v817.visible_state());
        end;
    end;
end;
local v827 = {
    export = function()
        -- upvalues: v804 (ref), l_clipboard_1 (ref), l_base64_1 (ref)
        local v818 = {};
        for v819, v820 in pairs(v804.list) do
            if v820.flags == "c" then
                v818[v819] = {
                    [1] = v804.list[v819].element:get().r, 
                    [2] = v804.list[v819].element:get().g, 
                    [3] = v804.list[v819].element:get().b, 
                    [4] = v804.list[v819].element:get().a
                };
            elseif v820.flags ~= "-" then
                v818[v819] = v804.list[v819].element:get();
            end;
        end;
        l_clipboard_1.set(l_base64_1.encode(json.stringify(v818)));
        common.add_notify("Configs", "The Configs Export Successfully!");
    end, 
    import = function()
        -- upvalues: l_base64_1 (ref), l_clipboard_1 (ref), v804 (ref)
        local v821 = json.parse(l_base64_1.decode(l_clipboard_1.get()));
        for v822, v823 in pairs(v821) do
            if v804.list[v822].flags == "c" then
                v804.get_element(v822):set(color(v823[1], v823[2], v823[3], v823[4]));
            else
                v804.get_element(v822):set(v823);
            end;
        end;
        v804.visibility_handle();
        common.add_notify("Configs", "The Configs Import Successfully!");
    end, 
    default = function()
        -- upvalues: l_base64_1 (ref), v804 (ref)
        local v824 = json.parse(l_base64_1.decode("eyJhaV9kaXNfdHAiOjI4LjAsImFpX3RlbGVwb3J0Ijp0cnVlLCJhaV90ZWxlcG9ydF9tb2RlIjoiRGlzdGFuY2UiLCJhaV90aWNrcyI6MTMuMCwiY3VzdG9tX2hpdGJveCI6WyJIZWFkIiwiU3RvbWFjaCJdLCJkX3Bwb2ludF9jbHIiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sImRldGVjdGVkX2luZCI6dHJ1ZSwiZGV0ZWN0aW9uX21vZGUiOjIuMCwiZGlzdGFuY2UiOjY3LjAsImRvcm1hbnQiOmZhbHNlLCJkdF9jaGFyZ2VfZml4Ijp0cnVlLCJkdF9qdW1wc2NvdXQiOnRydWUsImR0X3ByZWRpY3Rpb24iOmZhbHNlLCJsZWZ0X2luZCI6ZmFsc2UsImxpX3NjYWxlIjoiNzUlIiwibWFpbl9zd2l0Y2giOnRydWUsInBwb2ludF9jbHIiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sInBwb2ludF9pbmQiOnRydWUsInNraXBfdGVhbW1hdGUiOnRydWUsInN0YXJ0X3Bvc19jbHIiOlsyNTUuMCwwLjAsMC4wLDI1NS4wXSwic3RhcnRfcG9zX2luZCI6dHJ1ZSwic3luY19wcG9pbnQiOmZhbHNlLCJ0YXJnZXRfbW9kZSI6Mi4wLCJ2aWV3X21vZGVzIjoiRm9sbG93IENhbWVyYSJ9"));
        for v825, v826 in pairs(v824) do
            if v804.list[v825].flags == "c" then
                v804.get_element(v825):set(color(v826[1], v826[2], v826[3], v826[4]));
            else
                v804.get_element(v825):set(v826);
            end;
        end;
        v804.visibility_handle();
        common.add_notify("Configs", "The Default Configs Import Successfully!");
    end
};
local v828 = {
    peekbot_main = ui.create("AIPEEK", "Main Function"), 
    peekbot_init = ui.create("AIPEEK", "Main Function"), 
    peekbot_detection = ui.create("AIPEEK", "Misc Function"), 
    info_configs = ui.create("AIPEEK", "Main Function"), 
    indicator = ui.create("AIPEEK", "Main Function"), 
    indicator_color = ui.create("AIPEEK", "Main Function")
};
local v829 = {
    [1] = "By Threat (Unstable)", 
    [2] = "The Closest Crosshair (Better)", 
    [3] = "Cycle", 
    [4] = "Cycle x2"
};
local v830 = l_gradient_0.text("AI Peek Beta", true, {
    color(50, 245, 215, 255), 
    color(220, 0, 255, 255)
});
local v831 = l_gradient_0.text(common.get_username(), true, {
    color(50, 245, 215, 255), 
    color(220, 0, 255, 255)
});
local v832 = l_gradient_0.text("08.06.2022", true, {
    color(50, 245, 215, 255), 
    color(220, 0, 255, 255)
});
local v833 = l_gradient_0.text("03.04.2023", true, {
    color(50, 245, 215, 255), 
    color(220, 0, 255, 255)
});
v804.push({
    flags = "", 
    index = "main_switch", 
    element = v828.peekbot_main:switch("Ai Peek", false)
});
v804.push({
    flags = "-", 
    index = "bind_key", 
    element = v828.peekbot_main:switch("Bind Key", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "target_mode", 
    element = v828.peekbot_detection:list("Target Mode", v829), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "detection_mode", 
    element = v828.peekbot_detection:list("Detection Mode", {
        [1] = "Safety (Better Anti Get Trick)", 
        [2] = "Risky (Ignore Get Trick)", 
        [3] = "Lite (Normal)"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "custom_hitbox", 
    element = v828.peekbot_detection:selectable("Custom Hitbox", {
        [1] = "Head", 
        [2] = "Chest", 
        [3] = "Stomach", 
        [4] = "Arms", 
        [5] = "Legs", 
        [6] = "Feet"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "dormant", 
    element = v828.peekbot_detection:switch("Detect Dormant (Risky)", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "distance", 
    element = v828.peekbot_init:slider("Distance", 30, 100, 50), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "view_modes", 
    element = v828.peekbot_init:combo("View Modes", {
        [1] = "At Target", 
        [2] = "Follow Camera"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "skip_teammate", 
    element = v828.peekbot_init:switch("Skip Teammate", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "sync_ppoint", 
    element = v828.peekbot_init:switch("Sync Start Point", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "ai_teleport", 
    element = v828.peekbot_init:switch("Auto Teleport", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "ai_teleport_mode", 
    element = v828.peekbot_init:combo("Teleport Mode", {
        [1] = "Ticks", 
        [2] = "Distance", 
        [3] = "Enemy Lethal"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch") and v804.get("ai_teleport");
        end
    }
});
v804.push({
    flags = "", 
    index = "ai_ticks", 
    element = v828.peekbot_init:slider("Delay Ticks", 0, 64, 20), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch") and v804.get("ai_teleport");
        end, 
        [2] = function()
            -- upvalues: v804 (ref)
            return v804.get("ai_teleport_mode") ~= "Distance";
        end
    }
});
v804.push({
    flags = "", 
    index = "ai_dis_tp", 
    element = v828.peekbot_init:slider("Distance Debugs", 0, 100, 90, 0.01), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch") and v804.get("ai_teleport");
        end, 
        [2] = function()
            -- upvalues: v804 (ref)
            return v804.get("ai_teleport_mode") == "Distance";
        end
    }
});
v804.push({
    flags = "", 
    index = "dt_prediction", 
    element = v828.peekbot_init:switch("DT Damage Prediction", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "dt_charge_fix", 
    element = v828.peekbot_init:switch("DT Charge Fix", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "dt_jumpscout", 
    element = v828.peekbot_init:switch("DT Jumpscout Teleport Peek (DEMO)", false), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("main_switch");
        end
    }
});
v804.push({
    flags = "", 
    index = "start_pos_ind", 
    element = v828.indicator:switch("Start Point")
});
v804.push({
    flags = "c", 
    index = "start_pos_clr", 
    element = v828.indicator_color:color_picker("Start Point Color", color(255)), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("start_pos_ind");
        end
    }
});
v804.push({
    flags = "", 
    index = "ppoint_ind", 
    element = v828.indicator:switch("Predict Point")
});
v804.push({
    flags = "c", 
    index = "ppoint_clr", 
    element = v828.indicator_color:color_picker("Predict Point Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("ppoint_ind");
        end
    }
});
v804.push({
    flags = "", 
    index = "detected_ind", 
    element = v828.indicator:switch("Detected Point")
});
v804.push({
    flags = "c", 
    index = "d_ppoint_clr", 
    element = v828.indicator_color:color_picker("Detected Point Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("detected_ind");
        end
    }
});
v804.push({
    flags = "", 
    index = "left_ind", 
    element = v828.indicator:switch("Left Indicator")
});
v804.push({
    flags = "", 
    index = "li_scale", 
    element = v828.indicator:combo("Left Indicator Scale", {
        [1] = "75%", 
        [2] = "100%", 
        [3] = "125%", 
        [4] = "150%"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v804 (ref)
            return v804.get("left_ind");
        end
    }
});
v804.push({
    flags = "-", 
    index = "export", 
    element = v828.peekbot_detection:button(" " .. ui.get_icon("file-export") .. " Export Configs ", v827.export, true)
});
v804.push({
    flags = "-", 
    index = "import", 
    element = v828.peekbot_detection:button(" " .. ui.get_icon("file-import") .. " Import Configs ", v827.import, true)
});
v804.push({
    flags = "-", 
    index = "default", 
    element = v828.peekbot_detection:button(" " .. ui.get_icon("file-import") .. " Default Configs ", v827.default, true)
});
local v834 = {
    Peek_Assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    Retreat_Mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
    Double_Tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    Minimum_Damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    HitChance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    Auto_Stop = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop"), 
    AS_Options = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"), 
    ASDT_Options = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Double Tap"), 
    Air_Strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
};
local function v839(v835, v836, v837)
    for v838 = 1, v837 do
        if v835[v838] ~= nil then
            v835[v838 + 1] = v835[v838];
        end;
    end;
    v835[1] = v836;
    return v835;
end;
local function v844(v840, v841)
    for _, v843 in pairs(v840) do
        if v843 == v841 then
            return true;
        end;
    end;
    return false;
end;
local v851 = {
    AngleToVector = function(v845, v846)
        local function v848(v847)
            return math.pi / 180 * v847;
        end;
        local v849 = v848(v845);
        local v850 = v848(v846);
        return math.cos(v849) * math.cos(v850), math.cos(v849) * math.sin(v850), -math.sin(v849);
    end
};
local v852 = nil;
local v853 = false;
local v854 = false;
local v855 = nil;
local v856 = nil;
local v857 = {};
local v858 = 1;
local v859 = 1;
local v860 = {
    bullet = {}, 
    bullet_cache = {}, 
    ppoint_cache = {}
};
local v861 = nil;
local v862 = 0;
local l_tickcount_1 = globals.tickcount;
local v864 = false;
local v865 = {
    head = {
        [1] = 0
    }, 
    chest = {
        [1] = 2, 
        [2] = 3, 
        [3] = 4
    }, 
    stomach = {
        [1] = 5, 
        [2] = 6
    }, 
    arms = {
        [1] = 13, 
        [2] = 14, 
        [3] = 15, 
        [4] = 16, 
        [5] = 17, 
        [6] = 18
    }, 
    legs = {
        [1] = 7, 
        [2] = 8, 
        [3] = 9, 
        [4] = 10
    }, 
    feet = {
        [1] = 11, 
        [2] = 12
    }
};
local v887 = {
    trace_line = function(v866, v867, v868, v869)
        -- upvalues: v804 (ref), v839 (ref)
        local function v872(v870, _)
            -- upvalues: v804 (ref)
            if v804.get("skip_teammate") and v870:is_player() and not v870:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
        local v873 = utils.trace_line(v867, v868, v872);
        if type(v866) == "table" then
            v839(v866, {
                start_pos = v873.start_pos, 
                end_pos = v873.end_pos
            }, v869);
        end;
        return v873.fraction, v873.entity, v873.end_pos;
    end, 
    trace_bullet = function(v874, v875, v876)
        -- upvalues: v834 (ref), v839 (ref), v860 (ref), v859 (ref)
        local v877 = entity.get_local_player();
        local v880, v881 = utils.trace_bullet(v877, v874, v875, function(v878, _)
            if v878:is_player() and not v878:is_enemy() then
                return false;
            else
                return true;
            end;
        end);
        if v876 then
            local v882 = v834.HitChance:get_override() or v834.HitChance:get();
            if type(v882) == "string" then
                v882 = v834.HitChance:get();
            end;
            v880 = math.floor(v880 * (v882 / 100) * 0.015 * 10);
        end;
        v839(v860.bullet, {
            start_pos = v874, 
            end_pos = v881.end_pos, 
            damage = v880, 
            in_air = v876
        }, 2);
        if not v881:did_hit_world() then
            v859 = math.floor(v859) + 1;
        end;
        return v881, v880;
    end, 
    can_shoot = function()
        -- upvalues: v834 (ref), l_tickcount_1 (ref), v804 (ref)
        local v883 = entity.get_local_player();
        local v884 = v883:get_player_weapon();
        if v884 == nil then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local v886 = v883.m_flNextAttack <= l_curtime_0 and v884.m_flNextPrimaryAttack <= l_curtime_0;
            if v834.Double_Tap:get() and globals.tickcount > l_tickcount_1 then
                if v804.get("dt_charge_fix") then
                    rage.exploit:allow_charge(true);
                end;
                return rage.exploit:get() == 1 and v886;
            else
                return v886;
            end;
        end;
    end
};
local function v893()
    -- upvalues: v804 (ref), v834 (ref), v861 (ref)
    if not v804.get("ai_dt_dmg") then
        return nil;
    elseif not v834.Double_Tap:get() then
        return nil;
    elseif v861 == nil then
        return nil;
    else
        local v888 = entity.get_local_player();
        if v888 == nil or not v888:is_alive() then
            return;
        else
            local v889 = 0;
            local l_m_iHealth_1 = v861.m_iHealth;
            local v891, _ = utils.trace_bullet(v888, v888:get_origin(), v861:get_origin());
            if v891 == nil or v891 <= 0 then
                return nil;
            else
                if v889 < v891 then
                    v889 = v891;
                end;
                if l_m_iHealth_1 <= v891 and v891 < 100 then
                    v889 = v891;
                elseif l_m_iHealth_1 / 2 <= v891 then
                    v889 = l_m_iHealth_1 / 2;
                else
                    v889 = v834.Minimum_Damage:get();
                end;
                v834.Minimum_Damage:override(v889);
                return;
            end;
        end;
    end;
end;
local l_tickcount_2 = globals.tickcount;
v887.set_movement = function(v895, v896)
    -- upvalues: v855 (ref), v854 (ref), v834 (ref), v844 (ref), v864 (ref), v893 (ref), v804 (ref), l_tickcount_2 (ref), l_tickcount_1 (ref), v852 (ref), v861 (ref), v862 (ref)
    local v897 = entity.get_local_player():get_origin();
    local _, v899 = v897:to(v896):angles():unpack();
    local v900 = nil;
    if v855 ~= nil and not v854 then
        v900 = v897:dist2d(v855);
    end;
    v895.in_forward = 1;
    v895.in_back = 0;
    v895.in_moveleft = 0;
    v895.in_moveright = 0;
    v895.in_speed = 0;
    v895.forwardmove = 450;
    v895.sidemove = 0;
    local v901 = v834.Retreat_Mode:get();
    if v844(v901, "On Key Release") then
        for v902 = 1, #v901 do
            if v901[v902] == "On Key Release" then
                table.remove(v901, v902);
                v834.Retreat_Mode:override(v901);
                break;
            end;
        end;
    end;
    local v903 = v834.AS_Options:get();
    local v904 = v834.ASDT_Options:get();
    if v864 then
        if not v844(v903, "In Air") then
            table.insert(v903, "In Air");
        end;
        if not v844(v903, "Full Stop") then
            table.insert(v903, "Full Stop");
        end;
        if not v844(v904, "Full Stop") then
            table.insert(v904, "Full Stop");
        end;
    end;
    v893();
    if v834.Double_Tap:get() and v804.get("ai_teleport") and not v854 then
        local v905 = v804.get("ai_teleport_mode");
        if rage.exploit:get() == 1 then
            if v905 == "Ticks" and globals.tickcount >= l_tickcount_2 then
                if v804.get("dt_jumpscout") and v864 then
                    v834.AS_Options:override(v903);
                    v834.ASDT_Options:override(v904);
                    v834.Air_Strafe:override(false);
                    v895.in_jump = 1;
                end;
                rage.exploit:force_teleport();
                l_tickcount_1 = globals.tickcount + 20;
                if v804.get("dt_charge_fix") then
                    rage.exploit:allow_charge(false);
                end;
            elseif v905 == "Distance" and v897:dist2d(v852) > v900 * (v804.get("ai_dis_tp") / 100) and v900 > 10 then
                if v804.get("dt_jumpscout") and v864 then
                    v834.AS_Options:override(v903);
                    v834.ASDT_Options:override(v904);
                    v834.Air_Strafe:override(false);
                    v895.in_jump = 1;
                end;
                rage.exploit:force_teleport();
                l_tickcount_1 = globals.tickcount + 20;
                if v804.get("dt_charge_fix") then
                    rage.exploit:allow_charge(false);
                end;
            elseif v905 == "Enemy Lethal" and v861.m_iHealth < 93 and v862 > 50 and globals.tickcount >= l_tickcount_2 then
                if v804.get("dt_jumpscout") and v864 then
                    v834.AS_Options:override(v903);
                    v834.ASDT_Options:override(v904);
                    v834.Air_Strafe:override(false);
                    v895.in_jump = 1;
                end;
                rage.exploit:force_teleport();
                l_tickcount_1 = globals.tickcount + 20;
                if v804.get("dt_charge_fix") then
                    rage.exploit:allow_charge(false);
                end;
            end;
        end;
        v895.move_yaw = v899;
    else
        v895.move_yaw = v899;
    end;
end;
v887.update_hitbox = function()
    -- upvalues: v804 (ref), v865 (ref), v857 (ref)
    local v906 = {};
    local v907 = v804.get("custom_hitbox");
    for v908 = 1, #v907 do
        local v909 = v865[v907[v908]:lower()];
        for v910 = 1, #v909 do
            table.insert(v906, v909[v910]);
        end;
    end;
    v857 = v906;
end;
v887.handle_trace = function(v911, v912, v913, v914, v915, v916, v917)
    -- upvalues: v858 (ref), v804 (ref), v855 (ref), v856 (ref), v857 (ref), v887 (ref), v839 (ref), v860 (ref), v834 (ref), v862 (ref), v864 (ref)
    if not v917 then
        v917 = 1;
    end;
    v858 = v858 or 1;
    if v804.get("distance") < v917 then
        v855 = nil;
        v856 = nil;
        return;
    else
        local v918 = entity.get_local_player();
        if v918 == nil or not v918:is_alive() then
            return;
        else
            local v919 = v918:get_player_weapon();
            if v919 == nil then
                return;
            else
                local v920 = v857[v858];
                if v920 == nil then
                    return;
                else
                    local v921 = v911:get_hitbox_position(v920);
                    if #v857 > 1 then
                        v858 = v858 < #v857 and v858 + 1 or 1;
                    else
                        v858 = 1;
                    end;
                    local v922 = vector(v912 * v917 + v916.x, v913 * v917 + v916.y, v916.z);
                    local v923 = vector(v914 * v917 + v916.x, v915 * v917 + v916.y, v916.z);
                    local v924, _, v926 = v887.trace_line(false, v916, v922);
                    local v927, _, v929 = v887.trace_line(false, v916, v923);
                    v839(v860.ppoint_cache, {
                        left = v926, 
                        right = v929
                    }, 1);
                    local v930, v931, _ = v887.trace_line(false, v922, v921);
                    local v933, v934, _ = v887.trace_line(false, v923, v921);
                    local v936 = vector(v922.x, v922.y, v922.z + v922.z * 0.75);
                    local v937 = vector(v923.x, v923.y, v923.z + v923.z * 0.75);
                    local _, v939 = v887.trace_bullet(v922, v921, false);
                    local _, v941 = v887.trace_bullet(v923, v921, false);
                    local v942 = v924 == 1 or v927 == 1;
                    local v943 = v834.Minimum_Damage:get();
                    local v944 = false;
                    if not v944 then
                        for _, v946 in pairs(v860.bullet) do
                            local l_damage_0 = v946.damage;
                            local l_start_pos_0 = v946.start_pos;
                            if v942 and v943 == 0 or type(v943) ~= "number" then
                                if v911.m_iHealth < l_damage_0 then
                                    v855 = l_start_pos_0;
                                    v856 = nil;
                                    v862 = l_damage_0;
                                    v864 = false;
                                else
                                    v856 = l_start_pos_0;
                                    v864 = false;
                                    v944 = true;
                                end;
                            elseif v942 and math.min(v943, v911.m_iHealth) < l_damage_0 then
                                v855 = l_start_pos_0;
                                v856 = nil;
                                v862 = l_damage_0;
                                v864 = false;
                            else
                                v856 = l_start_pos_0;
                                v864 = false;
                                v944 = true;
                            end;
                        end;
                    end;
                    if v944 and v804.get("dt_jumpscout") and v919:get_weapon_index() == 40 then
                        local _, _ = v887.trace_bullet(v937, v921, true);
                        local _, _ = v887.trace_bullet(v936, v921, true);
                        for _, v954 in pairs(v860.bullet) do
                            local l_damage_1 = v954.damage;
                            local l_start_pos_1 = v954.start_pos;
                            if v943 == 0 or type(v943) ~= "number" then
                                if v911.m_iHealth < l_damage_1 then
                                    v855 = l_start_pos_1;
                                    v856 = nil;
                                    v862 = l_damage_1;
                                    v864 = true;
                                else
                                    v856 = l_start_pos_1;
                                    v864 = false;
                                end;
                            elseif math.min(v943, v911.m_iHealth) < l_damage_1 then
                                v855 = l_start_pos_1;
                                v856 = nil;
                                v862 = l_damage_1;
                                v864 = true;
                            else
                                v856 = l_start_pos_1;
                                v864 = false;
                            end;
                        end;
                    end;
                    if (v924 == 1 or v927 == 1) and v930 < 1 and v933 < 1 and v931 ~= v911 and v934 ~= v911 and v941 < v943 and v939 < v943 then
                        local v957 = v804.get("detection_mode") == 1 and 0.03 or v804.get("detection_mode") == 2 and 0 or 0.01;
                        local v958 = v804.get("detection_mode") == 1 and 6 or v804.get("detection_mode") == 2 and 4 or 8;
                        utils.execute_after(v957, v887.handle_trace, v911, v912, v913, v914, v915, v916, v917 + v958);
                    else
                        v856 = nil;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v887.do_retreat = function(v959)
    -- upvalues: v852 (ref), v854 (ref), v887 (ref), l_tickcount_2 (ref), v804 (ref)
    if v852 and v854 then
        local v960 = entity.get_local_player():get_origin();
        if v852:dist2d(v960) > 5 then
            v887.set_movement(v959, v852);
        else
            v854 = false;
            l_tickcount_2 = globals.tickcount + v804.get("ai_ticks");
        end;
    end;
end;
v887.get_target = function(v961)
    -- upvalues: v804 (ref), v859 (ref)
    local v962 = nil;
    local v963, v964 = render.screen_size():unpack();
    if v961 == 1 then
        v962 = entity.get_threat();
    elseif v961 == 2 then
        local v965 = entity.get_players(true, v804.get("dormant"));
        local v966 = {};
        for _, v968 in pairs(v965) do
            if v968:is_alive() and (v804.get("dormant") or not v968:is_dormant()) then
                local v969, _, v971 = render.get_offscreen(v968:get_origin(), 180, true);
                if not v971 then
                    local v972, v973 = v969:unpack();
                    local v974 = vector(v963 / 2, v964 / 2):dist2d(vector(v972, v973));
                    table.insert(v966, {
                        target = v968, 
                        distance = v974
                    });
                end;
            end;
        end;
        table.sort(v966, function(v975, v976)
            return v975.distance < v976.distance;
        end);
        if v966[1] == nil then
            v962 = nil;
        else
            v962 = v966[1].target;
        end;
    elseif v961 >= 3 then
        local v977 = entity.get_players(true, v804.get("dormant"));
        local v978 = {};
        for _, v980 in pairs(v977) do
            if v980:is_alive() and (v804.get("dormant") or not v980:is_dormant()) then
                local v981, _, v983 = render.get_offscreen(v980:get_origin(), 180, true);
                if not v983 and v981:in_range(render.screen_size() / 2, v961 == 3 and 240 or 480) then
                    table.insert(v978, v980);
                end;
            end;
        end;
        if v978[1] == nil then
            v962 = nil;
        else
            local v984 = {};
            for _, v986 in pairs(v978) do
                if not v986:is_dormant() then
                    table.insert(v984, v986);
                end;
            end;
            if #v984 == 0 then
                if v859 > #v978 then
                    v859 = 1;
                end;
                v962 = v978[math.floor(v859)];
            else
                if v859 > #v984 then
                    v859 = 1;
                end;
                v962 = v984[math.floor(v859)];
            end;
            v859 = v859 + 1;
        end;
    end;
    return v962;
end;
v887.main = function(v987)
    -- upvalues: v834 (ref), v804 (ref), v887 (ref), v855 (ref), v852 (ref), v856 (ref), v861 (ref), v851 (ref), v854 (ref), v853 (ref), l_tickcount_2 (ref)
    rage.exploit:allow_charge(true);
    for _, v989 in pairs(v834) do
        v989:override();
    end;
    if not v804.get("main_switch") or not v804.get("bind_key") then
        v887.should_return = false;
        v855 = nil;
        v852 = nil;
        v856 = nil;
        return;
    else
        local v990 = entity.get_local_player();
        if v990 == nil or not v990:is_alive() then
            v856 = nil;
            v855 = nil;
            return;
        else
            local v991 = v887.get_target(v804.get("target_mode"));
            if not v991 or not v991:is_player() or not v991:is_alive() then
                return v887.do_retreat(v987);
            else
                v861 = v991;
                if not v804.get("dormant") and v991:is_dormant() then
                    v856 = nil;
                    v855 = nil;
                    return v887.do_retreat(v987);
                else
                    local v992 = v990:get_origin();
                    local v993 = v991:get_origin();
                    v852 = v852 or v992;
                    local v994 = v990:get_eye_position();
                    local v995 = nil;
                    local v996 = nil;
                    local v997 = nil;
                    local v998 = nil;
                    local v999 = nil;
                    local v1000 = nil;
                    if v804.get("view_modes") == "At Target" then
                        local v1001 = v994.x - v993.x;
                        local v1002 = v994.y - v993.y;
                        local v1003 = math.atan2(v1002, v1001) * (180 / math.pi);
                        local v1004, v1005, v1006 = v851.AngleToVector(0, v1003 - 90);
                        v997 = v1006;
                        v996 = v1005;
                        v995 = v1004;
                        v1004, v1005, v1006 = v851.AngleToVector(0, v1003 + 90);
                        v1000 = v1006;
                        v999 = v1005;
                        v998 = v1004;
                    else
                        local _, v1008 = render.camera_angles():unpack();
                        local v1009, v1010, v1011 = v851.AngleToVector(0, v1008 - 90);
                        v997 = v1011;
                        v996 = v1010;
                        v995 = v1009;
                        v1009, v1010, v1011 = v851.AngleToVector(0, v1008 + 90);
                        v1000 = v1011;
                        v999 = v1010;
                        v998 = v1009;
                    end;
                    local v1012 = v887.can_shoot();
                    if v1012 then

                    end;
                    v854 = v854;
                    if not v856 and not v855 then
                        v887.handle_trace(v991, v995, v996, v998, v999, v994);
                    end;
                    if v853 then
                        v854 = true;
                        v853 = false;
                        v856 = nil;
                        v855 = nil;
                    end;
                    if not v854 and not v855 and v804.get("sync_ppoint") then
                        v852 = v992;
                    end;
                    if v855 then
                        if v992:dist2d(v855) > 4 and v1012 then
                            v854 = false;
                            local v1013, _, _ = v887.trace_line(false, v992, v855);
                            if v1013 == 1 then
                                v887.set_movement(v987, v855);
                            else
                                v855 = nil;
                            end;
                        else
                            v854 = true;
                            v855 = nil;
                            l_tickcount_2 = globals.tickcount + v804.get("ai_ticks");
                        end;
                    end;
                    v887.do_retreat(v987);
                    return;
                end;
            end;
        end;
    end;
end;
v887.indicator = function()
    -- upvalues: v804 (ref), v852 (ref), v887 (ref), v855 (ref), v860 (ref)
    if not v804.get("main_switch") or not v804.get("bind_key") then
        return;
    else
        local v1016 = entity.get_local_player();
        if v1016 == nil or not v1016:is_alive() then
            return;
        else
            local v1017 = v1016:get_origin();
            if v804.get("start_pos_ind") then
                local v1018 = v804.get("start_pos_clr");
                render.circle_3d(v852, v1018, 12, 0, 1, 2);
            end;
            if not v887.can_shoot() then
                return;
            else
                local v1019 = v804.get("d_ppoint_clr");
                if v855 ~= nil then
                    if v804.get("detected_ind") then
                        local v1020 = vector(v855.x, v855.y, v1017.z + 7);
                        render.circle_3d(v1020, v1019, 12, 0, 1, 2);
                    end;
                elseif v804.get("ppoint_ind") then
                    if v860.ppoint_cache == nil or #v860.ppoint_cache == 0 then
                        return;
                    else
                        local v1021 = v804.get("ppoint_clr");
                        for v1022 = 1, #v860.ppoint_cache do
                            local l_left_1 = v860.ppoint_cache[v1022].left;
                            local l_right_0 = v860.ppoint_cache[v1022].right;
                            local v1025 = vector(l_left_1.x, l_left_1.y, v1017.z + 7);
                            local v1026 = vector(l_right_0.x, l_right_0.y, v1017.z + 7);
                            if v1025:in_range(v1017, v804.get("distance")) then
                                render.circle_3d(v1025, v1021, 12, 0, 1, 2);
                            end;
                            if v1026:in_range(v1017, v804.get("distance")) then
                                render.circle_3d(v1026, v1021, 12, 0, 1, 2);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local v1027 = render.screen_size();
local v1028 = v1027.x / 100 + 2;
local v1029 = v1027.y / 1.48 - 5;
local v1030 = {
    ["75%"] = 0.75, 
    ["150%"] = 1.5, 
    ["125%"] = 1.25, 
    ["100%"] = 1
};
local function v1037(v1031, v1032, v1033, v1034)
    -- upvalues: v1030 (ref), v804 (ref), v1029 (ref), v1028 (ref)
    local v1035 = render.measure_text(v1034, nil, v1031);
    local v1036 = v1030[v804.get("li_scale")];
    render.gradient(vector(13, v1029 + v1032 - 2), vector(13 + v1035.x / 2, v1029 + v1032 + 30 * v1036), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65));
    render.gradient(vector(13 + v1035.x / 2, v1029 + v1032 - 2), vector(13 + v1035.x, v1029 + v1032 + 30 * v1036), color(0, 0, 0, 65), color(0, 0, 0, 0), color(0, 0, 0, 65), color(0, 0, 0, 0));
    render.text(v1034, vector(v1028, v1029 + 2 + v1032), color(0, 0, 0, 1), nil, v1031);
    render.text(v1034, vector(v1028, v1029 + 1 + v1032), v1033, nil, v1031);
end;
local v1038 = render.load_font("Calibri Bold", 30);
local function v1040()
    -- upvalues: v804 (ref), v1038 (ref), v1030 (ref)
    local v1039 = v804.get("li_scale");
    v1038 = render.load_font("Calibri Bold", 30 * v1030[v1039]);
end;
v804.get_element("li_scale"):set_callback(v1040);
v1040();
local function v1049()
    -- upvalues: v804 (ref), v1030 (ref), v861 (ref), v1037 (ref), v1038 (ref)
    if not v804.get("main_switch") then
        return;
    elseif not v804.get("left_ind") then
        return;
    elseif not globals.is_in_game then
        return;
    else
        local v1041 = entity.get_local_player();
        if v1041 == nil or not v1041:is_alive() then
            return;
        else
            local v1042 = 0;
            local v1043 = v1030[v804.get("li_scale")];
            local v1044 = nil;
            local v1045 = nil;
            if v861 ~= nil then
                v1044 = "Target: " .. v861:get_name();
                v1045 = color(0, 180, 200, 255);
            elseif v804.get("bind_key") then
                v1044 = "Target: None";
                v1045 = color(140, 250, 0, 255);
            else
                v1044 = "AIPeek is Disabled";
                v1045 = color(200, 200, 50, 255);
            end;
            v1037(v1044, v1042, v1045, v1038);
            v1042 = v1042 - 50 * v1043;
            local v1046 = v861 == nil and "Enemy Not Found" or v804.get("bind_key") and "Enemy Found" or "AIPeek Disabled";
            local v1047 = v861 == nil and color(150, 200, 10, 255) or color(255, 255, 0, 255);
            v1037(v1046, v1042, v1047, v1038);
            v1042 = v1042 - 50 * v1043;
            local v1048 = v804.get("bind_key") and color(0, 255, 0, 255) or color(200, 120, 0, 255);
            v1037("AIPeek Beta", v1042, v1048, v1038);
            v1042 = v1042 - 50 * v1043;
            return;
        end;
    end;
end;
local v1054 = {
    on_player_spawn = function(v1050)
        -- upvalues: v887 (ref), v860 (ref)
        if entity.get(v1050.userid, true) == entity.get_local_player() then
            v887.update_hitbox();
            v860.bullet = {};
            v860.ppoint_cache = {};
        end;
    end, 
    aim_fire = function(_)
        -- upvalues: v854 (ref), v853 (ref), v855 (ref), v856 (ref), v861 (ref)
        v854 = true;
        v853 = true;
        v855 = nil;
        v856 = nil;
        v861 = nil;
    end, 
    render = function()
        -- upvalues: v887 (ref), v1049 (ref)
        v887.indicator();
        v1049();
    end, 
    shutdown = function()
        -- upvalues: v834 (ref)
        for _, v1053 in pairs(v834) do
            v1053:override();
        end;
    end
};
events.round_start:set(function()
    -- upvalues: v861 (ref), v862 (ref)
    v861 = nil;
    v862 = 0;
end);
events.player_spawn:set(v1054.on_player_spawn);
events.render:set(v1054.render);
events.createmove:set(v887.main);
events.aim_fire:set(v1054.aim_fire);
events.shutdown:set(v1054.shutdown);
v804.get_element("custom_hitbox"):set_callback(v887.update_hitbox);
v887.update_hitbox();
local v1055 = nil;
v804.get_element("bind_key"):set_callback(function()
    -- upvalues: v804 (ref), v1055 (ref), v852 (ref), v854 (ref), v853 (ref), v856 (ref), v855 (ref), v861 (ref), v860 (ref)
    local v1056 = v804.get("bind_key");
    if not v1055 or not v1056 then

    end;
    v1055 = v1055;
    if v1055 then
        return;
    else
        local v1057 = entity.get_local_player();
        if v1057 == nil then
            return;
        else
            v1055 = true;
            v852 = v1057:get_origin();
            v854 = false;
            v853 = false;
            v856 = nil;
            v855 = nil;
            v861 = nil;
            v860.ppoint_cache = {};
            v860.bullet = {};
            return;
        end;
    end;
end);
ui.localize("cn", "Welcome, " .. v831, "\228\189\160\229\165\189, " .. v831);
ui.localize("cn", "Thank You For Using " .. v830, "\230\132\159\232\176\162\228\189\160\228\189\191\231\148\168 " .. v830);
ui.localize("cn", "Release From " .. v832, "\229\143\145\229\184\131\230\151\182\233\151\180\239\188\154 " .. v832);
ui.localize("cn", "Last Update From " .. v833, "\230\155\180\230\150\176\230\151\182\233\151\180\239\188\154 " .. v833);
ui.localize("ru", "Welcome, " .. v831, "\208\148\208\190\208\177\209\128\208\190 \208\191\208\190\208\182\208\176\208\187\208\190\208\178\208\176\209\130\209\140, " .. v831);
ui.localize("ru", "Thank You For Using " .. v830, "\208\161\208\191\208\176\209\129\208\184\208\177\208\190 \208\183\208\176 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\208\189\208\184\208\181 " .. v830);
ui.localize("ru", "Release From " .. v832, "\208\146\209\139\208\191\209\131\209\129\209\130\208\184\209\130\209\140 \208\184\208\183 " .. v832);
ui.localize("ru", "Last Update From " .. v833, "\208\159\208\190\209\129\208\187\208\181\208\180\208\189\208\181\208\181 \208\190\208\177\208\189\208\190\208\178\208\187\208\181\208\189\208\184\208\181 \208\190\209\130 " .. v833);
ui.localize("cn", "Info", "\228\191\161\230\129\175");
ui.localize("cn", "Main", "\228\184\187\233\161\181");
ui.localize("cn", "Configs Systems", "\230\149\176\229\128\188\231\179\187\231\187\159");
ui.localize("cn", "Update Logs", "\230\155\180\230\150\176\230\151\165\229\191\151");
ui.localize("cn", "Main Function", "\228\184\187\232\166\129\229\138\159\232\131\189");
ui.localize("cn", "Init Point", "\229\136\157\229\167\139\229\140\150\231\130\185\228\189\141");
ui.localize("cn", "Detection", "\230\163\128\230\181\139\229\138\159\232\131\189");
ui.localize("cn", "Indicator", "\230\140\135\231\164\186\229\153\168");
ui.localize("cn", "Color Settings", "\233\162\156\232\137\178\232\174\190\231\189\174");
ui.localize("cn", "Bind Key", "\229\144\175\231\148\168 (\231\187\145\229\174\154)");
ui.localize("cn", "Distance", "\232\183\157\231\166\187");
ui.localize("cn", "View Modes", "\231\130\185\228\189\141\229\143\152\229\140\150\230\168\161\229\188\143");
ui.localize("cn", "At Target", "\230\160\185\230\141\174\231\155\174\230\160\135");
ui.localize("cn", "Follow Camera", "\230\160\185\230\141\174\230\156\172\228\189\147\232\167\134\232\167\146");
ui.localize("cn", "Skip Teammate", "\231\130\185\228\189\141\232\183\179\232\183\131\233\152\159\229\143\139");
ui.localize("cn", "Sync Start Point", "\229\144\140\230\173\165\229\136\157\229\167\139\231\130\185\228\189\141");
ui.localize("cn", "Auto Teleport", "\232\135\170\229\138\168DT\233\151\170Peek");
ui.localize("cn", "Teleport Mode", "\233\151\170\231\142\176\230\168\161\229\188\143");
ui.localize("cn", "Ticks", "Ticks \230\151\182\233\149\191");
ui.localize("cn", "Delay Ticks", "Ticks \229\187\182\232\191\159");
ui.localize("cn", "Distance Debugs", "\232\183\157\231\166\187\233\153\144\229\136\182\228\188\152\229\140\150");
ui.localize("cn", "Enemy Lethal", "\230\163\128\230\181\139\231\155\174\230\160\135\229\143\175\228\184\128\230\158\170\229\184\166\232\181\176");
ui.localize("cn", "DT Damage Prediction", "DT \228\188\164\229\174\179\233\162\132\229\136\164");
ui.localize("cn", "DT Charge Fix", "DT \229\133\133\232\131\189\228\191\174\229\164\141 (AIPEEK \233\151\170\231\142\176\230\151\182)");
ui.localize("cn", "DT Jumpscout Teleport Peek (DEMO)", "DT \232\183\179\231\139\153\233\151\170\231\142\176PEEK (\230\181\139\232\175\149)");
ui.localize("cn", "Target Mode", "\230\163\128\230\181\139\231\155\174\230\160\135\230\168\161\229\188\143");
ui.localize("cn", "Detection Mode", "\230\163\128\230\181\139\231\155\174\230\160\135\228\184\142\229\136\134\230\158\144\231\167\187\229\138\168\230\168\161\229\188\143");
ui.localize("cn", "Safety (Better Anti Get Trick)", "\229\174\137\229\133\168\230\168\161\229\188\143 (\229\175\185\228\186\142\233\152\178\232\162\171\233\170\151\229\165\189\228\186\155)");
ui.localize("cn", "Risky (Ignore Get Trick)", "\233\163\142\233\153\169\230\168\161\229\188\143 (\230\156\137\233\163\142\233\153\169\232\162\171\230\138\147\229\155\158\230\186\175\239\188\140\228\189\134\229\191\171)");
ui.localize("cn", "Lite (Normal)", "\230\153\174\233\128\154\230\168\161\229\188\143");
ui.localize("cn", "By Threat (Unstable)", "\230\160\185\230\141\174\230\140\130\230\163\128\230\181\139\231\155\174\230\160\135");
ui.localize("cn", "The Closest Crosshair (Better)", "\230\160\185\230\141\174\231\166\187\229\135\134\230\152\159\230\156\128\232\191\145\231\154\132\230\149\140\228\186\186");
ui.localize("cn", "Cycle", "\230\160\185\230\141\174\229\135\134\230\152\159\232\140\131\229\155\180");
ui.localize("cn", "Cycle x2", "\230\160\185\230\141\174\229\135\134\230\152\159\232\140\131\229\155\180\228\184\142\229\138\160\229\188\186\230\163\128\230\181\139\233\128\159\229\186\166 (\230\153\174\233\128\154\231\154\132x2)");
ui.localize("cn", "Custom Hitbox", "\230\163\128\230\181\139\233\131\168\228\189\141");
ui.localize("cn", "Detect Dormant (Risky)", "\230\163\128\230\181\139\229\141\161ESP\231\155\174\230\160\135 (\233\163\142\233\153\169)");
ui.localize("cn", "Head", "\229\164\180\233\131\168");
ui.localize("cn", "Chest", "\232\131\184\233\131\168");
ui.localize("cn", "Stomach", "\232\131\131\233\131\168");
ui.localize("cn", "Arms", "\230\137\139\233\131\168");
ui.localize("cn", "Legs", "\232\133\191\233\131\168");
ui.localize("cn", "Feet", "\232\132\154\233\131\168");
ui.localize("cn", "Start Point", "\229\136\157\229\167\139\231\130\185\228\189\141");
ui.localize("cn", "Predict Point", "\233\162\132\229\136\164\231\130\185\228\189\141");
ui.localize("cn", "Detected Point", "\230\163\128\230\181\139\231\130\185\228\189\141");
ui.localize("cn", "Left Indicator", "\229\183\166\232\190\185\230\140\135\231\164\186\229\153\168");
ui.localize("cn", "Left Indicator Scale", "\229\183\166\232\190\185\230\140\135\231\164\186\229\153\168\229\164\167\229\176\143");
ui.localize("cn", "Start Point Color", "\229\136\157\229\167\139\231\130\185\228\189\141\233\162\156\232\137\178");
ui.localize("cn", "Predict Point Color", "\233\162\132\229\136\164\231\130\185\228\189\141\233\162\156\232\137\178");
ui.localize("cn", "Detected Point Color", "\230\163\128\230\181\139\231\130\185\228\189\141\233\162\156\232\137\178");
ui.localize("cn", " " .. ui.get_icon("file-export") .. " Export Configs ", " " .. ui.get_icon("file-export") .. " \229\175\188\229\135\186\230\149\176\229\128\188 ");
ui.localize("cn", " " .. ui.get_icon("file-import") .. " Import Configs ", " " .. ui.get_icon("file-import") .. " \229\175\188\229\133\165\230\149\176\229\128\188 ");
ui.localize("cn", " " .. ui.get_icon("file-import") .. " Default Configs ", " " .. ui.get_icon("file-import") .. " \233\162\132\232\174\190\230\149\176\229\128\188 ");
v49("default", true, v244());
v49("onstart", true, v291());
v53("shutdown", "shutdown", shutdown);
v53("aim_ack", "onshot", v314);
v53("player_death", "ondeath", v319);
v53("player_hurt", "onhurt", v339);
v53("bullet_impact", "onbullet", v358);
v53("player_hurt", "onnade", v380);
v53("render", "windows.darken", v20.darken);
v53("render", "onrender", onrender);
v53("render", "windows.infopanel", v20.infopanel);
v53("createmove", "builder.update", v187.update);
v53("createmove", "oncreatemove", oncreatemove);
v53("post_update_clientside_animation", "post_update_clientside_animation", post_update_clientside_animation);