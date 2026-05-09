--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("autowall_cb"))
slot_0_1_0 = gui.make_control("Autowall Indicator", slot_0_0_0)

gui.ctx:find("lua>elements a"):add(slot_0_1_0)

function slot_0_3_0()
        if slot_0_0_0:get_value():get() then
                local var_1_0 = draw.surface

                var_1_0.font = draw.fonts.gui_bold

                var_1_0:add_text(draw.vec2(950, 555), "AW", draw.color.white())
        end
end

events.present_queue:add(slot_0_3_0)
