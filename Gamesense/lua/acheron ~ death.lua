--=ACH3RON= / @hell-starts here========================
local try_require = function (module, msg) local success, result = pcall(require, module) if success then return result else return error(msg) end end
-- core libs -------------------------------------------------------------------------------------------------------------------------------------------------------------------
local http = try_require('gamesense/http', '~ Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619')
local antiaim_funcs = try_require('gamesense/antiaim_funcs', '~ Download anti-aim functions library: https://gamesense.pub/forums/viewtopic.php?id=29665')
local ffi = try_require('ffi', '~ Failed to require FFI, please make sure Allow unsafe scripts is enabled!')
-- ui libs -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
local pui = try_require("gamesense/pui", '~ Failed to Load Interfaces: https://gamesense.pub/forums/viewtopic.php?id=41761')
-- config libs ---------------------------------------------------------------------------------------------------------------------------------------------------------------
local clipboard = try_require('gamesense/clipboard', '~ Download clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678')
local msgpack = try_require('gamesense/msgpack', '~ Download msgpack library: https://gamesense.pub/forums/viewtopic.php?id=')
local json = try_require('json', '~ Missing Json')
local base64 = try_require('gamesense/base64', '~ Module base64 not found')
-- render libs --------------------------------------------------------------------------------------------------------------------------------------------------------------
local c_entity = try_require('gamesense/entity', '~ Download entity library: https://gamesense.pub/forums/viewtopic.php?id=27529')
local gif_decoder = try_require('gamesense/gif_decoder', '~ Download gif decoder library: https://gamesense.pub/forums/viewtopic.php?id=')
local images = try_require('gamesense/images', '~ Download images library: https://gamesense.pub/forums/viewtopic.php?id=22917')
local surface = try_require('gamesense/surface', '~ Download surface library: https://gamesense.pub/forums/viewtopic.php?id=18793')
local vector = try_require('vector', '~ Missing vector')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if not LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT = function(...) return ... end
end

local data = database.read("load") or {}
data.load_count = (data.load_count or 0) + 1
client.set_event_callback("shutdown", function()
database.write("load", data)
end)

local is_lua_loaded = false

local function hhh(arg_1)
    local xxx2 = {}

    for xxx3, xxx4 in next, arg_1 do
        xxx2[xxx3] = xxx4
    end

    return xxx2
end

local folder = "acheron"
local cute = vtable_bind
local hey = hhh(string)
local hey2 = hhh(require("ffi"))
local hey3 = defer

local nya = {}
local nya2 = "filesystem_stdio.dll"
local nya3 = "VFileSystem017"
local meow = cute(nya2, nya3, 11, "void (__thiscall*)(void*, const char*, const char*, int)")
local meow2 = cute(nya2, nya3, 12, "bool (__thiscall*)(void*, const char*, const char*)")
local meow3 = cute(nya2, nya3, 1, "int (__thiscall*)(void*, void const*, int, void*)")
local cutie1 = cute(nya2, nya3, 2, "void* (__thiscall*)(void*, const char*, const char*, const char*)")
local cutie2 = cute(nya2, nya3, 3, "void (__thiscall*)(void*, void*)")
local cutie3 = cute("engine.dll", "VEngineClient014", 36, "const char*(__thiscall*)(void*)")

nya.game_directory = hey.sub(hey2.string(cutie3()), 1, -5)

meow(nya.game_directory, "ROOT_PATH", 0)
hey3(function()
    meow2(nya.game_directory, "ROOT_PATH")
end)

nya.create_directory = cute(nya2, nya3, 22, "void (__thiscall*)(void*, const char*, const char*)")
nya.create_directory(folder, "ROOT_PATH")

function download_file(link, path)
    http.get(link, function(success, response)
        if not success or response.status ~= 200 then
            client.error_log(string.format("Could not retrieve asset \"%s\" from server. Error code: %d", path, response.status))
            return
        end
    
        writefile(path, response.body)
    end)
end

function nya.write(arg_2, arg_3)

local eee = cutie1(arg_2, "wb", "ROOT_PATH")

    meow3(arg_3, #arg_3, arg_2)
    cutie2(eee)
end

local x_ind, y_ind = client.screen_size()

calculateGradien = function(color1, color2, text, speed)

    local output = ''
    
    local curtime = globals.curtime()
    
    for idx = 0, #text - 1 do  
        local x = idx * 10
        local wave = math.cos(8 * speed * curtime + x / 30)
    
        local r = lerp(color1[1], color2[1], clamp(wave, 0, 1))
        local g = lerp(color1[2], color2[2], clamp(wave, 0, 1))
        local b = lerp(color1[3], color2[3], clamp(wave, 0, 1))
        local a = color1[4] 
    
        local color = ('\a%02x%02x%02x%02x'):format(r, g, b, a)
        
        output = output .. color .. text:sub(idx + 1, idx + 1)
    end
    
    return output
end

local lua_group = pui.group("aa", "anti-aimbot angles")
local config_group = pui.group("aa", "anti-aimbot angles")
local defensive_group = pui.group("aa", "fake lag")
local other_group = pui.group("aa", "other")

local antiaim_cond = {"Shared\r", "Standing\r", "Walking\r", "Running\r", "In Air\r", "In Air + C\r", "Crouching\r", "Crouching + Moving\r"}
local short_cond = {"\v \aFFFFFF1F• \r", "\vStand \aFFFFFF1F| \r", "\vWalk \aFFFFFF1F| \r", "\vRun \aFFFFFF1F| \r", "\vIn \aFFFFFF1F• \vAir \aFFFFFF1F| \r", "\vIn \aFFFFFF1F• \vAir \aFFFFFF1F+ \vC \aFFFFFF1F| \r", "\vCrouch \aFFFFFF1F| \r", "\vCrouch + \aFFFFFF1F• \vM \aFFFFFF1F| \r"}

local ref = {
    enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    fsbodyyaw = ui.reference("AA", "anti-aimbot angles", "Freestanding body yaw"),
    edgeyaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    fakeduck = ui.reference("RAGE", "Other", "Duck peek assist"),
    forcebaim = ui.reference("RAGE", "Aimbot", "Force body aim"),
    safepoint = ui.reference("RAGE", "Aimbot", "Force safe point"),
    roll = {ui.reference("AA", "Anti-aimbot angles", "Roll")},
    clantag = ui.reference("Misc", "Miscellaneous", "Clan tag spammer"),
    fakelag_amount = ui.reference("AA", "Fake lag", "Amount"),
    fakelag_enable = ui.reference("AA", "Fake lag", "Enabled"),
    fakelag_limit = ui.reference("AA", "Fake lag", "Limit"),
    fakelag_variance = ui.reference("AA", "Fake lag", "Variance"),
    other_slowmotion = ui.reference("AA", "Other", "Slow motion"),
    other_legmovement = ui.reference("AA", "Other", "Leg movement"),
    other_osaa = ui.reference("AA", "Other", "On shot anti-aim"),
    other_fkpeek = ui.reference("AA", "Other", "Fake peek"),
    pitch = {ui.reference("AA", "Anti-aimbot angles", "pitch")},
    rage = {ui.reference("RAGE", "Aimbot", "Enabled")},
    yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")},
    yawjitter = {ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    bodyyaw = {ui.reference("AA", "Anti-aimbot angles", "Body yaw")},
    freestand = {ui.reference("AA", "Anti-aimbot angles", "Freestanding")},
    os = {ui.reference("AA", "Other", "On shot anti-aim")},
    slow = {ui.reference("AA", "Other", "Slow motion")},
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    minimum_damage_override = {ui.reference("RAGE", "Aimbot", "Minimum damage override")},
    autopeek = {ui.reference("RAGE", "Other", "Quick peek assist")},
    accent_color = {ui.reference("MISC", "Settings", "Menu color")},
}

debug = {
    build = "Death", -- Lite, Beta
    build_ver = "1.0.0", -- >1 = recode; >1.0 = big update; >1.0.0 = minor update
    last_upd = "23/4/2026"
}

local steamname = panorama.open("CSGOHud").MyPersonaAPI.GetName()
local js = panorama.open()
local MyPersonaAPI, LobbyAPI, PartyListAPI, SteamOverlayAPI =
    js.MyPersonaAPI,
    js.LobbyAPI,
    js.PartyListAPI,
    js.SteamOverlayAPI 

local lua_menu = {
    main = {
        enable = lua_group:label("\vach3ron \aFFFFFF1F/ \rowner: \aFFFFFF1F@\vanonstate"),
        main_color = lua_group:color_picker(" ", 255, 255, 255),
        labl = lua_group:label("\n"),
        tab = lua_group:combobox("\n", {"Home", "Anti-Aim", "Utility"})
    },
    home = {
        separator = defensive_group:label(" \aFFFFFF1F────────────────────────────────"),
        username = defensive_group:label("  \v• \rWelcome, \v" .. steamname .. "\v ✨ \r!"),
        build = defensive_group:label("\v  \rYour \vbuild\r is \v" .. debug.build),
        version = defensive_group:label("\v  \vScript version\r is \v" .. debug.build_ver),
        last_update = defensive_group:label("\v  \vLast update\r was \v" .. debug.last_upd),
        separator2 = defensive_group:label(" \aFFFFFF1F────────────────────────────────"),
        providers = defensive_group:label("\v \rProvided to you by \vglaive \aFFFFFF1F& \vtsukuyomi"),
        -- other_group
        discord_button = other_group:button("\v \rdiscord\aFFFFFF1F.\rgg\aFFFFFF1F/\vk2UGtHbA89"),
        separator3 = other_group:label(" \aFFFFFF1F────────────────────────────────"),
        youtube_glaive = other_group:button("\v \ryoutube\aFFFFFF1F.\rcom\aFFFFFF1F/\v@glaivee"),
        youtube_tsukuyomi = other_group:button("\v \ryoutube\aFFFFFF1F.\rcom\aFFFFFF1F/\v@tsukuyomi"),
    },
    antiaim = {
        separator = defensive_group:label(" \aFFFFFF1F────────────────────────────────"),
        tab = defensive_group:combobox("\v Anti\aFFFFFF1F-\vAim\r Modules", {"Builder", "Features"}),
        separator1 = defensive_group:label(" \aFFFFFF1F────────────────────────────────"),
        separator2 = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        yaw_base = lua_group:combobox("\n", {"At targets", "Local view"}),
        addons = lua_group:multiselect("\v \rFeatures", {"\v \rSpin on \vwarmup", "\v \rAvoid backstab", "\v \rSafe head"}),
        safe_head = lua_group:multiselect("\v Safe head \rconditions", {"\vKnife", "Zeus", "Dormant"}),
        separator5 = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        yaw_direction = lua_group:multiselect("\v \rHotkeys", {"\v \rFreestanding", "\v \rManual yaw"}),
        key_freestand = lua_group:hotkey("\v  \rFreestanding"),
        separator6 = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        key_left = lua_group:hotkey("\v \aFFFFFF1F• \rManual \aFFFFFF1F[LEFT]"),
        key_right = lua_group:hotkey("\v \aFFFFFF1F• \rManual \aFFFFFF1F[RIGHT]"),
        key_forward = lua_group:hotkey("\v \aFFFFFF1F• \rManual \aFFFFFF1F[FORWARD]"),
        separator7 = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        freestand_type = lua_group:combobox("\v \vFreestanding \rmode", {"Default", "Static", "Jitter"}),
        manual_type = lua_group:combobox("\v \rManual yaw \rmode", {"Default", "Static", "Jitter"}),
        condition = lua_group:combobox("\v  \aFFFFFF1F— \rConditions", antiaim_cond),
    },
    misc = {
        cross_ind = lua_group:checkbox("\v \aFFFFFF1F• \rXhair indicators"),
        cross_ind_color = lua_group:color_picker(" ", 255, 255, 255),
        cross_ind_type = lua_group:combobox("   \v~ Indicator \rstyle \aFFFFFF1F", {"Branded", "Ideal yaw"}),
        arrows = lua_group:checkbox("\v \aFFFFFF1F• \rManual arrows"),
        arrows_color = lua_group:color_picker(" ", 255, 255, 255),
        spammers = lua_group:combobox("\v \aFFFFFF1F• \r1000$ Shittalk", {"None", "Acheron" , "1"}),
        edge = lua_group:checkbox("\v \aFFFFFF1F• \rEdge yaw \aFFFFFF1F[ON FAKEDUCK]"),
        quick_switch = lua_group:checkbox("\v \aFFFFFF1F• \rQuick switch \aFFFFFF1F[FIXED]"),
        fast_ladder = lua_group:checkbox("\v \aFFFFFF1F• \rFast ladder"),
        log1 = lua_group:checkbox("\v \aFFFFFF1F• \rAimbot logging"),
        multibox4 = lua_group:multiselect("\n", {"In Console", "On Screen", "Statistic"}),
        screen_type = lua_group:combobox("  \v\r~ log style", {"default"}),
        log = lua_group:color_picker(" ", 255, 255, 255),
        watermark = lua_group:checkbox("\v \aFFFFFF1F• \rCustom watermark"),
        watermark_color = lua_group:color_picker(" ", 255, 255, 255),
        watermark_type = lua_group:combobox("\n", {"Left", "Right", "Bottom"}),

        animation = other_group:checkbox("\v \aFFFFFF1F• \rAnim. Breakers"),
        animation_ground = other_group:combobox("    \v~ \rOn ground \aFFFFFF1F", {"Static", "Jitter", "Kangaroo"}),
        animation_value = other_group:slider("    \v~ On ground \rvalue \aFFFFFF1F", 0, 10, 5),
        animation_air = other_group:combobox("    \v~ \rIn air \aFFFFFF1F", {"Off", "Static", "Kangaroo"}),

        resolver_enabled = defensive_group:checkbox("\v \aFFFFFF1F• \vAcheron\rTools"),
        esp_flags = defensive_group:checkbox("\v~ \rESP flags \aFFFFFF1F"),
        esp_flags_color = defensive_group:color_picker(" ", 255, 255, 255, 255),
        multibox = defensive_group:multiselect("\v~ \rForce BAIM \aFFFFFF1F", {"HP lower than X"}),
        health = defensive_group:slider("    \v~" .. " \vHP", 0, 100, 50, true),
        multibox2 = defensive_group:multiselect("Force safe point", {"HP lower than X", "after X misses"}),
        health2 = defensive_group:slider("    \v~" .. " \vHP", 0, 100, 50, true),
        missed = defensive_group:slider("    \v~" .. " \vMissed shots", 0, 10, 0, true),
        invis = defensive_group:label("\n"),
    }
}
local antiaim_builder2 = {}

for i = 1, #antiaim_cond do
    antiaim_builder2[i] = {
        enable2 = lua_group:checkbox("Enable \aFFFFFF1F~ \v" .. antiaim_cond[i]),
        separator = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        -- main_group (jitters & defensive)
        mod_type2 = lua_group:combobox(short_cond[i] .. "\aFFFFFF1F \rMod", {"Off", "Offset", "Center", "Random", "Skitter"}),
        mod_dm2 = lua_group:slider("    \v~ \rMod Amount \aFFFFFF1F", -180, 180, 0, true, "°", 1), -- im jewish
        yaw_random2 = lua_group:slider("    \v~ \rRandomization \aFFFFFF1F", 0, 100, 0, true, "%", 1),
        separator1 = lua_group:label(" \aFFFFFF1F────────────────────────────────"),
        enable = lua_group:checkbox(short_cond[i] .. "\aFFC926FF⚠️ Defensive"),
            pitch_type = lua_group:combobox("\aFFFFFF1F   \rPitch", {"Off", "Static", "Jitter", "Random"}),
                pitch_slider1 = lua_group:slider("    \v~ Pitch \rangle \aFFFFFF1F", -89, 89, 0, true, "°", 1),
                pitch_slider = lua_group:slider("    \v~ Pitch \rangle \vfirst \aFFFFFF1F", -89, 89, 0, true, "°", 1),
                pitch_slider2 = lua_group:slider("    \v~ Pitch \rangle \vsecond \aFFFFFF1F", -89, 89, 0, true, "°", 1),
            defense_aa_type = lua_group:combobox("\aFFFFFF1F   \rYaw", {"Off", "Static", "Jitter", "Spin", "Random"}),
                defense_aa_slider = lua_group:slider("    \v~ Yaw \ramount \aFFFFFF1F", -180, 180, 0, true, "°", 1),
                defensive_speed = lua_group:slider("    \v~ Spinning \rspeed \aFFFFFF1F", -5, 5, 0, true, " ", 1),
        -- defensive_group (yaw)
        yaw_offset = defensive_group:checkbox(short_cond[i] .. "\aFFFFFF1F   \rYaw Offset \aFFFFFF1F[STATIC]"), -- static yaw
            yaw_offset_slider  = defensive_group:slider("     \v~ \rOffset \v°", -180, 180, 0, true, "°", 1),
        yaw_lr = defensive_group:checkbox(short_cond[i] .. "\aFFFFFF1F   \rYaw Offsets \aFFFFFF1F[L/R]"),
            yaw_left2 = defensive_group:slider("    \v~ \rYaw \vLeft \aFFFFFF1F", -180, 180, 0, true, "°", 1),
            yaw_right2 = defensive_group:slider("    \v~ \rYaw \vRight \aFFFFFF1F", -180, 180, 0, true, "°", 1),
        -- other_group (snap) im jewish nigger
        body_yaw_type2 = other_group:combobox(short_cond[i] .. "\aFFFFFF1F   \rBody Yaw", {"Off", "Opposite", "Jitter", "Static"}),
        body_slider2 = other_group:slider("   \v~ Body yaw \ramount \aFFFFFF1F", -180, 180, 0, true, "°", 1),
        force_lc = other_group:checkbox(short_cond[i] .. "\aFFFFFF1F   \rForce LC"),
        separator3 = other_group:label(" \aFFFFFF1F────────────────────────────────"),
        delay = other_group:checkbox(short_cond[i] .. "\aFFFFFF1F   \rDelay"),
        yaw_delay2 = other_group:slider("   \v~ Delay \rticks \aFFFFFF1F", 0, 10, 0, true, "t", 1),
        yaw_delay_random2 = other_group:slider("   \v~ Delay \rrandomize ticks \aFFFFFF1F",  0, 10, 0, true, "t", 1),
        adaptive_desync = lua_group:checkbox("\v  \vFag\rSlayer")
    }
end

local home_tab = {lua_menu.main.tab, "Home"}
local aa_tab = {lua_menu.main.tab, "Anti-Aim"}
    local aa_builder = {lua_menu.antiaim.tab, "Builder"}
    local aa_main = {lua_menu.antiaim.tab, "Features"}
local utility_tab = {lua_menu.main.tab, "Utility"}

lua_menu.home.separator:depend(home_tab)
lua_menu.home.username:depend(home_tab)
lua_menu.home.build:depend(home_tab)
lua_menu.home.version:depend(home_tab)
lua_menu.home.last_update:depend(home_tab)
lua_menu.home.separator2:depend(home_tab)
lua_menu.home.providers:depend(home_tab)
-- other_group
lua_menu.home.discord_button:depend(home_tab)
lua_menu.home.separator3:depend(home_tab)
lua_menu.home.youtube_glaive:depend(home_tab)
lua_menu.home.youtube_tsukuyomi:depend(home_tab)

lua_menu.antiaim.tab:depend(aa_tab)
lua_menu.antiaim.separator1:depend(aa_tab)
-- aa_main
lua_menu.antiaim.separator:depend(aa_tab, aa_main)
lua_menu.antiaim.separator2:depend(aa_tab, aa_main)
lua_menu.antiaim.yaw_base:depend(aa_tab, aa_main)
lua_menu.antiaim.addons:depend(aa_tab, aa_main)
lua_menu.antiaim.safe_head:depend(aa_tab, {lua_menu.antiaim.addons, "\v \rSafe head"}, aa_main)
lua_menu.antiaim.separator5:depend(aa_tab, aa_main)
lua_menu.antiaim.yaw_direction:depend(aa_tab, aa_main)
lua_menu.antiaim.key_freestand:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rFreestanding"}, aa_main)
lua_menu.antiaim.separator6:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rFreestanding"}, aa_main)
lua_menu.antiaim.key_left:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rManual yaw"}, aa_main)
lua_menu.antiaim.key_right:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rManual yaw"}, aa_main)
lua_menu.antiaim.key_forward:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rManual yaw"}, aa_main)
lua_menu.antiaim.separator6:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rManual yaw"}, aa_main)
lua_menu.antiaim.freestand_type:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rFreestanding"}, aa_main)
lua_menu.antiaim.manual_type:depend(aa_tab, {lua_menu.antiaim.yaw_direction, "\v \rManual yaw"}, aa_main)
-- aa_builder
lua_menu.antiaim.condition:depend(aa_tab, aa_builder)

lua_menu.misc.cross_ind:depend(utility_tab)
lua_menu.misc.cross_ind_color:depend(utility_tab, {lua_menu.misc.cross_ind, true})
lua_menu.misc.cross_ind_type:depend(utility_tab, {lua_menu.misc.cross_ind, true})
lua_menu.misc.watermark:depend(utility_tab)
lua_menu.misc.watermark_color:depend(utility_tab, {lua_menu.misc.watermark, true}, {lua_menu.misc.cross_ind, false})

lua_menu.misc.multibox4:depend(utility_tab, {lua_menu.misc.log1, true})
lua_menu.misc.log1:depend(utility_tab)
lua_menu.misc.screen_type:depend(utility_tab, {lua_menu.misc.log1, true}, {lua_menu.misc.log1, "\v \aFFFFFF1F• \rAimbot logging"})
lua_menu.misc.log:depend(utility_tab, {lua_menu.misc.log1, true})
lua_menu.misc.fast_ladder:depend(utility_tab)
lua_menu.misc.animation:depend(utility_tab)
lua_menu.misc.invis:depend(utility_tab)
lua_menu.misc.animation_ground:depend(utility_tab, {lua_menu.misc.animation, true})
lua_menu.misc.animation_value:depend(utility_tab, {lua_menu.misc.animation, true})
lua_menu.misc.animation_air:depend(utility_tab, {lua_menu.misc.animation, true})
lua_menu.misc.resolver_enabled:depend(utility_tab)
lua_menu.misc.health:depend(utility_tab, {lua_menu.misc.resolver_enabled, true}, {lua_menu.misc.multibox, "HP lower than X"})
lua_menu.misc.health2:depend(utility_tab, {lua_menu.misc.resolver_enabled, true},{lua_menu.misc.multibox2, "HP lower than X"})
lua_menu.misc.missed:depend(utility_tab, {lua_menu.misc.resolver_enabled, true}, {lua_menu.misc.multibox2, "after X misses"})
lua_menu.misc.multibox:depend(utility_tab, {lua_menu.misc.resolver_enabled, true})
lua_menu.misc.multibox2:depend(utility_tab, {lua_menu.misc.resolver_enabled, true})
lua_menu.misc.spammers:depend(utility_tab)
lua_menu.misc.arrows:depend(utility_tab)
lua_menu.misc.arrows_color:depend(utility_tab, {lua_menu.misc.arrows, true})
lua_menu.misc.watermark_type:depend(utility_tab, {lua_menu.misc.watermark, true})
lua_menu.misc.quick_switch:depend(utility_tab)
lua_menu.misc.esp_flags:depend(utility_tab, {lua_menu.misc.resolver_enabled, true})
lua_menu.misc.esp_flags_color:depend(utility_tab, {lua_menu.misc.esp_flags, true}, {lua_menu.misc.resolver_enabled, true})
lua_menu.misc.edge:depend(utility_tab)

for i = 1, #antiaim_cond do
    local cond_check = {lua_menu.antiaim.condition, function() return (i ~= 1) end}
    local tab_cond = {lua_menu.antiaim.condition, antiaim_cond[i]}
    local cnd_en = {antiaim_builder2[i].enable2, function()if (i == 1) then return true else return antiaim_builder2[i].enable2:get() end end}
    local aa_tab = {lua_menu.main.tab, "Anti-Aim"}
    local yaw_ch =  {antiaim_builder2[i].yaw_offset, true}
    local yaw_ch2 =  {antiaim_builder2[i].yaw_offset, false}
    local yaw_ch_lr = {antiaim_builder2[i].yaw_lr, true}
    local yaw_ch_lr2 = {antiaim_builder2[i].yaw_lr, false}
    local delay_ch = {antiaim_builder2[i].delay, true}
    local jit_ch = {antiaim_builder2[i].mod_type2, function() return antiaim_builder2[i].mod_type2:get() ~= "Off" end}
    local body_ch = {antiaim_builder2[i].body_yaw_type2, function() return antiaim_builder2[i].body_yaw_type2:get() ~= "Off" end}
    local defensive_aa = {antiaim_builder2[i].enable, function() return antiaim_builder2[i].enable:get() end}
    local pitch_ch2 = {antiaim_builder2[i].pitch_type, function() return antiaim_builder2[i].pitch_type:get() == "Static" end}
    local defensive_aa_ch = {antiaim_builder2[i].defense_aa_type, function() return antiaim_builder2[i].defense_aa_type:get() ~= "Off" end}
    local pitch_jitter = {antiaim_builder2[i].pitch_type, function() return antiaim_builder2[i].pitch_type:get() == "Jitter" or antiaim_builder2[i].pitch_type:get() == "Random" end}
    local defensive_jitter_ch = {antiaim_builder2[i].defense_aa_type, function() return antiaim_builder2[i].defense_aa_type:get() == "Random" or antiaim_builder2[i].defense_aa_type:get() == "Jitter" end}
    local defensive_speed_ch = {antiaim_builder2[i].defense_aa_type, function() return antiaim_builder2[i].defense_aa_type:get() == "Spin" end}
    antiaim_builder2[i].enable2:depend(cond_check, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].yaw_random2:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].mod_type2:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].separator:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].separator1:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].separator3:depend(cnd_en, tab_cond, aa_tab, aa_builder)

    antiaim_builder2[i].yaw_offset:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].yaw_offset_slider:depend(cnd_en, tab_cond, yaw_ch, aa_tab, aa_builder)
    antiaim_builder2[i].yaw_lr:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].yaw_left2:depend(cnd_en, tab_cond, aa_tab, yaw_ch_lr, aa_builder)
    antiaim_builder2[i].yaw_right2:depend(cnd_en, tab_cond, aa_tab, yaw_ch_lr, aa_builder)
    antiaim_builder2[i].mod_dm2:depend(cnd_en, tab_cond, aa_tab, jit_ch, aa_builder)
    antiaim_builder2[i].body_yaw_type2:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].body_slider2:depend(cnd_en, tab_cond, aa_tab, body_ch, aa_builder)
    antiaim_builder2[i].yaw_delay2:depend(cnd_en, tab_cond, aa_tab, delay_ch, aa_builder)
    antiaim_builder2[i].yaw_delay_random2:depend(cnd_en, tab_cond, aa_tab, delay_ch, aa_builder)
    antiaim_builder2[i].delay:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].pitch_type:depend(cnd_en, tab_cond, aa_tab, defensive_aa, aa_builder)
    antiaim_builder2[i].pitch_slider2:depend(cnd_en, tab_cond, aa_tab, defensive_aa, pitch_jitter, aa_builder)
    antiaim_builder2[i].pitch_slider:depend(cnd_en, tab_cond, aa_tab, defensive_aa, pitch_jitter, aa_builder)
    antiaim_builder2[i].pitch_slider1:depend(cnd_en, tab_cond, aa_tab, defensive_aa, pitch_ch2, aa_builder)
    antiaim_builder2[i].defense_aa_type:depend(cnd_en, tab_cond, aa_tab, defensive_aa, aa_builder)
    antiaim_builder2[i].defense_aa_slider:depend(cnd_en, tab_cond, aa_tab, defensive_aa, defensive_aa_ch, defensive_jitter_ch, aa_builder)
    antiaim_builder2[i].force_lc:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].enable:depend(cnd_en, tab_cond, aa_tab, aa_builder)
    antiaim_builder2[i].adaptive_desync:depend(cnd_en, tab_cond, aa_tab, defensive_aa, defensive_aa_ch, aa_builder)
    antiaim_builder2[i].defensive_speed:depend(cnd_en, tab_cond, aa_tab, defensive_aa, defensive_speed_ch, aa_builder)

    
    antiaim_builder2[i].yaw_left2:depend(cnd_en, tab_cond, aa_tab, yaw_ch2, aa_builder)
    antiaim_builder2[i].yaw_right2:depend(cnd_en, tab_cond, aa_tab, yaw_ch2, aa_builder) 
    antiaim_builder2[i].yaw_lr:depend(cnd_en, tab_cond, aa_tab, yaw_ch2, aa_builder)
    antiaim_builder2[i].yaw_offset:depend(cnd_en, tab_cond, aa_tab, yaw_ch_lr2, aa_builder)
    antiaim_builder2[i].yaw_offset_slider:depend(cnd_en, tab_cond, yaw_ch_lr2, aa_tab, aa_builder) 
end

local function visible_menu(state)
    if lua_menu.main.tab:get() == "Anti-Aim" and lua_menu.antiaim.tab:get() == "Features" then
        ui.set_visible(ref.fakelag_amount, true)
        ui.set_visible(ref.fakelag_enable, true)
        ui.set_visible(ref.fakelag_limit, true)
        ui.set_visible(ref.fakelag_variance, true)
        ui.set_visible(ref.other_fkpeek, true)
        ui.set_visible(ref.other_legmovement, true)
        ui.set_visible(ref.other_slowmotion, true)
        ui.set_visible(ref.other_osaa, true)
    else
        ui.set_visible(ref.fakelag_amount, false)
        ui.set_visible(ref.fakelag_enable, false)
        ui.set_visible(ref.fakelag_limit, false)
        ui.set_visible(ref.other_fkpeek, false)
        ui.set_visible(ref.other_legmovement, false)
        ui.set_visible(ref.other_slowmotion, false)
        ui.set_visible(ref.other_osaa, false)
        ui.set_visible(ref.fakelag_variance, false)
    end
    
end

local function hide_original_menu(state)
    ui.set_visible(ref.enabled, state)
    ui.set_visible(ref.fakelag_amount, false)
    ui.set_visible(ref.fakelag_enable, false)
    ui.set_visible(ref.fakelag_limit, false)
    ui.set_visible(ref.other_fkpeek, false)
    ui.set_visible(ref.other_legmovement, false)
    ui.set_visible(ref.other_slowmotion, false)
    ui.set_visible(ref.other_osaa, false)
    ui.set_visible(ref.fakelag_variance, false)
    ui.set_visible(ref.pitch[1], state)
    ui.set_visible(ref.pitch[2], state)
    ui.set_visible(ref.yawbase, state)
    ui.set_visible(ref.yaw[1], state)
    ui.set_visible(ref.yaw[2], state)
    ui.set_visible(ref.yawjitter[1], state)
    ui.set_visible(ref.roll[1], state)
    ui.set_visible(ref.yawjitter[2], state)
    ui.set_visible(ref.bodyyaw[1], state)
    ui.set_visible(ref.bodyyaw[2], state)
    ui.set_visible(ref.fsbodyyaw, state)
    ui.set_visible(ref.edgeyaw, state)
    ui.set_visible(ref.freestand[1], state)
    ui.set_visible(ref.freestand[2], state)
end

local function randomize_value(original_value, percent)
    local min_range = original_value - (original_value * percent * 0.01)
    local max_range = original_value + (original_value * percent * 0.01)
    return math.random(min_range, max_range)
end


    local notifications = {}
    local notification_duration = 3.0
    
    local function show_notification(text)
        table.insert(notifications, {
            text = text,
            start_time = globals.realtime(),
            duration = notification_duration
        })
    end
    
    client.set_event_callback("paint", function()
        local current_time = globals.realtime()
        local screen_w, screen_h = client.screen_size()
        
        for i = #notifications, 1, -1 do
            if current_time - notifications[i].start_time > notifications[i].duration then
                table.remove(notifications, i)
            end
        end
        
        for i, notification in ipairs(notifications) do
            local progress = (current_time - notification.start_time) / notification.duration
            if progress < 1 then
                local alpha = 255
                local fade_time = 0.5
                if current_time - notification.start_time > notification.duration - fade_time then
                    alpha = math.floor(255 * (1 - (current_time - notification.start_time - (notification.duration - fade_time)) / fade_time))
                end
                
                local x_pos = screen_w/2
                local y_pos = screen_h - 100 - (i-1) * 40
                
                renderer.text(x_pos, y_pos, 255, 255, 255, alpha, "c", 0, "~ " .. notification.text)
            end
        end
    end)
    local function esex(filter_sections)
        local values = {}
        local should_collect = function(section_name)
            if not filter_sections or #filter_sections == 0 then
                return true
            end
            for _, filter in ipairs(filter_sections) do
                if filter == "Anti-Aim" and (section_name == "antiaim" or section_name:match("^builder%d+$")) then
                    return true
                end
                if filter == "Utilities" and section_name == "misc" then
                    return true
                end
            end
            return false
        end
        
        if should_collect("main") then
            for name, element in pairs(lua_menu.main) do
                if element.get and type(element.get) == "function" then
                    local success, result = pcall(element.get, element)
                    if success then
                        values["main." .. name] = result
                    end
                end
            end
        end
        
        if should_collect("home") then
            for name, element in pairs(lua_menu.home) do
                if element.get and type(element.get) == "function" then
                    local success, result = pcall(element.get, element)
                    if success then
                        values["home." .. name] = result
                    end
                end
            end
        end
        
        if should_collect("antiaim") then
            for name, element in pairs(lua_menu.antiaim) do
                if element.get and type(element.get) == "function" then
                    local success, result = pcall(element.get, element)
                    if success then
                        values["antiaim." .. name] = result
                    end
                end
            end
        end
        
        if should_collect("misc") then
            for name, element in pairs(lua_menu.misc) do
                if element.get and type(element.get) == "function" then
                    local success, result = pcall(element.get, element)
                    if success then
                        values["misc." .. name] = result
                    end
                end
            end
        end
        
        for i, builder in ipairs(antiaim_builder2) do
            if should_collect("builder" .. i) then
                for name, element in pairs(builder) do
                    if element.get and type(element.get) == "function" then
                        local success, result = pcall(element.get, element)
                        if success then
                            values["builder" .. i .. "." .. name] = result
                        end
                    end
                end
            end
        end
        
        return values
    end
    
    local function cum(values)
        if not values then return false end
        
        local success_count = 0
        
        for key, value in pairs(values) do
            local section, element_name = key:match("^(.+)%.(.+)$")
            if section and element_name then
                local target_section = nil
                
                if section == "main" then target_section = lua_menu.main
                elseif section == "home" then target_section = lua_menu.home
                elseif section == "antiaim" then target_section = lua_menu.antiaim
                elseif section == "misc" then target_section = lua_menu.misc
                elseif section:match("^builder%d+$") then
                    local builder_index = tonumber(section:match("builder(%d+)$"))
                    if builder_index and antiaim_builder2[builder_index] then
                        target_section = antiaim_builder2[builder_index]
                    end
                end
                
                if target_section and target_section[element_name] and target_section[element_name].set then
                    local success, result = pcall(target_section[element_name].set, target_section[element_name], value)
                    if success then
                        success_count = success_count + 1
                    end
                end
            end
        end
        
        return success_count > 0
    end

    local configs = {}
    do
        local DATABASE_KEY = 'acheron'
        local DATABASE = database.read(DATABASE_KEY) or {}
        local CONFIG_SIGNATURE = 'acheron'

        local function encode(data)
            local packed_data = msgpack.pack(data)
            local encoded_data = base64.encode(packed_data)
            return table.concat({ CONFIG_SIGNATURE, encoded_data, CONFIG_SIGNATURE }, '::')
        end

        local function decode(config)
            local encoded = config:match(CONFIG_SIGNATURE .. '::(.+)::' .. CONFIG_SIGNATURE)
            if not encoded then
                return nil
            end

            local decoded_data = base64.decode(encoded)
            return msgpack.unpack(decoded_data)
        end

        function configs:export(name, filter_sections)
            local saved_data = esex(filter_sections)
            if not saved_data or next(saved_data) == nil then
                return nil
            end
            local configuration = {
                name = name or 'Untitled',
                code = saved_data
            }

            return encode(configuration)
        end

        function configs:import(config, filter_sections)
            local data = decode(config)
            if not data then
                return nil
            end
            
            if not data.code or next(data.code) == nil then
                return nil
            end

            local filtered_values = {}
            local should_load = function(section_name)
                if not filter_sections or #filter_sections == 0 then
                    return true
                end
                for _, filter in ipairs(filter_sections) do
                    if filter == "Anti-Aim" and (section_name == "antiaim" or section_name:match("^builder%d+$")) then
                        return true
                    end
                    if filter == "Utilities" and section_name == "misc" then
                        return true
                    end
                end
                return false
            end
            
            for key, value in pairs(data.code) do
                local section = key:match("^(.+)%.")
                if section and should_load(section) then
                    filtered_values[key] = value
                end
            end
            
            local result = cum(filtered_values)
            return data
        end

        function configs:get_configs()
            local list = {}
            for i, data in ipairs(DATABASE) do
                list[i] = data.name
            end
            return list
        end

        function configs:get(id)
            return DATABASE[id]
        end

        function configs:delete(id)
            table.remove(DATABASE, id)
            database.write(DATABASE_KEY, DATABASE)
            database.flush()
        end

        function configs:create(name, code)
            table.insert(DATABASE, { name = name, code = code })
            database.write(DATABASE_KEY, DATABASE)
            database.flush()
        end

        function configs:save(id, code)
            if DATABASE[id] then
                DATABASE[id].code = code
                database.write(DATABASE_KEY, DATABASE)
                database.flush()
            end
        end

        function configs:create_from_encoded_data(config)
            local data = decode(config)
            if not data then
                error('Invalid config data.')
                return
            end

            local original_name = data.name
            local candidate_name = original_name
            local counter = 0

            local existing_configs = configs:get_configs()

            local function name_exists(name)
                for _, existing_name in ipairs(existing_configs) do
                    if existing_name == name then
                        return true
                    end
                end
                return false
            end

            while name_exists(candidate_name) do
                counter = counter + 1
                candidate_name = original_name .. '(' .. counter .. ')'
            end

            data.name = candidate_name
            self:create(data.name, config)
        end

        defer(function()
            database.write(DATABASE_KEY, DATABASE)
            database.flush()
        end)
    end

    local function config_system()
        local config_information = { list = {}, id = 1 }
        local config_list = lua_group:listbox('Configs',
            #configs:get_configs() > 0 and configs:get_configs() or { 'No configs' }):depend({ lua_menu.main.tab, 'Home' })
        local selected = lua_group:label('Selected: \vNothing'):depend({ lua_menu.main.tab, 'Home' })
        local config_name = lua_group:textbox('Name config'):depend({ lua_menu.main.tab, 'Home' })
        local get_loading_objects = lua_group:multiselect('Loading objects:', {"Anti-Aim", "Utilities"})
            :depend({ lua_menu.main.tab, 'Home' })

        client.set_event_callback('paint_ui', function()
            if not ui.is_menu_open() then
                return
            end

            local list = configs:get_configs()
            if #list ~= #config_information.list then
                config_information.list = list

                if #list == 0 then
                    config_list:update({ 'No configs' })
                    config_list.value = 1
                    config_information.id = 1
                    return
                else
                    config_list:update(list)
                    return
                end
            end

            if config_list.value == nil then
                config_list.value = 1
            end

            local id = (config_list.value or 1) + 1
            if id ~= config_information.id then
                config_information.id = id
                return
            end
        end)

        local function validate_config_name()
            local name = config_name:get():gsub(' ', '')
            if name == '' then
                return true, 'Untitled'
            end

            return true, name
        end

        local function validate_config_exists(id)
            if #configs:get_configs() <= 0 then
                print('No configs available')
                return false, nil
            end

            local config = configs:get(id)
            if not config then
                print('Config not found.')
                return false, nil
            end

            return true, config
        end

        local function load_aa_config()
            local valid, config = validate_config_exists(config_information.id)
            if not valid or not config then
                return
            end

            local loading_objects = get_loading_objects:get()
            if not loading_objects or #loading_objects == 0 then
                loading_objects = nil
            end
            
            configs:import(config.code, loading_objects)
        end

        local function save_config()
            local valid, name = validate_config_name()
            if not valid then
                return
            end

            local loading_objects = get_loading_objects:get()
            if not loading_objects or #loading_objects == 0 then
                loading_objects = nil
            end
            local code = configs:export(name, loading_objects)
            if not code then
                return
            end
            
            local current_config = configs:get(config_information.id)

            if not current_config or name ~= current_config.name then
                configs:create(name, code)
            else
                configs:save(config_information.id, code)
            end
        end

        local function remove_config()
            local valid, config = validate_config_exists(config_information.id)
            if not valid or not config then
                return
            end

            configs:delete(config_information.id)
        end

        local function export_config()
            local valid, name = validate_config_name()
            if not valid then
                return
            end

            clipboard.set(configs:export(name))
        end

        local function import_config()
            local code = clipboard.get()
            if not code then
                return
            end

            local ok = pcall(configs.create_from_encoded_data, configs, code)
        end

        local load   = lua_group:button('Load', load_aa_config):depend({ lua_menu.main.tab, 'Home' })
        local save   = lua_group:button('Save', save_config):depend({ lua_menu.main.tab, 'Home' })
        local delete = lua_group:button('Delete', remove_config):depend({ lua_menu.main.tab, 'Home' })
        local export = lua_group:button('Export', export_config):depend({ lua_menu.main.tab, 'Home' })
        local import = lua_group:button('Import', import_config):depend({ lua_menu.main.tab, 'Home' })

        config_list:set_callback(function(item)
            local config = configs:get(item:get() + 1) or configs:get(config_information.id)
            if config == nil then
                selected:set('Selected: \vNothing')
                config_name:set('')
                load:set_enabled(false)
                delete:set_enabled(false)
                export:set_enabled(false)
                get_loading_objects:set_enabled(false)
                return
            end

            config_name:set(config.name)
            selected:set('Selected: \v' .. config.name)
            load:set_enabled(true)
            delete:set_enabled(true)
            export:set_enabled(true)
            get_loading_objects:set_enabled(true)
        end)
    end

    home = pui.setup(lua_menu)
    config_system()
    
    
local id = 1
local function player_state(cmd)
    local lp = entity.get_local_player()
    if lp == nil then
        return
    end

    local vecvelocity = {entity.get_prop(lp, "m_vecVelocity")}
    local flags = entity.get_prop(lp, "m_fFlags")
    local velocity = math.sqrt(vecvelocity[1] ^ 2 + vecvelocity[2] ^ 2)
    local groundcheck = bit.band(flags, 1) == 1
    local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
    local ducked = entity.get_prop(lp, "m_flDuckAmount") > 0.7
    local duckcheck = ducked or ui.get(ref.fakeduck)
    local slowwalk_key = ui.get(ref.slow[1]) and ui.get(ref.slow[2])

    if jumpcheck and duckcheck then
        return "Air+C"
    elseif jumpcheck then
        return "Air"
    elseif duckcheck and velocity > 10 then
        return "Duck-Moving"
    elseif duckcheck and velocity < 10 then
        return "Duck"
    elseif groundcheck and slowwalk_key and velocity > 10 then
        return "Walking"
    elseif groundcheck and velocity > 5 then
        return "Moving"
    elseif groundcheck and velocity < 5 then
        return "Standing"
    else
        return "Global"
    end

end
local yaw_direction = 0 
local last_press_t_dir = 0
local edge_direction = function ()
    if ui.get(ref.fakeduck) and lua_menu.misc.edge:get() then
        ui.set(ref.edgeyaw, true)
    else
        ui.set(ref.edgeyaw, false)
    end
end
local run_direction = function()
    if entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 0 then
        ui.set(ref.freestand[1], lua_menu.antiaim.yaw_direction:get("\v \rFreestanding"))
        ui.set(ref.freestand[2], lua_menu.antiaim.key_freestand:get() and 'Always on' or 'On hotkey')
    end

    if yaw_direction ~= 0 then
        ui.set(ref.freestand[1], false)
    end

    if lua_menu.antiaim.yaw_direction:get("\v \rManual yaw") and lua_menu.antiaim.key_right:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == 90 and 0 or 90
        last_press_t_dir = globals.curtime()
    elseif lua_menu.antiaim.yaw_direction:get("\v \rManual yaw") and lua_menu.antiaim.key_left:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == -90 and 0 or -90 
        last_press_t_dir = globals.curtime()
    elseif lua_menu.antiaim.yaw_direction:get("\v \rManual yaw") and lua_menu.antiaim.key_forward:get() and last_press_t_dir + 0.2 < globals.curtime() then
        yaw_direction = yaw_direction == 180 and 0 or 180
        last_press_t_dir = globals.curtime()
    elseif last_press_t_dir > globals.curtime() then
        last_press_t_dir = globals.curtime()
    end
    if not lua_menu.antiaim.yaw_direction:get("\v \rManual yaw") then
        yaw_direction = 0 
        last_press_t_dir = 0
    end
end

local arrow_alpha = 0
local fade_in_speed = 600
local fade_out_speed = 1000

local function updatearrows()
    if yaw_direction == -90 or yaw_direction == 90 then
        arrow_alpha = math.min(255, arrow_alpha + (globals.frametime() * (fade_in_speed)))  
    else
        arrow_alpha = math.max(50, arrow_alpha - (globals.frametime() * (fade_out_speed )))
    end
end

local Calibrib = surface.create_font("Calibrib.ttf", 26, 600, { 0x10 --[[ Outline ]] })
 
local scoped_space = 0
local screen_width, screen_height = client.screen_size()
local function arrows()
    local arrows1, arrows2, arrows3, arrows4 = lua_menu.misc.arrows_color:get()
    local arrows_alpha = math.max(math.min(arrow_alpha, 255), 0)
    local scoped = entity.get_prop(entity.get_local_player(), "m_bIsScoped") == 1
    scoped_space = math.lerp(scoped_space, scoped and 15 or 0, 5)
    surface.draw_text((screen_width / 2) - 55, ((screen_height/2) - 12) - scoped_space, 125, 125, 125, 125, Calibrib, "<")
    surface.draw_text((screen_width / 2) + 43, ((screen_height/2) - 12) - scoped_space, 125, 125, 125, 125, Calibrib, ">")
    if yaw_direction == -90 then
        surface.draw_text((screen_width / 2) - 55, ((screen_height/2) - 12) - scoped_space, arrows1, arrows2, arrows3, arrow_alpha, Calibrib, "<")
    end
    if yaw_direction == 90 then
        surface.draw_text((screen_width / 2) + 43, ((screen_height/2) - 12) - scoped_space, arrows1, arrows2, arrows3, arrow_alpha, Calibrib, ">")
    end
end

client.set_event_callback('grenade_thrown', function(e)
    if not is_lua_loaded then return end

    if lua_menu.misc.quick_switch:get() then
        local lp = entity.get_local_player();
        local userid = client.userid_to_entindex(e.userid);
    
        if userid ~= lp then
        return
        end
    
        client.exec('slot3; slot2; slot1');
    end
end);

client.set_event_callback('weapon_fire', function(e)
    if not is_lua_loaded then return end
    if lua_menu.misc.quick_switch:get() then
        if e.weapon ~= 'weapon_taser' then
        return
        end

        local lp = entity.get_local_player();
        local userid = client.userid_to_entindex(e.userid);

        if userid ~= lp then
        return
        end
    
        client.exec('slot3; slot2; slot1');
    end
end);

anti_knife_dist = function(x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)
end

local function safe_func()
    ui.set(ref.yawjitter[1], "Off")
    ui.set(ref.yaw[1], "180")
    ui.set(ref.yawjitter[2], 0)
    ui.set(ref.bodyyaw[1], "Static")
    ui.set(ref.bodyyaw[2], 0)
    ui.set(ref.yaw[2], 14)
    ui.set(ref.pitch[2], 89)
end

local current_tickcount = 0
local to_jitter = false
local yaw_amount = 0 
local native_GetClientEntity = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)')

local defensive1 = 0
local defensive = 0
local defensive2 = 0

is_defensive_active1  = function (cmd)
    local lp = entity.get_local_player()
    if lp == nil or not entity.is_alive(lp) then
        return
    end

    local Entity = native_GetClientEntity(lp)
    local m_flOldSimulationTime = ffi.cast('float*', ffi.cast('uintptr_t', Entity) + 0x26C)[0]
    local m_flSimulationTime = entity.get_prop(lp, 'm_flSimulationTime')

    local delta = m_flOldSimulationTime - m_flSimulationTime;

    if delta > 0 then
        defensive1 = globals.tickcount() + toticks(delta - client.latency()) - 3.5;
        return
    end
end


is_defensive_active2  = function (cmd)
    local lp = entity.get_local_player()
    if lp == nil or not entity.is_alive(lp) then
        return
    end

    local Entity = native_GetClientEntity(lp)
    local m_flOldSimulationTime = ffi.cast('float*', ffi.cast('uintptr_t', Entity) + 0x26C)[0]
    local m_flSimulationTime = entity.get_prop(lp, 'm_flSimulationTime')

    local delta = m_flOldSimulationTime - m_flSimulationTime;

    if delta > 0 then
        defensive2 = globals.tickcount() + toticks(delta - client.latency()) - 5;
        return
    end
end

is_defensive_active = function (cmd)
    local lp = entity.get_local_player()
    if lp == nil or not entity.is_alive(lp) then
        return
    end

    local Entity = native_GetClientEntity(lp)
    local m_flOldSimulationTime = ffi.cast('float*', ffi.cast('uintptr_t', Entity) + 0x26C)[0]
    local m_flSimulationTime = entity.get_prop(lp, 'm_flSimulationTime')

    local delta = m_flOldSimulationTime - m_flSimulationTime;

    if delta > 0 then
        defensive = globals.tickcount() + toticks(delta - client.latency());
        defensive1 = globals.tickcount() + toticks(delta - client.latency()) - 5;
        return
    end
end

is_defensive_active3 = function (cmd)
    local lp = entity.get_local_player()
    if lp == nil or not entity.is_alive(lp) then
        return
    end

    local Entity = native_GetClientEntity(lp)
    local m_flOldSimulationTime = ffi.cast('float*', ffi.cast('uintptr_t', Entity) + 0x26C)[0]
    local m_flSimulationTime = entity.get_prop(lp, 'm_flSimulationTime')

    local delta = m_flOldSimulationTime - m_flSimulationTime;

    if delta > 0 then
        defensive = globals.tickcount() + toticks(delta - client.latency());
        defensive2 = globals.tickcount() + toticks(delta - client.latency()) - 5;
        return
    end
end

local function is_vulnerable()
    for _, v in ipairs(entity.get_players(true)) do
        local flags = (entity.get_esp_data(v)).flags
        if bit.band(flags, bit.lshift(1, 11)) ~= 0 then
            return true
        end
    end
    return false
end


math.normalize_yaw = (function (a)
    while a > 180 do
        a = a - 360
    end

    while a < -180 do
        a = a + 360
    end

    return a
end)

function spin(speed, iterations, initial_value)

    local start = math.normalize_yaw(speed * globals.curtime() * 350)
    local iterations = iterations or 1
    local value = initial_value 

    return start, iterations, value
end

local to_defensive = true
local first_execution = true

local function defensive_peek()
    to_defensive = false
end

local function defensive_disabler()
    to_defensive = true
end


local function aa_setup(cmd)
    local lp = entity.get_local_player()
    if lp == nil then
        return
    end

    if player_state(cmd) == "Duck-Moving" and antiaim_builder2[8].enable2:get() then
        id = 8
    elseif player_state(cmd) == "Duck" and antiaim_builder2[7].enable2:get() then
        id = 7
    elseif player_state(cmd) == "Air+C" and antiaim_builder2[6].enable2:get() then
        id = 6
    elseif player_state(cmd) == "Air" and antiaim_builder2[5].enable2:get() then
        id = 5
    elseif player_state(cmd) == "Moving" and antiaim_builder2[4].enable2:get() then
        id = 4
    elseif player_state(cmd) == "Walking" and antiaim_builder2[3].enable2:get() then
        id = 3
    elseif player_state(cmd) == "Standing" and antiaim_builder2[2].enable2:get() then
        id = 2
    else
        id = 1
    end
    local defensive = not(globals.tickcount() > (defensive1 or defensive))
    local defensiv = not(globals.tickcount() > (defensive2 or defensive))

    ui.set(ref.roll[1], 0)

    run_direction()
    edge_direction()

    local delay_time = antiaim_builder2[id].yaw_delay2:get()
    local random_delay = antiaim_builder2[id].yaw_delay_random2:get()
    local random_variation = 0
    if antiaim_builder2[id].delay:get() and not(defensiv or defensive and antiaim_builder2[id].adaptive_desync:get() and antiaim_builder2[id].enable:get()) then
        if globals.tickcount() > current_tickcount + delay_time and random_variation == math.random(random_variation, random_delay) then
            if cmd.chokedcommands == 0 then
                to_jitter = not to_jitter 
                current_tickcount = globals.tickcount()
            end
        end
    end
    
    if globals.tickcount() < current_tickcount then
        current_tickcount = globals.tickcount()
    end

    if is_vulnerable() then
        if first_execution then
            first_execution = false
            to_defensive = true
            client.set_event_callback("setup_command", defensive_disabler)
        end
        if globals.tickcount() % 10 == 9 then
            defensive_peek()
            client.unset_event_callback("setup_command", defensive_disabler)
        end
    else
        first_execution = true
        to_defensive = false
    end

    ui.set(ref.fsbodyyaw, false)
    ui.set(ref.pitch[1], "Default")
    ui.set(ref.yawbase, lua_menu.antiaim.yaw_base:get())
    ui.set(ref.yaw[1], "180")

    ui.set(ref.yawjitter[1], antiaim_builder2[id].mod_type2:get())
    ui.set(ref.yawjitter[2], antiaim_builder2[id].mod_dm2:get())

    if antiaim_builder2[id].delay:get() then
        ui.set(ref.bodyyaw[1], "Static")
        ui.set(ref.bodyyaw[2], to_jitter and 1 or -1)
    elseif defensiv or defensive and antiaim_builder2[id].enable:get() and antiaim_builder2[id].adaptive_desync:get() then
        ui.set(ref.bodyyaw[1], "Off")
        ui.set(ref.bodyyaw[2], 0)
    else
        ui.set(ref.bodyyaw[1], antiaim_builder2[id].body_yaw_type2:get())
        ui.set(ref.bodyyaw[2], antiaim_builder2[id].body_slider2:get())
    end
   
    cmd.force_defensive = antiaim_builder2[id].force_lc:get() or antiaim_builder2[id].enable:get() and to_defensive
   
   local desync_type = entity.get_prop(lp, "m_flPoseParameter", 11) * 120 - 60
   local desync_side = desync_type > 0

    if defensive and antiaim_builder2[id].enable:get() and yaw_direction == 0 then
        if antiaim_builder2[id].pitch_type:get() == "Static" then
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], antiaim_builder2[id].pitch_slider1:get())
        elseif antiaim_builder2[id].pitch_type:get() == "Random" then
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], client.random_int(antiaim_builder2[id].pitch_slider:get(), antiaim_builder2[id].pitch_slider2:get()))
        elseif antiaim_builder2[id].pitch_type:get() == "Jitter" then
            local pitch_value1 = antiaim_builder2[id].pitch_slider:get()
            local pitch_value2 = antiaim_builder2[id].pitch_slider2:get()
                     
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], desync_side and pitch_value1 or pitch_value2)
        end
    end

    if antiaim_builder2[id].yaw_lr:get() then
        yaw_amount = desync_side and randomize_value(antiaim_builder2[id].yaw_left2:get(), antiaim_builder2[id].yaw_random2:get()) or randomize_value(antiaim_builder2[id].yaw_right2:get(), antiaim_builder2[id].yaw_random2:get()) 
    end
    if defensive and antiaim_builder2[id].enable:get() then
        if yaw_direction == 0 then
            if antiaim_builder2[id].defense_aa_type:get() == "Spin" then 
                local spin = spin(-antiaim_builder2[id].defensive_speed:get(), 1)
                yaw_amount = math.normalize_yaw(spin)
            end
            if antiaim_builder2[id].defense_aa_type:get() == "Random" then
                yaw_amount = math.random(-antiaim_builder2[id].defense_aa_slider:get(), antiaim_builder2[id].defense_aa_slider:get())
            end
            if antiaim_builder2[id].defense_aa_type:get() == "Static" then
                yaw_amount = client.random_int(180, 180)
            end
        end
    end
    if defensive and antiaim_builder2[id].enable:get() and yaw_direction == 0 then
        if antiaim_builder2[id].defense_aa_type:get() == "Jitter" then
            yaw_amount =  globals.tickcount() % 3 == 0 and client.random_int(-antiaim_builder2[id].defense_aa_slider:get(), -antiaim_builder2[id].defense_aa_slider:get()) or globals.tickcount() % 3 == 1 and client.random_int(-antiaim_builder2[id].defense_aa_slider:get(), -antiaim_builder2[id].defense_aa_slider:get()) or globals.tickcount() % 3 == 2 and client.random_int(antiaim_builder2[id].defense_aa_slider:get(), antiaim_builder2[id].defense_aa_slider:get()) or 0
        end
    elseif defensive and antiaim_builder2[id].enable:get() and yaw_direction == 0 and antiaim_builder2[id].adaptive_desync:get() then
        ui.set(ref.bodyyaw[1], 'Off')
        ui.set(ref.bodyyaw[2], 0)
        if antiaim_builder2[id].defense_aa_type:get() == "Jitter" and antiaim_builder2[id].adaptive_desync:get() then
            yaw_amount = globals.tickcount() % 3 == 0 and client.random_int(-antiaim_builder2[id].defense_aa_slider:get(), -antiaim_builder2[id].defense_aa_slider:get()) or globals.tickcount() % 3 == 1 and client.random_int(-antiaim_builder2[id].defense_aa_slider:get(), -antiaim_builder2[id].defense_aa_slider:get())or globals.tickcount() % 3 == 2 and client.random_int(antiaim_builder2[id].defense_aa_slider:get(), antiaim_builder2[id].defense_aa_slider:get()) or 0
        end
    end
    if defensiv and antiaim_builder2[id].enable:get() then
        if yaw_direction == 0 and antiaim_builder2[id].adaptive_desync:get() then
            if antiaim_builder2[id].defense_aa_type:get() == "Spin" then
                local spin = spin(-antiaim_builder2[id].defensive_speed:get(), 1)
                yaw_amount = math.normalize_yaw(spin)
            elseif antiaim_builder2[id].defense_aa_type:get() == "Random" and antiaim_builder2[id].adaptive_desync:get() then
                ui.set(ref.bodyyaw[1], 'Off')
                ui.set(ref.bodyyaw[2], 0)
                yaw_amount =  math.random(-antiaim_builder2[id].defense_aa_slider:get(), antiaim_builder2[id].defense_aa_slider:get())
            elseif antiaim_builder2[id].defense_aa_type:get() == "Static" and antiaim_builder2[id].adaptive_desync:get() then
                ui.set(ref.bodyyaw[1], 'Off')
                ui.set(ref.bodyyaw[2], 0)
                yaw_amount = client.random_int(180, 180)
            end
        end
    end

    if antiaim_builder2[id].yaw_offset:get() and not(defensiv or defensive) then
        yaw_amount = yaw_direction == 0 and antiaim_builder2[id].yaw_offset_slider:get() or yaw_direction
    end

    ui.set(ref.yaw[2], yaw_direction == 0 and math.normalize_yaw(yaw_amount) or yaw_direction)
    

    local players = entity.get_players(true)
    if lua_menu.antiaim.addons:get("\v \rSpin on \vwarmup") then
        if entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 then
            ui.set(ref.yaw[1], "Spin")
            ui.set(ref.yaw[2], 55)
            ui.set(ref.yawjitter[1],"Off")
            ui.set(ref.yawjitter[2], 0)
            ui.set(ref.bodyyaw[1], "Static")
            ui.set(ref.bodyyaw[2], 1)
            ui.set(ref.pitch[1], "Custom")
            ui.set(ref.pitch[2], 0)
        end
    end

    if lua_menu.antiaim.manual_type:get() == "Static" and entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 0 then
        if yaw_direction > 1 or yaw_direction < -1  then
            ui.set(ref.yawjitter[1],"Off" )
            ui.set(ref.yawjitter[2], 0)
            ui.set(ref.bodyyaw[1], "Opposite")
            ui.set(ref.bodyyaw[2], 0)
            ui.set(ref.pitch[1], "Default")
        end
    elseif lua_menu.antiaim.manual_type:get() == "Jitter" then
        if yaw_direction > 1 or yaw_direction < -1  then
            ui.set(ref.yawjitter[1],"Center" )
            ui.set(ref.yawjitter[2], 35)
            ui.set(ref.bodyyaw[1], "Jitter")
            ui.set(ref.bodyyaw[2], -1)
            ui.set(ref.pitch[1], "Default")
        end
    end
    if lua_menu.antiaim.key_freestand:get() and entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 0 and yaw_direction == 0 then
        if lua_menu.antiaim.freestand_type:get() == "Static" then
            ui.set(ref.yaw[1], "180")
            ui.set(ref.yaw[2], 5)
            ui.set(ref.yawjitter[1],"Off" )
            ui.set(ref.yawjitter[2], 0)
            ui.set(ref.bodyyaw[1], "Off")
            ui.set(ref.bodyyaw[2], 0) 
            ui.set(ref.pitch[1], "Default")
        elseif lua_menu.antiaim.freestand_type:get() == "Jitter" then
            ui.set(ref.yaw[1], "180")
            ui.set(ref.yaw[2], 10)
            ui.set(ref.yawjitter[1],"Center" )
            ui.set(ref.yawjitter[2], 35)
            ui.set(ref.bodyyaw[1], "Jitter")
            ui.set(ref.bodyyaw[2], -1) 
            ui.set(ref.pitch[1], "Default")
        end
    end
    
    local threat = client.current_threat()

    local lp_weapon = entity.get_player_weapon(lp)
    local lp_orig_x, lp_orig_y, lp_orig_z = entity.get_prop(lp, "m_vecOrigin")
    local flags = entity.get_prop(lp, "m_fFlags")
    local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
    local ducked = entity.get_prop(lp, "m_flDuckAmount") > 0.7

    if lua_menu.antiaim.addons:get("\v \rSafe head") then
        if lp_weapon ~= nil then
            if lua_menu.antiaim.safe_head:get("\vKnife") then
                if jumpcheck and ducked and entity.get_classname(lp_weapon) == "CKnife" then
                    safe_func()
                end
            end
            if lua_menu.antiaim.safe_head:get("Zeus") then
                if jumpcheck and ducked and entity.get_classname(lp_weapon) == "CWeaponTaser" then
                    safe_func()
                end
            end
            if lua_menu.antiaim.safe_head:get("Dormant") then
                if threat ~= nil then
                    threat_x, threat_y, threat_z = entity.get_prop(threat, "m_vecOrigin")
                    threat_dist = anti_knife_dist(lp_orig_x, lp_orig_y, lp_orig_z, threat_x, threat_y, threat_z)
                    if threat_dist > 900 then
                        safe_func()
                    end
                end
            end
        end
    end

    if lua_menu.antiaim.addons:get("\v \rAvoid backstab") then
        for i = 1, #players do
            if players == nil then
                return
            end
            enemy_orig_x, enemy_orig_y, enemy_orig_z = entity.get_prop(players[i], "m_vecOrigin")
            distance_to = anti_knife_dist(lp_orig_x, lp_orig_y, lp_orig_z, enemy_orig_x, enemy_orig_y, enemy_orig_z)
            weapon = entity.get_player_weapon(players[i])
            if weapon == nil then
                return
            end
            if entity.get_classname(weapon) == "CKnife" and distance_to <= 350 then
                ui.set(ref.yaw[2], 180)
                ui.set(ref.yawbase, "At targets")
            end
        end
    end  
end


local shots = {
    hit = {},
    missed = { 0, 0, 0, 0, 0 },
    total = 0
}
local hitgroups = { "generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "unknown", "gear" }

client.set_event_callback("aim_hit", function(shot)
    table.insert(shots.hit, {
        entity.get_player_name(shot.target),
        shot.hit_chance,
        shot.damage,
        hitgroups[shot.hitgroup + 1] or "unknown"
    })
end)
client.set_event_callback("aim_miss", function(shot)
    if shot.reason == "spread" then shots.missed[1] = shots.missed[1] + 1 end;if shot.reason == "prediction error" then shots.missed[2] = shots.missed[2] + 1 end;if shot.reason == "death" then shots.missed[3] = shots.missed[3] + 1 end;if shot.reason == "?" then shots.missed[4] = shots.missed[4] + 1 end
end)

client.set_event_callback("player_connect_full", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
        shots.missed[1] = 0;shots.missed[2] = 0;shots.missed[3] = 0;shots.missed[4] = 0
        for k in pairs(shots.hit) do shots.hit[k] = nil end
    end
end)

local function anim_breaker()
    local lp = entity.get_local_player()
    if not lp then
        return
    end
    if not entity.is_alive(lp) then
        return
    end

    local self_index = c_entity.new(lp)
    local self_anim_state = self_index:get_anim_state()
    if not self_anim_state then
        return
    end

    local self_anim_overlay = self_index:get_anim_overlay(12)
    if not self_anim_overlay then
        return
    end
    local x_velocity = entity.get_prop(lp, "m_vecVelocity[0]")
    if math.abs(x_velocity) >= 3 then
        self_anim_overlay.weight = 1
    end

    if lua_menu.misc.animation_ground:get() == "Static" then
        entity.set_prop(lp, "m_flPoseParameter", lua_menu.misc.animation_value:get() / 10, 0)
    elseif lua_menu.misc.animation_ground:get() == "Jitter" then
        entity.set_prop(
            lp,
            "m_flPoseParameter",
            globals.tickcount() % 4 > 1 and lua_menu.misc.animation_value:get() / 10 or 0,
            0
        )
    else
        entity.set_prop(lp, "m_flPoseParameter", math.random(lua_menu.misc.animation_value:get(), 10) / 10, 0)
    end

    if lua_menu.misc.animation_air:get() == "Static" then
        entity.set_prop(lp, "m_flPoseParameter", 1, 6)
    elseif lua_menu.misc.animation_air:get() == "Kangaroo" then
        entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10) / 10, 6)
    end
end

local screen = {client.screen_size()}
local center = {screen[1] / 2, screen[2] / 2}

math.lerp = function(name, value, speed)
    return name + (value - name) * globals.absoluteframetime() * speed
end

local logs = {}
local function ragebot_logs()
    local offset, x, y = 0, screen[1] / 2, screen[2] / 1.4
    for idx, data in ipairs(logs) do
        if (((globals.curtime() / 2) * 2.0) - data[3]) < 4.0 and not (#logs > 5 and idx < #logs - 5) then
            data[2] = math.lerp(data[2], 255, 10)
        else
            data[2] = math.lerp(data[2], 0, 10)
        end
        offset = offset - 40 * (data[2] / 255)

        text_size_x, text_sise_y = renderer.measure_text("", data[1])
        if lua_menu.misc.screen_type:get() == "Default" then
            renderer.rectangle(
                x - 7 - text_size_x / 2,
                y - offset - 8,
                text_size_x + 13,
                26,
                0,
                0,
                0,
                (data[2] / 255) * 150
            )
            renderer.rectangle(
                x - 6 - text_size_x / 2,
                y - offset - 7,
                text_size_x + 11,
                24,
                50,
                50,
                50,
                (data[2] / 255) * 255
            )
            renderer.rectangle(
                x - 4 - text_size_x / 2,
                y - offset - 4,
                text_size_x + 7,
                18,
                80,
                80,
                80,
                (data[2] / 255) * 255
            )
            renderer.rectangle(
                x - 3 - text_size_x / 2,
                y - offset - 3,
                text_size_x + 5,
                16,
                20,
                20,
                20,
                (data[2] / 255) * 200
            )
            renderer.gradient(
                x - 3 - text_size_x / 2,
                y - offset - 3,
                text_size_x / 2 + 3,
                1,
                78,
                169,
                249,
                (data[2] / 255) * 255,
                254,
                86,
                217,
                (data[2] / 255) * 255,
                true
            )
            renderer.gradient(
                x - 3,
                y - offset - 3,
                text_size_x / 2 + 5,
                1,
                254,
                86,
                217,
                (data[2] / 255) * 255,
                214,
                255,
                108,
                (data[2] / 255) * 255,
                true
            )
        else
            renderer.rectangle(x - 7 - text_size_x / 2, y - offset - 5, text_size_x + 13, 2, 145, 90, 150, data[2])
            renderer.rectangle(
                x - 7 - text_size_x / 2,
                y - offset - 5,
                text_size_x + 13,
                20,
                0,
                0,
                0,
                (data[2] / 255) * 50
            )
        end
        renderer.text(x - 1 - text_size_x / 2, y - offset, 255, 255, 255, data[2], "", 0, data[1])
        if data[2] < 0.1 or not entity.get_local_player() then
            table.remove(logs, idx)
        end
    end
end

renderer.log = function(text)
    table.insert(logs, {text, 0, ((globals.curtime() / 2) * 2.0)})
end

local notify =
    (function()
    local b = vector
    local c = function(d, b, c)
        return d + (b - d) * c
    end
    local e = function()
        return b(client.screen_size())
    end
    local f = function(d, ...)
        local c = {...}
        local c = table.concat(c, "")
        return b(renderer.measure_text(d, c))
    end
    local g = {notifications = {bottom = {}}, max = {bottom = 6}}
    g.__index = g
    g.new_bottom = function(h, i, j, ...)
        table.insert(
            g.notifications.bottom,
            {
                started = false,
                instance = setmetatable(
                    {
                        active = false,
                        timeout = 5,
                        color = {["r"] = h, ["g"] = i, ["b"] = j, a = 0},
                        x = e().x / 2,
                        y = e().y,
                        text = ...
                    },
                    g
                )
            }
        )
    end
    function g:handler()
        local d = 0
        local b = 0
        for d, b in pairs(g.notifications.bottom) do
            if not b.instance.active and b.started then
                table.remove(g.notifications.bottom, d)
            end
        end
        for d = 1, #g.notifications.bottom do
            if g.notifications.bottom[d].instance.active then
                b = b + 1
            end
        end
        for c, e in pairs(g.notifications.bottom) do
            if c > g.max.bottom then
                return
            end
            if e.instance.active then
                e.instance:render_bottom(d, b)
                d = d + 1
            end
            if not e.started then
                e.instance:start()
                e.started = true
            end
        end
    end
    function g:start()
        self.active = true
        self.delay = globals.realtime() + self.timeout
    end
    function g:get_text()
        local d = ""
        for b, b in pairs(self.text) do
            local c = f("", b[1])
            local c, e, f = 255, 255, 255
            if b[2] then
                c, e, f = 99, 199, 99
            end
            d = d .. ("\a%02x%02x%02x%02x%s"):format(c, e, f, self.color.a, b[1])
        end
        return d
    end
    local k =
        (function()
        local d = {}
        d.rec = function(d, b, c, e, f, g, k, l, m)
            m = math.min(d / 2, b / 2, m)
            renderer.rectangle(d, b + m, c, e - m * 2, f, g, k, l)
            renderer.rectangle(d + m, b, c - m * 2, m, f, g, k, l)
            renderer.rectangle(d + m, b + e - m, c - m * 2, m, f, g, k, l)
            renderer.circle(d + m, b + m, f, g, k, l, m, 180, .25)
            renderer.circle(d - m + c, b + m, f, g, k, l, m, 90, .25)
            renderer.circle(d - m + c, b - m + e, f, g, k, l, m, 0, .25)
            renderer.circle(d + m, b - m + e, f, g, k, l, m, -90, .25)
        end
        d.rec_outline = function(d, b, c, e, f, g, k, l, m, n)
            m = math.min(c / 2, e / 2, m)
            if m == 1 then
                renderer.rectangle(d, b, c, n, f, g, k, l)
                renderer.rectangle(d, b + e - n, c, n, f, g, k, l)
            else
                renderer.rectangle(d + m, b, c - m * 2, n, f, g, k, l)
                renderer.rectangle(d + m, b + e - n, c - m * 2, n, f, g, k, l)
                renderer.rectangle(d, b + m, n, e - m * 2, f, g, k, l)
                renderer.rectangle(d + c - n, b + m, n, e - m * 2, f, g, k, l)
                renderer.circle_outline(d + m, b + m, f, g, k, l, m, 180, .25, n)
                renderer.circle_outline(d + m, b + e - m, f, g, k, l, m, 90, .25, n)
                renderer.circle_outline(d + c - m, b + m, f, g, k, l, m, -90, .25, n)
                renderer.circle_outline(d + c - m, b + e - m, f, g, k, l, m, 0, .25, n)
            end
        end
        d.glow_module_notify = function(b, c, e, f, g, k, l, m, n, o, p, q, r, s, s)
            local t = 1
            local u = 1
            if s then
                d.rec(b, c, e, f, l, m, n, o, k)
            end
            for l = 0, g do
                local m = o / 2 * (l / g) ^ 3
                d.rec_outline(
                    b + (l - g - u) * t,
                    c + (l - g - u) * t,
                    e - (l - g - u) * t * 2,
                    f - (l - g - u) * t * 2,
                    p,
                    q,
                    r,
                    m / 1.5,
                    k + t * (g - l + u),
                    t
                )
            end
        end
        return d
    end)()
    function g:render_bottom(g, l)
        local notify1, notify2, notify3, notify4 = lua_menu.misc.log:get()
        local e = e()
        local m = 6
        local n = "     " .. self:get_text()
        local f = f("", n)
        local o = 8
        local p = 5
        local q = 0 + m + f.x
        local q, r = q + p * 2, 12 + 10 + 1
        local s, t = self.x - q / 2, math.ceil(self.y - 40 + .4)
        local u = globals.frametime()
        if globals.realtime() < self.delay then
            self.y = c(self.y, e.y - 45 - (l - g) * r * 1.4, u * 7)
            self.color.a = c(self.color.a, 255, u * 2)
        else
            self.y = c(self.y, self.y - 10, u * 15)
            self.color.a = c(self.color.a, 0, u * 20)
            if self.color.a <= 1 then
                self.active = false
            end
        end
        local c, e, g, l = self.color.r, self.color.g, self.color.b, self.color.a
        k.glow_module_notify(s, t, q, r, 9, o, 25, 25, 25, l, notify1, notify2, notify3, l, true)
        local k = p + 2
        k = k + 0 + m
        renderer.text(s + k, t + r / 2 - f.y / 2, notify1, notify2, notify3, l, "b", nil, " ")
        renderer.text(s + k, t + r / 2 - f.y / 2, notify1, notify2, notify3, l, "", nil, n)
    end
    client.set_event_callback("paint_ui",function()
        if not is_lua_loaded then return end
        g:handler()
    end)
    return g
end)()
local notifications = {}

local function push_notify(text)
    local notify1, notify2, notify3, notify4 = lua_menu.misc.log:get()
    if lua_menu.misc.multibox4:get("On screen") == true then
        notify.new_bottom(notify1, notify2, notify3, {{text}})
    else
        table.insert(
            notifications,
            1,
            {
                text = text,
                alpha = 255,
                spacer = 0,
                lifetime = client.timestamp() + (10.0 * 100)
            }
        )
    end
end

push_notify()

client.exec("clear")
client.delay_call(1,
    function()
        is_lua_loaded = true
    end)
client.delay_call(
    1.6,
    function()
        notify.new_bottom(255, 255, 255, {{" Loaded "}, {" ! ", true}})
        client.delay_call(
            2.3,
            function()
                notify.new_bottom(255, 255, 255, {{" acheron "}, {" . ", true}})
            end
        )
    end
)


local shot_logger = {}

shot_logger.add = function(...)
    args = { ... }
    len = #args
    for i = 1, len do
        arg = args[i]
        r, g, b = unpack(arg)

        msg = {}

        if #arg == 3 then
            table.insert(msg, " ")
        else
            for i = 4, #arg do
                table.insert(msg, arg[i])
            end
        end
        msg = table.concat(msg)

        if len > i then
            msg = msg .. "\0"
        end

        client.color_log(r, g, b, msg)
    end
end

shot_logger.bullet_impacts = {}
shot_logger.bullet_impact = function(e)
	local tick = globals.tickcount()
	local me = entity.get_local_player()
	local user = client.userid_to_entindex(e.userid)
	
	if user ~= me then
		return
	end

	if #shot_logger.bullet_impacts > 150 then
		shot_logger.bullet_impacts = { }
	end

	shot_logger.bullet_impacts[#shot_logger.bullet_impacts+1] = {
		tick = tick,
		eye = vector(client.eye_position()),
		shot = vector(e.x, e.y, e.z)
	}
end

shot_logger.get_inaccuracy_tick = function(pre_data, tick)
	local spread_angle = -1
	for k, impact in pairs(shot_logger.bullet_impacts) do
		if impact.tick == tick then
			local aim, shot = 
				(pre_data.eye-pre_data.shot_pos):angles(),
				(pre_data.eye-impact.shot):angles()

				spread_angle = vector(aim-shot):length2d()
			break
		end
	end

	return spread_angle
end

shot_logger.get_safety = function(aim_data, target)
	local has_been_boosted = aim_data.boosted
	local plist_safety = plist.get(target, 'Override safe point')
	local ui_safety = { ui.get(ref.safepoint), ui.get(ref.safepoint) or plist_safety == 'On' }

	if not has_been_boosted then
		return -1
	end

	if plist_safety == 'Off' or not (ui_safety[1] or ui_safety[2]) then
		return 0
	end

	return ui_safety[2] and 2 or (ui_safety[1] and 1 or 0)
end

shot_logger.generate_flags = function(pre_data)
	return {
		pre_data.self_choke > 1 and 1 or 0,
		pre_data.velocity_modifier < 1.00 and 1 or 0,
		pre_data.flags.boosted and 1 or 0
	}
end

shot_logger.hitboxes = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
shot_logger.on_aim_fire = function(e)
	local p_ent = e.target
	local me = entity.get_local_player()

	shot_logger[e.id] = {
		original = e,
		dropped_packets = { },

		handle_time = globals.realtime(),
		self_choke = globals.chokedcommands(),

		flags = {
			boosted = e.boosted
		},

		feet_yaw = entity.get_prop(p_ent, 'm_flPoseParameter', 11)*120-60,
		correction = plist.get(p_ent, 'Correction active'),

		safety = shot_logger.get_safety(e, p_ent),
		shot_pos = vector(e.x, e.y, e.z),
		eye = vector(client.eye_position()),
		view = vector(client.camera_angles()),

		velocity_modifier = entity.get_prop(me, 'm_flVelocityModifier'),
		total_hits = entity.get_prop(me, 'm_totalHitsOnServer'),

		history = globals.tickcount() - e.tick
	}
end
shot_logger.on_aim_hit = function(e)
	if not ((lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("In console"))) then
		return
	end

	if shot_logger[e.id] == nil then
		return 
	end

	local info = 
	{
		type = math.max(0, entity.get_prop(e.target, 'm_iHealth')) > 0,
		prefix = { lua_menu.misc.log:get() },
		hit = { lua_menu.misc.log:get() },
		name = entity.get_player_name(e.target),
		hitgroup = shot_logger.hitboxes[e.hitgroup + 1] or '?',
		flags = string.format('%s', table.concat(shot_logger.generate_flags(shot_logger[e.id]))),
		aimed_hitgroup = shot_logger.hitboxes[shot_logger[e.id].original.hitgroup + 1] or '?',
		aimed_hitchance = string.format('%d%%', math.floor(shot_logger[e.id].original.hit_chance + 0.5)),
		hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
		spread_angle = string.format('%.2f°', shot_logger.get_inaccuracy_tick(shot_logger[e.id], globals.tickcount())),
		correction = string.format('%d:%d°', shot_logger[e.id].correction and 1 or 0, (shot_logger[e.id].feet_yaw < 10 and shot_logger[e.id].feet_yaw > -10) and 0 or shot_logger[e.id].feet_yaw)
	}

    if lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("On screen") then
        push_notify("Hit " .. info.name .. "'s " .. info.hitgroup .. " for " .. e.damage .. "   ")
    end

	shot_logger.add({ info.prefix[1], info.prefix[2], info.prefix[3], 'acheron'}, 
					{ 134, 134, 134, ' • ' }, 
					{ 255, 255, 255, info.type and 'Damaged ' or 'Killed ' }, 
					{ info.hit[1], info.hit[2], info.hit[3],  info.name }, 
					{ 255, 255, 255, ' in the ' }, 
					{ info.hit[1], info.hit[2], info.hit[3], info.hitgroup }, 
					{ 255, 255, 255, info.hitgroup ~= info.aimed_hitgroup and ' (' or ''},
					{ info.hit[1], info.hit[2], info.hit[3], (info.hitgroup ~= info.aimed_hitgroup and info.aimed_hitgroup) or '' },
					{ 255, 255, 255, info.hitgroup ~= info.aimed_hitgroup and ')' or ''},
					{ 255, 255, 255, ' for ' or '' },
					{ info.hit[1], info.hit[2], info.hit[3], e.damage or '' },
					{ 255, 255, 255, e.damage ~= shot_logger[e.id].original.damage and ' (' or ''},
					{ info.hit[1], info.hit[2], info.hit[3], (e.damage ~= shot_logger[e.id].original.damage and shot_logger[e.id].original.damage) or '' },
					{ 255, 255, 255, e.damage ~= shot_logger[e.id].original.damage and ')' or ''},
					{ 255, 255, 255, ' damage' or '' },
					{ 255, 255, 255, ' (hc: ' }, { info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance }, { 255, 255, 255, ' • safety: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].safety },
					{ 255, 255, 255, ' • bt: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].history },
					{ 255, 255, 255, ')' })
end

shot_logger.on_aim_miss = function(e)
	if not (lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("In console")) then
		return
	end

	local me = entity.get_local_player()
	local info = 
	{
		prefix = { lua_menu.misc.log:get() },
		hit = { lua_menu.misc.log:get() },
		name = entity.get_player_name(e.target),
		hitgroup = shot_logger.hitboxes[e.hitgroup + 1] or '?',
		flags = string.format('%s', table.concat(shot_logger.generate_flags(shot_logger[e.id]))),
		aimed_hitgroup = shot_logger.hitboxes[shot_logger[e.id].original.hitgroup + 1] or '?',
		aimed_hitchance = string.format('%d%%', math.floor(shot_logger[e.id].original.hit_chance + 0.5)),
		hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
		reason = e.reason,
		spread_angle = string.format('%.2f°', shot_logger.get_inaccuracy_tick(shot_logger[e.id], globals.tickcount())),
		correction = string.format('%d:%d°', shot_logger[e.id].correction and 1 or 0, (shot_logger[e.id].feet_yaw < 10 and shot_logger[e.id].feet_yaw > -10) and 0 or shot_logger[e.id].feet_yaw)
	}

    if lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("On screen") then
        push_notify("Missed " .. info.name .. "'s " .. info.hitgroup .. " due to " .. info.reason .. "   ")
    end

    if info.reason == '?' then
        info.reason = 'unknown';

        if shot_logger[e.id].total_hits ~= entity.get_prop(me, 'm_totalHitsOnServer') then
            info.reason = 'damage rejection';
        end
    end

	shot_logger.add({ info.prefix[1], info.prefix[2], info.prefix[3], 'acheron'}, 
					{ 134, 134, 134, ' ' }, 
					{ 255, 255, 255, 'Missed shot at ' }, 
					{ info.hit[1], info.hit[2], info.hit[3],  info.name }, 
					{ 255, 255, 255, ' in the ' }, 
					{ info.hit[1], info.hit[2], info.hit[3], info.hitgroup }, 
					{ 255, 255, 255, ' due to '},
					{ info.hit[1], info.hit[2], info.hit[3], info.reason },
					{ 255, 255, 255, ' (hc: ' }, { info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance }, { 255, 255, 255, ' • safety: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].safety },
					{ 255, 255, 255, ' • bt: ' }, { info.hit[1], info.hit[2], info.hit[3], shot_logger[e.id].history },
					{ 255, 255, 255, ')' })
end

client.set_event_callback('aim_fire', shot_logger.on_aim_fire)
client.set_event_callback('aim_miss', shot_logger.on_aim_miss)
client.set_event_callback('aim_hit', shot_logger.on_aim_hit)
client.set_event_callback('bullet_impact', shot_logger.bullet_impact)


local rgba_to_hex = function(b, c, d, e)
    return string.format("%02x%02x%02x%02x", b, c, d, e)
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function clamp(x, minval, maxval)
    if x < minval then
        return minval
    elseif x > maxval then
        return maxval
    else
        return x
    end
end

local function text_fade_animation(x, y, speed, color1, color2, text, flag)
    local final_text = ""
    local curtime = globals.curtime()
    for i = 0, #text do
        local x = i * 10
        local wave = math.cos(8 * speed * curtime + x / 30)
        local color =
            rgba_to_hex(
            lerp(color1.r, color2.r, clamp(wave, 0, 1)),
            lerp(color1.g, color2.g, clamp(wave, 0, 1)),
            lerp(color1.b, color2.b, clamp(wave, 0, 1)),
            color1.a
        )
        final_text = final_text .. "\a" .. color .. text:sub(i, i)
    end

    renderer.text(x, y, color1.r, color1.g, color1.b, color1.a, flag, nil, final_text)
end

local function doubletap_charged()
    if not ui.get(ref.dt[1]) or not ui.get(ref.dt[2]) or ui.get(ref.fakeduck) then
        return false
    end
    if not entity.is_alive(entity.get_local_player()) or entity.get_local_player() == nil then
        return
    end
    local weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    if weapon == nil then
        return false
    end
    local next_attack = entity.get_prop(entity.get_local_player(), "m_flNextAttack") + 0.01
    local checkcheck = entity.get_prop(weapon, "m_flNextPrimaryAttack")
    if checkcheck == nil then
        return
    end
    local next_primary_attack = checkcheck + 0.01
    if next_attack == nil or next_primary_attack == nil then
        return false
    end
    return next_attack - globals.curtime() < 0 and next_primary_attack - globals.curtime() < 0
end

local scoped_space = 0

local function indicators_new()

    local lp = entity.get_local_player()
    if lp == nil then
        return
    end

    local r1, g1, b1, a1 = lua_menu.misc.cross_ind_color:get()
    
    local scpd = entity.get_prop(lp, "m_bIsScoped") == 1
    scoped_space = math.lerp(scoped_space, scpd and 25 or 0, 20)

    if ui.get(ref.dt[1]) and ui.get(ref.dt[2])  then
        dt_on  = 10
    else
        dt_on = 0
    end

    if ui.get(ref.os[2]) then
        oson = 10
    else
        oson = 0
    end
  
    text_fade_animation(center[1] - 7 + scoped_space, center[2] + 30, -0.4, {r = 66, g = 66, b = 66, a = 255}, {r = r1, g = g1, b = b1, a = a1}, "acher", "cd")
    text_fade_animation(center[1] + 14 + scoped_space, center[2] + 30, -0.4, {r = 66, g = 66, b = 66, a = 255}, {r = r1, g = g1, b = b1, a = a1}, "on", "cd")
    if id == 1 then
        renderer.text(center[1] + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "shared")
    elseif id == 2 then
        renderer.text(center[1] + 1 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "standing")
    elseif id == 3 then
        renderer.text(center[1] + 2 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "walking")
    elseif id == 4 then
        renderer.text(center[1] + 1 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "running")
    elseif id == 5 then
        renderer.text(center[1] + 1 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "in air")
    elseif id == 6 then
        renderer.text(center[1] + 2 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "in air + c")
    elseif id == 7 then
        renderer.text(center[1] + 1 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "ducking")
    elseif id == 8 then
        renderer.text(center[1] + 2 + scoped_space, center[2] + 40, 255, 255, 255, 255, "cd", 0, "ducking + crouching")
    end
    if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) then
        if doubletap_charged() then
            renderer.text(center[1] + scoped_space, center[2] + 50, 255, 255, 255, 255, "cd", 0, "dt")
        else
            renderer.text(center[1] + scoped_space, center[2] + 50, 255, 0, 0, 255, "cd", 0, "dt")
        end
    end
    if ui.get(ref.os[2]) then
        renderer.text(center[1] + scoped_space, center[2] + 50 + dt_on, 255, 255, 255, 255, "cd", 0, "osaa")
    end
    if ui.get(ref.fakeduck) then
        renderer.text(center[1] + scoped_space, center[2] + 50 + dt_on + oson, 255, 255, 255, 255, "cd", 0, "fd")
    end
end
local function indicators_idealyaw()
    
    
    local lp = entity.get_local_player()
    if lp == nil then
        return
    end
    
    local scpd = entity.get_prop(lp, "m_bIsScoped") == 1
    scoped_space = math.lerp(scoped_space, scpd and 33 or 0, 20)

    if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) or ui.get(ref.os[2]) then
        dton  = 10
    else
        dton = 0
    end

    if id == 2 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "IDEAL YAW")
    elseif id == 4 then
        renderer.text(center[1] - 1 +  scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "JITTER WALK")
    elseif id == 3 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "NORMAL YAW")
    elseif id == 5 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "IDEAL YAW")
    elseif id == 6 then 
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "IDEAL YAW")
    elseif id == 7 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "IDEAL YAW")
    elseif id == 8 then 
        renderer.text(center[1] - 1 + scoped_space, center[2] + 30, 220, 135, 49, 255, "cd", 0, "IDEAL YAW")
    end
    if yaw_direction == -90 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 40, 209, 139, 230, 255, "cd", 0, "LEFT")
    elseif yaw_direction == 90 then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 40, 209, 139, 230, 255, "cd", 0, "RIGHT")
    elseif ui.get(ref.freestand[1]) and ui.get(ref.freestand[2]) then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 40, 209, 139, 230, 255, "cd", 0, "FREESTAND")
    else
        renderer.text(center[1] - 1 + scoped_space, center[2] + 40, 209, 139, 230, 255, "cd", 0, "DYNAMIC")
    end
    if ui.get(ref.dt[1]) and ui.get(ref.dt[2]) then
        if doubletap_charged() then
            renderer.text(center[1] - 2 + scoped_space, center[2] + 50, 170, 204, 0, 255, "cd", 0, "DT")
        else
            renderer.text(center[1] - 2 + scoped_space, center[2] + 50, 255, 0, 0, 255, "cd", 0, "DT")
        end
    end

    if ui.get(ref.os[2]) and not ui.get(ref.dt[2]) then
        renderer.text(center[1] - 1 + scoped_space, center[2] + 50, 170, 204, 0, 255, "cd", 0, "ONSHOT")
    end
    if ui.get(ref.minimum_damage_override[2]) then 
        renderer.text(center[1] - 1 + scoped_space, center[2] + 50 + dton, 255, 255, 255, 255, "cd", 0, "DMG") 
    end 
    text_fade_animation(x_ind/2, y_ind-20, -0.4, {r=255, g=255, b=255, a=255}, {r=255, g=255, b=255, a=0}, "acheron", "cdc")
end


local function fastladder(e)
    local local_player = entity.get_local_player()
    local pitch, yaw = client.camera_angles()
    if entity.get_prop(local_player, "m_MoveType") == 9 then
        e.yaw = math.floor(e.yaw + 0.5)
        e.roll = 0
        if e.forwardmove == 0 then
            if e.sidemove ~= 0 then
                e.pitch = 89
                e.yaw = e.yaw + 180
                if e.sidemove < 0 then
                    e.in_moveleft = 0
                    e.in_moveright = 1
                end
                if e.sidemove > 0 then
                    e.in_moveleft = 1
                    e.in_moveright = 0
                end
            end
        end
        if e.forwardmove > 0 then
            if pitch < 45 then
                e.pitch = 89
                e.in_moveright = 1
                e.in_moveleft = 0
                e.in_forward = 0
                e.in_back = 1
                if e.sidemove == 0 then
                    e.yaw = e.yaw + 90
                end
                if e.sidemove < 0 then
                    e.yaw = e.yaw + 150
                end
                if e.sidemove > 0 then
                    e.yaw = e.yaw + 30
                end
            end
        end
        if e.forwardmove < 0 then
            e.pitch = 89
            e.in_moveleft = 1
            e.in_moveright = 0
            e.in_forward = 1
            e.in_back = 0
            if e.sidemove == 0 then
                e.yaw = e.yaw + 90
            end
            if e.sidemove > 0 then
                e.yaw = e.yaw + 150
            end
            if e.sidemove < 0 then
                e.yaw = e.yaw + 30
            end
        end
    end
end

local refs = {
    rage_cb = {ui.reference("RAGE", "Aimbot", "Enabled")},
    os = {ui.reference("aa", "other", "On shot anti-aim")},
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    fake_duck = ui.reference("RAGE", "Other", "Duck peek assist"),
}

local vars = {
    os_charged = false,
    dt_charged = false
}

client.set_event_callback(
    "setup_command",
    function(cmd)
        if not is_lua_loaded then return end

        local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase") - globals.tickcount()
        local os_ref = ui.get(refs.os[1]) and ui.get(refs.os[2]) and not ui.get(refs.fake_duck)
        local doubletap_ref = ui.get(refs.dt[1]) and ui.get(refs.dt[2]) and not ui.get(refs.fake_duck)
        local active_weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")

        if active_weapon == nil then
            return
        end

        local weapon_idx = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")

        if weapon_idx == nil or weapon_idx == 64 then
            return
        end

        local LastShot = entity.get_prop(active_weapon, "m_fLastShotTime")

        if LastShot == nil then
            return
        end

        local single_fire_weapon =
            weapon_idx == 40 or weapon_idx == 9 or weapon_idx == 64 or weapon_idx == 27 or weapon_idx == 29 or
            weapon_idx == 35
        local value = single_fire_weapon and 0 or 0.50
        local in_attack = globals.curtime() - LastShot <= value

        if tickbase > 0 and os_ref then
            if in_attack then
                ui.set(refs.rage_cb[2], "Always on")
            else
                ui.set(refs.rage_cb[2], "On hotkey")
            end
        elseif tickbase > 0 and doubletap_ref then
            if in_attack then
                ui.set(refs.rage_cb[2], "Always on")
            else
                ui.set(refs.rage_cb[2], "On hotkey")
            end
        else
            ui.set(refs.rage_cb[2], "Always on")
        end
    end
)

function Clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

local function NormalizeAngle(angle)
    if angle == nil then
        return 0
    end
    while angle > 180 do
        angle = angle - 360
    end
    while angle < -180 do
        angle = angle + 360
    end
    return angle
end
local function AngleDifference(dest_angle, src_angle)
    local delta = math.fmod(dest_angle - src_angle, 360)
    if dest_angle > src_angle then
        if delta >= 180 then
            delta = delta - 360
        end
    else
        if delta <= -180 then
            delta = delta + 360
        end
    end
    return delta
end

local function DegToRad(Deg)
    return Deg * (math.pi / 180)
end
local function RadToDeg(Rad)
    return Rad * (180 / math.pi)
end

local VTable = {
    Entry = function(instance, index, type)
        return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
    end,
    Bind = function(self, module, interface, index, typestring)
        local instance = client.create_interface(module, interface)
        local fnptr = self.Entry(instance, index, ffi.typeof(typestring))
        return function(...)
            return fnptr(instance, ...)
        end
    end
}

local animstate_t =
    ffi.typeof "struct { char pad0[0x18]; float anim_update_timer; char pad1[0xC]; float started_moving_time; float last_move_time; char pad2[0x10]; float last_lby_time; char pad3[0x8]; float run_amount; char pad4[0x10]; void* entity; void* active_weapon; void* last_active_weapon; float last_client_side_animation_update_time; int	 last_client_side_animation_update_framecount; float eye_timer; float eye_angles_y; float eye_angles_x; float goal_feet_yaw; float current_feet_yaw; float torso_yaw; float last_move_yaw; float lean_amount; char pad5[0x4]; float feet_cycle; float feet_yaw_rate; char pad6[0x4]; float duck_amount; float landing_duck_amount; char pad7[0x4]; float current_origin[3]; float last_origin[3]; float velocity_x; float velocity_y; char pad8[0x4]; float unknown_float1; char pad9[0x8]; float unknown_float2; float unknown_float3; float unknown; float m_velocity; float jump_fall_velocity; float clamped_velocity; float feet_speed_forwards_or_sideways; float feet_speed_unknown_forwards_or_sideways; float last_time_started_moving; float last_time_stopped_moving; bool on_ground; bool hit_in_ground_animation; char pad10[0x4]; float time_since_in_air; float last_origin_z; float head_from_ground_distance_standing; float stop_to_full_running_fraction; char pad11[0x4]; float magic_fraction; char pad12[0x3C]; float world_force; char pad13[0x1CA]; float min_yaw; float max_yaw; } **"
local NativeGetClientEntity = VTable:Bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")

local GetAnimState = function(ent)
    if not ent then
        return false
    end
    local Address = type(ent) == "cdata" and ent or NativeGetClientEntity(ent)
    if not Address or Address == ffi.NULL then
        return false
    end
    local AddressVtable = ffi.cast("void***", Address)
    return ffi.cast(animstate_t, ffi.cast("char*", AddressVtable) + 0x9960)[0]
end

local GetSimulationTime = function(ent)
    local pointer = NativeGetClientEntity(ent)
    if pointer then
        return entity.get_prop(ent, "m_flSimulationTime"), ffi.cast("float*", ffi.cast("uintptr_t", pointer) + 0x26C)[0]
    else
        return 0
    end
end

local GetMaxDesync = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then
        return 0
    end
    local speedfactor = Clamp(Animstate.feet_speed_forwards_or_sideways, 0, 1)
    local avg_speedfactor = (Animstate.stop_to_full_running_fraction * -0.3 - 0.2) * speedfactor + 1
    local duck_amount = Animstate.duck_amount
    if duck_amount > 0 then
        avg_speedfactor = avg_speedfactor + ((duck_amount * speedfactor) * (0.5 - avg_speedfactor))
    end
    return Clamp(avg_speedfactor, .5, 1) 
end

local IsPlayerAnimating = function(player)
    local CurrentSimulationTime, RecordSimulationTime = GetSimulationTime(player)
    CurrentSimulationTime, RecordSimulationTime = toticks(CurrentSimulationTime), toticks(RecordSimulationTime)
    return toticks(CurrentSimulationTime) ~= nil and toticks(RecordSimulationTime) ~= nil
end

local GetChokedPackets = function(player)
    if not IsPlayerAnimating(player) then
        return 0
    end
    local CurrentSimulationTime, PreviousSimulationTime = GetSimulationTime(player)
    local SimulationTimeDifference = globals.curtime() - CurrentSimulationTime
    local ChokedCommands =
        Clamp(
        toticks(math.max(0.0, SimulationTimeDifference - client.latency())),
        0,
        cvar.sv_maxusrcmdprocessticks:get_string() - 2
    )
    return ChokedCommands
end

function RebuildServerYaw(player)
    local Animstate = GetAnimState(player)
    if not Animstate then
        return 0
    end

    local m_flGoalFeetYaw = Animstate.goal_feet_yaw
    local eye_feet_delta = AngleDifference(Animstate.eye_angles_y, Animstate.goal_feet_yaw)
    local flRunningSpeed = Clamp(Animstate.feet_speed_forwards_or_sideways, 0.0, 1.0)

    local flYawModifier = (((Animstate.stop_to_full_running_fraction * -0.3) - 0.2) * flRunningSpeed) + 1.0
    if Animstate.duck_amount > 0.0 then
        local flDuckingSpeed = Clamp(Animstate.feet_speed_forwards_or_sideways, 0.0, 1.0)
        flYawModifier = flYawModifier + ((Animstate.duck_amount * flDuckingSpeed) * (0.5 - flYawModifier))
    end

    local flMaxYawModifier = flYawModifier * Animstate.max_yaw
    local flMinYawModifier = flYawModifier * Animstate.min_yaw

    if eye_feet_delta <= flMaxYawModifier then
        if flMinYawModifier > eye_feet_delta then
            m_flGoalFeetYaw = math.abs(flMinYawModifier) + Animstate.eye_angles_y
        end
    else
        m_flGoalFeetYaw = Animstate.eye_angles_y - math.abs(flMaxYawModifier)
    end

    return NormalizeAngle(m_flGoalFeetYaw)
end

local JitterBuffer = 6
local Resolver = {
    Jitter = {Jittering = false, JitterTicks = 0, StaticTicks = 0, YawCache = {}, JitterCache = 0, Difference = 0},
    Main = {Mode = 0, Side = 0, Angles = 0}
}

local Cache = {}

local CDetectJitter = function(player)
    local Data = Resolver.Jitter
    local EyeAnglesY = entity.get_prop(player, "m_angEyeAngles")
    Data.YawCache[Data.JitterCache % JitterBuffer] = EyeAnglesY
    if Data.JitterCache >= JitterBuffer + 1 then
        Data.JitterCache = 0
    else
        Data.JitterCache = Data.JitterCache + 1
    end
    for i = 0, JitterBuffer, 1 do
        if i < JitterBuffer then
            local Difference =
                (Data.YawCache[i - Data.JitterCache % JitterBuffer] ~= nil and
                Data.YawCache[Data.JitterCache % JitterBuffer] ~= nil) and
                math.abs(
                    Data.YawCache[i - Data.JitterCache % JitterBuffer] - Data.YawCache[Data.JitterCache % JitterBuffer]
                ) or
                0
            if Difference ~= nil and Difference ~= 0.0 then
                NormalizeAngle(Difference)
                Data.Jittering = Difference >= (48.0 * GetMaxDesync(player)) and true or false
                Data.Difference = Difference
            end
        end
    end
end

local CDetectDesyncSide = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then
        return 0
    end
    if Resolver.Jitter.Jittering and GetChokedPackets(player) < 3 then
        Cache.FirstNormalizedAngle = NormalizeAngle(Resolver.Jitter.YawCache[JitterBuffer - 1])
        Cache.SecondNormalizedAngle = NormalizeAngle(Resolver.Jitter.YawCache[JitterBuffer - 2])

        Cache.FirstSinAngle = math.sin(DegToRad(Cache.FirstNormalizedAngle))
        Cache.SecondSinAngle = math.sin(DegToRad(Cache.SecondNormalizedAngle))

        Cache.FirstCosAngle = math.cos(DegToRad(Cache.FirstNormalizedAngle))
        Cache.SecondCosAngle = math.cos(DegToRad(Cache.SecondNormalizedAngle))

        Cache.AVGYaw =
            NormalizeAngle(
            RadToDeg(
                math.atan2(
                    (Cache.FirstSinAngle + Cache.SecondSinAngle) / 2.0,
                    (Cache.FirstCosAngle + Cache.SecondCosAngle) / 2.0
                )
            )
        )
        Cache.Difference = NormalizeAngle(Animstate.eye_angles_y - Cache.AVGYaw)
        if Cache.Difference ~= 0.0 then
            Resolver.Main.Side = Cache.Difference > 0.0 and 1 or -1
        else
            Resolver.Main.Side = 0
        end
    end

    return Resolver.Main.Side
end

local miss_count = 0

local function resetResolverData()
    Resolver.Jitter.Jittering = false
    Resolver.Jitter.JitterTicks = 0
    Resolver.Jitter.StaticTicks = 0
    Resolver.Jitter.YawCache = {}
    Resolver.Jitter.JitterCache = 0
    Resolver.Jitter.Difference = 0
    miss_count = 0
end

local function aim_miss(player)
    if not is_lua_loaded then return end
    miss_count = miss_count + 1
end

client.set_event_callback("aim_miss", function(player)
    aim_miss(player)
end)


local function is_baimable(player)
    local lethal = entity.get_prop(player, "m_iHealth")
    local number_lethal = lua_menu.misc.health:get()
    local selected_items = lua_menu.misc.multibox:get()
    local selected_items2 = lua_menu.misc.multibox2:get()

    local hp_lower_selected = false

    if selected_items then
        for _, item in ipairs(selected_items) do
            if item == "HP lower than X" then
                hp_lower_selected = true
                if lethal > 0 and lethal <= number_lethal then
                    plist.set(player, "Override prefer body aim", "Force")
                else
                    plist.set(player, "Override prefer body aim", "-")
                end
            end
        end
    end
    if selected_items then
        for _, item in ipairs(selected_items) do
            if item == "HP lower than X" then
                if not hp_lower_selected then
                    plist.set(player, "Override prefer body aim", "-")
                end
            end
        end
    end

    local missed_number = lua_menu.misc.missed:get()
    local number_lethal2 = lua_menu.misc.health2:get()
    if selected_items2 then
        for _, item2 in ipairs(selected_items2) do
            if item2 == "HP lower than X" and number_lethal2 then
                if lethal > 0 and lethal <= number_lethal2 then
                    plist.set(player, "Override safe point", "On")
                else
                    plist.set(player, "Override safe point", "-")
                end
            end
        end
    end
    if selected_items2 then
        for _, item2 in ipairs(selected_items2) do
            if item2 == "after X misses" then 
                if miss_count >= missed_number and lethal > 0 then
                    plist.set(player, "Override safe point", "On")
                else
                    plist.set(player, "Override safe point", "-")
                end
            end
        end
    end 
end

client.set_event_callback(
    "player_death",
    function(player)
        if not is_lua_loaded then return end
        miss_count = 0
    end
)


local CResolverInstance = function(player)
    local Animstate = GetAnimState(player)
    if not Animstate then
        return
    end
    CDetectDesyncSide(player)
    local ChokedPackets = GetChokedPackets(player)
    local Desync = math.abs(NormalizeAngle(Animstate.eye_angles_y - Animstate.torso_yaw))
    local Velocity = entity.get_prop(player, "m_vecVelocity[0]")
    local IsDucking = Animstate.duck_amount > 0.1
    local Weapon = entity.get_prop(player, "m_hActiveWeapon")
    local WeaponData = entity.get_player_weapon(Weapon)
    local WeaponFireRate = WeaponData and WeaponData.m_flFireRate or 0

    if ChokedPackets > 2 then
        Resolver.Main.Angles = 0
        Resolver.Main.Mode = 0
    elseif Desync >= 40 and Velocity > 150 then
        Resolver.Main.Angles = Cache.Difference ~= nil and (Cache.Difference * GetMaxDesync(player)) * Resolver.Main.Side or (48.0 * GetMaxDesync(player)) * Resolver.Main.Side
        Resolver.Main.Mode = 1
    elseif Desync >= 20 and IsDucking then
        Resolver.Main.Angles = Cache.Difference ~= nil and (Cache.Difference * GetMaxDesync(player)) or (48.0 * GetMaxDesync(player))  
        Resolver.Main.Mode = 1
    elseif WeaponFireRate > 25 and Desync > 20 then
        Resolver.Main.Angles = Cache.Difference ~= nil and (Cache.Difference * GetMaxDesync(player)) * Resolver.Main.Side or (48.0 * GetMaxDesync(player)) * Resolver.Main.Side
        Resolver.Main.Mode = 1
    else 
        if Resolver.Jitter.Jittering then
            Resolver.Main.Angles = Cache.Difference ~= nil and (Cache.Difference * GetMaxDesync(player)) * Resolver.Main.Side or (48.0 * GetMaxDesync(player)) * Resolver.Main.Side
            Resolver.Main.Mode = 1
        else
            Resolver.Main.Angles = 0
            Resolver.Main.Mode = 0
        end
    end
    CDetectJitter(player)
end

client.set_event_callback(
    "net_update_end",
    function()
        if not is_lua_loaded then return end
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then
            Resolver.Main.Mode = 0
            resetResolverData()
            return
        end
        local Players = entity.get_players()
        client.update_player_list()
        for _, idx in ipairs(Players) do
            if entity.is_enemy(idx) and IsPlayerAnimating(idx) and lua_menu.misc.resolver_enabled:get() then
                CResolverInstance(idx)
                plist.set(idx, "Force body yaw value", Resolver.Main.Mode ~= 0 and Resolver.Main.Angles or 0)
                plist.set(idx, "Force body yaw", Resolver.Main.Mode ~= 0)
            else
                plist.set(idx, "Force body yaw", false)
            end
            is_baimable(idx)
            plist.set(idx, "Correction active", true)
        end
    end
)

client.set_event_callback(
    "round_start",
    function()
        if not is_lua_loaded then return end
        resetResolverData()
    end
)

client.register_esp_flag("KR", 200, 200, 200, function(e) return (entity.is_enemy(e) and lua_menu.misc.resolver_enabled:get() and Resolver.Main.Mode == 1) and true or false end)

local phrases = {
   
}

local userid_to_entindex, get_local_player, is_enemy, console_cmd =
    client.userid_to_entindex,
    entity.get_local_player,
    entity.is_enemy,
    client.exec

local function on_player_death(e)
    if not is_lua_loaded then return end

    if not lua_menu.main.enable:get() then
        return
    end

    local victim_userid, attacker_userid = e.userid, e.attacker
    if victim_userid == nil or attacker_userid == nil then
        return
    end

    local victim_entindex = userid_to_entindex(victim_userid)
    local attacker_entindex = userid_to_entindex(attacker_userid)
    if lua_menu.misc.spammers:get() == "Acheron" then
        if attacker_entindex == get_local_player() and is_enemy(victim_entindex) then
            client.delay_call(2, function()
                console_cmd("say ", phrases[math.random(1, #phrases)])
            end)
        end
    elseif lua_menu.misc.spammers:get() == "1" then
        if attacker_entindex == get_local_player() and is_enemy(victim_entindex) then
            client.delay_call(0.5, function()
                console_cmd("say ", 1)
            end)
        end
    end
end
client.set_event_callback("player_death", on_player_death)

local function update_menu()
    local aA = {
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 80 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 75 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 70 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 65 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 60 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 55 / 30))},
        {200, 200, 200, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + 50 / 30))}
    }
    local color_main1, color_main2, color_main3, color_main4 = ref.accent_color:get()
    label_text =
        string.format("" .. (calculateGradien({color_main1, color_main2, color_main3, color_main4}, {66, 66, 66, 255}, "[ acheron / " .. steamname .. "]", -0.5)) .. "",   
        rgba_to_hex(unpack(aA[1])),
        rgba_to_hex(unpack(aA[2])),
        rgba_to_hex(unpack(aA[3])),
        rgba_to_hex(unpack(aA[4])),
        rgba_to_hex(unpack(aA[5])),
        rgba_to_hex(unpack(aA[6])),
        rgba_to_hex(unpack(aA[7]))
    )
    lua_menu.main.enable:set(label_text)
end


client.set_event_callback(
    "setup_command",
    function(cmd, me)
        if not is_lua_loaded then return end

        if not lua_menu.main.enable:get() then
            return
        end
        aa_setup(cmd)
        if lua_menu.misc.fast_ladder:get() then
            fastladder(cmd)
        end
    end
)

local entity_get_prop,
    entity_get_local_player,
    entity_is_alive,
    entity_get_player_weapon,
    entity_get_classname,
    entity_get_origin,
    globals_frametime,
    client_screen_size,
    globals_framecount,
    is_menu_open,
    menu_mouse_position,
    client_key_state,
    table_insert,
    entity_get_steam64,
    render_circle_outline,
    entity_get_all,
    globals_tickinterval,
    client_set_clantag =
    entity.get_prop,
    entity.get_local_player,
    entity.is_alive,
    entity.get_player_weapon,
    entity.get_classname,
    entity.get_origin,
    globals.frametime,
    client.screen_size,
    globals.framecount,
    ui.is_menu_open,
    ui.mouse_position,
    client.key_state,
    table.insert,
    entity.get_steam64,
    renderer.circle_outline,
    entity.get_all,
    globals.tickinterval,
    client.set_clan_tag


client.set_event_callback(
    "pre_render",
    function()
        if not is_lua_loaded then return end

        if not lua_menu.main.enable:get() then
            return
        end
        if lua_menu.misc.animation:get() then
            anim_breaker()
        end
    end
)



local ui = try_require("gamesense/swift_ui", "~ Try donwload swift_ui: https://gamesense.pub/forums/viewtopic.php?id=28453");

local nekoha3 = readfile("acheron/acheron_watermark.png")

if not nekoha3 then
    http.get("https://i.ibb.co/V0tjcpFD/acheron-watermark.png", function (success, raw)
        if success and string.sub(raw.body, 2, 4) == "PNG" then
            writefile("acheron/acheron_watermark.png", raw.body)
        elseif not success or response.status ~= 150 then
            print("~ Missing Acheron watermark picture")
            print("~ Please reload script, if problem still exist dm to support")
        end
    end)
end


--[[local nekoha2 = readfile("acheron/acheron.gif")

if nekoha2 then
    loaded = true
end

if not nekoha2 then
    download_file("https://i.ibb.co/HTdMkZcW/acheron.gif", "acheron/acheron.gif")
end

local start_time = globals.realtime()

client.delay_call(3, function()
    if not is_lua_loaded then return end
    nekoha2 = gif_decoder.load_gif(readfile("acheron/acheron.gif"))
    function DrawImage()
        if ui.is_menu_open() then 
            local mx, my = ui.menu_position()
            local mw, mh = ui.menu_size()
            nekoha2:draw(globals.realtime() - start_time, mx + mw - nekoha2.width, my - nekoha2.height, nekoha2.width, nekoha2.height, 255, 255, 255, 255)
       end
    end--]]
    client.set_event_callback("paint_ui",function()
        if not is_lua_loaded then return end
        hide_original_menu(false)
        visible_menu()
        update_menu()
        --DrawImage()
    end)

local anyerror = false

local function  watermark_type1()
        local branded1, branded2, branded3, branded4 = lua_menu.misc.watermark_color:get()
        local width, height = client.screen_size()
        text_fade_animation(20, height/2, -1, {r = branded1, g = branded2, b = branded3, a = branded4}, {r = 255, g = 255, b = 255, a = 255},"            A C H E R O N", "cd")
        text_fade_animation(28, height/2 + 13, -0.65, {r = 255, g = 52, b = 25, a = 255}, {r = 255, g = 52, b = 25, a = 255}, "      [DEATH]", "cd")
    if nekoha3 then
        local logo2 = renderer.load_png(readfile("acheron/acheron_watermark.png"), 1, 1)
        renderer.texture(logo2, (77), (height/2 + 527) - 546, 50, 47, 255, 255, 255, 255, "f")
    elseif not anyerror then
        print("~ Failed to load Acheron watermark picture")
        print("~ Please try to delete Acheron folder in csgo dir, if problem still exist dm to support")
        anyerror = true
    end
end

local function watermark_type2()
    local branded1, branded2, branded3, branded4 = lua_menu.misc.watermark_color:get()
    local width, height = client.screen_size()
    text_fade_animation((width - 60), (height/2), -1, {r = branded1, g = branded2, b = branded3, a = branded4}, {r = 255, g = 255, b = 255, a = 255}, "            A C H E R O N", "cd")
    text_fade_animation((width - 51), (height/2) + 13, -0.65, {r = 255, g = 52, b = 25, a = 255}, {r = 255, g = 52, b = 25, a = 255}, "      [DEATH]", "cd")
    if nekoha3 then
        local logo2 = renderer.load_png(readfile("acheron/acheron_watermark.png"), 1, 1)
        renderer.texture(logo2, (width) - 127, (height/2) - 18, 50, 47, 255, 255, 255, 255, "f")
    elseif not anyerror then
        print("~ Failed to load Acheron watermark picture")
        print("~ Please try to delete Acheron folder in csgo dir, if problem still exist dm to support")
        anyerror = true
    end
end

local function watermark_type3()
    local branded1, branded2, branded3, branded4 = lua_menu.misc.watermark_color:get()
    text_fade_animation((x_ind/2) - 15, (screen_height) - 8, 1, {r = branded1, g = branded2, b = branded3, a = branded4}, {r = 255, g = 255, b = 255, a = 255}, "            A C H E R O N", "cd")
    text_fade_animation((x_ind/2) - 6, (screen_height) - 20, -0.65, {r = 255, g = 52, b = 25, a = 255}, {r = 255, g = 52, b = 25, a = 255}, "      [DEATH]", "cd")
end


lua_menu.misc.watermark:depend(visual_tab, {lua_menu.misc.cross_ind, false})
lua_menu.misc.watermark_type:depend(visual_tab, {lua_menu.misc.cross_ind, false})
local function ind()
    local esp1, esp2, esp3, esp4 = lua_menu.misc.esp_flags_color:get()
    local players = entity.get_players(true)
    for i = 1, #players do
        local player_index = players[i]
        local x1, y1, x2, y2, mult = entity.get_bounding_box(player_index)
        if plist.get(player_index, "Override prefer body aim") == "Force" then
            baim = 15
        else
            baim = 0
        end
        if plist.get(player_index, "Override safe point") == "On" then
            safe = 15
        else
            safe = 0
        end
        if x1 ~= nil and mult > 0 then
            y1 = y1 - 17
            x1 = x1 + ((x2 - x1) / 2)
            if y1 ~= nil then
                if plist.get(player_index, "Override prefer body aim") == "Force" then
                    renderer.text(x1 - safe, y1, esp1, esp2, esp3, esp4, "cdb", 0, "BAIM")
                end
                if plist.get(player_index, "Override prefer body aim") == "Force" and plist.get(player_index, "Override safe point") == "On" then
                    renderer.text(x1, y1, 255, 255, 255, 255, "cdb", 0, " + ")
                end
                if plist.get(player_index, "Override safe point") == "On" then
                    renderer.text(x1 + baim, y1, esp1, esp2, esp3, esp4, "cdb", 0, "SAFE")
                end
            end
        end
    end  
end


client.set_event_callback("paint", LPH_JIT(function()
        if not is_lua_loaded then return end

        if not lua_menu.main.enable:get() then
            return
        end

        if not entity.is_alive(entity.get_local_player()) then
            return
        end
        if lua_menu.misc.cross_ind:get() then
            if lua_menu.misc.cross_ind_type:get() == "Branded" then
                indicators_new()
            end
            if lua_menu.misc.cross_ind_type:get() == "Ideal yaw" then
                indicators_idealyaw()
            end
        elseif lua_menu.misc.watermark:get() then
            if lua_menu.misc.watermark_type:get() == "Left" then
                watermark_type1()
            elseif lua_menu.misc.watermark_type:get() == "Right" then
                watermark_type2()
            elseif lua_menu.misc.watermark_type:get() == "Bottom" then
                watermark_type3()
            end
        end
        if not lua_menu.misc.cross_ind:get() and not lua_menu.misc.watermark:get() then
            text_fade_animation(x_ind/2, y_ind-22, -0.4, {r=255, g=255, b=255, a=255}, {r=255, g=255, b=255, a=0}, "acheron", "cdc")
        end
        if lua_menu.misc.arrows:get() then
            arrows()
        end
        updatearrows()
        ragebot_logs()
        if lua_menu.misc.esp_flags:get() and lua_menu.misc.resolver_enabled:get() then
            ind() 
        end
        if lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("Statistic") then
            shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
            renderer.indicator(255, 255, 255, 200, string.format("%d / %d (%s)", #shots.hit, shots.missed[5], #shots.hit+shots.missed[5] ~= 0 and string.format("%.1f%%", (#shots.hit/(#shots.hit+shots.missed[5]))*100) or "0%"))
        end
end))



client.set_event_callback("shutdown", LPH_JIT(function()
        hide_original_menu(true)
        visible_menu()
end))

client.set_event_callback("round_prestart", LPH_JIT(function()
        if not is_lua_loaded then return end
        logs = {}
        if lua_menu.misc.log1:get() and lua_menu.misc.multibox4:get("On screen") then
            push_notify("Anti-Aim Data Resetted" .. "   ")
        end
    end))

local http = require "gamesense/http"
local callback = client.set_event_callback
local render = renderer
local screen_x, screen_y = client.screen_size()

render.round_rect = function(x, y, w, h, r, g, b, a, radius)
    y = y + radius
    local data_circle = {
        {x + radius, y, 180},
        {x + w - radius, y, 90},
        {x + radius, y + h - radius * 2, 270},
        {x + w - radius, y + h - radius * 2, 0}
    }

    local data = {
        {x + radius, y, w - radius * 2, h - radius * 2},
        {x + radius, y - radius, w - radius * 2, radius},
        {x + radius, y + h - radius * 2, w - radius * 2, radius},
        {x, y, radius, h - radius * 2},
        {x + w - radius, y, radius, h - radius * 2}
    }

    for _, data in next, data_circle do
        render.circle(data[1], data[2], r, g, b, a, radius, data[3], 0.25)
    end

    for _, data in next, data do
        render.rectangle(data[1], data[2], data[3], data[4], r, g, b, a)
    end
end

client.set_event_callback("net_update_end", is_defensive_active)
client.set_event_callback("net_update_end", is_defensive_active1)
client.set_event_callback("net_update_end", is_defensive_active3)
client.set_event_callback("net_update_end", is_defensive_active2)
