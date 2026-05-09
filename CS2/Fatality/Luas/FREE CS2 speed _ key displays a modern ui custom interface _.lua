--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("lua>elements a")
slot_0_1_0 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("lua>elements b")
slot_0_2_0 = {}
slot_0_3_0 = {
        last_sample_time = 0,
        samples = {},
        keys = {
                lmb = false,
                du = false,
                sw = false,
                sp = false,
                d = false,
                a = false,
                w = false,
                rmb = false,
                s = false
        }
}

function slot_0_4_0(arg_1_0)
        if not arg_1_0 then
                return false
        end

        if arg_1_0.get_hotkey_state then
                return arg_1_0:get_hotkey_state()
        end

        local var_1_0 = arg_1_0.get_value and arg_1_0:get_value()

        if var_1_0 and var_1_0.get_hotkey_state then
                return var_1_0:get_hotkey_state()
        end

        if var_1_0 and var_1_0.get then
                return var_1_0:get()
        end

        return false
end

function slot_0_5_0(arg_2_0, arg_2_1, arg_2_2)
        if not arg_2_0 then
                return nil
        end

        local var_2_0 = gui.make_control(arg_2_1, arg_2_2)

        arg_2_0:add(var_2_0)

        return var_2_0
end

if slot_0_0_0 and gui and gui.checkbox and gui.slider and gui.control_id then
        slot_0_2_0.enable = gui.checkbox(gui.control_id("speedhud>enable"))
        slot_0_2_0.show_speed = gui.checkbox(gui.control_id("speedhud>speed"))
        slot_0_2_0.show_keys = gui.checkbox(gui.control_id("speedhud>keys"))
        slot_0_2_0.show_graph = gui.checkbox(gui.control_id("speedhud>graph"))

        slot_0_5_0(slot_0_0_0, "[speed] Master switch", slot_0_2_0.enable)
        slot_0_5_0(slot_0_0_0, "[speed] Speed display", slot_0_2_0.show_speed)
        slot_0_5_0(slot_0_0_0, "[speed] Keys display", slot_0_2_0.show_keys)
        slot_0_5_0(slot_0_0_0, "[speed] Graph display", slot_0_2_0.show_graph)
        slot_0_0_0:reset()
        slot_0_0_0:reset()
end

if slot_0_1_0 and gui and gui.checkbox and gui.slider and gui.control_id then
        slot_0_2_0.graph_x = gui.slider(gui.control_id("speedhud>graph_x"), 0, 2000, {
                "%.0f"
        })
        slot_0_2_0.graph_y = gui.slider(gui.control_id("speedhud>graph_y"), 0, 2000, {
                "%.0f"
        })
        slot_0_2_0.keys_x = gui.slider(gui.control_id("speedhud>keys_x"), 0, 2000, {
                "%.0f"
        })
        slot_0_2_0.keys_y = gui.slider(gui.control_id("speedhud>keys_y"), 0, 2000, {
                "%.0f"
        })
        slot_0_2_0.graph_w = gui.slider(gui.control_id("speedhud>graph_w"), 80, 500, {
                "%.0f"
        })
        slot_0_2_0.graph_h = gui.slider(gui.control_id("speedhud>graph_h"), 20, 500, {
                "%.0f"
        })
        slot_0_2_0.graph_max = gui.slider(gui.control_id("speedhud>graph_max"), 100, 800, {
                "%.0f"
        })
        slot_0_2_0.graph_bg_a = gui.slider(gui.control_id("speedhud>graph_bg_a"), 0, 255, {
                "%.0f"
        })
        slot_0_2_0.key_size = gui.slider(gui.control_id("speedhud>key_size"), 20, 40, {
                "%.0f"
        })
        slot_0_2_0.key_gap = gui.slider(gui.control_id("speedhud>key_gap"), 2, 12, {
                "%.0f"
        })
        slot_0_2_0.graph_color = gui.color_picker(gui.control_id("speedhud>graph_color"), true)

        slot_0_5_0(slot_0_1_0, "[speed] Graph X", slot_0_2_0.graph_x)
        slot_0_5_0(slot_0_1_0, "[speed] Graph Y", slot_0_2_0.graph_y)
        slot_0_5_0(slot_0_1_0, "[speed] Keys X", slot_0_2_0.keys_x)
        slot_0_5_0(slot_0_1_0, "[speed] Keys Y", slot_0_2_0.keys_y)
        slot_0_5_0(slot_0_1_0, "[speed] Graph width", slot_0_2_0.graph_w)
        slot_0_5_0(slot_0_1_0, "[speed] Graph height", slot_0_2_0.graph_h)
        slot_0_5_0(slot_0_1_0, "[speed] Graph max speed", slot_0_2_0.graph_max)
        slot_0_5_0(slot_0_1_0, "[speed] Graph bg alpha", slot_0_2_0.graph_bg_a)
        slot_0_5_0(slot_0_1_0, "[speed] Key size", slot_0_2_0.key_size)
        slot_0_5_0(slot_0_1_0, "[speed] Key gap", slot_0_2_0.key_gap)
        slot_0_5_0(slot_0_1_0, "[speed] Graph color", slot_0_2_0.graph_color)
        slot_0_1_0:reset()
        slot_0_1_0:reset()
end

function slot_0_6_0()
        if not slot_0_2_0.enable then
                return true
        end

        return slot_0_2_0.enable:get_value():get()
end

function slot_0_7_0(arg_4_0)
        local var_4_0 = game and game.global_vars and game.global_vars.real_time or 0

        if var_4_0 - slot_0_3_0.last_sample_time < 0.05 then
                return
        end

        slot_0_3_0.last_sample_time = var_4_0

        table.insert(slot_0_3_0.samples, arg_4_0)

        if 80 < #slot_0_3_0.samples then
                table.remove(slot_0_3_0.samples, 1)
        end
end

function slot_0_8_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
        if #slot_0_3_0.samples < 2 then
                return
        end

        local var_5_0 = false
        local var_5_1 = slot_0_2_0.graph_bg_a and slot_0_2_0.graph_bg_a:get_value():get() or 140
        local var_5_2 = var_5_0 and draw.color(250, 250, 250, var_5_1) or draw.color(18, 18, 18, var_5_1)
        local var_5_3 = var_5_0 and draw.color(215, 215, 215, 120) or draw.color(80, 80, 80, 110)
        local var_5_4 = draw.color(120, 210, 255, 230)

        if slot_0_2_0.graph_color and slot_0_2_0.graph_color.get_value then
                local var_5_5 = slot_0_2_0.graph_color:get_value()

                if var_5_5 and var_5_5.get then
                        local var_5_6 = var_5_5:get()

                        if var_5_6 then
                                var_5_4 = var_5_6
                        end
                end
        end

        local var_5_7 = draw.rect(arg_5_1, arg_5_2, arg_5_1 + arg_5_3, arg_5_2 + arg_5_4)

        if var_5_1 > 0 then
                arg_5_0:add_shadow_rect(var_5_7, 14, true, 0.14)
                arg_5_0:add_rect_filled(var_5_7, var_5_2)

                local var_5_8 = var_5_0 and draw.color(255, 255, 255, 40) or draw.color(255, 255, 255, 18)

                arg_5_0:add_rect_filled(var_5_7, var_5_8)
                arg_5_0:add_rect(var_5_7, var_5_3, 0.6, draw.outline_mode.inset)
        end

        local var_5_9 = #slot_0_3_0.samples
        local var_5_10
        local var_5_11

        for iter_5_0 = 1, var_5_9 do
                local var_5_12 = slot_0_3_0.samples[iter_5_0]
                local var_5_13 = arg_5_1 + (iter_5_0 - 1) / (var_5_9 - 1) * arg_5_3
                local var_5_14 = math.min(var_5_12 / arg_5_5, 1)
                local var_5_15 = arg_5_2 + arg_5_4 - var_5_14 * arg_5_4

                if var_5_10 then
                        arg_5_0:add_line(draw.vec2(var_5_10, var_5_11), draw.vec2(var_5_13, var_5_15), var_5_4, 2)
                end

                var_5_10 = var_5_13
                var_5_11 = var_5_15
        end
end

function slot_0_9_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6)
        local var_6_0 = slot_0_2_0.key_size and slot_0_2_0.key_size:get_value():get() or 28
        local var_6_1 = arg_6_5 or var_6_0
        local var_6_2 = arg_6_6 or var_6_0 + 6
        local var_6_3 = 7
        local var_6_4 = false
        local var_6_5 = arg_6_4 and (var_6_4 and draw.color(225, 225, 225, 170) or draw.color(90, 90, 90, 160)) or var_6_4 and draw.color(240, 240, 240, 135) or draw.color(20, 20, 20, 110)
        local var_6_6 = var_6_4 and draw.color(215, 215, 215, 120) or draw.color(80, 80, 80, 110)
        local var_6_7 = draw.rect(arg_6_1, arg_6_2, arg_6_1 + var_6_1, arg_6_2 + var_6_2)

        arg_6_0:add_rect_filled_rounded(var_6_7, var_6_5, var_6_3, draw.rounding.all)

        local var_6_8 = var_6_4 and draw.color(255, 255, 255, 28) or draw.color(255, 255, 255, 10)

        arg_6_0:add_rect_filled_rounded(var_6_7, var_6_8, var_6_3, draw.rounding.all)
        arg_6_0:add_rect_rounded(var_6_7, var_6_6, var_6_3, draw.rounding.all, 0.6, draw.outline_mode.inset)

        local var_6_9 = var_6_4 and draw.color(40, 40, 40, 240) or draw.color(235, 235, 235, 240)

        arg_6_0:add_text(draw.vec2(arg_6_1 + 6, arg_6_2 + 6), arg_6_3, var_6_9)
end

function slot_0_10_0(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
        local var_7_0 = (slot_0_2_0.key_size and slot_0_2_0.key_size:get_value():get() or 28) + 6
        local var_7_1 = 7
        local var_7_2 = false
        local var_7_3 = arg_7_4 and (var_7_2 and draw.color(225, 225, 225, 170) or draw.color(90, 90, 90, 160)) or var_7_2 and draw.color(240, 240, 240, 135) or draw.color(20, 20, 20, 110)
        local var_7_4 = var_7_2 and draw.color(215, 215, 215, 120) or draw.color(80, 80, 80, 110)
        local var_7_5 = draw.rect(arg_7_1, arg_7_2, arg_7_1 + arg_7_3, arg_7_2 + var_7_0)

        arg_7_0:add_rect_filled_rounded(var_7_5, var_7_3, var_7_1, draw.rounding.all)

        local var_7_6 = var_7_2 and draw.color(255, 255, 255, 28) or draw.color(255, 255, 255, 10)

        arg_7_0:add_rect_filled_rounded(var_7_5, var_7_6, var_7_1, draw.rounding.all)
        arg_7_0:add_rect_rounded(var_7_5, var_7_4, var_7_1, draw.rounding.all, 0.6, draw.outline_mode.inset)
        arg_7_0:add_text(draw.vec2(arg_7_1 + arg_7_3 * 0.45, arg_7_2 + 4), "-", draw.color(180, 180, 180, 200))

        return var_7_5
end

function slot_0_11_0(arg_8_0, arg_8_1)
        if not arg_8_0 or not arg_8_1 then
                return false
        end

        return arg_8_0:get_button(arg_8_1)
end

function slot_0_12_0()
        if input_bit_mask.in_moveright then
                return input_bit_mask.in_moveright
        end

        if input_bit_mask.in_right then
                return input_bit_mask.in_right
        end

        return nil
end

function slot_0_13_0(arg_10_0)
        if not arg_10_0 or not arg_10_0.get_button then
                return
        end

        if not input_bit_mask then
                return
        end

        local var_10_0 = slot_0_12_0()

        slot_0_3_0.keys.w = arg_10_0:get_button(input_bit_mask.in_forward)
        slot_0_3_0.keys.a = arg_10_0:get_button(input_bit_mask.in_moveleft)
        slot_0_3_0.keys.s = arg_10_0:get_button(input_bit_mask.in_back)
        slot_0_3_0.keys.d = var_10_0 and arg_10_0:get_button(var_10_0) or false
        slot_0_3_0.keys.sp = arg_10_0:get_button(input_bit_mask.in_jump)
        slot_0_3_0.keys.sw = arg_10_0:get_button(input_bit_mask.in_speed)
        slot_0_3_0.keys.du = arg_10_0:get_button(input_bit_mask.in_duck)
        slot_0_3_0.keys.lmb = arg_10_0:get_button(input_bit_mask.in_attack)
        slot_0_3_0.keys.rmb = arg_10_0:get_button(input_bit_mask.in_attack2)
end

if events and events.create_move and events.present_queue and entities and draw and game and input_bit_mask then
        function slot_0_14_0(arg_11_0)
                if type(pcall) == "function" then
                        local var_11_0, var_11_1 = pcall(arg_11_0)

                        if not var_11_0 then
                                print("[speed] error:", tostring(var_11_1))
                        end

                        return
                end

                arg_11_0()
        end

        events.create_move:add(function(arg_12_0)
                slot_0_14_0(function()
                        if game.engine and game.engine:in_game() and game.engine:is_connected() then
                                slot_0_3_0.last_cmd = arg_12_0

                                slot_0_13_0(arg_12_0)
                        else
                                slot_0_3_0.last_cmd = nil
                        end
                end)
        end)
        events.present_queue:add(function()
                slot_0_14_0(function()
                        if not slot_0_6_0() then
                                return
                        end

                        if not game.engine or not game.engine:in_game() or not game.engine:is_connected() then
                                slot_0_3_0.enter_time = nil

                                return
                        end

                        if not slot_0_3_0.enter_time then
                                slot_0_3_0.enter_time = game.global_vars and game.global_vars.real_time or 0
                        end

                        if (game.global_vars and game.global_vars.real_time or 0) - slot_0_3_0.enter_time < 2 then
                                return
                        end

                        slot_15_1_0 = entities.get_local_pawn()

                        if not slot_15_1_0 then
                                return
                        end

                        slot_15_2_0 = slot_15_1_0:get_abs_velocity()
                        slot_15_3_0 = 0

                        if slot_15_2_0 then
                                slot_15_3_0 = slot_15_2_0:length()
                        end

                        slot_0_7_0(slot_15_3_0)

                        slot_15_4_0 = draw.surface
                        slot_15_5_0 = draw.fonts.gui_main
                        slot_15_6_0 = draw.fonts.gui_bold

                        if not slot_15_5_0 or not slot_15_6_0 then
                                return
                        end

                        slot_15_7_0 = slot_0_2_0.graph_x and slot_0_2_0.graph_x:get_value():get() or 60
                        slot_15_8_0 = slot_0_2_0.graph_y and slot_0_2_0.graph_y:get_value():get() or 320
                        slot_15_9_0 = slot_0_2_0.keys_x and slot_0_2_0.keys_x:get_value():get() or 60
                        slot_15_10_0 = slot_0_2_0.keys_y and slot_0_2_0.keys_y:get_value():get() or 320
                        slot_15_11_0 = slot_0_2_0.graph_w and slot_0_2_0.graph_w:get_value():get() or 220
                        slot_15_12_0 = slot_0_2_0.graph_h and slot_0_2_0.graph_h:get_value():get() or 60
                        slot_15_13_0 = slot_0_2_0.graph_max and slot_0_2_0.graph_max:get_value():get() or 320
                        slot_15_14_0 = slot_15_7_0
                        slot_15_15_0 = slot_15_8_0
                        slot_15_16_0 = slot_15_9_0
                        slot_15_17_0 = slot_15_10_0

                        if slot_0_2_0.show_speed and slot_0_2_0.show_speed:get_value():get() then
                                slot_15_4_0.font = slot_15_6_0
                                slot_15_18_6 = false
                                slot_15_19_1 = slot_15_18_6 and draw.color(20, 20, 20, 245) or draw.color(255, 255, 255, 245)

                                slot_15_4_0:add_text(draw.vec2(slot_15_14_0, slot_15_15_0 - 22), string.format("SPEED %.0f", slot_15_3_0), slot_15_19_1)
                        end

                        slot_15_4_0.font = slot_15_5_0
                        slot_15_18_5 = slot_15_17_0

                        if slot_0_2_0.show_keys and slot_0_2_0.show_keys:get_value():get() then
                                slot_15_19_0 = slot_0_3_0.keys.w
                                slot_15_20_0 = slot_0_3_0.keys.a
                                slot_15_21_0 = slot_0_3_0.keys.s
                                slot_15_22_0 = slot_0_3_0.keys.d
                                slot_15_23_0 = slot_0_3_0.keys.sp
                                slot_15_24_0 = slot_0_3_0.keys.sw
                                slot_15_25_0 = slot_0_3_0.keys.du
                                slot_15_26_0 = slot_0_3_0.keys.lmb
                                slot_15_27_0 = slot_0_3_0.keys.rmb
                                slot_15_28_0 = slot_0_2_0.key_size and slot_0_2_0.key_size:get_value():get() or 28
                                slot_15_29_0 = slot_0_2_0.key_gap and slot_0_2_0.key_gap:get_value():get() or 6
                                slot_15_30_0 = slot_15_28_0 * 3 + slot_15_29_0 * 2
                                slot_15_31_0 = math.floor(slot_15_28_0 * 1.7 + 0.5)

                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + slot_15_28_0 + slot_15_29_0, slot_15_18_5, "W", slot_15_19_0)

                                slot_15_18_4 = slot_15_18_5 + slot_15_28_0 + slot_15_29_0

                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + 0, slot_15_18_4, "A", slot_15_20_0)
                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + slot_15_28_0 + slot_15_29_0, slot_15_18_4, "S", slot_15_21_0)
                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + (slot_15_28_0 + slot_15_29_0) * 2, slot_15_18_4, "D", slot_15_22_0)

                                slot_15_18_3 = slot_15_18_4 + slot_15_28_0 + slot_15_29_0

                                slot_0_10_0(slot_15_4_0, slot_15_16_0, slot_15_18_3, slot_15_30_0, slot_15_23_0)

                                slot_15_18_2 = slot_15_18_3 + slot_15_28_0 + slot_15_29_0

                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + 0, slot_15_18_2, "LMB", slot_15_26_0, slot_15_31_0, slot_15_28_0 + 6)
                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + slot_15_31_0 + slot_15_29_0, slot_15_18_2, "RMB", slot_15_27_0, slot_15_31_0, slot_15_28_0 + 6)

                                slot_15_18_1 = slot_15_18_2 + slot_15_28_0 + slot_15_29_0

                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + 0, slot_15_18_1, "CTRL", slot_15_25_0, slot_15_31_0, slot_15_28_0 + 6)
                                slot_0_9_0(slot_15_4_0, slot_15_16_0 + slot_15_31_0 + slot_15_29_0, slot_15_18_1, "SHIFT", slot_15_24_0, slot_15_31_0, slot_15_28_0 + 6)

                                slot_15_18_0 = slot_15_18_1 + slot_15_28_0 + slot_15_29_0
                        end

                        if slot_0_2_0.show_graph and slot_0_2_0.show_graph:get_value():get() then
                                slot_0_8_0(slot_15_4_0, slot_15_14_0, slot_15_15_0, slot_15_11_0, slot_15_12_0, slot_15_13_0)
                        end
                end)
        end)
else
        print("[speed] missing dependencies, disabled")
end
