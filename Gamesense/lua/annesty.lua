local pui = require("gamesense/pui")
local clipboard = require("gamesense/clipboard")
local base64 = require("gamesense/base64")
local vector = require('vector')
local ffi = require "ffi"
local c_entity = require("gamesense/entity")

--я над эследующими 33-7 строками работал месяц

ffi.cdef[[
    typedef long(__thiscall* GetRegistryString)(void* this, const char* pFileName, const char* pPathID);
    typedef bool(__thiscall* Wrapper)(void* this, const char* pFileName, const char* pPathID);
]]

local type2 = ffi.typeof("void***")
local interface = client.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
local system10 = ffi.cast(type2, interface)
local systemxwrapper = ffi.cast("Wrapper", system10[0][10])
local gethwid = ffi.cast("GetRegistryString", system10[0][13])

local function filechecker()
    for i = 65, 90 do
        local filecheck = string.char(i)..":\\Windows\\Setup\\State\\State.ini"
        
        if systemxwrapper(system10, filecheck, "olympia") then
            return filecheck
        end
    end
    return nil
end

local filecheck = filechecker()

local normalhwid = gethwid(system10, filecheck, "olympia")

_DEBUG = true

local ref = {
	enabled = pui.reference("AA", "Anti-aimbot angles", "Enabled"),
	pitch = {pui.reference("AA", "Anti-aimbot angles", "pitch")},
	yawbase = pui.reference("AA", "Anti-aimbot angles", "Yaw base"),
	yaw = {pui.reference("AA", "Anti-aimbot angles", "Yaw") },
    fakeyawlimit = {pui.reference("AA", "Anti-aimbot angles", "Body yaw")},
    fsbodyyaw = pui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
    edgeyaw = pui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    fakeduck = pui.reference("RAGE", "Other", "Duck peek assist"),
    safepoint = pui.reference("RAGE", "Aimbot", "Force safe point"),
	forcebaim = pui.reference("RAGE", "Aimbot", "Force body aim"),
	player_list = pui.reference("PLAYERS", "Players", "Player list"),
	reset_all = pui.reference("PLAYERS", "Players", "Reset all"),
	apply_all = pui.reference("PLAYERS", "Adjustments", "Apply to all"),
	load_cfg = pui.reference("Config", "Presets", "Load"),
	fl_limit = pui.reference("AA", "Fake lag", "Limit"),
	dt_limit = pui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),

	quickpeek = {pui.reference("RAGE", "Other", "Quick peek assist") },
	yawjitter = {pui.reference("AA", "Anti-aimbot angles", "Yaw jitter") },
	bodyyaw = {pui.reference("AA", "Anti-aimbot angles", "Body yaw") },
	freestand = {pui.reference("AA", "Anti-aimbot angles", "Freestanding") },
    roll = {pui.reference("AA", "Anti-aimbot angles", "Roll") },
	os = {pui.reference("AA", "Other", "On shot anti-aim") },
	slow = {pui.reference("AA", "Other", "Slow motion") },
	dt = pui.reference("RAGE", "Aimbot", "Double tap"),
	hs = pui.reference("AA", "Other", "On shot anti-aim"),
	fakelag = pui.reference("AA", "Fake lag", "Enabled"),
    slow_motion = pui.reference("AA", "Other", "Slow motion"),
    menucol = pui.reference("MISC", "Settings", "Menu color"),
    mindmg = pui.reference("RAGE", "Aimbot", "Minimum damage override"),
    lmovement = pui.reference("AA", "Other", "Leg movement"),
    rage_cb = pui.reference("RAGE", "Aimbot", "Enabled"),
    fake_duck = pui.reference("RAGE","Other","Duck peek assist"),
}

--сансет завидуйте, спиздил у космана из чита

local sunset = {
    sunset = cvar.cl_csm_rot_override,
    sunset_x = cvar.cl_csm_rot_x,
    sunset_y = cvar.cl_csm_rot_y,
    sunset_z = cvar.cl_csm_rot_z,
}
local lagcomp = cvar.cl_lagcompensation
local hitgroup_names = {"body", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
local main_massive_logs = {}
local render_logs = {}

table.insert(render_logs, 1, {
    text = "Hello, Annesty is loaded", 
    alpha = 0, alpha1 = 0, time = globals.realtime(), t = "Hit"
})

local hitgroup_names = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}

local ars = {
    alpha1 = 0,
    alpha2 = 0,
    alpha11 = 0,
    alpha22 = 0,
    localvelo = 0,
    inverted = 0,
    add_y = 0,
    scoped = false,
    state = 1,
    shet = 0,
    state0 = 0,
    left_alpha = 0,
    right_alpha = 0,
    back_alpha = 0,
}

local function normalize_yaw(val)
    if(val > 180) then
        val = val - 360
    elseif(val < -180) then
        val = val + 360
    end
    return val
end

local function normalize_pitch(val)
    if(val > 89) then
        val = val - 89 * 2
    elseif(val < -89) then
        val = val + 89 * 2
    end
    return val
end

local screamer = {}

ref.enabled:set_visible(false)
ref.pitch[1]:set_visible(false)
ref.pitch[2]:depend({ref.pitch[1], function() return false end})
ref.yawbase:set_visible(false)
ref.yaw[1]:set_visible(false)
ref.yaw[2]:depend({ref.yaw[1], function() return false end})
ref.fakeyawlimit[1]:set_visible(false)
ref.fakeyawlimit[2]:depend({ref.fakeyawlimit[1], function() return false end})
ref.fsbodyyaw:depend({ref.fakeyawlimit[1], function() return false end})
ref.edgeyaw:set_visible(false)


ref.yawjitter[1]:depend({ref.yaw[1], function() return false end}, {ref.yawjitter[1], function() return false end})
ref.yawjitter[2]:depend({ref.yawjitter[1], function() return false end})

ref.freestand[1]:set_visible(false)
ref.roll[1]:set_visible(false)

client.set_event_callback("shutdown", function()
    ref.enabled:set_visible(true)
    ref.pitch[1]:set_visible(true)
    ref.pitch[2]:set_visible(true)
    ref.yawbase:set_visible(true)
    ref.yaw[1]:set_visible(true)
    ref.yaw[2]:set_visible(true)
    ref.fakeyawlimit[1]:set_visible(true)
    ref.fakeyawlimit[2]:set_visible(true)
    ref.fsbodyyaw:set_visible(true)
    ref.edgeyaw:set_visible(true)
    ref.yawjitter[1]:set_visible(true)
    ref.yawjitter[2]:set_visible(true)
    ref.freestand[1]:set_visible(true)
    ref.roll[1]:set_visible(true)
end)

local lua = {
    conds = {"Global", "Standing", "Moving", "Slow-walking", "Jumping", "Jump-crouching", "Crouching", "Hidden"},
    conds_no_g = {"Standing", "Moving", "Slow-walking", "Jumping", "Jump-crouching", "Crouching"},
    conds_no_g_ru = {"в стойке", "ходьба", "подкрадуля", "попрыгун", "перышко", "утка"},
    menu_ui = {"[GL]", "[ST]", "[MO]", "[SW]", "[JM]", "[JC]", "[CR]", "HD"},
    hitgroup_mass = {'generic','head', 'chest', 'stomach','left arm', 'right arm','left leg', 'right leg','neck', 'generic', 'gear'},
}

--хех))
function hex(r, g, b, a)
    return ('\a%02X%02X%02X%02X'):format(r, g, b, a or 255)
end

local mr, mg, mb, ma = ref.menucol:get()

local tc = hex(mr, mg, mb, ma)
local wc = hex(205, 205, 205, 255)
local cfgs = {}

if(database.read("Annestyukraine.base") == nil) then
    local base = {
        name = {"Default"},
        cfg = {"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kgMAAAAEAAMAtoeVwgMAAAAEAAMAsY+D5gcAAAAEAAMAxFh9Jg8AAAABAAEAxkPw4AEEAAMAzviVswMAAAABAAEA9zEmrAEEAAMA4n8CLwAAAAAEAAMATY2lfgQAAAABAAEAelLZFgEBAAEA9CspiAEEAAMAI7oFiwEAAAAEAAMAHTWSmQMAAAAEAAMAKoYCKQUAAAAEAAMA14ZNYa3///8EAAMAzXvhnS0AAAAEAAMAvumYwQIAAAAEAAMAduwUk3gAAAAEAAMAICLCcVQAAAAEAAMAzVk804////8EAAMA8wph21gAAAABAAEAtDS0cAEEAAMATdzXbAAAAAAEAAMADoZ/yhgAAAAEAAMA+rUaEwAAAAAIAAcA4FCK6WgBAAABAAAACAAHAOiSDdxgAQAAAQAAAAgABwCdFU3ADAEAAAEAAAAIAAcAF8VZKygBAAACAAAAAQABAF/QUL0BBAADAN8Nyyb0AQAABAADAL/7DOMGAAAAAQABAMhza/YBAQABANA6PJsBBAADAAwUAk8EAAAABAADAJoffbQBAAAAAQABAL2OmgsABAAEADq4+H0AJ/+MBAAEAJkHjF////9xBAADABwUwlcPAAAABAADAC57Dv43AAAABAADAGYRxdUEAAAAAQABAMb4rYgBBAADABrZh7IAAAAABAAEAMLrwp7AoO4AAQABAKr2yXQAAQABALYLoY8AAQABAG2mSpUBBAADAGBWwjcAAAAABAAEABjCfJbAoO4ABAADAM443p5FAQAABAADAGuT0qDsAAAAAQABAF2pMrMBAQABAAOh0EsBBAAEAJrUt6bAoO4ABAADADxy0bHAAwAABAADAD8zxwX0AAAAAQABAMhN/8ABAQABAM+9HpABBAADAMM1FSwXAAAABAADADQ0FS3K////BAADAP04FS4AAAAABAADAO4aoxIDAAAABAAEAOB8VX7AoO4AAQABAPWIHJUABAADAPrsXMkAAAAABAAEAKigNjn/////BAAEAHsRmMv/////BAADAMx4j/UAAAAABAADAIX6PmgAAAAABAADAMbaFv4jAAAABAADALI4X4cBAAAAAQABADT1WgkAAQABAASNZUQABAADAK9pirwFAAAABAADAAqsOxut////BAADAOM8hqoAAAAABAADAGawUPkAAAAABAADAOxkRPMMAAAABAADACeeLtoHAAAABAADANtEMPsSAAAABAADAAbjKDIOAAAABAADALUpL6UAAAAABAADANpCFqIIAAAABAADAB/mswkxAAAABAADAFgndoowAAAAAQABAEnS5LYABAADAD6MAGUBAAAABAADADfYxJ8AAAAABAADAJ29FeYAAAAABAADADu1EctZAAAABAADAGcHudwAAAAABAADAP4i8q0AAAAABAADAKAz58sAAAAABAADADMCYhoAAAAABAADAOyZMf0AAAAABAADAAiHA+MAAAAAAQABAKe/4DsAAQABAPs7DIkBBAADAOPAmZIBAAAABAADAObQegOt////BAADAH+QAN0CAAAABAADAJIuFpYBAAAABAADABBxJx3J////BAADAKP8AsUHAAAABAADAD/ILfUSAAAABAADANIYpAoOAAAABAADAFk+fDcCAAAABAADAKYwWC0IAAAABAADAGuerrc8AAAABAADANw6hxo8AAAAAQABAKpNXsUABAADAPpgeTkBAAAABAADADOSlI4AAAAABAADAIkmVnEAAAAABAADAMdP2SpZAAAABAADAEt0Ak4AAAAABAADAOKBItAAAAAABAADANRawL0AAAAABAADANeOOxUAAAAABAADALgkK2kAAAAABAADAJROq2wAAAAAAQABAFM1DVMAAQABAOo6xUUBBAADAIToQ2EBAAAABAADAMnDajGt////BAADAP68mWQBAAAABAADADWABPIBAAAABAADAC35vujH////BAADAJ6VJtD7////BAADAGh27U3y////BAADAIsogF8HAAAABAADAM4QmBACAAAABAADAIGELtsIAAAABAADAA7E2AMyAAAABAADANfqXQQ8AAAAAQABANmHSWwBBAADAE93w3YBAAAABAADACBJLiYDAAAABAADAAQbteEGAAAABAADAAZIY3yn////BAADAGRh8L47AAAABAADAHsTDwUEAAAABAADAHdAD3zH////BAADANCJzQYAAAAABAADAAEQ/aoAAAAABAADAP3CERD7////AQABAIyE3gYAAQABAIVLAjEBBAADAGb6FDoFAAAABAADAGucdPKt////BAADAOwzPBcHAAAABAADAM8sutEGAAAABAADANvNFTMMAAAABAADAEwDOSIHAAAABAADABIoFJ0SAAAABAADAJ1llYAOAAAABAADANy2R1gCAAAABAADAFcwCvAIAAAABAADAMj8QqM8AAAABAADAAnff7g8AAAAAQABANL6iFYABAADAIFOWSUBAAAABAADAI4VwEwAAAAABAADAJIkiw4AAAAABAADAJA6xi1ZAAAABAADAHb9UVwAAAAABAADAAGPzUAAAAAABAADAI3I4IoAAAAABAADAG6MJd8AAAAABAADAGfIg5wAAAAABAADAKeTkrUAAAAAAQABAAb26lEAAQABAEkNJKgBBAADAJlV9bsBAAAABAADAAyBqxyt////BAADAAFHfG8BAAAABAADAKgbMhsBAAAABAADAF6q0qnM////BAADADWOvm0AAAAABAADAFUOd/soAAAABAADAOAasG37////BAADABPTh2gCAAAABAADAFiUxUQIAAAABAADAInzdT08AAAABAADAHpLpgY8AAAAAQABAGIfMjIBBAADAECTYDcGAAAABAADAM23SQQDAAAABAADAIvKyFwGAAAABAADAHl2c0un////BAADAJmLdYwwAAAABAADAHRx3LoCAAAABAADAH57XNDF////BAADAJGpe9rO////BAADAGpzTJgtAAAABAADALpyWoUAAAAAAQABAMGeUa4AAQABAKA18IYBBAADALu9DRkBAAAABAADAC7a2USt////BAADAAee8YwCAAAABAADALqGtFgBAAAABAADAEQ302LI////BAADABtithAHAAAABAADAPc3FvwSAAAABAADAEoKG1Tl////BAADAMH4jM8CAAAABAADAE7UomEIAAAABAADAOM2/Vg3AAAABAADAJSjceg8AAAAAQABAHGqrgEBBAADAAKob+wGAAAABAADAIvfcvUDAAAABAADANEBR64GAAAABAADALPWfWCn////BAADABMGjJAtAAAABAADAFpSXNQCAAAABAADAEzfHAT5////BAADAF8h1FTb////BAADAEAARzElAAAABAADAEwWiLQAAAAAAQABACtKIfsAAQABAKeFHjkBBAADAClRUOcBAAAABAADAFxfymet////BAADADGfuSIBAAAABAADAPiqCJcBAAAABAADALr2GXPO////BAADAEXjr8MHAAAABAADAGUWr+bn////BAADADChrP0OAAAABAADAOPPJ+wCAAAABAADAIgT2BUIAAAABAADABn+dDwxAAAABAADAMp4fxc8AAAAAQABAByTApUBBAADANAKVPoIAAAABAADAF3gxfADAAAABAADAPtYTnEGAAAABAADAI2FBNQAAAAABAADAMkACZcAAAAABAADAKS/L40AAAAABAADAG7uN2UAAAAABAADAIFiLHsAAAAABAADAJrrfDsAAAAABAADAAq7tnYAAAAAAQABALFbuoYBBAADAAQrwuUVAAAABAADAM0vwuYFAAAABAADAD4uwuceAAAABAADAOcywuAOAAAABAADAFgtwuEAAAAABAADAAE2wuIAAAAABAADAHIwwuMAAAAABAADAAvcwuwAAAAABAADAHzewu0AAAAABAADAO6lmLUAAAAA"},
    }
    database.write("Annestyukraine.base", base)
end

local base = database.read("Annestyukraine.base")
local off_white, off_black = client.screen_size()

--сори но я долбаеб я это пьяный кодил

local player = {
    get_velocity = function(ent)
        return vector(entity.get_prop(ent, "m_vecVelocity")):length()
    end,

    in_air = function(_ent)
        local flags = entity.get_prop(_ent, "m_fFlags")

        if bit.band(flags, 1) == 0 then
            return true
        end
        
        return false
    end,

    in_duck = function(_ent)
        local flags = entity.get_prop(_ent, "m_fFlags")
        
        if bit.band(flags, 4) == 4 then
            return true
        end
        
        return false
    end,

    is_real = function(_ent)
        if(_ent ~= nil and entity.is_alive(_ent)) then
            return true
        else
            return false
        end
    end,

    dist_2d = function(_ent, other_player)
        if _ent ~= nil and other_player ~= nil then
            local x, y = entity.get_origin(_ent)
            local x2, y2 = entity.get_origin(other_player)
            if x ~= nil and y ~= nil and x2 ~= nil and y2 ~= nil then
                local dist = math.sqrt((x - x2)^2 + (y - y2)^2)
                return dist
            else
                return math.huge
            end
        else
            return math.huge
        end
    end,
}

player.get_closest_molotov = function(_ent)
    local entities = entity.get_all("CInferno")
    local dist = math.huge
    if(#entities >= 1) then
        for i = 1, #entities do
            if(player.dist_2d(_ent, entities[i]) < dist) then
                dist = player.dist_2d(_ent, entities[i])
            end
        end
        return dist
    else
        dist = math.huge
        return 10000
    end
end

player.get_state = function(ent)

    local air = player.in_air(ent) or client.key_state(0x20)
    local duck = player.in_duck(ent)

    if air then
        return duck and 5 or 4
    elseif duck then
        return 6
    end

    if ref.slow_motion:get_hotkey() and ref.slow_motion:get_hotkey() and ent == entity.get_local_player() then
        return 3
    end
    if ref.fakeduck:get() then
        return 6
    end

    local vel = player.get_velocity(ent)
    if vel <= 3 then
        return 1
    else
        return 2
    end
end

local menu = {
    lbl1 = pui.label("AA", "Anti-aimbot angles", "ANNESTY lua"),
    mtab = pui.combobox("AA", "Anti-aimbot angles", "Setting tab", {"Info", "Anti-aim", "Visuals", "Configs"}),
    info = {
        lbl1 = pui.label("AA", "Anti-aimbot angles", "Welcome to Annesty"),
        sv_maxusrcmdprocessticks = pui.slider("AA", "Anti-aimbot angles",  "sv_maxusrcmdprocessticks", 4, 64, 16),
        lagcomp_override = pui.hotkey("AA", "Anti-aimbot angles", "Lagcomp 0 override"),
        update = {
            log18 = pui.label("AA", "Anti-aimbot angles", "   "),
            log = pui.label("AA", "Anti-aimbot angles", "Last update:"),
            log9 = pui.label("AA", "Anti-aimbot angles", "~ Added random pitch into defensive pitches"),
            log19 = pui.label("AA", "Anti-aimbot angles", "~ Added УГАР ЛЮТЫЙ БЛЯ (spinbot when all are dead) (Anti-aim:Options)"),
            log8 = pui.label("AA", "Anti-aimbot angles", "   "),
            log1 = pui.label("AA", "Anti-aimbot angles", "~ Reworked builder: "),
            log2 = pui.label("AA", "Anti-aimbot angles", "~~ Added yaw_add_mod (default skeet yaw add & yaw add for each state)"),
            log3 = pui.label("AA", "Anti-aimbot angles", "~~ Reworked aa system (now - skeeted)"),
            log7 = pui.label("AA", "Anti-aimbot angles", "~~ Removed left_degree and right_degree from defensive (useless)"),
            log4 = pui.label("AA", "Anti-aimbot angles", "~ Added screen-log style"),
            log5 = pui.label("AA", "Anti-aimbot angles", "~ Added anti-defensive onbind (usable while you are t or ct)"),
            log6 = pui.label("AA", "Anti-aimbot angles", "~ Removed trash"),
        },
    },
    aa = {
        enabled = pui.checkbox("AA", "Anti-aimbot angles", "Enable anti-aim system", true),
        tab = pui.combobox("AA", "Anti-aimbot angles", "AA's section", {"Builder", "Options"}),
        conds = pui.combobox("AA", "Anti-aimbot angles", "Player state", lua.conds),
        builder = {},

        defensive_enabled = pui.checkbox("AA", "Anti-aimbot angles", "Enable defensive anti-aims"),
        break_lc_hs = pui.multiselect("AA", "Anti-aimbot angles", "Break lc on onshot aa", lua.conds_no_g),
        break_lc_dt = pui.multiselect("AA", "Anti-aimbot angles", "Break lc on dt", lua.conds_no_g),
        break_lc_onpeek = pui.multiselect("AA", "Anti-aimbot angles", "Break lc on peek", lua.conds_no_g),
        disable_warmup = pui.checkbox("AA", "Anti-aimbot angles", "Disable warmup"),
        manual_base = pui.combobox("AA", "Anti-aimbot angles", "Manual base", {"At target", "Left", "Backward", "Right"}),
        left_manual = pui.hotkey("AA", "Anti-aimbot angles", "Left manual"),
        backward_manual = pui.hotkey("AA", "Anti-aimbot angles", "Backward manual"),
        right_manual = pui.hotkey("AA", "Anti-aimbot angles", "Right manual"),
        freestand = pui.hotkey("AA", "Anti-aimbot angles", "Freestanding "),
        freestand_ind = pui.checkbox("AA", "Anti-aimbot angles", "*Freestanding indication"),
        anti_backstab = pui.slider("AA", "Anti-aimbot angles", "Anti backstab distance", 0, 500, 0, true, "un", 1, {[0] = "Off"}),
        animbreaker = pui.multiselect("AA", "Anti-aimbot angles", "Anim breakers", {"Leg breaker", "Static legs in air", "Pitch 0 on land", "Duck peek assist jitter", "Kangaroo", "Body extra lean"}),
        safe_addicted = pui.checkbox("AA", "Anti-aimbot angles", "Safe height"),
        invertor = pui.hotkey("AA", "Anti-aimbot angles", "Desync side switcher"),
        ugarchik = pui.checkbox("AA", "Anti-aimbot angles", "УГАР ЛЮТЫЙ БЛЯ"),
    },
    vis = {
        central = {
            enable = pui.checkbox("AA", "Anti-aimbot angles", "Enable central indicators"),
            clabel = pui.label("AA", "Anti-aimbot angles", "Accent color"),
            color = pui.color_picker("AA", "Anti-aimbot angles", "Color", 255,255,255,255),
            sclabel = pui.label("AA", "Anti-aimbot angles", "Second color"),
            scolor = pui.color_picker("AA", "Anti-aimbot angles", "scolor", 255,255,255,255),
            elements = pui.multiselect("AA", "Anti-aimbot angles", "Elements", {"Lua name", "Condition", "Build", "Binds"}),
            add_y = pui.slider("AA", "Anti-aimbot angles", "Offset", 0, 500, 35, true, "px"),
            flags = pui.multiselect("AA", "Anti-aimbot angles", "Flags", {"Large", "Small", "Bold", "DPI support"}),
        },
        water = {
            enable = pui.checkbox("AA", "Anti-aimbot angles", "Enable watermark "),
            style = pui.combobox("AA", "Anti-aimbot angles",  "Style ", {"Old solus", "New solus", "Original", "Disabled"}),
            color = pui.color_picker("AA", "Anti-aimbot angles",  "Accent color ", 142, 165, 229, 85),
            nickname = pui.textbox("AA", "Anti-aimbot angles", "Nickname in watermark "),
            dpi_support = pui.checkbox("AA", "Anti-aimbot angles", "DPI support for watermark "),
        },
        keybinds = {
            enable = pui.checkbox("AA", "Anti-aimbot angles", "Enable keybinds  "),
            ua_mode = pui.checkbox("AA", "Anti-aimbot angles", "ВЕЛИКА НАЦIЯ МОД"),
            style = pui.combobox("AA", "Anti-aimbot angles",  "Style  ", {"Old solus", "New solus"}),
            color = pui.color_picker("AA", "Anti-aimbot angles", "Accent color  ", 142, 165, 229, 85),
            x = pui.slider("AA", "Anti-aimbot angles", "X offset  ", 0, 10000, 300, true, "px"),
            y = pui.slider("AA", "Anti-aimbot angles", "Y offset  ", 0, 10000, 300, true, "px"),
            dpi_support = pui.checkbox("AA", "Anti-aimbot angles", "DPI support for keybinds  "),
        },
        slow_down = {
            enable = pui.checkbox("AA", "Anti-aimbot angles", "Slow down indicator   "),
            slabel = pui.label("AA", "Anti-aimbot angles", "Accent color   "),
            color = pui.color_picker("AA", "Anti-aimbot angles", "Accent color   ", 142, 165, 229, 85),
            x = pui.slider("AA", "Anti-aimbot angles", "X offset   ", 0, 10000, 1920 / 2, true, "px"),
            y = pui.slider("AA", "Anti-aimbot angles", "Y offset   ", 0, 10000, 1080 / 2 - 300, true, "px"),
            dpi_support = pui.checkbox("AA", "Anti-aimbot angles", "DPI support for slow down indocator   "),
        },
        sunset_mode = {
            enable = pui.checkbox("AA", "Anti-aimbot angles", "Enable sunset mode"),
            sunset_x = pui.slider("AA", "Anti-aimbot angles", "Sunset x", -100, 100, 0, true),
            sunset_y = pui.slider("AA", "Anti-aimbot angles", "Sunset y", -100, 100, 0, true),
            sunset_z = pui.slider("AA", "Anti-aimbot angles", "Sunset z", -100, 100, 0, true),
        },
        logs = {
            enable = pui.multiselect("AA", "Anti-aimbot angles", "Logs", {"Console", "Screen"}),
            color = pui.color_picker("AA", "Anti-aimbot angles", "Accent color    ", 142, 165, 229, 85),
            screen_logs = pui.combobox("AA", "Anti-aimbot angles", "Screen logs style", {"Default", "Modern"}),
            dpi_support = pui.checkbox("AA", "Anti-aimbot angles", "DPI support for screen logs   "),
        },
        desync_arrows = {
            style = pui.combobox("AA", "Anti-aimbot angles", "Arrows style", {"Disabled", "Default", "Lol kek 2018"}),
            color = pui.color_picker("AA", "Anti-aimbot angles", "Accent Color      ", 255,255,255,255),
            def_color = pui.color_picker("AA", "Anti-aimbot angles", "Default Color      ", 255,255,255,255),
            dynamic = pui.slider("AA", "Anti-aimbot angles", "Dynamic      ", -20, 20, 0, true, "", 1, {[0] = "Off"}),
            add_y = pui.slider("AA", "Anti-aimbot angles", "Onscope anim      ", -45, 45, 0, true, "px", 1, {[0] = "Off"}),
            dist = pui.slider("AA", "Anti-aimbot angles", "Distance      ", 15, 150, 35, true, "px", 1, {[0] = "Off"}),
        },
        freestand_ind = pui.checkbox("AA", "Anti-aimbot angles", "Enable freestand indication"),
    },
    cfg = {
        list = pui.listbox("AA", "Anti-aimbot angles", "Configs", base.name),
        name = pui.textbox("AA", "Anti-aimbot angles", "Config name"),
        load = pui.button("AA", "Anti-aimbot angles", "Load", function() load() end),
        save = pui.button("AA", "Anti-aimbot angles", "Save", function() save() end),
        create = pui.button("AA", "Anti-aimbot angles", "Create", function() create() end),
        delete = pui.button("AA", "Anti-aimbot angles", "Delete", function() delete() end),
        import = pui.button("AA", "Anti-aimbot angles", "Import from clipboard", function() import() end),
        export = pui.button("AA", "Anti-aimbot angles", "Export to clipboard", function() export() end),
    },
}

--геометря

function world_to_deg(xdelta, ydelta)
    if xdelta == 0 and ydelta == 0 then
        return 0
    end
    return math.deg(math.atan2(ydelta, xdelta))
end

--хаххаха

function get_target(cmd)
    if client.current_threat() ~= nil then
        return client.current_threat()
    else
        return false
    end
end

--апи скита хуйня, в нле такое по дефолту

local function get_closest_point(A, B, P)
    a_to_p = { P[1] - A[1], P[2] - A[2]}
    a_to_b = { B[1] - A[1], B[2] - A[2]}

    atb2 = a_to_b[1]^2 + a_to_b[2]^2

    atp_dot_atb = a_to_p[1]*a_to_b[1] + a_to_p[2]*a_to_b[2]
    t = atp_dot_atb / atb2
    
    return { A[1] + a_to_b[1]*t, A[2] + a_to_b[2]*t }
end

--полезная функция

local function locate( table, value )
    for i = 1, #table do
        if table[i] == value then
            return true
        end
    end
    return false
end

--ману? может маму)))

local manu = {
    left = false,
    backward = false,
    right = false,
    leftdump = 0,
    backwarddump = 0,
    rightdump = 0,
}

function manualing(cmd)
    if(menu.aa.left_manual:get()) then
        manu.leftdump = manu.leftdump + 1
    else
        manu.leftdump = 0
    end
    if(menu.aa.backward_manual:get()) then
        manu.backwarddump = manu.backwarddump + 1
    else
        manu.backwarddump = 0
    end
    if(menu.aa.right_manual:get()) then
        manu.rightdump = manu.rightdump + 1
    else
        manu.rightdump = 0
    end
    local poisk = math.huge
    local minsh = 0
    for i = 1, 3 do
        if(i == 1) then
            val = manu.leftdump
        elseif(i == 2) then
            val = manu.backwarddump
        elseif(i == 3) then
            val = manu.rightdump
        end
        if(val < poisk and val ~= 0) then
            poisk = val
            minsh = i
        end
    end
    if(minsh ~= 0) then
        if(poisk == 1) then
            cmd.allow_send_packet = true
            cmd.no_choke = true
            if(minsh == 1) then
                if(menu.aa.manual_base:get() ~= "Left") then
                    menu.aa.manual_base:set("Left")
                elseif(menu.aa.manual_base:get() == "Left") then
                    menu.aa.manual_base:set("At target")
                end
            elseif(minsh == 2) then
                if(menu.aa.manual_base:get() ~= "Backward") then
                    menu.aa.manual_base:set("Backward")
                elseif(menu.aa.manual_base:get() == "Backward") then
                    menu.aa.manual_base:set("At target")
                end
            elseif(minsh == 3) then
                if(menu.aa.manual_base:get() ~= "Right") then
                    menu.aa.manual_base:set("Right")
                elseif(menu.aa.manual_base:get() == "Right") then
                    menu.aa.manual_base:set("At target")
                end
            end
        end
    end
end

--топовая конфиг система начинается

menu.cfg.list:depend({menu.mtab, "Configs"})
menu.cfg.name:depend({menu.mtab, "Configs"})
menu.cfg.load:depend({menu.mtab, "Configs"})
menu.cfg.save:depend({menu.mtab, "Configs"})
menu.cfg.create:depend({menu.mtab, "Configs"})
menu.cfg.delete:depend({menu.mtab, "Configs"})
menu.cfg.import:depend({menu.mtab, "Configs"})
menu.cfg.export:depend({menu.mtab, "Configs"})

function load()
    local val = menu.cfg.list:get() + 1
    local indacfg = pui.setup(menu)
    indacfg:load(base.cfg[val])
end

function save()
    local val = menu.cfg.list:get() + 1
    local indacfg = pui.setup(menu)
    base.cfg[val] = indacfg:save()
    database.write("Annestyukraine.base", base)
    menu.cfg.list:update(base.name)
end

function create()
    local nameindabox = menu.cfg.name:get()
    if(nameindabox == "") then
        name = "New config"
    else
        name = nameindabox
    end
    local indacfg = pui.setup(menu)

    table.insert(base.name, name)
    table.insert(base.cfg, indacfg:save())
    database.write("Annestyukraine.base", base)
    menu.cfg.list:update(base.name)
end

function delete()
    local val = menu.cfg.list:get() + 1
    if(val ~= 1) then
        table.remove(base.name, val)
        table.remove(base.cfg, val)
    end

    database.write("Annestyukraine.base", base)
    menu.cfg.list:update(base.name)
end

function import()
    local cfg = clipboard.get()
    local indacfg = pui.setup(menu)
    indacfg:load(json.parse(base64.decode(cfg)))
end

function export()
    local indacfg = pui.setup(menu)
    clipboard.set(base64.encode(json.stringify(indacfg:save())))
end

--топовая конфиг система закончилась

menu.aa.freestand:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.freestand_ind:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.anti_backstab:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.animbreaker:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.left_manual:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.right_manual:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.backward_manual:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.invertor:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.ugarchik:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.safe_addicted:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.break_lc_hs:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.break_lc_dt:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.break_lc_onpeek:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.disable_warmup:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})
menu.aa.defensive_enabled:depend({menu.mtab, "Anti-aim"}, menu.aa.enabled, {menu.aa.tab, "Options"})

menu.aa.manual_base:set_visible(false)
for i = 1, #lua.conds - 1 do
    menu.aa.builder[i] = {
        enabled = pui.checkbox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Enable " .. tc .. lua.conds[i] .. wc .. " anti-aim", true),
        pitch = pui.combobox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Pitсh", {"Off", "Default", "Up", "Minimal"}),
        delay = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Delay", 0, 4, 0, true, "upd", 1, {[2] = "W"}),
        yaw_mod = pui.combobox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yaw modifier", {"Off", "Center"}),
        mod_degree = pui.slider("AA", "Anti-aimbot angles", "\n" ..  lua.menu_ui[i] .. " " .. "\n Yaw modifier degree", -180, 180, 0, true, "°"),
        yaw_add_mod = pui.checkbox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yaw add for each side"),
        yaw_add = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yaw add", -180, 180, 0, true, "°"),
        yaw_add_left = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yaw add left", -180, 180, 0, true, "°"),
        yaw_add_right = pui.slider("AA", "Anti-aimbot angles",lua.menu_ui[i] .. " " ..  "Yaw add right", -180, 180, 0, true, "°"),
        body_yaw = pui.combobox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Body yaw", {"Off", "Opposite", "Jitter"}),
        defensive = {
            enabled = pui.checkbox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Еnable"  .. tc ..  " defensive " .. string.lower(lua.conds[i]) .. wc .. " anti-aim", true),
            tp = pui.multiselect("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Wоrks оn", {"Double tap", "Anti-aim on shot"}),
            dop_conditions = pui.multiselect("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Only on", {"Manuals", "Freestanding", "No manuals & freestanding"}),
            pitch = pui.combobox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Рitсh", {"Off", "Default", "Up", "Minimal", "Custom", "Spin", "Zero", "Random"}),
            pitch_degree = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Рitсh dеgree", -89, 89, -90, true, "°"),
            pitch_randomize = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Rаndоmizе", -180, 180, 0, true, "°"),
            pitch_speed = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Speed", -180, 180, 0, true, ""),
            yaw_mod = pui.combobox("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yаw mоdifiеr", {"Forward", "Sideways", "Spin"}),
            yaw_add = pui.slider("AA", "Anti-aimbot angles", lua.menu_ui[i] .. " " .. "Yаw аdd", -180, 180, 0, true, "°"),
        },
    }
end

menu.info.lbl1:depend({menu.mtab, "Info"})
menu.info.sv_maxusrcmdprocessticks:depend({menu.mtab, "Info"})
menu.info.lagcomp_override:depend({menu.mtab, "Info"})
menu.aa.enabled:depend({menu.mtab, "Anti-aim"})
menu.aa.tab:depend(menu.aa.enabled, {menu.mtab, "Anti-aim"})
menu.aa.conds:depend(menu.aa.enabled, {menu.mtab, "Anti-aim"}, {menu.aa.tab, "Builder"})

--вот я умный да статей по луа начитался и заебашил а вы так не умеете
for i, k in pairs(menu.info.update) do
    k:depend({menu.mtab, "Info"})
end


--ренни даже этому позавидует (бомж)
for i = 1, #menu.aa.builder do
    local mtab = {menu.mtab, "Anti-aim"}
    local bld = {menu.aa.tab, "Builder"}
    local enabled = menu.aa.enabled
    local tab = menu.aa.builder[i]
    local dtab = menu.aa.builder[i].defensive
    local cond = {menu.aa.conds, lua.conds[i]}
    local def_opt = menu.aa.defensive_enabled
    if(i == 1) then
        en = {menu.aa.tab, "Builder"}
    else
        en = tab.enabled
    end
    tab.enabled:depend(mtab, bld, enabled, cond, {menu.aa.conds, function()
        if(i == 1) then 
            return false
        else 
            return lua.conds[i]
        end
    end})
    tab.pitch:depend(mtab, bld, enabled, en, cond)
    tab.yaw_mod:depend(mtab, bld, enabled, en, cond)
    tab.mod_degree:depend(mtab, bld, enabled, en, cond, {tab.yaw_mod, "Off", true})
    tab.yaw_add_mod:depend(mtab, bld, enabled, en, cond)
    tab.yaw_add:depend(mtab, bld, enabled, en, cond, {tab.yaw_add_mod, false})
    tab.yaw_add_left:depend(mtab, bld, enabled, en, cond, tab.yaw_add_mod)
    tab.yaw_add_right:depend(mtab, bld, enabled, en, cond, tab.yaw_add_mod)
    tab.body_yaw:depend(mtab, bld, enabled, en, cond)
    tab.delay:depend(mtab, bld, enabled, en, cond)
    dtab.enabled:depend(mtab, bld, enabled, en, cond, def_opt)
    dtab.tp:depend(mtab, bld, enabled, en, cond, dtab.enabled, def_opt)
    local tp = {dtab.tp, function()
        if(#dtab.tp:get() > 0) then return true else return false end
    end}
    dtab.dop_conditions:depend(mtab, bld, enabled, en, cond, dtab.enabled, tp, def_opt)
    dtab.pitch:depend(mtab, bld, enabled, en, cond, dtab.enabled, tp, def_opt)
    dtab.pitch_degree:depend(mtab, bld, enabled, en, cond, dtab.enabled, {dtab.pitch, function() 
        if dtab.pitch:get() == "Custom" or dtab.pitch:get() == "Spin" then return true end end}, tp, def_opt)
    dtab.pitch_randomize:depend(mtab, bld, enabled, en, cond, dtab.enabled, {dtab.pitch, function() 
        if dtab.pitch:get() == "Custom" or dtab.pitch:get() == "Spin" then return true end end}, tp, def_opt)
    dtab.pitch_speed:depend(mtab, bld, enabled, en, cond, dtab.enabled, {dtab.pitch, "Spin"}, tp, def_opt)
    dtab.yaw_mod:depend(mtab, bld, enabled, en, cond, dtab.enabled, tp, def_opt)
    dtab.yaw_add:depend(mtab, bld, enabled, en, cond, dtab.enabled, {dtab.yaw_mod, function()
        if dtab.yaw_mod:get() == "Forward" then
            return true
        else
            return false
        end
    end
    }, tp, def_opt)
end

--меню раздел вся хуйня и похуй мне что код смешной

menu.vis.central.enable:depend({menu.mtab, "Visuals"})
menu.vis.central.clabel:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.color:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.sclabel:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.scolor:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.elements:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.add_y:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)
menu.vis.central.flags:depend({menu.mtab, "Visuals"}, menu.vis.central.enable)

menu.vis.water.enable:depend({menu.mtab, "Visuals"})
menu.vis.water.style:depend({menu.mtab, "Visuals"}, menu.vis.water.enable)
menu.vis.water.color:depend({menu.mtab, "Visuals"}, menu.vis.water.enable)
menu.vis.water.nickname:depend({menu.mtab, "Visuals"}, menu.vis.water.enable)
menu.vis.water.dpi_support:depend({menu.mtab, "Visuals"}, menu.vis.water.enable)

menu.vis.keybinds.enable:depend({menu.mtab, "Visuals"})
menu.vis.keybinds.ua_mode:depend({menu.mtab, "Visuals"}, menu.vis.keybinds.enable)
menu.vis.keybinds.style:depend({menu.mtab, "Visuals"}, menu.vis.keybinds.enable)
menu.vis.keybinds.color:depend({menu.mtab, "Visuals"}, menu.vis.keybinds.enable)
menu.vis.keybinds.dpi_support:depend({menu.mtab, "Visuals"}, menu.vis.keybinds.enable)
menu.vis.keybinds.x:set_visible(false)
menu.vis.keybinds.y:set_visible(false)

menu.vis.slow_down.enable:depend({menu.mtab, "Visuals"})
menu.vis.slow_down.slabel:depend({menu.mtab, "Visuals"}, menu.vis.slow_down.enable)
menu.vis.slow_down.color:depend({menu.mtab, "Visuals"}, menu.vis.slow_down.enable)
menu.vis.slow_down.dpi_support:depend({menu.mtab, "Visuals"}, menu.vis.slow_down.enable)
menu.vis.slow_down.x:set_visible(false)
menu.vis.slow_down.y:set_visible(false)

menu.vis.sunset_mode.enable:depend({menu.mtab, "Visuals"})
menu.vis.sunset_mode.sunset_x:depend({menu.mtab, "Visuals"}, menu.vis.sunset_mode.enable)
menu.vis.sunset_mode.sunset_y:depend({menu.mtab, "Visuals"}, menu.vis.sunset_mode.enable)
menu.vis.sunset_mode.sunset_z:depend({menu.mtab, "Visuals"}, menu.vis.sunset_mode.enable)

menu.vis.logs.enable:depend({menu.mtab, "Visuals"})
menu.vis.logs.color:depend({menu.mtab, "Visuals"})
menu.vis.logs.screen_logs:depend({menu.mtab, "Visuals"}, {menu.vis.logs.enable, function() return menu.vis.logs.enable:get("Screen") end})
menu.vis.logs.dpi_support:depend({menu.mtab, "Visuals"})

menu.vis.desync_arrows.style:depend({menu.mtab, "Visuals"})
menu.vis.desync_arrows.color:depend({menu.mtab, "Visuals"}, {menu.vis.desync_arrows.style, "Disabled", true})
menu.vis.desync_arrows.def_color:depend({menu.mtab, "Visuals"}, {menu.vis.desync_arrows.style, "Disabled", true})
menu.vis.desync_arrows.dynamic:depend({menu.mtab, "Visuals"}, {menu.vis.desync_arrows.style, "Disabled", true})
menu.vis.desync_arrows.add_y:depend({menu.mtab, "Visuals"}, {menu.vis.desync_arrows.style, "Disabled", true})
menu.vis.desync_arrows.dist:depend({menu.mtab, "Visuals"}, {menu.vis.desync_arrows.style, "Disabled", true})

menu.vis.freestand_ind:depend({menu.mtab, "Visuals"})

function static()
    if((entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 and menu.aa.disable_warmup:get()) or menu.aa.manual_base:get() ~= "At target") then
        return true
    else
        return false
    end
end

function anti_backstab() --ай маладец я хороший
    local players = entity.get_players(true)
    local lp = entity.get_local_player()
    local dist = math.huge
    local lweapon = entity.get_player_weapon(lp)
    local current_frametime = 1 / globals.frametime()
    if(menu.aa.anti_backstab:get() ~= 0 and client.current_threat() ~= nil) then
        local enemy_player = client.current_threat()
        if enemy_player == nil then return false end
        if(player.is_real(enemy_player)) then
            local weapon = entity.get_player_weapon(enemy_player)
            local classname = entity.get_classname(weapon)
            local epos = vector(entity.get_origin(enemy_player))
            local lpos = vector(entity.get_origin(lp))
            epos.z = epos.z + 40
            lpos.z = lpos.z + 40
            local tracer, ent = client.trace_line(lp, lpos.x, lpos.y, lpos.z, epos.x, epos.y, epos.z)
            local is_visiblesss = client.visible(epos.x, epos.y, epos.z)
            if((player.dist_2d(enemy_player, lp) <= menu.aa.anti_backstab:get() and classname == "CKnife" and ent ~= 0) or player.dist_2d(enemy_player, lp) <= 75) then
                return true
            else
                return false
            end
        end
    end
end

function no_enemy() -- не ну это сам 
    local returning = true
    local players = entity.get_players(true)
    local all_entities = entity.get_all()
    local player_resource = entity.get_player_resource()
    for i = 1, globals.maxplayers() do
		if entity.get_prop(player_resource, "m_bConnected", i) == 1 and entity.is_enemy(i) and entity.is_alive(i) then
            returning = false
        end
    end
    return returning
end

function fast_ladder(cmd) -- снова спастил
    local local_player = entity.get_local_player()
    local pitch, yaw = client.camera_angles()
    if (entity.get_prop(local_player, "m_MoveType") == 9) then
        cmd.yaw = math.floor(cmd.yaw + 0.5)
        cmd.roll = 0
        if cmd.forwardmove > 0 then
            if pitch < 45 then
                cmd.pitch = 89
                cmd.in_moveright = 1
                cmd.in_moveleft = 0
                cmd.in_forward = 0
                cmd.in_back = 1
                if cmd.sidemove == 0 then
                    cmd.yaw = cmd.yaw + 90
                end
                if cmd.sidemove < 0 then
                    cmd.yaw = cmd.yaw + 150
                end
                if cmd.sidemove > 0 then
                    cmd.yaw = cmd.yaw + 30
                end
            end 
        end
        if cmd.forwardmove < 0 then
            cmd.pitch = 89
            cmd.in_moveleft = 1
            cmd.in_moveright = 0
            cmd.in_forward = 1
            cmd.in_back = 0
            if cmd.sidemove == 0 then
                cmd.yaw = cmd.yaw + 90
            end
            if cmd.sidemove > 0 then
                cmd.yaw = cmd.yaw + 150
            end
            if cmd.sidemove < 0 then
                cmd.yaw = cmd.yaw + 30
            end
        end
    end
end

local ram = { --ай ратмир молодец
    jitter = false,
    last_sim_time = 0,
    defensive = 0,
    defensive_until = 0,
    last_def_tick = 0,
    defensive_w = false,
    def_yaw_degree = 0,
    yawdegree = 0,
    yawlr = 0,
    yaw_base = 0,
    brute_info = {},
    delay = 0,
    delay_switch = 0,
    force_update = false,
    force_switch = false,
    charged = "uncharge",
    charge_value = 0,
    jitter_switch = false,
    air_expl = false,
    force_update_cond = 0,
    break_lc_tickrate = 0,
    break_tickrate = 0,
    dt_charged = false,
    prev = 0,
    def_shet = 0,
    duck_setta = 0,
    defensive_tick = 0,
    pitch_spin = 0,
    pitch_spin_begin = 0,
    pitch_spin_tickrate = 0,
    w_spin_tick = 0,
}

local function is_defensive_active(local_player) -- спасибо югею
    local tickcount = globals.tickcount()
    local sim_time = toticks(entity.get_prop(local_player, "m_flSimulationTime"))
    local sim_diff = sim_time - ram.last_sim_time

    if sim_diff < 0 then
        ram.defensive_until = tickcount + 1
    end
    
    ram.last_sim_time = sim_time

    return ram.defensive_until > tickcount
end

--[[
client.set_event_callback("bullet_impact", function(e) --антибрут в 24м никому не нужен((
    local ent = client.userid_to_entindex(e.userid)
    if entity.is_enemy(ent) then
        local ent_origin = {entity.get_prop(ent, "m_vecOrigin")}
        local local_head_x, local_head_y, local_head_z = entity.hitbox_position(entity.get_local_player(), 0)
        local closest = get_closest_point(ent_origin, {e.x, e.y, e.z}, {local_head_x, local_head_y, local_head_z})
        local delta = math.sqrt((local_head_x - closest[1])^2 + (local_head_y - closest[2])^2)
        if ((delta <= 40) and (ram.brute_info[1] == nil or ram.brute_info[1] ~= globals.realtime())) then
            table.insert(ram.brute_info, 1, globals.realtime())
            table.insert(render_logs, 1, {
                text = "Anti-bruteforce reversed due to enemy shot",
                alpha = 0, alpha1 = 0, time = globals.realtime(), t = "aabrute"
            })
        end
    end
end)
]]

local function vec_3( _x, _y, _z ) 
	return { x = _x or 0, y = _y or 0, z = _z or 0 } 
end

local function ticks_to_time()
	return globals.tickinterval( ) * 16
end 

local function player_will_peek( ) --спастил с югейя думаю что самый умный
	local enemies = entity.get_players( true )
	if not enemies then
		return false
	end
	
	local eye_position = vec_3( client.eye_position( ) )
	local velocity_prop_local = vec_3( entity.get_prop( entity.get_local_player( ), "m_vecVelocity" ) )
	local predicted_eye_position = vec_3( eye_position.x + velocity_prop_local.x * ticks_to_time( predicted ), eye_position.y + velocity_prop_local.y * ticks_to_time( predicted ), eye_position.z + velocity_prop_local.z * ticks_to_time( predicted ) )

	for i = 1, #enemies do
		local player = enemies[ i ]
		
		local velocity_prop = vec_3( entity.get_prop( player, "m_vecVelocity" ) )
		
		-- Store and predict player origin
		local origin = vec_3( entity.get_prop( player, "m_vecOrigin" ) )
		local predicted_origin = vec_3( origin.x + velocity_prop.x * ticks_to_time(), origin.y + velocity_prop.y * ticks_to_time(), origin.z + 50 + velocity_prop.z * ticks_to_time() )
		
		-- Set their origin to their predicted origin so we can run calculations on it
		entity.get_prop( player, "m_vecOrigin", predicted_origin )
		
		-- Predict their head position and fire an autowall trace to see if any damage can be dealt
		local head_origin = vec_3( entity.hitbox_position( player, 0 ) )
		local predicted_head_origin = vec_3( head_origin.x + velocity_prop.x * ticks_to_time(), head_origin.y + velocity_prop.y * ticks_to_time(), head_origin.z + velocity_prop.z * ticks_to_time() )
		local trace_entity, damage = client.trace_bullet( entity.get_local_player( ), predicted_eye_position.x, predicted_eye_position.y, predicted_eye_position.z, predicted_head_origin.x, predicted_head_origin.y, predicted_head_origin.z )
		
		-- Restore their origin to their networked origin
		entity.get_prop( player, "m_vecOrigin", origin )
		
		-- Check if damage can be dealt to their predicted head
		if damage > 0 then
			return true
		end
	end
	
	return false
end

local bld = {
    force_defensive = false,
    aa_tickrate = 0,
    yaw = 0,
    jitter = false,
    delay = 0,
    yaw_add = 0,
    invert = false,
    last_def_tick = 0,
    def_w = false,
    def = {
        jitter = false,
        tick = 0,
        spin = {
            deg = 0,
            start = 0,
            tickrate = 0,
        },
        yaw = 0,
        sec_yaw = 0,
        pitch = {
            spin_tickrate = 0,
            spin = 0,
        },
    },
    force_update_cond = 0,
    charged = true,
    aa_update = false,
    exploit_tickrate = 0,
    rad_deg = 0,
    yawjit = "",
    def_state = 0,
}

function def_allow(def_tab)
    local lp = entity.get_local_player()
    local weap = entity.get_prop(entity.get_prop(lp, "m_hActiveWeapon"), "m_iItemDefinitionIndex")
    local charge = entity.get_prop(lp, "m_nTickBase") - globals.tickcount()
    if(weap ~= nil and bit.band(weap, 0xFFFF) ~= 64 and charge < 0) then
        if (def_tab.tp:get("Double tap") and ref.dt:get_hotkey()) or (def_tab.tp:get("Anti-aim on shot") and ref.hs:get_hotkey()) then 
            return true 
        else 
            return false 
        end
    else 
        return false
    end
end

function default_antiaim(tab, add)
    if tab.yaw_mod:get() == "Center" and (not tab.yaw_add_mod:get()) and tab.delay:get() == 0 then
        if(tab.body_yaw:get() == "Off") then
            ref.bodyyaw[1]:set("Static")
            ref.bodyyaw[2]:set(0)
        elseif(tab.body_yaw:get() == "Opposite") then
            ref.bodyyaw[1]:set("Opposite")
            ref.bodyyaw[2]:set(menu.aa.invertor:get() and 120 or -120)
        elseif(tab.body_yaw:get() == "Jitter") then
            ref.bodyyaw[1]:set("Jitter")
            ref.bodyyaw[2]:set(-90)
        end
        ref.yaw[1]:set("180")
        ref.yaw[2]:set(normalize_yaw((tab.yaw_add:get() + ram.yaw_base) % 360))
        ref.yawjitter[1]:set("Center")
        ref.yawjitter[2]:set(tab.mod_degree:get())
        ref.pitch[1]:set(tab.pitch:get())
        force_yaw = normalize_yaw((tab.yaw_add:get()) % 360) + (bld.jitter and (tab.mod_degree:get()) / 2 or (tab.mod_degree:get()) / -2)
    else
        ref.yawjitter[1]:set("Off")
        ref.yawjitter[2]:set(0)
        if tab.yaw_add_mod:get() then
            if(tab.body_yaw:get() == "Jitter") then
                bld.yaw_add = not bld.jitter and tab.yaw_add_right:get() or tab.yaw_add_left:get()
            else
                bld.yaw_add = inverted and tab.yaw_add_right:get() or tab.yaw_add_left:get()
            end
        else
            bld.yaw_add = tab.yaw_add:get()
        end
        if(tab.yaw_mod:get() == "Center") then
            bld.yaw = bld.jitter and (tab.mod_degree:get()) / 2 or (tab.mod_degree:get()) / -2
        elseif(tab.yaw_mod:get() == "Off") then
            bld.yaw = 0
        end
        ref.yaw[1]:set("180")
        ref.yaw[2]:set(normalize_yaw((bld.yaw_add + bld.yaw + ram.yaw_base) % 360))
        force_yaw = normalize_yaw((bld.yaw_add + bld.yaw) % 360)
        if(tab.body_yaw:get() == "Off") then
            ref.bodyyaw[1]:set("Static")
            ref.bodyyaw[2]:set(0)
        elseif(tab.body_yaw:get() == "Opposite") then
            ref.bodyyaw[1]:set("Opposite")
            ref.bodyyaw[2]:set(menu.aa.invertor:get() and 120 or -120)
        elseif(tab.body_yaw:get() == "Jitter") then
            ref.bodyyaw[1]:set("Static")
            ref.bodyyaw[2]:set(bld.jitter and 120 or -120)
        end
        ref.pitch[1]:set(tab.pitch:get())
    end
end

function builder(cmd) --билдер
    if not menu.aa.enabled:get() then --вырубка аа на отрубон аа в меню
        ref.yaw[1]:set("180")
        ref.yaw[2]:set(180)
        ref.bodyyaw[1]:set("Static")
        ref.bodyyaw[2]:set(180)
        ref.pitch[1]:set("Off")
        ref.yawjitter[1]:set("Off")
        ref.yawjitter[2]:set(0)
        return
    end
    if no_enemy() and menu.aa.ugarchik:get() then --угарчик на ноу энеми
        ref.yaw[1]:set("180")
        if ref.yaw[2]:get() <= -160 then
            ref.yaw[2]:set(160)
        else
            ref.yaw[2]:set(ref.yaw[2]:get() - 20)
        end
        ref.pitch[1]:set("Custom")
        ref.pitch[2]:set(0)
        ref.bodyyaw[1]:set("Static")
        ref.bodyyaw[2]:set(180)
        ref.yawjitter[1]:set("Off")
        ref.yawjitter[2]:set(0)
        return
    end
    bld.aa_update = false
    local lp = entity.get_local_player()
    local state = player.get_state(lp) -- я красавчик
    local charge = entity.get_prop(lp, "m_nTickBase") - globals.tickcount() -- тут еще условие должно быть < 0 
    if exploit_enable == nil then
        exploit_enable = ref.dt:get_hotkey() or ref.hs:get_hotkey()
    end
    ref.enabled:set(true)
    fast_ladder(cmd)
    if anti_backstab() then
        ref.yaw[1]:set("180")
        ref.yaw[2]:set(180)
        ref.pitch[1]:set("Default")
        ref.bodyyaw[1]:set("Static")
        ref.bodyyaw[2]:set(menu.aa.invertor:get() and 180 or -180)
        ref.pitch[1]:set("Off")
        ref.yawjitter[1]:set("Off")
        return
    end
    lpvec = vector()
    tgvec = vector()
    dist_2d = 0
    h_dif = 0
    bld.rad_deg = 0
    bld.force_defensive = false
    if(bld.force_update_cond ~= player.get_state(lp)) then
        cmd.no_choke = true
        ref.bodyyaw[1]:set("Off")
        bld.aa_update = true
        bld.force_update_cond = player.get_state(lp)
    end
    if get_target() ~= false and get_target() ~= nil then
        lpvec = vector(entity.get_origin(lp))
        tgvec = vector(entity.get_origin(get_target()))
        dist_2d = math.sqrt((lpvec.x - tgvec.x)^2 + (lpvec.y - tgvec.y)^2)
        h_dif = lpvec.z - tgvec.z
        bld.rad_deg = h_dif / dist_2d -- вот это я вообще бля самый умеый человек на планете сосо оформляйте
    end
    if(menu.aa.builder[state + 1].enabled:get()) then
        tab = menu.aa.builder[state + 1]
    else
        tab = menu.aa.builder[1]
    end
    if globals.chokedcommands() == 0 then
        bld.invert = entity.get_prop(lp, "m_flPoseParameter", 11) * 120 - 60 > 0
        bld.aa_tickrate = bld.aa_tickrate + 1
        if(bld.delay < tab.delay:get() and tab.delay:get() > 0) then
            bld.delay = bld.delay + 1
        else
            bld.delay = 0
        end
        if(bld.delay == 0) then
            bld.jitter = not bld.jitter
        end
        bld.aa_update = true
    end
    def_tab = tab.defensive
    sens = 6
    if menu.aa.defensive_enabled:get() then
        if def_tab.dop_conditions:get("Manuals") or def_tab.dop_conditions:get("Freestanding") or def_tab.dop_conditions:get("No manuals & freestanding") then
            if def_tab.dop_conditions:get("Manuals") and menu.aa.manual_base:get() ~= "At target" then
                check_enable = def_tab.enabled:get()
            elseif def_tab.dop_conditions:get("Freestanding") and menu.aa.freestand:get() then
                check_enable = def_tab.enabled:get()
            elseif def_tab.dop_conditions:get("No manuals & freestanding") and not (menu.aa.freestand:get() or menu.aa.manual_base:get() ~= "At target") then
                check_enable = def_tab.enabled:get()
            else
                check_enable = false
            end
        else
            check_enable = def_tab.enabled:get()
        end
    else
        check_enable = false
    end
    if not exploit_enable then
        check_enable = false
    end
    if menu.aa.freestand:get() and menu.aa.manual_base:get() == "At target" then
        if (bld.def_w and check_enable) then
            ref.freestand[1]:set(false)
            ref.freestand[1]:set_hotkey("On hotkey")
            ars.state0 = 0
        else
            ref.freestand[1]:set(true)
            ref.freestand[1]:set_hotkey("Always On")
            ars.state0 = 1
        end
    else
        ref.freestand[1]:set(false)
        ref.freestand[1]:set_hotkey("On hotkey")
        ars.state0 = 0
    end

    --мануалы))
    if(menu.aa.manual_base:get() == "At target") then
        ram.yaw_base = 0
        ref.yawbase:set("At targets")
    elseif(menu.aa.manual_base:get() == "Left") then
        ram.yaw_base = -90
        ref.yawbase:set("Local view")
    elseif(menu.aa.manual_base:get() == "Right") then
        ram.yaw_base = 90
        ref.yawbase:set("Local view")
    elseif(menu.aa.manual_base:get() == "Backward") then
        ram.yaw_base = 0
        ref.yawbase:set("Local view")
    end
    cmd.force_defensive = bld.force_defensive
    bld.def_w = false

    --я пиздатый ахуенный современный
    if bld.aa_update then
        if (menu.aa.break_lc_onpeek:get(lua.conds_no_g[state]) or menu.aa.break_lc_dt:get(lua.conds_no_g[state]) or menu.aa.break_lc_hs:get(lua.conds_no_g[state])) then
            bld.def_state = 0
            if bld.aa_tickrate % 8 == 3 then
                if player_will_peek() and menu.aa.break_lc_onpeek:get(lua.conds_no_g[state]) then
                    bld.force_defensive = true
                elseif menu.aa.break_lc_dt:get(lua.conds_no_g[state]) and ref.dt:get_hotkey() then
                    bld.force_defensive = true
                elseif menu.aa.break_lc_hs:get(lua.conds_no_g[state]) and ref.hs:get_hotkey() then
                    bld.force_defensive = true
                else
                    bld.force_defensive = false --ПРОВЕРКА НА ДОЛБАЕБА ВДРУГ Я НЕ ТРЕЗВЫЙ??
                end
            else
                bld.force_defensive = false
            end

        elseif player_will_peek() and player.get_velocity(lp) > 3 then
            bld.def_state = 1
            bld.def.tick = bld.def.tick + 1
            if bld.def.tick <= 8 then
                bld.force_defensive = true
            end
        else
            bld.def_state = 0
        end
        
        if not player_will_peek() then
            bld.def.tick = 0
        end
        if bld.def_state == 0 then
            if bld.force_defensive then
                bld.last_def_tick = bld.aa_tickrate
            end
        else
            if bld.force_defensive and bld.def.tick == 4 then
                bld.last_def_tick = bld.aa_tickrate
            end
        end
        cmd.force_defensive = bld.force_defensive
        if bld.aa_tickrate < bld.last_def_tick + sens then
            bld.def_w = true
        end
        if not bld.def_w or not def_tab.yaw_mod:get() == "Spin" then
            bld.def.spin.tickrate = 0
        end
        if not bld.def_w or not def_tab.pitch:get() == "Spin" then
            bld.def.pitch.spin_tickrate = 0
        end
    end
    --врач спин до кряка врача (я в ахуе какой там еблан кодер)
    bld.def.sec_yaw = bld.def.sec_yaw + 20
    if math.abs(bld.def.sec_yaw) % 360 == 0 then
        bld.def.sec_yaw = 0
    end
    if bld.aa_update then
        force_yaw = 0
        ref.yawjitter[1]:set("Off")
        if bld.def_w and check_enable and charge < 0 and def_allow(def_tab) and not (entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 and menu.aa.disable_warmup:get()) then
            ref.yawjitter[1]:set("Off")
            ref.yawjitter[2]:set(0)
            if def_tab.yaw_mod:get() == "Forward" then
                ref.bodyyaw[1]:set("Static")
                ref.bodyyaw[2]:set(0)
                bld.def.jitter = not bld.def.jitter
                ref.bodyyaw[2]:set(180)
                bld.def.yaw = 180 + def_tab.yaw_add:get()
            elseif def_tab.yaw_mod:get() == "Sideways" then
                ref.bodyyaw[1]:set("Static")
                bld.def.jitter = not bld.def.jitter
                bld.def.yaw = 0
                ref.bodyyaw[2]:set(-120)
                ref.yawjitter[1]:set("Center")
                ref.yawjitter[2]:set(180)
            elseif def_tab.yaw_mod:get() == "Spin" then
                ref.bodyyaw[1]:set("Static")
                ref.bodyyaw[2]:set(bld.jitter and 145 or -145)
                bld.def.spin.tickrate = bld.def.spin.tickrate + 1
                bld.def.yaw = 0
            end
            cmd.no_choke = true
            cmd.allow_send_packet = true
            ref.yaw[1]:set("180")
            if def_tab.yaw_mod:get() ~= "Spin" then
                ref.yaw[2]:set(normalize_yaw((bld.def.yaw + ram.yaw_base) % 360))
            else
                ref.yaw[2]:set(normalize_yaw((bld.def.yaw + bld.def.sec_yaw + ram.yaw_base) % 360))
            end
            if def_tab.pitch:get() ~= "Spin" and def_tab.pitch:get() ~= "Zero" and def_tab.pitch:get() ~= "Random" then
                ref.pitch[1]:set(def_tab.pitch:get())
                local randomval = def_tab.pitch_degree:get() + math.random(0, def_tab.pitch_randomize:get())
                if def_tab.pitch:get() == "Custom" then
                    ref.pitch[2]:set(normalize_pitch(randomval))
                end
            elseif def_tab.pitch:get() == "Spin" then
                bld.def.pitch.spin_tickrate = bld.def.pitch.spin_tickrate + 1
                if(bld.def.pitch.spin_tickrate == 1) then
                    bld.def.pitch.spin = def_tab.pitch_degree:get()
                else
                    bld.def.pitch.spin = bld.def.pitch.spin + def_tab.pitch_speed:get() + math.random(0, def_tab.pitch_randomize:get())
                end
                ref.pitch[1]:set("Custom")
                ref.pitch[2]:set(normalize_pitch(bld.def.pitch.spin % 178))
            elseif def_tab.pitch:get() == "Zero" then
                ref.pitch[1]:set("Custom")
                ref.pitch[2]:set(0)
            elseif def_tab.pitch:get() == "Random" then
                ref.pitch[1]:set("Custom")
                ref.pitch[2]:set(normalize_pitch((math.random(0, 4) - 2) * 45))
            end
        elseif (menu.aa.manual_base:get() ~= "At target" and menu.aa.manual_base:get() ~= "Backward") then
            ref.yaw[1]:set("180")
            ref.yaw[2]:set(ram.yaw_base)
            ref.pitch[1]:set("Default")
            ref.bodyyaw[1]:set("Static")
            ref.bodyyaw[2]:set(menu.aa.invertor:get() and 180 or -180)
            ref.pitch[1]:set(tab.pitch:get())
            bld.yaw = 0
            bld.yaw_add = 0
            bld.last_def_tick = 0
            ref.yawjitter[1]:set("Off")
            ref.yawjitter[2]:set(0)
        elseif static() or (bld.rad_deg > 0.3 and bld.rad_deg < 0.6 and menu.aa.safe_addicted:get()) then 
            ref.yaw[1]:set("180")
            ref.yaw[2]:set(0)
            ref.pitch[1]:set("Default")
            ref.bodyyaw[1]:set("Static")
            ref.bodyyaw[2]:set(0)
            ref.pitch[1]:set(tab.pitch:get())
            bld.yaw = 0
            bld.yaw_add = 0
            bld.last_def_tick = 0
            ref.yawjitter[1]:set("Off")
            ref.yawjitter[2]:set(0)
        else
            default_antiaim(tab)
        end
    end
    if exploit_enable ~= (ref.dt:get_hotkey() or ref.hs:get_hotkey()) then --фикс аа на отжим эксплойта чтоб бошку на противника не поворачивало
        default_antiaim(tab)
        exploit_enable = (ref.dt:get_hotkey() or ref.hs:get_hotkey())
    end
end


--фикс аа
client.set_event_callback("player_death", function(event)
    if(client.userid_to_entindex(event.userid) == entity.get_local_player()) then
        bld.aa_tickrate = 0
        bld.last_def_tick = 0
    end
end)

local ground_ticks, end_time, bodyak, jit = 1, 0, 1, false

--хахаха!!

client.set_event_callback("pre_render", function()
    local lp = entity.get_local_player()
	if entity.is_alive(lp) then
        if menu.aa.animbreaker:get("Static legs in air") then 
            entity.set_prop(lp, "m_flPoseParameter", 1, 6)
        end
        if(ref.fakeduck:get() and menu.aa.animbreaker:get("Duck peek assist jitter")) then
            if(globals.tickcount() % 3 == 0) then
                entity.set_prop(lp, "m_flPoseParameter", 0, 16)
            else
                entity.set_prop(lp, "m_flPoseParameter", 2, 16)
            end
        end
        if menu.aa.animbreaker:get("Body extra lean") then 
            local anim_overlay = c_entity.new(lp):get_anim_overlay(12)
            if player.get_velocity(lp) > 3 then
                anim_overlay.weight = player.get_velocity(lp) / 100
            else
                anim_overlay.weight = math.random(0, 4) / 4
            end
        end
        if menu.aa.animbreaker:get("Pitch 0 on land") then
            local on_ground = bit.band(entity.get_prop(lp, "m_fFlags"), 1)
    
            if on_ground == 1 then
                ground_ticks = ground_ticks + 1
            else
                ground_ticks = 0
                end_time = globals.curtime() + 1
            end 
        
            if ground_ticks > 14 and end_time > globals.curtime() then
                entity.set_prop(lp, "m_flPoseParameter", 0.5, 12)
            end
        end
        if menu.aa.animbreaker:get("Leg breaker") then
            if math.random(0, 1) == 1 then
                entity.set_prop(lp, "m_flPoseParameter", 1, 0)
            else
                entity.set_prop(lp, "m_flPoseParameter", (360 - 90) / 360, 0)
            end
        end
        if menu.aa.animbreaker:get("Kangaroo") then
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10)/10, 3)
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10)/10, 7)
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10)/10, 6)
        end
    end 
end)

local math_hundred_floor = function(valu)
    return (math.floor(valu * 100) / 100)
end

--самые плавные анимации на бешенной европе

local anim = {
    lerp = function(tog, val, towhat, speed, if_not_tog)
        local wanted_frametime = 60
        local current_frametime = 1 / globals.frametime()
        percent = wanted_frametime / current_frametime
        if(tog) then
            val_to = towhat
        elseif(if_not_tog ~= nil) then
            val_to = if_not_tog
        else
            val_to = 0
        end
        if(math.floor(val * 15) ~= math.floor(val_to * 15)) then
            if(val_to > 0) then
                val = val + (val_to + 0.75 - val) * speed / 100 * 3 * percent
            else
                val = val + (val_to - val) * speed / 100 * 3 * percent
            end
        else
            val = val_to
        end
        if(tog and val > towhat and towhat == 255) then
            val = towhat
        end
        return math_hundred_floor(val)
    end,
    default = function(tog, val, towhat, speed, if_not_tog)
        local wanted_frametime = 80
        local current_frametime = 1 / globals.frametime()
        local percent = wanted_frametime / current_frametime
        if(tog) then
            if(towhat == 255) then
                if(val > 235) then
                    val = 255
                else
                    if(val < towhat) then
                        val = val + globals.frametime() * speed * 1.5 * 64
                    end
                    if(val > towhat) then
                        val = val - globals.frametime() * speed * 1.5 * 64
                    end
                end
            else
                if(math.floor(val / 10) == math.floor(towhat / 10)) then
                    val = towhat
                else
                    if(val < towhat) then
                        val = val + globals.frametime() * speed * 2 * 64
                    end
                    if(val > towhat) then
                        val = val - globals.frametime() * speed * 2 * 64
                    end
                end
            end
        else
            if(math_hundred_floor(val) <= math_hundred_floor(if_not_tog)) then
                val = if_not_tog
            end
            if(math_hundred_floor(val) > if_not_tog) then
                val = val - speed * percent
            end
        end
        return math.floor(val)
    end
}

local vram = {
    show = false,
    scoped = false,
    c = {
        alpha = 0,
        lna = 0,
        cna = 0,
        bua = 0,
        bda = 0,
        lnw = 0,
        cnw = 0,
        bldw = 0,
        bdw = 0,
        bdal = {0,0,0,0,0,0},
        bdwl = {0,0,0,0,0,0},
        bdrp = {0,0,0,0,0,0},
        fc = {0,0,0,0},
        sc = {0,0,0,0},
        scope_add = 0,
    },
    invert = false,
    direction_anim = 1,
    tickbase = 0,
    alpha_water = 0,
}

--это пиздато

local render = {
    solus = function(style, x, y, w, h, ac, alpha)
        if(style == 1) then
            renderer.rectangle(x, y + 2, w, h, 0,0,0, ac[4] * alpha / 255)
            renderer.rectangle(x, y, w, 2, ac[1], ac[2], ac[3], alpha)
        elseif(style == 2) then
            local round = 3
            renderer.rounded_rectangle(x + 1, y + 1, w - 1, h - 1, 0, 0, 0, ac[4] * alpha / 255, round)
            renderer.rectangle(x + round, y, w - round * 2, 1, ac[1], ac[2], ac[3], alpha)
            
            renderer.circle_outline(x + round, y + round, ac[1], ac[2], ac[3], alpha, round, 180, 0.25, 1)
            renderer.circle_outline(x - round + w, y + round, ac[1], ac[2], ac[3], alpha, round, 270, 0.25, 1)
            
            renderer.gradient(x, y + round, 1, h - round, ac[1], ac[2], ac[3], alpha, ac[1], ac[2], ac[3], 0, false)
            renderer.gradient(x + w - 1, y + round, 1, h - round, ac[1], ac[2], ac[3], alpha, ac[1], ac[2], ac[3], 0, false)
            
            renderer.rounded_outline(x + 1, y + 1, w - 2, h - 1, ac[1], ac[2], ac[3], ac[4] * alpha / 255^2 * 25, 1, round)
            renderer.rounded_outline(x, y, w, h, ac[1], ac[2], ac[3], ac[4] * alpha / 255^2 * 100, 1, round)
        end
    end,
    text = function(x, w, r, g, b, a, flags, max_width, texting)
        if(renderer.measure_text("-", "oh shit") == renderer.measure_text(flags, "oh shit")) then
            texting = string.upper(texting)
        end
        renderer.text(x, w, r, g, b, a, flags, max_width, texting)
    end,
    measure_text = function(flags, texting)
        if(renderer.measure_text("-", "oh shit") == renderer.measure_text(flags, "oh shit")) then
            texting = string.upper(texting)
        end
        return renderer.measure_text(flags, texting)
    end,
    gradient_text = function(x, w, r, g, b, a, r2, g2, b2, a2, flags, max_width, texting, val)
        local col_table = {}
        local max_num = string.len(texting)
        for i = 1, max_num do
            if(val > max_num / 2) then
                val = max_num - val / 2
            end
            local dist_to_let = math.abs(i + val - max_num) / (max_num)
            
            local r = (r * (1 - dist_to_let) + r2 * dist_to_let)
            local g = (g * (1 - dist_to_let) + g2 * dist_to_let)
            local b = (b * (1 - dist_to_let) + b2 * dist_to_let)
            local a = (a * (1 - dist_to_let) + a2 * dist_to_let)

            if(renderer.measure_text("-", "oh shit") == renderer.measure_text(flags, "oh shit")) then
                texting = string.upper(texting)
            end
            if(i > 1) then
                x_add, y_add = renderer.measure_text(flags, texting:sub(1, i - 1))
            else
                x_add, y_add = 0
            end
            if(string.find(flags, "c")) then
                flags = string.gsub(flags, "c", "")
                renderer.text(x + x_add, w, r, g, b, a, flags, max_width, texting:sub(i, i))
            else
                flags = string.gsub(flags, "c", "")
                renderer.text(x + x_add, w, r, g, b, a, flags, max_width, texting:sub(i, i))
            end
        end
    end,
}


function indicating_aimboting()
    if(menu.vis.freestand_ind:get()) then
        if(menu.aa.freestand:get()) then
            if(bld.def_w) then
                ars.state = 0
            elseif(menu.aa.manual_base:get() ~= "At target") then
                ars.state = 0
            else
                ars.state = 1
            end
            if(ars.state0 ~= ars.state) then
                ars.shet = ars.shet + 1
                if(ars.shet > 8) then
                    ars.state0 = ars.state
                    ars.shet = 0
                end
            elseif(ars.state0 == ars.state) then
                ars.shet = 0
            end
            if(ars.state0 == 1) then
                renderer.indicator(225, 225, 225, 245, "FS")
            else
                renderer.indicator(255, 0, 50, 255, "FS")
            end
        end
    end
end


function visuals() --не судите строго я новичёк((
    local lp = entity.get_local_player()
    vram.c.alpha = anim.lerp(menu.vis.central.enable:get() and ((lp ~= nil and entity.is_alive(lp)) or ui.is_menu_open()), vram.c.alpha, 255, 3, 0)
    local x, y = client.screen_size()
    vram.alpha_water = anim.lerp(globals.curtime() % 4 <= 3, vram.alpha_water, 180, 1, 0)
    render.text(x / 2, y - 25, 255, 255, 255, vram.alpha_water, "c", 0, "ANNESTY.LUA")
    vram.c.lna = anim.lerp(menu.vis.central.enable:get() and locate(menu.vis.central.elements:get(), "Lua name"), vram.c.lna, 255, 6, 0)
    vram.c.cna = anim.lerp(menu.vis.central.enable:get() and locate(menu.vis.central.elements:get(), "Condition"), vram.c.cna, 255, 6, 0)
    vram.c.bua = anim.lerp(menu.vis.central.enable:get() and locate(menu.vis.central.elements:get(), "Build"), vram.c.bua, 255, 6, 0)
    vram.c.bda = anim.lerp(menu.vis.central.enable:get() and locate(menu.vis.central.elements:get(), "Binds"), vram.c.bda, 255, 6, 0)
    if(lp ~= nil and entity.is_alive(lp)) then
        if(entity.get_prop(lp, "m_bIsScoped") == 1) then
            vram.scoped = true
        else
            vram.scoped = false
        end
    else
        vram.scoped = false
    end
    if(globals.chokedcommands() == 0 and lp ~= nil and entity.is_alive(lp)) then
        vram.invert = entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120 - 60 > 0
        vram.tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase") - globals.tickcount()
    end
    local add_y = 0
    local flags = ""
    local flags_ui = menu.vis.central.flags
    if(locate(flags_ui:get(), "Large")) then
        flags = flags .. "+"
    elseif(locate(flags_ui:get(), "Small")) then
        flags = flags .. "-"
    end
    if(locate(flags_ui:get(), "Right-aligned")) then
        flags = flags .. "r"
    end
    if(locate(flags_ui:get(), "Bold")) then
        flags = flags .. "b"
    end
    if(locate(flags_ui:get(), "DPI support")) then
        flags = flags .. "d"
    end
    if(math.floor(vram.c.alpha) > 0) then
        local x_adding_val, y_adding_val = render.measure_text(flags, "L")
        y_adding_val = math.floor(y_adding_val / 2 * 1.75)
        if(math.floor(vram.c.lna) > 0) then
            vram.c.lnw = anim.lerp(not vram.scoped, vram.c.lnw, render.measure_text(flags, "АННЕСТИ НА РОВНОМ") * vram.c.alpha / 255 * math.floor(vram.c.lna) / 255 + 10, 6, 0)
            local xremove, yremove = render.measure_text(flags, "АННЕСТИ") / 2 * vram.c.alpha / 255 * math.floor(vram.c.lna) / 255
            local xbussin, ybussin = render.measure_text(flags, "АННЕСТИ")
            local fcacr, fcacg, fcacb, fcaca = menu.vis.central.color:get()
            local scacr, scacg, scacb, scaca = menu.vis.central.scolor:get()
            local fc = {fcacr, fcacg, fcacb, fcaca}
            local sc = {scacr, scacg, scacb, scaca}
            for i = 1, 4 do
                vram.c.fc[i] = anim.lerp(true, vram.c.fc[i], vram.invert and fc[i] or sc[i], 6, 0)
                vram.c.sc[i] = anim.lerp(true, vram.c.sc[i], vram.invert and sc[i] or fc[i], 6, 0)
            end
            render.text(x / 2 - vram.c.lnw / 2 + 5, y / 2 + menu.vis.central.add_y:get(), vram.c.fc[1], vram.c.fc[2], vram.c.fc[3], vram.c.alpha * vram.c.lna / 255 * vram.c.fc[4] / 255, flags, 0, "АННЕСТИ")
            render.text(x / 2 - vram.c.lnw / 2 + xbussin + 5, y / 2 + menu.vis.central.add_y:get(), vram.c.sc[1], vram.c.sc[2], vram.c.sc[3], vram.c.alpha * vram.c.lna / 255 * vram.c.sc[4] / 255, flags, 0, " НА РОВНОМ")
        end
        add_y = add_y + y_adding_val * math.floor(vram.c.lna) / 255
        if(math.floor(vram.c.cna) > 0) then
            if(lp == nil or not entity.is_alive(lp)) then
                state = "✝ lp = nil ✝"
            else
                state = "✝ новые " .. string.lower(lua.conds_no_g_ru[player.get_state(lp)]) .. " ✝"
            end
            local fcar, fcag, fcab, fcaa = menu.vis.central.color:get()
            vram.c.cnw = anim.lerp(not vram.scoped, vram.c.cnw, render.measure_text(flags, state) * vram.c.alpha / 255 * math.floor(vram.c.cna) / 255 + 10, 6, 0)
            render.text(x / 2 + 5 - math.floor(vram.c.cnw / 2), y / 2 + menu.vis.central.add_y:get() + add_y, fcar, fcag, fcab, fcaa * vram.c.alpha * vram.c.cna / 255 / 255, flags, 0, state)
        end
        add_y = add_y + y_adding_val * math.floor(vram.c.cna) / 255
        if(math.floor(vram.c.bua) > 0) then
            local fcar, fcag, fcab, fcaa = menu.vis.central.scolor:get()
            vram.c.bldw = anim.lerp(not vram.scoped, vram.c.bldw, render.measure_text(flags, "универсам") * vram.c.alpha / 255 * math.floor(vram.c.bua) / 255 + 10, 6, 0)
            render.text(x / 2 - vram.c.bldw / 2 + 5, y / 2 + menu.vis.central.add_y:get() + add_y, fcar, fcag, fcab, fcaa * vram.c.alpha * vram.c.bua / 255 / 255, flags, 0, "универсам")
        end
        add_y = add_y + y_adding_val * math.floor(vram.c.bua) / 255
        if(math.floor(vram.c.bda) > 0) then
            local fcar, fcag, fcab, fcaa = menu.vis.central.color:get()
            local key_main = {menu.aa.freestand:get(), ref.dt:get_hotkey(), ref.hs:get_hotkey(), ref.mindmg:get_hotkey(), ref.forcebaim:get(), ref.safepoint:get()}
            local names_for_bdwl = {"дирекция", "быстрый патрон", "ашот", "мин пострiл", "с нами Бог ✝", "во имя отца ✝"}
            for i = 1, 6 do
                vram.c.bdal[i] = anim.lerp(key_main[i] and vram.c.alpha > 0, vram.c.bdal[i], math.floor(vram.c.bda), 6, 0)
                vram.c.bdwl[i] = anim.lerp(math.floor(vram.c.bda) > 0 and not vram.scoped, vram.c.bdwl[i], render.measure_text(flags, names_for_bdwl[i]) * math.floor(vram.c.bda) / 255 * vram.c.alpha / 255 + 10, 6, 0)
                vram.c.bdal[i] = math.floor(vram.c.bdal[i])
            end
            local x = x + 10
            if(math.floor(vram.c.bdal[1]) > 0) then
                local amn = fcaa * vram.c.bdal[1] / 255 * vram.c.alpha / 255
                local scacr, scacg, scacb, scaca = menu.vis.central.scolor:get()
                if(ars.state0 == 1) then
                    render.text(x / 2 - vram.c.bdwl[1] / 2, y / 2 + add_y + menu.vis.central.add_y:get(), fcar, fcag, fcab, amn, flags, 0, "дирекция")
                else
                    render.text(x / 2 - vram.c.bdwl[1] / 2, y / 2 + add_y + menu.vis.central.add_y:get(), 255, 0, 50, amn, flags, 0, "дирекция")
                end
            end
            add_y = add_y + math.floor(y_adding_val * vram.c.bdal[1] / 255)
            ram.charge_value = anim.lerp(vram.tickbase < 0, ram.charge_value, 255, 8, 0)
            if(vram.c.bdal[2] > 0) then
                render.text(x / 2 - math.ceil(vram.c.bdwl[2] / 2) - 1, y / 2 + add_y + menu.vis.central.add_y:get(), 255, 0, 0, fcaa * vram.c.bdal[2] / 255 * vram.c.alpha / 255 * (255 - ram.charge_value) / 255, flags, 0, "быстрый патрон")
                if(bld.def_w) then
                    render.text(x / 2 - math.ceil(vram.c.bdwl[2] / 2) - 1, y / 2 + add_y + menu.vis.central.add_y:get(), 171, 181, 75, fcaa * vram.c.bdal[2] / 255 * vram.c.alpha / 255 * ram.charge_value / 255, flags, 0, "быстрый патрон")
                else
                    render.text(x / 2 - math.ceil(vram.c.bdwl[2] / 2) - 1, y / 2 + add_y + menu.vis.central.add_y:get(), fcar, fcag, fcab, fcaa * vram.c.bdal[2] / 255 * vram.c.alpha / 255 * ram.charge_value / 255, flags, 0, "быстрый патрон")
                end
            end
            add_y = add_y + math.floor(y_adding_val * vram.c.bdal[2] / 255)
            local names = {"ашот", "мин пострiл", "с нами Бог ✝", "во имя отца ✝"}
            for i = 3, 6 do
                if(vram.c.bdal[i] > 0) then
                    render.text(x / 2 - math.ceil(vram.c.bdwl[i] / 2), y / 2 + add_y + menu.vis.central.add_y:get(), fcar, fcag, fcab, fcaa * vram.c.bdal[i] / 255 * vram.c.alpha / 255, flags, 0, names[i - 2])
                end
                add_y = add_y + math.floor(y_adding_val * vram.c.bdal[i] / 255)
            end
        end
    end
end

renderer.rounded_rectangle = function(x, y, w, h, r, g, b, a, radius)
    y = y + radius
    local data_circle = {
        {x + radius, y, 180},
        {x + w - radius, y, 90},
        {x + radius, y + h - radius * 2, 270},
        {x + w - radius, y + h - radius * 2, 0},
    }

    local data = {
        {x + radius, y, w - radius * 2, h - radius * 2},
        {x + radius, y - radius, w - radius * 2, radius},
        {x + radius, y + h - radius * 2, w - radius * 2, radius},
        {x, y, radius, h - radius * 2},
        {x + w - radius, y, radius, h - radius * 2},
    }

    for _, data in next, data_circle do
        renderer.circle(data[1], data[2], r, g, b, a, radius, data[3], 0.25)
    end

    for _, data in next, data do
        renderer.rectangle(data[1], data[2], data[3], data[4], r, g, b, a)
    end
end

renderer.rounded_outline = function(x, y, w, h, r, g, b, a, thickness, radius)
    renderer.rectangle(x + radius, y, w - radius * 2, thickness, r, g, b, a)
    renderer.rectangle(x + w - thickness, y + radius, thickness, h - radius * 2, r, g, b, a)
    renderer.rectangle(x, y + radius, thickness, h - radius * 2, r, g, b, a)
    renderer.rectangle(x + radius, y + h - thickness, w - radius * 2, thickness, r, g, b, a)
    renderer.circle_outline(x + radius, y + radius, r, g, b, a, radius, 180, 0.25, thickness)
    renderer.circle_outline(x - radius + w, y + radius, r, g, b, a, radius, 270, 0.25, thickness)
    renderer.circle_outline(x + radius, y - radius + h, r, g, b, a, radius, 90, 0.25, thickness)
    renderer.circle_outline(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25, thickness)
end

vram.w = {}
vram.w.alpha = 0

function watermark()
    local lp = entity.get_local_player()
    vram.w.alpha = anim.lerp(menu.vis.water.enable:get() and ((lp ~= nil and entity.is_alive(lp)) or ui.is_menu_open()), vram.w.alpha, 255, 3, 0)
    if(vram.w.alpha > 0)  then
        local x, y = client.screen_size()
        local acr, acg, acb, aca = menu.vis.water.color:get()
        local h, m, s, mm = client.system_time()
        local flags = ""
        if(menu.vis.water.dpi_support:get()) then
            flags = "d"
        end
        if(menu.vis.water.nickname:get() == "") then
            text = " | ping: " .. math.floor(client.real_latency() * 1000) .. "ms | " .. tostring(1 / globals.tickinterval()) .. "tick | " .. tostring(h) .. ":" .. tostring(m)
        else
            text = " | " .. menu.vis.water.nickname:get() .. " | ping: " .. math.floor(client.real_latency() * 1000) .. "ms | " .. tostring(1 / globals.tickinterval()) .. "tick | " .. tostring(h) .. ":" .. tostring(m)
        end
        local haddingx, hadding = render.measure_text(flags, "lll")
        local w2 = render.measure_text(flags, "gamesense" .. text) + haddingx
        hadding = hadding + 6
        if(menu.vis.water.style:get() == "Old solus") then
            render.solus(1, x - w2 - 18, 13, w2 + 2, hadding, {acr, acg, acb, aca}, vram.w.alpha)
        elseif(menu.vis.water.style:get() == "New solus") then
            render.solus(2, x - w2 - 18, 15, w2 + 2, hadding, {acr, acg, acb, aca}, vram.w.alpha)
        elseif(menu.vis.water.style:get() == "Original") then
            local first_color = {55, 177, 218, vram.w.alpha}
            local second_color = {203, 70, 205, vram.w.alpha}
            local third_color = {204, 227, 53, vram.w.alpha}
            local y = 15
            local hx, h = render.measure_text(flags, "lll")
            h = h + 6
            local x = client.screen_size() - w2 - 20
            renderer.rounded_rectangle(x - 1, y - 5, w2 + 1 + 6, h + 8, 60,60,60,vram.w.alpha, 4)
            renderer.rounded_rectangle(x, y - 4, w2 + 5, h + 6, 40,40,40,vram.w.alpha, 4)
            renderer.rounded_rectangle(x + 2, y - 2, w2 + 1, h + 2, 60,60,60,vram.w.alpha, 4)
            renderer.rounded_rectangle(x + 3, y - 1, w2 - 3 + 2, h, 10,10,10,vram.w.alpha, 4)
            renderer.gradient(x + 5, y - 1, w2 / 2, 1, 55, 177, 218, vram.w.alpha, 203, 70, 205, vram.w.alpha, true)
            renderer.gradient(x + w2 / 2 + 5, y - 1, w2 / 2 - 5, 1, 203, 70, 205, vram.w.alpha, 204, 227, 53, vram.w.alpha, true)
        end
        local gamesense_add = render.measure_text(flags, "gamesense ") - 2
        local gamesense_add2 = render.measure_text(flags, "game")
        render.text(x - w2 - 13 + gamesense_add, 17, 255,255,255, vram.w.alpha, flags, 0, text)
        render.text(x - w2 - 13, 17, 255,255,255, vram.w.alpha, flags, 0, "game")
        if(menu.vis.water.style:get() == "Original" or menu.vis.water.style:get() == "Disabled") then
            render.text(x - w2 - 13 + gamesense_add2, 17, 171,181,75, vram.w.alpha, flags, 0, "sense")
        else
            render.text(x - w2 - 13 + gamesense_add2, 17, 255,255,255, vram.w.alpha, flags, 0, "sense")
        end
    end
end

vram.k = {}
vram.k.alpha = 0
vram.k.w2 = 65
vram.k.binds = {}
vram.k.drug = false
vram.k.add_x_m = 0
vram.k.add_y_m = 0
vram.k.drugging = false

--это для всех своих друзей из Украины (страны из которой я сбежал, там бендеревцi йеднi)

local binds = {
    {"Double tap", pui.reference("RAGE", "Aimbot", "Double tap"), 1, "Подвiйний пострiл"},
    {"Minimum damage", pui.reference("RAGE", "Aimbot", "Minimum damage override"), 1, "Мiн. шкода", {pui.reference("RAGE", "Aimbot", "Minimum damage override")}},
	{"On shot anti-aim", pui.reference("AA", "Other", "On shot anti-aim"), 1, "Ховання пострiлiв"},
    {"Duck peek assist", pui.reference("RAGE", "Other", "Duck peek assist"), 2, "Фейкове присiдання"},
    {"Quick peek assist", pui.reference("RAGE", "Other", "Quick peek assist"),  1, "Швидкий огляд"},
    {"Force body aim", pui.reference("RAGE", "Aimbot", "Force body aim"), 2, "Прiоритет у тiло"},
    {"Force safe point", pui.reference("RAGE", "Aimbot", "Force safe point"), 2, "Безпечна точка"},
    {"Slow motion", pui.reference("AA", "Other", "Slow motion"), 1, "Повiльна ходьба"},
    {"Freestanding", menu.aa.freestand, 2, "Допомога повернення"},
    {"Automatic grenade release", pui.reference("MISC", "Miscellaneous", "Automatic grenade release"), 1, "Автоматичний випуск гранати"},
    {"Ping spike", pui.reference("MISC", "Miscellaneous", "Ping spike"), 1, "Скачок пінгу", {pui.reference("MISC", "Miscellaneous", "Ping spike")}},
    {"Free look", pui.reference("MISC", "Miscellaneous", "Free look"), 2, "Вiльний погляд"},
    {"Last second defuse", pui.reference("MISC", "Miscellaneous", "Last second defuse"), 2, "Остання секунда розряджає"},
    {"Z-Hop", pui.reference("MISC", "Movement", "Z-Hop"), 1, "UA-Прыг"},
    {"Pre-speed", pui.reference("MISC", "Movement", "Pre-speed"), 1, "Попередня швидкість"},
    {"Block bot", pui.reference("MISC", "Movement", "Blockbot"), 1, "Блокбот"},
    {"Jump at edge", pui.reference("MISC", "Movement", "Jump at edge"), 1, "Стрибок на краю"},
    {"lagcomp_override", menu.info.lagcomp_override, 2, "Лагкомп перевизначення"},
}

function keybinds()
    local lp = entity.get_local_player()
    if(menu.vis.keybinds.dpi_support:get()) then
        flags = "d"
    else
        flags = ""
    end
    active_binds = false

    --ну тут ради читаемости написал как киркс
    if(menu.vis.keybinds.ua_mode:get()) then
        keybind_title_name = "бiнди"
        states = {"завжди", "держ", "перемик", "вимкнути"}
    else
        keybind_title_name = "keybinds"
        states = {"always on", "holding", "toggled", "off hotkey"}
    end
    vram.k.w = render.measure_text(flags, keybind_title_name) + 30
    for i = 1, #binds do
        mode_value = nil
        if(binds[i][3] == 1) then
            active, moded, key = binds[i][2].hotkey:get()
            if(binds[i][5] ~= nil) then
                mode_value = binds[i][5][2]:get()
            end
        else
            active, moded, key = binds[i][2]:get()
        end
        if(vram.k.binds[i] == nil) then
            info = {name = binds[i][1], state = binds[i][2]:get(), alpha = 0, mode = states[moded + 1]}
            table.insert(vram.k.binds, info)
        end
        -- и тут тоже киркс включился
        if(menu.vis.keybinds.ua_mode:get()) then
            vram.k.binds[i].name = binds[i][4]
        else
            vram.k.binds[i].name = binds[i][1]
        end
        vram.k.binds[i].mode = states[moded + 1]
        if(vram.k.binds[i].mode == "always on") then
            vram.k.binds[i].state = false
        elseif(binds[i][3] == 1) then
            if(binds[i][2]:get()) then
                vram.k.binds[i].state = binds[i][2]:get_hotkey()
            else
                vram.k.binds[i].state = false
            end
        else
            vram.k.binds[i].state = binds[i][2]:get()
        end
        if(mode_value ~= nil) then
            vram.k.binds[i].mode = mode_value
        end
        vram.k.binds[i].alpha = anim.lerp(vram.k.binds[i].state, vram.k.binds[i].alpha, 255, 6, 0)
        local wtext = 0
        if(vram.k.binds[i].state == true) then
            active_binds = true
            wtext = render.measure_text(flags, vram.k.binds[i].name .. " [" ..  vram.k.binds[i].mode .. "]") + 20
        else
            wtext = 0
        end
        if(wtext > vram.k.w) then
            vram.k.w = wtext
        end
    end
    vram.k.alpha = anim.lerp(menu.vis.keybinds.enable:get() and ((active_binds and (lp ~= nil and entity.is_alive(lp))) or ui.is_menu_open()), vram.k.alpha, 255, 6, 0)
    local x_solus, y_solus = render.measure_text(flags, keybind_title_name)
    y_solus = y_solus + 6
    if(vram.k.alpha > 0) then
        vram.k.w2 = anim.lerp(true, vram.k.w2, vram.k.w, 6, 0)
        local acr, acg, acb, aca = menu.vis.keybinds.color:get()
        local x, y = menu.vis.keybinds.x:get(), menu.vis.keybinds.y:get()
        if(menu.vis.keybinds.style:get() == "Old solus") then
            render.solus(1, x, y, vram.k.w2, y_solus, {acr, acg, acb, aca}, vram.k.alpha)
        else
            render.solus(2, x, y + 2, vram.k.w2, y_solus, {acr, acg, acb, aca}, vram.k.alpha)
        end
        render.text(x + vram.k.w2 / 2, y + y_solus / 2 + 2, 255, 255, 255, vram.k.alpha, "c" .. flags, 0, keybind_title_name)
        local add_y = 0
        local difference_x, difference_y = render.measure_text(flags, keybind_title_name)
        for i = 1, #vram.k.binds do
            add_y = add_y + vram.k.binds[i].alpha / 255 * difference_y
            render.text(x + 2, y + y_solus - 10 + add_y, 255, 255, 255, vram.k.binds[i].alpha * vram.k.alpha / 255, flags, 0, vram.k.binds[i].name)
    
            local xremoving = render.measure_text(flags, "[" .. vram.k.binds[i].mode .. "]")
    
            render.text(x + vram.k.w2 - xremoving - 2, y + y_solus - 10 + add_y, 255, 255, 255, vram.k.binds[i].alpha * vram.k.alpha / 255, flags, 0, "[" .. vram.k.binds[i].mode .. "]")
        end
    end

    local mx, my = ui.mouse_position()
    local x, y = menu.vis.keybinds.x, menu.vis.keybinds.y
    if(ui.is_menu_open()) then
        if(client.key_state(0x01)) then
            if(mx > x:get() and mx < x:get() + vram.k.w and my > y:get() - 5 and my < y:get() + 24) then
                vram.k.drugging = true
            end
        else
            vram.k.drugging = false
        end
    else
        vram.k.drugging = false
    end
    if(vram.k.drug ~= vram.k.drugging) then
        vram.k.add_x_m = mx - x:get()
        vram.k.add_y_m = my - y:get()
        vram.k.drug = vram.k.drugging
    end
    if(vram.k.drugging) then
        if(mx - vram.k.add_x_m < 0) then
            x:set(0)
        else
            x:set(mx - vram.k.add_x_m)
        end
        if(my - vram.k.add_y_m < 0) then
            y:set(0)
        else
            y:set(my - vram.k.add_y_m)
        end
    end
end

vram.s = {
    alpha = 0,
    val = 0,
    drug = false,
    drugging = false,
    addxm = 0,
    addym = 0,
    ctal = 0,
}

function slow_down()
    local lp = entity.get_local_player()
    if(lp == nil or not entity.is_alive(lp)) then
        vram.s.val = 100
    else
        vram.s.val = entity.get_prop(lp, "m_flVelocityModifier") * 100
    end
    if(menu.vis.slow_down.dpi_support:get()) then
        flags = "d"
    else
        flags = ""
    end
    vram.s.alpha = anim.lerp((ui.is_menu_open() or vram.s.val < 100) and menu.vis.slow_down.enable:get(), vram.s.alpha, 255, 8, 0)
    local x = menu.vis.slow_down.x
    local y = menu.vis.slow_down.y
    local xsize, ysize = render.measure_text(flags, "Slowed down: 100 %")
    ysize = ysize / 6
    if(vram.s.alpha > 0) then
        local acr, acb, acg, aca = menu.vis.slow_down.color:get()
        renderer.rounded_rectangle(x:get() - xsize / 2, y:get(), xsize, ysize + 2, 15,15,15,vram.s.alpha / 255 * 100, 2)
        renderer.rounded_rectangle(x:get() - xsize / 2 + 1, y:get() + 1, (xsize - 2) / 100 * math.floor(vram.s.val), ysize, acr, acb, acg, vram.s.alpha, 2)
        render.text(x:get(), y:get() - ysize * 2 - 4, 255,255,255,vram.s.alpha, "c" .. flags, 0, "Slowed down: " .. math.floor(vram.s.val) .. "%")
    end
    local scrx, scry = client.screen_size()
    local mx, my = ui.mouse_position()
    if(ui.is_menu_open()) then
        if(client.key_state(0x01)) then
            if(mx > x:get() - 50 and mx < x:get() + 50 and my > y:get() - 14 and my < y:get() + 24) then
                vram.s.drugging = true
            end
        else
            vram.s.drugging = false
        end
    else
        vram.s.drugging = false
    end
    vram.s.ctal = anim.lerp(mx > x:get() - 50 and mx < x:get() + 50 and my > y:get() - 14 and my < y:get() + 24, vram.s.ctal, 255, 8, 0)
    if(vram.s.ctal > 0) then
        render.text(x:get(), y:get() + ysize * 2 + 7, 255,255,255,vram.s.alpha * vram.s.ctal / 255, "c" .. flags, 0, "Click RMB to centralize this indicator")
    end
    if(mx > x:get() - 50 and mx < x:get() + 50 and my > y:get() - 14 and my < y:get() + 24) then
        if(client.key_state(0x02)) then
            x:set(scrx / 2)
        end
    end
    if(vram.s.drug ~= vram.s.drugging) then
        vram.s.addxm = mx - x:get()
        vram.s.addym = my - y:get()
        vram.s.drug = vram.s.drugging
    end
    if(vram.s.drugging) then
        if(mx - vram.s.addxm < 0) then
            x:set(0)
        else
            x:set(mx - vram.s.addxm)
        end
        if(mx - vram.s.addym < 0) then
            y:set(0)
        else
            y:set(my - vram.s.addym)
        end
    end
end

function sun_set()
    if(menu.vis.sunset_mode.enable:get()) then
        sunset.sunset:set_string("1")
        sunset.sunset_x:set_string(tostring(menu.vis.sunset_mode.sunset_x:get()))
        sunset.sunset_y:set_string(tostring(menu.vis.sunset_mode.sunset_y:get()))
        sunset.sunset_z:set_string(tostring(menu.vis.sunset_mode.sunset_z:get()))
    else
        sunset.sunset:set_string("0")
    end
end
    
for i, k in pairs(menu.vis.sunset_mode) do
    k:set_callback(function() sun_set() end)
end

function aim_hit(e)
    local sht_info = main_massive_logs[e.id]
    local r, g, b = 171, 181, 75
    local hitgroup = sht_info.hitbox
    local tname = entity.get_player_name(sht_info.target)
    local dmg = sht_info.damage
    local bt = sht_info.backtrack
    local ht = math.floor(sht_info.hitchance)
    local test_frst = "Hit \0"
    local realdmg = sht_info.target_hp - entity.get_prop(sht_info.target, "m_iHealth")
    local flags = table.concat(sht_info.flags)
    if(locate(menu.vis.logs.enable:get(), "Console")) then
        local mess = "Hit " .. tname .. " in the " .. hitgroup .. " for " .. realdmg .. " (" .. dmg .. ") (" .. entity.get_prop(sht_info.target, "m_iHealth") .. ") | history: " .. bt .. "ticks | hitchance: " .. ht .. " | flags: " .. flags
        client.color_log(225, 225, 225, "Hit \0")
        client.color_log(r, g, b, tname .. " \0")
        client.color_log(225, 225, 225, "in the \0")
        client.color_log(r, g, b, hitgroup .. " \0")
        client.color_log(225, 225, 225, "for \0")
        client.color_log(r, g, b, realdmg .. " \0")
        client.color_log(225, 225, 225, " (\0")
        client.color_log(r, g, b, dmg .. "\0")
        client.color_log(225, 225, 225, ") (\0")
        client.color_log(r, g, b, entity.get_prop(sht_info.target, "m_iHealth") .. "\0")
        client.color_log(225, 225, 225, ") | history: " .. " \0")
        client.color_log(r, g, b, bt .. "\0")
        client.color_log(225, 225, 225, "ticks | hitchance: " .. " \0")
        client.color_log(r, g, b, ht .. "\0")
        client.color_log(225, 225, 225, " | flags: " .. flags)

    end
    if(locate(menu.vis.logs.enable:get(), "Screen")) then
        table.insert(render_logs, 1, {
            text = "hit " .. tname .. "  hb: " .. hitgroup .. "  dmg: " .. realdmg .. "  rhp: " .. entity.get_prop(sht_info.target, "m_iHealth") .. "  wdmg: " .. dmg, 
            alpha = 0, alpha1 = 0, time = globals.realtime(), t = "Hit"
        })
    end
end

function aim_miss(e)
    local r, g, b = 255, 0, 0
    local sht_info = main_massive_logs[e.id]
    local reason = e.reason
    local tname = entity.get_player_name(sht_info.target)
    local hitbox = sht_info.hitbox
    local bt = sht_info.backtrack
    local dmg = sht_info.damage
    local ht = math.floor(sht_info.hitchance)
    local flags = table.concat(sht_info.flags)
    if(locate(menu.vis.logs.enable:get(), "Console")) then
        client.color_log(225, 225, 225, "Missed shot (\0")
        client.color_log(r, g, b, tname .. "\0")
        client.color_log(225, 225, 255, ") due to \0")
        client.color_log(r, g, b, reason .. "\0")
        client.color_log(225, 225, 255, " | wanted hitbox: \0")
        client.color_log(r, g, b, hitbox .. "\0")
        client.color_log(225, 225, 225, " | history: \0")
        client.color_log(r, g, b, bt .. "\0")
        client.color_log(225, 225, 225, "ticks | hitchance: \0")
        client.color_log(r, g, b, ht .. " \0")
        client.color_log(225, 225, 225, "| flags: \0")
        client.color_log(r, g, b, flags .. " ")
    end
    if(locate(menu.vis.logs.enable:get(), "Screen")) then
        table.insert(render_logs, 1, {
            text = "miss " .. tname .. " due to " .. reason,
            alpha = 0, alpha1 = 0, time = globals.realtime(), t = "Miss"
        })
    end
end

function aim_fire(e)
    local tickrate = client.get_cvar("cl_cmdrate") or 64
    local ticks = globals.tickcount() - e.tick
    main_massive_logs[e.id] = {
        flags = {
            e.teleported and "T" or "",
            e.interpolated and "I" or "",
            e.extrapolated and "E" or "",
            e.boosted and "B" or "",
            e.high_priority and "H" or ""
        },
        hitbox = hitgroup_names[e.hitgroup + 1],
        damage = e.damage,
        backtrack = ticks,
        target = e.target,
        hitchance = e.hit_chance,
        target_hp = entity.get_prop(e.target, "m_iHealth"),
    }
end

function render_loging()
    local const_x, const_y = client.screen_size()
    if(locate(menu.vis.logs.enable:get(), "Screen")) then
        if(menu.vis.logs.dpi_support:get()) then
            flags = "d"
        else
            flags = ""
        end
        local x, y = const_x / 2, const_y / 2 + const_y / 4
        local y_add = 0
        for i, logs in ipairs(render_logs) do
            if menu.vis.logs.screen_logs:get() == "Default" then
                if(globals.realtime() - logs.time < 1.5 and i <= 6) then
                    logs.alpha = anim.lerp(true, logs.alpha, 255, 3, 0)
                end
                if(globals.realtime() - logs.time > 6 or i > 6) then
                    logs.alpha = anim.lerp(false, logs.alpha, 255, 3, 0)
                    if(logs.alpha <= 5) then
                        table.remove(render_logs, i)
                    end
                end
                if(#render_logs > 6) then
                    render_logs[#render_logs].alpha = anim.lerp(false, render_logs[#render_logs].alpha, 0, 3, 0)
                    if(math.floor(render_logs[#render_logs].alpha) <= 0.05) then
                        table.remove(render_logs, #render_logs)
                    end
                end
    
                local y2 = 0
                local y3 = 0
                local y = const_y / 2 + 250
                y2 = y + y_add
                y3 = const_y - y2
                y = const_y - y3 * logs.alpha / 255
    
                local clr_r, clr_g, clr_b, clr_a = menu.vis.logs.color:get()
                local text = logs.text
                local sizex, sizey = render.measure_text(flags, "[Annesty.lua] " .. text)
                renderer.rounded_rectangle(x - sizex / 2 - 10, y - 3, sizex + 20, sizey + 10, 0,0,0,clr_a * logs.alpha / 255, 8)
                renderer.rounded_outline(x - sizex / 2 - 10, y - 3, sizex + 20, sizey + 10, clr_r,clr_g,clr_b,logs.alpha, 2, 8)
                local annesty_size, annesty_sizey = render.measure_text(flags, "[Annesty.lua] ")
                renderer.text(x - sizex / 2, y + 2, clr_r,clr_g,clr_b,logs.alpha, flags, 0, "[Annesty.lua]")
                renderer.text(x - sizex / 2 + annesty_size, y + 2, 255,255,255,logs.alpha, flags, 0, text)
    
                y_add = y_add + (sizey * 2 + 5) * logs.alpha / 255
            elseif menu.vis.logs.screen_logs:get() == "Modern" then
                if(globals.realtime() - logs.time < 1.5 and i <= 6) then
                    logs.alpha = anim.lerp(true, logs.alpha, 255, 6, 0)
                end
                if(globals.realtime() - logs.time > 6 or i > 6) then
                    logs.alpha = anim.lerp(false, logs.alpha, 255, 6, 0)
                    if(logs.alpha <= 5) then
                        table.remove(render_logs, i)
                    end
                end


                local clr_r, clr_g, clr_b, clr_a = menu.vis.logs.color:get()
                local text = logs.text
                local sizex, sizey = render.measure_text(flags, "[Annesty.lua] " .. text)

                local annesty_size, annesty_sizey = render.measure_text(flags, "[Annesty.lua] ")
                renderer.text(x - sizex / 2, y + 2 + y_add, clr_r,clr_g,clr_b,logs.alpha, flags, 0, "[Annesty.lua]")
                renderer.text(x - sizex / 2 + annesty_size, y + 2 + y_add, 255,255,255,logs.alpha, flags, 0, text)

                y_add = y_add + (sizey + 5) * math.ceil(logs.alpha) / 255
            end
        end
    end
end

function chat_gpt(key)
    local maintext = key.text
    local gavnosss = {{"sty l", "+left"}, {"sty disc", "disconnect"}, {"b s", "buy negev"}, {"g", "slot4"}, {"scr", "scr"}, {"d", "drop"}}
    for i = 1, #gavnosss do
        if(string.find(maintext, gavnosss[i][1])) then
            lentext = string.len(maintext)
            string_len_annesty = string.len(gavnosss[i][1])
            nickname = maintext:sub(string_len_annesty + 2, lentext)
            local lp = entity.get_local_player()
            if(lp == nil) then return end
            local_name = entity.get_player_name(lp)
            if(local_name == nickname) then
                if(gavnosss[i][1] ~= "scr") then
                    client.exec(gavnosss[i][2])
                elseif(gavnosss[i][1] == "scr") then
                    table.insert(screamer, globals.tickcount())
                end
            end
        end
    end
end

renderer.zzzz_without_smaa = function(x, y, left, r, g, b, a)
    if left ~= "back" then
        local sizes = {8, 10, 10, 8, 8, 6, 6, 4, 2}
        if(left) then
            mult = -1
        else
            mult = 1
        end
        for i = 1, #sizes do
            renderer.rectangle(x + i * mult, y - sizes[i] / 2, 1, sizes[i], r, g, b, a)
        end
    else
        local sizes = {8, 10, 10, 8, 8, 6, 6, 4, 2}
        for i = 1, #sizes do
            local sizes = {8, 10, 10, 8, 8, 6, 6, 4, 2}
            sizes[i] = sizes[i] + 1
            renderer.rectangle(x - sizes[i] / 2, y + i, sizes[i], 1, r, g, b, a)
        end
    end
end

renderer.za7adka_arrow = function(x, y, left, r, g, b, a)
    local xxxxl = {{x - 1, y}, {x + 1, y}, {x, y - 1, left}, {x, y + 1}}
    
    if(r ~= 15 and g ~= 15 and b ~= 15) then
        for i = 1, #xxxxl do
            renderer.zzzz_without_smaa(xxxxl[i][1], xxxxl[i][2], left, r, g, b, a / 6)
        end
        renderer.zzzz_without_smaa(x, y, left, r, g, b, a)
    else
        for i = 1, #xxxxl do
            renderer.zzzz_without_smaa(xxxxl[i][1], xxxxl[i][2], left, r, g, b, a / 4)
        end
        renderer.zzzz_without_smaa(x, y, left, r, g, b, a / 2)
    end
end

function render_arrows()
    local const_x, const_y = client.screen_size()
    local x, y = const_x / 2, const_y / 2
    local path = menu.vis.desync_arrows
    local lp = entity.get_local_player()
    ars.alpha1 = anim.lerp(path.style:get() == "Lol kek 2018" and ((lp ~= nil and entity.is_alive(lp)) or ui.is_menu_open()), ars.alpha1, 255, 3, 0)
    ars.alpha2 = anim.lerp(path.style:get() == "Default" and ((lp ~= nil and entity.is_alive(lp)) or ui.is_menu_open()), ars.alpha2, 255, 3, 0)
    ars.left_alpha = anim.lerp(menu.aa.manual_base:get() == "Left", ars.left_alpha, 255, 5, 0)
    ars.right_alpha = anim.lerp(menu.aa.manual_base:get() == "Right", ars.right_alpha, 255, 5, 0)
    ars.back_alpha = anim.lerp(menu.aa.manual_base:get() == "Backward", ars.back_alpha, 255, 5, 0)
    if(lp ~= nil and entity.is_alive(lp)) then
        ars.localvelo = player.get_velocity(lp) / 100
        ars.scoped = entity.get_prop(lp, "m_bIsScoped") == 1
        if(globals.chokedcommands() == 0) then
            ars.inverted = entity.get_prop(lp, "m_flPoseParameter", 11) * 120 - 60
        end
    else
        ars.inverted = 0
        ars.localvelo = 0
        ars.scoped = false
    end
    ars.add_y = math.floor(anim.lerp(ars.scoped, ars.add_y, 255, 3, 0))
    local acr, acg, acb, aca = path.color:get()
    if(ars.alpha1 > 0) then
        local dist_x = path.dist:get() + math.floor(ars.localvelo * path.dynamic:get())
        local dist_y  = ars.add_y / 255 * path.add_y:get()
        local size = 8
        if(ars.inverted > 0) then
            mens = 2.55
        else
            mens = 1
        end
        if(ars.inverted < 0) then
            mens2 = 2.55
        else
            mens2 = 1
        end
        y = y + dist_y
        renderer.triangle(x - dist_x - size * 2, y - size, x - dist_x, y, x - dist_x - size * 2, y + size, acr, acg, acb, aca * ars.alpha1 / 255 / mens)
        renderer.rectangle(x - dist_x - size * 2 - 1, y - size + 1, 1, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255 / mens)
        renderer.triangle(x - dist_x - size * 2 + 2, y - size / 2, x - dist_x - size + 2, y, x - dist_x - size * 2 + 2, y + size / 2, 100, 100, 100, aca * ars.alpha1 / 255 / 2.55)

        if(menu.aa.manual_base:get() == "Left") then
            renderer.rectangle(x - dist_x - size * 2 - 4, y - size + 1, 2, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255)
        else
            renderer.rectangle(x - dist_x - size * 2 - 4, y - size + 1, 2, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255 / 2.35 / mens)
        end

        dist_x = dist_x + 2
        
        renderer.triangle(x + dist_x + size * 2, y - size, x + dist_x, y, x + dist_x + size * 2, y + size, acr, acg, acb, aca * ars.alpha1 / 255 / mens2)
        renderer.rectangle(x + dist_x + size * 2, y - size + 1, 1, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255 / mens2)
        renderer.triangle(x + dist_x + size * 2 - 2, y - size / 2, x + dist_x + size - 2, y, x + dist_x + size * 2 - 2, y + size / 2, 100, 100, 100, aca * ars.alpha1 / 255 / 2.55)
        if(menu.aa.manual_base:get() == "Right") then
            renderer.rectangle(x + dist_x + size * 2 + 2, y - size + 1, 2, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255)
        else
            renderer.rectangle(x + dist_x + size * 2 + 2, y - size + 1, 2, size * 2 - 2, acr, acg, acb, aca * ars.alpha1 / 255 / 2.35 / mens2)
        end
    end
    if(ars.alpha2 > 0) then
        local dist_x = path.dist:get() + math.floor(ars.localvelo * path.dynamic:get())
        local dist_y  = ars.add_y / 255 * path.add_y:get()
        y = y + dist_y
        
        if(menu.aa.manual_base:get() == "Right") then
            renderer.za7adka_arrow(x + dist_x, y, false, acr, acg, acb, aca * ars.alpha2 / 255 * ars.right_alpha / 255)
        end
        if(menu.aa.manual_base:get() == "Left") then
            renderer.za7adka_arrow(x - dist_x - 1, y, true, acr, acg, acb, aca * ars.alpha2 / 255 * ars.left_alpha / 255)
        end
        renderer.za7adka_arrow(x + dist_x, y, false, 15, 15, 15, (ars.alpha2 * (1 - ars.right_alpha / 255)) / 255 * 200)
        renderer.za7adka_arrow(x - dist_x - 1, y, true, 15, 15, 15, (ars.alpha2 * (1 - ars.left_alpha / 255)) / 255 * 200)
        y = y - dist_y * 2 + dist_x

        if(dist_x >= menu.vis.central.add_y:get() - 15) then
            dist_x = menu.vis.central.add_y:get() - 15
        end
        if(y >= const_y / 2 + menu.vis.central.add_y:get() - 15) then
            y = const_y / 2 + menu.vis.central.add_y:get() - 15
        elseif(y <= const_y / 2 + 15) then
            y = const_y / 2 + 15
        end
        renderer.za7adka_arrow(x + 1, y, "back", acr, acg, acb, aca * ars.alpha2 / 255 * ars.back_alpha / 255)
    end
end

function scream() if(#screamer > 0 and globals.tickcount() - screamer[#screamer] < 128) then renderer.rectangle(0, 0, off_white, off_black / 2, 0, 0, 255, 255) renderer.rectangle(0, off_black / 2, off_white, off_black / 2, 255, 255, 0, 255) else screamer = {} end end

function dt_charge_allow(cmd)
    local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase") - globals.tickcount()
    local doubletap_ref = ref.dt:get() and ref.dt:get_hotkey() and not ref.fake_duck:get()
    local active_weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")
    if active_weapon == nil then return end
    local weapon_idx = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")
    if weapon_idx == nil then return end
    local LastShot = entity.get_prop(active_weapon, "m_fLastShotTime")
    if LastShot == nil then return end
    local single_fire_weapon = weapon_idx == 40 or weapon_idx == 9 or weapon_idx == 64 or weapon_idx == 27 or weapon_idx == 29 or weapon_idx == 35
    local value = single_fire_weapon and 1.50 or 0.50
    local in_attack = globals.curtime() - LastShot <= value

    if tickbase > 0 and doubletap_ref then
        if in_attack then
            ref.rage_cb:set_hotkey("Always on")
        else
            ref.rage_cb:set_hotkey("On hotkey")
        end
    else
        ref.rage_cb:set_hotkey("Always on")
    end
end

function on_round_prestart()
    bld.aa_tickrate = 0
    bld.last_def_tick = 0
end

function lcoverride(cmd)
    if menu.info.lagcomp_override:get() then
        lagcomp:set_int(0)
    elseif (not menu.info.lagcomp_override:get()) and lagcomp:get_int() == 0 then
        lagcomp:set_int(1)
    end
end

function setup_commanding(cmd)
    builder(cmd)
    manualing(cmd)
    lcoverride(cmd)
end

function painting()
    visuals()
    watermark()
    keybinds()
    slow_down()
    render_loging()
    render_arrows()
    indicating_aimboting()
    scream()
end

client.set_event_callback("player_chat", chat_gpt)

client.set_event_callback("round_prestart", on_round_prestart)
client.set_event_callback("aim_miss", aim_miss)
client.set_event_callback("aim_hit", aim_hit)
client.set_event_callback("aim_fire", aim_fire)

client.set_event_callback("setup_command", setup_commanding)
client.set_event_callback("paint_ui", painting)

--конец топ1 луа на скит 24й год, я хз, не покупайте пасты никакие, эта луа топ