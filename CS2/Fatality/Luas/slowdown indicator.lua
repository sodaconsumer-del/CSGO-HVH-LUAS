--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx
slot_0_1_0 = slot_0_0_0:find("lua>elements a") or slot_0_0_0
slot_0_2_0 = slot_0_0_0:find("slow_pos_x")

if not slot_0_2_0 then
        slot_0_2_0 = gui.slider(gui.control_id("slow_pos_x"), 0, 2000, {
                "%.0f"
        }, 1)

        slot_0_2_0:get_value():set(80)

        if slot_0_1_0 then
                slot_0_1_0:add(gui.make_control("X", slot_0_2_0))
                slot_0_1_0:reset()
        end
end

slot_0_3_0 = slot_0_0_0:find("slow_pos_y")

if not slot_0_3_0 then
        slot_0_3_0 = gui.slider(gui.control_id("slow_pos_y"), 0, 2000, {
                "%.0f"
        }, 1)

        slot_0_3_0:get_value():set(380)

        if slot_0_1_0 then
                slot_0_1_0:add(gui.make_control("Y", slot_0_3_0))
                slot_0_1_0:reset()
        end
end

slot_0_4_0 = slot_0_0_0:find("slow_color")

if not slot_0_4_0 then
        slot_0_4_0 = gui.color_picker(gui.control_id("slow_color"), true)

        slot_0_4_0:get_value():set(draw.color(255, 60, 60, 255))

        if slot_0_1_0 then
                slot_0_1_0:add(gui.make_control("Slow Color", slot_0_4_0))
                slot_0_1_0:reset()
        end
end

slot_0_5_0 = draw.fonts and draw.fonts.gui_bold or draw.font_gdi("Calibri Bold", 30) or draw.font_gdi("Tahoma", 30)

function slot_0_6_0()
        local var_1_0 = entities.get_local_pawn()

        if var_1_0 == nil or not var_1_0:is_alive() then
                return
        end

        local var_1_1 = var_1_0.m_flVelocityModifier or var_1_0.m_flVelocityModifier

        if var_1_1 == nil then
                return
        end

        local var_1_2 = var_1_1:get() or 1

        if not (gui and gui.is_open and pcall(gui.is_open) and gui.is_open()) and var_1_2 >= 0.999 then
                return
        end

        local var_1_3 = draw.vec2(slot_0_2_0:get_value():get(), slot_0_3_0:get_value():get())
        local var_1_4 = string.format("SLOW %.0f%%", var_1_2 * 100)
        local var_1_5 = slot_0_4_0:get_value():get()
        local var_1_6 = draw.surface

        if slot_0_5_0 then
                var_1_6.font = slot_0_5_0
        end

        var_1_6:add_text(var_1_3, var_1_4, var_1_5)
end

events.present_queue:add(slot_0_6_0)
