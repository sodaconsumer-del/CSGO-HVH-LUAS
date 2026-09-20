--- @region: menu_visible
local is_menu_visible = false
local check_menu_events = function()
    is_menu_visible = ui.get_alpha() > .49
end

events.render:set(check_menu_events)
--- @endregion

--- @region: init
local system = {}
local screen_size = render.screen_size()
local mouse

system.list = {}
system.windows = {}
system.elements = {}

system.__index = system
--- @endregion

--- @region: restore_positions
function system.restore_positions()
    for _, win in pairs(system.windows) do
        win.position = vector(
            (win.ui_callbacks.x:get() or 0) * screen_size.x / 1000,
            (win.ui_callbacks.y:get() or 0) * screen_size.y / 1000
        )
    end
end
--- @endregion

local group = ui.create('sliders')

--- @region: create
function system.create_window(start, flags, size, global_name, render_callback, limits, outline)
    system.elements[global_name] = {
        x = group:slider('x_' .. global_name, 0, screen_size.x, 0),
        y = group:slider('y_' .. global_name, 0, screen_size.y, 0),
    }

    if system.elements[global_name].x:get() == 0 and system.elements[global_name].y:get() == 0 then
        local offs = (flags == 'c') and vector(size.x / 2, size.y / 2) or vector(0, 0)
        system.elements[global_name].x:set((start.x - offs.x) / screen_size.x * 1000)
        system.elements[global_name].y:set((start.y - offs.y) / screen_size.y * 1000)
    end

    system.elements[global_name].x:visibility(false)
    system.elements[global_name].y:visibility(false)

    local data = {
        size = size,
        is_dragging = false,
        drag_position = vector(),
        is_mouse_held_before_hover = false,
        global_name = global_name,
        render_callback = render_callback,
        ui_callbacks = {
            x = system.elements[global_name].x,
            y = system.elements[global_name].y,
        },
        limits = limits and {
            x = {min = limits[1], max = limits[2]},
            y = {min = limits[3], max = limits[4]}
        } or nil,
        outline = outline == nil and false or outline
    }

    local x_val = (data.ui_callbacks.x:get() or 0) / 1000 * screen_size.x
    local y_val = (data.ui_callbacks.y:get() or 0) / 1000 * screen_size.y

    data.position = vector(
        x_val - data.size.x / 2,
        y_val - data.size.y / 2
    )

    table.insert(system.windows, data)
    return setmetatable(data, system)
end
--- @endregion

--- @region: limit_positions
function system:limit_positions(bounds)
    local min_x = bounds and bounds.x.min or 0
    local max_x = bounds and bounds.x.max - self.size.x or (screen_size.x - self.size.x)
    local min_y = bounds and bounds.y.min or 0
    local max_y = bounds and bounds.y.max - self.size.y or (screen_size.y - self.size.y)

    self.position.x = math.max(min_x, math.min(self.position.x, max_x))
    self.position.y = math.max(min_y, math.min(self.position.y, max_y))

    if ui.get_alpha() > 0 and bounds then
        local w = max_x + self.size.x
        local h = max_y + self.size.y
        render.rect(vector(min_x, min_y), vector(w, h), color(255, 50))
    end
end
--- @endregion

--- @region: is_hovering
function system:is_hovering(mouse_pos)
    return mouse_pos.x >= self.position.x and mouse_pos.x <= self.position.x + self.size.x and
           mouse_pos.y >= self.position.y and mouse_pos.y <= self.position.y + self.size.y
end
--- @endregion

--- @region: update
function system:update(...)
    local outline_alpha = is_menu_visible and 255 or 0

    if self.outline then
        render.rect_outline(
            vector(self.position.x, self.position.y),
            vector(self.position.x + self.size.x, self.position.y + self.size.y),
            color(255, outline_alpha), 1, 0
        )
    end

    if is_menu_visible then
        local hovering = self:is_hovering(mouse)
        local is_key_pressed_m1 = common.is_button_down(0x1)
        local is_key_pressed_m2 = common.is_button_down(0x2)

        if hovering then
            local fix_height = (self.position.y - 10) < 0 and (self.position.y  + self.size.y + 10) or self.position.y - 10
            if is_key_pressed_m2 then
                local updated_position = (screen_size.x - self.size.x) / 2

                if self.limits then
                    updated_position = math.max(self.limits.x.min, math.min(updated_position, self.limits.x.max - self.size.x))
                end

                self.position.x = updated_position
                self.ui_callbacks.x:set(math.floor(self.position.x / screen_size.x * 1000))
            end
            render.text(1, vector(self.position.x + self.size.x/2, fix_height), color(255, 255, 255, 255), 'c', 'press m2 to center')
        end

        local another_drag = false
        for _, win in pairs(system.windows) do
            if win ~= self and win.is_dragging then
                another_drag = true
                break
            end
        end

        local allow_drag = not another_drag or self.is_dragging

        if allow_drag then
            if is_key_pressed_m1 and not self.is_dragging and not hovering then
                self.is_mouse_held_before_hover = true
            end

            if (hovering or self.is_dragging) and is_key_pressed_m1 and not self.is_mouse_held_before_hover then
                if not self.is_dragging then
                    self.is_dragging = true
                    self.drag_position = mouse - self.position
                else
                    local next_pos = mouse - self.drag_position
                    self.position = next_pos
                    self:limit_positions(self.limits)
                    self.ui_callbacks.x:set(math.floor(self.position.x / screen_size.x * 1000))
                    self.ui_callbacks.y:set(math.floor(self.position.y / screen_size.y * 1000))
                end
            elseif not is_key_pressed_m1 then
                self.is_dragging = false
                self.drag_position = vector()
                self.is_mouse_held_before_hover = false
            end
        end
    end

    self.render_callback(self, ...)
end
--- @endregion

--- @region: block_input
local function block_attack_inputs(cmd)
    cmd.in_attack = false
    cmd.in_attack2 = false
end
--- @endregion

--- @region: mouse_input
local function handle_mouse_input()
    if is_menu_visible then
        mouse = ui.get_mouse_position()
        local is_key_pressed_m1 = common.is_button_down(0x1)
        local hovered_any = false

        for _, win in pairs(system.windows) do
            if win.is_dragging or win:is_hovering(mouse) then
                hovered_any = true
                break
            end
        end

        if hovered_any then
            events.createmove:set(block_attack_inputs)
        else
            events.createmove:unset(block_attack_inputs)
        end


        return not hovered_any
    else
        events.createmove:unset(block_attack_inputs)
    end
end

events.render:set(handle_mouse_input)
--- @endregion

return system