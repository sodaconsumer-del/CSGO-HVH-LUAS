--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("speed_enable"))
slot_0_1_0 = gui.checkbox(gui.control_id("speed_vel"))
slot_0_2_0 = gui.checkbox(gui.control_id("speed_jump"))
slot_0_3_0 = gui.checkbox(gui.control_id("fade_on_move"))
slot_0_4_0 = gui.color_picker(gui.control_id("speed_color"))
slot_0_5_0 = gui.ctx:find("lua>elements a")

slot_0_5_0:add(gui.make_control("Enable display", slot_0_0_0))
slot_0_5_0:add(gui.make_control("Show velocity", slot_0_1_0))
slot_0_5_0:add(gui.make_control("Show takeoff", slot_0_2_0))
slot_0_5_0:add(gui.make_control("Fade when moving", slot_0_3_0))
slot_0_5_0:add(gui.make_control("Base color", slot_0_4_0))
slot_0_5_0:reset()

slot_0_6_0 = 0
slot_0_7_0 = 0
slot_0_8_0 = 255

function slot_0_9_0(arg_1_0)
        local var_1_0 = entities.get_local_pawn()

        if not var_1_0 then
                return
        end

        local var_1_1 = var_1_0:get_abs_velocity()

        if not var_1_1 then
                return
        end

        local var_1_2 = math.sqrt(var_1_1.x * var_1_1.x + var_1_1.y * var_1_1.y)

        if slot_0_7_0 <= 0 and var_1_1.z > 0 then
                slot_0_6_0 = var_1_2
        end

        slot_0_7_0 = var_1_1.z
end

events.create_move:add(slot_0_9_0)

function slot_0_10_0()
        if not slot_0_0_0:get_value():get() then
                return
        end

        local var_2_0 = entities.get_local_pawn()

        if not var_2_0 then
                return
        end

        local var_2_1 = draw.surface
        local var_2_2, var_2_3 = game.engine:get_screen_size()
        local var_2_4 = var_2_0:get_abs_velocity()

        if not var_2_4 then
                return
        end

        local var_2_5 = math.sqrt(var_2_4.x * var_2_4.x + var_2_4.y * var_2_4.y)
        local var_2_6 = var_2_5 > 5

        if slot_0_3_0:get_value():get() then
                if var_2_6 then
                        slot_0_8_0 = math.min(slot_0_8_0 + 10, 255)
                else
                        slot_0_8_0 = math.max(slot_0_8_0 - 10, 0)
                end
        else
                slot_0_8_0 = 255
        end

        if slot_0_8_0 <= 0 then
                return
        end

        local var_2_7 = slot_0_4_0:get_value():get()
        local var_2_8 = draw.color(var_2_7:get_r(), var_2_7:get_g(), var_2_7:get_b(), slot_0_8_0)

        var_2_1.font = draw.fonts.gui_title

        local var_2_9 = var_2_3 / 2 + 200

        if slot_0_1_0:get_value():get() then
                local var_2_10 = string.format("%.0f", var_2_5)
                local var_2_11 = var_2_1.font:get_text_size(var_2_10)

                var_2_1:add_text(draw.vec2(var_2_2 / 2 - var_2_11.x / 2, var_2_9), var_2_10, var_2_8)

                var_2_9 = var_2_9 + 40
        end

        if slot_0_2_0:get_value():get() then
                local var_2_12 = string.format("(%.0f)", slot_0_6_0)
                local var_2_13 = var_2_1.font:get_text_size(var_2_12)

                var_2_1:add_text(draw.vec2(var_2_2 / 2 - var_2_13.x / 2, var_2_9), var_2_12, var_2_8)
        end
end

events.present_queue:add(slot_0_10_0)
