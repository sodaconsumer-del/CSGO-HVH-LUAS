-- credits: MitJ 

--- @region: is_menu_visible
local is_menu_visible = false
local check_menu_events = function()
    is_menu_visible = ui.get_alpha() == 1
end

events.render:set(check_menu_events)
--- @endregion

--- @region: create library structure
local system = {}
local screen_size = render.screen_size()

system.list = {}
system.windows = {}

--- @param position: {x_menu_element, y_menu_element}
--- @param size: vector(x, y)
--- @param global_name: string
--- @param ins_function: function(self) -> render here

system.__index = system
system.register = function(position, size, global_name, ins_function)
    local data = {
        size = size,
        position = vector(position[1], position[2]),

        is_dragging = false,
        drag_position = vector(),

        global_name = global_name,
        ins_function = ins_function,

        ui_callbacks = {x = position[1], y = position[2]}
    }

    table.insert(system.windows, data)
    return setmetatable(data, system)
end

function system:limit_positions()
    if self.position.x <= 0 then
        self.position.x = 0
    end

    if self.position.x + self.size.x >= screen_size.x - 1 then
        self.position.x = screen_size.x - self.size.x - 1
    end

    if self.position.y <= 0 then
        self.position.y = 0
    end

    if self.position.y + self.size.y >= screen_size.y - 1 then
        self.position.y = screen_size.y - self.size.y - 1
    end
end

function system:is_in_area(mouse_position)
    return mouse_position.x >= self.position.x and mouse_position.x <= self.position.x + self.size.x and mouse_position.y >= self.position.y and mouse_position.y <= self.position.y + self.size.y
end

--- @note: call this at render functions
function system:update(...)
    if is_menu_visible then
        local mouse_position = ui.get_mouse_position()
        local is_in_area = self:is_in_area(mouse_position)

        local list = system.list
        local is_key_pressed = common.is_button_down(0x1)

        if (is_in_area or self.is_dragging) and is_key_pressed and (list.target == "" or list.target == self.global_name) then
            list.target = self.global_name
            if not self.is_dragging then
                self.is_dragging = true
                self.drag_position = mouse_position - self.position
            else
                self.position = mouse_position - self.drag_position
                self:limit_positions()

                self.ui_callbacks.x = math.floor(self.position.x)
                self.ui_callbacks.y = math.floor(self.position.y)
            end
        elseif not is_key_pressed then
            list.target = ""
            self.is_dragging = false
            self.drag_position = vector()
        end
    end
    self.ins_function(self, ...)
end

--- @note: call this while loading user configs
system.on_config_load = function()
    for _, point in pairs(system.windows) do
        point.position = vector(point.ui_callbacks.x, point.ui_callbacks.y)
    end
end
--- @endregion

--- @region: example
--[[
local x = 0
local y = 0

local new_drag_object = system.register({x, y}, vector(100, 120), "Test", function(self)
    render.rect_outline(vector(self.position.x, self.position.y), vector(self.position.x + self.size.x, self.position.y + self.size.y), color())
end)

events.render:set(function()
    new_drag_object:update()
end)
]]--
--- @endregion

return system