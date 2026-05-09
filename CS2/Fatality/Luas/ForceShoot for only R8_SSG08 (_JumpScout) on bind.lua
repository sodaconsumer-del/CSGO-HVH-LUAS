--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function slot_0_0_0(arg_1_0, arg_1_1)
        local var_1_0 = 0
        local var_1_1 = 1

        while arg_1_0 > 0 and arg_1_1 > 0 do
                if arg_1_0 % 2 == 1 and arg_1_1 % 2 == 1 then
                        var_1_0 = var_1_0 + var_1_1
                end

                var_1_1 = var_1_1 * 2
                arg_1_0 = math.floor(arg_1_0 / 2)
                arg_1_1 = math.floor(arg_1_1 / 2)
        end

        return var_1_0
end

function slot_0_1_0(arg_2_0, arg_2_1)
        local var_2_0 = 0
        local var_2_1 = 1

        for iter_2_0 = 0, 31 do
                local var_2_2 = arg_2_0 % 2
                local var_2_3 = arg_2_1 % 2

                if var_2_2 + var_2_3 > 0 then
                        var_2_0 = var_2_0 + var_2_1
                end

                arg_2_0 = (arg_2_0 - var_2_2) / 2
                arg_2_1 = (arg_2_1 - var_2_3) / 2
                var_2_1 = var_2_1 * 2
        end

        return var_2_0
end

function slot_0_2_0(arg_3_0)
        return 4294967295 - arg_3_0 % 4294967296
end

slot_0_3_0 = false
slot_0_4_0 = nil
slot_0_5_0 = nil
slot_0_6_0 = nil
slot_0_7_0 = nil
slot_0_8_0 = nil
slot_0_9_0 = nil
slot_0_10_0 = nil
slot_0_11_0 = nil
slot_0_12_0 = nil
slot_0_13_0 = nil
slot_0_14_0 = nil
slot_0_15_0 = nil
slot_0_16_0 = nil
slot_0_17_0 = nil
slot_0_18_0 = nil
slot_0_19_0 = nil
slot_0_20_0 = nil
slot_0_21_0 = nil
slot_0_22_0 = {
        revolver = 64,
        ssg08 = 40
}

function slot_0_23_0()
        if gui.ctx and gui.ctx.find then
                local var_4_0 = gui.ctx:find("lua>elements a")

                if var_4_0 then
                        slot_0_4_0 = gui.slider(gui.control_id("hc_slider"), 0, 100, {
                                "%.0f"
                        })
                        slot_0_5_0 = gui.slider(gui.control_id("ps_slider"), 0, 100, {
                                "%.0f"
                        })
                        slot_0_6_0 = gui.checkbox(gui.control_id("autozoom_checkbox"))
                        slot_0_7_0 = gui.checkbox(gui.control_id("enable_force_shoot_checkbox"))
                        slot_0_8_0 = gui.checkbox(gui.control_id("enable_hitchance_checkbox"))
                        slot_0_9_0 = gui.checkbox(gui.control_id("enable_pointscale_checkbox"))
                        slot_0_11_0 = gui.make_control("In Air Hitchance", slot_0_4_0)
                        slot_0_12_0 = gui.make_control("In Air Pointscale", slot_0_5_0)
                        slot_0_13_0 = gui.make_control("In Air Auto-Scope", slot_0_6_0)
                        slot_0_14_0 = gui.make_control("In Air Force Shoot", slot_0_7_0)
                        slot_0_15_0 = gui.make_control("Enable Hitchance", slot_0_8_0)
                        slot_0_16_0 = gui.make_control("Enable Pointscale", slot_0_9_0)
                        slot_0_10_0 = gui.checkbox(gui.control_id("force_shoot_checkbox_revolver"))
                        slot_0_17_0 = gui.make_control("Force Shoot (Revolver)", slot_0_10_0)

                        var_4_0:add(slot_0_11_0)
                        var_4_0:add(slot_0_12_0)
                        var_4_0:add(slot_0_13_0)
                        var_4_0:add(slot_0_14_0)
                        var_4_0:add(slot_0_15_0)
                        var_4_0:add(slot_0_16_0)
                        var_4_0:add(slot_0_17_0)
                        var_4_0:reset()
                        print("[INFO] GUI initialized with Jump Scout and Force Shoot (Revolver) controls")

                        slot_0_3_0 = true
                else
                        print("[WARN] GUI group 'lua>elements a' not found")
                end
        else
                print("[WARN] gui.ctx or gui.ctx.find not available yet")
        end
end

events.present_queue:add(function()
        if not slot_0_3_0 then
                slot_0_23_0()
        end
end)

slot_0_24_0 = 4
slot_0_25_0 = 16
slot_0_26_0 = -1
slot_0_27_0 = 78
slot_0_28_0 = 78
slot_0_29_0 = nil
slot_0_30_0 = false
slot_0_31_0 = false
slot_0_32_0 = false
slot_0_33_0 = false
slot_0_34_0 = nil

function slot_0_35_0(arg_6_0, arg_6_1)
        return arg_6_0 and type(arg_6_0.get_id) == "function" and arg_6_0:get_id() == arg_6_1
end

events.create_move:add(function(arg_7_0)
        if not slot_0_3_0 then
                return
        end

        if not slot_0_18_0 then
                slot_0_18_0 = gui.ctx:find("rage>weapon>SSG-08>extra>autostop>settings>mode")
        end

        if not slot_0_19_0 then
                slot_0_19_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")
        end

        if not slot_0_20_0 then
                slot_0_20_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")
        end

        if not slot_0_21_0 then
                slot_0_21_0 = gui.ctx:find("rage>aimbot>general>force shoot")
        end

        if not slot_0_18_0 or not slot_0_19_0 or not slot_0_20_0 or not slot_0_21_0 then
                return
        end

        slot_7_1_0 = entities.get_local_pawn()

        if not slot_7_1_0 or not slot_7_1_0:is_alive() then
                if slot_0_32_0 then
                        slot_0_21_0:set_value(false)

                        slot_0_32_0 = false
                end

                slot_0_30_0 = false
                slot_0_33_0 = false

                return
        end

        slot_7_2_0 = slot_7_1_0:get_active_weapon()

        if not slot_7_2_0 then
                if slot_0_32_0 then
                        slot_0_21_0:set_value(false)

                        slot_0_32_0 = false
                end

                slot_0_30_0 = false
                slot_0_33_0 = false

                return
        end

        slot_7_3_0 = slot_0_10_0:get_value():get()
        slot_7_4_0 = slot_0_35_0(slot_7_2_0, slot_0_22_0.ssg08)
        slot_7_5_0 = slot_0_35_0(slot_7_2_0, slot_0_22_0.revolver)
        slot_7_6_0 = slot_7_3_0 and slot_7_5_0
        slot_7_7_0 = slot_0_0_0(slot_7_1_0.m_fFlags:get(), 1) ~= 0
        slot_7_8_0 = slot_7_1_0:get_abs_velocity()
        slot_7_9_0 = math.abs(slot_7_8_0.z) < 130

        if slot_7_4_0 then
                slot_7_10_0 = slot_0_18_0:get_value()
                slot_7_11_0 = slot_0_19_0:get_value()
                slot_7_12_0 = slot_0_20_0:get_value()
                slot_7_13_0 = slot_7_10_0:get()

                if slot_7_7_0 then
                        if slot_0_30_0 then
                                if slot_0_26_0 >= 0 then
                                        slot_7_13_0:set_raw(slot_0_26_0)
                                        slot_7_10_0:set(slot_7_13_0)
                                end

                                if slot_0_27_0 >= 0 and slot_0_8_0:get_value():get() then
                                        slot_7_11_0:set(slot_0_27_0)
                                end

                                if slot_0_28_0 >= 0 and slot_0_9_0:get_value():get() then
                                        slot_7_12_0:set(slot_0_28_0)
                                end

                                if slot_0_29_0 ~= nil then
                                        slot_0_21_0:set_value(slot_0_29_0)
                                end

                                slot_0_26_0, slot_0_27_0, slot_0_28_0 = -1, 78, 78
                                slot_0_29_0 = nil
                                slot_0_30_0 = false
                        end
                else
                        if slot_0_6_0:get_value():get() and slot_7_2_0.m_zoomLevel:get() < 1 then
                                arg_7_0:set_button(input_bit_mask.in_attack2)
                        end

                        if not slot_0_30_0 then
                                slot_0_30_0 = true
                                slot_0_26_0 = slot_7_13_0:get_raw()
                                slot_0_27_0 = 78
                                slot_0_28_0 = 78
                                slot_0_29_0 = slot_0_21_0:get_value():get()
                        end

                        if slot_0_8_0:get_value():get() then
                                slot_7_14_2 = slot_0_4_0:get_value():get()

                                slot_7_11_0:set(slot_7_14_2)
                        end

                        if slot_0_9_0:get_value():get() then
                                slot_7_14_1 = slot_0_5_0:get_value():get()

                                slot_7_12_0:set(slot_7_14_1)
                        end

                        slot_7_14_0 = slot_0_1_0(slot_0_26_0, slot_0_25_0)

                        if slot_7_9_0 then
                                slot_7_14_0 = slot_0_1_0(slot_7_14_0, slot_0_24_0)
                        else
                                slot_7_14_0 = slot_0_0_0(slot_7_14_0, slot_0_2_0(slot_0_24_0))
                        end

                        slot_7_13_0:set_raw(slot_7_14_0)
                        slot_7_10_0:set(slot_7_13_0)

                        if slot_0_7_0:get_value():get() and slot_7_9_0 then
                                slot_0_21_0:set_value(true)
                        elseif slot_0_7_0:get_value():get() then
                                slot_0_21_0:set_value(false)
                        end
                end
        end

        if slot_7_5_0 and slot_7_3_0 then
                if slot_7_7_0 then
                        if slot_0_33_0 then
                                if slot_0_34_0 ~= nil then
                                        slot_0_21_0:set_value(slot_0_34_0)
                                end

                                slot_0_33_0 = false
                                slot_0_34_0 = nil
                        end
                else
                        if not slot_0_33_0 then
                                slot_0_33_0 = true
                                slot_0_34_0 = slot_0_21_0:get_value():get()
                        end

                        if slot_7_9_0 then
                                slot_0_21_0:set_value(true)

                                if arg_7_0 and arg_7_0.buttons then
                                        arg_7_0.buttons = bit.bor(arg_7_0.buttons, 1)
                                end
                        else
                                slot_0_21_0:set_value(false)
                        end
                end

                slot_7_6_0 = true
        end

        if slot_0_32_0 and not slot_7_6_0 then
                slot_0_21_0:set_value(false)
        elseif slot_0_32_0 and slot_0_31_0 and not slot_7_3_0 then
                slot_0_21_0:set_value(false)
        end

        slot_0_31_0 = slot_7_3_0
        slot_0_32_0 = slot_7_6_0
end)
