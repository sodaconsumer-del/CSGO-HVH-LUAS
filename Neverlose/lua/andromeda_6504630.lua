local libs = {}
local tabs = {}
local menu = {}
local aa_builder_main = {}
local aa_builder_main = {}
local font = {
    verdana_bold = render.load_font("Verdana Bold", 22, "ab"),
    verdana_bold2 = render.load_font("Verdana Bold", 18, "ab"),
    verdana_bold3 = render.load_font("Verdana Bold", 17, "ab"),
    verdana = render.load_font("Verdana", 20, "ab"),
    verdana_ind = render.load_font("Verdana", 11, "ab"),
    verdana_arrows = render.load_font("Verdana", 25, "ab"),

}
local localplayer = entity.get_local_player()
local screen_size = render.screen_size()

local lerpik = function(start, vend, time)
    return start+(vend-start) * time * globals.frametime
end

libs = {
    pui = require("neverlose/pui"),
    clipboard = require("neverlose/clipboard"),
    aa_library = require("neverlose/anti_aim"),
    gradient = require("neverlose/gradient"),
    animations = require("neverlose/animations"),
}

ui.sidebar("andromeda", "user")

aa_refs = {
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
    modifier_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
    freestanding_body = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
    yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
    body_fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
    inv = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
}

refs = {
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    isDuck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(),
    isSafe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):get() == 'Force',
    isBody = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):get() == 'Force',
    isPeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
    findik = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
    findhs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
    legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
    sloww = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    clantag = ui.find('Miscellaneous', 'Main', 'In-Game', 'Clan Tag'),
    fakelaglim = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
    fov = ui.find("Visuals", "World", "Main", "Field of View"),
}
find = {
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
}

tabs = {
    anti_aim = libs.pui.create("", {
        {"tab_switch", "\n", 1},
        {"condition", "\n\n\n", 1},
        {"builder", "\n\n\n\n", 2},
        {"exploits", "\n\n\n\n\n", 2},
        {"addons", "\n\n\n\n\n\n", 2},
        {"visuals", "\n\n\n\n\n\n\n\n", 2},
        {"visuals2", "\n\n\n\n\n\n\n\n\n", 1},
        {"info", "\n\n\n\n\n\n\n\n\n\n", 1},
        {"info2", "\n\n\n\n\n\n\n\n\n\n\n", 2},
        {"link", "\n\n\n\n\n\n\n\n\n\n\n\n", 2},
        {"config", "\n\n\n\n\n\n\n\n\n\n\n\n\n", 1},
    }),
}

local tag_anim = {
    " ",
    "a ",
    "an ",
    "and ",
    "andr ",
    "andro ",
    "androm ",
    "androme ",
    "andromed ",
    "andromeda. ",
    "andromeda.n ",
    "andromeda.nl ",
    "andromeda.nl ",
    "andromeda.nl ",
    "andromeda.n ",
    "andromeda. ",
    "andromeda ",
    "andromed ",
    "androme ",
    "androm ",
    "andro ",
    "andr ",
    "and ",
    "an ",
    "a ",
    " "
}

menu = {
    anti_aim = {
        info = {
            welcome_username = tabs.anti_aim.info2:label("»  User: \v"..common.get_username()..""),
            welcome_build = tabs.anti_aim.info2:label("»  Build: \vRelease"),
            welcome_update = tabs.anti_aim.info2:label("»  Last Update: \v27.08.2024                                                    "),
            link_discord = tabs.anti_aim.info2:button("\f<discord>   Discord ", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/Zax3FuQTfu")
            end, true),
            link_youtube = tabs.anti_aim.info2:button("\f<youtube>   Youtube ", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@Iron_hvh")
            end, true),
            link_config = tabs.anti_aim.info2:button("\f<gear>   Config ", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=AeHQNA")
            end, true),
        },
        tab_switch = {
            tab_switcher = tabs.anti_aim.tab_switch:list('', {"\v\f<house>\r   Info", "\v\f<user-pen>\r  Anti-Aim", "\v\f<pen-to-square>\r   Visuals"}),
        },  
        condition = {
            conditions = tabs.anti_aim.condition:combo("\v\f<bars-sort>\r    Conditions", {"Standing", "Moving", "Air", "Air Crouching", "Crouching", "Crouching Moving", "Slow-Walking"})
        },
        addons = {
            manual_yaw_base = tabs.anti_aim.addons:combo("\v\f<arrow-right-arrow-left>\r   Manual ", {"Disabled", "Left", "Right", "Forward"}),
            freestanding = tabs.anti_aim.addons:switch("\v\f<person-walking-arrow-loop-left>\r  Freestanding", false, nil, function(gear)
                return {
                    freestanding_yaw_modifier = gear:switch("\v\f<toggle-off>\r   Disable Yaw Modifiers", false),
                    freestanding_body_freestanding = gear:switch("\v\f<toggle-on>\r   Body Freestanding", false),
                }
            end),
        },
        visuals = {
            ts = tabs.anti_aim.visuals:switch("\v\f<repeat>\r   Arrows", false, nil, function(gear) 
                return {
                    ts_type = gear:combo("Type", "Adaptive", "Legacy", "TeamSkeet", "TeamSkeet Velocity"),
                    accent_color = gear:color_picker("Color", color(138, 207, 255, 255)),
                    ts_cl1 = gear:color_picker("Accent Color", color(175, 255, 0, 255)),
                    ts_cl2 = gear:color_picker("Desync Color", color(0, 200, 255, 255)),
                }
            end),
            customscope = tabs.anti_aim.visuals:switch("\v\f<telescope>\r  Scope", false, nil, function(gear) 
                return {
                    scopetype = gear:combo("Type", "Custom", "Reversed"),
                    scopeGap = gear:slider("Gap", 0, 300, 5),
                    scopeLength = gear:slider("Length", 0, 300, 120),
                    scopeColor = gear:color_picker(" Color", color(255, 255, 255, 134)),
                }
            end),
            legs_jitter = tabs.anti_aim.visuals:switch('\v\f<street-view>\r   Anim Breaker', false, nil, function(gear)
                return {
                    jitter_combo = gear:combo("\v\f<person-running>\r   Ground", "Disabled", "Flex", "Static", "Walking", "Fast Jitter", "Slow Jitter"),
                    slider_jitter = gear:slider("\v\f<pen-nib>\r   Slider", 0, 100, 80),
                    air_combo = gear:combo("\v\f<child-dress>\r    Air", "Disabled", "Static", "Kangaroo", "Walking"),
                    walk_combo = gear:combo("\v\f<person-walking-with-cane>\r  Slow Walking", "Disabled", "Static", "Jitter", "Pirat"),
                    other_combo = gear:selectable("\v\f<gear>\r  Other Animation", "Earthquake", "Move Lean"),
                }
            end),
            gs_ind = tabs.anti_aim.visuals:switch("\v\f<paintbrush-fine>\r  Andromeda Indicators", false, nil, function(gear) 
                return {
                    indicator_list2 = gear:selectable("List", {"DT", "HS", "MD", "HC", "FD", "BODY", "SAFE", "DA", "PING", "PEEK"}),
                }
            end),
            clantag52 = tabs.anti_aim.visuals:switch("\v\f<user-tag>\r  Clantag"),
            animate_zoom = tabs.anti_aim.visuals:switch("\v\f<magnifying-glass>\r   Animate Zoom"),
        },
        visuals2 = {
            viewmodel = tabs.anti_aim.visuals2:switch("\v\f<hand-middle-finger>\r    Viewmodel", false, nil, function(gear) 
                return {
                    viewmodel_fov = gear:slider("FOV", -100, 100, 68),
                    viewmodel_x = gear:slider("X", -10, 10, 2.5),
                    viewmodel_y = gear:slider("Y", -10, 10, 0),
                    viewmodel_z = gear:slider("Z", -10, 10, -1.5),
                }
            end),
            aspect_ratio = tabs.anti_aim.visuals2:switch("\v\f<person-rays>\r   Aspect Ratio", false, nil, function(gear) 
                return {
                    aspect_ratio_value = gear:slider("Value", 0, 20, 0, 0.1),
                }
            end),
            aimlogs = tabs.anti_aim.visuals2:switch("\v\f<gears>\r  Aimbot Logs"),
        },
    },
}

for i = 1, 7 do 
    aa_builder_main[i] = {
        -- YAW
        yaw = tabs.anti_aim.condition:combo("\v\f<arrow-up-right-and-arrow-down-left-from-center>\r   Yaw", {"Default", "Left & Right", "Random", "Delay", "3-Way Delay", "5-Way Delay"}),
        yaw_offset = tabs.anti_aim.condition:slider("\v\f<left-right>\r   Offset", -180, 180, 0),
        yaw_offset_left = tabs.anti_aim.condition:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        yaw_offset_right = tabs.anti_aim.condition:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        yaw_random_left = tabs.anti_aim.condition:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        yaw_random_right = tabs.anti_aim.condition:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        yaw_delay_left = tabs.anti_aim.condition:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        yaw_delay_right = tabs.anti_aim.condition:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        yaw_delay3_left = tabs.anti_aim.condition:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        yaw_delay3_right = tabs.anti_aim.condition:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        yaw_delay5_left = tabs.anti_aim.condition:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        yaw_delay5_right = tabs.anti_aim.condition:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        delay_ticks_slider = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   Delay"), 1, 10, 1),
        delay_3way1 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   1-Way"), 1, 10, 1),
        delay_3way2 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   2-Way"), 1, 10, 1),
        delay_3way3 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   3-Way"), 1, 10, 1),
        delay_5way1 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   1-Way"), 1, 10, 1),
        delay_5way2 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   2-Way"), 1, 10, 1),
        delay_5way3 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   3-Way"), 1, 10, 1),
        delay_5way4 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   4-Way"), 1, 10, 1),
        delay_5way5 = tabs.anti_aim.condition:slider(string.format("\v\f<clock>\r   5-Way"), 1, 10, 1),
        -- YAW MODIFIER
        yaw_mod = tabs.anti_aim.condition:combo("\v\f<sliders>\r   Yaw Modifier", {"Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way"}),
        yaw_mod_offset = tabs.anti_aim.condition:slider("\v\f<left-right>\r   Offset", -180, 180, 0),
        -- BODY YAW
        enable_body_yaw = tabs.anti_aim.condition:switch("\v\f<gear>\r   Body Yaw", false, nil, function(gear) 
            return {
                inverter2 = gear:switch("Inverter"),
                left_limit = gear:slider("Left", 0, 60, 0),
                right_limit = gear:slider("Right", 0, 60, 0),
                options2 = gear:selectable("Options", {"Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"}), 
            }
        end),

        -- DEFENSIVE MODE
        def_type = tabs.anti_aim.exploits:combo("\v\f<plus-large>\r   DoubleTap", "On Peek", "Always On"),
        hs_type = tabs.anti_aim.exploits:combo("\v\f<dash>\r   HideShots", "Favor Fire Rate", "Break LC"),
        -- DEFENISVE ANTI AIM
        defensive_aa_enabled = tabs.anti_aim.exploits:switch("\v\f<user-pen>\r  Defensive AA"),
        defensive_aa_pitch = tabs.anti_aim.exploits:combo("\v\f<user-plus>\r   Pitch", {"Offset", "Switch", "Random", "Legacy", "Logic"}),
        defensive_aa_pitch_switch_first_value = tabs.anti_aim.exploits:slider("\v\f<arrow-left>\r   Left", -89, 89, 0),
        defensive_aa_pitch_switch_second_value = tabs.anti_aim.exploits:slider("\v\f<arrow-right>\r   Right", -89, 89, 0),
        defensive_aa_pitch_random_first_value = tabs.anti_aim.exploits:slider("\v\f<arrow-left>\r   Left", -89, 89, 0),
        defensive_aa_pitch_random_second_value = tabs.anti_aim.exploits:slider("\v\f<arrow-right>\r   Right", -89, 89, 0),
        defensive_aa_pitch_delay = tabs.anti_aim.exploits:slider("\v\f<left-right>\r    Offset", -89, 89, 0),
        defensive_aa_yaw = tabs.anti_aim.exploits:combo("\v\f<user-minus>\r   Yaw", {"Disabled", "Sideways", "Forward", "Offset", "Switch", "Random", "Hidden", "Distorion", "Spin", "Exploit"}), -- 52
        defensive_aa_yaw_switch_first_value = tabs.anti_aim.exploits:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        defensive_aa_yaw_switch_second_value = tabs.anti_aim.exploits:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        defensive_aa_yaw_default = tabs.anti_aim.exploits:slider("\v\f<left-right>\r    Offset", -180, 180, 0),
        defensive_aa_yaw_random_first_value = tabs.anti_aim.exploits:slider("\v\f<arrow-left>\r   Left", -180, 180, 0),
        defensive_aa_yaw_random_second_value = tabs.anti_aim.exploits:slider("\v\f<arrow-right>\r   Right", -180, 180, 0),
        defensive_aa_yaw_distortion_range = tabs.anti_aim.exploits:slider("Range", 1, 180, 0, true, "°", 1),
        defensive_aa_yaw_distortion_speed = tabs.anti_aim.exploits:slider("Speed", 1, 10, 1, true, "", 1),
        defensive_aa_yaw_spin_range = tabs.anti_aim.exploits:slider("Range", 1, 180, 0, true, "°", 1),
        defensive_aa_yaw_spin_speed = tabs.anti_aim.exploits:slider("Speed", 1, 10, 1, true, "", 1),
        defensive_aa_yaw_exploit_range = tabs.anti_aim.exploits:slider("Range", 1, 180, 0, true, "°", 1),
        defensive_aa_yaw_exploit_speed = tabs.anti_aim.exploits:slider("Speed", 1, 10, 1, true, "", 1),
    }
end

function cond_trig()
    if menu.anti_aim.condition.conditions:get() == "Standing" then
        return 1
    end
    if menu.anti_aim.condition.conditions:get() == "Moving" then
        return 2
    end
    if menu.anti_aim.condition.conditions:get() == "Air" then
        return 3
    end
    if menu.anti_aim.condition.conditions:get() == "Air Crouching" then
        return 4
    end
    if menu.anti_aim.condition.conditions:get() == "Crouching" then
        return 5
    end
    if menu.anti_aim.condition.conditions:get() == "Crouching Moving" then
        return 6
    end
    if menu.anti_aim.condition.conditions:get() == "Slow-Walking" then
        return 7
    end
end  

local if_inverted = false

local stateid = 1

ground_ticks, end_time = 1, 0
local in_air = function()
    if not entity.get_local_player() == nil then return end
    if bit.band(entity.get_local_player()["m_fFlags"], 1) == 1 then
        ground_ticks = ground_ticks + 1
    else
        ground_ticks = 0
        end_time = globals.curtime + 1
    end
    return ground_ticks > 1 and end_time > globals.curtime
end

local get_player_state = function(cmd)
    in_air()

    on_ground = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0
    jump = (cmd.in_jump) and end_time > (globals.curtime + 0.9)
    is_slowwalk = refs.sloww:get()
    crouch = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 1)) ~= 0 or refs.fakeduck:get()
    vx, vy, vz = entity.get_local_player().m_vecVelocity.x, entity.get_local_player().m_vecVelocity.y, entity.get_local_player().m_vecVelocity.z
    math_velocity = math.sqrt(vx ^ 2 + vy ^ 2)
    move = math_velocity > 5
    local is_not_moving = entity.get_local_player().m_vecVelocity:length() < 2

    if not refs.doubletap:get() and not refs.hideshots:get() or refs.fakeduck:get() or rage.exploit:get() == 0 then return "Fake Lag"
    elseif on_ground and not move and not crouch then return "Stand"
    elseif not jump and not crouch and not is_not_moving and not is_slowwalk then return "Move"
    elseif refs.sloww:get() and on_ground then return "Walk"
    elseif crouch and not move and (not jump and on_ground) then return "Crouch"
    elseif crouch and move and (not jump and on_ground) then return "Sneak"
    elseif jump and not crouch then return "Air"
    elseif crouch and (jump or not on_ground) then  return "AirCrouch"
    else return "Shared" end
end

local anti_aim = function(cmd)
    local lp = entity.get_local_player()
    if lp == nil then return end

    if get_player_state(cmd) == "Stand" then stateid = 1
    elseif get_player_state(cmd) == "Move" then stateid = 2
    elseif get_player_state(cmd) == "Air" then stateid = 3
    elseif get_player_state(cmd) == "AirCrouch" then stateid = 4
    elseif get_player_state(cmd) == "Crouch" then stateid = 5
    elseif get_player_state(cmd) == "Sneak" then stateid = 6
    elseif refs.sloww:get() then stateid = 7 end

    local inverted = entity.get_local_player().m_flPoseParameter[11] * 120 - 60 > 0

    if aa_builder_main[stateid].yaw:get() == "Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_ticks_slider:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_ticks_slider:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "3-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way1:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way1:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "3-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way2:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way2:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "3-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way3:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_3way3:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way1:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way1:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way2:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way2:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way3:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way3:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way4:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way4:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end
    if aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.options:set("Jitter")
        if (if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way5:get() * 3) > 0) then
            rage.antiaim:inverter(false) if_inverted = false
        elseif (not if_inverted and globals.tickcount % (aa_builder_main[stateid].delay_5way5:get() * 3) > 0) then
            rage.antiaim:inverter(true) if_inverted = true
        end
    end


    aa_refs.yaw:override(aa_builder_main[stateid].yaw:get())
    aa_refs.yaw_modifier:override(aa_builder_main[stateid].yaw_mod:get())
    aa_refs.modifier_degree:override(aa_builder_main[stateid].yaw_mod_offset:get())

    if aa_builder_main[stateid].yaw:get() == "Default" then
        aa_refs.yaw_offset:override(aa_builder_main[stateid].yaw_offset:get())
    elseif aa_builder_main[stateid].yaw:get() == "Left & Right" then
        aa_refs.yaw_offset:override(inverted and aa_builder_main[stateid].yaw_offset_left:get() or aa_builder_main[stateid].yaw_offset_right:get())
    elseif aa_builder_main[stateid].yaw:get() == "Random" then
        aa_refs.yaw_offset:override(math.random(aa_builder_main[stateid].yaw_random_left:get(), aa_builder_main[stateid].yaw_random_right:get()))
    elseif aa_builder_main[stateid].yaw:get() == "Delay" then
        aa_refs.yaw_offset:override(inverted and aa_builder_main[stateid].yaw_delay_left:get() or aa_builder_main[stateid].yaw_delay_right:get())
    elseif aa_builder_main[stateid].yaw:get() == "3-Way Delay" then
        aa_refs.yaw_offset:override(inverted and aa_builder_main[stateid].yaw_delay3_left:get() or aa_builder_main[stateid].yaw_delay3_right:get())
    elseif aa_builder_main[stateid].yaw:get() == "5-Way Delay" then
        aa_refs.yaw_offset:override(inverted and aa_builder_main[stateid].yaw_delay5_left:get() or aa_builder_main[stateid].yaw_delay5_right:get())
    end

    aa_refs.body_yaw:override(aa_builder_main[stateid].enable_body_yaw:get())
    aa_refs.inv:override(aa_builder_main[stateid].enable_body_yaw.inverter2:get())
    aa_refs.left_limit:override(aa_builder_main[stateid].enable_body_yaw.left_limit:get())
    aa_refs.right_limit:override(aa_builder_main[stateid].enable_body_yaw.right_limit:get())
    aa_refs.options:override(aa_builder_main[stateid].enable_body_yaw.options2:get())
    aa_refs.freestanding_body:override("Off")

    if menu.anti_aim.addons.freestanding:get() then
        aa_refs.freestanding:override(true)
    else
        aa_refs.freestanding:override()
    end

    if menu.anti_aim.addons.freestanding.freestanding_yaw_modifier:get() then
        aa_refs.yaw_mod:override(true)
    else
        aa_refs.yaw_mod:override()
    end

    if menu.anti_aim.addons.freestanding.freestanding_body_freestanding:get() then
        aa_refs.body_fs:override(true)
    else
        aa_refs.body_fs:override()
    end

    if aa_builder_main[stateid].defensive_aa_enabled:get() then aa_refs.hidden_yaw:set(true) else aa_refs.hidden_yaw:set(false) end

    if aa_builder_main[stateid].defensive_aa_enabled:get() then 
        refs.findik:override("Always on")

        if aa_builder_main[stateid].defensive_aa_pitch:get() == "Offset" then
            rage.antiaim:override_hidden_pitch(aa_builder_main[stateid].defensive_aa_pitch_delay:get())
        elseif aa_builder_main[stateid].defensive_aa_pitch:get() == "Switch" then
            if globals.tickcount % 4 > 1 then
                rage.antiaim:override_hidden_pitch(aa_builder_main[stateid].defensive_aa_pitch_switch_first_value:get())
            else
                rage.antiaim:override_hidden_pitch(aa_builder_main[stateid].defensive_aa_pitch_switch_second_value:get())
            end
        elseif aa_builder_main[stateid].defensive_aa_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(aa_builder_main[stateid].defensive_aa_pitch_random_first_value:get(), aa_builder_main[stateid].defensive_aa_pitch_random_second_value:get()))
        elseif aa_builder_main[stateid].defensive_aa_pitch:get() == "Legacy" then
            if globals.tickcount % 7 > 4 then
                rage.antiaim:override_hidden_pitch(math.random(45))
            else
                rage.antiaim:override_hidden_pitch(math.random(-45))
            end
        elseif aa_builder_main[stateid].defensive_aa_pitch:get() == "Logic" then
            if globals.tickcount % 7 > 3 then
                rage.antiaim:override_hidden_pitch(math.random(89))
            else
                rage.antiaim:override_hidden_pitch(math.random(85))
            end
        end
    end

    if aa_builder_main[stateid].defensive_aa_enabled:get() then
        refs.findik:override("Always on")
        local cur_time = globals.curtime
        local tick = globals.tickcount
        if aa_builder_main[stateid].defensive_aa_yaw:get() == "Sideways" then
            if globals.tickcount % 4 > 1 then
                rage.antiaim:override_hidden_yaw_offset(90)
            else
                rage.antiaim:override_hidden_yaw_offset(-90)
            end
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Forward" then
            rage.antiaim:override_hidden_yaw_offset(-180)
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Offset" then
            rage.antiaim:override_hidden_yaw_offset(aa_builder_main[stateid].defensive_aa_yaw_default:get())
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Switch" then
            if globals.tickcount % 4 > 1 then
                rage.antiaim:override_hidden_yaw_offset(aa_builder_main[stateid].defensive_aa_yaw_switch_first_value:get())
            else
                rage.antiaim:override_hidden_yaw_offset(aa_builder_main[stateid].defensive_aa_yaw_switch_second_value:get())
            end
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(aa_builder_main[stateid].defensive_aa_yaw_random_first_value:get(), aa_builder_main[stateid].defensive_aa_yaw_random_second_value:get()))
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Distorion" then
            local speed = aa_builder_main[stateid].defensive_aa_yaw_distortion_speed:get()
            local range = aa_builder_main[stateid].defensive_aa_yaw_distortion_range:get()
            rage.antiaim:override_hidden_yaw_offset(math.sin(cur_time * speed) * range)
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Spin" then
            local speed = aa_builder_main[stateid].defensive_aa_yaw_spin_speed:get()
            local range = aa_builder_main[stateid].defensive_aa_yaw_spin_range:get()
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(cur_time * (speed * 360), range * 2) + range)
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Exploit" then -- para
            local speed = aa_builder_main[stateid].defensive_aa_yaw_exploit_speed:get()
            local range = aa_builder_main[stateid].defensive_aa_yaw_exploit_range:get()
            rage.antiaim:override_hidden_yaw_offset(-math.sin(cur_time * speed ) * range * 4)
        elseif aa_builder_main[stateid].defensive_aa_yaw:get() == "Disabled" then 
            rage.antiaim:override_hidden_yaw_offset(0)
        end
    end
    zalupa = false
    -- manual anti-aim
    if menu.anti_aim.addons.manual_yaw_base:get() == "Left" then
        aa_refs.yaw_offset:override(-90)
        aa_refs.yaw_base:override("Local View")
        aa_refs.yaw_modifier:override("Disabled")
        aa_refs.options:override("")
        aa_refs.freestanding:override(false)
        aa_refs.hidden_yaw:override(false)
    elseif menu.anti_aim.addons.manual_yaw_base:get() == "Right" then
        aa_refs.yaw_offset:override(90)
        aa_refs.yaw_base:override("Local View")
        aa_refs.yaw_modifier:override("Disabled")
        aa_refs.options:override("")
        aa_refs.freestanding:override(false)
        aa_refs.hidden_yaw:override(false)
    elseif menu.anti_aim.addons.manual_yaw_base:get() == "Forward" then
        aa_refs.yaw_offset:override(180)
        aa_refs.yaw_base:override("Local View")
        aa_refs.yaw_modifier:override("Disabled")
        aa_refs.options:override("")
        aa_refs.freestanding:override(false)
        aa_refs.hidden_yaw:override(false)
    else
        aa_refs.yaw_base:override("At Target")
    end


    refs.findik:override(aa_builder_main[stateid].def_type:get())
    refs.findhs:override(aa_builder_main[stateid].hs_type:get())
end

-- visibility anti-aims
anti_aim_visible = function()
    local cond = cond_trig()

    for i = 1, 7 do
        menu.anti_aim.condition.conditions:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].def_type:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].defensive_aa_enabled:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].hs_type:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_mod:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].enable_body_yaw:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].defensive_aa_enabled:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].defensive_aa_pitch:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get())
        aa_builder_main[i].defensive_aa_pitch_switch_first_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_pitch:get() == "Switch")
        aa_builder_main[i].defensive_aa_pitch_switch_second_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_pitch:get() == "Switch")
        aa_builder_main[i].defensive_aa_pitch_random_first_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_pitch:get() == "Random")
        aa_builder_main[i].defensive_aa_pitch_random_second_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_pitch:get() == "Random")
        aa_builder_main[i].defensive_aa_pitch_delay:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_pitch:get() == "Offset")
        aa_builder_main[i].defensive_aa_yaw:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get())
        aa_builder_main[i].defensive_aa_yaw_switch_first_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Switch")
        aa_builder_main[i].defensive_aa_yaw_switch_second_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Switch")
        aa_builder_main[i].defensive_aa_yaw_default:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Offset")
        aa_builder_main[i].defensive_aa_yaw_random_first_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Random")
        aa_builder_main[i].defensive_aa_yaw_random_second_value:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Random")
        aa_builder_main[i].defensive_aa_yaw_distortion_range:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Distorion")
        aa_builder_main[i].defensive_aa_yaw_distortion_speed:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Distorion")
        aa_builder_main[i].defensive_aa_yaw_spin_range:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Spin")
        aa_builder_main[i].defensive_aa_yaw_spin_speed:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Spin")
        aa_builder_main[i].defensive_aa_yaw_exploit_range:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Exploit")
        aa_builder_main[i].defensive_aa_yaw_exploit_speed:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].defensive_aa_enabled:get() and aa_builder_main[i].defensive_aa_yaw:get() == "Exploit")
        aa_builder_main[i].yaw_offset:visibility(cond == i and aa_builder_main[i].yaw:get() == "Default" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_offset_left:visibility(cond == i and aa_builder_main[i].yaw:get() == "Left & Right" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_offset_right:visibility(cond == i and aa_builder_main[i].yaw:get() == "Left & Right" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_random_left:visibility(cond == i and aa_builder_main[i].yaw:get() == "Random" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_random_right:visibility(cond == i and aa_builder_main[i].yaw:get() == "Random" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay_left:visibility(cond == i and aa_builder_main[i].yaw:get() == "Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay_right:visibility(cond == i and aa_builder_main[i].yaw:get() == "Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay3_left:visibility(cond == i and aa_builder_main[i].yaw:get() == "3-Way Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay3_right:visibility(cond == i and aa_builder_main[i].yaw:get() == "3-Way Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay5_left:visibility(cond == i and aa_builder_main[i].yaw:get() == "5-Way Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].yaw_delay5_right:visibility(cond == i and aa_builder_main[i].yaw:get() == "5-Way Delay" and menu.anti_aim.tab_switch.tab_switcher:get() == 2)
        aa_builder_main[i].delay_ticks_slider:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "Delay")
        aa_builder_main[i].delay_3way1:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "3-Way Delay")
        aa_builder_main[i].delay_3way2:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "3-Way Delay")
        aa_builder_main[i].delay_3way3:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "3-Way Delay")
        aa_builder_main[i].delay_3way1:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "3-Way Delay")
        aa_builder_main[i].delay_5way1:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "5-Way Delay")
        aa_builder_main[i].delay_5way2:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "5-Way Delay")
        aa_builder_main[i].delay_5way3:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "5-Way Delay")
        aa_builder_main[i].delay_5way4:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "5-Way Delay")
        aa_builder_main[i].delay_5way5:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw:get() == "5-Way Delay")
        aa_builder_main[i].yaw_mod_offset:visibility(cond == i and menu.anti_aim.tab_switch.tab_switcher:get() == 2 and aa_builder_main[i].yaw_mod:get() ~="Disabled")
        aa_builder_main[i].enable_body_yaw.inverter2:visibility(aa_builder_main[i].enable_body_yaw:get())
        aa_builder_main[i].enable_body_yaw.left_limit:visibility(aa_builder_main[i].enable_body_yaw:get())
        aa_builder_main[i].enable_body_yaw.right_limit:visibility(aa_builder_main[i].enable_body_yaw:get())
        aa_builder_main[i].enable_body_yaw.options2:visibility(aa_builder_main[i].enable_body_yaw:get())
    end

    menu.anti_aim.addons.manual_yaw_base:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 2)
    menu.anti_aim.addons.freestanding:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 2)
    exporttcp:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    importfcp:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    defaultpreset:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
end
-- visibility anti-aims end

local ct_animation = function()
    if utils.net_channel() == nil then return end
    local set_clan_tag = math.floor(math.fmod((globals.tickcount + (utils.net_channel().latency[0] / globals.tickinterval)) / 22, #tag_anim + 1) + 1)
    return tag_anim[set_clan_tag]
end

local ct_check = nil
local clan_tag = function(tag_anim)
    if tag_anim == ct_check then return end
    if tag_anim == nil then return end

    common.set_clan_tag(tag_anim)
    ct_check = tag_anim
end

-- Scope
local lerp = function(time,a,b)
    return a * (1-time) + b * time
end

length = 0
gap = 0

local function customscope()
    if menu.anti_aim.visuals.customscope:get() then
        local x = render.screen_size().x
        local y = render.screen_size().y
        local localplayer = entity.get_local_player()
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All")
        if localplayer == nil then return end
        if localplayer.m_iHealth < 1 then return end
		length = lerp(0.2, length, localplayer.m_bIsScoped and menu.anti_aim.visuals.customscope.scopeLength:get() or 0)
		gap = lerp(0.2, gap, localplayer.m_bIsScoped and menu.anti_aim.visuals.customscope.scopeGap:get() or 0) 
		local scopeColor_x = color(menu.anti_aim.visuals.customscope.scopeColor:get().r, menu.anti_aim.visuals.customscope.scopeColor:get().g, menu.anti_aim.visuals.customscope.scopeColor:get().b, menu.anti_aim.visuals.customscope.scopeColor:get().a)
		local scopeColor_y = color(menu.anti_aim.visuals.customscope.scopeColor:get().r, menu.anti_aim.visuals.customscope.scopeColor:get().g, menu.anti_aim.visuals.customscope.scopeColor:get().b, 0)
        if menu.anti_aim.visuals.customscope.scopetype:get() == "Custom" then
            render.gradient(vector(x / 2 - gap, y / 2), vector(x / 2 - gap - length, y / 2 + 1), scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
            render.gradient(vector(x / 2 + gap, y / 2), vector(x / 2 + gap + length, y / 2 + 1), scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
            render.gradient(vector(x / 2, y / 2 + gap), vector(x / 2 + 1, y / 2 + gap + length), scopeColor_x, scopeColor_x, scopeColor_y, scopeColor_y)
            render.gradient(vector(x / 2, y / 2 - gap), vector(x / 2 + 1, y / 2 - gap - length), scopeColor_x, scopeColor_x, scopeColor_y, scopeColor_y)
        elseif menu.anti_aim.visuals.customscope.scopetype:get() == "Reversed" then
            render.gradient(vector(x / 2 - gap - length, y / 2 + 1 ), vector(x / 2 - gap, y / 2), scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
            render.gradient(vector(x / 2 + gap + length, y / 2 + 1 ), vector(x / 2 + gap, y / 2), scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
            render.gradient(vector(x / 2 + 1, y / 2 + gap + length), vector(x / 2, y / 2 + gap),scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
            render.gradient(vector(x / 2 + 1, y / 2 - gap - length), vector(x / 2, y / 2 - gap),scopeColor_x, scopeColor_y, scopeColor_x, scopeColor_y)
        end
    else
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove Overlay")
    end
end
-- Scope end

-- aspectratio
local aspect = function()
    local aspect_value = menu.anti_aim.visuals2.aspect_ratio.aspect_ratio_value:get() / 10

    if not menu.anti_aim.visuals2.aspect_ratio:get() then
        aspect_value = 0
    end

    if aspect_value ~= cvar.r_aspectratio.float(cvar.r_aspectratio) then
        cvar.r_aspectratio.float(cvar.r_aspectratio, aspect_value)
    end
end

menu.anti_aim.visuals2.aspect_ratio:set_callback(function(ref)
	local enabled = ref:get()
	if enabled then
		cvar.r_aspectratio:float(menu.anti_aim.visuals2.aspect_ratio.aspect_ratio_value:get()/10)
	else
		cvar.r_aspectratio:float(0)
	end
end)

menu.anti_aim.visuals2.aspect_ratio.aspect_ratio_value:set_callback(function(ref)
	local enabled = menu.anti_aim.visuals2.aspect_ratio:get()
	if enabled then
		cvar.r_aspectratio:float(ref:get()/10)
	end
end)

events.shutdown:set(function()
    cvar.r_aspectratio:float(0)
end)
-- aspectratio end

-- viewmodel
events.createmove:set(function()
    if menu.anti_aim.visuals2.viewmodel:get() then
        cvar.viewmodel_fov:int(menu.anti_aim.visuals2.viewmodel.viewmodel_fov:get(), true)
        cvar.viewmodel_offset_x:float(menu.anti_aim.visuals2.viewmodel.viewmodel_x:get(), true)
        cvar.viewmodel_offset_y:float(menu.anti_aim.visuals2.viewmodel.viewmodel_y:get(), true)
        cvar.viewmodel_offset_z:float(menu.anti_aim.visuals2.viewmodel.viewmodel_z:get(), true)
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

-- config system
local base64 = require("neverlose/base64")
local Clipboard, ffi_handler = {}, {}, {}

ffi.cdef[[
    typedef int(__thiscall* get_clipboard_text_length)(void*);
    typedef void(__thiscall* set_clipboard_text)(void*, const char*, int);
    typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int);
]]

ffi_handler.VGUI_System = ffi.cast(ffi.typeof("void***"), utils.create_interface("vgui2.dll", "VGUI_System010"))
ffi_handler.get_clipboard_text_length = ffi.cast("get_clipboard_text_length", ffi_handler.VGUI_System[0][7])
ffi_handler.get_clipboard_text = ffi.cast("get_clipboard_text", ffi_handler.VGUI_System[0][11])
ffi_handler.set_clipboard_text = ffi.cast("set_clipboard_text", ffi_handler.VGUI_System[0][9])

function Clipboard.Get()
    local clipboard_text_length = ffi_handler.get_clipboard_text_length(ffi_handler.VGUI_System)

    if (clipboard_text_length > 0) then
        local buffer = ffi.new("char[?]", clipboard_text_length)

        ffi_handler.get_clipboard_text(ffi_handler.VGUI_System, 0, buffer, clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length))
        return ffi.string(buffer, clipboard_text_length - 1)
    end

    return ""
end

function Clipboard.Set(text)
    ffi_handler.set_clipboard_text(ffi_handler.VGUI_System, text, #text)
end

local JSON = panorama.loadstring([[
    return {
        stringify: JSON.stringify,
        parse: JSON.parse
    };
]])()

-- cfg
local cfg_data = {
    ints = {
        aa_builder_main[1].yaw,
        aa_builder_main[1].yaw_offset,
        aa_builder_main[1].yaw_offset_left,
        aa_builder_main[1].yaw_offset_right,
        aa_builder_main[1].yaw_random_left,
        aa_builder_main[1].yaw_random_right,
        aa_builder_main[1].yaw_delay_left,
        aa_builder_main[1].yaw_delay_right,
        aa_builder_main[1].delay_ticks_slider,
        aa_builder_main[1].yaw_delay3_left,
        aa_builder_main[1].yaw_delay3_right,
        aa_builder_main[1].yaw_delay5_left,
        aa_builder_main[1].yaw_delay5_right,
        aa_builder_main[1].delay_3way1,
        aa_builder_main[1].delay_3way2,
        aa_builder_main[1].delay_3way3,
        aa_builder_main[1].delay_5way1,
        aa_builder_main[1].delay_5way2,
        aa_builder_main[1].delay_5way3,
        aa_builder_main[1].delay_5way4,
        aa_builder_main[1].delay_5way5,
        aa_builder_main[1].yaw_mod,
        aa_builder_main[1].yaw_mod_offset,
        aa_builder_main[1].enable_body_yaw,
        aa_builder_main[1].enable_body_yaw.inverter2,
        aa_builder_main[1].enable_body_yaw.left_limit,
        aa_builder_main[1].enable_body_yaw.right_limit,
        aa_builder_main[1].enable_body_yaw.options2,
        aa_builder_main[1].def_type,
        aa_builder_main[1].hs_type,
        aa_builder_main[1].defensive_aa_enabled,
        aa_builder_main[1].defensive_aa_pitch,
        aa_builder_main[1].defensive_aa_pitch_switch_first_value,
        aa_builder_main[1].defensive_aa_pitch_switch_second_value,
        aa_builder_main[1].defensive_aa_pitch_random_first_value,
        aa_builder_main[1].defensive_aa_pitch_random_second_value,
        aa_builder_main[1].defensive_aa_pitch_delay,
        aa_builder_main[1].defensive_aa_yaw,
        aa_builder_main[1].defensive_aa_yaw_switch_first_value,
        aa_builder_main[1].defensive_aa_yaw_switch_second_value,
        aa_builder_main[1].defensive_aa_yaw_default,
        aa_builder_main[1].defensive_aa_yaw_random_first_value,
        aa_builder_main[1].defensive_aa_yaw_random_second_value,
        aa_builder_main[1].defensive_aa_yaw_distortion_range,
        aa_builder_main[1].defensive_aa_yaw_distortion_speed,
        aa_builder_main[1].defensive_aa_yaw_spin_range,
        aa_builder_main[1].defensive_aa_yaw_spin_speed,
        aa_builder_main[1].defensive_aa_yaw_exploit_range,
        aa_builder_main[1].defensive_aa_yaw_exploit_speed,
        aa_builder_main[2].yaw,
        aa_builder_main[2].yaw_offset,
        aa_builder_main[2].yaw_offset_left,
        aa_builder_main[2].yaw_offset_right,
        aa_builder_main[2].yaw_random_left,
        aa_builder_main[2].yaw_random_right,
        aa_builder_main[2].yaw_delay_left,
        aa_builder_main[2].yaw_delay_right,
        aa_builder_main[2].delay_ticks_slider,
        aa_builder_main[2].yaw_delay3_left,
        aa_builder_main[2].yaw_delay3_right,
        aa_builder_main[2].yaw_delay5_left,
        aa_builder_main[2].yaw_delay5_right,
        aa_builder_main[2].delay_3way1,
        aa_builder_main[2].delay_3way2,
        aa_builder_main[2].delay_3way3,
        aa_builder_main[2].delay_5way1,
        aa_builder_main[2].delay_5way2,
        aa_builder_main[2].delay_5way3,
        aa_builder_main[2].delay_5way4,
        aa_builder_main[2].delay_5way5,
        aa_builder_main[2].yaw_mod,
        aa_builder_main[2].yaw_mod_offset,
        aa_builder_main[2].enable_body_yaw,
        aa_builder_main[2].enable_body_yaw.inverter2,
        aa_builder_main[2].enable_body_yaw.left_limit,
        aa_builder_main[2].enable_body_yaw.right_limit,
        aa_builder_main[2].enable_body_yaw.options2,
        aa_builder_main[2].def_type,
        aa_builder_main[2].hs_type,
        aa_builder_main[2].defensive_aa_enabled,
        aa_builder_main[2].defensive_aa_pitch,
        aa_builder_main[2].defensive_aa_pitch_switch_first_value,
        aa_builder_main[2].defensive_aa_pitch_switch_second_value,
        aa_builder_main[2].defensive_aa_pitch_random_first_value,
        aa_builder_main[2].defensive_aa_pitch_random_second_value,
        aa_builder_main[2].defensive_aa_pitch_delay,
        aa_builder_main[2].defensive_aa_yaw,
        aa_builder_main[2].defensive_aa_yaw_switch_first_value,
        aa_builder_main[2].defensive_aa_yaw_switch_second_value,
        aa_builder_main[2].defensive_aa_yaw_default,
        aa_builder_main[2].defensive_aa_yaw_random_first_value,
        aa_builder_main[2].defensive_aa_yaw_random_second_value,
        aa_builder_main[2].defensive_aa_yaw_distortion_range,
        aa_builder_main[2].defensive_aa_yaw_distortion_speed,
        aa_builder_main[2].defensive_aa_yaw_spin_range,
        aa_builder_main[2].defensive_aa_yaw_spin_speed,
        aa_builder_main[2].defensive_aa_yaw_exploit_range,
        aa_builder_main[2].defensive_aa_yaw_exploit_speed,
        aa_builder_main[3].yaw,
        aa_builder_main[3].yaw_offset,
        aa_builder_main[3].yaw_offset_left,
        aa_builder_main[3].yaw_offset_right,
        aa_builder_main[3].yaw_random_left,
        aa_builder_main[3].yaw_random_right,
        aa_builder_main[3].yaw_delay_left,
        aa_builder_main[3].yaw_delay_right,
        aa_builder_main[3].delay_ticks_slider,
        aa_builder_main[3].yaw_delay3_left,
        aa_builder_main[3].yaw_delay3_right,
        aa_builder_main[3].yaw_delay5_left,
        aa_builder_main[3].yaw_delay5_right,
        aa_builder_main[3].delay_3way1,
        aa_builder_main[3].delay_3way2,
        aa_builder_main[3].delay_3way3,
        aa_builder_main[3].delay_5way1,
        aa_builder_main[3].delay_5way2,
        aa_builder_main[3].delay_5way3,
        aa_builder_main[3].delay_5way4,
        aa_builder_main[3].delay_5way5,
        aa_builder_main[3].yaw_mod,
        aa_builder_main[3].yaw_mod_offset,
        aa_builder_main[3].enable_body_yaw,
        aa_builder_main[3].enable_body_yaw.inverter2,
        aa_builder_main[3].enable_body_yaw.left_limit,
        aa_builder_main[3].enable_body_yaw.right_limit,
        aa_builder_main[3].enable_body_yaw.options2,
        aa_builder_main[3].def_type,
        aa_builder_main[3].hs_type,
        aa_builder_main[3].defensive_aa_enabled,
        aa_builder_main[3].defensive_aa_pitch,
        aa_builder_main[3].defensive_aa_pitch_switch_first_value,
        aa_builder_main[3].defensive_aa_pitch_switch_second_value,
        aa_builder_main[3].defensive_aa_pitch_random_first_value,
        aa_builder_main[3].defensive_aa_pitch_random_second_value,
        aa_builder_main[3].defensive_aa_pitch_delay,
        aa_builder_main[3].defensive_aa_yaw,
        aa_builder_main[3].defensive_aa_yaw_switch_first_value,
        aa_builder_main[3].defensive_aa_yaw_switch_second_value,
        aa_builder_main[3].defensive_aa_yaw_default,
        aa_builder_main[3].defensive_aa_yaw_random_first_value,
        aa_builder_main[3].defensive_aa_yaw_random_second_value,
        aa_builder_main[3].defensive_aa_yaw_distortion_range,
        aa_builder_main[3].defensive_aa_yaw_distortion_speed,
        aa_builder_main[3].defensive_aa_yaw_spin_range,
        aa_builder_main[3].defensive_aa_yaw_spin_speed,
        aa_builder_main[3].defensive_aa_yaw_exploit_range,
        aa_builder_main[3].defensive_aa_yaw_exploit_speed,
        aa_builder_main[4].yaw,
        aa_builder_main[4].yaw_offset,
        aa_builder_main[4].yaw_offset_left,
        aa_builder_main[4].yaw_offset_right,
        aa_builder_main[4].yaw_random_left,
        aa_builder_main[4].yaw_random_right,
        aa_builder_main[4].yaw_delay_left,
        aa_builder_main[4].yaw_delay_right,
        aa_builder_main[4].delay_ticks_slider,
        aa_builder_main[4].yaw_delay3_left,
        aa_builder_main[4].yaw_delay3_right,
        aa_builder_main[4].yaw_delay5_left,
        aa_builder_main[4].yaw_delay5_right,
        aa_builder_main[4].delay_3way1,
        aa_builder_main[4].delay_3way2,
        aa_builder_main[4].delay_3way3,
        aa_builder_main[4].delay_5way1,
        aa_builder_main[4].delay_5way2,
        aa_builder_main[4].delay_5way3,
        aa_builder_main[4].delay_5way4,
        aa_builder_main[4].delay_5way5,
        aa_builder_main[4].yaw_mod,
        aa_builder_main[4].yaw_mod_offset,
        aa_builder_main[4].enable_body_yaw,
        aa_builder_main[4].enable_body_yaw.inverter2,
        aa_builder_main[4].enable_body_yaw.left_limit,
        aa_builder_main[4].enable_body_yaw.right_limit,
        aa_builder_main[4].enable_body_yaw.options2,
        aa_builder_main[4].def_type,
        aa_builder_main[4].hs_type,
        aa_builder_main[4].defensive_aa_enabled,
        aa_builder_main[4].defensive_aa_pitch,
        aa_builder_main[4].defensive_aa_pitch_switch_first_value,
        aa_builder_main[4].defensive_aa_pitch_switch_second_value,
        aa_builder_main[4].defensive_aa_pitch_random_first_value,
        aa_builder_main[4].defensive_aa_pitch_random_second_value,
        aa_builder_main[4].defensive_aa_pitch_delay,
        aa_builder_main[4].defensive_aa_yaw,
        aa_builder_main[4].defensive_aa_yaw_switch_first_value,
        aa_builder_main[4].defensive_aa_yaw_switch_second_value,
        aa_builder_main[4].defensive_aa_yaw_default,
        aa_builder_main[4].defensive_aa_yaw_random_first_value,
        aa_builder_main[4].defensive_aa_yaw_random_second_value,
        aa_builder_main[4].defensive_aa_yaw_distortion_range,
        aa_builder_main[4].defensive_aa_yaw_distortion_speed,
        aa_builder_main[4].defensive_aa_yaw_spin_range,
        aa_builder_main[4].defensive_aa_yaw_spin_speed,
        aa_builder_main[4].defensive_aa_yaw_exploit_range,
        aa_builder_main[4].defensive_aa_yaw_exploit_speed,
        aa_builder_main[5].yaw,
        aa_builder_main[5].yaw_offset,
        aa_builder_main[5].yaw_offset_left,
        aa_builder_main[5].yaw_offset_right,
        aa_builder_main[5].yaw_random_left,
        aa_builder_main[5].yaw_random_right,
        aa_builder_main[5].yaw_delay_left,
        aa_builder_main[5].yaw_delay_right,
        aa_builder_main[5].delay_ticks_slider,
        aa_builder_main[5].yaw_delay3_left,
        aa_builder_main[5].yaw_delay3_right,
        aa_builder_main[5].yaw_delay5_left,
        aa_builder_main[5].yaw_delay5_right,
        aa_builder_main[5].delay_3way1,
        aa_builder_main[5].delay_3way2,
        aa_builder_main[5].delay_3way3,
        aa_builder_main[5].delay_5way1,
        aa_builder_main[5].delay_5way2,
        aa_builder_main[5].delay_5way3,
        aa_builder_main[5].delay_5way4,
        aa_builder_main[5].delay_5way5,
        aa_builder_main[5].yaw_mod,
        aa_builder_main[5].yaw_mod_offset,
        aa_builder_main[5].enable_body_yaw,
        aa_builder_main[5].enable_body_yaw.inverter2,
        aa_builder_main[5].enable_body_yaw.left_limit,
        aa_builder_main[5].enable_body_yaw.right_limit,
        aa_builder_main[5].enable_body_yaw.options2,
        aa_builder_main[5].def_type,
        aa_builder_main[5].hs_type,
        aa_builder_main[5].defensive_aa_enabled,
        aa_builder_main[5].defensive_aa_pitch,
        aa_builder_main[5].defensive_aa_pitch_switch_first_value,
        aa_builder_main[5].defensive_aa_pitch_switch_second_value,
        aa_builder_main[5].defensive_aa_pitch_random_first_value,
        aa_builder_main[5].defensive_aa_pitch_random_second_value,
        aa_builder_main[5].defensive_aa_pitch_delay,
        aa_builder_main[5].defensive_aa_yaw,
        aa_builder_main[5].defensive_aa_yaw_switch_first_value,
        aa_builder_main[5].defensive_aa_yaw_switch_second_value,
        aa_builder_main[5].defensive_aa_yaw_default,
        aa_builder_main[5].defensive_aa_yaw_random_first_value,
        aa_builder_main[5].defensive_aa_yaw_random_second_value,
        aa_builder_main[5].defensive_aa_yaw_distortion_range,
        aa_builder_main[5].defensive_aa_yaw_distortion_speed,
        aa_builder_main[5].defensive_aa_yaw_spin_range,
        aa_builder_main[5].defensive_aa_yaw_spin_speed,
        aa_builder_main[5].defensive_aa_yaw_exploit_range,
        aa_builder_main[5].defensive_aa_yaw_exploit_speed,
        aa_builder_main[6].yaw,
        aa_builder_main[6].yaw_offset,
        aa_builder_main[6].yaw_offset_left,
        aa_builder_main[6].yaw_offset_right,
        aa_builder_main[6].yaw_random_left,
        aa_builder_main[6].yaw_random_right,
        aa_builder_main[6].yaw_delay_left,
        aa_builder_main[6].yaw_delay_right,
        aa_builder_main[6].delay_ticks_slider,
        aa_builder_main[6].yaw_delay3_left,
        aa_builder_main[6].yaw_delay3_right,
        aa_builder_main[6].yaw_delay5_left,
        aa_builder_main[6].yaw_delay5_right,
        aa_builder_main[6].delay_3way1,
        aa_builder_main[6].delay_3way2,
        aa_builder_main[6].delay_3way3,
        aa_builder_main[6].delay_5way1,
        aa_builder_main[6].delay_5way2,
        aa_builder_main[6].delay_5way3,
        aa_builder_main[6].delay_5way4,
        aa_builder_main[6].delay_5way5,
        aa_builder_main[6].yaw_mod,
        aa_builder_main[6].yaw_mod_offset,
        aa_builder_main[6].enable_body_yaw,
        aa_builder_main[6].enable_body_yaw.inverter2,
        aa_builder_main[6].enable_body_yaw.left_limit,
        aa_builder_main[6].enable_body_yaw.right_limit,
        aa_builder_main[6].enable_body_yaw.options2,
        aa_builder_main[6].def_type,
        aa_builder_main[6].hs_type,
        aa_builder_main[6].defensive_aa_enabled,
        aa_builder_main[6].defensive_aa_pitch,
        aa_builder_main[6].defensive_aa_pitch_switch_first_value,
        aa_builder_main[6].defensive_aa_pitch_switch_second_value,
        aa_builder_main[6].defensive_aa_pitch_random_first_value,
        aa_builder_main[6].defensive_aa_pitch_random_second_value,
        aa_builder_main[6].defensive_aa_pitch_delay,
        aa_builder_main[6].defensive_aa_yaw,
        aa_builder_main[6].defensive_aa_yaw_switch_first_value,
        aa_builder_main[6].defensive_aa_yaw_switch_second_value,
        aa_builder_main[6].defensive_aa_yaw_default,
        aa_builder_main[6].defensive_aa_yaw_random_first_value,
        aa_builder_main[6].defensive_aa_yaw_random_second_value,
        aa_builder_main[6].defensive_aa_yaw_distortion_range,
        aa_builder_main[6].defensive_aa_yaw_distortion_speed,
        aa_builder_main[6].defensive_aa_yaw_spin_range,
        aa_builder_main[6].defensive_aa_yaw_spin_speed,
        aa_builder_main[6].defensive_aa_yaw_exploit_range,
        aa_builder_main[6].defensive_aa_yaw_exploit_speed,
        aa_builder_main[7].yaw,
        aa_builder_main[7].yaw_offset,
        aa_builder_main[7].yaw_offset_left,
        aa_builder_main[7].yaw_offset_right,
        aa_builder_main[7].yaw_random_left,
        aa_builder_main[7].yaw_random_right,
        aa_builder_main[7].yaw_delay_left,
        aa_builder_main[7].yaw_delay_right,
        aa_builder_main[7].delay_ticks_slider,
        aa_builder_main[7].yaw_delay3_left,
        aa_builder_main[7].yaw_delay3_right,
        aa_builder_main[7].yaw_delay5_left,
        aa_builder_main[7].yaw_delay5_right,
        aa_builder_main[7].delay_3way1,
        aa_builder_main[7].delay_3way2,
        aa_builder_main[7].delay_3way3,
        aa_builder_main[7].delay_5way1,
        aa_builder_main[7].delay_5way2,
        aa_builder_main[7].delay_5way3,
        aa_builder_main[7].delay_5way4,
        aa_builder_main[7].delay_5way5,
        aa_builder_main[7].yaw_mod,
        aa_builder_main[7].yaw_mod_offset,
        aa_builder_main[7].enable_body_yaw,
        aa_builder_main[7].enable_body_yaw.inverter2,
        aa_builder_main[7].enable_body_yaw.left_limit,
        aa_builder_main[7].enable_body_yaw.right_limit,
        aa_builder_main[7].enable_body_yaw.options2,
        aa_builder_main[7].def_type,
        aa_builder_main[7].hs_type,
        aa_builder_main[7].defensive_aa_enabled,
        aa_builder_main[7].defensive_aa_pitch,
        aa_builder_main[7].defensive_aa_pitch_switch_first_value,
        aa_builder_main[7].defensive_aa_pitch_switch_second_value,
        aa_builder_main[7].defensive_aa_pitch_random_first_value,
        aa_builder_main[7].defensive_aa_pitch_random_second_value,
        aa_builder_main[7].defensive_aa_pitch_delay,
        aa_builder_main[7].defensive_aa_yaw,
        aa_builder_main[7].defensive_aa_yaw_switch_first_value,
        aa_builder_main[7].defensive_aa_yaw_switch_second_value,
        aa_builder_main[7].defensive_aa_yaw_default,
        aa_builder_main[7].defensive_aa_yaw_random_first_value,
        aa_builder_main[7].defensive_aa_yaw_random_second_value,
        aa_builder_main[7].defensive_aa_yaw_distortion_range,
        aa_builder_main[7].defensive_aa_yaw_distortion_speed,
        aa_builder_main[7].defensive_aa_yaw_spin_range,
        aa_builder_main[7].defensive_aa_yaw_spin_speed,
        aa_builder_main[7].defensive_aa_yaw_exploit_range,
        aa_builder_main[7].defensive_aa_yaw_exploit_speed,
    },

    floats = {
    },

    strings = {

    }
}

function cfg(cfg2)
    for k, v in pairs(JSON.parse(base64.decode(cfg2))) do

        k = ({[1] = "bools", [2] = "ints", [3] = "floats", [4] = "strings", [5] = "colors"})[k]

        for k2, v2 in pairs(v) do
            if (k == "bools") then
                cfg_data[k][k2]:set(v2)
            end

            if (k == "ints") then
                cfg_data[k][k2]:set(v2)
            end

            if (k == "floats") then
                cfg_data[k][k2]:set(v2)
            end

            if (k == "strings") then
                cfg_data[k][k2]:set(v2)
            end
        end
    end
end


exporttcp = tabs.anti_aim.config:button("\f<file-export>           Export          ", function()

    local Code = {{}, {}, {}, {}, {}}

    for _, ints in pairs(cfg_data.ints) do
        table.insert(Code[2], ints:get())
    end

    for _, floats in pairs(cfg_data.floats) do
        table.insert(Code[3], floats:get())
    end

    for _, strings in pairs(cfg_data.strings) do
        table.insert(Code[4], strings:get())
    end

    Clipboard.Set(base64.encode(JSON.stringify(Code)))
end)

importfcp = tabs.anti_aim.config:button("\f<file-import>          Import           ", function()
    cfg(Clipboard.Get())
end)

defaultpreset = tabs.anti_aim.config:button("\f<loader>                              Default                                  ", function()
    cfg("eyIxIjp7fSwiMiI6eyIxIjoiRGVsYXkiLCIyIjowLCIzIjowLCI0IjowLCI1IjowLCI2IjowLCI3IjotNDQsIjgiOjMyLCI5IjoxLCIxMCI6MCwiMTEiOjAsIjEyIjowLCIxMyI6MCwiMTQiOjEsIjE1IjoxLCIxNiI6MSwiMTciOjEsIjE4IjoxLCIxOSI6MSwiMjAiOjEsIjIxIjoxLCIyMiI6IkRpc2FibGVkIiwiMjMiOjAsIjI0Ijp0cnVlLCIyNSI6ZmFsc2UsIjI2Ijo2MCwiMjciOjYwLCIyOCI6eyIxIjoiSml0dGVyIn0sIjI5IjoiQWx3YXlzIE9uIiwiMzAiOiJCcmVhayBMQyIsIjMxIjp0cnVlLCIzMiI6IkxlZ2FjeSIsIjMzIjowLCIzNCI6MCwiMzUiOjAsIjM2IjowLCIzNyI6MCwiMzgiOiJEaXNhYmxlZCIsIjM5IjowLCI0MCI6MCwiNDEiOjAsIjQyIjowLCI0MyI6MCwiNDQiOjEsIjQ1IjoxLCI0NiI6MSwiNDciOjEsIjQ4IjoxLCI0OSI6MSwiNTAiOiJEZWZhdWx0IiwiNTEiOjAsIjUyIjotMjUsIjUzIjozMiwiNTQiOjAsIjU1IjowLCI1NiI6MCwiNTciOjAsIjU4IjoxLCI1OSI6LTI0LCI2MCI6MjksIjYxIjowLCI2MiI6MCwiNjMiOjQsIjY0Ijo3LCI2NSI6MTAsIjY2IjoxLCI2NyI6MSwiNjgiOjEsIjY5IjoxLCI3MCI6MSwiNzEiOiJEaXNhYmxlZCIsIjcyIjowLCI3MyI6dHJ1ZSwiNzQiOmZhbHNlLCI3NSI6NTksIjc2Ijo1OSwiNzciOnsiMSI6IkFudGkgQnJ1dGVmb3JjZSJ9LCI3OCI6IkFsd2F5cyBPbiIsIjc5IjoiQnJlYWsgTEMiLCI4MCI6dHJ1ZSwiODEiOiJSYW5kb20iLCI4MiI6MCwiODMiOjAsIjg0Ijo4OSwiODUiOjcwLCI4NiI6MCwiODciOiJFeHBsb2l0IiwiODgiOjAsIjg5IjowLCI5MCI6MCwiOTEiOjAsIjkyIjowLCI5MyI6MSwiOTQiOjEsIjk1IjoxNjEsIjk2Ijo2LCI5NyI6MTY1LCI5OCI6NiwiOTkiOiJEZWZhdWx0IiwiMTAwIjowLCIxMDEiOjAsIjEwMiI6MCwiMTAzIjowLCIxMDQiOjAsIjEwNSI6MCwiMTA2IjowLCIxMDciOjEsIjEwOCI6MCwiMTA5IjowLCIxMTAiOjAsIjExMSI6MCwiMTEyIjoxLCIxMTMiOjEsIjExNCI6MSwiMTE1IjoxLCIxMTYiOjEsIjExNyI6MSwiMTE4IjoxLCIxMTkiOjEsIjEyMCI6IkRpc2FibGVkIiwiMTIxIjowLCIxMjIiOnRydWUsIjEyMyI6dHJ1ZSwiMTI0Ijo2MCwiMTI1Ijo2MCwiMTI2Ijp7fSwiMTI3IjoiQWx3YXlzIE9uIiwiMTI4IjoiQnJlYWsgTEMiLCIxMjkiOnRydWUsIjEzMCI6Ik9mZnNldCIsIjEzMSI6MCwiMTMyIjowLCIxMzMiOjAsIjEzNCI6MCwiMTM1IjotNjUsIjEzNiI6IlN3aXRjaCIsIjEzNyI6LTYwLCIxMzgiOjYwLCIxMzkiOjAsIjE0MCI6MCwiMTQxIjowLCIxNDIiOjEsIjE0MyI6MSwiMTQ0IjoxLCIxNDUiOjEsIjE0NiI6MSwiMTQ3IjoxLCIxNDgiOiJEZWZhdWx0IiwiMTQ5IjowLCIxNTAiOjAsIjE1MSI6MCwiMTUyIjowLCIxNTMiOjAsIjE1NCI6MCwiMTU1IjowLCIxNTYiOjEsIjE1NyI6MCwiMTU4IjowLCIxNTkiOjAsIjE2MCI6MCwiMTYxIjoxLCIxNjIiOjEsIjE2MyI6MSwiMTY0IjoxLCIxNjUiOjEsIjE2NiI6MSwiMTY3IjoxLCIxNjgiOjEsIjE2OSI6IkRpc2FibGVkIiwiMTcwIjowLCIxNzEiOnRydWUsIjE3MiI6ZmFsc2UsIjE3MyI6NjAsIjE3NCI6NjAsIjE3NSI6eyIxIjoiSml0dGVyIiwiMiI6IlJhbmRvbWl6ZSBKaXR0ZXIifSwiMTc2IjoiQWx3YXlzIE9uIiwiMTc3IjoiQnJlYWsgTEMiLCIxNzgiOnRydWUsIjE3OSI6IlJhbmRvbSIsIjE4MCI6MCwiMTgxIjowLCIxODIiOi01MywiMTgzIjo3NywiMTg0IjowLCIxODUiOiJFeHBsb2l0IiwiMTg2IjowLCIxODciOjAsIjE4OCI6MCwiMTg5IjowLCIxOTAiOjAsIjE5MSI6MSwiMTkyIjoxLCIxOTMiOjEsIjE5NCI6MSwiMTk1IjoxNTMsIjE5NiI6NSwiMTk3IjoiTGVmdCAmIFJpZ2h0IiwiMTk4IjowLCIxOTkiOi00LCIyMDAiOjUsIjIwMSI6MCwiMjAyIjowLCIyMDMiOjAsIjIwNCI6MCwiMjA1IjoxLCIyMDYiOjAsIjIwNyI6MCwiMjA4IjowLCIyMDkiOjAsIjIxMCI6MSwiMjExIjoxLCIyMTIiOjEsIjIxMyI6MSwiMjE0IjoxLCIyMTUiOjEsIjIxNiI6MSwiMjE3IjoxLCIyMTgiOiJDZW50ZXIiLCIyMTkiOi01NSwiMjIwIjp0cnVlLCIyMjEiOmZhbHNlLCIyMjIiOjYwLCIyMjMiOjYwLCIyMjQiOnsiMSI6IkppdHRlciJ9LCIyMjUiOiJPbiBQZWVrIiwiMjI2IjoiRmF2b3IgRmlyZSBSYXRlIiwiMjI3IjpmYWxzZSwiMjI4IjoiT2Zmc2V0IiwiMjI5IjowLCIyMzAiOjAsIjIzMSI6MCwiMjMyIjowLCIyMzMiOjAsIjIzNCI6IkRpc2FibGVkIiwiMjM1IjowLCIyMzYiOjAsIjIzNyI6MCwiMjM4IjowLCIyMzkiOjAsIjI0MCI6MSwiMjQxIjoxLCIyNDIiOjEsIjI0MyI6MSwiMjQ0IjoxLCIyNDUiOjEsIjI0NiI6IkxlZnQgJiBSaWdodCIsIjI0NyI6MCwiMjQ4IjotNCwiMjQ5Ijo1LCIyNTAiOjAsIjI1MSI6MCwiMjUyIjowLCIyNTMiOjAsIjI1NCI6MSwiMjU1IjowLCIyNTYiOjAsIjI1NyI6MCwiMjU4IjowLCIyNTkiOjEsIjI2MCI6MSwiMjYxIjoxLCIyNjIiOjEsIjI2MyI6MSwiMjY0IjoxLCIyNjUiOjEsIjI2NiI6MSwiMjY3IjoiQ2VudGVyIiwiMjY4IjotNTgsIjI2OSI6dHJ1ZSwiMjcwIjpmYWxzZSwiMjcxIjo2MCwiMjcyIjo2MCwiMjczIjp7IjEiOiJKaXR0ZXIifSwiMjc0IjoiT24gUGVlayIsIjI3NSI6IkZhdm9yIEZpcmUgUmF0ZSIsIjI3NiI6ZmFsc2UsIjI3NyI6Ik9mZnNldCIsIjI3OCI6MCwiMjc5IjowLCIyODAiOjAsIjI4MSI6MCwiMjgyIjowLCIyODMiOiJEaXNhYmxlZCIsIjI4NCI6MCwiMjg1IjowLCIyODYiOjAsIjI4NyI6MCwiMjg4IjowLCIyODkiOjEsIjI5MCI6MSwiMjkxIjoxLCIyOTIiOjEsIjI5MyI6MSwiMjk0IjoxLCIyOTUiOiIzLVdheSBEZWxheSIsIjI5NiI6MCwiMjk3IjowLCIyOTgiOjAsIjI5OSI6MCwiMzAwIjowLCIzMDEiOjAsIjMwMiI6MCwiMzAzIjoxLCIzMDQiOi0yMywiMzA1IjoyOCwiMzA2IjowLCIzMDciOjAsIjMwOCI6NCwiMzA5Ijo3LCIzMTAiOjEwLCIzMTEiOjEsIjMxMiI6MSwiMzEzIjoxLCIzMTQiOjEsIjMxNSI6MSwiMzE2IjoiRGlzYWJsZWQiLCIzMTciOjAsIjMxOCI6dHJ1ZSwiMzE5IjpmYWxzZSwiMzIwIjo2MCwiMzIxIjo2MCwiMzIyIjp7IjEiOiJKaXR0ZXIifSwiMzIzIjoiQWx3YXlzIE9uIiwiMzI0IjoiQnJlYWsgTEMiLCIzMjUiOnRydWUsIjMyNiI6IlJhbmRvbSIsIjMyNyI6MCwiMzI4IjowLCIzMjkiOi01NSwiMzMwIjo4MCwiMzMxIjowLCIzMzIiOiJTcGluIiwiMzMzIjowLCIzMzQiOjAsIjMzNSI6MCwiMzM2IjowLCIzMzciOjAsIjMzOCI6MSwiMzM5IjoxLCIzNDAiOjExMCwiMzQxIjo1LCIzNDIiOjEsIjM0MyI6MX0sIjMiOnt9LCI0Ijp7fSwiNSI6e319")
end)
-- arrows

local a = 255
events.render:set(function()
    if not globals.is_in_game then return end
    local localplayer = entity.get_local_player()
    if not localplayer:is_alive() then return end
    local velocity = vector(localplayer["m_vecVelocity[0]"], localplayer["m_vecVelocity[1]"], localplayer["m_vecVelocity[2]"]):length2d()
    if menu.anti_aim.visuals.ts:get() then
        if menu.anti_aim.visuals.ts.ts_type:get() == "Adaptive" then
            local r, g, b = menu.anti_aim.visuals.ts.accent_color:get().r, menu.anti_aim.visuals.ts.accent_color:get().g, menu.anti_aim.visuals.ts.accent_color:get().b
            act = { r, g, b , a }
            off = { 100, 100, 100, a}
            local gt_colorelft = menu.anti_aim.addons.manual_yaw_base:get() == "Left" and act or off
            local gt_coloright = menu.anti_aim.addons.manual_yaw_base:get() == "Right" and act or off
            local gt_colodis = menu.anti_aim.addons.manual_yaw_base:get() == "Disabled" and act or off
            render.text(font.verdana_bold, vector(screen_size.x/2 - 55, screen_size.y/2), color(gt_colorelft[1], gt_colorelft[2], gt_colorelft[3], a) ,"c", "⮜")
            render.text(font.verdana_bold, vector(screen_size.x/2 + 55, screen_size.y/2), color(gt_coloright[1], gt_coloright[2], gt_coloright[3], a), "c", "⮞")
            render.text(font.verdana_bold, vector(screen_size.x/2, screen_size.y/2 + 50), color(gt_colodis[1], gt_colodis[2], gt_colodis[3], a), "c", "⮟")
        elseif menu.anti_aim.visuals.ts.ts_type:get() == "Legacy" then
            local r, g, b = menu.anti_aim.visuals.ts.accent_color:get().r, menu.anti_aim.visuals.ts.accent_color:get().g, menu.anti_aim.visuals.ts.accent_color:get().b
            act = { r, g, b , a }
            off = { 100, 100, 100, a}
            local gt_colorelft = menu.anti_aim.addons.manual_yaw_base:get() == "Left" and act or off
            local gt_coloright = menu.anti_aim.addons.manual_yaw_base:get() == "Right" and act or off
            local gt_colodis = menu.anti_aim.addons.manual_yaw_base:get() == "Disabled" and act or off
            render.text(font.verdana_bold2, vector(screen_size.x/2 - 55, screen_size.y/2), color(gt_colorelft[1], gt_colorelft[2], gt_colorelft[3], a) ,"c", "<")
            render.text(font.verdana_bold2, vector(screen_size.x/2 + 55, screen_size.y/2), color(gt_coloright[1], gt_coloright[2], gt_coloright[3], a), "c", ">")
            render.text(font.verdana_bold3, vector(screen_size.x/2, screen_size.y/2 + 50), color(gt_colodis[1], gt_colodis[2], gt_colodis[3], a), "c", "V")
        elseif menu.anti_aim.visuals.ts.ts_type:get() == "TeamSkeet" then
            render.poly(menu.anti_aim.addons.manual_yaw_base:get() == "Right" and menu.anti_aim.visuals.ts.ts_cl1:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 + 55, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 + 42, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 42, screen_size.y / 2 - 2 + 11))
            render.poly(menu.anti_aim.addons.manual_yaw_base:get() == "Left" and menu.anti_aim.visuals.ts.ts_cl1:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 - 55, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 - 42, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 42, screen_size.y / 2 - 2 + 11))
            render.rect(vector(screen_size.x / 2 + 40, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 38 + 2, screen_size.y / 2 - 2 - 7 + 18), libs.aa_library.get_inverter_state() == true and menu.anti_aim.visuals.ts.ts_cl2:get() or color(35, 35, 35, 150))
            render.rect(vector(screen_size.x / 2 - 40, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 38, screen_size.y / 2 - 2 - 7 + 18), libs.aa_library.get_inverter_state() == false and menu.anti_aim.visuals.ts.ts_cl2:get() or color(35, 35, 35, 150))
        elseif menu.anti_aim.visuals.ts.ts_type:get() == "TeamSkeet Velocity" then
            render.poly(menu.anti_aim.addons.manual_yaw_base:get() == "Right" and menu.anti_aim.visuals.ts.ts_cl1:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 + 55 + velocity / 6, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 + 42 + velocity / 6, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 42 + velocity / 6, screen_size.y / 2 - 2 + 11))
            render.poly(menu.anti_aim.addons.manual_yaw_base:get() == "Left" and menu.anti_aim.visuals.ts.ts_cl1:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 - 55 - velocity / 6, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 - 42 - velocity / 6, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 42 - velocity / 6, screen_size.y / 2 - 2 + 11))
            render.rect(vector(screen_size.x / 2 + 40 + velocity / 6, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 38 + 2 + velocity / 6, screen_size.y / 2 - 2 - 7 + 18), libs.aa_library.get_inverter_state() == true and menu.anti_aim.visuals.ts.ts_cl2:get() or color(35, 35, 35, 150))
            render.rect(vector(screen_size.x / 2 - 40 - velocity / 6, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 38 - velocity / 6, screen_size.y / 2 - 2 - 7 + 18), libs.aa_library.get_inverter_state() == false and menu.anti_aim.visuals.ts.ts_cl2:get() or color(35, 35, 35, 150))
        end
    end
end)
-- arrows end

-- legs
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
    } animstate_layer_t;
]]
local uintptr_t = ffi.typeof("uintptr_t**")
local get_entity_address = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
local animslsg = nil

events.post_update_clientside_animation:set(function()
    local localplayer = entity.get_local_player()
    local move = math.sqrt(localplayer.m_vecVelocity.x ^ 2 + localplayer.m_vecVelocity.y ^ 2) > 5
    local jump = bit.band(localplayer.m_fFlags, 1) == 0
    animslsg = get_entity_address(localplayer:get_index())
    if menu.anti_aim.visuals.legs_jitter:get() then
        if menu.anti_aim.visuals.legs_jitter.air_combo:get() == "Static" then
            localplayer.m_flPoseParameter[6] = 1
        elseif menu.anti_aim.visuals.legs_jitter.air_combo:get() == "Kangaroo" then
            localplayer.m_flPoseParameter[6] = utils.random_float(0, 1)
        elseif menu.anti_aim.visuals.legs_jitter.air_combo:get() == "Walking" then
            ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][6].m_flWeight = 1
        end
        if menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Flex" then
            refs.legs:override("Walking")
            localplayer.m_flPoseParameter[7] = utils.random_float(0.5, 1)
        elseif menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Walking" then
            refs.legs:override("Walking")
            localplayer.m_flPoseParameter[7] = 1
        elseif menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Static" then
            refs.legs:override("Sliding")
            localplayer.m_flPoseParameter[0] = 0
        elseif menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Fast Jitter" then
            refs.legs:override("Sliding")
            localplayer.m_flPoseParameter[0] = utils.random_float(0, 1)
        elseif menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Slow Jitter" then
            refs.legs:override("Sliding")
            localplayer.m_flPoseParameter[0] = globals.tickcount%4 > 1 and menu.anti_aim.visuals.legs_jitter.slider_jitter:get()/100 or 1
        end
        if menu.anti_aim.visuals.legs_jitter.walk_combo:get() == "Jitter" then
            localplayer.m_flPoseParameter[9] = utils.random_float(0.0, 1.0)
        elseif menu.anti_aim.visuals.legs_jitter.walk_combo:get() == "Static" then
            localplayer.m_flPoseParameter[9] = 0
        elseif menu.anti_aim.visuals.legs_jitter.walk_combo:get() == "Pirat" then
            localplayer.m_flPoseParameter[9] = 0.4
        end
        if menu.anti_aim.visuals.legs_jitter.other_combo:get("Earthquake") then
            ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = utils.random_float(0.0, 1.0)
        elseif menu.anti_aim.visuals.legs_jitter.other_combo:get("Move Lean") and move then
            ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = 1
        end
    end
end)
-- legs
-- Aimbot logs
local f, rep = string.format, string.rep;
local logger = {};
logger.id = 0;
logger.hitgroup = {
    [ 0 ] = 'generic',
    'head',
    'chest',
    'stomach',
    'left arm',
    'right arm',
    'left leg',
    'right leg',
    'neck',
    '?',
    'gear'
};
logger.state = {
    [ 'correction' ] = 'resolver',
    [ 'player death' ] = 'enemy death',
    [ 'backtrack failure' ] = 'lagcomp failure'
};
logger.verb = {
    [ 'knife' ] = 'Knifed',
    [ 'inferno' ] = 'Burned',
    [ 'hegrenade' ] = 'Naded'
};
logger.bell_pattern = f('\\a%s', rep('%%X', 6));
logger.remove_bell = function(s)
    return s:gsub(logger.bell_pattern, '')
end
logger.get_id = function()
    return logger.id % (1000 + 1)
end
logger.miss = function(e)
    local state = logger.state[ e.state ] or e.state;
    if menu.anti_aim.visuals2.aimlogs:get() then
        print_dev(f(
            '\aFFFFFFFFMissed shot \aFFA0A0FF%s\aFFFFFFFF\'s \aFFA0A0FF%s \aFFFFFFFFdue to \aFFA0A0FF%s \aFFFFFFFF[hitchance: \aFFA0A0FF%d%%\aFFFFFFFF, history: \aFFA0A0FF%d\aFFFFFFFF]',
            e.target:get_name(), logger.hitgroup[ e.wanted_hitgroup ] or '?', state, e.hitchance, e.backtrack
        ));

        print_raw(f(
            '\aFFFFFFFFMissed shot \aFFA0A0FF%s\aFFFFFFFF\'s \aFFA0A0FF%s \aFFFFFFFFdue to \aFFA0A0FF%s \aFFFFFFFF[hitchance: \aFFA0A0FF%d%%\aFFFFFFFF, history: \aFFA0A0FF%d\aFFFFFFFF]',
            e.target:get_name(), logger.hitgroup[ e.wanted_hitgroup ] or '?', state, e.hitchance, e.backtrack
        ));
    end
end
logger.hit = function(e)
    if menu.anti_aim.visuals2.aimlogs:get() then
        print_dev(f(
            '\aFFFFFFFFHit \aD1FF46FF%s\aFFFFFFFF\'s \aD1FF46FF%s \aFFFFFFFFfor \aD1FF46FF%d\aFFFFFFFF(\aD1FF46FF%d\aFFFFFFFF) damage (\aD1FF46FF%d \aFFFFFFFFhp remaining) [history = \aD1FF46FF%d\aFFFFFFFF, aimed = \aD1FF46FF%s\aFFFFFFFF]',
            e.target:get_name(), logger.hitgroup[ e.hitgroup ] or '?', e.damage, e.wanted_damage, e.target.m_iHealth, e.backtrack, logger.hitgroup[ e.wanted_hitgroup ] or '?'
        ));
    
        print_raw(f(
            '\aFFFFFFFFHit \aD1FF46FF%s\aFFFFFFFF\'s \aD1FF46FF%s \aFFFFFFFFfor \aD1FF46FF%d\aFFFFFFFF(\aD1FF46FF%d\aFFFFFFFF) damage (\aD1FF46FF%d \aFFFFFFFFhp remaining) [history = \aD1FF46FF%d\aFFFFFFFF, aimed = \aD1FF46FF%s\aFFFFFFFF]',
            e.target:get_name(), logger.hitgroup[ e.hitgroup ] or '?', e.damage, e.wanted_damage, e.target.m_iHealth, e.backtrack, logger.hitgroup[ e.wanted_hitgroup ] or '?'
        ));
    end
end
logger.player_hurt = function(e)
    local lp = entity.get_local_player();
    local userid = entity.get(e.userid, true);
    local attacker = entity.get(e.attacker, true);

    if attacker ~= lp or userid == lp then
        return
    end

    local verb = logger.verb[ e.weapon ];

    if verb == nil then
        return
    end
    if menu.anti_aim.visuals2.aimlogs:get() then
        print_dev(f(
            '\aFFFFFFFF%s \aCDFFA6FF%s \aFFFFFFFFfor \aCDFFA6FF%d \aFFFFFFFFdamage (\aCDFFA6FF%d \aFFFFFFFFhp remaining)',
            verb, userid:get_name(), e.dmg_health, e.health
        ));
    
        print_raw(f(
            '\aFFFFFFFF%s \aCDFFA6FF%s \aFFFFFFFFfor \aCDFFA6FF%d \aFFFFFFFFdamage (\aCDFFA6FF%d \aFFFFFFFFhp remaining)',
            verb, userid:get_name(), e.dmg_health, e.health
        ));
    end
end
events.player_connect_full:set(function(e)
    local lp = entity.get_local_player();
    local userid = entity.get(e.userid, true);

    if lp ~= userid then
        return
    end

    logger.id = -1;
end)
events.aim_fire:set(function(e)
    logger.id = logger.id + 1;
end);
events.aim_ack:set(function(e)
    (e.state and logger.miss or logger.hit)(e);
end);
events.player_hurt:set(logger.player_hurt);

-- skeet
local size = render.screen_size()

local find = {
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
}

local a = 0
local indicator = function(string, ay, clr)
    if not globals.is_in_game then return end
    local localplayer = entity.get_local_player()
    if not localplayer:is_alive() then return end
    if menu.anti_aim.visuals.gs_ind:get() then
        if m_bIsScoped then
            a = lerpik(a, 17, 10)
        else
            a = lerpik(a, 0, 10)
        end

        local x, y = render.screen_size().x/2 , render.screen_size().y/3
        render.text(4, vector(x + a, y + 13 + ay), clr, "c", string)
    end
end

local get_bind_state = function(name)
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

local handle = function()
    if menu.anti_aim.visuals.gs_ind:get() then
        local lp = entity.get_local_player()
        local new_add = 9
        local old_add = 0
    
        local skeet_bind = {
            {"HC", menu.anti_aim.visuals.gs_ind.indicator_list2:get("HC") and get_bind_state("Hit Chance")[1], color(255, 200)},
            {"DA", menu.anti_aim.visuals.gs_ind.indicator_list2:get("DA") and find.da:get(), color(255, 200)},
            {"PING", menu.anti_aim.visuals.gs_ind.indicator_list2:get("PING") and find.ping:get() > 0 and localplayer:is_alive(), color(255, 200)},
            {"FD", menu.anti_aim.visuals.gs_ind.indicator_list2:get("FD") and find.fd:get(), color(255, 200)},
            {"BODY", menu.anti_aim.visuals.gs_ind.indicator_list2:get("BODY") and find.body:get() == "Force", color(255, 200)},
            {"SAFE", menu.anti_aim.visuals.gs_ind.indicator_list2:get("SAFE") and find.safe:get() == "Force", color(255, 200)},
            {"MD", menu.anti_aim.visuals.gs_ind.indicator_list2:get("MD") and get_bind_state("Min. Damage")[1], color(255, 200)},
            {"DT", menu.anti_aim.visuals.gs_ind.indicator_list2:get("DT") and find.dt:get(), rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 0, 255)},
            {"HS", menu.anti_aim.visuals.gs_ind.indicator_list2:get("HS") and find.hs:get(), color(255, 200)},
            {"PEEK", menu.anti_aim.visuals.gs_ind.indicator_list2:get("PEEK") and find.peek:get(), color(255, 200)},
        }
    
        for k, v in pairs(skeet_bind) do
            if v[2] then
                indicator(v[1], old_add, v[3], v[4], v[5])
                old_add = old_add - new_add
            end
        end
    end
end

-- scope2
local zoomoffset = 0
events.override_view:set(function(tbl)
    if menu.anti_aim.visuals.animate_zoom:get() then
        local lp = entity.get_local_player()
        if lp == nil then return end
    
        local weapon = lp:get_player_weapon()
        if weapon == nil then return end
    
        local zoom_fov = 0
    
        if lp.m_bIsScoped then
            if weapon.m_zoomLevel == 1 then
                zoom_fov = 10
            elseif weapon.m_zoomLevel == 2 then
                zoom_fov = 20
            end
        end
    
        if lp.m_bIsScoped then
            zoomoffset = lerpik(zoomoffset, refs.fov:get() - zoom_fov, 12)
        else
            zoomoffset = lerpik(zoomoffset, refs.fov:get(), 12)
        end
    
        tbl.fov = zoomoffset
    end
end)

-- visuals_visibility
set_visibility = function()
    menu.anti_aim.visuals2.aspect_ratio.aspect_ratio_value:visibility(menu.anti_aim.visuals2.aspect_ratio:get())
    menu.anti_aim.visuals.ts:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals2.aspect_ratio:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals2.viewmodel:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals2.aimlogs:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals.legs_jitter:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals.legs_jitter.slider_jitter:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3 and menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Slow Jitter")
    menu.anti_aim.visuals.customscope:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.info.link_discord:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.info.link_youtube:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.info.link_config:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.info.welcome_username:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.info.welcome_build:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.info.welcome_update:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 1)
    menu.anti_aim.visuals.ts.accent_color:visibility(menu.anti_aim.visuals.ts:get() and menu.anti_aim.visuals.ts.ts_type:get() == "Adaptive"  or menu.anti_aim.visuals.ts.ts_type:get() == "Legacy" or menu.anti_aim.visuals.ts.ts_type:get() == "Invictus" or menu.anti_aim.visuals.ts.ts_type:get() == "Onetap")
    menu.anti_aim.visuals.ts.ts_cl1:visibility(menu.anti_aim.visuals.ts:get() and menu.anti_aim.visuals.ts.ts_type:get() == "TeamSkeet")
    menu.anti_aim.visuals.ts.ts_cl2:visibility(menu.anti_aim.visuals.ts:get() and menu.anti_aim.visuals.ts.ts_type:get() == "TeamSkeet" or menu.anti_aim.visuals.ts.ts_type:get() == "TeamSkeet Velocity")
    menu.anti_aim.visuals.gs_ind:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals.clantag52:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    menu.anti_aim.visuals.animate_zoom:visibility(menu.anti_aim.tab_switch.tab_switcher:get() == 3)
    -- gear
    menu.anti_aim.visuals.ts.ts_type:visibility(menu.anti_aim.visuals.ts:get())
    menu.anti_aim.visuals.customscope.scopetype:visibility(menu.anti_aim.visuals.customscope:get())
    menu.anti_aim.visuals.customscope.scopeGap:visibility(menu.anti_aim.visuals.customscope:get())
    menu.anti_aim.visuals.customscope.scopeLength:visibility(menu.anti_aim.visuals.customscope:get())
    menu.anti_aim.visuals.customscope.scopeColor:visibility(menu.anti_aim.visuals.customscope:get())
    menu.anti_aim.visuals2.viewmodel.viewmodel_fov:visibility(menu.anti_aim.visuals2.viewmodel:get())
    menu.anti_aim.visuals2.viewmodel.viewmodel_x:visibility(menu.anti_aim.visuals2.viewmodel:get())
    menu.anti_aim.visuals2.viewmodel.viewmodel_y:visibility(menu.anti_aim.visuals2.viewmodel:get())
    menu.anti_aim.visuals2.viewmodel.viewmodel_z:visibility(menu.anti_aim.visuals2.viewmodel:get())
    menu.anti_aim.addons.freestanding.freestanding_body_freestanding:visibility(menu.anti_aim.addons.freestanding:get())
    menu.anti_aim.addons.freestanding.freestanding_yaw_modifier:visibility(menu.anti_aim.addons.freestanding:get())
    menu.anti_aim.visuals.legs_jitter.jitter_combo:visibility(menu.anti_aim.visuals.legs_jitter:get())
    menu.anti_aim.visuals.legs_jitter.slider_jitter:visibility(menu.anti_aim.visuals.legs_jitter:get() and menu.anti_aim.visuals.legs_jitter.jitter_combo:get() == "Slow Jitter")
    menu.anti_aim.visuals.legs_jitter.air_combo:visibility(menu.anti_aim.visuals.legs_jitter:get())
    menu.anti_aim.visuals.legs_jitter.walk_combo:visibility(menu.anti_aim.visuals.legs_jitter:get())
    menu.anti_aim.visuals.legs_jitter.other_combo:visibility(menu.anti_aim.visuals.legs_jitter:get())
    menu.anti_aim.visuals.gs_ind.indicator_list2:visibility(menu.anti_aim.visuals.gs_ind:get())
end
-- visuals_visibility end

-- callback
local b = 0
events.createmove:set(function(cmd) anti_aim(cmd) end)
events.render:set(function()
    anti_aim_visible()
    set_visibility()
    customscope()
    set_visibility() 
    handle()
    aspect()
    if menu.anti_aim.visuals.clantag52:get() then
        clan_tag(ct_animation())
    else
        clan_tag(" ")
    end
end)
-- callback end