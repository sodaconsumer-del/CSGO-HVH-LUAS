-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2



local pui = require "neverlose/pui"
local clipboard = require "neverlose/clipboard"
local base64 = require "neverlose/base64"
local bomb = require "neverlose/bomb"

ffi.cdef[[
    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
    bool DeleteUrlCacheEntryA(const char* lpszUrlName);

    typedef void*(__thiscall* get_client_entity_t)(void*, int);
    typedef struct {
        char  pad_0000[20];
        int m_nOrder;
        int m_nSequence;
        float m_flPrevCycle;
        float m_flWeight;
        float m_flWeightDeltaRate;
        float m_flPlaybackRate;
        float m_flCycle;
        void *m_pOwner;
        char  pad_0038[4];
    } animstate_layer_t;
]]

local uintptr_t = ffi.typeof("uintptr_t**")
local get_entity_address = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
local animslsg = nil

local screen_x, screen_y = render.screen_size().x, render.screen_size().y

local refs = {
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
    avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
    yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    body_yaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
    body_yaw_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
    body_yaw_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
    body_yaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
    body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
    freestanding_disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
    freestanding_body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
    slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
    filters = ui.find("Miscellaneous", "Main", "Other", "Filters"),
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"),
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"),
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
}

local function get_original(convar)
    return tonumber(convar:string())
end

local tabs = {
    tab_switcher = pui.create("\n\n\n\n\n\n\n\n\n\n\n\n\n", 1),
    under_tab_switcher1 = pui.create("\n\n\n\n\n\n\n\n\n\n", 1),
    under_tab_switcher = pui.create("\n", 1),
    anti_aim = pui.create("\n\n", 2),
    visuals = pui.create("\n\n\n\n", 2),
    misc = pui.create("\n\n\n\n\n\n", 2),
    configs = pui.create("\n\n\n\n\n\n\n\n", 2),
    huj = pui.create("", 1),
}

math.max_lerp_low_fps = (1 / 45) * 100
math.lerp = function(start, end_pos, time)
    if start == end_pos then
        return end_pos
    end

    local frametime = globals.frametime * 170
    time = time * math.min(frametime, math.max_lerp_low_fps)

    local val = start + (end_pos - start) * globals.frametime * time

    if(math.abs(val - end_pos) < 0.01) then
        return end_pos
    end

    return val
end

local animations = {}
animations.base_speed = 0.095
animations._list = {}
animations.new = function(name, new_value, speed, init)
    speed = speed or animations.base_speed

    if animations._list[name] == nil then
        animations._list[name] = (init and init) or 0
    end

    animations._list[name] = math.lerp(animations._list[name], new_value, speed)
    
    return animations._list[name]
end

local time_to_ticks = function(t) 
    return math.floor(t / globals.tickinterval + 0.5) 
end

local conditions = {
    "shared",
    "stand", 
    "moving", 
    "air", 
    "air-crouching", 
    "crouching", 
    "crouching-moving", 
    "slow-walking"
}

local menu = {
    Lethal = tabs.tab_switcher:label("                              \v\f<file-code> Lethal Lua"),
    select_tab = tabs.tab_switcher:combo("", "anti-aim", "visuals", "misc", "configs"),

    anti_aim = {
        label = tabs.anti_aim:label("                                \v\f<sliders-simple> Builder"),
        conditions = tabs.anti_aim:combo("\v[ \f<person-running> ]\r  condition", conditions),
        label1 = tabs.under_tab_switcher:label("                                 \v\f<layer-group> Tools"),
        manual_yaw = tabs.under_tab_switcher:combo("\v\f<arrows-maximize>\r  manual yaw", {"disabled", "left", "right", "front"}, function(gear)
            return 
            {
                manual_over_fs = gear:switch("\v\f<arrow-up-short-wide>\r  manual over fs", false),
                manual_yaw_static = gear:switch("\v\f<chart-pyramid>\r  static", false)
            }
        end),
        freestanding = tabs.under_tab_switcher:switch("\v\f<arrow-down-up-across-line>\r  freestanding", false, function(gear)
            return 
            {
                freestanding_static = gear:switch("\v\f<chart-pyramid>\r  static", false)
            }
        end),
        flickexploit = tabs.under_tab_switcher:switch(" \v\f<pills>\r  Fake Flick", false, function(gear)
            return
            {
                flickselectable = gear:listable("", {"Standing", "Walking", "Crouch", "Air"}),
            }
        end),
        safe_head = tabs.under_tab_switcher:selectable("\v\f<face-head-bandage>\r  safe head", {"air crouch knife", "air crouch taser", "height advantage"}),
        tweaks = tabs.under_tab_switcher:selectable("\v\f<wand-magic-sparkles>\r  tweaks", {"avoid backstab", "disable on warmup", "edge yaw"}),
        builder = { }
    },
    visuals = {
        label2 = tabs.visuals:label("                                \v\f<star-shooting> Visuals"),
        watermark_position = tabs.visuals:combo("\v\f<location-dot>\r  watermark", {"left", "right", "bottom"}, color(255)),
        aimbot_logs = tabs.visuals:switch("\v\f<address-card>\r  aimbot logs", false),
        scope_overlay = tabs.visuals:switch("\v\f<crosshairs>\r  scope overlay", false, function(gear)
            return 
            {
                scope_overlay_size = gear:slider("size", 0, 300, 100),
                scope_overlay_gap = gear:slider("gap", 0, 300, 5),
                scope_overlay_color = gear:color_picker("color")
            }
        end),
        gs_indicators = tabs.visuals:switch("\v\f<bars-staggered>\r  g\a00FF00FFs\aDEFAULT indicators", false),
        manual_arrows = tabs.visuals:switch("\v\f<code-simple>\r  manual arrows", false, function(gear)
            return 
            {
                manual_arrows_color = gear:color_picker("color", color(255))
            }
        end),
        damage_indicator = tabs.visuals:switch("\v\f<arrow-down-9-1>\r  damage indicator", false)
    },
    misc = {
        label3 = tabs.misc:label("                                  \v\f<grid-2-plus> Misc"),
        fast_ladder = tabs.misc:switch("\v\f<water-ladder>\r  fast ladder", false),
        nade_throw_fix = tabs.misc:switch("\v\f<bomb>\r  nade throw fix", false),
        aspect_ratio = tabs.misc:switch("\v\f<panorama>\r   Aspect Ratio", false, function(gear)
            return 
            {
                amount = gear:slider("Amount", 0, 200, 0, 0.01),
            }
        end),
        viewmodel = tabs.misc:switch("\v\f<hands>\r  viewmodel", false, function(gear)
            return 
            {
                viewmodel_fov = gear:slider("fov", 0, 1000, 600, 0.1),
                viewmodel_x = gear:slider("x", -100, 100, 10, 0.1),
                viewmodel_y = gear:slider("y", -100, 100, 10, 0.1),
                viewmodel_z = gear:slider("z", -100, 100, -10, 0.1),
            }
        end),
        animations = tabs.misc:switch("\v\f<bone-break>\r  animations", false, function(gear)
            return 
            {
                animations_select = gear:listable("\n", {"move lean", "static in air", "jitter ground legs", "jitter air legs", "earthquake"})
            }
        end),
    }
}

for i = 1, #conditions do
    menu.anti_aim.builder[i] = {
        enable_state = tabs.anti_aim:switch("\v\f<toggle-large-on>\r  enable \v" .. conditions[i]),
        yaw_mode = tabs.anti_aim:combo("\v\f<right-left>\r  yaw", "static", "switch"),
        yaw_amt = tabs.anti_aim:slider("\v\f<arrows-left-right>\r  yaw amount", -180, 180, 0),
        yaw_left_amt = tabs.anti_aim:slider("\v\f<left-long>\r yaw left amount", -180, 180, 0),
        yaw_right_amt = tabs.anti_aim:slider("\v\f<right-long>\r  yaw right amount", -180, 180, 0),
        yaw_jitter = tabs.anti_aim:combo("\v\f<arrows-turn-to-dots>\r  yaw jitter", "disabled", "center", "offset", "random", "spin", "3-way", "5-way"),
        yaw_jitter_amt = tabs.anti_aim:slider("\v\f<arrows-repeat>\r  yaw jitter amount", -180, 180, 0),
        body_left_amt = tabs.anti_aim:slider("\v\f<user-minus>\r  body left", 0, 60, 0),
        body_right_amt = tabs.anti_aim:slider("\v\f<user-plus>\r  body right", 0, 60, 0),
        body_jitter = tabs.anti_aim:switch("\v\f<person-rays>\r  body jitter", true, function(gear)
            return {
                body_delay = gear:slider("\v\f<arrow-down-short-wide>\r  delay", 1, 10, 1),
            }
        end),
    }
end

for i = 1, #conditions do
    menu.anti_aim.conditions:depend( { menu.select_tab, "anti-aim" } )

    enaa = {menu.anti_aim.builder[i].enable_state, function() if(i == 1) then return true else return menu.anti_aim.builder[i].enable_state:get() end end}

    menu.anti_aim.builder[i].enable_state:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.conditions, function() return menu.anti_aim.conditions.value ~= "shared" end } )
    menu.anti_aim.builder[i].yaw_mode:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, enaa )
    menu.anti_aim.builder[i].yaw_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.builder[i].yaw_mode, "static" }, enaa )
    menu.anti_aim.builder[i].yaw_left_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.builder[i].yaw_mode, "switch" }, enaa )
    menu.anti_aim.builder[i].yaw_right_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.builder[i].yaw_mode, "switch" }, enaa )
    menu.anti_aim.builder[i].yaw_jitter:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, enaa )
    menu.anti_aim.builder[i].yaw_jitter_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.builder[i].yaw_jitter, function() return menu.anti_aim.builder[i].yaw_jitter.value ~= "disabled" end }, enaa )
    menu.anti_aim.builder[i].body_left_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, enaa )
    menu.anti_aim.builder[i].body_right_amt:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, enaa )
    menu.anti_aim.builder[i].body_jitter:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, enaa )
    menu.anti_aim.builder[i].body_jitter.body_delay:depend( { menu.select_tab, "anti-aim" }, { menu.anti_aim.conditions, conditions[i] }, { menu.anti_aim.builder[i].body_jitter, true } )
end

menu.anti_aim.manual_yaw:depend( { menu.select_tab, "anti-aim" } )
menu.anti_aim.freestanding:depend( { menu.select_tab, "anti-aim" } )
menu.anti_aim.freestanding.freestanding_static:depend( menu.anti_aim.freestanding )
menu.anti_aim.safe_head:depend( { menu.select_tab, "anti-aim" } )
menu.anti_aim.tweaks:depend( { menu.select_tab, "anti-aim" } )

menu.anti_aim.label:depend( { menu.select_tab, "anti-aim" } )
menu.anti_aim.label1:depend( { menu.select_tab, "anti-aim" } )
menu.visuals.label2:depend( { menu.select_tab, "visuals" } )
menu.misc.label3:depend( { menu.select_tab, "misc" } )

menu.anti_aim.flickexploit:depend( { menu.select_tab, "anti-aim" } )
menu.anti_aim.flickexploit.flickselectable:depend( menu.anti_aim.flickexploit )


menu.visuals.watermark_position:depend( { menu.select_tab, "visuals" } )
menu.visuals.aimbot_logs:depend( { menu.select_tab, "visuals" } )

menu.visuals.scope_overlay:depend( { menu.select_tab, "visuals" } )
menu.visuals.scope_overlay.scope_overlay_size:depend( menu.visuals.scope_overlay )
menu.visuals.scope_overlay.scope_overlay_gap:depend( menu.visuals.scope_overlay )
menu.visuals.scope_overlay.scope_overlay_color:depend( menu.visuals.scope_overlay )

menu.misc.viewmodel:depend( { menu.select_tab, "misc" } )
menu.misc.viewmodel.viewmodel_fov:depend( menu.misc.viewmodel )
menu.misc.viewmodel.viewmodel_x:depend( menu.misc.viewmodel )
menu.misc.viewmodel.viewmodel_y:depend( menu.misc.viewmodel )
menu.misc.viewmodel.viewmodel_z:depend( menu.misc.viewmodel )

menu.misc.aspect_ratio:depend( { menu.select_tab, "misc" } )
menu.misc.aspect_ratio.amount:depend( menu.misc.aspect_ratio )

menu.visuals.gs_indicators:depend( { menu.select_tab, "visuals" } )

menu.visuals.manual_arrows:depend( { menu.select_tab, "visuals" } )
menu.visuals.manual_arrows.manual_arrows_color:depend( menu.visuals.manual_arrows )

menu.visuals.damage_indicator:depend( { menu.select_tab, "visuals" } )

menu.misc.fast_ladder:depend( { menu.select_tab, "misc" } )

menu.misc.nade_throw_fix:depend( { menu.select_tab, "misc" } )

menu.misc.animations:depend( { menu.select_tab, "misc" } )
menu.misc.animations.animations_select:depend( menu.misc.animations )

conditionfunc = { 
    onground_ticks = 0,

    in_air = function (indx) 
        return bit.band(indx.m_fFlags,1) == 0
    end,
    on_ground = function (indx,limit)
        local onground = bit.band(indx.m_fFlags,1)
        if onground == 1 then
            conditionfunc.onground_ticks = conditionfunc.onground_ticks + 1
        else
            conditionfunc.onground_ticks = 0
        end

        return conditionfunc.onground_ticks > limit
    end,
    velocity = function(indx)
        local vel = indx.m_vecVelocity
        local velocity = math.sqrt(vel.x * vel.x + vel.y * vel.y)
        return velocity
    end,
    is_crouching = function (indx)
        return indx.m_flDuckAmount > 0.8
    end
}

local is_inverted = false
local switch = false
local ticks = 0
local stateid = 0
local yaw_offset = 0
local edge_angle = 0
local is_edging = false

events.createmove:set(function(cmd)
    local lp = entity.get_local_player()
    if lp == nil or not lp:is_alive() then return end

    function edge_trigger()
        is_edging = false
    
        if cmd.send_packet then 
            vecTraceStart = lp:get_eye_position() 
        end
    
        local aTraceEnd = {}
    
        local angViewAngles = render.camera_angles()
        local distances = {}
    
        for flYaw = 18, 360, 18 do
            flYaw = math.normalize_yaw(flYaw)
    
            local vecTraceEnd = vecTraceStart + vector():angles(0, flYaw) * 198
    
            local traceInfo = utils.trace_line(vecTraceStart, vecTraceEnd, player, 0x46004003)
            table.insert(distances, vecTraceStart:dist(traceInfo.end_pos))
    
            local flFraction = traceInfo.fraction
            local pEntity = traceInfo.entity
    
            if pEntity and pEntity:get_classname() == 'CWorld' and flFraction < 0.3 then
                aTraceEnd[#aTraceEnd+1] = {
                    vecTraceEnd = vecTraceEnd,
                    flYaw = flYaw
                }
            end
        end
    
        table.sort(distances)
    
        if distances[1] > 30 then return end
    
        table.sort(aTraceEnd, function(a, b) return a.flYaw < b.flYaw end)
    
        table.remove(aTraceEnd, #aTraceEnd)
    
        local angEdge
    
        if #aTraceEnd >= 3 then
            local vecTraceCenter = aTraceEnd[1].vecTraceEnd:lerp(aTraceEnd[#aTraceEnd].vecTraceEnd, 0.5)
    
            angEdge = (vecTraceStart - vecTraceCenter):angles()
        end
    
        if angEdge then
            local flYaw = angViewAngles.y
            local flEdgeYaw = angEdge.y
    
            local flDiff = math.normalize_yaw(flEdgeYaw - flYaw)
            if math.abs(flDiff) < 90 then 
                flDiff = 0
                flYaw = math.normalize_yaw(flEdgeYaw + 180)
            end
    
            local flNewYaw = -flYaw
            flNewYaw = math.normalize_yaw(flNewYaw + flEdgeYaw + flDiff + 180)
    
            edge_angle = flNewYaw
            is_edging = true
        end
    end

    edge_trigger()

    if conditionfunc.in_air(lp) and conditionfunc.is_crouching(lp) and not conditionfunc.on_ground(lp, 10) and menu.anti_aim.builder[5].enable_state:get() then
        stateid = 5 -- air crouch
    elseif conditionfunc.in_air(lp) and not conditionfunc.on_ground(lp, 10) and menu.anti_aim.builder[4].enable_state:get() then
        stateid = 4 -- air
    elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() and menu.anti_aim.builder[8].enable_state:get() then
        stateid = 8 -- slow walk
    elseif conditionfunc.on_ground(lp, 10) and conditionfunc.is_crouching(lp) and conditionfunc.velocity(lp) > 2 and menu.anti_aim.builder[7].enable_state:get() then
        stateid = 7 -- crouch move
    elseif conditionfunc.on_ground(lp, 10) and conditionfunc.is_crouching(lp) and menu.anti_aim.builder[6].enable_state:get() then
        stateid = 6 -- crouch
    elseif conditionfunc.on_ground(lp, 10) and conditionfunc.velocity(lp) > 2 and menu.anti_aim.builder[3].enable_state:get() then
        stateid = 3 -- run
    elseif conditionfunc.on_ground(lp, 10) and conditionfunc.velocity(lp) < 2 and menu.anti_aim.builder[2].enable_state:get() then
        stateid = 2 -- stand
    else
        stateid = 1 -- shared
    end

    local weapon = lp:get_player_weapon()
    if not weapon or weapon == nil then return end

    local weapon_info = weapon:get_weapon_info()
    if not weapon_info or weapon_info == nil then return end

    local weapon_classname = weapon:get_classname()
    if not weapon_classname or weapon_classname == nil then return end

    local is_grenade = weapon_info.weapon_type == 9
    local is_taser = weapon_classname == "CWeaponTaser"
    local is_knife = weapon_classname == "CKnife"

    local target_origin = entity.get_threat() ~= nil and entity.get_threat():get_origin() or lp:get_origin()
    local player_origin = lp:get_origin()

    local above_enemy = target_origin.z < player_origin.z - 150

    if cmd.choked_commands == 0 then
        is_inverted = not rage.antiaim:inverter()

        if menu.anti_aim.builder[stateid].body_jitter.body_delay:get() > 1 then
            ticks = ticks + 1
                
            if ticks > menu.anti_aim.builder[stateid].body_jitter.body_delay:get() then
                ticks = 0
                switch = not switch
            end
    
            is_inverted = switch
        end
    
        refs.pitch:override("Down")
    
        refs.body_yaw:override(true)
        refs.body_yaw_left_limit:override(menu.anti_aim.builder[stateid].body_left_amt:get())
        refs.body_yaw_right_limit:override(menu.anti_aim.builder[stateid].body_right_amt:get())
    
        if menu.anti_aim.builder[stateid].body_jitter:get() then
            if menu.anti_aim.builder[stateid].body_jitter.body_delay:get() > 1 then
                refs.body_yaw_inverter:override(is_inverted)
                refs.body_yaw_options:override("")
            else
                refs.body_yaw_inverter:override()
                refs.body_yaw_options:override("Jitter")
            end
        else refs.body_yaw_options:override("") end
    
        refs.yaw:override("Backward") refs.yaw_base:override("At Target")
        refs.avoid_backstab:override(menu.anti_aim.tweaks:get(1))
    
        if menu.anti_aim.builder[stateid].yaw_mode:get() == "switch" then
            refs.yaw_offset:override(is_inverted and menu.anti_aim.builder[stateid].yaw_left_amt:get() or menu.anti_aim.builder[stateid].yaw_right_amt:get())
        else refs.yaw_offset:override(menu.anti_aim.builder[stateid].yaw_amt:get()) end
    
        if menu.anti_aim.builder[stateid].yaw_jitter:get() == "center" then
            refs.yaw_modifier:override("Center")
        elseif menu.anti_aim.builder[stateid].yaw_jitter:get() == "offset" then
            refs.yaw_modifier:override("Offset")
        elseif menu.anti_aim.builder[stateid].yaw_jitter:get() == "random" then
            refs.yaw_modifier:override("Random")
        elseif menu.anti_aim.builder[stateid].yaw_jitter:get() == "spin" then
            refs.yaw_modifier:override("Spin")
        elseif menu.anti_aim.builder[stateid].yaw_jitter:get() == "3-way" then
            refs.yaw_modifier:override("3-Way")
        elseif menu.anti_aim.builder[stateid].yaw_jitter:get() == "5-way" then
            refs.yaw_modifier:override("5-Way")
        else
            refs.yaw_modifier:override("Disabled")
        end
        refs.yaw_modifier_offset:override(menu.anti_aim.builder[stateid].yaw_jitter_amt:get())
    end
    
    if menu.anti_aim.manual_yaw:get() == "front" or menu.anti_aim.manual_yaw:get() == "left" or menu.anti_aim.manual_yaw:get() == "right" then
        if menu.anti_aim.manual_yaw.manual_yaw_static:get() then
            refs.yaw_modifier:override("Disabled")
            refs.yaw_modifier_offset:override(0)
            refs.body_yaw_options:override("")

            if menu.anti_aim.manual_yaw:get() == "front" then
                refs.yaw_offset:override(180)
            elseif menu.anti_aim.manual_yaw:get() == "left" then
                refs.yaw_offset:override(-90)
            elseif menu.anti_aim.manual_yaw:get() == "right" then
                refs.yaw_offset:override(90)
            end
        else
            if menu.anti_aim.manual_yaw:get() == "front" then
                refs.yaw_offset:override(180)
            elseif menu.anti_aim.manual_yaw:get() == "left" then
                refs.yaw_offset:override(-90)
            elseif menu.anti_aim.manual_yaw:get() == "right" then
                refs.yaw_offset:override(90)
            end
        end
    end

    if menu.anti_aim.freestanding:get() and menu.anti_aim.freestanding.freestanding_static:get() then
        refs.yaw_modifier:override("Disabled")
        refs.yaw_modifier_offset:override(0)
        refs.body_yaw_options:override("")
        rage.antiaim:inverter(false)

        refs.freestanding_disable_yaw_modifiers:override(true)
        refs.freestanding_body_freestanding:override(true)
    else
        refs.freestanding_disable_yaw_modifiers:override()
        refs.freestanding_body_freestanding:override()
    end

    refs.freestanding:override(menu.anti_aim.freestanding:get())

    if menu.anti_aim.manual_yaw:get() ~= "disabled" and menu.anti_aim.manual_yaw.manual_over_fs:get() then
        refs.freestanding:override(false)
    end

    if menu.anti_aim.tweaks:get(3) and is_edging then
        refs.pitch:override("Down")
        refs.yaw:override("Backward")
        refs.yaw_offset:override(edge_angle)
        refs.hidden_yaw:override(false)
    end

    function safe_head_values()
        refs.yaw_offset:override(0)
        refs.yaw_modifier:override("Disabled")
        refs.yaw_modifier_offset:override(0)
        refs.body_yaw:override(true)
        refs.body_yaw_left_limit:override(25)
        refs.body_yaw_right_limit:override(25)
        refs.body_yaw_options:override("")
        rage.antiaim:inverter(false)
    end

    if menu.anti_aim.safe_head:get(1) and is_knife and stateid == 5 then
        safe_head_values()
    elseif menu.anti_aim.safe_head:get(2) and is_taser and stateid == 5 then
        safe_head_values()
    elseif menu.anti_aim.safe_head:get(3) and above_enemy then
        safe_head_values()
    end

    if menu.anti_aim.tweaks:get(2) and entity.get_game_rules().m_bWarmupPeriod then
        refs.pitch:override("Disabled")
        refs.yaw:override("Backward")
        refs.yaw_offset:set(180)
        refs.hidden_yaw:override(false)
        refs.yaw_modifier:override("Disabled")
        refs.yaw_modifier_offset:override(0)
        refs.body_yaw:override(false)
        refs.body_yaw_left_limit:override(0)
        refs.body_yaw_right_limit:override(0)
        refs.body_yaw_options:override("")
        rage.antiaim:inverter(false)
    end

    if menu.misc.fast_ladder:get() then
        if lp.m_MoveType == 9 then
            if cmd.forwardmove > 0 then
                if render.camera_angles().x < 45 then
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

    if menu.misc.nade_throw_fix:get() then
        if weapon_info.weapon_type == 9 then
            refs.weapon_actions:override("")
        else
            refs.weapon_actions:override()
        end
    else
        refs.weapon_actions:override()
    end
end)

local hitgroup_str = {
    [0] = 'generic',
    'head', 'chest', 'stomach',
    'left arm', 'right arm',
    'left leg', 'right leg',
    'neck', 'generic', 'gear'
}

local verdana = render.load_font("Verdana", 16, "ad")
local calibri_bold = render.load_font("Calibri", 24, "bad")

local bomb_img = render.load_image("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x64\x00\x00\x00\x5C\x08\x03\x00\x00\x00\xAF\x15\xE0\xA6\x00\x00\x00\x01\x73\x52\x47\x42\x01\xD9\xC9\x2C\x7F\x00\x00\x00\x09\x70\x48\x59\x73\x00\x00\x0B\x13\x00\x00\x0B\x13\x01\x00\x9A\x9C\x18\x00\x00\x02\xDF\x50\x4C\x54\x45\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\x76\x99\x69\x74\x00\x00\x00\xF5\x74\x52\x4E\x53\x00\x01\x43\x93\x58\x06\x5A\xFB\xFF\xFD\x96\x04\xD5\xF9\x02\x0E\xE3\x18\x16\xEA\x2B\x1B\xEF\x36\x29\x73\x72\x1E\xF2\x3F\x75\x6B\x20\xEB\xF4\x32\x21\xF6\x47\x2F\xE7\xE2\x37\x5E\xB7\x0F\x23\xF8\x51\x08\xB3\x9A\x7D\xF7\x63\x00\x70\x7A\xC1\x25\x6E\x2D\xE0\x62\xFC\xC2\x28\x76\xAE\x88\x0B\xC9\x5D\x7E\xFA\xE9\x27\x5C\xDF\x12\x31\x84\xD8\x8C\xCF\x97\x3A\x8A\x03\xAC\xDA\x1C\x6C\x2E\x42\x8F\x7B\xA1\x4B\x95\x10\xCA\x13\x55\x3D\x1A\x33\x0A\x4E\x69\x82\xBB\x41\xC7\x80\x87\x91\x9E\xA6\xAA\x86\x7F\x5F\x26\xDC\xFE\x49\xE8\x17\xC3\x46\x89\x92\xBA\x2C\xC0\xB8\xA3\x9F\xA8\xAF\xB1\xB5\xBC\xD4\x7C\xF3\x9D\x24\x0D\x8E\x5B\x05\xD9\xD1\x99\xF1\xCC\xCB\x9B\x4F\x14\xCE\xC5\xCD\x19\x30\xF5\x07\xDE\x15\xA4\x1D\x11\xE5\x83\x2A\xA0\x71\xD6\xD0\xC6\xB9\xA9\x6D\x52\x35\xDD\x0C\xE4\x64\xED\xBF\xC4\x8D\x77\x85\x8B\x90\xEE\xE6\xA5\x78\xEC\x09\x60\x1F\x81\xAB\x9C\x98\x38\x61\x4A\xB2\x34\x4C\xDB\xA7\xD2\x45\x39\x53\xB0\xF0\xBD\x94\x4D\xB4\x44\x54\x3E\xA2\x22\x59\x6A\xE1\xD7\xAD\x40\x48\x3B\xBE\x65\x74\x34\x72\x01\xD4\x00\x00\x07\x6E\x49\x44\x41\x54\x78\x9C\xED\x9A\xF9\x5B\xD4\x46\x18\xC7\xB3\x22\x32\x2B\x8B\x8A\x58\xD0\x42\xE5\x10\x54\x28\x42\x11\x70\x11\x11\x10\x95\x22\x28\x56\x2C\x88\x14\x05\xE4\xB4\x1C\xC5\x20\x60\x45\xBC\x51\x01\xA1\x88\x88\xA2\xA2\x78\x71\x15\x15\x0B\x88\x78\x0B\x15\x54\x14\xCF\x0A\x78\xB6\xB5\xD5\x5A\xDB\xDA\xEB\x0F\x68\x66\x26\xBB\x9B\x84\xDD\x25\x86\xA5\xCF\xD3\x3E\xBE\xBF\x64\xE7\x9B\xF7\x7D\x3F\x39\x66\x92\x77\x26\x4B\x10\x02\x4C\x34\x40\x6B\xA0\xB6\x90\xC0\x37\xB1\x41\x3A\x40\x3C\xB8\x9F\x19\xBA\x12\x00\x80\xDE\x90\xFE\x85\x0C\x1D\x46\x41\x80\x7E\xFF\x42\x86\x1B\x40\xC8\x88\xFE\x85\xBC\x63\x08\x21\x46\x9A\x4B\x38\x72\xD4\xBB\x3D\x0E\xD9\xD8\x04\x42\xDE\xE3\xA8\xA2\x91\xA3\x4D\xCD\x04\x31\xF4\xCD\x01\xB0\x18\xC3\x11\x2D\xAD\x20\x64\x2C\x47\x1D\x37\x1E\x00\x6B\x1B\x21\x90\xF7\x61\x3A\xDB\x09\x6C\xD1\xCE\x1E\xAA\x1F\xB0\x45\x87\x89\x50\x74\x14\x02\xB1\x13\xC3\x50\x27\x8E\xE8\x0C\xC5\x49\x2C\x4D\xEA\xA2\x03\xC5\xC9\x42\x20\x84\x2B\x0C\x15\xB3\x6F\xCB\x14\x3D\x28\xBA\xB1\xB4\xA9\xE3\xA1\xE6\x6E\x26\x08\xE2\xE1\x09\x83\xA7\x39\x30\x35\x2F\xA4\x4D\x67\x4A\xBA\x33\xA0\x04\x66\x0A\x62\x10\xDE\x1F\xA2\x68\x1F\xA6\x36\x02\x49\xB3\x18\x8A\xD4\xC3\x17\x4A\x7E\xB3\x85\x41\x88\x39\x28\xA3\xFF\x5C\x86\xF4\x11\x92\xE6\x31\x14\xCB\x00\x24\xCD\x17\xFC\xA8\xF9\x18\xC5\x07\x32\xE2\x83\x90\xB2\x40\x21\x04\x2F\x44\x4A\xC8\x27\x42\x19\x44\x28\xBA\x03\x16\x8B\x14\xCA\x62\x94\x32\x4C\x21\x8C\x45\x02\x08\x17\xCC\x90\xDD\x95\x08\x85\xB2\x04\x09\x91\xF2\x76\x14\xF6\x88\x8E\x11\x0E\x21\xC6\xC4\x42\x8B\x53\x08\x4B\x91\xF0\xA9\xBC\x1D\x9F\x90\xE8\x96\xE4\xF8\x59\x72\x1F\x18\x6F\xED\x7F\x63\x52\xE3\x50\xDB\x65\x83\x44\xB2\x66\x82\xA9\x9B\x13\x49\x92\x29\xCB\x23\xB1\x05\xA6\xA6\xA5\xF3\xB4\x88\x40\x18\xA0\xB5\xE2\x73\x97\x95\x19\x6C\x86\xFE\x74\x77\xAA\x57\xDB\x7B\xE1\x96\x03\x69\x0F\x34\x61\xAB\x18\x7D\x7C\xC8\x94\xF9\xAB\x32\x91\xBA\x1A\x0B\x6E\x62\x8D\x30\xA8\x27\xB5\xB7\x8C\x61\xB6\x60\x0D\xAD\x19\xAC\xC5\xCA\x3A\x0D\x31\x80\xF3\x7A\x9C\xD0\x7B\x83\xBF\x4C\xB2\x5A\x42\x63\xFD\xD5\x05\xBE\x91\x85\xA2\x7C\x1B\xCD\xE5\x42\xD6\x26\xD9\xB9\x19\xF0\xCB\x10\xB0\x79\x4B\x76\x8E\xC2\x22\xB2\xD3\x72\xD3\x17\x6E\xCD\x9B\x98\xBF\x25\xEB\x8B\x02\xEC\xB2\x0D\xE5\x93\x47\x78\x92\x51\xF2\x9B\x54\xC8\x07\x61\xA1\xF6\x6D\x14\x8B\x9D\x52\x98\x10\xCF\xED\x45\x0C\x0F\x5E\x7D\xCB\x7A\x07\x0F\x48\x31\x03\xE2\xB7\x73\x17\xD3\x83\x57\xE7\x2A\xD9\xA5\x34\x3B\x1B\xA2\x25\x87\x18\x6A\x71\x0A\x65\x3E\x0C\x20\x11\x29\xC9\xCD\x85\x04\xA2\x06\xF5\x8A\xCB\x32\xD2\xE5\x78\xF0\x82\xEC\x56\xC7\x90\x41\xF6\xA0\xC6\xDE\xD2\xD5\x5C\x04\x4F\xC8\x3E\x3E\x90\xFD\xA8\x51\x76\x40\x89\x07\x2F\xC8\x41\x3E\x90\xED\xAA\x3D\x78\x41\x0E\xF1\x81\xA4\xF6\x11\x12\x0D\x3D\x63\xE2\x0E\x1F\x11\x89\xCA\x2B\x66\x0E\x25\x2A\xC3\x4B\x8D\xE3\x35\x0D\x29\x80\x9E\xB9\x85\x3A\x55\xD5\xC3\xFD\x80\xD5\x72\x62\x52\xA6\x78\x8D\x62\x42\x41\x43\x72\xFA\x08\x91\x48\x29\xCF\x2F\x01\x30\xA9\x39\x7A\x0C\x96\x75\xC7\xA9\x9F\xB5\x5C\xC8\x89\xBE\x42\xE0\x38\xB1\xFC\x2A\x2B\xD6\x41\x64\x63\x10\xB8\x96\x98\xBD\xA0\xC4\x67\x82\xA6\x21\x75\x6A\x8B\x5C\x0D\x41\x02\x82\xFF\x05\x48\x88\xDA\x45\x0E\x1A\x82\x0B\xD9\xF1\xC3\xAA\x4A\x0A\xEA\xF7\x35\xB8\x9E\x9C\x91\xDE\xB8\x67\xDE\xA9\xA6\xD3\x4B\x45\xFC\x20\x67\x1C\x78\x40\xB2\x55\x1C\xB4\xA1\x1B\x3F\x88\xFB\x59\x1E\x90\x34\x55\x57\x66\x95\x4A\x88\x39\xAA\x79\xF6\xE2\xC6\xB9\x28\x1E\x90\x74\x55\x10\x13\x55\x90\xCC\xF3\x28\x44\x82\x5B\x17\xD4\x2E\xA4\xF4\x06\x89\x56\x05\xB9\x38\x81\x09\x11\x5F\xCA\x6B\x6E\x19\xCD\xB0\x96\xC9\xDB\x66\x91\x49\x5F\xA7\x6C\xB8\xDC\xDC\xBA\xD1\x96\x03\x11\x5B\xB4\x5D\x71\x2F\x91\x48\x0E\xBB\xE6\x5F\x6D\xBD\x66\xDA\x14\xA3\x02\xD2\x6E\x44\x5C\x2F\x52\x40\x78\x59\x23\x82\x1C\xF5\x56\xD2\xDD\x95\x07\xB4\x4A\x45\xE1\x37\x04\x41\x94\x9A\xCC\xC5\x6A\xF3\xAC\xB8\x8E\xCA\xA8\x51\xA8\x51\x65\x46\x94\x5F\x18\xCB\x80\x18\xEE\x27\x6F\xE6\x9A\x50\xDD\xAC\x99\x24\xB3\x9D\xA9\x6E\xB1\x35\x29\xE9\x96\x0E\x35\x4A\xC3\x48\xF2\xB6\x2F\x5F\x48\xBD\x11\x7E\x8D\xD7\xC0\x86\xAF\x87\x94\xB8\x03\xEE\x32\x20\xF7\xE0\x3E\x12\x80\x32\xB8\x0D\x03\x7A\x41\xD4\x46\xBA\x05\xB4\x75\xC0\xF6\x49\xEC\x93\xDB\x1B\xA4\x74\x28\x6E\x49\xBF\x81\xAD\xFB\xC1\x44\x67\x3B\x58\xC4\x80\xA0\xC5\xAD\x2E\x00\x3A\xF1\xD6\x1F\xD5\xBD\x81\xA0\x1B\x3D\x09\x22\xB1\xCF\x83\x5E\x20\x7A\xB0\xA0\xDC\x71\xF9\xA1\x44\xD2\x4E\xB5\x2A\x3A\x08\xDD\x13\x78\x69\x4E\x06\x81\x67\x45\x3C\x02\x00\x4D\x3E\x1F\xD3\xD5\xCB\x6D\xB0\xAA\x12\x6E\xB5\xF8\x41\xF2\xA8\x1F\xDA\xF7\xE9\x84\x99\xCD\x54\x1E\x67\x36\xE4\x11\x74\x6D\x02\xE0\x09\xDC\x2E\xA1\xEB\xB0\x5B\x74\xD1\x97\x8D\x7D\xD2\x7A\x81\xC0\x4B\x7E\x4F\xD6\x05\xFC\x6B\x08\x22\x15\xB0\x21\xA7\x6A\x29\x73\x02\x20\xDC\x4C\xBF\xBA\xA6\x11\x54\x94\x0D\xAF\x5E\x5A\x74\x08\x98\x07\x41\x9D\x9E\x18\x5C\xED\x05\x72\x9A\xBA\x1B\x0D\x32\xC8\x64\x6A\x86\xE1\x2A\x91\x48\xEC\xA8\xBD\x79\x12\x13\x15\x1D\xB6\xA7\xE1\x07\xE4\x01\x65\x6F\x05\xB4\x7F\x1C\x35\x3B\xAA\xA3\x7D\xCD\xD9\xCF\xA9\xC1\xBC\x21\xF8\x51\xDF\xB0\xDC\x58\x05\x04\xCE\x5F\x02\x69\xDF\xA7\xEC\xFD\x37\x91\xA8\x53\x25\x09\xF8\x96\xDA\x7A\x76\x4B\x4A\x2C\xA0\x60\x20\xA9\x6B\xA3\x36\xCE\x25\x92\xEE\x0A\x3A\x10\xD7\x5D\x56\xA0\xDD\xAD\x47\x79\x8E\xF6\xC3\x05\xB2\x8C\x76\xEC\xDB\x10\x4B\x1B\xEC\xD5\x46\xB1\xDF\x21\xB1\x39\x46\x5A\x69\x33\x0D\x00\xC7\xB3\xC4\xF5\xE4\x6E\x00\xBE\xAF\x15\xE9\x06\xED\x05\xBE\xE7\xE3\x89\x1D\xCF\xDA\x70\x20\x5E\x7F\x84\x87\xF0\xC3\x5D\x65\x90\x68\xD8\x25\xCB\x1F\x5A\xB1\x4E\x1F\xDE\xF8\x83\xF4\x6F\x38\xF8\x88\xD5\x00\xA0\x3A\x28\x14\xF8\xA1\x5A\x74\x06\xB0\x46\xC3\x2B\x15\xFB\xE0\x15\x1D\x3C\xA9\x0A\xEB\xE8\x09\x11\xFF\x08\x7F\xCE\x1D\xF0\x3C\x36\x96\x05\x91\xCA\x7A\xD7\x63\xB8\x3F\x19\x80\xA9\x70\xFB\x02\x04\xA0\x9A\x7A\x3F\x3D\x4E\xE8\xDB\x86\xD7\xA6\x86\xE1\x46\x48\x53\x30\x17\x02\xCE\x58\xD2\x4D\x11\xFB\x4C\x64\x90\xC5\x70\x5F\x17\x3D\x5E\x64\x83\x31\x82\x1E\xF9\x3F\x61\x9F\x15\x28\x41\xB7\x2C\x3C\xFD\xA5\x94\x03\x01\x75\x03\xF1\x1B\xD6\x4C\x39\xA4\x0B\xEE\xF3\x01\xE0\x67\xB8\x7D\x05\xAE\xA0\xD5\xC2\x3C\x70\x0C\xF5\x44\x7A\x14\x87\xA3\x04\x97\xE5\xF3\xC3\xAA\x04\x2E\x04\x00\xFB\x89\xC5\x24\x19\xF6\x0B\x50\x6A\x05\x17\x29\x2B\x01\xE0\xD7\xAD\xD9\x39\xE9\xD4\xAD\x0B\x89\xC8\x79\x90\x6F\x08\x7C\x2F\x41\xDD\x10\xFB\xBC\xC2\x09\x2D\x9F\xCA\xBA\x1B\x28\x9E\xCB\x85\xF4\xD5\x3C\x9F\xD0\x19\x77\x25\x94\x66\xD2\x5A\x3E\x3D\x0D\xB4\xD6\x14\x64\x8D\x97\xFC\xEA\x54\x27\xD6\xD1\x53\x51\x7A\x79\xEF\x74\xB7\xFA\x58\xDE\xD6\xC8\x2C\x65\x8F\x5C\xC3\x07\x2F\xFB\x40\x30\xD5\xBD\x4F\xB9\xC5\x15\x15\x15\x85\x06\x7E\x55\xBF\xD9\xB1\x46\x06\x61\xD6\xB2\xCF\xB0\x30\x57\x3E\x6B\x1E\x11\xDB\x17\x6B\x4A\x7E\xFD\xFA\xC5\xA6\x91\x4A\x66\x8A\xDA\x9D\x71\xF1\x3D\xD5\xB7\xF6\x5F\x31\x6F\x17\x92\x24\x9D\x7C\x18\x8B\xFD\x2F\x49\x68\xBF\x2B\x84\x3F\xA0\x0B\x39\x5D\x6D\x55\xAE\xDE\x12\xD1\x77\x24\xF1\x33\x85\xF2\x02\xF5\xDD\xF9\x0A\xE1\x39\xEE\xCD\xA6\xC2\x21\xA5\x28\xC1\x6E\x6F\x85\x62\x83\x94\x14\x85\xA0\xBD\x0C\x29\xD1\x6A\x67\x31\xEA\x6C\x10\x8A\xF7\x65\x7E\xBA\x2C\x47\x52\x12\x43\xE9\x44\xAF\x2A\x4F\x37\x6E\x30\x4F\xBB\x8E\x0F\xD2\x91\xB9\x16\xD5\xF3\x73\xD3\x90\xE3\x48\xAA\x57\xB6\x78\xC3\xC3\x6E\xA0\x3B\x72\xC1\x92\xA9\x79\xA1\xA7\x5F\x0B\x53\x8A\xA9\x47\x14\x0F\x61\x90\x3F\x51\xF0\x24\x29\x53\xCB\x40\x65\xBC\x0B\xCB\xEF\x39\x02\xAF\x13\xF4\x57\x80\xB5\xE8\x44\x6C\xD9\x6B\x05\x45\x68\xDD\x32\x91\xA5\x69\x47\x40\xCD\xBE\x4B\x08\x64\x25\x0C\x3D\x57\xCB\x16\xF1\xB7\x5F\xCE\xA5\xE9\x40\xAF\x8C\x40\x21\x90\x32\x18\x39\x87\x23\x76\xA0\xF2\x6E\x27\x47\xFD\x8B\xBA\x60\x3A\xA1\x42\x20\xBA\x91\x56\x86\x4E\xDC\x85\x95\x1A\x34\xF1\xE6\x7C\x60\x26\x1C\xFE\x0E\x28\xBD\xA7\xB9\xBF\x67\x1C\x41\x25\xE3\x7A\x8D\xE5\x53\x6A\xD5\x7E\x10\xA2\xC1\x7F\x16\x28\x33\xFC\x47\x0C\xCB\xDE\x1D\xFB\x62\xBA\x70\x96\xE1\xAB\x76\xD1\x5B\x03\x56\x4C\x41\xA6\xF5\x33\x83\x88\x69\x4D\xBF\x93\xD1\xBB\x9B\xDC\xFE\x01\x51\x90\x30\x2B\x44\x5E\xBA\x6C\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82", vector(32, 27))

local function calc_dist(pos1, pos2)
    local lx = pos1.x
    local ly = pos1.y
    local lz = pos1.z
    local tx = pos2.x
    local ty = pos2.y
    local tz = pos2.z
    local dx = lx - tx
    local dy = ly - ty
    local dz = lz - tz
    return math.sqrt(dx * dx + dy * dy + dz * dz);
end

local hitted, reg_shot = 0, 0

local function render_indicators(text, colors, ind_dst, img)
    local ts = render.measure_text(calibri_bold, "bad", text)
    local x = 28
    local y = screen_y - 350
    
    if img then
        render.gradient(vector(5, y + 3 - ind_dst), vector(x + ((img.width) + (ts.x)) / 2 + 3, y + 37 - ind_dst), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50))
        render.gradient(vector(x + ((img.width) + (ts.x)) / 2 + 3, y + 3 - ind_dst), vector(x + (ts.x) + (img.width) + 29, y + 37 - ind_dst), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0))
        render.texture(img, vector(x, y + 6 - ind_dst), colors)
        render.text(calibri_bold, vector(x + (img.width) + 6, y + 10 - ind_dst), colors, "bad", text)
    else
        render.gradient(vector(5, y + 3 - ind_dst), vector(x + (ts.x) / 2, y + 37 - ind_dst), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50))
        render.gradient(vector(x + (ts.x) / 2, y + 3 - ind_dst), vector(x + (ts.x) + 23, y + 37 - ind_dst), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0))
        render.text(calibri_bold, vector(x, y + 4 - ind_dst + 5), colors, "bad", text)
    end
end

get_bind = function(name)
    local state = false
    local value = 0
    local binds = ui.get_binds()
    for i = 1, #binds do
        if binds[i].name == name and binds[i].active then
            state = true
            value = binds[i].value
        end
    end
    return {state, value}
end

events.render:set(function() 
    local watermark_color = menu.visuals.watermark_position.color:get()

    local r2, g2, b2, a2 = 55,55,55,255
    local highlight_fraction =  (globals.realtime / 2 % 1.2 * 2) - 1.2
    local output_screen = ""
    local output_sidebar = ""
    local text_to_draw = "L E T H A L"
    for idx = 1, #text_to_draw do
        local character = text_to_draw:sub(idx, idx)
        local character_fraction = idx / #text_to_draw
        local r1, g1, b1, a1 = watermark_color.r, watermark_color.g, watermark_color.b, 255
        local side_color_r, side_color_g, side_color_b, side_color_a = ui.get_style("Link Active").r, ui.get_style("Link Active").g, ui.get_style("Link Active").b, 255
        local highlight_delta = (character_fraction - highlight_fraction)
        if highlight_delta >= 0 and highlight_delta <= 1.4 then
            if highlight_delta > 0.7 then
                highlight_delta = 1.4 - highlight_delta
            end
            local r_fraction, g_fraction, b_fraction, a_fraction = r2 - r1, g2 - g1, b2 - b1
            local side_r_fraction, side_g_fraction, side_b_fraction, side_a_fraction = r2 - side_color_r, r2 - side_color_g, r2 - side_color_b
            r1 = r1 + r_fraction * highlight_delta / 0.8
            g1 = g1 + g_fraction * highlight_delta / 0.8
            b1 = b1 + b_fraction * highlight_delta / 0.8

            side_color_r = side_color_r + side_r_fraction * highlight_delta / 0.8
            side_color_g = side_color_g + side_g_fraction * highlight_delta / 0.8
            side_color_b = side_color_b + side_b_fraction * highlight_delta / 0.8
        end

        output_screen = output_screen .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, 255, text_to_draw:sub(idx, idx))
        output_sidebar = output_sidebar .. ('\a%02x%02x%02x%02x%s'):format(side_color_r, side_color_g, side_color_b, 255, text_to_draw:sub(idx, idx))
    end

    ui.sidebar(output_sidebar, "sparkles")

    local lp = entity.get_local_player()

    if lp and lp:is_alive() then
        if menu.visuals.watermark_position:get() == "right" then
            render.text(1, vector(screen_x - 70, screen_y / 2 - 20), color(255), nil, output_screen)
        elseif menu.visuals.watermark_position:get() == "left" then
            render.text(1, vector(10, screen_y / 2 - 20), color(255), nil, output_screen)
        elseif menu.visuals.watermark_position:get() == "bottom" then
            render.text(1, vector(screen_x / 2, screen_y - 10), color(255), "c", output_screen)
        end
    
        if menu.visuals.scope_overlay:get() then
            refs.scope_overlay:set("Remove All")
    
            local position = animations.new("position", lp.m_bIsScoped and menu.visuals.scope_overlay.scope_overlay_size:get() or 0, 10) 
            local offset = animations.new("offset", lp.m_bIsScoped and menu.visuals.scope_overlay.scope_overlay_gap:get() or 0, 10) 
    
            local scope_color_x = color(menu.visuals.scope_overlay.scope_overlay_color:get().r, menu.visuals.scope_overlay.scope_overlay_color:get().g, menu.visuals.scope_overlay.scope_overlay_color:get().b, menu.visuals.scope_overlay.scope_overlay_color:get().a)
            local scope_color_y = color(menu.visuals.scope_overlay.scope_overlay_color:get().r, menu.visuals.scope_overlay.scope_overlay_color:get().g, menu.visuals.scope_overlay.scope_overlay_color:get().b, 0)
            
            render.gradient(vector(screen_x / 2 - offset + 1, screen_y / 2), vector(screen_x / 2 - offset - position, screen_y / 2 + 1), scope_color_x, scope_color_y, scope_color_x, scope_color_y)
            render.gradient(vector(screen_x / 2 + offset, screen_y / 2), vector(screen_x / 2 + offset + position, screen_y / 2 + 1), scope_color_x, scope_color_y, scope_color_x, scope_color_y)
            render.gradient(vector(screen_x / 2, screen_y / 2 + offset), vector(screen_x / 2 + 1, screen_y / 2 + offset + position), scope_color_x, scope_color_x, scope_color_y, scope_color_y)
            render.gradient(vector(screen_x / 2, screen_y / 2 - offset), vector(screen_x / 2 + 1, screen_y / 2 - offset - position), scope_color_x, scope_color_x, scope_color_y, scope_color_y)
        else
            refs.scope_overlay:set("Remove Overlay")
        end

        if menu.visuals.gs_indicators:get() then
            local ind_dst = 0
            local ind_spr = 41

            local x = 28
            local y = screen_y - 350
        
            local percent = hitted > 0 and reg_shot > 0 and (hitted / reg_shot) * 100 or 0

            if refs.fake_latency:get() > 0 then
                render_indicators("PING", color(150, 189, 18, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            if refs.doubletap:get() then
                render_indicators("DT", rage.exploit:get() == 1 and color(215, 215, 215, 255) or color(255, 0, 0, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            elseif refs.hide_shots:get() and not refs.doubletap:get()  then
                render_indicators("OSAA", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
            
            if refs.freestanding:get() then
                render_indicators("FS", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            if refs.body_aim:get() == "Force" then
                render_indicators("BODY", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            if get_bind("Min. Damage")[1] then
                render_indicators("MD", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            if get_bind("Hit Chance")[1] then
                render_indicators("HITCHANCE OVR", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
                
            if refs.fake_duck:get() then
                render_indicators("DUCK", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            local dormant_work = #entity.get_players(true, false) ~= #entity.get_players(true, true)
            if refs.dormant_aimbot:get() then
                if dormant_work then
                    render_indicators("DA", color(215, 215, 215, 255), ind_dst)
                else
                    render_indicators("DA", color(255, 0, 0, 255), ind_dst)
                end
                ind_dst = ind_dst + ind_spr
            end
        
            if refs.safe_points:get() == "Force" then
                render_indicators("SAFE", color(215, 215, 215, 255), ind_dst)
                ind_dst = ind_dst + ind_spr
            end
        
            local c4 = entity.get_entities("CPlantedC4")[1];
            if c4 ~= nil then
                local time = ((c4.m_flC4Blow - globals.curtime) * 10) / 10
                local defused = c4.m_bBombDefused

                if math.floor(time) >= -1 and not defused then
                    local defusestart = c4.m_hBombDefuser ~= 4294967295
                    local defuselength = c4.m_flDefuseLength
                    local defusetimer = defusestart and math.floor((c4.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1

                    if defusetimer > 0 and not abort_defuse then
                        local col = math.floor(time) > defusetimer and color(58, 191, 54, 160) or color(252, 18, 19, 125)
                        local barlength = (((y - 50) / defuselength) * (defusetimer))
                        render.rect(vector(0, 0), vector(16, y), color(25, 25, 25, 160))
                        render.rect(vector(0, y - barlength), vector(16, y), col)
                    end

                    local bombsite = c4.m_nBombSite == 0 and "A" or "B"
                    local health = lp.m_iHealth
                    local armor = lp.m_ArmorValue
                    local will_die = false
                    local eLoc = c4.m_vecOrigin
                    local lLoc = lp.m_vecOrigin
                    local distance = calc_dist(eLoc, lLoc)
                    local a = 450.7
                    local b = 75.68
                    local c = 789.2
                    local d = (distance - b) / c;
                    local damage = a * math.exp(-d * d)

                    if armor > 0 then
                        local newDmg = damage * 0.5;
                        local armorDmg = (damage - newDmg) * 0.5
                        if armorDmg > armor then
                            armor = armor * (1 / .5)
                            newDmg = damage - armorDmg
                        end
                        damage = newDmg;
                    end

                    local dmg = math.ceil(damage)

                    if dmg >= health then
                        will_die = true
                    else
                        will_die = false
                    end

                    if time > 0.01 then
                        render_indicators(bombsite .. " - " .. string.format("%.1f", time >= 0 and time or 0) .. "s", color(215, 215, 215, 255), ind_dst, bomb_img)
                        ind_dst = ind_dst + ind_spr
    
                        if will_die then
                            render_indicators("FATAL", color(255, 0, 0, 255), ind_dst)
                            ind_dst = ind_dst + ind_spr
                        elseif damage > 0.5 then
                            render_indicators("-" .. dmg .. " HP", color(255, 240, 100, 255), ind_dst)
                            ind_dst = ind_dst + ind_spr
                        end
                    end
                end
            end
    
            if bomb.state == false then
                render_indicators(bomb.site, color(255, 240, 100, 255), ind_dst, bomb_img)
                ts = render.measure_text(calibri, "bad", bomb.site) + vector(20, 0)
                    render.circle_outline(vector(x + ts.x + 32, y + ts.y/2 - ind_dst + 9), color(0, 0, 0, 255), 9.5, 0, 1, 4)
                    render.circle_outline(vector(x + ts.x + 32, y + ts.y/2 - ind_dst + 9), color(255, 255, 255, 255), 9, 0, bomb.plant_percentage, 3)
                ind_dst = ind_dst + ind_spr
            end
        end

        if menu.visuals.manual_arrows:get() then
            if menu.anti_aim.manual_yaw:get() ~= "disabled" and menu.anti_aim.manual_yaw:get() ~= "front" then
                render.text(verdana, vector(screen_x / 2 - 47, screen_y / 2), menu.anti_aim.manual_yaw:get() == "left" and color(menu.visuals.manual_arrows.manual_arrows_color:get().r, menu.visuals.manual_arrows.manual_arrows_color:get().g, menu.visuals.manual_arrows.manual_arrows_color:get().b, 255) or color(100, 100, 100, 255), "c", "❰" )
                render.text(verdana, vector(screen_x / 2 + 43, screen_y / 2), menu.anti_aim.manual_yaw:get() == "right" and color(menu.visuals.manual_arrows.manual_arrows_color:get().r, menu.visuals.manual_arrows.manual_arrows_color:get().g, menu.visuals.manual_arrows.manual_arrows_color:get().b, 255) or color(100, 100, 100, 255), "c", "❱")
            end
        end

        if menu.visuals.damage_indicator:get() then
            render.text(1, vector(screen_x / 2 + 3, screen_y / 2 - 15), color(255), nil, refs.minimum_damage:get())
        end
    end

    if menu.misc.aspect_ratio:get() then
        local aspect_ratio_value = animations.new("aspect_ratio_value", menu.misc.aspect_ratio.amount:get() / 100, 5)
        cvar.r_aspectratio:float(aspect_ratio_value)
    else
        cvar.r_aspectratio:float(0)
    end

    if menu.misc.viewmodel:get() then
        local viewmodel_fov_value = animations.new("viewmodel_fov_value", menu.misc.viewmodel:get() and menu.misc.viewmodel.viewmodel_fov:get() / 10 or get_original(cvar.viewmodel_fov), 5)
        local viewmodel_x_value = animations.new("viewmodel_x_value", menu.misc.viewmodel:get() and menu.misc.viewmodel.viewmodel_x:get() / 10 or get_original(cvar.viewmodel_offset_x), 5)
        local viewmodel_y_value = animations.new("viewmodel_y_value", menu.misc.viewmodel:get() and menu.misc.viewmodel.viewmodel_y:get() / 10 or get_original(cvar.viewmodel_offset_y), 5)
        local viewmodel_z_value = animations.new("viewmodel_z_value", menu.misc.viewmodel:get() and menu.misc.viewmodel.viewmodel_z:get() / 10 or get_original(cvar.viewmodel_offset_z), 5)

        cvar.viewmodel_fov:float(viewmodel_fov_value, true)
        cvar.viewmodel_offset_x:float(viewmodel_x_value, true)
        cvar.viewmodel_offset_y:float(viewmodel_y_value, true)
        cvar.viewmodel_offset_z:float(viewmodel_z_value, true)
    else
        cvar.viewmodel_fov:float(get_original(cvar.viewmodel_fov), true)
        cvar.viewmodel_offset_x:float(get_original(cvar.viewmodel_offset_x), true)
        cvar.viewmodel_offset_y:float(get_original(cvar.viewmodel_offset_y), true)
        cvar.viewmodel_offset_z:float(get_original(cvar.viewmodel_offset_z), true)
    end
end) 

events.aim_ack:set(function(e)
    local lp = entity.get_local_player()
    if lp == nil or not lp:is_alive() then return end

    local id = e.id
    local target = entity.get(e.target)
    local damage = e.damage
    local wanted_damage = e.wanted_damage
    local hitgroup = hitgroup_str[e.hitgroup]
    local wanted_hitgroup = hitgroup_str[e.wanted_hitgroup]
    local hitchance = e.hitchance
    local state = e.state
    local bt = e.backtrack
    if not target then return end
    if target == nil then return end

    if menu.visuals.aimbot_logs:get() then
        refs.filters:set("Console")

        if state == nil then
            print_dev("[\aADE02BE9Lethal\aDEFAULT] Registered \aADE02BE9".. target:get_name() .."\aDEFAULT's \aADE02BE9".. hitgroup .."\aDEFAULT for \aADE02BE9".. damage .."(".. wanted_damage ..")\aDEFAULT")
            print_raw("[\aADE02BE9Lethal\aDEFAULT] Registered \aADE02BE9".. target:get_name() .."\aDEFAULT's \aADE02BE9".. hitgroup .."\aDEFAULT for \aADE02BE9".. damage .."(".. wanted_damage ..")\aDEFAULT aimed=\aADE02BE9".. wanted_hitgroup .."\aDEFAULT(".. hitchance .."%) (\aADE02BE9".. bt .."\aDEFAULT bt)")
        else
            print_dev("[\aD96767FFLethal\aDEFAULT] Missed shot due to \aD96767FF".. state .."\aDEFAULT in \aD96767FF".. target:get_name() .."\aDEFAULT's "  )
            print_raw("[\aD96767FFLethal\aDEFAULT] Missed shot due to \aD96767FF".. state .."\aDEFAULT in \aD96767FF".. target:get_name() .."\aDEFAULT's ".. wanted_hitgroup .." (\aD96767FF".. bt .."\aDEFAULT bt)")
        end
    else
        refs.filters:set("")
    end
end)

events.post_update_clientside_animation:set(function()
    if not menu.misc.animations:get() then return end
    local lp = entity.get_local_player()
    if lp == nil or not lp:is_alive() then return end
    if lp:get_index() == nil then return end

    animslsg = get_entity_address(lp:get_index())

    local animstate = lp:get_anim_state()
    if animstate == nil then return end

    move = math.sqrt(lp.m_vecVelocity.x ^ 2 + lp.m_vecVelocity.y ^ 2) > 5
    jump = bit.band(lp.m_fFlags, 1) == 0

    if menu.misc.animations.animations_select:get(1) and move then
        ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = 1
    end

    if menu.misc.animations.animations_select:get(2) then
        lp.m_flPoseParameter[6] = 1
    end

    if menu.misc.animations.animations_select:get(3) then
        refs.legs_movement:set("Sliding")
        lp.m_flPoseParameter[0] = utils.random_float(0.1, 1.0)
    else
        refs.legs_movement:set("Walking")
    end

    if menu.misc.animations.animations_select:get(4) and move then
        lp.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and utils.random_float(0.1, 1.0) or 0
    end

    if menu.misc.animations.animations_select:get(5) then
        ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = utils.random_float(0.1, 1)
    end
end)

local config = pui.setup({menu, menu.anti_aim.builder}, true)
local configsystem = { }
configdata = db.Lethal_config_database or { }
configdata.cfg_list = configdata.cfg_list or {{"default", "W3siYW50aV9haW0iOnsiYnVpbGRlciI6W3siYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjAuMCwiYm9keV9yaWdodF9hbXQiOjAuMCwiZW5hYmxlX3N0YXRlIjpmYWxzZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOjAuMCwieWF3X21vZGUiOiJzdGF0aWMiLCJ5YXdfcmlnaHRfYW10IjowLjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6LTMxLjAsInlhd19sZWZ0X2FtdCI6LTEzLjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6MjMuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjEuMH19LHsiYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjYwLjAsImJvZHlfcmlnaHRfYW10Ijo2MC4wLCJlbmFibGVfc3RhdGUiOnRydWUsInlhd19hbXQiOjAuMCwieWF3X2ppdHRlciI6ImNlbnRlciIsInlhd19qaXR0ZXJfYW10IjotMzMuMCwieWF3X2xlZnRfYW10IjotMjMuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjoxOC4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiY2VudGVyIiwieWF3X2ppdHRlcl9hbXQiOi0yMS4wLCJ5YXdfbGVmdF9hbXQiOjYuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjotMy4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6MjUuMCwieWF3X2xlZnRfYW10IjotMTAuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjozNi4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYW10IjowLjAsInlhd19sZWZ0X2FtdCI6LTM2LjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6NTAuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjIuMH19XSwiY29uZGl0aW9ucyI6Im1vdmluZyIsImZyZWVzdGFuZGluZyI6ZmFsc2UsIm1hbnVhbF95YXciOiJkaXNhYmxlZCIsInNhZmVfaGVhZCI6WyJhaXIgY3JvdWNoIGtuaWZlIiwifiJdLCJ0d2Vha3MiOlsiYXZvaWQgYmFja3N0YWIiLCJ+Il0sIn5mcmVlc3RhbmRpbmciOnsiZnJlZXN0YW5kaW5nX3N0YXRpYyI6dHJ1ZX0sIn5tYW51YWxfeWF3Ijp7Im1hbnVhbF9vdmVyX2ZzIjpmYWxzZSwibWFudWFsX3lhd19zdGF0aWMiOmZhbHNlfX0sIm1pc2MiOnsiYW5pbWF0aW9ucyI6dHJ1ZSwiYXNwZWN0X3JhdGlvIjp0cnVlLCJjbGFudGFnIjpmYWxzZSwiZmFzdF9sYWRkZXIiOnRydWUsIm5hZGVfdGhyb3dfZml4IjpmYWxzZSwidmlld21vZGVsIjp0cnVlLCJ+YW5pbWF0aW9ucyI6eyJhbmltYXRpb25zX3NlbGVjdCI6WzEuMCwyLjAsMy4wLCJ+Il19LCJ+YXNwZWN0X3JhdGlvIjp7ImFtb3VudCI6MTMwLjB9LCJ+dmlld21vZGVsIjp7InZpZXdtb2RlbF9mb3YiOjY2MC4wLCJ2aWV3bW9kZWxfeCI6MjAuMCwidmlld21vZGVsX3kiOi0zMC4wLCJ2aWV3bW9kZWxfeiI6NDAuMH19LCJzZWxlY3RfdGFiIjoiY29uZmlncyIsInZpc3VhbHMiOnsiKndhdGVybWFya19wb3NpdGlvbiI6IiM3RDk5RDhGRiIsImFpbWJvdF9sb2dzIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yIjp0cnVlLCJnc19pbmRpY2F0b3JzIjp0cnVlLCJtYW51YWxfYXJyb3dzIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwid2F0ZXJtYXJrX3Bvc2l0aW9uIjoibGVmdCIsIn5tYW51YWxfYXJyb3dzIjp7Im1hbnVhbF9hcnJvd3NfY29sb3IiOiIjRkZGRkZGRkYifSwifnNjb3BlX292ZXJsYXkiOnsic2NvcGVfb3ZlcmxheV9jb2xvciI6IiM1QTVBNUFGRiIsInNjb3BlX292ZXJsYXlfZ2FwIjo1LjAsInNjb3BlX292ZXJsYXlfc2l6ZSI6MTUwLjB9fX0sW3siYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjAuMCwiYm9keV9yaWdodF9hbXQiOjAuMCwiZW5hYmxlX3N0YXRlIjpmYWxzZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOjAuMCwieWF3X21vZGUiOiJzdGF0aWMiLCJ5YXdfcmlnaHRfYW10IjowLjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6LTMxLjAsInlhd19sZWZ0X2FtdCI6LTEzLjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6MjMuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjEuMH19LHsiYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjYwLjAsImJvZHlfcmlnaHRfYW10Ijo2MC4wLCJlbmFibGVfc3RhdGUiOnRydWUsInlhd19hbXQiOjAuMCwieWF3X2ppdHRlciI6ImNlbnRlciIsInlhd19qaXR0ZXJfYW10IjotMzMuMCwieWF3X2xlZnRfYW10IjotMjMuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjoxOC4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiY2VudGVyIiwieWF3X2ppdHRlcl9hbXQiOi0yMS4wLCJ5YXdfbGVmdF9hbXQiOjYuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjotMy4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6MjUuMCwieWF3X2xlZnRfYW10IjotMTAuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjozNi4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYW10IjowLjAsInlhd19sZWZ0X2FtdCI6LTM2LjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6NTAuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjIuMH19XV0="}}
configdata.menu_list = configdata.menu_list or {"default"}

configdata.cfg_list[1][2] = "W3siYW50aV9haW0iOnsiYnVpbGRlciI6W3siYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjAuMCwiYm9keV9yaWdodF9hbXQiOjAuMCwiZW5hYmxlX3N0YXRlIjpmYWxzZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOjAuMCwieWF3X21vZGUiOiJzdGF0aWMiLCJ5YXdfcmlnaHRfYW10IjowLjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6LTMxLjAsInlhd19sZWZ0X2FtdCI6LTEzLjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6MjMuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjEuMH19LHsiYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjYwLjAsImJvZHlfcmlnaHRfYW10Ijo2MC4wLCJlbmFibGVfc3RhdGUiOnRydWUsInlhd19hbXQiOjAuMCwieWF3X2ppdHRlciI6ImNlbnRlciIsInlhd19qaXR0ZXJfYW10IjotMzMuMCwieWF3X2xlZnRfYW10IjotMjMuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjoxOC4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiY2VudGVyIiwieWF3X2ppdHRlcl9hbXQiOi0yMS4wLCJ5YXdfbGVmdF9hbXQiOjYuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjotMy4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6MjUuMCwieWF3X2xlZnRfYW10IjotMTAuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjozNi4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYW10IjowLjAsInlhd19sZWZ0X2FtdCI6LTM2LjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6NTAuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjIuMH19XSwiY29uZGl0aW9ucyI6Im1vdmluZyIsImZyZWVzdGFuZGluZyI6ZmFsc2UsIm1hbnVhbF95YXciOiJkaXNhYmxlZCIsInNhZmVfaGVhZCI6WyJhaXIgY3JvdWNoIGtuaWZlIiwifiJdLCJ0d2Vha3MiOlsiYXZvaWQgYmFja3N0YWIiLCJ+Il0sIn5mcmVlc3RhbmRpbmciOnsiZnJlZXN0YW5kaW5nX3N0YXRpYyI6dHJ1ZX0sIn5tYW51YWxfeWF3Ijp7Im1hbnVhbF9vdmVyX2ZzIjpmYWxzZSwibWFudWFsX3lhd19zdGF0aWMiOmZhbHNlfX0sIm1pc2MiOnsiYW5pbWF0aW9ucyI6dHJ1ZSwiYXNwZWN0X3JhdGlvIjp0cnVlLCJjbGFudGFnIjpmYWxzZSwiZmFzdF9sYWRkZXIiOnRydWUsIm5hZGVfdGhyb3dfZml4IjpmYWxzZSwidmlld21vZGVsIjp0cnVlLCJ+YW5pbWF0aW9ucyI6eyJhbmltYXRpb25zX3NlbGVjdCI6WzEuMCwyLjAsMy4wLCJ+Il19LCJ+YXNwZWN0X3JhdGlvIjp7ImFtb3VudCI6MTMwLjB9LCJ+dmlld21vZGVsIjp7InZpZXdtb2RlbF9mb3YiOjY2MC4wLCJ2aWV3bW9kZWxfeCI6MjAuMCwidmlld21vZGVsX3kiOi0zMC4wLCJ2aWV3bW9kZWxfeiI6NDAuMH19LCJzZWxlY3RfdGFiIjoiY29uZmlncyIsInZpc3VhbHMiOnsiKndhdGVybWFya19wb3NpdGlvbiI6IiM3RDk5RDhGRiIsImFpbWJvdF9sb2dzIjp0cnVlLCJkYW1hZ2VfaW5kaWNhdG9yIjp0cnVlLCJnc19pbmRpY2F0b3JzIjp0cnVlLCJtYW51YWxfYXJyb3dzIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwid2F0ZXJtYXJrX3Bvc2l0aW9uIjoibGVmdCIsIn5tYW51YWxfYXJyb3dzIjp7Im1hbnVhbF9hcnJvd3NfY29sb3IiOiIjRkZGRkZGRkYifSwifnNjb3BlX292ZXJsYXkiOnsic2NvcGVfb3ZlcmxheV9jb2xvciI6IiM1QTVBNUFGRiIsInNjb3BlX292ZXJsYXlfZ2FwIjo1LjAsInNjb3BlX292ZXJsYXlfc2l6ZSI6MTUwLjB9fX0sW3siYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjAuMCwiYm9keV9yaWdodF9hbXQiOjAuMCwiZW5hYmxlX3N0YXRlIjpmYWxzZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOjAuMCwieWF3X21vZGUiOiJzdGF0aWMiLCJ5YXdfcmlnaHRfYW10IjowLjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6LTMxLjAsInlhd19sZWZ0X2FtdCI6LTEzLjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6MjMuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjEuMH19LHsiYm9keV9qaXR0ZXIiOnRydWUsImJvZHlfbGVmdF9hbXQiOjYwLjAsImJvZHlfcmlnaHRfYW10Ijo2MC4wLCJlbmFibGVfc3RhdGUiOnRydWUsInlhd19hbXQiOjAuMCwieWF3X2ppdHRlciI6ImNlbnRlciIsInlhd19qaXR0ZXJfYW10IjotMzMuMCwieWF3X2xlZnRfYW10IjotMjMuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjoxOC4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiY2VudGVyIiwieWF3X2ppdHRlcl9hbXQiOi0yMS4wLCJ5YXdfbGVmdF9hbXQiOjYuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjotMy4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJjZW50ZXIiLCJ5YXdfaml0dGVyX2FtdCI6MjUuMCwieWF3X2xlZnRfYW10IjotMTAuMCwieWF3X21vZGUiOiJzd2l0Y2giLCJ5YXdfcmlnaHRfYW10IjozNi4wLCJ+Ym9keV9qaXR0ZXIiOnsiYm9keV9kZWxheSI6MS4wfX0seyJib2R5X2ppdHRlciI6dHJ1ZSwiYm9keV9sZWZ0X2FtdCI6NjAuMCwiYm9keV9yaWdodF9hbXQiOjYwLjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwieWF3X2FtdCI6MC4wLCJ5YXdfaml0dGVyIjoiZGlzYWJsZWQiLCJ5YXdfaml0dGVyX2FtdCI6MC4wLCJ5YXdfbGVmdF9hbXQiOi0yNS4wLCJ5YXdfbW9kZSI6InN3aXRjaCIsInlhd19yaWdodF9hbXQiOjI4LjAsIn5ib2R5X2ppdHRlciI6eyJib2R5X2RlbGF5IjoxLjB9fSx7ImJvZHlfaml0dGVyIjp0cnVlLCJib2R5X2xlZnRfYW10Ijo2MC4wLCJib2R5X3JpZ2h0X2FtdCI6NjAuMCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJ5YXdfYW10IjowLjAsInlhd19qaXR0ZXIiOiJkaXNhYmxlZCIsInlhd19qaXR0ZXJfYW10IjowLjAsInlhd19sZWZ0X2FtdCI6LTM2LjAsInlhd19tb2RlIjoic3dpdGNoIiwieWF3X3JpZ2h0X2FtdCI6NTAuMCwifmJvZHlfaml0dGVyIjp7ImJvZHlfZGVsYXkiOjIuMH19XV0="
configsystem.save_config = function(id)
    if id == 1 then return end
    local raw = config:save()
    configdata.cfg_list[id][2] = base64.encode(json.stringify(raw))
    cvar.play:call("ambient\\tones\\elev1")
    db.Lethal_config_database = configdata
end

configsystem.update_values = function(id)
    local name = configdata.cfg_list[id][1]
    local new_name = "\a{Link Active}loaded ~\aDEFAULT " .. name
    for k, v in ipairs(configdata.cfg_list) do
        configdata.menu_list[k] = v[1]
    end
    configdata.menu_list[id] = new_name
end

configsystem.create_config = function(name)
    if type(name) ~= 'string' then return end
    if name == nil or name == '' or name == ' ' then return end
    for i=#configdata.menu_list, 1, -1 do if configdata.menu_list[i] == name then common.add_notify('\vInvincible', 'Config with this name has already been created') return end end
    if #configdata.cfg_list > 6 then common.add_notify('\vInvincible', 'Too much configs') return end
    local completed = {name, ''}
    table.insert(configdata.cfg_list, completed)
    table.insert(configdata.menu_list, name)
    db.Lethal_config_database = configdata
end

configsystem.remove_config = function(id)
    if id == 1 then return end
    local item = configdata.cfg_list[id][1]
    for i=#configdata.cfg_list, 1, -1 do if configdata.cfg_list[i][1] == item then table.remove(configdata.cfg_list, i) table.remove(configdata.menu_list, i) end end
    db.Lethal_config_database = configdata
end

configsystem.load_config = function(id)
    if configdata.cfg_list[id][2] == nil or configdata.cfg_list[id][2] == '' then print("Error[data_base[".. id .."]]") return end
    if id > #configdata.cfg_list then print("Error[data_base[".. id .."]]") return end
    config:load(json.parse(base64.decode(configdata.cfg_list[id][2])))
    cvar.play:call("ambient\\tones\\elev1")
end

configs = {
    label4 = tabs.configs:label("                               \v\f<share-nodes> Configs"):depend( { menu.select_tab, "configs" } ),
    cfg_selector = tabs.configs:list('', configdata.menu_list):depend( { menu.select_tab, "configs" } ),
    name = tabs.configs:input("\v\f<bars-sort>\r  config name"):depend( { menu.select_tab, "configs" } ),
    
    create = tabs.configs:button(" \aA3A6DBFF\f<wand-magic-sparkles> ", function()
        configsystem.create_config(configs.name:get())
        configs.cfg_selector:update(configdata.menu_list)
    end, true):depend( { menu.select_tab, "configs" } ),
    
    remove  = tabs.configs:button(" \aA86464FF\f<trash-can-xmark> ", function()
        configsystem.remove_config(configs.cfg_selector:get())
        configs.cfg_selector:update(configdata.menu_list)
    end, true):depend( { menu.select_tab, "configs" } ),

    import = tabs.configs:button(" \vimport ", function()
        config:load(json.parse(base64.decode(clipboard.get())))
        cvar.play:call("ambient\\tones\\elev1")
    end, true):depend( { menu.select_tab, "configs" } ),

    export = tabs.configs:button(" \vexport ", function()
        clipboard.set(base64.encode(json.stringify(config:save())))
        cvar.play:call("ambient\\tones\\elev1")
    end, true):depend( { menu.select_tab, "configs" } ),
    
    save = tabs.configs:button(" \a90E190FF\f<download> ", function()
        configsystem.save_config(configs.cfg_selector:get())
    end, true):depend( { menu.select_tab, "configs" } ),

    load = tabs.configs:button(" \aA3A6DBFF\f<upload> ", function()
        configsystem.update_values(configs.cfg_selector:get())
        configsystem.load_config(configs.cfg_selector:get())
        configs.cfg_selector:update(configdata.menu_list)
    end, true):depend( { menu.select_tab, "configs" } ),
}

configs.load:tooltip("load config")
configs.save:tooltip("save config")
configs.remove:tooltip("remove config")
configs.create:tooltip("create config")
configs.import:tooltip("import config from clipboard")
configs.export:tooltip("export config to clipboard")

events.shutdown:set(function()
    cvar.viewmodel_fov:float(get_original(cvar.viewmodel_fov), true)
    cvar.viewmodel_offset_x:float(get_original(cvar.viewmodel_offset_x), true)
    cvar.viewmodel_offset_y:float(get_original(cvar.viewmodel_offset_y), true)
    cvar.viewmodel_offset_z:float(get_original(cvar.viewmodel_offset_z), true)

    common.set_clan_tag("\0")
end)