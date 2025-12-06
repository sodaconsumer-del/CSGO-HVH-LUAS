-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2


ffi.cdef [[
        void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);
        bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
        void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
        void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);
        bool DeleteUrlCacheEntryA(const char* lpszUrlName);
        typedef void*(__thiscall* get_client_entity_t)(void*, int);
        typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);
        int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);
        void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);
        int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);


        typedef struct
        {
            float x;
            float y;
            float z;
        } Vector_t;


        typedef struct
        {
            char    pad0[0x60]; // 0x00
            void* pEntity; // 0x60
            void* pActiveWeapon; // 0x64
            void* pLastActiveWeapon; // 0x68
            float        flLastUpdateTime; // 0x6C
            int            iLastUpdateFrame; // 0x70
            float        flLastUpdateIncrement; // 0x74
            float        flEyeYaw; // 0x78
            float        flEyePitch; // 0x7C
            float        flGoalFeetYaw; // 0x80
            float        flLastFeetYaw; // 0x84
            float        flMoveYaw; // 0x88
            float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground
            float        flLeanAmount; // 0x90
            char    pad1[0x4]; // 0x94
            float        flFeetCycle; // 0x98 0 to 1
            float        flMoveWeight; // 0x9C 0 to 1
            float        flMoveWeightSmoothed; // 0xA0
            float        flDuckAmount; // 0xA4
            float        flHitGroundCycle; // 0xA8
            float        flRecrouchWeight; // 0xAC
            Vector_t        vecOrigin; // 0xB0
            Vector_t        vecLastOrigin;// 0xBC
            Vector_t        vecVelocity; // 0xC8
            Vector_t        vecVelocityNormalized; // 0xD4
            Vector_t        vecVelocityNormalizedNonZero; // 0xE0
            float        flVelocityLenght2D; // 0xEC
            float        flJumpFallVelocity; // 0xF0
            float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1
            float        flRunningSpeed; // 0xF8
            float        flDuckingSpeed; // 0xFC
            float        flDurationMoving; // 0x100
            float        flDurationStill; // 0x104
            bool        bOnGround; // 0x108
            bool        bHitGroundAnimation; // 0x109
            char    pad2[0x2]; // 0x10A
            float        flNextLowerBodyYawUpdateTime; // 0x10C
            float        flDurationInAir; // 0x110
            float        flLeftGroundHeight; // 0x114
            float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing
            float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running
            char    pad3[0x4]; // 0x120
            float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1
            char    pad4[0x208]; // 0x128
            float        flMinBodyYaw; // 0x330
            float        flMaxBodyYaw; // 0x334
            float        flMinPitch; //0x338
            float        flMaxPitch; // 0x33C
            int            iAnimsetVersion; // 0x340
        } CCSGOPlayerAnimationState_534535_t;
    ]]

-- Defensive Variables


local spin_amn = 0
local def_stage = 1



local render_world_to_screen, rage_exploit, ui_get_binds, ui_get_alpha, entity_get_players, entity_get, entity_get_entities, entity_get_game_rules, common_set_clan_tag, common_is_button_down, common_get_username, common_get_date, ffi_cast, ffi_typeof, render_gradient, render_text, render_texture, render_rect_outline, render_rect, entity_get_local_player, ui_create, ui_get_style, ui_get_icon, math_floor, math_abs, math_max, math_ceil, math_min, math_random, utils_trace_bullet, render_screen_size, render_load_font, render_load_image_from_file, render_measure_text, render_poly, render_poly_blur, common_add_notify, common_add_event, utils_console_exec, utils_execute_after, utils_create_interface, utils_trace_line, ui_find, entity_get_threat, string_format =
    render.world_to_screen, rage.exploit, ui.get_binds, ui.get_alpha, entity.get_players, entity.get, entity
    .get_entities,
    entity.get_game_rules, common.set_clan_tag, common.is_button_down, common.get_username, common.get_date, ffi.cast,
    ffi.typeof, render.gradient, render.text, render.texture, render.rect_outline, render.rect, entity.get_local_player,
    ui.create, ui.get_style, ui.get_icon, math.floor, math.abs, math.max, math.ceil, math.min, math.random,
    utils.trace_bullet, render.screen_size, render.load_font, render.load_image_from_file, render.measure_text,
    render.poly,
    render.poly_blur, common.add_notify, common.add_event, utils.console_exec, utils.execute_after,
    utils.create_interface,
    utils.trace_line, ui.find, entity.get_threat, string.format

local base64 = require("neverlose/base64")
local clipboard = require("neverlose/clipboard")
local shell32 = ffi.load 'Shell32'
local urlmon = ffi.load 'UrlMon'
local wininet = ffi.load 'WinInet'
local get_lc = require("neverlose/get_lc")
local drag_system = require 'neverlose/drag_system'
local gradient = require 'neverlose/gradient'
local easing = require "neverlose/easing"
local renderer = require "neverlose/side_indicator"
local JSON = panorama.loadstring([[

    return {
    stringify: JSON.stringify,
    parse: JSON.parse
    };
    ]])()
local Download = function(from, to)
    wininet.DeleteUrlCacheEntryA(from)
    urlmon.URLDownloadToFileA(nil, from, to, 0, 0)
end


files.create_folder("nl\\lightsense")
Download("https://cdn.discordapp.com/attachments/839906710507880541/1019654524169900163/pixel.ttf",
    "nl\\lightsense\\Pixel.ttf")


local pixel_font = render.load_font("nl\\lightsense\\Pixel.ttf", 10, "ao")
local pixel_font_big = render.load_font("Verdana", 18, "ab")
local verdanab_bold = render.load_font("Verdana bold", 11, "ab")


local vmt_hook = require("neverlose/vmt_hook")

ffi.cdef [[
        typedef void*(__thiscall* get_client_entity_t)(void*, int);
    ]]

local function this_call(call_function, parameters)
    return function(...)
        return call_function(parameters, ...)
    end
end

math.lerp = function(name, value, speed)
    return name + (value - name) * globals.frametime * speed
end


icons = {
    home = ui.get_icon("home"),
    cog = ui.get_icon("cog"),
    user_cog = ui.get_icon("user-cog"),
    cogs = ui.get_icon("users-cog"),
    info = ui.get_icon("info-circle"),
    faq = ui.get_icon("question"),
    disc = ui.get_icon("user-check"),
    download = ui.get_icon("download"),
    shield = ui.get_icon("user-shield"),
    paint = ui.get_icon("palette"),
    logo = ui.get_icon("ship"),
    wrench = ui.get_icon("wrench"),
    useredit = ui.get_icon("user-edit"),
    folder = ui.get_icon("folder-open")
}


dYaw = 0
d_offset = 0
jitter = ""
refs = {}
refs.yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw")
refs.pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch")
refs.hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
refs.yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base")
refs.yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset")
refs.yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier")
refs.yaw_mod_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
refs.byaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw")
refs.inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter")
refs.left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit")
refs.right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit")
refs.options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options")
refs.fs_desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
--refs.byaw_os = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "On Shot")
--refs.lbymode = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "LBY Mode")
refs.hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
refs.doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
refs.fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
refs.sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk")
refs.baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
refs.scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
refs.defense_dt = ui.find("Aimbot", "Ragebot", "Main", "Double tap", "Lag Options")
refs.hs_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
refs.dtfl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit")
refs.defense_hs = ui.find("Aimbot", "Ragebot", "Main", "Hide shots", "Options")
refs.hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
refs.fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
refs.fs_disable = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers")
refs.fs_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")

refs.yaw_base2 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base")
refs.yaw_offset2 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset")

-- On Load
common.add_event("Thanks for using our script", home)
common.add_notify("Welcome to Lightsense", "Your gameplay will surely be brighter!")



miscellaneous = {
    username = "\a6190D4FF" .. common.get_username() .. "\a869BA7FF",
    version = "\a6190D4FFFlua\a869BA7FF",
    luaname = "\a6190D4FFlightsense\a869BA7FF"
    
}

groups = {
    generaltab = {
        main_group = ui.create(ui.get_icon("house").. " Global", icons.info .. "Welcome"),
        faq_group = ui.create(ui.get_icon("house").. " Global", icons.info .. "Information"),
    },
    antiaimtab = {
        antiaim_group = ui.create(ui.get_icon("shield-halved").." Anti-Aim", "Antiaim"),
        builder_group = ui.create(ui.get_icon("shield-halved").. " Anti-Aim", "Angles"),
        main_group = ui.create(ui.get_icon("shield-halved").. " Anti-Aim", "Preset Manager"),
        antibrute_group = ui.create(ui.get_icon("shield-halved").. " Anti-Aim", "Anti Bruteforce"),
    },
    visualtab = {
        visuals_group = ui.create(ui.get_icon("palette").." Visuals", "Visuals"),
        misc_group = ui.create(ui.get_icon("palette").." Visuals", "Modification"),
        ragbot_group = ui.create(ui.get_icon("palette").." Visuals", "Ragebot"),
        other_group = ui.create(ui.get_icon("palette").." Visuals", "Other Features"),
    }
}
local pui = require("neverlose/pui")

local aa_gradient_text = gradient.text_animate("Antiaim", -3, {
    color(255, 38, 38, 255),
    color(255, 255, 255, 255),
    color(0, 8, 255, 255)
})

local name_gradient_text = gradient.text_animate(common.get_username(), -3, {
    color(255, 38, 38, 255),
    color(255, 255, 255, 255),
    color(0, 8, 255, 255)
})

local lua_gradient_text = gradient.text_animate("lightsense.lua", -3, {
    color(255, 38, 38, 255),
    color(255, 255, 255, 255),
    color(0, 8, 255, 255)
})

local menu_gradient_text = gradient.text_animate("Choose", -3, {
    color(255, 38, 38, 255),
    color(255, 255, 255, 255),
    color(0, 8, 255, 255) -- 150, 150, 215
})

events.render:set(function()
    local gradient_animation = gradient.text_animate(" L I G H T S E N S E ", 1.45, {
        ui.get_style()["Link Active"],
        color(0, 0, 0, 255)

    })

    ui.sidebar(gradient_animation:get_animated_text(), "terminal")
    gradient_animation:animate()
end)




--HOME



    local upd = gradient.text_animate("December 11" , -3, {
        color(108,129,150),
        color(255,255,255)
    })
    
    local bld = gradient.text_animate("Dev", -3, {
        color(108,129,150),
        color(255,255,255)
    })
    
    local name = gradient.text_animate(""..common.get_username() , -3, {
        color(108,129,150),
        color(255,255,255)
    })
    
    local help = gradient.text_animate(" If you have any bugs/issues with our script, please join our discord." , -1, {
        color(108,129,150),
        color(255,255,255)
    })
    
    local watermark = gradient.text_animate("Information Panel" , -1, {
        color(108,129,150),
        color(255,255,255)
    })
    
    local pui = require("neverlose/pui")
  local mt = groups.generaltab.faq_group:label(
            "\a6C8196FF\affffffffHow to get \a6C8196FF\affffffffdiscord \a6C8196FFrole \affffffff »\n\n\a6C8196FF1. \affffffff \a6C8196FFJoin Our Discord\affffffff.\n\n\a6C8196FF2. \affffffffGo to the \a6C8196FF#ticket \affffffffchannel.\n\n\a6C8196FF3. \affffffffOpen a \a6C8196FFticket \afffffffffor support\n"
        )
    
    
   local welcome =   groups.generaltab.main_group:label(ui.get_icon("circle-user").." \aFFFFFFFFWelcome back, "..name:get_animated_text())
    local build = groups.generaltab.main_group:label(ui.get_icon("cloud").." \aFFFFFFFFCurrent build: \aE1DEFD99"..bld:get_animated_text())
    local update = groups.generaltab.main_group:label(ui.get_icon("clock").."  \aFFFFFFFFLast update: "..upd:get_animated_text())
   local dickhead = groups.generaltab.main_group:label(ui.get_icon("circle-question")..""..help:get_animated_text())
    
-- fonts

-- ANTIAIM
local antiaim_e = groups.antiaimtab.antiaim_group:switch(ui.get_icon("toggle-on").." Enable Anti-aim", false)
local condition = groups.antiaimtab.builder_group:combo(ui.get_icon("list").." State",
    { "Standing", "Moving", "Slowwalk", "Ducking", "In Air", "Air & Duck", "Duck & Walk"})


local fs_e = groups.antiaimtab.antiaim_group:switch(ui.get_icon("person-rays").." Freestanding")
local fs_e_ref = fs_e:create()
local fs_dis = fs_e_ref:switch("Disable Jitter")
local fs_bod = fs_e_ref:switch("Body Freestanding")

local manual_aa = groups.antiaimtab.antiaim_group:combo(ui.get_icon("arrows-spin").." Manual Antiaim", { "Disabled", "Left", "Right", "Forward" })
local animation_fuckers = groups.antiaimtab.antiaim_group:selectable(ui.get_icon("triangle-exclamation").." \aBFC26DFFAnim. Breakers",
    { 'Static legs in air', 'Follow direction', "Jitter Legs" }, 0)
local yaw = groups.antiaimtab.antiaim_group:combo(ui.get_icon("person").." Yaw Base", "At Target", "Static", "Disabled")
local dt_air = groups.antiaimtab.antiaim_group:combo(ui.get_icon("person-falling").." Defensive AA", { "Disabled", "Jumping", "LightSense", "Always" })


local function watermark()
    local gradient_animation = gradient.text_animate("L I G H T S E N S E ", -2.5, {
             color(125, 168, 255), 
             color(255, 255, 255)
   })

   render.text(1, vector(render.screen_size().x - 130, render.screen_size().y / 2), color(0, 0, 0), nil, "L I G H T S E N S E")
   render.text(1, vector(render.screen_size().x - 28, render.screen_size().y / 2), color(250, 167, 194), nil, "[DEV]")
   render.text(1, vector(render.screen_size().x - 130, render.screen_size().y / 2), color(0, 0, 0), nil, gradient_animation:get_animated_text())




 gradient_animation:animate()
end
events.render:set(watermark)

---VISUALS
local indicators_styles = groups.visualtab.visuals_group:combo(ui.get_icon("bug").." Indicators", { "Disabled","Modern"})
local indicators_styles_ref = indicators_styles:create()
local indicator_options = indicators_styles_ref:selectable("Options", {'Keybinds', 'Fancy stars', 'Animation'}, 0)
local indicator_padding = indicators_styles_ref:slider("Padding", 1,50,3)
--local indicator_primcolor = indicators_styles_ref:color_picker("Primary color", color(155, 168, 182, 255))
--local indicator_seccolor = indicators_styles_ref:color_picker("Second color", color())



local skeet_indicator = groups.visualtab.visuals_group:switch("500 Indicators", false)



local function sense_ind_func()
    y = 30

    local active_binds = ui.get_binds()

    
    

    for i in pairs(active_binds) do
        if active_binds[i].name == "Fake Latency" then
            if active_binds[i].active then
                renderer.indicator(color(), "\a74C029FFPING",  y, true)
                y = y - 35
            end
        end

        if active_binds[i].name == "Hit Chance" then
            if active_binds[i].active then
                renderer.indicator(color(255, 255, 255, 255), "HC: "..ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):get(),  y, true)
                y = y - 35
            end
        end

        if active_binds[i].name == "Min. Damage" then
            if active_binds[i].active then
                renderer.indicator(color(255, 255, 255, 255), "DMG: "..ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get(),  y, true)
                y = y - 35
            end
        end
    end

    if ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):get() == "Force" then
        renderer.indicator(color(255, 255, 255, 255), "SAFE",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):get() == "Force" then
        renderer.indicator(color(255, 255, 255, 255), "BAIM",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
        renderer.indicator(color(255, 255, 255, 255), "DUCK",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
        renderer.indicator(color(255, 255, 255, 255), "FS",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
        renderer.indicator(color(255, 255, 255, 255), "OSAA",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
        renderer.indicator(color(255, 255*rage.exploit:get(), 255*rage.exploit:get(), 255), "DT",  y, true)
        y = y - 35
    end

    if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get() then
        renderer.indicator(color(255, 255, 255, 255), "DA",  y, true)
        y = y - 35
    end
end



local widgets = groups.visualtab.visuals_group:selectable(ui.get_icon("images").." Widgets", { 'Keybinds', 'Spectator list'}, 0)
local widgets_ref = widgets:create()
local accent_col = widgets_ref:color_picker(ui.get_icon("palette").." Accent color", color(255, 255, 255, 255))




---MISC
local logs_option = groups.visualtab.misc_group:selectable(ui.get_icon("comment").." Logs Options", { 'Console', 'Screen', 'Under Crosshair' }, 0)
local custom_scope = groups.visualtab.misc_group:switch(ui.get_icon("stethoscope").." Better Scope Overlay", false)
local scope_ref = custom_scope:create()
local scope_inverted = scope_ref:switch("Inverted", false)
local scope_gap = scope_ref:slider("Gap", 0, 500, 100)
local scope_size = scope_ref:slider("Size", 0, 500, 100)


local scope_color = scope_ref:color_picker("Color", color())



local warmup_func = groups.visualtab.other_group:switch(ui.get_icon("brake-warning").." Advanced Warmup")
local warmup_func_ref = warmup_func:create()
local warmup_def = warmup_func_ref:button("Default setts",
    function()
        if warmup_func:get() then
            utils.console_exec(
                "sv_airaccelerate 100;mp_ignore_round_win_conditions 1;mp_roundtime_defuse 1337;mp_roundtime_hostage 60;mp_roundtime 60;mp_restartgame 1;mp_respawn_on_death_ct 1;mp_respawn_on_death_t 1;bot_kick;Mp_freezetime 1; mp_buy_anywhere 1;sv_infinite_ammo 1;mp_buytime 20000000000;mp_maxmoney 65535;mp_startmoney 65535;god;mp_warmup_end;god")
        end
    end)
local warmup_add_ct = warmup_func_ref:button(ui.get_icon("robot").." CT bot",
    function() if warmup_func:get() then utils.console_exec("bot_add_ct") end end)
local warmup_add_t = warmup_func_ref:button(ui.get_icon("robot").." T bot",
    function() if warmup_func:get() then utils.console_exec("bot_add_t") end end)

local killsay = groups.visualtab.misc_group:switch(ui.get_icon("comment").." Trash Talk", false)
local killsay_ref = killsay:create()
local ui_selectable = killsay_ref:selectable("TrashTalk", "Death", "Kill")

local enabled = groups.visualtab.misc_group:switch(ui.get_icon("marker").." Hitmarker 3D", true)
local enabled_ref = enabled:create()
local clr = enabled_ref:color_picker("Color", color(88, 255, 209, 255))

local aspect_switch = groups.visualtab.misc_group:switch(ui.get_icon("glasses").." Aspect Ratio")
local aspect_switch_ref = aspect_switch:create()
local aspect_slider = aspect_switch_ref:slider("Sensitivity", 1, 30, 1.4, 0.1)
aspect_slider:set(1.6)
local unmute_players = groups.visualtab.misc_group:switch(ui.get_icon("volume").." Unmute Silenced Players", false)
local clear_round = groups.visualtab.misc_group:switch(ui.get_icon("barcode").." Clear Console After Round", false)
local switch_fps = groups.visualtab.misc_group:switch(ui.get_icon("film").." Boost Framerate")
local ctag = groups.visualtab.misc_group:switch(ui.get_icon("user-tag").." Clantag")
local avoid_knife = groups.antiaimtab.antiaim_group:switch(ui.get_icon("knife").." Avoid Backstab")


---RAGEBOT
local jumpfix = groups.visualtab.other_group:switch(ui.get_icon("person-rifle").." Jumpscout Fix")
local revolver_helper = groups.visualtab.other_group:switch(ui.get_icon("gun").." Revolver Helper")
local teleport = groups.visualtab.other_group:switch(ui.get_icon("watch").." Automatically Teleport", false)
local teleport_ref = teleport:create()
local baim_lethal = groups.visualtab.other_group:switch(ui.get_icon("shield-halved").." Automatic Baim")
baim_lethal:tooltip("If you enable this function, if the enemy is baimable it will automaticly baim him so you wont miss.")



events.render:set(function()
    autostrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")

    local localplayer = entity.get_local_player()
    if not localplayer then return end

    local vel = localplayer.m_vecVelocity
    local speed = math.sqrt(vel.x * vel.x + vel.y * vel.y)

    if jumpfix:get() then
        autostrafe:override(math.floor(speed) > 15)
    end
end)

events.render:set(function()


    if switch_fps:get() then
        cvar.r_shadows:int(0)
        cvar.cl_csm_static_prop_shadows:int(0)
        cvar.cl_csm_shadows:int(0)
        cvar.cl_csm_world_shadows:int(0)
        cvar.cl_foot_contact_shadows:int(0)
        cvar.cl_csm_viewmodel_shadows:int(0)
        cvar.cl_csm_rope_shadows:int(0)
        cvar.cl_csm_sprite_shadows:int(0)
        cvar.r_dynamic:int(0)
        cvar.cl_autohelp:int(0)
        cvar.r_drawparticles:int(0)
        cvar.r_eyesize:int(0)
        cvar.r_eyeshift_z:int(0)
        cvar.r_eyeshift_y:int(0)
        cvar.r_eyeshift_x:int(0)
        cvar.r_eyemove:int(0)
        cvar.r_eyegloss:int(0)
        cvar.r_drawtracers_firstperson:int(0)
        cvar.r_drawtracers:int(0)
        cvar.fog_enable_water_fog:int(0)
        cvar.mat_postprocess_enable:int(0)
        cvar.cl_disablefreezecam:int(0)
        cvar.cl_freezecampanel_position_dynamic:int(0)
        cvar.r_drawdecals:int(0)
        cvar.muzzleflash_light:int(0)
        cvar.r_drawropes:int(0)
        cvar.r_drawsprites:int(0)
        cvar.cl_disablehtmlmotd:int(0)
        cvar.cl_freezecameffects_showholiday:int(0)
        cvar.m_rawinput:int(0)
        cvar.cl_bob_lower_amt:int(0)
        cvar.cl_detail_multiplier:int(0)
        cvar.mat_drawwater:int(0)
        cvar.cl_foot_contact_shadows:int(0)
        cvar.func_break_max_pieces:int(0)
    else
        cvar.r_shadows:int(1)
        cvar.cl_csm_static_prop_shadows:int(1)
        cvar.cl_csm_shadows:int(1)
        cvar.cl_csm_world_shadows:int(1)
        cvar.cl_foot_contact_shadows:int(1)
        cvar.cl_csm_viewmodel_shadows:int(1)
        cvar.cl_csm_rope_shadows:int(1)
        cvar.cl_csm_sprite_shadows:int(1)
        cvar.r_dynamic:int(1)
        cvar.cl_autohelp:int(1)
        cvar.r_drawparticles:int(1)
        cvar.r_eyesize:int(1)
        cvar.r_eyeshift_z:int(1)
        cvar.r_eyeshift_y:int(1)
        cvar.r_eyeshift_x:int(1)
        cvar.r_eyemove:int(1)
        cvar.r_eyegloss:int(1)
        cvar.r_drawtracers_firstperson:int(1)
        cvar.r_drawtracers:int(1)
        cvar.fog_enable_water_fog:int(1)
        cvar.mat_postprocess_enable:int(1)
        cvar.cl_disablefreezecam:int(1)
        cvar.cl_freezecampanel_position_dynamic:int(1)
        cvar.r_drawdecals:int(1)
        cvar.muzzleflash_light:int(1)
        cvar.r_drawropes:int(1)
        cvar.r_drawsprites:int(1)
        cvar.cl_disablehtmlmotd:int(1)
        cvar.cl_freezecameffects_showholiday:int(1)
        cvar.m_rawinput:int(1)
        cvar.cl_bob_lower_amt:int(1)
        cvar.cl_detail_multiplier:int(1)
        cvar.mat_drawwater:int(1)
        cvar.cl_foot_contact_shadows:int(1)
        cvar.func_break_max_pieces:int(1)
    end
end)

function gradient_anim(color1, color2, text, speed)
    local r1, g1, b1 = color1.r, color1.g, color1.b
    local r2, g2, b2 = color2.r, color2.g, color2.b
    local highlight_fraction = (globals.realtime / 2 % 0.8 * speed) - 1.5
    local output = ""
    for idx = 1, #text do
        local character = text:sub(idx, idx)
        local character_fraction = idx / #text
        local r, g, b = r1, g1, b1
        local highlight_delta = (character_fraction - highlight_fraction)
        if highlight_delta >= 0.2 and highlight_delta <= 1.5 then
            if highlight_delta > 0.8 then
                highlight_delta = 1.5 - highlight_delta
            end
            local r_fraction, g_fraction, b_fraction = r2 - r, g2 - g, b2 - b
            r = r + r_fraction * highlight_delta
            g = g + g_fraction * highlight_delta
            b = b + b_fraction * highlight_delta
        end
        output = output .. ('\a%0x%0x%0x%0x%s'):format(r, g, b, 255, text:sub(idx, idx))
    end
    return output
end

local screensize = render.screen_size()
local x = screensize.x / 2
local y = screensize.y / 2
local x_add_lua = 0
local x_add_dt = 0
local x_add_os = 0

local function animation_indicators(check, start_val, end_val, speed)
    if check then
        return math.max(start_val + (end_val - start_val) * globals.frametime * speed, 0)
    else
        return math.max(start_val - (end_val + start_val) * globals.frametime * speed / 2, 0)
    end
end

local function indicators()
    local lp = entity.get_local_player()
    if not lp then return end
    if not lp:is_alive() then return end
    if lp.m_fFlags == 263 then
        modern_cond = "DUCK"
    elseif lp.m_vecVelocity:length2d() < 5 then
        modern_cond = "STAY"
    elseif lp.m_fFlags == 256 or lp.m_fFlags == 262 then
        modern_cond = "AIR"
    elseif lp.m_vecVelocity:length2d() <= 94 then
        modern_cond = "SLOW"
    elseif lp.m_vecVelocity:length2d() >= 95 then
        modern_cond = "RUN"
    end

    if lp.m_fFlags == 263 then
        zov_cond = "- CROCUHING -"
    elseif lp.m_vecVelocity:length2d() < 5 then
        zov_cond = "- STANDING -"
    elseif lp.m_fFlags == 256 then
        zov_cond = "- JUMPING -"
    elseif lp.m_fFlags == 262 then
        zov_cond = "- JUMPING -"
    elseif refs.sw:get() and lp.m_vecVelocity:length2d() >= 90 then
        zov_cond = "- SLOWWALK -"
    elseif lp.m_vecVelocity:length2d() >= 100 then
        zov_cond = "- MOVING -"
    end

    if lp.m_fFlags == 263 then
        verdana_cond = "CROCUHING"
    elseif lp.m_vecVelocity:length2d() < 5 then
        verdana_cond = "STANDING"
    elseif lp.m_fFlags == 256 then
        verdana_cond = "JUMPING"
    elseif lp.m_fFlags == 262 then
        verdana_cond = "JUMPING"
    elseif refs.sw:get() and lp.m_vecVelocity:length2d() >= 90 then
        verdana_cond = "SLOWWALK"
    elseif lp.m_vecVelocity:length2d() >= 100 then
        verdana_cond = "MOVING"
    end

    local charge = rage.exploit:get()

    local scoped = lp.m_bIsScoped

    x_add_lua = animation_indicators(scoped, x_add_lua, 23, 10) or 0
    x_add_dt = animation_indicators(scoped, x_add_dt, 27, 10) or 0
    x_add_os = animation_indicators(scoped, x_add_os, 20, 10) or 0

    y_add = 0

    if indicators_styles:get() == "NOT READY" then
        local alpha = math.sin(globals.realtime * 3) * 127 + 127.5 
        local chrg = rage.exploit:get()
        local lp = entity.get_local_player()
        alpha = math.max(alpha, 20)
        if indicator_options:get("Fancy stars") then
            render.text(1, vector(x + x_add_lua, y + 6 + indicator_padding:get() + y_add), color(indicator_seccolor:get().r, indicator_seccolor:get().g, indicator_seccolor:get().b, alpha), "c", "✩₊˚.⋆☾⋆⁺₊✧")
        end
            render.text(pixel_font, vector(x - 17 + x_add_lua, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "lightsense")
            
        if indicator_options:get("Animation") then
            render.text(pixel_font, vector(x + 8 + x_add_lua, y + 17 + indicator_padding:get() + y_add), color(indicator_seccolor:get().r, indicator_seccolor:get().g, indicator_seccolor:get().b, alpha), "c", "  .lua")
            y_add = y_add + 9
 
        end

        render.text(2, vector(x + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", zov_cond)
        y_add = y_add + 9

        if refs.doubletap:get() and indicator_options:get("Keybinds") then
            if chrg == 1 then
                render.text(pixel_font, vector(x - 12.5 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "DT")
                render.text(pixel_font, vector(x + 5.8 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c",
                    "Ready")
            else
                render.text(pixel_font, vector(x - 12.5 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "DT")
                render.text(pixel_font, vector(x + 7.8 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(220, 91, 91, 255), "c",
                    "Wating")
            end
            y_add = y_add + 9
        end
        if refs.hideshots:get() and indicator_options:get("Keybinds") then
            render.text(pixel_font, vector(x - 12 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "HS")
            render.text(pixel_font, vector(x + 6 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "Ready")
            y_add = y_add + 9
        end
        if lp:is_dormant() then
            render.text(pixel_font, vector(x + 1 + x_add_dt, y + 17 + indicator_padding:get() + y_add), color(91, 220, 104, 255), "c", "Dormant")
        end
    end

    if indicators_styles:get() == "Modern" then
        local alpha = math.sin(globals.realtime * 3) * 127 + 127.5
        alpha = math.max(alpha, 40)
        if indicator_options:get("Fancy stars") then
            render.text(1, vector(x + x_add_lua, y + 7 + indicator_padding:get() + y_add), color(color(194, 158, 247).r, color(161, 97, 255).g, color(225, 204, 255).b, alpha), "c", "✩₊˚.⋆☾⋆⁺₊✧")
        end

        render.text(1, vector(x + x_add_lua, y + 17 + indicator_padding:get() + y_add), color(194, 158, 247), "c", "lightsense")
        y_add = y_add + 11
        
        if indicator_options:get("Animation") then
            render.text(1, vector(x + x_add_lua, y + 17 + indicator_padding:get() + y_add), color(color(187, 141, 252).r, color(225, 204, 255).g, color(225, 204, 255).b, alpha), "c", "Dev")
        else
            render.text(1, vector(x + x_add_lua, y + 20 + indicator_padding:get() + y_add), color(225, 204, 255), "c", "Dev")
            y_add = y_add + 10
        end

    if indicator_options:get("Keybinds") then
        if refs.doubletap:get() then
            render.text(1, vector(x + x_add_os, y + 28 + indicator_padding:get() + y_add), color(255, 156, 194), "c", "dt")
            y_add = y_add + 10
        end
        if refs.hideshots:get() and not refs.doubletap:get() then
            render.text(1, vector(x + x_add_os, y + 28 + indicator_padding:get() + y_add), color(255, 156, 194), "c", "hs")
            y_add = y_add + 10
        end

        if refs.fs:get() then
            render.text(1, vector(x + x_add_os, y + 28 + indicator_padding:get() + y_add), color(174, 209, 235), "c", "fs")
            y_add = y_add + 10
        end
    end
end
end

function lerpx(time, a, b) return a * (1 - time) + b * time end

local renderer = {}; do
    renderer.rect = function(vec1, vec2, ...)
        render.rect(vec1, vec1 + vec2, ...)
    end
    renderer.rect_outline = function(vec1, vec2, ...)
        render.rect_outline(vec1, vec1 + vec2, ...)
    end
    renderer.gradient = function(vec1, vec2, ...)
        render.gradient(vec1, vec1 + vec2, ...)
    end
    renderer.push_clip = function(vec1, vec2, ...)
        render.push_clip_rect(vec1, vec1 + vec2, ...)
    end
    renderer.pop_clip = function()
        render.pop_clip_rect()
    end
end

local solus_box = function(vec1, vec2, box_clr, line_clr, line_width, rounding)
    local half = vector(1, 2)
    renderer.rect(vec1, vec2, box_clr, rounding)
    renderer.push_clip(vec1, vec2 / half)
    renderer.rect_outline(vec1, vec2, line_clr, line_width, rounding)
    renderer.pop_clip()
    renderer.gradient(vector(vec1.x, vec1.y + vec2.y / 2), vector(math.max((line_width - 1), 1), vec2.y / 2 - rounding), line_clr, line_clr, color(0, 0), color(0, 0))
    renderer.gradient(vector(vec1.x + vec2.x - math.max((line_width - 1), 1), vec1.y + vec2.y / 2), vector(math.max((line_width - 1), 1), vec2.y / 2 - rounding), line_clr, line_clr, color(0, 0), color(0, 0))
end

local window = function(x, y, w, h, name, g_alpha, line_width, rounding)
    local clr = accent_col:get()
    solus_box(vector(x, y), vector(w, h), color(0, g_alpha / 4), clr:alpha_modulate(g_alpha), line_width or 1, rounding or 7)
    local size = render.measure_text(1, nil, name)
    render.text(1, vector(x + w / 2, y + h / 2), color(255, g_alpha), 'c', name)
end


local x, y, alphabinds, alpha_k, width_k, width_ka, data_k, width_spec = render.screen_size().x, render.screen_size().y,
    0, 1, 0, 0, { [''] = { alpha_k = 0 } }, 1

local pos_x = groups.visualtab.visuals_group:slider("posx", 0, x, 150)
local pos_y = groups.visualtab.visuals_group:slider("posy", 0, y, 150)
local pos_x1 = groups.visualtab.visuals_group:slider("posx1", 0, x, 250)
local pos_y1 = groups.visualtab.visuals_group:slider("posy1", 0, y, 250)

local new_drag_object1 = drag_system.register({ pos_x, pos_y }, vector(120, 60), "Test", function(self)
    if widgets:get('Keybinds') then
        local max_width = 0
        local frametime = globals.frametime * 16
        local add_y = 0
        local total_width = 160
        local active_binds = {}

        local binds = ui.get_binds()
        for i = 1, #binds do
            local bind = binds[i]
            local get_mode = binds[i].mode == 1 and 'holding' or (binds[i].mode == 2 and 'toggled') or '[?]'
            local get_value = binds[i].value
            local c_name = binds[i].name
            
            if c_name == 'Peek Assist' then c_name = 'Quick peek assist' end
            if c_name == 'Edge Jump' then c_name = 'Jump at edge' end
            if c_name == 'Hide Shots' then c_name = 'On shot anti-aim' end
            if c_name == 'Minimum Damage' then c_name = 'Minimum damage' end
            if c_name == 'Fake Latency' then c_name = 'Ping spike' end
            if c_name == 'Fake Duck' then c_name = 'Duck peek assist' end
            if c_name == 'Safe Points' then c_name = 'Safe point' end
            if c_name == 'Body Aim' then c_name = 'Body aim' end
            if c_name == 'Double Tap' then c_name = 'Double tap' end
            if c_name == 'Yaw Base' then c_name = 'Manual override' end
            if c_name == 'Slow Walk' then c_name = 'Slow motion' end

            
            local bind_state_size = render.measure_text(1, "", get_mode)
            local bind_name_size = render.measure_text(1, "", c_name)
            if data_k[bind.name] == nil then data_k[bind.name] = { alpha_k = 0 } end
            data_k[bind.name].alpha_k = lerpx(frametime, data_k[bind.name].alpha_k, (bind.active and 255 or 0))

            if widgets:get() == 'keybinds' or widgets:get() == 'Spectator list' then
                render.text(1, vector(self.position.x + 3, self.position.y + 19 + add_y),
                    color(255, data_k[bind.name].alpha_k), '', c_name)

                if c_name == 'Minimum damage' or c_name == 'Ping spike' then
                    render.text(1,
                        vector(
                            self.position.x + (width_ka - bind_state_size.x) - render.measure_text(1, nil, get_value).x +
                            28,
                            self.position.y + 19 + add_y), color(255, data_k[bind.name].alpha_k), '',
                        '[' .. get_value .. ']')
                else
                    render.text(1,
                        vector(self.position.x + (width_ka - bind_state_size.x - 8), self.position.y + 19 + add_y),
                        color(255, data_k[bind.name].alpha_k), '', '[' .. get_mode .. ']')
                end
            else
                render.text(1, vector(self.position.x + 3, self.position.y + 22 + add_y),
                    color(255, data_k[bind.name].alpha_k), '', c_name)

                if c_name == 'Minimum damage' or c_name == 'Ping spike' then
                    render.text(1,
                        vector(
                            self.position.x + (width_ka - bind_state_size.x) - render.measure_text(1, nil, get_value).x +
                            28,
                            self.position.y + 22 + add_y), color(255, data_k[bind.name].alpha_k), '',
                        '[' .. get_value .. ']')
                else
                    render.text(1,
                        vector(self.position.x + (width_ka - bind_state_size.x - 8), self.position.y + 22 + add_y),
                        color(255, data_k[bind.name].alpha_k), '', '[' .. get_mode .. ']')
                end
            end

            add_y = add_y + 16 * data_k[bind.name].alpha_k / 255

            local width_k = bind_state_size.x + bind_name_size.x + 18
            if width_k > 130 - 11 then
                if width_k > max_width then
                    max_width = width_k + 7
                end
            end

            if binds.active then
                table.insert(active_binds, binds)
            end
        end

        alpha_k = lerpx(frametime, alpha_k, (ui.get_alpha() > 0 or add_y > 0) and 1 or 0)
        width_ka = lerpx(frametime, width_ka, math.max(max_width, 130 - 2))
        if ui.get_alpha() > 0 or add_y > 6 then
            alphabinds = lerpx(frametime, alphabinds, math.max(ui.get_alpha() * 255, (add_y > 1 and 255 or 0)))
        elseif add_y < 15.99 and ui.get_alpha() == 0 then
            alphabinds = lerpx(frametime, alphabinds, 0)
        end
        if ui.get_alpha() or #active_binds > 0 then
            window(self.position.x, self.position.y, width_ka, 20, 'keybinds', alphabinds)
        end
    end
end)

local fnay = render.load_image(
    network.get("https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg"),
    vector(50, 50))

local new_drag_object2 = drag_system.register({ pos_x1, pos_y1 }, vector(120, 60), "Test2", function(self)
    if widgets:get('Spectator list') then
        local width_spec = 120
        if width_spec > 160 - 11 then
            if width_spec > max_width then
                max_width = width_spec
            end
        end

        if ui.get_alpha() > 0.3 or (ui.get_alpha() > 0.3 and not globals.is_in_game) then
            window(self.position.x,
                self.position.y, width_spec, 20, 'spectators', 255)
        end

        local me = entity.get_local_player()
        if me == nil then return end

        local speclist = me:get_spectators()

        if me.m_hObserverTarget and (me.m_iObserverMode == 4 or me.m_iObserverMode == 5) then
            me = me.m_hObserverTarget
        end

        local speclist = me:get_spectators()
        if speclist == nil then return end
        for idx, player_ptr in pairs(speclist) do
            local name = player_ptr:get_name()
            local tx = render.measure_text(1, '', name).x
            name_sub = string.len(name) > 17 and string.sub(name, 0, 17) .. "..." or name;
            local avatar = player_ptr:get_steam_avatar()
            if (avatar == nil or avatar.width <= 5) then avatar = fnay end

            if player_ptr:is_bot() and not player_ptr:is_player() then goto skip end
            render.text(1, vector(self.position.x + 17, self.position.y + 7 + (idx * 15)), color(), 'u', name_sub)
            render.texture(avatar, vector(self.position.x + 1, self.position.y + 7 + (idx * 15)), vector(12, 12), color(),
                'f', 0)
            ::skip::
        end


        if #me:get_spectators() > 0 or (me.m_iObserverMode == 4 or me.m_iObserverMode == 5) then
            window(self.position.x, self.position.y, width_spec, 20, 'spectators', 255)
        end
    end
end)

events.render:set(function()
    pos_x:visibility(false)
    pos_y:visibility(false)
    pos_x1:visibility(false)
    pos_y1:visibility(false)

    new_drag_object1:update()
    new_drag_object2:update()


    if warmup_func:get() then
        warmup_def:visibility(true)
        warmup_add_ct:visibility(true)
        warmup_add_t:visibility(true)
    else
        warmup_def:visibility(false)
        warmup_add_ct:visibility(false)
        warmup_add_t:visibility(false)
    end
end)

events.mouse_input:set(function()
    if ui.get_alpha() > 0.3 then return false end
end)



local revolver_text = esp.enemy:new_text("lightsense` | Revolver Helper", "DMG", function(player)
    local local_player = entity.get_local_player()
    if not local_player then return end
    local weapon = local_player:get_player_weapon()
    if not weapon then return end
    local index = weapon:get_weapon_index()
    if index == 64 then
        if player ~= nil and player:is_player() then
            local local_player = entity.get_local_player()
            if local_player == nil then return "DMG" end
            local local_origin = local_player.m_vecOrigin
            local player_origin = player.m_vecOrigin
            if local_origin == nil or player_origin == nil then return "DMG" end

            local dist = local_origin:dist2d(player_origin)
            local health = player.m_iHealth
            local armor = player.m_ArmorValue
            local damage = 115

            if armor > 0 then
                damage = damage * 0.5 -- Reduce damage if the enemy has armor
            end

            if dist > 5000 then
                damage = damage * 0.85 -- Reduce damage at long range
            end

            if health <= damage then
                return "DMG+"
            else
                return "DMG"
            end
        end
    end
end)


local lightsenseLogs = {}

local function lightsenselogssystem()
    local logs = lightsenseLogs.logs or {}
    local screen_size = render.screen_size()
    local offset, x, y = 0, screen_size.x / 2, screen_size.y / 1.4
    local pulseSpeed = 1.5
    local alpha = 255
    local max = 6
    local rounding = 4
    local item_offset = 2
    local padding = 4
    local scale = 0.55
    local fraction = 0.5

    for idx, data in ipairs(logs) do
        local elapsedTime = globals.curtime - data[3]

        if elapsedTime < 4.0 and not (#logs > max and idx < #logs - max) then
            data[2] = math.lerp(data[2], 255, 10)
        else
            data[2] = math.lerp(data[2], 0, 10)
        end

        local pulseValue = alpha
        local offsetIncrement = 20 * (data[2] / 255)
        offset = offset + offsetIncrement * scale + 4

        local text_size = render.measure_text(1, "od", data[1])
        local h_offset = (text_size.y + item_offset) * fraction

        local textPosition = vector(x + 9 - text_size.x / 2, y - offset)
        local alphaValue = data[2] / 255

        local textColor
        if elapsedTime > 3.0 then
            textColor = color(255, 0, 0, alphaValue * alpha)
        else
            textColor = color(255, 255, 255, alphaValue * alpha)
        end

        render.text(1, textPosition, textColor, "od", data[1])

        if data[2] < 0.1 or not entity.get_local_player() then
            table.remove(logs, idx)
        end
    end

    lightsenseLogs.logs = logs
end

local function renderthisshit(text, size)
    local logs = lightsenseLogs.logs or {}
    table.insert(logs, { text, 2, globals.curtime, size })
    lightsenseLogs.logs = logs
end 

local function clearLogs()
    lightsenseLogs.logs = {}
end




events.render:set(function()
    if revolver_helper:get() then
        revolver_text:set(true)
    else
        revolver_text:set(false)
    end
    lightsenselogssystem()
end)






function console_logs_print(ack)
    hitgroup_str = {
        [0] = 'generic',
        'head',
        'chest',
        'stomach',
        'left arm',
        'right arm',
        'left leg',
        'right leg',
        'head',
        'generic',
        'gear'
    }

    hitbox = hitgroup_str[ack.hitgroup]
    damage = ack.damage or 0
    hitchance = ack.hitchance
    backtrack = ack.backtrack
    wanted_damage = ack.wanted_damage
    wanted_hitbox = hitgroup_str[ack.wanted_hitgroup]
    reason = ack.state
    name = ack.target:get_name()



    mismatch_damage = " (+0)"
    if damage > wanted_damage then
        mismatch_damage = " (+" .. damage - wanted_damage .. ")"
    end
    if damage < wanted_damage then
        mismatch_damage = " (-" .. wanted_damage - damage .. ")"
    end

    if hitbox ~= wanted_hitbox then
        mismatch_hitbox = "(-" .. wanted_hitbox .. ")"
    else
        mismatch_hitbox = ""
    end

    hit = false
    unregistered = false
    missed = false

    if reason == nil then
        if damage > -1 then
            hit = true
        else
            if damage < 0 then
                unregistered = true
            end
        end
    end

    if reason ~= nil then
        missed = true
    end

    if hit == true and logs_option:get('Under Crosshair') then
        renderthisshit(("\aA1FF8FFF[lightsense] \aDEFAULT | Hit %s's %s%s for %s%s damage (%s%s) | (%s ticks)")
        :format(name, hitbox, mismatch_hitbox, damage, mismatch_damage, hitchance, "hc", backtrack))
    end

    if hit == true and logs_option:get('Console') then
        print_raw(("[lightsense] \aDEFAULT | Hit %s's %s%s for %s%s damage (%s%s) | (%s ticks)")
            :format(name, hitbox, mismatch_hitbox, damage, mismatch_damage, hitchance, "hc", backtrack)) --, targetname, hitbox, hitchance, damage))
    end

    if hit == true and logs_option:get('Screen') then
        print_dev(("[lightsense] \aDEFAULT | Hit %s's %s%s for %s%s damage (%s%s) | (%s ticks)"):format(name,
            hitbox, mismatch_hitbox, damage, mismatch_damage, hitchance, "hc", backtrack))
    end
    if missed == true and logs_option:get('Console') then
        print_raw(("[lightsense] \aDEFAULT | Missed %s's %s for %s damage (%s%s) due to %s | (%s ticks)")
            :format(name, wanted_hitbox, wanted_damage, hitchance, "hc", reason, backtrack)) --, targetname, hitbox, hitchance, damage))
    end
    if missed == true and logs_option:get('Screen') then
        print_dev(("[lightsense] \aDEFAULT | Missed %s's %s for %s damage (%s%s) due to %s | (%s ticks)"):format(
            name, wanted_hitbox, wanted_damage, hitchance, "hc", reason, backtrack))
    end

    if missed == true and logs_option:get('Under Crosshair') then
        renderthisshit(("\aE42F2FFF[lightsense] \aDEFAULT | Missed %s's %s for %s damage (%s%s) due to %s | (%s ticks)"):format(
            name, wanted_hitbox, wanted_damage, hitchance, "hc", reason, backtrack))
    end

    if unregistered == true and logs_option:get('Console') then
        print_raw(("[lightsense] \aDEFAULT | Missed %s's %s for %s damage (%s%s) due to unregistered shot | (%s ticks)")
            :format(name, wanted_hitbox, wanted_damage, hitchance, "hc", backtrack)) --, targetname, hitbox, hitchance, damage))
    end

    if unregistered == true and logs_option:get('Screen') then
        print_dev(("[lightsense] \aDEFAULT | Missed %s's %s for %s damage (%s%s) due to unregistered shot | (%s ticks)")
            :format(name, wanted_hitbox, wanted_damage, hitchance, "hc", backtrack))
    end
end



function baim_if_lethal()
    if baim_lethal:get() then
        local lp = entity.get_local_player()
        local weapon = lp:get_player_weapon()
        local weapon_id = weapon:get_weapon_index()

        if not lp or not lp:is_alive() then
            return
        end

        if weapon == nil or false then
            return
        end

        threat = entity.get_threat()
        if not threat then
            return
        end

        if weapon_id == 40 then
            hp = threat.m_iHealth

            if hp <= 90 and hp > 0 then
                refs.baim:override("Force")
            elseif hp > 90 then
                refs.baim:override("prefer")
            end
        end
    end
end

local function better_scope()
    if not custom_scope:get() then return end
    if not entity.get_local_player() then return end
    if not entity.get_local_player():is_alive() then return end
    local r, g, b, a = scope_color:get().r, scope_color:get().b, scope_color:get().g, scope_color:get().a
    local inverted = scope_inverted:get()
    local screen_size_x = render.screen_size().x
    local screen_size_y = render.screen_size().y
    refs.scope:set("Remove All")
    if entity.get_local_player().m_bIsScoped then
        render.gradient(vector(screen_size_x / 2 + scope_gap:get() + 1, screen_size_y / 2),
            vector(screen_size_x / 2 + scope_gap:get() + scope_size:get() + 1, screen_size_y / 2 + 1),
            color(r, g, b, not inverted and a or 0), color(r, g, b, inverted and a or 0),
            color(r, g, b, not inverted and a or 0), color(r, g, b, inverted and a or 0)) --right
        render.gradient(vector(screen_size_x / 2 - scope_gap:get(), screen_size_y / 2),
            vector(screen_size_x / 2 - scope_gap:get() - scope_size:get(), screen_size_y / 2 + 1),
            color(r, g, b, not inverted and a or 0), color(r, g, b, inverted and a or 0),
            color(r, g, b, not inverted and a or 0), color(r, g, b, inverted and a or 0)) --left
        render.gradient(vector(screen_size_x / 2, screen_size_y / 2 - scope_gap:get()),
            vector(screen_size_x / 2 + 1, screen_size_y / 2 - scope_gap:get() - scope_size:get()),
            color(r, g, b, not inverted and a or 0), color(r, g, b, not inverted and a or 0),
            color(r, g, b, inverted and a or 0), color(r, g, b, inverted and a or 0)) --up
        render.gradient(vector(screen_size_x / 2, screen_size_y / 2 + scope_gap:get() + 1),
            vector(screen_size_x / 2 + 1, screen_size_y / 2 + scope_gap:get() + scope_size:get() + 1),
            color(r, g, b, not inverted and a or 0), color(r, g, b, not inverted and a or 0),
            color(r, g, b, inverted and a or 0), color(r, g, b, inverted and a or 0)) --down
    end
end

local phrases = {
    "𝔒𝔚𝔑𝔈𝔇 𝔅𝔜 𝔏ℑ𝔊ℌ𝔗𝔖𝔈𝔑𝔖𝔈",
    "(っ◔◡◔)っ ♥ i just had LIGHTSENSE thats why you lost. :hearts:",
    "ＯＷＮＥＤ ＢＹ ＬＩＧＨＴＳＥＮＳＥ.",
    "Which one of your 2 dads taught you how to play HVH?",
    "Imagine your potential if you didn't have parkinsons",
    "RENEW UR EZFRAG SUB NN",
    "1",
    "LIGHTSENSE ON TOP",
    "UNHITTABLE AA $$$",
    "watch onepiece, its peak.",
    "1 NN",
    "𝙽𝙸𝙲𝙴 𝙰𝙽𝚃𝙸𝙰𝙸𝙼, 𝙸𝚂 𝚃𝙷𝙰𝚃 𝚇𝙾-𝙿𝙰𝚂𝚃𝙴",
    "Is this casual? I have 16k..",
    "HEHAHAH",
    "RU BLYAT BLAH BLAH",
    "FREEEEEE",
    "EZ 4 LIGHTSENSE",
    "FREE ASF",
    "BOXED",
    "I thought I put bots on hard, why are they on easy?",
}

local phrases_on_death = {
    'luckybot',
    'baim legende'
}


ui_selectable:set_callback(function(ref)
    ui_selectable = ref:get()
end)

events.player_death:set(function(enemy)
    local player = entity.get_local_player():get_player_info()['userid']
    local enemys = enemy['userid']
    local attack = enemy['attacker']
    if enemys ~= player and player == attack then
        if ui_selectable[1] == "Kill" or ui_selectable[2] == "Kill" then
            utils.console_exec('say ' .. phrases[math.random(#phrases)])
        end
    else
        if enemys == player then
            if ui_selectable[1] == "Death" or ui_selectable[2] == "Death" then
                utils.console_exec('say' .. phrases_on_death[math.random(#phrases_on_death)])
            end
        end
    end
end)




local function unmute(cmd)
    if unmute_players:get() then
        unmute_cvar = cvar.cl_mute_all_but_friends_and_party
        unmute_cvar:int(0)
        unmute_cvar:call()
    end
end


events.round_start:set(function()
    if clear_round:get() then
        utils.console_exec("clear")
    end
end)

local function aspect_ratio()
    if aspect_switch:get() then
        cvar.r_aspectratio:float(aspect_slider:get() / 10)
    end

    if aspect_switch:get() then
        aspect_slider:visibility(true)
    else
        aspect_slider:visibility(false)
    end
end


local world_to_screen, render_rect, screen_size, ui_find = render.world_to_screen, render.rect, render.screen_size,
    ui.find

local _FadeTime = 0.5
local _WaitTime = 1.0
local Shots = {}

local function paint()
    if not enabled:get() then return end
    for i, Shot in pairs(Shots) do
        if Shot.FadeTime <= 0 then
            Shots[i] = nil
        else
            Shot.WaitTime = Shot.WaitTime - globals.frametime
            if Shot.WaitTime <= 0 then
                Shot.FadeTime = Shot.FadeTime - ((1 / _FadeTime) * globals.frametime)
            end

            if Shot.Position.x ~= nil and Shot.Position.y ~= nil and Shot.Position.z ~= nil and Shot.Reason == nil then
                local pos = world_to_screen(vector(Shot.Position.x, Shot.Position.y, Shot.Position.z))
                if pos ~= nil then
                    local x, y = pos.x, pos.y
                    local ss = screen_size()
                    local r, g, b, a = clr:get():unpack()
                    render_rect(vector(x - (1 / ss.x) * ss.x, y - (5 / ss.y) * ss.y),
                        vector(x + (1 / ss.x) * ss.x, y + (5 / ss.y) * ss.y), color(r, g, b, a * Shot.FadeTime), 0, true)
                    render_rect(vector(x - (5 / ss.x) * ss.x, y - (1 / ss.y) * ss.y),
                        vector(x + (5 / ss.x) * ss.x, y + (1 / ss.y) * ss.y), color(r, g, b, a * Shot.FadeTime), 0, true)
                end
            end
        end
    end
end

local function OnShotFired(Shot)
    Shots[Shot.id] = {
        Position = Shot.aim,
        WaitTime = _WaitTime,
        FadeTime = 1,
        Reason = Shot.state,
    }
end

events.render:set(function(ctx)
    paint()
end)

events.aim_ack:set(function(shot)
    OnShotFired(shot)
end)

events.round_start:set(function()
    Shots = {}
end)

events.player_spawned:set(function(e)
    Shots = {}
end)

local function render_events()
    indicators()
    better_scope()
    aspect_ratio()
end

local function createmove_events(cmd)
    baim_if_lethal()
    unmute(cmd)
end

local legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")


local function breakers()
    local lp = entity.get_local_player()

    if animation_fuckers:get('Static legs in air') then
        lp.m_flPoseParameter[6] = 1
    end

    if animation_fuckers:get('Follow Direction') then
        lp.m_flPoseParameter[0] = 1
        legmovement:set("Sliding")
    end

    if animation_fuckers:get('Jitter Legs') then
        lp.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.5 or 1
        legmovement:set("Sliding")
    end


end    

events.post_update_clientside_animation(function()
    breakers()
end)


local function state()
    local lp = entity.get_local_player()
    if not entity.get_local_player() then return end
    local flags = entity.get_local_player().m_fFlags
    local first_velocity = entity.get_local_player()['m_vecVelocity[0]']
    local second_velocity = entity.get_local_player()['m_vecVelocity[1]']
    local velocity = math.floor(math.sqrt(first_velocity * first_velocity + second_velocity * second_velocity))

    local flags = lp.m_fFlags
    local velocity = lp.m_vecVelocity:length2d()


    if bit.band(flags, 3) == 3 and velocity > 5 then
        return 7
    end

    if bit.band(flags, 1) == 1 then
        if bit.band(flags, 4) == 4 then
            return 4
        else
            if velocity <= 3 then
                return 1
            else
                if refs.sw:get() then
                    return 3
                else
                    return 2
                end
            end
        end
    elseif bit.band(flags, 1) == 0 then
        if bit.band(flags, 4) == 4 then
            return 6
        else
            return 5
        end
    end
end

local function choking(cmd)
    local Choke = false

    if cmd.send_packet == false or globals.choked_commands > 1 then
        Choke = true
    else
        Choke = false
    end

    return Choke
end

local function choking_jitter(cmd)
    local Choke = false

    local jitter_time = 0.3                   -- the duration of the jitter in seconds
    local jitter_frequency = 10               -- the frequency of the jitter in Hz
    local jitter_delay = 1 / jitter_frequency -- the delay between each jitter in seconds

    local current_time = globals.realtime

    if cmd.send_packet == false or globals.choked_commands > 1 then
        Choke = true
    else
        if current_time % jitter_delay < jitter_time then
            Choke = true
        else
            Choke = false
        end
    end

    if Choke then
        return -refs.yaw_offset:get() -- return a negative yaw offset value if choking
    else
        return refs.yaw_offset:get()  -- return the normal yaw offset value if not choking
    end
end


i_state = {
    [1] = "[\a735271FFS\a869BA7FF] ",
    [2] = "[\a735271FFM\a869BA7FF] ",
    [3] = "[\a735271FFSW\a869BA7FF] ",
    [4] = "[\a735271FFD\a869BA7FF] ",
    [5] = "[\a735271FFA\a869BA7FF] ",
    [6] = "[\a735271FFA\a869BA7FF] ",
    [7] = "[\a735271FFFWALK\a869BA7FF] ",
}

i_state_2 = {
    [1] = "Standing ",
    [2] = "Moving ",
    [3] = "Slowwalk ",
    [4] = "Crouching ",
    [5] = "Air ",
    [6] = "Air & Crouch ",
    [7] = "Duck & Walk "
}



states = {
    [1] = "Standing",
    [2] = "Moving",
    [3] = "Slowwalk",
    [4] = "Ducking",
    [5] = "In Air",
    [6] = "Air & Duck",
    [7] = "Duck & Walk"
}

antiaim = {}
for i = 1, 7 do
    antiaim[i] = {
        allow_aa = groups.antiaimtab.builder_group:switch(ui.get_icon("square-check").." Allow " .. i_state_2[i] .. "Condition", false),
        --yaw_type = groups.antiaimtab.builder_group:combo("Yaw", "Left & Right", "Custom Yaw"),
        yaw_type = groups.antiaimtab.builder_group:combo("⮞ Yaw Type", "Static", "Left & Right", "Delayed Yaw", "Custom Yaw"),
        way_type = groups.antiaimtab.builder_group:combo("⮞ Custom Way", "3-Way Yaw", "5-Way Yaw"),
    }
end

yaw_build = {}
for i = 1, 7 do
    yaw_build[i] = {
	
	    yaw_offset = groups.antiaimtab.builder_group:slider("⮞ Offset", -180, 180, 0),
		
        yaw_add_left = groups.antiaimtab.builder_group:slider("⮞ Right Offset", -180, 180, 0),
        yaw_add_right = groups.antiaimtab.builder_group:slider("⮞ Left Offset", -180, 180, 0),

        --yaw_add_left_delay = groups.antiaimtab.builder_group:slider("⮞ Left Offset", -180, 180, 0),
        --yaw_add_right_delay = groups.antiaimtab.builder_group:slider("⮞ Right Offset", -180, 180, 0),

        delay_ticks = groups.antiaimtab.builder_group:slider("⮞ Delay ticks", 1, 32, 10),
       
        t_way1 = groups.antiaimtab.builder_group:slider("⮞ Yaw 1", -180, 180, 0),
        t_way2 = groups.antiaimtab.builder_group:slider("⮞ Yaw 2", -180, 180, 0),
        t_way3 = groups.antiaimtab.builder_group:slider("⮞ Yaw 3", -180, 180, 0),
      
        f_way1 = groups.antiaimtab.builder_group:slider("⮞ Yaw 1", -180, 180, 0),
        f_way2 = groups.antiaimtab.builder_group:slider("⮞ Yaw 2", -180, 180, 0),
        f_way3 = groups.antiaimtab.builder_group:slider("⮞ Yaw 3", -180, 180, 0),
        f_way4 = groups.antiaimtab.builder_group:slider("⮞ Yaw 4", -180, 180, 0),
        f_way5 = groups.antiaimtab.builder_group:slider("⮞ Yaw 5", -180, 180, 0),
        
        yaw_pitch = groups.antiaimtab.builder_group:switch("⮞ Defensive Pitch", false),
        def_yaw = groups.antiaimtab.builder_group:combo("⮞ Defensive Yaw", {"Disabled", "Spin", "Jitter", "Lightsense [ Premium ]"}),

        DefSpin = groups.antiaimtab.builder_group:slider("⮞ Spin Amount", -180, 180, 0),
        DefSpin2 = groups.antiaimtab.builder_group:slider("⮞ Spin Random", -180, 180, 0),
        DefSpin3 = groups.antiaimtab.builder_group:slider("⮞ Spin Return", -180, 180, 0),

        DefJitter = groups.antiaimtab.builder_group:slider("⮞ Defensive Jitter Amount", -180, 180, 0),
        KeepYaw = groups.antiaimtab.builder_group:switch("⮞ Keep Original Yaw?", false),
        yaw_mod = groups.antiaimtab.builder_group:combo("⮞ Yaw Modifier", {"Disabled", "L & R Center", "L & R Offset", "Center", "Offset", "Random", "Spin" }),
        mod_deg = groups.antiaimtab.builder_group:slider("⮞ Yaw Jitter", -180, 180, 0),
        mod_left = groups.antiaimtab.builder_group:slider("⮞ Jitter Left", -180, 180, 0),
        mod_right = groups.antiaimtab.builder_group:slider("⮞ Jitter Right", -180, 180, 0),
        body_s = groups.antiaimtab.builder_group:switch("⮞ Body Yaw"),
    }
end



bodyyaw = {}
for i = 1, 7 do
    bodyyaw[i] = {
        left_limit = groups.antiaimtab.builder_group:slider("⮞ Left limit", 0, 60, 60),
        right_limit = groups.antiaimtab.builder_group:slider("⮞ Right limit", 0, 60, 60),
        fake_limit_type = groups.antiaimtab.builder_group:combo("⮞ Fakelimit type", { "Static", "Jitter" }),
        options = groups.antiaimtab.builder_group:selectable("⮞ Options", { "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce" }),
        freestanding_dsy = groups.antiaimtab.builder_group:combo("⮞ Freestanding", { "Off", "Peek Fake", "Peek Real" }),
    }
end



local function antiaim_menu()
    for i = 1, 7 do
        yaw:visibility(antiaim_e:get())
        condition:visibility(antiaim_e:get())
        antiaim[i].allow_aa:visibility(antiaim_e:get() and condition:get() == states[i])
        antiaim[i].yaw_type:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get())
        antiaim[i].way_type:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
		yaw_build[i].yaw_offset:visibility(antiaim_e:get() and antiaim[i].allow_aa:get() and condition:get() == states[i] and (antiaim[i].yaw_type:get() == "Static"))
        yaw_build[i].yaw_add_left:visibility(antiaim_e:get() and antiaim[i].allow_aa:get() and condition:get() == states[i] and (antiaim[i].yaw_type:get() == "Left & Right" or antiaim[i].yaw_type:get() == "Delayed Yaw"))
        yaw_build[i].yaw_add_right:visibility(antiaim_e:get() and antiaim[i].allow_aa:get() and condition:get() == states[i] and (antiaim[i].yaw_type:get() == "Left & Right" or antiaim[i].yaw_type:get() == "Delayed Yaw"))
        yaw_build[i].delay_ticks:visibility(antiaim_e:get() and antiaim[i].allow_aa:get() and condition:get() == states[i] and (antiaim[i].yaw_type:get() == "Delayed Yaw"))
        yaw_build[i].t_way1:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "3-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].t_way2:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "3-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].t_way3:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "3-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].f_way1:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "5-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].f_way2:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "5-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].f_way3:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "5-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].f_way4:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "5-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].f_way5:visibility(antiaim_e:get() and antiaim[i].yaw_type:get() == "Custom Yaw" and antiaim[i].way_type:get() == "5-Way Yaw" and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].yaw_pitch:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].def_yaw:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].DefSpin:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].def_yaw:get() == "Spin"))
        yaw_build[i].DefSpin2:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].def_yaw:get() == "Spin"))
        yaw_build[i].DefSpin3:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].def_yaw:get() == "Spin"))
        yaw_build[i].DefJitter:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].def_yaw:get() == "Jitter"))
        yaw_build[i].KeepYaw:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].def_yaw:get() ~= "Disabled"))
        yaw_build[i].yaw_mod:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get())
        yaw_build[i].mod_deg:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].yaw_mod:get() == "Center" or yaw_build[i].yaw_mod:get() == "Offset" or yaw_build[i].yaw_mod:get() == "Random" or yaw_build[i].yaw_mod:get() == "Spin"))
        yaw_build[i].mod_left:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].yaw_mod:get() == "L & R Center" or yaw_build[i].yaw_mod:get() == "L & R Offset"))
        yaw_build[i].mod_right:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and (yaw_build[i].yaw_mod:get() == "L & R Center" or yaw_build[i].yaw_mod:get() == "L & R Offset"))
        yaw_build[i].body_s:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get())
        bodyyaw[i].fake_limit_type:visibility(antiaim_e:get() and condition:get() == states[i] and antiaim[i].allow_aa:get() and yaw_build[i].body_s:get())
        bodyyaw[i].left_limit:visibility(antiaim_e:get() and condition:get() == states[i] and yaw_build[i].body_s:get() and antiaim[i].allow_aa:get() and yaw_build[i].body_s:get())
        bodyyaw[i].right_limit:visibility(antiaim_e:get() and condition:get() == states[i] and yaw_build[i].body_s:get() and antiaim[i].allow_aa:get() and yaw_build[i].body_s:get())
        bodyyaw[i].options:visibility(antiaim_e:get() and condition:get() == states[i] and yaw_build[i].body_s:get() and antiaim[i].allow_aa:get() and yaw_build[i].body_s:get())
        bodyyaw[i].freestanding_dsy:visibility(antiaim_e:get() and condition:get() == states[i] and yaw_build[i].body_s:get() and antiaim[i].allow_aa:get() and yaw_build[i].body_s:get())

    end
end

local switch_ticks = 0
local switch = false

-- Function to convert time to ticks
time_to_ticks = function(t)
    return math.floor(0.5 + (t / globals.tickinterval))
end

local function antiaim_func(cmd)
    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):set(avoid_knife:get())
    refs.fs:set(fs_e:get())
    refs.fs_disable:set(fs_dis:get())
    refs.fs_body:set(fs_bod:get())
    refs.options:override("")
    refs.yaw:override("Backward")
    refs.yaw_base:override("Local View")
    

    local current_stage = 1
    local localplayer = entity.get_local_player()
    if not localplayer then
        return
    end
    if not antiaim_e:get() then
        return
    end
    
 
    --[[local lp_inverter = localplayer.m_flPoseParameter[11] * 120 - 60 <= 0 and true or false

    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Left & Right" then
        if lp_inverter == true then
            refs.yaw_offset:set(yaw_build[state()].yaw_add_left:get())
        else
            refs.yaw_offset:set(yaw_build[state()].yaw_add_right:get())
        end--]]


        if localplayer == nil then
            return
        end
        if globals.choked_commands ~= 0 then 
            return
        end        
        
        local lp_inverter = localplayer.m_flPoseParameter[11] * 120 - 60
		
	if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Static" then
        refs.yaw_offset:set(yaw_build[state()].yaw_offset:get())
    end	

    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Left & Right" then
        refs.yaw_offset:set(lp_inverter > 0 and yaw_build[state()].yaw_add_left:get() or yaw_build[state()].yaw_add_right:get())
        bodyyaw[state()].options:set("Jitter")

        if not antiaim_e:get() then
            return
        end
        refs.yaw_mod:override(yaw_build[state()].yaw_mod:get())
        refs.yaw_mod_offset:override(yaw_build[state()].mod_deg:get())
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or
            bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end
   
    
    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Delayed Yaw" then
        if not antiaim_e:get() then return end
        if not antiaim[state()].yaw_type:get() == "Delayed Yaw" then return end
    
        local delay_ticks = time_to_ticks(yaw_build[state()].delay_ticks:get() / 60)
        switch_ticks = (switch_ticks + 1) % (delay_ticks + 1)
    
        if switch_ticks * 2 >= delay_ticks then
            if switch_ticks >= delay_ticks then
                switch_ticks = 0
            end

        if switch_ticks * 2 >= delay_ticks then
            refs.yaw_offset:set(yaw_build[state()].yaw_add_left:get() * 1)
            refs.inverter:set(false)
        else 
            refs.yaw_offset:set(yaw_build[state()].yaw_add_right:get() * 1) 
            refs.inverter:set(true)
        end
    end
        --print("Ticks: " .. tostring(switch_ticks))
        --print("Switch: " .. tostring(switch_ticks * 2 >= delay_ticks))

        if not antiaim_e:get() then return end
        refs.yaw_mod:override(yaw_build[state()].yaw_mod:get())
        refs.yaw_mod_offset:override(yaw_build[state()].mod_deg:get())
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and(globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end--]]
   

    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Custom Yaw" and antiaim[state()].way_type:get() == "3-Way Yaw" then
        if globals.tickcount % 3 == 0 then
            refs.yaw_offset:set(yaw_build[state()].t_way1:get())
        elseif globals.tickcount % 3 == 1 then
            refs.yaw_offset:set(yaw_build[state()].t_way2:get())
        elseif globals.tickcount % 3 == 2 then
            refs.yaw_offset:set(yaw_build[state()].t_way3:get())
        
        end
        if not antiaim_e:get() then return end
        refs.yaw_mod:override(yaw_build[state()].yaw_mod:get())
        refs.yaw_mod_offset:override(yaw_build[state()].mod_deg:get())
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or
            bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or
            bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end


    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Custom Yaw" and antiaim[state()].way_type:get() == "5-Way Yaw" then
        if globals.tickcount % 5 == 0 then
            refs.yaw_offset:set(yaw_build[state()].f_way1:get())
        elseif globals.tickcount % 5 == 1 then
            refs.yaw_offset:set(yaw_build[state()].f_way2:get())
        elseif globals.tickcount % 5 == 2 then
            refs.yaw_offset:set(yaw_build[state()].f_way3:get())
        elseif globals.tickcount % 5 == 3 then
            refs.yaw_offset:set(yaw_build[state()].f_way3:get())
        elseif globals.tickcount % 5 == 4 then
            refs.yaw_offset:set(yaw_build[state()].f_way3:get())
    end
        if not antiaim_e:get() then return end
        refs.yaw_mod:override(yaw_build[state()].yaw_mod:get())
        refs.yaw_mod_offset:override(yaw_build[state()].mod_deg:get())
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or
            bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or
            bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end

    
    if antiaim_e:get() then
        local choking = globals.choked_commands > 1
        preset = yaw_build[state()].def_yaw:get()
        if yaw_build[state()].yaw_pitch:get() and not choking then
            local rand_numb = math.random(1,4)
            if rand_numb == 1 or rand_numb == 2 or rand_numb == 3 then
                refs.pitch:set("Fake Down")
            end
            if rand_numb == 4 then
                refs.pitch:set("Fake Up")
            end 
        else
            refs.pitch:set("Down")
        end

        if preset == "Disabled" then
            refs.hidden:override(false)
            rage.antiaim:override_hidden_yaw_offset(0)
            rage.antiaim:override_hidden_pitch(89)
        elseif preset == "Spin" then
            if yaw_build[state()].KeepYaw:get() then

            else
                refs.yaw_offset:override(0)
            end

            refs.hidden:override(true)
            def_spin = yaw_build[state()].DefSpin:get()
            def_spin2 = yaw_build[state()].DefSpin2:get()
            def_spin3 = yaw_build[state()].DefSpin3:get()

    
            if spin_amn <= 179 then
                spin_amn = spin_amn + def_spin + utils.random_int(-def_spin2, def_spin2)
            else
                spin_amn = -(spin_amn + def_spin3) + utils.random_int(-def_spin2, def_spin2)
            end

            rage.antiaim:override_hidden_yaw_offset(spin_amn)
            print()

        
        elseif preset == "Jitter" then
            refs.hidden:override(true)
            def_jitter = yaw_build[state()].DefJitter:get()
            fiftyfifty = math.random(1,10)
            if fiftyfifty <= 5 then
                rage.antiaim:override_hidden_yaw_offset(def_jitter)
            else
                rage.antiaim:override_hidden_yaw_offset(-def_jitter)
            end

            if yaw_build[state()].KeepYaw:get() then

            else
                refs.yaw_offset:override(0)
            end
        elseif preset == "Lightsense [ Premium ]" then
            refs.hidden:override(true)
            local choking = cmd.send_packet == false or globals.choked_commands > 1 
            local rand1 = utils.random_int(5,7)
            Defensive_sides = {
              [1] = 90,
              [2] = -90
          }
        
            if cmd.command_number % (5) == (0 + (5 - 1)) and not choking then
                def_stage = def_stage + 1
            end
        
            if def_stage == 3 or def_stage > 3 then
                def_stage = 1
            end
        
            if yaw_build[state()].KeepYaw:get() then

            else
                refs.yaw_offset:override(0)
            end
        

            rage.antiaim:override_hidden_yaw_offset(Defensive_sides[def_stage])
            rage.antiaim:override_hidden_pitch(0)
        

        else
            print("error")
        end

    end


    
    if antiaim_e:get() and yaw_build[state()].yaw_mod:get() == "L & R Center" then
        if localplayer == nil then
            return
        end
        if globals.choked_commands ~= 0 then 
            return
        end        
        
        local lp_inverter = localplayer.m_flPoseParameter[11] * 120 - 60

        refs.yaw_mod:override("Center")
        refs.yaw_mod_offset:set(lp_inverter > 0 and yaw_build[state()].mod_left:get() or yaw_build[state()].mod_right:get())

        if not antiaim_e:get() then
            return
        end
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or
            bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or
            bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end


    if antiaim_e:get() and yaw_build[state()].yaw_mod:get() == "L & R Offset" then
        refs.yaw_mod:override("Offset")
        refs.yaw_mod_offset:set(lp_inverter > 0 and yaw_build[state()].mod_left:get() or yaw_build[state()].mod_right:get())

        if not antiaim_e:get() then
            return
        end
        refs.yaw:set(yaw:get())
        refs.byaw:set(yaw_build[state()].body_s:get())
        refs.left_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].left_limit:get()) or
            bodyyaw[state()].left_limit:get())
        refs.right_limit:set(bodyyaw[state()].fake_limit_type:get() ~= 'Static' and
            (globals.tickcount % 4 > 1 and 18 or bodyyaw[state()].right_limit:get()) or
            bodyyaw[state()].right_limit:get())
        refs.options:set(bodyyaw[state()].options:get())
        refs.fs_desync:set(bodyyaw[state()].freestanding_dsy:get())
    end
   
    if antiaim_e:get() and antiaim[state()].yaw_type:get() == "Delayed Yaw" and (yaw_build[state()].yaw_mod:get() == "L & R Center" or yaw_build[state()].yaw_mod:get() == "L & R Offset") then
        yaw_build[state()].yaw_mod:tooltip("L & R Center or L & R Offset will not work as expected with Delayed Yaw")
    else
        yaw_build[state()].yaw_mod:tooltip("")
    end
    
    if antiaim_e:get() and yaw:get() == "At Target" then
        refs.yaw:set("Backward")
        refs.yaw_base:set("At Target")
    end


        if manual_aa:get() == "Right" then
            refs.yaw_offset:set(90)
            refs.yaw_base:set("Local View")
        end

        if manual_aa:get() == "Left" then
            refs.yaw_offset:set(-90)
            refs.yaw_base:set("Local View")
        end

        
        if manual_aa:get() == "Forward" then
            refs.yaw_offset:set(-180)
            refs.yaw_base:set("Local View")
        end
    end

local function antiaim_tweaks()
    local lp = entity.get_local_player()
    if not lp then return end
    local weapon = lp:get_player_weapon()
    if not weapon then return end
    local index = weapon:get_weapon_index()

    local teleported = false
    entity.get_players(true, false, function(ent)
        if ent:is_visible() and ent:is_alive() and not teleported and teleport:get() then
            rage.exploit:force_teleport()
            teleported = true
            utils.execute_after(1, function()
                if teleported then
                    teleported = not teleported
                end
            end)
        end
    end)


    lp = entity.get_local_player()
    if lp.m_fFlags == 256 then
        antiaim_cond = "Jumping"
    elseif lp.m_fFlags == 262 then
        antiaim_cond = "Crouch + Jumping"
    end


    if dt_air:get() == "Jumping" and lp.m_fFlags == 256 or lp.m_fFlags == 262 then
        refs.defense_dt:override('Always On')
        

        refs.dtfl:set(1)
    elseif dt_air:get() == "Jumping" or not lp.m_fFlags == 256 or not lp.m_fFlags == 262 then
        refs.defense_dt:override("On Peek")
        
        refs.dtfl:set(1)
    
    elseif dt_air:get() == "LightSense" or not lp.m_fFlags == 256 or not lp.m_fFlags == 262 then
        random1 = utils.random_int(1,4)
        if random1 == 4 then
            refs.defense_dt:override("Always On")
            
        else
            refs.defense_dt:override("On Peek")
            
        end
        refs.dtfl:override(1)
    end

    if dt_air:get() == "Always" then
        refs.defense_dt:override('Always On')
        
        refs.dtfl:override(1)
    elseif not dt_air:get() == "Always" or not dt_air:get() == "Jumping" then
        refs.defense_dt:override("On Peek")
        
        refs.dtfl:override(1)
    end
    if dt_air:get() == "Disabled" then
        refs.defense_dt:override("On Peek")
        
        refs.dtfl:set(1)
    end

end


local data = {
    bools = {
        avoid_knife,
        fs_e,
        fs_dis,
        fs_bod,
    },
    tables = {
    },
    ints = {
        animation_fuckers,
        yaw
    },
    numbers = {
    }
}


function pairsort(t)
    local a = {}
    for n in pairs(t) do
        a[#a + 1] = n
    end
    table.sort(a)
    local i = 0
    return function()
        i = i + 1
        return a[i], t[a[i]]
    end
end

for i, v in pairsort(states) do
    for _, v in pairsort(antiaim[i]) do
        if type(v:get()) == "boolean" then
            table.insert(data.bools, v)
        elseif type(v:get()) == "table" then
            table.insert(data.tables, v)
        elseif type(v:get()) == "string" then
            table.insert(data.ints, v)
        else
            table.insert(data.numbers, v)
        end
    end
end


for i, v in pairsort(states) do
    for _, v in pairsort(yaw_build[i]) do
        if type(v:get()) == "boolean" then
            table.insert(data.bools, v)
        elseif type(v:get()) == "table" then
            table.insert(data.tables, v)
        elseif type(v:get()) == "string" then
            table.insert(data.ints, v)
        else
            table.insert(data.numbers, v)
        end
    end
end


for i, v in pairsort(states) do
    for _, v in pairsort(bodyyaw[i]) do
        if type(v:get()) == "boolean" then
            table.insert(data.bools, v)
        elseif type(v:get()) == "table" then
            table.insert(data.tables, v)
        elseif type(v:get()) == "string" then
            table.insert(data.ints, v)
        else
            table.insert(data.numbers, v)
        end
    end
end

local function export_aa()
    common.add_notify("lightsense", "Config Exported")
    local Code = { {}, {}, {}, {}, {}, {} }
    for _, bools in pairs(data.bools) do
        table.insert(Code[1], bools:get())
    end

    for _, tables in pairs(data.tables) do
        table.insert(Code[2], tables:get())
    end

    for _, ints in pairs(data.ints) do
        table.insert(Code[3], ints:get())
    end

    for _, numbers in pairs(data.numbers) do
        table.insert(Code[4], numbers:get())
    end

    clipboard.set("antiaim_" .. base64.encode(json.stringify(Code)))
end

local function import_aa()
    common.add_notify("lightsense", "Config has been loaded")
    local json_cfg = clipboard.get():gsub("antiaim_", "")
    for k, v in pairs(json.parse(base64.decode(json_cfg))) do
        k = ({ [1] = "bools",[2] = "tables",[3] = "ints",[4] = "numbers" })[k]
        for k2, v2 in pairs(v) do
            if (k == "bools") then
                data[k][k2]:set(v2)
            end

            if (k == "tables") then
                data[k][k2]:set(v2)
            end

            if (k == "ints") then
                data[k][k2]:set(v2)
            end

            if (k == "numbers") then
                data[k][k2]:set(v2)
            end
        end
    end
end


local function def_apply_aa()
    common.add_notify("lightsense", "Config has been loaded")
    for k, v in pairs(json.parse(base64.decode("W1tmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsZmFsc2VdLFtbIkppdHRlciJdLFsiSml0dGVyIl0sWyJKaXR0ZXIiXSxbIkppdHRlciJdLFsiSml0dGVyIl0sWyJKaXR0ZXIiXSxbIkppdHRlciJdXSxbW10sIkF0IFRhcmdldCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIk9mZnNldCIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiIsIlN0YXRpYyIsIk9mZiJdLFs2LjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsLTU2LjAsLTYwLjAsMTAuMCwxMC4wLDAuMCwxMC4wLDEwLjAsNzYuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDExLjAsLTY2LjAsLTY1LjAsMC4wLDAuMCwwLjAsMTEuMCw1LjAsMTAuMCwwLjAsMC4wLDEwLjAsNS4wLDAuMCwwLjAsLTc2LjAsLTgxLjAsMC4wLDAuMCwwLjAsMTAuMCw1LjAsMTAuMCwtMTAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLC02Mi4wLC01MS4wLDAuMCw5LjAsMTEuMCwtMTAuMCwtMTAuMCwxMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMy4wLDkuMCwxMi4wLDAuMCwwLjAsMC4wLDkuMCwxMS4wLDEwLjAsMC4wLDAuMCwwLjAsLTEwLjAsLTEwLjAsNjAuMCw5LjAsMTIuMCwtNjAuMCw2MC4wLDYwLjAsOS4wLDEyLjAsMTAuMCwtNjUuMCw2MC4wLDYwLjAsMC4wLC03Ni4wLC04MS4wLC02Mi4wLC01MS4wLDAuMCwtNjIuMCwtNTEuMCwtMTAuMCwtMTAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjBdLFtdLFtdXQ=="))) do
        k = ({ [1] = "bools",[2] = "tables",[3] = "ints",[4] = "numbers" })[k]
        for k2, v2 in pairs(v) do
            if (k == "bools") then
                data[k][k2]:set(v2)
            end

            if (k == "tables") then
                data[k][k2]:set(v2)
            end

            if (k == "ints") then
                data[k][k2]:set(v2)
            end

            if (k == "numbers") then
                data[k][k2]:set(v2)
            end
        end
    end
end

local import = groups.generaltab.main_group:button("  " .. ui.get_icon("file-import") .. "  Import settings", import_aa,
    true)
local export = groups.generaltab.main_group:button("  " .. ui.get_icon("file-export") .. "  Export settings", export_aa,
    true)
local default = groups.generaltab.main_group:button(
    "                " .. ui.get_icon("user-tag") .. "  Load default settings                  ", def_apply_aa, true)



    events.console_input:set(function(input)
        if input == 'load def' then
            common.add_notify("lightsense", "Config has been loaded")
            for k, v in pairs(json.parse(base64.decode("W1tmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsdHJ1ZSx0cnVlLGZhbHNlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZV0sW1siSml0dGVyIl0sWyJKaXR0ZXIiXSxbIkppdHRlciJdLFtdLFsiSml0dGVyIl0sWyJKaXR0ZXIiXSxbIkppdHRlciJdXSxbW10sIkF0IFRhcmdldCIsIjMtV2F5IFlhdyIsIlN0YXRpYyIsIjMtV2F5IFlhdyIsIlN0YXRpYyIsIjMtV2F5IFlhdyIsIlN0YXRpYyIsIjMtV2F5IFlhdyIsIkRlbGF5ZWQgWWF3IiwiMy1XYXkgWWF3IiwiU3RhdGljIiwiMy1XYXkgWWF3IiwiU3RhdGljIiwiMy1XYXkgWWF3IiwiU3RhdGljIiwiTCAmIFIgQ2VudGVyIiwiQ2VudGVyIiwiTCAmIFIgQ2VudGVyIiwiRGlzYWJsZWQiLCJPZmZzZXQiLCJMICYgUiBDZW50ZXIiLCJMICYgUiBDZW50ZXIiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiXSxbNi4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLC01Ni4wLC01LjAsMTAuMCwxMC4wLDAuMCwxMC4wLDEwLjAsMTUuMCwzMi4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsNzkuMCwtNjYuMCwtNjUuMCwwLjAsMC4wLDAuMCwxMS4wLDUuMCw1LjAsMTAuMCwwLjAsMC4wLDEwLjAsNS4wLDAuMCwwLjAsLTc2LjAsLTgxLjAsMC4wLDAuMCwwLjAsMTAuMCw1LjAsMC4wLDguMCwtMTAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLC02Mi4wLC01MS4wLDAuMCw5LjAsMTEuMCw2Mi4wLC0zMS4wLDAuMCwxMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMy4wLDkuMCwxMi4wLDAuMCwwLjAsMC4wLDkuMCwxMS4wLDAuMCwxMC4wLDAuMCwwLjAsMC4wLC0xMC4wLC0xMC4wLDYwLjAsOS4wLDEyLjAsLTYwLjAsNjAuMCw2MC4wLDkuMCwxMi4wLDAuMCwxMC4wLC02NS4wLDYwLjAsNjAuMCwwLjAsLTc2LjAsLTgxLjAsLTYyLjAsLTUxLjAsMC4wLC02Mi4wLC01MS4wLC0xMC4wLC0xMC4wLDE1LjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wXSxbXSxbXV0===="))) do
                k = ({ [1] = "bools",[2] = "tables",[3] = "ints",[4] = "numbers" })[k]
                for k2, v2 in pairs(v) do
                    if (k == "bools") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "tables") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "ints") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "numbers") then
                        data[k][k2]:set(v2)
                    end
                end
            end
        end
    end)

    events.console_input:set(function(input)
        if input == 'load delayed' then
            common.add_notify("lightsense", "Config has been loaded")
            for k, v in pairs(json.parse(base64.decode("W1tmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsdHJ1ZSx0cnVlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsZmFsc2UsdHJ1ZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsZmFsc2VdLFtbIkppdHRlciJdLFsiSml0dGVyIl0sWyJKaXR0ZXIiXSxbIkppdHRlciJdLFtdLFtdLFsiSml0dGVyIl1dLFtbXSwiQXQgVGFyZ2V0IiwiMy1XYXkgWWF3IiwiTGVmdCAmIFJpZ2h0IiwiMy1XYXkgWWF3IiwiTGVmdCAmIFJpZ2h0IiwiMy1XYXkgWWF3IiwiTGVmdCAmIFJpZ2h0IiwiMy1XYXkgWWF3IiwiTGVmdCAmIFJpZ2h0IiwiMy1XYXkgWWF3IiwiRGVsYXllZCBZYXciLCIzLVdheSBZYXciLCJEZWxheWVkIFlhdyIsIjMtV2F5IFlhdyIsIkxlZnQgJiBSaWdodCIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIkwgJiBSIENlbnRlciIsIkRpc2FibGVkIiwiRGlzYWJsZWQiLCJMICYgUiBDZW50ZXIiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJTdGF0aWMiLCJPZmYiLCJKaXR0ZXIiLCJPZmYiLCJKaXR0ZXIiLCJPZmYiLCJTdGF0aWMiLCJPZmYiXSxbNi4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLC01Ni4wLC02MC4wLDEwLjAsMTAuMCwwLjAsMTAuMCwxMC4wLDc2LjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwxMS4wLC02Ni4wLC02NS4wLDAuMCwwLjAsMC4wLDExLjAsNS4wLDEwLjAsMC4wLDAuMCwxMC4wLDUuMCwwLjAsMC4wLC03Ni4wLC04MS4wLDAuMCwwLjAsMC4wLDEwLjAsNS4wLDEwLjAsLTEwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwtNjIuMCwtNTEuMCwwLjAsOS4wLDExLjAsLTEwLjAsLTEwLjAsNy4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsLTMxLjAsOS4wLDEyLjAsMC4wLDAuMCwwLjAsLTEyLjAsMjEuMCw3LjAsMC4wLDAuMCwwLjAsLTEwLjAsLTEwLjAsNjAuMCw5LjAsMTIuMCwtNjAuMCw2MC4wLDYwLjAsLTcuMCwyNi4wLDEwLjAsLTY1LjAsNjAuMCw2MC4wLDAuMCwtNzYuMCwtODEuMCwtNjIuMCwtNTEuMCwwLjAsLTYyLjAsLTUxLjAsLTEwLjAsLTEwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wLDYwLjAsNjAuMCw2MC4wXSxbXSxbXV0="))) do
                k = ({ [1] = "bools",[2] = "tables",[3] = "ints",[4] = "numbers" })[k]
                for k2, v2 in pairs(v) do
                    if (k == "bools") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "tables") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "ints") then
                        data[k][k2]:set(v2)
                    end
        
                    if (k == "numbers") then
                        data[k][k2]:set(v2)
                    end
                end
            end
        end
    end)

events.render:set(function()
    if antiaim_e:get() then
        import:visibility(true)
        export:visibility(true)
        default:visibility(true)
        animation_fuckers:visibility(true)
        manual_aa:visibility(true)
        teleport:visibility(true)
        avoid_knife:visibility(true)
        fs_e:visibility(true)
        dt_air:visibility(true)
    else
        import:visibility(false)
        export:visibility(false)
        default:visibility(false)
        animation_fuckers:visibility(false)
        manual_aa:visibility(false)
        teleport:visibility(false)
        avoid_knife:visibility(false)
        fs_e:visibility(false)
        dt_air:visibility(false)
    end

    if skeet_indicator:get() then
        sense_ind_func()
    end
end)

events.aim_ack:set(function(ack)
    console_logs_print(ack)
end)

events.createmove:set(function(cmd)
    createmove_events()
    antiaim_func(cmd)
    antiaim_tweaks()
end)

events.render:set(function()
    antiaim_menu()
    render_events()
end)
