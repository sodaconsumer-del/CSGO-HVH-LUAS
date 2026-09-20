try_require = function(module, message)   --best lua system

    local success, result = pcall(require, module)

    if success then 
        return result 
    else 
        return error(message) 
    end
end
local loader = {
    username = 'scriptleaks',
    build = "Early",
    last_update = "July 27"
}

if loader.username == "Papi" then 
    loader.build = "Source"
end

local menu_color_ref = ui.reference("misc", "settings", "menu color")

local function get_menu_color_rgb()
    local r, g, b, a = ui.get(menu_color_ref)
    return r, g, b, a
end

client.exec('clear')

local r, g, b, a = get_menu_color_rgb()


client.color_log(r, g, b, [[                                                       
                                       #########                                       
                                     ###### ######                                     
                                     ###       ###                                     
                                   ####         ####                                   
                                   ###           ###                                   
                 ##########       ###             ###       ##########                 
               #####################               #####################               
              ####            #######             #######            ####              
              ###               ########       ########               ###              
              ###               ##    ##### #####    ##               ###              
              ####          #####         ###         #####          ####              
               ###         ############         ############         ###               
                ###        #################################         ###               
                ####          ###########################          ####                
                 ###    #######  #####################   %%        ###                 
               ##########           ###############           %%%%###                  
          ######## ####   ###           #######           ###   #### %%@@              
        #####        ###   #####          ###          #####   ###       @@@           
      #####           ###   ########               ########   ###          @@@         
     ####               ### ###########         ##########  ###              @@@       
     ###                %%##  ###########     ###########  ##%                @@       
     ####              %%  ## ###########     ########### ##  %%             @@@       
      #####           %%    #############     ######### ##     %%           @@         
        #####        %%         #########     #########%%       %%       @@@           
          #########%%%           ########     ######## %%        %%  @@@@@             
               ############       #######     #######  %%     %@@@%%@                  
                  %%   ###################### ###### %%%%%@        %%                  
                 %%%                #####     #####   %%%          %%%                 
                %%%             %    ####     ####    %%            %%                 
                %%%             %%    ###     ###    %%%            %%%                
                %%              %%          @@@@     %%             %%%                
                %%@             ####           @@@@@%%%             %%%                
                %%%             ####              %@%%%%            %%%                
                 %%%%%%%%%%%%%%% #%%               %%%%%%%%%%%%%%%%%%%                 
                    %%%%%%        %%              @%%       @%%%%%%                    
                                   %%            %%%%                                  
                                   %%%          %%%%                                   
                                     %%        %%%                                     
                                     %%%%     %%%                                      
                                       %%%%%%%%%                                       
                                                                                       
                                                                                       
                                                                     ]])
client.color_log(r, g, b, string.format([[ 
                                     
                 Welcome back, %s  
                 Your build is %s 
                 Last update %s     
]], loader.username, loader.build, loader.last_update))


local floor, cos, sin, pi, min = math.floor, math.cos, math.sin, math.pi, math.min
local screen_x, screen_y = client.screen_size()
local menu_color_ref = ui.reference("misc", "settings", "menu color")

local function arc(x, y, radius, radius_inner, start_angle, end_angle, segments, color)
    local step = (end_angle - start_angle) / segments
    for i = 0, segments - 1 do
        local angle1 = (start_angle + i * step) * pi / 180
        local angle2 = (start_angle + (i + 1) * step) * pi / 180
        local x1_outer = floor(x + cos(angle1) * radius + 0.5)
        local y1_outer = floor(y + sin(angle1) * radius + 0.5)
        local x2_outer = floor(x + cos(angle2) * radius + 0.5)
        local y2_outer = floor(y + sin(angle2) * radius + 0.5)
        local x1_inner = floor(x + cos(angle1) * radius_inner + 0.5)
        local y1_inner = floor(y + sin(angle1) * radius_inner + 0.5)
        local x2_inner = floor(x + cos(angle2) * radius_inner + 0.5)
        local y2_inner = floor(y + sin(angle2) * radius_inner + 0.5)
        renderer.triangle(x1_outer, y1_outer, x2_outer, y2_outer, x1_inner, y1_inner, table.unpack(color))
        renderer.triangle(x1_inner, y1_inner, x2_outer, y2_outer, x2_inner, y2_inner, table.unpack(color))
    end
end

local function draw_rounded_rect(x, y, w, h, r, color)
    r = min(r, h / 2, w / 2)
    local segments = 50
    local rx, ry = floor(x + 0.5), floor(y + 0.5)
    renderer.rectangle(rx + r, ry, w - 2 * r, h, table.unpack(color))
    renderer.rectangle(rx, ry + r, r, h - 2 * r, table.unpack(color))
    renderer.rectangle(rx + w - r, ry + r, r, h - 2 * r, table.unpack(color))
    arc(rx + r, ry + r, r, 0, 180, 270, segments, color)
    arc(rx + w - r, ry + r, r, 0, 270, 360, segments, color)
    arc(rx + r, ry + h - r, r, 0, 90, 180, segments, color)
    arc(rx + w - r, ry + h - r, r, 0, 0, 90, segments, color)
end

local function shadow_text(x, y, text, r, g, b, a)
    renderer.text(x + 1, y + 1, 0, 0, 0, a * 0.6, "b", 0, text)
    renderer.text(x, y, r, g, b, a, "b", 0, text)
end

local function easeInOutCubic(t)
    if t < 0.5 then
        return 4 * t * t * t
    else
        local f = (2 * t) - 2
        return 0.5 * f * f * f + 1
    end
end

local logger = {
    queue = {},
    active = {},
    max_queue = 20,
    max_active = 3,
    fade_time = 0.4,
    hold_time = 2.8,
    last_switch = 0,
}

function logger.invent(text, color, icon, dynamic)
    if #logger.queue < logger.max_queue then
        table.insert(logger.queue, {
            text = text,
            color = color,
            icon = icon or nil,
            dynamic = dynamic or nil,
            start_time = nil,
            fading_out = false,
            faded_out = false,
        })
    end
end

function logger.clear()
    logger.queue = {}
    logger.active = {}
end

local function update_active(time)
    for i = #logger.active, 1, -1 do
        local notif = logger.active[i]
        if notif.faded_out then
            table.remove(logger.active, i)
            logger.last_switch = time
        end
    end
    while #logger.active < logger.max_active and #logger.queue > 0 do
        local next_notif = table.remove(logger.queue, 1)
        next_notif.start_time = time
        next_notif.fading_out = false
        next_notif.faded_out = false
        table.insert(logger.active, next_notif)
    end
end

local function get_menu_color_rgba()
    return {ui.get(menu_color_ref)}
end

client.set_event_callback("paint", function()
    local time = globals.curtime()
    update_active(time)
    local spacing = 6
    local notif_height = 28
    local base_y = screen_y - 10

    for i, notif in ipairs(logger.active) do
        local elapsed = time - notif.start_time
        local alpha = 0

        if not notif.fading_out then
            local t = min(1, elapsed / logger.fade_time)
            alpha = floor(255 * easeInOutCubic(t))
            if elapsed >= logger.hold_time then
                notif.fading_out = true
                notif.start_time = time
            end
        else
            local t = min(1, elapsed / logger.fade_time)
            alpha = floor(255 * easeInOutCubic(1 - t))
            if t >= 1 then
                notif.faded_out = true
                alpha = 0
            end
        end

        if alpha > 0 then
            local prefix = "exo"
            local prefix2 = "dus"
            local prefix_color = notif.color
            local text_w = renderer.measure_text(nil, notif.text)
            local prefix_w = renderer.measure_text(nil, prefix .. prefix2)

            local icon_w = 0
            local icon_spacing = 0
            if notif.icon then
                icon_w = renderer.measure_text(nil, notif.icon)
                icon_spacing = 6
            end

            local total_w = text_w + prefix_w + icon_w + icon_spacing + 48
            local total_h = notif_height
            local x = floor(screen_x / 2 - total_w / 2 + 0.5)
            local y = floor(base_y - (notif_height + spacing) * (i - 1) - total_h + 0.5)

            draw_rounded_rect(x, y, total_w, total_h, 12, {36, 34, 38, alpha * 0.95})
            draw_rounded_rect(x + 1, y + 1, total_w - 2, total_h - 2, 12, {20, 18, 22, alpha * 0.3})

            local content_x = x + 14

            if notif.icon then
                shadow_text(content_x, y + 6, notif.icon, prefix_color[1], prefix_color[2], prefix_color[3], alpha)
                content_x = content_x + icon_w + icon_spacing
            end

            shadow_text(content_x, y + 6, prefix, 255, 255, 255, alpha)
            shadow_text(content_x + renderer.measure_text(nil, prefix), y + 6, prefix2, prefix_color[1], prefix_color[2], prefix_color[3], alpha)

            local divider_x = content_x + prefix_w + 8
            local divider_y1 = y + 6
            local divider_y2 = y + total_h - 6
            renderer.rectangle(divider_x, divider_y1, 1, divider_y2 - divider_y1, 100, 100, 100, alpha * 0.3)

            local full_text = notif.text
            local dynamic_str = notif.dynamic or ""
            local s_start, s_end = string.find(full_text, "%%s")

            if s_start then
                local before = string.sub(full_text, 1, s_start - 1)
                local after = string.sub(full_text, s_end + 1)
                local cursor_x = divider_x + 7

                shadow_text(cursor_x, y + 7, before, 255, 255, 255, alpha)
                cursor_x = cursor_x + renderer.measure_text(nil, before)

                shadow_text(cursor_x, y + 7, dynamic_str, prefix_color[1], prefix_color[2], prefix_color[3], alpha)
                cursor_x = cursor_x + renderer.measure_text(nil, dynamic_str)

                shadow_text(cursor_x, y + 7, after, 255, 255, 255, alpha)
            else
                shadow_text(divider_x + 7, y + 7, full_text, 255, 255, 255, alpha)
            end
        end
    end
end)
logger.invent("Your current build is   %s  ", get_menu_color_rgba(), "", loader.build)
logger.invent("Welcome back,  %s ", get_menu_color_rgba(), "", loader.username)






            local ffi = try_require("ffi","FFI initialization failed, ensure 'Allow unsafe scripts' is ticked")
local bit = try_require("bit")
local vector = try_require("vector")
local base64 = try_require("gamesense/base64", " https://gamesense.pub/forums/viewtopic.php?id=21619")
local http = try_require("gamesense/http", " https://gamesense.pub/forums/viewtopic.php?id=21619")
local clipboard = try_require("gamesense/clipboard", " https://gamesense.pub/forums/viewtopic.php?id=28678")
local pui = try_require("gamesense/pui")
local angle3d_struct = ffi.typeof("struct { float pitch; float yaw; float roll; }")
local vec_struct = ffi.typeof("struct { float x; float y; float z; }")
local aa = {}
local group = pui.group("aa", "anti-aimbot angles")

local UserCMD_struct =
    ffi.typeof(
    [[
    struct
    {
        uintptr_t vfptr;
        int command_number;
        int tick_count;
        $ viewangles;
        $ aimdirection;
        float forwardmove;
        float sidemove;
        float upmove;
        int buttons;
        uint8_t exodus;
        int weaponselect;
        int weaponsubtype;
        int random_seed;
        short mousedx;
        short mousedy;
        bool hasbeenpredicted;
        $ headangles;
        $ headoffset;
        bool send_packet; 
    }
    ]],
    angle3d_struct,
    vec_struct,
    angle3d_struct,
    vec_struct
)

local char_ptr = ffi.typeof('char*')
local null_ptr = ffi.new('void*')
local class_ptr = ffi.typeof('void***')
local animation_layer_t = ffi.typeof([[
    struct {										char pad0[0x18];
        uint32_t	sequence;
        float		prev_cycle;
        float		weight;
        float		weight_delta_rate;
        float		playback_rate;
        float		cycle;
        void		*entity;						char pad1[0x4];
    } **
]])

local native_GetClientEntity = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)')


local client_sig = client.find_signature("client.dll", "\xB9\xCC\xCC\xCC\xCC\x8B\x40\x38\xFF\xD0\x84\xC0\x0F\x85") or error("Couldn't find signature!")
local get_UserCMD_struct = ffi.typeof("$* (__thiscall*)(uintptr_t ecx, int nSlot, int sequence_number)", UserCMD_struct)
local input_vtbl = ffi.typeof([[struct{uintptr_t padding[8]; $ GetUserCmd;}]], get_UserCMD_struct)
local input_vfunc_ptr  = ffi.typeof([[struct { $* vfptr; }*]], input_vtbl)
local get_input_vfunc_ptr = ffi.cast(input_vfunc_ptr , ffi.cast("uintptr_t**", tonumber(ffi.cast("uintptr_t", client_sig)) + 1)[0])

local presets = {}

local refs = {
    damage_override = {ui.reference("RAGE", "Aimbot", "Minimum damage override")},
    damage = {ui.reference("RAGE", "Aimbot", "Minimum damage")},
    fakeduck = ui.reference("RAGE", "Other", "Duck peek assist"),
    doubletap = {ui.reference("RAGE", "Aimbot", "Double tap")},
    doubletap_fl_limit = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),
    enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {ui.reference("AA", "Anti-aimbot angles", "pitch")},
    roll = ui.reference("AA", "Anti-aimbot angles", "roll"),
    yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")},
    freestanding_bodyyaw = ui.reference("AA", "anti-aimbot angles", "Freestanding body yaw"),
    edge_yaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    yawjitter = {ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    bodyyaw = {ui.reference("AA", "Anti-aimbot angles", "Body yaw")},
    freestanding = {ui.reference("AA", "Anti-aimbot angles", "Freestanding")},
    fakelag_enabled = {ui.reference("AA", "Fake lag", "Enabled")},
    fakelag_mode = ui.reference("AA", "Fake lag", "Amount"),
    fakelag_variance = ui.reference("AA", "Fake lag", "Variance"),
    fakelag_limit = ui.reference("AA", "Fake lag", "Limit"),
    onshot = {ui.reference("AA", "Other", "On shot anti-aim")},
    slow_motion = {ui.reference("AA", "Other", "Slow motion")},
    leg_movement = ui.reference("AA", "Other", "Leg movement"),
    quick_peek = {ui.reference("RAGE", "Other", "Quick peek assist")},
}




local lua = {
    database = {
        configs = ":exodus::configs:"
    },
    vars = {
        hitgroup_names = { "Generic", "Head", "Chest", "Stomach", "Left arm", "Right arm", "Left leg", "Right leg", "Neck", "?", "Gear" },
        player_states = {"Global", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving", "Fakelag"},
        player_states_abrev = {"G", "S", "M", "SW", "C", "A", "AC", "CM", "FL"},
        string_to_int = {["Global"] = 1, ["Standing"] = 2, ["Moving"] = 3, ["Slowwalking"] = 4, ["Crouching"] = 5, ["Air"] = 6, ["Air-Crouching"] = 7, ["Crouch-Moving"] = 8 , ["Fakelag"] = 9},
        int_to_string = {[1] = "Global", [2] = "Standing", [3] = "Moving", [4] = "Slowwalking", [5] = "Crouching", [6] = "Air", [7] = "Air-Crouching", [8] = "Crouch-Moving", [9] = "Fakelag"},
        active_state = 1,
        player_state = 1,
    },
    funcs = {
        table_contains = function(tbl, value)
            for i = 1, #tbl do
                if tbl[i] == value then
                    return true
                end
            end
            return false
        end,
        reset_antiaim_tab = function(ref)
            ui.set_visible(refs.enabled, ref)
            ui.set_visible(refs.pitch[1], ref)
            ui.set_visible(refs.pitch[2], ref)
            ui.set_visible(refs.roll, ref)
            ui.set_visible(refs.yaw_base, ref)
            ui.set_visible(refs.yaw[1], ref)
            ui.set_visible(refs.yaw[2], ref)
            ui.set_visible(refs.yawjitter[1], ref)
            ui.set_visible(refs.yawjitter[2], ref)
            ui.set_visible(refs.bodyyaw[1], ref)
            ui.set_visible(refs.bodyyaw[2], ref)
            ui.set_visible(refs.freestanding[1], ref)
            ui.set_visible(refs.freestanding[2], ref)
            ui.set_visible(refs.freestanding_bodyyaw, ref)
            ui.set_visible(refs.edge_yaw, ref)
        end,
        default_antiaim_tab = function()
            ui.set(refs.enabled, true)
            ui.set(refs.pitch[1], "Off")
            ui.set(refs.pitch[2], 0)
            ui.set(refs.roll, 0)
            ui.set(refs.yaw_base, "local view")
            ui.set(refs.yaw[1], "Off")
            ui.set(refs.yaw[2], 0)
            ui.set(refs.yawjitter[1], "Off")
            ui.set(refs.yawjitter[2], 0)
            ui.set(refs.bodyyaw[1], "Off")
            ui.set(refs.bodyyaw[2], 0)
            ui.set(refs.freestanding[1], false)
            ui.set(refs.freestanding[2], "On hotkey")
            ui.set(refs.freestanding_bodyyaw, false)
            ui.set(refs.edge_yaw, false)
            ui.set(refs.fakelag_enabled[1], true)
            ui.set(refs.fakelag_enabled[2], "Always On")
            ui.set(refs.fakelag_mode, "Maximum")
            ui.set(refs.fakelag_variance, 0)
            ui.set(refs.fakelag_limit, 14)
        end,
        normalize = function(angle)
            return (angle + 180) % 360 - 180
        end,
        vec_angles = function(angle_x, angle_y)
            rad_angle_x = math.rad(angle_x)
            rad_angle_y = math.rad(angle_y)
            sy = math.sin(rad_angle_y)
            cy = math.cos(rad_angle_y)
            sp = math.sin(rad_angle_x)
            cp = math.cos(rad_angle_x)
            return cp * cy, cp * sy, -sp
        end,
        hex = function(arg)
            result = "\a"
            for _, value in pairs(arg) do
                output = string.format("%02X", value)
                result = result .. output
            end
            return result .. "FF"
        end,
        rgba_hex = function(r, g, b, a)
            return string.format("%02X%02X%02X%02X", r, g, b, a)
        end,
        create_color_array = function(r, g, b, str)
            local colors = {}
            local curtime = globals.curtime()
            local cos_base = 2 * math.pi * curtime / 4
        
            for i = 0, #str do
                local alpha = 255 * math.abs(math.cos(cos_base + i * 5 / 30))
                colors[#colors + 1] = {r, g, b, alpha}
            end
        
            return colors
        end,

        get_player_weapons = function(idx)
            local list = {}
        
            for i = 0, 64 do
                local cwpn = entity.get_prop(idx, "m_hMyWeapons", i)
        
                if cwpn ~= nil then
                    table.insert(list, cwpn)
                end
            end
        
            return list
        end,
    }
}
local tab, container_aa, container_fl, container_other = "AA", "Anti-aimbot angles", "Fake lag", "Other"

local label2 = ui.new_label(tab, container_aa, "\n")
local tab_selection = ui.new_combobox(tab, container_aa, "\nTab", " Home", " Anti-Aimbot", " Tools")

local label_3 = ui.new_label(tab, container_fl, "\n")
local edit_labels = ui.new_combobox(tab, container_fl, "\nStyle", " Information", " Cloud")

local space = ui.new_label(tab, container_fl, "\n")
local welcome_label = ui.new_label(tab, container_fl, "\n")
local build_label = ui.new_label(tab, container_fl, "\n")
local online_users_label = ui.new_label(tab, container_fl, "\n")

local build_version = "v1.0.3"
local online_users = 2

local antiaim_tabs_icons = ui.new_label(tab, container_other, "\n")
local antiaim_tabs = ui.new_combobox(tab, container_other, "\n", " Constructor", " Assistant", " Quick Binds")

local gray = "\a343434FF"

-- Menu color reference
local menu_color_ref = ui.reference("misc", "settings", "menu color")
local function get_lua_color()
    local r, g, b, a = ui.get(menu_color_ref)
    return string.format("\a%02X%02X%02X%02X", r, g, b, a)
end

-- RGBA -> \aRRGGBBAA
local function rgba_to_colorcode(r, g, b, a)
    return string.format("\a%02X%02X%02X%02X", r, g, b, a)
end
local function get_menu_color()
    local r, g, b, a = ui.get(menu_color_ref)
    return string.format("\a%02X%02X%02X%02X", r, g, b, a)
end

local lua_color = get_menu_color()


local function update_labels()
    local main_selected = ui.get(tab_selection)
    local style_selected = ui.get(edit_labels)

    local menu_r, menu_g, menu_b, menu_a = ui.get(menu_color_ref)
    local menu_hex = rgba_to_colorcode(menu_r, menu_g, menu_b, menu_a)

    local icon_info = gray..""
    local icon_cloud = gray..""
    local dot = gray.."  •  "

    if main_selected == " Home" then
        ui.set_visible(edit_labels, true)
        ui.set_visible(label_3, true)
        ui.set_visible(welcome_label, true)
        ui.set_visible(build_label, true)
        ui.set_visible(online_users_label, true)
        ui.set_visible(space, true)

        ui.set(welcome_label, menu_hex.."  \affffffffWelcome back to "..menu_hex.."Exodus\affffffff, "..menu_hex..(loader and loader.username or "guest"))
        ui.set(build_label, menu_hex.."  \affffffffYour current build is "..menu_hex..(loader and loader.build or build_version))
        ui.set(online_users_label, menu_hex.."⛹ \affffffffNetworked "..menu_hex.."Users \affffffffOnline "..menu_hex..online_users)
    else
        ui.set_visible(edit_labels, false)
        ui.set_visible(label_3, false)
        ui.set(welcome_label, "")
        ui.set(build_label, "")
        ui.set(online_users_label, "")
        ui.set(space, "")
        ui.set_visible(welcome_label, false)
        ui.set_visible(build_label, false)
        ui.set_visible(online_users_label, false)
        ui.set_visible(space, false)
    end

    if style_selected == " Information" then
        icon_info = menu_hex..""
    elseif style_selected == " Cloud" then
        icon_cloud = menu_hex..""
    end

    ui.set(label_3, icon_info .. dot .. icon_cloud)

    if main_selected == " Anti-Aimbot" then
        ui.set_visible(antiaim_tabs_icons, true)
        ui.set_visible(antiaim_tabs, true)

        local selected = ui.get(antiaim_tabs)

        local icon_constructor = (selected == " Constructor") and menu_hex.."" or gray..""
        local icon_assistant   = (selected == " Assistant")   and menu_hex.."" or gray..""
        local icon_quickbinds  = (selected == " Quick Binds") and menu_hex.."" or gray..""

        ui.set(antiaim_tabs_icons, icon_constructor..dot..icon_assistant..dot..icon_quickbinds)
    else
        ui.set_visible(antiaim_tabs_icons, false)
        ui.set_visible(antiaim_tabs, false)
    end

    local icon_home       = (main_selected == " Home")       and menu_hex.."" or gray..""
    local icon_antiaimbot = (main_selected == " Anti-Aimbot") and menu_hex.."" or gray..""
    local icon_tools      = (main_selected == " Tools")      and menu_hex.."" or gray..""
    local dot2 = gray.."  •   "

    ui.set(label2, icon_home..dot2..icon_antiaimbot..dot2..icon_tools)
end

ui.set_callback(tab_selection, update_labels)
ui.set_callback(edit_labels, update_labels)
ui.set_callback(antiaim_tabs, update_labels)

update_labels()


local function hide_ui_refs(...)
    local refs = {...}
    local flat_refs = {}

    for _, ref in ipairs(refs) do
        if type(ref) == "table" then
            for _, sub_ref in ipairs(ref) do
                table.insert(flat_refs, sub_ref)
            end
        else
            table.insert(flat_refs, ref)
        end
    end

    for _, r in ipairs(flat_refs) do
        if r then ui.set_visible(r, false) end
    end

    return flat_refs
end


local elements_to_hide = hide_ui_refs(
    {ui.reference("AA", "Other", "Slow Motion")},
    {ui.reference("AA", "Other", "Leg Movement")},
    {ui.reference("AA", "Other", "On shot anti-aim")},
    {ui.reference("AA", "Other", "Fake peek")},
    {ui.reference("AA", "Fake Lag", "Enabled")},
    {ui.reference("AA", "Fake Lag", "Amount")},
    {ui.reference("AA", "Fake Lag", "Variance")},
    {ui.reference("AA", "Fake Lag", "Limit")}
)

-- Show them back on shutdown
client.set_event_callback("shutdown", function()
    for _, ref in ipairs(elements_to_hide) do
        if ref then ui.set_visible(ref, true) end
    end
end)

local menu_color_ref = ui.reference("MISC", "Settings", "Menu color")



local hex_color = string.sub(lua.funcs.hex({lua_color[1], lua_color[2], lua_color[3]}), 1, 6)
local menu = {
    antiaim_tab = {
        onuse_antiaim_mode = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFf On-Use", "Static", "Jitter"),
        onuse_antiaim_hotkey = ui.new_hotkey(tab, container_aa, lua_color.." \aFFFFFFFf On-Use Key", true),
        onuse_antiaim_side = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFfDesynchronization Path", "Left", "Right"),
        freestand_mode = ui.new_combobox(tab, container_aa, lua_color.." \affffffffFreestand Mode", "Jitter", "Static"),
        freestand_hotkey = ui.new_hotkey(tab, container_aa, lua_color.." \affffffffFreestand Key", true),
        freestand_disablers = ui.new_multiselect(tab, container_aa, lua_color.." \affffffffFreestand Conditions", lua.vars.player_states),
        edge_yaw = ui.new_hotkey(tab, container_aa, lua_color.." \aFFFFFFFfEdge Yaw", false),
        manual_antiaim_forward = ui.new_hotkey(tab, container_aa, lua_color.." \aFFFFFFFfManual Forward", false),
        manual_antiaim_left = ui.new_hotkey(tab, container_aa, lua_color.." \aFFFFFFFfManual Left", false),
        manual_antiaim_right = ui.new_hotkey(tab, container_aa, lua_color.." \aFFFFFFFfManual Right", false),
    },

    antiaim_helpers_tab = {
        safety_options = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfSafety Measures", "Random anti-aim", "Safe knife", "Safe Head", "Static on height advantage", "Avoid backstab", "Secondary swap on target"),
        random_antiaim_conditions = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfRandom AA Conditions", "Warmup", "Freeze Time", "Round End"),
        random_antiaim_mode = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFfRandom AA Mode", "Slow Spin", "Fast Spin", "Wide Jitter", "Randomized"),
        safe_head_states = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfSafe Head States", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving", "On Zeus"),
        static_on_height_states = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfStatic Height States", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving"),
        secondary_swap_conditions = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfWeapon Swap Conditions", "Target has Knife", "Target has Zeus"),
        secondary_swap_weapon = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFfWeapon Swap Type", "Pull Pistol", "Pull Zeus (Pistol Backup)"),
        secondary_swap_distance = ui.new_slider(tab, container_aa, lua_color.." \aFFFFFFFfWeapon Swap Distance", 200, 700, 300, 1),
        fast_ladder = ui.new_checkbox(tab, container_fl, lua_color.." \aFFFFFFFfQuick Ladder"),
        fast_ladder_options = ui.new_multiselect(tab, container_fl, lua_color.." \aFFFFFFFfLadder Modes", "Ascending", "Descending"),
    },

   antiaim_builder_tab = {
    state = ui.new_combobox(
        tab,
        container_aa,
        "\n",
        unpack(lua.vars.player_states)
    )
    },

    misc_tab = {
        fps_boosters = ui.new_multiselect(tab, container_aa, 
            lua_color.." \aFFFFFFFfPerformance "..lua_color.."Helper",
            "Post processing", "Vignette", "Bloom", "Shadows", "Blood", "Ragdolls", "Fog", "3D Skybox"),

        animations = ui.new_multiselect(tab, container_aa, lua_color.." \aFFFFFFFfAnimation "..lua_color.."Modifiers", 
            "Static Legs", "Leg Breaker", "Zero Pitch on Land", "Earthquake Effect"),

        minimum_damage_indicator = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFfMininum "..lua_color.."damage \aFFFFFFFfindicator", "Off", "On Override", "Always"),

        watermark_position = ui.new_combobox(tab, container_aa, lua_color.." \aFFFFFFFfWatermark "..lua_color.."Position", "Bottom"),
    },

  configuration_tab = {
    list = ui.new_listbox(tab, container_aa, lua_color .. " " .. "\affffffff" .. "Configuration " .. lua_color .. "List", ""),
    name = ui.new_textbox(tab, container_aa, lua_color .. "Configuration " .. "\affffffff" .. "Name", ""),
    load = ui.new_button(tab, container_aa, lua_color .. " " .. "\affffffff" .. "Execute " .. lua_color .. "Configuration", function() end),
    save = ui.new_button(tab, container_aa, lua_color .. " " .. "\affffffff" .. "Save " .. lua_color .. "Configuration", function() end),
    delete = ui.new_button(tab, container_other, lua_color .. " " .. "\affffffff" .. "Delete " .. lua_color .. "Configuration", function() end),
    import = ui.new_button(tab, container_other, lua_color .. "⛏ " .. "\affffffff" .. "Import " .. lua_color .. "Configuration", function() end),
    export = ui.new_button(tab, container_other, lua_color .. " " .. "\affffffff" .. "Export " .. lua_color .. "Configuration", function() end)
}

}
client.set_event_callback("paint_ui", function()
    lua_color = get_lua_color()
end)


local menu_color_ref = ui.reference("misc", "settings", "menu color")

local function rgba_to_hex(r, g, b, a)
    return string.format("\a%02X%02X%02X%02X", r, g, b, a)
end

local function get_menu_color()
    local r, g, b, a = ui.get(menu_color_ref)
    return {r, g, b, a}, rgba_to_hex(r, g, b, a)
end

local lua_color, lua_color_hex = get_menu_color()

local antiaim_builder_tbl = {}
local antiaim_container = {}

for i = 1, #lua.vars.player_states do
    antiaim_container[i] = lua.funcs.hex({156, 129, 129}) .. "(" .. lua.funcs.hex({156, 129, 129}) .. lua.vars.player_states_abrev[i] .. lua.funcs.hex({200, 200, 200}) .. ")" .. lua.funcs.hex({155, 155, 155}) .. " "
    antiaim_builder_tbl[i] = {
        enable_state = ui.new_checkbox(tab, container_aa, "Activate " .. lua_color_hex .. lua.vars.player_states[i]),
        state_disablers = ui.new_multiselect(tab, container_aa, lua_color_hex .. "State Restrictions ", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching", "Crouch-Moving"),
        pitch = ui.new_combobox(tab, container_aa, lua_color_hex .. " Pitch \affffffffMode ", "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom"),
        pitch_slider = ui.new_slider(tab, container_aa, lua_color_hex .. " Pitch \affffffffControl ", -89, 89, 0, true, "°", 1),
        yaw_base = ui.new_combobox(tab, container_aa, lua_color_hex .. " Yaw \affffffffReference ", "Local View", "At Targets"),
        yaw = ui.new_combobox(tab, container_aa, lua_color_hex .. " Yaw \affffffffOrigin ", "Off", "Static", "L&R"),
        yaw_static = ui.new_slider(tab, container_aa, lua_color_hex .. " Yaw \affffffffOffset ", -180, 180, 0, true, "°", 1),
        yaw_left = ui.new_slider(tab, container_aa, lua_color_hex .. " Yaw Left \affffffffOffset ", -180, 180, 0, true, "°", 1),
        yaw_right = ui.new_slider(tab, container_aa, lua_color_hex .. " Yaw Right \affffffffOffset ", -180, 180, 0, true, "°", 1),
        yawjitter = ui.new_combobox(tab, container_aa, lua_color_hex .. " Yaw \affffffffJitter Mode ", "Off", "Random"),
        yawjitter_random = ui.new_slider(tab, container_aa, lua_color_hex .. " Jitter Range ", -180, 180, 0, true, "°", 1),
        bodyyaw = ui.new_combobox(tab, container_aa, lua_color_hex .. " Body Yaw \affffffffMode ", "Off", "Static", "Jitter", "Tickless"),
        fake_limit = ui.new_slider(tab, container_aa, lua_color_hex .. " Fake Yaw Limit ", -58, 58, 0, true, "°", 1),
        fake_limit_left = ui.new_slider(tab, container_aa, lua_color_hex .. " Fake Left Limit ", 1, 58, 0, true, "°", 1),
        fake_limit_right = ui.new_slider(tab, container_aa, lua_color_hex .. " Fake Right Limit ", 1, 58, 0, true, "°", 1),
        fake_limit_left_delayed = ui.new_slider(tab, container_aa, lua_color_hex .. " Fake \affffffffLeft (Delayed) ", 1, 58, 0, true, "°", 1),
        fake_limit_right_delayed = ui.new_slider(tab, container_aa, lua_color_hex .. " Fake \affffffffRight (Delayed) ", 1, 58, 0, true, "°", 1),
        fake_limit_delay_ticks = ui.new_slider(tab, container_aa, lua_color_hex .. " Desync \affffffffDelay ", 1, 10, 1, true, "", 1),

        defensive_antiaim_selection = ui.new_multiselect(tab, container_fl, lua_color_hex .. "Defensive \affffffffSelection", "Pitch", "Yaw"),
        defensive_pitch_options = ui.new_combobox(tab, container_fl, lua_color_hex .. "Pitch \affffffffOptions", "Up", "Half-up", "Zero", "Down", "Flick", "Random", "Custom"),
        defensive_pitch_flick_degree1 = ui.new_slider(tab, container_fl, lua_color_hex .. " Flick Min Degree ", -89, 89, 0, true, "°", 1),
        defensive_pitch_flick_degree2 = ui.new_slider(tab, container_fl, lua_color_hex .. " Flick Max Degree ", -89, 89, 0, true, "°", 1),
        defensive_pitch_custom = ui.new_slider(tab, container_fl, lua_color_hex .. " Custom  \affffffffPitch ", -89, 89, 0, true, "°", 1),
        defensive_yaw_options = ui.new_combobox(tab, container_fl, lua_color_hex .. "Yaw Options", "Forward", "Flick", "Spin", "2018", "Random", "Custom"),
        defensive_yaw_flick_angle1 = ui.new_slider(tab, container_fl, lua_color_hex .. " Flick degree [1]", -180, 180, 0, true, "°", 1),
        defensive_yaw_flick_angle2 = ui.new_slider(tab, container_fl, lua_color_hex .. " Flick degree [2]", -180, 180, 0, true, "°", 1),
        defensive_yaw_spin_range = ui.new_slider(tab, container_fl, lua_color_hex .. " Spin Range ", 1, 180, 0, true, "°", 1),
        defensive_yaw_spin_speed = ui.new_slider(tab, container_fl, lua_color_hex .. " Spin Speed ", 1, 64, 0.0, true, "", 1),
        defensive_yaw_distortion_range = ui.new_slider(tab, container_fl, lua_color_hex .. " Distortion \affffffffRange ", 1, 180, 0, true, "°", 1),
        defensive_yaw_distortion_speed = ui.new_slider(tab, container_fl, lua_color_hex .. " Distortion \affffffffSpeed ", 1, 64, 0, true, "", 1),
        defensive_yaw_random_range = ui.new_slider(tab, container_fl, lua_color_hex .. " Randomization \affffffffRange ", 1, 360, 0, true, "°", 1),
        defensive_yaw_custom = ui.new_slider(tab, container_fl, lua_color_hex .. "Custom Yaw ", -180, 180, 0, true, "°", 1),
        force_defensive_exploit = ui.new_combobox(tab, container_fl, lua_color_hex .. "Force Defensive \affffffffExploit ", "Predict", "Force", "Useless", "Balkan Rage"),

        defensive_ping_calculation = ui.new_checkbox(tab, container_fl,  "\aD94E4EFF{} \affffffffTick " .. lua_color_hex .. "Hasher "),
    }
end


config_system = {}

config_system = {

    get_config = function(name)
        local database = database.read(lua.database.configs) or {}

        for i, v in pairs(database) do
            if v.name == name then
                return {
                    config = v.config,
                    index = i
                }
            end
        end

        for i, v in pairs(presets) do
            if v.name == name then
                return {
                    config = v.config,
                    index = i
                }
            end
        end

        return false
    end,
    save_config = function(name)
        local db = database.read(lua.database.configs) or {}
        local config_tbl = {
            antiaim = {},
            antiaim_helpers_tab = {},
            antiaim_tab = {}
        }

        local hotkey_names_tbl = {
            onuse_antiaim_hotkey = true,
            freestand_hotkey = true,
            edge_yaw = true,
            manual_antiaim_forward = true,
            manual_antiaim_left = true,
            manual_antiaim_right = true,
        }
        
        for key, value in pairs(lua.vars.player_states_abrev) do
            config_tbl.antiaim[value] = {}
            for k, v in pairs(antiaim_builder_tbl[key]) do
                config_tbl.antiaim[value][k] = ui.get(v)
            end
        end

        for tab_name, tab_settings in pairs(menu) do
            if tab_name ~= "configuration_tab" then
                config_tbl.antiaim_helpers_tab[tab_name] = {}
                for setting_name, setting in pairs(tab_settings) do
                    config_tbl.antiaim_helpers_tab[tab_name][setting_name] = ui.get(setting)
                end
            end
        end
    
        for tab_name, tab_settings in pairs(menu) do
            if tab_name ~= "configuration_tab" then
                config_tbl.antiaim_tab[tab_name] = {}
                for setting_name, setting in pairs(tab_settings) do
                    if hotkey_names_tbl[setting_name] then
                        local values = {ui.get(setting)}
                        config_tbl.antiaim_tab[tab_name][setting_name] = {
                            value1 = values[1],
                            value2 = values[2],
                            value3 = values[3] or nil
                        }
                    else
                        config_tbl.antiaim_tab[tab_name][setting_name] = ui.get(setting)
                    end
                end
            end
        end
    
        local cfg = config_system.get_config(name)
    
        if not cfg then
            table.insert(db, { name = name, config = json.stringify(config_tbl) })
        else
            db[cfg.index].config = json.stringify(config_tbl)
        end
    
        database.write(lua.database.configs, db)
    end,      
    delete_config = function(name)
        local db = database.read(lua.database.configs) or {}

        for i, v in pairs(db) do
            if v.name == name then
                table.remove(db, i)
                break
            end
        end

        for i, v in pairs(presets) do
            if v.name == name then
                return false
            end
        end

        database.write(lua.database.configs, db)
    end,
    load_config_list = function()
        local database = database.read(lua.database.configs) or {}
        local config = {}

        for i, v in pairs(presets) do
            table.insert(config, v.name)
        end

        for i, v in pairs(database) do
            table.insert(config, v.name)
        end

        return config
    end,
    load_config = function(name)
        local cfg = config_system.get_config(name)
        config_system.load_settings(json.parse(cfg.config))
    end,
    load_settings = function(config)

        local hotkey_names_tbl = {
            onuse_antiaim_hotkey = true,
            freestand_hotkey = true,
            edge_yaw = true,
            manual_antiaim_forward = true,
            manual_antiaim_left = true,
            manual_antiaim_right = true
        }

        for key, value in pairs(lua.vars.player_states_abrev) do
            for k, v in pairs(antiaim_builder_tbl[key]) do
                if v ~= nil and config.antiaim[value][k] ~= nil then
                    ui.set(v, config.antiaim[value][k])
                end
            end
        end

        for tab_name, tab_settings in pairs(config.antiaim_helpers_tab or {}) do
            for setting_name, setting_value in pairs(tab_settings) do
                if setting_value ~= nil then
                    ui.set(menu[tab_name][setting_name], setting_value)
                end
            end
        end
    
        for tab_name, tab_settings in pairs(config.antiaim_tab or {}) do
            for setting_name, setting_value in pairs(tab_settings) do
                if setting_value ~= nil and type(setting_value) == "table" then
                    if hotkey_names_tbl[setting_name] then
                        
                        local idx_to_mode = {
                            [0] = "Always on",
                            [1] = "On hotkey",
                            [2] = "Toggle",
                            [3] = "Off hotkey",
                        }

                        ui.set(menu[tab_name][setting_name], idx_to_mode[tonumber(setting_value.value2)], tonumber(setting_value.value3))
                    else
                        ui.set(menu[tab_name][setting_name], setting_value)
                    end
                elseif setting_value ~= nil then
                    ui.set(menu[tab_name][setting_name], setting_value)
                end
            end
        end
    end,
    import_settings = function()
        local config = json.parse(clipboard.get())

        local hotkey_names_tbl = {
            onuse_antiaim_hotkey = true,
            freestand_hotkey = true,
            edge_yaw = true,
            manual_antiaim_forward = true,
            manual_antiaim_left = true,
            manual_antiaim_right = true
        }

        for key, value in pairs(lua.vars.player_states_abrev) do
            for k, v in pairs(antiaim_builder_tbl[key]) do
                if v ~= nil and config.antiaim[value][k] ~= nil then
                    ui.set(v, config.antiaim[value][k])
                end
            end
        end

        for tab_name, tab_settings in pairs(config.antiaim_helpers_tab or {}) do
            for setting_name, setting_value in pairs(tab_settings) do
                if setting_value ~= nil then
                    ui.set(menu[tab_name][setting_name], setting_value)
                end
            end
        end
    
        for tab_name, tab_settings in pairs(config.antiaim_tab or {}) do
            for setting_name, setting_value in pairs(tab_settings) do
                if setting_value ~= nil and type(setting_value) == "table" then
                    if hotkey_names_tbl[setting_name] then
                        
                        local idx_to_mode = {
                            [0] = "Always on",
                            [1] = "On hotkey",
                            [2] = "Toggle",
                            [3] = "Off hotkey",
                        }

                        ui.set(menu[tab_name][setting_name], idx_to_mode[tonumber(setting_value.value2)], tonumber(setting_value.value3))
                    else
                        ui.set(menu[tab_name][setting_name], setting_value)
                    end
                elseif setting_value ~= nil then
                    ui.set(menu[tab_name][setting_name], setting_value)
                end
            end
        end
    end,
    export_settings = function(name)
        local config = {
            antiaim = {},
            antiaim_helpers_tab = {},
            antiaim_tab = {}
        }

        local hotkey_names_tbl = {
            onuse_antiaim_hotkey = true,
            freestand_hotkey = true,
            edge_yaw = true,
            manual_antiaim_forward = true,
            manual_antiaim_left = true,
            manual_antiaim_right = true,
        }
        
        for key, value in pairs(lua.vars.player_states_abrev) do
            config.antiaim[value] = {}
            for k, v in pairs(antiaim_builder_tbl[key]) do
                config.antiaim[value][k] = ui.get(v)
            end
        end

        for tab_name, tab_settings in pairs(menu) do
            if tab_name ~= "configuration_tab" then
                config.antiaim_helpers_tab[tab_name] = {}
                for setting_name, setting in pairs(tab_settings) do
                    config.antiaim_helpers_tab[tab_name][setting_name] = ui.get(setting)
                end
            end
        end
    
        for tab_name, tab_settings in pairs(menu) do
            if tab_name ~= "configuration_tab" then
                config.antiaim_tab[tab_name] = {}
                for setting_name, setting in pairs(tab_settings) do
                    if hotkey_names_tbl[setting_name] then
                        local values = {ui.get(setting)}
                        config.antiaim_tab[tab_name][setting_name] = {
                            value1 = values[1],
                            value2 = values[2],
                            value3 = values[3] or nil
                        }
                    else
                        config.antiaim_tab[tab_name][setting_name] = ui.get(setting)
                    end
                end
            end
        end
        
        clipboard.set(json.stringify(config))
    end,
    create_db = function()
        local configs = lua.database.configs
        if not database.read(configs) then
            database.write(configs, {})
        end
    
        http.get("https://raw.githubusercontent.com/antihookuser/Library-Icons/refs/heads/main/settings", function(success, response)
            if not success then
                print("Failed to get presets")
                return
            end
            
            -- local data = json.parse(response.body)
            
            -- for i, preset in pairs(data.presets) do
            --     table.insert(presets, { name = preset.name, config = json.stringify(preset.config) })
            --     ui.set(menu.configuration_tab.name, preset.name)
            -- end
            ui.update(menu.configuration_tab.list, config_system.load_config_list())
        end)
    end,
}

config_system.create_db()


desync_functions = {}
defensive_functions = {}
antiaim_functions = {}

desync_functions = {

    switch_move = true,
    send_packet = true,
    yaw = 0,
    pitch = 0,
    nades = 0,


    get_charge = function ()
        local lp = entity.get_local_player()
        local simulation_time = entity.get_prop(lp, "m_flSimulationTime")
        return (globals.tickcount() - simulation_time/globals.tickinterval())
    end,

    get_limit = function ()
        if not ui.get(refs.fakelag_enabled[1]) then
            return 1
        end

        local limit = ui.get(refs.fakelag_limit)
        local charge = desync_functions.get_charge()

        local doubletap_active = ui.get(refs.doubletap[1]) and ui.get(refs.doubletap[2])
        local onshot_active = ui.get(refs.onshot[1]) and ui.get(refs.onshot[2])

        if (doubletap_active or onshot_active) and not ui.get(refs.fakeduck) then
            if charge > 0 then
                limit = 1
            else
                limit = ui.get(refs.doubletap_fl_limit)
            end
        end
        
        return limit
    end,

    _choking = function (cmd)
        local limit = desync_functions.get_limit()

        if cmd.chokedcommands < limit and (not cmd.no_choke or (cmd.chokedcommands == 0 and limit == 1)) then
            desync_functions.send_packet = false
            cmd.no_choke = false
        else
            cmd.no_choke = true
            desync_functions.send_packet = true
        end

        cmd.allow_send_packet = desync_functions.send_packet

        return desync_functions.send_packet
    end,

    _micromove = function(cmd)
        local lp = entity.get_local_player()
        local speed = 1.01
        local vel = vector(entity.get_prop(me, "m_vecVelocity")):length2d()

        if vel > 3 then
            return
        end

        if bit.band(entity.get_prop(lp, "m_fFlags"), 4) == 4 or ui.get(refs.fakeduck) then
            speed = speed * 2.94117647
        end

        desync_functions.switch_move = desync_functions.switch_move or false

        if desync_functions.switch_move then
            cmd.sidemove = cmd.sidemove + speed
        else
            cmd.sidemove = cmd.sidemove - speed
        end

        desync_functions.switch_move = not desync_functions.switch_move
    end,

    _desync = function (cmd)

        local lp = entity.get_local_player()

        if cmd.in_use == 1 then
            return false
        end
        local weapon_ent = entity.get_player_weapon(lp)

        if cmd.in_attack == 1 then
            local weapon = entity.get_classname(weapon_ent)

            if weapon == nil then
                return false
            end

            if weapon:find("Grenade") or weapon:find('Flashbang') then
                desync_functions.nades = globals.tickcount()
            else
                desync_functions._micromove(cmd)
                if math.max(entity.get_prop(weapon_ent, "m_flNextPrimaryAttack"), entity.get_prop(lp, "m_flNextAttack")) - globals.tickinterval() - globals.curtime() < 0 then
                    return false
                end
            end
        end
        local throw = entity.get_prop(weapon_ent, "m_fThrowTime")
        
        if desync_functions.nades + 15 == globals.tickcount() or (throw ~= nil and throw ~= 0) then
            return false 
        end
        
        if entity.get_prop(entity.get_game_rules(), "m_bFreezePeriod") == 1 then
            return false
        end
    
        if entity.get_prop(lp, "m_MoveType") == 9 then
            return false
        end

        if entity.get_prop(lp, "m_MoveType") == 10 then
            return false
        end
    
        return true
    end,

    _run = function(cmd, fake, yaw, pitch)  --AA

        local threat = client.current_threat()
        local cam_pitch, cam_yaw = client.camera_angles()
        local yaw_base = ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_base)
        local send_packet = desync_functions._choking(cmd)

        if yaw_base == "At targets" and threat then
            local pos = vector(entity.get_origin(entity.get_local_player()))
            local epos = vector(entity.get_origin(threat))

            cam_pitch, cam_yaw = pos:to(epos):angles()
        end

        ui.set(refs.bodyyaw[1], "Off")
        if desync_functions._desync(cmd) then
            if not send_packet then
                cmd.yaw = cam_yaw + yaw - fake*2
                cmd.pitch = pitch
            end
        end
    end,
}

defensive_functions = {
    old_simtime = 0,
    until_tick = 0,
    ticks = 0,
    active = false,
    time = 0,
    pitch_active = false,
    yaw_active = false,

    defensive_check = function()
        local local_player = entity.get_local_player()
        if not local_player or antiaim_functions.safe_head or antiaim_functions.safe_knife then 
            return 
        end

        local antiaim_selection = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_antiaim_selection)
        local pitch_selected = lua.funcs.table_contains(antiaim_selection, "Pitch")
        local yaw_selected = lua.funcs.table_contains(antiaim_selection, "Yaw")
        
        if not (pitch_selected or yaw_selected) then
            return
        end

        local cur_simtime = toticks(entity.get_prop(local_player, "m_flSimulationTime"))
        local simtime_delta = defensive_functions.old_simtime - cur_simtime

        if simtime_delta > 0 then
            local ping_calc = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_ping_calculation)
            defensive_functions.until_tick = globals.tickcount() + math.abs(simtime_delta) - (ping_calc and toticks(client.latency()) or 0)
            defensive_functions.ticks = defensive_functions.until_tick - globals.tickcount()
        end

        defensive_functions.active = defensive_functions.until_tick > globals.tickcount()
        defensive_functions.old_simtime = cur_simtime
        defensive_functions.time = defensive_functions.ticks - (defensive_functions.until_tick - globals.tickcount())

        return defensive_functions
    end,

    get_yaw_value = function(yaw_options)
        local cur_time = globals.curtime()
        local tick_count = globals.tickcount()

        if yaw_options == "Forward" then
            return tick_count % 3 == 0 and -155 or 155
        elseif yaw_options == "Flick" then
            local angle1 = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_flick_angle1)
            local angle2 = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_flick_angle2)
            return tick_count % 1 == 0 and angle1 or angle2
        elseif yaw_options == "Spin" then
            local speed = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_spin_speed)
            local range = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_spin_range)
            return -math.fmod(cur_time * (speed * 360), range * 2) + range
        elseif yaw_options == "2018" then
            local speed = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_distortion_speed)
            local range = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_distortion_range)
            return math.sin(cur_time * speed) * range
        elseif yaw_options == "Random" then
            local random_range = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_random_range)
            return math.random(-random_range / 2, random_range / 2)
        elseif yaw_options == "Custom" then
            return ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_custom)
        end
    end,

    get_pitch_value = function(pitch_options)
        if pitch_options == "Up" then
            return -89
        elseif pitch_options == "Half-up" then
            return -45
        elseif pitch_options == "Zero" then
            return 0
        elseif pitch_options == "Down" then
            return 89
        elseif pitch_options == "Flick" then
            local flick1 = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_pitch_flick_degree1)
            local flick2 = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_pitch_flick_degree2)
            return globals.tickcount() % 4 == 0 and flick1 or flick2
        elseif pitch_options == "Random" then
            return math.random(-89, 89)
        elseif pitch_options == "Custom" then
            return ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_pitch_custom)
        else
            return 89
        end
    end,

    _run = function()
        local local_player = entity.get_local_player()
        if not local_player or antiaim_functions.safe_head or antiaim_functions.safe_knife then 
            return 
        end

        local antiaim_selection = ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_antiaim_selection)
        local pitch_selected = lua.funcs.table_contains(antiaim_selection, "Pitch")
        local yaw_selected = lua.funcs.table_contains(antiaim_selection, "Yaw")

        if not (pitch_selected or yaw_selected) then
            defensive_functions.active = false
            return
        end

        local defensive_check = defensive_functions.defensive_check()
        if defensive_check.active then
            if pitch_selected then
                ui.set(refs.pitch[1], "Custom")
                ui.set(refs.pitch[2], defensive_functions.get_pitch_value(ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_pitch_options)))
                defensive_functions.pitch_active = true
            end

            if yaw_selected then
                ui.set(refs.yaw[2], defensive_functions.get_yaw_value(ui.get(antiaim_builder_tbl[lua.vars.player_state].defensive_yaw_options)))
                defensive_functions.yaw_active = true
            end
        end

        defensive_functions.pitch_active = false
        defensive_functions.yaw_active = false
    end,
}

antiaim_functions = {

    onuse_antiaim = false,
    avoid_backstab_bool = false,
    safe_knife = false,
    safe_head = false,
    random_antiam = false,
    round_end = false,
    manual_antiaim_bool = false,
    manual_antiaim_tbl = {
        last_forward,
        last_left,
        last_right,
        manual_side,
    },

    antiaim_state = function(cmd)

        ui.set(refs.enabled, true)

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end

        local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
        local onground = bit.band(flags, 1) ~= 0 and cmd.in_jump == 0
        local velocity = vector(entity.get_prop(entity.get_local_player(), "m_vecVelocity"))
        local lp_velocity = math.sqrt(velocity.x^2 + velocity.y^2) < 5
        local doubletap_active = ui.get(refs.doubletap[1]) and ui.get(refs.doubletap[2])
        local onshot_active = ui.get(refs.onshot[1]) and ui.get(refs.onshot[2])


        local get_player_state = function()
            if not onground then
                return entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.1 and 7 or 6
            elseif entity.get_prop(entity.get_local_player(), "m_flDuckAmount") > 0.1 then
                return lp_velocity and 5 or 8
            elseif ui.get(refs.slow_motion[1]) and ui.get(refs.slow_motion[2]) and not lp_velocity then
                return 4
            elseif not lp_velocity then
                return 3
            elseif lp_velocity then
                return 2
            end
            return 1
        end

        lua.vars.player_state = get_player_state()

        if ui.get(antiaim_builder_tbl[9].enable_state) and not lua.funcs.table_contains(ui.get(antiaim_builder_tbl[9].state_disablers), lua.vars.int_to_string[lua.vars.player_state]) and not lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safe_head_states), lua.vars.int_to_string[lua.vars.player_state]) and not doubletap_active and not onshot_active then
            lua.vars.player_state = 9
        end

        if not ui.get(antiaim_builder_tbl[lua.vars.player_state].enable_state) and lua.vars.player_state ~= 1 then
            lua.vars.player_state = 1
        end
    end,

    antiaim_handle = function(cmd)

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end

        if antiaim_functions.onuse_antiaim or defensive_functions.active or antiaim_functions.safe_head or antiaim_functions.safe_knife or antiaim_functions.random_antiam then return end

        if cmd.in_use == 1 then return end

        if ui.get(antiaim_builder_tbl[lua.vars.player_state].enable_state) then

            if entity.get_player_weapon(entity.get_local_player()) ~= nil then
                if not entity.get_classname(entity.get_player_weapon(entity.get_local_player())):find("Grenade") then
                    if ui.get(antiaim_builder_tbl[lua.vars.player_state].force_defensive_exploit) == "Force" then
                        cmd.force_defensive = true
                    elseif ui.get(antiaim_builder_tbl[lua.vars.player_state].force_defensive_exploit) == "Useless" then
                        cmd.force_defensive = cmd.command_number % 2 == 1
                    elseif ui.get(antiaim_builder_tbl[lua.vars.player_state].force_defensive_exploit) == "Balkan Rage" then
                        local tick = globals.tickcount()
                        local choke = cmd.chokedcommands
                        local data = tostring(tick) .. ":" .. tostring(choke)
                        local hash = 0
                        for i = 1, #data do
                            hash = (hash * 64 + data:byte(i)) % 98
                        end
                        cmd.force_defensive = (hash % 2 == 1) and not cmd.no_choke
                    end                 
                else
                    cmd.force_defensive = false
                end
            end

            if not defensive_functions.pitch_active then
                local pitch_setting = ui.get(antiaim_builder_tbl[lua.vars.player_state].pitch)
                ui.set(refs.pitch[1], pitch_setting)
                if pitch_setting == "Custom" then
                    ui.set(refs.pitch[2], ui.get(antiaim_builder_tbl[lua.vars.player_state].pitch_slider))
                end
            end

            ui.set(refs.yaw_base, ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_base))

            local yaw_mode = ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw)
            local side = (math.floor(math.abs(entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120)) - 60) > 0 and 1 or -1
            local body_yaw_mode = ui.get(antiaim_builder_tbl[lua.vars.player_state].bodyyaw)

            if not defensive_functions.yaw_active or antiaim_functions.manual_antiaim_bool then
                if yaw_mode ~= "Off" then
                    ui.set(refs.yaw[1], "180")
                    if yaw_mode == "L&R" then
                        if body_yaw_mode == "Static" or body_yaw_mode == "Off" then
                            ui.set(refs.yaw[2], globals.tickcount() % 4 >= 2 and ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_left) or ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_right))
                        else
                            ui.set(refs.yaw[2], side == 1 and ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_left) or ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_right))
                        end
                    else
                        ui.set(refs.yaw[2], ui.get(antiaim_builder_tbl[lua.vars.player_state].yaw_static))
                    end
                else
                    ui.set(refs.yaw[1], "Off")
                    ui.set(refs.yaw[2], 0)
                end
            end

 

            ui.set(refs.yawjitter[1], ui.get(antiaim_builder_tbl[lua.vars.player_state].yawjitter))
            ui.set(refs.yawjitter[2], ui.get(antiaim_builder_tbl[lua.vars.player_state].yawjitter_random))

            local fake_limit = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit)
            local fake_limit_left = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit_left)
            local fake_limit_right = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit_right)
            local fake_limit_delay_ticks = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit_delay_ticks)
            local fake_limit_left_delayed = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit_left_delayed)
            local fake_limit_right_delayed = ui.get(antiaim_builder_tbl[lua.vars.player_state].fake_limit_right_delayed)

            if body_yaw_mode == "Static" then
                desync_functions._run(cmd, fake_limit, 180, 89)
            elseif body_yaw_mode == "Jitter" then
                desync_functions._run(cmd, globals.tickcount() % 4 >= 2 and -fake_limit_left or fake_limit_right, 180, 89)
            elseif body_yaw_mode == "Tickless" then
                local tick = globals.tickcount()
                local delay_ticks = math.max(1, math.floor(20 * (0.1 + fake_limit_delay_ticks / 10))) -- Ensure at least 1 tick
                local half_period = math.floor(delay_ticks / 2)
            
                local value = (tick % delay_ticks < half_period) and -fake_limit_left_delayed or fake_limit_right_delayed
                desync_functions._run(cmd, value, 180, 89)
            else
                return
            end

            ui.set(refs.bodyyaw[2], 0)
            ui.set(refs.freestanding_bodyyaw, false)
        elseif not ui.get(antiaim_builder_tbl[lua.vars.player_state].enable_state) then
            ui.set(refs.pitch[1], "Off")
            ui.set(refs.yaw_base, "Local view")
            ui.set(refs.yaw[1], "Off")
            ui.set(refs.yaw[2], 0)
            ui.set(refs.yawjitter[1], "Off")
            ui.set(refs.yawjitter[2], 0)
            ui.set(refs.bodyyaw[1], "Off")
            ui.set(refs.bodyyaw[2], 0)
            ui.set(refs.roll, 0)
        end
    end,

    fast_ladder = function(cmd)
        if not ui.get(menu.antiaim_helpers_tab.fast_ladder) then return end
        local cam_pitch, cam_yaw = client.camera_angles()

        if entity.get_prop(entity.get_local_player(), "m_MoveType") == 9 then
        
            adjust_yaw_and_controls = function(ascending)
                cmd.pitch = 89

                if ascending then
                    if cam_pitch < 45 then
                        cmd.in_moveright = 1
                        cmd.in_moveleft = 0
                        cmd.in_forward = 0
                        cmd.in_back = 1
                    end 
                else
                    cmd.in_moveleft = 1
                    cmd.in_moveright = 0
                    cmd.in_forward = 1
                    cmd.in_back = 0
                end

                if cmd.sidemove == 0 then
                    cmd.yaw = cmd.yaw + 90
                end
                if cmd.sidemove < 0 then
                    cmd.yaw = cmd.yaw + 180
                end
                if cmd.sidemove > 0 then
                    cmd.yaw = cmd.yaw + 45
                end
            end
        
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.fast_ladder_options), "Ascend") and cmd.forwardmove > 0 then
                adjust_yaw_and_controls(true)
            end
        
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.fast_ladder_options), "Descend") and cmd.forwardmove < 0 then
                adjust_yaw_and_controls(false)
            end
        end
        
    end,

    safety_options = {

        random_antiaim_setup = function(cmd)

            antiaim_functions.random_antiam = false

            local modes = {
                ["Slow spin"] = { pitch = "Off", pitch_int = 0, yaw_value = (-math.fmod(globals.curtime() * 360, 360) + 180), yaw_jitter = 0 },  --??
                ["Fast spin"] = { pitch = "Off", pitch_int = 0, yaw_value = (-math.fmod(globals.curtime() * 980, 360) + 180), yaw_jitter = 0 },
                ["Wide jitter"] = { pitch = "Down", pitch_int = 89, yaw_value = (globals.tickcount() % 3 == 0 and -52 or 61), yaw_jitter = 45 },
                ["Random"] = { pitch = "Random", pitch_int = client.random_int(-89, 89), yaw_value = client.random_int(-180, 180), yaw_jitter = 180 }
            }
    
            local mode = ui.get(menu.antiaim_helpers_tab.random_antiaim_mode)
            local mode_settings = modes[mode]
    
            local apply_antiaim = function()
                ui.set(refs.pitch[1], mode_settings.pitch)
                ui.set(refs.yaw_base, "Local view")
                ui.set(refs.yaw[1], "180")
                ui.set(refs.yaw[2], mode_settings.yaw_value)
                ui.set(refs.yawjitter[1], "Random")
                ui.set(refs.yawjitter[2], mode_settings.yaw_jitter)
                ui.set(refs.bodyyaw[2], 0)
                desync_functions._run(cmd, 42, 180, 89)
                antiaim_functions.random_antiam = true
            end
    
            local conditions = {
                Warmup = function() return entity.get_prop(entity.get_all("CCSGameRulesProxy")[1], "m_bWarmupPeriod") ~= 0 end,
                ["Freeze time"] = function() return entity.get_prop(entity.get_all("CCSGameRulesProxy")[1], "m_bFreezePeriod") ~= 0 end,
                ["Round end"] = function() return antiaim_functions.round_end end
            }
    
            for condition, check in pairs(conditions) do
                if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Random anti-aim") and
                   lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.random_antiaim_conditions), condition) and
                   check() then
                    apply_antiaim()
                    if condition == "Freeze time" then
                        cmd.pitch = cmd.pitch + mode_settings.pitch_int
                        cmd.yaw = cmd.yaw + mode_settings.yaw_value
                    end
                    return
                end
            end
        end,

        safe_knife = function(cmd)

            antiaim_functions.safe_knife = false

            if antiaim_functions.onuse_antiaim or antiaim_functions.avoid_backstab_bool then return end
    
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Safe knife") and lua.vars.player_state == 7 and entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == "CKnife" then
                ui.set(refs.pitch[1], "Minimal")
                ui.set(refs.yaw[1], "180")
                ui.set(refs.yaw[2], 8)
                ui.set(refs.yawjitter[1], "Random")
                ui.set(refs.yawjitter[2], 10)
                ui.set(refs.bodyyaw[2], 0)
                desync_functions._run(cmd, 48, 180, 89)
                antiaim_functions.safe_knife = true
            end
        end,

        safe_head = function(cmd)

            antiaim_functions.safe_head = false

            if antiaim_functions.onuse_antiaim or antiaim_functions.avoid_backstab_bool then return end

            if not lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Safe head") then return end

            local doubletap_active = ui.get(refs.doubletap[1]) and ui.get(refs.doubletap[2])
            local onshot_active = ui.get(refs.onshot[1]) and ui.get(refs.onshot[2])

            local safe_head_antiaim = function(desync)
                ui.set(refs.pitch[1], "Minimal")
                ui.set(refs.yaw[1], "180")
                ui.set(refs.yaw[2], 0)
                ui.set(refs.yawjitter[1], "Off")
                ui.set(refs.yawjitter[2], 0)
                ui.set(refs.bodyyaw[2], 0)
                desync_functions._run(cmd, desync, 180, 89)
                antiaim_functions.safe_head = true
            end

            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safe_head_states), lua.vars.int_to_string[lua.vars.player_state]) then
                if not doubletap_active and not onshot_active then
                    safe_head_antiaim(math.sin(globals.realtime() * 8) * -58 + 15)
                end
            end

            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safe_head_states), "On Zeus") and entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == "CWeaponTaser" then
                safe_head_antiaim(math.sin(globals.realtime() * 64) * -35 + 10)
            end
        end,

        static_on_height_advantage = function(cmd)
            if antiaim_functions.onuse_antiaim or antiaim_functions.avoid_backstab_bool or not client.current_threat() then return end
    
            local lp_origin = vector(entity.get_origin(entity.get_local_player()))
            local target_origin = vector(entity.get_origin(client.current_threat()))
    
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Static on height advantage") and 
               lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.static_on_height_states), lua.vars.int_to_string[lua.vars.player_state]) and 
               lp_origin.z > target_origin.z + 115 then
                ui.set(refs.pitch[1], "Minimal")
                ui.set(refs.yaw[1], "180")
                ui.set(refs.yaw[2], 0)
                ui.set(refs.yawjitter[1], "Off")
                ui.set(refs.yawjitter[2], 0)
                ui.set(refs.bodyyaw[2], 0)
            end
        end,
    
        avoid_backstab = function()

            antiaim_functions.avoid_backstab_bool = false

            if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) or antiaim_functions.onuse_antiaim then return end
    
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Avoid backstab") then
                local local_origin = vector(entity.get_origin(entity.get_local_player()))
                for _, player in ipairs(entity.get_players(true)) do
                    local distance = local_origin:dist(vector(entity.get_origin(player)))
                    if entity.get_classname(entity.get_player_weapon(player)) == "CKnife" and distance <= 300 then
                        ui.set(refs.yaw[2], 180)
                        ui.set(refs.pitch[1], "Off")
                        antiaim_functions.avoid_backstab_bool = true
                        return
                    end
                end
            end
        end,

        secondary_swap = function()
            if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) or antiaim_functions.onuse_antiaim then return end
    
            if lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Secondary swap on target") then
                local secondary_swap_distance = ui.get(menu.antiaim_helpers_tab.secondary_swap_distance)
                local secondary_swap_weapon = ui.get(menu.antiaim_helpers_tab.secondary_swap_weapon)
                local swap_conditions = ui.get(menu.antiaim_helpers_tab.secondary_swap_conditions)
    
                local local_origin = vector(entity.get_origin(entity.get_local_player()))
    
                local function has_weapon(weapon_class)
                    for _, player in ipairs(entity.get_players(true)) do
                        local distance = local_origin:dist(vector(entity.get_origin(player)))
                        if entity.get_classname(entity.get_player_weapon(player)) == weapon_class and distance <= secondary_swap_distance then
                            return true
                        end
                    end
                    return false
                end
    

                local has_taser = false
                for _, weapon in pairs(lua.funcs.get_player_weapons(entity.get_local_player())) do
                    if entity.get_classname(weapon) == "CWeaponTaser" then
                        has_taser = true
                        break
                    end
                end
    
                if (lua.funcs.table_contains(swap_conditions, "Target has knife") and has_weapon("CKnife")) or 
                   (lua.funcs.table_contains(swap_conditions, "Target has zeus") and has_weapon("CWeaponTaser")) then
                    if secondary_swap_weapon == "Pull zeus (Pistol backup)" and entity.get_classname(entity.get_player_weapon(entity.get_local_player())) ~= "CWeaponTaser" then
                        client.exec(has_taser and "slot3" or "slot2")
                    elseif secondary_swap_weapon == "Pull pistol" then
                        client.exec("slot2")
                    end
                    ui.set(refs.yaw[2], 180)
                    ui.set(refs.pitch[1], "Off")
                end
            end
        end,
    },

    legit_antiaim = function(cmd)

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end

        antiaim_functions.onuse_antiaim = false

        if ui.get(menu.antiaim_tab.onuse_antiaim_hotkey) then
            if entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == "CC4" then return end


            local should_disable = false
            local planted_bomb = entity.get_all("CPlantedC4")[1]

            if planted_bomb then
                local bomb_distance = vector(entity.get_origin(entity.get_local_player())):dist(vector(entity.get_origin(planted_bomb)))
                should_disable = bomb_distance <= 64 and entity.get_prop(entity.get_local_player(), "m_iTeamNum") == 3
            end

            if not should_disable then
                local cam_pitch, cam_yaw = client.camera_angles()
                local direct_vec = vector(lua.funcs.vec_angles(cam_pitch, cam_yaw))
                local eye_pos = vector(client.eye_position())
                local _, ent = client.trace_line(entity.get_local_player(), eye_pos.x, eye_pos.y, eye_pos.z, eye_pos.x + (direct_vec.x * 8192), eye_pos.y + (direct_vec.y * 8192), eye_pos.z + (direct_vec.z * 8192))

                if ent and ent ~= -1 then
                    local classname = entity.get_classname(ent)
                    if classname == "CPropDoorRotating" or classname == "CHostage" then
                        should_disable = true
                    end
                end
            end

            if not should_disable then
                antiaim_functions.onuse_antiaim = true
                ui.set(refs.pitch[1], "Off")
                ui.set(refs.yaw[2], 180)
                ui.set(refs.yawjitter[2], 0)
                ui.set(refs.roll, 0)
                cmd.in_use = 0
                desync_functions._run(cmd, (ui.get(menu.antiaim_tab.onuse_antiaim_mode) == "Static" and (ui.get(menu.antiaim_tab.onuse_antiaim_side) == "Left" and -60 or 60) or (globals.tickcount() % 4 >= 2 and -60 or 60)), 0, 0)
            end
        end
    end,

    freestanding_setup = function()

        current_player_state = lua.vars.int_to_string[lua.vars.player_state]
        current_freestand_disablers = ui.get(menu.antiaim_tab.freestand_disablers)

        if lua.funcs.table_contains(current_freestand_disablers, current_player_state) then
            return
        end

        if ui.get(menu.antiaim_tab.freestand_hotkey) then
            ui.set(refs.bodyyaw[1], "Opposite")
            ui.set(refs.freestanding[2], "Always on")
            ui.set(refs.freestanding[1], true)
            if ui.get(menu.antiaim_tab.freestand_mode) == "Static" then
                ui.set(refs.yaw[2], 0)
                ui.set(refs.yawjitter[2], 0)
            end
        else
            ui.set(refs.freestanding[1], false)
            ui.set(refs.freestanding[2], "On hotkey")
        end
    end,

    manual_antiaim = function()

        local keybinds = {
            forward = ui.get(menu.antiaim_tab.manual_antiaim_forward),
            left = ui.get(menu.antiaim_tab.manual_antiaim_left),
            right = ui.get(menu.antiaim_tab.manual_antiaim_right),
        }
    
        local last_keybinds = {
            forward = antiaim_functions.manual_antiaim_tbl.last_forward,
            left = antiaim_functions.manual_antiaim_tbl.last_left,
            right = antiaim_functions.manual_antiaim_tbl.last_right,
        }
    
        local keybind_idx = {
            forward = 1, 
            left = 2, 
            right = 3
        }
    
        if last_keybinds.forward == nil then
            antiaim_functions.manual_antiaim_tbl.last_forward = keybinds.forward
            antiaim_functions.manual_antiaim_tbl.last_left = keybinds.left
            antiaim_functions.manual_antiaim_tbl.last_right = keybinds.right
            return
        end
    
        for key, value in pairs(keybinds) do
            if value ~= last_keybinds[key] then
                if antiaim_functions.manual_antiaim_tbl.manual_side == keybind_idx[key] then
                    antiaim_functions.manual_antiaim_tbl.manual_side = nil
                else
                    antiaim_functions.manual_antiaim_tbl.manual_side = keybind_idx[key]
                end
            end
        end
    
        antiaim_functions.manual_antiaim_tbl.last_forward = keybinds.forward
        antiaim_functions.manual_antiaim_tbl.last_left = keybinds.left
        antiaim_functions.manual_antiaim_tbl.last_right = keybinds.right
    
        local manual_side = antiaim_functions.manual_antiaim_tbl.manual_side
        if manual_side then antiaim_functions.manual_antiaim_bool = true else antiaim_functions.manual_antiaim_bool = false end
        if not manual_side then return end

        ui.set(
            refs.yaw[2],
            manual_side == 1 and
                ((ui.get(refs.yaw[2]) + ({180, 90, -90})[manual_side] + 180) % 360 - 180)
            or
                ((ui.get(refs.yaw[2]) + ({180, 90, -90})[manual_side]) % 360 - 180)
            )
    end,

    edge_yaw = function()
        local edge_yaw_ref = ui.get(menu.antiaim_tab.edge_yaw)

        if edge_yaw_ref and not antiaim_functions.manual_antiaim_bool then
            ui.set(refs.edge_yaw, true)
        else
            ui.set(refs.edge_yaw, false)
        end
    end,
}

visual_functions = {}

visual_functions = {

    legs_cached = false,
    ground_ticks = 0,

    update_lua_color = function()
        lua_color = {ui.get(menu_color_ref)}
    end,    

    csm_removals = function()
        cvar.mat_postprocess_enable:set_raw_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Post processing") and 0 or 1)
        cvar.mat_vignette_enable:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Vignette") and 0 or 1)
        cvar.mat_bloom_scalefactor_scalar:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Bloom") and 0 or 1)
        cvar.cl_csm_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.r_dynamic:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.r_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_static_prop_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_world_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_foot_contact_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_viewmodel_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_rope_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_sprite_shadows:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.cl_csm_world_shadows_in_viewmodelcascade:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Shadows") and 0 or 1)
        cvar.violence_ablood:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Blood") and 0 or 1)
        cvar.violence_hblood:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Blood") and 0 or 1)
        cvar.cl_disable_ragdolls:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Ragdolls") and 0 or 1)
        cvar.fog_enable:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Fog") and 0 or 1)
        cvar.fog_enable_water_fog:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Fog") and 0 or 1)
        cvar.fog_enableskybox:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "Fog") and 0 or 1)
        cvar.r_3dsky:set_int(lua.funcs.table_contains(ui.get(menu.misc_tab.fps_boosters), "3D skybox") and 0 or 1)
    end,

    anim_breakers = function()

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end

        local entity_ptr = ffi.cast(class_ptr, native_GetClientEntity(entity.get_local_player()))
        if entity_ptr == null_ptr then return end
        local anim_layers = ffi.cast(animation_layer_t, ffi.cast(char_ptr, entity_ptr) + 0x2990)[0][12]

        local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
        visual_functions.ground_ticks = bit.band(flags, 1) == 0 and 0 or (visual_functions.ground_ticks < 5 and visual_functions.ground_ticks + 1 or visual_functions.ground_ticks)

        local animations = ui.get(menu.misc_tab.animations)

        if lua.funcs.table_contains(animations, "Static Legs") then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6)
        end

        if lua.funcs.table_contains(animations, "Leg Breaker") then
            if not visual_functions.legs_cached then
                visual_functions.legs_cached = ui.get(refs.leg_movement)
            end
            ui.set_visible(refs.leg_movement, false)
            if globals.tickcount() % 2 <= 1 then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 0)
            end
            ui.set(refs.leg_movement, "Always Slide")
        elseif visual_functions.legs_cached then
            ui.set_visible(refs.leg_movement, true)
            ui.set(refs.leg_movement, visual_functions.legs_cached)
            visual_functions.legs_cached = false
        end

        if lua.funcs.table_contains(ui.get(menu.misc_tab.animations), "Zero Pitch on Land") then
            visual_functions.ground_ticks = bit.band(flags, 1) == 1 and visual_functions.ground_ticks + 1 or 0

            if visual_functions.ground_ticks > 25 and visual_functions.ground_ticks < 225 then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
            end
        end

        if lua.funcs.table_contains(ui.get(menu.misc_tab.animations), "Earthquake Effect") then
            anim_layers.weight = client.random_float(0, 1)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 2)
        end
    end,

    mindamag = function()

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end

        local _x, _y = client.screen_size()
        local min_damage_indicator = ui.get(menu.misc_tab.minimum_damage_indicator)
        local player_weapon_classname = entity.get_classname(entity.get_player_weapon(entity.get_local_player()))

        local grenade_and_knife_classes = {
            CHEGrenade = true,
            CSmokeGrenade = true,
            CMolotovGrenade = true,
            CFlashbang = true,
            CDecoyGrenade = true,
            CKnife = true,
            CWeaponTaser = true
        }
        
        if min_damage_indicator == "Off" or grenade_and_knife_classes[player_weapon_classname] then
            return
        end
        
        local damage_override_active = ui.get(refs.damage_override[1]) and ui.get(refs.damage_override[2])
        local damage_string = min_damage_indicator == "Always" and (damage_override_active and ui.get(refs.damage_override[3]) or ui.get(refs.damage[1]))
                or (min_damage_indicator == "On override" and damage_override_active and ui.get(refs.damage_override[3]) or normalize)

        if damage_string ~= nil then
            renderer.text(_x / 2 + 8, _y / 2 - 10, 255, 255, 255, 255, "c-", 0, tostring(damage_string))
        end
    end,

render_watermark = function()
    local function is_player_alive()
    local local_player = entity.get_local_player()
    return local_player and entity.is_alive(local_player)  
end
     if not is_player_alive() then return end
    local screen_width, screen_height = client.screen_size()

    local config = {
        username = loader.username or "hazey",
        build = loader.build or "v1.0",
        font = "b",
        colors = {
            background = {20, 22, 26, 255},
            gradient = {
                {25, 28, 35, 255},
                {18, 20, 24, 255}
            },
            accent = {lua_color[1], lua_color[2], lua_color[3]},
            text = {
                primary = {240, 242, 245, 255},
                secondary = {110, 190, 255, 255}
            },
            separator = {255, 255, 255, 60}
        },
        layout = {
            height = 26,
            padding_h = 12,
            padding_v = 6,
            margin = 3,
            text_spacing = 6,
            border_radius = 6,
            blur_strength = 5,
            separator_width = 1,
            shadow_size = 3
        }
    }

    local username_text = config.username:upper()
    local build_text = config.build:upper()

    local username_width = renderer.measure_text(config.font, username_text)
    local build_width = renderer.measure_text(config.font, build_text)
    local content_width = username_width + config.layout.text_spacing + build_width
    local box_width = content_width + (config.layout.padding_h * 2)
    local box_height = config.layout.height

    local x = (screen_width / 2) - (box_width / 2)
    local y = screen_height - box_height - config.layout.margin

    local function draw_modern_panel(x, y, w, h, radius)
        local bg = config.colors.background
        local grad_top = config.colors.gradient[1]
        local grad_bottom = config.colors.gradient[2]

        renderer.rectangle(x + 2, y + 2, w, h, 0, 0, 0, 30)
        renderer.blur(x, y, w, h, config.layout.blur_strength)

        local segments = 8
        local segment_height = h / segments

        for i = 0, segments - 1 do
            local blend = i / (segments - 1)
            local r = math.floor(grad_top[1] * (1 - blend) + grad_bottom[1] * blend)
            local g = math.floor(grad_top[2] * (1 - blend) + grad_bottom[2] * blend)
            local b = math.floor(grad_top[3] * (1 - blend) + grad_bottom[3] * blend)
            local a = math.floor(grad_top[4] * (1 - blend) + grad_bottom[4] * blend)
            local segment_y = y + (i * segment_height)
            local segment_h = math.ceil(segment_height + 1)

            if i > 0 and i < segments - 1 then
                renderer.rectangle(x, segment_y, w, segment_h, r, g, b, a)
            elseif i == 0 then
                renderer.rectangle(x + radius, segment_y, w - radius * 2, segment_h, r, g, b, a)
                renderer.rectangle(x, segment_y + radius, radius, segment_h - radius, r, g, b, a)
                renderer.rectangle(x + w - radius, segment_y + radius, radius, segment_h - radius, r, g, b, a)
                renderer.circle(x + radius, segment_y + radius, r, g, b, a, radius, 0, 1)
                renderer.circle(x + w - radius, segment_y + radius, r, g, b, a, radius, 0, 1)
            else
                renderer.rectangle(x + radius, segment_y, w - radius * 2, segment_h, r, g, b, a)
                renderer.rectangle(x, segment_y, radius, segment_h - radius, r, g, b, a)
                renderer.rectangle(x + w - radius, segment_y, radius, segment_h - radius, r, g, b, a)
                renderer.circle(x + radius, segment_y + segment_h - radius, r, g, b, a, radius, 0, 1)
                renderer.circle(x + w - radius, segment_y + segment_h - radius, r, g, b, a, radius, 0, 1)
            end
        end

        local accent = config.colors.accent
        renderer.rectangle(x, y + h - 1, w, 1, accent[1], accent[2], accent[3], 255)
    end

    draw_modern_panel(x, y, box_width, box_height, config.layout.border_radius)

    local text_y = y + (box_height / 2) - 7
    local username_x = x + config.layout.padding_h

    local primary_text = config.colors.text.primary
    renderer.text(username_x, text_y, primary_text[1], primary_text[2], primary_text[3], primary_text[4], config.font, 0, username_text)

    -- Separator line position inside box, vertically centered
    local separator_x = username_x + username_width + (config.layout.text_spacing / 2)
    local separator_y = y + (box_height / 2) - 10
    local separator_height = 33
    local sep_col = config.colors.separator
    renderer.text(separator_x, separator_y, config.layout.separator_width, separator_height,"•", 255, 255, 255)

    local build_x = separator_x + config.layout.text_spacing / 2
    renderer.text(build_x, text_y, lua_color[1], lua_color[2], lua_color[3], 255, config.font, 0, build_text)

    local dot_size = 2
    local dot_x = x + box_width - config.layout.padding_h / 60
    local dot_y = y + box_height / 2
    local accent = config.colors.accent

    local time = globals.realtime() * 1.5
    local pulse = math.sin(time) * 0.5 + 0.5
    local dot_alpha = 255
end


}
ui.update(menu.configuration_tab.list, config_system.load_config_list())
local CONFIG = {
    max_logs = 6,
    fade_time = 4,
    colors = {
        hit = {220, 255, 150},  -- Light green for hits
        miss = {255, 120, 120}  -- Light red for misses
    }
}

-- Hitgroup names mapping
local HITGROUPS = {
    "generic", "head", "chest", "stomach", "left arm", "right arm",
    "left leg", "right leg", "neck", "?", "gear"
}

-- Log storage
local logs = {}

-- Create log and log to console
local function create_log(text, type)
    table.insert(logs, 1, {
        text = text,
        time = globals.realtime(),
        type = type
    })

    client.color_log(lua_color[1], lua_color[2], lua_color[3], "[gamesense] ", text)

    if #logs > CONFIG.max_logs then
        table.remove(logs)
    end
end

-- Hit event handler
local function on_aim_hit(e)
    local target_name = entity.get_player_name(e.target) or "Unknown"
    local group = HITGROUPS[e.hitgroup + 1] or "?"
    local damage = e.damage or 0
    local health = entity.get_prop(e.target, "m_iHealth") or 0

    local log_text = string.format("Hit %s in the %s for %d damage (%d HP remaining)", 
        target_name, group, damage, health)

   logger.invent("Hit " .. target_name .. " in " .. group .. " for " .. damage .. " damage", {191, 152, 115}, "")

    create_log(log_text, "hit")
end

-- Miss event handler
local function on_aim_miss(e)
    local target_name = entity.get_player_name(e.target) or "Unknown"
    local group = HITGROUPS[e.hitgroup + 1] or "?"
    local reason = e.reason or "Unknown"

    local log_text = string.format("Missed %s (%s) due to %s", 
        target_name, group, reason)

 logger.invent("Missed " .. target_name .. " in (" .. group .. ")", {255, 120, 120}, "")

    create_log(log_text, "miss")
end

-- Register callbacks
client.set_event_callback("aim_hit", on_aim_hit)
client.set_event_callback("aim_miss", on_aim_miss)

local function get_camera_pos(enemy)
    local e_x, e_y, e_z = entity.get_prop(enemy, "m_vecOrigin")
    if e_x == nil then return end
    local _, _, ofs = entity.get_prop(enemy, "m_vecViewOffset")
    e_z = e_z + (ofs - (entity.get_prop(enemy, "m_flDuckAmount") * 16))
    return e_x, e_y, e_z
end
local function fired_at(target, shooter, shot)
    local shooter_cam = {get_camera_pos(shooter)}
    if shooter_cam[1] == nil then return end
    
    local player_head = {entity.hitbox_position(target, 0)}
    
    -- Calculate vectors from camera to head and shot points
    local shooter_cam_to_head = {
        player_head[1] - shooter_cam[1],
        player_head[2] - shooter_cam[2],
        player_head[3] - shooter_cam[3]
    }
    
    local shooter_cam_to_shot = {
        shot[1] - shooter_cam[1],
        shot[2] - shooter_cam[2],
        shot[3] - shooter_cam[3]
    }
    
    -- Calculate projection factor
    local magic = ((shooter_cam_to_head[1]*shooter_cam_to_shot[1]) +
                  (shooter_cam_to_head[2]*shooter_cam_to_shot[2]) +
                  (shooter_cam_to_head[3]*shooter_cam_to_shot[3])) /
                 (math.pow(shooter_cam_to_shot[1], 2) +
                  math.pow(shooter_cam_to_shot[2], 2) +
                  math.pow(shooter_cam_to_shot[3], 2))
    
    -- Calculate closest point on shot trajectory
    local closest = {
        shooter_cam[1] + shooter_cam_to_shot[1]*magic,
        shooter_cam[2] + shooter_cam_to_shot[2]*magic,
        shooter_cam[3] + shooter_cam_to_shot[3]*magic
    }
    
    -- Calculate distance to head position
    local length = math.abs(math.sqrt(
        math.pow((player_head[1]-closest[1]), 2) +
        math.pow((player_head[2]-closest[2]), 2) +
        math.pow((player_head[3]-closest[3]), 2)
    ))
    
    -- Perform trace checks
    local frac_shot = client.trace_line(shooter, shot[1], shot[2], shot[3],
                                      player_head[1], player_head[2], player_head[3])
    local frac_final = client.trace_line(target, closest[1], closest[2], closest[3],
                                       player_head[1], player_head[2], player_head[3])
    
    return (length < 69) and (frac_shot > 0.99 or frac_final > 0.99)
end

local tickshot = 0

client.set_event_callback("bullet_impact", function(event)
    local lp = entity.get_local_player()
    if lp == nil then return end
    
    local enemy = client.userid_to_entindex(event.userid)
    -- Check if the bullet impact is from an enemy and local player is alive
    if enemy == lp or not entity.is_enemy(enemy) or not entity.is_alive(lp) then return end
    
    -- Now 'fired_at' is defined and can be called
    if fired_at(lp, enemy, {event.x, event.y, event.z}) then
        -- Prevent multiple notifications on the same tick
        if tickshot ~= globals.tickcount() then
           
            
          
                local enemy_name = string.lower(entity.get_player_name(enemy) or "unknown")
                local text = string.format("Changed ['jitter'] due to bullet from %s", enemy_name)
                
                local jitter_color = {196, 172, 188, 255} -- The color you specified
                local jitter_icon = "⛺" -- A bullet/bullseye icon
                
                -- Log to your custom notification system with icon
                logger.invent(text, jitter_color, jitter_icon)
                

        
        
            tickshot = globals.tickcount() -- Update tickshot to prevent re-triggering on same tick
        end
    end
end)

-- -- Print initialization message
-- client.color_log(150, 200, 255, "Modern Hit Logger loaded successfully")


-- if not loader_get_username then while true do end end
if database.read(lua.database.configs) == nil then
    database.write(lua.database.configs, {})
end

ui.set(menu.configuration_tab.name, #database.read(lua.database.configs) == 0 and "" or database.read(lua.database.configs)[ui.get(menu.configuration_tab.list)+1].name)
ui.set_callback(menu.configuration_tab.list, function(value)
    local protected = function()
        if value == nil then return end
        local name = ""
    
        local configs = config_system.load_config_list()
        if configs == nil then return end
    
        name = configs[ui.get(value)+1] or ""
    
        ui.set(menu.configuration_tab.name, name)
    end

    if pcall(protected) then

    end
end)

ui.set_callback(menu.configuration_tab.load, function()
    local name = ui.get(menu.configuration_tab.name)
    if name == "" then return end
    local protected = function()
        config_system.load_config(name)
    end

    local status, err = pcall(protected)

    if status then
       logger.invent("Successfully loaded settings.", {255, 120, 120}, "")
    else
              logger.invent("Failed to execute settings.", {255, 120, 120}, "")

        client.color_log(lua_color[1], lua_color[2], lua_color[3], name .. "\0 : ")
        client.color_log(255, 0, 0, err)
    end
end)

local color_list = {
    [1] = {150, 175, 200},
    [2] = {150, 200, 150},
    [3] = {215, 150, 135},
    [4] = {190, 175, 225},
    [5] = {237, 187, 142}
}

local random_color = color_list[client.random_int(1, 5)]
ui.set_callback(menu.configuration_tab.save, function()
    local name = ui.get(menu.configuration_tab.name)
    if name == "" then return end

    local protected = function()
        config_system.save_config(name)
        ui.update(menu.configuration_tab.list, config_system.load_config_list())
    end

    status, err = pcall(protected)

    if status then
        client.color_log(random_color[1], random_color[2], random_color[3], "Exo\0")
        client.color_log(255, 255 , 255 , "dus ->\0")
        client.color_log(255, 255 , 255 , " Successfully saved profile - ".. name)
               logger.invent("Successfully saved profile.", {255, 120, 120}, "")

    else
               logger.invent(err, {255, 120, 120}, "⚠")

    end
end)

ui.set_callback(menu.configuration_tab.delete, function()
    local name = ui.get(menu.configuration_tab.name)
    if name == "" then return end
    if config_system.delete_config(name) == false then
        ui.update(menu.configuration_tab.list, config_system.load_config_list())
        return
    end

    local protected = function()
        config_system.delete_config(name)
    end

    status, err = pcall(protected)

    if status then
        ui.update(menu.configuration_tab.list, config_system.load_config_list())
        ui.set(menu.configuration_tab.list, #presets + #database.read(lua.database.configs) - #database.read(lua.database.configs))
        ui.set(menu.configuration_tab.name, #database.read(lua.database.configs) == 0 and "" or config_system.load_config_list()[#presets + #database.read(lua.database.configs) - #database.read(lua.database.configs)+1])
         client.color_log(random_color[1], random_color[2], random_color[3], "Exo\0")
        client.color_log(255, 255 , 255 , "dus ->\0")
        client.color_log(255, 255, 255, " Successfully deleted \0")
        client.color_log(lua_color[1], lua_color[2], lua_color[3], name)
               logger.invent("Successfully deleted ".. name , {255, 120, 120}, "")

    else
                     logger.invent(err, {255, 120, 120}, "⚠")

    end
end)

ui.set_callback(menu.configuration_tab.import, function()
    local protected = function()
        config_system.import_settings()
    end

    local status, err = pcall(protected)
    
    if status then
               logger.invent("Successfully loaded profile from clipboard.", {255, 120, 120}, "⛏")

    end
end)


ui.set_callback(menu.configuration_tab.export, function()
    local name = ui.get(menu.configuration_tab.name)
    if name == "" then return end

    local protected = function()
        config_system.export_settings(name)
    end

    if pcall(protected) then
        client.color_log(255, 255, 255, "Successfully exported settings from \0")
        client.color_log(lua_color[1], lua_color[2], lua_color[3], name)
               logger.invent("Successfully exported settings.", {255, 120, 120}, "")

    else
              logger.invent(err, {255, 120, 120}, "⚠")

    end
end)

client.set_event_callback("paint_ui", function()
    lua.vars.active_state = lua.vars.string_to_int[ui.get(menu.antiaim_builder_tab.state)]

    ui.set_visible(tab_selection, true)
    ui.set_visible(antiaim_tabs, ui.get(tab_selection) == " Anti-Aimbot")
    is_antiaim_tab = ui.get(tab_selection) == " Anti-Aimbot" and ui.get(antiaim_tabs) == " Quick Binds"
    is_antiaim_helpers_tab = ui.get(tab_selection) == " Anti-Aimbot" and ui.get(antiaim_tabs) == " Assistant"
    is_antiaim_builder_tab = ui.get(tab_selection) == " Anti-Aimbot" and ui.get(antiaim_tabs) == " Constructor"
    is_misc_tab = ui.get(tab_selection) == " Tools"
    is_config_tab = ui.get(tab_selection) == " Home"

    -- name_color_array = lua.funcs.create_color_array(lua_color[1], lua_color[2], lua_color[3], "E X O D U S")
    -- ui.set(label, string.format("    \a%sE \a%sX \a%sO \a%sD \a%sU \a%sS | \a%sE A R L Y  ", lua.funcs.rgba_hex(unpack(name_color_array[1])), lua.funcs.rgba_hex(unpack(name_color_array[2])), lua.funcs.rgba_hex(unpack(name_color_array[3])), lua.funcs.rgba_hex(unpack(name_color_array[4])), lua.funcs.rgba_hex(unpack(name_color_array[5])), lua.funcs.rgba_hex(unpack(name_color_array[6])),  lua.funcs.rgba_hex(unpack(name_color_array[7])),  lua.funcs.rgba_hex(unpack(name_color_array[8])),  lua.funcs.rgba_hex(unpack(name_color_array[9])) ) .. lua.funcs.hex({lua_color[1], lua_color[2], lua_color[3]}))
    -- ui.set(xd, string.format(
    --     "                \a%sN \a%sE \a%sT \a%sW \a%sO \a%sR \a%sK",
    --     lua.funcs.rgba_hex(unpack(name_color_array[1])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[2])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[3])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[4])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[5])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[6])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[7])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[8])),
    --     lua.funcs.rgba_hex(unpack(name_color_array[9]))
    -- ) .. lua.funcs.hex({lua_color[1], lua_color[2], lua_color[3]}))
    
    ui.set(antiaim_builder_tbl[1].enable_state, true)

    for i = 1, #lua.vars.player_states do
        local state_enabled = ui.get(antiaim_builder_tbl[i].enable_state)
        ui.set_visible(antiaim_builder_tbl[i].enable_state, lua.vars.active_state == i and i~=1 and is_antiaim_builder_tab)
        ui.set_visible(antiaim_builder_tbl[i].state_disablers, lua.vars.active_state == 9 and i == 9 and is_antiaim_builder_tab and ui.get(antiaim_builder_tbl[9].enable_state))
        ui.set_visible(antiaim_builder_tbl[i].pitch, lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].pitch_slider , lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled and ui.get(antiaim_builder_tbl[i].pitch) == "Custom")
        ui.set_visible(antiaim_builder_tbl[i].yaw_base, lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yaw, lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yaw_static, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].yaw) == "Static" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yaw_left, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].yaw) == "L&R" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yaw_right, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].yaw) == "L&R" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yawjitter, lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].yawjitter_random, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].yawjitter) == "Random" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].bodyyaw, lua.vars.active_state == i and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Static" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit_left, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Jitter" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit_right, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Jitter" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit_left_delayed, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Tickless" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit_right_delayed, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Tickless" and is_antiaim_builder_tab and state_enabled)
        ui.set_visible(antiaim_builder_tbl[i].fake_limit_delay_ticks, lua.vars.active_state == i and ui.get(antiaim_builder_tbl[i].bodyyaw) == "Tickless" and is_antiaim_builder_tab and state_enabled)

            ui.set_visible(antiaim_builder_tbl[i].force_defensive_exploit, lua.vars.active_state == i and i ~= 9 and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_antiaim_selection, lua.vars.active_state == i and i ~= 9 and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_pitch_options, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Pitch") and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_pitch_flick_degree1, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Pitch") and ui.get(antiaim_builder_tbl[i].defensive_pitch_options) == "Flick" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_pitch_flick_degree2, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Pitch") and ui.get(antiaim_builder_tbl[i].defensive_pitch_options) == "Flick" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_pitch_custom, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Pitch") and ui.get(antiaim_builder_tbl[i].defensive_pitch_options) == "Custom" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_options, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_flick_angle1, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Flick" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_flick_angle2, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Flick" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_spin_range, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Spin" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_spin_speed, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Spin" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_distortion_range, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "2018" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_distortion_speed, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "2018" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_random_range, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Random" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_yaw_custom, lua.vars.active_state == i and i ~= 9 and lua.funcs.table_contains(ui.get(antiaim_builder_tbl[i].defensive_antiaim_selection), "Yaw") and ui.get(antiaim_builder_tbl[i].defensive_yaw_options) == "Custom" and is_antiaim_builder_tab and state_enabled)
            ui.set_visible(antiaim_builder_tbl[i].defensive_ping_calculation, lua.vars.active_state == i and i ~= 9 and is_antiaim_builder_tab and state_enabled)
    end

    for i, feature in pairs(menu.antiaim_tab) do
        ui.set_visible(menu.antiaim_tab.onuse_antiaim_side, is_antiaim_tab and ui.get(menu.antiaim_tab.onuse_antiaim_mode) == "Static")
        ui.set_visible(menu.antiaim_tab.freestand_disablers, is_antiaim_tab)

        if type(feature) ~= "table" and feature ~= 45 then
            ui.set_visible(feature, is_antiaim_tab)
        end
	end 

    for i, feature in pairs(menu.antiaim_helpers_tab) do

        ui.set_visible(menu.antiaim_helpers_tab.random_antiaim_conditions, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Random anti-aim"))
        ui.set_visible(menu.antiaim_helpers_tab.random_antiaim_mode, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Random anti-aim"))
        ui.set_visible(menu.antiaim_helpers_tab.safe_head_states, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Safe head"))
        ui.set_visible(menu.antiaim_helpers_tab.static_on_height_states, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Static on height advantage"))
        ui.set_visible(menu.antiaim_helpers_tab.secondary_swap_conditions, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Secondary swap on target"))
        ui.set_visible(menu.antiaim_helpers_tab.secondary_swap_weapon, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Secondary swap on target"))
        ui.set_visible(menu.antiaim_helpers_tab.secondary_swap_distance, is_antiaim_helpers_tab and lua.funcs.table_contains(ui.get(menu.antiaim_helpers_tab.safety_options), "Secondary swap on target"))
        ui.set_visible(menu.antiaim_helpers_tab.fast_ladder_options, is_antiaim_helpers_tab and ui.get(menu.antiaim_helpers_tab.fast_ladder))

        if type(feature) ~= "table" then
            ui.set_visible(feature, is_antiaim_helpers_tab)
        end
	end 

    for i, feature in pairs(menu.antiaim_builder_tab) do
		ui.set_visible(feature, is_antiaim_builder_tab)
	end

    for i, feature in pairs(menu.misc_tab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, is_misc_tab)
        end
	end

    for i, feature in pairs(menu.configuration_tab) do
		ui.set_visible(feature, is_config_tab)
	end

    lua.funcs.reset_antiaim_tab(false)
end)

client.set_event_callback("setup_command", function(cmd)

    antiaim_functions.antiaim_state(cmd)
    antiaim_functions.antiaim_handle(cmd)
    antiaim_functions.fast_ladder(cmd)
    antiaim_functions.safety_options.random_antiaim_setup(cmd)
    antiaim_functions.safety_options.safe_knife(cmd)
    antiaim_functions.safety_options.safe_head(cmd)
    antiaim_functions.safety_options.static_on_height_advantage(cmd)
    antiaim_functions.safety_options.avoid_backstab()
    antiaim_functions.safety_options.secondary_swap()
    antiaim_functions.legit_antiaim(cmd)
    antiaim_functions.freestanding_setup()
    antiaim_functions.manual_antiaim()
    antiaim_functions.edge_yaw()
end)

client.set_event_callback("paint", function()
    visual_functions.csm_removals()
    visual_functions.mindamag()
end)

client.set_event_callback("round_end", function(cmd)
    antiaim_functions.round_end = true
end)

client.set_event_callback("round_prestart", function(cmd)
    antiaim_functions.round_end = false
end)

client.set_event_callback("net_update_start", function()
    defensive_functions._run()
end)

client.set_event_callback("pre_render", function()
    visual_functions.anim_breakers()
end)

client.set_event_callback("paint_ui", function()
    visual_functions.update_lua_color()
    visual_functions.render_watermark()
end)


client.set_event_callback("shutdown", function()
    ui.set(refs.fakelag_limit, 15)
    lua.funcs.reset_antiaim_tab(true)
    lua.funcs.default_antiaim_tab()
end)
