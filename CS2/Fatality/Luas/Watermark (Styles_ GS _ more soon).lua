--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 0
slot_0_1_0 = 0
slot_0_2_0 = 0
slot_0_3_0 = {}

function slot_0_4_0()
        slot_1_0_0 = math.floor(1 / game.global_vars.frame_time + 0.5)
        slot_1_1_0 = game.engine:get_netchan()
        slot_1_2_0 = math.floor((slot_1_1_0:get_latency() or 0) * 1000)
        slot_1_3_0 = gui.ctx.user.username or "guest"
        slot_1_4_0 = "game"
        slot_1_5_0 = "sense"
        slot_1_6_0 = string.format(" | %s | ", slot_1_3_0)
        slot_1_7_0 = tostring(slot_1_0_0)
        slot_1_8_0 = " fps"
        slot_1_9_0 = " | "
        slot_1_10_0 = tostring(slot_1_2_0)
        slot_1_11_0 = " ms"
        slot_1_12_0 = draw.surface
        slot_1_12_0.font = draw.fonts.gui_debug
        slot_1_13_0 = {
                slot_1_12_0.font:get_text_size(slot_1_4_0),
                slot_1_12_0.font:get_text_size(slot_1_5_0),
                slot_1_12_0.font:get_text_size(slot_1_6_0),
                slot_1_12_0.font:get_text_size(slot_1_7_0),
                slot_1_12_0.font:get_text_size(slot_1_8_0),
                slot_1_12_0.font:get_text_size(slot_1_9_0),
                slot_1_12_0.font:get_text_size(slot_1_10_0),
                slot_1_12_0.font:get_text_size(slot_1_11_0)
        }
        slot_1_14_0, slot_1_15_0 = game.engine:get_screen_size()
        slot_1_16_0 = 7
        slot_1_17_0 = 10
        slot_1_18_1 = 0

        for iter_1_0, iter_1_1 in ipairs(slot_1_13_0) do
                slot_1_18_1 = slot_1_18_1 + iter_1_1.x
        end

        slot_1_18_0 = slot_1_18_1 + slot_1_16_0 * 2
        slot_1_19_0 = slot_1_13_0[1].y + slot_1_16_0 + 5
        slot_1_20_0 = slot_1_14_0 - slot_1_18_0 - slot_1_17_0
        slot_1_21_0 = slot_1_17_0
        slot_1_22_0 = draw.rect(slot_1_20_0, slot_1_21_0, slot_1_20_0 + slot_1_18_0, slot_1_21_0 + slot_1_19_0)
        slot_1_23_0 = slot_1_18_0
        slot_1_24_0 = slot_1_18_0 / 2
        slot_1_25_0 = 180

        for iter_1_2 = 0, slot_1_23_0 - 1 do
                slot_1_31_0 = slot_1_25_0 * (1 - math.abs(iter_1_2 - slot_1_24_0) / slot_1_24_0)
                slot_1_32_0 = draw.rect(slot_1_20_0 + iter_1_2, slot_1_21_0, slot_1_20_0 + iter_1_2 + 1, slot_1_21_0 + slot_1_19_0)

                slot_1_12_0:add_rect_filled(slot_1_32_0, draw.color(13, 12, 12, slot_1_31_0))
        end

        slot_1_26_0 = draw.vec2(slot_1_22_0:tl().x + slot_1_16_0, slot_1_22_0:tl().y + slot_1_16_0)

        slot_1_12_0:add_text(slot_1_26_0, slot_1_4_0, draw.color.white())

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[1].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_5_0, draw.color(140, 190, 50, 255))

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[2].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_6_0, draw.color.white())

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[3].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_7_0, draw.color(140, 190, 50, 255))

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[4].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_8_0, draw.color.white())

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[5].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_9_0, draw.color.white())

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[6].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_10_0, draw.color(140, 190, 50, 255))

        slot_1_26_0.x = slot_1_26_0.x + slot_1_13_0[7].x

        slot_1_12_0:add_text(slot_1_26_0, slot_1_11_0, draw.color.white())
end

function slot_0_5_0()
        local var_2_0 = draw.surface

        var_2_0.font = draw.fonts.gui_debug

        local var_2_1, var_2_2 = game.engine:get_screen_size()
        local var_2_3 = 10
        local var_2_4 = 6
        local var_2_5 = var_2_3
        local var_2_6 = game.global_vars.real_time

        for iter_2_0 = #slot_0_3_0, 1, -1 do
                local var_2_7 = slot_0_3_0[iter_2_0]
                local var_2_8 = var_2_6 - var_2_7.time

                if var_2_8 > 5 then
                        table.remove(slot_0_3_0, iter_2_0)
                else
                        local var_2_9 = 255

                        if var_2_8 > 4 then
                                var_2_9 = math.floor(255 * (1 - (var_2_8 - 4) / 1))
                        end

                        local var_2_10 = var_2_7.parts
                        local var_2_11 = 0

                        for iter_2_1, iter_2_2 in ipairs(var_2_10) do
                                var_2_11 = var_2_11 + var_2_0.font:get_text_size(iter_2_2.text).x
                        end

                        local var_2_12 = var_2_0.font:get_text_size("A").y + var_2_4 * 2
                        local var_2_13 = draw.rect(var_2_3, var_2_5, var_2_3 + var_2_11 + var_2_4 * 2, var_2_5 + var_2_12)
                        local var_2_14 = var_2_13:br().x - var_2_13:tl().x
                        local var_2_15 = (var_2_13:br().x - var_2_13:tl().x) / 2
                        local var_2_16 = 180

                        for iter_2_3 = 0, var_2_14 - 1 do
                                local var_2_17 = var_2_16 * (1 - math.abs(iter_2_3 - var_2_15) / var_2_15) * (var_2_9 / 255)
                                local var_2_18 = draw.rect(var_2_13:tl().x + iter_2_3, var_2_13:tl().y, var_2_13:tl().x + iter_2_3 + 1, var_2_13:br().y)

                                var_2_0:add_rect_filled(var_2_18, draw.color(13, 12, 12, var_2_17))
                        end

                        local var_2_19 = draw.vec2(var_2_13:tl().x + var_2_4, var_2_13:tl().y + var_2_4)

                        for iter_2_4, iter_2_5 in ipairs(var_2_10) do
                                var_2_0:add_text(var_2_19, iter_2_5.text, draw.color(iter_2_5.color.r, iter_2_5.color.g, iter_2_5.color.b, var_2_9))

                                local var_2_20 = var_2_0.font:get_text_size(iter_2_5.text)

                                var_2_19.x = var_2_19.x + var_2_20.x
                        end

                        var_2_5 = var_2_5 + var_2_12 + 4
                end
        end
end

events.present_queue:add(slot_0_4_0)
events.present_queue:add(slot_0_5_0)
events.event:add(function(arg_3_0)
        if arg_3_0:get_name() == "player_hurt" then
                local var_3_0 = arg_3_0:get_controller("attacker")
                local var_3_1 = arg_3_0:get_controller("userid")

                if var_3_0 and var_3_1 and var_3_0 == entities.get_local_controller() then
                        local var_3_2 = var_3_1:get_name()
                        local var_3_3 = arg_3_0:get_int("dmg_health")
                        local var_3_4 = arg_3_0:get_int("health")
                        local var_3_5 = arg_3_0:get_int("hitgroup")
                        local var_3_6 = ({
                                [0] = "generic",
                                "head",
                                "chest",
                                "stomach",
                                "left arm",
                                "right arm",
                                "left leg",
                                "right leg"
                        })[var_3_5] or "body"

                        table.insert(slot_0_3_0, {
                                time = game.global_vars.real_time,
                                parts = {
                                        {
                                                text = "Hit ",
                                                color = {
                                                        r = 255,
                                                        g = 255,
                                                        b = 255
                                                }
                                        },
                                        {
                                                text = var_3_2,
                                                color = {
                                                        r = 140,
                                                        g = 190,
                                                        b = 50
                                                }
                                        },
                                        {
                                                text = " in the " .. var_3_6 .. " for ",
                                                color = {
                                                        r = 255,
                                                        g = 255,
                                                        b = 255
                                                }
                                        },
                                        {
                                                text = tostring(var_3_3),
                                                color = {
                                                        r = 140,
                                                        g = 190,
                                                        b = 50
                                                }
                                        },
                                        {
                                                text = " damage (",
                                                color = {
                                                        r = 255,
                                                        g = 255,
                                                        b = 255
                                                }
                                        },
                                        {
                                                text = tostring(var_3_4),
                                                color = {
                                                        r = 140,
                                                        g = 190,
                                                        b = 50
                                                }
                                        },
                                        {
                                                text = " health remaining)",
                                                color = {
                                                        r = 255,
                                                        g = 255,
                                                        b = 255
                                                }
                                        }
                                }
                        })
                end
        end
end)
