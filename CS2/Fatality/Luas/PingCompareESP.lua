--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements b")
slot_0_1_0 = gui.checkbox(gui.control_id("ping_compare_show_settings"))
slot_0_2_0 = gui.make_control("- Show Ping Compare ESP Settings", slot_0_1_0)
slot_0_3_0 = gui.combo_box(gui.control_id("ping_compare_size_combo"))

slot_0_3_0:add(gui.selectable(gui.control_id("ping_size_normal"), "Normal"))
slot_0_3_0:add(gui.selectable(gui.control_id("ping_size_large"), "Large"))

slot_0_4_0 = gui.make_control("Size", slot_0_3_0)
slot_0_5_0 = gui.combo_box(gui.control_id("ping_compare_style_combo"))

slot_0_5_0:add(gui.selectable(gui.control_id("ping_style_plusminus"), "+/-"))
slot_0_5_0:add(gui.selectable(gui.control_id("ping_style_arrows"), "> / <"))

slot_0_6_0 = gui.make_control("Ping Style", slot_0_5_0)
slot_0_7_0 = slot_0_3_0:get_value():get()

if slot_0_7_0:get_raw() == 0 then
        slot_0_7_0:set_raw(1)
end

slot_0_8_0 = slot_0_5_0:get_value():get()

if slot_0_8_0:get_raw() == 0 then
        slot_0_8_0:set_raw(1)
end

slot_0_9_0 = gui.checkbox(gui.control_id("ping_compare_custom_colors"))
slot_0_10_0 = gui.make_control("Custom colors", slot_0_9_0)
slot_0_11_0 = gui.color_picker(gui.control_id("ping_compare_color_bg"), draw.color(0, 0, 0, 89))
slot_0_12_0 = gui.make_control("Background Color", slot_0_11_0)
slot_0_13_0 = gui.color_picker(gui.control_id("ping_compare_color_better"), draw.color(100, 255, 100))
slot_0_14_0 = gui.make_control("Better Ping Color", slot_0_13_0)
slot_0_15_0 = gui.color_picker(gui.control_id("ping_compare_color_worse"), draw.color(255, 100, 100))
slot_0_16_0 = gui.make_control("Worse Ping Color", slot_0_15_0)
slot_0_17_0 = gui.color_picker(gui.control_id("ping_compare_color_similar"), draw.color(255, 255, 100))
slot_0_18_0 = gui.make_control("Similar Ping Color", slot_0_17_0)
slot_0_19_0 = gui.slider(gui.control_id("ping_compare_offset_y"), -100, 100, {
        "%.0f"
}, 1)
slot_0_20_0 = gui.make_control("Y Offset", slot_0_19_0)

if slot_0_0_0 then
        slot_0_0_0:reset()
        slot_0_0_0:add(slot_0_2_0)
        slot_0_0_0:add(slot_0_4_0)
        slot_0_0_0:add(slot_0_6_0)
        slot_0_0_0:add(slot_0_20_0)
        slot_0_0_0:add(slot_0_10_0)
        slot_0_0_0:add(slot_0_14_0)
        slot_0_0_0:add(slot_0_16_0)
        slot_0_0_0:add(slot_0_18_0)
        slot_0_0_0:add(slot_0_12_0)
end

slot_0_21_0 = draw.color(255, 255, 255)

function slot_0_22_0()
        local var_1_0 = game.engine:get_netchan()

        if var_1_0 and not var_1_0:is_null() then
                local var_1_1 = var_1_0:get_latency()

                if var_1_1 then
                        return math.floor(var_1_1 * 1000)
                end
        end

        return 0
end

function slot_0_23_0(arg_2_0)
        if not arg_2_0 then
                return 0
        end

        local var_2_0 = arg_2_0.m_iPing

        if var_2_0 then
                local var_2_1 = var_2_0:get()

                if var_2_1 then
                        return var_2_1
                end
        end

        return 0
end

function slot_0_24_0()
        local var_3_0 = slot_0_1_0:get_value():get()
        local var_3_1 = slot_0_9_0:get_value():get()

        if slot_0_4_0 then
                slot_0_4_0:set_visible(var_3_0)
        end

        if slot_0_6_0 then
                slot_0_6_0:set_visible(var_3_0)
        end

        if slot_0_20_0 then
                slot_0_20_0:set_visible(var_3_0)
        end

        if slot_0_10_0 then
                slot_0_10_0:set_visible(var_3_0)
        end

        local var_3_2 = var_3_0 and var_3_1

        if slot_0_14_0 then
                slot_0_14_0:set_visible(var_3_2)
        end

        if slot_0_16_0 then
                slot_0_16_0:set_visible(var_3_2)
        end

        if slot_0_18_0 then
                slot_0_18_0:set_visible(var_3_2)
        end

        if slot_0_12_0 then
                slot_0_12_0:set_visible(var_3_2)
        end

        if not game.engine:in_game() then
                return
        end

        if not entities.get_local_pawn() then
                return
        end

        local var_3_3 = slot_0_22_0()
        local var_3_4 = slot_0_3_0:get_value():get():get_raw()
        local var_3_5 = math.floor(var_3_4 / 2) % 2 >= 1
        local var_3_6

        if var_3_5 then
                var_3_6 = draw.fonts.gui_title
        else
                var_3_6 = draw.fonts.gui_main
        end

        if not var_3_6 then
                return
        end

        draw.surface.font = var_3_6

        local var_3_7 = draw.color(100, 255, 100)
        local var_3_8 = draw.color(255, 100, 100)
        local var_3_9 = draw.color(255, 255, 100)
        local var_3_10 = draw.color(0, 0, 0, 89)

        if var_3_1 then
                var_3_7 = slot_0_13_0:get_value():get()
                var_3_8 = slot_0_15_0:get_value():get()
                var_3_9 = slot_0_17_0:get_value():get()
                var_3_10 = slot_0_11_0:get_value():get()
        end

        entities.controllers:for_each(function(arg_4_0)
                local var_4_0 = arg_4_0.entity

                if not var_4_0 then
                        return
                end

                if not var_4_0:is_enemy() then
                        return
                end

                local var_4_1 = var_4_0:get_pawn()

                if not var_4_1 then
                        return
                end

                if not var_4_1:is_alive() then
                        return
                end

                if not var_4_1:should_draw() then
                        return
                end

                local var_4_2 = var_4_1:get_eye_pos()

                if not var_4_2 then
                        return
                end

                local var_4_3 = math.vec3(var_4_2.x, var_4_2.y, var_4_2.z + 8)
                local var_4_4 = math.world_to_screen(var_4_3)

                if not var_4_4 then
                        return
                end

                local var_4_5, var_4_6 = game.engine:get_screen_size()

                if var_4_4.x < 0 or var_4_5 < var_4_4.x then
                        return
                end

                if var_4_4.y < 0 or var_4_6 < var_4_4.y then
                        return
                end

                local var_4_7 = 0
                local var_4_8 = var_4_0.m_iPing

                if var_4_8 then
                        local var_4_9 = var_4_8:get()

                        if var_4_9 and type(var_4_9) == "number" then
                                var_4_7 = var_4_9
                        end
                end

                local var_4_10 = slot_0_5_0:get_value():get():get_raw()
                local var_4_11 = math.floor(var_4_10 / 2) % 2 >= 1
                local var_4_12 = ""
                local var_4_13 = slot_0_21_0

                if var_4_7 == 0 then
                        var_4_12 = "BOT"
                        var_4_13 = var_3_8
                else
                        local var_4_14 = var_4_7 - var_3_3

                        if var_4_14 > 0 then
                                if var_4_11 then
                                        var_4_12 = ">" .. var_4_14 .. "ms"
                                else
                                        var_4_12 = "+" .. var_4_14 .. "ms"
                                end

                                var_4_13 = var_3_7
                        elseif var_4_14 < 0 then
                                if var_4_11 then
                                        var_4_12 = "<" .. math.abs(var_4_14) .. "ms"
                                else
                                        var_4_12 = var_4_14 .. "ms"
                                end

                                var_4_13 = var_3_8
                        else
                                var_4_12 = var_4_11 and "=0ms" or "0ms"
                                var_4_13 = var_3_9
                        end
                end

                local var_4_15 = var_3_6:get_text_size(var_4_12)

                if not var_4_15 then
                        return
                end

                local var_4_16 = slot_0_19_0:get_value():get()
                local var_4_17 = 15 + var_4_15.y - var_4_16
                local var_4_18 = draw.vec2(var_4_4.x - var_4_15.x / 2, var_4_4.y - var_4_17)
                local var_4_19 = 4

                if var_3_5 then
                        var_4_19 = 7
                end

                local var_4_20 = 6

                draw.surface:add_rect_filled_rounded(draw.rect(var_4_18.x - var_4_19, var_4_18.y - var_4_19, var_4_18.x + var_4_15.x + var_4_19, var_4_18.y + var_4_15.y + var_4_19), var_3_10, var_4_20)
                draw.surface:add_text(var_4_18, var_4_12, var_4_13, nil)
        end)
end

events.present_queue:add(slot_0_24_0)
