--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("show_globe_checkbox"))
slot_0_1_0 = gui.make_control("Show Globe", slot_0_0_0)

gui.ctx:find("lua>elements a"):add(slot_0_1_0)

slot_0_3_0, slot_0_4_0 = game.engine:get_screen_size()
slot_0_5_0 = slot_0_3_0 / 2
slot_0_6_0 = slot_0_4_0 / 2
slot_0_7_0 = 100
slot_0_8_0 = 8
slot_0_9_0 = 0
slot_0_10_0 = 0.5
slot_0_11_0 = 0.3
slot_0_12_0 = 0.5
slot_0_13_0 = 0
slot_0_14_0 = slot_0_5_0
slot_0_15_0 = slot_0_6_0
slot_0_16_0 = 3
slot_0_17_0 = 2
slot_0_18_0 = 1

function slot_0_19_0(arg_1_0, arg_1_1, arg_1_2)
        local var_1_0 = arg_1_2 * arg_1_1
        local var_1_1 = var_1_0 * (1 - math.abs(arg_1_0 / 60 % 2 - 1))
        local var_1_2 = arg_1_2 - var_1_0
        local var_1_3 = 0
        local var_1_4 = 0
        local var_1_5 = 0

        if arg_1_0 < 60 then
                var_1_3, var_1_4, var_1_5 = var_1_0, var_1_1, 0
        elseif arg_1_0 < 120 then
                var_1_3, var_1_4, var_1_5 = var_1_1, var_1_0, 0
        elseif arg_1_0 < 180 then
                var_1_3, var_1_4, var_1_5 = 0, var_1_0, var_1_1
        elseif arg_1_0 < 240 then
                var_1_3, var_1_4, var_1_5 = 0, var_1_1, var_1_0
        elseif arg_1_0 < 300 then
                var_1_3, var_1_4, var_1_5 = var_1_1, 0, var_1_0
        else
                var_1_3, var_1_4, var_1_5 = var_1_0, 0, var_1_1
        end

        return draw.color(math.floor((var_1_3 + var_1_2) * 255), math.floor((var_1_4 + var_1_2) * 255), math.floor((var_1_5 + var_1_2) * 255), 255)
end

function slot_0_20_0(arg_2_0)
        local var_2_0 = slot_0_9_0 * slot_0_10_0 % 360
        local var_2_1 = slot_0_19_0(var_2_0, 1, 1)

        var_2_1.a = arg_2_0

        return var_2_1
end

function slot_0_21_0(arg_3_0, arg_3_1, arg_3_2)
        local var_3_0 = arg_3_1 * math.cos(slot_0_11_0) - arg_3_2 * math.sin(slot_0_11_0)
        local var_3_1 = arg_3_1 * math.sin(slot_0_11_0) + arg_3_2 * math.cos(slot_0_11_0)

        arg_3_1, arg_3_2 = var_3_0, var_3_1

        local var_3_2 = arg_3_0 * math.cos(slot_0_12_0) - arg_3_2 * math.sin(slot_0_12_0)
        local var_3_3 = arg_3_0 * math.sin(slot_0_12_0) + arg_3_2 * math.cos(slot_0_12_0)

        arg_3_0, arg_3_2 = var_3_2, var_3_3

        local var_3_4 = arg_3_0 * math.cos(slot_0_13_0) - arg_3_1 * math.sin(slot_0_13_0)
        local var_3_5 = arg_3_0 * math.sin(slot_0_13_0) + arg_3_1 * math.cos(slot_0_13_0)

        arg_3_0, arg_3_1 = var_3_4, var_3_5

        return arg_3_0, arg_3_1, arg_3_2
end

function slot_0_22_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
        local var_4_0 = draw.surface
        local var_4_1 = {}

        for iter_4_0 = 0, arg_4_3 do
                local var_4_2 = iter_4_0 * math.pi / arg_4_3
                local var_4_3 = math.sin(var_4_2)
                local var_4_4 = math.cos(var_4_2)

                for iter_4_1 = 0, arg_4_3 do
                        local var_4_5 = iter_4_1 * 2 * math.pi / arg_4_3
                        local var_4_6 = math.sin(var_4_5)
                        local var_4_7 = math.cos(var_4_5)
                        local var_4_8 = arg_4_2 * var_4_3 * var_4_7
                        local var_4_9 = arg_4_2 * var_4_4
                        local var_4_10 = arg_4_2 * var_4_3 * var_4_6
                        local var_4_11, var_4_12, var_4_13 = slot_0_21_0(var_4_8, var_4_9, var_4_10)

                        table.insert(var_4_1, {
                                screenX = arg_4_0 + var_4_11,
                                screenY = arg_4_1 + var_4_12,
                                z = var_4_13
                        })
                end
        end

        local var_4_14 = slot_0_20_0(255)

        for iter_4_2, iter_4_3 in ipairs(var_4_1) do
                var_4_0:add_circle_filled(draw.vec2(iter_4_3.screenX, iter_4_3.screenY), 3, var_4_14)
        end
end

function slot_0_23_0()
        if slot_0_0_0:get_value():get() then
                slot_0_9_0 = slot_0_9_0 + 1
                slot_0_14_0 = slot_0_14_0 + slot_0_16_0
                slot_0_15_0 = slot_0_15_0 + slot_0_17_0

                if slot_0_14_0 - slot_0_7_0 <= 0 then
                        slot_0_14_0 = slot_0_7_0
                        slot_0_16_0 = math.abs(slot_0_16_0) * slot_0_18_0
                elseif slot_0_14_0 + slot_0_7_0 >= slot_0_3_0 then
                        slot_0_14_0 = slot_0_3_0 - slot_0_7_0
                        slot_0_16_0 = -math.abs(slot_0_16_0) * slot_0_18_0
                end

                if slot_0_15_0 - slot_0_7_0 <= 0 then
                        slot_0_15_0 = slot_0_7_0
                        slot_0_17_0 = math.abs(slot_0_17_0) * slot_0_18_0
                elseif slot_0_15_0 + slot_0_7_0 >= slot_0_4_0 then
                        slot_0_15_0 = slot_0_4_0 - slot_0_7_0
                        slot_0_17_0 = -math.abs(slot_0_17_0) * slot_0_18_0
                end

                slot_0_11_0 = slot_0_11_0 + 0.01
                slot_0_12_0 = slot_0_12_0 + 0.015
                slot_0_13_0 = slot_0_13_0 + 0.005

                slot_0_22_0(slot_0_14_0, slot_0_15_0, slot_0_7_0, slot_0_8_0)
        end
end

events.present_queue:add(slot_0_23_0)
