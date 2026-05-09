--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "https://discord.gg/8jQVnmnwwE"
slot_0_1_0 = {
        m_boneArray = 128,
        m_modelState = 352,
        m_vecAbsOrigin = 208,
        m_pGameSceneNode = 824
}
slot_0_2_0 = nil

if not __hat_shell32_defined then
        ffi.cdef("        typedef void* HWND_SHELL;\n        typedef const char* LPCSTR_SHELL;\n        typedef void* (__stdcall *ShellExecuteA_t)(HWND_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, int);\n    ")

        __hat_shell32_defined = true
end

slot_0_3_0 = utils.find_export("shell32.dll", "ShellExecuteA")

if slot_0_3_0 then
        slot_0_2_0 = ffi.cast("ShellExecuteA_t", slot_0_3_0)
end

function slot_0_4_0(arg_1_0)
        if slot_0_2_0 then
                slot_0_2_0(nil, "open", arg_1_0, nil, nil, 1)
        end
end

slot_0_5_0 = gui.ctx:find("lua>elements a")
slot_0_6_0 = {
        hat_enable = gui.checkbox(gui.control_id("rf_hat_enable")),
        hat_show_settings = gui.checkbox(gui.control_id("rf_hat_show_settings")),
        hat_firstperson = gui.checkbox(gui.control_id("rf_hat_firstperson")),
        hat_type = gui.combo_box(gui.control_id("rf_hat_type"))
}

slot_0_6_0.hat_type:add(gui.selectable(gui.control_id("rf_hat_china"), "China Hat"))
slot_0_6_0.hat_type:add(gui.selectable(gui.control_id("rf_hat_halo"), "Angel Halo"))

slot_0_6_0.hat_rainbow = gui.checkbox(gui.control_id("rf_hat_rainbow"))
slot_0_6_0.hat_color_mode = gui.combo_box(gui.control_id("rf_hat_color_mode"))

slot_0_6_0.hat_color_mode:add(gui.selectable(gui.control_id("rf_hat_cm_2"), "2 Colors"))
slot_0_6_0.hat_color_mode:add(gui.selectable(gui.control_id("rf_hat_cm_3"), "3 Colors"))

slot_0_6_0.hat_speed = gui.slider(gui.control_id("rf_hat_speed"), 1, 10, {
        "%.0f"
})
slot_0_6_0.hat_color = gui.color_picker(gui.control_id("rf_hat_color"))
slot_0_6_0.hat_color2 = gui.color_picker(gui.control_id("rf_hat_color2"))
slot_0_6_0.hat_color3 = gui.color_picker(gui.control_id("rf_hat_color3"))
slot_0_6_0.hat_width = gui.slider(gui.control_id("rf_hat_width"), 3, 30, {
        "%.0f"
})
slot_0_6_0.hat_height = gui.slider(gui.control_id("rf_hat_height"), 0, 25, {
        "%.0f"
})
slot_0_6_0.hat_offset_x = gui.slider(gui.control_id("rf_hat_offset_x"), -30, 30, {
        "%.1f"
})
slot_0_6_0.hat_offset_y = gui.slider(gui.control_id("rf_hat_offset_y"), -30, 30, {
        "%.1f"
})
slot_0_6_0.hat_offset_z = gui.slider(gui.control_id("rf_hat_offset_z"), -30, 30, {
        "%.1f"
})
slot_0_6_0.hat_reset = gui.button(gui.control_id("rf_hat_reset"), "Reset")
slot_0_6_0.discord = gui.button(gui.control_id("rf_discord"), "Discord")

slot_0_6_0.hat_width:get_value():set(10)
slot_0_6_0.hat_height:get_value():set(8)
slot_0_6_0.hat_offset_x:get_value():set(0)
slot_0_6_0.hat_offset_y:get_value():set(0)
slot_0_6_0.hat_offset_z:get_value():set(0)
slot_0_6_0.hat_speed:get_value():set(3)
slot_0_6_0.hat_color:get_value():set(draw.color(255, 0, 0, 255))
slot_0_6_0.hat_color2:get_value():set(draw.color(0, 255, 0, 255))
slot_0_6_0.hat_color3:get_value():set(draw.color(0, 0, 255, 255))
slot_0_6_0.hat_reset:add_callback(function()
        slot_0_6_0.hat_width:get_value():set(10)
        slot_0_6_0.hat_height:get_value():set(8)
        slot_0_6_0.hat_offset_x:get_value():set(0)
        slot_0_6_0.hat_offset_y:get_value():set(0)
        slot_0_6_0.hat_offset_z:get_value():set(0)
        slot_0_6_0.hat_speed:get_value():set(3)
end)
slot_0_6_0.discord:add_callback(function()
        slot_0_4_0(slot_0_0_0)
end)

slot_0_7_0 = {
        hat_enable = gui.make_control("Hat", slot_0_6_0.hat_enable)
}

slot_0_5_0:add(slot_0_7_0.hat_enable)
slot_0_5_0:reset()

slot_0_7_0.discord = gui.make_control("", slot_0_6_0.discord)

slot_0_5_0:add(slot_0_7_0.discord)
slot_0_5_0:reset()

slot_0_7_0.hat_show_settings = gui.make_control("Show Settings", slot_0_6_0.hat_show_settings)

slot_0_5_0:add(slot_0_7_0.hat_show_settings)
slot_0_5_0:reset()

slot_0_7_0.hat_firstperson = gui.make_control("First Person", slot_0_6_0.hat_firstperson)

slot_0_5_0:add(slot_0_7_0.hat_firstperson)
slot_0_5_0:reset()

slot_0_7_0.hat_type = gui.make_control("Type", slot_0_6_0.hat_type)

slot_0_5_0:add(slot_0_7_0.hat_type)
slot_0_5_0:reset()

slot_0_7_0.hat_rainbow = gui.make_control("Rainbow", slot_0_6_0.hat_rainbow)

slot_0_5_0:add(slot_0_7_0.hat_rainbow)
slot_0_5_0:reset()

slot_0_7_0.hat_color_mode = gui.make_control("Color Mode", slot_0_6_0.hat_color_mode)

slot_0_5_0:add(slot_0_7_0.hat_color_mode)
slot_0_5_0:reset()

slot_0_7_0.hat_speed = gui.make_control("Speed", slot_0_6_0.hat_speed)

slot_0_5_0:add(slot_0_7_0.hat_speed)
slot_0_5_0:reset()

slot_0_7_0.hat_color = gui.make_control("Color 1", slot_0_6_0.hat_color)

slot_0_5_0:add(slot_0_7_0.hat_color)
slot_0_5_0:reset()

slot_0_7_0.hat_color2 = gui.make_control("Color 2", slot_0_6_0.hat_color2)

slot_0_5_0:add(slot_0_7_0.hat_color2)
slot_0_5_0:reset()

slot_0_7_0.hat_color3 = gui.make_control("Color 3", slot_0_6_0.hat_color3)

slot_0_5_0:add(slot_0_7_0.hat_color3)
slot_0_5_0:reset()

slot_0_7_0.hat_width = gui.make_control("Width", slot_0_6_0.hat_width)

slot_0_5_0:add(slot_0_7_0.hat_width)
slot_0_5_0:reset()

slot_0_7_0.hat_height = gui.make_control("Height", slot_0_6_0.hat_height)

slot_0_5_0:add(slot_0_7_0.hat_height)
slot_0_5_0:reset()

slot_0_7_0.hat_offset_x = gui.make_control("Offset X", slot_0_6_0.hat_offset_x)

slot_0_5_0:add(slot_0_7_0.hat_offset_x)
slot_0_5_0:reset()

slot_0_7_0.hat_offset_y = gui.make_control("Offset Y", slot_0_6_0.hat_offset_y)

slot_0_5_0:add(slot_0_7_0.hat_offset_y)
slot_0_5_0:reset()

slot_0_7_0.hat_offset_z = gui.make_control("Offset Z", slot_0_6_0.hat_offset_z)

slot_0_5_0:add(slot_0_7_0.hat_offset_z)
slot_0_5_0:reset()

slot_0_7_0.hat_reset = gui.make_control("", slot_0_6_0.hat_reset)

slot_0_5_0:add(slot_0_7_0.hat_reset)
slot_0_5_0:reset()

function slot_0_8_0()
        local var_4_0 = slot_0_6_0.hat_enable:get_value():get()
        local var_4_1 = slot_0_6_0.hat_show_settings:get_value():get()
        local var_4_2 = slot_0_6_0.hat_rainbow:get_value():get()
        local var_4_3 = slot_0_6_0.hat_color_mode:get_value():get():get_raw() == 2

        slot_0_7_0.hat_enable:set_visible(true)
        slot_0_7_0.discord:set_visible(true)
        slot_0_7_0.hat_show_settings:set_visible(var_4_0)
        slot_0_7_0.hat_firstperson:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_type:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_rainbow:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_color_mode:set_visible(var_4_0 and var_4_1 and not var_4_2)
        slot_0_7_0.hat_speed:set_visible(var_4_0 and var_4_1 and var_4_2)
        slot_0_7_0.hat_color:set_visible(var_4_0 and var_4_1 and not var_4_2)
        slot_0_7_0.hat_color2:set_visible(var_4_0 and var_4_1 and not var_4_2)
        slot_0_7_0.hat_color3:set_visible(var_4_0 and var_4_1 and not var_4_2 and var_4_3)
        slot_0_7_0.hat_width:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_height:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_offset_x:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_offset_y:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_offset_z:set_visible(var_4_0 and var_4_1)
        slot_0_7_0.hat_reset:set_visible(var_4_0 and var_4_1)
end

events.present_queue:add(function()
        slot_0_8_0()

        if not slot_0_6_0.hat_enable:get_value():get() then
                return
        end

        slot_5_0_0 = draw.surface

        if not slot_5_0_0 then
                return
        end

        slot_5_1_0 = gui.ctx:find("visuals>misc>local>thirdperson")
        slot_5_2_0 = false

        if slot_5_1_0 and slot_5_1_0.get_value then
                slot_5_3_1 = slot_5_1_0:get_value()

                if slot_5_3_1 and slot_5_3_1.get then
                        slot_5_2_0 = slot_5_3_1:get()
                end
        end

        slot_5_3_0 = gui.ctx:find("visuals>misc>local>thirdperson>settings>disable on grenade")
        slot_5_4_0 = false

        if slot_5_3_0 and slot_5_3_0.get_value then
                slot_5_5_1 = slot_5_3_0:get_value()

                if slot_5_5_1 and slot_5_5_1.get then
                        slot_5_4_0 = slot_5_5_1:get()
                end
        end

        slot_5_5_0 = false
        slot_5_6_0 = entities.get_local_pawn()

        if slot_5_6_0 and slot_5_6_0:is_alive() then
                slot_5_7_1 = slot_5_6_0:get_active_weapon()

                if slot_5_7_1 and slot_5_7_1:get_type() == 9 then
                        slot_5_5_0 = true
                end
        end

        slot_5_7_0 = slot_0_6_0.hat_firstperson:get_value():get()
        slot_5_8_0 = false

        if slot_5_7_0 then
                slot_5_8_0 = true
        elseif slot_5_2_0 then
                slot_5_8_0 = (not slot_5_4_0 or not slot_5_5_0 or false) and true
        end

        if not slot_5_8_0 then
                return
        end

        slot_5_9_0 = entities.get_local_pawn()

        if not slot_5_9_0 or not slot_5_9_0:is_alive() then
                return
        end

        slot_5_10_0 = slot_0_6_0.hat_type:get_value():get():get_raw()
        slot_5_11_0 = slot_5_10_0 == 0 or slot_5_10_0 == 1
        slot_5_12_0 = slot_5_10_0 == 2
        slot_5_13_0 = slot_0_6_0.hat_rainbow:get_value():get()
        slot_5_14_0 = slot_0_6_0.hat_speed:get_value():get()
        slot_5_15_0 = slot_0_6_0.hat_color:get_value():get()
        slot_5_16_0 = slot_0_6_0.hat_color2:get_value():get()
        slot_5_17_0 = slot_0_6_0.hat_color3:get_value():get()
        slot_5_18_0 = slot_5_15_0:get_a()
        slot_5_19_0 = slot_0_6_0.hat_width:get_value():get()
        slot_5_20_0 = slot_0_6_0.hat_height:get_value():get()
        slot_5_21_0 = slot_0_6_0.hat_offset_x:get_value():get()
        slot_5_22_0 = slot_0_6_0.hat_offset_y:get_value():get()
        slot_5_23_0 = slot_0_6_0.hat_offset_z:get_value():get()
        slot_5_24_1 = nil
        slot_5_25_1 = nil
        slot_5_26_1 = nil
        slot_5_27_0 = false

        if ffi then
                slot_5_28_3 = nil
                slot_5_29_2 = ffi.cast("uintptr_t", ffi.cast("void*", slot_5_9_0))
                slot_5_30_1 = ffi.cast("uintptr_t*", slot_5_29_2)[0]

                if slot_5_30_1 and slot_5_30_1 > 268435456 then
                        slot_5_28_3 = tonumber(slot_5_30_1)
                end

                if slot_5_28_3 then
                        slot_5_31_1 = ffi.cast("uintptr_t*", slot_5_28_3 + slot_0_1_0.m_pGameSceneNode)[0]

                        if slot_5_31_1 and slot_5_31_1 ~= 0 then
                                slot_5_32_1 = slot_0_1_0.m_modelState + slot_0_1_0.m_boneArray
                                slot_5_33_1 = ffi.cast("uintptr_t*", slot_5_31_1 + slot_5_32_1)[0]

                                if slot_5_33_1 and slot_5_33_1 ~= 0 and slot_5_33_1 > 65536 then
                                        slot_5_34_2 = 6
                                        slot_5_35_2 = slot_5_34_2 * 32
                                        slot_5_36_1 = ffi.cast("float*", slot_5_33_1 + slot_5_35_2)[0]
                                        slot_5_37_1 = ffi.cast("float*", slot_5_33_1 + slot_5_35_2 + 4)[0]
                                        slot_5_38_0 = ffi.cast("float*", slot_5_33_1 + slot_5_35_2 + 8)[0]
                                        slot_5_39_1 = slot_5_9_0:get_abs_origin()

                                        if slot_5_39_1 and slot_5_36_1 and slot_5_37_1 and slot_5_38_0 then
                                                slot_5_40_1 = math.abs(slot_5_36_1 - slot_5_39_1.x)
                                                slot_5_41_1 = math.abs(slot_5_37_1 - slot_5_39_1.y)
                                                slot_5_42_1 = slot_5_38_0 - slot_5_39_1.z

                                                if slot_5_40_1 < 50 and slot_5_41_1 < 50 and slot_5_42_1 > 40 and slot_5_42_1 < 100 then
                                                        slot_5_24_1 = slot_5_36_1
                                                        slot_5_25_1 = slot_5_37_1
                                                        slot_5_26_1 = slot_5_38_0 + (slot_5_12_0 and 6 or 2)
                                                        slot_5_27_0 = true
                                                end
                                        end
                                end

                                if not slot_5_27_0 then
                                        slot_5_34_1 = ffi.cast("float*", slot_5_31_1 + slot_0_1_0.m_vecAbsOrigin)[0]
                                        slot_5_35_1 = ffi.cast("float*", slot_5_31_1 + slot_0_1_0.m_vecAbsOrigin + 4)[0]
                                        slot_5_36_0 = ffi.cast("float*", slot_5_31_1 + slot_0_1_0.m_vecAbsOrigin + 8)[0]

                                        if slot_5_34_1 and slot_5_35_1 and slot_5_36_0 and slot_5_36_0 > 0 then
                                                slot_5_37_0 = slot_5_9_0:get_view_offset()

                                                if slot_5_37_0 then
                                                        slot_5_24_1 = slot_5_34_1
                                                        slot_5_25_1 = slot_5_35_1
                                                        slot_5_26_1 = slot_5_36_0 + slot_5_37_0.z + (slot_5_12_0 and 6 or 0)
                                                        slot_5_27_0 = true
                                                end
                                        end
                                end
                        end
                end
        end

        if not slot_5_27_0 then
                slot_5_28_2 = slot_5_9_0:get_eye_pos()

                if slot_5_28_2 then
                        slot_5_24_1 = slot_5_28_2.x
                        slot_5_25_1 = slot_5_28_2.y
                        slot_5_26_1 = slot_5_28_2.z + (slot_5_12_0 and 6 or 2)
                        slot_5_27_0 = true
                end
        end

        if not slot_5_27_0 then
                slot_5_28_1 = slot_5_9_0:get_abs_origin()
                slot_5_29_1 = slot_5_9_0:get_view_offset()

                if slot_5_28_1 and slot_5_29_1 then
                        slot_5_24_1 = slot_5_28_1.x
                        slot_5_25_1 = slot_5_28_1.y
                        slot_5_26_1 = slot_5_28_1.z + slot_5_29_1.z + (slot_5_12_0 and 8 or 0)
                end
        end

        if not slot_5_24_1 or not slot_5_25_1 or not slot_5_26_1 then
                return
        end

        slot_5_24_0 = slot_5_24_1 + slot_5_21_0
        slot_5_25_0 = slot_5_25_1 + slot_5_22_0
        slot_5_26_0 = slot_5_26_1 + slot_5_23_0
        slot_5_28_0 = slot_5_12_0 and 9 or 10
        slot_5_29_0 = slot_5_19_0 >= 3 and slot_5_19_0 or slot_5_28_0
        slot_5_30_0 = slot_5_20_0

        if slot_5_12_0 and slot_5_30_0 > 0 then
                slot_5_26_0 = slot_5_26_0 + slot_5_30_0
        end

        function slot_5_31_0(arg_6_0, arg_6_1, arg_6_2)
                local var_6_0
                local var_6_1
                local var_6_2
                local var_6_3 = math.floor(arg_6_0 * 6)
                local var_6_4 = arg_6_0 * 6 - var_6_3
                local var_6_5 = arg_6_2 * (1 - arg_6_1)
                local var_6_6 = arg_6_2 * (1 - var_6_4 * arg_6_1)
                local var_6_7 = arg_6_2 * (1 - (1 - var_6_4) * arg_6_1)
                local var_6_8 = var_6_3 % 6

                if var_6_8 == 0 then
                        var_6_0, var_6_1, var_6_2 = arg_6_2, var_6_7, var_6_5
                elseif var_6_8 == 1 then
                        var_6_0, var_6_1, var_6_2 = var_6_6, arg_6_2, var_6_5
                elseif var_6_8 == 2 then
                        var_6_0, var_6_1, var_6_2 = var_6_5, arg_6_2, var_6_7
                elseif var_6_8 == 3 then
                        var_6_0, var_6_1, var_6_2 = var_6_5, var_6_6, arg_6_2
                elseif var_6_8 == 4 then
                        var_6_0, var_6_1, var_6_2 = var_6_7, var_6_5, arg_6_2
                elseif var_6_8 == 5 then
                        var_6_0, var_6_1, var_6_2 = arg_6_2, var_6_5, var_6_6
                end

                return var_6_0, var_6_1, var_6_2
        end

        slot_5_32_0 = slot_0_6_0.hat_color_mode:get_value():get():get_raw() == 2

        function slot_5_33_0(arg_7_0)
                local var_7_0
                local var_7_1
                local var_7_2

                if slot_5_32_0 then
                        if arg_7_0 < 0.5 then
                                local var_7_3 = arg_7_0 * 2

                                var_7_0 = math.floor(slot_5_15_0:get_r() + (slot_5_16_0:get_r() - slot_5_15_0:get_r()) * var_7_3)
                                var_7_1 = math.floor(slot_5_15_0:get_g() + (slot_5_16_0:get_g() - slot_5_15_0:get_g()) * var_7_3)
                                var_7_2 = math.floor(slot_5_15_0:get_b() + (slot_5_16_0:get_b() - slot_5_15_0:get_b()) * var_7_3)
                        else
                                local var_7_4 = (arg_7_0 - 0.5) * 2

                                var_7_0 = math.floor(slot_5_16_0:get_r() + (slot_5_17_0:get_r() - slot_5_16_0:get_r()) * var_7_4)
                                var_7_1 = math.floor(slot_5_16_0:get_g() + (slot_5_17_0:get_g() - slot_5_16_0:get_g()) * var_7_4)
                                var_7_2 = math.floor(slot_5_16_0:get_b() + (slot_5_17_0:get_b() - slot_5_16_0:get_b()) * var_7_4)
                        end
                else
                        var_7_0 = math.floor(slot_5_15_0:get_r() + (slot_5_16_0:get_r() - slot_5_15_0:get_r()) * arg_7_0)
                        var_7_1 = math.floor(slot_5_15_0:get_g() + (slot_5_16_0:get_g() - slot_5_15_0:get_g()) * arg_7_0)
                        var_7_2 = math.floor(slot_5_15_0:get_b() + (slot_5_16_0:get_b() - slot_5_15_0:get_b()) * arg_7_0)
                end

                return var_7_0, var_7_1, var_7_2
        end

        slot_5_34_0 = game.global_vars.real_time
        slot_5_35_0 = nil

        for iter_5_0 = 0, 360, 5 do
                slot_5_40_0 = math.rad(iter_5_0)
                slot_5_41_0 = slot_5_24_0 + math.cos(slot_5_40_0) * slot_5_29_0
                slot_5_42_0 = slot_5_25_0 + math.sin(slot_5_40_0) * slot_5_29_0
                slot_5_43_0 = slot_5_26_0
                slot_5_44_0 = nil
                slot_5_45_0 = nil
                slot_5_46_0 = nil
                slot_5_47_0 = iter_5_0 / 360

                if slot_5_13_0 then
                        slot_5_48_2 = (slot_5_34_0 * (slot_5_14_0 * 50) + iter_5_0) % 360
                        slot_5_48_1 = math.min(360, math.max(0, slot_5_48_2))
                        slot_5_44_0, slot_5_45_0, slot_5_46_0 = slot_5_31_0(slot_5_48_1 / 360, 1, 1)
                        slot_5_44_0, slot_5_45_0, slot_5_46_0 = math.floor(slot_5_44_0 * 255), math.floor(slot_5_45_0 * 255), math.floor(slot_5_46_0 * 255)
                else
                        slot_5_44_0, slot_5_45_0, slot_5_46_0 = slot_5_33_0(slot_5_47_0)
                end

                if slot_5_35_0 then
                        slot_5_48_0 = math.world_to_screen(vector(slot_5_35_0.x, slot_5_35_0.y, slot_5_35_0.z))
                        slot_5_49_0 = math.world_to_screen(vector(slot_5_41_0, slot_5_42_0, slot_5_43_0))

                        if slot_5_48_0 and slot_5_49_0 then
                                if slot_5_11_0 then
                                        slot_5_50_0 = math.world_to_screen(vector(slot_5_24_0, slot_5_25_0, slot_5_26_0 + slot_5_30_0))

                                        if slot_5_50_0 then
                                                slot_5_0_0:add_triangle_filled(draw.vec2(slot_5_48_0.x, slot_5_48_0.y), draw.vec2(slot_5_49_0.x, slot_5_49_0.y), draw.vec2(slot_5_50_0.x, slot_5_50_0.y), draw.color(slot_5_44_0, slot_5_45_0, slot_5_46_0, math.floor(slot_5_18_0 * 0.2)))
                                        end
                                end

                                slot_5_0_0:add_line(draw.vec2(slot_5_48_0.x, slot_5_48_0.y), draw.vec2(slot_5_49_0.x, slot_5_49_0.y), draw.color(slot_5_44_0, slot_5_45_0, slot_5_46_0, slot_5_18_0), slot_5_12_0 and 3 or 1)
                        end
                end

                slot_5_35_0 = {
                        x = slot_5_41_0,
                        y = slot_5_42_0,
                        z = slot_5_43_0
                }
        end
end)
