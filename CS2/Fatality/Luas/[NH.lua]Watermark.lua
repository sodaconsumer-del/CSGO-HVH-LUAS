--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function rainbowColor(arg_1_0)
        local var_1_0
        local var_1_1
        local var_1_2
        local var_1_3 = arg_1_0 * 6
        local var_1_4 = math.floor(var_1_3) % 6
        local var_1_5 = var_1_3 - math.floor(var_1_3)

        if var_1_4 == 0 then
                var_1_0, var_1_1, var_1_2 = 1, var_1_5, 0
        elseif var_1_4 == 1 then
                var_1_0, var_1_1, var_1_2 = 1 - var_1_5, 1, 0
        elseif var_1_4 == 2 then
                var_1_0, var_1_1, var_1_2 = 0, 1, var_1_5
        elseif var_1_4 == 3 then
                var_1_0, var_1_1, var_1_2 = 0, 1 - var_1_5, 1
        elseif var_1_4 == 4 then
                var_1_0, var_1_1, var_1_2 = var_1_5, 0, 1
        elseif var_1_4 == 5 then
                var_1_0, var_1_1, var_1_2 = 1, 0, 1 - var_1_5
        end

        return math.floor(var_1_0 * 255), math.floor(var_1_1 * 255), math.floor(var_1_2 * 255)
end

slot_0_0_0 = 0.001
slot_0_1_0 = 0
slot_0_2_0, slot_0_3_0 = game.engine:get_screen_size()
slot_0_4_0 = math.floor(1 / game.global_vars.frame_time)
slot_0_5_0 = game.global_vars.cur_time

events.present_queue:add(function()
        draw.surface.font = draw.fonts.gui_debug

        local var_2_0 = {
                "Fatality.win",
                " | ",
                gui.ctx.user.username
        }
        local var_2_1 = game.global_vars.cur_time

        if var_2_1 < slot_0_5_0 then
                slot_0_5_0 = 0
        end

        if var_2_1 - slot_0_5_0 >= 1 then
                if game.global_vars.frame_time > 0 then
                        slot_0_4_0 = math.floor(1 / game.global_vars.frame_time)
                end

                slot_0_5_0 = var_2_1
        end

        var_2_0[#var_2_0 + 1] = " | "
        var_2_0[#var_2_0 + 1] = tostring(slot_0_4_0) .. " fps"

        local var_2_2 = game.engine:get_netchan()

        if game.engine:in_game() then
                var_2_0[#var_2_0 + 1] = " | "
                var_2_0[#var_2_0 + 1] = game.global_vars.map_name

                if var_2_2 and not var_2_2:is_null() then
                        var_2_0[#var_2_0 + 1] = " | "
                        var_2_0[#var_2_0 + 1] = var_2_2:get_address()

                        if string.match(var_2_0[#var_2_0], "^=") then
                                var_2_0[#var_2_0] = "Valve"
                        end

                        var_2_0[#var_2_0 + 1] = " | "
                        var_2_0[#var_2_0 + 1] = tostring(math.floor(var_2_2:get_latency() * 1000 + 0.5)) .. " ms"
                end
        end

        local var_2_3 = table.concat(var_2_0)
        local var_2_4 = 0

        for iter_2_0 = 1, #var_2_0 do
                var_2_4 = var_2_4 + draw.surface.font:get_text_size(var_2_0[iter_2_0], true).x
        end

        local var_2_5 = draw.vec2(slot_0_2_0 - var_2_4 - 10, 10)
        local var_2_6 = draw.rect(var_2_5.x - 5, 5, slot_0_2_0 - 3, 5 + draw.surface.font.height + 6)

        draw.surface:add_rect_filled(var_2_6, draw.color(22, 22, 22), 14)
        draw.surface:add_text(var_2_5, var_2_3, draw.color(255, 255, 255))

        local var_2_7, var_2_8, var_2_9 = rainbowColor(slot_0_1_0)

        draw.surface:add_line(var_2_6:tl(), var_2_6:tr(), draw.color(var_2_7, var_2_8, var_2_9))

        slot_0_1_0 = (slot_0_1_0 + slot_0_0_0) % 1
end)
