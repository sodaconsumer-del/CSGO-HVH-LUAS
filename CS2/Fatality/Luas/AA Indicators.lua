--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override forward")
slot_0_1_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override back")
slot_0_2_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override left")
slot_0_3_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override right")
slot_0_4_0 = gui.slider(gui.control_id("scale"), 1, 500, {
        "%.0f%%"
})
slot_0_5_0 = gui.make_control("Indicator Scale", slot_0_4_0)
slot_0_6_0 = gui.checkbox(gui.control_id("enableIndicatorCb"))
slot_0_7_0 = gui.make_control("Enable AA Inicators", slot_0_6_0)
slot_0_8_0 = gui.color_picker(gui.control_id("indicatorColor"))

slot_0_7_0:add(slot_0_8_0)

slot_0_9_0 = gui.ctx:find("lua>elements b")

slot_0_9_0:add(slot_0_7_0)
slot_0_9_0:add(slot_0_5_0)
slot_0_9_0:reset()
slot_0_8_0:get_value():set(draw.color(243, 199, 205, 255))
slot_0_4_0:get_value():set(100)

slot_0_10_0 = draw.color("#f3c7cd")
slot_0_11_0 = 1

slot_0_8_0:add_callback(function()
        slot_0_10_0 = slot_0_8_0:get_value():get()
end)
slot_0_4_0:add_callback(function()
        slot_0_11_0 = slot_0_4_0:get_value():get() / 100

        print(tostring(slot_0_11_0))
end)

function slot_0_12_0()
        if not slot_0_6_0:get_value():get() then
                return
        end

        local var_3_0 = draw.surface

        var_3_0.font = draw.fonts.gui_main

        local var_3_1, var_3_2 = game.engine:get_screen_size()
        local var_3_3 = draw.vec2(var_3_1 / 2, var_3_2 / 2)

        if slot_0_0_0:get_value():get() then
                var_3_0:add_triangle_filled(draw.vec2(var_3_3.x - 5 * slot_0_11_0, var_3_3.y - 20 * slot_0_11_0), draw.vec2(var_3_3.x, var_3_3.y - 30 * slot_0_11_0), draw.vec2(var_3_3.x + 5 * slot_0_11_0, var_3_3.y - 20 * slot_0_11_0), slot_0_10_0)
        end

        if slot_0_1_0:get_value():get() then
                var_3_0:add_triangle_filled(draw.vec2(var_3_3.x - 5 * slot_0_11_0, var_3_3.y + 20 * slot_0_11_0), draw.vec2(var_3_3.x, var_3_3.y + 30 * slot_0_11_0), draw.vec2(var_3_3.x + 5 * slot_0_11_0, var_3_3.y + 20 * slot_0_11_0), slot_0_10_0)
        end

        if slot_0_2_0:get_value():get() then
                var_3_0:add_triangle_filled(draw.vec2(var_3_3.x - 20 * slot_0_11_0, var_3_3.y + 5 * slot_0_11_0), draw.vec2(var_3_3.x - 30 * slot_0_11_0, var_3_3.y), draw.vec2(var_3_3.x - 20 * slot_0_11_0, var_3_3.y - 5 * slot_0_11_0), slot_0_10_0)
        end

        if slot_0_3_0:get_value():get() then
                var_3_0:add_triangle_filled(draw.vec2(var_3_3.x + 20 * slot_0_11_0, var_3_3.y + 5 * slot_0_11_0), draw.vec2(var_3_3.x + 30 * slot_0_11_0, var_3_3.y), draw.vec2(var_3_3.x + 20 * slot_0_11_0, var_3_3.y - 5 * slot_0_11_0), slot_0_10_0)
        end
end

events.present_queue:add(slot_0_12_0)
