--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.notification("Fatality Watermark", "Script loaded successfully!")
slot_0_1_0 = 0.3
slot_0_2_0 = 0
slot_0_3_0 = 0
slot_0_4_0 = 0
slot_0_5_0 = 0
slot_0_6_0 = 1
slot_0_7_0 = "FATALITY.WIN"

function slot_0_8_0(arg_1_0, arg_1_1, arg_1_2)
        local var_1_0 = arg_1_2 * arg_1_1
        local var_1_1 = var_1_0 * (1 - math.abs(arg_1_0 / 60 % 2 - 1))
        local var_1_2 = arg_1_2 - var_1_0
        local var_1_3
        local var_1_4
        local var_1_5

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

        return math.floor((var_1_3 + var_1_2) * 255), math.floor((var_1_4 + var_1_2) * 255), math.floor((var_1_5 + var_1_2) * 255)
end

function slot_0_9_0()
        if slot_0_6_0 == 1 then
                return string.sub(slot_0_7_0, 1, slot_0_4_0)
        else
                return string.sub(slot_0_7_0, 1, #slot_0_7_0 - slot_0_4_0)
        end
end

function slot_0_10_0()
        local var_3_0 = draw.surface

        var_3_0.font = draw.fonts.gui_debug

        local var_3_1 = game.global_vars.frame_time
        local var_3_2 = game.engine:get_netchan()
        local var_3_3, var_3_4 = game.engine:get_screen_size()
        local var_3_5 = 0

        if var_3_1 and var_3_1 > 0 then
                var_3_5 = math.floor(1 / var_3_1)
        end

        local var_3_6 = 0

        if var_3_2 and not var_3_2:is_null() then
                var_3_6 = var_3_2:get_latency() * 1000
                var_3_6 = math.floor(var_3_6)
        end

        local var_3_7 = "Unknown"

        if gui.ctx and gui.ctx.user and gui.ctx.user.username ~= "" then
                var_3_7 = gui.ctx.user.username
        end

        slot_0_5_0 = slot_0_5_0 + var_3_1

        if slot_0_5_0 >= slot_0_1_0 then
                if slot_0_6_0 == 1 then
                        slot_0_4_0 = slot_0_4_0 + 1

                        if slot_0_4_0 > #slot_0_7_0 then
                                slot_0_4_0 = 0
                                slot_0_6_0 = -1
                        end
                else
                        slot_0_4_0 = slot_0_4_0 + 1

                        if slot_0_4_0 > #slot_0_7_0 then
                                slot_0_4_0 = 0
                                slot_0_6_0 = 1
                        end
                end

                slot_0_5_0 = 0
        end

        local var_3_8 = (function(arg_4_0)
                if arg_4_0 == nil then
                        return "   "
                else
                        return string.format("%3d", arg_4_0)
                end
        end)(var_3_5)
        local var_3_9 = slot_0_9_0()
        local var_3_10 = string.format("%s | %s | FPS: %s | MS: %d", var_3_9, var_3_7, var_3_8, var_3_6)
        local var_3_11 = var_3_0.font:get_text_size(var_3_10, true)
        local var_3_12 = var_3_11.x
        local var_3_13 = var_3_11.y
        local var_3_14 = 6
        local var_3_15 = var_3_11.x + var_3_14 * 2
        local var_3_16 = var_3_11.y + var_3_14 * 2
        local var_3_17 = game.engine:get_screen_size() - var_3_15 - 10
        local var_3_18 = 20
        local var_3_19 = draw.rect(var_3_17, var_3_18, var_3_17 + var_3_15, var_3_18 + var_3_16)
        local var_3_20 = game.global_vars.cur_time * 60 % 360
        local var_3_21, var_3_22, var_3_23 = slot_0_8_0(var_3_20, 1, 1)

        var_3_0:add_rect_filled_rounded(var_3_19, draw.color(0, 0, 0, 180), 6)
        var_3_0:add_glow(var_3_19, 8, draw.color(var_3_21, var_3_22, var_3_23, 120))
        var_3_0:add_rect(var_3_19, draw.color(255, 255, 255), 1)
        var_3_0:add_text(draw.vec2(var_3_17 + var_3_14, var_3_18 + var_3_14), var_3_10, draw.color.white())
end

gui.notify:add(slot_0_0_0)
events.present_queue:add(slot_0_10_0)
