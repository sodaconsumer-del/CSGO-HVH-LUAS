local draggables = {
    data = {},
    current = nil,
	
	in_bounds = function(vec1, vec2)
        local mouse_pos = ui.get_mouse_position()
        return mouse_pos.x >= vec1.x and mouse_pos.x <= vec2.x and mouse_pos.y >= vec1.y and mouse_pos.y <= vec2.y
    end,
}

draggables.create = function(x, y, w, h, id, only_y)
	only_y = only_y or false
    if not draggables.data[id] then
        draggables.data[id] = {}
        draggables.data[id].position = vector(0, 0)
        draggables.data[id].state = false
    end

    if draggables.in_bounds(vector(x:get(), y:get()), vector(x:get() + w, y:get() + h)) and draggables.in_bounds(vector(0, 0), render.screen_size()) then
        if common.is_button_down(0x01) and draggables.data[id].state == false and (draggables.current == nil or draggables.current == id) then
            draggables.data[id].state = true
            draggables.current = id
            draggables.data[id].position = vector(x:get() - ui.get_mouse_position().x, y:get() - ui.get_mouse_position().y)
        end
    end

    if not draggables.in_bounds(vector(0, 0), render.screen_size()) then
        draggables.data[id].state = false
    end

    if not common.is_button_down(0x01) then
        draggables.data[id].state = false
        draggables.current = nil
    end

    if draggables.data[id].state == true and ui.get_alpha() == 1 then
		if only_y then
			y:set(ui.get_mouse_position().y + draggables.data[id].position.y)
		else
			x:set(ui.get_mouse_position().x + draggables.data[id].position.x)
			y:set(ui.get_mouse_position().y + draggables.data[id].position.y)
		end
    end
end

return draggables

--[[
@region: example
*
* #creating draggables elements
* local value_x = group:slider("Example X", 0, render.screen_size().x, 0); value_x:visibility(false)
* local value_y = group:slider("Example Y", 0, render.screen_size().y, 0); value_y:visibility(false)
*
* example_rendering = function()
* 	#setting vars
* 	local x, y = value_x, value_y
* 	local w, h = 150, 20
*
* 	#rendering rectangle
* 	render.rect(vector(x:get(), y:get()), vector(x:get() + w, y:get() + h), color(0, 150))
* 	
*   #making rectangle draggable
*	#arg id may be a integer value
* 	draggables.create(x, y, w, h, 1, false)
* 	#or a string value
* 	draggables.create(x, y, w, h, "Draggables Example", true) #arg only_y locks x-axis moving
*
*	#you too can use in_bounds function
*	local in_rect = draggables.in_bounds(vector(x:get(), y:get()), vector(x:get() + w, y:get() + h))
* end
*
* #function call
* events.render:set(example_rendering)
*
@region end.
]]