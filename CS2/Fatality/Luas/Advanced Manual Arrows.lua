--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements b")

if not slot_0_0_0 then
        return
end

slot_0_0_0:reset()

slot_0_1_0 = gui.color_picker(gui.control_id("arrow_default"))
slot_0_2_0 = gui.color_picker(gui.control_id("arrow_active"))
slot_0_3_0 = gui.checkbox(gui.control_id("arrow_rgb_activation"))
slot_0_4_0 = gui.slider(gui.control_id("arrow_rgb_speed"), 1, 5, {
        "%.1f"
}, 0.5, 2.5)
slot_0_5_0 = gui.slider(gui.control_id("arrow_offset"), -55, 55, {
        "%.0f"
}, 1, 10)
slot_0_6_0 = gui.slider(gui.control_id("anim_speed_color"), 0, 0.5, {
        "%.1f"
}, 0.1, 0.1)
slot_0_7_0 = gui.checkbox(gui.control_id("arrow_check_scope"))
slot_0_8_0 = gui.make_control("Цвет активации", slot_0_2_0)
slot_0_9_0 = gui.make_control("Скорость RGB", slot_0_4_0)

slot_0_0_0:add(gui.make_control("Цвет по умолчанию", slot_0_1_0))
slot_0_0_0:add(slot_0_8_0)
slot_0_0_0:add(slot_0_9_0)
slot_0_0_0:add(gui.make_control("RGB активация", slot_0_3_0))
slot_0_0_0:add(gui.make_control("Смещение по X", slot_0_5_0))
slot_0_0_0:add(gui.make_control("Анимация цвета", slot_0_6_0))
slot_0_0_0:add(gui.make_control("Отслеживать прицел", slot_0_7_0))
slot_0_9_0:set_visible(false)

slot_0_10_0 = gui.slider(gui.control_id("anim_speed_offset"), 0, 0.5, {
        "%.1f"
}, 0.1, 0.1)
slot_0_11_0 = gui.slider(gui.control_id("extra_offset_y"), 0, 10, {
        "%.0f"
}, 1, 3)
slot_0_12_0 = gui.make_control("Анимация смещения", slot_0_10_0)
slot_0_13_0 = gui.make_control("Доп. смещение по Y", slot_0_11_0)

slot_0_0_0:add(slot_0_12_0)
slot_0_0_0:add(slot_0_13_0)
slot_0_12_0:set_visible(false)
slot_0_13_0:set_visible(false)

slot_0_14_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override left")
slot_0_15_0 = gui.ctx:find("rage>anti-aim>angles>manual override>override right")
slot_0_16_0 = gui.ctx:find("visuals>misc>local>fov override>settings>fov")
slot_0_17_0 = gui.ctx:find("visuals>misc>local>fov override>settings>remove zoom")
slot_0_18_0 = 100
slot_0_19_0 = false

events.override_view:add(function(arg_1_0)
        if not arg_1_0 or not arg_1_0.fov then
                return
        end

        slot_0_18_0 = slot_0_16_0 and slot_0_16_0:get_value() and slot_0_16_0:get_value():get() or 100
        slot_0_19_0 = arg_1_0.fov < slot_0_18_0 - 0.1
end)

slot_0_20_0 = draw.color.white()
slot_0_21_0 = draw.color(195, 0, 243, 255)
slot_0_22_0 = draw.color.black_transparent()
slot_0_23_0 = draw.color.black()
slot_0_24_0 = draw.fonts.gui_title
slot_0_25_0 = {
        {
                -1,
                -1
        },
        {
                0,
                -1
        },
        {
                1,
                -1
        },
        {
                -1,
                0
        },
        {
                1,
                0
        },
        {
                -1,
                1
        },
        {
                0,
                1
        },
        {
                1,
                1
        }
}
slot_0_26_0 = {
        end_time = nil,
        active = false
}
slot_0_27_0 = {
        end_time = nil,
        active = false
}
slot_0_28_0 = 0
slot_0_29_0 = 0
slot_0_30_0 = 0
slot_0_31_0 = 0

function slot_0_32_0(arg_2_0)
        if not arg_2_0 then
                return nil
        end

        local var_2_0 = arg_2_0:get_value()

        return var_2_0 and var_2_0:get()
end

slot_0_33_0 = nil
slot_0_34_0 = false
slot_0_35_0 = false
slot_0_36_0 = 0
slot_0_37_0 = 0.5
slot_0_38_0 = -1
slot_0_39_0 = 1

function slot_0_40_0(arg_3_0)
        local var_3_0 = math.floor(127.5 * (1 + math.sin(arg_3_0)))
        local var_3_1 = math.floor(127.5 * (1 + math.sin(arg_3_0 + 2.0943951023932)))
        local var_3_2 = math.floor(127.5 * (1 + math.sin(arg_3_0 + 4.1887902047864)))

        return draw.color(var_3_0, var_3_1, var_3_2, 255)
end

events.present_queue:add(function()
        slot_4_0_0 = slot_0_3_0:get_value() and slot_0_3_0:get_value():get() == true

        slot_0_8_0:set_visible(not slot_4_0_0)
        slot_0_9_0:set_visible(slot_4_0_0)

        slot_4_1_0 = slot_0_7_0:get_value() and slot_0_7_0:get_value():get() == true

        if slot_4_1_0 and not slot_0_34_0 then
                slot_0_34_0 = true

                if slot_0_17_0 then
                        slot_4_2_3 = slot_0_17_0:get_value()

                        if slot_4_2_3 then
                                slot_0_33_0 = slot_4_2_3:get()

                                if slot_0_33_0 == 100 and game.engine:in_game() then
                                        slot_0_35_0 = true
                                end
                        end
                end
        elseif not slot_4_1_0 then
                slot_0_34_0 = false
                slot_0_35_0 = false
        end

        slot_0_12_0:set_visible(slot_4_1_0 and not slot_0_35_0)
        slot_0_13_0:set_visible(slot_4_1_0 and not slot_0_35_0)

        if not game.engine:in_game() then
                slot_0_35_0 = false
                slot_0_33_0 = nil
                slot_0_36_0 = 0

                return
        end

        if slot_4_1_0 and not slot_0_35_0 and slot_0_17_0 then
                slot_4_2_2 = slot_0_17_0:get_value()

                if slot_4_2_2 then
                        slot_4_3_2 = slot_4_2_2:get()

                        if slot_4_3_2 == 100 and not slot_0_35_0 then
                                print("remove zoom is 100 in-game with scope checked. Showing messages.")

                                slot_0_35_0 = true
                        elseif slot_4_3_2 ~= 100 and slot_0_35_0 then
                                print("remove zoom changed to != 100. Hiding messages.")

                                slot_0_35_0 = false
                        end
                end
        end

        if slot_0_35_0 then
                slot_4_2_1 = draw.surface
                slot_4_3_1, slot_4_4_1 = game.engine:get_screen_size()
                slot_4_5_1 = math.floor(slot_4_3_1 / 2)
                slot_4_6_1 = math.floor(slot_4_4_1 / 2)
                slot_4_2_1.font = draw.fonts.gui_title
                slot_4_7_1 = slot_4_5_1 - 310
                slot_4_8_1 = slot_4_6_1 - 90
                slot_4_9_1 = draw.color.black()
                slot_4_10_1 = draw.color(255, 0, 0, 255)
                slot_4_11_1 = "Change the remove_zoom value from 100 to 99 with enable fov_override"
                slot_4_12_1 = "Turn on this option and turn it back after changes"
                slot_4_13_1 = slot_4_6_1 - 50
                slot_4_14_1 = 10
                slot_4_15_2 = string.len(slot_4_12_1)
                slot_4_17_1 = slot_4_5_1 - math.floor(slot_4_15_2 * slot_4_14_1 / 2) + 30

                for iter_4_0 = 1, 8 do
                        slot_4_22_1 = slot_0_25_0[iter_4_0][1]
                        slot_4_23_2 = slot_0_25_0[iter_4_0][2]

                        slot_4_2_1:add_text(draw.vec2(slot_4_7_1 + slot_4_22_1, slot_4_8_1 + slot_4_23_2), slot_4_11_1, slot_4_9_1)
                end

                slot_4_2_1:add_text(draw.vec2(slot_4_7_1, slot_4_8_1), slot_4_11_1, slot_4_10_1)

                for iter_4_1 = 1, 8 do
                        slot_4_22_0 = slot_0_25_0[iter_4_1][1]
                        slot_4_23_1 = slot_0_25_0[iter_4_1][2]

                        slot_4_2_1:add_text(draw.vec2(slot_4_17_1 + slot_4_22_0, slot_4_13_1 + slot_4_23_1), slot_4_12_1, slot_4_9_1)
                end

                slot_4_2_1:add_text(draw.vec2(slot_4_17_1, slot_4_13_1), slot_4_12_1, slot_4_10_1)

                return
        end

        if slot_4_0_0 then
                slot_0_37_0 = slot_0_32_0(slot_0_4_0) or 2.5
        else
                slot_0_37_0 = 0.5
        end

        slot_4_2_0 = draw.surface
        slot_4_3_0, slot_4_4_0 = game.engine:get_screen_size()
        slot_4_5_0 = math.floor(slot_4_3_0 / 2)
        slot_4_6_0 = math.floor(slot_4_4_0 / 2)
        slot_4_7_0 = slot_0_32_0(slot_0_5_0) or 0
        slot_4_8_0 = slot_0_32_0(slot_0_6_0) or 0.3

        if slot_4_8_0 < 0.01 then
                slot_4_8_0 = 0.01
        end

        slot_4_9_0 = slot_0_32_0(slot_0_1_0)

        if not slot_4_9_0 or slot_4_9_0 == slot_0_22_0 then
                slot_4_9_0 = slot_0_20_0
        end

        slot_4_10_0 = slot_0_32_0(slot_0_14_0) == true
        slot_4_11_0 = slot_0_32_0(slot_0_15_0) == true
        slot_4_12_0 = game.global_vars.real_time
        slot_0_36_0 = slot_0_36_0 + slot_0_37_0 * game.global_vars.frame_time

        if slot_0_36_0 > 2 * math.pi then
                slot_0_36_0 = slot_0_36_0 - 2 * math.pi
        end

        slot_4_13_0 = nil
        slot_4_14_0 = nil

        if slot_4_0_0 then
                slot_4_13_0 = slot_4_10_0 and slot_0_40_0(slot_0_36_0 + slot_0_38_0 * math.pi) or slot_4_9_0
                slot_4_14_0 = slot_4_11_0 and slot_0_40_0(slot_0_36_0 + slot_0_39_0 * math.pi) or slot_4_9_0
        else
                slot_4_15_1 = slot_0_32_0(slot_0_2_0)

                if not slot_4_15_1 or slot_4_15_1 == slot_0_22_0 then
                        slot_4_15_1 = slot_0_21_0
                end

                if slot_4_10_0 ~= slot_0_26_0.active then
                        if slot_4_10_0 then
                                slot_0_26_0.start = slot_4_12_0
                                slot_0_26_0.end_time = nil
                        else
                                slot_0_26_0.end_time = slot_4_12_0
                                slot_0_26_0.start = nil
                        end

                        slot_0_26_0.active = slot_4_10_0
                end

                if slot_4_11_0 ~= slot_0_27_0.active then
                        if slot_4_11_0 then
                                slot_0_27_0.start = slot_4_12_0
                                slot_0_27_0.end_time = nil
                        else
                                slot_0_27_0.end_time = slot_4_12_0
                                slot_0_27_0.start = nil
                        end

                        slot_0_27_0.active = slot_4_11_0
                end

                function slot_4_16_1(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
                        if arg_5_0 and arg_5_1 then
                                local var_5_0 = math.min((slot_4_12_0 - arg_5_1) / arg_5_5, 1)

                                return draw.color.interpolate(arg_5_3, arg_5_4, var_5_0)
                        elseif not arg_5_0 and arg_5_2 then
                                local var_5_1 = math.min((slot_4_12_0 - arg_5_2) / arg_5_5, 1)

                                return draw.color.interpolate(arg_5_4, arg_5_3, var_5_1)
                        else
                                return arg_5_0 and arg_5_4 or arg_5_3
                        end
                end

                slot_4_13_0 = slot_4_16_1(slot_4_10_0, slot_0_26_0.start, slot_0_26_0.end_time, slot_4_9_0, slot_4_15_1, slot_4_8_0)
                slot_4_14_0 = slot_4_16_1(slot_4_11_0, slot_0_27_0.start, slot_0_27_0.end_time, slot_4_9_0, slot_4_15_1, slot_4_8_0)

                if slot_0_26_0.start and slot_4_8_0 <= slot_4_12_0 - slot_0_26_0.start then
                        slot_0_26_0.start = nil
                end

                if slot_0_26_0.end_time and slot_4_8_0 <= slot_4_12_0 - slot_0_26_0.end_time then
                        slot_0_26_0.end_time = nil
                end

                if slot_0_27_0.start and slot_4_8_0 <= slot_4_12_0 - slot_0_27_0.start then
                        slot_0_27_0.start = nil
                end

                if slot_0_27_0.end_time and slot_4_8_0 <= slot_4_12_0 - slot_0_27_0.end_time then
                        slot_0_27_0.end_time = nil
                end
        end

        slot_4_15_0 = slot_4_1_0 and (slot_0_32_0(slot_0_11_0) or 0) or 0
        slot_4_16_0 = slot_4_1_0 and slot_0_19_0 and 8 + slot_4_15_0 or 0

        if math.abs(slot_4_16_0 - slot_0_29_0) > 0.001 then
                slot_0_29_0 = slot_4_16_0
                slot_0_30_0 = slot_0_28_0
                slot_0_31_0 = slot_4_12_0
        end

        slot_4_17_0 = slot_0_32_0(slot_0_10_0) or 0.2

        if slot_4_17_0 < 0.01 then
                slot_4_17_0 = 0.01
        end

        if slot_4_17_0 > 1 then
                slot_4_17_0 = 1
        end

        slot_4_18_0 = slot_4_12_0 - slot_0_31_0

        if slot_4_18_0 < slot_4_17_0 then
                slot_4_19_1 = slot_4_18_0 / slot_4_17_0
                slot_0_28_0 = slot_0_30_0 + (slot_0_29_0 - slot_0_30_0) * slot_4_19_1
        else
                slot_0_28_0 = slot_0_29_0
        end

        slot_4_19_0 = slot_4_6_0 - 11 + slot_0_28_0
        slot_4_2_0.font = slot_0_24_0

        for iter_4_2 = 1, 8 do
                slot_4_24_0 = slot_0_25_0[iter_4_2][1]
                slot_4_25_0 = slot_0_25_0[iter_4_2][2]

                slot_4_2_0:add_text(draw.vec2(slot_4_5_0 - 56 - slot_4_7_0 + slot_4_24_0, slot_4_19_0 + slot_4_25_0), "<", slot_0_23_0)
                slot_4_2_0:add_text(draw.vec2(slot_4_5_0 + 44 + slot_4_7_0 + slot_4_24_0, slot_4_19_0 + slot_4_25_0), ">", slot_0_23_0)
        end

        slot_4_2_0:add_text(draw.vec2(slot_4_5_0 - 56 - slot_4_7_0, slot_4_19_0), "<", slot_4_13_0)
        slot_4_2_0:add_text(draw.vec2(slot_4_5_0 + 44 + slot_4_7_0, slot_4_19_0), ">", slot_4_14_0)
end)
