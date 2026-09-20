local try_require = function (module, msg) local success, result = pcall(require, module) if success then return result else return error(msg) end end
local ffi = try_require('ffi', '~ Failed to require FFI, please make sure Allow unsafe scripts is enabled!')
local pui = try_require('gamesense/pui', '~ Download pui library: https://gamesense.pub/forums/viewtopic.php?id=41761')
local http = try_require('gamesense/http', '~ Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619')
local base64 = try_require('gamesense/base64', '~ Module base64 not found')
local clipboard = try_require('gamesense/clipboard', '~ Download clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678')
local c_entity = try_require('gamesense/entity', '~ Download entity library: https://gamesense.pub/forums/viewtopic.php?id=27529')
local csgo_weapons = try_require('gamesense/csgo_weapons', '~ csgo_weapons libriary not found')
local json = try_require('json', '~ Missing Json')
local trace_lib = try_require('gamesense/trace', '~ Missing trace_lib')
local vector = try_require('vector', '~ Missing Vector')
local bit = try_require ('bit', '~ Missing Bit')
local easing = try_require ('gamesense/easing', '~ Missing Easing')
local images = try_require('gamesense/images', '~ Missing Images')
local surface_lib = try_require('gamesense/surface', '~ Missing Surface')
local chat = try_require ("gamesense/chat", "~ Missing Chat")
local localize = try_require ("gamesense/localize", "~ Missing localize")
local antiaim_func = try_require("gamesense/antiaim_funcs", "~ Missing antiaim_funcs")
local m_alpha = 0
local width, height = client.screen_size()
local start_time = client.unix_time()

local utils = { } do
    utils.set_event_callback = function(event, callback, state)
    local cb_state = state and client.set_event_callback or client.unset_event_callback

    cb_state(event, callback)
  end
end

local active_drag = {}
local active_button = {}
local drag_start_positions = {}
local border_zones = {}

local drag = {
    create = function(self, id, pos, size, value_x, value_y, value_w, value_h, min_x, min_y, max_x, max_y)
        if not self[id] then
            self[id] = {x = 0, y = 0}
        end

        local x, y = pos.x, pos.y
        local w, h = size.x, size.y

        local mouse_pos = {ui.mouse_position()}

        if drag_start_positions[id] == nil then
            drag_start_positions[id] = {x = x, y = y}
        end

        local near_border = self:is_near_border_zone(id, mouse_pos[1], mouse_pos[2])
        local inside_border = self:is_inside_border_zone(id, mouse_pos[1], mouse_pos[2])

        local menu_pos = {ui.menu_position()}
        local menu_size = {ui.menu_size()}
        local in_menu = mouse_pos[1] >= menu_pos[1] and mouse_pos[1] <= menu_pos[1] + menu_size[1] and
                        mouse_pos[2] >= menu_pos[2] and mouse_pos[2] <= menu_pos[2] + menu_size[2]


        if in_menu then
            for drag_id, _ in pairs(active_drag) do
                active_drag[drag_id] = nil
            end
            for drag_id, _ in pairs(active_button) do
                active_button[drag_id] = nil
            end
        end

        local is_hovered = not in_menu and mouse_pos[1] >= x and mouse_pos[1] <= x + w and mouse_pos[2] >= y and mouse_pos[2] <= y + h

        local any_other_dragging = false
        for drag_id, drag_state in pairs(active_drag) do
            if drag_id ~= id and drag_state == drag_id then
                any_other_dragging = true
                break
            end
        end
        
        local is_currently_dragging = active_drag[id] == id

        if is_hovered and ui.is_menu_open() and not any_other_dragging and not in_menu then
            local can_drag = not inside_border

            if client.key_state(0x01) and active_drag[id] == nil and can_drag then
                active_drag[id] = id
                self[id].start_mouse_x = mouse_pos[1]
                self[id].start_mouse_y = mouse_pos[2]
                self[id].start_x = value_x and value_x:get() or x
                self[id].start_y = value_y and value_y:get() or y
                self[id].start_w = value_w and value_w:get() or w
                self[id].start_h = value_h and value_h:get() or h
                self[id].is_snapped = false
            end

            if client.key_state(0x02) and active_button[id] == nil and can_drag then
                active_button[id] = true
                if self[id].on_right_click then
                    self[id].on_right_click()
                end
            end
        end

        if not client.key_state(0x01) then
            if active_drag[id] == id then
                active_drag[id] = nil
            end
        end

        if not client.key_state(0x02) then
            if active_button[id] then
                active_button[id] = nil
            end
        end

        if is_currently_dragging and ui.is_menu_open() and not in_menu then
            local screen_width, screen_height = client.screen_size()


            local new_x = self[id].start_x + (mouse_pos[1] - self[id].start_mouse_x)
            local new_y = self[id].start_y + (mouse_pos[2] - self[id].start_mouse_y)
            local new_w = self[id].start_w
            local new_h = self[id].start_h

            local min_x_val = min_x ~= nil and min_x or 0
            local min_y_val = min_y ~= nil and min_y or 0

            local max_x_val = max_x ~= nil and max_x or screen_width - w
            local max_y_val = max_y ~= nil and max_y or screen_height - h

            local new_pos_inside_border = self:is_inside_border_zone(id, new_x, new_y) or
                                                 self:is_inside_border_zone(id, new_x + new_w, new_y) or
                                                 self:is_inside_border_zone(id, new_x, new_y + new_h) or
                                                 self:is_inside_border_zone(id, new_x + new_w, new_y + new_h)

            if not new_pos_inside_border then
                if value_x ~= nil then
                    new_x = math.max(min_x_val, math.min(max_x_val, new_x))
                    value_x:set(new_x)
                end

                if value_y ~= nil then
                    new_y = math.max(min_y_val, math.min(max_y_val, new_y))
                    value_y:set(new_y)
                end

                if value_w ~= nil and new_w ~= nil then
                    value_w:set(math.max(10, math.min(screen_width, new_w)))
                end

                if value_h ~= nil and new_h ~= nil then
                    value_h:set(math.max(10, math.min(screen_height, new_h)))
                end
            end
        end

        return {
            hovered = is_hovered,
            dragging = is_currently_dragging and not in_menu, 
            right_clicked = active_button[id] == true and not in_menu, 
            near_border = near_border,
            inside_border = inside_border,
            snapped = self[id].is_snapped or false,
            in_menu = in_menu
        }
    end,

    add_border_zone = function(self, id, zone)
        if not border_zones[id] then
            border_zones[id] = {}
        end
        table.insert(border_zones[id], {
            x = zone.x or 0,
            y = zone.y or 0,
            w = zone.w or 0,
            h = zone.h or 0,
            threshold = zone.threshold or 5,
            enabled = zone.enabled ~= false
        })
    end,

    clear_border_zones = function(self, id)
        border_zones[id] = nil
    end,

    is_near_border_zone = function(self, id, pos_x, pos_y)
        if not border_zones[id] then return false end

        for _, zone in ipairs(border_zones[id]) do
            if zone.enabled then
                local expanded_zone = {
                    x = zone.x - zone.threshold,
                    y = zone.y - zone.threshold,
                    w = zone.w + zone.threshold * 2,
                    h = zone.h + zone.threshold * 2
                }

                if pos_x >= expanded_zone.x and pos_x <= expanded_zone.x + expanded_zone.w and
                    pos_y >= expanded_zone.y and pos_y <= expanded_zone.y + expanded_zone.h then
                    return true
                end
            end
        end
        return false
    end,

    is_inside_border_zone = function(self, id, pos_x, pos_y)
        if not border_zones[id] then return false end

        for _, zone in ipairs(border_zones[id]) do
            if zone.enabled then
                if pos_x >= zone.x and pos_x <= zone.x + zone.w and
                    pos_y >= zone.y and pos_y <= zone.y + zone.h then
                    return true
                end
            end
        end
        return false
    end,

    render_border_zones = function(self, id)
        if not border_zones[id] then return end

        for i, zone in ipairs(border_zones[id]) do
            if zone.enabled then
                renderer.rectangle(zone.x, zone.y, zone.w, zone.h, 255, 0, 0, 80)
                renderer.rectangle(zone.x - zone.threshold, zone.y - zone.threshold, 
                                    zone.w + zone.threshold * 2, zone.h + zone.threshold * 2, 
                                    255, 255, 0, 30)
                renderer.text(zone.x, zone.y - 12, 255, 255, 255, 255, nil, 0, 'border ' .. i)
            end
        end
    end,

    set_right_click_callback = function(self, id, callback)
        if not self[id] then
            self[id] = {}
        end
        self[id].on_right_click = callback
    end,

    is_dragging = function(self, id)
        return active_drag[id] == id
    end,

    is_right_clicked = function(self, id)
        return active_button[id] == true
    end,

    reset_drag = function(self, id)
        active_drag[id] = nil
    end,

    reset_button = function(self, id)
        active_button[id] = nil
    end,

    get_position = function(self, id, value_x, value_y)
        if value_x and value_y then
            return {x = value_x:get(), y = value_y:get()}
        end
        return drag_start_positions[id] or {x = 0, y = 0}
    end,

    get_size = function(self, id, value_w, value_h)
        if value_w and value_h then
            return {x = value_w:get(), y = value_h:get()}
        end
        return {x = 0, y = 0}
    end
}


local function interpolation(start, _end, time)
    return (_end - start) * time + start
end

local function clamp(x, a, b) if a > x then return a elseif b < x then return b else return x end end

local function clamp_motion(start, _end, time)
    time = time or 0.005
    time = clamp(globals.frametime() * time * 175.0, 0.01, 1.0)
    local a = interpolation(start, _end, time)
    if _end == 0.0 and a < 0.01 and a > -0.01 then
        a = 0.0
    elseif _end == 1.0 and a < 1.01 and a > 0.99 then
        a = 1.0
    end
    return a
end 

local max_lerp_low_fps = (1 / 45) * 100
local function moth(start, end_pos, time)
    if start == end_pos then return end_pos end
    local frametime = globals.frametime() * 170
    time = time * math.min(frametime, max_lerp_low_fps)
    local val = start + (end_pos - start) * globals.frametime() * time
    return math.abs(val - end_pos) < 0.01 and end_pos or val
end

local function lerping (a, b, w)
    return a + (b - a) * w
end

local function anti_knife_dist(x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)
end

local function get_wall_distance(me, max_dist)
    local player_origin = vector(entity.get_origin(me))
    local camera_angles = vector(client.camera_angles())
    local yaw_rad = math.rad(camera_angles.y)

    local direction_back = vector(
        -math.cos(yaw_rad),
        -math.sin(yaw_rad),
        0
    )

    local trace_start = vector(
        player_origin.x,
        player_origin.y,
        player_origin.z + 64
    )
    
    local trace_end = vector(
        trace_start.x + direction_back.x * max_dist,
        trace_start.y + direction_back.y * max_dist,
        trace_start.z 
    )

    local trace_frac = client.trace_line(entity.get_local_player(), 
        trace_start.x, trace_start.y, trace_start.z,
        trace_end.x, trace_end.y, trace_end.z, 0x1
    )

    local hit_distance = max_dist
    local hit_wall = false
    
    if trace_frac < 1.0 then
        hit_distance = trace_frac * max_dist - 20 
        hit_wall = true
    end

    return math.max(hit_distance, 0), hit_wall
end

local motion = { base_speed = 0.095, _list = {}, _time = {} } do 
    function motion.new(name, new_value, speed, init)
        speed = speed or motion.base_speed
        motion._list[name] = motion._list[name]  or (init or 0)
        motion._list[name] = clamp_motion(motion._list[name], new_value, speed)
        motion._time[name] = globals.realtime()
        return motion._list[name]
    end
end

local get_entity_pointer = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)')
local native_SetInterpolationAmount = vtable_thunk(2, 'void(__thiscall*)(void*, float)')

local cached_colors = { }
local last_cache_time = -1

local coloring = {} do
    function coloring.RGBAtoHEX(redArg, greenArg, blueArg, alphaArg)
        redArg = math.max(0, math.min(255, redArg or 0))
        greenArg = math.max(0, math.min(255, greenArg or 0))
        blueArg = math.max(0, math.min(255, blueArg or 0))
        alphaArg = math.max(0, math.min(255, alphaArg or 255))
        return string.format('%02x%02x%02x%02x', redArg, greenArg, blueArg, alphaArg)
    end
    function coloring.gradient_text(time, string, r, g, b, a, r2, g2, b2, a2)
        if #string == 0 then return string end
        local t_out, t_out_iter = {}, 1
        local r_add = (r2 - r)
        local g_add = (g2 - g)
        local b_add = (b2 - b)
        local a_add = (a2 - a)
        for i = 1, #string do
            local iter = (i - 1)/(#string - 1) + time
            local cos_val = math.abs(math.cos(iter))
            t_out[t_out_iter] = '\a' .. coloring.RGBAtoHEX(
                r + r_add * cos_val,
                g + g_add * cos_val,
                b + b_add * cos_val,
                a + a_add * cos_val
            )
            t_out[t_out_iter + 1] = string:sub(i, i)
            t_out_iter = t_out_iter + 2
        end
        return table.concat(t_out)
    end
    function coloring.multi_gradient_text(time, string, c1, c2, c3)
        if #string == 0 then return string end
        if not c1 or not c2 or not c3 then return string end
        local t_out, t_out_iter = {}, 1
        local len = #string
        for i = 1, len do
            local pos = (i - 1) / (len - 1) 
            local phase = pos + time
            local frac = phase - math.floor(phase) 
            local r, g, b, a = 255, 255, 255, 255
            if frac < 1/3 then
                local t = frac * 3
                r = c1[1] + (c2[1] - c1[1]) * t
                g = c1[2] + (c2[2] - c1[2]) * t
                b = c1[3] + (c2[3] - c1[3]) * t
                a = c1[4] + (c2[4] - c1[4]) * t
            elseif frac < 2/3 then
                local t = (frac - 1/3) * 3
                r = c2[1] + (c3[1] - c2[1]) * t
                g = c2[2] + (c3[2] - c2[2]) * t
                b = c2[3] + (c3[3] - c2[3]) * t
                a = c2[4] + (c3[4] - c2[4]) * t
            else
                local t = (frac - 2/3) * 3
                r = c3[1] + (c1[1] - c3[1]) * t
                g = c3[2] + (c1[2] - c3[2]) * t
                b = c3[3] + (c1[3] - c3[3]) * t
                a = c3[4] + (c1[4] - c3[4]) * t
            end
            t_out[t_out_iter] = '\a' .. coloring.RGBAtoHEX(r, g, b, a)
            t_out[t_out_iter + 1] = string:sub(i, i)
            t_out_iter = t_out_iter + 2
        end
        return table.concat(t_out)
    end
    function coloring.lazy_lerp (a, b, t)
        a = tonumber(a) or 0
        b = tonumber(b) or 0
        t = math.max(0, math.min(1, tonumber(t) or 0))
        return a + (b - a) * (t * t * (3 - 2 * t))
    end
    function coloring.lerp_color (c1, c2, t)
        local r1, g1, b1, a1 = (c1[1] or 255), (c1[2] or 255), (c1[3] or 255), (c1[4] or 255)
        local r2, g2, b2, a2 = (c2[1] or 255), (c2[2] or 255), (c2[3] or 255), (c2[4] or 255)
        return {
            coloring.lazy_lerp(r1, r2, t),
            coloring.lazy_lerp(g1, g2, t),
            coloring.lazy_lerp(b1, b2, t),
            coloring.lazy_lerp(a1, a2, t)
        }
    end
    function coloring.normalize_color(col)
        if type(col) ~= "table" then return {255, 255, 255, 255} end
        if type(col[1]) == "table" then col = col[1] end
        local r = math.max(0, math.min(255, tonumber(col[1]) or tonumber(col.r) or 255))
        local g = math.max(0, math.min(255, tonumber(col[2]) or tonumber(col.g) or 255))
        local b = math.max(0, math.min(255, tonumber(col[3]) or tonumber(col.b) or 255))
        local a = math.max(0, math.min(255, tonumber(col[4]) or tonumber(col.a) or 255))
        return {r, g, b, a}
    end
    function coloring.get_color_str(c)
        c = coloring.normalize_color(c)
        return string.format("\a%02x%02x%02x%02x", c[1], c[2], c[3], c[4])
    end
    function coloring.get_gradient(str, mode, c1, c2, c3, speed, ...)
        local time = globals.realtime() * speed * 2 * math.pi
        local sin_val = (math.sin(time) + 1) / 2
        local perc = math.max(0, math.min(1, sin_val))
        local col1 = coloring.normalize_color(c1)
        local col2 = coloring.normalize_color(c2)
        local col3 = coloring.normalize_color(c3)
        local col
        if mode == "2x" then
            col = coloring.lerp_color(col1, col2, perc)
        elseif mode == "3x" then
            if perc < 0.5 then
                col = coloring.lerp_color(col1, col2, perc * 2)
            else
                col = coloring.lerp_color(col2, col3, (perc - 0.5) * 2)
            end
        else
            col = col1
        end
        if str and str ~= "" then
            local prefix = coloring.get_color_str(col)
            return prefix .. str
        else
            return col
        end
    end
    function coloring.color(menu, menu2, menu3, default, color1, color2, color3, speed)
        local color_mode = menu  
        local default_c = coloring.normalize_color(default)
        if color_mode == "Skeet" or color_mode ~= "Custom" then
            return function(str) return "\v" .. (str or "") end
        elseif color_mode == "Custom" then
            local color_type = menu2  
            if color_type == "Default" then
                local prefix = coloring.get_color_str(default_c)
                return function(str) return prefix .. (str or "") end
            elseif color_type == "Gradient" then
                local grad = menu3  
                if grad == "2x" or grad == "3x" then
                    return function(str)
                        if not str or str == "" then return str end
                        local time = globals.realtime() * (speed or 1)
                        if grad == "2x" then
                            local col_start = coloring.normalize_color(color1)
                            local col_end = coloring.normalize_color(color2)
                            return coloring.gradient_text(time, str,
                                col_start[1], col_start[2], col_start[3], col_start[4],
                                col_end[1], col_end[2], col_end[3], col_end[4]
                            )
                        else 
                            local col1 = coloring.normalize_color(color1)
                            local col2 = coloring.normalize_color(color2)
                            local col3 = coloring.normalize_color(color3)
                            return coloring.multi_gradient_text(time, str, col1, col2, col3)
                        end
                    end
                else
                    local prefix = coloring.get_color_str(default_c)
                    return function(str) return prefix .. (str or "") end
                end
            else
                local prefix = coloring.get_color_str(default_c)
                return function(str) return prefix .. (str or "") end
            end
        end
        local prefix = coloring.get_color_str(default_c)
        return function(str) return prefix .. (str or "") end
    end
end
    
local render = {} do 
    function render.rec(x, y, w, h, radius, color)
        radius = math.min(w/2, h/2, radius)
        local r, g, b, a = unpack(color)
        renderer.rectangle(x, y + radius, w, h - radius*2, r, g, b, a)
        renderer.rectangle(x + radius, y, w - radius*2, radius, r, g, b, a)
        renderer.rectangle(x + radius, y + h - radius, w - radius*2, radius, r, g, b, a)
        renderer.circle(x + radius, y + radius, r, g, b, a, radius, 180, 0.25)
        renderer.circle(x - radius + w, y + radius, r, g, b, a, radius, 90, 0.25)
        renderer.circle(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25)
        renderer.circle(x + radius, y - radius + h, r, g, b, a, radius, -90, 0.25)
    end

    
    function render.rec_outline(x, y, w, h, radius, thickness, color)
        radius = math.min(w/2, h/2, radius)
        local r, g, b, a = unpack(color)
        if radius == 1 then
            renderer.rectangle(x, y, w, thickness, r, g, b, a)
            renderer.rectangle(x, y + h - thickness, w , thickness, r, g, b, a)
        else
            renderer.rectangle(x + radius, y, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x + radius, y + h - thickness, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.rectangle(x + w - thickness, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.circle_outline(x + radius, y + radius, r, g, b, a, radius, 180, 0.25, thickness)
            renderer.circle_outline(x + radius, y + h - radius, r, g, b, a, radius, 90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + radius, r, g, b, a, radius, -90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 0.25, thickness)
        end
    end

    function render.glow_module(x, y, w, h, width, rounding, accent, accent_inner)
        local thickness = 1
        local offset = 1
        local r, g, b, a = unpack(accent)

        if accent_inner then
            render.rec(x , y, w, h + 1, rounding, accent_inner)
        end

        for k = 0, width do
            if a * (k/width)^(1) > 5 then
                local accent = {r, g, b, a * (k/width)^(2)}

                render.rec_outline(x + (k - width - offset)*thickness, y + (k - width - offset) * thickness, w - (k - width - offset)*thickness*2, h + 1 - (k - width - offset)*thickness*2, rounding + thickness * (width - k + offset), thickness, accent)
            end
        end
    end

    function render.create_blur_panel(x, y, w, h, alpha, radius, r, g, b, a, grad_mode, color1, color2, color3, speed)
        local current_col
        if grad_mode and (grad_mode == "2x" or grad_mode == "3x") then
            current_col = coloring.get_gradient("", grad_mode, color1, color2, color3, speed)
            r, g, b, a = current_col[1], current_col[2], current_col[3], current_col[4]
        end

        local blur_strength = 5
        for i = blur_strength, 1, -1 do
            local offset = i * 0.6
            local blur_alpha = math.floor(alpha * 0.15 * (blur_strength - i + 1) / blur_strength)
            render.rec(x - offset, y - offset, w + offset * 2, h + offset * 2, radius + offset, {r * 0.4, g * 0.4, b * 0.4, blur_alpha})
        end

        render.rec(x, y, w, h, radius, {25, 25, 25, math.floor(alpha * 0.85)})

        local gradient_height = math.floor(h * 0.4)
        renderer.gradient(x + radius, y + radius, w - radius * 2, gradient_height, r * 0.7, g * 0.7, b * 0.7, math.floor(alpha * 0.2), r * 0.5, g * 0.5, b * 0.5, 0, false)

        local border_alpha = math.floor(alpha * 0.25)

        renderer.rectangle(x + radius, y, w - radius * 2, 1, r, g, b, border_alpha)

        renderer.rectangle(x + radius, y + h - 1, w - radius * 2, 1, r, g, b, border_alpha)

        renderer.rectangle(x, y + radius, 1, h - radius * 2, r, g, b, border_alpha)
        
        renderer.rectangle(x + w - 1, y + radius, 1, h - radius * 2, r, g, b, border_alpha)
        
        renderer.circle_outline(x + radius, y + radius, r, g, b, border_alpha, radius, 180, 0.25, 1)
        renderer.circle_outline(x + w - radius, y + radius, r, g, b, border_alpha, radius, 270, 0.25, 1)
        renderer.circle_outline(x + radius, y + h - radius, r, g, b, border_alpha, radius, -270, 0.25, 1)
        renderer.circle_outline(x + w - radius, y + h - radius, r, g, b, border_alpha, radius, 0, 0.25, 1)
    end

    function render.rounded_rectangle(x, y, w, h, r, g, b, a, radius)
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
end

local glass_ui = {} do
    local font_ok = false
    local fonts = {}

    pcall(ffi.cdef, [[
        int AddFontResourceExA(const char *name, unsigned long fl, void *pdv);
    ]])

    do
        local ok, gdi32 = pcall(ffi.load, "gdi32")
        if ok and gdi32 ~= nil then
            local paths = {
                "Inter-Regular.otf",
                [[C:\Users\mitya\Downloads\Inter-Regular.otf]]
            }
            for _, path in ipairs(paths) do
                pcall(function()
                    gdi32.AddFontResourceExA(path, 0x10, nil)
                end)
            end
        end
    end

    local function vtable_bind(module, interface, index, typedef)
        local instance = client.create_interface(module, interface)
        if instance == nil then return nil end
        local fn = ffi.cast(typedef, ffi.cast("void***", instance)[0][index])
        return function(...)
            return fn(instance, ...)
        end
    end

    local surface = {
        draw_set_color = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)"),
        draw_filled_rect = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)"),
        draw_outlined_rect = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)"),
        set_text_font = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)"),
        set_text_color = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)"),
        set_text_pos = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)"),
        print_text = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)"),
        create_font = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)"),
        set_font_glyph = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)"),
        get_text_size = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
    }

    local localize_to_unicode = vtable_bind("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
    local wchar_buffer_t = ffi.typeof("wchar_t[?]")
    local int_ptr_t = ffi.typeof("int[1]")

    local function to_wide(text)
        text = tostring(text or "")
        local buffer = wchar_buffer_t(1024)
        if localize_to_unicode ~= nil then
            localize_to_unicode(text, buffer, 1024)
        end
        return buffer, text:len()
    end

    local font_cache = {}
    local function create_font(name, size, weight, flags)
        if surface_lib ~= nil and surface_lib.create_font ~= nil then
            local ok, font = pcall(surface_lib.create_font, name, size, weight, flags or {0x200})
            if ok and font ~= nil then return font end
        end

        if surface.create_font == nil or surface.set_font_glyph == nil then return nil end
        local flags_value = 0
        if type(flags) == "table" then
            for i = 1, #flags do
                flags_value = flags_value + flags[i]
            end
        else
            flags_value = flags or 0
        end
        local cache_key = string.format("%s:%d:%d:%d", name, size, weight, flags_value)
        if font_cache[cache_key] == nil then
            font_cache[cache_key] = surface.create_font()
            surface.set_font_glyph(font_cache[cache_key], name, size, weight, 0, 0, flags_value, 0, 0)
        end
        return font_cache[cache_key]
    end

    fonts.small = create_font("Inter", 10, 400, {0x200})
    fonts.regular = create_font("Inter", 12, 400, {0x200})
    fonts.medium = create_font("Inter", 13, 400, {0x200})
    fonts.large = create_font("Inter", 15, 400, {0x200})
    fonts.display = create_font("Inter", 18, 400, {0x200})
    fonts.logo = create_font("Inter", 16, 400, {0x200})
    font_ok = fonts.regular ~= nil and (
        surface_lib ~= nil and surface_lib.draw_text ~= nil and surface_lib.get_text_size ~= nil
        or surface.print_text ~= nil and surface.get_text_size ~= nil and localize_to_unicode ~= nil
    )

    local fallback_flags = {
        small = "-",
        regular = nil,
        medium = nil,
        large = nil,
        display = nil,
        logo = nil
    }

    function glass_ui.measure(style, text)
        style = style or "regular"
        text = tostring(text or "")
        if font_ok and fonts[style] ~= nil then
            if surface_lib ~= nil and surface_lib.get_text_size ~= nil then
                local ok, w, h = pcall(surface_lib.get_text_size, fonts[style], text)
                if ok then
                    return tonumber(w) or 0, tonumber(h) or 0
                end
            end

            local wide = to_wide(text)
            local w, h = int_ptr_t(), int_ptr_t()
            surface.get_text_size(fonts[style], wide, w, h)
            return tonumber(w[0]) or 0, tonumber(h[0]) or 0
        end
        return renderer.measure_text(fallback_flags[style], text)
    end

    function glass_ui.text(x, y, r, g, b, a, style, text)
        style = style or "regular"
        text = tostring(text or "")
        a = math.floor(clamp(a or 255, 0, 255))
        if a <= 0 or text == "" then return end
        if font_ok and fonts[style] ~= nil then
            if surface_lib ~= nil and surface_lib.draw_text ~= nil then
                local ok = pcall(surface_lib.draw_text, math.floor(x), math.floor(y),
                    math.floor(r), math.floor(g), math.floor(b), a, fonts[style], text)
                if ok then return end
            end

            local wide, len = to_wide(text)
            surface.set_text_pos(math.floor(x), math.floor(y))
            surface.set_text_font(fonts[style])
            surface.set_text_color(math.floor(r), math.floor(g), math.floor(b), a)
            surface.print_text(wide, len, 0)
        else
            renderer.text(math.floor(x), math.floor(y), r, g, b, a, fallback_flags[style], 0, text)
        end
    end

    local function alpha_part(alpha, pct)
        return math.floor(clamp(alpha or 255, 0, 255) * pct)
    end

    local function surface_ready()
        return surface.draw_set_color ~= nil and surface.draw_filled_rect ~= nil
    end

    local function surface_rect(x, y, w, h, r, g, b, a)
        if not surface_ready() then return false end
        x, y, w, h = math.floor(x), math.floor(y), math.floor(w), math.floor(h)
        if w <= 0 or h <= 0 then return true end
        surface.draw_set_color(math.floor(r), math.floor(g), math.floor(b), math.floor(a))
        surface.draw_filled_rect(x, y, x + w, y + h)
        return true
    end

    local function surface_round_rect(x, y, w, h, radius, color)
        if not surface_ready() then return false end
        color = coloring.normalize_color(color or {17, 17, 17, 255})
        local r, g, b, a = color[1], color[2], color[3], math.floor(clamp(color[4] or 255, 0, 255))
        x, y, w, h = math.floor(x), math.floor(y), math.floor(w), math.floor(h)

        if a <= 0 or w <= 0 or h <= 0 then return true end
        radius = math.floor(clamp(radius or 0, 0, math.min(w, h) / 2))
        if radius <= 1 then
            return surface_rect(x, y, w, h, r, g, b, a)
        end

        surface_rect(x, y + radius, w, h - radius * 2, r, g, b, a)
        for i = 0, radius - 1 do
            local dy = radius - i - 0.5
            local inset = math.floor(radius - math.sqrt(math.max(0, radius * radius - dy * dy)))
            local line_w = w - inset * 2
            if line_w > 0 then
                surface_rect(x + inset, y + i, line_w, 1, r, g, b, a)
                surface_rect(x + inset, y + h - i - 1, line_w, 1, r, g, b, a)
            end
        end
        return true
    end

    function glass_ui.rect(x, y, w, h, r, g, b, a)
        a = math.floor(clamp(a or 255, 0, 255))
        if a <= 0 then return end
        if not surface_rect(x, y, w, h, r, g, b, a) then
            renderer.rectangle(math.floor(x), math.floor(y), math.floor(w), math.floor(h), r, g, b, a)
        end
    end

    function glass_ui.panel(x, y, w, h, color, alpha, radius)
        alpha = math.floor(clamp(alpha or 255, 0, 255))
        if alpha <= 0 then return end
        radius = radius or 6
        color = coloring.normalize_color(color or {155, 143, 204, 255})
        local r, g, b = color[1], color[2], color[3]

        if surface_ready() then
            surface_round_rect(x - 1, y + 2, w + 2, h + 2, radius + 1, {0, 0, 0, alpha_part(alpha, 0.34)})
            surface_round_rect(x, y, w, h, radius, {0, 0, 0, alpha_part(alpha, 0.92)})
            surface_round_rect(x + 1, y + 1, w - 2, h - 2, math.max(1, radius - 1), {80, 84, 92, alpha_part(alpha, 0.34)})
            surface_round_rect(x + 2, y + 2, w - 4, h - 4, math.max(1, radius - 2), {17, 17, 17, alpha_part(alpha, 0.86)})

            if w > radius * 2 then
                surface_rect(x + radius, y + h - 1, w - radius * 2, 1, r, g, b, alpha_part(alpha, 0.42))
            end
            return
        end

        render.rec(x - 1, y + 2, w + 2, h + 2, radius + 1, {0, 0, 0, alpha_part(alpha, 0.34)})
        render.rec(x, y, w, h, radius, {17, 17, 17, alpha_part(alpha, 0.86)})

        if w > radius * 2 and h > 2 then
            renderer.gradient(x + radius, y + 1, w - radius * 2, math.min(h - 2, 18),
                255, 255, 255, alpha_part(alpha, 0.035),
                255, 255, 255, 0, false)
        end

        render.rec_outline(x, y, w, h, radius, 1, {0, 0, 0, alpha_part(alpha, 0.92)})
        render.rec_outline(x + 1, y + 1, w - 2, h - 2, math.max(1, radius - 1), 1, {80, 84, 92, alpha_part(alpha, 0.34)})

        if w > radius * 2 then
            local glow_w = math.floor((w - radius * 2) / 2)
            if glow_w > 0 then
                renderer.gradient(x + radius, y + h - 1, glow_w, 1,
                    0, 0, 0, 0,
                    r, g, b, alpha_part(alpha, 0.62), true)
                renderer.gradient(x + radius + glow_w, y + h - 1, glow_w, 1,
                    r, g, b, alpha_part(alpha, 0.62),
                    0, 0, 0, 0, true)
            end
        end
    end

    function glass_ui.progress(x, y, w, h, value, color, alpha)
        alpha = math.floor(clamp(alpha or 255, 0, 255))
        if alpha <= 0 then return end
        value = clamp(value or 0, 0, 1)
        color = coloring.normalize_color(color or {155, 143, 204, 255})
        local r, g, b = color[1], color[2], color[3]
        local radius = math.max(1, math.floor(h / 2))

        if surface_ready() then
            surface_round_rect(x, y, w, h, radius, {22, 24, 29, alpha_part(alpha, 0.82)})
            surface_round_rect(x + 1, y + 1, w - 2, h - 2, math.max(1, radius - 1), {12, 14, 18, alpha_part(alpha, 0.42)})
            local fill_w = math.floor(w * value)
            if fill_w > 0 then
                surface_round_rect(x, y, fill_w, h, radius, {r, g, b, alpha_part(alpha, 0.88)})
                surface_rect(x + 1, y, math.max(0, fill_w - 2), 1, 255, 255, 255, alpha_part(alpha, 0.18))
            end
            return
        end

        render.rec(x, y, w, h, radius, {22, 24, 29, alpha_part(alpha, 0.82)})
        render.rec_outline(x, y, w, h, radius, 1, {86, 90, 100, alpha_part(alpha, 0.20)})

        local fill_w = math.floor(w * value)
        if fill_w > 0 then
            if fill_w <= h then
                renderer.rectangle(x, y, fill_w, h, r, g, b, alpha_part(alpha, 0.9))
            else
                render.rec(x, y, fill_w, h, radius, {r, g, b, alpha_part(alpha, 0.88)})
                renderer.rectangle(x + 1, y, math.max(0, fill_w - 2), 1, 255, 255, 255, alpha_part(alpha, 0.18))
            end
        end
    end

    function glass_ui.colored_width(parts, style)
        local width_sum = 0
        for i = 1, #parts do
            local w = glass_ui.measure(style or parts[i].style or "regular", parts[i].text or "")
            width_sum = width_sum + w
        end
        return width_sum
    end

    function glass_ui.colored_text(x, y, parts, alpha, default_style)
        local tx = x
        for i = 1, #parts do
            local part = parts[i]
            local col = part.color or {235, 236, 242, 255}
            local text = part.text or ""
            local style = part.style or default_style or "regular"
            glass_ui.text(tx, y, col[1], col[2], col[3], alpha, style, text)
            local w = glass_ui.measure(style, text)
            tx = tx + w
        end
        return tx
    end
end

local ref = {
    -- Rage tab references
    rage_cb = {pui.reference('RAGE', 'Aimbot', 'Enabled')},
    dt = {pui.reference('RAGE', 'Aimbot', 'Double tap')},
    dt_fakelag = pui.reference('RAGE', 'Aimbot', 'Double tap fake lag limit'),
    forcebaim = pui.reference('RAGE', 'Aimbot', 'Force body aim'),
    safepoint = pui.reference('RAGE', 'Aimbot', 'Force safe point'),
    minimum_damage_override = {pui.reference('RAGE', 'Aimbot', 'Minimum damage override')},
    minimum_damage = {pui.reference('RAGE', 'Aimbot', 'Minimum damage')},
    hitchance = pui.reference("rage", "aimbot", "minimum hit chance"),
    multipoint = pui.reference("rage", "aimbot", "multi-point scale"),
    automatic_scope = pui.reference('RAGE', 'Aimbot', 'Automatic scope'),
    target_hitbox = pui.reference('RAGE', 'Aimbot', 'Target hitbox'),
    multi_point = pui.reference('RAGE', 'Aimbot', 'Multi-point'),
    unsafe_box = pui.reference('RAGE', 'Aimbot', 'Avoid unsafe hitboxes'),
    delay_shot = pui.reference("Rage", "Other", "Delay shot"),
    auto_scop = pui.reference("Rage", "Aimbot", "Automatic scope"),
    spread = pui.reference("Rage", "Other", "Log misses due to spread"),
    accuracy_boost = pui.reference("Rage", "Other", "Accuracy boost"),
    qs_ref = { pui.reference("RAGE", "Aimbot", "Quick stop") },
    dt_qs_ref = { pui.reference("RAGE", "Aimbot", "Double tap quick stop") },
    
    -- AA (Anti-Aim) tab references
    enabled = pui.reference('AA', 'Anti-aimbot angles', 'Enabled'),
    pitch = {pui.reference('AA', 'Anti-aimbot angles', 'Pitch')}, 
    yaw = {pui.reference('AA', 'Anti-aimbot angles', 'Yaw')},
    yawbase = pui.reference('AA', 'Anti-aimbot angles', 'Yaw base'),
    yawjitter = {pui.reference('AA', 'Anti-aimbot angles', 'Yaw jitter')},
    bodyyaw = {pui.reference('AA', 'Anti-aimbot angles', 'Body yaw')},
    fsbodyyaw = pui.reference('AA', 'anti-aimbot angles', 'Freestanding body yaw'),
    edgeyaw = pui.reference('AA', 'Anti-aimbot angles', 'Edge yaw'),
    freestand = {pui.reference('AA', 'Anti-aimbot angles', 'Freestanding')},
    roll = {pui.reference('AA', 'Anti-aimbot angles', 'Roll')},
    
    -- Fake lag references
    fakeenabled = {pui.reference("AA", "Fake lag", "Enabled")}, 
    amount = {pui.reference("AA", "Fake lag", "Amount")},
    variance = {pui.reference("AA", "Fake lag", "Variance")},
    limit = {pui.reference("AA", "Fake lag", "Limit")},
    
    -- Other AA references
    other_slowmotion = {pui.reference('AA', 'Other', 'Slow motion')},
    other_legmovement = {pui.reference('AA', 'Other', 'Leg movement')},
    other_fkpeek = {pui.reference('AA', 'Other', 'Fake peek')},
    os = {pui.reference('AA', 'Other', 'On shot anti-aim')},
    
    -- Misc references
    clantag = pui.reference('Misc', 'Miscellaneous', 'Clan tag spammer'),
    fov = pui.reference('Misc', 'Miscellaneous', 'Override FOV'),
    zoom = pui.reference('Misc', 'Miscellaneous', 'Override zoom FOV'),
    ping = {pui.reference('Misc', 'Miscellaneous', 'Ping spike')},
    edge_jump = {pui.reference('Misc', 'Movement', 'Jump at edge')},
    
    -- Other references
    autopeek = {pui.reference('RAGE', 'Other', 'Quick peek assist')},
    quickpeek_mode = pui.reference('RAGE', 'Other', 'Quick peek assist mode'),
    fakeduck = pui.reference('RAGE', 'Other', 'Duck peek assist'),
    scope_overlay = pui.reference('VISUALS', 'Effects', 'Remove scope overlay'),
    third_person_alive = pui.reference('VISUALS', 'Effects', 'Force third person (alive)'),
    output = pui.reference("MISC", "Miscellaneous", "Draw console output"),
}

local addon = {} do

    function addon.get_elapsed_time()
        local elapsed_seconds = client.unix_time() - start_time
        local hours = math.floor(elapsed_seconds / 3600)
        local minutes = math.floor((elapsed_seconds - hours * 3600) / 60)
        local seconds = math.floor(elapsed_seconds - hours * 3600 - minutes * 60)
        return string.format('%02d:%02d:%02d', hours, minutes, seconds)
    end

    function addon.fix()
        local lp = entity.get_local_player()
        if not lp then return end
    
        local tickbase = entity.get_prop(lp, 'm_nTickBase') - globals.tickcount()
        local doubletap_ref = ref.dt[1]:get() and ref.dt[1]:get_hotkey() and not ref.fakeduck:get()
        local os_ref = ref.os[1]:get() and ref.os[1]:get_hotkey() and not ref.fakeduck:get()
        local active_weapon = entity.get_prop(lp, 'm_hActiveWeapon')
        if active_weapon == nil then return end
        local weapon_idx = entity.get_prop(active_weapon, 'm_iItemDefinitionIndex')
        if weapon_idx == nil or weapon_idx == 64 then return end
        local LastShot = entity.get_prop(active_weapon, 'm_fLastShotTime')
        if LastShot == nil then return end
        local single_fire_weapon = weapon_idx == 40 or weapon_idx == 9 or weapon_idx == 64 or weapon_idx == 27 or weapon_idx == 29 or weapon_idx == 35
        local value = single_fire_weapon and 0 or 0.50
        local in_attack = globals.curtime() - LastShot <= value

        if tickbase > 0 and doubletap_ref then
            if in_attack then
                ref.rage_cb[1]:set_hotkey('Always on')
            else
                ref.rage_cb[1]:set_hotkey('On hotkey')
            end
        elseif tickbase > 0 and os_ref then
            if in_attack then
                ref.rage_cb[1]:set_hotkey('Always on')
            else
                ref.rage_cb[1]:set_hotkey('On hotkey')
            end
        else
            ref.rage_cb[1]:set_hotkey('Always on')
        end
    end

    function addon.block(cmd)
        if ui.is_menu_open() then 
            if client.key_state(0x01) or client.key_state(0x02) then
                cmd.in_attack = false
                cmd.in_attack2 = false
            end
        end
    end

    function addon.doubletap_charged()
        if not (ref.dt[1]:get() and ref.dt[1]:get_hotkey()) and not ref.fakeduck:get() then
            return false
        end
        if not entity.is_alive(entity.get_local_player()) or entity.get_local_player() == nil then
            return
        end
        local weapon = entity.get_prop(entity.get_local_player(), 'm_hActiveWeapon')
        if weapon == nil then
            return false
        end
        local next_attack = entity.get_prop(entity.get_local_player(), 'm_flNextAttack') + 0.01
        local checkcheck = entity.get_prop(weapon, 'm_flNextPrimaryAttack')
        if checkcheck == nil then
            return
        end
        local next_primary_attack = checkcheck + 0.01
        if next_attack == nil or next_primary_attack == nil then
            return false
        end
        return next_attack - globals.curtime() < 0 and next_primary_attack - globals.curtime() < 0 
    end

    client.set_event_callback("setup_command", addon.block)
    client.set_event_callback("setup_command", addon.fix)
end

local aa_gp = pui.group('aa', 'anti-aimbot angles')
local fl_gp = pui.group('aa', 'fake lag')
local oth_group = pui.group('aa', 'other')

local info = {
    name = _USER_NAME and _USER_NAME or 'recode',
    build = _SCRIPT_NAME and _SCRIPT_NAME or "pacantech",
}

local antiaim_cond = {'Global', 'Standing', 'Walking', 'Running', 'Aerobic', 'Aerobic+', 'Crouch', 'Crouch+', 'Freestanding', 'Manuals'}
local aimtools_cond = {"Pistol", "Deagle", "Revolver", "Scout", "Auto", "Awp"}
local hit_cond = {"Pistol", "Deagle", "Revolver", "Scout", "Auto", "Awp"}
local lines21 = aa_gp:label('\vConfiguration')
local list_select = aa_gp:multiselect("\ndwa", {"Information", "Ragebot", "Anti-Aim", "Visuals", "Miscellaneous"})

local hitchance = {
    label = aa_gp:label("Hitchance Settings"),
    wp = aa_gp:combobox("\n", hit_cond),
}

local hit = {}

for i = 1, #hit_cond do
    hit[i] = {
        label_ovr_hit = aa_gp:label("Override Hitchance"),
        ovr_hit = aa_gp:slider("\n", 0, 100, 0, true, "%", 1, {[0] = "Off"}),
        hot = aa_gp:hotkey("\nadwwa", true),
        label_ovr_air_hit = aa_gp:label("Air Hitchance"),
        ovr_air_hit = aa_gp:slider("\n", 0, 100, 0, true, "%", 1, {[0] = "Off"})
    }
end

local scout = {
    label = aa_gp:label(" "),
    jumpstop_hotkey = aa_gp:hotkey(" ", true),
    jumpstop_distance = aa_gp:slider("\nadwadwa", 350, 1000, 350, true, "ft", 1, {[350] = "Always on"}),
    jumpstop_delay = aa_gp:checkbox("Delay Shot"),
}

local bl = aa_gp:label(" ")

local menu = {
    lb_main = fl_gp:label("\v" .. info.build .. " \v/ " .. "\r" .. info.name),
    main = fl_gp:combobox("\nadawdwada", {" Information", " Ragebot", " Anti-Aim", " Visuals", " Miscellaneous"}),

    information = {
        user = fl_gp:label("\vBuild: \r" .. info.name),
        build = fl_gp:label("\vBuild: \r" .. info.build:gsub("pacantech", " ")),
        linessoc = fl_gp:label(" "),
        session = fl_gp:label("\vSession: "),
        time = fl_gp:label('Time: '),
        kills = fl_gp:label('Kills: '),
        deaths = fl_gp:label('Deaths: '),

        lb_color = oth_group:label("\vColor Settings"),
        color = oth_group:combobox("\nColor", {"Gamesense", "Custom"}),
        color_type = oth_group:combobox("\nColor Type", {"Default", "Gradient"}),
        color_gradient = oth_group:combobox("\nColor Gradient", {"2x", "3x"}),
        color_speed = oth_group:slider("\nColor Speed", 1, 5, 2, true, " ", 1),
        lb_default_color = oth_group:label("\vDefault Color"),
        default_color = oth_group:color_picker("\nColor", 255, 255, 255),
        lb_color1 = oth_group:label("\vFirst Color"),
        color1 = oth_group:color_picker("\nColor", 255, 255, 255),
        lb_color2 = oth_group:label("\vSecond Color"),
        color2 = oth_group:color_picker("\nColor", 255, 255, 255),
        lb_color3 = oth_group:label("\vThird Color"),
        color3 = oth_group:color_picker("\nColor", 255, 255, 255),

        list = aa_gp:listbox('Config', ' ', false),
        name = aa_gp:textbox('\nConfig name', ' ', false),
        button_load = aa_gp:button(' Load'),
        button_save = aa_gp:button(' Save'),
        button_save_check = aa_gp:button('Are you sure?'),
        button_import = aa_gp:button(' Import'),  
        button_export = aa_gp:button(' Export'),
        button_create = aa_gp:button(" Create"),
        button_delete = aa_gp:button(' Delete'),
    },

    ragebot = {
        lb_ = fl_gp:label(" "),
        lb_auto_tp = fl_gp:label("\vAutomatic Teleport Settings"),
        auto_tp_hot = fl_gp:hotkey("\nadwadwa", true),
        auto_tp_air_check = fl_gp:checkbox("In Air Only"),
        lb_auto_tp_opt = fl_gp:label("\vOptions"),
        auto_tp_opt = fl_gp:multiselect("\nadwad", {"Break", "Ignore JumpScout"}),
        lb_auto_tp_wp = fl_gp:label("Weapons"),
        auto_tp_wp = fl_gp:multiselect("\nWeapons", {"Pistols", "Deagle", "Scout", "Awp", "Zeus", "Knife"}),
        auto_tp_delay = fl_gp:slider("Automatic Delay", 0, 16, 0, true, "t", 1, {[0] = "Default"}),
        lb15 = fl_gp:label(" "),
        lb_magic_key = fl_gp:label("\vOnly Head Settings"),
        magic_key = fl_gp:hotkey("\nadwadwa", true),
        magic_hitbox = fl_gp:multiselect("\nadwadwa", {"Head", "Chest", "Stomach", "Arms", "Legs", "Feet"}),
        lb_100 = fl_gp:label(" "),
        en_forceshot = fl_gp:checkbox("\ndawdwa"),
        en_forceshot_ht = fl_gp:hotkey('\nadwa', true),
        lb_forceshot = fl_gp:label('dwadwa '),
        force_shot_weapon = fl_gp:multiselect('\nadwdwa', {"Pistol", "Deagle", "Revolver", "Scout", "AWP", "Auto"}),
        hitchance_force_shot = fl_gp:slider('\nHitchance', -1, 100, -1, true, "%", 1, {[-1] = 'Auto'}),
        lb_main = aa_gp:label("Rage Settings"),
        resolver = aa_gp:checkbox("Jitter Correction"),
        target = aa_gp:checkbox("Target"),
        hitrate = aa_gp:multiselect("Hitrate", {'Shot/Hit', 'Percentage'}),
        lb99 = aa_gp:label(' '),
        lb_autostop = aa_gp:label(' '),
        autostop = aa_gp:combobox('\nadwa', {'Helper', 'Off'}),
        lb54 = aa_gp:label(' '),
        lb_inter = aa_gp:label(' '),
        inter = aa_gp:slider('\nawdwad', -1, 16, -1, true, ' ', 1, {[-1] = 'Off', [0] = 'Automatic'}),
        lb2 = aa_gp:label(" "),
        lb_auto = aa_gp:label("\vAuto OS Settings"),
        cond = aa_gp:multiselect("Condition", {'Standing', 'Running', 'Walking', 'Aerobic', 'Aerobic+', 'Crouch', 'Crouch+'}),
        weapon = aa_gp:multiselect("Weapons", {"Pistol", "Deagle", "Revolver", "Scout", "AWP", "Auto"}),
        lb4 = aa_gp:label(" "),
        lb_noscope = aa_gp:label("Noscope mode"),
        noscope_wp = aa_gp:multiselect("Weapons", {"Scout", "AWP", "Auto"}),
        noscope_dist = aa_gp:slider("\n", 5, 60, 15, true, "ft", 1, {[5] = "Minimal", [30] = "Medium", [60] = "Maximum"}),
        noscope_hit = aa_gp:slider("\n", 0, 100, 55, true, "%", 1, {[0] = "Off"}),

        lb3 = aa_gp:label(" "),
        ai = aa_gp:checkbox("\nAI Peek Settings"),
        ai_hotkey = aa_gp:hotkey("\nadwad", true),
        lb_ai = aa_gp:label("\vAI Peek Settings"),
        ai_visual = aa_gp:checkbox("Render Zone"),
        ai_risk_mode = aa_gp:combobox("Risk Mode", {"Aggressive", "Balanced", "Safe"}),
        ai_hit = aa_gp:slider("Override Hitchance", 0, 100, 0, true, "%", 1, {[0] = "Off"}),
        ai_dm = aa_gp:slider("Override Damage", 0, 126, 0, true, " ", 1, {[0] = "Off"}),
        ai_delay = aa_gp:slider("Delay", 0, 100, 0, true, " ", 0.01, {[0] = "Off"}),
        ai_hitbox = aa_gp:multiselect("Hitbox", {"Head", "Chest", "Stomach", "Arms", "Legs", "Feet"}), 
        ai_weapon = aa_gp:multiselect("Weapons Selection", aimtools_cond),
        main_switch = oth_group:checkbox("\nAimtools"),
        main_label = oth_group:label("\vAimtools"),
        esp_flags = oth_group:checkbox("ESP Flags"),
        esp_font = oth_group:combobox("\nadwadwa", {"Small", "Verdana", "Bold"}),
        esp_color = oth_group:color_picker(" ", 255, 255, 255),
        lb1 = oth_group:label(" "),
        main_combobox = oth_group:combobox("Weapon", aimtools_cond),
    },

    antiaim = {  
        selection = fl_gp:combobox("\ndwada", {" Builder", " Features", " Other"}),
        lb_side = fl_gp:label(' '),
        side_switch = fl_gp:combobox('\ndwadwad', {'T', 'CT'}),
        send_ct = fl_gp:button("Send CT"),
        send_t = fl_gp:button("Send T"),

        --Builder
        label = aa_gp:label("\vAnti-aim \rcondition"),
        condition = aa_gp:combobox('\nAnti-aim conditions', antiaim_cond),
        lb_flick_settings = oth_group:label("\vFlick Settings"),
        fl_hot = oth_group:hotkey("\nEnable Flick Shot", true),
        pitch_type_fl = oth_group:combobox('Pitch', {'Off', 'Static', 'Jitter', 'Spin', 'Spin[MOD]','Random', 'Random Ticks'}),
        pitch_static_fl = oth_group:slider('Angle', -89, 89, 0, true, '°', 1),
        pitch_mode1_fl = oth_group:slider('Angle 1', -89, 89, 0, true, '°', 1),
        pitch_mode2_fl = oth_group:slider('Angle 2', -89, 89, 0, true, '°', 1),
        pitch_speed_fl = oth_group:slider('Angle Speed', -50, 50, 20, true, ' ', 0.1),
        pitch_jitter_speed_fl = oth_group:slider("Speed Ticks", 2, 14, 2, true, 't', 1, {[2] = ' '}),
        pitch_slow_def_fl = oth_group:slider('Speed', 0, 10, 0, true, ' ', 0.1),

        --Features
        lb_features = aa_gp:label("Features"),
        features = aa_gp:multiselect('\nFeatures', {'Safe head', 'Warmup AA/No Enemies', 'Avoid Backstab', 'E-Bomb Fix'}),
        avoid = aa_gp:slider("\nadwa", 350, 1000, 350, true, "ft", 1, {[350] = "Default"}),
        label4 = aa_gp:label(" "),
        lb_safe = aa_gp:label("Safe head overrides"),
        safe = aa_gp:multiselect('\nSafe head overrides', {'Knife on Air + Duck', 'Taser on Air + Duck', 'High distance'}),
        label_high = aa_gp:label("High Distance Options"),
        high_distance_options = aa_gp:multiselect('\nadwad', {'Standing', 'Running', 'Walking', 'Aerobic', 'Aerobic+', 'Crouch', 'Crouch+', 'Manuals', 'Freestanding'}),
        label_high_ep1 = aa_gp:label(" "),
        lb_safe_head = aa_gp:label("Safe head options"),
        safe_head = aa_gp:combobox("\nSafe head options", {"Offensive", "Defensive"}),
        label_safe = aa_gp:label(" "),
        lb_yaw_direction = aa_gp:label("Yaw directions"),
        yaw_direction = aa_gp:multiselect('\nYaw directions', {'Edge Yaw', 'Freestanding', 'Manuals'}),
        label12 = aa_gp:label(" "),
        edge_yaw = aa_gp:hotkey("Edge Yaw", false),
        freestanding_hotkey = aa_gp:hotkey('Freestanding hotkey', false),
        label5 = aa_gp:label(" "),
        lb_freestanding_disablers = aa_gp:label("Freestanding disablers"),
        freestanding_disablers = aa_gp:multiselect("\nFreestanding disablers", {"Walking", "Crouching", "Aerobic", "Manuals"}),
        lb_manuals_disablers = aa_gp:label("Manuals disablers"),
        manuals_disablers = aa_gp:multiselect("\nManuals disablers", {"Walking", "Crouching", "Aerobic"}),
        manuals_left = aa_gp:hotkey('Manual Left'),
        manuals_right = aa_gp:hotkey('Manual Right'),
        manuals_forward = aa_gp:hotkey('Manual Forward'),
        manuals_reset = aa_gp:hotkey('Manual Reset'),
       
        --Other
        lb12 = oth_group:label(' '),
        fake_label = oth_group:label("\vFakeLag options"),
        fakeenabled = oth_group:checkbox("Enabled"),
        fake_amount = oth_group:combobox("Amount", {"Dynamic", "Maximum", "Fluctuate"}),
        fake_variance = oth_group:slider("Variance", 0, 100, 0, true, "%", 1 ),
        fake_limit = oth_group:slider("Limit", 1, 15, 1, true, " ", 1),
    }, 

    visuals = {
        globalize_dpi = aa_gp:checkbox("\nGlobalize DPI"),
        dpilb = aa_gp:label("\vGlobalize DPI"),
        lb_recent = aa_gp:label("\vRecent Color"),
        recent_color = aa_gp:color_picker("\nColor", 255, 255, 255),
        lb1 = aa_gp:label(" "),
        lb_main = aa_gp:label("\vVisuals Settings"),
        lb2 = aa_gp:label(" "),
        lb_selection = aa_gp:label("\vSelection"),
        menu_selection = aa_gp:combobox("\nadwadwa", {"Main", "Prefer gamesense indicator"}),
        lb_space = aa_gp:label(" "),

        --feature_ind
        custom_ind_gs_label = aa_gp:label('\vFeature indicators'),
        custom_ind_gs = aa_gp:checkbox('Enable animations\nfeature'),
        custom_ind_gs_color = aa_gp:checkbox('Enable custom color'),
        custom_ind_gs_colorcp = aa_gp:color_picker('cgsc', 255, 255, 255),
        custom_ind_gs_icon = aa_gp:checkbox('Add feature icons'),
        custom_ind_gs_size = aa_gp:slider('Adding to y', 6, 12, 12),
        custom_ind_gs_rect1 = aa_gp:slider('Weight size', 0, 15, 0),
        custom_ind_gs_rect = aa_gp:slider('Height size', 0, 4, 0),
        custom_ind_gs_back = aa_gp:slider('Background alpha', 25, 155, 50),

        --crosshair
        crosshair = aa_gp:checkbox('\nEnablecri'),
        crosshair_label = aa_gp:label('\vCrosshair indicator'),
        cr_color_type = aa_gp:combobox("\nColor Type", {"Default", "Gradient"}),
        cr_color_gradient = aa_gp:combobox("\nColor Gradient", {"2x", "3x"}),
        cr_color_speed = aa_gp:slider("\nColor Speed", 1, 5, 2, true, " ", 1),
        cr_lb_default_color = aa_gp:label("\vDefault Color"),
        cr_default_color = aa_gp:color_picker("\nColor", 255, 255, 255),
        cr_lb_color1 = aa_gp:label("\vFirst Color"),
        cr_color1 = aa_gp:color_picker("\nColor", 255, 255, 255),
        cr_lb_color2 = aa_gp:label("\vSecond Color"),
        cr_color2 = aa_gp:color_picker("\nColor", 255, 255, 255),
        cr_lb_color3 = aa_gp:label("\vThird Color"),
        cr_color3 = aa_gp:color_picker("\nColor", 255, 255, 255),
        lb3 = aa_gp:label(' '),
        crosshair_select = aa_gp:multiselect('Statements', {'Glow module', 'Desync', 'State', 'Double tap', 'Onshot anti-aim', 'Body aim', 'Safe point', 'Duck peek assist', 'Minimum damage override', 'Freestanding'}),
        lb6 = aa_gp:label(' '),

        --arrows
        arrows = aa_gp:checkbox('\nEnablearrows'),
        arrows_label = aa_gp:label('\vArrows'),
        arrows_color = aa_gp:color_picker('ac', 255, 255, 255),
        arrows_type = aa_gp:combobox('\nadwadw', {'pacantech', 'V4'}),
        v4_mode = aa_gp:multiselect('\nV4 Mode', {'Arrows', 'Desync'}),
        arrows_scope = aa_gp:multiselect('On scope', {'Alpha', 'Level'}),
        lb4 = aa_gp:label(' '),

        --damage
        damage_ind = aa_gp:checkbox('\nEnabledamageind'),
        damage_label = aa_gp:label('\vDamage indicator'),
        damage_color = aa_gp:color_picker('dc', 255, 255, 255),
        damage_anim = aa_gp:checkbox('Disable animation\ndamageind'),
        damage_select = aa_gp:combobox('Font', {'Small', 'Verdana', 'Bold'}),
        lb5 = aa_gp:label(' '),

        --tracer 
        tracer_en = aa_gp:checkbox('\nawdwada'),
        tracer_lb = aa_gp:label(' '),
        lb999 = aa_gp:label(' '),

        --kibit_marker
        lb_world_to_screen = aa_gp:label('World Screen'),
        kibit_marker = aa_gp:multiselect("\nadwad", {'Hit', 'Miss'}),
        kibit_color = aa_gp:color_picker(" ", 83, 255, 248),
        kibit_color2 = aa_gp:color_picker(" ", 255, 0, 0),
        kibit_miss = aa_gp:checkbox("Miss reason"),

        --solus
        lb_ui = oth_group:label("\vSolus UI"),
        ui_main = oth_group:multiselect("\ndwad", {"Watermark", "Keybinds", "Spectator", "Velocity", "Defensive"}),
        lb_water = oth_group:label("\vWatermark Settings"),
        water_main = oth_group:multiselect("\nWatermark Menu", {"Water", "Build", "Name", "Ping", "FPS", "Time"}),
        lb_hotkeys = oth_group:label("Hotkeys"),
        hotkey_item = oth_group:multiselect("\nHotkeys", {"Double tap", "On shot anti-aim", "Override damage", "Safe point", "Force baim", "Hitchance", "Automatic teleport", "Duck peek assist", "Jump scout", "Magic key", "AI Peek", "Edge yaw", "Freestanding", "Quick peek assist", "Ping spike", "Edge jump", "Slow motion"}),
        ui_color = oth_group:combobox("\nadwadw", {"Once-color", "Multi-color"}),
        ui_lb_default_color = oth_group:label("\vDefault Color"),
        ui_default_color = oth_group:color_picker("\nColor", 255, 255, 255),
        ui_lb_color1 = oth_group:label("\vFirst Color"),
        ui_color1 = oth_group:color_picker("\nColor", 255, 255, 255),
        ui_lb_color2 = oth_group:label("\vSecond Color"),
        ui_color2 = oth_group:color_picker("\nColor", 255, 255, 255),
        ui_lb_color3 = oth_group:label("\vThird Color"),
        ui_color3 = oth_group:color_picker("\nColor", 255, 255, 255),
        ui_lb_color4 = oth_group:label("\vThird Color"),
        ui_color4 = oth_group:color_picker("\nColor", 255, 255, 255),
        ui_lb_color5 = oth_group:label("\vThird Color"),
        ui_color5 = oth_group:color_picker("\nColor", 255, 255, 255),
    },

    misc = {
        menu = fl_gp:combobox("\nadwad", {" Misc", " Other"}),
        lb_misc = aa_gp:label("\vMisc Settings"),
        quickswitch = aa_gp:checkbox("Quickswitch"),
        r8_round = aa_gp:checkbox("R8 \aFFFFFF2F ~ First/Half Round" ),
        fast_ladder = aa_gp:checkbox('Fast ladder'),
        filter_console = aa_gp:checkbox('Filter console'),
        drop_nades = aa_gp:checkbox("Drop Nades"),
        drop_hotkey = aa_gp:hotkey("Hot", true),
        drop_items = aa_gp:multiselect("\nadwad", {"Molotov", "HE Grenade", "Smoke"}),
        clantag = aa_gp:checkbox("Clantag"),
        chat_revealer = aa_gp:checkbox("Chat revealer"),
        chat_spammer = aa_gp:checkbox('Trash talking'),
        chat_spammer_type = aa_gp:multiselect('\nTalking type', {'Kill', 'Death'}),
        lb3 = aa_gp:label(" "),
        lb_aimbot = aa_gp:label("\vAimbot Logs"),
        output_log = aa_gp:combobox("\nOutput", {"Output", "Screen"}),
        aimbot_on = aa_gp:multiselect('\nLog when', {'Hit', 'Miss', 'Another'}),
        aimbot_on1 = aa_gp:multiselect('\nLog when', {'Hit', 'Miss', 'Another'}),
        aimbot_hit = aa_gp:color_picker('hit', 255, 255, 255),
        aimbot_miss = aa_gp:color_picker('miss', 255, 255, 255),
        prefix_screen = aa_gp:checkbox('Prefix'),
        output_output = aa_gp:checkbox('Output'),
        output_lb = aa_gp:label(' '),
        output_font = aa_gp:combobox('Font', {'Small', 'Verdana', 'Bold'}),
        output_anim = aa_gp:checkbox('Enable animations'),
        output_x = aa_gp:slider('Start x\noutput', 0, 10, 10),
        output_y = aa_gp:slider('Start y\noutput', 0, 10, 10), 
        lb_anim = aa_gp:label(" "),
        lb_animbr = aa_gp:label("\vAnimation Settings"),
        tab_anim = aa_gp:combobox("\nadwadwa", {"Animation breakers", "Animation addons"}),
        anim_walk = aa_gp:combobox('Walking', {'Off', 'Static', 'Jitter', 'Advanced Jitter', 'Moonwalk', 'Random'}),
        jitter_value = aa_gp:slider("Walking value", 0, 100, 100, true, "%", 1, {[0] = 'Disabled', [35] = 'Small', [50] = 'Medium', [75] = 'High', [100] = 'Force'}),
        jitter_speed = aa_gp:slider("Jitter Speed", 0, 100, 100, true, "%", 1, {[0] = 'Disabled', [35] = 'Slowest', [75] = 'Fastest', [100] = 'Force'}),
        anim_air = aa_gp:combobox('Air', {'Off', 'Static', 'Random', 'Moonwalk'}),
        anim_elem_air = aa_gp:slider('Air value', 0, 100, 0, true, '%', 1, {[0] = 'Disabled', [35] = 'Small', [50] = 'Medium', [75] = 'High', [100] = 'Force'}),
        m_elements = aa_gp:multiselect('Addons', {'Leg breaker', 'Kangaroo', 'Adjust body lean', 'Reset pitch on land', 'Earthquake'}),
        body_lean_value = aa_gp:slider('Body lean value', 0, 100, 0, true, '%', 0.01, {[0] = 'Disabled', [35] = 'Small', [50] = 'Medium', [75] = 'High', [100] = 'Extreme'}),
        lb_earth = aa_gp:label("\vEarthquake Settings"),
        state = aa_gp:multiselect('Statement\nanimbr', {'While in air', 'Adjust body lean'}),
        speedearth = aa_gp:slider('Speed\nanimbr', 2, 10, 10),
        lb_other = aa_gp:label("\vOther Settings"),
        aspect_ratio = aa_gp:checkbox('Force aspect ratio'),
        aspect_ratio_slider = aa_gp:slider('\nAmount', 60, 250, 178, true, ' ', 0.01, {[125] = '5:4', [133] = '4:3', [150] = '3:2', [160] = '16:10', [178] = '16:9', [200] = '2:1'}),
        third_person = aa_gp:checkbox('Third person'),
        third_person_slider = aa_gp:slider('\nDistance', 0, 250, 100),
        third_person_magic = aa_gp:checkbox('Disable third person (wall threshold)'),
        lb = aa_gp:label(" "),
        lb_view = aa_gp:label('\vViewmodel Settings'),
        zoom = aa_gp:checkbox('Second zoom FOV'),
        zoom_fov = aa_gp:slider("\nadwad", 5, 40, 10, true, " ", 1),
        zoom_anim = aa_gp:checkbox("Animate zoom FOV"),
        viewmodel = aa_gp:checkbox('Viewmodel'),
        opposite_hand = aa_gp:checkbox('Opposite knife hand'),
        remove_sleeves = aa_gp:checkbox('Remove Sleeves'),
        vS = aa_gp:slider('\nViewmodel FOV', 0, 170, 68, true, ' ', 1),
        xS = aa_gp:slider('\nViewmodel X', -250, 250, 0, true, ' ', 0.1),
        yS = aa_gp:slider('\nViewmodel Y', -250, 250, 0, true, ' ', 0.1),
        zS = aa_gp:slider('\nViewmodel Z', -250, 250, 0, true, ' ', 0.1),
        lb2 = aa_gp:label(" "),
        lb_scope = aa_gp:label("\vScope Settings"),
        viewinsc = aa_gp:checkbox('Force weapon in scope'),
        scope_overlay = aa_gp:checkbox('Scope Overlay'),
        scope_mode_ovr = aa_gp:combobox("\nadwa", {"V1", "V2"}),
        scope_disablers = aa_gp:multiselect('Disabler', {'Left', 'Right', 'Bottom', 'Top'}),
        scope_color = aa_gp:color_picker('so', 255, 255, 255),
        scope_size = aa_gp:slider('Size', 0, 500, 190),
        scope_gap = aa_gp:slider('Gap', 0, 500, 15),
        scope_thickness = aa_gp:slider('Thickness', 1, 20, 1, true, " ", 1, {[1] = "Default"}),
        scope_position = aa_gp:combobox('Position', {'Default', 'Rotate'}),
        scope_animation = aa_gp:multiselect('Animations\nscoverl', {'Alpha', 'Overlay'}),
        buybot = oth_group:checkbox("\ndwadwa "),
        lb_buybot = oth_group:label("\vBuyBot Settings"),
        buybot_primary = oth_group:combobox("Primary weapon", {"-", "SCAR20/G3SG1", "SSG-08", "AWP"}),
        buybot_secondary = oth_group:combobox("Secondary weapon", {"-", "P250", "Dual Berettas", "TEC-9/Five Seven", "Deagle/R8"}),
        buybot_utility = oth_group:multiselect("Utility", {"Kevlar", "Kevlar/Helmet", "HE Grenade", "Smoke", "Molotov", "Defuse kit", "Zeus"}),
        game_check = oth_group:checkbox("\ndfasdwadwa"),
        lb_game = oth_group:label("\vOptimization game"),
        game_list = oth_group:multiselect("\ndawad", {'Fix chams color', 'Disable dynamic lighting', 'Disable dynamic shadows', 'Disable ragdolls', 'Disable eye gloss', 'Disable bloom', 'Disable particles', 'Reduce breakable objects'}),
    },

    drag = {
        watermark = {
            x = aa_gp:slider("\ndwadwa", 0, width, width, true, " ", 1),
            y = aa_gp:slider("\ndwadwa", 0, height - 20, 8, true, " ", 1)
        },

        output = {
            y = aa_gp:slider("\ndwadwa", 200, height/2 + 380, 717, true, " ", 1)
        },

        hotkey = {
            x = aa_gp:slider("\ndwadwa", 0, width, 428, true, " ", 1),
            y = aa_gp:slider("\ndwadwa", 0, height, 563, true, " ", 1),
        },

        spectator = {
            x = aa_gp:slider("\ndwadwa", 0, width, 1500, true, " ", 1),
            y = aa_gp:slider("\ndwadwa", 0, height, 563, true, " ", 1),
        },

        crosshair = {
            y = aa_gp:slider('\nPosition y', 0, height/3-100, 183, true, " ", 1),
        },
        
        damage = {
            x = aa_gp:slider('\nPosition x', 0, width, 960, true, " ", 1),
            y = aa_gp:slider('\nPosition y', 0, height, 527, true, " ", 1),
        },

        arrows = { 
            x = aa_gp:slider('\nPosition x', 20, 100, 40, true, " ", 1),  
        },

        feature_ind = {
            y = aa_gp:slider('\nPosition y', height/4, height/2, 0, true, " ", 1),
        },

        velocity = {
            x = aa_gp:slider('\nPosition x', 0, width, width/2 - 48, true, " ", 1),
            y = aa_gp:slider('\nPosition y', 0, height, 300, true, " ", 1),
        },

        defensive = {
            x = aa_gp:slider('\nPosition x', 0, width, width/2 - 48, true, " ", 1),
            y = aa_gp:slider('\nPosition y', 0, height, 400, true, " ", 1),
        },

        wt = {
            x = aa_gp:slider('\nPosition x', 0, width, 0, true, " ", 1),
            y = aa_gp:slider('\nPosition y', 0, height, height/2, true, " ", 1),
            wt_type = aa_gp:combobox("Type", {"Default", "Encode"}),
        }
    },
}

local visible = {} do
    function visible.hide_menu(visible)
        ref.enabled:set_visible(visible)
        ref.pitch[1]:set_visible(visible)
        ref.pitch[2]:set_visible(visible)
        ref.yawbase:set_visible(visible)
        ref.yaw[1]:set_visible(visible)
        ref.yaw[2]:set_visible(visible)
        ref.yawjitter[1]:set_visible(visible)
        ref.yawjitter[2]:set_visible(visible)
        ref.roll[1]:set_visible(visible)
        ref.bodyyaw[1]:set_visible(visible)
        ref.bodyyaw[2]:set_visible(visible)
        ref.freestand[1]:set_visible(visible)
        ref.edgeyaw:set_visible(visible)
        ref.fakeenabled[1]:set_visible(visible)
        ref.amount[1]:set_visible(visible)
        ref.variance[1]:set_visible(visible)
        ref.limit[1]:set_visible(visible)
        ref.fsbodyyaw:set_visible(visible)
        ref.output:set_enabled(visible)
    end

    function visible.oth(visible)
        ref.other_slowmotion[1]:set_visible(visible)
        ref.other_legmovement[1]:set_visible(visible)
        ref.os[1]:set_visible(visible)
        ref.other_fkpeek[1]:set_visible(visible)
    end

    client.set_event_callback('paint_ui', function()
        visible.hide_menu(false)  
        
        if menu.main:get() == " Anti-Aim" and menu.antiaim.selection:get() == " Other" then
            visible.oth(true)
        else
            visible.oth(false)
        end
        
    end)   

    client.set_event_callback("shutdown", function()
        visible.hide_menu(true)
        ref.spread:set_enabled(true)
        ref.spread:override()
    end)
end

local helpers = {} do
    function helpers.globalize_dpi()
        if not menu.visuals.globalize_dpi:get() then
            return ''
        end

        return 'd'
    end

    function helpers.table_contains (tbl, val)
        if type(tbl) ~= 'table' then
            return false
        end

        for i = 1, #tbl do
            if tbl[i] == val then
                return true, i
            end
        end

        return false
    end

    function helpers.get_weapon_type(weapon_idx)
        if weapon_idx == 40 then return "scout" end
        if weapon_idx == 38 or weapon_idx == 11 then return "auto" end
        if weapon_idx == 9 then return "awp" end
        if weapon_idx == 2 or weapon_idx == 3 or weapon_idx == 4 or weapon_idx == 30 or weapon_idx == 32 or weapon_idx == 36 or weapon_idx == 61 or weapon_idx == 63 then return "pistol" end
        if weapon_idx == 64 then return "revolver" end
        if weapon_idx == 1 then return "deagle" end
        return nil
    end

    function helpers.in_game()
        local lp = entity.get_local_player()
        local team = entity.get_prop(lp, "m_iTeamNum")

        if team ~= nil then
            return true
        else 
            return false
        end
    end
end

local dpi = helpers.globalize_dpi()

local aimtools = {}

for i = 1, #aimtools_cond do
    aimtools[i] = {
        options = oth_group:combobox('\nadwa', {'Aimbot', 'B&S'}),
        hitscan_lb = oth_group:label(' '),
        hitscan = oth_group:combobox('\nadwad', {'Higher than you', 'Lower than you', 'Lethal', 'After X Misses', 'HP lower than X'}),
        hitscan_high = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'Low', [2] = 'Medium', [3] = 'High', [4] = 'Maximum'}),
        hitscan_low = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'Low', [2] = 'Medium', [3] = 'High', [4] = 'Maximum'}),
        hitscan_leth = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'Low', [2] = 'Medium', [3] = 'High', [4] = 'Maximum'}),
        hitscan_after_mis = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'Low', [2] = 'Medium', [3] = 'High', [4] = 'Maximum'}),
        hitscan_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        hitscan_lower_than_X = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'Low', [2] = 'Medium', [3] = 'High', [4] = 'Maximum'}),
        hitscan_hp = oth_group:slider("\n~ HP", 0, 100, 80), 
        delay_lb = oth_group:label(' '),
        delay = oth_group:combobox('\nadwad', {'Higher than you', 'Lower than you', 'Lethal', 'After X Misses', 'HP lower than X'}),
        delay_high = oth_group:slider('\ndwadwa', 0, 1, 0, true, ' ', 1, {[0] = 'Off', [1] = 'On'}),
        delay_low = oth_group:slider('\ndwadwa', 0, 1, 0, true, ' ', 1, {[0] = 'Off', [1] = 'On'}),
        delay_leth = oth_group:slider('\ndwadwa', 0, 1, 0, true, ' ', 1, {[0] = 'Off', [1] = 'On'}),
        delay_after_mis = oth_group:slider('\ndwadwa', 0, 1, 0, true, ' ', 1, {[0] = 'Off', [1] = 'On'}),
        delay_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        delay_lower_than_X = oth_group:slider('\ndwadwa', 0, 4, 0, true, ' ', 1, {[0] = 'Off', [1] = 'On'}),
        delay_hp = oth_group:slider("\n~ HP", 0, 100, 80), 
        multi_lb = oth_group:label(' '),
        multi = oth_group:combobox('\nadwad', {'Higher than you', 'Lower than you', 'Lethal', 'After X Misses', 'HP lower than X'}),
        multi_high = oth_group:slider('\nadwadwa', 23, 100, 23, true, '%', 1, {[23] = 'Off', [24] = 'Auto'}),
        multi_low = oth_group:slider('\nadwadwa', 23, 100, 23, true, '%', 1, {[23] = 'Off', [24] = 'Auto'}),
        multi_lethal = oth_group:slider('\nadwadwa', 23, 100, 23, true, '%', 1, {[23] = 'Off', [24] = 'Auto'}),
        multi_after_miss = oth_group:slider('\nadwadwa', 23, 100, 23, true, '%', 1, {[23] = 'Off', [24] = 'Auto'}),
        multi_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        multi_hp_than_x = oth_group:slider('\nadwadwa', 23, 100, 23, true, '%', 1, {[23] = 'Off', [24] = 'Auto'}),
        multi_hp = oth_group:slider("\n~ HP", 0, 100, 80), 
        hitchance_lb = oth_group:label(' '),
        hitchance = oth_group:combobox('\nadwad', {'Higher than you', 'Lower than you', 'Lethal', 'After X Misses', 'HP lower than X'}),
        hitchance_high = oth_group:slider('\nadwadwa', 0, 100, 0, true, '%', 1, {[0] = 'Off'}),
        hitchance_low = oth_group:slider('\nadwadwa', 0, 100, 0, true, '%', 1, {[0] = 'Off'}),
        hitchance_lethal = oth_group:slider('\nadwadwa', 0, 100, 0, true, '%', 1, {[0] = 'Off'}),
        hitchance_after_miss = oth_group:slider('\nadwadwa', 0, 100, 0, true, '%', 1, {[0] = 'Off'}),
        hitchance_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        hitchance_hp_than_x = oth_group:slider('\nadwadwa', 0, 100, 0, true, '%', 1, {[0] = 'Off'}),
        hitchance_hp = oth_group:slider("\n~ HP", 0, 100, 80), 
        body_prefer_lb = oth_group:label("\vPrefer body aim on"),
        body_prefer = oth_group:multiselect("\nPrefer body aim on", {"Higher than you", "Lower than you", "Lethal", "After X Misses", "HP lower than X"}),
        lb_bd_misses = oth_group:label("~ Misses"),
        body_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        lb_bd_hp = oth_group:label("~ HP"),
        body_hp = oth_group:slider("\n~ HP", 0, 100, 80),
        safe_prefer_lb = oth_group:label("\vForce safe point on"),
        safe_prefer = oth_group:multiselect("\nForce safe point on", {"Higher than you", "Lower than you", "Lethal", "After X Misses", "HP lower than X"}),
        lb_sf_misses = oth_group:label("~ Misses"),
        safe_misses = oth_group:slider("\n~ Misses", 0, 10, 2),
        lb_sf_hp = oth_group:label("~ HP"),
        safe_hp = oth_group:slider("\n~ HP", 0, 100, 80),     
    }  
end

local builder = {}

local builder_values = { T = {}, CT = {} }

for _, side in ipairs({"T", "CT"}) do
    for i = 1, #antiaim_cond do
        builder_values[side][i] = {
            ofs_ways_1 = {}, ofs_ways_2 = {}, way_del = {},
            yaw_mode = {}, delay_switch = {}, adaptive_desync = {}
        }
    end
end

local function has_value(tab, val)
    if type(tab) ~= "table" then return tab == val end
    for index, value in pairs(tab) do
        if value == val then return true end
    end
    return false
end

local function get_cfg(state_id, real_side)
    if builder_values[real_side] and builder_values[real_side][state_id] then
        return builder_values[real_side][state_id]
    end
    return {} 
end

for i = 1, #antiaim_cond do

    builder_values.T[i] = {}
    builder_values.CT[i] = {}

    builder[i] = {
        lb1 = aa_gp:label(" "),
        enabled = aa_gp:checkbox("\nadwad"),
        state = aa_gp:label("\v" .. antiaim_cond[i]),
        label1 = aa_gp:label(" "),
        label2 = aa_gp:label("\rYaw \vSettings"),
        main = aa_gp:combobox("\ndwadwa", {"Yaw", "Defensive"}),
        lb_pizdec = fl_gp:label(" "),
        lb_brute = fl_gp:label("Antibrute Mode"),
        brute_mode = fl_gp:combobox("\nawdad", {"Disabled", "Adaptive", "Decrease", "Increase"}),
        delay_force = fl_gp:checkbox('Force Delay'),
        duration_brute = fl_gp:slider('Duration', 0, 100, 0, true, 's', 0.1, {[0] = 'inf'}),
        label3 = aa_gp:label(" "),
        offset_lb = aa_gp:label(' '),
        offset = aa_gp:slider("\nOffset Amount", -180, 180, 0, true, "°", 1),
        offset_lb1 = aa_gp:label(' '),
        ofs_lb_1 = aa_gp:label('Left Yaw'),
        ofs_tp_1 = aa_gp:combobox('\nawdwa', {'Default', 'Way'}),
        ofs_ways_delay_1 = aa_gp:slider("\nDelay", 2, 16, 2, true, "t", 1, {[2] = " "}),
        ofs_way_1 = aa_gp:slider("\nadwadwa", 2, 5, 2, true,"w", 1),
        ofs_ways_1 = {
            [1] = aa_gp:slider('\nFirst offset \n', -90, 90, 0, true, '°'),
            [2] = aa_gp:slider('\nSecond offset \n', -90, 90, 0, true, '°'),
            [3] = aa_gp:slider('\nThird offset \n', -90, 90, 0, true, '°'),
            [4] = aa_gp:slider('\nFourth offset \n', -90, 90, 0, true, '°'),
            [5] = aa_gp:slider('\nFifth offset \n', -90, 90, 0, true, '°'),
        },
        ofs_1 = aa_gp:slider("\nOffset Amount 1", -90, 90, 0, true, "°", 1),
        ofs_lb_2 = aa_gp:label('Right Yaw'),
        ofs_tp_2 = aa_gp:combobox('\nawdwa', {'Default', 'Way'}),
        ofs_ways_delay_2 = aa_gp:slider("\nDelay", 2, 16, 2, true, "t", 1, {[2] = " "}),
        ofs_way_2 = aa_gp:slider("\nadwadwa", 2, 5, 2, true,"w", 1),
        ofs_ways_2 = {
            [1] = aa_gp:slider('\nFirst offset \n', -90, 90, 0, true, '°'),
            [2] = aa_gp:slider('\nSecond offset \n', -90, 90, 0, true, '°'),
            [3] = aa_gp:slider('\nThird offset \n', -90, 90, 0, true, '°'),
            [4] = aa_gp:slider('\nFourth offset \n', -90, 90, 0, true, '°'),
            [5] = aa_gp:slider('\nFifth offset \n', -90, 90, 0, true, '°'),
        },
        ofs_2 = aa_gp:slider("\nOffset Amount 2", -90, 90, 0, true, "°", 1),
        label4 = aa_gp:label(" "),
        label5 = aa_gp:label("\rYaw \vFeatures"),
        yaw_mode = aa_gp:multiselect("\nawdwad", {"Jitter", "Spin", "Random"}),
        spna_switch = aa_gp:checkbox("\ndwadwadwa"),
        spna = aa_gp:slider("\nadwada", 0, 100, 0, true, "°", 1),
        spna_speed = aa_gp:slider("\ndwdaw", 10, 50, 10, true, " ",  0.1),
        spna2 = aa_gp:slider("\nadwada", 0, 100, 0, true, "°", 1),
        spna_speed2 = aa_gp:slider("\ndwdaw", 10, 50, 10, true, " ",  0.1),
        rana_switch = aa_gp:checkbox("\nadwadwaadw"),
        rana = aa_gp:slider("\nadwada", 0, 100, 0, true, "%", 1),
        rana2 = aa_gp:slider("\nadwada", 0, 100, 0, true, "%", 1),
        label7 = aa_gp:label(" "),
        label6 = aa_gp:label("\rJitter \vMode"),
        yaw_jitter = aa_gp:combobox("\nYaw jitter", {"Off", "Center", "Offset", "Skitter", "X-Way", "Random"}),
        xway_slider = aa_gp:slider("\nadwadwa", 3, 10, 3, true,"w", 1),
        xway_jitter = aa_gp:slider("\ndwadwad", -90, 90, 0, true, '°', 1),
        yawjitter = aa_gp:slider("\ndwadwad", -90, 90, 0, true, '°', 1),
        label8 = aa_gp:label(" "),
        label9 = aa_gp:label("\vBody Yaw"),
        bodyyaw = aa_gp:combobox("\nBody yaw", {"Off", "Static", "Jitter", "Opposite"}),
        bd_type = aa_gp:combobox('\ndwadwa', {'Gamesense', 'Advanced'}),
        body_type = aa_gp:combobox("\nType", {"Default", "Spin", "Fluctuate", "Random", "Dynamic"}),
        body_static = aa_gp:slider('\nadwad', -180, 180, 0, true, "°", 1),
        body_left = aa_gp:slider("Left", -180, 180, 0, true, "°", 1),
        body_right = aa_gp:slider("Right", -180, 180, 0, true, "°", 1),
        label11 = oth_group:label('\vOther Settings'),
        delay_method = oth_group:combobox("Delay Method", {"Default", "Ways"}),
        delay_switch = oth_group:multiselect('\nawdad', {'Disable on Fakelags', 'Fluctuate', 'Hold ticks'}),
        delay = oth_group:slider("Delay", 1, 16, 1, true, "t", 1, {[1] = " "}),
        random_delay = oth_group:slider("Random Delay", 0, 22, 0, true, "t", 1, {[0] = " "}),
        delay_fluc = oth_group:slider('Fluctuate', 1, 12, 1, true, '', 1, {[1] = ' '}),
        hold_ticks = oth_group:slider("Hold ticks", 0, 14, 0, true, 't', 1, {[0] = ' '}),
        ways = oth_group:slider("Ways", 3, 10, 3, true, "w", 1),
        way_del = {            
            [1] = oth_group:slider('\nFirst offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [2] = oth_group:slider('\nSecond offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [3] = oth_group:slider('\nThird offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [4] = oth_group:slider('\nFourth offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [5] = oth_group:slider('\nFifth offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [6] = oth_group:slider('\nFirst offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [7] = oth_group:slider('\nSecond offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [8] = oth_group:slider('\nThird offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [9] = oth_group:slider('\nFourth offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
            [10] = oth_group:slider('\nFifth offset \n', 1, 16, 1, true, "t", 1, {[1] = " "}),
        },
        force_lc = aa_gp:checkbox('\aB6B665FFForce LC'),
        def_en = aa_gp:checkbox("Defensive"),
        pitch_type = aa_gp:combobox('Pitch', {'Off', 'Static', 'Jitter', 'Spin', 'Spin[MOD]','Random', 'Random Ticks'}),
        pitch_static = aa_gp:slider('Angle', -89, 89, 0, true, '°', 1),
        pitch_mode1 = aa_gp:slider('Angle 1', -89, 89, 0, true, '°', 1),
        pitch_mode2 = aa_gp:slider('Angle 2', -89, 89, 0, true, '°', 1),
        pitch_speed = aa_gp:slider('Angle Speed', -50, 50, 20, true, ' ', 0.1),
        pitch_jitter_speed = aa_gp:slider("Speed Ticks", 2, 14, 2, true, 't', 1, {[2] = ' '}),
        pitch_slow_def = aa_gp:slider('Speed', 0, 10, 0, true, ' ', 0.1),
        yaw_def = aa_gp:combobox('Yaw', {'Off', 'Static', 'Static[FS]', 'Jitter', 'Jitter[L/R]', 'Spin', 'Random', '3-way', '5-way'}),
        yaw_amount = aa_gp:slider("Yaw amount", 0, 360, 0, true, '°', 1),
        yaw_left = aa_gp:slider('Yaw left', -180, 180, 0, true, '°', 1),
        yaw_right = aa_gp:slider('Yaw right', -180, 180, 0, true, '°', 1),
        def_jitter_speed = aa_gp:slider('Speed Ticks', 2, 14, 2, true, 't', 1, {[2] = ' '}),
        def_spin_speed = aa_gp:slider("Yaw Speed", -50, 50, 20, true, ' ', 0.1),
        adaptive_desync = aa_gp:multiselect("Yaw options", {'Adaptive Desync', 'Delay Off'}),
    }
end 

local id = 1

local aa_side = {} do

    function aa_side.deep_copy(obj)
        if type(obj) ~= 'table' then return obj end
        local res = {}
        for k, v in pairs(obj) do res[aa_side.deep_copy(k)] = aa_side.deep_copy(v) end
        return res
    end

    function aa_side.save_to_custom(target_side)
        if not builder_values[target_side] then 
            builder_values[target_side] = {} 
        end

        for i = 1, #antiaim_cond do
            builder_values[target_side][i] = builder_values[target_side][i] or {}
            local v = builder_values[target_side][i]
            local b = builder[i]

            v.enabled = b.enabled:get()
            v.main = b.main:get()
            v.brute_mode = b.brute_mode:get()
            v.delay_force = b.delay_force:get()
            v.duration_brute = b.duration_brute:get()
            v.ofs_tp_1 = b.ofs_tp_1:get()
            v.offset = b.offset:get()
            v.ofs_ways_delay_1 = b.ofs_ways_delay_1:get()
            v.ofs_way_1 = b.ofs_way_1:get()
            v.ofs_1 = b.ofs_1:get()
            v.ofs_tp_2 = b.ofs_tp_2:get()
            v.ofs_ways_delay_2 = b.ofs_ways_delay_2:get()
            v.ofs_way_2 = b.ofs_way_2:get()
            v.ofs_2 = b.ofs_2:get()

            v.yaw_mode = b.yaw_mode:get()
            v.spna_switch = b.spna_switch:get()
            v.spna = b.spna:get()
            v.spna_speed = b.spna_speed:get()
            v.spna2 = b.spna2:get()
            v.spna_speed2 = b.spna_speed2:get()
            v.rana_switch = b.rana_switch:get()
            v.rana = b.rana:get()
            v.rana2 = b.rana2:get()

            v.yaw_jitter = b.yaw_jitter:get()
            v.xway_slider = b.xway_slider:get()
            v.xway_jitter = b.xway_jitter:get()
            v.yawjitter = b.yawjitter:get()
            v.bd_type = b.bd_type:get()
            v.bodyyaw = b.bodyyaw:get()
            v.body_type = b.body_type:get()
            v.body_static = b.body_static:get()
            v.body_left = b.body_left:get()
            v.body_right = b.body_right:get()

            v.delay_method = b.delay_method:get()
            v.delay_switch = b.delay_switch:get()
            v.delay = b.delay:get()
            v.random_delay = b.random_delay:get()
            v.delay_fluc = b.delay_fluc:get()
            v.hold_ticks = b.hold_ticks:get()
            v.ways = b.ways:get()
            v.force_lc = b.force_lc:get()
            v.def_en = b.def_en:get()
            v.pitch_type = b.pitch_type:get()
            v.pitch_static = b.pitch_static:get()
            v.pitch_mode1 = b.pitch_mode1:get()
            v.pitch_mode2 = b.pitch_mode2:get()
            v.pitch_speed = b.pitch_speed:get()
            v.pitch_jitter_speed = b.pitch_jitter_speed:get()
            v.pitch_slow_def = b.pitch_slow_def:get()
            v.yaw_def = b.yaw_def:get()
            v.yaw_amount = b.yaw_amount:get()
            v.yaw_left = b.yaw_left:get()
            v.yaw_right = b.yaw_right:get()
            v.def_jitter_speed = b.def_jitter_speed:get()
            v.def_spin_speed = b.def_spin_speed:get()
            v.adaptive_desync = b.adaptive_desync:get()

            v.ofs_ways_1 = v.ofs_ways_1 or {}
            for j = 1, 5 do v.ofs_ways_1[j] = b.ofs_ways_1[j]:get() end

            v.ofs_ways_2 = v.ofs_ways_2 or {}
            for j = 1, 5 do v.ofs_ways_2[j] = b.ofs_ways_2[j]:get() end

            v.way_del = v.way_del or {}
            for j = 1, 10 do v.way_del[j] = b.way_del[j]:get() end
        end
    end

    function aa_side.copy_current_ui_preset(from_side, to_side)
        local selected_string = menu.antiaim.condition:get() 
        local current_selected_id = nil

        for i, name in ipairs(antiaim_cond) do
            if name == selected_string then
                current_selected_id = i
                break
            end
        end

        if not current_selected_id then 
            return 
        end

        aa_side.save_to_custom(from_side)

        if builder_values[from_side] and builder_values[from_side][current_selected_id] then
            builder_values[to_side][current_selected_id] = aa_side.deep_copy(builder_values[from_side][current_selected_id])
            
        end

        local active_side_in_menu = menu.antiaim.side_switch:get()
        if active_side_in_menu == to_side then
            aa_side.load()
        end
    end

    menu.antiaim.send_t:set_callback(function()
        aa_side.copy_current_ui_preset("CT", "T")
    end)

    menu.antiaim.send_ct:set_callback(function()
        aa_side.copy_current_ui_preset("T", "CT")
    end)

    function aa_side.save()

        local current_side = menu.antiaim.side_switch:get() == 'T' and 'T' or 'CT' 

        for i = 1, #antiaim_cond do

            builder_values[current_side][i] = builder_values[current_side][i] or {}

            builder_values[current_side][i].enabled = builder[i].enabled:get()
            builder_values[current_side][i].main = builder[i].main:get()
            builder_values[current_side][i].brute_mode = builder[i].brute_mode:get()
            builder_values[current_side][i].delay_force = builder[i].delay_force:get()
            builder_values[current_side][i].duration_brute = builder[i].duration_brute:get()
            builder_values[current_side][i].ofs_tp_1 = builder[i].ofs_tp_1:get()
            builder_values[current_side][i].offset = builder[i].offset:get()
            builder_values[current_side][i].ofs_ways_delay_1 = builder[i].ofs_ways_delay_1:get()
            builder_values[current_side][i].ofs_way_1 = builder[i].ofs_way_1:get()
            
            builder_values[current_side][i].ofs_ways_1 = builder_values[current_side][i].ofs_ways_1 or {}
            for j = 1, 5 do
                builder_values[current_side][i].ofs_ways_1[j] = builder[i].ofs_ways_1[j]:get()
            end
            
            builder_values[current_side][i].ofs_1 = builder[i].ofs_1:get()
            builder_values[current_side][i].ofs_tp_2 = builder[i].ofs_tp_2:get()
            builder_values[current_side][i].ofs_ways_delay_2 = builder[i].ofs_ways_delay_2:get()
            builder_values[current_side][i].ofs_way_2 = builder[i].ofs_way_2:get()

            builder_values[current_side][i].ofs_ways_2 = builder_values[current_side][i].ofs_ways_2 or {}
            for j = 1, 5 do
                builder_values[current_side][i].ofs_ways_2[j] = builder[i].ofs_ways_2[j]:get()
            end
            
            builder_values[current_side][i].ofs_2 = builder[i].ofs_2:get()
            builder_values[current_side][i].yaw_mode = builder[i].yaw_mode:get()
            builder_values[current_side][i].spna_switch = builder[i].spna_switch:get()
            builder_values[current_side][i].spna = builder[i].spna:get()
            builder_values[current_side][i].spna_speed = builder[i].spna_speed:get()
            builder_values[current_side][i].spna2 = builder[i].spna2:get()
            builder_values[current_side][i].spna_speed2 = builder[i].spna_speed2:get()
            builder_values[current_side][i].rana_switch = builder[i].rana_switch:get()
            builder_values[current_side][i].rana = builder[i].rana:get()
            builder_values[current_side][i].rana2 = builder[i].rana2:get()
            builder_values[current_side][i].yaw_jitter = builder[i].yaw_jitter:get()
            builder_values[current_side][i].xway_slider = builder[i].xway_slider:get()
            builder_values[current_side][i].xway_jitter = builder[i].xway_jitter:get()
            builder_values[current_side][i].yawjitter = builder[i].yawjitter:get()
            builder_values[current_side][i].bd_type = builder[i].bd_type:get()
            builder_values[current_side][i].bodyyaw = builder[i].bodyyaw:get()
            builder_values[current_side][i].body_type = builder[i].body_type:get()
            builder_values[current_side][i].body_static = builder[i].body_static:get()
            builder_values[current_side][i].body_left = builder[i].body_left:get()
            builder_values[current_side][i].body_right = builder[i].body_right:get()
            builder_values[current_side][i].delay_method = builder[i].delay_method:get()
            builder_values[current_side][i].delay_switch = builder[i].delay_switch:get()
            builder_values[current_side][i].delay = builder[i].delay:get()
            builder_values[current_side][i].random_delay = builder[i].random_delay:get()
            builder_values[current_side][i].delay_fluc = builder[i].delay_fluc:get()
            builder_values[current_side][i].hold_ticks = builder[i].hold_ticks:get()
            builder_values[current_side][i].ways = builder[i].ways:get()

            builder_values[current_side][i].way_del = builder_values[current_side][i].way_del or {}
            for j = 1, 10 do
                builder_values[current_side][i].way_del[j] = builder[i].way_del[j]:get()
            end

            builder_values[current_side][i].force_lc = builder[i].force_lc:get()
            builder_values[current_side][i].def_en = builder[i].def_en:get()
            builder_values[current_side][i].pitch_type = builder[i].pitch_type:get()
            builder_values[current_side][i].pitch_static = builder[i].pitch_static:get()
            builder_values[current_side][i].pitch_mode1 = builder[i].pitch_mode1:get()
            builder_values[current_side][i].pitch_mode2 = builder[i].pitch_mode2:get()
            builder_values[current_side][i].pitch_speed = builder[i].pitch_speed:get()
            builder_values[current_side][i].pitch_jitter_speed = builder[i].pitch_jitter_speed:get()
            builder_values[current_side][i].pitch_slow_def = builder[i].pitch_slow_def:get()
            builder_values[current_side][i].yaw_def = builder[i].yaw_def:get()
            builder_values[current_side][i].yaw_amount = builder[i].yaw_amount:get()
            builder_values[current_side][i].yaw_left = builder[i].yaw_left:get()
            builder_values[current_side][i].yaw_right = builder[i].yaw_right:get()
            builder_values[current_side][i].def_jitter_speed = builder[i].def_jitter_speed:get()
            builder_values[current_side][i].def_spin_speed = builder[i].def_spin_speed:get()
            builder_values[current_side][i].adaptive_desync = builder[i].adaptive_desync:get()
        end
    end

    function aa_side.load()
        local side = menu.antiaim.side_switch:get()
        if not builder_values[side] then return end

        for i = 1, #antiaim_cond do
            local v = builder_values[side][i]
            local b = builder[i]
            pcall(function() 
                b.enabled:set(v.enabled ~= nil and v.enabled or false)
                b.main:set(v.main or "Yaw")
                b.brute_mode:set(v.brute_mode or "Disabled")
                b.delay_force:set(v.delay_force ~= nil and v.delay_force or false)
                b.duration_brute:set(v.duration_brute or 0)
                b.ofs_tp_1:set(v.ofs_tp_1 or "Default")
                b.offset:set(v.offset or 0)
                b.ofs_ways_delay_1:set(v.ofs_ways_delay_1 or 2)
                b.ofs_way_1:set(v.ofs_way_1 or 2)
                b.ofs_1:set(v.ofs_1 or 0)
                b.ofs_tp_2:set(v.ofs_tp_2 or "Default")
                b.ofs_ways_delay_2:set(v.ofs_ways_delay_2 or 2)
                b.ofs_way_2:set(v.ofs_way_2 or 2)
                b.ofs_2:set(v.ofs_2 or 0)

                b.yaw_mode:set(v.yaw_mode or {})
                b.spna_switch:set(v.spna_switch ~= nil and v.spna_switch or false)
                b.spna:set(v.spna or 0)
                b.spna_speed:set(v.spna_speed or 10)
                b.spna2:set(v.spna2 or 0)
                b.spna_speed2:set(v.spna_speed2 or 10)
                b.rana_switch:set(v.rana_switch ~= nil and v.rana_switch or false)
                b.rana:set(v.rana or 0)
                b.rana2:set(v.rana2 or 0)

                b.yaw_jitter:set(v.yaw_jitter or "Off")
                b.xway_slider:set(v.xway_slider or 3)
                b.xway_jitter:set(v.xway_jitter or 0)
                b.yawjitter:set(v.yawjitter or 0)
                b.bd_type:set(v.bd_type or "Gamesense")
                b.bodyyaw:set(v.bodyyaw or "Off")
                b.body_type:set(v.body_type or "Default")
                b.body_static:set(v.body_static or 0)
                b.body_left:set(v.body_left or 0)
                b.body_right:set(v.body_right or 0)

                b.delay_method:set(v.delay_method or "Default")
                b.delay_switch:set(v.delay_switch or {})
                b.delay:set(v.delay or 1)
                b.random_delay:set(v.random_delay or 0)
                b.delay_fluc:set(v.delay_fluc or 1)
                b.hold_ticks:set(v.hold_ticks or 0)
                b.ways:set(v.ways or 3)
                b.force_lc:set(v.force_lc ~= nil and v.force_lc or false)
                b.def_en:set(v.def_en ~= nil and v.def_en or false)
                b.pitch_type:set(v.pitch_type or "Off")
                b.pitch_static:set(v.pitch_static or 0)
                b.pitch_mode1:set(v.pitch_mode1 or 0)
                b.pitch_mode2:set(v.pitch_mode2 or 0)
                b.pitch_speed:set(v.pitch_speed or 20)
                b.pitch_jitter_speed:set(v.pitch_jitter_speed or 2)
                b.pitch_slow_def:set(v.pitch_slow_def or 0)
                b.yaw_def:set(v.yaw_def or "Off")
                b.yaw_amount:set(v.yaw_amount or 0)
                b.yaw_left:set(v.yaw_left or 0)
                b.yaw_right:set(v.yaw_right or 0)
                b.def_jitter_speed:set(v.def_jitter_speed or 2)
                b.def_spin_speed:set(v.def_spin_speed or 20)
                b.adaptive_desync:set(v.adaptive_desync or {})

                if v.ofs_ways_1 then
                    for j = 1, 5 do
                        builder[i].ofs_ways_1[j]:set(v.ofs_ways_1[j] or 0)
                    end
                end

                if v.ofs_ways_2 then
                    for j = 1, 5 do
                        builder[i].ofs_ways_2[j]:set(v.ofs_ways_2[j] or 0)
                    end
                end

                if v.way_del then
                    for j = 1, 10 do
                        builder[i].way_del[j]:set(v.way_del[j] or 1)
                    end
                end
            end)
        end
    end

    local old_side = nil

    function aa_side.on_paint_ui()
        local current_side = menu.antiaim.side_switch:get()

        if current_side ~= old_side then
            aa_side.load()
            old_side = current_side
        end

        aa_side.save()
    end

    client.set_event_callback('paint_ui', aa_side.on_paint_ui)
end

local depend = {} do 

    function depend.drag(a)
        menu.drag.watermark.x:set_visible(a)
        menu.drag.watermark.y:set_visible(a)
        menu.drag.output.y:set_visible(a)
        menu.drag.hotkey.x:set_visible(a)
        menu.drag.hotkey.y:set_visible(a)
        menu.drag.spectator.x:set_visible(a)
        menu.drag.spectator.y:set_visible(a)
        menu.drag.crosshair.y:set_visible(a)
        menu.visuals.damage_select:set_visible(a)
        menu.drag.damage.x:set_visible(a)
        menu.drag.damage.y:set_visible(a)
        menu.drag.arrows.x:set_visible(a)
        menu.drag.feature_ind.y:set_visible(a)
        menu.drag.velocity.x:set_visible(a)
        menu.drag.velocity.y:set_visible(a)
        menu.drag.defensive.x:set_visible(a)
        menu.drag.defensive.y:set_visible(a)
        menu.drag.wt.x:set_visible(a)
        menu.drag.wt.y:set_visible(a)
        menu.drag.wt.wt_type:set_visible(a)
    end

    function depend.information(tab) 
        menu.information.user:depend(tab)
        menu.information.build:depend(tab)
        menu.information.session:depend(tab)
        menu.information.time:depend(tab)
        menu.information.kills:depend(tab)
        menu.information.deaths:depend(tab)
        menu.information.linessoc:depend(tab)
        menu.information.lb_color:depend(tab)
        menu.information.color:depend(tab)
        menu.information.color_type:depend(tab, {menu.information.color, "Custom"})
        menu.information.color_gradient:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"})
        menu.information.color_speed:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"})
        menu.information.lb_default_color:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Default"})
        menu.information.default_color:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Default"})
        menu.information.lb_color1:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "2x", "3x"})
        menu.information.color1:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "2x", "3x"})
        menu.information.lb_color2:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "2x", "3x"})
        menu.information.color2:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "2x", "3x"})
        menu.information.lb_color3:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "3x"})
        menu.information.color3:depend(tab, {menu.information.color, "Custom"}, {menu.information.color_type, "Gradient"}, {menu.information.color_gradient, "3x"})
        lines21:depend(tab)
        list_select:depend(tab)
        menu.information.list:depend(tab)
        menu.information.name:depend(tab)
        menu.information.button_create:depend(tab)
        menu.information.button_import:depend(tab)
        menu.information.button_export:depend(tab)
        menu.information.button_load:depend(tab)
        menu.information.button_delete:depend(tab)
    end

    function depend.ragebot(tab) 
        menu.ragebot.resolver:depend(tab)
        menu.ragebot.lb_:depend(tab)
        menu.ragebot.lb_auto_tp:depend(tab)
        menu.ragebot.auto_tp_hot:depend(tab)
        menu.ragebot.auto_tp_air_check:depend(tab)
        menu.ragebot.lb_auto_tp_wp:depend(tab)
        menu.ragebot.lb_auto_tp_opt:depend(tab)
        menu.ragebot.auto_tp_opt:depend(tab)
        menu.ragebot.auto_tp_wp:depend(tab)
        menu.ragebot.auto_tp_delay:depend(tab)
        menu.ragebot.lb15:depend(tab)
        menu.ragebot.lb_magic_key:depend(tab)
        menu.ragebot.magic_key:depend(tab)
        menu.ragebot.magic_hitbox:depend(tab)
        menu.ragebot.lb_100:depend(tab)
        menu.ragebot.lb_forceshot:depend(tab)
        menu.ragebot.en_forceshot:depend(tab)
        menu.ragebot.force_shot_weapon:depend(tab, {menu.ragebot.en_forceshot, true})
        menu.ragebot.en_forceshot_ht:depend(tab, {menu.ragebot.en_forceshot, true})
        menu.ragebot.hitchance_force_shot:depend(tab, {menu.ragebot.en_forceshot, true})
        menu.ragebot.target:depend(tab)
        menu.ragebot.lb_main:depend(tab)
        menu.ragebot.hitrate:depend(tab)
        menu.ragebot.lb99:depend(tab)
        menu.ragebot.lb_autostop:depend(tab)
        menu.ragebot.autostop:depend(tab)
        menu.ragebot.lb54:depend(tab)
        menu.ragebot.lb_inter:depend(tab)
        menu.ragebot.inter:depend(tab)
        menu.ragebot.lb2:depend(tab)
        menu.ragebot.lb_auto:depend(tab)
        menu.ragebot.cond:depend(tab)
        menu.ragebot.weapon:depend(tab)
        menu.ragebot.lb4:depend(tab)
        menu.ragebot.lb_noscope:depend(tab)
        menu.ragebot.noscope_wp:depend(tab)
        menu.ragebot.noscope_dist:depend(tab, {menu.ragebot.noscope_wp, "AWP", "Scout", "Auto"})
        menu.ragebot.noscope_hit:depend(tab, {menu.ragebot.noscope_wp, "AWP", "Scout", "Auto"})
        menu.ragebot.lb3:depend(tab)
        menu.ragebot.ai:depend(tab)
        menu.ragebot.lb_ai:depend(tab)
        menu.ragebot.ai_hotkey:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_visual:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_risk_mode:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_hit:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_dm:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_delay:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_hitbox:depend(tab, {menu.ragebot.ai, true})
        menu.ragebot.ai_weapon:depend(tab, {menu.ragebot.ai, true})
    end

    function depend.aimtools(tab)
        menu.ragebot.main_switch:depend(tab)
        menu.ragebot.main_label:depend(tab)
        menu.ragebot.esp_flags:depend(tab, {menu.ragebot.main_switch, true})
        menu.ragebot.esp_font:depend(tab, {menu.ragebot.main_switch, true}, {menu.ragebot.esp_flags, true})
        menu.ragebot.esp_color:depend(tab, {menu.ragebot.main_switch, true}, {menu.ragebot.esp_flags, true})
        menu.ragebot.lb1:depend(tab, {menu.ragebot.main_switch, true}, {menu.ragebot.esp_flags, true})
        menu.ragebot.main_combobox:depend(tab, {menu.ragebot.main_switch, true})
        for i = 1, #aimtools do
            local tab_cond = {menu.ragebot.main_combobox, aimtools_cond[i]}
            local vis = {menu.ragebot.main_switch, true}
            local aimbot = {aimtools[i].options, 'Aimbot'}
            local BS = {aimtools[i].options, 'B&S'}
            aimtools[i].options:depend(tab, tab_cond, vis)
            aimtools[i].hitscan_lb:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].hitscan:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].hitscan_high:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'Higher than you'}, aimbot)
            aimtools[i].hitscan_low:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'Lower than you'}, aimbot)
            aimtools[i].hitscan_leth:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'Lethal'}, aimbot)
            aimtools[i].hitscan_after_mis:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'After X Misses'}, aimbot)
            aimtools[i].hitscan_lower_than_X:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'HP lower than X'}, aimbot)
            aimtools[i].hitscan_misses:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'After X Misses'}, aimbot, {aimtools[i].hitscan_after_mis, 1, 4})
            aimtools[i].hitscan_hp:depend(tab, tab_cond, vis, {aimtools[i].hitscan, 'HP lower than X'}, aimbot, {aimtools[i].hitscan_lower_than_X, 1, 4})
            aimtools[i].delay_lb:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].delay:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].delay_high:depend(tab, tab_cond, vis, {aimtools[i].delay, 'Higher than you'}, aimbot)
            aimtools[i].delay_low:depend(tab, tab_cond, vis, {aimtools[i].delay, 'Lower than you'}, aimbot)
            aimtools[i].delay_leth:depend(tab, tab_cond, vis, {aimtools[i].delay, 'Lethal'}, aimbot)
            aimtools[i].delay_after_mis:depend(tab, tab_cond, vis, {aimtools[i].delay, 'After X Misses'}, aimbot)
            aimtools[i].delay_lower_than_X:depend(tab, tab_cond, vis, {aimtools[i].delay, 'HP lower than X'}, aimbot)
            aimtools[i].delay_misses:depend(tab, tab_cond, vis, {aimtools[i].delay, 'After X Misses'}, aimbot, {aimtools[i].delay_after_mis, 1, 4})
            aimtools[i].delay_hp:depend(tab, tab_cond, vis, {aimtools[i].delay, 'HP lower than X'}, aimbot, {aimtools[i].delay_lower_than_X, 1, 4})
            aimtools[i].multi_lb:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].multi:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].multi_high:depend(tab, tab_cond, vis, {aimtools[i].multi, 'Higher than you'}, aimbot)
            aimtools[i].multi_low:depend(tab, tab_cond, vis, {aimtools[i].multi, 'Lower than you'}, aimbot)
            aimtools[i].multi_lethal:depend(tab, tab_cond, vis, {aimtools[i].multi, 'Lethal'}, aimbot)
            aimtools[i].multi_after_miss:depend(tab, tab_cond, vis, {aimtools[i].multi, 'After X Misses'}, aimbot)
            aimtools[i].multi_hp_than_x:depend(tab, tab_cond, vis, {aimtools[i].multi, 'HP lower than X'}, aimbot)
            aimtools[i].multi_misses:depend(tab, tab_cond, vis, {aimtools[i].multi, 'After X Misses'}, aimbot, {aimtools[i].multi_after_miss, 24, 100})
            aimtools[i].multi_hp:depend(tab, tab_cond, vis, {aimtools[i].multi, 'HP lower than X'}, aimbot, {aimtools[i].multi_hp_than_x, 24, 100})
            aimtools[i].hitchance_lb:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].hitchance:depend(tab, tab_cond, vis, aimbot)
            aimtools[i].hitchance_high:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'Higher than you'}, aimbot)
            aimtools[i].hitchance_low:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'Lower than you'}, aimbot)
            aimtools[i].hitchance_lethal:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'Lethal'}, aimbot)
            aimtools[i].hitchance_after_miss:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'After X Misses'}, aimbot)
            aimtools[i].hitchance_hp_than_x:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'HP lower than X'}, aimbot)
            aimtools[i].hitchance_misses:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'After X Misses'}, aimbot, {aimtools[i].hitchance_after_miss, 1, 100})
            aimtools[i].hitchance_hp:depend(tab, tab_cond, vis, {aimtools[i].hitchance, 'HP lower than X'}, aimbot, {aimtools[i].hitchance_hp_than_x, 1, 100})
            aimtools[i].body_prefer_lb:depend(tab, tab_cond, vis, BS)
            aimtools[i].body_prefer:depend(tab, tab_cond, vis, BS)
            aimtools[i].lb_bd_misses:depend(tab, tab_cond, vis, {aimtools[i].body_prefer, "After X Misses"}, BS)
            aimtools[i].body_misses:depend(tab, tab_cond, vis, {aimtools[i].body_prefer, "After X Misses"}, BS)
            aimtools[i].lb_bd_hp:depend(tab, tab_cond, vis, {aimtools[i].body_prefer, "HP lower than X"}, BS)
            aimtools[i].body_hp:depend(tab, tab_cond, vis, {aimtools[i].body_prefer, "HP lower than X"}, BS)
            aimtools[i].safe_prefer_lb:depend(tab, tab_cond, vis, BS)
            aimtools[i].safe_prefer:depend(tab, tab_cond, vis, BS)
            aimtools[i].lb_sf_misses:depend(tab, tab_cond, vis, {aimtools[i].safe_prefer, "After X Misses"}, BS)
            aimtools[i].safe_misses:depend(tab, tab_cond, vis, {aimtools[i].safe_prefer, "After X Misses"}, BS)
            aimtools[i].lb_sf_hp:depend(tab, tab_cond, vis, {aimtools[i].safe_prefer, "HP lower than X"}, BS)
            aimtools[i].safe_hp:depend(tab, tab_cond, vis, {aimtools[i].safe_prefer, "HP lower than X"}, BS)
        end
    end

    function depend.hit(tab)
        hitchance.label:depend(tab)
        hitchance.wp:depend(tab)
        scout.jumpstop_distance:depend(tab, {hitchance.wp, "Scout"})
        scout.jumpstop_hotkey:depend(tab, {hitchance.wp, "Scout"})
        scout.label:depend(tab, {hitchance.wp, "Scout"})
        scout.jumpstop_delay:depend(tab, {hitchance.wp, "Scout"})
        bl:depend(tab)
        for i = 1, #hit do
            local tab_cond = {hitchance.wp, hit_cond[i]}
            hit[i].label_ovr_hit:depend(tab, tab_cond)
            hit[i].label_ovr_air_hit:depend(tab, tab_cond)
            hit[i].ovr_hit:depend(tab, tab_cond)
            hit[i].hot:depend(tab, tab_cond)
            hit[i].ovr_air_hit:depend(tab, tab_cond)
        end
    end

    function depend.antiaim(tab, tab2, tab3, tab4, tab5)
        menu.antiaim.selection:depend(tab)
        menu.antiaim.lb_side:depend(tab, tab2)
        menu.antiaim.send_ct:depend(tab, tab2, {menu.antiaim.side_switch, 'T'})
        menu.antiaim.send_t:depend(tab, tab2, {menu.antiaim.side_switch, 'CT'})

        --Builder
        menu.antiaim.label:depend(tab, tab2)
        menu.antiaim.condition:depend(tab, tab2)
        menu.antiaim.lb_flick_settings:depend(tab, tab5)
        menu.antiaim.fl_hot:depend(tab, tab5)
        menu.antiaim.pitch_type_fl:depend(tab, tab5)
        menu.antiaim.pitch_static_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Static'})
        menu.antiaim.pitch_mode1_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Jitter', 'Spin', 'Spin[MOD]', 'Random'})
        menu.antiaim.pitch_mode2_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Jitter', 'Spin', 'Spin[MOD]', 'Random'})
        menu.antiaim.pitch_speed_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Spin', 'Spin[MOD]'})
        menu.antiaim.pitch_jitter_speed_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Jitter'})
        menu.antiaim.pitch_slow_def_fl:depend(tab, tab5, {menu.antiaim.pitch_type_fl, 'Random'})

        --Features
        menu.antiaim.lb_features:depend(tab, tab3)
        menu.antiaim.features:depend(tab, tab3)
        menu.antiaim.avoid:depend(tab, tab3, {menu.antiaim.features, "Avoid Backstab"})
        menu.antiaim.label4:depend(tab, tab3, {menu.antiaim.features, "Avoid Backstab", "Safe head"})
        menu.antiaim.lb_safe:depend(tab, tab3, {menu.antiaim.features, "Safe head"})
        menu.antiaim.safe:depend(tab, tab3, {menu.antiaim.features, "Safe head"})
        menu.antiaim.lb_safe_head:depend(tab, tab3, {menu.antiaim.features, "Safe head"})
        menu.antiaim.safe_head:depend(tab, tab3, {menu.antiaim.features, "Safe head"})
        menu.antiaim.label_safe:depend(tab, tab3, {menu.antiaim.features, "Safe head"})
        menu.antiaim.label_high_ep1:depend(tab, tab3, {menu.antiaim.safe, "High distance"})
        menu.antiaim.label_high:depend(tab, tab3, {menu.antiaim.safe, "High distance"})
        menu.antiaim.high_distance_options:depend(tab, tab3, {menu.antiaim.safe, "High distance"})
        menu.antiaim.side_switch:depend(tab, tab2)
        menu.antiaim.lb_yaw_direction:depend(tab, tab3)
        menu.antiaim.yaw_direction:depend(tab, tab3)
        menu.antiaim.label12:depend(tab, tab3, {menu.antiaim.yaw_direction, "Edge Yaw", "Freestanding"})
        menu.antiaim.edge_yaw:depend(tab, tab3, {menu.antiaim.yaw_direction, "Edge Yaw"})
        menu.antiaim.label5:depend(tab, tab3, {menu.antiaim.yaw_direction, "Freestanding"})
        menu.antiaim.freestanding_hotkey:depend(tab, tab3, {menu.antiaim.yaw_direction, "Freestanding"})
        menu.antiaim.lb_freestanding_disablers:depend(tab, tab3, {menu.antiaim.yaw_direction, "Freestanding"})
        menu.antiaim.freestanding_disablers:depend(tab, tab3, {menu.antiaim.yaw_direction, "Freestanding"})
        menu.antiaim.lb_manuals_disablers:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})
        menu.antiaim.manuals_disablers:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})
        menu.antiaim.manuals_left:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})
        menu.antiaim.manuals_right:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})
        menu.antiaim.manuals_forward:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})
        menu.antiaim.manuals_reset:depend(tab, tab3, {menu.antiaim.yaw_direction, "Manuals"})

        --Other
        menu.antiaim.fake_label:depend(tab, tab4)
        menu.antiaim.fakeenabled:depend(tab, tab4)
        menu.antiaim.fake_amount:depend(tab, tab4)
        menu.antiaim.fake_variance:depend(tab, tab4)
        menu.antiaim.fake_limit:depend(tab, tab4)
        menu.antiaim.lb12:depend(tab, tab4)
    end

    function depend.builder(tab, tab2, current_side)
        for i = 1, #antiaim_cond do
            local visible = tab
            local vis = tab2
            local cond = {builder[i].enabled, function () if (i == 1) then return true else return builder[i].enabled:get() end end}
            local state = {menu.antiaim.condition, antiaim_cond[i]}
            local yaw = {builder[i].main, "Yaw"}
            local def = {builder[i].main, "Defensive"}
            local jitter = {builder[i].yaw_mode, "Jitter"}
            
            builder[i].lb1:depend(visible, state, {menu.antiaim.condition, function() return (i ~= 0) end}, vis)
            builder[i].enabled:depend(visible, state, {menu.antiaim.condition, function() return (i ~= 1) end}, vis)
            builder[i].state:depend(visible, state, vis) 
            builder[i].label1:depend(visible, state, cond, vis)
            builder[i].label2:depend(visible, state, cond, vis)
            builder[i].main:depend(visible, state, cond, vis)
            builder[i].lb_pizdec:depend(visible, state, cond, vis, yaw)
            builder[i].lb_brute:depend(visible, state, cond, vis, yaw)
            builder[i].brute_mode:depend(visible, state, cond, vis, yaw)
            builder[i].delay_force:depend(visible, state, cond, vis, yaw, {builder[i].brute_mode, 'Adaptive', 'Decrease', 'Increase'})
            builder[i].duration_brute:depend(visible, state, cond, vis, yaw, {builder[i].brute_mode, 'Adaptive', 'Decrease', 'Increase'})
            builder[i].label3:depend(visible, state, cond, yaw,  vis)
            builder[i].offset_lb:depend(visible, state, cond, yaw, vis)
            builder[i].offset:depend(visible, state, cond, yaw, vis)
            builder[i].offset_lb1:depend(visible, state, cond, yaw, vis)
            builder[i].ofs_lb_1:depend(visible, state, cond, yaw, vis)
            builder[i].ofs_tp_1:depend(visible, state, cond, yaw, vis)
            builder[i].ofs_way_1:depend(visible, state, cond, yaw, {builder[i].ofs_tp_1, 'Way'},vis)
            builder[i].ofs_ways_delay_1:depend(visible, state, cond, yaw, {builder[i].ofs_tp_1, 'Way'},vis)

            for w = 1, 5 do
                if builder[i].ofs_ways_1[w] then
                    builder[i].ofs_ways_1[w]:depend(visible, state, cond, yaw, vis, 
                        {builder[i].ofs_tp_1, 'Way'}, 
                        {builder[i].ofs_way_1, function() 
                            if not builder[i].ofs_way_1 then return false end
                            return builder[i].ofs_way_1:get() >= w 
                        end}
                    )
                end
            end

            builder[i].ofs_1:depend(visible, state, cond, yaw, {builder[i].ofs_tp_1, 'Default'}, vis)
            builder[i].ofs_lb_2:depend(visible, state, cond, yaw, vis)
            builder[i].ofs_tp_2:depend(visible, state, cond, yaw, vis)
            builder[i].ofs_way_2:depend(visible, state, cond, yaw, {builder[i].ofs_tp_2, 'Way'},vis)
            builder[i].ofs_ways_delay_2:depend(visible, state, cond, yaw, {builder[i].ofs_tp_2, 'Way'},vis)

             for w = 1, 5 do
                if builder[i].ofs_ways_2[w] then
                    builder[i].ofs_ways_2[w]:depend(visible, state, cond, yaw, vis,  
                        {builder[i].ofs_tp_2, 'Way'}, 
                        {builder[i].ofs_way_2, function() 
                            if not builder[i].ofs_way_2 then return false end
                            return builder[i].ofs_way_2:get() >= w 
                        end}
                    )
                end
            end

            builder[i].ofs_2:depend(visible, state, cond, {builder[i].ofs_tp_2, 'Default'},  yaw, vis)
            builder[i].label4:depend(visible, state, cond, yaw, vis)
            builder[i].label5:depend(visible, state, cond, yaw, vis)
            builder[i].yaw_mode:depend(visible, state, cond, yaw, vis)   
            builder[i].spna_switch:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Spin"}, vis)
            builder[i].spna:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Spin"}, vis)
            builder[i].spna2:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Spin"}, vis, {builder[i].spna_switch, true})
            builder[i].spna_speed:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Spin"}, vis)
            builder[i].spna_speed2:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Spin"}, vis, {builder[i].spna_switch, true})
            builder[i].rana_switch:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Random"}, vis)
            builder[i].rana:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Random"}, vis)
            builder[i].rana2:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Random"}, vis, {builder[i].rana_switch, true})
            builder[i].label7:depend(visible, state, cond, yaw, {builder[i].yaw_mode, "Jitter"}, vis)
            builder[i].label6:depend(visible, state, cond, yaw, jitter, vis)
            builder[i].yaw_jitter:depend(visible, state, cond, yaw, jitter, vis)
            builder[i].xway_slider:depend(visible, state, cond, yaw, jitter, {builder[i].yaw_jitter, "X-Way"}, vis)
            builder[i].xway_jitter:depend(visible, state, cond, yaw, jitter, {builder[i].yaw_jitter, "X-Way"}, vis)
            builder[i].yawjitter:depend(visible, state, cond, yaw, jitter, {builder[i].yaw_jitter, "Center", "Offset", "Skitter", "Random"}, vis)
            
            builder[i].label9:depend(visible, state, cond, vis, yaw)
            builder[i].label8:depend(visible, state, cond, vis, yaw)
            builder[i].bodyyaw:depend(visible, state, cond, vis, yaw)
            builder[i].bd_type:depend(visible, state, cond, vis, yaw, {builder[i].bodyyaw, "Static", "Jitter"})
            builder[i].body_type:depend(visible, state, cond, vis, {builder[i].bodyyaw, "Static", "Jitter"}, yaw)
            builder[i].body_static:depend(visible, state, cond, vis, {builder[i].bodyyaw, "Static", "Jitter"}, yaw, {builder[i].bd_type, 'Gamesense'})
            builder[i].body_left:depend(visible, state, cond, vis, {builder[i].bodyyaw, "Static", "Jitter"}, yaw, {builder[i].bd_type, 'Advanced'})
            builder[i].body_right:depend(visible, state, cond, vis, {builder[i].bodyyaw, "Static", "Jitter"}, yaw, {builder[i].bd_type, 'Advanced'})

            builder[i].label11:depend(visible, state, cond, vis, yaw)
            builder[i].delay_method:depend(visible, state, cond, vis, yaw)
            builder[i].delay:depend(visible, state, cond, {builder[i].delay_method, 'Default'}, vis, yaw)
            builder[i].random_delay:depend(visible, state, cond, {builder[i].delay_method, 'Default'}, vis, yaw)
            builder[i].hold_ticks:depend(visible, state, cond, vis, yaw, {builder[i].delay_switch, 'Hold ticks'})
            builder[i].ways:depend(visible, state, cond, {builder[i].delay_method, 'Ways'}, vis, yaw)
            builder[i].delay_fluc:depend(visible, state, cond, {builder[i].delay_switch, 'Fluctuate'}, vis, yaw)
            builder[i].delay_switch:depend(visible, state, cond, vis, yaw)

            for w = 1, 10 do
                if builder[i].way_del[w] then
                    builder[i].way_del[w]:depend(visible, state, cond, {builder[i].delay_method, 'Ways'}, vis, yaw, {builder[i].ways, function() if not builder[i].ways then return false end return builder[i].ways:get() >= w end}
                    )
                end
            end

            builder[i].force_lc:depend(visible, state, cond, def, vis)
            builder[i].def_en:depend(visible, state, cond, def, vis)
            builder[i].pitch_type:depend(visible, state, cond, vis, def, {builder[i].def_en, true})
            builder[i].pitch_static:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Static"})
            builder[i].pitch_mode1:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Jitter", "Spin", "Spin[MOD]", "Random"})
            builder[i].pitch_mode2:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Jitter", "Spin", "Spin[MOD]", "Random"})
            builder[i].pitch_speed:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Spin", "Spin[MOD]"})
            builder[i].pitch_jitter_speed:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Jitter"})
            builder[i].pitch_slow_def:depend(visible, state, cond, vis, def, {builder[i].def_en, true}, {builder[i].pitch_type, "Random"})
            builder[i].yaw_def:depend(visible, state, cond, vis, def,  {builder[i].def_en, true})
            builder[i].yaw_amount:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, "Static", "Static[FS]", "Random", "Spin", "Jitter"})
            builder[i].yaw_left:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, "Jitter[L/R]"})
            builder[i].yaw_right:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, "Jitter[L/R]"})
            builder[i].def_jitter_speed:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, "Jitter[L/R]", "Jitter"})
            builder[i].def_spin_speed:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, "Spin"})
            builder[i].adaptive_desync:depend(visible, vis, state, cond, def,  {builder[i].def_en, true}, {builder[i].yaw_def, function() return builder[i].yaw_def:get() ~= 'Off' end})
        end
    end
     
    function depend.visuals(tab)
        menu.visuals.dpilb:depend(tab)
        menu.visuals.globalize_dpi:depend(tab)
        menu.visuals.lb_recent:depend(tab)
        menu.visuals.recent_color:depend(tab)
        menu.visuals.lb1:depend(tab)
        menu.visuals.lb_main:depend(tab)
        menu.visuals.lb2:depend(tab)
        menu.visuals.lb_selection:depend(tab)
        menu.visuals.menu_selection:depend(tab)
        menu.visuals.lb_space:depend(tab)
        menu.visuals.lb3:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.lb4:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.lb5:depend(tab)
        menu.visuals.lb6:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.crosshair, true})
        menu.visuals.damage_label:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.damage_ind:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.damage_anim:depend(tab, {menu.visuals.damage_ind, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.damage_color:depend(tab, {menu.visuals.damage_ind, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.arrows_label:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.arrows:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.arrows_type:depend(tab, {menu.visuals.arrows, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.v4_mode:depend(tab, {menu.visuals.arrows, true}, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.arrows_type, "V4"})
        menu.visuals.arrows_scope:depend(tab, {menu.visuals.arrows, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.arrows_color:depend(tab, {menu.visuals.arrows, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.crosshair_label:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.crosshair:depend(tab, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.crosshair_select:depend(tab, {menu.visuals.crosshair, true}, {menu.visuals.menu_selection, 'Main'})
        menu.visuals.cr_color_type:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.crosshair, true})
        menu.visuals.cr_color_gradient:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_color_speed:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_lb_default_color:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Default"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_default_color:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Default"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_lb_color1:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "2x", "3x"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_color1:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "2x", "3x"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_lb_color2:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "2x", "3x"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_color2:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "2x", "3x"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_lb_color3:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "3x"}, {menu.visuals.crosshair, true})
        menu.visuals.cr_color3:depend(tab, {menu.visuals.menu_selection, 'Main'}, {menu.visuals.cr_color_type, "Gradient"}, {menu.visuals.cr_color_gradient, "3x"}, {menu.visuals.crosshair, true})
    
        menu.visuals.custom_ind_gs_label:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_color:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_colorcp:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_icon:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_size:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_rect1:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_rect:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})
        menu.visuals.custom_ind_gs_back:depend(tab, {menu.visuals.menu_selection, 'Prefer gamesense indicator'})

        menu.visuals.lb_ui:depend(tab)
        menu.visuals.ui_main:depend(tab)
        menu.visuals.ui_color:depend(tab, {menu.visuals.ui_main, "Watermark", "Keybinds", "Spectator", "Velocity", "Defensive"})
        menu.visuals.ui_lb_default_color:depend(tab, {menu.visuals.ui_main, "Watermark", "Keybinds", "Spectator", "Velocity", "Defensive"}, {menu.visuals.ui_color, "Once-color"})
        menu.visuals.ui_default_color:depend(tab, {menu.visuals.ui_main, "Watermark", "Keybinds", "Spectator", "Velocity", "Defensive"}, {menu.visuals.ui_color, "Once-color"})
        menu.visuals.ui_lb_color1:depend(tab, {menu.visuals.ui_main, "Watermark"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_color1:depend(tab, {menu.visuals.ui_main, "Watermark"}, {menu.visuals.ui_color, "Multi-color"} )
        menu.visuals.ui_lb_color2:depend(tab, {menu.visuals.ui_main, "Keybinds"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_color2:depend(tab, {menu.visuals.ui_main, "Keybinds"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_lb_color3:depend(tab, {menu.visuals.ui_main, "Spectator"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_color3:depend(tab, {menu.visuals.ui_main, "Spectator"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_lb_color4:depend(tab, {menu.visuals.ui_main, "Velocity"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_color4:depend(tab, {menu.visuals.ui_main, "Velocity"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_lb_color5:depend(tab, {menu.visuals.ui_main, "Defensive"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.ui_color5:depend(tab, {menu.visuals.ui_main, "Defensive"}, {menu.visuals.ui_color, "Multi-color"})
        menu.visuals.lb_water:depend(tab, {menu.visuals.ui_main, "Watermark"})
        menu.visuals.water_main:depend(tab, {menu.visuals.ui_main, "Watermark"})
        menu.visuals.hotkey_item:depend(tab, {menu.visuals.ui_main, "Keybinds"})
        menu.visuals.lb_hotkeys:depend(tab, {menu.visuals.ui_main, "Keybinds"})


        menu.visuals.tracer_en:depend(tab)
        menu.visuals.tracer_lb:depend(tab)
        menu.visuals.lb999:depend(tab)

        menu.visuals.lb_world_to_screen:depend(tab)
        menu.visuals.kibit_marker:depend(tab)
        menu.visuals.kibit_color:depend(tab, {menu.visuals.kibit_marker, 'Hit'})
        menu.visuals.kibit_color2:depend(tab, {menu.visuals.kibit_marker, 'Miss'})
        menu.visuals.kibit_miss:depend(tab, {menu.visuals.kibit_marker, 'Miss'})
    end
    
    function depend.miscellaneous(tab, tab2, tab3)
        menu.misc.menu:depend(tab)
        menu.misc.lb_misc:depend(tab, tab2)
        menu.misc.quickswitch:depend(tab, tab2)
        menu.misc.r8_round:depend(tab, tab2)
        menu.misc.fast_ladder:depend(tab, tab2)
        menu.misc.filter_console:depend(tab, tab2)
        menu.misc.drop_nades:depend(tab, tab2)
        menu.misc.drop_items:depend(tab, tab2, {menu.misc.drop_nades, true})
        menu.misc.drop_hotkey:depend(tab, tab2, {menu.misc.drop_nades, true})
        menu.misc.clantag:depend(tab, tab2)
        menu.misc.chat_revealer:depend(tab, tab2)
        menu.misc.chat_spammer:depend(tab, tab2)
        menu.misc.chat_spammer_type:depend(tab, tab2, {menu.misc.chat_spammer, true})
        menu.misc.lb3:depend(tab, tab2)
        menu.misc.lb2:depend(tab, tab3)
        menu.misc.lb_aimbot:depend(tab, tab2)
        menu.misc.aimbot_on:depend(tab, tab2, {menu.misc.output_log, 'Output'})
        menu.misc.aimbot_on1:depend(tab, tab2, {menu.misc.output_log, 'Screen'})
        menu.misc.prefix_screen:depend(tab, tab2, {menu.misc.output_log, 'Screen'})
        menu.misc.aimbot_hit:depend(tab, tab2)
        menu.misc.aimbot_miss:depend(tab, tab2)
        menu.misc.output_output:depend(tab, tab2, {menu.misc.output_log, 'Output'})
        menu.misc.output_lb:depend(tab, tab2, {menu.misc.output_log, 'Output'}, {menu.misc.output_output, true})
        menu.misc.output_font:depend(tab, tab2, {menu.misc.output_log, 'Output'}, {menu.misc.output_output, true})
        menu.misc.output_anim:depend(tab, tab2, {menu.misc.output_log, 'Output'}, {menu.misc.output_output, true})
        menu.misc.output_log:depend(tab, tab2)
        menu.misc.output_x:depend(tab, tab2, {menu.misc.output_log, 'Output'}, {menu.misc.output_output, true})
        menu.misc.output_y:depend(tab, tab2, {menu.misc.output_log, 'Output'}, {menu.misc.output_output, true})
        menu.misc.lb_anim:depend(tab, tab2)
        menu.misc.lb_animbr:depend(tab, tab2)   
        menu.misc.tab_anim:depend(tab, tab2)
        menu.misc.anim_walk:depend(tab, tab2, {menu.misc.tab_anim, "Animation breakers"})
        menu.misc.jitter_value:depend(tab, tab2, {menu.misc.anim_walk, "Static", "Jitter", "Advanced Jitter", "Random"}, {menu.misc.tab_anim, "Animation breakers"})
        menu.misc.jitter_speed:depend(tab, tab2, {menu.misc.anim_walk, "Advanced Jitter"},{menu.misc.tab_anim, "Animation breakers"})
        menu.misc.anim_air:depend(tab, tab2, {menu.misc.tab_anim, "Animation breakers"})
        menu.misc.m_elements:depend(tab, tab2, {menu.misc.tab_anim, "Animation addons"})
        menu.misc.anim_elem_air:depend(tab, tab2, {menu.misc.anim_air, "Static"}, {menu.misc.tab_anim, "Animation breakers"})
        menu.misc.body_lean_value:depend(tab, tab2, {menu.misc.m_elements, "Adjust body lean"}, {menu.misc.tab_anim, "Animation addons"})
        menu.misc.lb_earth:depend(tab, tab2, {menu.misc.tab_anim, "Animation addons"}, {menu.misc.m_elements, "Earthquake"})
        menu.misc.state:depend(tab, tab2, {menu.misc.tab_anim, "Animation addons"}, {menu.misc.m_elements, "Earthquake"})
        menu.misc.speedearth:depend(tab, tab2, {menu.misc.tab_anim, "Animation addons"}, {menu.misc.m_elements, "Earthquake"})
        menu.misc.lb_other:depend(tab, tab3)
        menu.misc.aspect_ratio:depend(tab, tab3)
        menu.misc.aspect_ratio_slider:depend(tab, {menu.misc.aspect_ratio, true}, tab3) 
        menu.misc.third_person:depend(tab, tab3)
        menu.misc.third_person_slider:depend(tab, {menu.misc.third_person, true}, tab3)
        menu.misc.third_person_magic:depend(tab, {menu.misc.third_person, true}, tab3)
        menu.misc.lb:depend(tab, tab3) 
        menu.misc.lb_view:depend(tab, tab3)
        menu.misc.zoom:depend(tab, tab3) 
        menu.misc.zoom_fov:depend(tab, {menu.misc.zoom, true}, tab3)
        menu.misc.zoom_anim:depend(tab, {menu.misc.zoom, true}, tab3)
        menu.misc.viewmodel:depend(tab, tab3)
        menu.misc.opposite_hand:depend(tab, tab3, {menu.misc.viewmodel, true})
        menu.misc.remove_sleeves:depend(tab, tab3, {menu.misc.viewmodel, true})
        menu.misc.vS:depend(tab, {menu.misc.viewmodel, true}, tab3)
        menu.misc.xS:depend(tab, {menu.misc.viewmodel, true}, tab3)
        menu.misc.yS:depend(tab, {menu.misc.viewmodel, true}, tab3)
        menu.misc.zS:depend(tab, {menu.misc.viewmodel, true}, tab3)
        menu.misc.lb_scope:depend(tab, tab3)
        menu.misc.viewinsc:depend(tab, tab3)
        menu.misc.scope_overlay:depend(tab, tab3)
        menu.misc.scope_mode_ovr:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_disablers:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_color:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_size:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_gap:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_thickness:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_position:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.scope_animation:depend(tab, {menu.misc.scope_overlay, true}, tab3)
        menu.misc.lb_buybot:depend(tab, tab2)
        menu.misc.buybot:depend(tab, tab2)
        menu.misc.buybot_primary:depend(tab, tab2)
        menu.misc.buybot_secondary:depend(tab, tab2)
        menu.misc.buybot_utility:depend(tab, tab2)
        menu.misc.lb_game:depend(tab, tab3)
        menu.misc.game_check:depend(tab, tab3)
        menu.misc.game_list:depend(tab, tab3, {menu.misc.game_check, true})
    end

    depend.information({menu.main, " Information"})
    depend.ragebot({menu.main, " Ragebot"})
    depend.aimtools({menu.main, " Ragebot"})
    depend.hit({menu.main, " Ragebot"})
    depend.antiaim({menu.main, " Anti-Aim"}, {menu.antiaim.selection, " Builder"}, {menu.antiaim.selection, " Features", " Other"}, {menu.antiaim.selection, " Other"}, {menu.antiaim.selection, " Features"})
    depend.builder({menu.main, " Anti-Aim"}, {menu.antiaim.selection, " Builder"})
    depend.visuals({menu.main, " Visuals"})
    depend.miscellaneous({menu.main, " Miscellaneous"}, {menu.misc.menu, " Misc"}, {menu.misc.menu, " Other"})
    depend.drag(false)
end

local yaw_direction = 0

local brute_container = {}

local team_num 
local real_side 

local antibrute = {} do

    local function get_state_data(state_id)
        if not brute_container[state_id] then
            brute_container[state_id] = {
                add_yaw = 0,
                delay_mod = 0,
                pending_yaw = nil,
                pending_delay = nil,
                exec_tick = 0,
                reset_time = 0,
                last_miss_time = 0,
            }
        end
        return brute_container[state_id]
    end

    latest = 0
    damaged = 0

    function antibrute.closest_ray_point (p, s, e)
        local t, d = p - s, e - s
        local l = d:length()
        d = d / l
        local r = d:dot(t)
        if r < 0 then return s elseif r > l then return e end
        return s + d * r
    end

    local last_hit_tick = 0
    function antibrute.trigger (event)

        local lp = entity.get_local_player()
        if lp == nil or not entity.is_alive(lp) or latest == globals.tickcount() then return end

		local attacker = client.userid_to_entindex(event.userid)
		if not attacker or not entity.is_enemy(attacker) or entity.is_dormant(attacker) then return end
		--
		local impact = vector(event.x, event.y, event.z)
		local enemy_view = vector(entity.get_origin(attacker))
		enemy_view.z = enemy_view.z + 64

        local players = entity.get_players()

		local dists = {}
		for i = 1, #players do
			local v = players[i]

			if not entity.is_enemy(v) then
				local head = vector(entity.hitbox_position(v, 0))
				local point = antibrute.closest_ray_point(head, enemy_view, impact)
				dists[#dists+1] = head:dist(point)
				if v == lp then dists.mine = dists[#dists] end
			end
		end

		local closest = math.min( unpack(dists) )

		--
		if (dists.mine and closest) and dists.mine < 40 or (closest == dists.mine and dists.mine < 128) then
            local shot_tick = globals.tickcount()
            client.delay_call(0.01, function()
                if last_hit_tick == shot_tick then
                    return 
                end
                local attacker_name = entity.get_player_name(attacker)

                client.fire_event("pizdec:pacan:enemy_shot", {
                    damaged = false,
                    dist = dists.mine,
                    attacker = attacker,
                    userid = event.userid
                })
            end)

            latest = shot_tick
        end
	end

    function antibrute.schedule_brute(state_id)
        local data = get_state_data(state_id)
        local mode = get_cfg(state_id, real_side).brute_mode
        if mode == 'Disabled' then return end

        local new_angle = 0

        if mode == 'Adaptive' then new_angle = math.random(-15, 15)
        elseif mode == 'Decrease' then new_angle = math.random(-15, -5)
        elseif mode == 'Increase' then new_angle = math.random(5, 15) end

        data.pending_yaw = new_angle
        if get_cfg(state_id, real_side).delay_force then
            data.pending_delay = math.random(2, 7)
        else
            data.pending_delay = 0
        end
        data.exec_tick = globals.tickcount() + math.random(2, 4)
    end

    function antibrute.handle_brute(state_id)
        local data = get_state_data(state_id)
        local cur_time = globals.realtime()

        if data.pending_yaw ~= nil and globals.tickcount() >= data.exec_tick then
            data.add_yaw = data.pending_yaw
            data.delay_mod = data.pending_delay
            data.pending_yaw = nil 
  
            local slider_val = get_cfg(state_id, real_side).duration_brute
            
            if slider_val > 0 then
                data.reset_time = cur_time + (slider_val / 10)
            else
                data.reset_time = 0
            end
        end

        if data.reset_time > 0 and cur_time >= data.reset_time then
            data.add_yaw = 0
            data.delay_mod = 0
            data.reset_time = 0
            data.pending_yaw = nil
        end

        return data.add_yaw, data.delay_mod
    end

    client.set_event_callback("player_hurt", function(e)
        if client.userid_to_entindex(e.target_index) == entity.get_local_player() then
            antibrute.schedule_brute(id)
            last_hit_tick = globals.tickcount()
        end
    end)

    client.set_event_callback("bullet_impact", antibrute.trigger)

    client.set_event_callback("pizdec:pacan:enemy_shot", function(e)
        antibrute.schedule_brute(id)
    end)

    client.set_event_callback('round_start', function()
        brute_container = {}
    end)
end

local max_tickbase = 0

local defensive = {} do

    function defensive.on_createmove(lp)
        local tickbase = entity.get_prop(lp, 'm_nTickBase')

        if math.abs(tickbase - max_tickbase) > 64 then
            max_tickbase = 0
        end

        local defensive_ticks_left = 0

        if tickbase > max_tickbase then
            max_tickbase = tickbase
        elseif max_tickbase > tickbase then
            defensive_ticks_left = math.min(13, math.max(0, max_tickbase-tickbase-1))
        end
        return defensive_ticks_left
    end

    function defensive.is_defensive_active(lp)
        is_defensive = defensive.on_createmove(lp) > 0
        return is_defensive 
    end

    client.set_event_callback('level_init', function () max_tickbase = 0 end)

    client.set_event_callback('paint_ui', function ()
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then return end
        defensive.is_defensive_active(lp)
    end)
end

local antiaim = {} do

    local jump_t = 0
    local last_press_t_dir = 0

    function antiaim.state(cmd)
         local lp = entity.get_local_player()
        if lp == nil then return end
        local self_index = c_entity.new(lp)
        local vecvelocity = {entity.get_prop(lp, 'm_vecVelocity')}
        local ingr = motion.new('irggr', self_index:get_anim_state().on_ground == true and 1 or 0, 0.5)
        local hitingr = motion.new('htirg', self_index:get_anim_state().hit_in_ground_animation == true and 1 or 0, 0.5)
        if ingr < 1 and hitingr < 1 then
            jump_t = 1
        else
            jump_t = 0
        end
        local check_air = jump_t > 0
        local velocity = math.sqrt(vecvelocity[1] ^ 2 + vecvelocity[2] ^ 2)
        local jumpcheck = check_air
        local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7
        local duckcheck = ducked or ref.fakeduck:get()
        local freestand = menu.antiaim.yaw_direction:get('Freestanding') and menu.antiaim.freestanding_hotkey:get()
        local slowwalk_key = ref.other_slowmotion[1]:get() and ref.other_slowmotion[1]:get_hotkey()    

        if yaw_direction ~= 0 and builder[10].enabled:get() then
            return 'Manuals'
        elseif freestand and builder[9].enabled:get() then
            return 'Freestand'
        elseif jumpcheck then
            if duckcheck and builder[6].enabled:get() then
                return 'Aerobic+'
            end
            return 'Aerobic'
        elseif duckcheck then
            if velocity > 10 and builder[8].enabled:get() then
                return 'Crouch+'
            end
            return 'Crouch'
        elseif velocity > 10 then
            if velocity > 10 and slowwalk_key and builder[3].enabled:get() then
                return 'Walking'
            end
            return 'Moving'
        elseif velocity < 10 then
            return 'Standing'
        else
            return 'Global'
        end
    end

    function antiaim.direction()
        local lp = entity.get_local_player()
        if lp == nil then return end

        if menu.antiaim.yaw_direction:get('Freestanding') and menu.antiaim.freestanding_hotkey:get() then
            ref.freestand[1]:override(true)
            ref.freestand[1]:set_hotkey('Always on')
        else
            ref.freestand[1]:override(false)
            ref.freestand[1]:set_hotkey('On hotkey')
        end

        local self_index = c_entity.new(lp)
        local anim_state = self_index:get_anim_state()
        local ingr = motion.new('irggr', anim_state.on_ground == true and 1 or 0, 0.5)
        local hitingr = motion.new('htirg', anim_state.hit_in_ground_animation == true and 1 or 0, 0.5)
        
        local jumpcheck = (ingr < 1 and hitingr < 1)
        local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7
        local slowwalk_key = ref.other_slowmotion[1]:get() and ref.other_slowmotion[1]:get_hotkey()

        local fs_active = menu.antiaim.yaw_direction:get('Freestanding')
        if fs_active then
            local fs_disablers = menu.antiaim.freestanding_disablers
            if (fs_disablers:get("Walking") and slowwalk_key) or 
            (fs_disablers:get("Crouching") and ducked) or 
            (fs_disablers:get("Aerobic") and jumpcheck) or 
            (fs_disablers:get("Manuals") and yaw_direction ~= 0) then              
                ref.freestand[1]:override(false)
                ref.freestand[1]:set_hotkey('On hotkey')         
            end
        end

        menu.antiaim.manuals_right:set('On hotkey')
        menu.antiaim.manuals_left:set('On hotkey')
        menu.antiaim.manuals_forward:set('On hotkey')
        menu.antiaim.manuals_reset:set('On hotkey')


        local cur_time = globals.curtime()
        local can_press = last_press_t_dir + 0.2 < cur_time
        local manuals_enabled = menu.antiaim.yaw_direction:get('Manuals')

        if manuals_enabled and can_press then
            if menu.antiaim.manuals_right:get() then
                yaw_direction = yaw_direction == 90 and 0 or 90
                last_press_t_dir = cur_time
            elseif menu.antiaim.manuals_left:get() then
                yaw_direction = yaw_direction == -90 and 0 or -90
                last_press_t_dir = cur_time
            elseif menu.antiaim.manuals_forward:get() then
                yaw_direction = yaw_direction == 180 and 0 or 180
                last_press_t_dir = cur_time
            elseif menu.antiaim.manuals_reset:get() then
                yaw_direction = 0
                last_press_t_dir = cur_time
            end
        end

        local m_disablers = menu.antiaim.manuals_disablers
        if not manuals_enabled or 
        (m_disablers:get("Walking") and slowwalk_key) or 
        (m_disablers:get("Crouching") and ducked) or 
        (m_disablers:get("Aerobic") and jumpcheck) then
            yaw_direction = 0
        end
       

        if last_press_t_dir > globals.curtime() then
            last_press_t_dir = globals.curtime()
        end

        if menu.antiaim.yaw_direction:get("Edge Yaw") and menu.antiaim.edge_yaw:get() and yaw_direction == 0 then
            ref.edgeyaw:override(true)
        else
            ref.edgeyaw:override(false)
        end
    end

    function antiaim.is_vulnerable()
        for _, v in ipairs(entity.get_players(true)) do
            local flags = (entity.get_esp_data(v)).flags
            if bit.band(flags, bit.lshift(1, 11)) ~= 0 then
                return true
            end
        end
        return false
    end

    function antiaim.generate_slow_random(min, max, interval)
        local c_r = globals.realtime()

        if c_r - r_t >= interval then
            static_random_value = client.random_int(min * 1, max * 1)
            r_t = c_r
        end

        return static_random_value
    end

    function antiaim.spin(speed, iterations, initial_value)
        local spin_value = get_cfg(id, real_side).yaw_amount

        if spin_value == 0 then
            spin_value = 1
        end

        local start = (speed * 35 * globals.curtime()) % spin_value
        local iterations = iterations or 1
        local value = initial_value

        return start, iterations, value
    end

    function antiaim.spin_pitch(sl1, sl2, speed, iterations, initial_value)
        local slider1 = sl1
        local slider2 = sl2

        local progress = (globals.curtime() * speed / 15 ) % 1

        local start = slider1 + (slider2 - slider1) * progress

        local iterations = iterations or 1
        local value = initial_value

        return start, iterations, value
    end

    function antiaim.get_pitch_value(sl1, sl2, speed)
        local min_value = sl1
        local max_value = sl2

        local midpoint = (min_value + max_value) / 2
        local amplitude = (max_value - min_value) / 2
        return midpoint + math.sin(globals.curtime() * speed / 3) * amplitude
    end

    function antiaim.backstab()
        local me = entity.get_local_player()
        local enemy = client.current_threat()
        local stab = false
        if not enemy or entity.is_dormant(enemy) then
            stab = false
            return
        end
        local origin = { entity.get_origin(enemy) }
        local viewofs = { entity.get_prop(enemy, 'm_vecViewOffset') }
        local eyepos = { client.eye_position() }
        local ds = { origin[1] + viewofs[1], origin[2] + viewofs[2], origin[3] + viewofs[3] }
        local cnt = { math.abs(ds[1] - eyepos[1]), math.abs(ds[2] - eyepos[2]), math.abs(ds[3] - eyepos[3]) }
        local dst = math.abs(cnt[1] + cnt[2])
        if dst > menu.antiaim.avoid:get() then
            stab = false
            return
        end
        local vel = { entity.get_prop(me, 'm_vecVelocity') }
        local vele = { entity.get_prop(enemy, 'm_vecVelocity') }
        local interval = globals.tickinterval() * 16
        local cnd = { eyepos[1] + vel[1] * interval, eyepos[2] + vel[2] * interval, eyepos[3] + vel[3] * interval }
        local cndi = { ds[1] + vele[1] * interval, ds[2] + vele[2] * interval, ds[3] + vele[3] * interval }
        local v, n = client.trace_line(me, cnd[1], cnd[2], cnd[3], cndi[1], cndi[2], cndi[3])
        local k, m = client.trace_line(me, cndi[1], cndi[2], cndi[3], cnd[1], cnd[2], cnd[3])
        local c, s = client.trace_line(me, eyepos[1], eyepos[2], eyepos[3], ds[1], ds[2], ds[3])
        local p, t = client.trace_line(me, eyepos[1], eyepos[2], eyepos[3], origin[1], origin[2], origin[3])
        local oc = n == enemy or v == 1
        local po = m == me or k == 1
        local to = s == enemy or c == 1
        local vo = t == enemy or p == 1
        local zx = entity.get_player_weapon(enemy)

        stab = entity.get_classname(zx) == 'CKnife' and (oc or po or to or vo)
        return stab
    end

    local flip = {
        switch_delay = 0,
        last_flick = 0,
        current_side = false,
        current_way = 1
    }

    function antiaim.reset()
        flip.switch_delay = 0
        flip.last_flick = 0
        flip.current_side = false
        flip.current_way = 1
    end

    function antiaim.get_freestand_direction(p)
        antiaim.fs_data = antiaim.fs_data or {
            side = 1,
            last_side = 0,
            last_hit = 0,
            hit_side = 0
        }
        local data = antiaim.fs_data
        if not p or entity.get_prop(p, 'm_lifeState') ~= 0 then
            return
        end
        if data.hit_side ~= 0 and globals.curtime() - data.last_hit > 5 then
            data.last_side = 0
            data.last_hit = 0
            data.hit_side = 0
        end
        local eye = vector(client.eye_position())
        local ang = vector(client.camera_angles())
        local trace_data = {left = 0, right = 0}
        local left_count, right_count = 0, 0
        local max_distance = 264
        for i = ang.y - 120, ang.y + 120, 30 do
            if i ~= ang.y then
                local rad = math.rad(i)
                local px, py, pz = eye.x + max_distance * math.cos(rad), eye.y + max_distance * math.sin(rad), eye.z
                local fraction = client.trace_line(p, eye.x, eye.y, eye.z, px, py, pz)
                local side = i < ang.y and 'left' or 'right'
                trace_data[side] = trace_data[side] + fraction
                if side == 'left' then left_count = left_count + 1 else right_count = right_count + 1 end
            end
        end
        if left_count > 0 then trace_data.left = trace_data.left / left_count end
        if right_count > 0 then trace_data.right = trace_data.right / right_count end
        local new_side = trace_data.left < trace_data.right and -1 or 1
        local diff = math.abs(trace_data.left - trace_data.right)
        if new_side ~= data.last_side and diff > 0.07 then 
            data.side = new_side
        else
            data.side = data.last_side
        end
        if data.side == data.last_side then
            return data.last_side
        end
        data.last_side = data.side
        if data.hit_side ~= 0 then
            data.side = data.hit_side
        end
        if data.side == nil then
            data.side = 1
        end
        return data.side
    end

    local packets = 0
    local invert = false

    function antiaim.apply_variance(ticks, variance)
        variance = variance >= ticks and ticks-1 or variance
        return math.random(ticks - math.min(variance, ticks-1), ticks)
    end

    function antiaim.delay_check(cmd, d, a, hold_ticks, random_delay1, ways_count, variance)
        local cfg = get_cfg(id, real_side) 
        if cfg.bodyyaw == "Static" then return end
        
        local use_hold = has_value(cfg.delay_switch, "Hold ticks")
        local use_fluc = has_value(cfg.delay_switch, "Fluctuate")

        if globals.chokedcommands() == 0 then
            packets = packets + 1
        end

        local base_tick = a 
        if cfg.delay_method == 'Ways' and cfg.way_del then
            local idx = flip.current_way or 1
            base_tick = cfg.way_del[idx] or a 
        end

        local final_tick
        local is_fast_phase = use_hold and (globals.tickcount() % 50 > (hold_ticks or 0) * 4)

        if is_fast_phase then
            final_tick = 1 
        else
            if random_delay1 and random_delay1 > 0 then
                local min_v = math.min(base_tick, random_delay1)
                local max_v = math.max(base_tick, random_delay1)
                base_tick = math.random(min_v, max_v) / 2
            end

            if use_fluc and variance and variance > 0 then
                base_tick = antiaim.apply_variance(base_tick, variance)
            end
            
            final_tick = base_tick
        end

        if packets % math.max(1, math.floor(final_tick)) == 0 and globals.chokedcommands() == 0 then
            invert = not invert
            packets = 0

            local ways_limit = 1
            if cfg.delay_method == "Ways" then
                ways_limit = ways_count or 1 
            else
                ways_limit = cfg.xway_slider or 1
            end

            flip.current_way = (flip.current_way or 1) + 1

            if flip.current_way > math.max(1, ways_limit) then
                flip.current_way = 1
            end
        end
    end

    function antiaim.xway(cmd)
        local ctx = get_cfg(id, real_side )
        if ctx.yaw_jitter == "X-Way" then
            local ways_count = ctx.xway_slider
            if ways_count <= 0 then return 0 end

            local way_index = flip.current_way or 1
            
            if way_index > ways_count then 
                way_index = 1 
            end

            local spread = ctx.xway_jitter
    
            if ways_count > 1 then
                local total_range = spread * 2
                local step_size = total_range / (ways_count - 1)
                
                return -spread + (step_size * (way_index - 1))
            else
                return 0 
            end
        end
        return 0
    end

    local ways_data = {}
    for i = 1, 10 do
        ways_data[i] = { idx1 = 1, idx2 = 1, last_t1 = 0, last_t2 = 0 }
    end

    function antiaim.xway_lr()
        local ctx = get_cfg(id, real_side)
        local data = ways_data[id] 

        local final_offset_left = 0
        if ctx.ofs_tp_1== "Way" then
            local ways_limit_1 = ctx.ofs_way_1
            local delay_1 = ctx.ofs_ways_delay_1

            if globals.tickcount() % delay_1 == 1 and globals.tickcount() ~= data.last_t1 then
                data.idx1 = data.idx1 + 1
                if data.idx1 > ways_limit_1 then data.idx1 = 1 end
                data.last_t1 = globals.tickcount()
            end

            if ctx.ofs_ways_1[data.idx1] then
                final_offset_left = ctx.ofs_ways_1[data.idx1]
            end
        else
            final_offset_left = ctx.ofs_1
        end

        local final_offset_right = 0
        if ctx.ofs_tp_2== "Way" then
            local ways_limit_2 = ctx.ofs_way_2
            local delay_2 = ctx.ofs_ways_delay_2

            if globals.tickcount() % delay_2 == 1 and globals.tickcount() ~= data.last_t2 then
                data.idx2 = data.idx2 + 1
                if data.idx2 > ways_limit_2 then data.idx2 = 1 end
                data.last_t2 = globals.tickcount()
            end

            if ctx.ofs_ways_2[data.idx2] then
                final_offset_right = ctx.ofs_ways_2[data.idx2]
            end
        else
            final_offset_right = ctx.ofs_2
        end

        return final_offset_left, final_offset_right, data.side_state
    end

    menu.antiaim.fakeenabled:override(ref.fakeenabled[1]:get())
    menu.antiaim.fake_amount:override(ref.amount[1]:get())
    menu.antiaim.fake_variance:override(ref.variance[1]:get())
    menu.antiaim.fake_limit:override(ref.limit[1]:get())

    local sf_head = false

    local hsValue = 0
    local hsSaved = false

    local yaw_amount = 0

    local dele1, dele2, dele3, to_jitter = false, false, false, false

    local to_defensive, first_execution = true, true

    function antiaim.is_enemies_dead()
        if not menu.antiaim.features:get("Warmup AA/No Enemies") then
          return
        end
  
        local alive = 0
        for i = 1, globals.maxplayers() do
          if entity.get_classname(i) == 'CCSPlayer' and entity.is_alive(i) and entity.is_enemy(i) then
            alive = alive + 1
          end
        end

        return alive
    end

    function antiaim.setup(cmd)
        local lp = entity.get_local_player()
        if lp == nil or not entity.is_alive(lp) then return end

        team_num = entity.get_prop(lp, 'm_iTeamNum')
        real_side = (team_num == 3) and "CT" or "T"

        if not ui.is_menu_open() then
            menu.antiaim.side_switch:set(real_side)
        end

        if antiaim.state() == "Manuals" and get_cfg(10, real_side).enabled then
            id = 10
        elseif antiaim.state() == "Freestand" and get_cfg(9, real_side).enabled then
            id = 9
        elseif antiaim.state() == "Crouch+" and get_cfg(8, real_side).enabled then
            id = 8
        elseif antiaim.state() == "Crouch" and get_cfg(7, real_side).enabled then
            id = 7
        elseif antiaim.state() == "Aerobic+" and get_cfg(6, real_side).enabled then
            id = 6
        elseif antiaim.state() == "Aerobic" and get_cfg(5, real_side).enabled then
            id = 5
        elseif antiaim.state() == "Moving" and get_cfg(4, real_side).enabled then
            id = 4
        elseif antiaim.state() == "Walking" and get_cfg(3, real_side).enabled then
            id = 3
        elseif antiaim.state() == "Standing" and get_cfg(2, real_side).enabled then
            id = 2
        else
            id = 1
        end  

        local cfg = get_cfg(id, real_side)
        if not cfg then return end

        ref.enabled:override(true)
        ref.fakeenabled[1]:set_hotkey("Always on")
        ref.fakeenabled[1]:override(menu.antiaim.fakeenabled:get())
        ref.amount[1]:override(menu.antiaim.fake_amount:get())
        ref.variance[1]:override(menu.antiaim.fake_variance:get())
        ref.limit[1]:override(menu.antiaim.fake_limit:get())

        local defensive = defensive.is_defensive_active(lp)
        if (globals.tickcount() % (cfg.def_jitter_speed or 2)) == 1 then
            dele1 = not dele1
        end

        if (globals.tickcount() % (cfg.pitch_jitter_speed or 2)) == 1 then
            dele2 = not dele2
        end

        if (globals.tickcount() % menu.antiaim.pitch_jitter_speed_fl:get()) == 1 then
            dele3 = not dele3
        end

        local delay_method = cfg.delay_method
        local delay_time = cfg.delay
        local random_delay1 = cfg.random_delay
        local ways_count = cfg.ways
        local delay_fluc = cfg.delay_fluc
        local way_slider = cfg.way_del and cfg.way_del[flip.current_way]
        local b_yaw, b_delay = antibrute.handle_brute(id)

        flip.switch_delay = globals.tickcount()

        local fk_checker = ref.dt[1]:get() and ref.dt[1]:get_hotkey() or ref.os[1]:get() and ref.os[1]:get_hotkey()

        if defensive and (cfg.def_en and has_value(cfg.adaptive_desync, 'Delay Off') or menu.antiaim.fl_hot:get()) then
            delay_time = 1
            random_delay1 = 0
            delay_fluc = 1
        end

        if not fk_checker and has_value(cfg.delay_switch, 'Disable on Fakelags') then
            delay_time = 1
            random_delay1 = 0
            delay_fluc = 1
        end

        if delay_method == 'Default' then
            if cmd.chokedcommands == 0 then
                if has_value(cfg.delay_switch, 'Fluctuate') then
                    antiaim.delay_check(cmd, "Fluctuate", delay_time + b_delay, cfg.hold_ticks, random_delay1, ways_count, delay_fluc)
                else
                    antiaim.delay_check(cmd, "Default", delay_time + b_delay, cfg.hold_ticks, random_delay1, ways_count, delay_fluc)
                end
                to_jitter = invert
            end
        elseif delay_method == 'Ways' then
            if cfg.way_del and type(cfg.way_del) == "table" then
                antiaim.delay_check(
                    cmd, 
                    "Ways", 
                    1, 
                    cfg.hold_ticks or 0, 
                    random_delay1 or 0, 
                    cfg.ways or 3, 
                    delay_fluc or 1
                )
                to_jitter = invert
            end
        end

        if antiaim.is_vulnerable() then
            if first_execution then
                first_execution = false
                to_defensive = true
            end
            if max_tickbase > 6 then
                to_defensive = false
            end
        else
            first_execution = true
            to_defensive = false
        end

        if not first_execution and get_cfg(9).def_en or get_cfg(9).def_en and get_cfg(9).force_lc then
            ref.freestand[1]:override(false)
            ref.freestand[1]:set_hotkey('On hotkey')
        end

        ref.fsbodyyaw:override(false)
        if yaw_direction ~= 0 then
            ref.yawbase:override("Local view")
        else
            ref.yawbase:override("At targets")
        end
        ref.yaw[1]:override("180")
        local type = cfg.yaw_mode

        local left_yaw, right_yaw = antiaim.xway_lr()

        local offset_v = {
            l = left_yaw or 0,
            r = right_yaw or 0
        }

        local ranv = {
            rn = cfg.rana or 0,
            rn2 =cfg.rana2 or 0
        }

        local spinv = {
            sp = cfg.spna or 0,
            sp2 = cfg.spna2 or 0,
            speed = cfg.spna_speed or 0,
            speed2 = cfg.spna_speed2 or 0
        }

        local amount_add = 0
    
        local rana_add = 0
        local spining = 0
        local offset = cfg.offset or 0
       
        amount_add = offset + (to_jitter and offset_v.l or offset_v.r)
      
        if has_value(cfg.yaw_mode, 'Random') then
            if cfg.rana_switch then
                rana_add = math.random(to_jitter and -ranv.rn or ranv.rn2) * 0.5
            else
                rana_add = math.random(to_jitter and -ranv.rn or ranv.rn) * 0.5
            end
        end

        if has_value(cfg.yaw_mode, 'Spin') then
            if cfg.spna_switch then
                spining = to_jitter and lerping(-spinv.sp, 0, globals.curtime() * spinv.speed / 10 % 2 - 1) * 0.5
                            or lerping(spinv.sp2, 0, globals.curtime() * spinv.speed2 / 10 % 2 - 1) * 0.5
            else
                spining = to_jitter and lerping(-spinv.sp, 0, globals.curtime() * spinv.speed / 10 % 2 - 1) * 0.5
                            or lerping(spinv.sp, 0, globals.curtime() * spinv.speed / 10 % 2 - 1) * 0.5
            end                      
        end
        
        local yawjitter = cfg.yawjitter

        local body_type = cfg.body_type

        local vecvelocity = {entity.get_prop(lp, 'm_vecVelocity')}
        local speed = math.sqrt(vecvelocity[1] ^ 2 + vecvelocity[2] ^ 2)

        local bd_left, bd_right 
        
        if cfg.bd_type == 'Gamesense' then
            bd_left = -cfg.body_static
            bd_right = cfg.body_static
        else
            bd_left = cfg.body_left
            bd_right = cfg.body_right
        end

        if body_type == "Default" then
            body_value = to_jitter and bd_left or bd_right
        elseif body_type == "Spin" then
            body_value = to_jitter and math.abs(math.sin(globals.curtime() * 5)) * bd_left or math.abs(math.sin(globals.curtime() * 5)) * bd_right
        elseif body_type == "Fluctuate" then
            local fluc = 0.5 + 0.5 * math.sin(cmd.command_number * 0.1)
            body_value = to_jitter and bd_left * fluc or bd_right * fluc
        elseif body_type == "Random" then
            body_value = to_jitter and math.random(bd_left, 0) or math.random(0, bd_right)
        elseif body_type == "Dynamic" then
            local factor = math.min(speed / 300, 1)
            body_value = to_jitter and bd_left * (1 - factor) or bd_right * (1 - factor)
        end

        if cfg.bodyyaw == "Jitter" then
            ref.bodyyaw[1]:override("Static")
            ref.bodyyaw[2]:override(body_value)
        else
            ref.bodyyaw[1]:override(cfg.bodyyaw)
            ref.bodyyaw[2]:override(body_value)
        end
      
        if not (cfg.bodyyaw == "Static" or cfg.bodyyaw == "Off") then
            ref.yawjitter[1]:override('Off')
            if cfg.yaw_jitter == "Center" then
                amount_add = offset + (to_jitter and offset_v.l + yawjitter or offset_v.r - yawjitter)
            elseif cfg.yaw_jitter == "Offset" then
                amount_add = offset + (to_jitter and offset_v.l or offset_v.r - yawjitter)
            elseif cfg.yaw_jitter == "Random" then           
                amount_add = offset + (to_jitter and math.random(offset_v.l + yawjitter + (10 % (offset_v.l + yawjitter)), offset_v.l + yawjitter - (10 % (offset_v.l + yawjitter))) or math.random(offset_v.r - yawjitter + (10 % (offset_v.r - yawjitter)), offset_v.r - yawjitter - (10 % (offset_v.r - yawjitter)))) + rana_add    
            elseif cfg.yaw_jitter == "Skitter" then
                local skitter_wave = math.sin(cmd.command_number * 0.5)
                local jitter_offset = skitter_wave * yawjitter
                if to_jitter then
                    amount_add = offset + offset_v.l + jitter_offset
                else
                    amount_add = offset + offset_v.r + jitter_offset
                end
            elseif cfg.yaw_jitter == "X-Way" then
                if to_jitter then
                    amount_add = offset_v.l + antiaim.xway(cmd) + offset 
                else
                    amount_add = offset_v.r - antiaim.xway(cmd) + offset 
                end
            end
        else
            if cfg.yaw_jitter == "X-Way" then
                ref.yawjitter[1]:override("Center") 
                ref.yawjitter[2]:override(antiaim.xway(cmd))
            else
                ref.yawjitter[1]:override(cfg.yaw_jitter) 
                ref.yawjitter[2]:override(cfg.yawjitter) 
            end
        end

        amount_add = amount_add or 0
        yaw_amount = amount_add + rana_add + spining + b_yaw 
      
        local pitch = 0

        if defensive and yaw_direction == 0 then
            if cfg.def_en and not menu.antiaim.fl_hot:get() then
                if cfg.def_en then
                    ref.pitch[1]:override("Custom")
                    if cfg.pitch_type == "Static" then
                        pitch = cfg.pitch_static
                    elseif cfg.pitch_type == "Jitter" then 
                        pitch = dele2 and cfg.pitch_mode1 or cfg.pitch_mode2
                    elseif cfg.pitch_type == "Random" then
                        pitch = client.random_int(cfg.pitch_mode1, cfg.pitch_mode2)
                    elseif cfg.pitch_type == "Random Static" then
                        pitch = antiaim.generate_slow_random(cfg.pitch_mode1, cfg.pitch_mode2, cfg.pitch_slow_def / 10)
                    elseif cfg.pitch_type == "Spin" then
                        pitch = antiaim.spin_pitch(cfg.pitch_mode1, cfg.pitch_mode2, cfg.pitch_speed, 1)
                    elseif cfg.pitch_type == "Spin[MOD]" then
                        pitch = antiaim.get_pitch_value(cfg.pitch_mode1, cfg.pitch_mode2, cfg.pitch_speed)
                    elseif cfg.pitch_type == "Random Ticks" then
                        if globals.tickcount() % 3 == 0 then
                            pitch = 89
                        elseif globals.tickcount() % 3 == 1 then
                            pitch = 0
                        elseif globals.tickcount() % 3 == 2 then
                            pitch = -89
                        end
                    end
                end
            else
                if menu.antiaim.fl_hot:get() then
                    ref.pitch[1]:override("Custom")
                    if menu.antiaim.pitch_type_fl:get() == "Static" then
                        pitch = menu.antiaim.pitch_static_fl:get()
                    elseif menu.antiaim.pitch_type_fl:get() == "Jitter" then 
                        pitch = dele3 and menu.antiaim.pitch_mode1_fl:get() or menu.antiaim.pitch_mode2_fl:get()
                    elseif menu.antiaim.pitch_type_fl:get() == "Random" then
                        pitch = client.random_int(menu.antiaim.pitch_mode1_fl:get(), menu.antiaim.pitch_mode2_fl:get())
                    elseif menu.antiaim.pitch_type_fl:get() == "Random Static" then
                        pitch = antiaim.generate_slow_random(menu.antiaim.pitch_mode1_fl:get(), menu.antiaim.pitch_mode2_fl:get(), menu.antiaim.pitch_slow_def_fl:get() / 10)
                    elseif menu.antiaim.pitch_type_fl:get() == "Spin" then
                        pitch = antiaim.spin_pitch(menu.antiaim.pitch_mode1_fl:get(), menu.antiaim.pitch_mode2_fl:get(), menu.antiaim.pitch_speed_fl:get(), 1)
                    elseif menu.antiaim.pitch_type_fl:get() == "Spin[MOD]" then
                        pitch = antiaim.get_pitch_value(menu.antiaim.pitch_mode1_fl:get(), menu.antiaim.pitch_mode2_fl:get(), menu.antiaim.pitch_speed_fl:get())
                    elseif menu.antiaim.pitch_type_fl:get() == "Random Ticks" then
                        if globals.tickcount() % 3 == 0 then
                            pitch = 89
                        elseif globals.tickcount() % 3 == 1 then
                            pitch = 0
                        elseif globals.tickcount() % 3 == 2 then
                            pitch = -89
                        end
                    end
                end
            end
          
            ref.pitch[2]:override(pitch)
        else
            ref.pitch[1]:override("Default")
        end

        if defensive and cfg.def_en and yaw_direction == 0 then
            if has_value(cfg.adaptive_desync, 'Adaptive Desync') then
                ref.bodyyaw[1]:override("Off")
            end
            if cfg.yaw_def == "Static" then
                yaw_amount = cfg.yaw_amount 
            elseif cfg.yaw_def == "Static[FS]" then
                yaw_amount = cfg.yaw_amount * antiaim.get_freestand_direction(lp)
            elseif cfg.yaw_def == "Jitter" then
                yaw_amount = dele1 and cfg.yaw_amount * 0.5 or -cfg.yaw_amount * 0.5
            elseif cfg.yaw_def == "Jitter[L/R]" then
                yaw_amount = dele1 and cfg.yaw_left or cfg.yaw_right
            elseif cfg.yaw_def == "Spin" then
                local spin = antiaim.spin(-cfg.def_spin_speed, 1)
                yaw_amount = antiaim_func.normalize_angle(spin)
            elseif cfg.yaw_def == "Random" then
                yaw_amount = client.random_int(-cfg.yaw_amount * 0.5, cfg.yaw_amount * 0.5)
            elseif cfg.yaw_def == "3-way" then
                yaw_amount = globals.tickcount() % 3 == 0 and client.random_int(-110, -90) or globals.tickcount() % 3 == 1 and client.random_int(90, 120) or globals.tickcount() % 3 == 2 and client.random_int(-180, -150) or 0
            elseif cfg.yaw_def == "5-way" then
                yaw_amount = globals.tickcount() % 5 == 0 and client.random_int(-90, -75) or globals.tickcount() % 5 == 1 and client.random_int(-45, -30) or globals.tickcount() % 5 == 2 and client.random_int(-180, -160) or globals.tickcount() % 5 == 3 and client.random_int(45, 60) or globals.tickcount() % 5 == 3 and client.random_int(90, 110) or 0
            end
        end

        if to_defensive and cfg.def_en then
            cmd.force_defensive = cmd.command_number % 7 == 0
        elseif menu.antiaim.safe_head:get() == "Defensive" and sf_head then
            cmd.force_defensive = sf_head and cmd.command_number % 7 == 0
        elseif menu.antiaim.fl_hot:get() then
            cmd.force_defensive = cmd.command_number % 7 == 0
        elseif cfg.force_lc then
            cmd.force_defensive = cmd.command_number % 7 == 0
        else
            cmd.force_defensive = false
        end
        
        local ref_yaw = yaw_direction == 0 and antiaim_func.normalize_angle(yaw_amount) or antiaim_func.normalize_angle(antiaim_func.normalize_angle(yaw_direction) + antiaim_func.normalize_angle(yaw_amount)) 

        ref.yaw[2]:override(ref_yaw)

        if defensive and yaw_direction == 0 then
            if menu.antiaim.fl_hot:get() then
                local delay = nil
                local offset = 90

                if defensive then
                    if max_tickbase <= 2 then
                        delay = nil
                    elseif max_tickbase > 2 then
                        if not delay then
                            delay = client.random_int(1, 50)
                        end
                    end
                   
                    ref.yaw[1]:override('180')
                    ref.yaw[2]:override(clamp(offset * antiaim.get_freestand_direction(lp), -180, 180))
                    ref.bodyyaw[1]:override("Static")
                    ref.bodyyaw[2]:override(1)
                    ref.fsbodyyaw:override(false)
                else
                    delay = nil
                end
            end
        end

        local lp_weapon = entity.get_player_weapon(lp)
        local lp_orig = {entity.get_origin(lp)}
        local flags = entity.get_prop(lp, 'm_fFlags')
        local jumpcheck = bit.band(flags, 1) == 0 or cmd.in_jump == 1
        local ducked = entity.get_prop(lp, 'm_flDuckAmount') > 0.7

        local high_state = {
            ["Crouch+"] = menu.antiaim.high_distance_options:get("Crouch+"),
            ["Crouch"] = menu.antiaim.high_distance_options:get("Crouch"),
            ["Aerobic+"] = menu.antiaim.high_distance_options:get("Aerobic+"),
            ["Aerobic"] = menu.antiaim.high_distance_options:get("Aerobic"),
            ["Walking"] = menu.antiaim.high_distance_options:get("Walking"),
            ["Moving"] = menu.antiaim.high_distance_options:get("Running"),
            ["Standing"] = menu.antiaim.high_distance_options:get("Standing"),
            ["Freestanding"] = menu.antiaim.high_distance_options:get("Freestanding"),
            ["Manuals"] = menu.antiaim.high_distance_options:get("Manuals")
        }

        local opt_high_en = false

        opt_high_en = high_state[antiaim.state()]

        if menu.antiaim.features:get('Safe head') and yaw_direction == 0 then
            sf_head = false
            if lp_weapon ~= nil then
                if menu.antiaim.safe:get('Knife on Air + Duck') then
                    if jumpcheck and ducked and entity.get_classname(lp_weapon) == 'CKnife' then
                        if menu.antiaim.safe_head:get() == "Offensive" then
                            ref.pitch[1]:override('Down')
                            ref.yawjitter[1]:override('Off')
                            ref.yaw[1]:override('180')
                            ref.yaw[2]:override(14)
                            ref.bodyyaw[1]:override('Static')
                            ref.bodyyaw[2]:override(0)
                        else
                            sf_head = true
                            ref.pitch[1]:override(defensive and 'Custom' or 'Down')
                            ref.pitch[2]:override(0)
                            ref.yaw[2]:override(defensive and 180 or 0)
                            ref.bodyyaw[1]:override(defensive and 'Static' or 'Off')
                            ref.bodyyaw[2]:override(1)
                        end
                    end
                end
                if menu.antiaim.safe:get('Taser on Air + Duck') then
                    if jumpcheck and ducked and entity.get_classname(lp_weapon) == 'CWeaponTaser' then
                        if menu.antiaim.safe_head:get() == "Offensive" then
                            ref.pitch[1]:override('Down')
                            ref.yawjitter[1]:override('Off')
                            ref.yaw[1]:override('180')
                            ref.yaw[2]:override(14)
                            ref.bodyyaw[1]:override('Static')
                            ref.bodyyaw[2]:override(0)
                        else
                            sf_head = true
                            ref.pitch[1]:override(defensive and 'Custom' or 'Down')
                            ref.pitch[2]:override(0)
                            ref.yaw[2]:override(defensive and 180 or 0)
                            ref.bodyyaw[1]:override(defensive and 'Static' or 'Off')
                            ref.bodyyaw[2]:override(1)
                        end
                    end
                end
                if menu.antiaim.safe:get('High distance') then
                    local enemy = client.current_threat()
                    if enemy and not entity.is_dormant(enemy) then
                        local oren = { entity.get_origin(enemy) }
                        if opt_high_en then
                            if oren[3] < lp_orig[3] - 40 and (vector(entity.get_prop(me, 'm_vecVelocity')):length2d() <= 60) then
                                if menu.antiaim.safe_head:get() == "Offensive" then
                                    ref.pitch[1]:override('Down')
                                    ref.yawjitter[1]:override('Off')
                                    ref.yaw[1]:override('180')
                                    ref.yaw[2]:override(15)
                                    ref.bodyyaw[1]:override('Static')
                                    ref.bodyyaw[2]:override(0)
                                else
                                    sf_head = true
                                    ref.pitch[1]:override(defensive and 'Custom' or 'Down')
                                    ref.pitch[2]:override(0)
                                    ref.yaw[2]:override(defensive and 180 or 0)
                                    ref.bodyyaw[1]:override(defensive and 'Static' or 'Off')
                                    ref.bodyyaw[2]:override(1)
                                end
                            end
                        end
                    end
                end
            end
        end

        if menu.antiaim.features:get('Avoid Backstab') then
            if antiaim.backstab() then
                ref.yaw[2]:override(180)
                ref.yawbase:override('At targets')
            end
        end

        if menu.antiaim.features:get("E-Bomb Fix") then
            if entity.get_prop(lp, 'm_iTeamNum') == 2 then
                if entity.get_prop(lp, 'm_bInBombZone') > 0 then
                    if bit.band(cmd.buttons, 32) == 32 and entity.get_classname(lp_weapon) ~= 'CC4' then
                        cmd.buttons = bit.band(cmd.buttons, bit.bnot(32))
                        ref.yawbase:override('Local View')
                        ref.pitch[1]:override('Custom')
                        ref.pitch[2]:override(0)
                        ref.yaw[1]:override('180')
                        ref.yaw[2]:override(180)
                        ref.yawjitter[1]:override('Off')
                        ref.yawjitter[2]:override(0)
                        ref.bodyyaw[1]:override('Static')
                        ref.bodyyaw[2]:override(1)
                    end
                end
            end
        end

        if menu.antiaim.features:get("Warmup AA/No Enemies") then
            if entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1 or antiaim.is_enemies_dead() == 0 then
                ref.fakeenabled[1]:override(false)
                ref.yaw[1]:override("Spin")
                ref.yaw[2]:override(55)
                ref.yawjitter[1]:override("Off")
                ref.yawjitter[2]:override(0)
                ref.bodyyaw[1]:override("Static")
                ref.bodyyaw[2]:override(1)
                ref.pitch[1]:override("Custom")
                ref.pitch[2]:override (0)
            end
        end
    end

    client.set_event_callback("setup_command", antiaim.setup)
    client.set_event_callback("round_start", antiaim.reset)
    client.set_event_callback("game_newmap", antiaim.reset)
    client.set_event_callback("client_disconnect", antiaim.reset)
    client.set_event_callback('pre_render', antiaim.direction)
end

local autostop = {} do

    local enabled = false
    local callbacks_initialized = false

    local set = {
        peekable_flag = bit.lshift(1, 11),
        peek_hitboxes = {0, 3, 4},
        last_aim_fire_time = -10,
        aimed_enemy_start_time = -1,
        HELPER_COMBAT_FOV = 18,
        HELPER_ENGAGE_FOV = 34,
        THREAT_PRESSURE_FOV = 64,
        THREAT_PRESSURE_MAX_DIST = 1200,
        HELPER_SOFT_SLOW_FACTOR = 0.987,
        HELPER_SOFT_SLOW_MIN = 0.945,
        HELPER_STOP_FORCE = 650,
        HELPER_PISTOL_STOP_FORCE = 860,
        HELPER_PISTOL_STOP_FORCE_FAST = 960,
        HELPER_SAFE_PERCENT = 0.16,
        SHOOT_SOON_TICKS = 3.35,
        PISTOL_SHOOT_SOON_TICKS = 11.50,
        PRE_ENGAGE_EXTRA_TICKS = 1.05,
        PRE_STOP_MARGIN = 4,
        RECENT_SHOT_WINDOW = 0.22,
        HELPER_POST_SHOT_ESCAPE_TIME = 0.20,
        AIM_LOCK_FAST_TIME = 0.13,
        AIM_LOCK_SLOW_TIME = 0.055,
        OPEN_WALK_SOFT_FACTOR_HELPER = 0.992,
        AIR_STOP_BLOCK_TIME = 0.10,
        PEEK_MEMORY_TIME = 0.12,
        MAX_PRESTOP_HOLD = 0.22,
        HELPER_FALLBACK_EARLY = true,
        HELPER_FALLBACK_MOVE_BETWEEN = true,
        HELPER_FALLBACK_SLOW_MOTION = true,
        air_stop_block_until = 0,
        last_enemy_peek_time = -10,
        pre_stop_hold_start = -1,
        spawn_grace_until = 0,
        was_alive = false,
    }

    function autostop.get_autostop_mode()
        local mode = (menu.ragebot.autostop and menu.ragebot.autostop:get()) or "Helper"
        if mode == "Off" then
            return "Off"
        end
        return "Helper"
    end

    function autostop.is_multiselect_ref(ref_item)
        return ref_item and ref_item.get and ref_item.get_type and ref_item:get_type() == "multiselect"
    end

    local mode_aliases = {
        ["Early"] = {"early"},
        ["Move between shots"] = {"movebetweenshots", "betweenshots"},
        ["Slow motion"] = {"slowmotion"},
        ["Ignore molotov"] = {"ignoremolotov", "ingnoremolotov"},
        ["Ingnore molotov"] = {"ignoremolotov", "ingnoremolotov"},
        ["Jump scout"] = {"jumpscout"},
    }

    function autostop.normalize_mode_name(name)
        if type(name) ~= "string" then
            return ""
        end

        return string.lower((name:gsub("[^%a]", "")))
    end

    function autostop.get_mode_aliases(name)
        local aliases = mode_aliases[name]
        if aliases ~= nil then
            return aliases
        end

        local normalized = autostop.normalize_mode_name(name)
        if normalized == "" then
            return nil
        end

        return {normalized}
    end

    function autostop.mode_name_matches(candidate_name, expected_name)
        local normalized_candidate = autostop.normalize_mode_name(candidate_name)
        if normalized_candidate == "" then
            return false
        end

        local aliases = autostop.get_mode_aliases(expected_name)
        if aliases == nil then
            return false
        end

        for i = 1, #aliases do
            local alias = aliases[i]
            if normalized_candidate == alias or string.find(normalized_candidate, alias, 1, true) ~= nil then
                return true
            end
        end

        return false
    end

    function autostop.find_multiselect_ref(ref_item)
        if autostop.is_multiselect_ref(ref_item) then
            return ref_item
        end

        if type(ref_item) ~= "table" then
            return nil
        end

        for _, nested_ref in pairs(ref_item) do
            if autostop.is_multiselect_ref(nested_ref) then
                return nested_ref
            end
        end

        return nil
    end

    function autostop.ref_get_safe(ref_item, ...)
        if ref_item == nil or ref_item.get == nil then
            return false, nil
        end

        return pcall(ref_item.get, ref_item, ...)
    end

    function autostop.multiselect_has_value(ref_item, name)
        local multiselect_ref = autostop.find_multiselect_ref(ref_item)
        if multiselect_ref == nil then
            return false
        end

        local ok_by_name, selected_by_name = autostop.ref_get_safe(multiselect_ref, name)
        if ok_by_name and type(selected_by_name) == "boolean" then
            return selected_by_name
        end

        local ok_values, values = autostop.ref_get_safe(multiselect_ref)
        if not ok_values or type(values) ~= "table" then
            return false
        end

        for key, value in pairs(values) do
            if type(key) == "string" and value == true and autostop.mode_name_matches(key, name) then
                return true
            end

            if type(value) == "string" and autostop.mode_name_matches(value, name) then
                return true
            end
        end

        return false
    end

    function autostop.multiselect_count(ref_item)
        local multiselect_ref = autostop.find_multiselect_ref(ref_item)
        if multiselect_ref == nil then
            return 0
        end

        local ok, value = autostop.ref_get_safe(multiselect_ref)
        if not ok or type(value) ~= "table" then
            return 0
        end

        local count = 0
        for _, entry in pairs(value) do
            if type(entry) == "boolean" then
                if entry == true then
                    count = count + 1
                end
            else
                count = count + 1
            end
        end

        return count
    end

    function autostop.has_any_qs_modes()
        return autostop.multiselect_count(ref.qs_ref) > 0 or autostop.multiselect_count(ref.dt_qs_ref) > 0
    end

    function autostop.mode_enabled(name)
        return autostop.multiselect_has_value(ref.qs_ref, name) or autostop.multiselect_has_value(ref.dt_qs_ref, name)
    end

    function autostop.get_helper_mode_flags()
        local has_any_modes = autostop.has_any_qs_modes()
        local early_enabled = autostop.mode_enabled("Early")
        local move_between_enabled = autostop.mode_enabled("Move between shots")
        local slow_motion_enabled = autostop.mode_enabled("Slow motion")

        if not has_any_modes then
            early_enabled = set.HELPER_FALLBACK_EARLY
            move_between_enabled = set.HELPER_FALLBACK_MOVE_BETWEEN
            slow_motion_enabled = set.HELPER_FALLBACK_SLOW_MOTION
        end

        return has_any_modes, early_enabled, move_between_enabled, slow_motion_enabled
    end

    local weapon_info_cache = {ent = nil, obj = nil}
    function autostop.get_weapon_info_fast(weapon_ent)
        if c_entity == nil or weapon_ent == nil then
            return nil
        end

        local weapon_obj = weapon_info_cache.obj
        if weapon_info_cache.ent ~= weapon_ent or weapon_obj == nil or type(weapon_obj.get_weapon_info) ~= "function" then
            if type(c_entity.new) == "function" then
                weapon_obj = c_entity.new(weapon_ent)
            elseif type(c_entity) == "function" then
                weapon_obj = c_entity(weapon_ent)
            else
                weapon_obj = nil
            end

            weapon_info_cache.ent = weapon_ent
            weapon_info_cache.obj = weapon_obj
        end

        if weapon_obj == nil or type(weapon_obj.get_weapon_info) ~= "function" then
            return nil
        end

        local ok, wpn_info = pcall(weapon_obj.get_weapon_info, weapon_obj)
        if not ok then
            weapon_info_cache.ent = nil
            weapon_info_cache.obj = nil
            return nil
        end

        return wpn_info
    end

    function autostop.get_weapon_max_speed(local_player, weapon_ent, wpn_info)
        if wpn_info ~= nil then
            local is_scoped = entity.get_prop(local_player, "m_bIsScoped") == 1
            local raw_speed = is_scoped and wpn_info.flMaxSpeedAlt or wpn_info.flMaxSpeed
            if raw_speed ~= nil and raw_speed > 0 then
                return raw_speed
            end
        end

        if csgo_weapons == nil then
            return 250
        end

        local item_def = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
        if not item_def then
            return 250
        end

        local w_id = bit.band(item_def, 0xFFFF)
        local w_data = csgo_weapons[w_id]
        if not w_data or not w_data.max_speed then
            return 250
        end

        if entity.get_prop(local_player, "m_bIsScoped") == 1 and w_data.max_speed_alt then
            return w_data.max_speed_alt
        end

        return w_data.max_speed
    end

    function autostop.get_stop_speed_limits(local_player, weapon_ent, max_speed)
        local class_name = entity.get_classname(weapon_ent) or ""
        local is_scoped = entity.get_prop(local_player, "m_bIsScoped") == 1
        local duck_amount = entity.get_prop(local_player, "m_flDuckAmount") or 0
        local velocity_modifier = entity.get_prop(local_player, "m_flVelocityModifier") or 1

        local is_sniper =
            class_name == "CWeaponSSG08" or
            class_name == "CWeaponAWP" or
            class_name == "CWeaponSCAR20" or
            class_name == "CWeaponG3SG1"

        local ratio = 0.26
        if is_sniper then
            ratio = is_scoped and 0.20 or 0.10
        end

        if duck_amount > 0.7 then
            ratio = ratio + 0.02
        end

        ratio = ratio * math.max(0.80, math.min(1.0, velocity_modifier))
        local entry_limit = math.max(6, math.floor(max_speed * ratio))
        local shoot_limit = math.max(4, entry_limit - 8)
        return entry_limit, shoot_limit
    end

    function autostop.limit_cmd_speed(cmd, max_speed)
        local cmd_speed = math.sqrt(cmd.forwardmove * cmd.forwardmove + cmd.sidemove * cmd.sidemove)
        if cmd_speed <= 0 or cmd_speed <= max_speed then
            return
        end

        local mul = max_speed / cmd_speed
        cmd.forwardmove = cmd.forwardmove * mul
        cmd.sidemove = cmd.sidemove * mul
    end

    function autostop.get_adaptive_soft_factor(speed, entry_limit, min_factor, max_factor)
        local overspeed = math.max(0, speed - entry_limit)
        local range = math.max(entry_limit * 1.5, 40)
        local t = math.min(1, overspeed / range)
        return max_factor - (max_factor - min_factor) * t
    end

    function autostop.get_safe_speed_cap(max_speed, shoot_limit, safe_percent)
        local cap = math.floor(max_speed * safe_percent)
        cap = math.max(3, cap)
        return math.min(shoot_limit, cap)
    end

    function autostop.reset_runtime_state(spawn_grace)
        set.aimed_enemy_start_time = -1
        set.air_stop_block_until = 0
        set.last_enemy_peek_time = -10
        set.pre_stop_hold_start = -1

        if spawn_grace ~= nil and spawn_grace > 0 then
            set.spawn_grace_until = globals.curtime() + spawn_grace
        else
            set.spawn_grace_until = 0
        end
    end

    function autostop.helper_style_stop(cmd, vx, vy, speed, shoot_limit, pistol_weapon)
        local stop_threshold = shoot_limit
        local overspeed = speed - stop_threshold
        if overspeed <= 0 then
            cmd.forwardmove = 0
            cmd.sidemove = 0
            return
        end

        local view_yaw = cmd.yaw
        if view_yaw == nil then
            local _, camera_yaw = client.camera_angles()
            view_yaw = camera_yaw or 0
        end

        local velocity_yaw = math.deg(math.atan2(vy, vx))
        local delta = math.rad(antiaim_func.normalize_angle(view_yaw - velocity_yaw))

        local stop_force
        if pistol_weapon then
            stop_force = overspeed > 42 and set.HELPER_PISTOL_STOP_FORCE_FAST or set.HELPER_PISTOL_STOP_FORCE
        elseif overspeed > 35 then
            stop_force = set.HELPER_STOP_FORCE
        elseif overspeed > 15 then
            stop_force = math.min(250, math.max(150, overspeed * 16))
        else
            stop_force = math.max(50, overspeed * 22)
        end

        cmd.forwardmove = -math.cos(delta) * stop_force
        cmd.sidemove = -math.sin(delta) * stop_force
    end

    function autostop.is_knife_weapon(weapon_ent, wpn_info)
        if wpn_info == nil then
            wpn_info = autostop.get_weapon_info_fast(weapon_ent)
        end

        if wpn_info ~= nil and wpn_info.bIsMeleeWeapon ~= nil then
            return wpn_info.bIsMeleeWeapon == true
        end

        local class_name = entity.get_classname(weapon_ent)
        return class_name ~= nil and string.find(class_name, "Knife", 1, true) ~= nil
    end

    function autostop.is_grenade_weapon(weapon_ent, wpn_info)
        if wpn_info ~= nil and wpn_info.iWeaponType ~= nil then
            local weapon_type = tonumber(wpn_info.iWeaponType)
            if weapon_type == 9 then
                return true
            end
        end

        local class_name = string.lower(entity.get_classname(weapon_ent) or "")
        if class_name == "" then
            return false
        end

        return string.find(class_name, "grenade", 1, true) ~= nil
            or string.find(class_name, "flashbang", 1, true) ~= nil
            or string.find(class_name, "molotov", 1, true) ~= nil
            or string.find(class_name, "incendiary", 1, true) ~= nil
            or string.find(class_name, "smoke", 1, true) ~= nil
            or string.find(class_name, "decoy", 1, true) ~= nil
    end

    function autostop.is_scout_weapon(weapon_ent)
        local class_name = entity.get_classname(weapon_ent) or ""
        return class_name == "CWeaponSSG08" or string.find(class_name, "SSG08", 1, true) ~= nil
    end

    function autostop.is_pistol_weapon(weapon_ent, wpn_info)
        if wpn_info ~= nil and wpn_info.iWeaponType ~= nil then
            local weapon_type = tonumber(wpn_info.iWeaponType)
            if weapon_type == 1 then
                return true
            end
        end

        local class_name = string.lower(entity.get_classname(weapon_ent) or "")
        if class_name == "" then
            return false
        end

        return string.find(class_name, "glock", 1, true) ~= nil
            or string.find(class_name, "hkp2000", 1, true) ~= nil
            or string.find(class_name, "usp", 1, true) ~= nil
            or string.find(class_name, "elite", 1, true) ~= nil
            or string.find(class_name, "p250", 1, true) ~= nil
            or string.find(class_name, "tec9", 1, true) ~= nil
            or string.find(class_name, "fiveseven", 1, true) ~= nil
            or string.find(class_name, "cz75", 1, true) ~= nil
            or string.find(class_name, "deagle", 1, true) ~= nil
            or string.find(class_name, "revolver", 1, true) ~= nil
    end

    function autostop.is_in_molotov(local_player)
        local lx, ly, lz = entity.get_origin(local_player)
        if lx == nil or lz == nil then
            return false
        end

        local infernos = entity.get_all and entity.get_all("CInferno") or nil
        if type(infernos) ~= "table" then
            return false
        end

        for i = 1, #infernos do
            local inferno = infernos[i]
            local ix, iy, iz = entity.get_origin(inferno)
            if ix ~= nil and iz ~= nil then
                local dx = lx - ix
                local dy = ly - iy
                local dz = math.abs(lz - iz)
                if (dx * dx + dy * dy) <= (130 * 130) and dz <= 128 then
                    return true
                end
            end
        end

        return false
    end

    function autostop.get_enemy_peek_context(local_player, view_yaw)
        local eye_x, eye_y, eye_z
        if client.eye_position then
            eye_x, eye_y, eye_z = client.eye_position()
        end

        if eye_x == nil or eye_y == nil or eye_z == nil then
            local origin_x, origin_y, origin_z = entity.get_origin(local_player)
            if origin_x ~= nil and origin_y ~= nil and origin_z ~= nil then
                eye_x, eye_y, eye_z = origin_x, origin_y, origin_z + 64
            end
        end

        local can_calc_fov = eye_x ~= nil and eye_y ~= nil and view_yaw ~= nil
        local enemies = entity.get_players(true)
        local best_fov = nil
        local has_peekable = false

        for i = 1, #enemies do
            local enemy_idx = enemies[i]
            local esp_data = entity.get_esp_data(enemy_idx)
            local peekable_pass = esp_data and esp_data.flags and bit.band(esp_data.flags, set.peekable_flag) ~= 0

            if peekable_pass then
                for j = 1, #set.peek_hitboxes do
                    local cx, cy, cz = entity.hitbox_position(enemy_idx, set.peek_hitboxes[j])
                    if cx ~= nil then
                        local valid_target = client.visible(cx, cy, cz)

                        if not valid_target then
                            goto continue_hitbox
                        end

                        has_peekable = true

                        if can_calc_fov then
                            local target_yaw = math.deg(math.atan2(cy - eye_y, cx - eye_x))
                            local fov = math.abs(antiaim_func.normalize_angle(target_yaw - view_yaw))
                            if best_fov == nil or fov < best_fov then
                                best_fov = fov
                            end
                        end

                        break
                    end
                    ::continue_hitbox::
                end
            end
        end

        return has_peekable, best_fov
    end

    function autostop.get_enemy_fov_and_dist(local_player, enemy_idx, view_yaw)
        if enemy_idx == nil or entity.is_dormant(enemy_idx) or entity.get_prop(enemy_idx, "m_lifeState") ~= 0 then
            return nil, nil
        end

        local ex, ey, ez = client.eye_position()
        if ex == nil then
            local ox, oy, oz = entity.get_origin(local_player)
            if ox == nil then
                return nil, nil
            end
            ex, ey, ez = ox, oy, (oz or 0) + 64
        end

        local tx, ty, tz = entity.hitbox_position(enemy_idx, 0)
        if tx == nil then
            local ox, oy, oz = entity.get_origin(enemy_idx)
            if ox == nil then
                return nil, nil
            end
            tx, ty, tz = ox, oy, (oz or 0) + 54
        end

        local dx, dy, dz = tx - ex, ty - ey, tz - ez
        local dist2d = math.sqrt(dx * dx + dy * dy)
        local dist3d = math.sqrt(dx * dx + dy * dy + dz * dz)
        if dist2d <= 0.1 then
            return 0, dist3d
        end

        local yaw = math.deg(math.atan2(dy, dx))
        local fov = math.abs(antiaim_func.normalize_angle(yaw - (view_yaw or 0)))
        return fov, dist3d
    end

    function autostop.is_enemy_visible(local_player, enemy)
        local local_player_origin = {entity.get_origin(local_player)}
        local enemy_origin = {entity.get_origin(enemy)}
        if local_player_origin[1] == nil or enemy_origin[1] == nil then
            return false
        end

        local hit_ent = client.trace_bullet(
            local_player,
            local_player_origin[1],
            local_player_origin[2],
            local_player_origin[3] + 16,
            enemy_origin[1],
            enemy_origin[2],
            enemy_origin[3] + 16
        )
        return hit_ent == enemy
    end
    
    function autostop.angle_math (x, y)
        local angle_x_sin = math.sin(math.rad(x))
        local angle_x_cos = math.cos(math.rad(x))
        local angle_y_sin = math.sin(math.rad(y))
        local angle_y_cos = math.cos(math.rad(y))
        return angle_x_cos * angle_y_cos, angle_x_cos * angle_y_sin, -angle_x_sin
    end

    function autostop.main(c) 
        local local_player = entity.get_local_player()
        if not local_player then
            set.was_alive = false
            autostop.reset_runtime_state(0.22)
            return
        end

        local now = globals.curtime()
        local is_alive = entity.is_alive(local_player)
        if not is_alive then
            if set.was_alive then
                autostop.reset_runtime_state(0.28)
            end
            set.was_alive = false
            return
        end

        if not set.was_alive then
            set.was_alive = true
            autostop.reset_runtime_state(0.28)
        end

        if now < set.spawn_grace_until then
            return
        end

        local mode_name = autostop.get_autostop_mode()

        local w_ent = entity.get_player_weapon(local_player)
        if not w_ent then return end

        local class_name = entity.get_classname(w_ent) or ""

        if class_name == "CWeaponTaser" then
            return
        end

        if mode_name == "Off" then
            return 
        end

        local has_any_modes, early_enabled, move_between_enabled, slow_motion_enabled = autostop.get_helper_mode_flags()
        if not has_any_modes and not (early_enabled or move_between_enabled or slow_motion_enabled) then
            return
        end

        local view_yaw = c.yaw
        if view_yaw == nil then
            local _, camera_yaw = client.camera_angles()
            view_yaw = camera_yaw
        end

        local attack_pressed = c.in_attack == 1 or c.in_attack2 == 1
        local enemy_peekable, best_enemy_fov = autostop.get_enemy_peek_context(local_player, view_yaw)
        local threat = client.current_threat()
        local threat_fov, threat_dist = autostop.get_enemy_fov_and_dist(local_player, threat, view_yaw)
        local threat_in_lane = threat_fov ~= nil
            and threat_dist ~= nil
            and threat_fov <= set.THREAT_PRESSURE_FOV
            and threat_dist <= set.THREAT_PRESSURE_MAX_DIST
        local threat_has_shot_line = false

        if threat_in_lane and threat ~= nil then
            for j = 1, #set.peek_hitboxes do
                local tx, ty, tz = entity.hitbox_position(threat, set.peek_hitboxes[j])
                if tx ~= nil then
                    if client.visible(tx, ty, tz) then
                        threat_has_shot_line = true
                        break
                    end
                end
            end
        end

        local threat_pressure = threat_in_lane and threat_has_shot_line
        local threat_attack_fallback = threat_in_lane and attack_pressed

        if best_enemy_fov == nil and threat_fov ~= nil and threat_has_shot_line then
            best_enemy_fov = threat_fov
        end

        if enemy_peekable or threat_pressure then
            set.last_enemy_peek_time = now
        end

        local recent_peek_contact = (now - set.last_enemy_peek_time) <= set.PEEK_MEMORY_TIME
        if not enemy_peekable and not threat_pressure and not recent_peek_contact and not threat_attack_fallback then
            return
        end
   
        local is_auto_sniper = class_name == "CWeaponSCAR20" or class_name == "CWeaponG3SG1"

        local wpn_info = autostop.get_weapon_info_fast(w_ent)
        if autostop.is_knife_weapon(w_ent, wpn_info) then
            return
        end
        if autostop.is_grenade_weapon(w_ent, wpn_info) then
            return
        end
        local pistol_weapon = autostop.is_pistol_weapon(w_ent, wpn_info)

        if autostop.mode_enabled("Ignore molotov") or autostop.mode_enabled("Ingnore molotov") then
            if autostop.is_in_molotov(local_player) then
                return
            end
        end

        local move_type = entity.get_prop(local_player, "m_MoveType") or 0
        if move_type == 8 or move_type == 9 then return end

        local flags = entity.get_prop(local_player, "m_fFlags") or 0
        local on_ground = bit.band(flags, 1) ~= 0
        local vx, vy, vz = entity.get_prop(local_player, "m_vecAbsVelocity")
        if vx == nil then
            vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
        end
        if vx == nil or vy == nil then
            vx, vy, vz = entity.get_prop(local_player, "m_vecVelocity")
        end
        vx, vy, vz = vx or 0, vy or 0, vz or 0
        local speed = math.sqrt(vx * vx + vy * vy)
        local jumping_now = c.in_jump == 1
        local vertical_speed = math.abs(vz)
        local jump_scout_enabled = autostop.mode_enabled("Jump scout")
            and autostop.is_scout_weapon(w_ent)
            and scout ~= nil
            and scout.jumpstop_hotkey ~= nil
            and scout.jumpstop_hotkey.get ~= nil
            and scout.jumpstop_hotkey:get()

        if not on_ground or vertical_speed > 55 or jumping_now then
            set.air_stop_block_until = now + set.AIR_STOP_BLOCK_TIME
        end

        local air_blocked = now < set.air_stop_block_until
        if (not on_ground or air_blocked) and not jump_scout_enabled then
            return
        end

        if jump_scout_enabled and not on_ground then
            return
        end

        local max_speed = autostop.get_weapon_max_speed(local_player, w_ent, wpn_info)
        local entry_limit, shoot_limit = autostop.get_stop_speed_limits(local_player, w_ent, max_speed)
        local duck_amount = entity.get_prop(local_player, "m_flDuckAmount") or 0

        local curtime = globals.tickinterval() * (entity.get_prop(local_player, "m_nTickBase") or 0)
        local next_primary = entity.get_prop(w_ent, "m_flNextPrimaryAttack") or 0
        local next_attack = entity.get_prop(local_player, "m_flNextAttack") or 0
        local can_shoot = next_primary <= curtime and next_attack <= curtime
        local shoot_soon_ticks = pistol_weapon and set.PISTOL_SHOOT_SOON_TICKS or set.SHOOT_SOON_TICKS
        local shoot_eta = math.max(next_primary, next_attack) - curtime
        local can_shoot_soon = shoot_eta <= (globals.tickinterval() * shoot_soon_ticks)
        local in_attack = attack_pressed
        local recent_shot = (now - set.last_aim_fire_time) <= set.RECENT_SHOT_WINDOW
        local movement_keys = c.in_forward == 1 or c.in_back == 1 or c.in_moveleft == 1 or c.in_moveright == 1
        local shot_age = now - set.last_aim_fire_time
        local post_shot_escape_time = set.HELPER_POST_SHOT_ESCAPE_TIME
        local post_shot_escape = (not pistol_weapon and not is_auto_sniper) and not in_attack and shot_age >= 0 and shot_age <= post_shot_escape_time
        local combat_fov = set.HELPER_COMBAT_FOV
        local engage_fov = set.HELPER_ENGAGE_FOV
        local safe_speed_cap = autostop.get_safe_speed_cap(max_speed, shoot_limit, set.HELPER_SAFE_PERCENT)
        if duck_amount > 0.55 then
            safe_speed_cap = math.max(2, math.min(safe_speed_cap, shoot_limit - 2))
        end
        local aimed_enemy = best_enemy_fov ~= nil and best_enemy_fov <= combat_fov
        local close_enemy = best_enemy_fov ~= nil and best_enemy_fov <= math.max(10, combat_fov * 0.70)
        local enemy_in_engage_lane = best_enemy_fov == nil or best_enemy_fov <= engage_fov
        local base_enemy_lane = enemy_peekable and enemy_in_engage_lane
        local threat_lane_pressure = threat_pressure and (in_attack or (can_shoot_soon and recent_peek_contact))
        local memory_lane_pressure = recent_peek_contact and (can_shoot_soon or recent_shot)
        local lane_pressure = base_enemy_lane or threat_lane_pressure or memory_lane_pressure or threat_attack_fallback
        local pre_engage_extra_ticks = set.PRE_ENGAGE_EXTRA_TICKS + (pistol_weapon and 2.0 or 0)
        local pre_engage_window = (aimed_enemy or lane_pressure) and shoot_eta <= (globals.tickinterval() * (shoot_soon_ticks + pre_engage_extra_ticks))
        local shot_ready_window = in_attack or can_shoot or can_shoot_soon or pre_engage_window

        if aimed_enemy then
            if set.aimed_enemy_start_time < 0 then
                set.aimed_enemy_start_time = now
            end
        else
            set.aimed_enemy_start_time = -1
        end

        local aim_lock_time = speed > 140 and set.AIM_LOCK_FAST_TIME or set.AIM_LOCK_SLOW_TIME
        local stable_aim = aimed_enemy and set.aimed_enemy_start_time >= 0 and (now - set.aimed_enemy_start_time) >= aim_lock_time
        local pre_fire_window = aimed_enemy and can_shoot_soon
        local combat_window = in_attack or recent_shot or stable_aim or pre_fire_window
        local pressure_window = combat_window
        local helper_combat_ready = (aimed_enemy or lane_pressure) and (can_shoot or can_shoot_soon or pre_engage_window or in_attack)
        local helper_recharge_move = (not pistol_weapon) and movement_keys and not in_attack and not can_shoot and not can_shoot_soon
        local open_walk = movement_keys
            and not in_attack
            and not recent_shot
            and not lane_pressure
            and not helper_combat_ready
        local free_move_window = open_walk and not can_shoot_soon
        local early_stop_limit = math.max(2, shoot_limit - set.PRE_STOP_MARGIN)
        if duck_amount > 0.55 then
            early_stop_limit = math.max(1, early_stop_limit - 2)
        end

        local helper_assist_window = aimed_enemy and (in_attack or can_shoot_soon or pre_engage_window)
        local pistol_contact = pistol_weapon and (lane_pressure or aimed_enemy or threat_pressure or threat_attack_fallback or recent_peek_contact)
        local pistol_force_window = pistol_contact and (
            in_attack
            or can_shoot_soon
            or pre_engage_window
            or (shot_age >= 0 and shot_age <= 0.16)
        )
        local pistol_strict_speed = math.max(6, math.floor(max_speed * 0.11))
        local pistol_force_speed = math.max(8, math.floor(max_speed * 0.13))

        if post_shot_escape or helper_recharge_move or (open_walk and not can_shoot_soon and not pistol_force_window) then
            set.pre_stop_hold_start = -1
            return 
        end

        if not helper_assist_window and not pistol_force_window then
            set.pre_stop_hold_start = -1
            return
        end

        local should_stop = false
        local should_slow = false
        local should_cap_speed = false
        local soft_slow_factor = nil

        if not open_walk then
            if lane_pressure and not recent_shot and (in_attack or can_shoot_soon or pre_engage_window) and speed > (early_stop_limit + 1) then
                should_stop = true
            end

            if early_enabled and helper_assist_window and shot_ready_window and (pressure_window or pre_engage_window) and speed > (early_stop_limit + 1) then
                should_stop = true
            end

            if move_between_enabled and pressure_window and helper_assist_window then
                if (in_attack or can_shoot_soon or pre_engage_window) and speed > early_stop_limit then
                    should_stop = true
                elseif can_shoot_soon and close_enemy and speed > (safe_speed_cap + 6) then
                    should_stop = true
                elseif speed > (entry_limit + 5) then
                    should_slow = true
                    if not can_shoot then
                        soft_slow_factor = autostop.get_adaptive_soft_factor(speed, entry_limit, set.HELPER_SOFT_SLOW_MIN, set.HELPER_SOFT_SLOW_FACTOR)
                    end
                end

                if not can_shoot and speed > (safe_speed_cap + 4) and not free_move_window then
                    should_cap_speed = true
                end
            end
        end

        if duck_amount > 0.55 and (in_attack or can_shoot_soon) and pressure_window and speed > 1.0 then
            should_stop = true
        end

        if in_attack and speed > math.max(4, shoot_limit - 1) and (lane_pressure or aimed_enemy or recent_peek_contact or threat_pressure or threat_attack_fallback) then
            should_stop = true
        end

        local strict_shot_window = (in_attack or can_shoot_soon or pre_engage_window or (can_shoot and aimed_enemy))
            and (lane_pressure or aimed_enemy or threat_pressure or threat_attack_fallback)
        local strict_speed_limit = pistol_weapon and pistol_strict_speed or math.max(2, shoot_limit - 10)
        if strict_shot_window and speed > strict_speed_limit then
            should_stop = true
        end

        if duck_amount > 0.55 and strict_shot_window and speed > 0.35 then
            should_stop = true
        end

        if pistol_weapon and pistol_contact and (can_shoot or can_shoot_soon or pre_engage_window) and speed > pistol_force_speed then
            should_stop = true
        end

        if pistol_force_window and speed > pistol_force_speed then
            should_stop = true
        end

        if should_stop and not in_attack then
            if set.pre_stop_hold_start < 0 then
                set.pre_stop_hold_start = now
            end

            local hold_age = now - set.pre_stop_hold_start
            local can_commit_shot = in_attack or can_shoot_soon or pre_engage_window or (can_shoot and aimed_enemy)
            if hold_age > set.MAX_PRESTOP_HOLD and not can_commit_shot then
                should_stop = false
                should_cap_speed = false
            end
        else
            set.pre_stop_hold_start = -1
        end

        if slow_motion_enabled and speed > entry_limit and not should_stop then
            if open_walk then
                should_slow = true
                if soft_slow_factor == nil then
                    soft_slow_factor = set.OPEN_WALK_SOFT_FACTOR_HELPER
                end
            elseif pressure_window then
                should_slow = true
                if not can_shoot and soft_slow_factor == nil then
                    soft_slow_factor = autostop.get_adaptive_soft_factor(speed, entry_limit, set.HELPER_SOFT_SLOW_MIN, set.HELPER_SOFT_SLOW_FACTOR)
                end
            end
        end

        if should_stop then
            autostop.helper_style_stop(c, vx, vy, speed, shoot_limit, pistol_weapon)
        elseif should_slow then
            if soft_slow_factor ~= nil then
                c.forwardmove = c.forwardmove * soft_slow_factor
                c.sidemove = c.sidemove * soft_slow_factor
            else
                autostop.limit_cmd_speed(c, math.max(entry_limit, shoot_limit + 4))
            end

            if should_cap_speed then
                autostop.limit_cmd_speed(c, safe_speed_cap)
            end
        elseif should_cap_speed then
            autostop.limit_cmd_speed(c, safe_speed_cap)
        end
    end

    local function on_aim_fire()
        set.last_aim_fire_time = globals.curtime()
        set.pre_stop_hold_start = -1
    end

    local function on_player_spawn(e)
        if e == nil or e.userid == nil then
            return
        end

        local local_player = entity.get_local_player()
        if local_player == nil then
            return
        end

        if client.userid_to_entindex(e.userid) == local_player then
            set.was_alive = true
            autostop.reset_runtime_state(0.28)
        end
    end

    local function on_player_death(e)
        if e == nil or e.userid == nil then
            return
        end

        local local_player = entity.get_local_player()
        if local_player == nil then
            return
        end

        if client.userid_to_entindex(e.userid) == local_player then
            set.was_alive = false
            autostop.reset_runtime_state(0.28)
        end
    end

    local function on_round_start()
        autostop.reset_runtime_state(0.22)
    end

    function autostop.refresh_callbacks(force_state)
        local target_state = force_state
        if target_state == nil then
            target_state = autostop.get_autostop_mode() ~= "Off"
        end

        if callbacks_initialized and enabled == target_state then
            return
        end

        enabled = target_state
        callbacks_initialized = true

        utils.set_event_callback('setup_command', autostop.main, enabled)
        utils.set_event_callback("aim_fire", on_aim_fire, enabled)
        utils.set_event_callback("player_spawn", on_player_spawn, enabled)
        utils.set_event_callback("player_death", on_player_death, enabled)
        utils.set_event_callback("round_start", on_round_start, enabled)

        if not enabled then
            set.was_alive = false
            autostop.reset_runtime_state(0)
        end
    end

    menu.ragebot.autostop:set_callback(function ()
        autostop.refresh_callbacks()
    end)

    autostop.refresh_callbacks()
end

local interpolation = {} do 
    ffi.cdef[[
        typedef struct {
            unsigned short type;
            unsigned short needs_interpolate;
            void* data;
            void* watcher;
        } varmap_entry_t;

        typedef struct {
            varmap_entry_t* entries;
            int count;
        } varmapping_t;
    ]]

    local origin_index_cache = setmetatable({}, { __mode = "k" })
    local last_menu_val = -2 
    local last_ping_time = 0
    local ping_cache = {}
    local player_resource_cache = nil

    local function update_ping_cache()
        local current_time = globals.curtime()
        if current_time - last_ping_time < 0.5 then return end
        
        last_ping_time = current_time
        ping_cache = {}
        
        local resource = entity.get_player_resource()
        if not resource then return end
        
        local enemies = entity.get_players(true)
        for i = 1, #enemies do
            local ent = enemies[i]
            local ping = entity.get_prop(resource, "m_iPing", ent) or 0
            ping_cache[ent] = math.min(ping / 15.625, 16)
        end
    end

    function interpolation.setup(ent, amount)
        if not ent then return end
        
        local entity_ptr = get_entity_pointer(ent)
        if entity_ptr == nil then return end

        local entity_addr = ffi.cast('uintptr_t', entity_ptr)
        local varmapping_addr = entity_addr + 0x24
        local entries_ptr = ffi.cast('varmap_entry_t**', varmapping_addr)[0]
        local interp_count = ffi.cast('int*', varmapping_addr + 0x14)[0]

        if entries_ptr == nil or interp_count <= 0 then return end

        local cached_idx = origin_index_cache[ent]
        if cached_idx and cached_idx < interp_count then
            local entry = entries_ptr[cached_idx]
            if entry.watcher ~= nil and entry.data ~= nil then
                native_SetInterpolationAmount(entry.watcher, globals.tickinterval() * amount)
                return
            end
        end

        for i = 0, interp_count - 1 do
            local entry = entries_ptr[i]
            if entry.data ~= nil and entry.watcher ~= nil then
                local data_offset = ffi.cast('uintptr_t', entry.data) - entity_addr
                if data_offset == 172 then
                    origin_index_cache[ent] = i
                    native_SetInterpolationAmount(entry.watcher, globals.tickinterval() * amount)
                    return 
                end
            end
        end
    end

    function interpolation.run()
        local me = entity.get_local_player()
        if not me or not entity.is_alive(me) then return end

        local menu_val = menu.ragebot.inter:get()
        if menu_val == -1 then return end 

        local enemies = entity.get_players(true)
        if #enemies == 0 then return end

        local menu_changed = menu_val ~= last_menu_val
        if menu_changed then
            last_menu_val = menu_val
        end

        if menu_val == 0 then
            update_ping_cache()
        end

        for i = 1, #enemies do
            local ent = enemies[i]

            if not entity.is_alive(ent) or entity.is_dormant(ent) then
                origin_index_cache[ent] = nil 
            else
                local final_amount
                
                if menu_val == 0 then
                    final_amount = ping_cache[ent] or 0
                else
                    final_amount = menu_val
                end

                if final_amount > 0 then
                    interpolation.setup(ent, final_amount)
                end
            end
        end
    end

    local function clear_cache()
        origin_index_cache = setmetatable({}, { __mode = "k" })
        ping_cache = {}
        last_menu_val = -2
        last_ping_time = 0
    end

    utils.set_event_callback("level_init", clear_cache, true)
    utils.set_event_callback("round_start", clear_cache, true)
    utils.set_event_callback("net_update_end", interpolation.run, true)
end 

local rage_settings = {} do 
    function rage_settings.target() 
        if not menu.ragebot.target:get() then return end
        local idx = client.current_threat()
        local name = entity.get_player_name(idx)
        if not entity.is_alive(idx) then return end
        if not entity.is_alive(entity.get_local_player()) then return end
        renderer.indicator(230, 230, 230, 230, 'TA: ' .. name)
    end

    local shots = {
        hit = {},
        missed = { 0, 0, 0, 0, 0 },
        total = 0
    }
    local hitgroups = { 'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', 'unknown', 'gear' }

    client.set_event_callback('aim_hit', function(shot)
        table.insert(shots.hit, {
            entity.get_player_name(shot.target),
            shot.hit_chance,
            shot.damage,
            hitgroups[shot.hitgroup + 1] or 'unknown'
        })
    end)
    client.set_event_callback('aim_miss', function(shot)
        if shot.reason == 'spread' then shots.missed[1] = shots.missed[1] + 1 end;if shot.reason == 'prediction error' then shots.missed[2] = shots.missed[2] + 1 end;if shot.reason == 'death' or shot.reason == 'unregistered shot' then shots.missed[3] = shots.missed[3] + 1 end;if shot.reason == '?' then shots.missed[4] = shots.missed[4] + 1 end
    end)

    function rage_settings.hitrate()

        local total_shots = #shots.hit + shots.missed[5]
        local hits = #shots.hit

        local percentage = total_shots > 0 and math.floor((hits / total_shots) * 100) or 0

        if menu.ragebot.hitrate:get('Percentage') and not(menu.ragebot.hitrate:get('Percentage') and menu.ragebot.hitrate:get('Shot/Hit')) then
            if menu.visuals.custom_ind_gs_icon:get() then
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, 'HM: ' .. string.format('%d%%', percentage))
            else 
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, string.format('%d%%', percentage))
            end
        elseif menu.ragebot.hitrate:get('Shot/Hit') and not (menu.ragebot.hitrate:get('Percentage') and menu.ragebot.hitrate:get('Shot/Hit')) then
            if menu.visuals.custom_ind_gs_icon:get() then
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, 'HM: ' .. string.format('%d / %d', total_shots, hits))
            else 
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, string.format('%d / %d', total_shots, hits))
            end
        end
        if menu.ragebot.hitrate:get('Percentage') and menu.ragebot.hitrate:get('Shot/Hit') then
            if menu.visuals.custom_ind_gs_icon:get() then
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, 'HM: ' .. string.format("%d / %d (%d%%)", total_shots, hits, percentage))
            else 
                shots.missed[5] = shots.missed[1] + shots.missed[2] + shots.missed[4]
                renderer.indicator(230, 230, 230, 230, string.format("%d / %d (%d%%)", total_shots, hits, percentage))
            end
        end
    end

    menu.ragebot.target:set_callback(function() 
        local state_en = menu.ragebot.target:get()
        utils.set_event_callback('paint_ui', rage_settings.target, state_en)
    end)

    menu.ragebot.hitrate:set_callback(function()
        local state_en = #menu.ragebot.hitrate:get() > 0 
        utils.set_event_callback('paint_ui', rage_settings.hitrate, state_en)
    end)
end
 
local cfg = {
    HISTORY_SIZE = 18,
    ACTIVE_MEMORY_TICKS = 64,

    MISS_DB_SAMPLE_CAP = 96,
    MISS_DB_MIN_SAMPLES = 2,
    MISS_DB_NEIGHBOR_RADIUS = 5,
    MISS_DB_EV_PRIOR = 1.5,
    MISS_DB_EV_WEIGHT = 1.35,
    MISS_DB_SOFT_DECAY = 0.985,
    MISS_DB_HIT_DECAY_ON_MISS = 29 / 50,
    MISS_DB_MISS_DECAY_ON_HIT = 0.92,
    MISS_DB_CONFLICT_RADIUS = 2,

    POSE_WEIGHT = 0.52,
    LBY_WEIGHT = 0.36,
    ANIM_WEIGHT = 0.27,
    MISS_FLIP_WEIGHT = 0.42,

    BRAIN_MIN_SAMPLES = 3,
    BRAIN_MIN_CONFIDENCE = 0.22,
    BRAIN_DECAY = 0.985,
    BRAIN_HIT_WEIGHT = 0.72,
    BRAIN_MISS_WEIGHT = 1.18,

    ANGLE_MEMORY_CAP = 48,
    ANGLE_MEMORY_MIN_SAMPLES = 3,
    ANGLE_MEMORY_MIN_RATE = 0.70,
    ANGLE_MEMORY_HIT_DECAY_ON_MISS = 0.55,
    ANGLE_MEMORY_MISS_DECAY_ON_HIT = 0.90,
}

local m_abs = math.abs
local m_floor = math.floor
local m_ceil = math.ceil
local m_sqrt = math.sqrt
local m_min = math.min
local m_max = math.max

local correction do 

    local function clamp(value, min_value, max_value)
        if value == nil then return min_value end
        if value < min_value then return min_value end
        if value > max_value then return max_value end
        return value
    end


    local function sign(value)
        if value == nil or value == 0 then return 0 end
        return value > 0 and 1 or -1
    end

    local function round_yaw(yaw)
        yaw = antiaim_func.normalize_angle(yaw)
        if yaw >= 0 then
            return m_floor(yaw + 0.5)
        end

        return m_ceil(yaw - 0.5)
    end

    local function safe_field(obj, ...)
        if obj == nil then return nil end

        for i = 1, select("#", ...) do
            local key = select(i, ...)
            local ok, value = pcall(function()
                return obj[key]
            end)

            if ok and value ~= nil then
                return value
            end
        end

        return nil
    end

    local function get_identity(ent)
        local steam64 = entity.get_steam64(ent)
        if steam64 ~= nil then
            return tostring(steam64)
        end

        return tostring(entity.get_player_name(ent) or "unknown") .. ":" .. tostring(ent)
    end

    local miss_db = {
        global = { bins = {}, hit_bins = {}, total = 0, hit_total = 0 },
        by_target = {},
        last_decay_tick = 0,
    }

    local function get_db_node(root, key)
        if key == nil then key = "unknown" end

        if root[key] == nil then
            root[key] = { bins = {}, hit_bins = {}, total = 0, hit_total = 0 }
        end

        return root[key]
    end

    local function get_bin(yaw)
        return round_yaw(yaw)
    end

    local function db_cap(node, bins_name, total_name)
        local total = node[total_name] or 0
        if total <= cfg.MISS_DB_SAMPLE_CAP then return end

        local scale = cfg.MISS_DB_SAMPLE_CAP / total
        local new_total = 0
        local bins = node[bins_name]

        for key, value in pairs(bins) do
            local scaled = value * scale
            if scaled < 0.001 then
                bins[key] = nil
            else
                bins[key] = scaled
                new_total = new_total + scaled
            end
        end

        node[total_name] = new_total
    end

    local function db_recount(node, bins_name, total_name)
        local total = 0
        local bins = node[bins_name]

        for key, value in pairs(bins) do
            if value < 0.001 then
                bins[key] = nil
            else
                total = total + value
            end
        end

        node[total_name] = total
    end

    local function db_decay_conflict(node, bins_name, total_name, center_bin, decay)
        if node == nil then return end

        local bins = node[bins_name]
        if bins == nil then return end

        local radius = cfg.MISS_DB_CONFLICT_RADIUS or 0
        decay = decay or 1

        for offset = -radius, radius do
            local lookup_bin = get_bin(center_bin + offset)
            local value = bins[lookup_bin]
            if value ~= nil then
                bins[lookup_bin] = value * decay
            end
        end

        db_recount(node, bins_name, total_name)
    end

    local function db_add_miss(node, yaw, weight)
        if node == nil then return end

        local bin = get_bin(yaw)
        weight = weight or 1
        db_decay_conflict(node, "hit_bins", "hit_total", bin, cfg.MISS_DB_HIT_DECAY_ON_MISS)
        node.bins[bin] = (node.bins[bin] or 0) + weight
        node.total = (node.total or 0) + weight
        db_cap(node, "bins", "total")
    end

    local function db_add_hit(node, yaw, weight)
        if node == nil then return end

        local bin = get_bin(yaw)
        weight = weight or 1
        db_decay_conflict(node, "bins", "total", bin, cfg.MISS_DB_MISS_DECAY_ON_HIT)
        node.hit_bins[bin] = (node.hit_bins[bin] or 0) + weight
        node.hit_total = (node.hit_total or 0) + weight
        db_cap(node, "hit_bins", "hit_total")
    end

    local function db_get_ev(node, yaw)
        if node == nil then return 0.5 end

        local samples = (node.total or 0) + (node.hit_total or 0)
        if samples < cfg.MISS_DB_MIN_SAMPLES then
            return 0.5
        end

        local center = get_bin(yaw)
        local radius = cfg.MISS_DB_NEIGHBOR_RADIUS
        local hits, misses = 0, 0

        for offset = -radius, radius do
            local factor = 1 / (1 + m_abs(offset))
            local lookup_bin = get_bin(center + offset)
            hits = hits + ((node.hit_bins[lookup_bin] or 0) * factor)
            misses = misses + ((node.bins[lookup_bin] or 0) * factor)
        end

        local prior = cfg.MISS_DB_EV_PRIOR
        return (hits + prior) / (hits + misses + prior * 2)
    end

    local function db_expected_value(identity, yaw)
        local global_ev = db_get_ev(miss_db.global, yaw)
        local target_node = identity and miss_db.by_target[identity] or nil

        if target_node == nil then
            return global_ev
        end

        local target_samples = (target_node.total or 0) + (target_node.hit_total or 0)
        if target_samples < cfg.MISS_DB_MIN_SAMPLES then
            return global_ev
        end

        local target_ev = db_get_ev(target_node, yaw)
        return global_ev * 0.28 + target_ev * 0.72
    end

    local function db_decay(cur_tick)
        if (cur_tick - (miss_db.last_decay_tick or 0)) < 64 then return end
        miss_db.last_decay_tick = cur_tick

        local decay = cfg.MISS_DB_SOFT_DECAY
        local function decay_node(node)
            if node == nil then return end

            local miss_total = 0
            for key, value in pairs(node.bins) do
                local new_value = value * decay
                if new_value < 0.001 then
                    node.bins[key] = nil
                else
                    node.bins[key] = new_value
                    miss_total = miss_total + new_value
                end
            end
            node.total = miss_total

            local hit_total = 0
            for key, value in pairs(node.hit_bins) do
                local new_value = value * decay
                if new_value < 0.001 then
                    node.hit_bins[key] = nil
                else
                    node.hit_bins[key] = new_value
                    hit_total = hit_total + new_value
                end
            end
            node.hit_total = hit_total
        end

        decay_node(miss_db.global)
        for _, node in pairs(miss_db.by_target) do
            decay_node(node)
        end
    end

    local runtime = {
        players = {},
        shots = {},
        logs = {},
        applied = {},
    }

    local function new_brain()
        return {
            left = 0,
            right = 0,
            samples = 0,
        }
    end

    local function new_angle_memory()
        return {
            list = {},
            bins = {},
            best_yaw = nil,
            best_rate = 0,
            best_samples = 0,
        }
    end

    local function new_player_state(ent, identity)
        return {
            records = {},
            records_by_tick = {},
            last_sim_tick = -1,
            last_candidate = 0,
            last_score = 0,
            last_ev = 0.5,
            last_reason = "none",
            last_confidence = 0,
            last_side = 0,
            last_hit_yaw = nil,
            last_miss_yaw = nil,
            last_miss_tick = 0,
            last_miss_reason = nil,
            last_miss_hitgroup = nil,
            last_anim_update_time = nil,
            approach_abs_yaw = nil,
            miss_streak = 0,
            hit_streak = 0,
            identity = identity or get_identity(ent),
            brain = new_brain(),
            angle_memory = new_angle_memory(),
        }
    end

    local function reset_player_runtime(state, identity)
        state.records = {}
        state.records_by_tick = {}
        state.last_sim_tick = -1
        state.last_candidate = 0
        state.last_score = 0
        state.last_ev = 0.5
        state.last_reason = "none"
        state.last_confidence = 0
        state.last_side = 0
        state.last_hit_yaw = nil
        state.last_miss_yaw = nil
        state.last_miss_tick = 0
        state.last_miss_reason = nil
        state.last_miss_hitgroup = nil
        state.last_anim_update_time = nil
        state.approach_abs_yaw = nil
        state.miss_streak = 0
        state.hit_streak = 0
        state.identity = identity
        state.brain = new_brain()
        state.angle_memory = new_angle_memory()
    end

    local function get_player_state(ent)
        local identity = get_identity(ent)

        if runtime.players[ent] == nil then
            runtime.players[ent] = new_player_state(ent, identity)
        elseif runtime.players[ent].identity ~= identity then
            reset_player_runtime(runtime.players[ent], identity)
        end

        return runtime.players[ent]
    end

    local function push_log(text)
        runtime.logs[#runtime.logs + 1] = string.format("[%d] %s", globals.tickcount(), text)
        while #runtime.logs > 7 do
            table.remove(runtime.logs, 1)
        end
    end

    local function set_player_correction(ent, active, yaw)
        if active then
            plist.set(ent, "Correction active", true)
            plist.set(ent, "Force body yaw", true)
            plist.set(ent, "Force body yaw value", yaw and antiaim_func.normalize_angle(yaw) or 0)
            runtime.applied[ent] = true
        elseif runtime.applied[ent] then
            plist.set(ent, "Force body yaw", false)
            plist.set(ent, "Correction active", false)
            runtime.applied[ent] = nil
        end
    end

    local function reset_all_corrections()
        local pending = {}
        for ent in pairs(runtime.applied) do
            pending[#pending + 1] = ent
        end

        for i = 1, #pending do
            set_player_correction(pending[i], false, 0)
        end
    end

    local function apply_simtime_base(state, record)
        local previous = state.records_by_tick[record.old_sim_tick]

        if previous == nil and state.records[1] ~= nil and state.records[1].sim_tick ~= record.sim_tick then
            previous = state.records[1]
        end

        if previous == nil or previous.eye_yaw == nil then
            record.simtime_checked = false
            record.simtime_base_yaw = nil
            record.simtime_fake_abs = nil
            return
        end

        local max_desync = record.max_desync or 0
        local eye_yaw = record.eye_yaw or 0
        local fake_abs = antiaim_func.normalize_angle(eye_yaw + max_desync)
        local fake_delta = max_desync

        if m_abs(antiaim_func.angle_diff(fake_abs, previous.eye_yaw)) > max_desync then
            fake_abs = antiaim_func.normalize_angle(eye_yaw - max_desync)
            fake_delta = -max_desync
        end

        record.simtime_checked = true
        record.simtime_base_yaw = antiaim_func.normalize_angle(fake_delta)
        record.simtime_fake_abs = fake_abs
        record.simtime_reference_eye = previous.eye_yaw
    end

    local function apply_approach_base(state, record, anim_state)
        local max_desync = record.max_desync or 0
        local eye_yaw = record.eye_yaw or 0
        local target_abs = record.simtime_fake_abs

        if target_abs == nil then
            local side = state.last_side
            if side == 0 then side = sign(record.lby_delta) end
            if side == 0 then side = sign(record.goal_feet_delta) end
            if side == 0 then side = 1 end
            target_abs = antiaim_func.normalize_angle(eye_yaw + side * max_desync)
        end

        local update_time = safe_field(anim_state, "last_client_side_animation_update_time", "m_flLastClientSideAnimationUpdateTime") or globals.curtime()
        local previous_update_time = state.last_anim_update_time
        state.last_anim_update_time = update_time

        local dt = previous_update_time and (update_time - previous_update_time) or globals.tickinterval()
        if dt <= 0 or dt > globals.tickinterval() * 16 then
            dt = globals.tickinterval()
        end

        local stop_to_run = safe_field(anim_state, "stop_to_full_running_fraction", "m_flStopToFullRunningFraction") or 0
        local rate = record.speed2d > 0.1 and (((stop_to_run * 20) + 30) * dt) or (100 * dt)
        local start_abs = state.approach_abs_yaw or eye_yaw
        local approached_abs = antiaim_func.approach_angle(target_abs, start_abs, rate)

        state.approach_abs_yaw = antiaim_func.normalize_angle(approached_abs)
        record.approach_base_yaw = antiaim_func.normalize_angle(antiaim_func.angle_diff(state.approach_abs_yaw, eye_yaw))
        record.approach_rate = rate
    end

    local function build_record(ent, state)
        local sim_time = entity.get_prop(ent, "m_flSimulationTime")
        if sim_time == nil then return nil end

        local ent_obj = c_entity.new(ent)
        local anim_state = ent_obj:get_anim_state()
        local layer3 = ent_obj:get_anim_overlay(3)
        local layer6 = ent_obj:get_anim_overlay(6)

        local old_sim_time = entity.get_prop(ent, "m_flOldSimulationTime")
        if old_sim_time == nil and state.records[1] ~= nil then
            old_sim_time = state.records[1].simulation_time
        end

        local sim_tick = toticks(sim_time)
        local old_sim_tick = old_sim_time and toticks(old_sim_time) or sim_tick
        local sim_delta_ticks = clamp(sim_tick - old_sim_tick, 1, 16)

        local vx, vy, vz = entity.get_prop(ent, "m_vecVelocity")
        vx, vy, vz = vx or 0, vy or 0, vz or 0

        local ox, oy, oz = entity.get_origin(ent)
        ox, oy, oz = ox or 0, oy or 0, oz or 0

        local eye_yaw = select(2, entity.get_prop(ent, "m_angEyeAngles"))
        local lby = antiaim_func.normalize_angle(entity.get_prop(ent, "m_flLowerBodyYawTarget"))
        local goal_feet_yaw = antiaim_func.normalize_angle(safe_field(anim_state, "goal_feet_yaw", "m_flGoalFeetYaw"))
        local current_feet_yaw = antiaim_func.normalize_angle(safe_field(anim_state, "current_feet_yaw", "m_flCurrentFeetYaw"))
        local max_desync = m_abs(antiaim_func.get_desync(anim_state) or 0)
        local pose = entity.get_prop(ent, "m_flPoseParameter", 11)
        pose = pose and (pose * 120 - 60) or nil

        local record = {
            ent = ent,
            identity = state.identity,
            simulation_time = sim_time,
            sim_tick = sim_tick,
            old_sim_tick = old_sim_tick,
            choked = clamp(sim_delta_ticks - 1, 0, 16),
            eye_yaw = eye_yaw,
            lby = lby,
            lby_delta = antiaim_func.angle_diff(lby, eye_yaw),
            goal_feet_yaw = goal_feet_yaw,
            current_feet_yaw = current_feet_yaw,
            goal_feet_delta = antiaim_func.angle_diff(goal_feet_yaw, eye_yaw),
            current_feet_delta = antiaim_func.angle_diff(current_feet_yaw, eye_yaw),
            pose_yaw = pose,
            max_desync = max_desync,
            velocity_x = vx,
            velocity_y = vy,
            velocity_z = vz,
            speed2d = vector(vx,vy):length2d(),
            origin_x = ox,
            origin_y = oy,
            origin_z = oz,
            layer3_weight = safe_field(layer3, "weight", "m_flWeight") or 0,
            layer3_cycle = safe_field(layer3, "cycle", "m_flCycle") or 0,
            layer3_playback = safe_field(layer3, "playback_rate", "m_playback_rate", "m_flPlaybackRate") or 0,
            layer6_weight = safe_field(layer6, "weight", "m_flWeight") or 0,
            layer6_cycle = safe_field(layer6, "cycle", "m_flCycle") or 0,
            layer6_playback = safe_field(layer6, "playback_rate", "m_playback_rate", "m_flPlaybackRate") or 0,
        }

        apply_simtime_base(state, record)
        apply_approach_base(state, record, anim_state)
        return record
    end

    local function store_record(state, record)
        if record == nil then return end

        if state.last_sim_tick ~= record.sim_tick then
            table.insert(state.records, 1, record)
            state.records_by_tick[record.sim_tick] = record
            state.last_sim_tick = record.sim_tick

            while #state.records > cfg.HISTORY_SIZE do
                local removed = table.remove(state.records)
                if removed ~= nil then
                    state.records_by_tick[removed.sim_tick] = nil
                end
            end
        else
            state.records[1] = record
            state.records_by_tick[record.sim_tick] = record
        end
    end

    local function add_candidate(candidates, value, reason, weight, max_desync, apply_yaw)
        value = value ~= nil and antiaim_func.normalize_angle(value) or nil
        if value == nil then return end

        local key = get_bin(value)
        local existing = candidates[key]

        if existing == nil or (weight or 0) > existing.weight then
            candidates[key] = {
                value = value,
                apply_yaw = apply_yaw ~= nil and antiaim_func.normalize_angle(apply_yaw) or value,
                reason = reason or "candidate",
                weight = weight or 0,
            }
        end
    end

    local function angle_memory_refresh(memory)
        if memory == nil then return nil, 0, 0 end

        local best_yaw, best_rate, best_samples = nil, 0, 0
        local best_score = -1

        for _, node in pairs(memory.bins) do
            local hits = node.hits or 0
            local misses = node.misses or 0
            local samples = hits + misses

            if samples >= cfg.ANGLE_MEMORY_MIN_SAMPLES then
                local rate = (hits + 0.5) / (samples + 1)
                local score = rate + m_min(samples, 8) * 0.015

                if rate >= cfg.ANGLE_MEMORY_MIN_RATE and score > best_score then
                    best_yaw = node.yaw
                    best_rate = rate
                    best_samples = samples
                    best_score = score
                end
            end
        end

        memory.best_yaw = best_yaw
        memory.best_rate = best_rate
        memory.best_samples = best_samples

        return best_yaw, best_rate, best_samples
    end

    local function angle_memory_add(state, yaw, hit, weight)
        if state == nil or yaw == nil then return end

        weight = weight or 1
        if weight <= 0 then return end

        local memory = state.angle_memory
        if memory == nil then
            memory = new_angle_memory()
            state.angle_memory = memory
        end

        yaw = antiaim_func.normalize_angle(yaw)
        local bin = get_bin(yaw)
        local node = memory.bins[bin]

        if node == nil then
            node = { yaw = yaw, hits = 0, misses = 0 }
            memory.bins[bin] = node
        else
            node.yaw = antiaim_func.normalize_angle(node.yaw + antiaim_func.angle_diff(yaw, node.yaw) / 3)
        end

        if hit then
            node.misses = (node.misses or 0) * cfg.ANGLE_MEMORY_MISS_DECAY_ON_HIT
            node.hits = (node.hits or 0) + weight
        else
            node.hits = (node.hits or 0) * cfg.ANGLE_MEMORY_HIT_DECAY_ON_MISS
            node.misses = (node.misses or 0) + weight
        end

        table.insert(memory.list, 1, { bin = bin, hit = hit and true or false, weight = weight })

        while #memory.list > cfg.ANGLE_MEMORY_CAP do
            local removed = table.remove(memory.list)
            local old = removed and memory.bins[removed.bin] or nil
            if old ~= nil then
                local old_weight = removed.weight or 1
                if removed.hit then
                    old.hits = m_max((old.hits or 0) - old_weight, 0)
                else
                    old.misses = m_max((old.misses or 0) - old_weight, 0)
                end

                if (old.hits or 0) + (old.misses or 0) <= 0 then
                    memory.bins[removed.bin] = nil
                end
            end
        end

        angle_memory_refresh(memory)
    end

    local function angle_memory_best(state)
        local memory = state and state.angle_memory or nil
        if memory == nil then return nil, 0, 0 end

        return memory.best_yaw, memory.best_rate or 0, memory.best_samples or 0
    end

    local function brain_update(state, yaw, hit, weight)
        if state == nil or yaw == nil then return end

        weight = weight or 1
        if weight <= 0 then return end

        local side = sign(yaw)
        if side == 0 then return end

        local brain = state.brain
        if brain == nil then
            brain = new_brain()
            state.brain = brain
        end

        brain.left = (brain.left or 0) * cfg.BRAIN_DECAY
        brain.right = (brain.right or 0) * cfg.BRAIN_DECAY

        local main = (hit and cfg.BRAIN_HIT_WEIGHT or -cfg.BRAIN_MISS_WEIGHT) * weight
        local opposite = (hit and -(cfg.BRAIN_HIT_WEIGHT / 3) or (cfg.BRAIN_MISS_WEIGHT * (11 / 20))) * weight

        if side > 0 then
            brain.right = brain.right + main
            brain.left = brain.left + opposite
        else
            brain.left = brain.left + main
            brain.right = brain.right + opposite
        end

        brain.left = clamp(brain.left, -8, 8)
        brain.right = clamp(brain.right, -8, 8)
        brain.samples = m_min((brain.samples or 0) + weight, 64)
    end

    local function brain_get_side(state)
        local brain = state and state.brain or nil
        if brain == nil or (brain.samples or 0) < cfg.BRAIN_MIN_SAMPLES then
            return 0, 0
        end

        local delta = (brain.right or 0) - (brain.left or 0)
        local confidence = m_min(m_abs(delta) / 6, 1)
        if confidence < cfg.BRAIN_MIN_CONFIDENCE then
            return 0, confidence
        end

        return delta > 0 and 1 or -1, confidence
    end

    local function is_flat_delta(record)
        return m_abs(record.pose_yaw or 0) < 4
            and m_abs(record.lby_delta or 0) < 6
            and m_abs(record.goal_feet_delta or 0) < 6
            and m_abs(record.current_feet_delta or 0) < 6
    end

    local function get_playback_side(state, record)
        local previous = state.records[1]
        if previous == nil then return 0 end
        if record.speed2d < 2 then return 0 end

        local layer6_delta = record.layer6_playback - (previous.layer6_playback or 0)
        local layer3_delta = record.layer3_playback - (previous.layer3_playback or 0)
        local dominant_delta = m_abs(layer6_delta) >= m_abs(layer3_delta) and layer6_delta or layer3_delta
        record.playback_delta = dominant_delta

        if m_abs(dominant_delta) < 0.00001 then
            return 0
        end

        local yaw_delta = antiaim_func.angle_diff(record.eye_yaw, previous.eye_yaw)
        if yaw_delta == 0 then
            yaw_delta = antiaim_func.angle_diff(record.goal_feet_yaw, previous.goal_feet_yaw)
        end
        if yaw_delta == 0 then
            yaw_delta = record.goal_feet_delta
        end
        record.playback_yaw_delta = yaw_delta

        return sign(dominant_delta) * (sign(yaw_delta) ~= 0 and sign(yaw_delta) or 1)
    end

    local function create_candidates(state, record)
        local candidates = {}
        local max_desync = record.max_desync or 0
        local function add(value, reason, weight, apply_yaw)
            add_candidate(candidates, value, reason, weight, max_desync, apply_yaw)
        end

        local playback_side = get_playback_side(state, record)
        local brain_side, brain_confidence = brain_get_side(state)
        local memory_yaw, memory_rate, memory_samples = angle_memory_best(state)
        local pose_side = sign(record.pose_yaw)
        local lby_side = sign(record.lby_delta)
        local anim_side = sign(record.goal_feet_delta)
        local base_side = playback_side ~= 0 and playback_side or sign(record.simtime_base_yaw)
        if base_side == 0 then base_side = brain_side end
        if base_side == 0 then base_side = pose_side end
        if base_side == 0 then base_side = lby_side end
        if base_side == 0 then base_side = anim_side end
        if base_side == 0 then base_side = state.last_side end
        if base_side == 0 then base_side = 1 end

        record.flat_delta = is_flat_delta(record)
        record.playback_side = playback_side
        record.brain_side = brain_side
        record.brain_confidence = brain_confidence
        record.memory_yaw = memory_yaw
        record.memory_rate = memory_rate
        record.memory_samples = memory_samples
        record.last_miss_yaw = state.last_miss_yaw

        add(record.pose_yaw, "pose", record.flat_delta and 0.08 or 0.84)
        add(record.lby_delta, "lby", record.flat_delta and 0.06 or (record.speed2d > 35 and 0.72 or 0.48))
        add(record.goal_feet_delta, "goalfeet", record.flat_delta and 0.05 or 0.40)
        add(record.current_feet_delta, "currentfeet", record.flat_delta and 0.04 or 0.30)
        add(record.simtime_base_yaw, "simtime-base", record.simtime_checked and 1.18 or 0, record.simtime_fake_abs)
        add(record.approach_base_yaw, "approach-save", record.simtime_checked and 0.46 or 0.66)

        local memory_repeats_miss = state.miss_streak > 0
            and state.last_miss_yaw ~= nil
            and memory_yaw ~= nil
            and m_abs(antiaim_func.angle_diff(memory_yaw, state.last_miss_yaw)) < 10

        if memory_yaw ~= nil and not memory_repeats_miss then
            local memory_weight = 0.60 + (memory_rate or 0) * 0.55 + m_min(memory_samples or 0, 4) * 0.03
            if state.miss_streak > 0 then
                memory_weight = memory_weight * 0.55
            end
            add(memory_yaw, "memory-best", memory_weight)
        end

        if brain_side ~= 0 then
            add(brain_side * max_desync, "brain-side", 0.82 + (brain_confidence or 0) * 0.32)
        end

        if playback_side ~= 0 then
            add(playback_side * max_desync, "playback-side", 1.02)
        end

        add(base_side * max_desync, "max-side", record.flat_delta and 0.86 or 0.38)
        add(0, "center", record.flat_delta and 0.01 or 0.08)

        if state.last_candidate ~= nil and state.last_candidate ~= 0 then
            add(state.last_candidate, "last", state.hit_streak > 0 and 0.48 or 0.16)
            add(-state.last_candidate, "last-flip", state.miss_streak > 0 and 0.48 or 0.18)
        end

        if state.last_hit_yaw ~= nil and state.miss_streak <= 0 then
            add(state.last_hit_yaw, "last-hit", 0.54 + m_min(state.hit_streak, 3) * 0.08)
        end

        if state.miss_streak > 0 then
            local last_miss_yaw = state.last_miss_yaw or state.last_candidate or 0
            local miss_side = sign(last_miss_yaw)
            if miss_side == 0 then
                miss_side = base_side
            end
            add(-miss_side * max_desync, "miss-flip", 0.72 + m_min(state.miss_streak, 4) * 0.14)
        end

        return candidates
    end

    local function score_candidate(state, record, candidate)
        local value = candidate.value
        local score = candidate.weight or 0
        local abs_value = m_abs(value)
        local max_desync = record.max_desync or 0
        local ev = db_expected_value(record.identity, value)

        score = score + (ev - 0.5) * cfg.MISS_DB_EV_WEIGHT

        if record.pose_yaw ~= nil and (not record.flat_delta or m_abs(record.pose_yaw) > 4) then
            local diff = m_abs(antiaim_func.angle_diff(value, record.pose_yaw))
            score = score + cfg.POSE_WEIGHT * clamp(1 - diff / 42, 0, 1)
        end

        if record.lby_delta ~= nil and (not record.flat_delta or m_abs(record.lby_delta) > 6) then
            local diff = m_abs(antiaim_func.angle_diff(value, record.lby_delta))
            score = score + cfg.LBY_WEIGHT * clamp(1 - diff / 55, 0, 1)
        end

        if record.goal_feet_delta ~= nil and (not record.flat_delta or m_abs(record.goal_feet_delta) > 6) then
            local diff = m_abs(antiaim_func.angle_diff(value, record.goal_feet_delta))
            score = score + cfg.ANIM_WEIGHT * clamp(1 - diff / 50, 0, 1)
        end

        if record.simtime_checked and record.simtime_base_yaw ~= nil then
            local sim_diff = m_abs(antiaim_func.angle_diff(value, record.simtime_base_yaw))
            score = score + 0.55 * clamp(1 - sim_diff / 40, 0, 1)
        end

        if record.approach_base_yaw ~= nil then
            local approach_diff = m_abs(antiaim_func.angle_diff(value, record.approach_base_yaw))
            score = score + 0.22 * clamp(1 - approach_diff / 35, 0, 1)
        end

        if record.playback_side ~= 0 and sign(value) == record.playback_side and m_abs(abs_value - max_desync) < 2 then
            score = score + 0.34
        end

        if record.brain_side ~= 0 and sign(value) == record.brain_side and m_abs(abs_value - max_desync) < 2 then
            score = score + 0.18 + (record.brain_confidence or 0) * 0.28
        end

        if record.memory_yaw ~= nil then
            local memory_diff = m_abs(antiaim_func.angle_diff(value, record.memory_yaw))
            score = score + 0.42 * (record.memory_rate or 0) * clamp(1 - memory_diff / 32, 0, 1)
        end

        if state.miss_streak > 0 then
            local missed_yaw = state.last_miss_yaw or state.last_candidate
            local missed_side = sign(missed_yaw)

            if missed_yaw ~= nil then
                local miss_power = m_min(state.miss_streak, 4)
                local same_as_miss = m_abs(antiaim_func.angle_diff(value, missed_yaw)) < 10

                if same_as_miss then
                    score = score - cfg.MISS_FLIP_WEIGHT * miss_power
                elseif missed_side ~= 0 and sign(value) ~= missed_side and abs_value > 12 then
                    score = score + cfg.MISS_FLIP_WEIGHT * 0.82 * miss_power
                end

                if missed_side ~= 0 and sign(value) == missed_side and abs_value > max_desync - 3 then
                    score = score - cfg.MISS_FLIP_WEIGHT * 0.42 * miss_power
                end
            end
        end

        if state.hit_streak > 0 and state.last_hit_yaw ~= nil then
            local hit_diff = m_abs(antiaim_func.angle_diff(value, state.last_hit_yaw))
            score = score + 0.22 * m_min(state.hit_streak, 3) * clamp(1 - hit_diff / 45, 0, 1)
        end

        return score, ev
    end

    local function candidate_repeats_miss(state, record, candidate)
        if state == nil or record == nil or candidate == nil or state.last_miss_yaw == nil then
            return false
        end

        local value = candidate.value
        if value == nil then return false end

        local missed_yaw = state.last_miss_yaw
        if m_abs(antiaim_func.angle_diff(value, missed_yaw)) < 10 then
            return true
        end

        local missed_side = sign(missed_yaw)
        local value_side = sign(value)
        local max_desync = record.max_desync or 0

        return (state.miss_streak or 0) >= 2
            and missed_side ~= 0
            and value_side == missed_side
            and m_abs(value) > max_desync - 4
    end

    local function get_candidate_by_reason(candidates, reason)
        for _, candidate in pairs(candidates) do
            if candidate.reason == reason then
                return candidate
            end
        end

        return nil
    end

    local function select_candidate(state, record)
        local candidates = create_candidates(state, record)
        local best, second = nil, nil

        for _, candidate in pairs(candidates) do
            local score, ev = score_candidate(state, record, candidate)
            candidate.score = score
            candidate.ev = ev

            if best == nil or candidate.score > best.score then
                second = best
                best = candidate
            elseif second == nil or candidate.score > second.score then
                second = candidate
            end
        end

        if best == nil then
            best = { value = 0, score = 0, ev = 0.5, reason = "none" }
        end

        if (state.miss_streak or 0) >= 2 and candidate_repeats_miss(state, record, best) then
            local flip = get_candidate_by_reason(candidates, "miss-flip")

            if flip ~= nil and not candidate_repeats_miss(state, record, flip) then
                local old_score = best.score or 0
                second = best
                best = flip
                best.score = m_max(best.score or 0, old_score + 0.15 + m_min(state.miss_streak or 0, 4) * 0.08)
                best.reason = "miss-flip-safe"
            else
                local missed_side = sign(state.last_miss_yaw)
                if missed_side ~= 0 then
                    local value = antiaim_func.normalize_angle(-missed_side * (record.max_desync or 0))
                    if value ~= nil then
                        second = best
                        best = {
                            value = value,
                            apply_yaw = value,
                            score = (best.score or 0) + 0.25 + m_min(state.miss_streak or 0, 4) * 0.10,
                            ev = db_expected_value(record.identity, value),
                            reason = "miss-panic-flip",
                        }
                    end
                end
            end
        end

        local confidence = second and clamp(best.score - second.score, 0, 2) / 2 or 0.5
        return best, confidence
    end

    local function should_resolve(state, record)
        if record == nil then return false end

        if state.miss_streak > 0 then return true end
        if client.current_threat() == record.ent then return true end
        if record.choked > 0 then return true end
        if record.speed2d < 180 then return true end
        if m_abs(record.pose_yaw or 0) > 4 then return true end
        if m_abs(record.lby_delta or 0) > 8 then return true end

        return false
    end

    local function handle_player(ent)
        if ent == nil or not entity.is_alive(ent) or entity.is_dormant(ent) then
            set_player_correction(ent, false, 0)
            return
        end

        local state = get_player_state(ent)
        local record = build_record(ent, state)
        if record == nil then
            set_player_correction(ent, false, 0)
            return
        end

        local candidate, confidence = select_candidate(state, record)
        store_record(state, record)

        local active = should_resolve(state, record)
        if active then
            set_player_correction(ent, true, candidate.apply_yaw or candidate.value)
        else
            set_player_correction(ent, false, 0)
        end

        state.last_candidate = candidate.value
        state.last_score = candidate.score
        state.last_ev = candidate.ev
        state.last_reason = candidate.reason
        state.last_confidence = confidence
        state.last_side = sign(candidate.value) ~= 0 and sign(candidate.value) or state.last_side
        state.last_record = record
        state.last_update_tick = globals.tickcount()
    end

    local function on_net_update()
        if not menu.ragebot.resolver:get() then
            reset_all_corrections()
            return
        end

        local local_player = entity.get_local_player()
        if local_player == nil or not entity.is_alive(local_player) then
            reset_all_corrections()
            return
        end

        client.update_player_list()
        db_decay(globals.tickcount())

        local seen = {}
        local enemies = entity.get_players(true)
        for i = 1, #enemies do
            local ent = enemies[i]
            seen[ent] = true
            handle_player(ent)
        end

        local tick = globals.tickcount()
        for ent, state in pairs(runtime.players) do
            if not seen[ent] and (tick - (state.last_update_tick or 0)) > cfg.ACTIVE_MEMORY_TICKS then
                set_player_correction(ent, false, 0)
            end
        end

        for id, shot in pairs(runtime.shots) do
            if tick - (shot.tick or tick) > 256 then
                runtime.shots[id] = nil
            end
        end
    end

    local function add_result_to_db(identity, yaw, hit, weight)
        local target_node = get_db_node(miss_db.by_target, identity)

        if hit then
            db_add_hit(miss_db.global, yaw, weight)
            db_add_hit(target_node, yaw, weight)
        else
            db_add_miss(miss_db.global, yaw, weight)
            db_add_miss(target_node, yaw, weight)
        end
    end

    local function should_train_miss(reason)
        reason = tostring(reason or "unknown")
        local lower = string.lower(reason)

        if lower == "spread" or lower == "death" then return false end
        if string.find(lower, "damage", 1, true) ~= nil then return false end
        if string.find(lower, "prediction", 1, true) ~= nil then return false end

        return true
    end

    local hitgroup_names = {
        [0] = "generic",
        [1] = "head",
        [2] = "chest",
        [3] = "stomach",
        [4] = "left arm",
        [5] = "right arm",
        [6] = "left leg",
        [7] = "right leg",
        [8] = "neck",
    }

    local function get_event_hitgroup(event)
        if event == nil then return nil end

        local hitgroup = event.hitgroup
        if hitgroup == nil then
            hitgroup = event.hit_group
        end
        if hitgroup == nil then
            hitgroup = event.aim_hitgroup
        end
        if hitgroup == nil then
            hitgroup = event.target_hitgroup
        end

        local numeric = hitgroup ~= nil and tonumber(hitgroup) or nil
        if numeric ~= nil then
            return numeric
        end

        if type(hitgroup) == "string" then
            local lower = string.lower(hitgroup)
            if lower == "head" then return 1 end
            if lower == "chest" then return 2 end
            if lower == "stomach" then return 3 end
            if lower == "left arm" then return 4 end
            if lower == "right arm" then return 5 end
            if lower == "left leg" then return 6 end
            if lower == "right leg" then return 7 end
            if lower == "neck" then return 8 end
        end

        return nil
    end

    local function get_hitgroup_name(hitgroup)
        if hitgroup == nil then return "unknown" end
        return hitgroup_names[hitgroup] or tostring(hitgroup)
    end

    local function get_resolver_train_weight(hitgroup, hit)
        if hitgroup == nil then
            return hit and (1 / 5) or (7 / 20), true
        end

        if hitgroup == 1 or hitgroup == 8 then
            return 1, true
        end

        if hitgroup == 3 then
            return hit and 0.55 or 0.78, true
        end

        if hitgroup == 2 then
            return hit and 0.45 or 0.68, true
        end

        if hitgroup == 6 or hitgroup == 7 then
            return hit and (21 / 50) or (31 / 50), true
        end

        if hitgroup == 4 or hitgroup == 5 then
            return hit and 0.18 or 0.32, true
        end

        return hit and 0.12 or 0.24, true
    end

    local function on_aim_fire(event)
        if not menu.ragebot.resolver:get() then return end
        if event == nil or event.id == nil or event.target == nil then return end

        local ent = event.target
        local state = runtime.players[ent]
        local record = state and state.last_record or nil

        runtime.shots[event.id] = {
            target = ent,
            identity = state and state.identity or get_identity(ent),
            yaw = state and state.last_candidate or 0,
            reason = state and state.last_reason or "unknown",
            hitgroup = get_event_hitgroup(event),
            tick = globals.tickcount(),
            speed2d = record and record.speed2d or 0,
            choked = record and record.choked or 0,
        }
    end

    local function on_aim_hit(event)
        if event == nil or event.id == nil then return end

        local shot = runtime.shots[event.id]
        if shot == nil then return end

        local hitgroup = get_event_hitgroup(event) or shot.hitgroup
        local train_weight, reliable_hit = get_resolver_train_weight(hitgroup, true)
        if reliable_hit then
            add_result_to_db(shot.identity, shot.yaw, true, train_weight)
        end

        local state = runtime.players[shot.target]
        if state ~= nil then
            state.miss_streak = 0
            state.last_miss_yaw = nil
            state.last_miss_reason = nil
            state.last_miss_hitgroup = nil

            if reliable_hit then
                angle_memory_add(state, shot.yaw, true, train_weight)
                brain_update(state, shot.yaw, true, train_weight)

                if train_weight >= 0.85 then
                    state.hit_streak = m_min((state.hit_streak or 0) + 1, 8)
                    state.last_hit_yaw = shot.yaw
                else
                    state.hit_streak = 0
                    state.last_hit_yaw = nil
                end
            else
                state.hit_streak = 0
                state.last_hit_yaw = nil
            end
        end

        push_log(string.format(
            "hit %s yaw %.1f %s via %s",
            tostring(entity.get_player_name(shot.target) or shot.target),
            shot.yaw,
            get_hitgroup_name(hitgroup),
            shot.reason
        ))
        runtime.shots[event.id] = nil
    end

    local function on_aim_miss(event)
        if event == nil or event.id == nil then return end

        local shot = runtime.shots[event.id]
        if shot == nil then return end

        local reason = tostring(event.reason or "unknown")
        local hitgroup = get_event_hitgroup(event) or shot.hitgroup
        local train_weight, reliable_miss = get_resolver_train_weight(hitgroup, false)

        if should_train_miss(reason) and reliable_miss then
            add_result_to_db(shot.identity, shot.yaw, false, train_weight)

            local state = runtime.players[shot.target]
            if state ~= nil then
                state.miss_streak = m_min((state.miss_streak or 0) + train_weight, 8)
                state.hit_streak = 0
                state.last_hit_yaw = nil
                state.last_miss_yaw = shot.yaw
                state.last_miss_tick = globals.tickcount()
                state.last_miss_reason = reason
                state.last_miss_hitgroup = hitgroup
                angle_memory_add(state, shot.yaw, false, train_weight)
                brain_update(state, shot.yaw, false, train_weight)
            end

            push_log(string.format(
                "miss %s yaw %.1f %s reason %s",
                tostring(entity.get_player_name(shot.target) or shot.target),
                shot.yaw,
                get_hitgroup_name(hitgroup),
                reason
            ))
        end

        runtime.shots[event.id] = nil
    end

    local function on_round_reset()
        reset_all_corrections()
        runtime.shots = {}

        for _, state in pairs(runtime.players) do
            state.records = {}
            state.records_by_tick = {}
            state.last_sim_tick = -1
            state.last_anim_update_time = nil
            state.approach_abs_yaw = nil
            state.miss_streak = 0
            state.hit_streak = 0
            state.last_hit_yaw = nil
            state.last_miss_yaw = nil
            state.last_miss_tick = 0
            state.last_miss_reason = nil
            state.last_miss_hitgroup = nil
        end
    end

    menu.ragebot.resolver:set_callback(function()
        reset_all_corrections()
        local en_st = menu.ragebot.resolver:get()
        utils.set_event_callback("net_update_end", on_net_update, en_st)
        utils.set_event_callback("aim_fire", on_aim_fire, en_st)
        utils.set_event_callback("aim_hit", on_aim_hit, en_st)
        utils.set_event_callback("aim_miss", on_aim_miss, en_st)
        utils.set_event_callback("round_start", on_round_reset, en_st)
        utils.set_event_callback("cs_game_disconnected", on_round_reset, en_st)
        utils.set_event_callback("shutdown", reset_all_corrections, en_st)
    end)

end

local auto_os do
    
    local original_dt_hotkey_type_string = "On hotkey" 
    local original_os_hotkey_type_string = "Always on" 
    local is_hs_mode_active = false 

    local function get_hotkey_status_string(hotkey_type_number)
        return hotkey_type_number == 0 and "Always on" or
               hotkey_type_number == 1 and "On hotkey" or
               hotkey_type_number == 2 and "Toggle" or
               hotkey_type_number == 3 and "Off hotkey" or "Always on"
    end

    local function auto_headshots_hotkey()
        local lp = entity.get_local_player()
        
        if not entity.is_alive(lp) then
            is_hs_mode_active = false
            return
        end

        local current_aa_state = antiaim.state()
        local current_weapon_idx = entity.get_prop(entity.get_player_weapon(lp), "m_iItemDefinitionIndex")
        local current_weapon_name = helpers.get_weapon_type(current_weapon_idx)

        local selected_conditions = menu.ragebot.cond:get()
        local selected_weapons = menu.ragebot.weapon:get()

        local condition_match = false
        
        local condition_map = {
            ["Crouch+"] = menu.ragebot.cond:get("Crouch+"),
            ["Crouch"] = menu.ragebot.cond:get("Crouch"),
            ["Aerobic+"] = menu.ragebot.cond:get("Aerobic+"),
            ["Aerobic"] = menu.ragebot.cond:get("Aerobic"),
            ["Walking"] = menu.ragebot.cond:get("Walking"),
            ["Moving"] = menu.ragebot.cond:get("Running"),
            ["Standing"] = menu.ragebot.cond:get("Standing"),
        }

        condition_match = condition_map[current_aa_state]

        local weapon_match = false
        for _, wpn in ipairs(selected_weapons) do
            if string.lower(wpn) == current_weapon_name then
                weapon_match = true
                break
            end
        end

        local should_be_active = condition_match and weapon_match

        if should_be_active then
            
            if not is_hs_mode_active then
                
                local _, dt_type_number = ref.dt[1]:get_hotkey()
                local _, os_type_number = ref.os[1]:get_hotkey()

                original_dt_hotkey_type_string = get_hotkey_status_string(dt_type_number)
                original_os_hotkey_type_string = get_hotkey_status_string(os_type_number)

                ref.dt[1]:set_hotkey("On hotkey")

                ref.os[1]:set_hotkey("Always On")
                
                is_hs_mode_active = true
            end

        else
            if is_hs_mode_active then

                ref.dt[1]:set_hotkey(original_dt_hotkey_type_string)
                ref.os[1]:set_hotkey(original_os_hotkey_type_string)
                
                is_hs_mode_active = false
            end
        end
    end

    local is_callback_active = false

    local function update_logic_state()
        local selected_conditions = menu.ragebot.cond:get()
        local selected_weapons = menu.ragebot.weapon:get()

        local should_logic_run = #selected_conditions > 0 and #selected_weapons > 0

        if should_logic_run ~= is_callback_active then
            utils.set_event_callback("setup_command", auto_headshots_hotkey, should_logic_run)
            is_callback_active = should_logic_run

            if not should_logic_run and is_hs_mode_active then
                ref.dt[1]:set_hotkey(original_dt_hotkey_type_string)
                ref.os[1]:set_hotkey(original_os_hotkey_type_string)
                is_hs_mode_active = false
            end
        end
    end

    menu.ragebot.cond:set_callback(update_logic_state)
    menu.ragebot.weapon:set_callback(update_logic_state)
end

local is_air_act = false       

local auto_stop_air = {} do
    function auto_stop_air.is_enemy_visible(local_player, enemy)
        local local_player_origin = {entity.get_origin(local_player)}
        local enemy_origin = {entity.get_origin(enemy)}
        if local_player_origin[1] == nil or enemy_origin[1] == nil then
            return false
        end

        local trace_fraction, _ = client.trace_bullet(
            local_player,
            local_player_origin[1],
            local_player_origin[2],
            local_player_origin[3] + 16,
            enemy_origin[1],
            enemy_origin[2],
            enemy_origin[3] + 16
        )
        return trace_fraction
    end
    
    function auto_stop_air.angle_math (x, y)
        local angle_x_sin = math.sin(math.rad(x))
        local angle_x_cos = math.cos(math.rad(x))
        local angle_y_sin = math.sin(math.rad(y))
        local angle_y_cos = math.cos(math.rad(y))
        return angle_x_cos * angle_y_cos, angle_x_cos * angle_y_sin, -angle_x_sin
    end

    function auto_stop_air.paint()
        if not scout.jumpstop_hotkey:get() then
            return
        end
        if not (menu.visuals.ui_main:get("Keybinds") and menu.visuals.hotkey_item:get("Jump scout")) then
            renderer.indicator(230, 230, 230, 230, "JS")
        end
    end
    
    function auto_stop_air.setup(e)
        local me = entity.get_local_player()
        if not me or not entity.is_alive(me) then
            return
        end
        local gun = entity.get_player_weapon(me)
        if not gun or entity.get_classname(gun) ~= 'CWeaponSSG08' then
            return
        end

        local flags = entity.get_prop(me, "m_fFlags")
        is_air_act = bit.band(flags, 1) == 0

        if not is_air_act then
            ref.delay_shot:override()
            return
        end

        if not scout.jumpstop_hotkey:get() then
            ref.delay_shot:override()
            return
        end
      
        ref.delay_shot:override(scout.jumpstop_delay:get())
    
        local scoped = entity.get_prop(me, 'm_bIsScoped') == 1
        if not scoped then 
            return
        end

        local enemy = client.current_threat()
        if not enemy or not entity.is_alive(enemy) then return end
        local lpvec = vector(entity.get_prop(me, 'm_vecOrigin'))
        local envec = vector(entity.get_prop(enemy, 'm_vecOrigin'))
        local dist = anti_knife_dist(lpvec.x, lpvec.y, lpvec.z, envec.x, envec.y, envec.z)

        if auto_stop_air.is_enemy_visible(me, enemy) then
            if scout.jumpstop_distance:get() > 350 then
                if dist >= scout.jumpstop_distance:get() then
                    return
                end
            end

            local velocity = vector(entity.get_prop(me, 'm_vecVelocity'))
            local speed = velocity:length2d()

            if speed < 5 then
                e.forwardmove = 0
                e.sidemove = 0
                return
            end

            e.quick_stop = true
            local velocity_angles = vector(velocity:angles())
            local camera_angles = vector(client.camera_angles())
            velocity_angles.y = camera_angles.y - velocity_angles.y
            local calc_x, calc_y = auto_stop_air.angle_math(velocity_angles.x, velocity_angles.y)
            local sidespeed = -cvar.cl_sidespeed:get_float()
            local final_x = sidespeed * calc_x
            local final_y = sidespeed * calc_y
            e.in_speed = 1
            e.forwardmove = final_x
            e.sidemove = final_y
        end
    end
      
    client.set_event_callback("setup_command", auto_stop_air.setup)
    client.set_event_callback("paint_ui", auto_stop_air.paint)
end

local automatic_teleport do

    local state_en = true

    local function is_option_selected(option_name)
        local selected = menu.ragebot.auto_tp_opt and menu.ragebot.auto_tp_opt:get() or {}
        if not selected then return false end
        for _, name in ipairs(selected) do
            if name == option_name then return true end
        end
        return false
    end

    local function is_peeking_enemy()
        local enemies = entity.get_players(true)
        if #enemies == 0 then return false end

        for _, enemy_idx in ipairs(enemies) do
            local esp_data = entity.get_esp_data(enemy_idx)
            if esp_data and not entity.is_dormant(enemy_idx) then
                if bit.band(esp_data.flags, bit.lshift(1, 11)) ~= 0 then
                    return true
                end
            end
        end
        return false
    end

    local function get_weapon_t(ent)
        if not ent then return nil end
        local idx = bit.band(entity.get_prop(ent, "m_iItemDefinitionIndex"), 0xFFFF)
        if not idx then return nil end
        
        if idx == 31 then return "Zeus" end
        local class = entity.get_classname(ent)
        if class == "CKnife" or string.find(class, "Knife") then return "Knife" end
        
        if idx == 40 then return "Scout" end
        if idx == 1 or idx == 64 then return "Deagle" end 
        if idx == 9 then return "Awp" end

        local pistols = {2, 3, 4, 30, 32, 36, 61, 63}
        for _, v in pairs(pistols) do if idx == v then return "Pistols" end end
        
        return nil
    end

    local state = {
        was_peeking = false,
        recharge_tick = 0, 
    }

    local function on_setup_command(cmd)
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then 
            state.was_peeking = false
            return 
        end

        if not menu.ragebot.auto_tp_hot:get() then 
            state_en = false
            return 
        end

        if state.recharge_tick > globals.tickcount() then
            return 
        end

        local currently_peeking = is_peeking_enemy()
        local trigger = false

        if is_option_selected("Break") then
            if currently_peeking then trigger = true end
        else
            if not state.was_peeking and currently_peeking then trigger = true end
        end

        if trigger then
            local safe_to_tp = true

            local weapon_ent = entity.get_player_weapon(lp)
            local current_group = get_weapon_t(weapon_ent)
            local selected_weapons = menu.ragebot.auto_tp_wp:get()
            local is_weapon_allowed = false
            if current_group then
                for _, menu_item in ipairs(selected_weapons) do
                    if menu_item == current_group then is_weapon_allowed = true; break end
                end
            end
            if not is_weapon_allowed then safe_to_tp = false end

            local is_ignore_jump = is_option_selected("Ignore JumpScout")
            local is_jumpstop_active = scout.jumpstop_hotkey:get()
            local skip_air_check = false

            if is_jumpstop_active then
                if is_ignore_jump then
                    skip_air_check = true
                else
                    safe_to_tp = false
                end
            end

            if not skip_air_check and menu.ragebot.auto_tp_air_check:get() then
                local aa_state = antiaim.state() 
                if aa_state ~= "Aerobic" and aa_state ~= "Aerobic+" then safe_to_tp = false end
            end

            if not ref.dt[1]:get() and ref.dt[1]:get_hotkey() then 
                safe_to_tp = false 
            end


            if safe_to_tp then
                cmd.discharge_pending = true
 
                local delay = menu.ragebot.auto_tp_delay:get() 
                state.recharge_tick = (globals.tickcount() + delay) 

            end
        end

        state.was_peeking = currently_peeking
        
    end

    local function on_net_update_end()
        if not menu.ragebot.auto_tp_hot:get() then return end
        
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then return end

        if state.recharge_tick > 0 then
            if globals.tickcount() < state.recharge_tick then
                if ref.dt[1]:get() then
                    ref.dt[1]:override(false)
                end
            else
                if not ref.dt[1]:get()then
                    ref.dt[1]:override(true)
                end
                state.recharge_tick = 0
            end
        end
    end

    local function paint()  
        if not (menu.ragebot.auto_tp_hot:get() and entity.is_alive(entity.get_local_player())) then
            return
        end
        if not (menu.visuals.ui_main:get("Keybinds") and menu.visuals.hotkey_item:get("Automatic teleport")) then
            renderer.indicator(230, 230, 230, 230, "AT")
        end
    end
    
    utils.set_event_callback("paint_ui", paint, state_en)
    utils.set_event_callback("setup_command", on_setup_command, state_en)
    utils.set_event_callback("net_update_end", on_net_update_end, state_en)
end

local magic_key = {} do
    local state_en = true
    function magic_key.on_setup_command()
        local is_key_active = menu.ragebot.magic_key:get()
        
        local override_values = menu.ragebot.magic_hitbox:get()

        if override_values == nil or #override_values == 0 then 
            return 
        end

        if is_key_active then
            ref.target_hitbox:override(override_values)
            ref.multi_point:override(override_values) 
            ref.unsafe_box:override(" ")
            state_en = true
        else
            ref.target_hitbox:override()
            ref.multi_point:override()
            ref.unsafe_box:override()
            state_en = false
        end
    end

    function magic_key.paint() 
        local lp = entity.get_local_player()
        if not (menu.ragebot.magic_key:get() and entity.is_alive(lp)) then
            return
        end
        if not (menu.visuals.ui_main:get("Keybinds") and menu.visuals.hotkey_item:get("Magic key")) then
            renderer.indicator(230, 230, 230, 230, "MK")
        end
    end
    
    utils.set_event_callback("paint_ui", magic_key.paint, state_en)
    utils.set_event_callback("setup_command", magic_key.on_setup_command, state_en)
end

local aim_hit_check = false

local is_noscope_active = false   
local noscope do
    local weapon_enabled = false
    local function setup()
        is_noscope_active = false 
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then return end
        local enemy = client.current_threat()
        if not enemy then return end

        local weapon = entity.get_player_weapon(lp)
        if not weapon then return end
        local weapon_idx = entity.get_prop(weapon, "m_iItemDefinitionIndex")
        local weapon_type = helpers.get_weapon_type(weapon_idx)
        local hitchance = menu.ragebot.noscope_hit:get()

        local weapon_enabled = false

        if weapon_type then
            local weapon_cond = {
                ["scout"] = menu.ragebot.noscope_wp:get("Scout"),
                ["awp"] = menu.ragebot.noscope_wp:get("AWP"),
                ["auto"] = menu.ragebot.noscope_wp:get("Auto")
            }
            weapon_enabled = weapon_cond[weapon_type]
        end

        local lpvec = vector(entity.get_prop(lp, 'm_vecOrigin'))
        local envec = vector(entity.get_prop(enemy, 'm_vecOrigin'))
        local dist = anti_knife_dist(lpvec.x, lpvec.y, lpvec.z, envec.x, envec.y, envec.z)

        if weapon_enabled then
            if dist <= menu.ragebot.noscope_dist:get() * 10 then
                ref.auto_scop:override(false)
                if hitchance > 0 and not aim_hit_check then
                    ref.hitchance:override(hitchance)
                    is_noscope_active = true
                end
            else
                ref.auto_scop:override()
            end
        else
            ref.auto_scop:override()
        end
    end

    client.set_event_callback("setup_command", setup)  
end

local automatic_peek do
    local CONFIG = {
        POINTS_AMOUNT = 4,
        STEP_DISTANCE = 22,
        MAX_STEP_HEIGHT = 18,
        RETURN_THRESHOLD = 0.15,
        VELOCITY_TOLERANCE = 1.011,
        ESP_ALPHA_THRESHOLD = 0.75,
        DAMAGE_MULTIPLIER_HEAD = 4,
        VISUAL_FADE_SPEED = 0.045,
        POSITION_LERP_SPEED = 0.02,
        TRACE_MASK = 0x201400B,
        GROUND_TRACE_DEPTH = 240,
        HORIZONTAL_CHECK_OFFSETS = {0, 8, -8},
        r8 = 3,
        BACKTRACK_REDUCE = 0.4, 
        PEEKING_ESP_FLAG = bit.lshift(1, 11),
        SAFE_DAMAGE_MARGIN = 6,
        PEEK_LOST_GRACE = 0.16,
        PEEK_SHOT_TIMEOUT = 0.72,
    }

    local MODE_CONFIGS = {
        aggressive = {
            max_peeking_enemies = nil,
            require_lethal = false,
            require_safe_position = false,
            safe_hc_floor = 0,
            extra_delay = 0.00,
            max_incoming_damage_frac = 1.00,
            max_total_incoming_damage_frac = 1.00,
            max_threatening_enemies = 16,
        },
        balanced = {
            max_peeking_enemies = 2,
            require_lethal = false,
            require_safe_position = false,
            safe_hc_floor = 0,
            extra_delay = 0.02,
            max_incoming_damage_frac = 0.92,
            max_total_incoming_damage_frac = 1.00,
            max_threatening_enemies = 2,
        },
        safe = {
            max_peeking_enemies = 2,
            require_lethal = true,
            require_safe_position = true,
            safe_hc_floor = 72,
            extra_delay = 0.05,
            max_incoming_damage_frac = 0.55,
            max_total_incoming_damage_frac = 0.80,
            max_threatening_enemies = 1,
        }
    }

    local smoothy = {
        to_pairs = {
            vector = {'x', 'y', 'z'},
            imcolor =  {'r', 'g', 'b', 'a'}
        },
    
        get_type = function(self, value)
            local val_type = type(value)
            if val_type == 'cdata' and value.x and value.y and value.z then
                return 'vector'
            elseif val_type == 'cdata' and value.r and value.g and value.b and value.a then
                return 'imcolor'
            elseif val_type == 'userdata' and value.__type then
                return string.lower(value.__type.name)
            end
            return val_type
        end,
    
        copy_tables = function(self, destination, keysTable, valuesTable)
            valuesTable = valuesTable or keysTable
            local mt = getmetatable(keysTable)
            if mt and getmetatable(destination) == nil then
                setmetatable(destination, mt)
            end
    
            for k, v in pairs(keysTable) do
                if type(v) == 'table' then
                    destination[k] = self:copy_tables({}, v, valuesTable[k])
                else
                    local value = valuesTable[k]
                    if type(value) == 'boolean' then
                        value = value and 1 or 0
                    end
                    destination[k] = value
                end
            end
    
            return destination
        end,
    
        resolve = function(self, easing_fn, previous, new, clock, duration)
            if type(new) == 'boolean' then new = new and 1 or 0 end
            if type(previous) == 'boolean' then previous = previous and 1 or 0 end
            
            local result = easing_fn(clock, previous, new - previous, duration)
            
            if type(new) == 'number' then
                if math.abs(new - result) <= 0.001 then
                    return new
                else
                    local frac = result % 1
                    if frac < 0.0001 then
                        return math.floor(result)
                    elseif frac > 0.9999 then
                        return math.ceil(result)
                    end
                end
            end
            
            return result
        end,

        perform_easing = function(self, ntype, easing_fn, previous, new, clock, duration)
            if self.to_pairs[ntype] then
                for _, key in ipairs(self.to_pairs[ntype]) do
                    previous[key] = self:perform_easing(
                        type(previous[key]), easing_fn,
                        previous[key], new[key],
                        clock, duration
                    )
                end
                return previous
            end
    
            if ntype == 'table' then
                for k, v in pairs(new) do
                    previous[k] = previous[k] or v
                    previous[k] = self:perform_easing(
                        type(v), easing_fn,
                        previous[k], v,
                        clock, duration
                    )
                end
                return previous
            end
    
            return self:resolve(easing_fn, previous, new, clock, duration)
        end,
    
        new = function(this, default, easing_fn)
            if type(default) == 'boolean' then
                default = default and 1 or 0
            end
    
            local data = {
                value = default or 0,
                easing = easing_fn or function(t, b, c, d)
                    return c * t / d + b
                end
            }
            
            local mt = {
                update = function(_, duration, value, easing)
                    if type(value) == 'boolean' then
                        value = value and 1 or 0
                    end
    
                    local clock = globals.frametime()
                    duration = duration or 0.15
                    local value_type = this:get_type(value)
                    local target_type = this:get_type(data.value)
    
                    assert(value_type == target_type, string.format('type mismatch. expected %s (received %s)', target_type, value_type))
    
                    if data.value == value then
                        return value
                    end
    
                    if clock <= 0 or clock >= duration then
                        if target_type == 'imcolor' or target_type == 'vector' then
                            data.value = value:clone()
                        elseif target_type == 'table' then
                            this:copy_tables(data.value, value)
                        else
                            data.value = value
                        end
                    else
                        easing = easing or data.easing
    
                        data.value = this:perform_easing(
                            target_type, easing,
                            data.value, value,
                            clock, duration
                        )
                    end
    
                    return data.value
                end
            }
    
            return setmetatable(mt, {
                __metatable = false,
                __call = mt.update,
                __index = data
            })
        end,
    
        new_interp = function(this, initial_value)
            return setmetatable({
                previous = initial_value or 0
            }, {
                __call = function(self, new_value, mul)
                    mul = mul or 1
                    local tickinterval = globals.tickinterval()
                    if tickinterval == 0 then return self.previous end
                    
                    local ft = globals.frametime()
                    local time = math.min(tickinterval * mul, ft) / tickinterval
                    local diff = new_value - self.previous
    
                    if math.abs(diff) > 0 then
                        self.previous = self.previous + time * diff
                    else
                        self.previous = new_value
                    end
    
                    if self.previous % 1 < 0.0001 then
                        self.previous = 0
                    end
    
                    return self.previous
                end
            })
        end
    }

    local common = {
        extend_vector = function(pos, length, angle)
            local rad = angle * math.pi / 180
            return vector(
                pos.x + math.cos(rad) * length,
                pos.y + math.sin(rad) * length,
                pos.z
            )
        end,

        extrapolate_position = function(ent, origin, ticks, inverted)
            local tickinterval = globals.tickinterval()
            local gravity = cvar.sv_gravity:get_float() * tickinterval * CONFIG.BACKTRACK_REDUCE
            local jump_impulse = cvar.sv_jump_impulse:get_float() * tickinterval
            
            local velocity = vector(entity.get_prop(ent, 'm_vecVelocity'))
            local pos = origin
            local is_in_air = bit.band(entity.get_prop(ent, 'm_fFlags') or 0, 1) == 0
            
            for i = 1, ticks do
                local prev_pos = pos
                local z_vel = velocity.z + (is_in_air and -gravity or 0)
                
                pos = vector(
                    pos.x + (inverted and -velocity.x or velocity.x) * tickinterval,
                    pos.y + (inverted and -velocity.y or velocity.y) * tickinterval,
                    pos.z + (inverted and -z_vel or z_vel) * tickinterval
                )
                
                local fraction = client.trace_line(
                    ent,
                    prev_pos.x, prev_pos.y, prev_pos.z,
                    pos.x, pos.y, pos.z
                )
                
                if fraction <= 0.99 then
                    return prev_pos
                end
            end
            
            return pos
        end,

        set_movement = function(cmd, destination, local_player)
            local my_pos = vector(entity.get_origin(local_player))
            local angle = vector(my_pos:to(destination):angles()).y
            
            cmd.in_forward = 1
            cmd.in_back = 0
            cmd.in_moveleft = 0
            cmd.in_moveright = 0
            cmd.in_speed = 0
            cmd.forwardmove = 800
            cmd.sidemove = 0
            cmd.move_yaw = angle
        end,

        colored_text = function(text, clr)
            return string.format('\a%02x%02x%02x%02x%s', 
                math.floor(clr[1]), math.floor(clr[2]), 
                math.floor(clr[3]), math.floor(clr[4]), text)
        end,

        gradient_text = function(text, c1, c2, fraction, gradient)
            c2 = c2 or c1
            fraction = math.max(0, math.min(1, fraction))
            
            if fraction == 0 then return common.colored_text(text, c2) end
            if fraction == 1 then return common.colored_text(text, c1) end
            
            local len = #text
            local result = {}
            
            for i = 1, len do
                local weight = gradient and 
                    ((1 - fraction) - (len - i) / (len - 1)) + (1 - fraction) or
                    (i - fraction * len) / len
                weight = math.max(0, math.min(1, weight))
                
                local color = {
                    smoothy.lerp(c1[1], c2[1], weight),
                    smoothy.lerp(c1[2], c2[2], weight),
                    smoothy.lerp(c1[3], c2[3], weight),
                    smoothy.lerp(c1[4], c2[4], weight)
                }
                
                result[i] = common.colored_text(text:sub(i, i), color)
            end
            
            return table.concat(result)
        end
    }

    local exploit = {
        active = false,
        charged = false,
        disabled = false,
        doubletap = {},
        hideshots = {},
        defensive = {}
    }

    exploit.defensive = {
        active = false,
        active_until = 0,
        ticks_from_activation = 0,
        disabled = false,
        forced = false,
        hold_ticks = 4,

        reset = function(self)
            self.active = false
            self.active_until = 0
            self.ticks_from_activation = 0
            self.disabled = false
            self.forced = false
        end,

        disable = function(self) self.disabled = true end,

        force = function(self, cmd)
            local tickcount = globals.tickcount()
            self.active_until = math.max(self.active_until, tickcount + self.hold_ticks)
            self.active = true
            self.forced = true
            if cmd then cmd.force_defensive = true end
        end,

        on_setup_command = function(self, cmd)
            if not exploit.charged then
                self:reset()
                return
            end
            
            if self.disabled then
                self.disabled = false
            end
            
            if self.forced then
                cmd.force_defensive = true
            end

            local tickcount = globals.tickcount()
            self.active = self.active_until > tickcount
            if self.active then
                self.ticks_from_activation = self.hold_ticks - (self.active_until - tickcount)
            else
                self.ticks_from_activation = 0
                self.forced = false
            end
        end
    }

    exploit.doubletap = {
        active = false,
        charged = false,
        disabled = false,
        forced_discharge = false,
        restore_flag = false,

        reset = function(self)
            self.active = false
            self.charged = false
            self.disabled = false
            self.forced_discharge = false
        end,

        restore = function(self)
            if ref.dt and ref.dt[1] then ref.dt[1]:override() end
        end,

        disable = function(self)
            if ref.dt and ref.dt[1] then ref.dt[1]:override(false) end
            self.disabled = true
        end,

        force_discharge = function(self, cmd)
            if cmd then cmd.discharge_pending = true end
            self.forced_discharge = true
        end,

        on_setup_command = function(self, cmd)
            if self.disabled then
                self:reset()
                self.restore_flag = true
                return
            end
            
            if self.restore_flag then
                self.restore_flag = false
                self:restore()
            end
            
            if self.forced_discharge then
                self.forced_discharge = false
                cmd.discharge_pending = true
            end
            
            if not ref.dt or not ref.dt[1] or not ref.dt[1]:get() or not ref.dt[1]:get_hotkey() then
                self:reset()
                return
            end
            
            self.active = true
            self.charged = exploit.charged
        end
    }

    exploit.hideshots = {
        active = false,
        charged = false,
        disabled = false,
        restore_flag = false,

        reset = function(self)
            self.active = false
            self.charged = false
            self.disabled = false
        end,

        restore = function(self)
            if ref.os and ref.os[1] then ref.os[1]:override() end
        end,

        disable = function(self)
            if ref.os and ref.os[1] then ref.os[1]:override(false) end
            self.disabled = true
        end,

        on_setup_command = function(self)
            if self.disabled then
                self:reset()
                self.restore_flag = true
                return
            end
            
            if self.restore_flag then
                self.restore_flag = false
                self:restore()
            end
            
            if not ref.os or not ref.os[1] or not ref.os[1]:get() or not ref.os[1]:get_hotkey() then
                self:reset()
                return
            end
            
            self.active = true
            self.charged = exploit.charged
        end
    }

    function exploit:reset()
        self.active = false
        self.charged = false
        self.disabled = false
        self.doubletap:reset()
        self.hideshots:reset()
        self.defensive:reset()
    end

    function exploit:restore()
        if ref.dt and ref.dt[1] then ref.dt[1]:override() end
        if ref.os and ref.os[1] then ref.os[1]:override() end
    end

    function exploit:disable()
        if ref.dt and ref.dt[1] then ref.dt[1]:override(false) end
        if ref.os and ref.os[1] then ref.os[1]:override(false) end
        self.disabled = true
    end

    function exploit:detect()
        local local_player = entity.get_local_player()
        if not local_player then return end
        
        local tickbase = entity.get_prop(local_player, 'm_nTickBase')
        if not tickbase then return end
        
        local tickcount = globals.tickcount()
        local latency = client.latency()
        local tickinterval = globals.tickinterval()
        
        local shift = tickbase - tickcount - 3 - (latency * 0.4 / tickinterval)
        local wanted = -15 + ((ref.dt_fakelag and ref.dt_fakelag:get() or 1) - 1) + 5
        
        self.charged = shift <= wanted
    end

    function exploit:on_setup_command(cmd)
        if self.disabled then
            self:reset()
            return
        end
        
        self:detect()
        
        self.doubletap:on_setup_command(cmd)
        self.hideshots:on_setup_command()
        self.defensive:on_setup_command(cmd)
        
        self.active = self.doubletap.active or self.hideshots.active
    end

    local hitgroups_to_hitboxes = {
        Head = {0},
        Chest = {4, 5, 6},
        Stomach = {2, 3},
        Arms = {13, 14, 15, 16, 17, 18},
        Legs = {7, 8, 9, 10},
        Feet = {11, 12}
    }

    local allowed_hitboxes = {0, 5, 2, 15, 17, 9, 10}
    local active_hitboxes = {}

    local state = {
        targeting = false,
        returning = false,
        should_return = false,
        teleport = false,
        disable_exploit = false,
        current_mode = "balanced",
        current_target = nil,
        last_valid_target = nil,
        target_switch_time = 0,
        fixed_hitchance = nil,
        fixed_min_damage = nil,
        hotkeys = {main = false, force_baim = false},
        cache = {
            positions = {},
            middle_pos = vector(),
            last_returning_time = 0,
            active_point_index = 0,
            last_active_point = nil,
            current_target = nil,
            last_shot_time = 0,
            target_first_seen_time = 0,
            delay_target = nil,
            peek_started_time = 0,
            target_lost_time = 0,
            pending_shot = false,
            shot_fired = false
        },
        visual = {
            values = {global_alpha = smoothy:new(0), pos = {}, alpha = {}},
            active = false
        }
    }

    local function reset_peek_shot_state()
        state.cache.pending_shot = false
        state.cache.shot_fired = false
        state.cache.peek_started_time = 0
        state.cache.target_lost_time = 0
        state.cache.last_active_point = nil
    end

    local function update_hitboxes(force_baim)
        local target_hitboxes = menu.ragebot and menu.ragebot.ai_hitbox:get() or {}
        
        if #target_hitboxes == 0 then
            target_hitboxes = {'Head', 'Chest', 'Stomach'}
        end
        
        local disabled_hitgroups = force_baim and {'Head', 'Arms', 'Legs', 'Feet'} or {}
        local new_hitboxes = {}
        
        for _, hitgroup_name in ipairs(target_hitboxes) do
            if force_baim and helpers.table_contains(disabled_hitgroups, hitgroup_name) then
                goto continue
            end
            
            local hitgroup = hitgroups_to_hitboxes[hitgroup_name]
            if hitgroup then
                for _, hitbox in ipairs(hitgroup) do
                    if helpers.table_contains(allowed_hitboxes, hitbox) then
                        table.insert(new_hitboxes, hitbox)
                    end
                end
            end
            
            ::continue::
        end
        
        active_hitboxes = new_hitboxes
    end

    local function skip_func(entindex)
        return not (entity.get_classname(entindex) == 'CCSPlayer' and entity.is_enemy(entindex))
    end

    local function trace_box_vertical(lp, from, to, mins, maxs, mask)
        local fraction = client.trace_line(lp, from.x, from.y, from.z, to.x, to.y, to.z, mask)
        local end_pos = from + (to - from) * fraction
        return {end_pos = end_pos, fraction = fraction}
    end

    local function handle_point(lp, position, prev_position, angle, step_distance, index, view_offset, vec_mins, vec_maxs)
        local start_pos = prev_position and (prev_position - view_offset) or position
        local test_end_pos = common.extend_vector(start_pos, index == 0 and 0 or step_distance, angle)

        local trace_up = trace_box_vertical(lp, 
            start_pos,
            start_pos + vector(0, 0, CONFIG.MAX_STEP_HEIGHT),
            vec_mins, vec_maxs,
            CONFIG.TRACE_MASK
        )
        
        if trace_up.fraction <= 0.01 then return false end
        local up_height = trace_up.end_pos.z

        local horizontal_fraction = 1.0
        
        for _, offset in ipairs(CONFIG.HORIZONTAL_CHECK_OFFSETS) do
            local rad = angle * math.pi / 180
            local perp_rad = rad + math.pi / 2
            local offset_vec = vector(math.cos(perp_rad) * offset, math.sin(perp_rad) * offset, 0)
            
            local trace_h = client.trace_line(
                lp,
                start_pos.x + offset_vec.x, start_pos.y + offset_vec.y, up_height,
                test_end_pos.x + offset_vec.x, test_end_pos.y + offset_vec.y, up_height,
                CONFIG.TRACE_MASK
            )
            
            if trace_h < horizontal_fraction then
                horizontal_fraction = trace_h
            end
            
            if horizontal_fraction <= 0.01 then
                return false
            end
        end
        
        if horizontal_fraction < 0.97 then
            return false
        end

        local ground_z = position.z - CONFIG.GROUND_TRACE_DEPTH
        local trace_down = trace_box_vertical(lp, 
            vector(test_end_pos.x, test_end_pos.y, up_height),
            vector(test_end_pos.x, test_end_pos.y, ground_z),
            vec_mins, vec_maxs,
            CONFIG.TRACE_MASK
        )
        
        if trace_down.fraction <= 0.01 then
            return false
        end
        
        local final_height = trace_down.end_pos.z
        return vector(test_end_pos.x, test_end_pos.y, final_height) + view_offset
    end

    local function setup_points(local_player, middle_pos, angle, amount, step_distance)
        local view_offset = vector(entity.get_prop(local_player, 'm_vecViewOffset'))
        local vec_mins = vector(entity.get_prop(local_player, 'm_vecMins'))
        local vec_maxs = vector(entity.get_prop(local_player, 'm_vecMaxs'))
        
        local positions = {}
        positions[0] = handle_point(local_player, middle_pos, nil, 0, step_distance, 0, view_offset, vec_mins, vec_maxs)
        
        for i = 1, amount do
            local angle_offset = i % 2 == 0 and angle - 90 or angle + 90
            local prev_index = i <= 2 and 0 or i - 2
            local prev_point = positions[prev_index]
            
            if not prev_point then
                positions[i] = false
                goto continue
            end
            
            local point = handle_point(local_player, middle_pos, prev_point, angle_offset, step_distance, i, view_offset, vec_mins, vec_maxs)
            
            if not point or math.abs(prev_point.z - point.z) > CONFIG.MAX_STEP_HEIGHT then
                positions[i] = false
            else
                positions[i] = point
            end
            
            ::continue::
        end
        
        return positions
    end

    local function weapon_can_fire(player, weapon)
        if not player or not weapon then return false end
        
        local next_attack = entity.get_prop(player, 'm_flNextAttack') or 0
        local next_primary = entity.get_prop(weapon, 'm_flNextPrimaryAttack') or 0
        local clip = entity.get_prop(weapon, 'm_iClip1') or 0
        local curtime = globals.curtime()
        
        if math.max(0, next_attack, next_primary) > curtime or clip <= 0 then
            return false
        end
        
        return true
    end

    local scope_weapons = {
        CWeaponSSG08 = true,
        CWeaponAWP = true,
        CWeaponG3SG1 = true,
        CWeaponSCAR20 = true
    }

    local function get_eye_position(ent)
        local ox, oy, oz = entity.get_prop(ent, 'm_vecOrigin')
        local vx, vy, vz = entity.get_prop(ent, 'm_vecViewOffset')
        if ox == nil or vx == nil then
            return nil
        end

        return vector(ox + vx, oy + vy, oz + vz)
    end

    local function count_peeking_enemies()
        local enemies = entity.get_players(true)
        local peeking_count = 0

        for i = 1, #enemies do
            local enemy = enemies[i]
            if enemy and entity.is_alive(enemy) and not entity.is_dormant(enemy) then
                local esp_data = entity.get_esp_data(enemy)
                if esp_data and bit.band(esp_data.flags or 0, CONFIG.PEEKING_ESP_FLAG) ~= 0 then
                    peeking_count = peeking_count + 1
                end
            end
        end

        return peeking_count
    end

    local function estimate_enemy_damage_to_point(enemy, point)
        if not enemy or not point or not entity.is_alive(enemy) or entity.is_dormant(enemy) then
            return 0
        end

        local enemy_weapon = entity.get_player_weapon(enemy)
        if not enemy_weapon or not weapon_can_fire(enemy, enemy_weapon) then
            return 0
        end

        local eye_position = get_eye_position(enemy)
        if not eye_position then
            return 0
        end

        local max_damage = 0
        local offsets = {0, -20, -38}

        for i = 1, #offsets do
            local _, damage = client.trace_bullet(
                enemy,
                eye_position.x, eye_position.y, eye_position.z,
                point.x, point.y, point.z + offsets[i],
                false
            )

            if damage and damage > max_damage then
                max_damage = damage
            end
        end

        return max_damage
    end

    local function is_safe_position(local_player, point, mode_config)
        local hp = entity.get_prop(local_player, 'm_iHealth') or 100
        if hp <= 0 then
            return false
        end

        local enemies = entity.get_players(true)
        local threatening = 0
        local max_incoming = 0
        local total_incoming = 0

        for i = 1, #enemies do
            local enemy = enemies[i]
            if enemy and entity.is_alive(enemy) and not entity.is_dormant(enemy) then
                local esp_data = entity.get_esp_data(enemy)
                if esp_data and (esp_data.alpha or 0) >= CONFIG.ESP_ALPHA_THRESHOLD then
                    local damage = estimate_enemy_damage_to_point(enemy, point)
                    if damage > 0 then
                        threatening = threatening + 1
                        max_incoming = math.max(max_incoming, damage)
                        total_incoming = total_incoming + damage
                    end
                end
            end
        end

        if threatening > (mode_config.max_threatening_enemies or 99) then
            return false
        end

        if max_incoming >= (hp - CONFIG.SAFE_DAMAGE_MARGIN) then
            return false
        end

        if max_incoming > hp * (mode_config.max_incoming_damage_frac or 1.0) then
            return false
        end

        if total_incoming > hp * (mode_config.max_total_incoming_damage_frac or 1.0) then
            return false
        end

        return true
    end

    local function can_target(local_player, target)
        if not target or not entity.is_alive(target) then return false end
        
        local weapon = entity.get_player_weapon(local_player)
        if not weapon or not weapon_can_fire(local_player, weapon) then return false end

        if ref.automatic_scope and not ref.automatic_scope:get() then
            local wpn_class = entity.get_classname(weapon)
            if scope_weapons[wpn_class] and entity.get_prop(local_player, 'm_bIsScoped') ~= 1 then
                return false
            end
        end

        if exploit.active and not exploit.charged then return false end

        if (entity.get_prop(local_player, 'm_flVelocityModifier') or 1) ~= 1 then return false end

        local esp_data = entity.get_esp_data(target)
        if not esp_data or (esp_data.alpha or 0) < CONFIG.ESP_ALPHA_THRESHOLD then
            return false
        end
        
        return true
    end

    local function validate_shot(pos, target, hitboxes, local_player, mode_config)
        if not pos or not target then return false, "Invalid params" end
        
        local target_health = entity.get_prop(target, 'm_iHealth') or 100
        local hitchance_threshold = (menu.ragebot and menu.ragebot.ai_hit:get() or 0)
        local min_damage_threshold = (menu.ragebot and menu.ragebot.ai_dm:get() or 0)

        if state.fixed_min_damage then
            min_damage_threshold = state.fixed_min_damage
        end
        if state.fixed_hitchance then
            hitchance_threshold = state.fixed_hitchance
        end

        if mode_config.require_lethal then
            min_damage_threshold = math.max(min_damage_threshold, target_health)
        end

        if mode_config.safe_hc_floor and mode_config.safe_hc_floor > 0 then
            hitchance_threshold = math.max(hitchance_threshold, mode_config.safe_hc_floor)
        end

        if min_damage_threshold > 0 then
            local max_damage = 0
            for _, hitbox in ipairs(hitboxes) do
                local hitbox_pos = vector(entity.hitbox_position(target, hitbox))
                local entindex, damage = client.trace_bullet(
                    local_player,
                    pos.x, pos.y, pos.z,
                    hitbox_pos.x, hitbox_pos.y, hitbox_pos.z,
                    hitbox == 0
                )
                
                if damage then
                    if hitbox == 0 then damage = damage * CONFIG.DAMAGE_MULTIPLIER_HEAD end
                    max_damage = math.max(max_damage, damage)
                end
            end
            
            if max_damage < min_damage_threshold then
                return false, string.format("Damage: %d/%d", math.floor(max_damage), min_damage_threshold)
            end
        end

        if hitchance_threshold > 0 then
            local visible_hitboxes = 0
            local total_hitboxes = #hitboxes
            
            for _, hitbox in ipairs(hitboxes) do
                local hitbox_pos = vector(entity.hitbox_position(target, hitbox))
                local entindex = client.trace_bullet(
                    local_player,
                    pos.x, pos.y, pos.z,
                    hitbox_pos.x, hitbox_pos.y, hitbox_pos.z,
                    false
                )
                
                if entindex == target then
                    visible_hitboxes = visible_hitboxes + 1
                end
            end
            
            local hitchance = total_hitboxes > 0 and (visible_hitboxes / total_hitboxes * 100) or 0
            
            if hitchance < hitchance_threshold then
                return false, string.format("Hitchance: %d%% < %d%%", math.floor(hitchance), hitchance_threshold)
            end
        end
        
        return true, "Valid"
    end

    local function trace_enemy(positions, local_player, target, hitboxes, mode_config)
        if not target or not entity.is_alive(target) then return nil, 0 end
        
        local target_health = entity.get_prop(target, 'm_iHealth') or 100
        local min_damage = (ref.minimum_damage and ref.minimum_damage[1] and 
                           ((ref.minimum_damage_override and ref.minimum_damage_override[1]:get() and 
                             ref.minimum_damage_override[1]:get_hotkey() and ref.minimum_damage[1]:get()) or 
                            ref.minimum_damage[1]:get())) or 0
        
        for i, pos in ipairs(positions) do
            if not pos then goto continue end
            
            local valid, reason = validate_shot(pos, target, hitboxes, local_player, mode_config)
            if not valid then goto continue end
            
            for _, hitbox in ipairs(hitboxes) do
                local hitbox_pos = vector(entity.hitbox_position(target, hitbox))
                local entindex, damage = client.trace_bullet(
                    local_player,
                    pos.x, pos.y, pos.z,
                    hitbox_pos.x, hitbox_pos.y, hitbox_pos.z,
                    hitbox == 0
                )
                
                if damage then
                    if hitbox == 0 then damage = damage * CONFIG.DAMAGE_MULTIPLIER_HEAD end
                    
                    if damage >= math.min(min_damage, target_health) then
                        state.cache.last_shot_time = globals.curtime()
                        return pos, i
                    end
                end
            end
            
            ::continue::
        end
        
        return nil, 0
    end

    local function weapon(lp)
        local weapon = entity.get_player_weapon(lp)
        local weapon_idx = entity.get_prop(weapon, "m_iItemDefinitionIndex")
        local weapon_check = helpers.get_weapon_type(weapon_idx)
        local mult_weapon = menu.ragebot.ai_weapon:get() 

        local is_selected_in_menu = #mult_weapon > 0 
        local is_match = false
        local matched_name = nil

        for i, name in ipairs(mult_weapon) do
            if string.lower(name) == weapon_check then
                is_match = true
                matched_name = name
                break 
            end
        end

        if is_selected_in_menu then
            return is_match, matched_name 
        else
            return true
        end
    end

    local function should_peek(local_player, target)
        local weapon = entity.get_player_weapon(local_player)
        if not weapon or not weapon_can_fire(local_player, weapon) then
            return false
        end
        
        return true
    end

    local function handle(cmd)
        local main_key = menu.ragebot and menu.ragebot.ai:get() and menu.ragebot.ai_hotkey:get()
        local selected_mode = menu.ragebot and menu.ragebot.ai_risk_mode and menu.ragebot.ai_risk_mode:get() or "Balanced"
        state.current_mode = string.lower(selected_mode or "balanced")
        if not MODE_CONFIGS[state.current_mode] then
            state.current_mode = "balanced"
        end
        local mode_config = MODE_CONFIGS[state.current_mode]
        
        if main_key and not state.hotkeys.main then
            local local_player = entity.get_local_player()
            if local_player then
                state.cache.middle_pos = common.extrapolate_position(local_player, vector(entity.get_origin(local_player)), 13, true)
                state.hotkeys.main = true
                update_hitboxes(false)
                reset_peek_shot_state()
                
                state.fixed_hitchance = menu.ragebot and menu.ragebot.ai_hit:get() or 0
                state.fixed_min_damage = menu.ragebot and menu.ragebot.ai_dm:get() or 0
            end
        elseif not main_key and state.hotkeys.main then
            state.cache.target_first_seen_time = 0
            state.cache.delay_target = nil
            state.fixed_hitchance = nil
            state.fixed_min_damage = nil
            reset_peek_shot_state()

            if ref.autopeek and ref.autopeek[1] then ref.autopeek[1]:override() end
            if ref.quickpeek_mode then ref.quickpeek_mode:override() end
            exploit:restore()
            
            state.hotkeys.main = false
        end
        
        local force_baim = ref.forcebaim and ref.forcebaim:get()
        if force_baim ~= state.hotkeys.force_baim then
            update_hitboxes(force_baim)
            state.hotkeys.force_baim = force_baim
        end

        if not main_key then
            state.targeting = false
            state.returning = false
            state.should_return = false
            state.teleport = false
            state.disable_exploit = false
            state.visual.active = false
            reset_peek_shot_state()
            return
        end
        
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then return end
        local check_wp = weapon(local_player)

        local lp_origin = vector(entity.get_origin(local_player))
        local lp_velocity = vector(entity.get_prop(local_player, 'm_vecVelocity')):length2d()
        local is_on_ground = bit.band(entity.get_prop(local_player, 'm_fFlags') or 0, 1) == 1
        local is_user_moving = cmd.in_forward == 1 or cmd.in_back == 1 or cmd.in_moveleft == 1 or cmd.in_moveright == 1 or cmd.in_jump == 1
        
        local local_override = not is_on_ground or is_user_moving

        local dist_to_middle = state.cache.middle_pos:dist2d(lp_origin)
        if (not state.targeting and not state.returning) or (dist_to_middle > CONFIG.RETURN_THRESHOLD and lp_velocity < 1.011) then
            state.cache.middle_pos = lp_origin
        end

        local target = client.current_threat()

        if target and state.last_valid_target and target ~= state.last_valid_target then
            state.target_switch_time = globals.curtime()
        end
        
        if target then
            state.last_valid_target = target
        elseif globals.curtime() - state.target_switch_time > 0.5 then
            state.last_valid_target = nil
        end

        if not target and state.last_valid_target then
            target = state.last_valid_target
        end
        
        state.cache.current_target = target

        local target_origin = target and vector(entity.get_origin(target)) or vector()
        local angle = target and vector(state.cache.middle_pos:to(target_origin):angles()).y or vector(client.camera_angles()).y
        
        local positions = setup_points(local_player, state.cache.middle_pos, angle, CONFIG.POINTS_AMOUNT, CONFIG.STEP_DISTANCE)
        state.cache.positions = positions
        state.visual.active = true

        local can_target_enemy = can_target(local_player, target)
        local peeking_enemies = count_peeking_enemies()
        local should_trace = false
        
        if can_target_enemy and target and not(entity.is_dormant(state.cache.current_target)) and check_wp and should_peek(local_player, target) then
            local delay = (menu.ragebot and menu.ragebot.ai_delay:get() or 0) / 100
            delay = delay + (mode_config.extra_delay or 0)
            if delay <= 0 then
                should_trace = true
            else
                local target_id = tostring(target)
                if state.cache.delay_target ~= target_id then
                    state.cache.target_first_seen_time = globals.curtime()
                    state.cache.delay_target = target_id
                end
                
                if globals.curtime() - state.cache.target_first_seen_time >= delay then
                    should_trace = true
                end
            end
        else
            state.cache.target_first_seen_time = 0
            state.cache.delay_target = nil
        end

        if should_trace and mode_config.max_peeking_enemies and peeking_enemies > mode_config.max_peeking_enemies then
            should_trace = false
        end
        
        local active_point_pos, active_point_index = nil, 0
        if not local_override and not state.returning and should_trace then
            active_point_pos, active_point_index = trace_enemy(positions, local_player, target, active_hitboxes, mode_config)
        end

        if active_point_pos and mode_config.require_safe_position and not is_safe_position(local_player, active_point_pos, mode_config) then
            active_point_pos = nil
            active_point_index = 0
        end

        state.targeting = active_point_pos ~= nil
        state.cache.active_point_index = active_point_index
        local now = globals.curtime()
        local shot_wait_deadline = CONFIG.PEEK_SHOT_TIMEOUT + (mode_config.extra_delay or 0)
        local lost_grace = CONFIG.PEEK_LOST_GRACE + (mode_config.extra_delay or 0)
        local waiting_for_shot = state.cache.pending_shot and not state.cache.shot_fired

        if state.targeting then
            state.cache.last_active_point = active_point_pos
            if not state.cache.pending_shot and not state.cache.shot_fired then
                state.cache.pending_shot = true
                state.cache.peek_started_time = now
            end
            state.cache.target_lost_time = 0
        elseif waiting_for_shot then
            if state.cache.target_lost_time == 0 then
                state.cache.target_lost_time = now
            end
        else
            state.cache.target_lost_time = 0
        end

        waiting_for_shot = state.cache.pending_shot and not state.cache.shot_fired
        local lost_too_long = waiting_for_shot and state.cache.target_lost_time > 0 and (now - state.cache.target_lost_time) >= lost_grace
        local wait_timed_out = waiting_for_shot and state.cache.peek_started_time > 0 and (now - state.cache.peek_started_time) >= shot_wait_deadline
        local hold_peek_without_trace = waiting_for_shot and not lost_too_long and not wait_timed_out
        
        if state.targeting and state.cache.shot_fired then
            state.returning = true
            state.should_return = false
            state.teleport = true
            state.disable_exploit = false
            state.targeting = false
            reset_peek_shot_state()
        elseif state.targeting then
            common.set_movement(cmd, active_point_pos, local_player)
            state.returning = false
            state.should_return = false
            state.teleport = false
            state.disable_exploit = false
        elseif hold_peek_without_trace and state.cache.last_active_point then
            common.set_movement(cmd, state.cache.last_active_point, local_player)
            state.returning = false
            state.should_return = false
            state.teleport = false
            state.disable_exploit = false
        elseif local_override then
            state.returning = false
            state.should_return = false
            state.teleport = false
            state.disable_exploit = false
            reset_peek_shot_state()
        elseif state.should_return or lost_too_long or wait_timed_out then
            state.returning = true
            state.should_return = false
            state.teleport = true
            state.disable_exploit = false
            reset_peek_shot_state()
        end
        
        if not state.returning then
            state.cache.last_returning_time = globals.tickcount()
        end

        if state.returning then
            if dist_to_middle < CONFIG.RETURN_THRESHOLD then
                state.returning = false
                state.teleport = false
                state.disable_exploit = false
            elseif state.teleport then
                local weapon = entity.get_player_weapon(local_player)
                local can_shoot = weapon and weapon_can_fire(local_player, weapon)
                local tick_diff = globals.tickcount() - state.cache.last_returning_time
                
                if ref.dt and ref.dt[1] and ref.dt[1]:get_hotkey() and can_shoot then
                    if tick_diff == 1 then
                        exploit.defensive:force(cmd)
                    elseif tick_diff >= 7 then
                        exploit:disable()
                        state.teleport = false
                        state.disable_exploit = true
                    end
                elseif ref.os and ref.os[1] and ref.os[1]:get_hotkey() and not exploit.defensive.active then
                    exploit:disable()
                    state.teleport = false
                    state.disable_exploit = true
                end
            end
        end

        if ref.quickpeek_mode then
            ref.quickpeek_mode:override(state.returning and {'Retreat on shot', 'Retreat on key release'} or nil)
        end

        if state.disable_exploit then
            exploit:disable()
        else
            exploit:restore()
        end

        exploit:on_setup_command(cmd)
    end

    local function on_aim_fire(e)
        if not menu.ragebot or not menu.ragebot.ai:get() then return end
        if not state.hotkeys.main then return end
        if not state.cache.pending_shot then return end
        if not e or e.target == nil or e.target == 0 then return end

        local target = state.cache.current_target
        if target and e.target ~= target then
            return
        end

        state.cache.last_shot_time = globals.curtime()
        state.cache.shot_fired = true
        state.cache.pending_shot = false
        state.cache.target_lost_time = 0
        state.should_return = true
    end

    local function paint()
        if not menu.ragebot or not menu.ragebot.ai:get() or not menu.ragebot.ai_hotkey:get() or not menu.ragebot.ai_visual:get() then return end
        
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then return end
        
        if not (ref.third_person_alive and ref.third_person_alive:get() and ref.third_person_alive:get_hotkey()) then return end
        
        local positions = state.cache.positions
        if not positions then return end
        
        local g_alpha = state.visual.values.global_alpha(CONFIG.VISUAL_FADE_SPEED, state.visual.active and 1 or 0)
        if g_alpha <= 0 then return end
        
        local active_idx = state.cache.active_point_index
        local color_active = {255, 255, 255, 255}
        local color_inactive = {255, 255, 255, 100}
        
        for i = 0, #positions do
            local pos = positions[i]
            
            if not state.visual.values.alpha[i] then
                state.visual.values.alpha[i] = smoothy:new(0)
            end
            
            if not state.visual.values.pos[i] then
                state.visual.values.pos[i] = smoothy:new(vector())
            end
            
            local alpha = state.visual.values.alpha[i](CONFIG.VISUAL_FADE_SPEED, pos and g_alpha or 0)
            if alpha <= 0 then goto continue end
            
            if pos then
                local target_z = pos.z - 26 + 5 * alpha + (active_idx == i and 2 or 0)
                state.visual.values.pos[i](CONFIG.POSITION_LERP_SPEED, vector(pos.x, pos.y, target_z))
            end
            
            local screen_pos = vector(renderer.world_to_screen(state.visual.values.pos[i].value:unpack()))
            if screen_pos.x ~= 0 and screen_pos.y ~= 0 then
                local clr = active_idx == i and color_active or color_inactive
                renderer.circle(screen_pos.x, screen_pos.y, math.floor(clr[1]), math.floor(clr[2]), math.floor(clr[3]), math.floor(clr[4] * alpha), 3, 0, 1)
            end

            local prev_i = i <= 2 and 0 or i - 2
            if positions[prev_i] and positions[i] then
                local line_from = vector(renderer.world_to_screen(state.visual.values.pos[prev_i].value:unpack()))
                local line_to = vector(renderer.world_to_screen(state.visual.values.pos[i].value:unpack()))
                
                if line_from.x ~= 0 and line_to.x ~= 0 then
                    renderer.line(line_from.x, line_from.y, line_to.x, line_to.y, 255, 255, 255, math.floor(100 * alpha))
                end
            end
            
            ::continue::
        end
    end

    menu.ragebot.ai_visual:set_callback(function () 
        if menu.ragebot.ai_visual:get() then
            client.set_event_callback("paint", paint)
        else
            client.unset_event_callback('paint', paint)
        end
    end)

    menu.ragebot.ai:set_callback(function() 
        if menu.ragebot.ai:get() then
            client.set_event_callback("setup_command", handle)
            client.set_event_callback("aim_fire", on_aim_fire)
        else
            client.unset_event_callback("setup_command", handle)
            client.unset_event_callback("aim_fire", on_aim_fire)
            client.unset_event_callback("paint", paint)
            reset_peek_shot_state()
        end

    end)
end

local ov_cache = {
    accuracy_boost = nil,
    multipoint = nil,
    delay_shot = nil,
    plist = {} 
}

local aimtools_func = {} do
    local misses = {}
    local enemies_above = {}
    local enemies_below = {}
    local last_weapon_id = -1
    local weapon_change_delay = 0
    local required_delay = 10
    local is_active = false
    
    local weapon_configs = {  
        scout = {idx = 4, lethal = 80},
        awp = {idx = 6, lethal = 80},
        auto = {idx = 5, lethal = 80},
        revolver = {idx = 3, lethal = 80},
        pistol = {idx = 1, lethal = 30},
        deagle = {idx = 2, lethal = 40},
    }
    
    function aimtools_func.unset_all_overrides()
        for i = 1, 64 do
            plist.set(i, "Override prefer body aim", "-")
            plist.set(i, "Override safe point", "-")
        end
    end
   
    function aimtools_func.update_caches(enemies, lp_pos_z)
        enemies_above = {}
        enemies_below = {}
        
        if not lp_pos_z or not enemies then return end

        local enemy_list = type(enemies) == "table" and enemies or {enemies}

        for _, enemy in ipairs(enemy_list) do
            if enemy and entity.is_alive(enemy) and not entity.is_dormant(enemy) then
                local origin = {entity.get_origin(enemy)}
                
                if origin[3] then
                    local enemy_pos_z = origin[3]
                    
                    if enemy_pos_z > lp_pos_z + 40 then
                        enemies_above[enemy] = true
                    elseif enemy_pos_z < lp_pos_z - 40 then
                        enemies_below[enemy] = true
                    end

                    misses[enemy] = misses[enemy] or 0  
                end
            end
        end
    end

    function aimtools_func.smart_override(ref_item, value, cache_key)
        if not ref_item then return end
        if ov_cache[cache_key] ~= value then
            ref_item:override(value)
            ov_cache[cache_key] = value
        end
    end

    function aimtools_func.smart_plist(player, feature, value)
        ov_cache.plist[player] = ov_cache.plist[player] or {}
        if ov_cache.plist[player][feature] ~= value then
            plist.set(player, feature, value)
            ov_cache.plist[player][feature] = value
        end
    end

    function aimtools_func.is_baimable_plist(player, weapon_type, cfg_idx)
        local cfg = aimtools[cfg_idx]
        if not cfg then return end
        
        local lethal = entity.get_prop(player, "m_iHealth") or 0
        local miss_count = misses[player] or 0
        local lethal_threshold = weapon_configs[weapon_type] and weapon_configs[weapon_type].lethal or 0

        local force_baim = "-"
        local b_pref = cfg.body_prefer:get()
        for i=1, #b_pref do
            local item = b_pref[i]
            if (item == "HP lower than X" and lethal > 0 and lethal <= cfg.body_hp:get()) or
            (item == "Lethal" and lethal <= lethal_threshold) or
            (item == "After X Misses" and lethal > 0 and miss_count >= cfg.body_misses:get()) then
                force_baim = "Force"
                break
            end
        end
        aimtools_func.smart_plist(player, "Override prefer body aim", force_baim)

        local force_safe = "-"
        local s_pref = cfg.safe_prefer:get()
        for i=1, #s_pref do
            local item = s_pref[i]
            if (item == "HP lower than X" and lethal > 0 and lethal <= cfg.safe_hp:get()) or
            (item == "Lethal" and lethal <= lethal_threshold) or
            (item == "After X Misses" and lethal > 0 and miss_count >= cfg.safe_misses:get()) then
                force_safe = "On"
                break
            end
        end
        aimtools_func.smart_plist(player, "Override safe point", force_safe)
    end

    function aimtools_func.is_baimable_overrides(target, weapon_type, cfg_idx)
        if not menu.ragebot.main_switch:get() then return end
        if not cfg_idx or not aimtools[cfg_idx] then return end
        local cfg = aimtools[cfg_idx]

        local lethal = entity.get_prop(target, "m_iHealth") or 0
        local miss_count = misses[target] or 0
        local lethal_threshold = weapon_configs[weapon_type] and weapon_configs[weapon_type].lethal or 0
        
        local is_higher = enemies_above[target] or false
        local is_lower = enemies_below[target] or false

        local should_delay = false
        if is_air_act and weapon_type == "scout" then
            should_delay = true 
        else
            if (cfg.delay_leth:get() == 1 and lethal <= lethal_threshold) or
            (cfg.delay_after_mis:get() == 1 and miss_count >= cfg.delay_misses:get()) or
            (cfg.delay_lower_than_X:get() == 1 and lethal > 0 and lethal <= cfg.delay_hp:get()) or
            (is_higher and cfg.delay_high:get() == 1) or
            (is_lower and cfg.delay_low:get() == 1) then
                should_delay = true
            end
        end
        aimtools_func.smart_override(ref.delay_shot, should_delay, "delay_shot")

        local hitscan_modes = {[0] = nil, [1] = "Low", [2] = "Medium", [3] = "High", [4] = "Maximum"}
        local target_hs_idx = 0
        if cfg.hitscan_leth:get() > 0 and lethal <= lethal_threshold then
            target_hs_idx = cfg.hitscan_leth:get()
        elseif cfg.hitscan_after_mis:get() > 0 and miss_count >= cfg.hitscan_misses:get() then
            target_hs_idx = cfg.hitscan_after_mis:get()
        elseif cfg.hitscan_lower_than_X:get() > 0 and lethal > 0 and lethal <= cfg.hitscan_hp:get() then
            target_hs_idx = cfg.hitscan_lower_than_X:get()
        elseif is_higher and cfg.hitscan_high:get() > 0 then
            target_hs_idx = cfg.hitscan_high:get()
        elseif is_lower and cfg.hitscan_low:get() > 0 then
            target_hs_idx = cfg.hitscan_low:get()
        end
        aimtools_func.smart_override(ref.accuracy_boost, hitscan_modes[target_hs_idx], "accuracy_boost")

        local target_mp = nil 
        if cfg.multi_lethal:get() > 23 and lethal <= lethal_threshold then
            target_mp = cfg.multi_lethal:get()
        elseif cfg.multi_after_miss:get() > 23 and miss_count >= cfg.multi_misses:get() then
            target_mp = cfg.multi_after_miss:get()
        elseif cfg.multi_hp_than_x:get() > 23 and lethal > 0 and lethal <= cfg.multi_hp:get() then
            target_mp = cfg.multi_hp_than_x:get()
        elseif is_higher and cfg.multi_high:get() > 23 then
            target_mp = cfg.multi_high:get()
        elseif is_lower and cfg.multi_low:get() > 23 then
            target_mp = cfg.multi_low:get()
        end
        
        local final_mp = (target_mp and target_mp > 23) and target_mp or nil
        aimtools_func.smart_override(ref.multipoint, final_mp, "multipoint")

        local hitchance_to_set = 0
        if cfg.hitchance_lethal:get() > 0 and lethal <= lethal_threshold then
            hitchance_to_set = cfg.hitchance_lethal:get()
        elseif cfg.hitchance_after_miss:get() > 0 and miss_count >= cfg.hitchance_misses:get() then
            hitchance_to_set = cfg.hitchance_after_miss:get()
        elseif cfg.hitchance_hp_than_x:get() > 0 and lethal > 0 and lethal <= cfg.hitchance_hp:get() then
            hitchance_to_set = cfg.hitchance_hp_than_x:get()
        elseif is_higher and cfg.hitchance_high:get() > 0 then
            hitchance_to_set = cfg.hitchance_high:get()
        elseif is_lower and cfg.hitchance_low:get() > 0 then
            hitchance_to_set = cfg.hitchance_low:get()
        end

        if hitchance_to_set > 0 then
            ref.hitchance:override(hitchance_to_set)
            aim_hit_check = true
        else
            aim_hit_check = false
        end
    end
    
    function aimtools_func.safe_baim(cfg_idx)
        if not menu.ragebot.main_switch:get() then return end
        if not cfg_idx or not aimtools[cfg_idx] then return end
        
        local cfg = aimtools[cfg_idx]
        
        local has_higher_body = false
        local has_higher_safe = false
        for _, item in ipairs(cfg.body_prefer:get()) do
            if item == "Higher than you" then has_higher_body = true end
        end
        for _, item in ipairs(cfg.safe_prefer:get()) do
            if item == "Higher than you" then has_higher_safe = true end
        end
        
        for enemy in pairs(enemies_above) do
            local lethal = entity.get_prop(enemy, "m_iHealth") or 0
            if lethal > 0 then
                if has_higher_body then
                    plist.set(enemy, "Override prefer body aim", "Force")
                else
                    plist.set(enemy, "Override prefer body aim", "-")
                end
                if has_higher_safe then
                    plist.set(enemy, "Override safe point", "On")
                else
                    plist.set(enemy, "Override safe point", "-")
                end
            else
                plist.set(enemy, "Override prefer body aim", "-")
                plist.set(enemy, "Override safe point", "-")
            end
        end
        
        local has_lower_body = false
        local has_lower_safe = false
        for _, item in ipairs(cfg.body_prefer:get()) do
            if item == "Lower than you" then has_lower_body = true end
        end
        for _, item in ipairs(cfg.safe_prefer:get()) do
            if item == "Lower than you" then has_lower_safe = true end
        end
        
        for enemy in pairs(enemies_below) do
            local lethal = entity.get_prop(enemy, "m_iHealth") or 0
            if lethal > 0 then
                if has_lower_body then
                    plist.set(enemy, "Override prefer body aim", "Force")
                else
                    plist.set(enemy, "Override prefer body aim", "-")
                end
                if has_lower_safe then
                    plist.set(enemy, "Override safe point", "On")
                else
                    plist.set(enemy, "Override safe point", "-")
                end
            else
                plist.set(enemy, "Override prefer body aim", "-")
                plist.set(enemy, "Override safe point", "-")
            end
        end
    end
    
    function aimtools_func.ind()
        if not is_active or not menu.ragebot.esp_flags:get() then return end
        if not entity.is_alive(entity.get_local_player()) then return end
        
        local esp1, esp2, esp3, esp4 = menu.ragebot.esp_color:get()
        local players = entity.get_players(true)
        local font = " "
        
        if menu.ragebot.esp_font:get() == 'Small' then
            font = 'c-'
        elseif menu.ragebot.esp_font:get() == 'Verdana' then
            font = 'c'
        elseif menu.ragebot.esp_font:get() == 'Bold' then
            font = 'cb'
        end
        
        for i = 1, #players do
            local player_index = players[i]
            local x1, y1, x2, y2, mult = entity.get_bounding_box(player_index)
            
            if x1 ~= nil and mult > 0 then
                local baim = 0
                local safe = 0
                
                if plist.get(player_index, "Override prefer body aim") == "Force" then
                    baim = 15
                end
                if plist.get(player_index, "Override safe point") == "On" then
                    safe = 15
                end
                
                y1 = y1 - 17
                x1 = x1 + ((x2 - x1) / 2)
                
                if y1 ~= nil then
                    if plist.get(player_index, "Override prefer body aim") == "Force" then
                        renderer.text(x1 - safe, y1, esp1, esp2, esp3, esp4, font .. dpi, 0, "BAIM")  
                    end
                    if plist.get(player_index, "Override prefer body aim") == "Force" and plist.get(player_index, "Override safe point") == "On" then
                        renderer.text(x1, y1, 255, 255, 255, 255, font .. dpi, 0, " + ")
                    end
                    if plist.get(player_index, "Override safe point") == "On" then
                        renderer.text(x1 + baim, y1, esp1, esp2, esp3, esp4, font .. dpi, 0, "SAFE")      
                    end
                end
            end
        end
    end

    function aimtools_func.player_is_baimbale()
        if not is_active then return end
        if not menu.ragebot.main_switch:get() then
            aimtools_func.unset_all_overrides()
            return
        end

        local lp = entity.get_local_player()
        if not lp or not entity.is_alive(lp) then
            aimtools_func.unset_all_overrides()
            return
        end

        local enemies = entity.get_players(true)
        if not enemies then return end

        local lp_pos_z = select(3, entity.get_origin(lp))
        local target = client.current_threat()
        local Weapon = entity.get_player_weapon(lp)
        if not Weapon then return end

        local weapon_idx = entity.get_prop(Weapon, "m_iItemDefinitionIndex")
        
        if weapon_idx ~= last_weapon_id then
            last_weapon_id = weapon_idx
            weapon_change_delay = required_delay
            aim_hit_check = false

            aimtools_func.smart_override(ref.accuracy_boost, nil, "accuracy_boost")
            aimtools_func.smart_override(ref.multipoint, nil, "multipoint")
            aimtools_func.smart_override(ref.delay_shot, nil, "delay_shot")
            return
        end

        if weapon_change_delay > 0 then
            weapon_change_delay = weapon_change_delay - 1
            aim_hit_check = false

            aimtools_func.smart_override(ref.accuracy_boost, nil, "accuracy_boost")
            aimtools_func.smart_override(ref.multipoint, nil, "multipoint")
            aimtools_func.smart_override(ref.delay_shot, nil, "delay_shot")
            return
        end

        local weapon_type = helpers.get_weapon_type(weapon_idx)
        local cfg_info = weapon_configs[weapon_type]
        
        if not cfg_info or not aimtools[cfg_info.idx] then 
            ref.accuracy_boost:override()
            ref.multipoint:override()
            aim_hit_check = false
            return 
        end

        local cfg_idx = cfg_info.idx

        aimtools_func.update_caches(enemies, lp_pos_z)
        
        for _, player in ipairs(enemies) do
            aimtools_func.is_baimable_plist(player, weapon_type, cfg_idx)
        end

        if target and entity.is_alive(target) then
            aimtools_func.is_baimable_overrides(target, weapon_type, cfg_idx)
        else
            aimtools_func.smart_override(ref.accuracy_boost, nil, "accuracy_boost")
            aimtools_func.smart_override(ref.multipoint, nil, "multipoint")
            aimtools_func.smart_override(ref.delay_shot, nil, "delay_shot")
            aim_hit_check = false
        end

        aimtools_func.safe_baim(cfg_idx)
    end
    
    function aimtools_func.reset_data()
        misses = {}
        enemies_above = {}
        enemies_below = {}
        last_weapon_id = -1
        weapon_change_delay = 0
        aim_hit_check = false
        aimtools_func.unset_all_overrides()  
        ov_cache.plist = {}
    end

    function aimtools_func.full_cleanup()
        is_active = false
        
        pcall(function() 
            if ref.accuracy_boost then ref.accuracy_boost:override() end
            if ref.multipoint then ref.multipoint:override() end
            if ref.delay_shot then ref.delay_shot:override() end
            if ref.hitchance then ref.hitchance:override() end
        end)
        
        aim_hit_check = false
        aimtools_func.unset_all_overrides()
        aimtools_func.reset_data()
    end

    menu.ragebot.main_switch:set_callback(function() 
        local state = menu.ragebot.main_switch:get()
        is_active = state
        
        utils.set_event_callback("setup_command", aimtools_func.player_is_baimbale, state)
        utils.set_event_callback("paint", aimtools_func.ind, state)
        utils.set_event_callback("round_start", aimtools_func.reset_data, state)
        
        if not state then
            aimtools_func.full_cleanup()
        end
    end)

    utils.set_event_callback("shutdown", function()
        aimtools_func.full_cleanup()
    end, true)
end

local is_currently_overridden = false 
local hit_config_index = 1
local is_in_air = false

local hitchance_settings do
    local last_weapon_id = -1 
    local delay_ticks = 0 
    local required_delay = 10

    local function setup_hitchance()
        local lp = entity.get_local_player()

        if not lp or not entity.is_alive(lp) then
            if is_currently_overridden then
                ref.hitchance:override()
                is_currently_overridden = false
            end
            last_weapon_id = -1
            return
        end

        local weapon_ent = entity.get_player_weapon(lp)
        if not weapon_ent then
            if is_currently_overridden then
                ref.hitchance:override()
                is_currently_overridden = false
            end
            return
        end

        local weapon_idx = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")

        if weapon_idx ~= last_weapon_id then
            delay_ticks = required_delay
            last_weapon_id = weapon_idx
            ref.hitchance:override()
            is_currently_overridden = false
            aim_hit_check = false 
            return
        end

        if delay_ticks > 0 then
            delay_ticks = delay_ticks - 1
            ref.hitchance:override()
            is_currently_overridden = false
            aim_hit_check = false 
            return
        end

        local current_state = antiaim.state()
        is_in_air = (current_state == "Aerobic" or current_state == "Aerobic+")
        local weapon_type_lower = helpers.get_weapon_type(weapon_idx) 

        local config_index = 0
        for i, name in ipairs(hit_cond) do
            if string.lower(name) == weapon_type_lower then
                config_index = i
                hit_config_index = i
                break
            end
        end

        if config_index == 0 then
            if is_currently_overridden then
                ref.hitchance:override()
                is_currently_overridden = false
            end
            aim_hit_check = false 
            return
        end

        local config = hit[config_index] 
        local air_hc_value = config.ovr_air_hit:get()
        local hotkey_hc_value = config.ovr_hit:get()
        local key_is_active = config.hot:get()

        if is_in_air and air_hc_value > 0 then
            ref.hitchance:override(air_hc_value)
            is_currently_overridden = true
            aim_hit_check = true 
        elseif key_is_active and hotkey_hc_value > 0 then
            ref.hitchance:override(hotkey_hc_value)
            is_currently_overridden = true
            aim_hit_check = true
        else
            if is_currently_overridden then
                ref.hitchance:override()
                is_currently_overridden = false
                aim_hit_check = false
            end
        end
    end

    local function paint()
        if not hit_config_index or not hit[hit_config_index] then return end
        if is_currently_overridden and not is_in_air then
            if not (menu.visuals.ui_main:get("Keybinds") and menu.visuals.hotkey_item:get("Hitchance")) then
                renderer.indicator(230, 230, 230, 230, "HC")
            end
        end
    end

    client.set_event_callback("paint", paint)
    client.set_event_callback("setup_command", setup_hitchance) 
end

local force_shot_logic = {} do
    local force_active = false
    local force_hotkey_blocked = false
    local hs_checker = false
    local last_fs_weapon = -1
    local fs_delay_ticks = 0
    local FS_REQUIRED_DELAY = 8

    local thresholds = {
        scout = { air = {perfect = 0.007, worst = 0.080}, land = {perfect = 0.003, worst = 0.035}, noscope = {perfect = 0.040, worst = 0.120} },
        awp = { air = {perfect = 0.010, worst = 0.100}, land = {perfect = 0.001, worst = 0.025}, noscope = {perfect = 0.030, worst = 0.100} },
        auto = { air = {perfect = 0.008, worst = 0.090}, land = {perfect = 0.002, worst = 0.030}, noscope = {perfect = 0.025, worst = 0.080} },
        deagle = { air = {perfect = 0.020, worst = 0.150}, land = {perfect = 0.004, worst = 0.050}, noscope = {perfect = 0.004, worst = 0.050} },
        revolver = { air = {perfect = 0.015, worst = 0.120}, land = {perfect = 0.003, worst = 0.040}, noscope = {perfect = 0.003, worst = 0.040} },
        pistol = { air = {perfect = 0.020, worst = 0.120}, land = {perfect = 0.005, worst = 0.045}, noscope = {perfect = 0.005, worst = 0.045} }
    }

    function force_shot_logic.is_weapon_supported(weapon_ent)
        if not weapon_ent then return false end
        local class_name = entity.get_classname(weapon_ent) or ""
        local lower = class_name:lower()
        return not (lower:find("knife") or lower:find("grenade") or lower:find("c4"))
    end

    function force_shot_logic.reset_state()
        if not is_currently_overridden then
            ref.hitchance:override()
        end
        force_active = false
        force_hotkey_blocked = false
    end

    function force_shot_logic.is_main_hc_active()
        return is_currently_overridden == true 
    end

    function force_shot_logic.is_weapon_enabled_in_menu(weapon_type_lower)
        if not weapon_type_lower then return false end
        local menu_element = menu.ragebot.force_shot_weapon or menu.ragebot.force_shot_weapons
        if not menu_element then return false end
        local selected_weapons = menu_element:get()
        for i = 1, #selected_weapons do
            if string.lower(selected_weapons[i]) == weapon_type_lower then return true end
        end
        ref.hitchance:override()
        return false
    end

    function force_shot_logic.is_regular_hitchance_priority_active(weapon_idx)
        local weapon_type_lower = helpers.get_weapon_type(weapon_idx)
        if not weapon_type_lower then return false end
        local cfg = nil
        for i = 1, #hit_cond do
            if string.lower(hit_cond[i]) == weapon_type_lower then cfg = hit[i] break end
        end
        if not cfg then return false end
        local cur_state = antiaim.state()
        local is_in_air = cur_state == "Aerobic" or cur_state == "Aerobic+"
        if (is_in_air and cfg.ovr_air_hit and cfg.ovr_air_hit:get() > 0) or
           (cfg.hot and cfg.hot:get() and cfg.ovr_hit and cfg.ovr_hit:get() > 0) or
           (ref.doubletap and ref.doubletap:get()) then
            return true
        end
        return false
    end

    function force_shot_logic.compute_dynamic_hc(weapon_type, default_hc, menu_min_hc, lp, wpn_ent, on_ground, scoped)
        local wpn_t = thresholds[weapon_type] or thresholds.pistol
        local t = not on_ground and wpn_t.air or (not scoped and wpn_t.noscope or wpn_t.land)
        local fire_penalty = entity.get_prop(wpn_ent, "m_fAccuracyPenalty") or 0
        local fire_frac = math.max(0, math.min(1, 1.0 - (fire_penalty - t.perfect) / (t.worst - t.perfect)))
        local vx, vy = entity.get_prop(lp, "m_vecVelocity[0]") or 0, entity.get_prop(lp, "m_vecVelocity[1]") or 0
        local speed = math.sqrt(vx * vx + vy * vy)
        local speed_thresh = 250 * 0.34
        local speed_frac = speed <= 2 and 1.0 or (speed >= speed_thresh and 0.0 or 1.0 - (speed - 2) / (speed_thresh - 2))
        local acc_frac = on_ground and math.min(fire_frac, speed_frac) or fire_frac
        acc_frac = acc_frac * acc_frac * (3 - 2 * acc_frac) 
        local active_min_hc = menu_min_hc == -1 and math.floor(15 + (40 * (1.0 - acc_frac))) or menu_min_hc
        local result_hc = math.floor(active_min_hc + (default_hc - active_min_hc) * (1.0 - acc_frac) + 0.5)
        return math.max(1, math.min(100, result_hc))
    end

    function force_shot_logic.reset_state()
        if not is_currently_overridden and not aim_hit_check and not is_noscope_active then
            ref.hitchance:override()
        end
        force_active = false
        force_hotkey_blocked = false
    end

    function force_shot_logic.setup_force_shot()
        local lp = entity.get_local_player()
        if not lp or not entity.is_alive(lp) then
            force_shot_logic.reset_state()
            last_fs_weapon = -1
            return
        end

        local wpn_ent = entity.get_player_weapon(lp)
        if not wpn_ent then 
            force_shot_logic.reset_state() 
            return 
        end

        local wpn_idx = entity.get_prop(wpn_ent, "m_iItemDefinitionIndex") or 0
        local weapon_type = helpers.get_weapon_type(wpn_idx)

        local is_enabled = force_shot_logic.is_weapon_enabled_in_menu(weapon_type)
        local is_supported = force_shot_logic.is_weapon_supported(wpn_ent)

        if not is_enabled or not is_supported then
            if last_fs_weapon ~= wpn_idx then
                force_shot_logic.reset_state()
                last_fs_weapon = wpn_idx
            end
            force_active = false
            force_hotkey_blocked = false
            return
        end

        if wpn_idx ~= last_fs_weapon then
            force_shot_logic.reset_state()
            fs_delay_ticks = FS_REQUIRED_DELAY
            last_fs_weapon = wpn_idx
            return
        end

        local blocked_by_priority = (is_currently_overridden or aim_hit_check or is_noscope_active)

        local cur_state = antiaim.state()
        local is_in_air = (cur_state == "Aerobic" or cur_state == "Aerobic+")

        if is_in_air or blocked_by_priority then
            force_active = false
            force_hotkey_blocked = true 
            return
        end

        if ref.doubletap and ref.doubletap:get() then
            force_active = false
            force_hotkey_blocked = true
            return
        end

        if fs_delay_ticks > 0 then
            fs_delay_ticks = fs_delay_ticks - 1
            return
        end

        force_hotkey_blocked = false
        hs_checker = false
        
        local default_hc = tonumber(ref.hitchance:get()) or 50
        local min_hc = menu.ragebot.hitchance_force_shot:get() or 1
        local on_ground = bit.band(entity.get_prop(lp, "m_fFlags") or 0, 1) == 1
        local scoped = entity.get_prop(lp, "m_bIsScoped") == 1

        local final_hc = force_shot_logic.compute_dynamic_hc(weapon_type, default_hc, min_hc, lp, wpn_ent, on_ground, scoped)
        
        if final_hc then
            force_active = true
            ref.hitchance:override(final_hc)
        else
            force_shot_logic.reset_state()
        end
    end

    function force_shot_logic.handle_logic()
        local state = menu.ragebot.en_forceshot:get() 
        utils.set_event_callback("setup_command", function()
            if menu.ragebot.en_forceshot:get() and menu.ragebot.en_forceshot_ht:get() then 
                force_shot_logic.setup_force_shot()
            else
                ref.hitchance:override()
            end
        end,
        state)
        utils.set_event_callback("paint", function()
            local me = entity.get_local_player()
            if not me or not entity.is_alive(me) then return end
            if menu.ragebot.en_forceshot:get() and not menu.ragebot.en_forceshot_ht:get() then return end
            if force_hotkey_blocked and not hs_checker then
                renderer.indicator(255, 0, 0, 255, "FORCE SHOT")
            elseif force_active then
                renderer.indicator(233, 255, 0, 255, "FORCE SHOT")
            end
        end, state)
        if not state then force_shot_logic.reset_state() end
    end

    menu.ragebot.en_forceshot:set_callback(force_shot_logic.handle_logic)
    force_shot_logic.handle_logic()
end

local crosshair = {} do

    function crosshair.glow()
        local color_type = menu.visuals.cr_color_type:get()
        local glow_color
        if color_type == "Gradient" then
            local grad = menu.visuals.cr_color_gradient:get()
            local time = globals.realtime() * menu.visuals.cr_color_speed:get()
            local iter = time  
            local cos_val = math.abs(math.cos(iter))
            
            if grad == "2x" then
                local col_start = coloring.normalize_color({menu.visuals.cr_color1:get()})
                local col_end = coloring.normalize_color({menu.visuals.cr_color2:get()})
                glow_color = {
                    col_start[1] + (col_end[1] - col_start[1]) * cos_val,
                    col_start[2] + (col_end[2] - col_start[2]) * cos_val,
                    col_start[3] + (col_end[3] - col_start[3]) * cos_val,
                    col_start[4] + (col_end[4] - col_start[4]) * cos_val
                }
            else 
                local col1 = coloring.normalize_color({menu.visuals.cr_color1:get()})
                local col2 = coloring.normalize_color({menu.visuals.cr_color2:get()})
                local col3 = coloring.normalize_color({menu.visuals.cr_color3:get()})
                local frac = iter - math.floor(iter)
                
                if frac < 1/3 then
                    local t = frac * 3
                    glow_color = {
                        col1[1] + (col2[1] - col1[1]) * t,
                        col1[2] + (col2[2] - col1[2]) * t,
                        col1[3] + (col2[3] - col1[3]) * t,
                        col1[4] + (col2[4] - col1[4]) * t
                    }
                elseif frac < 2/3 then
                    local t = (frac - 1/3) * 3
                    glow_color = {
                        col2[1] + (col3[1] - col2[1]) * t,
                        col2[2] + (col3[2] - col2[2]) * t,
                        col2[3] + (col3[3] - col2[3]) * t,
                        col2[4] + (col3[4] - col2[4]) * t
                    }
                else
                    local t = (frac - 2/3) * 3
                    glow_color = {
                        col3[1] + (col1[1] - col3[1]) * t,
                        col3[2] + (col1[2] - col3[2]) * t,
                        col3[3] + (col1[3] - col3[3]) * t,
                        col3[4] + (col1[4] - col3[4]) * t
                    }
                end
            end
        else
            glow_color = coloring.normalize_color({menu.visuals.cr_default_color:get()})
        end
        return glow_color[1], glow_color[2], glow_color[3]    
    end

    local scoped = 0
    local scoping = false
    local scope_replace = 0
    local scope_side = 0
    local alpha_scope = 0
    local y_cent = 0
    local side = 0

    local is_callback_active = false

    function crosshair.propering (cmd)
        local me = entity.get_local_player()
        if entity.is_alive(me) then
            side = cmd.in_moveright == 1 and -1 or cmd.in_moveleft == 1 and 1 or 0
        end
    end

    menu.visuals.crosshair:set_callback(function ()
        if menu.visuals.crosshair:get() then
            is_callback_active = true
            utils.set_event_callback('setup_command', crosshair.propering, is_callback_active)
            utils.set_event_callback("paint_ui", crosshair.paint, is_callback_active)
            utils.set_event_callback('paint', crosshair.scope_place, is_callback_active)
        end
    end)

    function crosshair.scope_place()
        local me = entity.get_local_player()
        if not me then return end
        local grenade = false
        local weapon = entity.get_player_weapon(me)
        if weapon ~= nil then
            local weaponi = csgo_weapons(weapon)
            if weaponi.weapon_type_int == 9 then
                grenade = true
            end
        end
        scoped = motion.new('scoped', me and (grenade or
        entity.get_prop(me, 'm_bIsScoped') == 1) and 1 or 0, 0.06)
        if me and scoped == 1 then
            if not scoping and side ~= 0 then
                scope_replace, scoping = -side, true
            end
        else
            scope_replace, scoping = 0, false
        end
        scope_side = motion.new('scope_side', scope_replace, 0.06)
        alpha_scope = motion.new('alpha_scope',
        scoped == 1 and scope_side == 0 and 0.5 or 1, 0.06)
    end

    function crosshair.render_center (x, y, r, g, b, a, fl, alpha, ...)
        if alpha == nil then
            alpha = 1
        end
        if alpha <= 0 then
            return
        end
        local offset = 1
        local addx = 10 * -scope_side
        if scope_side > 0 then
            offset = offset + scope_side
        elseif scope_side < 0 then
            offset = offset + scope_side
        end
        local mx, my = renderer.measure_text(fl, ...)
        local analize = mx
        x = x - analize * offset * .5 + addx
        a = a * alpha
        --y = y
        renderer.text(x, y, r, g, b, a, fl, 0, ...)
        y_cent = y_cent + (my + 1) * alpha
        return x, y, offset, mx, my
    end
    local stating = 0
    local ide = 0
    function crosshair.paint()
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then return end
        local r1, g1, b1, a1 = menu.visuals.recent_color:get()

        local master_alpha = motion.new('crosshair_master', menu.visuals.crosshair:get() and 1 or 0, 0.07)
        local alpha = motion.new('crosshair_alpha', menu.visuals.crosshair:get() and alpha_scope or 0, 0.07)

        if not menu.visuals.crosshair:get() and master_alpha < 0.01 and is_callback_active then
            is_callback_active = false
            side, scoped, scoping, scope_replace, scope_side, alpha_scope, y_cent = 0,0,false,0,0,0,0
            return
        end

        local glowing = motion.new('crosshair_glow', menu.visuals.crosshair_select:get('Glow module') and menu.visuals.crosshair:get() and alpha_scope or 0, 0.07)
        local state = antiaim.state()
        local color_type = menu.visuals.cr_color_type:get()
        local color_func = coloring.color(
            "Custom",
            color_type,
            menu.visuals.cr_color_gradient:get(),
            {menu.visuals.cr_default_color:get()},
            {menu.visuals.cr_color1:get()},
            {menu.visuals.cr_color2:get()},
            {menu.visuals.cr_color3:get()},
            menu.visuals.cr_color_speed:get()
        )


        local re, ge, be = crosshair.glow()
        local sz = renderer.measure_text(dpi..'-', state)
        local statd = motion.new('state_cross', ide == id and stating == sz and 1 or 0.5, 0.07)
        if statd < 0.5 then
            stating = sz
            ide = id
        end
        local dsy = motion.new('cr_dsy', entity.get_prop(lp, 'm_flPoseParameter', 11) * 120 - 60, 0.03)
        if dsy > 25 then
            dsy = 25
        end
        if dsy < -25 then
            dsy = -25
        end
        local desyncing = 'desync:'
        local freestand = menu.antiaim.freestanding_hotkey:get() and menu.antiaim.yaw_direction:get("Freestanding")
        local n, y, a = menu.visuals.recent_color:get()
        local charge = motion.new('cr_charge', addon.doubletap_charged() and n or 255, 0.07)
        local charged = motion.new('cr_charged', addon.doubletap_charged() and 1 or 0, 0.07)

        local dsa = motion.new('dsa', menu.visuals.crosshair_select:get('Desync') and dsy ~= 0 and master_alpha > 0 and 1 or 0, 0.07)
        local sta = motion.new('sta', menu.visuals.crosshair_select:get('State') and master_alpha > 0 and 1 or 0, 0.07)
        local fsa = motion.new('fsa', menu.visuals.crosshair_select:get('Freestanding') and freestand and 1 or 0, 0.07)
        local dta = motion.new('dta', menu.visuals.crosshair_select:get('Double tap') and ref.dt[1]:get() and ref.dt[1]:get_hotkey() and not ref.fakeduck:get() and 1 or 0, 0.07)
        local osa = motion.new('osa', menu.visuals.crosshair_select:get('Onshot anti-aim') and ref.os[1]:get() and ref.os[1]:get_hotkey() and not ref.fakeduck:get() and 1 or 0, 0.07)
        local mda = motion.new('mda', menu.visuals.crosshair_select:get('Minimum damage override') and ref.minimum_damage_override[1]:get_hotkey() and 1 or 0, 0.07)
        local bda = motion.new('bda', menu.visuals.crosshair_select:get('Body aim') and ref.forcebaim:get() and 1 or 0, 0.07)
        local sfa = motion.new('sfa', menu.visuals.crosshair_select:get('Safe point') and ref.safepoint:get() and 1 or 0, 0.07)
        local fda = motion.new('fda', menu.visuals.crosshair_select:get('Duck peek assist') and ref.fakeduck:get() and 1 or 0, 0.07)
        local move = motion.new('crosshair_y', menu.drag.crosshair.y:get(), 0.07)
        local sn = motion.new('attempt', move < 150 and -1 or 1, 0.07)
        local dsad = motion.new('acros_dsy', dsa and move < 150 and -5 or 0, 0.07)
        local crosshair_elements = {}
        table.insert(crosshair_elements, {
            special = 'main',
            alpha = 1,
            y_adjust = -4,
            r = 255,
            g = 255,
            b = 255,
            text_alpha = 255,
            font = dpi .. 'b',
            text = color_func('pacantech')
        })
        table.insert(crosshair_elements, {
            special = 'desync',
            alpha = dsa,
            y_adjust = dsad,
            r = n,
            g = y,
            b = a,
            text_alpha = 0,
            font = dpi .. '-',
            text = desyncing:upper()
        })
        table.insert(crosshair_elements, {
            alpha = sta,
            y_adjust = -2 * sta,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = state:upper()
        })
        table.insert(crosshair_elements, {
            alpha = dta,
            y_adjust = 0,
            r = charge,
            g = y * charged,
            b = a * charged,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'DOUBLETAP'
        })
        table.insert(crosshair_elements, {
            alpha = osa,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'ONSHOT'
        })
        table.insert(crosshair_elements, {
            alpha = bda,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'BODY'
        })
        table.insert(crosshair_elements, {
            alpha = sfa,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'SAFE'
        })
        table.insert(crosshair_elements, {
            alpha = fda,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'DUCK'
        })
        table.insert(crosshair_elements, {
            alpha = mda,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'DMG'
        })
        table.insert(crosshair_elements, {
            alpha = fsa,
            y_adjust = 0,
            r = n,
            g = y,
            b = a,
            text_alpha = 255,
            font = dpi .. '-',
            text = 'FS'
        })
        local base_y = height * 0.5 + move
        local temp_y_cent = 0
        local min_render_y = math.huge
        local max_render_y = -math.huge
        local _, line_height = renderer.measure_text(dpi .. '-', 'A')
        for _, elem in ipairs(crosshair_elements) do
            local this_alpha = elem.alpha * master_alpha
            if this_alpha > 0 then
                local this_y_adjust = elem.y_adjust or 0
                local this_y = base_y + (temp_y_cent + this_y_adjust) * sn - 150
                local mx, my = renderer.measure_text(elem.font, elem.text)
                min_render_y = math.min(min_render_y, this_y)
                max_render_y = math.max(max_render_y, this_y + my)
                if elem.special == 'desync' then
                    max_render_y = math.max(max_render_y, this_y + 6)
                end
                temp_y_cent = temp_y_cent + (my + 1) * this_alpha
            end
        end

        local rect_y, rect_h
        if min_render_y < math.huge then
            rect_y = min_render_y - 2
            rect_h = motion.new("rect", max_render_y - min_render_y + 4, 0.07)
            rect_h1 = math.floor(rect_h)
            local drag_pos = vector(width * 0.5 - 25, rect_y)
            local drag_size = vector(53, rect_h)
            local drag_state = drag:create("crosshair", drag_pos, drag_size, nil, menu.drag.crosshair.y, nil, nil, 0, 0, width, height/3-100)
            
            local alpha = motion.new('bg_alpha', ui.is_menu_open() and (menu.visuals.crosshair:get() and drag_state.hovered and 200 or 100) or 0, 0.07) * master_alpha
            local screen_alpha = motion.new('screen_back4', ui.is_menu_open() and menu.visuals.crosshair:get() and drag_state.dragging and 150 or 0, 0.07) * master_alpha
            local line_alpha = motion.new('cross_line', ui.is_menu_open() and menu.visuals.crosshair:get() and drag_state.dragging and 255 or 0, 0.07) * master_alpha
            render.rounded_rectangle(width * 0.5 - 27, rect_y, 53, rect_h1, 150, 150, 150, alpha, 4)
            renderer.rectangle(0, 0, width, height, 0, 0, 0, screen_alpha)
            renderer.line(width/2, height/3 + 47, width/2, height/2 + 280, 255, 255, 255, line_alpha)
            renderer.circle(width/2, height/3 + 47, 255, 255, 255, line_alpha, 3, 360, 1)
            renderer.circle(width/2, height/2 + 280, 255, 255, 255, line_alpha, 3, 360, 1)
        end

        y_cent = 0
        for _, elem in ipairs(crosshair_elements) do
            local this_alpha = elem.alpha * master_alpha
            if this_alpha <= 0 then goto continue end
            local this_y = base_y + (y_cent + elem.y_adjust) * sn - 150
            local display_text = (master_alpha < 0.99) and 'pacantech' or elem.text
            local render_x, render_y, off, mx, my = crosshair.render_center(width * 0.5, this_y, elem.r, elem.g, elem.b, elem.text_alpha * this_alpha * alpha, elem.font, this_alpha, display_text)
            if render_x ~= nil and render_y ~= nil then
                if elem.special == 'main' then
                    render.glow_module(render_x, render_y, mx, my, 25, 5, {re, ge, be, 55 * glowing}, {re, ge, be, 55 * glowing})
                elseif elem.special == 'desync' then
                    local bar_alpha = 255 * this_alpha
                    local fade_alpha = 55 * this_alpha
                    renderer.rectangle(width * 0.5 - 33 * scope_side - 26, render_y, 52, 6, 5, 5, 5, bar_alpha)
                    renderer.rectangle(width * 0.5 - 33 * scope_side - 25, render_y + 1, 50, 3, 20, 20, 20, bar_alpha)
                    renderer.gradient(width * 0.5 - 33 * scope_side - dsy, render_y + 1, dsy, 4, r1, g1, b1, fade_alpha, r1, g1, b1, bar_alpha, true)
                end
            end
            ::continue::
        end
    end
end

local arrows = {} do

    local left = renderer.load_svg('<svg width="8" height="10" viewBox="0 0 8 10"><path fill="#fff" d="m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z"/></svg>', 8, 10)
    local right = renderer.load_svg('<svg width="8" height="10" viewBox="0 0 8 10"><path fill="#fff" transform="rotate(180, 4, 5)" d="m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z"/></svg>', 8, 10)

    local current_left_x = 0
    local current_right_x = 0
    local is_callback_active = false

    function arrows.paint()
        local lp = entity.get_local_player()
        if not entity.is_alive(lp) then return end

        local global_alpha = motion.new("arrows_global_alpha", menu.visuals.arrows:get() and 1 or 0, 0.07)

        if not menu.visuals.arrows:get() and global_alpha < 0.01 and is_callback_active then
            is_callback_active = false
            return
        end

        local raw_offset = math.abs(menu.drag.arrows.x:get())
        local target_left_x = width * 0.5 - raw_offset 
        local target_right_x = width * 0.5 + raw_offset
        
        current_left_x = motion.new("arr_l_x", target_left_x, 0.05)
        current_right_x = motion.new("arr_r_x", target_right_x, 0.05)
        
        local arrows_positions = {
            left = {x = current_left_x, y = height * 0.5},
            right = {x = current_right_x, y = height * 0.5}
        }

        local scoped, menu_open = entity.get_prop(lp, "m_bIsScoped") == 1, ui.is_menu_open()
        scoped_space = motion.new('add_scope', menu.visuals.arrows:get() and menu.visuals.arrows_scope:get('Level') and scoped and 15 or 0)

        local alpha_level = motion.new("alpha_lv_arrows", (menu.visuals.arrows:get() and menu.visuals.arrows_scope:get('Alpha') and scoped) and 90 or 150)
        local show_arrow = menu.visuals.arrows:get() and menu_open or menu.visuals.arrows:get() and yaw_direction ~= 0 
        local arrows_alpha_left = motion.new("alpha_left_arrows", show_arrow and (menu.visuals.arrows:get() and yaw_direction == -90 and 255 or 70) or 0, 0.1) * global_alpha 
        local arrows_alpha_right = motion.new("alpha_right_arrows", show_arrow and (menu.visuals.arrows:get() and yaw_direction == 90 and 255 or 70) or 0, 0.1) * global_alpha 

        local arrows_color = {menu.visuals.arrows_color:get()}

        for side, pos in pairs({left = arrows_positions.left, right = arrows_positions.right}) do
            local bodyyaw = entity.get_prop(lp, "m_flPoseParameter", 11) * 120 - 60
            local drag_id = side == "left" and "arrows_left" or "arrows_right"

            local subtract_amount
            if menu.visuals.arrows_type:get() == "V4" then  
                if menu.visuals.v4_mode:get("Arrows") and menu.visuals.v4_mode:get("Desync") then
                    subtract_amount = side == "left" and 4 or 21
                elseif menu.visuals.v4_mode:get("Arrows") then
                    subtract_amount = side == "left" and 3 or 17
                elseif menu.visuals.v4_mode:get("Desync") then
                    subtract_amount = side == "left" and -11 or 21
                else
                    return
                end
            else
                subtract_amount = side == "left" and 8 or 10
            end

            local drag_pos_x = pos.x - subtract_amount
            local drag_pos = vector(drag_pos_x, pos.y - 10)
            local drag_size = vector(18, 20)
            local drag_state = drag:create(drag_id, drag_pos, drag_size, menu.drag.arrows.x, nil, nil, nil, 20, 0, 100, height)

            local add_y = motion.new("add_y_v4", menu.visuals.arrows_type:get() == "V4" and menu.visuals.arrows:get() and 8 or 10)

            local adjusted_y = pos.y - scoped_space
            local bg_alpha = motion.new("arrows_b", menu_open and menu.visuals.arrows:get() and ((drag_state.hovered or drag_state.dragging ) and 200 or 100) or 0, 0.07)
            local r_w = math.floor(motion.new("arrow_bg_v4", menu.visuals.arrows_type:get() == "V4" and ((menu.visuals.v4_mode:get("Arrows") and menu.visuals.v4_mode:get("Desync") and 25) or (menu.visuals.v4_mode:get("Desync") and 10 or 20)) or 18, 0.07))
            if menu_open or bg_alpha > 0 then
                render.rounded_rectangle(drag_pos_x, pos.y - add_y - scoped_space, r_w, 20, 150, 150, 150, bg_alpha, 3)
            end

            if menu.visuals.arrows_type:get() == "pacantech" then
                renderer.texture( side == "left" and left or right, pos.x - (side == "left" and 3 or 5), adjusted_y - 5, 8, 10, arrows_color[1], arrows_color[2], arrows_color[3], side == "left" and alpha_level and arrows_alpha_left or alpha_level and arrows_alpha_right , "f")
            elseif menu.visuals.arrows_type:get() == "V4" then
                local cx, cy = pos.x, adjusted_y
                local r, g, b, a = arrows_color[1], arrows_color[2], arrows_color[3], arrows_color[4]
                local r1, g1, b1, a1 = menu.visuals.recent_color:get()
                
                local aa_dir = yaw_direction  
                local is_right = side == "right"
                local dir_match = (is_right and aa_dir == 90) or (not is_right and aa_dir == -90)
                local desync_match = is_right and bodyyaw < -10 or not is_right and bodyyaw > 10
                
                
                local tip_x, tip_y = cx + (is_right and 2 or -2), cy + 2
                local base_x = cx + (is_right and -13 or 13)
                local base_y1, base_y2 = cy - 7, cy + 11
                local tri_r, tri_g, tri_b, tri_a = dir_match and r or 35, dir_match and g or 35, dir_match and b or 35, motion.new("v4_arrows_alpha", menu.visuals.v4_mode:get("Arrows") and menu.visuals.arrows:get() and (dir_match and a or 150) or 0, 0.07)
                renderer.triangle(tip_x, tip_y, base_x, base_y1, base_x, base_y2, tri_r, tri_g, tri_b, tri_a)

            
                local rect_x = cx + (is_right and -17 or 15)  
                local rect_w, rect_h = 2, 18
                local rect_y = cy - 7
                local rect_r, rect_g, rect_b, rect_a = desync_match and r1 or 35, desync_match and g1 or 35, desync_match and b1 or 35, motion.new("v4_desync_alpha", menu.visuals.v4_mode:get("Desync") and menu.visuals.arrows:get() and (desync_match and a1 or 150) or 0, 0.07)
                renderer.rectangle(rect_x, rect_y, rect_w, rect_h, rect_r, rect_g, rect_b, rect_a)  
            end
        end
    end

    menu.visuals.arrows:set_callback(function() 
        if menu.visuals.arrows:get() then
            is_callback_active = true
            utils.set_event_callback("paint_ui", arrows.paint, is_callback_active)
        end
    end)
end

local damage = {} do
    local animation_speed = 20
    local font_options = {'Small', 'Verdana', 'Bold'}
    local current_font_index = 1
    local current_damage = 0

    local is_paint_active = false

    function damage.cycle_font()
        current_font_index = current_font_index % #font_options + 1
        menu.visuals.damage_select:set(font_options[current_font_index])
    end

    drag:set_right_click_callback("damage", damage.cycle_font)

    function damage.paint()
        local local_player = entity.get_local_player()
        if not entity.is_alive(local_player) then return end

        local damage_val = ref.minimum_damage[1]:get()
        local override_active = ref.minimum_damage_override[1]:get_hotkey()
        local transp = override_active and 1 or 0.5

        local is_menu_enabled = menu.visuals.damage_ind:get()
        local enabled = motion.new('enabled_damagei', is_menu_enabled and transp or 0, 0.06)

        if not is_menu_enabled and enabled < 0.01 and is_paint_active then
            is_paint_active = false
            return 
        end

        if enabled < 0.001 then return end

        local target_damage = override_active and ref.minimum_damage_override[2]:get() or damage_val
        local display_text
        
        if target_damage < 1 then
            display_text = "Auto"
            current_damage = 0 
        else
            if not menu.visuals.damage_anim:get() then
                if math.abs(current_damage - target_damage) > 0.1 then
                    current_damage = current_damage + (target_damage - current_damage) / animation_speed
                else
                    current_damage = target_damage
                end
            else
                current_damage = target_damage
            end
            display_text = math.floor(current_damage + 0.5) .. ''
        end

        local r, g, b, a = menu.visuals.damage_color:get()
        local x, y = menu.drag.damage.x:get(), menu.drag.damage.y:get()
        local drag_state = drag:create("damage", vector(x, y), vector(20, 15), menu.drag.damage.x, menu.drag.damage.y, nil, nil, 0, 0, width - 100, height)
        
        local alpha = motion.new('damage_alpha', ui.is_menu_open() and is_menu_enabled and ((drag_state.hovered or drag_state.dragging) and 200 or 100) or 0, 0.07)
        local text_alpha = motion.new('damage_text_alpha', ui.is_menu_open() and is_menu_enabled and ((drag_state.hovered and not drag_state.dragging and 150 or 0)) or 0, 0.07)
        
        render.rounded_rectangle(x, y, 20, 15, 150, 150, 150, alpha, 4)
        renderer.text(x - 50, y - 13, 255, 255, 255, text_alpha, dpi .. " ", 0, "Right click for change font")
        
        local font = ''
        local sel = menu.visuals.damage_select:get()
        if sel == 'Small' then font = '-' elseif sel == 'Bold' then font = 'b' end

        renderer.text(x, y, r, g, b, 255 * enabled, dpi..font, 0, display_text)
    end

    function damage.handle_damage_ind()
        if menu.visuals.damage_ind:get() then
            is_paint_active = true
            utils.set_event_callback('paint_ui', damage.paint, is_paint_active)
        end
    end

    menu.visuals.damage_ind:set_callback(damage.handle_damage_ind)
end

local feature_ind = {} do

    local indexing = {}
    local place = {
        active = {}
    }
    local colore = {}
    local buffer = {}

    
    function feature_ind.index (ref)
        buffer[#buffer + 1] = ref
    end

    local function get_base_name(text)
        if string.match(text, '^A$') or string.match(text, '^A - ') then
            return 'A'
        elseif string.match(text, '^B$') or string.match(text, '^B - ') then
            return 'B'
        elseif text == 'FATAL' or string.match(text, ' HP') then
            return 'FATAL'
        elseif string.match(text, 'TA: ') then
            return 'TA:'
        else
            return text
        end
    end

    local function format_display_text(text)
        if menu.visuals.custom_ind_gs_icon:get() then
            if text == 'OSAA' then
                return ' OSAA'
            elseif text == 'DUCK' then
                return ' DUCK'
            elseif text == 'DT' then
                return addon.doubletap_charged() and ' DT' or ' DT'
            elseif text == 'AS' then
                return ' AS'
            elseif text == 'DA' then
                return ' DA'
            elseif text == 'FS' then
                return ' FS'
            elseif text == 'MD' then
                return ' MD'
            elseif text == 'BODY' then
                return ' BODY'
            elseif text == 'SAFE' then
                return ' SAFE'
            elseif text == 'PING' then
                local res = entity.get_player_resource(entity.get_local_player())
                local cur_ping = res and entity.get_prop(res, 'm_iPing', entity.get_local_player()) or 0
                local ping_icon
                if cur_ping <= 50 then
                    ping_icon = ''  
                elseif cur_ping <= 100 then
                    ping_icon = ''
                elseif cur_ping <= 150 then
                    ping_icon = ''
                else
                    ping_icon = ''
                end
                return ping_icon .. ' PING'
            elseif #text == 1 and (text == 'A' or text == 'B') then
                return ' ' .. text
            elseif string.match(text, 'B - ') or string.match(text, 'A - ') then
                return ' ' .. text
            elseif text == 'FATAL' or string.match(text, ' HP') then
                return ' ' .. text
            elseif string.match(text, 'TA: ') then
                return ' ' .. text
            elseif string.match(text, '^HM: ') then
                return ' ' .. string.match(text, '^HM: (.*)') 
            else
                return text
            end
        else    
            return text
        end
    end

    function feature_ind.draw()
        local updated_ind = {}
        local base_y = height/3 + menu.drag.feature_ind.y:get()
        local y_offset = base_y

        local drag_state = drag:create("feature_ind", vector(0, base_y - 20), vector(10, 50), nil, menu.drag.feature_ind.y, nil, nil, 0, height/4, width, height/2)

        local bg_alpha = motion.new('feature_ind_bg_alpha', ui.is_menu_open() and ( (drag_state.hovered or drag_state.dragging) and 200 or 150) or 0, 0.07)
        local r_w = motion.new('feature_ind1', ui.is_menu_open()  and (drag_state.hovered or drag_state.dragging) and 15 or 5, 0.07)
        local r_h = motion.new('feature_ind2', ui.is_menu_open()  and (drag_state.hovered or drag_state.dragging) and 60 or 50, 0.07)
        local add_y = math.floor(motion.new('feature_ind3', ui.is_menu_open()  and (drag_state.hovered or drag_state.dragging) and 30 or 20, 0.07))

        render.rounded_rectangle(0, base_y - add_y, r_w, r_h, 150, 150, 150, bg_alpha, 3)

        indexing = buffer
        buffer = {}

        for idx, name in pairs(indexing) do
            local ctext = format_display_text(name.text)
            local base_name = get_base_name(name.text) 

            colore[base_name] = {r = name.r, g = name.g, b = name.b, a = name.a}
            if not place.active[base_name] then
                place.active[base_name] = {
                    r = 0, g = 0, b = 0, a = 0,
                    alpha = 0,
                    target_y = y_offset,
                    current_y = y_offset,
                    active = true,
                    display_text = ctext
                }
            else
                place.active[base_name].display_text = ctext
            end
            updated_ind[base_name] = true
            place.active[base_name].target_y = y_offset
            local size = vector(renderer.measure_text(dpi..'+', ctext))
            y_offset = y_offset - (size.y + menu.visuals.custom_ind_gs_size:get()) + menu.visuals.custom_ind_gs_rect:get()
        end

        for name, value in pairs(place.active) do
            local display_text = value.display_text or name
            local anim = menu.visuals.custom_ind_gs:get() and 0.1 or 2
            if updated_ind[name] then
                value.alpha = clamp_motion(value.alpha, 1, anim)
                value.r = clamp_motion(value.r, colore[name].r, anim)
                value.g = clamp_motion(value.g, colore[name].g, anim)
                value.b = clamp_motion(value.b, colore[name].b, anim)
                value.a = clamp_motion(value.a, colore[name].a, anim)
                value.active = true
            else
                value.alpha = clamp_motion(value.alpha, 0, anim)
                value.r = clamp_motion(value.r, colore[name].r, anim)
                value.g = clamp_motion(value.g, colore[name].g, anim)
                value.b = clamp_motion(value.b, colore[name].b, anim)
                value.a = clamp_motion(value.a, colore[name].a, anim)
                if value.alpha < 0.01 then
                    place.active[name] = nil
                    goto continue
                end
            end

            value.current_y = clamp_motion(value.current_y, value.target_y, anim)

            local size = vector(renderer.measure_text(dpi..'+', display_text))
            local width_ind = math.floor(size.x / 2)
            local y = value.current_y
            local text_x = 24 + 10 - menu.visuals.custom_ind_gs_rect1:get()
            local extra_bg_height = (name == 'PING' or name == 'DT') and 4 or 0
            
            renderer.gradient(10, y, width_ind + 24 - menu.visuals.custom_ind_gs_rect1:get(), size.y + 4 + extra_bg_height - menu.visuals.custom_ind_gs_rect:get(), 0, 0, 0, 0, 0, 0, 0, menu.visuals.custom_ind_gs_back:get() * value.alpha, true)
            renderer.gradient(24 + 10 - menu.visuals.custom_ind_gs_rect1:get() + width_ind, y, 29 + width_ind - menu. visuals.custom_ind_gs_rect1:get(), size.y + 4 + extra_bg_height - menu.visuals.custom_ind_gs_rect:get(), 0, 0, 0, menu.visuals.custom_ind_gs_back:get() * value.alpha, 0, 0, 0, 0, true)
            renderer.text(text_x, y + 2 - menu.visuals.custom_ind_gs_rect:get(), value.r, value.g, value.b, value.a * value.alpha, dpi..'+', 0, display_text)
            if menu.visuals.custom_ind_gs_color:get() then
                local r, g, b = menu.visuals.custom_ind_gs_colorcp:get()
                renderer.text(text_x, y + 2 - menu.visuals.custom_ind_gs_rect:get(), r, g, b, 55 * value.alpha, dpi..'+-', 0, display_text)
            end
 
            if not menu.visuals.custom_ind_gs_icon:get() then
                if name == 'PING' then
                    local res = entity.get_player_resource(entity.get_local_player())
                    local cur_ping = res and entity.get_prop(res, 'm_iPing', entity.get_local_player()) or 0
                    local ping_val = ref.ping[2]:get() or 100
                    local pct = math.min(cur_ping / ping_val, 1)
                    local fill = motion.new('ping_fill_' .. name, pct, 0.1) 
                    local bar_alpha = value.alpha * 255
                    if bar_alpha > 0 then
                        local bar_w, bar_h = size.x, 3
                        local bar_x = text_x 
                        local bar_y = y + size.y + 2 - menu.visuals.custom_ind_gs_rect:get()  
                        renderer.rectangle(bar_x, bar_y, bar_w, bar_h, 30, 30, 30, math.floor(bar_alpha * 0.7))
                        renderer.rectangle(bar_x - 1, bar_y - 1, bar_w + 2, bar_h + 2, 0, 0, 0, math.floor(bar_alpha * 0.8))
                        renderer.rectangle(bar_x, bar_y, bar_w * fill, bar_h, value.r, value.g, value.b, bar_alpha)
                    end
                end
            end
            ::continue::
        end
    end
    client.set_event_callback('indicator', feature_ind.index)
    client.set_event_callback("paint", feature_ind.draw)
end

local other_ind = {} do
    local PANEL_W, PANEL_H = 260, 40
    local velocity_ind_svg = renderer.load_svg('<svg width="46" height="46" viewBox="0 0 16 16"><path fill="#FFFFFF" d="m13.259 13h-10.518c-0.35787 0.0023-0.68906-0.1889-0.866-0.5-0.18093-0.3088-0.18093-0.6912 0-1l5.259-9.015c0.1769-0.31014 0.50696-0.50115 0.864-0.5 0.3568-0.00121 0.68659 0.18986 0.863 0.5l5.26 9.015c0.1809 0.3088 0.1809 0.6912 0 1-0.1764 0.3097-0.5056 0.5006-0.862 0.5zm-6.259-3v2h2v-2zm0-5v4h2v-4z"/></svg>', 46, 46)
    local defensive_ind_svg = renderer.load_svg('<svg fill="#FFFFFF" width="64px" height="64px" viewBox="0 0 505.74 505.74"><g><path d="M396.007,191.19c-0.478,0-1.075,0-1.554,0c-6.693-54.147-52.833-96.103-108.773-96.103 c-48.171,0-89.051,31.078-103.753,74.349c-16.734-8.128-35.381-12.67-55.224-12.67C56.658,156.765,0,213.542,0,283.707 c0,67.416,52.594,122.64,118.934,126.703v0.239h277.91c60.244-0.358,108.893-49.366,108.893-109.729 C505.617,240.317,456.609,191.19,396.007,191.19z" fill="#FFFFFF"></path></g></svg>', 64, 64)
    local velocity_alpha, velocity_amount = 0, 0
    local defensive_alpha, defensive_amount = 0, 0
    local is_velocity_active, is_defensive_active = false, false

    function other_ind.panel_color(which)
        local color_type = menu.visuals.ui_color:get()
        local default_c = {menu.visuals.ui_default_color:get()}
        local color_ref = which == "velocity" and menu.visuals.ui_color4 or menu.visuals.ui_color5
        if color_type == "Multi-color" and color_ref ~= nil then
            return coloring.normalize_color({color_ref:get()})
        end
        return coloring.normalize_color(default_c)
    end

    local function draw_indicator_card(icon_type, value, accent, alpha, x, y)
        value = clamp(value or 0, 0, 1)
        alpha = math.floor(clamp(alpha or 0, 0, 255))
        if alpha <= 0 then return end

        render.rec(x - 1, y + 2, PANEL_W + 2, PANEL_H + 2, 8, {0, 0, 0, math.floor(alpha * 0.34)})
        render.rec(x, y, PANEL_W, PANEL_H, 7, {17, 17, 17, math.floor(alpha * 0.88)})
        render.rec_outline(x, y, PANEL_W, PANEL_H, 7, 1, {0, 0, 0, math.floor(alpha * 0.92)})
        render.rec_outline(x + 1, y + 1, PANEL_W - 2, PANEL_H - 2, 6, 1, {80, 84, 92, math.floor(alpha * 0.34)})

        local r, g, b = accent[1], accent[2], accent[3]
        renderer.gradient(x + 7, y + PANEL_H - 1, PANEL_W / 2 - 7, 1,
            0, 0, 0, 0,
            r, g, b, math.floor(alpha * 0.62), true)
        renderer.gradient(x + PANEL_W / 2, y + PANEL_H - 1, PANEL_W / 2 - 7, 1,
            r, g, b, math.floor(alpha * 0.62),
            0, 0, 0, 0, true)

        local icon = icon_type == "velocity" and velocity_ind_svg or defensive_ind_svg
        local icon_size = icon_type == "velocity" and 28 or 25
        renderer.texture(icon, x + 14, y + math.floor((PANEL_H - icon_size) / 2), icon_size, icon_size, r, g, b, alpha, 'f')

        local bar_x, bar_y, bar_w, bar_h = x + 48, y + 18, PANEL_W - 64, 4
        render.rec(bar_x, bar_y, bar_w, bar_h, 2, {22, 24, 29, math.floor(alpha * 0.82)})
        render.rec_outline(bar_x, bar_y, bar_w, bar_h, 2, 1, {86, 90, 100, math.floor(alpha * 0.20)})

        local fill_w = math.floor(bar_w * value)
        if fill_w > 0 then
            render.rec(bar_x, bar_y, fill_w, bar_h, 2, {r, g, b, math.floor(alpha * 0.9)})
            renderer.rectangle(bar_x + 1, bar_y, math.max(0, fill_w - 2), 1, 255, 255, 255, math.floor(alpha * 0.18))
        end
    end

    function other_ind.velocity()
        local enabled = menu.visuals.ui_main:get("Velocity")
        local lp = entity.get_local_player()
        local alive = lp ~= nil and entity.is_alive(lp)
        if not alive and not ui.is_menu_open() then return end

        local raw_value = alive and (entity.get_prop(lp, 'm_flVelocityModifier') or 1) or 0
        local preview = (globals.tickcount() % 70) / 70
        local value = ui.is_menu_open() and preview or raw_value
        local should_show = enabled and (ui.is_menu_open() or value < 0.995)

        velocity_amount = motion.new('velocity_amount', enabled and value or 0, 0.06)
        velocity_alpha = motion.new('velocity_alpha', should_show and 255 or 0, 0.06)

        if not enabled and velocity_alpha < 1 and is_velocity_active then
            is_velocity_active = false
            utils.set_event_callback("paint_ui", other_ind.velocity, false)
            return
        end

        local x, y = menu.drag.velocity.x:get(), menu.drag.velocity.y:get()
        local drag_state = drag:create("velocity_drag", vector(x, y), vector(PANEL_W, PANEL_H),
            menu.drag.velocity.x, menu.drag.velocity.y, nil, nil, 0, 0, width - PANEL_W, height - PANEL_H)

        local screen_alpha = motion.new('screen_darkness_alpha_vel',
            enabled and drag_state.dragging and ui.is_menu_open() and 100 or 0, 0.06)
        glass_ui.rect(0, 0, width, height, 0, 0, 0, screen_alpha)

        local accent = other_ind.panel_color("velocity")
        draw_indicator_card("velocity", velocity_amount, accent, velocity_alpha, x, y)
    end

    function other_ind.defensive()
        local enabled = menu.visuals.ui_main:get("Defensive")
        local lp = entity.get_local_player()
        local alive = lp ~= nil and entity.is_alive(lp)
        if not alive and not ui.is_menu_open() then return end

        local ticks_left = alive and defensive.on_createmove(lp) or 0
        local active = ticks_left > 0
        local preview = (globals.tickcount() % 70) / 70
        local value = ui.is_menu_open() and preview or clamp(ticks_left / 13, 0, 1)
        local should_show = enabled and (ui.is_menu_open() or active)

        defensive_amount = motion.new('defensive_amount', enabled and value or 0, 0.06)
        defensive_alpha = motion.new('defensive_alpha', should_show and 255 or 0, 0.06)

        if not enabled and defensive_alpha < 1 and is_defensive_active then
            is_defensive_active = false
            utils.set_event_callback("paint_ui", other_ind.defensive, false)
            return
        end

        local x, y = menu.drag.defensive.x:get(), menu.drag.defensive.y:get()
        local drag_state = drag:create("defensive_drag", vector(x, y), vector(PANEL_W, PANEL_H),
            menu.drag.defensive.x, menu.drag.defensive.y, nil, nil, 0, 0, width - PANEL_W, height - PANEL_H)
        x, y = menu.drag.defensive.x:get(), menu.drag.defensive.y:get()

        local screen_alpha = motion.new('screen_darkness_alpha_def',
            enabled and drag_state.dragging and ui.is_menu_open() and 100 or 0, 0.06)
        glass_ui.rect(0, 0, width, height, 0, 0, 0, screen_alpha)

        local accent = other_ind.panel_color("defensive")
        draw_indicator_card("defensive", defensive_amount, accent, defensive_alpha, x, y)
    end

    function other_ind.on_menu_change()
        if menu.visuals.ui_main:get("Velocity") then is_velocity_active = true end
        if menu.visuals.ui_main:get("Defensive") then is_defensive_active = true end

        utils.set_event_callback("paint_ui", other_ind.velocity, menu.visuals.ui_main:get("Velocity") or is_velocity_active)
        utils.set_event_callback("paint_ui", other_ind.defensive, menu.visuals.ui_main:get("Defensive") or is_defensive_active)
    end
end

local k_bg_texture, k_bg_texture_loaded = nil, false
local function get_k_bg_texture()
    if k_bg_texture_loaded then return k_bg_texture end

    k_bg_texture_loaded = true
    local file = readfile('k_bg.png')
    if file ~= nil then
        local ok, texture = pcall(renderer.load_png, file, 1, 1)
        if ok then
            k_bg_texture = texture
        end
    end
    return k_bg_texture
end

local solus = {} do
    local watermark_anim = {
        info_width = 0,
        last_fps_update = 0,
        current_fps = 0
    }

    solus.active_callbacks = {
        watermark = false,
        hotkey = false,
        spectators = false
    }

    function solus.get_username()
        local me = entity.get_local_player()
        if not me then return "unknown" end
        return entity.get_player_name(me) or "unknown"
    end

    function solus.get_time()
        local hours, minutes, seconds = client.system_time()
        return string.format("%02d:%02d:%02d", hours, minutes, seconds)
    end

    function solus.tointeger(num)
        return math.floor(num + 0.5)
    end

    function solus.panel_color(which)
        local color_type = menu.visuals.ui_color:get()
        local default_c = {menu.visuals.ui_default_color:get()}
        local map = {
            watermark = menu.visuals.ui_color1,
            hotkey = menu.visuals.ui_color2,
            spectator = menu.visuals.ui_color3
        }
        if color_type == "Multi-color" and map[which] ~= nil then
            return coloring.normalize_color({map[which]:get()})
        end
        return coloring.normalize_color(default_c)
    end

    local function draw_drag_overlay(id, enabled, drag_state)
        local alpha = motion.new('screen_back_' .. id, enabled and drag_state.dragging and ui.is_menu_open() and 100 or 0, 0.06)
        glass_ui.rect(0, 0, width, height, 0, 0, 0, alpha)
    end

    function solus.watermark()
        local enabled = menu.visuals.ui_main:get("Watermark")
        local accent = solus.panel_color("watermark")
        local alpha = motion.new("water_alpha", enabled and 255 or 0, 0.1)

        if not enabled and alpha < 1 then
            solus.active_callbacks.watermark = false
            utils.set_event_callback("paint_ui", solus.watermark, false)
            return
        end

        local show_prefix = menu.visuals.water_main:get("Water")
        local panel_h = 22
        local prefix_w = show_prefix and 26 or 0

        local info_elements = {}
        if menu.visuals.water_main:get("Build") then
            table.insert(info_elements, (info.build:gsub("pacantech", "")))
        end
        if menu.visuals.water_main:get("Name") then
            table.insert(info_elements, solus.get_username())
        end
        if menu.visuals.water_main:get("FPS") then
            local now = globals.realtime()
            if now - watermark_anim.last_fps_update > 0.5 then
                watermark_anim.current_fps = solus.tointeger(1 / globals.frametime())
                watermark_anim.last_fps_update = now
            end
            table.insert(info_elements, watermark_anim.current_fps .. " fps")
        end
        if menu.visuals.water_main:get("Ping") then
            table.insert(info_elements, solus.tointeger(math.min(1000, client.latency() * 1000)) .. "ms")
        end
        if menu.visuals.water_main:get("Time") then
            table.insert(info_elements, solus.get_time())
        end

        local target_info_width = 0
        for i, element in ipairs(info_elements) do
            target_info_width = target_info_width + glass_ui.measure("regular", element)
            if i < #info_elements then target_info_width = target_info_width + 14 end
        end
        if #info_elements > 0 then target_info_width = target_info_width + 14 end
        if target_info_width > watermark_anim.info_width then
            watermark_anim.info_width = target_info_width
        else
            watermark_anim.info_width = lerping(watermark_anim.info_width, target_info_width, 0.12)
        end

        local info_w = math.ceil(watermark_anim.info_width)
        local total_w = (show_prefix and prefix_w or 0) + ((show_prefix and info_w > 5) and 4 or 0) + info_w
        if total_w < 1 then return end

        local x, y = menu.drag.watermark.x:get(), menu.drag.watermark.y:get()
        local max_x = math.max(0, width - total_w)
        x = math.max(0, math.min(x, max_x))
        local drag_state = drag:create("watermark", vector(x, y), vector(total_w, panel_h),
            menu.drag.watermark.x, menu.drag.watermark.y, nil, nil, 0, 0, max_x, height - panel_h)
        x, y = menu.drag.watermark.x:get(), menu.drag.watermark.y:get()
        x = math.max(0, math.min(x, max_x))
        draw_drag_overlay("watermark", enabled, drag_state)

        if show_prefix then
            glass_ui.panel(x, y, prefix_w, panel_h, accent, alpha, 7)
            local k_texture = get_k_bg_texture()
            if k_texture ~= nil then
                renderer.texture(k_texture, x + 1, y, 24, 24, 255, 255, 255, alpha, "f")
            else
                glass_ui.text(x + 8, y + 4, 255, 255, 255, alpha, "logo", "K")
            end
        end

        if info_w > 5 then
            local ix = x + (show_prefix and prefix_w + 4 or 0)
            glass_ui.panel(ix, y, info_w, panel_h, accent, alpha, 7)
            local tx = ix + 7
            for i, element in ipairs(info_elements) do
                glass_ui.text(tx, y + 5, accent[1], accent[2], accent[3], alpha, "regular", element)
                tx = tx + glass_ui.measure("regular", element)
                if i < #info_elements then
                    glass_ui.rect(tx + 6, y + 6, 1, 10, 255, 255, 255, 255)
                    tx = tx + 14
                end
            end
        end
    end

    local act, res = false, nil
    local binds = {
        {ref.dt[1], "Double tap", true},
        {ref.os[1], "On shot anti-aim", true},
        {ref.minimum_damage_override[1], "Override damage", true},
        {ref.autopeek[1], "Quick peek assist", true},
        {ref.safepoint, "Safe point", false},
        {ref.forcebaim, "Force baim", false},
        {nil, "Hitchance", function()
            _, res = hit[hit_config_index].hot:get()
            act = hit[hit_config_index].hot:get()
            return act and true or false, res
        end},
        {scout.jumpstop_hotkey, "Jump scout", false},
        {nil, "AI Peek", function()
            _, res = menu.ragebot.ai_hotkey:get()
            act = menu.ragebot.ai_hotkey:get() and menu.ragebot.ai:get()
            return act and true or false, res
        end},
        {nil, "Edge yaw", function()
            _, res = menu.antiaim.edge_yaw:get()
            act = menu.antiaim.edge_yaw:get() and menu.antiaim.yaw_direction:get("Edge Yaw")
            return act and true or false, res
        end},
        {nil, "Freestanding", function()
            _, res = menu.antiaim.freestanding_hotkey:get()
            act = menu.antiaim.freestanding_hotkey:get() and menu.antiaim.yaw_direction:get("Freestanding")
            return act and true or false, res
        end},
        {menu.ragebot.magic_key, "Magic key", false},
        {menu.ragebot.auto_tp_hot, "Automatic teleport", false},
        {ref.fakeduck, "Duck peek assist", false},
        {ref.ping[1], "Ping spike", true},
        {ref.edge_jump[1], "Edge jump", true},
        {ref.other_slowmotion[1], "Slow motion", true},
    }

    local function read_bind(bind)
        local ref_obj = type(bind[1]) == "table" and bind[1][1] or bind[1]
        if type(bind[3]) == "function" then
            local active, status = bind[3]()
            return active, status
        elseif bind[3] == true then
            local active, hotkey_type = ref_obj:get_hotkey()
            return active and ref_obj:get(), hotkey_type
        end
        return ref_obj:get()
    end

    local function status_text_for(name, hotkey_type)
        if name == "Ping spike" then
            return tostring(ref.ping[2]:get()) .. "ms"
        elseif name == "Override damage" then
            return tostring(ref.minimum_damage_override[2]:get())
        elseif name == "Hitchance" then
            return tostring(hit[hit_config_index].ovr_hit:get())
        elseif type(hotkey_type) == "string" then
            return hotkey_type
        end
        return (hotkey_type == 0 and "Always on")
            or (hotkey_type == 1 and "On hotkey")
            or (hotkey_type == 2 and "Toggle")
            or (hotkey_type == 3 and "Off hotkey")
            or "Always on"
    end

    function solus.hotkey()
        local enabled = menu.visuals.ui_main:get("Keybinds")
        local lp = entity.get_local_player()
        local alive = lp ~= nil and entity.is_alive(lp)
        if not alive and not ui.is_menu_open() then return end

        local accent = solus.panel_color("hotkey")
        local selected = menu.visuals.hotkey_item:get()
        local rows = {}
        local max_name_w, max_status_w = glass_ui.measure("regular", "Hotkeys"), 0

        if alive then
            for _, bind in ipairs(binds) do
                local ok, active, hotkey_type = pcall(read_bind, bind)
                if ok and active then
                    local name = bind[2]
                    local show = not selected or #selected == 0 or helpers.table_contains(selected, name)
                    if show then
                        local status = status_text_for(name, hotkey_type)
                        local nw = glass_ui.measure("regular", name)
                        local sw = glass_ui.measure("regular", "[" .. status .. "]")
                        max_name_w = math.max(max_name_w, nw)
                        max_status_w = math.max(max_status_w, sw)
                        table.insert(rows, {name = name, status = status, nw = nw, sw = sw})
                    end
                end
            end
        end

        if #rows == 0 and ui.is_menu_open() then
            local preview_status = "Toggle"
            table.insert(rows, {
                name = "Double tap",
                status = preview_status,
                nw = glass_ui.measure("regular", "Double tap"),
                sw = glass_ui.measure("regular", "[" .. preview_status .. "]")
            })
            max_name_w = math.max(max_name_w, rows[1].nw)
            max_status_w = math.max(max_status_w, rows[1].sw)
        end

        local target_alpha = enabled and (#rows > 0 or ui.is_menu_open()) and 255 or 0
        local alpha = motion.new("hotkey_alpha", target_alpha, 0.1)
        if not enabled and alpha < 1 then
            solus.active_callbacks.hotkey = false
            utils.set_event_callback("paint_ui", solus.hotkey, false)
            return
        end

        local header_h, row_h = 22, 15
        local rows_h = #rows > 0 and (#rows * row_h + 4) or 0
        local target_w = math.max(150, max_name_w + max_status_w + 24)
        local target_h = header_h + rows_h
        local panel_w = motion.new("hotkey_panel_w", target_w, 0.115)
        local panel_h = motion.new("hotkey_panel_h", target_h, 0.115)
        local x, y = menu.drag.hotkey.x:get(), menu.drag.hotkey.y:get()

        local drag_state = drag:create("hotkeys", vector(x, y), vector(panel_w, panel_h),
            menu.drag.hotkey.x, menu.drag.hotkey.y, nil, nil, 0, 0, width - panel_w, height - panel_h)
        x, y = menu.drag.hotkey.x:get(), menu.drag.hotkey.y:get()
        draw_drag_overlay("hotkeys", enabled, drag_state)

        glass_ui.panel(x, y, panel_w, panel_h, accent, alpha, 7)
        local header = "Hotkeys"
        local header_w = glass_ui.measure("regular", header)
        glass_ui.text(x + panel_w / 2 - header_w / 2, y + 5, 236, 237, 243, alpha, "regular", header)

        for i, row in ipairs(rows) do
            local row_offset = header_h + 2 + (i - 1) * row_h
            local row_alpha = math.floor(alpha * clamp((panel_h - row_offset) / row_h, 0, 1))
            if row_alpha > 1 then
                local row_y = y + row_offset
                glass_ui.text(x + 6, row_y, 220, 222, 228, row_alpha, "regular", row.name)
                local status = "[" .. row.status .. "]"
                local sw = glass_ui.measure("regular", status)
                glass_ui.text(x + panel_w - sw - 6, row_y, accent[1], accent[2], accent[3], row_alpha, "regular", status)
            end
        end
    end

    local m_contents = {}
    function solus.avatar(spectator)
        local steam_id = entity.get_steam64(spectator)
        local avatar = images.get_steam_avatar(steam_id)
        if steam_id == nil or avatar == nil then return nil end
        if m_contents[spectator] == nil or m_contents[spectator].conts ~= avatar.contents then
            m_contents[spectator] = {
                conts = avatar.contents,
                texture = renderer.load_rgba(avatar.contents, avatar.width, avatar.height)
            }
        end
        return m_contents[spectator].texture
    end

    function solus.get_spectating_players()
        local me = entity.get_local_player()
        local players, observing = {}, me
        for i = 1, globals.maxplayers() do
            if entity.get_classname(i) == 'CCSPlayer' then
                local mode = entity.get_prop(i, 'm_iObserverMode')
                local target = entity.get_prop(i, 'm_hObserverTarget')
                if target ~= nil and target <= 64 and not entity.is_alive(i) and (mode == 4 or mode == 5) then
                    players[target] = players[target] or {}
                    if i == me then observing = target end
                    table.insert(players[target], i)
                end
            end
        end
        return players, observing
    end

    function solus.spectators()
        local enabled = menu.visuals.ui_main:get("Spectator")
        local lp = entity.get_local_player()
        if lp == nil and not ui.is_menu_open() then return end

        local accent = solus.panel_color("spectator")
        local x, y = menu.drag.spectator.x:get(), menu.drag.spectator.y:get()
        local spectators, observing = solus.get_spectating_players()
        local rows = {}
        local max_name_w = glass_ui.measure("regular", "Spectators")

        if spectators[observing] then
            local index = 1
            for _, spectator_id in pairs(spectators[observing]) do
                if spectator_id ~= entity.get_local_player() then
                    local name = entity.get_player_name(spectator_id) or "unknown"
                    local display = index .. ". " .. name
                    max_name_w = math.max(max_name_w, glass_ui.measure("regular", display))
                    table.insert(rows, {id = spectator_id, text = display})
                    index = index + 1
                end
            end
        end

        local has_spectators = #rows > 0
        local alpha = motion.new("spectator_main_alpha", enabled and (has_spectators or ui.is_menu_open()) and 255 or 0, 0.1)
        if not enabled and alpha < 1 then
            solus.active_callbacks.spectators = false
            utils.set_event_callback("paint_ui", solus.spectators, false)
            return
        end

        local header_h, row_h = 22, 15
        local rows_h = has_spectators and (#rows * row_h + 4) or 0
        local count_w = glass_ui.measure("regular", tostring(#rows))
        local target_w = math.max(150, max_name_w + 38, glass_ui.measure("regular", "Spectators") + count_w + 26)
        local target_h = header_h + rows_h
        local panel_w = motion.new("spectator_panel_w", target_w, 0.115)
        local panel_h = motion.new("spectator_panel_h", target_h, 0.115)
        local drag_state = drag:create("spectators", vector(x, y), vector(panel_w, panel_h),
            menu.drag.spectator.x, menu.drag.spectator.y, nil, nil, 0, 0, width - panel_w, height - panel_h)
        x, y = menu.drag.spectator.x:get(), menu.drag.spectator.y:get()
        draw_drag_overlay("spectators", enabled, drag_state)

        glass_ui.panel(x, y, panel_w, panel_h, accent, alpha, 7)
        local title = "Spectators"
        glass_ui.text(x + 7, y + 5, 236, 237, 243, alpha, "regular", title)

        local count_text = tostring(#rows)
        local cw = glass_ui.measure("regular", count_text)
        glass_ui.text(x + panel_w - cw - 7, y + 5, accent[1], accent[2], accent[3], alpha, "regular", count_text)

        if has_spectators then
            for i, spectator in ipairs(rows) do
                local sa = motion.new("spectator_alpha_" .. spectator.id, 255, 0.1)
                local row_offset = header_h + 2 + (i - 1) * row_h
                local row_alpha = math.floor(alpha * sa / 255 * clamp((panel_h - row_offset) / row_h, 0, 1))
                if row_alpha > 1 then
                    local cy = y + row_offset
                    local text_x = x + 6
                    local avatar = solus.avatar(spectator.id)
                    if avatar ~= nil then
                        renderer.texture(avatar, math.floor(x + 6), math.floor(cy),
                            12, 12, 255, 255, 255, row_alpha)
                        text_x = x + 22
                    end
                    glass_ui.text(text_x, cy, 228, 229, 235, row_alpha, "regular", spectator.text)
                end
            end
        end

        for spectator_id in pairs(m_contents) do
            local still_spectating = false
            if spectators[observing] then
                for _, s_id in pairs(spectators[observing]) do
                    if s_id == spectator_id then
                        still_spectating = true
                        break
                    end
                end
            end
            if not still_spectating then m_contents[spectator_id] = nil end
        end
    end

    function solus.on_menu_change()
        if menu.visuals.ui_main:get("Watermark") then solus.active_callbacks.watermark = true end
        if menu.visuals.ui_main:get("Keybinds") then solus.active_callbacks.hotkey = true end
        if menu.visuals.ui_main:get("Spectator") then solus.active_callbacks.spectators = true end

        utils.set_event_callback("paint_ui", solus.watermark, solus.active_callbacks.watermark)
        utils.set_event_callback("paint_ui", solus.hotkey, solus.active_callbacks.hotkey)
        utils.set_event_callback("paint_ui", solus.spectators, solus.active_callbacks.spectators)
        other_ind.on_menu_change()
    end

    menu.visuals.ui_main:set_callback(solus.on_menu_change)
    solus.on_menu_change()
end

local quick = {} do 
     function quick.switch(e)
        if not menu.misc.quickswitch:get() then 
            return 
        end

        local lp = entity.get_local_player()
        local userid = client.userid_to_entindex(e.userid)
        if not entity.is_alive(lp) or lp == nil then return end

        if userid ~= lp then
            return
        end

        local weapon = entity.get_player_weapon(lp)
        if not weapon then 
            return 
        end

        local weapon_name = entity.get_classname(weapon)

        if weapon_name == ("CHEGrenade") or weapon_name == ("CSmokeGrenade") or weapon_name == ("CMolotovGrenade") then
            return
        end
        
        if weapon_name == "CWeaponTaser" then
            client.exec("slot3") 
            client.exec("slot2") 
            client.exec("slot1") 
        end
    end

    function quick.switch2(e)
        if not menu.misc.quickswitch:get() then 
            return 
        end

        local lp = entity.get_local_player()
        local userid = client.userid_to_entindex(e.userid)
        if not entity.is_alive(lp) or lp == nil then return end
        if userid ~= lp then
            return
        end
        local weapon = e.weapon
        local infinite_ammo = cvar.sv_infinite_ammo:get_int()
        local taser_recharge = cvar.mp_taser_recharge_time:get_int()

        if weapon == "CWeaponTaser" then
            if infinite_ammo ~= 1 and taser_recharge < 0 then
                local current_weapon = entity.get_player_weapon(lp)
                if current_weapon then
                    client.exec("slot3") 
                    client.exec("slot2") 
                    client.exec("slot1") 
                end
            end
        end
    end
    menu.misc.quickswitch:set_callback(function()  

        local state_en = menu.misc.quickswitch:get()
       
        utils.set_event_callback('weapon_fire', quick.switch, state_en)
        utils.set_event_callback('bullet_impact', quick.switch2, state_en)
    end)
end

local kibit_tracers do
    local tracer_list = {}

    local function on_paint()
        if not menu.visuals.tracer_en:get() then return end

        local cur_time = globals.realtime()

        for i = #tracer_list, 1, -1 do
            local data = tracer_list[i]
            local life_time = data.die_time - cur_time

            if life_time <= 0 then
                table.remove(tracer_list, i)
                goto continue
            end

            local alpha_step = life_time < 0.7 and (life_time / 0.7) or 1.0
            local r, g, b, a = 255, 255, 255, 255
            local final_alpha = a * alpha_step

            local x1, y1 = renderer.world_to_screen(data.start_pos[1], data.start_pos[2], data.start_pos[3])
            local x2, y2 = renderer.world_to_screen(data.end_pos[1], data.end_pos[2], data.end_pos[3])

            if x1 and y1 and x2 and y2 then
                renderer.line(x1, y1, x2, y2, r, g, b, final_alpha)
            end

            ::continue::
        end
    end

    local function on_aim_fire(e)
        if not menu.visuals.tracer_en:get() then return end

        local lx, ly, lz = client.eye_position()
        
        table.insert(tracer_list, {
            start_pos = {lx, ly, lz},
            end_pos = {e.x, e.y, e.z},
            die_time = globals.realtime() + 3.0
        })
    end

    local function on_round_start()
        tracer_list = {}
    end

    menu.visuals.tracer_en:set_callback(function() 
        local check = menu.visuals.tracer_en:get()
        utils.set_event_callback("aim_fire", on_aim_fire, check)
        utils.set_event_callback("paint", on_paint, check)
        utils.set_event_callback("round_prestart", on_round_start, check)
    end)
end

local world_marker do
    local list = { }
    local coords = { }

    local is_callback_active = false

    local miss_reasons = {
        ["?"] = "Unknown",
        ["spread"] = "Spread",
        ["death"] = "Death",
        ["unregistered"] = "No register",
        ["prediction error"] = "Pred.Error"
    }

    local function get_id(id)
        if id == nil then return 1 end
        return (id % 15) + 1
    end

    local function on_aim_fire(e)
        coords[get_id(e.id)] = vector(e.x, e.y, e.z)
    end

    local function add_marker(id, is_hit, reason)
        local point = coords[get_id(id)]
        if point == nil then return end

        table.insert(list, {
            time = globals.realtime() + 3.0,
            point = point,
            is_hit = is_hit,
            reason = reason
        })
    end

    local function on_aim_hit(e)
        if not menu.visuals.kibit_marker:get("Hit") then return end
        add_marker(e.id, true, nil)
    end

    local function on_aim_miss(e)
        if not menu.visuals.kibit_marker:get("Miss") then return end
        local reason = miss_reasons[e.reason] or e.reason:upper()
        add_marker(e.id, false, reason)
    end

    local function on_paint()
        local show_hit = menu.visuals.kibit_marker:get("Hit")
        local show_miss = menu.visuals.kibit_marker:get("Miss")
        
        if not show_hit and not show_miss then 
            return 
        end

        local time = globals.realtime()

        for i = #list, 1, -1 do
            if time > list[i].time then
                table.remove(list, i)
            end
        end

        if not show_hit and not show_miss and #list == 0 and is_callback_active then
            is_callback_active = false
            return
        end

        for i = 1, #list do
            local data = list[i]

            if data.is_hit and not show_hit then goto continue end
            if not data.is_hit and not show_miss then goto continue end

            local liferemaining = data.time - time
            local alpha = liferemaining < 0.7 and (liferemaining / 0.7) or 1.0

            local x, y = renderer.world_to_screen(data.point:unpack())
            if x == nil or y == nil then goto continue end

            local thickness, size = 1, 5

            local r, g, b = menu.visuals.kibit_color:get()
            if not data.is_hit then
                r, g, b = menu.visuals.kibit_color2:get()
            end

            renderer.rectangle(x - size, y - thickness, size * 2, thickness * 2, r, g, b, 255 * alpha)
            renderer.rectangle(x - thickness, y - size, thickness * 2, size * 2, r, g, b, 255 * alpha)

            if not data.is_hit and menu.visuals.kibit_miss:get() then
                renderer.text(x + size + 4, y - 4, r, g, b, 255 * alpha, "b", 0, data.reason)
            end
            
            ::continue::
        end
    end

    local function update_marker_state()
        local selected = menu.visuals.kibit_marker:get()
        if #selected > 0 then
            is_callback_active = true
            utils.set_event_callback("aim_fire", on_aim_fire, is_callback_active)
            utils.set_event_callback("aim_hit", on_aim_hit, is_callback_active)
            utils.set_event_callback("aim_miss", on_aim_miss, is_callback_active)
            utils.set_event_callback("paint", on_paint, is_callback_active)   
        end
    end

    menu.visuals.kibit_marker:set_callback(update_marker_state)
end

local misc = {} do
    function misc.fastladder(e)
        if not menu.misc.fast_ladder:get() then return end 
        local local_player = entity.get_local_player()
        local pitch, yaw = client.camera_angles()
        if entity.get_prop(local_player, 'm_MoveType') == 9 then
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

    local GameStateAPI = panorama.open().GameStateAPI
    local lastChatMessage = {}

    function misc.onPlaySay(e)
	    local sender = client.userid_to_entindex(e.userid)
        if not entity.is_enemy(sender) then return end

        if GameStateAPI.IsSelectedPlayerMuted(GameStateAPI.GetPlayerXuidStringFromEntIndex(sender)) then return end

        client.delay_call(0.2, function()
            if lastChatMessage[sender] ~= nil and math.abs(globals.realtime() - lastChatMessage[sender]) < 0.4 then
                return
            end

            local enemyTeamName = entity.get_prop(entity.get_player_resource(), "m_iTeam", sender) == 2 and "T" or "CT"

            local placeName = entity.get_prop(sender, "m_szLastPlaceName")
            local enemyName = entity.get_player_name(sender)
            
            local localizeStr = ("Cstrike_Chat_%s_%s"):format(enemyTeamName, entity.is_alive(sender) and "Loc" or "Dead")
            local msg = localize(localizeStr, {
                s1 = enemyName,
                s2 = e.text,
                s3 = localize(placeName ~= "" and placeName or "UI_Unknown")
            })

            chat.print_player(sender, msg)
        end)
    end

    function misc.onPlayChat(e)
        if not entity.is_enemy(e.entity) then return end
        lastChatMessage[e.entity] = globals.realtime()
    end

    menu.misc.fast_ladder:set_callback(function() 
       utils.set_event_callback('setup_command', misc.fastladder, menu.misc.fast_ladder:get())
    end)
    

    menu.misc.chat_revealer:set_callback(function ()
        local update_callback = menu.misc.chat_revealer:get() 
        utils.set_event_callback('player_say', misc.onPlaySay, update_callback)
        utils.set_event_callback('player_chat', misc.onPlayChat, update_callback)
    end)
end

local drop_nades = {} do
    local key_click_cache = false
    local drop_end_time = 0

    function misc.drop_nades(cmd)
        if not menu.misc.drop_nades:get() then
            return
        end

        local nades_list = {
            ["HE Grenade"] = "weapon_hegrenade",
            ["Molotov"] = "weapon_molotov",
            ["Smoke"] = "weapon_smokegrenade"
        }
        
        local me = entity.get_local_player()
        if not me or not entity.is_alive(me) then
            return
        end
    
        local weapons = {}
        for i = 0, 64 do
            local weapon = entity.get_prop(me, "m_hMyWeapons", i)
            if weapon and weapon ~= 0 then
                local weapon_name = entity.get_classname(weapon)
                if not weapon_name then
                    return
                end

                if weapon_name == "CIncendiaryGrenade" then
                    nades_list["Molotov"] = "weapon_incgrenade"
                end

                weapons[weapon_name] = true
            end
        end

        local selected_nades = {}
        for grenade_type, grenade_name in pairs(nades_list) do
            local g_class = grenade_type
            if g_class == "HE Grenade" then
                g_class = "HE"
            end
            
            local grenade_class = "C" .. g_class .. "Grenade"
            if grenade_type == "Molotov" and weapons["CIncendiaryGrenade"] then
                grenade_class = "CIncendiaryGrenade"
            end

            if weapons[grenade_class] and menu.misc.drop_items:get(grenade_type) then
                table.insert(selected_nades, grenade_name)
            end
        end
    
        local drop_key = menu.misc.drop_hotkey:get()
        local is_dropping = globals.realtime() < drop_end_time

        if is_dropping then
            ref.yawbase:override('Local View')
            ref.pitch[1]:override('Custom')
            ref.pitch[2]:override(0)
            ref.yaw[1]:override('180')
            ref.yaw[2]:override(180)
        end
        
        if drop_key and not key_click_cache and #selected_nades > 0 then
            local base_delay = 0.1 * (#selected_nades - 1) + 0.05
            local buffer = 0.2 
            drop_end_time = globals.realtime() + base_delay + buffer
            
            ref.yawbase:override('Local View')
            ref.pitch[1]:override('Custom')
            ref.pitch[2]:override(0)
            ref.yaw[1]:override('180')
            ref.yaw[2]:override(180)
            
            for index, grenade in ipairs(selected_nades) do
                local delay = 0.1 * (index - 1) 
                client.delay_call(delay, function()
                    client.exec("use " .. grenade)
                    client.delay_call(0.05, function()
                        client.exec("drop")
                    end)
                end)
            end
        end
    
        key_click_cache = drop_key
    end

    menu.misc.drop_nades:set_callback(function() 
        local state_en = menu.misc.drop_nades:get()
        utils.set_event_callback('setup_command', misc.drop_nades, state_en)
    end)
end

local clantag = {} do 
    function clantag.anim(text, indices)
        local text_anim = "6,p6,pa6,pac6,pac6,paca6,pacan6,pacante6,6pacantech,pacantech, pacantech,pacantech,6pacantech,pacantec6,pacante6,pacan6,paca6,pac6,pac6,pa6,p6,6"
        local sequences = {}
        
        for seq in text_anim:gmatch("[^,]+") do
            table.insert(sequences, seq)
        end
        
        local tickinterval = globals.tickinterval()
        local tickcount = globals.tickcount()
        local i = tickcount / math.floor(0.3 / tickinterval + 0.5)
        i = math.floor(i % #sequences) + 1
        
        return sequences[i]
    end

    local cache = nil
    function clantag.set(str)
        if str ~= cache then
            client.set_clan_tag(str) 
            cache = str
        end
    end

    function clantag.reset()
        clantag.set("")
    end

    function clantag.clantag_disabler()
        local misctab_clantag = menu.misc.clantag:get()
        local clantag = ref.clantag:get()
        if misctab_clantag then
            ref.clantag:set_enabled(false)
            ref.clantag:override(false)
        else
            ref.clantag:override()
            ref.clantag:set_enabled(true)     
        end
    end

    function clantag.clantag_handle()
        local misctab_clantag = menu.misc.clantag:get()
        clantag.clantag_disabler()
        if misctab_clantag then
            local local_player = entity.get_local_player()
            if local_player ~= nil and globals.chokedcommands() == 0 then
                local gamerules = entity.get_game_rules()
                local text = clantag.anim("pacantech", {})
                
                if entity.get_prop(gamerules, "m_gamePhase") == 5 then
                    text = "pacantech" 
                elseif entity.get_prop(gamerules, "m_timeUntilNextPhaseStarts") ~= 0 then
                    text = "pacantech" 
                end
                clantag.set(text)
            end
        else
            clantag.set("")
        end
    end

    client.set_event_callback("shutdown", clantag.reset)

    menu.misc.clantag:set_callback(function() 
        utils.set_event_callback("paint", clantag.clantag_handle, menu.misc.clantag:get())
        clantag.clantag_disabler()
        clantag.set("")
    end)
end

local phrases = {
    kill = {
        {'pacantech', 0.3},
        {'покупай братан', 0.3, 'ахуевшая луа pacantech', 1.0},
        {"куда летишь фрик", 0.3},
        {'смотри как ебу всех', 0.3, 'завидуешь?', 1.0},
        {'куда миснул?', 0.3, 'в pacantech братуха', 1.0},
        {'хуясе пацантеч рекод ебет', 0.3, 'видел?', 1.0},
        {'бля ты бомж', 0.3, 'учись играть', 1.0},
        {'нахуй иди', 0.3, 'pacantech купи', 1.0},
        {'норм переиграл?', 0.3, 'а теперь сиди и думай', 1.0},
        {'слабовато', 0.3, 'аххахах)', 1.0},
        {'хуясе ты сыграл хуево', 0.3, 'бомж ебаный =D', 1.0},
        {'две в сырной', 0.3},
        {"куда миснул?", 0.3},
        {'умывайся кровью пидорок', 1.0},
        {'pacantech > all', 0.3},
        {'думай еще', 1.0},
        {'здраво я тебя выебал однако', 0.3},
        {'изи для пацантеч ', 0.3},
        {'парализовало тебя чтоли петушка?', 1.0},
        {'пидор иди в таро играй лучше', 0.3},
        {'сеты мои на пацантеч прикупи', 0.3},
        {'ты ебаный водитель матиза', 0.3},
        {'ты раб ебаный', 0.3},
        {'пес ты хули делаешь?', 1.0},
        {'Новый мир сделал пацантеч', 0.3},
        {'мой килл моя еда', 0.3},
        {'резик в пацантеч ахуенный', 0.3},
        {'опять переигран', 0.3},
        {'пососи мне', 1.0},

    },

    death = {
        {') ', 0.5},
    }
}

local phrase_count = {
    kill = 0,
    death = 0,
    killst = 0,
    deathst = 0
}

local calculate_kills_deaths do
    local function setup(e)
        local player = entity.get_local_player()
        local victim = client.userid_to_entindex(e.userid)
        local attacker = client.userid_to_entindex(e.attacker)

        if not player or not victim or not attacker then
            return
        end
        local function is_bot(ent)
            local s64 = entity.get_steam64(ent)

            if s64 == nil or s64 == "0" or s64 == 0 then 
                return true 
            end
            return false
        end

        if attacker == player and victim ~= player then
            if not is_bot(victim) and entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 0 then
                phrase_count.killst = phrase_count.killst + 1
            end
        elseif victim == player and attacker ~= player then
            if not is_bot(attacker) and entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 0 then
                phrase_count.deathst = phrase_count.deathst + 1
            end
        end
    end

    client.set_event_callback("player_death", setup)
end

local trash_talking = {} do
    function trash_talking.say_phrases (phrase_table)
        local current_delay = 0
        local i = 1
        while i <= #phrase_table do
            local message = phrase_table[i]
            i = i + 1
            local delay = 3
            if i <= #phrase_table then
                local next_val = phrase_table[i]
                if type(next_val) == "number" then
                    delay = next_val
                    i = i + 1
                end
            end
           
            current_delay = current_delay + delay
            client.delay_call(current_delay, function ()
                client.exec(('say %s'):format(message))
            end)
        end
    end
    function trash_talking.on_player_death (e)
        if not menu.misc.chat_spammer:get() then
            return
        end
   
        local player, victim, attacker = entity.get_local_player(), client.userid_to_entindex(e.userid), client.userid_to_entindex(e.attacker)
        if not player or not victim or not attacker then
            return
        end
   
        if attacker == player and victim ~= player then
            phrase_count.kill = (phrase_count.kill % #phrases.kill) + 1
            phrase_count.killst = phrase_count.killst + 1
        elseif victim == player and attacker ~= player then
            phrase_count.death = (phrase_count.death % #phrases.death) + 1
            phrase_count.deathst = phrase_count.deathst + 1
        end
   
        local selected_phrases = {
            kill = phrases.kill[phrase_count.kill],
            death = phrases.death[phrase_count.death]
        }
   
        if menu.misc.chat_spammer_type:get('Kill') and attacker == player and victim ~= player then
            trash_talking.say_phrases(selected_phrases.kill)
        end
        if menu.misc.chat_spammer_type:get('Death') and victim == player and attacker ~= player then
            trash_talking.say_phrases(selected_phrases.death)
        end
    end

    function update_spammer_state()
        local master_on = menu.misc.chat_spammer:get()
        utils.set_event_callback("player_death", trash_talking.on_player_death, master_on)
    end

    menu.misc.chat_spammer:set_callback(update_spammer_state)
end

menu.misc.filter_console:set_callback(function ()
    if menu.misc.filter_console:get() then
        client.exec('cam_collision 0')
    else
        client.exec('cam_collision 1')
    end
    if menu.misc.filter_console:get() then
        cvar.developer:set_int(0)
        cvar.con_filter_enable:set_int(1)
        cvar.con_filter_text:set_string('IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN')
        client.exec('con_filter_enable 1')
    else
        cvar.con_filter_enable:set_int(0)
        cvar.con_filter_text:set_string('')
        client.exec('con_filter_enable 0')
    end
end)

local r8 = {} do
    local state = {
        first_command_sent_first_half = false,
        second_command_sent_first_half = false,
        first_command_sent_second_half = false,
        second_command_sent_second_half = false,
    }

    function r8.get_current_gamestate()
        local game_rules = entity.get_game_rules()
        if game_rules == nil then 
            return nil 
        end

        local game_phase = entity.get_prop(game_rules, "m_gamePhase")

        return {
            is_warmup = entity.get_prop(game_rules, "m_bWarmupPeriod") == 1,
            total_rounds = entity.get_prop(game_rules, "m_totalRoundsPlayed") or 0,
            side_switch_round = game_phase == 3
        }
    end

    function r8.reset_state()
        state.first_command_sent_first_half = false
        state.second_command_sent_first_half = false
        state.first_command_sent_second_half = false
        state.second_command_sent_second_half = false
    end

    function r8.r8()
        if not menu.misc.r8_round:get() then return end
        client.delay_call(0.1, function()
            local gamestate = r8.get_current_gamestate()
            if not gamestate then return end

            if not gamestate.is_warmup then
                if gamestate.total_rounds == 0 then
                    client.exec("say /r8")
                    state.first_command_sent_first_half = true
                elseif gamestate.total_rounds == 1 and not state.second_command_sent_first_half and state.first_command_sent_first_half then
                    client.exec("say /deagle")
                    state.second_command_sent_first_half = true
                elseif gamestate.side_switch_round and gamestate.total_rounds == 8 and not state.first_command_sent_second_half or gamestate.side_switch_round and gamestate.total_rounds == 15 and not state.first_command_sent_second_half then
                    client.exec("say /r8")
                    state.first_command_sent_second_half = true
                elseif (gamestate.side_switch_round and gamestate.total_rounds + 1) and state.first_command_sent_second_half and not state.second_command_sent_second_half then
                    client.exec("say /deagle")
                    state.second_command_sent_second_half = true
                end
            else
                r8.reset_state()
            end
        end)
    end
    menu.misc.r8_round:set_callback(function() 
        local state_en = menu.misc.r8_round:get()
        r8.reset_state()
        utils.set_event_callback("round_start", r8.r8, state_en)
        utils.set_event_callback("cs_game_disconnected", r8.reset_state, state_en)
        utils.set_event_callback("game_newmap", r8.reset_state, state_en)
        utils.set_event_callback("client_disconnect", r8.reset_state, state_en)
        utils.set_event_callback("begin_new_match", r8.reset_state, state_en)
    end)
end

local gamesense = {} do

    local logging = {}

    function gamesense.output(e)
        if not menu.misc.output_output:get() then return end
        table.insert(logging, {
            text = e.text,
            realtime = globals.realtime() + 5,
            alpha = 0,
            r = e.r,
            g = e.g,
            b = e.b,
            a = e.a,
            newline = (e.text:sub(-1) ~= '\0')
        })
    end

    function gamesense.logs()
        if not logging or #logging == 0 then
            return
        end

        local font = ''
        local font_select = menu.misc.output_font:get()
        if font_select == 'Small' then
            font = '-'
        elseif font_select == 'Verdana' then
            font = ''
        elseif font_select == 'Bold' then
            font = 'b'
        end

        for i = #logging, 1, -1 do
            local log = logging[i]
            log.measure = renderer.text(dpi..font, log.text)
            if not log then
                table.remove(logging, i)
            else
                local anim = menu.misc.output_anim:get() and 0.1 or 1
                if log.realtime > globals.realtime() then
                    log.alpha = clamp_motion(log.alpha, 1, anim)
                else
                    log.alpha = clamp_motion(log.alpha, 0, anim)
                end
                if log.alpha <= 0 then
                    table.remove(logging, i)
                end
            end
        end

        local y = menu.misc.output_y:get()
        local x = menu.misc.output_x:get()

        for i, log in ipairs(logging) do
            local prev_text = i > 1 and logging[i] and logging[i].text or log.text
            local text_width = vector(renderer.measure_text(dpi..font, prev_text))
            if font == '-' then
                prev_text = i > 1 and logging[i] and logging[i].text:upper() or log.text:upper()
                text_width = vector(renderer.measure_text(dpi..font, prev_text))
            end
    
            renderer.text(x, y - 2,
                log.r, log.g, log.b, log.a * log.alpha,
                dpi..font, nil, prev_text)
            if log.newline then
                x = menu.misc.output_x:get()
                y = y + (text_width.y + 5) * log.alpha
            else
                x = x + text_width.x
            end
        end
    end

    client.set_event_callback('paint_ui', gamesense.logs)
    client.set_event_callback("output", gamesense.output)
end

local anim = {} do 
    local is_on_ground = false
    local is_callback_active = false

    function anim.anim_breaker()
        local self = entity.get_local_player()
        if not self or not entity.is_alive(self) then return end

        local self_index = c_entity.new(self)
        if not self_index then return end
        
        local self_anim_state = self_index:get_anim_state()
        if not self_anim_state then return end

        local ducked = entity.get_prop(self, 'm_flDuckAmount') > 0.7

        if menu.misc.anim_air:get() == 'Static' and (antiaim.state() == 'Aerobic' or antiaim.state() == 'Aerobic+') then
            ref.other_legmovement[1]:override('Always slide')
            local earthquake = menu.misc.state:get('While in air') and menu.misc.m_elements:get('Earthquake') and math.abs(math.sin(globals.realtime() * menu.misc.speedearth:get())) * menu.misc.anim_elem_air:get() / 100 or menu.misc.anim_elem_air:get() / 100
            entity.set_prop(self, 'm_flPoseParameter', earthquake, 6)
        end

        if menu.misc.m_elements:get('Kangaroo') then
            entity.set_prop(self, "m_flPoseParameter", math.random(0, 2)/2, 2)
            entity.set_prop(self, "m_flPoseParameter", math.random(0, 2)/2, 1)
            entity.set_prop(self, "m_flPoseParameter", math.random(0, 2)/2, 2)
        end

        if menu.misc.m_elements:get('Adjust body lean') then
            local self_anim_overlay = self_index:get_anim_overlay(12)
            if not self_anim_overlay then return end

            local x_velocity = entity.get_prop(self, 'm_vecVelocity[0]')
            if math.abs(x_velocity) >= 3 then
                local earthquake = menu.misc.state:get('Adjust body lean') and menu.misc.m_elements:get('Earthquake') and math.abs(math.sin(globals.realtime() * menu.misc.speedearth:get())) * menu.misc.body_lean_value:get() / 100 or menu.misc.body_lean_value:get() / 100
                self_anim_overlay.weight = earthquake
            end
        end

        if menu.misc.anim_walk:get() == "Static" then
            entity.set_prop(self, "m_flPoseParameter", menu.misc.jitter_value:get()/100, 0)
        elseif menu.misc.anim_walk:get() == "Jitter" then
            entity.set_prop(self, "m_flPoseParameter", globals.tickcount() % 4 > 1 and menu.misc.jitter_value:get()/100 or 0, 0)
        elseif menu.misc.anim_walk:get() == "Advanced Jitter" then
            local speed = math.max(2, 10 - menu.misc.jitter_speed:get()/10)
            entity.set_prop(self, "m_flPoseParameter", globals.tickcount() % speed > 1 and menu.misc.jitter_value:get() / 100 or 1, 0)
        elseif menu.misc.anim_walk:get() == "Moonwalk" then
            ref.other_legmovement[1]:override('Never slide')
            entity.set_prop(self, "m_flPoseParameter", 0, 7)
        elseif menu.misc.anim_walk:get() == "Random" then
            entity.set_prop(self, "m_flPoseParameter", math.random(menu.misc.jitter_value:get(), 100) / 100, 0)
        end

        if menu.misc.anim_air:get() == "Random" then
            ref.other_legmovement[1]:override('Always slide')
            entity.set_prop(self, "m_flPoseParameter", math.random(0, 100) / 100, 6)
        elseif menu.misc.anim_air:get() == "Moonwalk" then
           ref.other_legmovement[1]:override('Always slide')
            local self_anim_overlay = self_index:get_anim_overlay(6)
            if not self_anim_overlay then return end
            local x_velocity = entity.get_prop(self, 'm_vecVelocity[0]')
            if math.abs(x_velocity) >= 3 then
                self_anim_overlay.weight = 1
            end
        end

        if menu.misc.m_elements:get('Reset pitch on land') then
            if not self_anim_state.hit_in_ground_animation or not is_on_ground then return end
            entity.set_prop(self, 'm_flPoseParameter', 0.5, 12)
        end
    end

    function anim.break_legs(cmd)
        is_on_ground = cmd.in_jump == 0

        if menu.misc.m_elements:get('Leg breaker') then   
            ref.other_legmovement[1]:override(cmd.command_number % 3 == 0 and 'Always slide' or 'Never slide')  
        end
    end

    function anim.update_anim_state()
        local walk_active = menu.misc.anim_walk:get() ~= "Off" 
        local air_active = menu.misc.anim_air:get() ~= "Off"
        local elements_active = #menu.misc.m_elements:get() > 0

        local should_be_active = walk_active or air_active or elements_active

        utils.set_event_callback("pre_render", anim.anim_breaker, should_be_active)
        utils.set_event_callback("setup_command", anim.break_legs, should_be_active)    
        ref.other_legmovement[1]:override()  
    end

    menu.misc.anim_walk:set_callback(anim.update_anim_state)
    menu.misc.anim_air:set_callback(anim.update_anim_state)
    menu.misc.m_elements:set_callback(anim.update_anim_state)
end

local output = {} do 
    function output.add(...)
        args = { ... }
        len = #args
        for i = 1, len do
            arg = args[i]
            r, g, b = unpack(arg)

            msg = {}

            if #arg == 3 then
                table.insert(msg, ' ')
            else
                for i = 4, #arg do
                    table.insert(msg, arg[i])
                end
            end
            msg = table.concat(msg)

            if len > i then
                msg = msg .. '\0'
            end

            client.color_log(r, g, b, msg)
        end
    end

    output.max_lerp_low_fps = (1 / 45) * 100
    function output.logs (start, end_pos, time)
        if start == end_pos then
            return end_pos
        end

        local frametime = globals.frametime() * 170
        time = time * math.min(frametime, output.max_lerp_low_fps)

        local val = start + (end_pos - start) * clamp(time, 0.01, 1)

        if(math.abs(val - end_pos) < 0.01) then
            return end_pos
        end

        return val
    end

    output.examples_added = false

    function output.add_example_logs()
        local r, g, b, a = menu.misc.aimbot_hit:get()
        local r1, g1, b1, a1 = menu.misc.aimbot_miss:get()
        local cur_time = globals.realtime()

        table.insert(output.aimbot_logs, 1, {
            is_example = true, 
            base = "Killed ",
            name = "Not more",
            hitgroup = "head",
            damage = tostring(100),
            alpha = 255,      
            alpha_text = 255,  
            add_x = 1,         
            add_y = 0,
            time = cur_time + 100, 
            color = { r, g, b, a }
        })

        table.insert(output.aimbot_logs, 1, {
            is_example = true,
            another = true,      
            verb = "Naded",      
            name = "Mersilith",       
            hitgroup = "generic",
            damage_val = 55,     
            alpha = 255,
            alpha_text = 255,
            add_x = 1,
            add_y = 0,
            time = cur_time + 100,
            color = { r, g, b, a }
        })

        table.insert(output.aimbot_logs, 1, {
            is_example = true,
            name = "Zu",
            hitgroup = "head",
            reason = "unknown", 
            alpha = 255,
            alpha_text = 255,
            add_x = 1,
            add_y = 0,
            time = cur_time + 100,
            color = { r1, g1, b1, a1 }
        })
    end

    output.aimbot_logs = { }
    function output.notifications()
        local lp = entity.get_local_player()
        if not ui.is_menu_open() and not entity.is_alive(lp) then return end
        local checker = #menu.misc.aimbot_on1:get() > 0
        if not checker then return end 

        local is_menu_open = ui.is_menu_open()

        if is_menu_open then
            if not output.menu_was_open then
                output.aimbot_logs = {}
                output.add_example_logs()
                output.examples_added = true
            end
            output.menu_was_open = true
        else
            output.menu_was_open = false
            output.examples_added = false
        end

        local row_step = 26
        local drag_w = 380
        local selected_count = 0
        if menu.misc.aimbot_on1:get('Hit') then selected_count = selected_count + 1 end
        if menu.misc.aimbot_on1:get('Miss') then selected_count = selected_count + 1 end
        if menu.misc.aimbot_on1:get('Another') then selected_count = selected_count + 1 end
        local drag_h = math.max(row_step, selected_count * row_step)
        local drag_y = menu.drag.output.y:get()
        local drag_state = drag:create("hitlogs", 
            vector(width / 2 - drag_w / 2, drag_y),
            vector(drag_w, drag_h),
            nil, menu.drag.output.y,
            nil, nil,
            0, 200, width, height / 2 + 380
        )

        local screen_alpha = motion.new('hitlogs_back', ui.is_menu_open() and checker and drag_state.dragging and 100 or 0, 0.06)
        glass_ui.rect(0, 0, width, height, 0, 0, 0, screen_alpha)

        local line_alpha = motion.new('hitlogs_line', ui.is_menu_open() and checker and drag_state.dragging and 255 or 0, 0.06)

        renderer.line(width/2, 195, width/2, height/2 + 465, 255, 255, 255, line_alpha)
        renderer.circle(width/2, 195, 255, 255, 255, line_alpha, 4, 360, 1)
        renderer.circle(width/2, height/2 + 465, 255, 255, 255, line_alpha, 4, 360, 1)

        local function build_parts(log)
            local accent = log.color or {255, 255, 255, 255}
            local white = {236, 237, 243, 255}
            if log.damage then
                return {
                    type = "hit",
                    accent = accent,
                    parts = {
                        {text = log.base or "Killed ", color = white},
                        {text = tostring(log.name or "unknown"), color = accent},
                        {text = " in the ", color = white},
                        {text = tostring(log.hitgroup or "?"), color = accent},
                        {text = " for ", color = white},
                        {text = tostring(log.damage or "0"), color = accent},
                        {text = " damage", color = white}
                    }
                }
            elseif log.reason then
                return {
                    type = "miss",
                    accent = accent,
                    parts = {
                        {text = "Missed ", color = white},
                        {text = tostring(log.name or "unknown"), color = accent},
                        {text = " in the ", color = white},
                        {text = tostring(log.hitgroup or "?"), color = accent},
                        {text = " due to ", color = white},
                        {text = tostring(log.reason or "unknown"), color = accent}
                    }
                }
            elseif log.another then
                return {
                    type = "another",
                    accent = accent,
                    parts = {
                        {text = tostring(log.verb or "Hit") .. " ", color = white},
                        {text = tostring(log.name or "unknown"), color = accent},
                        {text = " in the ", color = white},
                        {text = tostring(log.hitgroup or "?"), color = accent},
                        {text = " for ", color = white},
                        {text = tostring(log.damage_val or "0"), color = accent},
                        {text = " damage", color = white}
                    }
                }
            end
            return nil
        end

        local row_index = 0
        local now = globals.realtime()
        for i, logs in ipairs(output.aimbot_logs) do

            local should_draw = false
            if logs.damage and menu.misc.aimbot_on1:get('Hit') then should_draw = true end
            if logs.reason and menu.misc.aimbot_on1:get('Miss') then should_draw = true end
            if logs.another and menu.misc.aimbot_on1:get('Another') then should_draw = true end

            if should_draw then
                local built = build_parts(logs)
                if built ~= nil then
                    row_index = row_index + 1
                    local target_y = (row_index - 1) * row_step
                    if logs.is_example then
                        logs.alpha = 255
                        logs.alpha_text = 255
                        logs.add_y = target_y
                    elseif not is_menu_open then
                        local visible = logs.time + 3 > now and row_index <= 5
                        logs.alpha = output.logs(logs.alpha or 0, visible and 255 or 0, 0.06)
                        logs.alpha_text = logs.alpha
                        logs.add_y = output.logs(logs.add_y or 0, visible and target_y or target_y + 6, 0.06)
                    end

                    if logs.alpha > 1 then
                        local accent = coloring.normalize_color(built.accent)
                        local text_w = glass_ui.colored_width(built.parts, "regular")
                        local prefix_enabled = menu.misc.prefix_screen:get()
                        local panel_w = math.max(160, text_w + (prefix_enabled and 44 or 16))
                        local panel_h = 24
                        local x_pos = math.floor(width / 2 - panel_w / 2)
                        local y_pos = math.floor(drag_y + (logs.add_y or target_y))
                        glass_ui.panel(x_pos, y_pos, panel_w, panel_h, accent, logs.alpha, 7)

                        local text_x = x_pos + 8
                        if prefix_enabled then
                            local k_texture = get_k_bg_texture()
                            if k_texture ~= nil then
                                renderer.texture(k_texture, x_pos + 5, y_pos + 1, 24, 24, 255, 255, 255, logs.alpha_text, "f")
                            else
                                glass_ui.text(x_pos + 13, y_pos + 4, accent[1], accent[2], accent[3], logs.alpha_text, "logo", "K")
                            end
                            text_x = x_pos + 35
                        end
                        glass_ui.colored_text(text_x, y_pos + 6, built.parts, logs.alpha_text, "regular")
                    end
                end
            end

            if not logs.is_example and not is_menu_open then
                if logs.alpha < 1 then
                    table.remove(output.aimbot_logs, i)
                end
            end
        end

        if not is_menu_open then
            for i = #output.aimbot_logs, 1, -1 do
                if output.aimbot_logs[i] and output.aimbot_logs[i].is_example then
                    table.remove(output.aimbot_logs, i)
                end
            end
        end
    end

    output.hitboxes = {'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'}
    function output.on_aim_fire(e)
        local p_ent = e.target
        local me = entity.get_local_player()

        output[e.id] = {
            original = e,

            total_hits = entity.get_prop(me, 'm_totalHitsOnServer'),

            history = globals.tickcount() - e.tick,
		    correction = plist.get(p_ent, 'Correction active'),
        }
    end

    function output.on_aim_hit(e)
        if output[e.id] == nil then
            return 
        end
        
        local info = 
        {
            type = math.max(0, entity.get_prop(e.target, 'm_iHealth')) > 0,
            prefix = { menu.misc.aimbot_hit:get() },
            hit = { menu.misc.aimbot_hit:get() },
            name = entity.get_player_name(e.target),
            hitgroup = output.hitboxes[e.hitgroup + 1] or '?',
            aimed_hitgroup = output.hitboxes[output[e.id].original.hitgroup + 1] or '?',
            aimed_hitchance = string.format('%d%%', math.floor(output[e.id].original.hit_chance + 0.5)),
            hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
        }

        local r, g, b, a = menu.misc.aimbot_hit:get()
        if not ui.is_menu_open() then
            if menu.misc.aimbot_on1:get("Hit") then
                table.insert(output.aimbot_logs, 1, {
                    base = info.type and "Damaged " or "Killed ",
                    name = info.name,
                    hitgroup = info.hitgroup,
                    damage = tostring(e.damage),
                    alpha = 0, 
                    alpha_text = 0, 
                    add_x = 0, 
                    add_y = 0, 
                    time = globals.realtime(), 
                    color = { r, g, b, a }
                })
            end
        end

        if menu.misc.aimbot_on:get('Hit') then
            output.add({ info.prefix[1], info.prefix[2], info.prefix[3],"pacantech"}, 
                            { 255, 255, 255, ' ~ ' }, 
                            { 255, 255, 255, info.type and 'Damaged ' or 'Killed ' }, 
                            { info.hit[1], info.hit[2], info.hit[3],  info.name }, 
                            { 255, 255, 255, ' in the ' }, 
                            { info.hit[1], info.hit[2], info.hit[3], info.hitgroup }, 
                            { 255, 255, 255, info.hitgroup ~= info.aimed_hitgroup and ' (' or ''},
                            { info.hit[1], info.hit[2], info.hit[3], (info.hitgroup ~= info.aimed_hitgroup and info.aimed_hitgroup) or '' },
                            { 255, 255, 255, info.hitgroup ~= info.aimed_hitgroup and ')' or ''},
                            { 255, 255, 255, ' for ' or '' },
                            { info.hit[1], info.hit[2], info.hit[3], e.damage or '' },
                            { 255, 255, 255, e.damage ~= output[e.id].original.damage and ' (' or ''},
                            { info.hit[1], info.hit[2], info.hit[3], (e.damage ~= output[e.id].original.damage and output[e.id].original.damage) or '' },
                            { 255, 255, 255, e.damage ~= output[e.id].original.damage and ')' or ''},
                            { 255, 255, 255, ' damage' or '' },
                            { 255, 255, 255, ' (hc: ' }, { info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance },
                            { 255, 255, 255, '| bt: ' }, { info.hit[1], info.hit[2], info.hit[3], output[e.id].history },
                            { 255, 255, 255, ')' })
        end
    end

    local weapon_to_verb = { knife = 'Knifed', hegrenade = 'Naded', inferno = 'Burned' }
    function output.on_aim_another(e)
        local me = entity.get_local_player()
        local attacker_id = client.userid_to_entindex(e.attacker)
        
        if not me or not entity.is_alive(me) then return end
        if attacker_id == nil or attacker_id ~= me then return end

        local target_id = client.userid_to_entindex(e.userid)
        if target_id == me then return end

        local current_verb = weapon_to_verb[e.weapon]
        if current_verb == nil then 
            return 
        end

        local info = {
            prefix = { menu.misc.aimbot_hit:get() },
            hit = { menu.misc.aimbot_hit:get() },
            hitgroup = output.hitboxes[e.hitgroup + 1] or 'generic', 
        }

        local target_name = entity.get_player_name(target_id)
        local r, g, b, a = menu.misc.aimbot_hit:get()

        if menu.misc.aimbot_on:get('Another') then
             output.add({ info.prefix[1], info.prefix[2], info.prefix[3], 'pacantech'},
                { 255, 255, 255, ' ~ ' },
                { 255, 255, 255, current_verb .. ' ' },
                { info.hit[1], info.hit[2], info.hit[3],  target_name },
                { 255, 255, 255, ' in the ' }, 
                { info.hit[1], info.hit[2], info.hit[3], info.hitgroup },
                { 255, 255, 255, ' for '},
                { info.hit[1], info.hit[2], info.hit[3], e.dmg_health },
                { 255, 255, 255, ' damage'}
            )
        end

        if menu.misc.aimbot_on1:get('Another') then
            table.insert(output.aimbot_logs, 1, {
                another = true,
                name = target_name,
                hitgroup = info.hitgroup,
                verb = current_verb, 
                damage_val = e.dmg_health,
                alpha = 0, 
                alpha_text = 0, 
                add_x = 0, 
                add_y = 0, 
                time = globals.realtime(), 
                color = { r, g, b, a }
            })
        end
    end

    function output.on_aim_miss(e)

        local me = entity.get_local_player()
        local info = 
        {
            prefix = { menu.misc.aimbot_miss:get() },
            hit = { menu.misc.aimbot_miss:get() },
            name = entity.get_player_name(e.target),
            hitgroup = output.hitboxes[e.hitgroup + 1] or '?',
            aimed_hitgroup = output.hitboxes[output[e.id].original.hitgroup + 1] or '?',
            aimed_hitchance = string.format('%d%%', math.floor(output[e.id].original.hit_chance + 0.5)),
            hp = math.max(0, entity.get_prop(e.target, 'm_iHealth')),
            reason = e.reason,
        }

        local r, g, b, a = menu.misc.aimbot_miss:get()

     
        if info.reason == '?' then
            info.reason = 'unknown'

            if output[e.id].total_hits ~= entity.get_prop(me, 'm_totalHitsOnServer') then
                info.reason = 'damage rejection'
            end
        end
      
        if menu.misc.aimbot_on:get('Miss') then
            output.add({ info.prefix[1], info.prefix[2], info.prefix[3], "pacantech"}, 
                            { 255, 255, 255, ' ~ ' }, 
                            { 255, 255, 255, 'Missed ' }, 
                            { info.hit[1], info.hit[2], info.hit[3],  info.name }, 
                            { 255, 255, 255, ' in the ' }, 
                            { info.hit[1], info.hit[2], info.hit[3], info.hitgroup }, 
                            { 255, 255, 255, ' due to '},
                            { info.hit[1], info.hit[2], info.hit[3], info.reason },
                            { 255, 255, 255, ' (hc: ' }, { info.hit[1], info.hit[2], info.hit[3], info.aimed_hitchance }, 
                            { 255, 255, 255, '| bt: ' }, { info.hit[1], info.hit[2], info.hit[3], output[e.id].history },
                            { 255, 255, 255, ')' })
        end

        if not ui.is_menu_open() then
            if menu.misc.aimbot_on1:get("Miss") then
                table.insert(output.aimbot_logs, 1, {
                    name = info.name,
                    hitgroup = info.hitgroup,
                    reason = info.reason,
                    alpha = 0, 
                    alpha_text = 0, 
                    add_x = 0, 
                    add_y = 0, 
                    time = globals.realtime(), 
                    color = { r, g, b, a }
                })
            end
        end
    end

    function output.visible(visible)
        if menu.misc.aimbot_on:get('Miss') then
            ref.spread:set_enabled(false)
            ref.spread:override(false)
        else
            ref.spread:set_enabled(true)
            ref.spread:override()
        end   
    end

    client.set_event_callback("aim_fire", output.on_aim_fire)
    client.set_event_callback("player_hurt", output.on_aim_another)
    client.set_event_callback("aim_miss", output.on_aim_miss)
    client.set_event_callback("aim_hit", output.on_aim_hit)
    menu.misc.aimbot_on1:set_callback(function() 
        local state_en = #menu.misc.aimbot_on1:get() > 0 
        utils.set_event_callback("paint_ui", output.notifications, state_en)
    end)
    menu.misc.aimbot_on:set_callback(function() 
        local state_en = menu.misc.aimbot_on:get('Miss')
        utils.set_event_callback("paint_ui", output.visible, state_en)
        if not state_en then
            ref.spread:set_enabled(true)
            ref.spread:override()
        end       
    end) 
end

local buybot = {} do
    local base_prices = {
        ["AWP"] = 4750,
        ["SCAR20/G3SG1"] = 5000,
        ["SSG-08"] = 1700,
        ["P250"] = 300,
        ["Dual Berettas"] = 400,
        ["TEC-9/Five Seven"] = 500,
        ["Deagle/R8"] = 700,
        ["Kevlar"] = 650,
        ["Kevlar/Helmet"] = 1000,
        ["Molotov"] = 600,
        ["HE Grenade"] = 300,
        ["Smoke"] = 300,
        ["Flashbang"] = 200,
        ["Defuse kit"] = 400,
        ["Zeus"] = 200
    }

    local commands = {
        ["AWP"] = 'buy awp',
        ["SCAR20/G3SG1"] = 'buy scar20',
        ["SSG-08"] = 'buy ssg08',
        ["Dual Berettas"] = 'buy elite',
        ["TEC-9/Five Seven"] = 'buy tec9',
        ["P250"] = 'buy p250',
        ["Deagle/R8"] = 'buy deagle',
        ["HE Grenade"] = 'buy hegrenade',
        ["Molotov"] = 'buy molotov',
        ["Smoke"] = 'buy smokegrenade',
        ["Kevlar"] = 'buy vest',
        ["Kevlar/Helmet"] = 'buy vesthelm',
        ["Zeus"] = 'buy taser',
        ["Defuse kit"] = 'buy defuser'
    }

    local buy_scheduled = false  
    local buy_time = 0         

    function buybot.buy_by_name(name)
        local cmd = commands[name]
        if cmd then
            client.exec(cmd)
        end
    end

    function buybot.get_total_price()
        local total = 0

        local primary = menu.misc.buybot_primary:get()
        if primary and primary ~= "-" and base_prices[primary] then
            total = total + base_prices[primary]
        end

        local secondary = menu.misc.buybot_secondary:get()
        if secondary and secondary ~= "-" and base_prices[secondary] then
            total = total + base_prices[secondary]
        end

        local util_selection = menu.misc.buybot_utility:get()
        for _, util_name in ipairs(util_selection) do
            if base_prices[util_name] then
                total = total + base_prices[util_name]
            end
        end

        return total
    end

    function buybot.execute_buy()
        if not menu.misc.buybot:get() then 
            buy_scheduled = false
            return 
        end
        
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then 
            return 
        end
        
        local money = entity.get_prop(local_player, "m_iAccount") or 0

        local price_threshold = buybot.get_total_price()
        if money < price_threshold then
            return
        end

        local primary = menu.misc.buybot_primary:get()
        if primary and primary ~= "-" then
            buybot.buy_by_name(primary)
        end

        local secondary = menu.misc.buybot_secondary:get()
        if secondary and secondary ~= "-" then
            buybot.buy_by_name(secondary)
        end

        local util_selection = menu.misc.buybot_utility:get()
        for _, util_name in ipairs(util_selection) do
            buybot.buy_by_name(util_name)
        end
        
        buy_scheduled = false
    end

    function buybot.on_round_prestart()
        if not menu.misc.buybot:get() then return end

        buy_scheduled = true
        buy_time = globals.realtime() + 0.1  
    end

    function buybot.on_paint()
        if buy_scheduled and globals.realtime() >= buy_time then
            buybot.execute_buy()
        end
    end

    menu.misc.buybot:set_callback(function()
        local state_en = menu.misc.buybot:get()
    
        utils.set_event_callback('round_start', buybot.on_round_prestart, state_en)
        utils.set_event_callback('paint', buybot.on_paint, state_en)  
    end)
end

local other = {} do 
    function other.aspect()
        local w, h = client.screen_size()
        local default_ratio = w / h
        
        local active = menu.misc.aspect_ratio:get()

        local target = active and menu.misc.aspect_ratio_slider:get()/100 or default_ratio

        local smooth_ratio = motion.new('aspect_ratio_anim', target, 0.07)

        cvar.r_aspectratio:set_float(smooth_ratio)

        if not active then
            if math.abs(smooth_ratio - default_ratio) < 0.001 then
                client.unset_event_callback('paint_ui', other.aspect)
                cvar.r_aspectratio:set_float(default_ratio) 
            end
        end
    end

    function other.third()
        local me = entity.get_local_player()
        if not me or not entity.is_alive(me) then
            return
        end

        local active = menu.misc.third_person:get()
        local default_dist = 100 
        local max_dist_setting = menu.misc.third_person_slider:get() or default_dist 

        local target_dist = max_dist_setting 
        local smooth_rate = 0.07

        local wall_is_close = false

        if active then
            if menu.misc.third_person_magic:get() then
                local wall_dist, hit_wall = get_wall_distance(me, max_dist_setting) 
                if hit_wall and wall_dist < 15 then
                    target_dist = 0
                    smooth_rate = 2.0 
                    wall_is_close = true
                    ref.third_person_alive:override(false) 
                else
                    target_dist = math.min(max_dist_setting, wall_dist)
                    smooth_rate = 0.07 
                    ref.third_person_alive:override() 
                end
            else
                target_dist = max_dist_setting
                smooth_rate = 0.07 
                ref.third_person_alive:override() 
            end
        end

        if not active then
            target_dist = default_dist
            smooth_rate = 0.07 
        end

        local smooth_dist = motion.new('thirdperson_dist', target_dist, smooth_rate)

        client.set_cvar('c_mindistance', smooth_dist)
        client.set_cvar('c_maxdistance', smooth_dist)

        if not active then
            if math.abs(smooth_dist - default_dist) < 1 then
                client.unset_event_callback('paint_ui', other.third)
            end
        end
    end

    function other.zoom(z)
        local me = entity.get_local_player()
        if not me then return end

        local wpn = entity.get_player_weapon(me)
        if not wpn then return end

        local scoped = entity.get_prop(me, "m_bIsScoped") == 1
        local scope_level = entity.get_prop(wpn, "m_zoomLevel")
        
        local enabled = menu.misc.zoom_anim:get()
        local second = scoped and scope_level == 2 and menu.misc.zoom:get() and (enabled and -menu.misc.zoom_fov:get() or -menu.misc.zoom_fov:get()) or 0 

        local act = 0
        if scope_level == 1 then
            act = 1
        elseif scope_level == 2 then
            act = 1.5
        end

        local override_fov = ref.fov:get()
        local overrided = ref.zoom:get() * 0.5

        if enabled then
            local animation = motion.new('action_sc', scoped and act or 0)
            local animafov = motion.new('fov_sc', override_fov + second)
            z.fov = animafov - overrided * animation
        else
            local static_fov = override_fov + second
            z.fov = static_fov - overrided * (scoped and act or 0)
        end
    end

    function other.viewmodel()
        local def_fov, def_x, def_y, def_z = 68, 2.5, 0, -1.5
        
        local active = menu.misc.viewmodel:get()

        local t_fov = active and menu.misc.vS:get() or def_fov
        local t_x   = active and menu.misc.xS:get()/10 or def_x
        local t_y   = active and menu.misc.yS:get()/10 or def_y
        local t_z   = active and menu.misc.zS:get()/10 or def_z

        local cur_fov = motion.new('viewmodel_fov', t_fov, 0.07)
        local cur_x   = motion.new('viewmodel_x', t_x, 0.07)
        local cur_y   = motion.new('viewmodel_y', t_y, 0.07)
        local cur_z   = motion.new('viewmodel_z', t_z, 0.07)

        client.set_cvar('viewmodel_fov', cur_fov)
        client.set_cvar('viewmodel_offset_x', cur_x)
        client.set_cvar('viewmodel_offset_y', cur_y)
        client.set_cvar('viewmodel_offset_z', cur_z)

        if not active then
            if math.abs(cur_fov - def_fov) < 0.1 and 
            math.abs(cur_x - def_x) < 0.1 and 
            math.abs(cur_y - def_y) < 0.1 and 
            math.abs(cur_z - def_z) < 0.1 then
                client.unset_event_callback('paint_ui', other.viewmodel)
            end
        end
    end

    local preferred_hand = cvar.cl_righthand:get_int()
    local function_was_enabled = false

    function other.hand()
        local is_enabled = menu.misc.opposite_hand:get() and menu.misc.viewmodel:get()
        if is_enabled and not function_was_enabled then
            preferred_hand = cvar.cl_righthand:get_int()
            function_was_enabled = true
        elseif not is_enabled and function_was_enabled then
            cvar.cl_righthand:set_raw_int(preferred_hand)
            function_was_enabled = false
            return
        end

        if not is_enabled then return end

        local me = entity.get_local_player()
        if not me or not entity.is_alive(me) then return end

        local lp_weapon = entity.get_player_weapon(me)
        if lp_weapon == nil then return end

        local classname = entity.get_classname(lp_weapon)
        local is_knife = classname == 'CKnife' 

        local current_hand = cvar.cl_righthand:get_int()

        if is_knife then
            local knife_hand = (preferred_hand == 1) and 0 or 1
            if current_hand ~= knife_hand then
                cvar.cl_righthand:set_raw_int(knife_hand)
            end
        else
            if current_hand ~= preferred_hand then
                cvar.cl_righthand:set_raw_int(preferred_hand)
            end
        end
    end

    function other.hand_on_shutdown()
        cvar.cl_righthand:set_raw_int(preferred_hand)
    end

    client.set_event_callback("run_command", other.hand)
    client.set_event_callback("shutdown", other.hand_on_shutdown)

    local sleeve_materials = { }

    function other.fetch_sleeve_materials()
        if #sleeve_materials == 0 then
            sleeve_materials = materialsystem.find_materials 'sleeve' or {}
        end
    end

    function other.set_remove_sleeves(value)
        other.fetch_sleeve_materials() 

        for i = 1, #sleeve_materials do
            sleeve_materials[i]:set_material_var_flag(2, value) 
        end
    end

    function other.sleeves_update()
        local remove_sleeve = menu.misc.remove_sleeves:get() and menu.misc.viewmodel:get()
        
        if remove_sleeve then
            other.set_remove_sleeves(true)
        end
    end

    function other.reset_sleeves()
        other.set_remove_sleeves(false)
        sleeve_materials = {}
    end

    client.set_event_callback('pre_render', other.sleeves_update)
    client.set_event_callback('level_shutdown', other.reset_sleeves)
    client.set_event_callback('round_prestart', other.reset_sleeves)

    menu.misc.remove_sleeves:set_callback(function()
        if menu.misc.remove_sleeves:get() then
            other.set_remove_sleeves(true)
        else
            other.reset_sleeves()
        end
    end)

    function other.reset()
        other.set_remove_sleeves(false)
    end

    client.set_event_callback('override_view', other.zoom)
    client.set_event_callback("shutdown", other.reset)


    client.set_event_callback('pre_render', other.hand)
   

    menu.misc.aspect_ratio:set_callback(function()
        if menu.misc.aspect_ratio:get() then
            client.set_event_callback('paint_ui', other.aspect)
        end
    end)

    menu.misc.third_person:set_callback(function()
        if menu.misc.third_person:get() then
            client.set_event_callback('paint_ui', other.third)
        end
    end)

    menu.misc.viewmodel:set_callback(function()
        if menu.misc.viewmodel:get() then
            client.set_event_callback('paint_ui', other.viewmodel)
        end
    end)
end

local scp = {} do
    local match = client.find_signature('client_panorama.dll', '\x8B\x35\xCC\xCC\xCC\xCC\xFF\x10\x0F\xB7\xC0')
    local weapon_raw = ffi.cast('void****', ffi.cast('char*', match) + 2)[0]
    local ccsweaponinfo_t = [[
    struct 
    {
        char __pad_0x0000[0x1cd];
        bool hide_vm_scope;
    }
    ]]
    local get_weapon_info = vtable_thunk(2, ccsweaponinfo_t .. '*(__thiscall*)(void*, unsigned int)')
    local inscope = true

    local is_callback_active = false

    function scp.scope_overlay()
        local master_alpha = motion.new('scope_master_alpha', menu.misc.scope_overlay:get() and 1 or 0, 0.1)

        if not menu.misc.scope_overlay:get() and master_alpha < 0.01 and is_callback_active then
            ref.scope_overlay:override() 
            is_callback_active = false
            return
        end

        local offset, initial_position, color, thickness =
            menu.misc.scope_gap:get() * height / 1080,
            menu.misc.scope_size:get() * height / 1080,
            { menu.misc.scope_color:get() }, menu.misc.scope_thickness:get()

        local me = entity.get_local_player()
        if me == nil or not entity.is_alive(me) then return end 
        local scoped = entity.get_prop(me, 'm_bIsScoped') == 1
        local act = scoped

        if menu.misc.scope_overlay:get() then
            ref.scope_overlay:override(false)
            
            local rotate_progress = motion.new('scope_rotate_anim', menu.misc.scope_position:get() == 'Rotate' and 1 or 0, 0.05)
            local alpha = motion.new('overlay_alpha', act and 1 or 0, menu.misc.scope_animation:get('Alpha') and 0.05 or 2)
            local overlay = motion.new('scope_overlay', act and 1 or 0, menu.misc.scope_animation:get('Overlay') and 0.05 or 2)
            local is_v2 = menu.misc.scope_mode_ovr:get() == "V2"
            local cx, cy = width / 2, height / 2

            local final_overlay = overlay * initial_position
            local final_offset = overlay * offset
            local a_main = alpha * color[4]

            local function draw_universal_branch(base_angle, dir_name)
                if menu.misc.scope_disablers:get(dir_name) then return end

                local current_angle = base_angle + (rotate_progress * 0.785398)
                local cos_a, sin_a = math.cos(current_angle), math.sin(current_angle)
                
                local length = final_overlay - final_offset
                if length < 1 then return end

                for i = 0, length, 0.5 do
                    local p = i / length
                    local cur_alpha = is_v2 and (a_main * (1 - p)) or a_main
                    
                    if cur_alpha > 1 then
                        local dist = final_offset + i
                        local x = cx + (dist * cos_a)
                        local y = cy + (dist * sin_a)
                        
                        renderer.rectangle(x - thickness/2, y - thickness/2, thickness, thickness, color[1], color[2], color[3], cur_alpha)
                    end
                end
            end

            draw_universal_branch(3.14159, 'Left')   
            draw_universal_branch(0, 'Right')         
            draw_universal_branch(-1.57079, 'Top')   
            draw_universal_branch(1.57079, 'Bottom') 

        else
            local off_alpha = motion.new('scope_overlay_off', act and 1 or 0, 0.1)
            renderer.rectangle(0, height / 2, width, 1, 0, 0, 0, off_alpha * 255)
            renderer.rectangle(width / 2, 0, 1, height, 0, 0, 0, off_alpha * 255)
        end
    end

    function scp.g_paint_ui()
        if menu.misc.scope_overlay:get() then
            ref.scope_overlay:override(true)
        else
            ref.scope_overlay:override()
        end
    end

    function scp.scpview()
        local me = entity.get_local_player()
        if not me then return end
        local weapon = entity.get_player_weapon(me)
        if not weapon then return end
        local w_id = entity.get_prop(weapon, 'm_iItemDefinitionIndex')
        local res = get_weapon_info(weapon_raw, w_id)
        inscope = not menu.misc.viewinsc:get()
        res.hide_vm_scope = inscope
    end
    menu.misc.scope_overlay:set_callback(function()
        if menu.misc.scope_overlay:get() then
            is_callback_active = true
            utils.set_event_callback("run_command", scp.scpview, is_callback_active)
            utils.set_event_callback("paint_ui", scp.g_paint_ui, is_callback_active)
            utils.set_event_callback("paint", scp.scope_overlay, is_callback_active)
        end
    end)
end

local game = {} do
    local fps_cvars = {
        ['Fix chams color'] = {'mat_autoexposure_max_multiplier', 0.2, 1},
        ['Disable dynamic Lighting'] = {'r_dynamiclighting', 0, 1},
        ['Disable dynamic Shadows'] = {'r_dynamic', 0, 1},
        ['Disable ragdolls'] = {'cl_disable_ragdolls', 1, 0},
        ['Disable eye gloss'] = {'r_eyegloss', 0, 1},
        ['Disable bloom'] = {'mat_disable_bloom', 1, 0},
        ['Disable particles'] = {'r_drawparticles', 0, 1},
        ['Reduce breakable objects'] = {'func_break_max_pieces', 0, 15}
    }

    local is_callback_active = false

    function game.reset_to_defaults()
        for _, data in pairs(fps_cvars) do
            local cvar_name, _, default_value = unpack(data)
            cvar[cvar_name]:set_int(default_value)
        end
    end
  
    function game.on_setup_command ()
        if not menu.misc.game_check:get() then
            game.reset_to_defaults()
            return
        end
  
        local selected_boosts = menu.misc.game_list:get()
        for name, data in pairs(fps_cvars) do
            local cvar_name, boost_value, default_value = unpack(data)
            cvar[cvar_name]:set_int(helpers.table_contains(selected_boosts, name) and boost_value or default_value)
        end
    end

    function game.on_shutdown()
        for name, data in pairs(fps_cvars) do
            local cvar_name, boost_value, default_value = unpack(data)
            cvar[cvar_name]:set_int(default_value)
        end
    end
    menu.misc.game_check:set_callback(function() 
        local state_en = menu.misc.game_check:get()
        utils.set_event_callback('setup_command', game.on_setup_command, state_en)  
    end)
    client.set_event_callback('shutdown', game.on_shutdown)
end

local watermark do 
    local select_opt = {'Default', 'Encode'}
    local current_idx = 1

    local function toggle_encoded_effect()
        current_idx = current_idx % #select_opt + 1
        menu.drag.wt.wt_type:set(select_opt[current_idx])
    end

    local function encode_text(input)
        local buffer = {}
        local cycle = 1
        local time = globals.realtime()
        local cycle_phase = time % 3
        
        local chars = {
            "!", "@", "#", "$", "%", "^", "&", "+", "=", "? ", "<", ">", ":", "~"
        }
        
        if cycle_phase < 1 then
            local phase = math.sin((time * (math.pi / cycle))) * 0.5 + 0.5
            
            for i = 1, #input do
                local char = input:sub(i, i)
                if char:match("%a") then
                    if math.random() < 0.8 then
                        if math.random() < phase then
                            buffer[#buffer + 1] = chars[math.random(#chars)]
                        else
                            buffer[#buffer + 1] = char
                        end
                    else
                        buffer[#buffer + 1] = char
                    end
                else
                    buffer[#buffer + 1] = char
                end
            end
        else
            buffer[#buffer + 1] = input
        end
        
        return table.concat(buffer)
    end

    local function get_display_text(text)
        if menu.drag.wt.wt_type:get() == 'Encode' then
            return encode_text(text)
        else
            return text
        end
    end

    local function paint() 
        if (menu.visuals.ui_main:get("Watermark") and menu.visuals.water_main:get("Water")) or menu.visuals.crosshair:get() then return end
        
        local x, y = menu.drag.wt.x: get(), menu.drag.wt.y:get()
        local color_func = coloring.color(
                    menu.information.color: get(),
                    menu.information.color_type:get(),
                    menu. information.color_gradient:get(),
                        {menu.information.default_color: get()},
                    {menu.information.color1:get()},
                    {menu.information.color2:get()},
                    {menu. information.color3:get()},
                    menu.information.color_speed:get()
                ) 
                
        local r, n, g, a = menu.visuals.recent_color:get()
        
        local build_part = get_display_text(info.build ..  ' / ')
        local name_part = get_display_text(info.name)
        
        local tx_size = renderer.measure_text(dpi..'b', build_part ..  name_part)
        local drag_state = drag:create("Watermark", vector(x, y), vector(tx_size + 10, 15), menu.drag.wt.x, menu.drag.wt. y, nil, nil, nil, nil, width - 11 - tx_size, height - 16)
        local alpha = motion.new("wt_alpha", ui.is_menu_open() and ((drag_state.hovered or drag_state.dragging) and 200 or 100) or 0, 0.06)
        local alpha_text = motion.new("wt_alpha_tx", ui.is_menu_open() and ((drag_state.hovered and not drag_state.dragging) and 150 or 0) or 0, 0.06)
        
        render.rounded_rectangle(x + 1, y, tx_size + 10, 15, 150, 150, 150, alpha, 4)
        
        renderer.text(x + 6, y, 255, 255, 255, 255, 'b', 0, color_func(build_part))
        renderer.text(x - 6, y - 13, 255, 255, 255, alpha_text, '', 0, 'Right click for change type text')
        renderer.text(x + 6 + renderer.measure_text(dpi..'b', build_part), y, r, n, g, a, dpi..'b', 0, name_part)
    end
    
    drag:set_right_click_callback("Watermark", toggle_encoded_effect)
    
    client.set_event_callback("paint_ui", paint)
end

local png do
    local display_duration = 3
    local fade_duration = 1.5
    local alpha = 0
    local showing = true

    local file = readfile('k_bg.png')

    local function png()
        local k = renderer.load_png(file, 1, 1)
        local elapsed_time = client.unix_time() - start_time

        if elapsed_time <= fade_duration then
            alpha = motion.new('alpha', (elapsed_time / fade_duration) * 255, 0.06)
        elseif elapsed_time <= display_duration - fade_duration then
            alpha = motion.new('alpha', 255, 0.06)
        elseif elapsed_time <= display_duration then
            alpha = motion.new('alpha', ((display_duration - elapsed_time) / fade_duration) * 255, 0.06)
        else
            showing = false
            return
        end

        renderer.rectangle(0,0, width, height, 0,0,0,math.floor(alpha)*0.5)
        renderer.texture(k, width / 2 - 255, height / 2 - 230, 500, 500, 255, 255, 255, math.floor(alpha), 'f')
    end
end

local button_check = false

local cfg_system = {} do
    local file_path = "pacan.json"
    local current_script_version = 2

    local hardcoded_default_base64 = 'eyJkYXRhIjp7Im1lbnUiOnsiZHJhZyI6eyJob3RrZXkiOnsieSI6NTYzLCJ4Ijo0Mjh9LCJjcm9zc2hhaXIiOnsieSI6MTcxfSwic3BlY3RhdG9yIjp7InkiOjM4MCwieCI6Mjg5fSwib3V0cHV0Ijp7InkiOjIwMH0sImZlYXR1cmVfaW5kIjp7InkiOjUwN30sIndhdGVybWFyayI6eyJ5IjowLCJ4IjoxNTk0fSwid3QiOnsieSI6Nzc2LCJ4IjowLCJ3dF90eXBlIjoiRGVmYXVsdCJ9LCJkYW1hZ2UiOnsieSI6NzA2LCJ4IjoxMjg1fSwiZGVmZW5zaXZlIjp7InkiOjQwMCwieCI6OTEyfSwiYXJyb3dzIjp7IngiOjYxfSwidmVsb2NpdHkiOnsieSI6MzQ4LCJ4IjoxMzc5fX0sInZpc3VhbHMiOnsidWlfY29sb3I0IjoiI0IwQURGRkZGIiwidWlfY29sb3IyIjoiI0ZGRkZGRkZGIiwiY3JfY29sb3IzIjoiI0JDRkZCN0M5IiwiZGFtYWdlX2NvbG9yIjoiIzlCQTBDQ0ZGIiwiZGFtYWdlX2luZCI6dHJ1ZSwiY3VzdG9tX2luZF9nc19jb2xvcmNwIjoiI0ZGRkZGRkZGIiwidWlfY29sb3IxIjoiI0ZGRkZGRkZGIiwiY3JfY29sb3JfZ3JhZGllbnQiOiIyeCIsImFycm93c19zY29wZSI6WyJBbHBoYSIsIkxldmVsIiwifiJdLCJjcm9zc2hhaXIiOnRydWUsImN1c3RvbV9pbmRfZ3NfYmFjayI6MjUsInY0X21vZGUiOlsiQXJyb3dzIiwiRGVzeW5jIiwifiJdLCJjdXN0b21faW5kX2dzX3JlY3QxIjoxNSwiaG90a2V5X2l0ZW0iOlsiRG91YmxlIHRhcCIsIk9uIHNob3QgYW50aS1haW0iLCJPdmVycmlkZSBkYW1hZ2UiLCJTYWZlIHBvaW50IiwiRm9yY2UgYmFpbSIsIkR1Y2sgcGVlayBhc3Npc3QiLCJKdW1wIHNjb3V0IiwiRWRnZSB5YXciLCJRdWljayBwZWVrIGFzc2lzdCIsIlBpbmcgc3Bpa2UiLCJFZGdlIGp1bXAiLCJ+Il0sImFycm93c190eXBlIjoiVjQiLCJjcl9jb2xvcjEiOiIjOUE5QTlBRjUiLCJ1aV9jb2xvcjMiOiIjRkZGRkZGRkYiLCJkYW1hZ2Vfc2VsZWN0IjoiQm9sZCIsImN1c3RvbV9pbmRfZ3MiOnRydWUsImN1c3RvbV9pbmRfZ3NfcmVjdCI6NCwiY3JfY29sb3IyIjoiIzlBOUVGRkY1IiwiY3VzdG9tX2luZF9nc19zaXplIjoxMiwia2liaXRfbWFya2VyIjpbIn4iXSwid2F0ZXJfbWFpbiI6WyJXYXRlciIsIkJ1aWxkIiwiTmFtZSIsIlBpbmciLCJUaW1lIiwifiJdLCJraWJpdF9taXNzIjpmYWxzZSwidWlfY29sb3I1IjoiI0ZGRkZGRkZGIiwiY3VzdG9tX2luZF9nc19pY29uIjpmYWxzZSwiY3JfZGVmYXVsdF9jb2xvciI6IiM4RUZGNzFBRCIsImtpYml0X2NvbG9yMiI6IiM5Nzk0OTQzQyIsImFycm93cyI6dHJ1ZSwicGFub3JhbWFfYm94IjpbIkRhc2hib2FyZCBJY29uIiwiU2NvcmVib2FyZCBJY29uIiwiRGlzYWJsZSBibHVyIiwifiJdLCJjcl9jb2xvcl90eXBlIjoiR3JhZGllbnQiLCJjcm9zc2hhaXJfc2VsZWN0IjpbIkdsb3cgbW9kdWxlIiwiU3RhdGUiLCJEb3VibGUgdGFwIiwiT25zaG90IGFudGktYWltIiwiQm9keSBhaW0iLCJTYWZlIHBvaW50IiwiRHVjayBwZWVrIGFzc2lzdCIsIk1pbmltdW0gZGFtYWdlIG92ZXJyaWRlIiwiRnJlZXN0YW5kaW5nIiwifiJdLCJ1aV9jb2xvciI6Ik11bHRpLWNvbG9yIiwidHJhY2VyX2VuIjp0cnVlLCJ1aV9kZWZhdWx0X2NvbG9yIjoiIzg0QUJGRkZGIiwidWlfbWFpbiI6WyJWZWxvY2l0eSIsIn4iXSwibWVudV9zZWxlY3Rpb24iOiJNYWluIiwia2liaXRfY29sb3IiOiIjOTc5NDk0M0MiLCJkYW1hZ2VfYW5pbSI6dHJ1ZSwiZ2xvYmFsaXplX2RwaSI6dHJ1ZSwiYXJyb3dzX2NvbG9yIjoiIzAwMDAwMDhCIiwicmVjZW50X2NvbG9yIjoiIzkzOTRCMkZGIiwiY3JfY29sb3Jfc3BlZWQiOjEsImN1c3RvbV9pbmRfZ3NfY29sb3IiOmZhbHNlfSwiaW5mb3JtYXRpb24iOnsibGlzdCI6MiwiY29sb3IyIjoiIzVBNUE1QUZGIiwiY29sb3JfdHlwZSI6IkdyYWRpZW50IiwiY29sb3IxIjoiI0U4OTY5NkZGIiwiZGVmYXVsdF9jb2xvciI6IiNGRkZGRkZGRiIsImNvbG9yMyI6IiNGRkZGRkZGRiIsImNvbG9yX3NwZWVkIjoyLCJjb2xvcl9ncmFkaWVudCI6IjJ4IiwiY29sb3IiOiJTa2VldCJ9LCJtYWluIjoi7oSPIEluZm9ybWF0aW9uIiwicmFnZWJvdCI6eyJlc3BfY29sb3IiOiIjRkZGRkZGRkYiLCJhaV9ob3RrZXkiOlsxLDE4LCJ+Il0sIm1hZ2ljX2hpdGJveCI6WyJIZWFkIiwifiJdLCJyZXNvbHZlciI6dHJ1ZSwiYWlfcmlza19tb2RlIjoiQmFsYW5jZWQiLCJoaXRyYXRlIjpbIn4iXSwiYXV0b3N0b3AiOiJIZWxwZXIiLCJhdXRvX3RwX2hvdCI6WzIsMCwifiJdLCJlbl9mb3JjZXNob3RfaHQiOlswLDAsIn4iXSwiYWlfaGl0Ym94IjpbIkhlYWQiLCJTdG9tYWNoIiwiQXJtcyIsIkZlZXQiLCJ+Il0sIm1hZ2ljX2tleSI6WzIsMjAsIn4iXSwibm9zY29wZV9oaXQiOjQzLCJjb25kIjpbIn4iXSwiaGl0Y2hhbmNlX2ZvcmNlX3Nob3QiOi0xLCJub3Njb3BlX2Rpc3QiOjIwLCJhdXRvX3RwX29wdCI6WyJ+Il0sImVzcF9mb250IjoiU21hbGwiLCJ0YXJnZXQiOmZhbHNlLCJhaV9kbSI6MTMsIm5vc2NvcGVfd3AiOlsiQXV0byIsIn4iXSwid2VhcG9uIjpbIn4iXSwiYXV0b190cF9kZWxheSI6MCwiYXV0b190cF93cCI6WyJ+Il0sIm1haW5fY29tYm9ib3giOiJTY291dCIsImFpIjp0cnVlLCJhaV9kZWxheSI6MTMsImFpX3Zpc3VhbCI6dHJ1ZSwiZm9yY2Vfc2hvdF93ZWFwb24iOlsiUmV2b2x2ZXIiLCJBV1AiLCJ+Il0sIm1haW5fc3dpdGNoIjpmYWxzZSwiZW5fZm9yY2VzaG90Ijp0cnVlLCJlc3BfZmxhZ3MiOmZhbHNlLCJhaV93ZWFwb24iOlsiRGVhZ2xlIiwiU2NvdXQiLCJBd3AiLCJ+Il0sImFpX2hpdCI6NjUsImludGVyIjowLCJhdXRvX3RwX2Fpcl9jaGVjayI6ZmFsc2V9LCJtaXNjIjp7ImRyb3BfaG90a2V5IjpbMiw3NCwifiJdLCJkcm9wX25hZGVzIjp0cnVlLCJyOF9yb3VuZCI6dHJ1ZSwiYm9keV9sZWFuX3ZhbHVlIjo3NSwiZmlsdGVyX2NvbnNvbGUiOnRydWUsImFuaW1fZWxlbV9haXIiOjAsInJlbW92ZV9zbGVldmVzIjp0cnVlLCJjbGFudGFnIjpmYWxzZSwiYnV5Ym90X3V0aWxpdHkiOlsiS2V2bGFyIiwiS2V2bGFyXC9IZWxtZXQiLCJIRSBHcmVuYWRlIiwiU21va2UiLCJNb2xvdG92IiwiRGVmdXNlIGtpdCIsIlpldXMiLCJ+Il0sImppdHRlcl9zcGVlZCI6NzUsIm91dHB1dF9vdXRwdXQiOnRydWUsInN0YXRlIjpbIldoaWxlIGluIGFpciIsIkFkanVzdCBib2R5IGxlYW4iLCJ+Il0sInRoaXJkX3BlcnNvbiI6dHJ1ZSwidGhpcmRfcGVyc29uX21hZ2ljIjpmYWxzZSwibV9lbGVtZW50cyI6WyJMZWcgYnJlYWtlciIsIkFkanVzdCBib2R5IGxlYW4iLCJ+Il0sInZpZXdtb2RlbCI6dHJ1ZSwic2NvcGVfY29sb3IiOiIjQjhDNUZCQjMiLCJvcHBvc2l0ZV9oYW5kIjp0cnVlLCJjaGF0X3JldmVhbGVyIjp0cnVlLCJ2UyI6MzYsInNjb3BlX292ZXJsYXkiOnRydWUsInRoaXJkX3BlcnNvbl9zbGlkZXIiOjQxLCJ6UyI6MjAsInhTIjowLCJ5UyI6LTcsInRhYl9hbmltIjoiQW5pbWF0aW9uIGFkZG9ucyIsInNjb3BlX21vZGVfb3ZyIjoiVjIiLCJqaXR0ZXJfdmFsdWUiOjUwLCJjaGF0X3NwYW1tZXJfdHlwZSI6WyJLaWxsIiwifiJdLCJxdWlja3N3aXRjaCI6dHJ1ZSwic2NvcGVfZGlzYWJsZXJzIjpbIn4iXSwic2NvcGVfZ2FwIjoxMiwiYWltYm90X21pc3MiOiIjRkZCMkIyREIiLCJkcm9wX2l0ZW1zIjpbIk1vbG90b3YiLCJIRSBHcmVuYWRlIiwifiJdLCJzY29wZV9zaXplIjo2NSwiYWltYm90X29uIjpbIkhpdCIsIk1pc3MiLCJBbm90aGVyIiwifiJdLCJzY29wZV90aGlja25lc3MiOjEsImFzcGVjdF9yYXRpbyI6dHJ1ZSwiY2hhdF9zcGFtbWVyIjp0cnVlLCJvdXRwdXRfbG9nIjoiT3V0cHV0IiwiYW5pbV9haXIiOiJTdGF0aWMiLCJnYW1lX2NoZWNrIjp0cnVlLCJhaW1ib3RfaGl0IjoiI0IyQkJGRkRCIiwiZ2FtZV9saXN0IjpbIkZpeCBjaGFtcyBjb2xvciIsIkRpc2FibGUgZHluYW1pYyBsaWdodGluZyIsIkRpc2FibGUgZHluYW1pYyBzaGFkb3dzIiwiRGlzYWJsZSByYWdkb2xscyIsIkRpc2FibGUgZXllIGdsb3NzIiwiRGlzYWJsZSBibG9vbSIsIlJlZHVjZSBicmVha2FibGUgb2JqZWN0cyIsIn4iXSwiYWltYm90X29uMSI6WyJ+Il0sInNjb3BlX2FuaW1hdGlvbiI6WyJBbHBoYSIsIk92ZXJsYXkiLCJ+Il0sInByZWZpeF9zY3JlZW4iOmZhbHNlLCJhbmltX3dhbGsiOiJBZHZhbmNlZCBKaXR0ZXIiLCJ6b29tIjp0cnVlLCJvdXRwdXRfeCI6NCwiYnV5Ym90X3NlY29uZGFyeSI6IkRlYWdsZVwvUjgiLCJvdXRwdXRfZm9udCI6IkJvbGQiLCJtZW51Ijoi7oamIE1pc2MiLCJvdXRwdXRfeSI6MTAsImJsdWV0b290aCI6dHJ1ZSwic3BlZWRlYXJ0aCI6NSwiYXNwZWN0X3JhdGlvX3NsaWRlciI6MTI1LCJ6b29tX2FuaW0iOnRydWUsInpvb21fZm92IjoxMCwic2NvcGVfcG9zaXRpb24iOiJEZWZhdWx0IiwiYnV5Ym90X3ByaW1hcnkiOiJBV1AiLCJidXlib3QiOnRydWUsIm91dHB1dF9hbmltIjp0cnVlLCJmYXN0X2xhZGRlciI6dHJ1ZSwidmlld2luc2MiOnRydWV9LCJhbnRpYWltIjp7InBpdGNoX2ppdHRlcl9zcGVlZF9mbCI6MiwiZnJlZXN0YW5kaW5nX2Rpc2FibGVycyI6WyJXYWxraW5nIiwiQ3JvdWNoaW5nIiwiQWVyb2JpYyIsIk1hbnVhbHMiLCJ+Il0sImZha2VfbGltaXQiOjE1LCJtYW51YWxzX2ZvcndhcmQiOlsxLDAsIn4iXSwibWFudWFsc19kaXNhYmxlcnMiOlsifiJdLCJwaXRjaF9tb2RlMl9mbCI6MCwieWF3X2RpcmVjdGlvbiI6WyJGcmVlc3RhbmRpbmciLCJ+Il0sImNvbmRpdGlvbiI6IkFlcm9iaWMrIiwibWFudWFsc19sZWZ0IjpbMSwwLCJ+Il0sImF2b2lkIjozNTAsInNhZmVfaGVhZCI6Ik9mZmVuc2l2ZSIsIm1hbnVhbHNfcmlnaHQiOlsxLDAsIn4iXSwicGl0Y2hfbW9kZTFfZmwiOjAsImZyZWVzdGFuZGluZ19ob3RrZXkiOlsxLDE4LCJ+Il0sImZha2VfYW1vdW50IjoiRmx1Y3R1YXRlIiwiZmVhdHVyZXMiOlsiQXZvaWQgQmFja3N0YWIiLCJFLUJvbWIgRml4IiwifiJdLCJmbF9ob3QiOlsxLDAsIn4iXSwicGl0Y2hfc3BlZWRfZmwiOjIwLCJwaXRjaF9zbG93X2RlZl9mbCI6MCwiZWRnZV95YXciOlsxLDAsIn4iXSwibWFudWFsc19yZXNldCI6WzEsMCwifiJdLCJmYWtlX3ZhcmlhbmNlIjoyNSwic2VsZWN0aW9uIjoi7oqvIEJ1aWxkZXIiLCJwaXRjaF90eXBlX2ZsIjoiT2ZmIiwicGl0Y2hfc3RhdGljX2ZsIjowLCJoaWdoX2Rpc3RhbmNlX29wdGlvbnMiOlsifiJdLCJzaWRlX3N3aXRjaCI6IkNUIiwiZmFrZWVuYWJsZWQiOnRydWUsInNhZmUiOlsifiJdfX0sInNpZGVzX2RhdGEiOnsiVCI6W3sicGl0Y2hfc3RhdGljIjowLCJib2R5X3JpZ2h0IjowLCJvZnNfd2F5c18xIjpbMCwwLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6MSwib2Zmc2V0IjowLCJwaXRjaF9zcGVlZCI6MjAsInBpdGNoX3Nsb3dfZGVmIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwib2ZzX3RwXzIiOiJEZWZhdWx0IiwiZGVmX2VuIjpmYWxzZSwic3BuYV9zd2l0Y2giOmZhbHNlLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJvZnNfMSI6MCwic3BuYV9zcGVlZCI6MTAsInh3YXlfc2xpZGVyIjozLCJkZWxheV9zd2l0Y2giOnt9LCJzcG5hMiI6MCwic3dpdGNoIjpmYWxzZSwiYm9keV9zdGF0aWMiOjAsInlhd19hbW91bnQiOjAsIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkRpc2FibGVkIiwib2ZzXzIiOjAsInNwbmFfc3BlZWQyIjoxMCwiZW5hYmxlZCI6ZmFsc2UsInlhd19yaWdodCI6MCwiYmRfdHlwZSI6IkdhbWVzZW5zZSIsImJvZHlfdHlwZSI6IkRlZmF1bHQiLCJ4d2F5X2ppdHRlciI6MCwicGl0Y2hfdHlwZSI6Ik9mZiIsInJhbmFfc3dpdGNoIjpmYWxzZSwic3BuYSI6MCwib2ZzX3dheXNfMiI6WzAsMCwwLDAsMF0sImRlbGF5X2ZvcmNlIjpmYWxzZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6MCwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJkZWxheSI6MSwibWFpbiI6IllhdyIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sImJvZHlfbGVmdCI6MCwiZHVyYXRpb25fYnJ1dGUiOjAsImhvbGRfdGlja3MiOjAsInlhd19kZWYiOiJPZmYiLCJ3YXlzIjozLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sImFkYXB0aXZlX2Rlc3luYyI6e30sImJvZHl5YXciOiJPZmYiLCJkZWZfc3Bpbl9zcGVlZCI6MjAsIm9mc193YXlfMSI6MiwiZm9yY2VfbGMiOmZhbHNlLCJyYW5hMiI6MCwieWF3X2xlZnQiOjAsInBpdGNoX2ppdHRlcl9zcGVlZCI6MiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCJ9LHsicGl0Y2hfc3RhdGljIjo4OSwiYm9keV9yaWdodCI6MzIsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJvZmZzZXQiOjEsInBpdGNoX3NwZWVkIjoyMCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwib2ZzXzEiOjQsInNwbmFfc3BlZWQiOjEwLCJiZF90eXBlIjoiQWR2YW5jZWQiLCJkZWxheV9zd2l0Y2giOnt9LCJzcG5hMiI6MCwic3dpdGNoIjp0cnVlLCJib2R5X3N0YXRpYyI6MCwiYWRhcHRpdmVfZGVzeW5jIjpbIkFkYXB0aXZlIERlc3luYyIsIkRlbGF5IE9mZiJdLCJvZnNfd2F5XzIiOjIsImJydXRlX21vZGUiOiJBZGFwdGl2ZSIsIm9mc18yIjozMiwic3BuYV9zcGVlZDIiOjEwLCJ3YXlzIjozLCJib2R5X3R5cGUiOiJTcGluIiwicmFuYTIiOjAsInlhd19yaWdodCI6MCwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJTdGF0aWMiLCJyYW5hX3N3aXRjaCI6ZmFsc2UsInNwbmEiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6ZmFsc2UsInJhbmRvbV9kZWxheSI6MCwicGl0Y2hfbW9kZTEiOjAsIm9mc193YXlzX2RlbGF5XzEiOjIsInlhd2ppdHRlciI6MCwiZGVsYXkiOjEsIm1haW4iOiJEZWZlbnNpdmUiLCJwaXRjaF9tb2RlMiI6MCwicmFuYSI6MCwib2ZzX3dheXNfZGVsYXlfMiI6MiwieWF3X21vZGUiOnt9LCJib2R5X2xlZnQiOjE0NSwiZHVyYXRpb25fYnJ1dGUiOjQ3LCJob2xkX3RpY2tzIjowLCJ5YXdfZGVmIjoiUmFuZG9tIiwiZW5hYmxlZCI6dHJ1ZSwid2F5X2RlbCI6WzEsMSwxLDEsMSwxLDEsMSwxLDFdLCJ5YXdfYW1vdW50IjozNjAsImJvZHl5YXciOiJKaXR0ZXIiLCJkZWZfc3Bpbl9zcGVlZCI6NTAsIm9mc193YXlfMSI6MiwiZm9yY2VfbGMiOnRydWUsInh3YXlfc2xpZGVyIjozLCJ5YXdfbGVmdCI6MCwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjU3LCJvZnNfd2F5c18xIjpbMCwwLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6MSwib2Zmc2V0IjoxMCwicGl0Y2hfc3BlZWQiOjIwLCJwaXRjaF9zbG93X2RlZiI6MTAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwib2ZzXzEiOjAsInNwbmFfc3BlZWQiOjEwLCJiZF90eXBlIjoiQWR2YW5jZWQiLCJkZWxheV9zd2l0Y2giOlsiRGlzYWJsZSBvbiBGYWtlbGFncyJdLCJzcG5hMiI6MCwic3dpdGNoIjpmYWxzZSwiYm9keV9zdGF0aWMiOjAsImFkYXB0aXZlX2Rlc3luYyI6e30sIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwib2ZzXzIiOjAsInNwbmFfc3BlZWQyIjoxMCwid2F5cyI6NiwiYm9keV90eXBlIjoiUmFuZG9tIiwicmFuYTIiOjAsInlhd19yaWdodCI6MCwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJSYW5kb20iLCJyYW5hX3N3aXRjaCI6ZmFsc2UsInNwbmEiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6dHJ1ZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6LTg5LCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOi0zOSwiZGVsYXkiOjEsIm1haW4iOiJEZWZlbnNpdmUiLCJwaXRjaF9tb2RlMiI6ODksInJhbmEiOjAsIm9mc193YXlzX2RlbGF5XzIiOjIsInlhd19tb2RlIjpbIkppdHRlciJdLCJib2R5X2xlZnQiOi0xNCwiZHVyYXRpb25fYnJ1dGUiOjcwLCJob2xkX3RpY2tzIjowLCJ5YXdfZGVmIjoiUmFuZG9tIiwiZW5hYmxlZCI6dHJ1ZSwid2F5X2RlbCI6WzQsNiwyLDMsNyw2LDEsOCwxLDNdLCJ5YXdfYW1vdW50IjozNjAsImJvZHl5YXciOiJKaXR0ZXIiLCJkZWZfc3Bpbl9zcGVlZCI6MjAsIm9mc193YXlfMSI6MiwiZm9yY2VfbGMiOnRydWUsInh3YXlfc2xpZGVyIjozLCJ5YXdfbGVmdCI6MCwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJXYXlzIn0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjE4MCwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjUsIm9mZnNldCI6MTYsInBpdGNoX3NwZWVkIjo1MCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwib2ZzXzEiOi0xNSwic3BuYV9zcGVlZCI6MTAsImJkX3R5cGUiOiJBZHZhbmNlZCIsImRlbGF5X3N3aXRjaCI6WyJGbHVjdHVhdGUiXSwic3BuYTIiOjAsInN3aXRjaCI6dHJ1ZSwiYm9keV9zdGF0aWMiOjAsImFkYXB0aXZlX2Rlc3luYyI6e30sIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwib2ZzXzIiOjI1LCJzcG5hX3NwZWVkMiI6MTAsIndheXMiOjUsImJvZHlfdHlwZSI6IkR5bmFtaWMiLCJyYW5hMiI6MCwieWF3X3JpZ2h0IjowLCJ4d2F5X2ppdHRlciI6MCwicGl0Y2hfdHlwZSI6IlNwaW4iLCJyYW5hX3N3aXRjaCI6ZmFsc2UsInNwbmEiOjAsIm9mc193YXlzXzIiOls1NCw0MiwwLDAsMF0sImRlbGF5X2ZvcmNlIjpmYWxzZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6LTg5LCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOjAsImRlbGF5IjoxLCJtYWluIjoiRGVmZW5zaXZlIiwicGl0Y2hfbW9kZTIiOjg5LCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6WyJKaXR0ZXIiXSwiYm9keV9sZWZ0IjoxMCwiZHVyYXRpb25fYnJ1dGUiOjQ4LCJob2xkX3RpY2tzIjowLCJ5YXdfZGVmIjoiU3BpbiIsImVuYWJsZWQiOnRydWUsIndheV9kZWwiOls0LDMsNCwzLDQsMSwxLDEsMSwxXSwieWF3X2Ftb3VudCI6MzYwLCJib2R5eWF3IjoiSml0dGVyIiwiZGVmX3NwaW5fc3BlZWQiOjUwLCJvZnNfd2F5XzEiOjIsImZvcmNlX2xjIjpmYWxzZSwieHdheV9zbGlkZXIiOjMsInlhd19sZWZ0IjowLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IldheXMifSx7InBpdGNoX3N0YXRpYyI6MCwiYm9keV9yaWdodCI6LTE4MCwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjEsIm9mZnNldCI6NSwicGl0Y2hfc3BlZWQiOjEyLCJwaXRjaF9zbG93X2RlZiI6MCwieWF3X2ppdHRlciI6IkNlbnRlciIsIm9mc190cF8yIjoiRGVmYXVsdCIsImRlZl9lbiI6dHJ1ZSwic3BuYV9zd2l0Y2giOmZhbHNlLCJkZWZfaml0dGVyX3NwZWVkIjo4LCJvZnNfMSI6MCwic3BuYV9zcGVlZCI6MTAsInJhbmEyIjowLCJkZWxheV9zd2l0Y2giOlsiSG9sZCB0aWNrcyJdLCJzcG5hMiI6MCwic3dpdGNoIjp0cnVlLCJib2R5X3N0YXRpYyI6MCwieWF3X2Ftb3VudCI6MTgwLCJvZnNfd2F5XzIiOjIsImJydXRlX21vZGUiOiJEZWNyZWFzZSIsIm9mc18yIjowLCJzcG5hX3NwZWVkMiI6MTAsImVuYWJsZWQiOnRydWUsInlhd19yaWdodCI6MCwieHdheV9zbGlkZXIiOjMsImJvZHlfdHlwZSI6IlJhbmRvbSIsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiU3BpbiIsInJhbmFfc3dpdGNoIjpmYWxzZSwic3BuYSI6MCwib2ZzX3dheXNfMiI6WzE2LDM1LDIyLDAsMF0sImRlbGF5X2ZvcmNlIjpmYWxzZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6LTEwLCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOjAsImRlbGF5IjoxLCJtYWluIjoiRGVmZW5zaXZlIiwicGl0Y2hfbW9kZTIiOjAsInJhbmEiOjAsIm9mc193YXlzX2RlbGF5XzIiOjIsInlhd19tb2RlIjpbIkppdHRlciJdLCJib2R5X2xlZnQiOjE4MCwiZHVyYXRpb25fYnJ1dGUiOjMyLCJob2xkX3RpY2tzIjowLCJ5YXdfZGVmIjoiSml0dGVyIiwid2F5cyI6OSwid2F5X2RlbCI6WzYsNSw0LDYsNSw0LDMsNCwzLDFdLCJhZGFwdGl2ZV9kZXN5bmMiOlsiQWRhcHRpdmUgRGVzeW5jIl0sImJvZHl5YXciOiJKaXR0ZXIiLCJkZWZfc3Bpbl9zcGVlZCI6MjAsIm9mc193YXlfMSI6MiwiZm9yY2VfbGMiOnRydWUsImJkX3R5cGUiOiJBZHZhbmNlZCIsInlhd19sZWZ0IjowLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6ODksImJvZHlfcmlnaHQiOjE0LCJvZnNfd2F5c18xIjpbLTE2LC0zLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6NCwib2Zmc2V0IjoyMSwicGl0Y2hfc3BlZWQiOjMzLCJwaXRjaF9zbG93X2RlZiI6MTAsInlhd19qaXR0ZXIiOiJPZmYiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwib2ZzXzEiOi0xMSwic3BuYV9zcGVlZCI6MTAsInh3YXlfc2xpZGVyIjozLCJkZWxheV9zd2l0Y2giOlsiRmx1Y3R1YXRlIl0sInNwbmEyIjowLCJzd2l0Y2giOnRydWUsImJvZHlfc3RhdGljIjo0LCJhZGFwdGl2ZV9kZXN5bmMiOlsiRGVsYXkgT2ZmIl0sIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkRlY3JlYXNlIiwib2ZzXzIiOjI1LCJzcG5hX3NwZWVkMiI6MTAsIndheXMiOjgsImJvZHlfdHlwZSI6IkZsdWN0dWF0ZSIsImJkX3R5cGUiOiJBZHZhbmNlZCIsInlhd19yaWdodCI6MCwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJKaXR0ZXIiLCJyYW5hX3N3aXRjaCI6dHJ1ZSwic3BuYSI6MCwib2ZzX3dheXNfMiI6WzMwLDI3LDAsMCwwXSwiZGVsYXlfZm9yY2UiOnRydWUsInJhbmRvbV9kZWxheSI6MCwicGl0Y2hfbW9kZTEiOi04OSwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJkZWxheSI6NiwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjo4OSwicmFuYSI6MjgsIm9mc193YXlzX2RlbGF5XzIiOjIsInlhd19tb2RlIjp7fSwiYm9keV9sZWZ0IjoxODAsImR1cmF0aW9uX2JydXRlIjo1MywiaG9sZF90aWNrcyI6OSwieWF3X2RlZiI6IlNwaW4iLCJlbmFibGVkIjp0cnVlLCJ3YXlfZGVsIjpbNiw1LDcsOCw3LDgsNSw4LDIsMV0sInlhd19hbW91bnQiOjM2MCwiYm9keXlhdyI6IkppdHRlciIsImRlZl9zcGluX3NwZWVkIjo1MCwib2ZzX3dheV8xIjoyLCJmb3JjZV9sYyI6dHJ1ZSwicmFuYTIiOjE1LCJ5YXdfbGVmdCI6MCwicGl0Y2hfaml0dGVyX3NwZWVkIjoxNCwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCJ9LHsicGl0Y2hfc3RhdGljIjowLCJib2R5X3JpZ2h0IjoxODAsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJvZmZzZXQiOi0zLCJwaXRjaF9zcGVlZCI6MTUsInBpdGNoX3Nsb3dfZGVmIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwib2ZzX3RwXzIiOiJEZWZhdWx0IiwiZGVmX2ppdHRlcl9zcGVlZCI6Miwic3BuYV9zd2l0Y2giOmZhbHNlLCJkZWZfZW4iOnRydWUsIm9mc18xIjotOSwic3BuYV9zcGVlZCI6MTAsImJkX3R5cGUiOiJBZHZhbmNlZCIsImRlbGF5X3N3aXRjaCI6e30sInNwbmEyIjowLCJzd2l0Y2giOnRydWUsImJvZHlfc3RhdGljIjowLCJhZGFwdGl2ZV9kZXN5bmMiOlsiQWRhcHRpdmUgRGVzeW5jIiwiRGVsYXkgT2ZmIl0sIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwib2ZzXzIiOjM2LCJzcG5hX3NwZWVkMiI6MTAsIndheXMiOjMsImJvZHlfdHlwZSI6IlJhbmRvbSIsInJhbmEyIjowLCJ5YXdfcmlnaHQiOjAsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiU3BpbiIsInJhbmFfc3dpdGNoIjpmYWxzZSwic3BuYSI6MCwib2ZzX3dheXNfMiI6WzAsMCwwLDAsMF0sImRlbGF5X2ZvcmNlIjpmYWxzZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6LTExLCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOjAsImRlbGF5IjoxLCJtYWluIjoiRGVmZW5zaXZlIiwicGl0Y2hfbW9kZTIiOjEyLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sImJvZHlfbGVmdCI6LTczLCJkdXJhdGlvbl9icnV0ZSI6NDMsImhvbGRfdGlja3MiOjAsInlhd19kZWYiOiJKaXR0ZXIiLCJlbmFibGVkIjp0cnVlLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sInlhd19hbW91bnQiOjE4MCwiYm9keXlhdyI6IkppdHRlciIsImRlZl9zcGluX3NwZWVkIjoyMCwib2ZzX3dheV8xIjoyLCJmb3JjZV9sYyI6dHJ1ZSwieHdheV9zbGlkZXIiOjMsInlhd19sZWZ0IjowLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6LTcyLCJib2R5X3JpZ2h0Ijo5OSwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjEsIm9mZnNldCI6OSwicGl0Y2hfc3BlZWQiOjIwLCJwaXRjaF9zbG93X2RlZiI6MCwieWF3X2ppdHRlciI6Ik9mZiIsIm9mc190cF8yIjoiRGVmYXVsdCIsImRlZl9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJvZnNfMSI6Nywic3BuYV9zcGVlZCI6MTAsImJkX3R5cGUiOiJBZHZhbmNlZCIsImRlbGF5X3N3aXRjaCI6e30sInNwbmEyIjowLCJzd2l0Y2giOnRydWUsImJvZHlfc3RhdGljIjoxNCwiYWRhcHRpdmVfZGVzeW5jIjpbIkRlbGF5IE9mZiJdLCJvZnNfd2F5XzIiOjIsImJydXRlX21vZGUiOiJJbmNyZWFzZSIsIm9mc18yIjo0MCwic3BuYV9zcGVlZDIiOjEwLCJ3YXlzIjozLCJib2R5X3R5cGUiOiJTcGluIiwicmFuYTIiOjAsInlhd19yaWdodCI6MCwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJTdGF0aWMiLCJyYW5hX3N3aXRjaCI6ZmFsc2UsInNwbmEiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6dHJ1ZSwicmFuZG9tX2RlbGF5IjowLCJwaXRjaF9tb2RlMSI6MCwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJkZWxheSI6MywibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sImJvZHlfbGVmdCI6MzYsImR1cmF0aW9uX2JydXRlIjo0NiwiaG9sZF90aWNrcyI6MCwieWF3X2RlZiI6IlNwaW4iLCJlbmFibGVkIjp0cnVlLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sInlhd19hbW91bnQiOjM2MCwiYm9keXlhdyI6IkppdHRlciIsImRlZl9zcGluX3NwZWVkIjoyOSwib2ZzX3dheV8xIjoyLCJmb3JjZV9sYyI6dHJ1ZSwieHdheV9zbGlkZXIiOjMsInlhd19sZWZ0IjowLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6MCwiYm9keV9yaWdodCI6ODIsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJvZmZzZXQiOjAsInBpdGNoX3NwZWVkIjoyMCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwib2ZzXzEiOjAsInNwbmFfc3BlZWQiOjEwLCJiZF90eXBlIjoiQWR2YW5jZWQiLCJkZWxheV9zd2l0Y2giOnt9LCJzcG5hMiI6MCwic3dpdGNoIjpmYWxzZSwiYm9keV9zdGF0aWMiOjAsImFkYXB0aXZlX2Rlc3luYyI6e30sIm9mc193YXlfMiI6MiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwib2ZzXzIiOjAsInNwbmFfc3BlZWQyIjoxMCwid2F5cyI6MywiYm9keV90eXBlIjoiRHluYW1pYyIsInJhbmEyIjowLCJ5YXdfcmlnaHQiOjAsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiT2ZmIiwicmFuYV9zd2l0Y2giOmZhbHNlLCJzcG5hIjowLCJvZnNfd2F5c18yIjpbMCwwLDAsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJyYW5kb21fZGVsYXkiOjAsInBpdGNoX21vZGUxIjowLCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOi0zMiwiZGVsYXkiOjEsIm1haW4iOiJEZWZlbnNpdmUiLCJwaXRjaF9tb2RlMiI6MCwicmFuYSI6MCwib2ZzX3dheXNfZGVsYXlfMiI6MiwieWF3X21vZGUiOlsiSml0dGVyIl0sImJvZHlfbGVmdCI6LTI4LCJkdXJhdGlvbl9icnV0ZSI6MzUsImhvbGRfdGlja3MiOjAsInlhd19kZWYiOiJTdGF0aWNbRlNdIiwiZW5hYmxlZCI6dHJ1ZSwid2F5X2RlbCI6WzEsMSwxLDEsMSwxLDEsMSwxLDFdLCJ5YXdfYW1vdW50Ijo5MCwiYm9keXlhdyI6IkppdHRlciIsImRlZl9zcGluX3NwZWVkIjoyMCwib2ZzX3dheV8xIjoyLCJmb3JjZV9sYyI6ZmFsc2UsInh3YXlfc2xpZGVyIjozLCJ5YXdfbGVmdCI6MCwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjAsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJvZmZzZXQiOjAsInBpdGNoX3NwZWVkIjoyMCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJkZWZfZW4iOmZhbHNlLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9qaXR0ZXJfc3BlZWQiOjIsIm9mc18xIjowLCJzcG5hX3NwZWVkIjoxMCwieHdheV9zbGlkZXIiOjMsImRlbGF5X3N3aXRjaCI6e30sInNwbmEyIjowLCJzd2l0Y2giOmZhbHNlLCJib2R5X3N0YXRpYyI6MCwieWF3X2Ftb3VudCI6MCwib2ZzX3dheV8yIjoyLCJicnV0ZV9tb2RlIjoiRGlzYWJsZWQiLCJvZnNfMiI6MCwic3BuYV9zcGVlZDIiOjEwLCJlbmFibGVkIjpmYWxzZSwieWF3X3JpZ2h0IjowLCJiZF90eXBlIjoiR2FtZXNlbnNlIiwiYm9keV90eXBlIjoiRGVmYXVsdCIsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiT2ZmIiwicmFuYV9zd2l0Y2giOmZhbHNlLCJzcG5hIjowLCJvZnNfd2F5c18yIjpbMCwwLDAsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJyYW5kb21fZGVsYXkiOjAsInBpdGNoX21vZGUxIjowLCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOjAsImRlbGF5IjoxLCJtYWluIjoiWWF3IiwicGl0Y2hfbW9kZTIiOjAsInJhbmEiOjAsIm9mc193YXlzX2RlbGF5XzIiOjIsInlhd19tb2RlIjp7fSwiYm9keV9sZWZ0IjowLCJkdXJhdGlvbl9icnV0ZSI6MCwiaG9sZF90aWNrcyI6MCwieWF3X2RlZiI6Ik9mZiIsIndheXMiOjMsIndheV9kZWwiOlsxLDEsMSwxLDEsMSwxLDEsMSwxXSwiYWRhcHRpdmVfZGVzeW5jIjp7fSwiYm9keXlhdyI6Ik9mZiIsImRlZl9zcGluX3NwZWVkIjoyMCwib2ZzX3dheV8xIjoyLCJmb3JjZV9sYyI6ZmFsc2UsInJhbmEyIjowLCJ5YXdfbGVmdCI6MCwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In1dLCJDVCI6W3sicGl0Y2hfc3RhdGljIjowLCJib2R5X3JpZ2h0IjowLCJvZnNfd2F5c18xIjpbMCwwLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6MSwicmFuYV9zd2l0Y2giOmZhbHNlLCJvZmZzZXQiOjAsInBpdGNoX3Nsb3dfZGVmIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwib2ZzX3RwXzIiOiJEZWZhdWx0IiwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6ZmFsc2UsInlhd19sZWZ0IjowLCJzcG5hX3NwZWVkIjoxMCwicmFuYTIiOjAsImRlbGF5X3N3aXRjaCI6e30sInNwbmEyIjowLCJmb3JjZV9sYyI6ZmFsc2UsIm9mc193YXlfMSI6MiwieHdheV9zbGlkZXIiOjMsImJvZHl5YXciOiJPZmYiLCJicnV0ZV9tb2RlIjoiRGlzYWJsZWQiLCJhZGFwdGl2ZV9kZXN5bmMiOnt9LCJzcG5hX3NwZWVkMiI6MTAsImVuYWJsZWQiOmZhbHNlLCJib2R5X3R5cGUiOiJEZWZhdWx0IiwieWF3X2Ftb3VudCI6MCwid2F5cyI6MywieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJPZmYiLCJwaXRjaF9zcGVlZCI6MjAsImhvbGRfdGlja3MiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6ZmFsc2UsImJvZHlfbGVmdCI6MCwiZGVsYXkiOjEsIm9mc193YXlzX2RlbGF5XzEiOjIsInlhd2ppdHRlciI6MCwicGl0Y2hfbW9kZTEiOjAsIm1haW4iOiJZYXciLCJwaXRjaF9tb2RlMiI6MCwicmFuYSI6MCwib2ZzX3dheXNfZGVsYXlfMiI6MiwieWF3X21vZGUiOnt9LCJyYW5kb21fZGVsYXkiOjAsImR1cmF0aW9uX2JydXRlIjowLCJzcG5hIjowLCJ5YXdfZGVmIjoiT2ZmIiwieWF3X3JpZ2h0IjowLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sIm9mc18yIjowLCJvZnNfd2F5XzIiOjIsImRlZl9zcGluX3NwZWVkIjoyMCwiYm9keV9zdGF0aWMiOjAsInN3aXRjaCI6ZmFsc2UsImJkX3R5cGUiOiJHYW1lc2Vuc2UiLCJvZnNfMSI6MCwiZGVmX2ppdHRlcl9zcGVlZCI6MiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCJ9LHsicGl0Y2hfc3RhdGljIjo4OSwiYm9keV9yaWdodCI6MzIsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJyYW5hX3N3aXRjaCI6ZmFsc2UsIm9mZnNldCI6MSwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsInJhbmEyIjowLCJkZWxheV9zd2l0Y2giOnt9LCJzcG5hMiI6MCwiZm9yY2VfbGMiOnRydWUsIm9mc193YXlfMSI6MiwieHdheV9zbGlkZXIiOjMsImJvZHl5YXciOiJKaXR0ZXIiLCJicnV0ZV9tb2RlIjoiQWRhcHRpdmUiLCJhZGFwdGl2ZV9kZXN5bmMiOlsiQWRhcHRpdmUgRGVzeW5jIiwiRGVsYXkgT2ZmIl0sInNwbmFfc3BlZWQyIjoxMCwiZW5hYmxlZCI6dHJ1ZSwiYm9keV90eXBlIjoiU3BpbiIsInlhd19hbW91bnQiOjM2MCwid2F5cyI6MywieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJTdGF0aWMiLCJwaXRjaF9zcGVlZCI6MjAsImhvbGRfdGlja3MiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6ZmFsc2UsImJvZHlfbGVmdCI6MTQ1LCJkZWxheSI6MSwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJwaXRjaF9tb2RlMSI6MCwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sInJhbmRvbV9kZWxheSI6MCwiZHVyYXRpb25fYnJ1dGUiOjQ3LCJzcG5hIjowLCJ5YXdfZGVmIjoiUmFuZG9tIiwieWF3X3JpZ2h0IjowLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sIm9mc18yIjozMiwib2ZzX3dheV8yIjoyLCJkZWZfc3Bpbl9zcGVlZCI6NTAsImJvZHlfc3RhdGljIjowLCJzd2l0Y2giOnRydWUsImJkX3R5cGUiOiJBZHZhbmNlZCIsIm9mc18xIjo0LCJkZWZfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjU3LCJvZnNfd2F5c18xIjpbMCwwLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6MSwicmFuYV9zd2l0Y2giOmZhbHNlLCJvZmZzZXQiOjEwLCJwaXRjaF9zbG93X2RlZiI6MTAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsInJhbmEyIjowLCJkZWxheV9zd2l0Y2giOlsiRGlzYWJsZSBvbiBGYWtlbGFncyJdLCJzcG5hMiI6MCwiZm9yY2VfbGMiOnRydWUsIm9mc193YXlfMSI6MiwieHdheV9zbGlkZXIiOjMsImJvZHl5YXciOiJKaXR0ZXIiLCJicnV0ZV9tb2RlIjoiQWRhcHRpdmUiLCJhZGFwdGl2ZV9kZXN5bmMiOnt9LCJzcG5hX3NwZWVkMiI6MTAsImVuYWJsZWQiOnRydWUsImJvZHlfdHlwZSI6IlJhbmRvbSIsInlhd19hbW91bnQiOjM2MCwid2F5cyI6NiwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJSYW5kb20iLCJwaXRjaF9zcGVlZCI6MjAsImhvbGRfdGlja3MiOjAsIm9mc193YXlzXzIiOlswLDAsMCwwLDBdLCJkZWxheV9mb3JjZSI6dHJ1ZSwiYm9keV9sZWZ0IjotMTQsImRlbGF5IjoxLCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOi0zOSwicGl0Y2hfbW9kZTEiOi04OSwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjo4OSwicmFuYSI6MCwib2ZzX3dheXNfZGVsYXlfMiI6MiwieWF3X21vZGUiOlsiSml0dGVyIl0sInJhbmRvbV9kZWxheSI6MCwiZHVyYXRpb25fYnJ1dGUiOjcwLCJzcG5hIjowLCJ5YXdfZGVmIjoiUmFuZG9tIiwieWF3X3JpZ2h0IjowLCJ3YXlfZGVsIjpbNCw2LDIsMyw3LDYsMSw4LDEsM10sIm9mc18yIjowLCJvZnNfd2F5XzIiOjIsImRlZl9zcGluX3NwZWVkIjoyMCwiYm9keV9zdGF0aWMiOjAsInN3aXRjaCI6ZmFsc2UsImJkX3R5cGUiOiJBZHZhbmNlZCIsIm9mc18xIjowLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJXYXlzIn0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjE4MCwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjUsInJhbmFfc3dpdGNoIjpmYWxzZSwib2Zmc2V0IjoxNiwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsInJhbmEyIjowLCJkZWxheV9zd2l0Y2giOlsiRmx1Y3R1YXRlIl0sInNwbmEyIjowLCJmb3JjZV9sYyI6ZmFsc2UsIm9mc193YXlfMSI6MiwieHdheV9zbGlkZXIiOjMsImJvZHl5YXciOiJKaXR0ZXIiLCJicnV0ZV9tb2RlIjoiQWRhcHRpdmUiLCJhZGFwdGl2ZV9kZXN5bmMiOnt9LCJzcG5hX3NwZWVkMiI6MTAsImVuYWJsZWQiOnRydWUsImJvZHlfdHlwZSI6IkR5bmFtaWMiLCJ5YXdfYW1vdW50IjozNjAsIndheXMiOjUsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiU3BpbiIsInBpdGNoX3NwZWVkIjo1MCwiaG9sZF90aWNrcyI6MCwib2ZzX3dheXNfMiI6WzU0LDQyLDAsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJib2R5X2xlZnQiOjEwLCJkZWxheSI6MSwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJwaXRjaF9tb2RlMSI6LTg5LCJtYWluIjoiRGVmZW5zaXZlIiwicGl0Y2hfbW9kZTIiOjg5LCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6WyJKaXR0ZXIiXSwicmFuZG9tX2RlbGF5IjowLCJkdXJhdGlvbl9icnV0ZSI6NDgsInNwbmEiOjAsInlhd19kZWYiOiJTcGluIiwieWF3X3JpZ2h0IjowLCJ3YXlfZGVsIjpbNCwzLDQsMyw0LDEsMSwxLDEsMV0sIm9mc18yIjoyNSwib2ZzX3dheV8yIjoyLCJkZWZfc3Bpbl9zcGVlZCI6NTAsImJvZHlfc3RhdGljIjowLCJzd2l0Y2giOnRydWUsImJkX3R5cGUiOiJBZHZhbmNlZCIsIm9mc18xIjotMTUsImRlZl9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IldheXMifSx7InBpdGNoX3N0YXRpYyI6MCwiYm9keV9yaWdodCI6LTE4MCwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjEsInJhbmFfc3dpdGNoIjpmYWxzZSwib2Zmc2V0Ijo1LCJwaXRjaF9zbG93X2RlZiI6MCwieWF3X2ppdHRlciI6IkNlbnRlciIsIm9mc190cF8yIjoiRGVmYXVsdCIsInBpdGNoX2ppdHRlcl9zcGVlZCI6Miwic3BuYV9zd2l0Y2giOmZhbHNlLCJkZWZfaml0dGVyX3NwZWVkIjo4LCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsInh3YXlfc2xpZGVyIjozLCJkZWxheV9zd2l0Y2giOlsiSG9sZCB0aWNrcyJdLCJzcG5hMiI6MCwiZm9yY2VfbGMiOnRydWUsIm9mc193YXlfMSI6MiwiYmRfdHlwZSI6IkFkdmFuY2VkIiwiYm9keXlhdyI6IkppdHRlciIsImJydXRlX21vZGUiOiJEZWNyZWFzZSIsInlhd19hbW91bnQiOjE4MCwic3BuYV9zcGVlZDIiOjEwLCJ3YXlzIjo5LCJ5YXdfcmlnaHQiOjAsImFkYXB0aXZlX2Rlc3luYyI6WyJBZGFwdGl2ZSBEZXN5bmMiXSwiZW5hYmxlZCI6dHJ1ZSwieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJTcGluIiwicGl0Y2hfc3BlZWQiOjEyLCJob2xkX3RpY2tzIjowLCJvZnNfd2F5c18yIjpbMTYsMzUsMjIsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJib2R5X2xlZnQiOjE4MCwiZGVsYXkiOjEsIm9mc193YXlzX2RlbGF5XzEiOjIsInlhd2ppdHRlciI6MCwicGl0Y2hfbW9kZTEiOi0xMCwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6WyJKaXR0ZXIiXSwicmFuZG9tX2RlbGF5IjowLCJkdXJhdGlvbl9icnV0ZSI6MzIsInNwbmEiOjAsInlhd19kZWYiOiJKaXR0ZXIiLCJib2R5X3R5cGUiOiJSYW5kb20iLCJ3YXlfZGVsIjpbNiw1LDQsNiw1LDQsMyw0LDMsMV0sIm9mc18yIjowLCJvZnNfd2F5XzIiOjIsImRlZl9zcGluX3NwZWVkIjoyMCwiYm9keV9zdGF0aWMiOjAsInN3aXRjaCI6dHJ1ZSwicmFuYTIiOjAsIm9mc18xIjowLCJkZWZfZW4iOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6ODksImJvZHlfcmlnaHQiOjE0LCJvZnNfd2F5c18xIjpbLTE2LC0zLDAsMCwwXSwib2ZzX3RwXzEiOiJEZWZhdWx0IiwiZGVsYXlfZmx1YyI6NCwicmFuYV9zd2l0Y2giOnRydWUsIm9mZnNldCI6MjEsInBpdGNoX3Nsb3dfZGVmIjoxMCwieWF3X2ppdHRlciI6Ik9mZiIsIm9mc190cF8yIjoiRGVmYXVsdCIsInBpdGNoX2ppdHRlcl9zcGVlZCI6MTQsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsImJkX3R5cGUiOiJBZHZhbmNlZCIsImRlbGF5X3N3aXRjaCI6WyJGbHVjdHVhdGUiXSwic3BuYTIiOjAsImZvcmNlX2xjIjp0cnVlLCJvZnNfd2F5XzEiOjIsInJhbmEyIjoxNSwiYm9keXlhdyI6IkppdHRlciIsImJydXRlX21vZGUiOiJEZWNyZWFzZSIsImFkYXB0aXZlX2Rlc3luYyI6WyJEZWxheSBPZmYiXSwic3BuYV9zcGVlZDIiOjEwLCJlbmFibGVkIjp0cnVlLCJib2R5X3R5cGUiOiJGbHVjdHVhdGUiLCJ5YXdfYW1vdW50IjozNjAsIndheXMiOjgsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiSml0dGVyIiwicGl0Y2hfc3BlZWQiOjMzLCJob2xkX3RpY2tzIjo5LCJvZnNfd2F5c18yIjpbMzAsMjcsMCwwLDBdLCJkZWxheV9mb3JjZSI6dHJ1ZSwiYm9keV9sZWZ0IjoxODAsImRlbGF5Ijo2LCJvZnNfd2F5c19kZWxheV8xIjoyLCJ5YXdqaXR0ZXIiOjAsInBpdGNoX21vZGUxIjotODksIm1haW4iOiJEZWZlbnNpdmUiLCJwaXRjaF9tb2RlMiI6ODksInJhbmEiOjI4LCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sInJhbmRvbV9kZWxheSI6MCwiZHVyYXRpb25fYnJ1dGUiOjUzLCJzcG5hIjowLCJ5YXdfZGVmIjoiU3BpbiIsInlhd19yaWdodCI6MCwid2F5X2RlbCI6WzYsNSw3LDgsNyw4LDUsOCwyLDFdLCJvZnNfMiI6MjUsIm9mc193YXlfMiI6MiwiZGVmX3NwaW5fc3BlZWQiOjUwLCJib2R5X3N0YXRpYyI6NCwic3dpdGNoIjp0cnVlLCJ4d2F5X3NsaWRlciI6Mywib2ZzXzEiOi0xMSwiZGVmX2ppdHRlcl9zcGVlZCI6MiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCJ9LHsicGl0Y2hfc3RhdGljIjowLCJib2R5X3JpZ2h0IjoxODAsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJyYW5hX3N3aXRjaCI6ZmFsc2UsIm9mZnNldCI6LTMsInBpdGNoX3Nsb3dfZGVmIjowLCJ5YXdfaml0dGVyIjoiT2ZmIiwib2ZzX3RwXzIiOiJEZWZhdWx0IiwicGl0Y2hfaml0dGVyX3NwZWVkIjoyLCJzcG5hX3N3aXRjaCI6ZmFsc2UsImRlZl9lbiI6dHJ1ZSwieWF3X2xlZnQiOjAsInNwbmFfc3BlZWQiOjEwLCJyYW5hMiI6MCwiZGVsYXlfc3dpdGNoIjp7fSwic3BuYTIiOjAsImZvcmNlX2xjIjp0cnVlLCJvZnNfd2F5XzEiOjIsInh3YXlfc2xpZGVyIjozLCJib2R5eWF3IjoiSml0dGVyIiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwiYWRhcHRpdmVfZGVzeW5jIjpbIkFkYXB0aXZlIERlc3luYyIsIkRlbGF5IE9mZiJdLCJzcG5hX3NwZWVkMiI6MTAsImVuYWJsZWQiOnRydWUsImJvZHlfdHlwZSI6IlJhbmRvbSIsInlhd19hbW91bnQiOjE4MCwid2F5cyI6MywieHdheV9qaXR0ZXIiOjAsInBpdGNoX3R5cGUiOiJTcGluIiwicGl0Y2hfc3BlZWQiOjE1LCJob2xkX3RpY2tzIjowLCJvZnNfd2F5c18yIjpbMCwwLDAsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJib2R5X2xlZnQiOi03MywiZGVsYXkiOjEsIm9mc193YXlzX2RlbGF5XzEiOjIsInlhd2ppdHRlciI6MCwicGl0Y2hfbW9kZTEiOi0xMSwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjoxMiwicmFuYSI6MCwib2ZzX3dheXNfZGVsYXlfMiI6MiwieWF3X21vZGUiOnt9LCJyYW5kb21fZGVsYXkiOjAsImR1cmF0aW9uX2JydXRlIjo0Mywic3BuYSI6MCwieWF3X2RlZiI6IkppdHRlciIsInlhd19yaWdodCI6MCwid2F5X2RlbCI6WzEsMSwxLDEsMSwxLDEsMSwxLDFdLCJvZnNfMiI6MzYsIm9mc193YXlfMiI6MiwiZGVmX3NwaW5fc3BlZWQiOjIwLCJib2R5X3N0YXRpYyI6MCwic3dpdGNoIjp0cnVlLCJiZF90eXBlIjoiQWR2YW5jZWQiLCJvZnNfMSI6LTksImRlZl9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6LTcyLCJib2R5X3JpZ2h0Ijo5OSwib2ZzX3dheXNfMSI6WzAsMCwwLDAsMF0sIm9mc190cF8xIjoiRGVmYXVsdCIsImRlbGF5X2ZsdWMiOjEsInJhbmFfc3dpdGNoIjpmYWxzZSwib2Zmc2V0Ijo5LCJwaXRjaF9zbG93X2RlZiI6MCwieWF3X2ppdHRlciI6Ik9mZiIsIm9mc190cF8yIjoiRGVmYXVsdCIsInBpdGNoX2ppdHRlcl9zcGVlZCI6Miwic3BuYV9zd2l0Y2giOmZhbHNlLCJkZWZfZW4iOnRydWUsInlhd19sZWZ0IjowLCJzcG5hX3NwZWVkIjoxMCwicmFuYTIiOjAsImRlbGF5X3N3aXRjaCI6e30sInNwbmEyIjowLCJmb3JjZV9sYyI6dHJ1ZSwib2ZzX3dheV8xIjoyLCJ4d2F5X3NsaWRlciI6MywiYm9keXlhdyI6IkppdHRlciIsImJydXRlX21vZGUiOiJJbmNyZWFzZSIsImFkYXB0aXZlX2Rlc3luYyI6WyJEZWxheSBPZmYiXSwic3BuYV9zcGVlZDIiOjEwLCJlbmFibGVkIjp0cnVlLCJib2R5X3R5cGUiOiJTcGluIiwieWF3X2Ftb3VudCI6MzYwLCJ3YXlzIjozLCJ4d2F5X2ppdHRlciI6MCwicGl0Y2hfdHlwZSI6IlN0YXRpYyIsInBpdGNoX3NwZWVkIjoyMCwiaG9sZF90aWNrcyI6MCwib2ZzX3dheXNfMiI6WzAsMCwwLDAsMF0sImRlbGF5X2ZvcmNlIjp0cnVlLCJib2R5X2xlZnQiOjM2LCJkZWxheSI6Mywib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJwaXRjaF9tb2RlMSI6MCwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sInJhbmRvbV9kZWxheSI6MCwiZHVyYXRpb25fYnJ1dGUiOjQ2LCJzcG5hIjowLCJ5YXdfZGVmIjoiU3BpbiIsInlhd19yaWdodCI6MCwid2F5X2RlbCI6WzEsMSwxLDEsMSwxLDEsMSwxLDFdLCJvZnNfMiI6NDAsIm9mc193YXlfMiI6MiwiZGVmX3NwaW5fc3BlZWQiOjI5LCJib2R5X3N0YXRpYyI6MTQsInN3aXRjaCI6dHJ1ZSwiYmRfdHlwZSI6IkFkdmFuY2VkIiwib2ZzXzEiOjcsImRlZl9qaXR0ZXJfc3BlZWQiOjIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQifSx7InBpdGNoX3N0YXRpYyI6MCwiYm9keV9yaWdodCI6ODIsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJyYW5hX3N3aXRjaCI6ZmFsc2UsIm9mZnNldCI6MCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjp0cnVlLCJ5YXdfbGVmdCI6MCwic3BuYV9zcGVlZCI6MTAsInJhbmEyIjowLCJkZWxheV9zd2l0Y2giOnt9LCJzcG5hMiI6MCwiZm9yY2VfbGMiOmZhbHNlLCJvZnNfd2F5XzEiOjIsInh3YXlfc2xpZGVyIjozLCJib2R5eWF3IjoiSml0dGVyIiwiYnJ1dGVfbW9kZSI6IkFkYXB0aXZlIiwiYWRhcHRpdmVfZGVzeW5jIjp7fSwic3BuYV9zcGVlZDIiOjEwLCJlbmFibGVkIjp0cnVlLCJib2R5X3R5cGUiOiJEeW5hbWljIiwieWF3X2Ftb3VudCI6OTAsIndheXMiOjMsInh3YXlfaml0dGVyIjowLCJwaXRjaF90eXBlIjoiT2ZmIiwicGl0Y2hfc3BlZWQiOjIwLCJob2xkX3RpY2tzIjowLCJvZnNfd2F5c18yIjpbMCwwLDAsMCwwXSwiZGVsYXlfZm9yY2UiOmZhbHNlLCJib2R5X2xlZnQiOi0yOCwiZGVsYXkiOjEsIm9mc193YXlzX2RlbGF5XzEiOjIsInlhd2ppdHRlciI6LTMyLCJwaXRjaF9tb2RlMSI6MCwibWFpbiI6IkRlZmVuc2l2ZSIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6WyJKaXR0ZXIiXSwicmFuZG9tX2RlbGF5IjowLCJkdXJhdGlvbl9icnV0ZSI6MzUsInNwbmEiOjAsInlhd19kZWYiOiJTdGF0aWNbRlNdIiwieWF3X3JpZ2h0IjowLCJ3YXlfZGVsIjpbMSwxLDEsMSwxLDEsMSwxLDEsMV0sIm9mc18yIjowLCJvZnNfd2F5XzIiOjIsImRlZl9zcGluX3NwZWVkIjoyMCwiYm9keV9zdGF0aWMiOjAsInN3aXRjaCI6ZmFsc2UsImJkX3R5cGUiOiJBZHZhbmNlZCIsIm9mc18xIjowLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In0seyJwaXRjaF9zdGF0aWMiOjAsImJvZHlfcmlnaHQiOjAsIm9mc193YXlzXzEiOlswLDAsMCwwLDBdLCJvZnNfdHBfMSI6IkRlZmF1bHQiLCJkZWxheV9mbHVjIjoxLCJyYW5hX3N3aXRjaCI6ZmFsc2UsIm9mZnNldCI6MCwicGl0Y2hfc2xvd19kZWYiOjAsInlhd19qaXR0ZXIiOiJPZmYiLCJvZnNfdHBfMiI6IkRlZmF1bHQiLCJwaXRjaF9qaXR0ZXJfc3BlZWQiOjIsInNwbmFfc3dpdGNoIjpmYWxzZSwiZGVmX2VuIjpmYWxzZSwieWF3X2xlZnQiOjAsInNwbmFfc3BlZWQiOjEwLCJyYW5hMiI6MCwiZGVsYXlfc3dpdGNoIjp7fSwic3BuYTIiOjAsImZvcmNlX2xjIjpmYWxzZSwib2ZzX3dheV8xIjoyLCJ4d2F5X3NsaWRlciI6MywiYm9keXlhdyI6Ik9mZiIsImJydXRlX21vZGUiOiJEaXNhYmxlZCIsImFkYXB0aXZlX2Rlc3luYyI6e30sInNwbmFfc3BlZWQyIjoxMCwiZW5hYmxlZCI6ZmFsc2UsImJvZHlfdHlwZSI6IkRlZmF1bHQiLCJ5YXdfYW1vdW50IjowLCJ3YXlzIjozLCJ4d2F5X2ppdHRlciI6MCwicGl0Y2hfdHlwZSI6Ik9mZiIsInBpdGNoX3NwZWVkIjoyMCwiaG9sZF90aWNrcyI6MCwib2ZzX3dheXNfMiI6WzAsMCwwLDAsMF0sImRlbGF5X2ZvcmNlIjpmYWxzZSwiYm9keV9sZWZ0IjowLCJkZWxheSI6MSwib2ZzX3dheXNfZGVsYXlfMSI6MiwieWF3aml0dGVyIjowLCJwaXRjaF9tb2RlMSI6MCwibWFpbiI6IllhdyIsInBpdGNoX21vZGUyIjowLCJyYW5hIjowLCJvZnNfd2F5c19kZWxheV8yIjoyLCJ5YXdfbW9kZSI6e30sInJhbmRvbV9kZWxheSI6MCwiZHVyYXRpb25fYnJ1dGUiOjAsInNwbmEiOjAsInlhd19kZWYiOiJPZmYiLCJ5YXdfcmlnaHQiOjAsIndheV9kZWwiOlsxLDEsMSwxLDEsMSwxLDEsMSwxXSwib2ZzXzIiOjAsIm9mc193YXlfMiI6MiwiZGVmX3NwaW5fc3BlZWQiOjIwLCJib2R5X3N0YXRpYyI6MCwic3dpdGNoIjpmYWxzZSwiYmRfdHlwZSI6IkdhbWVzZW5zZSIsIm9mc18xIjowLCJkZWZfaml0dGVyX3NwZWVkIjoyLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0In1dfSwiaGl0Y2hhbmNlIjpbeyJvdnJfaGl0IjowLCJvdnJfYWlyX2hpdCI6MzEsImhvdCI6WzEsMCwifiJdfSx7Im92cl9oaXQiOjAsIm92cl9haXJfaGl0IjoyMywiaG90IjpbMiw4OCwifiJdfSx7Im92cl9oaXQiOjIzLCJvdnJfYWlyX2hpdCI6MzcsImhvdCI6WzIsODgsIn4iXX0seyJvdnJfaGl0IjozNSwib3ZyX2Fpcl9oaXQiOjQ1LCJob3QiOlsyLDg4LCJ+Il19LHsib3ZyX2hpdCI6MzksIm92cl9haXJfaGl0IjowLCJob3QiOlsyLDg4LCJ+Il19LHsib3ZyX2hpdCI6NDUsIm92cl9haXJfaGl0IjowLCJob3QiOlsyLDg4LCJ+Il19XSwiYWltdG9vbHMiOlt7Im11bHRpX2hpZ2giOjIzLCJkZWxheV9hZnRlcl9taXMiOjAsImJvZHlfaHAiOjgwLCJkZWxheV9sb3ciOjAsImRlbGF5X2xvd2VyX3RoYW5fWCI6MCwibXVsdGlfbGV0aGFsIjoyMywiZGVsYXlfbGV0aCI6MCwiZGVsYXlfbWlzc2VzIjoyLCJtdWx0aV9ocF90aGFuX3giOjIzLCJoaXRzY2FuX21pc3NlcyI6MiwiaGl0Y2hhbmNlX21pc3NlcyI6MiwiaGl0Y2hhbmNlX2xldGhhbCI6MCwic2FmZV9ocCI6ODAsImJvZHlfbWlzc2VzIjoyLCJoaXRzY2FuX2hpZ2giOjMsIm9wdGlvbnMiOiJBaW1ib3QiLCJtdWx0aV9hZnRlcl9taXNzIjoyMywiaGl0c2Nhbl9sb3ciOjIsIm11bHRpIjoiTG93ZXIgdGhhbiB5b3UiLCJoaXRzY2FuIjoiTG93ZXIgdGhhbiB5b3UiLCJkZWxheSI6IkhpZ2hlciB0aGFuIHlvdSIsImhpdGNoYW5jZV9oaWdoIjowLCJzYWZlX21pc3NlcyI6MiwiaGl0c2Nhbl9sb3dlcl90aGFuX1giOjAsIm11bHRpX2xvdyI6MjMsImhpdGNoYW5jZV9hZnRlcl9taXNzIjowLCJkZWxheV9oaWdoIjowLCJoaXRzY2FuX2FmdGVyX21pcyI6MCwiaGl0c2Nhbl9ocCI6ODAsIm11bHRpX2hwIjo4MCwiaGl0Y2hhbmNlX2hwX3RoYW5feCI6MCwiaGl0c2Nhbl9sZXRoIjoyLCJib2R5X3ByZWZlciI6WyJ+Il0sInNhZmVfcHJlZmVyIjpbIn4iXSwiaGl0Y2hhbmNlX2xvdyI6NjEsImhpdGNoYW5jZSI6Ikxvd2VyIHRoYW4geW91IiwiZGVsYXlfaHAiOjgwLCJoaXRjaGFuY2VfaHAiOjgwLCJtdWx0aV9taXNzZXMiOjJ9LHsibXVsdGlfaGlnaCI6NjQsImRlbGF5X2FmdGVyX21pcyI6MCwiYm9keV9ocCI6ODAsImRlbGF5X2xvdyI6MCwiZGVsYXlfbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sZXRoYWwiOjIzLCJkZWxheV9sZXRoIjowLCJkZWxheV9taXNzZXMiOjIsIm11bHRpX2hwX3RoYW5feCI6MjMsImhpdHNjYW5fbWlzc2VzIjoyLCJoaXRjaGFuY2VfbWlzc2VzIjoyLCJoaXRjaGFuY2VfbGV0aGFsIjowLCJzYWZlX2hwIjo4MCwiYm9keV9taXNzZXMiOjIsImhpdHNjYW5faGlnaCI6NCwib3B0aW9ucyI6IkFpbWJvdCIsIm11bHRpX2FmdGVyX21pc3MiOjIzLCJoaXRzY2FuX2xvdyI6MywibXVsdGkiOiJMb3dlciB0aGFuIHlvdSIsImhpdHNjYW4iOiJMb3dlciB0aGFuIHlvdSIsImRlbGF5IjoiSGlnaGVyIHRoYW4geW91IiwiaGl0Y2hhbmNlX2hpZ2giOjAsInNhZmVfbWlzc2VzIjoyLCJoaXRzY2FuX2xvd2VyX3RoYW5fWCI6MCwibXVsdGlfbG93Ijo1MywiaGl0Y2hhbmNlX2FmdGVyX21pc3MiOjAsImRlbGF5X2hpZ2giOjAsImhpdHNjYW5fYWZ0ZXJfbWlzIjowLCJoaXRzY2FuX2hwIjo4MCwibXVsdGlfaHAiOjgwLCJoaXRjaGFuY2VfaHBfdGhhbl94IjowLCJoaXRzY2FuX2xldGgiOjAsImJvZHlfcHJlZmVyIjpbIn4iXSwic2FmZV9wcmVmZXIiOlsiQWZ0ZXIgWCBNaXNzZXMiLCJ+Il0sImhpdGNoYW5jZV9sb3ciOjAsImhpdGNoYW5jZSI6IkhpZ2hlciB0aGFuIHlvdSIsImRlbGF5X2hwIjo4MCwiaGl0Y2hhbmNlX2hwIjo4MCwibXVsdGlfbWlzc2VzIjoyfSx7Im11bHRpX2hpZ2giOjc3LCJkZWxheV9hZnRlcl9taXMiOjAsImJvZHlfaHAiOjgwLCJkZWxheV9sb3ciOjAsImRlbGF5X2xvd2VyX3RoYW5fWCI6MCwibXVsdGlfbGV0aGFsIjoyMywiZGVsYXlfbGV0aCI6MCwiZGVsYXlfbWlzc2VzIjoyLCJtdWx0aV9ocF90aGFuX3giOjIzLCJoaXRzY2FuX21pc3NlcyI6MiwiaGl0Y2hhbmNlX21pc3NlcyI6MiwiaGl0Y2hhbmNlX2xldGhhbCI6MCwic2FmZV9ocCI6ODAsImJvZHlfbWlzc2VzIjoyLCJoaXRzY2FuX2hpZ2giOjQsIm9wdGlvbnMiOiJBaW1ib3QiLCJtdWx0aV9hZnRlcl9taXNzIjoyMywiaGl0c2Nhbl9sb3ciOjMsIm11bHRpIjoiSGlnaGVyIHRoYW4geW91IiwiaGl0c2NhbiI6IkhpZ2hlciB0aGFuIHlvdSIsImRlbGF5IjoiTG93ZXIgdGhhbiB5b3UiLCJoaXRjaGFuY2VfaGlnaCI6MCwic2FmZV9taXNzZXMiOjMsImhpdHNjYW5fbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sb3ciOjU5LCJoaXRjaGFuY2VfYWZ0ZXJfbWlzcyI6MCwiZGVsYXlfaGlnaCI6MCwiaGl0c2Nhbl9hZnRlcl9taXMiOjAsImhpdHNjYW5faHAiOjgwLCJtdWx0aV9ocCI6ODAsImhpdGNoYW5jZV9ocF90aGFuX3giOjAsImhpdHNjYW5fbGV0aCI6MCwiYm9keV9wcmVmZXIiOlsifiJdLCJzYWZlX3ByZWZlciI6WyJIaWdoZXIgdGhhbiB5b3UiLCJBZnRlciBYIE1pc3NlcyIsIn4iXSwiaGl0Y2hhbmNlX2xvdyI6NjEsImhpdGNoYW5jZSI6IkhpZ2hlciB0aGFuIHlvdSIsImRlbGF5X2hwIjo4MCwiaGl0Y2hhbmNlX2hwIjo4MCwibXVsdGlfbWlzc2VzIjowfSx7Im11bHRpX2hpZ2giOjc3LCJkZWxheV9hZnRlcl9taXMiOjEsImJvZHlfaHAiOjgwLCJkZWxheV9sb3ciOjAsImRlbGF5X2xvd2VyX3RoYW5fWCI6MCwibXVsdGlfbGV0aGFsIjoyMywiZGVsYXlfbGV0aCI6MCwiZGVsYXlfbWlzc2VzIjozLCJtdWx0aV9ocF90aGFuX3giOjIzLCJoaXRzY2FuX21pc3NlcyI6MiwiaGl0Y2hhbmNlX21pc3NlcyI6MiwiaGl0Y2hhbmNlX2xldGhhbCI6MCwic2FmZV9ocCI6ODAsImJvZHlfbWlzc2VzIjoyLCJoaXRzY2FuX2hpZ2giOjIsIm9wdGlvbnMiOiJBaW1ib3QiLCJtdWx0aV9hZnRlcl9taXNzIjoyMywiaGl0c2Nhbl9sb3ciOjAsIm11bHRpIjoiSGlnaGVyIHRoYW4geW91IiwiaGl0c2NhbiI6IkhpZ2hlciB0aGFuIHlvdSIsImRlbGF5IjoiTG93ZXIgdGhhbiB5b3UiLCJoaXRjaGFuY2VfaGlnaCI6MCwic2FmZV9taXNzZXMiOjMsImhpdHNjYW5fbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sb3ciOjIzLCJoaXRjaGFuY2VfYWZ0ZXJfbWlzcyI6MCwiZGVsYXlfaGlnaCI6MSwiaGl0c2Nhbl9hZnRlcl9taXMiOjAsImhpdHNjYW5faHAiOjgwLCJtdWx0aV9ocCI6ODAsImhpdGNoYW5jZV9ocF90aGFuX3giOjAsImhpdHNjYW5fbGV0aCI6MCwiYm9keV9wcmVmZXIiOlsifiJdLCJzYWZlX3ByZWZlciI6WyJMZXRoYWwiLCJBZnRlciBYIE1pc3NlcyIsIn4iXSwiaGl0Y2hhbmNlX2xvdyI6MCwiaGl0Y2hhbmNlIjoiSGlnaGVyIHRoYW4geW91IiwiZGVsYXlfaHAiOjgwLCJoaXRjaGFuY2VfaHAiOjgwLCJtdWx0aV9taXNzZXMiOjB9LHsibXVsdGlfaGlnaCI6MjMsImRlbGF5X2FmdGVyX21pcyI6MCwiYm9keV9ocCI6ODAsImRlbGF5X2xvdyI6MCwiZGVsYXlfbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sZXRoYWwiOjIzLCJkZWxheV9sZXRoIjowLCJkZWxheV9taXNzZXMiOjIsIm11bHRpX2hwX3RoYW5feCI6MjMsImhpdHNjYW5fbWlzc2VzIjoyLCJoaXRjaGFuY2VfbWlzc2VzIjoyLCJoaXRjaGFuY2VfbGV0aGFsIjowLCJzYWZlX2hwIjo4MCwiYm9keV9taXNzZXMiOjIsImhpdHNjYW5faGlnaCI6Mywib3B0aW9ucyI6IkFpbWJvdCIsIm11bHRpX2FmdGVyX21pc3MiOjIzLCJoaXRzY2FuX2xvdyI6MiwibXVsdGkiOiJIaWdoZXIgdGhhbiB5b3UiLCJoaXRzY2FuIjoiSGlnaGVyIHRoYW4geW91IiwiZGVsYXkiOiJIaWdoZXIgdGhhbiB5b3UiLCJoaXRjaGFuY2VfaGlnaCI6MCwic2FmZV9taXNzZXMiOjIsImhpdHNjYW5fbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sb3ciOjIzLCJoaXRjaGFuY2VfYWZ0ZXJfbWlzcyI6MCwiZGVsYXlfaGlnaCI6MCwiaGl0c2Nhbl9hZnRlcl9taXMiOjAsImhpdHNjYW5faHAiOjgwLCJtdWx0aV9ocCI6ODAsImhpdGNoYW5jZV9ocF90aGFuX3giOjAsImhpdHNjYW5fbGV0aCI6MCwiYm9keV9wcmVmZXIiOlsifiJdLCJzYWZlX3ByZWZlciI6WyJIaWdoZXIgdGhhbiB5b3UiLCJMb3dlciB0aGFuIHlvdSIsIn4iXSwiaGl0Y2hhbmNlX2xvdyI6MCwiaGl0Y2hhbmNlIjoiSGlnaGVyIHRoYW4geW91IiwiZGVsYXlfaHAiOjgwLCJoaXRjaGFuY2VfaHAiOjgwLCJtdWx0aV9taXNzZXMiOjJ9LHsibXVsdGlfaGlnaCI6ODEsImRlbGF5X2FmdGVyX21pcyI6MCwiYm9keV9ocCI6ODAsImRlbGF5X2xvdyI6MCwiZGVsYXlfbG93ZXJfdGhhbl9YIjowLCJtdWx0aV9sZXRoYWwiOjIzLCJkZWxheV9sZXRoIjowLCJkZWxheV9taXNzZXMiOjIsIm11bHRpX2hwX3RoYW5feCI6MjMsImhpdHNjYW5fbWlzc2VzIjoyLCJoaXRjaGFuY2VfbWlzc2VzIjoyLCJoaXRjaGFuY2VfbGV0aGFsIjowLCJzYWZlX2hwIjo4MCwiYm9keV9taXNzZXMiOjIsImhpdHNjYW5faGlnaCI6Mywib3B0aW9ucyI6IkFpbWJvdCIsIm11bHRpX2FmdGVyX21pc3MiOjIzLCJoaXRzY2FuX2xvdyI6MiwibXVsdGkiOiJMZXRoYWwiLCJoaXRzY2FuIjoiTGV0aGFsIiwiZGVsYXkiOiJMb3dlciB0aGFuIHlvdSIsImhpdGNoYW5jZV9oaWdoIjowLCJzYWZlX21pc3NlcyI6MSwiaGl0c2Nhbl9sb3dlcl90aGFuX1giOjAsIm11bHRpX2xvdyI6NzAsImhpdGNoYW5jZV9hZnRlcl9taXNzIjowLCJkZWxheV9oaWdoIjowLCJoaXRzY2FuX2FmdGVyX21pcyI6MCwiaGl0c2Nhbl9ocCI6ODAsIm11bHRpX2hwIjo4MCwiaGl0Y2hhbmNlX2hwX3RoYW5feCI6MCwiaGl0c2Nhbl9sZXRoIjowLCJib2R5X3ByZWZlciI6WyJIUCBsb3dlciB0aGFuIFgiLCJ+Il0sInNhZmVfcHJlZmVyIjpbIkFmdGVyIFggTWlzc2VzIiwifiJdLCJoaXRjaGFuY2VfbG93IjowLCJoaXRjaGFuY2UiOiJMb3dlciB0aGFuIHlvdSIsImRlbGF5X2hwIjo4MCwiaGl0Y2hhbmNlX2hwIjo4MCwibXVsdGlfbWlzc2VzIjoyfV0sInNjb3V0Ijp7Imp1bXBzdG9wX2hvdGtleSI6WzEsMTYsIn4iXSwianVtcHN0b3BfZGVsYXkiOmZhbHNlLCJqdW1wc3RvcF9kaXN0YW5jZSI6MzUwfX19'
    local default_db = {
        menu_list = {"Default"},
        cfg_list = {
            {"Default", hardcoded_default_base64}  
        }      
    }
   
    local current_loaded_id = nil

    local configs_db = default_db
    local content = readfile(file_path)

    function cfg_system.save_db()
        configs_db.version = current_script_version
        writefile(file_path, json.stringify(configs_db))
    end

    if content and content ~= "" then
        local status, parsed = pcall(json.parse, content)

        if status and parsed and type(parsed) == "table" and parsed.cfg_list then
            configs_db = parsed

            local file_version = configs_db.version or 0

            local first_slot_data = configs_db.cfg_list[1] and configs_db.cfg_list[1][2] or ""
            local is_empty = #first_slot_data < 100 

            if file_version < current_script_version or is_empty then

                if not configs_db.cfg_list[1] then
                    configs_db.cfg_list[1] = {"Default", hardcoded_default_base64}
                else
                    configs_db.cfg_list[1][2] = hardcoded_default_base64
                end
                
                configs_db.version = current_script_version
                cfg_system.save_db()
            end
        else
            configs_db = default_db
            cfg_system.save_db()
        end
    else
        configs_db = default_db
        cfg_system.save_db()
    end

    if menu and menu.information and menu.information.list then
        menu.information.list:update(configs_db.menu_list)
    end

    function cfg_system.save_db()
        if configs_db then
            writefile(file_path, json.stringify(configs_db))
        end
    end
    if content == nil or content == "" then
        cfg_system.save_db()
    end
    local config_cfg = {
        menu = menu,
        aimtools = aimtools,
        hitchance = hit,
        scout = scout,
    }
    local package = pui.setup(config_cfg)

    function cfg_system.merge_config_data(current_data, new_data, selected_categories)
        if not selected_categories or #selected_categories == 0 then
            return new_data
        end

        local merged = current_data

        for _, category in ipairs(selected_categories) do
            local lower_category = string.lower(category)

            if lower_category == "ragebot" then
                if new_data.menu and new_data.menu.ragebot then
                    merged.menu.ragebot = new_data.menu.ragebot
                end
                if new_data.aimtools then
                    merged.aimtools = new_data.aimtools
                end
                if new_data.hitchance then
                    merged.hitchance = new_data.hitchance
                end
                if new_data.scout then
                    merged.scout = new_data.scout
                end
            elseif lower_category == "anti-aim" then
                if new_data.menu and new_data.menu.antiaim then
                    merged.menu.antiaim = new_data.menu.antiaim
                end
                if new_data.sides_data then
                    merged.sides_data = new_data.sides_data
                end
            elseif lower_category == "visuals" then
                if new_data.menu and new_data.menu.visuals then
                    merged.menu.visuals = new_data.menu.visuals
                end
                if new_data.menu and new_data.menu.drag then 
                    merged.menu.drag = new_data.menu.drag 
                end

            elseif lower_category == "miscellaneous" then
                if new_data.menu and new_data.menu.misc then
                    merged.menu.misc = new_data.menu.misc
                end
            elseif lower_category == "information" then
                if new_data.menu and new_data.menu.information then
                    merged.menu.information = new_data.menu.information
                end
                if new_data.menu and new_data.menu.spectator then 
                    merged.menu.spectator = new_data.menu.spectator 
                end
                if new_data.menu and new_data.menu.keybinds then 
                    merged.menu.keybinds = new_data.menu.keybinds 
                end
            end
        end

        return merged
    end

    function cfg_system.filter_config_data(data, selected_categories)
        if not selected_categories or #selected_categories == 0 then
            return data 
        end
        
        local filtered = { menu = {} }
        
        for _, category in ipairs(selected_categories) do
            local lower_category = string.lower(category)
            if lower_category == "ragebot" then
                if data.menu.ragebot then filtered.menu.ragebot = data.menu.ragebot end
                if data.aimtools then filtered.aimtools = data.aimtools end
                if data.hitchance then filtered.hitchance = data.hitchance end
                if data.scout then filtered.scout = data.scout end
            elseif lower_category == "anti-aim" then
                if data.menu.antiaim then filtered.menu.antiaim = data.menu.antiaim end
                if data.sides_data then filtered.sides_data = data.sides_data end
            elseif lower_category == "visuals" then
                if data.menu.visuals then filtered.menu.visuals = data.menu.visuals end
                if data.menu.drag then filtered.menu.drag = data.menu.drag end
            elseif lower_category == "miscellaneous" then
                if data.menu.misc then filtered.menu.misc = data.menu.misc end
            elseif lower_category == "information" then
                if data.menu.information then filtered.menu.information = data.menu.information end
                if data.menu.spectator then filtered.menu.spectator = data.menu.spectator end
                if data.menu.keybinds then filtered.menu.keybinds = data.menu.keybinds end
            end
        end
        return filtered
    end

    function cfg_system.create_config(name)
        if type(name) ~= 'string' then return end
        if name == nil or name == '' or name == ' ' or name == 'Default' then return end
        for i = #configs_db.menu_list, 1, -1 do
            if i > 1 and configs_db.menu_list[i] == name then return end
        end
        if #configs_db.cfg_list > 9 then return end
        local completed = {name, ''}
        table.insert(configs_db.cfg_list, completed)
        table.insert(configs_db.menu_list, name)
        cfg_system.save_db()
        client.log("Created config: " .. name)
    end

    function cfg_system.remove_config(id)
        if id < 1 or id > #configs_db.cfg_list then return end
        if id == 1 then return end
        local config_name = configs_db.cfg_list[id][1]
        local was_current = (current_loaded_id == id)
        table.remove(configs_db.cfg_list, id)
        table.remove(configs_db.menu_list, id)
        if was_current then
            current_loaded_id = nil
        elseif current_loaded_id ~= nil and current_loaded_id > id then
            current_loaded_id = current_loaded_id - 1
        end
        cfg_system.save_db()
        client.log("Deleted config: " .. config_name)
    end

    function cfg_system.save_config(id)
        if id < 1 or id > #configs_db.cfg_list then return end

        aa_side.save() 

        local full_raw = package:save()
        full_raw.sides_data = aa_side.deep_copy(builder_values) 

        local selected_categories = list_select:get()
        local data_to_save = cfg_system.filter_config_data(full_raw, selected_categories)
        
        configs_db.cfg_list[id][2] = base64.encode(json.stringify(data_to_save))
        cfg_system.save_db()
        
        local mode_text = #selected_categories > 0 and " (Partial)" or " (Full)"
        client.log("Saved config: " .. configs_db.cfg_list[id][1] .. mode_text)
    end

    function cfg_system.load_config(id)
        if id < 1 or id > #configs_db.cfg_list then return end
        
        local raw_from_db = configs_db.cfg_list[id][2]
        
        if not raw_from_db or raw_from_db == "" then
            return
        end

        local function apply_raw_string(str)
            local cleaned = str:gsub('^"(.*)"$', "%1"):gsub("\\/", "/")
            
            local status, decoded = pcall(base64.decode, cleaned)
            if not status or not decoded then
                return
            end

            local status_json, imported_obj = pcall(json.parse, decoded)
            local final_data = (imported_obj and imported_obj.data) and imported_obj.data or imported_obj

            if final_data then
                if final_data.sides_data then
                    builder_values = aa_side.deep_copy(final_data.sides_data)
                end

                local selected_categories = list_select:get()
                local current_state = package:save()
                local merged = cfg_system.merge_config_data(current_state, final_data, selected_categories)

                package:load(merged)
                aa_side.load()
                client.log("Loaded config: " .. configs_db.cfg_list[id][1])
            end
        end

        apply_raw_string(raw_from_db)
    end

    menu.information.button_create:set_callback(function()
        cfg_system.create_config(menu.information.name:get())
        menu.information.list:update(configs_db.menu_list)
    end)

    menu.information.button_load:set_callback(function()
        local display_idx = menu.information.list:get()
        if display_idx == -1 then return end
        cfg_system.load_config(display_idx + 1)
        current_loaded_id = display_idx + 1
    end)

    menu.information.button_save:set_callback(function()
        local display_idx = menu.information.list:get()
        if display_idx == -1 then return end
        button_check = true
    end)

    menu.information.button_save_check:set_callback(function()
        local display_idx = menu.information.list:get()
        if display_idx == -1 then return end
        cfg_system.save_config(display_idx + 1)
        button_check = false
    end)

    menu.information.button_delete:set_callback(function()
        local display_idx = menu.information.list:get()
        if display_idx == -1 then return end
        cfg_system.remove_config(display_idx + 1)
        if #configs_db.menu_list > 0 then menu.information.list:set(0) end
        menu.information.list:update(configs_db.menu_list)
    end)

    menu.information.button_export:set_callback(function()
        local display_idx = menu.information.list:get()
        if display_idx == -1 then return end

        aa_side.save()

        local raw_data = package:save()
        raw_data.sides_data = aa_side.deep_copy(builder_values)

        local selected_categories = list_select:get()
        local filtered_export = cfg_system.filter_config_data(raw_data, selected_categories)

        local export_obj = { data = filtered_export }
        local encoded_str = base64.encode(json.stringify(export_obj))
        
        clipboard.set("pacantech_" .. encoded_str)
        client.log("Config exported to clipboard!")
    end)

    function cfg_system.win11_import_fix(raw)
        if not raw then return nil end
        local clean = raw
        clean = clean:gsub("^\239\187\191", "")
        clean = clean:gsub("\226\128\139", "") 
        clean = clean:gsub("\226\128\140", "")
        clean = clean:gsub("\226\128\141", "")
        clean = clean:gsub("\239\187\191", "")
        clean = clean:gsub("[%c]", "")
        clean = clean:gsub("\194\160", " ")
        clean = clean:match("^%s*(.-)%s*$")
        return clean
    end

    menu.information.button_import:set_callback(function()

        local raw_clip = clipboard.get()

        local input = cfg_system.win11_import_fix(raw_clip)
        if not input or not input:find("pacantech_") then
            client.log("Error: Invalid clipboard data")
            return
        end
        local cleaned = input:gsub("pacantech_", "")
        local decoded = base64.decode(cleaned)
        local imported_obj = json.parse(decoded)

        if imported_obj and imported_obj.data then
            local imported_data = imported_obj.data

            if imported_data.sides_data then
                builder_values = aa_side.deep_copy(imported_data.sides_data)
            end

            local selected_categories = list_select:get()
            local current_state = package:save()
            local final_data = cfg_system.merge_config_data(current_state, imported_data, selected_categories)
            package:load(final_data)
            aa_side.load()
           
            client.log("Config imported successfully!")
        end
    end)   

    menu.information.list:update(configs_db.menu_list)

    function cfg_system.paint()
        if not ui.is_menu_open() then return end
        local display_idx = menu.information.list:get()
        if not display_idx or display_idx == -1 then return end
        local selected_id = display_idx + 1
        
        local is_default = (selected_id == 1)
        menu.information.button_delete:set_enabled(not is_default)
        menu.information.button_save:set_enabled(not is_default)
        menu.information.button_export:set_enabled(not is_default)
    end

    client.set_event_callback("paint_ui", cfg_system.paint)
end

local pizdec do   
    local function ui1()
        menu.information.button_save:set_visible(menu.main:get() == ' Information' and not button_check)
        menu.information.button_save_check:set_visible(menu.main:get() == ' Information' and button_check)
        if button_check and (not ui.is_menu_open() or menu.main:get() ~= ' Information') then
            button_check = false
        end
    end

    
    local function ui2()
        if ui.is_menu_open() then
        local color_func = coloring.color(
                    menu.information.color:get(),
                    menu.information.color_type:get(),
                    menu.information.color_gradient:get(),
                        {menu.information.default_color:get()},
                    {menu.information.color1:get()},
                    {menu.information.color2:get()},
                    {menu.information.color3:get()},
                    menu.information.color_speed:get()
                )            
            menu.lb_main:set(color_func(info.build) .. " " .. color_func("/") .. " " .. "\aFFFFFFFF" .. info.name)
            menu.information.user:set(color_func("Build: ") .. "\r" .. info.name)
            menu.information.build:set(color_func("Name:") .. "\r" .. info.build:gsub("Kittyhook", ""))
            menu.information.session:set(color_func('Session Stats'))
            menu.information.time:set(color_func('Time: ') .."\r" .. addon.get_elapsed_time())
            menu.information.kills:set(color_func('Kills: ') .. "\r" .. phrase_count.killst)
            menu.information.deaths:set(color_func('Deaths: ') .. "\r" .. phrase_count.deathst)
            menu.information.lb_color:set(color_func("Color Settings"))
            menu.information.lb_default_color:set(color_func("Default Color"))
            menu.information.lb_color1:set(color_func("First Color"))
            menu.information.lb_color2:set(color_func("Second Color"))
            menu.information.lb_color3:set(color_func("Third Color"))
            lines21:set(color_func("Configuration"))
            hitchance.label:set(color_func("Hitchance Settings"))
            scout.label:set(color_func("JumpStop Settings"))
            menu.ragebot.lb_auto_tp:set(color_func("Automatic Teleport"))
            menu.ragebot.lb_magic_key:set(color_func("Only Box"))
            menu.ragebot.lb_forceshot:set(color_func('Force Shot'))
            menu.ragebot.lb_auto_tp_wp:set(color_func("Weapons"))
            menu.ragebot.lb_auto_tp_opt:set(color_func("Options"))
            menu.ragebot.lb_main:set(color_func("Rage Settings"))
            menu.ragebot.lb_autostop:set(color_func('Autostop Settings'))
            menu.ragebot.lb_noscope:set(color_func("Noscope Settings"))
            menu.ragebot.lb_auto:set(color_func("Auto OS Settings"))
            menu.ragebot.lb_ai:set(color_func("AI Peek Settings"))
            menu.ragebot.main_label:set(color_func("Aimtools"))
            menu.ragebot.lb_inter:set(color_func('Interpolation'))
            menu.antiaim.label:set(color_func("Anti-aim") .. " \rcondition")
            menu.antiaim.lb_features:set(color_func("Features"))
            menu.antiaim.lb_safe:set(color_func("Safe head overrides"))
            menu.antiaim.lb_safe_head:set(color_func("Safe head options"))
            menu.antiaim.label_high:set(color_func("High Distance State"))
            menu.antiaim.lb_yaw_direction:set(color_func("Yaw directions"))
            menu.antiaim.lb_freestanding_disablers:set(color_func("Freestanding disablers"))
            menu.antiaim.lb_manuals_disablers:set(color_func("Manuals disablers"))
            menu.antiaim.fake_label:set(color_func("FakeLag options"))
            menu.antiaim.lb_flick_settings:set(color_func("Flick Settings"))
            menu.visuals.dpilb:set(color_func("Globalize DPI"))
            menu.visuals.lb_ui:set(color_func("Solus UI"))
            menu.visuals.ui_lb_default_color:set(color_func("Color"))
            menu.visuals.ui_lb_color1:set(color_func("Watermark Color"))
            menu.visuals.ui_lb_color2:set(color_func("Keybinds Color"))
            menu.visuals.ui_lb_color3:set(color_func("Spectators Color"))
            menu.visuals.ui_lb_color4:set(color_func("Velocity Color"))
            menu.visuals.ui_lb_color5:set(color_func("Defensive Color"))
            menu.visuals.lb_water:set(color_func("Watermark Settings"))
            menu.visuals.lb_hotkeys:set(color_func("Override Keybinds"))
            menu.visuals.lb_recent:set(color_func("Recent Color"))
            menu.visuals.lb_main:set(color_func("Visuals Settings"))
            menu.visuals.lb_selection:set(color_func("Selection"))
            menu.visuals.crosshair_label:set(color_func("Crosshair indicator"))
            menu.visuals.arrows_label:set(color_func("Arrows"))
            menu.visuals.damage_label:set(color_func("Damage indicator"))
            menu.visuals.cr_lb_default_color:set(color_func("Default Color"))
            menu.visuals.cr_lb_color1:set(color_func("First Color"))
            menu.visuals.cr_lb_color2:set(color_func("Second Color"))
            menu.visuals.cr_lb_color3:set(color_func("Third Color"))
            menu.visuals.custom_ind_gs_label:set(color_func("Feature indicators"))
            menu.visuals.lb_world_to_screen:set(color_func("Kibit marker"))
            menu.visuals.tracer_lb:set(color_func('Tracer world'))
            menu.misc.lb_misc:set(color_func("Misc Settings"))
            menu.misc.lb_aimbot:set(color_func("Aimbot Logs"))
            menu.misc.lb_animbr:set(color_func("Animation Settings"))
            menu.misc.lb_earth:set(color_func("Earthquake Settings"))
            menu.misc.lb_other:set(color_func("Other Settings"))
            menu.misc.lb_view:set(color_func("Viewmodel Settings"))
            menu.misc.lb_scope:set(color_func("Scope Settings"))
            menu.misc.lb_buybot:set(color_func("BuyBot Settings"))
            menu.misc.lb_game:set(color_func("Optimization game"))
            
            for i = 1, #antiaim_cond do
                builder[i].state:set(color_func(antiaim_cond[i]))
                builder[i].label2:set("\rYaw " .. color_func("Settings"))
                builder[i].label5:set("\rYaw " .. color_func("Features"))
                builder[i].label6:set("\rJitter " .. color_func("Mode"))
                builder[i].label9:set(color_func("Body ") .. "\r" .. "Yaw")
                builder[i].label11:set(color_func("Other Settings - ") .. "\r" .. antiaim_cond[i])
                builder[i].lb_brute:set(color_func("Antibrute Settings"))
                builder[i].ofs_lb_1:set(color_func("Offset ").. '\r' .. "Amount " .. color_func('Left'))
                builder[i].ofs_lb_2:set(color_func("Offset ").. '\r' .. "Amount " .. color_func('Right'))
                builder[i].offset_lb:set(color_func("Offset ").. '\r' .. "Amount")
            end
            for i = 1, #aimtools_cond do
                aimtools[i].hitscan_lb:set(color_func("Hitscan Settings"))
                aimtools[i].delay_lb:set(color_func("Delay Settings"))
                aimtools[i].multi_lb:set(color_func("Multipoint Settings"))
                aimtools[i].hitchance_lb:set(color_func("Hitchance Settings"))
                aimtools[i].body_prefer_lb:set(color_func("Prefer body aim on"))
                aimtools[i].lb_bd_misses:set(color_func("~ Misses"))
                aimtools[i].lb_bd_hp:set(color_func("~ HP"))
                aimtools[i].lb_sf_misses:set(color_func("~ Misses"))
                aimtools[i].lb_sf_hp:set(color_func("~ HP"))
                aimtools[i].safe_prefer_lb:set(color_func("Force safe point on"))
            end

            for i = 1, #hit_cond do
                hit[i].label_ovr_hit:set(color_func("Override hitchance"))
                hit[i].label_ovr_air_hit:set(color_func("Air hitchance"))
            end
        end
    end
    client.set_event_callback("paint_ui", ui2)
    client.set_event_callback('paint_ui', ui1)
end

