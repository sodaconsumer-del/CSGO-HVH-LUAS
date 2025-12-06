-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2



ffi.cdef[[
    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  
    bool DeleteUrlCacheEntryA(const char* lpszUrlName);
]]

local urlmon = ffi.load 'UrlMon'
local wininet = ffi.load 'WinInet'


--download font function
local function download_font()
    -- get if we already have the font
    local contents = files.read("nl\\crystality\\pixel.ttf")
    -- if we don't have file
    if contents == nil then
        -- do our download
        download = function(from, to)
            wininet.DeleteUrlCacheEntryA(from)
            urlmon.URLDownloadToFileA(nil, from, to, 0,0)
            utils.console_exec("play ui\\beepclear")
            common.add_notify("font download", "font downloaded, reloading script")
        end
        -- create folder function
        CreateDir = function(path)
            ffi.C.CreateDirectoryA(path, NULL)
        end
        -- create folder for font
        CreateDir("nl\\crystality\\")
        -- download font from internet to our folder and create the font file
        download('https://fontsforyou.com/downloads/99851-smallestpixel7', 'nl\\crystality\\pixel.ttf')
    end
    --reloads script so we can use the font
end

--calling function once on script load
download_font()

--[[
    how to use font from folder:
    local pixel = render.load_font("nl\\crystality\\pixel.ttf", 12, "o")
]]
local drag_system = require 'neverlose/drag_system'
local gradient = require("neverlose/gradient")
local pui = require("neverlose/pui")
local visualstab = pui.create("\f<person> ", "\f<home> Misc")
local visualsi = pui.create("\f<person> ", "\f<home> Indicators")
local base64 = require("neverlose/base64")
local clipboard = require("neverlose/clipboard")
local ffi = require("ffi")
local uintptr_t = ffi.typeof("uintptr_t**")
ffi.cdef[[
    typedef void*(__thiscall* get_client_entity_t)(void*, int);
    typedef struct {
        char  pad_0000[20];
        int m_nOrder; //0x0014
        int m_nSequence; //0x0018
        float m_flPrevCycle; //0x001C
        float m_flWeight; //0x0020
        float m_flWeightDeltaRate; //0x0024
        float m_flPlaybackRate; //0x0028
        float m_flCycle; //0x002C
        void *m_pOwner; //0x0030
        char  pad_0038[4]; //0x0034
    }c_animlayers;
   
    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);
    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);
    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);
    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);
    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
    bool DeleteUrlCacheEntryA(const char* lpszUrlName);
]]

local entity_list_003 = ffi.cast(uintptr_t, utils.create_interface("client.dll", "VClientEntityList003"))
local esound = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("engine.dll", "IEngineSoundClient003"))

local urlmon = ffi.load 'UrlMon'
local wininet = ffi.load 'WinInet'
local Download = function(from, to)
    wininet.DeleteUrlCacheEntryA(from)
    urlmon.URLDownloadToFileA(nil, from, to, 0,0)
end
local default_config = {n = {"Default"},cfg = {""}}
files.create_folder('nl\\crystality-dev')
files.create_folder('csgo\\sound\\buttons')
if(files.read('nl/crystality-dev/configs.cfg') == nil) then
    files.write('nl/crystality-dev/configs.cfg', json.stringify(default_config))
end
local config_data = json.parse(files.read('nl/crystality-dev/configs.cfg'))
Download("https://cdn.discordapp.com/attachments/1142775721719255091/1143921025621446737/sonic.wav","csgo\\sound\\buttons\\sonic.wav")
conditions = {"Total", "Stand", "Moving", "Slow-Walk", "Duck", "Aerobic", "Aerobic+","Legit AA"}
function this_call(call_function, parameters)
    return function(...)
        return call_function(parameters, ...)
    end
end
function bind_argument(fn, arg)
    return function(...)
        return fn(arg, ...)
    end
end
local psound = bind_argument(ffi.cast("void*(__thiscall*)(void*, const char*, float, int, int, float)", esound[0][12]), esound)
local get_entity_address = this_call(ffi.cast("get_client_entity_t", entity_list_003[0][3]), entity_list_003)
local refs = {
    enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    hs_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
    offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
    yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
    yaw_mod_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
    desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
    free_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
    yaw_mod_free = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
    desyncl = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
    desyncr= ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
    hidden_cvars = ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"),
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
    lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
}
local tabs = {
    main ={
        main_tab_selector = pui.create("Main"," "),
        main_logo = pui.create("Main","      "),
        main_tab = pui.create("Main","   "),
    
    },
    misc = {
        miscir = pui.create("Settings","       "),
        visual= pui.create("Settings","  "),
        builder= pui.create("Settings","   "),
    },
    visuals = {
        visuals= pui.create("Visuals","    ")
    }
}
local x = render.screen_size().x 
local y = render.screen_size().y 
local ref_fov = cvar.viewmodel_fov:int()
local ref_x = cvar.viewmodel_offset_x:float()
local ref_y = cvar.viewmodel_offset_y:float()
local ref_z = cvar.viewmodel_offset_z:float()
local menu = {
    main={
        tabswitcher = tabs.main.main_tab_selector:list("","\v \aDEFAULT Informations","\v \aDEFAULT Recommendations","\v \aDEFAULT Configurations"),
        tabs.main.main_logo:texture(render.load_image(network.get("https://cdn.discordapp.com/attachments/1142775721719255091/1168991241610997781/Remove-bg.ai_1698779621543.png?ex=6553c6ee&is=654151ee&hm=6e3c9b807fa75a1c31883e05a69e1e8ceb5bf032b93404989ab28fd7f50c93f3&"), vector(270, 288)), vector(270, 290), 'f'),
        cfg_list = tabs.main.main_tab:list("", config_data.n),
        cfg_name = tabs.main.main_tab:input("", ""),
        load_cfg = tabs.main.main_tab:button( ui.get_icon("file-arrow-up") .. " \vLoad", function()
            load_cfg()
        end, true),
        create_cfg = tabs.main.main_tab:button( ui.get_icon("plus") .. " \vCreate", function()
            create_cfg()
        end, true),
        save_cfg = tabs.main.main_tab:button( ui.get_icon("floppy-disk") .. " \vSave", function()
            save_cfg()
        end, true),
        delete_cfg = tabs.main.main_tab:button( ui.get_icon("trash") .. " \vDelete", function()
            remove_cfg()
        end, true),
        cfg_import = tabs.main.main_tab:button( ui.get_icon("file-import") .. " \vImport Config", function()
            import_cfg()
        end, true),
        cfg_export = tabs.main.main_tab:button( ui.get_icon("file-export") .. " \vExport Config", function()
            export_cfg()
        end, true),
        rek = tabs.main.main_tab:label(""),
        rek1 = tabs.main.main_tab:label(""),
        rek2 = tabs.main.main_tab:label(""),
        side = tabs.main.main_tab:combo("\v \aDEFAULT Sidebar",{"Twinkle","Default"}),
        yt = tabs.main.main_tab:button(ui.get_icon("youtube").."                            YOUTUBE                           "..ui.get_icon("youtube"), function()
            panorama.Open.SteamOverlayAPI.OpenExternalBrowserURL("https://dsc.gg/southwestcfgs")
        end,true),
        ds = tabs.main.main_tab:button(ui.get_icon("discord").."                           DISCORD                            "..ui.get_icon("discord"), function()
            panorama.Open.SteamOverlayAPI.OpenExternalBrowserURL("https://dsc.gg/southwestcfgs")
        end,true),
        cfg = tabs.main.main_tab:button(ui.get_icon("circle-check").."                                  CFG                                  "..ui.get_icon("circle-check"), function()
            panorama.Open.SteamOverlayAPI.OpenExternalBrowserURL("https://dsc.gg/southwestcfgs")
        end,true),
    },
    aa = {
        builder = {},
        cond = tabs.misc.builder:combo("State", conditions),
        yaw_base = tabs.misc.visual:combo("\v \aDEFAULT Manuals", {"Disabled", "Left", "Right","Forward"}),   
        shit_aa = tabs.misc.visual:combo("\v \aDEFAULT Warmup Preset", {"Default", "Shit", "Disabled"}),
        safe_head = tabs.misc.visual:selectable("\v \aDEFAULT Safe Head", {"Knife", "Zeus"}),
        freestanding = tabs.misc.visual:switch("\v \aDEFAULT Freestand",false, nil, function(gear)
            return
            {
                static_frees = gear:selectable("Disablers", { "On Manual"}),
            }
        end),
        anti_backstab = tabs.misc.visual:switch("\v \aDEFAULT Anti Backstab"),
        break_lc = tabs.misc.visual:switch("\v \aDEFAULT Force Break LC "),
        fastcum = tabs.misc.visual:switch("\v \aDEFAULT Fast Ladder "),
        animbreaker = tabs.misc.visual:switch("\v \aDEFAULT Animation Breaker",false, nil, function(gear)
            return
            {
                groundbreaker = gear:combo("Ground", {"Off", "Follow Direction", "Jitter", "MoonWalk","Crab"}),
                airbreaker = gear:combo("Air", {"Off", "Static Legs", "MoonWalk"}),
                otherbreaker = gear:selectable("Other", {"Pitch 0 On Land"}),
            }
        end),
    },
}
for i = 1, #conditions do
    menu.aa.builder[i] = {
        enable = tabs.misc.builder:switch("Enable " .. conditions[i]),
        pitch = tabs.misc.builder:combo("Pitch", {"Disabled","Down","Fake Up","Fake Down"}),
        yaw_type = tabs.misc.builder:combo("Yaw Type", {"Static","Custom"},false, nil, function(gear)
            return
            {                       
                base = gear:combo("Base",{"Local View","At Target"}),
                options = gear:combo("Option",{"L/R","L/R Delayed","Jitter Dev"}),
                yaw_add = gear:slider("Offset", -180, 180, 0, 1 ),
                yaw_add_left = gear:slider("Left", -180, 180, 0, 1 ),
                yaw_add_right  =  gear:slider("Right", -180, 180, 0, 1),
                yaw_add_left2 = gear:slider("Left#2", -180, 180, 0, 1 ),
                yaw_add_right2  =  gear:slider("Right#2", -180, 180, 0, 1),
                delay = gear:slider('Delay', 0, 16, 0, 1, function(value) 
                    if value == 0 then return 'Off' end 
                end),
            }      
        end),
        jit_type = tabs.misc.builder:combo("Yaw Modifier", refs.yaw_mod:list(),false, nil, function(gear)
            return
            {
                jitter_center = gear:slider("Amount", -180, 180, 0, 1),
                amount = gear:slider('Randomize', 0, 15, 0, 1, function(value) 
                    if value == 0 then return 'Off' end 
                end),        
            }
        end),
        body_yaw = tabs.misc.builder:switch("Body Yaw",false, nil, function(gear)
            return
            {
                options = gear:selectable("Options", refs.options:list()),
                freestand = gear:combo("Freestanding", refs.desync_freestand:list()),
                desyncl = gear:slider("Desync Left", 0, 60, 60, 1, "°"),
                desyncr = gear:slider("Desync Right", 0, 60, 60, 1, "°") ,
            }
        end),
       
        defensive = tabs.misc.builder:switch("Defensive AA",false, nil, function(gear)
            return
            {
                defensivetype = gear:combo("Yaw Type", {"Random","180Z","Opposite","Random Sideways","Custom Sideways","3-Way","5-Way"}),
                defensivepitchtype = gear:combo("Pitch", {"Zero", "Down", "Up","Automatic","Random","Switch","Custom"}),
                yaw_add_left = gear:slider("Left", -180, 180, 0, 1 ),
                yaw_add_right  =  gear:slider("Right", -180, 180, 0, 1),
                defensivepitch1 = gear:slider("Pitch #1", -89, 89, 0, 1, "°") , 
                defensivepitch2 = gear:slider("Pitch #2", -89, 89, 0, 1, "°") , 
                defensivepitch = gear:slider("Pitch", -89, 89, 0, 1, "°") , 
            }
        end),
        ab_enable = tabs.misc.builder:switch("Anti~Bruteforce",false, nil, function(gear)
            return
            {
                yaw_type = gear:combo("Yaw Type", {"Static","Custom"}),
                yaw_options = gear:combo("Option",{"L/R","L/R Delayed","Jitter Dev"}),
                yaw_add = gear:slider("Offset", -180, 180, 0, 1 ),
                yaw_add_left = gear:slider("Left", -180, 180, 0, 1 ),
                yaw_add_right  =  gear:slider("Right", -180, 180, 0, 1),
                yaw_add_left2 = gear:slider("Left#2", -180, 180, 0, 1 ),
                yaw_add_right2  =  gear:slider("Right#2", -180, 180, 0, 1),
                delay = gear:slider('Delay', 0, 16, 0, 1, function(value) 
                    if value == 0 then return 'Off' end 
                end),
                jit_type = gear:combo("Yaw Modifier", refs.yaw_mod:list()),
                jitter_center = gear:slider("Amount", -180, 180, 0, 1),
                body_yaw = gear:switch("Body Yaw",false),
                options = gear:selectable("Options", refs.options:list()),
                freestand = gear:combo("Freestanding", refs.desync_freestand:list()),
                desyncl = gear:slider("Desync Left", 0, 60, 60, 1, "°"),
                desyncr = gear:slider("Desync Right", 0, 60, 60, 1, "°"),
                defensive =gear:switch("Defensive AA",false),
                defensivetype = gear:combo("Yaw Type", {"Random","180Z","Opposite","Random Sideways","Custom Sideways","3-Way","5-Way"}),
                defensivepitchtype = gear:combo("Pitch", {"Zero", "Down", "Up", "Random","Automatic","Switch","Custom"}),
                yaw_add_left3 = gear:slider("Left", -180, 180, 0, 1 ),
                yaw_add_right3 =  gear:slider("Right", -180, 180, 0, 1),
                defensivepitch1 = gear:slider("Pitch #1", -89, 89, 0, 1, "°") , 
                defensivepitch2 = gear:slider("Pitch #2", -89, 89, 0, 1, "°") , 
                defensivepitch = gear:slider("Pitch", -89, 89, 0, 1, "°") , 
            }
        end),
    }   
end
for i = 1, #conditions do
    local cond = {menu.aa.cond, conditions[i]} 
    local builder =  menu.aa.builder[i]
    local yaw_mod = menu.aa.builder[i].jit_type
    local body_yaw = menu.aa.builder[i].body_yaw
    local condea = menu.aa.builder[i].enable
    local ea = {condea, function() if(i == 1) then return true else return condea:get() end end}
    menu.aa.builder[i].enable:depend(tb, cond,{menu.aa.cond, function()
        return (i ~= 1)
    end})
    yaw_mod:depend(  cond, ea)
    body_yaw:depend(  cond, ea)
    builder.yaw_type:depend( cond, ea)
    builder.pitch:depend(cond, ea)
    builder.ab_enable:depend( cond, ea)
    builder.ab_enable.options:depend( cond, ea,{builder.ab_enable.body_yaw, true})
    builder.ab_enable.freestand:depend( cond, ea,{builder.ab_enable.body_yaw, true})
    builder.ab_enable.desyncl:depend( cond, ea,{builder.ab_enable.body_yaw, true})
    builder.ab_enable.desyncr:depend( cond, ea,{builder.ab_enable.body_yaw, true})
    builder.ab_enable.jitter_center:depend( cond, ea,{builder.ab_enable.jit_type,"Disabled" ,true})
    builder.ab_enable.yaw_options:depend( cond, ea,{builder.ab_enable.yaw_type, "Custom"})
    builder.ab_enable.yaw_add_left:depend( cond, ea,{builder.ab_enable.yaw_type, "Custom"})
    builder.ab_enable.yaw_add_right:depend( cond, ea,{builder.ab_enable.yaw_type, "Custom"})
    builder.ab_enable.yaw_add:depend( cond, ea,{builder.ab_enable.yaw_type, "Static"})
    builder.ab_enable.delay:depend( cond, ea,{builder.ab_enable.yaw_type,"Custom"},{builder.ab_enable.yaw_options, "L/R Delayed"})
    builder.ab_enable.yaw_add_left2:depend( cond, ea,{builder.ab_enable.yaw_type,"Custom"},{builder.ab_enable.yaw_options, "Jitter Dev"})
    builder.ab_enable.yaw_add_right2:depend( cond, ea,{builder.ab_enable.yaw_type,"Custom"},{builder.ab_enable.yaw_options, "Jitter Dev"})
    builder.ab_enable.defensivetype:depend( cond, ea,{builder.ab_enable.defensive, true})
    builder.ab_enable.defensivepitchtype:depend( cond, ea,{builder.ab_enable.defensive, true})
    builder.ab_enable.defensivepitch:depend( cond, ea,{builder.ab_enable.defensivepitchtype, "Custom"})
    builder.ab_enable.defensivepitch1:depend( cond, ea,{builder.ab_enable.defensivepitchtype, "Switch"})
    builder.ab_enable.defensivepitch2:depend( cond, ea,{builder.ab_enable.defensivepitchtype, "Switch"})
    builder.ab_enable.yaw_add_right3:depend( cond, ea,{builder.ab_enable.defensivetype, "Custom Sideways"})
    builder.ab_enable.yaw_add_left3:depend( cond, ea,{builder.ab_enable.defensivetype, "Custom Sideways"})
    builder.yaw_type.base:depend( cond, ea)
    builder.yaw_type.options:depend( cond, ea ,{menu.aa.builder[i].yaw_type,"Custom"})
    builder.yaw_type.yaw_add:depend( cond, ea ,{menu.aa.builder[i].yaw_type,"Static"})
    builder.yaw_type.delay:depend( cond, ea ,{menu.aa.builder[i].yaw_type,"Custom"},{menu.aa.builder[i].yaw_type.options,"L/R Delayed"})
    builder.yaw_type.yaw_add_left2:depend( cond, ea ,{menu.aa.builder[i].yaw_type,"Custom"},{menu.aa.builder[i].yaw_type.options,"Jitter Dev"})
    builder.yaw_type.yaw_add_right2:depend( cond, ea ,{menu.aa.builder[i].yaw_type,"Custom"},{menu.aa.builder[i].yaw_type.options,"Jitter Dev"})
    builder.yaw_type.yaw_add_left:depend( cond, ea)
    builder.yaw_type.yaw_add_right:depend( cond, ea)
    builder.defensive:depend(cond, ea)
    yaw_mod.jitter_center:depend(cond)
    builder.defensive.defensivepitch:depend( cond, ea,{builder.defensive.defensivepitchtype, "Custom"})  
    builder.defensive.defensivepitch1:depend( cond, ea,{builder.defensive.defensivepitchtype, "Switch"})  
    builder.defensive.defensivepitch2:depend( cond, ea,{builder.defensive.defensivepitchtype, "Switch"})  
    builder.defensive.yaw_add_left:depend( cond, ea,{builder.defensive.defensivetype, "Custom Sideways"})  
    builder.defensive.yaw_add_right:depend( cond, ea,{builder.defensive.defensivetype, "Custom Sideways"})  
    body_yaw.options:depend(  cond, ea, {body_yaw, true})
    body_yaw.freestand:depend(  cond, ea, {body_yaw, true})
    body_yaw.desyncl:depend(  cond, ea, {body_yaw, true})
    body_yaw.desyncr:depend(  cond, ea, {body_yaw, true})
    menu.main.rek:depend({menu.main.tabswitcher, 1})
    menu.main.rek1:depend({menu.main.tabswitcher, 1})
    menu.main.rek2:depend({menu.main.tabswitcher, 1})
    menu.main.side:depend({menu.main.tabswitcher, 1})
    menu.main.yt:depend({menu.main.tabswitcher, 2})
    menu.main.ds:depend({menu.main.tabswitcher, 2})
    menu.main.cfg:depend({menu.main.tabswitcher, 2})
    menu.main.cfg_list:depend({menu.main.tabswitcher, 3})
    menu.main.cfg_name:depend({menu.main.tabswitcher, 3})
    menu.main.load_cfg:depend({menu.main.tabswitcher, 3})
    menu.main.create_cfg:depend({menu.main.tabswitcher, 3})
    menu.main.save_cfg:depend({menu.main.tabswitcher, 3})
    menu.main.delete_cfg:depend({menu.main.tabswitcher, 3})
    menu.main.cfg_import:depend({menu.main.tabswitcher, 3})
    menu.main.cfg_export:depend({menu.main.tabswitcher, 3})
end
----------------------------------------------------------------------  
local ab_enabler_check = false
events.bullet_impact:set(function(e)
    if entity.get_local_player() == nil or not entity.get_local_player():is_alive() then return end
    playerb = entity.get_local_player()
    if playerb == nil then return end
    if not playerb:is_alive() then return end
    local player = entity.get(e.userid, true)
    if player == nil then return end
    if not player:is_enemy() then return end
    if entity.get_threat(true) == nil then return end
    if entity.get_threat(true):get_index() ~= player:get_index() then return end    
    local s_pos = vector(e.x, e.y, e.z)
    local enemy_angles = (s_pos - player:get_hitbox_position(0)):angles()
    local angles = ((playerb:get_hitbox_position(3) - player:get_hitbox_position(0)):angles() - enemy_angles)
    angles.y = math.clamp(angles.y, -180, 180)
    local fov = math.sqrt(angles.y*angles.y + angles.x*angles.x)
    if fov < 10 and lastbrute + 0.1 < globals.realtime then
        if ab_enabler_check == true then
            timebrute = globals.realtime
            lastbrute = globals.realtime + 0.1
        end
    end
end)
timebrute = globals.realtime
lastbrute = globals.realtime
ram = {
    tickcounts = 0,
    spin_add = 0,
    sum_adds = 0,
    def_add = 0,
    cum_add = 0,
    chperma = 0,
}
local function cond_trig()
    lp = entity.get_local_player()
    if not lp then return "Not connected" end
    on_ground = bit.band(lp.m_fFlags, 1) == 1
    jump = bit.band(lp.m_fFlags, 1) == 0
    crouch = bit.band(lp.m_flDuckAmount) > 0.6
    vx, vy, vz = lp.m_vecVelocity.x, lp.m_vecVelocity.y, lp.m_vecVelocity.z
    move = math.sqrt(vx ^ 2 + vy ^ 2) > 5
    if jump and crouch then return "Aerobic+" end
    if jump then return "Aerobic" end
    if crouch then return "Ducking" end
    if on_ground and refs.sw:get() and move then return "Slow-Walk" end
    if on_ground and not move then return "Stand" end
    if on_ground and move then return "Moving" end
end
function fast_ladder(cmd)
    if(menu.aa.fastcum:get(true)) then
        local pitch, yaw = render.camera_angles().x, render.camera_angles().y
        player = entity.get_local_player()
        if  player.m_MoveType == 9 then
            cmd.view_angles.y = math.floor(cmd.view_angles.y+0.5)
            cmd.roll = 0
            if cmd.forwardmove > 0 then
                if pitch < 45 then
                    cmd.view_angles.x = 89
                    cmd.in_moveright = 1
                    cmd.in_moveleft = 0
                    cmd.in_forward = 0
                    cmd.in_back = 1
                    if cmd.sidemove == 0 then
                        cmd.view_angles.y = cmd.view_angles.y + 90
                    end
                    if cmd.sidemove < 0 then
                        cmd.view_angles.y = cmd.view_angles.y + 150
                    end
                    if cmd.sidemove > 0 then
                        cmd.view_angles.y = cmd.view_angles.y + 30
                    end
                end 
            end
            if cmd.forwardmove < 0 then
                cmd.view_angles.x = 89
                cmd.in_moveleft = 1
                cmd.in_moveright = 0
                cmd.in_forward = 1
                cmd.in_back = 0
                if cmd.sidemove == 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 90
                end
                if cmd.sidemove > 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 150
                end
                if cmd.sidemove < 0 then
                    cmd.view_angles.y = cmd.view_angles.y + 30
                end
            end
        end
    end
end 
cur_time = 0
local function legit_func(cmd)
    local local_player = entity.get_local_player()
    if (local_player == nil or not local_player:is_alive()) then return end
    check_legit = true
    local teamnum = local_player.m_iTeamNum
    for _, entities in pairs({entity.get_entities("CPlantedC4"), entity.get_entities("CHostage")}) do
        for _, entity in pairs(entities) do
            local origin = local_player:get_origin() 
            local entity_origin = entity:get_origin()
            local ent_distance = origin:dist(entity_origin) 
            local distance = ent_distance < 65 and ent_distance > 1 
            if distance and teamnum == 3 then 
                check_legit = false 
            end
        end
    end
    if teamnum == 2 and local_player.m_bInBombZone then
        check_legit = false 
    end
    if bit.band(cmd.buttons, 32) == 32 and check_legit then 
        if globals.curtime - cur_time > 0.02 then
            cmd.buttons = bit.band(cmd.buttons, bit.bnot(32)) 
            if set_legit then
                set_legit = false
            end
        end
    else
        if not set_legit then
            set_legit = true
        end
        cur_time = globals.curtime
    end
end
local function aa_setup(cmd)
    refs.enable:set(true)
    l_p = entity.get_local_player()
    if menu.aa.builder[2].enable:get() and cond_trig() == "Stand" and not (menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 2
    elseif menu.aa.builder[3].enable:get() and cond_trig() == "Moving" and not (menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 3
    elseif menu.aa.builder[4].enable:get() and cond_trig() == "Slow-Walk" and not (menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 4
    elseif menu.aa.builder[5].enable:get() and cond_trig() == "Ducking"  and not (menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 5
    elseif menu.aa.builder[6].enable:get() and cond_trig() == "Aerobic" and not (menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 6
    elseif menu.aa.builder[7].enable:get() and cond_trig() == "Aerobic+" and not(menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32) then id = 7
    elseif menu.aa.builder[8].enable:get() and bit.band(cmd.buttons, 32)== 32 then id = 8
    else
        id = 1
    end
    if menu.aa.builder[id].ab_enable:get() == true  then
        ab_enabler_check = true
    else
        ab_enabler_check = false
    end
   
    if (timebrute + 2 > globals.realtime and ab_enabler_check == true) then
        randomize1 = 0
        randvalue = 0
        pitch = menu.aa.builder[id].pitch:get()
        center = menu.aa.builder[id].ab_enable.jitter_center:get()
        defensive = menu.aa.builder[id].ab_enable.defensive:get()
        defensivetype = menu.aa.builder[id].ab_enable.defensivetype:get()
        defensivepitchtype = menu.aa.builder[id].ab_enable.defensivepitchtype:get()
        defensivepitch = menu.aa.builder[id].ab_enable.defensivepitch:get()
        options = menu.aa.builder[id].ab_enable.options:get()
        desyncr =  menu.aa.builder[id].ab_enable.desyncr:get()
        desyncl = menu.aa.builder[id].ab_enable.desyncl:get()
        yaw_type = menu.aa.builder[id].ab_enable.yaw_type:get()
        custom_yaw = menu.aa.builder[id].ab_enable.yaw_options:get()
        jit_type = menu.aa.builder[id].ab_enable.jit_type:get()
        basik = menu.aa.builder[id].yaw_type.options:get()
        delay = menu.aa.builder[id].ab_enable.delay:get()
        yaw_add_left = menu.aa.builder[id].ab_enable.yaw_add_left:get()
        yaw_add_right = menu.aa.builder[id].ab_enable.yaw_add_right:get()
        yaw_add_left2 = menu.aa.builder[id].ab_enable.yaw_add_left2:get()
        yaw_add_right2 = menu.aa.builder[id].ab_enable.yaw_add_right2:get()
        defensivepitch1 = menu.aa.builder[id].ab_enable.defensivepitch1:get()
        defensivepitch2 = menu.aa.builder[id].ab_enable.defensivepitch2:get() 
        defensiveright = menu.aa.builder[id].ab_enable.yaw_add_right3:get()
        defensiveleft = menu.aa.builder[id].ab_enable.yaw_add_left3:get() 
    else
        pitch = menu.aa.builder[id].pitch:get()
        delay = menu.aa.builder[id].yaw_type.delay:get()
        defensive = menu.aa.builder[id].defensive:get()
        defensivetype = menu.aa.builder[id].defensive.defensivetype:get()
        defensivepitchtype = menu.aa.builder[id].defensive.defensivepitchtype:get()
        defensivepitch = menu.aa.builder[id].defensive.defensivepitch:get()
        defensivepitch1 = menu.aa.builder[id].defensive.defensivepitch1:get()
        defensivepitch2 = menu.aa.builder[id].defensive.defensivepitch2:get()
        defensiveright = menu.aa.builder[id].defensive.yaw_add_right:get()
        defensiveleft = menu.aa.builder[id].defensive.yaw_add_left:get()
        jit_type = menu.aa.builder[id].jit_type:get()
        custom_yaw = menu.aa.builder[id].yaw_type.options:get()
        basik = menu.aa.builder[id].yaw_type.base:get()
        center = menu.aa.builder[id].jit_type.jitter_center:get()
        body_yaw = menu.aa.builder[id].body_yaw:get()
        options = menu.aa.builder[id].body_yaw.options:get()
        randomize1 = menu.aa.builder[id].jit_type.amount:get()
        freestand = menu.aa.builder[id].body_yaw.freestand:get()
        desyncr = menu.aa.builder[id].body_yaw.desyncr:get()
        desyncl = menu.aa.builder[id].body_yaw.desyncl:get()
        yaw_type = menu.aa.builder[id].yaw_type:get()
        yaw_add = menu.aa.builder[id].yaw_type.yaw_add:get()
        yaw_add_left = menu.aa.builder[id].yaw_type.yaw_add_left:get()
        yaw_add_right = menu.aa.builder[id].yaw_type.yaw_add_right:get()
        yaw_add_left2 = menu.aa.builder[id].yaw_type.yaw_add_left2:get()
        yaw_add_right2 = menu.aa.builder[id].yaw_type.yaw_add_right2:get()
    end
    refs.yaw:override("Backward")
    refs.base:override(basik)
    refs.pitch:set(pitch)
    refs.hidden:override(defensive)
    refs.yaw_mod:override(jit_type)
    refs.body_yaw:override(body_yaw)
    refs.options:override(options)
    refs.desync_freestand:override(freestand)
    refs.desyncr:override(desyncr)
    refs.desyncl:override(desyncl)
    if randomize1 > 0 then 
        rr = center - randomize1
        rand_c = math.random(rr,center)
        pon = math.random(0, 1)
        if pon == 0 then
            randvalue = -rand_c
        else
            randvalue = rand_c
        end
    else 
        randvalue = 0
    end
    if randomize1 == 0 then
        refs.yaw_mod_degree:override(center)
    else
        refs.yaw_mod_degree:override(center+randvalue)
    end
    hgh = menu.aa.yaw_base:get()
    if defensive == true then
        refs.lag_options:override("Always On")
        refs.hs_options:override("Break LC")         
        if defensivetype == "Random" then 
            rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, 180))
        elseif defensivetype == "Opposite" then 
            rage.antiaim:override_hidden_yaw_offset(180)
        elseif  defensivetype == "180Z" then
            local calcspin = (globals.curtime * 550)
            calcspin = math.normalize_yaw(calcspin)          
            rage.antiaim:override_hidden_yaw_offset(calcspin)
        elseif defensivetype == "3-Way" then 
                local stage = cmd.tickcount % 5
                if stage == 0 then
                    rage.antiaim:override_hidden_yaw_offset(utils.random_int(-90, -90))

                elseif stage == 1 then
                     rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 180))

                elseif stage == 2 then
                    rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -160))

                end
        elseif defensivetype == "5-Way" then 
            local stage = cmd.tickcount % 3
            if stage == 0 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-90, -75))
            elseif stage == 1 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-45, -30))
            elseif stage == 2 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 75))
            elseif stage == 3 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(45, 60))
            elseif stage == 4 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 110))
            end
        elseif defensivetype == "Random Sideways" then 
            local stagesd = cmd.tickcount % 3
            if stagesd == 0 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-80, -70))
            elseif stagesd == 1 then
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(70, 80))
            end
        elseif defensivetype == "Custom Sideways" then 
            local stage = cmd.tickcount % 3
            if stage == 0 then
                rage.antiaim:override_hidden_yaw_offset(defensiveright)
            elseif stage == 1 then 
                rage.antiaim:override_hidden_yaw_offset(defensiveleft)
            end
        end
        if defensivepitchtype == "Zero" then
            rage.antiaim:override_hidden_pitch(0)
        elseif defensivepitchtype == "Down" then
            rage.antiaim:override_hidden_pitch(89)
        elseif defensivepitchtype == "Up" then
            rage.antiaim:override_hidden_pitch(-89)
        elseif defensivepitchtype == "Random" then
            rage.antiaim:override_hidden_pitch(utils.random_int(-89,89))
        elseif defensivepitchtype == "Switch" then
            local stage = cmd.tickcount % 4
            if stage == 2 then
                rage.antiaim:override_hidden_pitch(defensivepitch1)
            elseif stage == 1 then
                rage.antiaim:override_hidden_pitch(defensivepitch2)
            end
        elseif defensivepitchtype == "Automatic" then
            local stage = math.random(0,7)
            if stage == 0 then
                rage.antiaim:override_hidden_pitch(0)
            elseif stage == 1 then
                rage.antiaim:override_hidden_pitch(-20)
            elseif stage == 2 then
                rage.antiaim:override_hidden_pitch(-30)
            elseif stage == 3 then
                rage.antiaim:override_hidden_pitch(-40)
            elseif stage == 4 then
                rage.antiaim:override_hidden_pitch(-50)
            elseif stage == 5 then
                rage.antiaim:override_hidden_pitch(-60)
            elseif stage == 6 then
                rage.antiaim:override_hidden_pitch(-70)
            elseif stage == 7 then
                rage.antiaim:override_hidden_pitch(-80)
            end
        else
            rage.antiaim:override_hidden_pitch(defensivepitch)
        end
    else
        refs.lag_options:override()
        refs.hs_options:override()        
    end 
    if menu.aa.break_lc:get() then
        local stagesd = cmd.tickcount % 3
        if stagesd == 0 then
         refs.lag_options:override("Always On")
        elseif stagesd == 1 then
            refs.lag_options:override("On Peek")
        end
    else
        refs.lag_options:override()
        refs.hs_options:override()    
    end
    if menu.aa.yaw_base:get() == "Left" then 
        refs.hidden:override(false)
        refs.options:override("")
        refs.inverter:override(false)
        refs.offset:override(-90)
        refs.yaw_mod_degree:override(0)
        refs.base:override("Local View")
    elseif menu.aa.yaw_base:get() == "Right" then 
        refs.hidden:override(false)
        refs.options:override("")
        refs.inverter:override(false)
        refs.offset:override(90)
        refs.yaw_mod_degree:override(0)
        refs.base:override("Local View")
    elseif menu.aa.yaw_base:get() == "Forward" then 
        refs.hidden:override(false)
        refs.options:override("")
        refs.inverter:override(false)
        refs.offset:override(180)
        refs.yaw_mod_degree:override(0)
        refs.base:override("Local View")
    end
    if yaw_type == "Static" then 
        if menu.aa.yaw_base:get() == "Right" or menu.aa.yaw_base:get() == "Left" or menu.aa.yaw_base:get() == "Forward" then return end
        refs.offset:override(yaw_add)
        refs.inverter:override(false)
    else 
        if custom_yaw == "L/R" then
            if menu.aa.yaw_base:get() == "Right" or menu.aa.yaw_base:get() == "Left" or menu.aa.yaw_base:get() == "Forward" then return end
            refs.offset:override(rage.antiaim:inverter() and yaw_add_left or yaw_add_right)
        elseif custom_yaw == "L/R Delayed" then 
            if menu.aa.yaw_base:get() == "Right" or menu.aa.yaw_base:get() == "Left" or menu.aa.yaw_base:get() == "Forward" then return end
            if cmd.choked_commands == 0 then
            ram.tickcounts = ram.tickcounts + 1
            end
            s_tick = delay
            if  ram.tickcounts == s_tick then
                refs.offset:override(yaw_add_left)
                refs.inverter:override(true)
            end
            if  ram.tickcounts >= s_tick*3 then
                refs.offset:override(yaw_add_right)
                refs.inverter:override(true)
                ram.tickcounts = 0
            end
        elseif custom_yaw == "Jitter Dev" then 
            if menu.aa.yaw_base:get() == "Right" or menu.aa.yaw_base:get() == "Left" or menu.aa.yaw_base:get() == "Forward" then return end
            local stage= cmd.tickcount % 3
            if stage == 0 then 
                l = yaw_add_left
                r = yaw_add_right
            elseif stage== 1 then
                l = yaw_add_left2
                r = yaw_add_right2
            end
            refs.offset:override(rage.antiaim:inverter() and l or r)
        end 
    end
    
    local selectt = l_p:get_player_weapon()
    if selectt == nil then return end
    local weapon = selectt:get_classname()
    local head_check = false
    if menu.aa.safe_head:get("Knife") and string.match(weapon, "Knife") then head_check = true end
    if menu.aa.safe_head:get("Zeus") and string.match(weapon, "Taser") then head_check = true end
    if head_check == true then
        refs.yaw_mod_degree:set(0)
        refs.yaw_mod_free:set(true)
        refs.free_body:set(true)
        refs.options:set("")
        refs.inverter:set(false)
        refs.desyncl:override(60)
        refs.desyncr:override(60)
        refs.hidden:override(false)
        refs.offset:set(30)    
    end
    if id == 8 then
        if head_check == true then return end
        legit_func(cmd)
    end
    if (menu.aa.shit_aa:get() == "Shit" and entity.get_game_rules()["m_bWarmupPeriod"] == true) then
        refs.desyncr:set(math.random(0, 30))
        refs.desyncl:set(math.random(0, 30))
        refs.yaw_mod:override("Spin")
        refs.yaw_mod_degree:set(math.random(-90, 90))
    elseif (menu.aa.shit_aa:get() == "Disabled" and entity.get_game_rules()["m_bWarmupPeriod"] == true) then
        refs.enable:set(false)
    end
    if menu.aa.yaw_base:get() == "Left" or menu.aa.yaw_base:get() == "Right" or menu.aa.yaw_base:get() == "Forward" then 
        refs.freestanding:override(false)
    else
        if menu.aa.freestanding:get() then 
            refs.hidden:override(false)
            refs.freestanding:override(menu.aa.freestanding:get()) 
        else
            refs.freestanding:override(false)
        end
    end
    refs.avoid_backstab:set(menu.aa.anti_backstab:get())
end
ground_ticks, end_time = 1, 0
local function in_air()
    if not entity.get_local_player() == nil then return end
    if bit.band(entity.get_local_player()["m_fFlags"], 1) == 1 then
        ground_ticks = ground_ticks + 1
    else
        ground_ticks = 0
        end_time = globals.curtime + 1
    end
    return ground_ticks > 1 and end_time > globals.curtime
end
local function get_anim_layer(b,c)c=c or 1; b=ffi.cast(ffi.typeof('void***'),b)return ffi.cast('c_animlayers**',ffi.cast('char*',b)+0x2990)[0][c] end
local anmsupd = function(animslsg, lsg,cmd)
    local lp = entity.get_local_player()
    local local_player_ptr = get_entity_address(lp:get_index())
    if not lp or not lp:is_alive() then return end
    move = math.sqrt(lp.m_vecVelocity.x ^ 2 + lp.m_vecVelocity.y ^ 2) > 5
    jump = bit.band(lp.m_fFlags, 1) == 0
    if menu.aa.animbreaker.groundbreaker:get() == "Follow Direction" and menu.aa.animbreaker:get()  then
        lp.m_flPoseParameter[0] = 1
        refs.legmovement:set("Sliding")
    end
    if menu.aa.animbreaker.groundbreaker:get() == "Jitter" and menu.aa.animbreaker:get()  then
        local stagesd = math.random(0,1)
        if stagesd == 0 then
            lp.m_flPoseParameter[0] = 1
        elseif stagesd == 1 then    
            lp.m_flPoseParameter[0] = 0.5
        end  
        refs.legmovement:set("Sliding")
    end
    if menu.aa.animbreaker.airbreaker:get() == "Static Legs" and menu.aa.animbreaker:get()  then
        lp.m_flPoseParameter[6] = 1
    end
    if menu.aa.animbreaker.groundbreaker:get() == "MoonWalk" and menu.aa.animbreaker:get()  then
        refs.legmovement:set("Walking")
        lp.m_flPoseParameter[7] = 1
    end
    if menu.aa.animbreaker.groundbreaker:get() == "Crab" and menu.aa.animbreaker:get()  then
        refs.legmovement:set("Walking")
        if jump and move then 
            lp.m_flPoseParameter[10] = 2
        else
            lp.m_flPoseParameter[10] = 0.1
        end
    end
    if menu.aa.animbreaker.airbreaker:get() == "MoonWalk" and menu.aa.animbreaker:get()  then
        if jump and move then
            get_anim_layer(local_player_ptr, 6).m_flWeight = 1
        end
    end
    if menu.aa.animbreaker.otherbreaker:get("Pitch 0 On Land") and menu.aa.animbreaker:get()  then
        if in_air() then
            lp.m_flPoseParameter[12] = 0.5
        end
    end
end
events.post_update_clientside_animation:set(anmsupd)
events.createmove:set(function(cmd)
    aa_setup(cmd)
    fast_ladder(cmd)
end)

function under_wt()
    style = ui.get_style "Button"
    x = render.screen_size().x 
    y = render.screen_size().y 
    local penis = gradient.text_animate("C R Y S T A L I T Y ", -2, {
        color(), 
        style    
    })
    penis:animate() 
    render.text(1, vector(25, y/2), color(255,255,255,255), nil, penis:get_animated_text())  
    render.text(1, vector(85, y/2), color(255,119,119,255), nil, "           [DEV]")  
end
function animated_sidebar()
    style = ui.get_style "Button"
    style_hex = style:to_hex()
    clen = gradient.text_animate("01.12.23 ", 1.3, {
        color(120, 120, 120),
        style
    })
    clen2 = gradient.text_animate("DEV", 1.3, {
        color(120, 120, 120),
        style
    })
    clen3 = gradient.text_animate(common.get_username(), 1.3, {
        color(120, 120, 120),
        style
    })
    if menu.main.side:get() == "Twinkle" then 
        sidebarname = gradient.text_animate("Crystality ", 1.6, {
            color(120, 120, 120),
            style
        })
        sidebarname2 = gradient.text_animate("~ Dev ", -1.3, {
            color(120, 120, 120),
            style
        })
        
    else
        sidebarname = gradient.text_animate("Crystality ~ DEV",-1.3, {
            color(120, 120, 120),
            style
        })
        sidebarname2 = gradient.text_animate("", 1.3, {
            color(120, 120, 120),
            color(80, 80, 80)
        })
    end
    local icon = "\a" .. style_hex.. ui.get_icon("stars")
    ui.sidebar(sidebarname:get_animated_text()..sidebarname2:get_animated_text() , icon)
    menu.main.rek1:name("\v  \aDEFAULTLast update: "..clen:get_animated_text())
    menu.main.rek2:name("\v  \aDEFAULTCurrent Build: "..clen2:get_animated_text())
    menu.main.rek:name("\v  \aDEFAULTUsername: \v"..clen3:get_animated_text())
    sidebarname:animate()
    sidebarname2:animate()
    clen:animate()
    clen2:animate()
    clen3:animate()
end

pui.setup({menu,antiaim_builder})
local function locate( table, value )
    for i = 1, #table do
        if table[i] == value then
            return true
        end
    end
    return false
end
function export_cfg()
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    local date_cfg = common.get_date("%m.%d.%Y %H:%M")
    local config = base64.encode(json.stringify(pui.save()))
    local authors = common.get_username()
    if(menu.main.cfg_name:get() ~= "") then
        name = menu.main.cfg_name:get()
    else
        name = "-"
    end
    local cfg_to_export = {n = name, cfg = config,}
    clipboard.set(json.stringify(cfg_to_export))
end
function import_cfg()
    local imported_cfg = json.parse(clipboard.get())
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    table.insert(config_data.n, imported_cfg.n)
    table.insert(config_data.cfg, imported_cfg.cfg)
    menu.main.cfg_list:update(config_data.n)
    files.write('nl/crystality-dev/configs.cfg', json.stringify(config_data))
end
function load_cfg()
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    if(menu.main.cfg_list:get() == 1) then
        pui.load(json.parse(base64.decode("W3siYWEiOnsiYW5pbWJyZWFrZXIiOnRydWUsImFudGlfYmFja3N0YWIiOnRydWUsImJyZWFrX2xjIjp0cnVlLCJidWlsZGVyIjpbeyJhYl9lbmFibGUiOnRydWUsImJvZHlfeWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJqaXRfdHlwZSI6IkNlbnRlciIsInBpdGNoIjoiRG93biIsInlhd190eXBlIjoiQ3VzdG9tIiwifmFiX2VuYWJsZSI6eyJib2R5X3lhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVwaXRjaCI6My4wLCJkZWZlbnNpdmVwaXRjaDEiOjAuMCwiZGVmZW5zaXZlcGl0Y2gyIjowLjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6IlJhbmRvbSIsImRlZmVuc2l2ZXR5cGUiOiJSYW5kb20iLCJkZWxheSI6MTAuMCwiZGVzeW5jbCI6NTAuMCwiZGVzeW5jciI6NTcuMCwiZnJlZXN0YW5kIjoiUGVlayBGYWtlIiwiaml0X3R5cGUiOiIzLVdheSIsImppdHRlcl9jZW50ZXIiOi0xNS4wLCJvcHRpb25zIjpbIkppdHRlciIsIkFudGkgQnJ1dGVmb3JjZSIsIn4iXSwieWF3X2FkZCI6OC4wLCJ5YXdfYWRkX2xlZnQiOi0zLjAsInlhd19hZGRfcmlnaHQiOjE1LjAsInlhd19vcHRpb25zIjoiTC9SIiwieWF3X3R5cGUiOiJTdGF0aWMifSwifmJvZHlfeWF3Ijp7ImRlc3luY2wiOjMzLjAsImRlc3luY3IiOjQ1LjAsImZyZWVzdGFuZCI6Ik9mZiIsIm9wdGlvbnMiOlsiSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdfSwifmRlZmVuc2l2ZSI6eyJkZWZlbnNpdmVwaXRjaCI6Mi4wLCJkZWZlbnNpdmVwaXRjaDEiOjMyLjAsImRlZmVuc2l2ZXBpdGNoMiI6LTIyLjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6IlVwIiwiZGVmZW5zaXZldHlwZSI6IlJhbmRvbSJ9LCJ+aml0X3R5cGUiOnsiYW1vdW50Ijo1LjAsImppdHRlcl9jZW50ZXIiOi0xMC4wfSwifnlhd190eXBlIjp7ImJhc2UiOiJMb2NhbCBWaWV3IiwiZGVsYXkiOjIuMCwib3B0aW9ucyI6IkwvUiBEZWxheWVkIiwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2xlZnQiOi0xMi4wLCJ5YXdfYWRkX3JpZ2h0IjoxNi4wfX0seyJhYl9lbmFibGUiOmZhbHNlLCJib2R5X3lhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsImppdF90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3X3R5cGUiOiJTdGF0aWMiLCJ+YWJfZW5hYmxlIjp7ImJvZHlfeWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOjAuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJaZXJvIiwiZGVmZW5zaXZldHlwZSI6IlJhbmRvbSIsImRlbGF5IjowLjAsImRlc3luY2wiOjYwLjAsImRlc3luY3IiOjYwLjAsImZyZWVzdGFuZCI6Ik9mZiIsImppdF90eXBlIjoiRGlzYWJsZWQiLCJqaXR0ZXJfY2VudGVyIjowLjAsIm9wdGlvbnMiOlsifiJdLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfbGVmdCI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19vcHRpb25zIjoiTC9SIiwieWF3X3R5cGUiOiJTdGF0aWMifSwifmJvZHlfeWF3Ijp7ImRlc3luY2wiOjYwLjAsImRlc3luY3IiOjYwLjAsImZyZWVzdGFuZCI6Ik9mZiIsIm9wdGlvbnMiOlsifiJdfSwifmRlZmVuc2l2ZSI6eyJkZWZlbnNpdmVwaXRjaCI6MC4wLCJkZWZlbnNpdmVwaXRjaDEiOjAuMCwiZGVmZW5zaXZlcGl0Y2gyIjowLjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6Ilplcm8iLCJkZWZlbnNpdmV0eXBlIjoiUmFuZG9tIn0sIn5qaXRfdHlwZSI6eyJhbW91bnQiOjAuMCwiaml0dGVyX2NlbnRlciI6MC4wfSwifnlhd190eXBlIjp7ImJhc2UiOiJMb2NhbCBWaWV3IiwiZGVsYXkiOjAuMCwib3B0aW9ucyI6IkwvUiIsInlhd19hZGQiOjAuMCwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfcmlnaHQiOjAuMH19LHsiYWJfZW5hYmxlIjpmYWxzZSwiYm9keV95YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsImppdF90eXBlIjoiT2Zmc2V0IiwicGl0Y2giOiJEaXNhYmxlZCIsInlhd190eXBlIjoiU3RhdGljIiwifmFiX2VuYWJsZSI6eyJib2R5X3lhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjowLjAsImRlZmVuc2l2ZXBpdGNoMSI6MC4wLCJkZWZlbnNpdmVwaXRjaDIiOjAuMCwiZGVmZW5zaXZlcGl0Y2h0eXBlIjoiWmVybyIsImRlZmVuc2l2ZXR5cGUiOiJSYW5kb20iLCJkZWxheSI6MC4wLCJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJqaXRfdHlwZSI6IkRpc2FibGVkIiwiaml0dGVyX2NlbnRlciI6MC4wLCJvcHRpb25zIjpbIn4iXSwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfb3B0aW9ucyI6IkwvUiIsInlhd190eXBlIjoiU3RhdGljIn0sIn5ib2R5X3lhdyI6eyJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXX0sIn5kZWZlbnNpdmUiOnsiZGVmZW5zaXZlcGl0Y2giOjQuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJTd2l0Y2giLCJkZWZlbnNpdmV0eXBlIjoiUmFuZG9tIn0sIn5qaXRfdHlwZSI6eyJhbW91bnQiOjYuMCwiaml0dGVyX2NlbnRlciI6LTMuMH0sIn55YXdfdHlwZSI6eyJiYXNlIjoiTG9jYWwgVmlldyIsImRlbGF5IjowLjAsIm9wdGlvbnMiOiJML1IiLCJ5YXdfYWRkIjozLjAsInlhd19hZGRfbGVmdCI6LTMuMCwieWF3X2FkZF9yaWdodCI6MTAuMH19LHsiYWJfZW5hYmxlIjpmYWxzZSwiYm9keV95YXciOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJlbmFibGUiOmZhbHNlLCJqaXRfdHlwZSI6IkRpc2FibGVkIiwicGl0Y2giOiJEaXNhYmxlZCIsInlhd190eXBlIjoiU3RhdGljIiwifmFiX2VuYWJsZSI6eyJib2R5X3lhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZXBpdGNoIjowLjAsImRlZmVuc2l2ZXBpdGNoMSI6MC4wLCJkZWZlbnNpdmVwaXRjaDIiOjAuMCwiZGVmZW5zaXZlcGl0Y2h0eXBlIjoiWmVybyIsImRlZmVuc2l2ZXR5cGUiOiJSYW5kb20iLCJkZWxheSI6MC4wLCJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJqaXRfdHlwZSI6IkRpc2FibGVkIiwiaml0dGVyX2NlbnRlciI6MC4wLCJvcHRpb25zIjpbIn4iXSwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfb3B0aW9ucyI6IkwvUiIsInlhd190eXBlIjoiU3RhdGljIn0sIn5ib2R5X3lhdyI6eyJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJvcHRpb25zIjpbIn4iXX0sIn5kZWZlbnNpdmUiOnsiZGVmZW5zaXZlcGl0Y2giOjAuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6LTQ5LjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6Ilplcm8iLCJkZWZlbnNpdmV0eXBlIjoiUmFuZG9tIn0sIn5qaXRfdHlwZSI6eyJhbW91bnQiOjAuMCwiaml0dGVyX2NlbnRlciI6MC4wfSwifnlhd190eXBlIjp7ImJhc2UiOiJMb2NhbCBWaWV3IiwiZGVsYXkiOjAuMCwib3B0aW9ucyI6IkwvUiIsInlhd19hZGQiOjAuMCwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfcmlnaHQiOjAuMH19LHsiYWJfZW5hYmxlIjpmYWxzZSwiYm9keV95YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwiaml0X3R5cGUiOiJEaXNhYmxlZCIsInBpdGNoIjoiRG93biIsInlhd190eXBlIjoiQ3VzdG9tIiwifmFiX2VuYWJsZSI6eyJib2R5X3lhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOjAuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJaZXJvIiwiZGVmZW5zaXZldHlwZSI6IlJhbmRvbSIsImRlbGF5IjowLjAsImRlc3luY2wiOjYwLjAsImRlc3luY3IiOjYwLjAsImZyZWVzdGFuZCI6IlBlZWsgUmVhbCIsImppdF90eXBlIjoiU3BpbiIsImppdHRlcl9jZW50ZXIiOi0xOS4wLCJvcHRpb25zIjpbIkppdHRlciIsIkFudGkgQnJ1dGVmb3JjZSIsIn4iXSwieWF3X2FkZCI6MTAuMCwieWF3X2FkZF9sZWZ0IjotMjQuMCwieWF3X2FkZF9yaWdodCI6NjcuMCwieWF3X29wdGlvbnMiOiJML1IiLCJ5YXdfdHlwZSI6IlN0YXRpYyJ9LCJ+Ym9keV95YXciOnsiZGVzeW5jbCI6NTMuMCwiZGVzeW5jciI6NjAuMCwiZnJlZXN0YW5kIjoiUGVlayBGYWtlIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il19LCJ+ZGVmZW5zaXZlIjp7ImRlZmVuc2l2ZXBpdGNoIjozLjAsImRlZmVuc2l2ZXBpdGNoMSI6LTQ5LjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJSYW5kb20iLCJkZWZlbnNpdmV0eXBlIjoiU2lkZXdheXMifSwifmppdF90eXBlIjp7ImFtb3VudCI6Mi4wLCJqaXR0ZXJfY2VudGVyIjowLjB9LCJ+eWF3X3R5cGUiOnsiYmFzZSI6IkxvY2FsIFZpZXciLCJkZWxheSI6Mi4wLCJvcHRpb25zIjoiTC9SIERlbGF5ZWQiLCJ5YXdfYWRkIjozMC4wLCJ5YXdfYWRkX2xlZnQiOjUuMCwieWF3X2FkZF9yaWdodCI6LTQuMH19LHsiYWJfZW5hYmxlIjp0cnVlLCJib2R5X3lhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsImppdF90eXBlIjoiQ2VudGVyIiwicGl0Y2giOiJEb3duIiwieWF3X3R5cGUiOiJDdXN0b20iLCJ+YWJfZW5hYmxlIjp7ImJvZHlfeWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZXBpdGNoIjoyLjAsImRlZmVuc2l2ZXBpdGNoMSI6MC4wLCJkZWZlbnNpdmVwaXRjaDIiOjAuMCwiZGVmZW5zaXZlcGl0Y2h0eXBlIjoiVXAiLCJkZWZlbnNpdmV0eXBlIjoiMTgwWiIsImRlbGF5IjowLjAsImRlc3luY2wiOjQzLjAsImRlc3luY3IiOjU1LjAsImZyZWVzdGFuZCI6IlBlZWsgRmFrZSIsImppdF90eXBlIjoiMy1XYXkiLCJqaXR0ZXJfY2VudGVyIjotMTMuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sInlhd19hZGQiOi04LjAsInlhd19hZGRfbGVmdCI6LTguMCwieWF3X2FkZF9yaWdodCI6My4wLCJ5YXdfb3B0aW9ucyI6IkwvUiIsInlhd190eXBlIjoiU3RhdGljIn0sIn5ib2R5X3lhdyI6eyJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJvcHRpb25zIjpbIkppdHRlciIsIkFudGkgQnJ1dGVmb3JjZSIsIn4iXX0sIn5kZWZlbnNpdmUiOnsiZGVmZW5zaXZlcGl0Y2giOjMuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6LTI1LjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6IlJhbmRvbSIsImRlZmVuc2l2ZXR5cGUiOiJTaWRld2F5cyJ9LCJ+aml0X3R5cGUiOnsiYW1vdW50IjoyLjAsImppdHRlcl9jZW50ZXIiOjYuMH0sIn55YXdfdHlwZSI6eyJiYXNlIjoiTG9jYWwgVmlldyIsImRlbGF5IjoyLjAsIm9wdGlvbnMiOiJML1IgRGVsYXllZCIsInlhd19hZGQiOjMwLjAsInlhd19hZGRfbGVmdCI6MTIuMCwieWF3X2FkZF9yaWdodCI6MTUuMH19LHsiYWJfZW5hYmxlIjp0cnVlLCJib2R5X3lhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjpmYWxzZSwiaml0X3R5cGUiOiJPZmZzZXQiLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3X3R5cGUiOiJDdXN0b20iLCJ+YWJfZW5hYmxlIjp7ImJvZHlfeWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVwaXRjaCI6MC4wLCJkZWZlbnNpdmVwaXRjaDEiOjAuMCwiZGVmZW5zaXZlcGl0Y2gyIjowLjAsImRlZmVuc2l2ZXBpdGNodHlwZSI6Ilplcm8iLCJkZWZlbnNpdmV0eXBlIjoiUmFuZG9tIiwiZGVsYXkiOjAuMCwiZGVzeW5jbCI6NjAuMCwiZGVzeW5jciI6NjAuMCwiZnJlZXN0YW5kIjoiUGVlayBGYWtlIiwiaml0X3R5cGUiOiJSYW5kb20iLCJqaXR0ZXJfY2VudGVyIjotMTMuMCwib3B0aW9ucyI6WyJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sInlhd19hZGQiOi01MS4wLCJ5YXdfYWRkX2xlZnQiOjAuMCwieWF3X2FkZF9yaWdodCI6MC4wLCJ5YXdfb3B0aW9ucyI6IkwvUiIsInlhd190eXBlIjoiU3RhdGljIn0sIn5ib2R5X3lhdyI6eyJkZXN5bmNsIjo2MC4wLCJkZXN5bmNyIjo2MC4wLCJmcmVlc3RhbmQiOiJPZmYiLCJvcHRpb25zIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il19LCJ+ZGVmZW5zaXZlIjp7ImRlZmVuc2l2ZXBpdGNoIjo0LjAsImRlZmVuc2l2ZXBpdGNoMSI6LTI1LjAsImRlZmVuc2l2ZXBpdGNoMiI6MzIuMCwiZGVmZW5zaXZlcGl0Y2h0eXBlIjoiU3dpdGNoIiwiZGVmZW5zaXZldHlwZSI6IlJhbmRvbSJ9LCJ+aml0X3R5cGUiOnsiYW1vdW50IjozLjAsImppdHRlcl9jZW50ZXIiOi01LjB9LCJ+eWF3X3R5cGUiOnsiYmFzZSI6IkF0IFRhcmdldCIsImRlbGF5IjoyLjAsIm9wdGlvbnMiOiJML1IiLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfbGVmdCI6Ny4wLCJ5YXdfYWRkX3JpZ2h0IjotNS4wfX0seyJhYl9lbmFibGUiOmZhbHNlLCJib2R5X3lhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJlbmFibGUiOnRydWUsImppdF90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaCI6IkRpc2FibGVkIiwieWF3X3R5cGUiOiJTdGF0aWMiLCJ+YWJfZW5hYmxlIjp7ImJvZHlfeWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlcGl0Y2giOjAuMCwiZGVmZW5zaXZlcGl0Y2gxIjowLjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJaZXJvIiwiZGVmZW5zaXZldHlwZSI6IlJhbmRvbSIsImRlbGF5IjowLjAsImRlc3luY2wiOjYwLjAsImRlc3luY3IiOjYwLjAsImZyZWVzdGFuZCI6Ik9mZiIsImppdF90eXBlIjoiRGlzYWJsZWQiLCJqaXR0ZXJfY2VudGVyIjowLjAsIm9wdGlvbnMiOlsifiJdLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfbGVmdCI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjAsInlhd19vcHRpb25zIjoiTC9SIiwieWF3X3R5cGUiOiJTdGF0aWMifSwifmJvZHlfeWF3Ijp7ImRlc3luY2wiOjYwLjAsImRlc3luY3IiOjYwLjAsImZyZWVzdGFuZCI6Ik9mZiIsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdfSwifmRlZmVuc2l2ZSI6eyJkZWZlbnNpdmVwaXRjaCI6MC4wLCJkZWZlbnNpdmVwaXRjaDEiOjMyLjAsImRlZmVuc2l2ZXBpdGNoMiI6MC4wLCJkZWZlbnNpdmVwaXRjaHR5cGUiOiJVcCIsImRlZmVuc2l2ZXR5cGUiOiJSYW5kb20ifSwifmppdF90eXBlIjp7ImFtb3VudCI6MC4wLCJqaXR0ZXJfY2VudGVyIjowLjB9LCJ+eWF3X3R5cGUiOnsiYmFzZSI6IkxvY2FsIFZpZXciLCJkZWxheSI6MC4wLCJvcHRpb25zIjoiTC9SIiwieWF3X2FkZCI6LTE4MC4wLCJ5YXdfYWRkX2xlZnQiOi0xMy4wLCJ5YXdfYWRkX3JpZ2h0IjowLjB9fV0sImNvbmQiOiJBZXJvYmljIiwiZnJlZXN0YW5kaW5nIjpmYWxzZSwic2FmZV9oZWFkIjpbIn4iXSwic2VsZWN0IjoyLjAsInNoaXRfYWEiOiJTaGl0IiwieWF3X2Jhc2UiOiJEaXNhYmxlZCIsIn5hbmltYnJlYWtlciI6eyJhaXJicmVha2VyIjoiU3RhdGljIExlZ3MiLCJncm91bmRicmVha2VyIjoiSml0dGVyIiwiaml0dGVyIjo3OC4wLCJqaXR0ZXIyIjotMzEuMCwiaml0dGVyX3MiOjcuMH0sIn5mcmVlc3RhbmRpbmciOnsic3RhdGljX2ZyZWVzIjpbIk9uIE1hbnVhbCIsIn4iXX19LCJtYWluIjp7ImNmZ19saXN0IjoxLjAsImNmZ19uYW1lIjoic2lub2siLCJzaWRlIjoiRGVmYXVsdCIsInRhYnN3aXRjaGVyIjozLjB9LCJtaXNjIjp7IlNuYXBsaW5lcyI6ZmFsc2UsImFzcGVjdF9yYXRpbyI6ZmFsc2UsImN1c3RvbV9zY29wZSI6dHJ1ZSwiZW5hYmxlX2ZpeCI6dHJ1ZSwiZmFzdGN1bSI6dHJ1ZSwiZ19yYWRpdXMiOnRydWUsImhjX2VuYWJsZSI6ZmFsc2UsImhpdGxvZ3MiOnRydWUsImljbGFudGFnIjpmYWxzZSwiaW5kaWNhdG9yX2xpc3QiOlsifiJdLCJpbmRpY2F0b3JzIjp0cnVlLCJqaWsiOmZhbHNlLCJsYWdjb21wX2JveCI6dHJ1ZSwibmFkZV93YXJuaW5nIjp0cnVlLCJuZCI6dHJ1ZSwibm9fZmFsbF9kYW1hZ2UiOnRydWUsIm5vdGlmeSI6ZmFsc2UsIm90Ijp0cnVlLCJwb3NfeCI6MzM5LjAsInBvc194MSI6ODU2LjAsInBvc194MiI6MTI5NC4wLCJwb3NfeDMiOjg3MC4wLCJwb3NfeSI6MzI4LjAsInBvc195MSI6MTA2Mi4wLCJwb3NfeTIiOjU1LjAsInBvc195MyI6MTA1Ni4wLCJzaGFyZWRfaWNvbiI6dHJ1ZSwic2ltcGxlX3dtIjpmYWxzZSwic29sdXNfY29tYm8iOiJTaW1wbGUiLCJ0ZWxlcG9ydGluYWlyIjpmYWxzZSwidG1fbWQiOmZhbHNlLCJ2aWV3bW9kZWwiOmZhbHNlLCJ+YXNwZWN0X3JhdGlvIjp7ImFtb3VudCI6MTI4LjB9LCJ+Y3VzdG9tX3Njb3BlIjp7InJlbW92ZV9saW5lIjpbIn4iXSwic2NvcGVfY29sb3IiOiIjRkZGRkZGRkYiLCJzY29wZV9nYXAiOjAuMCwic2NvcGVfbGVuZ3RoIjo3NS4wLCJzY29wZV9zdHlsZSI6IkRlZmF1bHQifSwifmhjX2VuYWJsZSI6eyJpbmFpcl9oY19zbGRlaXIiOjM1LjAsIm5vc2NvcGVfaGMiOlsifiJdfSwifmhpdGxvZ3MiOnsiaGl0bG9nc19zY3JlZW5sb2dzX2NvbWJvXzEiOlsiVXBwZXItTGVmdCIsIlVuZGVyIENyb3NzaGFpciIsIn4iXSwiaGl0bG9nc19zY3JlZW5sb2dzX2hpdF9jb2xvcl8xIjoiI0ZGRkZGRkZGIn0sIn5pbmRpY2F0b3JzIjp7ImFycm93cyI6ZmFsc2UsImNyb3NzaGFpcl9jb2xvcjEiOiIjRkZGRkZGRkYiLCJjcm9zc2hhaXJfY29sb3IyIjoiIzgzRkZBREZGIiwiZHNmcyI6MS4wLCJnbG93IjowLjAsImludmVydGVyIjoiIzQ2NDY0NkZGIiwibWluZG1nIjpmYWxzZX0sIn5zaW1wbGVfd20iOnsiY29sb3IiOiIjNUY1RjVGRkYifSwifnNvbHVzX2NvbWJvIjp7ImFjY2VudF9jb2wiOiIjQTBBMEEwRkYiLCJnbG93IjowLjAsInNvbHVzX3dpZGdldHMiOlsifiJdfSwifnRlbGVwb3J0aW5haXIiOnsibGFnY29tcGRpc3QiOjEwMC4wLCJsYWdjb21wbGFuZCI6dHJ1ZSwibGFnY29tcGxvb3AiOnRydWUsImxhZ2NvbXBvcHQiOiJIaXR0YWJsZSBJbiBBaXIifSwifnRtX21kIjp7ImdnIjoibW9kZWxzL3BsYXllci9jdXN0b21fcGxheWVyL2xlZ2FjeS9jdG1fZ2lnbl92YXJpYW50QS5tZGwiLCJnZ2ciOiIifSwifnZpZXdtb2RlbCI6eyJmb3YiOjYwLjAsIngiOjEuMCwieSI6MS4wLCJ6IjotMS4wfX19XQ==")))
    else
        pui.load(json.parse(base64.decode(config_data.cfg[menu.main.cfg_list:get()])))
    end
end

function save_cfg()
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    config_data.cfg[menu.main.cfg_list:get()] = base64.encode(json.stringify(pui.save()))
    files.write('nl/crystality-dev/configs.cfg', json.stringify(config_data))
end
function create_cfg()
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    local date_cfg = common.get_date("%m.%d.%Y %H:%M")
    local cfg = base64.encode(json.stringify(pui.save()))
    local author = common.get_username()
    local name = menu.main.cfg_name:get()
    if(name ~= "" and not locate(config_data.n, name)) then
        table.insert(config_data.n, name)
        table.insert(config_data.cfg, cfg)
        files.write('nl/crystality-dev/configs.cfg', json.stringify(config_data))
    end
    menu.main.cfg_list:update(config_data.n)
end
function remove_cfg()
    psound("buttons/sonic.wav", 0.5, 100, 0, 0)
    if(menu.main.cfg_list:get() ~= 1) then
        table.remove(config_data.n, menu.main.cfg_list:get())
        table.remove(config_data.cfg, menu.main.cfg_list:get())
        files.write('nl/crystality-dev/configs.cfg', json.stringify(config_data))
        menu.main.cfg_list:update(config_data.n)
    end
end
menu.main.tabswitcher:set_callback(function(self)
    if self:get() == 1 then
        self:update("\v \aDEFAULT Informations \v· Active","\v \aDEFAULT Recommendations","\v \aDEFAULT Configurations")
    elseif self:get() == 2 then
        self:update("\v \aDEFAULT Informations","\v \aDEFAULT Recommendations \v· Active","\v \aDEFAULT Configurations")
    elseif self:get() == 3 then
        self:update("\v \aDEFAULT Informations","\v \aDEFAULT Recommendations","\v \aDEFAULT Configurations \v· Active")
    end
end, true)
events.render:set(function()
    under_wt()
    animated_sidebar()
end)


local solus_combo = visualstab:combo("Solus UI", {"Default", "Half-rounded"})
local solus_ref = solus_combo:create()
local solus_widgets = solus_ref:selectable("Widgets", {"Watermark", "Keybinds", "Spectator list"})
local custom_name = solus_ref:input("Username", ""..common.get_username().."")
local accent_col = solus_ref:color_picker("Accent color", color(139, 146, 248))
function lerpx(time,a,b) return a * (1-time) + b * time end

function window(x, y, w, h, name, alpha) 
    local name_size = render.measure_text(1, "", name) 
    local r, g, b = accent_col:get().r, accent_col:get().g, accent_col:get().b
    local r2, g2, b2 = accent_col:get().r, accent_col:get().g, accent_col:get().b

    if solus_combo:get() == 'Half-rounded' then
        render.rect_outline(vector(x - 1, y), vector(x + w + 4, y + h + 1), color(r, g, b, alpha/5), 1, 4)
        render.rect(vector(x + 3, y), vector(x + w, y + 1), color(r2, g2, b2, alpha), 4)
        render.rect(vector(x, y + 1), vector(x + w + 3, y + 16), color(0, 0, 0, alpha/4), 4)
        render.circle_outline(vector(x + 3, y + 3), color(r2, g2, b2, alpha), 4, 190, 0.33, 1)
        render.circle_outline(vector(x + w, y + 3), color(r2, g2, b2, alpha), 4, 260, 0.30, 1)
        render.gradient(vector(x - 1, y + 2), vector(x, y + h - 4), color(r2, g2, b2, alpha), color(r2, g2, b2, 0), color(r2, g2, b2, alpha/2), color(r2, g2, b2, 0))
        render.gradient(vector(x + w + 3, y + 2), vector(x + w + 4, y + h - 4), color(r2, g2, b2, alpha), color(r2, g2, b2, 0), color(r2, g2, b2, alpha/2), color(r2, g2, b2, 0))
        render.text(1, vector(x+1 + w / 2 + 1 - name_size.x / 2,    y + h / 2 -  name_size.y/2), color(255, 255, 255, alpha), "", name)
        elseif solus_combo:get() == 'Default'  then
        render.rect(vector(x, y), vector(x + w + 3, y + 2), color(r2, g2, b2, alpha), 4)
        render.rect(vector(x, y + 2), vector(x + w + 3, y + 19), color(0, 0, 0, alpha/4), 0)
        render.text(1, vector(x+1 + w / 2 + 1 - name_size.x / 2,    y + 2 + h / 2 -  name_size.y/2), color(255, 255, 255, alpha), "", name)
    end
end

local x, y, alphabinds, alpha_k, width_k, width_ka, data_k, width_spec = render.screen_size().x, render.screen_size().y, 0, 1, 0, 0, { [''] = {alpha_k = 0}}, 1

local pos_x = visualstab:slider("posx", 0, x, 150)
local pos_y = visualstab:slider("posy", 0, y, 150)
local pos_x1 = visualstab:slider("posx1", 0, x, 250)
local pos_y1 = visualstab:slider("posy1", 0, y, 250)

--@: sowus - watermark
events.render:set(function()
    if solus_widgets:get('Watermark') then
    local ticks = math.floor(1.0 / globals.tickinterval)
    local user_name = common.get_username()

    function get_ping()
        local netchannel = utils.net_channel()
    
        if netchannel == nil then
            return 0
        end
    
        return math.floor(netchannel.latency[1] * 1000)
    end
    
    local actual_time = ""
    local latency_text = ""
    local nexttext = ""

    actual_time = common.get_date("%H:%M")

    if not globals.is_in_game then
        latency_text = ''
    else
        latency_text = ' | '..get_ping().."ms"
    end

    solushex = color(accent_col:get().r, accent_col:get().g, accent_col:get().b, 255):to_hex()
    local nexttext = ('cryst\a'..solushex..'ality \aFFFFFFFF| '..custom_name:get()..latency_text.." | "..actual_time)
    local text_size = render.measure_text(1, "", nexttext).x
    window(x - text_size-19, 10, text_size + 4, 16, nexttext, 255)
    end
end)

--@: sowus - keybinds
local new_drag_object = drag_system.register({pos_x, pos_y}, vector(120, 60), "Test", function(self)
    if solus_widgets:get('Keybinds') then
    local max_width = 0
    local frametime = globals.frametime * 16
    local add_y = 0
    local total_width = 66
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
            if data_k[bind.name] == nil then data_k[bind.name] = {alpha_k = 0} end
            data_k[bind.name].alpha_k = lerpx(frametime, data_k[bind.name].alpha_k, (bind.active and 255 or 0))

            if solus_combo:get() == 'Half-rounded' then
                render.text(1, vector(self.position.x+3, self.position.y + 19 + add_y), color(255, data_k[bind.name].alpha_k), '', c_name)

                if c_name == 'Minimum damage' or c_name == 'Ping spike' then
                    render.text(1, vector(self.position.x + (width_ka - bind_state_size.x) - render.measure_text(1, nil, get_value).x + 28, self.position.y + 19 + add_y), color(255, data_k[bind.name].alpha_k), '',  '['..get_value..']')
                else
                    render.text(1, vector(self.position.x + (width_ka - bind_state_size.x - 8), self.position.y + 19 + add_y), color(255, data_k[bind.name].alpha_k), '',  '['..get_mode..']')
                end
            else
                render.text(1, vector(self.position.x+3, self.position.y + 22 + add_y), color(255, data_k[bind.name].alpha_k), '', c_name)

                if c_name == 'Minimum damage' or c_name == 'Ping spike' then
                    render.text(1, vector(self.position.x + (width_ka - bind_state_size.x) - render.measure_text(1, nil, get_value).x + 28, self.position.y + 22 + add_y), color(255, data_k[bind.name].alpha_k), '',  '['..get_value..']')
                else
                    render.text(1, vector(self.position.x + (width_ka - bind_state_size.x - 8), self.position.y + 22 + add_y), color(255, data_k[bind.name].alpha_k), '',  '['..get_mode..']')
                end
            end
            
            add_y = add_y + 16 * data_k[bind.name].alpha_k/255

            --drag
            local width_k = bind_state_size.x + bind_name_size.x + 18
            if width_k > 130-11 then
                if width_k > max_width then
                    max_width = width_k
                end
            end

            if binds.active then
                    table.insert(active_binds, binds)
                end
            end

            alpha_k = lerpx(frametime, alpha_k, (ui.get_alpha() > 0 or add_y > 0) and 1 or 0)
            width_ka = lerpx(frametime,width_ka, math.max(max_width, 130-11))
            if ui.get_alpha()>0 or add_y > 6 then alphabinds = lerpx(frametime, alphabinds, math.max(ui.get_alpha()*255, (add_y > 1 and 255 or 0)))
            elseif add_y < 15.99 and ui.get_alpha() == 0 then alphabinds = lerpx(frametime, alphabinds, 0) end
            if ui.get_alpha() or #active_binds > 0 then
            window(self.position.x, self.position.y, width_ka, 16, 'keybinds', alphabinds)
            end
    end
end)

--@: sowus - spec.list
local fnay = render.load_image(network.get("https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg"), vector(50, 50))

local new_drag_object1 = drag_system.register({pos_x1, pos_y1}, vector(120, 60), "Test2", function(self)
    if solus_widgets:get('Spectator list') then
    --drag
    local width_spec = 120
    if width_spec > 160-11 then
        if width_spec > max_width then
            max_width = width_spec
        end
    end

    if ui.get_alpha() > 0.3 or (ui.get_alpha() > 0.3 and not globals.is_in_game) then window(self.position.x, self.position.y, width_spec, 16, 'spectators', 255) end

    local me = entity.get_local_player()
    if me == nil then return end

    local speclist = me:get_spectators()

    if me.m_hObserverTarget and (me.m_iObserverMode == 4 or me.m_iObserverMode == 5) then
        me = me.m_hObserverTarget
    end

    local speclist = me:get_spectators()
    if speclist == nil then return end
    for idx,player_ptr in pairs(speclist) do
        local name = player_ptr:get_name()
        local tx = render.measure_text(1, '', name).x
        name_sub = string.len(name) > 17 and string.sub(name, 0, 17) .. "..." or name;
        local avatar = player_ptr:get_steam_avatar()
        if (avatar == nil or avatar.width <= 5) then avatar = fnay end

        if player_ptr:is_bot() and not player_ptr:is_player() then goto skip end
        render.text(1, vector(self.position.x + 17, self.position.y + 7 + (idx*15)), color(), 'u', name_sub)
        render.texture(avatar, vector(self.position.x + 1, self.position.y + 7 + (idx*15)), vector(12, 12), color(), 'f', 0)
        ::skip::
    end

   
    if #me:get_spectators() > 0 or (me.m_iObserverMode == 4 or me.m_iObserverMode == 5) then
        window(self.position.x, self.position.y, width_spec, 16, 'spectators', 255)
    end
    
    end
end)

events.render:set(function()
    pos_x:visibility(false)
    pos_y:visibility(false)
    pos_x1:visibility(false)
    pos_y1:visibility(false)

    --if ui.get_alpha() < 0.3 then return end
    local gradient_animation = gradient.text_animate("Crystality", 1.5, {
        ui.get_style()["Link Active"], 
        color(187, 196, 255)
    })

    ui.sidebar(gradient_animation:get_animated_text(), "")
    gradient_animation:animate()

    new_drag_object:update()
    new_drag_object1:update()

    accent_col:visibility(solus_widgets:get('Watermark') or solus_widgets:get('Keybinds') or solus_widgets:get('Spectator list'))
    custom_name:visibility(solus_widgets:get('Watermark'))
end)

events.mouse_input:set(function()
        if ui.get_alpha() > 0.3 then return false end
end)
--solus end


local GSINDI = visualsi:selectable("\aFFFFFFFFG\a869B33FFS \aFFFFFFC8Indicators", {'Double Tap', 'Freestanding' , "Fake Latency", "Fake Duck", "Minimum Damage", "Dormant Aimbot", "Safe Points", "Hide Shots", "Body Aim", "Fake Lag"}, 0 )
local gss = GSINDI:create()

y = 0
local verdana123 = render.load_font("Calibri", vector(22,22,1), "abd")
events.render:set(function()
    local active_binds = ui.get_binds()
    local screensize = render.screen_size()
    lp = entity.get_local_player()
    if lp == nil then return end
    local verdana1234 = render.measure_text(verdana123, "c", "DT")
    local sideind_x = 25
    local sideind_y = 36
    local DT = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
    local FS = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
    local FD = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
    local FP = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
    local MD = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
    local DA = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
    local SF = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")    
    local ON = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
    local BD = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")



if lp:is_alive() == true then
    if GSINDI:get("Minimum Damage") then
        if MD:get() >0 then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),   color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+120,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123,vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255),   nil, "Damage: ",  (MD:get()))
            sideind_x = sideind_x - sideind_y
        end     
    end
end 
if lp:is_alive() == true then
    if GSINDI:get("Fake Latency")  then
            if FP:get() >= 1 then
                render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
                render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+70,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
                render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(150,195,25,255), "с", "PING")
                sideind_x = sideind_x - sideind_y
            end
    end
end
if lp:is_alive() == true then
    if GSINDI:get("Fake Duck") then
        if FD:get() == true then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+70,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "DUCK")
            sideind_x = sideind_x - sideind_y
        end
    end
end 
if lp:is_alive() == true then
    if GSINDI:get("Hide Shots") then     
        if ON:get() == true then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+80,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "OSAA")
            sideind_x = sideind_x - sideind_y
        end 
    end
end
if lp:is_alive() == true then
    if GSINDI:get("Safe Points") then
        if SF:get() == "Force" then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+60,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "SAFE")
            sideind_x = sideind_x - sideind_y   
        end 
    end
end
if lp:is_alive() == true then
    if GSINDI:get("Body Aim") then
        if BD:get() == "Force" then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+85,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "BODY")
            sideind_x = sideind_x - sideind_y
        end 
    end
end
if lp:is_alive() == true then
    if GSINDI:get("Freestanding") then                                  
        if FS:get() == true then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x+100-2-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x+100-2-5), vector(30-verdana1234.x+50,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "FS")
            sideind_x = sideind_x - sideind_y
        end
    end
end
if lp:is_alive() == true then
    if GSINDI:get("Double Tap") then
    if DT:get() == true and rage.exploit:get() == 1 then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+50,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(208,207,205,255), "с", "DT")
            sideind_x = sideind_x - sideind_y
        end
     if DT:get() == true and rage.exploit:get() < 1 then
              render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
              render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+50,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
              render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(211,32,50,255), "с",  "DT" )
              sideind_x = sideind_x - sideind_y
        end
    end
end  
if lp:is_alive() == true then
    if GSINDI:get("Dormant Aimbot") then
    if DA:get() == true and rage.exploit:get() == 1 then
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+50,screensize.y/1.75+sideind_x+100+verdana1234.y-5), color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
            render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(0,255,0,255), "с", "DA")
            sideind_x = sideind_x - sideind_y
        end
     if DA:get() == true and rage.exploit:get() < 1 then
              render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+10,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
              render.gradient(vector(48-verdana1234.x,screensize.y/1.75+sideind_x-5+100-5), vector(30-verdana1234.x+50,screensize.y/1.75+sideind_x+100+verdana1234.y-5),  color(0, 0, 0, 40), color(0, 0, 0, 10), color(0, 0, 0, 5), color(0, 0, 0, 5))
              render.text(verdana123, vector(20,screensize.y/1.75+sideind_x-5+100), color(0,255,0,255), "с",  "DA" )
              sideind_x = sideind_x - sideind_y
        end
    end
end
end)
local function gradient(r1, g1, b1, a1, r2, g2, b2, a2, text)
    local output = ''
    local len = #text-1
    local rinc = (r2 - r1) / len
    local ginc = (g2 - g1) / len
    local binc = (b2 - b1) / len
    local ainc = (a2 - a1) / len
    for i=1, len+1 do
        output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
        r1 = r1 + rinc
        g1 = g1 + ginc
        b1 = b1 + binc
        a1 = a1 + ainc
    end

    return output
end

local function logsclr(color)
    local output = ''
    output = output .. ('\a%02x%02x%02x'):format(color.r, color.g, color.b)
    return output
end



local function to_boolean(str)
    if str == "true" or str == "false" then
        return (str == "true")
    else
        return str
    end
end     

local enable_scope = visualstab:switch("Scope Overlay", false)
offset_scope = enable_scope:create():slider("Offset", 0,500,10)
length_scope = enable_scope:create():slider("Length", 0, 1000, 60)
col_1_scope = enable_scope:create():color_picker("Color 1", color(255, 255, 255))
col_2_scope = enable_scope:create():color_picker("Color 2", color(255, 255, 255, 0))

--custom scope
anim_num = 0

lerp = function(a, b, t)
    return a + (b - a) * t
end

events.render:set(function()
    if not enable_scope:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove Overlay")
    end
    local_player = entity.get_local_player()

    if not local_player or not local_player:is_alive() or not local_player.m_bIsScoped then
        anim_num = lerp(anim_num, 0, 17 * globals.frametime)
    else
        anim_num = lerp(anim_num, 1, 17 * globals.frametime)
    end

    if enable_scope:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove All")
        render.gradient(vector(render.screen_size().x / 2 - offset_scope:get() * anim_num, render.screen_size().y / 2), vector(render.screen_size().x / 2 - offset_scope:get() * anim_num - length_scope:get() * anim_num, render.screen_size().y / 2 + 1), col_1_scope:get(), col_2_scope:get(), col_1_scope:get(), col_2_scope:get())
        render.gradient(vector(render.screen_size().x / 2 + offset_scope:get() * anim_num + 1, render.screen_size().y / 2), vector(render.screen_size().x / 2 + offset_scope:get() * anim_num + length_scope:get() * anim_num, render.screen_size().y / 2 + 1), col_1_scope:get(), col_2_scope:get(), col_1_scope:get(), col_2_scope:get())
        render.gradient(vector(render.screen_size().x / 2, render.screen_size().y / 2 + offset_scope:get() * anim_num), vector(render.screen_size().x / 2 + 1, render.screen_size().y / 2 + offset_scope:get() * anim_num + length_scope:get() * anim_num), col_1_scope:get(), col_1_scope:get(), col_2_scope:get(), col_2_scope:get())
        render.gradient(vector(render.screen_size().x / 2, render.screen_size().y / 2 - offset_scope:get() * anim_num), vector(render.screen_size().x / 2 + 1, render.screen_size().y / 2 - offset_scope:get() * anim_num - length_scope:get() * anim_num), col_1_scope:get(), col_1_scope:get(), col_2_scope:get(), col_2_scope:get())
    end
end)

enable_scope:set_callback(function(self)
    local get = self:get() 

    if not get then
        offset_scope:visibility(false)
        length_scope:visibility(false)
        col_1_scope:visibility(false)
        col_2_scope:visibility(false)
    else
        offset_scope:visibility(true)
        length_scope:visibility(true)
        col_1_scope:visibility(true)
        col_2_scope:visibility(true)
    end
end, true)

events.shutdown:set(function()
    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove Overlay")
end)

local clantagc = visualstab:switch("Clantag")

--

local clantag = {
    speed = 2,
    step = 1,
    ref = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
    list = {
'crystality',
'y crystalit',
'ty crystali',
'ity crystal',
'lity crysta',
'ality cryst',
'tality crys',
'stality cry',
'ystality cr',
'rystality c',
'crystality',
    },
    run = function (self)
        local work = function ()
            local time = math.floor( globals.curtime * self.speed + 0.5 )
            local i = time % #self.list + 1

            if i == self.step then return end
            self.step = i

            self.ref:override(false)
            common.set_clan_tag(self.list[i])
        end

        clantagc:set_callback(function (this)
            if this:get() then
                events.net_update_end:set(work)
            else
                events.net_update_end:unset(work)
                common.set_clan_tag("")
            end
        end, true)

        events.shutdown:set(function ()
            common.set_clan_tag("")
            self.ref:override()
        end)
    end
}




clantag:run()

aspect_ratio_switch = visualstab:switch("Aspect ratio", false)
viewmodel_switch = visualstab:switch("Viewmodel", false)

viewmodel_ref = viewmodel_switch:create()
viewmodel_fov = viewmodel_ref:slider("FOV", -100, 100, 68)
viewmodel_x = viewmodel_ref:slider("X", -10, 10, 2.5)
viewmodel_y = viewmodel_ref:slider("Y", -10, 10, 0)
viewmodel_z = viewmodel_ref:slider("Z", -10, 10, -1.5)

aspectratio_ref = aspect_ratio_switch:create()
aspect_ratio_slider = aspectratio_ref:slider("Value", 0, 20, 0, 0.1)

events.createmove:set(function()
    if aspect_ratio_switch:get() then
        cvar.r_aspectratio:float(aspect_ratio_slider:get()/10)
    else
        cvar.r_aspectratio:float(0)
    end
end)

events.createmove:set(function()
    if viewmodel_switch:get() then
        cvar.viewmodel_fov:int(viewmodel_fov:get(), true)
        cvar.viewmodel_offset_x:float(viewmodel_x:get(), true)
        cvar.viewmodel_offset_y:float(viewmodel_y:get(), true)
        cvar.viewmodel_offset_z:float(viewmodel_z:get(), true)
    else
        cvar.viewmodel_fov:int(68)
        cvar.viewmodel_offset_x:float(2.5)
        cvar.viewmodel_offset_y:float(0)
        cvar.viewmodel_offset_z:float(-1.5)
    end
end)

events.shutdown:set(function()
    cvar.viewmodel_fov:int(68)
    cvar.viewmodel_offset_x:float(2.5)
    cvar.viewmodel_offset_y:float(0)
    cvar.viewmodel_offset_z:float(-1.5)
end)


local x, y, ref = render.screen_size().x, render.screen_size().y, ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")

local drag_system = require "neverlose/drag_system"
local animation = require "neverlose/moon_anim"

local damage_enable = visualsi:switch("Enable Indicator", false)
local damage_color = damage_enable:create():color_picker("Color", color(255))
local damage_alpha = damage_enable:create():slider("In Scope Alpha", 0, 255, 50, 1, "%")

local damage_position_x = damage_enable:create():slider("First", 0, x, 968):visibility(false)
local damage_position_y = damage_enable:create():slider("Second", 0, y, 522):visibility(false)


local damage_drag = drag_system.register({damage_position_x, damage_position_y}, vector(10, 10), "drag", function(self)
    local lp = entity.get_local_player()
    if not lp then return end
    if not damage_enable:get() then return end

    local anim = animation.new_anim("damage", lp.m_bIsScoped and damage_alpha:get() or 255)
    local text = ref:get() == 0 and "AUTO" or ref:get()
    render.text(1, vector(self.position.x, self.position.y), color(damage_color:get().r, damage_color:get().g, damage_color:get().b, anim), "", text)
end)

events.render:set(function()
    damage_drag:update()
end)

esp.enemy:new_text('Pred. Damage', 'Damage', function(player)
    if globals.is_connected ~= true and entity.get_local_player():is_alive() ~= true then return end
    local damage, trace_info = utils.trace_bullet(entity.get_local_player(), entity.get_local_player():get_eye_position(), player:get_eye_position())
    if damage > 81 then
        return "\aFF0505FF"..damage..""
    elseif damage > 61 and damage < 82  then
        return "\aFF5A00FF"..damage..""
    elseif damage > 41 and damage < 62  then
        return "\aFF9100FF"..damage..""
    elseif damage > 21 and damage < 42  then
        return "\aFFC302FF"..damage..""
    elseif damage > 0 and damage < 22  then
        return "\aFFF600FF"..damage..""
    end
end)

local screen = render.screen_size()
local enebler     = visualsi:switch("Ragebot logs", false)
local enebler_ref = enebler:create()
local hitlog_pos  = enebler_ref:selectable("Logs position", {"Left upper side", "Screen middle"})
local anim_type   = enebler_ref:combo("Anmation type", {"None", "X +", "X -", "Y +", "Y -"});
local m_color     = enebler_ref:color_picker("Accent color", color(125, 125, 225, 255))

local hitgroup_str = {[0] = 'generic','head', 'chest', 'stomach','left arm', 'right arm','left leg', 'right leg','neck', 'generic', 'gear'}

function menu_elem()
    hitlog_pos:visibility(enebler:get())
    anim_type:visibility(enebler:get() and hitlog_pos:get("Screen middle"))
    m_color:visibility(enebler:get() and hitlog_pos:get() ~= 0)
end

function gradient_text(r1, g1, b1, a1, r2, g2, b2, a2, text)
    local output = ''
    local len = #text-1
    local rinc = (r2 - r1) / len
    local ginc = (g2 - g1) / len
    local binc = (b2 - b1) / len
    local ainc = (a2 - a1) / len
    for i=1, len+1 do
        output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
        r1 = r1 + rinc
        g1 = g1 + ginc
        b1 = b1 + binc
        a1 = a1 + ainc
    end
    return output
end

local hitlog = {}
local id = 1
events.aim_ack:set(function(event)
    local me = entity.get_local_player()
    local result = event.state
    local target = entity.get(event.target)
    local text = "%"
    if target == nil then return end
    local health = target["m_iHealth"]
    local state_1 = ""
    if enebler:get() then
        if event.state == "spread" then state_1 = "spread" end
        if event.state == "prediction error" then state_1 = "prediction error" end
        if event.state == "jitter correction" then state_1 = "unresolved jitter" end
        if event.state == "correction" then state_1 = "?" end
        if event.state == "lagcomp failure" then state_1 = "LC Failure" end
        if event.state == "death" then state_1 = "death" end
        if event.state == "player death" then state_1 = "target death" end
        if result == nil then
            hitlog[#hitlog+1] = {("Registered shot at %s's %s(%s%s) for %s (aimed: %s for %s, health remain: %s) backtrack: %s"):format(event.target:get_name(), hitgroup_str[event.hitgroup], event.hitchance, text, event.damage, hitgroup_str[event.wanted_hitgroup], event.wanted_damage, health, event.backtrack), globals.tickcount + 250, 0}
            print_raw(("\af52891cc[crystality] \ac6ffb4cc[%s] Registered shot at %s's %s(%s%s) for %s (aimed: %s for %s, health remain: %s) backtrack: %s"):format(id, event.target:get_name(), hitgroup_str[event.hitgroup], event.hitchance, text, event.damage, hitgroup_str[event.wanted_hitgroup], event.wanted_damage, health, event.backtrack))
            if hitlog_pos:get('Left upper side') then
                print_dev(("[%s] Registered shot at %s's %s(%s%s) for %s (aimed: %s for %s, health remain: %s) backtrack: %s"):format(id, event.target:get_name(), hitgroup_str[event.hitgroup], event.hitchance, text, event.damage, hitgroup_str[event.wanted_hitgroup], event.wanted_damage, health, event.backtrack))           
            end
        else
            hitlog[#hitlog+1] = {("Missed %s`s %s (dmg:%s, %s%s) due to %s | backtrack: %s"):format(event.target:get_name(), hitgroup_str[event.wanted_hitgroup], event.wanted_damage, event.hitchance, text, state_1, event.backtrack), globals.tickcount + 250, 0}
            print_raw(("\af52891cc[crystality] \aff7c7ccc[%s] Missed %s`s %s (dmg:%s, %s%s) due to %s\aff7c7ccc | backtrack: %s"):format(id, event.target:get_name(), hitgroup_str[event.wanted_hitgroup], event.wanted_damage, event.hitchance, text, state_1, event.backtrack))
            if hitlog_pos:get('Left upper side') then
                print_dev(("[%s] Missed %s`s %s (dmg:%s, %s%s) due to %s | backtrack: %s"):format(id, event.target:get_name(), hitgroup_str[event.wanted_hitgroup], event.wanted_damage, event.hitchance, text, state_1, event.backtrack))           
            end
        end
        id = id == 999 and 1 or id + 1 
    end
end)

function hit_event(event)
    local me = entity.get_local_player()
    local attacker = entity.get(event.attacker, true)
    local weapon = event.weapon
    local hit_type = ""
    if enebler:get() then
        if weapon == 'hegrenade' then 
            hit_type = 'Exploded'
        end

        if weapon == 'inferno' then
            hit_type = 'Burned'
        end

        if weapon == 'knife' then 
            hit_type = 'Hit from Knife'
        end

        if weapon == 'hegrenade' or weapon == 'inferno' or weapon == 'knife' then
            if me == attacker then
                local user = entity.get(event.userid, true)
                hitlog[#hitlog+1] = {(hit_type..' %s for %d damage (%d health remaining)'):format(user:get_name(), event.dmg_health, event.health), globals.tickcount + 250, 0}
                print_raw(('\af52891cc[crystality] \ac6ffb4cc[%s] '..hit_type..' %s for %d damage (%d health remaining)'):format(id, user:get_name(), event.dmg_health, event.health))
                print_dev(("[%s] " .. hit_type..' %s for %d damage (%d health remaining)'):format(id, user:get_name(), event.dmg_health, event.health))
            end
            id = id == 999 and 1 or id + 1 
        end
    end
end

events.render:set(function()
    if #hitlog > 0 then
        if globals.tickcount >= hitlog[1][2] then
            if hitlog[1][3] > 0 then
                hitlog[1][3] = hitlog[1][3] - 20
            elseif hitlog[1][3] <= 0 then
                table.remove(hitlog, 1)
            end
        end
        if #hitlog > 6 then
            table.remove(hitlog, 1)
        end
        if globals.is_connected == false then
            table.remove(hitlog, #hitlog)
        end
        for i = 1, #hitlog do
            text_size = render.measure_text(1, nil, hitlog[i][1]).x
            text_size_2 = render.measure_text(1, nil, "[crystality] ").x
            if hitlog[i][3] < 255 then 
                hitlog[i][3] = hitlog[i][3] + 10 
            end
            if hitlog_pos:get('Screen middle') then
                if anim_type:get() == 'None' then
                    render.text(1, vector(screen.x/2 - text_size/2 + text_size_2, screen.y/1.5 + 15 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
                    render.text(1, vector(screen.x/2 - text_size/2, screen.y/1.5 + 15 * i), color(m_color:get().r, m_color:get().g, m_color:get().b, hitlog[i][3]), nil, "[crystality]")
                end
                if anim_type:get() == 'X +' then
                    render.text(1, vector(screen.x/2 - text_size/2 + (hitlog[i][3]/35) + text_size_2, screen.y/1.5 + 15 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
                    render.text(1, vector(screen.x/2 - text_size/2 + (hitlog[i][3]/35), screen.y/1.5 + 15 * i), color(m_color:get().r, m_color:get().g, m_color:get().b, hitlog[i][3]), nil, "[crystality]")
                end
                if anim_type:get() == 'X -' then
                    render.text(1, vector(screen.x/2 - text_size/2 - (hitlog[i][3]/35) + text_size_2, screen.y/1.5 + 15 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
                    render.text(1, vector(screen.x/2 - text_size/2 - (hitlog[i][3]/35), screen.y/1.5 + 15 * i), color(m_color:get().r, m_color:get().g, m_color:get().b, hitlog[i][3]), nil, "[crystality]")
                end
                if anim_type:get() == 'Y +' then
                    render.text(1, vector(screen.x/2 - text_size/2 + text_size_2, screen.y/1.5 + (hitlog[i][3]/45) + 15 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
                    render.text(1, vector(screen.x/2 - text_size/2, screen.y/1.5 + (hitlog[i][3]/45) + 15 * i), color(m_color:get().r, m_color:get().g, m_color:get().b, hitlog[i][3]), nil, "[crystality]")
                end
                if anim_type:get() == 'Y -' then
                    render.text(1, vector(screen.x/2 - text_size/2 + text_size_2, screen.y/1.5 - (hitlog[i][3]/45) + 15 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
                    render.text(1, vector(screen.x/2 - text_size/2, screen.y/1.5 - (hitlog[i][3]/45) + 15 * i), color(m_color:get().r, m_color:get().g, m_color:get().b, hitlog[i][3]), nil, "[crystality]")
                end
            end
        end
    end
    menu_elem()
    local alpha = math.abs(1 * math.cos(2 * math.pi * (globals.curtime + 1.5) / 5)) * 255
    local alpha_2 = math.abs(1 * math.cos(2 * math.pi * (globals.curtime - 1.3) / 5)) * 255
end)

events.player_hurt:set(function(event)
    hit_event(event)
end)


local enable        = visualsi:switch("Infopanel")
local glow          = enable:create():switch("Glow")
local clr_picker    = enable:create():color_picker("UI Color", color('7D7DE1FF'))

-- Font
local font = render.load_font("nl\\crystality\\pixel.ttf", 11, 'o')

-- Gets your country code from your ip
local ip            = network.get('http://ip-api.com/json/?fields=61439')
local ip_parse      = json.parse(ip)
local countrycode   = ip_parse["countryCode"]

-- Downloads flag for your country code


-- Panel Function
local function panel()
    local lp = entity.get_local_player()
    if not lp or not lp:is_alive() or not enable:get() then return end
    local screen            = render.screen_size()
    local username_length   = render.measure_text(font, nil, common.get_username()).x
    local luaname           = 'crystality'
    local text1_length      = render.measure_text(font, nil, "> " .. luaname)

    if glow:get() then
        MTools.Render.Box_Outline_Glow(
            { 
                vector(2, screen.y / 2 + 43), vector(10 + 90 + username_length + 24, screen.y / 2 + 78)
            },
            color(clr_picker:get().r, clr_picker:get().g, clr_picker:get().b, clr_picker:get().a),
            65,
            7.5
        );
    end

    MTools.Render.Modern.Box_Outline(
        { 
            vector(2, screen.y / 2 + 43), vector(10 + 90 + username_length + 24, screen.y / 2 + 78)
        },
        {
            5, 5, 
            5, 5, 
        },
        color(clr_picker:get().r, clr_picker:get().g, clr_picker:get().b, clr_picker:get().a),
        1.25
    );

    render.text(font, vector(10 + 36, screen.y / 2 + 48), color(255, 255, 255, 255), nil, "> " .. luaname)
    render.text(font, vector(10 + 36 + text1_length.x, screen.y / 2 + 48), color(clr_picker:get().r, clr_picker:get().g, clr_picker:get().b, 255), nil, ".lua")
    render.text(font, vector(10 + 36, screen.y / 2 + 60), color(255, 255, 255, 255), nil, "> " .. common.get_username() .. " - [Nightly]")
end
events.render:set(panel)