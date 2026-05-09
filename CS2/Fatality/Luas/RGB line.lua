--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function slot_0_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
        local var_1_0
        local var_1_1
        local var_1_2
        local var_1_3 = math.floor(arg_1_0 * 6)
        local var_1_4 = arg_1_0 * 6 - var_1_3
        local var_1_5 = arg_1_2 * (1 - arg_1_1)
        local var_1_6 = arg_1_2 * (1 - var_1_4 * arg_1_1)
        local var_1_7 = arg_1_2 * (1 - (1 - var_1_4) * arg_1_1)
        local var_1_8 = var_1_3 % 6

        if var_1_8 == 0 then
                var_1_0, var_1_1, var_1_2 = arg_1_2, var_1_7, var_1_5
        elseif var_1_8 == 1 then
                var_1_0, var_1_1, var_1_2 = var_1_6, arg_1_2, var_1_5
        elseif var_1_8 == 2 then
                var_1_0, var_1_1, var_1_2 = var_1_5, arg_1_2, var_1_7
        elseif var_1_8 == 3 then
                var_1_0, var_1_1, var_1_2 = var_1_5, var_1_6, arg_1_2
        elseif var_1_8 == 4 then
                var_1_0, var_1_1, var_1_2 = var_1_7, var_1_5, arg_1_2
        elseif var_1_8 == 5 then
                var_1_0, var_1_1, var_1_2 = arg_1_2, var_1_5, var_1_6
        end

        return var_1_0 * 255, var_1_1 * 255, var_1_2 * 255, arg_1_3 * 255
end

function slot_0_1_0(arg_2_0)
        local var_2_0, var_2_1, var_2_2, var_2_3 = slot_0_0_0(game.global_vars.real_time * 0.1, 1, 1, 1)
        local var_2_4 = var_2_0 * arg_2_0
        local var_2_5 = var_2_1 * arg_2_0
        local var_2_6 = var_2_2 * arg_2_0

        return math.floor(var_2_4), math.floor(var_2_5), math.floor(var_2_6)
end

slot_0_2_0 = {
        game.engine:get_screen_size()
}
slot_0_3_0 = 255
slot_0_4_0 = 5
slot_0_5_0 = draw.surface

function slot_0_6_0()
        local var_3_0, var_3_1, var_3_2 = slot_0_1_0(1)

        for iter_3_0 = 0, slot_0_4_0 do
                ap = 255 - slot_0_3_0 * (iter_3_0 / slot_0_4_0)

                slot_0_5_0:add_rect_filled_multicolor(draw.rect(0, iter_3_0, slot_0_2_0[1] / 2, iter_3_0 + 1), {
                        draw.color(var_3_1, var_3_2, var_3_0, ap),
                        draw.color(var_3_0, var_3_1, var_3_2, ap),
                        draw.color(var_3_0, var_3_1, var_3_2, ap),
                        draw.color(var_3_1, var_3_2, var_3_0, ap)
                })
                slot_0_5_0:add_rect_filled_multicolor(draw.rect(slot_0_2_0[1] / 2, iter_3_0, slot_0_2_0[1], iter_3_0 + 1), {
                        draw.color(var_3_0, var_3_1, var_3_2, ap),
                        draw.color(var_3_2, var_3_0, var_3_1, ap),
                        draw.color(var_3_2, var_3_0, var_3_1, ap),
                        draw.color(var_3_0, var_3_1, var_3_2, ap)
                })
        end
end

events.present_queue:add(slot_0_6_0)
