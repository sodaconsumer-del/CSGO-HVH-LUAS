--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")

slot_0_0_0:add(gui.label(gui.control_id("h_delays"), "--- Delays & Core ---", nil, true))

slot_0_1_0 = gui.slider(gui.control_id("kd"), 0, 2, {
        "%.2fs"
}, 0.01)

slot_0_0_0:add(gui.make_control("Kill Delay", slot_0_1_0))
slot_0_1_0:get_value():set(0.51)

slot_0_2_0 = gui.slider(gui.control_id("akd"), 0, 5, {
        "%.2fs"
}, 0.01)

slot_0_0_0:add(gui.make_control("After Kill Delay", slot_0_2_0))
slot_0_2_0:get_value():set(1.11)

slot_0_3_0 = gui.checkbox(gui.control_id("pen"))

slot_0_0_0:add(gui.make_control("Allow Penetration", slot_0_3_0))
slot_0_0_0:add(gui.label(gui.control_id("h_visuals"), "--- Status Indicator ---", nil, true))

slot_0_4_0 = gui.checkbox(gui.control_id("stat"))

slot_0_0_0:add(gui.make_control("Enable Status", slot_0_4_0))
slot_0_4_0:set_value(true)

slot_0_5_0 = gui.slider(gui.control_id("st_x"), -2000, 2000, {
        "X: %.0f"
}, 10)
slot_0_6_0 = gui.make_control("Status X Offset", slot_0_5_0)

slot_0_0_0:add(slot_0_6_0)

slot_0_7_0 = gui.slider(gui.control_id("st_y"), -2000, 2000, {
        "Y: %.0f"
}, 10)
slot_0_8_0 = gui.make_control("Status Y Offset", slot_0_7_0)

slot_0_0_0:add(slot_0_8_0)
slot_0_0_0:add(gui.label(gui.control_id("h_crosshair"), "--- Crosshair Indicators ---", nil, true))

slot_0_9_0 = gui.checkbox(gui.control_id("cross"))

slot_0_0_0:add(gui.make_control("Enable Crosshair", slot_0_9_0))
slot_0_9_0:set_value(true)

slot_0_10_0 = gui.slider(gui.control_id("cr_x"), -2000, 2000, {
        "X: %.0f"
}, 10)
slot_0_11_0 = gui.make_control("Crosshair X Offset", slot_0_10_0)

slot_0_0_0:add(slot_0_11_0)

slot_0_12_0 = gui.slider(gui.control_id("cr_y"), -2000, 2000, {
        "Y: %.0f"
}, 10)
slot_0_13_0 = gui.make_control("Crosshair Y Offset", slot_0_12_0)

slot_0_0_0:add(slot_0_13_0)
slot_0_0_0:add(gui.label(gui.control_id("h_fov"), "--- FOV Circle ---", nil, true))

slot_0_14_0 = gui.checkbox(gui.control_id("fov_en"))

slot_0_0_0:add(gui.make_control("Enable FOV Circle", slot_0_14_0))

slot_0_15_0 = gui.color_picker(gui.control_id("fov_col"))
slot_0_16_0 = gui.make_control("Circle Color", slot_0_15_0)

slot_0_0_0:add(slot_0_16_0)
slot_0_15_0:get_value():set(draw.color(255, 255, 255, 100))

slot_0_17_0 = 0

function slot_0_18_0()
        local var_1_0 = slot_0_4_0:get_value():get()

        slot_0_6_0:set_visible(var_1_0)
        slot_0_8_0:set_visible(var_1_0)

        local var_1_1 = slot_0_9_0:get_value():get()

        slot_0_11_0:set_visible(var_1_1)
        slot_0_13_0:set_visible(var_1_1)
        slot_0_16_0:set_visible(slot_0_14_0:get_value():get())

        slot_0_17_0 = game.global_vars.real_time + 2
end

slot_0_4_0:add_callback(slot_0_18_0)
slot_0_9_0:add_callback(slot_0_18_0)
slot_0_14_0:add_callback(slot_0_18_0)
slot_0_5_0:add_callback(slot_0_18_0)
slot_0_7_0:add_callback(slot_0_18_0)
slot_0_10_0:add_callback(slot_0_18_0)
slot_0_12_0:add_callback(slot_0_18_0)
slot_0_18_0()
slot_0_0_0:reset()

slot_0_19_0 = ray_t()
slot_0_20_0 = draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center)
slot_0_21_0 = draw.text_params.with_vh(draw.text_alignment.left, draw.text_alignment.top)
slot_0_22_0 = draw.color.white()
slot_0_23_0 = draw.color(100, 255, 100)
slot_0_24_0 = draw.color(255, 100, 100)
slot_0_25_0 = draw.color(255, 200, 50)
slot_0_26_0 = draw.color(180, 100, 255)
slot_0_27_0 = draw.color(100, 50, 255)
slot_0_28_0 = draw.color(0, 0, 0, 200)
slot_0_29_0 = {}
slot_0_30_0 = {}
slot_0_31_0 = {}
slot_0_32_0 = -999
slot_0_33_0 = false
slot_0_34_0 = gui.ctx:find("rage>aimbot>general>autofire")
slot_0_35_0 = gui.ctx:find("rage>aimbot>general>penetration")
slot_0_36_0 = gui.ctx:find("rage>aimbot>general>aimbot")
slot_0_37_0 = gui.ctx:find("legit>general>enabled")
slot_0_38_0 = gui.ctx:find("rage>aimbot>general>maximum fov")
slot_0_39_0 = gui.ctx:find("rage>aimbot>nospread")
slot_0_40_0 = gui.ctx:find("rage>aimbot>nospread>settings>force")

function slot_0_41_0()
        slot_0_29_0 = {}
        slot_0_30_0 = {}
        slot_0_31_0 = {}
        slot_0_32_0 = -999
        slot_0_33_0 = false
end

events.present_queue:add(function()
        slot_3_1_0 = game.global_vars.real_time < slot_0_17_0

        if not game.engine:in_game() or not slot_0_34_0 then
                slot_0_41_0()

                if not slot_3_1_0 then
                        return
                end
        end

        slot_3_2_0 = entities.get_local_pawn()

        if (not slot_3_2_0 or not slot_3_2_0:is_alive()) and not slot_3_1_0 then
                if slot_0_34_0 then
                        slot_0_34_0:set_value(false)
                end

                return
        end

        slot_3_3_0 = draw.surface
        slot_3_3_0.font = draw.fonts.gui_main
        slot_3_4_0, slot_3_5_0 = game.engine:get_screen_size()

        if slot_3_4_0 <= 0 then
                return
        end

        slot_3_6_0 = 250 + slot_0_5_0:get_value():get()
        slot_3_7_0 = slot_3_5_0 / 2 + 100 + slot_0_7_0:get_value():get()
        slot_3_8_0 = slot_3_4_0 / 2 + slot_0_10_0:get_value():get()
        slot_3_9_0 = slot_3_5_0 / 2 + slot_0_12_0:get_value():get()

        if slot_0_14_0:get_value():get() and slot_0_38_0 then
                slot_3_10_1 = slot_0_38_0:get_value():get()

                if slot_3_10_1 > 0 then
                        slot_3_11_1 = math.tan(math.rad(slot_3_10_1 / 2)) / math.tan(math.rad(45)) * slot_3_4_0 / 2

                        slot_3_3_0:add_circle(draw.vec2(slot_3_4_0 / 2, slot_3_5_0 / 2), slot_3_11_1, slot_0_15_0:get_value():get(), 64)
                end
        end

        if slot_0_35_0 then
                slot_0_35_0:set_value(slot_0_3_0:get_value():get())
        end

        function slot_3_10_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
                slot_3_3_0:add_text(draw.vec2(arg_4_0 + 1, arg_4_1 + 1), arg_4_2, slot_0_28_0, arg_4_4 or slot_0_21_0)
                slot_3_3_0:add_text(draw.vec2(arg_4_0, arg_4_1), arg_4_2, arg_4_3, arg_4_4 or slot_0_21_0)
        end

        function slot_3_11_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
                if not slot_0_9_0:get_value():get() and not slot_3_1_0 then
                        return
                end

                local var_5_0 = 36
                local var_5_1 = 2
                local var_5_2 = slot_3_8_0 - var_5_0 / 2
                local var_5_3 = slot_3_9_0 + 12

                slot_3_3_0.font = draw.fonts.gui_bold

                slot_3_10_0(var_5_2 - 11, var_5_3, arg_5_3, arg_5_1, slot_0_20_0)

                slot_3_3_0.font = draw.fonts.gui_main

                local var_5_4 = arg_5_0 <= 0 and slot_3_1_0 and 0.5 or arg_5_0

                if var_5_4 <= 0 then
                        return
                end

                slot_3_3_0:add_line(draw.vec2(var_5_2 - 1, var_5_3), draw.vec2(var_5_2 + var_5_0 + 1, var_5_3), draw.color(0, 0, 0, 200), var_5_1 + 2)
                slot_3_3_0:add_line_multicolor(draw.vec2(var_5_2, var_5_3), draw.vec2(var_5_2 + var_5_0 * var_5_4, var_5_3), arg_5_1, arg_5_2, var_5_1)
        end

        function slot_3_12_0(arg_6_0, arg_6_1, arg_6_2)
                if not slot_0_4_0:get_value():get() and not slot_3_1_0 then
                        return
                end

                slot_3_10_0(slot_3_6_0, slot_3_7_0, arg_6_0, arg_6_1)

                local var_6_0 = slot_3_7_0 + 14

                if slot_0_36_0 and slot_0_36_0:get_hotkey_state() then
                        slot_3_10_0(slot_3_6_0, var_6_0, "RAGE", slot_0_22_0)

                        var_6_0 = var_6_0 + 14
                end

                if slot_0_37_0 and slot_0_37_0:get_hotkey_state() then
                        slot_3_10_0(slot_3_6_0, var_6_0, "LEGIT", slot_0_22_0)

                        var_6_0 = var_6_0 + 14
                end

                local var_6_1 = false

                if slot_0_39_0 then
                        local var_6_2 = slot_0_39_0:get_value():get()

                        if type(var_6_2) == "boolean" then
                                var_6_1 = var_6_2
                        elseif type(var_6_2) == "userdata" and var_6_2.none then
                                var_6_1 = not var_6_2:none()
                        end
                end

                if var_6_1 then
                        local var_6_3 = false

                        if slot_0_40_0 then
                                local var_6_4 = slot_0_40_0:get_value():get()

                                if type(var_6_4) == "boolean" then
                                        var_6_3 = var_6_4
                                elseif type(var_6_4) == "userdata" and var_6_4.none then
                                        var_6_3 = not var_6_4:none()
                                end
                        end

                        slot_3_10_0(slot_3_6_0, var_6_0, var_6_3 and "NS Force" or "NS", slot_0_22_0)

                        var_6_0 = var_6_0 + 14
                end

                if slot_0_35_0 and slot_0_35_0:get_value():get() then
                        slot_3_10_0(slot_3_6_0, var_6_0, "AWALL", slot_0_22_0)

                        var_6_0 = var_6_0 + 14
                end

                local var_6_5 = arg_6_2 <= 0 and slot_3_1_0 and 0.5 or arg_6_2

                if var_6_5 > 0 then
                        local var_6_6 = 180
                        local var_6_7 = var_6_0 + 8

                        slot_3_3_0:add_line(draw.vec2(slot_3_6_0 - 1, var_6_7), draw.vec2(slot_3_6_0 + var_6_6 + 1, var_6_7), draw.color(0, 0, 0, 150), 5)
                        slot_3_3_0:add_line_multicolor(draw.vec2(slot_3_6_0, var_6_7), draw.vec2(slot_3_6_0 + var_6_6 * var_6_5, var_6_7), slot_0_26_0, slot_0_27_0, 3)
                end
        end

        slot_3_13_0 = slot_0_1_0:get_value():get()
        slot_3_14_0 = slot_0_2_0:get_value():get()
        slot_3_15_0 = game.global_vars.cur_time - slot_0_32_0

        if slot_3_15_0 < slot_3_14_0 then
                slot_0_34_0:set_value(false)

                slot_3_17_1 = slot_3_14_0 - slot_3_15_0

                slot_3_12_0(string.format("Status: Waiting %.1fs", slot_3_17_1), slot_0_24_0, slot_3_17_1 / slot_3_14_0)
                slot_3_11_0(slot_3_17_1 / slot_3_14_0, slot_0_24_0, slot_0_25_0, "A")
        elseif slot_3_2_0 and slot_3_2_0:is_alive() then
                slot_3_17_0 = slot_3_2_0:get_eye_pos()
                slot_3_18_0 = 0
                slot_3_19_0 = 0
                slot_3_20_0 = 0

                entities.players:for_each(function(arg_7_0)
                        local var_7_0 = arg_7_0.entity

                        if not var_7_0 or not var_7_0:is_alive() or not var_7_0:is_enemy() or not var_7_0:should_draw() then
                                return
                        end

                        local var_7_1 = var_7_0:get_name()
                        local var_7_2 = var_7_0:get_eye_pos()

                        if math.world_to_screen(var_7_2) then
                                if game.global_vars.cur_time - (slot_0_30_0[var_7_1] or 0) > 0.1 then
                                        local var_7_3 = game.physics_query_interface:trace_ray(slot_0_19_0, slot_3_17_0, var_7_2)

                                        slot_0_31_0[var_7_1] = var_7_3 and var_7_3.fraction >= 0.99
                                        slot_0_30_0[var_7_1] = game.global_vars.cur_time
                                end
                        else
                                slot_0_31_0[var_7_1] = false
                        end

                        if slot_0_31_0[var_7_1] then
                                slot_3_18_0 = slot_3_18_0 + 1
                                slot_0_29_0[var_7_1] = slot_0_29_0[var_7_1] or game.global_vars.cur_time

                                local var_7_4 = game.global_vars.cur_time - slot_0_29_0[var_7_1]

                                if var_7_4 > slot_3_20_0 then
                                        slot_3_20_0 = var_7_4
                                end

                                if var_7_4 >= slot_3_13_0 then
                                        slot_3_19_0 = slot_3_19_0 + 1
                                end

                                local var_7_5 = math.world_to_screen(math.vec3(var_7_2.x, var_7_2.y, var_7_2.z + 10))

                                if var_7_5 then
                                        slot_3_10_0(var_7_5.x, var_7_5.y, string.format("%.1fs", var_7_4), slot_0_22_0, slot_0_20_0)
                                end
                        else
                                slot_0_29_0[var_7_1] = nil
                        end
                end)

                if slot_3_18_0 > 0 then
                        if slot_3_19_0 == slot_3_18_0 then
                                slot_0_33_0 = true

                                slot_0_34_0:set_value(true)
                                slot_3_12_0("Status: Firing", slot_0_23_0, 1)
                                slot_3_11_0(1, slot_0_23_0, slot_0_26_0, "F")
                        else
                                slot_0_33_0 = false

                                slot_0_34_0:set_value(false)

                                slot_3_21_0 = slot_3_13_0 - slot_3_20_0

                                slot_3_12_0(string.format("Status: Delaying %.1fs", math.max(0, slot_3_21_0)), slot_0_25_0, math.max(0, slot_3_21_0) / slot_3_13_0)
                                slot_3_11_0(1 - math.max(0, slot_3_21_0) / slot_3_13_0, slot_0_25_0, slot_0_23_0, "D")
                        end
                else
                        slot_0_33_0 = false

                        slot_0_34_0:set_value(false)
                        slot_3_12_0("Status: Idle", slot_0_22_0, 0)

                        if slot_3_1_0 then
                                slot_3_11_0(0, slot_0_22_0, slot_0_22_0, "X")
                        end
                end
        elseif slot_3_1_0 then
                slot_3_12_0("Status: Position Preview", slot_0_22_0, 0)
                slot_3_11_0(0, slot_0_22_0, slot_0_22_0, "X")
        end
end)
events.event:add(function(arg_8_0)
        local var_8_0 = arg_8_0:get_name()

        if var_8_0 == "player_death" and slot_0_33_0 then
                slot_0_32_0 = game.global_vars.cur_time
                slot_0_33_0 = false

                if slot_0_34_0 then
                        slot_0_34_0:set_value(false)
                end
        elseif var_8_0 == "round_start" or var_8_0 == "game_newmap" then
                slot_0_41_0()
        end
end)
mods.events:add_listener("player_death")
