local defines={}
defines.screen_size = render.screen_size()

    local controls = {}
    local active_drag = nil
    local drag_offset_x, drag_offset_y = 0, 0
    
    local function register_control(group, ctrl, x, y, w, h, draw_fn)

        local slider_x = group:slider(ctrl .. "_x", 0, defines.screen_size.x)
        local slider_y = group:slider(ctrl .. "_y", 0, defines.screen_size.y)

        if slider_x:get() == 0 then
            slider_x:set(x)
        end
        if slider_y:get() == 0 then
            slider_y:set(y)
        end
        local pos_x = slider_x:get()
        local pos_y = slider_y:get()
        slider_x:visibility(false)
        slider_y:visibility(false)
        local control = {
            position = { x = pos_x, y = pos_y },
            size = { x = w, y = h },
            draw_fn = draw_fn,
            slider_x = slider_x,
            slider_y = slider_y,
        }
        
        controls[#controls + 1] = control
    end
    
    
    events.mouse_input:set(function(e)
        local mx, my = ui.get_mouse_position():unpack()
        local mdown = common.is_button_down(0x01)
    
        if mdown and not active_drag then
            for i = #controls, 1, -1 do
                local c = controls[i]
                if c and
                   mx >= c.position.x and mx <= c.position.x + c.size.x and
                   my >= c.position.y and my <= c.position.y + c.size.y then
                    active_drag = c
                    drag_offset_x = mx - c.position.x
                    drag_offset_y = my - c.position.y
                    break
                end
            end
        elseif not mdown and active_drag then
            active_drag = nil
        end
    
        if active_drag and mdown then
            active_drag.position.x = mx - drag_offset_x
            active_drag.position.y = my - drag_offset_y
    
            active_drag.slider_x:set(active_drag.position.x)
            active_drag.slider_y:set(active_drag.position.y)
        end
    end)
    
    events.render:set(function()
        for _, c in ipairs(controls) do
            if c and type(c.draw_fn) == "function" then
                c.draw_fn(c)
            end
        end
    end)

return {register_control = register_control}