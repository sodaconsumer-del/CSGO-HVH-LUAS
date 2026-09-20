local table_find = function(arr, to_find) for key, val in pairs(arr) do if val == to_find then return key end end return nil end
local is_empty = function(arr) if next(arr) == nil then return true end return false end
local is_inside = function(x, y, w, h) local mx, my = ui.get_mouse_position().x, ui.get_mouse_position().y return mx >= x and mx <= x + w and my >= y and my <= y + h end

local g = {
    gui_ctx = nil,
    click_pos = nil,
}

local M = {}

local CWindow = {
    name = nil, pos = nil, size = nil, opened = nil, moving = nil, resizing = nil, constraints = nil, ballow_move = nil, ballow_resize = nil,

    on_draw = function(self)  
        render.rect(self.pos, self.pos + self.size, color(23, 23, 23, 255), 0)
        
        --render.anti_aliasing(false) -- doesnt disable aa on line *sad face* plz fix nl staff god bless
        local border_color = self.resizing and color(163, 212, 31) or color(80, 80, 80)
        local wnd_name_size = render.measure_text(1, '', self.name)
        render.line(self.pos, self.pos + vector(0, self.size.y - 1), color(12, 12, 12))
		render.line(self.pos + vector(0, self.size.y - 1), self.pos + self.size - vector(1, 1), color(15, 15, 15))
		render.line(self.pos + self.size - vector(1, 1), self.pos + vector(self.size.x - 1, 0), color(15, 15, 15))
		render.line(self.pos, self.pos + vector(10, 0), color(12, 12, 12))
		render.line(self.pos + vector(16 + wnd_name_size.x, 0), self.pos + vector(self.size.x - 1, 0),  color(15, 15, 15))

		render.line(self.pos + vector(1, 1), self.pos + vector(1, self.size.y - 2),  border_color)
		render.line(self.pos + vector(1, self.size.y - 2), self.pos + self.size - vector(2, 2), border_color)
		render.line(self.pos + self.size - vector(2, 2), self.pos + vector(self.size.x - 2, 1), border_color)
		render.line(self.pos + vector(1, 1), self.pos + vector(10, 1), border_color);
		render.line(self.pos + vector(16 + wnd_name_size.x, 1), self.pos + vector(self.size.x - 2, 1), border_color)

        render.poly(border_color, self.pos + self.size - vector(2, 2), self.pos + self.size - vector(2, 8),self.pos + self.size - vector(8, 2))
        render.text(1, vector(self.pos.x + 16, self.pos.y - wnd_name_size.y / 2), color(255, 255, 255, 255), nil, self.name)

        local str_pos = string.format('X: %2.f, Y: %2.f', self.pos.x, self.pos.y)
        local str_size = string.format('W: %2.f, H: %2.f', self.size.x, self.size.y)
        local text_pos_y = 3
        render.text(1, vector(self.pos.x + 7, self.pos.y + text_pos_y), color(255, 255, 255, 255), nil, str_pos) 
        text_pos_y = text_pos_y + render.measure_text(1, '', str_pos).y
        render.text(1, vector(self.pos.x + 7, self.pos.y + text_pos_y), color(255, 255, 255, 255), nil, str_size) 
    end,
    get_name = function(self) return self.name end,
    get_pos = function(self) return self.pos end,
    get_size = function(self) return self.size end,
    is_opened = function(self) return self.opened end,

    set_pos = function(self, new_pos) self.pos = new_pos end,
    set_size = function(self, new_size) self.size = new_size > 10 and new_size or vector(10, 10) end,
    set_opened = function(self, state) self.opened = state end,
    set_contraints = function(self, x, y, w, h)
        self.constraints.x = x and math.clamp(x, 0, render.screen_size().x) or 10
        self.constraints.y = y and math.clamp(y, 0, render.screen_size().y) or 10
        self.constraints.w = w and math.clamp(w, 0, render.screen_size().x) or render.screen_size().x
        self.constraints.h = h and math.clamp(y, 0, render.screen_size().y) or render.screen_size().y
    end,

    allow_moving = function(self, state) self.ballow_move = state end,
    allow_resize = function(self, state) self.ballow_resize = state end,
}

function CWindow:new(name, pos, size)
    local instance = {}
    setmetatable(instance, {__index = self})
    instance.name = name or nil
    instance.pos = pos or vector(0, 0)
    instance.size = size or vector(100, 20)
    instance.opened = true
    instance.moving = false
    instance.resizing = false
    instance.ballow_move = true 
    instance.ballow_resize = true
    instance.constraints = {x = 10, y = 10, w = 0, h = 0}
    return instance
end

local function CreateCTX()
    g.gui_ctx = {}
    g.gui_ctx.windows = {}
    g.gui_ctx.active_window = nil
end

local function Focus_Window(window)
    table.remove(g.gui_ctx.windows, table_find(g.gui_ctx.windows, window))
    table.insert(g.gui_ctx.windows, 1, window)
end

local function Move_Window(window)

    local hovered = is_inside(window.pos.x, window.pos.y, window.size.x - 10, window.size.y - 10)
    local mouse_pos = ui.get_mouse_position()
    local screen_size = render.screen_size()

    if not window.resizing and g.gui_ctx.active_window == nil and hovered and common.is_button_down(0x01) then
        Focus_Window(window)
        window.moving = true
        g.gui_ctx.active_window = window.name
        g.click_pos = vector(mouse_pos.x - window.pos.x, mouse_pos.y - window.pos.y)
    elseif g.gui_ctx.active_window == window.name and common.is_button_down(0x01) and window.moving and window.ballow_move then
        window.pos.x = mouse_pos.x - g.click_pos.x
        window.pos.y = mouse_pos.y - g.click_pos.y

        if window.pos.x < -window.size.x / 2 then
            window.pos.x = -window.size.x / 2
        end
        if window.pos.y < -window.size.y / 2 then
            window.pos.y = -window.size.y / 2
        end
        if window.pos.x + window.size.x / 2 > screen_size.x then
            window.pos.x = screen_size.x - window.size.x / 2
        end
        if window.pos.y + window.size.y / 2 > screen_size.y then
            window.pos.y = screen_size.x - window.size.y / 2
        end

    elseif g.gui_ctx.active_window == window.name and not common.is_button_down(0x01) and window.moving then
        window.moving = false
        g.gui_ctx.active_window = nil
        g.click_pos = nil
    end

end

local function Resize_Window(window)
    if not window.ballow_resize then
        return
    end

    local hovered = is_inside(window.pos.x + window.size.x - 10, window.pos.y + window.size.y - 10, 10, 10)
    local mouse_pos = ui.get_mouse_position()

    if not window.moving and g.gui_ctx.active_window == nil and hovered and common.is_button_down(0x01) then
        window.resizing = true
        g.gui_ctx.active_window = window.name
    elseif g.gui_ctx.active_window == window.name and common.is_button_down(0x01) and window.resizing then
        window.size.x = mouse_pos.x - window.pos.x
        window.size.y = mouse_pos.y - window.pos.y
        
        if window.constraints.x > 0 and mouse_pos.x < window.pos.x + window.constraints.x then
            window.size.x = window.constraints.x
        end
        if window.constraints.y > 0 and mouse_pos.y < window.pos.y + window.constraints.y then
            window.size.y = window.constraints.y
        end
        if window.constraints.w > 0 and mouse_pos.x > window.pos.x + window.constraints.w then
            window.size.x = window.constraints.w
        end
        if window.constraints.h > 0 and mouse_pos.y > window.pos.y + window.constraints.h then
            window.size.y = window.constraints.h
        end
    elseif g.gui_ctx.active_window == window.name and not common.is_button_down(0x01) and window.resizing then
        window.resizing = false
        g.gui_ctx.active_window = nil
    end
end

M.add_window = function(name, default_pos, default_size)
    for key, window in pairs(g.gui_ctx.windows) do
        if window.name == name then
            return window
        end
    end

    table.insert(g.gui_ctx.windows, CWindow:new(name, default_pos, default_size))
    return g.gui_ctx.windows[#g.gui_ctx.windows] 
end

M.draw_windows = function()
    if is_empty(g.gui_ctx.windows) then
        return
    end

    for key, window in pairs(g.gui_ctx.windows) do
        if window.opened then
            Move_Window(window)
            Resize_Window(window)
        end
    end

    for i = #g.gui_ctx.windows, 1, -1 do
        if g.gui_ctx.windows[i].opened then
            g.gui_ctx.windows[i]:on_draw()
        end
        
    end
end

M.find_window_by_name = function(name)
    for key, window in pairs(g.gui_ctx.windows) do
        if window.name == name then
            return window
        end
    end

end

M.get_active_window = function()
    if g.gui_ctx.active_window ~= nil then
        return g.gui_ctx.active_window
    else
        return nil
    end
end

CreateCTX()

return M

--EXAMPLE:
--[[
local wnd_sys = require 'window_system'

local p_defwnd = wnd_sys.add_window('default', vector(300, 50), vector(100, 50))
local p_mywnd = wnd_sys.add_window('my_wnd', vector(50, 50), vector(200, 100))

p_defwnd:set_contraints(100, 50)

p_mywnd:allow_moving(false)
p_mywnd:allow_resize(false)

p_mywnd.on_draw = function(self) -- override default draw handler
    render.rect(self.pos, self.pos + self.size, color(255, 255, 255))
end

local can_reopen = true
events.render:set(function()
    if common.is_button_down(0x09) and can_reopen then
        p_defwnd:set_opened(not p_defwnd:is_opened())
        p_mywnd:set_opened(not p_mywnd:is_opened())
        can_reopen = false
        utils.execute_after(0.2, function() can_reopen = true end)
    end
    print(p_defwnd:get_pos())
    print(p_defwnd:get_size())
    print(p_defwnd:is_opened())

    print(wnd_sys.get_active_window())

    wnd_sys.draw_windows()
end)
--]]